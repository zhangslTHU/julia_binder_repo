using DataFrames
using CSV
using Plots

data = CSV.read("gapminder.csv", DataFrame)

# Extract the row corresponding to Australia
aus_gdp = data[data[:, :country] .== "Australia", :]
aus_gdp = Matrix(aus_gdp[:,2:end])[:]  # as vector

# Extract the years as Ints from the column names
years = [x[end-3:end] for x in names(data)[2:end]]
years = parse.(Int, years)

# Plot
plot(years, aus_gdp)

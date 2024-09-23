@implementation MOWeather

- (MOWeather)initWithStartDate:(id)a3 endDate:(id)a4 temperature:(id)a5 weatherSummary:(id)a6 weatherSymbolName:(id)a7 windSpeed:(id)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  MOWeather *v22;

  v14 = (void *)MEMORY[0x1E0CB3A28];
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  objc_msgSend(v14, "UUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[MOWeather initWithWeatherIdentifier:startDate:endDate:weatherSummary:weatherSymbolName:temperature:windSpeed:](self, "initWithWeatherIdentifier:startDate:endDate:weatherSummary:weatherSymbolName:temperature:windSpeed:", v21, v20, v19, v17, v16, v18, v15);

  return v22;
}

- (MOWeather)initWithWeatherIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 weatherSummary:(id)a6 weatherSymbolName:(id)a7
{
  return -[MOWeather initWithWeatherIdentifier:startDate:endDate:weatherSummary:weatherSymbolName:temperature:windSpeed:](self, "initWithWeatherIdentifier:startDate:endDate:weatherSummary:weatherSymbolName:temperature:windSpeed:", a3, a4, a5, a6, a7, 0, 0);
}

- (MOWeather)initWithWeatherIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 weatherSummary:(id)a6 weatherSymbolName:(id)a7 temperature:(id)a8 windSpeed:(id)a9
{
  id v16;
  id v17;
  MOWeather *v18;
  MOWeather *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)MOWeather;
  v18 = -[MOWeather init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_weatherIdentifier, a3);
    objc_storeStrong((id *)&v19->_startDate, a4);
    objc_storeStrong((id *)&v19->_endDate, a5);
    objc_storeStrong((id *)&v19->_weatherSummary, a6);
    objc_storeStrong((id *)&v19->_weatherSymbolName, a7);
    objc_storeStrong((id *)&v19->_temperature, a8);
    objc_storeStrong((id *)&v19->_windSpeed, a9);
    v19->_sourceEventAccessType = 5;
  }

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MOWeather weatherIdentifier](self, "weatherIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOWeather startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOWeather endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOWeather weatherSummary](self, "weatherSummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOWeather weatherSymbolName](self, "weatherSymbolName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOWeather temperature](self, "temperature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOWeather windSpeed](self, "windSpeed");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<MOWeather identifier, %@, startDate, %@, endDate, %@, weatherSummary, %@, weatherSymbolName, %@, temperature, %@, windSpeed %@>"), v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *weatherIdentifier;
  id v5;

  weatherIdentifier = self->_weatherIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", weatherIdentifier, CFSTR("weatherIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_weatherSummary, CFSTR("weatherSummary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_weatherSymbolName, CFSTR("weatherSymbolName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_temperature, CFSTR("temperature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_windSpeed, CFSTR("windSpeed"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_sourceEventAccessType, CFSTR("sourceEventAccessType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceEventIdentifier, CFSTR("sourceEventIdentifier"));

}

- (MOWeather)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MOWeather *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("weatherIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("weatherSummary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("weatherSymbolName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("temperature"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("windSpeed"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MOWeather initWithWeatherIdentifier:startDate:endDate:weatherSummary:weatherSymbolName:temperature:windSpeed:](self, "initWithWeatherIdentifier:startDate:endDate:weatherSummary:weatherSymbolName:temperature:windSpeed:", v5, v6, v7, v8, v9, v10, v11);
  if (v12)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceEventIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOWeather setSourceEventIdentifier:](v12, "setSourceEventIdentifier:", v13);

    -[MOWeather setSourceEventAccessType:](v12, "setSourceEventAccessType:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sourceEventAccessType")));
  }

  return v12;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MOWeather weatherIdentifier](self, "weatherIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  MOWeather *v5;
  MOWeather *v6;
  MOWeather *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = (MOWeather *)a3;
  v6 = v5;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        -[MOWeather weatherIdentifier](self, "weatherIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8
          || (-[MOWeather weatherIdentifier](v7, "weatherIdentifier"),
              (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[MOWeather weatherIdentifier](self, "weatherIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[MOWeather weatherIdentifier](v7, "weatherIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10);

          if (v8)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          v11 = 1;
        }

        goto LABEL_12;
      }
    }
    v11 = 0;
  }
LABEL_13:

  return v11;
}

- (NSUUID)weatherIdentifier
{
  return self->_weatherIdentifier;
}

- (void)setWeatherIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_weatherIdentifier, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSString)weatherSummary
{
  return self->_weatherSummary;
}

- (void)setWeatherSummary:(id)a3
{
  objc_storeStrong((id *)&self->_weatherSummary, a3);
}

- (NSString)weatherSymbolName
{
  return self->_weatherSymbolName;
}

- (void)setWeatherSymbolName:(id)a3
{
  objc_storeStrong((id *)&self->_weatherSymbolName, a3);
}

- (NSMeasurement)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(id)a3
{
  objc_storeStrong((id *)&self->_temperature, a3);
}

- (NSMeasurement)windSpeed
{
  return self->_windSpeed;
}

- (void)setWindSpeed:(id)a3
{
  objc_storeStrong((id *)&self->_windSpeed, a3);
}

- (int64_t)sourceEventAccessType
{
  return self->_sourceEventAccessType;
}

- (void)setSourceEventAccessType:(int64_t)a3
{
  self->_sourceEventAccessType = a3;
}

- (NSUUID)sourceEventIdentifier
{
  return self->_sourceEventIdentifier;
}

- (void)setSourceEventIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceEventIdentifier, 0);
  objc_storeStrong((id *)&self->_windSpeed, 0);
  objc_storeStrong((id *)&self->_temperature, 0);
  objc_storeStrong((id *)&self->_weatherSymbolName, 0);
  objc_storeStrong((id *)&self->_weatherSummary, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_weatherIdentifier, 0);
}

@end

@implementation WFWeatherAirQualityPollutant

- (WFWeatherAirQualityPollutant)initWithLocalizedName:(id)a3 localizedDescription:(id)a4 concentration:(id)a5
{
  id v8;
  id v9;
  id v10;
  WFWeatherAirQualityPollutant *v11;
  WFWeatherAirQualityPollutant *v12;
  uint64_t v13;
  NSString *localizedName;
  uint64_t v15;
  NSString *localizedDescription;
  WFWeatherAirQualityPollutant *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)WFWeatherAirQualityPollutant;
  v11 = -[WFWeatherAirQualityPollutant init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_concentration, a5);
    v13 = objc_msgSend(v8, "copy");
    localizedName = v12->_localizedName;
    v12->_localizedName = (NSString *)v13;

    v15 = objc_msgSend(v9, "copy");
    localizedDescription = v12->_localizedDescription;
    v12->_localizedDescription = (NSString *)v15;

    v17 = v12;
  }

  return v12;
}

- (WFWeatherAirQualityPollutant)initWithCoder:(id)a3
{
  id v4;
  WFWeatherAirQualityPollutant *v5;
  uint64_t v6;
  NSString *localizedName;
  uint64_t v8;
  NSString *localizedDescription;
  uint64_t v10;
  NSMeasurement *concentration;
  WFWeatherAirQualityPollutant *v12;

  v4 = a3;
  v5 = -[WFWeatherAirQualityPollutant init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedName"));
    v6 = objc_claimAutoreleasedReturnValue();
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedDescription"));
    v8 = objc_claimAutoreleasedReturnValue();
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("concentration"));
    v10 = objc_claimAutoreleasedReturnValue();
    concentration = v5->_concentration;
    v5->_concentration = (NSMeasurement *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *localizedName;
  id v5;

  localizedName = self->_localizedName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", localizedName, CFSTR("localizedName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedDescription, CFSTR("localizedDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_concentration, CFSTR("concentration"));

}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (NSMeasurement)concentration
{
  return self->_concentration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concentration, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

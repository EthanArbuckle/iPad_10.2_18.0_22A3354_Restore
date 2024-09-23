@implementation AFPersonalUserSettings

- (void)encodeWithCoder:(id)a3
{
  NSString *temperatureUnit;
  id v5;

  temperatureUnit = self->_temperatureUnit;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", temperatureUnit, CFSTR("_temperatureUnit"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_twentyFourHourTimeDisplay, CFSTR("_twentyFourHourTimeDisplay"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_region, CFSTR("_region"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_countryCode, CFSTR("_countryCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preferredLanguage, CFSTR("_preferredLanguage"));

}

- (AFPersonalUserSettings)initWithCoder:(id)a3
{
  id v4;
  AFPersonalUserSettings *v5;
  uint64_t v6;
  NSString *temperatureUnit;
  uint64_t v8;
  NSString *region;
  uint64_t v10;
  NSString *countryCode;
  uint64_t v12;
  NSString *preferredLanguage;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AFPersonalUserSettings;
  v5 = -[AFPersonalUserSettings init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_temperatureUnit"));
    v6 = objc_claimAutoreleasedReturnValue();
    temperatureUnit = v5->_temperatureUnit;
    v5->_temperatureUnit = (NSString *)v6;

    v5->_twentyFourHourTimeDisplay = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_twentyFourHourTimeDisplay"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_region"));
    v8 = objc_claimAutoreleasedReturnValue();
    region = v5->_region;
    v5->_region = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_countryCode"));
    v10 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_preferredLanguage"));
    v12 = objc_claimAutoreleasedReturnValue();
    preferredLanguage = v5->_preferredLanguage;
    v5->_preferredLanguage = (NSString *)v12;

  }
  return v5;
}

- (NSString)temperatureUnit
{
  return self->_temperatureUnit;
}

- (void)setTemperatureUnit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)twentyFourHourTimeDisplay
{
  return self->_twentyFourHourTimeDisplay;
}

- (void)setTwentyFourHourTimeDisplay:(BOOL)a3
{
  self->_twentyFourHourTimeDisplay = a3;
}

- (NSString)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)preferredLanguage
{
  return self->_preferredLanguage;
}

- (void)setPreferredLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredLanguage, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_temperatureUnit, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

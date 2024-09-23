@implementation SPWeatherComplicationData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SPWeatherComplicationData;
  v4 = a3;
  -[SPComplicationData encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_temperatureText, CFSTR("_TemperatureTextKey"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_locationText, CFSTR("_LocationTextKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_currentConditionsText, CFSTR("_CurrentConditionsTextKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_currentConditionsEnum, CFSTR("_CurrentConditionsEnumKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_highLowText, CFSTR("_HighLowTextKey"));

}

- (SPWeatherComplicationData)initWithCoder:(id)a3
{
  id v4;
  SPWeatherComplicationData *v5;
  uint64_t v6;
  NSString *temperatureText;
  uint64_t v8;
  NSString *locationText;
  uint64_t v10;
  NSString *currentConditionsText;
  uint64_t v12;
  NSString *highLowText;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SPWeatherComplicationData;
  v5 = -[SPComplicationData initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_TemperatureTextKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    temperatureText = v5->_temperatureText;
    v5->_temperatureText = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_LocationTextKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    locationText = v5->_locationText;
    v5->_locationText = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_CurrentConditionsTextKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    currentConditionsText = v5->_currentConditionsText;
    v5->_currentConditionsText = (NSString *)v10;

    v5->_currentConditionsEnum = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_CurrentConditionsEnumKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_HighLowTextKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    highLowText = v5->_highLowText;
    v5->_highLowText = (NSString *)v12;

  }
  return v5;
}

- (NSString)temperatureText
{
  return self->_temperatureText;
}

- (void)setTemperatureText:(id)a3
{
  objc_storeStrong((id *)&self->_temperatureText, a3);
}

- (NSString)locationText
{
  return self->_locationText;
}

- (void)setLocationText:(id)a3
{
  objc_storeStrong((id *)&self->_locationText, a3);
}

- (NSString)currentConditionsText
{
  return self->_currentConditionsText;
}

- (void)setCurrentConditionsText:(id)a3
{
  objc_storeStrong((id *)&self->_currentConditionsText, a3);
}

- (int64_t)currentConditionsEnum
{
  return self->_currentConditionsEnum;
}

- (void)setCurrentConditionsEnum:(int64_t)a3
{
  self->_currentConditionsEnum = a3;
}

- (NSString)highLowText
{
  return self->_highLowText;
}

- (void)setHighLowText:(id)a3
{
  objc_storeStrong((id *)&self->_highLowText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highLowText, 0);
  objc_storeStrong((id *)&self->_currentConditionsText, 0);
  objc_storeStrong((id *)&self->_locationText, 0);
  objc_storeStrong((id *)&self->_temperatureText, 0);
}

@end

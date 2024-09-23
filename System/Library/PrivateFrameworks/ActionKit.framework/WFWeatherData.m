@implementation WFWeatherData

- (WFWeatherData)initWithDate:(id)a3 location:(id)a4 userTemperatureUnitString:(id)a5 temperature:(id)a6 highTemperature:(id)a7 lowTemperature:(id)a8 feelsLikeTemperature:(id)a9 localizedConditionString:(id)a10 visibility:(id)a11 dewpoint:(id)a12 humidity:(id)a13 pressure:(id)a14 precipitationAmount:(id)a15 precipitationChance:(id)a16 windSpeed:(id)a17 windDirection:(id)a18 uvIndex:(id)a19 sunriseTime:(id)a20 sunsetTime:(id)a21 localizedAirQualityIndex:(id)a22 localizedAirQualityCategory:(id)a23 pollutants:(id)a24
{
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  WFWeatherData *v37;
  void *v38;
  uint64_t v39;
  CLLocation *location;
  uint64_t v41;
  NSMeasurement *temperature;
  uint64_t v43;
  NSMeasurement *highTemperature;
  uint64_t v45;
  NSMeasurement *lowTemperature;
  uint64_t v47;
  NSMeasurement *feelsLikeTemperature;
  id v49;
  id v50;
  id v51;
  void *v52;
  uint64_t v53;
  NSMeasurement *visibility;
  uint64_t v55;
  NSMeasurement *dewpoint;
  uint64_t v57;
  NSNumber *humidity;
  void *v59;
  uint64_t v60;
  NSMeasurement *pressure;
  void *v62;
  uint64_t v63;
  NSMeasurement *precipitationAmount;
  uint64_t v65;
  NSNumber *precipitationChance;
  void *v67;
  uint64_t v68;
  NSMeasurement *windSpeed;
  uint64_t v70;
  NSNumber *windDirection;
  uint64_t v72;
  NSNumber *uvIndex;
  WFWeatherData *v74;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  objc_super v93;

  v79 = a3;
  v88 = a4;
  v82 = a5;
  v92 = a6;
  v91 = a7;
  v90 = a8;
  v89 = a9;
  v29 = a10;
  v87 = a11;
  v86 = a12;
  v85 = a13;
  v84 = a14;
  v83 = a15;
  v81 = a16;
  v80 = a17;
  v30 = a18;
  v31 = a19;
  v32 = a20;
  v33 = a21;
  v34 = a22;
  v35 = a23;
  v36 = a24;
  v93.receiver = self;
  v93.super_class = (Class)WFWeatherData;
  v37 = -[WFWeatherData init](&v93, sel_init);
  if (v37)
  {
    +[WFWeatherData userTemperatureUnitString:](WFWeatherData, "userTemperatureUnitString:", v82);
    v78 = v33;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v37->_date, a3);
    v39 = objc_msgSend(v88, "copy");
    location = v37->_location;
    v37->_location = (CLLocation *)v39;

    objc_msgSend(v92, "measurementByConvertingToUnit:", v38);
    v41 = objc_claimAutoreleasedReturnValue();
    temperature = v37->_temperature;
    v37->_temperature = (NSMeasurement *)v41;

    objc_msgSend(v91, "measurementByConvertingToUnit:", v38);
    v43 = objc_claimAutoreleasedReturnValue();
    highTemperature = v37->_highTemperature;
    v37->_highTemperature = (NSMeasurement *)v43;

    objc_msgSend(v90, "measurementByConvertingToUnit:", v38);
    v45 = objc_claimAutoreleasedReturnValue();
    lowTemperature = v37->_lowTemperature;
    v37->_lowTemperature = (NSMeasurement *)v45;

    objc_msgSend(v89, "measurementByConvertingToUnit:", v38);
    v47 = objc_claimAutoreleasedReturnValue();
    feelsLikeTemperature = v37->_feelsLikeTemperature;
    v37->_feelsLikeTemperature = (NSMeasurement *)v47;

    objc_storeStrong((id *)&v37->_localizedConditionString, a10);
    +[WFWeatherData visibilityUnit](WFWeatherData, "visibilityUnit");
    v49 = v36;
    v50 = v35;
    v51 = v32;
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "measurementByConvertingToUnit:", v52);
    v53 = objc_claimAutoreleasedReturnValue();
    visibility = v37->_visibility;
    v37->_visibility = (NSMeasurement *)v53;

    objc_msgSend(v86, "measurementByConvertingToUnit:", v38);
    v55 = objc_claimAutoreleasedReturnValue();
    dewpoint = v37->_dewpoint;
    v37->_dewpoint = (NSMeasurement *)v55;

    v57 = objc_msgSend(v85, "copy");
    humidity = v37->_humidity;
    v37->_humidity = (NSNumber *)v57;

    +[WFWeatherData pressureUnit](WFWeatherData, "pressureUnit");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "measurementByConvertingToUnit:", v59);
    v60 = objc_claimAutoreleasedReturnValue();
    pressure = v37->_pressure;
    v37->_pressure = (NSMeasurement *)v60;

    +[WFWeatherData precipitationAmountUnit](WFWeatherData, "precipitationAmountUnit");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "measurementByConvertingToUnit:", v62);
    v63 = objc_claimAutoreleasedReturnValue();
    precipitationAmount = v37->_precipitationAmount;
    v37->_precipitationAmount = (NSMeasurement *)v63;

    v65 = objc_msgSend(v81, "copy");
    precipitationChance = v37->_precipitationChance;
    v37->_precipitationChance = (NSNumber *)v65;

    +[WFWeatherData windSpeedUnit](WFWeatherData, "windSpeedUnit");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "measurementByConvertingToUnit:", v67);
    v68 = objc_claimAutoreleasedReturnValue();
    windSpeed = v37->_windSpeed;
    v37->_windSpeed = (NSMeasurement *)v68;

    v32 = v51;
    v35 = v50;
    v36 = v49;
    v70 = objc_msgSend(v30, "copy");
    windDirection = v37->_windDirection;
    v37->_windDirection = (NSNumber *)v70;

    v72 = objc_msgSend(v31, "copy");
    uvIndex = v37->_uvIndex;
    v37->_uvIndex = (NSNumber *)v72;

    objc_storeStrong((id *)&v37->_sunriseTime, a20);
    objc_storeStrong((id *)&v37->_sunsetTime, a21);
    objc_storeStrong((id *)&v37->_localizedAirQualityIndex, a22);
    objc_storeStrong((id *)&v37->_localizedAirQualityCategory, a23);
    objc_storeStrong((id *)&v37->_pollutants, a24);
    v74 = v37;

    v33 = v78;
  }

  return v37;
}

- (id)temperatureString
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFWeatherData temperature](self, "temperature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDD1668]);
    objc_msgSend(v3, "setUnitOptions:", 1);
    objc_msgSend(v3, "numberFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRoundingMode:", 5);

    objc_msgSend(v3, "numberFormatter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMaximumFractionDigits:", 0);

    objc_msgSend(v3, "stringFromMeasurement:", v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)wfName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[WFWeatherData temperatureString](self, "temperatureString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWeatherData localizedConditionString](self, "localizedConditionString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 && v4)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("%1$@ and %2$@"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v7, v3, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v3)
    {
      v9 = v3;
    }
    else
    {
      if (!v4)
      {
        v8 = 0;
        goto LABEL_9;
      }
      v9 = v4;
    }
    v8 = v9;
  }
LABEL_9:

  return (NSString *)v8;
}

- (WFWeatherData)initWithCoder:(id)a3
{
  id v4;
  WFWeatherData *v5;
  uint64_t v6;
  NSDate *date;
  void *v8;
  id v9;
  uint64_t v10;
  CLLocation *location;
  uint64_t v12;
  NSMeasurement *temperature;
  uint64_t v14;
  NSMeasurement *highTemperature;
  uint64_t v16;
  NSMeasurement *lowTemperature;
  uint64_t v18;
  NSMeasurement *feelsLikeTemperature;
  uint64_t v20;
  NSString *localizedConditionString;
  uint64_t v22;
  NSMeasurement *visibility;
  uint64_t v24;
  NSMeasurement *dewpoint;
  uint64_t v26;
  NSNumber *humidity;
  uint64_t v28;
  NSMeasurement *pressure;
  uint64_t v30;
  NSMeasurement *precipitationAmount;
  uint64_t v32;
  NSNumber *precipitationChance;
  uint64_t v34;
  NSMeasurement *windSpeed;
  uint64_t v36;
  NSNumber *windDirection;
  uint64_t v38;
  NSNumber *uvIndex;
  uint64_t v40;
  NSDate *sunriseTime;
  uint64_t v42;
  NSDate *sunsetTime;
  uint64_t v44;
  NSNumber *localizedAirQualityIndex;
  uint64_t v46;
  NSString *localizedAirQualityCategory;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  NSArray *pollutants;
  WFWeatherData *v53;
  _QWORD v55[5];
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;

  v4 = a3;
  v5 = -[WFWeatherData init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v6 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    v56 = 0;
    v57 = &v56;
    v58 = 0x2050000000;
    v8 = (void *)getCLLocationClass_softClass;
    v59 = getCLLocationClass_softClass;
    if (!getCLLocationClass_softClass)
    {
      v55[0] = MEMORY[0x24BDAC760];
      v55[1] = 3221225472;
      v55[2] = __getCLLocationClass_block_invoke;
      v55[3] = &unk_24F8BB430;
      v55[4] = &v56;
      __getCLLocationClass_block_invoke((uint64_t)v55);
      v8 = (void *)v57[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v56, 8);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("location"));
    v10 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (CLLocation *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("temperature"));
    v12 = objc_claimAutoreleasedReturnValue();
    temperature = v5->_temperature;
    v5->_temperature = (NSMeasurement *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("highTemperature"));
    v14 = objc_claimAutoreleasedReturnValue();
    highTemperature = v5->_highTemperature;
    v5->_highTemperature = (NSMeasurement *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lowTemperature"));
    v16 = objc_claimAutoreleasedReturnValue();
    lowTemperature = v5->_lowTemperature;
    v5->_lowTemperature = (NSMeasurement *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("feelsLikeTemperature"));
    v18 = objc_claimAutoreleasedReturnValue();
    feelsLikeTemperature = v5->_feelsLikeTemperature;
    v5->_feelsLikeTemperature = (NSMeasurement *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedConditionString"));
    v20 = objc_claimAutoreleasedReturnValue();
    localizedConditionString = v5->_localizedConditionString;
    v5->_localizedConditionString = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("visibility"));
    v22 = objc_claimAutoreleasedReturnValue();
    visibility = v5->_visibility;
    v5->_visibility = (NSMeasurement *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dewpoint"));
    v24 = objc_claimAutoreleasedReturnValue();
    dewpoint = v5->_dewpoint;
    v5->_dewpoint = (NSMeasurement *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("humidity"));
    v26 = objc_claimAutoreleasedReturnValue();
    humidity = v5->_humidity;
    v5->_humidity = (NSNumber *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pressure"));
    v28 = objc_claimAutoreleasedReturnValue();
    pressure = v5->_pressure;
    v5->_pressure = (NSMeasurement *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("precipitationAmount"));
    v30 = objc_claimAutoreleasedReturnValue();
    precipitationAmount = v5->_precipitationAmount;
    v5->_precipitationAmount = (NSMeasurement *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("precipitationChance"));
    v32 = objc_claimAutoreleasedReturnValue();
    precipitationChance = v5->_precipitationChance;
    v5->_precipitationChance = (NSNumber *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("windSpeed"));
    v34 = objc_claimAutoreleasedReturnValue();
    windSpeed = v5->_windSpeed;
    v5->_windSpeed = (NSMeasurement *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("windDirection"));
    v36 = objc_claimAutoreleasedReturnValue();
    windDirection = v5->_windDirection;
    v5->_windDirection = (NSNumber *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uvIndex"));
    v38 = objc_claimAutoreleasedReturnValue();
    uvIndex = v5->_uvIndex;
    v5->_uvIndex = (NSNumber *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sunriseTime"));
    v40 = objc_claimAutoreleasedReturnValue();
    sunriseTime = v5->_sunriseTime;
    v5->_sunriseTime = (NSDate *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sunsetTime"));
    v42 = objc_claimAutoreleasedReturnValue();
    sunsetTime = v5->_sunsetTime;
    v5->_sunsetTime = (NSDate *)v42;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedAirQualityIndex"));
    v44 = objc_claimAutoreleasedReturnValue();
    localizedAirQualityIndex = v5->_localizedAirQualityIndex;
    v5->_localizedAirQualityIndex = (NSNumber *)v44;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedAirQualityCategory"));
    v46 = objc_claimAutoreleasedReturnValue();
    localizedAirQualityCategory = v5->_localizedAirQualityCategory;
    v5->_localizedAirQualityCategory = (NSString *)v46;

    v48 = (void *)MEMORY[0x24BDBCF20];
    v49 = objc_opt_class();
    objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v50, CFSTR("pollutants"));
    v51 = objc_claimAutoreleasedReturnValue();
    pollutants = v5->_pollutants;
    v5->_pollutants = (NSArray *)v51;

    v53 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *date;
  id v5;

  date = self->_date;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", date, CFSTR("date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_location, CFSTR("location"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_temperature, CFSTR("temperature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_highTemperature, CFSTR("highTemperature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lowTemperature, CFSTR("lowTemperature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_feelsLikeTemperature, CFSTR("feelsLikeTemperature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedConditionString, CFSTR("localizedConditionString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_visibility, CFSTR("visibility"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dewpoint, CFSTR("dewpoint"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_humidity, CFSTR("humidity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pressure, CFSTR("pressure"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_precipitationAmount, CFSTR("precipitationAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_precipitationChance, CFSTR("precipitationChance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_windSpeed, CFSTR("windSpeed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_windDirection, CFSTR("windDirection"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uvIndex, CFSTR("uvIndex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sunriseTime, CFSTR("sunriseTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sunsetTime, CFSTR("sunsetTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedAirQualityIndex, CFSTR("localizedAirQualityIndex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedAirQualityCategory, CFSTR("localizedAirQualityCategory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pollutants, CFSTR("pollutants"));

}

- (NSDate)date
{
  return self->_date;
}

- (CLLocation)location
{
  return self->_location;
}

- (NSMeasurement)temperature
{
  return self->_temperature;
}

- (NSMeasurement)highTemperature
{
  return self->_highTemperature;
}

- (NSMeasurement)lowTemperature
{
  return self->_lowTemperature;
}

- (NSMeasurement)feelsLikeTemperature
{
  return self->_feelsLikeTemperature;
}

- (NSString)localizedConditionString
{
  return self->_localizedConditionString;
}

- (NSMeasurement)visibility
{
  return self->_visibility;
}

- (NSMeasurement)dewpoint
{
  return self->_dewpoint;
}

- (NSNumber)humidity
{
  return self->_humidity;
}

- (NSMeasurement)pressure
{
  return self->_pressure;
}

- (NSMeasurement)precipitationAmount
{
  return self->_precipitationAmount;
}

- (NSNumber)precipitationChance
{
  return self->_precipitationChance;
}

- (NSMeasurement)windSpeed
{
  return self->_windSpeed;
}

- (NSNumber)windDirection
{
  return self->_windDirection;
}

- (NSNumber)uvIndex
{
  return self->_uvIndex;
}

- (NSDate)sunriseTime
{
  return self->_sunriseTime;
}

- (NSDate)sunsetTime
{
  return self->_sunsetTime;
}

- (NSNumber)localizedAirQualityIndex
{
  return self->_localizedAirQualityIndex;
}

- (NSString)localizedAirQualityCategory
{
  return self->_localizedAirQualityCategory;
}

- (NSArray)pollutants
{
  return self->_pollutants;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pollutants, 0);
  objc_storeStrong((id *)&self->_localizedAirQualityCategory, 0);
  objc_storeStrong((id *)&self->_localizedAirQualityIndex, 0);
  objc_storeStrong((id *)&self->_sunsetTime, 0);
  objc_storeStrong((id *)&self->_sunriseTime, 0);
  objc_storeStrong((id *)&self->_uvIndex, 0);
  objc_storeStrong((id *)&self->_windDirection, 0);
  objc_storeStrong((id *)&self->_windSpeed, 0);
  objc_storeStrong((id *)&self->_precipitationChance, 0);
  objc_storeStrong((id *)&self->_precipitationAmount, 0);
  objc_storeStrong((id *)&self->_pressure, 0);
  objc_storeStrong((id *)&self->_humidity, 0);
  objc_storeStrong((id *)&self->_dewpoint, 0);
  objc_storeStrong((id *)&self->_visibility, 0);
  objc_storeStrong((id *)&self->_localizedConditionString, 0);
  objc_storeStrong((id *)&self->_feelsLikeTemperature, 0);
  objc_storeStrong((id *)&self->_lowTemperature, 0);
  objc_storeStrong((id *)&self->_highTemperature, 0);
  objc_storeStrong((id *)&self->_temperature, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

+ (id)userTemperatureUnitString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDBCB48]);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDBCB50]))
  {
    objc_msgSend(MEMORY[0x24BDD1950], "celsius");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDBCB58]))
      objc_msgSend(MEMORY[0x24BDD1950], "fahrenheit");
    else
      objc_msgSend(MEMORY[0x24BEC1540], "defaultUnitForUnitType:", *MEMORY[0x24BEC1A10]);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

+ (id)visibilityUnit
{
  return (id)objc_msgSend(MEMORY[0x24BEC1540], "defaultUnitForUnitType:", *MEMORY[0x24BEC19E8]);
}

+ (id)pressureUnit
{
  return (id)objc_msgSend(MEMORY[0x24BEC1540], "defaultUnitForUnitType:", *MEMORY[0x24BEC1A00]);
}

+ (id)precipitationAmountUnit
{
  return (id)objc_msgSend(MEMORY[0x24BEC1540], "defaultUnitForUnitType:", *MEMORY[0x24BEC19E8]);
}

+ (id)windSpeedUnit
{
  return (id)objc_msgSend(MEMORY[0x24BEC1540], "defaultUnitForUnitType:", *MEMORY[0x24BEC1A08]);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

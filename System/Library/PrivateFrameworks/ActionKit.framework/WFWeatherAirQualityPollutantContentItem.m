@implementation WFWeatherAirQualityPollutantContentItem

- (id)pollutant
{
  return (id)-[WFWeatherAirQualityPollutantContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)localizedName
{
  void *v2;
  void *v3;

  -[WFWeatherAirQualityPollutantContentItem pollutant](self, "pollutant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localizedDescription
{
  void *v2;
  void *v3;

  -[WFWeatherAirQualityPollutantContentItem pollutant](self, "pollutant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)concentration
{
  void *v2;
  void *v3;

  -[WFWeatherAirQualityPollutantContentItem pollutant](self, "pollutant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "concentration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  if ((Class)objc_opt_class() == a3)
  {
    v8 = (void *)MEMORY[0x24BE19590];
    -[WFWeatherAirQualityPollutantContentItem concentration](self, "concentration");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
LABEL_12:
    objc_msgSend(v10, "object:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  if ((Class)objc_opt_class() == a3)
  {
    -[WFWeatherAirQualityPollutantContentItem localizedName](self, "localizedName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[WFWeatherAirQualityPollutantContentItem localizedDescription](self, "localizedDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x24BDD17C8];
      if (v12)
      {
        WFLocalizedString(CFSTR("%@ - %@: %@"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWeatherAirQualityPollutantContentItem localizedName](self, "localizedName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWeatherAirQualityPollutantContentItem localizedDescription](self, "localizedDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWeatherAirQualityPollutantContentItem formattedConcentration](self, "formattedConcentration");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", v14, v15, v16, v17);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        WFLocalizedString(CFSTR("%@: %@"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWeatherAirQualityPollutantContentItem localizedName](self, "localizedName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWeatherAirQualityPollutantContentItem formattedConcentration](self, "formattedConcentration");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", v14, v15, v16);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v9 = &stru_24F8BBA48;
    }
    v10 = (void *)MEMORY[0x24BE19590];
    goto LABEL_12;
  }
  v7 = 0;
  return v7;
}

- (id)formattedConcentration
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x24BDD1668]);
  objc_msgSend(v3, "setUnitOptions:", 1);
  -[WFWeatherAirQualityPollutantContentItem concentration](self, "concentration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromMeasurement:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BE196E8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFLocalizedStringWithKey(CFSTR("Air Pollutant (Single)"), CFSTR("Air Pollutant"));
}

+ (id)pluralTypeDescription
{
  return WFLocalizedStringWithKey(CFSTR("Air Pollutant (Plural)"), CFSTR("Air Pollutants"));
}

+ (id)propertyBuilders
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
  void *v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  if ((id)objc_opt_class() != a1)
    return 0;
  v3 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyPath:name:class:", CFSTR("localizedName"), v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Description"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyPath:name:class:", CFSTR("localizedDescription"), v7, objc_opt_class(), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  v9 = (void *)MEMORY[0x24BE19490];
  WFLocalizedParameterValue(CFSTR("Concentration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "keyPath:name:class:", CFSTR("concentration"), v10, objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end

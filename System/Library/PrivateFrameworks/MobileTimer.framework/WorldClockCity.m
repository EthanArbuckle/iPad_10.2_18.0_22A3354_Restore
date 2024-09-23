@implementation WorldClockCity

+ (BOOL)isCachedLanguageStaleForProperties:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99DC8];
  v5 = a3;
  objc_msgSend(v4, "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C997E8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a1) = objc_msgSend(a1, "isCachedLanguageStaleForProperties:systemLanguage:", v5, v7);
  return (char)a1;
}

+ (BOOL)isCachedLanguageStaleForProperties:(id)a3 systemLanguage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "isWorldClockCityProperties:", v6))
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("languageCode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = objc_msgSend(v7, "isEqualToString:", v8) ^ 1;
    else
      LOBYTE(v9) = 1;

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

+ (BOOL)isWorldClockCityProperties:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "objectForKey:", CFSTR("type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") == 2 || objc_msgSend(v3, "integerValue") == 1;

  return v4;
}

- (WorldClockCity)initWithProperties:(id)a3
{
  id v4;
  WorldClockCity *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  NSString *timeZone;
  uint64_t v11;
  NSString *countryCode;
  uint64_t v13;
  NSString *name;
  uint64_t v15;
  NSString *countryName;
  uint64_t v17;
  NSString *unlocalizedName;
  uint64_t v19;
  void *alCity;
  uint64_t v21;
  WorldClockCity *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WorldClockCity;
  v5 = -[WorldClockCity init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("city"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "intValue");
    if (v8 == 2)
    {
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFA970]), "initWithProperties:", v7);
      alCity = v5->_alCity;
      v5->_alCity = (ALCity *)v21;
    }
    else
    {
      if (v8 != 1)
      {
LABEL_7:
        v22 = v5;

        goto LABEL_8;
      }
      objc_msgSend(v7, "objectForKey:", CFSTR("timeZone"));
      v9 = objc_claimAutoreleasedReturnValue();
      timeZone = v5->_timeZone;
      v5->_timeZone = (NSString *)v9;

      objc_msgSend(v7, "objectForKey:", CFSTR("countryCode"));
      v11 = objc_claimAutoreleasedReturnValue();
      countryCode = v5->_countryCode;
      v5->_countryCode = (NSString *)v11;

      objc_msgSend(v7, "objectForKey:", CFSTR("name"));
      v13 = objc_claimAutoreleasedReturnValue();
      name = v5->_name;
      v5->_name = (NSString *)v13;

      objc_msgSend(v7, "objectForKey:", CFSTR("countryName"));
      v15 = objc_claimAutoreleasedReturnValue();
      countryName = v5->_countryName;
      v5->_countryName = (NSString *)v15;

      objc_msgSend(v7, "objectForKey:", CFSTR("unlocalizedName"));
      v17 = objc_claimAutoreleasedReturnValue();
      unlocalizedName = v5->_unlocalizedName;
      v5->_unlocalizedName = (NSString *)v17;

      objc_msgSend(v7, "objectForKey:", CFSTR("unlocalizedCountryName"));
      v19 = objc_claimAutoreleasedReturnValue();
      alCity = v5->_unlocalizedCountryName;
      v5->_unlocalizedCountryName = (NSString *)v19;
    }

    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

+ (id)unlocalizedExampleCity
{
  return -[WorldClockCity initWithTimeZone:countryCode:name:countryName:unlocalizedName:unlocalizedCountryName:]([WorldClockCity alloc], "initWithTimeZone:countryCode:name:countryName:unlocalizedName:unlocalizedCountryName:", CFSTR("America/Los_Angeles"), CFSTR("US"), CFSTR("Cupertino"), CFSTR("USA"), CFSTR("Cupertino"), CFSTR("USA"));
}

- (WorldClockCity)initWithALCity:(id)a3
{
  id v5;
  WorldClockCity *v6;
  WorldClockCity *v7;
  WorldClockCity *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WorldClockCity;
  v6 = -[WorldClockCity init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_alCity, a3);
    v8 = v7;
  }

  return v7;
}

- (WorldClockCity)initWithALCityIdentifier:(int)a3
{
  uint64_t v3;
  WorldClockCity *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  ALCity *alCity;
  WorldClockCity *v11;
  objc_super v13;

  v3 = *(_QWORD *)&a3;
  v13.receiver = self;
  v13.super_class = (Class)WorldClockCity;
  v4 = -[WorldClockCity init](&v13, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%d"), v3);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v5, 0);
    objc_msgSend(MEMORY[0x1E0CFA978], "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "citiesWithIdentifiers:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectAtIndex:", 0);
    v9 = objc_claimAutoreleasedReturnValue();
    alCity = v4->_alCity;
    v4->_alCity = (ALCity *)v9;

    v11 = v4;
  }

  return v4;
}

- (WorldClockCity)initWithTimeZone:(id)a3 countryCode:(id)a4 name:(id)a5 countryName:(id)a6 unlocalizedName:(id)a7 unlocalizedCountryName:(id)a8
{
  id v15;
  id v16;
  id v17;
  WorldClockCity *v18;
  WorldClockCity *v19;
  WorldClockCity *v20;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v24 = a3;
  v23 = a4;
  v22 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)WorldClockCity;
  v18 = -[WorldClockCity init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_timeZone, a3);
    objc_storeStrong((id *)&v19->_countryCode, a4);
    objc_storeStrong((id *)&v19->_name, a5);
    objc_storeStrong((id *)&v19->_countryName, a6);
    objc_storeStrong((id *)&v19->_unlocalizedName, a7);
    objc_storeStrong((id *)&v19->_unlocalizedCountryName, a8);
    v20 = v19;
  }

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (self->_alCity)
  {
    v9.receiver = self;
    v9.super_class = (Class)WorldClockCity;
    -[WorldClockCity description](&v9, sel_description);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ALCity description](self->_alCity, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WorldClockCity;
    -[WorldClockCity description](&v8, sel_description);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@, %@ || %@ %@ || %@, %@"), v4, self->_name, self->_countryName, self->_timeZone, self->_countryCode, self->_unlocalizedName, self->_unlocalizedCountryName);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  ALCity *alCity;
  uint64_t v7;
  char v8;
  BOOL v9;
  NSString *timeZone;
  NSString *countryCode;
  NSString *unlocalizedName;
  NSString *name;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    alCity = self->_alCity;
    v7 = v5[1];
    if (alCity)
    {
      if (v7)
      {
        v8 = -[ALCity isEqual:](alCity, "isEqual:");
LABEL_5:
        v9 = v8;
LABEL_9:

        goto LABEL_10;
      }
LABEL_8:
      v9 = 0;
      goto LABEL_9;
    }
    if (v7)
      goto LABEL_8;
    timeZone = self->_timeZone;
    if (timeZone != (NSString *)v5[2] && !-[NSString isEqualToString:](timeZone, "isEqualToString:"))
      goto LABEL_8;
    countryCode = self->_countryCode;
    if (countryCode != (NSString *)v5[5] && !-[NSString isEqualToString:](countryCode, "isEqualToString:"))
      goto LABEL_8;
    unlocalizedName = self->_unlocalizedName;
    if (unlocalizedName != (NSString *)v5[6])
    {
      if (!-[NSString isEqualToString:](unlocalizedName, "isEqualToString:"))
        goto LABEL_8;
      unlocalizedName = self->_unlocalizedName;
    }
    if (unlocalizedName || (name = self->_name, name == (NSString *)v5[3]))
    {
      v9 = 1;
      goto LABEL_9;
    }
    v8 = -[NSString isEqualToString:](name, "isEqualToString:");
    goto LABEL_5;
  }
  v9 = 0;
LABEL_10:

  return v9;
}

- (unint64_t)hash
{
  NSString *alCity;
  NSString *name;

  alCity = (NSString *)self->_alCity;
  if (alCity || (alCity = self->_unlocalizedName) != 0)
    name = alCity;
  else
    name = self->_name;
  return -[NSString hash](name, "hash");
}

- (NSDictionary)properties
{
  void *v3;
  ALCity *alCity;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *unlocalizedName;
  const __CFString *unlocalizedCountryName;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  alCity = self->_alCity;
  v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
  if (alCity)
  {
    v6 = (void *)objc_msgSend(v5, "initWithInt:", 2);
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("type"));
    -[ALCity properties](self->_alCity, "properties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("city"));

    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0C997E8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = CFSTR("languageCode");
  }
  else
  {
    v6 = (void *)objc_msgSend(v5, "initWithInt:", 1);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 6);
    objc_msgSend(v9, "setObject:forKey:", self->_timeZone, CFSTR("timeZone"));
    objc_msgSend(v9, "setObject:forKey:", self->_countryCode, CFSTR("countryCode"));
    objc_msgSend(v9, "setObject:forKey:", self->_name, CFSTR("name"));
    objc_msgSend(v9, "setObject:forKey:", self->_countryName, CFSTR("countryName"));
    if (self->_unlocalizedName)
      unlocalizedName = (const __CFString *)self->_unlocalizedName;
    else
      unlocalizedName = &stru_1E39CF258;
    objc_msgSend(v9, "setObject:forKey:", unlocalizedName, CFSTR("unlocalizedName"));
    if (self->_unlocalizedCountryName)
      unlocalizedCountryName = (const __CFString *)self->_unlocalizedCountryName;
    else
      unlocalizedCountryName = &stru_1E39CF258;
    objc_msgSend(v9, "setObject:forKey:", unlocalizedCountryName, CFSTR("unlocalizedCountryName"));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("type"));
    v10 = CFSTR("city");
  }
  objc_msgSend(v3, "setObject:forKey:", v9, v10);

  return (NSDictionary *)v3;
}

- (NSNumber)alCityId
{
  void *alCity;

  alCity = self->_alCity;
  if (alCity)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(alCity, "identifier"));
    alCity = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)alCity;
}

- (NSString)timeZone
{
  ALCity *alCity;
  NSString *v4;

  alCity = self->_alCity;
  if (alCity)
  {
    -[ALCity timeZone](alCity, "timeZone");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_timeZone;
  }
  return v4;
}

- (NSString)name
{
  ALCity *alCity;
  NSString *v4;

  alCity = self->_alCity;
  if (alCity)
  {
    -[ALCity name](alCity, "name");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_name;
  }
  return v4;
}

- (NSString)countryName
{
  ALCity *alCity;
  NSString *v4;

  alCity = self->_alCity;
  if (alCity)
  {
    -[ALCity countryName](alCity, "countryName");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_countryName;
  }
  return v4;
}

- (NSString)unlocalizedCityName
{
  ALCity *alCity;
  NSString *v4;

  alCity = self->_alCity;
  if (alCity)
  {
    -[ALCity unlocalizedName](alCity, "unlocalizedName");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_unlocalizedName;
  }
  return v4;
}

- (NSString)unlocalizedCountryName
{
  ALCity *alCity;
  NSString *v4;

  alCity = self->_alCity;
  if (alCity)
  {
    -[ALCity unlocalizedCountryName](alCity, "unlocalizedCountryName");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_unlocalizedCountryName;
  }
  return v4;
}

- (NSString)countryCode
{
  ALCity *alCity;
  NSString *v4;

  alCity = self->_alCity;
  if (alCity)
  {
    -[ALCity localeCode](alCity, "localeCode");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_countryCode;
  }
  return v4;
}

- (NSURL)idUrl
{
  void *v3;
  ALCity *alCity;
  NSString *unlocalizedName;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("x-apple-clock:world-clock?"));
  alCity = self->_alCity;
  if (alCity)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("alcid=%d"), -[ALCity identifier](alCity, "identifier"));
  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("ccid="));
    objc_msgSend(v3, "appendString:", self->_timeZone);
    objc_msgSend(v3, "appendString:", CFSTR("$"));
    objc_msgSend(v3, "appendString:", self->_countryCode);
    objc_msgSend(v3, "appendString:", CFSTR("$"));
    unlocalizedName = self->_unlocalizedName;
    if (!unlocalizedName)
      unlocalizedName = self->_name;
    objc_msgSend(v3, "appendString:", unlocalizedName);
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v3);

  return (NSURL *)v6;
}

- (ALCity)alCity
{
  return self->_alCity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlocalizedCountryName, 0);
  objc_storeStrong((id *)&self->_unlocalizedName, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_countryName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_alCity, 0);
}

@end

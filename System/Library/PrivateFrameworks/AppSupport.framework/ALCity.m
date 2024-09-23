@implementation ALCity

- (ALCity)init
{
  return -[ALCity initWithProperties:](self, "initWithProperties:", 0);
}

- (ALCity)initWithProperties:(id)a3
{
  ALCity *v4;
  ALCity *v5;
  float v6;
  float v7;
  NSString *name;
  NSString *unlocalizedCountryName;
  NSString *v10;
  NSString *countryName;
  NSString *countryOverride;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ALCity;
  v4 = -[ALCity init](&v14, sel_init);
  v5 = v4;
  if (!a3 || !v4)
    return v5;
  v4->_identifier = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("identifier")), "intValue");
  v5->_localeCode = (NSString *)(id)objc_msgSend(a3, "objectForKey:", CFSTR("localeCode"));
  v5->_timeZone = (NSString *)(id)objc_msgSend(a3, "objectForKey:", CFSTR("timeZone"));
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("longitude")), "floatValue");
  v5->_longitude = v6;
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("latitude")), "floatValue");
  v5->_latitude = v7;
  v5->_unlocalizedName = (NSString *)(id)objc_msgSend(a3, "objectForKey:", CFSTR("unlocalizedName"));
  v5->_unlocalizedCountryName = (NSString *)(id)objc_msgSend(a3, "objectForKey:", CFSTR("unlocalizedCountryName"));
  v5->_yahooCode = (NSString *)(id)objc_msgSend(a3, "objectForKey:", CFSTR("yahooCode"));
  v5->_name = (NSString *)(id)objc_msgSend(a3, "objectForKey:", CFSTR("name"));
  v5->_countryName = (NSString *)(id)objc_msgSend(a3, "objectForKey:", CFSTR("countryName"));
  v5->_countryOverride = (NSString *)(id)objc_msgSend(a3, "objectForKey:", CFSTR("countryOverride"));
  v5->_unlocalizedCountryOverride = (NSString *)(id)objc_msgSend(a3, "objectForKey:", CFSTR("unlocalizedCountryOverride"));
  v5->_displayNameIncludingCountryShowsOnlyCountry = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("displayNameIncludingCountryUsesOnlyCountry")), "BOOLValue");
  if (!v5->_unlocalizedName)
  {
    name = v5->_name;
    v5->_name = 0;
    v5->_unlocalizedName = name;
  }
  unlocalizedCountryName = v5->_unlocalizedCountryName;
  if (!unlocalizedCountryName)
  {
    unlocalizedCountryName = v5->_countryName;
    v5->_countryName = 0;
    v5->_unlocalizedCountryName = unlocalizedCountryName;
  }
  if (!v5->_unlocalizedCountryOverride)
  {
    countryOverride = v5->_countryOverride;
    v5->_countryOverride = 0;
    v5->_unlocalizedCountryOverride = countryOverride;
    if (unlocalizedCountryName)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (!unlocalizedCountryName)
LABEL_9:
    v5->_unlocalizedCountryName = (NSString *)&stru_1E2882B60;
LABEL_10:
  v10 = v5->_name;
  v5->_localizationAttempted = v10 != 0;
  if (!v10)
  {
    countryName = v5->_countryName;
    if (countryName || v5->_countryOverride)
    {

      v5->_countryName = 0;
      v5->_countryOverride = 0;
    }
  }
  return v5;
}

- (ALCity)initWithSQLRow:(char *)a3
{
  ALCity *v4;
  ALCity *v5;
  const __CFString *v6;
  char v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ALCity;
  v4 = -[ALCity init](&v9, sel_init);
  v5 = v4;
  if (a3 && v4)
  {
    v4->_identifier = atoi(a3[7]);
    if (a3[8])
      v5->_localeCode = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a3[8]);
    v5->_timeZone = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a3[5]);
    v5->_longitude = strtof(a3[3], 0);
    v5->_latitude = strtof(a3[4], 0);
    if (a3[6])
      v5->_yahooCode = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a3[6]);
    v5->_unlocalizedName = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", *a3);
    if (a3[1])
      v6 = (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a3[1]);
    else
      v6 = &stru_1E2882B60;
    v5->_unlocalizedCountryName = (NSString *)v6;
    if (a3[2])
      v5->_unlocalizedCountryOverride = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a3[2]);
    if (v5->_identifier == 118)
      v7 = 1;
    else
      v7 = -[NSString isEqualToString:](v5->_localeCode, "isEqualToString:", CFSTR("MO"));
    v5->_displayNameIncludingCountryShowsOnlyCountry = v7;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALCity;
  -[ALCity dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
    LOBYTE(v5) = objc_msgSend(a3, "identifier") == self->_identifier;
  return v5;
}

- (unint64_t)hash
{
  return self->_identifier;
}

- (void)ensureLocalized
{
  id v3;

  if (!self->_localizationAttempted)
  {
    v3 = +[ALCityManager sharedManager](ALCityManager, "sharedManager");
    objc_msgSend(v3, "localizeCities:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", self));
    self->_localizationAttempted = 1;
  }
}

- (id)displayNameIncludingCountry:(BOOL)a3 withFormat:(id)a4
{
  _BOOL4 v5;
  NSString *v7;
  NSString *v8;

  v5 = a3;
  v7 = -[ALCity name](self, "name");
  if (!v5)
    return v7;
  v8 = -[ALCity countryOverride](self, "countryOverride");
  if (!v8)
    v8 = -[ALCity countryName](self, "countryName");
  if (!-[NSString length](v8, "length"))
    return v7;
  if (self->_displayNameIncludingCountryShowsOnlyCountry)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v8);
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", a4, v7, v8);
}

- (id)displayNameIncludingCountry:(BOOL)a3
{
  return -[ALCity displayNameIncludingCountry:withFormat:](self, "displayNameIncludingCountry:withFormat:", a3, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppSupport")), "localizedStringForKey:value:table:", CFSTR("CITY %@, COUNTRY %@"), &stru_1E2882B60, CFSTR("Localizable")));
}

- (NSString)classicIdentifier
{
  NSString *result;

  result = self->_identifierForCPCity;
  if (!result)
  {
    result = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@, %@"), -[ALCity unlocalizedName](self, "unlocalizedName"), -[ALCity unlocalizedCountryName](self, "unlocalizedCountryName"));
    self->_identifierForCPCity = result;
  }
  return result;
}

- (NSDictionary)properties
{
  void *v3;
  NSString *localeCode;
  double v5;
  double v6;
  NSString *yahooCode;
  NSString *name;
  NSString *countryName;
  NSString *countryOverride;
  NSString *unlocalizedCountryOverride;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 12);
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_identifier), CFSTR("identifier"));
  localeCode = self->_localeCode;
  if (localeCode)
    objc_msgSend(v3, "setObject:forKey:", localeCode, CFSTR("localeCode"));
  objc_msgSend(v3, "setObject:forKey:", self->_timeZone, CFSTR("timeZone"));
  *(float *)&v5 = self->_longitude;
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("longitude"));
  *(float *)&v6 = self->_latitude;
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6), CFSTR("latitude"));
  yahooCode = self->_yahooCode;
  if (yahooCode)
    objc_msgSend(v3, "setObject:forKey:", yahooCode, CFSTR("yahooCode"));
  objc_msgSend(v3, "setObject:forKey:", self->_unlocalizedName, CFSTR("unlocalizedName"));
  objc_msgSend(v3, "setObject:forKey:", self->_unlocalizedCountryName, CFSTR("unlocalizedCountryName"));
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  countryName = self->_countryName;
  if (countryName)
    objc_msgSend(v3, "setObject:forKey:", countryName, CFSTR("countryName"));
  countryOverride = self->_countryOverride;
  if (countryOverride)
    objc_msgSend(v3, "setObject:forKey:", countryOverride, CFSTR("countryOverride"));
  unlocalizedCountryOverride = self->_unlocalizedCountryOverride;
  if (unlocalizedCountryOverride)
    objc_msgSend(v3, "setObject:forKey:", unlocalizedCountryOverride, CFSTR("unlocalizedCountryOverride"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_displayNameIncludingCountryShowsOnlyCountry), CFSTR("displayNameIncludingCountryUsesOnlyCountry"));
  return (NSDictionary *)v3;
}

- (NSString)name
{
  NSString *result;

  -[ALCity ensureLocalized](self, "ensureLocalized");
  result = self->_name;
  if (!result)
    return -[ALCity unlocalizedName](self, "unlocalizedName");
  return result;
}

- (void)setName:(id)a3
{
  NSString *name;

  name = self->_name;
  if (name != a3)
  {
    self->_localizationAttempted = 1;

    self->_name = (NSString *)a3;
  }
}

- (NSString)countryName
{
  NSString *result;

  -[ALCity ensureLocalized](self, "ensureLocalized");
  result = self->_countryName;
  if (!result)
    return -[ALCity unlocalizedCountryName](self, "unlocalizedCountryName");
  return result;
}

- (void)setCountryName:(id)a3
{
  NSString *countryName;

  countryName = self->_countryName;
  if (countryName != a3)
  {
    self->_localizationAttempted = 1;

    self->_countryName = (NSString *)a3;
  }
}

- (NSString)countryOverride
{
  NSString *result;

  -[ALCity ensureLocalized](self, "ensureLocalized");
  result = self->_countryOverride;
  if (!result)
    return -[ALCity unlocalizedCountryOverride](self, "unlocalizedCountryOverride");
  return result;
}

- (void)setCountryOverride:(id)a3
{
  NSString *countryOverride;

  countryOverride = self->_countryOverride;
  if (countryOverride != a3)
  {
    self->_localizationAttempted = 1;

    self->_countryOverride = (NSString *)a3;
  }
}

- (NSString)unlocalizedName
{
  return self->_unlocalizedName;
}

- (void)setUnlocalizedName:(id)a3
{
  NSString *unlocalizedName;

  unlocalizedName = self->_unlocalizedName;
  if (unlocalizedName != a3)
  {

    self->_unlocalizedName = (NSString *)a3;
    self->_identifierForCPCity = 0;
  }
}

- (NSString)unlocalizedCountryName
{
  return self->_unlocalizedCountryName;
}

- (void)setUnlocalizedCountryName:(id)a3
{
  NSString *unlocalizedCountryName;

  unlocalizedCountryName = self->_unlocalizedCountryName;
  if (unlocalizedCountryName != a3)
  {

    self->_unlocalizedCountryName = (NSString *)a3;
    self->_identifierForCPCity = 0;
  }
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALCity;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ [id %d], %@ [%@] || %@, %@, %@, || %f %f"), -[ALCity description](&v3, sel_description), -[ALCity name](self, "name"), self->_identifier, -[ALCity countryName](self, "countryName"), -[ALCity countryOverride](self, "countryOverride"), self->_timeZone, self->_localeCode, self->_yahooCode, self->_latitude, self->_longitude);
}

- (int)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int)a3
{
  self->_identifier = a3;
}

- (NSString)localeCode
{
  return self->_localeCode;
}

- (void)setLocaleCode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (float)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(float)a3
{
  self->_longitude = a3;
}

- (float)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(float)a3
{
  self->_latitude = a3;
}

- (NSString)yahooCode
{
  return self->_yahooCode;
}

- (void)setYahooCode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)unlocalizedCountryOverride
{
  return self->_unlocalizedCountryOverride;
}

- (void)setUnlocalizedCountryOverride:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (BOOL)displayNameIncludingCountryShowsOnlyCountry
{
  return self->_displayNameIncludingCountryShowsOnlyCountry;
}

- (void)setDisplayNameIncludingCountryShowsOnlyCountry:(BOOL)a3
{
  self->_displayNameIncludingCountryShowsOnlyCountry = a3;
}

@end

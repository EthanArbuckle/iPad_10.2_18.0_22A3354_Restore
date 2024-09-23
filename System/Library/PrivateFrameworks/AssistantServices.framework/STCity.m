@implementation STCity

- (id)_initWithName:(id)a3 unlocalizedName:(id)a4 countryName:(id)a5 unlocalizedCountryName:(id)a6 timeZone:(id)a7 latitude:(id)a8 longitude:(id)a9 alCityID:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  STCity *v22;
  uint64_t v23;
  NSString *name;
  uint64_t v25;
  NSString *unlocalizedName;
  uint64_t v27;
  NSString *countryName;
  uint64_t v29;
  NSString *unlocalizedCountryName;
  uint64_t v31;
  NSString *timeZone;
  id v34;
  id v35;
  objc_super v36;

  v35 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v34 = a8;
  v20 = a9;
  v21 = a10;
  v36.receiver = self;
  v36.super_class = (Class)STCity;
  v22 = -[STCity init](&v36, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v35, "copy", v34);
    name = v22->_name;
    v22->_name = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    unlocalizedName = v22->_unlocalizedName;
    v22->_unlocalizedName = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    countryName = v22->_countryName;
    v22->_countryName = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    unlocalizedCountryName = v22->_unlocalizedCountryName;
    v22->_unlocalizedCountryName = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    timeZone = v22->_timeZone;
    v22->_timeZone = (NSString *)v31;

    objc_storeStrong((id *)&v22->_latitude, a8);
    objc_storeStrong((id *)&v22->_longitude, a9);
    objc_storeStrong((id *)&v22->_alCityID, a10);
  }

  return v22;
}

- (id)alCityValue
{
  id v3;
  NSNumber *alCityID;
  NSNumber *latitude;
  NSNumber *longitude;

  v3 = objc_alloc_init(MEMORY[0x1E0CFA970]);
  alCityID = self->_alCityID;
  if (alCityID)
    objc_msgSend(v3, "setIdentifier:", -[NSNumber intValue](alCityID, "intValue"));
  latitude = self->_latitude;
  if (latitude)
  {
    -[NSNumber floatValue](latitude, "floatValue");
    objc_msgSend(v3, "setLatitude:");
  }
  longitude = self->_longitude;
  if (longitude)
  {
    -[NSNumber floatValue](longitude, "floatValue");
    objc_msgSend(v3, "setLongitude:");
  }
  objc_msgSend(v3, "setName:", self->_name);
  objc_msgSend(v3, "setUnlocalizedName:", self->_unlocalizedName);
  objc_msgSend(v3, "setCountryName:", self->_countryName);
  objc_msgSend(v3, "setUnlocalizedCountryName:", self->_unlocalizedCountryName);
  objc_msgSend(v3, "setTimeZone:", self->_timeZone);
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("Name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_unlocalizedName, CFSTR("UnlocalizedName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_countryName, CFSTR("CountryName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_unlocalizedCountryName, CFSTR("UnlocalizedName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeZone, CFSTR("TimeZone"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_latitude, CFSTR("Latitude"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_longitude, CFSTR("Longitude"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_alCityID, CFSTR("ALCityID"));

}

- (STCity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  STCity *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UnlocalizedName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CountryName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UnlocalizedCountryName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TimeZone"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Latitude"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Longitude"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ALCityID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[STCity _initWithName:unlocalizedName:countryName:unlocalizedCountryName:timeZone:latitude:longitude:alCityID:](self, "_initWithName:unlocalizedName:countryName:unlocalizedCountryName:timeZone:latitude:longitude:alCityID:", v5, v6, v7, v8, v9, v10, v11, v12);
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alCityID, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_unlocalizedCountryName, 0);
  objc_storeStrong((id *)&self->_countryName, 0);
  objc_storeStrong((id *)&self->_unlocalizedName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

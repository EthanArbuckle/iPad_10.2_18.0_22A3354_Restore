@implementation HKClinicalProviderSearchResult

- (HKClinicalProviderSearchResult)initWithExternalID:(id)a3 batchID:(id)a4 title:(id)a5 subtitle:(id)a6 location:(id)a7 supported:(BOOL)a8 countryCode:(id)a9 brand:(id)a10 minCompatibleAPIVersion:(int64_t)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  HKClinicalProviderSearchResult *v24;
  uint64_t v25;
  NSString *externalID;
  uint64_t v27;
  NSString *batchID;
  uint64_t v29;
  NSString *title;
  uint64_t v31;
  NSString *subtitle;
  uint64_t v33;
  NSString *location;
  uint64_t v35;
  NSString *countryCode;
  uint64_t v37;
  HKClinicalBrand *brand;
  objc_super v40;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a9;
  v23 = a10;
  v40.receiver = self;
  v40.super_class = (Class)HKClinicalProviderSearchResult;
  v24 = -[HKClinicalProviderSearchResult init](&v40, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v17, "copy");
    externalID = v24->_externalID;
    v24->_externalID = (NSString *)v25;

    v27 = objc_msgSend(v18, "copy");
    batchID = v24->_batchID;
    v24->_batchID = (NSString *)v27;

    v29 = objc_msgSend(v19, "copy");
    title = v24->_title;
    v24->_title = (NSString *)v29;

    v31 = objc_msgSend(v20, "copy");
    subtitle = v24->_subtitle;
    v24->_subtitle = (NSString *)v31;

    v33 = objc_msgSend(v21, "copy");
    location = v24->_location;
    v24->_location = (NSString *)v33;

    v24->_supported = a8;
    v35 = objc_msgSend(v22, "copy");
    countryCode = v24->_countryCode;
    v24->_countryCode = (NSString *)v35;

    v37 = objc_msgSend(v23, "copy");
    brand = v24->_brand;
    v24->_brand = (HKClinicalBrand *)v37;

    v24->_minCompatibleAPIVersion = a11;
  }

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HKClinicalProviderSearchResult externalID](self, "externalID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "externalID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(v4, "externalID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[HKClinicalProviderSearchResult externalID](self, "externalID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "externalID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HKClinicalProviderSearchResult externalID](self, "externalID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[HKClinicalProviderSearchResult externalID](self, "externalID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("externalID"));

  -[HKClinicalProviderSearchResult batchID](self, "batchID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("batchID"));

  -[HKClinicalProviderSearchResult title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("title"));

  -[HKClinicalProviderSearchResult subtitle](self, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("subtitle"));

  -[HKClinicalProviderSearchResult location](self, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("location"));

  objc_msgSend(v11, "encodeBool:forKey:", -[HKClinicalProviderSearchResult isSupported](self, "isSupported"), CFSTR("supported"));
  -[HKClinicalProviderSearchResult countryCode](self, "countryCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("countryCode"));

  -[HKClinicalProviderSearchResult brand](self, "brand");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("brand"));

  objc_msgSend(v11, "encodeInt64:forKey:", -[HKClinicalProviderSearchResult minCompatibleAPIVersion](self, "minCompatibleAPIVersion"), CFSTR("minCompatibleApiVersion"));
}

- (HKClinicalProviderSearchResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HKClinicalProviderSearchResult *v17;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("batchID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("countryCode"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v5)
    v10 = v6 == 0;
  else
    v10 = 1;
  v12 = v10 || v7 == 0 || v8 == 0;
  if (!v12
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("supported"))
    && (objc_msgSend(v4, "containsValueForKey:", CFSTR("minCompatibleApiVersion")) & 1) != 0)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supported"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("brand"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HKClinicalProviderSearchResult initWithExternalID:batchID:title:subtitle:location:supported:countryCode:brand:minCompatibleAPIVersion:](self, "initWithExternalID:batchID:title:subtitle:location:supported:countryCode:brand:minCompatibleAPIVersion:", v5, v6, v7, v13, v14, v15, v9, v16, (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("minCompatibleApiVersion")));

    v17 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v17 = 0;
  }

  return v17;
}

- (id)informationURL
{
  return 0;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (NSString)batchID
{
  return self->_batchID;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)location
{
  return self->_location;
}

- (HKClinicalBrand)brand
{
  return self->_brand;
}

- (BOOL)isSupported
{
  return self->_supported;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (int64_t)minCompatibleAPIVersion
{
  return self->_minCompatibleAPIVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_brand, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_batchID, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
}

@end

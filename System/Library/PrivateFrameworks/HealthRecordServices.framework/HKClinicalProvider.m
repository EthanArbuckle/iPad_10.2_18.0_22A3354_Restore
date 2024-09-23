@implementation HKClinicalProvider

- (HKClinicalProvider)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKClinicalProvider)initWithExternalID:(id)a3 title:(id)a4 subtitle:(id)a5 location:(id)a6 informationURL:(id)a7 brand:(id)a8 gateways:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  HKClinicalProvider *v22;
  uint64_t v23;
  NSString *externalID;
  uint64_t v25;
  NSString *title;
  uint64_t v27;
  NSString *subtitle;
  uint64_t v29;
  NSString *location;
  uint64_t v31;
  NSURL *informationURL;
  uint64_t v33;
  HKClinicalBrand *brand;
  uint64_t v35;
  NSArray *gateways;
  objc_super v38;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v38.receiver = self;
  v38.super_class = (Class)HKClinicalProvider;
  v22 = -[HKClinicalProvider init](&v38, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v15, "copy");
    externalID = v22->_externalID;
    v22->_externalID = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    title = v22->_title;
    v22->_title = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    subtitle = v22->_subtitle;
    v22->_subtitle = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    location = v22->_location;
    v22->_location = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    informationURL = v22->_informationURL;
    v22->_informationURL = (NSURL *)v31;

    v33 = objc_msgSend(v20, "copy");
    brand = v22->_brand;
    v22->_brand = (HKClinicalBrand *)v33;

    if (v21)
    {
      v35 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", v21, 1);
      gateways = v22->_gateways;
      v22->_gateways = (NSArray *)v35;

    }
  }

  return v22;
}

- (NSString)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v4 = objc_opt_class();
  -[HKClinicalProvider title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalProvider subtitle](self, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalProvider externalID](self, "externalID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalProvider gateways](self, "gateways");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@:%p; title: %@; subtitle: %@; external-id: %@; gateway-count: %ld;>"),
                 v4,
                 self,
                 v5,
                 v6,
                 v7,
                 objc_msgSend(v8, "count"));

  return (NSString *)v9;
}

- (BOOL)isSupported
{
  void *v2;
  BOOL v3;

  -[HKClinicalProvider gateways](self, "gateways");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[HKClinicalProvider brand](self, "brand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("brand"));

  -[HKClinicalProvider externalID](self, "externalID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("externalID"));

  -[HKClinicalProvider gateways](self, "gateways");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("gateways"));

  -[HKClinicalProvider informationURL](self, "informationURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("infoURL"));

  -[HKClinicalProvider title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("title"));

  -[HKClinicalProvider subtitle](self, "subtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("subtitle"));

  -[HKClinicalProvider location](self, "location");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("location"));

}

- (HKClinicalProvider)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HKClinicalProvider *v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v15 = 0;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("infoURL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("brand"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("gateways"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HKClinicalProvider initWithExternalID:title:subtitle:location:informationURL:brand:gateways:](self, "initWithExternalID:title:subtitle:location:informationURL:brand:gateways:", v6, v8, v10, v11, v12, v13, v14);

    v15 = self;
  }

  return v15;
}

- (NSString)externalID
{
  return self->_externalID;
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

- (NSURL)informationURL
{
  return self->_informationURL;
}

- (HKClinicalBrand)brand
{
  return self->_brand;
}

- (NSArray)gateways
{
  return self->_gateways;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gateways, 0);
  objc_storeStrong((id *)&self->_brand, 0);
  objc_storeStrong((id *)&self->_informationURL, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
}

@end

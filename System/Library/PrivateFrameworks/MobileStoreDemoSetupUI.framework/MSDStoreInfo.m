@implementation MSDStoreInfo

- (MSDStoreInfo)initWithDict:(id)a3
{
  id v4;
  MSDStoreInfo *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *fullAddress;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  CLLocation *storeLocation;
  uint64_t v25;
  NSString *storeDescription;
  void *v28;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MSDStoreInfo;
  v5 = -[MSDStoreInfo init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("hq"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("confirm_store_selection"));
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("confirmation_code"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("apple_id"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("store_name"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("company_name"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("latitude"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("longitude"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("nearby"));
    v14 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v6;
    v15 = (void *)v6;
    v16 = (void *)v7;
    v17 = (void *)v14;
    v5->_isHQ = objc_msgSend(v15, "BOOLValue");
    v5->_confirmStoreSelection = objc_msgSend(v16, "BOOLValue");
    objc_storeStrong((id *)&v5->_confirmationCode, v8);
    objc_storeStrong((id *)&v5->_appleID, v9);
    objc_storeStrong((id *)&v5->_storeName, v10);
    objc_storeStrong((id *)&v5->_companyName, v11);
    -[MSDStoreInfo _buildFullAddress:](v5, "_buildFullAddress:", v4);
    v18 = objc_claimAutoreleasedReturnValue();
    fullAddress = v5->_fullAddress;
    v5->_fullAddress = (NSString *)v18;

    v5->_isNearby = objc_msgSend(v17, "BOOLValue");
    if (v12 && v13)
    {
      objc_msgSend(v12, "doubleValue");
      v21 = v20;
      objc_msgSend(v13, "doubleValue");
      v23 = objc_msgSend(objc_alloc(MEMORY[0x24BDBFA80]), "initWithLatitude:longitude:", v21, v22);
      storeLocation = v5->_storeLocation;
      v5->_storeLocation = (CLLocation *)v23;
    }
    else
    {
      storeLocation = v5->_storeLocation;
      v5->_storeLocation = 0;
    }

    -[MSDStoreInfo _buildStoreDescription:](v5, "_buildStoreDescription:", v4);
    v25 = objc_claimAutoreleasedReturnValue();
    storeDescription = v5->_storeDescription;
    v5->_storeDescription = (NSString *)v25;

  }
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreInfo storeName](self, "storeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreInfo appleID](self, "appleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreInfo storeLocation](self, "storeLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "coordinate");
  v10 = v9;
  -[MSDStoreInfo storeLocation](self, "storeLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "coordinate");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@;%@ (%lf,%lf)>"), v5, v6, v7, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_buildFullAddress:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("address"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("city"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("country_name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("country_code"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("zip"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "uppercaseString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByTrimmingCharactersInSet:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_alloc_init(MEMORY[0x24BDBAD98]);
  v22 = objc_alloc_init(MEMORY[0x24BDBAD78]);
  v23 = v22;
  if (v11)
    objc_msgSend(v22, "setStreet:", v11);
  if (v13)
    objc_msgSend(v23, "setCity:", v13);
  if (v15 && (objc_msgSend(v11, "isEqualToString:", v15) & 1) == 0)
    objc_msgSend(v23, "setState:", v15);
  if (v20)
    objc_msgSend(v23, "setPostalCode:", v20);
  if (v8)
    objc_msgSend(v23, "setISOCountryCode:", v8);
  if (v17)
    objc_msgSend(v23, "setCountry:", v17);
  objc_msgSend(v21, "stringFromPostalAddress:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)_buildStoreDescription:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("address"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("city"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("distance_unit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("distance_in_unit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_new();
  if (v7 && v6)
  {
    v11 = objc_alloc_init(MEMORY[0x24BDDB060]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v7, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "distanceFromString:", v12);
    objc_msgSend(v11, "stringFromDistance:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "appendString:", v13);
  }
  if (v9 | v5)
  {
    if (objc_msgSend(v10, "length"))
      objc_msgSend(v10, "appendString:", CFSTR(" • "));
    if (!v9 || !v5)
    {
      if (v9)
      {
        v15 = v10;
        v16 = v9;
      }
      else
      {
        if (!v5)
          goto LABEL_15;
        v15 = v10;
        v16 = v5;
      }
      objc_msgSend(v15, "appendString:", v16);
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@, %@"), v9, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendString:", v14);

  }
LABEL_15:

  return v10;
}

- (BOOL)isHQ
{
  return self->_isHQ;
}

- (BOOL)confirmStoreSelection
{
  return self->_confirmStoreSelection;
}

- (NSString)confirmationCode
{
  return self->_confirmationCode;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSString)storeName
{
  return self->_storeName;
}

- (NSString)companyName
{
  return self->_companyName;
}

- (NSString)fullAddress
{
  return self->_fullAddress;
}

- (CLLocation)storeLocation
{
  return self->_storeLocation;
}

- (NSString)storeDescription
{
  return self->_storeDescription;
}

- (BOOL)isNearby
{
  return self->_isNearby;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeDescription, 0);
  objc_storeStrong((id *)&self->_storeLocation, 0);
  objc_storeStrong((id *)&self->_fullAddress, 0);
  objc_storeStrong((id *)&self->_companyName, 0);
  objc_storeStrong((id *)&self->_storeName, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_confirmationCode, 0);
}

@end

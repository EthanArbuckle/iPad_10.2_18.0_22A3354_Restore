@implementation HMDHAPMetadataCategory

- (NSString)uuidStr
{
  return self->_uuidStr;
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (NSString)catDescription
{
  return self->_catDescription;
}

- (HMDHAPMetadataCategory)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDHAPMetadataCategory)initWithIdentifier:(id)a3 uuid:(id)a4 name:(id)a5 description:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDHAPMetadataCategory *v15;
  HMDHAPMetadataCategory *v16;
  uint64_t v17;
  NSString *uuidStr;
  uint64_t v19;
  NSString *name;
  uint64_t v21;
  NSString *catDescription;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HMDHAPMetadataCategory;
  v15 = -[HMDHAPMetadataCategory init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v12);
    v17 = objc_claimAutoreleasedReturnValue();
    uuidStr = v16->_uuidStr;
    v16->_uuidStr = (NSString *)v17;

    objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v13);
    v19 = objc_claimAutoreleasedReturnValue();
    name = v16->_name;
    v16->_name = (NSString *)v19;

    objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v14);
    v21 = objc_claimAutoreleasedReturnValue();
    catDescription = v16->_catDescription;
    v16->_catDescription = (NSString *)v21;

  }
  return v16;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDHAPMetadataCategory name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPMetadataCategory catDescription](self, "catDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPMetadataCategory identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPMetadataCategory uuidStr](self, "uuidStr");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Accessory category %@: description: %@ identifier: %@ uuid: %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setUuidStr:(id)a3
{
  objc_storeStrong((id *)&self->_uuidStr, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)setCatDescription:(id)a3
{
  objc_storeStrong((id *)&self->_catDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uuidStr, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

@implementation CARThemeAssetVersion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CARThemeAssetVersion)initWithIdentifier:(id)a3 iOSContentVersion:(id)a4 accessoryContentVersion:(id)a5
{
  id v9;
  id v10;
  id v11;
  CARThemeAssetVersion *v12;
  CARThemeAssetVersion *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CARThemeAssetVersion;
  v12 = -[CARThemeAssetVersion init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_iOSContentVersion, a4);
    objc_storeStrong((id *)&v13->_accessoryContentVersion, a5);
  }

  return v13;
}

- (CARThemeAssetVersion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CARThemeAssetVersion *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iOSContentVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AccessoryContentVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CARThemeAssetVersion initWithIdentifier:iOSContentVersion:accessoryContentVersion:](self, "initWithIdentifier:iOSContentVersion:accessoryContentVersion:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CARThemeAssetVersion identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[CARThemeAssetVersion iOSContentVersion](self, "iOSContentVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("iOSContentVersion"));

  -[CARThemeAssetVersion accessoryContentVersion](self, "accessoryContentVersion");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("AccessoryContentVersion"));

}

- (BOOL)isEqual:(id)a3
{
  CARThemeAssetVersion *v4;
  BOOL v5;

  v4 = (CARThemeAssetVersion *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CARThemeAssetVersion isEqualToThemeAssetVersion:](self, "isEqualToThemeAssetVersion:", v4);
  }

  return v5;
}

- (BOOL)isEqualToThemeAssetVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[CARThemeAssetVersion identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[CARThemeAssetVersion iOSContentVersion](self, "iOSContentVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "iOSContentVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      -[CARThemeAssetVersion accessoryContentVersion](self, "accessoryContentVersion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accessoryContentVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToNumber:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[CARThemeAssetVersion iOSContentVersion](self, "iOSContentVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iOSContentVersion");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("0"))
      && objc_msgSend(v7, "isEqualToString:", CFSTR("0"))
      || (v8 = objc_msgSend(v5, "cr_buildVersionCompare:", v7)) == 0)
    {
      -[CARThemeAssetVersion accessoryContentVersion](self, "accessoryContentVersion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accessoryContentVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "compare:", v10);

    }
  }
  else if (v6)
  {
    v8 = 0;
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)CARThemeAssetVersion;
  -[CARThemeAssetVersion description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARThemeAssetVersion identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARThemeAssetVersion iOSContentVersion](self, "iOSContentVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARThemeAssetVersion accessoryContentVersion](self, "accessoryContentVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [id: %@, iOS version: %@, accessory version: %@]"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)iOSContentVersion
{
  return self->_iOSContentVersion;
}

- (NSNumber)accessoryContentVersion
{
  return self->_accessoryContentVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryContentVersion, 0);
  objc_storeStrong((id *)&self->_iOSContentVersion, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

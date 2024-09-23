@implementation UAFNLAsset

- (id)getAssetMetadata
{
  return self->_assetMetadata;
}

- (id)getAssetPath
{
  return self->_path;
}

- (void)appendPathWithServiceAssetFolder:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *path;
  NSDictionary *v8;
  NSDictionary *assetMetadata;

  v4 = a3;
  -[UAFNLAsset getAssetPath](self, "getAssetPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMAssetsUtils appendPathWithServiceAssetFolder:assetPath:](CDMAssetsUtils, "appendPathWithServiceAssetFolder:assetPath:", v4, v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  path = self->_path;
  self->_path = v6;

  +[CDMAssetsUtils loadAssetMetadataFromAsset:](CDMAssetsUtils, "loadAssetMetadataFromAsset:", self->_path);
  v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  assetMetadata = self->_assetMetadata;
  self->_assetMetadata = v8;

}

- (int64_t)getAssetType
{
  return 2;
}

- (id)initForFactor:(id)a3 withPath:(id)a4 withAssetSetName:(id)a5 withUAFMetadata:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  UAFNLAsset *v15;
  UAFNLAsset *v16;
  NSDictionary *v17;
  NSDictionary *assetMetadata;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)UAFNLAsset;
  v15 = -[UAFNLAsset init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_factorName, a3);
    objc_storeStrong((id *)&v16->_path, a4);
    objc_storeStrong((id *)&v16->_assetSetName, a5);
    v17 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    assetMetadata = v16->_assetMetadata;
    v16->_assetMetadata = v17;

    -[UAFNLAsset processUAFMetadata:](v16, "processUAFMetadata:", v14);
  }

  return v16;
}

- (id)getAssetLocale
{
  return self->_assetLocale;
}

- (id)getAssetVersion
{
  return self->_assetVersion;
}

- (id)getAssetSetName
{
  return self->_assetSetName;
}

- (void)processUAFMetadata:(id)a3
{
  id v4;
  NSString *v5;
  NSString *assetLocale;
  NSString *v7;
  NSString *v8;
  NSObject *v9;
  NSString *v10;
  NSString *assetVersion;
  void *v12;
  NSString *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  NSString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("locale"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  assetLocale = self->_assetLocale;
  self->_assetLocale = v5;

  if (self->_assetLocale)
  {
    +[CDMPlatformUtils normalizeLocaleIdentifier:](CDMPlatformUtils, "normalizeLocaleIdentifier:");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = self->_assetLocale;
    self->_assetLocale = v7;

    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("locale"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = self->_assetLocale;
      v14 = 136315650;
      v15 = "-[UAFNLAsset processUAFMetadata:]";
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      _os_log_debug_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEBUG, "%s Normalize locale from UAF metadata: %@ to be locale: %@", (uint8_t *)&v14, 0x20u);

    }
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("version"));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  assetVersion = self->_assetVersion;
  self->_assetVersion = v10;

}

- (id)getFactorName
{
  return self->_factorName;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[UAFNLAsset getFactorName](self, "getFactorName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAFNLAsset getAssetPath](self, "getAssetPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAFNLAsset getAssetVersion](self, "getAssetVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAFNLAsset getAssetLocale](self, "getAssetLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAFNLAsset getAssetSetName](self, "getAssetSetName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAFNLAsset getAssetMetadata](self, "getAssetMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[UAF asset] - Factor name: %@, Asset path: %@, Asset version: %@, Asset locale: %@, Asset Set Name: %@, Asset metadata: %@."), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (id)toDictionary
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

  -[UAFNLAsset getAssetPath](self, "getAssetPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("path"));

  -[UAFNLAsset getAssetVersion](self, "getAssetVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("version"));

  -[UAFNLAsset getFactorName](self, "getFactorName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("factor"));

  -[UAFNLAsset getAssetLocale](self, "getAssetLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("locale"));

  -[UAFNLAsset getAssetMetadata](self, "getAssetMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("asset_metadata"));

  -[UAFNLAsset getAssetSetName](self, "getAssetSetName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("asset_set_name"));

  return v3;
}

- (UAFNLAsset)initWithCoder:(id)a3
{
  id v4;
  UAFNLAsset *v5;
  uint64_t v6;
  NSString *factorName;
  uint64_t v8;
  NSString *path;
  uint64_t v10;
  NSString *assetLocale;
  uint64_t v12;
  NSString *assetVersion;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSDictionary *assetMetadata;
  uint64_t v19;
  NSString *assetSetName;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)UAFNLAsset;
  v5 = -[UAFNLAsset init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("factorName"));
    v6 = objc_claimAutoreleasedReturnValue();
    factorName = v5->_factorName;
    v5->_factorName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
    v8 = objc_claimAutoreleasedReturnValue();
    path = v5->_path;
    v5->_path = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetLocale"));
    v10 = objc_claimAutoreleasedReturnValue();
    assetLocale = v5->_assetLocale;
    v5->_assetLocale = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetVersion"));
    v12 = objc_claimAutoreleasedReturnValue();
    assetVersion = v5->_assetVersion;
    v5->_assetVersion = (NSString *)v12;

    v14 = (void *)MEMORY[0x24BDBCF20];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("assetMetadata"));
    v17 = objc_claimAutoreleasedReturnValue();
    assetMetadata = v5->_assetMetadata;
    v5->_assetMetadata = (NSDictionary *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetSetName"));
    v19 = objc_claimAutoreleasedReturnValue();
    assetSetName = v5->_assetSetName;
    v5->_assetSetName = (NSString *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *factorName;
  id v5;

  factorName = self->_factorName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", factorName, CFSTR("factorName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_path, CFSTR("path"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assetMetadata, CFSTR("assetMetadata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assetLocale, CFSTR("assetLocale"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assetVersion, CFSTR("assetVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assetSetName, CFSTR("assetSetName"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_assetLocale, 0);
  objc_storeStrong((id *)&self->_assetMetadata, 0);
  objc_storeStrong((id *)&self->_assetSetName, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_factorName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

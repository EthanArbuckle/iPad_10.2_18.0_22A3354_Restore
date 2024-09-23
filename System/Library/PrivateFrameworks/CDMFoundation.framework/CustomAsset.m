@implementation CustomAsset

- (CustomAsset)initWithPath:(id)a3
{
  id v5;
  CustomAsset *v6;
  CustomAsset *v7;
  uint64_t v8;
  NSDictionary *assetMetadata;
  uint64_t v10;
  NSString *version;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CustomAsset;
  v6 = -[CustomAsset init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_path, a3);
    +[CDMAssetsUtils loadAssetMetadataFromAsset:](CDMAssetsUtils, "loadAssetMetadataFromAsset:", v7->_path);
    v8 = objc_claimAutoreleasedReturnValue();
    assetMetadata = v7->_assetMetadata;
    v7->_assetMetadata = (NSDictionary *)v8;

    +[CDMAssetsUtils getAssetVersionFromAssetMetadata:](CDMAssetsUtils, "getAssetVersionFromAssetMetadata:", v7->_assetMetadata);
    v10 = objc_claimAutoreleasedReturnValue();
    version = v7->_version;
    v7->_version = (NSString *)v10;

  }
  return v7;
}

- (int64_t)getAssetType
{
  return 1;
}

- (id)getAssetPath
{
  return self->_path;
}

- (id)getAssetVersion
{
  return self->_version;
}

- (id)getAssetMetadata
{
  return self->_assetMetadata;
}

- (id)getAssetSetName
{
  return 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CustomAsset getAssetPath](self, "getAssetPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CustomAsset getAssetVersion](self, "getAssetVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CustomAsset getAssetMetadata](self, "getAssetMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[Custom asset] - Asset path: %@, Asset version: %@, Asset metadata: %@."), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)toDictionary
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 5);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

  -[CustomAsset getAssetPath](self, "getAssetPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("path"));

  -[CustomAsset getAssetVersion](self, "getAssetVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("version"));

  -[CustomAsset getAssetMetadata](self, "getAssetMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("asset_metadata"));

  return v3;
}

- (void)appendPathWithServiceAssetFolder:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[CustomAsset appendPathWithServiceAssetFolder:]";
    _os_log_debug_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_DEBUG, "%s CustomAssets don't support appendPathWithServiceAssetFolder method.", (uint8_t *)&v4, 0xCu);
  }

}

- (id)getAssetLocale
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[CustomAsset getAssetLocale]";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s CustomAssets don't support getAssetLocale method.", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (CustomAsset)initWithCoder:(id)a3
{
  id v4;
  CustomAsset *v5;
  uint64_t v6;
  NSString *path;
  uint64_t v8;
  NSString *version;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSDictionary *assetMetadata;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CustomAsset;
  v5 = -[CustomAsset init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
    v6 = objc_claimAutoreleasedReturnValue();
    path = v5->_path;
    v5->_path = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
    v8 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSString *)v8;

    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("assetMetadata"));
    v13 = objc_claimAutoreleasedReturnValue();
    assetMetadata = v5->_assetMetadata;
    v5->_assetMetadata = (NSDictionary *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *path;
  id v5;

  path = self->_path;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", path, CFSTR("path"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_version, CFSTR("version"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assetMetadata, CFSTR("assetMetadata"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetMetadata, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

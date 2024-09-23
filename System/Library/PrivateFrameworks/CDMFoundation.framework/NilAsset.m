@implementation NilAsset

- (int64_t)getAssetType
{
  return 0;
}

- (id)getAssetPath
{
  return 0;
}

- (id)getAssetVersion
{
  return 0;
}

- (id)getAssetMetadata
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
  -[NilAsset getAssetPath](self, "getAssetPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NilAsset getAssetVersion](self, "getAssetVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NilAsset getAssetMetadata](self, "getAssetMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[Nil asset] - Asset path: %@, Asset version: %@, Asset metadata: %@."), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)toDictionary
{
  id v2;
  objc_class *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("type"));

  return v2;
}

- (id)getAssetLocale
{
  return 0;
}

- (id)getAssetSetName
{
  return 0;
}

- (NilAsset)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NilAsset;
  return -[NilAsset init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

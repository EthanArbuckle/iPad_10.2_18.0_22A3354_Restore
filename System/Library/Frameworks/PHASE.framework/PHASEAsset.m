@implementation PHASEAsset

- (PHASEAsset)init
{
  -[PHASEAsset doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEAsset)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (NSString)uid
{
  return self->_identifier;
}

- (void)setUid:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (PHASEAsset)initWithUID:(id)a3 assetRegistry:(id)a4
{
  id v7;
  id v8;
  PHASEAsset *v9;
  PHASEAsset *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHASEAsset;
  v9 = -[PHASEAsset init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeWeak((id *)&v10->_assetRegistry, v8);
  }

  return v10;
}

- (unint64_t)sizeInBytes
{
  return 0;
}

- (void)setOwningDataBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_owningDataBundleIdentifier, a3);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (PHASEAssetRegistry)assetRegistry
{
  return (PHASEAssetRegistry *)objc_loadWeakRetained((id *)&self->_assetRegistry);
}

- (void)setAssetRegistry:(id)a3
{
  objc_storeWeak((id *)&self->_assetRegistry, a3);
}

- (NSString)owningDataBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_owningDataBundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_assetRegistry);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

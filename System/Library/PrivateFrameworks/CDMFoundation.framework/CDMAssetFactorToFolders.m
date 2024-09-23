@implementation CDMAssetFactorToFolders

- (CDMAssetFactorToFolders)initWithAssetFactorToFoldersMapping:(id)a3
{
  id v5;
  CDMAssetFactorToFolders *v6;
  CDMAssetFactorToFolders *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMAssetFactorToFolders;
  v6 = -[CDMAssetFactorToFolders init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_assetFactorToFoldersMapping, a3);

  return v7;
}

- (id)getAssetFactorToFoldersMapping
{
  return self->_assetFactorToFoldersMapping;
}

- (NSDictionary)assetFactorToFoldersMapping
{
  return self->_assetFactorToFoldersMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetFactorToFoldersMapping, 0);
}

@end

@implementation CDMServiceAssetConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSetToFactorsConfig, 0);
}

- (CDMServiceAssetConfig)init
{
  CDMServiceAssetConfig *v2;
  CDMAssetSetToFactorsConfig *v3;
  CDMAssetSetToFactorsConfig *assetSetToFactorsConfig;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDMServiceAssetConfig;
  v2 = -[CDMServiceAssetConfig init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CDMAssetSetToFactorsConfig);
    assetSetToFactorsConfig = v2->_assetSetToFactorsConfig;
    v2->_assetSetToFactorsConfig = v3;

    v2->_isAssetRequiredForSetup = 1;
  }
  return v2;
}

- (void)addCDMFactorToFoldersMapping:(id)a3 forAssetSet:(int64_t)a4
{
  id v6;
  CDMAssetsFactorConfig *v7;

  v6 = a3;
  v7 = -[CDMAssetsFactorConfig initWithFactorToFoldersMapping:]([CDMAssetsFactorConfig alloc], "initWithFactorToFoldersMapping:", v6);

  -[CDMAssetSetToFactorsConfig setCDMAssetsFactorConfig:forAssetSet:](self->_assetSetToFactorsConfig, "setCDMAssetsFactorConfig:forAssetSet:", v7, a4);
}

- (BOOL)isAssetRequiredForSetup
{
  return self->_isAssetRequiredForSetup;
}

- (id)getCDMAssetsFactorConfigForAssetSet:(int64_t)a3
{
  return -[CDMAssetSetToFactorsConfig getCDMFactorConfigForAssetSet:](self->_assetSetToFactorsConfig, "getCDMFactorConfigForAssetSet:", a3);
}

- (id)getCDMAssetSetToFactorsConfig
{
  return self->_assetSetToFactorsConfig;
}

- (id)getAllFactors
{
  return -[CDMAssetSetToFactorsConfig getAllFactors](self->_assetSetToFactorsConfig, "getAllFactors");
}

- (id)getAllAssetSets
{
  return -[CDMAssetSetToFactorsConfig getAllAssetSets](self->_assetSetToFactorsConfig, "getAllAssetSets");
}

- (void)setIsAssetRequiredForSetup:(BOOL)a3
{
  self->_isAssetRequiredForSetup = a3;
}

- (id)getCDMAssetFactorToFoldersMappingForAssetSet:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[CDMAssetSetToFactorsConfig getCDMFactorConfigForAssetSet:](self->_assetSetToFactorsConfig, "getCDMFactorConfigForAssetSet:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "getFactorToFoldersMapping");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end

@implementation CDMAssetsInfo

- (void)setAssetsUsages:(id)a3 withCDMAssetsFactorConfig:(id)a4 forCDMAssetSet:(int64_t)a5
{
  NSMutableDictionary *assetSetToUsagesMapping;
  void *v9;
  id v10;
  void *v11;
  id v12;

  assetSetToUsagesMapping = self->_assetSetToUsagesMapping;
  v9 = (void *)MEMORY[0x24BDD16E0];
  v12 = a4;
  v10 = a3;
  objc_msgSend(v9, "numberWithInteger:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](assetSetToUsagesMapping, "setObject:forKey:", v10, v11);

  -[CDMAssetSetToFactorsConfig setCDMAssetsFactorConfig:forAssetSet:](self->_cdmAssetSetToFactorsConfig, "setCDMAssetsFactorConfig:forAssetSet:", v12, a5);
}

- (CDMAssetsInfo)initWithGraphName:(id)a3
{
  id v5;
  CDMAssetsInfo *v6;
  CDMAssetsInfo *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *assetSetToUsagesMapping;
  CDMAssetSetToFactorsConfig *v10;
  CDMAssetSetToFactorsConfig *cdmAssetSetToFactorsConfig;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CDMAssetsInfo;
  v6 = -[CDMAssetsInfo init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphName, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    assetSetToUsagesMapping = v7->_assetSetToUsagesMapping;
    v7->_assetSetToUsagesMapping = v8;

    v10 = objc_alloc_init(CDMAssetSetToFactorsConfig);
    cdmAssetSetToFactorsConfig = v7->_cdmAssetSetToFactorsConfig;
    v7->_cdmAssetSetToFactorsConfig = v10;

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphName, 0);
  objc_storeStrong((id *)&self->_cdmAssetSetToFactorsConfig, 0);
  objc_storeStrong((id *)&self->_assetSetToUsagesMapping, 0);
}

- (id)getCDMAssetsFactorConfigCDMAssetSet:(int64_t)a3
{
  return -[CDMAssetSetToFactorsConfig getCDMFactorConfigForAssetSet:](self->_cdmAssetSetToFactorsConfig, "getCDMFactorConfigForAssetSet:", a3);
}

- (id)getAllAssetSets
{
  return (id)-[NSMutableDictionary allKeys](self->_assetSetToUsagesMapping, "allKeys");
}

- (id)getGraphName
{
  return self->_graphName;
}

- (CDMAssetsInfo)init
{
  CDMAssetsInfo *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *assetSetToUsagesMapping;
  CDMAssetSetToFactorsConfig *v5;
  CDMAssetSetToFactorsConfig *cdmAssetSetToFactorsConfig;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CDMAssetsInfo;
  v2 = -[CDMAssetsInfo init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    assetSetToUsagesMapping = v2->_assetSetToUsagesMapping;
    v2->_assetSetToUsagesMapping = v3;

    v5 = objc_alloc_init(CDMAssetSetToFactorsConfig);
    cdmAssetSetToFactorsConfig = v2->_cdmAssetSetToFactorsConfig;
    v2->_cdmAssetSetToFactorsConfig = v5;

  }
  return v2;
}

- (id)getCDMAssetsUsagesForCDMAssetSet:(int64_t)a3
{
  NSMutableDictionary *assetSetToUsagesMapping;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;

  assetSetToUsagesMapping = self->_assetSetToUsagesMapping;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](assetSetToUsagesMapping, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = self->_assetSetToUsagesMapping;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

@end

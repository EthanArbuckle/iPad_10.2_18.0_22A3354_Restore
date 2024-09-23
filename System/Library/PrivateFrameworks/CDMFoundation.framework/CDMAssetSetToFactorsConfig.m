@implementation CDMAssetSetToFactorsConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSetToFactorsMapping, 0);
}

- (CDMAssetSetToFactorsConfig)init
{
  CDMAssetSetToFactorsConfig *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *assetSetToFactorsMapping;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDMAssetSetToFactorsConfig;
  v2 = -[CDMAssetSetToFactorsConfig init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    assetSetToFactorsMapping = v2->_assetSetToFactorsMapping;
    v2->_assetSetToFactorsMapping = v3;

  }
  return v2;
}

- (id)getCDMFactorConfigForAssetSet:(int64_t)a3
{
  NSMutableDictionary *assetSetToFactorsMapping;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;

  assetSetToFactorsMapping = self->_assetSetToFactorsMapping;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](assetSetToFactorsMapping, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = self->_assetSetToFactorsMapping;
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

- (BOOL)hasAssetSetToFactorsMapping
{
  return -[NSMutableDictionary count](self->_assetSetToFactorsMapping, "count") != 0;
}

- (id)getAllFactors
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDBCEB8]);
  -[NSMutableDictionary allValues](self->_assetSetToFactorsMapping, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allValues](self->_assetSetToFactorsMapping, "allValues", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "getFactorToFoldersMapping");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "allKeys");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)getAllAssetSets
{
  return (id)-[NSMutableDictionary allKeys](self->_assetSetToFactorsMapping, "allKeys");
}

- (void)setCDMAssetsFactorConfig:(id)a3 forAssetSet:(int64_t)a4
{
  NSMutableDictionary *assetSetToFactorsMapping;
  void *v6;
  id v7;
  id v8;

  assetSetToFactorsMapping = self->_assetSetToFactorsMapping;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a3;
  objc_msgSend(v6, "numberWithInteger:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](assetSetToFactorsMapping, "setObject:forKey:", v7, v8);

}

- (id)getAssetSetToFactorsConfigMapping
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", self->_assetSetToFactorsMapping);
}

@end

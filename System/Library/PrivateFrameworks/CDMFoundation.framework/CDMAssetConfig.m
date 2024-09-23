@implementation CDMAssetConfig

- (CDMAssetConfig)init
{
  CDMAssetConfig *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *assetConfigs;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDMAssetConfig;
  v2 = -[CDMAssetConfig init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    assetConfigs = v2->_assetConfigs;
    v2->_assetConfigs = v3;

  }
  return v2;
}

- (id)getAssetConfigItems
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", self->_assetConfigs);
}

- (BOOL)hasAssetConfigItems
{
  return -[NSMutableDictionary count](self->_assetConfigs, "count") != 0;
}

- (id)getAssetConfigItemForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_assetConfigs, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_assetConfigs, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)addAssetConfigItem:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setValue:forKey:](self->_assetConfigs, "setValue:forKey:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetConfigs, 0);
}

@end

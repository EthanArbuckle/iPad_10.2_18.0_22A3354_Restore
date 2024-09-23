@implementation CDMAssetsUsages

- (CDMAssetsUsages)init
{
  CDMAssetsUsages *v2;
  uint64_t v3;
  NSMutableDictionary *usages;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDMAssetsUsages;
  v2 = -[CDMAssetsUsages init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    usages = v2->_usages;
    v2->_usages = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (BOOL)addUsageForKey:(int64_t)a3 withAssetUsageValue:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *usages;
  void *v9;
  NSObject *v10;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  +[CDMAssetsUsages cdmAssetsUsageKeyToString:](CDMAssetsUsages, "cdmAssetsUsageKeyToString:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    usages = self->_usages;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](usages, "setObject:forKey:", v6, v9);

  }
  else
  {
    CDMOSLoggerForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315394;
      v14 = "-[CDMAssetsUsages addUsageForKey:withAssetUsageValue:]";
      v15 = 2112;
      v16 = v12;
      _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s No assets usage key string found for %@", (uint8_t *)&v13, 0x16u);

    }
  }

  return v7 != 0;
}

+ (id)cdmAssetsUsageKeyToString:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 0;
  else
    return off_24DCACD60[a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usages, 0);
}

- (id)getUsages
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", -[NSMutableDictionary count](self->_usages, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_usages;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        +[CDMAssetsUsages cdmAssetsUsageKeyToString:](CDMAssetsUsages, "cdmAssetsUsageKeyToString:", objc_msgSend(v9, "integerValue", (_QWORD)v13));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_usages, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v10);

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

@end

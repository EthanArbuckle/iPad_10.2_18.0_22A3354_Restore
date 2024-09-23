@implementation CDMUAFClientManager

- (UAFAssetSet)assetSet
{
  return self->_assetSet;
}

- (void)setLocale:(id)a3
{
  id v4;
  CDMUAFClientManager *v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  BOOL v21;
  uint64_t v22;
  NSDictionary *v23;
  NSDictionary *usages;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  NSDictionary *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[CDMUAFClientManager getLocale](v5, "getLocale");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v4)
  {
    CDMOSLoggerForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      usages = v5->_usages;
      *(_DWORD *)buf = 136315650;
      v31 = "-[CDMUAFClientManager setLocale:]";
      v32 = 2112;
      v33 = usages;
      v34 = 2112;
      v35 = v4;
      _os_log_debug_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_DEBUG, "%s Updating locale for usage: %@ to %@.", buf, 0x20u);
    }

    v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[NSDictionary keyEnumerator](v5->_usages, "keyEnumerator", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v9);
          v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          -[NSDictionary objectForKey:](v5->_usages, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKey:", v14, v13);

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v10);
    }

    +[CDMAssetsUsages cdmAssetsUsageKeyToString:](CDMAssetsUsages, "cdmAssetsUsageKeyToString:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMAssetsUsages cdmAssetsUsageKeyToString:](CDMAssetsUsages, "cdmAssetsUsageKeyToString:", 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17 == 0;

    v19 = v15;
    if (!v18
      || (objc_msgSend(v8, "objectForKey:", v16, v15),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = v20 == 0,
          v20,
          v19 = v16,
          !v21))
    {
      objc_msgSend(v8, "setObject:forKey:", v4, v19);
    }
    v22 = objc_msgSend(v8, "copy");
    v23 = v5->_usages;
    v5->_usages = (NSDictionary *)v22;

    -[CDMUAFClientManager initUAFAssetSet](v5, "initUAFAssetSet");
  }
  objc_sync_exit(v5);

}

- (id)getLocale
{
  CDMUAFClientManager *v2;
  void *v3;
  void *v4;
  void *v5;
  NSDictionary *usages;
  void *v7;
  void *v8;

  v2 = self;
  objc_sync_enter(v2);
  +[CDMAssetsUsages cdmAssetsUsageKeyToString:](CDMAssetsUsages, "cdmAssetsUsageKeyToString:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMAssetsUsages cdmAssetsUsageKeyToString:](CDMAssetsUsages, "cdmAssetsUsageKeyToString:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](v2->_usages, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  usages = v2->_usages;
  if (v5)
  {
    v7 = v3;
LABEL_5:
    -[NSDictionary objectForKey:](usages, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[NSDictionary objectForKey:](usages, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    usages = v2->_usages;
    v7 = v4;
    goto LABEL_5;
  }
LABEL_6:

  objc_sync_exit(v2);
  return v8;
}

- (NSDictionary)usages
{
  return self->_usages;
}

- (id)getAssetSet
{
  CDMUAFClientManager *v2;
  UAFAssetSet *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_assetSet;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)assetSetName
{
  return self->_assetSetName;
}

- (CDMUAFClientManager)initWithAssetSet:(id)a3 usages:(id)a4
{
  id v7;
  id v8;
  CDMUAFClientManager *v9;
  CDMUAFClientManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMUAFClientManager;
  v9 = -[CDMUAFClientManager init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetSetName, a3);
    objc_storeStrong((id *)&v10->_usages, a4);
  }

  return v10;
}

- (BOOL)shouldInitUAFAssetSetInSetupForLocale:(id)a3
{
  id v4;
  CDMUAFClientManager *v5;
  id v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  NSString *assetSetName;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  BOOL v16;
  const char *v17;
  NSString *v19;
  UAFAssetSet *assetSet;
  NSDictionary *usages;
  int v22;
  const char *v23;
  __int16 v24;
  NSString *v25;
  __int16 v26;
  UAFAssetSet *v27;
  __int16 v28;
  NSDictionary *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  v7 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v8 = (id)CDMLogContext;
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    assetSetName = v5->_assetSetName;
    v22 = 138412290;
    v23 = (const char *)assetSetName;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CDMUAFClientManager", "getAssets in shouldInitUAFAssetSetInSetup %@", (uint8_t *)&v22, 0xCu);
  }

  -[UAFAssetSet assets](v5->_assetSet, "assets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (id)CDMLogContext;
  v13 = v12;
  if (v7 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v12))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v13, OS_SIGNPOST_INTERVAL_END, v7, "CDMUAFClientManager", " enableTelemetry=YES ", (uint8_t *)&v22, 2u);
  }

  CDMOSLoggerForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    assetSet = v5->_assetSet;
    v19 = v5->_assetSetName;
    usages = v5->_usages;
    v22 = 136316162;
    v23 = "-[CDMUAFClientManager shouldInitUAFAssetSetInSetupForLocale:]";
    v24 = 2112;
    v25 = v19;
    v26 = 2112;
    v27 = assetSet;
    v28 = 2112;
    v29 = usages;
    v30 = 2112;
    v31 = v11;
    _os_log_debug_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_DEBUG, "%s uafClientManager.assetSetName %@ has assetSet %@ has usages %@ has assets %@", (uint8_t *)&v22, 0x34u);
  }

  if (!v5->_assetSet)
  {
    CDMOSLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
LABEL_17:
      v16 = 1;
      goto LABEL_18;
    }
    v22 = 136315138;
    v23 = "-[CDMUAFClientManager shouldInitUAFAssetSetInSetupForLocale:]";
    v17 = "%s assetSet does not exist. Asset cache miss. Return Yes";
LABEL_20:
    _os_log_debug_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_DEBUG, v17, (uint8_t *)&v22, 0xCu);
    goto LABEL_17;
  }
  if (!objc_msgSend(v11, "count"))
  {
    CDMOSLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    v22 = 136315138;
    v23 = "-[CDMUAFClientManager shouldInitUAFAssetSetInSetupForLocale:]";
    v17 = "%s No assets exist in assetSet. Asset cache miss. Return Yes";
    goto LABEL_20;
  }
  CDMOSLoggerForCategory(0);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v22 = 136315138;
    v23 = "-[CDMUAFClientManager shouldInitUAFAssetSetInSetupForLocale:]";
    _os_log_debug_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_DEBUG, "%s Asset cache hit. No need to get new assetSet in setup. Return No", (uint8_t *)&v22, 0xCu);
  }
  v16 = 0;
LABEL_18:

  objc_sync_exit(v5);
  return v16;
}

- (void)initUAFAssetSet
{
  CDMUAFClientManager *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  UAFAssetSet *assetSet;
  NSObject *v7;
  NSString *assetSetName;
  NSString *v9;
  UAFAssetSet *v10;
  NSDictionary *usages;
  int v12;
  const char *v13;
  __int16 v14;
  NSString *v15;
  __int16 v16;
  UAFAssetSet *v17;
  __int16 v18;
  NSDictionary *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  CDMOSLoggerForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    assetSetName = v2->_assetSetName;
    v12 = 136315394;
    v13 = "-[CDMUAFClientManager initUAFAssetSet]";
    v14 = 2112;
    v15 = assetSetName;
    _os_log_debug_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_DEBUG, "%s Start to init UAF client for AssetSet: %@.", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BEBEE70], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "retrieveAssetSet:usages:", v2->_assetSetName, v2->_usages);
  v5 = objc_claimAutoreleasedReturnValue();
  assetSet = v2->_assetSet;
  v2->_assetSet = (UAFAssetSet *)v5;

  CDMOSLoggerForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = v2->_assetSet;
    v9 = v2->_assetSetName;
    usages = v2->_usages;
    v12 = 136315906;
    v13 = "-[CDMUAFClientManager initUAFAssetSet]";
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = usages;
    _os_log_debug_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_DEBUG, "%s uafClientManager.assetSetName %@ has new assetSet %@ has usages %@", (uint8_t *)&v12, 0x2Au);
  }

  objc_sync_exit(v2);
}

- (void)setAssetSet:(id)a3
{
  UAFAssetSet *v4;
  UAFAssetSet *assetSet;
  CDMUAFClientManager *obj;

  v4 = (UAFAssetSet *)a3;
  obj = self;
  objc_sync_enter(obj);
  assetSet = obj->_assetSet;
  obj->_assetSet = v4;

  objc_sync_exit(obj);
}

- (id)description
{
  CDMUAFClientManager *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[CDMUAFClientManager] - assetSetName: %@, Usages: %@."), v2->_assetSetName, v2->_usages);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (id)getFactors
{
  CDMUAFClientManager *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x24BEBEE70], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetNamesForAssetSet:usages:", v2->_assetSetName, v2->_usages);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usages, 0);
  objc_storeStrong((id *)&self->_assetSetName, 0);
  objc_storeStrong((id *)&self->_assetSet, 0);
}

@end

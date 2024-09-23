@implementation FedStatsCohortQueryInstalledApps

- (FedStatsCohortQueryInstalledApps)init
{
  FedStatsCohortQueryInstalledApps *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSDictionary *domainToBundleIds;
  void *v20;
  void *v21;
  objc_super v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v23.receiver = self;
  v23.super_class = (Class)FedStatsCohortQueryInstalledApps;
  v2 = -[FedStatsCohortQueryInstalledApps init](&v23, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_250C5B110);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)INTENT_MEDIA_SUPPORTED_CATEGORIES;
    INTENT_MEDIA_SUPPORTED_CATEGORIES = v3;

    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithObjects:", v7, v9, v11, v13, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)INTENT_MEDIA_SUPPORTED_INTENTS;
    INTENT_MEDIA_SUPPORTED_INTENTS = v14;

    v24[0] = CFSTR("media");
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = CFSTR("phone");
    v25[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v18 = objc_claimAutoreleasedReturnValue();
    domainToBundleIds = v2->_domainToBundleIds;
    v2->_domainToBundleIds = (NSDictionary *)v18;

    -[FedStatsCohortQueryInstalledApps resolveDomainToBundleIds](v2, "resolveDomainToBundleIds");
    -[NSDictionary objectForKeyedSubscript:](v2->_domainToBundleIds, "objectForKeyedSubscript:", CFSTR("media"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_numOfMediaApps = objc_msgSend(v20, "count");

    -[NSDictionary objectForKeyedSubscript:](v2->_domainToBundleIds, "objectForKeyedSubscript:", CFSTR("phone"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_numOfPhoneApps = objc_msgSend(v21, "count");

  }
  return v2;
}

- (id)cohortKeyForParameters:(id)a3 possibleError:(id *)a4
{
  +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 300, CFSTR("Invalid call to FedStatsCohortQueryInstalledApps#.cohortKeyForParameters"));
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  return 0;
}

+ (id)cohortInstance
{
  return objc_alloc_init((Class)a1);
}

- (void)resolveDomainToBundleIds
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_23B425000, v3, OS_LOG_TYPE_INFO, "FedStatsCohortQueryInstalledApps#resolveDomainToBundleIds start.", (uint8_t *)&v9, 2u);
  }

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FedStatsCohortQueryInstalledApps lsAppRecords](self, "lsAppRecords");
  -[FedStatsCohortQueryInstalledApps lsPluginKitExtensions](self, "lsPluginKitExtensions");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v4);
  v7 = v6;

  +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 134217984;
    v10 = v7;
    _os_log_impl(&dword_23B425000, v8, OS_LOG_TYPE_INFO, "FedStatsCohortQueryInstalledApps#resolveDomainToBundleIds complete in %fms", (uint8_t *)&v9, 0xCu);
  }

}

- (void)lsAppRecords
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  FedStatsCohortQueryInstalledApps *v17;
  unint64_t v18;
  unint64_t v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = (void *)v4;
    v7 = 0x250C57000uLL;
    *(_QWORD *)&v5 = 138412290;
    v23 = v5;
    v8 = CFSTR("media");
    v9 = 0x24BDBC000uLL;
    v24 = v3;
    do
    {
      objc_msgSend(v6, "bundleIdentifier", v23);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = *(void **)(v9 + 3872);
        objc_msgSend(v6, "supportedIntentMediaCategories");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setWithArray:", v12);
        v13 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "supportedIntents");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[FedStatsCohortQueryInstalledApps _isSupportedIntentMediaApp:::](self, "_isSupportedIntentMediaApp:::", v10, v13, v14))
        {
          -[NSDictionary objectForKeyedSubscript:](self->_domainToBundleIds, "objectForKeyedSubscript:", v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v10);

          objc_msgSend(*(id *)(v7 + 3288), "logger");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v6, "supportedIntentMediaCategories");
            v17 = self;
            v18 = v7;
            v19 = v9;
            v20 = v8;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v26 = v10;
            v27 = 2112;
            v28 = v14;
            v29 = 2112;
            v30 = v21;
            _os_log_impl(&dword_23B425000, v16, OS_LOG_TYPE_INFO, "bundle record: %@ has supported intent %@ and supported media categories: %@", buf, 0x20u);

            v8 = v20;
            v9 = v19;
            v7 = v18;
            self = v17;
            v3 = v24;
          }

        }
      }
      else
      {
        objc_msgSend(*(id *)(v7 + 3288), "logger");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v23;
          v26 = v6;
          _os_log_error_impl(&dword_23B425000, v13, OS_LOG_TYPE_ERROR, "Error enumerating app records; app record: %@ has nil bundle identifier",
            buf,
            0xCu);
        }
      }

      objc_msgSend(v3, "nextObject");
      v22 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v22;
    }
    while (v22);
  }

}

- (void)lsPluginKitExtensions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  FedStatsCohortQueryInstalledApps *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)INTENT_MEDIA_SUPPORTED_INTENTS, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDD9958];
  v5 = *MEMORY[0x24BDD98C0];
  v12[0] = *MEMORY[0x24BDD0C48];
  v12[1] = v5;
  v13[0] = v4;
  v13[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__FedStatsCohortQueryInstalledApps_lsPluginKitExtensions__block_invoke;
  v9[3] = &unk_250C58058;
  v10 = v6;
  v11 = self;
  v8 = v6;
  objc_msgSend(v7, "enumeratePluginsMatchingQuery:withBlock:", v8, v9);

}

void __57__FedStatsCohortQueryInstalledApps_lsPluginKitExtensions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __57__FedStatsCohortQueryInstalledApps_lsPluginKitExtensions__block_invoke_cold_2(a1, v6, v7);
  }
  else
  {
    objc_msgSend(v5, "containingBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v5);
      v9 = objc_claimAutoreleasedReturnValue();
      INSupportedMediaCategories();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForInfoDictionaryKey:ofClass:inScope:", *MEMORY[0x24BDD98C8], objc_opt_class(), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(*(id *)(a1 + 40), "_isSupportedIntentMediaApp:::", v7, v10, v11))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectForKeyedSubscript:", CFSTR("media"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v13);

        +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v5, "bundleIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 138412802;
          v17 = v15;
          v18 = 2112;
          v19 = v11;
          v20 = 2112;
          v21 = v10;
          _os_log_impl(&dword_23B425000, v14, OS_LOG_TYPE_INFO, "pluginkit record: %@ has supported intent %@ and supported media categories: %@", (uint8_t *)&v16, 0x20u);

        }
      }

    }
    else
    {
      +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __57__FedStatsCohortQueryInstalledApps_lsPluginKitExtensions__block_invoke_cold_1((uint64_t)v5, v9);
    }

  }
}

- (BOOL)_isSupportedIntentMediaApp:(id)a3 :(id)a4 :(id)a5
{
  id v7;
  id v8;
  id v9;
  BOOL v10;
  void *v12;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.Music")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.podcasts")) & 1) != 0)
  {
    v10 = 1;
  }
  else if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", INTENT_MEDIA_SUPPORTED_CATEGORIES);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "intersectSet:", v8);
    if (objc_msgSend(v12, "count") && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", INTENT_MEDIA_SUPPORTED_INTENTS);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "intersectSet:", v14);

      v10 = objc_msgSend(v13, "count") != 0;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)numOfMediaApps
{
  return self->_numOfMediaApps;
}

- (unint64_t)numOfPhoneApps
{
  return self->_numOfPhoneApps;
}

- (NSDictionary)domainToBundleIds
{
  return self->_domainToBundleIds;
}

- (void)setDomainToBundleIds:(id)a3
{
  objc_storeStrong((id *)&self->_domainToBundleIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainToBundleIds, 0);
}

void __57__FedStatsCohortQueryInstalledApps_lsPluginKitExtensions__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_23B425000, a2, OS_LOG_TYPE_ERROR, "Error enumerating plugins; missing containing bundle of plugin: %@",
    (uint8_t *)&v2,
    0xCu);
}

void __57__FedStatsCohortQueryInstalledApps_lsPluginKitExtensions__block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_23B425000, a3, OS_LOG_TYPE_ERROR, "Error enumerating plugins; matching query: %@, error: %@",
    (uint8_t *)&v6,
    0x16u);

}

@end

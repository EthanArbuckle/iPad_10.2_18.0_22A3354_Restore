@implementation DOCProtectedAppContainerCache

+ (BOOL)enabled
{
  if (enabled_onceToken != -1)
    dispatch_once(&enabled_onceToken, &__block_literal_global_16);
  return enabled_enabled;
}

BOOL __40__DOCProtectedAppContainerCache_enabled__block_invoke()
{
  _BOOL8 result;

  result = +[DOCFeature protectedAppsEnabled](DOCFeature, "protectedAppsEnabled");
  enabled_enabled = result;
  return result;
}

- (DOCProtectedAppContainerCache)initWithDelegate:(id)a3
{
  id v4;
  DOCProtectedAppContainerCache *v5;
  DOCProtectedAppContainerCache *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DOCProtectedAppContainerCache;
  v5 = -[DOCProtectedAppContainerCache init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_cacheStatus = 0;
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  NSMutableArray *appList;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v11.receiver = self;
  v11.super_class = (Class)DOCProtectedAppContainerCache;
  -[DOCProtectedAppContainerCache description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DOCProtectedAppContainerCache cacheStatus](self, "cacheStatus");
  v6 = -[NSMutableArray count](self->_appList, "count");
  appList = self->_appList;
  -[NSMutableDictionary allKeys](self->_oidToAppMap, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ cacheStatus=%lu, app count: %lu, apps=%@, oids=%@"), v4, v5, v6, appList, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSArray)apps
{
  NSMutableArray *appList;

  -[DOCProtectedAppContainerCache fetchAllAppContainerIDsFromCoreSpotlightIfNeeded](self, "fetchAllAppContainerIDsFromCoreSpotlightIfNeeded");
  if (self->_appList)
    appList = self->_appList;
  else
    appList = (NSMutableArray *)MEMORY[0x24BDBD1A8];
  return (NSArray *)appList;
}

- (id)appForAppContainerOID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[DOCProtectedAppContainerCache fetchAllAppContainerIDsFromCoreSpotlightIfNeeded](self, "fetchAllAppContainerIDsFromCoreSpotlightIfNeeded");
  -[NSMutableDictionary objectForKey:](self->_oidToAppMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)appForAppContainerBundleID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[DOCProtectedAppContainerCache fetchAllAppContainerIDsFromCoreSpotlightIfNeeded](self, "fetchAllAppContainerIDsFromCoreSpotlightIfNeeded");
  -[NSMutableDictionary objectForKey:](self->_appIdToAppMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)appForAppContainerOID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__DOCProtectedAppContainerCache_appForAppContainerOID_completion___block_invoke;
  v10[3] = &unk_24C0FEEA8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[DOCProtectedAppContainerCache fetchAllAppContainerIDsFromCoreSpotlightAsync:](self, "fetchAllAppContainerIDsFromCoreSpotlightAsync:", v10);

}

void __66__DOCProtectedAppContainerCache_appForAppContainerOID_completion___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[6] + 16))();

}

- (void)appForAppContainerBundleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71__DOCProtectedAppContainerCache_appForAppContainerBundleID_completion___block_invoke;
  v10[3] = &unk_24C0FEEA8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[DOCProtectedAppContainerCache fetchAllAppContainerIDsFromCoreSpotlightAsync:](self, "fetchAllAppContainerIDsFromCoreSpotlightAsync:", v10);

}

void __71__DOCProtectedAppContainerCache_appForAppContainerBundleID_completion___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[6] + 16))();

}

- (void)fetchAllAppContainerIDsFromCoreSpotlightIfNeeded
{
  OUTLINED_FUNCTION_2_2(&dword_2090A2000, a1, a3, "[PROTECTED APPS] AppCache: %s items already fetched. Skipping Spotlight request", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __81__DOCProtectedAppContainerCache_fetchAllAppContainerIDsFromCoreSpotlightIfNeeded__block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v2 = docLogHandle;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __81__DOCProtectedAppContainerCache_fetchAllAppContainerIDsFromCoreSpotlightIfNeeded__block_invoke_cold_1(a1, v2);
}

- (void)fetchAllAppContainerIDsFromCoreSpotlightAsync:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[5];
  void (**v41)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v5 = docLogHandle;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DOCProtectedAppContainerCache fetchAllAppContainerIDsFromCoreSpotlightAsync:].cold.6(v5, v6, v7, v8, v9, v10, v11, v12);
  if ((objc_msgSend((id)objc_opt_class(), "enabled") & 1) == 0)
  {
    v16 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v16 = docLogHandle;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[DOCProtectedAppContainerCache fetchAllAppContainerIDsFromCoreSpotlightAsync:].cold.5(v16, v17, v18, v19, v20, v21, v22, v23);
    goto LABEL_20;
  }
  -[DOCProtectedAppContainerCache appProtectionContext](self, "appProtectionContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasAnyProtectedApps");

  if ((v14 & 1) == 0)
  {
    v24 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v24 = docLogHandle;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[DOCProtectedAppContainerCache fetchAllAppContainerIDsFromCoreSpotlightAsync:].cold.4(v24, v25, v26, v27, v28, v29, v30, v31);
    goto LABEL_20;
  }
  if (-[DOCProtectedAppContainerCache cacheStatus](self, "cacheStatus"))
  {
    v15 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v15 = docLogHandle;
    }
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      goto LABEL_20;
    goto LABEL_11;
  }
  if (-[DOCProtectedAppContainerCache cacheStatus](self, "cacheStatus"))
  {
    v15 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v15 = docLogHandle;
    }
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      goto LABEL_20;
LABEL_11:
    -[DOCProtectedAppContainerCache fetchAllAppContainerIDsFromCoreSpotlightAsync:].cold.2(v15);
LABEL_20:
    v4[2](v4);
    goto LABEL_21;
  }
  -[DOCProtectedAppContainerCache setCacheStatus:](self, "setCacheStatus:", 1);
  v32 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v32 = docLogHandle;
  }
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    -[DOCProtectedAppContainerCache fetchAllAppContainerIDsFromCoreSpotlightAsync:].cold.1(v32, v33, v34, v35, v36, v37, v38, v39);
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __79__DOCProtectedAppContainerCache_fetchAllAppContainerIDsFromCoreSpotlightAsync___block_invoke;
  v40[3] = &unk_24C0FF420;
  v40[4] = self;
  v41 = v4;
  -[DOCProtectedAppContainerCache lookupOIDs:](self, "lookupOIDs:", v40);

LABEL_21:
}

void __79__DOCProtectedAppContainerCache_fetchAllAppContainerIDsFromCoreSpotlightAsync___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_msgSend(a2, "mutableCopy");
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 8);
  *(_QWORD *)(v13 + 8) = v12;

  v15 = objc_msgSend(v11, "copy");
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 16);
  *(_QWORD *)(v16 + 16) = v15;

  v18 = objc_msgSend(v10, "copy");
  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(void **)(v19 + 24);
  *(_QWORD *)(v19 + 24) = v18;

  v21 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v21 = docLogHandle;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    __79__DOCProtectedAppContainerCache_fetchAllAppContainerIDsFromCoreSpotlightAsync___block_invoke_cold_1();
  objc_msgSend(*(id *)(a1 + 32), "setCacheStatus:", 2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appProtectionCacheDidUpdate:", *(_QWORD *)(a1 + 32));

}

- (CSSearchQuery)searchQuery
{
  CSSearchQuery *searchQuery;
  id v4;
  CSSearchQuery *v5;
  CSSearchQuery *v6;

  searchQuery = self->_searchQuery;
  if (!searchQuery)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDC2468]);
    objc_msgSend(v4, "setFetchAttributes:", &unk_24C10A578);
    v5 = (CSSearchQuery *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2460]), "initWithQueryString:queryContext:", CFSTR("FPAppContainerBundleID == *"), v4);
    v6 = self->_searchQuery;
    self->_searchQuery = v5;

    searchQuery = self->_searchQuery;
  }
  return searchQuery;
}

- (void)lookupOIDs:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFAbsoluteTime Current;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25[2];
  id location;
  _QWORD v27[4];
  id v28;
  CFAbsoluteTime v29;

  v4 = a3;
  v5 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v5 = docLogHandle;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DOCProtectedAppContainerCache lookupOIDs:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __44__DOCProtectedAppContainerCache_lookupOIDs___block_invoke;
  v27[3] = &unk_24C0FF448;
  v29 = Current;
  v16 = v14;
  v28 = v16;
  -[DOCProtectedAppContainerCache searchQuery](self, "searchQuery");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFoundItemsHandler:", v27);

  objc_initWeak(&location, self);
  v22[0] = v15;
  v22[1] = 3221225472;
  v22[2] = __44__DOCProtectedAppContainerCache_lookupOIDs___block_invoke_18;
  v22[3] = &unk_24C0FF498;
  objc_copyWeak(v25, &location);
  v18 = v16;
  v23 = v18;
  v25[1] = *(id *)&Current;
  v19 = v4;
  v24 = v19;
  -[DOCProtectedAppContainerCache searchQuery](self, "searchQuery");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCompletionHandler:", v22);

  -[DOCProtectedAppContainerCache searchQuery](self, "searchQuery");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "start");

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);

}

void __44__DOCProtectedAppContainerCache_lookupOIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double Current;
  double v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  BOOL v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  Current = CFAbsoluteTimeGetCurrent();
  v5 = *(double *)(a1 + 40);
  v6 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v6 = docLogHandle;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v30 = v6;
    v31 = objc_msgSend(v3, "count");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", Current - v5);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v40 = "-[DOCProtectedAppContainerCache lookupOIDs:]_block_invoke";
    v41 = 2048;
    v42 = v31;
    v43 = 2112;
    v44 = v32;
    _os_log_debug_impl(&dword_2090A2000, v30, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] AppCache: %s found items: %lu took: %@ ms", buf, 0x20u);

  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v35;
    v33 = v7;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v13 = CFAbsoluteTimeGetCurrent();
        v14 = *(double *)(a1 + 40);
        objc_msgSend(v12, "attributeSet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "attributeForKey:", CFSTR("FPAppContainerBundleID"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "attributeSet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "attributeForKey:", CFSTR("_kMDItemOID"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = docLogHandle;
        if (!docLogHandle)
        {
          DOCInitLogging();
          v19 = docLogHandle;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          v27 = (void *)MEMORY[0x24BDD16E0];
          v28 = v19;
          objc_msgSend(v27, "numberWithDouble:", v13 - v14);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v40 = "-[DOCProtectedAppContainerCache lookupOIDs:]_block_invoke";
          v41 = 2112;
          v42 = (uint64_t)v12;
          v43 = 2112;
          v44 = v29;
          _os_log_debug_impl(&dword_2090A2000, v28, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] AppCache: %s found item: %@ took: %@ ms", buf, 0x20u);

          v7 = v33;
        }
        if (v16)
          v20 = v18 == 0;
        else
          v20 = 1;
        if (v20)
        {
          v21 = docLogHandle;
          if (!docLogHandle)
          {
            DOCInitLogging();
            v21 = docLogHandle;
          }
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v40 = "-[DOCProtectedAppContainerCache lookupOIDs:]_block_invoke";
            v41 = 2112;
            v42 = (uint64_t)v16;
            v43 = 2112;
            v44 = v18;
            _os_log_debug_impl(&dword_2090A2000, v21, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] AppCache: %s appID: %@ or oid: %@ were nil, skipping", buf, 0x20u);
          }
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v16);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v22)
          {
            objc_msgSend(v22, "addObject:", v18);
            v24 = docLogHandle;
            if (!docLogHandle)
            {
              DOCInitLogging();
              v24 = docLogHandle;
            }
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              v40 = "-[DOCProtectedAppContainerCache lookupOIDs:]_block_invoke";
              v41 = 2112;
              v42 = (uint64_t)v16;
              v43 = 2112;
              v44 = v18;
              _os_log_debug_impl(&dword_2090A2000, v24, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] AppCache: %s existing appID: %@ adding oid: %@ to cache", buf, 0x20u);
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCEF0], "set");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v18);
            objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v25, v16);

            v7 = v33;
          }
          v26 = docLogHandle;
          if (!docLogHandle)
          {
            DOCInitLogging();
            v26 = docLogHandle;
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v40 = "-[DOCProtectedAppContainerCache lookupOIDs:]_block_invoke";
            v41 = 2112;
            v42 = (uint64_t)v16;
            v43 = 2112;
            v44 = v18;
            _os_log_debug_impl(&dword_2090A2000, v26, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] AppCache: %s adding appID: %@ oid: %@ to cache", buf, 0x20u);
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v9);
  }

}

void __44__DOCProtectedAppContainerCache_lookupOIDs___block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __44__DOCProtectedAppContainerCache_lookupOIDs___block_invoke_2;
    v7[3] = &unk_24C0FF470;
    v9 = *(_QWORD *)(a1 + 56);
    v5 = *(_QWORD *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(WeakRetained, "createProtectedAppLookupTablesFromResultSet:completionHandler:", v5, v7);

  }
  else
  {
    v6 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v6 = docLogHandle;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __44__DOCProtectedAppContainerCache_lookupOIDs___block_invoke_18_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __44__DOCProtectedAppContainerCache_lookupOIDs___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  double Current;
  double v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = a2;
  Current = CFAbsoluteTimeGetCurrent();
  v14 = *(double *)(a1 + 40);
  v15 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v15 = docLogHandle;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = (void *)MEMORY[0x24BDD16E0];
    v17 = v15;
    objc_msgSend(v16, "numberWithDouble:", Current - v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 136315650;
    v20 = "-[DOCProtectedAppContainerCache lookupOIDs:]_block_invoke_2";
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v18;
    _os_log_debug_impl(&dword_2090A2000, v17, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] AppCache: %s finished searching for all app container items. Error: %@. Took: %@ ms", (uint8_t *)&v19, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)createProtectedAppLookupTablesFromResultSet:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  void (**v7)(id, id, id, id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDBCEB8];
  v7 = (void (**)(id, id, id, id, _QWORD))a4;
  objc_msgSend(v6, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v11 = docLogHandle;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[DOCProtectedAppContainerCache createProtectedAppLookupTablesFromResultSet:completionHandler:].cold.2();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __95__DOCProtectedAppContainerCache_createProtectedAppLookupTablesFromResultSet_completionHandler___block_invoke;
  v16[3] = &unk_24C0FF4C0;
  v12 = v8;
  v17 = v12;
  v13 = v9;
  v18 = v13;
  v14 = v10;
  v19 = v14;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v16);
  v15 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v15 = docLogHandle;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[DOCProtectedAppContainerCache createProtectedAppLookupTablesFromResultSet:completionHandler:].cold.1();
  v7[2](v7, v12, v13, v14, 0);

}

void __95__DOCProtectedAppContainerCache_createProtectedAppLookupTablesFromResultSet_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  DOCProtectedApp *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = -[DOCProtectedApp initWith:oids:]([DOCProtectedApp alloc], "initWith:oids:", v5, v6);
  objc_msgSend(a1[4], "addObject:", v7);
  objc_msgSend(a1[5], "setObject:forKey:", v7, v5);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(a1[6], "setObject:forKey:", v7, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (DOCAppProtectionContextProviding)appProtectionContext
{
  return (DOCAppProtectionContextProviding *)objc_loadWeakRetained((id *)&self->_appProtectionContext);
}

- (void)setAppProtectionContext:(id)a3
{
  objc_storeWeak((id *)&self->_appProtectionContext, a3);
}

- (DOCProtectedAppContainerCacheDelegate)delegate
{
  return (DOCProtectedAppContainerCacheDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setSearchQuery:(id)a3
{
  objc_storeStrong((id *)&self->_searchQuery, a3);
}

- (unint64_t)cacheStatus
{
  return self->_cacheStatus;
}

- (void)setCacheStatus:(unint64_t)a3
{
  self->_cacheStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_appProtectionContext);
  objc_storeStrong((id *)&self->_oidToAppMap, 0);
  objc_storeStrong((id *)&self->_appIdToAppMap, 0);
  objc_storeStrong((id *)&self->_appList, 0);
}

void __81__DOCProtectedAppContainerCache_fetchAllAppContainerIDsFromCoreSpotlightIfNeeded__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6[6];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "apps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "count");
  v6[0] = 136315394;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_3(&dword_2090A2000, v3, v5, "[PROTECTED APPS] AppCache: %s fetched %lu apps", (uint8_t *)v6);

  OUTLINED_FUNCTION_5_1();
}

- (void)fetchAllAppContainerIDsFromCoreSpotlightAsync:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_2090A2000, a1, a3, "[PROTECTED APPS] AppCache: %s map not generated yet, computing", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)fetchAllAppContainerIDsFromCoreSpotlightAsync:(void *)a1 .cold.2(void *a1)
{
  NSObject *v1;
  id v2;
  uint64_t v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  OUTLINED_FUNCTION_6_0();
  v4[0] = 136315394;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_3(&dword_2090A2000, v1, v3, "[PROTECTED APPS] AppCache: %s cacheStatus: %lu fetching or already fetched, returning", (uint8_t *)v4);

  OUTLINED_FUNCTION_5_1();
}

- (void)fetchAllAppContainerIDsFromCoreSpotlightAsync:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_2090A2000, a1, a3, "[PROTECTED APPS] AppCache: %s no protected apps", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)fetchAllAppContainerIDsFromCoreSpotlightAsync:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_2090A2000, a1, a3, "[PROTECTED APPS] AppCache: %s feature flag disabled", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)fetchAllAppContainerIDsFromCoreSpotlightAsync:(uint64_t)a3 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_2090A2000, a1, a3, "[PROTECTED APPS] AppCache: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __79__DOCProtectedAppContainerCache_fetchAllAppContainerIDsFromCoreSpotlightAsync___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_3(&dword_2090A2000, v0, v1, "[PROTECTED APPS] AppCache: %s received new map. Error: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)lookupOIDs:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_2090A2000, a1, a3, "[PROTECTED APPS] AppCache: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __44__DOCProtectedAppContainerCache_lookupOIDs___block_invoke_18_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_3(&dword_2090A2000, v0, v1, "[PROTECTED APPS] AppCache: %s finished searching for all app container items. Error: %@.", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)createProtectedAppLookupTablesFromResultSet:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_3(&dword_2090A2000, v0, v1, "[PROTECTED APPS] AppCache: %s finished with: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)createProtectedAppLookupTablesFromResultSet:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_3(&dword_2090A2000, v0, v1, "[PROTECTED APPS] AppCache: %s start with: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

@end

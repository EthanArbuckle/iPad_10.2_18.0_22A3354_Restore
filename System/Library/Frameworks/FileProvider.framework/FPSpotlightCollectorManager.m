@implementation FPSpotlightCollectorManager

- (void)enableMountPointQueries
{
  OUTLINED_FUNCTION_0(&dword_1A0A34000, a1, a3, "[DEBUG] SpotlightCollectorManager: Did enable querying mount points", a5, a6, a7, a8, 0);
}

- (NSSet)effectiveCurrentMountPoints
{
  void *v3;
  void *v4;

  if (-[FPSpotlightCollectorManager areMountQueriesEnabled](self, "areMountQueriesEnabled"))
  {
    -[FPSpotlightCollectorManager currentMountPoints](self, "currentMountPoints");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("FPQueryCollectionDefaultMountPointIdentifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSSet *)v4;
}

- (BOOL)areMountQueriesEnabled
{
  return self->_areMountQueriesEnabled;
}

- (NSSet)currentMountPoints
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (FPSpotlightCollectorManager)init
{
  FPSpotlightCollectorManager *v2;
  uint64_t v3;
  NSMutableDictionary *collectorByDescriptor;
  uint64_t v5;
  NSSet *currentMountPoints;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FPSpotlightCollectorManager;
  v2 = -[FPSpotlightCollectorManager init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    collectorByDescriptor = v2->_collectorByDescriptor;
    v2->_collectorByDescriptor = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("FPQueryCollectionDefaultMountPointIdentifier"));
    v5 = objc_claimAutoreleasedReturnValue();
    currentMountPoints = v2->_currentMountPoints;
    v2->_currentMountPoints = (NSSet *)v5;

    v2->_areMountQueriesEnabled = 1;
    -[FPSpotlightCollectorManager _observeFileProviderDomains](v2, "_observeFileProviderDomains");
  }
  return v2;
}

- (void)_observeFileProviderDomains
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id location;

  -[FPSpotlightCollectorManager providerDomainChangesToken](self, "providerDomainChangesToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    location = 0;
    objc_initWeak(&location, self);
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __58__FPSpotlightCollectorManager__observeFileProviderDomains__block_invoke;
    v8 = &unk_1E444E7F8;
    objc_copyWeak(&v9, &location);
    +[FPProviderDomain beginMonitoringProviderDomainChangesWithHandler:](FPProviderDomain, "beginMonitoringProviderDomainChangesWithHandler:", &v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPSpotlightCollectorManager setProviderDomainChangesToken:](self, "setProviderDomainChangesToken:", v4, v5, v6, v7, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)setProviderDomainChangesToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (id)providerDomainChangesToken
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)unregisterDataSource:(id)a3
{
  id v5;
  void *v6;
  FPSpotlightCollectorManager *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v5 = a3;
  objc_msgSend(v5, "queryDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self;
  objc_sync_enter(v7);
  -[NSMutableDictionary objectForKeyedSubscript:](v7->_collectorByDescriptor, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("FPSpotlightCollectorManager.m"), 106, CFSTR("Data source was unregistered but not previously registered"));

  }
  objc_msgSend(v8, "removeObserver:", v5);
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[FPSpotlightCollectorManager unregisterDataSource:].cold.1();

  objc_sync_exit(v7);
}

- (void)registerDataSource:(id)a3
{
  id v4;
  void *v5;
  FPSpotlightCollectorManager *v6;
  FPSpotlightCollector *v7;
  NSObject *v8;

  v4 = a3;
  objc_msgSend(v4, "queryDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self;
  objc_sync_enter(v6);
  -[NSMutableDictionary objectForKeyedSubscript:](v6->_collectorByDescriptor, "objectForKeyedSubscript:", v5);
  v7 = (FPSpotlightCollector *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[FPSpotlightCollector initWithDescriptor:]([FPSpotlightCollector alloc], "initWithDescriptor:", v5);
    -[FPSpotlightCollector setDelegate:](v7, "setDelegate:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_collectorByDescriptor, "setObject:forKeyedSubscript:", v7, v5);
  }
  -[FPSpotlightCollector addObserver:](v7, "addObserver:", v4);
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[FPSpotlightCollectorManager registerDataSource:].cold.1();

  objc_sync_exit(v6);
}

+ (FPSpotlightCollectorManager)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__FPSpotlightCollectorManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once_1 != -1)
    dispatch_once(&sharedInstance_once_1, block);
  return (FPSpotlightCollectorManager *)(id)sharedInstance_sharedInstance;
}

void __58__FPSpotlightCollectorManager__observeFileProviderDomains__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id *v5;
  id WeakRetained;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;

  objc_msgSend(a2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPSpotlightCollectorManager _mountPointsFromProviderDomains:](FPSpotlightCollectorManager, "_mountPointsFromProviderDomains:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "setCurrentMountPoints:", v4);

  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __58__FPSpotlightCollectorManager__observeFileProviderDomains__block_invoke_cold_1(v5, v7);

  v8 = dispatch_time(0, 2000000000);
  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__FPSpotlightCollectorManager__observeFileProviderDomains__block_invoke_11;
  block[3] = &unk_1E44499C0;
  objc_copyWeak(&v11, v5);
  dispatch_after(v8, v9, block);

  objc_destroyWeak(&v11);
}

- (void)setCurrentMountPoints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

+ (id)_mountPointsFromProviderDomains:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "fp_map:", &__block_literal_global_49);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = CFSTR("FPQueryCollectionDefaultMountPointIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __63__FPSpotlightCollectorManager__mountPointsFromProviderDomains___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "spotlightMountPoint");
}

void __45__FPSpotlightCollectorManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;

}

- (NSArray)collectors
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_collectorByDescriptor, "allValues");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[FPSpotlightCollectorManager providerDomainChangesToken](self, "providerDomainChangesToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FPSpotlightCollectorManager providerDomainChangesToken](self, "providerDomainChangesToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[FPProviderDomain endMonitoringProviderDomainChanges:](FPProviderDomain, "endMonitoringProviderDomainChanges:", v4);

    -[FPSpotlightCollectorManager setProviderDomainChangesToken:](self, "setProviderDomainChangesToken:", 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)FPSpotlightCollectorManager;
  -[FPSpotlightCollectorManager dealloc](&v5, sel_dealloc);
}

- (void)suspendCollectors
{
  FPSpotlightCollectorManager *v2;
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  void *v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  -[FPSpotlightCollectorManager collectors](v2, "collectors");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v4)
  {
    v6 = *(_QWORD *)v12;
    *(_QWORD *)&v5 = 138412290;
    v10 = v5;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "suspend", v10, (_QWORD)v11);
        fp_current_or_default_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v10;
          v16 = v8;
          _os_log_debug_impl(&dword_1A0A34000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] SpotlightCollectorManager: Did suspend collector %@", buf, 0xCu);
        }

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (void)resumeCollectors
{
  FPSpotlightCollectorManager *v2;
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  void *v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  -[FPSpotlightCollectorManager collectors](v2, "collectors");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v4)
  {
    v6 = *(_QWORD *)v12;
    *(_QWORD *)&v5 = 138412290;
    v10 = v5;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "resume", v10, (_QWORD)v11);
        fp_current_or_default_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v10;
          v16 = v8;
          _os_log_debug_impl(&dword_1A0A34000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] SpotlightCollectorManager: Did resume collector %@", buf, 0xCu);
        }

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (void)disableMountPointQueries
{
  OUTLINED_FUNCTION_0(&dword_1A0A34000, a1, a3, "[DEBUG] SpotlightCollectorManager: Did disable querying mount points", a5, a6, a7, a8, 0);
}

- (void)collectorDidFinish:(id)a3
{
  id v4;
  FPSpotlightCollectorManager *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(v4, "queryDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](v5->_collectorByDescriptor, "removeObjectForKey:", v6);
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[FPSpotlightCollectorManager collectorDidFinish:].cold.1();

  objc_sync_exit(v5);
}

void __58__FPSpotlightCollectorManager__observeFileProviderDomains__block_invoke_11(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "collectors", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        v9 = objc_loadWeakRetained(v1);
        objc_msgSend(v9, "effectiveCurrentMountPoints");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "mountPointsDidChange:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (id)_recursiveDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  id obj;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[FPSpotlightCollectorManager collectors](self, "collectors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Collector Manager: %@ (%ld collectors)\n"), self, objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v6);

  v7 = 0x1E0CB3000uLL;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[FPSpotlightCollectorManager collectors](self, "collectors");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v37;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v37 != v29)
          objc_enumerationMutation(obj);
        v31 = v8;
        v9 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v8);
        objc_msgSend(v9, "allObservers");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v7 + 2368), "stringWithFormat:", CFSTR("\t\\ Collector: %@ (%ld observers)\n"), v9, objc_msgSend(v10, "count"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v11);

        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v12 = v10;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v33 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v18 = v17;
                objc_msgSend(*(id *)(v7 + 2368), "stringWithFormat:", CFSTR("\t\t\\ Observer %@\n"), v18);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "appendString:", v19);

                objc_msgSend(v18, "delegate");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();

                if ((isKindOfClass & 1) != 0)
                {
                  objc_msgSend(v18, "delegate");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = *(void **)(v7 + 2368);
                  objc_msgSend(v22, "items");
                  v24 = v7;
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "stringWithFormat:", CFSTR("\t\t\t\\ Collection %@ (%ld items)\n"), v22, objc_msgSend(v25, "count"));
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v3, "appendString:", v26);

                  v7 = v24;
                }

              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          }
          while (v14);
        }

        v8 = v31 + 1;
      }
      while (v31 + 1 != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v30);
  }

  NSLog(CFSTR("%@"), v3);
  return v3;
}

- (NSMutableDictionary)collectorByDescriptor
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCollectorByDescriptor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setAreMountQueriesEnabled:(BOOL)a3
{
  self->_areMountQueriesEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectorByDescriptor, 0);
  objc_storeStrong((id *)&self->_currentMountPoints, 0);
  objc_storeStrong(&self->_providerDomainChangesToken, 0);
}

- (void)registerDataSource:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, v0, v1, "[DEBUG] SpotlightCollectorManager: Registered data source %@ for %@");
  OUTLINED_FUNCTION_3();
}

- (void)unregisterDataSource:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, v0, v1, "[DEBUG] SpotlightCollectorManager: Unregistered data source %@ for %@");
  OUTLINED_FUNCTION_3();
}

- (void)collectorDidFinish:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, v0, v1, "[DEBUG] SpotlightCollectorManager: Did remove finished collector %@ for descriptor %@");
  OUTLINED_FUNCTION_3();
}

void __58__FPSpotlightCollectorManager__observeFileProviderDomains__block_invoke_cold_1(id *a1, NSObject *a2)
{
  id WeakRetained;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "currentMountPoints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 134217984;
  v6 = objc_msgSend(v4, "count");
  _os_log_debug_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] SpotlightCollectorManager: Provider domains have changed, number of current mount points: %ld", (uint8_t *)&v5, 0xCu);

}

@end

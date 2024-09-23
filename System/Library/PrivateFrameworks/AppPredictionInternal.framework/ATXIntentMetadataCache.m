@implementation ATXIntentMetadataCache

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ATXIntentMetadataCache_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken6_29 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_29, block);
  return (id)sharedInstance__pasExprOnceResult_38;
}

void __40__ATXIntentMetadataCache_sharedInstance__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1CAA48B6C]();
  v3 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initInternal");
  v4 = (void *)sharedInstance__pasExprOnceResult_38;
  sharedInstance__pasExprOnceResult_38 = v3;

  objc_autoreleasePoolPop(v2);
}

- (id)initInternal
{
  void *v3;
  void *v4;
  ATXIntentMetadataCache *v5;

  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v5 = -[ATXIntentMetadataCache initWithDataStore:cacheInvalidationCriteria:startMonitoring:](self, "initWithDataStore:cacheInvalidationCriteria:startMonitoring:", v3, v4, 1);

  return v5;
}

- (ATXIntentMetadataCache)initWithDataStore:(id)a3 cacheInvalidationCriteria:(id)a4 startMonitoring:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  ATXIntentMetadataCache *v11;
  ATXIntentMetadataCache *v12;
  objc_super v14;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXIntentMetadataCache;
  v11 = -[ATXIntentMetadataCache init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dataStore, a3);
    objc_storeStrong((id *)&v12->_invalidationCriteria, a4);
    if (v5)
      -[ATXIntentMetadataCacheInvalidationMonitor setDelegateAndStartMonitoring:](v12->_invalidationCriteria, "setDelegateAndStartMonitoring:", v12);
  }

  return v12;
}

- (void)setValidParameterCombinationsWithSchema:(id)a3 intent:(id)a4
{
  id v6;
  id v7;
  ATXIntentMetadataCacheKey *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[ATXIntentMetadataCacheKey initWithIntent:includingParameters:]([ATXIntentMetadataCacheKey alloc], "initWithIntent:includingParameters:", v7, 1);
  if (v8 && objc_msgSend(v6, "count"))
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[ATXIntentMetadataCacheKey stringRepresentationForSerialization](v8, "stringRepresentationForSerialization");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v10;
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCache saving parameter combinations for cacheKey: %@", (uint8_t *)&v13, 0xCu);

    }
    -[_ATXDataStore writeValidParameterCombinationsWithSchema:cacheKey:](self->_dataStore, "writeValidParameterCombinationsWithSchema:cacheKey:", v6, v8);
  }
  else
  {
    __atxlog_handle_default();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "_className");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v12;
      _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCache couldn't save parameter combinations for intent: %@", (uint8_t *)&v13, 0xCu);

    }
  }

}

- (id)validParameterCombinationsWithSchemaForIntent:(id)a3
{
  id v4;
  ATXIntentMetadataCacheKey *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ATXIntentMetadataCacheKey initWithIntent:includingParameters:]([ATXIntentMetadataCacheKey alloc], "initWithIntent:includingParameters:", v4, 1);

  if (v5)
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[ATXIntentMetadataCacheKey stringRepresentationForSerialization](v5, "stringRepresentationForSerialization");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "ATXIntentMetadataCache fetching cached parameter combinations for cacheKey: %@", (uint8_t *)&v10, 0xCu);

    }
    -[_ATXDataStore validParameterCombinationsWithSchemaForCacheKey:](self->_dataStore, "validParameterCombinationsWithSchemaForCacheKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)supportsBackgroundExecutionForIntent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  -[ATXIntentMetadataCache _getCachedSupportsBackgroundExecutionForIntent:](self, "_getCachedSupportsBackgroundExecutionForIntent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    LOBYTE(v7) = objc_msgSend(v5, "BOOLValue");
  }
  else
  {
    v7 = objc_msgSend(v4, "atx_supportsBackgroundExecution");
    -[ATXIntentMetadataCache _setSupportsBackgroundExecution:intent:](self, "_setSupportsBackgroundExecution:intent:", v7, v4);
  }

  return v7;
}

- (void)_setSupportsBackgroundExecution:(BOOL)a3 intent:(id)a4
{
  _BOOL8 v4;
  id v6;
  ATXIntentMetadataCacheKey *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v4 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[ATXIntentMetadataCacheKey initWithIntent:includingParameters:]([ATXIntentMetadataCacheKey alloc], "initWithIntent:includingParameters:", v6, 1);
  __atxlog_handle_default();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      -[ATXIntentMetadataCacheKey stringRepresentationForSerialization](v7, "stringRepresentationForSerialization");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCache saving supportsBackgroundExecution for for cacheKey: %@", (uint8_t *)&v12, 0xCu);

    }
    -[_ATXDataStore writeSupportsBackgroundExecution:cacheKey:](self->_dataStore, "writeSupportsBackgroundExecution:cacheKey:", v4, v7);
  }
  else
  {
    if (v9)
    {
      objc_msgSend(v6, "_className");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v11;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCache couldn't save supportsBackgroundExecution for intent: %@", (uint8_t *)&v12, 0xCu);

    }
  }

}

- (id)_getCachedSupportsBackgroundExecutionForIntent:(id)a3
{
  id v4;
  ATXIntentMetadataCacheKey *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ATXIntentMetadataCacheKey initWithIntent:includingParameters:]([ATXIntentMetadataCacheKey alloc], "initWithIntent:includingParameters:", v4, 1);

  if (v5)
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[ATXIntentMetadataCacheKey stringRepresentationForSerialization](v5, "stringRepresentationForSerialization");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "ATXIntentMetadataCache fetching cached supportsBackgroundExecution for cacheKey: %@", (uint8_t *)&v10, 0xCu);

    }
    -[_ATXDataStore supportsBackgroundExecutionForCacheKey:](self->_dataStore, "supportsBackgroundExecutionForCacheKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)titleForIntent:(id)a3 localeIdentifier:(id)a4
{
  id v6;
  id v7;
  ATXIntentMetadataCacheKey *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = -[ATXIntentMetadataCacheKey initWithIntent:includingParameterValues:localeIdentifier:]([ATXIntentMetadataCacheKey alloc], "initWithIntent:includingParameterValues:localeIdentifier:", v6, 1, v7);

  -[ATXIntentMetadataCache _getCachedTitleForCacheKey:](self, "_getCachedTitleForCacheKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v6, "atx_titleWithEfficientLocalization");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[ATXIntentMetadataCache _setTitle:cacheKey:](self, "_setTitle:cacheKey:", v11, v8);
  }

  return v11;
}

- (void)_setTitle:(id)a3 cacheKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  __atxlog_handle_default();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      objc_msgSend(v7, "stringRepresentationForSerialization");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCache saving title for cacheKey: %@", (uint8_t *)&v11, 0xCu);

    }
    -[_ATXDataStore writeTitle:cacheKey:](self->_dataStore, "writeTitle:cacheKey:", v6, v7);
  }
  else
  {
    if (v9)
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCache couldn't save title because cacheKey is nil.", (uint8_t *)&v11, 2u);
    }

  }
}

- (id)_getCachedTitleForCacheKey:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "stringRepresentationForSerialization");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_INFO, "ATXIntentMetadataCache fetching cached title for cacheKey: %@", (uint8_t *)&v9, 0xCu);

    }
    -[_ATXDataStore titleForCacheKey:](self->_dataStore, "titleForCacheKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)subtitleForIntent:(id)a3 localeIdentifier:(id)a4
{
  id v6;
  id v7;
  ATXIntentMetadataCacheKey *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;

  v6 = a3;
  v7 = a4;
  v8 = -[ATXIntentMetadataCacheKey initWithIntent:includingParameterValues:localeIdentifier:]([ATXIntentMetadataCacheKey alloc], "initWithIntent:includingParameterValues:localeIdentifier:", v6, 1, v7);

  -[ATXIntentMetadataCache _getCachedSubtitleForCacheKey:](self, "_getCachedSubtitleForCacheKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v6, "atx_subtitleWithEfficientLocalization");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = &stru_1E82FDC98;
    if (v12)
      v14 = (__CFString *)v12;
    v11 = v14;

    -[ATXIntentMetadataCache _setSubtitle:cacheKey:](self, "_setSubtitle:cacheKey:", v11, v8);
  }

  return v11;
}

- (void)_setSubtitle:(id)a3 cacheKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  __atxlog_handle_default();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      objc_msgSend(v7, "stringRepresentationForSerialization");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCache saving subtitle for cacheKey: %@", (uint8_t *)&v11, 0xCu);

    }
    -[_ATXDataStore writeSubtitle:cacheKey:](self->_dataStore, "writeSubtitle:cacheKey:", v6, v7);
  }
  else
  {
    if (v9)
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCache couldn't save subtitle because cacheKey is nil.", (uint8_t *)&v11, 2u);
    }

  }
}

- (id)_getCachedSubtitleForCacheKey:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "stringRepresentationForSerialization");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_INFO, "ATXIntentMetadataCache fetching cached subtitle for cacheKey: %@", (uint8_t *)&v9, 0xCu);

    }
    -[_ATXDataStore subtitleForCacheKey:](self->_dataStore, "subtitleForCacheKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEligibleForWidgetsForIntent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  -[ATXIntentMetadataCache _getCachedEligibleForWidgetsForIntent:](self, "_getCachedEligibleForWidgetsForIntent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    LOBYTE(v7) = objc_msgSend(v5, "BOOLValue");
  }
  else
  {
    v7 = objc_msgSend(v4, "atx_isEligibleForWidgets");
    -[ATXIntentMetadataCache _setEligibleForWidgets:intent:](self, "_setEligibleForWidgets:intent:", v7, v4);
  }

  return v7;
}

- (void)_setEligibleForWidgets:(BOOL)a3 intent:(id)a4
{
  _BOOL8 v4;
  id v6;
  ATXIntentMetadataCacheKey *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v4 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[ATXIntentMetadataCacheKey initWithIntent:includingParameters:]([ATXIntentMetadataCacheKey alloc], "initWithIntent:includingParameters:", v6, 0);
  __atxlog_handle_default();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      -[ATXIntentMetadataCacheKey stringRepresentationForSerialization](v7, "stringRepresentationForSerialization");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCache saving isEligibleForWidgets for cacheKey: %@", (uint8_t *)&v12, 0xCu);

    }
    -[_ATXDataStore writeEligibleForWidgets:cacheKey:](self->_dataStore, "writeEligibleForWidgets:cacheKey:", v4, v7);
  }
  else
  {
    if (v9)
    {
      objc_msgSend(v6, "_className");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v11;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCache couldn't save isEligibleForWidgets for intent: %@", (uint8_t *)&v12, 0xCu);

    }
  }

}

- (id)_getCachedEligibleForWidgetsForIntent:(id)a3
{
  id v4;
  ATXIntentMetadataCacheKey *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ATXIntentMetadataCacheKey initWithIntent:includingParameters:]([ATXIntentMetadataCacheKey alloc], "initWithIntent:includingParameters:", v4, 0);

  if (v5)
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[ATXIntentMetadataCacheKey stringRepresentationForSerialization](v5, "stringRepresentationForSerialization");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "ATXIntentMetadataCache fetching cached isEligibleForWidgets for cacheKey: %@", (uint8_t *)&v10, 0xCu);

    }
    -[_ATXDataStore isEligibleForWidgetsForCacheKey:](self->_dataStore, "isEligibleForWidgetsForCacheKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)applicationsDidUpdate:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        __atxlog_handle_default();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v16 = v9;
          _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCache invalidating intents due to app registration for bundleId %@", buf, 0xCu);
        }

        -[_ATXDataStore removeCachedIntentsWithBundleId:](self->_dataStore, "removeCachedIntentsWithBundleId:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v6);
  }

}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        __atxlog_handle_default();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v16 = v9;
          _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCache invalidating intents due to app uninstall for bundleId %@", buf, 0xCu);
        }

        -[_ATXDataStore removeCachedIntentsWithBundleId:](self->_dataStore, "removeCachedIntentsWithBundleId:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v6);
  }

}

- (void)systemDidUpdate
{
  NSObject *v3;
  uint8_t v4[16];

  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCache invalidating all intents due to OS update", v4, 2u);
  }

  -[_ATXDataStore removeAllCachedIntents](self->_dataStore, "removeAllCachedIntents");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationCriteria, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
}

@end

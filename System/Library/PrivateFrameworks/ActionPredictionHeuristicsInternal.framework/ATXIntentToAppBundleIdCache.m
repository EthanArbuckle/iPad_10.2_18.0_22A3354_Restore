@implementation ATXIntentToAppBundleIdCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_13);
  return (id)sharedInstance_cache;
}

void __45__ATXIntentToAppBundleIdCache_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_cache;
  sharedInstance_cache = v0;

}

- (ATXIntentToAppBundleIdCache)init
{
  ATXIntentToAppBundleIdCache *v2;
  uint64_t v3;
  NSMutableDictionary *intentTypeToBundleIdsCache;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXIntentToAppBundleIdCache;
  v2 = -[ATXIntentToAppBundleIdCache init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    intentTypeToBundleIdsCache = v2->_intentTypeToBundleIdsCache;
    v2->_intentTypeToBundleIdsCache = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__appRegistrationDidChange_, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__appRegistrationDidChange_, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0);

  }
  return v2;
}

- (void)_appRegistrationDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  ATXIntentToAppBundleIdCache *v6;

  v4 = a3;
  __atxlog_handle_heuristic();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ATXIntentToAppBundleIdCache _appRegistrationDidChange:].cold.1(v5);

  v6 = self;
  objc_sync_enter(v6);
  -[NSMutableDictionary removeAllObjects](v6->_intentTypeToBundleIdsCache, "removeAllObjects");
  objc_sync_exit(v6);

}

- (void)fetchBundleIdsForIntent:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  ATXIntentToAppBundleIdCache *v8;
  NSMutableDictionary *intentTypeToBundleIdsCache;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  v8 = self;
  objc_sync_enter(v8);
  intentTypeToBundleIdsCache = v8->_intentTypeToBundleIdsCache;
  objc_msgSend(v6, "_className");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](intentTypeToBundleIdsCache, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  objc_sync_exit(v8);
  if (v12)
  {
    __atxlog_handle_heuristic();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[ATXIntentToAppBundleIdCache fetchBundleIdsForIntent:completionHandler:].cold.1(v6, (uint64_t)v12, v13);

    v7[2](v7, v12, 0);
  }
  else
  {
    -[ATXIntentToAppBundleIdCache _slowlyFetchBundleIdsForIntent:completionHandler:](v8, "_slowlyFetchBundleIdsForIntent:completionHandler:", v6, v7);
  }

}

- (void)_slowlyFetchBundleIdsForIntent:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)os_transaction_create();
  objc_msgSend(v6, "_className");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  __atxlog_handle_heuristic();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[ATXIntentToAppBundleIdCache _slowlyFetchBundleIdsForIntent:completionHandler:].cold.1((uint64_t)v10, v11);

  v12 = (void *)MEMORY[0x1E0CB35D8];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__ATXIntentToAppBundleIdCache__slowlyFetchBundleIdsForIntent_completionHandler___block_invoke;
  v16[3] = &unk_1E82C5770;
  v16[4] = self;
  v17 = v10;
  v18 = v8;
  v19 = v7;
  v13 = v8;
  v14 = v7;
  v15 = v10;
  objc_msgSend(v12, "_intents_matchExtensionsForIntent:completion:", v6, v16);

}

void __80__ATXIntentToAppBundleIdCache__slowlyFetchBundleIdsForIntent_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v28 = a3;
  v29 = v5;
  if (v5)
  {
    __atxlog_handle_heuristic();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v36 = v7;
      v37 = 2112;
      v38 = v5;
      _os_log_impl(&dword_1C99DF000, v6, OS_LOG_TYPE_INFO, "ATXIntentToAppBundleIdCache: intent type %{public}@ has extensions %@", buf, 0x16u);
    }

    objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_12_0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_heuristic();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v36 = v9;
      v37 = 2112;
      v38 = v27;
      _os_log_impl(&dword_1C99DF000, v8, OS_LOG_TYPE_INFO, "ATXIntentToAppBundleIdCache: intent type %{public}@ has bundle ids %@", buf, 0x16u);
    }

    v10 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 0);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v31 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v16 = (void *)MEMORY[0x1E0CF8CE8];
          objc_msgSend(v15, "bundleIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "appInfoForBundle:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "supportedActions");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "containsObject:", *(_QWORD *)(a1 + 40)))
          {
            objc_msgSend(v15, "bundleIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v20);

          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v12);
    }

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", v27);
    objc_msgSend(v21, "addObjectsFromArray:", v10);
    objc_msgSend(v21, "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *(id *)(a1 + 32);
    objc_sync_enter(v23);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", v22, *(_QWORD *)(a1 + 40));
    objc_sync_exit(v23);

    v24 = (id)objc_opt_self();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    v25 = *(id *)(a1 + 32);
    objc_sync_enter(v25);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    objc_sync_exit(v25);

    __atxlog_handle_heuristic();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      __80__ATXIntentToAppBundleIdCache__slowlyFetchBundleIdsForIntent_completionHandler___block_invoke_cold_1((uint64_t *)(a1 + 40), (uint64_t)v28, v26);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

id __80__ATXIntentToAppBundleIdCache__slowlyFetchBundleIdsForIntent_completionHandler___block_invoke_10(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (objc_class *)MEMORY[0x1E0CA5848];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithBundleIdentifier:error:", v5, 0);
  objc_msgSend(v6, "containingBundleRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentTypeToBundleIdsCache, 0);
}

- (void)_appRegistrationDidChange:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C99DF000, log, OS_LOG_TYPE_DEBUG, "ATXIntentToAppBundleIdCache: clearing cache", v1, 2u);
}

- (void)fetchBundleIdsForIntent:(NSObject *)a3 completionHandler:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_className");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_1C99DF000, a3, OS_LOG_TYPE_DEBUG, "ATXIntentToAppBundleIdCache: using cached value for %{public}@: %@", (uint8_t *)&v6, 0x16u);

}

- (void)_slowlyFetchBundleIdsForIntent:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1C99DF000, a2, OS_LOG_TYPE_DEBUG, "ATXIntentToAppBundleIdCache: fetching value for %{public}@", (uint8_t *)&v2, 0xCu);
}

void __80__ATXIntentToAppBundleIdCache__slowlyFetchBundleIdsForIntent_completionHandler___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138543618;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1C99DF000, log, OS_LOG_TYPE_ERROR, "ATXIntentToAppBundleIdCache: error getting extensions for intent of type %{public}@: %@", (uint8_t *)&v4, 0x16u);
}

@end

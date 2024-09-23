@implementation ATXFrontBoardLayoutAggregator

- (ATXFrontBoardLayoutAggregator)init
{
  ATXFrontBoardLayoutAggregator *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *bundleIdentifierToVisibilityMap;
  ATXFrontBoardLayoutAggregator *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXFrontBoardLayoutAggregator;
  v2 = -[ATXFrontBoardLayoutAggregator init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    bundleIdentifierToVisibilityMap = v2->_bundleIdentifierToVisibilityMap;
    v2->_bundleIdentifierToVisibilityMap = v3;

    v5 = v2;
  }

  return v2;
}

- (id)fetchActiveApps
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -86400.0);
  BiomeLibrary();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "FrontBoard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "DisplayElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026F0]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", v4, 0, 100, 100, 0);
  objc_msgSend(v7, "publisherWithUseCase:options:", CFSTR("ProactiveAppPrediction"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48__ATXFrontBoardLayoutAggregator_fetchActiveApps__block_invoke_4;
  v15[3] = &unk_1E82BFC88;
  v15[4] = self;
  v10 = v3;
  v16 = v10;
  v11 = (id)objc_msgSend(v9, "sinkWithCompletion:receiveInput:", &__block_literal_global_3, v15);

  v12 = v16;
  v13 = v10;

  return v13;
}

void __48__ATXFrontBoardLayoutAggregator_fetchActiveApps__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_default();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __48__ATXFrontBoardLayoutAggregator_fetchActiveApps__block_invoke_cold_1(v2, v4);

  }
}

void __48__ATXFrontBoardLayoutAggregator_fetchActiveApps__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;

  v17 = a2;
  objc_msgSend(v17, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isUIApplicationElement"))
    goto LABEL_10;
  objc_msgSend(v17, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v17;
  if (v5)
  {
    objc_msgSend(v17, "eventBody");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "changeType") == 1)
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v17, "eventBody");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v8) = objc_msgSend(v8, "_isAppWithBundleIdentifierVisible:", v10);

      v11 = v17;
      if ((_DWORD)v8)
      {
        v12 = *(void **)(a1 + 40);
        objc_msgSend(v17, "eventBody");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "bundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v13);
LABEL_9:

LABEL_10:
        v6 = v17;
        goto LABEL_11;
      }
    }
    else
    {

      v11 = v17;
    }
    objc_msgSend(v11, "eventBody");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "changeType");

    v6 = v17;
    if (v15 == 3)
    {
      v16 = *(void **)(a1 + 40);
      objc_msgSend(v17, "eventBody");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObject:", v13);
      goto LABEL_9;
    }
  }
LABEL_11:

}

- (BOOL)_isAppWithBundleIdentifierVisible:(id)a3
{
  id v4;
  ATXFrontBoardLayoutAggregator *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v15;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = self;
    objc_sync_enter(v5);
    -[NSMutableDictionary objectForKeyedSubscript:](v5->_bundleIdentifierToVisibilityMap, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      LOBYTE(v8) = objc_msgSend(v6, "BOOLValue");
    }
    else
    {
      v15 = 0;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, &v15);
      v10 = v15;
      if (v9)
      {
        objc_msgSend(v9, "appTags");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v11, "containsObject:", CFSTR("hidden")) ^ 1;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
        v12 = objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_bundleIdentifierToVisibilityMap, "setObject:forKeyedSubscript:", v12, v4);
      }
      else
      {
        __atxlog_handle_default();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[ATXFrontBoardLayoutAggregator _isAppWithBundleIdentifierVisible:].cold.1((uint64_t)v10, v12, v13);
        LOBYTE(v8) = 0;
      }

    }
    objc_sync_exit(v5);

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifierToVisibilityMap, 0);
}

void __48__ATXFrontBoardLayoutAggregator_fetchActiveApps__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_2(&dword_1C99CA000, a2, v4, "ATXFrontBoardLayoutAggregator: error fetching FrontBoard display elements: %@", (uint8_t *)&v5);

}

- (void)_isAppWithBundleIdentifierVisible:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_2(&dword_1C99CA000, a2, a3, "ATXFrontBoardLayoutAggregator: could not obtain record: %@", (uint8_t *)&v3);
}

@end

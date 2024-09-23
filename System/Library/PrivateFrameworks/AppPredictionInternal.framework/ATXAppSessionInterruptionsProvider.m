@implementation ATXAppSessionInterruptionsProvider

- (ATXAppSessionInterruptionsProvider)initWithLastNDays:(unint64_t)a3
{
  ATXAppSessionInterruptionsProvider *v4;
  uint64_t v5;
  NSDate *thresholdDateLastNDays;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXAppSessionInterruptionsProvider;
  v4 = -[ATXAppSessionInterruptionsProvider init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)(-86400 * a3));
    v5 = objc_claimAutoreleasedReturnValue();
    thresholdDateLastNDays = v4->_thresholdDateLastNDays;
    v4->_thresholdDateLastNDays = (NSDate *)v5;

  }
  return v4;
}

- (void)cacheGlobalAppSessionInterruptionsCalculatorIfNecessary
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXAppSessionInterruptionsProvider: could not fetch app launch and notification publishers with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

uint64_t __93__ATXAppSessionInterruptionsProvider_cacheGlobalAppSessionInterruptionsCalculatorIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "eventTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __93__ATXAppSessionInterruptionsProvider_cacheGlobalAppSessionInterruptionsCalculatorIfNecessary__block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __93__ATXAppSessionInterruptionsProvider_cacheGlobalAppSessionInterruptionsCalculatorIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "handleNotificationEvent:", v15);
    objc_msgSend(v15, "eventTime");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceReferenceDate");
    v5 = v4;
    v6 = *(double *)(a1 + 48);

    if (v5 > v6)
      objc_msgSend(*(id *)(a1 + 40), "handleNotificationEvent:", v15);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = *(void **)(a1 + 32);
      v8 = (void *)objc_opt_new();
      objc_msgSend(v7, "handleNextAppLaunch:dimensionSet:", v15, v8);

      objc_msgSend(v15, "eventTime");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceReferenceDate");
      v11 = v10;
      v12 = *(double *)(a1 + 48);

      if (v11 > v12)
      {
        v13 = *(void **)(a1 + 40);
        v14 = (void *)objc_opt_new();
        objc_msgSend(v13, "handleNextAppLaunch:dimensionSet:", v15, v14);

      }
    }
  }

}

- (void)cacheModeAppSessionInterruptionsCalculatorIfNecessary
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXAppSessionInterruptionsProvider: could not fetch inferred mode stream, app launch and notification publishers with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

uint64_t __91__ATXAppSessionInterruptionsProvider_cacheModeAppSessionInterruptionsCalculatorIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "eventTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __91__ATXAppSessionInterruptionsProvider_cacheModeAppSessionInterruptionsCalculatorIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __91__ATXAppSessionInterruptionsProvider_cacheModeAppSessionInterruptionsCalculatorIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  ATXModeDimensionSet *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;

  v24 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v24, "eventBody");
    v3 = (ATXModeDimensionSet *)objc_claimAutoreleasedReturnValue();
    if (-[ATXModeDimensionSet modeType](v3, "modeType") == 2)
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = 0;
LABEL_14:

      goto LABEL_15;
    }
    -[ATXModeDimensionSet modeType](v3, "modeType");
    BMUserFocusInferredModeTypeToActivity();
    ATXModeFromActivityType();
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v11)
    {
      ATXModeToString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if (!v13)
        goto LABEL_15;
      if ((-[ATXModeDimensionSet isStart](v3, "isStart") & 1) == 0)
      {
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v15 = *(void **)(v14 + 40);
        *(_QWORD *)(v14 + 40) = 0;

      }
    }
    if (-[ATXModeDimensionSet isStart](v3, "isStart"))
    {
      ATXModeToString();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v5 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;
      goto LABEL_14;
    }
LABEL_15:

    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleNotificationEvent:", v24);

      objc_msgSend(v24, "eventTime");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceReferenceDate");
      v9 = v8;
      v10 = *(double *)(a1 + 56);

      if (v9 > v10)
      {
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
        v3 = (ATXModeDimensionSet *)objc_claimAutoreleasedReturnValue();
        -[ATXModeDimensionSet handleNotificationEvent:](v3, "handleNotificationEvent:", v24);
        goto LABEL_15;
      }
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v3 = -[ATXModeDimensionSet initWithMode:]([ATXModeDimensionSet alloc], "initWithMode:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleNextAppLaunch:dimensionSet:", v24, v3);

      objc_msgSend(v24, "eventTime");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSinceReferenceDate");
      v21 = v20;
      v22 = *(double *)(a1 + 56);

      if (v21 > v22)
      {
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleNextAppLaunch:dimensionSet:", v24, v3);

      }
      goto LABEL_15;
    }
  }
LABEL_16:

}

- (void)cacheRecommendedAndCandidateAppsInAllowListForAllModesIfNecessary
{
  NSDictionary *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  dispatch_semaphore_t v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  dispatch_time_t v16;
  NSDictionary *cachedRecommendedAndCandidateAllowedApps;
  ATXAppSessionInterruptionsProvider *v18;
  id obj;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  NSDictionary *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v18 = self;
  v30 = *MEMORY[0x1E0C80C00];
  v2 = (NSDictionary *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  allModesForTraining();
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(obj);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v7), "unsignedIntegerValue", v18);
        v9 = (void *)objc_opt_new();
        ATXModeToString();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v9, v10);

        v11 = (void *)objc_opt_new();
        v12 = dispatch_semaphore_create(0);
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __103__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInAllowListForAllModesIfNecessary__block_invoke;
        v20[3] = &unk_1E82DB718;
        v13 = v12;
        v21 = v13;
        v22 = v11;
        v23 = v2;
        v24 = v8;
        v14 = v11;
        objc_msgSend(v3, "recommendedAndCandidateAllowedAppsForMode:reply:", v8, v20);
        v15 = v13;
        v16 = dispatch_time(0, 5000000000);
        dispatch_semaphore_wait(v15, v16);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v5);
  }

  cachedRecommendedAndCandidateAllowedApps = v18->_cachedRecommendedAndCandidateAllowedApps;
  v18->_cachedRecommendedAndCandidateAllowedApps = v2;

}

void __103__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInAllowListForAllModesIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __103__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInAllowListForAllModesIfNecessary__block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  }
  else
  {
    objc_msgSend(v5, "recommendedApps");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = MEMORY[0x1E0C809B0];
    if (v14)
    {
      objc_msgSend(v5, "recommendedApps");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v15;
      v24[1] = 3221225472;
      v24[2] = __103__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInAllowListForAllModesIfNecessary__block_invoke_23;
      v24[3] = &unk_1E82DB6F0;
      v25 = *(id *)(a1 + 40);
      objc_msgSend(v16, "enumerateObjectsUsingBlock:", v24);

    }
    objc_msgSend(v5, "candidateApps");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v5, "candidateApps");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v15;
      v22[1] = 3221225472;
      v22[2] = __103__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInAllowListForAllModesIfNecessary__block_invoke_2;
      v22[3] = &unk_1E82DB6F0;
      v23 = *(id *)(a1 + 40);
      objc_msgSend(v18, "enumerateObjectsUsingBlock:", v22);

    }
    v20 = *(_QWORD *)(a1 + 40);
    v19 = *(void **)(a1 + 48);
    ATXModeToString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v20, v21);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __103__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInAllowListForAllModesIfNecessary__block_invoke_23(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "bundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

void __103__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInAllowListForAllModesIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "bundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (void)cacheRecommendedAndCandidateAppsInDenyListForAllModesIfNecessary
{
  NSDictionary *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  dispatch_semaphore_t v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  dispatch_time_t v16;
  NSDictionary *cachedRecommendedAndCandidateDeniedApps;
  ATXAppSessionInterruptionsProvider *v18;
  id obj;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  NSDictionary *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v18 = self;
  v30 = *MEMORY[0x1E0C80C00];
  v2 = (NSDictionary *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  allModesForTraining();
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(obj);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v7), "unsignedIntegerValue", v18);
        v9 = (void *)objc_opt_new();
        ATXModeToString();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v9, v10);

        v11 = (void *)objc_opt_new();
        v12 = dispatch_semaphore_create(0);
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __102__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInDenyListForAllModesIfNecessary__block_invoke;
        v20[3] = &unk_1E82DB718;
        v13 = v12;
        v21 = v13;
        v22 = v11;
        v23 = v2;
        v24 = v8;
        v14 = v11;
        objc_msgSend(v3, "recommendedAndCandidateDeniedAppsForMode:reply:", v8, v20);
        v15 = v13;
        v16 = dispatch_time(0, 5000000000);
        dispatch_semaphore_wait(v15, v16);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v5);
  }

  cachedRecommendedAndCandidateDeniedApps = v18->_cachedRecommendedAndCandidateDeniedApps;
  v18->_cachedRecommendedAndCandidateDeniedApps = v2;

}

void __102__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInDenyListForAllModesIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __103__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInAllowListForAllModesIfNecessary__block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  }
  else
  {
    objc_msgSend(v5, "recommendedApps");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = MEMORY[0x1E0C809B0];
    if (v14)
    {
      objc_msgSend(v5, "recommendedApps");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v15;
      v24[1] = 3221225472;
      v24[2] = __102__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInDenyListForAllModesIfNecessary__block_invoke_26;
      v24[3] = &unk_1E82DB6F0;
      v25 = *(id *)(a1 + 40);
      objc_msgSend(v16, "enumerateObjectsUsingBlock:", v24);

    }
    objc_msgSend(v5, "candidateApps");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v5, "candidateApps");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v15;
      v22[1] = 3221225472;
      v22[2] = __102__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInDenyListForAllModesIfNecessary__block_invoke_2;
      v22[3] = &unk_1E82DB6F0;
      v23 = *(id *)(a1 + 40);
      objc_msgSend(v18, "enumerateObjectsUsingBlock:", v22);

    }
    v20 = *(_QWORD *)(a1 + 40);
    v19 = *(void **)(a1 + 48);
    ATXModeToString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v20, v21);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __102__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInDenyListForAllModesIfNecessary__block_invoke_26(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "bundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

void __102__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInDenyListForAllModesIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "bundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (unint64_t)globalInterruptedAppSessionsCountWithinLastNDays
{
  -[ATXAppSessionInterruptionsProvider cacheGlobalAppSessionInterruptionsCalculatorIfNecessary](self, "cacheGlobalAppSessionInterruptionsCalculatorIfNecessary");
  return -[ATXInterruptedAppSessionAccumulator numberOfInterruptingAppSessions](self->_cachedGlobalInterruptedAppSessionsAccumulatorForLastNDays, "numberOfInterruptingAppSessions");
}

- (unint64_t)globalInterruptedAppSessionsCountWithinLast1Day
{
  -[ATXAppSessionInterruptionsProvider cacheGlobalAppSessionInterruptionsCalculatorIfNecessary](self, "cacheGlobalAppSessionInterruptionsCalculatorIfNecessary");
  return -[ATXInterruptedAppSessionAccumulator numberOfInterruptingAppSessions](self->_cachedGlobalInterruptedAppSessionsAccumulatorForLast1Day, "numberOfInterruptingAppSessions");
}

- (unint64_t)modeInterruptedAppSessionsCountWithinLastNDaysForMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[ATXAppSessionInterruptionsProvider cacheModeAppSessionInterruptionsCalculatorIfNecessary](self, "cacheModeAppSessionInterruptionsCalculatorIfNecessary");
  ATXModeToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_cachedAccumulatorsPerATXModeForLastNDays, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfInterruptingAppSessions");

  return v6;
}

- (unint64_t)modeInterruptedAppSessionsCountWithinLast1DayForMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[ATXAppSessionInterruptionsProvider cacheModeAppSessionInterruptionsCalculatorIfNecessary](self, "cacheModeAppSessionInterruptionsCalculatorIfNecessary");
  ATXModeToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_cachedAccumulatorsPerATXModeForLast1Day, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfInterruptingAppSessions");

  return v6;
}

- (unint64_t)modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[ATXAppSessionInterruptionsProvider cacheRecommendedAndCandidateAppsInAllowListForAllModesIfNecessary](self, "cacheRecommendedAndCandidateAppsInAllowListForAllModesIfNecessary");
  -[ATXAppSessionInterruptionsProvider cacheModeAppSessionInterruptionsCalculatorIfNecessary](self, "cacheModeAppSessionInterruptionsCalculatorIfNecessary");
  ATXModeToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_cachedAccumulatorsPerATXModeForLastNDays, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](self->_cachedRecommendedAndCandidateAllowedApps, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ATXAppSessionInterruptionsProvider appInterruptionsCountWithAccumulator:suggestedBundleIds:](self, "appInterruptionsCountWithAccumulator:suggestedBundleIds:", v5, v6);

  return v7;
}

- (unint64_t)modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[ATXAppSessionInterruptionsProvider cacheRecommendedAndCandidateAppsInDenyListForAllModesIfNecessary](self, "cacheRecommendedAndCandidateAppsInDenyListForAllModesIfNecessary");
  -[ATXAppSessionInterruptionsProvider cacheModeAppSessionInterruptionsCalculatorIfNecessary](self, "cacheModeAppSessionInterruptionsCalculatorIfNecessary");
  ATXModeToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_cachedAccumulatorsPerATXModeForLastNDays, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](self->_cachedRecommendedAndCandidateDeniedApps, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ATXAppSessionInterruptionsProvider appInterruptionsCountWithAccumulator:suggestedBundleIds:](self, "appInterruptionsCountWithAccumulator:suggestedBundleIds:", v5, v6);

  return v7;
}

- (unint64_t)modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[ATXAppSessionInterruptionsProvider cacheRecommendedAndCandidateAppsInAllowListForAllModesIfNecessary](self, "cacheRecommendedAndCandidateAppsInAllowListForAllModesIfNecessary");
  -[ATXAppSessionInterruptionsProvider cacheModeAppSessionInterruptionsCalculatorIfNecessary](self, "cacheModeAppSessionInterruptionsCalculatorIfNecessary");
  ATXModeToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_cachedAccumulatorsPerATXModeForLast1Day, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](self->_cachedRecommendedAndCandidateAllowedApps, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ATXAppSessionInterruptionsProvider appInterruptionsCountWithAccumulator:suggestedBundleIds:](self, "appInterruptionsCountWithAccumulator:suggestedBundleIds:", v5, v6);

  return v7;
}

- (unint64_t)modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[ATXAppSessionInterruptionsProvider cacheRecommendedAndCandidateAppsInDenyListForAllModesIfNecessary](self, "cacheRecommendedAndCandidateAppsInDenyListForAllModesIfNecessary");
  -[ATXAppSessionInterruptionsProvider cacheModeAppSessionInterruptionsCalculatorIfNecessary](self, "cacheModeAppSessionInterruptionsCalculatorIfNecessary");
  ATXModeToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_cachedAccumulatorsPerATXModeForLast1Day, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](self->_cachedRecommendedAndCandidateDeniedApps, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ATXAppSessionInterruptionsProvider appInterruptionsCountWithAccumulator:suggestedBundleIds:](self, "appInterruptionsCountWithAccumulator:suggestedBundleIds:", v5, v6);

  return v7;
}

- (unint64_t)appInterruptionsCountWithAccumulator:(id)a3 suggestedBundleIds:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "countedSetContainingInterruptingAppBundleIds");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v6, "containsObject:", v13))
        {
          objc_msgSend(v5, "countedSetContainingInterruptingAppBundleIds");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v10 += objc_msgSend(v14, "countForObject:", v13);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedRecommendedAndCandidateDeniedApps, 0);
  objc_storeStrong((id *)&self->_cachedRecommendedAndCandidateAllowedApps, 0);
  objc_storeStrong((id *)&self->_cachedAccumulatorsPerATXModeForLast1Day, 0);
  objc_storeStrong((id *)&self->_cachedAccumulatorsPerATXModeForLastNDays, 0);
  objc_storeStrong((id *)&self->_cachedGlobalInterruptedAppSessionsAccumulatorForLast1Day, 0);
  objc_storeStrong((id *)&self->_cachedGlobalInterruptedAppSessionsAccumulatorForLastNDays, 0);
  objc_storeStrong((id *)&self->_thresholdDateLastNDays, 0);
}

void __103__ATXAppSessionInterruptionsProvider_cacheRecommendedAndCandidateAppsInAllowListForAllModesIfNecessary__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Could not get recommended and candidate allowed apps: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end

@implementation ATXInformationEngine

- (ATXInformationEngine)init
{
  void *v3;
  void *v4;
  ATXInformationFilter *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ATXInformationEngine *v10;

  objc_msgSend(MEMORY[0x1E0CF8EC8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v5 = -[ATXInformationFilter initWithStore:abuseControlConfig:]([ATXInformationFilter alloc], "initWithStore:abuseControlConfig:", v3, v4);
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v10 = -[ATXInformationEngine initWithFilter:featurizer:ranker:infoStore:confidenceMapper:abuseControlConfig:featureWeights:](self, "initWithFilter:featurizer:ranker:infoStore:confidenceMapper:abuseControlConfig:featureWeights:", v5, v6, v7, v3, v8, v4, v9);

  return v10;
}

- (ATXInformationEngine)initWithFilter:(id)a3 featurizer:(id)a4 ranker:(id)a5 infoStore:(id)a6 confidenceMapper:(id)a7 abuseControlConfig:(id)a8 featureWeights:(id)a9
{
  id v16;
  id v17;
  ATXInformationEngine *v18;
  ATXInformationEngine *v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *queue;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  dispatch_queue_t v30;
  uint64_t v31;
  _PASQueueLock *lock;
  void *v33;
  uint64_t v34;
  _PASSimpleCoalescingTimer *coalescedPredictionUpdateOperation;
  NSObject *v36;
  ATXInformationEngine *v37;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[16];
  _QWORD aBlock[4];
  id v46;
  id location;
  objc_super v48;

  v43 = a3;
  v42 = a4;
  v41 = a5;
  v40 = a6;
  v39 = a7;
  v16 = a8;
  v17 = a9;
  v48.receiver = self;
  v48.super_class = (Class)ATXInformationEngine;
  v18 = -[ATXInformationEngine init](&v48, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_confidenceMapper, a7);
    objc_storeStrong((id *)&v19->_store, a6);
    objc_storeStrong((id *)&v19->_filter, a3);
    objc_storeStrong((id *)&v19->_featurizer, a4);
    objc_storeStrong((id *)&v19->_ranker, a5);
    objc_storeStrong((id *)&v19->_abuseControlConfig, a8);
    objc_storeStrong((id *)&v19->_featureWeights, a9);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create("com.apple.proactive.ATXInformationEngine.internal", v20);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v21;

    v23 = (void *)objc_opt_new();
    v24 = (void *)MEMORY[0x1CAA48B6C]();
    -[ATXInformationStore readCachedSuggestions](v19->_store, "readCachedSuggestions");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    if (v25)
      v27 = v25;
    else
      v27 = MEMORY[0x1E0C9AA60];
    -[ATXInformationEngine _storeCachedSuggestionsWithoutIntents:withGuardedData:](v19, "_storeCachedSuggestionsWithoutIntents:withGuardedData:", v27, v23);

    objc_autoreleasePoolPop(v24);
    v28 = objc_alloc(MEMORY[0x1E0D81600]);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = dispatch_queue_create("com.apple.proactive.ATXInformationEngine.lock", v29);
    v31 = objc_msgSend(v28, "initWithGuardedData:serialQueue:", v23, v30);
    lock = v19->_lock;
    v19->_lock = (_PASQueueLock *)v31;

    objc_initWeak(&location, v19);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __118__ATXInformationEngine_initWithFilter_featurizer_ranker_infoStore_confidenceMapper_abuseControlConfig_featureWeights___block_invoke;
    aBlock[3] = &unk_1E82DB988;
    objc_copyWeak(&v46, &location);
    v33 = _Block_copy(aBlock);
    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0D81618]), "initWithQueue:operation:", v19->_queue, v33);
    coalescedPredictionUpdateOperation = v19->_coalescedPredictionUpdateOperation;
    v19->_coalescedPredictionUpdateOperation = (_PASSimpleCoalescingTimer *)v34;

    -[_PASSimpleCoalescingTimer runAfterDelaySeconds:coalescingBehavior:](v19->_coalescedPredictionUpdateOperation, "runAfterDelaySeconds:coalescingBehavior:", 0, 1.0);
    __atxlog_handle_gi();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v36, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine initialized", buf, 2u);
    }

    v37 = v19;
    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);

  }
  return v19;
}

void __118__ATXInformationEngine_initWithFilter_featurizer_ranker_infoStore_confidenceMapper_abuseControlConfig_featureWeights___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  NSObject *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[3];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __118__ATXInformationEngine_initWithFilter_featurizer_ranker_infoStore_confidenceMapper_abuseControlConfig_featureWeights___block_invoke_27;
    v5[3] = &unk_1E82E5BD0;
    v6 = WeakRetained;
    objc_msgSend(v3, "runAsyncWithLockAcquired:", v5);
    v4 = v6;
  }
  else
  {
    __atxlog_handle_gi();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __118__ATXInformationEngine_initWithFilter_featurizer_ranker_infoStore_confidenceMapper_abuseControlConfig_featureWeights___block_invoke_cold_1(v4);
  }

}

uint64_t __118__ATXInformationEngine_initWithFilter_featurizer_ranker_infoStore_confidenceMapper_abuseControlConfig_featureWeights___block_invoke_27(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePredictionsWithGuardedData:", a2);
}

- (void)_updatePredictionsWithGuardedData:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *context;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  context = (void *)MEMORY[0x1CAA48B6C]();
  v5 = (void *)os_transaction_create();
  __atxlog_handle_gi();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[ATXInformationEngine _updatePredictionsWithGuardedData:]";
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: %s", buf, 0xCu);
  }

  -[ATXInformationStore deleteExpiredSuggestions](self->_store, "deleteExpiredSuggestions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXInformationStore addAbuseControlOutcomes:](self->_store, "addAbuseControlOutcomes:", v7);
  -[ATXInformationStore readCurrentlyRelevantSuggestions](self->_store, "readCurrentlyRelevantSuggestions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXInformationFilter filterInfoSuggestions:](self->_filter, "filterInfoSuggestions:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ATXInformationEngine _shouldSkipRefreshForOldSuggestions:newSuggestions:](self, "_shouldSkipRefreshForOldSuggestions:newSuggestions:", v4[1], v9))
  {
    __atxlog_handle_gi();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: short-circuiting prediction update, as suggestions have not changed", buf, 2u);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x1CAA48B6C]();
    -[ATXInformationFeaturizerProtocol featurizeInfoSuggestions:](self->_featurizer, "featurizeInfoSuggestions:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXInformationRankerProtocol sortFeaturizedSuggestions:withFeatureWeights:](self->_ranker, "sortFeaturizedSuggestions:withFeatureWeights:", v12, self->_featureWeights);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_gi();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = objc_msgSend(v13, "count");
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v15;
      _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_INFO, "ATXInformationEngine: number of relevant suggestion(s): %d", buf, 8u);
    }

    -[ATXInformationEngine _pushSuggestionsToBlendingLayerIfDifferentFromTheLastCacheUpdate:cachedSuggestions:](self, "_pushSuggestionsToBlendingLayerIfDifferentFromTheLastCacheUpdate:cachedSuggestions:", v13, v4[1]);
    objc_msgSend(v13, "_pas_mappedArrayWithTransform:", &__block_literal_global_140);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ATXInformationStore writeCacheWithNewSuggestions:](self->_store, "writeCacheWithNewSuggestions:", v16))-[ATXInformationEngine _storeCachedSuggestionsWithoutIntents:withGuardedData:](self, "_storeCachedSuggestionsWithoutIntents:withGuardedData:", v16, v4);

    objc_autoreleasePoolPop(v11);
  }
  -[ATXInformationStore earliestFutureSuggestionChangeDate](self->_store, "earliestFutureSuggestionChangeDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXInformationStore nextImportantDateAmongTimelineInducedProactiveStackRotationRecords](self->_store, "nextImportantDateAmongTimelineInducedProactiveStackRotationRecords");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v17)
  {
    objc_msgSend(v19, "earlierDate:", v17);
    v21 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v21;
  }
  if (v18)
  {
    objc_msgSend(v20, "earlierDate:", v18);
    v22 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v22;
  }
  -[ATXInformationEngine _schedulePredictionUpdateNoLaterThanDate:guardedData:](self, "_schedulePredictionUpdateNoLaterThanDate:guardedData:", v20, v4);

  objc_autoreleasePoolPop(context);
}

uint64_t __58__ATXInformationEngine__updatePredictionsWithGuardedData___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "suggestion");
}

- (void)_storeCachedSuggestionsWithoutIntents:(id)a3 withGuardedData:(id)a4
{
  _QWORD *v5;
  uint64_t v6;
  id v7;

  v5 = a4;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_35_0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v5[1];
  v5[1] = v6;

}

id __78__ATXInformationEngine__storeCachedSuggestionsWithoutIntents_withGuardedData___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copyByReplacingIntentWithIndexingHash");
}

- (BOOL)_shouldSkipRefreshForOldSuggestions:(id)a3 newSuggestions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") || objc_msgSend(v7, "count"))
  {
    if (objc_msgSend(v6, "count") && objc_msgSend(v7, "count"))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v6);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v7);
      if ((objc_msgSend(v8, "isEqualToSet:", v9) & 1) != 0)
      {
        v10 = 1;
      }
      else
      {
        v11 = (void *)objc_msgSend(v8, "mutableCopy");
        objc_msgSend(v11, "minusSet:", v9);
        v12 = (void *)objc_msgSend(v9, "mutableCopy");
        objc_msgSend(v12, "minusSet:", v8);
        v13 = objc_msgSend(v12, "count");
        if (v13 == objc_msgSend(v11, "count"))
        {
          -[ATXInformationEngine _widgetIdentitiesFromInfoSuggestions:](self, "_widgetIdentitiesFromInfoSuggestions:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXInformationEngine _widgetIdentitiesFromInfoSuggestions:](self, "_widgetIdentitiesFromInfoSuggestions:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v14, "isEqualToSet:", v15);

        }
        else
        {
          v10 = 0;
        }

      }
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (id)_widgetIdentitiesFromInfoSuggestions:(id)a3
{
  return (id)objc_msgSend(a3, "_pas_mappedSetWithTransform:", &__block_literal_global_38_1);
}

id __61__ATXInformationEngine__widgetIdentitiesFromInfoSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;

  v2 = a2;
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v2, "appBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widgetBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widgetKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "intentIndexingHash");
  if (v7)
  {
    v8 = objc_msgSend(v2, "intentIndexingHash");
  }
  else
  {
    objc_msgSend(v2, "intent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v14, "atx_indexingHash");
  }
  v9 = objc_msgSend(v2, "layouts");
  v10 = objc_msgSend(v2, "confidenceLevel");
  objc_msgSend(v2, "suggestionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@-%@-%@-%lld-%ld-%ld-%@"), v4, v5, v6, v8, v9, v10, v11);

  if (!v7)
  return v12;
}

- (void)_pushSuggestionsToBlendingLayerIfDifferentFromTheLastCacheUpdate:(id)a3 cachedSuggestions:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (void *)MEMORY[0x1E0D81198];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "clientModelIdFromClientModelType:", 18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXInformationEngine _pushPredictionsToBlendingLayerIfDifferentFromTheLastCacheUpdate:forClientModel:withClientModelVersion:cachedSuggestions:](self, "_pushPredictionsToBlendingLayerIfDifferentFromTheLastCacheUpdate:forClientModel:withClientModelVersion:cachedSuggestions:", v8, v9, CFSTR("0.1.1"), v7);

  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 19);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXTimelineAbuseControlConfig timelineRelevanceABGroup](self->_abuseControlConfig, "timelineRelevanceABGroup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXInformationEngine _pushPredictionsToBlendingLayerIfDifferentFromTheLastCacheUpdate:forClientModel:withClientModelVersion:cachedSuggestions:](self, "_pushPredictionsToBlendingLayerIfDifferentFromTheLastCacheUpdate:forClientModel:withClientModelVersion:cachedSuggestions:", v8, v11, v10, v7);

}

- (void)_pushPredictionsToBlendingLayerIfDifferentFromTheLastCacheUpdate:(id)a3 forClientModel:(id)a4 withClientModelVersion:(id)a5 cachedSuggestions:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *context;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  context = (void *)MEMORY[0x1CAA48B6C]();
  v14 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __145__ATXInformationEngine__pushPredictionsToBlendingLayerIfDifferentFromTheLastCacheUpdate_forClientModel_withClientModelVersion_cachedSuggestions___block_invoke;
  v25[3] = &unk_1E82E5CB8;
  v15 = v11;
  v26 = v15;
  objc_msgSend(v10, "_pas_filteredArrayWithTest:", v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_pas_mappedArrayWithTransform:", &__block_literal_global_44);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v14;
  v23[1] = 3221225472;
  v23[2] = __145__ATXInformationEngine__pushPredictionsToBlendingLayerIfDifferentFromTheLastCacheUpdate_forClientModel_withClientModelVersion_cachedSuggestions___block_invoke_3;
  v23[3] = &unk_1E82E5D00;
  v18 = v15;
  v24 = v18;
  objc_msgSend(v13, "_pas_filteredArrayWithTest:", v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = -[ATXInformationEngine _shouldSkipRefreshForOldSuggestions:newSuggestions:](self, "_shouldSkipRefreshForOldSuggestions:newSuggestions:", v19, v17);
  __atxlog_handle_gi();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v14)
  {
    if (v21)
    {
      *(_DWORD *)buf = 138412290;
      v28 = v18;
      _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: predictions have NOT changed for the %@ client model. Not pushing update to blending layer", buf, 0xCu);
    }

  }
  else
  {
    if (v21)
    {
      *(_DWORD *)buf = 138412290;
      v28 = v18;
      _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: predictions have changed for the %@ client model. Pushing update to blending layer", buf, 0xCu);
    }

    -[ATXInformationEngine _pushPredictionsToBlendingLayer:forClientModel:withClientModelVersion:](self, "_pushPredictionsToBlendingLayer:forClientModel:withClientModelVersion:", v16, v18, v12);
  }

  objc_autoreleasePoolPop(context);
}

uint64_t __145__ATXInformationEngine__pushPredictionsToBlendingLayerIfDifferentFromTheLastCacheUpdate_forClientModel_withClientModelVersion_cachedSuggestions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "suggestion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientModelId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

uint64_t __145__ATXInformationEngine__pushPredictionsToBlendingLayerIfDifferentFromTheLastCacheUpdate_forClientModel_withClientModelVersion_cachedSuggestions___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "suggestion");
}

uint64_t __145__ATXInformationEngine__pushPredictionsToBlendingLayerIfDifferentFromTheLastCacheUpdate_forClientModel_withClientModelVersion_cachedSuggestions___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "clientModelId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_pushPredictionsToBlendingLayer:(id)a3 forClientModel:(id)a4 withClientModelVersion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  ATXInformationEngine *v24;
  uint64_t v25;
  id v26;
  id obj;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  uint64_t v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v32 = (void *)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v8;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
  if (v33)
  {
    v11 = *(_QWORD *)v35;
    v31 = v9;
    v25 = *(_QWORD *)v35;
    v26 = v10;
    v24 = self;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1CAA48B6C]();
        -[ATXInformationEngine _proactiveSuggestionFromScoredInfoSuggestion:clientModelId:clientModelVersion:](self, "_proactiveSuggestionFromScoredInfoSuggestion:clientModelId:clientModelVersion:", v13, v9, v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v32, "addObject:", v15);
          __atxlog_handle_gi();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v13, "suggestion");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "suggestionIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "suggestion");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "widgetBundleIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "suggestion");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "startDate");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "suggestion");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "endDate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "scoreSpecification");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "suggestedConfidenceCategory");
            *(_DWORD *)buf = 138413570;
            v39 = v31;
            v40 = 2114;
            v41 = v17;
            v42 = 2112;
            v43 = v18;
            v44 = 2112;
            v45 = v19;
            v46 = 2112;
            v47 = v21;
            v48 = 2048;
            v49 = v23;
            _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: (%@) pushing suggestion (ID %{public}@) to blending for widget %@, startDate: %@, endDate: %@, blending confidence: %ld", buf, 0x3Eu);

            self = v24;
            v11 = v25;

            v10 = v26;
            v9 = v31;

          }
        }

        objc_autoreleasePoolPop(v14);
      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
    }
    while (v33);
  }

  -[ATXInformationEngine _updateClientModelWithClientModelId:withSuggestions:](self, "_updateClientModelWithClientModelId:withSuggestions:", v9, v32);
}

- (id)_proactiveSuggestionFromScoredInfoSuggestion:(id)a3 clientModelId:(id)a4 clientModelVersion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  NSObject *v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "suggestion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ATXInfoToBlendingConfidenceMapper blendingConfidenceCategoryForInfoConfidenceLevel:](self->_confidenceMapper, "blendingConfidenceCategoryForInfoConfidenceLevel:", objc_msgSend(v11, "confidenceLevel"));
  v13 = (void *)MEMORY[0x1E0D81150];
  objc_msgSend(v10, "score");
  v15 = v14;

  objc_msgSend(v13, "proactiveSuggestionForInfoSuggestion:withClientModelId:clientModelVersion:rawScore:confidenceCategory:", v11, v9, v8, v12, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    __atxlog_handle_gi();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[ATXInformationEngine _proactiveSuggestionFromScoredInfoSuggestion:clientModelId:clientModelVersion:].cold.1(v11, v17);

  }
  return v16;
}

- (int64_t)_clientModelTypeForInfoSuggestion:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v3 = (void *)MEMORY[0x1E0D81198];
  v4 = a3;
  objc_msgSend(v3, "clientModelIdFromClientModelType:", 19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientModelId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "isEqualToString:", v5);
  if ((_DWORD)v4)
    v7 = 19;
  else
    v7 = 18;

  return v7;
}

- (void)_updateClientModelWithClientModelId:(id)a3 withSuggestions:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _DWORD v12[2];
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc(MEMORY[0x1E0D81198]);
  +[ATXClientModelSuggestionReceiver sharedInstance](ATXClientModelSuggestionReceiver, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "blendingLayerServer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithClientModelId:blendingLayerServer:", v5, v9);

  objc_msgSend(v10, "updateSuggestions:", v6);
  __atxlog_handle_gi();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109378;
    v12[1] = objc_msgSend(v6, "count");
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: InformationClientModel update Blending Layer with %d suggestion(s) for client model: %{public}@", (uint8_t *)v12, 0x12u);
  }

}

- (BOOL)shouldSkipUpdatingPredictionRefreshDateForPreviouslyScheduledDate:(id)a3 newDate:(id)a4
{
  id v5;
  id v6;
  double v7;
  NSObject *v8;
  BOOL v9;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5
    && (objc_msgSend(v5, "timeIntervalSinceNow"), v7 > -1.0)
    && objc_msgSend(v6, "atx_isOnOrAfterDate:", v5))
  {
    __atxlog_handle_gi();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412546;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: skip updating prediction refreshDate since the date of previously scheduled XPC activity (%@) is the same or earlier than the new refresh date: %@", (uint8_t *)&v11, 0x16u);
    }

    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_schedulePredictionUpdateNoLaterThanDate:(id)a3 guardedData:(id)a4
{
  id v6;
  id *v7;
  double v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  double v15;
  double v16;
  NSObject *v17;
  xpc_object_t v18;
  NSObject *v19;
  _QWORD handler[5];
  uint8_t buf[4];
  double v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (id *)a4;
  objc_msgSend(v6, "timeIntervalSinceNow");
  if (v8 < 0.0)
  {
    __atxlog_handle_gi();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = *(double *)&v6;
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: _schedulePredictionUpdateNoLaterThanDate - using current date since the desired refesh date was in the past: %@.", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v10;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)arc4random_uniform(0x258u) + 1500.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "earlierDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[ATXInformationEngine shouldSkipUpdatingPredictionRefreshDateForPreviouslyScheduledDate:newDate:](self, "shouldSkipUpdatingPredictionRefreshDateForPreviouslyScheduledDate:newDate:", v7[2], v12))
  {
    __atxlog_handle_gi();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v7[2];
      *(_DWORD *)buf = 138412546;
      v22 = *(double *)&v14;
      v23 = 2112;
      v24 = v12;
      _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: Updating XPC activity com.apple.duetexpertd.info-pred-update. Previously scheduled prediction refresh date: %@; New prediction refresh date: %@",
        buf,
        0x16u);
    }

    objc_storeStrong(v7 + 2, v12);
    objc_msgSend(v12, "timeIntervalSinceNow");
    if (v15 >= 0.0)
      v16 = v15;
    else
      v16 = 0.0;
    if (v16 > 0.0 || (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked") & 1) != 0)
    {
      __atxlog_handle_gi();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v22 = v16;
        _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: Using XPC delay of %f for scheduled XPC update", buf, 0xCu);
      }

      v18 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v18, (const char *)*MEMORY[0x1E0C80760], (uint64_t)v16);
      xpc_dictionary_set_int64(v18, (const char *)*MEMORY[0x1E0C80790], 15);
      xpc_dictionary_set_BOOL(v18, (const char *)*MEMORY[0x1E0C808B8], 1);
      xpc_dictionary_set_BOOL(v18, (const char *)*MEMORY[0x1E0C80738], 1);
      xpc_dictionary_set_BOOL(v18, (const char *)*MEMORY[0x1E0C80898], 0);
      xpc_dictionary_set_string(v18, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __77__ATXInformationEngine__schedulePredictionUpdateNoLaterThanDate_guardedData___block_invoke;
      handler[3] = &unk_1E82DC950;
      handler[4] = self;
      xpc_activity_register("com.apple.duetexpertd.info-pred-update", v18, handler);

    }
    else
    {
      __atxlog_handle_gi();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: Bypassing XPC activity and scheduling update now", buf, 2u);
      }

      xpc_activity_unregister("com.apple.duetexpertd.info-pred-update");
      -[_PASSimpleCoalescingTimer runAfterDelaySeconds:coalescingBehavior:](self->_coalescedPredictionUpdateOperation, "runAfterDelaySeconds:coalescingBehavior:", 0, 1.0);
    }
  }

}

void __77__ATXInformationEngine__schedulePredictionUpdateNoLaterThanDate_guardedData___block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  NSObject *v5;
  xpc_activity_state_t v6;
  NSObject *v7;
  const char *string;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
    {
      __atxlog_handle_gi();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        __77__ATXInformationEngine__schedulePredictionUpdateNoLaterThanDate_guardedData___block_invoke_cold_1(v5);
    }
    else
    {
      v5 = xpc_activity_copy_criteria(v3);
      __atxlog_handle_gi();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        string = xpc_dictionary_get_string(v5, (const char *)*MEMORY[0x1E0C80878]);
        v9 = 136446210;
        v10 = string;
        _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: XPC activity com.apple.duetexpertd.info-pred-update is running with priority: %{public}s", (uint8_t *)&v9, 0xCu);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "runAfterDelaySeconds:coalescingBehavior:", 0, 1.0);
    }
  }
  else
  {
    v6 = state;
    __atxlog_handle_gi();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = (const char *)v6;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: XPC activity com.apple.duetexpertd.info-pred-update updated state: %ld", (uint8_t *)&v9, 0xCu);
    }
  }

}

- (void)insertSuggestions:(id)a3 forInfoSourceIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _PASQueueLock *lock;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    lock = self->_lock;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __84__ATXInformationEngine_insertSuggestions_forInfoSourceIdentifier_completionHandler___block_invoke;
    v12[3] = &unk_1E82E5D28;
    v12[4] = self;
    v13 = v8;
    v14 = v9;
    v15 = v10;
    -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v12);

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

void __84__ATXInformationEngine_insertSuggestions_forInfoSourceIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  id *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_insertSuggestions:forInfoSourceIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_gi();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __84__ATXInformationEngine_insertSuggestions_forInfoSourceIdentifier_completionHandler___block_invoke_cold_1((uint64_t)v4, v6, v7);

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(*(id *)(a1 + 40), "count");
      v9 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134218242;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: accepts %lu suggestion(s) from %@", buf, 0x16u);
    }

    v10 = objc_msgSend(*(id *)(a1 + 32), "_currentActivePredictionsContainSuggestionFromSourceId:guardedData:", *(_QWORD *)(a1 + 48), v3);
    v11 = *(id **)(a1 + 32);
    if (v10)
      objc_msgSend(v11[4], "runAfterDelaySeconds:coalescingBehavior:", 0, 1.0);
    else
      objc_msgSend(v11, "_updatePredictionRefreshDateIfNecessaryForSuggestions:", *(_QWORD *)(a1 + 40));
  }
  v12 = *(void **)(a1 + 56);
  if (v12)
  {
    v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __84__ATXInformationEngine_insertSuggestions_forInfoSourceIdentifier_completionHandler___block_invoke_51;
    v14[3] = &unk_1E82DB0F0;
    v16 = v12;
    v15 = v4;
    dispatch_async(v13, v14);

  }
}

uint64_t __84__ATXInformationEngine_insertSuggestions_forInfoSourceIdentifier_completionHandler___block_invoke_51(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)_insertSuggestions:(id)a3 forInfoSourceIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count")
    && (-[ATXInformationStore writeInfoSuggestions:](self->_store, "writeInfoSuggestions:", v6) & 1) == 0)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to write suggestions with source id %@ to store"), v7);
    v10 = (objc_class *)MEMORY[0x1E0CB35C8];
    v11 = v9;
    v12 = [v10 alloc];
    v15 = *MEMORY[0x1E0CB2D50];
    v16[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("ATXInformationEngineErrorDomain"), -1, v13);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_updatePredictionRefreshDateIfNecessaryForSuggestions:(id)a3
{
  id v4;
  _PASQueueLock *lock;
  NSObject *v6;
  _QWORD v7[4];
  NSObject *v8;
  ATXInformationEngine *v9;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    lock = self->_lock;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __78__ATXInformationEngine__updatePredictionRefreshDateIfNecessaryForSuggestions___block_invoke;
    v7[3] = &unk_1E82E5D78;
    v8 = v4;
    v9 = self;
    -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v7);
    v6 = v8;
  }
  else
  {
    __atxlog_handle_gi();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[ATXInformationEngine _updatePredictionRefreshDateIfNecessaryForSuggestions:].cold.1(v6);
  }

}

void __78__ATXInformationEngine__updatePredictionRefreshDateIfNecessaryForSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v3 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__65;
  v10 = __Block_byref_object_dispose__65;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__ATXInformationEngine__updatePredictionRefreshDateIfNecessaryForSuggestions___block_invoke_54;
  v5[3] = &unk_1E82E5D50;
  v5[4] = &v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);
  objc_msgSend(*(id *)(a1 + 40), "_schedulePredictionUpdateNoLaterThanDate:guardedData:", v7[5], v3);
  _Block_object_dispose(&v6, 8);

}

void __78__ATXInformationEngine__updatePredictionRefreshDateIfNecessaryForSuggestions___block_invoke_54(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceNow");
  v5 = v4;

  if (v5 > 0.0)
  {
    objc_msgSend(v10, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "earlierDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

- (void)resetSuggestionsTo:(id)a3 forInfoSourceIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _PASQueueLock *lock;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__ATXInformationEngine_resetSuggestionsTo_forInfoSourceIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E82E5D28;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v15);

}

void __85__ATXInformationEngine_resetSuggestionsTo_forInfoSourceIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  id *v25;
  void *v26;
  objc_class *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  id v39;
  _QWORD block[4];
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE buf[12];
  __int16 v52;
  uint64_t v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _QWORD v56[4];

  v56[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (uint64_t *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "readAllInfoSuggestionsWithSourceIdentifier:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  if (!objc_msgSend(*(id *)(a1 + 48), "count") || !objc_msgSend(v5, "count"))
  {
    if (objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      v22 = *(void **)(a1 + 48);
      v23 = v7;
    }
    else
    {
      if (!objc_msgSend(v5, "count"))
        goto LABEL_27;
      v23 = v6;
      v22 = v5;
    }
    objc_msgSend(v23, "addObjectsFromArray:", v22);
    goto LABEL_27;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", *(_QWORD *)(a1 + 48));
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v38 = v5;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v48 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
        if ((objc_msgSend(v8, "containsObject:", v14) & 1) == 0)
          objc_msgSend(v6, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v11);
  }
  v39 = v3;

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v9);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v16 = *(id *)(a1 + 48);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v44 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
        if ((objc_msgSend(v15, "containsObject:", v21) & 1) == 0)
          objc_msgSend(v7, "addObject:", v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
    }
    while (v18);
  }

  v5 = v38;
  v3 = v39;
  v4 = (uint64_t *)(a1 + 40);
LABEL_27:
  if (!objc_msgSend(v6, "count") && !objc_msgSend(v7, "count"))
    goto LABEL_36;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "atomicallyDeleteInfoSuggestions:insertInfoSuggestions:", v6, v7))
  {
    v24 = objc_msgSend(*(id *)(a1 + 32), "_currentActivePredictionsContainSuggestionFromSourceId:guardedData:", *(_QWORD *)(a1 + 40), v3);
    v25 = *(id **)(a1 + 32);
    if (v24)
      objc_msgSend(v25[4], "runAfterDelaySeconds:coalescingBehavior:", 0, 1.0);
    else
      objc_msgSend(v25, "_updatePredictionRefreshDateIfNecessaryForSuggestions:", *(_QWORD *)(a1 + 48));
    goto LABEL_36;
  }
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to reset suggestions with source ID %@ due to database failure."), *v4);
  v27 = (objc_class *)MEMORY[0x1E0CB35C8];
  v28 = v26;
  v29 = [v27 alloc];
  v56[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v56, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (void *)objc_msgSend(v29, "initWithDomain:code:userInfo:", CFSTR("ATXInformationEngineErrorDomain"), -1, v30);
  if (!v31)
  {
LABEL_36:
    __atxlog_handle_gi();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v34 = *(_QWORD *)(a1 + 40);
      v35 = objc_msgSend(*(id *)(a1 + 48), "count");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v34;
      v52 = 2048;
      v53 = v35;
      _os_log_impl(&dword_1C9A3B000, v32, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: source %@ sets %lu suggestion(s)", buf, 0x16u);
    }
    v31 = 0;
    goto LABEL_39;
  }
  __atxlog_handle_gi();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    __85__ATXInformationEngine_resetSuggestionsTo_forInfoSourceIdentifier_completionHandler___block_invoke_cold_1(v4, v32, v33);
LABEL_39:

  v36 = *(void **)(a1 + 56);
  if (v36)
  {
    v37 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__ATXInformationEngine_resetSuggestionsTo_forInfoSourceIdentifier_completionHandler___block_invoke_59;
    block[3] = &unk_1E82DB0F0;
    v42 = v36;
    v41 = v31;
    dispatch_async(v37, block);

  }
}

uint64_t __85__ATXInformationEngine_resetSuggestionsTo_forInfoSourceIdentifier_completionHandler___block_invoke_59(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)_currentActivePredictionsContainSuggestionFromSourceId:(id)a3 guardedData:(id)a4
{
  id v5;
  _QWORD *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v7 = (void *)v6[1];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __91__ATXInformationEngine__currentActivePredictionsContainSuggestionFromSourceId_guardedData___block_invoke;
  v10[3] = &unk_1E82E5DA0;
  v8 = v5;
  v11 = v8;
  v12 = &v13;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);
  LOBYTE(v7) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)v7;
}

void __91__ATXInformationEngine__currentActivePredictionsContainSuggestionFromSourceId_guardedData___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;

  objc_msgSend(a2, "sourceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)getSuggestionsForInfoSourceIdentifier:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  _PASQueueLock *lock;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__ATXInformationEngine_getSuggestionsForInfoSourceIdentifier_withReply___block_invoke;
  v11[3] = &unk_1E82E5DC8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v11);

}

void __72__ATXInformationEngine_getSuggestionsForInfoSourceIdentifier_withReply___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "readAllInfoSuggestionsWithSourceIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_gi();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(v2, "count");
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 67109378;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "%d suggestion(s) to be returned to source: %@", buf, 0x12u);
  }

  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__ATXInformationEngine_getSuggestionsForInfoSourceIdentifier_withReply___block_invoke_60;
  v9[3] = &unk_1E82DB0F0;
  v7 = *(id *)(a1 + 48);
  v10 = v2;
  v11 = v7;
  v8 = v2;
  dispatch_async(v6, v9);

}

uint64_t __72__ATXInformationEngine_getSuggestionsForInfoSourceIdentifier_withReply___block_invoke_60(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)clearSuggestionsForInfoSourceIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _PASQueueLock *lock;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__ATXInformationEngine_clearSuggestionsForInfoSourceIdentifier_completionHandler___block_invoke;
  v11[3] = &unk_1E82E5DC8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v11);

}

void __82__ATXInformationEngine_clearSuggestionsForInfoSourceIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_clearSuggestionsForInfoSourceIdentifier:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_gi();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __82__ATXInformationEngine_clearSuggestionsForInfoSourceIdentifier_completionHandler___block_invoke_cold_1((uint64_t)v4, v6, v7);

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: all suggestions from %@ removed", buf, 0xCu);
    }

    if (objc_msgSend(*(id *)(a1 + 32), "_currentActivePredictionsContainSuggestionFromSourceId:guardedData:", *(_QWORD *)(a1 + 40), v3))objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "runAfterDelaySeconds:coalescingBehavior:", 0, 1.0);
  }
  v9 = *(void **)(a1 + 48);
  if (v9)
  {
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __82__ATXInformationEngine_clearSuggestionsForInfoSourceIdentifier_completionHandler___block_invoke_61;
    v11[3] = &unk_1E82DB0F0;
    v13 = v9;
    v12 = v4;
    dispatch_async(v10, v11);

  }
}

uint64_t __82__ATXInformationEngine_clearSuggestionsForInfoSourceIdentifier_completionHandler___block_invoke_61(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)_clearSuggestionsForInfoSourceIdentifier:(id)a3
{
  id v4;
  ATXInformationStore *store;
  char v6;
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  store = self->_store;
  v15 = 0;
  v6 = -[ATXInformationStore deleteAllInfoSuggestionsWithSourceIdentifier:error:](store, "deleteAllInfoSuggestionsWithSourceIdentifier:error:", v4, &v15);
  v7 = v15;
  v8 = 0;
  if ((v6 & 1) == 0)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to delete all suggestions with source id %@ from store with error: %@"), v4, v7);
    v10 = (objc_class *)MEMORY[0x1E0CB35C8];
    v11 = v9;
    v12 = [v10 alloc];
    v16 = *MEMORY[0x1E0CB2D50];
    v17[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("ATXInformationEngineErrorDomain"), -2, v13);
  }

  return v8;
}

- (id)latestInfoSuggestionRelevantNowForSourceId:(id)a3
{
  return (id)-[ATXInformationStore latestInfoSuggestionRelevantNowForSourceId:](self->_store, "latestInfoSuggestionRelevantNowForSourceId:", a3);
}

- (BOOL)deleteAllSuggestionsForSourceId:(id)a3 excludingSuggestionId:(id)a4
{
  return -[ATXInformationStore deleteAllSuggestionsForSourceId:excludingSuggestionId:](self->_store, "deleteAllSuggestionsForSourceId:excludingSuggestionId:", a3, a4);
}

- (void)handleSuggestionDismissal:(id)a3 isDismissalLongTerm:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  ATXInformationFilter *filter;
  id v10;
  _QWORD v11[5];
  id v12;

  v5 = a4;
  v8 = a5;
  filter = self->_filter;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__ATXInformationEngine_handleSuggestionDismissal_isDismissalLongTerm_completion___block_invoke;
  v11[3] = &unk_1E82E5E18;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  -[ATXInformationFilter recordDismissOfSuggestion:isDismissalLongTerm:completionHandler:](filter, "recordDismissOfSuggestion:isDismissalLongTerm:completionHandler:", a3, v5, v11);

}

void __81__ATXInformationEngine_handleSuggestionDismissal_isDismissalLongTerm_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v4 = *(void **)(v2 + 24);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __81__ATXInformationEngine_handleSuggestionDismissal_isDismissalLongTerm_completion___block_invoke_2;
    v5[3] = &unk_1E82E5DF0;
    v5[4] = v2;
    v6 = v3;
    objc_msgSend(v4, "runAsyncWithLockAcquired:", v5);

  }
}

void __81__ATXInformationEngine_handleSuggestionDismissal_isDismissalLongTerm_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_updatePredictionsWithGuardedData:", a2);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__ATXInformationEngine_handleSuggestionDismissal_isDismissalLongTerm_completion___block_invoke_3;
  block[3] = &unk_1E82DA9F8;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __81__ATXInformationEngine_handleSuggestionDismissal_isDismissalLongTerm_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)handleProactiveStackRotationForInfoSuggestion:(id)a3 isStalenessRotation:(BOOL)a4
{
  id v6;
  _PASQueueLock *lock;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  v6 = a3;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __90__ATXInformationEngine_handleProactiveStackRotationForInfoSuggestion_isStalenessRotation___block_invoke;
  v9[3] = &unk_1E82E5E40;
  v9[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v9);

}

void __90__ATXInformationEngine_handleProactiveStackRotationForInfoSuggestion_isStalenessRotation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  char v31;
  char v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;

  v36 = a2;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(*(id *)(a1 + 40), "suggestionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "rotationExistsForSuggestionWithId:considerStalenessRotation:", v4, 0);

  if ((v3 & 1) == 0)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    objc_msgSend(*(id *)(a1 + 40), "widgetBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "widgetKind");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "durationLimitForWidgetWithIdentifier:kind:", v6, v7);
    v9 = v8;

    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    objc_msgSend(*(id *)(a1 + 40), "widgetBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "widgetKind");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "coolDownIntervalForWidgetWithIdentifier:kind:", v11, v12);
    v14 = v13;

    v15 = objc_alloc(MEMORY[0x1E0CF9130]);
    objc_msgSend(*(id *)(a1 + 40), "suggestionIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "clientModelId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "criterion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "widgetBundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "widgetKind");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "intent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(_BYTE *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v35) = v22;
    v24 = (void *)objc_msgSend(v15, "initWithInfoSuggestionId:clientModelId:criterion:widget:kind:intent:isStalenessRotation:rotationDate:durationLimit:coolDownInterval:", v16, v17, v18, v19, v20, v21, v9, v14, v35, v23);

    v25 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "insertOrIgnoreProactiveStackRotationRecord:", v24);
    objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 19);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "clientModelId");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v28, "isEqualToString:", v26) & 1) != 0)
    {
      v29 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "clientModelId");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isEqualToString:", v27);

      v29 = v31 ^ 1;
    }

    if (v25)
    {
      if (*(_BYTE *)(a1 + 48))
        v32 = 1;
      else
        v32 = v29;
      if ((v32 & 1) == 0)
      {
        v33 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v9);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "_schedulePredictionUpdateNoLaterThanDate:guardedData:", v34, v36);

      }
    }

  }
}

- (unint64_t)countOfInfoSuggestionsForBundleId:(id)a3
{
  return -[ATXInformationStore numberOfInfoSuggestionsForAppBundleIdentifier:](self->_store, "numberOfInfoSuggestionsForAppBundleIdentifier:", a3);
}

- (unint64_t)countOfInfoSuggestionsForSourceId:(id)a3
{
  return -[ATXInformationStore numberOfInfoSuggestionsForSourceId:](self->_store, "numberOfInfoSuggestionsForSourceId:", a3);
}

- (id)latestUpdateDateForSourceId:(id)a3
{
  return (id)-[ATXInformationStore latestUpdateDateForSourceId:](self->_store, "latestUpdateDateForSourceId:", a3);
}

- (void)recordRecentTimelineEntries:(id)a3 forWidget:(id)a4
{
  -[ATXInformationStore insertTimelineEntries:forWidget:](self->_store, "insertTimelineEntries:forWidget:", a3, a4);
}

- (id)scheduledPredictionRefreshDate
{
  _PASQueueLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__65;
  v10 = __Block_byref_object_dispose__65;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__ATXInformationEngine_scheduledPredictionRefreshDate__block_invoke;
  v5[3] = &unk_1E82E5E68;
  v5[4] = &v6;
  -[_PASQueueLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __54__ATXInformationEngine_scheduledPredictionRefreshDate__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(*(id *)(a2 + 16), "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)allRelevantInfoSuggestions
{
  void *v2;
  void *v3;

  -[ATXInformationStore readCurrentlyRelevantSuggestions](self->_store, "readCurrentlyRelevantSuggestions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v2, 1);
  else
    v3 = (void *)MEMORY[0x1E0C9AA60];

  return v3;
}

- (id)allInfoSuggestions
{
  void *v2;
  void *v3;

  -[ATXInformationStore readAllInfoSuggestions](self->_store, "readAllInfoSuggestions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v2, 1);
  else
    v3 = (void *)MEMORY[0x1E0C9AA60];

  return v3;
}

- (id)allInfoSuggestionsForSourceId:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[ATXInformationStore readAllInfoSuggestionsWithSourceIdentifier:](self->_store, "readAllInfoSuggestionsWithSourceIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)MEMORY[0x1E0C9AA60];

  return v5;
}

- (id)currentPredictions
{
  _PASQueueLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__65;
  v10 = __Block_byref_object_dispose__65;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__ATXInformationEngine_currentPredictions__block_invoke;
  v5[3] = &unk_1E82E5E68;
  v5[4] = &v6;
  -[_PASQueueLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __42__ATXInformationEngine_currentPredictions__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  _QWORD *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0C99D20];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = v4[1];

  v7 = objc_msgSend(v5, "initWithArray:copyItems:", v6, 1);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (id)forceUpdateAndReturnPredictions
{
  _PASQueueLock *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__65;
  v10 = __Block_byref_object_dispose__65;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__ATXInformationEngine_forceUpdateAndReturnPredictions__block_invoke;
  v5[3] = &unk_1E82E5E90;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASQueueLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __55__ATXInformationEngine_forceUpdateAndReturnPredictions__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_updatePredictionsWithGuardedData:", v4);
  v5 = objc_alloc(MEMORY[0x1E0C99D20]);
  v6 = v4[1];

  v7 = objc_msgSend(v5, "initWithArray:copyItems:", v6, 1);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (ATXTimelineAbuseControlConfig)abuseControlConfig
{
  return self->_abuseControlConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureWeights, 0);
  objc_storeStrong((id *)&self->_abuseControlConfig, 0);
  objc_storeStrong((id *)&self->_ranker, 0);
  objc_storeStrong((id *)&self->_featurizer, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_confidenceMapper, 0);
  objc_storeStrong((id *)&self->_coalescedPredictionUpdateOperation, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __118__ATXInformationEngine_initWithFilter_featurizer_ranker_infoStore_confidenceMapper_abuseControlConfig_featureWeights___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "ATXInformationEngine: couldn't perform prediction update operation because self is nil", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_proactiveSuggestionFromScoredInfoSuggestion:(void *)a1 clientModelId:(NSObject *)a2 clientModelVersion:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, v4, "ATXInformationEngine: failed to convert ATXInfoSuggestion to ATXProactiveSuggestion: %@", (uint8_t *)&v5);

}

void __77__ATXInformationEngine__schedulePredictionUpdateNoLaterThanDate_guardedData___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "ATXInformationEngine: XPC activity com.apple.duetexpertd.info-pred-update attempted to run when class C locked even though it was set up not to do that", v1, 2u);
  OUTLINED_FUNCTION_4();
}

void __84__ATXInformationEngine_insertSuggestions_forInfoSourceIdentifier_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, a3, "ATXInformationEngine: aborting insertSuggestions due to %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)_updatePredictionRefreshDateIfNecessaryForSuggestions:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_DEBUG, "ATXInformationEngine: _updatePredictionRefreshDateIfNecessaryForSuggestions called with no suggestions", v1, 2u);
  OUTLINED_FUNCTION_4();
}

void __85__ATXInformationEngine_resetSuggestionsTo_forInfoSourceIdentifier_completionHandler___block_invoke_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, a3, "ATXInformationEngine: Failed to reset suggestions with source ID %@ due to database failure.", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

void __82__ATXInformationEngine_clearSuggestionsForInfoSourceIdentifier_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, a3, "ATXInformationEngine: aborting clearSuggestions due to %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

@end

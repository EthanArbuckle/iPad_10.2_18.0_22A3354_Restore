@implementation ATXRSWidgetSuggestionProducer

- (ATXRSWidgetSuggestionProducer)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  ATXRSWidgetSuggestionProducer *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  +[_ATXDuetHelper sharedInstance](_ATXDuetHelper, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF9210], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v16 = (void *)objc_opt_new();
  +[ATXWidgetSuggestionAbuseGuard sharedInstance](ATXWidgetSuggestionAbuseGuard, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  +[ATXClientModelSuggestionReceiver sharedInstance](ATXClientModelSuggestionReceiver, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10240]), "initWithOptions:", 1);
  v12 = -[ATXRSWidgetSuggestionProducer initWithDuetHelper:descriptorCache:relevanceMonitor:filter:abuseGuard:featurizer:featureWeights:ranker:confidenceMapper:suggestionReceiver:metadataProvider:widgetRelevanceService:](self, "initWithDuetHelper:descriptorCache:relevanceMonitor:filter:abuseGuard:featurizer:featureWeights:ranker:confidenceMapper:suggestionReceiver:metadataProvider:widgetRelevanceService:", v13, v3, v4, v16, v15, v14, v11, v5, v6, v7, v8, v9);

  return v12;
}

- (ATXRSWidgetSuggestionProducer)initWithDuetHelper:(id)a3 descriptorCache:(id)a4 relevanceMonitor:(id)a5 filter:(id)a6 abuseGuard:(id)a7 featurizer:(id)a8 featureWeights:(id)a9 ranker:(id)a10 confidenceMapper:(id)a11 suggestionReceiver:(id)a12 metadataProvider:(id)a13 widgetRelevanceService:(id)a14
{
  id v19;
  ATXRSWidgetSuggestionProducer *v20;
  ATXRSWidgetSuggestionProducer *v21;
  NSObject *v22;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *queue;
  void *v26;
  uint64_t v27;
  _PASSimpleCoalescingTimer *coalescedRefreshRelevantShortcutsOperation;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  const char *v36;
  NSObject *v37;
  NSObject *v38;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v55;
  uint8_t buf[16];
  _QWORD handler[4];
  ATXRSWidgetSuggestionProducer *v58;
  _QWORD aBlock[4];
  id v60;
  id location;
  objc_super v62;

  v53 = a3;
  v52 = a4;
  v41 = a5;
  v19 = a5;
  v51 = a6;
  v42 = a7;
  v50 = a7;
  v49 = a8;
  v48 = a9;
  v47 = a10;
  v46 = a11;
  v45 = a12;
  v44 = a13;
  v43 = a14;
  v62.receiver = self;
  v62.super_class = (Class)ATXRSWidgetSuggestionProducer;
  v20 = -[ATXRSWidgetSuggestionProducer init](&v62, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_duetHelper, a3);
    objc_storeStrong((id *)&v21->_descriptorCache, a4);
    objc_storeStrong((id *)&v21->_relevanceMonitor, v41);
    v55 = v19;
    objc_msgSend(v19, "setDelegate:", v21);
    objc_storeStrong((id *)&v21->_filter, a6);
    objc_storeStrong((id *)&v21->_abuseGuard, v42);
    objc_storeStrong((id *)&v21->_featurizer, a8);
    objc_storeStrong((id *)&v21->_featureWeights, a9);
    objc_storeStrong((id *)&v21->_ranker, a10);
    objc_storeStrong((id *)&v21->_confidenceMapper, a11);
    objc_storeStrong((id *)&v21->_suggestionReceiver, a12);
    objc_storeStrong((id *)&v21->_metadataProvider, a13);
    objc_storeStrong((id *)&v21->_widgetRelevanceService, a14);
    -[CHSWidgetRelevanceService registerObserver:](v21->_widgetRelevanceService, "registerObserver:", v21);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v22, QOS_CLASS_BACKGROUND, 0);
    v23 = objc_claimAutoreleasedReturnValue();

    v24 = dispatch_queue_create("ATXRSWidgetSuggestionProducer", v23);
    queue = v21->_queue;
    v21->_queue = (OS_dispatch_queue *)v24;

    objc_initWeak(&location, v21);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __212__ATXRSWidgetSuggestionProducer_initWithDuetHelper_descriptorCache_relevanceMonitor_filter_abuseGuard_featurizer_featureWeights_ranker_confidenceMapper_suggestionReceiver_metadataProvider_widgetRelevanceService___block_invoke;
    aBlock[3] = &unk_1E82DB988;
    objc_copyWeak(&v60, &location);
    v26 = _Block_copy(aBlock);
    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0D81618]), "initWithQueue:operation:", v21->_queue, v26);
    coalescedRefreshRelevantShortcutsOperation = v21->_coalescedRefreshRelevantShortcutsOperation;
    v21->_coalescedRefreshRelevantShortcutsOperation = (_PASSimpleCoalescingTimer *)v27;

    v29 = (void *)MEMORY[0x1CAA48B6C]();
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15AF8], "appRelevantShortcutsStream");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "name");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserver:selector:name:object:", v21, sel__coalescedRefreshRelevantShortcuts_, *MEMORY[0x1E0D15B70], v32);

    objc_msgSend(MEMORY[0x1E0D15AF8], "appRelevantShortcutsStream");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "name");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserver:selector:name:object:", v21, sel__coalescedRefreshRelevantShortcuts_, *MEMORY[0x1E0D15B80], v34);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObserver:selector:name:object:", v21, sel__coalescedRefreshRelevantShortcuts_, *MEMORY[0x1E0CF9340], v21->_descriptorCache);
    objc_msgSend(v35, "addObserver:selector:name:object:", v21, sel__coalescedRefreshRelevantShortcuts_, CFSTR("ATXWidgetSuggestionAbuseGuardRefresh"), v21->_abuseGuard);

    objc_autoreleasePoolPop(v29);
    v36 = (const char *)*MEMORY[0x1E0D440B8];
    v37 = v21->_queue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __212__ATXRSWidgetSuggestionProducer_initWithDuetHelper_descriptorCache_relevanceMonitor_filter_abuseGuard_featurizer_featureWeights_ranker_confidenceMapper_suggestionReceiver_metadataProvider_widgetRelevanceService___block_invoke_30;
    handler[3] = &unk_1E82DB9B0;
    v58 = v21;
    notify_register_dispatch(v36, &v21->_relevantShortcutRefreshToken, v37, handler);
    __atxlog_handle_relevant_shortcut();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v38, OS_LOG_TYPE_DEFAULT, "ATXRSWidgetSuggestionProducer: Initialized", buf, 2u);
    }

    objc_destroyWeak(&v60);
    objc_destroyWeak(&location);

    v19 = v55;
  }

  return v21;
}

void __212__ATXRSWidgetSuggestionProducer_initWithDuetHelper_descriptorCache_relevanceMonitor_filter_abuseGuard_featurizer_featureWeights_ranker_confidenceMapper_suggestionReceiver_metadataProvider_widgetRelevanceService___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_refreshRelevantShortcuts");
  }
  else
  {
    __atxlog_handle_relevant_shortcut();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __212__ATXRSWidgetSuggestionProducer_initWithDuetHelper_descriptorCache_relevanceMonitor_filter_abuseGuard_featurizer_featureWeights_ranker_confidenceMapper_suggestionReceiver_metadataProvider_widgetRelevanceService___block_invoke_cold_1(v3);

  }
}

uint64_t __212__ATXRSWidgetSuggestionProducer_initWithDuetHelper_descriptorCache_relevanceMonitor_filter_abuseGuard_featurizer_featureWeights_ranker_confidenceMapper_suggestionReceiver_metadataProvider_widgetRelevanceService___block_invoke_30(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  __atxlog_handle_relevant_shortcut();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "ATXRSWidgetSuggestionProducer: Triggering coalesced refresh by LNRelevantIntentsChangedNotification", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_coalescedRefreshRelevantShortcuts");
}

- (void)widgetRelevancesDidChangeForRelevanceService:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  __atxlog_handle_relevant_shortcut();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "ATXRSWidgetSuggestionProducer: Triggering coalesced refresh because CHSWidgetRelevanceService.widgetRelevancesDidChangeForRelevanceService", v5, 2u);
  }

  -[ATXRSWidgetSuggestionProducer _coalescedRefreshRelevantShortcuts](self, "_coalescedRefreshRelevantShortcuts");
}

- (void)relevanceMonitorDidUpdateCurrentlyRelevantCandidates:(id)a3 relevantContexts:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ATXRSWidgetSuggestionProducer *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__ATXRSWidgetSuggestionProducer_relevanceMonitorDidUpdateCurrentlyRelevantCandidates_relevantContexts___block_invoke;
  block[3] = &unk_1E82DB9D8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __103__ATXRSWidgetSuggestionProducer_relevanceMonitorDidUpdateCurrentlyRelevantCandidates_relevantContexts___block_invoke(id *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v15 = (void *)os_transaction_create();
  __atxlog_handle_relevant_shortcut();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(a1[4], "count");
    *(_DWORD *)buf = 134217984;
    v27 = v3;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "ATXRSWidgetSuggestionProducer: Refreshing suggestions for %lu currently relevant candidates...", buf, 0xCu);
  }

  objc_msgSend(*((id *)a1[5] + 4), "filterCandidatesBySuggestionRequirements:", a1[4]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v4;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v19)
  {
    v17 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(a1[6], "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v6, "widgetDescriptor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "extensionBundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "widgetDescriptor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "kind");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "intent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("%@:%@:%lld:%lu"), v9, v11, objc_msgSend(v12, "atx_indexingHash"), objc_msgSend(v7, "hash"), v15);

        objc_msgSend(a1[5], "_infoSuggestionFromCandidate:suggestionIdentifier:", v6, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v14);

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v19);
  }

  objc_msgSend(a1[5], "_pushSuggestionsToBlendingIfNecessary:", v18);
}

- (void)_coalescedRefreshRelevantShortcuts:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_relevant_shortcut();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "ATXRSWidgetSuggestionProducer: Triggering coalesced refresh by notification %{public}@", (uint8_t *)&v7, 0xCu);

  }
  -[ATXRSWidgetSuggestionProducer _coalescedRefreshRelevantShortcuts](self, "_coalescedRefreshRelevantShortcuts");

}

- (void)_coalescedRefreshRelevantShortcuts
{
  -[_PASSimpleCoalescingTimer runAfterDelaySeconds:coalescingBehavior:](self->_coalescedRefreshRelevantShortcutsOperation, "runAfterDelaySeconds:coalescingBehavior:", 0, 1.0);
}

- (void)_refreshRelevantShortcuts
{
  NSObject *v2;
  _QWORD *v3;
  uint8_t *v4;
  void *v5;
  id v6;

  OUTLINED_FUNCTION_2_2(a1, a2);
  v5 = (void *)objc_opt_class();
  *(_DWORD *)v4 = 138412290;
  *v3 = v5;
  v6 = v5;
  _os_log_fault_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_FAULT, "ATXRSWidgetSuggestionProducer: Expected intent concrete class to be INAppIntent, but it was %@ instead", v4, 0xCu);

  OUTLINED_FUNCTION_3_2();
}

void __58__ATXRSWidgetSuggestionProducer__refreshRelevantShortcuts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    __atxlog_handle_relevant_shortcut();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __58__ATXRSWidgetSuggestionProducer__refreshRelevantShortcuts__block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "_candidatesFromBundleIdToRelevantIntentsDict:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_relevant_shortcut();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134217984;
    v13 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "ATXRSWidgetSuggestionProducer: fetched %lu valid relevant intents from link", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v8);
  __atxlog_handle_relevant_shortcut();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(*(id *)(a1 + 40), "count");
    v12 = 134217984;
    v13 = v11;
    _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "ATXRSWidgetSuggestionProducer: fetched %lu relevantShortcutCandidates in total", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "resetToMonitorForRelevantShortcutCandidates:", *(_QWORD *)(a1 + 40));
}

- (id)_candidatesFromBundleIdToRelevantIntentsDict:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v18;
  uint64_t v19;
  id obj;
  void *context;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = (id)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v4;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v29;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(obj);
        v22 = v5;
        v6 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v5);
        context = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(obj, "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v25 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
              v14 = (void *)MEMORY[0x1CAA48B6C]();
              -[ATXRSWidgetSuggestionProducer relevantShortcutCandidateFromLNRelevantIntent:donationBundleId:](self, "relevantShortcutCandidateFromLNRelevantIntent:donationBundleId:", v13, v6);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15)
              {
                objc_msgSend(v23, "addObject:", v15);
                __atxlog_handle_relevant_shortcut();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v33 = v13;
                  _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_DEFAULT, "ATXRSWidgetSuggestionProducer: successfully produced candidate from relevant intent: %@", buf, 0xCu);
                }

              }
              objc_autoreleasePoolPop(v14);
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
          }
          while (v10);
        }

        objc_autoreleasePoolPop(context);
        v5 = v22 + 1;
      }
      while (v22 + 1 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    }
    while (v19);
  }

  return v23;
}

- (id)relevantShortcutCandidateFromLNRelevantIntent:(id)a3 donationBundleId:(id)a4
{
  id v6;
  id v7;
  LNMetadataProvider *metadataProvider;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  ATXRelevantShortcutCandidate *v19;
  NSObject *v20;
  ATXRelevantShortcutCandidate *v21;
  id v23;
  NSObject *v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  metadataProvider = self->_metadataProvider;
  objc_msgSend(v6, "action");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  -[LNMetadataProvider actionForBundleIdentifier:andActionIdentifier:error:](metadataProvider, "actionForBundleIdentifier:andActionIdentifier:error:", v7, v10, &v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v23;

  if (v12 || !v11)
  {
    __atxlog_handle_relevant_shortcut();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[ATXRSWidgetSuggestionProducer relevantShortcutCandidateFromLNRelevantIntent:donationBundleId:].cold.2();
    v21 = 0;
  }
  else
  {
    v13 = objc_alloc(MEMORY[0x1E0CBD738]);
    objc_msgSend(v6, "action");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithAppBundleIdentifier:linkAction:linkActionMetadata:", v7, v14, v11);

    -[ATXWidgetDescriptorCache homeScreenDescriptorForIntent:](self->_descriptorCache, "homeScreenDescriptorForIntent:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v6, "context");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXRelevantContextConverter contextFromRelevantContext:](ATXRelevantContextConverter, "contextFromRelevantContext:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = [ATXRelevantShortcutCandidate alloc];
        v24 = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = -[ATXRelevantShortcutCandidate initWithWidgetDescriptor:donationBundleIdentifier:intent:relevantContexts:](v19, "initWithWidgetDescriptor:donationBundleIdentifier:intent:relevantContexts:", v16, v7, v15, v20);
      }
      else
      {
        __atxlog_handle_relevant_shortcut();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v6;
          _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_DEFAULT, "ATXRSWidgetSuggestionProducer: no context derived from relevant intent: %@", buf, 0xCu);
        }
        v21 = 0;
      }

    }
    else
    {
      __atxlog_handle_relevant_shortcut();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[ATXRSWidgetSuggestionProducer relevantShortcutCandidateFromLNRelevantIntent:donationBundleId:].cold.1();
      v21 = 0;
    }

  }
  return v21;
}

- (id)_candidatesFromRelevantShortcutsFromStartDate:(id)a3
{
  id v4;
  void *v5;
  _ATXDuetHelper *duetHelper;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  duetHelper = self->_duetHelper;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__ATXRSWidgetSuggestionProducer__candidatesFromRelevantShortcutsFromStartDate___block_invoke;
  v12[3] = &unk_1E82DBA68;
  v12[4] = self;
  v8 = v5;
  v13 = v8;
  -[_ATXDuetHelper enumerateRelevantShortcutsAndBundleIdsBetweenStartDate:endDate:limit:block:](duetHelper, "enumerateRelevantShortcutsAndBundleIdsBetweenStartDate:endDate:limit:block:", v4, v7, 1000, v12);

  v9 = v13;
  v10 = v8;

  return v10;
}

void __79__ATXRSWidgetSuggestionProducer__candidatesFromRelevantShortcutsFromStartDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  ATXRelevantShortcutCandidate *v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_msgSend(v6, "widgetKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[ATXRSWidgetSuggestionProducer replacementContainerBundleIdForDonationBundleId:](ATXRSWidgetSuggestionProducer, "replacementContainerBundleIdForDonationBundleId:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = v7;
    v12 = v11;

    v13 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(v6, "widgetKind");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "homeScreenDescriptorForContainerBundleId:widgetKind:", v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      __atxlog_handle_relevant_shortcut();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __79__ATXRSWidgetSuggestionProducer__candidatesFromRelevantShortcutsFromStartDate___block_invoke_cold_1((uint64_t)v12, v6, v17);
      goto LABEL_24;
    }
    objc_msgSend(v6, "shortcut");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "intent");
    v17 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject _type](v17, "_type") == 3 || !-[NSObject _type](v17, "_type"))
    {

      v17 = 0;
    }
    v27 = v12;
    objc_msgSend(v15, "intentType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[NSObject _className](v17, "_className");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "intentType");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqualToString:", v3))
      {

LABEL_23:
        objc_msgSend(v6, "relevanceProviders");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_pas_mappedArrayWithTransform:", &__block_literal_global_13);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = -[ATXRelevantShortcutCandidate initWithWidgetDescriptor:donationBundleIdentifier:intent:relevantContexts:]([ATXRelevantShortcutCandidate alloc], "initWithWidgetDescriptor:donationBundleIdentifier:intent:relevantContexts:", v15, v7, v17, v23);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v24);

        v12 = v27;
LABEL_24:

        goto LABEL_25;
      }
    }
    -[NSObject _className](v17, "_className");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {

      if (v18)
      {

      }
    }
    else
    {
      objc_msgSend(v15, "intentType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {

      }
      if (!v20)
        goto LABEL_23;
    }
    __atxlog_handle_relevant_shortcut();
    v21 = objc_claimAutoreleasedReturnValue();
    v12 = v27;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      -[NSObject _className](v17, "_className");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "intentType");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v29 = v25;
      v30 = 2112;
      v31 = v26;
      v32 = 2112;
      v33 = v27;
      _os_log_error_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_ERROR, "ATXRSWidgetSuggestionProducer: donated intent (%@) and matching descriptor intent (%@) do not match for containerBundleId %@", buf, 0x20u);

    }
    goto LABEL_24;
  }
LABEL_25:

}

id __79__ATXRSWidgetSuggestionProducer__candidatesFromRelevantShortcutsFromStartDate___block_invoke_48(uint64_t a1, uint64_t a2)
{
  return +[ATXRelevantContextConverter contextFromRelevanceProvider:](ATXRelevantContextConverter, "contextFromRelevanceProvider:", a2);
}

- (id)_infoSuggestionFromCandidate:(id)a3 suggestionIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  ATXWidgetSuggestionAbuseGuard *abuseGuard;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v27;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "donationBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXRSWidgetSuggestionProducer replacementContainerBundleIdForDonationBundleId:](ATXRSWidgetSuggestionProducer, "replacementContainerBundleIdForDonationBundleId:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v5, "donationBundleIdentifier");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v27 = v10;

  v11 = objc_alloc(MEMORY[0x1E0D81150]);
  objc_msgSend(v5, "widgetDescriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "extensionBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widgetDescriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "kind");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widgetDescriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "atx_layoutOptions");
  objc_msgSend(v5, "intent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v11, "initWithAppBundleIdentifier:widgetBundleIdentifier:widgetKind:criterion:applicableLayouts:suggestionIdentifier:startDate:endDate:intent:metadata:relevanceScore:", v27, v13, v15, &stru_1E82FDC98, v17, v6, 0, 0, v18, 0, 0);

  abuseGuard = self->_abuseGuard;
  objc_msgSend(v19, "widgetBundleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "widgetKind");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "intent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(abuseGuard) = -[ATXWidgetSuggestionAbuseGuard shouldDemoteSuggestionsForWidget:kind:intent:](abuseGuard, "shouldDemoteSuggestionsForWidget:kind:intent:", v21, v22, v23);

  if ((_DWORD)abuseGuard)
    v24 = 2;
  else
    v24 = 3;
  objc_msgSend(v19, "setConfidenceLevel:", -[ATXInfoToBlendingConfidenceMapper minInfoConfidenceLevelForBlendingConfidenceCategory:](self->_confidenceMapper, "minInfoConfidenceLevelForBlendingConfidenceCategory:", v24));

  return v19;
}

- (void)_pushSuggestionsToBlendingIfNecessary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D81198]);
  objc_msgSend((id)objc_opt_class(), "_clientModelIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXClientModelSuggestionReceiver blendingLayerServer](self->_suggestionReceiver, "blendingLayerServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithClientModelId:blendingLayerServer:", v6, v7);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__ATXRSWidgetSuggestionProducer__pushSuggestionsToBlendingIfNecessary___block_invoke;
  v11[3] = &unk_1E82DBAD8;
  v11[4] = self;
  v12 = v4;
  v13 = v8;
  v9 = v8;
  v10 = v4;
  objc_msgSend(v9, "retrieveCurrentSuggestionsWithReply:", v11);

}

void __71__ATXRSWidgetSuggestionProducer__pushSuggestionsToBlendingIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 104);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__ATXRSWidgetSuggestionProducer__pushSuggestionsToBlendingIfNecessary___block_invoke_2;
  v8[3] = &unk_1E82DBAB0;
  v8[4] = v4;
  v9 = v5;
  v10 = v3;
  v11 = *(id *)(a1 + 48);
  v7 = v3;
  dispatch_async(v6, v8);

}

void __71__ATXRSWidgetSuggestionProducer__pushSuggestionsToBlendingIfNecessary___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  uint8_t buf[16];

  if (objc_msgSend(*(id *)(a1 + 32), "_areInfoSuggestions:equalToProactiveSuggestions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)))
  {
    __atxlog_handle_relevant_shortcut();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "ATXRSWidgetSuggestionProducer: Short-circuiting Blending update, since set of suggestions has not changed.", buf, 2u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "featurizeInfoSuggestions:", *(_QWORD *)(a1 + 40));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "sortFeaturizedSuggestions:withFeatureWeights:", v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_proactiveSuggestionsFromScoredInfoSuggestions:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "updateSuggestions:completionHandler:", v4, &__block_literal_global_57);

  }
}

void __71__ATXRSWidgetSuggestionProducer__pushSuggestionsToBlendingIfNecessary___block_invoke_55(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    __atxlog_handle_relevant_shortcut();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __71__ATXRSWidgetSuggestionProducer__pushSuggestionsToBlendingIfNecessary___block_invoke_55_cold_1();

  }
}

- (BOOL)_areInfoSuggestions:(id)a3 equalToProactiveSuggestions:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  BOOL v29;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") || objc_msgSend(v7, "count"))
  {
    v8 = objc_msgSend(v6, "count");
    if (v8 == objc_msgSend(v7, "count"))
    {
      v9 = (void *)objc_opt_new();
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v10 = v6;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v38 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            objc_msgSend(v15, "suggestionIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v16);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        }
        while (v12);
      }

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v17 = v7;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v34;
        v31 = v7;
        v32 = v6;
        while (2)
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v34 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
            objc_msgSend(v22, "executableSpecification", v31, v32, (_QWORD)v33);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "executableIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectForKeyedSubscript:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v25
              || (v26 = -[ATXInfoToBlendingConfidenceMapper blendingConfidenceCategoryForInfoConfidenceLevel:](self->_confidenceMapper, "blendingConfidenceCategoryForInfoConfidenceLevel:", objc_msgSend(v25, "confidenceLevel")), objc_msgSend(v22, "scoreSpecification"), v27 = (void *)objc_claimAutoreleasedReturnValue(), v28 = objc_msgSend(v27, "suggestedConfidenceCategory"), v27, v26 != v28))
            {

              v29 = 0;
              v7 = v31;
              v6 = v32;
              goto LABEL_24;
            }

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          v29 = 1;
          v7 = v31;
          v6 = v32;
          if (v19)
            continue;
          break;
        }
      }
      else
      {
        v29 = 1;
      }
LABEL_24:

    }
    else
    {
      v29 = 0;
    }
  }
  else
  {
    v29 = 1;
  }

  return v29;
}

- (id)_proactiveSuggestionsFromScoredInfoSuggestions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  ATXRSWidgetSuggestionProducer *v25;
  id obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[16];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27 = (id)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    v8 = 0x1E0D81000uLL;
    v25 = self;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v10, "suggestion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[ATXInfoToBlendingConfidenceMapper blendingConfidenceCategoryForInfoConfidenceLevel:](self->_confidenceMapper, "blendingConfidenceCategoryForInfoConfidenceLevel:", objc_msgSend(v11, "confidenceLevel"));
        v13 = *(void **)(v8 + 336);
        objc_msgSend((id)objc_opt_class(), "_clientModelIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "score");
        objc_msgSend(v13, "proactiveSuggestionForInfoSuggestion:withClientModelId:clientModelVersion:rawScore:confidenceCategory:", v11, v14, CFSTR("0.1"), v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        __atxlog_handle_relevant_shortcut();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v15)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v11, "suggestionIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "intent");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "intentDescription");
            v20 = v6;
            v21 = v7;
            v22 = v8;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v33 = v18;
            v34 = 2112;
            v35 = v23;
            _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "ATXRSWidgetSuggestionProducer: Pushing suggestion to Blending: Suggestion ID = %@, intent description %@", buf, 0x16u);

            v8 = v22;
            v7 = v21;
            v6 = v20;
            self = v25;

          }
          objc_msgSend(v27, "addObject:", v15);
        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[ATXRSWidgetSuggestionProducer _proactiveSuggestionsFromScoredInfoSuggestions:].cold.1((uint64_t)v36, (uint64_t)v11);

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v6);
  }

  return v27;
}

+ (id)_clientModelIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 20);
}

+ (id)replacementContainerBundleIdForDonationBundleId:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = replacementContainerBundleIdForDonationBundleId___pasOnceToken35;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&replacementContainerBundleIdForDonationBundleId___pasOnceToken35, &__block_literal_global_62);
  objc_msgSend((id)replacementContainerBundleIdForDonationBundleId___pasExprOnceResult, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __81__ATXRSWidgetSuggestionProducer_replacementContainerBundleIdForDonationBundleId___block_invoke()
{
  void *v0;
  void *v1;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = (void *)replacementContainerBundleIdForDonationBundleId___pasExprOnceResult;
  replacementContainerBundleIdForDonationBundleId___pasExprOnceResult = (uint64_t)&unk_1E83D08B0;

  objc_autoreleasePoolPop(v0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescedRefreshRelevantShortcutsOperation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_widgetRelevanceService, 0);
  objc_storeStrong((id *)&self->_metadataProvider, 0);
  objc_storeStrong((id *)&self->_suggestionReceiver, 0);
  objc_storeStrong((id *)&self->_confidenceMapper, 0);
  objc_storeStrong((id *)&self->_ranker, 0);
  objc_storeStrong((id *)&self->_featureWeights, 0);
  objc_storeStrong((id *)&self->_featurizer, 0);
  objc_storeStrong((id *)&self->_abuseGuard, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_relevanceMonitor, 0);
  objc_storeStrong((id *)&self->_descriptorCache, 0);
  objc_storeStrong((id *)&self->_duetHelper, 0);
}

void __212__ATXRSWidgetSuggestionProducer_initWithDuetHelper_descriptorCache_relevanceMonitor_filter_abuseGuard_featurizer_featureWeights_ranker_confidenceMapper_suggestionReceiver_metadataProvider_widgetRelevanceService___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "ATXRSWidgetSuggestionProducer: couldn't refresh relevant shortcuts because self is nil", v1, 2u);
}

void __58__ATXRSWidgetSuggestionProducer__refreshRelevantShortcuts__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "ATXRSWidgetSuggestionProducer: error fetching relevant intents from provider: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)relevantShortcutCandidateFromLNRelevantIntent:donationBundleId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "ATXRSWidgetSuggestionProducer: skipping relevant intent, no matching descriptor found: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)relevantShortcutCandidateFromLNRelevantIntent:donationBundleId:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_5_0(&dword_1C9A3B000, v1, (uint64_t)v1, "ATXRSWidgetSuggestionProducer: error fetching metadata for relevant intent link action: %@, %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __79__ATXRSWidgetSuggestionProducer__candidatesFromRelevantShortcutsFromStartDate___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "widgetKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_5_0(&dword_1C9A3B000, a3, v6, "ATXRSWidgetSuggestionProducer: Unable to find descriptor for eligible containerBundleId (%@) and widgetKind (%@)", (uint8_t *)&v7);

}

void __71__ATXRSWidgetSuggestionProducer__pushSuggestionsToBlendingIfNecessary___block_invoke_55_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "ATXRSWidgetSuggestionProducer: Blending update failed due to error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_proactiveSuggestionsFromScoredInfoSuggestions:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD *v3;
  uint8_t *v4;
  void *v5;

  objc_msgSend((id)OUTLINED_FUNCTION_2_2(a1, a2), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v4 = 138412290;
  *v3 = v5;
  _os_log_error_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_ERROR, "ATXRSWidgetSuggestionProducer: failed to convert ATXInfoSuggestion to ATXProactiveSuggestion: %@", v4, 0xCu);

  OUTLINED_FUNCTION_3_2();
}

@end

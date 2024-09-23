@implementation ATXContextHeuristicsMetricCollector

- (void)postZkwMetrics
{
  -[ATXContextHeuristicsMetricCollector postWeeklyMetrics](self, "postWeeklyMetrics");
  -[ATXContextHeuristicsMetricCollector postLifetimeEngagementMetrics](self, "postLifetimeEngagementMetrics");
  -[ATXContextHeuristicsMetricCollector postRecentsMetrics](self, "postRecentsMetrics");
}

- (void)postWeeklyMetrics
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("SuggestionsSpotlightZKWRecentsEnabled"), CFSTR("com.apple.suggestions"));
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = 1;

  objc_msgSend(v3, "setAreSpotlightRecentsEnabled:", v6);
  v7 = (void *)CFPreferencesCopyAppValue(CFSTR("SuggestionsSpotlightZKWEnabled"), CFSTR("com.apple.suggestions"));
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "BOOLValue");
  else
    v9 = 1;

  objc_msgSend(v3, "setAreSpotlightSuggestionsEnabled:", v9);
  -[ATXContextHeuristicsMetricCollector fillWeeklyStatisticsMetricWithSpotlightUIStream:biomeConfig:](self, "fillWeeklyStatisticsMetricWithSpotlightUIStream:biomeConfig:", v3, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.spotlightui"));
  v11 = objc_msgSend(v10, "BOOLForKey:", CFSTR("SpotlightZKWExpanded"));
  v12 = objc_msgSend(MEMORY[0x1E0D81588], "isiPad");
  v13 = 4;
  if (v12)
    v13 = 6;
  v14 = 8;
  if (v12)
    v14 = 12;
  if (v11)
    v15 = v14;
  else
    v15 = v13;
  objc_msgSend(v3, "setNumAppSuggestionsVisibleInSpotlight:", v15);
  objc_msgSend(MEMORY[0x1E0CF9128], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trialTreatmentId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTrialTreatmentId:", v17);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v16, "trialDeploymentId"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTrialDeploymentId:", v19);

  objc_msgSend(v16, "trialExperimentId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTrialExperimentId:", v20);

  getTrialAssets();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trialTreatmentId");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAtxTrialTreatmentId:", v22);

  objc_msgSend(v21, "trialExperimentId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAtxTrialExperimentId:", v23);

  objc_msgSend(v21, "trialDeploymentId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAtxTrialDeploymentId:", v24);

  __atxlog_handle_metrics();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "coreAnalyticsDictionary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138412290;
    v28 = v26;
    _os_log_impl(&dword_1C9A3B000, v25, OS_LOG_TYPE_DEFAULT, "ZKW: Weekly metrics dict - %@", (uint8_t *)&v27, 0xCu);

  }
  objc_msgSend(v3, "logToCoreAnalytics");

}

- (void)postLifetimeEngagementMetrics
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CF9128], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getTrialAssets();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXContextHeuristicsMetricCollector lifetimeEngagementMetricsWithBiomeConfig:](self, "lifetimeEngagementMetricsWithBiomeConfig:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v23;
    *(_QWORD *)&v7 = 138412290;
    v21 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v10);
        objc_msgSend(v3, "trialTreatmentId", v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setTrialTreatmentId:", v12);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "trialDeploymentId"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setTrialDeploymentId:", v14);

        objc_msgSend(v3, "trialExperimentId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setTrialExperimentId:", v15);

        objc_msgSend(v4, "trialTreatmentId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setAtxTrialTreatmentId:", v16);

        objc_msgSend(v4, "trialExperimentId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setAtxTrialExperimentId:", v17);

        objc_msgSend(v4, "trialDeploymentId");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setAtxTrialDeploymentId:", v18);

        __atxlog_handle_metrics();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "coreAnalyticsDictionary");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v21;
          v27 = v20;
          _os_log_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_DEFAULT, "ZKW: Lifetime engagement metric dict - %@", buf, 0xCu);

        }
        objc_msgSend(v11, "logToCoreAnalytics");
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v8);
  }

}

- (void)postRecentsMetrics
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CF9128], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getTrialAssets();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXContextHeuristicsMetricCollector recentsMetricsWithBiomeConfig:](self, "recentsMetricsWithBiomeConfig:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v23;
    *(_QWORD *)&v7 = 138412290;
    v21 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v10);
        objc_msgSend(v3, "trialTreatmentId", v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setTrialTreatmentId:", v12);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "trialDeploymentId"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setTrialDeploymentId:", v14);

        objc_msgSend(v3, "trialExperimentId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setTrialExperimentId:", v15);

        objc_msgSend(v4, "trialTreatmentId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setAtxTrialTreatmentId:", v16);

        objc_msgSend(v4, "trialExperimentId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setAtxTrialExperimentId:", v17);

        objc_msgSend(v4, "trialDeploymentId");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setAtxTrialDeploymentId:", v18);

        __atxlog_handle_metrics();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "coreAnalyticsDictionary");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v21;
          v27 = v20;
          _os_log_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_DEFAULT, "ZKW: Recents metric dict - %@", buf, 0xCu);

        }
        objc_msgSend(v11, "logToCoreAnalytics");
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v8);
  }

}

- (void)fillWeeklyStatisticsMetricWithSpotlightUIStream:(id)a3 biomeConfig:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a3;
  v6 = (objc_class *)MEMORY[0x1E0D81200];
  v7 = a4;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithStoreConfig:", v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -604800.0);
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v11 = v10;

  objc_msgSend(v8, "publisherFromStartTime:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __99__ATXContextHeuristicsMetricCollector_fillWeeklyStatisticsMetricWithSpotlightUIStream_biomeConfig___block_invoke_2;
  v15[3] = &unk_1E82DB0C8;
  v16 = v5;
  v13 = v5;
  v14 = (id)objc_msgSend(v12, "sinkWithCompletion:receiveInput:", &__block_literal_global_151, v15);

}

void __99__ATXContextHeuristicsMetricCollector_fillWeeklyStatisticsMetricWithSpotlightUIStream_biomeConfig___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    __atxlog_handle_metrics();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __99__ATXContextHeuristicsMetricCollector_fillWeeklyStatisticsMetricWithSpotlightUIStream_biomeConfig___block_invoke_2_cold_2();

  }
  objc_msgSend(v3, "suggestionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v3, "eventType"))
  {
    case 0:
      __atxlog_handle_metrics();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __99__ATXContextHeuristicsMetricCollector_fillWeeklyStatisticsMetricWithSpotlightUIStream_biomeConfig___block_invoke_2_cold_1();

      break;
    case 4:
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("app")))
      {
        objc_msgSend(*(id *)(a1 + 32), "setNumSpotlightAppSuggestionTaps:", objc_msgSend(*(id *)(a1 + 32), "numSpotlightAppSuggestionTaps") + 1);
      }
      else
      {
        objc_msgSend(v3, "suggestionType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("action"));

        if (v10)
        {
          objc_msgSend(*(id *)(a1 + 32), "setNumSpotlightActionSuggestionTaps:", objc_msgSend(*(id *)(a1 + 32), "numSpotlightActionSuggestionTaps") + 1);
        }
        else
        {
          objc_msgSend(v3, "suggestionType");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("recent"));

          if (v12)
            objc_msgSend(*(id *)(a1 + 32), "setNumRecentsTaps:", objc_msgSend(*(id *)(a1 + 32), "numRecentsTaps") + 1);
        }
      }
      break;
    case 5:
      objc_msgSend(v3, "suggestionType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("app"));

      if (v8)
        objc_msgSend(*(id *)(a1 + 32), "setNumSpotlightSearchAppTaps:", objc_msgSend(*(id *)(a1 + 32), "numSpotlightSearchAppTaps") + 1);
      break;
    case 6:
      objc_msgSend(*(id *)(a1 + 32), "setNumSpotlightViews:", objc_msgSend(*(id *)(a1 + 32), "numSpotlightViews") + 1);
      break;
    default:
      break;
  }

}

- (id)lifetimeEngagementMetricsWithBiomeConfig:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0D81200];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithStoreConfig:", v5);

  objc_msgSend(v6, "publisherFromStartTime:", 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXContextHeuristicsMetricCollector lifetimeEngagementMetricsWithPublisher:](self, "lifetimeEngagementMetricsWithPublisher:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)lifetimeEngagementMetricsWithPublisher:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v13;
  _QWORD v14[6];
  _QWORD v15[7];
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v4 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__67;
  v28 = __Block_byref_object_dispose__67;
  v29 = (id)objc_opt_new();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__67;
  v22 = __Block_byref_object_dispose__67;
  -[ATXContextHeuristicsMetricCollector spotlightUIBookmark](self, "spotlightUIBookmark");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__67;
  v16[4] = __Block_byref_object_dispose__67;
  objc_msgSend((id)v19[5], "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXContextHeuristicsMetricCollector trackerFromBookmarkDictionary:](self, "trackerFromBookmarkDictionary:", v5);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)v19[5], "bookmark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke;
  v15[3] = &unk_1E82E66A8;
  v15[4] = self;
  v15[5] = &v18;
  v15[6] = v16;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke_2;
  v14[3] = &unk_1E82DE238;
  v14[4] = v16;
  v14[5] = &v24;
  v7 = (id)objc_msgSend(v4, "sinkWithBookmark:completion:receiveInput:", v6, v15, v14);

  v8 = (void *)v19[5];
  v13 = 0;
  objc_msgSend(v8, "saveBookmarkWithError:", &v13);
  v9 = v13;
  if (v9)
  {
    __atxlog_handle_metrics();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ATXContextHeuristicsMetricCollector lifetimeEngagementMetricsWithPublisher:].cold.1();

  }
  v11 = (id)v25[5];

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v11;
}

void __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setBookmark:");
  objc_msgSend(*(id *)(a1 + 32), "saveableBookmarkDictionaryFromTracker:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setMetadata:", v2);

}

void __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    __atxlog_handle_metrics();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __99__ATXContextHeuristicsMetricCollector_fillWeeklyStatisticsMetricWithSpotlightUIStream_biomeConfig___block_invoke_2_cold_2();

  }
  objc_msgSend(v3, "suggestionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("action"));

  if (v6)
  {
    objc_msgSend(v3, "suggestionUniqueId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      switch(objc_msgSend(v3, "eventType"))
      {
        case 0:
        case 5:
        case 6:
          __atxlog_handle_metrics();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke_2_cold_6(v3, v8);
          goto LABEL_12;
        case 1:
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            __atxlog_handle_metrics();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
              __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke_2_cold_2(v3, v10);

          }
          v11 = (void *)objc_opt_new();
          objc_msgSend(v3, "suggestionSubtype");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setActionId:", v12);

          objc_msgSend(v3, "suggestionContext");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setContextType:", v13);

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v11, v7);
          break;
        case 2:
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v7);
            v16 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v16);
          }
          else
          {
            __atxlog_handle_metrics();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke_2_cold_3();
          }

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "removeObjectForKey:", v7);
          break;
        case 3:
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v7);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v7);
            v8 = objc_claimAutoreleasedReturnValue();
            -[NSObject setNumShown:](v8, "setNumShown:", -[NSObject numShown](v8, "numShown") + 1);
          }
          else
          {
            __atxlog_handle_metrics();
            v8 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
              __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke_2_cold_4();
          }
          goto LABEL_12;
        case 4:
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v7);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v7);
            v8 = objc_claimAutoreleasedReturnValue();
            -[NSObject setNumEngaged:](v8, "setNumEngaged:", -[NSObject numEngaged](v8, "numEngaged") + 1);
          }
          else
          {
            __atxlog_handle_metrics();
            v8 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
              __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke_2_cold_5();
          }
          goto LABEL_12;
        default:
          break;
      }
    }
    else
    {
      __atxlog_handle_metrics();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke_2_cold_1();
LABEL_12:

    }
  }

}

- (id)spotlightUIBookmark
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v2 = objc_alloc(MEMORY[0x1E0C99E98]);
  objc_msgSend(MEMORY[0x1E0CF94D8], "bookmarksPathFile:", CFSTR("spotlightUILifetime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initFileURLWithPath:", v3);

  v5 = (void *)MEMORY[0x1E0CF94A0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bookmarkFromURLPath:maxFileSize:versionNumber:", v4, 1000000, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0CF94A0]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "initWithURLPath:versionNumber:bookmark:metadata:", v4, v9, 0, 0);

  }
  return v7;
}

- (id)saveableBookmarkDictionaryFromTracker:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v18 = (id)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v17 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v9, "actionId");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "contextType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "numShown"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "numEngaged"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@:%@:%@:%@"), v11, v12, v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, v8);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  return v18;
}

- (id)trackerFromBookmarkDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v10, (_QWORD)v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(":"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "count") != 4)
        {
          __atxlog_handle_metrics();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            -[ATXContextHeuristicsMetricCollector trackerFromBookmarkDictionary:].cold.1(v12, v18);

          goto LABEL_13;
        }
        v13 = (void *)objc_opt_new();
        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setActionId:", v14);

        objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setContextType:", v15);

        objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setNumShown:", objc_msgSend(v16, "integerValue"));

        objc_msgSend(v12, "objectAtIndexedSubscript:", 3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setNumEngaged:", objc_msgSend(v17, "integerValue"));

        objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

  return v4;
}

- (id)recentsMetricsWithBiomeConfig:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81200]), "initWithStoreConfig:", v3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -2419200.0);
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__67;
  v26 = __Block_byref_object_dispose__67;
  v27 = (id)objc_opt_new();
  objc_msgSend(v4, "publisherFromStartTime:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __69__ATXContextHeuristicsMetricCollector_recentsMetricsWithBiomeConfig___block_invoke_2;
  v21[3] = &unk_1E82DBE68;
  v21[4] = &v22;
  v9 = (id)objc_msgSend(v8, "sinkWithCompletion:receiveInput:", &__block_literal_global_39_1, v21);

  v10 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = (id)v23[5];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v28, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend((id)v23[5], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14), (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v28, 16);
    }
    while (v12);
  }

  _Block_object_dispose(&v22, 8);
  return v10;
}

void __69__ATXContextHeuristicsMetricCollector_recentsMetricsWithBiomeConfig___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __99__ATXContextHeuristicsMetricCollector_fillWeeklyStatisticsMetricWithSpotlightUIStream_biomeConfig___block_invoke_2_cold_2();

  }
  objc_msgSend(v4, "suggestionType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("recent"));

  if (!v7)
    goto LABEL_19;
  v8 = objc_msgSend(v4, "eventType");
  switch(v8)
  {
    case 4:
      objc_msgSend(v4, "suggestionUniqueId");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v11 = (void *)objc_opt_new();
        objc_msgSend(v4, "suggestionSubtype");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setRecentType:", v12);

        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceReferenceDate");
        v15 = v14;
        objc_msgSend(v3, "timestamp");
        objc_msgSend(v11, "setRecentAge:", (unint64_t)((v15 - v16) / 604800.0 + 1.0));

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v11, v9);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setNumEngaged:", objc_msgSend(v17, "numEngaged") + 1);
      goto LABEL_17;
    case 3:
      objc_msgSend(v4, "suggestionUniqueId");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        v19 = (void *)objc_opt_new();
        objc_msgSend(v4, "suggestionSubtype");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setRecentType:", v20);

        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "timeIntervalSinceReferenceDate");
        v23 = v22;
        objc_msgSend(v3, "timestamp");
        objc_msgSend(v19, "setRecentAge:", (unint64_t)((v23 - v24) / 604800.0 + 1.0));

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v19, v9);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setNumSearched:", objc_msgSend(v17, "numSearched") + 1);
LABEL_17:

LABEL_18:
      break;
    case 0:
      __atxlog_handle_metrics();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __99__ATXContextHeuristicsMetricCollector_fillWeeklyStatisticsMetricWithSpotlightUIStream_biomeConfig___block_invoke_2_cold_1();
      goto LABEL_18;
  }
LABEL_19:

}

void __99__ATXContextHeuristicsMetricCollector_fillWeeklyStatisticsMetricWithSpotlightUIStream_biomeConfig___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Unknown UI event type received", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __99__ATXContextHeuristicsMetricCollector_fillWeeklyStatisticsMetricWithSpotlightUIStream_biomeConfig___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "ZKW: ui event is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)lifetimeEngagementMetricsWithPublisher:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, v0, v1, "ZKW: Unable to save Spotlight UI bookmark due to : %@", v2);
}

void __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ZKW: nil identifier received", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke_2_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "suggestionSubtype");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "ZKW: Event with same identifier added to cache again. Action id: %@", v4, 0xCu);

  OUTLINED_FUNCTION_1();
}

void __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ZKW: Item removed from cache, but metrics event does not exist.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke_2_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ZKW: Item shown in zkw, but metrics event does not exist.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke_2_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ZKW: Item engaged in zkw, but metrics event does not exist.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __78__ATXContextHeuristicsMetricCollector_lifetimeEngagementMetricsWithPublisher___block_invoke_2_cold_6(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "eventType");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, v3, "ZKW: Incorrect UI event type for actions: %lu", v4);
  OUTLINED_FUNCTION_1();
}

- (void)trackerFromBookmarkDictionary:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, v3, "Incorrect size from bookmark dictionary: %lu", v4);
  OUTLINED_FUNCTION_1();
}

@end

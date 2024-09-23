@implementation ATXHomeScreenWidgetDiscoverabilityLogHarvester

- (ATXHomeScreenWidgetDiscoverabilityLogHarvester)init
{
  ATXHomeScreenWidgetDiscoverabilityLogHarvester *v2;
  uint64_t v3;
  NSMutableDictionary *widgetDiscoverabilityDictionaries;
  id v5;
  uint64_t v6;
  NSUserDefaults *defaults;
  void *v8;
  void *v9;
  uint64_t v10;
  BMStream *appLaunchStream;
  uint64_t v12;
  NSMutableDictionary *appUsageDictionary;
  uint64_t v14;
  ATXTimelineRelevanceAdoption *timelineRelevanceAdoptionHelper;
  uint64_t v16;
  NSDictionary *globalPopularityDictionary;
  uint64_t v18;
  NSMutableArray *metricsPerAlgorithm;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)ATXHomeScreenWidgetDiscoverabilityLogHarvester;
  v2 = -[ATXHomeScreenWidgetDiscoverabilityLogHarvester init](&v21, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    widgetDiscoverabilityDictionaries = v2->_widgetDiscoverabilityDictionaries;
    v2->_widgetDiscoverabilityDictionaries = (NSMutableDictionary *)v3;

    v5 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v6 = objc_msgSend(v5, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v6;

    BiomeLibrary();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "App");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "InFocus");
    v10 = objc_claimAutoreleasedReturnValue();
    appLaunchStream = v2->_appLaunchStream;
    v2->_appLaunchStream = (BMStream *)v10;

    v12 = objc_opt_new();
    appUsageDictionary = v2->_appUsageDictionary;
    v2->_appUsageDictionary = (NSMutableDictionary *)v12;

    v14 = objc_opt_new();
    timelineRelevanceAdoptionHelper = v2->_timelineRelevanceAdoptionHelper;
    v2->_timelineRelevanceAdoptionHelper = (ATXTimelineRelevanceAdoption *)v14;

    -[ATXHomeScreenWidgetDiscoverabilityLogHarvester _globalPopularityDictionary](v2, "_globalPopularityDictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    globalPopularityDictionary = v2->_globalPopularityDictionary;
    v2->_globalPopularityDictionary = (NSDictionary *)v16;

    v2->_isiPad = objc_msgSend(MEMORY[0x1E0D81588], "isiPad");
    v18 = objc_opt_new();
    metricsPerAlgorithm = v2->_metricsPerAlgorithm;
    v2->_metricsPerAlgorithm = (NSMutableArray *)v18;

  }
  return v2;
}

- (id)_globalPopularityDictionary
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  objc_msgSend(MEMORY[0x1E0CF8CF0], "dictionaryFromLazyPlistForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    __atxlog_handle_home_screen();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ATXHomeScreenWidgetDiscoverabilityLogHarvester _globalPopularityDictionary].cold.1(v5, v13, v14, v15, v16, v17, v18, v19);
    v4 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("widgetGlobalPopularityStack"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    __atxlog_handle_home_screen();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ATXHomeScreenWidgetDiscoverabilityLogHarvester _globalPopularityDictionary].cold.2(v5, v6, v7, v8, v9, v10, v11, v12);
LABEL_8:

  }
  return v4;
}

- (void)generateWidgetDiscoverabilityMetricsWithActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint8_t buf[8];
  id v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CF9210], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v5, "fetchHomeScreenWidgetDescriptorMetadataWithError:", &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v19;
  if (v7)
  {
    __atxlog_handle_home_screen();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ATXHomeScreenWidgetDiscoverabilityLogHarvester generateWidgetDiscoverabilityMetricsWithActivity:].cold.1((uint64_t)v7, v8);
  }
  else
  {
    +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "histogramForLaunchType:", 1);
    v8 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc(MEMORY[0x1E0CF8D70]);
    objc_msgSend(v5, "homeScreenDescriptors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithDescriptors:descriptorInstallDates:homeScreenConfig:isDayZeroExperience:isiPad:spotlightAppLaunchHistogram:adblDrainClassification:appLaunchCounts:", v13, v6, MEMORY[0x1E0C9AA60], 0, self->_isiPad, v8, 1, v11);

    -[ATXHomeScreenWidgetDiscoverabilityLogHarvester _generateSummaryMetricsWithDescriptorCache:withActivity:](self, "_generateSummaryMetricsWithDescriptorCache:withActivity:", v6, v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 && (objc_msgSend(v4, "didDefer") & 1) == 0)
    {
      v17 = 0;
      do
      {
        -[ATXHomeScreenWidgetDiscoverabilityLogHarvester _generateWidgetDiscoverabilityMetricsWithHomeScreenItemProducer:descriptors:appMetrics:algorithm:](self, "_generateWidgetDiscoverabilityMetricsWithHomeScreenItemProducer:descriptors:appMetrics:algorithm:", v14, v6, v15, v17);
        v17 = (v17 + 1);
      }
      while ((_DWORD)v17 != 4);
    }
    else
    {
      __atxlog_handle_home_screen();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenWidgetDiscoverabilityLogHarvester: Deferring metric harvesting for default stacks.", buf, 2u);
      }

    }
  }

}

- (id)_shortDescriptionForAlgorithm:(int)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CF8D78], "stringForAlgorithmType:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", *MEMORY[0x1E0CF95A8]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("(onboarding_outcome_unset)");
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_generateWidgetDiscoverabilityMetricsWithHomeScreenItemProducer:(id)a3 descriptors:(id)a4 appMetrics:(id)a5 algorithm:(int)a6
{
  uint64_t v6;
  id v9;
  id v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *widgetDiscoverabilityDictionaries;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[3];

  v6 = *(_QWORD *)&a6;
  v20[2] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a3;
  v11 = (NSMutableDictionary *)objc_opt_new();
  widgetDiscoverabilityDictionaries = self->_widgetDiscoverabilityDictionaries;
  self->_widgetDiscoverabilityDictionaries = v11;

  objc_msgSend(v10, "personalizedOnboardingStacksWithRankingAlgorithm:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "stack1");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  objc_msgSend(v13, "stack2");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXHomeScreenWidgetDiscoverabilityLogHarvester _shortDescriptionForAlgorithm:](self, "_shortDescriptionForAlgorithm:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_widgetDiscoverabilityDictionaries, "setObject:forKeyedSubscript:", v17, CFSTR("algorithm"));

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __147__ATXHomeScreenWidgetDiscoverabilityLogHarvester__generateWidgetDiscoverabilityMetricsWithHomeScreenItemProducer_descriptors_appMetrics_algorithm___block_invoke;
  v19[3] = &unk_1E82DC820;
  v19[4] = self;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v19);
  objc_msgSend(v13, "sortedThirdPartyWidgets");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenWidgetDiscoverabilityLogHarvester _logRankBasedMetricsWithOnboardingStacks:algorithm:](self, "_logRankBasedMetricsWithOnboardingStacks:algorithm:", v18, v6);

  -[NSMutableDictionary addEntriesFromDictionary:](self->_widgetDiscoverabilityDictionaries, "addEntriesFromDictionary:", v9);
  -[ATXHomeScreenWidgetDiscoverabilityLogHarvester _logAdblClassificationForUser](self, "_logAdblClassificationForUser");
  -[NSMutableArray addObject:](self->_metricsPerAlgorithm, "addObject:", self->_widgetDiscoverabilityDictionaries);

}

void __147__ATXHomeScreenWidgetDiscoverabilityLogHarvester__generateWidgetDiscoverabilityMetricsWithHomeScreenItemProducer_descriptors_appMetrics_algorithm___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  NSObject *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_fetchStackSuggestionsWithDefaultStack:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") != 4)
  {
    __atxlog_handle_home_screen();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v9 = 4;
      v10 = 2048;
      v11 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "ATXHomeScreenWidgetDiscoverabilityLogHarvester: Expected default stack to contain %lu widgets. %lu widgets found", buf, 0x16u);
    }

  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __147__ATXHomeScreenWidgetDiscoverabilityLogHarvester__generateWidgetDiscoverabilityMetricsWithHomeScreenItemProducer_descriptors_appMetrics_algorithm___block_invoke_107;
  v7[3] = &unk_1E82DC7F8;
  v7[4] = *(_QWORD *)(a1 + 32);
  v7[5] = a3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __147__ATXHomeScreenWidgetDiscoverabilityLogHarvester__generateWidgetDiscoverabilityMetricsWithHomeScreenItemProducer_descriptors_appMetrics_algorithm___block_invoke_107(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = *(_QWORD *)(a1 + 40) + 1;
  v6 = a3 + 1;
  v7 = a2;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("kStack%luWidget%luKey"), v5, v6);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CF9220];
  objc_msgSend(v7, "avocadoDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extensionBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "avocadoDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "kind");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringRepresentationForExtensionBundleId:kind:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v13, v14);
}

- (void)_logAdblClassificationForUser
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CF8D00], "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v5, "fetchADBLDrainClassification"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_widgetDiscoverabilityDictionaries, "setObject:forKeyedSubscript:", v4, CFSTR("adblClassificationForUser"));

}

- (id)_fetchStackSuggestionsWithDefaultStack:(id)a3
{
  if (self->_isiPad)
    objc_msgSend(a3, "mediumDefaultStack");
  else
    objc_msgSend(a3, "smallDefaultStack");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_initializeMetricsAccumulatorWithKeys:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        v11 = (void *)objc_opt_new();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v10, (_QWORD)v13);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_generateSummaryMetricsWithDescriptorCache:(id)a3 withActivity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *appMetricsAccumulator;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  uint8_t buf[16];
  _BYTE v31[128];
  _QWORD v32[8];

  v32[6] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v32[0] = CFSTR("howMany3PAppsHaveWidgets");
  v32[1] = CFSTR("howManyAppsHaveWidgets");
  v32[2] = CFSTR("howManyRegularlyUsed3PAppsHaveWidgets");
  v32[3] = CFSTR("howManyRegularlyUsedAppsHaveWidgets");
  v32[4] = CFSTR("howManyRegularlyUsed3PAppsAdoptedTimelineRelevance");
  v32[5] = CFSTR("howManyTop20AppsHaveWidgets");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenWidgetDiscoverabilityLogHarvester _initializeMetricsAccumulatorWithKeys:](self, "_initializeMetricsAccumulatorWithKeys:", v8);
  v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  appMetricsAccumulator = self->_appMetricsAccumulator;
  self->_appMetricsAccumulator = v9;

  -[ATXHomeScreenWidgetDiscoverabilityLogHarvester _queryAppUsageForAllInstalledApps](self, "_queryAppUsageForAllInstalledApps");
  if (objc_msgSend(v7, "didDefer"))
  {
    __atxlog_handle_home_screen();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenWidgetDiscoverabilityLogHarvester: Deferring metric harvesting for default stacks.", buf, 2u);
    }

    v12 = 0;
  }
  else
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __106__ATXHomeScreenWidgetDiscoverabilityLogHarvester__generateSummaryMetricsWithDescriptorCache_withActivity___block_invoke;
    v29[3] = &unk_1E82DC848;
    v29[4] = self;
    v24 = v6;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v29);
    v12 = (void *)objc_opt_new();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v23 = v8;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x1E0CB37E8];
          -[NSMutableDictionary objectForKeyedSubscript:](self->_appMetricsAccumulator, "objectForKeyedSubscript:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v20, "count"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v15);
    }

    -[ATXHomeScreenWidgetDiscoverabilityLogHarvester _populateDistributionBasedMetricsWithAppMetrics:](self, "_populateDistributionBasedMetricsWithAppMetrics:", v12);
    v6 = v24;
    v8 = v23;
  }

  return v12;
}

void __106__ATXHomeScreenWidgetDiscoverabilityLogHarvester__generateSummaryMetricsWithDescriptorCache_withActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  NSObject *v22;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "containerBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    objc_msgSend(v6, "containerBundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!+[ATXHomeScreenLogUploaderUtilities isFirstPartyApp:](ATXHomeScreenLogUploaderUtilities, "isFirstPartyApp:", v9))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKeyedSubscript:", CFSTR("howMany3PAppsHaveWidgets"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v9);

      if (objc_msgSend(*(id *)(a1 + 32), "_isRegularlyUsedApp:", v9))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKeyedSubscript:", CFSTR("howManyRegularlyUsed3PAppsHaveWidgets"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v9);

        v12 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
        objc_msgSend(v5, "extensionBundleId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "kind");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "globalDiverseSchemaRawNumber:kind:", v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKeyedSubscript:", CFSTR("howManyRegularlyUsed3PAppsAdoptedTimelineRelevance"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v9);

        }
      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKeyedSubscript:", CFSTR("howManyAppsHaveWidgets"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v9);

    if (objc_msgSend(*(id *)(a1 + 32), "_isRegularlyUsedApp:", v9))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKeyedSubscript:", CFSTR("howManyRegularlyUsedAppsHaveWidgets"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v9);

    }
    objc_msgSend(*(id *)(a1 + 32), "_setOfTopTwentyInstalled3PApps");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "containsObject:", v9);

    if (v20)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKeyedSubscript:", CFSTR("howManyTop20AppsHaveWidgets"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v9);

    }
  }
  else
  {
    __atxlog_handle_home_screen();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      __106__ATXHomeScreenWidgetDiscoverabilityLogHarvester__generateSummaryMetricsWithDescriptorCache_withActivity___block_invoke_cold_1(v5, v22);

    v9 = 0;
  }

}

- (void)_queryAppUsageForAllInstalledApps
{
  void *v3;
  id v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8CB8]), "initWithStream:", self->_appLaunchStream);
  objc_msgSend(v3, "rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary addEntriesFromDictionary:](self->_appUsageDictionary, "addEntriesFromDictionary:", v4);
}

- (void)_populateDistributionBasedMetricsWithAppMetrics:(id)a3
{
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[ATXHomeScreenWidgetDiscoverabilityLogHarvester _installed3PAppsWithWidgetsSortedByUsage](self, "_installed3PAppsWithWidgetsSortedByUsage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5 >= 0x14)
    v6 = 20;
  else
    v6 = v5;
  objc_msgSend(v4, "subarrayWithRange:", 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHomeScreenWidgetDiscoverabilityLogHarvester _uniqueDaysAppHasBeenLaunchedOverLast28Days:](self, "_uniqueDaysAppHasBeenLaunchedOverLast28Days:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, CFSTR("maxNumberOfUniqueDaysLaunchedForTop20"));

    objc_msgSend(v7, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHomeScreenWidgetDiscoverabilityLogHarvester _uniqueDaysAppHasBeenLaunchedOverLast28Days:](self, "_uniqueDaysAppHasBeenLaunchedOverLast28Days:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, CFSTR("minNumberOfUniqueDaysLaunchedForTop20"));

    objc_msgSend(v7, "objectAtIndex:", (unint64_t)objc_msgSend(v7, "count") >> 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHomeScreenWidgetDiscoverabilityLogHarvester _uniqueDaysAppHasBeenLaunchedOverLast28Days:](self, "_uniqueDaysAppHasBeenLaunchedOverLast28Days:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("medianNumberOfUniqueDaysLaunchedForTop20"));

  }
}

- (BOOL)_shouldConsiderWidgetWhenCalculatingRankBasedMetricsWithFamilyMask:(unint64_t)a3
{
  _BOOL4 v3;

  if ((a3 & 4) != 0 && self->_isiPad)
    LOBYTE(v3) = 1;
  else
    return !self->_isiPad & (a3 >> 1);
  return v3;
}

- (void)_logRankBasedMetricsWithOnboardingStacks:(id)a3 algorithm:(int)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[8];
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[3];
  BOOL v20;
  _QWORD v21[5];

  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __101__ATXHomeScreenWidgetDiscoverabilityLogHarvester__logRankBasedMetricsWithOnboardingStacks_algorithm___block_invoke;
  v21[3] = &unk_1E82DC870;
  v21[4] = self;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CF8D78], "filterOutDuplicateWidgetsFromSameAppBundleId:", v10);
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = a4 == 3;
  -[ATXHomeScreenWidgetDiscoverabilityLogHarvester _installed3PAppsWithWidgetsSortedByUsage](self, "_installed3PAppsWithWidgetsSortedByUsage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__8;
  v17[4] = __Block_byref_object_dispose__8;
  v12 = (void *)objc_msgSend(v11, "count");
  if (v12)
  {
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = v12;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__8;
  v15[4] = __Block_byref_object_dispose__8;
  if ((unint64_t)objc_msgSend(v11, "count") < 2)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v11, "objectAtIndex:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = v13;
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __101__ATXHomeScreenWidgetDiscoverabilityLogHarvester__logRankBasedMetricsWithOnboardingStacks_algorithm___block_invoke_120;
  v14[3] = &unk_1E82DC898;
  v14[4] = self;
  v14[5] = v19;
  v14[6] = v17;
  v14[7] = v15;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);
  _Block_object_dispose(v15, 8);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);

}

uint64_t __101__ATXHomeScreenWidgetDiscoverabilityLogHarvester__logRankBasedMetricsWithOnboardingStacks_algorithm___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "avocadoDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "_shouldConsiderWidgetWhenCalculatingRankBasedMetricsWithFamilyMask:", objc_msgSend(v3, "supportedFamilies"));

  return v4;
}

void __101__ATXHomeScreenWidgetDiscoverabilityLogHarvester__logRankBasedMetricsWithOnboardingStacks_algorithm___block_invoke_120(_QWORD *a1, void *a2, uint64_t a3)
{
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a2;
  v5 = *(void **)(a1[4] + 40);
  objc_msgSend(v24, "avocadoDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "avocadoDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "kind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "globalDiverseSchemaRawNumber:kind:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CF9220];
  objc_msgSend(v24, "avocadoDescriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "extensionBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "avocadoDescriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "kind");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringRepresentationForExtensionBundleId:kind:", v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_populateRankBasedTimelineAdoptionMetricsForWidgetPersonality:withRank:adoptionScore:", v16, v18, v10);

  v19 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_populateRankBasedGlobalPopularityMetricsForWidgetPersonality:withRank:adoptionScore:", v16, v20, v10);

  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v21 = (void *)a1[4];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "appBundleId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_populateRankBasedMetricsForUsageWithRank:appBundleId:mostRegularlyUsedApp:secondMostRegularlyUsedApp:", v22, v23, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));

  }
}

- (void)_populateRankBasedTimelineAdoptionMetricsForWidgetPersonality:(id)a3 withRank:(id)a4 adoptionScore:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSMutableDictionary *widgetDiscoverabilityDictionaries;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  id v19;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v9)
    goto LABEL_13;
  if (objc_msgSend(v9, "isEqualToNumber:", &unk_1E83CBCE0))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_widgetDiscoverabilityDictionaries, "objectForKeyedSubscript:", CFSTR("firstWidgetThatIsGoodTimelineRelevanceAdopter"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    widgetDiscoverabilityDictionaries = self->_widgetDiscoverabilityDictionaries;
    if (!v11)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](widgetDiscoverabilityDictionaries, "setObject:forKeyedSubscript:", v19, CFSTR("firstWidgetThatIsGoodTimelineRelevanceAdopter"));
      v14 = CFSTR("rankForFirstWidgetThatIsGoodTimelineRelevanceAdopter");
      goto LABEL_7;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](widgetDiscoverabilityDictionaries, "objectForKeyedSubscript:", CFSTR("secondWidgetThatIsGoodTimelineRelevanceAdopter"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_widgetDiscoverabilityDictionaries, "setObject:forKeyedSubscript:", v19, CFSTR("secondWidgetThatIsGoodTimelineRelevanceAdopter"));
      v14 = CFSTR("rankForSecondWidgetThatIsGoodTimelineRelevanceAdopter");
LABEL_7:
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_widgetDiscoverabilityDictionaries, "setObject:forKeyedSubscript:", v8, v14);
    }
  }
  v15 = CFSTR("firstWidgetThatIsTimelineRelevanceAdopter");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_widgetDiscoverabilityDictionaries, "objectForKeyedSubscript:", CFSTR("firstWidgetThatIsTimelineRelevanceAdopter"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v18 = CFSTR("rankForFirstWidgetThatIsTimelineRelevanceAdopter");
    goto LABEL_12;
  }
  v15 = CFSTR("secondWidgetThatIsTimelineRelevanceAdopter");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_widgetDiscoverabilityDictionaries, "objectForKeyedSubscript:", CFSTR("secondWidgetThatIsTimelineRelevanceAdopter"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v18 = CFSTR("rankForSecondWidgetThatIsTimelineRelevanceAdopter");
LABEL_12:
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_widgetDiscoverabilityDictionaries, "setObject:forKeyedSubscript:", v19, v15);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_widgetDiscoverabilityDictionaries, "setObject:forKeyedSubscript:", v8, v18);
  }
LABEL_13:

}

- (void)_populateRankBasedGlobalPopularityMetricsForWidgetPersonality:(id)a3 withRank:(id)a4 adoptionScore:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  NSMutableDictionary *widgetDiscoverabilityDictionaries;
  void *v12;
  const __CFString *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  const __CFString *v17;
  id v18;

  v18 = a3;
  v8 = a4;
  -[NSDictionary objectForKeyedSubscript:](self->_globalPopularityDictionary, "objectForKeyedSubscript:", v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_13;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_widgetDiscoverabilityDictionaries, "objectForKeyedSubscript:", CFSTR("firstWidgetThatIsGloballyPopular"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  widgetDiscoverabilityDictionaries = self->_widgetDiscoverabilityDictionaries;
  if (v10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](widgetDiscoverabilityDictionaries, "objectForKeyedSubscript:", CFSTR("secondWidgetThatIsGloballyPopular"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      goto LABEL_7;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_widgetDiscoverabilityDictionaries, "setObject:forKeyedSubscript:", v18, CFSTR("secondWidgetThatIsGloballyPopular"));
    v13 = CFSTR("rankForSecondWidgetThatIsGloballyPopular");
  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](widgetDiscoverabilityDictionaries, "setObject:forKeyedSubscript:", v18, CFSTR("firstWidgetThatIsGloballyPopular"));
    v13 = CFSTR("rankForFirstWidgetThatIsGloballyPopular");
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_widgetDiscoverabilityDictionaries, "setObject:forKeyedSubscript:", v8, v13);
LABEL_7:
  if (a5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_widgetDiscoverabilityDictionaries, "objectForKeyedSubscript:", CFSTR("firstWidgetThatIsTimelineRelevanceAdopterAndGloballyPopular"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = self->_widgetDiscoverabilityDictionaries;
    if (!v14)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v18, CFSTR("firstWidgetThatIsTimelineRelevanceAdopterAndGloballyPopular"));
      v17 = CFSTR("rankForFirstWidgetThatIsTimelineRelevanceAdopterAndGloballyPopular");
      goto LABEL_12;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("secondWidgetThatIsTimelineRelevanceAdopterAndGloballyPopular"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_widgetDiscoverabilityDictionaries, "setObject:forKeyedSubscript:", v18, CFSTR("secondWidgetThatIsTimelineRelevanceAdopterAndGloballyPopular"));
      v17 = CFSTR("rankForSecondWidgetThatIsTimelineRelevanceAdopterAndGloballyPopular");
LABEL_12:
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_widgetDiscoverabilityDictionaries, "setObject:forKeyedSubscript:", v8, v17);
    }
  }
LABEL_13:

}

- (void)_populateRankBasedMetricsForUsageWithRank:(id)a3 appBundleId:(id)a4 mostRegularlyUsedApp:(id)a5 secondMostRegularlyUsedApp:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_widgetDiscoverabilityDictionaries, "objectForKeyedSubscript:", CFSTR("mostRegularlyUsedAppWithWidget"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

  }
  else if (objc_msgSend(v11, "isEqualToString:", v10))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_widgetDiscoverabilityDictionaries, "setObject:forKeyedSubscript:", v10, CFSTR("mostRegularlyUsedAppWithWidget"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_widgetDiscoverabilityDictionaries, "setObject:forKeyedSubscript:", v15, CFSTR("rankForMostRegularlyUsedAppWithWidget"));
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_widgetDiscoverabilityDictionaries, "objectForKeyedSubscript:", CFSTR("secondMostRegularlyUsedAppWithWidget"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {

  }
  else if (objc_msgSend(v12, "isEqualToString:", v10))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_widgetDiscoverabilityDictionaries, "setObject:forKeyedSubscript:", v10, CFSTR("secondMostRegularlyUsedAppWithWidget"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_widgetDiscoverabilityDictionaries, "setObject:forKeyedSubscript:", v15, CFSTR("rankForSecondMostRegularlyUsedAppWithWidget"));
  }

}

- (void)sendToCoreAnalytics
{
  NSObject *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[8];
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_home_screen();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_INFO, "ATXHomeScreenWidgetDiscoverabilityLogHarvester: sending logs to Core Analytics", buf, 2u);
  }

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_metricsPerAlgorithm;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        AnalyticsSendEvent();
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

}

- (id)dryRunResult
{
  NSMutableArray *metricsPerAlgorithm;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  metricsPerAlgorithm = self->_metricsPerAlgorithm;
  v4 = CFSTR("data");
  v5[0] = metricsPerAlgorithm;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_uniqueDaysAppHasBeenLaunchedOverLast28Days:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_appUsageDictionary, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "uniqueDaysLaunched"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_appLaunchCountForAppBundleId:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_appUsageDictionary, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "rawLaunchCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_isRegularlyUsedApp:(id)a3
{
  void *v3;
  unint64_t v4;
  BOOL v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a3)
  {
    -[ATXHomeScreenWidgetDiscoverabilityLogHarvester _uniqueDaysAppHasBeenLaunchedOverLast28Days:](self, "_uniqueDaysAppHasBeenLaunchedOverLast28Days:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");
    v5 = v4 >= *MEMORY[0x1E0CF9358];

  }
  else
  {
    __atxlog_handle_home_screen();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ATXHomeScreenWidgetDiscoverabilityLogHarvester _isRegularlyUsedApp:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    return 0;
  }
  return v5;
}

- (id)_installedAppsSortedByAppUsage
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allInstalledAppsKnownToSpringBoard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__ATXHomeScreenWidgetDiscoverabilityLogHarvester__installedAppsSortedByAppUsage__block_invoke;
  v7[3] = &unk_1E82DC570;
  v7[4] = self;
  objc_msgSend(v4, "sortedArrayUsingComparator:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __80__ATXHomeScreenWidgetDiscoverabilityLogHarvester__installedAppsSortedByAppUsage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_uniqueDaysAppHasBeenLaunchedOverLast28Days:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "_uniqueDaysAppHasBeenLaunchedOverLast28Days:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  if (v8 == v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "_appLaunchCountForAppBundleId:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

    objc_msgSend(*(id *)(a1 + 32), "_appLaunchCountForAppBundleId:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");

    v15 = -1;
    if (v12 <= v14)
      v15 = 1;
    if (v12 == v14)
      v16 = 0;
    else
      v16 = v15;
  }
  else if (v8 > v10)
  {
    v16 = -1;
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (id)_installed3PAppsSortedByUsage
{
  NSArray *thirdPartyAppsSortedByUsage;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  thirdPartyAppsSortedByUsage = self->_thirdPartyAppsSortedByUsage;
  if (!thirdPartyAppsSortedByUsage)
  {
    -[ATXHomeScreenWidgetDiscoverabilityLogHarvester _installedAppsSortedByAppUsage](self, "_installedAppsSortedByAppUsage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_25);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_thirdPartyAppsSortedByUsage;
    self->_thirdPartyAppsSortedByUsage = v6;

    thirdPartyAppsSortedByUsage = self->_thirdPartyAppsSortedByUsage;
  }
  return thirdPartyAppsSortedByUsage;
}

uint64_t __79__ATXHomeScreenWidgetDiscoverabilityLogHarvester__installed3PAppsSortedByUsage__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[ATXHomeScreenLogUploaderUtilities isFirstPartyApp:](ATXHomeScreenLogUploaderUtilities, "isFirstPartyApp:", a2) ^ 1;
}

- (id)_topTwentyInstalled3PAppsSortedByUsage
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;

  -[ATXHomeScreenWidgetDiscoverabilityLogHarvester _installed3PAppsSortedByUsage](self, "_installed3PAppsSortedByUsage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  if (v3 >= 0x14)
    v4 = 20;
  else
    v4 = v3;
  objc_msgSend(v2, "subarrayWithRange:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_setOfTopTwentyInstalled3PApps
{
  NSSet *topTwentyInstalled3PApps;
  void *v4;
  void *v5;
  NSSet *v6;
  NSSet *v7;

  topTwentyInstalled3PApps = self->_topTwentyInstalled3PApps;
  if (!topTwentyInstalled3PApps)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    -[ATXHomeScreenWidgetDiscoverabilityLogHarvester _topTwentyInstalled3PAppsSortedByUsage](self, "_topTwentyInstalled3PAppsSortedByUsage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5);
    v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_topTwentyInstalled3PApps;
    self->_topTwentyInstalled3PApps = v6;

    topTwentyInstalled3PApps = self->_topTwentyInstalled3PApps;
  }
  return topTwentyInstalled3PApps;
}

- (id)_installed3PAppsWithWidgetsSortedByUsage
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  -[NSMutableDictionary objectForKeyedSubscript:](self->_appMetricsAccumulator, "objectForKeyedSubscript:", CFSTR("howManyAppsHaveWidgets"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return MEMORY[0x1E0C9AA60];
  v4 = (void *)v3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_appMetricsAccumulator, "objectForKeyedSubscript:", CFSTR("howManyAppsHaveWidgets"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    return MEMORY[0x1E0C9AA60];
  -[ATXHomeScreenWidgetDiscoverabilityLogHarvester _installed3PAppsSortedByUsage](self, "_installed3PAppsSortedByUsage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __90__ATXHomeScreenWidgetDiscoverabilityLogHarvester__installed3PAppsWithWidgetsSortedByUsage__block_invoke;
  v11[3] = &unk_1E82DC870;
  v11[4] = self;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __90__ATXHomeScreenWidgetDiscoverabilityLogHarvester__installed3PAppsWithWidgetsSortedByUsage__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v3 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("howManyAppsHaveWidgets"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topTwentyInstalled3PApps, 0);
  objc_storeStrong((id *)&self->_metricsPerAlgorithm, 0);
  objc_storeStrong((id *)&self->_appMetricsAccumulator, 0);
  objc_storeStrong((id *)&self->_thirdPartyAppsSortedByUsage, 0);
  objc_storeStrong((id *)&self->_globalPopularityDictionary, 0);
  objc_storeStrong((id *)&self->_timelineRelevanceAdoptionHelper, 0);
  objc_storeStrong((id *)&self->_appUsageDictionary, 0);
  objc_storeStrong((id *)&self->_appLaunchStream, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_widgetDiscoverabilityDictionaries, 0);
}

- (void)_globalPopularityDictionary
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "ATXHomeScreenWidgetDiscoverabilityLogHarvester: Missing global popularity data", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)generateWidgetDiscoverabilityMetricsWithActivity:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXHomeScreenWidgetDiscoverabilityLogHarvester: Error when attempting to fetch widget descriptors with additional data - %{public}@", (uint8_t *)&v2, 0xCu);
}

void __106__ATXHomeScreenWidgetDiscoverabilityLogHarvester__generateSummaryMetricsWithDescriptorCache_withActivity___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "extensionBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXHomeScreenWidgetDiscoverabilityLogHarvester: unable to get bundleId for extensionBundleId: %@, kind: %@", (uint8_t *)&v6, 0x16u);

}

- (void)_isRegularlyUsedApp:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "ATXHomeScreenWidgetDiscoverabilityLogHarvester: a non-nil appBundleId is required for selector isRegularlyUsedApp", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end

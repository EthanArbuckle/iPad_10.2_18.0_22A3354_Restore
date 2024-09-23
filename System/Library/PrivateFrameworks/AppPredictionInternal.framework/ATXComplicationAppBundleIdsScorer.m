@implementation ATXComplicationAppBundleIdsScorer

- (ATXComplicationAppBundleIdsScorer)init
{
  ATXComplicationAppBundleIdsScorer *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  BMStream *appLaunchStream;
  uint64_t v7;
  ATXComplicationSuggestionParameters *parameters;
  uint64_t v9;
  ATXHomeScreenConfigCache *hsCache;
  uint64_t v11;
  ATXWatchFaceConfigurationCollector *watchFaceConfiguration;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ATXComplicationAppBundleIdsScorer;
  v2 = -[ATXComplicationAppBundleIdsScorer init](&v14, sel_init);
  if (v2)
  {
    BiomeLibrary();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "App");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "InFocus");
    v5 = objc_claimAutoreleasedReturnValue();
    appLaunchStream = v2->_appLaunchStream;
    v2->_appLaunchStream = (BMStream *)v5;

    +[ATXComplicationSuggestionParameters sharedInstance](ATXComplicationSuggestionParameters, "sharedInstance");
    v7 = objc_claimAutoreleasedReturnValue();
    parameters = v2->_parameters;
    v2->_parameters = (ATXComplicationSuggestionParameters *)v7;

    v9 = objc_opt_new();
    hsCache = v2->_hsCache;
    v2->_hsCache = (ATXHomeScreenConfigCache *)v9;

    objc_msgSend(MEMORY[0x1E0CF9208], "sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    watchFaceConfiguration = v2->_watchFaceConfiguration;
    v2->_watchFaceConfiguration = (ATXWatchFaceConfigurationCollector *)v11;

  }
  return v2;
}

- (id)inputDescriptionForSignal:(id)a3 complicationAppBundleIds:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  id v33;
  id v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v9 = v8;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("appLaunchUniqueDays")))
  {
    v34 = v6;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8CB8]), "initWithStream:", self->_appLaunchStream);
    objc_msgSend(v10, "rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApps:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "appendString:", CFSTR("Number of unique days bundleId was launched on:\n"));
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v33 = v7;
    obj = v7;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v41 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %lu\n"), v16, objc_msgSend(v17, "uniqueDaysLaunched"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v9;
          objc_msgSend(v9, "appendString:", v18);

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v13);
    }
LABEL_18:

    v7 = v33;
    v6 = v34;
    goto LABEL_28;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("appLaunchTotalCount")))
  {
    v34 = v6;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8CB8]), "initWithStream:", self->_appLaunchStream);
    objc_msgSend(v19, "rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApps:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "appendString:", CFSTR("Number of bundleId launches:\n"));
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v33 = v7;
    obj = v7;
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v37 != v22)
            objc_enumerationMutation(obj);
          v24 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
          objc_msgSend(v11, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %lu\n"), v24, objc_msgSend(v25, "rawLaunchCount"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v9;
          objc_msgSend(v9, "appendString:", v26);

        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v21);
    }
    goto LABEL_18;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("preConfiguredWidgets")))
  {
    -[ATXComplicationAppBundleIdsScorer _widgetAppBundleIdsOnHomeScreen](self, "_widgetAppBundleIdsOnHomeScreen");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = CFSTR("Widget app bundleIds configured on HomeScreen:\n");
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("appPriors")))
    {
      objc_msgSend(v8, "appendString:", CFSTR("Unrecognized Signal"));
      goto LABEL_28;
    }
    -[ATXComplicationSuggestionParameters appsToPriorsMapping](self->_parameters, "appsToPriorsMapping");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = CFSTR("Prior values for bundleIds:\n");
  }
  objc_msgSend(v8, "appendString:", v28);
  objc_msgSend(v27, "description");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  if (v29)
    v31 = (const __CFString *)v29;
  else
    v31 = &stru_1E82FDC98;
  objc_msgSend(v8, "appendString:", v31);

LABEL_28:
  return v8;
}

- (id)scoredComplicationBundleIdsForModularSet:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v23 = a4;
  v22 = a5;
  -[ATXComplicationAppBundleIdsScorer _widgetAppBundleIdsOnHomeScreen](self, "_widgetAppBundleIdsOnHomeScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXComplicationSuggestionParameters appsToPriorsMapping](self->_parameters, "appsToPriorsMapping");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXWatchFaceConfigurationCollector watchFaces](self->_watchFaceConfiguration, "watchFaces");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    do
    {
      v16 = 0;
      v17 = v11;
      do
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v16), "complications");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        ++v16;
        v17 = v11;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v14);
  }

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3550]), "initWithArray:", v11);
  -[ATXComplicationAppBundleIdsScorer _scoredComplicationBundleIdsForModularSet:bundleIdToAppLaunchData:bundleIdToCompanionBundleId:bundleIdToPriors:widgetAppBundleIdsOnHomeScreen:complicationBundleIdCountsOnWatch:](self, "_scoredComplicationBundleIdsForModularSet:bundleIdToAppLaunchData:bundleIdToCompanionBundleId:bundleIdToPriors:widgetAppBundleIdsOnHomeScreen:complicationBundleIdCountsOnWatch:", v24, v23, v22, v9, v8, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)rankedComplicationAppBundleIdsGivenComplicationAppBundleIds:(id)a3 bundleIdToAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5 bundleIdToPriors:(id)a6 widgetAppBundleIdsOnHomeScreen:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_opt_new();
  -[ATXComplicationAppBundleIdsScorer _scoredComplicationBundleIdsForModularSet:bundleIdToAppLaunchData:bundleIdToCompanionBundleId:bundleIdToPriors:widgetAppBundleIdsOnHomeScreen:complicationBundleIdCountsOnWatch:](self, "_scoredComplicationBundleIdsForModularSet:bundleIdToAppLaunchData:bundleIdToCompanionBundleId:bundleIdToPriors:widgetAppBundleIdsOnHomeScreen:complicationBundleIdCountsOnWatch:", v16, v15, v14, v13, v12, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "keysSortedByValueUsingComparator:", &__block_literal_global_153);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t __197__ATXComplicationAppBundleIdsScorer_rankedComplicationAppBundleIdsGivenComplicationAppBundleIds_bundleIdToAppLaunchData_bundleIdToCompanionBundleId_bundleIdToPriors_widgetAppBundleIdsOnHomeScreen___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (id)_scoredComplicationBundleIdsForModularSet:(id)a3 bundleIdToAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5 bundleIdToPriors:(id)a6 widgetAppBundleIdsOnHomeScreen:(id)a7 complicationBundleIdCountsOnWatch:(id)a8
{
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  id obj;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v38 = a4;
  v37 = a5;
  v36 = a6;
  v34 = a7;
  v14 = a8;
  v35 = (id)objc_opt_new();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v13;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v40 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v38, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKeyedSubscript:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v34, "containsObject:", v19);
        objc_msgSend(v37, "objectForKeyedSubscript:", v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (double)(unint64_t)objc_msgSend(v14, "countForObject:", v19);
        if (v23)
          v24 = v24 + (double)(unint64_t)objc_msgSend(v14, "countForObject:", v23);
        v25 = (void *)MEMORY[0x1E0CB37E8];
        v26 = (double)(unint64_t)objc_msgSend(v20, "uniqueDaysLaunched");
        v27 = (double)(unint64_t)objc_msgSend(v20, "rawLaunchCount") / 5.0 + v26;
        objc_msgSend(v21, "doubleValue");
        v29 = v28 / 100.0 + v27;
        if (v22)
          v30 = 3.0;
        else
          v30 = 0.0;
        objc_msgSend(v25, "numberWithDouble:", v30 + v29 + v24 * 2.0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setObject:forKeyedSubscript:", v31, v19);

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v16);
  }

  return v35;
}

- (id)_widgetAppBundleIdsOnHomeScreen
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  uint64_t v24;
  uint64_t v25;
  void *context;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
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
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[ATXHomeScreenConfigCache loadHomeScreenPageConfigurationsWithError:](self->_hsCache, "loadHomeScreenPageConfigurationsWithError:", 0);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v38;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v38 != v24)
          objc_enumerationMutation(obj);
        v27 = v4;
        v5 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v4);
        context = (void *)MEMORY[0x1CAA48B6C]();
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        objc_msgSend(v5, "stacks");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "panels");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = v8;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v34 != v11)
                objc_enumerationMutation(v28);
              v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
              v29 = 0u;
              v30 = 0u;
              v31 = 0u;
              v32 = 0u;
              objc_msgSend(v13, "widgets");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
              if (v15)
              {
                v16 = v15;
                v17 = *(_QWORD *)v30;
                do
                {
                  for (j = 0; j != v16; ++j)
                  {
                    if (*(_QWORD *)v30 != v17)
                      objc_enumerationMutation(v14);
                    v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
                    objc_msgSend(v19, "appBundleId");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v20)
                    {
                      objc_msgSend(v19, "appBundleId");
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v3, "addObject:", v21);

                    }
                  }
                  v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
                }
                while (v16);
              }

            }
            v10 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
          }
          while (v10);
        }

        objc_autoreleasePoolPop(context);
        v4 = v27 + 1;
      }
      while (v27 + 1 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v25);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchFaceConfiguration, 0);
  objc_storeStrong((id *)&self->_hsCache, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_appLaunchStream, 0);
}

@end

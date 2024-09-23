@implementation ATXCandidateRelevanceModelConfigApp

- (ATXCandidateRelevanceModelConfigApp)init
{
  ATXCandidateRelevanceModelConfigApp *v2;
  ATXCandidateRelevanceLogisticRegressionModelTrainingPlan *v3;
  void *v4;
  ATXCandidateRelevanceLogisticRegressionModelTrainingPlan *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)ATXCandidateRelevanceModelConfigApp;
  v2 = -[ATXCandidateRelevanceModelConfig init](&v16, sel_init);
  if (v2)
  {
    v3 = [ATXCandidateRelevanceLogisticRegressionModelTrainingPlan alloc];
    -[ATXCandidateRelevanceModelConfig modelTrainingPlanParameters](v2, "modelTrainingPlanParameters");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[ATXCandidateRelevanceLogisticRegressionModelTrainingPlan initWithParameters:](v3, "initWithParameters:", v4);
    -[ATXCandidateRelevanceModelConfig setModelTrainingPlan:](v2, "setModelTrainingPlan:", v5);

    v6 = (void *)objc_opt_new();
    -[ATXCandidateRelevanceModelConfig setDatastore:](v2, "setDatastore:", v6);

    v7 = objc_alloc(MEMORY[0x1E0D81198]);
    objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXClientModelSuggestionReceiver sharedInstance](ATXClientModelSuggestionReceiver, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "blendingLayerServer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v7, "initWithClientModelId:blendingLayerServer:", v8, v10);
    -[ATXCandidateRelevanceModelConfig setClientModel:](v2, "setClientModel:", v11);

    +[ATXAppPredictionBlacklist sharedInstance](ATXAppPredictionBlacklist, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXCandidateRelevanceModelConfigApp setAppBlacklist:](v2, "setAppBlacklist:", v12);

    +[ATXDigitalHealthBlacklist sharedInstance](ATXDigitalHealthBlacklist, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXCandidateRelevanceModelConfigApp setAppDigitalHealthBlacklist:](v2, "setAppDigitalHealthBlacklist:", v13);

    v14 = -[_ATXRecentInstallCache initTrackingAppsMoreRecentThan:]([_ATXRecentInstallCache alloc], "initTrackingAppsMoreRecentThan:", 300.0);
    -[ATXCandidateRelevanceModelConfigApp setRecentInstallCache:](v2, "setRecentInstallCache:", v14);

  }
  return v2;
}

- (id)datasetGenerator
{
  ATXCandidateRelevanceModelDatasetGenerator *v2;
  void *v3;
  ATXCandidateRelevanceModelDatasetGenerator *v4;

  v2 = [ATXCandidateRelevanceModelDatasetGenerator alloc];
  v3 = (void *)objc_opt_new();
  v4 = -[ATXCandidateRelevanceModelDatasetGenerator initWithConfig:](v2, "initWithConfig:", v3);

  return v4;
}

- (id)candidatePublisherFromStartTime:(double)a3
{
  return +[ATXCandidateRelevanceModelDatasetGeneratorConfigApp candidatePublisherFromStartTime:](ATXCandidateRelevanceModelDatasetGeneratorConfigApp, "candidatePublisherFromStartTime:", a3);
}

- (id)proactiveSuggestionForCandidate:(id)a3 prediction:(float)a4
{
  void *v6;
  double v7;
  void *v8;

  objc_msgSend(a3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a4;
  -[ATXCandidateRelevanceModelConfigApp proactiveSuggestionForBundleId:prediction:](self, "proactiveSuggestionForBundleId:prediction:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)proactiveSuggestionForBundleId:(id)a3 prediction:(float)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;

  v6 = (objc_class *)MEMORY[0x1E0D811A0];
  v7 = a3;
  v8 = [v6 alloc];
  -[ATXCandidateRelevanceModelConfig clientModel](self, "clientModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clientModelId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithClientModelId:clientModelVersion:engagementResetPolicy:", v10, CFSTR("1.0"), 0);

  +[ATXProactiveSuggestionBuilder _executableSpecForAppWithBundleId:](ATXProactiveSuggestionBuilder, "_executableSpecForAppWithBundleId:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811C0]), "initWithRawScore:suggestedConfidenceCategory:", 2, a4);
  objc_msgSend(MEMORY[0x1E0D811B8], "layoutConfigurationsForLayoutOptions:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v18) = 1;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811D0]), "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:", v7, 0, 0, v14, 0, 1, v18);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81190]), "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v11, v12, v15, v13);
  return v16;
}

- (BOOL)candidateIsStillValidToSuggest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  -[ATXCandidateRelevanceModelConfig installedAppsKnownToSpringBoard](self, "installedAppsKnownToSpringBoard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ATXCandidateRelevanceModelConfigApp bundleIdIsEnabledForPrediction:](self, "bundleIdIsEnabledForPrediction:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)bundleIdIsEnabledForPrediction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[ATXCandidateRelevanceModelConfigApp appBlacklist](self, "appBlacklist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "disabledBundleIds");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend((id)v6, "containsObject:", v4);

  -[ATXCandidateRelevanceModelConfigApp appDigitalHealthBlacklist](self, "appDigitalHealthBlacklist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "blacklistedBundleIds");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v9, "containsObject:", v4);

  return (v7 | v6) ^ 1;
}

- (id)heuristicSuggestionsForContext:(id)a3 currentSuggestionExecutableIds:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[_ATXAppInfoManager sharedInstance](_ATXAppInfoManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXCandidateRelevanceModelConfigApp heuristicSuggestionsForContext:currentSuggestionExecutableIds:appInfoManager:](self, "heuristicSuggestionsForContext:currentSuggestionExecutableIds:appInfoManager:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)heuristicSuggestionsForContext:(id)a3 currentSuggestionExecutableIds:(id)a4 appInfoManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  __int128 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v8, "candidateIdentifiersLaunchAge");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allKeys");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = v13;
  else
    v15 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v11, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v10;
  v39 = v9;
  -[ATXCandidateRelevanceModelConfigApp recentlyInstalledAndNotLaunchedAppsFromAppInfoManager:currentSuggestionExecutableIds:launchedApps:](self, "recentlyInstalledAndNotLaunchedAppsFromAppInfoManager:currentSuggestionExecutableIds:launchedApps:", v10, v9, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "subarrayWithRange:", 0, objc_msgSend(v17, "count") != 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = v8;
  objc_msgSend(v8, "candidateIdentifiersLaunchAge");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXCandidateRelevanceModelConfigApp recentlyLaunchedAppsFromAppLaunchAges:](self, "recentlyLaunchedAppsFromAppLaunchAges:", v19);
  v20 = objc_claimAutoreleasedReturnValue();

  v36 = (void *)v20;
  v37 = v18;
  objc_msgSend(v18, "arrayByAddingObjectsFromArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_opt_new();
  v23 = (void *)objc_opt_new();
  if (objc_msgSend(v21, "count"))
  {
    v25 = 0;
    *(_QWORD *)&v24 = 138412802;
    v35 = v24;
    do
    {
      if ((unint64_t)objc_msgSend(v22, "count", v35) >= 2)
        break;
      objc_msgSend(v21, "objectAtIndexedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "executableSpecification");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "executableIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v23, "containsObject:", v28) & 1) == 0
        && -[ATXCandidateRelevanceModelConfigApp bundleIdIsEnabledForPrediction:](self, "bundleIdIsEnabledForPrediction:", v28))
      {
        __atxlog_handle_relevance_model();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = (objc_class *)objc_opt_class();
          NSStringFromClass(v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "scoreSpecification");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "rawScore");
          *(_DWORD *)buf = v35;
          v42 = v31;
          v43 = 2112;
          v44 = v28;
          v45 = 2048;
          v46 = v33;
          _os_log_impl(&dword_1C9A3B000, v29, OS_LOG_TYPE_DEFAULT, "%@ - Scored heuristic with identifier %@ and score: %f.", buf, 0x20u);

        }
        objc_msgSend(v22, "addObject:", v26);
        objc_msgSend(v23, "addObject:", v28);
      }

      ++v25;
    }
    while (objc_msgSend(v21, "count") > v25);
  }

  return v22;
}

- (id)recentlyInstalledAndNotLaunchedAppsFromAppInfoManager:(id)a3 currentSuggestionExecutableIds:(id)a4 launchedApps:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  double v26;
  void *v27;
  NSObject *v28;
  objc_class *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  double v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  v34 = v9;
  v12 = (void *)objc_msgSend(v9, "mutableCopy");
  v33 = v10;
  objc_msgSend(v12, "unionSet:", v10);
  v32 = v12;
  v35 = v8;
  -[ATXCandidateRelevanceModelConfigApp appInstallAgesForAppsWithExcludedApps:appInfoManager:](self, "appInstallAgesForAppsWithExcludedApps:appInfoManager:", v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "keysSortedByValueUsingComparator:", &__block_literal_global_14);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v37;
LABEL_3:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v17)
        objc_enumerationMutation(v14);
      v19 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v18);
      objc_msgSend(v13, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timeIntervalSinceNow");
      v22 = v21;

      if (v22 < -14400.0)
        break;
      __atxlog_handle_relevance_model();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v41 = v25;
        v42 = 2112;
        v43 = v19;
        v44 = 2048;
        v45 = -v22;
        _os_log_impl(&dword_1C9A3B000, v23, OS_LOG_TYPE_DEFAULT, "%@ - Found recently installed app with identifier %@ and install age %f.", buf, 0x20u);

      }
      LODWORD(v26) = 1.0;
      -[ATXCandidateRelevanceModelConfigApp proactiveSuggestionForBundleId:prediction:](self, "proactiveSuggestionForBundleId:prediction:", v19, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        objc_msgSend(v11, "addObject:", v27);
      }
      else
      {
        __atxlog_handle_relevance_model();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = (objc_class *)objc_opt_class();
          NSStringFromClass(v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v41 = v31;
          v42 = 2112;
          v43 = v19;
          _os_log_error_impl(&dword_1C9A3B000, v28, OS_LOG_TYPE_ERROR, "%@ - Could not create suggestion for recently installed app with identifier %@.", buf, 0x16u);

        }
      }

      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
        if (v16)
          goto LABEL_3;
        break;
      }
    }
  }

  return v11;
}

uint64_t __137__ATXCandidateRelevanceModelConfigApp_recentlyInstalledAndNotLaunchedAppsFromAppInfoManager_currentSuggestionExecutableIds_launchedApps___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (id)appInstallAgesForAppsWithExcludedApps:(id)a3 appInfoManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ATXCandidateRelevanceModelConfig installedAppsKnownToSpringBoard](self, "installedAppsKnownToSpringBoard");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  -[ATXCandidateRelevanceModelConfigApp recentInstallCache](self, "recentInstallCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allRecentlyInstalledApplications");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unionSet:", v11);

  objc_msgSend(v9, "minusSet:", v6);
  v12 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v7, "appInfoForBundleId:", v18, (_QWORD)v23);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "installDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v19, "installDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, v18);

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v15);
  }

  return v12;
}

- (id)recentlyLaunchedAppsFromAppLaunchAges:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  double v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  objc_class *v22;
  void *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  double v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v4, "keysSortedByValueUsingComparator:", &__block_literal_global_128);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v27;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v10);
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalSinceNow");
        v14 = v13;

        if (v14 < -1800.0)
          break;
        __atxlog_handle_relevance_model();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = (objc_class *)objc_opt_class();
          NSStringFromClass(v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v31 = v17;
          v32 = 2112;
          v33 = v11;
          v34 = 2048;
          v35 = -v14;
          _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "%@ - Found recently launched app with identifier %@ and launch age %f.", buf, 0x20u);

        }
        v18 = v14 * 0.009 / 1800.0 + 0.999;
        *(float *)&v18 = v18;
        -[ATXCandidateRelevanceModelConfigApp proactiveSuggestionForBundleId:prediction:](self, "proactiveSuggestionForBundleId:prediction:", v11, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_msgSend(v5, "addObject:", v19);
        }
        else
        {
          __atxlog_handle_relevance_model();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v21 = (objc_class *)objc_opt_class();
            NSStringFromClass(v21);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v31 = v25;
            v32 = 2112;
            v33 = v11;
            _os_log_error_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_ERROR, "%@ - Could not create suggestion for recently launched app with identifier %@.", buf, 0x16u);

          }
        }

        if (v8 == ++v10)
        {
          v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
          if (v8)
            goto LABEL_4;
          break;
        }
      }
    }

  }
  else
  {
    __atxlog_handle_relevance_model();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v23;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "%@ - appLaunchAges is nil, so returning an empty list.", buf, 0xCu);

    }
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

uint64_t __77__ATXCandidateRelevanceModelConfigApp_recentlyLaunchedAppsFromAppLaunchAges___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (ATXAppPredictionBlacklist)appBlacklist
{
  return self->_appBlacklist;
}

- (void)setAppBlacklist:(id)a3
{
  objc_storeStrong((id *)&self->_appBlacklist, a3);
}

- (ATXDigitalHealthBlacklist)appDigitalHealthBlacklist
{
  return self->_appDigitalHealthBlacklist;
}

- (void)setAppDigitalHealthBlacklist:(id)a3
{
  objc_storeStrong((id *)&self->_appDigitalHealthBlacklist, a3);
}

- (_ATXRecentInstallCache)recentInstallCache
{
  return self->_recentInstallCache;
}

- (void)setRecentInstallCache:(id)a3
{
  objc_storeStrong((id *)&self->_recentInstallCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentInstallCache, 0);
  objc_storeStrong((id *)&self->_appDigitalHealthBlacklist, 0);
  objc_storeStrong((id *)&self->_appBlacklist, 0);
}

@end

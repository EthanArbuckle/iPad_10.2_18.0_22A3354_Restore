@implementation ATXFocusModeSignalsMetricLogger

- (ATXFocusModeSignalsMetricLogger)init
{
  ATXFocusModeSignalsMetricLogger *v2;
  uint64_t v3;
  NSMutableDictionary *cachedAppScores;
  uint64_t v5;
  NSMutableDictionary *cachedAppScoresForDenyList;
  uint64_t v7;
  NSMutableDictionary *cachedWidgetScores;
  uint64_t v9;
  ATXDNDModeConfigurationClient *modeConfigClient;
  uint64_t v11;
  ATXModeEntityTrialClientWrapper *modeEntityTrialClientWrapper;
  uint64_t v13;
  ATXModeEntityStore *modeEntityStore;
  uint64_t v15;
  ATXGlobalAppModeAffinityModel *globalAppModeAffinityModel;
  uint64_t v17;
  ATXGlobalInterruptingAppModel *globalInterruptingAppModel;
  uint64_t v19;
  ATXGlobalWidgetPopularityModel *globalWidgetPopularityModel;
  uint64_t v21;
  ATXModeAffinityModelsConstants *modeAffinityModelsConstants;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)ATXFocusModeSignalsMetricLogger;
  v2 = -[ATXFocusModeSignalsMetricLogger init](&v24, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    cachedAppScores = v2->_cachedAppScores;
    v2->_cachedAppScores = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    cachedAppScoresForDenyList = v2->_cachedAppScoresForDenyList;
    v2->_cachedAppScoresForDenyList = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    cachedWidgetScores = v2->_cachedWidgetScores;
    v2->_cachedWidgetScores = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0CF8D60], "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    modeConfigClient = v2->_modeConfigClient;
    v2->_modeConfigClient = (ATXDNDModeConfigurationClient *)v9;

    objc_msgSend(MEMORY[0x1E0CF8F60], "sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    modeEntityTrialClientWrapper = v2->_modeEntityTrialClientWrapper;
    v2->_modeEntityTrialClientWrapper = (ATXModeEntityTrialClientWrapper *)v11;

    v13 = objc_opt_new();
    modeEntityStore = v2->_modeEntityStore;
    v2->_modeEntityStore = (ATXModeEntityStore *)v13;

    +[ATXGlobalAppModeAffinityModel modelWithAllInstalledAppsKnownToSpringBoard](ATXGlobalAppModeAffinityModel, "modelWithAllInstalledAppsKnownToSpringBoard");
    v15 = objc_claimAutoreleasedReturnValue();
    globalAppModeAffinityModel = v2->_globalAppModeAffinityModel;
    v2->_globalAppModeAffinityModel = (ATXGlobalAppModeAffinityModel *)v15;

    +[ATXGlobalInterruptingAppModel modelWithAllInstalledAppsKnownToSpringBoard](ATXGlobalInterruptingAppModel, "modelWithAllInstalledAppsKnownToSpringBoard");
    v17 = objc_claimAutoreleasedReturnValue();
    globalInterruptingAppModel = v2->_globalInterruptingAppModel;
    v2->_globalInterruptingAppModel = (ATXGlobalInterruptingAppModel *)v17;

    +[ATXGlobalWidgetPopularityModel modelWithAllAvailableWidgets](ATXGlobalWidgetPopularityModel, "modelWithAllAvailableWidgets");
    v19 = objc_claimAutoreleasedReturnValue();
    globalWidgetPopularityModel = v2->_globalWidgetPopularityModel;
    v2->_globalWidgetPopularityModel = (ATXGlobalWidgetPopularityModel *)v19;

    v21 = objc_opt_new();
    modeAffinityModelsConstants = v2->_modeAffinityModelsConstants;
    v2->_modeAffinityModelsConstants = (ATXModeAffinityModelsConstants *)v21;

  }
  return v2;
}

- (void)logFocusModeAppSignalsWithModeConfigurationUIFlowLoggingEvent:(id)a3 xpcActivity:(id)a4
{
  id v6;
  id v7;
  ATXDNDModeConfigurationClient *modeConfigClient;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  ATXFocusModeSignalsMetricLogger *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  char v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id obj;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "modeConfigurationEntityType"))
  {
    modeConfigClient = self->_modeConfigClient;
    objc_msgSend(v6, "dndModeUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ATXDNDModeConfigurationClient atxModeForDNDMode:](modeConfigClient, "atxModeForDNDMode:", v9);

    if (v10)
    {
      v40 = v10;
      -[ATXDNDModeConfigurationClient dndSemanticTypeForATXMode:](self->_modeConfigClient, "dndSemanticTypeForATXMode:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v6, "currentEntityIdentifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithArray:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v6, "suggestedEntityIdentifiers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setWithArray:", v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v6, "candidateEntityIdentifiers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setWithArray:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v49 = (void *)v17;
      v50 = (void *)v20;
      -[ATXFocusModeSignalsMetricLogger fetchRelevantBundleIdsWithModeConfigurationUIFlowLoggingEvent:suggestedEntities:candidateEntities:currentEntities:](self, "fetchRelevantBundleIdsWithModeConfigurationUIFlowLoggingEvent:suggestedEntities:candidateEntities:currentEntities:", v6, v17, v20, v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v11;
      if (v11)
      {
        -[ATXDNDModeConfigurationClient iOSAppDenyListForMode:](self->_modeConfigClient, "iOSAppDenyListForMode:", objc_msgSend(v11, "integerValue", v11));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXDNDModeConfigurationClient iOSAppAllowListForMode:](self->_modeConfigClient, "iOSAppAllowListForMode:", objc_msgSend(v11, "integerValue"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v47 = (void *)MEMORY[0x1E0C9AA60];
        v48 = (void *)MEMORY[0x1E0C9AA60];
      }
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      obj = v21;
      v22 = v40;
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
      if (v46)
      {
        v39 = 0;
        v44 = *(_QWORD *)v52;
        while (2)
        {
          v23 = 0;
          v45 = v39 + 1;
          v39 += v46;
          do
          {
            if (*(_QWORD *)v52 != v44)
              objc_enumerationMutation(obj);
            v24 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v23);
            v25 = (void *)objc_opt_new();
            objc_msgSend(v25, "setAbGroup:", CFSTR("default"));
            objc_msgSend(v25, "setFocusMode:", v22);
            if ((objc_msgSend(v48, "containsObject:", v24) & 1) != 0 || objc_msgSend(v6, "modeConfigurationType") == 1)
              objc_msgSend(v25, "setActiveConfigurationType:", CFSTR("DenyList"), v38);
            if ((objc_msgSend(v47, "containsObject:", v24, v38) & 1) != 0 || !objc_msgSend(v6, "modeConfigurationType"))
              objc_msgSend(v25, "setActiveConfigurationType:", CFSTR("AllowList"));
            -[ATXModeEntityTrialClientWrapper trialExperimentId](self->_modeEntityTrialClientWrapper, "trialExperimentId");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setExperimentId:", v26);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[ATXModeEntityTrialClientWrapper trialDeploymentId](self->_modeEntityTrialClientWrapper, "trialDeploymentId"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setDeploymentId:", v27);

            -[ATXModeEntityTrialClientWrapper trialTreatmentId](self->_modeEntityTrialClientWrapper, "trialTreatmentId");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setTreatmentId:", v28);

            objc_msgSend(v25, "setAppBundleId:", v24);
            objc_msgSend(v25, "setIsAppCandidateSuggestion:", objc_msgSend(v50, "containsObject:", v24));
            objc_msgSend(v25, "setIsAppRecommendedSuggestion:", objc_msgSend(v49, "containsObject:", v24));
            if ((objc_msgSend(v49, "containsObject:", v24) & 1) != 0
              || objc_msgSend(v50, "containsObject:", v24))
            {
              objc_msgSend(v25, "setWasAppSuggestedDuringModeSetup:", 1);
            }
            objc_msgSend(v25, "setWasAppSuggestionDuringModeSetupAccepted:", objc_msgSend(v14, "containsObject:", v24));
            if (!objc_msgSend(v6, "modeConfigurationType"))
              -[ATXFocusModeSignalsMetricLogger populateAppModeAffinitySignalsForMode:bundleId:metric:](self, "populateAppModeAffinitySignalsForMode:bundleId:metric:", v22, v24, v25);
            if (objc_msgSend(v6, "modeConfigurationType") == 1)
              -[ATXFocusModeSignalsMetricLogger populateAppModeDenyListSignalsForMode:bundleId:metric:](self, "populateAppModeDenyListSignalsForMode:bundleId:metric:", v22, v24, v25);
            __atxlog_handle_modes();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              v30 = (void *)objc_opt_class();
              v43 = v30;
              NSStringFromSelector(a2);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "coreAnalyticsDictionary");
              v32 = self;
              v33 = v6;
              v34 = v14;
              v35 = v7;
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v56 = v30;
              v57 = 2112;
              v58 = v31;
              v59 = 2112;
              v60 = v36;
              _os_log_impl(&dword_1C9A3B000, v29, OS_LOG_TYPE_INFO, "[%@][%@] Logging: %@", buf, 0x20u);

              v7 = v35;
              v14 = v34;
              v6 = v33;
              self = v32;

              v22 = v40;
            }

            objc_msgSend(v25, "logToCoreAnalytics");
            if ((unint64_t)(v45 + v23) > 0x13)
            {

              goto LABEL_32;
            }
            v37 = objc_msgSend(v7, "didDefer");

            if ((v37 & 1) != 0)
              goto LABEL_32;
            ++v23;
          }
          while (v46 != v23);
          v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
          if (v46)
            continue;
          break;
        }
      }
LABEL_32:

    }
  }

}

- (void)populateAppModeAffinitySignalsForMode:(unint64_t)a3 bundleId:(id)a4 metric:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  ATXGlobalInterruptingAppModel *globalInterruptingAppModel;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[ATXFocusModeSignalsMetricLogger appScoresForMode:](self, "appScoresForMode:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v33 = v10;
    v34 = v8;
    objc_msgSend(v10, "objectForKeyedSubscript:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scoreMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "featureVector");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = -[ATXModeEntityScoringFeatures initFromJSON:]([ATXModeEntityScoringFeatures alloc], "initFromJSON:", v14);
    v32 = v12;
    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v12, "scoreMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "score");
    objc_msgSend(v15, "numberWithDouble:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEntityModeEntityScore:", v17);

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[ATXFocusModeSignalsMetricLogger metricFieldsToFeatureNames](self, "metricFieldsToFeatureNames");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v36;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v36 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v22);
          -[ATXFocusModeSignalsMetricLogger metricFieldsToFeatureNames](self, "metricFieldsToFeatureNames");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            objc_msgSend(v14, "objectForKeyedSubscript:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v26)
            {
              objc_msgSend(v14, "objectForKeyedSubscript:", v25);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setValue:forKey:", v27, v23);

            }
          }

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v20);
    }

    -[ATXFocusModeSignalsMetricLogger addAppEntitySpecificFeatures:toMetric:](self, "addAppEntitySpecificFeatures:toMetric:", v31, v9);
    v28 = (void *)MEMORY[0x1E0CB37E8];
    globalInterruptingAppModel = self->_globalInterruptingAppModel;
    -[ATXModeAffinityModelsConstants scalingFactorForModeGlobalPriors](self->_modeAffinityModelsConstants, "scalingFactorForModeGlobalPriors");
    v8 = v34;
    -[ATXGlobalInterruptingAppModel scoreForBundleId:scalingFactor:](globalInterruptingAppModel, "scoreForBundleId:scalingFactor:", v34);
    objc_msgSend(v28, "numberWithDouble:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setGlobalInterruptingPrior:", v30);

    v10 = v33;
  }

}

- (void)populateAppModeDenyListSignalsForMode:(unint64_t)a3 bundleId:(id)a4 metric:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  ATXGlobalAppModeAffinityModel *globalAppModeAffinityModel;
  void *v30;
  id v31;
  void *v32;
  unint64_t v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[ATXFocusModeSignalsMetricLogger appScoresForDenyListForMode:](self, "appScoresForDenyListForMode:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v33 = a3;
    v34 = v10;
    v35 = v8;
    objc_msgSend(v10, "objectForKeyedSubscript:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scoreMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "featureVector");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = -[ATXModeEntityScoringFeatures initFromJSON:]([ATXModeEntityScoringFeatures alloc], "initFromJSON:", v14);
    v32 = v12;
    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v12, "scoreMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "score");
    objc_msgSend(v15, "numberWithDouble:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEntityModeEntityScore:", v17);

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[ATXFocusModeSignalsMetricLogger metricFieldsToFeatureNames](self, "metricFieldsToFeatureNames");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v37;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v37 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v22);
          -[ATXFocusModeSignalsMetricLogger metricFieldsToFeatureNames](self, "metricFieldsToFeatureNames");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            objc_msgSend(v14, "objectForKeyedSubscript:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v26)
            {
              objc_msgSend(v14, "objectForKeyedSubscript:", v25);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setValue:forKey:", v27, v23);

            }
          }

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v20);
    }

    -[ATXFocusModeSignalsMetricLogger addAppEntitySpecificFeatures:toMetric:](self, "addAppEntitySpecificFeatures:toMetric:", v31, v9);
    v28 = (void *)MEMORY[0x1E0CB37E8];
    globalAppModeAffinityModel = self->_globalAppModeAffinityModel;
    -[ATXModeAffinityModelsConstants scalingFactorForModeGlobalPriors](self->_modeAffinityModelsConstants, "scalingFactorForModeGlobalPriors");
    v8 = v35;
    -[ATXGlobalAppModeAffinityModel scoreForMode:bundleId:scalingFactor:](globalAppModeAffinityModel, "scoreForMode:bundleId:scalingFactor:", v33, v35);
    objc_msgSend(v28, "numberWithDouble:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setGlobalModeAffinityPrior:", v30);

    v10 = v34;
  }

}

- (void)addAppEntitySpecificFeatures:(id)a3 toMetric:(id)a4
{
  ATXModeAffinityModelsConstants *modeAffinityModelsConstants;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  modeAffinityModelsConstants = self->_modeAffinityModelsConstants;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "setEntityOccurredGloballyOverLastNDays:", objc_msgSend(v8, "entityOccurredGloballyOverLastNDays:", -[ATXModeAffinityModelsConstants numOfDaysToComputeEntityOccurenceFeatures](modeAffinityModelsConstants, "numOfDaysToComputeEntityOccurenceFeatures")));
  objc_msgSend(v7, "setEntityOccurredInModeOverLastNDays:", objc_msgSend(v8, "entityOccurredInModeOverLastNDays:", -[ATXModeAffinityModelsConstants numOfDaysToComputeEntityOccurenceFeatures](self->_modeAffinityModelsConstants, "numOfDaysToComputeEntityOccurenceFeatures")));
  objc_msgSend(v8, "entitySpecificFeatures");
  v29 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "appCategoryScore_v2");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCategoryScore:", v9);

  objc_msgSend(v29, "globalInterruptingPrior");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGlobalInterruptingPrior:", v10);

  objc_msgSend(v29, "modeAppInterruptionsCountByEntity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setModeAppInterruptionsCountByEntity:", v11);

  objc_msgSend(v29, "globalAppInterruptionsCountByEntity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGlobalAppInterruptionsCountByEntity:", v12);

  objc_msgSend(v29, "modePopularityOfInterruptingEntity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setModePopularityOfInterruptingEntity:", v13);

  objc_msgSend(v29, "globalPopularityOfInterruptingEntity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGlobalPopularityOfInterruptingEntity:", v14);

  objc_msgSend(v29, "ratioOfModePopularityToGlobalPopularityOfInterruptingEntity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRatioOfModePopularityToGlobalPopularityOfInterruptingEntity:", v15);

  objc_msgSend(v29, "modeAppInterruptionsClassConditionalProbabilityByEntity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setModeAppInterruptionsClassConditionalProbabilityByEntity:", v16);

  objc_msgSend(v29, "modeCountOfNotificationsClearedForEntity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNotificationsClearedInMode:", v17);

  objc_msgSend(v29, "globalCountOfNotificationsClearedForEntity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNotificationsClearedGlobally:", v18);

  objc_msgSend(v29, "localNotificationsClearedRateForEntity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalClearanceRateForEntity:", v19);

  objc_msgSend(v29, "globalNotificationsClearedRateForEntity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGlobalClearanceRateForEntity:", v20);

  objc_msgSend(v29, "ratioOfLocalToGlobalNotificationsClearedRateForEntity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRatioOfLocalToGlobalNotificationsClearedRateForEntity:", v21);

  objc_msgSend(v29, "classConditionalOfNotificationsClearedForEntity");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClassConditionalOfNotificationsClearedForEntity:", v22);

  objc_msgSend(v29, "globalCountOfNotificationsReceivedForEntity");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNotificationsReceivedGlobally:", v23);

  objc_msgSend(v29, "modeCountOfNotificationsReceivedForEntity");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNotificationsReceivedInMode:", v24);

  objc_msgSend(v29, "localPopularityOfNotificationsReceivedForEntity");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalPopularityOfNotificationsReceivedForEntity:", v25);

  objc_msgSend(v29, "globalPopularityOfNotificationsReceivedForEntity");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGlobalPopularityOfNotificationsReceivedForEntity:", v26);

  objc_msgSend(v29, "ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRatioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity:", v27);

  objc_msgSend(v29, "classConditionalOfNotificationsReceivedForEntity");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClassConditionalOfNotificationsReceivedForEntity:", v28);

}

- (id)fetchRelevantBundleIdsWithModeConfigurationUIFlowLoggingEvent:(id)a3 suggestedEntities:(id)a4 candidateEntities:(id)a5 currentEntities:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(a3, "previousEntityIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setByAddingObjectsFromSet:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setByAddingObjectsFromSet:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  objc_msgSend(v17, "minusSet:", v14);
  v18 = (void *)objc_msgSend(v14, "mutableCopy");
  objc_msgSend(v18, "minusSet:", v10);

  objc_msgSend(v18, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObjectsFromArray:", v19);

  return v17;
}

- (id)metricFieldsToFeatureNames
{
  return &unk_1E83D0928;
}

- (id)appScoresForMode:(unint64_t)a3
{
  NSMutableDictionary *cachedAppScores;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  ATXAppModeModel *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;

  cachedAppScores = self->_cachedAppScores;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](cachedAppScores, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = self->_cachedAppScores;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (ATXAppModeModel *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = -[ATXAppModeModel initWithMode:modeEntityStore:globalAppModeAffinityModel:]([ATXAppModeModel alloc], "initWithMode:modeEntityStore:globalAppModeAffinityModel:", a3, self->_modeEntityStore, self->_globalAppModeAffinityModel);
    -[ATXAppModeModel scoredEntities](v9, "scoredEntities");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_cachedAppScores;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, v13);

    v14 = self->_cachedAppScores;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)appScoresForDenyListForMode:(unint64_t)a3
{
  NSMutableDictionary *cachedAppScoresForDenyList;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  ATXAppModeDenyListModel *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;

  cachedAppScoresForDenyList = self->_cachedAppScoresForDenyList;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](cachedAppScoresForDenyList, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = self->_cachedAppScoresForDenyList;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (ATXAppModeDenyListModel *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = -[ATXAppModeDenyListModel initWithMode:modeEntityStore:globalInterruptingAppModel:]([ATXAppModeDenyListModel alloc], "initWithMode:modeEntityStore:globalInterruptingAppModel:", a3, self->_modeEntityStore, self->_globalInterruptingAppModel);
    -[ATXAppModeDenyListModel scoredEntities](v9, "scoredEntities");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_cachedAppScoresForDenyList;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, v13);

    v14 = self->_cachedAppScoresForDenyList;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (void)logFocusModeWidgetSignalsWithXPCActivity:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  allModesForTraining();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1CAA48B6C]();
        v11 = objc_msgSend(v9, "integerValue");
        if (v11 > 0xD || ((1 << v11) & 0x3010) == 0)
        {
          v13 = v11;
          -[ATXFocusModeSignalsMetricLogger widgetScoresForMode:](self, "widgetScoresForMode:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[ATXFocusModeSignalsMetricLogger logWidgetSignalsForMode:modeAffinitySignals:entitiesLogged:](self, "logWidgetSignalsForMode:modeAffinitySignals:entitiesLogged:", v13, v14, v6);
          if (v15 > 0x13 || (v6 = v15, objc_msgSend(v17, "didDefer")))
          {

            objc_autoreleasePoolPop(v10);
            goto LABEL_18;
          }

        }
        objc_autoreleasePoolPop(v10);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_18:

}

- (unint64_t)logWidgetSignalsForMode:(unint64_t)a3 modeAffinitySignals:(id)a4 entitiesLogged:(unint64_t)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v46;
    v40 = *(_QWORD *)v46;
    do
    {
      v10 = 0;
      v41 = v8;
      do
      {
        if (*(_QWORD *)v46 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v10);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "scoreMetadata");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          objc_msgSend(v6, "objectForKeyedSubscript:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "scoreMetadata");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "score");
          v18 = v17;

          if (v18 > 0.0)
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", v11);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "widget");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (void *)objc_opt_new();
            objc_msgSend(v20, "setFocusMode:", a3);
            objc_msgSend(v19, "extensionIdentity");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "containerBundleIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setAppBundleId:", v22);

            v23 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v19, "extensionIdentity");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "extensionBundleIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "kind");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("%@:%@"), v25, v26);
            objc_msgSend(v20, "setWidgetBundleIdAndKind:", v27);

            objc_msgSend(v19, "family");
            NSStringFromWidgetFamily();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setWidgetSize:", v28);

            objc_msgSend(v19, "intentReference");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "intent");
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (v30)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v30, "_indexingHash"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setIntentHash:", v31);

            }
            -[ATXFocusModeSignalsMetricLogger populateWidgetModeAffinitySignalsForMode:metric:modeEntity:](self, "populateWidgetModeAffinitySignalsForMode:metric:modeEntity:", a3, v20, v44);
            __atxlog_handle_modes();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              v33 = (void *)objc_opt_class();
              v39 = v33;
              NSStringFromSelector(a2);
              v34 = a5;
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "coreAnalyticsDictionary");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v50 = v33;
              v51 = 2112;
              v52 = v35;
              v53 = 2112;
              v54 = v36;
              _os_log_impl(&dword_1C9A3B000, v32, OS_LOG_TYPE_INFO, "[%@][%@] Logging: %@", buf, 0x20u);

              a5 = v34;
            }

            objc_msgSend(v20, "logToCoreAnalytics");
            ++a5;

            v9 = v40;
            v8 = v41;
            if (a5 > 0x13)
              goto LABEL_17;
          }
        }
        else
        {

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    }
    while (v8);
  }
LABEL_17:

  return a5;
}

- (void)populateWidgetModeAffinitySignalsForMode:(unint64_t)a3 metric:(id)a4 modeEntity:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "scoreMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "score");
    objc_msgSend(v10, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEntityModeEntityScore:", v12);

    v25 = v9;
    objc_msgSend(v9, "scoreMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "featureVector");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[ATXFocusModeSignalsMetricLogger metricFieldsToFeatureNames](self, "metricFieldsToFeatureNames");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v27;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v27 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v19);
          -[ATXFocusModeSignalsMetricLogger metricFieldsToFeatureNames](self, "metricFieldsToFeatureNames");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_msgSend(v14, "objectForKeyedSubscript:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              objc_msgSend(v14, "objectForKeyedSubscript:", v22);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setValue:forKey:", v24, v20);

            }
          }

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v17);
    }

    v9 = v25;
  }

}

- (id)widgetScoresForMode:(unint64_t)a3
{
  NSMutableDictionary *cachedWidgetScores;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  ATXWidgetModeModel *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;

  cachedWidgetScores = self->_cachedWidgetScores;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](cachedWidgetScores, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = self->_cachedWidgetScores;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (ATXWidgetModeModel *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = -[ATXWidgetModeModel initWithMode:globalWidgetPopularityModel:]([ATXWidgetModeModel alloc], "initWithMode:globalWidgetPopularityModel:", a3, self->_globalWidgetPopularityModel);
    -[ATXFocusModeSignalsMetricLogger appScoresForMode:](self, "appScoresForMode:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXWidgetModeModel scoredEntitiesWithScoredAppEntities:](v9, "scoredEntitiesWithScoredAppEntities:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->_cachedWidgetScores;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v12, v14);

    v15 = self->_cachedWidgetScores;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeAffinityModelsConstants, 0);
  objc_storeStrong((id *)&self->_globalWidgetPopularityModel, 0);
  objc_storeStrong((id *)&self->_globalInterruptingAppModel, 0);
  objc_storeStrong((id *)&self->_globalAppModeAffinityModel, 0);
  objc_storeStrong((id *)&self->_modeEntityStore, 0);
  objc_storeStrong((id *)&self->_modeEntityTrialClientWrapper, 0);
  objc_storeStrong((id *)&self->_modeConfigClient, 0);
  objc_storeStrong((id *)&self->_cachedWidgetScores, 0);
  objc_storeStrong((id *)&self->_cachedAppScoresForDenyList, 0);
  objc_storeStrong((id *)&self->_cachedAppScores, 0);
}

@end

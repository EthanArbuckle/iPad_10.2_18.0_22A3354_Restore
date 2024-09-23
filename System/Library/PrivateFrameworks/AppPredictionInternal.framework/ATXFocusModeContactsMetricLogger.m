@implementation ATXFocusModeContactsMetricLogger

- (ATXFocusModeContactsMetricLogger)initWithContactStore:(id)a3
{
  id v5;
  ATXFocusModeContactsMetricLogger *v6;
  ATXFocusModeContactsMetricLogger *v7;
  uint64_t v8;
  NSMutableDictionary *cachedContactScores;
  uint64_t v10;
  NSMutableDictionary *cachedContactScoresForDenyList;
  uint64_t v12;
  ATXDNDModeConfigurationClient *modeConfigClient;
  uint64_t v14;
  ATXModeEntityTrialClientWrapper *modeEntityTrialClientWrapper;
  ATXStableContactRepresentationDatastore *v16;
  ATXStableContactRepresentationDatastore *stableContactRepresentationDatastore;
  uint64_t v18;
  ATXModeAffinityModelsConstants *modeAffinityModelsConstants;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ATXFocusModeContactsMetricLogger;
  v6 = -[ATXFocusModeContactsMetricLogger init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contactStore, a3);
    v8 = objc_opt_new();
    cachedContactScores = v7->_cachedContactScores;
    v7->_cachedContactScores = (NSMutableDictionary *)v8;

    v10 = objc_opt_new();
    cachedContactScoresForDenyList = v7->_cachedContactScoresForDenyList;
    v7->_cachedContactScoresForDenyList = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x1E0CF8D60], "sharedInstance");
    v12 = objc_claimAutoreleasedReturnValue();
    modeConfigClient = v7->_modeConfigClient;
    v7->_modeConfigClient = (ATXDNDModeConfigurationClient *)v12;

    objc_msgSend(MEMORY[0x1E0CF8F60], "sharedInstance");
    v14 = objc_claimAutoreleasedReturnValue();
    modeEntityTrialClientWrapper = v7->_modeEntityTrialClientWrapper;
    v7->_modeEntityTrialClientWrapper = (ATXModeEntityTrialClientWrapper *)v14;

    v16 = -[ATXStableContactRepresentationDatastore initWithContactStore:]([ATXStableContactRepresentationDatastore alloc], "initWithContactStore:", v5);
    stableContactRepresentationDatastore = v7->_stableContactRepresentationDatastore;
    v7->_stableContactRepresentationDatastore = v16;

    v18 = objc_opt_new();
    modeAffinityModelsConstants = v7->_modeAffinityModelsConstants;
    v7->_modeAffinityModelsConstants = (ATXModeAffinityModelsConstants *)v18;

  }
  return v7;
}

- (void)logFocusModeContactSignalsWithModeConfigurationUIFlowLoggingEvent:(id)a3 xpcActivity:(id)a4
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
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  ATXFocusModeContactsMetricLogger *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  char v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id obj;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
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
  if (objc_msgSend(v6, "modeConfigurationEntityType") == 1)
  {
    modeConfigClient = self->_modeConfigClient;
    objc_msgSend(v6, "dndModeUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ATXDNDModeConfigurationClient atxModeForDNDMode:](modeConfigClient, "atxModeForDNDMode:", v9);

    if (v10)
    {
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

      v50 = (void *)v17;
      v41 = (void *)v20;
      -[ATXFocusModeContactsMetricLogger fetchRelevantContactIdsWithModeConfigurationUIFlowLoggingEvent:suggestedEntities:candidateEntities:currentEntities:](self, "fetchRelevantContactIdsWithModeConfigurationUIFlowLoggingEvent:suggestedEntities:candidateEntities:currentEntities:", v6, v17, v20, v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v11;
      if (v11)
      {
        -[ATXDNDModeConfigurationClient iOSContactDenyListForMode:](self->_modeConfigClient, "iOSContactDenyListForMode:", objc_msgSend(v11, "integerValue", v11));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXDNDModeConfigurationClient iOSContactAllowListForMode:](self->_modeConfigClient, "iOSContactAllowListForMode:", objc_msgSend(v11, "integerValue"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v48 = (void *)MEMORY[0x1E0C9AA60];
        v49 = (void *)MEMORY[0x1E0C9AA60];
      }
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      obj = v21;
      v22 = (void *)v20;
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
      if (v47)
      {
        v39 = 0;
        v45 = *(_QWORD *)v52;
        v40 = v10;
        while (2)
        {
          v23 = 0;
          v46 = v39 + 1;
          v39 += v47;
          do
          {
            if (*(_QWORD *)v52 != v45)
              objc_enumerationMutation(obj);
            v24 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v23);
            v25 = (void *)objc_opt_new();
            objc_msgSend(v25, "setFocusMode:", v10);
            if ((objc_msgSend(v49, "containsObject:", v24) & 1) != 0 || objc_msgSend(v6, "modeConfigurationType") == 1)
              objc_msgSend(v25, "setActiveConfigurationType:", CFSTR("DenyList"), v38);
            if ((objc_msgSend(v48, "containsObject:", v24, v38) & 1) != 0 || !objc_msgSend(v6, "modeConfigurationType"))
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

            objc_msgSend(v25, "setIsContactCandidateSuggestion:", objc_msgSend(v22, "containsObject:", v24));
            objc_msgSend(v25, "setIsContactRecommendedSuggestion:", objc_msgSend(v50, "containsObject:", v24));
            if ((objc_msgSend(v50, "containsObject:", v24) & 1) != 0
              || objc_msgSend(v22, "containsObject:", v24))
            {
              objc_msgSend(v25, "setWasContactSuggestedDuringModeSetup:", 1);
            }
            objc_msgSend(v25, "setWasContactSuggestionDuringModeSetupAccepted:", objc_msgSend(v14, "containsObject:", v24));
            if (!objc_msgSend(v6, "modeConfigurationType"))
              -[ATXFocusModeContactsMetricLogger populateContactModeAffinitySignalsForMode:contactId:metric:](self, "populateContactModeAffinitySignalsForMode:contactId:metric:", v10, v24, v25);
            if (objc_msgSend(v6, "modeConfigurationType") == 1)
              -[ATXFocusModeContactsMetricLogger populateContactModeDenyListSignalsForMode:contactId:metric:](self, "populateContactModeDenyListSignalsForMode:contactId:metric:", v10, v24, v25);
            __atxlog_handle_modes();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              v30 = (void *)objc_opt_class();
              v44 = v30;
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
              v10 = v40;

              v22 = v41;
            }

            objc_msgSend(v25, "logToCoreAnalytics");
            if ((unint64_t)(v46 + v23) > 0x13)
            {

              goto LABEL_32;
            }
            v37 = objc_msgSend(v7, "didDefer");

            if ((v37 & 1) != 0)
              goto LABEL_32;
            ++v23;
          }
          while (v47 != v23);
          v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
          if (v47)
            continue;
          break;
        }
      }
LABEL_32:

    }
  }

}

- (void)populateContactModeAffinitySignalsForMode:(unint64_t)a3 contactId:(id)a4 metric:(id)a5
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
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
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
  -[ATXFocusModeContactsMetricLogger _contactScoresForMode:](self, "_contactScoresForMode:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXStableContactRepresentationDatastore stableContactRepresentationForCnContactId:rawIdentifier:](self->_stableContactRepresentationDatastore, "stableContactRepresentationForCnContactId:rawIdentifier:", v8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stableContactIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v33 = v10;
      v34 = v8;
      v32 = v12;
      objc_msgSend(v10, "objectForKeyedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "scoreMetadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "featureVector");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = -[ATXModeEntityScoringFeatures initFromJSON:]([ATXModeEntityScoringFeatures alloc], "initFromJSON:", v16);
      v31 = v14;
      v17 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v14, "scoreMetadata");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "score");
      objc_msgSend(v17, "numberWithDouble:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setEntityModeEntityScore:", v19);

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      -[ATXFocusModeContactsMetricLogger metricFieldsToFeatureNames](self, "metricFieldsToFeatureNames");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v36;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v36 != v23)
              objc_enumerationMutation(v20);
            v25 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v24);
            -[ATXFocusModeContactsMetricLogger metricFieldsToFeatureNames](self, "metricFieldsToFeatureNames");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectForKeyedSubscript:", v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v27)
            {
              objc_msgSend(v16, "objectForKeyedSubscript:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if (v28)
              {
                objc_msgSend(v16, "objectForKeyedSubscript:", v27);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "setValue:forKey:", v29, v25);

              }
            }

            ++v24;
          }
          while (v22 != v24);
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        }
        while (v22);
      }

      -[ATXFocusModeContactsMetricLogger addContactEntitySpecificFeatures:toMetric:](self, "addContactEntitySpecificFeatures:toMetric:", v30, v9);
      v10 = v33;
      v8 = v34;
      v12 = v32;
    }
  }

}

- (void)populateContactModeDenyListSignalsForMode:(unint64_t)a3 contactId:(id)a4 metric:(id)a5
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
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
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
  -[ATXFocusModeContactsMetricLogger _contactScoresForDenyListForMode:](self, "_contactScoresForDenyListForMode:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXStableContactRepresentationDatastore stableContactRepresentationForCnContactId:rawIdentifier:](self->_stableContactRepresentationDatastore, "stableContactRepresentationForCnContactId:rawIdentifier:", v8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stableContactIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v33 = v10;
      v34 = v8;
      v32 = v12;
      objc_msgSend(v10, "objectForKeyedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "scoreMetadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "featureVector");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = -[ATXModeEntityScoringFeatures initFromJSON:]([ATXModeEntityScoringFeatures alloc], "initFromJSON:", v16);
      v31 = v14;
      v17 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v14, "scoreMetadata");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "score");
      objc_msgSend(v17, "numberWithDouble:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setEntityModeEntityScore:", v19);

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      -[ATXFocusModeContactsMetricLogger metricFieldsToFeatureNames](self, "metricFieldsToFeatureNames");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v36;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v36 != v23)
              objc_enumerationMutation(v20);
            v25 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v24);
            -[ATXFocusModeContactsMetricLogger metricFieldsToFeatureNames](self, "metricFieldsToFeatureNames");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectForKeyedSubscript:", v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v27)
            {
              objc_msgSend(v16, "objectForKeyedSubscript:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if (v28)
              {
                objc_msgSend(v16, "objectForKeyedSubscript:", v27);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "setValue:forKey:", v29, v25);

              }
            }

            ++v24;
          }
          while (v22 != v24);
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        }
        while (v22);
      }

      -[ATXFocusModeContactsMetricLogger addContactEntitySpecificFeatures:toMetric:](self, "addContactEntitySpecificFeatures:toMetric:", v30, v9);
      v10 = v33;
      v8 = v34;
      v12 = v32;
    }
  }

}

- (void)addContactEntitySpecificFeatures:(id)a3 toMetric:(id)a4
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
  id v21;

  modeAffinityModelsConstants = self->_modeAffinityModelsConstants;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "setContactEngagedGloballyOverLastNDays:", objc_msgSend(v8, "entityOccurredGloballyOverLastNDays:", -[ATXModeAffinityModelsConstants numOfDaysToComputeEntityOccurenceFeaturesForContacts](modeAffinityModelsConstants, "numOfDaysToComputeEntityOccurenceFeaturesForContacts")));
  objc_msgSend(v7, "setContactEngagedInModeOverLastNDays:", objc_msgSend(v8, "entityOccurredInModeOverLastNDays:", -[ATXModeAffinityModelsConstants numOfDaysToComputeEntityOccurenceFeaturesForContacts](self->_modeAffinityModelsConstants, "numOfDaysToComputeEntityOccurenceFeaturesForContacts")));
  objc_msgSend(v8, "entitySpecificFeatures");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setContactIsFavorite:", objc_msgSend(v21, "isFavoriteContact"));
  objc_msgSend(v7, "setContactIsVIP:", objc_msgSend(v21, "isVIPContact"));
  objc_msgSend(v7, "setContactIsEmergency:", objc_msgSend(v21, "isEmergencyContact"));
  objc_msgSend(v7, "setContactIsiCloudFamilyMember:", objc_msgSend(v21, "isICloudFamilyMember"));
  objc_msgSend(v21, "modeCountOfNotificationsClearedForEntity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNotificationsClearedInMode:", v9);

  objc_msgSend(v21, "globalCountOfNotificationsClearedForEntity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNotificationsClearedGlobally:", v10);

  objc_msgSend(v21, "localNotificationsClearedRateForEntity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalNotificationsClearedRateForEntity:", v11);

  objc_msgSend(v21, "globalNotificationsClearedRateForEntity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGlobalNotificationsClearedRateForEntity:", v12);

  objc_msgSend(v21, "ratioOfLocalToGlobalNotificationsClearedRateForEntity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRatioOfLocalToGlobalNotificationsClearedRateForEntity:", v13);

  objc_msgSend(v21, "classConditionalOfNotificationsClearedForEntity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClassConditionalOfNotificationsClearedForEntity:", v14);

  objc_msgSend(v21, "globalCountOfNotificationsReceivedForEntity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNotificationsReceivedGlobally:", v15);

  objc_msgSend(v21, "modeCountOfNotificationsReceivedForEntity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNotificationsReceivedInMode:", v16);

  objc_msgSend(v21, "localPopularityOfNotificationsReceivedForEntity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalPopularityOfNotificationsReceivedForEntity:", v17);

  objc_msgSend(v21, "globalPopularityOfNotificationsReceivedForEntity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGlobalPopularityOfNotificationsReceivedForEntity:", v18);

  objc_msgSend(v21, "ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRatioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity:", v19);

  objc_msgSend(v21, "classConditionalOfNotificationsReceivedForEntity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClassConditionalOfNotificationsReceivedForEntity:", v20);

}

- (id)fetchRelevantContactIdsWithModeConfigurationUIFlowLoggingEvent:(id)a3 suggestedEntities:(id)a4 candidateEntities:(id)a5 currentEntities:(id)a6
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
  return &unk_1E83D0978;
}

- (id)_contactScoresForMode:(unint64_t)a3
{
  NSMutableDictionary *cachedContactScores;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  ATXContactModeModel *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;

  cachedContactScores = self->_cachedContactScores;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](cachedContactScores, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = self->_cachedContactScores;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (ATXContactModeModel *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = -[ATXContactModeModel initWithMode:contactStore:]([ATXContactModeModel alloc], "initWithMode:contactStore:", a3, self->_contactStore);
    -[ATXContactModeModel scoredEntities](v9, "scoredEntities");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_cachedContactScores;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, v13);

    v14 = self->_cachedContactScores;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)_contactScoresForDenyListForMode:(unint64_t)a3
{
  NSMutableDictionary *cachedContactScoresForDenyList;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  ATXContactModeDenyListModel *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;

  cachedContactScoresForDenyList = self->_cachedContactScoresForDenyList;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](cachedContactScoresForDenyList, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = self->_cachedContactScoresForDenyList;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (ATXContactModeDenyListModel *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = -[ATXContactModeDenyListModel initWithMode:contactStore:]([ATXContactModeDenyListModel alloc], "initWithMode:contactStore:", a3, self->_contactStore);
    -[ATXContactModeDenyListModel scoredEntities](v9, "scoredEntities");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_cachedContactScoresForDenyList;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, v13);

    v14 = self->_cachedContactScoresForDenyList;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeAffinityModelsConstants, 0);
  objc_storeStrong((id *)&self->_stableContactRepresentationDatastore, 0);
  objc_storeStrong((id *)&self->_modeEntityTrialClientWrapper, 0);
  objc_storeStrong((id *)&self->_modeConfigClient, 0);
  objc_storeStrong((id *)&self->_cachedContactScoresForDenyList, 0);
  objc_storeStrong((id *)&self->_cachedContactScores, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end

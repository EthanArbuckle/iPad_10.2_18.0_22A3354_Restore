@implementation ATXAppModeDenyListModel

- (ATXAppModeDenyListModel)initWithMode:(unint64_t)a3 modeEntityStore:(id)a4 globalInterruptingAppModel:(id)a5
{
  id v9;
  id v10;
  ATXAppModeDenyListModel *v11;
  ATXAppModeDenyListModel *v12;
  uint64_t v13;
  MLModel *appModeModel;
  uint64_t v15;
  ATXNotificationAndSuggestionDatastore *notificationDatastore;
  uint64_t v17;
  ATXModeEntityEventProviderProtocol *modeEventProvider;
  uint64_t v19;
  ATXModeAffinityModelsConstants *modeAffinityModelsConstants;
  objc_super v22;

  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)ATXAppModeDenyListModel;
  v11 = -[ATXAppModeDenyListModel init](&v22, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_mode = a3;
    -[ATXAppModeDenyListModel loadAppModeCoreMLModel](v11, "loadAppModeCoreMLModel");
    v13 = objc_claimAutoreleasedReturnValue();
    appModeModel = v12->_appModeModel;
    v12->_appModeModel = (MLModel *)v13;

    objc_storeStrong((id *)&v12->_modeEntityStore, a4);
    v15 = objc_opt_new();
    notificationDatastore = v12->_notificationDatastore;
    v12->_notificationDatastore = (ATXNotificationAndSuggestionDatastore *)v15;

    objc_storeStrong((id *)&v12->_globalInterruptingAppModel, a5);
    +[ATXModeEntityModelTrainer eventProviderForMode:](ATXModeEntityModelTrainer, "eventProviderForMode:", a3);
    v17 = objc_claimAutoreleasedReturnValue();
    modeEventProvider = v12->_modeEventProvider;
    v12->_modeEventProvider = (ATXModeEntityEventProviderProtocol *)v17;

    v19 = objc_opt_new();
    modeAffinityModelsConstants = v12->_modeAffinityModelsConstants;
    v12->_modeAffinityModelsConstants = (ATXModeAffinityModelsConstants *)v19;

  }
  return v12;
}

- (id)scoredEntities
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char **__ptr32 *v9;
  ATXModeEntityCorrelator *v10;
  ATXModeEntityEventProviderProtocol *modeEventProvider;
  void *v12;
  void *v13;
  void *v14;
  ATXModeEntityCorrelator *v15;
  ATXAppInterruptionsEventProvider *v16;
  ATXAppInterruptionsEventProvider *appInterruptionsEventProvider;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  ATXAppNotificationEngagementEventProvider *v26;
  ATXAppNotificationEngagementEventProvider *appNotificationEngagementEventProvider;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  _QWORD v42[5];
  id v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  ATXAppModeDenyListModel *v47;
  id v48;
  id v49;

  v3 = (void *)objc_opt_new();
  v4 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[ATXGlobalInterruptingAppModel bundleIds](self->_globalInterruptingAppModel, "bundleIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithSet:", v5);

  v7 = (void *)objc_opt_new();
  v8 = MEMORY[0x1E0C809B0];
  v9 = &off_1C9E7D000;
  if (self->_modeEventProvider)
  {
    v10 = [ATXModeEntityCorrelator alloc];
    modeEventProvider = self->_modeEventProvider;
    v12 = (void *)objc_opt_new();
    v13 = (void *)objc_opt_new();
    v14 = (void *)objc_opt_new();
    v15 = -[ATXModeEntityCorrelator initWithModeEventProvider:appLaunchEventProvider:macPortableAppEventProvider:macDesktopAppEventProvider:](v10, "initWithModeEventProvider:appLaunchEventProvider:macPortableAppEventProvider:macDesktopAppEventProvider:", modeEventProvider, v12, v13, v14);

    v16 = -[ATXAppInterruptionsEventProvider initWithModeEventProvider:]([ATXAppInterruptionsEventProvider alloc], "initWithModeEventProvider:", self->_modeEventProvider);
    appInterruptionsEventProvider = self->_appInterruptionsEventProvider;
    self->_appInterruptionsEventProvider = v16;

    if (!-[ATXAppInterruptionsEventProvider successfullyCalculatedAppSessionInterruptions](self->_appInterruptionsEventProvider, "successfullyCalculatedAppSessionInterruptions"))
    {
      __atxlog_handle_modes();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[ATXAppModeDenyListModel scoredEntities].cold.2(v18, v19, v20, v21, v22, v23, v24, v25);

    }
    v26 = -[ATXAppNotificationEngagementEventProvider initWithModeEventProvider:]([ATXAppNotificationEngagementEventProvider alloc], "initWithModeEventProvider:", self->_modeEventProvider);
    appNotificationEngagementEventProvider = self->_appNotificationEngagementEventProvider;
    self->_appNotificationEngagementEventProvider = v26;

    v9 = &off_1C9E7D000;
    if (!-[ATXAppNotificationEngagementEventProvider successfullyCalculatedNotificationEvents](self->_appNotificationEngagementEventProvider, "successfullyCalculatedNotificationEvents"))
    {
      __atxlog_handle_modes();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[ATXAppModeDenyListModel scoredEntities].cold.1(v28, v29, v30, v31, v32, v33, v34, v35);

    }
    -[ATXModeEntityCorrelator entityFeaturesForModeEntityScoring](v15, "entityFeaturesForModeEntityScoring");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v8;
    v45[1] = 3221225472;
    v45[2] = __41__ATXAppModeDenyListModel_scoredEntities__block_invoke;
    v45[3] = &unk_1E82DB268;
    v46 = v6;
    v47 = self;
    v48 = v3;
    v49 = v7;
    objc_msgSend(v36, "enumerateKeysAndObjectsUsingBlock:", v45);

  }
  objc_msgSend(v6, "minusSet:", v7);
  v42[0] = v8;
  v42[1] = *((_QWORD *)v9 + 357);
  v42[2] = __41__ATXAppModeDenyListModel_scoredEntities__block_invoke_2;
  v42[3] = &unk_1E82E72D0;
  v42[4] = self;
  v37 = v3;
  v43 = v37;
  v44 = v7;
  v38 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v42);
  v39 = v44;
  v40 = v37;

  return v40;
}

void __41__ATXAppModeDenyListModel_scoredEntities__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v10))
  {
    objc_msgSend(*(id *)(a1 + 40), "scoredAppModeEntityWithAppFeatures:bundleId:", v5, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 48);
    objc_msgSend(v5, "entity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v6, v9);

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v10);
  }

}

void __41__ATXAppModeDenyListModel_scoredEntities__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "scoredAppModeEntityWithAppFeatures:bundleId:", 0, v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v5, v4);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);

}

- (id)scoredAppModeEntityWithAppFeatures:(id)a3 bundleId:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    v7 = a4;
    v6 = (id)objc_opt_new();
    +[ATXSessionTaggingAppEntity genreIdForBundleId:](ATXSessionTaggingAppEntity, "genreIdForBundleId:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = &unk_1E83CD8A0;
    if (v8)
      v10 = (void *)v8;
    v11 = v10;

    v12 = objc_alloc(MEMORY[0x1E0CF8CC0]);
    v22[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(v12, "initWithBundleId:itunesGenreIds:", v7, v13);
    objc_msgSend(v6, "setEntity:", v14);

  }
  -[ATXAppModeDenyListModel addEntitySpecificFeaturesToAppFeatures:](self, "addEntitySpecificFeaturesToAppFeatures:", v6);
  -[ATXAppModeDenyListModel scoreFromAppFeatures:](self, "scoreFromAppFeatures:", v6);
  v16 = v15;
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setScore:", v16);
  objc_msgSend(v6, "jsonRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFeatureVector:", v18);

  objc_msgSend(v6, "entity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setScoreMetadata:", v17);

  objc_msgSend(v6, "entity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)addEntitySpecificFeaturesToAppFeatures:(id)a3
{
  id v4;
  ATXModeEntityStore *modeEntityStore;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  ATXNotificationAndSuggestionDatastore *notificationDatastore;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;

  v4 = a3;
  if (v4)
  {
    modeEntityStore = self->_modeEntityStore;
    v37 = v4;
    objc_msgSend(v4, "entity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXModeEntityStore appEntityForBundleId:](modeEntityStore, "appEntityForBundleId:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "affinityVector");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "scoreForMode:", self->_mode);
      v11 = v10;

      objc_msgSend(v8, "affinityVector_v2");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scoreForMode:", self->_mode);
      v14 = v13;

      objc_msgSend(v37, "entitySpecificFeatures");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
        v17 = v15;
      else
        v17 = (id)objc_opt_new();
      v18 = v17;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAppCategoryScore:", v19);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAppCategoryScore_v2:", v20);

      objc_msgSend(v37, "entity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXAppModeDenyListModel addAppInterruptingSignalsForIdentifier:toAppSpecificFeatures:](self, "addAppInterruptingSignalsForIdentifier:toAppSpecificFeatures:", v22, v18);

      objc_msgSend(v37, "entity");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXAppModeDenyListModel addNotificationsSignalsForIdentifier:toAppSpecificFeatures:](self, "addNotificationsSignalsForIdentifier:toAppSpecificFeatures:", v24, v18);

      objc_msgSend(v37, "entity");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXAppModeDenyListModel addGlobalModeInterruptingPriorsForIdentifier:toAppSpecificFeatures:](self, "addGlobalModeInterruptingPriorsForIdentifier:toAppSpecificFeatures:", v26, v18);

      notificationDatastore = self->_notificationDatastore;
      v28 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      objc_msgSend(v28, "dateWithTimeIntervalSinceReferenceDate:", v29 + -1209600.0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXNotificationAndSuggestionDatastore notificationsReceivedPerBundleIdSinceDate:](notificationDatastore, "notificationsReceivedPerBundleIdSinceDate:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v37, "entity");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "identifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", v33);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)v34;
      if (v34)
        v36 = (void *)v34;
      else
        v36 = &unk_1E83CD8A0;
      objc_msgSend(v18, "setNotificationsReceivedInLastTwoWeeks:", v36);

      objc_msgSend(v37, "setEntitySpecificFeatures:", v18);
    }

    v4 = v37;
  }

}

- (void)addGlobalModeInterruptingPriorsForIdentifier:(id)a3 toAppSpecificFeatures:(id)a4
{
  void *v5;
  ATXGlobalInterruptingAppModel *globalInterruptingAppModel;
  ATXModeAffinityModelsConstants *modeAffinityModelsConstants;
  id v8;
  id v9;
  double v10;
  double v11;
  id v12;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  globalInterruptingAppModel = self->_globalInterruptingAppModel;
  modeAffinityModelsConstants = self->_modeAffinityModelsConstants;
  v8 = a4;
  v9 = a3;
  -[ATXModeAffinityModelsConstants scalingFactorForModeGlobalPriors](modeAffinityModelsConstants, "scalingFactorForModeGlobalPriors");
  -[ATXGlobalInterruptingAppModel scoreForBundleId:scalingFactor:](globalInterruptingAppModel, "scoreForBundleId:scalingFactor:", v9);
  v11 = v10;

  objc_msgSend(v5, "numberWithDouble:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGlobalInterruptingPrior:", v12);

}

- (void)addAppInterruptingSignalsForIdentifier:(id)a3 toAppSpecificFeatures:(id)a4
{
  void *v6;
  ATXAppInterruptionsEventProvider *appInterruptionsEventProvider;
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
  double v19;
  double v20;
  id v21;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  appInterruptionsEventProvider = self->_appInterruptionsEventProvider;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v6, "numberWithUnsignedInteger:", -[ATXAppInterruptionsEventProvider modeAppInterruptionsCountByEntity:](appInterruptionsEventProvider, "modeAppInterruptionsCountByEntity:", v9));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setModeAppInterruptionsCountByEntity:", v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXAppInterruptionsEventProvider globalAppInterruptionsCountByEntity:](self->_appInterruptionsEventProvider, "globalAppInterruptionsCountByEntity:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGlobalAppInterruptionsCountByEntity:", v11);

  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXAppInterruptionsEventProvider modePopularityOfInterruptingEntity:](self->_appInterruptionsEventProvider, "modePopularityOfInterruptingEntity:", v9);
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setModePopularityOfInterruptingEntity:", v13);

  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXAppInterruptionsEventProvider globalPopularityOfInterruptingEntity:](self->_appInterruptionsEventProvider, "globalPopularityOfInterruptingEntity:", v9);
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGlobalPopularityOfInterruptingEntity:", v15);

  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXAppInterruptionsEventProvider modeAppInterruptionsClassConditionalProbabilityByEntity:](self->_appInterruptionsEventProvider, "modeAppInterruptionsClassConditionalProbabilityByEntity:", v9);
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setModeAppInterruptionsClassConditionalProbabilityByEntity:", v17);

  v18 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXAppInterruptionsEventProvider ratioOfModePopularityToGlobalPopularityOfInterruptingEntity:](self->_appInterruptionsEventProvider, "ratioOfModePopularityToGlobalPopularityOfInterruptingEntity:", v9);
  v20 = v19;

  objc_msgSend(v18, "numberWithDouble:", v20);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRatioOfModePopularityToGlobalPopularityOfInterruptingEntity:", v21);

}

- (void)addNotificationsSignalsForIdentifier:(id)a3 toAppSpecificFeatures:(id)a4
{
  void *v6;
  ATXAppNotificationEngagementEventProvider *appNotificationEngagementEventProvider;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  id v31;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  appNotificationEngagementEventProvider = self->_appNotificationEngagementEventProvider;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v6, "numberWithUnsignedInteger:", -[ATXAppNotificationEngagementEventProvider modeCountOfNotificationsClearedForBundleId:](appNotificationEngagementEventProvider, "modeCountOfNotificationsClearedForBundleId:", v9));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setModeCountOfNotificationsClearedForEntity:", v10);

  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXAppNotificationEngagementEventProvider localNotificationsClearedRateForBundleId:](self->_appNotificationEngagementEventProvider, "localNotificationsClearedRateForBundleId:", v9);
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLocalNotificationsClearedRateForEntity:", v12);

  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXAppNotificationEngagementEventProvider globalNotificationsClearedRateForBundleId:](self->_appNotificationEngagementEventProvider, "globalNotificationsClearedRateForBundleId:", v9);
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGlobalNotificationsClearedRateForEntity:", v14);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXAppNotificationEngagementEventProvider globalCountOfNotificationsClearedForBundleId:](self->_appNotificationEngagementEventProvider, "globalCountOfNotificationsClearedForBundleId:", v9));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGlobalCountOfNotificationsClearedForEntity:", v15);

  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXAppNotificationEngagementEventProvider ratioOfLocalToGlobalNotificationsClearedRateForBundleId:](self->_appNotificationEngagementEventProvider, "ratioOfLocalToGlobalNotificationsClearedRateForBundleId:", v9);
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRatioOfLocalToGlobalNotificationsClearedRateForEntity:", v17);

  v18 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXAppNotificationEngagementEventProvider classConditionalOfNotificationsClearedForBundleId:](self->_appNotificationEngagementEventProvider, "classConditionalOfNotificationsClearedForBundleId:", v9);
  objc_msgSend(v18, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClassConditionalOfNotificationsClearedForEntity:", v19);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXAppNotificationEngagementEventProvider globalCountOfNotificationsReceivedForBundleId:](self->_appNotificationEngagementEventProvider, "globalCountOfNotificationsReceivedForBundleId:", v9));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGlobalCountOfNotificationsReceivedForEntity:", v20);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXAppNotificationEngagementEventProvider modeCountOfNotificationsReceivedForBundleId:](self->_appNotificationEngagementEventProvider, "modeCountOfNotificationsReceivedForBundleId:", v9));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setModeCountOfNotificationsReceivedForEntity:", v21);

  v22 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXAppNotificationEngagementEventProvider localPopularityOfNotificationsReceivedForBundleId:](self->_appNotificationEngagementEventProvider, "localPopularityOfNotificationsReceivedForBundleId:", v9);
  objc_msgSend(v22, "numberWithDouble:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLocalPopularityOfNotificationsReceivedForEntity:", v23);

  v24 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXAppNotificationEngagementEventProvider globalPopularityOfNotificationsReceivedForBundleId:](self->_appNotificationEngagementEventProvider, "globalPopularityOfNotificationsReceivedForBundleId:", v9);
  objc_msgSend(v24, "numberWithDouble:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGlobalPopularityOfNotificationsReceivedForEntity:", v25);

  v26 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXAppNotificationEngagementEventProvider ratioOfLocalToGlobalPopularityOfNotificationsReceivedForBundleId:](self->_appNotificationEngagementEventProvider, "ratioOfLocalToGlobalPopularityOfNotificationsReceivedForBundleId:", v9);
  objc_msgSend(v26, "numberWithDouble:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRatioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity:", v27);

  v28 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXAppNotificationEngagementEventProvider classConditionalOfNotificationsReceivedForBundleId:](self->_appNotificationEngagementEventProvider, "classConditionalOfNotificationsReceivedForBundleId:", v9);
  v30 = v29;

  objc_msgSend(v28, "numberWithDouble:", v30);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClassConditionalOfNotificationsReceivedForEntity:", v31);

}

- (id)featuresToModel:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;

  v4 = a3;
  objc_msgSend(v4, "entitySpecificFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    __atxlog_handle_modes();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[ATXAppModeDenyListModel featuresToModel:].cold.1(v7);

  }
  objc_msgSend(v4, "entitySpecificFeatures");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appCategoryScore_v2");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modePopularityOfInterruptingEntity");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "globalCountOfNotificationsClearedForEntity");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "globalAppInterruptionsCountByEntity");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modeAppInterruptionsCountByEntity");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modeAppInterruptionsClassConditionalProbabilityByEntity");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ratioOfModePopularityToGlobalPopularityOfInterruptingEntity");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localNotificationsClearedRateForEntity");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "globalPopularityOfInterruptingEntity");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "globalInterruptingPrior");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "globalNotificationsClearedRateForEntity");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modeCountOfNotificationsClearedForEntity");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ratioOfLocalToGlobalNotificationsClearedRateForEntity");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "classConditionalOfNotificationsClearedForEntity");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "globalCountOfNotificationsReceivedForEntity");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modeCountOfNotificationsReceivedForEntity");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localPopularityOfNotificationsReceivedForEntity");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "globalPopularityOfNotificationsReceivedForEntity");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "classConditionalOfNotificationsReceivedForEntity");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "globalOccurrences"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "entityOccurredGloballyOverLastNDays:", -[ATXModeAffinityModelsConstants numOfDaysToComputeEntityOccurenceFeatures](self->_modeAffinityModelsConstants, "numOfDaysToComputeEntityOccurenceFeatures")));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "entityOccurredInModeOverLastNDays:", -[ATXModeAffinityModelsConstants numOfDaysToComputeEntityOccurenceFeatures](self->_modeAffinityModelsConstants, "numOfDaysToComputeEntityOccurenceFeatures")));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "ratioModeAndGlobalPopularity");
  objc_msgSend(v9, "numberWithDouble:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "localOccurrences"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "uniqueOccurrencesInMode"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "posteriorProbability");
  objc_msgSend(v10, "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "classConditionalProbability");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "globalPopularity");
  objc_msgSend(v13, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "modePopularity");
  v16 = v15;

  objc_msgSend(v14, "numberWithDouble:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setObject:forKey:", v25, CFSTR("entityOccurredGloballyOverTheLastNDays"));
  objc_msgSend(v17, "setObject:forKey:", v24, CFSTR("entityOccurredInModeOverLastNDays"));
  objc_msgSend(v17, "setObject:forKey:", v45, CFSTR("appCategoryScore"));
  objc_msgSend(v17, "setObject:forKey:", v38, CFSTR("globalAppInterruptionsCountByEntity"));
  objc_msgSend(v17, "setObject:forKey:", v34, CFSTR("globalClearanceRateForEntity"));
  objc_msgSend(v17, "setObject:forKey:", v35, CFSTR("globalInterruptingPrior"));
  objc_msgSend(v17, "setObject:forKey:", v23, CFSTR("globalOccurrencesOfEntity"));
  objc_msgSend(v17, "setObject:forKey:", v39, CFSTR("globalPopularityOfInterruptingEntity"));
  objc_msgSend(v17, "setObject:forKey:", v46, CFSTR("localClearanceRateForEntity"));
  objc_msgSend(v17, "setObject:forKey:", v22, CFSTR("localOccurrencesOfEntityInMode"));
  objc_msgSend(v17, "setObject:forKey:", v44, CFSTR("modeAppInterruptionsClassConditionalProbabilityByEntity"));
  objc_msgSend(v17, "setObject:forKey:", v42, CFSTR("ratioOfModePopularityToGlobalPopularityOfInterruptingEntity"));
  objc_msgSend(v17, "setObject:forKey:", v47, CFSTR("modeAppInterruptionsCountByEntity"));
  objc_msgSend(v17, "setObject:forKey:", v43, CFSTR("modePopularityOfInterruptingEntity"));
  objc_msgSend(v17, "setObject:forKey:", v41, CFSTR("globalCountOfNotificationsClearedForEntity"));
  objc_msgSend(v17, "setObject:forKey:", v20, CFSTR("posteriorProbabilityOfEntityGivenMode"));
  objc_msgSend(v17, "setObject:forKey:", v33, CFSTR("ratioOfModePopularityToGlobalPopularityOfEntity"));
  objc_msgSend(v17, "setObject:forKey:", v32, CFSTR("uniqueOccurrencesOfEntityInMode"));
  objc_msgSend(v17, "setObject:forKey:", v12, CFSTR("classConditionalProbabilityOfModeGivenEntity"));
  objc_msgSend(v17, "setObject:forKey:", v21, CFSTR("globalPopularityForEntity"));
  objc_msgSend(v17, "setObject:forKey:", v19, CFSTR("modePopularityForEntity"));
  objc_msgSend(v17, "setObject:forKey:", v40, CFSTR("modeCountOfNotificationsClearedForEntity"));
  objc_msgSend(v17, "setObject:forKey:", v36, CFSTR("ratioOfLocalToGlobalNotificationsClearedRateForEntity"));
  objc_msgSend(v17, "setObject:forKey:", v37, CFSTR("classConditionalOfNotificationsClearedForEntity"));
  objc_msgSend(v17, "setObject:forKey:", v26, CFSTR("globalCountOfNotificationsReceivedForEntity"));
  objc_msgSend(v17, "setObject:forKey:", v27, CFSTR("modeCountOfNotificationsReceivedForEntity"));
  objc_msgSend(v17, "setObject:forKey:", v28, CFSTR("localPopularityOfNotificationsReceivedForEntity"));
  objc_msgSend(v17, "setObject:forKey:", v29, CFSTR("globalPopularityOfNotificationsReceivedForEntity"));
  objc_msgSend(v17, "setObject:forKey:", v30, CFSTR("ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity"));
  objc_msgSend(v17, "setObject:forKey:", v31, CFSTR("classConditionalOfNotificationsReceivedForEntity"));

  return v17;
}

- (id)modelName
{
  return CFSTR("ATXAppModeDenyListModel");
}

- (id)loadAppModeCoreMLModel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[ATXAppModeDenyListModel modelName](self, "modelName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadCoreMLModelFromTrialWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
  }
  else
  {
    -[ATXAppModeDenyListModel modelName](self, "modelName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXCoreMLUtilities loadCoreMLModelWithName:](ATXCoreMLUtilities, "loadCoreMLModelWithName:", v7);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (double)scoreFromAppFeatures:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  MLModel *appModeModel;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  id v30;
  id v31;

  v4 = a3;
  if (self->_appModeModel)
  {
    v5 = objc_alloc(MEMORY[0x1E0C9E8F8]);
    -[ATXAppModeDenyListModel featuresToModel:](self, "featuresToModel:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v7 = (void *)objc_msgSend(v5, "initWithDictionary:error:", v6, &v31);
    v8 = v31;

    if (v8)
    {
      __atxlog_handle_modes();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[ATXAppModeDenyListModel scoreFromAppFeatures:].cold.2((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);

    }
    appModeModel = self->_appModeModel;
    v30 = v8;
    -[MLModel predictionFromFeatures:error:](appModeModel, "predictionFromFeatures:error:", v7, &v30);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v30;

    if (v18)
    {
      __atxlog_handle_modes();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[ATXAppModeDenyListModel scoreFromAppFeatures:].cold.1((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);

    }
    objc_msgSend(v17, "featureValueForName:", CFSTR("classProbability"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXCoreMLUtilities scoreForModelOutputValue:outputIndexedSubscript:](ATXCoreMLUtilities, "scoreForModelOutputValue:outputIndexedSubscript:", v26, 1);
    v28 = v27;
    if ((unint64_t)objc_msgSend(v4, "uniqueOccurrencesInMode") < 2)
      v28 = v28 * 0.5;

  }
  else
  {
    v28 = 0.0;
  }

  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeAffinityModelsConstants, 0);
  objc_storeStrong((id *)&self->_modeEventProvider, 0);
  objc_storeStrong((id *)&self->_appInterruptionsEventProvider, 0);
  objc_storeStrong((id *)&self->_appNotificationEngagementEventProvider, 0);
  objc_storeStrong((id *)&self->_notificationDatastore, 0);
  objc_storeStrong((id *)&self->_globalInterruptingAppModel, 0);
  objc_storeStrong((id *)&self->_modeEntityStore, 0);
  objc_storeStrong((id *)&self->_appModeModel, 0);
}

- (void)scoredEntities
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "ATXAppModeDenyListModel: There was an error in calculating app session interruptions from ATXAppInterruptionsEventProvider", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)featuresToModel:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "appFeatures.entitySpecificFeatures is not a sublass for ATXAppEntityFeatures", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)scoreFromAppFeatures:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXAppModeDenyListModel - Error during inference on the CoreMLModel: %@", a5, a6, a7, a8, 2u);
}

- (void)scoreFromAppFeatures:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXAppModeDenyListModel - Error initializing MLDictionaryFeatureProvider for inference on the CoreMLModel: %@", a5, a6, a7, a8, 2u);
}

@end

@implementation ATXAnchorModelDataStoreWrapper

- (ATXAnchorModelDataStoreWrapper)init
{
  void *v3;
  ATXAnchorModelDataStoreWrapper *v4;

  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXAnchorModelDataStoreWrapper initWithDataStore:](self, "initWithDataStore:", v3);

  return v4;
}

- (ATXAnchorModelDataStoreWrapper)initWithDataStore:(id)a3
{
  id v5;
  ATXAnchorModelDataStoreWrapper *v6;
  ATXAnchorModelDataStoreWrapper *v7;
  uint64_t v8;
  NSDate *twentyOneDaysAgo;
  id v10;
  void *v11;
  double v12;
  uint64_t v13;
  NSDate *dateOfOldestAllowedCandidateOccurrenceForCandidateGeneration;
  uint64_t v15;
  NSMutableDictionary *numCandidateOccurrencesInAllContextsForCandidateTypeCache;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ATXAnchorModelDataStoreWrapper;
  v6 = -[ATXAnchorModelDataStoreWrapper init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -1814400.0);
    twentyOneDaysAgo = v7->_twentyOneDaysAgo;
    v7->_twentyOneDaysAgo = (NSDate *)v8;

    v10 = objc_alloc(MEMORY[0x1E0C99D68]);
    +[ATXAnchorModelHyperParameters sharedInstance](ATXAnchorModelHyperParameters, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "maxSecondsSinceCandidateOccurrenceToConsiderCandidateForPrediction");
    v13 = objc_msgSend(v10, "initWithTimeIntervalSinceNow:", -v12);
    dateOfOldestAllowedCandidateOccurrenceForCandidateGeneration = v7->_dateOfOldestAllowedCandidateOccurrenceForCandidateGeneration;
    v7->_dateOfOldestAllowedCandidateOccurrenceForCandidateGeneration = (NSDate *)v13;

    v15 = objc_opt_new();
    numCandidateOccurrencesInAllContextsForCandidateTypeCache = v7->_numCandidateOccurrencesInAllContextsForCandidateTypeCache;
    v7->_numCandidateOccurrencesInAllContextsForCandidateTypeCache = (NSMutableDictionary *)v15;

  }
  return v7;
}

- (double)timestampOfMostRecentRecordedAnchorOccurrenceForAnchor:(id)a3
{
  id v4;
  NSObject *v5;
  _ATXDataStore *store;
  id v7;
  double v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  __atxlog_handle_anchor();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ATXAnchorModelDataStoreWrapper timestampOfMostRecentRecordedAnchorOccurrenceForAnchor:].cold.1();

  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x2020000000;
  v16 = 0;
  store = self->_store;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __89__ATXAnchorModelDataStoreWrapper_timestampOfMostRecentRecordedAnchorOccurrenceForAnchor___block_invoke;
  v10[3] = &unk_1E82DCC50;
  v10[4] = self;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  -[_ATXDataStore _doSync:](store, "_doSync:", v10);
  v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __89__ATXAnchorModelDataStoreWrapper_timestampOfMostRecentRecordedAnchorOccurrenceForAnchor___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__ATXAnchorModelDataStoreWrapper_timestampOfMostRecentRecordedAnchorOccurrenceForAnchor___block_invoke_2;
  v8[3] = &unk_1E82DCBD8;
  v9 = *(id *)(a1 + 40);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __89__ATXAnchorModelDataStoreWrapper_timestampOfMostRecentRecordedAnchorOccurrenceForAnchor___block_invoke_3;
  v7[3] = &unk_1E82DCC00;
  v4 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 48);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __89__ATXAnchorModelDataStoreWrapper_timestampOfMostRecentRecordedAnchorOccurrenceForAnchor___block_invoke_4;
  v5[3] = &unk_1E82DCC28;
  v6 = v4;
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT MAX(anchorDate) FROM anchorOccurrence where anchorType=?"), v8, v7, v5);

}

void __89__ATXAnchorModelDataStoreWrapper_timestampOfMostRecentRecordedAnchorOccurrenceForAnchor___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "anchorTypeString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindParam:toNSString:", 1, v4);

}

uint64_t __89__ATXAnchorModelDataStoreWrapper_timestampOfMostRecentRecordedAnchorOccurrenceForAnchor___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "getIntegerForColumn:", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;

  return *MEMORY[0x1E0D81788];
}

uint64_t __89__ATXAnchorModelDataStoreWrapper_timestampOfMostRecentRecordedAnchorOccurrenceForAnchor___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __89__ATXAnchorModelDataStoreWrapper_timestampOfMostRecentRecordedAnchorOccurrenceForAnchor___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (void)updateOrInsertActionTrainingSample:(id)a3 featurizedAction:(id)a4 actionOccurred:(BOOL)a5 actionEngaged:(BOOL)a6 anchorEvent:(id)a7 anchor:(id)a8
{
  _BOOL8 v10;
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;

  v10 = a6;
  v11 = a5;
  v14 = a3;
  v15 = a4;
  v16 = a8;
  v17 = a7;
  objc_msgSend(v14, "alogId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    __atxlog_handle_anchor();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[ATXAnchorModelDataStoreWrapper updateOrInsertActionTrainingSample:featurizedAction:actionOccurred:actionEngaged:anchorEvent:anchor:].cold.1();

  }
  +[ATXAnchorModelDataStoreWrapper actionCandidateFeaturesFromActionEvent:actionMetadata:actionOccurred:actionEngaged:](ATXAnchorModelDataStoreWrapper, "actionCandidateFeaturesFromActionEvent:actionMetadata:actionOccurred:actionEngaged:", v14, v15, v11, v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelDataStoreWrapper updateOrInsertCandidateEventToDatabaseWithCandidateFeatures:anchor:anchorEvent:](self, "updateOrInsertCandidateEventToDatabaseWithCandidateFeatures:anchor:anchorEvent:", v20, v16, v17);

}

- (void)updateOrInsertAppTrainingSample:(id)a3 featurizedApp:(id)a4 appWasLaunched:(BOOL)a5 appEngaged:(BOOL)a6 anchorEvent:(id)a7 anchor:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;

  v9 = a6;
  v10 = a5;
  v14 = a8;
  v15 = a7;
  +[ATXAnchorModelDataStoreWrapper appCandidateFeaturesFromAppLaunchEvent:appMetadata:appWasLaunched:appEngaged:](ATXAnchorModelDataStoreWrapper, "appCandidateFeaturesFromAppLaunchEvent:appMetadata:appWasLaunched:appEngaged:", a3, a4, v10, v9);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelDataStoreWrapper updateOrInsertCandidateEventToDatabaseWithCandidateFeatures:anchor:anchorEvent:](self, "updateOrInsertCandidateEventToDatabaseWithCandidateFeatures:anchor:anchorEvent:", v16, v14, v15);

}

- (void)updateOrInsertModeTrainingSample:(id)a3 featurizedMode:(id)a4 modeOccurred:(BOOL)a5 modeEngaged:(BOOL)a6 anchorEvent:(id)a7 anchor:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;

  v9 = a6;
  v10 = a5;
  v14 = a8;
  v15 = a7;
  +[ATXAnchorModelDataStoreWrapper modeCandidateFeaturesFromModeEvent:modeMetadata:modeOccurred:modeEngaged:](ATXAnchorModelDataStoreWrapper, "modeCandidateFeaturesFromModeEvent:modeMetadata:modeOccurred:modeEngaged:", a3, a4, v10, v9);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelDataStoreWrapper updateOrInsertCandidateEventToDatabaseWithCandidateFeatures:anchor:anchorEvent:](self, "updateOrInsertCandidateEventToDatabaseWithCandidateFeatures:anchor:anchorEvent:", v16, v14, v15);

}

- (void)updateOrInsertLinkActionTrainingSample:(id)a3 featurizedAction:(id)a4 actionOccurred:(BOOL)a5 actionEngaged:(BOOL)a6 anchorEvent:(id)a7 anchor:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  void *v15;
  id v16;

  v9 = a6;
  v10 = a5;
  v16 = a7;
  v14 = a8;
  +[ATXAnchorModelDataStoreWrapper linkActionCandidateFeaturesFromLinkActionEvent:actionMetadata:actionOccurred:actionEngaged:](ATXAnchorModelDataStoreWrapper, "linkActionCandidateFeaturesFromLinkActionEvent:actionMetadata:actionOccurred:actionEngaged:", a3, a4, v10, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    -[ATXAnchorModelDataStoreWrapper updateOrInsertCandidateEventToDatabaseWithCandidateFeatures:anchor:anchorEvent:](self, "updateOrInsertCandidateEventToDatabaseWithCandidateFeatures:anchor:anchorEvent:", v15, v14, v16);

}

- (void)updateOrInsertCandidateEventToDatabaseWithCandidateFeatures:(id)a3 anchor:(id)a4 anchorEvent:(id)a5
{
  id v8;
  id v9;
  id v10;
  _ATXDataStore *store;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  ATXAnchorModelDataStoreWrapper *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  store = self->_store;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke;
  v15[3] = &unk_1E82DBAB0;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[_ATXDataStore _doAsync:](store, "_doAsync:", v15);

}

void __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  __atxlog_handle_anchor();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke_cold_2();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke_30;
  v13[3] = &unk_1E82DF220;
  v14 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  v5 = *(void **)(a1 + 32);
  v4 = a1 + 32;
  v16 = v5;
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO anchorModelTrainingData (anchorType, anchorDate, candidateType, candidateId, candidateOccurrencesInLast12Hours, candidateOccurrencesInLast24Hours, candidateOccurrencesInLast48Hours, candidateOccurrencesInLast7Days, candidateOccurrencesInLast14Days, candidateOccurrencesInLast28Days, candidatePerformed, candidateEngaged, secondsSinceAnchor, candidateLocation, candidateOccurrenceId) VALUES (:anchorType, :anchorDate, :candidateType, :candidateId, :candidateOccurrencesInLast12Hours, :candidateOccurrencesInLast24Hours, :candidateOccurrencesInLast48Hours, :candidateOccurrencesInLast7Days, :candidateOccurrencesInLast14Days, :candidateOccurrencesInLast28Days, :candidatePerformed, :candidateEngaged, :secondsSinceAnchor, :candidateLocation, :candidateOccurrenceId)"), v13, 0, &__block_literal_global_200);

  __atxlog_handle_anchor();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke_cold_1(v4, v6, v7, v8, v9, v10, v11, v12);

}

void __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke_30(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  void *v5;
  void *v6;
  double v7;
  id *v8;
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
  NSObject *v24;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "anchorTypeString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toNSString:", ":anchorType", v5);

  objc_msgSend((id)objc_opt_class(), "anchorOccurenceDateFromDuetEvent:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":anchorDate", (uint64_t)v7);
  v9 = *(void **)(a1 + 48);
  v8 = (id *)(a1 + 48);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("candidateType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toNSString:", ":candidateType", v10);

  objc_msgSend(*v8, "objectForKeyedSubscript:", CFSTR("candidateId"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toNSString:", ":candidateId", v11);

  objc_msgSend(*v8, "objectForKey:", CFSTR("candidateOccurrenceId"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v3, "bindNamedParam:toInt64:", ":candidateOccurrenceId", objc_msgSend(v12, "longLongValue"));
    objc_msgSend(*v8, "objectForKeyedSubscript:", CFSTR("candidateOccurrencesInLast12Hours"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bindNamedParam:toInteger:", ":candidateOccurrencesInLast12Hours", objc_msgSend(v14, "integerValue"));

    objc_msgSend(*v8, "objectForKeyedSubscript:", CFSTR("candidateOccurrencesInLast24Hours"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bindNamedParam:toInteger:", ":candidateOccurrencesInLast24Hours", objc_msgSend(v15, "integerValue"));

    objc_msgSend(*v8, "objectForKeyedSubscript:", CFSTR("candidateOccurrencesInLast48Hours"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bindNamedParam:toInteger:", ":candidateOccurrencesInLast48Hours", objc_msgSend(v16, "integerValue"));

    objc_msgSend(*v8, "objectForKeyedSubscript:", CFSTR("candidateOccurrencesInLast7Days"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bindNamedParam:toInteger:", ":candidateOccurrencesInLast7Days", objc_msgSend(v17, "integerValue"));

    objc_msgSend(*v8, "objectForKeyedSubscript:", CFSTR("candidateOccurrencesInLast14Days"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bindNamedParam:toInteger:", ":candidateOccurrencesInLast14Days", objc_msgSend(v18, "integerValue"));

    objc_msgSend(*v8, "objectForKeyedSubscript:", CFSTR("candidateOccurrencesInLast28Days"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bindNamedParam:toInteger:", ":candidateOccurrencesInLast28Days", objc_msgSend(v19, "integerValue"));

    objc_msgSend(*v8, "objectForKeyedSubscript:", CFSTR("candidatePerformed"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bindNamedParam:toInteger:", ":candidatePerformed", objc_msgSend(v20, "integerValue"));

    objc_msgSend(*v8, "objectForKeyedSubscript:", CFSTR("candidateEngaged"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bindNamedParam:toInteger:", ":candidateEngaged", objc_msgSend(v21, "integerValue"));

    objc_msgSend(*v8, "objectForKeyedSubscript:", CFSTR("secondsSinceAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bindNamedParam:toInteger:", ":secondsSinceAnchor", objc_msgSend(v22, "integerValue"));

    objc_msgSend(*v8, "objectForKey:", CFSTR("candidateLocation"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      objc_msgSend(v3, "bindNamedParam:toNSString:", ":candidateLocation", v23);
    else
      objc_msgSend(v3, "bindNamedParamToNull:", ":candidateLocation");

  }
  else
  {
    __atxlog_handle_anchor();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke_30_cold_1(v8, v4, v24);

  }
}

uint64_t __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke_72(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke_72_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (void)updateOrInsertAnchorModelTrainingResults:(id)a3 anchor:(id)a4
{
  id v6;
  id v7;
  _ATXDataStore *store;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  store = self->_store;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorModelTrainingResults_anchor___block_invoke;
  v11[3] = &unk_1E82DB9D8;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  -[_ATXDataStore _doAsync:](store, "_doAsync:", v11);

}

void __82__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorModelTrainingResults_anchor___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __82__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorModelTrainingResults_anchor___block_invoke_2;
  v4[3] = &unk_1E82DB9D8;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "writeTransaction:", v4);

}

void __82__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorModelTrainingResults_anchor___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id obj;
  _QWORD v12[5];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __82__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorModelTrainingResults_anchor___block_invoke_3;
  v18[3] = &unk_1E82DCBD8;
  v19 = *(id *)(a1 + 40);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM anchorModelTrainingResults WHERE anchorType LIKE :anchorType"), v18, 0, &__block_literal_global_75_0);

  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = *(id *)(a1 + 48);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __82__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorModelTrainingResults_anchor___block_invoke_78;
        v12[3] = &unk_1E82DCB88;
        v12[4] = v8;
        v13 = v3;
        objc_msgSend(v10, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO anchorModelTrainingResults (trainingDate, anchorType, anchorEventIdentifier, candidateType, candidateId, numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence, posteriorProbability, classConditionalProbability, classifierType, trainedClassifier, classifierDescription, startSecondsAfterAnchor, endSecondsAfterAnchor, standardDeviationOfOffsetFromAnchor, launchesInLast28Days, launchesInLast14Days, launchesInLast7Days, launchesInLast48Hours, launchesInLast24Hours, launchesInLast12Hours, launchesInLast2Hours, anchorPopularity, globalPopularity) VALUES (:trainingDate, :anchorType, :anchorEventIdentifier, :candidateType, :candidateId, :numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence, :posteriorProbability, :classConditionalProbability, :classifierType, :trainedClassifier, :classifierDescription, :startSecondsAfterAnchor, :endSecondsAfterAnchor, :standardDeviationOfOffsetFromAnchor, :launchesInLast28Days, :launchesInLast14Days, :launchesInLast7Days, :launchesInLast48Hours, :launchesInLast24Hours, :launchesInLast12Hours, :launchesInLast2Hours, :anchorPopularity, :globalPopularity)"), v12, 0, &__block_literal_global_102);

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v5);
  }

}

void __82__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorModelTrainingResults_anchor___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "anchorTypeString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toNSString:", ":anchorType", v4);

}

uint64_t __82__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorModelTrainingResults_anchor___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke_72_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

void __82__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorModelTrainingResults_anchor___block_invoke_78(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
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
  void *v29;
  void *v30;

  v3 = a2;
  v4 = (void *)MEMORY[0x1CAA48B6C]();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  +[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier configureKeyedArchiver:](ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier, "configureKeyedArchiver:", v5);
  v6 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "candidateClassifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, *MEMORY[0x1E0CB2CD0]);

  objc_msgSend(v5, "finishEncoding");
  objc_msgSend(v5, "encodedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  if (v8)
  {
    objc_msgSend(v3, "bindNamedParam:toNSData:", ":trainedClassifier", v8);
    objc_msgSend(*(id *)(a1 + 40), "timeIntervalSince1970");
    objc_msgSend(v3, "bindNamedParam:toInt64:", ":trainingDate", (uint64_t)v10);
    objc_msgSend(*(id *)(a1 + 32), "anchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "anchorTypeString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bindNamedParam:toNSString:", ":anchorType", v12);

    objc_msgSend(*(id *)(a1 + 32), "anchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "anchorEventIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(*v6, "anchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "anchorEventIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bindNamedParam:toNSString:", ":anchorEventIdentifier", v16);

    }
    else
    {
      objc_msgSend(v3, "bindNamedParamToNull:", ":anchorEventIdentifier");
    }
    objc_msgSend(*v6, "candidateType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bindNamedParam:toNSString:", ":candidateType", v18);

    objc_msgSend(*v6, "candidateId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bindNamedParam:toNSString:", ":candidateId", v19);

    objc_msgSend(*v6, "phase1TrainingResult");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bindNamedParam:toInteger:", ":numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence", objc_msgSend(v20, "numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence"));

    objc_msgSend(*v6, "phase1TrainingResult");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "posteriorProbability");
    objc_msgSend(v3, "bindNamedParam:toDouble:", ":posteriorProbability");

    objc_msgSend(*v6, "phase1TrainingResult");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "classConditionalProbability");
    objc_msgSend(v3, "bindNamedParam:toDouble:", ":classConditionalProbability");

    objc_msgSend(v3, "bindNamedParam:toInteger:", ":classifierType", objc_msgSend(*v6, "candidateClassifierType"));
    objc_msgSend(*v6, "candidateClassifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "description");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bindNamedParam:toNSString:", ":classifierDescription", v24);

    objc_msgSend(*v6, "offsetFromAnchorToShowPrediction");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "startSecondsAfterAnchor");
    objc_msgSend(v3, "bindNamedParam:toDouble:", ":startSecondsAfterAnchor");

    objc_msgSend(*v6, "offsetFromAnchorToShowPrediction");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "endSecondsAfterAnchor");
    objc_msgSend(v3, "bindNamedParam:toDouble:", ":endSecondsAfterAnchor");

    objc_msgSend(*v6, "phase1TrainingResult");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "standardDeviationOfOffsetFromAnchor");
    objc_msgSend(v3, "bindNamedParam:toDouble:", ":standardDeviationOfOffsetFromAnchor");

    objc_msgSend(*v6, "phase1TrainingResult");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "launchHistory");
    v17 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject hasLaunchesInLast28Days](v17, "hasLaunchesInLast28Days"))
      objc_msgSend(v3, "bindNamedParam:toInteger:", ":launchesInLast28Days", -[NSObject launchesInLast28Days](v17, "launchesInLast28Days"));
    else
      objc_msgSend(v3, "bindNamedParamToNull:", ":launchesInLast28Days");
    if (-[NSObject hasLaunchesInLast14Days](v17, "hasLaunchesInLast14Days"))
      objc_msgSend(v3, "bindNamedParam:toInteger:", ":launchesInLast14Days", -[NSObject launchesInLast14Days](v17, "launchesInLast14Days"));
    else
      objc_msgSend(v3, "bindNamedParamToNull:", ":launchesInLast14Days");
    if (-[NSObject hasLaunchesInLast7Days](v17, "hasLaunchesInLast7Days"))
      objc_msgSend(v3, "bindNamedParam:toInteger:", ":launchesInLast7Days", -[NSObject launchesInLast7Days](v17, "launchesInLast7Days"));
    else
      objc_msgSend(v3, "bindNamedParamToNull:", ":launchesInLast7Days");
    if (-[NSObject hasLaunchesInLast48Hours](v17, "hasLaunchesInLast48Hours"))
      objc_msgSend(v3, "bindNamedParam:toInteger:", ":launchesInLast48Hours", -[NSObject launchesInLast48Hours](v17, "launchesInLast48Hours"));
    else
      objc_msgSend(v3, "bindNamedParamToNull:", ":launchesInLast48Hours");
    if (-[NSObject hasLaunchesInLast24Hours](v17, "hasLaunchesInLast24Hours"))
      objc_msgSend(v3, "bindNamedParam:toInteger:", ":launchesInLast24Hours", -[NSObject launchesInLast24Hours](v17, "launchesInLast24Hours"));
    else
      objc_msgSend(v3, "bindNamedParamToNull:", ":launchesInLast12Hours");
    if (-[NSObject hasLaunchesInLast12Hours](v17, "hasLaunchesInLast12Hours"))
      objc_msgSend(v3, "bindNamedParam:toInteger:", ":launchesInLast12Hours", -[NSObject launchesInLast12Hours](v17, "launchesInLast12Hours"));
    else
      objc_msgSend(v3, "bindNamedParamToNull:", ":launchesInLast24Hours");
    if (-[NSObject hasLaunchesInLast2Hours](v17, "hasLaunchesInLast2Hours"))
      objc_msgSend(v3, "bindNamedParam:toInteger:", ":launchesInLast2Hours", -[NSObject launchesInLast2Hours](v17, "launchesInLast2Hours"));
    else
      objc_msgSend(v3, "bindNamedParamToNull:", ":launchesInLast2Hours");
    objc_msgSend(*v6, "phase1TrainingResult");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "anchorPopularity");
    objc_msgSend(v3, "bindNamedParam:toDouble:", ":anchorPopularity");

    objc_msgSend(*v6, "phase1TrainingResult");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "globalPopularity");
    objc_msgSend(v3, "bindNamedParam:toDouble:", ":globalPopularity");

  }
  else
  {
    __atxlog_handle_anchor();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      __82__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorModelTrainingResults_anchor___block_invoke_78_cold_1(v6, (uint64_t)v9, v17);
  }

}

uint64_t __82__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorModelTrainingResults_anchor___block_invoke_101(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke_72_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (void)insertAnchorSuggestionOutcome:(unint64_t)a3 date:(id)a4 anchorType:(id)a5 anchorEventIdentifier:(id)a6 candidateId:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _ATXDataStore *store;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  unint64_t v24;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = v15;
  if (!v13)
  {
    __atxlog_handle_anchor();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[ATXAnchorModelDataStoreWrapper insertAnchorSuggestionOutcome:date:anchorType:anchorEventIdentifier:candidateId:].cold.1();
    goto LABEL_8;
  }
  if (!v15)
  {
    __atxlog_handle_anchor();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[ATXAnchorModelDataStoreWrapper insertAnchorSuggestionOutcome:date:anchorType:anchorEventIdentifier:candidateId:].cold.2();
LABEL_8:

    goto LABEL_9;
  }
  store = self->_store;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __114__ATXAnchorModelDataStoreWrapper_insertAnchorSuggestionOutcome_date_anchorType_anchorEventIdentifier_candidateId___block_invoke;
  v19[3] = &unk_1E82E8830;
  v19[4] = self;
  v20 = v13;
  v21 = v12;
  v22 = v14;
  v23 = v16;
  v24 = a3;
  -[_ATXDataStore _doAsync:](store, "_doAsync:", v19);

LABEL_9:
}

void __114__ATXAnchorModelDataStoreWrapper_insertAnchorSuggestionOutcome_date_anchorType_anchorEventIdentifier_candidateId___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __114__ATXAnchorModelDataStoreWrapper_insertAnchorSuggestionOutcome_date_anchorType_anchorEventIdentifier_candidateId___block_invoke_2;
  v5[3] = &unk_1E82E2EF8;
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v3 = *(id *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 72);
  v9 = v3;
  v10 = v4;
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO anchorModelSuggestionOutcomes (anchorType, date, anchorEventIdentifier, candidateId, outcome) VALUES (:anchorType, :date, :anchorEventIdentifier, :candidateId, :outcome)"), v5, 0, &__block_literal_global_107_1);

}

void __114__ATXAnchorModelDataStoreWrapper_insertAnchorSuggestionOutcome_date_anchorType_anchorEventIdentifier_candidateId___block_invoke_2(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":anchorType", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":date", (uint64_t)v3);
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(v4, "bindNamedParam:toNSString:", ":anchorEventIdentifier");
  else
    objc_msgSend(v4, "bindNamedParamToNull:", ":anchorEventIdentifier");
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":candidateId", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":outcome", *(_QWORD *)(a1 + 64));

}

uint64_t __114__ATXAnchorModelDataStoreWrapper_insertAnchorSuggestionOutcome_date_anchorType_anchorEventIdentifier_candidateId___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __114__ATXAnchorModelDataStoreWrapper_insertAnchorSuggestionOutcome_date_anchorType_anchorEventIdentifier_candidateId___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (void)assignMetricsForTrainingResult:(id)a3 anchorType:(id)a4 anchorEventIdentifier:(id)a5 candidateId:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD *v15;
  _ATXDataStore *store;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  _QWORD *v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (!v11)
  {
    __atxlog_handle_anchor();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[ATXAnchorModelDataStoreWrapper assignMetricsForTrainingResult:anchorType:anchorEventIdentifier:candidateId:].cold.1();
    goto LABEL_8;
  }
  if (!v13)
  {
    __atxlog_handle_anchor();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[ATXAnchorModelDataStoreWrapper insertAnchorSuggestionOutcome:date:anchorType:anchorEventIdentifier:candidateId:].cold.2();
LABEL_8:

    goto LABEL_9;
  }
  v15 = malloc_type_calloc(8uLL, 4uLL, 0x30F39D97uLL);
  store = self->_store;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __110__ATXAnchorModelDataStoreWrapper_assignMetricsForTrainingResult_anchorType_anchorEventIdentifier_candidateId___block_invoke;
  v18[3] = &unk_1E82DEA20;
  v18[4] = self;
  v19 = v11;
  v20 = v12;
  v21 = v14;
  v22 = v15;
  -[_ATXDataStore _doSync:](store, "_doSync:", v18);
  objc_msgSend(v10, "setNumShownSuggestions:", v15[1]);
  objc_msgSend(v10, "setNumEngagedSuggestions:", v15[2]);
  objc_msgSend(v10, "setNumRejectedSuggestion:", v15[3]);
  free(v15);

LABEL_9:
}

void __110__ATXAnchorModelDataStoreWrapper_assignMetricsForTrainingResult_anchorType_anchorEventIdentifier_candidateId___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __110__ATXAnchorModelDataStoreWrapper_assignMetricsForTrainingResult_anchorType_anchorEventIdentifier_candidateId___block_invoke_2;
  v5[3] = &unk_1E82DF220;
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __110__ATXAnchorModelDataStoreWrapper_assignMetricsForTrainingResult_anchorType_anchorEventIdentifier_candidateId___block_invoke_3;
  v4[3] = &__block_descriptor_40_e49___PASDBIterAction__B_16__0___PASSqliteStatement_8l;
  v4[4] = *(_QWORD *)(a1 + 64);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT outcome, COUNT(*) FROM anchorModelSuggestionOutcomes WHERE anchorType = :anchorType AND anchorEventIdentifier = :anchorEventIdentifier AND candidateId = :candidateId GROUP BY outcome"), v5, v4, &__block_literal_global_112);

}

void __110__ATXAnchorModelDataStoreWrapper_assignMetricsForTrainingResult_anchorType_anchorEventIdentifier_candidateId___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":anchorType", v3);
  if (a1[5])
    objc_msgSend(v4, "bindNamedParam:toNSString:", ":anchorEventIdentifier");
  else
    objc_msgSend(v4, "bindNamedParamToNull:", ":anchorEventIdentifier");
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":candidateId", a1[6]);

}

uint64_t __110__ATXAnchorModelDataStoreWrapper_assignMetricsForTrainingResult_anchorType_anchorEventIdentifier_candidateId___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  NSObject *v7;
  unsigned __int8 *v8;

  v3 = a2;
  v4 = objc_msgSend(v3, "getIntegerForColumn:", 1);
  if (v4 < 0)
  {
    __atxlog_handle_anchor();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      __110__ATXAnchorModelDataStoreWrapper_assignMetricsForTrainingResult_anchorType_anchorEventIdentifier_candidateId___block_invoke_3_cold_1();
  }
  else
  {
    v5 = v4;
    v6 = objc_msgSend(v3, "getIntegerForColumnName:table:", "outcome", 0);
    if (v6 < 4)
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * v6) += v5;
      goto LABEL_9;
    }
    __atxlog_handle_anchor();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      __110__ATXAnchorModelDataStoreWrapper_assignMetricsForTrainingResult_anchorType_anchorEventIdentifier_candidateId___block_invoke_3_cold_2();
  }

LABEL_9:
  v8 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v8;
}

uint64_t __110__ATXAnchorModelDataStoreWrapper_assignMetricsForTrainingResult_anchorType_anchorEventIdentifier_candidateId___block_invoke_111(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __110__ATXAnchorModelDataStoreWrapper_assignMetricsForTrainingResult_anchorType_anchorEventIdentifier_candidateId___block_invoke_111_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)trainingResultsForAnchor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _ATXDataStore *store;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  __CFString *v31;
  id v32;
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "anchorEventIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = CFSTR("SELECT trainingDate, anchorType, candidateType, candidateId, numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence, posteriorProbability, classConditionalProbability, classifierType, trainedClassifier, startSecondsAfterAnchor, endSecondsAfterAnchor, standardDeviationOfOffsetFromAnchor, launchesInLast28Days, launchesInLast14Days, launchesInLast7Days, launchesInLast48Hours, launchesInLast24Hours, launchesInLast12Hours, launchesInLast2Hours FROM anchorModelTrainingResults WHERE anchorType=:anchorType AND anchorEventIdentifier=:anchorEventIdentifier");
  if (!v6)
    v7 = CFSTR("SELECT trainingDate, anchorType, candidateType, candidateId, numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence, posteriorProbability, classConditionalProbability, classifierType, trainedClassifier, startSecondsAfterAnchor, endSecondsAfterAnchor, standardDeviationOfOffsetFromAnchor, launchesInLast28Days, launchesInLast14Days, launchesInLast7Days, launchesInLast48Hours, launchesInLast24Hours, launchesInLast12Hours, launchesInLast2Hours FROM anchorModelTrainingResults WHERE anchorType=:anchorType AND anchorEventIdentifier IS NULL");
  store = self->_store;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __59__ATXAnchorModelDataStoreWrapper_trainingResultsForAnchor___block_invoke;
  v30[3] = &unk_1E82DBAB0;
  v30[4] = self;
  v31 = (__CFString *)v7;
  v9 = v4;
  v32 = v9;
  v10 = v5;
  v33 = v10;
  -[_ATXDataStore _doSync:](store, "_doSync:", v30);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v16, "phase1TrainingResult", (_QWORD)v26);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "anchorTypeString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "anchorEventIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "candidateId");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXAnchorModelDataStoreWrapper assignMetricsForTrainingResult:anchorType:anchorEventIdentifier:candidateId:](self, "assignMetricsForTrainingResult:anchorType:anchorEventIdentifier:candidateId:", v17, v18, v19, v20);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v13);
  }

  __atxlog_handle_anchor();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = objc_msgSend(v11, "count");
    *(_DWORD *)buf = 134218242;
    v35 = v22;
    v36 = 2112;
    v37 = v9;
    _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_DEFAULT, "Recovered %lu training results for anchor %@", buf, 0x16u);
  }

  v23 = v33;
  v24 = v11;

  return v24;
}

void __59__ATXAnchorModelDataStoreWrapper_trainingResultsForAnchor___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__ATXAnchorModelDataStoreWrapper_trainingResultsForAnchor___block_invoke_2;
  v10[3] = &unk_1E82DCBD8;
  v4 = *(_QWORD *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __59__ATXAnchorModelDataStoreWrapper_trainingResultsForAnchor___block_invoke_3;
  v7[3] = &unk_1E82DF040;
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 48);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __59__ATXAnchorModelDataStoreWrapper_trainingResultsForAnchor___block_invoke_146;
  v5[3] = &unk_1E82DCC28;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", v4, v10, v7, v5);

}

void __59__ATXAnchorModelDataStoreWrapper_trainingResultsForAnchor___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "anchorTypeString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindNamedParam:toNSString:", ":anchorType", v3);

  objc_msgSend(*(id *)(a1 + 32), "anchorEventIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "anchorEventIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bindNamedParam:toNSString:", ":anchorEventIdentifier", v5);

  }
  else
  {
    objc_msgSend(v6, "bindNamedParamToNull:", ":anchorEventIdentifier");
  }

}

uint64_t __59__ATXAnchorModelDataStoreWrapper_trainingResultsForAnchor___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  ATXAnchorModelPredictionOffsetFromAnchorOccurrence *v20;
  void *v21;
  ATXAnchorModelTrainingResult *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v37;
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v2, "getInt64ForColumnName:table:", "trainingDate", "anchorModelTrainingResults"));
  v34 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getNSStringForColumnName:table:", "anchorType", "anchorModelTrainingResults");
  v33 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getNSStringForColumnName:table:", "candidateType", "anchorModelTrainingResults");
  v32 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getNSStringForColumnName:table:", "candidateId", "anchorModelTrainingResults");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v37 = (void *)v3;
  objc_msgSend(v4, "setCandidateId:", v3);
  objc_msgSend(v4, "setNumUniqueAnchorOccurrencesWithUniqueCandidateOccurrence:", objc_msgSend(v2, "getIntegerForColumnName:table:", "numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence", "anchorModelTrainingResults"));
  objc_msgSend(v2, "getDoubleForColumnName:table:", "posteriorProbability", "anchorModelTrainingResults");
  objc_msgSend(v4, "setPosteriorProbability:");
  objc_msgSend(v2, "getDoubleForColumnName:table:", "classConditionalProbability", "anchorModelTrainingResults");
  objc_msgSend(v4, "setClassConditionalProbability:");
  objc_msgSend(v2, "getDoubleForColumnName:table:", "standardDeviationOfOffsetFromAnchor", "anchorModelTrainingResults");
  objc_msgSend(v4, "setStandardDeviationOfOffsetFromAnchor:");
  if ((objc_msgSend(v2, "isNullForColumnName:table:", "launchesInLast28Days", "anchorModelTrainingResults") & 1) == 0)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setLaunchesInLast28Days:", objc_msgSend(v2, "getIntegerForColumnName:table:", "launchesInLast28Days", "anchorModelTrainingResults"));
    objc_msgSend(v5, "setLaunchesInLast14Days:", objc_msgSend(v2, "getIntegerForColumnName:table:", "launchesInLast14Days", "anchorModelTrainingResults"));
    objc_msgSend(v5, "setLaunchesInLast7Days:", objc_msgSend(v2, "getIntegerForColumnName:table:", "launchesInLast7Days", "anchorModelTrainingResults"));
    objc_msgSend(v5, "setLaunchesInLast48Hours:", objc_msgSend(v2, "getIntegerForColumnName:table:", "launchesInLast48Hours", "anchorModelTrainingResults"));
    objc_msgSend(v5, "setLaunchesInLast24Hours:", objc_msgSend(v2, "getIntegerForColumnName:table:", "launchesInLast24Hours", "anchorModelTrainingResults"));
    objc_msgSend(v5, "setLaunchesInLast12Hours:", objc_msgSend(v2, "getIntegerForColumnName:table:", "launchesInLast12Hours", "anchorModelTrainingResults"));
    objc_msgSend(v5, "setLaunchesInLast2Hours:", objc_msgSend(v2, "getIntegerForColumnName:table:", "launchesInLast2Hours", "anchorModelTrainingResults"));
    objc_msgSend(v4, "setLaunchHistory:", v5);

  }
  v31 = objc_msgSend(v2, "getIntegerForColumnName:table:", "classifierType", "anchorModelTrainingResults");
  objc_msgSend(v2, "getNSDataForColumnName:table:", "trainedClassifier", "anchorModelTrainingResults");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1CAA48B6C]();
  v38 = 0;
  v35 = (void *)v6;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v6, &v38);
  v9 = v38;
  objc_msgSend(v8, "setRequiresSecureCoding:", 1);
  objc_msgSend(v8, "setDecodingFailurePolicy:", 1);
  v10 = (void *)MEMORY[0x1CAA48B6C](+[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier configureKeyedUnarchiver:](ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier, "configureKeyedUnarchiver:", v8));
  v11 = objc_alloc(MEMORY[0x1E0C99E60]);
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = (void *)objc_msgSend(v11, "initWithObjects:", v12, v13, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v10);
  objc_msgSend(v8, "decodeObjectOfClasses:forKey:", v14, *MEMORY[0x1E0CB2CD0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "finishDecoding");
  objc_msgSend(v8, "error");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v7);
  if (!v15 || v9 || v16)
  {
    __atxlog_handle_anchor();
    v28 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v33;
    v24 = (void *)v34;
    v21 = (void *)v32;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      if (v9)
        v30 = (uint64_t)v9;
      else
        v30 = (uint64_t)v16;
      *(_DWORD *)buf = 138544130;
      v40 = v30;
      v41 = 2112;
      v42 = v33;
      v43 = 2112;
      v44 = v34;
      v45 = 2112;
      v46 = v37;
      _os_log_fault_impl(&dword_1C9A3B000, v28, OS_LOG_TYPE_FAULT, "Failed to unarchive trained classifier from anchorModelTrainingResults with error: %{public}@. Anchor: %@, trainingDate: %@, candidateId: %@", buf, 0x2Au);
    }

    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
    v26 = *MEMORY[0x1E0D81788];
  }
  else
  {
    objc_msgSend(v2, "getDoubleForColumnName:table:", "startSecondsAfterAnchor", "anchorModelTrainingResults");
    v18 = v17;
    objc_msgSend(v2, "getDoubleForColumnName:table:", "endSecondsAfterAnchor", "anchorModelTrainingResults");
    v20 = -[ATXAnchorModelPredictionOffsetFromAnchorOccurrence initWithStartSecondsAfterAnchor:endSecondsAfterAnchor:]([ATXAnchorModelPredictionOffsetFromAnchorOccurrence alloc], "initWithStartSecondsAfterAnchor:endSecondsAfterAnchor:", v18, v19);
    v21 = (void *)v32;
    v22 = -[ATXAnchorModelTrainingResult initWithAnchor:candidateId:candidateType:phase1TrainingResult:candidateClassifier:candidateClassifierType:offsetFromAnchorToShowPrediction:]([ATXAnchorModelTrainingResult alloc], "initWithAnchor:candidateId:candidateType:phase1TrainingResult:candidateClassifier:candidateClassifierType:offsetFromAnchorToShowPrediction:", *(_QWORD *)(a1 + 40), v37, v32, v4, v15, v31, v20);
    __atxlog_handle_anchor();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v34;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v34;
      _os_log_impl(&dword_1C9A3B000, v23, OS_LOG_TYPE_DEFAULT, "Recovered training result that was added on %@", buf, 0xCu);
    }

    __atxlog_handle_anchor();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v40 = (uint64_t)v22;
      _os_log_impl(&dword_1C9A3B000, v25, OS_LOG_TYPE_DEFAULT, "Training result: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v22);
    v26 = *MEMORY[0x1E0D81780];

    v27 = (void *)v33;
  }

  return v26;
}

uint64_t __59__ATXAnchorModelDataStoreWrapper_trainingResultsForAnchor___block_invoke_146(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __59__ATXAnchorModelDataStoreWrapper_trainingResultsForAnchor___block_invoke_146_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)dateAnchorModelWasLastTrainedForAnchor:(id)a3
{
  id v4;
  void *v5;
  _ATXDataStore *store;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  ATXAnchorModelDataStoreWrapper *v17;
  __CFString *v18;
  id v19;
  id v20;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  store = self->_store;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __73__ATXAnchorModelDataStoreWrapper_dateAnchorModelWasLastTrainedForAnchor___block_invoke;
  v16 = &unk_1E82DBAB0;
  v17 = self;
  v18 = CFSTR("SELECT trainingDate FROM anchorModelTrainingResults WHERE anchorType=:anchorType");
  v7 = v4;
  v19 = v7;
  v8 = v5;
  v20 = v8;
  -[_ATXDataStore _doSync:](store, "_doSync:", &v13);
  if ((unint64_t)objc_msgSend(v8, "count", v13, v14, v15, v16, v17) >= 2)
  {
    __atxlog_handle_anchor();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[ATXAnchorModelDataStoreWrapper dateAnchorModelWasLastTrainedForAnchor:].cold.1();

    goto LABEL_7;
  }
  if (!objc_msgSend(v8, "count"))
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(v8, "anyObject");
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v11 = (void *)v10;

  return v11;
}

void __73__ATXAnchorModelDataStoreWrapper_dateAnchorModelWasLastTrainedForAnchor___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__ATXAnchorModelDataStoreWrapper_dateAnchorModelWasLastTrainedForAnchor___block_invoke_2;
  v9[3] = &unk_1E82DCBD8;
  v4 = *(_QWORD *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __73__ATXAnchorModelDataStoreWrapper_dateAnchorModelWasLastTrainedForAnchor___block_invoke_3;
  v7[3] = &unk_1E82DEC70;
  v8 = *(id *)(a1 + 56);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __73__ATXAnchorModelDataStoreWrapper_dateAnchorModelWasLastTrainedForAnchor___block_invoke_4;
  v5[3] = &unk_1E82DCC28;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", v4, v9, v7, v5);

}

void __73__ATXAnchorModelDataStoreWrapper_dateAnchorModelWasLastTrainedForAnchor___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "anchorTypeString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toNSString:", ":anchorType", v4);

}

uint64_t __73__ATXAnchorModelDataStoreWrapper_dateAnchorModelWasLastTrainedForAnchor___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(a2, "getInt64ForColumnName:table:", "trainingDate", "anchorModelTrainingResults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v4;
}

uint64_t __73__ATXAnchorModelDataStoreWrapper_dateAnchorModelWasLastTrainedForAnchor___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __59__ATXAnchorModelDataStoreWrapper_trainingResultsForAnchor___block_invoke_146_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

+ (id)actionCandidateFeaturesFromActionEvent:(id)a3 actionMetadata:(id)a4 actionOccurred:(BOOL)a5 actionEngaged:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
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

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (void *)objc_opt_new();
  +[ATXAnchorModelDataStoreWrapper candidateIdFromAppIntentDuetEvent:](ATXAnchorModelDataStoreWrapper, "candidateIdFromAppIntentDuetEvent:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("candidateId"));

  objc_msgSend(v10, "alogId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v10, "alogId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("candidateOccurrenceId"));

  }
  else
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E83CDD38, CFSTR("candidateOccurrenceId"));
  }
  objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("action"), CFSTR("candidateType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("candidatePerformed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("candidateEngaged"));

  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v11, "appLaunchMetadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "numberWithInt:", objc_msgSend(v19, "relativeTimeSinceAnchorInSeconds"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, CFSTR("secondsSinceAnchor"));

  objc_msgSend(v11, "actionUUIDMetadatas");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "actionUUIDLaunchHistory");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "populateCandidateOccurrencesForFeatures:withLaunchHistoryMetadata:", v12, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)appCandidateFeaturesFromAppLaunchEvent:(id)a3 appMetadata:(id)a4 appWasLaunched:(BOOL)a5 appEngaged:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
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

  v6 = a6;
  v7 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_opt_new();
  +[ATXAnchorModelDataStoreWrapper candidateIdFromAppLaunchDuetEvent:](ATXAnchorModelDataStoreWrapper, "candidateIdFromAppLaunchDuetEvent:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("candidateId"));

  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v11, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "timeIntervalSince1970");
  objc_msgSend(v14, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("candidateOccurrenceId"));

  objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("app"), CFSTR("candidateType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("candidatePerformed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("candidateEngaged"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "relativeTimeSinceAnchorInSeconds"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("secondsSinceAnchor"));

  objc_msgSend(v10, "appLaunchHistory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "populateCandidateOccurrencesForFeatures:withLaunchHistoryMetadata:", v12, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)modeCandidateFeaturesFromModeEvent:(id)a3 modeMetadata:(id)a4 modeOccurred:(BOOL)a5 modeEngaged:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v6 = a6;
  v7 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_opt_new();
  objc_msgSend(a1, "candidateIdFromModeBiomeEvent:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("candidateId"));

  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(v11, "timestamp");
  v17 = v16;

  v18 = (void *)objc_msgSend(v15, "initWithTimeIntervalSinceReferenceDate:", v17);
  objc_msgSend(v18, "timeIntervalSince1970");
  objc_msgSend(v14, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("candidateOccurrenceId"));

  objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("mode"), CFSTR("candidateType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, CFSTR("candidatePerformed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("candidateEngaged"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "relativeTimeSinceAnchorInSeconds"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, CFSTR("secondsSinceAnchor"));

  objc_msgSend(v10, "modeHistory");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "populateCandidateOccurrencesForFeatures:withLaunchHistoryMetadata:", v12, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)linkActionCandidateFeaturesFromLinkActionEvent:(id)a3 actionMetadata:(id)a4 actionOccurred:(BOOL)a5 actionEngaged:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (id)objc_opt_new();
  objc_msgSend(a1, "candidateIdFromLinkActionBiomeEvent:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("candidateId"));
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v10, "timestamp");
    v16 = (void *)objc_msgSend(v15, "initWithTimeIntervalSinceReferenceDate:");
    objc_msgSend(v16, "timeIntervalSince1970");
    objc_msgSend(v14, "numberWithDouble:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("candidateOccurrenceId"));

    objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("linkaction"), CFSTR("candidateType"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("candidatePerformed"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("candidateEngaged"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "relativeTimeSinceAnchorInSeconds"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, CFSTR("secondsSinceAnchor"));

    objc_msgSend(v11, "actionHistory");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "populateCandidateOccurrencesForFeatures:withLaunchHistoryMetadata:", v12, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v22;
    v23 = v12;
  }
  else
  {
    __atxlog_handle_anchor();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      +[ATXAnchorModelDataStoreWrapper linkActionCandidateFeaturesFromLinkActionEvent:actionMetadata:actionOccurred:actionEngaged:].cold.1();

    v23 = 0;
  }

  return v23;
}

+ (id)populateCandidateOccurrencesForFeatures:(id)a3 withLaunchHistoryMetadata:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithUnsignedInt:", objc_msgSend(v7, "launchesInLast12Hours"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("candidateOccurrencesInLast12Hours"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "launchesInLast24Hours"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("candidateOccurrencesInLast24Hours"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "launchesInLast48Hours"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("candidateOccurrencesInLast48Hours"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "launchesInLast7Days"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("candidateOccurrencesInLast7Days"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "launchesInLast14Days"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("candidateOccurrencesInLast14Days"));

  v13 = (void *)MEMORY[0x1E0CB37E8];
  v14 = objc_msgSend(v7, "launchesInLast28Days");

  objc_msgSend(v13, "numberWithUnsignedInt:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("candidateOccurrencesInLast28Days"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("candidateOccurrencesInLast12Hours"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "integerValue");
  v18 = MEMORY[0x1E0C9AAA0];
  v19 = MEMORY[0x1E0C9AAB0];
  if (v17 <= 0)
    v20 = MEMORY[0x1E0C9AAA0];
  else
    v20 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("candidateOccurredInLast12Hours"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("candidateOccurrencesInLast24Hours"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "integerValue") <= 0)
    v22 = v18;
  else
    v22 = v19;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("candidateOccurredInLast24Hours"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("candidateOccurrencesInLast48Hours"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "integerValue") <= 0)
    v24 = v18;
  else
    v24 = v19;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, CFSTR("candidateOccurredInLast48Hours"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("candidateOccurrencesInLast7Days"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "integerValue") <= 0)
    v26 = v18;
  else
    v26 = v19;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, CFSTR("candidateOccurredInLast7Days"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("candidateOccurrencesInLast14Days"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "integerValue") <= 0)
    v28 = v18;
  else
    v28 = v19;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, CFSTR("candidateOccurredInLast14Days"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("candidateOccurrencesInLast28Days"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "integerValue") <= 0)
    v30 = v18;
  else
    v30 = v19;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v30, CFSTR("candidateOccurredInLast28Days"));

  return v5;
}

- (void)updateOrInsertAnchorEvent:(id)a3 anchor:(id)a4 featureMetadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  __atxlog_handle_anchor();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138412802;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    _os_log_debug_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEBUG, "AnchorModel: ATXDATASTORE. Adding anchor event to database %@ for anchor %@, featureMetadata: %@", (uint8_t *)&v12, 0x20u);
  }

  -[ATXAnchorModelDataStoreWrapper updateOrInsertAnchorType:](self, "updateOrInsertAnchorType:", v9);
  -[ATXAnchorModelDataStoreWrapper updateOrInsertLocation:](self, "updateOrInsertLocation:", v10);
  -[ATXAnchorModelDataStoreWrapper insertAnchorOccurrence:anchor:featureMetadata:](self, "insertAnchorOccurrence:anchor:featureMetadata:", v8, v9, v10);

}

- (void)updateOrInsertAnchorType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _ATXDataStore *store;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "anchorTypeString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_class();

  objc_msgSend(v6, "longDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  store = self->_store;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorType___block_invoke;
  v11[3] = &unk_1E82DB9D8;
  v11[4] = self;
  v12 = v5;
  v13 = v7;
  v9 = v7;
  v10 = v5;
  -[_ATXDataStore _doAsync:](store, "_doAsync:", v11);

}

void __59__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorType___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorType___block_invoke_2;
  v3[3] = &unk_1E82DCB88;
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR REPLACE INTO anchorType (name, description) VALUES (:name, :description)"), v3, 0, &__block_literal_global_167_0);

}

void __59__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":name", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":description", *(_QWORD *)(a1 + 40));

}

uint64_t __59__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorType___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __59__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorType___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (void)updateOrInsertLocation:(id)a3
{
  id v4;
  void *v5;
  _ATXDataStore *store;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "locationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    store = self->_store;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__ATXAnchorModelDataStoreWrapper_updateOrInsertLocation___block_invoke;
    v7[3] = &unk_1E82DACB0;
    v7[4] = self;
    v8 = v4;
    -[_ATXDataStore _doAsync:](store, "_doAsync:", v7);

  }
}

void __57__ATXAnchorModelDataStoreWrapper_updateOrInsertLocation___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__ATXAnchorModelDataStoreWrapper_updateOrInsertLocation___block_invoke_2;
  v3[3] = &unk_1E82DCBD8;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR REPLACE INTO locations (uuid, type, description, lat, long) VALUES (:uuid, :type, :description, :lat, :long)"), v3, 0, &__block_literal_global_174);

}

void __57__ATXAnchorModelDataStoreWrapper_updateOrInsertLocation___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "locationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindNamedParam:toNSString:", ":uuid", v3);

  v4 = objc_msgSend(*(id *)(a1 + 32), "locationType");
  if (v4 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E82E8B10[(int)v4];
  }
  objc_msgSend(v6, "bindNamedParam:toNSString:", ":type", v5);

  objc_msgSend(v6, "bindNamedParamToNull:", ":description");
  objc_msgSend(v6, "bindNamedParamToNull:", ":lat");
  objc_msgSend(v6, "bindNamedParamToNull:", ":long");

}

uint64_t __57__ATXAnchorModelDataStoreWrapper_updateOrInsertLocation___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __57__ATXAnchorModelDataStoreWrapper_updateOrInsertLocation___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (void)insertAnchorOccurrence:(id)a3 anchor:(id)a4 featureMetadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  _ATXDataStore *store;
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
  store = self->_store;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__ATXAnchorModelDataStoreWrapper_insertAnchorOccurrence_anchor_featureMetadata___block_invoke;
  v15[3] = &unk_1E82DBAB0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[_ATXDataStore _doAsync:](store, "_doAsync:", v15);

}

void __80__ATXAnchorModelDataStoreWrapper_insertAnchorOccurrence_anchor_featureMetadata___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__ATXAnchorModelDataStoreWrapper_insertAnchorOccurrence_anchor_featureMetadata___block_invoke_2;
  v4[3] = &unk_1E82E2E80;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR REPLACE INTO anchorOccurrence (anchorType, anchorDate, anchorLocalHour, anchorLocalDoW, anchorLocalIsWeekend, anchorLocation, anchorEventIdentifier) VALUES (:anchorType, :anchorDate, :anchorLocalHour, :anchorLocalDoW, :anchorLocalIsWeekend, :anchorLocation, :anchorEventIdentifier)"), v4, 0, &__block_literal_global_193);

}

void __80__ATXAnchorModelDataStoreWrapper_insertAnchorOccurrence_anchor_featureMetadata___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "anchorFeaturesForAnchorOccurrence:anchor:anchorMetadata:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("anchorType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toNSString:", ":anchorType", v4);

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("anchorDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":anchorDate", objc_msgSend(v5, "longLongValue"));

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("anchorLocalHour"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":anchorLocalHour", objc_msgSend(v6, "integerValue"));

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("anchorLocalDoW"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":anchorLocalDoW", objc_msgSend(v7, "integerValue"));

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("anchorLocalIsWeekend"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":anchorLocalIsWeekend", objc_msgSend(v8, "integerValue"));

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("anchorLocation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toNSString:", ":anchorLocation", v9);

  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toNSString:", ":anchorEventIdentifier", v10);

}

uint64_t __80__ATXAnchorModelDataStoreWrapper_insertAnchorOccurrence_anchor_featureMetadata___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __80__ATXAnchorModelDataStoreWrapper_insertAnchorOccurrence_anchor_featureMetadata___block_invoke_3_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (unint64_t)deleteSamplesThatAreMoreThan28DaysOld
{
  NSObject *v3;
  void *v4;
  _ATXDataStore *store;
  id v6;
  unint64_t v7;
  _QWORD v9[5];
  id v10;
  uint8_t *v11;
  uint64_t *v12;
  _QWORD *v13;
  _QWORD v14[4];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;

  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "Deleting Anchor Model samples that are more than 28 days old.", buf, 2u);
  }

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -2419200.0);
  *(_QWORD *)buf = 0;
  v20 = buf;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  store = self->_store;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke;
  v9[3] = &unk_1E82E89B8;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = buf;
  v12 = &v15;
  v13 = v14;
  -[_ATXDataStore _doSync:](store, "_doSync:", v9);
  v7 = v16[3];

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(buf, 8);

  return v7;
}

void __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  __int128 v6;
  uint64_t v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2;
  v4[3] = &unk_1E82E89B8;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(_OWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v2, "writeTransaction:", v4);

}

void __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  _QWORD v22[4];
  id v23;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_3;
  v22[3] = &unk_1E82DCBD8;
  v23 = *(id *)(a1 + 40);
  v21[0] = v3;
  v21[1] = 3221225472;
  v21[2] = __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_4;
  v21[3] = &unk_1E82DCC00;
  v21[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT COUNT(*) FROM anchorOccurrence WHERE anchorDate < :anchorDateCutoff"), v22, v21, &__block_literal_global_198);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v3;
  v19[1] = 3221225472;
  v19[2] = __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_201;
  v19[3] = &unk_1E82DCBD8;
  v20 = *(id *)(a1 + 40);
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM anchorOccurrence WHERE anchorDate < :anchorDateCutoff"), v19, 0, &__block_literal_global_203);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v3;
  v17[1] = 3221225472;
  v17[2] = __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_206;
  v17[3] = &unk_1E82DCBD8;
  v18 = *(id *)(a1 + 40);
  v16[0] = v3;
  v16[1] = 3221225472;
  v16[2] = __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2_207;
  v16[3] = &unk_1E82DCC00;
  v16[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT COUNT(*) FROM anchorModelTrainingData WHERE anchorDate < :anchorDateCutoff"), v17, v16, &__block_literal_global_209);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_212;
  v14[3] = &unk_1E82DCBD8;
  v15 = *(id *)(a1 + 40);
  objc_msgSend(v6, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM anchorModelTrainingData WHERE anchorDate < :anchorDateCutoff"), v14, 0, &__block_literal_global_214_0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_217;
  v12[3] = &unk_1E82DCBD8;
  v13 = *(id *)(a1 + 40);
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2_219;
  v11[3] = &unk_1E82DCC00;
  v11[4] = *(_QWORD *)(a1 + 64);
  objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT COUNT(*) FROM anchorModelSuggestionOutcomes WHERE date < :suggestionDateCutoff"), v12, v11, &__block_literal_global_221);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_224;
  v9[3] = &unk_1E82DCBD8;
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v8, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM anchorModelSuggestionOutcomes WHERE date < :suggestionDateCutoff"), v9, 0, &__block_literal_global_226);

}

void __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "timeIntervalSince1970");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":anchorDateCutoff", (uint64_t)v3);

}

uint64_t __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_4(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v6 = 134217984;
    v7 = v4;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "Removing %lu samples from anchorOccurrence table because the samples are more than 28 days old.", (uint8_t *)&v6, 0xCu);
  }

  return *MEMORY[0x1E0D81788];
}

uint64_t __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_197(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_197_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

void __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_201(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "timeIntervalSince1970");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":anchorDateCutoff", (uint64_t)v3);

}

uint64_t __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2_202(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2_202_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

void __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_206(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "timeIntervalSince1970");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":anchorDateCutoff", (uint64_t)v3);

}

uint64_t __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2_207(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v6 = 134217984;
    v7 = v4;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "Removing %lu samples from anchorModelTrainingData table because the samples are more than 28 days old.", (uint8_t *)&v6, 0xCu);
  }

  return *MEMORY[0x1E0D81788];
}

uint64_t __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_208(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_208_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

void __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_212(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "timeIntervalSince1970");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":anchorDateCutoff", (uint64_t)v3);

}

uint64_t __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2_213(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2_213_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

void __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_217(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":suggestionDateCutoff", (uint64_t)v3);

}

uint64_t __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2_219(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v6 = 134217984;
    v7 = v4;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "Removing %lu outcomes from anchorModelSuggestionOutcomes table because the samples are more than 28 days old.", (uint8_t *)&v6, 0xCu);
  }

  return *MEMORY[0x1E0D81788];
}

uint64_t __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_220(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_220_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

void __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_224(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":suggestionDateCutoff", (uint64_t)v3);

}

uint64_t __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2_225(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2_225_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (unint64_t)deleteSamplesForBundleIdsNotInList:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _ATXDataStore *store;
  id v8;
  unint64_t v9;
  _QWORD v11[5];
  id v12;
  uint8_t *v13;
  uint8_t buf[8];
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  __atxlog_handle_anchor();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Deleting Anchor Model samples for apps that are uninstalled.", buf, 2u);
  }

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v4);
  *(_QWORD *)buf = 0;
  v15 = buf;
  v16 = 0x2020000000;
  v17 = 0;
  store = self->_store;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__ATXAnchorModelDataStoreWrapper_deleteSamplesForBundleIdsNotInList___block_invoke;
  v11[3] = &unk_1E82DCC50;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v13 = buf;
  -[_ATXDataStore _doSync:](store, "_doSync:", v11);
  v9 = *((_QWORD *)v15 + 3);

  _Block_object_dispose(buf, 8);
  return v9;
}

void __69__ATXAnchorModelDataStoreWrapper_deleteSamplesForBundleIdsNotInList___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1[4] + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__ATXAnchorModelDataStoreWrapper_deleteSamplesForBundleIdsNotInList___block_invoke_2;
  v6[3] = &unk_1E82DCC50;
  v3 = (void *)a1[5];
  v6[4] = a1[4];
  v4 = v3;
  v5 = a1[6];
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "writeTransaction:", v6);

}

void __69__ATXAnchorModelDataStoreWrapper_deleteSamplesForBundleIdsNotInList___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__ATXAnchorModelDataStoreWrapper_deleteSamplesForBundleIdsNotInList___block_invoke_3;
  v6[3] = &unk_1E82DCBD8;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM anchorModelTrainingData WHERE (CASE WHEN INSTR(candidateId, ':') IS 0 THEN candidateId ELSE SUBSTR(candidateId, 1, INSTR(candidateId, ':')-1) END) NOT IN _pas_nsset(:installedBundleIds)"), v6, 0, &__block_literal_global_230);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __69__ATXAnchorModelDataStoreWrapper_deleteSamplesForBundleIdsNotInList___block_invoke_233;
  v5[3] = &unk_1E82DCC00;
  v5[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT changes()"), 0, v5, &__block_literal_global_235);

}

uint64_t __69__ATXAnchorModelDataStoreWrapper_deleteSamplesForBundleIdsNotInList___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":installedBundleIds", *(_QWORD *)(a1 + 32));
}

uint64_t __69__ATXAnchorModelDataStoreWrapper_deleteSamplesForBundleIdsNotInList___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __69__ATXAnchorModelDataStoreWrapper_deleteSamplesForBundleIdsNotInList___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

uint64_t __69__ATXAnchorModelDataStoreWrapper_deleteSamplesForBundleIdsNotInList___block_invoke_233(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v6 = 134217984;
    v7 = v4;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "Removed %ld samples from anchorModelTrainingData because the associated apps were uninstalled.", (uint8_t *)&v6, 0xCu);
  }

  return *MEMORY[0x1E0D81788];
}

uint64_t __69__ATXAnchorModelDataStoreWrapper_deleteSamplesForBundleIdsNotInList___block_invoke_234(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __69__ATXAnchorModelDataStoreWrapper_deleteSamplesForBundleIdsNotInList___block_invoke_234_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

+ (id)anchorFeaturesForAnchorOccurrence:(id)a3 anchor:(id)a4 anchorMetadata:(id)a5
{
  id v8;
  id v9;
  id v10;
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

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v10, "anchorTypeString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("anchorType"));

  v13 = (void *)objc_opt_class();
  objc_msgSend(v13, "anchorOccurenceDateFromDuetEvent:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v14, "timeIntervalSince1970");
  objc_msgSend(v15, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("anchorDate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v9, "hourOfDay"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("anchorLocalHour"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "dayOfWeekIntegerFromATXAnchorModelPBDayOfWeek:", objc_msgSend(v9, "dayOfWeek")));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("anchorLocalDoW"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "isWeekendFromATXAnchorModelPBDayOfWeek:", objc_msgSend(v9, "dayOfWeek")));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, CFSTR("anchorLocalIsWeekend"));

  objc_msgSend(v9, "locationIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v9, "locationIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, CFSTR("anchorLocation"));

  }
  objc_msgSend(v8, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, CFSTR("anchorEventIdentifier"));

  return v11;
}

+ (int64_t)isWeekendFromATXAnchorModelPBDayOfWeek:(int)a3
{
  return a3 == 1 || a3 == 7;
}

+ (int64_t)dayOfWeekIntegerFromATXAnchorModelPBDayOfWeek:(int)a3
{
  if (a3 > 7)
    return 1;
  else
    return qword_1C9E808A8[a3];
}

- (id)historicalAnchorOccurrenceDatesForAnchor:(id)a3
{
  id v4;
  _ATXDataStore *store;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__94;
  v16 = __Block_byref_object_dispose__94;
  v17 = (id)objc_opt_new();
  store = self->_store;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__ATXAnchorModelDataStoreWrapper_historicalAnchorOccurrenceDatesForAnchor___block_invoke;
  v9[3] = &unk_1E82DCC50;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[_ATXDataStore _doSync:](store, "_doSync:", v9);
  v7 = (void *)objc_msgSend((id)v13[5], "copy");

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __75__ATXAnchorModelDataStoreWrapper_historicalAnchorOccurrenceDatesForAnchor___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__ATXAnchorModelDataStoreWrapper_historicalAnchorOccurrenceDatesForAnchor___block_invoke_2;
  v8[3] = &unk_1E82DCBD8;
  v9 = *(id *)(a1 + 40);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __75__ATXAnchorModelDataStoreWrapper_historicalAnchorOccurrenceDatesForAnchor___block_invoke_3;
  v7[3] = &unk_1E82DCC00;
  v4 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 48);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __75__ATXAnchorModelDataStoreWrapper_historicalAnchorOccurrenceDatesForAnchor___block_invoke_4;
  v5[3] = &unk_1E82DCC28;
  v6 = v4;
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT anchorDate FROM anchorOccurrence WHERE anchorType=:anchorType ORDER BY anchorDate DESC LIMIT 30;"),
    v8,
    v7,
    v5);

}

void __75__ATXAnchorModelDataStoreWrapper_historicalAnchorOccurrenceDatesForAnchor___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "anchorTypeString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toNSString:", ":anchorType", v4);

}

uint64_t __75__ATXAnchorModelDataStoreWrapper_historicalAnchorOccurrenceDatesForAnchor___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 *v8;

  v3 = (objc_class *)MEMORY[0x1E0C99D68];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = objc_msgSend(v4, "getInt64ForColumnName:table:", "anchorDate", "anchorOccurrence");

  v7 = (void *)objc_msgSend(v5, "initWithTimeIntervalSince1970:", (double)v6);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v7);
  v8 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v8;
}

uint64_t __75__ATXAnchorModelDataStoreWrapper_historicalAnchorOccurrenceDatesForAnchor___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __75__ATXAnchorModelDataStoreWrapper_historicalAnchorOccurrenceDatesForAnchor___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)uniqueAnchorEventIdentifiersForAnchor:(id)a3
{
  id v4;
  _ATXDataStore *store;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__94;
  v16 = __Block_byref_object_dispose__94;
  v17 = (id)objc_opt_new();
  store = self->_store;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__ATXAnchorModelDataStoreWrapper_uniqueAnchorEventIdentifiersForAnchor___block_invoke;
  v9[3] = &unk_1E82DCC50;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[_ATXDataStore _doSync:](store, "_doSync:", v9);
  v7 = (void *)objc_msgSend((id)v13[5], "copy");

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __72__ATXAnchorModelDataStoreWrapper_uniqueAnchorEventIdentifiersForAnchor___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__ATXAnchorModelDataStoreWrapper_uniqueAnchorEventIdentifiersForAnchor___block_invoke_2;
  v10[3] = &unk_1E82DCB88;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v11 = v4;
  v12 = v5;
  v9[2] = __72__ATXAnchorModelDataStoreWrapper_uniqueAnchorEventIdentifiersForAnchor___block_invoke_3;
  v9[3] = &unk_1E82DCC00;
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[4] = *(_QWORD *)(a1 + 48);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __72__ATXAnchorModelDataStoreWrapper_uniqueAnchorEventIdentifiersForAnchor___block_invoke_246;
  v7[3] = &unk_1E82DCC28;
  v8 = v6;
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT DISTINCT anchorEventIdentifier FROM anchorOccurrence WHERE anchorType=:anchorType AND anchorDate>:oldestAllowedAnchorDate"), v10, v9, v7);

}

void __72__ATXAnchorModelDataStoreWrapper_uniqueAnchorEventIdentifiersForAnchor___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "anchorTypeString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindNamedParam:toNSString:", ":anchorType", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "timeIntervalSince1970");
  objc_msgSend(v6, "bindNamedParam:toInt64:", ":oldestAllowedAnchorDate", (uint64_t)v5);

}

uint64_t __72__ATXAnchorModelDataStoreWrapper_uniqueAnchorEventIdentifiersForAnchor___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  unsigned __int8 *v5;

  objc_msgSend(a2, "getNSStringForColumnName:table:", "anchorEventIdentifier", "anchorOccurrence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
  }
  else
  {
    __atxlog_handle_anchor();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __72__ATXAnchorModelDataStoreWrapper_uniqueAnchorEventIdentifiersForAnchor___block_invoke_3_cold_1();

  }
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v5;
}

uint64_t __72__ATXAnchorModelDataStoreWrapper_uniqueAnchorEventIdentifiersForAnchor___block_invoke_246(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __72__ATXAnchorModelDataStoreWrapper_uniqueAnchorEventIdentifiersForAnchor___block_invoke_246_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (int64_t)numUniqueAnchorOccurrencesForAnchor:(id)a3 candidateId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _ATXDataStore *store;
  id v10;
  id v11;
  int64_t v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[ATXAnchorModelDataStoreWrapper dateOfFirstPositiveCandidateOccurrence:anchor:startDate:limit:](self, "dateOfFirstPositiveCandidateOccurrence:anchor:startDate:limit:", v7, v6, self->_twentyOneDaysAgo, 9999999);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  store = self->_store;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForAnchor_candidateId___block_invoke;
  v14[3] = &unk_1E82E2C08;
  v14[4] = self;
  v10 = v6;
  v15 = v10;
  v11 = v8;
  v16 = v11;
  v17 = &v18;
  -[_ATXDataStore _doSync:](store, "_doSync:", v14);
  v12 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __82__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForAnchor_candidateId___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForAnchor_candidateId___block_invoke_2;
  v7[3] = &unk_1E82DCB88;
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __82__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForAnchor_candidateId___block_invoke_3;
  v6[3] = &unk_1E82DCC00;
  v6[4] = *(_QWORD *)(a1 + 56);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __82__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForAnchor_candidateId___block_invoke_4;
  v4[3] = &unk_1E82DCC28;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT COUNT(*) FROM anchorOccurrence WHERE anchorType=:anchorType AND anchorEventIdentifier LIKE :anchorEventIdentifier AND anchorDate >= :oldestAllowedAnchorDate"), v7, v6, v4);

}

void __82__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForAnchor_candidateId___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  double v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v9 = a2;
  objc_msgSend(v3, "anchorTypeString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bindNamedParam:toNSString:", ":anchorType", v4);

  objc_msgSend(*(id *)(a1 + 32), "anchorEventIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("%");
  objc_msgSend(v9, "bindNamedParam:toNSString:", ":anchorEventIdentifier", v7);

  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSince1970");
  objc_msgSend(v9, "bindNamedParam:toInt64:", ":oldestAllowedAnchorDate", (uint64_t)v8);

}

uint64_t __82__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForAnchor_candidateId___block_invoke_3(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

uint64_t __82__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForAnchor_candidateId___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __82__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForAnchor_candidateId___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (int64_t)numUniqueAnchorOccurrencesWithUniqueCandidateOccurrenceForGenericCandidateId:(id)a3 anchor:(id)a4
{
  id v6;
  id v7;
  _ATXDataStore *store;
  id v9;
  id v10;
  int64_t v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  store = self->_store;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __118__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesWithUniqueCandidateOccurrenceForGenericCandidateId_anchor___block_invoke;
  v13[3] = &unk_1E82E2C08;
  v13[4] = self;
  v9 = v7;
  v14 = v9;
  v10 = v6;
  v15 = v10;
  v16 = &v17;
  -[_ATXDataStore _doSync:](store, "_doSync:", v13);
  v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __118__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesWithUniqueCandidateOccurrenceForGenericCandidateId_anchor___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __118__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesWithUniqueCandidateOccurrenceForGenericCandidateId_anchor___block_invoke_2;
  v10[3] = &unk_1E82DF220;
  v11 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v12 = v4;
  v13 = v5;
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __118__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesWithUniqueCandidateOccurrenceForGenericCandidateId_anchor___block_invoke_3;
  v9[3] = &unk_1E82DCC00;
  v6 = *(void **)(a1 + 48);
  v9[4] = *(_QWORD *)(a1 + 56);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __118__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesWithUniqueCandidateOccurrenceForGenericCandidateId_anchor___block_invoke_4;
  v7[3] = &unk_1E82DCC28;
  v8 = v6;
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT COUNT( DISTINCT dates) FROM (SELECT anchorOccurrence.anchorDate AS dates FROM anchorModelTrainingData INNER JOIN anchorOccurrence ON anchorModelTrainingData.anchorType=anchorOccurrence.anchorType AND anchorModelTrainingData.anchorDate=anchorOccurrence.anchorDate WHERE candidateId=:candidateId AND anchorOccurrence.anchorType=:anchorType AND anchorEventIdentifier LIKE :anchorEventIdentifier AND candidatePerformed=1 AND secondsSinceAnchor<:secondsSinceAnchor AND anchorOccurrence.anchorDate>:oldestAllowedAnchorDate GROUP BY candidateOccurrenceId)"), v10, v9, v7);

}

void __118__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesWithUniqueCandidateOccurrenceForGenericCandidateId_anchor___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  id v12;

  v3 = *(void **)(a1 + 32);
  v12 = a2;
  objc_msgSend(v3, "anchorEventIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("%");
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  objc_msgSend(v12, "bindNamedParam:toNSString:", ":candidateId", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "anchorTypeString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bindNamedParam:toNSString:", ":anchorType", v8);

  objc_msgSend(v12, "bindNamedParam:toNSString:", ":anchorEventIdentifier", v7);
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend((id)objc_opt_class(), "secondsOfInfluence");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bindNamedParam:toInteger:", ":secondsSinceAnchor", objc_msgSend(v10, "integerValue"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "timeIntervalSince1970");
  objc_msgSend(v12, "bindNamedParam:toInt64:", ":oldestAllowedAnchorDate", (uint64_t)v11);

}

uint64_t __118__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesWithUniqueCandidateOccurrenceForGenericCandidateId_anchor___block_invoke_3(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

uint64_t __118__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesWithUniqueCandidateOccurrenceForGenericCandidateId_anchor___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __118__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesWithUniqueCandidateOccurrenceForGenericCandidateId_anchor___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (int64_t)numUniqueAnchorOccurrencesForGenericCandidateId:(id)a3 anchor:(id)a4
{
  id v6;
  id v7;
  _ATXDataStore *store;
  id v9;
  id v10;
  int64_t v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  store = self->_store;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForGenericCandidateId_anchor___block_invoke;
  v13[3] = &unk_1E82E2C08;
  v13[4] = self;
  v9 = v7;
  v14 = v9;
  v10 = v6;
  v15 = v10;
  v16 = &v17;
  -[_ATXDataStore _doSync:](store, "_doSync:", v13);
  v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __89__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForGenericCandidateId_anchor___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __89__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForGenericCandidateId_anchor___block_invoke_2;
  v10[3] = &unk_1E82DF220;
  v11 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v12 = v4;
  v13 = v5;
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __89__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForGenericCandidateId_anchor___block_invoke_3;
  v9[3] = &unk_1E82DCC00;
  v6 = *(void **)(a1 + 48);
  v9[4] = *(_QWORD *)(a1 + 56);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __89__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForGenericCandidateId_anchor___block_invoke_4;
  v7[3] = &unk_1E82DCC28;
  v8 = v6;
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT COUNT(DISTINCT anchorOccurrence.anchorDate) FROM anchorModelTrainingData INNER JOIN anchorOccurrence ON anchorModelTrainingData.anchorType=anchorOccurrence.anchorType AND anchorModelTrainingData.anchorDate=anchorOccurrence.anchorDate WHERE candidateId=:candidateId AND anchorOccurrence.anchorType=:anchorType AND anchorEventIdentifier LIKE :anchorEventIdentifier AND candidatePerformed=1 AND secondsSinceAnchor<:secondsSinceAnchor AND anchorOccurrence.anchorDate >= :oldestAllowedAnchorDate"), v10, v9, v7);

}

void __89__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForGenericCandidateId_anchor___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  id v12;

  v3 = *(void **)(a1 + 32);
  v12 = a2;
  objc_msgSend(v3, "anchorEventIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("%");
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  objc_msgSend(v12, "bindNamedParam:toNSString:", ":candidateId", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "anchorTypeString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bindNamedParam:toNSString:", ":anchorType", v8);

  objc_msgSend(v12, "bindNamedParam:toNSString:", ":anchorEventIdentifier", v7);
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend((id)objc_opt_class(), "secondsOfInfluence");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bindNamedParam:toInteger:", ":secondsSinceAnchor", objc_msgSend(v10, "integerValue"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "timeIntervalSince1970");
  objc_msgSend(v12, "bindNamedParam:toInt64:", ":oldestAllowedAnchorDate", (uint64_t)v11);

}

uint64_t __89__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForGenericCandidateId_anchor___block_invoke_3(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

uint64_t __89__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForGenericCandidateId_anchor___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __118__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesWithUniqueCandidateOccurrenceForGenericCandidateId_anchor___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)candidateTypeForCandidateId:(id)a3
{
  id v4;
  _ATXDataStore *store;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__94;
  v17 = __Block_byref_object_dispose__94;
  v18 = (id)objc_opt_new();
  store = self->_store;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__ATXAnchorModelDataStoreWrapper_candidateTypeForCandidateId___block_invoke;
  v10[3] = &unk_1E82DCC50;
  v10[4] = self;
  v6 = v4;
  v11 = v6;
  v12 = &v13;
  -[_ATXDataStore _doSync:](store, "_doSync:", v10);
  if ((unint64_t)objc_msgSend((id)v14[5], "count") < 2)
  {
    objc_msgSend((id)v14[5], "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __atxlog_handle_anchor();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[ATXAnchorModelDataStoreWrapper candidateTypeForCandidateId:].cold.1();

    v8 = 0;
  }

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __62__ATXAnchorModelDataStoreWrapper_candidateTypeForCandidateId___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__ATXAnchorModelDataStoreWrapper_candidateTypeForCandidateId___block_invoke_2;
  v8[3] = &unk_1E82DCBD8;
  v9 = *(id *)(a1 + 40);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __62__ATXAnchorModelDataStoreWrapper_candidateTypeForCandidateId___block_invoke_3;
  v7[3] = &unk_1E82DCC00;
  v4 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 48);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __62__ATXAnchorModelDataStoreWrapper_candidateTypeForCandidateId___block_invoke_4;
  v5[3] = &unk_1E82DCC28;
  v6 = v4;
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT DISTINCT candidateType FROM anchorModelTrainingData WHERE candidateId = ?"), v8, v7, v5);

}

uint64_t __62__ATXAnchorModelDataStoreWrapper_candidateTypeForCandidateId___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __62__ATXAnchorModelDataStoreWrapper_candidateTypeForCandidateId___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "getNSStringForColumn:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return *MEMORY[0x1E0D81780];
}

uint64_t __62__ATXAnchorModelDataStoreWrapper_candidateTypeForCandidateId___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __62__ATXAnchorModelDataStoreWrapper_candidateTypeForCandidateId___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (void)populateCachedCountsForCandidateIds:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  ATXCachedCandidateCounter *v14;
  ATXCachedCandidateCounter *cachedAppLaunchCounter;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  ATXCachedCandidateCounter *v23;
  ATXCachedCandidateCounter *cachedModeCounter;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  _QWORD v28[4];
  id v29;
  _QWORD v30[6];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -1814400.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "App");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "InFocus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "atx_publisherFromStartDate:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __70__ATXAnchorModelDataStoreWrapper_populateCachedCountsForCandidateIds___block_invoke;
  v30[3] = &unk_1E82E8A20;
  v30[4] = self;
  objc_msgSend(v9, "mapWithTransform:", v30);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v10;
  v28[1] = 3221225472;
  v28[2] = __70__ATXAnchorModelDataStoreWrapper_populateCachedCountsForCandidateIds___block_invoke_2;
  v28[3] = &unk_1E82E1B00;
  v12 = v4;
  v29 = v12;
  objc_msgSend(v11, "filterWithIsIncluded:", v28);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[ATXCachedCandidateCounter initWithCandidateIdPublisher:]([ATXCachedCandidateCounter alloc], "initWithCandidateIdPublisher:", v13);
  cachedAppLaunchCounter = self->_cachedAppLaunchCounter;
  self->_cachedAppLaunchCounter = v14;

  -[ATXCachedCandidateCounter populateCache](self->_cachedAppLaunchCounter, "populateCache");
  BiomeLibrary();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UserFocus");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ComputedMode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "atx_publisherFromStartDate:", v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v10;
  v27[1] = 3221225472;
  v27[2] = __70__ATXAnchorModelDataStoreWrapper_populateCachedCountsForCandidateIds___block_invoke_3;
  v27[3] = &unk_1E82E8A20;
  v27[4] = self;
  objc_msgSend(v19, "mapWithTransform:", v27);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v10;
  v25[1] = 3221225472;
  v25[2] = __70__ATXAnchorModelDataStoreWrapper_populateCachedCountsForCandidateIds___block_invoke_4;
  v25[3] = &unk_1E82E1B00;
  v26 = v12;
  v21 = v12;
  objc_msgSend(v20, "filterWithIsIncluded:", v25);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[ATXCachedCandidateCounter initWithCandidateIdPublisher:]([ATXCachedCandidateCounter alloc], "initWithCandidateIdPublisher:", v22);
  cachedModeCounter = self->_cachedModeCounter;
  self->_cachedModeCounter = v23;

  -[ATXCachedCandidateCounter populateCache](self->_cachedModeCounter, "populateCache");
}

id __70__ATXAnchorModelDataStoreWrapper_populateCachedCountsForCandidateIds___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "candidateIdFromAppLaunchBiomeEvent:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __70__ATXAnchorModelDataStoreWrapper_populateCachedCountsForCandidateIds___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

id __70__ATXAnchorModelDataStoreWrapper_populateCachedCountsForCandidateIds___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "candidateIdFromModeBiomeEvent:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __70__ATXAnchorModelDataStoreWrapper_populateCachedCountsForCandidateIds___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (int64_t)numCandidateOccurrencesInAllContextsForCandidate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int64_t v8;
  NSObject *v9;
  int64_t v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;

  v4 = a3;
  -[ATXAnchorModelDataStoreWrapper candidateTypeForCandidateId:](self, "candidateTypeForCandidateId:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("action")))
    {
      __atxlog_handle_anchor();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[ATXAnchorModelDataStoreWrapper numCandidateOccurrencesInAllContextsForCandidate:].cold.2();

      v8 = -[ATXAnchorModelDataStoreWrapper numActionOccurrencesInAllContextsForActionId:](self, "numActionOccurrencesInAllContextsForActionId:", v4);
LABEL_22:
      v10 = v8;
      goto LABEL_23;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("app")))
    {
      __atxlog_handle_anchor();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[ATXAnchorModelDataStoreWrapper numCandidateOccurrencesInAllContextsForCandidate:].cold.3();

      v8 = -[ATXAnchorModelDataStoreWrapper numAppLaunchOccurrencesInAllContextsForAppLaunchCandidateId:](self, "numAppLaunchOccurrencesInAllContextsForAppLaunchCandidateId:", v4);
      goto LABEL_22;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("mode")))
    {
      __atxlog_handle_anchor();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[ATXAnchorModelDataStoreWrapper numCandidateOccurrencesInAllContextsForCandidate:].cold.4();

      v8 = -[ATXAnchorModelDataStoreWrapper numModeOccurrencesInAllContextsForModeId:](self, "numModeOccurrencesInAllContextsForModeId:", v4);
      goto LABEL_22;
    }
    v13 = objc_msgSend(v6, "isEqualToString:", CFSTR("linkaction"));
    __atxlog_handle_anchor();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[ATXAnchorModelDataStoreWrapper numCandidateOccurrencesInAllContextsForCandidate:].cold.5();

      v8 = -[ATXAnchorModelDataStoreWrapper numLinkActionOccurrencesInAllContextsForCandidateId:](self, "numLinkActionOccurrencesInAllContextsForCandidateId:", v4);
      goto LABEL_22;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ATXAnchorModelDataStoreWrapper numCandidateOccurrencesInAllContextsForCandidate:].cold.6();

  }
  else
  {
    __atxlog_handle_anchor();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ATXAnchorModelDataStoreWrapper numCandidateOccurrencesInAllContextsForCandidate:].cold.1();

  }
  v10 = 0;
LABEL_23:

  return v10;
}

- (int64_t)numCandidateOccurrencesInAllContextsForCandidateType:(id)a3
{
  id v4;
  NSObject *v5;
  int64_t v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  int64_t v12;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("action")))
  {
    __atxlog_handle_anchor();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[ATXAnchorModelDataStoreWrapper numCandidateOccurrencesInAllContextsForCandidate:].cold.2();

    v6 = -[ATXAnchorModelDataStoreWrapper numActionOccurrencesInAllContexts](self, "numActionOccurrencesInAllContexts");
LABEL_17:
    v12 = v6;
    goto LABEL_18;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("app")))
  {
    __atxlog_handle_anchor();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[ATXAnchorModelDataStoreWrapper numCandidateOccurrencesInAllContextsForCandidate:].cold.3();

    v6 = -[ATXAnchorModelDataStoreWrapper numAppLaunchOccurrencesInAllContexts](self, "numAppLaunchOccurrencesInAllContexts");
    goto LABEL_17;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("mode")))
  {
    __atxlog_handle_anchor();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[ATXAnchorModelDataStoreWrapper numCandidateOccurrencesInAllContextsForCandidate:].cold.4();

    v6 = -[ATXAnchorModelDataStoreWrapper numModeOccurrencesInAllContexts](self, "numModeOccurrencesInAllContexts");
    goto LABEL_17;
  }
  v9 = objc_msgSend(v4, "isEqualToString:", CFSTR("linkaction"));
  __atxlog_handle_anchor();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[ATXAnchorModelDataStoreWrapper numCandidateOccurrencesInAllContextsForCandidate:].cold.4();

    v6 = -[ATXAnchorModelDataStoreWrapper numLinkActionOccurrencesInAllContexts](self, "numLinkActionOccurrencesInAllContexts");
    goto LABEL_17;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[ATXAnchorModelDataStoreWrapper numCandidateOccurrencesInAllContextsForCandidateType:].cold.5();

  v12 = 0;
LABEL_18:

  return v12;
}

- (int64_t)numActionOccurrencesInAllContextsForActionId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _ATXDataStore *store;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  NSObject *v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "dateByAddingTimeInterval:", -1814400.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXAnchorModelDataStoreWrapper actionDetailsFromActionCandidateId:](ATXAnchorModelDataStoreWrapper, "actionDetailsFromActionCandidateId:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    store = self->_store;
    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v7, "bundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "actionType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@:%@"), v10, v11);
    v13 = -[_ATXDataStore numActionParameterHashOccurrencesForActionKey:parameterHash:startDate:endDate:](store, "numActionParameterHashOccurrencesForActionKey:parameterHash:startDate:endDate:", v12, objc_msgSend(v7, "paramHash"), v6, v5);

  }
  else
  {
    __atxlog_handle_anchor();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[ATXAnchorModelDataStoreWrapper numActionOccurrencesInAllContextsForActionId:].cold.1();

    v13 = 0;
  }

  return v13;
}

- (int64_t)numActionOccurrencesInAllContexts
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_numCandidateOccurrencesInAllContextsForCandidateTypeCache, "objectForKeyedSubscript:", CFSTR("action"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "integerValue");
  }
  else
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "dateByAddingTimeInterval:", -1814400.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ATXDataStore numActionKeyOccurrencesBetweenStartDate:endDate:](self->_store, "numActionKeyOccurrencesBetweenStartDate:endDate:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v5 = 0;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v5 += objc_msgSend(v13, "integerValue");

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_numCandidateOccurrencesInAllContextsForCandidateTypeCache, "setObject:forKeyedSubscript:", v14, CFSTR("action"));

  }
  return v5;
}

- (int64_t)numAppLaunchOccurrencesInAllContextsForAppLaunchCandidateId:(id)a3
{
  ATXCachedCandidateCounter *cachedAppLaunchCounter;
  id v4;
  int64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  cachedAppLaunchCounter = self->_cachedAppLaunchCounter;
  v4 = a3;
  if (cachedAppLaunchCounter)
  {
    v5 = -[ATXCachedCandidateCounter countForCandidate:](cachedAppLaunchCounter, "countForCandidate:", v4);
  }
  else
  {
    __atxlog_handle_anchor();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[ATXAnchorModelDataStoreWrapper numAppLaunchOccurrencesInAllContextsForAppLaunchCandidateId:].cold.1();

    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "dateByAddingTimeInterval:", -1814400.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithStringValue:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_new();
    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchEventIdentifierCountsBetweenStartDate:andEndDate:withPredicates:", v8, v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v12, "countForObject:", v4);

    v4 = v7;
  }

  return v5;
}

- (int64_t)numAppLaunchOccurrencesInAllContexts
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_numCandidateOccurrencesInAllContextsForCandidateTypeCache, "objectForKeyedSubscript:", CFSTR("app"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "integerValue");
  }
  else
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "dateByAddingTimeInterval:", -1814400.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "fetchEventIdentifierCountsBetweenStartDate:andEndDate:withPredicates:", v7, v6, MEMORY[0x1E0C9AA60]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v5 = 0;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          v5 += objc_msgSend(v10, "countForObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }
    else
    {
      v5 = 0;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_numCandidateOccurrencesInAllContextsForCandidateTypeCache, "setObject:forKeyedSubscript:", v15, CFSTR("app"));

  }
  return v5;
}

- (int64_t)numModeOccurrencesInAllContextsForModeId:(id)a3
{
  id v4;
  ATXCachedCandidateCounter *cachedModeCounter;
  int64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a3;
  cachedModeCounter = self->_cachedModeCounter;
  if (cachedModeCounter)
  {
    v6 = -[ATXCachedCandidateCounter countForCandidate:](cachedModeCounter, "countForCandidate:", v4);
  }
  else
  {
    __atxlog_handle_anchor();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[ATXAnchorModelDataStoreWrapper numModeOccurrencesInAllContextsForModeId:].cold.1();

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -1814400.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXAnchorModelDataStoreWrapper modeDetailsFromModeCandidateId:](ATXAnchorModelDataStoreWrapper, "modeDetailsFromModeCandidateId:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    BiomeLibrary();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UserFocus");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ComputedMode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "atx_publisherFromStartDate:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __75__ATXAnchorModelDataStoreWrapper_numModeOccurrencesInAllContextsForModeId___block_invoke;
    v20[3] = &unk_1E82DF748;
    v15 = v9;
    v21 = v15;
    objc_msgSend(v13, "filterWithIsIncluded:", v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __75__ATXAnchorModelDataStoreWrapper_numModeOccurrencesInAllContextsForModeId___block_invoke_3;
    v19[3] = &unk_1E82DBE68;
    v19[4] = &v22;
    v17 = (id)objc_msgSend(v16, "sinkWithCompletion:receiveInput:", &__block_literal_global_268, v19);

    v6 = v23[3];
    _Block_object_dispose(&v22, 8);

  }
  return v6;
}

uint64_t __75__ATXAnchorModelDataStoreWrapper_numModeOccurrencesInAllContextsForModeId___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "modeUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    objc_msgSend(v3, "eventBody");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "starting");
    v9 = v8 ^ objc_msgSend(*(id *)(a1 + 32), "isStart") ^ 1;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __75__ATXAnchorModelDataStoreWrapper_numModeOccurrencesInAllContextsForModeId___block_invoke_3(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (int64_t)numModeOccurrencesInAllContexts
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_numCandidateOccurrencesInAllContextsForCandidateTypeCache, "objectForKeyedSubscript:", CFSTR("mode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "integerValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -1814400.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    BiomeLibrary();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UserFocus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ComputedMode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "atx_publisherFromStartDate:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __65__ATXAnchorModelDataStoreWrapper_numModeOccurrencesInAllContexts__block_invoke_2;
    v14[3] = &unk_1E82DBE68;
    v14[4] = &v15;
    v11 = (id)objc_msgSend(v10, "sinkWithCompletion:receiveInput:", &__block_literal_global_270, v14);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16[3]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_numCandidateOccurrencesInAllContextsForCandidateTypeCache, "setObject:forKeyedSubscript:", v12, CFSTR("mode"));

    v5 = v16[3];
    _Block_object_dispose(&v15, 8);

  }
  return v5;
}

uint64_t __65__ATXAnchorModelDataStoreWrapper_numModeOccurrencesInAllContexts__block_invoke_2(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (int64_t)numLinkActionOccurrencesInAllContextsForCandidateId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -1814400.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXAnchorModelDataStoreWrapper linkActionDetailsFromLinkActionCandidateId:](ATXAnchorModelDataStoreWrapper, "linkActionDetailsFromLinkActionCandidateId:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  +[ATXLinkTranscriptUtil systemLinkTranscriptPublisherFromDate:toDate:error:](ATXLinkTranscriptUtil, "systemLinkTranscriptPublisherFromDate:toDate:error:", v4, 0, &v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v21;
  if (v7)
  {
    __atxlog_handle_anchor();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ATXAnchorModelDataStoreWrapper numLinkActionOccurrencesInAllContextsForCandidateId:].cold.1();

    v9 = 0;
  }
  else
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __86__ATXAnchorModelDataStoreWrapper_numLinkActionOccurrencesInAllContextsForCandidateId___block_invoke;
    v15[3] = &unk_1E82DF748;
    v16 = v5;
    objc_msgSend(v6, "filterWithIsIncluded:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __86__ATXAnchorModelDataStoreWrapper_numLinkActionOccurrencesInAllContextsForCandidateId___block_invoke_3;
    v14[3] = &unk_1E82DBE68;
    v14[4] = &v17;
    v12 = (id)objc_msgSend(v11, "sinkWithCompletion:receiveInput:", &__block_literal_global_272_0, v14);

    v9 = v18[3];
    _Block_object_dispose(&v17, 8);
  }

  return v9;
}

uint64_t __86__ATXAnchorModelDataStoreWrapper_numLinkActionOccurrencesInAllContextsForCandidateId___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "action");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "bundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v9))
  {
    objc_msgSend(*(id *)(a1 + 32), "actionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqualToString:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __86__ATXAnchorModelDataStoreWrapper_numLinkActionOccurrencesInAllContextsForCandidateId___block_invoke_3(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (int64_t)numLinkActionOccurrencesInAllContexts
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_numCandidateOccurrencesInAllContextsForCandidateTypeCache, "objectForKeyedSubscript:", CFSTR("mode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "integerValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -1814400.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    +[ATXLinkTranscriptUtil systemLinkTranscriptPublisherFromDate:toDate:error:](ATXLinkTranscriptUtil, "systemLinkTranscriptPublisherFromDate:toDate:error:", v6, 0, &v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v18;
    if (v8)
    {
      __atxlog_handle_anchor();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[ATXAnchorModelDataStoreWrapper numLinkActionOccurrencesInAllContextsForCandidateId:].cold.1();

      v5 = 0;
    }
    else
    {
      v14 = 0;
      v15 = &v14;
      v16 = 0x2020000000;
      v17 = 0;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __71__ATXAnchorModelDataStoreWrapper_numLinkActionOccurrencesInAllContexts__block_invoke_2;
      v13[3] = &unk_1E82DBE68;
      v13[4] = &v14;
      v10 = (id)objc_msgSend(v7, "sinkWithCompletion:receiveInput:", &__block_literal_global_273, v13);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15[3]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_numCandidateOccurrencesInAllContextsForCandidateTypeCache, "setObject:forKeyedSubscript:", v11, CFSTR("mode"));

      v5 = v15[3];
      _Block_object_dispose(&v14, 8);
    }

  }
  return v5;
}

uint64_t __71__ATXAnchorModelDataStoreWrapper_numLinkActionOccurrencesInAllContexts__block_invoke_2(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (int64_t)numCandidateOccurrencesInAnchorContextForCandidate:(id)a3 anchor:(id)a4
{
  id v6;
  id v7;
  _ATXDataStore *store;
  id v9;
  id v10;
  int64_t v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  store = self->_store;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __92__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidate_anchor___block_invoke;
  v13[3] = &unk_1E82E2C08;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  v16 = &v17;
  -[_ATXDataStore _doSync:](store, "_doSync:", v13);
  v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __92__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidate_anchor___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidate_anchor___block_invoke_2;
  v10[3] = &unk_1E82DF220;
  v11 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v12 = v4;
  v13 = v5;
  v9[2] = __92__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidate_anchor___block_invoke_3;
  v9[3] = &unk_1E82DCC00;
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[4] = *(_QWORD *)(a1 + 56);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __92__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidate_anchor___block_invoke_4;
  v7[3] = &unk_1E82DCC28;
  v8 = v6;
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT COUNT(DISTINCT candidateOccurrenceId) FROM anchorModelTrainingData INNER JOIN anchorOccurrence ON anchorModelTrainingData.anchorType=anchorOccurrence.anchorType AND anchorModelTrainingData.anchorDate=anchorOccurrence.anchorDate WHERE candidateId=:candidateId AND candidatePerformed=1 AND anchorOccurrence.anchorType=:anchorType AND anchorEventIdentifier LIKE :anchorEventIdentifier AND secondsSinceAnchor<:secondsSinceAnchor AND anchorOccurrence.anchorDate>:oldestAllowedAnchorDate"), v10, v9, v7);

}

void __92__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidate_anchor___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  double v10;
  id v11;

  v3 = *(_QWORD *)(a1 + 32);
  v11 = a2;
  objc_msgSend(v11, "bindNamedParam:toNSString:", ":candidateId", v3);
  objc_msgSend(*(id *)(a1 + 40), "anchorTypeString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bindNamedParam:toNSString:", ":anchorType", v4);

  objc_msgSend(*(id *)(a1 + 40), "anchorEventIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("%");
  objc_msgSend(v11, "bindNamedParam:toNSString:", ":anchorEventIdentifier", v7);

  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend((id)objc_opt_class(), "secondsOfInfluence");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bindNamedParam:toInteger:", ":secondsSinceAnchor", objc_msgSend(v9, "integerValue"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "timeIntervalSince1970");
  objc_msgSend(v11, "bindNamedParam:toInt64:", ":oldestAllowedAnchorDate", (uint64_t)v10);

}

uint64_t __92__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidate_anchor___block_invoke_3(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

uint64_t __92__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidate_anchor___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __92__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidate_anchor___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (int64_t)numCandidateOccurrencesInAnchorContextForCandidateType:(id)a3 anchor:(id)a4
{
  id v6;
  id v7;
  _ATXDataStore *store;
  id v9;
  id v10;
  int64_t v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  store = self->_store;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __96__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidateType_anchor___block_invoke;
  v13[3] = &unk_1E82E2C08;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  v16 = &v17;
  -[_ATXDataStore _doSync:](store, "_doSync:", v13);
  v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __96__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidateType_anchor___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidateType_anchor___block_invoke_2;
  v10[3] = &unk_1E82DF220;
  v11 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v12 = v4;
  v13 = v5;
  v9[2] = __96__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidateType_anchor___block_invoke_3;
  v9[3] = &unk_1E82DCC00;
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[4] = *(_QWORD *)(a1 + 56);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __96__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidateType_anchor___block_invoke_4;
  v7[3] = &unk_1E82DCC28;
  v8 = v6;
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT COUNT(DISTINCT candidateOccurrenceId) FROM anchorModelTrainingData INNER JOIN anchorOccurrence ON anchorModelTrainingData.anchorType=anchorOccurrence.anchorType AND anchorModelTrainingData.anchorDate=anchorOccurrence.anchorDate WHERE candidateType=:candidateType AND candidatePerformed=1 AND anchorOccurrence.anchorType=:anchorType AND anchorEventIdentifier LIKE :anchorEventIdentifier AND secondsSinceAnchor<:secondsSinceAnchor AND anchorOccurrence.anchorDate>:oldestAllowedAnchorDate"), v10, v9, v7);

}

void __96__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidateType_anchor___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  double v10;
  id v11;

  v3 = *(_QWORD *)(a1 + 32);
  v11 = a2;
  objc_msgSend(v11, "bindNamedParam:toNSString:", ":candidateType", v3);
  objc_msgSend(*(id *)(a1 + 40), "anchorTypeString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bindNamedParam:toNSString:", ":anchorType", v4);

  objc_msgSend(*(id *)(a1 + 40), "anchorEventIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("%");
  objc_msgSend(v11, "bindNamedParam:toNSString:", ":anchorEventIdentifier", v7);

  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend((id)objc_opt_class(), "secondsOfInfluence");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bindNamedParam:toInteger:", ":secondsSinceAnchor", objc_msgSend(v9, "integerValue"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "timeIntervalSince1970");
  objc_msgSend(v11, "bindNamedParam:toInt64:", ":oldestAllowedAnchorDate", (uint64_t)v10);

}

uint64_t __96__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidateType_anchor___block_invoke_3(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

uint64_t __96__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidateType_anchor___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __96__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidateType_anchor___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)uniqueCandidateIdsThatOccurredAfterAnchor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[ATXAnchorModelDataStoreWrapper uniqueCandidateIdsThatOccurredAfterAnchor:candidateType:](self, "uniqueCandidateIdsThatOccurredAfterAnchor:candidateType:", v4, CFSTR("action"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelDataStoreWrapper uniqueCandidateIdsThatOccurredAfterAnchor:candidateType:](self, "uniqueCandidateIdsThatOccurredAfterAnchor:candidateType:", v4, CFSTR("app"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelDataStoreWrapper uniqueCandidateIdsThatOccurredAfterAnchor:candidateType:](self, "uniqueCandidateIdsThatOccurredAfterAnchor:candidateType:", v4, CFSTR("mode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelDataStoreWrapper uniqueCandidateIdsThatOccurredAfterAnchor:candidateType:](self, "uniqueCandidateIdsThatOccurredAfterAnchor:candidateType:", v4, CFSTR("linkaction"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v10);

  objc_msgSend(v7, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v11);

  objc_msgSend(v8, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v12);

  objc_msgSend(v9, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v13);

  return v5;
}

- (id)uniqueCandidateIdsThatOccurredAfterAnchor:(id)a3 candidateType:(id)a4
{
  return -[ATXAnchorModelDataStoreWrapper uniqueCandidateIdsThatOccurredAfterAnchor:candidateType:minOccurrences:](self, "uniqueCandidateIdsThatOccurredAfterAnchor:candidateType:minOccurrences:", a3, a4, 3);
}

- (id)uniqueCandidateIdsThatOccurredAfterAnchor:(id)a3 candidateType:(id)a4 minOccurrences:(int64_t)a5
{
  id v8;
  id v9;
  _ATXDataStore *store;
  id v11;
  id v12;
  id v13;
  _QWORD v15[5];
  __CFString *v16;
  id v17;
  id v18;
  uint64_t *v19;
  int64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__94;
  v25 = __Block_byref_object_dispose__94;
  v26 = (id)objc_opt_new();
  store = self->_store;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __105__ATXAnchorModelDataStoreWrapper_uniqueCandidateIdsThatOccurredAfterAnchor_candidateType_minOccurrences___block_invoke;
  v15[3] = &unk_1E82E8AC8;
  v15[4] = self;
  v16 = CFSTR("SELECT candidateId FROM anchorModelTrainingData INNER JOIN anchorOccurrence ON anchorModelTrainingData.anchorType=anchorOccurrence.anchorType AND anchorModelTrainingData.anchorDate=anchorOccurrence.anchorDate WHERE anchorModelTrainingData.anchorType=:anchorType AND anchorOccurrence.anchorEventIdentifier LIKE :anchorEventIdentifier AND candidatePerformed=1 AND secondsSinceAnchor<:secondsSinceAnchor AND candidateType=:candidateType AND anchorOccurrence.anchorDate>:anchorDate GROUP BY candidateId HAVING COUNT(candidateId) >= :minOccurrences");
  v11 = v8;
  v17 = v11;
  v12 = v9;
  v19 = &v21;
  v20 = a5;
  v18 = v12;
  -[_ATXDataStore _doSync:](store, "_doSync:", v15);
  v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __105__ATXAnchorModelDataStoreWrapper_uniqueCandidateIdsThatOccurredAfterAnchor_candidateType_minOccurrences___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __105__ATXAnchorModelDataStoreWrapper_uniqueCandidateIdsThatOccurredAfterAnchor_candidateType_minOccurrences___block_invoke_2;
  v11[3] = &unk_1E82DE9F8;
  v4 = *(_QWORD *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v6;
  v7 = *(_QWORD *)(a1 + 64);
  v15 = *(_QWORD *)(a1 + 72);
  v10[2] = __105__ATXAnchorModelDataStoreWrapper_uniqueCandidateIdsThatOccurredAfterAnchor_candidateType_minOccurrences___block_invoke_3;
  v10[3] = &unk_1E82DCC00;
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[4] = v7;
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __105__ATXAnchorModelDataStoreWrapper_uniqueCandidateIdsThatOccurredAfterAnchor_candidateType_minOccurrences___block_invoke_4;
  v8[3] = &unk_1E82DCC28;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", v4, v11, v10, v8);

}

void __105__ATXAnchorModelDataStoreWrapper_uniqueCandidateIdsThatOccurredAfterAnchor_candidateType_minOccurrences___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  double v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v11 = a2;
  objc_msgSend(v3, "anchorTypeString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bindNamedParam:toNSString:", ":anchorType", v4);

  objc_msgSend(*(id *)(a1 + 32), "anchorEventIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("%");
  objc_msgSend(v11, "bindNamedParam:toNSString:", ":anchorEventIdentifier", v7);

  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend((id)objc_opt_class(), "secondsOfInfluence");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bindNamedParam:toInteger:", ":secondsSinceAnchor", objc_msgSend(v9, "integerValue"));

  objc_msgSend(v11, "bindNamedParam:toNSString:", ":candidateType", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "timeIntervalSince1970");
  objc_msgSend(v11, "bindNamedParam:toInt64:", ":anchorDate", (uint64_t)v10);
  objc_msgSend(v11, "bindNamedParam:toInteger:", ":minOccurrences", *(_QWORD *)(a1 + 56));

}

uint64_t __105__ATXAnchorModelDataStoreWrapper_uniqueCandidateIdsThatOccurredAfterAnchor_candidateType_minOccurrences___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "getNSStringForColumn:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return *MEMORY[0x1E0D81780];
}

uint64_t __105__ATXAnchorModelDataStoreWrapper_uniqueCandidateIdsThatOccurredAfterAnchor_candidateType_minOccurrences___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __105__ATXAnchorModelDataStoreWrapper_uniqueCandidateIdsThatOccurredAfterAnchor_candidateType_minOccurrences___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)secondsAfterAnchorWhenCandidateOccurredForAnchor:(id)a3 candidateId:(id)a4 onlyConsiderFirstOccurrencePerAnchor:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  const __CFString *v11;
  _ATXDataStore *store;
  id v13;
  id v14;
  id v15;
  _QWORD v17[5];
  __CFString *v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__94;
  v26 = __Block_byref_object_dispose__94;
  v10 = (void *)objc_opt_new();
  v11 = CFSTR("SELECT secondsSinceAnchor FROM anchorModelTrainingData INNER JOIN anchorOccurrence ON anchorOccurrence.anchorType = anchorModelTrainingData.anchorType AND anchorOccurrence.anchorDate = anchorModelTrainingData.anchorDate WHERE candidateId=:candidateId AND candidatePerformed=1 AND anchorOccurrence.anchorType=:anchorType AND anchorOccurrence.anchorEventIdentifier LIKE :anchorEventIdentifier AND secondsSinceAnchor<:secondsSinceAnchor AND anchorOccurrence.anchorDate>:oldestAllowedAnchorDate ORDER BY secondsSinceAnchor ASC");
  v27 = v10;
  if (v5)
    v11 = CFSTR("SELECT secondsSinceAnchor FROM anchorModelTrainingData INNER JOIN anchorOccurrence ON anchorOccurrence.anchorType = anchorModelTrainingData.anchorType AND anchorOccurrence.anchorDate = anchorModelTrainingData.anchorDate WHERE candidateId=:candidateId AND candidatePerformed=1 AND anchorOccurrence.anchorType=:anchorType AND anchorOccurrence.anchorEventIdentifier LIKE :anchorEventIdentifier AND secondsSinceAnchor<:secondsSinceAnchor AND anchorOccurrence.anchorDate>:oldestAllowedAnchorDate GROUP BY anchorOccurrence.anchorDate ORDER BY secondsSinceAnchor ASC");
  store = self->_store;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __132__ATXAnchorModelDataStoreWrapper_secondsAfterAnchorWhenCandidateOccurredForAnchor_candidateId_onlyConsiderFirstOccurrencePerAnchor___block_invoke;
  v17[3] = &unk_1E82E2ED0;
  v17[4] = self;
  v18 = (__CFString *)v11;
  v13 = v9;
  v19 = v13;
  v14 = v8;
  v20 = v14;
  v21 = &v22;
  -[_ATXDataStore _doSync:](store, "_doSync:", v17);
  v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v15;
}

void __132__ATXAnchorModelDataStoreWrapper_secondsAfterAnchorWhenCandidateOccurredForAnchor_candidateId_onlyConsiderFirstOccurrencePerAnchor___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __132__ATXAnchorModelDataStoreWrapper_secondsAfterAnchorWhenCandidateOccurredForAnchor_candidateId_onlyConsiderFirstOccurrencePerAnchor___block_invoke_2;
  v10[3] = &unk_1E82DF220;
  v4 = *(_QWORD *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v6;
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __132__ATXAnchorModelDataStoreWrapper_secondsAfterAnchorWhenCandidateOccurredForAnchor_candidateId_onlyConsiderFirstOccurrencePerAnchor___block_invoke_3;
  v9[3] = &unk_1E82DCC00;
  v9[4] = *(_QWORD *)(a1 + 64);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __132__ATXAnchorModelDataStoreWrapper_secondsAfterAnchorWhenCandidateOccurredForAnchor_candidateId_onlyConsiderFirstOccurrencePerAnchor___block_invoke_4;
  v7[3] = &unk_1E82DCC28;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", v4, v10, v9, v7);

}

void __132__ATXAnchorModelDataStoreWrapper_secondsAfterAnchorWhenCandidateOccurredForAnchor_candidateId_onlyConsiderFirstOccurrencePerAnchor___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  double v10;
  id v11;

  v3 = *(_QWORD *)(a1 + 32);
  v11 = a2;
  objc_msgSend(v11, "bindNamedParam:toNSString:", ":candidateId", v3);
  objc_msgSend(*(id *)(a1 + 40), "anchorTypeString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bindNamedParam:toNSString:", ":anchorType", v4);

  objc_msgSend(*(id *)(a1 + 40), "anchorEventIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("%");
  objc_msgSend(v11, "bindNamedParam:toNSString:", ":anchorEventIdentifier", v7);

  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend((id)objc_opt_class(), "secondsOfInfluence");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bindNamedParam:toInteger:", ":secondsSinceAnchor", objc_msgSend(v9, "integerValue"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "timeIntervalSince1970");
  objc_msgSend(v11, "bindNamedParam:toInt64:", ":oldestAllowedAnchorDate", (uint64_t)v10);

}

uint64_t __132__ATXAnchorModelDataStoreWrapper_secondsAfterAnchorWhenCandidateOccurredForAnchor_candidateId_onlyConsiderFirstOccurrencePerAnchor___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_msgSend(a2, "getIntegerForColumn:", 0);
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3 & ~(v3 >> 63));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  return *MEMORY[0x1E0D81780];
}

uint64_t __132__ATXAnchorModelDataStoreWrapper_secondsAfterAnchorWhenCandidateOccurredForAnchor_candidateId_onlyConsiderFirstOccurrencePerAnchor___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __132__ATXAnchorModelDataStoreWrapper_secondsAfterAnchorWhenCandidateOccurredForAnchor_candidateId_onlyConsiderFirstOccurrencePerAnchor___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)scoredActionFromAnchorModelPrediction:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  ATXActionPredictionContainer *v15;
  double v16;
  ATXActionPredictionContainer *v17;
  void *v18;
  NSObject *v19;

  v4 = a3;
  objc_msgSend(v4, "candidateType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("action"));

  if (v6)
  {
    objc_msgSend(v4, "candidateId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXAnchorModelDataStoreWrapper actionDetailsFromActionCandidateId:](ATXAnchorModelDataStoreWrapper, "actionDetailsFromActionCandidateId:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_msgSend(v8, "paramHash");
      objc_msgSend(v4, "candidateId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[ATXAnchorModelDataStoreWrapper latestAlogIdForCandidateId:](self, "latestAlogIdForCandidateId:", v10);

      -[ATXAnchorModelDataStoreWrapper minSlotResolutionParametersFromALogId:paramHash:](self, "minSlotResolutionParametersFromALogId:paramHash:", v11, v9);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v4, "candidateId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXAnchorModelDataStoreWrapper actionKeyFromActionCandidateId:](ATXAnchorModelDataStoreWrapper, "actionKeyFromActionCandidateId:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v15 = [ATXActionPredictionContainer alloc];
          objc_msgSend(v4, "score");
          *(float *)&v16 = v16;
          v17 = -[ATXActionPredictionContainer initWithMinimalSlotResolutionParameters:score:actionKey:](v15, "initWithMinimalSlotResolutionParameters:score:actionKey:", v12, v14, v16);
          -[ATXActionPredictionContainer scoredAction](v17, "scoredAction");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          __atxlog_handle_anchor();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
            -[ATXAnchorModelDataStoreWrapper scoredActionFromAnchorModelPrediction:].cold.2(v4, v19);

          v18 = 0;
        }

        goto LABEL_14;
      }
    }
    else
    {
      __atxlog_handle_anchor();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[ATXAnchorModelDataStoreWrapper scoredActionFromAnchorModelPrediction:].cold.1(v4, v12);
    }
    v18 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v18 = 0;
LABEL_15:

  return v18;
}

- (int64_t)latestAlogIdForCandidateId:(id)a3
{
  id v4;
  _ATXDataStore *store;
  id v6;
  int64_t v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  store = self->_store;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__ATXAnchorModelDataStoreWrapper_latestAlogIdForCandidateId___block_invoke;
  v9[3] = &unk_1E82DCC50;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[_ATXDataStore _doSync:](store, "_doSync:", v9);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __61__ATXAnchorModelDataStoreWrapper_latestAlogIdForCandidateId___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__ATXAnchorModelDataStoreWrapper_latestAlogIdForCandidateId___block_invoke_2;
  v8[3] = &unk_1E82DCBD8;
  v9 = *(id *)(a1 + 40);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __61__ATXAnchorModelDataStoreWrapper_latestAlogIdForCandidateId___block_invoke_3;
  v7[3] = &unk_1E82DCC00;
  v4 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 48);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __61__ATXAnchorModelDataStoreWrapper_latestAlogIdForCandidateId___block_invoke_4;
  v5[3] = &unk_1E82DCC28;
  v6 = v4;
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT candidateOccurrenceId FROM anchorModelTrainingData WHERE candidateId=? AND candidatePerformed=1 ORDER BY ID DESC"), v8, v7, v5);

}

uint64_t __61__ATXAnchorModelDataStoreWrapper_latestAlogIdForCandidateId___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __61__ATXAnchorModelDataStoreWrapper_latestAlogIdForCandidateId___block_invoke_3(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

uint64_t __61__ATXAnchorModelDataStoreWrapper_latestAlogIdForCandidateId___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __61__ATXAnchorModelDataStoreWrapper_latestAlogIdForCandidateId___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)minSlotResolutionParametersFromALogId:(int64_t)a3 paramHash:(int64_t)a4
{
  _ATXDataStore *store;
  id v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__94;
  v12 = __Block_byref_object_dispose__94;
  v13 = 0;
  store = self->_store;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__ATXAnchorModelDataStoreWrapper_minSlotResolutionParametersFromALogId_paramHash___block_invoke;
  v7[3] = &unk_1E82DEF00;
  v7[6] = a3;
  v7[7] = a4;
  v7[4] = self;
  v7[5] = &v8;
  -[_ATXDataStore _doSync:](store, "_doSync:", v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __82__ATXAnchorModelDataStoreWrapper_minSlotResolutionParametersFromALogId_paramHash___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  _QWORD v5[5];
  _QWORD v6[7];
  _QWORD v7[4];
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1[4] + 8), "db");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__ATXAnchorModelDataStoreWrapper_minSlotResolutionParametersFromALogId_paramHash___block_invoke_2;
  v7[3] = &__block_descriptor_48_e29_v16__0___PASSqliteStatement_8l;
  v2 = a1[7];
  v3 = a1[5];
  v8 = a1[6];
  v9 = v2;
  v5[4] = v8;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__ATXAnchorModelDataStoreWrapper_minSlotResolutionParametersFromALogId_paramHash___block_invoke_3;
  v6[3] = &unk_1E82E8AF0;
  v6[4] = v3;
  v6[5] = v8;
  v6[6] = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__ATXAnchorModelDataStoreWrapper_minSlotResolutionParametersFromALogId_paramHash___block_invoke_293;
  v5[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT uuid, slotHash, paramCount FROM slotSetKey WHERE alogId=? AND paramHash=? LIMIT 1"), v7, v6, v5);

}

void __82__ATXAnchorModelDataStoreWrapper_minSlotResolutionParametersFromALogId_paramHash___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindParam:toInt64:", 1, v3);
  objc_msgSend(v4, "bindParam:toInt64:", 2, *(_QWORD *)(a1 + 40));

}

uint64_t __82__ATXAnchorModelDataStoreWrapper_minSlotResolutionParametersFromALogId_paramHash___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 *v22;
  ATXMinimalSlotResolutionParameters *v24;

  v3 = a2;
  objc_msgSend(v3, "getNSDataForColumn:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length") == 16)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v4), "bytes"));
    v6 = objc_msgSend(v3, "getInt64ForColumn:", 1);
    v7 = objc_msgSend(v3, "getInt64ForColumn:", 2);
    v24 = [ATXMinimalSlotResolutionParameters alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[ATXMinimalSlotResolutionParameters initWithParameterHash:slotHash:uuid:paramCount:](v24, "initWithParameterHash:slotHash:uuid:paramCount:", v9, v11, v5, objc_msgSend(v12, "unsignedIntegerValue"));
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  else
  {
    __atxlog_handle_anchor();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __82__ATXAnchorModelDataStoreWrapper_minSlotResolutionParametersFromALogId_paramHash___block_invoke_3_cold_1(a1, v5, v16, v17, v18, v19, v20, v21);
  }

  v22 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v22;
}

uint64_t __82__ATXAnchorModelDataStoreWrapper_minSlotResolutionParametersFromALogId_paramHash___block_invoke_293(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __82__ATXAnchorModelDataStoreWrapper_minSlotResolutionParametersFromALogId_paramHash___block_invoke_293_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (int64_t)numCandidateIdOccurrencesInJointAnchorContext:(id)a3 anchor:(id)a4 anchorMetadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  _ATXDataStore *store;
  __CFString *v15;
  id v16;
  id v17;
  id v18;
  int64_t v19;
  _QWORD v21[5];
  __CFString *v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  objc_msgSend(v10, "locationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("SELECT COUNT(DISTINCT candidateOccurrenceId) FROM anchorModelTrainingData INNER JOIN anchorOccurrence ON anchorOccurrence.anchorType = anchorModelTrainingData.anchorType AND anchorOccurrence.anchorDate = anchorModelTrainingData.anchorDate WHERE candidateId=:candidateId AND candidatePerformed=1 AND anchorModelTrainingData.anchorType=:anchorType AND anchorOccurrence.anchorEventIdentifier LIKE :anchorEventIdentifier AND secondsSinceAnchor<:secondsSinceAnchor AND anchorOccurrence.anchorDate>:oldestAllowedAnchorDate AND anchorLocalHour=:anchorLocalHour AND anchorLocalDoW=:anchorLocalDoW AND anchorLocation=:anchorLocation");
  if (!v11)
    v12 = CFSTR("SELECT COUNT(DISTINCT candidateOccurrenceId) FROM anchorModelTrainingData INNER JOIN anchorOccurrence ON anchorOccurrence.anchorType = anchorModelTrainingData.anchorType AND anchorOccurrence.anchorDate = anchorModelTrainingData.anchorDate WHERE candidateId=:candidateId AND candidatePerformed=1 AND anchorModelTrainingData.anchorType=:anchorType AND anchorOccurrence.anchorEventIdentifier LIKE :anchorEventIdentifier AND secondsSinceAnchor<:secondsSinceAnchor AND anchorOccurrence.anchorDate>:oldestAllowedAnchorDate AND anchorLocalHour=:anchorLocalHour AND anchorLocalDoW=:anchorLocalDoW AND anchorLocation IS NULL");
  v13 = v12;

  store = self->_store;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __102__ATXAnchorModelDataStoreWrapper_numCandidateIdOccurrencesInJointAnchorContext_anchor_anchorMetadata___block_invoke;
  v21[3] = &unk_1E82E2EA8;
  v21[4] = self;
  v15 = v13;
  v22 = v15;
  v16 = v8;
  v23 = v16;
  v17 = v9;
  v24 = v17;
  v18 = v10;
  v25 = v18;
  v26 = &v27;
  -[_ATXDataStore _doSync:](store, "_doSync:", v21);
  v19 = v28[3];

  _Block_object_dispose(&v27, 8);
  return v19;
}

void __102__ATXAnchorModelDataStoreWrapper_numCandidateIdOccurrencesInJointAnchorContext_anchor_anchorMetadata___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __102__ATXAnchorModelDataStoreWrapper_numCandidateIdOccurrencesInJointAnchorContext_anchor_anchorMetadata___block_invoke_2;
  v10[3] = &unk_1E82E2E80;
  v4 = *(_QWORD *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v6;
  v14 = *(id *)(a1 + 64);
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __102__ATXAnchorModelDataStoreWrapper_numCandidateIdOccurrencesInJointAnchorContext_anchor_anchorMetadata___block_invoke_3;
  v9[3] = &unk_1E82DCC00;
  v9[4] = *(_QWORD *)(a1 + 72);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __102__ATXAnchorModelDataStoreWrapper_numCandidateIdOccurrencesInJointAnchorContext_anchor_anchorMetadata___block_invoke_4;
  v7[3] = &unk_1E82DCC28;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", v4, v10, v9, v7);

}

void __102__ATXAnchorModelDataStoreWrapper_numCandidateIdOccurrencesInJointAnchorContext_anchor_anchorMetadata___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "bindNamedParam:toNSString:", ":candidateId", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "anchorTypeString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bindNamedParam:toNSString:", ":anchorType", v3);

  objc_msgSend(*(id *)(a1 + 40), "anchorEventIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("%");
  objc_msgSend(v12, "bindNamedParam:toNSString:", ":anchorEventIdentifier", v6);

  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend((id)objc_opt_class(), "secondsOfInfluence");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bindNamedParam:toInteger:", ":secondsSinceAnchor", objc_msgSend(v8, "integerValue"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "timeIntervalSince1970");
  objc_msgSend(v12, "bindNamedParam:toInt64:", ":oldestAllowedAnchorDate", (uint64_t)v9);
  objc_msgSend(v12, "bindNamedParam:toInteger:", ":anchorLocalHour", objc_msgSend(*(id *)(a1 + 56), "hourOfDay"));
  objc_msgSend(v12, "bindNamedParam:toInteger:", ":anchorLocalDoW", objc_msgSend((id)objc_opt_class(), "dayOfWeekIntegerFromATXAnchorModelPBDayOfWeek:", objc_msgSend(*(id *)(a1 + 56), "dayOfWeek")));
  objc_msgSend(*(id *)(a1 + 56), "locationIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 56), "locationIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bindNamedParam:toNSString:", ":anchorLocation", v11);

  }
}

uint64_t __102__ATXAnchorModelDataStoreWrapper_numCandidateIdOccurrencesInJointAnchorContext_anchor_anchorMetadata___block_invoke_3(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

uint64_t __102__ATXAnchorModelDataStoreWrapper_numCandidateIdOccurrencesInJointAnchorContext_anchor_anchorMetadata___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __102__ATXAnchorModelDataStoreWrapper_numCandidateIdOccurrencesInJointAnchorContext_anchor_anchorMetadata___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)trainingDataForCandidate:(id)a3 anchor:(id)a4 replacementStringForNilStringValues:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _ATXDataStore *store;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelDataStoreWrapper dateOfFirstPositiveCandidateOccurrence:anchor:startDate:limit:](self, "dateOfFirstPositiveCandidateOccurrence:anchor:startDate:limit:", v8, v9, v12, 30);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  store = self->_store;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __102__ATXAnchorModelDataStoreWrapper_trainingDataForCandidate_anchor_replacementStringForNilStringValues___block_invoke;
  v23[3] = &unk_1E82E2AC8;
  v23[4] = self;
  v24 = v8;
  v25 = v9;
  v26 = v13;
  v27 = v10;
  v15 = v11;
  v28 = v15;
  v16 = v10;
  v17 = v13;
  v18 = v9;
  v19 = v8;
  -[_ATXDataStore _doSync:](store, "_doSync:", v23);
  v20 = v28;
  v21 = v15;

  return v21;
}

void __102__ATXAnchorModelDataStoreWrapper_trainingDataForCandidate_anchor_replacementStringForNilStringValues___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __102__ATXAnchorModelDataStoreWrapper_trainingDataForCandidate_anchor_replacementStringForNilStringValues___block_invoke_2;
  v9[3] = &unk_1E82DF220;
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __102__ATXAnchorModelDataStoreWrapper_trainingDataForCandidate_anchor_replacementStringForNilStringValues___block_invoke_3;
  v6[3] = &unk_1E82DF040;
  v7 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __102__ATXAnchorModelDataStoreWrapper_trainingDataForCandidate_anchor_replacementStringForNilStringValues___block_invoke_4;
  v4[3] = &unk_1E82DCC28;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT candidateOccurrencesInLast12Hours, candidateOccurrencesInLast24Hours, candidateOccurrencesInLast48Hours, candidateOccurrencesInLast7Days, candidateOccurrencesInLast14Days, candidateOccurrencesInLast28Days, anchorLocalHour, anchorLocalDoW, anchorLocalIsWeekend, anchorLocation, anchorEventIdentifier, candidatePerformed FROM anchorModelTrainingData INNER JOIN anchorOccurrence ON anchorModelTrainingData.anchorType = anchorOccurrence.anchorType AND anchorModelTrainingData.anchorDate = anchorOccurrence.anchorDate WHERE candidateId=:candidateId AND anchorModelTrainingData.anchorType=:anchorType AND anchorOccurrence.anchorEventIdentifier LIKE :anchorEventIdentifier AND anchorOccurrence.anchorDate >= :dateOfFirstPositiveCandidateOccurrence GROUP BY anchorModelTrainingData.anchorDate ORDER BY anchorModelTrainingData.anchorDate DESC LIMIT 30"), v9, v6, v4);

}

void __102__ATXAnchorModelDataStoreWrapper_trainingDataForCandidate_anchor_replacementStringForNilStringValues___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  double v8;
  id v9;

  v3 = *(_QWORD *)(a1 + 32);
  v9 = a2;
  objc_msgSend(v9, "bindNamedParam:toNSString:", ":candidateId", v3);
  objc_msgSend(*(id *)(a1 + 40), "anchorTypeString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bindNamedParam:toNSString:", ":anchorType", v4);

  objc_msgSend(*(id *)(a1 + 40), "anchorEventIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("%");
  objc_msgSend(v9, "bindNamedParam:toNSString:", ":anchorEventIdentifier", v7);

  objc_msgSend(*(id *)(a1 + 48), "timeIntervalSince1970");
  objc_msgSend(v9, "bindNamedParam:toInt64:", ":dateOfFirstPositiveCandidateOccurrence", (uint64_t)v8);

}

uint64_t __102__ATXAnchorModelDataStoreWrapper_trainingDataForCandidate_anchor_replacementStringForNilStringValues___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
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
  unsigned __int8 *v30;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumn:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("candidateOccurrencesInLast12Hours"));

  v6 = objc_msgSend(v3, "getIntegerForColumn:", 0);
  v7 = MEMORY[0x1E0C9AAA0];
  v8 = MEMORY[0x1E0C9AAB0];
  if (v6 <= 0)
    v9 = MEMORY[0x1E0C9AAA0];
  else
    v9 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("candidateOccurredInLast12Hours"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumn:", 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("candidateOccurrencesInLast24Hours"));

  if (objc_msgSend(v3, "getIntegerForColumn:", 1) <= 0)
    v11 = v7;
  else
    v11 = v8;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("candidateOccurredInLast24Hours"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumn:", 2));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("candidateOccurrencesInLast48Hours"));

  if (objc_msgSend(v3, "getIntegerForColumn:", 2) <= 0)
    v13 = v7;
  else
    v13 = v8;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("candidateOccurredInLast48Hours"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumn:", 3));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("candidateOccurrencesInLast7Days"));

  if (objc_msgSend(v3, "getIntegerForColumn:", 3) <= 0)
    v15 = v7;
  else
    v15 = v8;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("candidateOccurredInLast7Days"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumn:", 4));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("candidateOccurrencesInLast14Days"));

  if (objc_msgSend(v3, "getIntegerForColumn:", 4) <= 0)
    v17 = v7;
  else
    v17 = v8;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("candidateOccurredInLast14Days"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumn:", 5));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("candidateOccurrencesInLast28Days"));

  if (objc_msgSend(v3, "getIntegerForColumn:", 5) <= 0)
    v19 = v7;
  else
    v19 = v8;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("candidateOccurredInLast28Days"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumn:", 6));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("anchorLocalHour"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumn:", 7));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("anchorLocalDoW"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumn:", 8));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("anchorLocalIsWeekend"));

  objc_msgSend(v3, "getNSStringForColumn:", 9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (!v23)
    v24 = *(void **)(a1 + 32);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("anchorLocation"));

  objc_msgSend(v3, "getNSStringForColumn:", 10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!v25)
    v26 = *(void **)(a1 + 32);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("anchorEventIdentifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumn:", 11));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("candidatePerformed"));

  v28 = *(void **)(a1 + 40);
  v29 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v28, "addObject:", v29);

  v30 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  return *v30;
}

uint64_t __102__ATXAnchorModelDataStoreWrapper_trainingDataForCandidate_anchor_replacementStringForNilStringValues___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __102__ATXAnchorModelDataStoreWrapper_trainingDataForCandidate_anchor_replacementStringForNilStringValues___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)dateOfFirstPositiveCandidateOccurrence:(id)a3 anchor:(id)a4 startDate:(id)a5 limit:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  _ATXDataStore *store;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[5];
  __CFString *v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  id *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v27 = 0;
  v28 = (id *)&v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__94;
  v31 = __Block_byref_object_dispose__94;
  v32 = 0;
  store = self->_store;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __96__ATXAnchorModelDataStoreWrapper_dateOfFirstPositiveCandidateOccurrence_anchor_startDate_limit___block_invoke;
  v20[3] = &unk_1E82E2F20;
  v20[4] = self;
  v21 = CFSTR("SELECT MIN(dates)     FROM(        SELECT anchorOccurrence.anchorDate as dates, candidatePerformed as candidatePerformed         FROM anchorModelTrainingData         INNER JOIN anchorOccurrence ON anchorModelTrainingData.anchorType = anchorOccurrence.anchorType AND anchorModelTrainingData.anchorDate = anchorOccurrence.anchorDate         WHERE candidateId=:candidateId         AND anchorModelTrainingData.anchorType=:anchorType         AND anchorOccurrence.anchorEventIdentifier LIKE :anchorEventIdentifier         AND anchorOccurrence.anchorDate >= :startDateTimeInterval         GROUP BY anchorModelTrainingData.anchorDate         ORDER BY anchorModelTrainingData.anchorDate DESC LIMIT :limit        )     WHERE candidatePerformed=1");
  v14 = v10;
  v22 = v14;
  v15 = v11;
  v23 = v15;
  v16 = v12;
  v25 = &v27;
  v26 = a6;
  v24 = v16;
  -[_ATXDataStore _doSync:](store, "_doSync:", v20);
  v17 = v28[5];
  if (!v17)
  {
    objc_storeStrong(v28 + 5, a5);
    v17 = v28[5];
  }
  v18 = v17;

  _Block_object_dispose(&v27, 8);
  return v18;
}

void __96__ATXAnchorModelDataStoreWrapper_dateOfFirstPositiveCandidateOccurrence_anchor_startDate_limit___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __96__ATXAnchorModelDataStoreWrapper_dateOfFirstPositiveCandidateOccurrence_anchor_startDate_limit___block_invoke_2;
  v11[3] = &unk_1E82DE9F8;
  v4 = *(_QWORD *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v5 = *(id *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 80);
  v14 = v5;
  v15 = v6;
  v10[2] = __96__ATXAnchorModelDataStoreWrapper_dateOfFirstPositiveCandidateOccurrence_anchor_startDate_limit___block_invoke_3;
  v10[3] = &unk_1E82DCC00;
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[4] = v7;
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __96__ATXAnchorModelDataStoreWrapper_dateOfFirstPositiveCandidateOccurrence_anchor_startDate_limit___block_invoke_4;
  v8[3] = &unk_1E82DCC28;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", v4, v11, v10, v8);

}

void __96__ATXAnchorModelDataStoreWrapper_dateOfFirstPositiveCandidateOccurrence_anchor_startDate_limit___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  double v8;
  id v9;

  v3 = *(_QWORD *)(a1 + 32);
  v9 = a2;
  objc_msgSend(v9, "bindNamedParam:toNSString:", ":candidateId", v3);
  objc_msgSend(*(id *)(a1 + 40), "anchorTypeString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bindNamedParam:toNSString:", ":anchorType", v4);

  objc_msgSend(*(id *)(a1 + 40), "anchorEventIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("%");
  objc_msgSend(v9, "bindNamedParam:toNSString:", ":anchorEventIdentifier", v7);

  objc_msgSend(*(id *)(a1 + 48), "timeIntervalSince1970");
  objc_msgSend(v9, "bindNamedParam:toInt64:", ":startDateTimeInterval", (uint64_t)v8);
  objc_msgSend(v9, "bindNamedParam:toInteger:", ":limit", *(_QWORD *)(a1 + 56));

}

uint64_t __96__ATXAnchorModelDataStoreWrapper_dateOfFirstPositiveCandidateOccurrence_anchor_startDate_limit___block_invoke_3(uint64_t a1, void *a2)
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = (double)objc_msgSend(a2, "getIntegerForColumn:", 0);
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", v3 + -1.0);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return *MEMORY[0x1E0D81788];
}

uint64_t __96__ATXAnchorModelDataStoreWrapper_dateOfFirstPositiveCandidateOccurrence_anchor_startDate_limit___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  unsigned __int8 *v4;

  v2 = a2;
  __atxlog_handle_anchor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __102__ATXAnchorModelDataStoreWrapper_numCandidateIdOccurrencesInJointAnchorContext_anchor_anchorMetadata___block_invoke_4_cold_1();

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v4;
}

- (id)appIntentDuetEventFromCandidateId:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ATXAppIntentDuetEvent *v14;
  void *v16;
  void *v17;
  ATXAppIntentDuetEvent *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[ATXAnchorModelDataStoreWrapper actionDetailsFromActionCandidateId:](ATXAnchorModelDataStoreWrapper, "actionDetailsFromActionCandidateId:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[ATXAnchorModelDataStoreWrapper minSlotResolutionParametersFromALogId:paramHash:](self, "minSlotResolutionParametersFromALogId:paramHash:", -[ATXAnchorModelDataStoreWrapper latestAlogIdForCandidateId:](self, "latestAlogIdForCandidateId:", v6), objc_msgSend(v8, "paramHash"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = [ATXAppIntentDuetEvent alloc];
    objc_msgSend(v8, "bundleId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "actionType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v8, "paramHash"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "slotHash"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "paramCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[ATXAppIntentDuetEvent initWithBundleId:actionType:parameterHashes:slotSetHashes:paramCount:startDate:endDate:alogId:](v18, "initWithBundleId:actionType:parameterHashes:slotSetHashes:paramCount:startDate:endDate:alogId:", v17, v16, v10, v12, v13, v7, v7, &unk_1E83CDD38);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)appLaunchDuetEventFromCandidateId:(id)a3 date:(id)a4
{
  id v5;
  id v6;
  ATXAppLaunchDuetEvent *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[ATXAppLaunchDuetEvent initWithBundleId:startDate:endDate:]([ATXAppLaunchDuetEvent alloc], "initWithBundleId:startDate:endDate:", v6, v5, v5);

  return v7;
}

- (id)modeBiomeEventFromCandidateId:(id)a3 date:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "modeDetailsFromModeCandidateId:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0D02340]);
    objc_msgSend(v7, "modeUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "isStart"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithMode:starting:updateReason:semanticType:updateSource:semanticModeIdentifier:", v9, v10, 0, 0, 0, 0);

    v12 = objc_alloc(MEMORY[0x1E0D024C8]);
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    v13 = (void *)objc_msgSend(v12, "initWithEventBody:timestamp:", v11);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)linkActionBiomeEventFromCandidateId:(id)a3 date:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "linkActionDetailsFromLinkActionCandidateId:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0D44278]);
    objc_msgSend(v7, "bundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "linkAction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "linkAction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v8, "initWithBundleIdentifier:source:clientLabel:executionUUID:executionDate:action:resolvedAction:actionOutput:predictions:", v9, 0, 0, v10, v5, v11, v12, 0, MEMORY[0x1E0C9AA60]);

    v14 = objc_alloc(MEMORY[0x1E0D024C8]);
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    v15 = (void *)objc_msgSend(v14, "initWithEventBody:timestamp:", v13);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)appIntentDuetEventsFromCandidateIds:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        -[ATXAnchorModelDataStoreWrapper appIntentDuetEventFromCandidateId:date:](self, "appIntentDuetEventFromCandidateId:date:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), v7, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)appLaunchDuetEventsFromCandidateIds:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        -[ATXAnchorModelDataStoreWrapper appLaunchDuetEventFromCandidateId:date:](self, "appLaunchDuetEventFromCandidateId:date:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), v7, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)modeBiomeEventsFromCandidateIds:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        -[ATXAnchorModelDataStoreWrapper modeBiomeEventFromCandidateId:date:](self, "modeBiomeEventFromCandidateId:date:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), v7, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)linkActionBiomeEventsFromCandidateIds:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        -[ATXAnchorModelDataStoreWrapper linkActionBiomeEventFromCandidateId:date:](self, "linkActionBiomeEventFromCandidateId:date:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), v7, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

+ (id)actionKeyFromActionCandidateId:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v3 = a3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(":"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 3)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@:%@"), v6, v7);

  }
  else
  {
    __atxlog_handle_anchor();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      +[ATXAnchorModelDataStoreWrapper actionKeyFromActionCandidateId:].cold.1();

    v8 = 0;
  }

  return v8;
}

+ (id)actionDetailsFromActionCandidateId:(id)a3
{
  id v3;
  void *v4;
  ATXAnchorModelActionDetails *v5;
  void *v6;
  void *v7;
  void *v8;
  ATXAnchorModelActionDetails *v9;
  NSObject *v10;

  v3 = a3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(":"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 3)
  {
    v5 = [ATXAnchorModelActionDetails alloc];
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ATXAnchorModelActionDetails initWithBundleId:actionType:paramHash:](v5, "initWithBundleId:actionType:paramHash:", v6, v7, objc_msgSend(v8, "longLongValue"));

  }
  else
  {
    __atxlog_handle_anchor();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      +[ATXAnchorModelDataStoreWrapper actionDetailsFromActionCandidateId:].cold.1();

    v9 = 0;
  }

  return v9;
}

+ (id)modeDetailsFromModeCandidateId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  ATXAnchorModelModeDetails *v8;
  NSObject *v9;

  v3 = a3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(":"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 2)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    v8 = -[ATXAnchorModelModeDetails initWithModeUUID:isStart:]([ATXAnchorModelModeDetails alloc], "initWithModeUUID:isStart:", v5, v7);
  }
  else
  {
    __atxlog_handle_anchor();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      +[ATXAnchorModelDataStoreWrapper modeDetailsFromModeCandidateId:].cold.1();

    v8 = 0;
  }

  return v8;
}

+ (id)linkActionDetailsFromLinkActionCandidateId:(id)a3
{
  id v3;
  void *v4;
  ATXAnchorModelLinkActionDetails *v5;
  void *v6;
  void *v7;
  void *v8;
  ATXAnchorModelLinkActionDetails *v9;
  NSObject *v10;

  v3 = a3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(":"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 3)
  {
    v5 = [ATXAnchorModelLinkActionDetails alloc];
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ATXAnchorModelLinkActionDetails initWithBundleID:actionId:linkActionEncodedString:](v5, "initWithBundleID:actionId:linkActionEncodedString:", v6, v7, v8);

  }
  else
  {
    __atxlog_handle_anchor();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      +[ATXAnchorModelDataStoreWrapper linkActionDetailsFromLinkActionCandidateId:].cold.1();

    v9 = 0;
  }

  return v9;
}

+ (id)candidateIdFromAppIntentDuetEvent:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "bundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameterHashes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@:%@:%lld"), v6, v7, objc_msgSend(v9, "longLongValue"));

  return v10;
}

- (id)candidateIdFromActionMetadata:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "appLaunchMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionKeyMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionUUIDMetadatas");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@:%@:%lld"), v7, v9, objc_msgSend(v11, "actionUUID"));

  return v12;
}

+ (id)candidateIdFromAppLaunchDuetEvent:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "bundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@"), v6);
  return v7;
}

+ (id)candidateIdFromAppLaunchBiomeEvent:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@"), v7);

  return v8;
}

+ (id)candidateIdFromModeBiomeEvent:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "eventBody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "numberWithBool:", objc_msgSend(v9, "starting"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@:%@"), v7, v10);

  return v11;
}

+ (id)candidateIdFromLinkActionBiomeEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXAnchorModelLinkActionDetails encodedStringForLinkAction:](ATXAnchorModelLinkActionDetails, "encodedStringForLinkAction:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v3, "eventBody");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "eventBody");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "action");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@:%@:%@"), v9, v12, v6);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)candidateIdFromBiomeEvent:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  __CFString *v12;
  char v13;
  NSObject *v15;

  v4 = a3;
  objc_msgSend(v4, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(a1, "candidateIdFromModeBiomeEvent:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v12 = (__CFString *)v7;
    goto LABEL_8;
  }
  objc_msgSend(v4, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();

  objc_msgSend(v4, "eventBody");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v9 & 1) != 0)
  {
    objc_msgSend(v10, "bundleID");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    v13 = objc_opt_isKindOfClass();

    if ((v13 & 1) != 0)
    {
      objc_msgSend(a1, "candidateIdFromLinkActionBiomeEvent:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    __atxlog_handle_blending();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      +[ATXAnchorModelDataStoreWrapper candidateIdFromBiomeEvent:].cold.1();

    v12 = &stru_1E82FDC98;
  }
LABEL_8:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedModeCounter, 0);
  objc_storeStrong((id *)&self->_cachedAppLaunchCounter, 0);
  objc_storeStrong((id *)&self->_numCandidateOccurrencesInAllContextsForCandidateTypeCache, 0);
  objc_storeStrong((id *)&self->_dateOfOldestAllowedCandidateOccurrenceForCandidateGeneration, 0);
  objc_storeStrong((id *)&self->_twentyOneDaysAgo, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)timestampOfMostRecentRecordedAnchorOccurrenceForAnchor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, v0, v1, "AnchorModel: ATXDATASTORE. Fetching the most recent recorded anchor event for the following anchor: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __89__ATXAnchorModelDataStoreWrapper_timestampOfMostRecentRecordedAnchorOccurrenceForAnchor___block_invoke_4_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_0_8(&dword_1C9A3B000, v0, v1, "Error fetching the most recent recorded event for the following anchor: %@. Error: %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)updateOrInsertActionTrainingSample:featurizedAction:actionOccurred:actionEngaged:anchorEvent:anchor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "AnchorModel: Trying to add action event to anchorModelTrainingData table with an actionEvent that doesn't have an associated alogId. actionEvent: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, a2, a3, "AnchorModel: ATXDATASTORE. DONE running insertion query! candidateFeatures:%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, v0, v1, "AnchorModel: ATXDATASTORE. Running insertion query! candidateFeatures:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke_30_cold_1(id *a1, id *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "objectForKeyedSubscript:", CFSTR("candidateId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a2, "anchorTypeString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_fault_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_FAULT, "Inserting action training sample for anchor model. candidateOccurrenceId must not be nil. candidateId: %@, anchorType: %@", (uint8_t *)&v7, 0x16u);

}

void __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke_72_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "error inserting training sample record: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __82__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorModelTrainingResults_anchor___block_invoke_78_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "anchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anchorTypeString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "candidateId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(*a1, "candidateClassifierType");
  v10 = 138413058;
  v11 = v7;
  v12 = 2112;
  v13 = v8;
  v14 = 2048;
  v15 = v9;
  v16 = 2112;
  v17 = a2;
  _os_log_fault_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_FAULT, "Skipping writing Anchor Model training result to ATXDataStore because of error while archiving candidate classifier. Anchor: %@, CandidateId: %@, Classifier Type: %ld. Error: %@", (uint8_t *)&v10, 0x2Au);

}

- (void)insertAnchorSuggestionOutcome:date:anchorType:anchorEventIdentifier:candidateId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "Anchor type is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)insertAnchorSuggestionOutcome:date:anchorType:anchorEventIdentifier:candidateId:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "Candidate id is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __114__ATXAnchorModelDataStoreWrapper_insertAnchorSuggestionOutcome_date_anchorType_anchorEventIdentifier_candidateId___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "error inserting anchorModelSuggestionOutcomes record: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)assignMetricsForTrainingResult:anchorType:anchorEventIdentifier:candidateId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "Anchor type is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __110__ATXAnchorModelDataStoreWrapper_assignMetricsForTrainingResult_anchorType_anchorEventIdentifier_candidateId___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "anchorModelSuggestionOutcomes returned a negative count", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __110__ATXAnchorModelDataStoreWrapper_assignMetricsForTrainingResult_anchorType_anchorEventIdentifier_candidateId___block_invoke_3_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "anchorModelSuggestionOutcomes returned an out-of-bounds outcome", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __110__ATXAnchorModelDataStoreWrapper_assignMetricsForTrainingResult_anchorType_anchorEventIdentifier_candidateId___block_invoke_111_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "error fetching anchorModelSuggestionOutcomes: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __59__ATXAnchorModelDataStoreWrapper_trainingResultsForAnchor___block_invoke_146_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_0_8(&dword_1C9A3B000, v0, v1, "Error fetching the trainingResultsForAnchor: %@. Error: %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)dateAnchorModelWasLastTrainedForAnchor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "Recovered more than 1 unique training date from the training results for the following anchor: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)linkActionCandidateFeaturesFromLinkActionEvent:actionMetadata:actionOccurred:actionEngaged:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "AnchorModel: ATXDATASTORE. Candidate ID was nil, so returning no features", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __59__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorType___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "error inserting anchor event record: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __57__ATXAnchorModelDataStoreWrapper_updateOrInsertLocation___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "error inserting location record: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __80__ATXAnchorModelDataStoreWrapper_insertAnchorOccurrence_anchor_featureMetadata___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "error inserting anchor occurrence record: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_197_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "error fetching how many samples we're going to delete the anchorOccurrence table: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2_202_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "error deleting samples from the anchorOccurrence table: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_208_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "error fetching how many samples we're going to delete the anchorModelTrainingData table: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2_213_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "error deleting samples from the anchorModelTrainingData table: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_220_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "error fetching how many outcomes we're going to delete the anchorModelSuggestionOutcomes table: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2_225_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "error deleting suggestion outcomes from the anchorModelSuggestionOutcomes table: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __69__ATXAnchorModelDataStoreWrapper_deleteSamplesForBundleIdsNotInList___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "error deleting bundleIds from anchorModelTrainingData: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __69__ATXAnchorModelDataStoreWrapper_deleteSamplesForBundleIdsNotInList___block_invoke_234_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "error fetching how many samples were deleted due to uninstalled apps: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __75__ATXAnchorModelDataStoreWrapper_historicalAnchorOccurrenceDatesForAnchor___block_invoke_4_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_0_8(&dword_1C9A3B000, v0, v1, "Error fetching the historicalAnchorOccurrenceDatesForAnchor: %@. Error: %@");
  OUTLINED_FUNCTION_1_0();
}

void __72__ATXAnchorModelDataStoreWrapper_uniqueAnchorEventIdentifiersForAnchor___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Missing anchor event identifier while in uniqueAnchorEventIdentifiersForAnchor.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __72__ATXAnchorModelDataStoreWrapper_uniqueAnchorEventIdentifiersForAnchor___block_invoke_246_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_0_8(&dword_1C9A3B000, v0, v1, "Error fetching the uniqueAnchorEventIdentifiersForAnchor: %@. Error: %@");
  OUTLINED_FUNCTION_1_0();
}

void __82__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForAnchor_candidateId___block_invoke_4_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_0_8(&dword_1C9A3B000, v0, v1, "Error fetching the numUniqueAnchorOccurrencesForAnchor: %@. Error: %@");
  OUTLINED_FUNCTION_1_0();
}

void __118__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesWithUniqueCandidateOccurrenceForGenericCandidateId_anchor___block_invoke_4_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_0_8(&dword_1C9A3B000, v0, v1, "Error fetching the numUniqueAnchorOccurrencesForCandidate: %@. Error: %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)candidateTypeForCandidateId:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_8(&dword_1C9A3B000, v0, v1, "Encountered candidateId that is associated with multiple candidate types. candidateId: %@, candidateTypes: %@");
  OUTLINED_FUNCTION_1_0();
}

void __62__ATXAnchorModelDataStoreWrapper_candidateTypeForCandidateId___block_invoke_4_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_0_8(&dword_1C9A3B000, v0, v1, "Error fetching the candidateTypeForCandidateId: %@. Error: %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)numCandidateOccurrencesInAllContextsForCandidate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Unable to determine candidateType for candidate: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)numCandidateOccurrencesInAllContextsForCandidate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Fetching action occurrences in all contexts", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)numCandidateOccurrencesInAllContextsForCandidate:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Fetching app launch occurrences in all contexts", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)numCandidateOccurrencesInAllContextsForCandidate:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Fetching mode changes in all contexts", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)numCandidateOccurrencesInAllContextsForCandidate:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Fetching Link actions in all contexts", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)numCandidateOccurrencesInAllContextsForCandidate:.cold.6()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1C9A3B000, v1, OS_LOG_TYPE_ERROR, "Returning 0 for numCandidateOccurrencesInAllContextsForCandidate: %@ because the candidateType was not a known value. candidateType: %@", v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)numCandidateOccurrencesInAllContextsForCandidateType:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Returning 0 for numCandidateOccurrencesInAllContextsForCandidateType because the candidateType was not a known value. candidateType: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)numActionOccurrencesInAllContextsForActionId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "Unable to get actionDetails for candidateId: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)numAppLaunchOccurrencesInAllContextsForAppLaunchCandidateId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "App Launch Cached Counter is unexpectedly nil. Falling back to CoreDuet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)numModeOccurrencesInAllContextsForModeId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "Focus Mode Cached Counter is unexpectedly nil. Falling back to Biome", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)numLinkActionOccurrencesInAllContextsForCandidateId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error when fetching Link transcript publisher: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __92__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidate_anchor___block_invoke_4_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_0_8(&dword_1C9A3B000, v0, v1, "Error fetching the numCandidateOccurrencesInAnchorContextForCandidate: %@. Error: %@");
  OUTLINED_FUNCTION_1_0();
}

void __96__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidateType_anchor___block_invoke_4_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_0_8(&dword_1C9A3B000, v0, v1, "Error fetching the numCandidateOccurrencesInAnchorContextForCandidateType: %@. Error: %@");
  OUTLINED_FUNCTION_1_0();
}

void __105__ATXAnchorModelDataStoreWrapper_uniqueCandidateIdsThatOccurredAfterAnchor_candidateType_minOccurrences___block_invoke_4_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_0_8(&dword_1C9A3B000, v0, v1, "Error fetching the uniqueCandidateIdsThatOccurredAfterAnchor: %@. Error: %@");
  OUTLINED_FUNCTION_1_0();
}

void __132__ATXAnchorModelDataStoreWrapper_secondsAfterAnchorWhenCandidateOccurredForAnchor_candidateId_onlyConsiderFirstOccurrencePerAnchor___block_invoke_4_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_0_8(&dword_1C9A3B000, v0, v1, "Error fetching the secondsAfterAnchorWhenCandidateOccurredForAnchor: %@. Error: %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)scoredActionFromAnchorModelPrediction:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "candidateId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9_0(&dword_1C9A3B000, a2, v4, "Unable to get actionDetails for candidateId: %@", v5);

  OUTLINED_FUNCTION_1();
}

- (void)scoredActionFromAnchorModelPrediction:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "candidateId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9_0(&dword_1C9A3B000, a2, v4, "Unable to get actionKey for candidateId: %@", v5);

  OUTLINED_FUNCTION_1();
}

void __61__ATXAnchorModelDataStoreWrapper_latestAlogIdForCandidateId___block_invoke_4_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_0_8(&dword_1C9A3B000, v0, v1, "Error fetching the latestAlogIdForCandidateId: %@. Error: %@");
  OUTLINED_FUNCTION_1_0();
}

void __82__ATXAnchorModelDataStoreWrapper_minSlotResolutionParametersFromALogId_paramHash___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, a2, a3, "Error obtaining slotset UUID for action row: %lld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __82__ATXAnchorModelDataStoreWrapper_minSlotResolutionParametersFromALogId_paramHash___block_invoke_293_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_0_8(&dword_1C9A3B000, v0, v1, "Unable to fetch minimalSlotResolutionParametersFromALogId %lld. Error: %@");
  OUTLINED_FUNCTION_1_0();
}

void __102__ATXAnchorModelDataStoreWrapper_numCandidateIdOccurrencesInJointAnchorContext_anchor_anchorMetadata___block_invoke_4_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_0_8(&dword_1C9A3B000, v0, v1, "Error fetching the numCandidateIdOccurrencesInJointAnchorContext: %@. Error %@");
  OUTLINED_FUNCTION_1_0();
}

void __102__ATXAnchorModelDataStoreWrapper_trainingDataForCandidate_anchor_replacementStringForNilStringValues___block_invoke_4_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_0_8(&dword_1C9A3B000, v0, v1, "Error fetching the trainingDataForCandidate: %@. Error: %@");
  OUTLINED_FUNCTION_1_0();
}

+ (void)actionKeyFromActionCandidateId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "Anchor Model Data Store Wrapper: Attempted to get ActionKey from candidateId that didn't have 3 components. CandidateId: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)actionDetailsFromActionCandidateId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "Anchor Model Data Store Wrapper: Attempted to get actionDetails from candidateId that didn't have 3 components. CandidateId: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)modeDetailsFromModeCandidateId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "Anchor Model Data Store Wrapper: Attempted to get modeDetails from candidateId that didn't have 3 components. CandidateId: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)linkActionDetailsFromLinkActionCandidateId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "Anchor Model Data Store Wrapper: Attempted to get linkActionDetails from candidateId that didn't have 3 components. CandidateId: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)candidateIdFromBiomeEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "Unknown biome event type, cannot fetch candidateId", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end

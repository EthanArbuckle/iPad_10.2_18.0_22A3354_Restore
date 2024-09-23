@implementation ATXStressTestDataGenerator

- (void)clearAllDataForStressCycler
{
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  sel_getName(a2);
  v3 = (void *)os_transaction_create();
  -[ATXStressTestDataGenerator clearDataForBehavioralActionPredictions](self, "clearDataForBehavioralActionPredictions");
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "%@ - clearAllDataForStressCycler finished", (uint8_t *)&v7, 0xCu);

  }
}

- (void)seedAllDataForStressCycler
{
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  sel_getName(a2);
  v3 = (void *)os_transaction_create();
  -[ATXStressTestDataGenerator generateDataForBehavioralActionPredictions](self, "generateDataForBehavioralActionPredictions");
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "%@ - seedAllDataForStressCycler finished", (uint8_t *)&v7, 0xCu);

  }
}

- (void)setupForStressCyclerWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  -[ATXStressTestDataGenerator clearAllDataForStressCycler](self, "clearAllDataForStressCycler");
  -[ATXStressTestDataGenerator seedAllDataForStressCycler](self, "seedAllDataForStressCycler");
  v4[2](v4, 0);

  xpc_transaction_exit_clean();
}

- (void)clearAllDataForStressCyclerWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  -[ATXStressTestDataGenerator clearAllDataForStressCycler](self, "clearAllDataForStressCycler");
  v4[2](v4, 0);

}

- (void)generateDataForBehavioralActionPredictions
{
  -[ATXStressTestDataGenerator _updateDonationPipelineWithIntentsAndNSUAs](self, "_updateDonationPipelineWithIntentsAndNSUAs");
  -[ATXStressTestDataGenerator _updateActionFeedbackWithConfirmsAndRejects](self, "_updateActionFeedbackWithConfirmsAndRejects");
}

- (void)clearDataForBehavioralActionPredictions
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[_ATXActionUtils resetActionPredictions](_ATXActionUtils, "resetActionPredictions");
  __atxlog_handle_default();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "%@ - BehavioralActionPredictions: cleared all action prediction data", (uint8_t *)&v5, 0xCu);

  }
}

- (void)_updateDonationPipelineWithIntentsAndNSUAs
{
  ATXAppIntentMonitor *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ATXAppIntentMonitor *v8;
  ATXAppIntentMonitor *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  ATXAppIntentMonitor *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = [ATXAppIntentMonitor alloc];
  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXAppInfoManager sharedInstance](_ATXAppInfoManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXAppLaunchSequenceManager sharedInstance](_ATXAppLaunchSequenceManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXAppIntentMonitor initWithAppLaunchHistogramManager:appInfoManager:appActionLaunchSequenceManager:dataStore:](v3, "initWithAppLaunchHistogramManager:appInfoManager:appActionLaunchSequenceManager:dataStore:", v4, v5, v6, v7);

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __101__ATXStressTestDataGenerator_BehavioralActionPredictions___updateDonationPipelineWithIntentsAndNSUAs__block_invoke;
  v14[3] = &unk_1E82E19A0;
  v9 = v8;
  v15 = v9;
  v16 = &v17;
  -[ATXStressTestDataGenerator enumerateSampleIntentAndUserActivityEventsWithBlock:](self, "enumerateSampleIntentAndUserActivityEventsWithBlock:", v14);
  __atxlog_handle_default();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v18[3];
    *(_DWORD *)buf = 138412546;
    v22 = v12;
    v23 = 2048;
    v24 = v13;
    _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "%@ - BehavioralActionPredictions: finished updating donation pipeline with: %lu actions", buf, 0x16u);

  }
  _Block_object_dispose(&v17, 8);

}

void __101__ATXStressTestDataGenerator_BehavioralActionPredictions___updateDonationPipelineWithIntentsAndNSUAs__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 1.0;
  objc_msgSend(v3, "updateActionPredictionPipelineForIntentEvent:weight:appSessionStartDate:appSessionEndDate:", v4, v5, v6, v7);

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

- (void)_updateActionFeedbackWithConfirmsAndRejects
{
  void *v3;
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __102__ATXStressTestDataGenerator_BehavioralActionPredictions___updateActionFeedbackWithConfirmsAndRejects__block_invoke;
  v9[3] = &unk_1E82E19C8;
  v10 = &unk_1E83CF9E0;
  v4 = v3;
  v11 = v4;
  v12 = &v13;
  -[ATXStressTestDataGenerator enumerateSampleIntentAndUserActivityATXActionsWithBlock:](self, "enumerateSampleIntentAndUserActivityATXActionsWithBlock:", v9);
  __atxlog_handle_default();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v14[3];
    *(_DWORD *)buf = 138412546;
    v18 = v7;
    v19 = 2048;
    v20 = v8;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%@ - BehavioralActionPredictions: finished updating action feedback %lu times", buf, 0x16u);

  }
  _Block_object_dispose(&v13, 8);

}

void __102__ATXStressTestDataGenerator_BehavioralActionPredictions___updateActionFeedbackWithConfirmsAndRejects__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _UNKNOWN **v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  _BOOL8 v8;
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
  uint64_t v24;
  uint64_t v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  void *v31;
  _BOOL8 v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = *(id *)(a1 + 32);
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v36;
    v4 = &off_1E82D9000;
    v34 = a1;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(obj);
        v29 = v5;
        v30 = objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v5), "unsignedIntValue");
        v6 = 3;
        do
        {
          v33 = v6;
          v7 = arc4random_uniform(0xFFFFFFFF) == -1;
          v8 = arc4random_uniform(0xFFFFFFFF) == -1;
          v31 = *(void **)(a1 + 40);
          v32 = v8;
          v9 = v4[65];
          objc_msgSend(v3, "actionKey");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "getActionTypeFromActionKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "bundleId");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "slotSet");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "actionUUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_opt_new();
          LOBYTE(v24) = v30;
          objc_msgSend(v31, "recordConfirms:rejects:forFeedbackType:forActionType:bundleId:action:slotSet:actionUUID:date:consumerSubType:geohash:coarseGeohash:", 2, v11, v12, v3, v13, v14, 1.0, 0.0, v15, v24, v7, v8);

          v16 = *(void **)(v34 + 40);
          objc_msgSend(v3, "actionKey");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[_ATXActionUtils getActionTypeFromActionKey:](_ATXActionUtils, "getActionTypeFromActionKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "bundleId");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "slotSet");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "actionUUID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_opt_new();
          LOBYTE(v25) = v30;
          v23 = v16;
          a1 = v34;
          v4 = &off_1E82D9000;
          objc_msgSend(v23, "recordConfirms:rejects:forFeedbackType:forActionType:bundleId:action:slotSet:actionUUID:date:consumerSubType:geohash:coarseGeohash:", 2, v18, v19, v3, v20, v21, 0.0, 1.0, v22, v25, v7, v32);

          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v34 + 48) + 8) + 24) += 2;
          v6 = v33 - 1;
        }
        while (v33 != 1);
        v5 = v29 + 1;
      }
      while (v29 + 1 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v28);
  }

}

- (id)_visitWebpageNSUAForURLString:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0CA5920];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithActivityType:", *MEMORY[0x1E0CB3418]);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v4);
  objc_msgSend(v6, "setWebpageURL:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SC DEBUG: %@"), v4);
  objc_msgSend(v6, "setTitle:", v8);

  objc_msgSend(v6, "setEligibleForPrediction:", 1);
  return v6;
}

- (id)_startCallIntentWithRecipientName:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CBDA60];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithValue:type:", v4, 0);
  v6 = objc_alloc(MEMORY[0x1E0CBDA58]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SC DEBUG: %@"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:", v5, 0, v7, 0, 0, 0);
  v9 = objc_alloc(MEMORY[0x1E0CBDC10]);
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithCallRecordFilter:callRecordToCallBack:audioRoute:destinationType:contacts:callCapability:", 0, 0, 1, 1, v10, 1);

  return v11;
}

- (void)enumerateSampleIntentAndUserActivityATXActionsWithBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  unint64_t v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  ATXStressTestDataGenerator *v18;
  id v19;
  unint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t j;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id obj;
  uint64_t v39;
  uint64_t v40;
  void *context;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "allAppsKnownToSpringBoard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subarrayWithRange:", 0, 30);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v6;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v40)
  {
    v39 = *(_QWORD *)v45;
    v7 = 0x1E0CB3000uLL;
    v8 = 0x1E0CB3000uLL;
    v9 = 0x1E0CF8000uLL;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v45 != v39)
          objc_enumerationMutation(obj);
        v42 = v10;
        v43 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v10);
        context = (void *)MEMORY[0x1CAA48B6C]();
        for (i = 0; i != 5; ++i)
        {
          v12 = v7;
          v13 = objc_alloc(*(Class *)(v7 + 2368));
          objc_msgSend(*(id *)(v8 + 2024), "numberWithUnsignedInteger:", i);
          v14 = v8;
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("https://www.example%@.com"), v15);

          -[ATXStressTestDataGenerator _visitWebpageNSUAForURLString:](self, "_visitWebpageNSUAForURLString:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = self;
          v19 = objc_alloc(*(Class *)(v9 + 3104));
          v20 = v9;
          v21 = (void *)objc_opt_new();
          LOBYTE(v36) = 0;
          v22 = (void *)objc_msgSend(v19, "initWithNSUserActivity:actionUUID:bundleId:contentAttributeSet:itemIdentifier:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v17, v21, v43, 0, 0, 0, 0, 0, v36, v16, v16);

          v23 = MEMORY[0x1CAA48B6C]();
          v4[2](v4, v22);
          v24 = (void *)v23;
          v9 = v20;
          objc_autoreleasePoolPop(v24);

          self = v18;
          v8 = v14;

          v7 = v12;
        }
        for (j = 0; j != 5; ++j)
        {
          v26 = objc_alloc(*(Class *)(v7 + 2368));
          objc_msgSend(*(id *)(v8 + 2024), "numberWithUnsignedInteger:", j);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)objc_msgSend(v26, "initWithFormat:", CFSTR("Contact Name: %@"), v27);

          -[ATXStressTestDataGenerator _startCallIntentWithRecipientName:](self, "_startCallIntentWithRecipientName:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_alloc(*(Class *)(v9 + 3104));
          v31 = (void *)objc_opt_new();
          LOBYTE(v35) = 0;
          v32 = (void *)objc_msgSend(v30, "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v29, v31, v43, 0, 0, 0, v35, v28, v28);

          v33 = MEMORY[0x1CAA48B6C]();
          v4[2](v4, v32);
          v34 = (void *)v33;
          v9 = v20;
          objc_autoreleasePoolPop(v34);

          self = v18;
          v8 = v14;

          v7 = v12;
        }
        objc_autoreleasePoolPop(context);
        v10 = v42 + 1;
      }
      while (v42 + 1 != v40);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v40);
  }

}

- (void)enumerateSampleIntentAndUserActivityEventsWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __111__ATXStressTestDataGenerator_BehavioralActionPredictions__enumerateSampleIntentAndUserActivityEventsWithBlock___block_invoke;
  v6[3] = &unk_1E82E19F0;
  v7 = v4;
  v5 = v4;
  -[ATXStressTestDataGenerator enumerateSampleIntentAndUserActivityATXActionsWithBlock:](self, "enumerateSampleIntentAndUserActivityATXActionsWithBlock:", v6);

}

void __111__ATXStressTestDataGenerator_BehavioralActionPredictions__enumerateSampleIntentAndUserActivityEventsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v3 = objc_alloc(MEMORY[0x1E0CB3588]);
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_msgSend(v3, "initWithStartDate:duration:", v4, 20.0);

  objc_msgSend(v16, "intent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v16, "intent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_className");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v16, "userActivity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_7;
    v10 = (void *)MEMORY[0x1E0CF8C20];
    objc_msgSend(v16, "userActivity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activityType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getNSUATypefromActivityType:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v8)
  {
    v12 = objc_alloc(MEMORY[0x1E0CF8ED8]);
    objc_msgSend(v16, "bundleId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithBundleId:intentType:dateInterval:action:", v13, v8, v5, v16);

    v15 = (void *)MEMORY[0x1CAA48B6C]();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    objc_autoreleasePoolPop(v15);

  }
LABEL_7:

}

@end

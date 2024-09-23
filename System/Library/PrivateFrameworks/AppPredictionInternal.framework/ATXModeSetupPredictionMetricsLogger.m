@implementation ATXModeSetupPredictionMetricsLogger

- (ATXModeSetupPredictionMetricsLogger)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ATXModeSetupPredictionMetricsLogger;
  return -[ATXModeSetupPredictionMetricsLogger init](&v3, sel_init);
}

- (id)globalAppSessionInterruptionsCalculatorSinceDate:(id)a3
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
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  _QWORD v20[5];
  id v21;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLaunchesSinceDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v9, "publisherFromStartTime:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stripStoreEvent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "orderedMergeWithOther:comparator:", v7, &__block_literal_global_12);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__3;
  v20[4] = __Block_byref_object_dispose__3;
  v21 = 0;
  v13 = (void *)objc_opt_new();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __88__ATXModeSetupPredictionMetricsLogger_globalAppSessionInterruptionsCalculatorSinceDate___block_invoke_13;
  v19[3] = &unk_1E82DB658;
  v19[4] = v20;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __88__ATXModeSetupPredictionMetricsLogger_globalAppSessionInterruptionsCalculatorSinceDate___block_invoke_2;
  v17[3] = &unk_1E82DB680;
  v14 = v13;
  v18 = v14;
  v15 = (id)objc_msgSend(v12, "sinkWithCompletion:receiveInput:", v19, v17);

  _Block_object_dispose(v20, 8);
  return v14;
}

uint64_t __88__ATXModeSetupPredictionMetricsLogger_globalAppSessionInterruptionsCalculatorSinceDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "eventTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __88__ATXModeSetupPredictionMetricsLogger_globalAppSessionInterruptionsCalculatorSinceDate___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __88__ATXModeSetupPredictionMetricsLogger_globalAppSessionInterruptionsCalculatorSinceDate___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "handleNotificationEvent:", v5);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = *(void **)(a1 + 32);
      v4 = (void *)objc_opt_new();
      objc_msgSend(v3, "handleNextAppLaunch:dimensionSet:", v5, v4);

    }
  }

}

- (id)appSessionInterruptionsCalculatorSinceDate:(id)a3 andForModeSemanticTypes:(id)a4
{
  id v5;
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
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD *v35;
  _QWORD v36[5];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[5];
  id v44;
  _BYTE v45[128];
  _QWORD v46[4];

  v46[2] = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v5 = a4;
  BiomeLibrary();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UserFocus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "InferredMode");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026F0]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", v32, 0, 0, 0, 0);
  objc_msgSend(v31, "publisherWithUseCase:options:", *MEMORY[0x1E0CF9398]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v9 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v32, "timeIntervalSinceReferenceDate");
  objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appLaunchesSinceDate:", v10);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_opt_new();
  objc_msgSend(v32, "timeIntervalSinceReferenceDate");
  objc_msgSend(v12, "publisherFromStartTime:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stripStoreEvent:", v13);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v46[0] = v28;
  v46[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "orderedMergeWithOthers:comparator:", v14, &__block_literal_global_21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__3;
  v43[4] = __Block_byref_object_dispose__3;
  v44 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__3;
  v41[4] = __Block_byref_object_dispose__3;
  v42 = 0;
  v16 = (void *)objc_opt_new();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v17 = v5;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v38;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v38 != v19)
          objc_enumerationMutation(v17);
        v21 = objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v20), "integerValue");
        v22 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, v23);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v18);
  }

  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __106__ATXModeSetupPredictionMetricsLogger_appSessionInterruptionsCalculatorSinceDate_andForModeSemanticTypes___block_invoke_2;
  v36[3] = &unk_1E82DB658;
  v36[4] = v41;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __106__ATXModeSetupPredictionMetricsLogger_appSessionInterruptionsCalculatorSinceDate_andForModeSemanticTypes___block_invoke_3;
  v33[3] = &unk_1E82DB6C8;
  v35 = v43;
  v24 = v16;
  v34 = v24;
  v25 = (id)objc_msgSend(v15, "sinkWithCompletion:receiveInput:", v36, v33);

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);

  return v24;
}

uint64_t __106__ATXModeSetupPredictionMetricsLogger_appSessionInterruptionsCalculatorSinceDate_andForModeSemanticTypes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "eventTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __106__ATXModeSetupPredictionMetricsLogger_appSessionInterruptionsCalculatorSinceDate_andForModeSemanticTypes___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __106__ATXModeSetupPredictionMetricsLogger_appSessionInterruptionsCalculatorSinceDate_andForModeSemanticTypes___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  ATXModeDimensionSet *v5;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  ATXModeDimensionSet *v14;
  id v15;

  v15 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "eventBody");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "modeType") == 2)
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v5 = *(ATXModeDimensionSet **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = 0;
LABEL_18:

      goto LABEL_19;
    }
    objc_msgSend(v3, "modeType");
    BMUserFocusInferredModeTypeToActivity();
    ATXActivityTypeToModeSemanticType();
    v5 = (ATXModeDimensionSet *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v6)
    {
      v7 = objc_msgSend(v6, "isEqualToNumber:", v5);
      v8 = objc_msgSend(v3, "isStart");
      if (v7)
      {
        if ((v8 & 1) != 0)
          goto LABEL_18;
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = 0;
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      v8 = objc_msgSend(v3, "isStart");
    }
    if (!v8)
      goto LABEL_18;
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = v5;
    v10 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v14;
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleNotificationEvent:", v15);
LABEL_19:

    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if (v11)
      {
        objc_msgSend(v11, "integerValue");
        DNDModeSemanticTypeToATXActivityType();
        ATXModeFromActivityType();
        ATXModeToString();
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = -[ATXModeDimensionSet initWithMode:]([ATXModeDimensionSet alloc], "initWithMode:", v3);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleNextAppLaunch:dimensionSet:", v15, v5);

        goto LABEL_18;
      }
    }
  }

}

- (id)getRecommendedAndCandidateAppsInAllowListForSemanticTypes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  dispatch_semaphore_t v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  dispatch_time_t v18;
  id obj;
  _QWORD v21[4];
  NSObject *v22;
  id v23;
  id v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(obj);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v9), "integerValue");
        v11 = (void *)objc_opt_new();
        DNDModeSemanticTypeToString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v12);

        v13 = (void *)objc_opt_new();
        v14 = dispatch_semaphore_create(0);
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __97__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInAllowListForSemanticTypes___block_invoke;
        v21[3] = &unk_1E82DB718;
        v15 = v14;
        v22 = v15;
        v23 = v13;
        v24 = v4;
        v25 = v10;
        v16 = v13;
        objc_msgSend(v5, "recommendedAndCandidateAllowedAppsForDNDModeSemanticType:reply:", v10, v21);
        v17 = v15;
        v18 = dispatch_time(0, 5000000000);
        dispatch_semaphore_wait(v17, v18);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v7);
  }

  return v4;
}

void __97__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInAllowListForSemanticTypes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __97__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInAllowListForSemanticTypes___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(v5, "recommendedApps");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = MEMORY[0x1E0C809B0];
    if (v8)
    {
      objc_msgSend(v5, "recommendedApps");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v9;
      v18[1] = 3221225472;
      v18[2] = __97__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInAllowListForSemanticTypes___block_invoke_27;
      v18[3] = &unk_1E82DB6F0;
      v19 = *(id *)(a1 + 40);
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v18);

    }
    objc_msgSend(v5, "candidateApps");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v5, "candidateApps");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v9;
      v16[1] = 3221225472;
      v16[2] = __97__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInAllowListForSemanticTypes___block_invoke_2;
      v16[3] = &unk_1E82DB6F0;
      v17 = *(id *)(a1 + 40);
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v16);

    }
    v14 = *(_QWORD *)(a1 + 40);
    v13 = *(void **)(a1 + 48);
    DNDModeSemanticTypeToString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v14, v15);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __97__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInAllowListForSemanticTypes___block_invoke_27(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "bundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

void __97__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInAllowListForSemanticTypes___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "bundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (id)getRecommendedAndCandidateAppsInDenyListForSemanticTypes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  dispatch_semaphore_t v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  dispatch_time_t v18;
  id obj;
  _QWORD v21[4];
  NSObject *v22;
  id v23;
  id v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(obj);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v9), "integerValue");
        v11 = (void *)objc_opt_new();
        DNDModeSemanticTypeToString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v12);

        v13 = (void *)objc_opt_new();
        v14 = dispatch_semaphore_create(0);
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __96__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInDenyListForSemanticTypes___block_invoke;
        v21[3] = &unk_1E82DB718;
        v15 = v14;
        v22 = v15;
        v23 = v13;
        v24 = v4;
        v25 = v10;
        v16 = v13;
        objc_msgSend(v5, "recommendedAndCandidateDeniedAppsForDNDModeSemanticType:reply:", v10, v21);
        v17 = v15;
        v18 = dispatch_time(0, 5000000000);
        dispatch_semaphore_wait(v17, v18);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v7);
  }

  return v4;
}

void __96__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInDenyListForSemanticTypes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __97__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInAllowListForSemanticTypes___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(v5, "recommendedApps");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = MEMORY[0x1E0C809B0];
    if (v8)
    {
      objc_msgSend(v5, "recommendedApps");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v9;
      v18[1] = 3221225472;
      v18[2] = __96__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInDenyListForSemanticTypes___block_invoke_30;
      v18[3] = &unk_1E82DB6F0;
      v19 = *(id *)(a1 + 40);
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v18);

    }
    objc_msgSend(v5, "candidateApps");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v5, "candidateApps");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v9;
      v16[1] = 3221225472;
      v16[2] = __96__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInDenyListForSemanticTypes___block_invoke_2;
      v16[3] = &unk_1E82DB6F0;
      v17 = *(id *)(a1 + 40);
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v16);

    }
    v14 = *(_QWORD *)(a1 + 40);
    v13 = *(void **)(a1 + 48);
    DNDModeSemanticTypeToString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v14, v15);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __96__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInDenyListForSemanticTypes___block_invoke_30(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "bundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

void __96__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInDenyListForSemanticTypes___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "bundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (id)fetchAllRelevantModeSemanticTypesInLastSevenDays:(id)a3
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CF8D60], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__3;
  v35 = __Block_byref_object_dispose__3;
  v36 = 0;
  BiomeLibrary();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UserFocus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "InferredMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  BiomeLibrary();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UserFocus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ComputedMode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026F0]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", v3, 0, 0, 0, 0);
  v12 = *MEMORY[0x1E0CF9398];
  objc_msgSend(v7, "publisherWithUseCase:options:", *MEMORY[0x1E0CF9398], v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "publisherWithUseCase:options:", v12, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "orderedMergeWithOther:comparator:", v14, &__block_literal_global_34);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __88__ATXModeSetupPredictionMetricsLogger_fetchAllRelevantModeSemanticTypesInLastSevenDays___block_invoke_2;
  v30[3] = &unk_1E82DB658;
  v30[4] = &v31;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __88__ATXModeSetupPredictionMetricsLogger_fetchAllRelevantModeSemanticTypesInLastSevenDays___block_invoke_3;
  v28[3] = &unk_1E82DB0C8;
  v17 = v4;
  v29 = v17;
  v18 = (id)objc_msgSend(v15, "sinkWithCompletion:receiveInput:", v30, v28);
  if (v32[5])
  {
    __atxlog_handle_heuristic();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[ATXModeSetupPredictionMetricsLogger fetchAllRelevantModeSemanticTypesInLastSevenDays:].cold.1();

  }
  objc_msgSend(v25, "getAllModeConfigurationsWithoutCache");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v16;
  v26[1] = 3221225472;
  v26[2] = __88__ATXModeSetupPredictionMetricsLogger_fetchAllRelevantModeSemanticTypesInLastSevenDays___block_invoke_38;
  v26[3] = &unk_1E82DB760;
  v21 = v17;
  v27 = v21;
  objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v26);
  v22 = v27;
  v23 = v21;

  _Block_object_dispose(&v31, 8);
  return v23;
}

uint64_t __88__ATXModeSetupPredictionMetricsLogger_fetchAllRelevantModeSemanticTypesInLastSevenDays___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "timestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

void __88__ATXModeSetupPredictionMetricsLogger_fetchAllRelevantModeSemanticTypesInLastSevenDays___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __88__ATXModeSetupPredictionMetricsLogger_fetchAllRelevantModeSemanticTypesInLastSevenDays___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v3, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    if (!objc_msgSend(v6, "isStart") || objc_msgSend(v7, "modeType") == 2)
      goto LABEL_10;
    objc_msgSend(v7, "modeType");
    BMUserFocusInferredModeTypeToActivity();
    ATXActivityTypeToModeSemanticType();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      __atxlog_handle_modes();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        __88__ATXModeSetupPredictionMetricsLogger_fetchAllRelevantModeSemanticTypesInLastSevenDays___block_invoke_3_cold_1(v7);

      goto LABEL_10;
    }
    v9 = (void *)v8;
    v10 = *(void **)(a1 + 32);
    goto LABEL_9;
  }
  objc_opt_class();
  v11 = objc_opt_isKindOfClass();

  if ((v11 & 1) != 0)
  {
    objc_msgSend(v3, "eventBody");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "starting"))
    {
LABEL_10:

      goto LABEL_11;
    }
    v12 = objc_msgSend(v7, "atx_dndModeSemanticType");
    v13 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13;
LABEL_9:
    objc_msgSend(v10, "addObject:", v9);

    goto LABEL_10;
  }
LABEL_11:

}

void __88__ATXModeSetupPredictionMetricsLogger_fetchAllRelevantModeSemanticTypesInLastSevenDays___block_invoke_38(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "mode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "semanticType");

  objc_msgSend(v4, "created");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
}

- (void)logMetrics
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "ATXModeSetupPredictionMetricsLogger: could not fetch home page configurations with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

uint64_t __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_46(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_48(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "mode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "semanticType");
  DNDModeSemanticTypeToString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "created");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setModeIsCreated:", 1);

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v4, "triggers", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v14, "isEnabled"))
          {
            objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setModeHasSmartActivationEnabled:", 1);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "created");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceNow");
    v18 = v17;

    if (v18 <= 0.0)
    {
      objc_msgSend(v4, "created");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSinceNow");
      v21 = fabs(v20);

      if (v21 < 604800.0)
      {
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setModeWasCreatedWithin7Days:", 1);

        if (v21 < 86400.0)
        {
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setModeWasCreatedToday:", 1);

        }
      }
    }
  }

}

void __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_50(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  objc_msgSend(a2, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    if (v6)
    {
      objc_msgSend(v6, "eventBody");
      v27 = (id)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v27, "starting"))
      {
LABEL_11:

        return;
      }
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);

      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v9 = v8 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
        v10 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "doubleValue");
        objc_msgSend(v10, "numberWithDouble:", v9 + v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));

        v14 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "intValue") + 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v16, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "timestamp");
        if (v17 > *(double *)(a1 + 96))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "timestamp");
          v19 = v18 - *(double *)(a1 + 96);
          v20 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "doubleValue");
          if (v9 >= v19)
            v23 = v19;
          else
            v23 = v9;
          objc_msgSend(v20, "numberWithDouble:", v23 + v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v24, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));

          v25 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
          v27 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "numberWithInt:", objc_msgSend(v27, "intValue") + 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v26, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));

          goto LABEL_11;
        }
      }
    }
  }
}

void __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  id v52;

  v52 = a2;
  objc_msgSend(v52, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
  if (!objc_msgSend(v4, "updateReason") || !objc_msgSend(v4, "updateSource"))
    goto LABEL_21;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    if (!objc_msgSend(v4, "starting"))
      goto LABEL_21;
    goto LABEL_20;
  }
  objc_msgSend(v52, "timestamp");
  v6 = v5 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  objc_msgSend(v4, "atx_dndModeSemanticType");
  DNDModeSemanticTypeToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "isEqualToString:", v8);

  v9 = objc_msgSend(v4, "starting");
  if (!(_DWORD)v7)
  {
    if (v9)
    {
      v30 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "doubleValue");
      objc_msgSend(v30, "numberWithDouble:", v6 + v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v33, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

      v34 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "numberWithInt:", objc_msgSend(v35, "intValue") + 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v36, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

      objc_msgSend(v52, "timestamp");
      if (v37 > *(double *)(a1 + 88))
      {
        v38 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "numberWithInt:", objc_msgSend(v39, "intValue") + 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v40, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

        objc_msgSend(v52, "timestamp");
        v42 = v41 - *(double *)(a1 + 88);
        v43 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "doubleValue");
        if (v6 >= v42)
          v46 = v42;
        else
          v46 = v6;
        objc_msgSend(v43, "numberWithDouble:", v46 + v45);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v47, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

      }
    }
LABEL_20:
    objc_msgSend(v4, "atx_dndModeSemanticType");
    DNDModeSemanticTypeToString();
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v50 = *(void **)(v49 + 40);
    *(_QWORD *)(v49 + 40) = v48;

    objc_msgSend(v52, "timestamp");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v51;
    goto LABEL_21;
  }
  if ((v9 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    objc_msgSend(v10, "numberWithDouble:", v6 + v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "intValue") + 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v16, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

    objc_msgSend(v52, "timestamp");
    if (v17 > *(double *)(a1 + 88))
    {
      v18 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "numberWithInt:", objc_msgSend(v19, "intValue") + 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v20, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

      objc_msgSend(v52, "timestamp");
      v22 = v21 - *(double *)(a1 + 88);
      v23 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "doubleValue");
      if (v6 >= v22)
        v26 = v22;
      else
        v26 = v6;
      objc_msgSend(v23, "numberWithDouble:", v26 + v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v27, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

    }
  }
  v28 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v29 = *(void **)(v28 + 40);
  *(_QWORD *)(v28 + 40) = 0;

LABEL_21:
}

uint64_t __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_51(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "timestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

void __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_2_53(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  uint64_t v5;
  double v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "usageType") == 17 || objc_msgSend(v3, "usageType") == 18)
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    objc_msgSend(v7, "timestamp");
    if (v4 > *(double *)(a1 + 64))
    {
      v5 = *(_QWORD *)(a1 + 40);
LABEL_5:
      ++*(_DWORD *)(*(_QWORD *)(v5 + 8) + 24);
    }
  }
  else if (objc_msgSend(v3, "usageType") == 4)
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    objc_msgSend(v7, "timestamp");
    if (v6 > *(double *)(a1 + 64))
    {
      v5 = *(_QWORD *)(a1 + 56);
      goto LABEL_5;
    }
  }

}

void __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  objc_msgSend(a2, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    if (v6)
    {
      if (objc_msgSend(v6, "isStart"))
      {
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          v8 = v7 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
          v9 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "doubleValue");
          objc_msgSend(v9, "numberWithDouble:", v8 + v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));

          v13 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "numberWithInt:", objc_msgSend(v14, "intValue") + 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v15, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "absoluteTimestamp");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "timeIntervalSinceReferenceDate");
          v18 = v17;
          v19 = *(double *)(a1 + 96);

          if (v18 > v19)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "absoluteTimestamp");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "timeIntervalSinceReferenceDate");
            v22 = v21 - *(double *)(a1 + 96);

            v23 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "doubleValue");
            if (v8 >= v22)
              v26 = v22;
            else
              v26 = v8;
            objc_msgSend(v23, "numberWithDouble:", v26 + v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v27, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));

            v28 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
            v30 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "numberWithInt:", objc_msgSend(v30, "intValue") + 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v29, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));

          }
        }
      }
    }
  }
}

void __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  id *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  int v23;
  int v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v3, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), v6);
    if (objc_msgSend(v6, "modeType") == 2)
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = 0;

LABEL_38:
      goto LABEL_39;
    }
    objc_msgSend(v6, "modeType");
    BMUserFocusInferredModeTypeToActivity();
    ATXActivityTypeToModeSemanticType();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (!v18)
    {
      __atxlog_handle_modes();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
        __88__ATXModeSetupPredictionMetricsLogger_fetchAllRelevantModeSemanticTypesInLastSevenDays___block_invoke_3_cold_1(v6);

      goto LABEL_37;
    }
    objc_msgSend(v18, "integerValue");
    DNDModeSemanticTypeToString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40))
    {
      objc_msgSend(v3, "timestamp");
      v22 = v21 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
      v23 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "isEqualToString:", v20);
      v24 = objc_msgSend(v6, "isStart");
      if (v23)
      {
        if ((v24 & 1) == 0)
        {
          v25 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "doubleValue");
          objc_msgSend(v25, "numberWithDouble:", v22 + v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v28, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));

          v29 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "numberWithInt:", objc_msgSend(v30, "intValue") + 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v31, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));

          objc_msgSend(v3, "timestamp");
          if (v32 > *(double *)(a1 + 120))
          {
            objc_msgSend(v3, "timestamp");
            v34 = v33 - *(double *)(a1 + 120);
            v35 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "doubleValue");
            if (v22 >= v34)
              v38 = v34;
            else
              v38 = v22;
            objc_msgSend(v35, "numberWithDouble:", v38 + v37);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v39, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));

            v40 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "numberWithInt:", objc_msgSend(v41, "intValue") + 1);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v42, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));

          }
        }
        v43 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
        v44 = *(void **)(v43 + 40);
        *(_QWORD *)(v43 + 40) = 0;

        goto LABEL_36;
      }
      if (v24)
      {
        v47 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "doubleValue");
        objc_msgSend(v47, "numberWithDouble:", v22 + v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v50, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));

        objc_msgSend(v3, "timestamp");
        if (v51 > *(double *)(a1 + 120))
        {
          objc_msgSend(v3, "timestamp");
          v53 = v52 - *(double *)(a1 + 120);
          v54 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "doubleValue");
          if (v22 >= v53)
            v57 = v53;
          else
            v57 = v22;
          objc_msgSend(v54, "numberWithDouble:", v57 + v56);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v58, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));

        }
      }
    }
    else if (!objc_msgSend(v6, "isStart"))
    {
      goto LABEL_36;
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), v20);
    objc_msgSend(v3, "timestamp");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = v59;
LABEL_36:

LABEL_37:
    goto LABEL_38;
  }
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();

  if ((v9 & 1) != 0)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40))
    {
      objc_msgSend(v3, "eventBody");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "usageType") == 17 || objc_msgSend(v6, "usageType") == 18)
      {
        v10 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "intValue") + 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v12, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));

        objc_msgSend(v3, "timestamp");
        if (v13 <= *(double *)(a1 + 120))
          goto LABEL_38;
        v14 = (id *)(a1 + 72);
      }
      else
      {
        if (objc_msgSend(v6, "usageType") != 4)
          goto LABEL_38;
        v60 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(a1 + 80), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "numberWithInt:", objc_msgSend(v61, "intValue") + 1);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 80), "setObject:forKeyedSubscript:", v62, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));

        objc_msgSend(v3, "timestamp");
        if (v63 <= *(double *)(a1 + 120))
          goto LABEL_38;
        v14 = (id *)(a1 + 88);
      }
      v15 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*v14, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "numberWithInt:", objc_msgSend(v16, "intValue") + 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*v14, "setObject:forKeyedSubscript:", v17, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));

      goto LABEL_38;
    }
  }
  else
  {
    __atxlog_handle_heuristic();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_5_cold_2(v3, v45);

  }
LABEL_39:

}

void __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_57(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_2_58(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  char v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  id obj;
  uint64_t v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v41 = a2;
  objc_msgSend(v41, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "starting"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "bundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

    if ((_DWORD)v4)
    {
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
      objc_msgSend(v41, "timestamp");
      if (v6 > *(double *)(a1 + 112))
        ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24);
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v7 = *(id *)(a1 + 40);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      if (v8)
      {
        v9 = v8;
        v10 = 0;
        obj = v7;
        v40 = *(_QWORD *)v43;
        v11 = 0.0;
        v12 = 1;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v43 != v40)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            objc_msgSend(v14, "integerValue");
            DNDModeSemanticTypeToString();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(*(id *)(a1 + 48), "atxModeForDNDSemanticType:", objc_msgSend(v14, "integerValue"));
            v17 = *(void **)(a1 + 56);
            v18 = v3;
            objc_msgSend(v3, "bundleID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "scoreForMode:bundleId:scalingFactor:", v16, v19, 1.0);
            v21 = v20;

            if ((v12 & (v21 >= 0.0)) == 1)
            {
              v22 = v15;

              v12 = 0;
              v11 = v21;
              v10 = v22;
            }
            v23 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v15);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "doubleValue");
            objc_msgSend(v23, "numberWithDouble:", v21 + v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v26, v15);

            objc_msgSend(v41, "timestamp");
            v3 = v18;
            if (v27 > *(double *)(a1 + 112))
            {
              v28 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", v15);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "doubleValue");
              objc_msgSend(v28, "numberWithDouble:", v21 + v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 72), "setObject:forKeyedSubscript:", v31, v15);

            }
            if (v21 > v11)
            {
              v32 = v15;

              v11 = v21;
              v10 = v32;
            }

          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        }
        while (v9);

        if (!v10)
          goto LABEL_23;
        v33 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(a1 + 80), "objectForKeyedSubscript:", v10);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "numberWithInt:", objc_msgSend(v34, "intValue") + 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 80), "setObject:forKeyedSubscript:", v35, v10);

        objc_msgSend(v41, "timestamp");
        if (v36 <= *(double *)(a1 + 112))
          goto LABEL_23;
        v37 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(a1 + 88), "objectForKeyedSubscript:", v10);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "numberWithInt:", objc_msgSend(v7, "intValue") + 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 88), "setObject:forKeyedSubscript:", v38, v10);

      }
      else
      {
        v10 = 0;
      }

LABEL_23:
    }
  }

}

void __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_59(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
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
  uint64_t v30;
  void *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "integerValue");
  DNDModeSemanticTypeToString();
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "numberOfInterruptingAppSessions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setModeAppInterruptionsCountInModeInferred7Days:", v7);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "modeAppInterruptionsCountInModeInferred7Days");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v10, "intValue");

  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = a1;
  v31 = (void *)v6;
  objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "countedSetContainingInterruptingAppBundleIds");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = 0;
    v17 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (objc_msgSend(v11, "containsObject:", v19))
        {
          objc_msgSend(v5, "countedSetContainingInterruptingAppBundleIds");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v16 + objc_msgSend(v20, "countForObject:", v19);

        }
        if (objc_msgSend(v12, "containsObject:", v19))
        {
          objc_msgSend(v5, "countedSetContainingInterruptingAppBundleIds");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v15 + objc_msgSend(v21, "countForObject:", v19);

        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
    v16 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v30 + 32), "objectForKeyedSubscript:", v31);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setModeAppInterruptionsCountBasedOnAllowListOfInferredMode7Days:", v22);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v30 + 32), "objectForKeyedSubscript:", v31);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setModeAppInterruptionsCountBasedOnDenyListOfInferredMode7Days:", v24);

  objc_msgSend(*(id *)(v30 + 32), "objectForKeyedSubscript:", v31);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "modeAppInterruptionsCountBasedOnAllowListOfInferredMode7Days");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v30 + 64) + 8) + 24) += objc_msgSend(v27, "intValue");

  objc_msgSend(*(id *)(v30 + 32), "objectForKeyedSubscript:", v31);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "modeAppInterruptionsCountBasedOnDenyListOfInferredMode7Days");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v30 + 72) + 8) + 24) += objc_msgSend(v29, "intValue");

}

void __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_2_61(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
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
  uint64_t v30;
  void *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "integerValue");
  DNDModeSemanticTypeToString();
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "numberOfInterruptingAppSessions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setModeAppInterruptionsCountInModeInferredToday:", v7);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "modeAppInterruptionsCountInModeInferredToday");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v10, "intValue");

  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = a1;
  v31 = (void *)v6;
  objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "countedSetContainingInterruptingAppBundleIds");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = 0;
    v17 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (objc_msgSend(v11, "containsObject:", v19))
        {
          objc_msgSend(v5, "countedSetContainingInterruptingAppBundleIds");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v16 + objc_msgSend(v20, "countForObject:", v19);

        }
        if (objc_msgSend(v12, "containsObject:", v19))
        {
          objc_msgSend(v5, "countedSetContainingInterruptingAppBundleIds");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v15 + objc_msgSend(v21, "countForObject:", v19);

        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
    v16 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v30 + 32), "objectForKeyedSubscript:", v31);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setModeAppInterruptionsCountBasedOnAllowListOfInferredModeToday:", v22);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v30 + 32), "objectForKeyedSubscript:", v31);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setModeAppInterruptionsCountBasedOnDenyListOfInferredModeToday:", v24);

  objc_msgSend(*(id *)(v30 + 32), "objectForKeyedSubscript:", v31);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "modeAppInterruptionsCountBasedOnAllowListOfInferredModeToday");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v30 + 64) + 8) + 24) += objc_msgSend(v27, "intValue");

  objc_msgSend(*(id *)(v30 + 32), "objectForKeyedSubscript:", v31);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "modeAppInterruptionsCountBasedOnDenyListOfInferredModeToday");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v30 + 72) + 8) + 24) += objc_msgSend(v29, "intValue");

}

void __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_3_65(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setModeName:", a2);
  objc_msgSend(v4, "logToCoreAnalytics");

}

void __97__ATXModeSetupPredictionMetricsLogger_getRecommendedAndCandidateAppsInAllowListForSemanticTypes___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Could not get recommended and candidate allowed apps: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)fetchAllRelevantModeSemanticTypesInLastSevenDays:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "ATXModeSetupPredictionMetricsLogger: Could not fetch inferred mode and computed mode streams with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __88__ATXModeSetupPredictionMetricsLogger_fetchAllRelevantModeSemanticTypesInLastSevenDays___block_invoke_3_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "modeType");
  OUTLINED_FUNCTION_3_1(&dword_1C9A3B000, v1, v2, "ATXModeSetupPredictionMetricsLogger: ATXActivityTypeToModeSemanticType returned nil for BMUserFocusInferredModeType %d", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1_0();
}

void __49__ATXModeSetupPredictionMetricsLogger_logMetrics__block_invoke_5_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXModeSetupPredictionMetricsLogger: Got unexpected event type: %@", v4, 0xCu);

}

@end

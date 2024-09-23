@implementation ATXUpdatePredictionsManager

- (id)disabledConsumerSubTypesWithHomeScreenPageConfigs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  int v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  ATXUpdatePredictionsManager *v29;
  id v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v29 = self;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", &unk_1E83CE5A8, &unk_1E83CE5C0, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v30 = v4;
    obj = v4;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    if (v33)
    {
      v32 = *(_QWORD *)v46;
      v5 = *MEMORY[0x1E0CF9480];
LABEL_4:
      v6 = 0;
      while (1)
      {
        if (*(_QWORD *)v46 != v32)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v6);
        if (!objc_msgSend(v36, "count"))
          break;
        v34 = v6;
        objc_msgSend(v7, "panels");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count");

        if (v9)
          objc_msgSend(v36, "removeObject:", &unk_1E83CE5C0);
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        objc_msgSend(v7, "stacks");
        v35 = (id)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v41, v56, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v42;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v42 != v12)
                objc_enumerationMutation(v35);
              v14 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
              v37 = 0u;
              v38 = 0u;
              v39 = 0u;
              v40 = 0u;
              objc_msgSend(v14, "widgets");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v55, 16);
              if (v16)
              {
                v17 = v16;
                v18 = *(_QWORD *)v38;
                while (2)
                {
                  for (j = 0; j != v17; ++j)
                  {
                    if (*(_QWORD *)v38 != v18)
                      objc_enumerationMutation(v15);
                    objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * j), "extensionBundleId");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    v21 = objc_msgSend(v20, "isEqualToString:", v5);

                    if (v21)
                    {
                      objc_msgSend(v36, "removeObject:", &unk_1E83CE5A8);
                      objc_msgSend(v36, "removeObject:", &unk_1E83CE5C0);
                      goto LABEL_25;
                    }
                  }
                  v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v55, 16);
                  if (v17)
                    continue;
                  break;
                }
              }
LABEL_25:

            }
            v11 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v41, v56, 16);
          }
          while (v11);
        }

        v6 = v34 + 1;
        if (v34 + 1 == v33)
        {
          v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
          if (v33)
            goto LABEL_4;
          break;
        }
      }
    }

    __atxlog_handle_default();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "allObjects");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXUpdatePredictionsManager _stringArrayFromBoxedConsumerSubTypeArray:](v29, "_stringArrayFromBoxedConsumerSubTypeArray:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v50 = v24;
      v51 = 2080;
      v52 = "-[ATXUpdatePredictionsManager disabledConsumerSubTypesWithHomeScreenPageConfigs:]";
      v53 = 2112;
      v54 = v26;
      _os_log_impl(&dword_1C9A3B000, v22, OS_LOG_TYPE_DEFAULT, "%@ - %s: %@", buf, 0x20u);

    }
    v27 = (void *)objc_msgSend(v36, "copy");

    v4 = v30;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v27;
}

void __77__ATXUpdatePredictionsManager_updateBehavioralPredictionsIfOlderThan_reason___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
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
  int v25;
  void *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend((id)objc_opt_class(), "shouldOverrideRefreshRateForDisabledConsumerSubTypesForReason:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "disabledConsumerSubTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appConsumerSubTypesToUpdateWithRefreshRate:disabledConsumerSubTypes:shouldOverrideRefreshRateForDisabledConsumerSubTypes:", v3, v2, *(double *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "actionConsumerSubTypesToUpdateWithRefreshRate:disabledConsumerSubTypes:shouldOverrideRefreshRateForDisabledConsumerSubTypes:", v3, v2, *(double *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_stringArrayFromBoxedConsumerSubTypeArray:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543874;
    v26 = v8;
    v27 = 2080;
    v28 = "-[ATXUpdatePredictionsManager updateBehavioralPredictionsIfOlderThan:reason:]_block_invoke";
    v29 = 2114;
    v30 = v9;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ - %s: app consumerSubTypes to refresh: %{public}@", (uint8_t *)&v25, 0x20u);

  }
  __atxlog_handle_default();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_stringArrayFromBoxedConsumerSubTypeArray:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543874;
    v26 = v12;
    v27 = 2080;
    v28 = "-[ATXUpdatePredictionsManager updateBehavioralPredictionsIfOlderThan:reason:]_block_invoke";
    v29 = 2114;
    v30 = v13;
    _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - %s: action consumerSubTypes to refresh: %{public}@", (uint8_t *)&v25, 0x20u);

  }
  if (objc_msgSend(v4, "count") || objc_msgSend(v5, "count"))
  {
    v14 = (void *)MEMORY[0x1CAA48B6C]();
    objc_msgSend(*(id *)(a1 + 32), "processLockscreenFeedbackNoSync");
    objc_autoreleasePoolPop(v14);
    v15 = (void *)MEMORY[0x1CAA48B6C]();
    objc_msgSend(*(id *)(a1 + 32), "processHomeScreenFeedbackNoSync");
    objc_autoreleasePoolPop(v15);
    v16 = (void *)MEMORY[0x1CAA48B6C]();
    objc_msgSend(*(id *)(a1 + 32), "processSpotlightAppFeedbackNoSync");
    objc_autoreleasePoolPop(v16);
    v17 = (void *)MEMORY[0x1CAA48B6C]();
    objc_msgSend(*(id *)(a1 + 32), "processSpotlightActionFeedbackNoSync");
    objc_autoreleasePoolPop(v17);
    v18 = (void *)MEMORY[0x1CAA48B6C]();
    objc_msgSend(*(id *)(a1 + 32), "processAppDirectoryFeedbackNoSync");
    objc_autoreleasePoolPop(v18);
  }
  v19 = (void *)objc_opt_new();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "refreshAppPredictionsWithConsumerSubTypes:featureCache:", v4, v19);
    objc_msgSend(*(id *)(a1 + 32), "atxServer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "updateBlendingLayerForAllConsumerSubTypes");

  }
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "refreshActionPredictionsWithConsumerSubTypes:featureCache:", v5, v19);
    objc_msgSend(*(id *)(a1 + 32), "actionProducer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "updateBlendingLayerForAllConsumerSubTypes");

  }
  objc_msgSend(*(id *)(a1 + 32), "logPredictionUpdatesForBoxedAppConsumerSubTypes:actionConsumerSubTypes:reason:", v4, v5, *(_QWORD *)(a1 + 48));
  +[_ATXFeedback sharedInstance](_ATXFeedback, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "unloadCachedHistograms");

  +[ATXActionFeedback sharedInstance](ATXActionFeedback, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "unloadCachedHistograms");

  v24 = (id)objc_opt_self();
}

- (id)_stringArrayFromBoxedConsumerSubTypeArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "unsignedIntegerValue", (_QWORD)v14);
        objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

- (void)processLockscreenFeedbackNoSync
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  ATXProactiveSuggestioniOSUIFeedbackQuery *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  sel_getName(a2);
  v12 = (id)os_transaction_create();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "clientModelIdsWithFeedbackListeners");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0C99E98]);
  objc_msgSend(MEMORY[0x1E0CF94D8], "feedbackRootDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("blendingFeedback-ATXConsumerSubTypeActionLockScreen"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initFileURLWithPath:", v8);

  v10 = -[ATXProactiveSuggestioniOSUIFeedbackQuery initWithClientModelIds:consumerSubTypeToConsider:startDateForResults:bookmarkURLPath:]([ATXProactiveSuggestioniOSUIFeedbackQuery alloc], "initWithClientModelIds:consumerSubTypeToConsider:startDateForResults:bookmarkURLPath:", v5, 22, 0, v9);
  v13[4] = self;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__ATXUpdatePredictionsManager_processLockscreenFeedbackNoSync__block_invoke;
  v14[3] = &unk_1E82EB910;
  v15 = v4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__ATXUpdatePredictionsManager_processLockscreenFeedbackNoSync__block_invoke_2;
  v13[3] = &unk_1E82E6638;
  v11 = v4;
  -[ATXProactiveSuggestionUIFeedbackQuery enumerateUIFeedbackResultsWithBlock:completionBlock:](v10, "enumerateUIFeedbackResultsWithBlock:completionBlock:", v14, v13);

}

- (void)processHomeScreenFeedbackNoSync
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  ATXProactiveSuggestioniOSPartialIntentUIFeedbackQuery *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  sel_getName(a2);
  v12 = (id)os_transaction_create();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "clientModelIdsWithFeedbackListeners");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0C99E98]);
  objc_msgSend(MEMORY[0x1E0CF94D8], "feedbackRootDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("blendingFeedback-ATXConsumerSubTypeSuggestionHomeScreen"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initFileURLWithPath:", v8);

  v10 = -[ATXProactiveSuggestioniOSUIFeedbackQuery initWithClientModelIds:consumerSubTypeToConsider:startDateForResults:bookmarkURLPath:]([ATXProactiveSuggestioniOSPartialIntentUIFeedbackQuery alloc], "initWithClientModelIds:consumerSubTypeToConsider:startDateForResults:bookmarkURLPath:", v5, 34, 0, v9);
  v13[4] = self;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__ATXUpdatePredictionsManager_processHomeScreenFeedbackNoSync__block_invoke;
  v14[3] = &unk_1E82EB910;
  v15 = v4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__ATXUpdatePredictionsManager_processHomeScreenFeedbackNoSync__block_invoke_2;
  v13[3] = &unk_1E82E6638;
  v11 = v4;
  -[ATXProactiveSuggestionUIFeedbackQuery enumerateUIFeedbackResultsWithBlock:completionBlock:](v10, "enumerateUIFeedbackResultsWithBlock:completionBlock:", v14, v13);

}

- (id)disabledConsumerSubTypes
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "homeScreenPageConfigs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXUpdatePredictionsManager disabledConsumerSubTypesWithHomeScreenPageConfigs:](self, "disabledConsumerSubTypesWithHomeScreenPageConfigs:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)appConsumerSubTypesToUpdateWithRefreshRate:(double)a3 disabledConsumerSubTypes:(id)a4 shouldOverrideRefreshRateForDisabledConsumerSubTypes:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;

  v5 = a5;
  v8 = a4;
  -[ATXUpdatePredictionsManager atxServer](self, "atxServer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "consumerSubTypesToUpdateWithRefreshRate:disabledConsumerSubTypes:shouldOverrideRefreshRateForDisabledConsumerSubTypes:", v8, v5, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (ATXServer)atxServer
{
  return self->_atxServer;
}

- (id)actionConsumerSubTypesToUpdateWithRefreshRate:(double)a3 disabledConsumerSubTypes:(id)a4 shouldOverrideRefreshRateForDisabledConsumerSubTypes:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a5;
  v8 = a4;
  -[ATXUpdatePredictionsManager actionProducer](self, "actionProducer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[ATXUpdatePredictionsManager actionProducer](self, "actionProducer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "consumerSubTypesToInvalidateForTTL:disabledConsumerSubTypes:shouldOverrideRefreshRateForDisabledConsumerSubTypes:", v8, v5, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)objc_opt_new();
  }

  return v11;
}

- (ATXMLActionProducer)actionProducer
{
  return self->_actionProducer;
}

+ (BOOL)shouldOverrideRefreshRateForDisabledConsumerSubTypesForReason:(unint64_t)a3
{
  _BOOL4 v4;
  NSObject *v5;

  if (a3 >= 0x18)
  {
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[ATXUpdatePredictionsManager shouldOverrideRefreshRateForDisabledConsumerSubTypesForReason:].cold.1(a3, v5);

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("shouldOverrideRefreshRateForDisabledConsumerSubTypesForReason called with invalid ATXUpdatePredictionsReason value of %lu"), a3);
    LOBYTE(v4) = 0;
  }
  else
  {
    return (0x8Fu >> a3) & 1;
  }
  return v4;
}

+ (id)homeScreenPageConfigs
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  id v9;

  v2 = (void *)objc_opt_new();
  v9 = 0;
  objc_msgSend(v2, "loadHomeScreenAndTodayPageConfigurationsWithError:", &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  v5 = v4;
  if (v3)
    v6 = 1;
  else
    v6 = v4 == 0;
  if (!v6)
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      +[ATXUpdatePredictionsManager homeScreenPageConfigs].cold.1((uint64_t)v5, v7);

  }
  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_42 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_42, &__block_literal_global_250);
  return (id)sharedInstance__pasExprOnceResult_57;
}

- (void)updateBehavioralPredictionsIfOlderThan:(double)a3 reason:(unint64_t)a4
{
  void *v7;
  NSObject *queue;
  id v9;
  _QWORD block[5];
  id v11;
  unint64_t v12;
  double v13;

  sel_getName(a2);
  v7 = (void *)os_transaction_create();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__ATXUpdatePredictionsManager_updateBehavioralPredictionsIfOlderThan_reason___block_invoke;
  block[3] = &unk_1E82DED88;
  v11 = v7;
  v12 = a4;
  v13 = a3;
  block[4] = self;
  v9 = v7;
  dispatch_sync(queue, block);

}

void __62__ATXUpdatePredictionsManager_processLockscreenFeedbackNoSync__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "%@ - finished processing lockscreen feedback with error: %@", (uint8_t *)&v6, 0x16u);

  }
}

void __45__ATXUpdatePredictionsManager_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_57;
  sharedInstance__pasExprOnceResult_57 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXUpdatePredictionsManager)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ATXUpdatePredictionsManager *v7;

  if (objc_msgSend(MEMORY[0x1E0CF8D98], "shouldComputeActions"))
    v3 = (void *)objc_opt_new();
  else
    v3 = 0;
  +[ATXServer sharedInstance](ATXServer, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = -[ATXUpdatePredictionsManager initWithATXServer:actionProducer:updateSources:updatePredictionsLogger:](self, "initWithATXServer:actionProducer:updateSources:updatePredictionsLogger:", v4, v3, v5, v6);

  return v7;
}

- (ATXUpdatePredictionsManager)initWithATXServer:(id)a3 actionProducer:(id)a4 updateSources:(id)a5 updatePredictionsLogger:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ATXUpdatePredictionsManager *v15;
  ATXUpdatePredictionsManager *v16;
  objc_class *v17;
  id v18;
  const char *v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *queue;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)ATXUpdatePredictionsManager;
  v15 = -[ATXUpdatePredictionsManager init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_atxServer, a3);
    objc_storeStrong((id *)&v16->_actionProducer, a4);
    objc_storeStrong((id *)&v16->_updateSources, a5);
    objc_storeStrong((id *)&v16->_updatePredictionsLogger, a6);
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = (const char *)objc_msgSend(v18, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create(v19, v20);
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v21;

  }
  return v16;
}

- (void)refreshAppPredictionsWithConsumerSubTypes:(id)a3 featureCache:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ATXUpdatePredictionsManager atxServer](self, "atxServer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateAppPredictionsWithConsumerSubTypes:featureCache:", v7, v6);

}

- (void)refreshActionPredictionsWithConsumerSubTypes:(id)a3 featureCache:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ATXUpdatePredictionsManager actionProducer](self, "actionProducer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidateCacheForConsumerSubTypes:featureCache:", v7, v6);

}

- (void)processLockscreenFeedback
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__ATXUpdatePredictionsManager_processLockscreenFeedback__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __56__ATXUpdatePredictionsManager_processLockscreenFeedback__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processLockscreenFeedbackNoSync");
}

- (void)processHomeScreenFeedback
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__ATXUpdatePredictionsManager_processHomeScreenFeedback__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __56__ATXUpdatePredictionsManager_processHomeScreenFeedback__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processHomeScreenFeedbackNoSync");
}

- (void)processSpotlightAppFeedback
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ATXUpdatePredictionsManager_processSpotlightAppFeedback__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __58__ATXUpdatePredictionsManager_processSpotlightAppFeedback__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processSpotlightAppFeedbackNoSync");
}

- (void)processSpotlightActionFeedback
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__ATXUpdatePredictionsManager_processSpotlightActionFeedback__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __61__ATXUpdatePredictionsManager_processSpotlightActionFeedback__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processSpotlightActionFeedbackNoSync");
}

- (void)processAppDirectoryFeedback
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ATXUpdatePredictionsManager_processAppDirectoryFeedback__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __58__ATXUpdatePredictionsManager_processAppDirectoryFeedback__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processAppDirectoryFeedbackNoSync");
}

uint64_t __62__ATXUpdatePredictionsManager_processLockscreenFeedbackNoSync__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleNewFeedbackResult:", a2);
}

uint64_t __62__ATXUpdatePredictionsManager_processHomeScreenFeedbackNoSync__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleNewFeedbackResult:", a2);
}

void __62__ATXUpdatePredictionsManager_processHomeScreenFeedbackNoSync__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "%@ - finished processing homescreen feedback with error: %@", (uint8_t *)&v6, 0x16u);

  }
}

- (void)processSpotlightAppFeedbackNoSync
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  ATXProactiveSuggestioniOSUIFeedbackQuery *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  sel_getName(a2);
  v12 = (id)os_transaction_create();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "clientModelIdsWithFeedbackListeners");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0C99E98]);
  objc_msgSend(MEMORY[0x1E0CF94D8], "feedbackRootDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("blendingFeedback-ATXConsumerSubTypeSpotlightUnknown"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initFileURLWithPath:", v8);

  v10 = -[ATXProactiveSuggestioniOSUIFeedbackQuery initWithClientModelIds:consumerSubTypeToConsider:startDateForResults:bookmarkURLPath:]([ATXProactiveSuggestioniOSUIFeedbackQuery alloc], "initWithClientModelIds:consumerSubTypeToConsider:startDateForResults:bookmarkURLPath:", v5, 9, 0, v9);
  v13[4] = self;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__ATXUpdatePredictionsManager_processSpotlightAppFeedbackNoSync__block_invoke;
  v14[3] = &unk_1E82EB910;
  v15 = v4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__ATXUpdatePredictionsManager_processSpotlightAppFeedbackNoSync__block_invoke_2;
  v13[3] = &unk_1E82E6638;
  v11 = v4;
  -[ATXProactiveSuggestionUIFeedbackQuery enumerateUIFeedbackResultsWithBlock:completionBlock:](v10, "enumerateUIFeedbackResultsWithBlock:completionBlock:", v14, v13);

}

uint64_t __64__ATXUpdatePredictionsManager_processSpotlightAppFeedbackNoSync__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleNewFeedbackResult:", a2);
}

void __64__ATXUpdatePredictionsManager_processSpotlightAppFeedbackNoSync__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "%@ - finished processing spotlight app feedback with error: %@", (uint8_t *)&v6, 0x16u);

  }
}

- (void)processSpotlightActionFeedbackNoSync
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  ATXProactiveSuggestioniOSPartialIntentUIFeedbackQuery *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  sel_getName(a2);
  v12 = (id)os_transaction_create();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "clientModelIdsWithFeedbackListeners");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0C99E98]);
  objc_msgSend(MEMORY[0x1E0CF94D8], "feedbackRootDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("blendingFeedback-ATXConsumerSubTypeActionSpotlightUnknown"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initFileURLWithPath:", v8);

  v10 = -[ATXProactiveSuggestioniOSUIFeedbackQuery initWithClientModelIds:consumerSubTypeToConsider:startDateForResults:bookmarkURLPath:]([ATXProactiveSuggestioniOSPartialIntentUIFeedbackQuery alloc], "initWithClientModelIds:consumerSubTypeToConsider:startDateForResults:bookmarkURLPath:", v5, 21, 0, v9);
  v13[4] = self;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__ATXUpdatePredictionsManager_processSpotlightActionFeedbackNoSync__block_invoke;
  v14[3] = &unk_1E82EB910;
  v15 = v4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__ATXUpdatePredictionsManager_processSpotlightActionFeedbackNoSync__block_invoke_2;
  v13[3] = &unk_1E82E6638;
  v11 = v4;
  -[ATXProactiveSuggestionUIFeedbackQuery enumerateUIFeedbackResultsWithBlock:completionBlock:](v10, "enumerateUIFeedbackResultsWithBlock:completionBlock:", v14, v13);

}

uint64_t __67__ATXUpdatePredictionsManager_processSpotlightActionFeedbackNoSync__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleNewFeedbackResult:", a2);
}

void __67__ATXUpdatePredictionsManager_processSpotlightActionFeedbackNoSync__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "%@ - finished processing spotlight action feedback with error: %@", (uint8_t *)&v6, 0x16u);

  }
}

- (void)processAppDirectoryFeedbackNoSync
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  ATXProactiveSuggestioniOSUIFeedbackQuery *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  sel_getName(a2);
  v12 = (id)os_transaction_create();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "clientModelIdsWithFeedbackListeners");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0C99E98]);
  objc_msgSend(MEMORY[0x1E0CF94D8], "feedbackRootDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("blendingFeedback-ATXConsumerSubTypeAppDirectory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initFileURLWithPath:", v8);

  v10 = -[ATXProactiveSuggestioniOSUIFeedbackQuery initWithClientModelIds:consumerSubTypeToConsider:startDateForResults:bookmarkURLPath:]([ATXProactiveSuggestioniOSUIFeedbackQuery alloc], "initWithClientModelIds:consumerSubTypeToConsider:startDateForResults:bookmarkURLPath:", v5, 35, 0, v9);
  v13[4] = self;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__ATXUpdatePredictionsManager_processAppDirectoryFeedbackNoSync__block_invoke;
  v14[3] = &unk_1E82EB910;
  v15 = v4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__ATXUpdatePredictionsManager_processAppDirectoryFeedbackNoSync__block_invoke_2;
  v13[3] = &unk_1E82E6638;
  v11 = v4;
  -[ATXProactiveSuggestionUIFeedbackQuery enumerateUIFeedbackResultsWithBlock:completionBlock:](v10, "enumerateUIFeedbackResultsWithBlock:completionBlock:", v14, v13);

}

uint64_t __64__ATXUpdatePredictionsManager_processAppDirectoryFeedbackNoSync__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleNewFeedbackResult:", a2);
}

void __64__ATXUpdatePredictionsManager_processAppDirectoryFeedbackNoSync__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "%@ - finished processing app directory feedback with error: %@", (uint8_t *)&v6, 0x16u);

  }
}

- (void)logPredictionUpdatesForBoxedAppConsumerSubTypes:(id)a3 actionConsumerSubTypes:(id)a4 reason:(unint64_t)a5
{
  id v8;

  v8 = a4;
  if (objc_msgSend(a3, "containsObject:", &unk_1E83CE5D8))
    -[ATXUpdatePredictionsLogger countPredictionUpdateWithReason:client:](self->_updatePredictionsLogger, "countPredictionUpdateWithReason:client:", a5, 0);
  if (objc_msgSend(v8, "containsObject:", &unk_1E83CE5F0))
    -[ATXUpdatePredictionsLogger countPredictionUpdateWithReason:client:](self->_updatePredictionsLogger, "countPredictionUpdateWithReason:client:", a5, 1);

}

- (void)setAtxServer:(id)a3
{
  objc_storeStrong((id *)&self->_atxServer, a3);
}

- (ATXUpdatePredictionsSources)updateSources
{
  return self->_updateSources;
}

- (ATXUpdatePredictionsLogger)updatePredictionsLogger
{
  return self->_updatePredictionsLogger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatePredictionsLogger, 0);
  objc_storeStrong((id *)&self->_updateSources, 0);
  objc_storeStrong((id *)&self->_actionProducer, 0);
  objc_storeStrong((id *)&self->_atxServer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (void)shouldOverrideRefreshRateForDisabledConsumerSubTypesForReason:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "shouldOverrideRefreshRateForDisabledConsumerSubTypesForReason called with invalid ATXUpdatePredictionsReason value of %lu", (uint8_t *)&v2, 0xCu);
}

+ (void)homeScreenPageConfigs
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "Unable to fetch HomeScreen Page Configs with error: %@", (uint8_t *)&v2, 0xCu);
}

@end

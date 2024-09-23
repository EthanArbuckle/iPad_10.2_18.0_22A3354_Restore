@implementation ATXUserEducationSuggestionFocusModeSetupTrigger

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__ATXUserEducationSuggestionFocusModeSetupTrigger_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken6_34 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_34, block);
  return (id)sharedInstance__pasExprOnceResult_45;
}

void __65__ATXUserEducationSuggestionFocusModeSetupTrigger_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_45;
  sharedInstance__pasExprOnceResult_45 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXUserEducationSuggestionFocusModeSetupTrigger)init
{
  ATXUserEducationSuggestionFocusModeSetupTrigger *v2;
  uint64_t v3;
  NSHashTable *observers;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  NSObject *v8;
  uint64_t v9;
  BMBiomeScheduler *inferredModeScheduler;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BPSSink *inferredModeStreamSink;
  _QWORD v19[4];
  id v20;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)ATXUserEducationSuggestionFocusModeSetupTrigger;
  v2 = -[ATXUserEducationSuggestionFocusModeSetupTrigger init](&v21, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 0);
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.ATXUserEducationSuggestionFocusModeSetupTrigger.queue", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    __atxlog_handle_context_user_education_suggestions();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[ATXUserEducationSuggestionFocusModeSetupTrigger init]";
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "%s: Registering for real time inferred mode change events", buf, 0xCu);
    }

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:", CFSTR("FocusModes.ATXUserEducationSuggestionFocusModeSetupServer"), v2->_queue);
    inferredModeScheduler = v2->_inferredModeScheduler;
    v2->_inferredModeScheduler = (BMBiomeScheduler *)v9;

    objc_initWeak((id *)buf, v2);
    BiomeLibrary();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UserFocus");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "InferredMode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "atx_DSLPublisher");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "subscribeOn:", v2->_inferredModeScheduler);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __55__ATXUserEducationSuggestionFocusModeSetupTrigger_init__block_invoke_13;
    v19[3] = &unk_1E82DE280;
    objc_copyWeak(&v20, (id *)buf);
    objc_msgSend(v15, "sinkWithCompletion:receiveInput:", &__block_literal_global_191, v19);
    v16 = objc_claimAutoreleasedReturnValue();
    inferredModeStreamSink = v2->_inferredModeStreamSink;
    v2->_inferredModeStreamSink = (BPSSink *)v16;

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  return v2;
}

void __55__ATXUserEducationSuggestionFocusModeSetupTrigger_init__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_msgSend(v2, "state");
  __atxlog_handle_context_user_education_suggestions();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __55__ATXUserEducationSuggestionFocusModeSetupTrigger_init__block_invoke_cold_1(v2, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[ATXUserEducationSuggestionFocusModeSetupTrigger init]_block_invoke";
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%s: ATXUserEducationSuggestionFocusModeSetupTrigger: Successfully completed listening to inferred mode change events for FocusModeSetupTrigger", (uint8_t *)&v6, 0xCu);
  }

}

void __55__ATXUserEducationSuggestionFocusModeSetupTrigger_init__block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v3;
  id *v4;
  id WeakRetained;
  int v6;
  id v7;
  int v8;
  id v9;
  id v10;
  id v11;

  objc_msgSend(a2, "eventBody");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "modeType") != 2)
  {
    if (objc_msgSend(v11, "modeType"))
    {
      if (objc_msgSend(v11, "isStart"))
      {
        objc_msgSend(v11, "modeType");
        BMUserFocusInferredModeTypeToActivity();
        v3 = ATXModeFromActivityType();
        v4 = (id *)(a1 + 32);
        WeakRetained = objc_loadWeakRetained(v4);
        v6 = objc_msgSend(WeakRetained, "modeIsEligibleForSetupPrediction:", v3);

        if (v6)
        {
          v7 = objc_loadWeakRetained(v4);
          v8 = objc_msgSend(v7, "modeHasPassedPastInferenceTest:", v3);

          if (v8)
          {
            v9 = objc_loadWeakRetained(v4);
            objc_msgSend(v9, "resetUserDefaultsIfNecessaryForMode:", v3);

            v10 = objc_loadWeakRetained(v4);
            objc_msgSend(v10, "processNewInferredModeEvent:", v11);

          }
        }
      }
    }
  }

}

- (BOOL)modeIsEligibleForSetupPrediction:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  allModesForModeSetupPrediction();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "unsignedIntegerValue", (_QWORD)v11) == a3)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)modeHasPassedPastInferenceTest:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  _QWORD v13[8];
  _QWORD v14[5];
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__91;
  v20[4] = __Block_byref_object_dispose__91;
  v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__91;
  v18[4] = __Block_byref_object_dispose__91;
  v19 = 0;
  v15 = 0;
  v16[0] = &v15;
  v16[1] = 0x3032000000;
  v16[2] = __Block_byref_object_copy__91;
  v16[3] = __Block_byref_object_dispose__91;
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -604800.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UserFocus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "InferredMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v4, 0, 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__ATXUserEducationSuggestionFocusModeSetupTrigger_modeHasPassedPastInferenceTest___block_invoke;
  v14[3] = &unk_1E82DB658;
  v14[4] = &v15;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__ATXUserEducationSuggestionFocusModeSetupTrigger_modeHasPassedPastInferenceTest___block_invoke_2;
  v13[3] = &unk_1E82E8378;
  v13[4] = v20;
  v13[5] = v18;
  v13[6] = &v22;
  v13[7] = a3;
  v9 = (id)objc_msgSend(v8, "sinkWithCompletion:receiveInput:", v14, v13);
  if (*(_QWORD *)(v16[0] + 40))
  {
    __atxlog_handle_context_user_education_suggestions();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ATXUserEducationSuggestionFocusModeSetupTrigger modeHasPassedPastInferenceTest:].cold.1((uint64_t)v16, v10);

  }
  v11 = v23[3] != 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v18, 8);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v22, 8);
  return v11;
}

void __82__ATXUserEducationSuggestionFocusModeSetupTrigger_modeHasPassedPastInferenceTest___block_invoke(uint64_t a1, void *a2)
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

void __82__ATXUserEducationSuggestionFocusModeSetupTrigger_modeHasPassedPastInferenceTest___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id obj;

  objc_msgSend(a2, "eventBody");
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(obj, "modeType") != 2)
  {
    if (objc_msgSend(obj, "modeType"))
    {
      objc_msgSend(obj, "modeType");
      BMUserFocusInferredModeTypeToActivity();
      if (ATXModeFromActivityType() == a1[7])
      {
        if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40))
        {
          if (objc_msgSend(obj, "isStart"))
          {
            objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), obj);
            objc_msgSend(obj, "absoluteTimestamp");
            v3 = objc_claimAutoreleasedReturnValue();
            v4 = *(_QWORD *)(a1[5] + 8);
            v5 = *(void **)(v4 + 40);
            *(_QWORD *)(v4 + 40) = v3;

          }
          else if ((objc_msgSend(obj, "isStart") & 1) == 0)
          {
            v6 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
            objc_msgSend(obj, "absoluteTimestamp");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "timeIntervalSinceDate:", v7);
            v9 = fabs(v8);

            if (v9 >= 3600.0)
              ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
          }
        }
      }
    }
  }

}

- (void)processNewInferredModeEvent:(id)a3
{
  id v4;
  NSHashTable *v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_observers;
  objc_sync_enter(v5);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_observers;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "processNewInferredModeEvent:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)registerObserver:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_observers;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)unregisterObserver:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_observers;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)resetUserDefaultsIfNecessaryForMode:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CF8D60], "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dndSemanticTypeForATXMode:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  -[ATXUserEducationSuggestionFocusModeSetupTrigger resetUserDefaultsIfNecessaryForDNDSemanticType:](self, "resetUserDefaultsIfNecessaryForDNDSemanticType:", v6);
}

- (void)resetUserDefaultsIfNecessaryForDNDSemanticType:(int64_t)a3
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v17 = (id)objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  v4 = (void *)MEMORY[0x1E0CB3940];
  DNDModeSemanticTypeToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@.%@"), CFSTR("DiscoverySuggestions.FocusModeSetup"), v5, CFSTR("MajorOSVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  DNDModeSemanticTypeToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@.%@.%@"), CFSTR("DiscoverySuggestions.FocusModeSetup"), v8, CFSTR("MinorOSVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  DNDModeSemanticTypeToString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@.%@.%@"), CFSTR("DiscoverySuggestions.State"), CFSTR("FocusModeSetup"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v17, "integerForKey:", *MEMORY[0x1E0CF9558]);
  v14 = objc_msgSend(v17, "integerForKey:", *MEMORY[0x1E0CF9568]);
  v15 = objc_msgSend(v17, "integerForKey:", v6);
  v16 = objc_msgSend(v17, "integerForKey:", v9);
  if (v13 > v15 || v14 > v16)
    objc_msgSend(v17, "removeObjectForKey:", v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_inferredModeStreamSink, 0);
  objc_storeStrong((id *)&self->_inferredModeScheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __55__ATXUserEducationSuggestionFocusModeSetupTrigger_init__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 136315394;
  v5 = "-[ATXUserEducationSuggestionFocusModeSetupTrigger init]_block_invoke";
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "%s: ATXUserEducationSuggestionFocusModeSetupTrigger: Error listening to inferred mode change events: %@", (uint8_t *)&v4, 0x16u);

}

- (void)modeHasPassedPastInferenceTest:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXUserEducationSuggestionFocusModeSetupTrigger: Could not fetch inferred mode stream with error: %@", (uint8_t *)&v3, 0xCu);
}

@end

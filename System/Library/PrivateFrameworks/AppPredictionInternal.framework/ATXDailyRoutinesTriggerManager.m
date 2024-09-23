@implementation ATXDailyRoutinesTriggerManager

+ (id)convenienceDateFormatter
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setDateStyle:", 1);
  objc_msgSend(v3, "setTimeStyle:", 1);
  objc_msgSend(v3, "setTimeZone:", v2);

  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_0 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_0, &__block_literal_global_3);
  return (id)sharedInstance__pasExprOnceResult_0;
}

void __48__ATXDailyRoutinesTriggerManager_sharedInstance__block_invoke()
{
  void *v0;
  void *v1;
  ATXPredictedTransitionsCache *v2;
  ATXCommutePredictor *v3;
  ATXTransitionPredictorCR *v4;
  void *v5;
  void *v6;
  ATXContextStoreWriter *v7;
  ATXDailyRoutinesTriggerManager *v8;
  void *v9;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[ATXPredictedTransitionsCache initWithLocationManager:]([ATXPredictedTransitionsCache alloc], "initWithLocationManager:", v1);
  v3 = -[ATXCommutePredictor initWithTransitionsCache:locationManager:]([ATXCommutePredictor alloc], "initWithTransitionsCache:locationManager:", v2, v1);
  v4 = -[ATXTransitionPredictorCR initWithLocationManager:locationPredictionsManager:]([ATXTransitionPredictorCR alloc], "initWithLocationManager:locationPredictionsManager:", v1, v1);
  objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForPredictedLocationOfInterestTransitions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ATXContextStoreWriter initWithContext:keyPath:]([ATXContextStoreWriter alloc], "initWithContext:keyPath:", v5, v6);
  v8 = -[ATXDailyRoutinesTriggerManager initWithCacheBasedPredictor:transitionPredictor:contextStoreWriter:]([ATXDailyRoutinesTriggerManager alloc], "initWithCacheBasedPredictor:transitionPredictor:contextStoreWriter:", v3, v4, v7);

  v9 = (void *)sharedInstance__pasExprOnceResult_0;
  sharedInstance__pasExprOnceResult_0 = (uint64_t)v8;

  objc_autoreleasePoolPop(v0);
}

- (ATXDailyRoutinesTriggerManager)initWithCacheBasedPredictor:(id)a3 transitionPredictor:(id)a4 contextStoreWriter:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXDailyRoutinesTriggerManager *v12;
  uint64_t v13;
  NSDateFormatter *dateFormatter;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ATXDailyRoutinesTriggerManager;
  v12 = -[ATXDailyRoutinesTriggerManager init](&v19, sel_init);
  if (v12)
  {
    objc_msgSend((id)objc_opt_class(), "convenienceDateFormatter");
    v13 = objc_claimAutoreleasedReturnValue();
    dateFormatter = v12->_dateFormatter;
    v12->_dateFormatter = (NSDateFormatter *)v13;

    objc_storeStrong((id *)&v12->_cachedPredictor, a3);
    objc_storeStrong((id *)&v12->_transitionPredictor, a4);
    objc_storeStrong((id *)&v12->_contextStoreWriter, a5);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.duetexpertd.ATXDailyRoutinesTriggerManager", v15);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v16;

  }
  return v12;
}

- (NSDate)now
{
  NSDate *now;

  now = self->_now;
  if (now)
    return now;
  else
    return (NSDate *)(id)objc_opt_new();
}

- (void)setNow:(id)a3
{
  objc_storeStrong((id *)&self->_now, a3);
}

- (void)updateWithActivity:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ATXDailyRoutinesTriggerManager_updateWithActivity___block_invoke;
  block[3] = &unk_1E82DACB0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __53__ATXDailyRoutinesTriggerManager_updateWithActivity___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "getNextTransitionOnActivity:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 40), "didDefer") & 1) == 0)
  {
    if (v2)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "prewarmOnActivity:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      __atxlog_handle_dailyroutines();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "No predicted transition received. Attempting to load from cache", (uint8_t *)&v27, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "getNextTransitionOnActivity:", *(_QWORD *)(a1 + 40));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if ((objc_msgSend(*(id *)(a1 + 40), "didDefer") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = *(_QWORD *)(a1 + 32);
      if (v2)
      {
        v29 = CFSTR("transition");
        v30[0] = v2;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("com.apple.duetexpertd.dailyroutines"), v6, v7);

        __atxlog_handle_dailyroutines();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v27 = 138412290;
          v28 = v2;
          _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "Using the following transition: %@", (uint8_t *)&v27, 0xCu);
        }

        __atxlog_handle_dailyroutines();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
          objc_msgSend(v2, "date");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringFromDate:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 138412290;
          v28 = v12;
          _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "Transition time: %@", (uint8_t *)&v27, 0xCu);

        }
        v13 = *(_QWORD **)(a1 + 32);
        v14 = (void *)v13[4];
        objc_msgSend(v13, "now");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "transitionArrayForDate:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v14, "setWithObject:", v16);

        __atxlog_handle_dailyroutines();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v27 = 67109120;
          LODWORD(v28) = v17;
          _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_DEFAULT, "Context store updated: %{BOOL}d", (uint8_t *)&v27, 8u);
        }

        v19 = (void *)objc_opt_class();
        objc_msgSend(v2, "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "now");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "_wakeupDateForExitDate:fromDate:", v20, v21);
        v22 = objc_claimAutoreleasedReturnValue();

        __atxlog_handle_dailyroutines();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
        if (v22)
        {
          if (v24)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "stringFromDate:", v22);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = 138412290;
            v28 = v25;
            _os_log_impl(&dword_1C9A3B000, v23, OS_LOG_TYPE_DEFAULT, "Scheduling one shot job for %@", (uint8_t *)&v27, 0xCu);

          }
          v26 = *(void **)(a1 + 32);
          objc_msgSend(v26, "now");
          v23 = objc_claimAutoreleasedReturnValue();
          -[NSObject timeIntervalSinceDate:](v22, "timeIntervalSinceDate:", v23);
          objc_msgSend(v26, "_scheduleOneShotJobAfterInterval:");
        }
        else if (v24)
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_1C9A3B000, v23, OS_LOG_TYPE_DEFAULT, "Declined to schedule an trigger manager update", (uint8_t *)&v27, 2u);
        }

      }
      else
      {
        objc_msgSend(v4, "postNotificationName:object:", CFSTR("com.apple.duetexpertd.dailyroutines"), *(_QWORD *)(a1 + 32));

        __atxlog_handle_dailyroutines();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_1C9A3B000, v22, OS_LOG_TYPE_DEFAULT, "No transition found", (uint8_t *)&v27, 2u);
        }
        v2 = 0;
      }

    }
  }

}

- (id)currentTransition
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__ATXDailyRoutinesTriggerManager_currentTransition__block_invoke;
  v5[3] = &unk_1E82DACD8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __51__ATXDailyRoutinesTriggerManager_currentTransition__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint8_t v6[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "getNextTransitionOnActivity:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    __atxlog_handle_dailyroutines();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "No predicted transition received. Attempting to load from cache", v6, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "getNextTransitionOnActivity:", 0);
    v2 = objc_claimAutoreleasedReturnValue();
  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v2;

}

+ (id)_wakeupDateForExitDate:(id)a3 fromDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  double v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "triggerPresetMinutes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __66__ATXDailyRoutinesTriggerManager__wakeupDateForExitDate_fromDate___block_invoke;
  v23[3] = &unk_1E82DAD00;
  v9 = v5;
  v24 = v9;
  objc_msgSend(v8, "_pas_mappedArrayWithTransform:", v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingSelector:", sel_compare_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = v11;
  v13 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v16, "timeIntervalSinceDate:", v6, (_QWORD)v19);
        if (v17 > 0.0)
        {
          v13 = v16;
          goto LABEL_11;
        }
      }
      v13 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_11:

  return v13;
}

uint64_t __66__ATXDailyRoutinesTriggerManager__wakeupDateForExitDate_fromDate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "dateByAddingTimeInterval:", (double)-(int)objc_msgSend(a2, "intValue") * 60.0);
}

- (void)_scheduleOneShotJobAfterInterval:(double)a3
{
  NSObject *v4;
  _QWORD v6[5];
  uint8_t buf[4];
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3 >= 120.0)
  {
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C80898], 0);
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C80738], 1);
    xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E0C80760], (uint64_t)a3);
    xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E0C80790], *MEMORY[0x1E0C807C8]);
    xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __67__ATXDailyRoutinesTriggerManager__scheduleOneShotJobAfterInterval___block_invoke;
    v6[3] = &unk_1E82DA770;
    v6[4] = self;
    atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.dailyroutines-trigger", v4, v6);
  }
  else
  {
    __atxlog_handle_dailyroutines();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v8 = a3;
      _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "Interval %f too soon, not scheduling one shot update", buf, 0xCu);
    }
  }

}

void __67__ATXDailyRoutinesTriggerManager__scheduleOneShotJobAfterInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  __atxlog_handle_dailyroutines();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "Running Daily Routines one-shot job...", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "updateWithActivity:", v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_contextStoreWriter, 0);
  objc_storeStrong((id *)&self->_transitionPredictor, 0);
  objc_storeStrong((id *)&self->_cachedPredictor, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

@end

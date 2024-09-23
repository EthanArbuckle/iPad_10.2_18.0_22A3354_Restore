@implementation ATXAnchorModelPredictionScheduler

- (ATXAnchorModelPredictionScheduler)init
{
  void *v3;
  void *v4;
  void *v5;
  ATXAnchorModelPredictionScheduler *v6;

  v3 = (void *)objc_opt_new();
  +[ATXAnchorModelHyperParameters sharedInstance](ATXAnchorModelHyperParameters, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v6 = -[ATXAnchorModelPredictionScheduler initWithPredictionForwarder:hyperParameters:tracker:now:maxPredictions:](self, "initWithPredictionForwarder:hyperParameters:tracker:now:maxPredictions:", v3, v4, v5, 0, 45);

  return v6;
}

- (ATXAnchorModelPredictionScheduler)initWithPredictionForwarder:(id)a3 hyperParameters:(id)a4 tracker:(id)a5 now:(id)a6 maxPredictions:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ATXAnchorModelPredictionScheduler *v17;
  ATXAnchorModelPredictionScheduler *v18;
  id v19;
  uint64_t v20;
  NSUserDefaults *defaults;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v23.receiver = self;
  v23.super_class = (Class)ATXAnchorModelPredictionScheduler;
  v17 = -[ATXAnchorModelPredictionScheduler init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    -[ATXAnchorModelPredictionScheduler initializeLock](v17, "initializeLock");
    objc_storeStrong((id *)&v18->_predictionForwarder, a3);
    objc_storeStrong((id *)&v18->_hyperParameters, a4);
    objc_storeStrong((id *)&v18->_tracker, a5);
    objc_storeStrong((id *)&v18->_now, a6);
    v18->_maxPredictions = a7;
    v19 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v20 = objc_msgSend(v19, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
    defaults = v18->_defaults;
    v18->_defaults = (NSUserDefaults *)v20;

  }
  return v18;
}

- (void)initializeLock
{
  _PASLock *v3;
  _PASLock *schedulerLock;
  id v5;

  v5 = (id)objc_opt_new();
  v3 = (_PASLock *)objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v5);
  schedulerLock = self->_schedulerLock;
  self->_schedulerLock = v3;

}

- (id)now
{
  NSDate *now;

  now = self->_now;
  if (now)
    return now;
  else
    return (id)objc_opt_new();
}

- (void)clearPredictionsForAnchor:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_anchor();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Scheduler clearing predictions for anchor %@.", (uint8_t *)&v6, 0xCu);
  }

  -[ATXAnchorModelPredictionScheduler schedulePredictions:anchor:](self, "schedulePredictions:anchor:", MEMORY[0x1E0C9AA60], v4);
}

- (void)schedulePredictions:(id)a3 anchor:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  ATXAnchorModelPredictionScheduler *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  void *v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  __atxlog_handle_anchor();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", buf, 2u);
  }

  __atxlog_handle_anchor();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 134218242;
    v38 = v10;
    v39 = 2112;
    v40 = v7;
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "Scheduler received %lu predictions for anchor %@. Predictions:", buf, 0x16u);
  }

  v11 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("score"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortUsingDescriptors:", v13);

  v14 = v11;
  v15 = v14;
  if (objc_msgSend(v14, "count") > self->_maxPredictions)
  {
    objc_msgSend(v14, "subarrayWithRange:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    __atxlog_handle_anchor();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v15, "count");
      *(_DWORD *)buf = 134217984;
      v38 = v17;
      _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_DEFAULT, "Scheduler clipping anchor model predictions to the top scoring %lu predictions.", buf, 0xCu);
    }

  }
  v28 = v14;
  v29 = v7;
  v30 = self;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v18 = v15;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        v24 = (void *)MEMORY[0x1CAA48B6C]();
        __atxlog_handle_anchor();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v38 = v23;
          _os_log_impl(&dword_1C9A3B000, v25, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }

        objc_autoreleasePoolPop(v24);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v20);
  }

  __atxlog_handle_anchor();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v26, OS_LOG_TYPE_DEFAULT, "Scheduling...", buf, 2u);
  }

  __atxlog_handle_anchor();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v27, OS_LOG_TYPE_DEFAULT, "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", buf, 2u);
  }

  -[ATXAnchorModelPredictionScheduler persistPredictions:anchor:](v30, "persistPredictions:anchor:", v18, v29);
  -[ATXAnchorModelPredictionScheduler forwardPredictionUpdates](v30, "forwardPredictionUpdates");
  -[ATXAnchorModelPredictionScheduler logPredictionsGeneratedMetricsWithAnchorModelPredictions:](v30, "logPredictionsGeneratedMetricsWithAnchorModelPredictions:", v18);

}

- (void)persistPredictions:(id)a3 anchor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _PASLock *schedulerLock;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1CAA48B6C]();
  schedulerLock = self->_schedulerLock;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__ATXAnchorModelPredictionScheduler_persistPredictions_anchor___block_invoke;
  v12[3] = &unk_1E82DC900;
  v12[4] = self;
  v11 = v6;
  v13 = v11;
  v10 = v7;
  v14 = v10;
  -[_PASLock runWithLockAcquired:](schedulerLock, "runWithLockAcquired:", v12);

  objc_autoreleasePoolPop(v8);
}

void __63__ATXAnchorModelPredictionScheduler_persistPredictions_anchor___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a1[4], "_readPredictionsFromCache");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(a1[5], "copy");
  objc_msgSend(a1[6], "anchorTypeString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v2, v3);

  objc_msgSend(a1[4], "_cache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v4, "storeSecureCodedObject:error:", v5, 0);

}

- (id)_cache
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionCacheDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("anchorModelSchedulerCurrentPredictions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x1E0CF94C0]);
  __atxlog_handle_anchor();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithCacheFilePath:loggingHandle:debugName:", v3, v5, CFSTR("cached anchor model predictions"));

  return v6;
}

- (void)scheduleNextPredictionUpdate
{
  id v3;

  -[ATXAnchorModelPredictionScheduler dateOfSoonestUpcomingPredictionChange](self, "dateOfSoonestUpcomingPredictionChange");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelPredictionScheduler forwardPredictionUpdatesOnDate:](self, "forwardPredictionUpdatesOnDate:", v3);

}

- (id)dateOfSoonestUpcomingPredictionChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[ATXAnchorModelPredictionScheduler predictions](self, "predictions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v18 = *(_QWORD *)v20;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v20 != v18)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(v7, "dateIntervalForPrediction");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "startDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXAnchorModelPredictionScheduler now](self, "now");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXAnchorModelPredictionScheduler earlierDateInFuture:earliestDateSoFar:now:](self, "earlierDateInFuture:earliestDateSoFar:now:", v10, v3, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "dateIntervalForPrediction");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "endDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXAnchorModelPredictionScheduler now](self, "now");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXAnchorModelPredictionScheduler earlierDateInFuture:earliestDateSoFar:now:](self, "earlierDateInFuture:earliestDateSoFar:now:", v14, v12, v15);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v5 != v6);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

  return v3;
}

- (id)earlierDateInFuture:(id)a3 earliestDateSoFar:(id)a4 now:(id)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  void *v11;
  id v12;
  id v13;

  v8 = a3;
  v9 = a4;
  v10 = -[ATXAnchorModelPredictionScheduler dateIsInFuture:now:](self, "dateIsInFuture:now:", v8, a5);
  v11 = v9;
  if (v10)
  {
    objc_msgSend(v9, "earlierDate:", v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12 == v9)
      v11 = v9;
    else
      v11 = v8;
  }
  v13 = v11;

  return v13;
}

- (BOOL)dateIsInFuture:(id)a3 now:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(v5, "earlierDate:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v6 == v5;
}

- (id)predictions
{
  void *v3;
  _PASLock *schedulerLock;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = (void *)objc_opt_new();
  schedulerLock = self->_schedulerLock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__ATXAnchorModelPredictionScheduler_predictions__block_invoke;
  v9[3] = &unk_1E82DC928;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  -[_PASLock runWithLockAcquired:](schedulerLock, "runWithLockAcquired:", v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

void __48__ATXAnchorModelPredictionScheduler_predictions__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_readPredictionsFromCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(v2, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (id)_readPredictionsFromCache
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  -[ATXAnchorModelPredictionScheduler _cache](self, "_cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1CAA48B6C]();
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v4, "initWithObjects:", v5, v6, v7, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v3);
  objc_msgSend(v2, "readSecureCodedObjectWithMaxValidAge:allowableClasses:error:", v8, 0, -1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = (id)objc_opt_new();
  v13 = v12;

  return v13;
}

- (void)forwardPredictionUpdatesOnDate:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ATXAnchorModelPredictionScheduler now](self, "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXAnchorModelPredictionScheduler dateIsInFuture:now:](self, "dateIsInFuture:now:", v4, v5);

  if (v6)
  {
    __atxlog_handle_anchor();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_INFO, "Scheduler scheduling next update on %@", (uint8_t *)&v9, 0xCu);
    }

    -[ATXAnchorModelPredictionScheduler criteriaForJobOnDate:](self, "criteriaForJobOnDate:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXAnchorModelPredictionScheduler registerXPCActivityForPredictionUpdateWithCriteria:](self, "registerXPCActivityForPredictionUpdateWithCriteria:", v8);

  }
  else
  {
    -[ATXAnchorModelPredictionScheduler forwardPredictionUpdates](self, "forwardPredictionUpdates");
  }

}

- (void)registerXPCActivityForPredictionUpdateWithCriteria:(id)a3
{
  _QWORD handler[5];

  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __88__ATXAnchorModelPredictionScheduler_registerXPCActivityForPredictionUpdateWithCriteria___block_invoke;
  handler[3] = &unk_1E82DC950;
  handler[4] = self;
  xpc_activity_register("com.apple.duetexpertd.anchor-model-prediction-scheduler", a3, handler);
}

void __88__ATXAnchorModelPredictionScheduler_registerXPCActivityForPredictionUpdateWithCriteria___block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = a2;
  if (xpc_activity_get_state(v3) == 2 && (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked") & 1) == 0)
  {
    __atxlog_handle_anchor();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "Forwarding Anchor Model prediction updates due to scheduled update.", v6, 2u);
    }

    v5 = (void *)MEMORY[0x1CAA48B6C]();
    objc_msgSend(*(id *)(a1 + 32), "forwardPredictionUpdates");
    objc_autoreleasePoolPop(v5);
  }

}

- (id)criteriaForJobOnDate:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  xpc_object_t v8;

  v4 = a3;
  -[ATXAnchorModelPredictionScheduler now](self, "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v8, (const char *)*MEMORY[0x1E0C80760], (uint64_t)v7);
  xpc_dictionary_set_int64(v8, (const char *)*MEMORY[0x1E0C80790], 60);
  xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x1E0C808B8], 1);
  xpc_dictionary_set_string(v8, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
  xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x1E0C80738], 1);
  xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x1E0C80898], 0);
  return v8;
}

- (void)forwardPredictionUpdates
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[ATXAnchorModelPredictionScheduler predictionsValidNow](self, "predictionsValidNow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelPredictionForwarderProtocol forwardPredictions:](self->_predictionForwarder, "forwardPredictions:", v3);
  __atxlog_handle_anchor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "Scheduler forwarded predictions.", v5, 2u);
  }

  -[ATXAnchorModelPredictionScheduler scheduleNextPredictionUpdate](self, "scheduleNextPredictionUpdate");
}

- (id)predictionsValidNow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[ATXAnchorModelPredictionScheduler predictionsWithTimeIntervalOverlappingWithCurrentTime](self, "predictionsWithTimeIntervalOverlappingWithCurrentTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[ATXAnchorModelPredictionScheduler predictionsAfterFilteringInactiveAnchors:](self, "predictionsAfterFilteringInactiveAnchors:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("score"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortUsingDescriptors:", v8);

  -[ATXAnchorModelPredictionScheduler deduplicatedPredictions:](self, "deduplicatedPredictions:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)predictionsWithTimeIntervalOverlappingWithCurrentTime
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[ATXAnchorModelPredictionScheduler predictions](self, "predictions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __90__ATXAnchorModelPredictionScheduler_predictionsWithTimeIntervalOverlappingWithCurrentTime__block_invoke;
  v6[3] = &unk_1E82DC978;
  v6[4] = self;
  objc_msgSend(v3, "_pas_filteredArrayWithTest:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __90__ATXAnchorModelPredictionScheduler_predictionsWithTimeIntervalOverlappingWithCurrentTime__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  v4 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(v3, "dateIntervalForPrediction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsDate:", v6);

  objc_autoreleasePoolPop(v4);
  return v7;
}

- (id)predictionsAfterFilteringInactiveAnchors:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __78__ATXAnchorModelPredictionScheduler_predictionsAfterFilteringInactiveAnchors___block_invoke;
  v4[3] = &unk_1E82DC978;
  v4[4] = self;
  objc_msgSend(a3, "_pas_filteredArrayWithTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __78__ATXAnchorModelPredictionScheduler_predictionsAfterFilteringInactiveAnchors___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "anchorType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXAnchor anchorClassFromAnchorTypeString:](ATXAnchor, "anchorClassFromAnchorTypeString:", v4);
  v5 = (void *)objc_opt_new();

  v6 = objc_msgSend((id)objc_opt_class(), "isActive");
  if ((v6 & 1) == 0)
  {
    __atxlog_handle_anchor();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "Filtering out Anchor Model prediction because the anchor is no longer active. Prediction %@", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "clearPredictionsForAnchor:", v5);
  }

  return v6;
}

- (id)deduplicatedPredictions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, uint64_t);
  void *v13;
  id v14;
  id v15;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __61__ATXAnchorModelPredictionScheduler_deduplicatedPredictions___block_invoke;
  v13 = &unk_1E82DC9A0;
  v14 = v4;
  v15 = v5;
  v6 = v5;
  v7 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v10);
  objc_msgSend(v3, "objectsAtIndexes:", v6, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __61__ATXAnchorModelPredictionScheduler_deduplicatedPredictions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v10 = v5;
  objc_msgSend(v5, "candidateId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v6, "containsObject:", v7);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v10, "candidateId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
}

- (void)logPredictionsGeneratedMetricsWithAnchorModelPredictions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  int v26;
  int v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v47, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v30;
    v25 = v4;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v8);
        v10 = (void *)objc_opt_new();
        objc_msgSend(v9, "anchorType");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setAnchorType:", v11);

        objc_msgSend(v9, "score");
        objc_msgSend(v10, "setScore:");
        objc_msgSend(v9, "candidateType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setCandidateType:", v12);

        objc_msgSend(v9, "offsetFromAnchorToShowPrediction");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "startSecondsAfterAnchor");
        objc_msgSend(v10, "setSecondsAfterAnchorStart:", (int)v14);

        objc_msgSend(v9, "offsetFromAnchorToShowPrediction");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "endSecondsAfterAnchor");
        objc_msgSend(v10, "setSecondsAfterAnchorEnd:", (int)v16);

        -[ATXAnchorModelHyperParameters abGroup](self->_hyperParameters, "abGroup");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setAbGroup:", v17);

        -[ATXPETEventTracker2Protocol logMessage:](self->_tracker, "logMessage:", v10);
        __atxlog_handle_metrics();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "anchorType");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "candidateType");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "score");
          v23 = v22;
          v27 = objc_msgSend(v10, "secondsAfterAnchorStart");
          v26 = objc_msgSend(v10, "secondsAfterAnchorEnd");
          objc_msgSend(v10, "abGroup");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413826;
          v34 = v28;
          v35 = 2112;
          v36 = v20;
          v37 = 2112;
          v38 = v21;
          v39 = 2048;
          v40 = v23;
          v41 = 1024;
          v42 = v27;
          v43 = 1024;
          v44 = v26;
          v45 = 2112;
          v46 = v24;
          _os_log_debug_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBAnchorModelPredictionsGeneratedTracker with anchorType: %@ candidateType: %@ score: %f secondsAfterAnchorStart: %u secondsAfterAnchorEnd: %u abGroup: %@", buf, 0x40u);

          v4 = v25;
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v47, 16);
    }
    while (v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_predictionForwarder, 0);
  objc_storeStrong((id *)&self->_schedulerLock, 0);
}

@end

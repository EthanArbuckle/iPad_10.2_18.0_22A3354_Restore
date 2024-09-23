@implementation ATXAppLaunchMicroLocation

- (ATXAppLaunchMicroLocation)init
{
  void *v3;
  void *v4;
  void *v5;
  ATXAppLaunchMicroLocation *v6;

  +[_ATXDuetHelper sharedInstance](_ATXDuetHelper, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXAppLaunchMicroLocation initWithDuetHelper:combinedIntentStream:directory:forTesting:](self, "initWithDuetHelper:combinedIntentStream:directory:forTesting:", v3, v4, v5, 0);

  return v6;
}

- (ATXAppLaunchMicroLocation)initWithDuetHelper:(id)a3 combinedIntentStream:(id)a4 directory:(id)a5 forTesting:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  ATXAppLaunchMicroLocation *v14;
  uint64_t v15;
  NSString *path;
  ATXAppLaunchMicroLocationGuardedData *v17;
  void *v18;
  ATXAppLaunchMicroLocationGuardedData *v19;
  uint64_t v20;
  _PASLock *lock;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v23.receiver = self;
  v23.super_class = (Class)ATXAppLaunchMicroLocation;
  v14 = -[ATXAppLaunchMicroLocation init](&v23, sel_init);
  if (v14)
  {
    objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("ATXAppPredictionMicroLocation"));
    v15 = objc_claimAutoreleasedReturnValue();
    path = v14->_path;
    v14->_path = (NSString *)v15;

    objc_storeStrong((id *)&v14->_duetHelper, a3);
    objc_storeStrong((id *)&v14->_combinedIntentStream, a4);
    v17 = [ATXAppLaunchMicroLocationGuardedData alloc];
    -[_ATXDuetHelper getMostRecentMicroLocation](v14->_duetHelper, "getMostRecentMicroLocation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[ATXAppLaunchMicroLocationGuardedData initWithCurrentMicroLocation:](v17, "initWithCurrentMicroLocation:", v18);

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v19);
    lock = v14->_lock;
    v14->_lock = (_PASLock *)v20;

    if (!a6)
      -[ATXAppLaunchMicroLocation _subscribeToDKInsertionEvents](v14, "_subscribeToDKInsertionEvents");
    -[ATXAppLaunchMicroLocation tryLoadCorrelationMatricesImmediately](v14, "tryLoadCorrelationMatricesImmediately");

  }
  return v14;
}

- (void)_subscribeToDKInsertionEvents
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D15B70];
  objc_msgSend(MEMORY[0x1E0D15AF8], "microLocationVisitStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__receivedNotificationOfNewMicroLocation, v3, v5);

}

- (void)_receivedNotificationOfNewMicroLocation
{
  _PASLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__ATXAppLaunchMicroLocation__receivedNotificationOfNewMicroLocation__block_invoke;
  v3[3] = &unk_1E82EAD30;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

void __68__ATXAppLaunchMicroLocation__receivedNotificationOfNewMicroLocation__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = a2;
  objc_msgSend(v2, "getMostRecentMicroLocation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrentMicroLocation:", v4);

}

- (double)popularityAtCurrentMicroLocationForApp:(id)a3
{
  id v4;
  void *v5;
  _PASLock *lock;
  double v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = (double *)&v12;
    v14 = 0x2020000000;
    v15 = 0;
    lock = self->_lock;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__ATXAppLaunchMicroLocation_popularityAtCurrentMicroLocationForApp___block_invoke;
    v9[3] = &unk_1E82EAD58;
    v11 = &v12;
    v10 = v4;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
    v7 = v13[3];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

void __68__ATXAppLaunchMicroLocation_popularityAtCurrentMicroLocationForApp___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id *v5;

  v5 = a2;
  objc_msgSend(v5, "getCurrentMicroLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v5[4], "launchProbabilityForEvent:atLocationsWithProbabilities:", *(_QWORD *)(a1 + 32), v3);
  else
    v4 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;

}

- (double)popularityAtCurrentMicroLocationForActionKey:(id)a3
{
  id v4;
  void *v5;
  _PASLock *lock;
  double v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = (double *)&v12;
    v14 = 0x2020000000;
    v15 = 0;
    lock = self->_lock;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __74__ATXAppLaunchMicroLocation_popularityAtCurrentMicroLocationForActionKey___block_invoke;
    v9[3] = &unk_1E82EAD58;
    v11 = &v12;
    v10 = v4;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
    v7 = v13[3];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

void __74__ATXAppLaunchMicroLocation_popularityAtCurrentMicroLocationForActionKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id *v5;

  v5 = a2;
  objc_msgSend(v5, "getCurrentMicroLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v5[5], "launchProbabilityForEvent:atLocationsWithProbabilities:", *(_QWORD *)(a1 + 32), v3);
  else
    v4 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;

}

- (void)train
{
  NSObject *v3;
  objc_class *v4;
  char *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _PASLock *lock;
  id v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  os_signpost_id_t spid;
  void *context;
  unint64_t v37;
  _QWORD v38[4];
  id v39;
  id v40;
  ATXAppLaunchMicroLocation *v41;
  _QWORD v42[5];
  id v43;
  SEL v44;
  _QWORD v45[4];
  id v46;
  uint8_t buf[4];
  const char *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v48 = v5;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "%@ - starting training of micro locations", buf, 0xCu);

  }
  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  __atxlog_handle_default();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v37 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 136446210;
    v48 = "ATXAppLaunchMicroLocation";
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Train", "Component=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", buf, 0xCu);
  }
  spid = v7;

  context = (void *)MEMORY[0x1CAA48B6C]();
  -[ATXAppLaunchMicroLocation _getHistoricalData](self, "_getHistoricalData");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = (void *)MEMORY[0x1E0C9AA60];
  if (v10)
    v13 = (void *)v10;
  else
    v13 = (void *)MEMORY[0x1E0C9AA60];
  v14 = v13;

  v15 = (void *)objc_opt_new();
  v16 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dateByAddingTimeInterval:", -2419200.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXDuetHelper getAppLaunchesBetweenStartDate:endDate:batchSize:](self->_duetHelper, "getAppLaunchesBetweenStartDate:endDate:batchSize:", v18, v17, 800);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (void *)v19;
  else
    v21 = v12;
  v22 = v21;

  v23 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __34__ATXAppLaunchMicroLocation_train__block_invoke;
  v45[3] = &unk_1E82EAD80;
  v24 = v15;
  v46 = v24;
  +[ATXEvent joinLaunchEvents:withVisits:block:](ATXEvent, "joinLaunchEvents:withVisits:block:", v22, v14, v45);

  objc_autoreleasePoolPop(v16);
  v25 = (void *)objc_opt_new();
  v26 = (void *)MEMORY[0x1CAA48B6C]();
  -[ATXCombinedIntentStream getActivityAndIntentEventsFromLastMonth](self->_combinedIntentStream, "getActivityAndIntentEventsFromLastMonth");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v23;
  v42[1] = 3221225472;
  v42[2] = __34__ATXAppLaunchMicroLocation_train__block_invoke_2;
  v42[3] = &unk_1E82EADA8;
  v44 = a2;
  v42[4] = self;
  v28 = v25;
  v43 = v28;
  +[ATXEvent joinLaunchEvents:withVisits:block:](ATXEvent, "joinLaunchEvents:withVisits:block:", v27, v14, v42);

  objc_autoreleasePoolPop(v26);
  lock = self->_lock;
  v38[0] = v23;
  v38[1] = 3221225472;
  v38[2] = __34__ATXAppLaunchMicroLocation_train__block_invoke_3;
  v38[3] = &unk_1E82EADD0;
  v39 = v24;
  v40 = v28;
  v41 = self;
  v30 = v28;
  v31 = v24;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v38);

  objc_autoreleasePoolPop(context);
  __atxlog_handle_default();
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v37 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    *(_DWORD *)buf = 136446210;
    v48 = "ATXAppLaunchMicroLocation";
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v33, OS_SIGNPOST_INTERVAL_END, spid, "Train", "Component=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", buf, 0xCu);
  }

}

void __34__ATXAppLaunchMicroLocation_train__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "bundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v5, "event", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
        objc_msgSend(v5, "event");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "doubleValue");
        v16 = v15;

        objc_msgSend(*(id *)(a1 + 32), "addVisitForLocation:event:value:", v12, v6, v16);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

void __34__ATXAppLaunchMicroLocation_train__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("ATXAppLaunchMicroLocation.m"), 171, CFSTR("Expected ATXIntentEvent class"));

  }
  objc_msgSend(v5, "action");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v20 = v5;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v6, "event");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13);
          objc_msgSend(v6, "event");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "doubleValue");
          v18 = v17;

          objc_msgSend(*(id *)(a1 + 40), "addVisitForLocation:event:value:", v14, v8, v18);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

    v5 = v20;
  }

}

uint64_t __34__ATXAppLaunchMicroLocation_train__block_invoke_3(id *a1, id *a2)
{
  id *v4;

  objc_storeStrong(a2 + 4, a1[4]);
  v4 = a2;
  objc_storeStrong(v4 + 5, a1[5]);

  return objc_msgSend(a1[6], "_writeAppLaunchCorrelationMatrix:actionKeyCorrelationMatrix:", a1[4], a1[5]);
}

- (void)_writeAppLaunchCorrelationMatrix:(id)a3 actionKeyCorrelationMatrix:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  char v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1CAA48B6C]();
  v18[0] = CFSTR("appLaunchMatrix");
  v18[1] = CFSTR("actionKeyMatrix");
  v19[0] = v6;
  v19[1] = v7;
  v18[2] = CFSTR("modelVersion");
  v19[2] = &unk_1E83CE530;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", self->_path);
    v12 = objc_claimAutoreleasedReturnValue();
    v16 = v11;
    v13 = objc_msgSend(v10, "writeToURL:options:error:", v12, 805306369, &v16);
    v14 = v16;

    if ((v13 & 1) == 0)
    {
      __atxlog_handle_default();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[ATXAppLaunchMicroLocation _writeAppLaunchCorrelationMatrix:actionKeyCorrelationMatrix:].cold.2();

    }
  }
  else
  {
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXAppLaunchMicroLocation _writeAppLaunchCorrelationMatrix:actionKeyCorrelationMatrix:].cold.1();
    v14 = v11;
  }

  objc_autoreleasePoolPop(v8);
}

- (void)tryLoadCorrelationMatricesImmediately
{
  unsigned int v3;
  NSObject *v4;
  _BOOL4 v5;
  objc_class *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  _PASLock *lock;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0D81590], "lockState") - 3;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3 > 0xFFFFFFFD)
  {
    if (v5)
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "%@ - loading correlation matrices, detected that device is Class B Locked", buf, 0xCu);

    }
    lock = self->_lock;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__ATXAppLaunchMicroLocation_tryLoadCorrelationMatricesImmediately__block_invoke;
    v12[3] = &unk_1E82EAD30;
    v12[4] = self;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v12);
  }
  else
  {
    if (v5)
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "%@ - loading correlation matrices, device is NOT Class B Locked", buf, 0xCu);

    }
    v8 = (void *)MEMORY[0x1CAA48B6C]();
    -[ATXAppLaunchMicroLocation _loadCorrelationMatrices](self, "_loadCorrelationMatrices");
    objc_autoreleasePoolPop(v8);
  }
}

void __66__ATXAppLaunchMicroLocation_tryLoadCorrelationMatricesImmediately__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id location;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3[1])
  {
    __atxlog_handle_default();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "%@ - skipping second registration for unlock notification token", buf, 0xCu);

    }
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v7 = (void *)MEMORY[0x1E0D81590];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__ATXAppLaunchMicroLocation_tryLoadCorrelationMatricesImmediately__block_invoke_60;
    v13[3] = &unk_1E82E1CC0;
    objc_copyWeak(&v14, &location);
    v13[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "registerForLockStateChangeNotifications:", v13);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v3[1];
    v3[1] = v8;

    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v12;
      _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "%@ - started listening for lock state changed notifications", buf, 0xCu);

    }
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

void __66__ATXAppLaunchMicroLocation_tryLoadCorrelationMatricesImmediately__block_invoke_60(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = (void *)WeakRetained[1];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __66__ATXAppLaunchMicroLocation_tryLoadCorrelationMatricesImmediately__block_invoke_2;
    v6[3] = &unk_1E82EAD30;
    v6[4] = *(_QWORD *)(a1 + 32);
    v4 = (void *)MEMORY[0x1CAA48B6C](objc_msgSend(v3, "runWithLockAcquired:", v6));
    objc_msgSend(v5, "_loadCorrelationMatrices");
    objc_autoreleasePoolPop(v4);
    WeakRetained = v5;
  }

}

void __66__ATXAppLaunchMicroLocation_tryLoadCorrelationMatricesImmediately__block_invoke_2(uint64_t a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D81590];
  v4 = a2[1];
  v5 = a2;
  objc_msgSend(v3, "unregisterForLockStateChangeNotifications:", v4);
  v6 = (void *)a2[1];
  a2[1] = 0;

  __atxlog_handle_default();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "%@ - stopped listening for lock state changed notifications", (uint8_t *)&v10, 0xCu);

  }
}

- (BOOL)_loadCorrelationMatrices
{
  id v3;
  NSString *path;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  _PASLock *lock;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  BOOL v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  NSString *v27;
  objc_class *v29;
  void *v30;
  NSString *v31;
  _QWORD v32[4];
  NSObject *v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  NSString *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99D50]);
  path = self->_path;
  v35 = 0;
  v5 = (void *)objc_msgSend(v3, "initWithContentsOfFile:options:error:", path, 0, &v35);
  v6 = v35;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1CAA48B6C]();
    v34 = v6;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v11, v5, &v34);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v34;

    objc_autoreleasePoolPop(v12);
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("modelVersion"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "integerValue");

      if (v16 == 1)
      {
        lock = self->_lock;
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __53__ATXAppLaunchMicroLocation__loadCorrelationMatrices__block_invoke;
        v32[3] = &unk_1E82EAD30;
        v33 = v13;
        -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v32);
        __atxlog_handle_default();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v37 = v20;
          _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_DEFAULT, "%@ - successfully loaded correlation matrices", buf, 0xCu);

        }
        v21 = 1;
        v22 = v33;
        goto LABEL_12;
      }
      __atxlog_handle_default();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[ATXAppLaunchMicroLocation _loadCorrelationMatrices].cold.1((uint64_t)self, v16, v22);
    }
    else
    {
      __atxlog_handle_default();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = self->_path;
        *(_DWORD *)buf = 138412802;
        v37 = v30;
        v38 = 2112;
        v39 = v31;
        v40 = 2112;
        v41 = v14;
        _os_log_error_impl(&dword_1C9A3B000, v23, OS_LOG_TYPE_ERROR, "%@ - Error unarchiving model at %@: %@", buf, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v22 = objc_claimAutoreleasedReturnValue();
      -[NSObject removeItemAtPath:error:](v22, "removeItemAtPath:error:", self->_path, 0);
    }
    v21 = 0;
LABEL_12:

    goto LABEL_16;
  }
  __atxlog_handle_default();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = self->_path;
    *(_DWORD *)buf = 138412802;
    v37 = v26;
    v38 = 2112;
    v39 = v27;
    v40 = 2112;
    v41 = v6;
    _os_log_impl(&dword_1C9A3B000, v24, OS_LOG_TYPE_DEFAULT, "%@ - Could not open model at %@: %@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeItemAtPath:error:", self->_path, 0);
  v21 = 0;
  v14 = v6;
LABEL_16:

  return v21;
}

void __53__ATXAppLaunchMicroLocation__loadCorrelationMatrices__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("appLaunchMatrix"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[4];
  v4[4] = v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("actionKeyMatrix"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (id)v4[5];
  v4[5] = v7;

}

- (id)_getHistoricalData
{
  return -[_ATXDuetHelper getMicroLocationsFromLastMonth](self->_duetHelper, "getMicroLocationsFromLastMonth");
}

- (id)_getAppLaunchCorrelationMatrix
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__102;
  v10 = __Block_byref_object_dispose__102;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__ATXAppLaunchMicroLocation__getAppLaunchCorrelationMatrix__block_invoke;
  v5[3] = &unk_1E82EADF8;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __59__ATXAppLaunchMicroLocation__getAppLaunchCorrelationMatrix__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(*(id *)(a2 + 32), "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_getActionKeyCorrelationMatrix
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__102;
  v10 = __Block_byref_object_dispose__102;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__ATXAppLaunchMicroLocation__getActionKeyCorrelationMatrix__block_invoke;
  v5[3] = &unk_1E82EADF8;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __59__ATXAppLaunchMicroLocation__getActionKeyCorrelationMatrix__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(*(id *)(a2 + 40), "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_combinedIntentStream, 0);
  objc_storeStrong((id *)&self->_duetHelper, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)_writeAppLaunchCorrelationMatrix:actionKeyCorrelationMatrix:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v2, v3, "%@ - Error archiving micro-location correlation matrices: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)_writeAppLaunchCorrelationMatrix:actionKeyCorrelationMatrix:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v2, v3, "%@ - Error writing micro-location correlation matrices: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)_loadCorrelationMatrices
{
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;

  v5 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = v6;
  v9 = 1024;
  v10 = 1;
  v11 = 1024;
  v12 = a2;
  _os_log_error_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_ERROR, "%@ - Expected model version %i, got %i", (uint8_t *)&v7, 0x18u);

  OUTLINED_FUNCTION_1_1();
}

@end

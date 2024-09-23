@implementation CPLEngineSystemMonitor

- (CPLEngineSystemMonitor)initWithEngineLibrary:(id)a3
{
  id v4;
  CPLEngineSystemMonitor *v5;
  void *v6;
  uint64_t v7;
  NSURL *volumeURL;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v11;
  NSMutableDictionary *reasonsToOverrideSystemBudget;
  NSMutableDictionary *v13;
  NSMutableDictionary *scheduledOverrides;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CPLEngineSystemMonitor;
  v5 = -[CPLEngineSystemMonitor init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "clientLibraryBaseURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    volumeURL = v5->_volumeURL;
    v5->_volumeURL = (NSURL *)v7;

    v9 = dispatch_queue_create("com.apple.cpl.systemmonitor", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;

    objc_storeWeak((id *)&v5->_engineLibrary, v4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    reasonsToOverrideSystemBudget = v5->_reasonsToOverrideSystemBudget;
    v5->_reasonsToOverrideSystemBudget = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    scheduledOverrides = v5->_scheduledOverrides;
    v5->_scheduledOverrides = v13;

    v5->_hasSetupBatteryMonitor = 0;
    v5->_supportsBudgetOverride = objc_msgSend(v4, "isSystemLibrary");
  }

  return v5;
}

- (void)_attemptScheduleRecoveryOverride:(unint64_t)a3 withReason:(unint64_t)a4
{
  NSMutableDictionary *scheduledOverrides;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  _CPLScheduledOverride *v12;

  if (self->_supportsBudgetOverride)
  {
    scheduledOverrides = self->_scheduledOverrides;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](scheduledOverrides, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v12 = -[_CPLScheduledOverride initWithBudget:withReason:queue:]([_CPLScheduledOverride alloc], "initWithBudget:withReason:queue:", a3, a4, self->_queue);
      if (-[_CPLScheduledOverride scheduleEndFromPersistedOverride](v12, "scheduleEndFromPersistedOverride"))
      {
        -[_CPLScheduledOverride setDelegate:](v12, "setDelegate:", self);
        v10 = self->_scheduledOverrides;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v12, v11);

        -[CPLEngineSystemMonitor _startOverridingBudget:reason:](self, "_startOverridingBudget:reason:", a3, a4);
      }

    }
  }
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__CPLEngineSystemMonitor_openWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E60D6708;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__CPLEngineSystemMonitor_closeAndDeactivate_completionHandler___block_invoke;
  v8[3] = &unk_1E60D6708;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (id)componentName
{
  return CFSTR("system");
}

- (unint64_t)diskPressureState
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  NSURL *volumeURL;
  _BOOL4 v7;
  id v8;
  unint64_t v9;
  void *v10;
  id v12;

  if (_shouldIgnoreLowDiskSpace)
  {
    v3 = 0;
    v4 = 0;
  }
  else
  {
    v5 = *MEMORY[0x1E0C99BB8];
    -[NSURL removeCachedResourceValueForKey:](self->_volumeURL, "removeCachedResourceValueForKey:", *MEMORY[0x1E0C99BB8]);
    volumeURL = self->_volumeURL;
    v12 = 0;
    v7 = -[NSURL getResourceValue:forKey:error:](volumeURL, "getResourceValue:forKey:error:", &v12, v5, 0);
    v8 = v12;
    v4 = v8;
    if (v7)
    {
      v9 = objc_msgSend(v8, "unsignedLongLongValue");
      if (v9 >> 29)
        v3 = v9 >> 30 == 0;
      else
        v3 = 2;
    }
    else
    {
      v3 = 0;
    }
  }
  -[CPLEngineSystemMonitor engineLibrary](self, "engineLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLowDiskSpace:veryLowDiskSpace:", v3 != 0, v3 == 2);

  return v3;
}

- (unint64_t)freeDiskSpaceSize
{
  uint64_t v3;
  NSURL *volumeURL;
  id v6;

  v3 = *MEMORY[0x1E0C99BB8];
  -[NSURL removeCachedResourceValueForKey:](self->_volumeURL, "removeCachedResourceValueForKey:", *MEMORY[0x1E0C99BB8]);
  volumeURL = self->_volumeURL;
  v6 = 0;
  if (-[NSURL getResourceValue:forKey:error:](volumeURL, "getResourceValue:forKey:error:", &v6, v3, 0))
    return objc_msgSend(v6, "unsignedLongLongValue");
  else
    return -1;
}

- (void)getStatusWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__CPLEngineSystemMonitor_getStatusWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E60D6708;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)getStatusDictionaryWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__CPLEngineSystemMonitor_getStatusDictionaryWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E60D6708;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (BOOL)isNetworkConnected
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__CPLEngineSystemMonitor_isNetworkConnected__block_invoke;
  v5[3] = &unk_1E60D64C8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isNetworkConstrained
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__CPLEngineSystemMonitor_isNetworkConstrained__block_invoke;
  v5[3] = &unk_1E60D64C8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isOnCellularOrUnknown
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__CPLEngineSystemMonitor_isOnCellularOrUnknown__block_invoke;
  v5[3] = &unk_1E60D64C8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)canBoostOperations
{
  return self->_allowOperationsBoost;
}

- (BOOL)canBoostBackgroundOperations
{
  NSObject *queue;
  BOOL v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  if (!self->_allowBackgroundOperationsBoost)
    return 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__CPLEngineSystemMonitor_canBoostBackgroundOperations__block_invoke;
  v5[3] = &unk_1E60D64C8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_startOverridingBudget:(unint64_t)a3 reason:(unint64_t)a4
{
  NSMutableDictionary *reasonsToOverrideSystemBudget;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[16];

  if (!self->_closed && self->_supportsBudgetOverride)
  {
    if (!self->_modifyingBudgetOverride)
    {
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_ERROR, "Trying to modify system budget override outside of an override transaction", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSystemMonitor.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v16, 761, CFSTR("Trying to modify system budget override outside of an override transaction"));

      abort();
    }
    reasonsToOverrideSystemBudget = self->_reasonsToOverrideSystemBudget;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](reasonsToOverrideSystemBudget, "objectForKeyedSubscript:", v8);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      v17 = objc_alloc_init(MEMORY[0x1E0CB3550]);
      v9 = self->_reasonsToOverrideSystemBudget;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v17, v10);

      v11 = self->_newBudgetsToStopOverriding & ~a3;
      self->_newBudgetsToOverride |= a3;
      self->_newBudgetsToStopOverriding = v11;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v12);

  }
}

- (void)_stopOverridingBudget:(unint64_t)a3 reason:(unint64_t)a4
{
  NSMutableDictionary *reasonsToOverrideSystemBudget;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!self->_closed && self->_supportsBudgetOverride)
  {
    if (!self->_modifyingBudgetOverride)
    {
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v24) = 0;
          _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_ERROR, "Trying to modify system budget override outside of an override transaction", (uint8_t *)&v24, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSystemMonitor.m");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v23, 779, CFSTR("Trying to modify system budget override outside of an override transaction"));

      abort();
    }
    reasonsToOverrideSystemBudget = self->_reasonsToOverrideSystemBudget;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](reasonsToOverrideSystemBudget, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "countForObject:", v10);

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObject:", v12);

      if (!objc_msgSend(v9, "count"))
      {
        v13 = self->_reasonsToOverrideSystemBudget;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](v13, "removeObjectForKey:", v14);

        v15 = self->_newBudgetsToStopOverriding | a3;
        self->_newBudgetsToOverride &= ~a3;
        self->_newBudgetsToStopOverriding = v15;
      }
    }
    else if (!_CPLSilentLogging)
    {
      __CPLSystemMonitorOSLogDomain();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "descriptionForBudget:", a3);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        if (a4 - 1 > 3)
          v19 = CFSTR("forced by user");
        else
          v19 = off_1E60DCE88[a4 - 1];
        v24 = 138543618;
        v25 = v17;
        v26 = 2114;
        v27 = v19;
        _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_ERROR, "Stopping overriding system budget for %{public}@ too many times with reason %{public}@", (uint8_t *)&v24, 0x16u);

      }
    }

  }
}

- (void)_withSystemBudgetOverride:(id)a3
{
  void *v4;
  void *v5;
  unint64_t newBudgetsToOverride;
  NSObject *v7;
  void *v8;
  unint64_t newBudgetsToStopOverriding;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_supportsBudgetOverride)
  {
    self->_modifyingBudgetOverride = 1;
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    -[CPLEngineSystemMonitor engineLibrary](self, "engineLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    newBudgetsToOverride = self->_newBudgetsToOverride;
    if (newBudgetsToOverride)
    {
      if (!_CPLSilentLogging)
      {
        __CPLSystemMonitorOSLogDomain();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend((id)objc_opt_class(), "descriptionForBudgets:", self->_newBudgetsToOverride);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 138543362;
          v13 = v8;
          _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Starting override for system budgets: %{public}@", (uint8_t *)&v12, 0xCu);

        }
        newBudgetsToOverride = self->_newBudgetsToOverride;
      }
      objc_msgSend(v5, "setShouldOverride:forSystemBudgets:", 1, newBudgetsToOverride);
      self->_newBudgetsToOverride = 0;
    }
    newBudgetsToStopOverriding = self->_newBudgetsToStopOverriding;
    if (newBudgetsToStopOverriding)
    {
      if (!_CPLSilentLogging)
      {
        __CPLSystemMonitorOSLogDomain();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend((id)objc_opt_class(), "descriptionForBudgets:", self->_newBudgetsToStopOverriding);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 138543362;
          v13 = v11;
          _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEFAULT, "Stopping override for system budgets: %{public}@", (uint8_t *)&v12, 0xCu);

        }
        newBudgetsToStopOverriding = self->_newBudgetsToStopOverriding;
      }
      objc_msgSend(v5, "setShouldOverride:forSystemBudgets:", 0, newBudgetsToStopOverriding);
      self->_newBudgetsToStopOverriding = 0;
    }
    self->_modifyingBudgetOverride = 0;

  }
}

- (void)startOverridingSystemBudgets:(unint64_t)a3 reason:(unint64_t)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__CPLEngineSystemMonitor_startOverridingSystemBudgets_reason___block_invoke;
  block[3] = &unk_1E60DD0C0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(queue, block);
}

- (void)stopOverridingSystemBudgets:(unint64_t)a3 reason:(unint64_t)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__CPLEngineSystemMonitor_stopOverridingSystemBudgets_reason___block_invoke;
  block[3] = &unk_1E60DD0C0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(queue, block);
}

- (void)startOverridingSystemBudgetsForClient:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__CPLEngineSystemMonitor_startOverridingSystemBudgetsForClient___block_invoke;
  v4[3] = &unk_1E60D6DF8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (void)stopOverridingSystemBudgetsForClient:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__CPLEngineSystemMonitor_stopOverridingSystemBudgetsForClient___block_invoke;
  v4[3] = &unk_1E60D6DF8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (BOOL)isDataBudgetOverriden
{
  NSObject *queue;
  BOOL v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  if (!self->_supportsBudgetOverride)
    return 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__CPLEngineSystemMonitor_isDataBudgetOverriden__block_invoke;
  v5[3] = &unk_1E60D64C8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)hasEnoughPowerForAutomaticOverride
{
  return 0;
}

- (void)scheduledOverrideDidEnd:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableDictionary *scheduledOverrides;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  CPLEngineSystemMonitor *v11;
  uint64_t v12;

  v4 = a3;
  if (self->_supportsBudgetOverride)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    v5 = objc_msgSend(v4, "budget");
    scheduledOverrides = self->_scheduledOverrides;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](scheduledOverrides, "objectForKeyedSubscript:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v4)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __50__CPLEngineSystemMonitor_scheduledOverrideDidEnd___block_invoke;
      v9[3] = &unk_1E60D6E20;
      v10 = v4;
      v11 = self;
      v12 = v5;
      -[CPLEngineSystemMonitor _withSystemBudgetOverride:](self, "_withSystemBudgetOverride:", v9);

    }
  }

}

- (BOOL)_hasPermanentDataOverride
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
  return CFPreferencesGetAppBooleanValue(CFSTR("unlimitedSyncOverCellular"), CFSTR("com.apple.mobileslideshow"), 0) != 0;
}

- (void)_permanentDataOverrideHasChanged
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__CPLEngineSystemMonitor__permanentDataOverrideHasChanged__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_18977;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)_startWatchingPermanentDataOverride
{
  __CFNotificationCenter *DarwinNotifyCenter;
  _BOOL4 v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_unlimitedSyncOverCellularDidChange, CFSTR("com.apple.mobileslideshow.PLNotificationUnlimitedSyncOverCellularChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v4 = -[CPLEngineSystemMonitor _hasPermanentDataOverride](self, "_hasPermanentDataOverride");
  self->_overrideDataSystemBudgetPermanently = v4;
  if (v4)
    -[CPLEngineSystemMonitor _startOverridingBudget:reason:](self, "_startOverridingBudget:reason:", 1, 4);
}

- (void)_stopWatchingPermanentDataOverride
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.mobileslideshow.PLNotificationUnlimitedSyncOverCellularChanged"), 0);
}

- (void)startAutomaticOverridingSystemBudgets:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__CPLEngineSystemMonitor_startAutomaticOverridingSystemBudgets___block_invoke;
  v4[3] = &unk_1E60D6DF8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (void)stopAutomaticOverridingSystemBudgets:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__CPLEngineSystemMonitor_stopAutomaticOverridingSystemBudgets___block_invoke;
  v4[3] = &unk_1E60D6DF8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)watcher:(id)a3 stateDidChangeToNetworkState:(id)a4
{
  id v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  id v10;
  dispatch_block_t v11;
  _QWORD v12[5];
  id v13;
  _QWORD block[4];
  id v15;

  v5 = a4;
  queue = self->_queue;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__CPLEngineSystemMonitor_watcher_stateDidChangeToNetworkState___block_invoke;
  v12[3] = &unk_1E60D6F88;
  v12[4] = self;
  v13 = v5;
  v8 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_18977;
  block[3] = &unk_1E60D71F8;
  v15 = v8;
  v9 = queue;
  v10 = v5;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);

}

- (double)_minimumBatteryLevelForAutoOverrideEnergyBudget
{
  if (_minimumBatteryLevelForAutoOverrideEnergyBudget_onceToken != -1)
    dispatch_once(&_minimumBatteryLevelForAutoOverrideEnergyBudget_onceToken, &__block_literal_global_18972);
  return *(double *)&_minimumBatteryLevelForAutoOverrideEnergyBudget_minimumBatteryLevelForAutoOverride;
}

- (void)batteryLevelDidChangeWithLevel:(double)a3
{
  double v5;

  -[CPLEngineSystemMonitor _minimumBatteryLevelForAutoOverrideEnergyBudget](self, "_minimumBatteryLevelForAutoOverrideEnergyBudget");
  if (v5 >= a3)
    -[CPLEngineSystemMonitor stopAutomaticOverridingSystemBudgets:](self, "stopAutomaticOverridingSystemBudgets:", 2);
}

- (CPLEngineLibrary)engineLibrary
{
  return (CPLEngineLibrary *)objc_loadWeakRetained((id *)&self->_engineLibrary);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_engineLibrary);
  objc_storeStrong((id *)&self->_scheduledOverrides, 0);
  objc_storeStrong((id *)&self->_reasonsToOverrideSystemBudget, 0);
  objc_storeStrong((id *)&self->_watcher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_volumeURL, 0);
}

void __73__CPLEngineSystemMonitor__minimumBatteryLevelForAutoOverrideEnergyBudget__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("CPLMinimumBatteryLevelForAutoOverrideSystemBudget"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  _minimumBatteryLevelForAutoOverrideEnergyBudget_minimumBatteryLevelForAutoOverride = v2;

  if (*(double *)&_minimumBatteryLevelForAutoOverrideEnergyBudget_minimumBatteryLevelForAutoOverride == 0.0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSystemMonitorOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        v4 = 134217984;
        v5 = _minimumBatteryLevelForAutoOverrideEnergyBudget_minimumBatteryLevelForAutoOverride;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEBUG, "Minimum battery level value not set or invalid: %f", (uint8_t *)&v4, 0xCu);
      }

    }
    _minimumBatteryLevelForAutoOverrideEnergyBudget_minimumBatteryLevelForAutoOverride = 0x4059000000000000;
  }
}

void __63__CPLEngineSystemMonitor_watcher_stateDidChangeToNetworkState___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[8])
  {
    if (!_CPLSilentLogging)
    {
      __CPLSystemMonitorOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(a1 + 40);
        v14 = 138412290;
        v15 = v4;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "Network state changed to %@", (uint8_t *)&v14, 0xCu);
      }

      v2 = *(_BYTE **)(a1 + 32);
    }
    objc_msgSend(v2, "engineLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 40), "isConnected");
    v7 = *(void **)(a1 + 40);
    if (v6)
    {
      if (objc_msgSend(v7, "canUseNetwork"))
      {
        objc_msgSend(v5, "feedback");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "sendFeedbackToServerIfNecessary");

        objc_msgSend(v5, "scheduler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "noteNetworkStateDidChange");

      }
      if (objc_msgSend(*(id *)(a1 + 40), "isCellular"))
        v10 = objc_msgSend(*(id *)(a1 + 40), "isCellularRestricted");
      else
        v10 = 0;
      v12 = v5;
      v13 = 1;
      v11 = 0;
    }
    else
    {
      v11 = objc_msgSend(v7, "isInAirplaneMode");
      v12 = v5;
      v13 = 0;
      v10 = 0;
    }
    objc_msgSend(v12, "setConnectedToNetwork:cellularIsRestricted:inAirplaneMode:", v13, v10, v11);

  }
}

uint64_t __63__CPLEngineSystemMonitor_stopAutomaticOverridingSystemBudgets___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[4];
  id v4;
  uint64_t v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__CPLEngineSystemMonitor_stopAutomaticOverridingSystemBudgets___block_invoke_2;
  v3[3] = &unk_1E60D6DF8;
  v1 = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v1;
  return objc_msgSend(v4, "_withSystemBudgetOverride:", v3);
}

uint64_t __63__CPLEngineSystemMonitor_stopAutomaticOverridingSystemBudgets___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v5[5];

  v2 = (void *)objc_opt_class();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__CPLEngineSystemMonitor_stopAutomaticOverridingSystemBudgets___block_invoke_3;
  v5[3] = &unk_1E60DCD30;
  v3 = *(_QWORD *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "enumerateSystemBudgets:withBlock:", v3, v5);
}

void __63__CPLEngineSystemMonitor_stopAutomaticOverridingSystemBudgets___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && objc_msgSend(v8, "containsObject:", &unk_1E611A3F0))
  {
    objc_msgSend(v11, "setDelegate:", 0);
    objc_msgSend(v11, "cancel");
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v10);

    objc_msgSend(*(id *)(a1 + 32), "_stopOverridingBudget:reason:", a2, 1);
  }

}

uint64_t __64__CPLEngineSystemMonitor_startAutomaticOverridingSystemBudgets___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[4];
  id v4;
  uint64_t v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__CPLEngineSystemMonitor_startAutomaticOverridingSystemBudgets___block_invoke_2;
  v3[3] = &unk_1E60D6DF8;
  v1 = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v1;
  return objc_msgSend(v4, "_withSystemBudgetOverride:", v3);
}

uint64_t __64__CPLEngineSystemMonitor_startAutomaticOverridingSystemBudgets___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v5[5];

  v2 = (void *)objc_opt_class();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__CPLEngineSystemMonitor_startAutomaticOverridingSystemBudgets___block_invoke_3;
  v5[3] = &unk_1E60DCD30;
  v3 = *(_QWORD *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "enumerateSystemBudgets:withBlock:", v3, v5);
}

void __64__CPLEngineSystemMonitor_startAutomaticOverridingSystemBudgets___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _CPLScheduledOverride *v9;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v9 = -[_CPLScheduledOverride initWithBudget:withReason:queue:]([_CPLScheduledOverride alloc], "initWithBudget:withReason:queue:", a2, 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    -[_CPLScheduledOverride setDelegate:](v9, "setDelegate:", *(_QWORD *)(a1 + 32));
    if (-[_CPLScheduledOverride scheduleEndOfOverride](v9, "scheduleEndOfOverride"))
    {
      v7 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);

      objc_msgSend(*(id *)(a1 + 32), "_startOverridingBudget:reason:", a2, 1);
    }

  }
}

_BYTE *__58__CPLEngineSystemMonitor__permanentDataOverrideHasChanged__block_invoke(uint64_t a1)
{
  _BYTE *result;
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  result = *(_BYTE **)(a1 + 32);
  if (!result[8])
  {
    if (!_CPLSilentLogging)
    {
      __CPLSystemMonitorOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "Permanent Data override has changed", buf, 2u);
      }

      result = *(_BYTE **)(a1 + 32);
    }
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __58__CPLEngineSystemMonitor__permanentDataOverrideHasChanged__block_invoke_148;
    v4[3] = &unk_1E60D65B8;
    v4[4] = result;
    return (_BYTE *)objc_msgSend(result, "_withSystemBudgetOverride:", v4);
  }
  return result;
}

_BYTE *__58__CPLEngineSystemMonitor__permanentDataOverrideHasChanged__block_invoke_148(uint64_t a1)
{
  int v2;
  _BYTE *result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_hasPermanentDataOverride");
  result = *(_BYTE **)(a1 + 32);
  if (v2)
  {
    if (!result[80])
      result = (_BYTE *)objc_msgSend(result, "_startOverridingBudget:reason:", 1, 4);
  }
  else if (result[80])
  {
    result = (_BYTE *)objc_msgSend(result, "_stopOverridingBudget:reason:", 1, 4);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = v2;
  return result;
}

uint64_t __50__CPLEngineSystemMonitor_scheduledOverrideDidEnd___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", 0);
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  return objc_msgSend(*(id *)(a1 + 40), "_stopOverridingBudget:reason:", *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "reason"));
}

void __47__CPLEngineSystemMonitor_isDataBudgetOverriden__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKeyedSubscript:", &unk_1E611A3F0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count") != 0;

}

uint64_t __63__CPLEngineSystemMonitor_stopOverridingSystemBudgetsForClient___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[4];
  id v4;
  uint64_t v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__CPLEngineSystemMonitor_stopOverridingSystemBudgetsForClient___block_invoke_2;
  v3[3] = &unk_1E60D6DF8;
  v1 = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v1;
  return objc_msgSend(v4, "_withSystemBudgetOverride:", v3);
}

uint64_t __63__CPLEngineSystemMonitor_stopOverridingSystemBudgetsForClient___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v5[5];

  v2 = (void *)objc_opt_class();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__CPLEngineSystemMonitor_stopOverridingSystemBudgetsForClient___block_invoke_3;
  v5[3] = &unk_1E60DCD30;
  v3 = *(_QWORD *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "enumerateSystemBudgets:withBlock:", v3, v5);
}

void __63__CPLEngineSystemMonitor_stopOverridingSystemBudgetsForClient___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && objc_msgSend(v8, "containsObject:", &unk_1E611A3D8))
  {
    objc_msgSend(v11, "setDelegate:", 0);
    objc_msgSend(v11, "resetHeuristics");
    objc_msgSend(v11, "cancel");
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v10);

    objc_msgSend(*(id *)(a1 + 32), "_stopOverridingBudget:reason:", a2, 0);
  }

}

uint64_t __64__CPLEngineSystemMonitor_startOverridingSystemBudgetsForClient___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[4];
  id v4;
  uint64_t v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__CPLEngineSystemMonitor_startOverridingSystemBudgetsForClient___block_invoke_2;
  v3[3] = &unk_1E60D6DF8;
  v1 = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v1;
  return objc_msgSend(v4, "_withSystemBudgetOverride:", v3);
}

uint64_t __64__CPLEngineSystemMonitor_startOverridingSystemBudgetsForClient___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v5[5];

  v2 = (void *)objc_opt_class();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__CPLEngineSystemMonitor_startOverridingSystemBudgetsForClient___block_invoke_3;
  v5[3] = &unk_1E60DCD30;
  v3 = *(_QWORD *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "enumerateSystemBudgets:withBlock:", v3, v5);
}

void __64__CPLEngineSystemMonitor_startOverridingSystemBudgetsForClient___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _CPLScheduledOverride *v9;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v9 = -[_CPLScheduledOverride initWithBudget:withReason:queue:]([_CPLScheduledOverride alloc], "initWithBudget:withReason:queue:", a2, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    -[_CPLScheduledOverride setDelegate:](v9, "setDelegate:", *(_QWORD *)(a1 + 32));
    if (-[_CPLScheduledOverride scheduleEndOfOverride](v9, "scheduleEndOfOverride"))
    {
      v7 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);

      objc_msgSend(*(id *)(a1 + 32), "_startOverridingBudget:reason:", a2, 0);
    }

  }
}

uint64_t __61__CPLEngineSystemMonitor_stopOverridingSystemBudgets_reason___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];
  __int128 v4;

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__CPLEngineSystemMonitor_stopOverridingSystemBudgets_reason___block_invoke_2;
  v3[3] = &unk_1E60DD0C0;
  v3[4] = v1;
  v4 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(v1, "_withSystemBudgetOverride:", v3);
}

uint64_t __61__CPLEngineSystemMonitor_stopOverridingSystemBudgets_reason___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[6];

  v2 = (void *)objc_opt_class();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__CPLEngineSystemMonitor_stopOverridingSystemBudgets_reason___block_invoke_3;
  v6[3] = &unk_1E60DCDD0;
  v3 = a1[5];
  v4 = a1[6];
  v6[4] = a1[4];
  v6[5] = v4;
  return objc_msgSend(v2, "enumerateSystemBudgets:withBlock:", v3, v6);
}

uint64_t __61__CPLEngineSystemMonitor_stopOverridingSystemBudgets_reason___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopOverridingBudget:reason:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __62__CPLEngineSystemMonitor_startOverridingSystemBudgets_reason___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];
  __int128 v4;

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__CPLEngineSystemMonitor_startOverridingSystemBudgets_reason___block_invoke_2;
  v3[3] = &unk_1E60DD0C0;
  v3[4] = v1;
  v4 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(v1, "_withSystemBudgetOverride:", v3);
}

uint64_t __62__CPLEngineSystemMonitor_startOverridingSystemBudgets_reason___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[6];

  v2 = (void *)objc_opt_class();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__CPLEngineSystemMonitor_startOverridingSystemBudgets_reason___block_invoke_3;
  v6[3] = &unk_1E60DCDD0;
  v3 = a1[5];
  v4 = a1[6];
  v6[4] = a1[4];
  v6[5] = v4;
  return objc_msgSend(v2, "enumerateSystemBudgets:withBlock:", v3, v6);
}

uint64_t __62__CPLEngineSystemMonitor_startOverridingSystemBudgets_reason___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startOverridingBudget:reason:", a2, *(_QWORD *)(a1 + 40));
}

void __54__CPLEngineSystemMonitor_canBoostBackgroundOperations__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "networkState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isCellular") ^ 1;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = +[CPLPowerAssertion hasEnoughPower](CPLPowerAssertion, "hasEnoughPower");
}

void __47__CPLEngineSystemMonitor_isOnCellularOrUnknown__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "networkState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isCellular");

}

void __46__CPLEngineSystemMonitor_isNetworkConstrained__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "networkState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isConstrained");

}

void __44__CPLEngineSystemMonitor_isNetworkConnected__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "networkState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isConnected");

}

void __67__CPLEngineSystemMonitor_getStatusDictionaryWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  int v5;
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void *v27;
  uint64_t v28;
  id v29;
  _QWORD v30[7];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t state64;
  int out_token;
  id v45;
  id v46;
  const __CFString *v47;
  uint64_t v48;
  _QWORD v49[2];
  _QWORD v50[3];

  v50[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = *MEMORY[0x1E0C99BB8];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeCachedResourceValueForKey:", *MEMORY[0x1E0C99BB8]);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v45 = 0;
  v46 = 0;
  v5 = objc_msgSend(v4, "getResourceValue:forKey:error:", &v46, v3, &v45);
  v6 = v46;
  v7 = v45;
  if (!v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_38;
  }
  v8 = objc_msgSend(*(id *)(a1 + 32), "diskPressureState");
  if (v8 <= 2)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", off_1E60DCE70[v8], CFSTR("diskPressure"));
  if (v6)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("diskAvailableSpace"));
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (v9)
  {
    objc_msgSend(v9, "networkState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "plistDescription");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (const __CFString *)v11;
    else
      v13 = CFSTR("unknown");
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, CFSTR("network"));

  }
  +[CPLBatteryMonitor powerStatusPlist](CPLBatteryMonitor, "powerStatusPlist");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v14, CFSTR("power"));
  out_token = 0;
  state64 = 0;
  if (notify_register_check((const char *)*MEMORY[0x1E0C83A00], &out_token))
    goto LABEL_14;
  notify_get_state(out_token, &state64);
  notify_cancel(out_token);
  if ((uint64_t)state64 > 29)
  {
    switch(state64)
    {
      case 0x1EuLL:
        v15 = CFSTR("Heavy");
        goto LABEL_15;
      case 0x28uLL:
        v15 = CFSTR("Trapping");
        goto LABEL_15;
      case 0x32uLL:
        v15 = CFSTR("Sleeping");
        goto LABEL_15;
    }
    goto LABEL_42;
  }
  if (state64)
  {
    if (state64 == 10)
    {
      v15 = CFSTR("Light");
      goto LABEL_15;
    }
    if (state64 == 20)
    {
      v15 = CFSTR("Moderate");
      goto LABEL_15;
    }
LABEL_42:
    v15 = CFSTR("Unknown");
    goto LABEL_15;
  }
LABEL_14:
  v15 = CFSTR("Nominal");
LABEL_15:
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, CFSTR("thermal"));
  v16 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v16 + 40))
  {
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__19127;
    v41 = __Block_byref_object_dispose__19128;
    v42 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__19127;
    v35 = __Block_byref_object_dispose__19128;
    v36 = 0;
    v17 = *(void **)(v16 + 64);
    v18 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __67__CPLEngineSystemMonitor_getStatusDictionaryWithCompletionHandler___block_invoke_91;
    v30[3] = &unk_1E60DCDA8;
    v30[5] = &v37;
    v30[6] = &v31;
    v30[4] = v16;
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v30);
    v19 = v38[5];
    if (v19)
    {
      v20 = v32[5];
      if (v20)
      {
        v49[0] = CFSTR("reasons");
        v49[1] = CFSTR("scheduledEndDates");
        v50[0] = v19;
        v50[1] = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
      }
      else
      {
        v47 = CFSTR("reasons");
        v48 = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v21, CFSTR("budgetOverrides"));

    }
    v22 = (void *)objc_opt_class();
    v24 = v18;
    v25 = 3221225472;
    v26 = __67__CPLEngineSystemMonitor_getStatusDictionaryWithCompletionHandler___block_invoke_101;
    v27 = &unk_1E60DCD80;
    v28 = *(_QWORD *)(a1 + 32);
    v29 = v2;
    objc_msgSend(v22, "enumerateSystemBudgets:withBlock:", 18487, &v24);

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v37, 8);

    v16 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v16 + 81))
  {
    if (*(_BYTE *)(v16 + 82))
      v23 = CFSTR("all");
    else
      v23 = CFSTR("foreground");
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v23, CFSTR("allowOperationBoot"), v24, v25, v26, v27, v28);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

LABEL_38:
}

void __67__CPLEngineSystemMonitor_getStatusDictionaryWithCompletionHandler___block_invoke_91(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  v5 = a3;
  if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = *(_QWORD *)(a1[5] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  +[CPLEngineSystemMonitor descriptionForBudget:](CPLEngineSystemMonitor, "descriptionForBudget:", objc_msgSend(v18, "unsignedIntegerValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "setObject:forKeyedSubscript:", v10, v9);

  if ((objc_msgSend(v5, "containsObject:", &unk_1E611A3D8) & 1) != 0
    || objc_msgSend(v5, "containsObject:", &unk_1E611A3F0))
  {
    if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v12 = *(_QWORD *)(a1[6] + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

    }
    objc_msgSend(*(id *)(a1[4] + 72), "objectForKeyedSubscript:", v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v15, "timeIntervalSinceReferenceDate");
      objc_msgSend(v16, "numberWithDouble:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setObject:forKeyedSubscript:", v17, v9);

    }
  }

}

void __67__CPLEngineSystemMonitor_getStatusDictionaryWithCompletionHandler___block_invoke_101(uint64_t a1, uint64_t a2)
{
  double v4;
  void *v5;
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
  void *v17;
  id v18;

  if (+[_CPLScheduledOverride isBudgetTypeSupportedForProgressiveOverriding:withReason:](_CPLScheduledOverride, "isBudgetTypeSupportedForProgressiveOverriding:withReason:", a2, 0))
  {
    +[_CPLScheduledOverride currentBudgetOverrideTimeIntervalStorageKeyForBudget:](_CPLScheduledOverride, "currentBudgetOverrideTimeIntervalStorageKeyForBudget:", a2);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v4 = _CPLSystemMonitorReadOverrideTimeIntervalFromSharedDefaults(v18) / 3600.0;
    +[_CPLScheduledOverride currentBudgetOverrideTimeIntervalExpiryDateStorageKeyForBudget:](_CPLScheduledOverride, "currentBudgetOverrideTimeIntervalExpiryDateStorageKeyForBudget:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _CPLSystemMonitorReadOverrideTimeIntervalExpiryDateFromSharedDefaults(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 > 0.0)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend((id)objc_opt_class(), "descriptionForBudget:", a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@_lastUsedBudgetOverrideTime"), v8, v18);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.f hours"), *(_QWORD *)&v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v9);

      if (v6)
      {
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend((id)objc_opt_class(), "descriptionForBudget:", a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@_expiryDate"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", v6, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%@"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v17, v13);

      }
    }

  }
}

void __57__CPLEngineSystemMonitor_getStatusWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  int v5;
  id v6;
  id v7;
  const __CFString *v8;
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  _QWORD v33[5];
  id v34;
  uint64_t state64;
  int out_token;
  id v37;
  id v38;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = *MEMORY[0x1E0C99BB8];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeCachedResourceValueForKey:", *MEMORY[0x1E0C99BB8]);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v37 = 0;
  v38 = 0;
  v5 = objc_msgSend(v4, "getResourceValue:forKey:error:", &v38, v3, &v37);
  v6 = v38;
  v7 = v37;
  if (!v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_28;
  }
  objc_msgSend(v6, "unsignedLongLongValue");
  if (_shouldIgnoreLowDiskSpace)
  {
    v8 = CFSTR("ignoring low disk space");
  }
  else
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "diskPressureState");
    if (v9 > 2)
      v8 = 0;
    else
      v8 = off_1E60DCE58[v9];
  }
  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  NSLocalizedFileSizeDescription();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%@ - %@"), v8, v11);
  objc_msgSend(v2, "addObject:", v12);

  v13 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (v13)
  {
    objc_msgSend(v13, "networkState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v15);

  }
  +[CPLBatteryMonitor powerStatus](CPLBatteryMonitor, "powerStatus");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v2, "addObject:", v16);
  out_token = 0;
  state64 = 0;
  if (notify_register_check((const char *)*MEMORY[0x1E0C83A00], &out_token))
    goto LABEL_13;
  notify_get_state(out_token, &state64);
  notify_cancel(out_token);
  if ((uint64_t)state64 > 29)
  {
    switch(state64)
    {
      case 0x1EuLL:
        v17 = CFSTR("Heavy");
        goto LABEL_14;
      case 0x28uLL:
        v17 = CFSTR("Trapping");
        goto LABEL_14;
      case 0x32uLL:
        v17 = CFSTR("Sleeping");
        goto LABEL_14;
    }
    goto LABEL_36;
  }
  if (state64)
  {
    if (state64 == 10)
    {
      v17 = CFSTR("Light");
      goto LABEL_14;
    }
    if (state64 == 20)
    {
      v17 = CFSTR("Moderate");
      goto LABEL_14;
    }
LABEL_36:
    v17 = CFSTR("Unknown");
    goto LABEL_14;
  }
LABEL_13:
  v17 = CFSTR("Nominal");
LABEL_14:
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("thermal level: %@"), v17);
  objc_msgSend(v2, "addObject:", v18);

  v19 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v19 + 40))
  {
    v20 = MEMORY[0x1E0C809B0];
    v21 = *(void **)(v19 + 64);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __57__CPLEngineSystemMonitor_getStatusWithCompletionHandler___block_invoke_2;
    v33[3] = &unk_1E60DCD58;
    v33[4] = v19;
    v22 = v2;
    v34 = v22;
    objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v33);
    v23 = (void *)objc_opt_class();
    v30[0] = v20;
    v30[1] = 3221225472;
    v30[2] = __57__CPLEngineSystemMonitor_getStatusWithCompletionHandler___block_invoke_3;
    v30[3] = &unk_1E60DCD80;
    v24 = v22;
    v25 = *(_QWORD *)(a1 + 32);
    v31 = v24;
    v32 = v25;
    objc_msgSend(v23, "enumerateSystemBudgets:withBlock:", 18487, v30);

  }
  else
  {
    objc_msgSend(v2, "addObject:", CFSTR("engine does not support budget overrides"));
  }
  v26 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v26 + 81))
  {
    if (*(_BYTE *)(v26 + 82))
      v27 = CFSTR("allowing operations boost (including background)");
    else
      v27 = CFSTR("allowing operations boost");
    objc_msgSend(v2, "addObject:", v27);
  }
  v28 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR("\n"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v28 + 16))(v28, v29, 0);

LABEL_28:
}

void __57__CPLEngineSystemMonitor_getStatusWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  const __CFString *v20;
  void *v21;
  unint64_t v22;
  const __CFString *v23;
  const __CFString *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v25 = v5;
  v7 = objc_msgSend(v5, "unsignedIntegerValue");
  v8 = objc_alloc(MEMORY[0x1E0CB37A0]);
  +[CPLEngineSystemMonitor descriptionForBudget:](CPLEngineSystemMonitor, "descriptionForBudget:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("overriding %@ budget: "), v9);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 1;
    v15 = *(_QWORD *)v27;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v16);
        if ((v14 & 1) == 0)
          objc_msgSend(v10, "appendString:", CFSTR(", "));
        if (objc_msgSend(v17, "integerValue") && objc_msgSend(v17, "integerValue") != 1)
        {
          v22 = objc_msgSend(v17, "integerValue") - 1;
          v23 = CFSTR("forced by user");
          if (v22 <= 3)
            v23 = off_1E60DCE88[v22];
          objc_msgSend(v10, "appendString:", v23);
        }
        else
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKeyedSubscript:", v25);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "integerValue") - 1;
          if (v18)
          {
            v20 = CFSTR("forced by user");
            if (v19 <= 3)
              v20 = off_1E60DCE88[v19];
            objc_msgSend(v18, "status");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "appendFormat:", CFSTR("%@ (%@)"), v20, v21);

          }
          else
          {
            v24 = CFSTR("forced by user");
            if (v19 <= 3)
              v24 = off_1E60DCE88[v19];
            objc_msgSend(v10, "appendFormat:", CFSTR("%@ (no scheduled end)"), v24);
          }

        }
        v14 = 0;
        ++v16;
      }
      while (v13 != v16);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      v14 = 0;
    }
    while (v13);
  }

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
}

void __57__CPLEngineSystemMonitor_getStatusWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  if (+[_CPLScheduledOverride isBudgetTypeSupportedForProgressiveOverriding:withReason:](_CPLScheduledOverride, "isBudgetTypeSupportedForProgressiveOverriding:withReason:", a2, 0))
  {
    +[_CPLScheduledOverride currentBudgetOverrideTimeIntervalStorageKeyForBudget:](_CPLScheduledOverride, "currentBudgetOverrideTimeIntervalStorageKeyForBudget:", a2);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v4 = _CPLSystemMonitorReadOverrideTimeIntervalFromSharedDefaults(v19) / 3600.0;
    +[_CPLScheduledOverride currentBudgetOverrideTimeIntervalExpiryDateStorageKeyForBudget:](_CPLScheduledOverride, "currentBudgetOverrideTimeIntervalExpiryDateStorageKeyForBudget:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _CPLSystemMonitorReadOverrideTimeIntervalExpiryDateFromSharedDefaults(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 <= 0.0)
    {
LABEL_11:

      return;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v7);
    v9 = v8;

    if (v9 <= 1.0)
    {
      if (v9 >= -1.0)
      {
        v14 = &stru_1E60DF6B8;
        goto LABEL_10;
      }
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", v6, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("already expired %@"), v12);
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", v6, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("expiring %@"), v12);
    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_10:
    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = *(void **)(a1 + 32);
    objc_msgSend((id)objc_opt_class(), "descriptionForBudget:", a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("last used budget override time interval for %@: %.f hours. %@"), v17, *(_QWORD *)&v4, v14, v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v18);

    goto LABEL_11;
  }
}

uint64_t __63__CPLEngineSystemMonitor_closeAndDeactivate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setDelegate:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "stop");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  +[CPLBatteryMonitor setDelegate:](CPLBatteryMonitor, "setDelegate:", 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 83) = 0;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__CPLEngineSystemMonitor_closeAndDeactivate_completionHandler___block_invoke_2;
  v6[3] = &unk_1E60D65B8;
  v6[4] = v4;
  objc_msgSend(v4, "_withSystemBudgetOverride:", v6);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __63__CPLEngineSystemMonitor_closeAndDeactivate_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_stopWatchingPermanentDataOverride");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 18495;
  return result;
}

uint64_t __52__CPLEngineSystemMonitor_openWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  const char *v5;
  CPLNetworkWatcher *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 81) = objc_msgSend(v2, "BOOLForKey:", CFSTR("CPLAllowOperationsBoost"));

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 81))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 82) = objc_msgSend(v3, "BOOLForKey:", CFSTR("CPLAllowBackgroundOperationsBoost"));

    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 82))
    {
      if (!_CPLSilentLogging)
      {
        __CPLSystemMonitorOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v5 = "Will boost operations, including background, when possible";
LABEL_9:
          _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
    else if (!_CPLSilentLogging)
    {
      __CPLSystemMonitorOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v5 = "Will boost operations when possible";
        goto LABEL_9;
      }
LABEL_10:

    }
  }
  v6 = -[CPLNetworkWatcher initWithQueue:]([CPLNetworkWatcher alloc], "initWithQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 32);
  *(_QWORD *)(v7 + 32) = v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "start");
  +[CPLBatteryMonitor setDelegate:](CPLBatteryMonitor, "setDelegate:", *(_QWORD *)(a1 + 32));
  +[CPLBatteryMonitor startMonitoringPowerEvents](CPLBatteryMonitor, "startMonitoringPowerEvents");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 83) = 1;
  v9 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__CPLEngineSystemMonitor_openWithCompletionHandler___block_invoke_11;
  v11[3] = &unk_1E60D65B8;
  v11[4] = v9;
  objc_msgSend(v9, "_withSystemBudgetOverride:", v11);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __52__CPLEngineSystemMonitor_openWithCompletionHandler___block_invoke_11(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 18495;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) &= ~objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6++), "unsignedIntegerValue");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "_startWatchingPermanentDataOverride");
  v7 = (void *)objc_opt_class();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__CPLEngineSystemMonitor_openWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E60DCD30;
  v9[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v7, "enumerateSystemBudgets:withBlock:", 18495, v9);
}

uint64_t __52__CPLEngineSystemMonitor_openWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_attemptScheduleRecoveryOverride:withReason:", a2, 0);
  return objc_msgSend(*(id *)(a1 + 32), "_attemptScheduleRecoveryOverride:withReason:", a2, 1);
}

+ (void)initialize
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  _shouldIgnoreLowDiskSpace = objc_msgSend(v2, "BOOLForKey:", CFSTR("CPLShouldIgnoreLowDiskSpace"));

}

+ (BOOL)shouldIgnoreLowDiskSpace
{
  return _shouldIgnoreLowDiskSpace;
}

+ (void)setShouldIgnoreLowDiskSpace:(BOOL)a3
{
  _shouldIgnoreLowDiskSpace = a3;
}

+ (id)descriptionForBudget:(unint64_t)a3
{
  __CFString *v3;

  if ((uint64_t)a3 > 15)
  {
    if ((uint64_t)a3 <= 2047)
    {
      if (a3 == 16)
      {
        v3 = CFSTR("Low Data Mode");
        return v3;
      }
      if (a3 == 32)
      {
        v3 = CFSTR("Low Power Mode");
        return v3;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x800uLL:
          v3 = CFSTR("Thermal Moderate");
          return v3;
        case 0x4000uLL:
          v3 = CFSTR("All Other");
          return v3;
        case 0x4837uLL:
          v3 = CFSTR("All");
          return v3;
      }
    }
LABEL_18:
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("???(0x%lx)"), a3);
    return v3;
  }
  v3 = CFSTR("Data");
  switch(a3)
  {
    case 0uLL:
      v3 = CFSTR("None");
      break;
    case 1uLL:
      return v3;
    case 2uLL:
      v3 = CFSTR("Energy");
      break;
    case 4uLL:
      v3 = CFSTR("SignificantWork");
      break;
    case 8uLL:
      v3 = CFSTR("Foreground");
      break;
    default:
      goto LABEL_18;
  }
  return v3;
}

+ (id)descriptionForBudgets:(unint64_t)a3
{
  id v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void *v12;
  id v13;
  id v14;

  if (!a3)
    return CFSTR("none");
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __48__CPLEngineSystemMonitor_descriptionForBudgets___block_invoke;
  v12 = &unk_1E60DCDD0;
  v13 = v5;
  v14 = a1;
  v6 = v5;
  objc_msgSend(a1, "enumerateSystemBudgets:withBlock:", a3, &v9);
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "), v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)enumerateSystemBudgets:(unint64_t)a3 withBlock:(id)a4
{
  unint64_t v6;
  unint64_t v7;

  v6 = 1;
  do
  {
    if ((v6 & a3) != 0)
      (*((void (**)(id, unint64_t))a4 + 2))(a4, v6);
    v7 = v6 >> 5;
    v6 *= 2;
  }
  while (v7 < 0x121);
}

+ (double)nextOverrideTimeIntervalForSystemBudgets:(unint64_t)a3
{
  void *v4;
  double v5;
  _QWORD v7[5];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0x40AC200000000000;
  v4 = (void *)objc_opt_class();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__CPLEngineSystemMonitor_nextOverrideTimeIntervalForSystemBudgets___block_invoke;
  v7[3] = &unk_1E60DCDF8;
  v7[4] = &v8;
  objc_msgSend(v4, "enumerateSystemBudgets:withBlock:", a3, v7);
  v5 = fmin(v9[3], 86400.0);
  v9[3] = v5;
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __67__CPLEngineSystemMonitor_nextOverrideTimeIntervalForSystemBudgets___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  double v4;
  uint64_t v5;

  result = +[_CPLScheduledOverride nextTimeIntervalForOverridingBudget:withReason:](_CPLScheduledOverride, "nextTimeIntervalForOverridingBudget:withReason:", a2, 0);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(double *)(v5 + 24) >= v4)
    v4 = *(double *)(v5 + 24);
  *(double *)(v5 + 24) = v4;
  return result;
}

void __48__CPLEngineSystemMonitor_descriptionForBudgets___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "descriptionForBudget:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end

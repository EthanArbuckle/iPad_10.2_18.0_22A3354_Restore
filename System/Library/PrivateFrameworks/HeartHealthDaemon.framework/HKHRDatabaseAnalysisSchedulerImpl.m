@implementation HKHRDatabaseAnalysisSchedulerImpl

- (HKHRDatabaseAnalysisSchedulerImpl)initWithProfile:(id)a3 identifier:(id)a4 loggingCategory:(id)a5 maximumDelay:(double)a6 retryDelay:(double)a7 breadcrumbManager:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HKHRDatabaseAnalysisSchedulerGatedActivityFactoryImpl *v18;
  HKHRDatabaseAnalysisSchedulerDatabaseAssertionProviderImpl *v19;
  void *v20;
  HKHRDatabaseAnalysisSchedulerImpl *v21;

  v14 = a8;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = -[HKHRDatabaseAnalysisSchedulerGatedActivityFactoryImpl initWithIdentifier:loggingCategory:]([HKHRDatabaseAnalysisSchedulerGatedActivityFactoryImpl alloc], "initWithIdentifier:loggingCategory:", v16, v15);
  v19 = -[HKHRDatabaseAnalysisSchedulerDatabaseAssertionProviderImpl initWithProfile:identifier:]([HKHRDatabaseAnalysisSchedulerDatabaseAssertionProviderImpl alloc], "initWithProfile:identifier:", v17, v16);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[HKHRDatabaseAnalysisSchedulerImpl initWithProfile:identifier:loggingCategory:maximumDelay:retryDelay:breadcrumbManager:gatedActivityFactory:assertionProvider:persistentStateDefaults:](self, "initWithProfile:identifier:loggingCategory:maximumDelay:retryDelay:breadcrumbManager:gatedActivityFactory:assertionProvider:persistentStateDefaults:", v17, v16, v15, v14, v18, v19, a6, a7, v20);

  return v21;
}

- (HKHRDatabaseAnalysisSchedulerImpl)initWithProfile:(id)a3 identifier:(id)a4 loggingCategory:(id)a5 maximumDelay:(double)a6 retryDelay:(double)a7 breadcrumbManager:(id)a8 gatedActivityFactory:(id)a9 assertionProvider:(id)a10 persistentStateDefaults:(id)a11
{
  id v19;
  id v20;
  id v21;
  id v22;
  HKHRDatabaseAnalysisSchedulerImpl *v23;
  HKHRDatabaseAnalysisSchedulerImpl *v24;
  uint64_t v25;
  NSString *identifier;
  id WeakRetained;
  void *v28;
  id v30;
  id v31;
  id v32;
  id obj;
  objc_super v34;

  obj = a3;
  v19 = a4;
  v20 = a5;
  v32 = a8;
  v31 = a9;
  v21 = a10;
  v22 = a11;
  v34.receiver = self;
  v34.super_class = (Class)HKHRDatabaseAnalysisSchedulerImpl;
  v23 = -[HKHRDatabaseAnalysisSchedulerImpl init](&v34, sel_init);
  v24 = v23;
  if (v23)
  {
    v30 = v20;
    objc_storeWeak((id *)&v23->_profile, obj);
    v25 = objc_msgSend(v19, "copy");
    identifier = v24->_identifier;
    v24->_identifier = (NSString *)v25;

    objc_storeStrong((id *)&v24->_loggingCategory, a5);
    v24->_maximumDelay = a6;
    v24->_retryDelay = a7;
    objc_storeStrong((id *)&v24->_breadcrumbManager, a8);
    objc_storeStrong((id *)&v24->_gatedActivityFactory, a9);
    objc_storeStrong((id *)&v24->_assertionProvider, a10);
    v24->_lock._os_unfair_lock_opaque = 0;
    v24->_state = 0;
    objc_storeStrong((id *)&v24->_persistentStateDefaults, a11);
    WeakRetained = objc_loadWeakRetained((id *)&v24->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "registerDaemonReadyObserver:queue:", v24, 0);

    v20 = v30;
  }

  return v24;
}

- (void)scheduleAnalysis
{
  NSObject *loggingCategory;
  NSString *identifier;
  int v5;
  HKHRDatabaseAnalysisSchedulerImpl *v6;
  __int16 v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    v5 = 138543618;
    v6 = self;
    v7 = 2114;
    v8 = identifier;
    _os_log_impl(&dword_1CC29C000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Told to schedule analysis", (uint8_t *)&v5, 0x16u);
  }
  -[HKHRDatabaseAnalysisSchedulerImpl _requestGatedActivityRunWithDelay:](self, "_requestGatedActivityRunWithDelay:", self->_maximumDelay);
}

- (void)forceAnalysis
{
  NSObject *loggingCategory;
  NSString *identifier;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  HKHRDatabaseAnalysisSchedulerImpl *v8;
  __int16 v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = identifier;
    _os_log_impl(&dword_1CC29C000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Told to force analysis", buf, 0x16u);
  }
  -[HKHRDatabaseAnalysisSchedulerImpl _gatedActivity](self, "_gatedActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__HKHRDatabaseAnalysisSchedulerImpl_forceAnalysis__block_invoke;
  v6[3] = &unk_1E87EF730;
  v6[4] = self;
  objc_msgSend(v5, "runUngatedWithCompletion:", v6);

}

void __50__HKHRDatabaseAnalysisSchedulerImpl_forceAnalysis__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(v7 + 16);
    v9 = 138544130;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    v13 = 2050;
    v14 = a2;
    v15 = 2114;
    v16 = v5;
    _os_log_impl(&dword_1CC29C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Activity completed with result %{public}ld and error %{public}@", (uint8_t *)&v9, 0x2Au);
  }

}

- (id)_gatedActivity
{
  os_unfair_lock_s *p_lock;
  HDXPCGatedActivity *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_gatedActivity;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)daemonReady:(id)a3
{
  id v4;
  NSObject *loggingCategory;
  NSString *identifier;
  HKHRDatabaseAnalysisSchedulerGatedActivityFactory *gatedActivityFactory;
  HDXPCGatedActivity *v8;
  HDXPCGatedActivity *lock_gatedActivity;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  HKHRDatabaseAnalysisSchedulerImpl *v13;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = identifier;
    _os_log_impl(&dword_1CC29C000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Daemon ready", buf, 0x16u);
  }
  if (-[HKHRDatabaseAnalysisSchedulerImpl _enterStateIfPossible:](self, "_enterStateIfPossible:", 1))
  {
    os_unfair_lock_lock(&self->_lock);
    objc_initWeak((id *)buf, self);
    gatedActivityFactory = self->_gatedActivityFactory;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__HKHRDatabaseAnalysisSchedulerImpl_daemonReady___block_invoke;
    v10[3] = &unk_1E87EF758;
    objc_copyWeak(&v11, (id *)buf);
    -[HKHRDatabaseAnalysisSchedulerGatedActivityFactory makeGatedActivityWithHandler:](gatedActivityFactory, "makeGatedActivityWithHandler:", v10);
    v8 = (HDXPCGatedActivity *)objc_claimAutoreleasedReturnValue();
    lock_gatedActivity = self->_lock_gatedActivity;
    self->_lock_gatedActivity = v8;

    os_unfair_lock_unlock(&self->_lock);
    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)self->_loggingCategory, OS_LOG_TYPE_FAULT))
      -[HKHRDatabaseAnalysisSchedulerImpl daemonReady:].cold.1();
  }

}

void __49__HKHRDatabaseAnalysisSchedulerImpl_daemonReady___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_runActivity:withCompletion:", v7, v6);

}

- (void)_requestGatedActivityRunWithDelay:(double)a3
{
  void *v5;
  _QWORD v6[6];

  -[HKHRDatabaseAnalysisSchedulerImpl _gatedActivity](self, "_gatedActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__HKHRDatabaseAnalysisSchedulerImpl__requestGatedActivityRunWithDelay___block_invoke;
  v6[3] = &unk_1E87EF780;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  objc_msgSend(v5, "requestRunWithMaximumDelay:completion:", v6, a3);

}

void __71__HKHRDatabaseAnalysisSchedulerImpl__requestGatedActivityRunWithDelay___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(v7 + 16);
    v10 = 138544386;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    v14 = 2050;
    v15 = v8;
    v16 = 2050;
    v17 = a2;
    v18 = 2114;
    v19 = v5;
    _os_log_impl(&dword_1CC29C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Activity (with %{public}f delay) completed with result %{public}ld and error %{public}@", (uint8_t *)&v10, 0x34u);
  }

}

- (id)retryCountKey
{
  return -[NSString stringByAppendingString:](self->_identifier, "stringByAppendingString:", CFSTR("RetryCount"));
}

- (void)_maybeRetryLater
{
  void *v3;
  char v4;
  NSUserDefaults *persistentStateDefaults;
  uint64_t v6;
  uint64_t v7;
  NSObject *loggingCategory;
  NSString *identifier;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSString *v13;
  int v14;
  HKHRDatabaseAnalysisSchedulerImpl *v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HKHRDatabaseAnalysisSchedulerImpl retryCountKey](self, "retryCountKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSUserDefaults hk_keyExists:](self->_persistentStateDefaults, "hk_keyExists:", v3);
  persistentStateDefaults = self->_persistentStateDefaults;
  if ((v4 & 1) != 0)
  {
    v6 = -[NSUserDefaults integerForKey:](persistentStateDefaults, "integerForKey:", v3);
    v7 = v6 + 1;
    -[NSUserDefaults setInteger:forKey:](self->_persistentStateDefaults, "setInteger:forKey:", v6 + 1, v3);
    if (v6 >= 4)
    {
      -[NSUserDefaults removeObjectForKey:](self->_persistentStateDefaults, "removeObjectForKey:", v3);
      _HKInitializeLogging();
      loggingCategory = self->_loggingCategory;
      if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
      {
        identifier = self->_identifier;
        v14 = 138543874;
        v15 = self;
        v16 = 2114;
        v17 = identifier;
        v18 = 2050;
        v19 = 4;
        _os_log_impl(&dword_1CC29C000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Reached maximum number of retries (%{public}ld), giving up", (uint8_t *)&v14, 0x20u);
      }
      goto LABEL_9;
    }
  }
  else
  {
    v7 = 1;
    -[NSUserDefaults setInteger:forKey:](persistentStateDefaults, "setInteger:forKey:", 1, v3);
  }
  -[HKHRDatabaseAnalysisSchedulerImpl _retryDelayGivenRetryCount:](self, "_retryDelayGivenRetryCount:", v7);
  v11 = v10;
  _HKInitializeLogging();
  v12 = self->_loggingCategory;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = self->_identifier;
    v14 = 138544130;
    v15 = self;
    v16 = 2114;
    v17 = v13;
    v18 = 2050;
    v19 = v7;
    v20 = 2050;
    v21 = v11;
    _os_log_impl(&dword_1CC29C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Retry attempt %{public}ld, retrying in %{public}f seconds", (uint8_t *)&v14, 0x2Au);
  }
  -[HKHRDatabaseAnalysisSchedulerImpl _retryDelayGivenRetryCount:](self, "_retryDelayGivenRetryCount:", v7);
  -[HKHRDatabaseAnalysisSchedulerImpl _requestGatedActivityRunWithDelay:](self, "_requestGatedActivityRunWithDelay:");
LABEL_9:

}

- (double)_retryDelayGivenRetryCount:(int64_t)a3
{
  return pow(self->_retryDelay / 60.0, (double)a3) * 60.0;
}

- (BOOL)_enterStateIfPossible:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  unint64_t state;
  NSObject *v7;
  const __CFString *v8;
  NSObject *loggingCategory;
  BOOL v10;
  NSString *v11;
  const __CFString *v12;
  NSObject *v13;
  const __CFString *v15;
  NSString *identifier;
  const __CFString *v17;
  NSObject *v18;
  int v19;
  HKHRDatabaseAnalysisSchedulerImpl *v20;
  __int16 v21;
  NSString *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  state = self->_state;
  switch(state)
  {
    case 0uLL:
    case 3uLL:
      if (a3 != 1)
        goto LABEL_9;
      goto LABEL_3;
    case 1uLL:
      if (a3 != 2)
        goto LABEL_9;
      goto LABEL_3;
    case 2uLL:
      if (((a3 - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0)
        goto LABEL_3;
LABEL_9:
      _HKInitializeLogging();
      loggingCategory = self->_loggingCategory;
      if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_ERROR))
      {
        if (state - 1 > 2)
          v15 = CFSTR("WaitingForDaemonReady");
        else
          v15 = off_1E87EF840[state - 1];
        identifier = self->_identifier;
        if (a3 - 1 > 2)
          v17 = CFSTR("WaitingForDaemonReady");
        else
          v17 = off_1E87EF840[a3 - 1];
        v19 = 138544130;
        v20 = self;
        v21 = 2114;
        v22 = identifier;
        v23 = 2114;
        v24 = v15;
        v25 = 2114;
        v26 = v17;
        v18 = loggingCategory;
        _os_log_error_impl(&dword_1CC29C000, v18, OS_LOG_TYPE_ERROR, "[%{public}@:%{public}@] Invalid attempt to change state from %{public}@ to %{public}@", (uint8_t *)&v19, 0x2Au);

      }
      v10 = 0;
      break;
    default:
LABEL_3:
      _HKInitializeLogging();
      v7 = self->_loggingCategory;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        if (state - 1 > 2)
          v8 = CFSTR("WaitingForDaemonReady");
        else
          v8 = off_1E87EF840[state - 1];
        v11 = self->_identifier;
        if (a3 - 1 > 2)
          v12 = CFSTR("WaitingForDaemonReady");
        else
          v12 = off_1E87EF840[a3 - 1];
        v19 = 138544130;
        v20 = self;
        v21 = 2114;
        v22 = v11;
        v23 = 2114;
        v24 = v8;
        v25 = 2114;
        v26 = v12;
        v13 = v7;
        _os_log_impl(&dword_1CC29C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] State will change from %{public}@ to %{public}@", (uint8_t *)&v19, 0x2Au);

      }
      self->_state = a3;
      v10 = 1;
      break;
  }
  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (void)_resetRetryCounter
{
  NSUserDefaults *persistentStateDefaults;
  id v3;

  persistentStateDefaults = self->_persistentStateDefaults;
  -[HKHRDatabaseAnalysisSchedulerImpl retryCountKey](self, "retryCountKey");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults removeObjectForKey:](persistentStateDefaults, "removeObjectForKey:", v3);

}

- (void)_runActivity:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSString *v9;
  HKHRDatabaseAnalysisSchedulerDatabaseAssertionProvider *assertionProvider;
  void *v11;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  NSObject *loggingCategory;
  NSString *identifier;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  HKHRDatabaseAnalysisSchedulerImpl *v28;
  __int16 v29;
  NSString *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging dropBreadcrumb:](self->_breadcrumbManager, "dropBreadcrumb:", 1);
  if (!objc_msgSend(v6, "shouldDefer"))
  {
    assertionProvider = self->_assertionProvider;
    v26 = 0;
    -[HKHRDatabaseAnalysisSchedulerDatabaseAssertionProvider takeAssertionWithError:](assertionProvider, "takeAssertionWithError:", &v26);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v26;
    if (v11)
    {
      if (-[HKHRDatabaseAnalysisSchedulerImpl _enterStateIfPossible:](self, "_enterStateIfPossible:", 2))
      {
        v13 = (void *)MEMORY[0x1E0D294D0];
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __65__HKHRDatabaseAnalysisSchedulerImpl__runActivity_withCompletion___block_invoke;
        v22[3] = &unk_1E87EF7D0;
        v22[4] = self;
        v23 = v6;
        v24 = v11;
        v25 = v7;
        objc_msgSend(v13, "maintenanceOperationWithName:asynchronousBlock:", v15, v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        objc_msgSend(WeakRetained, "daemon");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "maintenanceWorkCoordinator");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "enqueueMaintenanceOperation:", v16);

LABEL_15:
        goto LABEL_16;
      }
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)self->_loggingCategory, OS_LOG_TYPE_FAULT))
        -[HKHRDatabaseAnalysisSchedulerImpl _runActivity:withCompletion:].cold.1();
      -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging dropAnalysisResultBreadcrumbWithContext:](self->_breadcrumbManager, "dropAnalysisResultBreadcrumbWithContext:", CFSTR("Unable to transition to waiting for maintenance operation"));
      objc_msgSend(v11, "invalidate");
    }
    else
    {
      _HKInitializeLogging();
      loggingCategory = self->_loggingCategory;
      if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
      {
        identifier = self->_identifier;
        *(_DWORD *)buf = 138543874;
        v28 = self;
        v29 = 2114;
        v30 = identifier;
        v31 = 2114;
        v32 = v12;
        _os_log_impl(&dword_1CC29C000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Unable to get accessibilityAssertion before enqueueing maintenance operation, attempting retry later: %{public}@", buf, 0x20u);
      }
      -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging dropAnalysisResultBreadcrumbWithContext:](self->_breadcrumbManager, "dropAnalysisResultBreadcrumbWithContext:", CFSTR("Unable to take assertion"));
    }
    (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 1, 0);
    -[HKHRDatabaseAnalysisSchedulerImpl _maybeRetryLater](self, "_maybeRetryLater");
    goto LABEL_15;
  }
  _HKInitializeLogging();
  v8 = self->_loggingCategory;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_identifier;
    *(_DWORD *)buf = 138543618;
    v28 = self;
    v29 = 2114;
    v30 = v9;
    _os_log_impl(&dword_1CC29C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Activity run but immediately deferred, deferring", buf, 0x16u);
  }
  -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging dropAnalysisResultBreadcrumbWithContext:](self->_breadcrumbManager, "dropAnalysisResultBreadcrumbWithContext:", CFSTR("XPC activity deferred before maintenance"));
  (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 2, 0);
LABEL_16:

}

void __65__HKHRDatabaseAnalysisSchedulerImpl__runActivity_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__HKHRDatabaseAnalysisSchedulerImpl__runActivity_withCompletion___block_invoke_2;
  v8[3] = &unk_1E87EF7A8;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v10 = v3;
  v8[4] = v5;
  v6 = *(void **)(a1 + 48);
  v9 = v6;
  v11 = *(id *)(a1 + 56);
  v7 = v3;
  objc_msgSend(v5, "_runMaintenanceOperationForActivity:assertion:withCompletion:", v4, v6, v8);

}

void __65__HKHRDatabaseAnalysisSchedulerImpl__runActivity_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t);
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(void (**)(uint64_t))(v4 + 16);
  v6 = a3;
  v5(v4);
  _HKInitializeLogging();
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(v8 + 16);
    v10 = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_1CC29C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] maintenance operation finished", (uint8_t *)&v10, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 40), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)_runMaintenanceOperationForActivity:(id)a3 assertion:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging *breadcrumbManager;
  id v11;
  NSObject *v12;
  NSString *v13;
  NSObject *loggingCategory;
  NSString *identifier;
  HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging *v16;
  const __CFString *v17;
  id v18;
  id WeakRetained;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  HKHRDatabaseAnalysisSchedulerImpl *v26;
  __int16 v27;
  NSString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  breadcrumbManager = self->_breadcrumbManager;
  v11 = a3;
  -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging dropBreadcrumb:](breadcrumbManager, "dropBreadcrumb:", 2);
  LODWORD(breadcrumbManager) = objc_msgSend(v11, "shouldDefer");

  if (!(_DWORD)breadcrumbManager)
  {
    if (objc_msgSend(v8, "state") == 3)
    {
      _HKInitializeLogging();
      loggingCategory = self->_loggingCategory;
      if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
      {
        identifier = self->_identifier;
        *(_DWORD *)buf = 138543618;
        v26 = self;
        v27 = 2114;
        v28 = identifier;
        _os_log_impl(&dword_1CC29C000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Activity run but assertion invalidated, attempting retry later", buf, 0x16u);
      }
      -[HKHRDatabaseAnalysisSchedulerImpl _enterStateIfPossible:](self, "_enterStateIfPossible:", 1);
      v16 = self->_breadcrumbManager;
      v17 = CFSTR("Assertion expired after maintenance");
    }
    else
    {
      if (-[HKHRDatabaseAnalysisSchedulerImpl _enterStateIfPossible:](self, "_enterStateIfPossible:", 3))
      {
        v18 = objc_alloc_init(MEMORY[0x1E0D294F0]);
        objc_msgSend(v18, "setCacheScope:", 1);
        objc_msgSend(v18, "addAccessibilityAssertion:", v8);
        WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        objc_msgSend(WeakRetained, "database");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0;
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __98__HKHRDatabaseAnalysisSchedulerImpl__runMaintenanceOperationForActivity_assertion_withCompletion___block_invoke;
        v22[3] = &unk_1E87EF820;
        v22[4] = self;
        v23 = v9;
        objc_msgSend(v20, "performWithTransactionContext:error:block:", v18, &v24, v22);
        v21 = v24;

        goto LABEL_15;
      }
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)self->_loggingCategory, OS_LOG_TYPE_FAULT))
        -[HKHRDatabaseAnalysisSchedulerImpl _runMaintenanceOperationForActivity:assertion:withCompletion:].cold.1();
      -[HKHRDatabaseAnalysisSchedulerImpl _enterStateIfPossible:](self, "_enterStateIfPossible:", 1);
      v16 = self->_breadcrumbManager;
      v17 = CFSTR("Unable to transition to waiting for activity");
    }
    -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging dropAnalysisResultBreadcrumbWithContext:](v16, "dropAnalysisResultBreadcrumbWithContext:", v17);
    (*((void (**)(id, uint64_t, _QWORD))v9 + 2))(v9, 1, 0);
    -[HKHRDatabaseAnalysisSchedulerImpl _maybeRetryLater](self, "_maybeRetryLater");
    goto LABEL_15;
  }
  _HKInitializeLogging();
  v12 = self->_loggingCategory;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = self->_identifier;
    *(_DWORD *)buf = 138543618;
    v26 = self;
    v27 = 2114;
    v28 = v13;
    _os_log_impl(&dword_1CC29C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Activity run but deferred after maintenance operation, deferring", buf, 0x16u);
  }
  -[HKHRDatabaseAnalysisSchedulerImpl _enterStateIfPossible:](self, "_enterStateIfPossible:", 1);
  -[HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging dropAnalysisResultBreadcrumbWithContext:](self->_breadcrumbManager, "dropAnalysisResultBreadcrumbWithContext:", CFSTR("XPC activity deferred after maintenance"));
  (*((void (**)(id, uint64_t, _QWORD))v9 + 2))(v9, 2, 0);
LABEL_15:

}

uint64_t __98__HKHRDatabaseAnalysisSchedulerImpl__runMaintenanceOperationForActivity_assertion_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v5[4];
  uint64_t v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 104));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __98__HKHRDatabaseAnalysisSchedulerImpl__runMaintenanceOperationForActivity_assertion_withCompletion___block_invoke_2;
  v5[3] = &unk_1E87EF7F8;
  v3 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  objc_msgSend(WeakRetained, "analysisSchedulerDidFire:completion:", v6, v5);

  return 1;
}

uint64_t __98__HKHRDatabaseAnalysisSchedulerImpl__runMaintenanceOperationForActivity_assertion_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_enterStateIfPossible:", 1);
  if (a2 == 2)
  {
LABEL_4:
    objc_msgSend(*(id *)(a1 + 32), "_resetRetryCounter");
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  if (a2 != 1)
  {
    if (a2)
      return result;
    goto LABEL_4;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "dropBreadcrumb:", 6);
  return objc_msgSend(*(id *)(a1 + 32), "_maybeRetryLater");
}

- (HKHRDatabaseAnalysisSchedulerDelegate)delegate
{
  return (HKHRDatabaseAnalysisSchedulerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_lock_gatedActivity, 0);
  objc_storeStrong((id *)&self->_persistentStateDefaults, 0);
  objc_storeStrong((id *)&self->_assertionProvider, 0);
  objc_storeStrong((id *)&self->_gatedActivityFactory, 0);
  objc_storeStrong((id *)&self->_breadcrumbManager, 0);
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)daemonReady:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1CC29C000, v0, v1, "[%{public}@:%{public}@] Unable to transition to waiting for activity.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_runActivity:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1CC29C000, v0, v1, "[%{public}@:%{public}@] Unable to transition to waiting for maintenance operation state, attempting retry later", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_runMaintenanceOperationForActivity:assertion:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1CC29C000, v0, v1, "[%{public}@:%{public}@] Unable to transition to triggered state, attempting retry later", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end

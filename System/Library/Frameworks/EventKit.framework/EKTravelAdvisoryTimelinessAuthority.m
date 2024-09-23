@implementation EKTravelAdvisoryTimelinessAuthority

- (EKTravelAdvisoryTimelinessAuthority)init
{
  void *v3;
  EKTravelAdvisoryTimelinessAuthority *v4;

  objc_msgSend(MEMORY[0x1E0D0C358], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[EKTravelAdvisoryTimelinessAuthority initWithDateProvider:](self, "initWithDateProvider:", v3);

  return v4;
}

- (EKTravelAdvisoryTimelinessAuthority)initWithDateProvider:(id)a3
{
  id v5;
  EKTravelAdvisoryTimelinessAuthority *v6;
  id v7;
  const char *v8;
  dispatch_queue_t v9;
  id v10;
  const char *v11;
  dispatch_queue_t v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EKTravelAdvisoryTimelinessAuthority;
  v6 = -[EKTravelAdvisoryTimelinessAuthority init](&v14, sel_init);
  if (v6)
  {
    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v7, "UTF8String");

    v9 = dispatch_queue_create(v8, 0);
    -[EKTravelAdvisoryTimelinessAuthority setWorkQueue:](v6, "setWorkQueue:", v9);

    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (const char *)objc_msgSend(v10, "UTF8String");

    v12 = dispatch_queue_create(v11, 0);
    -[EKTravelAdvisoryTimelinessAuthority setCallbackQueue:](v6, "setCallbackQueue:", v12);

    objc_storeStrong((id *)&v6->_dateProvider, a3);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[EKTravelAdvisoryTimelinessAuthority _uninstallTimer](self, "_uninstallTimer");
  v3.receiver = self;
  v3.super_class = (Class)EKTravelAdvisoryTimelinessAuthority;
  -[EKTravelAdvisoryTimelinessAuthority dealloc](&v3, sel_dealloc);
}

- (BOOL)active
{
  EKTravelAdvisoryTimelinessAuthority *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[EKTravelAdvisoryTimelinessAuthority workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__EKTravelAdvisoryTimelinessAuthority_active__block_invoke;
  v5[3] = &unk_1E4785190;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __45__EKTravelAdvisoryTimelinessAuthority_active__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "internalActive");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)activate
{
  NSObject *v3;
  _QWORD block[5];

  -[EKTravelAdvisoryTimelinessAuthority workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__EKTravelAdvisoryTimelinessAuthority_activate__block_invoke;
  block[3] = &unk_1E4785078;
  block[4] = self;
  dispatch_async(v3, block);

}

void __47__EKTravelAdvisoryTimelinessAuthority_activate__block_invoke(uint64_t a1)
{
  id *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = (id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "internalActive"))
  {
    v2 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      __47__EKTravelAdvisoryTimelinessAuthority_activate__block_invoke_cold_1((uint64_t)v1, v2, v3, v4, v5, v6, v7, v8);
  }
  else
  {
    objc_msgSend(*v1, "setInternalActive:", 1);
    objc_msgSend(*v1, "_refresh");
  }
}

- (void)deactivate
{
  NSObject *v3;
  _QWORD block[5];

  -[EKTravelAdvisoryTimelinessAuthority workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__EKTravelAdvisoryTimelinessAuthority_deactivate__block_invoke;
  block[3] = &unk_1E4785078;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __49__EKTravelAdvisoryTimelinessAuthority_deactivate__block_invoke(uint64_t a1)
{
  id *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = (id *)(a1 + 32);
  if ((objc_msgSend(*(id *)(a1 + 32), "internalActive") & 1) != 0)
  {
    objc_msgSend(*v1, "setInternalActive:", 0);
    objc_msgSend(*v1, "_refresh");
  }
  else
  {
    v2 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      __49__EKTravelAdvisoryTimelinessAuthority_deactivate__block_invoke_cold_1((uint64_t)v1, v2, v3, v4, v5, v6, v7, v8);
  }
}

- (NSDate)startOfLeaveNowPeriod
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__15;
  v11 = __Block_byref_object_dispose__15;
  v12 = 0;
  -[EKTravelAdvisoryTimelinessAuthority workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__EKTravelAdvisoryTimelinessAuthority_startOfLeaveNowPeriod__block_invoke;
  v6[3] = &unk_1E4785190;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDate *)v4;
}

void __60__EKTravelAdvisoryTimelinessAuthority_startOfLeaveNowPeriod__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "startOfLeaveNowPeriodInternal");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSDate)startOfRunningLatePeriod
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__15;
  v11 = __Block_byref_object_dispose__15;
  v12 = 0;
  -[EKTravelAdvisoryTimelinessAuthority workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__EKTravelAdvisoryTimelinessAuthority_startOfRunningLatePeriod__block_invoke;
  v6[3] = &unk_1E4785190;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDate *)v4;
}

void __63__EKTravelAdvisoryTimelinessAuthority_startOfRunningLatePeriod__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "startOfRunningLatePeriodInternal");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)updateWithHypothesis:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  EKTravelAdvisoryTimelinessAuthority *v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[EKTravelAdvisoryTimelinessAuthority workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__EKTravelAdvisoryTimelinessAuthority_updateWithHypothesis___block_invoke;
  v7[3] = &unk_1E4786878;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_copyWeak(&v10, &location);
  dispatch_async(v5, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __60__EKTravelAdvisoryTimelinessAuthority_updateWithHypothesis___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id *v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    v3 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __60__EKTravelAdvisoryTimelinessAuthority_updateWithHypothesis___block_invoke_cold_2(a1, v3);
    v2 = *(void **)(a1 + 32);
  }
  objc_msgSend(v2, "suggestedDepartureDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", -120.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setStartOfLeaveNowPeriodInternal:", v5);

  objc_msgSend(*(id *)(a1 + 32), "aggressiveDepartureDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained(v6);
  objc_msgSend(v9, "setStartOfRunningLatePeriodInternal:", v8);

  v10 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    __60__EKTravelAdvisoryTimelinessAuthority_updateWithHypothesis___block_invoke_cold_1(v10);
  v11 = objc_loadWeakRetained(v6);
  objc_msgSend(v11, "_refresh");

}

- (void)setPeriodChangedCallback:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[EKTravelAdvisoryTimelinessAuthority workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__EKTravelAdvisoryTimelinessAuthority_setPeriodChangedCallback___block_invoke;
  v7[3] = &unk_1E4784E18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __64__EKTravelAdvisoryTimelinessAuthority_setPeriodChangedCallback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInternalPeriodChangedCallback:", *(_QWORD *)(a1 + 40));
}

- (id)periodChangedCallback
{
  NSObject *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__11;
  v11 = __Block_byref_object_dispose__12;
  v12 = 0;
  -[EKTravelAdvisoryTimelinessAuthority workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__EKTravelAdvisoryTimelinessAuthority_periodChangedCallback__block_invoke;
  v6[3] = &unk_1E4785190;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (void *)MEMORY[0x1A85849D4](v8[5]);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __60__EKTravelAdvisoryTimelinessAuthority_periodChangedCallback__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "internalPeriodChangedCallback");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)period
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[EKTravelAdvisoryTimelinessAuthority workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__EKTravelAdvisoryTimelinessAuthority_period__block_invoke;
  v6[3] = &unk_1E4785190;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __45__EKTravelAdvisoryTimelinessAuthority_period__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "internalPeriod");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (id)stringForPeriod:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("Unknown");
  else
    return off_1E47868C0[a3];
}

- (void)_refresh
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "Refreshing [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_refreshPeriod
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  +[EKTravelAdvisoryTimelinessAuthority stringForPeriod:](EKTravelAdvisoryTimelinessAuthority, "stringForPeriod:", objc_msgSend(a2, "internalPeriod"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKTravelAdvisoryTimelinessAuthority stringForPeriod:](EKTravelAdvisoryTimelinessAuthority, "stringForPeriod:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  v12 = 2112;
  v13 = a2;
  _os_log_debug_impl(&dword_1A2318000, v5, OS_LOG_TYPE_DEBUG, "Period refreshed from [%@] to [%@] in [%@]", (uint8_t *)&v8, 0x20u);

}

uint64_t __53__EKTravelAdvisoryTimelinessAuthority__refreshPeriod__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_refreshTimer
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_1A2318000, v0, v1, "Calculated next refresh date of [%@] in [%@]");
  OUTLINED_FUNCTION_1_0();
}

- (void)_refreshOnDate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  double v9;
  double v10;
  dispatch_time_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "CalIsBeforeDate:", v5);

    if (v6)
    {
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
        -[EKTravelAdvisoryTimelinessAuthority _refreshOnDate:].cold.1();
    }
    else
    {
      -[EKTravelAdvisoryTimelinessAuthority timer](self, "timer");
      v7 = objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
          -[EKTimedEventStorePurger _resetIdleTimer].cold.3();
        -[EKTravelAdvisoryTimelinessAuthority workQueue](self, "workQueue");
        v8 = objc_claimAutoreleasedReturnValue();
        v7 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v8);

        -[EKTravelAdvisoryTimelinessAuthority setTimer:](self, "setTimer:", v7);
        objc_initWeak(&location, self);
        v13 = MEMORY[0x1E0C809B0];
        v14 = 3221225472;
        v15 = __54__EKTravelAdvisoryTimelinessAuthority__refreshOnDate___block_invoke;
        v16 = &unk_1E4785050;
        objc_copyWeak(&v17, &location);
        dispatch_source_set_event_handler(v7, &v13);
        dispatch_activate(v7);
        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
      }
      objc_msgSend(v4, "timeIntervalSinceNow", v13, v14, v15, v16);
      v10 = v9;
      v11 = dispatch_time(0, (unint64_t)(v9 * 1000000000.0));
      v12 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
        -[EKTravelAdvisoryTimelinessAuthority _refreshOnDate:].cold.2(v12, v10);
      dispatch_source_set_timer(v7, v11, 0xFFFFFFFFFFFFFFFFLL, 0);

    }
  }
  else
  {
    -[EKTravelAdvisoryTimelinessAuthority _uninstallTimer](self, "_uninstallTimer");
  }

}

void __54__EKTravelAdvisoryTimelinessAuthority__refreshOnDate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      __54__EKTravelAdvisoryTimelinessAuthority__refreshOnDate___block_invoke_cold_1();
    objc_msgSend(WeakRetained, "_refresh");
  }

}

- (void)_uninstallTimer
{
  NSObject *v3;

  -[EKTravelAdvisoryTimelinessAuthority timer](self, "timer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      -[EKTimedEventStorePurger _uninstallTimer].cold.1();
    dispatch_source_cancel(v3);
    -[EKTravelAdvisoryTimelinessAuthority setTimer:](self, "setTimer:", 0);
  }

}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (NSDate)startOfLeaveNowPeriodInternal
{
  return self->_startOfLeaveNowPeriodInternal;
}

- (void)setStartOfLeaveNowPeriodInternal:(id)a3
{
  objc_storeStrong((id *)&self->_startOfLeaveNowPeriodInternal, a3);
}

- (NSDate)startOfRunningLatePeriodInternal
{
  return self->_startOfRunningLatePeriodInternal;
}

- (void)setStartOfRunningLatePeriodInternal:(id)a3
{
  objc_storeStrong((id *)&self->_startOfRunningLatePeriodInternal, a3);
}

- (BOOL)internalActive
{
  return self->_internalActive;
}

- (void)setInternalActive:(BOOL)a3
{
  self->_internalActive = a3;
}

- (unint64_t)internalPeriod
{
  return self->_internalPeriod;
}

- (void)setInternalPeriod:(unint64_t)a3
{
  self->_internalPeriod = a3;
}

- (id)internalPeriodChangedCallback
{
  return self->_internalPeriodChangedCallback;
}

- (void)setInternalPeriodChangedCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (CalDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong(&self->_internalPeriodChangedCallback, 0);
  objc_storeStrong((id *)&self->_startOfRunningLatePeriodInternal, 0);
  objc_storeStrong((id *)&self->_startOfLeaveNowPeriodInternal, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __47__EKTravelAdvisoryTimelinessAuthority_activate__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_1A2318000, a2, a3, "Already active.  Will not activate [%@]", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __49__EKTravelAdvisoryTimelinessAuthority_deactivate__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_1A2318000, a2, a3, "Already inactive.  Will not deactivate [%@]", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __60__EKTravelAdvisoryTimelinessAuthority_updateWithHypothesis___block_invoke_cold_1(void *a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  v1 = a1;
  v2 = OUTLINED_FUNCTION_5_1();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = OUTLINED_FUNCTION_5_1();
  objc_msgSend(v4, "startOfLeaveNowPeriodInternal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = OUTLINED_FUNCTION_5_1();
  objc_msgSend(v6, "startOfRunningLatePeriodInternal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_3(&dword_1A2318000, v8, v9, "Updating [%@] based on new hypothesis. now: [%@] startOfLeaveNowPeriod: [%@] startOfRunningLatePeriod: [%@]", v10, v11, v12, v13, v14);

}

void __60__EKTravelAdvisoryTimelinessAuthority_updateWithHypothesis___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1A2318000, a2, OS_LOG_TYPE_ERROR, "nil 'hypothesis' received in [%@]", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)_refreshOnDate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_1A2318000, v0, v1, "[%@] is before now.  Will not set up a timer to refresh [%@]");
  OUTLINED_FUNCTION_1_0();
}

- (void)_refreshOnDate:(void *)a1 .cold.2(void *a1, double a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a1;
  objc_msgSend(v3, "numberWithDouble:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_3(&dword_1A2318000, v9, v10, "Setting the timer's timeout to [%@] seconds and its leeway to [%@] seconds.  The timer will fire around [%@] in [%@]", v11, v12, v13, v14, v15);

}

void __54__EKTravelAdvisoryTimelinessAuthority__refreshOnDate___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "Timer fired in [%@].", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end

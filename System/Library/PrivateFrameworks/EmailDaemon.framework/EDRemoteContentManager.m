@implementation EDRemoteContentManager

- (EDRemoteContentManager)initWithRemoteContentPersistence:(id)a3 contentRuleListManager:(id)a4 urlSession:(id)a5
{
  id v8;
  id v9;
  EDRemoteContentManager *v10;
  EDRemoteContentManager *v11;
  uint64_t v12;
  EFScheduler *backgroundWorkScheduler;
  EFCancelationToken *v14;
  EFCancelationToken *token;
  NSLock *v16;
  NSLock *requestLock;
  id v18;
  id v19;
  uint64_t v20;
  EFLocked *remoteLinkVerificationTimes;
  objc_super v23;

  v8 = a3;
  v9 = a5;
  v23.receiver = self;
  v23.super_class = (Class)EDRemoteContentManager;
  v10 = -[EDRemoteContentManager init](&v23, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_remoteContentPersistence, a3);
    objc_storeStrong((id *)&v11->_urlSession, a5);
    *(_QWORD *)&v11->_requestSchedulerLock._os_unfair_lock_opaque = 0;
    v11->_schedulingLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.email.EDRemoteContentManager.backgroundWorkScheduler"), 9);
    v12 = objc_claimAutoreleasedReturnValue();
    backgroundWorkScheduler = v11->_backgroundWorkScheduler;
    v11->_backgroundWorkScheduler = (EFScheduler *)v12;

    v14 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E0D1EE90]);
    token = v11->_token;
    v11->_token = v14;

    v16 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    requestLock = v11->_requestLock;
    v11->_requestLock = v16;

    v11->_pruneFrequency = 5000;
    v18 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = objc_msgSend(v18, "initWithObject:", v19);
    remoteLinkVerificationTimes = v11->_remoteLinkVerificationTimes;
    v11->_remoteLinkVerificationTimes = (EFLocked *)v20;

  }
  return v11;
}

void ___ef_log_EDRemoteContentManager_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "EDRemoteContentManager");
  v1 = (void *)_ef_log_EDRemoteContentManager_log;
  _ef_log_EDRemoteContentManager_log = (uint64_t)v0;

}

- (void)_scheduleBackgroundRequests
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  double v8;
  double v9;
  unint64_t v10;
  double v11;
  uint64_t v12;
  _QWORD v13[5];
  _QWORD v14[5];
  os_activity_scope_state_s state;

  v3 = _os_activity_create(&dword_1D2F2C000, "-[EDRemoteContentManager _scheduleBackgroundRequests]", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v3, &state);
  os_unfair_lock_lock(&self->_schedulingLock);
  -[EDRemoteContentManager schedulingLastUpdate](self, "schedulingLastUpdate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (-[EDRemoteContentManager schedulingLastUpdate](self, "schedulingLastUpdate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "ef_isMoreThanTimeIntervalAgo:", 86400.0),
        v5,
        v4,
        (v6 & 1) == 0))
  {
    v8 = 10.0;
    if ((objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 11) & 1) == 0)
    {
      -[EDRemoteContentManager requestInterval](self, "requestInterval");
      EFARC4NormallyDistributedRandomDoubleWithMinimum();
      v8 = v9;
    }
    v10 = -[EDRemoteContentManager batchSize](self, "batchSize");
    if (v10 >= 6)
    {
      EFARC4NormallyDistributedRandomDoubleInRange();
      v10 = (unint64_t)v11;
    }
    os_unfair_lock_unlock(&self->_schedulingLock);
    v12 = objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 11);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __53__EDRemoteContentManager__scheduleBackgroundRequests__block_invoke_2;
    v13[3] = &unk_1E94A0240;
    v13[4] = self;
    -[EDRemoteContentManager _scheduleRequestForLinks:unconditionally:withDelay:completionHandler:](self, "_scheduleRequestForLinks:unconditionally:withDelay:completionHandler:", v10, v12, v13, v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_schedulingLock);
    -[EDRemoteContentManager backgroundWorkScheduler](self, "backgroundWorkScheduler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53__EDRemoteContentManager__scheduleBackgroundRequests__block_invoke;
    v14[3] = &unk_1E949AEB8;
    v14[4] = self;
    objc_msgSend(v7, "performBlock:", v14);

  }
  os_activity_scope_leave(&state);

}

uint64_t __53__EDRemoteContentManager__scheduleBackgroundRequests__block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v2;
  void *v3;
  void *v4;
  int v5;

  v2 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 40);
  os_unfair_lock_lock(v2);
  objc_msgSend(*(id *)(a1 + 32), "schedulingLastUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3
    || (objc_msgSend(*(id *)(a1 + 32), "schedulingLastUpdate"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "ef_isMoreThanTimeIntervalAgo:", 86400.0),
        v4,
        v3,
        v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateScheduling");
  }
  os_unfair_lock_unlock(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleBackgroundRequests");
}

uint64_t __53__EDRemoteContentManager__scheduleBackgroundRequests__block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_scheduleBackgroundRequests");
  return result;
}

- (void)_updateScheduling
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  id v12;
  NSObject *v13;
  int v14;
  unint64_t v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  double v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -86400.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDRemoteContentManager remoteContentPersistence](self, "remoteContentPersistence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countOfLinksLastSeenSince:", v3);

  -[EDRemoteContentManager remoteContentPersistence](self, "remoteContentPersistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countOfUnrequestedLinks");

  if (v5 <= v7)
    v8 = v7;
  else
    v8 = v5;
  if (v8 <= 0xC8)
    v8 = 200;
  v9 = (double)v8;
  v10 = (log((double)v8) * -12.34 + 130.0) * 60.0;
  if (v10 >= 720.0)
    v11 = v10;
  else
    v11 = 720.0;
  -[EDRemoteContentManager setRequestInterval:](self, "setRequestInterval:", v11);
  -[EDRemoteContentManager setBatchSize:](self, "setBatchSize:", (unint64_t)(v11 * v9 / 10800.0));
  v12 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  -[EDRemoteContentManager setSchedulingLastUpdate:](self, "setSchedulingLastUpdate:", v12);

  _ef_log_EDRemoteContentManager();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134218752;
    v15 = v5;
    v16 = 2048;
    v17 = v7;
    v18 = 2048;
    v19 = v11;
    v20 = 2048;
    v21 = -[EDRemoteContentManager batchSize](self, "batchSize");
    _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "Updated scheduling: last day count = %lu, unrequested count = %lu, request interval = %f, batch size = %lu", (uint8_t *)&v14, 0x2Au);
  }

}

- (void)_scheduleRequestForLinks:(unint64_t)a3 unconditionally:(BOOL)a4 withDelay:(double)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24[2];
  id location;
  uint8_t buf[4];
  unint64_t v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v7 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  os_unfair_lock_lock(&self->_requestSchedulerLock);
  if (v7)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    -[EDRemoteContentManager unconditionalRequestScheduler](self, "unconditionalRequestScheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __95__EDRemoteContentManager__scheduleRequestForLinks_unconditionally_withDelay_completionHandler___block_invoke;
    v22[3] = &unk_1E94A0288;
    objc_copyWeak(v24, &location);
    v23 = v10;
    v24[1] = (id)a3;
    v12 = (id)objc_msgSend(v11, "afterDelay:performBlock:", v22, a5);

    _ef_log_EDRemoteContentManager();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v27 = a3;
      v28 = 2048;
      v29 = a5;
      _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "Scheduled unconditional request batch for %lu links with interval: %f", buf, 0x16u);
    }

    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
LABEL_13:
    os_unfair_lock_unlock(&self->_requestSchedulerLock);
    goto LABEL_14;
  }
  if (!self->_requestScheduler)
  {
    -[EDRemoteContentManager _requestSchedulerWithInterval:](self, "_requestSchedulerWithInterval:", a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_requestScheduler, v15);
    self->_remainingCountToSchedule = a3;
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __95__EDRemoteContentManager__scheduleRequestForLinks_unconditionally_withDelay_completionHandler___block_invoke_12;
    v18[3] = &unk_1E94A02B0;
    objc_copyWeak(&v21, &location);
    v19 = v15;
    v20 = v10;
    v16 = v15;
    objc_msgSend(v16, "scheduleWithBlock:", v18);
    _ef_log_EDRemoteContentManager();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v27 = a3;
      v28 = 2048;
      v29 = a5;
      _os_log_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_DEFAULT, "Scheduled request batch for %lu links with interval: %f", buf, 0x16u);
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    goto LABEL_13;
  }
  _ef_log_EDRemoteContentManager();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v14, OS_LOG_TYPE_DEFAULT, "Request batch already scheduled", buf, 2u);
  }

  os_unfair_lock_unlock(&self->_requestSchedulerLock);
  if (v10)
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
LABEL_14:

}

void __95__EDRemoteContentManager__scheduleRequestForLinks_unconditionally_withDelay_completionHandler___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint8_t v10[15];
  char v11;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v11 = 0;
    if (objc_msgSend(WeakRetained[11], "tryLock"))
    {
      v4 = objc_msgSend(v3, "_requestRemoteLinksInBackground:unconditionally:hasMoreLinks:deferBlock:", *(_QWORD *)(a1 + 48), 1, &v11, &__block_literal_global_11);
      objc_msgSend(v3[11], "unlock");
    }
    else
    {
      _ef_log_EDRemoteContentManager();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "Skipped unconditional request batch because request batch is already running", v10, 2u);
      }

      v4 = 0;
    }
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
      if (v4)
        v8 = 1;
      else
        v8 = v11 == 0;
      v9 = !v8;
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v9);
    }
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);
  }

}

uint64_t __95__EDRemoteContentManager__scheduleRequestForLinks_unconditionally_withDelay_completionHandler___block_invoke_2()
{
  return 0;
}

void __95__EDRemoteContentManager__scheduleRequestForLinks_unconditionally_withDelay_completionHandler___block_invoke_12(uint64_t a1, void *a2)
{
  void (**v3)(id, uint64_t);
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  char v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    while (1)
    {
      v5 = (void *)*((_QWORD *)WeakRetained + 11);
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 5.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = objc_msgSend(v5, "lockBeforeDate:", v6);

      if ((v5 & 1) != 0)
        break;
      if (objc_msgSend(*(id *)(a1 + 32), "shouldDefer"))
      {
        v7 = *(_QWORD *)(a1 + 40);
        if (v7)
          (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
        v8 = 2;
        goto LABEL_10;
      }
    }
    v23 = 0;
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 8);
    v10 = *((_QWORD *)WeakRetained + 3);
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 8);
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __95__EDRemoteContentManager__scheduleRequestForLinks_unconditionally_withDelay_completionHandler___block_invoke_2_13;
    v21 = &unk_1E949E320;
    v22 = *(id *)(a1 + 32);
    v11 = objc_msgSend(WeakRetained, "_requestRemoteLinksInBackground:unconditionally:hasMoreLinks:deferBlock:", v10, 0, &v23, &v18);
    if (v11)
    {
      _ef_log_EDRemoteContentManager();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v25 = v11;
        _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "Deferring %lu links", buf, 0xCu);
      }

      os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 8);
      *((_QWORD *)WeakRetained + 3) = v11;
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 8);
      *((_QWORD *)WeakRetained + 3) = 0;
      objc_msgSend(*((id *)WeakRetained + 1), "invalidate", v18, v19, v20, v21);
      v13 = (void *)*((_QWORD *)WeakRetained + 1);
      *((_QWORD *)WeakRetained + 1) = 0;

    }
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 8);

    objc_msgSend(*((id *)WeakRetained + 11), "unlock");
    v14 = *(_QWORD *)(a1 + 40);
    if (v14)
    {
      if (v11)
        v15 = 1;
      else
        v15 = v23 == 0;
      v16 = !v15;
      (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, v16);
    }
    if (v11)
      v17 = 2;
    else
      v17 = 1;
    v3[2](v3, v17);
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);
    v8 = 1;
LABEL_10:
    v3[2](v3, v8);
  }

}

uint64_t __95__EDRemoteContentManager__scheduleRequestForLinks_unconditionally_withDelay_completionHandler___block_invoke_2_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldDefer");
}

- (unint64_t)_requestRemoteLinksInBackground:(unint64_t)a3 unconditionally:(BOOL)a4 hasMoreLinks:(BOOL *)a5 deferBlock:(id)a6
{
  _BOOL8 v7;
  uint64_t (**v10)(_QWORD);
  void *v11;
  unint64_t v12;
  BOOL v13;
  unint64_t v14;
  void *v15;
  int v16;
  const __CFString *v17;
  void *v18;
  unint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v23;
  uint8_t buf[4];
  unint64_t v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v7 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v10 = (uint64_t (**)(_QWORD))a6;
  -[EDRemoteContentManager testDelegate](self, "testDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteContentManagerWillStartRequests:", self);

  v23 = 0;
  v12 = -[EDRemoteContentManager _performRequests:unconditionally:withDeferBlock:completedCount:](self, "_performRequests:unconditionally:withDeferBlock:completedCount:", a3, v7, v10, &v23);
  -[EDRemoteContentManager setRequestedSinceLastPrune:](self, "setRequestedSinceLastPrune:", -[EDRemoteContentManager requestedSinceLastPrune](self, "requestedSinceLastPrune") + v12);
  if (v23 == v12)
  {
    v13 = v12 >= a3;
    if (v12 >= a3
      && (v14 = -[EDRemoteContentManager requestedSinceLastPrune](self, "requestedSinceLastPrune"),
          v14 <= -[EDRemoteContentManager pruneFrequency](self, "pruneFrequency"))
      || (v10[2](v10) & 1) != 0
      || (-[EDRemoteContentManager remoteContentPersistence](self, "remoteContentPersistence"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "pruneAllRemoteContentLinksWithMinimumCount:", 1),
          v15,
          !v16))
    {
      v17 = &stru_1E94A4508;
    }
    else
    {
      -[EDRemoteContentManager setRequestedSinceLastPrune:](self, "setRequestedSinceLastPrune:", 0);
      v17 = CFSTR(" and pruning");
    }
    _ef_log_EDRemoteContentManager();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v25 = v12;
      v26 = 2114;
      v27 = v17;
      _os_log_impl(&dword_1D2F2C000, v20, OS_LOG_TYPE_DEFAULT, "Finishing after requesting %lu URLs%{public}@", buf, 0x16u);
    }

    -[EDRemoteContentManager testDelegate](self, "testDelegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "remoteContentManager:didFinishAfterRequesting:", self, v12);

    v19 = 0;
    if (a5)
      *a5 = v13;
  }
  else
  {
    -[EDRemoteContentManager testDelegate](self, "testDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "remoteContentManager:didDeferAfterRequesting:", self, v12);

    if (a5)
      *a5 = 1;
    v19 = v12 - v23;
  }

  return v19;
}

- (unint64_t)_performRequests:(unint64_t)a3 unconditionally:(BOOL)a4 withDeferBlock:(id)a5 completedCount:(unint64_t *)a6
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  unint64_t v27;
  uint64_t v29;
  uint64_t v30;
  id (*v31)(uint64_t);
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint8_t buf[24];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  -[EDRemoteContentManager remoteContentPersistence](self, "remoteContentPersistence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteContentLinksBelowCount:limit:", 1, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  _ef_log_EDRemoteContentManager();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    v16 = v14;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "ef_map:", &__block_literal_global_253);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR(", "));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v18;
      _os_log_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_DEFAULT, "Starting request batch for URLs: %{public}@", buf, 0xCu);

    }
    v19 = objc_alloc_init(MEMORY[0x1E0C99D68]);
    v43 = 0;
    *(_QWORD *)buf = 0;
    v41 = 0;
    v42 = 0;
    -[EDRemoteContentManager _issueAndWaitForBatch:deferBlock:successful:failed:canceled:deferred:](self, "_issueAndWaitForBatch:deferBlock:successful:failed:canceled:deferred:", v12, v10, buf, &v43, &v42, &v41);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "timeIntervalSinceDate:", v19);
    v23 = v22;

    objc_msgSend(v11, "updateRequestCountForRemoteContentLinks:updateLastSeen:", v20, 0);
    v24 = objc_msgSend(v12, "count");
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __89__EDRemoteContentManager__performRequests_unconditionally_withDeferBlock_completedCount___block_invoke;
    v32 = &unk_1E94A02D8;
    v35 = v24;
    LOBYTE(v40) = a4;
    v25 = v20;
    v33 = v25;
    v26 = v12;
    v34 = v26;
    v36 = *(_QWORD *)buf;
    v37 = v43;
    v38 = v42;
    v39 = v41;
    AnalyticsSendEventLazy();
    if (a6)
      *a6 = objc_msgSend(v25, "count", v29, 3221225472, __89__EDRemoteContentManager__performRequests_unconditionally_withDeferBlock_completedCount___block_invoke, &unk_1E94A02D8, v25, v26, v35, v23, v36, v37, v38, v39, v40);
    v27 = objc_msgSend(v26, "count", v29, v30, v31, v32);

  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_DEFAULT, "Skipping empty request batch", buf, 2u);
    }

    v27 = 0;
    if (a6)
      *a6 = 0;
  }

  return v27;
}

id __89__EDRemoteContentManager__performRequests_unconditionally_withDeferBlock_completedCount___block_invoke(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[12];
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("batchSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v21 = objc_claimAutoreleasedReturnValue();
  v20[1] = CFSTR("batchDuration");
  v18 = (void *)v21;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v22 = objc_claimAutoreleasedReturnValue();
  v20[2] = CFSTR("isUnconditional");
  v16 = (void *)v22;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 96));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v17;
  v20[3] = CFSTR("didComplete");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "count") == objc_msgSend(*(id *)(a1 + 40), "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v15;
  v20[4] = CFSTR("successfulCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v14;
  v20[5] = CFSTR("percentSuccessful");
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 100 * *(_QWORD *)(a1 + 64) / v2);
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v19;
  v20[6] = CFSTR("failedCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v13;
  v20[7] = CFSTR("percentFailed");
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 100 * *(_QWORD *)(a1 + 72) / v3);
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v4;
  v20[8] = CFSTR("canceledCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 80));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v5;
  v20[9] = CFSTR("percentCanceled");
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 100 * *(_QWORD *)(a1 + 80) / v6);
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v7;
  v20[10] = CFSTR("deferredCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 88));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v8;
  v20[11] = CFSTR("percentDeferred");
  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 100 * *(_QWORD *)(a1 + 88) / v9);
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, v20, 12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_issueAndWaitForBatch:(id)a3 deferBlock:(id)a4 successful:(unint64_t *)a5 failed:(unint64_t *)a6 canceled:(unint64_t *)a7 deferred:(unint64_t *)a8
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  double v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  unint64_t v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unint64_t *v49;
  id v53;
  id v54;
  uint64_t (**v55)(void);
  id obj;
  id v57;
  id v59;
  id v60;
  void *v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[4];
  id v72;
  _QWORD v73[5];
  id v74;
  id v75;
  id v76;
  id v77;
  uint64_t *v78;
  uint64_t *v79;
  uint64_t *v80;
  double v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void (*v100)(uint64_t, uint64_t);
  void *v101;
  id v102;
  uint8_t v103[128];
  uint8_t buf[4];
  void *v105;
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v55 = (uint64_t (**)(void))a4;
  v57 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v59 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v60 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
  -[EDRemoteContentManager urlSession](self, "urlSession");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0D1EF60]);
  v98 = MEMORY[0x1E0C809B0];
  v99 = 3221225472;
  v100 = __95__EDRemoteContentManager__issueAndWaitForBatch_deferBlock_successful_failed_canceled_deferred___block_invoke;
  v101 = &unk_1E94A0240;
  v102 = v10;
  v53 = v102;
  EMPrivacyProxyIsDisabledForNetwork();
  objc_msgSend(v102, "future");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resultWithTimeout:error:", 0, 5.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = a5;
  v13 = objc_msgSend(v12, "BOOLValue");

  v94 = 0;
  v95 = &v94;
  v96 = 0x2020000000;
  v97 = 0;
  v90 = 0;
  v91 = &v90;
  v92 = 0x2020000000;
  v93 = 0;
  v86 = 0;
  v87 = &v86;
  v88 = 0x2020000000;
  v89 = 0;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  obj = v54;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v107, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v83;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v83 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDRemoteContentManager _getTimeout](self, "_getTimeout");
        v20 = v19;
        v73[0] = MEMORY[0x1E0C809B0];
        v73[1] = 3221225472;
        v73[2] = __95__EDRemoteContentManager__issueAndWaitForBatch_deferBlock_successful_failed_canceled_deferred___block_invoke_2;
        v73[3] = &unk_1E94A0328;
        v81 = v19;
        v73[4] = v17;
        v78 = &v94;
        v79 = &v90;
        v80 = &v86;
        v21 = v61;
        v74 = v21;
        v22 = v57;
        v75 = v22;
        v23 = v59;
        v76 = v23;
        v77 = v60;
        objc_msgSend(v62, "dataTaskWithRequest:isSynthetic:allowProxying:failOpen:completionHandler:", v18, 1, 1, v13, v73);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "lock");
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, v17);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v25, v24);

        objc_msgSend(v21, "unlock");
        objc_msgSend(v24, "resume");

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v107, 16);
    }
    while (v14);
  }

  v26 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  v27 = (double)arc4random() / 4294967300.0 * 10.0 + 5.0;
  while (1)
  {
    objc_msgSend(v61, "lock");
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = __95__EDRemoteContentManager__issueAndWaitForBatch_deferBlock_successful_failed_canceled_deferred___block_invoke_59;
    v71[3] = &unk_1E94A0350;
    v28 = v26;
    v72 = v28;
    objc_msgSend(v59, "keysOfEntriesPassingTest:", v71);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v61, "unlockWithCondition:", objc_msgSend(v60, "count"));
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v30 = v29;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v67, v106, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v68;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v68 != v32)
            objc_enumerationMutation(v30);
          objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * j), "cancel");
        }
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v67, v106, 16);
      }
      while (v31);
    }

    v34 = objc_msgSend(obj, "count");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v27);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v34) = objc_msgSend(v61, "lockWhenCondition:beforeDate:", v34, v35);

    if ((v34 & 1) != 0)
      break;
    if ((v55[2]() & 1) != 0 || (-[EFCancelationToken isCanceled](self->_token, "isCanceled") & 1) != 0)
    {
      objc_msgSend(v61, "lock");
      v36 = (void *)objc_msgSend(v60, "copy");
      objc_msgSend(v59, "allKeys");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "unlockWithCondition:", objc_msgSend(v60, "count"));
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v38 = v37;
      v39 = -[NSObject countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v63, v103, 16);
      if (v39)
      {
        v40 = *(_QWORD *)v64;
        do
        {
          for (k = 0; k != v39; ++k)
          {
            if (*(_QWORD *)v64 != v40)
              objc_enumerationMutation(v38);
            objc_msgSend(v62, "abortTask:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * k));
          }
          v39 = -[NSObject countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v63, v103, 16);
        }
        while (v39);
      }

      v42 = -[NSObject count](v38, "count");
      _ef_log_EDRemoteContentManager();
      v43 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v36, "ef_map:", &__block_literal_global_253);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "componentsJoinedByString:", CFSTR(", "));
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543362;
        v105 = v45;
        _os_log_impl(&dword_1D2F2C000, v43, OS_LOG_TYPE_DEFAULT, "Did not finish requesting batch due to deferral, completed: %{public}@", buf, 0xCu);

      }
      goto LABEL_32;
    }
  }
  v36 = (void *)objc_msgSend(v60, "copy");
  objc_msgSend(v61, "unlock");
  _ef_log_EDRemoteContentManager();
  v43 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v36, "ef_map:", &__block_literal_global_253);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "componentsJoinedByString:", CFSTR(", "));
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    *(_DWORD *)buf = 138543362;
    v105 = v47;
    _os_log_impl(&dword_1D2F2C000, v43, OS_LOG_TYPE_DEFAULT, "Finished request batch for URLs: %{public}@", buf, 0xCu);

  }
  v42 = 0;
  v38 = v43;
LABEL_32:

  if (v49)
    *v49 = v95[3];
  if (a6)
    *a6 = v87[3];
  if (a7)
    *a7 = v91[3];
  if (a8)
    *a8 = v42;

  _Block_object_dispose(&v86, 8);
  _Block_object_dispose(&v90, 8);
  _Block_object_dispose(&v94, 8);

  return v36;
}

void __95__EDRemoteContentManager__issueAndWaitForBatch_deferBlock_successful_failed_canceled_deferred___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithResult:");

}

void __95__EDRemoteContentManager__issueAndWaitForBatch_deferBlock_successful_failed_canceled_deferred___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(v9, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
    {
      v15 = objc_msgSend(v9, "code");

      if (v15 == -999)
      {
        _ef_log_EDRemoteContentManager();
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = *(_QWORD *)(a1 + 96);
          v18 = *(id *)(a1 + 32);
          if (objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 13))
          {
            objc_msgSend(v18, "absoluteString");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v31 = (void *)MEMORY[0x1E0D1EF48];
            objc_msgSend(v18, "absoluteString");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "fullyRedactedStringForString:", v32);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

          }
          *(_DWORD *)buf = 134218242;
          v36 = v17;
          v37 = 2114;
          v38 = v19;
          _os_log_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_INFO, "Canceled URL with %.2fs timeout: %{public}@", buf, 0x16u);

        }
        v30 = *(_QWORD *)(a1 + 80);
LABEL_23:
        ++*(_QWORD *)(*(_QWORD *)(v30 + 8) + 24);
        goto LABEL_24;
      }
    }
    else
    {

    }
    _ef_log_EDRemoteContentManager();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = *(_QWORD *)(a1 + 96);
      v22 = *(id *)(a1 + 32);
      if (objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 13))
      {
        objc_msgSend(v22, "absoluteString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = (void *)MEMORY[0x1E0D1EF48];
        objc_msgSend(v22, "absoluteString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "fullyRedactedStringForString:", v27);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v28 = v23;
      objc_msgSend(v9, "ef_publicDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v36 = v21;
      v37 = 2114;
      v38 = v28;
      v39 = 2114;
      v40 = v29;
      _os_log_impl(&dword_1D2F2C000, v20, OS_LOG_TYPE_INFO, "Failed to request URL with %.2fs timeout: %{public}@ -- due to error: %{public}@", buf, 0x20u);

    }
    v30 = *(_QWORD *)(a1 + 88);
    goto LABEL_23;
  }
  _ef_log_EDRemoteContentManager();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = *(_QWORD *)(a1 + 96);
    v12 = *(id *)(a1 + 32);
    if (objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 13))
    {
      objc_msgSend(v12, "absoluteString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = (void *)MEMORY[0x1E0D1EF48];
      objc_msgSend(v12, "absoluteString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "fullyRedactedStringForString:", v25);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    *(_DWORD *)buf = 134218242;
    v36 = v11;
    v37 = 2114;
    v38 = v13;
    _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_INFO, "Requested URL with %.2fs timeout: %{public}@", buf, 0x16u);

  }
  v34 = v7;
  AnalyticsSendEventLazy();
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);

LABEL_24:
  objc_msgSend(*(id *)(a1 + 40), "lock");
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "removeObjectForKey:", v33);
  objc_msgSend(*(id *)(a1 + 64), "addObject:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "unlockWithCondition:", objc_msgSend(*(id *)(a1 + 64), "count"));
}

id __95__EDRemoteContentManager__issueAndWaitForBatch_deferBlock_successful_failed_canceled_deferred___block_invoke_55(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("dataSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "length"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

BOOL __95__EDRemoteContentManager__issueAndWaitForBatch_deferBlock_successful_failed_canceled_deferred___block_invoke_59(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  _BOOL8 v8;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
  v6 = v5;
  objc_msgSend(v4, "doubleValue");
  v8 = v7 < -v6;

  return v8;
}

- (EFScheduler)unconditionalRequestScheduler
{
  EFScheduler *unconditionalRequestScheduler;
  EFScheduler *v4;
  EFScheduler *v5;

  unconditionalRequestScheduler = self->_unconditionalRequestScheduler;
  if (!unconditionalRequestScheduler)
  {
    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:", CFSTR("com.apple.email.EDRemoteContentManager.unconditionalRequestScheduler"));
    v4 = (EFScheduler *)objc_claimAutoreleasedReturnValue();
    v5 = self->_unconditionalRequestScheduler;
    self->_unconditionalRequestScheduler = v4;

    unconditionalRequestScheduler = self->_unconditionalRequestScheduler;
  }
  return unconditionalRequestScheduler;
}

- (id)_requestSchedulerWithInterval:(double)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  xpc_object_t v7;

  -[EDRemoteContentManager requestSchedulerBlock](self, "requestSchedulerBlock");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (!v4
    || ((*(void (**)(uint64_t))(v4 + 16))(v4), (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34B0]), "initWithIdentifier:", CFSTR("com.apple.email.EDRemoteContentManager.requestScheduler"));
    objc_msgSend(v6, "setQualityOfService:", 9);
    objc_msgSend(v6, "setRepeats:", 0);
    objc_msgSend(v6, "setInterval:", a3);
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v7, (const char *)*MEMORY[0x1E0C80738], 0);
    xpc_dictionary_set_BOOL(v7, (const char *)*MEMORY[0x1E0C808C8], 1);
    objc_msgSend(v6, "_setAdditionalXPCActivityProperties:", v7);

  }
  return v6;
}

- (BOOL)shouldAddRemoteContentLinksForMessage:(id)a3 logMessage:(id *)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  BOOL v9;
  void *v10;
  id v11;

  v6 = a3;
  objc_msgSend(v6, "mailbox");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "type");

  if ((v8 > 8 || ((1 << v8) & 0x17A) == 0) && v8 != -500 && v8 != -100)
  {
    objc_msgSend(v6, "dateReceived");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[EDRemoteContentManager shouldAddRemoteContentLinksForMessageWithDateReceived:](self, "shouldAddRemoteContentLinksForMessageWithDateReceived:", v10);
    if (v9)
    {
      if (a4)
      {
        v11 = 0;
LABEL_13:
        *a4 = v11;
      }
    }
    else if (a4)
    {
      v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("message is too old: %@"), v10);
      goto LABEL_13;
    }

    goto LABEL_15;
  }
  v9 = 0;
  if (a4)
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("wrong mailbox type: %ld"), v8);
LABEL_15:

  return v9;
}

- (BOOL)shouldAddRemoteContentLinksForMessageWithDateReceived:(id)a3
{
  double v3;

  objc_msgSend(a3, "timeIntervalSinceNow");
  return v3 >= -2419200.0;
}

- (BOOL)shouldVerifyRemoteLinks
{
  BOOL v3;
  EFLocked *remoteLinkVerificationTimes;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = 1;
  if ((objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 12) & 1) == 0)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v10 = 1;
    remoteLinkVerificationTimes = self->_remoteLinkVerificationTimes;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__EDRemoteContentManager_shouldVerifyRemoteLinks__block_invoke;
    v6[3] = &unk_1E94A0378;
    v6[4] = &v7;
    -[EFLocked performWhileLocked:](remoteLinkVerificationTimes, "performWhileLocked:", v6);
    v3 = *((_BYTE *)v8 + 24) != 0;
    _Block_object_dispose(&v7, 8);
  }
  return v3;
}

void __49__EDRemoteContentManager_shouldVerifyRemoteLinks__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((unint64_t)objc_msgSend(v4, "count") >= 0xA)
  {
    objc_msgSend(v4, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "ef_isMoreThanTimeIntervalAgo:", 86400.0) & 1) == 0)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;

  }
}

- (void)addRemoteContentLinks:(id)a3
{
  -[EDRemoteContentManager _addRemoteContentLinks:andVerify:WithParsedLinks:defaultCharsetName:](self, "_addRemoteContentLinks:andVerify:WithParsedLinks:defaultCharsetName:", a3, 0, 0, 0);
}

- (void)addRemoteContentLinks:(id)a3 andVerifyWithParsedLinks:(id)a4 defaultCharsetName:(id)a5
{
  -[EDRemoteContentManager _addRemoteContentLinks:andVerify:WithParsedLinks:defaultCharsetName:](self, "_addRemoteContentLinks:andVerify:WithParsedLinks:defaultCharsetName:", a3, 1, a4, a5);
}

- (void)_addRemoteContentLinks:(id)a3 andVerify:(BOOL)a4 WithParsedLinks:(id)a5 defaultCharsetName:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;

  v9 = a3;
  v10 = a5;
  -[EDRemoteContentManager backgroundWorkScheduler](self, "backgroundWorkScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __94__EDRemoteContentManager__addRemoteContentLinks_andVerify_WithParsedLinks_defaultCharsetName___block_invoke;
  v14[3] = &unk_1E94A0218;
  v14[4] = self;
  v12 = v9;
  v15 = v12;
  v17 = a4;
  v13 = v10;
  v16 = v13;
  objc_msgSend(v11, "performBlock:", v14);

}

void __94__EDRemoteContentManager__addRemoteContentLinks_andVerify_WithParsedLinks_defaultCharsetName___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[4];
  id v61;
  id v62;
  uint8_t buf[4];
  id v64;
  __int16 v65;
  void *v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "isCanceled") & 1) == 0)
  {
    v50 = *(id *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 40), "indexesOfObjectsPassingTest:", &__block_literal_global_74);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v49, "count"))
    {
      v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __94__EDRemoteContentManager__addRemoteContentLinks_andVerify_WithParsedLinks_defaultCharsetName___block_invoke_3;
      v60[3] = &unk_1E94A03C0;
      v61 = *(id *)(a1 + 40);
      v3 = v2;
      v62 = v3;
      objc_msgSend(v49, "enumerateIndexesUsingBlock:", v60);
      v4 = v3;

      v5 = v4;
    }
    else
    {
      v5 = v50;
    }
    v51 = v5;
    objc_msgSend(*(id *)(a1 + 32), "addRemoteContentLinks:requiredParsing:");
    _ef_log_EDRemoteContentManager();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v51;
      objc_msgSend(v7, "ef_map:", &__block_literal_global_253);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v64 = v9;
      _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "Added URLs: %{public}@", buf, 0xCu);

    }
    if (!*(_BYTE *)(a1 + 56))
      goto LABEL_36;
    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v51);
    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", *(_QWORD *)(a1 + 48));
    if ((objc_msgSend(v48, "isEqualToSet:") & 1) != 0)
      goto LABEL_31;
    objc_msgSend(v48, "ef_setByRemovingObjectsFromSet:", v45);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "ef_setByRemovingObjectsFromSet:", v48);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count") == 1 && objc_msgSend(v46, "count") == 1)
    {
      objc_msgSend(v10, "anyObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "anyObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scheme");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "ef_hasScheme:", v13) & 1) != 0)
      {
        objc_msgSend(v12, "host");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v11, "ef_hasHost:", v14);

        if ((v15 & 1) != 0)
        {

LABEL_31:
          _ef_log_EDRemoteContentManager();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D2F2C000, v37, OS_LOG_TYPE_DEFAULT, "Verification: URLs match parsed URLs", buf, 2u);
          }
          v36 = 0;
          v35 = 0;
          goto LABEL_34;
        }
      }
      else
      {

      }
      v36 = (uint64_t)v46;
      v35 = (uint64_t)v10;
    }
    else
    {
      v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v17 = v10;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v57;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v57 != v19)
              objc_enumerationMutation(v17);
            v21 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v20);
            objc_msgSend(v21, "ef_caseNormalizedURL");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              objc_msgSend(v21, "ef_caseNormalizedURL");
              v23 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, v23);
            }
            else
            {
              _ef_log_EDRemoteContentManager();
              v23 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                v24 = v21;
                if (objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 13))
                {
                  objc_msgSend(v24, "absoluteString");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v26 = (void *)MEMORY[0x1E0D1EF48];
                  objc_msgSend(v24, "absoluteString");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "fullyRedactedStringForString:", v27);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();

                }
                v28 = v25;
                objc_msgSend(v24, "scheme");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v64 = v28;
                v65 = 2114;
                v66 = v29;
                _os_log_error_impl(&dword_1D2F2C000, v23, OS_LOG_TYPE_ERROR, "Invalid extra URL: %{public}@ with scheme: %{public}@", buf, 0x16u);

              }
            }

            ++v20;
          }
          while (v18 != v20);
          v30 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
          v18 = v30;
        }
        while (v30);
      }

      v31 = (void *)objc_msgSend(v17, "mutableCopy");
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __94__EDRemoteContentManager__addRemoteContentLinks_andVerify_WithParsedLinks_defaultCharsetName___block_invoke_82;
      v53[3] = &unk_1E94A03E8;
      v32 = v16;
      v54 = v32;
      v33 = v31;
      v55 = v33;
      objc_msgSend(v46, "ef_filter:", v53);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "ef_notEmpty");
      v35 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "ef_notEmpty");
      v36 = objc_claimAutoreleasedReturnValue();

      if (!(v35 | v36))
        goto LABEL_31;
    }
    if (objc_msgSend((id)v35, "count"))
    {
      _ef_log_EDRemoteContentManager();
      v38 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)v35, "allObjects");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "ef_map:", &__block_literal_global_253);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "componentsJoinedByString:", CFSTR(", "));
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543362;
        v64 = v41;
        _os_log_error_impl(&dword_1D2F2C000, v38, OS_LOG_TYPE_ERROR, "Verification: Extra URLs: %{public}@", buf, 0xCu);

      }
    }
    if (!objc_msgSend((id)v36, "count"))
      goto LABEL_35;
    _ef_log_EDRemoteContentManager();
    v37 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v36, "allObjects");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "ef_map:", &__block_literal_global_253);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "componentsJoinedByString:", CFSTR(", "));
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v64 = v44;
      _os_log_error_impl(&dword_1D2F2C000, v37, OS_LOG_TYPE_ERROR, "Verification: Missed URLs: %{public}@", buf, 0xCu);

    }
LABEL_34:

LABEL_35:
    v52 = (id)v35;
    v47 = (id)v36;
    AnalyticsSendEventLazy();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "performWhileLocked:", &__block_literal_global_94);

LABEL_36:
  }
}

uint64_t __94__EDRemoteContentManager__addRemoteContentLinks_andVerify_WithParsedLinks_defaultCharsetName___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "ef_hasScheme:", CFSTR("http")))
    v3 = objc_msgSend(MEMORY[0x1E0CEF630], "_willUpgradeToHTTPS:", v2);
  else
    v3 = 0;

  return v3;
}

void __94__EDRemoteContentManager__addRemoteContentLinks_andVerify_WithParsedLinks_defaultCharsetName___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ef_urlByReplacingSchemeWithScheme:", CFSTR("https"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", v4, a2);

}

uint64_t __94__EDRemoteContentManager__addRemoteContentLinks_andVerify_WithParsedLinks_defaultCharsetName___block_invoke_82(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "ef_caseNormalizedURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v4);
    v6 = 0;
  }
  else
  {
    _ef_log_EDRemoteContentManager();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = v3;
      if (objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 13))
      {
        objc_msgSend(v8, "absoluteString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = (void *)MEMORY[0x1E0D1EF48];
        objc_msgSend(v8, "absoluteString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "fullyRedactedStringForString:", v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v12 = v9;
      objc_msgSend(v8, "scheme");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      __94__EDRemoteContentManager__addRemoteContentLinks_andVerify_WithParsedLinks_defaultCharsetName___block_invoke_82_cold_1(v12, v13, v15, v7);
    }

    v6 = 1;
  }

  return v6;
}

id __94__EDRemoteContentManager__addRemoteContentLinks_andVerify_WithParsedLinks_defaultCharsetName___block_invoke_86(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("hadMismatches");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("extraCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("missedCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __94__EDRemoteContentManager__addRemoteContentLinks_andVerify_WithParsedLinks_defaultCharsetName___block_invoke_2_93(uint64_t a1, void *a2)
{
  void *v2;
  id i;

  for (i = a2; (unint64_t)objc_msgSend(i, "count") >= 0xA; objc_msgSend(i, "removeObjectAtIndex:", 0));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(i, "addObject:", v2);

}

- (void)addRemoteContentLinks:(id)a3 requiredParsing:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((-[EFCancelationToken isCanceled](self->_token, "isCanceled") & 1) == 0)
  {
    -[EDRemoteContentManager remoteContentPersistence](self, "remoteContentPersistence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v6, "addRemoteContentLinks:newLinks:", v5, &v15);
    v7 = v15;

    v13 = MEMORY[0x1E0C809B0];
    v8 = v5;
    v14 = v8;
    v9 = v7;
    AnalyticsSendEventLazy();
    -[EDRemoteContentManager _scheduleBackgroundRequests](self, "_scheduleBackgroundRequests", v13, 3221225472, __64__EDRemoteContentManager_addRemoteContentLinks_requiredParsing___block_invoke, &unk_1E94A0410);
    _ef_log_EDRemoteContentManager();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "ef_map:", &__block_literal_global_253);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v17 = v12;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Parsed and added URLs: %{public}@", buf, 0xCu);

    }
  }

}

id __64__EDRemoteContentManager_addRemoteContentLinks_requiredParsing___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("remoteContentLinks");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("newRemoteContentLinks");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("requiredParsing");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)_getTimeout
{
  os_unfair_lock_s *p_timeoutLock;
  void *v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v12;
  void *v13;

  p_timeoutLock = &self->_timeoutLock;
  os_unfair_lock_lock(&self->_timeoutLock);
  -[EDRemoteContentManager timeoutLastUpdate](self, "timeoutLastUpdate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    || (-[EDRemoteContentManager timeoutLastUpdate](self, "timeoutLastUpdate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "ef_isMoreThanTimeIntervalAgo:", 86400.0),
        v5,
        v6))
  {
    -[EDRemoteContentManager _updateTimeoutSettingDefaultIfNeeded:](self, "_updateTimeoutSettingDefaultIfNeeded:", v4 == 0);
  }
  -[EDRemoteContentManager minimumTimeout](self, "minimumTimeout");
  v8 = v7;
  -[EDRemoteContentManager maximumTimeout](self, "maximumTimeout");
  v10 = v9;
  os_unfair_lock_unlock(p_timeoutLock);
  if (v10 < v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "double EFARC4RandomDoubleInRange(double, double)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("EFMathUtilities.h"), 54, CFSTR("max must not be less than min"));

  }
  return v8 + (v10 - v8) * ((double)arc4random() / 4294967300.0);
}

- (void)_updateTimeoutSettingDefaultIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  uint32_t v10;
  unsigned int v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSObject *v21;
  const __CFString *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  _BYTE v30[40];
  uint64_t v31;

  v3 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  -[EDRemoteContentManager setTimeoutLastUpdate:](self, "setTimeoutLastUpdate:", v5);

  -[EDRemoteContentManager _viewDurationsFromBiome](self, "_viewDurationsFromBiome");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    _ef_log_EDRemoteContentManager();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[EDRemoteContentManager _updateTimeoutSettingDefaultIfNeeded:].cold.1(v7);

  }
  if ((unint64_t)objc_msgSend(v6, "count") > 9)
  {
    v10 = arc4random_uniform(3u);
    v11 = v10;
    if (v10 - 1 >= 2)
    {
      v19 = 0.0;
      v20 = 0.0;
      if (v10)
      {
LABEL_23:
        -[EDRemoteContentManager setMinimumTimeout:](self, "setMinimumTimeout:", fmax(v19, 2.0), *(_OWORD *)v30, *(_OWORD *)&v30[16], *(_QWORD *)&v30[32], v31);
        -[EDRemoteContentManager setMaximumTimeout:](self, "setMaximumTimeout:", fmax(v20, 2.0));
        goto LABEL_24;
      }
      objc_msgSend(v6, "ef_min");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "doubleValue");
      v19 = v27;

      objc_msgSend(v6, "ef_max");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "doubleValue");
      v20 = v29;

      _ef_log_EDRemoteContentManager();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v30 = 134218240;
        *(double *)&v30[4] = v19;
        *(_WORD *)&v30[12] = 2048;
        *(double *)&v30[14] = v20;
        v23 = "Updating timeout values based on min and max: (%f, %f)";
        v24 = v21;
        v25 = 22;
LABEL_21:
        _os_log_impl(&dword_1D2F2C000, v24, OS_LOG_TYPE_DEFAULT, v23, v30, v25);
      }
    }
    else
    {
      objc_msgSend(v6, "ef_mean");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      v14 = v13;

      objc_msgSend(v6, "ef_standardDeviation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "doubleValue");
      v17 = v16;

      v18 = v17 * (double)v11;
      v19 = v14 - v18;
      v20 = v14 + v18;
      _ef_log_EDRemoteContentManager();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = CFSTR("s");
        *(_DWORD *)v30 = 67109890;
        *(_DWORD *)&v30[4] = v11;
        *(_WORD *)&v30[8] = 2114;
        if (v11 == 1)
          v22 = &stru_1E94A4508;
        *(_QWORD *)&v30[10] = v22;
        *(_WORD *)&v30[18] = 2048;
        *(double *)&v30[20] = v19;
        *(_WORD *)&v30[28] = 2048;
        *(double *)&v30[30] = v20;
        v23 = "Updating timeout values based on mean and %u standard deviation%{public}@: (%f, %f)";
        v24 = v21;
        v25 = 38;
        goto LABEL_21;
      }
    }

    goto LABEL_23;
  }
  _ef_log_EDRemoteContentManager();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v9)
    {
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "Using default timeout values", v30, 2u);
    }

    -[EDRemoteContentManager setMinimumTimeout:](self, "setMinimumTimeout:", 2.0);
    -[EDRemoteContentManager setMaximumTimeout:](self, "setMaximumTimeout:", 600.0);
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "Leaving timeout values unchanged", v30, 2u);
    }

  }
LABEL_24:

}

- (id)_viewDurationsFromBiome
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  objc_msgSend(MEMORY[0x1E0D1E0E8], "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E0D024C0];
    objc_msgSend(v2, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "newPrivateStreamDefaultConfigurationWithStoreBasePath:", v5);

    v7 = objc_alloc(MEMORY[0x1E0D02790]);
    v8 = (void *)objc_msgSend(v7, "initWithPrivateStreamIdentifier:storeConfig:", *MEMORY[0x1E0D1E3D8], v6);
    objc_msgSend(v8, "publisherFromStartTime:", CFAbsoluteTimeGetCurrent() + -604800.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__26;
    v19 = __Block_byref_object_dispose__26;
    v20 = (id)0xAAAAAAAAAAAAAAAALL;
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13[4] = &v15;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __49__EDRemoteContentManager__viewDurationsFromBiome__block_invoke;
    v14[3] = &unk_1E94A0458;
    v14[4] = &v15;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __49__EDRemoteContentManager__viewDurationsFromBiome__block_invoke_2;
    v13[3] = &unk_1E94A0480;
    v10 = (id)objc_msgSend(v9, "sinkWithCompletion:receiveInput:", v14, v13);
    v11 = (id)v16[5];
    _Block_object_dispose(&v15, 8);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __49__EDRemoteContentManager__viewDurationsFromBiome__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;

  if (objc_msgSend(a2, "state"))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
}

void __49__EDRemoteContentManager__viewDurationsFromBiome__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "eventBody");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D1E3F8]);

  if ((v4 & 1) != 0)
  {
    objc_msgSend(v7, "payload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D1E410]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v6);

  }
}

- (void)noteViewOfRemoteContentLinks:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint32_t v10;
  unint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  EDRemoteContentManager *v18;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_1D2F2C000, "-[EDRemoteContentManager noteViewOfRemoteContentLinks:]", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  if (objc_msgSend(v4, "count"))
  {
    -[EDRemoteContentManager backgroundWorkScheduler](self, "backgroundWorkScheduler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __55__EDRemoteContentManager_noteViewOfRemoteContentLinks___block_invoke;
    v16 = &unk_1E949B6D0;
    v7 = v4;
    v17 = v7;
    v18 = self;
    objc_msgSend(v6, "performBlock:", &v13);

    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo", v13, v14, v15, v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isLowPowerModeEnabled") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D1EF20], "external");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "isConstrained"))
      {
        v10 = arc4random_uniform(4u);

        if (!v10)
        {
          v11 = objc_msgSend(v7, "count");
          if (v11 >= 6)
          {
            EFARC4NormallyDistributedRandomDoubleInRange();
            v11 = (unint64_t)v12;
          }
          EFARC4NormallyDistributedRandomDoubleWithMinimum();
          -[EDRemoteContentManager _scheduleRequestForLinks:unconditionally:withDelay:completionHandler:](self, "_scheduleRequestForLinks:unconditionally:withDelay:completionHandler:", v11, 1, 0);
        }
        goto LABEL_6;
      }

    }
LABEL_6:

  }
  os_activity_scope_leave(&state);

}

void __55__EDRemoteContentManager_noteViewOfRemoteContentLinks___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _ef_log_EDRemoteContentManager();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(id *)(a1 + 32);
    objc_msgSend(v3, "ef_map:", &__block_literal_global_253);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1D2F2C000, v2, OS_LOG_TYPE_DEFAULT, "Viewed URLs: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "remoteContentPersistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateRequestCountForRemoteContentLinks:updateLastSeen:", *(_QWORD *)(a1 + 32), 1);

}

- (void)test_tearDown
{
  void *v4;
  void *v5;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDRemoteContentManager.m"), 904, CFSTR("%s can only be called from unit tests"), "-[EDRemoteContentManager test_tearDown]");

  }
  -[EFCancelationToken cancel](self->_token, "cancel");
  -[EDRemoteContentManager backgroundWorkScheduler](self, "backgroundWorkScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performSyncBlock:", &__block_literal_global_117);

  os_unfair_lock_lock(&self->_requestSchedulerLock);
  -[NSBackgroundActivityScheduler invalidate](self->_requestScheduler, "invalidate");
  os_unfair_lock_unlock(&self->_requestSchedulerLock);
  -[NSLock lock](self->_requestLock, "lock");
  -[NSLock unlock](self->_requestLock, "unlock");
}

- (EDRemoteContentPersistence)remoteContentPersistence
{
  return self->_remoteContentPersistence;
}

- (EMRemoteContentURLSession)urlSession
{
  return self->_urlSession;
}

- (EFScheduler)backgroundWorkScheduler
{
  return self->_backgroundWorkScheduler;
}

- (NSLock)requestLock
{
  return self->_requestLock;
}

- (unint64_t)requestedSinceLastPrune
{
  return self->_requestedSinceLastPrune;
}

- (void)setRequestedSinceLastPrune:(unint64_t)a3
{
  self->_requestedSinceLastPrune = a3;
}

- (double)minimumTimeout
{
  return self->_minimumTimeout;
}

- (void)setMinimumTimeout:(double)a3
{
  self->_minimumTimeout = a3;
}

- (double)maximumTimeout
{
  return self->_maximumTimeout;
}

- (void)setMaximumTimeout:(double)a3
{
  self->_maximumTimeout = a3;
}

- (NSDate)timeoutLastUpdate
{
  return self->_timeoutLastUpdate;
}

- (void)setTimeoutLastUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutLastUpdate, a3);
}

- (double)requestInterval
{
  return self->_requestInterval;
}

- (void)setRequestInterval:(double)a3
{
  self->_requestInterval = a3;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (NSDate)schedulingLastUpdate
{
  return self->_schedulingLastUpdate;
}

- (void)setSchedulingLastUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_schedulingLastUpdate, a3);
}

- (EDRemoteContentManagerTestDelegate)testDelegate
{
  return (EDRemoteContentManagerTestDelegate *)objc_loadWeakRetained((id *)&self->_testDelegate);
}

- (void)setTestDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_testDelegate, a3);
}

- (id)requestSchedulerBlock
{
  return self->_requestSchedulerBlock;
}

- (void)setRequestSchedulerBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (unint64_t)pruneFrequency
{
  return self->_pruneFrequency;
}

- (void)setPruneFrequency:(unint64_t)a3
{
  self->_pruneFrequency = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestSchedulerBlock, 0);
  objc_destroyWeak((id *)&self->_testDelegate);
  objc_storeStrong((id *)&self->_schedulingLastUpdate, 0);
  objc_storeStrong((id *)&self->_timeoutLastUpdate, 0);
  objc_storeStrong((id *)&self->_requestLock, 0);
  objc_storeStrong((id *)&self->_backgroundWorkScheduler, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_remoteContentPersistence, 0);
  objc_storeStrong((id *)&self->_remoteLinkVerificationTimes, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_unconditionalRequestScheduler, 0);
  objc_storeStrong((id *)&self->_requestScheduler, 0);
}

void __94__EDRemoteContentManager__addRemoteContentLinks_andVerify_WithParsedLinks_defaultCharsetName___block_invoke_82_cold_1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Invalid missedLink URL: %{public}@ with scheme: %{public}@", buf, 0x16u);

}

- (void)_updateTimeoutSettingDefaultIfNeeded:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Unable to get view durations from Biome", v1, 2u);
}

@end

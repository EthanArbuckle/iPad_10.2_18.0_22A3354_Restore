@implementation MTSessionsCoordinator

- (MTSessionsManager)sessionsManager
{
  return self->_sessionsManager;
}

- (BOOL)hasActiveSession
{
  void *v3;
  char v4;
  void *v5;

  -[MTSessionsCoordinator sessionsManager](self, "sessionsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasActiveAlarmSession") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[MTSessionsCoordinator sessionsManager](self, "sessionsManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "hasActiveTimerSession");

  }
  return v4;
}

- (void)endAlertingSession
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  MTSessionsCoordinator *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[MTSessionsCoordinator hasActiveSession](self, "hasActiveSession"))
  {
    MTLogForCategory(4);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = self;
      _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ ending alerting session", (uint8_t *)&v6, 0xCu);
    }

    -[MTSessionsCoordinator server](self, "server");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alertingSessionId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "length"))
      -[MTSessionsCoordinator _endAlertWithId:activityId:](self, "_endAlertWithId:activityId:", v5, 0);

  }
}

- (MTSessionsCoordinator)initWithStorage:(id)a3 alarmStorage:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  void *v12;
  void *v13;
  NAScheduler *v14;
  NAScheduler *serializer;
  MTSessionsManager *v16;
  MTSessionsManager *sessionsManager;
  OS_dispatch_queue *v18;
  OS_dispatch_queue *connectionQueue;
  void *v20;
  id currentDateProvider;
  int v23;
  MTSessionsCoordinator *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (self)
  {
    MTLogForCategory(4);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138543874;
      v24 = self;
      v25 = 2114;
      v26 = v7;
      v27 = 2114;
      v28 = v8;
      _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@ with timerStorage:%{public}@ alarmStorage:%{public}@", (uint8_t *)&v23, 0x20u);
    }

    objc_storeStrong((id *)&self->_timerStorage, a3);
    objc_storeStrong((id *)&self->_alarmStorage, a4);
    -[MTTimerStorage registerObserver:](self->_timerStorage, "registerObserver:", self);
    -[MTAlarmStorage registerObserver:](self->_alarmStorage, "registerObserver:", self);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.MTSessionsCoordinator.serialqueue", v10);
    -[MTSessionsCoordinator setSerializerQueue:](self, "setSerializerQueue:", v11);

    v12 = (void *)MEMORY[0x1E0D519E8];
    -[MTSessionsCoordinator serializerQueue](self, "serializerQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "schedulerWithDispatchQueue:", v13);
    v14 = (NAScheduler *)objc_claimAutoreleasedReturnValue();
    serializer = self->_serializer;
    self->_serializer = v14;

    v16 = (MTSessionsManager *)objc_alloc_init((Class)getMTSessionsManagerClass());
    sessionsManager = self->_sessionsManager;
    self->_sessionsManager = v16;

    v18 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mobiletimer.launchAngelConnection", 0);
    connectionQueue = self->_connectionQueue;
    self->_connectionQueue = v18;

    MTCurrentDateProvider();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    currentDateProvider = self->_currentDateProvider;
    self->_currentDateProvider = v20;

    -[MTSessionsCoordinator buildConnection](self, "buildConnection");
  }

  return self;
}

- (void)restoreSessions
{
  uint64_t v3;
  MTSessionsManager *sessionsManager;
  MTSessionsManager *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v3 = MEMORY[0x1E0C809B0];
  sessionsManager = self->_sessionsManager;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__MTSessionsCoordinator_restoreSessions__block_invoke;
  v7[3] = &unk_1E39CBCF0;
  v7[4] = self;
  -[MTSessionsManager restoreAlarmSessionsWithCompletion:](sessionsManager, "restoreAlarmSessionsWithCompletion:", v7);
  v5 = self->_sessionsManager;
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __40__MTSessionsCoordinator_restoreSessions__block_invoke_3;
  v6[3] = &unk_1E39CBCF0;
  v6[4] = self;
  -[MTSessionsManager restoreTimerSessionsWithCompletion:](v5, "restoreTimerSessionsWithCompletion:", v6);
}

void __40__MTSessionsCoordinator_restoreSessions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ restored alarm sessions: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "didRestoreAlarmSessions:", v3);
}

void __40__MTSessionsCoordinator_restoreSessions__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ restored timer sessions: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "didRestoreTimerSessions:", v3);
}

+ (BOOL)supportsSessions
{
  return objc_msgSend(getMTSessionsManagerClass(), "supportsSessions");
}

- (BOOL)_isSystemReady
{
  MTSessionsCoordinator *v2;
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
  -[MTSessionsCoordinator serializerQueue](self, "serializerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__MTSessionsCoordinator__isSystemReady__block_invoke;
  v5[3] = &unk_1E39CBB50;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __39__MTSessionsCoordinator__isSystemReady__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

- (void)handleSystemReady
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  MTSessionsCoordinator *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ handleSystemReady, restoring sessions", buf, 0xCu);
  }

  -[MTSessionsCoordinator serializerQueue](self, "serializerQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MTSessionsCoordinator_handleSystemReady__block_invoke;
  block[3] = &unk_1E39CB858;
  block[4] = self;
  dispatch_sync(v4, block);

  -[MTSessionsCoordinator restoreSessions](self, "restoreSessions");
}

uint64_t __42__MTSessionsCoordinator_handleSystemReady__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = 1;
  return result;
}

- (void)source:(id)a3 didAddTimers:(id)a4
{
  id v5;
  NSObject *v6;
  NAScheduler *serializer;
  id v8;
  _QWORD v9[4];
  id v10;
  MTSessionsCoordinator *v11;
  uint8_t buf[4];
  MTSessionsCoordinator *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MTLogForCategory(4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ did add timers, starting sessions", buf, 0xCu);
  }

  serializer = self->_serializer;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__MTSessionsCoordinator_source_didAddTimers___block_invoke;
  v9[3] = &unk_1E39CB7B0;
  v10 = v5;
  v11 = self;
  v8 = v5;
  -[NAScheduler performBlock:](serializer, "performBlock:", v9);

}

uint64_t __45__MTSessionsCoordinator_source_didAddTimers___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__MTSessionsCoordinator_source_didAddTimers___block_invoke_2;
  v3[3] = &unk_1E39CC8F0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "na_each:", v3);
}

void __45__MTSessionsCoordinator_source_didAddTimers___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "state") == 3)
    objc_msgSend(*(id *)(a1 + 32), "initializeSessionWithTimer:", v3);

}

- (void)source:(id)a3 didFireTimer:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  NAScheduler *serializer;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  MTSessionsCoordinator *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MTLogForCategory(4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ did fire timer", buf, 0xCu);
  }

  -[MTSessionsCoordinator server](self, "server");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "warmUp");

  serializer = self->_serializer;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__MTSessionsCoordinator_source_didFireTimer___block_invoke;
  v10[3] = &unk_1E39CB7B0;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  -[NAScheduler performBlock:](serializer, "performBlock:", v10);

}

void __45__MTSessionsCoordinator_source_didFireTimer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  void (**v15)(_QWORD);
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sessionsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "timerIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activityIdForTimerId:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __45__MTSessionsCoordinator_source_didFireTimer___block_invoke_2;
  v16[3] = &unk_1E39CB7B0;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v17 = v6;
  v18 = v7;
  v8 = (void (**)(_QWORD))MEMORY[0x19AED0080](v16);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionsManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "timerIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __45__MTSessionsCoordinator_source_didFireTimer___block_invoke_8;
    v14[3] = &unk_1E39CBF18;
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v8;
    objc_msgSend(v9, "finishSessionWithTimerId:completion:", v10, v14);

  }
  else
  {
    MTLogForCategory(4);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "timerIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v12;
      v21 = 2114;
      v22 = v13;
      _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ didFireTimer could not find activity for timer id:%{public}@", buf, 0x16u);

    }
    v8[2](v8);
  }

}

void __45__MTSessionsCoordinator_source_didFireTimer___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int8x16_t v8;
  _QWORD v9[4];
  int8x16_t v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sound");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSilent");

  if ((v3 & 1) != 0)
  {
    MTLogForCategory(4);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "timerID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v5;
      v13 = 2114;
      v14 = v6;
      _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ not posting alert for stop playing timer %{public}@", buf, 0x16u);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "sessionsManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __45__MTSessionsCoordinator_source_didFireTimer___block_invoke_3;
    v9[3] = &unk_1E39CC918;
    v8 = *(int8x16_t *)(a1 + 32);
    v10 = vextq_s8(v8, v8, 8uLL);
    objc_msgSend(v7, "createSessionWithTimer:forAlert:completion:", (id)v8.i64[0], 1, v9);

  }
}

void __45__MTSessionsCoordinator_source_didFireTimer___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  MTLogForCategory(4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __45__MTSessionsCoordinator_source_didFireTimer___block_invoke_3_cold_1();

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v14 = v9;
      _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ created new session for timer alert, proceeding to alert", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__MTSessionsCoordinator_source_didFireTimer___block_invoke_6;
    block[3] = &unk_1E39CB828;
    block[4] = *(_QWORD *)(a1 + 32);
    v11 = v5;
    v12 = *(id *)(a1 + 40);
    dispatch_after(1uLL, MEMORY[0x1E0C80D38], block);

  }
}

void __45__MTSessionsCoordinator_source_didFireTimer___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "timerIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertTimerWithActivityId:timerId:", v2, v3);

}

void __45__MTSessionsCoordinator_source_didFireTimer___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished timer session with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)source:(id)a3 didRemoveTimers:(id)a4
{
  id v5;
  void *v6;
  NAScheduler *serializer;
  id v8;
  _QWORD v9[4];
  id v10;
  MTSessionsCoordinator *v11;

  v5 = a4;
  -[MTSessionsCoordinator server](self, "server");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "warmUp");

  serializer = self->_serializer;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__MTSessionsCoordinator_source_didRemoveTimers___block_invoke;
  v9[3] = &unk_1E39CB7B0;
  v10 = v5;
  v11 = self;
  v8 = v5;
  -[NAScheduler performBlock:](serializer, "performBlock:", v9);

}

uint64_t __48__MTSessionsCoordinator_source_didRemoveTimers___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__MTSessionsCoordinator_source_didRemoveTimers___block_invoke_2;
  v3[3] = &unk_1E39CC8F0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "na_each:", v3);
}

void __48__MTSessionsCoordinator_source_didRemoveTimers___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "timerIDString");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endSessionForTimerId:", v3);

}

- (void)source:(id)a3 didUpdateTimers:(id)a4 fromTimers:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NAScheduler *serializer;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  MTSessionsCoordinator *v17;
  uint8_t buf[4];
  MTSessionsCoordinator *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  -[MTSessionsCoordinator server](self, "server");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "warmUp");

  MTLogForCategory(4);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = self;
    _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ did update timer, updating session", buf, 0xCu);
  }

  serializer = self->_serializer;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59__MTSessionsCoordinator_source_didUpdateTimers_fromTimers___block_invoke;
  v14[3] = &unk_1E39CB828;
  v15 = v7;
  v16 = v8;
  v17 = self;
  v12 = v8;
  v13 = v7;
  -[NAScheduler performBlock:](serializer, "performBlock:", v14);

}

void __59__MTSessionsCoordinator_source_didUpdateTimers_fromTimers___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__MTSessionsCoordinator_source_didUpdateTimers_fromTimers___block_invoke_2;
  v5[3] = &unk_1E39CC940;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "na_each:", v5);

}

void __59__MTSessionsCoordinator_source_didUpdateTimers_fromTimers___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__MTSessionsCoordinator_source_didUpdateTimers_fromTimers___block_invoke_3;
  v12[3] = &unk_1E39CB998;
  v5 = v3;
  v13 = v5;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTChangeSet changeSetWithChangesFromObject:toObject:](MTChangeSet, "changeSetWithChangesFromObject:toObject:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MTLogForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v15 = v9;
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ timer update change set: %{public}@", buf, 0x16u);
  }

  +[MTTimer propertiesAffectingSessions](MTTimer, "propertiesAffectingSessions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "hasChangesInProperties:", v10);

  if (v11)
    objc_msgSend(*(id *)(a1 + 40), "processTimerUpdate:fromTimer:changeSet:", v5, v6, v7);

}

uint64_t __59__MTSessionsCoordinator_source_didUpdateTimers_fromTimers___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "timerIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timerIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqualToString:", v5);
  return v6;
}

- (void)source:(id)a3 didDismissTimer:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  NAScheduler *serializer;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  MTSessionsCoordinator *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MTLogForCategory(4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "timerIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ didDismissTimer: %{public}@", buf, 0x16u);

  }
  serializer = self->_serializer;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__MTSessionsCoordinator_source_didDismissTimer___block_invoke;
  v10[3] = &unk_1E39CB7B0;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  -[NAScheduler performBlock:](serializer, "performBlock:", v10);

}

void __48__MTSessionsCoordinator_source_didDismissTimer___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "timerIDString");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endSessionForTimerId:", v2);

}

- (void)processTimerUpdate:(id)a3 fromTimer:(id)a4 changeSet:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  uint8_t buf[4];
  MTSessionsCoordinator *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "state");
  if (v11 == objc_msgSend(v9, "state"))
  {
    objc_msgSend(v8, "fireTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fireTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToTime:", v13);

    if ((v14 & 1) != 0)
    {
      if (objc_msgSend(v10, "hasChangeForProperty:", CFSTR("MTTimerTitle")))
      {
        MTLogForCategory(4);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v32 = self;
          _os_log_impl(&dword_19AC4E000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ updating session title", buf, 0xCu);
        }

        -[MTSessionsCoordinator sessionsManager](self, "sessionsManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "updateSessionWithTimer:", v8);

        -[MTSessionsCoordinator server](self, "server");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "timerIDString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "title");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "updateTimerSessionWithId:title:", v18, v19);

      }
    }
    else
    {
      MTLogForCategory(4);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "timerIDString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "fireDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "fireDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v32 = self;
        v33 = 2114;
        v34 = v21;
        v35 = 2114;
        v36 = v22;
        v37 = 2114;
        v38 = v23;
        _os_log_impl(&dword_19AC4E000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ fire time changed for timer id: %{public}@ from: %{public}@ to: %{public}@, restarting", buf, 0x2Au);

      }
      -[MTSessionsCoordinator sessionsManager](self, "sessionsManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timerIDString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "activityIdForTimerId:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        -[MTSessionsCoordinator sessionsManager](self, "sessionsManager");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "timerIDString");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __64__MTSessionsCoordinator_processTimerUpdate_fromTimer_changeSet___block_invoke;
        v29[3] = &unk_1E39CBE30;
        v29[4] = self;
        v30 = v8;
        objc_msgSend(v27, "finishSessionWithTimerId:completion:", v28, v29);

      }
    }
  }
  else
  {
    -[MTSessionsCoordinator processTimerStateUpdate:fromTimer:](self, "processTimerStateUpdate:fromTimer:", v8, v9);
  }

}

void __64__MTSessionsCoordinator_processTimerUpdate_fromTimer_changeSet___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    MTLogForCategory(4);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __64__MTSessionsCoordinator_processTimerUpdate_fromTimer_changeSet___block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "initializeSessionWithTimer:", *(_QWORD *)(a1 + 40));

}

- (void)processTimerStateUpdate:(id)a3 fromTimer:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, void *);
  void *v38;
  MTSessionsCoordinator *v39;
  id v40;
  uint8_t buf[4];
  MTSessionsCoordinator *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MTLogForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v42 = self;
    v43 = 2114;
    v44 = v6;
    v45 = 2114;
    v46 = v7;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ process timer state update: %{public}@, old timer: %{public}@", buf, 0x20u);
  }

  v9 = objc_msgSend(v6, "state");
  if (v9 == 1)
  {
    if ((objc_msgSend(v6, "isFiring") & 1) != 0)
      goto LABEL_24;
    MTLogForCategory(4);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v42 = self;
      _os_log_impl(&dword_19AC4E000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping timer", buf, 0xCu);
    }

    objc_msgSend(v6, "timerIDString");
    v20 = objc_claimAutoreleasedReturnValue();
    -[MTSessionsCoordinator endSessionForTimerId:](self, "endSessionForTimerId:", v20);
LABEL_21:

    goto LABEL_24;
  }
  if (v9 == 2)
  {
    -[MTSessionsCoordinator server](self, "server");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timerIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "duration");
    objc_msgSend(v24, "numberWithDouble:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "remainingTime");
    objc_msgSend(v26, "numberWithDouble:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remainingTime");
    -[MTSessionsCoordinator normalizedTimeString:state:](self, "normalizedTimeString:state:", objc_msgSend(v6, "state"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "remainingTime");
    v32 = v31;
    objc_msgSend(v6, "duration");
    objc_msgSend(v30, "numberWithDouble:", v32 / v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "pauseTimerSessionWithId:title:duration:remaining:timeRemainingString:remainingPortion:", v22, v23, v25, v27, v29, v34);

    MTLogForCategory(4);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v42 = self;
      _os_log_impl(&dword_19AC4E000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ pausing timer", buf, 0xCu);
    }
    goto LABEL_21;
  }
  if (v9 != 3)
  {
    MTLogForCategory(4);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[MTSessionsCoordinator processTimerStateUpdate:fromTimer:].cold.1();
    goto LABEL_21;
  }
  MTLogForCategory(4);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v42 = self;
    _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ starting/resuming timer", buf, 0xCu);
  }

  v35 = MEMORY[0x1E0C809B0];
  v36 = 3221225472;
  v37 = __59__MTSessionsCoordinator_processTimerStateUpdate_fromTimer___block_invoke;
  v38 = &unk_1E39CBE30;
  v39 = self;
  v11 = v6;
  v40 = v11;
  v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AED0080](&v35);
  if (objc_msgSend(v7, "state", v35, v36, v37, v38, v39) != 1)
    goto LABEL_22;
  -[MTSessionsCoordinator sessionsManager](self, "sessionsManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timerIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activityIdForTimerId:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    MTLogForCategory(4);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v42 = self;
      _os_log_impl(&dword_19AC4E000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ has existing timer session, need to end it first", buf, 0xCu);
    }

    -[MTSessionsCoordinator sessionsManager](self, "sessionsManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timerIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "finishSessionWithTimerId:completion:", v18, v12);

  }
  else
  {
LABEL_22:
    v12[2](v12, 0);
  }

LABEL_24:
}

void __59__MTSessionsCoordinator_processTimerStateUpdate_fromTimer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    MTLogForCategory(4);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __59__MTSessionsCoordinator_processTimerStateUpdate_fromTimer___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "initializeSessionWithTimer:", *(_QWORD *)(a1 + 40));
  }

}

- (void)initializeSessionWithTimer:(id)a3
{
  void *v3;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  MTSessionsCoordinator *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MTLogForCategory(4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "nextTrigger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "triggerDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543874;
    v22 = self;
    v23 = 2114;
    v24 = v5;
    v25 = 2114;
    v26 = v8;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ initializing session with timer: %{public}@, next fire trigger: %{public}@", (uint8_t *)&v21, 0x20u);

  }
  -[MTSessionsCoordinator server](self, "server");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timerIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fireDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remainingTime");
    objc_msgSend(v3, "dateByAddingTimeInterval:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "duration");
  *(float *)&v15 = v15;
  objc_msgSend(v14, "numberWithFloat:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startTimerSessionWithId:title:estimatedEndDate:duartion:", v10, v11, v13, v16);

  if (!v12)
  {

  }
  -[MTSessionsCoordinator sessionsManager](self, "sessionsManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timerIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activityIdForTimerId:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    -[MTSessionsCoordinator sessionsManager](self, "sessionsManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "createSessionWithTimer:", v5);

  }
}

- (id)normalizedTimeString:(double)a3 state:(unint64_t)a4
{
  double v4;
  double v5;

  v4 = round(a3);
  v5 = 0.0;
  if (a4 == 2)
    v5 = 1.0;
  if (v4 < v5)
    v4 = v5;
  return FormatTimeWithConfig(0, 0, 0, v4);
}

- (void)endSessionForTimerId:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  MTSessionsCoordinator *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ ending session for timer id: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  -[MTSessionsCoordinator sessionsManager](self, "sessionsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activityIdForTimerId:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MTSessionsCoordinator server](self, "server");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopTimerSessionWithId:", v4);

    -[MTSessionsCoordinator sessionsManager](self, "sessionsManager");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject finishSessionWithTimerId:](v9, "finishSessionWithTimerId:", v4);
  }
  else
  {
    MTLogForCategory(4);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543618;
      v11 = self;
      v12 = 2114;
      v13 = v4;
      _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ no active session for timer id: %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }

}

- (void)buildConnection
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  MTSessionsCoordinator *v15;
  id v16;
  id location;
  uint8_t buf[4];
  MTSessionsCoordinator *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ activating BSServiceConnection", buf, 0xCu);
  }

  -[MTSessionsCoordinator setupInterface](self, "setupInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D03458], "endpointForMachName:service:instance:", CFSTR("com.apple.ClockAngel.mach"), CFSTR("com.apple.ClockAngel-service"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MTLogForCategory(4);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v19 = self;
    v20 = 2114;
    v21 = v6;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ created connection: %{public}@", buf, 0x16u);
  }

  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __40__MTSessionsCoordinator_buildConnection__block_invoke;
  v13 = &unk_1E39CC9B8;
  v8 = v4;
  v14 = v8;
  v15 = self;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v6, "configureConnection:", &v10);
  -[MTSessionsCoordinator setConnection:](self, "setConnection:", v6, v10, v11, v12, v13);
  MTLogForCategory(4);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = self;
    _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ calling connection activate", buf, 0xCu);
  }

  objc_msgSend(v6, "activate");
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

void __40__MTSessionsCoordinator_buildConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  _QWORD v13[5];

  v3 = a2;
  objc_msgSend(v3, "setName:", CFSTR("Clock Angel Connection"));
  objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  objc_msgSend(v3, "setInterface:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 40));
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __40__MTSessionsCoordinator_buildConnection__block_invoke_2;
  v13[3] = &unk_1E39CC968;
  v13[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "setActivationHandler:", v13);
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __40__MTSessionsCoordinator_buildConnection__block_invoke_24;
  v12[3] = &unk_1E39CC968;
  v12[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "setInterruptionHandler:", v12);
  v6 = v5;
  v7 = 3221225472;
  v8 = __40__MTSessionsCoordinator_buildConnection__block_invoke_25;
  v9 = &unk_1E39CC990;
  v10 = *(_QWORD *)(a1 + 40);
  objc_copyWeak(&v11, (id *)(a1 + 48));
  objc_msgSend(v3, "setInvalidationHandler:", &v6);
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), v6, v7, v8, v9, v10);
  objc_destroyWeak(&v11);

}

void __40__MTSessionsCoordinator_buildConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "remoteProcess");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ launch angel connection activated to bundle id: %{public}@", (uint8_t *)&v8, 0x16u);

  }
}

void __40__MTSessionsCoordinator_buildConnection__block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "remoteProcess");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ launch angel connection interrupted to bundle id: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(v3, "activate");

}

void __40__MTSessionsCoordinator_buildConnection__block_invoke_25(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "remoteProcess");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v5;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ launch angel connection invalidated to bundle id: %{public}@", (uint8_t *)&v10, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setConnection:", 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[MTSessionsCoordinator connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[MTSessionsCoordinator setConnection:](self, "setConnection:", 0);
  v4.receiver = self;
  v4.super_class = (Class)MTSessionsCoordinator;
  -[MTSessionsCoordinator dealloc](&v4, sel_dealloc);
}

- (id)setupInterface
{
  if (setupInterface_onceToken != -1)
    dispatch_once(&setupInterface_onceToken, &__block_literal_global_15);
  return (id)setupInterface_interface;
}

void __39__MTSessionsCoordinator_setupInterface__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D03430], "interfaceWithIdentifier:", CFSTR("com.apple.ClockAngel-service"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE3F5650);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServer:", v0);

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE3DE420);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClient:", v1);

  objc_msgSend(v4, "setClientMessagingExpectation:", 0);
  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)setupInterface_interface;
  setupInterface_interface = v2;

}

- (id)server
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v12;
  uint8_t buf[4];
  MTSessionsCoordinator *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[MTSessionsCoordinator connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    MTLogForCategory(4);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = self;
      _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ no server connection, rebuilding", buf, 0xCu);
    }

    -[MTSessionsCoordinator buildConnection](self, "buildConnection");
  }
  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSessionsCoordinator connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteTargetWithLaunchingAssertionAttributes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  MTLogForCategory(4);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = self;
      _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ server connection created", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[MTSessionsCoordinator server].cold.1(self, v10);
  }

  return v8;
}

- (void)pauseTimerWithId:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  MTSessionsCoordinator *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_INFO, "%{public}@ pausing timer", (uint8_t *)&v6, 0xCu);
  }

  -[MTSessionsCoordinator updateTimerWithId:state:](self, "updateTimerWithId:state:", v4, 2);
}

- (void)resumeTimerWithId:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  MTSessionsCoordinator *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_INFO, "%{public}@ resuming timer", (uint8_t *)&v6, 0xCu);
  }

  -[MTSessionsCoordinator updateTimerWithId:state:](self, "updateTimerWithId:state:", v4, 3);
}

- (void)stopTimerWithId:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  MTSessionsCoordinator *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_INFO, "%{public}@ stopping timer", (uint8_t *)&v6, 0xCu);
  }

  -[MTSessionsCoordinator updateTimerWithId:state:](self, "updateTimerWithId:state:", v4, 1);
}

- (void)resendTimerDataEntryWithId:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  _QWORD v13[4];
  NSObject *v14;
  uint8_t buf[4];
  MTSessionsCoordinator *v16;
  __int16 v17;
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v16 = self;
    v17 = 2114;
    v18 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ resending timer data entry with id: %{public}@", buf, 0x16u);
  }

  if (-[MTSessionsCoordinator systemReady](self, "systemReady"))
  {
    -[MTTimerStorage timers](self->_timerStorage, "timers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__MTSessionsCoordinator_resendTimerDataEntryWithId___block_invoke;
    v13[3] = &unk_1E39CB998;
    v7 = v4;
    v14 = v7;
    objc_msgSend(v6, "na_filter:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    MTLogForCategory(4);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138543618;
        v16 = self;
        v17 = 2114;
        v18 = v7;
        _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ resending timer to server, id: %{public}@", buf, 0x16u);
      }

      -[MTSessionsCoordinator processTimerStateUpdate:fromTimer:](self, "processTimerStateUpdate:fromTimer:", v9, 0);
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 138543618;
        v16 = self;
        v17 = 2114;
        v18 = v7;
        _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ could not find matching active timer for id: %{public}@", buf, 0x16u);
      }

    }
    v12 = v14;
  }
  else
  {
    MTLogForCategory(4);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = self;
      v17 = 2114;
      v18 = v4;
      _os_log_impl(&dword_19AC4E000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ system not ready, canceling resend data for timer id: %{public}@", buf, 0x16u);
    }
  }

}

uint64_t __52__MTSessionsCoordinator_resendTimerDataEntryWithId___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "timerIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)repeatTimerWithIdentifier:(id)a3
{
  id v4;
  NAScheduler *serializer;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serializer = self->_serializer;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__MTSessionsCoordinator_repeatTimerWithIdentifier___block_invoke;
  v7[3] = &unk_1E39CB7B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NAScheduler performBlock:](serializer, "performBlock:", v7);

}

void __51__MTSessionsCoordinator_repeatTimerWithIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v10 = v3;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ repeating timer with id: %{public}@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__MTSessionsCoordinator_repeatTimerWithIdentifier___block_invoke_116;
  v7[3] = &unk_1E39CBE30;
  v7[4] = v6;
  v8 = v5;
  objc_msgSend(v6, "dismissTimerAndEndSessionWithId:completion:", v8, v7);

}

void __51__MTSessionsCoordinator_repeatTimerWithIdentifier___block_invoke_116(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];

  v3 = a2;
  if (v3)
  {
    MTLogForCategory(4);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__MTSessionsCoordinator_repeatTimerWithIdentifier___block_invoke_116_cold_1();

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 16);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__MTSessionsCoordinator_repeatTimerWithIdentifier___block_invoke_2;
    v8[3] = &unk_1E39CC2D8;
    v8[4] = v6;
    objc_msgSend(v7, "repeatTimerWithIdentifier:withCompletion:source:", v5, v8);
  }

}

void __51__MTSessionsCoordinator_repeatTimerWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    MTLogForCategory(4);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __51__MTSessionsCoordinator_repeatTimerWithIdentifier___block_invoke_2_cold_1();

  }
}

- (void)dismissTimerWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  MTSessionsCoordinator *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MTTimerStorage timers](self->_timerStorage, "timers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__MTSessionsCoordinator_dismissTimerWithIdentifier___block_invoke;
  v14[3] = &unk_1E39CB998;
  v7 = v4;
  v15 = v7;
  objc_msgSend(v5, "na_filter:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v8) = objc_msgSend(v9, "isFiring");
  MTLogForCategory(4);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((_DWORD)v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v17 = self;
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing firing timer with identifier: %{public}@", buf, 0x16u);
    }

    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __52__MTSessionsCoordinator_dismissTimerWithIdentifier___block_invoke_117;
    v12[3] = &unk_1E39CBE30;
    v12[4] = self;
    v13 = v7;
    -[MTSessionsCoordinator dismissTimerAndEndSessionWithId:completion:](self, "dismissTimerAndEndSessionWithId:completion:", v13, v12);

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MTSessionsCoordinator dismissTimerWithIdentifier:].cold.1();

  }
}

uint64_t __52__MTSessionsCoordinator_dismissTimerWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "timerIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __52__MTSessionsCoordinator_dismissTimerWithIdentifier___block_invoke_117(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    MTLogForCategory(4);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __52__MTSessionsCoordinator_dismissTimerWithIdentifier___block_invoke_117_cold_1();

  }
}

- (void)dismissTimerAndEndSessionWithId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  MTTimerStorage *timerStorage;
  id v15;
  NSObject *v16;
  NSObject *connectionQueue;
  id v18;
  _QWORD v19[4];
  id v20;
  _BYTE *v21;
  _QWORD v22[5];
  id v23;
  NSObject *v24;
  _BYTE *v25;
  _QWORD v26[5];
  id v27;
  NSObject *v28;
  _BYTE *v29;
  _BYTE buf[24];
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MTLogForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing session timer for id: %{public}@", buf, 0x16u);
  }

  v9 = dispatch_group_create();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v31 = __Block_byref_object_copy__4;
  v32 = __Block_byref_object_dispose__4;
  v33 = 0;
  dispatch_group_enter(v9);
  -[MTSessionsCoordinator sessionsManager](self, "sessionsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __68__MTSessionsCoordinator_dismissTimerAndEndSessionWithId_completion___block_invoke;
  v26[3] = &unk_1E39CC9E0;
  v26[4] = self;
  v12 = v6;
  v27 = v12;
  v29 = buf;
  v13 = v9;
  v28 = v13;
  objc_msgSend(v10, "finishSessionWithTimerId:completion:", v12, v26);

  dispatch_group_enter(v13);
  timerStorage = self->_timerStorage;
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __68__MTSessionsCoordinator_dismissTimerAndEndSessionWithId_completion___block_invoke_118;
  v22[3] = &unk_1E39CC9E0;
  v22[4] = self;
  v15 = v12;
  v23 = v15;
  v25 = buf;
  v16 = v13;
  v24 = v16;
  -[MTTimerStorage dismissTimerWithIdentifier:withCompletion:source:](timerStorage, "dismissTimerWithIdentifier:withCompletion:source:", v15, v22, self);
  connectionQueue = self->_connectionQueue;
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __68__MTSessionsCoordinator_dismissTimerAndEndSessionWithId_completion___block_invoke_119;
  v19[3] = &unk_1E39CCA08;
  v20 = v7;
  v21 = buf;
  v18 = v7;
  dispatch_group_notify(v16, connectionQueue, v19);

  _Block_object_dispose(buf, 8);
}

void __68__MTSessionsCoordinator_dismissTimerAndEndSessionWithId_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  if (v4)
  {
    MTLogForCategory(4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __68__MTSessionsCoordinator_dismissTimerAndEndSessionWithId_completion___block_invoke_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __68__MTSessionsCoordinator_dismissTimerAndEndSessionWithId_completion___block_invoke_118(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  if (v4)
  {
    MTLogForCategory(4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __68__MTSessionsCoordinator_dismissTimerAndEndSessionWithId_completion___block_invoke_118_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __68__MTSessionsCoordinator_dismissTimerAndEndSessionWithId_completion___block_invoke_119(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return result;
}

- (void)updateTimerWithId:(id)a3 state:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  NAScheduler *serializer;
  id v9;
  _QWORD v10[5];
  id v11;
  unint64_t v12;
  uint8_t buf[4];
  MTSessionsCoordinator *v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  MTLogForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v14 = self;
    v15 = 2048;
    v16 = a4;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_INFO, "%{public}@ updating timer to state %lu", buf, 0x16u);
  }

  serializer = self->_serializer;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__MTSessionsCoordinator_updateTimerWithId_state___block_invoke;
  v10[3] = &unk_1E39CBA08;
  v10[4] = self;
  v11 = v6;
  v12 = a4;
  v9 = v6;
  -[NAScheduler performBlock:](serializer, "performBlock:", v10);

}

void __49__MTSessionsCoordinator_updateTimerWithId_state___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[6];

  v2 = (_QWORD *)a1[4];
  v3 = (void *)v2[2];
  objc_msgSend(v2, "timerWithIdentifier:", a1[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timerByUpdatingWithState:", a1[6]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__MTSessionsCoordinator_updateTimerWithId_state___block_invoke_2;
  v7[3] = &unk_1E39CCA30;
  v6 = a1[6];
  v7[4] = a1[4];
  v7[5] = v6;
  objc_msgSend(v3, "updateTimer:withCompletion:source:", v5, v7);

}

void __49__MTSessionsCoordinator_updateTimerWithId_state___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __49__MTSessionsCoordinator_updateTimerWithId_state___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v6;
    v10 = 2048;
    v11 = v7;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_INFO, "%{public}@ updated timer state to %lu successfully", (uint8_t *)&v8, 0x16u);
  }

}

- (id)currentTimer
{
  void *v2;
  void *v3;

  -[MTTimerStorage timers](self->_timerStorage, "timers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTTimer currentTimerFromTimers:](MTTimer, "currentTimerFromTimers:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)timerWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[MTTimerStorage timers](self->_timerStorage, "timers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__MTSessionsCoordinator_timerWithIdentifier___block_invoke;
  v9[3] = &unk_1E39CB998;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __45__MTSessionsCoordinator_timerWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "timerIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)stopSnoozeAlarmWithId:(id)a3
{
  id v4;
  NSObject *v5;
  NAScheduler *serializer;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  MTSessionsCoordinator *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_INFO, "%{public}@ received stop snooze alarm action from server for id: %{public}@", buf, 0x16u);
  }

  serializer = self->_serializer;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__MTSessionsCoordinator_stopSnoozeAlarmWithId___block_invoke;
  v8[3] = &unk_1E39CB7B0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[NAScheduler performBlock:](serializer, "performBlock:", v8);

}

uint64_t __47__MTSessionsCoordinator_stopSnoozeAlarmWithId___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 24);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__MTSessionsCoordinator_stopSnoozeAlarmWithId___block_invoke_2;
  v5[3] = &unk_1E39CC2D8;
  v5[4] = v2;
  return objc_msgSend(v3, "dismissAlarmWithIdentifier:dismissAction:withCompletion:source:", v1, 6, v5);
}

void __47__MTSessionsCoordinator_stopSnoozeAlarmWithId___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "%{public}@ dismissing snoozed alarm completed with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)dismissAlarmWithId:(id)a3
{
  id v4;
  NSObject *v5;
  NAScheduler *serializer;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  MTSessionsCoordinator *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_INFO, "%{public}@ received dismiss alarm action from server for id: %{public}@", buf, 0x16u);
  }

  serializer = self->_serializer;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__MTSessionsCoordinator_dismissAlarmWithId___block_invoke;
  v8[3] = &unk_1E39CB7B0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[NAScheduler performBlock:](serializer, "performBlock:", v8);

}

void __44__MTSessionsCoordinator_dismissAlarmWithId___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "sleepAlarms");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__MTSessionsCoordinator_dismissAlarmWithId___block_invoke_2;
  v11[3] = &unk_1E39CB510;
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v2, "na_filter:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(v7 + 24);
  if (v5)
    v9 = 5;
  else
    v9 = 0;
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __44__MTSessionsCoordinator_dismissAlarmWithId___block_invoke_3;
  v10[3] = &unk_1E39CC2D8;
  v10[4] = v7;
  objc_msgSend(v8, "dismissAlarmWithIdentifier:dismissAction:withCompletion:source:", v6, v9, v10);

}

uint64_t __44__MTSessionsCoordinator_dismissAlarmWithId___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "alarmIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __44__MTSessionsCoordinator_dismissAlarmWithId___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "%{public}@ dismissing alarm completed with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)snoozeAlarmWithId:(id)a3
{
  id v4;
  NSObject *v5;
  NAScheduler *serializer;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  MTSessionsCoordinator *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_INFO, "%{public}@ received snooze alarm action from server for id: %{public}@", buf, 0x16u);
  }

  serializer = self->_serializer;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__MTSessionsCoordinator_snoozeAlarmWithId___block_invoke;
  v8[3] = &unk_1E39CB7B0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[NAScheduler performBlock:](serializer, "performBlock:", v8);

}

uint64_t __43__MTSessionsCoordinator_snoozeAlarmWithId___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 24);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__MTSessionsCoordinator_snoozeAlarmWithId___block_invoke_2;
  v5[3] = &unk_1E39CC2D8;
  v5[4] = v2;
  return objc_msgSend(v3, "snoozeAlarmWithIdentifier:snoozeAction:withCompletion:source:", v1, 0, v5);
}

void __43__MTSessionsCoordinator_snoozeAlarmWithId___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "%{public}@ snooze alarm completed with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)didEndAlertWithId:(id)a3 activityId:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  MTSessionsCoordinator *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MTLogForCategory(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%{public}@ didEndAlertWithId id: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  -[MTSessionsCoordinator _endAlertWithId:activityId:](self, "_endAlertWithId:activityId:", v6, v7);
}

- (void)_endAlertWithId:(id)a3 activityId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  MTAlarmStorage *alarmStorage;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  MTSessionsCoordinator *v18;
  id v19;
  uint8_t buf[4];
  MTSessionsCoordinator *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MTSessionsCoordinator sessionsManager](self, "sessionsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activityIdForAlarmId:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTSessionsCoordinator sessionsManager](self, "sessionsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activityIdForTimerId:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  MTLogForCategory(1);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138544386;
    v21 = self;
    v22 = 2114;
    v23 = v6;
    v24 = 2114;
    v25 = v7;
    v26 = 2114;
    v27 = v9;
    v28 = 2114;
    v29 = v11;
    _os_log_impl(&dword_19AC4E000, v12, OS_LOG_TYPE_INFO, "%{public}@ _endAlertWithId for alert id: %{public}@, remote activity id: %{public}@, found local alarm activity id: %{public}@, local timer activity id: %{public}@", buf, 0x34u);
  }

  if (v9)
  {
    alarmStorage = self->_alarmStorage;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __52__MTSessionsCoordinator__endAlertWithId_activityId___block_invoke;
    v15[3] = &unk_1E39CC528;
    v16 = v7;
    v17 = v9;
    v18 = self;
    v19 = v6;
    -[MTAlarmStorage alarmWithIdentifier:withCompletion:](alarmStorage, "alarmWithIdentifier:withCompletion:", v19, v15);

  }
  else if (v11)
  {
    -[MTSessionsCoordinator dismissTimerWithIdentifier:](self, "dismissTimerWithIdentifier:", v6);
  }
  else
  {
    MTLogForCategory(1);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v21 = self;
      v22 = 2114;
      v23 = v6;
      _os_log_impl(&dword_19AC4E000, v14, OS_LOG_TYPE_INFO, "%{public}@ does not have any alarm or timer sessions for alert id: %{public}@", buf, 0x16u);
    }

  }
}

void __52__MTSessionsCoordinator__endAlertWithId_activityId___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a2, "isSnoozed") & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "length")
      && (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) == 0)
    {
      MTLogForCategory(1);
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v4 = *(_QWORD *)(a1 + 48);
        v5 = *(_QWORD *)(a1 + 56);
        v7 = *(_QWORD *)(a1 + 32);
        v6 = *(_QWORD *)(a1 + 40);
        v8 = 138544130;
        v9 = v4;
        v10 = 2114;
        v11 = v5;
        v12 = 2114;
        v13 = v6;
        v14 = 2114;
        v15 = v7;
        _os_log_error_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_ERROR, "%{public}@ mismatched activity ids for alarm id: %{public}@, local: %{public}@, remote: %{public}@", (uint8_t *)&v8, 0x2Au);
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "dismissAlarmWithId:", *(_QWORD *)(a1 + 56));
    }
  }
}

- (void)resendAlarmDataEntryWithId:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  MTSessionsCoordinator *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v15 = self;
    v16 = 2114;
    v17 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ resending alarm data entry with id: %{public}@", buf, 0x16u);
  }

  -[MTAlarmStorage allAlarms](self->_alarmStorage, "allAlarms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__MTSessionsCoordinator_resendAlarmDataEntryWithId___block_invoke;
  v12[3] = &unk_1E39CB510;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v6, "na_filter:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  MTLogForCategory(4);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138543618;
      v15 = self;
      v16 = 2114;
      v17 = v7;
      _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ resending alarm to server, id: %{public}@", buf, 0x16u);
    }

    -[MTSessionsCoordinator server](self, "server");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject updateAlarmEntry:](v10, "updateAlarmEntry:", v9);
  }
  else if (v11)
  {
    *(_DWORD *)buf = 138543618;
    v15 = self;
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ could not find matching active alarm for id: %{public}@", buf, 0x16u);
  }

}

uint64_t __52__MTSessionsCoordinator_resendAlarmDataEntryWithId___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "alarmIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)sourceIdentifier
{
  return CFSTR("MTWidgetEventListener");
}

- (void)source:(id)a3 didSnoozeAlarm:(id)a4 snoozeAction:(unint64_t)a5
{
  id v6;
  NSObject *v7;
  NAScheduler *serializer;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  MTSessionsCoordinator *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  MTLogForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ did snooze alarm", buf, 0xCu);
  }

  if (+[MTUtilities mtSBUIIsSystemApertureEnabled](MTUtilities, "mtSBUIIsSystemApertureEnabled"))
  {
    serializer = self->_serializer;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __60__MTSessionsCoordinator_source_didSnoozeAlarm_snoozeAction___block_invoke;
    v10[3] = &unk_1E39CB7B0;
    v10[4] = self;
    v11 = v6;
    -[NAScheduler performBlock:](serializer, "performBlock:", v10);

  }
  else
  {
    MTLogForCategory(3);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ system aperture disabled, aborting", buf, 0xCu);
    }

  }
}

void __60__MTSessionsCoordinator_source_didSnoozeAlarm_snoozeAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "sessionsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "alarmIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__MTSessionsCoordinator_source_didSnoozeAlarm_snoozeAction___block_invoke_2;
  v5[3] = &unk_1E39CBE30;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v2, "finishSessionWithAlarmId:completion:", v3, v5);

}

void __60__MTSessionsCoordinator_source_didSnoozeAlarm_snoozeAction___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (v3)
  {
    MTLogForCategory(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __60__MTSessionsCoordinator_source_didSnoozeAlarm_snoozeAction___block_invoke_2_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "sessionsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createSessionWithAlarm:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "server");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startAlarmSnoozeSessionWithAlarm:", *(_QWORD *)(a1 + 40));

}

- (void)source:(id)a3 didDismissAlarm:(id)a4 dismissAction:(unint64_t)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  MTSessionsCoordinator *v17;
  id v18;
  uint8_t buf[4];
  MTSessionsCoordinator *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  MTLogForCategory(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    v20 = self;
    v21 = 2114;
    v22 = v7;
    v23 = 2048;
    v24 = a5;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "%{public}@ didDismissAlarm: %{public}@ with action: %lu", buf, 0x20u);
  }

  -[MTSessionsCoordinator sessionsManager](self, "sessionsManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __62__MTSessionsCoordinator_source_didDismissAlarm_dismissAction___block_invoke;
  v16 = &unk_1E39CBE30;
  v17 = self;
  v10 = v7;
  v18 = v10;
  objc_msgSend(v9, "finishSessionWithAlarm:completion:", v10, &v13);

  if (a5 == 6)
  {
    -[MTSessionsCoordinator server](self, "server", v13, v14, v15, v16, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "alarmIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stopAlarmSnoozeSessionWithId:", v12);

  }
}

void __62__MTSessionsCoordinator_source_didDismissAlarm_dismissAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "alarmIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543874;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    v11 = 2114;
    v12 = v3;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "%{public}@ didDismissAlarm finished alarm session for id: %{public}@  with error: %{public}@", (uint8_t *)&v7, 0x20u);

  }
}

- (void)source:(id)a3 didFireAlarm:(id)a4 triggerType:(unint64_t)a5
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NAScheduler *serializer;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  MTSessionsCoordinator *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  MTLogForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = self;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ did fire alarm", buf, 0xCu);
  }

  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57__MTSessionsCoordinator_source_didFireAlarm_triggerType___block_invoke;
  v17[3] = &unk_1E39CB7B0;
  v17[4] = self;
  v9 = v6;
  v18 = v9;
  v10 = (void *)MEMORY[0x19AED0080](v17);
  serializer = self->_serializer;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __57__MTSessionsCoordinator_source_didFireAlarm_triggerType___block_invoke_125;
  v14[3] = &unk_1E39CB8D0;
  v14[4] = self;
  v15 = v9;
  v16 = v10;
  v12 = v10;
  v13 = v9;
  -[NAScheduler performBlock:](serializer, "performBlock:", v14);

}

void __57__MTSessionsCoordinator_source_didFireAlarm_triggerType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "sessionsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__MTSessionsCoordinator_source_didFireAlarm_triggerType___block_invoke_2;
  v4[3] = &unk_1E39CC918;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "createSessionWithAlarm:forAlert:completion:", v5, 1, v4);

}

void __57__MTSessionsCoordinator_source_didFireAlarm_triggerType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    MTLogForCategory(1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __57__MTSessionsCoordinator_source_didFireAlarm_triggerType___block_invoke_2_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "server");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject alertAlarm:activityId:](v7, "alertAlarm:activityId:", *(_QWORD *)(a1 + 40), v5);
  }

}

void __57__MTSessionsCoordinator_source_didFireAlarm_triggerType___block_invoke_125(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "sessionsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "alarmIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activityIdForAlarmId:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    MTLogForCategory(1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = a1[4];
      objc_msgSend(a1[5], "alarmIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v6;
      v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_INFO, "%{public}@ didFireAlarm session already exists for alarm id: %{public}@, ending it first", buf, 0x16u);

    }
    objc_msgSend(a1[4], "sessionsManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__MTSessionsCoordinator_source_didFireAlarm_triggerType___block_invoke_126;
    v10[3] = &unk_1E39CC348;
    v9 = a1[5];
    v10[4] = a1[4];
    v11 = v9;
    v12 = a1[6];
    objc_msgSend(v8, "finishSessionWithAlarm:completion:", v11, v10);

  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }
}

void __57__MTSessionsCoordinator_source_didFireAlarm_triggerType___block_invoke_126(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;

  v3 = a2;
  MTLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (v3)
  {
    if (v5)
      __57__MTSessionsCoordinator_source_didFireAlarm_triggerType___block_invoke_126_cold_2();

  }
  else
  {
    if (v5)
      __57__MTSessionsCoordinator_source_didFireAlarm_triggerType___block_invoke_126_cold_1(a1, v4);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)source:(id)a3 didRemoveAlarms:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  MTSessionsCoordinator *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "na_map:", &__block_literal_global_128);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MTLogForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_INFO, "%{public}@ didRemoveAlarms, ending current sessions and sending request to server for alarms: %{public}@", buf, 0x16u);
  }

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__MTSessionsCoordinator_source_didRemoveAlarms___block_invoke_129;
  v9[3] = &unk_1E39CC500;
  v9[4] = self;
  objc_msgSend(v5, "na_each:", v9);

  -[MTSessionsCoordinator server](self, "server");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAlarms:", v6);

}

uint64_t __48__MTSessionsCoordinator_source_didRemoveAlarms___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "alarmIDString");
}

void __48__MTSessionsCoordinator_source_didRemoveAlarms___block_invoke_129(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__MTSessionsCoordinator_source_didRemoveAlarms___block_invoke_2;
  v7[3] = &unk_1E39CB7B0;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "performBlock:", v7);

}

void __48__MTSessionsCoordinator_source_didRemoveAlarms___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "sessionsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__MTSessionsCoordinator_source_didRemoveAlarms___block_invoke_3;
  v4[3] = &unk_1E39CBE30;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "finishSessionWithAlarm:completion:", v5, v4);

}

void __48__MTSessionsCoordinator_source_didRemoveAlarms___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "alarmIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543874;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    v11 = 2114;
    v12 = v3;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "%{public}@ didRemoveAlarms finished alarm session for id: %{public}@  with error: %{public}@", (uint8_t *)&v7, 0x20u);

  }
}

- (void)source:(id)a3 didUpdateAlarms:(id)a4 previousAlarms:(id)a5
{
  id v7;
  id v8;
  NAScheduler *serializer;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  serializer = self->_serializer;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__MTSessionsCoordinator_source_didUpdateAlarms_previousAlarms___block_invoke;
  v12[3] = &unk_1E39CB828;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  -[NAScheduler performBlock:](serializer, "performBlock:", v12);

}

void __63__MTSessionsCoordinator_source_didUpdateAlarms_previousAlarms___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "sessionsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAlarmSessions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = MEMORY[0x1E0C809B0];
  v5 = *(void **)(a1 + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__MTSessionsCoordinator_source_didUpdateAlarms_previousAlarms___block_invoke_2;
  v13[3] = &unk_1E39CB510;
  v14 = v3;
  v9 = v3;
  objc_msgSend(v5, "na_filter:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __63__MTSessionsCoordinator_source_didUpdateAlarms_previousAlarms___block_invoke_3;
  v10[3] = &unk_1E39CCA78;
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 32);
  v11 = v7;
  v12 = v8;
  objc_msgSend(v6, "na_each:", v10);

}

uint64_t __63__MTSessionsCoordinator_source_didUpdateAlarms_previousAlarms___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "alarmIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

void __63__MTSessionsCoordinator_source_didUpdateAlarms_previousAlarms___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__MTSessionsCoordinator_source_didUpdateAlarms_previousAlarms___block_invoke_4;
  v10[3] = &unk_1E39CB510;
  v9 = v3;
  v11 = v9;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTChangeSet changeSetWithChangesFromObject:toObject:](MTChangeSet, "changeSetWithChangesFromObject:toObject:", v9, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTAlarm propertiesAffectingSessions](MTAlarm, "propertiesAffectingSessions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "hasChangesInProperties:", v7);

  if (v8)
    objc_msgSend(*(id *)(a1 + 40), "processAlarmUpdate:fromAlarm:", v9, v5);

}

uint64_t __63__MTSessionsCoordinator_source_didUpdateAlarms_previousAlarms___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "alarmIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alarmIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqualToString:", v5);
  return v6;
}

- (void)processAlarmUpdate:(id)a3 fromAlarm:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NAScheduler *serializer;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  MTSessionsCoordinator *v15;
  uint8_t buf[4];
  MTSessionsCoordinator *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MTLogForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v17 = self;
    v18 = 2114;
    v19 = v6;
    v20 = 2114;
    v21 = v7;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ processAlarmUpdate alarm:%{public}@ fromAlarm:%{public}@", buf, 0x20u);
  }

  serializer = self->_serializer;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__MTSessionsCoordinator_processAlarmUpdate_fromAlarm___block_invoke;
  v12[3] = &unk_1E39CB828;
  v13 = v6;
  v14 = v7;
  v15 = self;
  v10 = v7;
  v11 = v6;
  -[NAScheduler performBlock:](serializer, "performBlock:", v12);

}

void __54__MTSessionsCoordinator_processAlarmUpdate_fromAlarm___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  int v5;
  id v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (((objc_msgSend(a1[4], "repeats") & 1) != 0 || objc_msgSend(a1[5], "isSnoozed"))
    && (objc_msgSend(a1[4], "isEnabled") & 1) == 0
    && !objc_msgSend(a1[4], "isFiring")
    || objc_msgSend(a1[5], "isSnoozed")
    && (objc_msgSend(a1[4], "isSnoozed") & 1) == 0
    && !objc_msgSend(a1[4], "isFiring")
    || objc_msgSend(a1[5], "isFiring")
    && objc_msgSend(a1[4], "isSnoozed")
    && objc_msgSend(a1[4], "isEnabled"))
  {
    objc_msgSend(a1[6], "removeSessionForAlarm:removeFromServer:", a1[4], 1);
  }
  else
  {
    MTLogForCategory(4);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = a1[6];
      v4 = a1[4];
      v5 = 138543618;
      v6 = v3;
      v7 = 2114;
      v8 = v4;
      _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ not removing session for alarm: %{public}@", (uint8_t *)&v5, 0x16u);
    }

  }
}

- (void)removeSessionForAlarm:(id)a3
{
  -[MTSessionsCoordinator removeSessionForAlarm:removeFromServer:](self, "removeSessionForAlarm:removeFromServer:", a3, 0);
}

- (void)removeSessionForAlarm:(id)a3 removeFromServer:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NAScheduler *serializer;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  MTSessionsCoordinator *v16;
  id v17;
  _QWORD v18[2];

  v4 = a4;
  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  serializer = self->_serializer;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __64__MTSessionsCoordinator_removeSessionForAlarm_removeFromServer___block_invoke;
  v15 = &unk_1E39CB7B0;
  v16 = self;
  v8 = v6;
  v17 = v8;
  -[NAScheduler performBlock:](serializer, "performBlock:", &v12);
  if (v4)
  {
    -[MTSessionsCoordinator server](self, "server", v12, v13, v14, v15, v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "alarmIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAlarms:", v11);

  }
}

void __64__MTSessionsCoordinator_removeSessionForAlarm_removeFromServer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "sessionsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__MTSessionsCoordinator_removeSessionForAlarm_removeFromServer___block_invoke_2;
  v4[3] = &unk_1E39CBE30;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "finishSessionWithAlarm:completion:", v5, v4);

}

void __64__MTSessionsCoordinator_removeSessionForAlarm_removeFromServer___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "alarmIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543874;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    v11 = 2114;
    v12 = v3;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "%{public}@ removeSessionForAlarm finished alarm session for id: %{public}@  with error: %{public}@", (uint8_t *)&v7, 0x20u);

  }
}

- (void)didRestoreAlarmSessions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  uint8_t buf[4];
  MTSessionsCoordinator *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v18 = self;
    v19 = 2114;
    v20 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_INFO, "%{public}@ didRestoreAlarmSessions with ids: %{public}@", buf, 0x16u);
  }

  if (objc_msgSend(v4, "count"))
  {
    -[MTAlarmStorage allAlarms](self->_alarmStorage, "allAlarms");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __49__MTSessionsCoordinator_didRestoreAlarmSessions___block_invoke;
    v16[3] = &unk_1E39CB510;
    v16[4] = self;
    objc_msgSend(v6, "na_filter:", v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "na_map:", &__block_literal_global_131);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __49__MTSessionsCoordinator_didRestoreAlarmSessions___block_invoke_3;
    v14[3] = &unk_1E39CB6D0;
    v15 = v9;
    v10 = v9;
    objc_msgSend(v4, "na_filter:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    MTLogForCategory(1);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v18 = self;
      v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_19AC4E000, v12, OS_LOG_TYPE_INFO, "%{public}@ removing inactive alarm sessions: %{public}@", buf, 0x16u);
    }

    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __49__MTSessionsCoordinator_didRestoreAlarmSessions___block_invoke_133;
    v13[3] = &unk_1E39CCAE0;
    v13[4] = self;
    objc_msgSend(v11, "na_each:", v13);

  }
}

uint64_t __49__MTSessionsCoordinator_didRestoreAlarmSessions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(v3, "isSnoozed"))
  {
    objc_msgSend(v3, "snoozeFireDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 16))();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "mtIsAfterDate:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __49__MTSessionsCoordinator_didRestoreAlarmSessions___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "alarmIDString");
}

uint64_t __49__MTSessionsCoordinator_didRestoreAlarmSessions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

void __49__MTSessionsCoordinator_didRestoreAlarmSessions___block_invoke_133(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "sessionsManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishSessionWithAlarmId:completion:", v3, &__block_literal_global_135);

}

- (void)didRestoreTimerSessions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  MTSessionsCoordinator *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v9 = self;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_INFO, "%{public}@ didRestoreTimerSessions with ids: %{public}@", buf, 0x16u);
  }

  if (objc_msgSend(v4, "count"))
  {
    -[MTTimerStorage timers](self->_timerStorage, "timers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__MTSessionsCoordinator_didRestoreTimerSessions___block_invoke;
    v7[3] = &unk_1E39CC8F0;
    v7[4] = self;
    objc_msgSend(v6, "na_each:", v7);

  }
}

void __49__MTSessionsCoordinator_didRestoreTimerSessions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (+[MTTimer isActiveTimer:](MTTimer, "isActiveTimer:", v3))
  {
    MTLogForCategory(4);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "timerID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v5;
      v14 = 2114;
      v15 = v6;
      _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ resending timer to server upon restore, id: %{public}@", (uint8_t *)&v12, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "processTimerStateUpdate:fromTimer:", v3, 0);
  }
  else
  {
    MTLogForCategory(1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "timerIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_INFO, "%{public}@ removing inactive timer sessions: %{public}@", (uint8_t *)&v12, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "sessionsManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timerIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "finishSessionWithTimerId:completion:", v11, &__block_literal_global_138);

  }
}

- (MTTimerStorage)timerStorage
{
  return self->_timerStorage;
}

- (MTAlarmStorage)alarmStorage
{
  return self->_alarmStorage;
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (void)setSessionsManager:(id)a3
{
  objc_storeStrong((id *)&self->_sessionsManager, a3);
}

- (BSServiceConnectionClient)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionQueue, a3);
}

- (OS_dispatch_queue)serializerQueue
{
  return self->_serializerQueue;
}

- (void)setSerializerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serializerQueue, a3);
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (void)setCurrentDateProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)systemReady
{
  return self->_systemReady;
}

- (void)setSystemReady:(BOOL)a3
{
  self->_systemReady = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_storeStrong((id *)&self->_serializerQueue, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_sessionsManager, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_alarmStorage, 0);
  objc_storeStrong((id *)&self->_timerStorage, 0);
}

void __45__MTSessionsCoordinator_source_didFireTimer___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_19AC4E000, v0, v1, "%{public}@ couldn't create new session for alert due to error: %{public}@");
  OUTLINED_FUNCTION_2();
}

void __64__MTSessionsCoordinator_processTimerUpdate_fromTimer_changeSet___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_19AC4E000, v0, v1, "%{public}@ couldn't finish previous timer session: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)processTimerStateUpdate:fromTimer:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_19AC4E000, v0, v1, "%{public}@ cannot process timer state change: %{public}@");
  OUTLINED_FUNCTION_2();
}

void __59__MTSessionsCoordinator_processTimerStateUpdate_fromTimer___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_19AC4E000, v0, v1, "%{public}@ Error ending previous timer session: %{public}@ ");
  OUTLINED_FUNCTION_2();
}

- (void)server
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v4;
  OUTLINED_FUNCTION_2_1(&dword_19AC4E000, a2, v5, "%{public}@ server not created for connection: %{public}@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_7();
}

void __51__MTSessionsCoordinator_repeatTimerWithIdentifier___block_invoke_116_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_19AC4E000, v0, v1, "%{public}@ failing timer id %{public}@ repeat at group notify with error: %{public}@");
  OUTLINED_FUNCTION_8_0();
}

void __51__MTSessionsCoordinator_repeatTimerWithIdentifier___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_19AC4E000, v0, v1, "%{public}@ error trying to repeat timer: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)dismissTimerWithIdentifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_19AC4E000, v0, v1, "%{public}@ hit a race, not dismissing non firing timer: %{public}@");
  OUTLINED_FUNCTION_2();
}

void __52__MTSessionsCoordinator_dismissTimerWithIdentifier___block_invoke_117_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_19AC4E000, v0, v1, "%{public}@ error dismissing timer with identifier: %{public}@, error:%{public}@");
  OUTLINED_FUNCTION_8_0();
}

void __68__MTSessionsCoordinator_dismissTimerAndEndSessionWithId_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_19AC4E000, v0, v1, "%{public}@ error finishing session for timer id: %{public}@, error: %{public}@");
  OUTLINED_FUNCTION_8_0();
}

void __68__MTSessionsCoordinator_dismissTimerAndEndSessionWithId_completion___block_invoke_118_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_19AC4E000, v0, v1, "%{public}@ error dismissing timer with id: %{public}@, error: %{public}@");
  OUTLINED_FUNCTION_8_0();
}

void __49__MTSessionsCoordinator_updateTimerWithId_state___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_19AC4E000, v0, v1, "%{public}@ error pausing timer from widget listerener: %{public}@");
  OUTLINED_FUNCTION_2();
}

void __60__MTSessionsCoordinator_source_didSnoozeAlarm_snoozeAction___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_19AC4E000, v0, v1, "%{public}@ error finishing alarm session: %{public}@");
  OUTLINED_FUNCTION_2();
}

void __57__MTSessionsCoordinator_source_didFireAlarm_triggerType___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_19AC4E000, v0, v1, "%{public}@ error creating alarm sesssion: %{public}@");
  OUTLINED_FUNCTION_2();
}

void __57__MTSessionsCoordinator_source_didFireAlarm_triggerType___block_invoke_126_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "alarmIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v3;
  v8 = 2114;
  v9 = v4;
  OUTLINED_FUNCTION_2_1(&dword_19AC4E000, a2, v5, "%{public}@ didFireAlarm finished previous session for id: %{public}@  without error, creating new session", (uint8_t *)&v6);

  OUTLINED_FUNCTION_7();
}

void __57__MTSessionsCoordinator_source_didFireAlarm_triggerType___block_invoke_126_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_19AC4E000, v0, v1, "%{public}@ didFireAlarm error finishing session: %{public}@");
  OUTLINED_FUNCTION_2();
}

@end

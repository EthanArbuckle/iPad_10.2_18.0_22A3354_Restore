@implementation MTTimerStorage

- (void)getTimersWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint8_t buf[4];
  MTTimerStorage *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ received request for timers", buf, 0xCu);
  }

  if (v4)
  {
    -[MTTimerStorage nextTimer](self, "nextTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTTimerStorage serializer](self, "serializer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__MTTimerStorage_getTimersWithCompletion___block_invoke;
    v9[3] = &unk_1E39CB8D0;
    v9[4] = self;
    v10 = v6;
    v11 = v4;
    v8 = v6;
    objc_msgSend(v7, "performBlock:", v9);

  }
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (MTTimer)nextTimer
{
  void *v2;
  void *v3;

  -[MTTimerStorage scheduler](self, "scheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MTTimer *)v3;
}

- (MTTimerScheduler)scheduler
{
  return (MTTimerScheduler *)objc_loadWeakRetained((id *)&self->_scheduler);
}

- (void)getDurationsWithCompletion:(id)a3
{
  void (**v4)(id, void *, void *, void *, void *, _QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  MTTimerStorage *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, void *, void *, void *, _QWORD))a3;
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543362;
    v15 = self;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ returning timer duration query", (uint8_t *)&v14, 0xCu);
  }

  -[MTTimerStorage durationManager](self, "durationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recentDurations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTTimerStorage durationManager](self, "durationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "favoriteDurations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTTimerStorage durationManager](self, "durationManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultDurations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTTimerStorage durationManager](self, "durationManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "latestDuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v7, v9, v11, v13, 0);

}

- (MTTimerDurationManager)durationManager
{
  return self->_durationManager;
}

void __42__MTTimerStorage_getTimersWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__MTTimerStorage_getTimersWithCompletion___block_invoke_2;
  v3[3] = &unk_1E39CB8D0;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "_createDefaultTimerIfNeededWithCompletion:", v3);

}

- (void)_createDefaultTimerIfNeededWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  id v6;
  _QWORD v7[4];
  void (**v8)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  +[MTTimer currentTimerFromTimers:](MTTimer, "currentTimerFromTimers:", self->_orderedTimers);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (v4)
      v4[2](v4);
  }
  else
  {
    v6 = -[MTTimerStorage newCurrentTimer](self, "newCurrentTimer");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__MTTimerStorage__createDefaultTimerIfNeededWithCompletion___block_invoke;
    v7[3] = &unk_1E39CB4E8;
    v8 = v4;
    -[MTTimerStorage _queue_addTimer:withCompletion:source:](self, "_queue_addTimer:withCompletion:source:", v6, v7, 0);

  }
}

uint64_t __42__MTTimerStorage_getTimersWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);

  MTLogForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __42__MTTimerStorage_getTimersWithCompletion___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(v6 + 24), "valueForKey:", CFSTR("timerID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "timerID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ returning timers: %{public}@, next timer: %{public}@", (uint8_t *)&v10, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __42__MTTimerStorage_getTimersWithCompletion___block_invoke_2_cold_1()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t v4[14];
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v5 = v0;
  v6 = v1;
  v7 = v2;
  _os_log_debug_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ returning timers: %{public}@, next timer: %{public}@", v4, 0x20u);
}

- (MTTimerStorage)init
{
  void *v3;
  MTTimerStorage *v4;

  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MTTimerStorage initWithPersistence:](self, "initWithPersistence:", v3);

  return v4;
}

- (MTTimerStorage)initWithPersistence:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MTTimerStorage *v9;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", CFSTR("com.apple.MTTimerStorage.access-queue"), +[MTScheduler defaultPriority](MTScheduler, "defaultPriority"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mtMainThreadScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MTCurrentDateProvider();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MTTimerStorage initWithPersistence:migrator:serializer:callbackScheduler:currentDateProvider:](self, "initWithPersistence:migrator:serializer:callbackScheduler:currentDateProvider:", v4, v5, v6, v7, v8);

  return v9;
}

- (MTTimerStorage)initWithPersistence:(id)a3 migrator:(id)a4 serializer:(id)a5 callbackScheduler:(id)a6 currentDateProvider:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  MTTimerStorage *v18;
  NSObject *v19;
  MTObserverStore *v20;
  MTObserverStore *observers;
  uint64_t v22;
  id currentDateProvider;
  MTMetrics *v24;
  MTMetrics *metrics;
  MTTimerDurationManager *v26;
  MTTimerDurationManager *durationManager;
  objc_super v29;
  uint8_t buf[4];
  MTTimerStorage *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v29.receiver = self;
  v29.super_class = (Class)MTTimerStorage;
  v18 = -[MTTimerStorage init](&v29, sel_init);
  if (v18)
  {
    MTLogForCategory(4);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v31 = v18;
      _os_log_impl(&dword_19AC4E000, v19, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
    }

    objc_storeStrong((id *)&v18->_migrator, a4);
    objc_storeStrong((id *)&v18->_serializer, a5);
    v20 = -[MTObserverStore initWithCallbackScheduler:]([MTObserverStore alloc], "initWithCallbackScheduler:", v16);
    observers = v18->_observers;
    v18->_observers = v20;

    v22 = objc_msgSend(v17, "copy");
    currentDateProvider = v18->_currentDateProvider;
    v18->_currentDateProvider = (id)v22;

    objc_storeStrong((id *)&v18->_persistence, a3);
    v24 = objc_alloc_init(MTMetrics);
    metrics = v18->_metrics;
    v18->_metrics = v24;

    v26 = -[MTTimerDurationManager initWithPersistence:storage:]([MTTimerDurationManager alloc], "initWithPersistence:storage:", v18->_persistence, v18);
    durationManager = v18->_durationManager;
    v18->_durationManager = v26;

  }
  return v18;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[MTApplicationWorkspaceObserver sharedWorkspaceObserver](MTApplicationWorkspaceObserver, "sharedWorkspaceObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MTTimerStorage;
  -[MTTimerStorage dealloc](&v4, sel_dealloc);
}

- (void)setupListeners
{
  id v3;

  +[MTApplicationWorkspaceObserver sharedWorkspaceObserver](MTApplicationWorkspaceObserver, "sharedWorkspaceObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forBundleIdentifier:", self, CFSTR("com.apple.mobiletimer"));

}

- (void)loadTimers
{
  -[MTTimerStorage _loadTimersWithCompletion:](self, "_loadTimersWithCompletion:", 0);
}

- (void)loadTimersSync
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  _QWORD v5[4];
  dispatch_semaphore_t v6;

  v3 = dispatch_semaphore_create(0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__MTTimerStorage_loadTimersSync__block_invoke;
  v5[3] = &unk_1E39CB858;
  v6 = v3;
  v4 = v3;
  -[MTTimerStorage _loadTimersWithCompletion:](self, "_loadTimersWithCompletion:", v5);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

}

intptr_t __32__MTTimerStorage_loadTimersSync__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_loadTimersWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MTTimerStorage serializer](self, "serializer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__MTTimerStorage__loadTimersWithCompletion___block_invoke;
  v7[3] = &unk_1E39CB880;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

uint64_t __44__MTTimerStorage__loadTimersWithCompletion___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  MTStorageReader *v17;
  NSObject *v18;
  _BOOL4 v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  NSObject *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  _BOOL4 v39;
  NSObject *v40;
  NSObject *v41;
  id v42;
  MTStorageReader *v43;
  void *v44;
  uint64_t result;
  id v46;
  MTStorageReader *v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  MTStorageReader *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "persistence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_49;
  MTLogForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *v2;
    *(_DWORD *)buf = 138543362;
    v49 = v5;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ loading timers", buf, 0xCu);
  }

  objc_msgSend(*v2, "persistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("MTTimers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*v2, "persistence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatForKey:", CFSTR("MTTimerStorageVersion"));
  v10 = v9;

  objc_msgSend(*v2, "persistence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("MTTimerModifiedDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_opt_new();
  v14 = (void *)*((_QWORD *)*v2 + 3);
  *((_QWORD *)*v2 + 3) = v13;

  if (v10 >= 1.0)
  {
    if (v7)
    {
      if (v10 >= 2.0)
      {
        objc_opt_class();
        v31 = v7;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v32 = v31;
        else
          v32 = 0;
        v26 = v32;

        v17 = -[MTStorageReader initWithEncodedDictionary:]([MTStorageReader alloc], "initWithEncodedDictionary:", v26);
      }
      else
      {
        MTLogForCategory(4);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = *v2;
          *(_DWORD *)buf = 138543362;
          v49 = v23;
          _os_log_impl(&dword_19AC4E000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ binary data storage version detected.  Using old reader.", buf, 0xCu);
        }

        objc_opt_class();
        v24 = v7;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v25 = v24;
        else
          v25 = 0;
        v26 = v25;

        v46 = 0;
        v17 = (MTStorageReader *)-[MTStorageReaderV1 initForReadingFromData:error:]([MTStorageReaderV1 alloc], "initForReadingFromData:error:", v26, &v46);
        v27 = v46;
        if (v27)
        {
          MTLogForCategory(4);
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            __44__MTTimerStorage__loadTimersWithCompletion___block_invoke_cold_2();

        }
      }

      -[MTStorageReader decodeObjectForKey:](v17, "decodeObjectForKey:", CFSTR("MTTimers"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 < 3.0)
      {
        MTLogForCategory(4);
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = *v2;
          *(_DWORD *)buf = 138543362;
          v49 = v34;
          _os_log_impl(&dword_19AC4E000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ migrating latest timer duration", buf, 0xCu);
        }

        +[MTTimer currentTimerFromTimers:](MTTimer, "currentTimerFromTimers:", v21);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*v2, "durationManager");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        +[MTTimerDurationManager durationFromTimer:](MTTimerDurationManager, "durationFromTimer:", v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "saveLatestDuration:", v37);

      }
      goto LABEL_37;
    }
    MTLogForCategory(4);
    v17 = (MTStorageReader *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v17->super.super, OS_LOG_TYPE_DEFAULT))
    {
      v30 = *v2;
      *(_DWORD *)buf = 138543362;
      v49 = v30;
      _os_log_impl(&dword_19AC4E000, &v17->super.super, OS_LOG_TYPE_DEFAULT, "%{public}@ has no timers", buf, 0xCu);
    }
  }
  else
  {
    MTLogForCategory(4);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *v2;
      *(_DWORD *)buf = 138543362;
      v49 = v16;
      _os_log_impl(&dword_19AC4E000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ migration needed", buf, 0xCu);
    }

    objc_msgSend(*((id *)*v2 + 6), "migrateFromOldStorage");
    objc_msgSend(*((id *)*v2 + 6), "timer");
    v17 = (MTStorageReader *)objc_claimAutoreleasedReturnValue();
    MTLogForCategory(4);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        v20 = *v2;
        *(_DWORD *)buf = 138543618;
        v49 = v20;
        v50 = 2114;
        v51 = v17;
        _os_log_impl(&dword_19AC4E000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ migrated timer is %{public}@", buf, 0x16u);
      }

      v47 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    }
    if (v19)
    {
      v29 = *v2;
      *(_DWORD *)buf = 138543362;
      v49 = v29;
      _os_log_impl(&dword_19AC4E000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ no timer created during migration.", buf, 0xCu);
    }

  }
  v21 = (void *)MEMORY[0x1E0C9AA60];
LABEL_37:

  objc_msgSend(*v2, "_queue_setAllTimers:source:persist:notify:", v21, 0, v10 < 1.0, 0);
  objc_msgSend(*v2, "_queue_removeStaleTimers:", 0);
  if (v10 < 1.0)
    objc_msgSend(*((id *)*v2 + 6), "removeFromOldStorage");
  MTLogForCategory(4);
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG);

  MTLogForCategory(4);
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (v39)
  {
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      __44__MTTimerStorage__loadTimersWithCompletion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    v42 = *v2;
    objc_msgSend(*((id *)*v2 + 3), "valueForKey:", CFSTR("timerID"));
    v43 = (MTStorageReader *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v49 = v42;
    v50 = 2114;
    v51 = v43;
    _os_log_impl(&dword_19AC4E000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@ loaded %{public}@", buf, 0x16u);

  }
  v44 = v12;
  if (!v12)
  {
    (*(void (**)(void))(*((_QWORD *)*v2 + 5) + 16))();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)*v2 + 4, v44);
  if (!v12)

LABEL_49:
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __60__MTTimerStorage__createDefaultTimerIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)newCurrentTimer
{
  MTMutableTimer *v3;
  MTMutableTimer *v4;

  v3 = [MTMutableTimer alloc];
  +[MTTimerManager defaultDuration](MTTimerManager, "defaultDuration");
  v4 = -[MTTimer initWithState:duration:currentDateProvider:](v3, "initWithState:duration:currentDateProvider:", 1, self->_currentDateProvider);
  -[MTTimer setTitle:](v4, "setTitle:", CFSTR("CURRENT_TIMER"));
  return v4;
}

- (void)setScheduler:(id)a3
{
  MTTimerScheduler **p_scheduler;
  id WeakRetained;
  id obj;

  p_scheduler = &self->_scheduler;
  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_scheduler);
  objc_msgSend(WeakRetained, "setDelegate:", 0);

  objc_storeWeak((id *)p_scheduler, obj);
  objc_msgSend(obj, "setDelegate:", self);

}

- (NSArray)timers
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v8[5];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  -[MTTimerStorage serializer](self, "serializer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __24__MTTimerStorage_timers__block_invoke;
  v8[3] = &unk_1E39CB8A8;
  v10 = &v11;
  v8[4] = self;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "performBlock:", v8);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (NSArray *)v6;
}

intptr_t __24__MTTimerStorage_timers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (NSDate)lastModifiedDate
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v8[5];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  -[MTTimerStorage serializer](self, "serializer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__MTTimerStorage_lastModifiedDate__block_invoke;
  v8[3] = &unk_1E39CB8A8;
  v10 = &v11;
  v8[4] = self;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "performBlock:", v8);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (NSDate *)v6;
}

intptr_t __34__MTTimerStorage_lastModifiedDate__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)registerObserver:(id)a3
{
  -[MTObserverStore addObserver:](self->_observers, "addObserver:", a3);
}

- (void)setAllTimers:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  MTTimerStorage *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MTLogForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  MTLogForCategory(4);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[MTTimerStorage setAllTimers:source:].cold.1();
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = self;
    _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ setting all timers", buf, 0xCu);
  }

  -[MTTimerStorage serializer](self, "serializer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __38__MTTimerStorage_setAllTimers_source___block_invoke;
  v15[3] = &unk_1E39CB828;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v13 = v7;
  v14 = v6;
  objc_msgSend(v12, "performBlock:", v15);

}

uint64_t __38__MTTimerStorage_setAllTimers_source___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setAllTimers:source:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_queue_setAllTimers:(id)a3 source:(id)a4
{
  -[MTTimerStorage _queue_setAllTimers:source:persist:notify:](self, "_queue_setAllTimers:source:persist:notify:", a3, a4, 1, 1);
}

- (void)_queue_setAllTimers:(id)a3 source:(id)a4 persist:(BOOL)a5 notify:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a6;
  v7 = a5;
  v14 = a4;
  v10 = a3;
  -[MTTimerStorage orderedTimers](self, "orderedTimers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeAllObjects](self->_orderedTimers, "removeAllObjects");
  -[NSMutableArray addObjectsFromArray:](self->_orderedTimers, "addObjectsFromArray:", v10);

  if (v7)
    -[MTTimerStorage _queue_persistTimers](self, "_queue_persistTimers");
  -[MTTimerStorage _queue_sortTimers](self, "_queue_sortTimers");
  if (v6)
  {
    -[MTTimerStorage _queue_notifyObserversForTimerRemoval:source:](self, "_queue_notifyObserversForTimerRemoval:source:", v12, v14);
    -[MTTimerStorage _queue_notifyObserversForTimerAdd:source:](self, "_queue_notifyObserversForTimerAdd:source:", v13, v14);
  }

}

- (void)addTimer:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  MTTimerStorage *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  MTLogForCategory(4);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "timerID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = self;
    v24 = 2114;
    v25 = v12;
    _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ adding timer %{public}@", buf, 0x16u);

  }
  MTLogForCategory(9);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19AC4E000, v13, OS_LOG_TYPE_INFO, "MTTimerStorage - Adding Timer", buf, 2u);
  }

  -[MTTimerStorage serializer](self, "serializer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __49__MTTimerStorage_addTimer_withCompletion_source___block_invoke;
  v18[3] = &unk_1E39CB8F8;
  v18[4] = self;
  v19 = v8;
  v20 = v10;
  v21 = v9;
  v15 = v10;
  v16 = v9;
  v17 = v8;
  objc_msgSend(v14, "performBlock:", v18);

}

uint64_t __49__MTTimerStorage_addTimer_withCompletion_source___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addTimer:withCompletion:source:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)updateTimer:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  MTTimerStorage *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  MTLogForCategory(4);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "timerID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = self;
    v24 = 2114;
    v25 = v12;
    _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ updating timer %{public}@", buf, 0x16u);

  }
  MTLogForCategory(9);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19AC4E000, v13, OS_LOG_TYPE_INFO, "MTTimerStorage - Updating Timer", buf, 2u);
  }

  -[MTTimerStorage serializer](self, "serializer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __52__MTTimerStorage_updateTimer_withCompletion_source___block_invoke;
  v18[3] = &unk_1E39CB8F8;
  v18[4] = self;
  v19 = v8;
  v20 = v10;
  v21 = v9;
  v15 = v10;
  v16 = v9;
  v17 = v8;
  objc_msgSend(v14, "performBlock:", v18);

}

id __52__MTTimerStorage_updateTimer_withCompletion_source___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_queue_updateTimer:withCompletion:source:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)removeTimer:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  MTTimerStorage *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  MTLogForCategory(4);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "timerID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = self;
    v24 = 2114;
    v25 = v12;
    _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ removing timer %{public}@", buf, 0x16u);

  }
  MTLogForCategory(9);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19AC4E000, v13, OS_LOG_TYPE_INFO, "MTTimerStorage - Removing Timer", buf, 2u);
  }

  -[MTTimerStorage serializer](self, "serializer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __52__MTTimerStorage_removeTimer_withCompletion_source___block_invoke;
  v18[3] = &unk_1E39CB8F8;
  v18[4] = self;
  v19 = v8;
  v20 = v10;
  v21 = v9;
  v15 = v10;
  v16 = v9;
  v17 = v8;
  objc_msgSend(v14, "performBlock:", v18);

}

uint64_t __52__MTTimerStorage_removeTimer_withCompletion_source___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeTimer:withCompletion:source:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)dismissTimerWithIdentifier:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  MTTimerStorage *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  MTLogForCategory(4);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v22 = self;
    v23 = 2114;
    v24 = v8;
    _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing timer with ID %{public}@", buf, 0x16u);
  }

  MTLogForCategory(9);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19AC4E000, v12, OS_LOG_TYPE_INFO, "MTTimerStorage - Dismissing Timer", buf, 2u);
  }

  -[MTTimerStorage serializer](self, "serializer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __67__MTTimerStorage_dismissTimerWithIdentifier_withCompletion_source___block_invoke;
  v17[3] = &unk_1E39CB8F8;
  v17[4] = self;
  v18 = v8;
  v19 = v10;
  v20 = v9;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  objc_msgSend(v13, "performBlock:", v17);

}

uint64_t __67__MTTimerStorage_dismissTimerWithIdentifier_withCompletion_source___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_dismissTimerWithIdentifier:withCompletion:source:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)repeatTimerWithIdentifier:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  MTTimerStorage *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  MTLogForCategory(4);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v22 = self;
    v23 = 2114;
    v24 = v8;
    _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ repeating timer with ID %{public}@", buf, 0x16u);
  }

  MTLogForCategory(9);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19AC4E000, v12, OS_LOG_TYPE_INFO, "MTTimerStorage - Repeating Timer", buf, 2u);
  }

  -[MTTimerStorage serializer](self, "serializer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __66__MTTimerStorage_repeatTimerWithIdentifier_withCompletion_source___block_invoke;
  v17[3] = &unk_1E39CB8F8;
  v17[4] = self;
  v18 = v8;
  v19 = v10;
  v20 = v9;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  objc_msgSend(v13, "performBlock:", v17);

}

uint64_t __66__MTTimerStorage_repeatTimerWithIdentifier_withCompletion_source___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_repeatTimerWithIdentifier:withCompletion:source:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_queue_addTimer:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  void (**v8)(id, void *);
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint8_t v24[16];
  id v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, void *))a4;
  v9 = a5;
  v10 = a3;
  if (-[MTTimerStorage _queue_hasMatchingTimer:](self, "_queue_hasMatchingTimer:", v10))
  {
    MTLogForCategory(4);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MTTimerStorage _queue_addTimer:withCompletion:source:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    v19 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2D50];
    v27[0] = CFSTR("Timer already exists!");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobiletimerd.MTTimerStorage"), 1, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    MTLogForCategory(9);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_19AC4E000, v22, OS_LOG_TYPE_INFO, "MTTimerStorage - Failed Adding Timer", v24, 2u);
    }
  }
  else
  {
    -[NSMutableArray addObject:](self->_orderedTimers, "addObject:", v10);
    -[MTTimerStorage _queue_persistTimers](self, "_queue_persistTimers");
    v25 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[MTTimerStorage _queue_notifyObserversForTimerAdd:source:](self, "_queue_notifyObserversForTimerAdd:source:", v23, v9);
    -[MTTimerStorage _queue_sortTimers](self, "_queue_sortTimers");
    MTLogForCategory(9);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_19AC4E000, v22, OS_LOG_TYPE_INFO, "MTTimerStorage - Finished Adding Timer", v24, 2u);
    }
    v21 = 0;
  }

  if (v8)
    v8[2](v8, v21);

}

- (id)_queue_updateTimer:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  uint8_t buf[8];
  uint64_t v46;
  const __CFString *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *))a4;
  v10 = a5;
  objc_msgSend(v8, "timerIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTTimerStorage _queue_timerMatchingTimerIdentifier:](self, "_queue_timerMatchingTimerIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    MTLogForCategory(4);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[MTTimerStorage _queue_updateTimer:withCompletion:source:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);

    v26 = (void *)MEMORY[0x1E0CB35C8];
    v46 = *MEMORY[0x1E0CB2D50];
    v47 = CFSTR("Timer doesn't exist");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobiletimerd.MTTimerStorage"), 2, v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    MTLogForCategory(9);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19AC4E000, v28, OS_LOG_TYPE_INFO, "MTTimerStorage - Failed Updating Timer", buf, 2u);
    }

    +[MTAnalytics sendCriticalEvent:](MTAnalytics, "sendCriticalEvent:", CFSTR("Timer storage - trying to update timer that does not exist"));
LABEL_17:
    v13 = 0;
    if (!v9)
      goto LABEL_19;
LABEL_18:
    v9[2](v9, v17);
    goto LABEL_19;
  }
  if (!+[MTTimer stateChangeIsAllowableFromState:toState:](MTTimer, "stateChangeIsAllowableFromState:toState:", objc_msgSend(v12, "state"), objc_msgSend(v8, "state")))
  {
    v29 = (void *)MEMORY[0x1E0CB3940];
    +[MTTimer descriptionForState:](MTTimer, "descriptionForState:", objc_msgSend(v12, "state"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTTimer descriptionForState:](MTTimer, "descriptionForState:", objc_msgSend(v8, "state"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("Can't update timer from %@ to %@"), v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    MTLogForCategory(4);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[MTTimerStorage _queue_updateTimer:withCompletion:source:].cold.2((uint64_t)v32, v33, v34, v35, v36, v37, v38, v39);

    v40 = (void *)MEMORY[0x1E0CB35C8];
    v48 = *MEMORY[0x1E0CB2D50];
    v49 = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobiletimerd.MTTimerStorage"), 3, v41);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    MTLogForCategory(9);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19AC4E000, v42, OS_LOG_TYPE_INFO, "MTTimerStorage - Failed Updating Timer", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Timer storage: %@"), v32);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTAnalytics sendCriticalEvent:](MTAnalytics, "sendCriticalEvent:", v43);

    goto LABEL_17;
  }
  -[MTTimerStorage _queuePersistTimer:replacingTimer:](self, "_queuePersistTimer:replacingTimer:", v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTTimerStorage _queue_notifyObserversForTimerUpdate:fromTimers:source:](self, "_queue_notifyObserversForTimerUpdate:fromTimers:source:", v14, v15, v10);

  MTLogForCategory(9);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19AC4E000, v16, OS_LOG_TYPE_INFO, "MTTimerStorage - Finished Updating Timer", buf, 2u);
  }

  v17 = 0;
  if (v9)
    goto LABEL_18;
LABEL_19:

  return v13;
}

- (void)_queue_removeTimer:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint8_t v28[16];
  uint64_t v29;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *))a4;
  v10 = a5;
  objc_msgSend(v8, "timerIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTTimerStorage _queue_timerMatchingTimerIdentifier:](self, "_queue_timerMatchingTimerIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = -[MTTimerStorage _queuePersistTimer:replacingTimer:](self, "_queuePersistTimer:replacingTimer:", 0, v12);
    v31[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTTimerStorage _queue_notifyObserversForTimerRemoval:source:](self, "_queue_notifyObserversForTimerRemoval:source:", v14, v10);

    MTLogForCategory(9);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_19AC4E000, v15, OS_LOG_TYPE_INFO, "MTTimerStorage - Finished Removing Timer", v28, 2u);
    }

    v16 = 0;
    if (v9)
LABEL_5:
      v9[2](v9, v16);
  }
  else
  {
    MTLogForCategory(4);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MTTimerStorage _queue_removeTimer:withCompletion:source:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

    v25 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D50];
    v30 = CFSTR("Timer does not exist!");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobiletimerd.MTTimerStorage"), 2, v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    MTLogForCategory(9);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_19AC4E000, v27, OS_LOG_TYPE_INFO, "MTTimerStorage - Failed Removing Timer", v28, 2u);
    }

    +[MTAnalytics sendCriticalEvent:](MTAnalytics, "sendCriticalEvent:", CFSTR("Timer storage - trying to remove timer that does not exist"));
    if (v9)
      goto LABEL_5;
  }

}

- (void)_queue_dismissTimerWithIdentifier:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  const __CFString *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *))a4;
  v10 = a5;
  -[MTTimerStorage _queue_timerMatchingTimerIdentifier:](self, "_queue_timerMatchingTimerIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void))self->_currentDateProvider + 2))();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v13 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v13, "setDismissedDate:", v12);
    MTLogForCategory(4);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "timerID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v15;
      v28 = 2114;
      v29 = v12;
      _os_log_impl(&dword_19AC4E000, v14, OS_LOG_TYPE_DEFAULT, "Dismissed timer %{public}@ at %{public}@", buf, 0x16u);

    }
    -[MTTimerStorage _queue_updateTimer:withCompletion:source:](self, "_queue_updateTimer:withCompletion:source:", v13, v9, v10);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      v18 = (void *)v16;
    else
      v18 = v13;
    -[MTTimerStorage _queue_notifyObserversForTimerDismiss:source:](self, "_queue_notifyObserversForTimerDismiss:source:", v18, v10);
    MTLogForCategory(9);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19AC4E000, v19, OS_LOG_TYPE_INFO, "MTTimerStorage - Finished Dismissing Timer", buf, 2u);
    }

  }
  else
  {
    MTLogForCategory(4);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[MTTimerStorage _queue_dismissTimerWithIdentifier:withCompletion:source:].cold.1();

    +[MTAnalytics sendCriticalEvent:](MTAnalytics, "sendCriticalEvent:", CFSTR("Timer storage - trying to dismiss timer that does not exist"));
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    v25 = CFSTR("Timer does not exist!");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobiletimerd.MTTimerStorage"), 2, v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      MTLogForCategory(9);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19AC4E000, v23, OS_LOG_TYPE_INFO, "MTTimerStorage - Failed Dismissing Timer", buf, 2u);
      }

      v9[2](v9, v13);
    }
  }

}

- (void)_queue_repeatTimerWithIdentifier:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  const __CFString *v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *))a4;
  v10 = a5;
  -[MTTimerStorage _queue_timerMatchingTimerIdentifier:](self, "_queue_timerMatchingTimerIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "timerByRestarting");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    MTLogForCategory(4);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "timerID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v15;
      _os_log_impl(&dword_19AC4E000, v14, OS_LOG_TYPE_DEFAULT, "Repeated timer %{public}@", buf, 0xCu);

    }
    v16 = -[MTTimerStorage _queue_updateTimer:withCompletion:source:](self, "_queue_updateTimer:withCompletion:source:", v13, v9, v10);
    MTLogForCategory(9);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19AC4E000, v17, OS_LOG_TYPE_INFO, "MTTimerStorage - Finished Repeating Timer", buf, 2u);
    }

  }
  else
  {
    MTLogForCategory(4);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[MTTimerStorage _queue_dismissTimerWithIdentifier:withCompletion:source:].cold.1();

    +[MTAnalytics sendCriticalEvent:](MTAnalytics, "sendCriticalEvent:", CFSTR("Timer storage - trying to repeat timer that does not exist"));
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2D50];
    v23 = CFSTR("Timer does not exist!");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobiletimerd.MTTimerStorage"), 2, v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      MTLogForCategory(9);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19AC4E000, v21, OS_LOG_TYPE_INFO, "MTTimerStorage - Failed Repeating Timer", buf, 2u);
      }

      v9[2](v9, v13);
    }
  }

}

- (void)_queue_removeAllTimersForSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MTTimerStorage orderedTimers](self, "orderedTimers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "copy");

  -[MTTimerStorage orderedTimers](self, "orderedTimers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[MTTimerStorage _queue_persistTimers](self, "_queue_persistTimers");
  -[MTTimerStorage _queue_notifyObserversForTimerRemoval:source:](self, "_queue_notifyObserversForTimerRemoval:source:", v7, v4);

}

- (id)_queuePersistTimer:(id)a3 replacingTimer:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  -[MTTimerStorage _applyNecessaryChangesFromOldTimer:currentTimer:](self, "_applyNecessaryChangesFromOldTimer:currentTimer:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[MTTimerStorage orderedTimers](self, "orderedTimers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", v6);

  }
  v9 = v6;
  if (v7)
  {
    -[MTTimerStorage orderedTimers](self, "orderedTimers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v7);

    v9 = v7;
  }
  -[MTTimerStorage _queue_persistTimers](self, "_queue_persistTimers");
  -[MTTimerStorage _queue_sortTimers](self, "_queue_sortTimers");
  v11 = v9;

  return v11;
}

- (id)_applyNecessaryChangesFromOldTimer:(id)a3 currentTimer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  (*((void (**)(void))self->_currentDateProvider + 2))();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLastModifiedDate:", v9);

  v10 = objc_msgSend(v7, "state");
  if (v10 != 3 && objc_msgSend(v6, "state") == 3)
  {
    objc_msgSend(v8, "setFiredDate:", 0);
    objc_msgSend(v8, "setDismissedDate:", 0);
  }

  return v8;
}

- (void)_queue_notifyObserversWithBlock:(id)a3
{
  -[MTObserverStore enumerateObserversWithBlock:](self->_observers, "enumerateObserversWithBlock:", a3);
}

- (void)_queue_notifyObserversForTimerAdd:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  MTTimerStorage *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    MTLogForCategory(4);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for timer addition", buf, 0xCu);
    }

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__MTTimerStorage__queue_notifyObserversForTimerAdd_source___block_invoke;
    v9[3] = &unk_1E39CB920;
    v10 = v7;
    v11 = v6;
    -[MTTimerStorage _queue_notifyObserversWithBlock:](self, "_queue_notifyObserversWithBlock:", v9);

  }
}

uint64_t __59__MTTimerStorage__queue_notifyObserversForTimerAdd_source___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "source:didAddTimers:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_queue_notifyObserversForTimerUpdate:(id)a3 fromTimers:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  MTTimerStorage *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    MTLogForCategory(4);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = self;
      _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for timer update", buf, 0xCu);
    }

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __73__MTTimerStorage__queue_notifyObserversForTimerUpdate_fromTimers_source___block_invoke;
    v12[3] = &unk_1E39CB948;
    v13 = v10;
    v14 = v8;
    v15 = v9;
    -[MTTimerStorage _queue_notifyObserversWithBlock:](self, "_queue_notifyObserversWithBlock:", v12);

  }
}

void __73__MTTimerStorage__queue_notifyObserversForTimerUpdate_fromTimers_source___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "source:didUpdateTimers:", a1[4], a1[5]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "source:didUpdateTimers:fromTimers:", a1[4], a1[5], a1[6]);

}

- (void)_queue_notifyObserversForTimerRemoval:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  MTTimerStorage *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    MTLogForCategory(4);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for timer removal", buf, 0xCu);
    }

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__MTTimerStorage__queue_notifyObserversForTimerRemoval_source___block_invoke;
    v9[3] = &unk_1E39CB920;
    v10 = v7;
    v11 = v6;
    -[MTTimerStorage _queue_notifyObserversWithBlock:](self, "_queue_notifyObserversWithBlock:", v9);

  }
}

uint64_t __63__MTTimerStorage__queue_notifyObserversForTimerRemoval_source___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "source:didRemoveTimers:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_queue_notifyObserversForTimerDismiss:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  MTTimerStorage *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MTLogForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = self;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for timer dismissal", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__MTTimerStorage__queue_notifyObserversForTimerDismiss_source___block_invoke;
  v11[3] = &unk_1E39CB920;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  -[MTTimerStorage _queue_notifyObserversWithBlock:](self, "_queue_notifyObserversWithBlock:", v11);

}

uint64_t __63__MTTimerStorage__queue_notifyObserversForTimerDismiss_source___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "source:didDismissTimer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_queue_notifyObserversForTimerFire:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  MTTimerStorage *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MTLogForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = self;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for timer firing", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__MTTimerStorage__queue_notifyObserversForTimerFire_source___block_invoke;
  v11[3] = &unk_1E39CB920;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  -[MTTimerStorage _queue_notifyObserversWithBlock:](self, "_queue_notifyObserversWithBlock:", v11);

}

uint64_t __60__MTTimerStorage__queue_notifyObserversForTimerFire_source___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "source:didFireTimer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_queue_notifyObserversForNextTimerChange:(id)a3 source:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  MTTimerStorage *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MTLogForCategory(4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = self;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for next timer change", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__MTTimerStorage__queue_notifyObserversForNextTimerChange_source___block_invoke;
  v8[3] = &unk_1E39CB970;
  v9 = v5;
  v7 = v5;
  -[MTTimerStorage _queue_notifyObserversWithBlock:](self, "_queue_notifyObserversWithBlock:", v8);

}

uint64_t __66__MTTimerStorage__queue_notifyObserversForNextTimerChange_source___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "nextTimerDidChange:", *(_QWORD *)(a1 + 32));
}

- (id)_queue_timerMatchingTimerIdentifier:(id)a3
{
  id v4;
  NSMutableArray *orderedTimers;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  orderedTimers = self->_orderedTimers;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__MTTimerStorage__queue_timerMatchingTimerIdentifier___block_invoke;
  v9[3] = &unk_1E39CB998;
  v10 = v4;
  v6 = v4;
  -[NSMutableArray na_firstObjectPassingTest:](orderedTimers, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __54__MTTimerStorage__queue_timerMatchingTimerIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "timerIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)_queue_hasMatchingTimer:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "timerIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTTimerStorage _queue_timerMatchingTimerIdentifier:](self, "_queue_timerMatchingTimerIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 != 0;
}

- (void)_queue_persistTimers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  -[MTTimerStorage persistence](self, "persistence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v10 = (id)objc_opt_new();
    objc_msgSend(v10, "encodeObject:forKey:", self->_orderedTimers, CFSTR("MTTimers"));
    objc_msgSend(v10, "encodedDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTTimerStorage persistence](self, "persistence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("MTTimers"));

    -[MTTimerStorage persistence](self, "persistence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = 3.0;
    objc_msgSend(v6, "setFloat:forKey:", CFSTR("MTTimerStorageVersion"), v7);

    -[MTTimerStorage persistence](self, "persistence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))self->_currentDateProvider + 2))();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("MTTimerModifiedDate"));

  }
}

- (void)_queue_sortTimers
{
  -[NSMutableArray sortUsingComparator:](self->_orderedTimers, "sortUsingComparator:", &__block_literal_global_4);
}

uint64_t __35__MTTimerStorage__queue_sortTimers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)handleMigrationFinish
{
  -[MTTimerStorage _removeTimerDataIfNecessary:](self, "_removeTimerDataIfNecessary:", 0);
}

- (void)printDiagnostics
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "-----MTTimerStorage-----", (uint8_t *)&v8, 2u);
  }

  MTLogForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[MTTimerStorage _diagnosticTimerDictionary](self, "_diagnosticTimerDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "Timers: %{public}@", (uint8_t *)&v8, 0xCu);

  }
  MTLogForCategory(4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[MTTimerStorage lastModifiedDate](self, "lastModifiedDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "Last Modified: %{public}@", (uint8_t *)&v8, 0xCu);

  }
}

- (id)gatherDiagnostics
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("Timers");
  -[MTTimerStorage _diagnosticTimerDictionary](self, "_diagnosticTimerDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("Timers Last Modified");
  v8[0] = v3;
  -[MTTimerStorage lastModifiedDate](self, "lastModifiedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_diagnosticTimerDictionary
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[MTTimerStorage orderedTimers](self, "orderedTimers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_msgSend((id)objc_opt_class(), "_diagnosticDictionaryForTimer:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timerIDString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

+ (id)_diagnosticDictionaryForTimer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
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

  v3 = a3;
  v4 = (void *)objc_opt_new();
  +[MTTimer descriptionForState:](MTTimer, "descriptionForState:", objc_msgSend(v3, "state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("state"));

  objc_msgSend(v3, "firedDate");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = CFSTR("None");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("fired"));

  objc_msgSend(v3, "lastModifiedDate");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = CFSTR("None");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("modified"));

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "sound");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "toneIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sound");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mediaItemIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sound");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "vibrationIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sound");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "soundVolume");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("toneID: %@, mediaItemID: %@, vibeID: %@, volume: %@"), v14, v16, v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("sound"));

  return v4;
}

- (void)scheduler:(id)a3 didChangeNextTimer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MTTimerStorage serializer](self, "serializer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__MTTimerStorage_scheduler_didChangeNextTimer___block_invoke;
  v11[3] = &unk_1E39CB828;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "performBlock:", v11);

}

uint64_t __47__MTTimerStorage_scheduler_didChangeNextTimer___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  MTLogForCategory(9);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_INFO, "MTTimerStorage - Next Timer Changed", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyObserversForNextTimerChange:source:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)scheduler:(id)a3 didFireTimer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MTTimerStorage serializer](self, "serializer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__MTTimerStorage_scheduler_didFireTimer___block_invoke;
  v11[3] = &unk_1E39CB828;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "performBlock:", v11);

}

void __41__MTTimerStorage_scheduler_didFireTimer___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  MTLogForCategory(9);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_INFO, "MTTimerStorage - Fired Timer", v5, 2u);
  }

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "scheduleable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_queue_notifyObserversForTimerFire:source:", v4, *(_QWORD *)(a1 + 48));

}

- (void)_removeTimerDataIfNecessary:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  _QWORD v9[5];
  uint8_t buf[4];
  MTTimerStorage *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.mobiletimer")) & 1) != 0
    || !a3
    && (+[MTApplicationWorkspaceObserver sharedWorkspaceObserver](MTApplicationWorkspaceObserver, "sharedWorkspaceObserver"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v8 = objc_msgSend(v7, "isApplicationInstalledForBundleIdentifier:", CFSTR("com.apple.mobiletimer")), v7, (v8 & 1) == 0))
  {
    MTLogForCategory(4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = self;
      _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ removing all timers", buf, 0xCu);
    }

    -[MTTimerStorage serializer](self, "serializer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__MTTimerStorage__removeTimerDataIfNecessary___block_invoke;
    v9[3] = &unk_1E39CB858;
    v9[4] = self;
    objc_msgSend(v6, "performBlock:", v9);

  }
}

uint64_t __46__MTTimerStorage__removeTimerDataIfNecessary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeAllTimersForSource:", 0);
}

- (void)_queue_removeStaleTimers:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  NSMutableArray *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  MTTimerStorage *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  MTTimerStorage *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v25 = a3;
  v39 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  (*((void (**)(void))self->_currentDateProvider + 2))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -172800.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  MTLogForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v33 = self;
    v34 = 2114;
    v35 = v7;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Checking for stale timers that have not been modified since: %{public}@", buf, 0x16u);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v27 = self;
  v9 = self->_orderedTimers;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    v26 = v5;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "state");
        v16 = v5;
        if (v15 == 1)
        {
          objc_msgSend(v14, "lastModifiedDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "mtIsBeforeDate:", v7);

          v16 = v5;
          if (v18)
          {
            MTLogForCategory(4);
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v14, "timerIDString");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "lastModifiedDate");
              v21 = v9;
              v22 = v7;
              v23 = v4;
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v33 = v27;
              v34 = 2114;
              v35 = v20;
              v36 = 2114;
              v37 = v24;
              _os_log_impl(&dword_19AC4E000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ timer: %{public}@ has not been modified since: %{public}@. Removing.", buf, 0x20u);

              v4 = v23;
              v7 = v22;
              v9 = v21;
              v5 = v26;

            }
            v16 = v4;
          }
        }
        objc_msgSend(v16, "addObject:", v14);
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v4, "count"))
  {
    -[MTTimerStorage _queue_setAllTimers:source:persist:notify:](v27, "_queue_setAllTimers:source:persist:notify:", v5, 0, 1, 0);
    if (v25)
      -[MTTimerStorage _queue_notifyObserversForTimerRemoval:source:](v27, "_queue_notifyObserversForTimerRemoval:source:", v4, 0);
  }

}

- (void)timeListener:(id)a3 didDetectSignificantTimeChangeWithCompletionBlock:(id)a4
{
  void *v5;
  _QWORD v6[5];

  -[MTTimerStorage serializer](self, "serializer", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__MTTimerStorage_timeListener_didDetectSignificantTimeChangeWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E39CB858;
  v6[4] = self;
  objc_msgSend(v5, "performBlock:", v6);

}

uint64_t __81__MTTimerStorage_timeListener_didDetectSignificantTimeChangeWithCompletionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeStaleTimers:", 1);
}

- (void)addRecentDuration:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD);
  NSObject *v9;
  void *v10;
  int v11;
  MTTimerStorage *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  MTLogForCategory(4);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = self;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ addRecentDuration %{public}@", (uint8_t *)&v11, 0x16u);
  }

  -[MTTimerStorage durationManager](self, "durationManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addRecentDuration:", v7);

  if (v8)
    v8[2](v8, 0);

}

- (void)removeRecentDuration:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD);
  NSObject *v9;
  void *v10;
  int v11;
  MTTimerStorage *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  MTLogForCategory(4);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = self;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ removeRecentDuration %{public}@", (uint8_t *)&v11, 0x16u);
  }

  -[MTTimerStorage durationManager](self, "durationManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeRecentDuration:", v7);

  if (v8)
    v8[2](v8, 0);

}

- (void)addFavoriteDuration:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD);
  NSObject *v9;
  void *v10;
  int v11;
  MTTimerStorage *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  MTLogForCategory(4);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = self;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ addFavoriteDuration %{public}@", (uint8_t *)&v11, 0x16u);
  }

  -[MTTimerStorage durationManager](self, "durationManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addFavoriteDuration:", v7);

  if (v8)
    v8[2](v8, 0);

}

- (void)removeFavoriteDuration:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD);
  NSObject *v9;
  void *v10;
  int v11;
  MTTimerStorage *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  MTLogForCategory(4);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = self;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ removeFavoriteDuration %{public}@", (uint8_t *)&v11, 0x16u);
  }

  -[MTTimerStorage durationManager](self, "durationManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeFavoriteDuration:", v7);

  if (v8)
    v8[2](v8, 0);

}

- (void)saveLatestDuration:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD);
  NSObject *v9;
  void *v10;
  int v11;
  MTTimerStorage *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  MTLogForCategory(4);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = self;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ saveLatestDuration %{public}@", (uint8_t *)&v11, 0x16u);
  }

  -[MTTimerStorage durationManager](self, "durationManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "saveLatestDuration:", v7);

  if (v8)
    v8[2](v8, 0);

}

- (void)setDurationUpdateDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTTimerStorage durationManager](self, "durationManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDurationUpdateDelegate:", v4);

}

- (NSMutableArray)orderedTimers
{
  return self->_orderedTimers;
}

- (void)setOrderedTimers:(id)a3
{
  objc_storeStrong((id *)&self->_orderedTimers, a3);
}

- (void)setLastModifiedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (MTTimerMigrator)migrator
{
  return self->_migrator;
}

- (void)setMigrator:(id)a3
{
  objc_storeStrong((id *)&self->_migrator, a3);
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (MTObserverStore)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (MTPersistence)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_persistence, a3);
}

- (void)setDurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_durationManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationManager, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_migrator, 0);
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_orderedTimers, 0);
  objc_destroyWeak((id *)&self->_scheduler);
  objc_storeStrong((id *)&self->_metrics, 0);
}

void __44__MTTimerStorage__loadTimersWithCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[14];
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v4 = v0;
  OUTLINED_FUNCTION_6(&dword_19AC4E000, v1, v2, "%{public}@ loaded %{public}@", v3);
  OUTLINED_FUNCTION_2();
}

void __44__MTTimerStorage__loadTimersWithCompletion___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_19AC4E000, v0, v1, "%{public}@ unexpected error reading data %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)setAllTimers:source:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_19AC4E000, v0, (uint64_t)v0, "%{public}@ setting all timers %{public}@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)_queue_addTimer:(uint64_t)a3 withCompletion:(uint64_t)a4 source:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_19AC4E000, a1, a3, "Timer already exists", a5, a6, a7, a8, 0);
}

- (void)_queue_updateTimer:(uint64_t)a3 withCompletion:(uint64_t)a4 source:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_19AC4E000, a1, a3, "%{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_queue_updateTimer:(uint64_t)a3 withCompletion:(uint64_t)a4 source:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_19AC4E000, a2, a3, "%{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_queue_removeTimer:(uint64_t)a3 withCompletion:(uint64_t)a4 source:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_19AC4E000, a1, a3, "Timer doesn't exist", a5, a6, a7, a8, 0);
}

- (void)_queue_dismissTimerWithIdentifier:withCompletion:source:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_19AC4E000, v0, v1, "%{public}@ couldn't find matching timer to dismiss for %{public}@");
  OUTLINED_FUNCTION_2();
}

@end

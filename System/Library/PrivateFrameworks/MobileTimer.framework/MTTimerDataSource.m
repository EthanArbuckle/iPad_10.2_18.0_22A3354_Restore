@implementation MTTimerDataSource

- (unint64_t)numberOfActiveTimers
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  return -[NSMutableArray count](self->_activeTimers, "count");
}

uint64_t __52__MTTimerDataSource_reloadTimersNotifyingObservers___block_invoke_42()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (id)reloadTimers
{
  return -[MTTimerDataSource reloadTimersNotifyingObservers:](self, "reloadTimersNotifyingObservers:", 1);
}

- (void)registerObserver:(id)a3
{
  -[MTObserverStore addObserver:](self->_observers, "addObserver:", a3);
}

void __52__MTTimerDataSource_reloadTimersNotifyingObservers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  int v20;
  NSObject *v21;
  _BOOL4 v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    MTLogForCategory(4);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __52__MTTimerDataSource_reloadTimersNotifyingObservers___block_invoke_cold_1();
  }
  else
  {
    v8 = objc_opt_new();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 32);
    *(_QWORD *)(v9 + 32) = v8;

    v11 = objc_opt_new();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v14 = v5;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", v19);
          if (objc_msgSend(v19, "state") == 3 || objc_msgSend(v19, "state") == 2)
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", v19);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v16);
    }

    v20 = *(unsigned __int8 *)(a1 + 40);
    MTLogForCategory(4);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (v22)
      {
        v23 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v33 = v23;
        _os_log_impl(&dword_19AC4E000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ calling reload block", buf, 0xCu);
      }

      v24 = *(void **)(a1 + 32);
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __52__MTTimerDataSource_reloadTimersNotifyingObservers___block_invoke_40;
      v27[3] = &unk_1E39CECD0;
      v27[4] = v24;
      objc_msgSend(v24, "_iterateObserversWithBlock:", v27);
    }
    else
    {
      if (v22)
      {
        v25 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v33 = v25;
        _os_log_impl(&dword_19AC4E000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ reload without notifying observers", buf, 0xCu);
      }

    }
    MTLogForCategory(4);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v26 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v33 = v26;
      _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ finished reloading", buf, 0xCu);
    }
  }

}

- (void)_iterateObserversWithBlock:(id)a3
{
  -[MTObserverStore enumerateObserversWithBlock:](self->_observers, "enumerateObserversWithBlock:", a3);
}

- (void)reloadTimerDurations
{
  NSObject *v3;
  MTTimerManager *timerManager;
  _QWORD v5[5];
  uint8_t buf[4];
  MTTimerDataSource *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ loading all durations with completion", buf, 0xCu);
  }

  timerManager = self->_timerManager;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__MTTimerDataSource_reloadTimerDurations__block_invoke;
  v5[3] = &unk_1E39CE028;
  v5[4] = self;
  -[MTTimerManager loadAllDurationsWithCompletion:](timerManager, "loadAllDurationsWithCompletion:", v5);
}

- (id)getLatestDuration
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__16;
  v9 = __Block_byref_object_dispose__16;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__MTTimerDataSource_getLatestDuration__block_invoke;
  v4[3] = &unk_1E39CBB50;
  v4[4] = self;
  v4[5] = &v5;
  -[MTTimerDataSource _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)reloadTimersNotifyingObservers:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  BOOL v13;
  uint8_t buf[4];
  MTTimerDataSource *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = self;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ asynchronously reloading timers", buf, 0xCu);
  }

  -[MTTimerManager timers](self->_timerManager, "timers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mtMainThreadScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reschedule:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__MTTimerDataSource_reloadTimersNotifyingObservers___block_invoke;
  v12[3] = &unk_1E39CE898;
  v12[4] = self;
  v13 = a3;
  objc_msgSend(v8, "addCompletionBlock:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "flatMap:", &__block_literal_global_47);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __41__MTTimerDataSource_reloadTimerDurations__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  MTLogForCategory(4);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __41__MTTimerDataSource_reloadTimerDurations__block_invoke_cold_1();

  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v35 = v18;
      _os_log_impl(&dword_19AC4E000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ loading durations with completion finished successfully", buf, 0xCu);
    }

    v19 = MEMORY[0x1E0C809B0];
    v20 = *(void **)(a1 + 32);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __41__MTTimerDataSource_reloadTimerDurations__block_invoke_45;
    v29[3] = &unk_1E39CBDE0;
    v29[4] = v20;
    v30 = v11;
    v31 = v12;
    v32 = v13;
    v33 = v14;
    objc_msgSend(v20, "_withLock:", v29);
    MTLogForCategory(4);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(void **)(a1 + 32);
      objc_msgSend(v22, "recentDurations");
      v27 = v11;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "favoriteDurations");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "latestDuration");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v35 = v22;
      v19 = MEMORY[0x1E0C809B0];
      v36 = 2114;
      v37 = v23;
      v38 = 2114;
      v39 = v24;
      v40 = 2114;
      v41 = v25;
      _os_log_impl(&dword_19AC4E000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ updated durations are recent: %{public}@, favorites: %{public}@, latest: %{public}@", buf, 0x2Au);

      v11 = v27;
    }

    v26 = *(void **)(a1 + 32);
    v28[0] = v19;
    v28[1] = 3221225472;
    v28[2] = __41__MTTimerDataSource_reloadTimerDurations__block_invoke_48;
    v28[3] = &unk_1E39CECD0;
    v28[4] = v26;
    objc_msgSend(v26, "_iterateObserversWithBlock:", v28);

  }
}

- (id)getRecentDurations
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__16;
  v9 = __Block_byref_object_dispose__16;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__MTTimerDataSource_getRecentDurations__block_invoke;
  v4[3] = &unk_1E39CBB50;
  v4[4] = self;
  v4[5] = &v5;
  -[MTTimerDataSource _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_timerLock;
  void (**v4)(_QWORD);

  p_timerLock = &self->_timerLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_timerLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_timerLock);
}

void __39__MTTimerDataSource_getRecentDurations__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "recentDurations");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)recentDurations
{
  return self->_recentDurations;
}

- (MTTimerDuration)latestDuration
{
  return self->_latestDuration;
}

void __38__MTTimerDataSource_getLatestDuration__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "latestDuration");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setRecentDurations:(id)a3
{
  objc_storeStrong((id *)&self->_recentDurations, a3);
}

- (void)setLatestDuration:(id)a3
{
  objc_storeStrong((id *)&self->_latestDuration, a3);
}

- (void)setFavoriteDurations:(id)a3
{
  objc_storeStrong((id *)&self->_favoriteDurations, a3);
}

- (void)setDefaultDurations:(id)a3
{
  objc_storeStrong((id *)&self->_defaultDurations, a3);
}

- (NSArray)favoriteDurations
{
  return self->_favoriteDurations;
}

- (MTTimerDataSource)initWithTimerManager:(id)a3
{
  id v5;
  MTTimerDataSource *v6;
  NSObject *v7;
  uint64_t v8;
  NSMutableArray *timers;
  uint64_t v10;
  MTObserverStore *observers;
  objc_super v13;
  uint8_t buf[4];
  MTTimerDataSource *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v13.receiver = self;
  v13.super_class = (Class)MTTimerDataSource;
  v6 = -[MTTimerDataSource init](&v13, sel_init);
  if (v6)
  {
    MTLogForCategory(4);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v6;
      _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ initializing", buf, 0xCu);
    }

    v6->_timerLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_timerManager, a3);
    v8 = objc_opt_new();
    timers = v6->_timers;
    v6->_timers = (NSMutableArray *)v8;

    v10 = objc_opt_new();
    observers = v6->_observers;
    v6->_observers = (MTObserverStore *)v10;

    -[MTTimerDataSource _registerForNotifications](v6, "_registerForNotifications");
  }

  return v6;
}

- (void)_registerForNotifications
{
  void *v3;
  MTTimerManager *timerManager;
  void *v5;
  uint64_t v6;
  id v7;
  MTTimerManager *v8;
  void *v9;
  id v10;
  void *v11;
  MTTimerManager *v12;
  void *v13;
  id v14;
  id v15;
  MTTimerManager *v16;
  void *v17;
  id v18;
  id v19;
  MTTimerManager *v20;
  void *v21;
  id v22;
  MTTimerManager *v23;
  void *v24;
  id v25;
  MTTimerManager *v26;
  void *v27;
  id v28;
  MTTimerManager *v29;
  void *v30;
  id v31;
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[6];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  timerManager = self->_timerManager;
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke;
  v42[3] = &unk_1E39CE820;
  v42[4] = self;
  v7 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("MTTimerManagerTimersAdded"), timerManager, v5, v42);

  v8 = self->_timerManager;
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v6;
  v41[1] = 3221225472;
  v41[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_4;
  v41[3] = &unk_1E39CE820;
  v41[4] = self;
  v10 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("MTTimerManagerTimersRemoved"), v8, v9, v41);

  v40[0] = v6;
  v40[1] = 3221225472;
  v40[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_3_12;
  v40[3] = &unk_1E39CE6F0;
  v40[4] = self;
  v11 = (void *)MEMORY[0x19AED0080](v40);
  v12 = self->_timerManager;
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v6;
  v38[1] = 3221225472;
  v38[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_5;
  v38[3] = &unk_1E39CE848;
  v38[4] = self;
  v14 = v11;
  v39 = v14;
  v15 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("MTTimerManagerFiringTimerChanged"), v12, v13, v38);

  v16 = self->_timerManager;
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v6;
  v36[1] = 3221225472;
  v36[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_16;
  v36[3] = &unk_1E39CE848;
  v36[4] = self;
  v37 = v14;
  v18 = v14;
  v19 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("MTTimerManagerTimersUpdated"), v16, v17, v36);

  v20 = self->_timerManager;
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v6;
  v35[1] = 3221225472;
  v35[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_17;
  v35[3] = &unk_1E39CE820;
  v35[4] = self;
  v22 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("MTTimerManagerStateReset"), v20, v21, v35);

  v23 = self->_timerManager;
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v6;
  v34[1] = 3221225472;
  v34[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_23;
  v34[3] = &unk_1E39CE820;
  v34[4] = self;
  v25 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("MTTimerManagerRecentDurationsUpdated"), v23, v24, v34);

  v26 = self->_timerManager;
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v6;
  v33[1] = 3221225472;
  v33[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_25;
  v33[3] = &unk_1E39CE820;
  v33[4] = self;
  v28 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("MTTimerManagerFavoriteDurationsUpdated"), v26, v27, v33);

  v29 = self->_timerManager;
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v6;
  v32[1] = 3221225472;
  v32[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_3_27;
  v32[3] = &unk_1E39CE820;
  v32[4] = self;
  v31 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("MTTimerManagerLatestDurationUpdated"), v29, v30, v32);

}

- (void)unregisterObserver:(id)a3
{
  -[MTObserverStore removeObserver:](self->_observers, "removeObserver:", a3);
}

uint64_t __46__MTTimerDataSource__registerForNotifications__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_2;
  v4[3] = &unk_1E39CE6F0;
  v4[4] = v2;
  return objc_msgSend(v2, "_handleTimerNotification:block:", a2, v4);
}

void __46__MTTimerDataSource__registerForNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_3;
  v6[3] = &unk_1E39CECA8;
  v6[4] = v4;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_iterateObserversWithBlock:", v6);

}

void __46__MTTimerDataSource__registerForNotifications__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dataSource:didAddTimers:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __46__MTTimerDataSource__registerForNotifications__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v9 = v5;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ MTTimerManagerTimersRemoved", buf, 0xCu);
  }

  v6 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_8;
  v7[3] = &unk_1E39CE6F0;
  v7[4] = v6;
  objc_msgSend(v6, "_handleTimerNotification:block:", v3, v7);

}

void __46__MTTimerDataSource__registerForNotifications__block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_2_9;
  v6[3] = &unk_1E39CECA8;
  v6[4] = v4;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_iterateObserversWithBlock:", v6);

}

void __46__MTTimerDataSource__registerForNotifications__block_invoke_2_9(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dataSource:didRemoveTimers:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __46__MTTimerDataSource__registerForNotifications__block_invoke_3_12(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_4_13;
  v6[3] = &unk_1E39CECA8;
  v6[4] = v4;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_iterateObserversWithBlock:", v6);

}

void __46__MTTimerDataSource__registerForNotifications__block_invoke_4_13(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dataSource:didUpdateTimers:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __46__MTTimerDataSource__registerForNotifications__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ MTTimerManagerFiringTimerChanged", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_handleTimerNotification:block:", v3, *(_QWORD *)(a1 + 40));
}

void __46__MTTimerDataSource__registerForNotifications__block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ MTTimerManagerTimersUpdated", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_handleTimerNotification:block:", v3, *(_QWORD *)(a1 + 40));
}

uint64_t __46__MTTimerDataSource__registerForNotifications__block_invoke_17(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ MTTimerManagerStateReset", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_stateReset");
}

uint64_t __46__MTTimerDataSource__registerForNotifications__block_invoke_23(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_2_24;
  v4[3] = &unk_1E39CE6F0;
  v4[4] = v2;
  return objc_msgSend(v2, "_handleTimerDurationNotification:block:", a2, v4);
}

void __46__MTTimerDataSource__registerForNotifications__block_invoke_2_24(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ processing recents notification update with durations: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "processRecentDurationsUpdated:", v3);
}

uint64_t __46__MTTimerDataSource__registerForNotifications__block_invoke_25(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_2_26;
  v4[3] = &unk_1E39CE6F0;
  v4[4] = v2;
  return objc_msgSend(v2, "_handleTimerDurationNotification:block:", a2, v4);
}

uint64_t __46__MTTimerDataSource__registerForNotifications__block_invoke_2_26(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processFavoriteDurationsUpdated:", a2);
}

uint64_t __46__MTTimerDataSource__registerForNotifications__block_invoke_3_27(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_4_28;
  v4[3] = &unk_1E39CE6F0;
  v4[4] = v2;
  return objc_msgSend(v2, "_handleTimerDurationNotification:block:", a2, v4);
}

uint64_t __46__MTTimerDataSource__registerForNotifications__block_invoke_4_28(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processLatestDurationsUpdatedWith:", a2);
}

- (void)processRecentDurationsUpdated:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__MTTimerDataSource_processRecentDurationsUpdated___block_invoke;
  v6[3] = &unk_1E39CB7B0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MTTimerDataSource _withLock:](self, "_withLock:", v6);

}

uint64_t __51__MTTimerDataSource_processRecentDurationsUpdated___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v9 = v3;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ updating recent durations to: %{public}@", buf, 0x16u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__MTTimerDataSource_processRecentDurationsUpdated___block_invoke_29;
  v7[3] = &unk_1E39CECD0;
  v7[4] = v5;
  return objc_msgSend(v5, "_iterateObserversWithBlock:", v7);
}

void __51__MTTimerDataSource_processRecentDurationsUpdated___block_invoke_29(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dataSourceDidReloadRecentDurations:", *(_QWORD *)(a1 + 32));

}

- (void)processFavoriteDurationsUpdated:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__MTTimerDataSource_processFavoriteDurationsUpdated___block_invoke;
  v6[3] = &unk_1E39CB7B0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MTTimerDataSource _withLock:](self, "_withLock:", v6);

}

uint64_t __53__MTTimerDataSource_processFavoriteDurationsUpdated___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__MTTimerDataSource_processFavoriteDurationsUpdated___block_invoke_2;
  v4[3] = &unk_1E39CECD0;
  v4[4] = v2;
  return objc_msgSend(v2, "_iterateObserversWithBlock:", v4);
}

void __53__MTTimerDataSource_processFavoriteDurationsUpdated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dataSourceDidReloadFavoriteDurations:", *(_QWORD *)(a1 + 32));

}

- (void)processLatestDurationsUpdatedWith:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  MTTimerDataSource *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__MTTimerDataSource_processLatestDurationsUpdatedWith___block_invoke;
  v6[3] = &unk_1E39CB7B0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[MTTimerDataSource _withLock:](self, "_withLock:", v6);

}

uint64_t __55__MTTimerDataSource_processLatestDurationsUpdatedWith___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(v3 + 72);
    *(_QWORD *)(v3 + 72) = v2;

  }
  v5 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__MTTimerDataSource_processLatestDurationsUpdatedWith___block_invoke_2;
  v7[3] = &unk_1E39CECD0;
  v7[4] = v5;
  return objc_msgSend(v5, "_iterateObserversWithBlock:", v7);
}

void __55__MTTimerDataSource_processLatestDurationsUpdatedWith___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dataSourceDidReloadLatestDuration:", *(_QWORD *)(a1 + 32));

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("MTTimerManagerTimersAdded"), self->_timerManager);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("MTTimerManagerTimersRemoved"), self->_timerManager);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("MTTimerManagerFiringTimerChanged"), self->_timerManager);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("MTTimerManagerTimersUpdated"), self->_timerManager);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("MTTimerManagerStateReset"), self->_timerManager);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("MTTimerManagerRecentDurationsUpdated"), self->_timerManager);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:name:object:", self, CFSTR("MTTimerManagerFavoriteDurationsUpdated"), self->_timerManager);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:name:object:", self, CFSTR("MTTimerManagerLatestDurationUpdated"), self->_timerManager);

  v11.receiver = self;
  v11.super_class = (Class)MTTimerDataSource;
  -[MTTimerDataSource dealloc](&v11, sel_dealloc);
}

- (void)_handleTimerNotification:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  int v13;
  MTTimerDataSource *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(v6, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("Timers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  MTLogForCategory(4);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = self;
    v15 = 2114;
    v16 = v11;
    v17 = 1024;
    v18 = objc_msgSend(v9, "count");
    _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ received %{public}@ notification for %d timers.", (uint8_t *)&v13, 0x1Cu);

  }
  v12 = -[MTTimerDataSource reloadTimers](self, "reloadTimers");
  v7[2](v7, v9);

}

- (void)_handleTimerDurationNotification:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  MTTimerDataSource *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(v6, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("Durations"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  MTLogForCategory(4);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = self;
    v14 = 2114;
    v15 = v11;
    v16 = 2114;
    v17 = v9;
    _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ received %{public}@ duration payload: %{public}@", (uint8_t *)&v12, 0x20u);

  }
  -[MTTimerDataSource reloadTimerDurations](self, "reloadTimerDurations");
  v7[2](v7, v9);

}

- (void)_stateReset
{
  NSObject *v3;
  id v4;
  int v5;
  MTTimerDataSource *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  MTLogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ received MTTimerManagerStateReset notification.", (uint8_t *)&v5, 0xCu);
  }

  v4 = -[MTTimerDataSource reloadTimers](self, "reloadTimers");
}

uint64_t __52__MTTimerDataSource_reloadTimersNotifyingObservers___block_invoke_40(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dataSourceDidReload:", *(_QWORD *)(a1 + 32));
}

uint64_t __41__MTTimerDataSource_reloadTimerDurations__block_invoke_45(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 40), "sortedArrayUsingComparator:", &__block_literal_global_47_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setRecentDurations:", v2);

  objc_msgSend(*(id *)(a1 + 32), "setFavoriteDurations:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setDefaultDurations:", *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 32), "setLatestDuration:", *(_QWORD *)(a1 + 64));
}

BOOL __41__MTTimerDataSource_reloadTimerDurations__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v4 = a3;
  objc_msgSend(a2, "lastModified");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastModified");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6) == -1;
  return v7;
}

void __41__MTTimerDataSource_reloadTimerDurations__block_invoke_48(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dataSourceDidReloadAllDurations:", *(_QWORD *)(a1 + 32));

}

- (unint64_t)numberOfTimers
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  return -[NSMutableArray count](self->_timers, "count");
}

- (id)timerAtRow:(unint64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_timers, "objectAtIndexedSubscript:", a3);
}

- (id)activeTimerAtRow:(unint64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_activeTimers, "objectAtIndexedSubscript:", a3);
}

- (unint64_t)rowForTimer:(id)a3
{
  void *v4;
  unint64_t v5;

  objc_msgSend(a3, "timerIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MTTimerDataSource rowForTimerWithID:](self, "rowForTimerWithID:", v4);

  return v5;
}

- (unint64_t)rowForTimerWithID:(id)a3
{
  id v4;
  NSMutableArray *timers;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  timers = self->_timers;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__MTTimerDataSource_rowForTimerWithID___block_invoke;
  v9[3] = &unk_1E39CED38;
  v10 = v4;
  v6 = v4;
  v7 = -[NSMutableArray indexOfObjectPassingTest:](timers, "indexOfObjectPassingTest:", v9);

  return v7;
}

uint64_t __39__MTTimerDataSource_rowForTimerWithID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "timerIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)getDefaultDurations
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__16;
  v9 = __Block_byref_object_dispose__16;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__MTTimerDataSource_getDefaultDurations__block_invoke;
  v4[3] = &unk_1E39CBB50;
  v4[4] = self;
  v4[5] = &v5;
  -[MTTimerDataSource _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __40__MTTimerDataSource_getDefaultDurations__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "defaultDurations");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)getFavoriteDurations
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__16;
  v9 = __Block_byref_object_dispose__16;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__MTTimerDataSource_getFavoriteDurations__block_invoke;
  v4[3] = &unk_1E39CBB50;
  v4[4] = self;
  v4[5] = &v5;
  -[MTTimerDataSource _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __41__MTTimerDataSource_getFavoriteDurations__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "favoriteDurations");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)addTimer:(id)a3
{
  return -[MTTimerDataSource addTimer:reload:](self, "addTimer:reload:", a3, 1);
}

- (id)addTimer:(id)a3 reload:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  BOOL v14;

  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[NSMutableArray addObject:](self->_timers, "addObject:", v6);
  -[MTTimerDataSource timerManager](self, "timerManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTimer:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519E8], "mtMainThreadScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reschedule:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __37__MTTimerDataSource_addTimer_reload___block_invoke;
  v13[3] = &unk_1E39CE8C0;
  v13[4] = self;
  v14 = a4;
  objc_msgSend(v10, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __37__MTTimerDataSource_addTimer_reload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadTimersNotifyingObservers:", *(unsigned __int8 *)(a1 + 40));
}

- (id)updateTimer:(id)a3
{
  return -[MTTimerDataSource updateTimer:reload:](self, "updateTimer:reload:", a3, 1);
}

- (id)updateTimer:(id)a3 reload:(BOOL)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  BOOL v15;

  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v7 = -[MTTimerDataSource rowForTimer:](self, "rowForTimer:", v6);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray setObject:atIndexedSubscript:](self->_timers, "setObject:atIndexedSubscript:", v6, v7);
  -[MTTimerDataSource timerManager](self, "timerManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateTimer:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mtMainThreadScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reschedule:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __40__MTTimerDataSource_updateTimer_reload___block_invoke;
  v14[3] = &unk_1E39CE8C0;
  v14[4] = self;
  v15 = a4;
  objc_msgSend(v11, "flatMap:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __40__MTTimerDataSource_updateTimer_reload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadTimersNotifyingObservers:", *(unsigned __int8 *)(a1 + 40));
}

- (id)removeTimer:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v5 = -[MTTimerDataSource rowForTimer:](self, "rowForTimer:", v4);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray removeObjectAtIndex:](self->_timers, "removeObjectAtIndex:", v5);
  -[MTTimerDataSource timerManager](self, "timerManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeTimer:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mtMainThreadScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reschedule:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __33__MTTimerDataSource_removeTimer___block_invoke;
  v12[3] = &unk_1E39CC748;
  v12[4] = self;
  objc_msgSend(v9, "flatMap:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __33__MTTimerDataSource_removeTimer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadTimers");
}

- (MTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (MTObserverStore)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NSMutableArray)timers
{
  return self->_timers;
}

- (void)setTimers:(id)a3
{
  objc_storeStrong((id *)&self->_timers, a3);
}

- (NSMutableArray)activeTimers
{
  return self->_activeTimers;
}

- (void)setActiveTimers:(id)a3
{
  objc_storeStrong((id *)&self->_activeTimers, a3);
}

- (NSArray)defaultDurations
{
  return self->_defaultDurations;
}

- (os_unfair_lock_s)timerLock
{
  return self->_timerLock;
}

- (void)setTimerLock:(os_unfair_lock_s)a3
{
  self->_timerLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestDuration, 0);
  objc_storeStrong((id *)&self->_favoriteDurations, 0);
  objc_storeStrong((id *)&self->_recentDurations, 0);
  objc_storeStrong((id *)&self->_defaultDurations, 0);
  objc_storeStrong((id *)&self->_activeTimers, 0);
  objc_storeStrong((id *)&self->_timers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
}

void __52__MTTimerDataSource_reloadTimersNotifyingObservers___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_19AC4E000, v0, v1, "%{public}@ failed reloading: %{public}@");
}

void __41__MTTimerDataSource_reloadTimerDurations__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_19AC4E000, v0, v1, "%{public}@ reloadTimerDurations failed with error: %{public}@");
}

@end

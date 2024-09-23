@implementation MTSleepModeMonitor

- (MTSleepModeMonitor)initWithAlarmStorage:(id)a3 sleepCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MTSleepModeMonitor *v9;

  v6 = a4;
  v7 = a3;
  MTCurrentDateProvider();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MTSleepModeMonitor initWithAlarmStorage:sleepCoordinator:currentDateProvider:](self, "initWithAlarmStorage:sleepCoordinator:currentDateProvider:", v7, v6, v8);

  return v9;
}

- (MTSleepModeMonitor)initWithAlarmStorage:(id)a3 sleepCoordinator:(id)a4 currentDateProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  MTSleepModeMonitor *v12;
  NSObject *v13;
  uint64_t v14;
  id currentDateProvider;
  uint64_t v16;
  NAScheduler *serializer;
  uint64_t v18;
  DNDModeAssertionService *assertionService;
  DNDModeAssertionService *v20;
  MTSleepModeStateMachine *v21;
  MTSleepModeStateMachine *stateMachine;
  _QWORD v24[4];
  id v25;
  objc_super v26;
  uint8_t buf[4];
  MTSleepModeMonitor *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)MTSleepModeMonitor;
  v12 = -[MTSleepModeMonitor init](&v26, sel_init);
  if (v12)
  {
    MTLogForCategory(7);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v12;
      _os_log_impl(&dword_19AC4E000, v13, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
    }

    objc_storeStrong((id *)&v12->_alarmStorage, a3);
    objc_storeWeak((id *)&v12->_sleepCoordinator, v10);
    v14 = objc_msgSend(v11, "copy");
    currentDateProvider = v12->_currentDateProvider;
    v12->_currentDateProvider = (id)v14;

    +[MTScheduler serialSchedulerForObject:priority:](MTScheduler, "serialSchedulerForObject:priority:", v12, +[MTScheduler defaultPriority](MTScheduler, "defaultPriority"));
    v16 = objc_claimAutoreleasedReturnValue();
    serializer = v12->_serializer;
    v12->_serializer = (NAScheduler *)v16;

    objc_initWeak((id *)buf, v12);
    objc_msgSend(MEMORY[0x1E0D1D640], "serviceForClientIdentifier:", CFSTR("com.apple.mobiletimer.bedtime-mode"));
    v18 = objc_claimAutoreleasedReturnValue();
    assertionService = v12->_assertionService;
    v12->_assertionService = (DNDModeAssertionService *)v18;

    v20 = v12->_assertionService;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __80__MTSleepModeMonitor_initWithAlarmStorage_sleepCoordinator_currentDateProvider___block_invoke;
    v24[3] = &unk_1E39CC2A8;
    objc_copyWeak(&v25, (id *)buf);
    -[DNDModeAssertionService addAssertionUpdateListener:withCompletionHandler:](v20, "addAssertionUpdateListener:withCompletionHandler:", v12, v24);
    v21 = -[MTSleepModeStateMachine initWithDelegate:infoProvider:]([MTSleepModeStateMachine alloc], "initWithDelegate:infoProvider:", v12, v12);
    stateMachine = v12->_stateMachine;
    v12->_stateMachine = v21;

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }

  return v12;
}

void __80__MTSleepModeMonitor_initWithAlarmStorage_sleepCoordinator_currentDateProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  _BOOL4 v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  MTLogForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (v7)
      __80__MTSleepModeMonitor_initWithAlarmStorage_sleepCoordinator_currentDateProvider___block_invoke_cold_2((uint64_t)WeakRetained, (uint64_t)v4, v6);
  }
  else if (v7)
  {
    __80__MTSleepModeMonitor_initWithAlarmStorage_sleepCoordinator_currentDateProvider___block_invoke_cold_1((uint64_t)WeakRetained, v6);
  }

}

- (void)dealloc
{
  id v3;
  objc_super v4;

  -[DNDModeAssertionService removeAssertionUpdateListener:](self->_assertionService, "removeAssertionUpdateListener:", self);
  v3 = (id)-[DNDModeAssertionService invalidateActiveModeAssertionWithError:](self->_assertionService, "invalidateActiveModeAssertionWithError:", 0);
  v4.receiver = self;
  v4.super_class = (Class)MTSleepModeMonitor;
  -[MTSleepModeMonitor dealloc](&v4, sel_dealloc);
}

- (void)updateMonitorState
{
  NAScheduler *serializer;
  _QWORD v3[5];

  serializer = self->_serializer;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__MTSleepModeMonitor_updateMonitorState__block_invoke;
  v3[3] = &unk_1E39CB858;
  v3[4] = self;
  -[NAScheduler performBlock:](serializer, "performBlock:", v3);
}

uint64_t __40__MTSleepModeMonitor_updateMonitorState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "updateState:", 1);
}

- (MTAlarm)sleepAlarm
{
  return -[MTAlarmStorage sleepAlarm](self->_alarmStorage, "sleepAlarm");
}

- (NSDate)currentDate
{
  return (NSDate *)(*((uint64_t (**)(void))self->_currentDateProvider + 2))();
}

- (BOOL)isUserAsleep
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sleepCoordinator);
  v3 = objc_msgSend(WeakRetained, "isUserAsleep");

  return v3;
}

- (BOOL)isSleepModeEnabled:(BOOL *)a3
{
  return -[MTSleepModeMonitor isSleepModeEnabled:error:](self, "isSleepModeEnabled:error:", a3, 0);
}

- (BOOL)isSleepModeEnabled:(BOOL *)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  -[DNDModeAssertionService activeModeAssertionWithError:](self->_assertionService, "activeModeAssertionWithError:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "details");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 != 0;
}

- (NSDate)keepOffUntilDate
{
  void *v2;
  void *v3;

  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("MTKeepDndOffUntilDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (unint64_t)sleepModeTimeoutMinutes
{
  void *v2;
  unint64_t v3;

  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:defaultValue:", CFSTR("MTSleepTimeOutMinutesKey"), 60);

  return v3;
}

- (BOOL)stateMachine:(id)a3 engageSleepModeUntilDate:(id)a4 userEngaged:(BOOL)a5
{
  _BOOL4 v5;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  BOOL v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  BOOL v30;
  NSObject *v31;
  NSObject *v32;
  void *v34;
  id v35;
  id v36;
  uint8_t buf[4];
  MTSleepModeMonitor *v38;
  __int16 v39;
  NSObject *v40;
  __int16 v41;
  _BOOL4 v42;
  uint64_t v43;

  v5 = a5;
  v43 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  MTLogForCategory(7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v38 = self;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ engageUntilDate:userEngaged", buf, 0xCu);
  }

  -[MTSleepModeMonitor assertionService](self, "assertionService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  objc_msgSend(v9, "activeModeAssertionWithError:", &v36);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v36;

  -[NSObject dateByAddingTimeInterval:](v7, "dateByAddingTimeInterval:", (double)-[MTSleepModeMonitor sleepModeTimeoutMinutes](self, "sleepModeTimeoutMinutes") * 60.0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)v12;
  v15 = (void *)objc_msgSend(v13, "initWithStartDate:endDate:", v14, v12);

  objc_msgSend(MEMORY[0x1E0D1D630], "lifetimeWithDateInterval:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v10, "details");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lifetime");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqual:", v16);

    MTLogForCategory(7);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v19 && !v5)
    {
      if (v21)
      {
        *(_DWORD *)buf = 138543362;
        v38 = self;
        _os_log_impl(&dword_19AC4E000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ already have assertion", buf, 0xCu);
      }
      v22 = 1;
      v23 = v11;
      goto LABEL_29;
    }
    if (v21)
    {
      *(_DWORD *)buf = 138543874;
      v38 = self;
      v39 = 2114;
      v40 = v7;
      v41 = 1024;
      v42 = v5;
      _os_log_impl(&dword_19AC4E000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ updating active assertion with new end date %{public}@, isUserRequested %d", buf, 0x1Cu);
    }

  }
  objc_msgSend(MEMORY[0x1E0D1D618], "detailsWithIdentifier:modeIdentifier:lifetime:", CFSTR("com.apple.mobiletimer.sleep-mode.automatic"), CFSTR("com.apple.mobiletimer.mode.sleep"), v16);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v24, "mutableCopy");

  -[MTSleepModeMonitor sleepAlarm](self, "sleepAlarm");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "isEnabled"))
    v26 = v7;
  else
    v26 = 0;
  -[NSObject setUserVisibleEndDate:](v20, "setUserVisibleEndDate:", v26);

  MTLogForCategory(7);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v38 = self;
    v39 = 2114;
    v40 = v20;
    _os_log_impl(&dword_19AC4E000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ acquiring assertion with details %{public}@", buf, 0x16u);
  }

  -[MTSleepModeMonitor assertionService](self, "assertionService");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v11;
  objc_msgSend(v28, "takeModeAssertionWithDetails:error:", v20, &v35);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v35;

  if (v29)
    v30 = v23 == 0;
  else
    v30 = 0;
  v22 = v30;
  MTLogForCategory(7);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v22)
  {
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v38 = self;
      _os_log_impl(&dword_19AC4E000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully acquired assertion", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    -[MTSleepModeMonitor stateMachine:engageSleepModeUntilDate:userEngaged:].cold.1();
  }

LABEL_29:
  return v22;
}

- (void)stateMachineClearKeepSleepModeOff:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  MTSleepModeMonitor *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(7);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ clearKeepOff:", (uint8_t *)&v6, 0xCu);
  }

  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("MTKeepDndOffUntilDate"));

}

- (BOOL)stateMachine:(id)a3 disengageSleepModeUserRequested:(BOOL)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  BOOL v14;
  id v16;
  id v17;
  uint8_t buf[4];
  MTSleepModeMonitor *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(7);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = self;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ disengage:", buf, 0xCu);
  }

  -[MTSleepModeMonitor assertionService](self, "assertionService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v6, "activeModeAssertionWithError:", &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;

  if (v7)
  {
    -[MTSleepModeMonitor assertionService](self, "assertionService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v8;
    objc_msgSend(v9, "invalidateActiveModeAssertionWithError:", &v16);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v16;

    MTLogForCategory(7);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v10 || v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[MTSleepModeMonitor stateMachine:disengageSleepModeUserRequested:].cold.1();

      v14 = 0;
      v13 = v10;
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v19 = self;
        _os_log_impl(&dword_19AC4E000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully released assertion", buf, 0xCu);
      }
      v14 = 1;
      v11 = (id)v10;
    }
  }
  else
  {
    MTLogForCategory(7);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = self;
      _os_log_impl(&dword_19AC4E000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ there is no assertion", buf, 0xCu);
    }
    v14 = 1;
    v11 = v8;
  }

  return v14;
}

- (void)stateMachine:(id)a3 keepSleepModeOffUntilDate:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  MTSleepModeMonitor *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MTLogForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = self;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ keepOffUntilDate: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v5, CFSTR("MTKeepDndOffUntilDate"));

}

- (void)stateMachine:(id)a3 scheduleUpdateForSecondsFromNow:(double)a4
{
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  MTSleepModeMonitor *v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 2048;
    v13 = a4;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduleUpdateForSecondsFromNow: %f", buf, 0x16u);
  }

  v7 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__MTSleepModeMonitor_stateMachine_scheduleUpdateForSecondsFromNow___block_invoke;
  block[3] = &unk_1E39CB858;
  block[4] = self;
  dispatch_after(v7, v8, block);

}

uint64_t __67__MTSleepModeMonitor_stateMachine_scheduleUpdateForSecondsFromNow___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(7);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v9 = v3;
    v10 = 2114;
    v11 = CFSTR("sleep mode");
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ re-checking %{public}@", buf, 0x16u);
  }

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__MTSleepModeMonitor_stateMachine_scheduleUpdateForSecondsFromNow___block_invoke_18;
  v7[3] = &unk_1E39CB858;
  v7[4] = v4;
  return objc_msgSend(v5, "performBlock:", v7);
}

uint64_t __67__MTSleepModeMonitor_stateMachine_scheduleUpdateForSecondsFromNow___block_invoke_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "updateState:", 0);
}

- (BOOL)isEnabled
{
  return -[MTSleepModeMonitor isSleepModeEnabled:](self, "isSleepModeEnabled:", 0);
}

- (BOOL)sleepMode:(id *)a3
{
  return -[MTSleepModeMonitor isSleepModeEnabled:error:](self, "isSleepModeEnabled:error:", 0, a3);
}

- (void)userDisengagedSleepMode
{
  id v3;

  -[MTSleepModeMonitor currentDate](self, "currentDate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MTSleepModeMonitor userDisengagedSleepModeOnDate:](self, "userDisengagedSleepModeOnDate:", v3);

}

- (void)userDisengagedSleepModeOnDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MTSleepModeMonitor serializer](self, "serializer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__MTSleepModeMonitor_userDisengagedSleepModeOnDate___block_invoke;
  v7[3] = &unk_1E39CB7B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

void __52__MTSleepModeMonitor_userDisengagedSleepModeOnDate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const __CFString *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(7);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138543874;
    v7 = v3;
    v8 = 2114;
    v9 = CFSTR("sleep mode");
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ user manually turning off %{public}@ (%{public}@)", (uint8_t *)&v6, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sleepModeEnabled:userRequested:date:", 0, 1, *(_QWORD *)(a1 + 40));

}

- (void)modeAssertionService:(id)a3 didReceiveModeAssertionInvalidation:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  MTSleepModeMonitor *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MTLogForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ didReceiveModeAssertionInvalidation %{public}@", (uint8_t *)&v9, 0x16u);
  }

  v7 = objc_msgSend(v5, "reason");
  if (v7 == 2)
  {
    objc_msgSend(v5, "invalidationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTSleepModeMonitor userDisengagedSleepModeOnDate:](self, "userDisengagedSleepModeOnDate:", v8);

  }
  else if (v7 == 5)
  {
    -[MTSleepModeMonitor updateMonitorState](self, "updateMonitorState");
  }

}

- (void)sleepCoordinator:(id)a3 userWokeUp:(id)a4 sleepAlarm:(id)a5
{
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  MTSleepModeMonitor *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = CFSTR("sleep mode");
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ user woke up, turning off %{public}@ if it's on", buf, 0x16u);
  }

  -[MTSleepModeMonitor serializer](self, "serializer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__MTSleepModeMonitor_sleepCoordinator_userWokeUp_sleepAlarm___block_invoke;
  v8[3] = &unk_1E39CB858;
  v8[4] = self;
  objc_msgSend(v7, "performBlock:", v8);

}

void __61__MTSleepModeMonitor_sleepCoordinator_userWokeUp_sleepAlarm___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "userWokeUp");

}

- (void)sleepCoordinator:(id)a3 userWentToBed:(id)a4 sleepAlarm:(id)a5
{
  NSObject *v6;
  int v7;
  MTSleepModeMonitor *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = CFSTR("sleep mode");
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ user went to bed, checking %{public}@", (uint8_t *)&v7, 0x16u);
  }

  -[MTSleepModeMonitor updateMonitorState](self, "updateMonitorState");
}

- (void)sleepCoordinator:(id)a3 bedtimeReminderDidFire:(id)a4 sleepAlarm:(id)a5
{
  NSObject *v6;
  int v7;
  MTSleepModeMonitor *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = CFSTR("sleep mode");
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ bedtime reminder fired, checking %{public}@", (uint8_t *)&v7, 0x16u);
  }

  -[MTSleepModeMonitor updateMonitorState](self, "updateMonitorState");
}

- (void)sleepCoordinator:(id)a3 bedtimeReminderWasConfirmed:(id)a4 sleepAlarm:(id)a5
{
  NSObject *v6;
  int v7;
  MTSleepModeMonitor *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = CFSTR("sleep mode");
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ user went to bed, checking %{public}@", (uint8_t *)&v7, 0x16u);
  }

  -[MTSleepModeMonitor updateMonitorState](self, "updateMonitorState");
}

- (void)sleepCoordinator:(id)a3 bedtimeWasReached:(id)a4 sleepAlarm:(id)a5
{
  NSObject *v6;
  int v7;
  MTSleepModeMonitor *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = CFSTR("sleep mode");
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ it's the user's bedtime, checking %{public}@", (uint8_t *)&v7, 0x16u);
  }

  -[MTSleepModeMonitor updateMonitorState](self, "updateMonitorState");
}

- (void)sleepCoordinator:(id)a3 wakeUpAlarmDidFire:(id)a4 sleepAlarm:(id)a5
{
  NSObject *v6;
  int v7;
  MTSleepModeMonitor *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = CFSTR("sleep mode");
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ wake up alarm fired, checking %{public}@", (uint8_t *)&v7, 0x16u);
  }

  -[MTSleepModeMonitor updateMonitorState](self, "updateMonitorState");
}

- (void)sleepCoordinator:(id)a3 wakeUpAlarmWasSnoozed:(id)a4 sleepAlarm:(id)a5
{
  NSObject *v6;
  int v7;
  MTSleepModeMonitor *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = CFSTR("sleep mode");
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ wake up alarm snoozed, checking %{public}@", (uint8_t *)&v7, 0x16u);
  }

  -[MTSleepModeMonitor updateMonitorState](self, "updateMonitorState");
}

- (void)sleepCoordinator:(id)a3 sleepAlarmDidChange:(id)a4
{
  __CFString *v5;
  __CFString *v6;
  NSObject *v7;
  int v8;
  MTSleepModeMonitor *v9;
  __int16 v10;
  __CFString *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("modified");
  if (!a4)
    v5 = CFSTR("removed");
  v6 = v5;
  MTLogForCategory(7);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543874;
    v9 = self;
    v10 = 2114;
    v11 = v6;
    v12 = 2114;
    v13 = CFSTR("sleep mode");
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ user %{public}@ sleep alarm, checking %{public}@", (uint8_t *)&v8, 0x20u);
  }

  -[MTSleepModeMonitor updateMonitorState](self, "updateMonitorState");
}

- (void)timeListener:(id)a3 didDetectSignificantTimeChangeWithCompletionBlock:(id)a4
{
  id v5;
  NSObject *v6;
  NAScheduler *serializer;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  MTSleepModeMonitor *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MTLogForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v12 = self;
    v13 = 2114;
    v14 = CFSTR("sleep mode");
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ significant time change detected, checking %{public}@", buf, 0x16u);
  }

  serializer = self->_serializer;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__MTSleepModeMonitor_timeListener_didDetectSignificantTimeChangeWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E39CB880;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  -[NAScheduler performBlock:](serializer, "performBlock:", v9);

}

uint64_t __85__MTSleepModeMonitor_timeListener_didDetectSignificantTimeChangeWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "updateState:", 1);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)printDiagnostics
{
  _BOOL4 v2;
  NSObject *v3;
  void *v4;
  id v5;
  NSObject *v6;
  unsigned __int8 v7;
  uint8_t buf[4];
  _DWORD v9[7];

  *(_QWORD *)&v9[5] = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v2 = -[MTSleepModeMonitor isSleepModeEnabled:](self, "isSleepModeEnabled:", &v7);
  MTLogForCategory(7);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v9 = v4;
    v5 = v4;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "-----%@-----", buf, 0xCu);

  }
  MTLogForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v9[0] = v2;
    LOWORD(v9[1]) = 1024;
    *(_DWORD *)((char *)&v9[1] + 2) = v7;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "isEnabled: %d, isUserRequested: %d", buf, 0xEu);
  }

}

- (id)gatherDiagnostics
{
  const __CFString *v2;
  const __CFString *v3;
  char v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v5 = 0;
  if (-[MTSleepModeMonitor isSleepModeEnabled:](self, "isSleepModeEnabled:", &v5))
    v2 = CFSTR("YES");
  else
    v2 = CFSTR("NO");
  v6[0] = CFSTR("isEnabled");
  v6[1] = CFSTR("isUserRequested");
  if (v5)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  v7[0] = v2;
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MTAlarmStorage)alarmStorage
{
  return self->_alarmStorage;
}

- (void)setAlarmStorage:(id)a3
{
  objc_storeStrong((id *)&self->_alarmStorage, a3);
}

- (MTSleepCoordinator)sleepCoordinator
{
  return (MTSleepCoordinator *)objc_loadWeakRetained((id *)&self->_sleepCoordinator);
}

- (void)setSleepCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_sleepCoordinator, a3);
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (void)setCurrentDateProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (MTSleepModeStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (DNDModeAssertionService)assertionService
{
  return self->_assertionService;
}

- (void)setAssertionService:(id)a3
{
  objc_storeStrong((id *)&self->_assertionService, a3);
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_assertionService, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_destroyWeak((id *)&self->_sleepCoordinator);
  objc_storeStrong((id *)&self->_alarmStorage, 0);
}

void __80__MTSleepModeMonitor_initWithAlarmStorage_sleepCoordinator_currentDateProvider___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_19AC4E000, a2, OS_LOG_TYPE_ERROR, "%{public}@ Added assertion update listener", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __80__MTSleepModeMonitor_initWithAlarmStorage_sleepCoordinator_currentDateProvider___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_19AC4E000, a2, a3, "%{public}@ Failed adding assertion update listener: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

- (void)stateMachine:engageSleepModeUntilDate:userEngaged:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_19AC4E000, v0, v1, "%{public}@ Failed to acquire assertion with %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)stateMachine:disengageSleepModeUserRequested:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_19AC4E000, v0, v1, "%{public}@ Failed to release assertion with %{public}@");
  OUTLINED_FUNCTION_2();
}

@end

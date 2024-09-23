@implementation MTSleepCoordinator

- (MTSleepCoordinator)initWithAlarmStorage:(id)a3
{
  id v4;
  void *v5;
  MTSleepCoordinator *v6;

  v4 = a3;
  MTCurrentDateProvider();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MTSleepCoordinator initWithAlarmStorage:currentDateProvider:](self, "initWithAlarmStorage:currentDateProvider:", v4, v5);

  return v6;
}

- (MTSleepCoordinator)initWithAlarmStorage:(id)a3 currentDateProvider:(id)a4
{
  id v7;
  id v8;
  MTSleepCoordinator *v9;
  NSObject *v10;
  uint64_t v11;
  NAScheduler *serializer;
  uint64_t v13;
  MTObserverStore *observers;
  uint64_t v15;
  id currentDateProvider;
  uint64_t v17;
  MTXPCScheduler *alarmTimeoutScheduler;
  uint64_t v19;
  NAFuture *sleepStateResolved;
  MTSleepCoordinatorStateMachine *v21;
  MTSleepCoordinatorStateMachine *stateMachine;
  objc_super v24;
  uint8_t buf[4];
  MTSleepCoordinator *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)MTSleepCoordinator;
  v9 = -[MTSleepCoordinator init](&v24, sel_init);
  if (v9)
  {
    MTLogForCategory(7);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v9;
      _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
    }

    +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", CFSTR("com.apple.MTSleepCoordinator.access-queue"), +[MTScheduler defaultPriority](MTScheduler, "defaultPriority"));
    v11 = objc_claimAutoreleasedReturnValue();
    serializer = v9->_serializer;
    v9->_serializer = (NAScheduler *)v11;

    v13 = objc_opt_new();
    observers = v9->_observers;
    v9->_observers = (MTObserverStore *)v13;

    objc_storeStrong((id *)&v9->_alarmStorage, a3);
    objc_msgSend(v7, "registerObserver:", v9);
    v15 = objc_msgSend(v8, "copy");
    currentDateProvider = v9->_currentDateProvider;
    v9->_currentDateProvider = (id)v15;

    +[MTXPCScheduler xpcSchedulerWithEvent:](MTXPCScheduler, "xpcSchedulerWithEvent:", CFSTR("com.apple.MTSleepCoordinator.wakeupalarmtimeout-event"));
    v17 = objc_claimAutoreleasedReturnValue();
    alarmTimeoutScheduler = v9->_alarmTimeoutScheduler;
    v9->_alarmTimeoutScheduler = (MTXPCScheduler *)v17;

    v19 = objc_opt_new();
    sleepStateResolved = v9->_sleepStateResolved;
    v9->_sleepStateResolved = (NAFuture *)v19;

    v21 = -[MTSleepCoordinatorStateMachine initWithDelegate:infoProvider:]([MTSleepCoordinatorStateMachine alloc], "initWithDelegate:infoProvider:", v9, v9);
    stateMachine = v9->_stateMachine;
    v9->_stateMachine = v21;

  }
  return v9;
}

- (void)setSleepModeMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_sleepModeMonitor, a3);
}

- (void)updateSleepState
{
  id v3;

  -[MTAlarmStorage sleepAlarm](self->_alarmStorage, "sleepAlarm");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MTSleepCoordinator updateSleepStateWithSleepAlarm:](self, "updateSleepStateWithSleepAlarm:", v3);

}

- (void)updateSleepStateWithSleepAlarm:(id)a3
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
  v7[2] = __53__MTSleepCoordinator_updateSleepStateWithSleepAlarm___block_invoke;
  v7[3] = &unk_1E39CB7B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NAScheduler performBlock:](serializer, "performBlock:", v7);

}

uint64_t __53__MTSleepCoordinator_updateSleepStateWithSleepAlarm___block_invoke(uint64_t a1)
{
  void *v2;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateState");

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "finishWithNoResult");
}

- (BOOL)isUserAsleep
{
  NAFuture *sleepStateResolved;
  void *v3;
  void *v4;
  char v5;
  _QWORD v7[5];

  sleepStateResolved = self->_sleepStateResolved;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__MTSleepCoordinator_isUserAsleep__block_invoke;
  v7[3] = &unk_1E39CCF30;
  v7[4] = self;
  -[NAFuture flatMap:](sleepStateResolved, "flatMap:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mtSynchronousResult:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

id __34__MTSleepCoordinator_isUserAsleep__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v2 = (void *)objc_opt_new();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__MTSleepCoordinator_isUserAsleep__block_invoke_2;
  v8[3] = &unk_1E39CB7B0;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v10 = v5;
  objc_msgSend(v3, "performBlock:", v8);
  v6 = v4;

  return v6;
}

void __34__MTSleepCoordinator_isUserAsleep__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "stateMachine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "numberWithBool:", objc_msgSend(v4, "isUserAsleep"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithResult:", v3);

}

- (BOOL)isSleepModeOn
{
  return -[MTSleepModeMonitor sleepMode:](self->_sleepModeMonitor, "sleepMode:", 0);
}

- (MTAlarm)sleepAlarm
{
  return self->_cachedSleepAlarm;
}

- (NSDate)currentDate
{
  return (NSDate *)(*((uint64_t (**)(void))self->_currentDateProvider + 2))();
}

- (unint64_t)sleepTimeOutMinutes
{
  void *v2;
  unint64_t v3;

  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:defaultValue:", CFSTR("MTSleepTimeOutMinutesKey"), 60);

  return v3;
}

- (void)stateMachineUserWentToBed:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  MTObserverStore *observers;
  _QWORD v7[5];
  uint8_t buf[4];
  MTSleepCoordinator *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(7);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = self;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ userWentToBed", buf, 0xCu);
  }

  MTLogForCategory(7);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = self;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ telling observers user went to bed", buf, 0xCu);
  }

  observers = self->_observers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__MTSleepCoordinator_stateMachineUserWentToBed___block_invoke;
  v7[3] = &unk_1E39CCF58;
  v7[4] = self;
  -[MTObserverStore enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v7);
}

void __48__MTSleepCoordinator_stateMachineUserWentToBed___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    (*(void (**)(void))(*(_QWORD *)(v3 + 72) + 16))();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sleepCoordinator:userWentToBed:sleepAlarm:", v3, v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  }
}

- (void)stateMachineUserWokeUp:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  MTObserverStore *observers;
  _QWORD v7[5];
  uint8_t buf[4];
  MTSleepCoordinator *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(7);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = self;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ userWokeUp", buf, 0xCu);
  }

  MTLogForCategory(7);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = self;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ telling observers user woke up", buf, 0xCu);
  }

  observers = self->_observers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__MTSleepCoordinator_stateMachineUserWokeUp___block_invoke;
  v7[3] = &unk_1E39CCF58;
  v7[4] = self;
  -[MTObserverStore enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v7);
}

void __45__MTSleepCoordinator_stateMachineUserWokeUp___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    (*(void (**)(void))(*(_QWORD *)(v3 + 72) + 16))();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sleepCoordinator:userWokeUp:sleepAlarm:", v3, v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  }
}

- (void)stateMachine:(id)a3 dismissWakeUpAlarm:(id)a4 dismissAction:(unint64_t)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  MTSleepCoordinator *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  MTLogForCategory(7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    MTDismissAlarmActionDescription(a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = self;
    v15 = 2114;
    v16 = v9;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissWakeUpAlarm (%{public}@)", (uint8_t *)&v13, 0x16u);

  }
  -[MTSleepCoordinator alarmStorage](self, "alarmStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTAlarmStorage sleepAlarm](self->_alarmStorage, "sleepAlarm");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "alarmIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dismissAlarmWithIdentifier:dismissDate:dismissAction:withCompletion:source:", v12, v7, a5, 0, self);

}

- (void)stateMachine:(id)a3 shouldScheduleAlarmTimeoutForSecondsFromNow:(double)a4
{
  NSObject *v6;
  int v7;
  MTSleepCoordinator *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ shouldScheduleAlarmTimeoutForSecondsFromNow", (uint8_t *)&v7, 0xCu);
  }

  -[MTXPCScheduler scheduleTimerForSeconds:](self->_alarmTimeoutScheduler, "scheduleTimerForSeconds:", a4);
}

- (void)registerObserver:(id)a3
{
  -[MTObserverStore addObserver:](self->_observers, "addObserver:", a3);
}

- (void)source:(id)a3 didAddAlarms:(id)a4
{
  void *v5;
  NSObject *v6;
  int v7;
  MTSleepCoordinator *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "na_firstObjectPassingTest:", &__block_literal_global_19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    MTLogForCategory(7);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = self;
      _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ telling observers about added sleep alarm", (uint8_t *)&v7, 0xCu);
    }

    -[MTSleepCoordinator notifyObserversForSleepAlarmChange:](self, "notifyObserversForSleepAlarmChange:", v5);
    -[MTSleepCoordinator updateSleepStateWithSleepAlarm:](self, "updateSleepStateWithSleepAlarm:", v5);
  }

}

uint64_t __42__MTSleepCoordinator_source_didAddAlarms___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSleepAlarm");
}

- (void)source:(id)a3 didRemoveAlarms:(id)a4
{
  NSObject *v5;
  int v6;
  MTSleepCoordinator *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a4, "na_any:", &__block_literal_global_19))
  {
    MTLogForCategory(7);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = self;
      _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ telling observers about removed sleep alarm", (uint8_t *)&v6, 0xCu);
    }

    -[MTSleepCoordinator notifyObserversForSleepAlarmChange:](self, "notifyObserversForSleepAlarmChange:", 0);
    -[MTSleepCoordinator updateSleepStateWithSleepAlarm:](self, "updateSleepStateWithSleepAlarm:", 0);
  }
}

uint64_t __45__MTSleepCoordinator_source_didRemoveAlarms___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSleepAlarm");
}

- (void)source:(id)a3 didUpdateAlarms:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a4, "na_firstObjectPassingTest:", &__block_literal_global_20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    -[MTSleepCoordinator notifyObserversForSleepAlarmChangeIfNecessary:](self, "notifyObserversForSleepAlarmChangeIfNecessary:", v5);
    -[MTSleepCoordinator updateSleepStateWithSleepAlarm:](self, "updateSleepStateWithSleepAlarm:", v6);
    v5 = v6;
  }

}

uint64_t __45__MTSleepCoordinator_source_didUpdateAlarms___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSleepAlarm");
}

- (void)notifyObserversForSleepAlarmChange:(id)a3
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
  v7[2] = __57__MTSleepCoordinator_notifyObserversForSleepAlarmChange___block_invoke;
  v7[3] = &unk_1E39CB7B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NAScheduler performBlock:](serializer, "performBlock:", v7);

}

uint64_t __57__MTSleepCoordinator_notifyObserversForSleepAlarmChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForSleepAlarmChange:", *(_QWORD *)(a1 + 40));
}

- (void)_notifyObserversForSleepAlarmChange:(id)a3
{
  id v4;
  MTObserverStore *observers;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__MTSleepCoordinator__notifyObserversForSleepAlarmChange___block_invoke;
  v7[3] = &unk_1E39CCFA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[MTObserverStore enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v7);

}

void __58__MTSleepCoordinator__notifyObserversForSleepAlarmChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sleepCoordinator:sleepAlarmDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)notifyObserversForSleepAlarmChangeIfNecessary:(id)a3
{
  id v4;
  NAScheduler *serializer;
  id v6;
  _QWORD v7[4];
  id v8;
  MTSleepCoordinator *v9;

  v4 = a3;
  serializer = self->_serializer;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__MTSleepCoordinator_notifyObserversForSleepAlarmChangeIfNecessary___block_invoke;
  v7[3] = &unk_1E39CB7B0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[NAScheduler performBlock:](serializer, "performBlock:", v7);

}

void __68__MTSleepCoordinator_notifyObserversForSleepAlarmChangeIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (uint64_t *)(a1 + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
  if (*(_QWORD *)(a1 + 32))
  {
    if (!v3)
      goto LABEL_8;
  }
  else if (v3)
  {
LABEL_8:
    MTLogForCategory(7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *v2;
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ telling observers about modified sleep alarm", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_notifyObserversForSleepAlarmChange:", *(_QWORD *)(a1 + 32));
    return;
  }
  +[MTChangeSet changeSetWithChangesFromObject:toObject:](MTChangeSet, "changeSetWithChangesFromObject:toObject:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MTLogForCategory(7);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __68__MTSleepCoordinator_notifyObserversForSleepAlarmChangeIfNecessary___block_invoke_cold_2(v2, (uint64_t)v4, v5);

  +[MTAlarm propertiesAffectingNotification](MTAlarm, "propertiesAffectingNotification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "hasChangesInProperties:", v6);

  if (v7)
    goto LABEL_8;
  MTLogForCategory(7);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __68__MTSleepCoordinator_notifyObserversForSleepAlarmChangeIfNecessary___block_invoke_cold_1(v2, v10);

}

- (void)source:(id)a3 didFireAlarm:(id)a4 triggerType:(unint64_t)a5
{
  void *v7;
  id v8;

  v8 = a4;
  if (objc_msgSend(v8, "isSleepAlarm"))
  {
    if (a5 == 7)
    {
      (*((void (**)(void))self->_currentDateProvider + 2))();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTSleepCoordinator handleBedtimeForAlarm:date:](self, "handleBedtimeForAlarm:date:", v8, v7);
LABEL_10:

      goto LABEL_11;
    }
    if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      objc_msgSend(v8, "firedDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTSleepCoordinator handleWakeUpAlarmForAlarm:date:](self, "handleWakeUpAlarmForAlarm:date:", v8, v7);
      goto LABEL_10;
    }
    if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      objc_msgSend(v8, "firedDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTSleepCoordinator handleBedtimeReminderForAlarm:date:](self, "handleBedtimeReminderForAlarm:date:", v8, v7);
      goto LABEL_10;
    }
    if (a5 == 8)
    {
      (*((void (**)(void))self->_currentDateProvider + 2))();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTSleepCoordinator handleWakeUpTimeForAlarm:date:](self, "handleWakeUpTimeForAlarm:date:", v8, v7);
      goto LABEL_10;
    }
  }
LABEL_11:

}

- (void)source:(id)a3 didSnoozeAlarm:(id)a4 snoozeAction:(unint64_t)a5
{
  void *v7;
  id v8;

  v8 = a4;
  if (objc_msgSend(v8, "isSleepAlarm"))
  {
    if (a5 == 2)
    {
      objc_msgSend(v8, "snoozeFireDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTSleepCoordinator handleSnoozeForAlarm:date:](self, "handleSnoozeForAlarm:date:", v8, v7);
      goto LABEL_6;
    }
    if (a5 == 1)
    {
      objc_msgSend(v8, "bedtimeSnoozeFireDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTSleepCoordinator handleSnoozeOfGoToBedNotificationForAlarm:date:](self, "handleSnoozeOfGoToBedNotificationForAlarm:date:", v8, v7);
LABEL_6:

    }
  }

}

- (void)source:(id)a3 didDismissAlarm:(id)a4 dismissAction:(unint64_t)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  MTSleepCoordinator *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (objc_msgSend(v7, "isSleepAlarm"))
  {
    MTLogForCategory(7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      MTDismissAlarmActionDescription(a5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = self;
      v13 = 2114;
      v14 = v9;
      _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ sleep alarm dismissed: (%{public}@)", (uint8_t *)&v11, 0x16u);

    }
    if (a5 == 2)
    {
      objc_msgSend(v7, "bedtimeDismissedDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTSleepCoordinator handleConfirmationOfGoToBedNotificationForAlarm:date:](self, "handleConfirmationOfGoToBedNotificationForAlarm:date:", v7, v10);
LABEL_8:

      goto LABEL_9;
    }
    if (MTDismissAlarmActionCountsAsWakeUp(a5))
    {
      objc_msgSend(v7, "dismissedDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTSleepCoordinator handleDismissForAlarm:dismissAction:date:](self, "handleDismissForAlarm:dismissAction:date:", v7, a5, v10);
      goto LABEL_8;
    }
  }
LABEL_9:

}

- (void)sleepSessionTracker:(id)a3 sessionDidComplete:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[MTAlarmStorage sleepAlarm](self->_alarmStorage, "sleepAlarm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    -[MTSleepCoordinator currentDate](self, "currentDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[MTSleepCoordinator handleSleepSessionEndedForAlarm:date:reason:](self, "handleSleepSessionEndedForAlarm:date:reason:", v5, v7, objc_msgSend(v8, "endReason"));
  if (!v6)

}

- (void)handleBedtimeReminderForAlarm:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MTObserverStore *observers;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  MTSleepCoordinator *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MTSleepCoordinator updateSleepStateWithSleepAlarm:](self, "updateSleepStateWithSleepAlarm:", v6);
  MTLogForCategory(7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v16 = self;
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ telling observers bedtime reminder fired at %{public}@", buf, 0x16u);
  }

  observers = self->_observers;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__MTSleepCoordinator_handleBedtimeReminderForAlarm_date___block_invoke;
  v12[3] = &unk_1E39CCFC8;
  v12[4] = self;
  v13 = v7;
  v14 = v6;
  v10 = v6;
  v11 = v7;
  -[MTObserverStore enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v12);

}

void __57__MTSleepCoordinator_handleBedtimeReminderForAlarm_date___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sleepCoordinator:bedtimeReminderDidFire:sleepAlarm:", a1[4], a1[5], a1[6]);

}

- (void)handleConfirmationOfGoToBedNotificationForAlarm:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NAScheduler *serializer;
  NSObject *v10;
  MTObserverStore *observers;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[5];
  uint8_t buf[4];
  MTSleepCoordinator *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  serializer = self->_serializer;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__MTSleepCoordinator_handleConfirmationOfGoToBedNotificationForAlarm_date___block_invoke;
  v17[3] = &unk_1E39CB858;
  v17[4] = self;
  -[NAScheduler performBlock:](serializer, "performBlock:", v17);
  MTLogForCategory(7);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v19 = self;
    v20 = 2114;
    v21 = v7;
    _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ telling observers bedtime reminder was confirmed at %{public}@", buf, 0x16u);
  }

  observers = self->_observers;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __75__MTSleepCoordinator_handleConfirmationOfGoToBedNotificationForAlarm_date___block_invoke_27;
  v14[3] = &unk_1E39CCFC8;
  v14[4] = self;
  v15 = v7;
  v16 = v6;
  v12 = v6;
  v13 = v7;
  -[MTObserverStore enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v14);

}

void __75__MTSleepCoordinator_handleConfirmationOfGoToBedNotificationForAlarm_date___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "userWentToBed");

}

void __75__MTSleepCoordinator_handleConfirmationOfGoToBedNotificationForAlarm_date___block_invoke_27(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sleepCoordinator:bedtimeReminderWasConfirmed:sleepAlarm:", a1[4], a1[5], a1[6]);

}

- (void)handleSnoozeOfGoToBedNotificationForAlarm:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MTObserverStore *observers;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  MTSleepCoordinator *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MTSleepCoordinator updateSleepStateWithSleepAlarm:](self, "updateSleepStateWithSleepAlarm:", v6);
  MTLogForCategory(7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v16 = self;
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ telling observers bedtime reminder was snoozed until %{public}@", buf, 0x16u);
  }

  observers = self->_observers;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__MTSleepCoordinator_handleSnoozeOfGoToBedNotificationForAlarm_date___block_invoke;
  v12[3] = &unk_1E39CCFC8;
  v12[4] = self;
  v13 = v7;
  v14 = v6;
  v10 = v6;
  v11 = v7;
  -[MTObserverStore enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v12);

}

void __69__MTSleepCoordinator_handleSnoozeOfGoToBedNotificationForAlarm_date___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sleepCoordinator:bedtimeReminderWasSnoozed:sleepAlarm:", a1[4], a1[5], a1[6]);

}

- (void)handleBedtimeForAlarm:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NAScheduler *serializer;
  id v10;
  NSObject *v11;
  MTObserverStore *observers;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  MTSleepCoordinator *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  serializer = self->_serializer;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __49__MTSleepCoordinator_handleBedtimeForAlarm_date___block_invoke;
  v18[3] = &unk_1E39CB7B0;
  v18[4] = self;
  v10 = v7;
  v19 = v10;
  -[NAScheduler performBlock:](serializer, "performBlock:", v18);
  MTLogForCategory(7);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = self;
    v22 = 2114;
    v23 = v10;
    _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ telling observers bedtime was reached at %{public}@", buf, 0x16u);
  }

  observers = self->_observers;
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __49__MTSleepCoordinator_handleBedtimeForAlarm_date___block_invoke_32;
  v15[3] = &unk_1E39CCFC8;
  v15[4] = self;
  v16 = v10;
  v17 = v6;
  v13 = v6;
  v14 = v10;
  -[MTObserverStore enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v15);

}

void __49__MTSleepCoordinator_handleBedtimeForAlarm_date___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userBedTimeReached:", *(_QWORD *)(a1 + 40));

}

void __49__MTSleepCoordinator_handleBedtimeForAlarm_date___block_invoke_32(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sleepCoordinator:bedtimeWasReached:sleepAlarm:", a1[4], a1[5], a1[6]);

}

- (void)handleWakeUpTimeForAlarm:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NAScheduler *serializer;
  id v10;
  NSObject *v11;
  MTObserverStore *observers;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  MTSleepCoordinator *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  serializer = self->_serializer;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __52__MTSleepCoordinator_handleWakeUpTimeForAlarm_date___block_invoke;
  v18[3] = &unk_1E39CB7B0;
  v18[4] = self;
  v10 = v7;
  v19 = v10;
  -[NAScheduler performBlock:](serializer, "performBlock:", v18);
  MTLogForCategory(7);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = self;
    v22 = 2114;
    v23 = v10;
    _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ telling observers waketime time was reached at %{public}@", buf, 0x16u);
  }

  observers = self->_observers;
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __52__MTSleepCoordinator_handleWakeUpTimeForAlarm_date___block_invoke_35;
  v15[3] = &unk_1E39CCFC8;
  v15[4] = self;
  v16 = v10;
  v17 = v6;
  v13 = v6;
  v14 = v10;
  -[MTObserverStore enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v15);

}

void __52__MTSleepCoordinator_handleWakeUpTimeForAlarm_date___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userWakeTimeReached:", *(_QWORD *)(a1 + 40));

}

void __52__MTSleepCoordinator_handleWakeUpTimeForAlarm_date___block_invoke_35(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sleepCoordinator:waketimeWasReached:sleepAlarm:", a1[4], a1[5], a1[6]);

}

- (void)handleWakeUpAlarmForAlarm:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NAScheduler *serializer;
  NSObject *v10;
  MTObserverStore *observers;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[5];
  uint8_t buf[4];
  MTSleepCoordinator *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  serializer = self->_serializer;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __53__MTSleepCoordinator_handleWakeUpAlarmForAlarm_date___block_invoke;
  v17[3] = &unk_1E39CB858;
  v17[4] = self;
  -[NAScheduler performBlock:](serializer, "performBlock:", v17);
  MTLogForCategory(7);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v19 = self;
    v20 = 2114;
    v21 = v7;
    _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ telling observers wake up alarm fired at %{public}@", buf, 0x16u);
  }

  observers = self->_observers;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __53__MTSleepCoordinator_handleWakeUpAlarmForAlarm_date___block_invoke_38;
  v14[3] = &unk_1E39CCFC8;
  v14[4] = self;
  v15 = v7;
  v16 = v6;
  v12 = v6;
  v13 = v7;
  -[MTObserverStore enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v14);

}

void __53__MTSleepCoordinator_handleWakeUpAlarmForAlarm_date___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "userWakeUpAlarmFired");

}

void __53__MTSleepCoordinator_handleWakeUpAlarmForAlarm_date___block_invoke_38(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sleepCoordinator:wakeUpAlarmDidFire:sleepAlarm:", a1[4], a1[5], a1[6]);

}

- (void)handleSnoozeForAlarm:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MTObserverStore *observers;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  MTSleepCoordinator *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MTXPCScheduler unscheduleTimer](self->_alarmTimeoutScheduler, "unscheduleTimer");
  -[MTSleepCoordinator updateSleepStateWithSleepAlarm:](self, "updateSleepStateWithSleepAlarm:", v6);
  MTLogForCategory(7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v16 = self;
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ telling observers wake up alarm was snoozed until %{public}@", buf, 0x16u);
  }

  observers = self->_observers;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__MTSleepCoordinator_handleSnoozeForAlarm_date___block_invoke;
  v12[3] = &unk_1E39CCFC8;
  v12[4] = self;
  v13 = v7;
  v14 = v6;
  v10 = v6;
  v11 = v7;
  -[MTObserverStore enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v12);

}

void __48__MTSleepCoordinator_handleSnoozeForAlarm_date___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sleepCoordinator:wakeUpAlarmWasSnoozed:sleepAlarm:", a1[4], a1[5], a1[6]);

}

- (void)handleDismissForAlarm:(id)a3 dismissAction:(unint64_t)a4 date:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NAScheduler *serializer;
  NSObject *v12;
  void *v13;
  MTObserverStore *observers;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  unint64_t v20;
  _QWORD v21[5];
  uint8_t buf[4];
  MTSleepCoordinator *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[MTXPCScheduler unscheduleTimer](self->_alarmTimeoutScheduler, "unscheduleTimer");
  v10 = MEMORY[0x1E0C809B0];
  serializer = self->_serializer;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __63__MTSleepCoordinator_handleDismissForAlarm_dismissAction_date___block_invoke;
  v21[3] = &unk_1E39CB858;
  v21[4] = self;
  -[NAScheduler performBlock:](serializer, "performBlock:", v21);
  MTLogForCategory(7);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    MTDismissAlarmActionDescription(a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = self;
    v24 = 2114;
    v25 = v9;
    v26 = 2114;
    v27 = v13;
    _os_log_impl(&dword_19AC4E000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ telling observers wake up alarm was dismissed at %{public}@ (%{public}@)", buf, 0x20u);

  }
  observers = self->_observers;
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __63__MTSleepCoordinator_handleDismissForAlarm_dismissAction_date___block_invoke_43;
  v17[3] = &unk_1E39CCFF0;
  v17[4] = self;
  v18 = v9;
  v19 = v8;
  v20 = a4;
  v15 = v8;
  v16 = v9;
  -[MTObserverStore enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v17);

}

void __63__MTSleepCoordinator_handleDismissForAlarm_dismissAction_date___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "userWokeUp");

}

void __63__MTSleepCoordinator_handleDismissForAlarm_dismissAction_date___block_invoke_43(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sleepCoordinator:wakeUpAlarmWasDismissed:dismissAction:sleepAlarm:", a1[4], a1[5], a1[7], a1[6]);

}

- (void)handleSleepSessionEndedForAlarm:(id)a3 date:(id)a4 reason:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  MTObserverStore *observers;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  unint64_t v17;
  uint8_t buf[4];
  MTSleepCoordinator *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  MTLogForCategory(7);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v19 = self;
    v20 = 2114;
    v21 = CFSTR("sleep session");
    v22 = 2114;
    v23 = v9;
    _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ telling observers %{public}@ ended at %{public}@", buf, 0x20u);
  }

  observers = self->_observers;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__MTSleepCoordinator_handleSleepSessionEndedForAlarm_date_reason___block_invoke;
  v14[3] = &unk_1E39CCFF0;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v17 = a5;
  v12 = v8;
  v13 = v9;
  -[MTObserverStore enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v14);

}

void __66__MTSleepCoordinator_handleSleepSessionEndedForAlarm_date_reason___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sleepCoordinator:sleepSessionEnded:reason:sleepAlarm:", a1[4], a1[5], a1[7], a1[6]);

}

- (void)timeListener:(id)a3 didDetectSignificantTimeChangeWithCompletionBlock:(id)a4
{
  NSObject *v5;
  int v6;
  MTSleepCoordinator *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(7);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ significant time change detected", (uint8_t *)&v6, 0xCu);
  }

  -[MTSleepCoordinator updateSleepState](self, "updateSleepState");
}

- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.MTSleepCoordinator.wakeupalarmtimeout-event"), a4);
}

- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  NAScheduler *serializer;
  _QWORD v10[5];

  v6 = (void (**)(_QWORD))a5;
  -[MTSleepCoordinator alarmStorage](self, "alarmStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sleepAlarm");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    serializer = self->_serializer;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __59__MTSleepCoordinator_handleNotification_ofType_completion___block_invoke;
    v10[3] = &unk_1E39CB858;
    v10[4] = self;
    -[NAScheduler performBlock:](serializer, "performBlock:", v10);
  }
  if (v6)
    v6[2](v6);

}

void __59__MTSleepCoordinator_handleNotification_ofType_completion___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "wakeUpAlarmTimedOut");

}

- (void)pairedDevicePreferencesChanged:(id)a3
{
  NSObject *v4;
  int v5;
  MTSleepCoordinator *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(7);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ pairedDevicePreferencesChanged", (uint8_t *)&v5, 0xCu);
  }

  -[MTSleepCoordinator updateSleepState](self, "updateSleepState");
}

- (id)sourceIdentifier
{
  return CFSTR("MTSleepCoordinator");
}

- (void)printDiagnostics
{
  NSObject *v3;
  NSObject *v4;
  _BOOL4 v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(7);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "-----MTSleepCoordinator-----", (uint8_t *)&v6, 2u);
  }

  MTLogForCategory(7);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[MTSleepCoordinator isUserAsleep](self, "isUserAsleep");
    v6 = 138412546;
    v7 = CFSTR("isUserAsleep");
    v8 = 1024;
    v9 = v5;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%@: %d", (uint8_t *)&v6, 0x12u);
  }

}

- (id)gatherDiagnostics
{
  _BOOL4 v2;
  const __CFString *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("isUserAsleep");
  v2 = -[MTSleepCoordinator isUserAsleep](self, "isUserAsleep");
  v3 = CFSTR("NO");
  if (v2)
    v3 = CFSTR("YES");
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MTSleepCoordinatorStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (MTAlarm)cachedSleepAlarm
{
  return self->_cachedSleepAlarm;
}

- (void)setCachedSleepAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSleepAlarm, a3);
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (NAFuture)sleepStateResolved
{
  return self->_sleepStateResolved;
}

- (void)setSleepStateResolved:(id)a3
{
  objc_storeStrong((id *)&self->_sleepStateResolved, a3);
}

- (MTObserverStore)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (MTAlarmStorage)alarmStorage
{
  return self->_alarmStorage;
}

- (void)setAlarmStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (MTXPCScheduler)alarmTimeoutScheduler
{
  return self->_alarmTimeoutScheduler;
}

- (void)setAlarmTimeoutScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_alarmTimeoutScheduler, a3);
}

- (MTSleepModeMonitor)sleepModeMonitor
{
  return self->_sleepModeMonitor;
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (void)setCurrentDateProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_storeStrong((id *)&self->_sleepModeMonitor, 0);
  objc_storeStrong((id *)&self->_alarmTimeoutScheduler, 0);
  objc_storeStrong((id *)&self->_alarmStorage, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_sleepStateResolved, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_cachedSleepAlarm, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
}

void __68__MTSleepCoordinator_notifyObserversForSleepAlarmChangeIfNecessary___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_debug_impl(&dword_19AC4E000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ sleep alarm changes unimportant.", (uint8_t *)&v3, 0xCu);
}

void __68__MTSleepCoordinator_notifyObserversForSleepAlarmChangeIfNecessary___block_invoke_cold_2(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138543618;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_19AC4E000, log, OS_LOG_TYPE_DEBUG, "%{public}@ sleep alarm changes: %@", (uint8_t *)&v4, 0x16u);
}

@end

@implementation MTAlarmDataSource

- (id)alarmAtRow:(unint64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_alarms, "objectAtIndexedSubscript:", a3);
}

- (unint64_t)numberOfAlarms
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  return -[NSMutableArray count](self->_alarms, "count");
}

void __49__MTAlarmDataSource_reloadAlarmsNotifyObservers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[5];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    MTLogForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __49__MTAlarmDataSource_reloadAlarmsNotifyObservers___block_invoke_cold_1(a1, (uint64_t)v6, v7);
LABEL_4:

    goto LABEL_5;
  }
  v8 = objc_opt_new();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 24);
  *(_QWORD *)(v9 + 24) = v8;

  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 32);
  *(_QWORD *)(v11 + 32) = 0;

  v13 = objc_opt_new();
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v16 = v5;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v32 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (objc_msgSend(v21, "isSleepAlarm"))
          v22 = 40;
        else
          v22 = 24;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v22), "addObject:", v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v18);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "firstObject");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = *(_QWORD *)(a1 + 32);
  v25 = *(void **)(v24 + 32);
  *(_QWORD *)(v24 + 32) = v23;

  if (*(_BYTE *)(a1 + 40))
  {
    MTLogForCategory(3);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v36 = v27;
      _os_log_impl(&dword_19AC4E000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ calling reload block", buf, 0xCu);
    }

    v28 = *(void **)(a1 + 32);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __49__MTAlarmDataSource_reloadAlarmsNotifyObservers___block_invoke_15;
    v30[3] = &unk_1E39CE870;
    v30[4] = v28;
    objc_msgSend(v28, "_iterateObserversWithBlock:", v30);
    MTLogForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v29 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v36 = v29;
      _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ finished reloading", buf, 0xCu);
    }
    goto LABEL_4;
  }
LABEL_5:

}

uint64_t __49__MTAlarmDataSource_reloadAlarmsNotifyObservers___block_invoke_15(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dataSourceDidReload:", *(_QWORD *)(a1 + 32));
}

- (void)_iterateObserversWithBlock:(id)a3
{
  -[MTObserverStore enumerateObserversWithBlock:](self->_observers, "enumerateObserversWithBlock:", a3);
}

- (MTAlarm)sleepAlarm
{
  return self->_sleepAlarm;
}

- (id)reloadAlarms
{
  return -[MTAlarmDataSource reloadAlarmsNotifyObservers:](self, "reloadAlarmsNotifyObservers:", 1);
}

uint64_t __49__MTAlarmDataSource_reloadAlarmsNotifyObservers___block_invoke_17()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (void)registerObserver:(id)a3
{
  -[MTObserverStore addObserver:](self->_observers, "addObserver:", a3);
}

- (id)reloadAlarmsNotifyObservers:(BOOL)a3
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
  MTAlarmDataSource *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  MTLogForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = self;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ asynchronously reloading alarms", buf, 0xCu);
  }

  -[MTAlarmManager alarmsIncludingSleepAlarm:](self->_alarmManager, "alarmsIncludingSleepAlarm:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mtMainThreadScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reschedule:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__MTAlarmDataSource_reloadAlarmsNotifyObservers___block_invoke;
  v12[3] = &unk_1E39CE898;
  v12[4] = self;
  v13 = a3;
  objc_msgSend(v8, "addCompletionBlock:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "flatMap:", &__block_literal_global_40);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (MTAlarmDataSource)initWithAlarmManager:(id)a3
{
  id v5;
  MTAlarmDataSource *v6;
  NSObject *v7;
  uint64_t v8;
  NSMutableArray *alarms;
  uint64_t v10;
  MTObserverStore *observers;
  objc_super v13;
  uint8_t buf[4];
  MTAlarmDataSource *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v13.receiver = self;
  v13.super_class = (Class)MTAlarmDataSource;
  v6 = -[MTAlarmDataSource init](&v13, sel_init);
  if (v6)
  {
    MTLogForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v6;
      _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ initializing", buf, 0xCu);
    }

    objc_storeStrong((id *)&v6->_alarmManager, a3);
    v8 = objc_opt_new();
    alarms = v6->_alarms;
    v6->_alarms = (NSMutableArray *)v8;

    v10 = objc_opt_new();
    observers = v6->_observers;
    v6->_observers = (MTObserverStore *)v10;

    -[MTAlarmDataSource _registerForNotifications](v6, "_registerForNotifications");
  }

  return v6;
}

- (void)_registerForNotifications
{
  void *v3;
  MTAlarmManager *alarmManager;
  void *v5;
  uint64_t v6;
  id v7;
  MTAlarmManager *v8;
  void *v9;
  id v10;
  void *v11;
  MTAlarmManager *v12;
  void *v13;
  id v14;
  id v15;
  MTAlarmManager *v16;
  void *v17;
  id v18;
  id v19;
  MTAlarmManager *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[6];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  alarmManager = self->_alarmManager;
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __46__MTAlarmDataSource__registerForNotifications__block_invoke;
  v30[3] = &unk_1E39CE820;
  v30[4] = self;
  v7 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("MTAlarmManagerAlarmsAdded"), alarmManager, v5, v30);

  v8 = self->_alarmManager;
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v6;
  v29[1] = 3221225472;
  v29[2] = __46__MTAlarmDataSource__registerForNotifications__block_invoke_4;
  v29[3] = &unk_1E39CE820;
  v29[4] = self;
  v10 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("MTAlarmManagerAlarmsRemoved"), v8, v9, v29);

  v28[0] = v6;
  v28[1] = 3221225472;
  v28[2] = __46__MTAlarmDataSource__registerForNotifications__block_invoke_7;
  v28[3] = &unk_1E39CE6F0;
  v28[4] = self;
  v11 = (void *)MEMORY[0x19AED0080](v28);
  v12 = self->_alarmManager;
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v6;
  v26[1] = 3221225472;
  v26[2] = __46__MTAlarmDataSource__registerForNotifications__block_invoke_9;
  v26[3] = &unk_1E39CE848;
  v26[4] = self;
  v14 = v11;
  v27 = v14;
  v15 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("MTAlarmManagerFiringAlarmChanged"), v12, v13, v26);

  v16 = self->_alarmManager;
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v6;
  v24[1] = 3221225472;
  v24[2] = __46__MTAlarmDataSource__registerForNotifications__block_invoke_10;
  v24[3] = &unk_1E39CE848;
  v24[4] = self;
  v25 = v14;
  v18 = v14;
  v19 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("MTAlarmManagerAlarmsUpdated"), v16, v17, v24);

  v20 = self->_alarmManager;
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v6;
  v23[1] = 3221225472;
  v23[2] = __46__MTAlarmDataSource__registerForNotifications__block_invoke_11;
  v23[3] = &unk_1E39CE820;
  v23[4] = self;
  v22 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("MTAlarmManagerStateReset"), v20, v21, v23);

}

- (void)unregisterObserver:(id)a3
{
  -[MTObserverStore removeObserver:](self->_observers, "removeObserver:", a3);
}

uint64_t __46__MTAlarmDataSource__registerForNotifications__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__MTAlarmDataSource__registerForNotifications__block_invoke_2;
  v4[3] = &unk_1E39CE6F0;
  v4[4] = v2;
  return objc_msgSend(v2, "_handleAlarmNotification:block:", a2, v4);
}

void __46__MTAlarmDataSource__registerForNotifications__block_invoke_2(uint64_t a1, void *a2)
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
  v6[2] = __46__MTAlarmDataSource__registerForNotifications__block_invoke_3;
  v6[3] = &unk_1E39CE7F8;
  v6[4] = v4;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_iterateObserversWithBlock:", v6);

}

void __46__MTAlarmDataSource__registerForNotifications__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dataSource:didAddAlarms:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __46__MTAlarmDataSource__registerForNotifications__block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__MTAlarmDataSource__registerForNotifications__block_invoke_5;
  v4[3] = &unk_1E39CE6F0;
  v4[4] = v2;
  return objc_msgSend(v2, "_handleAlarmNotification:block:", a2, v4);
}

void __46__MTAlarmDataSource__registerForNotifications__block_invoke_5(uint64_t a1, void *a2)
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
  v6[2] = __46__MTAlarmDataSource__registerForNotifications__block_invoke_6;
  v6[3] = &unk_1E39CE7F8;
  v6[4] = v4;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_iterateObserversWithBlock:", v6);

}

void __46__MTAlarmDataSource__registerForNotifications__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dataSource:didRemoveAlarms:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __46__MTAlarmDataSource__registerForNotifications__block_invoke_7(uint64_t a1, void *a2)
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
  v6[2] = __46__MTAlarmDataSource__registerForNotifications__block_invoke_8;
  v6[3] = &unk_1E39CE7F8;
  v6[4] = v4;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_iterateObserversWithBlock:", v6);

}

void __46__MTAlarmDataSource__registerForNotifications__block_invoke_8(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dataSource:didUpdateAlarms:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __46__MTAlarmDataSource__registerForNotifications__block_invoke_9(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlarmNotification:block:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __46__MTAlarmDataSource__registerForNotifications__block_invoke_10(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlarmNotification:block:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __46__MTAlarmDataSource__registerForNotifications__block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stateReset");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("MTAlarmManagerAlarmsAdded"), self->_alarmManager);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("MTAlarmManagerAlarmsRemoved"), self->_alarmManager);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("MTAlarmManagerFiringAlarmChanged"), self->_alarmManager);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("MTAlarmManagerAlarmsUpdated"), self->_alarmManager);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("MTAlarmManagerStateReset"), self->_alarmManager);

  v8.receiver = self;
  v8.super_class = (Class)MTAlarmDataSource;
  -[MTAlarmDataSource dealloc](&v8, sel_dealloc);
}

- (void)_handleAlarmNotification:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  int v13;
  MTAlarmDataSource *v14;
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
  objc_msgSend(v8, "objectForKey:", CFSTR("Alarms"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    MTLogForCategory(3);
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
      _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ received %{public}@ notification for %d alarms.", (uint8_t *)&v13, 0x1Cu);

    }
    v12 = -[MTAlarmDataSource reloadAlarms](self, "reloadAlarms");
    v7[2](v7, v9);
  }

}

- (void)_stateReset
{
  NSObject *v3;
  id v4;
  int v5;
  MTAlarmDataSource *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  MTLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ received MTAlarmManagerStateReset notification.", (uint8_t *)&v5, 0xCu);
  }

  v4 = -[MTAlarmDataSource reloadAlarms](self, "reloadAlarms");
}

- (unint64_t)rowForAlarm:(id)a3
{
  void *v4;
  unint64_t v5;

  objc_msgSend(a3, "alarmIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MTAlarmDataSource rowForAlarmWithID:](self, "rowForAlarmWithID:", v4);

  return v5;
}

- (unint64_t)rowForAlarmWithID:(id)a3
{
  id v4;
  NSMutableArray *alarms;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  alarms = self->_alarms;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__MTAlarmDataSource_rowForAlarmWithID___block_invoke;
  v9[3] = &unk_1E39CE450;
  v10 = v4;
  v6 = v4;
  v7 = -[NSMutableArray indexOfObjectPassingTest:](alarms, "indexOfObjectPassingTest:", v9);

  return v7;
}

uint64_t __39__MTAlarmDataSource_rowForAlarmWithID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "alarmIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)hasSleepAlarmMatchingAlarmIDString:(id)a3
{
  id v4;
  NSMutableArray *sleepAlarms;
  id v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  sleepAlarms = self->_sleepAlarms;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__MTAlarmDataSource_hasSleepAlarmMatchingAlarmIDString___block_invoke;
  v8[3] = &unk_1E39CE450;
  v9 = v4;
  v6 = v4;
  LOBYTE(sleepAlarms) = -[NSMutableArray indexOfObjectPassingTest:](sleepAlarms, "indexOfObjectPassingTest:", v8) != 0x7FFFFFFFFFFFFFFFLL;

  return (char)sleepAlarms;
}

uint64_t __56__MTAlarmDataSource_hasSleepAlarmMatchingAlarmIDString___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "alarmIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)addAlarm:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (objc_msgSend(v5, "isSleepAlarm"))
    objc_storeStrong((id *)&self->_sleepAlarm, a3);
  else
    -[NSMutableArray addObject:](self->_alarms, "addObject:", v5);
  -[MTAlarmDataSource alarmManager](self, "alarmManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAlarm:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mtMainThreadScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reschedule:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __30__MTAlarmDataSource_addAlarm___block_invoke;
  v12[3] = &unk_1E39CC748;
  v12[4] = self;
  objc_msgSend(v9, "flatMap:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __30__MTAlarmDataSource_addAlarm___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadAlarms");
}

- (id)updateAlarm:(id)a3
{
  return -[MTAlarmDataSource updateAlarm:reload:](self, "updateAlarm:reload:", a3, 1);
}

- (id)updateAlarm:(id)a3 reload:(BOOL)a4
{
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  BOOL v16;

  v7 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (objc_msgSend(v7, "isSleepAlarm"))
  {
    objc_storeStrong((id *)&self->_sleepAlarm, a3);
  }
  else
  {
    v8 = -[MTAlarmDataSource rowForAlarm:](self, "rowForAlarm:", v7);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray setObject:atIndexedSubscript:](self->_alarms, "setObject:atIndexedSubscript:", v7, v8);
  }
  -[MTAlarmDataSource alarmManager](self, "alarmManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateAlarm:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mtMainThreadScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reschedule:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __40__MTAlarmDataSource_updateAlarm_reload___block_invoke;
  v15[3] = &unk_1E39CE8C0;
  v15[4] = self;
  v16 = a4;
  objc_msgSend(v12, "flatMap:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __40__MTAlarmDataSource_updateAlarm_reload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadAlarmsNotifyObservers:", *(unsigned __int8 *)(a1 + 40));
}

- (id)removeAlarm:(id)a3
{
  id v4;
  MTAlarm *sleepAlarm;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (objc_msgSend(v4, "isSleepAlarm"))
  {
    sleepAlarm = self->_sleepAlarm;
    self->_sleepAlarm = 0;

  }
  else
  {
    v6 = -[MTAlarmDataSource rowForAlarm:](self, "rowForAlarm:", v4);
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray removeObjectAtIndex:](self->_alarms, "removeObjectAtIndex:", v6);
  }
  -[MTAlarmDataSource alarmManager](self, "alarmManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAlarm:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mtMainThreadScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reschedule:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __33__MTAlarmDataSource_removeAlarm___block_invoke;
  v13[3] = &unk_1E39CC748;
  v13[4] = self;
  objc_msgSend(v10, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __33__MTAlarmDataSource_removeAlarm___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadAlarms");
}

- (MTAlarmManager)alarmManager
{
  return self->_alarmManager;
}

- (void)setAlarmManager:(id)a3
{
  objc_storeStrong((id *)&self->_alarmManager, a3);
}

- (MTObserverStore)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NSMutableArray)alarms
{
  return self->_alarms;
}

- (void)setAlarms:(id)a3
{
  objc_storeStrong((id *)&self->_alarms, a3);
}

- (void)setSleepAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_sleepAlarm, a3);
}

- (NSMutableArray)sleepAlarms
{
  return self->_sleepAlarms;
}

- (void)setSleepAlarms:(id)a3
{
  objc_storeStrong((id *)&self->_sleepAlarms, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepAlarms, 0);
  objc_storeStrong((id *)&self->_sleepAlarm, 0);
  objc_storeStrong((id *)&self->_alarms, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_alarmManager, 0);
}

void __49__MTAlarmDataSource_reloadAlarmsNotifyObservers___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_19AC4E000, log, OS_LOG_TYPE_ERROR, "%{public}@ failed reloading: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end

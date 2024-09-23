@implementation MTAlarmManagerExportedObject

- (MTAlarmManagerExportedObject)initWithAlarmManager:(id)a3
{
  id v4;
  MTAlarmManagerExportedObject *v5;
  NSObject *v6;
  void *v7;
  objc_super v9;
  uint8_t buf[4];
  MTAlarmManagerExportedObject *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTAlarmManagerExportedObject;
  v5 = -[MTAlarmManagerExportedObject init](&v9, sel_init);
  if (v5)
  {
    MTLogForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v5;
      _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ initializing...", buf, 0xCu);
    }

    objc_storeWeak((id *)&v5->_alarmManager, v4);
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, sel__didReceiveAlarmServerReadyNotification_, CFSTR("com.apple.MTAlarmServer.ready"), 0);

  }
  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  MTAlarmManagerExportedObject *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocing...", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("com.apple.MTAlarmServer.ready"), 0);

  v5.receiver = self;
  v5.super_class = (Class)MTAlarmManagerExportedObject;
  -[MTAlarmManagerExportedObject dealloc](&v5, sel_dealloc);
}

- (void)_didReceiveAlarmServerReadyNotification:(id)a3
{
  MTAlarmManagerExportedObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  MTAlarmManagerExportedObject *v11;
  uint8_t buf[4];
  MTAlarmManagerExportedObject *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[MTAlarmManagerExportedObject alarmManager](self, "alarmManager", a3);
  v4 = (MTAlarmManagerExportedObject *)objc_claimAutoreleasedReturnValue();
  MTLogForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ received MTAlarmServerReadyNotification", buf, 0xCu);
  }

  if (v4)
  {
    MTLogForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v4;
      _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ received MTAlarmServerReadyNotification, posting MTAlarmManagerStateReset", buf, 0xCu);
    }

    -[MTAlarmManagerExportedObject cache](v4, "cache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "markNeedsUpdate");

    -[MTAlarmManagerExportedObject notificationCenter](v4, "notificationCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mtNotifiyingQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__MTAlarmManagerExportedObject__didReceiveAlarmServerReadyNotification___block_invoke;
    block[3] = &unk_1E39CB858;
    v11 = v4;
    dispatch_async(v9, block);

  }
}

void __72__MTAlarmManagerExportedObject__didReceiveAlarmServerReadyNotification___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MTAlarmManagerStateReset"), *(_QWORD *)(a1 + 32));

}

- (void)alarmsAdded:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MTAlarmManagerExportedObject alarmManager](self, "alarmManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    MTLogForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "valueForKey:", CFSTR("alarmID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v5;
      v16 = 2114;
      v17 = v7;
      _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ notified alarms added: %{public}@", buf, 0x16u);

    }
    objc_msgSend(v5, "cache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markNeedsUpdate");

    objc_msgSend(v5, "notificationCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mtNotifiyingQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __44__MTAlarmManagerExportedObject_alarmsAdded___block_invoke;
    v11[3] = &unk_1E39CB7B0;
    v12 = v4;
    v13 = v5;
    dispatch_async(v10, v11);

  }
}

void __44__MTAlarmManagerExportedObject_alarmsAdded___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  kdebug_trace();
  MTLogForCategory(9);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_INFO, "MTAlarmManager - Alarm Added", v7, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v3, CFSTR("Alarms"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("MTAlarmManagerAlarmsAdded"), *(_QWORD *)(a1 + 40), v4);

  objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("MTAlarmManagerAlarmsChanged"), *(_QWORD *)(a1 + 40), v4);

}

- (void)alarmsUpdated:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MTAlarmManagerExportedObject alarmManager](self, "alarmManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    MTLogForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "valueForKey:", CFSTR("alarmID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v5;
      v16 = 2114;
      v17 = v7;
      _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ notified alarms updated: %{public}@", buf, 0x16u);

    }
    objc_msgSend(v5, "cache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markNeedsUpdate");

    objc_msgSend(v5, "notificationCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mtNotifiyingQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __46__MTAlarmManagerExportedObject_alarmsUpdated___block_invoke;
    v11[3] = &unk_1E39CB7B0;
    v12 = v4;
    v13 = v5;
    dispatch_async(v10, v11);

  }
}

void __46__MTAlarmManagerExportedObject_alarmsUpdated___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  kdebug_trace();
  MTLogForCategory(9);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_INFO, "MTAlarmManager - Alarm Updated", v7, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v3, CFSTR("Alarms"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("MTAlarmManagerAlarmsUpdated"), *(_QWORD *)(a1 + 40), v4);

  objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("MTAlarmManagerAlarmsChanged"), *(_QWORD *)(a1 + 40), v4);

}

- (void)alarmsRemoved:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MTAlarmManagerExportedObject alarmManager](self, "alarmManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    MTLogForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "valueForKey:", CFSTR("alarmID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v5;
      v16 = 2114;
      v17 = v7;
      _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ notified alarms removed: %{public}@", buf, 0x16u);

    }
    objc_msgSend(v5, "cache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markNeedsUpdate");

    objc_msgSend(v5, "notificationCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mtNotifiyingQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __46__MTAlarmManagerExportedObject_alarmsRemoved___block_invoke;
    v11[3] = &unk_1E39CB7B0;
    v12 = v4;
    v13 = v5;
    dispatch_async(v10, v11);

  }
}

void __46__MTAlarmManagerExportedObject_alarmsRemoved___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  kdebug_trace();
  MTLogForCategory(9);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_INFO, "MTAlarmManager - Alarm Removed", v7, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v3, CFSTR("Alarms"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("MTAlarmManagerAlarmsRemoved"), *(_QWORD *)(a1 + 40), v4);

  objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("MTAlarmManagerAlarmsChanged"), *(_QWORD *)(a1 + 40), v4);

}

- (void)alarmSnoozed:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MTAlarmManagerExportedObject alarmManager](self, "alarmManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    MTLogForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v14 = v5;
      v15 = 2114;
      v16 = v4;
      _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ notified alarm snoozed: %{public}@", buf, 0x16u);
    }

    objc_msgSend(v5, "cache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "markNeedsUpdate");

    objc_msgSend(v5, "notificationCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mtNotifiyingQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __45__MTAlarmManagerExportedObject_alarmSnoozed___block_invoke;
    v10[3] = &unk_1E39CB7B0;
    v11 = v4;
    v12 = v5;
    dispatch_async(v9, v10);

  }
}

void __45__MTAlarmManagerExportedObject_alarmSnoozed___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  MTLogForCategory(9);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_INFO, "MTAlarmManager - Alarm Snoozed", v9, 2u);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    v3 = (void *)MEMORY[0x1E0C99D80];
    v10[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dictionaryWithObject:forKey:", v4, CFSTR("Alarms"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("MTAlarmManagerAlarmsUpdated"), *(_QWORD *)(a1 + 40), v5);

    objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MTAlarmManagerAlarmsChanged"), *(_QWORD *)(a1 + 40), v5);

    objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("MTAlarmManagerFiringAlarmChanged"), *(_QWORD *)(a1 + 40), v5);

  }
}

- (void)alarmFired:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MTAlarmManagerExportedObject alarmManager](self, "alarmManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    MTLogForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v14 = v5;
      v15 = 2114;
      v16 = v4;
      _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ notified alarm fired: %{public}@", buf, 0x16u);
    }

    objc_msgSend(v5, "cache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "markNeedsUpdate");

    objc_msgSend(v5, "notificationCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mtNotifiyingQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __43__MTAlarmManagerExportedObject_alarmFired___block_invoke;
    v10[3] = &unk_1E39CB7B0;
    v11 = v4;
    v12 = v5;
    dispatch_async(v9, v10);

  }
}

void __43__MTAlarmManagerExportedObject_alarmFired___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  MTLogForCategory(9);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_INFO, "MTAlarmManager - Alarm Fired", v8, 2u);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    v3 = (void *)MEMORY[0x1E0C99D80];
    v9[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dictionaryWithObject:forKey:", v4, CFSTR("Alarms"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("MTAlarmManagerAlarmFired"), *(_QWORD *)(a1 + 40), v5);

    objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MTAlarmManagerFiringAlarmChanged"), *(_QWORD *)(a1 + 40), v5);

  }
}

- (void)alarmDismissed:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MTAlarmManagerExportedObject alarmManager](self, "alarmManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    MTLogForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v14 = v5;
      v15 = 2114;
      v16 = v4;
      _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ notified alarm dismissed: %{public}@", buf, 0x16u);
    }

    objc_msgSend(v5, "cache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "markNeedsUpdate");

    objc_msgSend(v5, "notificationCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mtNotifiyingQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __47__MTAlarmManagerExportedObject_alarmDismissed___block_invoke;
    v10[3] = &unk_1E39CB7B0;
    v11 = v4;
    v12 = v5;
    dispatch_async(v9, v10);

  }
}

void __47__MTAlarmManagerExportedObject_alarmDismissed___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  MTLogForCategory(9);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_INFO, "MTAlarmManager - Alarm Dismissed", v8, 2u);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    v3 = (void *)MEMORY[0x1E0C99D80];
    v9[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dictionaryWithObject:forKey:", v4, CFSTR("Alarms"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("MTAlarmManagerFiringAlarmDismissed"), *(_QWORD *)(a1 + 40), v5);

    objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MTAlarmManagerFiringAlarmChanged"), *(_QWORD *)(a1 + 40), v5);

  }
}

- (void)nextAlarmChanged:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MTAlarmManagerExportedObject alarmManager](self, "alarmManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    MTLogForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v14 = v5;
      v15 = 2114;
      v16 = v4;
      _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying next alarm changed: %{public}@", buf, 0x16u);
    }

    objc_msgSend(v5, "cache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "markNeedsUpdate");

    objc_msgSend(v5, "notificationCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mtNotifiyingQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__MTAlarmManagerExportedObject_nextAlarmChanged___block_invoke;
    v10[3] = &unk_1E39CB7B0;
    v11 = v4;
    v12 = v5;
    dispatch_async(v9, v10);

  }
}

void __49__MTAlarmManagerExportedObject_nextAlarmChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(9);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_INFO, "MTAlarmManager - Next Alarm Changed", buf, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v3, CFSTR("NextAlarm"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("MTAlarmManagerNextAlarmChanged"), *(_QWORD *)(a1 + 40), v4);

  MTLogForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v16 = v7;
    v17 = 2114;
    v18 = v4;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ notified next alarm changed: %{public}@", buf, 0x16u);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    v8 = (void *)MEMORY[0x1E0C99D80];
    v14 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryWithObject:forKey:", v9, CFSTR("Alarms"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("MTAlarmManagerAlarmsChanged"), *(_QWORD *)(a1 + 40), v10);

    MTLogForCategory(3);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v16 = v13;
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_19AC4E000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ notified alarms changed: %{public}@", buf, 0x16u);
    }

  }
  else
  {
    v10 = v4;
  }

}

- (MTAlarmManager)alarmManager
{
  return (MTAlarmManager *)objc_loadWeakRetained((id *)&self->_alarmManager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_alarmManager);
}

@end

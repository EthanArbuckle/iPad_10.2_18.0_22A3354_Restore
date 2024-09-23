@implementation MTAlarmStorage

- (void)getAlarmsWithCompletion:(id)a3
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
  MTAlarmStorage *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ received request for alarms", buf, 0xCu);
  }

  if (v4)
  {
    -[MTAlarmStorage nextAlarm](self, "nextAlarm");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTAlarmStorage serializer](self, "serializer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__MTAlarmStorage_getAlarmsWithCompletion___block_invoke;
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

- (MTAlarm)nextAlarm
{
  void *v2;
  void *v3;

  -[MTAlarmStorage scheduler](self, "scheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextAlarm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MTAlarm *)v3;
}

- (MTAlarmScheduler)scheduler
{
  return (MTAlarmScheduler *)objc_loadWeakRetained((id *)&self->_scheduler);
}

uint64_t __42__MTAlarmStorage_getAlarmsWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);

  MTLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __42__MTAlarmStorage_getAlarmsWithCompletion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(v6 + 16), "valueForKey:", CFSTR("alarmID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "valueForKey:", CFSTR("alarmID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "alarmID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544130;
    v15 = v6;
    v16 = 2114;
    v17 = v7;
    v18 = 2114;
    v19 = v8;
    v20 = 2114;
    v21 = v9;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ returning ordered alarms: %{public}@, sleep alarms: %{public}@, next alarm: %{public}@", (uint8_t *)&v14, 0x2Au);

  }
  MTLogForCategory(3);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 16);
    v14 = 138543618;
    v15 = v11;
    v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ calling completion block with alarms %@", (uint8_t *)&v14, 0x16u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __42__MTAlarmStorage_getAlarmsWithCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  uint64_t v3;
  os_log_t v4;
  uint8_t v5[14];
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v6 = v0;
  v7 = v1;
  v8 = v2;
  v9 = v1;
  v10 = v3;
  _os_log_debug_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ returning ordered alarms: %{public}@, sleep alarms: %{public}@, next alarm: %{public}@", v5, 0x2Au);
}

- (MTAlarmStorage)init
{
  void *v3;
  MTAlarmStorage *v4;

  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MTAlarmStorage initWithPersistence:](self, "initWithPersistence:", v3);

  return v4;
}

- (MTAlarmStorage)initWithPersistence:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MTAlarmStorage *v9;

  v4 = a3;
  +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", CFSTR("com.apple.MTAlarmStorage.access-queue"), +[MTScheduler defaultPriority](MTScheduler, "defaultPriority"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D519E8], "mtMainThreadScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MTCurrentDateProvider();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MTAlarmStorage initWithPersistence:migrator:serializer:callbackScheduler:currentDateProvider:](self, "initWithPersistence:migrator:serializer:callbackScheduler:currentDateProvider:", v4, v6, v5, v7, v8);

  return v9;
}

- (MTAlarmStorage)initWithPersistence:(id)a3 migrator:(id)a4 serializer:(id)a5 callbackScheduler:(id)a6 currentDateProvider:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  MTAlarmStorage *v18;
  NSObject *v19;
  MTObserverStore *v20;
  MTObserverStore *observers;
  uint64_t v22;
  id currentDateProvider;
  objc_super v25;
  uint8_t buf[4];
  MTAlarmStorage *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)MTAlarmStorage;
  v18 = -[MTAlarmStorage init](&v25, sel_init);
  if (v18)
  {
    MTLogForCategory(3);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v27 = v18;
      v28 = 2114;
      v29 = v13;
      v30 = 2114;
      v31 = v14;
      _os_log_impl(&dword_19AC4E000, v19, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@ with persistence %{public}@ and migrator %{public}@", buf, 0x20u);
    }

    objc_storeStrong((id *)&v18->_serializer, a5);
    v20 = -[MTObserverStore initWithCallbackScheduler:]([MTObserverStore alloc], "initWithCallbackScheduler:", v16);
    observers = v18->_observers;
    v18->_observers = v20;

    objc_storeStrong((id *)&v18->_migrator, a4);
    v22 = objc_msgSend(v17, "copy");
    currentDateProvider = v18->_currentDateProvider;
    v18->_currentDateProvider = (id)v22;

    objc_storeStrong((id *)&v18->_persistence, a3);
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
  v4.super_class = (Class)MTAlarmStorage;
  -[MTAlarmStorage dealloc](&v4, sel_dealloc);
}

- (void)setupListeners
{
  id v3;

  +[MTApplicationWorkspaceObserver sharedWorkspaceObserver](MTApplicationWorkspaceObserver, "sharedWorkspaceObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forBundleIdentifier:", self, CFSTR("com.apple.mobiletimer"));

}

- (id)_cleanUpSnoozeFireDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "snoozeFireDate"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        (*((void (**)(void))self->_currentDateProvider + 2))(),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "mtIsBeforeDate:", v7),
        v7,
        v6,
        v8))
  {
    MTLogForCategory(3);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MTAlarmStorage _cleanUpSnoozeFireDate:].cold.1();

    v10 = (id)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v10, "setSnoozeFireDate:", 0);
  }
  else
  {
    v10 = v5;
  }

  return v10;
}

- (id)_cleanUpSleepAlarmRepeat:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = a3;
  if (v3)
  {
    MTLogForCategory(3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[MTAlarmStorage _cleanUpSleepAlarmRepeat:].cold.1();

    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v5, "setRepeatSchedule:", 127);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_convertSleepAlarmToRegular:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = a3;
  +[MTAlarm alarm](MTMutableAlarm, "alarm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", objc_msgSend(v3, "isEnabled"));
  objc_msgSend(v4, "setHour:", objc_msgSend(v3, "hour"));
  objc_msgSend(v4, "setMinute:", objc_msgSend(v3, "minute"));
  objc_msgSend(v4, "setRepeatSchedule:", objc_msgSend(v3, "repeatSchedule"));
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("BED_TIME"), &stru_1E39CF258, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v6);

  objc_msgSend(v3, "sound");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sound");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "toneIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sound");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "vibrationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "soundType") == 1)
  {
    v12 = (void *)*MEMORY[0x1E0DBF788];
  }
  else
  {
    objc_msgSend(v7, "toneIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)*MEMORY[0x1E0DBF788];
    v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DBF788]);

    if (!v14)
      goto LABEL_5;
  }
  v15 = v12;

  v9 = v15;
LABEL_5:
  objc_msgSend(v7, "vibrationIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)*MEMORY[0x1E0DBF790];
  v18 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0DBF790]);

  if (v18)
  {
    v19 = v17;

    v11 = v19;
  }
  objc_msgSend(v4, "sound");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "soundVolume");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTSound toneSoundWithIdentifier:vibrationIdentifer:volume:](MTSound, "toneSoundWithIdentifier:vibrationIdentifer:volume:", v9, v11, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSound:", v22);

  v23 = (void *)objc_msgSend(v4, "copy");
  return v23;
}

- (id)_cleanUpForInternalBuild:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  MTSound *v7;
  void *v8;
  MTSound *v9;
  void *v10;

  if (a3)
  {
    v4 = (void *)objc_msgSend(a3, "mutableCopy");
    objc_msgSend(v4, "sound");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "soundVolume");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = [MTSound alloc];
      objc_msgSend(v4, "sound");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[MTSound initWithSound:usingVolume:](v7, "initWithSound:usingVolume:", v8, &unk_1E3A05E68);

      objc_msgSend(v4, "setSound:", v9);
    }
    -[MTAlarmStorage _resetCurrentToneIdentifier](self, "_resetCurrentToneIdentifier");
    +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", CFSTR("MTDefaultTimerVibrationID"));

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)_clearOutInvalidToneIdentifiers
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  MTAlarmStorage *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Cleaning out invalid tone identifiers", (uint8_t *)&v8, 0xCu);
  }

  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("MTDefaultAlarmSoundType"));

  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("MTDefaultAlarmToneID"));

  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("MTDefaultAlarmMediaItemID"));

  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("MTDefaultAlarmVibrationID"));

}

- (void)_resetCurrentToneIdentifier
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DBF740], "sharedToneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0DBF760];
  objc_msgSend(v2, "setCurrentToneIdentifier:forAlertType:topic:", 0, 13, *MEMORY[0x1E0DBF760]);

  objc_msgSend(MEMORY[0x1E0DBF748], "sharedVibrationManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCurrentVibrationIdentifier:forAlertType:topic:", 0, 13, v3);

}

- (void)loadAlarms
{
  -[MTAlarmStorage _loadAlarmsWithCompletion:](self, "_loadAlarmsWithCompletion:", 0);
}

- (void)loadAlarmsSync
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  _QWORD v5[4];
  dispatch_semaphore_t v6;

  v3 = dispatch_semaphore_create(0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__MTAlarmStorage_loadAlarmsSync__block_invoke;
  v5[3] = &unk_1E39CB858;
  v6 = v3;
  v4 = v3;
  -[MTAlarmStorage _loadAlarmsWithCompletion:](self, "_loadAlarmsWithCompletion:", v5);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

}

intptr_t __32__MTAlarmStorage_loadAlarmsSync__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_loadAlarmsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MTAlarmStorage serializer](self, "serializer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__MTAlarmStorage__loadAlarmsWithCompletion___block_invoke;
  v7[3] = &unk_1E39CB880;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

uint64_t __44__MTAlarmStorage__loadAlarmsWithCompletion___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  BOOL v4;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL8 v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  objc_class *v50;
  id v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  NSObject *v59;
  id v60;
  id v61;
  id v62;
  BOOL v63;
  int v64;
  NSObject *v65;
  NSObject *v66;
  id v67;
  id v68;
  void *v69;
  uint64_t v70;
  NSObject *v71;
  id v72;
  NSObject *v73;
  NSObject *v74;
  _BOOL4 v75;
  NSObject *v76;
  NSObject *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t result;
  void *v83;
  void *v84;
  void *v85;
  MTStorageReader *v86;
  _QWORD block[5];
  id v88;
  id v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  _BYTE buf[24];
  void *v96;
  uint64_t *v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "persistence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  MTLogForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v6)
    {
      v7 = *v2;
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ loading alarms", buf, 0xCu);
    }

    objc_msgSend(*v2, "persistence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("MTAlarms"));
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*v2, "persistence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatForKey:", CFSTR("MTAlarmStorageVersion"));
    v11 = v10;

    objc_msgSend(*v2, "persistence");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("MTAlarmModifiedDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_opt_new();
    v15 = (void *)*((_QWORD *)*v2 + 2);
    *((_QWORD *)*v2 + 2) = v14;

    v16 = objc_opt_new();
    v17 = (void *)*((_QWORD *)*v2 + 3);
    *((_QWORD *)*v2 + 3) = v16;

    if (v11 < 1.0)
    {
      MTLogForCategory(3);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = *v2;
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v19;
        _os_log_impl(&dword_19AC4E000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ migration needed", buf, 0xCu);
      }

      MTLogForCategory(3);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *v2;
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v21;
        _os_log_impl(&dword_19AC4E000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ To set as a marker we are hitting here with updated root", buf, 0xCu);
      }

      objc_msgSend(*((id *)*v2 + 7), "migrateFromOldStorage");
      objc_msgSend(*((id *)*v2 + 7), "alarms");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)*v2 + 7), "sleepAlarm");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0C9AA60];
      v25 = 1;
LABEL_92:
      dispatch_get_global_queue(-32768, 0);
      v73 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __44__MTAlarmStorage__loadAlarmsWithCompletion___block_invoke_57;
      block[3] = &unk_1E39CB858;
      block[4] = *v2;
      dispatch_async(v73, block);

      objc_msgSend(*v2, "_queue_setAllAlarms:sleepAlarms:source:persist:notify:", v22, v24, 0, v25, 0);
      if (v11 < 1.0)
        objc_msgSend(*((id *)*v2 + 7), "removeFromOldStorage");
      MTLogForCategory(3);
      v74 = objc_claimAutoreleasedReturnValue();
      v75 = os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG);

      MTLogForCategory(3);
      v76 = objc_claimAutoreleasedReturnValue();
      v77 = v76;
      if (v75)
      {
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
          __44__MTAlarmStorage__loadAlarmsWithCompletion___block_invoke_cold_1();
      }
      else if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        v78 = *v2;
        v79 = objc_msgSend(*((id *)*v2 + 2), "count");
        v80 = objc_msgSend(*((id *)*v2 + 3), "count");
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v78;
        *(_WORD *)&buf[12] = 2050;
        *(_QWORD *)&buf[14] = v79;
        *(_WORD *)&buf[22] = 2050;
        v96 = (void *)v80;
        _os_log_impl(&dword_19AC4E000, v77, OS_LOG_TYPE_DEFAULT, "%{public}@ loaded %{public}ld alarms, %{public}ld sleep alarms", buf, 0x20u);
      }

      v81 = v13;
      if (!v13)
      {
        (*(void (**)(void))(*((_QWORD *)*v2 + 9) + 16))();
        v81 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_storeStrong((id *)*v2 + 4, v81);
      if (!v13)

      goto LABEL_104;
    }
    if (!v5)
    {
      MTLogForCategory(3);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = *v2;
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v37;
        _os_log_impl(&dword_19AC4E000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ has no alarms", buf, 0xCu);
      }

      v25 = 0;
      v23 = 0;
      v24 = (void *)MEMORY[0x1E0C9AA60];
      v22 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_92;
    }
    if (v11 < 2.2)
    {
      MTLogForCategory(3);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = *v2;
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v28;
        _os_log_impl(&dword_19AC4E000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ clean-up needed", buf, 0xCu);
      }

      objc_msgSend(*((id *)*v2 + 7), "cleanUpOldNotifications");
    }
    if (v11 >= 2.0)
    {
      objc_opt_class();
      v38 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v39 = v38;
      else
        v39 = 0;
      v33 = v39;

      v86 = -[MTStorageReader initWithEncodedDictionary:]([MTStorageReader alloc], "initWithEncodedDictionary:", v33);
    }
    else
    {
      MTLogForCategory(3);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = *v2;
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v30;
        _os_log_impl(&dword_19AC4E000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ binary data storage version detected.  Using old reader.", buf, 0xCu);
      }

      objc_opt_class();
      v31 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v32 = v31;
      else
        v32 = 0;
      v33 = v32;

      v89 = 0;
      v86 = (MTStorageReader *)-[MTStorageReaderV1 initForReadingFromData:error:]([MTStorageReaderV1 alloc], "initForReadingFromData:error:", v33, &v89);
      v34 = v89;
      if (v34)
      {
        MTLogForCategory(3);
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          __44__MTAlarmStorage__loadAlarmsWithCompletion___block_invoke_cold_2(v2);

      }
    }

    -[MTStorageReader decodeObjectForKey:](v86, "decodeObjectForKey:", CFSTR("MTAlarms"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTStorageReader decodeObjectForKey:](v86, "decodeObjectForKey:", CFSTR("MTSleepAlarm"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTStorageReader decodeObjectForKey:](v86, "decodeObjectForKey:", CFSTR("MTSleepAlarms"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v11 < 2.3;
    if (v11 < 2.3)
    {
      objc_msgSend(*v2, "_cleanUpForInternalBuild:", v23);
      v40 = objc_claimAutoreleasedReturnValue();

      v23 = (void *)v40;
    }
    if (v11 < 2.5)
    {
      objc_msgSend(*v2, "_cleanUpSnoozeFireDate:", v23);
      v41 = objc_claimAutoreleasedReturnValue();

      v25 = 1;
      v23 = (void *)v41;
    }
    if (v11 < 2.6)
    {
      objc_msgSend(*v2, "scheduler");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "cleanDeliveredNotifications");

      v25 = 1;
    }
    if (v11 < 2.7)
    {
      objc_msgSend(*((id *)*v2 + 7), "cleanUpOldNotifications");
      v25 = 1;
    }
    if (v23)
    {
      if (!objc_msgSend(v23, "repeatSchedule"))
      {
        objc_msgSend(*v2, "_cleanUpSleepAlarmRepeat:", v23);
        v43 = objc_claimAutoreleasedReturnValue();

        v25 = 1;
        v23 = (void *)v43;
      }
      if (v11 >= 3.1)
        goto LABEL_53;
      if (v23)
      {
        MTLogForCategory(3);
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          v45 = *v2;
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v45;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v23;
          _os_log_impl(&dword_19AC4E000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@ Migrating sleep alarm: %{public}@ ", buf, 0x16u);
        }

        v94 = v23;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v94, 1);
        v46 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(*v2, "persistence");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setObject:forKey:", v48, CFSTR("MTNeedsSleepMigration"));

        v25 = 1;
        v24 = (void *)v46;
        goto LABEL_53;
      }
    }
    else
    {
      v23 = 0;
      if (v11 >= 3.1)
        goto LABEL_53;
    }
    v25 = 1;
LABEL_53:
    if (v11 < 3.2 && MTShouldHandleForEucalyptus())
    {
      if (v23)
      {
        v90 = 0;
        v91 = &v90;
        v92 = 0x2050000000;
        v49 = (void *)getBMDiscoverabilitySignalEventClass_softClass;
        v93 = getBMDiscoverabilitySignalEventClass_softClass;
        if (!getBMDiscoverabilitySignalEventClass_softClass)
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __getBMDiscoverabilitySignalEventClass_block_invoke;
          v96 = &unk_1E39CB690;
          v97 = &v90;
          __getBMDiscoverabilitySignalEventClass_block_invoke((uint64_t)buf);
          v49 = (void *)v91[3];
        }
        v50 = objc_retainAutorelease(v49);
        _Block_object_dispose(&v90, 8);
        v51 = [v50 alloc];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "bundleIdentifier");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v51, "initWithIdentifier:bundleID:context:", CFSTR("com.apple.mobiletimer.bedtime.migration.done"), v53, 0);

        v90 = 0;
        v91 = &v90;
        v92 = 0x2050000000;
        v55 = (void *)getBMStreamsClass_softClass;
        v93 = getBMStreamsClass_softClass;
        if (!getBMStreamsClass_softClass)
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __getBMStreamsClass_block_invoke;
          v96 = &unk_1E39CB690;
          v97 = &v90;
          __getBMStreamsClass_block_invoke((uint64_t)buf);
          v55 = (void *)v91[3];
        }
        v56 = objc_retainAutorelease(v55);
        _Block_object_dispose(&v90, 8);
        objc_msgSend(v56, "discoverabilitySignal");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "source");
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v58, "sendEvent:", v54);
        MTLogForCategory(3);
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          v60 = *v2;
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v60;
          _os_log_impl(&dword_19AC4E000, v59, OS_LOG_TYPE_DEFAULT, "%{public}@ Donate signal for existing bedtime", buf, 0xCu);
        }

      }
      else
      {
        MTLogForCategory(3);
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          v61 = *v2;
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v61;
          _os_log_impl(&dword_19AC4E000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@ Don't donate signal because no existing bedtime", buf, 0xCu);
        }
      }

      v25 = 1;
    }
    if (v11 < 3.3 && MTShouldHandleForEucalyptus())
    {
      objc_msgSend(MEMORY[0x1E0D1D640], "serviceForClientIdentifier:", CFSTR("com.apple.mobiletimer.bedtime-mode"));
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = 0;
      objc_msgSend(v85, "invalidateActiveModeAssertionWithError:", &v88);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v88;
      v83 = v62;
      if (v84)
        v63 = v62 == 0;
      else
        v63 = 0;
      v64 = !v63;
      MTLogForCategory(3);
      v65 = objc_claimAutoreleasedReturnValue();
      v66 = v65;
      if (v64)
      {
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          v67 = *v2;
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v67;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v85;
          *(_WORD *)&buf[22] = 2114;
          v96 = v83;
          _os_log_error_impl(&dword_19AC4E000, v66, OS_LOG_TYPE_ERROR, "%{public}@ Failed to release assertion with %{public}@, failure error:%{public}@", buf, 0x20u);
        }
      }
      else if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        v68 = *v2;
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v68;
        _os_log_impl(&dword_19AC4E000, v66, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully released assertion", buf, 0xCu);
      }

    }
    if (v11 < 3.4)
      objc_msgSend(*v2, "_resetCurrentToneIdentifier");
    if (v11 < 3.5)
      objc_msgSend(*v2, "_clearOutInvalidToneIdentifiers");
    if (MTIdiomIpad())
    {
      if (MTShouldHandleForEucalyptus())
      {
        if (v23 || (objc_msgSend(v24, "firstObject"), (v23 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_msgSend(*v2, "_convertSleepAlarmToRegular:", v23, v83);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "arrayByAddingObject:", v69);
          v70 = objc_claimAutoreleasedReturnValue();

          MTLogForCategory(3);
          v71 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
          {
            v72 = *v2;
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v72;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v23;
            *(_WORD *)&buf[22] = 2114;
            v96 = v69;
            _os_log_impl(&dword_19AC4E000, v71, OS_LOG_TYPE_DEFAULT, "%{public}@ Migrating sleep alarm: %{public}@ to regular: %{public}@", buf, 0x20u);
          }

          v24 = (void *)MEMORY[0x1E0C9AA60];
          v22 = (void *)v70;
        }
      }
    }

    goto LABEL_92;
  }
  if (v6)
  {
    v26 = *v2;
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v26;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ persistence is nil", buf, 0xCu);
  }
LABEL_104:

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __44__MTAlarmStorage__loadAlarmsWithCompletion___block_invoke_57(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "clearInvalidPendingNotifications");
}

- (void)_queue_resetAlarmsTo:(id)a3 sleepAlarms:(id)a4
{
  NSMutableArray *orderedAlarms;
  id v7;
  id v8;
  uint64_t v9;
  NSMutableArray *v10;
  void *v11;
  NSMutableArray *sleepAlarms;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];

  orderedAlarms = self->_orderedAlarms;
  v7 = a4;
  v8 = a3;
  -[NSMutableArray removeAllObjects](orderedAlarms, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_sleepAlarms, "removeAllObjects");
  v9 = MEMORY[0x1E0C809B0];
  v10 = self->_orderedAlarms;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__MTAlarmStorage__queue_resetAlarmsTo_sleepAlarms___block_invoke;
  v15[3] = &unk_1E39CB510;
  v15[4] = self;
  objc_msgSend(v8, "na_filter:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObjectsFromArray:](v10, "addObjectsFromArray:", v11);
  sleepAlarms = self->_sleepAlarms;
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __51__MTAlarmStorage__queue_resetAlarmsTo_sleepAlarms___block_invoke_59;
  v14[3] = &unk_1E39CB510;
  v14[4] = self;
  objc_msgSend(v7, "na_filter:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObjectsFromArray:](sleepAlarms, "addObjectsFromArray:", v13);
}

uint64_t __51__MTAlarmStorage__queue_resetAlarmsTo_sleepAlarms___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "isSleepAlarm"))
  {
    MTLogForCategory(3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__MTAlarmStorage__queue_resetAlarmsTo_sleepAlarms___block_invoke_cold_1(a1);

  }
  v5 = objc_msgSend(v3, "isSleepAlarm") ^ 1;

  return v5;
}

uint64_t __51__MTAlarmStorage__queue_resetAlarmsTo_sleepAlarms___block_invoke_59(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  if ((objc_msgSend(v3, "isSleepAlarm") & 1) == 0)
  {
    MTLogForCategory(3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__MTAlarmStorage__queue_resetAlarmsTo_sleepAlarms___block_invoke_59_cold_1(a1);

  }
  v5 = objc_msgSend(v3, "isSleepAlarm");

  return v5;
}

- (void)setScheduler:(id)a3
{
  MTAlarmScheduler **p_scheduler;
  id WeakRetained;
  id obj;

  p_scheduler = &self->_scheduler;
  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_scheduler);
  objc_msgSend(WeakRetained, "setDelegate:", 0);

  objc_storeWeak((id *)p_scheduler, obj);
  objc_msgSend(obj, "setDelegate:", self);

}

- (NSArray)alarms
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
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  -[MTAlarmStorage serializer](self, "serializer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __24__MTAlarmStorage_alarms__block_invoke;
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

intptr_t __24__MTAlarmStorage_alarms__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (MTAlarm)sleepAlarm
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
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  -[MTAlarmStorage serializer](self, "serializer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __28__MTAlarmStorage_sleepAlarm__block_invoke;
  v8[3] = &unk_1E39CB8A8;
  v10 = &v11;
  v8[4] = self;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "performBlock:", v8);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (MTAlarm *)v6;
}

intptr_t __28__MTAlarmStorage_sleepAlarm__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "firstObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (NSMutableArray)sleepAlarms
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
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  -[MTAlarmStorage serializer](self, "serializer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__MTAlarmStorage_sleepAlarms__block_invoke;
  v8[3] = &unk_1E39CB8A8;
  v10 = &v11;
  v8[4] = self;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "performBlock:", v8);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (NSMutableArray *)v6;
}

intptr_t __29__MTAlarmStorage_sleepAlarms__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_allSleepAlarms");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (NSArray)allAlarms
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
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  -[MTAlarmStorage serializer](self, "serializer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __27__MTAlarmStorage_allAlarms__block_invoke;
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

intptr_t __27__MTAlarmStorage_allAlarms__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_allAlarms");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)_queue_allAlarms
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", self->_orderedAlarms);
  objc_msgSend(v3, "addObjectsFromArray:", self->_sleepAlarms);
  return v3;
}

- (id)_queue_allSleepAlarms
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", self->_sleepAlarms);
  return v3;
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
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  -[MTAlarmStorage serializer](self, "serializer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__MTAlarmStorage_lastModifiedDate__block_invoke;
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

intptr_t __34__MTAlarmStorage_lastModifiedDate__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)addAlarm:(id)a3 withCompletion:(id)a4 source:(id)a5
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
  MTAlarmStorage *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  MTLogForCategory(3);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "alarmID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = self;
    v24 = 2114;
    v25 = v12;
    _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ adding alarm %{public}@", buf, 0x16u);

  }
  MTLogForCategory(9);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19AC4E000, v13, OS_LOG_TYPE_INFO, "MTAlarmStorage - Adding Alarm", buf, 2u);
  }

  -[MTAlarmStorage serializer](self, "serializer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __49__MTAlarmStorage_addAlarm_withCompletion_source___block_invoke;
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

uint64_t __49__MTAlarmStorage_addAlarm_withCompletion_source___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addAlarm:withCompletion:source:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)updateAlarm:(id)a3 withCompletion:(id)a4 source:(id)a5
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
  MTAlarmStorage *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  MTLogForCategory(3);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "alarmID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = self;
    v24 = 2114;
    v25 = v12;
    _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ updating alarm %{public}@", buf, 0x16u);

  }
  MTLogForCategory(9);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19AC4E000, v13, OS_LOG_TYPE_INFO, "MTAlarmStorage - Updating Alarm", buf, 2u);
  }

  -[MTAlarmStorage serializer](self, "serializer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __52__MTAlarmStorage_updateAlarm_withCompletion_source___block_invoke;
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

id __52__MTAlarmStorage_updateAlarm_withCompletion_source___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_queue_updateAlarm:withCompletion:source:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)updateAlarmWithIdentifier:(id)a3 changeSet:(id)a4 withCompletion:(id)a5 source:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  MTAlarmStorage *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  MTLogForCategory(3);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v27 = self;
    v28 = 2114;
    v29 = v10;
    v30 = 2114;
    v31 = v11;
    _os_log_impl(&dword_19AC4E000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ updating %{public}@ with changes %{public}@", buf, 0x20u);
  }

  MTLogForCategory(9);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19AC4E000, v15, OS_LOG_TYPE_INFO, "MTAlarmStorage - Updating Alarm", buf, 2u);
  }

  -[MTAlarmStorage serializer](self, "serializer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __76__MTAlarmStorage_updateAlarmWithIdentifier_changeSet_withCompletion_source___block_invoke;
  v21[3] = &unk_1E39CC3D0;
  v21[4] = self;
  v22 = v10;
  v24 = v13;
  v25 = v12;
  v23 = v11;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  v20 = v10;
  objc_msgSend(v16, "performBlock:", v21);

}

uint64_t __76__MTAlarmStorage_updateAlarmWithIdentifier_changeSet_withCompletion_source___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateAlarmWithIdentifier:changeSet:withCompletion:source:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

- (void)removeAlarm:(id)a3 withCompletion:(id)a4 source:(id)a5
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
  MTAlarmStorage *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  MTLogForCategory(3);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "alarmID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = self;
    v24 = 2114;
    v25 = v12;
    _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ removing alarm %{public}@", buf, 0x16u);

  }
  MTLogForCategory(9);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19AC4E000, v13, OS_LOG_TYPE_INFO, "MTAlarmStorage - Removing Alarm", buf, 2u);
  }

  -[MTAlarmStorage serializer](self, "serializer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __52__MTAlarmStorage_removeAlarm_withCompletion_source___block_invoke;
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

uint64_t __52__MTAlarmStorage_removeAlarm_withCompletion_source___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeAlarm:withCompletion:source:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)removeAlarmWithIdentifier:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  MTAlarmStorage *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  MTLogForCategory(3);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = self;
    v22 = 2114;
    v23 = v8;
    _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ removing alarm with ID %{public}@", buf, 0x16u);
  }

  -[MTAlarmStorage serializer](self, "serializer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __66__MTAlarmStorage_removeAlarmWithIdentifier_withCompletion_source___block_invoke;
  v16[3] = &unk_1E39CB8F8;
  v16[4] = self;
  v17 = v8;
  v18 = v10;
  v19 = v9;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v12, "performBlock:", v16);

}

uint64_t __66__MTAlarmStorage_removeAlarmWithIdentifier_withCompletion_source___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeAlarmWithIdentifier:withCompletion:source:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)removeAllAlarmsForSource:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  MTAlarmStorage *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = self;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ removing all alarms", buf, 0xCu);
  }

  -[MTAlarmStorage serializer](self, "serializer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__MTAlarmStorage_removeAllAlarmsForSource___block_invoke;
  v8[3] = &unk_1E39CB7B0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "performBlock:", v8);

}

uint64_t __43__MTAlarmStorage_removeAllAlarmsForSource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeAllAlarmsForSource:", *(_QWORD *)(a1 + 40));
}

- (void)setAllAlarms:(id)a3 sleepAlarms:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  MTAlarmStorage *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  MTLogForCategory(3);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);

  MTLogForCategory(3);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543874;
      v24 = self;
      v25 = 2114;
      v26 = v8;
      v27 = 2114;
      v28 = v9;
      _os_log_debug_impl(&dword_19AC4E000, v14, OS_LOG_TYPE_DEBUG, "%{public}@ setting all alarms %{public}@, sleep alarms %{public}@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v24 = self;
    _os_log_impl(&dword_19AC4E000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ setting all alarms", buf, 0xCu);
  }

  -[MTAlarmStorage serializer](self, "serializer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __50__MTAlarmStorage_setAllAlarms_sleepAlarms_source___block_invoke;
  v19[3] = &unk_1E39CC3F8;
  v19[4] = self;
  v20 = v8;
  v21 = v9;
  v22 = v10;
  v16 = v10;
  v17 = v9;
  v18 = v8;
  objc_msgSend(v15, "performBlock:", v19);

}

uint64_t __50__MTAlarmStorage_setAllAlarms_sleepAlarms_source___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setAllAlarms:sleepAlarms:source:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)updateSleepAlarms:(id)a3 source:(id)a4
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
  -[MTAlarmStorage serializer](self, "serializer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__MTAlarmStorage_updateSleepAlarms_source___block_invoke;
  v11[3] = &unk_1E39CB828;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlock:", v11);

}

void __43__MTAlarmStorage_updateSleepAlarms_source___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v3;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ setting sleep alarms %{public}@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_updateSleepAlarmsFromExistingAlarms:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(id **)(a1 + 32);
  v7 = (void *)objc_msgSend(v6[2], "copy");
  objc_msgSend(v6, "_queue_setAllAlarms:sleepAlarms:source:persist:notify:override:", v7, v5, *(_QWORD *)(a1 + 48), 1, 1, 0);

}

- (id)_queue_updateSleepAlarmsFromExistingAlarms:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableArray *sleepAlarms;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  MTAlarmStorage *v13;
  uint8_t buf[4];
  MTAlarmStorage *v15;
  __int16 v16;
  NSMutableArray *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sleepAlarms = self->_sleepAlarms;
    *(_DWORD *)buf = 138543618;
    v15 = self;
    v16 = 2114;
    v17 = sleepAlarms;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ transferring metadata from existing sleep alarms %{public}@", buf, 0x16u);
  }

  -[NSMutableArray na_dictionaryWithKeyGenerator:](self->_sleepAlarms, "na_dictionaryWithKeyGenerator:", &__block_literal_global_13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__MTAlarmStorage__queue_updateSleepAlarmsFromExistingAlarms___block_invoke_2;
  v11[3] = &unk_1E39CC440;
  v12 = v7;
  v13 = self;
  v8 = v7;
  objc_msgSend(v4, "na_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __61__MTAlarmStorage__queue_updateSleepAlarmsFromExistingAlarms___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "alarmIDString");
}

id __61__MTAlarmStorage__queue_updateSleepAlarmsFromExistingAlarms___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "alarmIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "transferMetadataForSleepAlarm:fromPrevious:", v3, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v3;
  }
  v8 = v7;

  return v8;
}

- (id)transferMetadataForSleepAlarm:(id)a3 fromPrevious:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v6, "firedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFiredDate:", v8);

  objc_msgSend(v6, "dismissedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDismissedDate:", v9);

  objc_msgSend(v7, "setDismissedAction:", objc_msgSend(v6, "dismissedAction"));
  objc_msgSend(v6, "bedtimeFiredDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBedtimeFiredDate:", v10);

  objc_msgSend(v6, "bedtimeDismissedDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBedtimeDismissedDate:", v11);

  objc_msgSend(v7, "setBedtimeDismissedAction:", objc_msgSend(v6, "bedtimeDismissedAction"));
  objc_msgSend(v6, "snoozeFireDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSnoozeFireDate:", v12);

  objc_msgSend(v6, "bedtimeSnoozeFireDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBedtimeSnoozeFireDate:", v13);

  v14 = (void *)objc_msgSend(v7, "copy");
  -[MTAlarmStorage _applyNecessaryChangesFromExistingAlarm:updatedAlarm:](self, "_applyNecessaryChangesFromExistingAlarm:updatedAlarm:", v6, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)updateSleepAlarmsWithBlock:(id)a3 source:(id)a4
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
  -[MTAlarmStorage serializer](self, "serializer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__MTAlarmStorage_updateSleepAlarmsWithBlock_source___block_invoke;
  v11[3] = &unk_1E39CC490;
  v12 = v7;
  v13 = v6;
  v11[4] = self;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlock:", v11);

}

void __52__MTAlarmStorage_updateSleepAlarmsWithBlock_source___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__MTAlarmStorage_updateSleepAlarmsWithBlock_source___block_invoke_2;
  v6[3] = &unk_1E39CC468;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v2, "na_map:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(id **)(a1 + 32);
  v5 = (void *)objc_msgSend(v4[2], "copy");
  objc_msgSend(v4, "_queue_setAllAlarms:sleepAlarms:source:persist:notify:override:", v5, v3, *(_QWORD *)(a1 + 40), 1, 1, 0);

}

id __52__MTAlarmStorage_updateSleepAlarmsWithBlock_source___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return v3;
}

- (id)activeSleepAlarm
{
  void *v2;
  void *v3;

  -[MTAlarmStorage sleepAlarms](self, "sleepAlarms");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_firstObjectPassingTest:", &__block_literal_global_65);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __34__MTAlarmStorage_activeSleepAlarm__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isFiring") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isSnoozed");

  return v3;
}

- (void)snoozeAlarmWithIdentifier:(id)a3 snoozeAction:(unint64_t)a4 withCompletion:(id)a5 source:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = a5;
  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (a4 == 1)
    v15 = CFSTR("MTBedtimeSnoozeDuration");
  else
    v15 = CFSTR("MTAlarmSnoozeDuration");
  if (a4 == 1)
    v16 = 10;
  else
    v16 = 9;
  v17 = objc_msgSend(v13, "integerForKey:defaultValue:", v15, v16);

  MTLogForCategory(3);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138543618;
    v22 = v10;
    v23 = 2050;
    v24 = v17;
    _os_log_impl(&dword_19AC4E000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ snoozing for %{public}lu minutes", (uint8_t *)&v21, 0x16u);
  }

  (*((void (**)(void))self->_currentDateProvider + 2))();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dateByAddingTimeInterval:", (double)(60 * v17));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTAlarmStorage snoozeAlarmWithIdentifier:snoozeDate:snoozeAction:withCompletion:source:](self, "snoozeAlarmWithIdentifier:snoozeDate:snoozeAction:withCompletion:source:", v10, v20, a4, v12, v11);
}

- (void)snoozeAlarmWithIdentifier:(id)a3 snoozeDate:(id)a4 snoozeAction:(unint64_t)a5 withCompletion:(id)a6 source:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  unint64_t v28;
  uint8_t buf[4];
  MTAlarmStorage *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  unint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  MTLogForCategory(3);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v30 = self;
    v31 = 2114;
    v32 = v12;
    v33 = 2048;
    v34 = a5;
    _os_log_impl(&dword_19AC4E000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ snoozing alarm with ID %{public}@ and action %ld", buf, 0x20u);
  }

  MTLogForCategory(9);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19AC4E000, v17, OS_LOG_TYPE_INFO, "MTAlarmStorage - Snoozing Alarm", buf, 2u);
  }

  -[MTAlarmStorage serializer](self, "serializer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __90__MTAlarmStorage_snoozeAlarmWithIdentifier_snoozeDate_snoozeAction_withCompletion_source___block_invoke;
  v23[3] = &unk_1E39CC4D8;
  v23[4] = self;
  v24 = v12;
  v27 = v14;
  v28 = a5;
  v25 = v13;
  v26 = v15;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  objc_msgSend(v18, "performBlock:", v23);

}

uint64_t __90__MTAlarmStorage_snoozeAlarmWithIdentifier_snoozeDate_snoozeAction_withCompletion_source___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_snoozeAlarmWithIdentifier:snoozeDate:snoozeAction:withCompletion:source:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

- (void)dismissAlarmWithIdentifier:(id)a3 dismissAction:(unint64_t)a4 withCompletion:(id)a5 source:(id)a6
{
  _QWORD *currentDateProvider;
  void (*v11)(_QWORD *);
  id v12;
  id v13;
  id v14;
  id v15;

  currentDateProvider = self->_currentDateProvider;
  v11 = (void (*)(_QWORD *))currentDateProvider[2];
  v12 = a6;
  v13 = a5;
  v14 = a3;
  v11(currentDateProvider);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[MTAlarmStorage dismissAlarmWithIdentifier:dismissDate:dismissAction:withCompletion:source:](self, "dismissAlarmWithIdentifier:dismissDate:dismissAction:withCompletion:source:", v14, v15, a4, v13, v12);

}

- (void)dismissAlarmWithIdentifier:(id)a3 dismissDate:(id)a4 dismissAction:(unint64_t)a5 withCompletion:(id)a6 source:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  unint64_t v29;
  uint8_t buf[4];
  MTAlarmStorage *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  MTLogForCategory(3);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    MTDismissAlarmActionDescription(a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = self;
    v32 = 2114;
    v33 = v12;
    v34 = 2114;
    v35 = v17;
    _os_log_impl(&dword_19AC4E000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing alarm with ID %{public}@ and action %{public}@", buf, 0x20u);

  }
  MTLogForCategory(9);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19AC4E000, v18, OS_LOG_TYPE_INFO, "MTAlarmStorage - Dismissing Alarm", buf, 2u);
  }

  -[MTAlarmStorage serializer](self, "serializer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __93__MTAlarmStorage_dismissAlarmWithIdentifier_dismissDate_dismissAction_withCompletion_source___block_invoke;
  v24[3] = &unk_1E39CC4D8;
  v24[4] = self;
  v25 = v12;
  v28 = v14;
  v29 = a5;
  v26 = v13;
  v27 = v15;
  v20 = v15;
  v21 = v14;
  v22 = v13;
  v23 = v12;
  objc_msgSend(v19, "performBlock:", v24);

}

uint64_t __93__MTAlarmStorage_dismissAlarmWithIdentifier_dismissDate_dismissAction_withCompletion_source___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_dismissAlarmWithIdentifier:dismissDate:dismissAction:withCompletion:source:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

- (void)alarmWithIdentifier:(id)a3 withCompletion:(id)a4
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
  -[MTAlarmStorage serializer](self, "serializer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__MTAlarmStorage_alarmWithIdentifier_withCompletion___block_invoke;
  v11[3] = &unk_1E39CB8D0;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlock:", v11);

}

void __53__MTAlarmStorage_alarmWithIdentifier_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_alarmMatchingAlarmIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    v4 = v2;
    (*(void (**)(void))(v3 + 16))();
    v2 = v4;
  }

}

- (void)_queue_addAlarm:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint8_t v18[16];
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *))a4;
  v10 = a5;
  if (-[MTAlarmStorage _queue_hasMatchingAlarm:](self, "_queue_hasMatchingAlarm:", v8))
  {
    MTLogForCategory(3);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MTAlarmStorage _queue_addAlarm:withCompletion:source:].cold.1();

    v12 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2D50];
    v21[0] = CFSTR("Alarm already exists!");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobiletimerd.MTAlarmStorage"), 1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    MTLogForCategory(9);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_19AC4E000, v15, OS_LOG_TYPE_INFO, "MTAlarmStorage - Failed Adding Alarm", v18, 2u);
    }
  }
  else
  {
    -[MTAlarmStorage _queuePersistAlarm:replacingAlarm:](self, "_queuePersistAlarm:replacingAlarm:", v8, 0);
    v16 = objc_claimAutoreleasedReturnValue();

    v19 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTAlarmStorage _notifyObserversForAlarmAdd:source:](self, "_notifyObserversForAlarmAdd:source:", v17, v10);

    MTLogForCategory(9);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_19AC4E000, v15, OS_LOG_TYPE_INFO, "MTAlarmStorage - Finished Adding Alarm", v18, 2u);
    }
    v14 = 0;
    v8 = (id)v16;
  }

  if (v9)
    v9[2](v9, v14);

}

- (void)_queue_updateAlarmWithIdentifier:(id)a3 changeSet:(id)a4 withCompletion:(id)a5 source:(id)a6
{
  id v10;
  void (**v11)(id, void *);
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint8_t v22[8];
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = (void (**)(id, void *))a5;
  v12 = a6;
  -[MTAlarmStorage _queue_alarmMatchingAlarmIdentifier:](self, "_queue_alarmMatchingAlarmIdentifier:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = (void *)objc_msgSend(v13, "mutableCopy");
    objc_msgSend(v15, "applyChangesFromChangeSet:", v10);
    v16 = -[MTAlarmStorage _queue_updateAlarm:withCompletion:source:](self, "_queue_updateAlarm:withCompletion:source:", v15, v11, v12);

  }
  else
  {
    MTLogForCategory(3);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MTAlarmStorage _queue_updateAlarmWithIdentifier:changeSet:withCompletion:source:].cold.1();

    v18 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    v24[0] = CFSTR("Alarm does not exist!");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobiletimerd.MTAlarmStorage"), 2, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    MTLogForCategory(9);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_19AC4E000, v21, OS_LOG_TYPE_INFO, "MTAlarmStorage - Failed Updating Alarm", v22, 2u);
    }

    if (v11)
      v11[2](v11, v20);

  }
}

- (id)_queue_updateAlarm:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  uint8_t buf[4];
  MTAlarmStorage *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *))a4;
  v10 = a5;
  -[MTAlarmStorage _queue_alarmMatchingAlarm:](self, "_queue_alarmMatchingAlarm:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if (objc_msgSend(v11, "isSleepAlarm"))
      v13 = 11;
    else
      v13 = 10;
    v37 = v13;
    if (((objc_msgSend(v12, "isSleepAlarm") & 1) != 0 || objc_msgSend(v12, "repeats"))
      && objc_msgSend(v12, "isFiring")
      && (objc_msgSend(v8, "isEnabled") & 1) == 0)
    {
      (*((void (**)(void))self->_currentDateProvider + 2))();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      MTLogForCategory(3);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "alarmIDString");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firedDate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dismissedDate");
        *(_DWORD *)buf = 138544386;
        v43 = self;
        v44 = 2114;
        v45 = v36;
        v46 = 2114;
        v47 = v33;
        v48 = 2114;
        v49 = v31;
        v50 = 2114;
        v51 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)v51;
        _os_log_impl(&dword_19AC4E000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ Alarm %{public}@ disabled while firing (%{public}@).  Dismissing: %{public}@ (last dismissed: %{public}@)", buf, 0x34u);

      }
      v35 = objc_msgSend(v8, "mutableCopy");
      -[MTAlarmStorage _queue_dismissMutableAlarm:dismissDate:dismissAction:](self, "_queue_dismissMutableAlarm:dismissDate:dismissAction:", v35, v31, v13);

      v14 = 1;
      v8 = (id)v35;
    }
    else
    {
      v14 = 0;
    }
    -[MTAlarmStorage _queuePersistAlarm:replacingAlarm:](self, "_queuePersistAlarm:replacingAlarm:", v8, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTChangeSet changeSetWithChangesFromObject:toObject:](MTChangeSet, "changeSetWithChangesFromObject:toObject:", v8, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTAlarm propertiesAffectingNotification](MTAlarm, "propertiesAffectingNotification");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "hasChangesInProperties:", v17);

    if (v18)
    {
      MTLogForCategory(3);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v15, "alarmIDString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = self;
        v44 = 2114;
        v45 = v20;
        _os_log_impl(&dword_19AC4E000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Alarm %{public}@ modified during save.  Notifying everyone.", buf, 0x16u);

      }
      MTLogForCategory(3);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[MTAlarmStorage _queue_updateAlarm:withCompletion:source:].cold.2();

      v10 = 0;
    }
    v41 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTAlarmStorage _notifyObserversForAlarmChange:previousAlarms:source:](self, "_notifyObserversForAlarmChange:previousAlarms:source:", v22, v23, v10);

    if (v14)
      -[MTAlarmStorage _notifyObserversForAlarmDismiss:dismissAction:source:](self, "_notifyObserversForAlarmDismiss:dismissAction:source:", v15, v37, v10);
    MTLogForCategory(9);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19AC4E000, v24, OS_LOG_TYPE_INFO, "MTAlarmStorage - Finished Updating Alarm", buf, 2u);
    }

    v25 = 0;
    if (v9)
LABEL_21:
      v9[2](v9, v25);
  }
  else
  {
    MTLogForCategory(3);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[MTAlarmStorage _queue_updateAlarmWithIdentifier:changeSet:withCompletion:source:].cold.1();

    v28 = (void *)MEMORY[0x1E0CB35C8];
    v38 = *MEMORY[0x1E0CB2D50];
    v39 = CFSTR("Alarm does not exist!");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobiletimerd.MTAlarmStorage"), 2, v29);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    MTLogForCategory(9);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19AC4E000, v30, OS_LOG_TYPE_INFO, "MTAlarmStorage - Failed Updating Alarm", buf, 2u);
    }

    +[MTAnalytics sendCriticalEvent:](MTAnalytics, "sendCriticalEvent:", CFSTR("Alarm storage - trying to update alarm that does not exist"));
    v15 = 0;
    if (v9)
      goto LABEL_21;
  }

  return v15;
}

- (void)_queue_removeAlarm:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  -[MTAlarmStorage _queue_alarmMatchingAlarm:](self, "_queue_alarmMatchingAlarm:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MTAlarmStorage _queue_actuallyRemoveAlarm:withCompletion:source:](self, "_queue_actuallyRemoveAlarm:withCompletion:source:", v10, v9, v8);

}

- (void)_queue_removeAlarmWithIdentifier:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  -[MTAlarmStorage _queue_alarmMatchingAlarmIdentifier:](self, "_queue_alarmMatchingAlarmIdentifier:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MTAlarmStorage _queue_actuallyRemoveAlarm:withCompletion:source:](self, "_queue_actuallyRemoveAlarm:withCompletion:source:", v10, v9, v8);

}

- (void)_queue_actuallyRemoveAlarm:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint8_t v19[16];
  uint64_t v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *))a4;
  v10 = a5;
  if (v8)
  {
    -[MTAlarmStorage _queuePersistAlarm:replacingAlarm:](self, "_queuePersistAlarm:replacingAlarm:", 0, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v22[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTAlarmStorage _notifyObserversForAlarmRemoval:source:](self, "_notifyObserversForAlarmRemoval:source:", v12, v10);

    MTLogForCategory(9);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_19AC4E000, v13, OS_LOG_TYPE_INFO, "MTAlarmStorage - Finished Removing Alarm", v19, 2u);
    }

    v14 = 0;
    if (v9)
LABEL_5:
      v9[2](v9, v14);
  }
  else
  {
    MTLogForCategory(3);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MTAlarmStorage _queue_updateAlarmWithIdentifier:changeSet:withCompletion:source:].cold.1();

    v16 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2D50];
    v21 = CFSTR("Alarm does not exist!");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobiletimerd.MTAlarmStorage"), 2, v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    MTLogForCategory(9);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_19AC4E000, v18, OS_LOG_TYPE_INFO, "MTAlarmStorage - Failed Removing Alarm", v19, 2u);
    }

    +[MTAnalytics sendCriticalEvent:](MTAnalytics, "sendCriticalEvent:", CFSTR("Alarm storage - trying to remove alarm that does not exist"));
    if (v9)
      goto LABEL_5;
  }

}

- (id)_queuePersistAlarm:(id)a3 replacingAlarm:(id)a4
{
  id v6;
  void *v7;
  NSMutableArray **p_sleepAlarms;
  int v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  void *v12;
  id v13;

  v6 = a4;
  -[MTAlarmStorage _applyNecessaryChangesFromExistingAlarm:updatedAlarm:](self, "_applyNecessaryChangesFromExistingAlarm:updatedAlarm:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isSleepAlarm") & 1) != 0 || objc_msgSend(v6, "isSleepAlarm"))
  {
    p_sleepAlarms = &self->_sleepAlarms;
    v9 = 1;
  }
  else
  {
    v9 = 0;
    p_sleepAlarms = &self->_orderedAlarms;
  }
  v10 = *p_sleepAlarms;
  v11 = v10;
  if (v6)
    -[NSMutableArray removeObject:](v10, "removeObject:", v6);
  if (v7)
    -[NSMutableArray addObject:](v11, "addObject:", v7);
  -[MTAlarmStorage _queue_persistAlarms](self, "_queue_persistAlarms");
  if (v9)
    -[MTAlarmStorage _queue_sortSleepAlarms](self, "_queue_sortSleepAlarms");
  else
    -[MTAlarmStorage _queue_sortAlarms](self, "_queue_sortAlarms");
  if (v7)
    v12 = v7;
  else
    v12 = v6;
  v13 = v12;

  return v13;
}

- (id)_applyNecessaryChangesFromExistingAlarm:(id)a3 updatedAlarm:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  int v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  (*((void (**)(void))self->_currentDateProvider + 2))();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLastModifiedDate:", v9);

  +[MTChangeSet changeSetWithChangesFromObject:toObject:](MTChangeSet, "changeSetWithChangesFromObject:toObject:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "changes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    MTLogForCategory(3);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[MTAlarmStorage _queue_updateAlarm:withCompletion:source:].cold.2();

  }
  if (objc_msgSend(v7, "isSnoozed"))
    v14 = objc_msgSend(v6, "isSnoozed");
  else
    v14 = 0;
  if (objc_msgSend(v7, "isBedtimeSnoozed"))
    v15 = objc_msgSend(v6, "isBedtimeSnoozed");
  else
    v15 = 0;
  if ((v14 | v15) == 1)
  {
    if ((objc_msgSend(v7, "isEnabled") & 1) != 0)
    {
      if (!v6
        || !v7
        || (+[MTAlarm propertiesAffectingSnooze](MTAlarm, "propertiesAffectingSnooze"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v10, "hasChangesInProperties:", v16),
            v16,
            !v17))
      {
        objc_msgSend(v7, "keepOffUntilDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "snoozeFireDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "mtIsAfterOrSameAsDate:", v22);

        if (!v23)
          goto LABEL_29;
        MTLogForCategory(3);
        v18 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          goto LABEL_25;
        objc_msgSend(v7, "alarmID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "keepOffUntilDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543618;
        v28 = v19;
        v29 = 2114;
        v30 = v24;
        _os_log_impl(&dword_19AC4E000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ was snoozed but early wake up was confirmed (%{public}@). Cancelling.", (uint8_t *)&v27, 0x16u);

        goto LABEL_24;
      }
      MTLogForCategory(3);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "alarmID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543362;
        v28 = v19;
        v20 = "%{public}@ was snoozed but had relevant changes. Cancelling.";
LABEL_20:
        _os_log_impl(&dword_19AC4E000, v18, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v27, 0xCu);
LABEL_24:

      }
    }
    else
    {
      MTLogForCategory(3);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "alarmID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543362;
        v28 = v19;
        v20 = "%{public}@ was snoozed and isn't enabled anywhere. Cancelling.";
        goto LABEL_20;
      }
    }
LABEL_25:

    if (v14)
      objc_msgSend(v8, "resetSnoozeFireDate");
    if (v15)
    {
      objc_msgSend(v8, "setBedtimeSnoozeFireDate:", 0);
      objc_msgSend(v7, "lastModifiedDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBedtimeDismissedDate:", v25);

      objc_msgSend(v8, "setBedtimeDismissedAction:", 6);
    }
  }
LABEL_29:

  return v8;
}

- (void)_queue_removeAllAlarmsForSource:(id)a3
{
  NSMutableArray *orderedAlarms;
  id v5;
  id v6;

  orderedAlarms = self->_orderedAlarms;
  v5 = a3;
  v6 = (id)-[NSMutableArray copy](orderedAlarms, "copy");
  -[MTAlarmStorage _queue_resetAlarmsTo:sleepAlarms:](self, "_queue_resetAlarmsTo:sleepAlarms:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
  -[MTAlarmStorage _queue_persistAlarms](self, "_queue_persistAlarms");
  -[MTAlarmStorage _notifyObserversForAlarmRemoval:source:](self, "_notifyObserversForAlarmRemoval:source:", v6, v5);

}

- (void)_queue_setAllAlarms:(id)a3 sleepAlarms:(id)a4 source:(id)a5
{
  -[MTAlarmStorage _queue_setAllAlarms:sleepAlarms:source:persist:notify:](self, "_queue_setAllAlarms:sleepAlarms:source:persist:notify:", a3, a4, a5, 1, 1);
}

- (void)_queue_setAllAlarms:(id)a3 sleepAlarms:(id)a4 source:(id)a5 persist:(BOOL)a6 notify:(BOOL)a7
{
  -[MTAlarmStorage _queue_setAllAlarms:sleepAlarms:source:persist:notify:override:](self, "_queue_setAllAlarms:sleepAlarms:source:persist:notify:override:", a3, a4, a5, a6, a7, 1);
}

- (void)_queue_setAllAlarms:(id)a3 sleepAlarms:(id)a4 source:(id)a5 persist:(BOOL)a6 notify:(BOOL)a7 override:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableArray *orderedAlarms;
  uint64_t v21;
  id v22;
  NSMutableArray *sleepAlarms;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  _BOOL4 v36;
  _BOOL4 v37;
  BOOL v38;
  id v39;
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  uint8_t buf[4];
  MTAlarmStorage *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  _BOOL4 v58;
  __int16 v59;
  _BOOL4 v60;
  __int16 v61;
  _BOOL4 v62;
  uint64_t v63;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v63 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v14 = a4;
  v39 = a5;
  MTLogForCategory(3);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544642;
    v52 = self;
    v53 = 2114;
    v54 = v41;
    v55 = 2114;
    v56 = v14;
    v57 = 1024;
    v58 = v10;
    v59 = 1024;
    v60 = v9;
    v61 = 1024;
    v62 = v8;
    _os_log_impl(&dword_19AC4E000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ setting alarms:%{public}@, sleep alarms: %{public}@, persist: %i, notify %i, override: %i", buf, 0x32u);
  }
  v37 = v9;
  v38 = v8;
  v36 = v10;

  v16 = (void *)objc_opt_new();
  v17 = (void *)objc_opt_new();
  v18 = (void *)objc_opt_new();
  v19 = (void *)objc_opt_new();
  orderedAlarms = self->_orderedAlarms;
  v21 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __81__MTAlarmStorage__queue_setAllAlarms_sleepAlarms_source_persist_notify_override___block_invoke;
  v49[3] = &unk_1E39CC500;
  v22 = v19;
  v50 = v22;
  -[NSMutableArray na_each:](orderedAlarms, "na_each:", v49);
  sleepAlarms = self->_sleepAlarms;
  v47[0] = v21;
  v47[1] = 3221225472;
  v47[2] = __81__MTAlarmStorage__queue_setAllAlarms_sleepAlarms_source_persist_notify_override___block_invoke_2;
  v47[3] = &unk_1E39CC500;
  v24 = v22;
  v48 = v24;
  -[NSMutableArray na_each:](sleepAlarms, "na_each:", v47);
  v40 = v14;
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v41, "arrayByAddingObjectsFromArray:", v14);
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = v41;
  }
  v26 = v25;
  v42[0] = v21;
  v42[1] = 3221225472;
  v42[2] = __81__MTAlarmStorage__queue_setAllAlarms_sleepAlarms_source_persist_notify_override___block_invoke_3;
  v42[3] = &unk_1E39CC528;
  v27 = v24;
  v43 = v27;
  v28 = v17;
  v44 = v28;
  v29 = v18;
  v45 = v29;
  v30 = v16;
  v46 = v30;
  objc_msgSend(v26, "na_each:", v42);
  objc_msgSend(v27, "allValues");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v30, "count");
  v33 = objc_msgSend(v28, "count") + v32;
  v34 = -objc_msgSend(v31, "count");
  MTLogForCategory(3);
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v52 = self;
    v53 = 1024;
    LODWORD(v54) = v33 != v34;
    _os_log_impl(&dword_19AC4E000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ setting alarms - needs update: %i", buf, 0x12u);
  }

  if (v38 || v33 != v34)
  {
    -[MTAlarmStorage _queue_resetAlarmsTo:sleepAlarms:](self, "_queue_resetAlarmsTo:sleepAlarms:", v41, v40);
    if (v36)
      -[MTAlarmStorage _queue_persistAlarms](self, "_queue_persistAlarms");
    -[MTAlarmStorage _queue_sortAlarms](self, "_queue_sortAlarms");
    if (v37)
    {
      -[MTAlarmStorage _notifyObserversForAlarmRemoval:source:](self, "_notifyObserversForAlarmRemoval:source:", v31, v39);
      -[MTAlarmStorage _notifyObserversForAlarmChange:previousAlarms:source:](self, "_notifyObserversForAlarmChange:previousAlarms:source:", v28, v29, v39);
      -[MTAlarmStorage _notifyObserversForAlarmAdd:source:](self, "_notifyObserversForAlarmAdd:source:", v30, v39);
    }
  }

}

void __81__MTAlarmStorage__queue_setAllAlarms_sleepAlarms_source_persist_notify_override___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "alarmIDString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __81__MTAlarmStorage__queue_setAllAlarms_sleepAlarms_source_persist_notify_override___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "alarmIDString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __81__MTAlarmStorage__queue_setAllAlarms_sleepAlarms_source_persist_notify_override___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9 = v3;
  objc_msgSend(v3, "alarmIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if ((objc_msgSend(v6, "isEqualToAlarm:", v9) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
    }
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v9, "alarmIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v9);
  }

}

- (void)_queue_snoozeAlarmWithIdentifier:(id)a3 snoozeDate:(id)a4 snoozeAction:(unint64_t)a5 withCompletion:(id)a6 source:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, void *);
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  const __CFString *v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = (void (**)(id, void *))a6;
  v15 = a7;
  -[MTAlarmStorage _queue_alarmMatchingAlarmIdentifier:](self, "_queue_alarmMatchingAlarmIdentifier:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = (void *)objc_msgSend(v16, "mutableCopy");
    objc_msgSend(v18, "setEnabled:", 1);
    if ((a5 & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      if (a5 != 1)
      {
LABEL_21:
        -[MTAlarmStorage _queue_updateAlarm:withCompletion:source:](self, "_queue_updateAlarm:withCompletion:source:", v18, v14, v15);
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = (void *)v31;
        if (v31)
          v33 = (void *)v31;
        else
          v33 = v18;
        -[MTAlarmStorage _notifyObserversForAlarmSnooze:snoozeAction:source:](self, "_notifyObserversForAlarmSnooze:snoozeAction:source:", v33, a5, v15);
        MTLogForCategory(9);
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19AC4E000, v34, OS_LOG_TYPE_INFO, "MTAlarmStorage - Finished Snoozing Alarm", buf, 2u);
        }

        goto LABEL_27;
      }
      objc_msgSend(v18, "bedtimeSnoozeFireDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        objc_msgSend(v18, "setBedtimeSnoozeFireDate:", v13);
        goto LABEL_21;
      }
      MTLogForCategory(3);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v18, "bedtimeSnoozeFireDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v38 = v12;
        v39 = 2114;
        v40 = v21;
        v41 = 2114;
        v42 = v13;
        _os_log_impl(&dword_19AC4E000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ has a bed-time snooze fire date of %{public}@ and we want to snooze until %{public}@.  Picking later date", buf, 0x20u);

      }
      objc_msgSend(v18, "bedtimeSnoozeFireDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "laterDate:", v13);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setBedtimeSnoozeFireDate:", v23);
    }
    else
    {
      objc_msgSend(v18, "snoozeFireDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
        objc_msgSend(v18, "setSnoozeFireDate:", v13);
        goto LABEL_21;
      }
      MTLogForCategory(3);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v18, "snoozeFireDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v38 = v12;
        v39 = 2114;
        v40 = v30;
        v41 = 2114;
        v42 = v13;
        _os_log_impl(&dword_19AC4E000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ has a snooze fire date of %{public}@ and we want to snooze until %{public}@.  Picking later date", buf, 0x20u);

      }
      objc_msgSend(v18, "snoozeFireDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "laterDate:", v13);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setSnoozeFireDate:", v23);
    }

    goto LABEL_21;
  }
  MTLogForCategory(3);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    -[MTAlarmStorage _queue_snoozeAlarmWithIdentifier:snoozeDate:snoozeAction:withCompletion:source:].cold.1();

  +[MTAnalytics sendCriticalEvent:](MTAnalytics, "sendCriticalEvent:", CFSTR("Alarm storage - trying to snooze alarm that does not exist"));
  v25 = (void *)MEMORY[0x1E0CB35C8];
  v35 = *MEMORY[0x1E0CB2D50];
  v36 = CFSTR("Alarm does not exist!");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobiletimerd.MTAlarmStorage"), 2, v26);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    MTLogForCategory(9);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19AC4E000, v27, OS_LOG_TYPE_INFO, "MTAlarmStorage - Failed Snoozing Alarm", buf, 2u);
    }

    v14[2](v14, v18);
  }
LABEL_27:

}

- (void)_queue_dismissMutableAlarm:(id)a3 dismissDate:(id)a4 dismissAction:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  MTAlarmStorage *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (MTDismissAlarmActionIsForBedtime(a5))
  {
    objc_msgSend(v8, "setBedtimeDismissedDate:", v9);
    objc_msgSend(v8, "setBedtimeDismissedAction:", a5);
  }
  else if (MTDismissAlarmActionCountsAsWakeUp(a5))
  {
    objc_msgSend(v8, "setDismissedDate:", v9);
    objc_msgSend(v8, "setDismissedAction:", a5);
  }
  if (a5 - 5 <= 1)
  {
    objc_msgSend(v8, "setSnoozeFireDate:", 0);
    if ((objc_msgSend(v8, "repeats") & 1) == 0 && (objc_msgSend(v8, "isSleepAlarm") & 1) == 0)
    {
      MTLogForCategory(3);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "alarmID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = self;
        v14 = 2114;
        v15 = v11;
        _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting non-repeating alarm %{public}@ to disabled", (uint8_t *)&v12, 0x16u);

      }
      objc_msgSend(v8, "setEnabled:", 0);
    }
  }

}

- (void)_queue_dismissAlarmWithIdentifier:(id)a3 dismissDate:(id)a4 dismissAction:(unint64_t)a5 withCompletion:(id)a6 source:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, void *);
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  const __CFString *v29;
  uint8_t buf[4];
  MTAlarmStorage *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = (void (**)(id, void *))a6;
  v15 = a7;
  -[MTAlarmStorage _queue_alarmMatchingAlarmIdentifier:](self, "_queue_alarmMatchingAlarmIdentifier:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = (void *)objc_msgSend(v16, "mutableCopy");
    -[MTAlarmStorage _queue_dismissMutableAlarm:dismissDate:dismissAction:](self, "_queue_dismissMutableAlarm:dismissDate:dismissAction:", v18, v13, a5);
    MTLogForCategory(3);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v31 = self;
      v32 = 2114;
      v33 = v18;
      v34 = 2114;
      v35 = v13;
      _os_log_impl(&dword_19AC4E000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissed alarm %{public}@ at %{public}@", buf, 0x20u);
    }

    -[MTAlarmStorage _queue_updateAlarm:withCompletion:source:](self, "_queue_updateAlarm:withCompletion:source:", v18, v14, v15);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v20)
      v22 = (void *)v20;
    else
      v22 = v18;
    -[MTAlarmStorage _notifyObserversForAlarmDismiss:dismissAction:source:](self, "_notifyObserversForAlarmDismiss:dismissAction:source:", v22, a5, v15);
    MTLogForCategory(9);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19AC4E000, v23, OS_LOG_TYPE_INFO, "MTAlarmStorage - Finished Dismissing Alarm", buf, 2u);
    }

  }
  else
  {
    MTLogForCategory(3);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[MTAlarmStorage _queue_dismissAlarmWithIdentifier:dismissDate:dismissAction:withCompletion:source:].cold.1();

    +[MTAnalytics sendCriticalEvent:](MTAnalytics, "sendCriticalEvent:", CFSTR("Alarm storage - trying to dismiss alarm that does not exist"));
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2D50];
    v29 = CFSTR("Alarm does not exist!");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobiletimerd.MTAlarmStorage"), 2, v26);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      MTLogForCategory(9);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19AC4E000, v27, OS_LOG_TYPE_INFO, "MTAlarmStorage - Failed Dismissing Alarm", buf, 2u);
      }

      v14[2](v14, v18);
    }
  }

}

- (void)_queue_sortAlarms
{
  NSMutableArray *orderedAlarms;
  id v3;

  orderedAlarms = self->_orderedAlarms;
  MTAlarmStandardSort();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray sortUsingComparator:](orderedAlarms, "sortUsingComparator:", v3);

}

- (void)_queue_sortSleepAlarms
{
  NSMutableArray *sleepAlarms;
  id v3;

  sleepAlarms = self->_sleepAlarms;
  MTAlarmStandardSort();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray sortUsingComparator:](sleepAlarms, "sortUsingComparator:", v3);

}

- (void)registerObserver:(id)a3
{
  -[MTObserverStore addObserver:](self->_observers, "addObserver:", a3);
}

- (void)_notifyObserversWithBlock:(id)a3
{
  -[MTObserverStore enumerateObserversWithBlock:](self->_observers, "enumerateObserversWithBlock:", a3);
}

- (void)_notifyObserversForAlarmAdd:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  MTAlarmStorage *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count")
    && ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v7, "dontNotify") & 1) == 0))
  {
    MTLogForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for alarm addition", buf, 0xCu);
    }

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__MTAlarmStorage__notifyObserversForAlarmAdd_source___block_invoke;
    v9[3] = &unk_1E39CC550;
    v10 = v7;
    v11 = v6;
    -[MTAlarmStorage _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v9);

  }
}

uint64_t __53__MTAlarmStorage__notifyObserversForAlarmAdd_source___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "source:didAddAlarms:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_notifyObserversForAlarmChange:(id)a3 previousAlarms:(id)a4 source:(id)a5
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
  MTAlarmStorage *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count")
    && ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v10, "dontNotify") & 1) == 0))
  {
    MTLogForCategory(3);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = self;
      _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for alarm change", buf, 0xCu);
    }

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__MTAlarmStorage__notifyObserversForAlarmChange_previousAlarms_source___block_invoke;
    v12[3] = &unk_1E39CC578;
    v13 = v10;
    v14 = v8;
    v15 = v9;
    -[MTAlarmStorage _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v12);

  }
}

void __71__MTAlarmStorage__notifyObserversForAlarmChange_previousAlarms_source___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "source:didUpdateAlarms:", a1[4], a1[5]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "source:didUpdateAlarms:previousAlarms:", a1[4], a1[5], a1[6]);

}

- (void)_notifyObserversForAlarmRemoval:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  MTAlarmStorage *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count")
    && ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v7, "dontNotify") & 1) == 0))
  {
    MTLogForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for alarm removal", buf, 0xCu);
    }

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__MTAlarmStorage__notifyObserversForAlarmRemoval_source___block_invoke;
    v9[3] = &unk_1E39CC550;
    v10 = v7;
    v11 = v6;
    -[MTAlarmStorage _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v9);

  }
}

uint64_t __57__MTAlarmStorage__notifyObserversForAlarmRemoval_source___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "source:didRemoveAlarms:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_notifyObserversForAlarmSnooze:(id)a3 snoozeAction:(unint64_t)a4 source:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  unint64_t v14;
  uint8_t buf[4];
  MTAlarmStorage *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v9, "dontNotify") & 1) == 0)
  {
    MTLogForCategory(3);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = self;
      _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for alarm snooze", buf, 0xCu);
    }

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __69__MTAlarmStorage__notifyObserversForAlarmSnooze_snoozeAction_source___block_invoke;
    v11[3] = &unk_1E39CC5A0;
    v12 = v9;
    v13 = v8;
    v14 = a4;
    -[MTAlarmStorage _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v11);

  }
}

uint64_t __69__MTAlarmStorage__notifyObserversForAlarmSnooze_snoozeAction_source___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "source:didSnoozeAlarm:snoozeAction:", a1[4], a1[5], a1[6]);
}

- (void)_notifyObserversForAlarmDismiss:(id)a3 dismissAction:(unint64_t)a4 source:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  unint64_t v14;
  uint8_t buf[4];
  MTAlarmStorage *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v9, "dontNotify") & 1) == 0)
  {
    MTLogForCategory(3);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = self;
      _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for alarm dismissal", buf, 0xCu);
    }

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71__MTAlarmStorage__notifyObserversForAlarmDismiss_dismissAction_source___block_invoke;
    v11[3] = &unk_1E39CC5A0;
    v12 = v9;
    v13 = v8;
    v14 = a4;
    -[MTAlarmStorage _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v11);

  }
}

uint64_t __71__MTAlarmStorage__notifyObserversForAlarmDismiss_dismissAction_source___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "source:didDismissAlarm:dismissAction:", a1[4], a1[5], a1[6]);
}

- (void)_notifyObserversForAlarmFire:(id)a3 triggerType:(unint64_t)a4 source:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  unint64_t v14;
  uint8_t buf[4];
  MTAlarmStorage *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v9, "dontNotify") & 1) == 0)
  {
    MTLogForCategory(3);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = self;
      _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for alarm fire", buf, 0xCu);
    }

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__MTAlarmStorage__notifyObserversForAlarmFire_triggerType_source___block_invoke;
    v11[3] = &unk_1E39CC5A0;
    v12 = v9;
    v13 = v8;
    v14 = a4;
    -[MTAlarmStorage _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v11);

  }
}

uint64_t __66__MTAlarmStorage__notifyObserversForAlarmFire_triggerType_source___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "source:didFireAlarm:triggerType:", a1[4], a1[5], a1[6]);
}

- (void)_notifyObserversForNextAlarmChange:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  MTAlarmStorage *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v7, "dontNotify") & 1) == 0)
  {
    MTLogForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for next alarm change", buf, 0xCu);
    }

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__MTAlarmStorage__notifyObserversForNextAlarmChange_source___block_invoke;
    v9[3] = &unk_1E39CC550;
    v10 = v7;
    v11 = v6;
    -[MTAlarmStorage _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v9);

  }
}

uint64_t __60__MTAlarmStorage__notifyObserversForNextAlarmChange_source___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "source:didChangeNextAlarm:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)scheduler:(id)a3 didChangeNextAlarm:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v6 = a4;
  v7 = a3;
  MTLogForCategory(9);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "MTAlarmStorage - Next Alarm Changed", v10, 2u);
  }

  objc_msgSend(v6, "scheduleable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTAlarmStorage _notifyObserversForNextAlarmChange:source:](self, "_notifyObserversForNextAlarmChange:source:", v9, v7);
}

- (void)scheduler:(id)a3 didFireAlarm:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v6 = a4;
  v7 = a3;
  MTLogForCategory(9);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_INFO, "MTAlarmStorage - Fired Alarm", v11, 2u);
  }

  objc_msgSend(v6, "scheduleable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trigger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTAlarmStorage _notifyObserversForAlarmFire:triggerType:source:](self, "_notifyObserversForAlarmFire:triggerType:source:", v9, objc_msgSend(v10, "triggerType"), v7);
}

- (id)_queue_alarmMatchingAlarm:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "alarmIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTAlarmStorage _queue_alarmMatchingAlarmIdentifier:](self, "_queue_alarmMatchingAlarmIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_queue_alarmMatchingAlarmIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[MTAlarmStorage _queue_allAlarms](self, "_queue_allAlarms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__MTAlarmStorage__queue_alarmMatchingAlarmIdentifier___block_invoke;
  v9[3] = &unk_1E39CB510;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __54__MTAlarmStorage__queue_alarmMatchingAlarmIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "alarmIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)_queue_hasMatchingAlarm:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "alarmID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTAlarmStorage _queue_alarmMatchingAlarmIdentifier:](self, "_queue_alarmMatchingAlarmIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (void)_queue_persistAlarms
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  -[MTAlarmStorage persistence](self, "persistence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v10 = (id)objc_opt_new();
    objc_msgSend(v10, "encodeObject:forKey:", self->_orderedAlarms, CFSTR("MTAlarms"));
    objc_msgSend(v10, "encodeObject:forKey:", self->_sleepAlarms, CFSTR("MTSleepAlarms"));
    objc_msgSend(v10, "encodedDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTAlarmStorage persistence](self, "persistence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("MTAlarms"));

    -[MTAlarmStorage persistence](self, "persistence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = 3.5;
    objc_msgSend(v6, "setFloat:forKey:", CFSTR("MTAlarmStorageVersion"), v7);

    -[MTAlarmStorage persistence](self, "persistence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))self->_currentDateProvider + 2))();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("MTAlarmModifiedDate"));

  }
}

- (void)handleMigrationFinish
{
  -[MTAlarmStorage _removeAlarmDataIfNecessary:](self, "_removeAlarmDataIfNecessary:", 0);
}

- (void)timeListener:(id)a3 didDetectSignificantTimeChangeWithCompletionBlock:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  MTAlarmStorage *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MTLogForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = self;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ significant time change detected, rescheduling alarms", buf, 0xCu);
  }

  -[MTAlarmStorage serializer](self, "serializer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__MTAlarmStorage_timeListener_didDetectSignificantTimeChangeWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E39CB880;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "performBlock:", v9);

}

void __81__MTAlarmStorage_timeListener_didDetectSignificantTimeChangeWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id obj;
  uint64_t v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v41 = (void *)objc_opt_new();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_queue_allAlarms");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v3)
  {
    v4 = v3;
    v40 = *(_QWORD *)v43;
    v38 = v2;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v43 != v40)
          objc_enumerationMutation(obj);
        v6 = *(id *)(*((_QWORD *)&v42 + 1) + 8 * i);
        (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 16))();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "firedDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "mtIsAfterDate:", v7);

        v10 = v6;
        if (v9)
        {
          MTLogForCategory(3);
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v12 = *(_QWORD *)(a1 + 32);
            objc_msgSend(v6, "alarmID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v47 = v12;
            v48 = 2114;
            v49 = v13;
            _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ resetting firedDate on %{public}@ because it's in the future", buf, 0x16u);

          }
          v10 = (void *)objc_msgSend(v6, "mutableCopy");
          objc_msgSend(v10, "setFiredDate:", 0);
          objc_msgSend(v6, "dismissedDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "mtIsAfterDate:", v7);

          if (v15)
          {
            MTLogForCategory(3);
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              v17 = *(_QWORD *)(a1 + 32);
              objc_msgSend(v6, "alarmID");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v47 = v17;
              v48 = 2114;
              v49 = v18;
              _os_log_impl(&dword_19AC4E000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ resetting dismissedDate on %{public}@ because it's in the future", buf, 0x16u);

            }
            objc_msgSend(v10, "setDismissedDate:", 0);
          }

        }
        objc_msgSend(v6, "bedtimeFiredDate", v38);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "mtIsAfterDate:", v7);

        if (v20)
        {
          MTLogForCategory(3);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v22 = *(_QWORD *)(a1 + 32);
            objc_msgSend(v6, "alarmID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v47 = v22;
            v48 = 2114;
            v49 = v23;
            _os_log_impl(&dword_19AC4E000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ resetting bedtimeFiredDate on %{public}@ because it's in the future", buf, 0x16u);

          }
          v24 = (void *)objc_msgSend(v10, "mutableCopy");
          objc_msgSend(v24, "setBedtimeFiredDate:", 0);
          objc_msgSend(v6, "bedtimeDismissedDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "mtIsAfterDate:", v7);

          if (v26)
          {
            MTLogForCategory(3);
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              v28 = *(_QWORD *)(a1 + 32);
              objc_msgSend(v6, "alarmID");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v47 = v28;
              v2 = v38;
              v48 = 2114;
              v49 = v29;
              _os_log_impl(&dword_19AC4E000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ resetting bedtimeDismissedDate on %{public}@ because it's in the future", buf, 0x16u);

            }
            objc_msgSend(v24, "setBedtimeDismissedDate:", 0);
          }

        }
        else
        {
          v24 = v10;
        }
        objc_msgSend(v6, "lastModifiedDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "mtIsAfterDate:", v7);

        if (v31)
        {
          MTLogForCategory(3);
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v33 = *(_QWORD *)(a1 + 32);
            objc_msgSend(v6, "alarmID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v47 = v33;
            v2 = v38;
            v48 = 2114;
            v49 = v34;
            _os_log_impl(&dword_19AC4E000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ resetting lastModifiedDate on %{public}@ because it's in the future", buf, 0x16u);

          }
          v35 = (void *)objc_msgSend(v24, "mutableCopy");
          objc_msgSend(v35, "setLastModifiedDate:", v7);

          v24 = v35;
        }
        if (objc_msgSend(v6, "isSleepAlarm"))
          v36 = v41;
        else
          v36 = v2;
        objc_msgSend(v36, "addObject:", v24);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_setAllAlarms:sleepAlarms:source:persist:notify:", v2, v41, 0, 1, 0);
  objc_msgSend(*(id *)(a1 + 32), "scheduler");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "rescheduleAlarmsWithCompletion:", *(_QWORD *)(a1 + 40));

}

- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.mobiletimerd.reset"), a4);
}

- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  int v10;
  MTAlarmStorage *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(_QWORD))a5;
  MTLogForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ handling notification %{public}@", (uint8_t *)&v10, 0x16u);
  }

  -[MTAlarmStorage removeAllAlarmsForSource:](self, "removeAllAlarmsForSource:", 0);
  if (v8)
    v8[2](v8);

}

- (void)printDiagnostics
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "-----MTAlarmStorage-----", (uint8_t *)&v10, 2u);
  }

  MTLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[MTAlarmStorage _diagnosticDictionaryForAlarms:](self, "_diagnosticDictionaryForAlarms:", self->_orderedAlarms);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v5;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "Alarms: %{public}@", (uint8_t *)&v10, 0xCu);

  }
  MTLogForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[MTAlarmStorage _diagnosticDictionaryForAlarms:](self, "_diagnosticDictionaryForAlarms:", self->_sleepAlarms);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "Sleep Alarms: %{public}@", (uint8_t *)&v10, 0xCu);

  }
  MTLogForCategory(3);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[MTAlarmStorage lastModifiedDate](self, "lastModifiedDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "Last Modified: %{public}@", (uint8_t *)&v10, 0xCu);

  }
}

- (id)gatherDiagnostics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("Alarms");
  -[MTAlarmStorage _diagnosticDictionaryForAlarms:](self, "_diagnosticDictionaryForAlarms:", self->_orderedAlarms);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("Sleep Alarms");
  -[MTAlarmStorage _diagnosticDictionaryForAlarms:](self, "_diagnosticDictionaryForAlarms:", self->_sleepAlarms);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("Alarms Last Modified");
  -[MTAlarmStorage lastModifiedDate](self, "lastModifiedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_diagnosticDictionaryForAlarms:(id)a3
{
  id v4;
  void *v5;
  dispatch_semaphore_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  dispatch_semaphore_t v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  MTAlarmStorage *v17;
  dispatch_semaphore_t v18;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = dispatch_semaphore_create(0);
  -[MTAlarmStorage serializer](self, "serializer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__MTAlarmStorage__diagnosticDictionaryForAlarms___block_invoke;
  v14[3] = &unk_1E39CC3F8;
  v15 = v4;
  v8 = v5;
  v16 = v8;
  v17 = self;
  v18 = v6;
  v9 = v6;
  v10 = v4;
  objc_msgSend(v7, "performBlock:", v14);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v11 = v18;
  v12 = v8;

  return v12;
}

intptr_t __49__MTAlarmStorage__diagnosticDictionaryForAlarms___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v6);
        objc_msgSend((id)objc_opt_class(), "_diagnosticDictionaryForAlarm:", v7, (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(a1 + 40);
        objc_msgSend(v7, "alarmIDString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

+ (id)_diagnosticDictionaryForAlarm:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("enabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "hour"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("hour"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "minute"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("minute"));

  if (objc_msgSend(v3, "isSleepAlarm"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "bedtimeHour"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("bedtimeHour"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "bedtimeMinute"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("bedtimeMinute"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isFiring"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("firing"));

  objc_msgSend(v3, "firedDate");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = CFSTR("None");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("fired"));

  objc_msgSend(v3, "lastModifiedDate");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = CFSTR("None");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("modified"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isSnoozed"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("snoozed"));

  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "sound");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "toneIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sound");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "mediaItemIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sound");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "vibrationIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sound");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "soundVolume");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("toneID: %@, mediaItemID: %@, vibeID: %@, volume: %@"), v19, v21, v23, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("sound"));

  return v4;
}

- (void)_removeAlarmDataIfNecessary:(id)a3
{
  __CFString *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD v10[5];
  uint8_t buf[4];
  MTAlarmStorage *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("com.apple.mobiletimer");
  if ((objc_msgSend(a3, "isEqualToString:", v5) & 1) != 0
    || !a3
    && (+[MTApplicationWorkspaceObserver sharedWorkspaceObserver](MTApplicationWorkspaceObserver, "sharedWorkspaceObserver"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v8, "isApplicationInstalledForBundleIdentifier:", v5), v8, (v9 & 1) == 0))
  {
    MTLogForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = self;
      _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ removing all alarms (sans sleep)", buf, 0xCu);
    }

    -[MTAlarmStorage serializer](self, "serializer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __46__MTAlarmStorage__removeAlarmDataIfNecessary___block_invoke;
    v10[3] = &unk_1E39CB858;
    v10[4] = self;
    objc_msgSend(v7, "performBlock:", v10);

  }
}

void __46__MTAlarmStorage__removeAlarmDataIfNecessary___block_invoke(uint64_t a1)
{
  id *v1;
  id v2;

  v1 = *(id **)(a1 + 32);
  v2 = (id)objc_msgSend(v1[3], "copy");
  objc_msgSend(v1, "_queue_setAllAlarms:sleepAlarms:source:", MEMORY[0x1E0C9AA60], v2, 0);

}

- (NSMutableArray)orderedAlarms
{
  return self->_orderedAlarms;
}

- (void)setOrderedAlarms:(id)a3
{
  objc_storeStrong((id *)&self->_orderedAlarms, a3);
}

- (void)setSleepAlarms:(id)a3
{
  objc_storeStrong((id *)&self->_sleepAlarms, a3);
}

- (void)setLastModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastModifiedDate, a3);
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

- (MTAlarmMigrator)migrator
{
  return self->_migrator;
}

- (void)setMigrator:(id)a3
{
  objc_storeStrong((id *)&self->_migrator, a3);
}

- (MTPersistence)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_persistence, a3);
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_migrator, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_sleepAlarms, 0);
  objc_storeStrong((id *)&self->_orderedAlarms, 0);
  objc_destroyWeak((id *)&self->_scheduler);
}

- (void)_cleanUpSnoozeFireDate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_19AC4E000, v0, v1, "%{public}@ cleaning up snooze fire date for sleep alarm %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_cleanUpSleepAlarmRepeat:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_19AC4E000, v0, v1, "%{public}@ cleaning up repeat schedule for sleep alarm %{public}@");
  OUTLINED_FUNCTION_2();
}

void __44__MTAlarmStorage__loadAlarmsWithCompletion___block_invoke_cold_1()
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
  _os_log_debug_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ loaded %{public}@, sleep alarms %{public}@", v4, 0x20u);
}

void __44__MTAlarmStorage__loadAlarmsWithCompletion___block_invoke_cold_2(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_19AC4E000, v1, v2, "%{public}@ unexpected error reading data %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __51__MTAlarmStorage__queue_resetAlarmsTo_sleepAlarms___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_19AC4E000, v1, v2, "%{public}@ ignoring misplaced sleep alarm %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __51__MTAlarmStorage__queue_resetAlarmsTo_sleepAlarms___block_invoke_59_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_19AC4E000, v1, v2, "%{public}@ ignoring misplaced regular alarm %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_queue_addAlarm:withCompletion:source:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0(&dword_19AC4E000, v0, v1, "Alarm already exists", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_1();
}

- (void)_queue_updateAlarmWithIdentifier:changeSet:withCompletion:source:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0(&dword_19AC4E000, v0, v1, "Alarm doesn't exist", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_1();
}

- (void)_queue_updateAlarm:withCompletion:source:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_2(&dword_19AC4E000, v0, v1, "%{public}@ Changes: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_queue_snoozeAlarmWithIdentifier:snoozeDate:snoozeAction:withCompletion:source:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_19AC4E000, v0, v1, "%{public}@ couldn't find matching alarm to snooze for %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_queue_dismissAlarmWithIdentifier:dismissDate:dismissAction:withCompletion:source:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_19AC4E000, v0, v1, "%{public}@ couldn't find matching alarm to dismiss for %{public}@");
  OUTLINED_FUNCTION_2();
}

@end

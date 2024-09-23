@implementation MTSleepSessionManager

- (MTSleepSessionManager)initWithAlarmStorage:(id)a3 sleepCoordinator:(id)a4 sleepSessionTracker:(id)a5
{
  id v9;
  id v10;
  id v11;
  MTSleepSessionManager *v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  HKHealthStore *healthStore;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSString *archivedSessionDataPath;
  uint64_t v25;
  NSString *archivedSessionDataFile;
  uint64_t v27;
  NAScheduler *serializer;
  objc_super v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE buf[24];
  void *v36;
  uint64_t *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)MTSleepSessionManager;
  v12 = -[MTSleepSessionManager init](&v30, sel_init);
  if (v12)
  {
    MTLogForCategory(7);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v11;
      _os_log_impl(&dword_19AC4E000, v13, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@ with tracker: %{public}@", buf, 0x16u);
    }

    objc_storeStrong((id *)&v12->_alarmStorage, a3);
    objc_storeStrong((id *)&v12->_sleepSessionTracker, a5);
    -[MTSleepSessionTracker setSleepSessionTrackerDelegate:](v12->_sleepSessionTracker, "setSleepSessionTrackerDelegate:", v12);
    objc_storeWeak((id *)&v12->_sleepSessionTrackerDelegate, v10);
    v31 = 0;
    v32 = &v31;
    v33 = 0x2050000000;
    v14 = (void *)getHKHealthStoreClass_softClass;
    v34 = getHKHealthStoreClass_softClass;
    if (!getHKHealthStoreClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getHKHealthStoreClass_block_invoke;
      v36 = &unk_1E39CB690;
      v37 = &v31;
      __getHKHealthStoreClass_block_invoke((uint64_t)buf);
      v14 = (void *)v32[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v31, 8);
    v16 = objc_opt_new();
    healthStore = v12->_healthStore;
    v12->_healthStore = (HKHealthStore *)v16;

    objc_msgSend((id)objc_opt_class(), "platformSpecificSourceBundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHealthStore setSourceBundleIdentifier:](v12->_healthStore, "setSourceBundleIdentifier:", v18);

    -[HKHealthStore resume](v12->_healthStore, "resume");
    NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bundleIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByAppendingPathComponent:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    archivedSessionDataPath = v12->_archivedSessionDataPath;
    v12->_archivedSessionDataPath = (NSString *)v23;

    -[NSString stringByAppendingPathComponent:](v12->_archivedSessionDataPath, "stringByAppendingPathComponent:", CFSTR("SleepSession.data"));
    v25 = objc_claimAutoreleasedReturnValue();
    archivedSessionDataFile = v12->_archivedSessionDataFile;
    v12->_archivedSessionDataFile = (NSString *)v25;

    +[MTScheduler serialSchedulerForObject:priority:](MTScheduler, "serialSchedulerForObject:priority:", v12, +[MTScheduler defaultPriority](MTScheduler, "defaultPriority"));
    v27 = objc_claimAutoreleasedReturnValue();
    serializer = v12->_serializer;
    v12->_serializer = (NAScheduler *)v27;

  }
  return v12;
}

+ (id)platformSpecificSourceBundleIdentifier
{
  return CFSTR("com.apple.mobiletimer");
}

- (void)sleepSessionTracker:(id)a3 sessionDidComplete:(id)a4
{
  id v5;
  NSObject *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  uint64_t v9;
  char v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  uint8_t buf[4];
  MTSleepSessionManager *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MTLogForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v27 = self;
    v28 = 2114;
    v29 = v5;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ sessionDidComplete: %{public}@", buf, 0x16u);
  }

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __64__MTSleepSessionManager_sleepSessionTracker_sessionDidComplete___block_invoke;
  v25[3] = &unk_1E39CD4B0;
  v25[4] = self;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AED0080](v25);
  if ((objc_msgSend(v5, "needsAdditionalProcessing") & 1) == 0)
  {
    objc_msgSend(v5, "intervals");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (!v9)
    {
      MTLogForCategory(7);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v27 = self;
        _os_log_impl(&dword_19AC4E000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ session has nothing to write", buf, 0xCu);
      }

      -[MTSleepSessionManager sleepSessionTrackerDelegate](self, "sleepSessionTrackerDelegate");
      v15 = objc_claimAutoreleasedReturnValue();
      -[MTSleepSessionManager sleepSessionTracker](self, "sleepSessionTracker");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject sleepSessionTracker:sessionDidComplete:](v15, "sleepSessionTracker:sessionDidComplete:", v18, v5);

      goto LABEL_24;
    }
  }
  if (+[MTDeviceListener hasBeenUnlockedSinceBoot](MTDeviceListener, "hasBeenUnlockedSinceBoot"))
  {
    v10 = objc_msgSend(v5, "needsAdditionalProcessing");
    MTLogForCategory(7);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if ((v10 & 1) != 0)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138543362;
        v27 = self;
        _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ session needs additional processing", buf, 0xCu);
      }

      -[MTSleepSessionManager sleepSessionTracker](self, "sleepSessionTracker");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[MTSleepSessionManager sleepSessionTracker](self, "sleepSessionTracker");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "processedSessionForSession:", v5);
        v15 = objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          ((void (**)(_QWORD, NSObject *))v7)[2](v7, v15);
LABEL_24:

          goto LABEL_25;
        }
      }
      else
      {

      }
      MTLogForCategory(7);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[MTSleepSessionManager sleepSessionTracker:sessionDidComplete:].cold.1((uint64_t)self, v15, v19, v20, v21, v22, v23, v24);
      goto LABEL_24;
    }
    if (v12)
    {
      *(_DWORD *)buf = 138543362;
      v27 = self;
      _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ session is ready to write", buf, 0xCu);
    }

    ((void (**)(_QWORD, id))v7)[2](v7, v5);
  }
  else
  {
    MTLogForCategory(7);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = self;
      _os_log_impl(&dword_19AC4E000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ archiving session", buf, 0xCu);
    }

    -[MTSleepSessionManager archiveSession:](self, "archiveSession:", v5);
    -[MTSleepSessionManager waitForUnlock](self, "waitForUnlock");
  }
LABEL_25:

}

void __64__MTSleepSessionManager_sleepSessionTracker_sessionDidComplete___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory(7);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v12 = v5;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ writing session", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "writeSession:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__MTSleepSessionManager_sleepSessionTracker_sessionDidComplete___block_invoke_190;
  v9[3] = &unk_1E39CD488;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v7 = v3;
  v8 = (id)objc_msgSend(v6, "addSuccessBlock:", v9);

}

void __64__MTSleepSessionManager_sleepSessionTracker_sessionDidComplete___block_invoke_190(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(7);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "sleepSessionTrackerDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying %{public}@", (uint8_t *)&v7, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "sleepSessionTrackerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sleepSessionTracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sleepSessionTracker:sessionDidComplete:", v6, *(_QWORD *)(a1 + 40));

}

- (void)archiveSession:(id)a3
{
  id v4;
  void *v5;
  NAScheduler *serializer;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    serializer = self->_serializer;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__MTSleepSessionManager_archiveSession___block_invoke;
    v7[3] = &unk_1E39CB7B0;
    v7[4] = self;
    v8 = v4;
    -[NAScheduler performBlock:](serializer, "performBlock:", v7);

  }
}

void __40__MTSleepSessionManager_archiveSession___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  const __CFString *v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  __CFString *v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(7);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(const __CFString **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v28 = v3;
    v29 = 2114;
    v30 = v4;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ archiveSession: %{public}@", buf, 0x16u);
  }

  v5 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "_unprocessedSessions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
  else
    v8 = (void *)objc_opt_new();
  v9 = v8;
  objc_msgSend(v8, "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "archivedSessionDataPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "fileExistsAtPath:", v11);

  if ((v12 & 1) != 0)
    goto LABEL_12;
  MTLogForCategory(7);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *v5;
    objc_msgSend(*v5, "archivedSessionDataPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = v14;
    v29 = 2114;
    v30 = CFSTR("sleep session");
    v31 = 2114;
    v32 = v15;
    _os_log_impl(&dword_19AC4E000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ creating %{public}@ directory at %{public}@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v5, "archivedSessionDataPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v16, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v17, 1, 0, &v26);
  v18 = v26;

  if (!v18)
  {
LABEL_12:
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v18, "encodeObject:forKey:", v9, CFSTR("MTUnprocessedSessions"));
    objc_msgSend(v18, "finishEncoding");
    objc_msgSend(v18, "encodedData");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v5, "archivedSessionDataFile");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[NSObject writeToFile:atomically:](v19, "writeToFile:atomically:", v20, 1);

    MTLogForCategory(7);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v24 = *v5;
        objc_msgSend(v24, "archivedSessionDataFile");
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v24;
        v29 = 2114;
        v30 = v25;
        _os_log_impl(&dword_19AC4E000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ wrote sessions to file %{public}@", buf, 0x16u);

      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __40__MTSleepSessionManager_archiveSession___block_invoke_cold_1(v5, v23);
    }

  }
  else
  {
    MTLogForCategory(7);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __40__MTSleepSessionManager_archiveSession___block_invoke_cold_2(v5, v19);
  }

}

- (id)writeSession:(id)a3
{
  id v4;
  void *v5;
  NAScheduler *serializer;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  serializer = self->_serializer;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __38__MTSleepSessionManager_writeSession___block_invoke;
  v12[3] = &unk_1E39CB828;
  v12[4] = self;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  -[NAScheduler performBlock:](serializer, "performBlock:", v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

void __38__MTSleepSessionManager_writeSession___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(7);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    *(_DWORD *)buf = 138543618;
    v12 = v3;
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ writeSession: %{public}@", buf, 0x16u);
  }

  v6 = a1[5];
  v5 = (void *)a1[6];
  v7 = (void *)a1[4];
  if (v6)
  {
    v10 = a1[5];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(v7, "_writeSessions:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mtFinishWithFuture:", v9);

  if (v6)
}

- (void)saveSessionData
{
  NAScheduler *serializer;
  _QWORD v3[5];

  serializer = self->_serializer;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__MTSleepSessionManager_saveSessionData__block_invoke;
  v3[3] = &unk_1E39CB858;
  v3[4] = self;
  -[NAScheduler performBlock:](serializer, "performBlock:", v3);
}

void __40__MTSleepSessionManager_saveSessionData__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_hasUnprocessedSessions"))
  {
    if (+[MTDeviceListener hasBeenUnlockedSinceBoot](MTDeviceListener, "hasBeenUnlockedSinceBoot"))
    {
      MTLogForCategory(7);
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v3 = *(_QWORD *)(a1 + 32);
        v7 = 138543362;
        v8 = v3;
        _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ can write session data", (uint8_t *)&v7, 0xCu);
      }

      v4 = (id)objc_msgSend(*(id *)(a1 + 32), "_writeSessionData");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "waitForUnlock");
    }
  }
  else
  {
    MTLogForCategory(7);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ no unprocessed in bed intervals to save", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)waitForUnlock
{
  NSObject *v3;
  void *v4;
  int v5;
  MTSleepSessionManager *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(7);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ device hasn't been unlocked since boot.  Waiting for unlock...", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_deviceFirstUnlocked, CFSTR("MTDeviceHasBeenUnlockedForFirstTime"), 0);

}

- (void)deviceFirstUnlocked
{
  NAScheduler *serializer;
  _QWORD v3[5];

  serializer = self->_serializer;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__MTSleepSessionManager_deviceFirstUnlocked__block_invoke;
  v3[3] = &unk_1E39CB858;
  v3[4] = self;
  -[NAScheduler performBlock:](serializer, "performBlock:", v3);
}

void __44__MTSleepSessionManager_deviceFirstUnlocked__block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_hasUnprocessedSessions");
  MTLogForCategory(7);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v10 = v5;
      _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ device has been unlocked.  Writing samples to HealthKit", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_writeSessionData");
    v3 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __44__MTSleepSessionManager_deviceFirstUnlocked__block_invoke_207;
    v8[3] = &unk_1E39CD4D8;
    v8[4] = *(_QWORD *)(a1 + 32);
    v6 = (id)-[NSObject addCompletionBlock:](v3, "addCompletionBlock:", v8);
  }
  else if (v4)
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v10 = v7;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ device has been unlocked but no unprocessed intervals to save", buf, 0xCu);
  }

}

void __44__MTSleepSessionManager_deviceFirstUnlocked__block_invoke_207(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), CFSTR("MTDeviceHasBeenUnlockedForFirstTime"), 0);

}

- (BOOL)_hasUnprocessedSessions
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSleepSessionManager archivedSessionDataFile](self, "archivedSessionDataFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v4, 0);

  return v5;
}

- (id)_unprocessedSessions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  if (!-[MTSleepSessionManager _hasUnprocessedSessions](self, "_hasUnprocessedSessions"))
    return 0;
  v3 = objc_alloc(MEMORY[0x1E0C99D50]);
  -[MTSleepSessionManager archivedSessionDataFile](self, "archivedSessionDataFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithContentsOfFile:", v4);

  if (v5)
  {
    v15 = 0;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v5, &v15);
    v7 = v15;
    if (v7)
    {
      MTLogForCategory(7);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[MTSleepSessionManager _unprocessedSessions].cold.3();

      -[MTSleepSessionManager _removeSessionDataFile](self, "_removeSessionDataFile");
      v9 = 0;
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C99E60];
      v16[0] = objc_opt_class();
      v16[1] = -[MTSleepSessionTracker sessionClass](self->_sleepSessionTracker, "sessionClass");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithArray:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v14, CFSTR("MTUnprocessedSessions"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "finishDecoding");
    }

  }
  else
  {
    MTLogForCategory(7);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MTSleepSessionManager _unprocessedSessions].cold.1(self, v11);

    -[MTSleepSessionManager _removeSessionDataFile](self, "_removeSessionDataFile");
    v9 = 0;
  }

  return v9;
}

- (void)_removeSessionDataFile
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_19AC4E000, v0, (uint64_t)v0, "%{public}@ failed to remove session data file error %{public}@", v1);
  OUTLINED_FUNCTION_2();
}

- (id)_writeSessionData
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];

  -[MTSleepSessionManager _unprocessedSessions](self, "_unprocessedSessions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__MTSleepSessionManager__writeSessionData__block_invoke;
  v12[3] = &unk_1E39CD500;
  v12[4] = self;
  objc_msgSend(v3, "na_map:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTSleepSessionManager _writeSessions:](self, "_writeSessions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __42__MTSleepSessionManager__writeSessionData__block_invoke_2;
  v10[3] = &unk_1E39CD488;
  v10[4] = self;
  v11 = v5;
  v7 = v5;
  v8 = (id)objc_msgSend(v6, "addSuccessBlock:", v10);

  return v6;
}

id __42__MTSleepSessionManager__writeSessionData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(v3, "needsAdditionalProcessing") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "processedSessionForSession:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

uint64_t __42__MTSleepSessionManager__writeSessionData__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(7);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "sleepSessionTrackerDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v3;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying %{public}@", (uint8_t *)&v9, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "sleepSessionTrackerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sleepSessionTracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sleepSessionTracker:sessionDidComplete:", v6, v7);

  return objc_msgSend(*(id *)(a1 + 32), "_removeSessionDataFile");
}

- (id)_writeSessions:(id)a3
{
  id v4;
  HKHealthStore *healthStore;
  id HKObjectTypeClass;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __CFString *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  HKHealthStore *v44;
  id v45;
  uint64_t v46;
  NAScheduler *serializer;
  void *v48;
  void *v49;
  id v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  id obj;
  uint64_t v56;
  MTSleepSessionManager *v57;
  _QWORD v58[6];
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  MTSleepSessionManager *v69;
  __int16 v70;
  const __CFString *v71;
  __int16 v72;
  __CFString *v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v57 = self;
  healthStore = self->_healthStore;
  HKObjectTypeClass = getHKObjectTypeClass();
  getHKCategoryTypeIdentifierSleepAnalysis();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(HKObjectTypeClass, "categoryTypeForIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HKHealthStore authorizationStatusForType:](healthStore, "authorizationStatusForType:", v8);

  if (v9 == 1)
  {
    MTLogForCategory(7);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MTSleepSessionManager _writeSessions:].cold.1((uint64_t)v57, v10, v11, v12, v13, v14, v15, v16);

    v17 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "na_genericError");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "futureWithError:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = (void *)objc_opt_new();
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v51 = v4;
    obj = v4;
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v65;
      v52 = *(_QWORD *)v65;
      v53 = v18;
      do
      {
        v23 = 0;
        v54 = v21;
        do
        {
          if (*(_QWORD *)v65 != v22)
            objc_enumerationMutation(obj);
          v24 = *(__CFString **)(*((_QWORD *)&v64 + 1) + 8 * v23);
          MTLogForCategory(7);
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v69 = v57;
            v70 = 2112;
            v71 = v24;
            _os_log_impl(&dword_19AC4E000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Processing session: %@", buf, 0x16u);
          }

          -[__CFString startDate](v24, "startDate");
          v26 = objc_claimAutoreleasedReturnValue();
          if (v26
            && (v27 = (void *)v26,
                -[__CFString endDate](v24, "endDate"),
                v28 = (void *)objc_claimAutoreleasedReturnValue(),
                v28,
                v27,
                v28))
          {
            v56 = v23;
            MTLogForCategory(7);
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v69 = v57;
              v70 = 2114;
              v71 = CFSTR("sleep session");
              _os_log_impl(&dword_19AC4E000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ Creating HealthKit samples from %{public}@...", buf, 0x16u);
            }

            v30 = objc_opt_new();
            v60 = 0u;
            v61 = 0u;
            v62 = 0u;
            v63 = 0u;
            -[__CFString intervals](v24, "intervals");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
            if (v32)
            {
              v33 = v32;
              v34 = *(_QWORD *)v61;
              do
              {
                for (i = 0; i != v33; ++i)
                {
                  if (*(_QWORD *)v61 != v34)
                    objc_enumerationMutation(v31);
                  v36 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
                  v37 = (void *)objc_opt_class();
                  v38 = -[__CFString sampleType](v24, "sampleType");
                  -[__CFString metadata](v24, "metadata");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "sleepSampleWithInterval:sampleType:metadata:", v36, v38, v39);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();

                  -[NSObject na_safeAddObject:](v30, "na_safeAddObject:", v40);
                }
                v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
              }
              while (v33);
            }

            MTLogForCategory(7);
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              v42 = -[NSObject count](v30, "count");
              *(_DWORD *)buf = 138543874;
              v69 = v57;
              v70 = 2048;
              v71 = (const __CFString *)v42;
              v72 = 2114;
              v73 = v24;
              _os_log_impl(&dword_19AC4E000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@ Saving %lu samples for session %{public}@ to HealthKit...", buf, 0x20u);
            }

            v43 = (void *)objc_opt_new();
            v18 = v53;
            objc_msgSend(v53, "addObject:", v43);
            v44 = v57->_healthStore;
            v58[0] = MEMORY[0x1E0C809B0];
            v58[1] = 3221225472;
            v58[2] = __40__MTSleepSessionManager__writeSessions___block_invoke;
            v58[3] = &unk_1E39CD528;
            v58[4] = v57;
            v58[5] = v24;
            v59 = v43;
            v45 = v43;
            -[HKHealthStore saveObjects:withCompletion:](v44, "saveObjects:withCompletion:", v30, v58);

            v21 = v54;
            v22 = v52;
            v23 = v56;
          }
          else
          {
            MTLogForCategory(7);
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v69 = v57;
              v70 = 2112;
              v71 = v24;
              _os_log_error_impl(&dword_19AC4E000, v30, OS_LOG_TYPE_ERROR, "%{public}@ Skipping session due to missing bedtime or wake time: %@", buf, 0x16u);
            }
          }

          ++v23;
        }
        while (v23 != v21);
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
      }
      while (v21);
    }

    +[MTScheduler serialSchedulerForObject:priority:](MTScheduler, "serialSchedulerForObject:priority:", v57, +[MTScheduler defaultPriority](MTScheduler, "defaultPriority"));
    v46 = objc_claimAutoreleasedReturnValue();
    serializer = v57->_serializer;
    v57->_serializer = (NAScheduler *)v46;

    v48 = (void *)MEMORY[0x1E0D519C0];
    +[MTScheduler globalAsyncSchedulerWithPriority:](MTScheduler, "globalAsyncSchedulerWithPriority:", +[MTScheduler defaultPriority](MTScheduler, "defaultPriority"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "combineAllFutures:ignoringErrors:scheduler:", v18, 1, v49);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v51;
  }

  return v19;
}

void __40__MTSleepSessionManager__writeSessions___block_invoke(_QWORD *a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MTLogForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[4];
      v9 = a1[5];
      v15 = 138543618;
      v16 = v8;
      v17 = 2114;
      v18 = v9;
      _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished saving samples for session %{public}@", (uint8_t *)&v15, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __40__MTSleepSessionManager__writeSessions___block_invoke_cold_1((uint64_t)a1, (uint64_t)v5, v7);
  }

  MTLogForCategory(7);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = a1[4];
    v12 = a1[5];
    v15 = 138543618;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished processing session: %@", (uint8_t *)&v15, 0x16u);
  }

  v13 = (void *)a1[6];
  NAEmptyResult();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "finishWithResult:error:", v14, v5);

}

+ (id)sleepSampleWithInterval:(id)a3 sampleType:(int64_t)a4 metadata:(id)a5
{
  id v8;
  id v9;
  id HKObjectTypeClass;
  void *v11;
  NSObject *v12;
  double v13;
  double v14;
  double v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE buf[24];
  double v31;
  uint64_t *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v8)
  {
    HKObjectTypeClass = getHKObjectTypeClass();
    getHKCategoryTypeIdentifierSleepAnalysis();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(HKObjectTypeClass, "categoryTypeForIdentifier:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    -[NSObject maximumAllowedDuration](v12, "maximumAllowedDuration");
    v14 = v13;
    objc_msgSend(v8, "duration");
    if (v15 <= v14)
    {
      v26 = 0;
      v27 = &v26;
      v28 = 0x2050000000;
      v19 = (void *)getHKCategorySampleClass_softClass;
      v29 = getHKCategorySampleClass_softClass;
      if (!getHKCategorySampleClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getHKCategorySampleClass_block_invoke;
        v31 = COERCE_DOUBLE(&unk_1E39CB690);
        v32 = &v26;
        __getHKCategorySampleClass_block_invoke((uint64_t)buf);
        v19 = (void *)v27[3];
      }
      v20 = objc_retainAutorelease(v19);
      _Block_object_dispose(&v26, 8);
      objc_msgSend(v8, "startDate", v26);
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "endDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      v27 = &v26;
      v28 = 0x2050000000;
      v22 = (void *)getHKDeviceClass_softClass;
      v29 = getHKDeviceClass_softClass;
      if (!getHKDeviceClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getHKDeviceClass_block_invoke;
        v31 = COERCE_DOUBLE(&unk_1E39CB690);
        v32 = &v26;
        __getHKDeviceClass_block_invoke((uint64_t)buf);
        v22 = (void *)v27[3];
      }
      v23 = objc_retainAutorelease(v22);
      _Block_object_dispose(&v26, 8);
      objc_msgSend(v23, "localDevice", v26);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "categorySampleWithType:value:startDate:endDate:device:metadata:", v12, a4, v16, v21, v24, v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      MTLogForCategory(7);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "duration");
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v17;
        *(_WORD *)&buf[22] = 2048;
        v31 = v14;
        _os_log_impl(&dword_19AC4E000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ sleep interval: %f greater than allowed: %f. Will not be used", buf, 0x20u);
      }
      v18 = 0;
    }

  }
  else
  {
    MTLogForCategory(7);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = a1;
      _os_log_impl(&dword_19AC4E000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Interval is nil.", buf, 0xCu);
    }
    v18 = 0;
  }

  return v18;
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (MTAlarmStorage)alarmStorage
{
  return self->_alarmStorage;
}

- (void)setAlarmStorage:(id)a3
{
  objc_storeStrong((id *)&self->_alarmStorage, a3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (NSString)archivedSessionDataPath
{
  return self->_archivedSessionDataPath;
}

- (void)setArchivedSessionDataPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)archivedSessionDataFile
{
  return self->_archivedSessionDataFile;
}

- (void)setArchivedSessionDataFile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (MTSleepSessionTracker)sleepSessionTracker
{
  return self->_sleepSessionTracker;
}

- (void)setSleepSessionTracker:(id)a3
{
  objc_storeStrong((id *)&self->_sleepSessionTracker, a3);
}

- (MTSleepSessionTrackerDelegate)sleepSessionTrackerDelegate
{
  return (MTSleepSessionTrackerDelegate *)objc_loadWeakRetained((id *)&self->_sleepSessionTrackerDelegate);
}

- (void)setSleepSessionTrackerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sleepSessionTrackerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sleepSessionTrackerDelegate);
  objc_storeStrong((id *)&self->_sleepSessionTracker, 0);
  objc_storeStrong((id *)&self->_archivedSessionDataFile, 0);
  objc_storeStrong((id *)&self->_archivedSessionDataPath, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_alarmStorage, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
}

- (void)sleepSessionTracker:(uint64_t)a3 sessionDidComplete:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_19AC4E000, a2, a3, "%{public}@ failed to process session", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __40__MTSleepSessionManager_archiveSession___block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "archivedSessionDataFile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_19AC4E000, a2, v4, "%{public}@ failed to write sessions file %{public}@", v5);

  OUTLINED_FUNCTION_7();
}

void __40__MTSleepSessionManager_archiveSession___block_invoke_cold_2(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "archivedSessionDataPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_19AC4E000, a2, v4, "%{public}@ failed to create directory at %{public}@", v5);

  OUTLINED_FUNCTION_7();
}

- (void)_unprocessedSessions
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_19AC4E000, v0, (uint64_t)v0, "%{public}@ unarchiving failed with error %{public}@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)_writeSessions:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_19AC4E000, a2, a3, "%{public}@ doesn't have write access for HKCategoryTypeIdentifierSleepAnalysis", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __40__MTSleepSessionManager__writeSessions___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
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
  OUTLINED_FUNCTION_2_1(&dword_19AC4E000, a3, (uint64_t)a3, "%{public}@ Saving samples to Health failed with error: %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

@end

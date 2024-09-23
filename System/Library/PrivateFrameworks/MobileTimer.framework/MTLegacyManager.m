@implementation MTLegacyManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_38);
  return (id)sharedManager__manager;
}

void __32__MTLegacyManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager__manager;
  sharedManager__manager = v0;

}

- (MTLegacyManager)init
{
  MTLegacyManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *serializer;
  id v5;
  void *v6;
  uint64_t v7;
  UNUserNotificationCenter *notificationCenter;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTLegacyManager;
  v2 = -[MTLegacyManager init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.MTLegacyManager", 0);
    serializer = v2->_serializer;
    v2->_serializer = (OS_dispatch_queue *)v3;

    v5 = objc_alloc(MEMORY[0x1E0CEC7A0]);
    objc_msgSend((id)objc_opt_class(), "_bundleIDForUNSchedule");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithBundleIdentifier:", v6);
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (UNUserNotificationCenter *)v7;

  }
  return v2;
}

+ (id)_bundleIDForUNSchedule
{
  return CFSTR("com.apple.mobiletimer");
}

- (void)loadLegacyData
{
  NSObject *serializer;
  _QWORD block[5];

  serializer = self->_serializer;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__MTLegacyManager_loadLegacyData__block_invoke;
  block[3] = &unk_1E39CB858;
  block[4] = self;
  dispatch_sync(serializer, block);
}

uint64_t __33__MTLegacyManager_loadLegacyData__block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 8))
  {
    v1 = result;
    MTLogForCategory(3);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(v1 + 32);
      v4 = 138543362;
      v5 = v3;
      _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ loading legacy data", (uint8_t *)&v4, 0xCu);
    }

    objc_msgSend(*(id *)(v1 + 32), "_loadUserPreferences");
    objc_msgSend(*(id *)(v1 + 32), "_loadScheduledNotifications");
    objc_msgSend(*(id *)(v1 + 32), "_upgradeFromSpringboardDefaults");
    objc_msgSend(*(id *)(v1 + 32), "_loadAlarms");
    objc_msgSend(*(id *)(v1 + 32), "_reconcileAlarmsAndNotifications");
    result = objc_msgSend(*(id *)(v1 + 32), "_loadTimerDefaults");
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 8) = 1;
  }
  return result;
}

- (void)_loadUserPreferences
{
  NSObject *v3;
  int v4;
  MTLegacyManager *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ loading user preferences", (uint8_t *)&v4, 0xCu);
  }

  CFPreferencesAppSynchronize(CFSTR("com.apple.mobiletimer"));
}

- (void)_loadScheduledNotifications
{
  NSObject *v3;
  dispatch_semaphore_t v4;
  UNUserNotificationCenter *notificationCenter;
  NSObject *v6;
  NSObject *v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  MTLegacyManager *v13;
  NSObject *v14;
  uint8_t buf[4];
  MTLegacyManager *v16;
  __int16 v17;
  NSUInteger v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ loading scheduled notifications", buf, 0xCu);
  }

  v4 = dispatch_semaphore_create(0);
  notificationCenter = self->_notificationCenter;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __46__MTLegacyManager__loadScheduledNotifications__block_invoke;
  v12 = &unk_1E39CE6A0;
  v13 = self;
  v6 = v4;
  v14 = v6;
  -[UNUserNotificationCenter getPendingNotificationRequestsWithCompletionHandler:](notificationCenter, "getPendingNotificationRequestsWithCompletionHandler:", &v9);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  MTLogForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = -[NSArray count](self->_scheduledNotifications, "count", v9, v10, v11, v12, v13);
    *(_DWORD *)buf = 138543618;
    v16 = self;
    v17 = 2048;
    v18 = v8;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ found %lu scheduled notifications", buf, 0x16u);
  }

}

void __46__MTLegacyManager__loadScheduledNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)_upgradeFromSpringboardDefaults
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void MTGSSendAppPreferencesChanged(CFStringRef, CFStringRef)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MTLegacyManager.m"), 25, CFSTR("%s"), dlerror());

  __break(1u);
}

- (BOOL)_upgradeIfNeverAttempted
{
  int AppBooleanValue;
  BOOL v4;
  BOOL v5;
  CFPropertyListRef v6;
  const void *v7;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("UpgradeAttempted"), CFSTR("com.apple.mobiletimer"), &keyExistsAndHasValidFormat);
  v4 = 0;
  if (keyExistsAndHasValidFormat)
    v5 = AppBooleanValue == 0;
  else
    v5 = 1;
  if (v5)
  {
    v6 = CFPreferencesCopyAppValue(CFSTR("SBCountdownTimerSoundIdentifier"), CFSTR("com.apple.springboard"));
    if (v6)
    {
      v7 = v6;
      v4 = -[MTLegacyManager _upgrade](self, "_upgrade");
      CFRelease(v7);
    }
    else
    {
      CFPreferencesSetAppValue(CFSTR("UpgradeAttempted"), (CFPropertyListRef)*MEMORY[0x1E0C9AE50], CFSTR("com.apple.mobiletimer"));
      return 1;
    }
  }
  return v4;
}

- (BOOL)_upgrade
{
  BOOL v3;

  CFPreferencesSetAppValue(CFSTR("UpgradeAttempted"), (CFPropertyListRef)*MEMORY[0x1E0C9AE50], CFSTR("com.apple.mobiletimer"));
  v3 = -[MTLegacyManager _upgradeAlarms](self, "_upgradeAlarms");
  return v3 | -[MTLegacyManager _upgradeTimers](self, "_upgradeTimers");
}

- (BOOL)_upgradeAlarms
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  Alarm *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSArray *alarms;
  BOOL v25;
  NSArray *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  MTLegacyManager *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v35 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ upgrading alarms", buf, 0xCu);
  }

  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("AlarmList"), CFSTR("com.apple.springboard"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "count"))
  {
    MTLogForCategory(3);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(v4, "count");
      *(_DWORD *)buf = 138543618;
      v35 = self;
      v36 = 2048;
      v37 = v6;
      _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ found %ld alarms to upgrade", buf, 0x16u);
    }

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v27 = -[MTLegacyManager _copyLegacyAlarmsFromPreferences](self, "_copyLegacyAlarmsFromPreferences");
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v4;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v30 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v13 = objc_alloc_init(Alarm);
          objc_msgSend(v12, "objectForKey:", CFSTR("hour"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[Alarm setHour:](v13, "setHour:", objc_msgSend(v14, "unsignedIntValue"));

          objc_msgSend(v12, "objectForKey:", CFSTR("minute"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[Alarm setMinute:](v13, "setMinute:", objc_msgSend(v15, "unsignedIntValue"));

          objc_msgSend(v12, "objectForKey:", CFSTR("allows snooze"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[Alarm setAllowsSnooze:](v13, "setAllowsSnooze:", objc_msgSend(v16, "BOOLValue"));

          objc_msgSend(v12, "objectForKey:", CFSTR("sound path"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[Alarm setSound:ofType:](v13, "setSound:ofType:", v17, 1);

          objc_msgSend(v12, "objectForKey:", CFSTR("title"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[Alarm setTitle:](v13, "setTitle:", v18);

          objc_msgSend(v12, "objectForKey:", CFSTR("setting"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[Alarm setDaySetting:](v13, "setDaySetting:", objc_msgSend(v19, "unsignedIntValue"));

          v20 = -[Alarm alarmID](v13, "alarmID");
          -[Alarm markModified](v13, "markModified");
          objc_msgSend(v12, "objectForKey:", CFSTR("active"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[Alarm setForceActiveForMigration:](v13, "setForceActiveForMigration:", objc_msgSend(v21, "BOOLValue"));

          -[NSObject addObject:](v7, "addObject:", v13);
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v9);
    }

    MTLogForCategory(3);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v35 = self;
      v36 = 2112;
      v37 = (uint64_t)v7;
      _os_log_impl(&dword_19AC4E000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Old alarms being upgraded: %@", buf, 0x16u);
    }

    MTLogForCategory(3);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v35 = self;
      v36 = 2112;
      v37 = (uint64_t)v27;
      _os_log_impl(&dword_19AC4E000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ New alarms already present: %@", buf, 0x16u);
    }

    -[NSArray addObjectsFromArray:](v27, "addObjectsFromArray:", v7);
    -[NSArray sortUsingSelector:](v27, "sortUsingSelector:", sel_compareTime_);
    alarms = self->_alarms;
    self->_alarms = v27;

    v25 = 1;
  }
  else
  {
    MTLogForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v35 = self;
      _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ No alarms found to upgrade", buf, 0xCu);
    }
    v25 = 0;
  }

  return v25;
}

- (BOOL)_upgradeTimers
{
  NSObject *v3;
  const __CFArray *v4;
  CFDictionaryRef v5;
  void *v6;
  id v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint8_t buf[4];
  MTLegacyManager *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ upgrading timer", buf, 0xCu);
  }

  v4 = (const __CFArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("SBCountdownTimerSoundIdentifier"), CFSTR("SBCountdownTimerTimeIdentifier"), 0);
  v5 = CFPreferencesCopyMultiple(v4, CFSTR("com.apple.springboard"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  -[__CFDictionary objectForKey:](v5, "objectForKey:", CFSTR("SBCountdownTimerSoundIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0DBF740]);
    objc_msgSend(v7, "defaultToneIdentifierForAlertType:", 14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v6, "length"))
  {
    CFPreferencesSetAppValue(CFSTR("timerSleepiPod"), (CFPropertyListRef)*MEMORY[0x1E0C9AE40], CFSTR("com.apple.mobiletimer"));
    CFPreferencesSetAppValue(CFSTR("timerSound"), v6, CFSTR("com.apple.mobiletimer"));
    MTLogForCategory(4);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v14 = self;
      v15 = 2112;
      v16 = v6;
      v9 = "%{public}@ setting current sound: %@";
      v10 = v8;
      v11 = 22;
LABEL_10:
      _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
  }
  else
  {
    CFPreferencesSetAppValue(CFSTR("timerSleepiPod"), (CFPropertyListRef)*MEMORY[0x1E0C9AE50], CFSTR("com.apple.mobiletimer"));
    MTLogForCategory(4);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = self;
      v9 = "%{public}@ setting current sound: Stop Playing";
      v10 = v8;
      v11 = 12;
      goto LABEL_10;
    }
  }

  return 1;
}

- (BOOL)_discardOldVersion
{
  BOOL v3;

  v3 = -[MTLegacyManager _discardOldAlarms](self, "_discardOldAlarms");
  return -[MTLegacyManager _discardOldTimers](self, "_discardOldTimers") || v3;
}

- (BOOL)_discardOldAlarms
{
  void *v3;
  NSObject *v4;
  int v6;
  MTLegacyManager *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("AlarmList"), CFSTR("com.apple.springboard"));
  if (v3)
  {
    MTLogForCategory(3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = self;
      _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing AlarmList", (uint8_t *)&v6, 0xCu);
    }

    CFPreferencesSetAppValue(CFSTR("AlarmList"), 0, CFSTR("com.apple.springboard"));
  }

  return v3 != 0;
}

- (BOOL)_discardOldTimers
{
  const __CFArray *v3;
  CFDictionaryRef v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  uint8_t buf[4];
  MTLegacyManager *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (const __CFArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("SBCountdownTimerSoundIdentifier"), CFSTR("SBCountdownTimerTimeIdentifier"), 0);
  v4 = CFPreferencesCopyMultiple(v3, CFSTR("com.apple.springboard"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  -[__CFDictionary objectForKey:](v4, "objectForKey:", CFSTR("SBCountdownTimerSoundIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[__CFDictionary objectForKey:](v4, "objectForKey:", CFSTR("SBCountdownTimerTimeIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v11 = 0;
      goto LABEL_13;
    }
  }
  -[__CFDictionary objectForKey:](v4, "objectForKey:", CFSTR("SBCountdownTimerSoundIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    CFPreferencesSetAppValue(CFSTR("SBCountdownTimerSoundIdentifier"), 0, CFSTR("com.apple.springboard"));
    MTLogForCategory(4);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = self;
      _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing SBCountdownTimerSoundIdentifier", buf, 0xCu);
    }

  }
  -[__CFDictionary objectForKey:](v4, "objectForKey:", CFSTR("SBCountdownTimerTimeIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    CFPreferencesSetAppValue(CFSTR("SBCountdownTimerTimeIdentifier"), 0, CFSTR("com.apple.springboard"));
    MTLogForCategory(4);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = self;
      _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing SBCountdownTimerTimeIdentifier", buf, 0xCu);
    }

  }
  v11 = 1;
LABEL_13:

  return v11;
}

- (id)_copyLegacyAlarmsFromPreferences
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  Alarm *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  MTLegacyManager *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("Alarms"), CFSTR("com.apple.mobiletimer"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  MTLogForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v22 = self;
    v23 = 2112;
    v24 = v3;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Reading alarms from preferences: %@", buf, 0x16u);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v17;
    *(_QWORD *)&v8 = 138543618;
    v15 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (+[Alarm verifySettings:](Alarm, "verifySettings:", v12, v15, (_QWORD)v16))
        {
          v13 = -[Alarm initWithSettings:]([Alarm alloc], "initWithSettings:", v12);
          objc_msgSend(v4, "addObject:", v13);
        }
        else
        {
          MTLogForCategory(3);
          v13 = (Alarm *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v15;
            v22 = self;
            v23 = 2112;
            v24 = v12;
            _os_log_impl(&dword_19AC4E000, &v13->super, OS_LOG_TYPE_DEFAULT, "%{public}@ Invalid alarm found in preferences :: %@", buf, 0x16u);
          }
        }

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v4;
}

- (id)_copyLegacySleepAlarmFromPreferences
{
  void *v3;
  NSObject *v4;
  Alarm *v5;
  int v7;
  MTLegacyManager *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("SleepAlarm"), CFSTR("com.apple.mobiletimer"));
  MTLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = self;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Reading sleep alarm from preferences: %@", (uint8_t *)&v7, 0x16u);
  }

  if (+[Alarm verifySettings:](Alarm, "verifySettings:", v3))
    v5 = -[Alarm initWithSettings:]([Alarm alloc], "initWithSettings:", v3);
  else
    v5 = 0;

  return v5;
}

- (void)_loadAlarms
{
  NSObject *v3;
  NSArray *v4;
  NSArray *alarms;
  Alarm *v6;
  Alarm *sleepAlarm;
  int v8;
  MTLegacyManager *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ loading alarms", (uint8_t *)&v8, 0xCu);
  }

  if (!self->_alarms)
  {
    v4 = -[MTLegacyManager _copyLegacyAlarmsFromPreferences](self, "_copyLegacyAlarmsFromPreferences");
    alarms = self->_alarms;
    self->_alarms = v4;

  }
  v6 = -[MTLegacyManager _copyLegacySleepAlarmFromPreferences](self, "_copyLegacySleepAlarmFromPreferences");
  sleepAlarm = self->_sleepAlarm;
  self->_sleepAlarm = v6;

}

- (void)_reconcileAlarmsAndNotifications
{
  NSObject *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  Alarm *sleepAlarm;
  void *v13;
  MTLegacyManager *v14;
  NSArray *v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  MTLegacyManager *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v38 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ reconiling alarms with notifications", buf, 0xCu);
  }

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSArray count](self->_alarms, "count"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = self->_alarms;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v10, "alarmID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v10, v11);

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v7);
  }

  sleepAlarm = self->_sleepAlarm;
  if (sleepAlarm)
  {
    -[Alarm alarmID](self->_sleepAlarm, "alarmID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", sleepAlarm, v13);

  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = self;
  v15 = self->_scheduledNotifications;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v30;
    *(_QWORD *)&v17 = 138543618;
    v28 = v17;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v30 != v19)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "content", v28, (_QWORD)v29);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "userInfo");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKey:", CFSTR("alarmId"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v23, "length"))
        {
          objc_msgSend(v4, "objectForKey:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v24)
          {
            objc_msgSend(v24, "setForceActiveForMigration:", 1);
            MTLogForCategory(3);
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v28;
              v38 = v14;
              v39 = 2114;
              v40 = v23;
              _os_log_impl(&dword_19AC4E000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ found scheduled notification matching alarm %{public}@.  Forcing active for migration.", buf, 0x16u);
            }

          }
        }

      }
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    }
    while (v18);
  }

  MTLogForCategory(3);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v38 = v14;
    _os_log_impl(&dword_19AC4E000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ finished reconiling alarms with notifications", buf, 0xCu);
  }

}

- (void)_loadTimerDefaults
{
  NSObject *v3;
  const __CFNumber *v4;
  const __CFNumber *v5;
  float v6;
  float v7;
  double v8;
  NSString *v9;
  void *v10;
  NSString *defaultSound;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  MTLegacyManager *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(float *)buf = 5.8381e-34;
    v14 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ loading timer defaults", buf, 0xCu);
  }

  v4 = (const __CFNumber *)CFPreferencesCopyAppValue(CFSTR("TIMER_INTERVAL"), CFSTR("com.apple.mobiletimer"));
  *(float *)buf = 0.0;
  if (v4)
  {
    v5 = v4;
    if (CFNumberGetValue(v4, kCFNumberFloatType, buf))
    {
      v6 = floorf(*(float *)buf);
      if (v6 < 1.0)
        v6 = 1.0;
      v7 = fminf(v6, 86399.0);
    }
    else
    {
      v7 = 900.0;
    }
    *(float *)buf = v7;
    CFRelease(v5);
    v8 = *(float *)buf;
  }
  else
  {
    *(float *)buf = 900.0;
    v8 = 900.0;
  }
  self->_defaultDuration = v8;
  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("timerSleepiPod"), CFSTR("com.apple.mobiletimer"), &keyExistsAndHasValidFormat)&& keyExistsAndHasValidFormat)
  {
    v9 = (NSString *)(id)*MEMORY[0x1E0DBF788];
  }
  else
  {
    v9 = (NSString *)CFPreferencesCopyAppValue(CFSTR("timerSound"), CFSTR("com.apple.mobiletimer"));
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0DBF740], "sharedToneManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "defaultToneIdentifierForAlertType:", 14);
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();

    }
  }
  defaultSound = self->_defaultSound;
  self->_defaultSound = v9;

}

- (void)purgeLegacyData
{
  NSObject *serializer;
  _QWORD block[5];

  serializer = self->_serializer;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__MTLegacyManager_purgeLegacyData__block_invoke;
  block[3] = &unk_1E39CB858;
  block[4] = self;
  dispatch_sync(serializer, block);
}

uint64_t __34__MTLegacyManager_purgeLegacyData__block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 9))
  {
    v1 = result;
    MTLogForCategory(3);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(v1 + 32);
      v4 = 138543362;
      v5 = v3;
      _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ purging legacy data", (uint8_t *)&v4, 0xCu);
    }

    objc_msgSend(*(id *)(v1 + 32), "_purgeAlarmsAndTimers");
    result = objc_msgSend(*(id *)(v1 + 32), "_cancelNotifications");
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 9) = 1;
  }
  return result;
}

- (void)_purgeAlarmsAndTimers
{
  NSObject *v3;
  int v4;
  MTLegacyManager *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deleting defaults", (uint8_t *)&v4, 0xCu);
  }

  CFPreferencesSetAppValue(CFSTR("Alarms"), 0, CFSTR("com.apple.mobiletimer"));
  CFPreferencesSetAppValue(CFSTR("AlarmsLastModified"), 0, CFSTR("com.apple.mobiletimer"));
  CFPreferencesSetAppValue(CFSTR("SleepAlarm"), 0, CFSTR("com.apple.mobiletimer"));
  CFPreferencesSetAppValue(CFSTR("timerSound"), 0, CFSTR("com.apple.mobiletimer"));
  CFPreferencesSetAppValue(CFSTR("timerSleepiPod"), 0, CFSTR("com.apple.mobiletimer"));
  CFPreferencesSetAppValue(CFSTR("TIMER_INTERVAL"), 0, CFSTR("com.apple.mobiletimer"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobiletimer"));
}

- (void)cancelNotifications
{
  NSObject *serializer;
  _QWORD block[5];

  serializer = self->_serializer;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MTLegacyManager_cancelNotifications__block_invoke;
  block[3] = &unk_1E39CB858;
  block[4] = self;
  dispatch_sync(serializer, block);
}

uint64_t __38__MTLegacyManager_cancelNotifications__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeAllPendingNotificationRequests");
}

- (void)_cancelNotifications
{
  NSObject *v3;
  int v4;
  MTLegacyManager *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelling notifications", (uint8_t *)&v4, 0xCu);
  }

  -[UNUserNotificationCenter removeAllPendingNotificationRequests](self->_notificationCenter, "removeAllPendingNotificationRequests");
}

- (void)clearInvalidPendingNotifications
{
  NSObject *v3;
  UNUserNotificationCenter *notificationCenter;
  _QWORD v5[5];
  uint8_t buf[4];
  MTLegacyManager *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ clearInvalidPendingNotifications", buf, 0xCu);
  }

  notificationCenter = self->_notificationCenter;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__MTLegacyManager_clearInvalidPendingNotifications__block_invoke;
  v5[3] = &unk_1E39CE6F0;
  v5[4] = self;
  -[UNUserNotificationCenter getPendingNotificationRequestsWithCompletionHandler:](notificationCenter, "getPendingNotificationRequestsWithCompletionHandler:", v5);
}

void __51__MTLegacyManager_clearInvalidPendingNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[5];
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__MTLegacyManager_clearInvalidPendingNotifications__block_invoke_2;
    v8[3] = &unk_1E39CE6C8;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "na_each:", v8);
    MTLogForCategory(3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v10 = v5;
      _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ removing all pending notifications", buf, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeAllPendingNotificationRequests");
  }
  else
  {
    MTLogForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v10 = v7;
      _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ no pending notifications to remove", buf, 0xCu);
    }

  }
}

void __51__MTLegacyManager_clearInvalidPendingNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mtStringByRemovingNotificationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "categoryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "content");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  MTLogForCategory(3);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = 138544130;
    v13 = v11;
    v14 = 2114;
    v15 = v5;
    v16 = 2114;
    v17 = v7;
    v18 = 2114;
    v19 = v9;
    _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ retrieved pending notification with alarm id: %{public}@, category id: %{public}@, user info: %{public}@", (uint8_t *)&v12, 0x2Au);
  }

}

+ (id)alarmFromOldAlarm:(id)a3
{
  id v4;
  MTMutableAlarm *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[MTAlarm initWithHour:minute:]([MTMutableAlarm alloc], "initWithHour:minute:", objc_msgSend(v4, "hour"), objc_msgSend(v4, "minute"));
  -[MTAlarm setBedtimeHour:](v5, "setBedtimeHour:", objc_msgSend(v4, "bedtimeHour"));
  -[MTAlarm setBedtimeMinute:](v5, "setBedtimeMinute:", objc_msgSend(v4, "bedtimeMinute"));
  objc_msgSend(v4, "bedtimeReminderMinutes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTAlarm setBedtimeReminderMinutes:](v5, "setBedtimeReminderMinutes:", objc_msgSend(v6, "integerValue"));

  -[MTAlarm setRepeatSchedule:](v5, "setRepeatSchedule:", objc_msgSend(a1, "repeatScheduleFromOldAlarm:", v4));
  objc_msgSend(a1, "soundFromOldAlarm:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTAlarm setSound:](v5, "setSound:", v7);

  -[MTAlarm setEnabled:](v5, "setEnabled:", objc_msgSend(v4, "isActive"));
  -[MTAlarm setSleepAlarm:](v5, "setSleepAlarm:", objc_msgSend(v4, "isSleepAlarm"));
  -[MTAlarm setAllowsSnooze:](v5, "setAllowsSnooze:", objc_msgSend(v4, "allowsSnooze"));
  objc_msgSend(v4, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTAlarm setTitle:](v5, "setTitle:", v8);
  return v5;
}

+ (unint64_t)repeatScheduleFromOldAlarm:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a3, "repeatDays", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 |= MTAlarmRepeatScheduleFromDay(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "integerValue"));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)soundFromOldAlarm:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "sound");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_numberFromString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  switch(objc_msgSend(v4, "soundType"))
  {
    case -1:
      goto LABEL_8;
    case 0:
      v8 = *MEMORY[0x1E0DBF788];
      objc_msgSend(v4, "vibrationID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "soundVolume");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[MTSound toneSoundWithIdentifier:vibrationIdentifer:volume:](MTSound, "toneSoundWithIdentifier:vibrationIdentifer:volume:", v8, v9, v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    case 1:
      objc_msgSend(v4, "sound");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "vibrationID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "soundVolume");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[MTSound toneSoundWithIdentifier:vibrationIdentifer:volume:](MTSound, "toneSoundWithIdentifier:vibrationIdentifer:volume:", v11, v12, v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    case 2:
      if (v6)
      {
        objc_msgSend(v4, "vibrationID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "soundVolume");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[MTSound songSoundWithIdentifier:vibrationIdentifier:volume:](MTSound, "songSoundWithIdentifier:vibrationIdentifier:volume:", v6, v11, v12);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

      }
      else
      {
LABEL_8:
        +[MTSound defaultSoundForCategory:](MTSound, "defaultSoundForCategory:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
LABEL_9:

      return v7;
    default:
      v7 = 0;
      goto LABEL_9;
  }
}

+ (id)_numberFromString:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = _numberFromString__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_numberFromString__onceToken, &__block_literal_global_53);
  objc_msgSend((id)_numberFromString__f, "numberFromString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __37__MTLegacyManager__numberFromString___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)_numberFromString__f;
  _numberFromString__f = (uint64_t)v0;

  return objc_msgSend((id)_numberFromString__f, "setNumberStyle:", 1);
}

- (NSArray)alarms
{
  return self->_alarms;
}

- (void)setAlarms:(id)a3
{
  objc_storeStrong((id *)&self->_alarms, a3);
}

- (Alarm)sleepAlarm
{
  return self->_sleepAlarm;
}

- (void)setSleepAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_sleepAlarm, a3);
}

- (double)defaultDuration
{
  return self->_defaultDuration;
}

- (void)setDefaultDuration:(double)a3
{
  self->_defaultDuration = a3;
}

- (NSString)defaultSound
{
  return self->_defaultSound;
}

- (void)setDefaultSound:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (OS_dispatch_queue)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (NSArray)scheduledNotifications
{
  return self->_scheduledNotifications;
}

- (void)setScheduledNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_scheduledNotifications, a3);
}

- (BOOL)loaded
{
  return self->_loaded;
}

- (void)setLoaded:(BOOL)a3
{
  self->_loaded = a3;
}

- (BOOL)purged
{
  return self->_purged;
}

- (void)setPurged:(BOOL)a3
{
  self->_purged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledNotifications, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_defaultSound, 0);
  objc_storeStrong((id *)&self->_sleepAlarm, 0);
  objc_storeStrong((id *)&self->_alarms, 0);
}

@end

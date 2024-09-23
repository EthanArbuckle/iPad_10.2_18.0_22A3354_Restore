@implementation MTSleepManager

- (MTSleepManager)initWithAlarmStorage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MTSleepManager *v7;

  v4 = a3;
  getHKHealthStoreClass();
  v5 = (void *)objc_opt_new();
  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MTSleepManager initWithAlarmStorage:sleepStoreProvider:featureStoreProvider:healthStore:persistence:](self, "initWithAlarmStorage:sleepStoreProvider:featureStoreProvider:healthStore:persistence:", v4, &__block_literal_global_45, &__block_literal_global_189, v5, v6);

  return v7;
}

id __39__MTSleepManager_initWithAlarmStorage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0DA8590];
  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_msgSend([v4 alloc], "initWithIdentifier:healthStore:", v6, v5);

  return v7;
}

id __39__MTSleepManager_initWithAlarmStorage___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = a2;
  v3 = objc_alloc(MEMORY[0x1E0DA8518]);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v4 = (_QWORD *)getHKFeatureIdentifierSleepCoachingSymbolLoc_ptr;
  v11 = getHKFeatureIdentifierSleepCoachingSymbolLoc_ptr;
  if (!getHKFeatureIdentifierSleepCoachingSymbolLoc_ptr)
  {
    v5 = (void *)HealthKitLibrary_1();
    v4 = dlsym(v5, "HKFeatureIdentifierSleepCoaching");
    v9[3] = (uint64_t)v4;
    getHKFeatureIdentifierSleepCoachingSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
    __39__MTSleepManager_initWithAlarmStorage___block_invoke_2_cold_1();
  v6 = (void *)objc_msgSend(v3, "initWithFeatureIdentifier:sleepStore:", *v4, v2, v8);

  return v6;
}

- (MTSleepManager)initWithAlarmStorage:(id)a3 sleepStoreProvider:(id)a4 featureStoreProvider:(id)a5 healthStore:(id)a6 persistence:(id)a7
{
  id v13;
  id v14;
  void (**v15)(id, void *);
  id v16;
  id v17;
  MTSleepManager *v18;
  NSObject *v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;
  uint8_t buf[4];
  MTSleepManager *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = (void (**)(id, void *))a5;
  v16 = a6;
  v17 = a7;
  v30.receiver = self;
  v30.super_class = (Class)MTSleepManager;
  v18 = -[MTSleepManager init](&v30, sel_init);
  if (v18)
  {
    MTLogForCategory(7);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v18;
      _os_log_impl(&dword_19AC4E000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ sleep manager initialized", buf, 0xCu);
    }

    objc_storeStrong((id *)&v18->_alarmStorage, a3);
    -[MTAlarmStorage registerObserver:](v18->_alarmStorage, "registerObserver:", v18);
    -[MTSleepManager setHealthStore:](v18, "setHealthStore:", v16);
    v20 = (void *)objc_msgSend(v14, "copy");
    -[MTSleepManager setSleepStoreProvider:](v18, "setSleepStoreProvider:", v20);

    -[MTSleepManager sleepStoreProvider](v18, "sleepStoreProvider");
    v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTSleepManager healthStore](v18, "healthStore");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v21)[2](v21, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTSleepManager setSleepStore:](v18, "setSleepStore:", v25);

    -[MTSleepManager sleepStore](v18, "sleepStore");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:", v18);

    -[MTSleepManager sleepStore](v18, "sleepStore");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTSleepManager setFeatureStore:](v18, "setFeatureStore:", v28);

    -[MTSleepManager setPersistence:](v18, "setPersistence:", v17);
  }

  return v18;
}

- (void)updateSleepAlarms
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_19AC4E000, v0, v1, "%{public}@ failed to retrieve sleep schedule model with error: %{public}@");
  OUTLINED_FUNCTION_2();
}

id __35__MTSleepManager_updateSleepAlarms__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "isEnabled");
  objc_msgSend(*(id *)(a1 + 40), "wakeUpConfirmedUntilDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTSleepUtilities alarmFromSleepOccurrence:scheduleEnabled:keepOffUntilDate:](MTSleepUtilities, "alarmFromSleepOccurrence:scheduleEnabled:keepOffUntilDate:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_didCompleteSleepOnboarding
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  char v7;
  id v9;
  uint8_t buf[4];
  MTSleepManager *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MTSleepManager featureStore](self, "featureStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v3, "isCurrentOnboardingVersionCompletedWithError:", &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;

  MTLogForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v11 = self;
    v12 = 2114;
    v13 = v4;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ completed sleep onboarding check with result: %{public}@, error: %{public}@ ", buf, 0x20u);
  }

  if (v5)
    v7 = 0;
  else
    v7 = objc_msgSend(v4, "BOOLValue");

  return v7;
}

- (void)resetSleepAlarmSnoozeState
{
  NSObject *v3;
  int v4;
  MTSleepManager *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(7);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ resetSleepAlarmSnoozeState", (uint8_t *)&v4, 0xCu);
  }

  if (MTShouldHandleForEucalyptus())
    -[MTAlarmStorage updateSleepAlarmsWithBlock:source:](self->_alarmStorage, "updateSleepAlarmsWithBlock:source:", &__block_literal_global_198, self);
}

uint64_t __44__MTSleepManager_resetSleepAlarmSnoozeState__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resetSnoozeFireDate");
}

- (BOOL)watchSleepFeaturesEnabled
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;
  _QWORD v15[5];
  uint8_t buf[4];
  MTSleepManager *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MTSleepManager persistence](self, "persistence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("MTNeedsSleepMigration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    MTLogForCategory(7);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v17 = self;
      _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_INFO, "%{public}@ needs sleep migration, fetching watchSleepFeaturesEnabled async", buf, 0xCu);
    }

    -[MTSleepManager sleepStore](self, "sleepStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __43__MTSleepManager_watchSleepFeaturesEnabled__block_invoke;
    v15[3] = &unk_1E39CEBF8;
    v15[4] = self;
    objc_msgSend(v7, "currentSleepSettingsWithCompletion:", v15);

    return 0;
  }
  else
  {
    -[MTSleepManager sleepStore](self, "sleepStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v9, "currentSleepSettingsWithError:", &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;
    v8 = objc_msgSend(v10, "watchSleepFeaturesEnabled");

    if (v11)
    {
      MTLogForCategory(7);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[MTSleepManager watchSleepFeaturesEnabled].cold.1();

    }
  }
  return v8;
}

void __43__MTSleepManager_watchSleepFeaturesEnabled__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    MTLogForCategory(7);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __43__MTSleepManager_watchSleepFeaturesEnabled__block_invoke_cold_1(a1, (uint64_t)v4, v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "markSleepMigrationComplete");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", MTSleepManagerSettingsDidChange, 0);

  }
}

- (void)markSleepMigrationComplete
{
  void *v2;
  id v3;

  -[MTSleepManager persistence](self, "persistence");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v2, CFSTR("MTNeedsSleepMigration"));

}

- (id)sourceIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)sleepStore:(id)a3 sleepSettingsDidChange:(id)a4
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", MTSleepManagerSettingsDidChange, 0);

}

+ (id)nextSleepAlarm
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = a1;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ fetching sleep alarm from health", buf, 0xCu);
  }

  getHKHealthStoreClass();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8590]), "initWithHealthStore:", v4);
  objc_msgSend(MEMORY[0x1E0C99D68], "mtNow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v5, "upcomingScheduleOccurrenceAfterDate:error:", v6, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;

  if (v8)
  {
    MTLogForCategory(7);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[MTSleepManager nextSleepAlarm].cold.3();
  }
  else
  {
    v13 = 0;
    objc_msgSend(v5, "currentSleepScheduleWithError:", &v13);
    v9 = objc_claimAutoreleasedReturnValue();
    v8 = v13;
    if (v8)
    {
      MTLogForCategory(7);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[MTSleepManager nextSleepAlarm].cold.2();
    }
    else
    {
      if (v7)
      {
        +[MTSleepUtilities alarmFromSleepOccurrence:scheduleEnabled:keepOffUntilDate:](MTSleepUtilities, "alarmFromSleepOccurrence:scheduleEnabled:keepOffUntilDate:", v7, v9 != 0, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      MTLogForCategory(7);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[MTSleepManager nextSleepAlarm].cold.1((uint64_t)a1, v10);
    }

  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)source:(id)a3 didDismissAlarm:(id)a4 dismissAction:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  MTSleepManager *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "isSleepAlarm"))
  {
    if (a5 <= 0xB && ((1 << a5) & 0x8E0) != 0)
    {
      MTLogForCategory(7);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "alarmIDString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "dismissedDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        MTDismissAlarmActionDescription(a5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v23 = self;
        v24 = 2114;
        v25 = v11;
        v26 = 2114;
        v27 = v12;
        v28 = 2114;
        v29 = v13;
        _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ informing sleep store of alarm dismiss: %{public}@, dismiss date:%{public}@ action: %{public}@", buf, 0x2Au);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = objc_msgSend(v8, "isFromOtherDevice");
      else
        v14 = 0;
      -[MTSleepManager sleepStore](self, "sleepStore");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dismissedDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __55__MTSleepManager_source_didDismissAlarm_dismissAction___block_invoke;
      v20[3] = &unk_1E39CEC20;
      v20[4] = self;
      v21 = v9;
      objc_msgSend(v15, "sleepAlarmWasDismissedOnDate:source:completion:", v16, v14, v20);

    }
    else
    {
      MTLogForCategory(7);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "alarmIDString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        MTDismissAlarmActionDescription(a5);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v23 = self;
        v24 = 2114;
        v25 = v18;
        v26 = 2114;
        v27 = v19;
        _os_log_impl(&dword_19AC4E000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ not informing sleep store of alarm dismiss: %{public}@, action: %{public}@", buf, 0x20u);

      }
    }
  }

}

void __55__MTSleepManager_source_didDismissAlarm_dismissAction___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MTLogForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "alarmIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544130;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    v13 = 1024;
    v14 = a2;
    v15 = 2114;
    v16 = v5;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ sleep store sleepAlarmWasDismissedOnDate completed for alarm id: %{public}@ with status: %d, error: %{public}@", (uint8_t *)&v9, 0x26u);

  }
}

- (void)source:(id)a3 didSnoozeAlarm:(id)a4 snoozeAction:(unint64_t)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "isSleepAlarm"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = objc_msgSend(v7, "isFromOtherDevice");
    else
      v9 = 0;
    -[MTSleepManager sleepStore](self, "sleepStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "snoozeFireDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__MTSleepManager_source_didSnoozeAlarm_snoozeAction___block_invoke;
    v12[3] = &unk_1E39CEC20;
    v12[4] = self;
    v13 = v8;
    objc_msgSend(v10, "sleepAlarmWasSnoozedUntilDate:source:completion:", v11, v9, v12);

  }
}

void __53__MTSleepManager_source_didSnoozeAlarm_snoozeAction___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MTLogForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "alarmIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544130;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    v13 = 1024;
    v14 = a2;
    v15 = 2114;
    v16 = v5;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ sleep store sleepAlarmWasSnoozedUntilDate completed for alarm id: %{public}@ with status: %d, error: %{public}@", (uint8_t *)&v9, 0x26u);

  }
}

- (void)source:(id)a3 didUpdateAlarms:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];

  v6 = a3;
  if (objc_msgSend(a4, "na_any:", &__block_literal_global_207))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = objc_msgSend(v6, "isFromOtherDevice");
    else
      v7 = 0;
    -[MTSleepManager sleepStore](self, "sleepStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __41__MTSleepManager_source_didUpdateAlarms___block_invoke_2;
    v9[3] = &unk_1E39CEC68;
    v9[4] = self;
    objc_msgSend(v8, "sleepAlarmWasModifiedFromSource:completion:", v7, v9);

  }
}

uint64_t __41__MTSleepManager_source_didUpdateAlarms___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSleepAlarm");
}

void __41__MTSleepManager_source_didUpdateAlarms___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MTLogForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543874;
    v9 = v7;
    v10 = 1024;
    v11 = a2;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ sleep store sleepAlarmWasModified completed with status: %d, error: %{public}@", (uint8_t *)&v8, 0x1Cu);
  }

}

- (MTAlarmStorage)alarmStorage
{
  return self->_alarmStorage;
}

- (id)sleepStoreProvider
{
  return self->_sleepStoreProvider;
}

- (void)setSleepStoreProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HKSPSleepStore)sleepStore
{
  return self->_sleepStore;
}

- (void)setSleepStore:(id)a3
{
  objc_storeStrong((id *)&self->_sleepStore, a3);
}

- (HKSPFeatureAvailabilityStore)featureStore
{
  return self->_featureStore;
}

- (void)setFeatureStore:(id)a3
{
  objc_storeStrong((id *)&self->_featureStore, a3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (MTPersistence)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_persistence, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_featureStore, 0);
  objc_storeStrong((id *)&self->_sleepStore, 0);
  objc_storeStrong(&self->_sleepStoreProvider, 0);
  objc_storeStrong((id *)&self->_alarmStorage, 0);
}

void __39__MTSleepManager_initWithAlarmStorage___block_invoke_2_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "HKFeatureIdentifier getHKFeatureIdentifierSleepCoaching(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MTSleepManager.m"), 33, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)watchSleepFeaturesEnabled
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_19AC4E000, v0, v1, "%{public}@ failed to get sleep settings, error: %{public}@ ");
  OUTLINED_FUNCTION_2();
}

void __43__MTSleepManager_watchSleepFeaturesEnabled__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_19AC4E000, a2, a3, "%{public}@ failed to get sleep settings, error: %{public}@ ", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

+ (void)nextSleepAlarm
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_19AC4E000, v0, v1, "%{public}@ failed to retrieve upcoming sleep occurrence with error: %{public}@");
  OUTLINED_FUNCTION_2();
}

@end

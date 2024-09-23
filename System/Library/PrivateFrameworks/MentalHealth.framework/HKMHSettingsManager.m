@implementation HKMHSettingsManager

- (HKMHSettingsManager)init
{
  void *v3;
  HKMHSettingsManager *v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "hkmh_mentalHealthDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKMHSettingsManager initWithUserDefaults:](self, "initWithUserDefaults:", v3);

  return v4;
}

- (HKMHSettingsManager)initWithUserDefaults:(id)a3
{
  id v5;
  HKMHSettingsManager *v6;
  HKMHSettingsManager *v7;
  id v8;
  uint64_t v9;
  HKObserverSet *observers;
  uint64_t v11;
  NSArray *allSettingsToObserve;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKMHSettingsManager;
  v6 = -[HKMHSettingsManager init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userDefaults, a3);
    v8 = objc_alloc(MEMORY[0x24BDD3DD0]);
    v9 = objc_msgSend(v8, "initWithName:loggingCategory:", CFSTR("HKMHSettingsManagerObservers"), *MEMORY[0x24BDD3038]);
    observers = v7->_observers;
    v7->_observers = (HKObserverSet *)v9;

    _NotificationSettingKeys();
    v11 = objc_claimAutoreleasedReturnValue();
    allSettingsToObserve = v7->_allSettingsToObserve;
    v7->_allSettingsToObserve = (NSArray *)v11;

    -[HKMHSettingsManager _startObservingDefaults](v7, "_startObservingDefaults");
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[HKMHSettingsManager _stopObservingAllDefaults](self, "_stopObservingAllDefaults");
  v3.receiver = self;
  v3.super_class = (Class)HKMHSettingsManager;
  -[HKMHSettingsManager dealloc](&v3, sel_dealloc);
}

- (BOOL)middayNotificationsEnabled
{
  void *v3;

  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEBUG))
    -[HKMHSettingsManager middayNotificationsEnabled].cold.1(v3);
  return -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("StateOfMindLoggingReminderNotificationMiddayEnabledKey"));
}

- (void)setMiddayNotificationsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  void *v10;
  _BYTE v11[24];
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = CFSTR("NO");
    if (v3)
      v8 = CFSTR("YES");
    *(_DWORD *)v11 = 138543618;
    *(_QWORD *)&v11[4] = v7;
    *(_WORD *)&v11[12] = 2114;
    *(_QWORD *)&v11[14] = v8;
    v9 = v7;
    _os_log_impl(&dword_2416DD000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set emotion logging reminder notifications enabled: %{public}@", v11, 0x16u);

  }
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", v3, CFSTR("StateOfMindLoggingReminderNotificationMiddayEnabledKey"), *(_OWORD *)v11, *(_QWORD *)&v11[16], v12);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("StateOfMindLoggingReminderNotificationMiddayEnabledKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HKSynchronizeNanoPreferencesUserDefaults();

}

- (BOOL)endOfDayNotificationsEnabled
{
  void *v3;

  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEBUG))
    -[HKMHSettingsManager endOfDayNotificationsEnabled].cold.1(v3);
  return -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("StateOfMindLoggingReminderNotificationEndOfDayEnabledKey"));
}

- (void)setEndOfDayNotificationsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  void *v10;
  _BYTE v11[24];
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = CFSTR("NO");
    if (v3)
      v8 = CFSTR("YES");
    *(_DWORD *)v11 = 138543618;
    *(_QWORD *)&v11[4] = v7;
    *(_WORD *)&v11[12] = 2114;
    *(_QWORD *)&v11[14] = v8;
    v9 = v7;
    _os_log_impl(&dword_2416DD000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set emotion logging reminder notifications enabled: %{public}@", v11, 0x16u);

  }
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", v3, CFSTR("StateOfMindLoggingReminderNotificationEndOfDayEnabledKey"), *(_OWORD *)v11, *(_QWORD *)&v11[16], v12);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("StateOfMindLoggingReminderNotificationEndOfDayEnabledKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HKSynchronizeNanoPreferencesUserDefaults();

}

- (NSArray)customReminderSchedule
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v7;

  -[NSUserDefaults dataForKey:](self->_userDefaults, "dataForKey:", CFSTR("StateOfMindLoggingReminderNotificationCustomScheduleKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedArrayOfObjectsOfClass:fromData:error:", objc_opt_class(), v2, &v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
    if (!v3)
    {
      _HKInitializeLogging();
      v5 = (void *)*MEMORY[0x24BDD3038];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_ERROR))
        -[HKMHSettingsManager customReminderSchedule].cold.1(v5);
    }

  }
  else
  {
    v3 = (void *)MEMORY[0x24BDBD1A8];
  }

  return (NSArray *)v3;
}

- (void)setCustomReminderSchedule:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (v4)
  {
    -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v4, CFSTR("StateOfMindLoggingReminderNotificationCustomScheduleKey"));
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("StateOfMindLoggingReminderNotificationCustomScheduleKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HKSynchronizeNanoPreferencesUserDefaults();

  }
  else
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x24BDD3038];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_ERROR))
      -[HKMHSettingsManager setCustomReminderSchedule:].cold.1(v7);
  }

}

- (BOOL)periodicPromptedAssessmentNotificationsEnabled
{
  void *v3;

  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEBUG))
    -[HKMHSettingsManager periodicPromptedAssessmentNotificationsEnabled].cold.1(v3);
  return -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("PeriodicPromptedAssessmentNotificationEnabledKey"));
}

- (void)onboardToPregnancyRecommendedSettings
{
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showSensitiveLogItems");

  if (v4)
  {
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x24BDD3038];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      *(_DWORD *)v11 = 138543362;
      *(_QWORD *)&v11[4] = objc_opt_class();
      v7 = *(id *)&v11[4];
      _os_log_impl(&dword_2416DD000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarding to recommended pregnancy settings", v11, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior", *(_OWORD *)v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "features");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "seahorse");

  if (v10)
    -[HKMHSettingsManager setPeriodicPromptedAssessmentNotificationsEnabled:](self, "setPeriodicPromptedAssessmentNotificationsEnabled:", 1);
}

- (void)setPeriodicPromptedAssessmentNotificationsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  _BYTE v10[24];
  const __CFString *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = CFSTR("NO");
    *(_DWORD *)v10 = 138543874;
    *(_QWORD *)&v10[4] = v7;
    *(_WORD *)&v10[12] = 2114;
    if (v3)
      v8 = CFSTR("YES");
    *(_QWORD *)&v10[14] = CFSTR("PeriodicPromptedAssessmentNotificationEnabledKey");
    *(_WORD *)&v10[22] = 2114;
    v11 = v8;
    v9 = v7;
    _os_log_impl(&dword_2416DD000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set Periodic prompted assessment notifications for key: %{public}@: %{public}@", v10, 0x20u);

  }
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", v3, CFSTR("PeriodicPromptedAssessmentNotificationEnabledKey"), *(_OWORD *)v10, *(_QWORD *)&v10[16], v11);
}

- (id)periodicPromptedAssessmentNotificationTimeOfDay
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleInternalInstall");

  if (v4
    && (v5 = (void *)MEMORY[0x24BDD1620],
        v6 = objc_opt_class(),
        -[NSUserDefaults dataForKey:](self->_userDefaults, "dataForKey:", CFSTR("PeriodicPromptedAssessmentNotificationTimeOfDayOverride")), v7 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v5, "unarchivedObjectOfClass:fromData:error:", v6, v7, 0), v8 = (id)objc_claimAutoreleasedReturnValue(), v7, v8))
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x24BDD3038];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEBUG))
      -[HKMHSettingsManager periodicPromptedAssessmentNotificationTimeOfDay].cold.1(v9);
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v8, "setHour:", 20);
  }
  return v8;
}

- (void)setPeriodicPromptedAssessmentNotificationTimeOfDay:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v4, CFSTR("PeriodicPromptedAssessmentNotificationTimeOfDayOverride"));

}

- (void)_startObservingDefaults
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_allSettingsToObserve;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_userDefaults, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), 3, 0, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_stopObservingAllDefaults
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_allSettingsToObserve;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[NSUserDefaults removeObserver:forKeyPath:](self->_userDefaults, "removeObserver:forKeyPath:", self, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  _HKInitializeLogging();
  v13 = (void *)*MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    v15 = (void *)objc_opt_class();
    v16 = *MEMORY[0x24BDD0E80];
    v17 = v15;
    objc_msgSend(v12, "objectForKeyedSubscript:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v24 = v15;
    v25 = 2114;
    v26 = v10;
    v27 = 2114;
    v28 = v18;
    v29 = 2114;
    v30 = v19;
    _os_log_impl(&dword_2416DD000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ changed: %{public}@ -> %{public}@", buf, 0x2Au);

  }
  _NotificationSettingKeys();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "containsObject:", v10);

  if (v21)
  {
    -[HKMHSettingsManager _notificationSettingsDidUpdate](self, "_notificationSettingsDidUpdate");
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)HKMHSettingsManager;
    -[HKMHSettingsManager observeValueForKeyPath:ofObject:change:context:](&v22, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (BOOL)hasAnyMentalHealthNotificationsEnabled
{
  return -[HKMHSettingsManager hasAnyStateOfMindReminderEnabled](self, "hasAnyStateOfMindReminderEnabled")
      || -[HKMHSettingsManager periodicPromptedAssessmentNotificationsEnabled](self, "periodicPromptedAssessmentNotificationsEnabled");
}

- (BOOL)hasAnyStateOfMindReminderEnabled
{
  BOOL v3;
  void *v4;

  if (-[HKMHSettingsManager middayNotificationsEnabled](self, "middayNotificationsEnabled")
    || -[HKMHSettingsManager endOfDayNotificationsEnabled](self, "endOfDayNotificationsEnabled"))
  {
    return 1;
  }
  -[HKMHSettingsManager customReminderSchedule](self, "customReminderSchedule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "count") != 0;

  return v3;
}

- (BOOL)hasEverEnabledAStateOfMindReminderNotification
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("StateOfMindLoggingReminderNotificationMiddayEnabledKey"));
  v3 = objc_claimAutoreleasedReturnValue();

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("StateOfMindLoggingReminderNotificationEndOfDayEnabledKey"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v3 | v4;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("StateOfMindLoggingReminderNotificationCustomScheduleKey"));
  v6 = objc_claimAutoreleasedReturnValue();

  return (v5 | v6) != 0;
}

- (void)setReminders:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[HKMHSettingsManager setMiddayNotificationsEnabled:](self, "setMiddayNotificationsEnabled:");
  -[HKMHSettingsManager setEndOfDayNotificationsEnabled:](self, "setEndOfDayNotificationsEnabled:", v3);
}

- (void)addObserver:(id)a3 queue:(id)a4
{
  -[HKObserverSet registerObserver:queue:](self->_observers, "registerObserver:queue:", a3, a4);
}

- (void)removeObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)_notificationSettingsDidUpdate
{
  HKObserverSet *observers;
  _QWORD v3[5];

  observers = self->_observers;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__HKMHSettingsManager__notificationSettingsDidUpdate__block_invoke;
  v3[3] = &unk_25119D8A8;
  v3[4] = self;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v3);
}

void __53__HKMHSettingsManager__notificationSettingsDidUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "settingsManagerDidUpdateNotificationSettings:", *(_QWORD *)(a1 + 32));

}

- (void)_setTestDefaults:(id)a3
{
  NSUserDefaults *v4;
  NSUserDefaults *userDefaults;

  v4 = (NSUserDefaults *)a3;
  -[HKMHSettingsManager _stopObservingAllDefaults](self, "_stopObservingAllDefaults");
  userDefaults = self->_userDefaults;
  self->_userDefaults = v4;

  -[HKMHSettingsManager _startObservingDefaults](self, "_startObservingDefaults");
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_allSettingsToObserve, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)middayNotificationsEnabled
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4(a1);
  v2 = (void *)OUTLINED_FUNCTION_8();
  v3 = OUTLINED_FUNCTION_5(v2);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_2416DD000, v4, v5, "[%{public}@] Emotion logging enabled: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0();
}

- (void)endOfDayNotificationsEnabled
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4(a1);
  v2 = (void *)OUTLINED_FUNCTION_8();
  v3 = OUTLINED_FUNCTION_5(v2);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_2416DD000, v4, v5, "[%{public}@] Emotion logging enabled: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0();
}

- (void)customReminderSchedule
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4(a1);
  v2 = (void *)OUTLINED_FUNCTION_6();
  v3 = OUTLINED_FUNCTION_2(v2);
  OUTLINED_FUNCTION_7(&dword_2416DD000, v4, v5, "[%{public}@] Failed to fetch custom schedule with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0();
}

- (void)setCustomReminderSchedule:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4(a1);
  v2 = (void *)OUTLINED_FUNCTION_6();
  v3 = OUTLINED_FUNCTION_2(v2);
  OUTLINED_FUNCTION_7(&dword_2416DD000, v4, v5, "[%{public}@] Failed to write data with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0();
}

- (void)periodicPromptedAssessmentNotificationsEnabled
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4(a1);
  v2 = (void *)OUTLINED_FUNCTION_8();
  v3 = OUTLINED_FUNCTION_5(v2);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_2416DD000, v4, v5, "[%{public}@] Periodic prompted assessment notifications enabled: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0();
}

- (void)periodicPromptedAssessmentNotificationTimeOfDay
{
  NSObject *v1;
  void *v2;
  id v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_4(a1);
  v2 = (void *)OUTLINED_FUNCTION_6();
  v3 = OUTLINED_FUNCTION_2(v2);
  _os_log_debug_impl(&dword_2416DD000, v1, OS_LOG_TYPE_DEBUG, "[%{public}@] Using overridden mental health notification time: %{public}@", v4, 0x16u);

  OUTLINED_FUNCTION_0();
}

@end

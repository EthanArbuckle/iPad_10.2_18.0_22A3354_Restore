@implementation MTAlarmMigrator

- (void)migrateFromOldStorage
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[MTLegacyManager sharedManager](MTLegacyManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alarms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTLegacyManager sharedManager](MTLegacyManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sleepAlarm");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543874;
  v10 = a1;
  v11 = 2114;
  v12 = v5;
  v13 = 2114;
  v14 = v7;
  OUTLINED_FUNCTION_0_3(&dword_19AC4E000, a2, v8, "%{public}@ need to migrate alarms: %{public}@ and sleep alarm: %{public}@", (uint8_t *)&v9);

}

void __40__MTAlarmMigrator_migrateFromOldStorage__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[MTLegacyManager alarmFromOldAlarm:](MTLegacyManager, "alarmFromOldAlarm:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MTLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "alarmID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 1026;
    v13 = objc_msgSend(v3, "isEnabled");
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ migrated alarm %{public}@ (enabled: %{public}d)", (uint8_t *)&v8, 0x1Cu);

  }
  objc_msgSend(*(id *)(a1 + 32), "alarms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v3);

}

- (void)removeFromOldStorage
{
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  int v6;
  MTAlarmMigrator *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = MTIsHorseman();
  MTLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = 138543362;
      v7 = self;
      _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ skipping migration removal, as this device doesn't support the old storage", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      v6 = 138543362;
      v7 = self;
      _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ removing old alarms and notifications from storage", (uint8_t *)&v6, 0xCu);
    }

    +[MTLegacyManager sharedManager](MTLegacyManager, "sharedManager");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject purgeLegacyData](v4, "purgeLegacyData");
  }

}

- (void)cleanUpOldNotifications
{
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  int v6;
  MTAlarmMigrator *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = MTIsHorseman();
  MTLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = 138543362;
      v7 = self;
      _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ notification cleanup, as this device doesn't support the old storage", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      v6 = 138543362;
      v7 = self;
      _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ cleaning up old notifications", (uint8_t *)&v6, 0xCu);
    }

    +[MTLegacyManager sharedManager](MTLegacyManager, "sharedManager");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject cancelNotifications](v4, "cancelNotifications");
  }

}

- (void)clearInvalidPendingNotifications
{
  id v2;

  +[MTLegacyManager sharedManager](MTLegacyManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearInvalidPendingNotifications");

}

- (NSMutableArray)alarms
{
  return self->_alarms;
}

- (void)setAlarms:(id)a3
{
  objc_storeStrong((id *)&self->_alarms, a3);
}

- (MTAlarm)sleepAlarm
{
  return self->_sleepAlarm;
}

- (void)setSleepAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_sleepAlarm, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepAlarm, 0);
  objc_storeStrong((id *)&self->_alarms, 0);
}

@end

@implementation HDSettingsMigrationManager

- (HDSettingsMigrationManager)initWithProfile:(id)a3 identifier:(id)a4 currentMigrationVersion:(int64_t)a5 migrationSteps:(id)a6 delegate:(id)a7 loggingCategory:(id)a8
{
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  HDSettingsMigrationManager *v22;

  v14 = (objc_class *)MEMORY[0x1E0C99EA0];
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_msgSend([v14 alloc], "initWithSuiteName:", CFSTR("com.apple.private.health.settings-migration"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HDSettingsMigrationManager_LastCompletedVersion_%@"), v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[HDSettingsMigrationManager initWithProfile:identifier:currentMigrationVersion:migrationSteps:delegate:migrationVersionDefaults:lastMigratedVersionKey:loggingCategory:](self, "initWithProfile:identifier:currentMigrationVersion:migrationSteps:delegate:migrationVersionDefaults:lastMigratedVersionKey:loggingCategory:", v19, v18, a5, v17, v16, v20, v21, v15);

  return v22;
}

- (HDSettingsMigrationManager)initWithProfile:(id)a3 identifier:(id)a4 currentMigrationVersion:(int64_t)a5 migrationSteps:(id)a6 delegate:(id)a7 migrationVersionDefaults:(id)a8 lastMigratedVersionKey:(id)a9 loggingCategory:(id)a10
{
  id v16;
  id v17;
  id v18;
  HDSettingsMigrationManager *v19;
  HDSettingsMigrationManager *v20;
  uint64_t v21;
  OS_dispatch_queue *queue;
  id WeakRetained;
  id v25;
  id v26;
  id v27;
  id obj;
  objc_super v29;

  obj = a3;
  v16 = a4;
  v27 = a6;
  v17 = a7;
  v26 = a8;
  v25 = a9;
  v18 = a10;
  v29.receiver = self;
  v29.super_class = (Class)HDSettingsMigrationManager;
  v19 = -[HDSettingsMigrationManager init](&v29, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_profile, obj);
    objc_storeStrong((id *)&v20->_identifier, a4);
    v20->_currentMigrationVersion = a5;
    objc_storeStrong((id *)&v20->_migrationSteps, a6);
    objc_storeWeak((id *)&v20->_delegate, v17);
    objc_storeStrong((id *)&v20->_migrationVersionDefaults, a8);
    objc_storeStrong((id *)&v20->_lastMigratedVersionKey, a9);
    objc_storeStrong((id *)&v20->_loggingCategory, a10);
    HKCreateSerialDispatchQueue();
    v21 = objc_claimAutoreleasedReturnValue();
    queue = v20->_queue;
    v20->_queue = (OS_dispatch_queue *)v21;

    WeakRetained = objc_loadWeakRetained((id *)&v20->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v20, v20->_queue);

  }
  return v20;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%@>"), objc_opt_class(), self->_identifier);
}

- (void)profileDidBecomeReady:(id)a3
{
  NSObject *queue;
  id v5;
  id v6;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(v5, "daemon");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "registerDaemonReadyObserver:queue:", self, self->_queue);
}

- (void)daemonReady:(id)a3
{
  void *v4;
  int64_t currentMigrationVersion;
  uint64_t v6;
  NSObject *loggingCategory;
  id WeakRetained;
  NSObject *v9;
  id v10;
  void *v11;
  OS_dispatch_queue *queue;
  _QWORD v13[6];
  uint8_t buf[4];
  HDSettingsMigrationManager *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSUserDefaults hk_safeNumberIfExistsForKeyPath:error:](self->_migrationVersionDefaults, "hk_safeNumberIfExistsForKeyPath:error:", self->_lastMigratedVersionKey, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  currentMigrationVersion = self->_currentMigrationVersion;
  if (currentMigrationVersion <= objc_msgSend(v4, "integerValue"))
  {
    _HKInitializeLogging();
    loggingCategory = self->_loggingCategory;
    if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v15 = self;
      v16 = 2114;
      v17 = (uint64_t)v4;
      _os_log_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Current migration version: %{public}@, no migration needed", buf, 0x16u);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "settingsMigrationManagerDidCompleteMigration:didRunMigrationSteps:", self, 0);

  }
  else
  {
    if (v4)
      v6 = objc_msgSend(v4, "integerValue");
    else
      v6 = -1;
    _HKInitializeLogging();
    v9 = self->_loggingCategory;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v15 = self;
      v16 = 2050;
      v17 = v6;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Current migration version: %{public}ld, scheduling migration", buf, 0x16u);
    }
    v10 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v10, "database");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __42__HDSettingsMigrationManager_daemonReady___block_invoke;
    v13[3] = &unk_1E6CE8058;
    v13[4] = self;
    v13[5] = v6;
    objc_msgSend(v11, "performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:block:", queue, v13);

  }
}

void __42__HDSettingsMigrationManager_daemonReady___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "daemon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maintenanceWorkCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(v6 + 64);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__HDSettingsMigrationManager_daemonReady___block_invoke_2;
  v10[3] = &unk_1E6CE8058;
  v10[4] = v6;
  v10[5] = v7;
  +[HDMaintenanceOperation maintenanceOperationWithName:queue:synchronousBlock:](HDMaintenanceOperation, "maintenanceOperationWithName:queue:synchronousBlock:", v5, v8, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enqueueMaintenanceOperation:", v9);

}

uint64_t __42__HDSettingsMigrationManager_daemonReady___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_performMigrationFromCurrentMigrationVersion:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_performMigrationFromCurrentMigrationVersion:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int64_t v10;
  NSObject *loggingCategory;
  _BOOL4 v12;
  id WeakRetained;
  char v14;
  id v15;
  NSUserDefaults *migrationVersionDefaults;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  NSArray *obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  HDSettingsMigrationManager *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = self->_migrationSteps;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "migrationVersion");
        _HKInitializeLogging();
        loggingCategory = self->_loggingCategory;
        v12 = os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT);
        if (v10 <= a3)
        {
          if (v12)
          {
            *(_DWORD *)buf = 138543618;
            v29 = self;
            v30 = 2114;
            v31 = v9;
            _os_log_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping migration step as it has already occurred: %{public}@", buf, 0x16u);
          }
        }
        else
        {
          if (v12)
          {
            *(_DWORD *)buf = 138543618;
            v29 = self;
            v30 = 2114;
            v31 = v9;
            _os_log_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing migration step: %{public}@", buf, 0x16u);
          }
          WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
          v23 = 0;
          v14 = objc_msgSend(v9, "performStepWithProfile:error:", WeakRetained, &v23);
          v15 = v23;

          if ((v14 & 1) == 0)
          {
            _HKInitializeLogging();
            v20 = self->_loggingCategory;
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543874;
              v29 = self;
              v30 = 2114;
              v31 = v9;
              v32 = 2114;
              v33 = v15;
              _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Error performing step %{public}@: %{public}@", buf, 0x20u);
            }

            v19 = 0;
            goto LABEL_21;
          }
          migrationVersionDefaults = self->_migrationVersionDefaults;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "migrationVersion"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSUserDefaults setObject:forKey:](migrationVersionDefaults, "setObject:forKey:", v17, self->_lastMigratedVersionKey);

          _HKInitializeLogging();
          v18 = self->_loggingCategory;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v29 = self;
            v30 = 2114;
            v31 = v9;
            _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completed migration step: %{public}@", buf, 0x16u);
          }

        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
      if (v6)
        continue;
      break;
    }
  }
  v19 = 1;
LABEL_21:

  v21 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v21, "settingsMigrationManagerDidCompleteMigration:didRunMigrationSteps:", self, v19);

}

- (HDSettingsMigrationManagerDelegate)delegate
{
  return (HDSettingsMigrationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_lastMigratedVersionKey, 0);
  objc_storeStrong((id *)&self->_migrationVersionDefaults, 0);
  objc_storeStrong((id *)&self->_migrationSteps, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end

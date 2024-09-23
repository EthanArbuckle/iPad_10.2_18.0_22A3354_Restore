@implementation FIMindfulnessAppMigrator

- (FIMindfulnessAppMigrator)init
{
  return -[FIMindfulnessAppMigrator initWithContainer:](self, "initWithContainer:", 0);
}

- (FIMindfulnessAppMigrator)initWithContainer:(id)a3
{
  id v5;
  FIMindfulnessAppMigrator *v6;
  FIMindfulnessAppMigrator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FIMindfulnessAppMigrator;
  v6 = -[FIMindfulnessAppMigrator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_container, a3);

  return v7;
}

- (void)migrateIfNeeded
{
  int64_t v3;
  int64_t v4;
  NSObject *v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  int v9;
  int64_t v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  os_log_t *v15;
  int v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned __int8 v28;
  _QWORD v29[2];
  uint8_t buf[4];
  _BYTE v31[10];
  int64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v28 = 0;
  v3 = -[FIMindfulnessAppMigrator _integerForKey:exists:](self, "_integerForKey:exists:", CFSTR("MigratedBreathRate"), &v28);
  v27 = 0;
  v4 = -[FIMindfulnessAppMigrator _integerForKey:exists:](self, "_integerForKey:exists:", CFSTR("MigratedHapticLevel"), &v27);
  if (v28 | v27)
  {
    v6 = v4;
    v26 = 0;
    v7 = -[FIMindfulnessAppMigrator _integerForKey:exists:](self, "_integerForKey:exists:", CFSTR("BreathRate"), &v26);
    v25 = 0;
    v8 = -[FIMindfulnessAppMigrator _integerForKey:exists:](self, "_integerForKey:exists:", CFSTR("HapticLevel"), &v25);
    v9 = v26;
    if (v26 && v25)
    {
      v10 = v8;
      _HKInitializeLogging();
      v11 = *MEMORY[0x24BDD2FE0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)v31 = v7;
        *(_WORD *)&v31[8] = 2048;
        v32 = v10;
        _os_log_impl(&dword_21168F000, v11, OS_LOG_TYPE_DEFAULT, "[FIMindfulnessAppMigrator] Values already exist (BreathRate: %ld, HapticLevel: %ld)", buf, 0x16u);
      }
      -[FIMindfulnessAppMigrator _removeObjectForKey:](self, "_removeObjectForKey:", CFSTR("MigratedBreathRate"));
      -[FIMindfulnessAppMigrator _removeObjectForKey:](self, "_removeObjectForKey:", CFSTR("MigratedHapticLevel"));
    }
    else
    {
      v12 = v28;
      _HKInitializeLogging();
      v13 = *MEMORY[0x24BDD2FE0];
      v14 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE0], OS_LOG_TYPE_DEFAULT);
      if (v9 || !v12)
      {
        v15 = (os_log_t *)MEMORY[0x24BDD2FE0];
        if (v14)
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v31 = v26;
          *(_WORD *)&v31[4] = 1024;
          *(_DWORD *)&v31[6] = v28;
          _os_log_impl(&dword_21168F000, v13, OS_LOG_TYPE_DEFAULT, "[FIMindfulnessAppMigrator] Not migrating breath rate (existing: %{BOOL}d, migrated: %{BOOL}d)", buf, 0xEu);
        }
      }
      else
      {
        if (v14)
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)v31 = v3;
          _os_log_impl(&dword_21168F000, v13, OS_LOG_TYPE_DEFAULT, "[FIMindfulnessAppMigrator] Migrating BreatheRate: %ld", buf, 0xCu);
        }
        -[FIMindfulnessAppMigrator _setInteger:key:](self, "_setInteger:key:", v3, CFSTR("BreathRate"));
        v15 = (os_log_t *)MEMORY[0x24BDD2FE0];
      }
      v16 = v25;
      v17 = v27;
      _HKInitializeLogging();
      v18 = *v15;
      v19 = os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT);
      if (v16 || !v17)
      {
        if (v19)
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v31 = v25;
          *(_WORD *)&v31[4] = 1024;
          *(_DWORD *)&v31[6] = v27;
          _os_log_impl(&dword_21168F000, v18, OS_LOG_TYPE_DEFAULT, "[FIMindfulnessAppMigrator] Not migrating haptic level (existing: %{BOOL}d, migratedBreathRateExists %{BOOL}d)", buf, 0xEu);
        }
      }
      else
      {
        if (v19)
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)v31 = v6;
          _os_log_impl(&dword_21168F000, v18, OS_LOG_TYPE_DEFAULT, "[FIMindfulnessAppMigrator] Migrating HapticLevel: %ld", buf, 0xCu);
        }
        -[FIMindfulnessAppMigrator _setInteger:key:](self, "_setInteger:key:", v6, CFSTR("HapticLevel"));
      }
      -[FIMindfulnessAppMigrator _synchronize](self, "_synchronize");
      _HKInitializeLogging();
      v20 = *v15;
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21168F000, v20, OS_LOG_TYPE_DEFAULT, "[FIMindfulnessAppMigrator] Syncing to Companion", buf, 2u);
      }
      v21 = objc_alloc_init(MEMORY[0x24BE6B2C8]);
      v22 = (void *)MEMORY[0x24BDBCF20];
      v29[0] = CFSTR("BreathRate");
      v29[1] = CFSTR("HapticLevel");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setWithArray:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "synchronizeUserDefaultsDomain:keys:container:", CFSTR("com.apple.Mind"), v24, CFSTR("com.apple.Mind"));

      -[FIMindfulnessAppMigrator _removeObjectForKey:](self, "_removeObjectForKey:", CFSTR("MigratedBreathRate"));
      -[FIMindfulnessAppMigrator _removeObjectForKey:](self, "_removeObjectForKey:", CFSTR("MigratedHapticLevel"));
      notify_post("NanoLifestyleMindfulnessPreferencesChangedNotification");
    }
  }
  else
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x24BDD2FE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21168F000, v5, OS_LOG_TYPE_DEFAULT, "[FIMindfulnessAppMigrator] No keys to migrate", buf, 2u);
    }
  }
}

- (int64_t)_integerForKey:(id)a3 exists:(BOOL *)a4
{
  id v6;
  int64_t AppIntegerValueWithContainer;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;

  v6 = a3;
  v12 = 0;
  if (self->_container)
  {
    AppIntegerValueWithContainer = _CFPreferencesGetAppIntegerValueWithContainer();
    if (a4)
LABEL_3:
      *a4 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v11 = objc_msgSend(v10, "integerValue");
      v12 = v11 != 0;
      if (v11)
        AppIntegerValueWithContainer = objc_msgSend(v10, "integerValue");
      else
        AppIntegerValueWithContainer = 0;
    }
    else
    {
      AppIntegerValueWithContainer = 0;
      v12 = 0;
    }

    if (a4)
      goto LABEL_3;
  }

  return AppIntegerValueWithContainer;
}

- (void)_setInteger:(int64_t)a3 key:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  if (self->_container)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    v8 = a4;
    objc_msgSend(v5, "numberWithInteger:", a3);
    _CFPreferencesSetAppValueWithContainer();
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBCF50];
    v7 = a4;
    objc_msgSend(v6, "standardUserDefaults");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInteger:forKey:", a3, v7);

  }
}

- (void)_removeObjectForKey:(id)a3
{
  void *v3;
  id v4;
  id v5;

  if (self->_container)
  {
    v5 = a3;
    _CFPreferencesSetAppValueWithContainer();
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDBCF50];
    v4 = a3;
    objc_msgSend(v3, "standardUserDefaults");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v4);

  }
}

- (void)_synchronize
{
  id v2;

  if (self->_container)
  {
    _CFPreferencesAppSynchronizeWithContainer();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "synchronize");

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
}

@end

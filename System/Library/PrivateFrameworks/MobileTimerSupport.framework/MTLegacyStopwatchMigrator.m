@implementation MTLegacyStopwatchMigrator

- (MTLegacyStopwatchMigrator)initWithDefaults:(id)a3 manager:(id)a4
{
  id v6;
  id v7;
  MTLegacyStopwatchMigrator *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  MTLegacyStopwatchMigrator *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTLegacyStopwatchMigrator;
  v8 = -[MTLegacyStopwatchMigrator init](&v11, sel_init);
  if (v8)
  {
    MTLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v8;
      _os_log_impl(&dword_1B8D7F000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ initialized", buf, 0xCu);
    }

    -[MTLegacyStopwatchMigrator setDefaults:](v8, "setDefaults:", v6);
    -[MTLegacyStopwatchMigrator setManager:](v8, "setManager:", v7);
    -[MTLegacyStopwatchMigrator loadInitialState](v8, "loadInitialState");
  }

  return v8;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (void)loadInitialState
{
  void *v3;
  void *v4;
  id v5;

  -[MTLegacyStopwatchMigrator defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTLegacyStopwatchMigrator setIsTimerRunning:](self, "setIsTimerRunning:", objc_msgSend(v3, "BOOLForKey:", CFSTR("TIMERRUNNING")));

  -[MTLegacyStopwatchMigrator defaults](self, "defaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("LASTTIME"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  -[MTLegacyStopwatchMigrator setCurrentInterval:](self, "setCurrentInterval:");

}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setIsTimerRunning:(BOOL)a3
{
  self->_isTimerRunning = a3;
}

- (void)setCurrentInterval:(double)a3
{
  self->_currentInterval = a3;
}

- (id)migrateLegacyStopwatch
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  MTLegacyStopwatchMigrator *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  MTLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = self;
    _os_log_impl(&dword_1B8D7F000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ migrating legacy stopwatch", buf, 0xCu);
  }

  -[MTLegacyStopwatchMigrator generateStopwatchFromDefaults](self, "generateStopwatchFromDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MTLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v14 = self;
    v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_1B8D7F000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ generated stopwatch from previous defaults: %{public}@", buf, 0x16u);
  }

  -[MTLegacyStopwatchMigrator manager](self, "manager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getStopwatches");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__MTLegacyStopwatchMigrator_migrateLegacyStopwatch__block_invoke;
  v11[3] = &unk_1E6F29260;
  v11[4] = self;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v7, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __51__MTLegacyStopwatchMigrator_migrateLegacyStopwatch__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MTLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1B8D7F000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ retrieved default stopwatch: %{public}@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createStopwatch:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__MTLegacyStopwatchMigrator_migrateLegacyStopwatch__block_invoke_11;
    v10[3] = &unk_1E6F29238;
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v3;
    objc_msgSend(v7, "flatMap:", v10);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v7;
  }

  return v8;
}

id __51__MTLegacyStopwatchMigrator_migrateLegacyStopwatch__block_invoke_11(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MTLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_1B8D7F000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ created stopwatch from previous defaults, proceeding to delete default one", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeStopwatch:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)needsMigration
{
  double v4;

  if (-[MTLegacyStopwatchMigrator isTimerRunning](self, "isTimerRunning"))
    return 1;
  -[MTLegacyStopwatchMigrator currentInterval](self, "currentInterval");
  return v4 > 0.0;
}

- (id)generateStopwatchFromDefaults
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  double v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[MTLegacyStopwatchMigrator defaults](self, "defaults", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("LAPS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v3, "addObject:", v11);
        objc_msgSend(v11, "doubleValue");
        v9 = v9 + v12;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
  }

  -[MTLegacyStopwatchMigrator defaults](self, "defaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("OFFSET"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  -[MTLegacyStopwatchMigrator defaults](self, "defaults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", CFSTR("STARTTIME"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_opt_new();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  objc_msgSend(v20, "setStartDate:", v18);
  objc_msgSend(v20, "setOffset:", v16);
  -[MTLegacyStopwatchMigrator currentInterval](self, "currentInterval");
  objc_msgSend(v20, "setCurrentInterval:");
  objc_msgSend(v20, "setPreviousLapsTotalInterval:", v9);
  objc_msgSend(v20, "setLaps:", v3);
  objc_msgSend(v20, "setState:", 0);
  if (-[MTLegacyStopwatchMigrator isTimerRunning](self, "isTimerRunning"))
  {
    v21 = 2;
LABEL_14:
    objc_msgSend(v20, "setState:", v21);
    goto LABEL_15;
  }
  -[MTLegacyStopwatchMigrator currentInterval](self, "currentInterval");
  if (v22 > 0.0)
  {
    v21 = 1;
    goto LABEL_14;
  }
LABEL_15:

  return v20;
}

- (void)eraseLocalDefaults
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  MTLegacyStopwatchMigrator *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  MTLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = self;
    _os_log_impl(&dword_1B8D7F000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ erasing local defaults", (uint8_t *)&v9, 0xCu);
  }

  -[MTLegacyStopwatchMigrator defaults](self, "defaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("TIMERRUNNING"));

  -[MTLegacyStopwatchMigrator defaults](self, "defaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("LASTTIME"));

  -[MTLegacyStopwatchMigrator defaults](self, "defaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("LAPS"));

  -[MTLegacyStopwatchMigrator defaults](self, "defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("OFFSET"));

  -[MTLegacyStopwatchMigrator defaults](self, "defaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", CFSTR("STARTTIME"));

}

- (MTStopwatchManagerProtocol)manager
{
  return self->_manager;
}

- (BOOL)isTimerRunning
{
  return self->_isTimerRunning;
}

- (double)currentInterval
{
  return self->_currentInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end

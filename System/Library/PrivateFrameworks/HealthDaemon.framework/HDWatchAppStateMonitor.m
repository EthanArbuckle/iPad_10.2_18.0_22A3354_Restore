@implementation HDWatchAppStateMonitor

- (HDWatchAppStateMonitor)initWithBundleIdentifier:(id)a3
{
  id v5;
  HDWatchAppStateMonitor *v6;
  void *v7;
  NSObject *v8;
  NSString *bundleIdentifier;
  objc_super v11;
  uint8_t buf[4];
  HDWatchAppStateMonitor *v13;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDWatchAppStateMonitor;
  v6 = -[HDWatchAppStateMonitor init](&v11, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D230D0], "sharedMonitorForDisplayType:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    objc_msgSend(v7, "addObserver:", v6);
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      bundleIdentifier = v6->_bundleIdentifier;
      *(_DWORD *)buf = 138543618;
      v13 = v6;
      v14 = 2114;
      v15 = bundleIdentifier;
      _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding layout observer for %{public}@", buf, 0x16u);
    }

  }
  return v6;
}

- (HDWatchAppStateMonitorDelegate)delegate
{
  return (HDWatchAppStateMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)dealloc
{
  NSObject *v3;
  NSString *bundleIdentifier;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  HDWatchAppStateMonitor *v8;
  __int16 v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    *(_DWORD *)buf = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = bundleIdentifier;
    _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Removing layout observer for %{public}@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0D230D0], "sharedMonitorForDisplayType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)HDWatchAppStateMonitor;
  -[HDWatchAppStateMonitor dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)appIsActive
{
  return self->_appIsActive;
}

- (HDWatchAppStateMonitor)initWithFirstPartyWorkoutApp
{
  return -[HDWatchAppStateMonitor initWithBundleIdentifier:](self, "initWithBundleIdentifier:", CFSTR("com.apple.SessionTrackerApp"));
}

+ (void)launchWorkoutAppIfNeededWithFitnessMachineSessionUUID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v10 = objc_alloc_init(v3);
  v5 = (void *)MEMORY[0x1E0C99E98];
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@://%@/%@"), CFSTR("SessionTrackerApp"), CFSTR("startFitnessMachineSession"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D22D78]);

  objc_msgSend(MEMORY[0x1E0D23170], "hd_openApplication:optionsDictionary:completion:", CFSTR("com.apple.SessionTrackerApp"), v10, &__block_literal_global_121);
}

void __80__HDWatchAppStateMonitor_launchWorkoutAppIfNeededWithFitnessMachineSessionUUID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  v5 = *MEMORY[0x1E0CB5380];
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "Attempt to open workouts failed with error: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v6) = 0;
    _os_log_debug_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEBUG, "Workouts successfully opened", (uint8_t *)&v6, 2u);
  }

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  os_log_t *v13;
  void *v14;
  NSString *bundleIdentifier;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSString *v20;
  void *v21;
  NSObject *v22;
  NSString *v23;
  int v24;
  HDWatchAppStateMonitor *v25;
  __int16 v26;
  NSString *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "elements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v6, "elements");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", self->_bundleIdentifier);

  }
  else
  {
    v11 = 0;
  }

  v12 = objc_msgSend(v6, "displayBacklightLevel");
  _HKInitializeLogging();
  v13 = (os_log_t *)MEMORY[0x1E0CB5380];
  v14 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v16 = v14;
    HKStringFromBool();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HKStringFromBool();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138544130;
    v25 = self;
    v26 = 2114;
    v27 = bundleIdentifier;
    v28 = 2114;
    v29 = v17;
    v30 = 2114;
    v31 = v18;
    _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_INFO, "%{public}@: didUpdateDisplayLayout for %{public}@, running: %{public}@, screenOn: %{public}@", (uint8_t *)&v24, 0x2Au);

    if ((v11 & 1) == 0)
      goto LABEL_6;
  }
  else if (!v11)
  {
LABEL_6:
    if (-[HDWatchAppStateMonitor appIsActive](self, "appIsActive"))
    {
      _HKInitializeLogging();
      v19 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
      {
        v20 = self->_bundleIdentifier;
        v24 = 138543618;
        v25 = self;
        v26 = 2114;
        v27 = v20;
        _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Detected app (%{public}@) deactivated", (uint8_t *)&v24, 0x16u);
      }
      self->_appIsActive = 0;
      -[HDWatchAppStateMonitor delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "monitorDidDetectAppDeactivate:", self);
LABEL_17:

      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (v12 >= 1)
  {
    if (!self->_appIsActive)
    {
      _HKInitializeLogging();
      v22 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
      {
        v23 = self->_bundleIdentifier;
        v24 = 138543618;
        v25 = self;
        v26 = 2114;
        v27 = v23;
        _os_log_impl(&dword_1B7802000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Detected app (%{public}@) onscreen", (uint8_t *)&v24, 0x16u);
      }
      self->_appIsActive = 1;
    }
    -[HDWatchAppStateMonitor delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "monitorDidDetectAppActivate:", self);
    goto LABEL_17;
  }
LABEL_18:

}

@end

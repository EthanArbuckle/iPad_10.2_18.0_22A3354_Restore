@implementation AMSBiometricsMigrator

+ (void)migrateBiometricStateWithOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  int v31;
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  AMSSetLogKeyIfNeeded();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "scenario") != 4)
  {
    +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_opt_class();
      v17 = (void *)MEMORY[0x1E0CB37E8];
      v18 = v16;
      objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v3, "scenario"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543874;
      v32 = v16;
      v33 = 2114;
      v34 = v4;
      v35 = 2114;
      v36 = v19;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping biometric state migration for no upgrade scenario: %{public}@", (uint8_t *)&v31, 0x20u);

    }
    goto LABEL_25;
  }
  CFPreferencesAppSynchronize(CFSTR("com.apple.AppleMediaServices"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.itunesstored"));
  v5 = (void *)CFPreferencesCopyAppValue(CFSTR("AMSDeviceBiometricsState"), CFSTR("com.apple.AppleMediaServices"));
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v31 = 138543618;
      v32 = (id)objc_opt_class();
      v33 = 2114;
      v34 = v4;
      v22 = v32;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping biometric state migration for NULL AMS biometric state", (uint8_t *)&v31, 0x16u);

    }
    v6 = v5;
    goto LABEL_26;
  }
  v6 = (void *)CFPreferencesCopyAppValue(CFSTR("BiometricState"), CFSTR("com.apple.itunesstored"));

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v15, "OSLogObject");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v31 = 138543618;
      v32 = (id)objc_opt_class();
      v33 = 2114;
      v34 = v4;
      v24 = v32;
      _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping biometric state migration for NULL iTunes biometric state", (uint8_t *)&v31, 0x16u);

    }
LABEL_25:

    goto LABEL_26;
  }
  v7 = objc_msgSend(v6, "integerValue");
  +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v12 = v10;
    objc_msgSend(v11, "numberWithInteger:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138543874;
    v32 = v10;
    v33 = 2114;
    v34 = v4;
    v35 = 2114;
    v36 = v13;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Migrating legacy StoreServices biometric state %{public}@ to AMS", (uint8_t *)&v31, 0x20u);

  }
  if (v7 == 1)
  {
    v14 = 2;
  }
  else
  {
    if (v7 != 2)
      goto LABEL_26;
    v14 = 1;
  }
  +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v25, "OSLogObject");
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = (void *)objc_opt_class();
    v28 = (void *)MEMORY[0x1E0CB37E8];
    v29 = v27;
    objc_msgSend(v28, "numberWithInteger:", v14);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138543874;
    v32 = v27;
    v33 = 2114;
    v34 = v4;
    v35 = 2114;
    v36 = v30;
    _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Writing new AMS biometric state: %{public}@", (uint8_t *)&v31, 0x20u);

  }
  CFPreferencesSetAppValue(CFSTR("AMSDeviceBiometricsState"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14), CFSTR("com.apple.AppleMediaServices"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.AppleMediaServices"));
LABEL_26:

}

@end

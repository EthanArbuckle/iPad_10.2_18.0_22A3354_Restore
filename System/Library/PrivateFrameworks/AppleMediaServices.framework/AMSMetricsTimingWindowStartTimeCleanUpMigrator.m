@implementation AMSMetricsTimingWindowStartTimeCleanUpMigrator

+ (void)cleanUpMetricsTimingWindowStartTimeUserDefaultWithOptions:(id)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "scenario") != 4)
  {
    +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      goto LABEL_21;
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = a1;
    v13 = 2114;
    v14 = v8;
    v15 = 2114;
    v16 = v9;
    v10 = "%{public}@: [%{public}@] %{public}@ skipping. Not valid for erase installs.";
LABEL_20:
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v11, 0x20u);

    goto LABEL_21;
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      goto LABEL_21;
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = a1;
    v13 = 2114;
    v14 = v8;
    v15 = 2114;
    v16 = v9;
    v10 = "%{public}@: [%{public}@] %{public}@ skipping. Per-host Load URL sampling feature is not enabled.";
    goto LABEL_20;
  }
  if (CFPreferencesCopyAppValue(CFSTR("AMSMetricsTimingWindowStartTime"), CFSTR("com.apple.AppleMediaServices")))
  {
    CFPreferencesSetAppValue(CFSTR("AMSMetricsTimingWindowStartTime"), 0, CFSTR("com.apple.AppleMediaServices"));
    +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      AMSLogKey();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = a1;
      v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Deleted value for key AMSMetricsTimingWindowStartTime from user defaults.", (uint8_t *)&v11, 0x16u);

    }
    goto LABEL_21;
  }
  +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = a1;
    v13 = 2114;
    v14 = v8;
    v15 = 2114;
    v16 = v9;
    v10 = "%{public}@: [%{public}@] %{public}@ skipping. User default to be removed is not present.";
    goto LABEL_20;
  }
LABEL_21:

}

@end

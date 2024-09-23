@implementation AMSDataMigrator

+ (void)performMigrationWithOptions:(id)a3
{
  id v3;
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = AMSSetLogKey(0);
  v5 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSDefaults lastMigratedBuildVersion](AMSDefaults, "lastMigratedBuildVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentBuildVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v7);

  +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9)
  {
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "currentBuildVersion");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v30 = v13;
      v31 = 2114;
      v32 = v14;
      v33 = 2114;
      v34 = (uint64_t)v15;
      v35 = 2114;
      v36 = v7;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Data migration has already occured for this build version. currentBuiltVersion = %{public}@ | lastMigratedBuildVersion = %{public}@", buf, 0x2Au);

      v5 = 0x1E0C99000;
    }

  }
  else
  {
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_opt_class();
      AMSLogKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v3, "scenario");
      objc_msgSend(v3, "previousBuildVersion");
      v20 = v6;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "currentBuildVersion");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v30 = v17;
      v5 = 0x1E0C99000uLL;
      v31 = 2114;
      v32 = v18;
      v33 = 2048;
      v34 = v19;
      v35 = 2114;
      v36 = v21;
      v37 = 2114;
      v38 = v22;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting AppleMediaServices data migration. scenario = %lu | previousVersion = %{public}@ | currentVersion = %{public}@", buf, 0x34u);

      v6 = v20;
    }

    +[AMSBiometricsMigrator migrateBiometricStateWithOptions:](AMSBiometricsMigrator, "migrateBiometricStateWithOptions:", v3);
    +[AMSCommerceMigrator migrateCommerceAccountsWithOptions:](AMSCommerceMigrator, "migrateCommerceAccountsWithOptions:", v3);
    +[AMSDeviceOfferMigrator migrateDeviceOffersWithOptions:](AMSDeviceOfferMigrator, "migrateDeviceOffersWithOptions:", v3);
    +[AMSPrivacyAcknowledgementMigrator migratePrivacyAcknowledgementsWithOptions:](AMSPrivacyAcknowledgementMigrator, "migratePrivacyAcknowledgementsWithOptions:", v3);
    +[AMSSandboxAccountMigrator migrateSandboxAccountsWithOptions:](AMSSandboxAccountMigrator, "migrateSandboxAccountsWithOptions:", v3);
    +[AMSServerDataCacheMigrator migrateDataCacheWithOptions:](AMSServerDataCacheMigrator, "migrateDataCacheWithOptions:", v3);
    +[AMSStorageDataMigrator migrateStorageToDefaultsForNonAMSInternal:](AMSStorageDataMigrator, "migrateStorageToDefaultsForNonAMSInternal:", v3);
    +[AMSDefaultsMigratedToStorageCleanUpMigrator cleanUpUserDefaultsStorageWithOptions:](AMSDefaultsMigratedToStorageCleanUpMigrator, "cleanUpUserDefaultsStorageWithOptions:", v3);
    +[AMSMetricsTimingWindowStartTimeCleanUpMigrator cleanUpMetricsTimingWindowStartTimeUserDefaultWithOptions:](AMSMetricsTimingWindowStartTimeCleanUpMigrator, "cleanUpMetricsTimingWindowStartTimeUserDefaultWithOptions:", v3);
    +[AMSDefaults setLogHARData:](AMSDefaults, "setLogHARData:", 0);
    objc_msgSend(v3, "currentBuildVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSDefaults setLastMigratedBuildVersion:](AMSDefaults, "setLastMigratedBuildVersion:", v11);
  }

  CFPreferencesSetAppValue(CFSTR("AMSNewFeaturesEnabled"), 0, CFSTR("com.apple.AppleMediaServices"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.AppleMediaServices"));
  +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v23, "OSLogObject");
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = objc_opt_class();
    AMSLogKey();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v5 + 3432), "date");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "timeIntervalSinceDate:", v6);
    *(_DWORD *)buf = 138543874;
    v30 = v25;
    v31 = 2114;
    v32 = v26;
    v33 = 2048;
    v34 = v28;
    _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Finished AppleMediaServices data migration. executionTime = %f", buf, 0x20u);

  }
}

@end

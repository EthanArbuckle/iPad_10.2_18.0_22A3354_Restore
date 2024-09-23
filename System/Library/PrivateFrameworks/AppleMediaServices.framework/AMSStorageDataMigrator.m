@implementation AMSStorageDataMigrator

+ (void)migrateStorageToDefaultsForNonAMSInternal:(id)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  AMSStorageDatabase *v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (+[AMSDefaults migratedStorageToDefaultsForNonAMSInternal](AMSDefaults, "migratedStorageToDefaultsForNonAMSInternal", a3))
  {
    +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = objc_opt_class();
      AMSLogKey();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v11 = v6;
      v12 = 2114;
      v13 = v7;
      v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] %{public}@ skipping. We already migrated.", buf, 0x20u);

    }
  }
  else
  {
    v9 = -[AMSStorageDatabase initWithDomain:]([AMSStorageDatabase alloc], "initWithDomain:", CFSTR("com.apple.AppleMediaServices"));
    objc_msgSend((id)objc_opt_class(), "_migrateDeviceOfferEligibilityWithDatabase:", v9);
    objc_msgSend((id)objc_opt_class(), "_migrateSharedStoreReviewWithDatabase:", v9);
    +[AMSDefaults setMigratedStorageToDefaultsForNonAMSInternal:](AMSDefaults, "setMigratedStorageToDefaultsForNonAMSInternal:", 1);

  }
}

+ (void)_migrateDeviceOfferEligibilityWithDatabase:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = a3;
  +[AMSStorage deviceOfferEligibility](AMSStorage, "deviceOfferEligibility");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
    +[AMSDefaults setDeviceOfferEligibility:](AMSDefaults, "setDeviceOfferEligibility:", v4);
  v14 = 0;
  objc_msgSend(v3, "valueForKey:error:", CFSTR("deviceGroups"), &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  if (!v8 && objc_msgSend(v7, "count"))
    +[AMSDefaults setDeviceGroups:](AMSDefaults, "setDeviceGroups:", v7);
  v13 = v8;
  objc_msgSend(v3, "valueForKey:error:", CFSTR("deviceRegistrationBlacklist"), &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;

  if (!v10 && v9)
  {
    v11 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    +[AMSDefaults setDeviceRegistrationDenyList:](AMSDefaults, "setDeviceRegistrationDenyList:", v12);
  }

}

+ (void)_migrateSharedStoreReviewWithDatabase:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  uint8_t v30[128];
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v4, "allKeysForDomain:withError:", v5, &v29);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v29;

  if (v7)
  {
    +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = objc_opt_class();
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v10;
      v33 = 2114;
      v34 = v11;
      v35 = 2114;
      v36 = v12;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] %{public}@ skipping. No keys to migrate.", buf, 0x20u);

    }
  }
  else
  {
    objc_msgSend(v6, "ams_filterUsingTest:", &__block_literal_global_119);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v13 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v13)
    {
      v14 = v13;
      v23 = v6;
      v15 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v8);
          v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v24 = 0;
          objc_msgSend(v4, "valueForKey:error:", v17, &v24);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v24;
          if (v19)
            v20 = 1;
          else
            v20 = v18 == 0;
          if (!v20)
          {
            objc_msgSend(v17, "componentsSeparatedByString:", CFSTR("-"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "lastObject");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            +[AMSDefaults setSharedStoreReviewMetrics:forProcess:](AMSDefaults, "setSharedStoreReviewMetrics:forProcess:", v18, v22);
            objc_msgSend(v4, "deleteForKey:error:", v17, 0);

          }
        }
        v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v14);
      v7 = 0;
      v6 = v23;
    }
  }

}

uint64_t __64__AMSStorageDataMigrator__migrateSharedStoreReviewWithDatabase___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsString:", CFSTR("AMSSharedStoreReviewMetrics"));
}

@end

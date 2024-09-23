@implementation AMSServerDataCacheMigrator

+ (void)migrateDataCacheWithOptions:(id)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  AMSServerDataCacheService *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[6];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "scenario") == 4)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ams_activeiTunesAccount");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject ams_DSID](v6, "ams_DSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = objc_alloc_init(AMSServerDataCacheService);
      -[AMSServerDataCacheService setUpCacheForAccountDSID:](v8, "setUpCacheForAccountDSID:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __58__AMSServerDataCacheMigrator_migrateDataCacheWithOptions___block_invoke;
      v15[3] = &__block_descriptor_48_e20_v20__0B8__NSError_12l;
      v15[4] = a1;
      v15[5] = a2;
      objc_msgSend(v9, "addFinishBlock:", v15);

      objc_msgSend(a1, "_primeCachedServerDataCacheUsingAccount:", v6);
LABEL_14:

      goto LABEL_15;
    }
    +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      v18 = 2114;
      v19 = v14;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] skipping. No active itunes account with dsid to use for update.", buf, 0x16u);

    }
LABEL_13:

    goto LABEL_14;
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
    v10 = objc_opt_class();
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v17 = v10;
    v18 = 2114;
    v19 = v7;
    v20 = 2114;
    v21 = v11;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] %{public}@ skipping. Not valid for erase installs.", buf, 0x20u);
    goto LABEL_13;
  }
LABEL_15:

}

void __58__AMSServerDataCacheMigrator_migrateDataCacheWithOptions___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  _BYTE v17[22];
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = objc_opt_class();
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    *(_DWORD *)v17 = 138544386;
    v12 = CFSTR("false");
    *(_QWORD *)&v17[4] = v8;
    *(_WORD *)&v17[12] = 2114;
    if (a2)
      v12 = CFSTR("true");
    *(_QWORD *)&v17[14] = v9;
    v18 = 2114;
    v19 = v10;
    v20 = 2112;
    v21 = v12;
    v22 = 2114;
    v23 = v5;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] %{public}@ data cache set up complete. Success: %@ Error: %{public}@", v17, 0x34u);

  }
  if (v5 && (objc_msgSend(v5, "code") == 107 || objc_msgSend(v5, "code") == 2))
  {
    +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig", *(_OWORD *)v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = objc_opt_class();
      AMSLogKey();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v17 = 138543618;
      *(_QWORD *)&v17[4] = v15;
      *(_WORD *)&v17[12] = 2114;
      *(_QWORD *)&v17[14] = v16;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Unrepairable error during cache set up", v17, 0x16u);

    }
  }
  else
  {
    +[AMSDefaults setDidSetUpServerDataCache:](AMSDefaults, "setDidSetUpServerDataCache:", 1, *(_QWORD *)v17, *(_QWORD *)&v17[8]);
  }

}

+ (void)_primeCachedServerDataCacheUsingAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v4 = a3;
  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.amsaccountsd"));

  if ((v7 & 1) == 0)
  {
    +[AMSAccountCachedServerData sharedInstance](AMSAccountCachedServerData, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ams_accountID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringForKey:accountID:updateBlock:", 0, v9, &__block_literal_global_115);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __70__AMSServerDataCacheMigrator__primeCachedServerDataCacheUsingAccount___block_invoke_2;
    v11[3] = &__block_descriptor_40_e52_v24__0___AMSAccountCachedServerString__8__NSError_16l;
    v11[4] = a1;
    objc_msgSend(v10, "addFinishBlock:", v11);

  }
}

void __70__AMSServerDataCacheMigrator__primeCachedServerDataCacheUsingAccount___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[AMSLogConfig sharedAccountsAuthenticationPluginConfig](AMSLogConfig, "sharedAccountsAuthenticationPluginConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v5;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Priming account data cache due to migration.", (uint8_t *)&v10, 0x16u);

  }
  +[AMSAccountCachedServerData sharedInstance](AMSAccountCachedServerData, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "token");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (id)objc_msgSend(v7, "cancelUpdatesForToken:", v8);
}

@end

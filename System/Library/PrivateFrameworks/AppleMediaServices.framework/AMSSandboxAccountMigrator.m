@implementation AMSSandboxAccountMigrator

+ (void)migrateSandboxAccountsWithOptions:(id)a3
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  _UNKNOWN **v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  _UNKNOWN **v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  CFPreferencesAppSynchronize(CFSTR("com.apple.AppleMediaServices"));
  if (!CFPreferencesGetAppBooleanValue(CFSTR("AMSMigratedSandboxAccounts"), CFSTR("com.apple.AppleMediaServices"), 0))
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStoreForMediaType:", AMSAccountMediaTypeAppStoreSandbox);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v3, "ams_iTunesAccounts");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    if (v4)
    {
      v6 = v4;
      v7 = *(_QWORD *)v25;
      v8 = &off_1E2519000;
      *(_QWORD *)&v5 = 138543874;
      v21 = v5;
      v9 = MEMORY[0x1E0C9AAB0];
      v22 = v3;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v25 != v7)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
          objc_msgSend(v8[274], "sharedAccountsDaemonConfig", v21);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v12)
          {
            objc_msgSend(v8[274], "sharedConfig");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v12, "OSLogObject");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = v6;
            v15 = v8;
            v16 = v7;
            v17 = objc_opt_class();
            AMSLogKey();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            AMSHashIfNeeded(v11);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v21;
            v29 = v17;
            v7 = v16;
            v8 = v15;
            v6 = v14;
            v9 = MEMORY[0x1E0C9AAB0];
            v30 = 2114;
            v31 = v18;
            v32 = 2114;
            v33 = v19;
            _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Forcing an account sync. account = %{public}@", buf, 0x20u);

            v3 = v22;
          }

          objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("sync"));
          objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("sync"));
          v20 = (id)objc_msgSend(v3, "ams_saveAccount:", v11);
          ++v10;
        }
        while (v6 != v10);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
      }
      while (v6);
    }

    CFPreferencesSetAppValue(CFSTR("AMSMigratedSandboxAccounts"), (CFPropertyListRef)*MEMORY[0x1E0C9AE50], CFSTR("com.apple.AppleMediaServices"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.AppleMediaServices"));

  }
}

@end

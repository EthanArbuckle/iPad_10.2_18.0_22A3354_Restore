@implementation AMSDefaultsMigratedToStorageCleanUpMigrator

+ (void)cleanUpUserDefaultsStorageWithOptions:(id)a3
{
  id v4;
  AMSStorageDatabase *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  _UNKNOWN **v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  BOOL v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  id v48;
  AMSStorageDatabase *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  const __CFString *v63;
  __int16 v64;
  id v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "scenario") == 4)
  {
    if (+[AMSDefaults cleanedUpUserDefaultsDataAfterMigrationToStorage](AMSDefaults, "cleanedUpUserDefaultsDataAfterMigrationToStorage"))
    {
      +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig");
      v5 = (AMSStorageDatabase *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v5 = (AMSStorageDatabase *)objc_claimAutoreleasedReturnValue();
      }
      -[AMSStorageDatabase OSLogObject](v5, "OSLogObject");
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        goto LABEL_13;
      v7 = objc_opt_class();
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v59 = v7;
      v60 = 2114;
      v61 = v8;
      v62 = 2114;
      v63 = v9;
      v10 = "%{public}@: [%{public}@] %{public}@ skipping. This migration has already been performed.";
      goto LABEL_11;
    }
    if (!+[AMSStorageDatabase isFeatureSupported](AMSStorageDatabase, "isFeatureSupported"))
    {
      +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig");
      v5 = (AMSStorageDatabase *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v5 = (AMSStorageDatabase *)objc_claimAutoreleasedReturnValue();
      }
      -[AMSStorageDatabase OSLogObject](v5, "OSLogObject");
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v47 = objc_opt_class();
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v59 = v47;
      v60 = 2114;
      v61 = v8;
      v62 = 2114;
      v63 = v9;
      v10 = "%{public}@: [%{public}@] %{public}@ skipping. AMSStorage database feature is not enabled.";
      v12 = v6;
      v13 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_12;
    }
    v5 = -[AMSStorageDatabase initWithDomain:]([AMSStorageDatabase alloc], "initWithDomain:", CFSTR("com.apple.AppleMediaServices"));
    v14 = &off_1E2519000;
    +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v48 = v4;
    objc_msgSend(v15, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = objc_opt_class();
      AMSLogKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v59 = v17;
      v60 = 2114;
      v61 = v18;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Deleting any leftover values from user defaults.", buf, 0x16u);

    }
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v51 = objc_msgSend(&unk_1E25B0128, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
    if (!v51)
    {
LABEL_55:
      +[AMSDefaults setCleanedUpUserDefaultsDataAfterMigrationToStorage:](AMSDefaults, "setCleanedUpUserDefaultsDataAfterMigrationToStorage:", 1);
      v4 = v48;
      goto LABEL_14;
    }
    v50 = *(_QWORD *)v55;
    v49 = v5;
LABEL_22:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v55 != v50)
        objc_enumerationMutation(&unk_1E25B0128);
      v20 = *(const __CFString **)(*((_QWORD *)&v54 + 1) + 8 * v19);
      v21 = (void *)MEMORY[0x18D78A1C4]();
      v22 = (void *)CFPreferencesCopyAppValue(v20, CFSTR("com.apple.AppleMediaServices"));
      if (!v22)
        goto LABEL_53;
      objc_msgSend(v14[274], "sharedDataMigrationConfig");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
        objc_msgSend(v14[274], "sharedConfig");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v23, "OSLogObject");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = objc_opt_class();
        AMSLogKey();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v59 = v25;
        v60 = 2114;
        v61 = v26;
        v62 = 2112;
        v63 = v20;
        _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Found value for key %@.", buf, 0x20u);

      }
      v53 = 0;
      -[AMSStorageDatabase valueForKey:error:](v5, "valueForKey:error:", v20, &v53);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v53;
      v29 = v28;
      if (!v27)
        break;
LABEL_48:
      CFPreferencesSetAppValue(v20, 0, CFSTR("com.apple.AppleMediaServices"));
      objc_msgSend(v14[274], "sharedDataMigrationConfig");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v43)
      {
        objc_msgSend(v14[274], "sharedConfig");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v43, "OSLogObject");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = objc_opt_class();
        AMSLogKey();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v59 = v45;
        v5 = v49;
        v60 = 2114;
        v61 = v46;
        v62 = 2112;
        v63 = v20;
        _os_log_impl(&dword_18C849000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Deleted value for key %@ from user defaults.", buf, 0x20u);

        v14 = &off_1E2519000;
      }

LABEL_53:
      objc_autoreleasePoolPop(v21);
      if (v51 == ++v19)
      {
        v51 = objc_msgSend(&unk_1E25B0128, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
        if (!v51)
          goto LABEL_55;
        goto LABEL_22;
      }
    }
    v30 = objc_msgSend(v28, "ams_hasDomain:code:", CFSTR("AMSErrorDomain"), 7);
    objc_msgSend(v14[274], "sharedDataMigrationConfig");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v31;
    if (v30)
    {
      if (!v31)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v32, "OSLogObject");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = objc_opt_class();
        AMSLogKey();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v59 = v34;
        v60 = 2114;
        v61 = v35;
        v62 = 2112;
        v63 = v20;
        _os_log_impl(&dword_18C849000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Value for key %@ not present in the AMSStorage database, saving to AMSStorage database prior to deleting from defaults.", buf, 0x20u);

        v5 = v49;
      }

      v52 = v29;
      v36 = -[AMSStorageDatabase setValue:forKey:error:](v5, "setValue:forKey:error:", v22, v20, &v52);
      v37 = v52;

      if (v36)
        goto LABEL_47;
      +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v32)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v32, "OSLogObject");
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = objc_opt_class();
        AMSLogKey();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v59 = v39;
        v5 = v49;
        v60 = 2114;
        v61 = v40;
        v62 = 2112;
        v63 = v20;
        v64 = 2114;
        v65 = v37;
        _os_log_impl(&dword_18C849000, v38, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to set value for key %@ in AMSStorage database, error = %{public}@. Proceeding to delete value from defaults regardless.", buf, 0x2Au);

      }
    }
    else
    {
      if (!v31)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v32, "OSLogObject");
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v41 = objc_opt_class();
        AMSLogKey();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v59 = v41;
        v60 = 2114;
        v61 = v42;
        v62 = 2112;
        v63 = v20;
        v64 = 2114;
        v65 = v29;
        _os_log_impl(&dword_18C849000, v38, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to verify presence of value for key %@ in AMSStorage database, error = %{public}@. Proceeding to delete value from defaults regardless.", buf, 0x2Au);

        v5 = v49;
      }
      v37 = v29;
    }

LABEL_47:
    v29 = v37;
    v14 = &off_1E2519000;
    goto LABEL_48;
  }
  +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig");
  v5 = (AMSStorageDatabase *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (AMSStorageDatabase *)objc_claimAutoreleasedReturnValue();
  }
  -[AMSStorageDatabase OSLogObject](v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    goto LABEL_13;
  v11 = objc_opt_class();
  AMSLogKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543874;
  v59 = v11;
  v60 = 2114;
  v61 = v8;
  v62 = 2114;
  v63 = v9;
  v10 = "%{public}@: [%{public}@] %{public}@ skipping. Not valid for erase installs.";
LABEL_11:
  v12 = v6;
  v13 = OS_LOG_TYPE_INFO;
LABEL_12:
  _os_log_impl(&dword_18C849000, v12, v13, v10, buf, 0x20u);

LABEL_13:
LABEL_14:

}

@end

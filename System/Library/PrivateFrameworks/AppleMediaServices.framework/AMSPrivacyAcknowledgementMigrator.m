@implementation AMSPrivacyAcknowledgementMigrator

+ (void)migratePrivacyAcknowledgementsWithOptions:(id)a3
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  AMSAcknowledgePrivacyTask *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  AMSAcknowledgePrivacyTask *v26;
  void *v27;
  AMSAcknowledgePrivacyTask *v28;
  void *v29;
  AMSAcknowledgePrivacyTask *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  AMSAcknowledgePrivacyTask *v35;
  void *v36;
  _QWORD v37[4];
  NSObject *v38;
  id v39;
  SEL v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  AMSAcknowledgePrivacyTask *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "scenario") == 4)
  {
    if (!+[AMSDefaults migratedPrivacyAcknowledgements](AMSDefaults, "migratedPrivacyAcknowledgements"))
    {
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ams_activeiCloudAccount");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v6 = objc_claimAutoreleasedReturnValue();
        +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig");
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
          v16 = (AMSAcknowledgePrivacyTask *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v42 = v15;
          v43 = 2114;
          v44 = v16;
          v45 = 2114;
          v46 = v17;
          _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] %{public}@ started.", buf, 0x20u);

        }
        v8 = objc_alloc_init(MEMORY[0x1E0C99D78]);
        -[NSObject setYear:](v8, "setYear:", 2019);
        -[NSObject setMonth:](v8, "setMonth:", 9);
        -[NSObject setDay:](v8, "setDay:", 19);
        objc_msgSend(v5, "creationDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject date](v8, "date");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "compare:", v19);

        if (v20 == -1)
        {
          +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig");
          v30 = (AMSAcknowledgePrivacyTask *)objc_claimAutoreleasedReturnValue();
          if (!v30)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v30 = (AMSAcknowledgePrivacyTask *)objc_claimAutoreleasedReturnValue();
          }
          -[AMSAcknowledgePrivacyTask OSLogObject](v30, "OSLogObject");
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v34 = objc_opt_class();
            AMSLogKey();
            v35 = (AMSAcknowledgePrivacyTask *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v42 = v34;
            v43 = 2114;
            v44 = v35;
            v45 = 2114;
            v46 = v36;
            _os_log_impl(&dword_18C849000, v31, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] %{public}@ skipping. iCloud account was signed in before Apple ID grey text was updated.", buf, 0x20u);

          }
        }
        else
        {
          getOBPrivacyAppleIDIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = +[AMSAcknowledgePrivacyTask acknowledgementNeededForPrivacyIdentifier:](AMSAcknowledgePrivacyTask, "acknowledgementNeededForPrivacyIdentifier:", v21);

          if (!v22)
            goto LABEL_34;
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
            v26 = (AMSAcknowledgePrivacyTask *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v42 = v25;
            v43 = 2114;
            v44 = v26;
            v45 = 2114;
            v46 = v27;
            _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] %{public}@ Recording GDPR acknowledgement for Apple ID based on historical data.", buf, 0x20u);

          }
          v28 = [AMSAcknowledgePrivacyTask alloc];
          getOBPrivacyAppleIDIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = -[AMSAcknowledgePrivacyTask initWithPrivacyIdentifier:](v28, "initWithPrivacyIdentifier:", v29);

          -[AMSAcknowledgePrivacyTask acknowledgePrivacy](v30, "acknowledgePrivacy");
          v31 = objc_claimAutoreleasedReturnValue();
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __79__AMSPrivacyAcknowledgementMigrator_migratePrivacyAcknowledgementsWithOptions___block_invoke;
          v37[3] = &unk_1E2544968;
          v39 = a1;
          v40 = a2;
          v38 = v6;
          -[NSObject addFinishBlock:](v31, "addFinishBlock:", v37);

        }
      }
      else
      {
        +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig");
        v6 = objc_claimAutoreleasedReturnValue();
        if (!v6)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v6 = objc_claimAutoreleasedReturnValue();
        }
        -[NSObject OSLogObject](v6, "OSLogObject");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          goto LABEL_34;
        v32 = objc_opt_class();
        AMSLogKey();
        v30 = (AMSAcknowledgePrivacyTask *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v42 = v32;
        v43 = 2114;
        v44 = v30;
        v45 = 2114;
        v46 = v33;
        _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] %{public}@ skipping. No iCloud account is signed in during upgrade.", buf, 0x20u);

      }
      goto LABEL_34;
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
      v7 = objc_opt_class();
      AMSLogKey();
      v8 = objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v42 = v7;
      v43 = 2114;
      v44 = (AMSAcknowledgePrivacyTask *)v8;
      v45 = 2114;
      v46 = v9;
      v10 = "%{public}@: [%{public}@] %{public}@ skipping. We already migrated.";
LABEL_11:
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_INFO, v10, buf, 0x20u);

LABEL_34:
    }
  }
  else
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
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v11 = objc_opt_class();
      AMSLogKey();
      v8 = objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v42 = v11;
      v43 = 2114;
      v44 = (AMSAcknowledgePrivacyTask *)v8;
      v45 = 2114;
      v46 = v9;
      v10 = "%{public}@: [%{public}@] %{public}@ skipping. Not valid for erase installs.";
      goto LABEL_11;
    }
  }

}

void __79__AMSPrivacyAcknowledgementMigrator_migratePrivacyAcknowledgementsWithOptions___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
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
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_opt_class();
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138544130;
      v19 = v7;
      v20 = 2114;
      v21 = v8;
      v22 = 2114;
      v23 = v9;
      v24 = 2114;
      v25 = v10;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %{public}@ Failed to recording Apple ID GDPR acknowledgement. error = %{public}@", (uint8_t *)&v18, 0x2Au);

    }
  }
  +[AMSDefaults setMigratedPrivacyAcknowledgements:](AMSDefaults, "setMigratedPrivacyAcknowledgements:", 1);
  +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
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
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    v18 = 138544130;
    v19 = v13;
    v20 = 2114;
    v21 = v14;
    v22 = 2114;
    v23 = v15;
    v24 = 2048;
    v25 = v17;
    _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] %{public}@ finished. executionTime = %f", (uint8_t *)&v18, 0x2Au);

  }
}

@end

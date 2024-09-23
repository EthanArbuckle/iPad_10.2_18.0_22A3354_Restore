@implementation AMSDeviceOfferMigrator

+ (void)migrateDeviceOffersWithOptions:(id)a3
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  AMSDeviceOfferRegistrationTask *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  SEL v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "scenario") == 4)
  {
    if (+[AMSDefaults migratedDeviceOffers](AMSDefaults, "migratedDeviceOffers"))
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
        v7 = objc_opt_class();
        AMSLogKey();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v32 = v7;
        v33 = 2114;
        v34 = v8;
        v35 = 2114;
        v36 = v9;
        v10 = "%{public}@: [%{public}@] %{public}@ skipping. We already migrated.";
LABEL_11:
        _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_INFO, v10, buf, 0x20u);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ams_activeiTunesAccount");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v14, "OSLogObject");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = objc_opt_class();
          AMSLogKey();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v32 = v16;
          v33 = 2114;
          v34 = v17;
          v35 = 2114;
          v36 = v18;
          _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] %{public}@ started.", buf, 0x20u);

        }
        +[AMSDeviceOfferRegistrationTask bagSubProfile](AMSDeviceOfferRegistrationTask, "bagSubProfile");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSDeviceOfferRegistrationTask bagSubProfileVersion](AMSDeviceOfferRegistrationTask, "bagSubProfileVersion");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v19, v20);
        v6 = objc_claimAutoreleasedReturnValue();

        v21 = -[AMSDeviceOfferRegistrationTask initWithAccount:bag:]([AMSDeviceOfferRegistrationTask alloc], "initWithAccount:bag:", v5, v6);
        -[AMSDeviceOfferRegistrationTask setLightweightCheckOnly:](v21, "setLightweightCheckOnly:", 1);
        -[AMSDeviceOfferRegistrationTask perform](v21, "perform");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __57__AMSDeviceOfferMigrator_migrateDeviceOffersWithOptions___block_invoke;
        v27[3] = &unk_1E25410A8;
        v29 = a1;
        v30 = a2;
        v28 = v13;
        v23 = v13;
        objc_msgSend(v22, "addFinishBlock:", v27);

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
        v21 = (AMSDeviceOfferRegistrationTask *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v21->super.super, OS_LOG_TYPE_INFO))
        {
          v24 = objc_opt_class();
          AMSLogKey();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v32 = v24;
          v33 = 2114;
          v34 = v25;
          v35 = 2114;
          v36 = v26;
          _os_log_impl(&dword_18C849000, &v21->super.super, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] %{public}@ skipping. No account is signed in during upgrade.", buf, 0x20u);

        }
      }

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
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v11;
      v33 = 2114;
      v34 = v8;
      v35 = 2114;
      v36 = v9;
      v10 = "%{public}@: [%{public}@] %{public}@ skipping. Not valid for erase installs.";
      goto LABEL_11;
    }
  }

}

void __57__AMSDeviceOfferMigrator_migrateDeviceOffersWithOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_opt_class();
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138544130;
      v20 = v9;
      v21 = 2114;
      v22 = v10;
      v23 = 2114;
      v24 = v11;
      v25 = 2114;
      v26 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %{public}@ Error running the device offer registration. error = %{public}@.", (uint8_t *)&v19, 0x2Au);

    }
  }
  +[AMSDefaults setMigratedDeviceOffers:](AMSDefaults, "setMigratedDeviceOffers:", 1);
  +[AMSLogConfig sharedDataMigrationConfig](AMSLogConfig, "sharedDataMigrationConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "OSLogObject");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_opt_class();
    AMSLogKey();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    v19 = 138544130;
    v20 = v14;
    v21 = 2114;
    v22 = v15;
    v23 = 2114;
    v24 = v16;
    v25 = 2048;
    v26 = v18;
    _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] %{public}@ finished. executionTime = %f", (uint8_t *)&v19, 0x2Au);

  }
}

@end

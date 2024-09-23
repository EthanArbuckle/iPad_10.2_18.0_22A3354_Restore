@implementation AMSMetricsIdentifierStoreConsumerID

+ (void)_setConsumerIdentifier:(id)a3 forKey:(id)a4 inNamespace:(id)a5 accountID:(id)a6 bag:(id)a7 at:(id)a8 serverProvidedAt:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  NSObject *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v31 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  objc_msgSend(a6, "altDSID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetricsIdentifierStoreConsumerID _accountForAltDSID:](AMSMetricsIdentifierStoreConsumerID, "_accountForAltDSID:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = v16;
    +[AMSMetricsIdentifierStore identifierStoreWithAccount:bagNamespace:bag:](AMSMetricsIdentifierStore, "identifierStoreWithAccount:bagNamespace:bag:", v21, v16, v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __115__AMSMetricsIdentifierStoreConsumerID__setConsumerIdentifier_forKey_inNamespace_accountID_bag_at_serverProvidedAt___block_invoke;
    v35[3] = &unk_1E2543D40;
    v41 = a1;
    v36 = v15;
    v37 = v18;
    v25 = v31;
    v38 = v31;
    v39 = v21;
    v40 = v19;
    objc_msgSend(v23, "addSuccessBlock:", v35);
    v32[0] = v24;
    v32[1] = 3221225472;
    v32[2] = __115__AMSMetricsIdentifierStoreConsumerID__setConsumerIdentifier_forKey_inNamespace_accountID_bag_at_serverProvidedAt___block_invoke_2;
    v32[3] = &unk_1E2543D68;
    v34 = a1;
    v33 = v22;
    objc_msgSend(v23, "addErrorBlock:", v32);

    v26 = v36;
    v27 = v22;
  }
  else
  {
    v30 = v16;
    v25 = v31;
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v23, "OSLogObject");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v28 = objc_opt_class();
      AMSLogKey();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v43 = v28;
      v44 = 2114;
      v45 = v29;
      v46 = 2114;
      v27 = v30;
      v47 = v30;
      _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Metrics Identifier Store not updated for namespace \"%{public}@\" because we can't find the account", buf, 0x20u);

    }
    else
    {
      v27 = v30;
    }
  }

}

void __115__AMSMetricsIdentifierStoreConsumerID__setConsumerIdentifier_forKey_inNamespace_accountID_bag_at_serverProvidedAt___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;

  v3 = (void *)a1[9];
  v4 = a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v7 = a2;
  +[AMSMetricsIdentifierStore _database](AMSMetricsIdentifierStore, "_database");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v8 = a1[7];
  objc_msgSend(v7, "clientInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetInterval");
  v12 = v11;

  objc_msgSend(v3, "_setIdentifier:withStartedDate:forKey:database:account:clientInfo:domain:resetInterval:serverProvidedAt:", v4, v5, v6, v13, v8, v9, v12, v10, a1[8]);
}

void __115__AMSMetricsIdentifierStoreConsumerID__setConsumerIdentifier_forKey_inNamespace_accountID_bag_at_serverProvidedAt___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    AMSLogableError(v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138544130;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v8;
    v16 = 2114;
    v17 = v9;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Metrics Identifier Store not found for namespace \"%{public}@\"; error: %{public}@",
      (uint8_t *)&v10,
      0x2Au);

  }
}

+ (void)_removeStoreForNamespace:(id)a3 accountID:(id)a4 bag:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  NSObject *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(a4, "altDSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetricsIdentifierStoreConsumerID _accountForAltDSID:](AMSMetricsIdentifierStoreConsumerID, "_accountForAltDSID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    +[AMSMetricsIdentifierStore identifierStoreWithAccount:bagNamespace:bag:](AMSMetricsIdentifierStore, "identifierStoreWithAccount:bagNamespace:bag:", v11, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __78__AMSMetricsIdentifierStoreConsumerID__removeStoreForNamespace_accountID_bag___block_invoke;
    v20[3] = &unk_1E2543D90;
    v21 = v11;
    objc_msgSend(v12, "addSuccessBlock:", v20);
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __78__AMSMetricsIdentifierStoreConsumerID__removeStoreForNamespace_accountID_bag___block_invoke_2;
    v17[3] = &unk_1E2543D68;
    v19 = a1;
    v18 = v8;
    objc_msgSend(v12, "addErrorBlock:", v17);

    v14 = v21;
  }
  else
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_opt_class();
      AMSLogKey();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v15;
      v24 = 2114;
      v25 = v16;
      v26 = 2114;
      v27 = v8;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Metrics Identifier Store not updated for namespace \"%{public}@\" because we can't find the account", buf, 0x20u);

    }
  }

}

void __78__AMSMetricsIdentifierStoreConsumerID__removeStoreForNamespace_accountID_bag___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[AMSMetricsIdentifierStore _generateStoreKeyForAccount:domain:clientInfo:](AMSMetricsIdentifierStore, "_generateStoreKeyForAccount:domain:clientInfo:", v2, v4, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  +[AMSMetricsIdentifierStore removeIdentifiersForStore:](AMSMetricsIdentifierStore, "removeIdentifiersForStore:", v6);
}

void __78__AMSMetricsIdentifierStoreConsumerID__removeStoreForNamespace_accountID_bag___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    AMSLogableError(v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138544130;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v8;
    v16 = 2114;
    v17 = v9;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Metrics Identifier Store not found for namespace \"%{public}@\"; error: %{public}@",
      (uint8_t *)&v10,
      0x2Au);

  }
}

+ (id)_applyExpiryForKey:(id)a3 inNamespace:(id)a4 accountID:(id)a5 bag:(id)a6 at:(id)a7 consumerIDResetInterval:(double)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  double v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  objc_msgSend(v16, "altDSID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetricsIdentifierStoreConsumerID _accountForAltDSID:](AMSMetricsIdentifierStoreConsumerID, "_accountForAltDSID:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    +[AMSMetricsIdentifierStore identifierStoreWithAccount:bagNamespace:bag:](AMSMetricsIdentifierStore, "identifierStoreWithAccount:bagNamespace:bag:", v20, v15, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __111__AMSMetricsIdentifierStoreConsumerID__applyExpiryForKey_inNamespace_accountID_bag_at_consumerIDResetInterval___block_invoke;
    v35[3] = &unk_1E2543DB8;
    v40 = a1;
    v36 = v15;
    v37 = v18;
    v38 = v14;
    v39 = v20;
    v41 = a8;
    v22 = (id)objc_msgSend(v21, "continueWithBlock:", v35);

    v23 = v36;
  }
  else
  {
    v34 = v14;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Metrics Identifier Store not updated for namespace \"%@\"), v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No Account found for %@"), v16);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    AMSError(107, v23, v33, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v25, "OSLogObject");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = objc_opt_class();
      AMSLogKey();
      v31 = v18;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v24);
      v32 = v17;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v43 = v27;
      v44 = 2114;
      v45 = v28;
      v46 = 2114;
      v47 = v29;
      _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error: %{public}@", buf, 0x20u);

      v17 = v32;
      v18 = v31;
    }

    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v34;
  }

  return v21;
}

id __111__AMSMetricsIdentifierStoreConsumerID__applyExpiryForKey_inNamespace_accountID_bag_at_consumerIDResetInterval___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = a1[4];
      AMSLogableError(v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v9;
      v24 = 2114;
      v25 = v10;
      v26 = 2114;
      v27 = v11;
      v28 = 2114;
      v29 = v12;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Metrics Identifier Store not found for namespace \"%{public}@\"; error: %{public}@",
        buf,
        0x2Au);

    }
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (void *)a1[8];
    v15 = a1[5];
    v16 = a1[6];
    +[AMSMetricsIdentifierStore _database](AMSMetricsIdentifierStore, "_database");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = a1[7];
    objc_msgSend(v5, "clientInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domain");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resetInterval");
    objc_msgSend(v14, "_promiseOfSunsetIdentifier:withStartedDate:lastSyncDate:forKey:database:account:clientInfo:domain:resetInterval:consumerIDResetInterval:", &stru_1E2548760, v15, 0, v16, v17, v18, v19, v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

+ (id)_accountForAltDSID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ams_iTunesAccountWithAltDSID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v4, "ams_activeiCloudAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ams_altDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", v3);

    if (v10)
    {
      objc_msgSend(v4, "ams_iTunesAccountForAccount:", v8);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (v11)
        v13 = (void *)v11;
      else
        v13 = v8;
      v7 = v13;

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

+ (id)_promiseOfSunsetIdentifier:(id)a3 withStartedDate:(id)a4 lastSyncDate:(id)a5 forKey:(id)a6 database:(id)a7 account:(id)a8 clientInfo:(id)a9 domain:(id)a10 resetInterval:(double)a11 consumerIDResetInterval:(double)a12
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v35;
  id v36;
  uint64_t block;
  uint64_t v38;
  void (*v39)(uint64_t);
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t *v48;
  id v49;
  double v50;
  double v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;

  v36 = a3;
  v20 = a4;
  v35 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  +[AMSMetricsIdentifierStore _sharedQueue](AMSMetricsIdentifierStore, "_sharedQueue");
  v26 = objc_claimAutoreleasedReturnValue();
  block = MEMORY[0x1E0C809B0];
  v38 = 3221225472;
  v39 = __175__AMSMetricsIdentifierStoreConsumerID__promiseOfSunsetIdentifier_withStartedDate_lastSyncDate_forKey_database_account_clientInfo_domain_resetInterval_consumerIDResetInterval___block_invoke;
  v40 = &unk_1E2543DE0;
  v27 = v23;
  v41 = v27;
  v49 = a1;
  v28 = v21;
  v42 = v28;
  v29 = v22;
  v43 = v29;
  v30 = v20;
  v44 = v30;
  v48 = &v52;
  v31 = v24;
  v45 = v31;
  v32 = v25;
  v50 = a11;
  v51 = a12;
  v46 = v32;
  v47 = 0;
  dispatch_sync(v26, &block);

  if (*((_BYTE *)v53 + 24))
    v33 = +[AMSMetricsIdentifierStore _sync](AMSMetricsIdentifierStore, "_sync", v35, v36, block, v38, v39, v40, v41, v42, v43, v44, v45);

  _Block_object_dispose(&v52, 8);
  return 0;
}

void __175__AMSMetricsIdentifierStoreConsumerID__promiseOfSunsetIdentifier_withStartedDate_lastSyncDate_forKey_database_account_clientInfo_domain_resetInterval_consumerIDResetInterval___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  _QWORD v69[3];

  v69[1] = *MEMORY[0x1E0C80C00];
  +[AMSMetricsIdentifierStore _accountIdentifierForAccount:](AMSMetricsIdentifierStore, "_accountIdentifierForAccount:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 96);
  v69[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 72);
  v11 = *(double *)(a1 + 104);
  v53 = 0;
  objc_msgSend(v3, "_identifierStoreInfoForKeys:inDatabase:date:started:updateStarted:needsToSync:account:clientInfo:domain:resetInterval:error:", v4, v5, v6, 0, 0, v7, v11, v8, v9, v10, &v53);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v53;

  if (v13 || !v12)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = objc_opt_class();
      AMSLogKey();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "bundleIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = *(_QWORD *)(a1 + 72);
      AMSLogableError(v13);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v56 = v27;
      v57 = 2114;
      v58 = v28;
      v59 = 2112;
      v60 = v2;
      v61 = 2114;
      v62 = v29;
      v63 = 2114;
      v64 = v30;
      v65 = 2114;
      v66 = v31;
      _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch/insert identifier store (dsid: %@, client: %{public}@, domain: %{public}@) %{public}@", buf, 0x3Eu);

    }
LABEL_16:

    goto LABEL_17;
  }
  v14 = *(_QWORD *)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 48);
  v16 = *(void **)(a1 + 96);
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24;
  v18 = *(double *)(a1 + 104);
  v19 = *(double *)(a1 + 112);
  v52 = 0;
  objc_msgSend(v16, "_sunsetIdentifierInfoForKey:storeInfo:inDatabase:needsToSync:resetInterval:consumerIDResetInterval:error:", v14, v12, v15, v17, &v52, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v52;
  if (!v21)
  {
    if (v20)
    {
      objc_msgSend(v20, "expires");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v32)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Metrics Identifier Store failed to expire Consumer ID"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No error from the store"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        AMSError(0, v44, v45, 0);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 80), "finishWithError:", v46);

        v13 = 0;
        goto LABEL_17;
      }
    }
    objc_msgSend(v20, "expires");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "dateByAddingTimeInterval:", -*(double *)(a1 + 104));
    v26 = objc_claimAutoreleasedReturnValue();

    v34 = *(void **)(a1 + 96);
    v54 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = *(_QWORD *)(a1 + 48);
    v37 = *(_QWORD *)(a1 + 56);
    v38 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24;
    v39 = *(_QWORD *)(a1 + 32);
    v40 = *(_QWORD *)(a1 + 64);
    v41 = *(_QWORD *)(a1 + 72);
    v42 = *(double *)(a1 + 104);
    v51 = 0;
    objc_msgSend(v34, "_identifierStoreInfoForKeys:inDatabase:date:started:updateStarted:needsToSync:account:clientInfo:domain:resetInterval:error:", v35, v36, v37, v26, 1, v38, v42, v39, v40, v41, &v51);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v51;

    objc_msgSend(*(id *)(a1 + 80), "finishWithResult:", v20);
    goto LABEL_16;
  }
  v13 = v21;
  +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v22, "OSLogObject");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v49 = objc_opt_class();
    AMSLogKey();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "bundleIdentifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = *(_QWORD *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 40), "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v13);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v56 = v49;
    v57 = 2114;
    v58 = v50;
    v59 = 2112;
    v60 = v2;
    v61 = 2114;
    v62 = v47;
    v63 = 2114;
    v64 = v48;
    v65 = 2114;
    v66 = v24;
    v67 = 2114;
    v68 = v25;
    _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to sunset identifier (dsid: %@, client: %{public}@, domain: %{public}@, key: %{public}@) %{public}@", buf, 0x48u);

  }
  objc_msgSend(*(id *)(a1 + 80), "finishWithError:", v13);
LABEL_17:

}

+ (id)_sunsetIdentifierInfoForKey:(id)a3 storeInfo:(id)a4 inDatabase:(id)a5 needsToSync:(BOOL *)a6 resetInterval:(double)a7 consumerIDResetInterval:(double)a8 error:(id *)a9
{
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[6];

  v15 = a5;
  +[AMSMetricsIdentifierStore _generateIdentifierKey:storeInfo:period:resetInterval:](AMSMetricsIdentifierStore, "_generateIdentifierKey:storeInfo:period:resetInterval:", a3, a4, 0, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __144__AMSMetricsIdentifierStoreConsumerID__sunsetIdentifierInfoForKey_storeInfo_inDatabase_needsToSync_resetInterval_consumerIDResetInterval_error___block_invoke;
  v19[3] = &__block_descriptor_48_e9_B16__0__8l;
  *(double *)&v19[4] = a8;
  v19[5] = a6;
  objc_msgSend(v15, "identifierForKey:updateMaybe:error:", v16, v19, a9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

BOOL __144__AMSMetricsIdentifierStoreConsumerID__sunsetIdentifierInfoForKey_storeInfo_inDatabase_needsToSync_resetInterval_consumerIDResetInterval_error___block_invoke(uint64_t a1, id *a2)
{
  id v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *a2;
  v4 = +[AMSMetricsIdentifierCore _shouldUpdateDatabaseFor:consumerIDResetInterval:](AMSMetricsIdentifierCore, "_shouldUpdateDatabaseFor:consumerIDResetInterval:", v3, *(double *)(a1 + 32));
  if (v4)
  {
    objc_msgSend(v3, "serverProvidedAt");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateByAddingTimeInterval:", *(double *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setExpires:", v6);

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setModified:", v7);

    **(_BYTE **)(a1 + 40) |= objc_msgSend(v3, "crossDeviceSync");
  }

  return v4;
}

+ (void)_setIdentifier:(id)a3 withStartedDate:(id)a4 forKey:(id)a5 database:(id)a6 account:(id)a7 clientInfo:(id)a8 domain:(id)a9 resetInterval:(double)a10 serverProvidedAt:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD block[4];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t *v45;
  id v46;
  double v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;

  v35 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a11;
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  +[AMSMetricsIdentifierStore _sharedQueue](AMSMetricsIdentifierStore, "_sharedQueue");
  v25 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __143__AMSMetricsIdentifierStoreConsumerID__setIdentifier_withStartedDate_forKey_database_account_clientInfo_domain_resetInterval_serverProvidedAt___block_invoke;
  block[3] = &unk_1E2543E28;
  v26 = v21;
  v37 = v26;
  v46 = a1;
  v27 = v19;
  v38 = v27;
  v28 = v20;
  v39 = v28;
  v29 = v18;
  v40 = v29;
  v45 = &v48;
  v30 = v22;
  v41 = v30;
  v31 = v23;
  v42 = v31;
  v47 = a10;
  v32 = v35;
  v43 = v32;
  v33 = v24;
  v44 = v33;
  dispatch_sync(v25, block);

  if (*((_BYTE *)v49 + 24))
    v34 = +[AMSMetricsIdentifierStore _sync](AMSMetricsIdentifierStore, "_sync");

  _Block_object_dispose(&v48, 8);
}

void __143__AMSMetricsIdentifierStoreConsumerID__setIdentifier_withStartedDate_forKey_database_account_clientInfo_domain_resetInterval_serverProvidedAt___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  NSObject *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  +[AMSMetricsIdentifierStore _accountIdentifierForAccount:](AMSMetricsIdentifierStore, "_accountIdentifierForAccount:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 104);
  v50[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 72);
  v11 = *(double *)(a1 + 112);
  v35 = 0;
  objc_msgSend(v3, "_identifierStoreInfoForKeys:inDatabase:date:started:updateStarted:needsToSync:account:clientInfo:domain:resetInterval:error:", v4, v5, v6, 0, 0, v7, v11, v8, v9, v10, &v35);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v35;

  if (v13 || !v12)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v21, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v23 = objc_opt_class();
    AMSLogKey();
    v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "bundleIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *(_QWORD *)(a1 + 72);
    AMSLogableError(v13);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v37 = v23;
    v38 = 2114;
    v39 = v24;
    v40 = 2112;
    v41 = v2;
    v42 = 2114;
    v43 = v25;
    v44 = 2114;
    v45 = v26;
    v46 = 2114;
    v47 = v27;
    _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch/insert identifier store (dsid: %@, client: %{public}@, domain: %{public}@) %{public}@", buf, 0x3Eu);

LABEL_14:
LABEL_15:

    goto LABEL_16;
  }
  v14 = *(_QWORD *)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 48);
  v16 = *(void **)(a1 + 104);
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24;
  v18 = *(_QWORD *)(a1 + 80);
  v19 = *(_QWORD *)(a1 + 88);
  v20 = *(double *)(a1 + 112);
  v34 = 0;
  objc_msgSend(v16, "_identifierInfoForKey:storeInfo:inDatabase:setValue:needsToSync:serverProvidedAt:resetInterval:error:", v14, v12, v15, v18, v17, v19, v20, &v34);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v34;
  if (v13 || !v21)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v22 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v22, "OSLogObject");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v33 = objc_opt_class();
      AMSLogKey();
      v28 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "bundleIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = *(_QWORD *)(a1 + 72);
      objc_msgSend(*(id *)(a1 + 40), "name");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v13);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      v37 = v33;
      v38 = 2114;
      v39 = v28;
      v40 = 2112;
      v41 = v2;
      v42 = 2114;
      v43 = v29;
      v44 = 2114;
      v45 = v32;
      v46 = 2114;
      v47 = v30;
      v48 = 2114;
      v49 = v31;
      _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch/insert identifier (dsid: %@, client: %{public}@, domain: %{public}@, key: %{public}@) %{public}@", buf, 0x48u);

    }
    goto LABEL_14;
  }
  v13 = 0;
LABEL_16:

}

+ (id)_identifierInfoForKey:(id)a3 storeInfo:(id)a4 inDatabase:(id)a5 setValue:(id)a6 needsToSync:(BOOL *)a7 serverProvidedAt:(id)a8 resetInterval:(double)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  BOOL *v35;

  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a8;
  v20 = a5;
  +[AMSMetricsIdentifierStore _generateIdentifierKey:storeInfo:period:resetInterval:](AMSMetricsIdentifierStore, "_generateIdentifierKey:storeInfo:period:resetInterval:", v16, v17, 0, a9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __140__AMSMetricsIdentifierStoreConsumerID__identifierInfoForKey_storeInfo_inDatabase_setValue_needsToSync_serverProvidedAt_resetInterval_error___block_invoke;
  v29[3] = &unk_1E2543E50;
  v30 = v16;
  v31 = v21;
  v32 = v17;
  v33 = v18;
  v34 = v19;
  v35 = a7;
  v22 = v19;
  v23 = v18;
  v24 = v17;
  v25 = v21;
  v26 = v16;
  objc_msgSend(v20, "identifierForKey:updateMaybe:error:", v25, v29, a10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

uint64_t __140__AMSMetricsIdentifierStoreConsumerID__identifierInfoForKey_storeInfo_inDatabase_setValue_needsToSync_serverProvidedAt_resetInterval_error___block_invoke(uint64_t a1, id *a2)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;

  v4 = *a2;
  v5 = v4;
  if (!v4 || objc_msgSend(v4, "deleted"))
  {
    v6 = (void *)objc_opt_new();

    objc_msgSend(v6, "setCrossDeviceSync:", objc_msgSend(*(id *)(a1 + 32), "crossDeviceSync"));
    objc_msgSend(v6, "setIdKey:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "storeUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStoreUUID:", v7);

    objc_msgSend(*(id *)(a1 + 32), "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setName:", v8);

    objc_msgSend(v6, "setValue:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v6, "setServerProvidedAt:", *(_QWORD *)(a1 + 64));
    objc_msgSend(v6, "setExpires:", 0);
    v5 = objc_retainAutorelease(v6);
    *a2 = v5;
    v9 = *(void **)(a1 + 56);
    if (!v9)
      goto LABEL_10;
    v10 = 1;
LABEL_6:
    objc_msgSend(v5, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "isEqualToString:", v12);

    if ((v13 & 1) != 0)
    {
      if (!v10)
      {
        v11 = 0;
        goto LABEL_11;
      }
    }
    else
    {
      objc_msgSend(v5, "setValue:", *(_QWORD *)(a1 + 56));
      objc_msgSend(v5, "setServerProvidedAt:", *(_QWORD *)(a1 + 64));
      objc_msgSend(v5, "setExpires:", 0);
    }
LABEL_10:
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setModified:", v14);

    **(_BYTE **)(a1 + 72) |= objc_msgSend(v5, "crossDeviceSync");
    v11 = 1;
    goto LABEL_11;
  }
  v10 = 0;
  v11 = 0;
  v9 = *(void **)(a1 + 56);
  if (v9)
    goto LABEL_6;
LABEL_11:

  return v11;
}

+ (id)_identifierStoreInfoForKeys:(id)a3 inDatabase:(id)a4 date:(id)a5 started:(id)a6 updateStarted:(BOOL)a7 needsToSync:(BOOL *)a8 account:(id)a9 clientInfo:(id)a10 domain:(id)a11 resetInterval:(double)a12 error:(id *)a13
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  double v46;
  BOOL *v47;
  BOOL v48;
  BOOL v49;

  v17 = a5;
  v18 = a6;
  v19 = a10;
  v20 = a11;
  v21 = a9;
  v22 = a4;
  v23 = a3;
  +[AMSMetricsIdentifierStore _accountIdentifierForAccount:](AMSMetricsIdentifierStore, "_accountIdentifierForAccount:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetricsIdentifierStore _generateStoreKeyForAccount:domain:clientInfo:](AMSMetricsIdentifierStore, "_generateStoreKeyForAccount:domain:clientInfo:", v21, v20, v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "ac_firstObjectPassingTest:", &__block_literal_global_92);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __163__AMSMetricsIdentifierStoreConsumerID__identifierStoreInfoForKeys_inDatabase_date_started_updateStarted_needsToSync_account_clientInfo_domain_resetInterval_error___block_invoke_2;
  v38[3] = &unk_1E2543E78;
  v39 = v24;
  v40 = v25;
  v48 = v26 != 0;
  v44 = v17;
  v45 = a1;
  v41 = v18;
  v42 = v19;
  v46 = a12;
  v49 = a7;
  v43 = v20;
  v47 = a8;
  v27 = v17;
  v28 = v20;
  v29 = v19;
  v30 = v18;
  v31 = v25;
  v32 = v24;
  objc_msgSend(v22, "identifierStoreForKey:updateMaybe:error:", v31, v38, a13);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

uint64_t __163__AMSMetricsIdentifierStoreConsumerID__identifierStoreInfoForKeys_inDatabase_date_started_updateStarted_needsToSync_account_clientInfo_domain_resetInterval_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "crossDeviceSync");
}

uint64_t __163__AMSMetricsIdentifierStoreConsumerID__identifierStoreInfoForKeys_inDatabase_date_started_updateStarted_needsToSync_account_clientInfo_domain_resetInterval_error___block_invoke_2(uint64_t a1, id *a2)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  double v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  int v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  _BYTE v44[28];
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = *a2;
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "deleted"))
  {
    v9 = 0;
  }
  else
  {
    v6 = (void *)objc_opt_new();

    objc_msgSend(v6, "setAccount:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v6, "setStoreKey:", *(_QWORD *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStoreUUID:", v8);

    objc_msgSend(v6, "setStarted:", *(_QWORD *)(a1 + 48));
    v5 = objc_retainAutorelease(v6);
    *a2 = v5;
    v9 = 1;
  }
  v10 = objc_msgSend(v5, "crossDeviceSync");
  v11 = *(unsigned __int8 *)(a1 + 104);
  if (v11 != v10)
  {
    objc_msgSend(v5, "setCrossDeviceSync:", v11 != 0);
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = objc_opt_class();
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(unsigned __int8 *)(a1 + 104);
      objc_msgSend(*(id *)(a1 + 56), "bundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 64);
      v39 = 138544386;
      v40 = v14;
      v41 = 2114;
      v42 = v15;
      v43 = 1026;
      *(_DWORD *)v44 = v16;
      *(_WORD *)&v44[4] = 2114;
      *(_QWORD *)&v44[6] = v17;
      *(_WORD *)&v44[14] = 2114;
      *(_QWORD *)&v44[16] = v18;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Updating identifier store cross device sync (sync: %{public}d, client: %{public}@, domain: %{public}@)", (uint8_t *)&v39, 0x30u);

    }
    v9 = 1;
  }
  objc_msgSend(v5, "resetInterval");
  if (v19 == *(double *)(a1 + 88))
  {
    if (!*(_BYTE *)(a1 + 105))
    {
      if ((v9 & 1) != 0)
        goto LABEL_26;
LABEL_29:
      v37 = 0;
      goto LABEL_27;
    }
  }
  else
  {
    objc_msgSend(v5, "setResetInterval:");
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = objc_opt_class();
      AMSLogKey();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(a1 + 88);
      objc_msgSend(*(id *)(a1 + 56), "bundleIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(a1 + 64);
      v39 = 138544386;
      v40 = v22;
      v41 = 2114;
      v42 = v23;
      v43 = 2050;
      *(_QWORD *)v44 = v24;
      *(_WORD *)&v44[8] = 2114;
      *(_QWORD *)&v44[10] = v25;
      *(_WORD *)&v44[18] = 2114;
      *(_QWORD *)&v44[20] = v26;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Updating identifier store reset interval (interval: %{public}f, client: %{public}@, domain: %{public}@)", (uint8_t *)&v39, 0x34u);

    }
    if (!*(_BYTE *)(a1 + 105))
      goto LABEL_26;
    v9 = 1;
  }
  objc_msgSend(v5, "started");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = *(void **)(a1 + 48);

  if (v27 != v28)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v29, "OSLogObject");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = objc_opt_class();
      AMSLogKey();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "started");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "bundleIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = *(_QWORD *)(a1 + 64);
      v39 = 138544642;
      v40 = v31;
      v41 = 2114;
      v42 = v32;
      v43 = 2114;
      *(_QWORD *)v44 = v33;
      *(_WORD *)&v44[8] = 2114;
      *(_QWORD *)&v44[10] = v34;
      *(_WORD *)&v44[18] = 2114;
      *(_QWORD *)&v44[20] = v35;
      v45 = 2114;
      v46 = v36;
      _os_log_impl(&dword_18C849000, v30, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Updating identifier store started timestamp: %{public}@ to timestamp: %{public}@ (client: %{public}@, domain: %{public}@)", (uint8_t *)&v39, 0x3Eu);

    }
    objc_msgSend(v5, "setStarted:", *(_QWORD *)(a1 + 48));
    goto LABEL_26;
  }
  if (!v9)
    goto LABEL_29;
LABEL_26:
  objc_msgSend(v5, "setModified:", *(_QWORD *)(a1 + 72));
  **(_BYTE **)(a1 + 96) |= objc_msgSend(v5, "crossDeviceSync");
  v37 = 1;
LABEL_27:

  return v37;
}

@end

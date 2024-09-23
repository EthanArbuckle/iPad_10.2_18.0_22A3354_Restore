@implementation AMSUIUpdateMultiUserTokenTask

- (AMSUIUpdateMultiUserTokenTask)initWithAccount:(id)a3 homeIdentifier:(id)a4 viewController:(id)a5
{
  id v9;
  id v10;
  id v11;
  AMSUIUpdateMultiUserTokenTask *v12;
  AMSUIUpdateMultiUserTokenTask *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSUIUpdateMultiUserTokenTask;
  v12 = -[AMSTask init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a3);
    objc_storeStrong((id *)&v13->_homeIdentifier, a4);
    objc_storeStrong((id *)&v13->_viewController, a5);
  }

  return v13;
}

- (id)performTask
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __44__AMSUIUpdateMultiUserTokenTask_performTask__block_invoke;
  v3[3] = &unk_24CB4F9B8;
  v3[4] = self;
  -[AMSTask performTaskWithBlock:](self, "performTaskWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __44__AMSUIUpdateMultiUserTokenTask_performTask__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  id v29;
  AMSUIAuthKitUpdateTask *v30;
  void *v31;
  void *v32;
  AMSUIAuthKitUpdateTask *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  void *v53;
  AMSUIAuthKitUpdateTask *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  AMSUIAuthKitUpdateTask *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  uint8_t buf[4];
  uint64_t v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsMultiUserConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "homeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v68 = v6;
    v69 = 2114;
    v70 = v7;
    v71 = 2114;
    v72 = v9;
    v73 = 2114;
    v74 = v11;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating a Multi-User token. account = %{public}@ | homeIdentifier = %{public}@", buf, 0x2Au);

  }
  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "homeIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ams_setiTunesAccount:forHomeWithIdentifier:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0;
  v16 = objc_msgSend(v15, "resultWithError:", &v66);
  v17 = v66;

  if (v16)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsMultiUserConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_opt_class();
      AMSLogKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v68 = v20;
      v69 = 2114;
      v70 = v21;
      _os_log_impl(&dword_211102000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully updated the account's Multi-User token.", buf, 0x16u);

    }
    v22 = MEMORY[0x24BDBD1C8];
    goto LABEL_46;
  }
  v23 = objc_msgSend((id)objc_opt_class(), "_errorIsRecoverable:", v17);
  objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsMultiUserConfig");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if ((v23 & 1) != 0)
  {
    if (!v24)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v25, "OSLogObject");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_opt_class();
      AMSLogKey();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v68 = v27;
      v69 = 2114;
      v70 = v28;
      _os_log_impl(&dword_211102000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] We must authenticate the iCloud account in order to generate a new Multi-User token.", buf, 0x16u);

    }
    v29 = objc_alloc_init(MEMORY[0x24BE08020]);
    objc_msgSend(v29, "setCanMakeAccountActive:", 0);
    objc_msgSend(v29, "setDebugReason:", CFSTR("Updating a Multi-User Token"));
    v30 = [AMSUIAuthKitUpdateTask alloc];
    objc_msgSend(v12, "ams_activeiCloudAccount");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "viewController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[AMSUIAuthKitUpdateTask initWithAccount:presentingViewController:options:](v30, "initWithAccount:presentingViewController:options:", v31, v32, v29);

    -[AMSAuthKitUpdateTask performAuthKitUpdate](v33, "performAuthKitUpdate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = 0;
    objc_msgSend(v34, "resultWithError:", &v65);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v65;

    if (v35)
    {
      v62 = v33;
      v63 = v35;
      objc_msgSend(*(id *)(a1 + 32), "account");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "homeIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ams_setiTunesAccount:forHomeWithIdentifier:", v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v36;
      v40 = objc_msgSend(v39, "resultWithError:", &v64);
      v17 = v64;

      objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsMultiUserConfig");
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = (void *)v41;
      if ((v40 & 1) != 0)
      {
        if (!v41)
        {
          objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v42, "OSLogObject");
        v43 = objc_claimAutoreleasedReturnValue();
        v35 = v63;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v44 = objc_opt_class();
          AMSLogKey();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v68 = v44;
          v69 = 2114;
          v70 = v45;
          _os_log_impl(&dword_211102000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully updated the account's Multi-User token.", buf, 0x16u);

        }
        v22 = MEMORY[0x24BDBD1C8];
        v33 = v62;
        goto LABEL_45;
      }
      if (!v41)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v42, "OSLogObject");
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        v58 = objc_opt_class();
        AMSLogKey();
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded();
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v68 = v58;
        v69 = 2114;
        v70 = v59;
        v71 = 2114;
        v72 = v60;
        _os_log_impl(&dword_211102000, v57, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to update the account's Multi-User token. error = %{public}@", buf, 0x20u);

      }
      v33 = v62;
      v35 = v63;
      if (!a2)
      {
        v22 = 0;
        goto LABEL_45;
      }
      v56 = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsMultiUserConfig");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v50)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v50, "OSLogObject");
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        v52 = objc_opt_class();
        AMSLogKey();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded();
        v54 = v33;
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v68 = v52;
        v69 = 2114;
        v70 = v53;
        v71 = 2114;
        v72 = v55;
        _os_log_impl(&dword_211102000, v51, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to authenticate the iCloud account. error = %{public}@", buf, 0x20u);

        v33 = v54;
        v35 = 0;

      }
      if (!a2)
      {
        v22 = 0;
        v17 = v36;
        goto LABEL_45;
      }
      v56 = v36;
    }
    v17 = objc_retainAutorelease(v56);
    v22 = 0;
    *a2 = v17;
LABEL_45:

    goto LABEL_46;
  }
  if (!v24)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v25, "OSLogObject");
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    v47 = objc_opt_class();
    AMSLogKey();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v68 = v47;
    v69 = 2114;
    v70 = v48;
    v71 = 2114;
    v72 = v49;
    _os_log_impl(&dword_211102000, v46, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to update the account's Multi-User token. error = %{public}@", buf, 0x20u);

  }
  if (a2)
  {
    v17 = objc_retainAutorelease(v17);
    v22 = 0;
    *a2 = v17;
  }
  else
  {
    v22 = 0;
  }
LABEL_46:

  return v22;
}

+ (BOOL)_errorIsRecoverable:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (objc_msgSend(v3, "ams_hasDomain:code:", *MEMORY[0x24BE07D20], 108)
    && (objc_msgSend(v3, "ams_underlyingErrorWithDomain:code:", *MEMORY[0x24BE0AB28], -7013),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v3, "ams_hasDomain:code:", CFSTR("AMSDCloudDataErrorDomain"), 9);
  }

  return v5;
}

- (ACAccount)account
{
  return self->_account;
}

- (NSUUID)homeIdentifier
{
  return self->_homeIdentifier;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end

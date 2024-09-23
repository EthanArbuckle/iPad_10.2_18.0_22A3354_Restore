@implementation AMSAcknowledgePrivacyTask

+ (BOOL)_coreAcknowledgementNeededForPrivacyIdentifier:(id)a3 account:(id)a4
{
  void *v4;
  uint64_t v5;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  BOOL v41;
  const char *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  NSObject *v70;
  uint32_t v71;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  NSObject *v76;
  __int16 v77;
  void *v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = AMSSetLogKeyIfNeeded();
  +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
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
    AMSLogKey();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = objc_opt_class();
    v15 = v14;
    if (v4)
    {
      AMSLogKey();
      v5 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: [%@] "), v15, v5);
    }
    else
    {
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: "), v14);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v74 = v16;
    v75 = 2114;
    v76 = v8;
    v77 = 2114;
    v78 = v17;
    _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Determining if privacy acknowledgement is needed. privacyIdentifier = %{public}@ | account = %{public}@", buf, 0x20u);
    if (v4)
    {

      v16 = (void *)v5;
    }

  }
  if (+[AMSDefaults acknowledgePrivacyOverride](AMSDefaults, "acknowledgePrivacyOverride") != 1)
  {
    if (+[AMSDefaults acknowledgePrivacyOverride](AMSDefaults, "acknowledgePrivacyOverride") == 2)
    {
      +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
      v18 = objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v18 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v18, "OSLogObject");
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        goto LABEL_48;
      AMSLogKey();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0CB3940];
      v28 = objc_opt_class();
      v29 = v28;
      if (v26)
      {
        AMSLogKey();
        a1 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("%@: [%@] "), v29, a1);
      }
      else
      {
        objc_msgSend(v27, "stringWithFormat:", CFSTR("%@: "), v28);
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v74 = v30;
      v42 = "%{public}@Privacy acknowledgement is not needed because AMSDefaults.acknowledgePrivacyOverride is DISABLED.";
LABEL_45:
      _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_DEFAULT, v42, buf, 0xCu);
      if (v26)
      {

        v30 = a1;
      }

LABEL_48:
      v41 = 0;
      goto LABEL_106;
    }
    if (+[AMSDefaults disablePrivacyAcknowledgement](AMSDefaults, "disablePrivacyAcknowledgement"))
    {
      +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
      v18 = objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v18 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v18, "OSLogObject");
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        goto LABEL_48;
      AMSLogKey();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x1E0CB3940];
      v32 = objc_opt_class();
      v33 = v32;
      if (v26)
      {
        AMSLogKey();
        a1 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringWithFormat:", CFSTR("%@: [%@] "), v33, a1);
      }
      else
      {
        objc_msgSend(v31, "stringWithFormat:", CFSTR("%@: "), v32);
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v74 = v30;
      v42 = "%{public}@Privacy acknowledgement is not needed because AMSDefaults.disablePrivacyAcknowledgement is true.";
      goto LABEL_45;
    }
    if (!v9)
    {
      +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v34)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v34, "OSLogObject");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        AMSLogKey();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)MEMORY[0x1E0CB3940];
        v38 = objc_opt_class();
        v39 = v38;
        if (v36)
        {
          AMSLogKey();
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "stringWithFormat:", CFSTR("%@: [%@] "), v39, v4);
        }
        else
        {
          objc_msgSend(v37, "stringWithFormat:", CFSTR("%@: "), v38);
        }
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v74 = v40;
        _os_log_impl(&dword_18C849000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@No account provided, attempting to use the local account.", buf, 0xCu);
        if (v36)
        {

          v40 = v4;
        }

      }
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "_ams_localiTunesAccount");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v9 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v9, "OSLogObject");
        v18 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          goto LABEL_40;
        AMSLogKey();
        v19 = objc_claimAutoreleasedReturnValue();
        v61 = (void *)MEMORY[0x1E0CB3940];
        v62 = objc_opt_class();
        v63 = v62;
        if (v19)
        {
          AMSLogKey();
          a1 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "stringWithFormat:", CFSTR("%@: [%@] "), v63, a1);
        }
        else
        {
          objc_msgSend(v61, "stringWithFormat:", CFSTR("%@: "), v62);
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v74 = v20;
        _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_ERROR, "%{public}@Privacy acknowledgement is needed because we failed to get an account.", buf, 0xCu);
        if (v19)
        {

          v20 = a1;
        }
        goto LABEL_38;
      }
    }
    objc_msgSend(v9, "ams_privacyAcknowledgement");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKeyedSubscript:", v8);
    v18 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject isEqualToNumber:](v18, "isEqualToNumber:", &unk_1E25AEF48))
    {
      +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v45)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v45, "OSLogObject");
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        AMSLogKey();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (void *)MEMORY[0x1E0CB3940];
        v49 = objc_opt_class();
        v50 = v49;
        if (v47)
        {
          AMSLogKey();
          a1 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "stringWithFormat:", CFSTR("%@: [%@] "), v50, a1);
        }
        else
        {
          objc_msgSend(v48, "stringWithFormat:", CFSTR("%@: "), v49);
        }
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v74 = v51;
        v75 = 2114;
        v76 = v18;
        _os_log_impl(&dword_18C849000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@Privacy bundle was rejected. No need to prompt for acknowledgement. acknowledgedVersion = %{public}@", buf, 0x16u);
        if (v47)
        {

          v51 = a1;
        }

      }
      v41 = 0;
      goto LABEL_105;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "_contentVersionForPrivacyIdentifier:", v8));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v45, "isEqualToNumber:", &unk_1E25AEF60))
    {
      +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
      v46 = objc_claimAutoreleasedReturnValue();
      if (!v46)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v46 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v46, "OSLogObject");
      v52 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        goto LABEL_103;
      AMSLogKey();
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (void *)MEMORY[0x1E0CB3940];
      v55 = objc_opt_class();
      v56 = v55;
      if (v53)
      {
        AMSLogKey();
        a1 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "stringWithFormat:", CFSTR("%@: [%@] "), v56, a1);
      }
      else
      {
        objc_msgSend(v54, "stringWithFormat:", CFSTR("%@: "), v55);
      }
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v74 = v57;
      v75 = 2114;
      v76 = v18;
      v69 = "%{public}@Current version is 0. No need to prompt for acknowledgement. acknowledgedVersion = %{public}@";
      v70 = v52;
      v71 = 22;
    }
    else
    {
      if (!v18 || -[NSObject compare:](v18, "compare:", v45) == -1)
      {
        +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
        v46 = objc_claimAutoreleasedReturnValue();
        if (!v46)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v46 = objc_claimAutoreleasedReturnValue();
        }
        -[NSObject OSLogObject](v46, "OSLogObject");
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          AMSLogKey();
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = (void *)MEMORY[0x1E0CB3940];
          v66 = objc_opt_class();
          v67 = v66;
          if (v64)
          {
            AMSLogKey();
            a1 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "stringWithFormat:", CFSTR("%@: [%@] "), v67, a1);
          }
          else
          {
            objc_msgSend(v65, "stringWithFormat:", CFSTR("%@: "), v66);
          }
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v74 = v68;
          v75 = 2114;
          v76 = v18;
          v77 = 2114;
          v78 = v45;
          _os_log_impl(&dword_18C849000, v52, OS_LOG_TYPE_DEFAULT, "%{public}@Privacy acknowledgement is needed. acknowledgedVersion = %{public}@ | currentVersion = %{public}@", buf, 0x20u);
          if (v64)
          {

            v68 = a1;
          }

        }
        v41 = 1;
        goto LABEL_104;
      }
      +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
      v46 = objc_claimAutoreleasedReturnValue();
      if (!v46)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v46 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v46, "OSLogObject");
      v52 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
LABEL_103:
        v41 = 0;
LABEL_104:

LABEL_105:
        goto LABEL_106;
      }
      AMSLogKey();
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = (void *)MEMORY[0x1E0CB3940];
      v59 = objc_opt_class();
      v60 = v59;
      if (v53)
      {
        AMSLogKey();
        a1 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "stringWithFormat:", CFSTR("%@: [%@] "), v60, a1);
      }
      else
      {
        objc_msgSend(v58, "stringWithFormat:", CFSTR("%@: "), v59);
      }
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v74 = v57;
      v75 = 2114;
      v76 = v18;
      v77 = 2114;
      v78 = v45;
      v69 = "%{public}@Privacy acknowledgement is not needed. acknowledgedVersion = %{public}@ | currentVersion = %{public}@";
      v70 = v52;
      v71 = 32;
    }
    _os_log_impl(&dword_18C849000, v70, OS_LOG_TYPE_DEFAULT, v69, buf, v71);
    if (v53)
    {

      v57 = a1;
    }

    goto LABEL_103;
  }
  +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  -[NSObject OSLogObject](v18, "OSLogObject");
  v19 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    goto LABEL_39;
  AMSLogKey();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0CB3940];
  v22 = objc_opt_class();
  v23 = v22;
  if (v20)
  {
    AMSLogKey();
    a1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: [%@] "), v23, a1);
  }
  else
  {
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: "), v22);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543362;
  v74 = v24;
  _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Privacy acknowledgement is needed because AMSDefaults.acknowledgePrivacyOverride is ALWAYS.", buf, 0xCu);
  if (v20)
  {

    v24 = a1;
  }

LABEL_38:
LABEL_39:

LABEL_40:
  v41 = 1;
LABEL_106:

  return v41;
}

+ (unint64_t)_contentVersionForPrivacyIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  unint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a3;
  objc_msgSend(a1, "_appleBundleHolderPrivacyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {

LABEL_4:
    v8 = 2;
    goto LABEL_10;
  }
  objc_msgSend(a1, "_appleBundleOwnerPrivacyIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v7 & 1) != 0)
    goto LABEL_4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v9 = (void *)_MergedGlobals_3_0;
  v24 = _MergedGlobals_3_0;
  if (!_MergedGlobals_3_0)
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __getOBBundleClass_block_invoke;
    v19 = &unk_1E253DDB8;
    v20 = &v21;
    __getOBBundleClass_block_invoke((uint64_t)&v16);
    v9 = (void *)v22[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v21, 8);
  objc_msgSend(v10, "bundleWithIdentifier:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v12 = (void *)qword_1ECEACC80;
  v24 = qword_1ECEACC80;
  if (!qword_1ECEACC80)
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __getOBPrivacyFlowClass_block_invoke;
    v19 = &unk_1E253DDB8;
    v20 = &v21;
    __getOBPrivacyFlowClass_block_invoke((uint64_t)&v16);
    v12 = (void *)v22[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v21, 8);
  objc_msgSend(v13, "flowWithBundle:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v14, "contentVersion");

LABEL_10:
  return v8;
}

+ (BOOL)acknowledgementNeededForPrivacyIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_accountStoreForPrivacyIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ams_activeiTunesAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "acknowledgementNeededForPrivacyIdentifier:account:", v4, v6);

  return (char)a1;
}

+ (BOOL)acknowledgementNeededForPrivacyIdentifier:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  int v10;
  char v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(a1, "_coreAcknowledgementNeededForPrivacyIdentifier:account:", v7, v6);
  objc_msgSend((id)objc_opt_class(), "_appleBundleHolderPrivacyIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  v11 = v10 | v8;
  if (v10 && (v8 & 1) == 0)
    v11 = objc_msgSend(a1, "_isBundleHolderPerDeviceRequirementAppliedToAccount:", v6);

  return v11;
}

+ (id)_appleBundleHolderPrivacyIdentifier
{
  return CFSTR("com.apple.onboarding.deviceholder");
}

+ (id)_accountStoreForPrivacyIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore", a3);
}

+ (id)_appleBundleOwnerPrivacyIdentifier
{
  return CFSTR("com.apple.onboarding.subscriptionbundle");
}

- (AMSAcknowledgePrivacyTask)initWithPrivacyIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  AMSAcknowledgePrivacyTask *v8;

  v4 = (void *)MEMORY[0x1E0C8F2B8];
  v5 = a3;
  objc_msgSend(v4, "ams_sharedAccountStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_activeiTunesAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AMSAcknowledgePrivacyTask initWithPrivacyIdentifier:account:](self, "initWithPrivacyIdentifier:account:", v5, v7);

  return v8;
}

- (AMSAcknowledgePrivacyTask)initWithPrivacyIdentifiers:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  AMSAcknowledgePrivacyTask *v8;

  v4 = (void *)MEMORY[0x1E0C8F2B8];
  v5 = a3;
  objc_msgSend(v4, "ams_sharedAccountStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_activeiTunesAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AMSAcknowledgePrivacyTask initWithPrivacyIdentifiers:account:](self, "initWithPrivacyIdentifiers:account:", v5, v7);

  return v8;
}

- (AMSAcknowledgePrivacyTask)initWithPrivacyIdentifier:(id)a3 account:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  AMSAcknowledgePrivacyTask *v10;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  v8 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v6, "setWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AMSAcknowledgePrivacyTask initWithPrivacyIdentifiers:account:](self, "initWithPrivacyIdentifiers:account:", v9, v7);

  return v10;
}

- (AMSAcknowledgePrivacyTask)initWithPrivacyIdentifiers:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  AMSAcknowledgePrivacyTask *v8;
  uint64_t v9;
  NSSet *privacyIdentifiers;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSAcknowledgePrivacyTask;
  v8 = -[AMSTask init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    privacyIdentifiers = v8->_privacyIdentifiers;
    v8->_privacyIdentifiers = (NSSet *)v9;

    objc_storeStrong((id *)&v8->_account, a4);
  }

  return v8;
}

- (id)acknowledgePrivacy
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[AMSAcknowledgePrivacyTask privacyIdentifiers](self, "privacyIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        v10 = +[AMSAcknowledgePrivacyTask _contentVersionForPrivacyIdentifier:](AMSAcknowledgePrivacyTask, "_contentVersionForPrivacyIdentifier:", v9);
        if (!v10)
        {
          +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v16, "OSLogObject");
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            AMSLogKey();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)MEMORY[0x1E0CB3940];
            v20 = objc_opt_class();
            v21 = v20;
            if (v18)
            {
              AMSLogKey();
              self = (AMSAcknowledgePrivacyTask *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: [%@] "), v21, self);
            }
            else
            {
              objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: "), v20);
            }
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v31 = v22;
            v32 = 2114;
            v33 = v9;
            _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@The privacy identifier has an invalid content version. Refusing to acknowledge it. privacyIdentifier = %{public}@", buf, 0x16u);
            if (v18)
            {

              v22 = self;
            }

          }
          AMSError(2, CFSTR("AMSAcknowledgePrivacyTask Failed"), CFSTR("The OnBoardingKit content version for the identifier is invalid."), 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v23);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_21;
        }
        +[AMSAcknowledgePrivacyTask _multiplexPrivacyIdentifier:contentVersion:](AMSAcknowledgePrivacyTask, "_multiplexPrivacyIdentifier:contentVersion:", v9, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addEntriesFromDictionary:", v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v6)
        continue;
      break;
    }
  }

  -[AMSAcknowledgePrivacyTask _updatePrivacyWithAcknowledgementVersions:](self, "_updatePrivacyWithAcknowledgementVersions:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSAcknowledgePrivacyTask privacyIdentifiers](self, "privacyIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_appleBundleHolderPrivacyIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "containsObject:", v14);

  if (v15)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __47__AMSAcknowledgePrivacyTask_acknowledgePrivacy__block_invoke;
    v25[3] = &unk_1E253DBD8;
    v25[4] = self;
    objc_msgSend(v12, "addSuccessBlock:", v25);
  }
LABEL_21:

  return v12;
}

void __47__AMSAcknowledgePrivacyTask_acknowledgePrivacy__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
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
    AMSLogKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = objc_opt_class();
    v8 = v7;
    if (v5)
    {
      AMSLogKey();
      v1 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: [%@] "), v8, v1);
    }
    else
    {
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: "), v7);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v9;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating account bundle holder record.@", buf, 0xCu);
    if (v5)
    {

      v9 = (void *)v1;
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v11 = (void *)objc_opt_class();
    objc_msgSend((id)objc_opt_class(), "_appleBundleHolderPrivacyIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_accountStoreForPrivacyIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "_ams_localiTunesAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v10, "ams_setDidAcknowledgeBundleHolderPrivacyAcknowledgementOnDevice:", 1);

}

- (id)rejectPrivacy
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[AMSAcknowledgePrivacyTask privacyIdentifiers](self, "privacyIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (!+[AMSAcknowledgePrivacyTask _contentVersionForPrivacyIdentifier:](AMSAcknowledgePrivacyTask, "_contentVersionForPrivacyIdentifier:", v9))
        {
          +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v12)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v12, "OSLogObject");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            AMSLogKey();
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (void *)MEMORY[0x1E0CB3940];
            v16 = objc_opt_class();
            v17 = v16;
            if (v14)
            {
              AMSLogKey();
              self = (AMSAcknowledgePrivacyTask *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: [%@] "), v17, self);
            }
            else
            {
              objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: "), v16);
            }
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v27 = v18;
            v28 = 2114;
            v29 = v9;
            _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "%{public}@The privacy identifier has an invalid content version. Refusing to reject it. privacyIdentifier = %{public}@", buf, 0x16u);
            if (v14)
            {

              v18 = self;
            }

          }
          AMSError(2, CFSTR("AMSAcknowledgePrivacyTask Failed to reject"), CFSTR("The OnBoardingKit content version for the identifier is invalid."), 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v19);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_20;
        }
        +[AMSAcknowledgePrivacyTask _multiplexPrivacyIdentifier:contentVersion:](AMSAcknowledgePrivacyTask, "_multiplexPrivacyIdentifier:contentVersion:", v9, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addEntriesFromDictionary:", v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v6)
        continue;
      break;
    }
  }

  -[AMSAcknowledgePrivacyTask _updatePrivacyWithAcknowledgementVersions:](self, "_updatePrivacyWithAcknowledgementVersions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __42__AMSAcknowledgePrivacyTask_rejectPrivacy__block_invoke;
  v21[3] = &unk_1E253DD40;
  v21[4] = self;
  objc_msgSend(v4, "thenWithBlock:", v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v11;
}

id __42__AMSAcknowledgePrivacyTask_rejectPrivacy__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "privacyIdentifiers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v6);
        v8 = (void *)objc_opt_class();
        objc_msgSend(*(id *)(a1 + 32), "account");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v7) = objc_msgSend(v8, "hasRejectedPrivacyIdentifier:account:", v7, v9);

        if (!(_DWORD)v7)
        {
          AMSError(0, CFSTR("Failed to Reject Privacy"), CFSTR("An unknown error occurred."), 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          return v12;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v4)
        continue;
      break;
    }
  }

  +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)_isBundleHolderPerDeviceRequirementAppliedToAccount:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (+[AMSDevice deviceIsBundle](AMSDevice, "deviceIsBundle"))
    v4 = objc_msgSend(v3, "ams_isSubjectToPerDeviceBundleHolderAcknowledgement");
  else
    v4 = 0;

  return v4;
}

+ (BOOL)hasRejectedPrivacyIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AMSSetLogKeyIfNeeded();
  +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v8;
    v19 = 2114;
    v20 = v9;
    v21 = 2114;
    v22 = v4;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Determining if user has rejected privacy acknowledgement. privacyIdentifier = %{public}@", (uint8_t *)&v17, 0x20u);

  }
  objc_msgSend(a1, "_accountStoreForPrivacyIdentifier:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_activeiTunesAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(v10, "_ams_localiTunesAccount");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  v15 = objc_msgSend((id)objc_opt_class(), "hasRejectedPrivacyIdentifier:account:", v4, v14);
  return v15;
}

+ (BOOL)hasRejectedPrivacyIdentifier:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  uint64_t v26;
  void *v27;
  int v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  NSObject *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = AMSSetLogKeyIfNeeded();
  +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_opt_class();
    AMSLogKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543874;
    v30 = v11;
    v31 = 2114;
    v32 = v12;
    v33 = 2114;
    v34 = v6;
    _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Determining if user has rejected privacy acknowledgement. privacyIdentifier = %{public}@", (uint8_t *)&v29, 0x20u);

  }
  if (!v7)
  {
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_opt_class();
      AMSLogKey();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543874;
      v30 = v15;
      v31 = 2114;
      v32 = v16;
      v33 = 2114;
      v34 = v6;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No account provided, attempting to use the local account. privacyIdentifier = %{public}@", (uint8_t *)&v29, 0x20u);

    }
    objc_msgSend(a1, "_accountStoreForPrivacyIdentifier:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_ams_localiTunesAccount");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v7, "OSLogObject");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v26 = objc_opt_class();
        AMSLogKey();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543618;
        v30 = v26;
        v31 = 2114;
        v32 = v27;
        _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] We failed to get an account, so do not have record of user rejecting privacy acknowledgement.", (uint8_t *)&v29, 0x16u);

      }
      goto LABEL_21;
    }
  }
  objc_msgSend(v7, "ams_privacyAcknowledgement");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v6);
  v19 = objc_claimAutoreleasedReturnValue();

  +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v20, "OSLogObject");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = objc_opt_class();
    AMSLogKey();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138544130;
    v30 = v22;
    v31 = 2114;
    v32 = v23;
    v33 = 2114;
    v34 = v24;
    v35 = 2114;
    v36 = v19;
    _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] account = %{public}@ | acknowledgedVersion = %{public}@", (uint8_t *)&v29, 0x2Au);

  }
  if (!v19)
  {
LABEL_21:
    v25 = 0;
    goto LABEL_22;
  }
  v25 = -[NSObject isEqualToNumber:](v19, "isEqualToNumber:", &unk_1E25AEF48);
LABEL_22:

  return v25;
}

+ (BOOL)hasPreviouslyAcknowledgedAnyBundlePrivacyAcknowledgements
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void *v23;
  NSObject *v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  int v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  if (+[AMSDefaults disablePrivacyAcknowledgement](AMSDefaults, "disablePrivacyAcknowledgement"))
  {
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
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
      *(_DWORD *)buf = 138543618;
      v27 = v5;
      v28 = 2114;
      v29 = v6;
      _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Previous bundle acknowledgements will not be fetched because AMSDefaults.disablePrivacyAcknowledgement is true.", buf, 0x16u);

    }
    LOBYTE(v7) = 0;
  }
  else
  {
    objc_msgSend(a1, "_appleBundleOwnerPrivacyIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_accountStoreForPrivacyIdentifier:", v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "ams_localiTunesAccount");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(a1, "_appleBundleOwnerPrivacyIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v9;
      objc_msgSend(a1, "_appleBundleHolderPrivacyIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v32[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __86__AMSAcknowledgePrivacyTask_hasPreviouslyAcknowledgedAnyBundlePrivacyAcknowledgements__block_invoke;
      v23 = &unk_1E253DD68;
      v25 = a1;
      v24 = v4;
      v7 = objc_msgSend(v11, "ams_anyWithTest:", &v20);
      +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig", v20, v21, v22, v23);
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
        *(_DWORD *)buf = 138543874;
        v27 = v14;
        v28 = 2114;
        v29 = v15;
        v30 = 1024;
        v31 = v7;
        _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Has previously acknowledged = %d.", buf, 0x1Cu);

      }
      v16 = v24;
    }
    else
    {
      +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
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
        *(_DWORD *)buf = 138543618;
        v27 = v17;
        v28 = 2114;
        v29 = v18;
        _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No local account!", buf, 0x16u);

      }
      LOBYTE(v7) = 0;
    }

  }
  return v7;
}

uint64_t __86__AMSAcknowledgePrivacyTask_hasPreviouslyAcknowledgedAnyBundlePrivacyAcknowledgements__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "hasPreviouslyAcknowledgedPrivacyIdentifier:account:", a2, *(_QWORD *)(a1 + 32));
}

+ (BOOL)hasPreviouslyAcknowledgedPrivacyIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AMSSetLogKeyIfNeeded();
  if (+[AMSDefaults disablePrivacyAcknowledgement](AMSDefaults, "disablePrivacyAcknowledgement"))
  {
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v8;
      v16 = 2114;
      v17 = v9;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Previous acknowledgement will not be fetched because AMSDefaults.disablePrivacyAcknowledgement is true.", (uint8_t *)&v14, 0x16u);

    }
    v10 = 0;
  }
  else
  {
    objc_msgSend(a1, "_accountStoreForPrivacyIdentifier:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ams_activeiTunesAccount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(a1, "hasPreviouslyAcknowledgedPrivacyIdentifier:account:", v4, v12);

  }
  return v10;
}

+ (BOOL)hasPreviouslyAcknowledgedPrivacyIdentifier:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = AMSSetLogKeyIfNeeded();
  objc_msgSend(a1, "_valueForPreviouslyAcknowledgedPrivacyIdentifier:account:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
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
      v20 = 138543874;
      v21 = v13;
      v22 = 2114;
      v23 = v14;
      v24 = 2114;
      v25 = v9;
      v15 = "%{public}@: [%{public}@] Previous Privacy acknowledgement found. acknowledgedVersion = %{public}@";
      v16 = v12;
      v17 = 32;
LABEL_10:
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v20, v17);

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
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v18;
      v22 = 2114;
      v23 = v14;
      v15 = "%{public}@: [%{public}@] No Previous Privacy acknowledgement found.";
      v16 = v12;
      v17 = 22;
      goto LABEL_10;
    }
  }

  return v9 != 0;
}

+ (BOOL)hasPreviouslyAcknowledgedPrivacyIdentifier:(id)a3 minimumVersion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_accountStoreForPrivacyIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ams_activeiTunesAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "hasPreviouslyAcknowledgedPrivacyIdentifier:account:minimumVersion:", v7, v9, v6);

  return (char)a1;
}

+ (BOOL)hasPreviouslyAcknowledgedPrivacyIdentifier:(id)a3 account:(id)a4 minimumVersion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  BOOL v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  int v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
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
    v27 = 138544386;
    v28 = v13;
    v29 = 2114;
    v30 = v14;
    v31 = 2114;
    v32 = v8;
    v33 = 2114;
    v34 = v9;
    v35 = 2114;
    v36 = v10;
    _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Checking identifier %{public}@ on account: %{public}@ minimumVersion = %{public}@", (uint8_t *)&v27, 0x34u);

  }
  objc_msgSend(a1, "_valueForPreviouslyAcknowledgedPrivacyIdentifier:account:", v8, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v15)
  {
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v17, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_opt_class();
      AMSLogKey();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543874;
      v28 = v19;
      v29 = 2114;
      v30 = v20;
      v31 = 2114;
      v32 = v15;
      _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Previous Privacy acknowledgement found. acknowledgedVersion = %{public}@", (uint8_t *)&v27, 0x20u);

    }
    v21 = objc_msgSend(v15, "unsignedIntegerValue");
    v22 = v21 >= objc_msgSend(v10, "unsignedIntegerValue");
  }
  else
  {
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v17, "OSLogObject");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_opt_class();
      AMSLogKey();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v24;
      v29 = 2114;
      v30 = v25;
      _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No Previous Privacy acknowledgement found.", (uint8_t *)&v27, 0x16u);

    }
    v22 = 0;
  }

  return v22;
}

+ (id)_valueForPreviouslyAcknowledgedPrivacyIdentifier:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = AMSSetLogKeyIfNeeded();
  if (v7)
    goto LABEL_7;
  +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_opt_class();
    AMSLogKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543874;
    v20 = v11;
    v21 = 2114;
    v22 = v12;
    v23 = 2114;
    v24 = v6;
    _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No account provided, attempting to use the local account. privacyIdentifier = %{public}@", (uint8_t *)&v19, 0x20u);

  }
  objc_msgSend(a1, "_accountStoreForPrivacyIdentifier:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_ams_localiTunesAccount");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
LABEL_7:
    objc_msgSend(v7, "ams_privacyAcknowledgement");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_opt_class();
      AMSLogKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v17;
      v21 = 2114;
      v22 = v18;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] No Previous acknowledgement because we failed to get an account.", (uint8_t *)&v19, 0x16u);

    }
    v15 = 0;
  }

  return v15;
}

- (id)_updatePrivacyWithAcknowledgementVersions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  AMSAcknowledgePrivacyTask *v13;
  id v14;
  id location;

  v4 = a3;
  AMSLogKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    AMSSetLogKey(0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__AMSAcknowledgePrivacyTask__updatePrivacyWithAcknowledgementVersions___block_invoke;
  v10[3] = &unk_1E253DD90;
  objc_copyWeak(&v14, &location);
  v6 = v5;
  v11 = v6;
  v7 = v4;
  v12 = v7;
  v13 = self;
  -[AMSTask performBinaryTaskWithBlock:](self, "performBinaryTaskWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

uint64_t __71__AMSAcknowledgePrivacyTask__updatePrivacyWithAcknowledgementVersions___block_invoke(uint64_t a1, _QWORD *a2)
{
  id WeakRetained;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  unsigned int v55;
  _QWORD *v56;
  void *v57;
  id v58;
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = AMSSetLogKey(*(void **)(a1 + 32));
  +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "privacyIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v60 = v8;
    v61 = 2114;
    v62 = v9;
    v63 = 2114;
    v64 = (uint64_t)v10;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running AMSAcknowledgePrivacyTask. privacyIdentifiers = %{public}@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_ams_localiTunesAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "ams_mergePrivacyAcknowledgement:", *(_QWORD *)(a1 + 40)) & 2) != 0)
  {
    objc_msgSend(v11, "ams_saveAccount:verifyCredentials:", v12, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v14, "resultWithError:", a2);

  }
  else
  {
    v13 = 1;
  }
  objc_msgSend(*(id *)(a1 + 48), "account");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v56 = a2;
    v57 = v12;
    v16 = WeakRetained;
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v18 = v13;
    objc_msgSend(v17, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_opt_class();
      AMSLogKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hashedDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v60 = v20;
      v61 = 2114;
      v62 = v21;
      v63 = 2114;
      v64 = (uint64_t)v22;
      _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] We have an account. Merging the privacy acknowledgement into it. account = %{public}@", buf, 0x20u);

    }
    v23 = objc_msgSend(v15, "ams_mergePrivacyAcknowledgement:", *(_QWORD *)(a1 + 40));
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v24, "OSLogObject");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = objc_opt_class();
      AMSLogKey();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v60 = v26;
      v61 = 2114;
      v62 = v27;
      v63 = 2048;
      v64 = v23;
      _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Merge result = %ld", buf, 0x20u);

    }
    if ((v23 & 2) == 0)
    {
      v13 = v18;
      WeakRetained = v16;
      v12 = v57;
      goto LABEL_39;
    }
    objc_msgSend(v11, "ams_saveAccount:verifyCredentials:", v15, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0;
    v29 = objc_msgSend(v28, "resultWithError:", &v58);
    v30 = v58;
    v13 = v18 & v29;

    if (v30)
    {
      v31 = objc_msgSend(v30, "code");
      +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = (void *)v32;
      WeakRetained = v16;
      if (v31 == 102)
      {
        v55 = v13;
        if (!v32)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v33, "OSLogObject");
        v34 = objc_claimAutoreleasedReturnValue();
        v12 = v57;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v54 = objc_opt_class();
          AMSLogKey();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "hashedDescription");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v60 = v54;
          v61 = 2114;
          v62 = v35;
          v63 = 2114;
          v64 = (uint64_t)v36;
          _os_log_impl(&dword_18C849000, v34, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Account not dirty. Checking the privacy acknowledgements match. account = %{public}@", buf, 0x20u);

        }
        objc_msgSend(v15, "reload");
        objc_msgSend(v15, "ams_privacyAcknowledgement");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = +[AMSAcknowledgePrivacyTask _existingAcknowledgements:containsNewAcknowledgements:](AMSAcknowledgePrivacyTask, "_existingAcknowledgements:containsNewAcknowledgements:", v37, *(_QWORD *)(a1 + 40));

        +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = (void *)v39;
        if (v38)
        {
          if (!v39)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v40, "OSLogObject");
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v42 = objc_opt_class();
            AMSLogKey();
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v60 = v42;
            v61 = 2114;
            v62 = v43;
            _os_log_impl(&dword_18C849000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Acknowledgements match. Returning success.", buf, 0x16u);

          }
          v13 = 1;
        }
        else
        {
          if (!v39)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v40, "OSLogObject");
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            v51 = objc_opt_class();
            AMSLogKey();
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "description");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v60 = v51;
            v61 = 2114;
            v62 = v52;
            v63 = 2112;
            v64 = (uint64_t)v53;
            _os_log_impl(&dword_18C849000, v50, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Acknowledgements do NOT match. %@", buf, 0x20u);

          }
          *v56 = objc_retainAutorelease(v30);
          v13 = v55;
        }
        goto LABEL_38;
      }
      if (!v32)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v33, "OSLogObject");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v45 = objc_opt_class();
        AMSLogKey();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "description");
        v47 = v13;
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v60 = v45;
        v61 = 2114;
        v62 = v46;
        v63 = 2112;
        v64 = (uint64_t)v48;
        _os_log_impl(&dword_18C849000, v44, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Save account error. %@", buf, 0x20u);

        v13 = v47;
        WeakRetained = v16;

      }
      *v56 = objc_retainAutorelease(v30);
    }
    else
    {
      WeakRetained = v16;
    }
    v12 = v57;
LABEL_38:

  }
LABEL_39:

  return v13;
}

+ (BOOL)_existingAcknowledgements:(id)a3 containsNewAcknowledgements:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v6, "allKeys", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (!v13 || objc_msgSend(v14, "compare:", v13) == 1)
        {

          v16 = 0;
          goto LABEL_13;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v16 = 1;
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v16 = 1;
  }
LABEL_13:

  return v16;
}

+ (id)_multiplexPrivacyIdentifier:(id)a3 contentVersion:(unint64_t)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "_storePrivacyIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(a1, "_storePrivacyIdentifiers", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v14);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v12);
    }

    v17 = objc_msgSend(v9, "copy");
  }
  else
  {
    v24 = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v25 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v17;

  return v18;
}

+ (id)_storePrivacyIdentifiers
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E25B00C8);
}

+ (id)_appleArcadePrivacyIdentifier
{
  return CFSTR("com.apple.onboarding.applearcade");
}

+ (id)_appleIDPrivacyIdentifier
{
  return CFSTR("com.apple.onboarding.appleid");
}

+ (id)_appleMusicAppPrivacyIdentifier
{
  return CFSTR("com.apple.onboarding.applemusic");
}

+ (id)_appleTVAppPrivacyIdentifier
{
  return CFSTR("com.apple.onboarding.tvapp");
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSSet)privacyIdentifiers
{
  return self->_privacyIdentifiers;
}

- (void)setPrivacyIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyIdentifiers, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end

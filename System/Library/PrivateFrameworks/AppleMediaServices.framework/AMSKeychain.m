@implementation AMSKeychain

+ (id)certificateChainStringsForOptions:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  CFDataRef v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v37;
  id *v38;
  id v39;
  uint64_t v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE buf[12];
  __int16 v50;
  void *v51;
  __int16 v52;
  uint64_t v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[AMSKeychain certificateKeychainLabelsForOptions:](AMSKeychain, "certificateKeychainLabelsForOptions:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0x1E0CB3000uLL;
  if (objc_msgSend(v7, "count") == 2
    || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Certificate Lookup: Invalid number of keychain labels: %@ options: %@"), v7, v5), v9 = (void *)objc_claimAutoreleasedReturnValue(), AMSError(600, CFSTR("Keychain Error"), v9, 0), v10 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v10))
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v7;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v11)
    {
      v12 = v11;
      v37 = v7;
      v38 = a4;
      v39 = v5;
      v13 = *(_QWORD *)v46;
      v14 = *MEMORY[0x1E0CD6A90];
      v15 = *MEMORY[0x1E0CD6898];
      v43 = *MEMORY[0x1E0CD6C98];
      v44 = *MEMORY[0x1E0CD6CA0];
      v42 = *MEMORY[0x1E0CD7028];
      while (2)
      {
        v16 = 0;
        v40 = v12;
        do
        {
          if (*(_QWORD *)v46 != v13)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v16);
          +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v18)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v18, "OSLogObject");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v20 = objc_opt_class();
            AMSSetLogKeyIfNeeded();
            v21 = v15;
            v22 = v14;
            v23 = v13;
            v24 = v6;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v20;
            v50 = 2114;
            v51 = v25;
            v52 = 2114;
            v53 = v17;
            _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Fetching cert for label: %{public}@", buf, 0x20u);

            v6 = v24;
            v13 = v23;
            v14 = v22;
            v15 = v21;
            v12 = v40;
          }

          *(_QWORD *)buf = 0;
          v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v17, v14);
          objc_msgSend(v26, "setObject:forKeyedSubscript:", CFSTR("apple"), v15);
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v44, v43);
          objc_msgSend(v26, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v42);
          v27 = AMSSecItemCopyMatchingWithTimeFault(v26, (uint64_t)buf);
          if ((_DWORD)v27)
          {
            v30 = v27;
            v8 = 0x1E0CB3000uLL;
            v31 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v5 = v39;
            objc_msgSend(v31, "stringWithFormat:", CFSTR("Certificate Lookup: Failed to find cert. status: %@ options: %@"), v32, v39);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            AMSKeychainError(v33, v30);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            v7 = v37;
            a4 = v38;
            goto LABEL_18;
          }
          v28 = SecCertificateCopyData(*(SecCertificateRef *)buf);
          -[__CFData base64EncodedStringWithOptions:](v28, "base64EncodedStringWithOptions:", 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v29);

          ++v16;
        }
        while (v12 != v16);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
        if (v12)
          continue;
        break;
      }
      v10 = 0;
      a4 = v38;
      v5 = v39;
      v7 = v37;
      v8 = 0x1E0CB3000;
    }
    else
    {
      v10 = 0;
    }
LABEL_18:

  }
  if (objc_msgSend(v6, "count") != 2)
  {
    objc_msgSend(*(id *)(v8 + 2368), "stringWithFormat:", CFSTR("Certificate Lookup: Cert fetch finished without either an error or both certs. options: %@"), v5);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    AMSError(600, CFSTR("Keychain Error"), v34, 0);
    v35 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v35;
  }
  if (v10)
  {

    v6 = 0;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v10);

  return v6;
}

+ (__SecKey)copyPrivateKeyWithContext:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  CFTypeRef v20;
  void *v21;
  CFTypeRef cf;

  v8 = a3;
  v9 = a4;
  cf = 0;
  v10 = objc_msgSend(v9, "style");
  if (v10 > 5)
    goto LABEL_23;
  if (((1 << v10) & 0x39) != 0)
    objc_msgSend(a1, "_certificatePrivateKeyLabelForOptions:", v9);
  else
    objc_msgSend(a1, "keychainLabelForOptions:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Private Key Lookup: Invalid private key label: %@. options: %@"), 0, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    AMSError(600, CFSTR("Keychain Error"), v12, 0);
    v13 = objc_claimAutoreleasedReturnValue();

    v11 = 0;
    if (v13)
    {
LABEL_17:
      if (a5)
        *a5 = objc_retainAutorelease((id)v13);
      cf = 0;

      v20 = 0;
      goto LABEL_20;
    }
  }
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CD6A90]);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("apple"), *MEMORY[0x1E0CD6898]);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CC0], *MEMORY[0x1E0CD6C98]);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6A00], *MEMORY[0x1E0CD69F8]);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7028]);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6BB0], *MEMORY[0x1E0CD6B98]);
  if (v8)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CD7088]);
  v15 = AMSSecItemCopyMatchingWithTimeFault(v14, (uint64_t)&cf);
  if ((_DWORD)v15)
  {
    v16 = v15;
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("Private Key Lookup: Failed to fetch privateKey. status: %@ options: %@"), v18, v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    AMSKeychainError(v19, v16);
    v13 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  v20 = cf;
  if (!(v13 | (unint64_t)cf))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Private Key Lookup: Finished without a result or error. options: %@"), v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    AMSError(600, CFSTR("Keychain Error"), v21, 0);
    v13 = objc_claimAutoreleasedReturnValue();

    v20 = cf;
  }
  if (v13)
  {
    if (v20)
      CFRelease(v20);
    goto LABEL_17;
  }
LABEL_20:

  return (__SecKey *)v20;
}

+ (__SecKey)copyCertificatePrivateKeyWithContext:(id)a3 account:(id)a4 options:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  __SecKey *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v45;
  NSObject *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  __SecKey *v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v62 = a3;
  v11 = a4;
  v12 = a5;
  v63 = 0;
  AMSSetLogKeyIfNeeded();
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "style")
    || objc_msgSend(v12, "style") == 4
    || objc_msgSend(v12, "style") == 3
    || objc_msgSend(v12, "style") == 5)
  {
    v58 = a1;
    v60 = v12;
    objc_msgSend(a1, "_ssKeychainLabelForAccount:options:", v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v56 = *MEMORY[0x1E0CD69F8];
    v57 = *MEMORY[0x1E0CD6A00];
    objc_msgSend(v14, "setObject:forKeyedSubscript:");
    v59 = (void *)v13;
    v55 = *MEMORY[0x1E0CD6A90];
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13);
    v15 = *MEMORY[0x1E0CD6898];
    objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("apple"), *MEMORY[0x1E0CD6898]);
    v16 = *MEMORY[0x1E0CD6CC0];
    v17 = *MEMORY[0x1E0CD6C98];
    objc_msgSend(v14, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CC0], *MEMORY[0x1E0CD6C98]);
    v18 = *MEMORY[0x1E0CD7028];
    objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7028]);
    v19 = *MEMORY[0x1E0CD7088];
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v62, *MEMORY[0x1E0CD7088]);
    v20 = AMSSecItemCopyMatchingWithTimeFault(v14, (uint64_t)&v63);
    if ((_DWORD)v20 != -25300)
    {
      v21 = v20;
      if ((_DWORD)v20)
      {
        v54 = v11;
        +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v22)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v22, "OSLogObject");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v24 = (void *)objc_opt_class();
          v52 = (void *)MEMORY[0x1E0CB37E8];
          v53 = v24;
          objc_msgSend(v52, "numberWithInt:", v21);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v65 = v24;
          v66 = 2114;
          v67 = v61;
          v68 = 2114;
          v69 = v25;
          _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Retrieving certificate key for legacy StoreServices returned status: %{public}@", buf, 0x20u);

        }
        v11 = v54;
      }
    }
    v26 = v63;
    v12 = v60;
    if (!v63)
    {
      objc_msgSend(v58, "_certificatePrivateKeyLabelForOptions:", v60);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v57, v56);
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v27, v55);
      objc_msgSend(v28, "setObject:forKeyedSubscript:", CFSTR("apple"), v15);
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v16, v17);
      objc_msgSend(v28, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v18);
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v62, v19);
      v29 = AMSSecItemCopyMatchingWithTimeFault(v28, (uint64_t)&v63);
      if ((_DWORD)v29 != -25300)
      {
        v30 = v29;
        if ((_DWORD)v29)
        {
          +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v31)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v31, "OSLogObject", v52);
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            v33 = (void *)objc_opt_class();
            v34 = (void *)MEMORY[0x1E0CB37E8];
            v35 = v11;
            v36 = v33;
            objc_msgSend(v34, "numberWithInt:", v30);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v65 = v33;
            v66 = 2114;
            v67 = v61;
            v68 = 2114;
            v69 = v37;
            _os_log_impl(&dword_18C849000, v32, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Retrieving certificate key for AMS returned status: %{public}@", buf, 0x20u);

            v11 = v35;
            v12 = v60;
          }

        }
      }

      v26 = v63;
      if (!v63)
      {
        +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v38)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v38, "OSLogObject", v52);
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v40 = (void *)objc_opt_class();
          v41 = v40;
          AMSHashIfNeeded(v11);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v65 = v40;
          v66 = 2114;
          v67 = v61;
          v68 = 2114;
          v69 = v42;
          _os_log_impl(&dword_18C849000, v39, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to find certificate key either for AMS or StoreServices for account: %{public}@", buf, 0x20u);

        }
        v26 = v63;
      }
    }

    v43 = 0;
  }
  else
  {
    +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v45)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v45, "OSLogObject");
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      v47 = (void *)objc_opt_class();
      v48 = v47;
      NSStringFromSelector(a2);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "style"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v65 = v47;
      v66 = 2114;
      v67 = v61;
      v68 = 2112;
      v69 = v49;
      v70 = 2112;
      v71 = v50;
      _os_log_impl(&dword_18C849000, v46, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %@ was invoked with attestation style: %@", buf, 0x2Au);

    }
    AMSError(600, CFSTR("Keychain Error"), CFSTR("Incorrect Attestation Style"), 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v51;
    if (a6)
    {
      v43 = objc_retainAutorelease(v51);
      v26 = 0;
      *a6 = v43;
    }
    else
    {
      v26 = 0;
    }
  }

  return v26;
}

+ (__SecKey)copyPrivateKeyWithContext:(id)a3 account:(id)a4 options:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  __SecKey *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  id *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id *v34;
  id v35;
  __SecKey *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v36 = 0;
  AMSSetLogKeyIfNeeded();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "style") == 1)
  {
    v34 = a6;
    objc_msgSend(a1, "_ssKeychainLabelForAccount:options:", v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      AMSError(600, CFSTR("Keychain Error"), CFSTR("No Private Key Label"), 0);
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
        goto LABEL_20;
    }
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CD6A90]);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("apple"), *MEMORY[0x1E0CD6898]);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CC0], *MEMORY[0x1E0CD6C98]);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6A00], *MEMORY[0x1E0CD69F8]);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7028]);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6BB0], *MEMORY[0x1E0CD6B98]);
    if (v11)
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CD7088]);
    if (AMSSecItemCopyMatchingWithTimeFault(v16, (uint64_t)&v36))
    {
      +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v17, "OSLogObject");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v38 = v19;
        v39 = 2114;
        v40 = v14;
        v20 = v19;
        _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No legacy StoreServices private key found", buf, 0x16u);

      }
    }

    v21 = 0;
    v22 = 0;
    v23 = v36;
    if (!v36)
    {
LABEL_20:
      v23 = (__SecKey *)objc_msgSend(a1, "copyPrivateKeyWithContext:options:error:", v11, v13, v34);
      v22 = (id)v21;
    }

  }
  else
  {
    +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v24, "OSLogObject");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = v14;
      v27 = v12;
      v28 = a6;
      v29 = (void *)objc_opt_class();
      v35 = v29;
      NSStringFromSelector(a2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "style"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v38 = v29;
      a6 = v28;
      v12 = v27;
      v14 = v26;
      v39 = 2114;
      v40 = v26;
      v41 = 2112;
      v42 = v30;
      v43 = 2112;
      v44 = v31;
      _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %@ was invoked with attestation style: %@", buf, 0x2Au);

    }
    AMSError(600, CFSTR("Keychain Error"), CFSTR("Incorrect Attestation Style"), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v32;
    if (a6)
    {
      v22 = objc_retainAutorelease(v32);
      v23 = 0;
      *a6 = v22;
    }
    else
    {
      v23 = 0;
    }
  }

  return v23;
}

+ (__SecKey)copyPublicKeyForAccount:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  __SecKey *v9;
  id v10;
  SecKeyRef v11;
  SecKeyRef v12;
  id *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  AMSBiometricsTokenUpdateTask *v19;
  void *v20;
  id v21;
  id *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  __SecKey *v27;
  SecKeyRef v29;
  void *v30;
  id v31;
  id *v32;
  void *v33;
  NSObject *v34;
  id v35;
  void *v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  _BOOL4 v41;
  id v42;
  id *v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  AMSSetLogKeyIfNeeded();
  v44 = objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "style") || objc_msgSend(v8, "style") == 4 || objc_msgSend(v8, "style") == 5)
  {
    v49 = 0;
    v9 = +[AMSKeychain copyCertificatePrivateKeyWithContext:account:options:error:](AMSKeychain, "copyCertificatePrivateKeyWithContext:account:options:error:", 0, v7, v8, &v49);
    v10 = v49;
    if (v9)
    {
      v11 = SecKeyCopyPublicKey(v9);
      if (v11)
      {
        v12 = v11;
        v13 = a5;
        +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v14, "OSLogObject");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v51 = v16;
          v52 = 2114;
          v17 = (void *)v44;
          v53 = v44;
          v54 = 2114;
          v55 = v8;
          v18 = v16;
          _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found public key cert reference for options: %{public}@", buf, 0x20u);

          a5 = v13;
        }
        else
        {
          v17 = (void *)v44;
        }
LABEL_20:

        goto LABEL_21;
      }
    }
    v19 = -[AMSBiometricsTokenUpdateTask initWithAccount:]([AMSBiometricsTokenUpdateTask alloc], "initWithAccount:", v7);
    -[AMSBiometricsTokenUpdateTask setShouldGenerateKeysOnly:](v19, "setShouldGenerateKeysOnly:", 1);
    -[AMSBiometricsTokenUpdateTask performUpdate](v19, "performUpdate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v10;
    objc_msgSend(v20, "resultWithError:", &v48);
    v21 = v48;

    if (v21)
    {
      v42 = v7;
      v22 = a5;
      +[AMSLogConfig sharedAttestationConfig](AMSLogConfig, "sharedAttestationConfig");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v23, "OSLogObject");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (void *)objc_opt_class();
        AMSSetLogKeyIfNeeded();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v51 = v25;
        v52 = 2114;
        v53 = (uint64_t)v26;
        v54 = 2114;
        v55 = v21;
        _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Re-create cert chain failed with error: %{public}@", buf, 0x20u);

      }
      a5 = v22;
      v7 = v42;
    }

  }
  else
  {
    if (objc_msgSend(v8, "style") != 1)
    {
      v32 = a5;
      +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v33)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v33, "OSLogObject");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v51 = (id)objc_opt_class();
        v52 = 2114;
        v53 = v44;
        v54 = 2114;
        v55 = v8;
        v35 = v51;
        _os_log_impl(&dword_18C849000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Legacy StoreServices public key lookup not supported for attestation style: %{public}@", buf, 0x20u);

      }
      v27 = 0;
      v10 = 0;
      a5 = v32;
      v17 = (void *)v44;
      goto LABEL_22;
    }
    v43 = a5;
    v47 = 0;
    v9 = +[AMSKeychain copyPrivateKeyWithContext:account:options:error:](AMSKeychain, "copyPrivateKeyWithContext:account:options:error:", 0, v7, v8, &v47);
    v10 = v47;
    if (v9)
    {
      v29 = SecKeyCopyPublicKey(v9);
      if (v29)
      {
        v12 = v29;
        +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v14, "OSLogObject");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v30 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v51 = v30;
          v52 = 2114;
          v17 = (void *)v44;
          v53 = v44;
          v54 = 2114;
          v55 = v8;
          v31 = v30;
          _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found public key reference for options: %{public}@", buf, 0x20u);

          a5 = v43;
        }
        else
        {
          v17 = (void *)v44;
        }
        goto LABEL_20;
      }
    }
    +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v36)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v36, "OSLogObject");
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = (void *)objc_opt_class();
      v39 = v38;
      AMSSetLogKeyIfNeeded();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v51 = v38;
      v52 = 2114;
      v53 = (uint64_t)v40;
      v54 = 2112;
      v55 = v8;
      v56 = 2114;
      v57 = v10;
      _os_log_impl(&dword_18C849000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did not find public key reference for options: %@, error: %{public}@", buf, 0x2Au);

    }
    v46 = v10;
    v41 = +[AMSKeychain _generateLegacyKeypairForOptions:error:](AMSKeychain, "_generateLegacyKeypairForOptions:error:", v8, &v46);
    v21 = v46;

    if (v41)
    {
      v45 = v21;
      v9 = (__SecKey *)objc_msgSend((id)objc_opt_class(), "copyPrivateKeyWithContext:options:error:", 0, v8, &v45);
      v10 = v45;

      if (v9)
      {
        v12 = SecKeyCopyPublicKey(v9);
        a5 = v43;
        v17 = (void *)v44;
        goto LABEL_21;
      }
      v27 = 0;
      a5 = v43;
      v17 = (void *)v44;
      goto LABEL_22;
    }
    a5 = v43;
  }
  v12 = 0;
  v27 = 0;
  v10 = v21;
  v17 = (void *)v44;
  if (v9)
  {
LABEL_21:
    CFRelease(v9);
    v27 = v12;
  }
LABEL_22:
  if (a5)
    *a5 = objc_retainAutorelease(v10);

  return v27;
}

+ (__SecKey)copyPublicKeyForOptions:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  SecKeyRef v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  __SecKey *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  const __CFData *v37;
  __SecCertificate *v38;
  __SecCertificate *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  NSObject *v47;
  void *v48;
  id v49;
  void *v50;
  __SecKey *v51;
  id v52;
  __SecKey *v53;
  id v55;
  id v56;
  void *v57;
  id *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  SecKeyRef v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  id v69;
  __int16 v70;
  SecKeyRef v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v63 = 0;
  v7 = 0;
  if (objc_msgSend(v6, "style") == 4)
  {
    +[AMSKeychain certificateKeychainLabelsForOptions:](AMSKeychain, "certificateKeychainLabelsForOptions:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@.publickey"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CD6A90]);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("apple"), *MEMORY[0x1E0CD6898]);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CC0], *MEMORY[0x1E0CD6C98]);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7028]);
    v13 = AMSSecItemCopyMatchingWithTimeFault(v12, (uint64_t)&v63);
    +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v13)
    {
      if (!v14)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v15, "OSLogObject");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = a4;
        v18 = (void *)objc_opt_class();
        v57 = v8;
        v19 = a1;
        v20 = v18;
        AMSLogKey();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v65 = v18;
        a4 = v17;
        v66 = 2114;
        v67 = v21;
        v68 = 2114;
        v69 = v11;
        _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Did not lookup public key: %{public}@", buf, 0x20u);

        a1 = v19;
        v8 = v57;
      }

      AMSError(600, CFSTR("Keychain Error"), CFSTR("Public Key Not Found"), 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v14)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v15, "OSLogObject");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (void *)objc_opt_class();
        v55 = v23;
        AMSLogKey();
        v56 = a1;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v63;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
        v58 = a4;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v65 = v23;
        v66 = 2114;
        v67 = v24;
        v68 = 2114;
        v69 = v11;
        v70 = 2114;
        v71 = v25;
        v72 = 2114;
        v73 = v26;
        _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Success for lookup of public key label: %{public}@, key: %{public}@, status: %{public}@", buf, 0x34u);

        a4 = v58;
        a1 = v56;

      }
      v7 = 0;
    }

  }
  if (objc_msgSend(v6, "style") == 3 || !objc_msgSend(v6, "style"))
  {
    v62 = v7;
    objc_msgSend(a1, "certificateChainStringsForOptions:error:", v6, &v62);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v62;

    objc_msgSend(v34, "firstObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v36, "length"))
    {
      v37 = (const __CFData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v36, 0);
      if (v37)
      {
        v38 = SecCertificateCreateWithData(0, v37);
        if (v38)
        {
          v39 = v38;
          v63 = SecCertificateCopyKey(v38);
          CFRelease(v39);
        }
      }

    }
    v7 = v35;
  }
  else if (objc_msgSend(v6, "style") == 1 || objc_msgSend(v6, "style") == 2)
  {
    +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v27, "OSLogObject");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (void *)objc_opt_class();
      v30 = v29;
      AMSSetLogKeyIfNeeded();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v65 = v29;
      v66 = 2114;
      v67 = v31;
      v68 = 2112;
      v69 = v6;
      _os_log_impl(&dword_18C849000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to lookup public key for options: %@", buf, 0x20u);

    }
    v61 = v7;
    v32 = +[AMSKeychain _copyLegacyPublicKeyForOptions:error:](AMSKeychain, "_copyLegacyPublicKeyForOptions:error:", v6, &v61);
    v33 = v61;

    v63 = v32;
    if (v32)
    {
      v7 = v33;
    }
    else
    {
      +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v40)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v40, "OSLogObject");
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v42 = (void *)objc_opt_class();
        v43 = v42;
        AMSSetLogKeyIfNeeded();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v65 = v42;
        v66 = 2114;
        v67 = v44;
        v68 = 2112;
        v69 = v6;
        v70 = 2114;
        v71 = (SecKeyRef)v33;
        _os_log_impl(&dword_18C849000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did not find public key for options: %@, error: %{public}@", buf, 0x2Au);

      }
      v60 = v33;
      v45 = +[AMSKeychain _generateLegacyKeypairForOptions:error:](AMSKeychain, "_generateLegacyKeypairForOptions:error:", v6, &v60);
      v7 = v60;

      if (v45)
      {
        +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v46)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v46, "OSLogObject");
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          v48 = (void *)objc_opt_class();
          v49 = v48;
          AMSSetLogKeyIfNeeded();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v65 = v48;
          v66 = 2114;
          v67 = v50;
          v68 = 2112;
          v69 = v6;
          _os_log_impl(&dword_18C849000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting second lookup for public key for options: %@", buf, 0x20u);

        }
        v59 = v7;
        v51 = +[AMSKeychain _copyLegacyPublicKeyForOptions:error:](AMSKeychain, "_copyLegacyPublicKeyForOptions:error:", v6, &v59);
        v52 = v59;

        v63 = v51;
        v7 = v52;
      }
    }
  }
  if (a4)
    *a4 = objc_retainAutorelease(v7);
  v53 = v63;

  return v53;
}

+ (BOOL)deleteCertificateChainWithOptions:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  uint64_t v19;
  int v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _UNKNOWN **v28;
  _QWORD *v29;
  void *v30;
  id v31;
  uint64_t v32;
  int v33;
  void *v34;
  NSObject *v35;
  _QWORD *v36;
  uint64_t v37;
  void *v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  NSObject *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  unint64_t v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t j;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v89;
  _QWORD *v90;
  void *v91;
  id v92;
  uint64_t v93;
  id v94;
  void *v95;
  uint64_t v96;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v103;
  id obj;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  id v109;
  id v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  uint64_t v119;
  void *v120;
  uint8_t v121[128];
  uint8_t buf[4];
  uint64_t v123;
  __int16 v124;
  void *v125;
  __int16 v126;
  void *v127;
  _BYTE v128[128];
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AMSSetLogKeyIfNeeded();
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSKeychain certificateKeychainLabelsForOptions:](AMSKeychain, "certificateKeychainLabelsForOptions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 2)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Delete Certificate: Invalid number of keychain labels: %@ options: %@"), v5, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AMSError(600, CFSTR("Keychain Error"), v7, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1, "_certificatePrivateKeyLabelForOptions:", v4);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v98)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Delete Certificate: NULL privateKey label for options: %@"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    AMSError(600, CFSTR("Keychain Error"), v8, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  obj = v5;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v128, 16);
  v11 = 0x1E0C99000uLL;
  v103 = v4;
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v116;
    v109 = (id)*MEMORY[0x1E0CD6A90];
    v107 = *MEMORY[0x1E0CD6898];
    v105 = *MEMORY[0x1E0CD6CA0];
    v14 = *MEMORY[0x1E0CD6C98];
    v15 = *(_QWORD *)v116;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v116 != v13)
          objc_enumerationMutation(obj);
        if (v6)
        {
          v30 = v103;
          v31 = obj;
          v28 = &off_1E2519000;
          v29 = (_QWORD *)MEMORY[0x1E0CD6C98];
          goto LABEL_33;
        }
        v17 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * i);
        v18 = objc_alloc_init(*(Class *)(v11 + 3592));
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v109);
        objc_msgSend(v18, "setObject:forKeyedSubscript:", CFSTR("apple"), v107);
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v105, v14);
        v19 = SecItemDelete((CFDictionaryRef)v18);
        if ((_DWORD)v19)
        {
          v20 = v19;
          if ((_DWORD)v19 == -25300)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v21)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v21, "OSLogObject");
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              v23 = objc_opt_class();
              AMSLogKey();
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v123 = v23;
              v13 = v15;
              v124 = 2114;
              v125 = v24;
              v126 = 2114;
              v127 = v17;
              _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Cert not found for label: %{public}@", buf, 0x20u);

              v11 = 0x1E0C99000;
            }

            v6 = 0;
          }
          else
          {
            v25 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v25;
            v11 = 0x1E0C99000uLL;
            objc_msgSend(v27, "stringWithFormat:", CFSTR("Delete Certificate: Failed to delete cert. label: %@ status: %@ options: %@"), v17, v26, v103);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            v13 = v15;
            AMSKeychainError(v21, v20);
            v6 = (void *)objc_claimAutoreleasedReturnValue();
          }

        }
        else
        {
          v6 = 0;
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v128, 16);
      if (v12)
        continue;
      break;
    }
  }

  v28 = &off_1E2519000;
  v29 = (_QWORD *)MEMORY[0x1E0CD6C98];
  v30 = v103;
  if (!v6)
  {
    v31 = objc_alloc_init(*(Class *)(v11 + 3592));
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v98, *MEMORY[0x1E0CD6A90]);
    objc_msgSend(v31, "setObject:forKeyedSubscript:", CFSTR("apple"), *MEMORY[0x1E0CD6898]);
    objc_msgSend(v31, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CC0], *v29);
    objc_msgSend(v31, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6A00], *MEMORY[0x1E0CD69F8]);
    v32 = SecItemDelete((CFDictionaryRef)v31);
    if ((_DWORD)v32)
    {
      v33 = v32;
      if ((_DWORD)v32 == -25300)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
          v36 = v29;
          v37 = objc_opt_class();
          AMSLogKey();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v123 = v37;
          v29 = v36;
          v124 = 2114;
          v125 = v38;
          v126 = 2114;
          v127 = v98;
          _os_log_impl(&dword_18C849000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Key (cert) not found for label: %{public}@", buf, 0x20u);

        }
        v6 = 0;
      }
      else
      {
        v89 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v32);
        v90 = v29;
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "stringWithFormat:", CFSTR("Delete Certificate: Failed to delete cert key. label: %@ status: %@ options: %@"), v98, v91, v103);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = v90;
        AMSKeychainError(v34, v33);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v6 = 0;
    }
    v11 = 0x1E0C99000;
LABEL_33:

  }
  v39 = 0x1E0C8F000uLL;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "ams_activeiTunesAccount");
  v40 = objc_claimAutoreleasedReturnValue();
  v110 = v6;
  v106 = (void *)v40;
  if (v40)
  {
    v41 = v40;
    objc_msgSend(a1, "_ssCertificateKeychainLabelForAccount:options:", v40, v30);
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = objc_alloc_init(*(Class *)(v11 + 3592));
    v44 = *MEMORY[0x1E0CD6A90];
    v95 = (void *)v42;
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v42, *MEMORY[0x1E0CD6A90]);
    v45 = *MEMORY[0x1E0CD6898];
    objc_msgSend(v43, "setObject:forKeyedSubscript:", CFSTR("apple"), *MEMORY[0x1E0CD6898]);
    v46 = *v29;
    v96 = *MEMORY[0x1E0CD6CA0];
    objc_msgSend(v43, "setObject:forKeyedSubscript:");
    v47 = SecItemDelete((CFDictionaryRef)v43);
    v100 = v45;
    if ((_DWORD)v47)
    {
      v48 = v47;
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v49)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v49, "OSLogObject");
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        v51 = v41;
        v52 = (void *)objc_opt_class();
        v93 = v44;
        v53 = (void *)MEMORY[0x1E0CB37E8];
        v92 = v52;
        objc_msgSend(v53, "numberWithInt:", v48);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v123 = (uint64_t)v52;
        v41 = v51;
        v28 = &off_1E2519000;
        v124 = 2114;
        v125 = v99;
        v126 = 2114;
        v127 = v54;
        _os_log_impl(&dword_18C849000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No deletion of legacy StoreServices laef cert with status: %{public}@", buf, 0x20u);

        v44 = v93;
      }

      v45 = v100;
    }
    objc_msgSend(a1, "_ssKeychainLabelForAccount:options:", v41, v30);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v55, v44);
    objc_msgSend(v43, "setObject:forKeyedSubscript:", CFSTR("apple"), v45);
    objc_msgSend(v43, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CC0], v46);
    objc_msgSend(v43, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6A00], *MEMORY[0x1E0CD69F8]);
    v56 = SecItemDelete((CFDictionaryRef)v43);
    if ((_DWORD)v56)
    {
      v57 = v56;
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v58)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v58, "OSLogObject");
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        v60 = v44;
        v61 = (void *)objc_opt_class();
        v62 = (void *)MEMORY[0x1E0CB37E8];
        v94 = v61;
        v63 = v62;
        v28 = &off_1E2519000;
        objc_msgSend(v63, "numberWithInt:", v57);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v123 = (uint64_t)v61;
        v44 = v60;
        v124 = 2114;
        v125 = v99;
        v126 = 2114;
        v127 = v64;
        _os_log_impl(&dword_18C849000, v59, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No deletion of legacy StoreServices key with status: %{public}@", buf, 0x20u);

      }
      v45 = v100;
    }

    v11 = 0x1E0C99000;
    v39 = 0x1E0C8F000;
    v65 = v96;
  }
  else
  {
    v44 = *MEMORY[0x1E0CD6A90];
    v45 = *MEMORY[0x1E0CD6898];
    v65 = *MEMORY[0x1E0CD6CA0];
    v46 = *v29;
  }
  v66 = objc_alloc_init(*(Class *)(v11 + 3592));
  objc_msgSend(v66, "setObject:forKeyedSubscript:", CFSTR("com.apple.itunesstored:intermediate-cert"), v44);
  objc_msgSend(v66, "setObject:forKeyedSubscript:", CFSTR("apple"), v45);
  objc_msgSend(v66, "setObject:forKeyedSubscript:", v65, v46);
  v101 = v66;
  v67 = SecItemDelete((CFDictionaryRef)v66);
  if ((_DWORD)v67)
  {
    v68 = v67;
    objc_msgSend(v28[274], "sharedConfig");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v69)
    {
      objc_msgSend(v28[274], "sharedConfig");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v69, "OSLogObject");
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      v71 = (void *)objc_opt_class();
      v72 = (void *)MEMORY[0x1E0CB37E8];
      v73 = v39;
      v74 = v71;
      objc_msgSend(v72, "numberWithInt:", v68);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v123 = (uint64_t)v71;
      v124 = 2114;
      v125 = v99;
      v126 = 2114;
      v127 = v75;
      _os_log_impl(&dword_18C849000, v70, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No deletion of legacy StoreServices intermediate cert with status: %{public}@", buf, 0x20u);

      v39 = v73;
    }

  }
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  objc_msgSend(*(id *)(v39 + 696), "ams_sharedAccountStore");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "ams_iTunesAccounts");
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v111, v121, 16);
  if (v78)
  {
    v79 = v78;
    v80 = *(_QWORD *)v112;
    v81 = *MEMORY[0x1E0C92AD0];
    do
    {
      for (j = 0; j != v79; ++j)
      {
        if (*(_QWORD *)v112 != v80)
          objc_enumerationMutation(v77);
        v83 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * j);
        v84 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v83, "ams_DSID");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "stringWithFormat:", CFSTR("mt-tid-%@"), v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();

        v119 = v81;
        v120 = v86;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "ams_removeCookiesMatchingProperties:", v87);

      }
      v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v111, v121, 16);
    }
    while (v79);
  }

  if (a4)
    *a4 = objc_retainAutorelease(v110);

  return v110 == 0;
}

+ (BOOL)storePrimaryCert:(__SecCertificate *)a3 intermediateCert:(__SecCertificate *)a4 privateKey:(__SecKey *)a5 options:(id)a6 error:(id *)a7
{
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  __SecCertificate *v25;
  __SecKey *v26;
  void *v27;
  id v28;
  uint64_t v29;
  int v30;
  __SecCertificate *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __SecCertificate *v36;
  void *v37;
  id v38;
  uint64_t v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v55;
  __SecCertificate *v56;
  id v57;
  id v59;
  id v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v59 = a1;
  objc_msgSend(a1, "_certificatePrivateKeyLabelForOptions:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (a5 && v12)
  {
    v14 = 0;
    if (a4)
      goto LABEL_9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Store Certificate: Invalid private key OR label. label: %@ options: %@"), v12, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    AMSError(2, CFSTR("Keychain Error"), v15, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
      goto LABEL_9;
  }
  if (!a3 && !v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Store Certificate: Invalid certs. options: %@"), v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    AMSError(2, CFSTR("Keychain Error"), v16, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_9:
  +[AMSKeychain certificateKeychainLabelsForOptions:](AMSKeychain, "certificateKeychainLabelsForOptions:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v14)
  {
    if (objc_msgSend(v17, "count") == 2)
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Store Certificate: Invalid number of keychain labels: %@ options: %@"), v18, v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      AMSError(2, CFSTR("Keychain Error"), v19, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  v60 = 0;
  objc_msgSend(v59, "deleteCertificateChainWithOptions:error:", v11, &v60);
  v57 = v60;
  if (v57)
  {
    v56 = a3;
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = v18;
      v23 = (void *)objc_opt_class();
      v55 = v23;
      AMSLogKey();
      v24 = v11;
      v25 = a4;
      v26 = a5;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v62 = v23;
      v18 = v22;
      v63 = 2114;
      v64 = v27;
      v65 = 2114;
      v66 = v14;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to delete certs. Error: %{public}@", buf, 0x20u);

      a5 = v26;
      a4 = v25;
      v11 = v24;

    }
    a3 = v56;
  }
  if (a5 && !v14)
  {
    v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v28, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6A00], *MEMORY[0x1E0CD69F8]);
    objc_msgSend(v28, "setObject:forKeyedSubscript:", CFSTR("apple"), *MEMORY[0x1E0CD6898]);
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CD6A90]);
    objc_msgSend(v28, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CC0], *MEMORY[0x1E0CD6C98]);
    objc_msgSend(v28, "setObject:forKeyedSubscript:", a5, *MEMORY[0x1E0CD70E8]);
    v29 = ((uint64_t (*)(id, _QWORD))objc_msgSend(v59, "secItemAddFunc"))(v28, 0);
    if ((_DWORD)v29)
    {
      v30 = v29;
      v31 = a3;
      v32 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v29);
      v33 = v18;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", CFSTR("Store Certificate: Failed to save privateKey for label: %@ status: %@ options: %@"), v13, v34, v11);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v33;
      AMSKeychainError(v35, v30);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      a3 = v31;
    }
    else
    {
      v14 = 0;
    }

  }
  if (a3 && !v14)
  {
    v36 = a4;
    objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v38, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CA0], *MEMORY[0x1E0CD6C98]);
    objc_msgSend(v38, "setObject:forKeyedSubscript:", CFSTR("apple"), *MEMORY[0x1E0CD6898]);
    objc_msgSend(v38, "setObject:forKeyedSubscript:", a3, *MEMORY[0x1E0CD70E8]);
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0CD6A90]);
    v39 = ((uint64_t (*)(id, _QWORD))objc_msgSend(v59, "secItemAddFunc"))(v38, 0);
    if ((_DWORD)v39)
    {
      v40 = v39;
      v41 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v39);
      v42 = v18;
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "stringWithFormat:", CFSTR("Store Certificate: Failed to save client cert for label: %@ status: %@ options: %@"), v37, v43, v11);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v42;
      AMSKeychainError(v44, v40);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }

    a4 = v36;
  }
  if (a4 && !v14)
  {
    v45 = v13;
    objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v47, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CA0], *MEMORY[0x1E0CD6C98]);
    objc_msgSend(v47, "setObject:forKeyedSubscript:", CFSTR("apple"), *MEMORY[0x1E0CD6898]);
    objc_msgSend(v47, "setObject:forKeyedSubscript:", a4, *MEMORY[0x1E0CD70E8]);
    objc_msgSend(v47, "setObject:forKeyedSubscript:", v46, *MEMORY[0x1E0CD6A90]);
    v48 = ((uint64_t (*)(id, _QWORD))objc_msgSend(v59, "secItemAddFunc"))(v47, 0);
    if ((_DWORD)v48)
    {
      v49 = v48;
      v50 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v48);
      v51 = v18;
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "stringWithFormat:", CFSTR("Store Certificate: Failed to save intermediate cert for label: %@ status: %@ options: %@"), v46, v52, v11);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v51;
      AMSKeychainError(v53, v49);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }

    v13 = v45;
  }
  if (a7)
    *a7 = objc_retainAutorelease(v14);

  return v14 == 0;
}

+ (BOOL)performForwardKeyMigrationForDSID:(id)a3 forceMigration:(BOOL)a4
{
  return 0;
}

+ (id)resumptionHeaders
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  objc_msgSend(a1, "_resumptionHeadersQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setObject:forKeyedSubscript:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD7018]);
  v5 = AMSSecItemCopyMatchingWithTimeFault(v4, (uint64_t)&v18);
  v6 = 0;
  if (!v5 && v18)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v18, 0, &v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;
    if (v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "OSLogObject");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = objc_opt_class();
        AMSLogKey();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v20 = v10;
        v21 = 2114;
        v22 = v11;
        v23 = 2114;
        v24 = (uint64_t)v7;
        _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to deserialize TID continue headers. %{public}@", buf, 0x20u);

      }
    }

  }
  +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
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
    AMSLogKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 138544130;
    v20 = (uint64_t)a1;
    v21 = 2114;
    v22 = v14;
    v23 = 2048;
    v24 = v15;
    v25 = 2048;
    v26 = v5;
    _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found %ld TID headers. %ld", buf, 0x2Au);

  }
  return v6;
}

+ (void)stashResumptionHeaders:(id)a3
{
  objc_msgSend(a1, "stashResumptionHeaders:error:", a3, 0);
}

+ (BOOL)stashResumptionHeaders:(id)a3 error:(id *)a4
{
  uint64_t v4;
  id v7;
  _UNKNOWN **v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  BOOL v42;
  __CFString *v43;
  OSStatus v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  CFStringRef v59;
  uint64_t v61;
  id *v62;
  void *v63;
  void *v64;
  id v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  CFStringRef v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = &off_1E2519000;
  +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
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
    AMSLogKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = objc_opt_class();
    v14 = v13;
    if (v11)
    {
      AMSLogKey();
      v4 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: [%@] "), v14, v4);
    }
    else
    {
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: "), v13);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v67 = v15;
    _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Stashing TID headers", buf, 0xCu);
    if (v11)
    {

      v15 = (void *)v4;
    }

  }
  if ((objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v7) & 1) != 0)
  {
    objc_msgSend(a1, "_deleteResumptionHeaders");
    v65 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v7, 0, &v65);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (__CFString *)v65;
    if (v17)
    {
      +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v18, "OSLogObject");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = v16;
        AMSLogKey();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x1E0CB3940];
        v23 = objc_opt_class();
        v24 = v23;
        if (v21)
        {
          AMSLogKey();
          a1 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: [%@] "), v24, a1);
        }
        else
        {
          objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: "), v23);
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v67 = v25;
        v68 = 2114;
        v69 = v17;
        _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_ERROR, "%{public}@Error occurred serializing TID continue headers. error = %{public}@", buf, 0x16u);
        if (v21)
        {

          v25 = a1;
        }

        v16 = v20;
      }

      if (a4)
      {
        AMSError(2, CFSTR("Serialization Error"), CFSTR("Error serializing headers to data"), v17);
        v42 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v42 = 0;
      }
    }
    else
    {
      objc_msgSend(a1, "_resumptionHeadersQuery");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v33, "mutableCopy");

      v64 = v34;
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CD70D8]);
      +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v35)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v35, "OSLogObject");
      v36 = objc_claimAutoreleasedReturnValue();
      v62 = a4;
      v63 = v16;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        AMSLogKey();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)MEMORY[0x1E0CB3940];
        v39 = objc_opt_class();
        v40 = v39;
        if (v37)
        {
          AMSLogKey();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "stringWithFormat:", CFSTR("%@: [%@] "), v40, v16);
        }
        else
        {
          objc_msgSend(v38, "stringWithFormat:", CFSTR("%@: "), v39);
        }
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v64);
        v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v67 = v41;
        v68 = 2114;
        v69 = v43;
        _os_log_impl(&dword_18C849000, v36, OS_LOG_TYPE_DEBUG, "%{public}@Beginning keychain query: %{public}@", buf, 0x16u);
        if (v37)
        {

          v41 = v16;
        }

      }
      v44 = ((uint64_t (*)(void *, _QWORD))objc_msgSend(a1, "secItemAddFunc"))(v64, 0);
      +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v45)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v45, "OSLogObject");
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        AMSLogKey();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (void *)MEMORY[0x1E0CB3940];
        v49 = objc_opt_class();
        v50 = v49;
        if (v47)
        {
          AMSLogKey();
          v61 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "stringWithFormat:", CFSTR("%@: [%@] "), v50, v61);
        }
        else
        {
          objc_msgSend(v48, "stringWithFormat:", CFSTR("%@: "), v49);
        }
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v67 = v51;
        v68 = 1024;
        LODWORD(v69) = v44;
        _os_log_impl(&dword_18C849000, v46, OS_LOG_TYPE_DEBUG, "%{public}@Keychain query complete. status = %d", buf, 0x12u);
        if (v47)
        {

          v51 = (void *)v61;
        }

      }
      v42 = v44 == 0;
      if (v44)
      {
        +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v52)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v52, "OSLogObject");
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          AMSLogKey();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = (void *)MEMORY[0x1E0CB3940];
          v56 = objc_opt_class();
          v57 = v56;
          if (v54)
          {
            AMSLogKey();
            v8 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "stringWithFormat:", CFSTR("%@: [%@] "), v57, v8);
          }
          else
          {
            objc_msgSend(v55, "stringWithFormat:", CFSTR("%@: "), v56);
          }
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = SecCopyErrorMessageString(v44, 0);
          *(_DWORD *)buf = 138543618;
          v67 = v58;
          v68 = 2114;
          v69 = v59;
          _os_log_impl(&dword_18C849000, v53, OS_LOG_TYPE_ERROR, "%{public}@Failed to stash TID continue headers. error: %{public}@", buf, 0x16u);
          if (v54)
          {

            v58 = v8;
          }

        }
        if (v62)
        {
          AMSKeychainError(CFSTR("Failed to insert TID headers into keychain"), v44);
          *v62 = (id)objc_claimAutoreleasedReturnValue();
        }
      }

      v16 = v63;
    }

  }
  else
  {
    +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v26, "OSLogObject");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)MEMORY[0x1E0CB3940];
      v30 = objc_opt_class();
      v31 = v30;
      if (v28)
      {
        AMSLogKey();
        a1 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringWithFormat:", CFSTR("%@: [%@] "), v31, a1);
      }
      else
      {
        objc_msgSend(v29, "stringWithFormat:", CFSTR("%@: "), v30);
      }
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v67 = v32;
      _os_log_impl(&dword_18C849000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize TID continue headers", buf, 0xCu);
      if (v28)
      {

        v32 = a1;
      }

    }
    if (a4)
    {
      AMSError(2, CFSTR("Invalid Headers"), CFSTR("Headers are not a valid JSON object."), 0);
      v42 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v42 = 0;
    }
  }

  return v42;
}

+ (BOOL)deleteKeyPairWithOptions:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  id v13;
  id v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  NSObject *v19;
  id v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v50;
  void *v51;
  void *v52;
  void *v54;
  void *v55;
  id obj;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  void *v62;
  uint8_t v63[128];
  uint8_t buf[4];
  id v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  AMSSetLogKeyIfNeeded();
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSKeychain keychainLabelForOptions:](AMSKeychain, "keychainLabelForOptions:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (_QWORD *)MEMORY[0x1E0CD6A00];
  v8 = (_QWORD *)MEMORY[0x1E0CD69F8];
  v9 = (_QWORD *)MEMORY[0x1E0CD6898];
  v10 = (_QWORD *)MEMORY[0x1E0CD6CC0];
  v11 = (_QWORD *)MEMORY[0x1E0CD6C98];
  v12 = (_QWORD *)MEMORY[0x1E0CD6A90];
  if (v6)
  {
    v13 = a1;
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v6, *v12);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("apple"), *v9);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", *v10, *v11);
    v15 = v8;
    objc_msgSend(v14, "setObject:forKeyedSubscript:", *v7, *v8);
    v16 = SecItemDelete((CFDictionaryRef)v14);
    v17 = v7;
    if ((_DWORD)v16)
    {
      if ((_DWORD)v16 == -25300)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v18)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v18, "OSLogObject");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v65 = (id)objc_opt_class();
          v66 = 2114;
          v67 = v54;
          v68 = 2114;
          v69 = v6;
          v20 = v65;
          _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Key (legacy) not found for label: %{public}@", buf, 0x20u);

        }
        v7 = v17;

        v50 = 0;
      }
      else
      {
        v23 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("Keypair Delete: Failed to delete legacy key. label: %@ status: %@ options: %@"), v6, v24, v5);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        AMSError(600, CFSTR("Keychain Error"), v25, 0);
        v50 = (id)objc_claimAutoreleasedReturnValue();

      }
      v12 = (_QWORD *)MEMORY[0x1E0CD6A90];
      v10 = (_QWORD *)MEMORY[0x1E0CD6CC0];
    }
    else
    {
      v50 = 0;
    }

    a1 = v13;
  }
  else
  {
    v15 = (_QWORD *)MEMORY[0x1E0CD69F8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Keypair Delete: Invalid keychain label for options: %@"), v5);
    v21 = v10;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    AMSError(600, CFSTR("Keychain Error"), v22, 0);
    v50 = (id)objc_claimAutoreleasedReturnValue();

    v10 = v21;
  }
  v52 = (void *)v6;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "ams_activeiTunesAccount");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (_QWORD *)MEMORY[0x1E0CD6C98];
  if (v55)
  {
    objc_msgSend(a1, "_ssKeychainLabelForAccount:options:", v55, v5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v28, "setObject:forKeyedSubscript:", *v7, *v15);
    objc_msgSend(v28, "setObject:forKeyedSubscript:", CFSTR("apple"), *MEMORY[0x1E0CD6898]);
    objc_msgSend(v28, "setObject:forKeyedSubscript:", *v10, *v26);
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v27, *v12);
    v29 = SecItemDelete((CFDictionaryRef)v28);
    if ((_DWORD)v29)
    {
      v30 = v29;
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v31)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v31, "OSLogObject");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (void *)objc_opt_class();
        v34 = (void *)MEMORY[0x1E0CB37E8];
        v35 = v33;
        objc_msgSend(v34, "numberWithInt:", v30);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v65 = v33;
        v66 = 2114;
        v67 = v54;
        v68 = 2114;
        v69 = (uint64_t)v36;
        _os_log_impl(&dword_18C849000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No deletion of legacy StoreServices keys with status: %{public}@", buf, 0x20u);

      }
    }

  }
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "ams_iTunesAccounts");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v38;
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v58;
    v42 = *MEMORY[0x1E0C92AD0];
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v58 != v41)
          objc_enumerationMutation(obj);
        v44 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        v45 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v44, "ams_DSID");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "stringWithFormat:", CFSTR("mt-tid-%@"), v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        v61 = v42;
        v62 = v47;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "ams_removeCookiesMatchingProperties:", v48);

      }
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
    }
    while (v40);
  }

  if (a4)
    *a4 = objc_retainAutorelease(v50);

  return v50 == 0;
}

+ (id)legacyAttestationForOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  _BOOL4 v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "regenerateKeys"))
  {
    +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
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
      v8 = (void *)objc_opt_class();
      v9 = v8;
      AMSSetLogKeyIfNeeded();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v8;
      v41 = 2112;
      v42 = v10;
      v43 = 2114;
      v44 = v5;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%@] WARNING - Property options.generateKeys is ignored at this layer: %{public}@", buf, 0x20u);

    }
  }
  v38 = 0;
  +[AMSKeychain _legacyAttestationForOptions:error:](AMSKeychain, "_legacyAttestationForOptions:error:", v5, &v38);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v38;
  if (v12)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_opt_class();
      v16 = v15;
      AMSSetLogKeyIfNeeded();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v15;
      v41 = 2114;
      v42 = v17;
      v43 = 2114;
      v44 = v12;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Attestation failed with error: %{public}@", buf, 0x20u);

    }
  }
  if (objc_msgSend(v12, "ams_hasDomain:code:", *MEMORY[0x1E0CA9B28], -3))
  {
    +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_opt_class();
      v21 = v20;
      AMSSetLogKeyIfNeeded();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v40 = v20;
      v41 = 2114;
      v42 = v22;
      v43 = 2112;
      v44 = v5;
      v45 = 2112;
      v46 = v12;
      _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attestation failed with options: %@, error: %@", buf, 0x2Au);

    }
    v37 = 0;
    v23 = +[AMSKeychain _generateLegacyKeypairForOptions:error:](AMSKeychain, "_generateLegacyKeypairForOptions:error:", v5, &v37);
    v24 = v37;
    if (v23)
    {
      v36 = v24;
      +[AMSKeychain _legacyAttestationForOptions:error:](AMSKeychain, "_legacyAttestationForOptions:error:", v5, &v36);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v36;

      if (!v26)
      {
        v11 = (void *)v25;
        if (!a4)
          goto LABEL_32;
        goto LABEL_31;
      }
      +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v27)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v27, "OSLogObject");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = (void *)objc_opt_class();
        v30 = v29;
        AMSSetLogKeyIfNeeded();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v40 = v29;
        v41 = 2114;
        v42 = v31;
        v43 = 2114;
        v44 = v26;
        _os_log_impl(&dword_18C849000, v28, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Re-attestation failed with error: %{public}@", buf, 0x20u);

      }
    }
    else
    {
      +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v27)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v27, "OSLogObject");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v32 = (void *)objc_opt_class();
        v33 = v32;
        AMSSetLogKeyIfNeeded();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v40 = v32;
        v41 = 2114;
        v42 = v34;
        v43 = 2114;
        v44 = v24;
        _os_log_impl(&dword_18C849000, v28, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Re-generation of keys failed with error: %{public}@", buf, 0x20u);

      }
      v26 = v24;
      v25 = (uint64_t)v11;
    }

    v11 = (void *)v25;
  }
  if (a4)
LABEL_31:
    *a4 = objc_retainAutorelease(v12);
LABEL_32:

  return v11;
}

+ (id)certificateKeychainLabelsForOptions:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  unint64_t v11;
  const __CFString *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "clientCertLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intermediateCertLabel");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v5 || !v6)
  {
    v8 = objc_msgSend(v3, "purpose");
    if (v8 == 1)
    {
      v11 = objc_msgSend(v3, "style");
      if (v11 > 5 || ((1 << v11) & 0x31) == 0)
        goto LABEL_15;
      v10 = CFSTR("com.apple.AppleMediaServices.cert.X509.client.extended");
    }
    else
    {
      if (v8)
        goto LABEL_15;
      v9 = objc_msgSend(v3, "style");
      if ((unint64_t)(v9 - 4) >= 2)
      {
        if (v9 == 3)
        {
          objc_msgSend(v4, "addObject:", CFSTR("com.apple.AppleMediaServices.cert.watch.client.primary"));
          v12 = CFSTR("com.apple.AppleMediaServices.cert.watch.intermediate.primary");
          goto LABEL_14;
        }
        if (v9)
          goto LABEL_15;
      }
      v10 = CFSTR("com.apple.AppleMediaServices.cert.X509.client.primary");
    }
    objc_msgSend(v4, "addObject:", v10);
    v12 = CFSTR("com.apple.AppleMediaServices.cert.X509.client.intermediate");
LABEL_14:
    objc_msgSend(v4, "addObject:", v12);
    goto LABEL_20;
  }
  objc_msgSend(v4, "addObject:", v5);
  objc_msgSend(v4, "addObject:", v7);
LABEL_15:
  +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "OSLogObject");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = objc_opt_class();
    AMSSetLogKeyIfNeeded();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "purpose"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "style"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138544130;
    v22 = v15;
    v23 = 2114;
    v24 = v16;
    v25 = 2114;
    v26 = v17;
    v27 = 2114;
    v28 = v18;
    _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to generate certificate keychain labels for keychain options: %{public}@ %{public}@", (uint8_t *)&v21, 0x2Au);

  }
LABEL_20:
  v19 = (void *)objc_msgSend(v4, "copy");

  return v19;
}

+ (id)keychainLabelForOptions:(id)a3
{
  id v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "style") != 1 && objc_msgSend(v3, "style") != 2)
    goto LABEL_6;
  v4 = objc_msgSend(v3, "purpose");
  if (!v4)
  {
    v5 = CFSTR("com.apple.AppleMediaServices.primaryKey");
    goto LABEL_12;
  }
  if (v4 == 1)
  {
    v5 = CFSTR("com.apple.AppleMediaServices.extendedKey");
  }
  else
  {
LABEL_6:
    +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_opt_class();
      AMSSetLogKeyIfNeeded();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "purpose"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "style"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138544130;
      v14 = v8;
      v15 = 2114;
      v16 = v9;
      v17 = 2114;
      v18 = v10;
      v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to generate legacy keychain label for keychain options: %{public}@ %{public}@", (uint8_t *)&v13, 0x2Au);

    }
    v5 = 0;
  }
LABEL_12:

  return (id)v5;
}

+ (__SecAccessControl)copyAccessControlRefWithAccount:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id *v10;
  __SecKey *v11;
  __SecKey *v12;
  id v13;
  const __CFDictionary *v14;
  const __CFDictionary *v15;
  const void *Value;
  const void *v17;
  CFTypeID TypeID;
  __SecAccessControl *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  __SecAccessControl *v24;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  AMSSetLogKeyIfNeeded();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "style")
    || objc_msgSend(v8, "style") == 4
    || objc_msgSend(v8, "style") == 3
    || objc_msgSend(v8, "style") == 5)
  {
    v35 = 0;
    v10 = (id *)&v35;
    v11 = +[AMSKeychain copyCertificatePrivateKeyWithContext:account:options:error:](AMSKeychain, "copyCertificatePrivateKeyWithContext:account:options:error:", 0, v7, v8, &v35);
  }
  else
  {
    v34 = 0;
    v10 = (id *)&v34;
    v11 = +[AMSKeychain copyPrivateKeyWithContext:account:options:error:](AMSKeychain, "copyPrivateKeyWithContext:account:options:error:", 0, v7, v8, &v34);
  }
  v12 = v11;
  v13 = *v10;
  if (!v13 && v12)
  {
    v14 = SecKeyCopyAttributes(v12);
    if (v14)
    {
      v15 = v14;
      Value = CFDictionaryGetValue(v14, (const void *)*MEMORY[0x1E0CD6890]);
      if (Value && (v17 = Value, TypeID = SecAccessControlGetTypeID(), TypeID == CFGetTypeID(v17)))
      {
        v19 = (__SecAccessControl *)CFRetain(v17);
      }
      else
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v26)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v26, "OSLogObject");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v37 = v28;
          v38 = 2114;
          v39 = v9;
          v29 = v28;
          _os_log_impl(&dword_18C849000, v27, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] ACL lookup failed for no ACL associated with key", buf, 0x16u);

        }
        v19 = 0;
      }
      CFRelease(v15);
    }
    else
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v30, "OSLogObject");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v37 = v32;
        v38 = 2114;
        v39 = v9;
        v33 = v32;
        _os_log_impl(&dword_18C849000, v31, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] ACL lookup failed to fetch key attributes", buf, 0x16u);

      }
      v19 = 0;
    }
    goto LABEL_31;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v20, "OSLogObject");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v22 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543874;
    v37 = v22;
    v38 = 2114;
    v39 = v9;
    v40 = 2114;
    v41 = v13;
    v23 = v22;
    _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] ACL lookup failed for no private key: %{public}@", buf, 0x20u);

  }
  v19 = 0;
  v24 = 0;
  if (v12)
  {
LABEL_31:
    CFRelease(v12);
    v24 = v19;
    if (!a5)
      goto LABEL_19;
    goto LABEL_18;
  }
  if (a5)
LABEL_18:
    *a5 = objc_retainAutorelease(v13);
LABEL_19:

  return v24;
}

+ (__SecAccessControl)createAccessControlRefWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  __CFError *v12;
  SecAccessControlRef v13;
  __SecAccessControl *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  CFErrorRef v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  __CFString *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  CFErrorRef error;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  CFErrorRef v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  AMSSetLogKeyIfNeeded();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_opt_class();
    objc_msgSend(v6, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v11);
    v12 = (__CFError *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v36 = v10;
    v37 = 2114;
    v38 = v7;
    v39 = 2112;
    v40 = v12;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Creating access control reference with options: %@", buf, 0x20u);

  }
  error = 0;
  v13 = SecAccessControlCreateWithFlags((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFTypeRef)*MEMORY[0x1E0CD68F0], 0x40000000uLL, &error);
  v14 = v13;
  if (error)
  {
    +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v36 = v17;
      v37 = 2114;
      v38 = v7;
      v39 = 2114;
      v40 = error;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create access controll reference with error: %{public}@", buf, 0x20u);
    }

    v18 = error;
    v19 = error;
    if (error)
      goto LABEL_11;
    goto LABEL_12;
  }
  if (!v13)
  {
    +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v23, "OSLogObject");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v36 = v25;
      v37 = 2114;
      v38 = v7;
      _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create access control reference", buf, 0x16u);
    }

    v26 = CFSTR("Create ACL: Failed to create ACL reference");
    goto LABEL_36;
  }
  v21 = objc_msgSend(v6, "purpose");
  if (v21 == 1)
  {
    objc_msgSend(a1, "_extendedConstraintsWithOptions:", v6);
    v22 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v21)
    {
LABEL_31:
      +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v31)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v31, "OSLogObject");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v36 = v33;
        v37 = 2114;
        v38 = v7;
        _os_log_impl(&dword_18C849000, v32, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create ACL constraints", buf, 0x16u);
      }

      v26 = CFSTR("Create ACL: Failed to create ACL constraints");
LABEL_36:
      AMSError(600, CFSTR("Keychain Error"), v26, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    }
    objc_msgSend(a1, "_primaryConstraintsWithOptions:", v6);
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v22;
  if (!v22)
    goto LABEL_31;
  SecAccessControlSetConstraints();
  +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v28)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v28, "OSLogObject");
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v36 = v30;
    v37 = 2114;
    v38 = v7;
    _os_log_impl(&dword_18C849000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully configured ACL constraints", buf, 0x16u);
  }

  v19 = 0;
LABEL_37:
  v18 = error;
  if (error)
LABEL_11:
    CFRelease(v18);
LABEL_12:
  if (a4)
    *a4 = objc_retainAutorelease(v19);

  return v14;
}

+ (id)_extendedConstraintsWithOptions:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  AMSSetLogKeyIfNeeded();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "style");

  if (v5 == 3)
  {
    +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v21 = objc_opt_class();
      v22 = 2114;
      v23 = v4;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Extended ACL is not supported on watchOS", buf, 0x16u);
    }
    v8 = 0;
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18 = CFSTR("pbioc");
    v9 = (void *)objc_opt_new();
    v19 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("cbio"));

    objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E25AF5F0, CFSTR("pmuc"));
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v16 = CFSTR("pbioc");
    v11 = (void *)objc_opt_new();
    v17 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v12, CFSTR("cbio"), v16);

    -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", &unk_1E25AF5F0, CFSTR("pmuc"));
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("oa"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v6, CFSTR("ock"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("odel"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v7, CFSTR("osgn"));
    v8 = (void *)objc_msgSend(v13, "copy");

  }
  return v8;
}

+ (id)_primaryConstraints
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E25AF608, CFSTR("pkofn"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E25AF608, CFSTR("pmuc"));
  v24[0] = CFSTR("pbioc");
  v3 = (void *)objc_opt_new();
  v24[1] = CFSTR("pbiot");
  v25[0] = v3;
  v25[1] = &unk_1E25AF608;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("cbio"));

  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("cbtn"));
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E25AF608, CFSTR("pmuc"));
  v22[0] = CFSTR("pbioc");
  v6 = (void *)objc_opt_new();
  v22[1] = CFSTR("pbiot");
  v23[0] = v6;
  v23[1] = &unk_1E25AF5F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("cbio"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v2, CFSTR("ckon"));
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E25AF608, CFSTR("pkofn"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E25AF608, CFSTR("pmuc"));
  v20[0] = CFSTR("pbioc");
  v9 = (void *)objc_opt_new();
  v20[1] = CFSTR("pbiot");
  v21[0] = v9;
  v21[1] = &unk_1E25AF608;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("cbio"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("cbtn"));
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1E25AF5F0, CFSTR("pkofn"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1E25AF5F0, CFSTR("pmoc"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1E25AF608, CFSTR("pmuc"));
  v18[0] = CFSTR("pbioc");
  v12 = (void *)objc_opt_new();
  v18[1] = CFSTR("pbiot");
  v19[0] = v12;
  v19[1] = &unk_1E25AF5F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("cbio"));

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("ckon"));
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("oa"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v5, CFSTR("ock"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("odel"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, CFSTR("osgn"));
  v16 = (void *)objc_msgSend(v14, "copy");

  return v16;
}

+ (id)_primaryConstraintsForMac
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:");
  objc_msgSend(v2, "setObject:forKeyedSubscript:");
  v24[0] = CFSTR("pbioc");
  v3 = (void *)objc_opt_new();
  v24[1] = CFSTR("pbiot");
  v25[0] = v3;
  v25[1] = &unk_1E25AF608;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("cbio"));

  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("cbtn"));
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E25AF5F0, CFSTR("pkofn"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E25AF5F0, CFSTR("pmuc"));
  v22[0] = CFSTR("pbioc");
  v6 = (void *)objc_opt_new();
  v22[1] = CFSTR("pbiot");
  v23[0] = v6;
  v23[1] = &unk_1E25AF5F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("cbio"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v2, CFSTR("ckon"));
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E25AF608, CFSTR("pkofn"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E25AF5F0, CFSTR("pmuc"));
  v20[0] = CFSTR("pbioc");
  v9 = (void *)objc_opt_new();
  v20[1] = CFSTR("pbiot");
  v21[0] = v9;
  v21[1] = &unk_1E25AF608;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("cbio"));

  v11 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("cbtn"));
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E25AF5F0, CFSTR("pkofn"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E25AF5F0, CFSTR("pmuc"));
  v18[0] = CFSTR("pbioc");
  v13 = (void *)objc_opt_new();
  v18[1] = CFSTR("pbiot");
  v19[0] = v13;
  v19[1] = &unk_1E25AF5F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("cbio"));

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("ckon"));
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, CFSTR("oa"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v5, CFSTR("ock"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, CFSTR("odel"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, CFSTR("osgn"));
  v16 = (void *)objc_msgSend(v15, "copy");

  return v16;
}

+ (id)_primaryConstraintsForOpticID
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E25AF608, CFSTR("pmuc"));
  v14[0] = CFSTR("pbioc");
  v3 = (void *)objc_opt_new();
  v14[1] = CFSTR("pbiot");
  v15[0] = v3;
  v15[1] = &unk_1E25AF620;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("cbio"));

  v5 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("cbtn"));
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E25AF5F0, CFSTR("pmoc"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E25AF608, CFSTR("pmuc"));
  v12[0] = CFSTR("pbioc");
  v7 = (void *)objc_opt_new();
  v12[1] = CFSTR("pbiot");
  v13[0] = v7;
  v13[1] = &unk_1E25AF620;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("cbio"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("cbtn"));
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, CFSTR("oa"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v2, CFSTR("ock"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, CFSTR("odel"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("osgn"));
  v10 = (void *)objc_msgSend(v9, "copy");

  return v10;
}

+ (id)_primaryConstraintsForWatch
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("oa"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("ock"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("odel"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("osgn"));
  v6 = (void *)objc_msgSend(v4, "copy");

  return v6;
}

+ (id)_primaryConstraintsWithOptions:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "style");
  switch((unint64_t)v4)
  {
    case 0uLL:
    case 1uLL:
      objc_msgSend(a1, "_primaryConstraints");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
    case 4uLL:
      objc_msgSend(a1, "_primaryConstraintsForMac");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      objc_msgSend(a1, "_primaryConstraintsForWatch");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5uLL:
      objc_msgSend(a1, "_primaryConstraintsForOpticID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v4;
  }
  return v4;
}

+ (id)_ssCertificateKeychainLabelForAccount:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "_ssKeychainLabelForAccount:options:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-cert"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
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
      v11 = (void *)objc_opt_class();
      v12 = v11;
      AMSSetLogKeyIfNeeded();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v16 = v11;
      v17 = 2114;
      v18 = v13;
      v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did not find legacy StoreServices certificate label for options: %{public}@", buf, 0x20u);

    }
    v8 = 0;
  }

  return v8;
}

+ (id)_ssKeychainLabelForAccount:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "purpose");
  if (v7 == 1)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "ams_DSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("com.apple.itunesstored:%@-ext"), v9);
    goto LABEL_5;
  }
  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "ams_DSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("com.apple.itunesstored:%@"), v9);
LABEL_5:
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
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
    v14 = (void *)objc_opt_class();
    v15 = v14;
    AMSSetLogKeyIfNeeded();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = v14;
    v20 = 2114;
    v21 = v16;
    v22 = 2114;
    v23 = v6;
    _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did not find legacy StoreServices keychain label for options: %{public}@", buf, 0x20u);

  }
  v11 = 0;
LABEL_11:

  return v11;
}

+ (id)_certificatePrivateKeyLabelForOptions:(id)a3
{
  id v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "style")
    && objc_msgSend(v3, "style") != 4
    && objc_msgSend(v3, "style") != 5
    && objc_msgSend(v3, "style") != 3)
  {
    goto LABEL_8;
  }
  v4 = objc_msgSend(v3, "purpose");
  if (!v4)
  {
    v5 = CFSTR("com.apple.AppleMediaServices.cert.X509.primary");
    goto LABEL_14;
  }
  if (v4 == 1)
  {
    v5 = CFSTR("com.apple.AppleMediaServices.cert.X509.extended");
  }
  else
  {
LABEL_8:
    +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_opt_class();
      AMSSetLogKeyIfNeeded();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "purpose"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "style"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138544130;
      v14 = v8;
      v15 = 2114;
      v16 = v9;
      v17 = 2114;
      v18 = v10;
      v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to generate certificate privateKey keychain labels. options: %{public}@ %{public}@", (uint8_t *)&v13, 0x2Au);

    }
    v5 = 0;
  }
LABEL_14:

  return (id)v5;
}

+ (__SecKey)_copyLegacyPrivateKeyForOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id *v15;
  id v16;
  void *v17;
  void *v18;
  __SecKey *v19;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  __SecKey *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v25 = 0;
  +[AMSKeychain keychainLabelForOptions:](AMSKeychain, "keychainLabelForOptions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6A00], *MEMORY[0x1E0CD69F8]);
  objc_msgSend(v7, "ams_setNullableObject:forKey:", v6, *MEMORY[0x1E0CD6A90]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CC0], *MEMORY[0x1E0CD6C98]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("apple"), *MEMORY[0x1E0CD6898]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7028]);
  objc_msgSend(v5, "prompt");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_setNullableObject:forKey:", v8, *MEMORY[0x1E0CD70B8]);

  v9 = AMSSecItemCopyMatchingWithTimeFault(v7, (uint64_t)&v25);
  if ((_DWORD)v9)
  {
    v10 = v9;
    AMSKeychainError(CFSTR("Private Key: Failed to lookup private key"), (int)v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
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
      v14 = (void *)objc_opt_class();
      v24 = v6;
      v15 = a4;
      v16 = v14;
      AMSSetLogKeyIfNeeded();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v27 = v14;
      v28 = 2114;
      v29 = v17;
      v30 = 2112;
      v31 = v5;
      v32 = 2114;
      v33 = v18;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did not find private key with options: %@, status: %{public}@", buf, 0x2Au);

      a4 = v15;
      v6 = v24;
    }
  }
  else
  {
    if (v25)
    {
      v11 = 0;
      if (!a4)
        goto LABEL_8;
      goto LABEL_7;
    }
    AMSError(600, CFSTR("Keychain Error"), CFSTR("Private Key: Failed to lookup private key"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
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
      v21 = (void *)objc_opt_class();
      v22 = v21;
      AMSSetLogKeyIfNeeded();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v21;
      v28 = 2114;
      v29 = v23;
      v30 = 2112;
      v31 = v5;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did not find private key with options: %@", buf, 0x20u);

    }
  }

  if (a4)
LABEL_7:
    *a4 = objc_retainAutorelease(v11);
LABEL_8:
  v19 = v25;

  return v19;
}

+ (__SecKey)_copyLegacyPublicKeyForOptions:(id)a3 error:(id *)a4
{
  __SecKey *v5;
  id v6;
  __SecKey *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v5 = +[AMSKeychain _copyLegacyPrivateKeyForOptions:error:](AMSKeychain, "_copyLegacyPrivateKeyForOptions:error:", a3, &v18);
  v6 = v18;
  if (!v5)
  {
    v7 = 0;
    if (!a4)
      goto LABEL_16;
    goto LABEL_15;
  }
  v7 = SecKeyCopyPublicKey(v5);
  if (v7)
  {
    +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_opt_class();
      v11 = v10;
      AMSSetLogKeyIfNeeded();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v10;
      v21 = 2114;
      v22 = v12;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully copied public key", buf, 0x16u);

    }
    v13 = (uint64_t)v6;
  }
  else
  {
    AMSError(600, CFSTR("Keychain Error"), CFSTR("Public Key: Failed to copy public key"), 0);
    v13 = objc_claimAutoreleasedReturnValue();

    +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_opt_class();
      v15 = v14;
      AMSSetLogKeyIfNeeded();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v14;
      v21 = 2114;
      v22 = v16;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to copy public key representation", buf, 0x16u);

    }
  }

  CFRelease(v5);
  v6 = (id)v13;
  if (a4)
LABEL_15:
    *a4 = objc_retainAutorelease(v6);
LABEL_16:

  return v7;
}

+ (void)_deleteResumptionHeaders
{
  const __CFDictionary *v2;
  uint64_t v3;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_resumptionHeadersQuery");
  v2 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v3 = SecItemDelete(v2);
  if ((_DWORD)v3 != -25303 && (_DWORD)v3 != -25300 && (_DWORD)v3 != 0)
  {
    v6 = v3;
    +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
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
      v9 = (void *)objc_opt_class();
      v10 = v9;
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v9;
      v15 = 2114;
      v16 = v11;
      v17 = 2114;
      v18 = v12;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to delete resumption headers. %{public}@", (uint8_t *)&v13, 0x20u);

    }
  }

}

+ (BOOL)_generateLegacyKeypairForOptions:(id)a3 error:(id *)a4
{
  id v5;
  __CFError *v6;
  __CFError *v7;
  BOOL v8;
  SecAccessControlRef v9;
  BOOL v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  OSStatus v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  CFErrorRef error;
  SecKeyRef publicKey;
  SecKeyRef privateKey;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  publicKey = 0;
  privateKey = 0;
  error = 0;
  v46 = 0;
  objc_msgSend((id)objc_opt_class(), "deleteKeyPairWithOptions:error:", v5, &v46);
  v6 = (__CFError *)v46;
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    goto LABEL_39;
  }
  v9 = SecAccessControlCreateWithFlags((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFTypeRef)*MEMORY[0x1E0CD68F0], 0x40000002uLL, &error);
  if (v9)
    v10 = error == 0;
  else
    v10 = 0;
  if (v10)
  {
    v16 = objc_msgSend(v5, "purpose");
    if (v16 == 1)
    {
      +[AMSKeychain _extendedConstraintsWithOptions:](AMSKeychain, "_extendedConstraintsWithOptions:", v5);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v16)
        goto LABEL_26;
      +[AMSKeychain _primaryConstraintsWithOptions:](AMSKeychain, "_primaryConstraintsWithOptions:", v5);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    if (v17)
    {
      v45 = (void *)v17;
      SecAccessControlSetConstraints();
      +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v18, "OSLogObject");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (void *)objc_opt_class();
        v21 = v20;
        AMSSetLogKeyIfNeeded();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v51 = v20;
        v52 = 2114;
        v53 = (uint64_t)v22;
        v54 = 2112;
        v55 = v5;
        _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Configured keypair ACL constraints for options: %@", buf, 0x20u);

      }
      +[AMSKeychain keychainLabelForOptions:](AMSKeychain, "keychainLabelForOptions:", v5);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CD6890]);
      objc_msgSend(v24, "setObject:forKeyedSubscript:", CFSTR("apple"), *MEMORY[0x1E0CD6898]);
      objc_msgSend(v24, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD69D8]);
      v44 = (void *)v23;
      objc_msgSend(v24, "ams_setNullableObject:forKey:", v23, *MEMORY[0x1E0CD6A90]);
      v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v25, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6BB0], *MEMORY[0x1E0CD6B98]);
      objc_msgSend(v25, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6A50], *MEMORY[0x1E0CD6A38]);
      objc_msgSend(v25, "setObject:forKeyedSubscript:", &unk_1E25AF638, *MEMORY[0x1E0CD6A20]);
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0CD6FC0]);
      v26 = SecKeyGeneratePair((CFDictionaryRef)v25, &publicKey, &privateKey);
      v8 = v26 == 0;
      if (v26)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "OSLogObject");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = (void *)objc_opt_class();
          v42 = v29;
          AMSSetLogKeyIfNeeded();
          v30 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v51 = v29;
          v52 = 2114;
          v53 = v30;
          v31 = (void *)v30;
          _os_log_impl(&dword_18C849000, v28, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@]: Failed to create keypair", buf, 0x16u);

        }
        AMSKeychainError(CFSTR("Generate Keypair: Failed to generate keypair"), v26);
        v7 = (__CFError *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v37)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v37, "OSLogObject");
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v39 = (void *)objc_opt_class();
          v43 = v39;
          AMSSetLogKeyIfNeeded();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v51 = v39;
          v52 = 2114;
          v53 = (uint64_t)v40;
          v54 = 2112;
          v55 = v5;
          _os_log_impl(&dword_18C849000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Keypair generated for options: %@", buf, 0x20u);

        }
        v7 = 0;
      }

      goto LABEL_37;
    }
LABEL_26:
    +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v32, "OSLogObject");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = (void *)objc_opt_class();
      v35 = v34;
      AMSSetLogKeyIfNeeded();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v51 = v34;
      v52 = 2114;
      v53 = (uint64_t)v36;
      v54 = 2112;
      v55 = v5;
      _os_log_impl(&dword_18C849000, v33, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to sepecify access control constraints for options: %@", buf, 0x20u);

    }
    AMSError(600, CFSTR("Keychain Error"), CFSTR("Generate Keypair: Failed to generate ACL constraints"), 0);
    v7 = (__CFError *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_37;
  }
  v7 = error;
  +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_opt_class();
    v14 = v13;
    AMSSetLogKeyIfNeeded();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v51 = v13;
    v52 = 2114;
    v53 = (uint64_t)v15;
    _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to generate access control reference", buf, 0x16u);

  }
  v8 = 0;
  if (v9)
  {
LABEL_37:
    CFRelease(v9);
    if (privateKey)
      CFRelease(privateKey);
  }
LABEL_39:
  if (publicKey)
    CFRelease(publicKey);
  if (error)
    CFRelease(error);
  if (a4)
    *a4 = objc_retainAutorelease(v7);

  return v8;
}

+ (id)_legacyAttestationForOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  __SecKey *v7;
  id v8;
  uint64_t v9;
  const void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t Attestation;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  CFTypeRef cf;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  cf = 0;
  if (objc_msgSend(v5, "style") == 1 || objc_msgSend(v5, "style") == 2)
  {
    +[AMSKeychain keychainLabelForOptions:](AMSKeychain, "keychainLabelForOptions:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Keychain Attestation: Invalid keychain label for options: %@"), v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      AMSError(600, CFSTR("Keychain Error"), v13, 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_29:
      v12 = 0;
LABEL_45:
      if (a4)
        *a4 = objc_retainAutorelease(v11);
      v20 = v12;

      v21 = v20;
      goto LABEL_48;
    }
    v52 = 0;
    v7 = +[AMSKeychain _copyLegacyPrivateKeyForOptions:error:](AMSKeychain, "_copyLegacyPrivateKeyForOptions:error:", v5, &v52);
    v8 = v52;
    if (!v7)
    {
      +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v22, "OSLogObject");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (void *)objc_opt_class();
        v48 = v24;
        AMSSetLogKeyIfNeeded();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v55 = v24;
        v56 = 2114;
        v57 = (uint64_t)v25;
        v58 = 2112;
        v59 = v5;
        v60 = 2114;
        v61 = v8;
        _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did not find private key for options: %@, error: %{public}@", buf, 0x2Au);

      }
      v51 = v8;
      v26 = +[AMSKeychain _generateLegacyKeypairForOptions:error:](AMSKeychain, "_generateLegacyKeypairForOptions:error:", v5, &v51);
      v11 = v51;

      if (!v26)
        goto LABEL_24;
      +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v27)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v27, "OSLogObject");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = (void *)objc_opt_class();
        v47 = v29;
        AMSSetLogKeyIfNeeded();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v55 = v29;
        v56 = 2114;
        v57 = (uint64_t)v30;
        v58 = 2112;
        v59 = v5;
        _os_log_impl(&dword_18C849000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting second lookup for private key for options: %@", buf, 0x20u);

      }
      v50 = v11;
      v7 = +[AMSKeychain _copyLegacyPrivateKeyForOptions:error:](AMSKeychain, "_copyLegacyPrivateKeyForOptions:error:", v5, &v50);
      v8 = v50;

      v11 = v8;
      if (!v7)
      {
LABEL_24:
        +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v31)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v31, "OSLogObject");
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = (void *)objc_opt_class();
          v34 = v33;
          AMSSetLogKeyIfNeeded();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v55 = v33;
          v56 = 2114;
          v57 = (uint64_t)v35;
          v58 = 2112;
          v59 = v5;
          _os_log_impl(&dword_18C849000, v32, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to generate private key for options: %@", buf, 0x20u);

        }
        goto LABEL_29;
      }
    }
    v9 = SecKeyCopySystemKey();
    v10 = (const void *)v9;
    if (cf)
    {
      v11 = (id)cf;

      v12 = 0;
      if (!v10)
      {
LABEL_43:
        CFRelease(v7);
        if (cf)
          CFRelease(cf);
        goto LABEL_45;
      }
    }
    else
    {
      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Keychain Attestation: Attesting key lookup failed for options: %@"), v5);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        AMSError(600, CFSTR("Keychain Error"), v39, 0);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        v12 = 0;
        goto LABEL_43;
      }
      Attestation = SecKeyCreateAttestation();
      v37 = (void *)Attestation;
      if (cf)
      {
        v11 = (id)cf;

        v38 = 0;
        v12 = 0;
        if (!v37)
          goto LABEL_42;
      }
      else
      {
        if (!Attestation)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Keychain Attestation: Failed to create attestation data for options: %@"), v5);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          AMSError(600, CFSTR("Keychain Error"), v46, 0);
          v11 = (id)objc_claimAutoreleasedReturnValue();

          v12 = 0;
          goto LABEL_42;
        }
        +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v40)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v40, "OSLogObject");
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          v42 = (void *)objc_opt_class();
          v49 = v42;
          AMSSetLogKeyIfNeeded();
          v43 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v55 = v42;
          v56 = 2114;
          v57 = v43;
          v44 = (void *)v43;
          v58 = 2112;
          v59 = v5;
          _os_log_impl(&dword_18C849000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Generating attestation for options: %@", buf, 0x20u);

        }
        objc_msgSend(v37, "base64EncodedStringWithOptions:", 0);
        v38 = objc_claimAutoreleasedReturnValue();
        v11 = v8;
      }
      CFRelease(v37);
      v12 = (void *)v38;
    }
LABEL_42:
    CFRelease(v10);
    goto LABEL_43;
  }
  +[AMSLogConfig sharedKeychainConfig](AMSLogConfig, "sharedKeychainConfig");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "OSLogObject");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_opt_class();
    v17 = v16;
    AMSSetLogKeyIfNeeded();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "style"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v55 = v16;
    v56 = 2114;
    v57 = (uint64_t)v18;
    v58 = 2114;
    v59 = v19;
    _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] ** WARNING ** Failing attestation for incorrect attestation style: %{public}@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Keychain Attestation: Invalid attestation style for options: %@"), v5);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  AMSError(600, CFSTR("Keychain Error"), v20, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v21 = 0;
LABEL_48:

  return v21;
}

+ (id)_resumptionHeadersQuery
{
  id v2;
  uint64_t v3;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD70A8]);
  v3 = *MEMORY[0x1E0CD6898];
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("apple"), *MEMORY[0x1E0CD6898]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.AppleMediaServices.resumptionHeaders"), *MEMORY[0x1E0CD6B58]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CA8], *MEMORY[0x1E0CD6C98]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("apple"), v3);
  return v2;
}

+ (id)publicKeyHeaderWithAccount:(id)a3 options:(id)a4 signatureResult:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  AMSDaemonConnection *v28;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__40;
  v27 = __Block_byref_object_dispose__40;
  v28 = objc_alloc_init(AMSDaemonConnection);
  objc_msgSend((id)v24[5], "keychainServiceProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __66__AMSKeychain_publicKeyHeaderWithAccount_options_signatureResult___block_invoke;
  v18[3] = &unk_1E2542760;
  v11 = v7;
  v19 = v11;
  v12 = v8;
  v20 = v12;
  v13 = v9;
  v21 = v13;
  v22 = &v23;
  objc_msgSend(v10, "thenWithBlock:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v14, "resultWithError:", &v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v23, 8);
  return v15;
}

AMSMutablePromise *__66__AMSKeychain_publicKeyHeaderWithAccount_options_signatureResult___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  AMSMutablePromise *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AMSMutablePromise *v8;
  uint64_t v9;
  _QWORD v11[4];
  AMSMutablePromise *v12;
  uint64_t v13;

  v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  v5 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__AMSKeychain_publicKeyHeaderWithAccount_options_signatureResult___block_invoke_2;
  v11[3] = &unk_1E2542738;
  v8 = v4;
  v9 = a1[7];
  v12 = v8;
  v13 = v9;
  objc_msgSend(v3, "getPublicKeyHeaderWithAccount:options:signatureResult:completion:", v5, v6, v7, v11);

  return v8;
}

void __66__AMSKeychain_publicKeyHeaderWithAccount_options_signatureResult___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = *(void **)(a1 + 32);
  if (a3)
    objc_msgSend(v4, "finishWithError:");
  else
    objc_msgSend(v4, "finishWithResult:", a2);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

}

+ (void)secItemAddFunc
{
  return (void *)_secItemAddFunc;
}

+ (void)setSecItemAddFunc:(void *)a3
{
  if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
    _secItemAddFunc = (uint64_t)a3;
}

+ (void)secItemCopyMatchingFunc
{
  return _secItemCopyMatchingFunc;
}

+ (void)setSecItemCopyMatchingFunc:(void *)a3
{
  if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
    _secItemCopyMatchingFunc = (uint64_t (*)(_QWORD, _QWORD))a3;
}

@end

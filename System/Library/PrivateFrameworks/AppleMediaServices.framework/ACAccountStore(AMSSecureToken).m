@implementation ACAccountStore(AMSSecureToken)

+ (CFTypeRef)_baseQueryDictionaryForIdentifier:()AMSSecureToken numValues:
{
  void *v4;
  void *v5;
  void *v6;
  CFDictionaryRef v7;
  void *values[5];
  void *keys[6];

  keys[5] = *(void **)MEMORY[0x1E0C80C00];
  v4 = (void *)*MEMORY[0x1E0CD6898];
  keys[0] = *(void **)MEMORY[0x1E0CD68F8];
  keys[1] = v4;
  values[0] = a3;
  values[1] = CFSTR("apple");
  v5 = (void *)*MEMORY[0x1E0C9AE50];
  v6 = (void *)*MEMORY[0x1E0CD6B58];
  keys[2] = *(void **)MEMORY[0x1E0CD70A8];
  keys[3] = v6;
  values[2] = v5;
  values[3] = CFSTR("com.apple.itunesstored.token");
  keys[4] = *(void **)MEMORY[0x1E0CD6C98];
  values[4] = *(void **)MEMORY[0x1E0CD6CA8];
  if (a4)
    *a4 = 5;
  v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, (const void **)values, 5, 0, 0);
  return CFAutorelease(v7);
}

+ (id)_secureTokenForIdentifier:()AMSSecureToken error:
{
  id v6;
  const __CFDictionary *v7;
  __CFDictionary *MutableCopy;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v37;
  CFTypeRef result;
  uint64_t v39;
  const __CFString *v40;
  void *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v39 = 0;
    v7 = (const __CFDictionary *)objc_msgSend(a1, "_baseQueryDictionaryForIdentifier:numValues:", v6, &v39);
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v39 + 1, v7);
    CFDictionaryAddValue(MutableCopy, (const void *)*MEMORY[0x1E0CD7018], (const void *)*MEMORY[0x1E0C9AE50]);
    result = 0;
    v9 = SecItemCopyMatching(MutableCopy, &result);
    v10 = (void *)result;
    if ((_DWORD)v9 == -25300)
    {
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
        AMSLogKey();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0CB3940];
        v17 = objc_opt_class();
        v18 = v17;
        if (v15)
        {
          AMSLogKey();
          a1 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: [%@] "), v18, a1);
        }
        else
        {
          objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: "), v17);
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v19;
        v44 = 2114;
        v45 = v6;
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_INFO, "%{public}@We don't have a secure token stored for %{public}@.", buf, 0x16u);
        if (v15)
        {

          v19 = a1;
        }

      }
    }
    else
    {
      v11 = v9;
      if ((_DWORD)v9)
      {
        +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
          AMSLogKey();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)MEMORY[0x1E0CB3940];
          v24 = objc_opt_class();
          v25 = v24;
          if (v22)
          {
            AMSLogKey();
            v37 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: [%@] "), v25, v37);
          }
          else
          {
            objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: "), v24);
          }
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v43 = v26;
          v44 = 2114;
          v45 = v6;
          v46 = 1024;
          v47 = v11;
          _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch the secure token (X-Token) for %{public}@. error = %d", buf, 0x1Cu);
          if (v22)
          {

            v26 = (void *)v37;
          }

        }
        if (a4)
        {
          v40 = CFSTR("AMSKeychainErrorCode");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v34;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          AMSCustomError(CFSTR("AMSErrorDomain"), 7, CFSTR("Secure Token Not Found"), CFSTR("Encountered an error querying the keychain."), v35, 0);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        if (objc_msgSend((id)result, "length"))
        {
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v10, 4);
LABEL_34:
          CFRelease(MutableCopy);

          goto LABEL_35;
        }
        +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
          AMSLogKey();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)MEMORY[0x1E0CB3940];
          v31 = objc_opt_class();
          v32 = v31;
          if (v29)
          {
            AMSLogKey();
            a1 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "stringWithFormat:", CFSTR("%@: [%@] "), v32, a1);
          }
          else
          {
            objc_msgSend(v30, "stringWithFormat:", CFSTR("%@: "), v31);
          }
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v43 = v33;
          v44 = 2114;
          v45 = v6;
          _os_log_impl(&dword_18C849000, v28, OS_LOG_TYPE_ERROR, "%{public}@Secure token query succeeded but no data was returned. identifier = %{public}@", buf, 0x16u);
          if (v29)
          {

            v33 = a1;
          }

        }
        if (a4)
        {
          AMSError(0, CFSTR("Unknown Keychain Error"), CFSTR("The keychain operation succeeded but returned no data."), 0);
          v12 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_34;
        }
      }
    }
    v12 = 0;
    goto LABEL_34;
  }
  v12 = 0;
LABEL_35:

  return v12;
}

- (id)ams_secureTokenForAccount:()AMSSecureToken
{
  uint64_t v3;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = a1;
    v12 = objc_opt_class();
    if (v9)
    {
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v12, v13, v3);
    }
    else
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: %@ "), v12, v13);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v51 = v14;
    v52 = 2114;
    v53 = v15;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_INFO, "%{public}@Fetching secure token for account: %{public}@", buf, 0x16u);
    if (v9)
    {

      v14 = (void *)v3;
    }

    a1 = v11;
  }

  v16 = (void *)MEMORY[0x1E0C8F2B8];
  objc_msgSend(v6, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  objc_msgSend(v16, "_secureTokenForIdentifier:error:", v17, &v49);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v49;

  if (v18)
    goto LABEL_29;
  if (v19)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
      v22 = a2;
      AMSLogKey();
      v23 = objc_claimAutoreleasedReturnValue();
      v43 = (void *)MEMORY[0x1E0CB3940];
      v47 = a1;
      v24 = objc_opt_class();
      v45 = (void *)v23;
      if (v23)
      {
        AMSLogKey();
        v25 = objc_claimAutoreleasedReturnValue();
        a2 = v22;
        NSStringFromSelector(v22);
        v42 = objc_claimAutoreleasedReturnValue();
        v44 = (void *)v25;
        objc_msgSend(v43, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v24, v25, v42);
      }
      else
      {
        a2 = v22;
        NSStringFromSelector(v22);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "stringWithFormat:", CFSTR("%@: %@ "), v24, v44);
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v6);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v19);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v51 = v26;
      v52 = 2114;
      v53 = v27;
      v54 = 2114;
      v55 = v28;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_ERROR, "%{public}@Error fetching secure token. account = %{public}@ | error = %{public}@", buf, 0x20u);
      if (v45)
      {

        v26 = (void *)v42;
      }

      a1 = v47;
    }

  }
  if (objc_msgSend(v6, "ams_isiCloudAccount")
    && (objc_msgSend(a1, "ams_iTunesAccountForAccount:", v6), (v29 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v30 = (void *)v29;
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v31)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v31, "OSLogObject");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      AMSLogKey();
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x1E0CB3940];
      v48 = a1;
      v35 = objc_opt_class();
      v46 = (void *)v33;
      if (v33)
      {
        AMSLogKey();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v35, v36, v44);
      }
      else
      {
        NSStringFromSelector(a2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringWithFormat:", CFSTR("%@: %@ "), v35, v36);
      }
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v6);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v30);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v51 = v37;
      v52 = 2114;
      v53 = v40;
      v54 = 2114;
      v55 = v41;
      _os_log_impl(&dword_18C849000, v32, OS_LOG_TYPE_INFO, "%{public}@Found iTunes account for iCloud account, fetching secure token. account = %{public}@ | iTunesAccount = %{public}@", buf, 0x20u);
      if (v46)
      {

        v37 = v44;
      }

      a1 = v48;
    }

    objc_msgSend(a1, "ams_secureTokenForAccount:", v30);
    v38 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_29:
    v38 = v18;
  }

  return v38;
}

- (uint64_t)ams_setSecureToken:()AMSSecureToken forAccount:error:
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  void *v26;
  const __CFDictionary *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  __CFDictionary *Mutable;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v55;
  _QWORD *v56;
  _QWORD *v57;
  _QWORD *v58;
  uint64_t v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (!v12)
    goto LABEL_25;
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v9)
  {
    if (!v13)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v56 = a5;
      AMSLogKey();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0CB3940];
      v18 = objc_opt_class();
      if (v16)
      {
        AMSLogKey();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        a2 = (const char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v18, v19, a2);
      }
      else
      {
        NSStringFromSelector(a2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("%@: %@ "), v18, v19);
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v61 = v20;
      v62 = 2114;
      v63 = v23;
      v24 = "%{public}@Setting secure token for account: %{public}@";
LABEL_17:
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_INFO, v24, buf, 0x16u);
      if (v16)
      {

        v20 = (void *)a2;
      }

      a5 = v56;
    }
  }
  else
  {
    if (!v13)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v56 = a5;
      AMSLogKey();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0CB3940];
      v22 = objc_opt_class();
      if (v16)
      {
        AMSLogKey();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        a2 = (const char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v22, v19, a2);
      }
      else
      {
        NSStringFromSelector(a2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: %@ "), v22, v19);
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v61 = v20;
      v62 = 2114;
      v63 = v23;
      v24 = "%{public}@Deleting secure token for account: %{public}@";
      goto LABEL_17;
    }
  }

  v59 = 0;
  v25 = (void *)objc_opt_class();
  objc_msgSend(v10, "identifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (const __CFDictionary *)objc_msgSend(v25, "_baseQueryDictionaryForIdentifier:numValues:", v26, &v59);

  if (v9)
  {
    objc_msgSend(v9, "dataUsingEncoding:", 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "ams_secureTokenForAccount:", v10);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      if ((objc_msgSend(v29, "isEqualToString:", v9) & 1) != 0)
      {
        v31 = 0;
        goto LABEL_47;
      }
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
        v58 = a5;
        AMSLogKey();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)MEMORY[0x1E0CB3940];
        v44 = objc_opt_class();
        v45 = v44;
        if (v42)
        {
          AMSLogKey();
          v55 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "stringWithFormat:", CFSTR("%@: [%@] "), v45, v55);
        }
        else
        {
          objc_msgSend(v43, "stringWithFormat:", CFSTR("%@: "), v44);
        }
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v10);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v61 = v46;
        v62 = 2114;
        v63 = v50;
        _os_log_impl(&dword_18C849000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@Updating an existing secure token. account = %{public}@.", buf, 0x16u);
        if (v42)
        {

          v46 = (void *)v55;
        }

        a5 = v58;
      }

      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68A0], (const void *)*MEMORY[0x1E0CD68B0]);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD70D8], v28);
      v49 = SecItemUpdate(v27, Mutable);
    }
    else
    {
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
        v57 = a5;
        AMSLogKey();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)MEMORY[0x1E0CB3940];
        v37 = objc_opt_class();
        v38 = v37;
        if (v35)
        {
          AMSLogKey();
          v55 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "stringWithFormat:", CFSTR("%@: [%@] "), v38, v55);
        }
        else
        {
          objc_msgSend(v36, "stringWithFormat:", CFSTR("%@: "), v37);
        }
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v10);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v61 = v39;
        v62 = 2114;
        v63 = v47;
        _os_log_impl(&dword_18C849000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@Adding a new secure token to keychain. account = %{public}@", buf, 0x16u);
        if (v35)
        {

          v39 = (void *)v55;
        }

        a5 = v57;
      }

      Mutable = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v59 + 2, v27);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68A0], (const void *)*MEMORY[0x1E0CD68B0]);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD70D8], v28);
      v49 = SecItemAdd(Mutable, 0);
    }
    v31 = v49;
    CFRelease(Mutable);
LABEL_47:

    if ((_DWORD)v31)
      goto LABEL_48;
LABEL_25:
    v32 = 1;
    goto LABEL_51;
  }
  v31 = SecItemDelete(v27);
  if (!(_DWORD)v31)
    goto LABEL_25;
LABEL_48:
  v51 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "identifier");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "stringWithFormat:", CFSTR("Failed to set the secure token for %@. err = %d"), v52, v31);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
  {
    AMSError(104, CFSTR("Failed to Set Secure Token"), v53, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  v32 = 0;
LABEL_51:

  return v32;
}

@end

@implementation AMSCookieStorage

+ (id)cookiesForAccount:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "cookiesForAccount:cookieDatabaseOnly:error:", a3, 0, a4);
}

+ (id)cookiesForAccount:(id)a3 cookieDatabaseOnly:(BOOL)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v47;
  void *v48;
  void *v49;
  const char *v50;
  const char *v51;
  unsigned int v52;
  id *v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  uint64_t v59;
  uint64_t v60;

  v6 = a4;
  v60 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if ((objc_msgSend(v8, "ams_isiTunesAccount") & 1) == 0)
  {
    v52 = v6;
    v53 = a5;
    v9 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if ((_DWORD)v9)
    {
      if (!v10)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0CB3940];
        v15 = objc_opt_class();
        v50 = a2;
        if (v13)
        {
          AMSLogKey();
          v16 = objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v47 = objc_claimAutoreleasedReturnValue();
          v48 = (void *)v16;
          objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v15, v16, v47);
        }
        else
        {
          NSStringFromSelector(a2);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: %@ "), v15, v48);
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded((void *)*MEMORY[0x1E0C8F170]);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "accountType");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v26);
        v9 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v55 = v17;
        v56 = 2114;
        v57 = v24;
        v58 = 2114;
        v59 = v9;
        _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unexpected account type. Expected %{public}@, got %{public}@.", buf, 0x20u);

        if (v13)
        {

          v17 = (void *)v47;
        }

        a2 = v50;
      }

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v18, 0);
    }
    else
    {
      if (!v10)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "OSLogObject");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        AMSLogKey();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x1E0CB3940];
        v21 = objc_opt_class();
        v51 = a2;
        if (v19)
        {
          AMSLogKey();
          v22 = objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v47 = objc_claimAutoreleasedReturnValue();
          v49 = (void *)v22;
          objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v21, v22, v47);
        }
        else
        {
          NSStringFromSelector(a2);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: %@ "), v21, v49);
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded((void *)*MEMORY[0x1E0C8F170]);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "accountType");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v29);
        v9 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v55 = v23;
        v56 = 2114;
        v57 = v27;
        v58 = 2114;
        v59 = v9;
        _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_FAULT, "%{public}@Unexpected account type. Expected %{public}@, got %{public}@.", buf, 0x20u);

        if (v19)
        {

          v23 = (void *)v47;
        }

        a2 = v51;
      }
    }

    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v30)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v30, "OSLogObject");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      AMSLogKey();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)MEMORY[0x1E0CB3940];
      v34 = objc_opt_class();
      if (v32)
      {
        AMSLogKey();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v9 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v34, v35, v9);
      }
      else
      {
        NSStringFromSelector(a2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringWithFormat:", CFSTR("%@: %@ "), v34, v35);
      }
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v8);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v36;
      v56 = 2114;
      v57 = v37;
      _os_log_impl(&dword_18C849000, v31, OS_LOG_TYPE_DEBUG, "%{public}@account: %{public}@", buf, 0x16u);
      if (v32)
      {

        v36 = (void *)v9;
      }

    }
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "ams_iTunesAccountForAccount:", v8);
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)v39;
    if (v39)
      v41 = (void *)v39;
    else
      v41 = v8;
    v42 = v41;

    v8 = v42;
    a5 = v53;
    v6 = v52;
  }
  +[AMSCookieService sharedService](AMSCookieService, "sharedService");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "getCookiePropertiesForAccount:cookieDatabaseOnly:error:", v8, v6, a5);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C92C00], "ams_cookiesForProperties:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  return v45;
}

+ (BOOL)updateCookiesWithCookiesToAdd:(id)a3 cookiesToRemove:(id)a4 forAccount:(id)a5 error:(id *)a6
{
  void *v7;

  objc_msgSend(a1, "updateCookiesWithCookiesToAdd:cookiesToRemove:forAccount:", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v7, "resultWithError:", a6);

  return (char)a6;
}

+ (id)updateCookiesWithCookiesToAdd:(id)a3 cookiesToRemove:(id)a4 forAccount:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  AMSBinaryPromise *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  const char *v58;
  const char *v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  uint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  if ((objc_msgSend(v8, "ams_isiTunesAccount") & 1) == 0)
  {
    v11 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if ((_DWORD)v11)
    {
      if (!v12)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0CB3940];
        v17 = objc_opt_class();
        v56 = (void *)v15;
        v58 = a2;
        if (v15)
        {
          AMSLogKey();
          v18 = objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v53 = objc_claimAutoreleasedReturnValue();
          v54 = (void *)v18;
          objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v17, v18, v53);
        }
        else
        {
          NSStringFromSelector(a2);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: %@ "), v17, v54);
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded((void *)*MEMORY[0x1E0C8F170]);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "accountType");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v28);
        v11 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v61 = v19;
        v62 = 2114;
        v63 = v26;
        v64 = 2114;
        v65 = v11;
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unexpected account type. Expected %{public}@, got %{public}@.", buf, 0x20u);

        if (v56)
        {

          v19 = (void *)v53;
        }

        a2 = v58;
      }

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
      v20 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v20, 0);
    }
    else
    {
      if (!v12)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "OSLogObject");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        AMSLogKey();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x1E0CB3940];
        v23 = objc_opt_class();
        v57 = (void *)v21;
        v59 = a2;
        if (v21)
        {
          AMSLogKey();
          v24 = objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v53 = objc_claimAutoreleasedReturnValue();
          v55 = (void *)v24;
          objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v23, v24, v53);
        }
        else
        {
          NSStringFromSelector(a2);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: %@ "), v23, v55);
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded((void *)*MEMORY[0x1E0C8F170]);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "accountType");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v31);
        v11 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v61 = v25;
        v62 = 2114;
        v63 = v29;
        v64 = 2114;
        v65 = v11;
        _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_FAULT, "%{public}@Unexpected account type. Expected %{public}@, got %{public}@.", buf, 0x20u);

        if (v57)
        {

          v25 = (void *)v53;
        }

        a2 = v59;
      }
    }

    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v32, "OSLogObject");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      AMSLogKey();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x1E0CB3940];
      v36 = objc_opt_class();
      if (v34)
      {
        AMSLogKey();
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = a2;
        v39 = (void *)v37;
        NSStringFromSelector(v38);
        v11 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v36, v39, v11);
      }
      else
      {
        NSStringFromSelector(a2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringWithFormat:", CFSTR("%@: %@ "), v36, v39);
      }
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v8);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v61 = v40;
      v62 = 2114;
      v63 = v41;
      _os_log_impl(&dword_18C849000, v33, OS_LOG_TYPE_DEBUG, "%{public}@account: %{public}@", buf, 0x16u);
      if (v34)
      {

        v40 = (void *)v11;
      }

    }
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "ams_iTunesAccountForAccount:", v8);
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = (void *)v43;
    if (v43)
      v45 = (void *)v43;
    else
      v45 = v8;
    v46 = v45;

    v8 = v46;
  }
  v47 = objc_alloc_init(AMSBinaryPromise);
  +[AMSCookieService sharedService](AMSCookieService, "sharedService");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C92C00], "ams_propertiesForCookies:", v10);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C92C00], "ams_propertiesForCookies:", v9);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSBinaryPromise completionHandlerAdapter](v47, "completionHandlerAdapter");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "updateCookiesWithCookiePropertiesToAdd:cookiePropertiesToRemove:forAccount:withCompletion:", v49, v50, v8, v51);

  return v47;
}

@end

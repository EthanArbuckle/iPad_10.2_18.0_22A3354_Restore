@implementation AMSAbsinthe

+ (id)handleResponse:(id)a3 bag:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;

    v7 = 0;
    if (v6 && a4)
    {
      AMSSetLogKeyIfNeeded();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ams_valueForHTTPHeaderField:", CFSTR("X-Apple-AbsintheAction"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "ams_caseInsensitiveEquals:", CFSTR("RP")))
        goto LABEL_12;
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138543618;
        v16 = objc_opt_class();
        v17 = 2114;
        v18 = v8;
        _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling reprovision action", (uint8_t *)&v15, 0x16u);
      }

      +[AMSAbsintheSession defaultSession](AMSAbsintheSession, "defaultSession");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "clearSession");

      if (v13)
      {
        +[AMSURLAction retryAction](AMSURLAction, "retryAction");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setReason:", CFSTR("absinthe"));
        objc_msgSend(v7, "setRetryIdentifier:", 0x1E2549280);
      }
      else
      {
LABEL_12:
        v7 = 0;
      }

    }
  }
  else
  {

    v6 = 0;
    v7 = 0;
  }

  return v7;
}

id __47__AMSAbsinthe_headersForRequest_buyParams_bag___block_invoke(uint64_t a1, void *a2, void *a3)
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
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v9 = *(_QWORD *)(a1 + 32);
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = objc_opt_class();
      if (v9)
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: [%@] "), v11, *(_QWORD *)(a1 + 32));
      else
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: "), v11, v22);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v12;
      v29 = 2114;
      v30 = v13;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to load Absinthe requests from bag. Will continue without adding any signing headers. error = %{public}@", buf, 0x16u);

    }
    v14 = +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AA70]);
  }
  objc_msgSend(*(id *)(a1 + 64), "_signingDataFromRequest:buyParams:definitions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    +[AMSAbsintheSession defaultSession](AMSAbsintheSession, "defaultSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "signData:bag:", v15, *(_QWORD *)(a1 + 56));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __47__AMSAbsinthe_headersForRequest_buyParams_bag___block_invoke_30;
    v23[3] = &unk_1E253D978;
    v18 = *(id *)(a1 + 32);
    v19 = *(_QWORD *)(a1 + 64);
    v24 = v18;
    v26 = v19;
    v25 = *(id *)(a1 + 40);
    objc_msgSend(v17, "continueWithBlock:", v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AA70]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

+ (id)headersForRequest:(id)a3 buyParams:(id)a4 bag:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  AMSSetLogKeyIfNeeded();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v10, "arrayForKey:", 0x1E254C340);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "valuePromise");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __47__AMSAbsinthe_headersForRequest_buyParams_bag___block_invoke;
    v22[3] = &unk_1E253D9A0;
    v23 = v11;
    v27 = a1;
    v24 = v8;
    v25 = v9;
    v26 = v10;
    objc_msgSend(v13, "continueWithBlock:", v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v17 = (void *)MEMORY[0x1E0CB3940];
      v18 = objc_opt_class();
      if (v11)
        objc_msgSend(v17, "stringWithFormat:", CFSTR("%@: [%@] "), v18, v11);
      else
        objc_msgSend(v17, "stringWithFormat:", CFSTR("%@: "), v18, v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v19;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_ERROR, "%{public}@No bag provided. Defaulting to skipping Absinthe signing.", buf, 0xCu);

    }
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AA70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

id __47__AMSAbsinthe_headersForRequest_buyParams_bag___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[2];
  _QWORD v21[2];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    objc_msgSend(a3, "ams_sanitizedForSecureCoding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
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
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = objc_opt_class();
      if (v10)
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: [%@] "), v12, *(_QWORD *)(a1 + 32));
      else
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: "), v12, v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableURLRequest(*(_QWORD *)(a1 + 40));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v13;
      v24 = 2114;
      v25 = v14;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Headers generated for request: %{public}@", buf, 0x16u);

    }
    v20[0] = CFSTR("X-Apple-AbsintheSignature");
    objc_msgSend(v5, "signature");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v15;
    v20[1] = CFSTR("X-Apple-AbsintheSrv");
    objc_msgSend(v5, "servKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v7;

  return v17;
}

+ (NSString)bagSubProfile
{
  return (NSString *)CFSTR("AMSAbsinthe");
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)CFSTR("1");
}

+ (id)createBagForSubProfile
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_dataToSignFromRequest:(id)a3 bagDefinition:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  id v38;
  id v39;
  void *v40;
  id v41;
  const void *v42;
  void *v43;
  id v44;
  id v46;
  id v47;
  void *v48;
  id v49;
  id obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("body"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v8, "BOOLValue"))
  {
    objc_msgSend(v5, "HTTPBody");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v9, 4);
      if (v10)
        objc_msgSend(v7, "appendString:", v10);

    }
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cookies"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v46 = v6;
  v47 = v5;
  v48 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;

    if (v12)
    {
      objc_msgSend(v5, "ams_cookies");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      obj = v12;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
      if (!v14)
        goto LABEL_24;
      v15 = v14;
      v16 = *(_QWORD *)v60;
      while (1)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v60 != v16)
            objc_enumerationMutation(obj);
          v18 = *(id *)(*((_QWORD *)&v59 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v19 = v18;

            if (v19)
              goto LABEL_20;
          }
          else
          {

          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v18);
          v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:
          objc_msgSend(v13, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
            objc_msgSend(v7, "appendString:", v20);

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
        if (!v15)
        {
LABEL_24:

          v6 = v46;
          goto LABEL_27;
        }
      }
    }
  }
  else
  {

  }
  obj = 0;
LABEL_27:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("headers"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = v21;

    if (v22)
    {
      objc_msgSend(v5, "allHTTPHeaderFields");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v49 = v22;
      v23 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
      if (!v23)
        goto LABEL_43;
      v24 = v23;
      v25 = *(_QWORD *)v56;
      while (1)
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v56 != v25)
            objc_enumerationMutation(v49);
          v27 = *(id *)(*((_QWORD *)&v55 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v28 = v27;

            if (v28)
              goto LABEL_39;
          }
          else
          {

          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v27);
          v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_39:
          objc_msgSend(v21, "objectForKeyedSubscript:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
            objc_msgSend(v7, "appendString:", v29);

        }
        v24 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
        if (!v24)
        {
LABEL_43:

          v6 = v46;
          v5 = v47;
          goto LABEL_45;
        }
      }
    }
    v49 = 0;
  }
  else
  {
    v49 = 0;
LABEL_45:

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("params"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = v30;

    if (v31)
    {
      objc_msgSend(v5, "URL");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "ams_parameters");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v33 = v31;
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
      if (!v34)
        goto LABEL_62;
      v35 = v34;
      v36 = *(_QWORD *)v52;
      while (1)
      {
        for (k = 0; k != v35; ++k)
        {
          if (*(_QWORD *)v52 != v36)
            objc_enumerationMutation(v33);
          v38 = *(id *)(*((_QWORD *)&v51 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v39 = v38;

            if (v39)
              goto LABEL_58;
          }
          else
          {

          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v38);
          v39 = (id)objc_claimAutoreleasedReturnValue();
LABEL_58:
          objc_msgSend(v30, "objectForKeyedSubscript:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (v40)
            objc_msgSend(v7, "appendString:", v40);

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
        if (!v35)
        {
LABEL_62:

          v6 = v46;
          v5 = v47;
          goto LABEL_64;
        }
      }
    }
    v33 = 0;
  }
  else
  {
    v33 = 0;
LABEL_64:

  }
  if (!objc_msgSend(v7, "length"))
    goto LABEL_68;
  v41 = objc_retainAutorelease(v7);
  v42 = (const void *)objc_msgSend(v41, "cStringUsingEncoding:", 4);
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 32);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v41) = objc_msgSend(v41, "length");
  v44 = objc_retainAutorelease(v43);
  CC_SHA256(v42, (CC_LONG)v41, (unsigned __int8 *)objc_msgSend(v44, "mutableBytes"));
  if (!objc_msgSend(v44, "length"))
  {

LABEL_68:
    v44 = 0;
  }

  return v44;
}

+ (id)_signingDataFromRequest:(id)a3 buyParams:(id)a4 definitions:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  unint64_t v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  NSObject *v57;
  os_log_type_t v58;
  uint64_t v60;
  id v61;
  void *v62;
  id v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  id v69;
  void *v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  uint8_t v81[128];
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v64 = a3;
  v69 = a4;
  v8 = a5;
  AMSSetLogKeyIfNeeded();
  v9 = objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = 0x1E0CB3000uLL;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = objc_opt_class();
    if (v9)
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: [%@] "), v14, v9);
    else
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: "), v14, v60);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableURLRequest((uint64_t)v64);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v83 = v15;
    v84 = 2114;
    v85 = v16;
    _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Determining signing data for request %{public}@", buf, 0x16u);

    v12 = 0x1E0CB3000uLL;
  }
  v61 = a1;
  v62 = (void *)v9;

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v17 = v8;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v77;
    v63 = v17;
    v65 = *(_QWORD *)v77;
    do
    {
      v21 = 0;
      v66 = v19;
      do
      {
        if (*(_QWORD *)v77 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v21);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v67 = v22;
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("criteria"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v24 = v23;
          else
            v24 = 0;

          if (objc_msgSend(v24, "count"))
          {
            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("host"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v26 = 0;
              LODWORD(v28) = 1;
              goto LABEL_23;
            }
            v26 = v25;

            if (v26)
            {
              objc_msgSend(v64, "URL");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "host");
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              if (v25)
                LODWORD(v28) = objc_msgSend(v25, "hasSuffix:", v26);
              else
                LODWORD(v28) = 0;
LABEL_23:

            }
            else
            {
              LODWORD(v28) = 1;
            }
            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("path"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v71 = v26;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v30 = v29;

              if ((_DWORD)v28 && v30)
              {
                objc_msgSend(v64, "URL");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "path");
                v29 = (void *)objc_claimAutoreleasedReturnValue();

                if (v29)
                  LODWORD(v28) = objc_msgSend(v29, "containsString:", v30);
                else
                  LODWORD(v28) = 0;
LABEL_30:

              }
              v70 = v30;
              objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("buyParams"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v33 = 0;
                goto LABEL_49;
              }
              v33 = v32;

              if (!(_DWORD)v28 || !v33)
                goto LABEL_50;
              if (!objc_msgSend(v33, "count"))
              {
                LODWORD(v28) = 1;
                goto LABEL_50;
              }
              v74 = 0u;
              v75 = 0u;
              v72 = 0u;
              v73 = 0u;
              objc_msgSend(v33, "allKeys");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
              if (!v34)
              {
                LODWORD(v28) = 1;
                goto LABEL_49;
              }
              v35 = v34;
              v68 = *(_QWORD *)v73;
LABEL_37:
              v36 = 0;
              while (1)
              {
                if (*(_QWORD *)v73 != v68)
                  objc_enumerationMutation(v32);
                v37 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * v36);
                objc_msgSend(v33, "objectForKeyedSubscript:", v37);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = v12;
                objc_opt_class();
                v40 = (objc_opt_isKindOfClass() & 1) != 0 ? v38 : 0;

                objc_msgSend(v69, "parameterForKey:", v37);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = v41;
                if (!v41)
                  break;
                v42 = objc_msgSend(v41, "rangeOfString:options:", v40, 1024);

                if (v42 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_70;
                }
                ++v36;
                v12 = v39;
                if (v35 == v36)
                {
                  v35 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
                  LODWORD(v28) = 1;
                  if (v35)
                    goto LABEL_37;
                  v17 = v63;
LABEL_49:

LABEL_50:
                  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("regex"));
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    v44 = 0;
                    goto LABEL_56;
                  }
                  v44 = v43;

                  if ((_DWORD)v28 && v44)
                  {
                    objc_msgSend(v64, "URL");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "absoluteString");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v43)
                      LODWORD(v28) = objc_msgSend(v43, "rangeOfString:options:", v44, 1024) != 0x7FFFFFFFFFFFFFFFLL;
                    else
                      LODWORD(v28) = 0;
LABEL_56:

                  }
                  if (!(_DWORD)v28)
                  {

                    v20 = v65;
                    v19 = v66;
                    goto LABEL_59;
                  }
                  objc_msgSend(v61, "_dataToSignFromRequest:bagDefinition:", v64, v67);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();

                  v49 = v62;
                  if (!v52)
                  {
                    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v47)
                    {
                      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    objc_msgSend(v47, "OSLogObject");
                    v48 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                    {
                      v53 = *(void **)(v12 + 2368);
                      v54 = objc_opt_class();
                      if (v62)
                        objc_msgSend(v53, "stringWithFormat:", CFSTR("%@: [%@] "), v54, v62);
                      else
                        objc_msgSend(v53, "stringWithFormat:", CFSTR("%@: "), v54, v60);
                      v55 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543362;
                      v83 = v55;
                      v56 = "%{public}@Criteria matches, but no data to sign";
                      v57 = v48;
                      v58 = OS_LOG_TYPE_ERROR;
LABEL_88:
                      _os_log_impl(&dword_18C849000, v57, v58, v56, buf, 0xCu);

                    }
                    goto LABEL_89;
                  }
                  goto LABEL_90;
                }
              }

LABEL_70:
              v17 = v63;
              v12 = v39;
              goto LABEL_49;
            }
            v30 = 0;
            goto LABEL_30;
          }
LABEL_59:

        }
        ++v21;
      }
      while (v21 != v19);
      v46 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
      v19 = v46;
    }
    while (v46);
  }

  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v47)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v47, "OSLogObject");
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = v62;
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    v50 = *(void **)(v12 + 2368);
    v51 = objc_opt_class();
    if (v62)
      objc_msgSend(v50, "stringWithFormat:", CFSTR("%@: [%@] "), v51, v62);
    else
      objc_msgSend(v50, "stringWithFormat:", CFSTR("%@: "), v51, v60);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v83 = v55;
    v56 = "%{public}@Skipping absinthe";
    v57 = v48;
    v58 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_88;
  }
LABEL_89:

  v52 = 0;
LABEL_90:

  return v52;
}

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

@end

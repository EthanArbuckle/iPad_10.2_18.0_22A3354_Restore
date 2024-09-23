@implementation AMSAnisette

+ (id)handleResponse:(id)a3 type:(int64_t)a4 bag:(id)a5 account:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = 0;
    v17 = 0;
    v18 = v12;
LABEL_11:

    goto LABEL_12;
  }
  v13 = v12;

  if (v13)
  {
    objc_msgSend(v13, "ams_actionNameV1");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v13, "ams_actionDataV1");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_handleActionName:actionData:account:type:bag:", v14, v15, v11, 1, v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(v13, "ams_actionNameV1");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v13, "ams_actionDataV1");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_handleActionName:actionData:account:type:bag:", v19, v20, v11, 2, v10);
      v21 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v21;
    }
    v18 = v16;

    v17 = v18;
    goto LABEL_11;
  }
  v17 = 0;
LABEL_12:

  return v17;
}

void __58__AMSAnisette__bagDomainExistsForURL_type_bag_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (!a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "host");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v16 = a1;
      v17 = v6;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v13, "hasPrefix:", CFSTR("."), v16, v17, (_QWORD)v18))
          {
            if ((objc_msgSend(v7, "hasSuffix:", v13) & 1) != 0)
              goto LABEL_16;
          }
          else if (objc_msgSend(v13, "hasPrefix:", CFSTR("*")))
          {
            objc_msgSend(v13, "substringFromIndex:", 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v7, "hasSuffix:", v14);

            if ((v15 & 1) != 0)
              goto LABEL_16;
          }
          else if (!objc_msgSend(v13, "caseInsensitiveCompare:", v7))
          {
            goto LABEL_16;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
LABEL_16:
      a1 = v16;
      v6 = v17;
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __50__AMSAnisette_headersForRequest_account_type_bag___block_invoke(uint64_t a1, char a2)
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = AMSSetLogKey(*(void **)(a1 + 32));
  if ((a2 & 1) != 0 || *(_QWORD *)(a1 + 64) == 1)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_opt_class();
      v8 = v7;
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v7;
      v14 = 2114;
      v15 = v9;
      v16 = 1024;
      v17 = 1;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching anisette headers for type: %d", (uint8_t *)&v12, 0x1Cu);

    }
    objc_msgSend(*(id *)(a1 + 72), "_headersForRequest:account:type:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  if (v10)
    v11 = v10;
  else
    v11 = (void *)MEMORY[0x1E0C9AA70];
  objc_msgSend(*(id *)(a1 + 56), "finishWithResult:", v11);

}

+ (id)_headersForRequest:(id)a3 account:(id)a4 type:(int64_t)a5
{
  int v6;
  int v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  __CFString **v17;
  id v18;
  void *v19;
  void *v20;
  __CFString **v21;
  unsigned int v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v25 = 0;
  v24 = 0;
  v23 = 0;
  qi864985u0(+[AMSAnisette _accountIDForType:account:](AMSAnisette, "_accountIDForType:account:", a5, a4), (uint64_t)&v26, (uint64_t)&v25, (uint64_t)&v24, (uint64_t)&v23);
  if (v6)
  {
    v7 = v6;
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_opt_class();
      v11 = v10;
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v28 = v10;
      v29 = 2114;
      v30 = v12;
      v31 = 1024;
      v32 = a5;
      v33 = 1024;
      v34 = v7;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to generate Anisette (type: %d) headers. error = %d", buf, 0x22u);

    }
    v13 = 0;
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v26)
    {
      v14 = objc_alloc(MEMORY[0x1E0C99D50]);
      v15 = (void *)objc_msgSend(v14, "initWithBytesNoCopy:length:freeWhenDone:", v26, v25, 0);
      objc_msgSend(v15, "base64EncodedStringWithOptions:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = AMSHTTPHeaderXAppleAMDM;
        if (a5 != 2)
          v17 = AMSHTTPHeaderXAppleMDM;
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, *v17);
      }
      jk24uiwqrg(v26);

    }
    if (v24)
    {
      v18 = objc_alloc(MEMORY[0x1E0C99D50]);
      v19 = (void *)objc_msgSend(v18, "initWithBytesNoCopy:length:freeWhenDone:", v24, v23, 0);
      objc_msgSend(v19, "base64EncodedStringWithOptions:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = AMSHTTPHeaderXAppleAMD;
        if (a5 != 2)
          v21 = AMSHTTPHeaderXAppleMD;
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, *v21);
      }
      jk24uiwqrg(v24);

    }
    v13 = (void *)objc_msgSend(v8, "copy");
  }

  return v13;
}

+ (id)headersForRequest:(id)a3 account:(id)a4 type:(int64_t)a5 bag:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  AMSMutablePromise *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  AMSMutablePromise *v19;
  AMSMutablePromise *v20;
  void *v21;
  AMSMutablePromise *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  AMSMutablePromise *v28;
  AMSMutablePromise *v29;
  AMSMutablePromise *v30;
  AMSMutablePromise *v32;
  _QWORD v33[4];
  AMSMutablePromise *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  AMSMutablePromise *v39;
  int64_t v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  AMSMutablePromise *v46;
  int64_t v47;
  id v48;
  _QWORD v49[4];

  v49[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v32 = objc_alloc_init(AMSMutablePromise);
  AMSLogKey();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(AMSMutablePromise);
  objc_msgSend(v10, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __50__AMSAnisette_headersForRequest_account_type_bag___block_invoke;
  v42[3] = &unk_1E253DE68;
  v16 = v13;
  v43 = v16;
  v47 = a5;
  v48 = a1;
  v17 = v10;
  v44 = v17;
  v18 = v11;
  v45 = v18;
  v46 = v14;
  v19 = v14;
  objc_msgSend(a1, "_bagDomainExistsForURL:type:bag:completion:", v15, 1, v12, v42);

  v20 = objc_alloc_init(AMSMutablePromise);
  objc_msgSend(v17, "URL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __50__AMSAnisette_headersForRequest_account_type_bag___block_invoke_8;
  v35[3] = &unk_1E253DE68;
  v40 = a5;
  v41 = a1;
  v36 = v16;
  v37 = v17;
  v38 = v18;
  v39 = v20;
  v22 = v20;
  v23 = v18;
  v24 = v17;
  v25 = v16;
  objc_msgSend(a1, "_bagDomainExistsForURL:type:bag:completion:", v21, 2, v12, v35);

  v49[0] = v19;
  v49[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithAll:](AMSPromise, "promiseWithAll:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __50__AMSAnisette_headersForRequest_account_type_bag___block_invoke_11;
  v33[3] = &unk_1E253DE90;
  v28 = v32;
  v34 = v28;
  objc_msgSend(v27, "addFinishBlock:", v33);
  v29 = v34;
  v30 = v28;

  return v30;
}

+ (void)_bagDomainExistsForURL:(id)a3 type:(int64_t)a4 bag:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD);
  __CFString **v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  void (**v18)(id, _QWORD);

  v9 = a3;
  v10 = a5;
  v11 = (void (**)(id, _QWORD))a6;
  if (a4 == 2)
  {
    v12 = AMSBagKeyAnisetteAMDDomains;
  }
  else
  {
    if (a4 != 1)
    {
      v14 = 0;
LABEL_10:
      v11[2](v11, 0);
      goto LABEL_13;
    }
    v12 = AMSBagKeyAnisetteMDDomains;
  }
  v13 = *v12;
  v14 = v13;
  if (!v10 || !v13)
    goto LABEL_10;
  objc_msgSend(v10, "arrayForKey:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __58__AMSAnisette__bagDomainExistsForURL_type_bag_completion___block_invoke;
    v16[3] = &unk_1E253DEB8;
    v17 = v9;
    v18 = v11;
    objc_msgSend(v15, "valueWithCompletion:", v16);

  }
  else
  {
    v11[2](v11, 0);
  }

LABEL_13:
}

+ (unint64_t)_accountIDForType:(int64_t)a3 account:(id)a4
{
  void *v5;
  unint64_t v6;

  if (a3 == 2)
    return -1;
  objc_msgSend(a4, "ams_DSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  return v6;
}

+ (BOOL)handleResponse:(id)a3 account:(id)a4 type:(int64_t)a5 bag:(id)a6
{
  void *v6;
  BOOL v7;

  objc_msgSend(a1, "handleResponse:type:bag:account:", a3, a5, a6, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "actionType") == 2;

  return v7;
}

void __50__AMSAnisette_headersForRequest_account_type_bag___block_invoke_8(uint64_t a1, char a2)
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = AMSSetLogKey(*(void **)(a1 + 32));
  if ((a2 & 1) != 0 || *(_QWORD *)(a1 + 64) == 2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_opt_class();
      v8 = v7;
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v7;
      v14 = 2114;
      v15 = v9;
      v16 = 1024;
      v17 = 2;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching anisette headers for type: %d", (uint8_t *)&v12, 0x1Cu);

    }
    objc_msgSend(*(id *)(a1 + 72), "_headersForRequest:account:type:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  if (v10)
    v11 = v10;
  else
    v11 = (void *)MEMORY[0x1E0C9AA70];
  objc_msgSend(*(id *)(a1 + 56), "finishWithResult:", v11);

}

void __50__AMSAnisette_headersForRequest_account_type_bag___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "addEntriesFromDictionary:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v4);
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_78 != -1)
    dispatch_once(&_MergedGlobals_78, &__block_literal_global_6);
  return (NSString *)(id)qword_1ECEACEE8;
}

void __28__AMSAnisette_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACEE8;
  qword_1ECEACEE8 = (uint64_t)CFSTR("AMSAnisette");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEACEF0 != -1)
    dispatch_once(&qword_1ECEACEF0, &__block_literal_global_17);
  return (NSString *)(id)qword_1ECEACEF8;
}

void __35__AMSAnisette_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACEF8;
  qword_1ECEACEF8 = (uint64_t)CFSTR("1");

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

+ (id)_eraseProvisioningForType:(int64_t)a3 account:(id)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[AMSAnisette _accountIDForType:account:](AMSAnisette, "_accountIDForType:account:", a3, a4);
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v7;
    v15 = 2114;
    v16 = v9;
    v17 = 2048;
    v18 = a3;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Erasing provisioning for type: %ld.", (uint8_t *)&v13, 0x20u);

  }
  p435tmhbla();
  if (v10)
    return 0;
  +[AMSURLAction retryAction](AMSURLAction, "retryAction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setReason:", CFSTR("anisette-RP"));
  objc_msgSend(v12, "setRetryIdentifier:", 0x1E2549DE0);
  return v12;
}

+ (id)_handleActionName:(id)a3 actionData:(id)a4 account:(id)a5 type:(int64_t)a6 bag:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  int64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  int64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v16, "OSLogObject");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = v15;
    v19 = a1;
    v20 = v13;
    v21 = a6;
    v22 = (void *)objc_opt_class();
    v27 = v22;
    AMSLogKey();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v29 = v22;
    a6 = v21;
    v13 = v20;
    a1 = v19;
    v15 = v18;
    v30 = 2114;
    v31 = v23;
    v32 = 2114;
    v33 = v12;
    v34 = 2048;
    v35 = a6;
    _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling anisette action name: %{public}@ type: %ld", buf, 0x2Au);

  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("SP")))
  {
    objc_msgSend(a1, "_provisionMachineWithActionData:type:account:bag:", v13, a6, v14, v15);
    v24 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v12, "isEqualToString:", CFSTR("SM")))
  {
    objc_msgSend(a1, "_syncMachineWithActionData:type:account:bag:", v13, a6, v14, v15);
    v24 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v12, "isEqualToString:", CFSTR("RP")))
    {
      v25 = 0;
      goto LABEL_12;
    }
    objc_msgSend(a1, "_eraseProvisioningForType:account:", a6, v14);
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v24;
LABEL_12:

  return v25;
}

+ (id)_provisionMachineWithActionData:(id)a3 type:(int64_t)a4 account:(id)a5 bag:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  void *v15;
  AMSAnisetteProvisionTask *v16;
  void *v17;
  int v18;
  void *v19;
  NSObject *v20;
  int64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  __int128 v28;
  id v29;
  id v30;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = 0;
  v13 = 5;
  *(_QWORD *)&v14 = 138543618;
  v28 = v14;
  v29 = v11;
  do
  {
    v15 = v12;
    v16 = -[AMSAnisetteProvisionTask initWithData:type:account:bag:]([AMSAnisetteProvisionTask alloc], "initWithData:type:account:bag:", v9, a4, v10, v11);
    -[AMSAnisetteProvisionTask performProvisioning](v16, "performProvisioning");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v12;
    v18 = objc_msgSend(v17, "resultWithError:", &v32);
    v12 = v32;

    if (v18)
    {

      +[AMSURLAction retryAction](AMSURLAction, "retryAction");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setReason:", CFSTR("anisette-SP"));
      objc_msgSend(v26, "setRetryIdentifier:", 0x1E2549E00);
      goto LABEL_12;
    }
    if (!objc_msgSend(a1, "_shouldRetryAfterError:", v12))
    {

      if (!v12)
        goto LABEL_14;
LABEL_10:
      +[AMSURLAction actionWithError:](AMSURLAction, "actionWithError:", v12, v28);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

      goto LABEL_15;
    }
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v19, "OSLogObject", v28);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = a4;
      v22 = v9;
      v23 = (void *)objc_opt_class();
      v30 = v23;
      AMSLogKey();
      v24 = v10;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v28;
      v34 = v23;
      v9 = v22;
      a4 = v21;
      v35 = 2114;
      v36 = v25;
      _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Retrying machine data proivsioning", buf, 0x16u);

      v10 = v24;
      v11 = v29;

    }
    --v13;
  }
  while (v13);
  if (v12)
    goto LABEL_10;
LABEL_14:
  v26 = 0;
LABEL_15:

  return v26;
}

+ (id)_syncMachineWithActionData:(id)a3 type:(int64_t)a4 account:(id)a5 bag:(id)a6
{
  id v10;
  uint64_t v11;
  char **p_name;
  __int128 v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  char **v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  int64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v29 = a5;
  v28 = a6;
  v10 = 0;
  v11 = 5;
  p_name = &AMSExpressCheckoutPaymentChoices__classData.name;
  *(_QWORD *)&v13 = 138543618;
  v25 = v13;
  v26 = a4;
  while (1)
  {

    v14 = (void *)objc_msgSend(objc_alloc((Class)(p_name + 235)), "initWithData:type:account:bag:", v30, a4, v29, v28);
    objc_msgSend(v14, "performSync");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v16 = objc_msgSend(v15, "resultWithError:", &v31);
    v10 = v31;

    if ((v16 & 1) != 0)
    {

      +[AMSURLAction retryAction](AMSURLAction, "retryAction");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setReason:", CFSTR("anisette-SM"));
      objc_msgSend(v23, "setRetryIdentifier:", 0x1E2549E20);
      goto LABEL_13;
    }
    if (!objc_msgSend(a1, "_shouldRetryAfterError:", v10))
      break;
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v17, "OSLogObject", v25);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = p_name;
      v20 = a1;
      v21 = (void *)objc_opt_class();
      v27 = v21;
      AMSLogKey();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v25;
      v33 = v21;
      a1 = v20;
      p_name = v19;
      v34 = 2114;
      v35 = v22;
      _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Retrying machine data sync", buf, 0x16u);

      a4 = v26;
    }

    if (!--v11)
      goto LABEL_12;
  }

LABEL_12:
  v23 = 0;
LABEL_13:

  return v23;
}

+ (BOOL)_shouldRetryAfterError:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

  return v4;
}

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

@end

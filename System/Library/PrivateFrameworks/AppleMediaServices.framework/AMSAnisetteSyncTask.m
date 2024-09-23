@implementation AMSAnisetteSyncTask

- (AMSAnisetteSyncTask)initWithData:(id)a3 type:(int64_t)a4 account:(id)a5 bag:(id)a6
{
  id v11;
  id v12;
  id v13;
  AMSAnisetteSyncTask *v14;
  AMSAnisetteSyncTask *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)AMSAnisetteSyncTask;
  v14 = -[AMSTask init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_data, a3);
    v15->_type = a4;
    objc_storeStrong((id *)&v15->_account, a5);
    objc_storeStrong((id *)&v15->_bag, a6);
  }

  return v15;
}

- (id)performSync
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__AMSAnisetteSyncTask_performSync__block_invoke;
  v3[3] = &unk_1E253DF08;
  v3[4] = self;
  -[AMSTask performBinaryTaskWithBlock:](self, "performBinaryTaskWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL __34__AMSAnisetteSyncTask_performSync__block_invoke(uint64_t a1, _QWORD *a2)
{
  _UNKNOWN **v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  AMSURLRequestEncoder *v27;
  void *v28;
  AMSURLRequestEncoder *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  void *v48;
  id v49;
  void *v50;
  NSObject *v51;
  void *v52;
  id v53;
  void *v54;
  void *v56;
  void *v57;
  id v59;
  id v60;
  unsigned int v61;
  uint64_t v62;
  unsigned int v63;
  uint64_t v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v3 = &off_1E2519000;
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
    v6 = (void *)objc_opt_class();
    v7 = v6;
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(*(id *)(a1 + 32), "type");
    objc_msgSend(*(id *)(a1 + 32), "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ams_DSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v66 = v6;
    v67 = 2114;
    v68 = v8;
    v69 = 2048;
    v70 = v9;
    v71 = 2114;
    v72 = v12;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting sync with type: %ld account: %{public}@", buf, 0x2Au);

    v3 = &off_1E2519000;
  }

  v64 = 0;
  v63 = 0;
  v62 = 0;
  v61 = 0;
  v13 = objc_msgSend(*(id *)(a1 + 32), "type");
  objc_msgSend(*(id *)(a1 + 32), "account");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[AMSAnisette _accountIDForType:account:](AMSAnisette, "_accountIDForType:account:", v13, v14);

  objc_msgSend(*(id *)(a1 + 32), "data");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = objc_msgSend(v16, "bytes");
  objc_msgSend(*(id *)(a1 + 32), "data");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  tn46gtiuhw(v15, v17, objc_msgSend(v18, "length"), (uint64_t)&v64, (uint64_t)&v63, (uint64_t)&v62, (uint64_t)&v61);
  v20 = v19;

  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sync failed with error code: %ld"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    AMSError(307, CFSTR("Anisette Sync Failed"), v21, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v23 = 0;
  }
  else
  {
    v24 = objc_alloc(MEMORY[0x1E0C99D50]);
    v21 = (void *)objc_msgSend(v24, "initWithBytesNoCopy:length:freeWhenDone:", v62, v61, 0);
    v25 = objc_alloc(MEMORY[0x1E0C99D50]);
    v26 = (void *)objc_msgSend(v25, "initWithBytesNoCopy:length:freeWhenDone:", v64, v63, 0);
    v27 = [AMSURLRequestEncoder alloc];
    objc_msgSend(*(id *)(a1 + 32), "bag");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[AMSURLRequestEncoder initWithBag:](v27, "initWithBag:", v28);

    -[AMSURLRequestEncoder setDialogOptions:](v29, "setDialogOptions:", 1);
    -[AMSURLRequestEncoder setRequestEncoding:](v29, "setRequestEncoding:", 2);
    v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v21, "base64EncodedStringWithOptions:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v31, CFSTR("clientData"));

    objc_msgSend(v26, "base64EncodedStringWithOptions:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v32, CFSTR("machineId"));

    v33 = objc_msgSend(*(id *)(a1 + 32), "type");
    objc_msgSend(*(id *)(a1 + 32), "bag");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v33 == 2)
    {
      objc_msgSend(v34, "URLForKey:", 0x1E254C3E0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v34, "URLForKey:", 0x1E254C440);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v15);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKeyedSubscript:", v35, CFSTR("dsId"));
    }

    -[AMSURLRequestEncoder requestWithMethod:bagURL:parameters:](v29, "requestWithMethod:bagURL:parameters:", 4, v36, v30);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0;
    objc_msgSend(v37, "resultWithError:", &v60);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v60;

    if (v22)
    {
      v39 = 0;
      v23 = 0;
    }
    else
    {
      v57 = v26;
      +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "dataTaskPromiseWithRequest:", v38);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = 0;
      objc_msgSend(v41, "resultWithError:", &v59);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v59;

      if (v22)
      {
        v23 = 0;
        v26 = v57;
      }
      else
      {
        objc_msgSend(v39, "object");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v26 = v57;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v43 = v42;
        else
          v43 = 0;

        v56 = v43;
        objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("syncState"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v23 = v44;
        else
          v23 = 0;

        v22 = 0;
      }
    }

    v3 = &off_1E2519000;
  }

  if (v64)
    jk24uiwqrg(v64);
  if (v62)
    jk24uiwqrg(v62);
  objc_msgSend(v3[274], "sharedAccountsConfig");
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)v45;
  if (v22)
  {
    if (!v45)
    {
      objc_msgSend(v3[274], "sharedConfig");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v46, "OSLogObject");
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      v48 = (void *)objc_opt_class();
      v49 = v48;
      AMSLogKey();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v66 = v48;
      v67 = 2114;
      v68 = v50;
      v69 = 2112;
      v70 = (uint64_t)v23;
      v71 = 2114;
      v72 = v22;
      _os_log_impl(&dword_18C849000, v47, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Synchronize failed. (state: %@) %{public}@", buf, 0x2Au);

    }
    if (a2)
      *a2 = objc_retainAutorelease(v22);
  }
  else
  {
    if (!v45)
    {
      objc_msgSend(v3[274], "sharedConfig");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v46, "OSLogObject");
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = (void *)objc_opt_class();
      v53 = v52;
      AMSLogKey();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v66 = v52;
      v67 = 2114;
      v68 = v54;
      v69 = 2112;
      v70 = (uint64_t)v23;
      _os_log_impl(&dword_18C849000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Synchronize succeeded. (state: %@)", buf, 0x20u);

    }
  }

  return v22 == 0;
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSData)data
{
  return self->_data;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end

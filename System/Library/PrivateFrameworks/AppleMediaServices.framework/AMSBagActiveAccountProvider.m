@implementation AMSBagActiveAccountProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_previouslyAccessedAccount, 0);
}

id __71__AMSBagActiveAccountProvider_bagStorefrontPromiseForAccountMediaType___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[AMSBagActiveAccountProvider _storefrontPromiseResultForAccountMediaType:account:](AMSBagActiveAccountProvider, "_storefrontPromiseResultForAccountMediaType:account:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithPromiseResult:](AMSPromise, "promiseWithPromiseResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setPreviouslyAccessedAccount:(id)a3
{
  ACAccount *v4;
  ACAccount *previouslyAccessedAccount;

  v4 = (ACAccount *)a3;
  os_unfair_lock_lock_with_options();
  previouslyAccessedAccount = self->_previouslyAccessedAccount;
  self->_previouslyAccessedAccount = v4;

  os_unfair_lock_unlock(&self->_accountLock);
}

- (AMSBagActiveAccountProvider)init
{
  AMSBagActiveAccountProvider *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSBagActiveAccountProvider;
  result = -[AMSBagActiveAccountProvider init](&v3, sel_init);
  if (result)
    result->_accountLock._os_unfair_lock_opaque = 0;
  return result;
}

- (NSString)identity
{
  return (NSString *)CFSTR("active-account");
}

- (id)bagStorefrontPromiseForAccountMediaType:(id)a3
{
  id v4;
  AMSMutablePromise *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = objc_alloc_init(AMSMutablePromise);
  -[AMSPromise completionHandlerAdapter](v5, "completionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSBagActiveAccountProvider _bagAccountForAccountMediaType:mustContainStorefront:sync:completion:](self, "_bagAccountForAccountMediaType:mustContainStorefront:sync:completion:", v4, 1, 0, v6);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__AMSBagActiveAccountProvider_bagStorefrontPromiseForAccountMediaType___block_invoke;
  v10[3] = &unk_1E253E808;
  v11 = v4;
  v7 = v4;
  -[AMSMutablePromise thenWithBlock:](v5, "thenWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)bagAccountPromiseForAccountMediaType:(id)a3
{
  id v4;
  AMSMutablePromise *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(AMSMutablePromise);
  -[AMSPromise completionHandlerAdapter](v5, "completionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSBagActiveAccountProvider _bagAccountForAccountMediaType:mustContainStorefront:sync:completion:](self, "_bagAccountForAccountMediaType:mustContainStorefront:sync:completion:", v4, 0, 0, v6);

  return v5;
}

- (id)bagStorefrontForAccountMediaType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__8;
  v13 = __Block_byref_object_dispose__8;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__AMSBagActiveAccountProvider_bagStorefrontForAccountMediaType___block_invoke;
  v8[3] = &unk_1E253E7E0;
  v8[4] = &v9;
  -[AMSBagActiveAccountProvider _bagAccountForAccountMediaType:mustContainStorefront:sync:completion:](self, "_bagAccountForAccountMediaType:mustContainStorefront:sync:completion:", v4, 1, 1, v8);
  if (v10[5])
  {
    +[AMSBagActiveAccountProvider _storefrontPromiseResultForAccountMediaType:account:](AMSBagActiveAccountProvider, "_storefrontPromiseResultForAccountMediaType:account:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (ACAccount)previouslyAccessedAccount
{
  os_unfair_lock_s *p_accountLock;
  ACAccount *v4;

  p_accountLock = &self->_accountLock;
  os_unfair_lock_lock_with_options();
  v4 = self->_previouslyAccessedAccount;
  os_unfair_lock_unlock(p_accountLock);
  return v4;
}

- (BOOL)associatedAccountIsEqualToAccount:(id)a3 forMediaType:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "ams_isLocalAccount") & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    -[AMSBagActiveAccountProvider previouslyAccessedAccount](self, "previouslyAccessedAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v6, "accountType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_accountTypeIdentifierForMediaType:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", v12))
      {
        objc_msgSend(v9, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v13, "isEqualToString:", v14);

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)bagAccountForAccountMediaType:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__8;
  v12 = __Block_byref_object_dispose__8;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__AMSBagActiveAccountProvider_bagAccountForAccountMediaType___block_invoke;
  v7[3] = &unk_1E253E7E0;
  v7[4] = &v8;
  -[AMSBagActiveAccountProvider _bagAccountForAccountMediaType:mustContainStorefront:sync:completion:](self, "_bagAccountForAccountMediaType:mustContainStorefront:sync:completion:", v4, 0, 1, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __61__AMSBagActiveAccountProvider_bagAccountForAccountMediaType___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __64__AMSBagActiveAccountProvider_bagStorefrontForAccountMediaType___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (id)_storefrontPromiseResultForAccountMediaType:(id)a3 account:(id)a4
{
  id v5;
  void *v6;
  AMSPromiseResult *v7;
  void *v8;
  void *v9;

  v5 = a3;
  objc_msgSend(a4, "ams_storefrontForMediaType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[AMSPromiseResult initWithResult:error:]([AMSPromiseResult alloc], "initWithResult:error:", v6, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Account has no storefront for mediatype %@"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    AMSError(7, CFSTR("No storefront found"), v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AMSPromiseResult initWithResult:error:]([AMSPromiseResult alloc], "initWithResult:error:", 0, v9);

  }
  return v7;
}

- (void)_bagAccountForAccountMediaType:(id)a3 mustContainStorefront:(BOOL)a4 sync:(BOOL)a5 completion:(id)a6
{
  uint64_t v6;
  uint64_t v8;
  _BOOL8 v9;
  id v11;
  void (**v12)(id, void *, _QWORD);
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  unsigned int v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v8 = a5;
  v9 = a4;
  v45 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (void (**)(id, void *, _QWORD))a6;
  if (!v11)
  {
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
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
      v39 = v8;
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB3940];
      v17 = objc_opt_class();
      v18 = v17;
      if (v15)
      {
        AMSLogKey();
        v6 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: [%@] "), v18, v6);
      }
      else
      {
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: "), v17);
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v19;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@No media type was provided. The default will be used instead.", buf, 0xCu);
      v8 = v39;
      if (v15)
      {

        v19 = (void *)v6;
      }

    }
  }
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStoreForMediaType:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSBagActiveAccountProvider _activeAccountInStore:forMediaType:](self, "_activeAccountInStore:forMediaType:", v20, v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
    v23 = !v9;
  else
    v23 = 1;
  if (!v23)
  {
    objc_msgSend(v21, "ams_storefrontForMediaType:", v11);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
      goto LABEL_24;
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v24, "OSLogObject");
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
LABEL_37:

      -[AMSBagActiveAccountProvider _localAccountInStore:mediaType:mustContainStorefront:sync:completion:](self, "_localAccountInStore:mediaType:mustContainStorefront:sync:completion:", v20, v11, v9, v8, v12);
      goto LABEL_38;
    }
    v40 = v8;
    AMSLogKey();
    v31 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)MEMORY[0x1E0CB3940];
    v32 = objc_opt_class();
    v33 = v32;
    v38 = (void *)v31;
    if (v31)
    {
      AMSLogKey();
      v35 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringWithFormat:", CFSTR("%@: [%@] "), v33, v35);
    }
    else
    {
      objc_msgSend(v37, "stringWithFormat:", CFSTR("%@: "), v32);
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v42 = v29;
    v43 = 2114;
    v44 = v11;
    v34 = "%{public}@There’s an active account, but a required storefront is missing. Falling back to the local account. "
          "mediaType = %{public}@";
LABEL_34:
    _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_DEBUG, v34, buf, 0x16u);
    v8 = v40;
    if (v38)
    {

      v29 = (void *)v35;
    }

    goto LABEL_37;
  }
  if (!v21)
  {
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v24, "OSLogObject");
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      goto LABEL_37;
    v40 = v8;
    AMSLogKey();
    v26 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x1E0CB3940];
    v27 = objc_opt_class();
    v28 = v27;
    v38 = (void *)v26;
    if (v26)
    {
      AMSLogKey();
      v35 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stringWithFormat:", CFSTR("%@: [%@] "), v28, v35);
    }
    else
    {
      objc_msgSend(v36, "stringWithFormat:", CFSTR("%@: "), v27);
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v42 = v29;
    v43 = 2114;
    v44 = v11;
    v34 = "%{public}@There’s no active account. Falling back to the local account. mediaType = %{public}@";
    goto LABEL_34;
  }
LABEL_24:
  -[AMSBagActiveAccountProvider setPreviouslyAccessedAccount:](self, "setPreviouslyAccessedAccount:", v22);
  v12[2](v12, v22, 0);
LABEL_38:

}

- (id)_activeAccountInStore:(id)a3 forMediaType:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  objc_msgSend(a3, "ams_iTunesAccounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__AMSBagActiveAccountProvider__activeAccountInStore_forMediaType___block_invoke;
    v9[3] = &unk_1E253E830;
    v10 = v5;
    objc_msgSend(v6, "ams_firstObjectPassingTest:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __66__AMSBagActiveAccountProvider__activeAccountInStore_forMediaType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ams_isActiveForMediaType:", *(_QWORD *)(a1 + 32));
}

- (void)_localAccountInStore:(id)a3 mediaType:(id)a4 mustContainStorefront:(BOOL)a5 sync:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(void *, uint64_t, id);
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  _QWORD aBlock[5];
  id v23;
  id v24;
  BOOL v25;

  v8 = a6;
  v12 = a4;
  v13 = a7;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__AMSBagActiveAccountProvider__localAccountInStore_mediaType_mustContainStorefront_sync_completion___block_invoke;
  aBlock[3] = &unk_1E253E858;
  aBlock[4] = self;
  v25 = a5;
  v14 = v12;
  v23 = v14;
  v15 = v13;
  v24 = v15;
  v16 = a3;
  v17 = (void (**)(void *, uint64_t, id))_Block_copy(aBlock);
  objc_msgSend(v16, "ams_mediaType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v21 = 0;
    objc_msgSend(v16, "ams_localiTunesAccountForAccountMediaType:error:", v18, &v21);
    v19 = objc_claimAutoreleasedReturnValue();

    v20 = v21;
    v17[2](v17, v19, v20);
    v18 = (void *)v19;
  }
  else
  {
    objc_msgSend(v16, "_ams_localiTunesAccountForAccountMediaType:updateStorefront:", v18, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "addFinishBlock:", v17);
  }

}

void __100__AMSBagActiveAccountProvider__localAccountInStore_mediaType_mustContainStorefront_sync_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v4 = *(unsigned __int8 *)(a1 + 56);
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v9 = 0;
  objc_msgSend(v5, "_handleFetchedLocalAccount:fetchError:mustContainStorefront:mediaType:error:", a2, a3, v4, v6, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)_handleFetchedLocalAccount:(id)a3 fetchError:(id)a4 mustContainStorefront:(BOOL)a5 mediaType:(id)a6 error:(id *)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  uint64_t v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v9 = a5;
  v42 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  if (!v12)
  {
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
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
      AMSLogKey();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0CB3940];
      v21 = objc_opt_class();
      v22 = v21;
      if (v19)
      {
        AMSLogKey();
        v35 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: [%@] "), v22, v35);
      }
      else
      {
        objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: "), v21);
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v23;
      v38 = 2114;
      v39 = v14;
      _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to fetch local account. This will prevent initial bag requests from specifying storefront / cookies. mediaType = %{public}@", buf, 0x16u);
      if (v19)
      {

        v23 = (void *)v35;
      }

    }
    if (a7)
    {
      v31 = CFSTR("Local account not found");
      v32 = v13;
LABEL_27:
      AMSError(7, v31, 0, v32);
      v16 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
LABEL_28:
    v16 = 0;
    goto LABEL_29;
  }
  if (v9)
  {
    objc_msgSend(v12, "ams_storefrontForMediaType:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
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
        AMSLogKey();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)MEMORY[0x1E0CB3940];
        v28 = objc_opt_class();
        v29 = v28;
        if (v26)
        {
          AMSLogKey();
          v35 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "stringWithFormat:", CFSTR("%@: [%@] "), v29, v35);
        }
        else
        {
          objc_msgSend(v27, "stringWithFormat:", CFSTR("%@: "), v28);
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v12);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v37 = v30;
        v38 = 2114;
        v39 = v33;
        v40 = 2114;
        v41 = v14;
        _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_ERROR, "%{public}@The local account doesn’t have a storefront. localAccount = %{public}@ | mediaType = %{public}@", buf, 0x20u);
        if (v26)
        {

          v30 = (void *)v35;
        }

      }
      if (a7)
      {
        v31 = CFSTR("Local account found but has missing storefront");
        v32 = 0;
        goto LABEL_27;
      }
      goto LABEL_28;
    }
  }
  v16 = v12;
LABEL_29:
  -[AMSBagActiveAccountProvider setPreviouslyAccessedAccount:](self, "setPreviouslyAccessedAccount:", v16);

  return v16;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

@end

@implementation AMSAccountsChangedObservable

- (void)subscribe:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSAccountsChangedObservable observable](self, "observable");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscribe:", v4);

}

- (AMSObservable)observable
{
  return self->_observable;
}

+ (AMSAccountsChangedObservable)sharedInstance
{
  if (qword_1ECEACEB0 != -1)
    dispatch_once(&qword_1ECEACEB0, &__block_literal_global_13);
  return (AMSAccountsChangedObservable *)(id)qword_1ECEACEB8;
}

void __46__AMSAccountsChangedObservable_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AMSAccountsChangedObservable _initWithAccount:accountTypeIdentifier:]([AMSAccountsChangedObservable alloc], "_initWithAccount:accountTypeIdentifier:", 0, 0);
  v1 = (void *)qword_1ECEACEB8;
  qword_1ECEACEB8 = (uint64_t)v0;

}

- (id)_initWithAccount:(id)a3 accountTypeIdentifier:(id)a4
{
  id v7;
  id v8;
  AMSAccountsChangedObservable *v9;
  AMSAccountsChangedObservable *v10;
  NSString *v11;
  void *accountTypeIdentifier;
  uint64_t v13;
  NSString *v14;
  AMSObservable *v15;
  AMSObservable *observable;
  void *v17;
  char v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  _QWORD *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _QWORD v31[4];
  AMSAccountsChangedObservable *v32;
  objc_super v33;
  __int128 buf;
  uint64_t (*v35)(uint64_t);
  void *v36;
  id v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v33.receiver = self;
  v33.super_class = (Class)AMSAccountsChangedObservable;
  v9 = -[AMSAccountsChangedObservable init](&v33, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    if (v8)
    {
      v11 = (NSString *)v8;
      accountTypeIdentifier = v10->_accountTypeIdentifier;
      v10->_accountTypeIdentifier = v11;
    }
    else
    {
      objc_msgSend(v7, "accountType");
      accountTypeIdentifier = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(accountTypeIdentifier, "identifier");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v10->_accountTypeIdentifier;
      v10->_accountTypeIdentifier = (NSString *)v13;

    }
    v10->_notificationsLock._os_unfair_lock_opaque = 0;
    v15 = objc_alloc_init(AMSObservable);
    observable = v10->_observable;
    v10->_observable = v15;

    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isAccountsDaemon");

    if ((v18 & 1) != 0)
    {
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v19, "OSLogObject");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v21 = objc_opt_class();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v21;
        _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEBUG, "[%{public}@] Running in accountsd.", (uint8_t *)&buf, 0xCu);
      }

      +[AMSAccountsChangedObservable createdObservablesAccessQueue](AMSAccountsChangedObservable, "createdObservablesAccessQueue");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = MEMORY[0x1E0C809B0];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __71__AMSAccountsChangedObservable__initWithAccount_accountTypeIdentifier___block_invoke;
      v31[3] = &unk_1E253DBD8;
      v32 = v10;
      v24 = v31;
      AMSLogKey();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = v23;
      *((_QWORD *)&buf + 1) = 3221225472;
      v35 = __AMSDispatchAsync_block_invoke;
      v36 = &unk_1E253DC28;
      v37 = v25;
      v38 = v24;
      v26 = v25;
      dispatch_async(v22, &buf);

      v27 = v32;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *MEMORY[0x1E0C8F010];
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObserver:selector:name:object:", v10, sel__accountStoreDidChange_, v28, v29);

    }
  }

  return v10;
}

- (AMSAccountsChangedObservable)initWithAccount:(id)a3
{
  return (AMSAccountsChangedObservable *)-[AMSAccountsChangedObservable _initWithAccount:accountTypeIdentifier:](self, "_initWithAccount:accountTypeIdentifier:", a3, 0);
}

- (AMSAccountsChangedObservable)initWithAccountTypeIdentifier:(id)a3
{
  return (AMSAccountsChangedObservable *)-[AMSAccountsChangedObservable _initWithAccount:accountTypeIdentifier:](self, "_initWithAccount:accountTypeIdentifier:", 0, a3);
}

void __71__AMSAccountsChangedObservable__initWithAccount_accountTypeIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  +[AMSAccountsChangedObservable createdObservables](AMSAccountsChangedObservable, "createdObservables");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addPointer:", *(_QWORD *)(a1 + 32));

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AMSAccountsChangedObservable;
  -[AMSAccountsChangedObservable dealloc](&v4, sel_dealloc);
}

+ (NSPointerArray)createdObservables
{
  void *v2;
  int v3;
  id v4;

  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAccountsDaemon");

  if (v3)
  {
    if (_MergedGlobals_76 != -1)
      dispatch_once(&_MergedGlobals_76, &__block_literal_global_3);
    v4 = (id)qword_1ECEACE98;
  }
  else
  {
    v4 = 0;
  }
  return (NSPointerArray *)v4;
}

void __50__AMSAccountsChangedObservable_createdObservables__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEACE98;
  qword_1ECEACE98 = v0;

}

+ (OS_dispatch_queue)createdObservablesAccessQueue
{
  void *v2;
  int v3;
  id v4;

  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAccountsDaemon");

  if (v3)
  {
    if (qword_1ECEACEA0 != -1)
      dispatch_once(&qword_1ECEACEA0, &__block_literal_global_11_0);
    v4 = (id)qword_1ECEACEA8;
  }
  else
  {
    v4 = 0;
  }
  return (OS_dispatch_queue *)v4;
}

void __61__AMSAccountsChangedObservable_createdObservablesAccessQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.AppleMediaServices.AMSAccountsChangedObservable.createdObservables", 0);
  v1 = (void *)qword_1ECEACEA8;
  qword_1ECEACEA8 = (uint64_t)v0;

}

+ (AMSAccountsChangedObservable)sharedLocalAccountInstance
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD block[4];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_localiTunesAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__AMSAccountsChangedObservable_sharedLocalAccountInstance__block_invoke;
    block[3] = &unk_1E253DBD8;
    v5 = v4;
    v14 = v5;
    if (qword_1ECEACEC0 == -1)
    {
      v6 = v5;
    }
    else
    {
      dispatch_once(&qword_1ECEACEC0, block);
      v6 = v14;
    }
    v7 = (id)qword_1ECEACEC8;

  }
  else
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
      *(_DWORD *)buf = 138543618;
      v16 = v10;
      v17 = 2114;
      v18 = v11;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch the local account.", buf, 0x16u);

    }
    objc_msgSend(a1, "sharedInstance");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (AMSAccountsChangedObservable *)v7;
}

void __58__AMSAccountsChangedObservable_sharedLocalAccountInstance__block_invoke(uint64_t a1)
{
  AMSAccountsChangedObservable *v1;
  void *v2;

  v1 = -[AMSAccountsChangedObservable initWithAccount:]([AMSAccountsChangedObservable alloc], "initWithAccount:", *(_QWORD *)(a1 + 32));
  v2 = (void *)qword_1ECEACEC8;
  qword_1ECEACEC8 = (uint64_t)v1;

}

- (void)unsubscribe:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSAccountsChangedObservable observable](self, "observable");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unsubscribe:", v4);

}

- (void)_accountStoreDidChange:(id)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  _BOOL4 v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  AMSAccountsChangedObservable *v65;
  _QWORD v66[5];
  id v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C8F0F8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C8F170]) & 1) != 0
    || (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C8F180]) & 1) != 0)
  {
    objc_msgSend(v5, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EF30]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v11)
    {
      if (!v12)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v13 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v13, "OSLogObject");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        AMSLogKey();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x1E0CB3940];
        v23 = objc_opt_class();
        v24 = v23;
        if (v21)
        {
          AMSLogKey();
          self = (AMSAccountsChangedObservable *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: [%@] "), v24, self);
        }
        else
        {
          objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: "), v23);
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(0);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v69 = v25;
        v70 = 2114;
        v71 = v57;
        _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring an ACAccountStoreDidChangeNotification. accountIdentifier = %{public}@", buf, 0x16u);
        if (v21)
        {

          v25 = self;
        }

      }
      goto LABEL_75;
    }
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v13, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB3940];
      v17 = objc_opt_class();
      v18 = v17;
      if (v15)
      {
        AMSLogKey();
        v3 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: [%@] "), v18, v3);
      }
      else
      {
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: "), v17);
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v19;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Received an ACAccountStoreDidChangeNotification.", buf, 0xCu);
      if (v15)
      {

        v19 = (void *)v3;
      }

    }
    objc_msgSend(v5, "object");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v31;

      if (v13)
      {
LABEL_43:
        -[NSObject _ams_fetchAccountWithIdentifier:](v13, "_ams_fetchAccountWithIdentifier:", v11);
        v41 = objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          v20 = v41;
          v66[0] = MEMORY[0x1E0C809B0];
          v66[1] = 3221225472;
          v66[2] = __55__AMSAccountsChangedObservable__accountStoreDidChange___block_invoke;
          v66[3] = &unk_1E253DC00;
          v66[4] = self;
          v67 = v11;
          -[NSObject addFinishBlock:](v20, "addFinishBlock:", v66);

        }
        else
        {
          v42 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
          +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
          v43 = objc_claimAutoreleasedReturnValue();
          v44 = (void *)v43;
          if (v42)
          {
            if (!v43)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v44, "OSLogObject");
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              AMSLogKey();
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = (void *)MEMORY[0x1E0CB3940];
              v48 = objc_opt_class();
              v49 = v48;
              if (v46)
              {
                AMSLogKey();
                v65 = (AMSAccountsChangedObservable *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "stringWithFormat:", CFSTR("%@: [%@] "), v49, v65);
              }
              else
              {
                objc_msgSend(v47, "stringWithFormat:", CFSTR("%@: "), v48);
              }
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              AMSHashIfNeeded(v13);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              AMSHashIfNeeded(v11);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v69 = v50;
              v70 = 2114;
              v71 = v59;
              v72 = 2114;
              v73 = v60;
              _os_log_impl(&dword_18C849000, v45, OS_LOG_TYPE_ERROR, "%{public}@Could not create account promise. accountStore = %{public}@ | accountIdentifier = %{public}@", buf, 0x20u);
              if (v46)
              {

                v50 = v65;
              }

            }
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v62, 0);

          }
          else
          {
            if (!v43)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v44, "OSLogObject");
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
            {
              AMSLogKey();
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = (void *)MEMORY[0x1E0CB3940];
              v54 = objc_opt_class();
              v55 = v54;
              if (v52)
              {
                AMSLogKey();
                v65 = (AMSAccountsChangedObservable *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "stringWithFormat:", CFSTR("%@: [%@] "), v55, v65);
              }
              else
              {
                objc_msgSend(v53, "stringWithFormat:", CFSTR("%@: "), v54);
              }
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              AMSHashIfNeeded(v13);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              AMSHashIfNeeded(v11);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v69 = v56;
              v70 = 2114;
              v71 = v63;
              v72 = 2114;
              v73 = v64;
              _os_log_impl(&dword_18C849000, v51, OS_LOG_TYPE_FAULT, "%{public}@Could not create account promise. accountStore = %{public}@ | accountIdentifier = %{public}@", buf, 0x20u);
              if (v52)
              {

                v56 = v65;
              }

            }
          }
          v20 = 0;
        }
LABEL_75:

        goto LABEL_76;
      }
    }
    else
    {

    }
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
      AMSLogKey();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x1E0CB3940];
      v36 = objc_opt_class();
      v37 = v36;
      v65 = self;
      if (v34)
      {
        AMSLogKey();
        v3 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringWithFormat:", CFSTR("%@: [%@] "), v37, v3);
      }
      else
      {
        objc_msgSend(v35, "stringWithFormat:", CFSTR("%@: "), v36);
      }
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "object");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v69 = v38;
      v70 = 2114;
      v71 = v40;
      _os_log_impl(&dword_18C849000, v33, OS_LOG_TYPE_ERROR, "%{public}@The notification’s object was not an ACAccountStore. object = %{public}@", buf, 0x16u);

      if (v34)
      {

        v38 = (void *)v3;
      }

      self = v65;
    }

    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "OSLogObject");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    AMSLogKey();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1E0CB3940];
    v28 = objc_opt_class();
    v29 = v28;
    if (v26)
    {
      AMSLogKey();
      self = (AMSAccountsChangedObservable *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", CFSTR("%@: [%@] "), v29, self);
    }
    else
    {
      objc_msgSend(v27, "stringWithFormat:", CFSTR("%@: "), v28);
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v8);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v69 = v30;
    v70 = 2114;
    v71 = v58;
    _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring an ACAccountStoreDidChangeNotification. accountType = %{public}@", buf, 0x16u);
    if (v26)
    {

      v30 = self;
    }

  }
LABEL_76:

}

void __55__AMSAccountsChangedObservable__accountStoreDidChange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(*(id *)(a1 + 32), "_processChangedAccount:", v6);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  }
  else
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = objc_opt_class();
      v13 = v12;
      if (v10)
      {
        AMSLogKey();
        v3 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: [%@] "), v13, v3);
      }
      else
      {
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: "), v12);
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(*(void **)(a1 + 40));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v14;
      v19 = 2114;
      v20 = v15;
      v21 = 2114;
      v22 = v16;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@Error fetching account. identifier = %{public}@ | error = %{public}@", buf, 0x20u);
      if (v10)
      {

        v14 = (void *)v3;
      }

    }
  }

}

- (void)_processChangedAccount:(id)a3
{
  id v4;
  BOOL v5;
  uint64_t v6;
  AMSAccountsChangedResult *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[AMSAccountsChangedObservable _shouldNotifyObserversForChangedAccount:](self, "_shouldNotifyObserversForChangedAccount:", v4);
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (AMSAccountsChangedResult *)v6;
  if (v5)
  {
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (AMSAccountsChangedResult *)objc_claimAutoreleasedReturnValue();
    }
    -[AMSAccountsChangedResult OSLogObject](v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = objc_opt_class();
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v9;
      v18 = 2114;
      v19 = v10;
      v20 = 2114;
      v21 = v11;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEBUG, "[%{public}@] [%{public}@] Notifying observers of a changed account. changedAccount = %{public}@", (uint8_t *)&v16, 0x20u);

    }
    v7 = -[AMSAccountsChangedResult initWithAccount:]([AMSAccountsChangedResult alloc], "initWithAccount:", v4);
    -[AMSAccountsChangedObservable observable](self, "observable");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject sendResult:](v12, "sendResult:", v7);
  }
  else
  {
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (AMSAccountsChangedResult *)objc_claimAutoreleasedReturnValue();
    }
    -[AMSAccountsChangedResult OSLogObject](v7, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v13;
      v18 = 2114;
      v19 = v14;
      v20 = 2114;
      v21 = v15;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEBUG, "[%{public}@] [%{public}@] Ignoring a change account. account = %{public}@", (uint8_t *)&v16, 0x20u);

    }
  }

}

+ (void)_processChangedAccount:(id)a3
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD block[4];
  id v14;
  id v15;

  v3 = a3;
  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAccountsDaemon");

  if (v5)
  {
    +[AMSAccountsChangedObservable createdObservablesAccessQueue](AMSAccountsChangedObservable, "createdObservablesAccessQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55__AMSAccountsChangedObservable__processChangedAccount___block_invoke;
    v11[3] = &unk_1E253DBD8;
    v12 = v3;
    v8 = v11;
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __AMSDispatchAsync_block_invoke;
    block[3] = &unk_1E253DC28;
    v14 = v9;
    v15 = v8;
    v10 = v9;
    dispatch_async(v6, block);

  }
}

void __55__AMSAccountsChangedObservable__processChangedAccount___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  void *v4;
  id v5;

  +[AMSAccountsChangedObservable createdObservables](AMSAccountsChangedObservable, "createdObservables");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v2 = 0;
    do
    {
      objc_msgSend(v5, "pointerAtIndex:", v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      if (v3)
        objc_msgSend(v3, "_processChangedAccount:", *(_QWORD *)(a1 + 32));

      ++v2;
    }
    while (v2 < objc_msgSend(v5, "count"));
  }
  objc_msgSend(v5, "compact");

}

- (BOOL)_shouldNotifyObserversForChangedAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  int v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AMSAccountsChangedObservable account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[AMSAccountsChangedObservable accountTypeIdentifier](self, "accountTypeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v14, "OSLogObject");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        goto LABEL_24;
      v27 = objc_opt_class();
      AMSLogKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v27;
      v31 = 2114;
      v32 = v17;
      v18 = "[%{public}@] [%{public}@] The observable responds to all account changes.";
      goto LABEL_23;
    }
  }
  -[AMSAccountsChangedObservable account](self, "account");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[AMSAccountsChangedObservable account](self, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) != 0)
    {

LABEL_8:
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v14, "OSLogObject");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        goto LABEL_24;
      v16 = objc_opt_class();
      AMSLogKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v16;
      v31 = 2114;
      v32 = v17;
      v18 = "[%{public}@] [%{public}@] The observable matches the changed account.";
LABEL_23:
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEBUG, v18, (uint8_t *)&v29, 0x16u);

LABEL_24:
      v26 = 1;
      goto LABEL_25;
    }
    -[AMSAccountsChangedObservable account](self, "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "ams_isDuplicate:", v4);

    if ((v13 & 1) != 0)
      goto LABEL_8;
  }
  -[AMSAccountsChangedObservable accountTypeIdentifier](self, "accountTypeIdentifier");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[AMSAccountsChangedObservable accountTypeIdentifier](self, "accountTypeIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v21, "isEqualToString:", v23);

    if (v24)
    {
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v14, "OSLogObject");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        goto LABEL_24;
      v25 = objc_opt_class();
      AMSLogKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v25;
      v31 = 2114;
      v32 = v17;
      v18 = "[%{public}@] [%{public}@] The observable matches the changed account type.";
      goto LABEL_23;
    }
  }
  v26 = 0;
LABEL_25:

  return v26;
}

- (ACAccount)account
{
  return self->_account;
}

- (NSString)accountTypeIdentifier
{
  return self->_accountTypeIdentifier;
}

- (void)setObservable:(id)a3
{
  objc_storeStrong((id *)&self->_observable, a3);
}

- (os_unfair_lock_s)notificationsLock
{
  return self->_notificationsLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observable, 0);
  objc_storeStrong((id *)&self->_accountTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end

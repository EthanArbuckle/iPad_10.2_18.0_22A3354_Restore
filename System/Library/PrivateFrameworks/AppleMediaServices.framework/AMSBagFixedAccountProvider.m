@implementation AMSBagFixedAccountProvider

- (AMSBagFixedAccountProvider)initWithAccount:(id)a3
{
  id v5;
  AMSBagFixedAccountProvider *v6;
  AMSBagFixedAccountProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSBagFixedAccountProvider;
  v6 = -[AMSBagFixedAccountProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (BOOL)associatedAccountIsEqualToAccount:(id)a3 forMediaType:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  -[AMSBagFixedAccountProvider account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v7, "isEqualToString:", v8);
  return (char)v5;
}

- (id)bagStorefrontForAccountMediaType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AMSBagFixedAccountProvider account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ams_storefrontForMediaType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)bagAccountPromiseForAccountMediaType:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v3 = self;
  v26 = *MEMORY[0x1E0C80C00];
  -[AMSBagFixedAccountProvider account](self, "account", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7)
    {
      if (!v8)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "OSLogObject");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0CB3940];
        v13 = objc_opt_class();
        v14 = v13;
        if (v11)
        {
          AMSLogKey();
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: [%@] "), v14, v3);
        }
        else
        {
          objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: "), v13);
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v15;
        _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@Account instance was unexpectedly nil", buf, 0xCu);
        if (v11)
        {

          v15 = v3;
        }

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v16, 0);
    }
    else
    {
      if (!v8)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "OSLogObject");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        AMSLogKey();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0CB3940];
        v19 = objc_opt_class();
        v20 = v19;
        if (v17)
        {
          AMSLogKey();
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringWithFormat:", CFSTR("%@: [%@] "), v20, v3);
        }
        else
        {
          objc_msgSend(v18, "stringWithFormat:", CFSTR("%@: "), v19);
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v21;
        _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_FAULT, "%{public}@Account instance was unexpectedly nil", buf, 0xCu);
        if (v17)
        {

          v21 = v3;
        }

      }
    }

    AMSError(0, CFSTR("Account instance was unexpectedly nil"), 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v6;

  return v22;
}

- (id)bagStorefrontPromiseForAccountMediaType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[AMSBagFixedAccountProvider account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBagActiveAccountProvider _storefrontPromiseResultForAccountMediaType:account:](AMSBagActiveAccountProvider, "_storefrontPromiseResultForAccountMediaType:account:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[AMSPromise promiseWithPromiseResult:](AMSPromise, "promiseWithPromiseResult:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)identity
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[AMSBagFixedAccountProvider account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("fixed-account-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end

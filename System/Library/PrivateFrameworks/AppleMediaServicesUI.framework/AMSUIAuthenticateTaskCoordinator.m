@implementation AMSUIAuthenticateTaskCoordinator

- (id)handleRequest:(id)a3 presentingViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];
  _QWORD v23[2];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v22[0] = CFSTR("AMSAuthenticateTaskCoordinatorItemKeyRequest");
    v22[1] = CFSTR("AMSAuthenticateTaskCoordinatorItemKeyPresentingViewController");
    v23[0] = v6;
    v23[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSAuthenticateTaskCoordinator handleRequestDictionary:](self, "handleRequestDictionary:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x24BDD17C8];
      v15 = objc_opt_class();
      v16 = v15;
      if (v13)
      {
        AMSLogKey();
        self = (AMSUIAuthenticateTaskCoordinator *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: [%@] "), v16, self);
      }
      else
      {
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: "), v15);
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v17;
      v26 = 2114;
      v27 = v18;
      v28 = 2114;
      v29 = v8;
      _os_log_impl(&dword_211102000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Missing a required parameter, unable to process the authenticate request. request = %{public}@ presentingViewController = %{public}@", buf, 0x20u);
      if (v13)
      {

        v17 = self;
      }

    }
    v19 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "promiseWithError:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v10;

  return v20;
}

- (id)_authenticateTaskForItem:(id)a3 authenticationResults:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  AMSUIAuthenticateTask *v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateTaskCoordinatorItemKeyRequest"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateTaskCoordinatorItemKeyPresentingViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[AMSUIAuthenticateTask initWithAuthenticationResults:presentingViewController:options:]([AMSUIAuthenticateTask alloc], "initWithAuthenticationResults:presentingViewController:options:", v5, v9, v8);
  return v10;
}

- (id)_authenticateTaskForItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  AMSUIAuthenticateTask *v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateTaskCoordinatorItemKeyRequest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AMSAuthenticateTaskCoordinatorItemKeyPresentingViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[AMSUIAuthenticateTask initWithRequest:presentingViewController:]([AMSUIAuthenticateTask alloc], "initWithRequest:presentingViewController:", v4, v5);
  return v6;
}

@end

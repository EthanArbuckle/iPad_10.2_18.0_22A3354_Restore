@implementation AMSUIDelegateTokenTask

- (AMSUIDelegateTokenTask)initWithDelegateAuthenticateRequest:(id)a3 account:(id)a4 presentingViewController:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  AMSUIDelegateTokenTask *v13;

  v8 = (void *)MEMORY[0x24BE08328];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "currentProcess");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[AMSUIDelegateTokenTask initWithDelegateAuthenticateRequest:account:processInfo:presentingViewController:](self, "initWithDelegateAuthenticateRequest:account:processInfo:presentingViewController:", v11, v10, v12, v9);

  return v13;
}

- (AMSUIDelegateTokenTask)initWithDelegateAuthenticateRequest:(id)a3 account:(id)a4 processInfo:(id)a5 presentingViewController:(id)a6
{
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  AMSUIDelegateTokenTask *v19;
  id v21;
  objc_super v22;

  v21 = a6;
  v11 = (void *)MEMORY[0x24BE08050];
  v12 = (void *)MEMORY[0x24BE08110];
  v13 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v12, "bagSubProfile");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE08110], "bagSubProfileVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bagForProfile:profileVersion:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22.receiver = self;
  v22.super_class = (Class)AMSUIDelegateTokenTask;
  v19 = -[AMSDelegateTokenTask initWithDelegateAuthenticateRequest:bag:processInfo:account:](&v22, sel_initWithDelegateAuthenticateRequest_bag_processInfo_account_, v15, v18, v13, v14);

  if (v19)
    objc_storeStrong((id *)&v19->_presentingViewController, a6);

  return v19;
}

- (id)perform
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __33__AMSUIDelegateTokenTask_perform__block_invoke;
  v3[3] = &unk_24CB4F228;
  v3[4] = self;
  -[AMSTask performTaskWithPromiseBlock:](self, "performTaskWithPromiseBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __33__AMSUIDelegateTokenTask_perform__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsMultiUserConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    AMSLogKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v4;
    v11 = 2114;
    v12 = v5;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_211102000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Retrieving delegate authentication token. Account = %{public}@", (uint8_t *)&v9, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "performRetrieveDelegateToken");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)authenticateTaskWithRequest:(id)a3
{
  id v4;
  AMSUIAuthenticateTask *v5;
  void *v6;
  AMSUIAuthenticateTask *v7;

  v4 = a3;
  v5 = [AMSUIAuthenticateTask alloc];
  -[AMSUIDelegateTokenTask presentingViewController](self, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSUIAuthenticateTask initWithRequest:presentingViewController:](v5, "initWithRequest:presentingViewController:", v4, v6);

  return v7;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end

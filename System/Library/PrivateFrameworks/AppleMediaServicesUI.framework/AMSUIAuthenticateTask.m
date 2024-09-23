@implementation AMSUIAuthenticateTask

- (AMSUIAuthenticateTask)initWithAccount:(id)a3 presentingViewController:(id)a4 options:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  AMSUIAuthenticateTask *v13;

  v8 = (void *)MEMORY[0x24BE08050];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "amsui_internalBag");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[AMSUIAuthenticateTask initWithAccount:presentingViewController:options:bag:](self, "initWithAccount:presentingViewController:options:bag:", v11, v10, v9, v12);

  return v13;
}

- (AMSUIAuthenticateTask)initWithAccount:(id)a3 presentingWindow:(id)a4 options:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  AMSUIAuthenticateTask *v13;

  v8 = (void *)MEMORY[0x24BE08050];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "amsui_internalBag");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[AMSUIAuthenticateTask initWithAccount:presentingWindow:options:bag:](self, "initWithAccount:presentingWindow:options:bag:", v11, v10, v9, v12);

  return v13;
}

- (AMSUIAuthenticateTask)initWithAccount:(id)a3 presentingViewController:(id)a4 options:(id)a5 bag:(id)a6
{
  id v11;
  AMSUIAuthenticateTask *v12;
  AMSUIAuthenticateTask *v13;
  objc_super v15;
  objc_super v16;

  v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AMSUIAuthenticateTask;
  v12 = -[AMSAuthenticateTask initWithAccount:options:bag:](&v16, sel_initWithAccount_options_bag_, a3, a5, a6);
  v13 = v12;
  if (v12)
  {
    v15.receiver = v12;
    v15.super_class = (Class)AMSUIAuthenticateTask;
    -[AMSAuthenticateTask setDelegate:](&v15, sel_setDelegate_, v12);
    objc_storeStrong((id *)&v13->_presentingViewController, a4);
  }

  return v13;
}

- (AMSUIAuthenticateTask)initWithAccount:(id)a3 presentingWindow:(id)a4 options:(id)a5 bag:(id)a6
{
  id v11;
  AMSUIAuthenticateTask *v12;
  AMSUIAuthenticateTask *v13;
  objc_super v15;
  objc_super v16;

  v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AMSUIAuthenticateTask;
  v12 = -[AMSAuthenticateTask initWithAccount:options:bag:](&v16, sel_initWithAccount_options_bag_, a3, a5, a6);
  v13 = v12;
  if (v12)
  {
    v15.receiver = v12;
    v15.super_class = (Class)AMSUIAuthenticateTask;
    -[AMSAuthenticateTask setDelegate:](&v15, sel_setDelegate_, v12);
    objc_storeStrong((id *)&v13->_presentingWindow, a4);
  }

  return v13;
}

- (AMSUIAuthenticateTask)initWithAuthenticationResults:(id)a3 presentingViewController:(id)a4 options:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  AMSUIAuthenticateTask *v13;

  v8 = (void *)MEMORY[0x24BE08050];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "amsui_internalBag");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[AMSUIAuthenticateTask initWithAuthenticationResults:presentingViewController:options:bag:](self, "initWithAuthenticationResults:presentingViewController:options:bag:", v11, v10, v9, v12);

  return v13;
}

- (AMSUIAuthenticateTask)initWithAuthenticationResults:(id)a3 presentingWindow:(id)a4 options:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  AMSUIAuthenticateTask *v13;

  v8 = (void *)MEMORY[0x24BE08050];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "amsui_internalBag");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[AMSUIAuthenticateTask initWithAuthenticationResults:presentingWindow:options:bag:](self, "initWithAuthenticationResults:presentingWindow:options:bag:", v11, v10, v9, v12);

  return v13;
}

- (AMSUIAuthenticateTask)initWithAuthenticationResults:(id)a3 presentingViewController:(id)a4 options:(id)a5 bag:(id)a6
{
  id v11;
  AMSUIAuthenticateTask *v12;
  AMSUIAuthenticateTask *v13;
  objc_super v15;
  objc_super v16;

  v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AMSUIAuthenticateTask;
  v12 = -[AMSAuthenticateTask initWithAuthenticationResults:options:bag:](&v16, sel_initWithAuthenticationResults_options_bag_, a3, a5, a6);
  v13 = v12;
  if (v12)
  {
    v15.receiver = v12;
    v15.super_class = (Class)AMSUIAuthenticateTask;
    -[AMSAuthenticateTask setDelegate:](&v15, sel_setDelegate_, v12);
    objc_storeStrong((id *)&v13->_presentingViewController, a4);
  }

  return v13;
}

- (AMSUIAuthenticateTask)initWithAuthenticationResults:(id)a3 presentingWindow:(id)a4 options:(id)a5 bag:(id)a6
{
  id v11;
  AMSUIAuthenticateTask *v12;
  AMSUIAuthenticateTask *v13;
  objc_super v15;
  objc_super v16;

  v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AMSUIAuthenticateTask;
  v12 = -[AMSAuthenticateTask initWithAuthenticationResults:options:bag:](&v16, sel_initWithAuthenticationResults_options_bag_, a3, a5, a6);
  v13 = v12;
  if (v12)
  {
    v15.receiver = v12;
    v15.super_class = (Class)AMSUIAuthenticateTask;
    -[AMSAuthenticateTask setDelegate:](&v15, sel_setDelegate_, v12);
    objc_storeStrong((id *)&v13->_presentingWindow, a4);
  }

  return v13;
}

- (AMSUIAuthenticateTask)initWithRequest:(id)a3 presentingViewController:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  AMSUIAuthenticateTask *v10;

  v6 = (void *)MEMORY[0x24BE08050];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "amsui_internalBag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AMSUIAuthenticateTask initWithRequest:presentingViewController:bag:](self, "initWithRequest:presentingViewController:bag:", v8, v7, v9);

  return v10;
}

- (AMSUIAuthenticateTask)initWithRequest:(id)a3 presentingWindow:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  AMSUIAuthenticateTask *v10;

  v6 = (void *)MEMORY[0x24BE08050];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "amsui_internalBag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AMSUIAuthenticateTask initWithRequest:presentingWindow:bag:](self, "initWithRequest:presentingWindow:bag:", v8, v7, v9);

  return v10;
}

- (AMSUIAuthenticateTask)initWithRequest:(id)a3 presentingViewController:(id)a4 bag:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  AMSUIAuthenticateTask *v16;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "logKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v8, "logKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)AMSSetLogKey();

  }
  objc_msgSend(v8, "account");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "options");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[AMSUIAuthenticateTask initWithAccount:presentingViewController:options:bag:](self, "initWithAccount:presentingViewController:options:bag:", v14, v10, v15, v9);

  return v16;
}

- (AMSUIAuthenticateTask)initWithRequest:(id)a3 presentingWindow:(id)a4 bag:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  AMSUIAuthenticateTask *v16;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "logKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v8, "logKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)AMSSetLogKey();

  }
  objc_msgSend(v8, "account");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "options");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[AMSUIAuthenticateTask initWithAccount:presentingWindow:options:bag:](self, "initWithAccount:presentingWindow:options:bag:", v14, v10, v15, v9);

  return v16;
}

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  AMSUIAlertDialogTask *v15;
  void *v16;
  AMSUIAlertDialogTask *v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (void *)MEMORY[0x24BE081D8];
  v9 = a5;
  objc_msgSend(v8, "sharedAccountsConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_opt_class();
    AMSLogKey();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543874;
    v20 = v12;
    v21 = 2114;
    v22 = v13;
    v23 = 2114;
    v24 = v14;
    _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling dialog request in UI Task. dialogRequest = %{public}@", (uint8_t *)&v19, 0x20u);

  }
  v15 = [AMSUIAlertDialogTask alloc];
  -[AMSUIAuthenticateTask _getPresentingViewController](self, "_getPresentingViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[AMSUIAlertDialogTask initWithRequest:presentingViewController:](v15, "initWithRequest:presentingViewController:", v7, v16);

  -[AMSUIAlertDialogTask present](v17, "present");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addFinishBlock:", v9);

}

- (id)_createAuthKitUpdateTaskForAccount:(id)a3
{
  id v4;
  id v5;
  void *v6;
  AMSUIAuthKitUpdateTask *v7;
  void *v8;
  void *v9;
  AMSUIAuthKitUpdateTask *v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE082B0]);
  -[AMSUIAuthenticateTask presentingWindow](self, "presentingWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [AMSUIAuthKitUpdateTask alloc];
    -[AMSUIAuthenticateTask presentingWindow](self, "presentingWindow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSAuthenticateTask options](self, "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[AMSUIAuthKitUpdateTask initWithAccount:presentingWindow:options:](v7, "initWithAccount:presentingWindow:options:", v4, v8, v9);

    objc_msgSend(v5, "finishWithResult:", v10);
  }
  else
  {
    v11 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __60__AMSUIAuthenticateTask__createAuthKitUpdateTaskForAccount___block_invoke;
    v16[3] = &unk_24CB4F370;
    v16[4] = self;
    v17 = v4;
    v18 = v5;
    v12 = v16;
    AMSLogKey();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __AMSDispatchAsync_block_invoke_0;
    block[3] = &unk_24CB4F3C0;
    v20 = v13;
    v21 = v12;
    v14 = v13;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  return v5;
}

void __60__AMSUIAuthenticateTask__createAuthKitUpdateTaskForAccount___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  AMSUIAuthKitUpdateTask *v5;
  uint64_t v6;
  void *v7;
  AMSUIAuthKitUpdateTask *v8;
  id v9;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  if (!v3
    || (objc_msgSend(*(id *)(a1 + 32), "presentingViewController"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "topViewController"),
        v9 = (id)objc_claimAutoreleasedReturnValue(),
        v4,
        !v9))
  {
    objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = [AMSUIAuthKitUpdateTask alloc];
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AMSUIAuthKitUpdateTask initWithAccount:presentingViewController:options:](v5, "initWithAccount:presentingViewController:options:", v6, v9, v7);

  objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", v8);
}

- (id)_presentEngagementRequest:(id)a3
{
  id v4;
  void *v5;
  AMSUIEngagementTask *v6;
  void *v7;
  void *v8;
  AMSUIEngagementTask *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = [AMSUIEngagementTask alloc];
  -[AMSAuthenticateTask bag](self, "bag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIAuthenticateTask _getPresentingViewController](self, "_getPresentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AMSUIEngagementTask initWithRequest:bag:presentingViewController:](v6, "initWithRequest:bag:presentingViewController:", v4, v7, v8);

  -[AMSUIEngagementTask presentEngagement](v9, "presentEngagement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __51__AMSUIAuthenticateTask__presentEngagementRequest___block_invoke;
  v13[3] = &unk_24CB4F458;
  v11 = v5;
  v14 = v11;
  objc_msgSend(v10, "addFinishBlock:", v13);

  return v11;
}

uint64_t __51__AMSUIAuthenticateTask__presentEngagementRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v3, "finishWithError:");
  else
    return objc_msgSend(v3, "finishWithSuccess");
}

- (id)_getPresentingViewController
{
  void *v3;
  void *v4;
  void *v5;

  -[AMSUIAuthenticateTask presentingWindow](self, "presentingWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AMSUIAuthenticateTask presentingWindow](self, "presentingWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rootViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[AMSUIAuthenticateTask presentingViewController](self, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (UIWindow)presentingWindow
{
  return self->_presentingWindow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingWindow, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end

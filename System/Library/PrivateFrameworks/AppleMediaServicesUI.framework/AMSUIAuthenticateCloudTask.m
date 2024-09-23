@implementation AMSUIAuthenticateCloudTask

- (AMSUIAuthenticateCloudTask)initWithAuthRequest:(id)a3 presentingViewController:(id)a4
{
  id v7;
  id v8;
  AMSUIAuthenticateCloudTask *v9;
  AMSUIAuthenticateCloudTask *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIAuthenticateCloudTask;
  v9 = -[AMSTask init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_authRequest, a3);
    objc_storeStrong((id *)&v10->_presentingViewController, a4);
  }

  return v10;
}

- (id)performAuthenticate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__AMSUIAuthenticateCloudTask_performAuthenticate__block_invoke;
  v3[3] = &unk_24CB4F228;
  v3[4] = self;
  -[AMSTask performTaskWithPromiseBlock:](self, "performTaskWithPromiseBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __49__AMSUIAuthenticateCloudTask_performAuthenticate__block_invoke(uint64_t a1)
{
  id v2;
  AMSUIAuthKitUpdateTask *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  AMSUIAuthKitUpdateTask *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t v17;

  v2 = objc_alloc_init(MEMORY[0x24BE08340]);
  v3 = [AMSUIAuthKitUpdateTask alloc];
  objc_msgSend(*(id *)(a1 + 32), "authRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AMSUIAuthKitUpdateTask initWithAccount:presentingViewController:options:](v3, "initWithAccount:presentingViewController:options:", v5, v6, v8);

  -[AMSAuthKitUpdateTask performAuthKitUpdate](v9, "performAuthKitUpdate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __49__AMSUIAuthenticateCloudTask_performAuthenticate__block_invoke_2;
  v15[3] = &unk_24CB4F398;
  v11 = v2;
  v12 = *(_QWORD *)(a1 + 32);
  v16 = v11;
  v17 = v12;
  objc_msgSend(v10, "addFinishBlock:", v15);
  v13 = v11;

  return v13;
}

void __49__AMSUIAuthenticateCloudTask_performAuthenticate__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a3);
  }
  else
  {
    v7 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __49__AMSUIAuthenticateCloudTask_performAuthenticate__block_invoke_3;
    v11[3] = &unk_24CB4F370;
    v11[4] = *(_QWORD *)(a1 + 40);
    v12 = v5;
    v13 = *(id *)(a1 + 32);
    v8 = v11;
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __AMSDispatchAsync_block_invoke;
    block[3] = &unk_24CB4F3C0;
    v15 = v9;
    v16 = v8;
    v10 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __49__AMSUIAuthenticateCloudTask_performAuthenticate__block_invoke_3(id *a1)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE buf[24];
  void *v26;
  uint64_t *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a1[4];
  objc_msgSend(a1[5], "authenticationResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_serviceContextWithResults:parentViewController:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfigOversize");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_opt_class();
    AMSLogKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Beginning service owners manager sign in", buf, 0x16u);

  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v11 = (void *)getAIDAServiceOwnersManagerClass_softClass;
  v24 = getAIDAServiceOwnersManagerClass_softClass;
  v12 = MEMORY[0x24BDAC760];
  if (!getAIDAServiceOwnersManagerClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getAIDAServiceOwnersManagerClass_block_invoke;
    v26 = &unk_24CB4F3E8;
    v27 = &v21;
    __getAIDAServiceOwnersManagerClass_block_invoke((uint64_t)buf);
    v11 = (void *)v22[3];
  }
  v13 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v21, 8);
  v14 = [v13 alloc];
  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithAccountStore:", v15);

  getAIDAServiceTypeCloud();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __49__AMSUIAuthenticateCloudTask_performAuthenticate__block_invoke_22;
  v18[3] = &unk_24CB4F348;
  v18[4] = a1[4];
  v19 = a1[6];
  v20 = a1[5];
  objc_msgSend(v16, "signInService:withContext:completion:", v17, v6, v18);

}

void __49__AMSUIAuthenticateCloudTask_performAuthenticate__block_invoke_22(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setCdpUIController:", 0);
  v4 = *(void **)(a1 + 40);
  if (v5)
    objc_msgSend(v4, "finishWithError:", v5);
  else
    objc_msgSend(v4, "finishWithResult:", *(_QWORD *)(a1 + 48));

}

- (id)_serviceContextWithResults:(id)a3 parentViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  Class (*v26)(uint64_t);
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v8 = (void *)getCDPUIControllerClass_softClass;
  v32 = getCDPUIControllerClass_softClass;
  if (!getCDPUIControllerClass_softClass)
  {
    v24 = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = __getCDPUIControllerClass_block_invoke;
    v27 = &unk_24CB4F3E8;
    v28 = &v29;
    __getCDPUIControllerClass_block_invoke((uint64_t)&v24);
    v8 = (void *)v30[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v29, 8);
  v10 = (void *)objc_msgSend([v9 alloc], "initWithPresentingViewController:", v7);
  -[AMSUIAuthenticateCloudTask setCdpUIController:](self, "setCdpUIController:", v10);

  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v11 = (void *)getAAUISignInFlowControllerDelegateClass_softClass;
  v32 = getAAUISignInFlowControllerDelegateClass_softClass;
  if (!getAAUISignInFlowControllerDelegateClass_softClass)
  {
    v24 = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = __getAAUISignInFlowControllerDelegateClass_block_invoke;
    v27 = &unk_24CB4F3E8;
    v28 = &v29;
    __getAAUISignInFlowControllerDelegateClass_block_invoke((uint64_t)&v24);
    v11 = (void *)v30[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v29, 8);
  v13 = (void *)objc_msgSend([v12 alloc], "initWithPresentingViewController:", v7);
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v14 = (void *)getAIDAMutableServiceContextClass_softClass;
  v32 = getAIDAMutableServiceContextClass_softClass;
  if (!getAIDAMutableServiceContextClass_softClass)
  {
    v24 = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = __getAIDAMutableServiceContextClass_block_invoke;
    v27 = &unk_24CB4F3E8;
    v28 = &v29;
    __getAIDAMutableServiceContextClass_block_invoke((uint64_t)&v24);
    v14 = (void *)v30[3];
  }
  v15 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v29, 8);
  v16 = objc_alloc_init(v15);
  objc_msgSend(v16, "setAuthenticationResults:", v6);
  objc_msgSend(v16, "setShouldForceOperation:", 0);
  objc_msgSend(v16, "setOperationUIPermissions:", 1);
  objc_msgSend(v16, "setViewController:", v7);
  -[AMSUIAuthenticateCloudTask cdpUIController](self, "cdpUIController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCdpUiProvider:", v17);

  objc_msgSend(v16, "signInContexts");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  getAIDAServiceTypeCloud();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v13, v20);

  v21 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v16, "setSignInContexts:", v21);

  v22 = (void *)objc_msgSend(v16, "copy");
  return v22;
}

- (CDPUIController)cdpUIController
{
  return self->_cdpUIController;
}

- (void)setCdpUIController:(id)a3
{
  objc_storeStrong((id *)&self->_cdpUIController, a3);
}

- (AMSAuthenticateRequest)authRequest
{
  return self->_authRequest;
}

- (void)setAuthRequest:(id)a3
{
  objc_storeStrong((id *)&self->_authRequest, a3);
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_authRequest, 0);
  objc_storeStrong((id *)&self->_cdpUIController, 0);
}

@end

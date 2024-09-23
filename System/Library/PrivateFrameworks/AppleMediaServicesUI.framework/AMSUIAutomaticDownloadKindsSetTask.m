@implementation AMSUIAutomaticDownloadKindsSetTask

- (AMSUIAutomaticDownloadKindsSetTask)initWithEnabledMediaKinds:(id)a3 account:(id)a4 bag:(id)a5 viewController:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  AMSUIAutomaticDownloadKindsSetTask *v14;
  uint64_t v15;
  AMSAutomaticDownloadKindsSetTask *task;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)AMSUIAutomaticDownloadKindsSetTask;
  v14 = -[AMSTask init](&v18, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BE08040]), "initWithEnabledMediaKinds:account:bag:presentationDelegate:", v10, v11, v12, v14);
    task = v14->_task;
    v14->_task = (AMSAutomaticDownloadKindsSetTask *)v15;

    objc_storeStrong((id *)&v14->_viewController, a6);
  }

  return v14;
}

- (id)perform
{
  void *v2;
  void *v3;

  -[AMSUIAutomaticDownloadKindsSetTask task](self, "task");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "perform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)handleAuthenticateRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AMSUIAuthenticateTask *v8;
  void *v9;
  AMSUIAuthenticateTask *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = [AMSUIAuthenticateTask alloc];
  -[AMSUIAutomaticDownloadKindsSetTask viewController](self, "viewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AMSUIAuthenticateTask initWithRequest:presentingViewController:](v8, "initWithRequest:presentingViewController:", v7, v9);

  -[AMSAuthenticateTask performAuthentication](v10, "performAuthentication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __75__AMSUIAutomaticDownloadKindsSetTask_handleAuthenticateRequest_completion___block_invoke;
  v13[3] = &unk_24CB4F188;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v11, "addFinishBlock:", v13);

}

uint64_t __75__AMSUIAutomaticDownloadKindsSetTask_handleAuthenticateRequest_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)handleDialogRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AMSUIAlertDialogTask *v8;
  void *v9;
  AMSUIAlertDialogTask *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = [AMSUIAlertDialogTask alloc];
  -[AMSUIAutomaticDownloadKindsSetTask viewController](self, "viewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AMSUIAlertDialogTask initWithRequest:presentingViewController:](v8, "initWithRequest:presentingViewController:", v7, v9);

  -[AMSUIAlertDialogTask present](v10, "present");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __69__AMSUIAutomaticDownloadKindsSetTask_handleDialogRequest_completion___block_invoke;
  v13[3] = &unk_24CB4F1B0;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v11, "addFinishBlock:", v13);

}

uint64_t __69__AMSUIAutomaticDownloadKindsSetTask_handleDialogRequest_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (AMSBagKeySet)bagKeySet
{
  return (AMSBagKeySet *)objc_msgSend(MEMORY[0x24BE08040], "bagKeySet");
}

+ (NSString)bagSubProfile
{
  return (NSString *)objc_msgSend(MEMORY[0x24BE08040], "bagSubProfile");
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)objc_msgSend(MEMORY[0x24BE08040], "bagSubProfileVersion");
}

+ (id)createBagForSubProfile
{
  return (id)objc_msgSend(MEMORY[0x24BE08040], "createBagForSubProfile");
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSArray)enabledMediaKinds
{
  return self->_enabledMediaKinds;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (AMSAutomaticDownloadKindsSetTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_enabledMediaKinds, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end

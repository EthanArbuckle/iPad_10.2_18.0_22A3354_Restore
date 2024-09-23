@implementation AMSUIAgeVerificationTask

- (AMSUIAgeVerificationTask)initWithAccount:(id)a3 bag:(id)a4 options:(id)a5 viewController:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AMSUIAgeVerificationTask *v15;
  AMSUIAgeVerificationTask *v16;
  uint64_t v17;
  AMSAgeVerificationTask *task;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)AMSUIAgeVerificationTask;
  v15 = -[AMSTask init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_account, a3);
    objc_storeStrong((id *)&v16->_bag, a4);
    objc_storeStrong((id *)&v16->_options, a5);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BE08010]), "initWithAccount:bag:options:presentationDelegate:", v11, v12, v13, v16);
    task = v16->_task;
    v16->_task = (AMSAgeVerificationTask *)v17;

    objc_storeStrong((id *)&v16->_viewController, a6);
  }

  return v16;
}

- (id)isVerificationNeeded
{
  void *v2;
  void *v3;

  -[AMSUIAgeVerificationTask task](self, "task");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isVerificationNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)performTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v3 = (void *)objc_opt_class();
  -[AMSUIAgeVerificationTask account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIAgeVerificationTask bag](self, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_errorCheckWithAccount:bag:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE08340], "promiseWithError:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AMSUIAgeVerificationTask isVerificationNeeded](self, "isVerificationNeeded");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __39__AMSUIAgeVerificationTask_performTask__block_invoke;
    v10[3] = &unk_24CB4F110;
    v10[4] = self;
    objc_msgSend(v8, "thenWithBlock:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

uint64_t __39__AMSUIAgeVerificationTask_performTask__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performTaskWithVerificationResult:", a2);
}

- (void)setPincode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSUIAgeVerificationTask task](self, "task");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPincode:", v4);

}

- (NSString)pincode
{
  void *v2;
  void *v3;

  -[AMSUIAgeVerificationTask task](self, "task");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pincode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_performTaskWithVerificationResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  -[AMSUIAgeVerificationTask bag](self, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForKey:", CFSTR("korAgeVerificationUrl"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valuePromise");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __63__AMSUIAgeVerificationTask__performTaskWithVerificationResult___block_invoke;
  v11[3] = &unk_24CB4F160;
  v11[4] = self;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v7, "thenWithBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __63__AMSUIAgeVerificationTask__performTaskWithVerificationResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  AMSUIAlertDialogTask *v13;
  void *v14;
  AMSUIAlertDialogTask *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x24BE08340]);
  objc_msgSend(*(id *)(a1 + 32), "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ams_accountFlagValueForAccountFlag:", *MEMORY[0x24BE07C80]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[AMSUIAgeVerificationCore _timestampOfExpiryFrom:](AMSUIAgeVerificationCore, "_timestampOfExpiryFrom:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_class();
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "bag");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_dateFormatter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_dialogForResult:withBag:expiration:dateFormatter:", v9, v10, v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [AMSUIAlertDialogTask alloc];
  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[AMSUIAlertDialogTask initWithRequest:presentingViewController:](v13, "initWithRequest:presentingViewController:", v12, v14);

  -[AMSUIAlertDialogTask present](v15, "present");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __63__AMSUIAgeVerificationTask__performTaskWithVerificationResult___block_invoke_2;
  v24[3] = &unk_24CB4F138;
  v25 = v12;
  v26 = *(id *)(a1 + 40);
  v17 = v4;
  v18 = *(_QWORD *)(a1 + 32);
  v27 = v17;
  v28 = v18;
  v29 = v3;
  v19 = v3;
  v20 = v12;
  objc_msgSend(v16, "addFinishBlock:", v24);

  v21 = v29;
  v22 = v17;

  return v22;
}

void __63__AMSUIAgeVerificationTask__performTaskWithVerificationResult___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "selectedActionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locateActionWithIdentifier:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "style") == 2)
    +[AMSUIAgeVerificationCore _promiseResultForCancelWithVerificationResult:](AMSUIAgeVerificationCore, "_promiseResultForCancelWithVerificationResult:", *(_QWORD *)(a1 + 40));
  else
    objc_msgSend((id)objc_opt_class(), "_promiseResultForOpeningURL:", *(_QWORD *)(a1 + 64));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "finishWithPromiseResult:", v5);

}

+ (id)_promiseResultForOpeningURL:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  int v6;
  id v7;

  v3 = (objc_class *)MEMORY[0x24BE08348];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = objc_msgSend(MEMORY[0x24BE082E8], "openStandardURL:", v4);

  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x24BE08008]);
    objc_msgSend(v7, "setSuccessType:", 2);
    objc_msgSend(v5, "setResult:", v7);
  }
  else
  {
    AMSError();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setError:", v7);
  }

  return v5;
}

+ (id)_dialogForResult:(id)a3 withBag:(id)a4 expiration:(id)a5 dateFormatter:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[AMSUIAgeVerificationCore _titleForResult:withBag:bundle:](AMSUIAgeVerificationCore, "_titleForResult:withBag:bundle:", v12, v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSUIAgeVerificationCore _messageForResult:withBag:expiration:dateFormatter:bundle:](AMSUIAgeVerificationCore, "_messageForResult:withBag:expiration:dateFormatter:bundle:", v12, v11, v10, v9, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUILocalizedStringFromBundle(CFSTR("AGE_VERIFICATION_DIALOG_PROCEED_ACTION"), v11, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUILocalizedStringFromBundle(CFSTR("AGE_VERIFICATION_DIALOG_CANCEL_ACTION"), v11, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08130]), "initWithTitle:message:", v13, v14);
  objc_msgSend(MEMORY[0x24BE08128], "actionWithTitle:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addButtonAction:", v20);

  objc_msgSend(MEMORY[0x24BE08128], "actionWithTitle:style:", v18, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addButtonAction:", v21);

  return v19;
}

+ (id)_dateFormatter
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v2, "setDateStyle:", 1);
  objc_msgSend(v2, "setTimeStyle:", 0);
  return v2;
}

+ (id)_errorCheckWithAccount:(id)a3 bag:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = 0;
  }
  else
  {
    AMSCustomError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
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
  -[AMSUIAgeVerificationTask viewController](self, "viewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AMSUIAuthenticateTask initWithRequest:presentingViewController:](v8, "initWithRequest:presentingViewController:", v7, v9);

  -[AMSAuthenticateTask performAuthentication](v10, "performAuthentication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __65__AMSUIAgeVerificationTask_handleAuthenticateRequest_completion___block_invoke;
  v13[3] = &unk_24CB4F188;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v11, "addFinishBlock:", v13);

}

uint64_t __65__AMSUIAgeVerificationTask_handleAuthenticateRequest_completion___block_invoke(uint64_t a1)
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
  -[AMSUIAgeVerificationTask viewController](self, "viewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AMSUIAlertDialogTask initWithRequest:presentingViewController:](v8, "initWithRequest:presentingViewController:", v7, v9);

  -[AMSUIAlertDialogTask present](v10, "present");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __59__AMSUIAgeVerificationTask_handleDialogRequest_completion___block_invoke;
  v13[3] = &unk_24CB4F1B0;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v11, "addFinishBlock:", v13);

}

uint64_t __59__AMSUIAgeVerificationTask_handleDialogRequest_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (AMSBagKeySet)bagKeySet
{
  return (AMSBagKeySet *)objc_msgSend(MEMORY[0x24BE08010], "bagKeySet");
}

+ (NSString)bagSubProfile
{
  return (NSString *)objc_msgSend(MEMORY[0x24BE08010], "bagSubProfile");
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)objc_msgSend(MEMORY[0x24BE08010], "bagSubProfileVersion");
}

+ (id)createBagForSubProfile
{
  return (id)objc_msgSend(MEMORY[0x24BE08010], "createBagForSubProfile");
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (AMSAgeVerificationTask)task
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
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end

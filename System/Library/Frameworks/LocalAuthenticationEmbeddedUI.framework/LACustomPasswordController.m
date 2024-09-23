@implementation LACustomPasswordController

- (LACustomPasswordController)initWithConfiguration:(id)a3
{
  LACustomPasswordController *v4;
  uint64_t v5;
  LAContext *laContext;
  void *v7;
  void *v8;
  LAAuthorizationViewController *v9;
  LAAuthorizationViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id location;
  objc_super v43;
  _QWORD v44[6];

  v44[4] = *MEMORY[0x24BDAC8D0];
  v39 = a3;
  v43.receiver = self;
  v43.super_class = (Class)LACustomPasswordController;
  v4 = -[LACustomPasswordController initWithNibName:bundle:](&v43, sel_initWithNibName_bundle_, 0, 0);
  if (v4)
  {
    v5 = objc_opt_new();
    laContext = v4->_laContext;
    v4->_laContext = (LAContext *)v5;

    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE60810]), "initWithCustomPasswordConfiguration:context:", v39, v4->_laContext);
    objc_msgSend(v38, "validateConfiguration");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      v7 = (void *)MEMORY[0x24BDBCE88];
      objc_msgSend(v37, "debugDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@"), v8);

    }
    objc_initWeak(&location, v4);
    v9 = [LAAuthorizationViewController alloc];
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __52__LACustomPasswordController_initWithConfiguration___block_invoke;
    v40[3] = &unk_24FDCD7C8;
    objc_copyWeak(&v41, &location);
    v10 = -[LAAuthorizationViewController initWithConfiguration:completion:](v9, "initWithConfiguration:completion:", v38, v40);
    -[LAAuthorizationViewController setDelegate:](v10, "setDelegate:", v4);
    -[LACustomPasswordController view](v4, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[LAAuthorizationViewController view](v10, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v12);

    -[LACustomPasswordController addChildViewController:](v4, "addChildViewController:", v10);
    -[LAAuthorizationViewController didMoveToParentViewController:](v10, "didMoveToParentViewController:", v4);
    -[LAAuthorizationViewController view](v10, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v23 = (void *)MEMORY[0x24BDD1628];
    -[LACustomPasswordController view](v4, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[LAAuthorizationViewController view](v10, "view");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v32;
    -[LACustomPasswordController view](v4, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[LAAuthorizationViewController view](v10, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v27;
    -[LACustomPasswordController view](v4, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[LAAuthorizationViewController view](v10, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v44[2] = v15;
    -[LACustomPasswordController view](v4, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[LAAuthorizationViewController view](v10, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v44[3] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "activateConstraints:", v21);

    objc_storeWeak((id *)&v4->_authorizationController, v10);
    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);

  }
  return v4;
}

void __52__LACustomPasswordController_initWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    -[LACustomPasswordController _finishWithError:]((uint64_t)WeakRetained, v5);

}

- (void)_finishWithError:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a2;
  if (a1)
  {
    v3 = *(_QWORD *)(a1 + 984);
    if (v3)
    {
      (*(void (**)(void))(v3 + 16))();
      v4 = *(void **)(a1 + 984);
      *(_QWORD *)(a1 + 984) = 0;

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 992));
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)(a1 + 992));
      objc_msgSend(v7, "customPasswordController:didFinishWithError:", a1, v8);

    }
  }

}

- (int64_t)modalPresentationStyle
{
  id WeakRetained;
  int64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_authorizationController);
  v3 = objc_msgSend(WeakRetained, "modalPresentationStyle");

  return v3;
}

- (int64_t)modalTransitionStyle
{
  id WeakRetained;
  int64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_authorizationController);
  v3 = objc_msgSend(WeakRetained, "modalTransitionStyle");

  return v3;
}

- (int64_t)preferredStatusBarStyle
{
  id WeakRetained;
  int64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_authorizationController);
  v3 = objc_msgSend(WeakRetained, "preferredStatusBarStyle");

  return v3;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  void *v5;
  id completion;
  id WeakRetained;

  v5 = (void *)MEMORY[0x2348AF9C0](a4, a2, a3);
  completion = self->_completion;
  self->_completion = v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_authorizationController);
  objc_msgSend(WeakRetained, "dismiss");

}

- (void)authorizationController:(id)a3 didProvideAuthorizationRequirementWithReply:(id)a4
{
  id v6;
  id v7;
  LAContext *laContext;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  laContext = self->_laContext;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __98__LACustomPasswordController_authorizationController_didProvideAuthorizationRequirementWithReply___block_invoke;
  v10[3] = &unk_24FDCD7F0;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  -[LAContext credentialOfType:reply:](laContext, "credentialOfType:reply:", -9, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __98__LACustomPasswordController_authorizationController_didProvideAuthorizationRequirementWithReply___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  char v10;
  id v11;
  id v12;

  v12 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
    if (v4
      && (objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "length"),
          v6,
          v5,
          v7))
    {
      v8 = objc_loadWeakRetained(WeakRetained + 124);
      objc_msgSend(v8, "customPasswordController:didReceiveCustomPassword:processCustomPasswordWithCompletion:", WeakRetained, v4, *(_QWORD *)(a1 + 32));
    }
    else
    {
      v9 = objc_loadWeakRetained(WeakRetained + 124);
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) == 0)
      {
LABEL_8:

        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x24BDDA9C8], "errorWithCode:", -1019);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_loadWeakRetained(WeakRetained + 124);
      objc_msgSend(v11, "customPasswordController:didFinishWithError:", WeakRetained, v8);

    }
    goto LABEL_8;
  }
LABEL_9:

}

- (LACustomPasswordControllerDelegate)delegate
{
  return (LACustomPasswordControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_completion, 0);
  objc_destroyWeak((id *)&self->_authorizationController);
  objc_storeStrong((id *)&self->_laContext, 0);
}

@end

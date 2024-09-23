@implementation LAPSFetchNewPasscodeViewController

- (LAPSFetchNewPasscodeViewController)initWithInput:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  LAPSFetchNewPasscodeViewController *v9;
  LAPSFetchNewPasscodeViewController *v10;
  uint64_t v11;
  id handler;
  uint64_t v13;
  LAPSPasscodeType *passcodeType;
  LACUIContainerViewController *v15;
  LACUIContainerViewController *containerVC;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)LAPSFetchNewPasscodeViewController;
  v9 = -[LAPSFetchNewPasscodeViewController init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_input, a3);
    v11 = MEMORY[0x2348AF9C0](v8);
    handler = v10->_handler;
    v10->_handler = (id)v11;

    objc_msgSend(v7, "passcodeType");
    v13 = objc_claimAutoreleasedReturnValue();
    passcodeType = v10->_passcodeType;
    v10->_passcodeType = (LAPSPasscodeType *)v13;

    v10->_isPasscodeRecoveryEnabled = objc_msgSend(v7, "isPasscodeRecoveryEnabled");
    v15 = (LACUIContainerViewController *)objc_alloc_init(MEMORY[0x24BE60828]);
    containerVC = v10->_containerVC;
    v10->_containerVC = v15;

  }
  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)LAPSFetchNewPasscodeViewController;
  -[LAPSFetchNewPasscodeViewController viewDidLoad](&v28, sel_viewDidLoad);
  -[LAPSFetchNewPasscodeViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[LAPSFetchNewPasscodeViewController addChildViewController:](self, "addChildViewController:", self->_containerVC);
  -[LAPSFetchNewPasscodeViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUIContainerViewController view](self->_containerVC, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  -[LACUIContainerViewController view](self->_containerVC, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[LACUIContainerViewController view](self->_containerVC, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchNewPasscodeViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  -[LACUIContainerViewController view](self->_containerVC, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchNewPasscodeViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  -[LACUIContainerViewController view](self->_containerVC, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchNewPasscodeViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  -[LACUIContainerViewController view](self->_containerVC, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchNewPasscodeViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setActive:", 1);

  -[LACUIContainerViewController didMoveToParentViewController:](self->_containerVC, "didMoveToParentViewController:", self);
  -[LAPSFetchNewPasscodeViewController _presentNewPasscodeVCWithTransitionStyle:](self, "_presentNewPasscodeVCWithTransitionStyle:", 0);
}

- (BOOL)becomeFirstResponder
{
  return -[LACUIContainerViewController becomeFirstResponder](self->_containerVC, "becomeFirstResponder");
}

- (BOOL)resignFirstResponder
{
  return -[LACUIContainerViewController resignFirstResponder](self->_containerVC, "resignFirstResponder");
}

- (id)navigationItem
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[LAPSFetchNewPasscodeViewController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)LAPSFetchNewPasscodeViewController;
    -[LAPSFetchNewPasscodeViewController navigationItem](&v9, sel_navigationItem);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_preferredContentSizeDidChangeForChildViewController:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LAPSFetchNewPasscodeViewController;
  v4 = a3;
  -[LAPSFetchNewPasscodeViewController _preferredContentSizeDidChangeForChildViewController:](&v9, sel__preferredContentSizeDidChangeForChildViewController_, v4);
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  v6 = v5;
  v8 = v7;

  -[LAPSFetchNewPasscodeViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (void)continueWithPasscode:(id)a3
{
  objc_storeStrong((id *)&self->_passcode, a3);
  -[LAPSFetchNewPasscodeViewController _presentVerifyPasscodeVCWithTransitionStyle:](self, "_presentVerifyPasscodeVCWithTransitionStyle:", 1);
}

- (void)restart
{
  -[LAPSFetchNewPasscodeViewController clear](self, "clear");
  -[LAPSFetchNewPasscodeViewController _presentNewPasscodeVCWithTransitionStyle:](self, "_presentNewPasscodeVCWithTransitionStyle:", 2);
}

- (void)clear
{
  LAPSFetchNewPasscodeViewController *v2;
  LAPSPasscode *passcode;
  id WeakRetained;
  id v5;
  id v6;

  v2 = self;
  passcode = self->_passcode;
  self->_passcode = 0;

  v2 = (LAPSFetchNewPasscodeViewController *)((char *)v2 + 1016);
  WeakRetained = objc_loadWeakRetained((id *)&v2->super.super.super.isa);
  objc_msgSend(WeakRetained, "clear");

  v5 = objc_loadWeakRetained((id *)&v2->super.super.super.isa);
  objc_msgSend(v5, "focus");

  v6 = objc_loadWeakRetained((id *)&v2->super.super.super.isa);
  objc_msgSend(v6, "hideSpinner");

}

- (void)finishWithPasscode:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  LAPSFetchNewPasscodeViewController *v9;

  v4 = a3;
  -[LAPSFetchNewPasscodeViewController resignFirstResponder](self, "resignFirstResponder");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__LAPSFetchNewPasscodeViewController_finishWithPasscode___block_invoke;
  v7[3] = &unk_24FDCD410;
  v8 = v4;
  v9 = self;
  v6 = v4;
  __57__LAPSFetchNewPasscodeViewController_finishWithPasscode___block_invoke((uint64_t)v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchNewPasscodeViewController _invokeHandlerWithOutput:](self, "_invokeHandlerWithOutput:", v5);

}

LAPSFetchNewPasscodeViewControllerOutput *__57__LAPSFetchNewPasscodeViewController_finishWithPasscode___block_invoke(uint64_t a1)
{
  LAPSFetchNewPasscodeViewControllerOutput *v2;

  v2 = objc_alloc_init(LAPSFetchNewPasscodeViewControllerOutput);
  -[LAPSFetchNewPasscodeViewControllerOutput setPasscode:](v2, "setPasscode:", *(_QWORD *)(a1 + 32));
  -[LAPSFetchNewPasscodeViewControllerOutput setIsPasscodeRecoveryEnabled:](v2, "setIsPasscodeRecoveryEnabled:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 1000));
  return v2;
}

- (void)_presentNewPasscodeVCWithTransitionStyle:(int64_t)a3
{
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __79__LAPSFetchNewPasscodeViewController__presentNewPasscodeVCWithTransitionStyle___block_invoke;
  v6[3] = &unk_24FDCD4B0;
  v6[4] = self;
  __79__LAPSFetchNewPasscodeViewController__presentNewPasscodeVCWithTransitionStyle___block_invoke((uint64_t)v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchNewPasscodeViewController _presentViewController:transitionStyle:](self, "_presentViewController:transitionStyle:", v5, a3);

}

LAPSPasscodeViewController *__79__LAPSFetchNewPasscodeViewController__presentNewPasscodeVCWithTransitionStyle___block_invoke(uint64_t a1)
{
  LAPSPasscodeViewController *v2;
  void *v3;
  LAPSPasscodeViewController *v4;
  _QWORD v6[5];

  v2 = [LAPSPasscodeViewController alloc];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __79__LAPSFetchNewPasscodeViewController__presentNewPasscodeVCWithTransitionStyle___block_invoke_2;
  v6[3] = &unk_24FDCD488;
  v6[4] = *(_QWORD *)(a1 + 32);
  __79__LAPSFetchNewPasscodeViewController__presentNewPasscodeVCWithTransitionStyle___block_invoke_2((uint64_t)v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[LAPSPasscodeViewController initWithConfiguration:](v2, "initWithConfiguration:", v3);

  -[LAPSPasscodeViewController setDelegate:](v4, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 1016), v4);
  return v4;
}

LAPSPasscodeViewControllerConfiguration *__79__LAPSFetchNewPasscodeViewController__presentNewPasscodeVCWithTransitionStyle___block_invoke_2(uint64_t a1)
{
  LAPSPasscodeViewControllerConfiguration *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];

  v2 = objc_alloc_init(LAPSPasscodeViewControllerConfiguration);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeViewControllerConfiguration setTitle:](v2, "setTitle:", v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "prompt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeViewControllerConfiguration setPrompt:](v2, "setPrompt:", v4);

  v5 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __79__LAPSFetchNewPasscodeViewController__presentNewPasscodeVCWithTransitionStyle___block_invoke_3;
  v11[3] = &unk_24FDCD438;
  v11[4] = *(_QWORD *)(a1 + 32);
  __79__LAPSFetchNewPasscodeViewController__presentNewPasscodeVCWithTransitionStyle___block_invoke_3((uint64_t)v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeViewControllerConfiguration setFooter:](v2, "setFooter:", v6);

  -[LAPSPasscodeViewControllerConfiguration setPasscodeType:](v2, "setPasscodeType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "nextButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeViewControllerConfiguration setNextButton:](v2, "setNextButton:", v7);

  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __79__LAPSFetchNewPasscodeViewController__presentNewPasscodeVCWithTransitionStyle___block_invoke_4;
  v10[3] = &unk_24FDCD460;
  v10[4] = *(_QWORD *)(a1 + 32);
  __79__LAPSFetchNewPasscodeViewController__presentNewPasscodeVCWithTransitionStyle___block_invoke_4((uint64_t)v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeViewControllerConfiguration setOptionsConfiguration:](v2, "setOptionsConfiguration:", v8);

  return v2;
}

__CFString *__79__LAPSFetchNewPasscodeViewController__presentNewPasscodeVCWithTransitionStyle___block_invoke_3(uint64_t a1)
{
  __CFString *v2;
  char v4;
  void *v5;

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "isPasscodeRecoverySupported")
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "isPasscodeRecoveryRestricted") & 1) != 0
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "isPasscodeRecoveryMessageHidden") & 1) != 0)
  {
    v2 = &stru_24FDCE800;
  }
  else
  {
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "isPasscodeRecoveryEnabled");
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 968);
    if ((v4 & 1) != 0)
      objc_msgSend(v5, "footerRecoveryEnabled");
    else
      objc_msgSend(v5, "footerRecoveryDisabled");
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

LAPSPasscodeOptionsViewControllerConfiguration *__79__LAPSFetchNewPasscodeViewController__presentNewPasscodeVCWithTransitionStyle___block_invoke_4(uint64_t a1)
{
  LAPSPasscodeOptionsViewControllerConfiguration *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = objc_alloc_init(LAPSPasscodeOptionsViewControllerConfiguration);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "passcodeOptionsTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeOptionsViewControllerConfiguration setTitle:](v2, "setTitle:", v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "passcodeOptionsCancelTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeOptionsViewControllerConfiguration setCancelTitle:](v2, "setCancelTitle:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "passcodeRecoveryEnabledTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeOptionsViewControllerConfiguration setPasscodeRecoveryEnabledTitle:](v2, "setPasscodeRecoveryEnabledTitle:", v5);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "passcodeRecoveryDisabledTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeOptionsViewControllerConfiguration setPasscodeRecoveryDisabledTitle:](v2, "setPasscodeRecoveryDisabledTitle:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "allowedPasscodeTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeOptionsViewControllerConfiguration setAllowedPasscodeTypes:](v2, "setAllowedPasscodeTypes:", v7);

  -[LAPSPasscodeOptionsViewControllerConfiguration setSelectedPasscodeType:](v2, "setSelectedPasscodeType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992));
  -[LAPSPasscodeOptionsViewControllerConfiguration setIsPasscodeRecoveryEnabled:](v2, "setIsPasscodeRecoveryEnabled:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1000));
  -[LAPSPasscodeOptionsViewControllerConfiguration setIsPasscodeRecoveryOptionVisible:](v2, "setIsPasscodeRecoveryOptionVisible:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "isPasscodeRecoveryOptionVisible"));
  -[LAPSPasscodeOptionsViewControllerConfiguration setIsPasscodeRecoverySupported:](v2, "setIsPasscodeRecoverySupported:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "isPasscodeRecoverySupported"));
  -[LAPSPasscodeOptionsViewControllerConfiguration setIsPasscodeRecoveryRestricted:](v2, "setIsPasscodeRecoveryRestricted:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "isPasscodeRecoveryRestricted"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "passcodeRecoveryTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeOptionsViewControllerConfiguration setPasscodeRecoveryTitle:](v2, "setPasscodeRecoveryTitle:", v8);

  return v2;
}

- (void)_presentVerifyPasscodeVCWithTransitionStyle:(int64_t)a3
{
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __82__LAPSFetchNewPasscodeViewController__presentVerifyPasscodeVCWithTransitionStyle___block_invoke;
  v6[3] = &unk_24FDCD4B0;
  v6[4] = self;
  __82__LAPSFetchNewPasscodeViewController__presentVerifyPasscodeVCWithTransitionStyle___block_invoke((uint64_t)v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchNewPasscodeViewController _presentViewController:transitionStyle:](self, "_presentViewController:transitionStyle:", v5, a3);

}

LAPSPasscodeViewController *__82__LAPSFetchNewPasscodeViewController__presentVerifyPasscodeVCWithTransitionStyle___block_invoke(uint64_t a1)
{
  LAPSPasscodeViewController *v2;
  void *v3;
  LAPSPasscodeViewController *v4;
  _QWORD v6[5];

  v2 = [LAPSPasscodeViewController alloc];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __82__LAPSFetchNewPasscodeViewController__presentVerifyPasscodeVCWithTransitionStyle___block_invoke_2;
  v6[3] = &unk_24FDCD488;
  v6[4] = *(_QWORD *)(a1 + 32);
  __82__LAPSFetchNewPasscodeViewController__presentVerifyPasscodeVCWithTransitionStyle___block_invoke_2((uint64_t)v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[LAPSPasscodeViewController initWithConfiguration:](v2, "initWithConfiguration:", v3);

  -[LAPSPasscodeViewController setDelegate:](v4, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 1016), v4);
  return v4;
}

LAPSPasscodeViewControllerConfiguration *__82__LAPSFetchNewPasscodeViewController__presentVerifyPasscodeVCWithTransitionStyle___block_invoke_2(uint64_t a1)
{
  LAPSPasscodeViewControllerConfiguration *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(LAPSPasscodeViewControllerConfiguration);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeViewControllerConfiguration setTitle:](v2, "setTitle:", v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "verifyPrompt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeViewControllerConfiguration setPrompt:](v2, "setPrompt:", v4);

  -[LAPSPasscodeViewControllerConfiguration setPasscodeType:](v2, "setPasscodeType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "verifyNextButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeViewControllerConfiguration setNextButton:](v2, "setNextButton:", v5);

  return v2;
}

- (void)_presentViewController:(id)a3 transitionStyle:(int64_t)a4
{
  -[LACUIContainerViewController presentViewController:transitionStyle:](self->_containerVC, "presentViewController:transitionStyle:", a3, a4);
}

- (void)_invokeHandlerWithOutput:(id)a3
{
  -[LAPSFetchNewPasscodeViewController _invokeHandlerWithOutput:error:](self, "_invokeHandlerWithOutput:error:", a3, 0);
}

- (void)_invokeHandlerWithError:(id)a3
{
  -[LAPSFetchNewPasscodeViewController _invokeHandlerWithOutput:error:](self, "_invokeHandlerWithOutput:error:", 0, a3);
}

- (void)_invokeHandlerWithOutput:(id)a3 error:(id)a4
{
  id handler;
  id v7;
  id v8;
  id v9;
  void (**v10)(id, id, id);

  handler = self->_handler;
  if (handler)
  {
    v7 = a4;
    v8 = a3;
    v10 = (void (**)(id, id, id))objc_msgSend(handler, "copy");
    v9 = self->_handler;
    self->_handler = 0;

    -[LAPSFetchNewPasscodeViewController _deactivate](self, "_deactivate");
    v10[2](v10, v8, v7);

  }
}

- (void)_deactivate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeVC);
  objc_msgSend(WeakRetained, "unfocus");

}

- (id)_currentChildVC
{
  return (id)-[LACUIContainerViewController currentViewController](self->_containerVC, "currentViewController");
}

- (void)passcodeViewController:(id)a3 verifyPasscode:(id)a4
{
  id v6;
  LAPSPasscodeType *passcodeType;
  LAPSPasscode *passcode;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[LAPSFetchNewPasscodeViewController _currentChildVC](self, "_currentChildVC");
  if ((id)objc_claimAutoreleasedReturnValue() != v11)
    -[LAPSFetchNewPasscodeViewController passcodeViewController:verifyPasscode:].cold.2();

  passcodeType = self->_passcodeType;
  objc_msgSend(v6, "type");
  if (passcodeType != (LAPSPasscodeType *)objc_claimAutoreleasedReturnValue())
    -[LAPSFetchNewPasscodeViewController passcodeViewController:verifyPasscode:].cold.1();

  objc_msgSend(v11, "unfocus");
  objc_msgSend(v11, "showSpinner");
  passcode = self->_passcode;
  -[LAPSFetchNewPasscodeViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (passcode)
    objc_msgSend(v9, "fetchNewPasscodeViewController:verifyPasscode:matchesPasscode:", self, self->_passcode, v6);
  else
    objc_msgSend(v9, "fetchNewPasscodeViewController:verifyPasscode:", self, v6);

}

- (void)passcodeViewController:(id)a3 didCancelWithError:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  -[LAPSFetchNewPasscodeViewController _currentChildVC](self, "_currentChildVC");
  if ((id)objc_claimAutoreleasedReturnValue() != v7)
    -[LAPSFetchNewPasscodeViewController passcodeViewController:didCancelWithError:].cold.1();

  -[LAPSFetchNewPasscodeViewController _invokeHandlerWithError:](self, "_invokeHandlerWithError:", v6);
}

- (void)passcodeViewController:(id)a3 didSelectPasscodeType:(id)a4
{
  LAPSPasscodeType *v6;
  LAPSPasscodeType *passcodeType;
  id v8;

  v8 = a3;
  v6 = (LAPSPasscodeType *)a4;
  -[LAPSFetchNewPasscodeViewController _currentChildVC](self, "_currentChildVC");
  if ((id)objc_claimAutoreleasedReturnValue() != v8)
    -[LAPSFetchNewPasscodeViewController passcodeViewController:didSelectPasscodeType:].cold.1();

  passcodeType = self->_passcodeType;
  self->_passcodeType = v6;

}

- (void)passcodeViewController:(id)a3 didSetPasscodeRecoveryEnabled:(BOOL)a4
{
  LAPSFetchNewPasscodeViewControllerInput *input;
  void *v7;
  id v8;

  v8 = a3;
  -[LAPSFetchNewPasscodeViewController _currentChildVC](self, "_currentChildVC");
  if ((id)objc_claimAutoreleasedReturnValue() != v8)
    -[LAPSFetchNewPasscodeViewController passcodeViewController:didSetPasscodeRecoveryEnabled:].cold.2();

  if (!-[LAPSFetchNewPasscodeViewControllerInput isPasscodeRecoverySupported](self->_input, "isPasscodeRecoverySupported")|| -[LAPSFetchNewPasscodeViewControllerInput isPasscodeRecoveryRestricted](self->_input, "isPasscodeRecoveryRestricted"))
  {
    -[LAPSFetchNewPasscodeViewController passcodeViewController:didSetPasscodeRecoveryEnabled:].cold.1();
  }
  input = self->_input;
  if (a4)
    -[LAPSFetchNewPasscodeViewControllerInput footerRecoveryEnabled](input, "footerRecoveryEnabled");
  else
    -[LAPSFetchNewPasscodeViewControllerInput footerRecoveryDisabled](input, "footerRecoveryDisabled");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFooter:", v7);

  self->_isPasscodeRecoveryEnabled = a4;
}

- (LAPSFetchNewPasscodeViewControllerDelegate)delegate
{
  return (LAPSFetchNewPasscodeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_passcodeVC);
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_passcodeType, 0);
  objc_storeStrong((id *)&self->_containerVC, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

- (void)passcodeViewController:verifyPasscode:.cold.1()
{
  __assert_rtn("-[LAPSFetchNewPasscodeViewController passcodeViewController:verifyPasscode:]", "LAPSFetchNewPasscodeViewController.m", 222, "_passcodeType == [passcode type]");
}

- (void)passcodeViewController:verifyPasscode:.cold.2()
{
  __assert_rtn("-[LAPSFetchNewPasscodeViewController passcodeViewController:verifyPasscode:]", "LAPSFetchNewPasscodeViewController.m", 221, "passcodeVC == [self _currentChildVC]");
}

- (void)passcodeViewController:didCancelWithError:.cold.1()
{
  __assert_rtn("-[LAPSFetchNewPasscodeViewController passcodeViewController:didCancelWithError:]", "LAPSFetchNewPasscodeViewController.m", 236, "passcodeVC == [self _currentChildVC]");
}

- (void)passcodeViewController:didSelectPasscodeType:.cold.1()
{
  __assert_rtn("-[LAPSFetchNewPasscodeViewController passcodeViewController:didSelectPasscodeType:]", "LAPSFetchNewPasscodeViewController.m", 242, "passcodeVC == [self _currentChildVC]");
}

- (void)passcodeViewController:didSetPasscodeRecoveryEnabled:.cold.1()
{
  __assert_rtn("-[LAPSFetchNewPasscodeViewController passcodeViewController:didSetPasscodeRecoveryEnabled:]", "LAPSFetchNewPasscodeViewController.m", 249, "[_input isPasscodeRecoverySupported] && ![_input isPasscodeRecoveryRestricted]");
}

- (void)passcodeViewController:didSetPasscodeRecoveryEnabled:.cold.2()
{
  __assert_rtn("-[LAPSFetchNewPasscodeViewController passcodeViewController:didSetPasscodeRecoveryEnabled:]", "LAPSFetchNewPasscodeViewController.m", 248, "passcodeVC == [self _currentChildVC]");
}

@end

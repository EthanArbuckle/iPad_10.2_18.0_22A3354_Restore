@implementation LAPSFetchOldPasscodeViewController

- (LAPSFetchOldPasscodeViewController)initWithInput:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  LAPSFetchOldPasscodeViewController *v9;
  LAPSFetchOldPasscodeViewController *v10;
  uint64_t v11;
  id handler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)LAPSFetchOldPasscodeViewController;
  v9 = -[LAPSFetchOldPasscodeViewController init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_input, a3);
    v11 = MEMORY[0x2348AF9C0](v8);
    handler = v10->_handler;
    v10->_handler = (id)v11;

  }
  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LAPSFetchOldPasscodeViewController;
  -[LAPSFetchOldPasscodeViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[LAPSFetchOldPasscodeViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__LAPSFetchOldPasscodeViewController_viewDidLoad__block_invoke;
  v6[3] = &unk_24FDCD4B0;
  v6[4] = self;
  __49__LAPSFetchOldPasscodeViewController_viewDidLoad__block_invoke((uint64_t)v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchOldPasscodeViewController _addChildVC:](self, "_addChildVC:", v5);

}

LAPSPasscodeViewController *__49__LAPSFetchOldPasscodeViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  LAPSPasscodeViewController *v2;
  void *v3;
  LAPSPasscodeViewController *v4;
  _QWORD v6[5];

  v2 = [LAPSPasscodeViewController alloc];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__LAPSFetchOldPasscodeViewController_viewDidLoad__block_invoke_2;
  v6[3] = &unk_24FDCD488;
  v6[4] = *(_QWORD *)(a1 + 32);
  __49__LAPSFetchOldPasscodeViewController_viewDidLoad__block_invoke_2((uint64_t)v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[LAPSPasscodeViewController initWithConfiguration:](v2, "initWithConfiguration:", v3);

  -[LAPSPasscodeViewController setDelegate:](v4, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 992), v4);
  return v4;
}

LAPSPasscodeViewControllerConfiguration *__49__LAPSFetchOldPasscodeViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  LAPSPasscodeViewControllerConfiguration *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc_init(LAPSPasscodeViewControllerConfiguration);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeViewControllerConfiguration setTitle:](v2, "setTitle:", v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "prompt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeViewControllerConfiguration setPrompt:](v2, "setPrompt:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "nextButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeViewControllerConfiguration setNextButton:](v2, "setNextButton:", v5);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "passcodeType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeViewControllerConfiguration setPasscodeType:](v2, "setPasscodeType:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "errorMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeViewControllerConfiguration setErrorMessage:](v2, "setErrorMessage:", v7);

  -[LAPSPasscodeViewControllerConfiguration setShouldAvoidBecomingFirstResponderOnStart:](v2, "setShouldAvoidBecomingFirstResponderOnStart:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "backoffTimeout") > 0);
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LAPSFetchOldPasscodeViewController;
  -[LAPSFetchOldPasscodeViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if (-[LAPSFetchOldPasscodeViewControllerInput backoffTimeout](self->_input, "backoffTimeout") >= 1)
    -[LAPSFetchOldPasscodeViewController startBackoffWithTimeout:](self, "startBackoffWithTimeout:", -[LAPSFetchOldPasscodeViewControllerInput backoffTimeout](self->_input, "backoffTimeout"));
}

- (BOOL)becomeFirstResponder
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_currentChildVC);
  v3 = objc_msgSend(WeakRetained, "becomeFirstResponder");

  return v3;
}

- (BOOL)resignFirstResponder
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_currentChildVC);
  v3 = objc_msgSend(WeakRetained, "resignFirstResponder");

  return v3;
}

- (id)navigationItem
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[LAPSFetchOldPasscodeViewController parentViewController](self, "parentViewController");
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
    v9.super_class = (Class)LAPSFetchOldPasscodeViewController;
    -[LAPSFetchOldPasscodeViewController navigationItem](&v9, sel_navigationItem);
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
  v9.super_class = (Class)LAPSFetchOldPasscodeViewController;
  v4 = a3;
  -[LAPSFetchOldPasscodeViewController _preferredContentSizeDidChangeForChildViewController:](&v9, sel__preferredContentSizeDidChangeForChildViewController_, v4);
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  v6 = v5;
  v8 = v7;

  -[LAPSFetchOldPasscodeViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (void)startBackoffWithTimeout:(int64_t)a3
{
  LAPSPasscodeBackoffTimerController *v5;
  uint64_t v6;
  LAPSPasscodeBackoffTimerController *v7;
  LAPSPasscodeBackoffTimerController *timer;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  objc_initWeak(&location, self);
  v5 = [LAPSPasscodeBackoffTimerController alloc];
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62__LAPSFetchOldPasscodeViewController_startBackoffWithTimeout___block_invoke;
  v11[3] = &unk_24FDCDAE8;
  objc_copyWeak(&v12, &location);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __62__LAPSFetchOldPasscodeViewController_startBackoffWithTimeout___block_invoke_2;
  v9[3] = &unk_24FDCD9F8;
  objc_copyWeak(&v10, &location);
  v7 = -[LAPSPasscodeBackoffTimerController initWithTimeout:updateHandler:completionHandler:](v5, "initWithTimeout:updateHandler:completionHandler:", a3, v11, v9);
  timer = self->_timer;
  self->_timer = v7;

  -[LAPSPasscodeBackoffTimerController start](self->_timer, "start");
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __62__LAPSFetchOldPasscodeViewController_startBackoffWithTimeout___block_invoke(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id *v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fetchOldPasscodeViewController:backoffMessageForTimeout:", v9, a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_loadWeakRetained(v9 + 124);
    objc_msgSend(v6, "setHeader:", v5);

    v7 = objc_loadWeakRetained(v9 + 124);
    objc_msgSend(v7, "unfocus");

    v8 = objc_loadWeakRetained(v9 + 124);
    objc_msgSend(v8, "clear");

    objc_msgSend(v9, "resignFirstResponder");
    WeakRetained = v9;
  }

}

void __62__LAPSFetchOldPasscodeViewController_startBackoffWithTimeout___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 124;
    v7 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 124);
    objc_msgSend(v7[121], "prompt");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHeader:", v4);

    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "clear");

    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "focus");

    objc_msgSend(v7, "becomeFirstResponder");
    WeakRetained = v7;
  }

}

- (void)showPasscodeValidationError:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeVC);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __77__LAPSFetchOldPasscodeViewController_showPasscodeValidationError_completion___block_invoke;
  v11[3] = &unk_24FDCDB10;
  objc_copyWeak(&v14, &location);
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  objc_msgSend(WeakRetained, "shakeWithCompletion:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __77__LAPSFetchOldPasscodeViewController_showPasscodeValidationError_completion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained + 124;
    v8 = WeakRetained;
    v4 = objc_loadWeakRetained(WeakRetained + 124);
    objc_msgSend(v4, "hideSpinner");

    v5 = objc_loadWeakRetained(v3);
    objc_msgSend(v5, "clear");

    v6 = objc_loadWeakRetained(v3);
    objc_msgSend(v6, "setErrorMessage:", *(_QWORD *)(a1 + 32));

    v7 = objc_loadWeakRetained(v3);
    objc_msgSend(v7, "focus");

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    WeakRetained = v8;
  }

}

- (void)finishWithPasscode:(id)a3
{
  id v4;
  LAPSFetchOldPasscodeViewControllerOutput *v5;

  v4 = a3;
  v5 = objc_alloc_init(LAPSFetchOldPasscodeViewControllerOutput);
  -[LAPSFetchOldPasscodeViewControllerOutput setPasscode:](v5, "setPasscode:", v4);

  -[LAPSFetchOldPasscodeViewController _invokeHandlerWithOutput:](self, "_invokeHandlerWithOutput:", v5);
}

- (void)passcodeViewController:(id)a3 verifyPasscode:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v10, "unfocus");
  objc_msgSend(v10, "showSpinner");
  -[LAPSFetchOldPasscodeViewControllerInput passcodeType](self->_input, "passcodeType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", v8) & 1) == 0)
    -[LAPSFetchOldPasscodeViewController passcodeViewController:verifyPasscode:].cold.1();

  -[LAPSFetchOldPasscodeViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchOldPasscodeViewController:verifyPasscode:", self, v6);

}

- (void)passcodeViewController:(id)a3 didCancelWithError:(id)a4
{
  -[LAPSFetchOldPasscodeViewController _invokeHandlerWithError:](self, "_invokeHandlerWithError:", a4);
}

- (void)_addChildVC:(id)a3
{
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
  id obj;

  obj = a3;
  -[LAPSFetchOldPasscodeViewController addChildViewController:](self, "addChildViewController:", obj);
  -[LAPSFetchOldPasscodeViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  objc_msgSend(obj, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(obj, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchOldPasscodeViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  objc_msgSend(obj, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchOldPasscodeViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  objc_msgSend(obj, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchOldPasscodeViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  objc_msgSend(obj, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSFetchOldPasscodeViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActive:", 1);

  objc_msgSend(obj, "didMoveToParentViewController:", self);
  objc_storeWeak((id *)&self->_currentChildVC, obj);

}

- (void)_invokeHandlerWithOutput:(id)a3
{
  -[LAPSFetchOldPasscodeViewController _invokeHandlerWithOutput:error:](self, "_invokeHandlerWithOutput:error:", a3, 0);
}

- (void)_invokeHandlerWithError:(id)a3
{
  -[LAPSFetchOldPasscodeViewController _invokeHandlerWithOutput:error:](self, "_invokeHandlerWithOutput:error:", 0, a3);
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

    -[LAPSFetchOldPasscodeViewController _deactivate](self, "_deactivate");
    v10[2](v10, v8, v7);

  }
}

- (void)_deactivate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeVC);
  objc_msgSend(WeakRetained, "unfocus");

}

- (LAPSFetchOldPasscodeViewControllerDelegate)delegate
{
  return (LAPSFetchOldPasscodeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_handler, 0);
  objc_destroyWeak((id *)&self->_passcodeVC);
  objc_destroyWeak((id *)&self->_currentChildVC);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

- (void)passcodeViewController:verifyPasscode:.cold.1()
{
  __assert_rtn("-[LAPSFetchOldPasscodeViewController passcodeViewController:verifyPasscode:]", "LAPSFetchOldPasscodeViewController.m", 152, "[[_input passcodeType] isEqual:[passcode type]]");
}

@end

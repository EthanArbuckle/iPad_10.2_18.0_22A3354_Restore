@implementation SUUIRedeemViewControllerLegacy

- (SUUIRedeemViewControllerLegacy)initWithRedeemCategory:(int64_t)a3
{
  id v5;
  SUUILoadingView *v6;
  void *v7;
  void *v8;
  SUUIRedeemViewControllerLegacy *v9;
  SUUIRedeemViewControllerLegacy *v10;
  objc_super v12;

  v5 = objc_alloc_init(MEMORY[0x24BEBDB08]);
  v6 = objc_alloc_init(SUUILoadingView);
  -[SUUILoadingView setAutoresizingMask:](v6, "setAutoresizingMask:", 45);
  -[SUUILoadingView sizeToFit](v6, "sizeToFit");
  objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  -[SUUILoadingView bounds](v6, "bounds");
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v7, "bounds");
  -[SUUILoadingView setFrame:](v6, "setFrame:");
  objc_msgSend(v7, "addSubview:", v6);
  v12.receiver = self;
  v12.super_class = (Class)SUUIRedeemViewControllerLegacy;
  v9 = -[SUUIRedeemViewControllerLegacy initWithRootViewController:](&v12, sel_initWithRootViewController_, v5);
  v10 = v9;
  if (v9)
  {
    v9->_cameraRedeemEnabled = -1;
    v9->_category = a3;
    -[SUUIRedeemViewControllerLegacy setModalPresentationStyle:](v9, "setModalPresentationStyle:", 2);
  }
  -[SUUIRedeemViewControllerLegacy setShouldPerformInitialOperationOnAppear:](v10, "setShouldPerformInitialOperationOnAppear:", 1);

  return v10;
}

- (void)setCameraRedeemVisible:(BOOL)a3
{
  if (a3)
  {
    self->_cameraRedeemEnabled = 1;
    self->_cameraRedeemVisible = 1;
  }
}

- (void)setClientContext:(id)a3
{
  SUUIClientContext *v5;
  SUUIClientContext *v6;

  v5 = (SUUIClientContext *)a3;
  if (self->_clientContext != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_clientContext, a3);
    -[SUUIRedeemStepViewController setClientContext:](self->_inputViewController, "setClientContext:", self->_clientContext);
    v5 = v6;
  }

}

- (NSOperationQueue)operationQueue
{
  NSOperationQueue *operationQueue;
  NSOperationQueue *v4;
  NSOperationQueue *v5;

  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    v5 = self->_operationQueue;
    self->_operationQueue = v4;

    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_operationQueue, "setMaxConcurrentOperationCount:", 2);
    operationQueue = self->_operationQueue;
  }
  return operationQueue;
}

- (CGSize)preferredContentSize
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double Width;
  double Height;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;
  CGSize result;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 != 1)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x24BEBDB58], "keyWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v30.origin.x = v7;
  v30.origin.y = v9;
  v30.size.width = v11;
  v30.size.height = v13;
  Width = CGRectGetWidth(v30);
  v31.origin.x = v7;
  v31.origin.y = v9;
  v31.size.width = v11;
  v31.size.height = v13;
  Height = CGRectGetHeight(v31);
  if (Width < 1024.0 || Height < 1024.0)
  {
LABEL_7:
    v28.receiver = self;
    v28.super_class = (Class)SUUIRedeemViewControllerLegacy;
    -[SUUIRedeemViewControllerLegacy preferredContentSize](&v28, sel_preferredContentSize);
    v18 = v17;
    v20 = v19;
  }
  else
  {
    -[SUUIRedeemViewControllerLegacy navigationBar](self, "navigationBar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      objc_msgSend(v21, "frame");
      v23 = CGRectGetHeight(v32);
    }
    else
    {
      v23 = 0.0;
    }
    v24 = v23 + 1045.0;
    v25 = v23 + 904.0;
    if (Height <= Width)
      v20 = v25;
    else
      v20 = v24;
    *(double *)&v18 = 784.0;

  }
  v26 = *(double *)&v18;
  v27 = v20;
  result.height = v27;
  result.width = v26;
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
    return 30;
  if (SUUIAllowsLandscapePhone())
    return 26;
  return 2;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIRedeemViewControllerLegacy;
  -[SUUIRedeemViewControllerLegacy viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  -[SUUIRedeemViewControllerLegacy traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_initialBarStyle = objc_msgSend(v6, "statusBarStyle");

    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStatusBarStyle:", 0);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  -[SUUIRedeemViewControllerLegacy topViewController](self, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRedeemViewControllerLegacy cancelButtonItem](self, "cancelButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLeftBarButtonItem:", v7);

  if (-[SUUIRedeemViewControllerLegacy shouldPerformInitialOperationOnAppear](self, "shouldPerformInitialOperationOnAppear"))
  {
    -[SUUIRedeemViewControllerLegacy _performInitialRedeemOperation](self, "_performInitialRedeemOperation");
    -[SUUIRedeemViewControllerLegacy setShouldPerformInitialOperationOnAppear:](self, "setShouldPerformInitialOperationOnAppear:", 0);
  }
  else if (!self->_inputViewController && self->_redeemConfiguration)
  {
    -[SUUIRedeemViewControllerLegacy _showInputViewController](self, "_showInputViewController");
  }
  v8.receiver = self;
  v8.super_class = (Class)SUUIRedeemViewControllerLegacy;
  -[SUUIRedeemViewControllerLegacy viewWillAppear:](&v8, sel_viewWillAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIRedeemViewControllerLegacy;
  -[SUUIRedeemViewControllerLegacy viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  -[SUUIRedeemViewControllerLegacy traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStatusBarStyle:", self->_initialBarStyle);

  }
}

- (void)dismissAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  objc_super v7;

  v3 = a3;
  -[SUUIRedeemViewControllerLegacy parentViewController](self, "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SUUIRedeemViewControllerLegacy parentViewController](self, "parentViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissAnimated:", v3);

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SUUIRedeemViewControllerLegacy;
    -[SUUIRedeemViewControllerLegacy dismissAnimated:](&v7, sel_dismissAnimated_, v3);
  }
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v6 = a4;
  -[SUUIRedeemViewControllerLegacy parentViewController](self, "parentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SUUIRedeemViewControllerLegacy parentViewController](self, "parentViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", v4, v6);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SUUIRedeemViewControllerLegacy;
    -[SUUIRedeemViewControllerLegacy dismissViewControllerAnimated:completion:](&v9, sel_dismissViewControllerAnimated_completion_, v4, v6);
  }

}

- (void)redeemStepViewControllerShouldValidateNationalID:(id)a3
{
  SUUIRedeemStepViewController *inputViewController;

  inputViewController = self->_inputViewController;
  self->_inputViewController = 0;

  -[SUUIRedeemViewControllerLegacy _showNationalIdVerificationPage](self, "_showNationalIdVerificationPage");
}

- (void)redeemIdViewController:(id)a3 submittedWithFields:(id)a4
{
  id v5;

  v5 = a4;
  -[SUUIRedeemViewControllerLegacy _showNationalIdLoadingPage](self, "_showNationalIdLoadingPage");
  -[SUUIRedeemViewControllerLegacy _executeIdValidationOperationWithFields:](self, "_executeIdValidationOperationWithFields:", v5);

}

- (void)redeemAgainAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  _QWORD v7[2];

  v3 = a3;
  v7[1] = *MEMORY[0x24BDAC8D0];
  v5 = -[SUUIRedeemViewControllerLegacy _newInputViewController](self, "_newInputViewController");
  v7[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRedeemViewControllerLegacy setViewControllers:animated:](self, "setViewControllers:animated:", v6, v3);

}

- (void)_cancelButtonAction:(id)a3
{
  SUUIRedeemPreflightOperation *preflightOperation;

  -[SUUIRedeemViewControllerLegacy dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[SUUIRedeemPreflightOperation setOutputBlock:](self->_preflightOperation, "setOutputBlock:", 0);
  preflightOperation = self->_preflightOperation;
  self->_preflightOperation = 0;

}

- (void)_performInitialRedeemOperation
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_class();
  -[SUUIRedeemViewControllerLegacy clientContext](self, "clientContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "redeemRequiresNationalId:", v4);

  if ((_DWORD)v3)
    -[SUUIRedeemViewControllerLegacy _executeRequiresIdValidationOperation](self, "_executeRequiresIdValidationOperation");
  else
    -[SUUIRedeemViewControllerLegacy _executePreflightOperationForcesAuthentication:](self, "_executePreflightOperationForcesAuthentication:", 1);
}

- (void)_executePreflightOperationForcesAuthentication:(BOOL)a3
{
  SUUIRedeemPreflightOperation *v4;
  SUUIRedeemPreflightOperation *preflightOperation;
  SUUIRedeemConfiguration *v6;
  void *v7;
  SUUIRedeemConfiguration *v8;
  SUUIRedeemPreflightOperation *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;

  if (!self->_preflightOperation)
  {
    v4 = -[SUUIRedeemPreflightOperation initWithClientContext:redeemCode:forcesAuthentication:]([SUUIRedeemPreflightOperation alloc], "initWithClientContext:redeemCode:forcesAuthentication:", self->_clientContext, self->_initialCode, a3);
    preflightOperation = self->_preflightOperation;
    self->_preflightOperation = v4;

    -[SUUIRedeemPreflightOperation setRedeemViewController:](self->_preflightOperation, "setRedeemViewController:", self);
    -[SUUIRedeemPreflightOperation setLoadsRedeemCodeMetadata:](self->_preflightOperation, "setLoadsRedeemCodeMetadata:", -[SUUIRedeemViewControllerLegacy attempsAutomaticRedeem](self, "attempsAutomaticRedeem"));
    v6 = [SUUIRedeemConfiguration alloc];
    -[SUUIRedeemViewControllerLegacy operationQueue](self, "operationQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SUUIRedeemConfiguration initWithOperationQueue:category:clientContext:](v6, "initWithOperationQueue:category:clientContext:", v7, self->_category, self->_clientContext);

    -[SUUIRedeemPreflightOperation setRedeemConfiguration:](self->_preflightOperation, "setRedeemConfiguration:", v8);
    objc_initWeak(&location, self);
    v9 = self->_preflightOperation;
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __81__SUUIRedeemViewControllerLegacy__executePreflightOperationForcesAuthentication___block_invoke;
    v14 = &unk_2511F7C08;
    objc_copyWeak(&v15, &location);
    -[SUUIRedeemPreflightOperation setOutputBlock:](v9, "setOutputBlock:", &v11);
    -[SUUIRedeemViewControllerLegacy operationQueue](self, "operationQueue", v11, v12, v13, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addOperation:", self->_preflightOperation);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
}

void __81__SUUIRedeemViewControllerLegacy__executePreflightOperationForcesAuthentication___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __81__SUUIRedeemViewControllerLegacy__executePreflightOperationForcesAuthentication___block_invoke_2;
  v5[3] = &unk_2511F6220;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v7);
}

void __81__SUUIRedeemViewControllerLegacy__executePreflightOperationForcesAuthentication___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_finishPreflightWithResult:", *(_QWORD *)(a1 + 32));

}

- (void)_attemptAutomaticRedeemWithMetadata:(id)a3
{
  id v4;
  SUUIRedeemOperation *v5;
  void *v6;
  SUUIRedeemOperation *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  id location;

  v4 = a3;
  v5 = [SUUIRedeemOperation alloc];
  objc_msgSend(v4, "code");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[SUUIRedeemOperation initWithCode:](v5, "initWithCode:", v6);
  }
  else
  {
    objc_msgSend(v4, "inputCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SUUIRedeemOperation initWithCode:](v5, "initWithCode:", v8);

  }
  -[SUUIRedeemViewControllerLegacy clientContext](self, "clientContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRedeemOperation setClientContext:](v7, "setClientContext:", v9);

  objc_initWeak(&location, self);
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __70__SUUIRedeemViewControllerLegacy__attemptAutomaticRedeemWithMetadata___block_invoke;
  v14 = &unk_2511F5980;
  objc_copyWeak(&v15, &location);
  -[SUUIRedeemOperation setResultBlock:](v7, "setResultBlock:", &v11);
  -[SUUIRedeemViewControllerLegacy operationQueue](self, "operationQueue", v11, v12, v13, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addOperation:", v7);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __70__SUUIRedeemViewControllerLegacy__attemptAutomaticRedeemWithMetadata___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__SUUIRedeemViewControllerLegacy__attemptAutomaticRedeemWithMetadata___block_invoke_2;
  block[3] = &unk_2511F5128;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v12);
}

void __70__SUUIRedeemViewControllerLegacy__attemptAutomaticRedeemWithMetadata___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  SUUIRedeemResultsViewController *v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(_QWORD *)(a1 + 32))
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "_loadInputViewController");
LABEL_5:
    WeakRetained = v6;
    goto LABEL_6;
  }
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = -[SUUIRedeemResultsViewController initWithRedeem:]([SUUIRedeemResultsViewController alloc], "initWithRedeem:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v6, "clientContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRedeemStepViewController setClientContext:](v3, "setClientContext:", v4);

    -[SUUIRedeemStepViewController setConfiguration:](v3, "setConfiguration:", v6[182]);
    objc_msgSend(v6, "operationQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRedeemStepViewController setOperationQueue:](v3, "setOperationQueue:", v5);

    -[SUUIRedeemResultsViewController setRedeemCategory:](v3, "setRedeemCategory:", objc_msgSend(v6, "category"));
    objc_msgSend(v6, "pushViewController:animated:", v3, 1);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)_finishPreflightWithResult:(id)a3
{
  void *v4;
  int v5;
  SUUIRedeemPreflightOperation *preflightOperation;
  SUUIRedeemConfiguration *v7;
  SUUIRedeemConfiguration *redeemConfiguration;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v13 = a3;
  if (!objc_msgSend(v13, "resultType"))
  {
    objc_msgSend(v13, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isManagedAppleID");

    if (!v5)
    {
      objc_msgSend(v13, "redeemConfiguration");
      v7 = (SUUIRedeemConfiguration *)objc_claimAutoreleasedReturnValue();
      redeemConfiguration = self->_redeemConfiguration;
      self->_redeemConfiguration = v7;

      objc_msgSend(v13, "clientContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIRedeemViewControllerLegacy setClientContext:](self, "setClientContext:", v9);

      objc_msgSend(v13, "codeMetadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[SUUIRedeemViewControllerLegacy attempsAutomaticRedeem](self, "attempsAutomaticRedeem"))
      {
        objc_msgSend(v10, "items");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count"))
        {
          v12 = objc_msgSend(v10, "allowsAutoSubmission");

          if (!v12)
            goto LABEL_8;
        }
        else
        {

        }
        -[SUUIRedeemViewControllerLegacy _attemptAutomaticRedeemWithMetadata:](self, "_attemptAutomaticRedeemWithMetadata:", v10);
        goto LABEL_11;
      }
LABEL_8:
      -[SUUIRedeemViewControllerLegacy _loadInputViewController](self, "_loadInputViewController");
LABEL_11:

      goto LABEL_4;
    }
  }
  -[SUUIRedeemViewControllerLegacy dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
LABEL_4:
  -[SUUIRedeemPreflightOperation setOutputBlock:](self->_preflightOperation, "setOutputBlock:", 0);
  preflightOperation = self->_preflightOperation;
  self->_preflightOperation = 0;

}

- (void)_loadInputViewController
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (self->_cameraRedeemEnabled == 255)
  {
    objc_initWeak(&location, self);
    -[SUUIClientContext URLBag](self->_clientContext, "URLBag");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __58__SUUIRedeemViewControllerLegacy__loadInputViewController__block_invoke;
    v4[3] = &unk_2511F7C30;
    objc_copyWeak(&v5, &location);
    objc_msgSend(v3, "loadValueForKey:completionBlock:", CFSTR("cameraGiftingEnabled"), v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else
  {
    -[SUUIRedeemViewControllerLegacy _showInputViewController](self, "_showInputViewController");
  }
}

void __58__SUUIRedeemViewControllerLegacy__loadInputViewController__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__SUUIRedeemViewControllerLegacy__loadInputViewController__block_invoke_2;
  v5[3] = &unk_2511F6220;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v7);
}

void __58__SUUIRedeemViewControllerLegacy__loadInputViewController__block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[1409] = objc_msgSend(*(id *)(a1 + 32), "BOOLValue");
    objc_msgSend(WeakRetained, "_showInputViewController");
  }

}

- (id)_newInputViewController
{
  _BOOL4 v3;
  SUUIRedeemCameraViewController *v4;
  int64_t category;
  uint64_t v6;
  SUUIRedeemInputViewController *v7;
  void *v8;
  void *v9;
  void *v10;

  if (self->_cameraRedeemEnabled && objc_msgSend(MEMORY[0x24BE27E58], "isCRCodeRedeemerAvailable"))
  {
    v3 = -[SUUIRedeemViewControllerLegacy cameraRedeemVisible](self, "cameraRedeemVisible");
    v4 = [SUUIRedeemCameraViewController alloc];
    category = self->_category;
    if (v3)
      v6 = -[SUUIRedeemCameraViewController initWithRedeemCategoryFullscreen:](v4, "initWithRedeemCategoryFullscreen:", category);
    else
      v6 = -[SUUIRedeemCameraViewController initWithRedeemCategory:](v4, "initWithRedeemCategory:", category);
    v7 = (SUUIRedeemInputViewController *)v6;
    -[SUUIRedeemViewControllerLegacy cameraDelegate](self, "cameraDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRedeemInputViewController setCameraOverrideDelegate:](v7, "setCameraOverrideDelegate:", v8);

    -[SUUIRedeemViewControllerLegacy cameraDelegate](self, "cameraDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRedeemInputViewController setDelegate:](v7, "setDelegate:", v9);

  }
  else
  {
    v7 = -[SUUIRedeemInputViewController initWithRedeemCategory:]([SUUIRedeemInputViewController alloc], "initWithRedeemCategory:", self->_category);
  }
  -[SUUIRedeemStepViewController setClientContext:](v7, "setClientContext:", self->_clientContext);
  -[SUUIRedeemStepViewController setConfiguration:](v7, "setConfiguration:", self->_redeemConfiguration);
  -[SUUIRedeemViewControllerLegacy operationQueue](self, "operationQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRedeemStepViewController setOperationQueue:](v7, "setOperationQueue:", v10);

  -[SUUIRedeemStepViewController setRedeemStepDelegate:](v7, "setRedeemStepDelegate:", self);
  return v7;
}

- (void)_showInputViewController
{
  SUUIRedeemStepViewController *v3;
  SUUIRedeemStepViewController *inputViewController;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_inputViewController)
  {
    v3 = -[SUUIRedeemViewControllerLegacy _newInputViewController](self, "_newInputViewController");
    inputViewController = self->_inputViewController;
    self->_inputViewController = v3;

    -[SUUIRedeemStepViewController setInitialCode:](self->_inputViewController, "setInitialCode:", self->_initialCode);
    v6[0] = self->_inputViewController;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRedeemViewControllerLegacy setViewControllers:](self, "setViewControllers:", v5);

  }
}

- (UIBarButtonItem)cancelButtonItem
{
  UIBarButtonItem *cancelButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *v6;
  void *v7;
  void *v8;

  cancelButtonItem = self->_cancelButtonItem;
  if (!cancelButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_alloc_init(MEMORY[0x24BEBD410]);
    v5 = self->_cancelButtonItem;
    self->_cancelButtonItem = v4;

    -[UIBarButtonItem setAction:](self->_cancelButtonItem, "setAction:", sel__cancelButtonAction_);
    -[UIBarButtonItem setTarget:](self->_cancelButtonItem, "setTarget:", self);
    v6 = self->_cancelButtonItem;
    SUUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("REDEEM_CANCEL_BUTTON"), &stru_2511FF0C8, CFSTR("Redeem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTitle:](v6, "setTitle:", v8);

    cancelButtonItem = self->_cancelButtonItem;
  }
  return cancelButtonItem;
}

+ (BOOL)redeemRequiresNationalId:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "URLBag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:error:", CFSTR("redeemRequiresNationalId"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (void)_executeRequiresIdValidationOperation
{
  SUUIRedeemIdRequiresValidationOperation *v3;
  void *v4;
  _QWORD v5[5];

  v3 = objc_alloc_init(SUUIRedeemIdRequiresValidationOperation);
  -[SUUIRedeemIdRequiresValidationOperation setRedeemViewController:](v3, "setRedeemViewController:", self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __71__SUUIRedeemViewControllerLegacy__executeRequiresIdValidationOperation__block_invoke;
  v5[3] = &unk_2511F51C8;
  v5[4] = self;
  -[SUUIRedeemIdRequiresValidationOperation setResultBlock:](v3, "setResultBlock:", v5);
  -[SUUIRedeemViewControllerLegacy operationQueue](self, "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addOperation:", v3);

}

uint64_t __71__SUUIRedeemViewControllerLegacy__executeRequiresIdValidationOperation__block_invoke(uint64_t a1, char a2, int a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if ((a2 & 1) == 0)
    return objc_msgSend(v3, "dismissAnimated:", 1);
  if (a3)
    return objc_msgSend(v3, "_showNationalIdVerificationPage");
  return objc_msgSend(v3, "_executePreflightOperationForcesAuthentication:");
}

- (void)_executeIdValidationOperationWithFields:(id)a3
{
  id v4;
  SUUIRedeemIdValidateOperation *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  v5 = -[SUUIRedeemIdValidateOperation initWithDictionary:]([SUUIRedeemIdValidateOperation alloc], "initWithDictionary:", v4);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__SUUIRedeemViewControllerLegacy__executeIdValidationOperationWithFields___block_invoke;
  v7[3] = &unk_2511F4908;
  v7[4] = self;
  -[SUUIRedeemIdValidateOperation setResultBlock:](v5, "setResultBlock:", v7);
  -[SUUIRedeemViewControllerLegacy operationQueue](self, "operationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addOperation:", v5);

}

uint64_t __74__SUUIRedeemViewControllerLegacy__executeIdValidationOperationWithFields___block_invoke(uint64_t a1, int a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "_executePreflightOperationForcesAuthentication:", 0);
  else
    return objc_msgSend(v2, "_showNationalIdVerificationPage");
}

- (void)_showNationalIdVerificationPage
{
  SUUIRedeemIdViewController *v3;
  void *v4;
  SUUIRedeemIdViewController *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v3 = [SUUIRedeemIdViewController alloc];
  -[SUUIRedeemViewControllerLegacy clientContext](self, "clientContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SUUIRedeemIdViewController initWithClientContext:](v3, "initWithClientContext:", v4);

  -[SUUIRedeemIdViewController setDelegate:](v5, "setDelegate:", self);
  v7[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRedeemViewControllerLegacy setViewControllers:](self, "setViewControllers:", v6);

}

- (void)_showNationalIdLoadingPage
{
  SUUILoadingViewController *v3;
  void *v4;
  SUUILoadingViewController *v5;
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
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v3 = [SUUILoadingViewController alloc];
  -[SUUIRedeemViewControllerLegacy clientContext](self, "clientContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SUUILoadingViewController initWithClientContext:](v3, "initWithClientContext:", v4);

  -[SUUIRedeemViewControllerLegacy clientContext](self, "clientContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "localizedStringForKey:inTable:", CFSTR("REDEEM_NATIONAL_ID_VIEW_TITLE"), CFSTR("Redeem"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_NATIONAL_ID_VIEW_TITLE"), 0, CFSTR("Redeem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUILoadingViewController setTitle:](v5, "setTitle:", v8);

  -[SUUIRedeemViewControllerLegacy clientContext](self, "clientContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "localizedStringForKey:inTable:", CFSTR("REDEEM_NATIONAL_ID_VERIFYING"), CFSTR("Redeem"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_NATIONAL_ID_VERIFYING"), 0, CFSTR("Redeem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUILoadingViewController setLoadingText:](v5, "setLoadingText:", v11);

  SUUITableViewGroupedBackgroundColor();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUILoadingViewController setBackgroundColor:](v5, "setBackgroundColor:", v12);

  -[SUUILoadingViewController navigationItem](v5, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRedeemViewControllerLegacy cancelButtonItem](self, "cancelButtonItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLeftBarButtonItem:", v14);

  v16[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRedeemViewControllerLegacy setViewControllers:](self, "setViewControllers:", v15);

}

- (BOOL)attempsAutomaticRedeem
{
  return self->_attempsAutomaticRedeem;
}

- (void)setAttempsAutomaticRedeem:(BOOL)a3
{
  self->_attempsAutomaticRedeem = a3;
}

- (BOOL)cameraRedeemVisible
{
  return self->_cameraRedeemVisible;
}

- (int64_t)category
{
  return self->_category;
}

- (NSString)initialCode
{
  return self->_initialCode;
}

- (void)setInitialCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1432);
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (SUUIRedeemConfiguration)redeemConfiguration
{
  return self->_redeemConfiguration;
}

- (void)setRedeemConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_redeemConfiguration, a3);
}

- (SUUIRedeemViewCameraOverrideDelegate)cameraDelegate
{
  return (SUUIRedeemViewCameraOverrideDelegate *)objc_loadWeakRetained((id *)&self->_cameraDelegate);
}

- (void)setCameraDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_cameraDelegate, a3);
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (BOOL)shouldPerformInitialOperationOnAppear
{
  return self->_shouldPerformInitialOperationOnAppear;
}

- (void)setShouldPerformInitialOperationOnAppear:(BOOL)a3
{
  self->_shouldPerformInitialOperationOnAppear = a3;
}

- (void)setCancelButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButtonItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButtonItem, 0);
  objc_destroyWeak((id *)&self->_cameraDelegate);
  objc_storeStrong((id *)&self->_inputViewController, 0);
  objc_storeStrong((id *)&self->_redeemConfiguration, 0);
  objc_storeStrong((id *)&self->_preflightOperation, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_initialCode, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end

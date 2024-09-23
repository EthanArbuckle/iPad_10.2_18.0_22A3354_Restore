@implementation AMSUIEngagementTaskViewController

- (AMSUIEngagementTaskViewController)initWithRequest:(id)a3 bag:(id)a4
{
  id v7;
  id v8;
  AMSUIEngagementTaskViewController *v9;
  AMSUIEngagementTaskViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIEngagementTaskViewController;
  v9 = -[AMSUIEngagementTaskViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bag, a4);
    objc_storeStrong((id *)&v10->_request, a3);
    -[AMSUIEngagementTaskViewController _setup](v10, "_setup");
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  void (**v4)(void);
  objc_super v5;

  if (!-[AMSUIEngagementTaskViewController ignoresDismissDetection](self, "ignoresDismissDetection"))
  {
    -[AMSUIEngagementTaskViewController dismissBlock](self, "dismissBlock");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[AMSUIEngagementTaskViewController dismissBlock](self, "dismissBlock");
      v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v4[2]();

      -[AMSUIEngagementTaskViewController setDismissBlock:](self, "setDismissBlock:", 0);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)AMSUIEngagementTaskViewController;
  -[AMSUICommonViewController dealloc](&v5, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMSUIEngagementTaskViewController;
  -[AMSUICommonViewController loadView](&v5, sel_loadView);
  -[AMSUIEngagementTaskViewController setTransitioningDelegate:](self, "setTransitioningDelegate:", self);
  objc_msgSend(MEMORY[0x24BEBD4B8], "ams_primaryBackground");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUICommonViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUIEngagementTaskViewController;
  -[AMSUIEngagementTaskViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  int v5;
  void *v6;
  void (**v7)(void);
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AMSUIEngagementTaskViewController;
  -[AMSUIEngagementTaskViewController viewDidDisappear:](&v8, sel_viewDidDisappear_, a3);
  if (!-[AMSUIEngagementTaskViewController ignoresDismissDetection](self, "ignoresDismissDetection"))
  {
    if ((-[AMSUIEngagementTaskViewController isBeingDismissed](self, "isBeingDismissed") & 1) == 0)
    {
      -[AMSUIEngagementTaskViewController navigationController](self, "navigationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "isBeingDismissed"))
      {

      }
      else
      {
        v5 = -[AMSUIEngagementTaskViewController isMovingFromParentViewController](self, "isMovingFromParentViewController");

        if (!v5)
          return;
      }
    }
    -[AMSUIEngagementTaskViewController dismissBlock](self, "dismissBlock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[AMSUIEngagementTaskViewController dismissBlock](self, "dismissBlock");
      v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v7[2]();

      -[AMSUIEngagementTaskViewController setDismissBlock:](self, "setDismissBlock:", 0);
    }
  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AMSUIEngagementTaskViewController;
  -[AMSUIEngagementTaskViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  -[AMSUICommonViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[AMSUIEngagementTaskViewController childController](self, "childController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  void *v4;
  void (**v5)(void);

  if (!-[AMSUIEngagementTaskViewController ignoresDismissDetection](self, "ignoresDismissDetection", a3))
  {
    -[AMSUIEngagementTaskViewController dismissBlock](self, "dismissBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[AMSUIEngagementTaskViewController dismissBlock](self, "dismissBlock");
      v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v5[2]();

      -[AMSUIEngagementTaskViewController setDismissBlock:](self, "setDismissBlock:", 0);
    }
  }
}

- (id)canPresent
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x24BE08078]);
  -[AMSUIEngagementTaskViewController _preloadChild](self, "_preloadChild");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__AMSUIEngagementTaskViewController_canPresent__block_invoke;
  v7[3] = &unk_24CB4FB08;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "addFinishBlock:", v7);

  return v5;
}

uint64_t __47__AMSUIEngagementTaskViewController_canPresent__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishWithSuccess");
  else
    return objc_msgSend(v2, "finishWithError:");
}

- (id)startEngagement
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[AMSUIEngagementTaskViewController request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)AMSSetLogKey();

  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIEngagementTaskViewController request](self, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableURL();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v26 = v8;
    v27 = 2114;
    v28 = v9;
    v29 = 2114;
    v30 = v12;
    _os_log_impl(&dword_211102000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting engagement task with URL: %{public}@", buf, 0x20u);

  }
  -[AMSUIEngagementTaskViewController childPromise](self, "childPromise");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  v15 = MEMORY[0x24BDAC760];
  if (v14)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke;
    block[3] = &unk_24CB4F0E8;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  -[AMSUIEngagementTaskViewController _preloadChild](self, "_preloadChild");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke_2;
  v23[3] = &unk_24CB4FB30;
  v23[4] = self;
  objc_msgSend(v16, "continueWithBlock:", v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v15;
  v22[1] = 3221225472;
  v22[2] = __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke_31;
  v22[3] = &unk_24CB4FA78;
  v22[4] = self;
  objc_msgSend(v17, "catchWithBlock:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, self);
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke_2_35;
  v20[3] = &unk_24CB4FB58;
  objc_copyWeak(&v21, (id *)buf);
  objc_msgSend(v18, "addFinishBlock:", v20);
  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
  return v18;
}

void __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke(uint64_t a1)
{
  void *v1;
  AMSUICommonLoadingViewController *v2;

  v1 = *(void **)(a1 + 32);
  v2 = objc_alloc_init(AMSUICommonLoadingViewController);
  objc_msgSend(v1, "_updateChildViewController:", v2);

}

id __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id location;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)AMSSetLogKey();

  v10 = objc_alloc_init(MEMORY[0x24BE08340]);
  objc_msgSend(*(id *)(a1 + 32), "setPresented:", 1);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v11 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke_3;
  v29[3] = &unk_24CB4F588;
  objc_copyWeak(&v31, &location);
  v12 = v10;
  v30 = v12;
  objc_msgSend(*(id *)(a1 + 32), "setDismissBlock:", v29);
  if (v6)
  {
    v22 = v11;
    v23 = 3221225472;
    v24 = __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke_26;
    v25 = &unk_24CB4F370;
    v26 = *(_QWORD *)(a1 + 32);
    v13 = v6;
    v27 = v13;
    v14 = v12;
    v28 = v14;
    dispatch_async(MEMORY[0x24BDAC9B8], &v22);
    objc_msgSend(*(id *)(a1 + 32), "setError:", v13, v22, v23, v24, v25, v26);
    v15 = v14;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_opt_class();
      AMSLogKey();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v34 = v18;
      v35 = 2114;
      v36 = v19;
      v37 = 2114;
      v38 = v5;
      _os_log_impl(&dword_211102000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Presenting: %{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_updateChildViewController:", v5);
    v20 = v12;
  }

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

  return v12;
}

void __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)AMSSetLogKey();

  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v8;
    v21 = 2114;
    v22 = v9;
    _os_log_impl(&dword_211102000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dismiss called on presented view controller", (uint8_t *)&v19, 0x16u);

  }
  objc_msgSend(WeakRetained, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(WeakRetained, "result");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = *(void **)(a1 + 32);
      objc_msgSend(WeakRetained, "result");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v16 = v15;
LABEL_10:
      objc_msgSend(v16, "finishWithResult:", v13);
      goto LABEL_11;
    }
    objc_msgSend(WeakRetained, "request");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "failOnDismiss") & 1) != 0)
    {

    }
    else
    {
      v18 = objc_msgSend(WeakRetained, "ignoresDismissDetection");

      if ((v18 & 1) == 0)
      {
        v13 = objc_alloc_init(MEMORY[0x24BE08180]);
        v16 = *(void **)(a1 + 32);
        goto LABEL_10;
      }
    }
    v11 = *(void **)(a1 + 32);
    AMSError();
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v11 = *(void **)(a1 + 32);
  objc_msgSend(WeakRetained, "error");
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v13 = (id)v12;
  objc_msgSend(v11, "finishWithError:", v12);
LABEL_11:

}

void __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke_26(uint64_t a1)
{
  void *v2;
  AMSUICommonErrorViewController *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  AMSUICommonErrorViewController *v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v3 = [AMSUICommonErrorViewController alloc];
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke_2_28;
  v11[3] = &unk_24CB4F588;
  objc_copyWeak(&v13, &location);
  v12 = *(id *)(a1 + 48);
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke_3_29;
  v10[3] = &unk_24CB4F0E8;
  v10[4] = *(_QWORD *)(a1 + 32);
  v9 = -[AMSUICommonErrorViewController initWithError:logKey:bag:retryAction:cancelAction:](v3, "initWithError:logKey:bag:retryAction:cancelAction:", v4, v6, v7, v11, v10);
  objc_msgSend(v2, "_updateChildViewController:", v9);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke_2_28(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "childController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "unsetChildViewController:", v2);

  objc_msgSend(WeakRetained, "setChildController:", 0);
  objc_msgSend(WeakRetained, "setError:", 0);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(WeakRetained, "startEngagement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithPromise:", v4);

}

void __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke_3_29(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "dismissBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "dismissBlock");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

    objc_msgSend(*(id *)(a1 + 32), "setDismissBlock:", 0);
  }
}

id __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke_31(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a2;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v8 = v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "presented"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE07D30]);

  objc_msgSend(v3, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "code");
  objc_msgSend(v3, "ams_title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_message");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_underlyingError");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  AMSCustomError();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setError:", v14);
  objc_msgSend(MEMORY[0x24BE08340], "promiseWithError:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __52__AMSUIEngagementTaskViewController_startEngagement__block_invoke_2_35(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)AMSSetLogKey();

  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v6)
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_opt_class();
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v14;
      v23 = 2114;
      v24 = v15;
      v25 = 2114;
      v26 = v16;
      v17 = "%{public}@: [%{public}@] Task completed with error: %{public}@";
      v18 = v13;
      v19 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl(&dword_211102000, v18, v19, v17, (uint8_t *)&v21, 0x20u);

    }
  }
  else
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_opt_class();
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v20;
      v23 = 2114;
      v24 = v15;
      v25 = 2112;
      v26 = v16;
      v17 = "%{public}@: [%{public}@] Task completed successfully. %@";
      v18 = v13;
      v19 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_10;
    }
  }

}

- (void)_setup
{
  void *v3;
  uint64_t v4;
  AMSEngagementOfflineBag *v5;
  AMSEngagementOfflineBag *v6;
  id v7;

  -[AMSUIEngagementTaskViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", -[AMSUIEngagementTaskViewController _modalPresentationStyle](self, "_modalPresentationStyle"));
  -[AMSUIEngagementTaskViewController request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "destinationStyle");

  if (v4 == 1)
  {
    v5 = [AMSEngagementOfflineBag alloc];
    -[AMSUIEngagementTaskViewController bag](self, "bag");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = -[AMSEngagementOfflineBag initWithUnderlyingBag:](v5, "initWithUnderlyingBag:", v7);
    -[AMSUIEngagementTaskViewController setBag:](self, "setBag:", v6);

  }
}

- (void)_finishWithResultInfo:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v19 = a3;
  v6 = a4;
  -[AMSUIEngagementTaskViewController error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (v6)
    {
      -[AMSUIEngagementTaskViewController setError:](self, "setError:", v6);
      -[AMSUIEngagementTaskViewController setResult:](self, "setResult:", 0);
    }
    else
    {
      -[AMSUIEngagementTaskViewController result](self, "result");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
        v10 = v8;
      else
        v10 = objc_alloc_init(MEMORY[0x24BE08180]);
      v11 = v10;

      -[AMSUIEngagementTaskViewController result](self, "result");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");
      v15 = v14;
      if (v14)
        v16 = v14;
      else
        v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v17 = v16;

      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __65__AMSUIEngagementTaskViewController__finishWithResultInfo_error___block_invoke;
      v20[3] = &unk_24CB4FB80;
      v21 = v17;
      v18 = v17;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v20);
      objc_msgSend(v11, "setUserInfo:", v18);
      -[AMSUIEngagementTaskViewController setResult:](self, "setResult:", v11);

    }
  }

}

uint64_t __65__AMSUIEngagementTaskViewController__finishWithResultInfo_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

- (id)_isOriginatingURLTrusted
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v26[5];
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIEngagementTaskViewController request](self, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "originatingURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIEngagementTaskViewController request](self, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v31 = v5;
    v32 = 2114;
    v33 = v6;
    v34 = 2114;
    v35 = v8;
    v36 = 2114;
    v37 = v10;
    _os_log_impl(&dword_211102000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Checking if originating URL %{public}@ is trusted for request %{public}@", buf, 0x2Au);

  }
  -[AMSUIEngagementTaskViewController request](self, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "originatingURL");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {

    goto LABEL_9;
  }
  v13 = (void *)v12;
  -[AMSUIEngagementTaskViewController request](self, "request");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "destinationStyle");

  if (v15)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x24BE08078], "promiseWithSuccess");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    return v24;
  }
  v16 = objc_alloc_init(MEMORY[0x24BE08078]);
  +[AMSUIEngagementTask createBagForSubProfile](AMSUIEngagementTask, "createBagForSubProfile");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "arrayForKey:", CFSTR("trustedEngagementReferrers"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "valuePromise");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __61__AMSUIEngagementTaskViewController__isOriginatingURLTrusted__block_invoke;
  v28[3] = &unk_24CB4F560;
  v21 = v16;
  v29 = v21;
  objc_msgSend(v19, "addErrorBlock:", v28);
  v26[0] = v20;
  v26[1] = 3221225472;
  v26[2] = __61__AMSUIEngagementTaskViewController__isOriginatingURLTrusted__block_invoke_2;
  v26[3] = &unk_24CB4FBA8;
  v26[4] = self;
  v22 = v21;
  v27 = v22;
  objc_msgSend(v19, "addSuccessBlock:", v26);
  v23 = v27;
  v24 = v22;

  return v24;
}

void __61__AMSUIEngagementTaskViewController__isOriginatingURLTrusted__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  AMSError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithError:", v2);

}

void __61__AMSUIEngagementTaskViewController__isOriginatingURLTrusted__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "originatingURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "_isURLTrusted:inDomains:", v6, v4);

  v7 = *(void **)(a1 + 40);
  if ((_DWORD)v3)
  {
    objc_msgSend(v7, "finishWithSuccess");
  }
  else
  {
    AMSError();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishWithError:", v8);

  }
}

- (BOOL)_isURLTrusted:(id)a3 inDomains:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(a3, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v12, "length", (_QWORD)v15))
        {
          if (objc_msgSend(v12, "hasPrefix:", CFSTR(".")))
          {
            if ((objc_msgSend(v6, "hasSuffix:", v12) & 1) != 0)
              goto LABEL_15;
          }
          else if (!objc_msgSend(v6, "caseInsensitiveCompare:", v12))
          {
LABEL_15:
            v13 = 1;
            goto LABEL_16;
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_16:

  return v13;
}

- (int64_t)_modalPresentationStyle
{
  void *v2;
  uint64_t v3;

  -[AMSUIEngagementTaskViewController request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "presentationStyle");

  if (v3 == 3)
    return 1;
  else
    return 2 * (v3 != 2);
}

- (id)_preloadChild
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[AMSUIEngagementTaskViewController childPromise](self, "childPromise");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[AMSUIEngagementTaskViewController _isOriginatingURLTrusted](self, "_isOriginatingURLTrusted");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "promiseAdapter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __50__AMSUIEngagementTaskViewController__preloadChild__block_invoke;
    v8[3] = &unk_24CB4FBD0;
    v8[4] = self;
    objc_msgSend(v5, "thenWithBlock:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIEngagementTaskViewController setChildPromise:](self, "setChildPromise:", v6);

  }
  -[AMSUIEngagementTaskViewController childPromise](self, "childPromise");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __50__AMSUIEngagementTaskViewController__preloadChild__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[5];

  v2 = objc_alloc_init(MEMORY[0x24BE08340]);
  objc_msgSend(*(id *)(a1 + 32), "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "destinationStyle");

  if (v4 == 1)
  {
    v5 = &unk_24CB8C020;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "destinationStyle");

    if (v7 != 2)
    {
      v8 = objc_alloc(MEMORY[0x24BE083E8]);
      objc_msgSend(*(id *)(a1 + 32), "bag");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithBag:", v9);

      objc_msgSend(*(id *)(a1 + 32), "request");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "typeForURL:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v2 = (id)v13;
      goto LABEL_7;
    }
    v5 = &unk_24CB8C038;
  }
  objc_msgSend(v2, "finishWithResult:", v5);
LABEL_7:
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __50__AMSUIEngagementTaskViewController__preloadChild__block_invoke_52;
  v16[3] = &unk_24CB4FBD0;
  v16[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "thenWithBlock:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __50__AMSUIEngagementTaskViewController__preloadChild__block_invoke_52(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)AMSSetLogKey();

  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
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
    v13 = 138543874;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    v17 = 2048;
    v18 = objc_msgSend(v3, "longValue");
    _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Determined URL type: %ld", (uint8_t *)&v13, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_viewControllerForType:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_receivedCarrierLinkResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AMSUIEngagementTaskViewController result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = objc_alloc_init(MEMORY[0x24BE08180]);
  v8 = v7;

  objc_msgSend(v8, "setCarrierLinkResult:", v4);
  -[AMSUIEngagementTaskViewController setResult:](self, "setResult:", v8);
  v10 = CFSTR("didCarrierLink");
  v11[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIEngagementTaskViewController _finishWithResultInfo:error:](self, "_finishWithResultInfo:error:", v9, 0);

}

- (void)_receivedPurchaseResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AMSUIEngagementTaskViewController result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = objc_alloc_init(MEMORY[0x24BE08180]);
  v8 = v7;

  objc_msgSend(v8, "setPurchaseResult:", v4);
  -[AMSUIEngagementTaskViewController setResult:](self, "setResult:", v8);
  v10 = CFSTR("didPurchase");
  v11[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIEngagementTaskViewController _finishWithResultInfo:error:](self, "_finishWithResultInfo:error:", v9, 0);

}

- (void)_updateChildViewController:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64__AMSUIEngagementTaskViewController__updateChildViewController___block_invoke;
  v6[3] = &unk_24CB4F4C0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __64__AMSUIEngagementTaskViewController__updateChildViewController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "childController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "childController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unsetChildViewController:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "setChildController:", *(_QWORD *)(a1 + 40));
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "childController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setChildViewController:", v6);

}

- (id)_viewControllerForType:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD block[5];
  id v12;
  id v13;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE08340]);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__AMSUIEngagementTaskViewController__viewControllerForType___block_invoke;
  block[3] = &unk_24CB4F370;
  block[4] = self;
  v12 = v4;
  v6 = v5;
  v13 = v6;
  v7 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  v8 = v13;
  v9 = v6;

  return v9;
}

void __60__AMSUIEngagementTaskViewController__viewControllerForType___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  AMSUIDynamicViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  AMSUIWebViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  AMSUIWebViewController *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientData");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x24BDBD1B8];
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  v29 = CFSTR("engagementTask");
  v30[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_dictionaryByAddingEntriesFromDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(a1[5], "integerValue");
  switch(v9)
  {
    case 0:
      v20 = [AMSUIWebViewController alloc];
      objc_msgSend(a1[4], "bag");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[AMSUIWebViewController initWithBag:account:clientInfo:](v20, "initWithBag:account:clientInfo:", v21, 0, 0);

      objc_msgSend(a1[4], "request");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "account");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIWebViewController setAccount:](v14, "setAccount:", v23);

      objc_msgSend(a1[4], "clientInfo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIWebViewController setClientInfo:](v14, "setClientInfo:", v24);

      -[AMSUIWebViewController setClientOptions:](v14, "setClientOptions:", v8);
      -[AMSUIWebViewController setDelegate:](v14, "setDelegate:", a1[4]);
      objc_msgSend(a1[4], "request");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "metricsOverlay");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIWebViewController setMetricsOverlay:](v14, "setMetricsOverlay:", v26);

      objc_msgSend(a1[4], "request");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "URL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[AMSUIWebViewController loadURL:](v14, "loadURL:", v19);
      goto LABEL_8;
    case 1:
      v28 = a1[6];
      AMSError();
      v14 = (AMSUIWebViewController *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "finishWithError:", v14);
      goto LABEL_10;
    case 2:
      v10 = [AMSUIDynamicViewController alloc];
      objc_msgSend(a1[4], "bag");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "request");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "URL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[AMSUIDynamicViewController initWithBag:URL:](v10, "initWithBag:URL:", v11, v13);

      objc_msgSend(a1[4], "request");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "account");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIWebViewController setAccount:](v14, "setAccount:", v16);

      objc_msgSend(a1[4], "clientInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIWebViewController setClientInfo:](v14, "setClientInfo:", v17);

      -[AMSUIWebViewController setClientOptions:](v14, "setClientOptions:", v8);
      -[AMSUIWebViewController setDelegate:](v14, "setDelegate:", a1[4]);
      objc_msgSend(a1[4], "request");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "metricsOverlay");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIWebViewController setMetricsOverlay:](v14, "setMetricsOverlay:", v19);
LABEL_8:

      objc_msgSend(a1[6], "finishWithResult:", v14);
LABEL_10:

      break;
  }

}

+ (AMSBagKeySet)bagKeySet
{
  return +[AMSUIWebViewController bagKeySet](AMSUIWebViewController, "bagKeySet");
}

+ (NSString)bagSubProfile
{
  return +[AMSUIWebViewController bagSubProfile](AMSUIWebViewController, "bagSubProfile");
}

+ (NSString)bagSubProfileVersion
{
  return +[AMSUIWebViewController bagSubProfileVersion](AMSUIWebViewController, "bagSubProfileVersion");
}

+ (id)createBagForSubProfile
{
  return +[AMSUIWebViewController createBagForSubProfile](AMSUIWebViewController, "createBagForSubProfile");
}

- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v7)
  {
    if (!v9)
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
      v18 = 138543618;
      v19 = v12;
      v20 = 2114;
      v21 = v13;
      _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dynamic UI carrier link succeeded", (uint8_t *)&v18, 0x16u);

    }
    -[AMSUIEngagementTaskViewController _receivedCarrierLinkResult:](self, "_receivedCarrierLinkResult:", v7);
  }
  else
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_opt_class();
      AMSLogKey();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v15;
      v20 = 2114;
      v21 = v16;
      v22 = 2114;
      v23 = v17;
      _os_log_impl(&dword_211102000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Dynamic UI carrier link failed with error: %{public}@", (uint8_t *)&v18, 0x20u);

    }
  }

}

- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v7)
  {
    if (!v9)
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
      v18 = 138543618;
      v19 = v12;
      v20 = 2114;
      v21 = v13;
      _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dynamic UI purchase succeeded", (uint8_t *)&v18, 0x16u);

    }
    -[AMSUIEngagementTaskViewController _receivedPurchaseResult:](self, "_receivedPurchaseResult:", v7);
  }
  else
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_opt_class();
      AMSLogKey();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v15;
      v20 = 2114;
      v21 = v16;
      v22 = 2114;
      v23 = v17;
      _os_log_impl(&dword_211102000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Dynamic UI purchase failed with error: %{public}@", (uint8_t *)&v18, 0x20u);

    }
  }

}

- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void (**v16)(void);
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_opt_class();
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v10;
      v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dynamic UI purchase succeeded", (uint8_t *)&v17, 0x16u);

    }
    -[AMSUIEngagementTaskViewController _receivedPurchaseResult:](self, "_receivedPurchaseResult:", v6);
  }
  else
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v13;
      v19 = 2114;
      v20 = v14;
      _os_log_impl(&dword_211102000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dynamic UI flow resolved and was dismissed", (uint8_t *)&v17, 0x16u);

    }
    -[AMSUIEngagementTaskViewController dismissBlock](self, "dismissBlock");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[AMSUIEngagementTaskViewController dismissBlock](self, "dismissBlock");
      v16 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v16[2]();

      -[AMSUIEngagementTaskViewController setDismissBlock:](self, "setDismissBlock:", 0);
    }
  }

}

- (void)dynamicViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void (**v15)(void);
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BE081D8];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "sharedConfig");
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
    v16 = 138543618;
    v17 = v12;
    v18 = 2114;
    v19 = v13;
    _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dynamic UI did resolve", (uint8_t *)&v16, 0x16u);

  }
  -[AMSUIEngagementTaskViewController _finishWithResultInfo:error:](self, "_finishWithResultInfo:error:", v9, v8);

  -[AMSUIEngagementTaskViewController dismissBlock](self, "dismissBlock");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[AMSUIEngagementTaskViewController dismissBlock](self, "dismissBlock");
    v15 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v15[2]();

    -[AMSUIEngagementTaskViewController setDismissBlock:](self, "setDismissBlock:", 0);
  }
}

- (BOOL)dynamicViewControllerShouldDismiss:(id)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void (**v9)(void);
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dynamic UI will dismiss", (uint8_t *)&v11, 0x16u);

  }
  -[AMSUIEngagementTaskViewController dismissBlock](self, "dismissBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AMSUIEngagementTaskViewController dismissBlock](self, "dismissBlock");
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v9[2]();

    -[AMSUIEngagementTaskViewController setDismissBlock:](self, "setDismissBlock:", 0);
  }
  return -[AMSUIEngagementTaskViewController ignoresDismissDetection](self, "ignoresDismissDetection");
}

- (void)webViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v6 = (void *)MEMORY[0x24BE081D8];
    v7 = a4;
    objc_msgSend(v6, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_opt_class();
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Web UI purchase succeeded", (uint8_t *)&v12, 0x16u);

    }
    -[AMSUIEngagementTaskViewController _receivedPurchaseResult:](self, "_receivedPurchaseResult:", v7);

  }
}

- (void)webViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5 completion:(id)a6
{
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void (**v18)(void);
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = a6;
  v10 = (void *)MEMORY[0x24BE081D8];
  v11 = a5;
  v12 = a4;
  objc_msgSend(v10, "sharedConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "OSLogObject");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_opt_class();
    AMSLogKey();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v15;
    v21 = 2114;
    v22 = v16;
    _os_log_impl(&dword_211102000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Web UI did resolve", (uint8_t *)&v19, 0x16u);

  }
  -[AMSUIEngagementTaskViewController _finishWithResultInfo:error:](self, "_finishWithResultInfo:error:", v12, v11);

  if (-[AMSUIEngagementTaskViewController ignoresDismissDetection](self, "ignoresDismissDetection"))
  {
    -[AMSUIEngagementTaskViewController dismissBlock](self, "dismissBlock");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[AMSUIEngagementTaskViewController dismissBlock](self, "dismissBlock");
      v18 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v18[2]();

      -[AMSUIEngagementTaskViewController setDismissBlock:](self, "setDismissBlock:", 0);
    }
  }
  (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, MEMORY[0x24BDBD1C8], 0);

}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (UIViewController)childController
{
  return self->_childController;
}

- (void)setChildController:(id)a3
{
  objc_storeStrong((id *)&self->_childController, a3);
}

- (AMSPromise)childPromise
{
  return self->_childPromise;
}

- (void)setChildPromise:(id)a3
{
  objc_storeStrong((id *)&self->_childPromise, a3);
}

- (id)dismissBlock
{
  return self->_dismissBlock;
}

- (void)setDismissBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)presented
{
  return self->_presented;
}

- (void)setPresented:(BOOL)a3
{
  self->_presented = a3;
}

- (AMSEngagementRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (AMSEngagementResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (BOOL)ignoresDismissDetection
{
  return self->_ignoresDismissDetection;
}

- (void)setIgnoresDismissDetection:(BOOL)a3
{
  self->_ignoresDismissDetection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_dismissBlock, 0);
  objc_storeStrong((id *)&self->_childPromise, 0);
  objc_storeStrong((id *)&self->_childController, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
}

@end

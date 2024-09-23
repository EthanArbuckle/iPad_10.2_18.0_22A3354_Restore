@implementation AMSUIWebPlaceholderViewController

- (AMSUIWebPlaceholderViewController)initWithContext:(id)a3
{
  id v5;
  AMSUIWebPlaceholderViewController *v6;
  AMSUIWebPlaceholderViewController *v7;
  uint64_t v8;
  AMSBinaryPromise *snapshotPromise;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSUIWebPlaceholderViewController;
  v6 = -[AMSUICommonViewController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    objc_msgSend(MEMORY[0x24BE08078], "promiseWithSuccess");
    v8 = objc_claimAutoreleasedReturnValue();
    snapshotPromise = v7->_snapshotPromise;
    v7->_snapshotPromise = (AMSBinaryPromise *)v8;

  }
  return v7;
}

- (AMSUIWebPlaceholderViewController)initWithModel:(id)a3 context:(id)a4 appearance:(id)a5
{
  id v9;
  id v10;
  AMSUIWebPlaceholderViewController *v11;
  AMSUIWebPlaceholderViewController *v12;

  v9 = a3;
  v10 = a5;
  v11 = -[AMSUIWebPlaceholderViewController initWithContext:](self, "initWithContext:", a4);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_appearance, a5);
    objc_storeStrong((id *)&v12->_model, a3);
  }

  return v12;
}

- (AMSUIWebPlaceholderViewController)initWithSnapshot:(id)a3 context:(id)a4 appearance:(id)a5
{
  id v8;
  id v9;
  id v10;
  AMSUIWebPlaceholderViewController *v11;
  AMSUIWebPlaceholderViewController *v12;
  AMSBinaryPromise *v13;
  AMSBinaryPromise *snapshotPromise;
  AMSUIWebSnapshotView *v15;
  void *v16;
  uint64_t v17;
  AMSUIWebSnapshotView *snapshotView;
  _QWORD v20[4];
  id v21;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[AMSUIWebPlaceholderViewController initWithContext:](self, "initWithContext:", v9);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_appearance, a5);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (AMSBinaryPromise *)objc_alloc_init(MEMORY[0x24BE08078]);
      snapshotPromise = v12->_snapshotPromise;
      v12->_snapshotPromise = v13;

      objc_initWeak(&location, v12);
      v15 = [AMSUIWebSnapshotView alloc];
      objc_msgSend(v8, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __73__AMSUIWebPlaceholderViewController_initWithSnapshot_context_appearance___block_invoke;
      v20[3] = &unk_24CB4F800;
      objc_copyWeak(&v21, &location);
      v17 = -[AMSUIWebSnapshotView initWithView:completion:](v15, "initWithView:completion:", v16, v20);
      snapshotView = v12->_snapshotView;
      v12->_snapshotView = (AMSUIWebSnapshotView *)v17;

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }

  return v12;
}

void __73__AMSUIWebPlaceholderViewController_initWithSnapshot_context_appearance___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "snapshotPromise");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithSuccess");

}

- (void)awaitSnapshotWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[AMSUIWebPlaceholderViewController snapshotPromise](self, "snapshotPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__AMSUIWebPlaceholderViewController_awaitSnapshotWithCompletion___block_invoke;
  v7[3] = &unk_24CB51B00;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "addFinishBlock:", v7);

}

uint64_t __65__AMSUIWebPlaceholderViewController_awaitSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AMSUIWebPlaceholderViewController;
  -[AMSUICommonViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AMSUIWebPlaceholderViewController;
  -[AMSUICommonViewController loadView](&v14, sel_loadView);
  +[AMSUIWebAppearance defaultPlatformBackgroundColor](AMSUIWebAppearance, "defaultPlatformBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUICommonViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ams_setBackgroundColor:", v3);

  v5 = (void *)objc_opt_class();
  -[AMSUIWebPlaceholderViewController model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "placeholderStyleLoadingControllerWithMessage:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebPlaceholderViewController setLoadingController:](self, "setLoadingController:", v8);

  -[AMSUIWebPlaceholderViewController loadingController](self, "loadingController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_setBackgroundColor:", v3);

  -[AMSUIWebPlaceholderViewController model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v11, "disableDelay");

  if ((_DWORD)v10)
    -[AMSUIWebPlaceholderViewController _transitionToLoadingAnimated:](self, "_transitionToLoadingAnimated:", 0);
  else
    -[AMSUIWebPlaceholderViewController _transitionToSnapshot](self, "_transitionToSnapshot");
  -[AMSUIWebPlaceholderViewController snapshotID](self, "snapshotID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = (void *)objc_opt_new();
    -[AMSUIWebPlaceholderViewController setSnapshotID:](self, "setSnapshotID:", v13);

  }
}

- (void)willAppearAfterDismiss
{
  -[AMSUIWebPlaceholderViewController _startReappearTransitionTimerAnimated:](self, "_startReappearTransitionTimerAnimated:", 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)AMSUIWebPlaceholderViewController;
  -[AMSUIWebPlaceholderViewController viewDidDisappear:](&v16, sel_viewDidDisappear_, a3);
  -[AMSUIWebPlaceholderViewController setIsVisible:](self, "setIsVisible:", 0);
  -[AMSUIWebPlaceholderViewController loadingController](self, "loadingController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeMessage");

  -[AMSUIWebPlaceholderViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "reducedMemoryMode");

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = objc_opt_class();
      -[AMSUIWebPlaceholderViewController context](self, "context");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v9;
      v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Reduce memory mode enabled, cleaning up snapshot", buf, 0x16u);

    }
    -[AMSUIWebPlaceholderViewController removeSnapshot](self, "removeSnapshot");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[AMSUIWebPlaceholderViewController context](self, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "snapshotCache");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIWebPlaceholderViewController snapshotID](self, "snapshotID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v12, v15);

    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AMSUIWebPlaceholderViewController;
  -[AMSUIWebPlaceholderViewController viewWillAppear:](&v15, sel_viewWillAppear_, a3);
  -[AMSUIWebPlaceholderViewController _applyAppearance](self, "_applyAppearance");
  -[AMSUIWebPlaceholderViewController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "reducedMemoryMode");

  if (v5)
  {
    -[AMSUIWebPlaceholderViewController context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "snapshotCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebPlaceholderViewController snapshotID](self, "snapshotID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[AMSUIWebPlaceholderViewController snapshotView](self, "snapshotView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "updateSnapshot:", v9);

    }
  }
  -[AMSUIWebPlaceholderViewController snapshotView](self, "snapshotView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[AMSUIWebPlaceholderViewController visibleView](self, "visibleView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebPlaceholderViewController snapshotView](self, "snapshotView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v12 == v13;

  }
  else
  {
    v14 = 0;
  }

  if (!-[AMSUIWebPlaceholderViewController hasAppeared](self, "hasAppeared") && !v14)
    -[AMSUIWebPlaceholderViewController _startReappearTransitionTimerAnimated:](self, "_startReappearTransitionTimerAnimated:", -[AMSUIWebPlaceholderViewController animateFadeIn](self, "animateFadeIn"));
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMSUIWebPlaceholderViewController;
  -[AMSUIWebPlaceholderViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[AMSUIWebPlaceholderViewController setIsVisible:](self, "setIsVisible:", 1);
  -[AMSUIWebPlaceholderViewController setHasAppeared:](self, "setHasAppeared:", 1);
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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AMSUIWebPlaceholderViewController;
  -[AMSUIWebPlaceholderViewController viewWillLayoutSubviews](&v13, sel_viewWillLayoutSubviews);
  -[AMSUICommonViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[AMSUIWebPlaceholderViewController visibleView](self, "visibleView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (id)removeSnapshot
{
  void *v2;
  void *v3;

  -[AMSUIWebPlaceholderViewController snapshotView](self, "snapshotView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)willPresentPageModel:(id)a3 appearance:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  if (v9)
  {
    objc_storeStrong((id *)&self->_model, v9);
    objc_storeStrong((id *)&self->_appearance, a4);
    -[AMSUIWebPlaceholderViewController _applyAppearance](self, "_applyAppearance");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_opt_class();
      -[AMSUIWebPlaceholderViewController context](self, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v12;
      v17 = 2114;
      v18 = v14;
      v19 = 2114;
      v20 = v8;
      _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid loading page model: %{public}@", (uint8_t *)&v15, 0x20u);

    }
  }

}

- (void)_applyAppearance
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[AMSUIWebPlaceholderViewController appearance](self, "appearance");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  +[AMSUIWebAppearance defaultPlatformBackgroundColor](AMSUIWebAppearance, "defaultPlatformBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "backgroundColor");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (void *)v4;
  else
    v6 = v3;
  -[AMSUICommonViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_setBackgroundColor:", v6);

  objc_msgSend(v13, "backgroundColor");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = v3;
  -[AMSUIWebPlaceholderViewController loadingController](self, "loadingController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ams_setBackgroundColor:", v10);

}

- (void)_startReappearTransitionTimerAnimated:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  dispatch_time_t v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  BOOL v17;
  id location;
  _QWORD block[4];
  id v20;
  id v21;

  -[AMSUIWebPlaceholderViewController visibleView](self, "visibleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebPlaceholderViewController loadingController](self, "loadingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
  {
    objc_initWeak(&location, self);
    v8 = MEMORY[0x24BDAC9B8];
    v9 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __75__AMSUIWebPlaceholderViewController__startReappearTransitionTimerAnimated___block_invoke;
    v15[3] = &unk_24CB51B28;
    objc_copyWeak(&v16, &location);
    v17 = a3;
    v10 = v15;
    AMSLogKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = dispatch_time(0, 1500000000);
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __AMSDispatchAfter_block_invoke_1;
    block[3] = &unk_24CB4F3C0;
    v20 = v11;
    v21 = v10;
    v13 = v11;
    v14 = (void *)MEMORY[0x24BDAC9B8];
    dispatch_after(v12, MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __75__AMSUIWebPlaceholderViewController__startReappearTransitionTimerAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_transitionToLoadingAnimated:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(WeakRetained, "setSnapshotView:", 0);

}

- (void)_replacePrimaryViewWithView:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a4;
  v15 = a3;
  -[AMSUIWebPlaceholderViewController visibleView](self, "visibleView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v15;
  if (v6 != v15)
  {
    -[AMSUIWebPlaceholderViewController visibleView](self, "visibleView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebPlaceholderViewController loadingController](self, "loadingController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v10)
    {
      -[AMSUIWebPlaceholderViewController loadingController](self, "loadingController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUICommonViewController unsetChildViewController:](self, "unsetChildViewController:", v11);

    }
    -[AMSUIWebPlaceholderViewController visibleView](self, "visibleView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeFromSuperview");

    -[AMSUICommonViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    objc_msgSend(v15, "setFrame:");

    -[AMSUICommonViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v15);

    -[AMSUIWebPlaceholderViewController setVisibleView:](self, "setVisibleView:", v15);
    v7 = v15;
    if (v4)
    {
      -[AMSUIWebPlaceholderViewController _animateTransition](self, "_animateTransition");
      v7 = v15;
    }
  }

}

- (void)_replacePrimaryViewWithViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  -[AMSUIWebPlaceholderViewController visibleView](self, "visibleView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    -[AMSUIWebPlaceholderViewController visibleView](self, "visibleView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[AMSUICommonViewController setChildViewController:](self, "setChildViewController:", v10);
    objc_msgSend(v10, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebPlaceholderViewController setVisibleView:](self, "setVisibleView:", v9);

    if (v4)
      -[AMSUIWebPlaceholderViewController _animateTransition](self, "_animateTransition");
  }

}

- (void)_animateTransition
{
  void *v3;
  _QWORD v4[5];

  -[AMSUIWebPlaceholderViewController visibleView](self, "visibleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__AMSUIWebPlaceholderViewController__animateTransition__block_invoke;
  v4[3] = &unk_24CB4F0E8;
  v4[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 0, v4, 0, 0.5, 0.0);
}

void __55__AMSUIWebPlaceholderViewController__animateTransition__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "visibleView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)_transitionToLoadingAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[AMSUIWebPlaceholderViewController loadingController](self, "loadingController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebPlaceholderViewController _replacePrimaryViewWithViewController:animated:](self, "_replacePrimaryViewWithViewController:animated:", v5, v3);

}

- (void)_transitionToSnapshot
{
  void *v3;
  id v4;

  -[AMSUIWebPlaceholderViewController snapshotView](self, "snapshotView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AMSUIWebPlaceholderViewController snapshotView](self, "snapshotView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebPlaceholderViewController _replacePrimaryViewWithView:animated:](self, "_replacePrimaryViewWithView:animated:", v4, 0);

  }
}

- (BOOL)animateFadeIn
{
  return self->_animateFadeIn;
}

- (void)setAnimateFadeIn:(BOOL)a3
{
  self->_animateFadeIn = a3;
}

- (AMSUIWebAppearance)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_appearance, a3);
}

- (AMSUIWebLoadingPageModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (AMSUIWebPagePresenter)originalViewController
{
  return self->_originalViewController;
}

- (void)setOriginalViewController:(id)a3
{
  objc_storeStrong((id *)&self->_originalViewController, a3);
}

- (AMSUIWebClientContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (BOOL)hasAppeared
{
  return self->_hasAppeared;
}

- (void)setHasAppeared:(BOOL)a3
{
  self->_hasAppeared = a3;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (void)setIsVisible:(BOOL)a3
{
  self->_isVisible = a3;
}

- (AMSUIMessageLoadingViewController)loadingController
{
  return self->_loadingController;
}

- (void)setLoadingController:(id)a3
{
  objc_storeStrong((id *)&self->_loadingController, a3);
}

- (BOOL)shouldSnapshot
{
  return self->_shouldSnapshot;
}

- (void)setShouldSnapshot:(BOOL)a3
{
  self->_shouldSnapshot = a3;
}

- (NSUUID)snapshotID
{
  return self->_snapshotID;
}

- (void)setSnapshotID:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotID, a3);
}

- (AMSBinaryPromise)snapshotPromise
{
  return self->_snapshotPromise;
}

- (void)setSnapshotPromise:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotPromise, a3);
}

- (AMSUIWebSnapshotView)snapshotView
{
  return self->_snapshotView;
}

- (void)setSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotView, a3);
}

- (UIView)visibleView
{
  return self->_visibleView;
}

- (void)setVisibleView:(id)a3
{
  objc_storeStrong((id *)&self->_visibleView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleView, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_snapshotPromise, 0);
  objc_storeStrong((id *)&self->_snapshotID, 0);
  objc_storeStrong((id *)&self->_loadingController, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_originalViewController, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_appearance, 0);
}

@end

@implementation AMSUIWebContainerViewController

- (AMSUIWebContainerViewController)initWithViewController:(id)a3 appearance:(id)a4 navigationBar:(id)a5 context:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AMSUIWebContainerViewController *v15;
  AMSUIWebContainerViewController *v16;
  uint64_t v17;
  AMSUIWebAppearance *appearance;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = -[AMSUIWebContainerViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v16 = v15;
  if (v15)
  {
    v15->_activePresentationType = 0;
    v17 = objc_msgSend(v12, "copy");
    appearance = v16->_appearance;
    v16->_appearance = (AMSUIWebAppearance *)v17;

    objc_storeStrong((id *)&v16->_containedViewController, a3);
    objc_storeWeak((id *)&v16->_context, v14);
    v16->_dismissCalled = 0;
    objc_storeStrong((id *)&v16->_navigationBarModel, a5);
  }

  return v16;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (!-[AMSUIWebContainerViewController dismissCalled](self, "dismissCalled"))
  {
    -[AMSUIWebContainerViewController pushPresentationDelegate](self, "pushPresentationDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      -[AMSUIWebContainerViewController handleModalDismissal](self, "handleModalDismissal");
  }
  v4.receiver = self;
  v4.super_class = (Class)AMSUIWebContainerViewController;
  -[AMSUICommonViewController dealloc](&v4, sel_dealloc);
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[AMSUIWebContainerViewController containedViewController](self, "containedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentScrollViewForEdge:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)loadView
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AMSUIWebContainerViewController;
  -[AMSUICommonViewController loadView](&v11, sel_loadView);
  -[AMSUIWebContainerViewController setTransitioningDelegate:](self, "setTransitioningDelegate:", self);
  -[AMSUIWebContainerViewController containedViewController](self, "containedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUICommonViewController setChildViewController:](self, "setChildViewController:", v3);

  v4 = objc_alloc(MEMORY[0x24BE082F8]);
  -[AMSUIWebContainerViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebContainerViewController context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithBag:metrics:", v6, v8);
  -[AMSUIWebContainerViewController setPageRenderPresenter:](self, "setPageRenderPresenter:", v9);

  -[AMSUIWebContainerViewController pageRenderPresenter](self, "pageRenderPresenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startWithActivity:", 0);

}

- (id)navigationItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[AMSUIWebContainerViewController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_navigationItemViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "navigationItem");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AMSUIWebContainerViewController;
    -[AMSUIWebContainerViewController navigationItem](&v8, sel_navigationItem);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)AMSUIWebContainerViewController;
  -[AMSUIWebContainerViewController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  -[AMSUIWebContainerViewController pageRenderPresenter](self, "pageRenderPresenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewDidAppear");

  -[AMSUIWebContainerViewController _postEvent:](self, "_postEvent:", CFSTR("DidAppear"));
  -[AMSUIWebContainerViewController setDismissCalled:](self, "setDismissCalled:", 0);
  if (!-[AMSUIWebContainerViewController isAppearing](self, "isAppearing")
    && -[AMSUIWebContainerViewController didAppearOnce](self, "didAppearOnce")
    && (-[AMSUIWebContainerViewController isMovingToParentViewController](self, "isMovingToParentViewController") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = objc_opt_class();
      -[AMSUIWebContainerViewController context](self, "context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v7;
      v13 = 2114;
      v14 = v9;
      _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Did re-appear from pop", buf, 0x16u);

    }
    -[AMSUIWebContainerViewController didDismissController:](self, "didDismissController:", self);
  }
  -[AMSUIWebContainerViewController setDidAppearOnce:](self, "setDidAppearOnce:", 1);
  -[AMSUIWebContainerViewController setIsAppearing:](self, "setIsAppearing:", 1);
  -[AMSUIWebContainerViewController setShouldSkipInitialRefresh:](self, "setShouldSkipInitialRefresh:", 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[AMSUIWebContainerViewController _postEvent:](self, "_postEvent:", CFSTR("DidDisappear"));
  v5.receiver = self;
  v5.super_class = (Class)AMSUIWebContainerViewController;
  -[AMSUIWebContainerViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
  -[AMSUIWebContainerViewController setIsAppearing:](self, "setIsAppearing:", 0);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMSUIWebContainerViewController;
  -[AMSUIWebContainerViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[AMSUIWebContainerViewController pageRenderPresenter](self, "pageRenderPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewDidLoad");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSUIWebContainerViewController;
  -[AMSUIWebContainerViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[AMSUIWebContainerViewController pageRenderPresenter](self, "pageRenderPresenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewWillAppear");

  self->_activePresentationType = -[AMSUIWebContainerViewController _determineActivePresentationType](self, "_determineActivePresentationType");
  -[AMSUIWebContainerViewController _refreshForInitialAppear](self, "_refreshForInitialAppear");
  -[AMSUIWebContainerViewController navigationBarModel](self, "navigationBarModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebContainerViewController applyNavigationModel:](self, "applyNavigationModel:", v5);

  -[AMSUIWebContainerViewController _applyAppearance](self, "_applyAppearance");
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
  v14.super_class = (Class)AMSUIWebContainerViewController;
  -[AMSUIWebContainerViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  -[AMSUICommonViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[AMSUIWebContainerViewController containedViewController](self, "containedViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

}

- (void)applyNavigationModel:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_navigationBarModel, a3);
    -[AMSUIWebContainerViewController _setupNavBarAnimated:](self, "_setupNavBarAnimated:", 0);
    v5 = v6;
  }

}

- (void)cacheScrollViewPositionFor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  objc_msgSend(v5, "webView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_initWeak(&location, self);
    objc_msgSend(v6, "underlyingWebView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __62__AMSUIWebContainerViewController_cacheScrollViewPositionFor___block_invoke;
    v8[3] = &unk_24CB50ED0;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v7, "evaluateJavaScript:completionHandler:", CFSTR("window.scrollY;"), v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __62__AMSUIWebContainerViewController_cacheScrollViewPositionFor___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  double v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(WeakRetained, "setScrollPosition:", 0.0, v4);
  }

}

- (void)handleModalDismissal
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!-[AMSUIWebContainerViewController dismissCalled](self, "dismissCalled"))
  {
    -[AMSUIWebContainerViewController setDismissCalled:](self, "setDismissCalled:", 1);
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
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
      -[AMSUIWebContainerViewController context](self, "context");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v5;
      v11 = 2114;
      v12 = v7;
      _os_log_impl(&dword_211102000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling modal dismissal", (uint8_t *)&v9, 0x16u);

    }
    -[AMSUIWebContainerViewController modalPresentationDelegate](self, "modalPresentationDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didDismissController:", self);

  }
}

- (void)replaceContentWithViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v9;
  void (**v10)(_QWORD);
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  void (**v21)(_QWORD);
  id v22;
  BOOL v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = (void (**)(_QWORD))a5;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[AMSUIWebContainerViewController containedViewController](self, "containedViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  if (v11 == v12)
  {
    if (v10)
      v10[2](v10);
  }
  else
  {
    objc_storeStrong((id *)&self->_containedViewController, a3);
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = objc_opt_class();
      -[AMSUIWebContainerViewController context](self, "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logKey");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v25 = v15;
      v26 = 2114;
      v27 = v17;
      v28 = 2114;
      v29 = v11;
      v30 = 2114;
      v31 = v12;
      _os_log_impl(&dword_211102000, v14, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Replacing fromVC with toVC (fromVC: %{public}@, toVC: %{public}@)", buf, 0x2Au);

    }
    objc_initWeak((id *)buf, self);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __88__AMSUIWebContainerViewController_replaceContentWithViewController_animated_completion___block_invoke;
    v18[3] = &unk_24CB50F48;
    objc_copyWeak(&v22, (id *)buf);
    v19 = v12;
    v20 = v11;
    v21 = v10;
    v23 = a4;
    -[AMSUIWebContainerViewController _prepareToMoveWebViewToVC:completion:](self, "_prepareToMoveWebViewToVC:completion:", v19, v18);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }

}

void __88__AMSUIWebContainerViewController_replaceContentWithViewController_animated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
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
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  char v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "ams_setChildViewController:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ams_setAlpha:", 0.0);

  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "OSLogObject");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = objc_opt_class();
    objc_msgSend(WeakRetained, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "logKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v33 = v16;
    v34 = 2114;
    v35 = v18;
    v36 = 2114;
    v37 = v19;
    _os_log_impl(&dword_211102000, v15, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] toVC.view added (toVC.view: %{public}@)", buf, 0x20u);

  }
  objc_msgSend(WeakRetained, "scrollPosition");
  if (v20 > 0.0)
  {
    v21 = objc_alloc_init(MEMORY[0x24BEBD790]);
    objc_msgSend(v21, "configureWithDefaultBackground");
    objc_msgSend(WeakRetained, "navigationItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setStandardAppearance:", v21);

    objc_msgSend(WeakRetained, "navigationItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setCompactAppearance:", v21);

    objc_msgSend(WeakRetained, "navigationItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setScrollEdgeAppearance:", v21);

  }
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __88__AMSUIWebContainerViewController_replaceContentWithViewController_animated_completion___block_invoke_21;
  v26[3] = &unk_24CB50F20;
  v25 = *(_QWORD *)(a1 + 32);
  v27 = *(id *)(a1 + 40);
  v28 = WeakRetained;
  v30 = *(id *)(a1 + 48);
  v29 = *(id *)(a1 + 32);
  v31 = *(_BYTE *)(a1 + 64);
  objc_msgSend(WeakRetained, "_adjustWebViewScrollFor:completion:", v25, v26);

}

void __88__AMSUIWebContainerViewController_replaceContentWithViewController_animated_completion___block_invoke_21(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void (**v5)(_QWORD);
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD);
  void *v12;
  _QWORD v13[5];
  id v14;
  char v15;
  _QWORD v16[4];
  id v17;
  _QWORD aBlock[4];
  id v19;
  uint64_t v20;
  id v21;

  v2 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__AMSUIWebContainerViewController_replaceContentWithViewController_animated_completion___block_invoke_2;
  aBlock[3] = &unk_24CB50C30;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v19 = v3;
  v20 = v4;
  v21 = *(id *)(a1 + 56);
  v5 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 40), "scrollPosition");
  if (v6 > 0.0)
  {
    objc_msgSend(*(id *)(a1 + 40), "setLastNavigationItem:", 0);
    objc_msgSend(*(id *)(a1 + 40), "_setupNavBarAnimated:", 0);
  }
  objc_msgSend(*(id *)(a1 + 48), "contentScrollViewForEdge:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentScrollView:forEdge:", v7, 1);

  if (*(_BYTE *)(a1 + 64))
  {
    v10 = (void *)MEMORY[0x24BEBDB00];
    v16[0] = v2;
    v16[1] = 3221225472;
    v16[2] = __88__AMSUIWebContainerViewController_replaceContentWithViewController_animated_completion___block_invoke_24;
    v16[3] = &unk_24CB4F0E8;
    v17 = *(id *)(a1 + 48);
    v13[0] = v2;
    v13[1] = 3221225472;
    v13[2] = __88__AMSUIWebContainerViewController_replaceContentWithViewController_animated_completion___block_invoke_2_25;
    v13[3] = &unk_24CB50EF8;
    v11 = v5;
    v13[4] = *(_QWORD *)(a1 + 40);
    v14 = v11;
    v15 = *(_BYTE *)(a1 + 64);
    objc_msgSend(v10, "animateWithDuration:delay:options:animations:completion:", 0, v16, v13, 0.2, 0.0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ams_setAlpha:", 1.0);

    v5[2](v5);
  }

}

uint64_t __88__AMSUIWebContainerViewController_replaceContentWithViewController_animated_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t result;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "ams_removeFromParentViewController");
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 40), "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v4;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_211102000, v3, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] fromVC removed", (uint8_t *)&v8, 0x16u);

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __88__AMSUIWebContainerViewController_replaceContentWithViewController_animated_completion___block_invoke_24(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __88__AMSUIWebContainerViewController_replaceContentWithViewController_animated_completion___block_invoke_2_25(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "contentWasReplacedAnimated:", *(unsigned __int8 *)(a1 + 48));
}

- (void)setupToolbarAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x24BDAC8D0];
  -[AMSUIWebContainerViewController containedViewController](self, "containedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toolbarItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = objc_opt_class();
    -[AMSUIWebContainerViewController context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v9;
    v20 = 2114;
    v21 = v11;
    v22 = 2114;
    v23 = v6;
    _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Setting Toolbar (items: %{public}@)", (uint8_t *)&v18, 0x20u);

  }
  -[AMSUIWebContainerViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", v6, v3);
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = objc_opt_class();
      -[AMSUIWebContainerViewController context](self, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v14;
      v20 = 2114;
      v21 = v16;
      _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Showing toolbar", (uint8_t *)&v18, 0x16u);

    }
    -[AMSUIWebContainerViewController navigationController](self, "navigationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setToolbarHidden:animated:", 0, v3);

  }
}

- (void)updateSafeAreaEdgesForPageModel:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v9;
  else
    v4 = 0;

  if (v4)
  {
    if (objc_msgSend(v4, "ignoreTopSafeArea"))
      v5 = 10;
    else
      v5 = 11;
    if (!objc_msgSend(v4, "ignoreBottomSafeArea"))
      v5 |= 4uLL;
    -[AMSUIWebContainerViewController context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "webPage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "edgesPropagatingSafeAreaInsetsToSubviews") != v5)
    {
      objc_msgSend(v8, "setEdgesPropagatingSafeAreaInsetsToSubviews:", v5);
      objc_msgSend(v8, "setFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    }

  }
}

- (void)didDismissController:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  AMSUIWebFlowOptions *v13;
  void *v14;
  id v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig", a3);
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
    v6 = (void *)objc_opt_class();
    v7 = v6;
    -[AMSUIWebContainerViewController context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v6;
    v18 = 2114;
    v19 = v9;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received container dismissal", (uint8_t *)&v16, 0x16u);

  }
  -[AMSUIWebContainerViewController containedViewController](self, "containedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[AMSUIWebContainerViewController containedViewController](self, "containedViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "willAppearAfterDismiss");

  }
  -[AMSUIWebContainerViewController setNextContainer:](self, "setNextContainer:", 0);
  v13 = objc_alloc_init(AMSUIWebFlowOptions);
  -[AMSUIWebContainerViewController pageInfo](self, "pageInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebFlowOptions setPageData:](v13, "setPageData:", v14);

  -[AMSUIWebFlowOptions setDeferredPresentation:](v13, "setDeferredPresentation:", -[AMSUIWebContainerViewController disableReappearPlaceholder](self, "disableReappearPlaceholder") != 0);
  -[AMSUIWebFlowOptions setReuseExistingPage:](v13, "setReuseExistingPage:", 1);
  -[AMSUIWebFlowOptions setAnimated:](v13, "setAnimated:", 1);
  v15 = -[AMSUIWebContainerViewController _refreshWithOptions:](self, "_refreshWithOptions:", v13);

}

- (void)_prepareToMoveWebViewToVC:(id)a3 completion:(id)a4
{
  void (**v5)(_QWORD);
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(_QWORD))a4;
  -[AMSUIWebContainerViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isToolbarHidden");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = objc_opt_class();
      -[AMSUIWebContainerViewController context](self, "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v10;
      v16 = 2114;
      v17 = v12;
      _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Hiding toolbar", (uint8_t *)&v14, 0x16u);

    }
    -[AMSUIWebContainerViewController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setToolbarHidden:animated:", 1, 1);

    -[AMSUIWebContainerViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", MEMORY[0x24BDBD1A8], 0);
  }
  v5[2](v5);

}

- (void)contentWasReplacedAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = objc_opt_class();
    -[AMSUIWebContainerViewController context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebContainerViewController containedViewController](self, "containedViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v7;
    v13 = 2114;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Content replaced (containedViewController: %{public}@)", (uint8_t *)&v11, 0x20u);

  }
  -[AMSUIWebContainerViewController setupToolbarAnimated:](self, "setupToolbarAnimated:", v3);
}

- (AMSUIWebPagePresenter)containedViewController
{
  return self->_containedViewController;
}

- (NSDictionary)pageMetrics
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x24BDBCE70]);
  -[AMSUIWebContainerViewController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebContainerViewController pageInfo](self, "pageInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("routeName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithObjectsAndKeys:", CFSTR("pageRender"), CFSTR("eventType"), v5, CFSTR("pageUrl"), v7, CFSTR("placement"), 0);

  return (NSDictionary *)v8;
}

- (void)setContainedViewController:(id)a3
{
  -[AMSUIWebContainerViewController replaceContentWithViewController:animated:completion:](self, "replaceContentWithViewController:animated:completion:", a3, 0, 0);
}

- (id)_actionBlockForWebButtonModel:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__AMSUIWebContainerViewController__actionBlockForWebButtonModel___block_invoke;
  v8[3] = &unk_24CB4F588;
  objc_copyWeak(&v10, &location);
  v5 = v4;
  v9 = v5;
  v6 = (void *)objc_msgSend(v8, "copy");

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

void __65__AMSUIWebContainerViewController__actionBlockForWebButtonModel___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      objc_msgSend(WeakRetained, "context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v7;
      v17 = 2114;
      v18 = v9;
      _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Navigation bar button selected", (uint8_t *)&v15, 0x16u);

    }
    v10 = (id)objc_msgSend(v3, "runAction");
  }
  else
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_opt_class();
      objc_msgSend(WeakRetained, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2114;
      v18 = v14;
      _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Navigation bar button selected with no action to run", (uint8_t *)&v15, 0x16u);

    }
  }

}

- (void)_adjustWebViewScrollFor:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  _QWORD v19[4];
  id v20;
  void (**v21)(_QWORD);

  v6 = (void (**)(_QWORD))a4;
  v7 = a3;
  -[AMSUIWebContainerViewController context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "webPage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[AMSUIWebContainerViewController context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "webPage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "webView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[AMSUIWebContainerViewController scrollPosition](self, "scrollPosition");
    v15 = v14;
    v17 = v16;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __70__AMSUIWebContainerViewController__adjustWebViewScrollFor_completion___block_invoke;
    v19[3] = &unk_24CB4F3C0;
    v20 = v13;
    v21 = v6;
    v18 = v13;
    -[AMSUIWebContainerViewController _scrollTo:webView:completion:](self, "_scrollTo:webView:completion:", v18, v19, v15, v17);

  }
  else
  {
    v6[2](v6);
  }

}

void __70__AMSUIWebContainerViewController__adjustWebViewScrollFor_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "underlyingWebView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __70__AMSUIWebContainerViewController__adjustWebViewScrollFor_completion___block_invoke_2;
  v3[3] = &unk_24CB50F70;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_doAfterNextStablePresentationUpdate:", v3);

}

uint64_t __70__AMSUIWebContainerViewController__adjustWebViewScrollFor_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_applyAppearance
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[AMSUIWebContainerViewController appearance](self, "appearance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[AMSUIWebAppearance defaultPlatformBackgroundColor](AMSUIWebAppearance, "defaultPlatformBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "backgroundColor");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (void *)v4;
  else
    v6 = v3;
  -[AMSUICommonViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_setBackgroundColor:", v6);

}

- (id)_buttonModelForBarButtonItemModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  BOOL v15;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "buttonModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = -[AMSUIWebContainerViewController activePresentationType](self, "activePresentationType");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v4, "conditionalButtonModels", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v14, "hideOnPush"))
            v15 = v8 == 2;
          else
            v15 = 0;
          if (!v15 && (!objc_msgSend(v14, "hideOnModal") || v8 != 1))
          {
            objc_msgSend(v14, "button");
            v7 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_20;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    v7 = 0;
  }
LABEL_20:

  return v7;
}

- (id)_createBarButtonItemWithModel:(id)a3 navigationBarModel:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[AMSUIWebContainerViewController _buttonModelForBarButtonItemModel:](self, "_buttonModelForBarButtonItemModel:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BEBD410];
  if (v8)
  {
    -[AMSUIWebContainerViewController _actionBlockForWebButtonModel:](self, "_actionBlockForWebButtonModel:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "barButtonItemWithWebButtonModel:navigationBarModel:actionBlock:", v8, v7, v10);
  }
  else
  {
    objc_msgSend(v6, "appViewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "barButtonItemWithWebAppViewModel:", v10);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)_determineActivePresentationType
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;

  -[UIViewController ams_navigationItemViewController](self, "ams_navigationItemViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController ams_navigationController](self, "ams_navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    v7 = 1;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        if (v8 == v3)
          break;
      }
      if (++v6 >= (unint64_t)objc_msgSend(v5, "count"))
        goto LABEL_9;
    }
    v7 = 2;
  }
  else
  {
    v7 = 1;
  }
LABEL_9:

  return v7;
}

- (void)_handlePushDismissal
{
  id v3;

  -[AMSUIWebContainerViewController pushPresentationDelegate](self, "pushPresentationDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didDismissController:", self);

}

- (id)_makeCustomNavigationBarAppearanceWithModel:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BEBD790]);
  v5 = objc_msgSend(v3, "backgroundStyle");
  if (v5 == 2)
  {
    objc_msgSend(v4, "configureWithTransparentBackground");
  }
  else if (v5 == 1)
  {
    objc_msgSend(v4, "configureWithOpaqueBackground");
  }
  else
  {
    objc_msgSend(v4, "configureWithDefaultBackground");
  }
  v6 = (void *)MEMORY[0x24BEBD4B8];
  objc_msgSend(v3, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_colorFromHexString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v8);

  return v4;
}

- (void)_postEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AMSUIWebContainerViewController *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AMSUIWebContainerViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flowController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentContainer");
  v7 = (AMSUIWebContainerViewController *)objc_claimAutoreleasedReturnValue();

  if (v7 == self)
  {
    v15 = CFSTR("pageData");
    -[AMSUIWebContainerViewController pageInfo](self, "pageInfo");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = MEMORY[0x24BDBD1B8];
    if (v8)
      v10 = v8;
    v16[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[AMSUIWebContainerViewController context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dataProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "postEvent:options:", v4, v11);

  }
}

- (void)_refreshForInitialAppear
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  AMSUIWebFlowOptions *v8;
  void *v9;
  id v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!-[AMSUIWebContainerViewController didAppearOnce](self, "didAppearOnce")
    && !-[AMSUIWebContainerViewController shouldSkipInitialRefresh](self, "shouldSkipInitialRefresh"))
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
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
      -[AMSUIWebContainerViewController context](self, "context");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v5;
      v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_211102000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Refreshing for initial appearance", (uint8_t *)&v11, 0x16u);

    }
    v8 = objc_alloc_init(AMSUIWebFlowOptions);
    -[AMSUIWebContainerViewController pageInfo](self, "pageInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebFlowOptions setPageData:](v8, "setPageData:", v9);

    -[AMSUIWebFlowOptions setAnimated:](v8, "setAnimated:", 1);
    v10 = -[AMSUIWebContainerViewController _refreshWithOptions:](self, "_refreshWithOptions:", v8);

  }
}

- (id)_refreshWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AMSUIWebContainerViewController activeRefresh](self, "activeRefresh");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
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
      -[AMSUIWebContainerViewController context](self, "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v8;
      v19 = 2114;
      v20 = v10;
      _os_log_impl(&dword_211102000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Deduping refresh call", buf, 0x16u);

    }
    -[AMSUIWebContainerViewController activeRefresh](self, "activeRefresh");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AMSUIWebContainerViewController context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "flowController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "refreshPageForContainer:options:", self, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)buf, self);
    -[AMSUIWebContainerViewController setActiveRefresh:](self, "setActiveRefresh:", v11);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __55__AMSUIWebContainerViewController__refreshWithOptions___block_invoke;
    v15[3] = &unk_24CB50528;
    objc_copyWeak(&v16, (id *)buf);
    objc_msgSend(v11, "addFinishBlock:", v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }

  return v11;
}

void __55__AMSUIWebContainerViewController__refreshWithOptions___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setActiveRefresh:", 0);

}

- (void)_scrollTo:(CGPoint)a3 webView:(id)a4 completion:(id)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[2];
  _QWORD v18[3];

  y = a3.y;
  x = a3.x;
  v18[2] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  objc_msgSend(a4, "underlyingWebView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = CFSTR("scrollX");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", x);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("scrollY");
  v18[0] = v10;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFA8D0], "defaultClientWorld");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __64__AMSUIWebContainerViewController__scrollTo_webView_completion___block_invoke;
  v15[3] = &unk_24CB50F98;
  v16 = v8;
  v14 = v8;
  objc_msgSend(v9, "callAsyncJavaScript:arguments:inFrame:inContentWorld:completionHandler:", CFSTR("return new Promise( (resolve, reject) => {    window.requestAnimationFrame(() => {        window.scrollTo(scrollX, scrollY);        window.requestAnimationFrame(() => {            setTimeout(() => {                resolve();            }, 0);        });    });});"),
    v12,
    0,
    v13,
    v15);

}

uint64_t __64__AMSUIWebContainerViewController__scrollTo_webView_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_setupNavBarAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[AMSUIWebContainerViewController navigationBarModel](self, "navigationBarModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    -[UIViewController ams_navigationController](self, "ams_navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      -[AMSUIWebContainerViewController applyNavigationBarModel:toNavigationController:animated:](self, "applyNavigationBarModel:toNavigationController:animated:", v7, v6, v3);

    v5 = v7;
  }

}

- (void)applyNavigationBarModel:(id)a3 toNavigationController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  int64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v5 = a5;
  v33 = a3;
  -[AMSUIWebContainerViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidesBackButton:", objc_msgSend(v33, "hidesBackButton"));
  objc_msgSend(v33, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v8);

  objc_msgSend(v33, "leftBarButtonItemModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebContainerViewController _createBarButtonItemWithModel:navigationBarModel:](self, "_createBarButtonItemWithModel:navigationBarModel:", v9, v33);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("left_bar_button_item"));
  objc_msgSend(v7, "setLeftBarButtonItem:", v10);
  objc_msgSend(v33, "rightBarButtonItemModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebContainerViewController _createBarButtonItemWithModel:navigationBarModel:](self, "_createBarButtonItemWithModel:navigationBarModel:", v11, v33);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("right_bar_button_item"));
  objc_msgSend(v7, "setRightBarButtonItem:", v12);
  v13 = objc_msgSend(v33, "hidesBackButton") ^ 1;
  -[UIViewController ams_navigationController](self, "ams_navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "interactivePopGestureRecognizer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEnabled:", v13);

  objc_msgSend(v33, "backButtonTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = objc_alloc_init(MEMORY[0x24BEBD410]);
    objc_msgSend(v33, "backButtonTitle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTitle:", v18);

    objc_msgSend(v7, "setBackBarButtonItem:", v17);
  }
  else
  {
    objc_msgSend(v7, "setBackBarButtonItem:", 0);
  }
  objc_msgSend(v7, "_setManualScrollEdgeAppearanceEnabled:", 0);
  -[UIViewController ams_navigationController](self, "ams_navigationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setNavigationBarHidden:animated:", objc_msgSend(v33, "style") == 1, v5);

  v20 = objc_msgSend(v33, "style") == 3;
  -[UIViewController ams_navigationController](self, "ams_navigationController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "navigationBar");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPrefersLargeTitles:", v20);

  v23 = -[AMSUIWebContainerViewController lastNavigationStyle](self, "lastNavigationStyle");
  if (v23 != objc_msgSend(v33, "style")
    || (-[AMSUIWebContainerViewController lastNavigationItem](self, "lastNavigationItem"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        v24,
        v24 != v7))
  {
    -[AMSUIWebContainerViewController setLastNavigationStyle:](self, "setLastNavigationStyle:", objc_msgSend(v33, "style"));
    -[AMSUIWebContainerViewController setLastNavigationItem:](self, "setLastNavigationItem:", v7);
    switch(objc_msgSend(v33, "style"))
    {
      case 0:
      case 1:
        break;
      case 2:
      case 3:
        v25 = objc_alloc_init(MEMORY[0x24BEBD790]);
        objc_msgSend(v25, "configureWithDefaultBackground");
        objc_msgSend(v7, "setStandardAppearance:", v25);
        objc_msgSend(v7, "setCompactAppearance:", v25);
        objc_msgSend(v7, "setScrollEdgeAppearance:", v25);
        goto LABEL_14;
      case 5:
        v25 = objc_alloc_init(MEMORY[0x24BEBD790]);
        objc_msgSend(v25, "configureWithTransparentBackground");
        goto LABEL_13;
      case 6:
        v25 = objc_alloc_init(MEMORY[0x24BEBD790]);
        objc_msgSend(v25, "configureWithTransparentBackground");
        objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "colorWithAlphaComponent:", 0.96);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setBackgroundColor:", v27);

LABEL_13:
        objc_msgSend(v7, "setScrollEdgeAppearance:", v25);
        objc_msgSend(v7, "setStandardAppearance:", v25);
        objc_msgSend(v7, "setCompactAppearance:", v25);
        goto LABEL_14;
      case 7:
        v28 = (void *)MEMORY[0x24BEBD640];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/AppleMediaServicesUI.framework"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("navigation-back-button"), v29, 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewController ams_navigationController](self, "ams_navigationController");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "navigationBar");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setBackIndicatorImage:", v30);

        goto LABEL_10;
      case 8:
        -[AMSUIWebContainerViewController _makeCustomNavigationBarAppearanceWithModel:](self, "_makeCustomNavigationBarAppearanceWithModel:", v33);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setCompactAppearance:", v25);
        objc_msgSend(v7, "setScrollEdgeAppearance:", v25);
        objc_msgSend(v7, "setStandardAppearance:", v25);
LABEL_14:

        break;
      default:
LABEL_10:
        objc_msgSend(v7, "setScrollEdgeAppearance:", 0);
        objc_msgSend(v7, "setStandardAppearance:", 0);
        objc_msgSend(v7, "setCompactAppearance:", 0);
        break;
    }
  }

}

- (unint64_t)activePresentationType
{
  return self->_activePresentationType;
}

- (AMSUIWebAppearance)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_appearance, a3);
}

- (int64_t)containerIndex
{
  return self->_containerIndex;
}

- (void)setContainerIndex:(int64_t)a3
{
  self->_containerIndex = a3;
}

- (int64_t)disableReappearPlaceholder
{
  return self->_disableReappearPlaceholder;
}

- (void)setDisableReappearPlaceholder:(int64_t)a3
{
  self->_disableReappearPlaceholder = a3;
}

- (AMSUIWebPresentationDelegate)modalPresentationDelegate
{
  return (AMSUIWebPresentationDelegate *)objc_loadWeakRetained((id *)&self->_modalPresentationDelegate);
}

- (void)setModalPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_modalPresentationDelegate, a3);
}

- (AMSUIWebContainerViewController)nextContainer
{
  return (AMSUIWebContainerViewController *)objc_loadWeakRetained((id *)&self->_nextContainer);
}

- (void)setNextContainer:(id)a3
{
  objc_storeWeak((id *)&self->_nextContainer, a3);
}

- (NSDictionary)pageInfo
{
  return self->_pageInfo;
}

- (void)setPageInfo:(id)a3
{
  objc_storeStrong((id *)&self->_pageInfo, a3);
}

- (AMSPageRenderMetricsPresenter)pageRenderPresenter
{
  return self->_pageRenderPresenter;
}

- (void)setPageRenderPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_pageRenderPresenter, a3);
}

- (AMSUIWebPresentationDelegate)pushPresentationDelegate
{
  return (AMSUIWebPresentationDelegate *)objc_loadWeakRetained((id *)&self->_pushPresentationDelegate);
}

- (void)setPushPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pushPresentationDelegate, a3);
}

- (BOOL)shouldSkipInitialRefresh
{
  return self->_shouldSkipInitialRefresh;
}

- (void)setShouldSkipInitialRefresh:(BOOL)a3
{
  self->_shouldSkipInitialRefresh = a3;
}

- (AMSBinaryPromise)activeRefresh
{
  return self->_activeRefresh;
}

- (void)setActiveRefresh:(id)a3
{
  objc_storeStrong((id *)&self->_activeRefresh, a3);
}

- (AMSUIWebClientContext)context
{
  return (AMSUIWebClientContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)setContext:(id)a3
{
  objc_storeWeak((id *)&self->_context, a3);
}

- (BOOL)didAppearOnce
{
  return self->_didAppearOnce;
}

- (void)setDidAppearOnce:(BOOL)a3
{
  self->_didAppearOnce = a3;
}

- (BOOL)dismissCalled
{
  return self->_dismissCalled;
}

- (void)setDismissCalled:(BOOL)a3
{
  self->_dismissCalled = a3;
}

- (BOOL)isAppearing
{
  return self->_isAppearing;
}

- (void)setIsAppearing:(BOOL)a3
{
  self->_isAppearing = a3;
}

- (UIViewController)hiddenViewController
{
  return self->_hiddenViewController;
}

- (void)setHiddenViewController:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenViewController, a3);
}

- (UINavigationItem)lastNavigationItem
{
  return (UINavigationItem *)objc_loadWeakRetained((id *)&self->_lastNavigationItem);
}

- (void)setLastNavigationItem:(id)a3
{
  objc_storeWeak((id *)&self->_lastNavigationItem, a3);
}

- (int64_t)lastNavigationStyle
{
  return self->_lastNavigationStyle;
}

- (void)setLastNavigationStyle:(int64_t)a3
{
  self->_lastNavigationStyle = a3;
}

- (AMSUIWebNavigationBarModel)navigationBarModel
{
  return self->_navigationBarModel;
}

- (void)setNavigationBarModel:(id)a3
{
  objc_storeStrong((id *)&self->_navigationBarModel, a3);
}

- (CGPoint)scrollPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_scrollPosition.x;
  y = self->_scrollPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setScrollPosition:(CGPoint)a3
{
  self->_scrollPosition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationBarModel, 0);
  objc_destroyWeak((id *)&self->_lastNavigationItem);
  objc_storeStrong((id *)&self->_hiddenViewController, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_activeRefresh, 0);
  objc_destroyWeak((id *)&self->_pushPresentationDelegate);
  objc_storeStrong((id *)&self->_pageRenderPresenter, 0);
  objc_storeStrong((id *)&self->_pageInfo, 0);
  objc_destroyWeak((id *)&self->_nextContainer);
  objc_destroyWeak((id *)&self->_modalPresentationDelegate);
  objc_storeStrong((id *)&self->_appearance, 0);
  objc_storeStrong((id *)&self->_containedViewController, 0);
}

@end

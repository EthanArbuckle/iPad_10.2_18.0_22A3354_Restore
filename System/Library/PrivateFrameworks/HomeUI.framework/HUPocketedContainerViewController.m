@implementation HUPocketedContainerViewController

- (HUPocketedContainerViewController)initWithContentViewController:(id)a3 pocketViewController:(id)a4
{
  id v8;
  id v9;
  HUPocketedContainerViewController *v10;
  HUPocketedContainerViewController *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPocketedContainerViewController.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentViewController"));

  }
  v14.receiver = self;
  v14.super_class = (Class)HUPocketedContainerViewController;
  v10 = -[HUPocketedContainerViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_contentViewController, a3);
    objc_storeStrong((id *)&v11->_pocketViewController, a4);
  }

  return v11;
}

- (HUPocketedContainerViewController)initWithContentViewController:(id)a3
{
  return -[HUPocketedContainerViewController initWithContentViewController:pocketViewController:](self, "initWithContentViewController:pocketViewController:", a3, 0);
}

- (HUPocketedContainerViewController)initWithCoder:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithContentViewController_pocketViewController_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPocketedContainerViewController.m"), 37, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUPocketedContainerViewController initWithCoder:]",
    v6);

  return 0;
}

- (HUPocketedContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithContentViewController_pocketViewController_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPocketedContainerViewController.m"), 42, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUPocketedContainerViewController initWithNibName:bundle:]",
    v7);

  return 0;
}

- (void)viewDidLoad
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUPocketedContainerViewController;
  -[HUPocketedContainerViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[HUPocketedContainerViewController _installContentViewController](self, "_installContentViewController");
  v3 = -[HUPocketedContainerViewController _installPocket](self, "_installPocket");
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUPocketedContainerViewController;
  -[HUPocketedContainerViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  v4 = -[HUPocketedContainerViewController _installPocket](self, "_installPocket");
}

- (CGSize)preferredContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[HUPocketedContainerViewController contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  -[HUPocketedContainerViewController contentViewController](self, "contentViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredContentSize:", width, height);

}

- (void)setPocketViewController:(id)a3
{
  UIViewController *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[4];
  UIViewController *v11;
  id v12;
  id location;

  v4 = (UIViewController *)a3;
  if (self->_pocketViewController != v4)
  {
    objc_initWeak(&location, self);
    -[HUPocketedContainerViewController _tearDownPocket](self, "_tearDownPocket");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__HUPocketedContainerViewController_setPocketViewController___block_invoke;
    v10[3] = &unk_1E6F54D78;
    objc_copyWeak(&v12, &location);
    v11 = v4;
    objc_msgSend(v5, "flatMap:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __61__HUPocketedContainerViewController_setPocketViewController___block_invoke_2;
    v9[3] = &unk_1E6F514A0;
    v9[4] = self;
    v8 = (id)objc_msgSend(v7, "flatMap:", v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

id __61__HUPocketedContainerViewController_setPocketViewController___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
    objc_storeStrong(WeakRetained + 122, *(id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __61__HUPocketedContainerViewController_setPocketViewController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_installPocket");
}

- (id)hu_preloadContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  -[HUPocketedContainerViewController contentViewController](self, "contentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v4);

  -[HUPocketedContainerViewController pocketViewController](self, "pocketViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v5);

  objc_msgSend(v3, "na_map:", &__block_literal_global_183);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "flatMap:", &__block_literal_global_62);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

id __54__HUPocketedContainerViewController_hu_preloadContent__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EF230988))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v4, "hu_preloadContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __54__HUPocketedContainerViewController_hu_preloadContent__block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (id)_installPocket
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
  double v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  HUPocketedContainerViewController *v46;
  _QWORD v47[6];

  v47[4] = *MEMORY[0x1E0C80C00];
  -[HUPocketedContainerViewController pocketViewController](self, "pocketViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUPocketedContainerViewController pocketViewController](self, "pocketViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPocketedContainerViewController addChildViewController:](self, "addChildViewController:", v4);

    -[HUPocketedContainerViewController pocketViewController](self, "pocketViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUPocketedContainerViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v6);

    v34 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v6, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPocketedContainerViewController view](self, "view");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "safeAreaLayoutGuide");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v37;
    objc_msgSend(v6, "leftAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPocketedContainerViewController view](self, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "leftAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v32;
    objc_msgSend(v6, "rightAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPocketedContainerViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rightAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v11;
    objc_msgSend(v6, "heightAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPocketedContainerViewController pocketViewController](self, "pocketViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferredContentSize");
    objc_msgSend(v12, "constraintEqualToConstant:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "activateConstraints:", v16);

    v17 = objc_alloc(MEMORY[0x1E0CEABE8]);
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithEffect:", v18);

    objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUPocketedContainerViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "insertSubview:belowSubview:", v19, v6);

    v21 = (void *)MEMORY[0x1E0CB3718];
    v22 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __51__HUPocketedContainerViewController__installPocket__block_invoke;
    v44[3] = &unk_1E6F59D18;
    v23 = v19;
    v45 = v23;
    v46 = self;
    __51__HUPocketedContainerViewController__installPocket__block_invoke((uint64_t)v44);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activateConstraints:", v24);

    -[HUPocketedContainerViewController setPocketBackgroundView:](self, "setPocketBackgroundView:", v23);
    -[HUPocketedContainerViewController pocketViewController](self, "pocketViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = &unk_1EF230988;
    if (objc_msgSend(v25, "conformsToProtocol:", v26))
      v27 = v25;
    else
      v27 = 0;
    v28 = v27;

    v29 = (void *)MEMORY[0x1E0D519C0];
    if (v28)
    {
      v42[0] = v22;
      v42[1] = 3221225472;
      v42[2] = __51__HUPocketedContainerViewController__installPocket__block_invoke_2;
      v42[3] = &unk_1E6F4C660;
      v43 = v28;
      objc_msgSend(v29, "lazyFutureWithBlock:", v42);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v30;
}

id __51__HUPocketedContainerViewController__installPocket__block_invoke(uint64_t a1)
{
  void *v2;
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

  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "leadingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v6);

  objc_msgSend(*(id *)(a1 + 32), "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v10);

  objc_msgSend(*(id *)(a1 + 32), "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v14);

  objc_msgSend(*(id *)(a1 + 32), "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "pocketViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v19);

  return v2;
}

void __51__HUPocketedContainerViewController__installPocket__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "hu_preloadContent");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "completionHandlerAdapter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (id)objc_msgSend(v6, "addCompletionBlock:", v4);
}

- (id)_tearDownPocket
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIViewController *pocketViewController;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  -[HUPocketedContainerViewController pocketViewController](self, "pocketViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUPocketedContainerViewController pocketViewController](self, "pocketViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "willMoveToParentViewController:", 0);

    -[HUPocketedContainerViewController pocketViewController](self, "pocketViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[HUPocketedContainerViewController pocketViewController](self, "pocketViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromParentViewController");

    pocketViewController = self->_pocketViewController;
    self->_pocketViewController = 0;

    -[HUPocketedContainerViewController contentViewController](self, "contentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v10 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (v12)
    {
      objc_msgSend(v12, "tableView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setContentInset:", 0.0, 0.0, 0.0, 0.0);

    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v14;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HUPocketedContainerViewController;
  -[HUPocketedContainerViewController viewDidLayoutSubviews](&v11, sel_viewDidLayoutSubviews);
  -[HUPocketedContainerViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    -[HUPocketedContainerViewController pocketBackgroundView](self, "pocketBackgroundView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v8 + 10.0;
    objc_msgSend(v6, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setContentInset:", 0.0, 0.0, v9, 0.0);

  }
}

- (void)_installContentViewController
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
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  if (-[HUPocketedContainerViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[HUPocketedContainerViewController contentViewController](self, "contentViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPocketedContainerViewController addChildViewController:](self, "addChildViewController:", v3);

    -[HUPocketedContainerViewController contentViewController](self, "contentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUPocketedContainerViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v5);

    v18 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v5, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPocketedContainerViewController view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v22;
    objc_msgSend(v5, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPocketedContainerViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v17;
    objc_msgSend(v5, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPocketedContainerViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v9;
    objc_msgSend(v5, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPocketedContainerViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activateConstraints:", v14);

    -[HUPocketedContainerViewController contentViewController](self, "contentViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "didMoveToParentViewController:", self);

  }
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (UIViewController)pocketViewController
{
  return self->_pocketViewController;
}

- (UIVisualEffectView)pocketBackgroundView
{
  return self->_pocketBackgroundView;
}

- (void)setPocketBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_pocketBackgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pocketBackgroundView, 0);
  objc_storeStrong((id *)&self->_pocketViewController, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end

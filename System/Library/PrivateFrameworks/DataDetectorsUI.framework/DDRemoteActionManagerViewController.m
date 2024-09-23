@implementation DDRemoteActionManagerViewController

- (void)dealloc
{
  objc_super v3;

  -[DDRemoteActionManagerViewController unloadRemoteAction](self, "unloadRemoteAction");
  v3.receiver = self;
  v3.super_class = (Class)DDRemoteActionManagerViewController;
  -[DDRemoteActionManagerViewController dealloc](&v3, sel_dealloc);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  self->_shouldDeferPresenting = 1;
  v3.receiver = self;
  v3.super_class = (Class)DDRemoteActionManagerViewController;
  -[DDRemoteActionManagerViewController viewWillDisappear:](&v3, sel_viewWillDisappear_, a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  double width;
  _BOOL8 v4;
  CGSize *p_preferredContentSize;
  objc_super v7;

  v4 = a3;
  self->_shouldDeferPresenting = 0;
  p_preferredContentSize = &self->_preferredContentSize;
  if (self->_preferredContentSize.height != 0.0)
  {
    width = p_preferredContentSize->width;
    if (p_preferredContentSize->width != 0.0)
      -[DDRemoteActionManagerViewController setPreferredContentSize:](self, "setPreferredContentSize:", width);
  }
  -[DDRemoteActionManagerViewController showRemoteController](self, "showRemoteController", width);
  v7.receiver = self;
  v7.super_class = (Class)DDRemoteActionManagerViewController;
  -[DDRemoteActionManagerViewController viewWillAppear:](&v7, sel_viewWillAppear_, v4);
}

- (DDRemoteActionManagerViewController)initWithAction:(id)a3
{
  id v4;
  DDRemoteActionManagerViewController *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *platterTitle;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  dispatch_time_t v13;
  DDRemoteActionManagerViewController *v14;
  DDRemoteActionManagerViewController *v15;
  _QWORD block[4];
  DDRemoteActionManagerViewController *v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DDRemoteActionManagerViewController;
  v5 = -[DDRemoteActionManagerViewController init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDRemoteActionManagerViewController view](v5, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);

    -[DDRemoteActionManagerViewController setAction:](v5, "setAction:", v4);
    objc_msgSend(v4, "platterTitle");
    v8 = objc_claimAutoreleasedReturnValue();
    platterTitle = v5->_platterTitle;
    v5->_platterTitle = (NSString *)v8;

    -[DDRemoteActionManagerViewController action](v5, "action");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "suggestedContentSize");
    v5->_preferredContentSize.width = v11;
    v5->_preferredContentSize.height = v12;

    -[DDRemoteActionManagerViewController loadNavigationControllerIfNeeded](v5, "loadNavigationControllerIfNeeded");
    -[DDRemoteActionManagerViewController addHitOverlay](v5, "addHitOverlay");
    -[DDRemoteActionManagerViewController loadTitleBarIfNeeded](v5, "loadTitleBarIfNeeded");
    -[DDRemoteActionManagerViewController loadRemoteAction](v5, "loadRemoteAction");
    v5->_previewMode = 1;
    -[DDRemoteActionManagerViewController updatePreviewMode](v5, "updatePreviewMode");
    v5->_loaded = 0;
    v13 = dispatch_time(0, 400000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__DDRemoteActionManagerViewController_initWithAction___block_invoke;
    block[3] = &unk_1E42580C8;
    v14 = v5;
    v18 = v14;
    dispatch_after(v13, MEMORY[0x1E0C80D38], block);
    v15 = v14;

  }
  return v5;
}

uint64_t __54__DDRemoteActionManagerViewController_initWithAction___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(result + 1048) && !*(_QWORD *)(result + 992))
    return objc_msgSend((id)result, "showLoadingView");
  return result;
}

- (id)doneButton
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_dismissViewController);
}

- (id)emptyViewcontroller
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setTitle:", self->_platterTitle);
  -[DDRemoteActionManagerViewController doneButton](self, "doneButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v4);

  return v3;
}

- (void)loadNavigationControllerIfNeeded
{
  void *v3;
  int v4;
  id v5;
  void *v6;
  UINavigationController *v7;
  UINavigationController *navigationController;
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
  NSLayoutConstraint *v21;
  NSLayoutConstraint *navControllerTopConstraint;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  -[DDRemoteActionManagerViewController action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wantsSeamlessCommit");

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CEA7B8]);
    -[DDRemoteActionManagerViewController emptyViewcontroller](self, "emptyViewcontroller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UINavigationController *)objc_msgSend(v5, "initWithRootViewController:", v6);
    navigationController = self->_navigationController;
    self->_navigationController = v7;

    -[UINavigationController view](self->_navigationController, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[DDRemoteActionManagerViewController addChildViewController:](self, "addChildViewController:", self->_navigationController);
    -[DDRemoteActionManagerViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController view](self->_navigationController, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v11);

    -[DDRemoteActionManagerViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3718];
    v28 = CFSTR("nc");
    -[UINavigationController view](self->_navigationController, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[nc]|"), 0, 0, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addConstraints:", v16);

    -[UINavigationController view](self->_navigationController, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDRemoteActionManagerViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v20);
    v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    navControllerTopConstraint = self->_navControllerTopConstraint;
    self->_navControllerTopConstraint = v21;

    -[UINavigationController view](self->_navigationController, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDRemoteActionManagerViewController view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setActive:", 1);

  }
}

- (void)dismissViewController
{
  DDRemoteActionManagerViewController *strongSelf;

  -[DDRemoteActionManagerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  strongSelf = self->_strongSelf;
  self->_strongSelf = 0;

}

- (void)loadTitleBarIfNeeded
{
  void *v3;
  UIView *titleBar;
  UIView *v5;
  UIView *v6;
  void *v7;
  void *v8;
  void *v9;
  UIView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIView *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  UIView *v20;
  void *v21;
  void *v22;
  void *v23;
  UIView *v24;
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
  id v37;
  const __CFString *v38;
  id v39;
  const __CFString *v40;
  id v41;
  const __CFString *v42;
  UIView *v43;
  const __CFString *v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  -[DDRemoteActionManagerViewController action](self, "action");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "platterTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    titleBar = self->_titleBar;

    if (!titleBar)
    {
      v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
      v6 = self->_titleBar;
      self->_titleBar = v5;

      -[DDRemoteActionManagerViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", self->_titleBar);

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_titleBar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[DDRemoteActionManagerViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0CB3718];
      v10 = self->_titleBar;
      v44 = CFSTR("bar");
      v45[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[bar]|"), 0, 0, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addConstraints:", v12);

      -[DDRemoteActionManagerViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB3718];
      v15 = self->_titleBar;
      v42 = CFSTR("bar");
      v43 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[bar(46)]"), 0, 0, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addConstraints:", v17);

      objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_titleBar, "setBackgroundColor:", v18);

      v19 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
      -[UIView addSubview:](self->_titleBar, "addSubview:", v19);
      objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v20 = self->_titleBar;
      v21 = (void *)MEMORY[0x1E0CB3718];
      v40 = CFSTR("line");
      v41 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[line]|"), 0, 0, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addConstraints:](v20, "addConstraints:", v23);

      v24 = self->_titleBar;
      v25 = (void *)MEMORY[0x1E0CB3718];
      v38 = CFSTR("line");
      v39 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[line(1)]|"), 0, 0, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addConstraints:](v24, "addConstraints:", v27);

      objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setBackgroundColor:", v28);

      v29 = (void *)objc_opt_new();
      -[UIView addSubview:](self->_titleBar, "addSubview:", v29);
      objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v29, 9, 0, self->_titleBar, 9, 1.0, 0.0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setActive:", 1);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v29, 7, 0, self->_titleBar, 7, 1.0, -10.0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setActive:", 1);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v29, 10, 0, self->_titleBar, 10, 1.0, 0.0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setActive:", 1);

      objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 16.0, *MEMORY[0x1E0CEB5F8]);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setFont:", v33);

      objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setTextColor:", v34);

      objc_msgSend(v29, "setTextAlignment:", 1);
      objc_msgSend(v29, "setLineBreakMode:", 4);
      -[DDRemoteActionManagerViewController action](self, "action");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "platterTitle");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setText:", v36);

    }
  }
  else
  {

  }
}

- (void)loadRemoteAction
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_fault_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Fail to get DataDetectorsUI ActionsExtension (error %@)", (uint8_t *)&v1, 0xCu);
}

void __55__DDRemoteActionManagerViewController_loadRemoteAction__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *WeakRetained;
  id *v11;
  id v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v11 = WeakRetained;
  if (v9 || !WeakRetained)
  {
    objc_msgSend(WeakRetained, "showErrorView");
  }
  else
  {
    objc_msgSend(WeakRetained, "setRequest:", v7);
    objc_msgSend(v11, "setExtension:", *(_QWORD *)(a1 + 32));
    v12 = v8;
    objc_storeStrong(v11 + 121, a3);
    objc_msgSend(v12, "setDelegate:", v11);
    objc_msgSend(*(id *)(a1 + 32), "_extensionContextForUUID:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v11 + 122, v13);
    objc_msgSend(v13, "enableUserInteraction:", objc_msgSend(v11, "previewMode") ^ 1);
    v14 = *(_QWORD *)(a1 + 40);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __55__DDRemoteActionManagerViewController_loadRemoteAction__block_invoke_2;
    v15[3] = &unk_1E42580F0;
    objc_copyWeak(&v16, (id *)(a1 + 48));
    objc_msgSend(v13, "prepareViewControllerWithContext:completionHandler:", v14, v15);
    objc_destroyWeak(&v16);

  }
}

void __55__DDRemoteActionManagerViewController_loadRemoteAction__block_invoke_2(uint64_t a1, int a2, double a3, double a4)
{
  id WeakRetained;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (a2 && WeakRetained)
  {
    *((_BYTE *)WeakRetained + 1048) = 1;
    *((double *)WeakRetained + 133) = a3;
    *((double *)WeakRetained + 134) = a4;
    objc_msgSend(WeakRetained, "setPreferredContentSize:", a3, a4);
    objc_msgSend(v8, "showRemoteController");
  }
  else
  {
    objc_msgSend(WeakRetained, "showErrorView");
  }

}

- (void)showRemoteController
{
  void *navigationController;
  id v4;

  if (self->_loaded && !self->_displayed && !self->_shouldDeferPresenting)
  {
    self->_displayed = 1;
    -[DDRemoteActionManagerViewController updatePreviewMode](self, "updatePreviewMode");
    navigationController = self->_navigationController;
    if (!navigationController)
      navigationController = self->_remoteViewController;
    objc_msgSend(navigationController, "view");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[DDRemoteActionManagerViewController removeLoadingViewToShowView:](self, "removeLoadingViewToShowView:", v4);

  }
}

- (void)presentRemoteViewController
{
  void *v3;
  void *v4;
  UINavigationController *navigationController;
  void *v6;
  NSLayoutConstraint *titleBarBottomConstraint;
  void *v8;
  void *v9;
  void *v10;
  NSLayoutConstraint *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UIView *titleBar;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[2];
  const __CFString *v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  if (self->_navigationController)
  {
    -[DDRemoteActionManagerViewController doneButton](self, "doneButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDRemoteActionHostViewController navigationItem](self->_remoteViewController, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRightBarButtonItem:", v3);

    -[DDRemoteActionHostViewController setTitle:](self->_remoteViewController, "setTitle:", self->_platterTitle);
    navigationController = self->_navigationController;
    v30[0] = self->_remoteViewController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController setViewControllers:](navigationController, "setViewControllers:", v6);

    if (!self->_titleBar)
      return;
    titleBarBottomConstraint = self->_titleBarBottomConstraint;
    if (titleBarBottomConstraint)
      -[NSLayoutConstraint setActive:](titleBarBottomConstraint, "setActive:", 0);
    -[UINavigationController view](self->_navigationController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_titleBar, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v12 = self->_titleBarBottomConstraint;
    self->_titleBarBottomConstraint = v11;
  }
  else
  {
    -[DDRemoteActionManagerViewController addChildViewController:](self, "addChildViewController:", self->_remoteViewController);
    -[DDRemoteActionManagerViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDRemoteActionHostViewController view](self->_remoteViewController, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "insertSubview:below:", v14, self->_hitView);

    -[DDRemoteActionHostViewController view](self->_remoteViewController, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[DDRemoteActionManagerViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB3718];
    v28 = CFSTR("vc");
    -[DDRemoteActionHostViewController view](self->_remoteViewController, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[vc]|"), 0, 0, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addConstraints:", v20);

    if (-[DDRemoteActionManagerViewController previewMode](self, "previewMode") && self->_titleBar)
    {
      -[DDRemoteActionManagerViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      titleBar = self->_titleBar;
      v22 = (void *)MEMORY[0x1E0CB3718];
      v26[1] = CFSTR("vc");
      v27[0] = titleBar;
      v26[0] = CFSTR("titleBar");
      -[DDRemoteActionHostViewController view](self->_remoteViewController, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("V:[titleBar][vc]|");
    }
    else
    {
      -[DDRemoteActionManagerViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0CB3718];
      -[DDRemoteActionHostViewController view](self->_remoteViewController, "view", CFSTR("vc"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("V:|[vc]|");
    }
    objc_msgSend(v22, "constraintsWithVisualFormat:options:metrics:views:", v23, 0, 0, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addConstraints:", v12);
  }

}

- (void)addHitOverlay
{
  UIView *v3;
  UIView *hitView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIView *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  UIView *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (!self->_hitView)
  {
    v3 = (UIView *)objc_opt_new();
    hitView = self->_hitView;
    self->_hitView = v3;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_hitView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[DDRemoteActionManagerViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", self->_hitView);

    -[UIView layer](self->_hitView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHitTestsAsOpaque:", 1);

    -[DDRemoteActionManagerViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3718];
    v9 = self->_hitView;
    v19 = CFSTR("hitView");
    v20[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[hitView]|"), 0, 0, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addConstraints:", v11);

    -[DDRemoteActionManagerViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3718];
    v14 = self->_hitView;
    v17 = CFSTR("hitView");
    v18 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[hitView]|"), 0, 0, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addConstraints:", v16);

  }
}

- (void)updatePreviewMode
{
  DDRemoteActionViewServiceProtocol *serviceContext;
  DDRemoteActionHostViewController *remoteViewController;
  void *v5;
  void *v6;
  UINavigationController *navigationController;
  DDRemoteActionManagerViewController *v8;

  serviceContext = self->_serviceContext;
  if (serviceContext)
    -[DDRemoteActionViewServiceProtocol enableUserInteraction:](serviceContext, "enableUserInteraction:", !self->_previewMode);
  remoteViewController = self->_remoteViewController;
  if (remoteViewController)
  {
    -[DDRemoteActionHostViewController parentViewController](remoteViewController, "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[DDRemoteActionHostViewController removeFromParentViewController](self->_remoteViewController, "removeFromParentViewController");
      -[DDRemoteActionHostViewController view](self->_remoteViewController, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeFromSuperview");

    }
    -[DDRemoteActionManagerViewController presentRemoteViewController](self, "presentRemoteViewController");
  }
  navigationController = self->_navigationController;
  if (navigationController)
    -[UINavigationController setNavigationBarHidden:](navigationController, "setNavigationBarHidden:", self->_previewMode);
  -[UIView setHidden:](self->_titleBar, "setHidden:", !self->_previewMode);
  -[UIView setHidden:](self->_hitView, "setHidden:", !self->_previewMode);
  -[NSLayoutConstraint setActive:](self->_titleBarBottomConstraint, "setActive:", self->_previewMode);
  -[NSLayoutConstraint setActive:](self->_navControllerTopConstraint, "setActive:", !self->_previewMode);
  if (self->_previewMode)
    v8 = 0;
  else
    v8 = self;
  objc_storeStrong((id *)&self->_strongSelf, v8);
}

- (void)setPreviewMode:(BOOL)a3
{
  if (self->_previewMode != a3)
  {
    self->_previewMode = a3;
    -[DDRemoteActionManagerViewController updatePreviewMode](self, "updatePreviewMode");
  }
}

- (void)unloadRemoteAction
{
  void *v3;
  void *v4;
  void *v5;

  -[DDRemoteActionManagerViewController request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DDRemoteActionManagerViewController extension](self, "extension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDRemoteActionManagerViewController request](self, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelExtensionRequestWithIdentifier:", v5);

    -[DDRemoteActionManagerViewController setRequest:](self, "setRequest:", 0);
  }
}

- (id)controllerVerticalMargin
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusBarFrame");
  v5 = v4;
  v7 = v6;

  if (v5 < v7)
    v7 = v5;
  -[UINavigationController navigationBar](self->_navigationController, "navigationBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v10 = v9;

  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7 + v10);
}

- (void)showLoadingView
{
  NSDate *v3;
  NSDate *loadingDate;
  UIView *v5;
  UIView *loadingView;
  void *v7;
  void *v8;
  void *v9;
  UIView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  void *v42;
  const __CFString *v43;
  UIView *v44;
  const __CFString *v45;
  void *v46;
  const __CFString *v47;
  _QWORD v48[3];

  v48[1] = *MEMORY[0x1E0C80C00];
  if (!self->_loadingView)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    loadingDate = self->_loadingDate;
    self->_loadingDate = v3;

    v5 = (UIView *)objc_opt_new();
    loadingView = self->_loadingView;
    self->_loadingView = v5;

    -[DDRemoteActionManagerViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_loadingView);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_loadingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[DDRemoteActionManagerViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3718];
    v10 = self->_loadingView;
    v47 = CFSTR("lv");
    v48[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[lv]|"), 0, 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addConstraints:", v12);

    -[DDRemoteActionManagerViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB3718];
    v45 = CFSTR("margin");
    -[DDRemoteActionManagerViewController controllerVerticalMargin](self, "controllerVerticalMargin");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = self->_loadingView;
    v43 = CFSTR("lv");
    v44 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(margin)-[lv]|"), 0, v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addConstraints:", v19);

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithFrame:", 135.0, 140.0, 50.0, 50.0);
    -[UIView addSubview:](self->_loadingView, "addSubview:", v20);
    objc_msgSend(v20, "setActivityIndicatorViewStyle:", 100);
    objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 9, 0, self->_loadingView, 9, 1.0, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 10, 0, self->_loadingView, 10, 1.0, -23.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setActive:", 1);

    objc_msgSend(v20, "startAnimating");
    v23 = (void *)objc_opt_new();
    -[UIView addSubview:](self->_loadingView, "addSubview:", v23);
    objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v23, 9, 0, self->_loadingView, 9, 1.0, 0.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setActive:", 1);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v23, 3, 0, v20, 3, 1.0, 30.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setActive:", 1);

    v26 = *MEMORY[0x1E0CEB518];
    v40[0] = *MEMORY[0x1E0CEB520];
    v40[1] = v26;
    v41[0] = &unk_1E4269C10;
    v41[1] = &unk_1E4269C28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = *MEMORY[0x1E0CEB4D0];
    v39[0] = v28;
    v30 = *MEMORY[0x1E0CEB4D8];
    v38[0] = v29;
    v38[1] = v30;
    _UISystemFontName();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA5F0]), "initWithFontAttributes:", v32);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v33, 14.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFont:", v34);

    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTextColor:", v35);

    DDLocalizedString(CFSTR("LOADING"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setText:", v36);

    -[UIView setAlpha:](self->_loadingView, "setAlpha:", 0.0);
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __54__DDRemoteActionManagerViewController_showLoadingView__block_invoke;
    v37[3] = &unk_1E42580C8;
    v37[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v37, 0.2);

  }
}

uint64_t __54__DDRemoteActionManagerViewController_showLoadingView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setAlpha:", 1.0);
}

- (void)removeLoadingViewToShowView:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  DDRemoteActionManagerViewController *v12;

  v4 = a3;
  if (self->_loadingView)
  {
    -[NSDate timeIntervalSinceNow](self->_loadingDate, "timeIntervalSinceNow");
    v6 = fmin(v5 + 0.3, 0.0);
    objc_msgSend(v4, "setAlpha:", 0.0);
    v7 = (void *)MEMORY[0x1E0CEABB0];
    v8 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __67__DDRemoteActionManagerViewController_removeLoadingViewToShowView___block_invoke;
    v10[3] = &unk_1E4258140;
    v11 = v4;
    v12 = self;
    v9[0] = v8;
    v9[1] = 3221225472;
    v9[2] = __67__DDRemoteActionManagerViewController_removeLoadingViewToShowView___block_invoke_2;
    v9[3] = &unk_1E4258168;
    v9[4] = self;
    objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 0, v10, v9, 0.2, v6);

  }
}

uint64_t __67__DDRemoteActionManagerViewController_removeLoadingViewToShowView___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 984), "setAlpha:", 0.0);
}

void __67__DDRemoteActionManagerViewController_removeLoadingViewToShowView___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 984);
  *(_QWORD *)(v2 + 984) = 0;

}

- (void)showErrorView
{
  UIView *v3;
  UIView *errorView;
  void *v5;
  void *v6;
  void *v7;
  UIView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIView *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD block[5];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  void *v39;
  const __CFString *v40;
  UIView *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  _QWORD v45[3];

  v45[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    v3 = (UIView *)objc_opt_new();
    errorView = self->_errorView;
    self->_errorView = v3;

    -[DDRemoteActionManagerViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", self->_errorView);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_errorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[DDRemoteActionManagerViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3718];
    v8 = self->_errorView;
    v44 = CFSTR("ev");
    v45[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[ev]|"), 0, 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addConstraints:", v10);

    -[DDRemoteActionManagerViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3718];
    v42 = CFSTR("margin");
    -[DDRemoteActionManagerViewController controllerVerticalMargin](self, "controllerVerticalMargin");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = self->_errorView;
    v40 = CFSTR("ev");
    v41 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(margin)-[ev]|"), 0, v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addConstraints:", v17);

    v18 = (void *)objc_opt_new();
    -[UIView addSubview:](self->_errorView, "addSubview:", v18);
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, 9, 0, self->_errorView, 9, 1.0, 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 1);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, 10, 0, self->_errorView, 10, 1.0, -23.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActive:", 1);

    v21 = *MEMORY[0x1E0CEB518];
    v37[0] = *MEMORY[0x1E0CEB520];
    v37[1] = v21;
    v38[0] = &unk_1E4269C10;
    v38[1] = &unk_1E4269C28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = *MEMORY[0x1E0CEB4D0];
    v36[0] = v23;
    v25 = *MEMORY[0x1E0CEB4D8];
    v35[0] = v24;
    v35[1] = v25;
    _UISystemFontName();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA5F0]), "initWithFontAttributes:", v27);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v28, 14.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFont:", v29);

    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTextColor:", v30);

    DDLocalizedString(CFSTR("Preview not available"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v31);

    if (self->_loadingView)
    {
      -[DDRemoteActionManagerViewController removeLoadingViewToShowView:](self, "removeLoadingViewToShowView:", self->_errorView);
    }
    else if (self->_remoteViewController)
    {
      -[UIView setAlpha:](self->_errorView, "setAlpha:", 0.0);
      v32[4] = self;
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __52__DDRemoteActionManagerViewController_showErrorView__block_invoke_2;
      v33[3] = &unk_1E42580C8;
      v33[4] = self;
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __52__DDRemoteActionManagerViewController_showErrorView__block_invoke_3;
      v32[3] = &unk_1E4258168;
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v33, v32, 0.2);
    }

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__DDRemoteActionManagerViewController_showErrorView__block_invoke;
    block[3] = &unk_1E42580C8;
    block[4] = self;
    dispatch_sync(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __52__DDRemoteActionManagerViewController_showErrorView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showErrorView");
}

void __52__DDRemoteActionManagerViewController_showErrorView__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

}

void __52__DDRemoteActionManagerViewController_showErrorView__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1032);
  if (v3)
  {
    objc_msgSend((id)v2, "emptyViewcontroller");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setViewControllers:", v5);

    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 968), "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "removeFromParentViewController");
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 968);
  *(_QWORD *)(v7 + 968) = 0;

}

- (void)DDRemoteActionDidTerminateWithError:(id)a3
{
  if (a3)
    -[DDRemoteActionManagerViewController showErrorView](self, "showErrorView");
}

- (BOOL)previewMode
{
  return self->_previewMode;
}

- (DDRemoteAction)action
{
  return (DDRemoteAction *)objc_loadWeakRetained((id *)&self->_action);
}

- (void)setAction:(id)a3
{
  objc_storeWeak((id *)&self->_action, a3);
}

- (NSExtension)extension
{
  return (NSExtension *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setExtension:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1104);
}

- (NSCopying)request
{
  return (NSCopying *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_destroyWeak((id *)&self->_action);
  objc_storeStrong((id *)&self->_strongSelf, 0);
  objc_storeStrong((id *)&self->_platterTitle, 0);
  objc_storeStrong((id *)&self->_loadingDate, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_hitView, 0);
  objc_storeStrong((id *)&self->_navControllerTopConstraint, 0);
  objc_storeStrong((id *)&self->_titleBarBottomConstraint, 0);
  objc_storeStrong((id *)&self->_titleBar, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_serviceContext, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

@end

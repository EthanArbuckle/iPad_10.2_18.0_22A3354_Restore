@implementation MarkupViewController

- (MarkupViewController)initWithCoder:(id)a3
{
  MarkupViewController *v3;
  MarkupViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MarkupViewController;
  v3 = -[MarkupViewController initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[MarkupViewController _commonInit](v3, "_commonInit");
  return v4;
}

- (MarkupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  MarkupViewController *v4;
  MarkupViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MarkupViewController;
  v4 = -[MarkupViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[MarkupViewController _commonInit](v4, "_commonInit");
  return v5;
}

- (void)_commonInit
{
  void *v3;
  NSString *v4;
  NSString *hostProcessBundleIdentifier;
  id v6;
  AKToolbarView *v7;
  AKToolbarView *modernToolbar;

  kdebug_trace();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  hostProcessBundleIdentifier = self->_hostProcessBundleIdentifier;
  self->_hostProcessBundleIdentifier = v4;

  objc_msgSend(MEMORY[0x24BDE3118], "EnableAnnotationKit");
  self->_toolbarHidden = 0;
  self->_shapeDetectionEnabled = 1;
  self->_toolbarPosition = 1;
  self->_allowShakeToUndo = 1;
  self->_thumbnailViewHidden = 1;
  self->_navigationModeHorizontal = 0;
  self->_initialContentScale = 1.0;
  self->_encryptPrivateMetadata = 1;
  self->_showAsFormSheet = 0;
  self->_pencilAlwaysDraws = objc_msgSend(MEMORY[0x24BE03A30], "canConnectToStylus");
  if (!-[MarkupViewController _useLegacyToolbar](self, "_useLegacyToolbar"))
  {
    v6 = objc_alloc(MEMORY[0x24BE03AD8]);
    v7 = (AKToolbarView *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    modernToolbar = self->_modernToolbar;
    self->_modernToolbar = v7;

    objc_storeStrong((id *)&self->_toolbar, self->_modernToolbar);
    -[AKToolbarView setTranslatesAutoresizingMaskIntoConstraints:](self->_modernToolbar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[AKToolbarView setContentsHidden:](self->_modernToolbar, "setContentsHidden:", 1);
  }
  -[MarkupViewController setNeedToPerformFullTeardown:](self, "setNeedToPerformFullTeardown:", 1);
}

- (void)dealloc
{
  objc_super v3;

  -[MarkupViewController fullTeardown](self, "fullTeardown");
  v3.receiver = self;
  v3.super_class = (Class)MarkupViewController;
  -[MarkupViewController dealloc](&v3, sel_dealloc);
}

- (BOOL)_canShowWhileLocked
{
  void *v3;
  char v4;

  -[MarkupViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "controllerCanShowWhileLocked:", self);
  else
    v4 = 1;

  return v4;
}

- (void)willBeginLoadingNewDocument
{
  if (-[MarkupViewController needToPerformDocumentClosedTeardown](self, "needToPerformDocumentClosedTeardown"))
    -[MarkupViewController documentDidCloseTeardown](self, "documentDidCloseTeardown");
  -[MarkupViewController setNeedToPerformDocumentClosedTeardown:](self, "setNeedToPerformDocumentClosedTeardown:", 1);
}

- (void)fullTeardown
{
  NSLog(CFSTR("fullTeardown called"), a2);
  if (-[MarkupViewController needToPerformFullTeardown](self, "needToPerformFullTeardown"))
  {
    -[MarkupViewController setNeedToPerformFullTeardown:](self, "setNeedToPerformFullTeardown:", 0);
    -[MarkupViewController documentDidCloseTeardown](self, "documentDidCloseTeardown");
    -[MarkupViewController setContentContainerView:](self, "setContentContainerView:", 0);
    NSLog(CFSTR("fullTeardown performed"));
  }
}

- (void)documentDidCloseTeardown
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

  NSLog(CFSTR("documentDidCloseTeardown called"), a2);
  if (-[MarkupViewController needToPerformDocumentClosedTeardown](self, "needToPerformDocumentClosedTeardown"))
  {
    -[MarkupViewController setNeedToPerformDocumentClosedTeardown:](self, "setNeedToPerformDocumentClosedTeardown:", 0);
    -[MarkupViewController contentViewController](self, "contentViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uninstallAllAnnotationControllerOverlays");

    -[MarkupViewController toolbarTopConstraint](self, "toolbarTopConstraint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActive:", 0);

    -[MarkupViewController toolbarTopAttachedConstraint](self, "toolbarTopAttachedConstraint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setActive:", 0);

    -[MarkupViewController toolbarBottomConstraint](self, "toolbarBottomConstraint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setActive:", 0);

    -[MarkupViewController setToolbarTopConstraint:](self, "setToolbarTopConstraint:", 0);
    -[MarkupViewController setToolbarTopAttachedConstraint:](self, "setToolbarTopAttachedConstraint:", 0);
    -[MarkupViewController setToolbarBottomConstraint:](self, "setToolbarBottomConstraint:", 0);
    if (-[MarkupViewController _useLegacyToolbar](self, "_useLegacyToolbar"))
    {
      -[MarkupViewController annotationController](self, "annotationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "toolbarViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDelegate:", 0);

      objc_msgSend(v8, "willMoveToParentViewController:", 0);
      objc_msgSend(v8, "removeFromParentViewController");
      -[MarkupViewController annotationController](self, "annotationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "toolbarView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeFromSuperview");

    }
    -[MarkupViewController toolbar](self, "toolbar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeFromSuperview");

    -[MarkupViewController setToolbar:](self, "setToolbar:", 0);
    -[MarkupViewController _stopObservingAnnotationController](self, "_stopObservingAnnotationController");
    -[MarkupViewController contentViewController](self, "contentViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "willMoveToParentViewController:", 0);

    -[MarkupViewController contentViewController](self, "contentViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeFromParentViewController");

    -[MarkupViewController contentViewController](self, "contentViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeFromSuperview");

    -[MarkupViewController contentViewController](self, "contentViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "teardown");

    -[MarkupViewController setContentViewController:](self, "setContentViewController:", 0);
    -[MarkupViewController setAkUndoManager:](self, "setAkUndoManager:", 0);
    -[MarkupViewController setSourceContent:](self, "setSourceContent:", 0);
    -[MarkupViewController setDigestedSourceContent:](self, "setDigestedSourceContent:", 0);
    -[MarkupViewController setSourceContentType:](self, "setSourceContentType:", 0);
    -[MarkupViewController navBar](self, "navBar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDelegate:", 0);

    -[MarkupViewController setNavBar:](self, "setNavBar:", 0);
    -[MarkupViewController setNavItem:](self, "setNavItem:", 0);
    -[MarkupViewController setCancelButton:](self, "setCancelButton:", 0);
    -[MarkupViewController setDoneButton:](self, "setDoneButton:", 0);
    -[MarkupViewController transitionDimmingView](self, "transitionDimmingView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeFromSuperview");

    -[MarkupViewController setTransitionDimmingView:](self, "setTransitionDimmingView:", 0);
    -[MarkupViewController whiteView](self, "whiteView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeFromSuperview");

    -[MarkupViewController setWhiteView:](self, "setWhiteView:", 0);
    -[MarkupViewController setAlreadyLoggedSavingForThisDocument:](self, "setAlreadyLoggedSavingForThisDocument:", 0);
    NSLog(CFSTR("documentDidCloseTeardown performed"));
  }
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
  objc_super v19;

  kdebug_trace();
  v19.receiver = self;
  v19.super_class = (Class)MarkupViewController;
  -[MarkupViewController viewDidLoad](&v19, sel_viewDidLoad);
  -[MarkupViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_modernToolbar);

  if (-[AKToolbarView useNewFullscreenPalette](self->_modernToolbar, "useNewFullscreenPalette"))
  {
    -[MarkupViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bringSubviewToFront:", self->_modernToolbar);

  }
  -[AKToolbarView bottomAnchor](self->_modernToolbar, "bottomAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MarkupViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MarkupViewController setToolbarBottomConstraint:](self, "setToolbarBottomConstraint:", v8);

  -[AKToolbarView leadingAnchor](self->_modernToolbar, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MarkupViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  -[AKToolbarView trailingAnchor](self->_modernToolbar, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MarkupViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[AKToolbarView setShareButtonAction:](self->_modernToolbar, "setShareButtonAction:", sel__toolbarShareButtonTapped_);
  -[AKToolbarView setShareButtonTarget:](self->_modernToolbar, "setShareButtonTarget:", self);
  -[MarkupViewController toolbarBottomConstraint](self, "toolbarBottomConstraint");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  -[MarkupViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MarkupViewController setContentContainerView:](self, "setContentContainerView:", v18);

  -[MarkupViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MarkupViewController;
  -[MarkupViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[MarkupViewController navBar](self, "navBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[MarkupViewController contentViewController](self, "contentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MarkupViewController _updateundoBarButtonWithController:](self, "_updateundoBarButtonWithController:", v5);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  kdebug_trace();
  v8.receiver = self;
  v8.super_class = (Class)MarkupViewController;
  -[MarkupViewController viewDidAppear:](&v8, sel_viewDidAppear_, v3);
  if (!self->_toolbarHidden)
  {
    -[MarkupViewController annotationController](self, "annotationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[MarkupViewController annotationController](self, "annotationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "toolPicker");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "setVisible:forFirstResponder:", 1, self);
      -[AKToolbarView setContentsHidden:](self->_modernToolbar, "setContentsHidden:", 0);

    }
    else
    {
      -[MarkupViewController setNeedsToolPickerVisibleWhenAnnotationControllerIsAvailable:](self, "setNeedsToolPickerVisibleWhenAnnotationControllerIsAvailable:", 1);
    }
    -[MarkupViewController becomeFirstResponder](self, "becomeFirstResponder");

  }
}

- (BOOL)canBecomeFirstResponder
{
  void *v3;
  char v4;
  char v5;
  void *v7;

  if (self->_showingSignaturesUI)
    return 0;
  -[MarkupViewController _pdfDocument](self, "_pdfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLocked");

  if ((v4 & 1) != 0)
    return 0;
  -[MarkupViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v7, "controllerCanBecomeFirstResponder:", self);
  else
    v5 = 1;

  return v5;
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MarkupViewController;
  -[MarkupViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[MarkupViewController adjustContentInsetsForBars](self, "adjustContentInsetsForBars");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MarkupViewController;
  -[MarkupViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  -[MarkupViewController adjustContentInsetsForBars](self, "adjustContentInsetsForBars");
  -[MarkupViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MarkupViewController _updateundoBarButtonWithController:](self, "_updateundoBarButtonWithController:", v3);

}

- (UIEdgeInsets)sketchOverlayInsets
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIEdgeInsets result;

  -[MarkupViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "customSketchOverlayInsets");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
  }
  else
  {
    -[MarkupViewController contentViewController](self, "contentViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "edgeInsets");
    v5 = v13;
    v7 = v14;
    v9 = v15;
    v11 = v16;

  }
  v17 = v5;
  v18 = v7;
  v19 = v9;
  v20 = v11;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MarkupViewController;
  -[MarkupViewController traitCollectionDidChange:](&v13, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "userInterfaceIdiom");
  -[MarkupViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v5 != v7)
  {
    -[MarkupViewController traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MarkupViewController _updateAppearanceForTraitCollection:](self, "_updateAppearanceForTraitCollection:", v8);

  }
  v9 = objc_msgSend(v4, "horizontalSizeClass");
  -[MarkupViewController traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "horizontalSizeClass");

  if (v9 != v11)
  {
    -[MarkupViewController contentViewController](self, "contentViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MarkupViewController _updateundoBarButtonWithController:](self, "_updateundoBarButtonWithController:", v12);

  }
}

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  int64_t v3;

  -[MarkupViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") != 1;

  return v3;
}

- (BOOL)_useLegacyToolbar
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__MarkupViewController__useLegacyToolbar__block_invoke;
  block[3] = &unk_24E5D4068;
  block[4] = self;
  if (_useLegacyToolbar_onceToken != -1)
    dispatch_once(&_useLegacyToolbar_onceToken, block);
  return _useLegacyToolbar__isItunesU;
}

void __41__MarkupViewController__useLegacyToolbar__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "hostProcessBundleIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _useLegacyToolbar__isItunesU = objc_msgSend(v1, "containsString:", CFSTR("itunesu"));

}

- (void)_setLegacyToolbarHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  MarkupViewController *v16;
  BOOL v17;
  _QWORD v18[5];
  BOOL v19;

  v4 = a4;
  v5 = a3;
  v7 = !a3;
  -[MarkupViewController annotationController](self, "annotationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "toolbarViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "beginAppearanceTransition:animated:", v7, v4);
  if (v4 && !v5)
  {
    -[MarkupViewController toolbar](self, "toolbar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlpha:", 0.0);

    -[MarkupViewController toolbar](self, "toolbar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 0);

  }
  if (v4)
  {
    v12 = (void *)MEMORY[0x24BDF6F90];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __57__MarkupViewController__setLegacyToolbarHidden_animated___block_invoke;
    v18[3] = &unk_24E5D43B8;
    v18[4] = self;
    v19 = v5;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __57__MarkupViewController__setLegacyToolbarHidden_animated___block_invoke_2;
    v14[3] = &unk_24E5D43E0;
    v15 = v9;
    v16 = self;
    v17 = v5;
    objc_msgSend(v12, "_animateUsingDefaultTimingWithOptions:animations:completion:", 6, v18, v14);

  }
  else
  {
    objc_msgSend(v9, "endAppearanceTransition");
    -[MarkupViewController toolbar](self, "toolbar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", v5);

  }
}

void __57__MarkupViewController__setLegacyToolbarHidden_animated___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  else
    v1 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "toolbar");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

void __57__MarkupViewController__setLegacyToolbarHidden_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "endAppearanceTransition");
  v2 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "toolbar");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", v2);

}

- (void)setToolbarHidden:(BOOL)a3
{
  -[MarkupViewController setToolbarHidden:animated:](self, "setToolbarHidden:animated:", a3, 0);
}

- (void)setToolbarHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (self->_toolbarHidden != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_toolbarHidden = a3;
    if (-[MarkupViewController _useLegacyToolbar](self, "_useLegacyToolbar"))
    {
      -[MarkupViewController _setLegacyToolbarHidden:animated:](self, "_setLegacyToolbarHidden:animated:", v5, v4);
    }
    else
    {
      -[MarkupViewController annotationController](self, "annotationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "toolPicker");
      v12 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setVisible:forFirstResponder:", 1, self);
      if (self->_toolbarHidden)
      {
        if ((-[MarkupViewController isFirstResponder](self, "isFirstResponder") & 1) == 0)
          -[MarkupViewController becomeFirstResponder](self, "becomeFirstResponder");
        -[MarkupViewController toolbar](self, "toolbar");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "endAnnotationEditing");

        -[MarkupViewController toolbar](self, "toolbar");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "dismissPresentedPopoversAnimated:", 1);

        -[MarkupViewController toolbar](self, "toolbar");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "forceHideRuler");

        objc_msgSend(v12, "setVisible:forFirstResponder:", 0, self);
      }
      else
      {
        -[MarkupViewController becomeFirstResponder](self, "becomeFirstResponder");
      }
      -[MarkupViewController toolbar](self, "toolbar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setContentsHidden:animated:", v5, v4);

    }
  }
}

- (void)setToolbarPosition:(int64_t)a3
{
  if (-[MarkupViewController _useLegacyToolbar](self, "_useLegacyToolbar"))
  {
    if (self->_toolbarPosition != a3)
    {
      self->_toolbarPosition = a3;
      -[MarkupViewController _updateConstraintsForBarPosition:](self, "_updateConstraintsForBarPosition:", a3);
    }
  }
  else
  {
    NSLog(&CFSTR("This API is deprecated - nobody should call this besides iTunesU.  This API is on longer being respected for "
                 "modern toolbars.").isa);
  }
}

- (void)setShowThumbnailViewForMultipage:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  id v6;

  v3 = a3;
  -[MarkupViewController contentViewController](self, "contentViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = !v3
    || (objc_opt_respondsToSelector() & 1) == 0
    || -[MarkupViewController thumbnailViewStyle](self, "thumbnailViewStyle") != 1 && objc_msgSend(v6, "pageCount") == 1;
  -[MarkupViewController _setThumbnailViewHidden:](self, "_setThumbnailViewHidden:", v5);

}

- (void)_setThumbnailViewHidden:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  self->_thumbnailViewHidden = a3;
  -[MarkupViewController contentViewController](self, "contentViewController");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7 = (void *)v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "setShowsThumbnailView:", !self->_thumbnailViewHidden);
      v5 = v7;
    }
  }

}

- (void)setFixedThumbnailView:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char isKindOfClass;
  id v7;

  v3 = a3;
  -[MarkupViewController contentViewController](self, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MarkupViewController contentViewController](self, "contentViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFixedThumbnailView:", v3);

  }
}

- (BOOL)fixedThumbnailView
{
  void *v3;
  char isKindOfClass;
  void *v5;
  char v6;

  -[MarkupViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  -[MarkupViewController contentViewController](self, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fixedThumbnailView");

  return v6;
}

- (BOOL)isTouchInThumbnailView:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  char v8;

  v4 = a3;
  -[MarkupViewController contentViewController](self, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MarkupViewController contentViewController](self, "contentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isTouchInThumbnailView:", v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setNavigationModeHorizontal:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  self->_navigationModeHorizontal = a3;
  -[MarkupViewController contentViewController](self, "contentViewController");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7 = (void *)v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "setNavigationModeHorizontal:", self->_navigationModeHorizontal);
      v5 = v7;
    }
  }

}

- (void)setFileURL:(id)a3 withArchivedModelData:(id)a4 placeholderImage:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  MarkupViewController *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_get_global_queue(2, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__MarkupViewController_setFileURL_withArchivedModelData_placeholderImage___block_invoke;
  block[3] = &unk_24E5D4430;
  v16 = v10;
  v17 = self;
  v18 = v8;
  v19 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_sync(v11, block);

}

void __74__MarkupViewController_setFileURL_withArchivedModelData_placeholderImage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  _QWORD v8[3];
  char v9;
  id location;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
    objc_msgSend(*(id *)(a1 + 40), "setPlaceholderImageView:", v2);

    objc_msgSend(*(id *)(a1 + 40), "setPlaceholderImage:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "_presentPlaceholderImage");
  }
  objc_initWeak(&location, *(id *)(a1 + 40));
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 1;
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74__MarkupViewController_setFileURL_withArchivedModelData_placeholderImage___block_invoke_2;
  v6[3] = &unk_24E5D4408;
  v6[4] = v8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "_setFileURL:withArchivedModelData:withCompletion:", v4, v5, v6);
  objc_destroyWeak(&v7);
  _Block_object_dispose(v8, 8);
  objc_destroyWeak(&location);
}

void __74__MarkupViewController_setFileURL_withArchivedModelData_placeholderImage___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_cleanupPlaceholderImage");

}

- (void)setFileURL:(id)a3 withArchivedModelData:(id)a4
{
  -[MarkupViewController _setFileURL:withArchivedModelData:withCompletion:](self, "_setFileURL:withArchivedModelData:withCompletion:", a3, a4, 0);
}

- (void)_setFileURL:(id)a3 withArchivedModelData:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1570]), "initWithFilePresenter:", 0);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __73__MarkupViewController__setFileURL_withArchivedModelData_withCompletion___block_invoke;
  v13[3] = &unk_24E5D4458;
  v13[4] = &v14;
  objc_msgSend(v11, "coordinateReadingItemAtURL:options:error:byAccessor:", v8, 0, 0, v13);
  v12 = (id)v15[5];

  -[MarkupViewController _updateAndLoadSourceContent:withArchivedModelData:withCompletion:](self, "_updateAndLoadSourceContent:withArchivedModelData:withCompletion:", v12, v9, v10);
  _Block_object_dispose(&v14, 8);

}

void __73__MarkupViewController__setFileURL_withArchivedModelData_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)setFileURL:(id)a3
{
  -[MarkupViewController setFileURL:withArchivedModelData:placeholderImage:](self, "setFileURL:withArchivedModelData:placeholderImage:", a3, 0, 0);
}

- (void)setImage:(id)a3 withArchivedModelData:(id)a4 placeholderImage:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
    -[MarkupViewController setPlaceholderImageView:](self, "setPlaceholderImageView:", v11);

    -[MarkupViewController setPlaceholderImage:](self, "setPlaceholderImage:", v10);
  }
  objc_initWeak(&location, self);
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __72__MarkupViewController_setImage_withArchivedModelData_placeholderImage___block_invoke;
  v15 = &unk_24E5D40B8;
  objc_copyWeak(&v16, &location);
  -[MarkupViewController _updateAndLoadSourceContent:withArchivedModelData:withCompletion:](self, "_updateAndLoadSourceContent:withArchivedModelData:withCompletion:", v8, v9, &v12);
  -[MarkupViewController _presentPlaceholderImage](self, "_presentPlaceholderImage", v12, v13, v14, v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __72__MarkupViewController_setImage_withArchivedModelData_placeholderImage___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_cleanupPlaceholderImage");
    WeakRetained = v2;
  }

}

- (void)setImage:(id)a3 withArchivedModelData:(id)a4
{
  -[MarkupViewController setImage:withArchivedModelData:placeholderImage:](self, "setImage:withArchivedModelData:placeholderImage:", a3, a4, 0);
}

- (void)setImage:(id)a3
{
  -[MarkupViewController setImage:withArchivedModelData:placeholderImage:](self, "setImage:withArchivedModelData:placeholderImage:", a3, 0, 0);
}

- (void)setData:(id)a3 withArchivedModelData:(id)a4 placeholderImage:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
    -[MarkupViewController setPlaceholderImageView:](self, "setPlaceholderImageView:", v11);

    -[MarkupViewController setPlaceholderImage:](self, "setPlaceholderImage:", v10);
  }
  objc_initWeak(&location, self);
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __71__MarkupViewController_setData_withArchivedModelData_placeholderImage___block_invoke;
  v15 = &unk_24E5D40B8;
  objc_copyWeak(&v16, &location);
  -[MarkupViewController _setData:withArchivedModelData:withCompletion:](self, "_setData:withArchivedModelData:withCompletion:", v8, v9, &v12);
  -[MarkupViewController _presentPlaceholderImage](self, "_presentPlaceholderImage", v12, v13, v14, v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __71__MarkupViewController_setData_withArchivedModelData_placeholderImage___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_cleanupPlaceholderImage");
    WeakRetained = v2;
  }

}

- (void)setData:(id)a3 withArchivedModelData:(id)a4
{
  -[MarkupViewController setData:withArchivedModelData:placeholderImage:](self, "setData:withArchivedModelData:placeholderImage:", a3, a4, 0);
}

- (void)setData:(id)a3
{
  -[MarkupViewController setData:withArchivedModelData:placeholderImage:](self, "setData:withArchivedModelData:placeholderImage:", a3, 0, 0);
}

- (UTType)outputContentType
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[MarkupViewController sourceContentType](self, "sourceContentType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    NSLog(CFSTR("%s: sourceContentType is undefined"), "-[MarkupViewController outputContentType]");
    v6 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)*MEMORY[0x24BDF84E0];
  if (objc_msgSend(v3, "conformsToType:", *MEMORY[0x24BDF84E0])
    || (v4 = (void *)*MEMORY[0x24BDF84F8], objc_msgSend(v3, "conformsToType:", *MEMORY[0x24BDF84F8]))
    || (v4 = (void *)*MEMORY[0x24BDF85D0], objc_msgSend(v3, "conformsToType:", *MEMORY[0x24BDF85D0])))
  {
    v5 = v4;
  }
  else
  {
    if (!objc_msgSend(v3, "conformsToType:", *MEMORY[0x24BDF8410]))
    {
      NSLog(CFSTR("%s: NULL outputType for sourceContentType: %@"), "-[MarkupViewController outputContentType]", v2);
      v6 = 0;
      goto LABEL_7;
    }
    v5 = (id)*MEMORY[0x24BDF8438];
  }
  v6 = v5;
LABEL_7:

LABEL_9:
  return (UTType *)v6;
}

- (NSString)outputType
{
  void *v2;
  void *v3;

  -[MarkupViewController outputContentType](self, "outputContentType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)supportedOutputTypes
{
  return &unk_24E5E05F0;
}

- (BOOL)writeToURL:(id)a3 embeddingSourceImageAndEditModel:(BOOL)a4 error:(id *)a5
{
  return -[MarkupViewController writeToURL:embeddingSourceImageAndEditModel:options:error:](self, "writeToURL:embeddingSourceImageAndEditModel:options:error:", a3, a4, 0, a5);
}

- (BOOL)writeToURL:(id)a3 embeddingSourceImageAndEditModel:(BOOL)a4 options:(id)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  CGDataConsumerRef v11;
  CGDataConsumerRef v12;
  BOOL v13;

  v7 = a4;
  v10 = a5;
  v11 = CGDataConsumerCreateWithURL((CFURLRef)a3);
  if (v11)
  {
    v12 = v11;
    v13 = -[MarkupViewController _writeToDataConsumer:embedSourceImageAndEditModel:options:error:](self, "_writeToDataConsumer:embedSourceImageAndEditModel:options:error:", v11, v7, v10, a6);
    CFRelease(v12);
    if (!a6)
      goto LABEL_8;
  }
  else
  {
    v13 = 0;
    if (!a6)
      goto LABEL_8;
  }
  if (!v13 && !*a6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 512, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_8:

  return v13;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  return -[MarkupViewController writeToURL:embeddingSourceImageAndEditModel:error:](self, "writeToURL:embeddingSourceImageAndEditModel:error:", a3, 1, a4);
}

- (BOOL)writeToURL:(id)a3 options:(id)a4 error:(id *)a5
{
  return -[MarkupViewController writeToURL:embeddingSourceImageAndEditModel:options:error:](self, "writeToURL:embeddingSourceImageAndEditModel:options:error:", a3, 1, a4, a5);
}

- (id)dataRepresentationEmbeddingSourceImageAndEditModel:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  __CFData *v7;
  CGDataConsumerRef v8;
  CGDataConsumerRef v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  __CFData *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v7 = (__CFData *)objc_claimAutoreleasedReturnValue();
  v8 = CGDataConsumerCreateWithCFData(v7);
  if (!v8)
  {
    v16 = 0;
    v17 = 1;
    if (!a4)
      goto LABEL_21;
    goto LABEL_18;
  }
  v9 = v8;
  v10 = -[MarkupViewController _writeToDataConsumer:embedSourceImageAndEditModel:error:](self, "_writeToDataConsumer:embedSourceImageAndEditModel:error:", v8, v5, a4);
  if (v10)
  {
    v11 = _MUWriteOutputToTemp_cachedValue;
    if (_MUWriteOutputToTemp_cachedValue == -2)
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", CFSTR("MUWriteOutputToTemp"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        _MUWriteOutputToTemp_cachedValue = objc_msgSend(v14, "BOOLForKey:", CFSTR("MUWriteOutputToTemp"));

        if (_MUWriteOutputToTemp_cachedValue)
          v15 = CFSTR("YES");
        else
          v15 = CFSTR("NO");
        NSLog(CFSTR("%@=%@"), CFSTR("MUWriteOutputToTemp"), v15);
      }
      else
      {
        _MUWriteOutputToTemp_cachedValue = 0;
      }

      v11 = _MUWriteOutputToTemp_cachedValue;
    }
    if (v11)
    {
      -[MarkupViewController outputContentType](self, "outputContentType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "preferredFilenameExtension");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      NSTemporaryDirectory();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringByAppendingPathComponent:", CFSTR("output"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringByAppendingPathExtension:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      NSLog(CFSTR("Writing output to: %@"), v22);
      -[__CFData writeToFile:atomically:](v7, "writeToFile:atomically:", v22, 0);

    }
    v16 = v7;
  }
  else
  {
    v16 = 0;
  }
  CFRelease(v9);
  v17 = !v10;
  if (a4)
  {
LABEL_18:
    if (v17 && !*a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 512, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_21:

  return v16;
}

- (id)dataRepresentationWithError:(id *)a3
{
  return -[MarkupViewController dataRepresentationEmbeddingSourceImageAndEditModel:error:](self, "dataRepresentationEmbeddingSourceImageAndEditModel:error:", 1, a3);
}

- (id)createArchivedModelData
{
  MUImageWriter *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MUImageWriter);
  -[MarkupViewController annotationController](self, "annotationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUImageWriter encodedModelFromAnnotationsController:encrypt:](v3, "encodedModelFromAnnotationsController:encrypt:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)finalizeCrop
{
  if (self->_contentViewController)
  {
    if (objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", sel_finalizeCrop))
      -[MUContentViewControllerProtocol performSelector:](self->_contentViewController, "performSelector:", sel_finalizeCrop);
  }
}

- (void)done:(id)a3
{
  -[MarkupViewController _saveEditing:](self, "_saveEditing:", 0);
}

- (void)cancel:(id)a3
{
  id v4;
  void *v5;
  int v6;
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
  _QWORD v18[5];

  v4 = a3;
  -[MarkupViewController annotationController](self, "annotationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "validateUndo:", 0);

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDF67E8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Discard Changes"), &stru_24E5D4C60, CFSTR("MarkupViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __31__MarkupViewController_cancel___block_invoke;
    v18[3] = &unk_24E5D4480;
    v18[4] = self;
    objc_msgSend(v8, "actionWithTitle:style:handler:", v10, 2, v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v11);

    v12 = (void *)MEMORY[0x24BDF67E8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_24E5D4C60, CFSTR("MarkupViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v15);

    objc_msgSend(v7, "setModalPresentationStyle:", 7);
    objc_msgSend(v7, "popoverPresentationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPermittedArrowDirections:", 1);

    objc_msgSend(v7, "popoverPresentationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBarButtonItem:", v4);

    -[MarkupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  }
  else
  {
    -[MarkupViewController _cancel](self, "_cancel");
  }

}

uint64_t __31__MarkupViewController_cancel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancel");
}

- (void)_cancel
{
  void *v3;
  id v4;

  -[MarkupViewController setUserDidCancel:](self, "setUserDidCancel:", 1);
  if (-[MarkupViewController useFancyTransition](self, "useFancyTransition"))
  {
    -[MarkupViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serviceDidFinishwithResults:andSandboxExtension:", 0, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3072, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[MarkupViewController extensionContext](self, "extensionContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelRequestWithError:", v4);

    -[MarkupViewController documentDidCloseTeardown](self, "documentDidCloseTeardown");
  }

}

- (BOOL)validateRedo:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[MarkupViewController annotationController](self, "annotationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "validateRedo:", v4);

  return v6;
}

- (BOOL)validateUndo:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[MarkupViewController annotationController](self, "annotationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "validateUndo:", v4);

  return v6;
}

- (void)undo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MarkupViewController annotationController](self, "annotationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "undo:", v4);

}

- (void)redo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MarkupViewController annotationController](self, "annotationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "redo:", v4);

}

- (void)revert
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[MarkupViewController undoManager](self, "undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canUndo");

  if (v4)
  {
    do
    {
      -[MarkupViewController undoManager](self, "undoManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "undo");

      -[MarkupViewController undoManager](self, "undoManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "canUndo");

    }
    while ((v7 & 1) != 0);
  }
  -[MarkupViewController undoManager](self, "undoManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllActions");

}

- (BOOL)_writeToDataConsumer:(CGDataConsumer *)a3 embedSourceImageAndEditModel:(BOOL)a4 error:(id *)a5
{
  return -[MarkupViewController _writeToDataConsumer:embedSourceImageAndEditModel:options:error:](self, "_writeToDataConsumer:embedSourceImageAndEditModel:options:error:", a3, a4, 0, a5);
}

- (BOOL)_writeToDataConsumer:(CGDataConsumer *)a3 embedSourceImageAndEditModel:(BOOL)a4 options:(id)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  _BOOL4 alreadyLoggedSavingForThisDocument;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MUImageWriter *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  id v23;
  void *v24;

  v7 = a4;
  v10 = a5;
  -[MarkupViewController undoManager](self, "undoManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "canUndo"))
  {
    alreadyLoggedSavingForThisDocument = self->_alreadyLoggedSavingForThisDocument;

    if (!alreadyLoggedSavingForThisDocument)
    {
      -[MarkupViewController sourceContentType](self, "sourceContentType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MarkupViewController hostProcessBundleIdentifier](self, "hostProcessBundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[MUStatistics logFileTypeSaved:byProcess:](MUStatistics, "logFileTypeSaved:byProcess:", v13, v14);

      -[MarkupViewController setAlreadyLoggedSavingForThisDocument:](self, "setAlreadyLoggedSavingForThisDocument:", 1);
    }
  }
  else
  {

  }
  -[MarkupViewController annotationController](self, "annotationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "endLogging");

  -[MarkupViewController outputContentType](self, "outputContentType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "conformsToType:", *MEMORY[0x24BDF8410]))
  {
    v17 = objc_alloc_init(MUImageWriter);
    -[MarkupViewController digestedSourceContent](self, "digestedSourceContent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MarkupViewController annotationController](self, "annotationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[MUImageWriter writeUsingBaseImage:withAnnotationsFromController:asImageOfType:toConsumer:embedSourceImageAndAnnotationsAsMetadata:encryptPrivateMetadata:error:](v17, "writeUsingBaseImage:withAnnotationsFromController:asImageOfType:toConsumer:embedSourceImageAndAnnotationsAsMetadata:encryptPrivateMetadata:error:", v18, v19, v20, a3, v7, -[MarkupViewController encryptPrivateMetadata](self, "encryptPrivateMetadata"), a6);

  }
  else if (objc_msgSend(v16, "conformsToType:", *MEMORY[0x24BDF84E0]))
  {
    -[MarkupViewController digestedSourceContent](self, "digestedSourceContent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v23, "setValue:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDE3218]);
    if (v10 && objc_msgSend(v10, "count"))
      objc_msgSend(v23, "addEntriesFromDictionary:", v10);
    v24 = (void *)objc_msgSend(v23, "copy");
    v21 = objc_msgSend(v22, "writeToConsumer:withOptions:", a3, v24);

  }
  else
  {
    NSLog(CFSTR("%s: Unexpected output type: %@"), "-[MarkupViewController _writeToDataConsumer:embedSourceImageAndEditModel:options:error:]", v16);
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 518, 0);
      v21 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
  }

  return v21;
}

- (void)_updateAndLoadSourceContent:(id)a3 withArchivedModelData:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  kdebug_trace();
  -[MarkupViewController willBeginLoadingNewDocument](self, "willBeginLoadingNewDocument");
  -[MarkupViewController setSourceContent:withArchivedModelData:](self, "setSourceContent:withArchivedModelData:", v10, v9);

  -[MarkupViewController sourceContentType](self, "sourceContentType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __89__MarkupViewController__updateAndLoadSourceContent_withArchivedModelData_withCompletion___block_invoke;
    v12[3] = &unk_24E5D42A8;
    v12[4] = self;
    v13 = v8;
    -[MarkupViewController _loadSourceContentWithCompletion:](self, "_loadSourceContentWithCompletion:", v12);

  }
  else
  {
    -[MarkupViewController _bailFailedAnimateEnterMarkup](self, "_bailFailedAnimateEnterMarkup");
  }

}

void __89__MarkupViewController__updateAndLoadSourceContent_withArchivedModelData_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unsigned __int8 *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char isKindOfClass;
  id *v26;
  void *v27;
  id v28;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;

  objc_msgSend(*(id *)(a1 + 32), "contentViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v16 = v15;
  v18 = v17;

  objc_msgSend(*(id *)(a1 + 32), "_setupInitialBaseModelScaleFactorWithScreenSize:windowDecorationSize:", v5, v7, v10 - v16, v12 - v18);
  v19 = *(unsigned __int8 **)(a1 + 32);
  v20 = v19[1006];
  objc_msgSend(v19, "annotationController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPencilAlwaysDraws:", v20);

  objc_msgSend(*(id *)(a1 + 32), "restoreToolModeForContentType");
  v22 = *(_QWORD *)(a1 + 40);
  if (v22)
    (*(void (**)(void))(v22 + 16))();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "postNotificationName:object:", CFSTR("_MUDocumentFinishedLoading"), *(_QWORD *)(a1 + 32));

  kdebug_trace();
  objc_msgSend(*(id *)(a1 + 32), "contentViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v26 = (id *)MEMORY[0x24BE039F8];
  if ((isKindOfClass & 1) != 0)
    v26 = (id *)MEMORY[0x24BE03A00];
  v28 = *v26;
  objc_msgSend(*(id *)(a1 + 32), "annotationController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "beginLogging:documentType:", CFSTR("markup"), v28);

}

- (void)_loadSourceContentWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  MarkupViewController *v21;
  id v22;
  _QWORD block[4];
  id v24;
  id location;

  v4 = a3;
  -[MarkupViewController sourceContent](self, "sourceContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_initWeak(&location, self);
    v6 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__MarkupViewController__loadSourceContentWithCompletion___block_invoke;
    block[3] = &unk_24E5D40B8;
    objc_copyWeak(&v24, &location);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    -[MarkupViewController sourceContentType](self, "sourceContentType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MarkupViewController _installContentViewControllerForUTI:](self, "_installContentViewControllerForUTI:", v7);

    v8 = (void *)MEMORY[0x24BDF8238];
    -[MarkupViewController sourceContentType](self, "sourceContentType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "typeWithIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "conformsToType:", *MEMORY[0x24BDF84E0]))
    {
      -[MarkupViewController contentViewController](self, "contentViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setForcesPDFViewTopAlignment:", -[MarkupViewController forcesPDFViewTopAlignment](self, "forcesPDFViewTopAlignment"));

      -[MarkupViewController contentViewController](self, "contentViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v6;
      v18 = 3221225472;
      v19 = __57__MarkupViewController__loadSourceContentWithCompletion___block_invoke_2;
      v20 = &unk_24E5D42A8;
      v21 = self;
      v22 = v4;
      objc_msgSend(v12, "loadContentWithCompletionBlock:", &v17);

    }
    else if (objc_msgSend(v10, "conformsToType:", *MEMORY[0x24BDF8410]))
    {
      -[MarkupViewController _setupAnnotationController](self, "_setupAnnotationController");
      -[MarkupViewController contentViewController](self, "contentViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MarkupViewController placeholderImage](self, "placeholderImage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTentativePlaceholderImage:", v14);

      -[MarkupViewController contentViewController](self, "contentViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "loadContentWithCompletionBlock:", v4);

    }
    -[MarkupViewController setAllEditingDisabled:](self, "setAllEditingDisabled:", 0, v17, v18, v19, v20, v21);
    -[MarkupViewController setAnnotationEditingEnabled:](self, "setAnnotationEditingEnabled:", 1);
    -[MarkupViewController setFormFillingEnabled:](self, "setFormFillingEnabled:", 0);
    -[MarkupViewController _startObservingAnnotationController](self, "_startObservingAnnotationController");

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  -[MarkupViewController contentViewController](self, "contentViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MarkupViewController _updateundoBarButtonWithController:](self, "_updateundoBarButtonWithController:", v16);

}

void __57__MarkupViewController__loadSourceContentWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_hostApplicationBundleIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
      objc_msgSend(v5, "setHostProcessBundleIdentifier:", v2);
    objc_msgSend(v5, "sourceContentType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hostProcessBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUStatistics logFileTypeOpened:byProcess:](MUStatistics, "logFileTypeOpened:byProcess:", v3, v4);

    WeakRetained = v5;
  }

}

uint64_t __57__MarkupViewController__loadSourceContentWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_setupAnnotationController");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)allEditingDisabled
{
  void *v2;
  char v3;

  -[MarkupViewController annotationController](self, "annotationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allEditingDisabled");

  return v3;
}

- (void)setAllEditingDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MarkupViewController annotationController](self, "annotationController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllEditingDisabled:", v3);

}

- (void)setAnnotationEditingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[MarkupViewController annotationController](self, "annotationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "annotationEditingEnabled") != v3)
  {
    objc_msgSend(v6, "setAnnotationEditingEnabled:", v3);
    if (v3)
    {
      -[MarkupViewController restoreToolModeForContentType](self, "restoreToolModeForContentType");
    }
    else
    {
      objc_msgSend(v6, "modelController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deselectAllAnnotations");

      objc_msgSend(v6, "resetToDefaultToolMode");
    }
  }

}

- (void)setFormFillingEnabled:(BOOL)a3
{
  -[MarkupViewController setFormFillingEnabled:didUseBanner:](self, "setFormFillingEnabled:didUseBanner:", a3, 0);
}

- (void)setFormFillingEnabled:(BOOL)a3 didUseBanner:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[MarkupViewController _pdfView](self, "_pdfView", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v10 = v6;
    v7 = objc_msgSend(v6, "isInFormFillingMode") == v4;
    v6 = v10;
    if (!v7)
    {
      objc_msgSend(v10, "setInFormFillingMode:", v4);
      v6 = v10;
      if (!v4)
      {
        -[MarkupViewController annotationController](self, "annotationController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "modelController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "deselectAllAnnotations");

        v6 = v10;
      }
    }
  }

}

- (void)restoreToolModeForContentType
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[MarkupViewController annotationController](self, "annotationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (-[MarkupViewController annotationEditingEnabled](self, "annotationEditingEnabled")
    && (-[MarkupViewController contentViewController](self, "contentViewController"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "defaultToolTag"),
        v3,
        v4 != 763000))
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setTag:", v4);
    objc_msgSend(v6, "performActionForSender:", v5);
    if (objc_msgSend(v6, "toolMode") != 4)
      objc_msgSend(v6, "performActionForSender:", v5);

  }
  else
  {
    objc_msgSend(v6, "resetToDefaultToolMode");
  }

}

- (BOOL)annotationEditingEnabled
{
  void *v2;
  char v3;

  -[MarkupViewController annotationController](self, "annotationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "annotationEditingEnabled");

  return v3;
}

- (BOOL)formFillingEnabled
{
  void *v2;
  char v3;

  -[MarkupViewController annotationController](self, "annotationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "formFillingEnabled");

  return v3;
}

- (void)setPencilAlwaysDraws:(BOOL)a3
{
  void *v4;
  int pencilAlwaysDraws;
  id v6;

  self->_pencilAlwaysDraws = objc_msgSend(MEMORY[0x24BE03A30], "canConnectToStylus") & a3;
  -[MarkupViewController annotationController](self, "annotationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pencilAlwaysDraws = self->_pencilAlwaysDraws;
  v6 = v4;
  if (pencilAlwaysDraws != objc_msgSend(v4, "pencilAlwaysDraws"))
    objc_msgSend(v6, "setPencilAlwaysDraws:", self->_pencilAlwaysDraws);

}

- (BOOL)pencilAlwaysDraws
{
  void *v3;
  int pencilAlwaysDraws;
  BOOL v5;

  -[MarkupViewController annotationController](self, "annotationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  pencilAlwaysDraws = self->_pencilAlwaysDraws;
  if (pencilAlwaysDraws != objc_msgSend(v3, "pencilAlwaysDraws"))
    NSLog(&CFSTR("The AKController.pencilAlwaysDraws value is not in sync with MarkupViewController. This probably means someon"
                 "e set the former value directly. Please use MarkupViewController.pencilAlwaysDraws whenever using MarkupUI.").isa);
  v5 = self->_pencilAlwaysDraws;

  return v5;
}

- (void)_saveEditing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[5];
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  void *v37;
  _QWORD v38[3];

  v38[1] = *MEMORY[0x24BDAC8D0];
  -[MarkupViewController extensionContext](self, "extensionContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MarkupViewController outputContentType](self, "outputContentType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUImageDownsamplingUtilities _uniqueTemporaryDirectory](MUImageDownsamplingUtilities, "_uniqueTemporaryDirectory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MarkupViewController preferredFileDisplayName](self, "preferredFileDisplayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredFilenameExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v7, "stringByAppendingPathExtension:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v9;
    }
    else
    {
      NSLog(CFSTR("%s: No preferred file extension. Writing file without file extension."), "-[MarkupViewController _saveEditing:]");
    }
    objc_msgSend(v6, "URLByAppendingPathComponent:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "filePathURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v36);
    v13 = v36;

    if (v13)
      NSLog(CFSTR("Failed to create temporary directory: %@"), v13);
    v35 = 0;
    -[MarkupViewController writeToURL:error:](self, "writeToURL:error:", v11, &v35);
    v14 = v35;
    v15 = v14;
    if (v14)
    {
      NSLog(CFSTR("Failed to write file with error: %@"), v14);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 512, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MarkupViewController extensionContext](self, "extensionContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "cancelRequestWithError:", v16);

      -[MarkupViewController documentDidCloseTeardown](self, "documentDidCloseTeardown");
    }
    else
    {
      v30 = v5;
      v18 = objc_alloc_init(MEMORY[0x24BDD15F0]);
      objc_msgSend((id)*MEMORY[0x24BDF83A8], "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __37__MarkupViewController__saveEditing___block_invoke;
      v33[3] = &unk_24E5D44A8;
      v31 = v11;
      v34 = v31;
      objc_msgSend(v18, "registerItemForTypeIdentifier:loadHandler:", v19, v33);

      v20 = v18;
      v21 = (void *)objc_opt_new();
      v29 = v20;
      v38[0] = v20;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setAttachments:", v22);

      v37 = v21;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[MarkupViewController useFancyTransition](self, "useFancyTransition"))
      {
        -[MarkupViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "path");
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v23, "UTF8String");

        v24 = sandbox_extension_issue_file();
        if (v24)
        {
          v25 = (void *)v24;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          free(v25);
        }
        else
        {
          NSLog(CFSTR("%s Failed to create sandbox extension for path %@"), "-[MarkupViewController _saveEditing:]", v31);
          v26 = 0;
        }
        v5 = v30;
        objc_msgSend(v28, "serviceDidFinishwithResults:andSandboxExtension:", v31, v26);

      }
      else
      {
        -[MarkupViewController extensionContext](self, "extensionContext");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __37__MarkupViewController__saveEditing___block_invoke_2;
        v32[3] = &unk_24E5D44D0;
        v32[4] = self;
        objc_msgSend(v27, "completeRequestReturningItems:completionHandler:", v16, v32);

        v5 = v30;
      }

    }
  }
}

uint64_t __37__MarkupViewController__saveEditing___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0);
}

void __37__MarkupViewController__saveEditing___block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    objc_msgSend(*(id *)(a1 + 32), "documentDidCloseTeardown");
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__MarkupViewController__saveEditing___block_invoke_3;
    block[3] = &unk_24E5D4068;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __37__MarkupViewController__saveEditing___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "documentDidCloseTeardown");
}

- (void)setSourceContent:(id)a3 withArchivedModelData:(id)a4
{
  id v7;
  id v8;
  id *p_sourceContent;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  char isKindOfClass;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  void *v26;
  uint64_t v27;
  int v28;
  void *v29;
  void *v30;
  char v31;
  id v32;
  void *v33;
  id v34;
  _BOOL8 v35;
  _BOOL8 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  objc_class *v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  MUImageReader *v59;
  char v60;
  __int16 v61;
  __int16 v62;

  v7 = a3;
  v8 = a4;
  p_sourceContent = &self->_sourceContent;
  if (self->_sourceContent == v7)
    goto LABEL_67;
  objc_storeStrong(&self->_sourceContent, a3);
  -[MarkupViewController setSourceContentType:](self, "setSourceContentType:", 0);
  -[MarkupViewController setDigestedSourceContent:](self, "setDigestedSourceContent:", 0);
  -[MarkupViewController setPreferredFileDisplayName:](self, "setPreferredFileDisplayName:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend((id)*MEMORY[0x24BDF8438], "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MarkupViewController setSourceContentType:](self, "setSourceContentType:", v10);

    -[MarkupViewController sourceContent](self, "sourceContent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MarkupViewController setDigestedSourceContent:](self, "setDigestedSourceContent:", v11);

    v62 = 0;
    +[MUImageDownsamplingUtilities _shouldFlattenEXIFOrientation:andDownsample:sourceContent:](MUImageDownsamplingUtilities, "_shouldFlattenEXIFOrientation:andDownsample:sourceContent:", (char *)&v62 + 1, &v62, v7);
    if (objc_msgSend((id)objc_opt_class(), "_isInLowMemoryEnvironment"))
    {
      v12 = v62;
    }
    else
    {
      v12 = 0;
      LOBYTE(v62) = 0;
    }
    if (HIBYTE(v62) | v12)
    {
      +[MUImageDownsamplingUtilities _flattenRotation:withDownsampling:sourceImage:](MUImageDownsamplingUtilities, "_flattenRotation:withDownsampling:sourceImage:", HIBYTE(v62) != 0, v12 != 0, v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = v14;

        -[MarkupViewController setSourceContent:](self, "setSourceContent:", v15);
        -[MarkupViewController sourceContent](self, "sourceContent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[MarkupViewController setDigestedSourceContent:](self, "setDigestedSourceContent:", v16);

        -[MarkupViewController _cleanupPlaceholderImage](self, "_cleanupPlaceholderImage");
        v7 = v15;
      }
    }
    v17 = objc_alloc_init(MEMORY[0x24BDD1898]);
    -[MarkupViewController setAkUndoManager:](self, "setAkUndoManager:", v17);
    goto LABEL_63;
  }
  objc_opt_self();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

  }
  else
  {
    objc_opt_self();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      if (v7)
        NSLog(CFSTR("%s: Unsupported source content: %@"), "-[MarkupViewController setSourceContent:withArchivedModelData:]", v7);
      goto LABEL_64;
    }
  }
  +[MUImageDownsamplingUtilities _sourceContentType:](MUImageDownsamplingUtilities, "_sourceContentType:", v7);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v20 = objc_alloc_init(MEMORY[0x24BDD1898]);
    -[MarkupViewController setAkUndoManager:](self, "setAkUndoManager:", v20);

    objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v21, "conformsToType:", *MEMORY[0x24BDF84E0]))
    {
      if (objc_msgSend(v21, "conformsToType:", *MEMORY[0x24BDF8410]))
      {
        v61 = 0;
        +[MUImageDownsamplingUtilities _shouldFlattenEXIFOrientation:andDownsample:sourceContent:](MUImageDownsamplingUtilities, "_shouldFlattenEXIFOrientation:andDownsample:sourceContent:", (char *)&v61 + 1, &v61, v7);
        if (objc_msgSend((id)objc_opt_class(), "_isInLowMemoryEnvironment"))
        {
          v28 = v61;
        }
        else
        {
          v28 = 0;
          LOBYTE(v61) = 0;
        }
        if (HIBYTE(v61) | v28)
        {
          v35 = HIBYTE(v61) != 0;
          v36 = v28 != 0;
          -[MarkupViewController outputContentType](self, "outputContentType");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          +[MUImageDownsamplingUtilities _flattenEXIFOrientation:withDownsampling:sourceContent:withContentType:](MUImageDownsamplingUtilities, "_flattenEXIFOrientation:withDownsampling:sourceContent:withContentType:", v35, v36, v7, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (v38
            || (+[MUImageDownsamplingUtilities _flattenEXIFOrientation:withDownsampling:sourceContent:withContentType:](MUImageDownsamplingUtilities, "_flattenEXIFOrientation:withDownsampling:sourceContent:withContentType:", HIBYTE(v61), v61, v7, *MEMORY[0x24BDF8438]), (v38 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            objc_storeStrong(&self->_sourceContent, v38);
            v34 = v38;

            -[MarkupViewController _cleanupPlaceholderImage](self, "_cleanupPlaceholderImage");
            v7 = v34;
          }
          else
          {
            v34 = 0;
          }
        }
        else
        {
          v34 = 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v59 = objc_alloc_init(MUImageReader);
          v58 = v34;
          if (-[MarkupViewController _sourceImageMayContainBaseImageAndModel](self, "_sourceImageMayContainBaseImageAndModel"))
          {
            v60 = 0;
            -[MarkupViewController sourceContent](self, "sourceContent");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_self();
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_opt_isKindOfClass();

            -[MarkupViewController sourceContent](self, "sourceContent");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v41 & 1) != 0)
            {
              v43 = v59;
              -[MUImageReader readBaseImageFromData:baseWasValid:](v59, "readBaseImageFromData:baseWasValid:", v42, &v60);
            }
            else
            {
              v43 = v59;
              -[MUImageReader readBaseImageFromImageAtURL:baseWasValid:](v59, "readBaseImageFromImageAtURL:baseWasValid:", v42, &v60);
            }
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            if (v44)
            {
              if (v60)
              {
                -[MarkupViewController sourceContent](self, "sourceContent");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_self();
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v49 = objc_opt_isKindOfClass();

                -[MarkupViewController sourceContent](self, "sourceContent");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = v59;
                if ((v49 & 1) != 0)
                  -[MUImageReader readArchivedModelDataFromImageData:](v59, "readArchivedModelDataFromImageData:", v50);
                else
                  -[MUImageReader readArchivedModelDataFromImageURL:](v59, "readArchivedModelDataFromImageURL:", v50);
                v45 = (id)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v45 = 0;
              }
              -[MarkupViewController setDigestedSourceContent:](self, "setDigestedSourceContent:", v44);
            }
            else
            {
              v45 = 0;
            }
          }
          else
          {
            -[MarkupViewController sourceContent](self, "sourceContent");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            -[MarkupViewController setDigestedSourceContent:](self, "setDigestedSourceContent:", v44);
            v45 = 0;
            v43 = v59;
          }

          if (v8)
          {
            v34 = v58;
            if (!v45)
              v45 = v8;
          }
          else
          {
            v34 = v58;
          }
          -[MarkupViewController setArchivedModelData:](self, "setArchivedModelData:", v45);
          -[MarkupViewController setSourceContentType:](self, "setSourceContentType:", v17);
          -[MarkupViewController originalImageDescription](self, "originalImageDescription");
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v51)
          {
            -[MarkupViewController sourceContent](self, "sourceContent");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            +[MUImageReader imageDescriptionFromSourceContent:](MUImageReader, "imageDescriptionFromSourceContent:", v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            -[MarkupViewController setOriginalImageDescription:](self, "setOriginalImageDescription:", v53);

            v43 = v59;
          }

        }
        else
        {
          v46 = (objc_class *)objc_opt_class();
          NSStringFromClass(v46);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("%s: Encountered an image, but source content was not data or URL. (%@)"), "-[MarkupViewController setSourceContent:withArchivedModelData:]", v43);
        }

      }
      goto LABEL_59;
    }
    -[MarkupViewController sourceContent](self, "sourceContent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_opt_isKindOfClass();

    if ((v24 & 1) != 0)
    {
      v25 = objc_alloc(MEMORY[0x24BDE30F0]);
      -[MarkupViewController sourceContent](self, "sourceContent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "initWithURL:", v26);
    }
    else
    {
      -[MarkupViewController sourceContent](self, "sourceContent");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_opt_isKindOfClass();

      if ((v31 & 1) == 0)
      {
LABEL_59:
        -[MarkupViewController sourceContentType](self, "sourceContentType");
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (v54)
        {
          +[MUImageDownsamplingUtilities _preferredFileDisplayNameForSourceContent:](MUImageDownsamplingUtilities, "_preferredFileDisplayNameForSourceContent:", v7);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[MarkupViewController setPreferredFileDisplayName:](self, "setPreferredFileDisplayName:", v55);

        }
        else
        {
          NSLog(CFSTR("%s: Unsupported content type: %@"), "-[MarkupViewController setSourceContent:withArchivedModelData:]", v17);
          -[MarkupViewController _stopObservingAnnotationController](self, "_stopObservingAnnotationController");
          -[MarkupViewController setAkUndoManager:](self, "setAkUndoManager:", 0);
        }

        goto LABEL_63;
      }
      v32 = objc_alloc(MEMORY[0x24BDE30F0]);
      -[MarkupViewController sourceContent](self, "sourceContent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v32, "initWithData:", v26);
    }
    v33 = (void *)v27;

    if (v33)
    {
      -[MarkupViewController setDigestedSourceContent:](self, "setDigestedSourceContent:", v33);
      -[MarkupViewController setSourceContentType:](self, "setSourceContentType:", v17);

    }
    goto LABEL_59;
  }
  NSLog(CFSTR("%s: Failed to get content type for source content: %@"), "-[MarkupViewController setSourceContent:withArchivedModelData:]", v7);
LABEL_63:

LABEL_64:
  if (*p_sourceContent)
  {
    -[MarkupViewController sourceContentType](self, "sourceContentType");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v56)
    {
      NSLog(CFSTR("%s: Clearing source content, since we couldn't determine the type."), "-[MarkupViewController setSourceContent:withArchivedModelData:]");
      v57 = *p_sourceContent;
      *p_sourceContent = 0;

      -[MarkupViewController setDigestedSourceContent:](self, "setDigestedSourceContent:", 0);
    }
  }
LABEL_67:

}

- (void)setPreferredFileDisplayName:(id)a3
{
  NSString *v4;
  NSString *preferredFileDisplayName;
  id v6;

  v6 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(v6, "stringByDeletingPathExtension");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  preferredFileDisplayName = self->_preferredFileDisplayName;
  self->_preferredFileDisplayName = v4;

}

- (id)_pdfView
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[MarkupViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MarkupViewController contentViewController](self, "contentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pdfView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_pdfDocument
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[MarkupViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MarkupViewController contentViewController](self, "contentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pdfDocument");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (int64_t)thumbnailViewStyle
{
  void *v3;
  char isKindOfClass;
  void *v5;
  int64_t v6;

  -[MarkupViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  -[MarkupViewController contentViewController](self, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "thumbnailViewStyle");

  return v6;
}

- (void)setThumbnailViewStyle:(int64_t)a3
{
  void *v5;
  char isKindOfClass;
  id v7;

  -[MarkupViewController contentViewController](self, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MarkupViewController contentViewController](self, "contentViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setThumbnailViewStyle:", a3);

  }
}

- (BOOL)allowsThumbnailViewPageReordering
{
  void *v3;
  char isKindOfClass;
  void *v5;
  char v6;

  -[MarkupViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  -[MarkupViewController contentViewController](self, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowsThumbnailViewPageReordering");

  return v6;
}

- (void)setAllowsThumbnailViewPageReordering:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char isKindOfClass;
  id v7;

  v3 = a3;
  -[MarkupViewController contentViewController](self, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MarkupViewController contentViewController](self, "contentViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsThumbnailViewPageReordering:", v3);

  }
}

- (UIScrollView)contentViewScrollView
{
  void *v2;
  void *v3;

  -[MarkupViewController contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentViewScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIScrollView *)v3;
}

- (UIView)imageViewCombinedContentView
{
  void *v2;
  void *v3;

  -[MarkupViewController contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "combinedContentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (UIView *)v3;
}

- (unint64_t)currentPDFPageIndex
{
  void *v3;
  char isKindOfClass;
  void *v5;
  unint64_t v6;

  -[MarkupViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  -[MarkupViewController annotationController](self, "annotationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "currentPageIndex");

  return v6;
}

- (void)setCurrentPDFPageIndex:(unint64_t)a3
{
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[MarkupViewController contentViewController](self, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MarkupViewController contentViewController](self, "contentViewController");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pdfView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "document");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7 && v8)
    {
      objc_msgSend(v8, "pageAtIndex:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        objc_msgSend(v7, "goToPage:", v10);

    }
  }
}

- (void)setShapeDetectionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_shapeDetectionEnabled != a3)
  {
    v3 = a3;
    self->_shapeDetectionEnabled = a3;
    -[MarkupViewController annotationController](self, "annotationController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShapeDetectionEnabled:", v3);

  }
}

+ (BOOL)hasPrivateImageMetadata:(id)a3
{
  return +[MUImageReader hasPrivateImageMetadata:](MUImageReader, "hasPrivateImageMetadata:", a3);
}

+ (id)cleanImageMetadataFromData:(id)a3
{
  return +[MUImageReader cleanImageMetadataFromData:](MUImageReader, "cleanImageMetadataFromData:", a3);
}

- (id)_markupBlackColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0901960784, 0.0901960784, 0.0901960784, 1.0);
}

- (id)filteredToolbarItemsForItems:(id)a3 fromController:(id)a4
{
  return a3;
}

- (void)setForcesPDFViewTopAlignment:(BOOL)a3
{
  void *v4;
  char isKindOfClass;
  id v6;

  self->_forcesPDFViewTopAlignment = a3;
  -[MarkupViewController contentViewController](self, "contentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MarkupViewController contentViewController](self, "contentViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setForcesPDFViewTopAlignment:", -[MarkupViewController forcesPDFViewTopAlignment](self, "forcesPDFViewTopAlignment"));

  }
}

+ (id)markupBarButtonItemWithTarget:(id)a3 action:(SEL)a4
{
  return (id)objc_msgSend(MEMORY[0x24BE03A30], "markupBarButtonItemWithTarget:action:", a3, a4);
}

- (void)setShowShareButtonInToolbar:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  self->_showShareButtonInToolbar = a3;
  v3 = !a3;
  -[MarkupViewController annotationController](self, "annotationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modernToolbarView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShareButtonHidden:", v3);

}

- (AKController)annotationController
{
  void *v2;
  void *v3;

  -[MarkupViewController contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "annotationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AKController *)v3;
}

+ (BOOL)_isInLowMemoryEnvironment
{
  return objc_msgSend(MEMORY[0x24BE03A30], "_isInLowMemoryEnvironment");
}

+ (double)_maxImageDimensionInView
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  if (v4 < v6)
    v4 = v6;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nativeScale");
  v9 = v4 * floor(v8);

  return fmax(v9, 1500.0);
}

- (BOOL)_sourceImageMayContainBaseImageAndModel
{
  return 1;
}

- (void)_setupInitialBaseModelScaleFactorWithScreenSize:(CGSize)a3 windowDecorationSize:(CGSize)a4
{
  double height;
  double width;
  double v6;
  double v7;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;

  height = a4.height;
  width = a4.width;
  v6 = a3.height;
  v7 = a3.width;
  -[MarkupViewController contentViewController](self, "contentViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "idealContentSizeForScreenSize:windowDecorationSize:", v7, v6, width, height);
  v11 = v10;

  -[MarkupViewController contentViewController](self, "contentViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentSize");
  v14 = v13;

  -[MarkupViewController setInitialContentScale:](self, "setInitialContentScale:", v14 / v11);
}

- (BOOL)_shouldShowUndoRedoButtonsInNavigationBar
{
  void *v3;
  BOOL v4;
  void *v5;

  -[MarkupViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "horizontalSizeClass") == 1)
  {
    v4 = 1;
  }
  else
  {
    -[MarkupViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "userInterfaceIdiom") == 0;

  }
  return v4;
}

- (void)_updateundoBarButtonWithController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  id v18;

  v18 = a3;
  -[MarkupViewController extensionContext](self, "extensionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (-[MarkupViewController _shouldShowUndoRedoButtonsInNavigationBar](self, "_shouldShowUndoRedoButtonsInNavigationBar"))
    {
      -[MarkupViewController undoManager](self, "undoManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(v4, "setUndoManagerForBarButtons:", v5);

  }
  -[MarkupViewController navItem](self, "navItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MarkupViewController navItem](self, "navItem");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MarkupViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
LABEL_18:
      v9 = 0;
      goto LABEL_27;
    }
    -[MarkupViewController navigationItem](self, "navigationItem");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  if (!v7)
    goto LABEL_18;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rightBarButtonItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "rightBarButtonItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v11);

  }
  if (v18)
  {
    objc_msgSend(v18, "annotationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "toolbarButtonItemOfType:", 10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "annotationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "toolbarButtonItemOfType:", 11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[MarkupViewController _useLegacyToolbar](self, "_useLegacyToolbar"))
    {
      if (v13 && (objc_msgSend(v9, "containsObject:", v13) & 1) == 0)
        objc_msgSend(v9, "addObject:", v13);
      goto LABEL_26;
    }
    -[MarkupViewController toolbar](self, "toolbar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[MarkupViewController _shouldShowUndoRedoButtonsInNavigationBar](self, "_shouldShowUndoRedoButtonsInNavigationBar");
    if (v17)
    {
      if (!v13 || !v15)
        goto LABEL_25;
      objc_msgSend(v9, "removeObjectIdenticalTo:", v13);
      objc_msgSend(v9, "removeObjectIdenticalTo:", v15);
      objc_msgSend(v9, "addObject:", v15);
      objc_msgSend(v9, "addObject:", v13);
    }
    else
    {
      objc_msgSend(v9, "removeObject:", v13);
      objc_msgSend(v9, "removeObject:", v15);
    }
    objc_msgSend(v16, "setUndoRedoButtonsHidden:", v17);
LABEL_25:

LABEL_26:
  }
LABEL_27:
  objc_msgSend(v8, "setRightBarButtonItems:", v9);

}

- (void)_presentPlaceholderImage
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
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
  id v24;

  -[MarkupViewController placeholderImage](self, "placeholderImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MarkupViewController contentViewController](self, "contentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MarkupViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visibleContentRectInCoordinateSpace:", v5);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    -[MarkupViewController placeholderImageView](self, "placeholderImageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

    -[MarkupViewController placeholderImage](self, "placeholderImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MarkupViewController placeholderImageView](self, "placeholderImageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setImage:", v15);

    -[MarkupViewController annotationController](self, "annotationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "toolbarView");
    v24 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "superview");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MarkupViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[MarkupViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MarkupViewController placeholderImageView](self, "placeholderImageView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 == v19)
    {
      -[MarkupViewController annotationController](self, "annotationController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "toolbarView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "insertSubview:belowSubview:", v21, v23);

    }
    else
    {
      objc_msgSend(v20, "addSubview:", v21);
    }

  }
}

- (void)_cleanupPlaceholderImage
{
  void *v3;

  -[MarkupViewController placeholderImageView](self, "placeholderImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[MarkupViewController setPlaceholderImageView:](self, "setPlaceholderImageView:", 0);
  -[MarkupViewController setPlaceholderImage:](self, "setPlaceholderImage:", 0);
}

- (void)_startObservingAnnotationController
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  id v6;

  -[MarkupViewController annotationController](self, "annotationController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[MarkupViewController isObservingAKCurrentPageIndex](self, "isObservingAKCurrentPageIndex");

    if (!v5)
    {
      -[MarkupViewController setObservingAKCurrentPageIndex:](self, "setObservingAKCurrentPageIndex:", 1);
      -[MarkupViewController annotationController](self, "annotationController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("currentPageIndex"), 11, CFSTR("MUVCcurrentPageObservationContext"));

    }
  }
}

- (void)_stopObservingAnnotationController
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  id v6;

  -[MarkupViewController annotationController](self, "annotationController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[MarkupViewController isObservingAKCurrentPageIndex](self, "isObservingAKCurrentPageIndex");

    if (v5)
    {
      -[MarkupViewController setObservingAKCurrentPageIndex:](self, "setObservingAKCurrentPageIndex:", 0);
      -[MarkupViewController annotationController](self, "annotationController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("currentPageIndex"), CFSTR("MUVCcurrentPageObservationContext"));

    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v22;

  v10 = a5;
  v11 = v10;
  if (a6 == CFSTR("MUVCcurrentPageObservationContext"))
  {
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDD0E78]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    if (v13)
    {
      -[MarkupViewController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("currentPDFPageIndex"));
      goto LABEL_16;
    }
    -[MarkupViewController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("currentPDFPageIndex"));
    -[MarkupViewController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (-[MarkupViewController contentViewController](self, "contentViewController"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v15,
          (isKindOfClass & 1) == 0))
    {
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BDD0E80]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = objc_msgSend(v18, "unsignedIntegerValue");
      if (v17)
      {
LABEL_9:
        v21 = objc_msgSend(v17, "unsignedIntegerValue");
LABEL_12:
        if (v20 != v21)
          objc_msgSend(v14, "controller:didChangeToPDFPageIndex:", self);

        goto LABEL_15;
      }
    }
    else
    {
      v20 = 0x7FFFFFFFFFFFFFFFLL;
      if (v17)
        goto LABEL_9;
    }
    v21 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_12;
  }
  v22.receiver = self;
  v22.super_class = (Class)MarkupViewController;
  -[MarkupViewController observeValueForKeyPath:ofObject:change:context:](&v22, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, v10, a6);
LABEL_16:

}

- (void)_installContentViewControllerForUTI:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MUPDFContentViewController *v8;
  MUImageContentViewController *v9;
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
  id v23;

  v23 = a3;
  -[MarkupViewController contentContainerView](self, "contentContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[MarkupViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MarkupViewController setContentContainerView:](self, "setContentContainerView:", v5);

  }
  if (v23)
  {
    objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (!objc_msgSend(v6, "conformsToType:", *MEMORY[0x24BDF84E0]))
  {
    if (objc_msgSend(v6, "conformsToType:", *MEMORY[0x24BDF8410]))
    {
      v9 = [MUImageContentViewController alloc];
      -[MarkupViewController digestedSourceContent](self, "digestedSourceContent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MarkupViewController archivedModelData](self, "archivedModelData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[MUImageContentViewController initWithSourceContent:archivedDataModel:delegate:](v9, "initWithSourceContent:archivedDataModel:delegate:", v10, v11, self);

      -[MUPDFContentViewController setInkStyle:](v8, "setInkStyle:", -[MarkupViewController inkStyle](self, "inkStyle"));
      if (v8)
        goto LABEL_11;
    }
    else
    {
      NSLog(CFSTR("%s: Unexpected content type: %@"), "-[MarkupViewController _installContentViewControllerForUTI:]", v23);
    }
LABEL_23:
    NSLog(CFSTR("Failed to load file! Unable to determine content type for type: %@"), v23);
    goto LABEL_24;
  }
  -[MarkupViewController digestedSourceContent](self, "digestedSourceContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MUPDFContentViewController initWithPDFDocument:delegate:]([MUPDFContentViewController alloc], "initWithPDFDocument:delegate:", v7, self);
  -[MUPDFContentViewController setInkStyle:](v8, "setInkStyle:", -[MarkupViewController inkStyle](self, "inkStyle"));

  if (!v8)
    goto LABEL_23;
LABEL_11:
  -[MarkupViewController setContentViewController:](self, "setContentViewController:", v8);
  -[MarkupViewController contentViewController](self, "contentViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MarkupViewController addChildViewController:](self, "addChildViewController:", v12);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MUPDFContentViewController setShowsThumbnailView:](v8, "setShowsThumbnailView:", !self->_thumbnailViewHidden);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MUPDFContentViewController setCentersIgnoringContentInsets:](v8, "setCentersIgnoringContentInsets:", -[MarkupViewController centersIgnoringContentInsets](self, "centersIgnoringContentInsets"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MUPDFContentViewController setNavigationModeHorizontal:](v8, "setNavigationModeHorizontal:", -[MarkupViewController isNavigationModeHorizontal](self, "isNavigationModeHorizontal"));
  -[MUPDFContentViewController setup](v8, "setup");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "_maxImageDimensionInView");
    -[MUPDFContentViewController setMaxImageDimension:](v8, "setMaxImageDimension:");
  }
  -[MarkupViewController contentViewController](self, "contentViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MarkupViewController _effectiveBackgroundColor](self, "_effectiveBackgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v15);

  -[MarkupViewController contentContainerView](self, "contentContainerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "insertSubview:atIndex:", v14, 0);

  if (-[MarkupViewController useFancyTransition](self, "useFancyTransition"))
    objc_msgSend(v14, "setAlpha:", 0.0);
  -[MarkupViewController contentViewController](self, "contentViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "didMoveToParentViewController:", self);

  _NSDictionaryOfVariableBindings(CFSTR("contentView"), v14, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[contentView]|"), 0, 0, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activateConstraints:", v20);

  v21 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[contentView]|"), 0, 0, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v22);

LABEL_24:
}

- (void)_setupAnnotationController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;

  -[MarkupViewController annotationController](self, "annotationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v3;
  if (v3)
  {
    objc_msgSend(v3, "legacyDoodleController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPreferDoodle:", 1);

    objc_msgSend(v42, "legacyDoodleController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCoalescesDoodles:", 1);

    objc_msgSend(v42, "setSelectNewlyCreatedAnnotations:", 1);
    objc_msgSend(v42, "setShapeDetectionEnabled:", -[MarkupViewController isShapeDetectionEnabled](self, "isShapeDetectionEnabled"));
    objc_msgSend(v42, "setIsUsedOnDarkBackground:", -[MarkupViewController isUsedOnDarkBackground](self, "isUsedOnDarkBackground"));
    objc_msgSend(v42, "attributeController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "strokeColorIsEqualTo:", v7);

    if (v8)
    {
      objc_msgSend(v42, "attributeController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "restoreStrokeColorToSystemDefault");

    }
    if (-[MarkupViewController _useLegacyToolbar](self, "_useLegacyToolbar"))
    {
      objc_msgSend(v42, "toolbarViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MarkupViewController addChildViewController:](self, "addChildViewController:", v10);
      objc_msgSend(v10, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDelegate:", self);

      objc_msgSend(v10, "beginAppearanceTransition:animated:", 1, 0);
      -[MarkupViewController contentContainerView](self, "contentContainerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", v13);

      objc_msgSend(v10, "didMoveToParentViewController:", self);
      objc_msgSend(v10, "endAppearanceTransition");
      objc_msgSend(v42, "toolbarView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MarkupViewController setToolbar:](self, "setToolbar:", v14);

      v15 = -[MarkupViewController isToolbarHidden](self, "isToolbarHidden");
      -[MarkupViewController toolbar](self, "toolbar");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setHidden:", v15);

      -[MarkupViewController toolbar](self, "toolbar");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[MarkupViewController _effectiveToolbarTintColor](self, "_effectiveToolbarTintColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBarTintColor:", v18);

      -[MarkupViewController _effectiveToolbarItemTintColor](self, "_effectiveToolbarItemTintColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTintColor:", v19);

      if (-[MarkupViewController useFancyTransition](self, "useFancyTransition"))
      {
        -[MarkupViewController toolbar](self, "toolbar");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setAlpha:", 0.0);

        objc_msgSend(v10, "floatingAttributeToolbarContainer");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setAlpha:", 0.0);

      }
      -[MarkupViewController toolbar](self, "toolbar");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "leadingAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[MarkupViewController contentContainerView](self, "contentContainerView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "leadingAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setActive:", 1);

      -[MarkupViewController toolbar](self, "toolbar");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "trailingAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[MarkupViewController contentContainerView](self, "contentContainerView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "trailingAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setActive:", 1);

      -[MarkupViewController toolbar](self, "toolbar");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v33) = 1148846080;
      objc_msgSend(v32, "setContentHuggingPriority:forAxis:", 1, v33);

      -[MarkupViewController _updateConstraintsForBarPosition:](self, "_updateConstraintsForBarPosition:", self->_toolbarPosition);
    }
    else
    {
      -[MarkupViewController modernToolbar](self, "modernToolbar");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setAnnotationController:", v42);

      v35 = -[MarkupViewController showShareButtonInToolbar](self, "showShareButtonInToolbar") ^ 1;
      -[MarkupViewController modernToolbar](self, "modernToolbar");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setShareButtonHidden:", v35);

      -[MarkupViewController modernToolbar](self, "modernToolbar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MarkupViewController setToolbar:](self, "setToolbar:", v10);
    }

    objc_msgSend(v42, "setRulerHostingDelegate:", self);
    -[MarkupViewController adjustContentInsetsForBars](self, "adjustContentInsetsForBars");
    if (-[MarkupViewController needsToolPickerVisibleWhenAnnotationControllerIsAvailable](self, "needsToolPickerVisibleWhenAnnotationControllerIsAvailable"))
    {
      -[MarkupViewController annotationController](self, "annotationController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "toolPicker");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setVisible:forFirstResponder:", 1, self);

      -[AKToolbarView setContentsHidden:](self->_modernToolbar, "setContentsHidden:", 0);
      -[MarkupViewController setNeedsToolPickerVisibleWhenAnnotationControllerIsAvailable:](self, "setNeedsToolPickerVisibleWhenAnnotationControllerIsAvailable:", 0);
    }
    -[MarkupViewController contentViewController](self, "contentViewController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "view");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "layoutSubviews");

    -[MarkupViewController view](self, "view");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "layoutSubviews");

  }
  else
  {
    NSLog(CFSTR("Failed to load AKController!"));
  }

}

- (BOOL)rulerHostWantsSharedRuler
{
  return 1;
}

- (void)_createCancelDoneNavBar
{
  void *v3;
  id v4;
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
  id v17;
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
  void *v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  -[MarkupViewController navBar](self, "navBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6BE0]);
    v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "setDelegate:", self);
    -[MarkupViewController contentContainerView](self, "contentContainerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v5);

    -[MarkupViewController setNavBar:](self, "setNavBar:", v5);
    -[MarkupViewController _updateNavBarProperties](self, "_updateNavBarProperties");
    if (-[MarkupViewController useFancyTransition](self, "useFancyTransition"))
    {
      -[MarkupViewController navBar](self, "navBar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAlpha:", 0.0);

    }
    _NSDictionaryOfVariableBindings(CFSTR("navBar"), v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MarkupViewController contentContainerView](self, "contentContainerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[navBar]|"), 0, 0, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addConstraints:", v10);

    if (-[MarkupViewController showAsFormSheet](self, "showAsFormSheet")
      && -[MarkupViewController useFancyTransition](self, "useFancyTransition"))
    {
      v11 = (void *)MEMORY[0x24BDD1628];
      -[MarkupViewController contentContainerView](self, "contentContainerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 3, 0, v12, 3, 1.0, 0.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "topAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MarkupViewController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "safeAreaLayoutGuide");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "topAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:", v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v13, "setActive:", 1);
    v17 = objc_alloc(MEMORY[0x24BDF6C00]);
    -[MarkupViewController title](self, "title");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithTitle:", v18);
    -[MarkupViewController setNavItem:](self, "setNavItem:", v19);

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel_);
    -[MarkupViewController setCancelButton:](self, "setCancelButton:", v20);

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_done_);
    -[MarkupViewController setDoneButton:](self, "setDoneButton:", v21);

    -[MarkupViewController navItem](self, "navItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MarkupViewController cancelButton](self, "cancelButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setLeftBarButtonItems:", v24);

    -[MarkupViewController navItem](self, "navItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MarkupViewController doneButton](self, "doneButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setRightBarButtonItem:", v26);

    -[MarkupViewController navItem](self, "navItem");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v27;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setItems:", v28);

  }
}

- (void)adjustContentInsetsForBars
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  unint64_t toolbarPosition;
  BOOL v31;
  unint64_t v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  id v44;
  CGRect v45;
  CGRect v46;

  -[MarkupViewController delegate](self, "delegate");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v44, "customEdgeInsets");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    if (-[MarkupViewController _useLegacyToolbar](self, "_useLegacyToolbar"))
    {
      -[MarkupViewController annotationController](self, "annotationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "toolbarViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "visibleHeightOfAttributeBar");
      v8 = v8 + v13;
LABEL_10:

    }
  }
  else
  {
    v14 = (double *)MEMORY[0x24BDF7718];
    v6 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v10 = *(double *)(MEMORY[0x24BDF7718] + 24);
    -[MarkupViewController navBar](self, "navBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      if (!-[MarkupViewController showAsFormSheet](self, "showAsFormSheet")
        || (v16 = 0.0, !-[MarkupViewController useFancyTransition](self, "useFancyTransition")))
      {
        -[MarkupViewController view](self, "view");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "safeAreaInsets");
        v16 = v18;

      }
      -[MarkupViewController navBar](self, "navBar");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "frame");
      v4 = v16 + v20;

      if (!-[MarkupViewController _useLegacyToolbar](self, "_useLegacyToolbar"))
      {
        -[MarkupViewController modernToolbar](self, "modernToolbar");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[MarkupViewController view](self, "view");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "bounds");
        objc_msgSend(v36, "sizeThatFits:", CGRectGetWidth(v45), 1000.0);

        v8 = 0.0;
        goto LABEL_17;
      }
      -[MarkupViewController annotationController](self, "annotationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "toolbarViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "heightIncludingAdditionalVisibleBars");
      v8 = v21;
      goto LABEL_10;
    }
    v22 = *v14;
    v23 = v14[2];
    -[MarkupViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "safeAreaInsets");
    v26 = v25;

    v4 = v22 + fmax(v26, 0.0);
    -[MarkupViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "safeAreaInsets");
    v29 = v28;

    v8 = v23 + fmax(v29, 0.0);
    if (-[MarkupViewController isToolbarHidden](self, "isToolbarHidden"))
      goto LABEL_17;
    toolbarPosition = self->_toolbarPosition;
    v31 = toolbarPosition >= 2;
    v32 = toolbarPosition - 2;
    if (!v31)
    {
      if (-[MarkupViewController _useLegacyToolbar](self, "_useLegacyToolbar"))
      {
        -[MarkupViewController annotationController](self, "annotationController");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "toolbarViewController");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "heightIncludingAdditionalVisibleBars");
        v42 = v41;

        v8 = v8 + v42;
        goto LABEL_17;
      }
      -[MarkupViewController modernToolbar](self, "modernToolbar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MarkupViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      objc_msgSend(v11, "sizeThatFits:", CGRectGetWidth(v46), 1000.0);
      v8 = v43;
      goto LABEL_10;
    }
    if (v32 <= 1)
    {
      -[MarkupViewController toolbar](self, "toolbar");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "frame");
      v35 = v34;

      v4 = v4 + v35;
    }
  }
LABEL_17:
  -[MarkupViewController contentViewController](self, "contentViewController");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setEdgeInsets:", v4, v6, v8, v10);

}

- (void)_updateConstraintsForBarPosition:(int64_t)a3
{
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
  id v27;

  -[MarkupViewController toolbarTopConstraint](self, "toolbarTopConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 0);

  -[MarkupViewController toolbarTopAttachedConstraint](self, "toolbarTopAttachedConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 0);

  -[MarkupViewController toolbarBottomConstraint](self, "toolbarBottomConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 0);

  if ((unint64_t)a3 < 2)
  {
    -[MarkupViewController toolbarBottomConstraint](self, "toolbarBottomConstraint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      -[MarkupViewController toolbar](self, "toolbar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bottomAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MarkupViewController view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bottomAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MarkupViewController setToolbarBottomConstraint:](self, "setToolbarBottomConstraint:", v19);

    }
    -[MarkupViewController toolbarBottomConstraint](self, "toolbarBottomConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 3)
  {
    -[MarkupViewController toolbarTopAttachedConstraint](self, "toolbarTopAttachedConstraint");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      -[MarkupViewController toolbar](self, "toolbar");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "topAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[MarkupViewController view](self, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "safeAreaLayoutGuide");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "topAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[MarkupViewController setToolbarTopAttachedConstraint:](self, "setToolbarTopAttachedConstraint:", v26);

    }
    -[MarkupViewController toolbarTopAttachedConstraint](self, "toolbarTopAttachedConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 != 2)
      return;
    -[MarkupViewController toolbarTopConstraint](self, "toolbarTopConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = (void *)MEMORY[0x24BDD1628];
      -[MarkupViewController toolbar](self, "toolbar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MarkupViewController contentContainerView](self, "contentContainerView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 3, 0, v11, 3, 1.0, 0.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MarkupViewController setToolbarTopConstraint:](self, "setToolbarTopConstraint:", v12);

    }
    -[MarkupViewController toolbarTopConstraint](self, "toolbarTopConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27 = v13;
  objc_msgSend(v13, "setActive:", 1);

}

- (void)_updateAppearanceForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
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

  v4 = a3;
  -[MarkupViewController contentViewController](self, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alpha");
  v8 = v7;

  if (v8 == 1.0)
  {
    -[MarkupViewController _effectiveBackgroundColor](self, "_effectiveBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MarkupViewController contentContainerView](self, "contentContainerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v9);

  }
  -[MarkupViewController _effectiveBackgroundColor](self, "_effectiveBackgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MarkupViewController contentViewController](self, "contentViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v11);

  if (-[MarkupViewController _useLegacyToolbar](self, "_useLegacyToolbar"))
  {
    -[MarkupViewController annotationController](self, "annotationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "toolbarViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[MarkupViewController _effectiveToolbarTintColor](self, "_effectiveToolbarTintColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBarTintColor:", v16);

    -[MarkupViewController _effectiveToolbarItemTintColor](self, "_effectiveToolbarItemTintColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTintColor:", v17);

  }
  -[MarkupViewController _updateNavBarProperties](self, "_updateNavBarProperties");
  -[MarkupViewController annotationController](self, "annotationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "toolbarViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "traitCollectionDidChange:", v4);

  -[MarkupViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
}

- (void)setNavBar:(id)a3
{
  UINavigationBar *v5;
  UINavigationBar *v6;

  v5 = (UINavigationBar *)a3;
  if (self->_navBar != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_navBar, a3);
    -[MarkupViewController _updateNavBarProperties](self, "_updateNavBarProperties");
    v5 = v6;
  }

}

- (void)_updateNavBarProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  -[MarkupViewController _effectiveToolbarTintColor](self, "_effectiveToolbarTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MarkupViewController navBar](self, "navBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBarTintColor:", v3);

  -[MarkupViewController _effectiveNavBarTitleColor](self, "_effectiveNavBarTitleColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v8 = *MEMORY[0x24BDF6600];
    -[MarkupViewController _effectiveNavBarTitleColor](self, "_effectiveNavBarTitleColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[MarkupViewController navBar](self, "navBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitleTextAttributes:", v6);

  if (v5)
  {

  }
}

- (void)setBackgroundColor:(id)a3
{
  void *v4;
  char v5;
  UIColor *v6;
  UIColor *backgroundColor;
  UIColor *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[MarkupViewController backgroundColor](self, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v11);

  if ((v5 & 1) == 0)
  {
    v6 = (UIColor *)objc_msgSend(v11, "copy");
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v6;

    v8 = self->_backgroundColor;
    -[MarkupViewController contentViewController](self, "contentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v8);

  }
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (id)_effectiveBackgroundColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[MarkupViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom") == 1)
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  else
    -[MarkupViewController _markupBlackColor](self, "_markupBlackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MarkupViewController backgroundColor](self, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MarkupViewController backgroundColor](self, "backgroundColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

- (UIColor)toolbarItemTintColor
{
  return self->_toolbarItemTintColor;
}

- (void)setToolbarItemTintColor:(id)a3
{
  void *v4;
  char v5;
  UIColor *v6;
  UIColor *toolbarItemTintColor;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[MarkupViewController toolbarItemTintColor](self, "toolbarItemTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v10);

  if ((v5 & 1) == 0 && -[MarkupViewController _useLegacyToolbar](self, "_useLegacyToolbar"))
  {
    v6 = (UIColor *)objc_msgSend(v10, "copy");
    toolbarItemTintColor = self->_toolbarItemTintColor;
    self->_toolbarItemTintColor = v6;

    -[MarkupViewController annotationController](self, "annotationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "toolbarViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setTintColor:", v10);
  }

}

- (id)_effectiveToolbarItemTintColor
{
  void *v3;
  UIColor *v4;
  UIColor *toolbarItemTintColor;
  UIColor *v6;

  -[MarkupViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom") == 1)
    objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v4 = (UIColor *)objc_claimAutoreleasedReturnValue();

  if (self->_toolbarItemTintColor)
    toolbarItemTintColor = self->_toolbarItemTintColor;
  else
    toolbarItemTintColor = v4;
  v6 = toolbarItemTintColor;

  return v6;
}

- (UIColor)toolbarTintColor
{
  return self->_toolbarTintColor;
}

- (void)setToolbarTintColor:(id)a3
{
  void *v4;
  char v5;
  UIColor *v6;
  UIColor *toolbarTintColor;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[MarkupViewController toolbarTintColor](self, "toolbarTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v10);

  if ((v5 & 1) == 0 && -[MarkupViewController _useLegacyToolbar](self, "_useLegacyToolbar"))
  {
    v6 = (UIColor *)objc_msgSend(v10, "copy");
    toolbarTintColor = self->_toolbarTintColor;
    self->_toolbarTintColor = v6;

    -[MarkupViewController annotationController](self, "annotationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "toolbarViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setBarTintColor:", self->_toolbarTintColor);
  }

}

- (id)_effectiveToolbarTintColor
{
  void *v3;
  UIColor *v4;
  UIColor *toolbarTintColor;
  UIColor *v6;

  -[MarkupViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom") == 1)
  {
    v4 = 0;
  }
  else
  {
    -[MarkupViewController _markupBlackColor](self, "_markupBlackColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }

  toolbarTintColor = v4;
  if (self->_toolbarItemTintColor)
    toolbarTintColor = self->_toolbarTintColor;
  v6 = toolbarTintColor;

  return v6;
}

- (UIColor)navBarTitleColor
{
  return self->_navBarTitleColor;
}

- (void)setNavBarTitleColor:(id)a3
{
  id v4;
  void *v5;
  char v6;
  UIColor *v7;
  UIColor *navBarTitleColor;
  UIColor *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MarkupViewController navBarTitleColor](self, "navBarTitleColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (UIColor *)objc_msgSend(v4, "copy");
    navBarTitleColor = self->_navBarTitleColor;
    self->_navBarTitleColor = v7;

    v9 = self->_navBarTitleColor;
    if (v9)
    {
      v12 = *MEMORY[0x24BDF6600];
      v13[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    -[MarkupViewController navBar](self, "navBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitleTextAttributes:", v10);

    if (v9)
  }

}

- (id)_effectiveNavBarTitleColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[MarkupViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom") == 1)
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MarkupViewController navBarTitleColor](self, "navBarTitleColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MarkupViewController navBarTitleColor](self, "navBarTitleColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

- (BOOL)isUsedOnDarkBackground
{
  return 0;
}

- (void)delete:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MarkupViewController annotationController](self, "annotationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "validateDelete:", v7);

  if (v5)
  {
    -[MarkupViewController annotationController](self, "annotationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delete:", v7);

  }
}

- (void)duplicate:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MarkupViewController annotationController](self, "annotationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "validateDuplicate:", v7);

  if (v5)
  {
    -[MarkupViewController annotationController](self, "annotationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "duplicate:", v7);

  }
}

- (void)editTextAnnotation:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MarkupViewController annotationController](self, "annotationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "validateEditTextAnnotation:", v7);

  if (v5)
  {
    -[MarkupViewController annotationController](self, "annotationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "editTextAnnotation:", v7);

  }
}

- (void)motionEnded:(int64_t)a3 withEvent:(id)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;
  objc_super v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  id from;
  id location[2];

  v6 = a4;
  v7 = -[MarkupViewController allowShakeToUndo](self, "allowShakeToUndo");
  if (a3 == 1 && v7)
  {
    -[MarkupViewController annotationController](self, "annotationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "validateUndo:", 0);

    -[MarkupViewController annotationController](self, "annotationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "validateRedo:", 0);

    -[MarkupViewController annotationController](self, "annotationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(location, v12);

    objc_initWeak(&from, self);
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __46__MarkupViewController_motionEnded_withEvent___block_invoke;
    v44[3] = &unk_24E5D40B8;
    objc_copyWeak(&v45, &from);
    v13 = (void *)MEMORY[0x2207DC5F0](v44);
    if ((v9 & 1) != 0 || v11)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Undo"), &stru_24E5D4C60, CFSTR("MarkupViewController"));
      v15 = objc_claimAutoreleasedReturnValue();
      v33 = v13;

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Redo"), &stru_24E5D4C60, CFSTR("MarkupViewController"));
      v17 = objc_claimAutoreleasedReturnValue();

      v31 = (void *)v17;
      v32 = (void *)v15;
      if (v9)
        v18 = (void *)v15;
      else
        v18 = (void *)v17;
      v30 = v18;
      objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x24BDF67E8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_24E5D4C60, CFSTR("MarkupViewController"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x24BDAC760];
      v42[1] = 3221225472;
      v42[2] = __46__MarkupViewController_motionEnded_withEvent___block_invoke_2;
      v42[3] = &unk_24E5D44F8;
      v23 = v33;
      v43 = v23;
      objc_msgSend(v20, "actionWithTitle:style:handler:", v22, 1, v42);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addAction:", v24);

      v25 = MEMORY[0x24BDAC760];
      if (v9)
      {
        v26 = (void *)MEMORY[0x24BDF67E8];
        v39[0] = MEMORY[0x24BDAC760];
        v39[1] = 3221225472;
        v39[2] = __46__MarkupViewController_motionEnded_withEvent___block_invoke_3;
        v39[3] = &unk_24E5D4520;
        objc_copyWeak(&v41, location);
        v40 = v23;
        objc_msgSend(v26, "actionWithTitle:style:handler:", v32, 0, v39);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addAction:", v27);

        objc_destroyWeak(&v41);
      }
      if (v11)
      {
        v28 = (void *)MEMORY[0x24BDF67E8];
        v36[0] = v25;
        v36[1] = 3221225472;
        v36[2] = __46__MarkupViewController_motionEnded_withEvent___block_invoke_4;
        v36[3] = &unk_24E5D4520;
        objc_copyWeak(&v38, location);
        v37 = v23;
        objc_msgSend(v28, "actionWithTitle:style:handler:", v31, 0, v36);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addAction:", v29);

        objc_destroyWeak(&v38);
      }
      -[MarkupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v19, 1, 0);

      v13 = v33;
    }

    objc_destroyWeak(&v45);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);
  }
  else
  {
    v35.receiver = self;
    v35.super_class = (Class)MarkupViewController;
    if (-[MarkupViewController respondsToSelector:](&v35, sel_respondsToSelector_, sel_motionEnded_withEvent_))
    {
      v34.receiver = self;
      v34.super_class = (Class)MarkupViewController;
      -[MarkupViewController motionEnded:withEvent:](&v34, sel_motionEnded_withEvent_, a3, v6);
    }
  }

}

void __46__MarkupViewController_motionEnded_withEvent___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "becomeFirstResponder");

}

uint64_t __46__MarkupViewController_motionEnded_withEvent___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __46__MarkupViewController_motionEnded_withEvent___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(WeakRetained, "undo:", 0);

}

void __46__MarkupViewController_motionEnded_withEvent___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(WeakRetained, "redo:", 0);

}

- (void)_showTextStyleOptions:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MarkupViewController annotationController](self, "annotationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "validateShowAttributeInspector:", v7);

  if (v5)
  {
    -[MarkupViewController annotationController](self, "annotationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "showAttributeInspector:", v7);

  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;
  char v9;
  objc_super v11;

  v6 = a4;
  if (sel__showTextStyleOptions_ == a3)
  {
    -[MarkupViewController annotationController](self, "annotationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "validateShowAttributeInspector:", v6);
LABEL_10:
    v7 = v9;

    goto LABEL_11;
  }
  if (sel_editTextAnnotation_ == a3)
  {
    -[MarkupViewController annotationController](self, "annotationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "validateEditTextAnnotation:", v6);
    goto LABEL_10;
  }
  if (sel_duplicate_ == a3)
  {
    -[MarkupViewController annotationController](self, "annotationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "validateDuplicate:", v6);
    goto LABEL_10;
  }
  if (sel_delete_ == a3)
  {
    -[MarkupViewController annotationController](self, "annotationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "validateDelete:", v6);
    goto LABEL_10;
  }
  v11.receiver = self;
  v11.super_class = (Class)MarkupViewController;
  v7 = -[MarkupViewController canPerformAction:withSender:](&v11, sel_canPerformAction_withSender_, a3, v6);
LABEL_11:

  return v7;
}

- (void)positionSketchOverlay:(id)a3 forContentViewController:(id)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double x;
  double y;
  double width;
  double height;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  v49 = a3;
  -[MarkupViewController toolbar](self, "toolbar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[MarkupViewController sketchOverlayInsets](self, "sketchOverlayInsets");
  v16 = v8 + v15;
  v18 = v10 + v17;
  v20 = v12 - (v15 + v19);
  v22 = v14 - (v17 + v21);
  NSClassFromString(CFSTR("AKSmoothPathView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MarkupViewController contentViewController](self, "contentViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "visibleContentRectInCoordinateSpace:", v6);
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;

    -[MarkupViewController contentViewController](self, "contentViewController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "convertRect:toView:", v6, v25, v27, v29, v31);
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v41 = v40;

    v50.origin.x = v16;
    v50.origin.y = v18;
    v50.size.width = v20;
    v50.size.height = v22;
    v54.origin.x = v35;
    v54.origin.y = v37;
    v54.size.width = v39;
    v54.size.height = v41;
    v51 = CGRectIntersection(v50, v54);
    x = v51.origin.x;
    y = v51.origin.y;
    width = v51.size.width;
    height = v51.size.height;
    if (!CGRectIsNull(v51))
    {
      v22 = height;
      v20 = width;
      v18 = y;
      v16 = x;
    }
  }
  objc_msgSend(v6, "convertRect:toView:", 0, v16, v18, v20, v22);
  v53 = CGRectIntegral(v52);
  objc_msgSend(v6, "convertRect:fromView:", 0, v53.origin.x, v53.origin.y, v53.size.width, v53.size.height);
  objc_msgSend(v49, "setFrame:");
  objc_msgSend(v49, "superview");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46 != v6)
  {
    objc_msgSend(v49, "setAutoresizingMask:", 18);
    -[MarkupViewController toolbar](self, "toolbar");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "superview");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addSubview:", v49);

  }
}

- (id)annotationControllerOfContentViewController:(id)a3 willSetToolbarItems:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v6 = a4;
  objc_msgSend(a3, "annotationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MarkupViewController sourceContent](self, "sourceContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUImageDownsamplingUtilities _sourceContentType:](MUImageDownsamplingUtilities, "_sourceContentType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  if ((objc_msgSend(v10, "conformsToType:", *MEMORY[0x24BDF84E0]) & 1) == 0)
  {
    v11 = objc_msgSend(v6, "indexOfObjectPassingTest:", &__block_literal_global_0);
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = v11;
      v13 = (void *)objc_msgSend(v6, "mutableCopy");
      objc_msgSend(v13, "removeObjectAtIndex:", v12);

      v6 = v13;
    }
  }
  -[MarkupViewController filteredToolbarItemsForItems:fromController:](self, "filteredToolbarItemsForItems:fromController:", v6, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[MarkupViewController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v15, "controller:willSetToolbarItems:", self, v14);
    v16 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v16;
  }

  return v14;
}

BOOL __88__MarkupViewController_annotationControllerOfContentViewController_willSetToolbarItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  _BOOL8 result;

  result = objc_msgSend(a2, "akToolbarButtonItemType") == 12;
  *a4 = result;
  return result;
}

- (BOOL)contentViewController:(id)a3 shouldHandleURL:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[MarkupViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "controller:shouldOpenLinkAtURL:", self, v5);
  else
    v7 = 1;

  return v7;
}

- (void)annotationController:(id)a3 detectedEditOfType:(unint64_t)a4
{
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;

  -[MarkupViewController delegate](self, "delegate", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    v8 = (void *)v5;
    v7 = objc_opt_respondsToSelector();
    v6 = v8;
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v8, "controllerDidChangeContent:", self);
      v6 = v8;
    }
  }

}

- (void)controllerWillShowSignatureCaptureView:(id)a3
{
  self->_showingSignaturesUI = 1;
  -[MarkupViewController _notifyDidChangeShowingSignaturesUI](self, "_notifyDidChangeShowingSignaturesUI", a3);
}

- (void)controllerWillDismissSignatureCaptureView:(id)a3
{
  self->_showingSignaturesUI = 0;
  -[MarkupViewController _notifyDidChangeShowingSignaturesUI](self, "_notifyDidChangeShowingSignaturesUI", a3);
}

- (void)controllerWillShowSignatureManagerView:(id)a3
{
  self->_showingSignaturesUI = 1;
  -[MarkupViewController _notifyDidChangeShowingSignaturesUI](self, "_notifyDidChangeShowingSignaturesUI", a3);
}

- (void)controllerWillDismissSignatureManagerView:(id)a3
{
  self->_showingSignaturesUI = 0;
  -[MarkupViewController _notifyDidChangeShowingSignaturesUI](self, "_notifyDidChangeShowingSignaturesUI", a3);
}

- (void)_notifyDidChangeShowingSignaturesUI
{
  id v3;

  -[MarkupViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "markupViewController:didChangeShowingSignaturesUI:", self, self->_showingSignaturesUI);

}

- (CGSize)adjustedSourceImageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BDBF148];
  v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)positionForBar:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MarkupViewController navBar](self, "navBar");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    return 3;
  else
    return self->_toolbarPosition;
}

- (UIView)toolbar
{
  void *v3;
  void *v4;

  if (-[MarkupViewController _useLegacyToolbar](self, "_useLegacyToolbar"))
  {
    -[MarkupViewController annotationController](self, "annotationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "toolbarView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MarkupViewController modernToolbar](self, "modernToolbar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIView *)v4;
}

- (void)_toolbarShareButtonTapped:(id)a3
{
  id v4;

  -[MarkupViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "performSelector:withObject:", sel_controllerWantsToShowShareSheet_, self);

}

- (int64_t)toolbarController:(id)a3 positionForBar:(id)a4
{
  return self->_toolbarPosition;
}

- (id)getMenuElementsForPage:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MarkupViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "menuElementsForPage:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (UIView)pageLabelView
{
  return 0;
}

- (NSUndoManager)akUndoManager
{
  return self->_akUndoManager;
}

- (void)setAkUndoManager:(id)a3
{
  objc_storeStrong((id *)&self->_akUndoManager, a3);
}

- (BOOL)allowShakeToUndo
{
  return self->_allowShakeToUndo;
}

- (void)setAllowShakeToUndo:(BOOL)a3
{
  self->_allowShakeToUndo = a3;
}

- (BOOL)centersIgnoringContentInsets
{
  return self->_centersIgnoringContentInsets;
}

- (void)setCentersIgnoringContentInsets:(BOOL)a3
{
  self->_centersIgnoringContentInsets = a3;
}

- (MarkupViewControllerDelegate)delegate
{
  return (MarkupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)encryptPrivateMetadata
{
  return self->_encryptPrivateMetadata;
}

- (void)setEncryptPrivateMetadata:(BOOL)a3
{
  self->_encryptPrivateMetadata = a3;
}

- (BOOL)forcesPDFViewTopAlignment
{
  return self->_forcesPDFViewTopAlignment;
}

- (NSString)hostProcessBundleIdentifier
{
  return self->_hostProcessBundleIdentifier;
}

- (void)setHostProcessBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (unint64_t)inkStyle
{
  return self->_inkStyle;
}

- (void)setInkStyle:(unint64_t)a3
{
  self->_inkStyle = a3;
}

- (UINavigationBar)navBar
{
  return self->_navBar;
}

- (BOOL)isNavigationModeHorizontal
{
  return self->_navigationModeHorizontal;
}

- (UIImageView)placeholderImageView
{
  return (UIImageView *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setPlaceholderImageView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1064);
}

- (BOOL)isShapeDetectionEnabled
{
  return self->_shapeDetectionEnabled;
}

- (BOOL)showShareButtonInToolbar
{
  return self->_showShareButtonInToolbar;
}

- (BOOL)showThumbnailViewForMultipage
{
  return self->_showThumbnailViewForMultipage;
}

- (BOOL)isThumbnailViewHidden
{
  return self->_thumbnailViewHidden;
}

- (BOOL)isToolbarHidden
{
  return self->_toolbarHidden;
}

- (int64_t)toolbarPosition
{
  return self->_toolbarPosition;
}

- (MUContentViewControllerProtocol)contentViewController
{
  return (MUContentViewControllerProtocol *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setContentViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1080);
}

- (BOOL)needToPerformFullTeardown
{
  return self->_needToPerformFullTeardown;
}

- (void)setNeedToPerformFullTeardown:(BOOL)a3
{
  self->_needToPerformFullTeardown = a3;
}

- (BOOL)needToPerformDocumentClosedTeardown
{
  return self->_needToPerformDocumentClosedTeardown;
}

- (void)setNeedToPerformDocumentClosedTeardown:(BOOL)a3
{
  self->_needToPerformDocumentClosedTeardown = a3;
}

- (BOOL)isObservingAKCurrentPageIndex
{
  return self->_observingAKCurrentPageIndex;
}

- (void)setObservingAKCurrentPageIndex:(BOOL)a3
{
  self->_observingAKCurrentPageIndex = a3;
}

- (NSString)sourceContentType
{
  return (NSString *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setSourceContentType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1088);
}

- (id)sourceContent
{
  return self->_sourceContent;
}

- (void)setSourceContent:(id)a3
{
  objc_storeStrong(&self->_sourceContent, a3);
}

- (id)digestedSourceContent
{
  return objc_getProperty(self, a2, 1104, 1);
}

- (void)setDigestedSourceContent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1104);
}

- (NSData)archivedModelData
{
  return (NSData *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setArchivedModelData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1112);
}

- (double)initialContentScale
{
  return self->_initialContentScale;
}

- (void)setInitialContentScale:(double)a3
{
  self->_initialContentScale = a3;
}

- (void)setToolbar:(id)a3
{
  objc_storeStrong((id *)&self->_toolbar, a3);
}

- (AKToolbarView)modernToolbar
{
  return (AKToolbarView *)objc_getProperty(self, a2, 1136, 1);
}

- (void)setModernToolbar:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1136);
}

- (NSLayoutConstraint)toolbarTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1144, 1);
}

- (void)setToolbarTopConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1144);
}

- (NSLayoutConstraint)toolbarTopAttachedConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1152, 1);
}

- (void)setToolbarTopAttachedConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1152);
}

- (NSLayoutConstraint)toolbarBottomConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1160, 1);
}

- (void)setToolbarBottomConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1160);
}

- (UINavigationItem)navItem
{
  return self->_navItem;
}

- (void)setNavItem:(id)a3
{
  objc_storeStrong((id *)&self->_navItem, a3);
}

- (UIBarButtonItem)cancelButton
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 1176, 1);
}

- (void)setCancelButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1176);
}

- (UIBarButtonItem)doneButton
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 1184, 1);
}

- (void)setDoneButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1184);
}

- (UIImage)placeholderImage
{
  return (UIImage *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setPlaceholderImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1192);
}

- (BOOL)alreadyLoggedSavingForThisDocument
{
  return self->_alreadyLoggedSavingForThisDocument;
}

- (void)setAlreadyLoggedSavingForThisDocument:(BOOL)a3
{
  self->_alreadyLoggedSavingForThisDocument = a3;
}

- (BOOL)needsToolPickerVisibleWhenAnnotationControllerIsAvailable
{
  return self->_needsToolPickerVisibleWhenAnnotationControllerIsAvailable;
}

- (void)setNeedsToolPickerVisibleWhenAnnotationControllerIsAvailable:(BOOL)a3
{
  self->_needsToolPickerVisibleWhenAnnotationControllerIsAvailable = a3;
}

- (NSString)preferredFileDisplayName
{
  return self->_preferredFileDisplayName;
}

- (UIView)contentContainerView
{
  return (UIView *)objc_getProperty(self, a2, 1208, 1);
}

- (void)setContentContainerView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1208);
}

- (UIView)transitionDimmingView
{
  return (UIView *)objc_getProperty(self, a2, 1216, 1);
}

- (void)setTransitionDimmingView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1216);
}

- (UIView)whiteView
{
  return (UIView *)objc_getProperty(self, a2, 1224, 1);
}

- (void)setWhiteView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1224);
}

- (BOOL)useFancyTransition
{
  return self->_useFancyTransition;
}

- (void)setUseFancyTransition:(BOOL)a3
{
  self->_useFancyTransition = a3;
}

- (BOOL)isAnimatingMarkupExtensionTransition
{
  return self->_isAnimatingMarkupExtensionTransition;
}

- (void)setIsAnimatingMarkupExtensionTransition:(BOOL)a3
{
  self->_isAnimatingMarkupExtensionTransition = a3;
}

- (BOOL)userDidCancel
{
  return self->_userDidCancel;
}

- (void)setUserDidCancel:(BOOL)a3
{
  self->_userDidCancel = a3;
}

- (BOOL)showAsFormSheet
{
  return self->_showAsFormSheet;
}

- (void)setShowAsFormSheet:(BOOL)a3
{
  self->_showAsFormSheet = a3;
}

- (NSString)originalImageDescription
{
  return self->_originalImageDescription;
}

- (void)setOriginalImageDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1232);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalImageDescription, 0);
  objc_storeStrong((id *)&self->_whiteView, 0);
  objc_storeStrong((id *)&self->_transitionDimmingView, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_preferredFileDisplayName, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_navItem, 0);
  objc_storeStrong((id *)&self->_toolbarBottomConstraint, 0);
  objc_storeStrong((id *)&self->_toolbarTopAttachedConstraint, 0);
  objc_storeStrong((id *)&self->_toolbarTopConstraint, 0);
  objc_storeStrong((id *)&self->_modernToolbar, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_archivedModelData, 0);
  objc_storeStrong(&self->_digestedSourceContent, 0);
  objc_storeStrong(&self->_sourceContent, 0);
  objc_storeStrong((id *)&self->_sourceContentType, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_placeholderImageView, 0);
  objc_storeStrong((id *)&self->_navBar, 0);
  objc_storeStrong((id *)&self->_hostProcessBundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_akUndoManager, 0);
  objc_storeStrong((id *)&self->_navBarTitleColor, 0);
  objc_storeStrong((id *)&self->_toolbarTintColor, 0);
  objc_storeStrong((id *)&self->_toolbarItemTintColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end

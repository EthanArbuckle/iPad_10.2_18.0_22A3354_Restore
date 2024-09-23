@implementation AKAuthorizationContaineriPhoneViewController

- (AKAuthorizationContaineriPhoneViewController)init
{
  return -[AKAuthorizationContaineriPhoneViewController initWithRootViewController:authorizationContext:](self, "initWithRootViewController:authorizationContext:", 0, 0);
}

- (AKAuthorizationContaineriPhoneViewController)initWithRootViewController:(id)a3 authorizationContext:(id)a4
{
  AKAuthorizationContaineriPhoneViewController *v4;
  AKAuthorizationContaineriPhoneViewController *v5;
  AKAuthorizationContaineriPhoneViewController *v6;
  uint64_t v7;
  UITapGestureRecognizer *tapGestureRecognizer;
  UITapGestureRecognizer *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AKAuthorizationContaineriPhoneViewController;
  v4 = -[AKAuthorizationContainerViewController initWithRootViewController:authorizationContext:](&v11, sel_initWithRootViewController_authorizationContext_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    -[AKAuthorizationContaineriPhoneViewController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 4);
    -[AKAuthorizationContaineriPhoneViewController setTransitioningDelegate:](v6, "setTransitioningDelegate:", v6);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v6, sel__handleTapGesture_);
    tapGestureRecognizer = v6->_tapGestureRecognizer;
    v6->_tapGestureRecognizer = (UITapGestureRecognizer *)v7;

    v9 = v6->_tapGestureRecognizer;
    -[UITapGestureRecognizer setCancelsTouchesInView:](v9, "setCancelsTouchesInView:", 0);
  }
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  UIVisualEffectView *v8;
  UIVisualEffectView *blurBackgroundView;
  UIVisualEffectView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *rootViewTopConstraint;
  void *v22;
  NSLayoutConstraint *v23;
  NSLayoutConstraint *rootViewHeightConstraint;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSLayoutConstraint *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;
  _QWORD v37[5];

  v37[4] = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)AKAuthorizationContaineriPhoneViewController;
  -[AKAuthorizationContaineriPhoneViewController viewDidLoad](&v36, sel_viewDidLoad);
  -[AKAuthorizationContaineriPhoneViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addGestureRecognizer:", self->_tapGestureRecognizer);

  -[AKAuthorizationContaineriPhoneViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOpaque:", 0);

  if (+[AKAuthorizationAppearance shouldShowBlurBackground](AKAuthorizationAppearance, "shouldShowBlurBackground"))
  {
    -[AKAuthorizationContainerViewController presentationContext](self, "presentationContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "credentialRequestContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_isRapportLogin");

    if (v7)
    {
      v8 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", 0);
      blurBackgroundView = self->_blurBackgroundView;
      self->_blurBackgroundView = v8;

      v10 = self->_blurBackgroundView;
      -[AKAuthorizationContaineriPhoneViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "frame");
      -[UIVisualEffectView setFrame:](v10, "setFrame:");

      -[UIVisualEffectView setAutoresizingMask:](self->_blurBackgroundView, "setAutoresizingMask:", 18);
      -[AKAuthorizationContaineriPhoneViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "insertSubview:atIndex:", self->_blurBackgroundView, 0);

    }
  }
  -[AKAuthorizationContainerViewController rootViewController](self, "rootViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "willMoveToParentViewController:", self);
    -[AKAuthorizationContaineriPhoneViewController addChildViewController:](self, "addChildViewController:", v14);
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[AKAuthorizationContaineriPhoneViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v15);

    objc_msgSend(v14, "didMoveToParentViewController:", self);
    objc_msgSend(v15, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationContaineriPhoneViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v19);
    v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    rootViewTopConstraint = self->_rootViewTopConstraint;
    self->_rootViewTopConstraint = v20;

    objc_msgSend(v15, "heightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToConstant:", 0.0);
    v23 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    rootViewHeightConstraint = self->_rootViewHeightConstraint;
    self->_rootViewHeightConstraint = v23;

    v32 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v15, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationContaineriPhoneViewController view](self, "view");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v25;
    objc_msgSend(v15, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationContaineriPhoneViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = self->_rootViewTopConstraint;
    v37[1] = v29;
    v37[2] = v30;
    v37[3] = self->_rootViewHeightConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "activateConstraints:", v31);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AKAuthorizationContaineriPhoneViewController;
  -[AKAuthorizationContaineriPhoneViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  if (-[AKAuthorizationContaineriPhoneViewController isBeingPresented](self, "isBeingPresented"))
  {
    -[AKAuthorizationContaineriPhoneViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v5);

    if (+[AKAuthorizationAppearance shouldShowBlurBackground](AKAuthorizationAppearance, "shouldShowBlurBackground"))
    {
      -[AKAuthorizationContaineriPhoneViewController transitionCoordinator](self, "transitionCoordinator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __63__AKAuthorizationContaineriPhoneViewController_viewWillAppear___block_invoke;
      v7[3] = &unk_1E7678C60;
      v7[4] = self;
      objc_msgSend(v6, "animateAlongsideTransition:completion:", v7, 0);

    }
  }
}

void __63__AKAuthorizationContaineriPhoneViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "preferredContentSize");
  v6 = v5;
  v8 = v7;
  v9 = objc_msgSend(v4, "isAnimated");

  objc_msgSend(v3, "setContainerContentSize:animated:", v9, v6, v8);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1024))
  {
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", +[AKAuthorizationAppearance paneBlurEffectStyle](AKAuthorizationAppearance, "paneBlurEffectStyle"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "setEffect:");
  }
  else
  {
    +[AKAuthorizationAppearance translucentBackdropColor](AKAuthorizationAppearance, "translucentBackdropColor");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v11);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AKAuthorizationContaineriPhoneViewController;
  -[AKAuthorizationContaineriPhoneViewController viewDidAppear:](&v14, sel_viewDidAppear_, a3);
  -[AKAuthorizationContainerViewController rootViewController](self, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSize");
  v6 = v5;
  v8 = v7;

  -[AKAuthorizationContaineriPhoneViewController _dismissalFrameForContentSize:](self, "_dismissalFrameForContentSize:", v6, v8);
  v10 = v9;
  v12 = v11;
  if (-[AKAuthorizationContaineriPhoneViewController isBeingPresented](self, "isBeingPresented"))
  {
    -[NSLayoutConstraint setConstant:](self->_rootViewTopConstraint, "setConstant:", v10);
    -[NSLayoutConstraint setConstant:](self->_rootViewHeightConstraint, "setConstant:", v12);
    -[AKAuthorizationContaineriPhoneViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layoutIfNeeded");

    -[AKAuthorizationContaineriPhoneViewController setContainerContentSize:animated:](self, "setContainerContentSize:animated:", 1, v6, v8);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKAuthorizationContaineriPhoneViewController;
  -[AKAuthorizationContaineriPhoneViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  if (+[AKAuthorizationAppearance shouldShowBlurBackground](AKAuthorizationAppearance, "shouldShowBlurBackground"))
  {
    if (-[AKAuthorizationContaineriPhoneViewController isBeingDismissed](self, "isBeingDismissed"))
    {
      -[AKAuthorizationContaineriPhoneViewController transitionCoordinator](self, "transitionCoordinator");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __66__AKAuthorizationContaineriPhoneViewController_viewWillDisappear___block_invoke;
      v5[3] = &unk_1E7678C60;
      v5[4] = self;
      objc_msgSend(v4, "animateAlongsideTransition:completion:", v5, 0);

    }
  }
}

void __66__AKAuthorizationContaineriPhoneViewController_viewWillDisappear___block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;

  v1 = *(id **)(a1 + 32);
  if (v1[128])
  {
    objc_msgSend(v1[128], "setEffect:", 0);
  }
  else
  {
    objc_msgSend(v1, "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v2);

  }
}

- (void)setContainerContentSize:(CGSize)a3
{
  -[AKAuthorizationContaineriPhoneViewController setContainerContentSize:animated:](self, "setContainerContentSize:animated:", 1, a3.width, a3.height);
}

- (void)setContainerContentSize:(CGSize)a3 animated:(BOOL)a4
{
  double height;
  double width;
  CGSize *p_containerContentSize;
  _BOOL8 v8;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect v22;

  height = a3.height;
  width = a3.width;
  p_containerContentSize = &self->_containerContentSize;
  if (self->_containerContentSize.width != a3.width || self->_containerContentSize.height != a3.height)
  {
    v8 = a4;
    -[AKAuthorizationContaineriPhoneViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    v21.origin.x = v12;
    v21.origin.y = v14;
    v21.size.width = v16;
    v21.size.height = v18;
    v19 = CGRectGetWidth(v21);
    if (v19 < width)
      width = v19;
    v22.origin.x = v12;
    v22.origin.y = v14;
    v22.size.width = v16;
    v22.size.height = v18;
    v20 = CGRectGetHeight(v22);
    if (v20 >= height)
      v20 = height;
    p_containerContentSize->width = width;
    p_containerContentSize->height = v20;
    -[AKAuthorizationContaineriPhoneViewController _layoutContainerView:](self, "_layoutContainerView:", v8);
  }
}

- (void)_layoutContainerView:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  CGRect v20;
  CGRect v21;

  v3 = a3;
  -[AKAuthorizationContainerViewController rootViewController](self, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewIfLoaded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AKAuthorizationContaineriPhoneViewController containerContentSize](self, "containerContentSize");
    -[AKAuthorizationContaineriPhoneViewController _layoutFrameForContentSize:](self, "_layoutFrameForContentSize:");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v6, "frame");
    v21.origin.x = v8;
    v21.origin.y = v10;
    v21.size.width = v12;
    v21.size.height = v14;
    if (!CGRectEqualToRect(v20, v21))
    {
      -[NSLayoutConstraint setConstant:](self->_rootViewHeightConstraint, "setConstant:", v14);
      -[NSLayoutConstraint setConstant:](self->_rootViewTopConstraint, "setConstant:", v10);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __69__AKAuthorizationContaineriPhoneViewController__layoutContainerView___block_invoke;
      v19[3] = &unk_1E76789A0;
      v19[4] = self;
      v15 = MEMORY[0x1C3B760D8](v19);
      v16 = (void *)v15;
      if (v3)
      {
        v17 = objc_alloc_init(MEMORY[0x1E0CEA9D8]);
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABC8]), "initWithDuration:timingParameters:", v17, 0.35);
        objc_msgSend(v18, "addAnimations:", v16);
        objc_msgSend(v18, "startAnimation");

      }
      else
      {
        (*(void (**)(uint64_t))(v15 + 16))(v15);
      }

    }
  }

}

void __69__AKAuthorizationContaineriPhoneViewController__layoutContainerView___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

- (CGRect)_layoutFrameForContentSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  void *v6;
  CGFloat x;
  CGFloat y;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  height = a3.height;
  width = a3.width;
  -[AKAuthorizationContaineriPhoneViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "bounds");
    x = v17.origin.x;
    y = v17.origin.y;
    v9 = v17.size.width;
    v10 = v17.size.height;
    v11 = (CGRectGetWidth(v17) - width) * 0.5;
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = v9;
    v18.size.height = v10;
    v12 = CGRectGetHeight(v18) - height;
  }
  else
  {
    v11 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v13 = v11;
  v14 = v12;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_dismissalFrameForContentSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v5;
  void *v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v13;
  CGRect result;

  height = a3.height;
  width = a3.width;
  -[AKAuthorizationContaineriPhoneViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "bounds");
    v7 = CGRectGetHeight(v13);
    v8 = 0.0;
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v9 = v8;
  v10 = v7;
  v11 = width;
  v12 = height;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (void)_handleTapGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  void *v11;
  BOOL v12;
  CGPoint v13;
  CGRect v14;

  if (self->_tapGestureRecognizer == a3)
  {
    v4 = a3;
    -[AKAuthorizationContaineriPhoneViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v5);
    v7 = v6;
    v9 = v8;

    -[AKAuthorizationContainerViewController rootViewController](self, "rootViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    v13.x = v7;
    v13.y = v9;
    v12 = CGRectContainsPoint(v14, v13);

    if (!v12)
    {
      if (-[AKAuthorizationContaineriPhoneViewController _delegate_authorizationContainerViewControllerShouldDismiss](self, "_delegate_authorizationContainerViewControllerShouldDismiss"))
      {
        -[AKAuthorizationContaineriPhoneViewController _delegate_authorizationContainerViewControllerDidDismiss](self, "_delegate_authorizationContainerViewControllerDidDismiss");
      }
    }
  }
}

- (BOOL)_delegate_authorizationContainerViewControllerShouldDismiss
{
  void *v3;
  char v4;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AKAuthorizationContainerViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "authorizationContainerViewControllerShouldDismiss:", self);
  else
    v4 = 1;

  return v4;
}

- (void)_delegate_authorizationContainerViewControllerDidDismiss
{
  id v3;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AKAuthorizationContainerViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "authorizationContainerViewControllerDidDismiss:", self);

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AKAuthorizationContaineriPhoneViewController;
  -[AKAuthorizationContaineriPhoneViewController preferredContentSizeDidChangeForChildContentContainer:](&v6, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  if ((-[AKAuthorizationContaineriPhoneViewController isBeingPresented](self, "isBeingPresented") & 1) == 0)
  {
    -[AKAuthorizationContainerViewController rootViewController](self, "rootViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 == v4)
    {
      objc_msgSend(v4, "preferredContentSize");
      -[AKAuthorizationContaineriPhoneViewController setContainerContentSize:animated:](self, "setContainerContentSize:animated:", 1);
    }

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)AKAuthorizationContaineriPhoneViewController;
  v7 = a4;
  -[AKAuthorizationContaineriPhoneViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __99__AKAuthorizationContaineriPhoneViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E7678C60;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

uint64_t __99__AKAuthorizationContaineriPhoneViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutContainerView:", objc_msgSend(a2, "isAnimated"));
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return -[AKAuthorizationContainerViewControllerAnimator initWithPresenting:]([AKAuthorizationContainerViewControllerAnimator alloc], "initWithPresenting:", 1);
}

- (id)animationControllerForDismissedController:(id)a3
{
  return -[AKAuthorizationContainerViewControllerAnimator initWithPresenting:]([AKAuthorizationContainerViewControllerAnimator alloc], "initWithPresenting:", 0);
}

- (UIVisualEffectView)blurBackgroundView
{
  return self->_blurBackgroundView;
}

- (void)setBlurBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_blurBackgroundView, a3);
}

- (CGSize)containerContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_containerContentSize.width;
  height = self->_containerContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurBackgroundView, 0);
  objc_storeStrong((id *)&self->_rootViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_rootViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
}

@end

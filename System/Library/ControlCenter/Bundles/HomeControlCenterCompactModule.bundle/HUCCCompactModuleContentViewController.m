@implementation HUCCCompactModuleContentViewController

- (HUCCCompactModuleContentViewController)initWithDelegate:(id)a3
{
  id v4;
  HUCCCompactModuleContentViewController *v5;
  HUCCCompactModuleContentViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUCCCompactModuleContentViewController;
  v5 = -[CCUIButtonModuleViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:weight:", 4, 32.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("homekit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageWithConfiguration:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageWithRenderingMode:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIButtonModuleViewController setGlyphImage:](v6, "setGlyphImage:", v10);

  }
  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  float v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUCCCompactModuleContentViewController;
  -[CCUIButtonModuleViewController viewDidLoad](&v6, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCCCompactModuleContentViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v3);

  MGGetFloat32Answer();
  -[HUCCCompactModuleContentViewController setTransitionDeviceCornerRadius:](self, "setTransitionDeviceCornerRadius:", v5);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  -[HUCCCompactModuleContentViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moduleContentViewController:viewWillAppear:", self, v3);

  v7.receiver = self;
  v7.super_class = (Class)HUCCCompactModuleContentViewController;
  -[HUCCCompactModuleContentViewController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
  -[HUCCCompactModuleContentViewController _setUpHomeControlService](self, "_setUpHomeControlService");
  -[CCUIButtonModuleViewController buttonView](self, "buttonView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  -[HUCCCompactModuleContentViewController setTransitionCompressedAnimationStartFrame:](self, "setTransitionCompressedAnimationStartFrame:");

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[HUCCCompactModuleContentViewController _tearDownHomeControlService](self, "_tearDownHomeControlService");
  v6.receiver = self;
  v6.super_class = (Class)HUCCCompactModuleContentViewController;
  -[HUCCCompactModuleContentViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);
  -[HUCCCompactModuleContentViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moduleContentViewController:viewDidDisappear:", self, v3);

}

- (void)dealloc
{
  objc_super v3;

  -[HUCCCompactModuleContentViewController _tearDownHomeControlService](self, "_tearDownHomeControlService");
  v3.receiver = self;
  v3.super_class = (Class)HUCCCompactModuleContentViewController;
  -[HUCCCompactModuleContentViewController dealloc](&v3, sel_dealloc);
}

- (void)setExpandedView:(id)a3
{
  UIView **p_expandedView;
  UIView *expandedView;
  void *v7;
  id v8;

  v8 = a3;
  p_expandedView = &self->_expandedView;
  expandedView = self->_expandedView;
  if (expandedView)
    -[UIView removeFromSuperview](expandedView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_expandedView, a3);
  if (*p_expandedView)
  {
    -[UIView setAlpha:](*p_expandedView, "setAlpha:", 0.0);
    -[HUCCCompactModuleContentViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", *p_expandedView);

  }
}

- (void)resetToInitialState
{
  void *v3;
  void *v4;
  void *v5;

  -[HUCCCompactModuleContentViewController expandedView](self, "expandedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  -[HUCCCompactModuleContentViewController setExpandedView:](self, "setExpandedView:", 0);
  -[CCUIButtonModuleViewController buttonView](self, "buttonView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  -[HUCCCompactModuleContentViewController dashboardContainerViewController](self, "dashboardContainerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromParentViewController");

  -[HUCCCompactModuleContentViewController setDashboardContainerViewController:](self, "setDashboardContainerViewController:", 0);
}

- (void)_setUpHomeControlService
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HUCCDashboardContainerViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[HUCCCompactModuleContentViewController activeAssertion](self, "activeAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_2;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE4D0B0], "sharedDispatcher");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_beginActiveAssertionWithReason:", CFSTR("HUCCCompactModuleVisible"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCCCompactModuleContentViewController setActiveAssertion:](self, "setActiveAssertion:", v6);

    -[HUCCCompactModuleContentViewController activeAssertion](self, "activeAssertion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BE4F478], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "launchServiceSuspendedWithUserInfo:", MEMORY[0x24BDBD1B8]);

      v9 = -[HUCCDashboardContainerViewController initWithDelegate:]([HUCCDashboardContainerViewController alloc], "initWithDelegate:", self);
      -[HUCCCompactModuleContentViewController setDashboardContainerViewController:](self, "setDashboardContainerViewController:", v9);

      -[HUCCCompactModuleContentViewController dashboardContainerViewController](self, "dashboardContainerViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCCCompactModuleContentViewController setExpandedView:](self, "setExpandedView:", v11);

      -[HUCCCompactModuleContentViewController dashboardContainerViewController](self, "dashboardContainerViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCCCompactModuleContentViewController addChildViewController:](self, "addChildViewController:", v12);

      -[HUCCCompactModuleContentViewController dashboardContainerViewController](self, "dashboardContainerViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "didMoveToParentViewController:", self);
      v3 = v13;
LABEL_2:

    }
  }
}

- (void)_tearDownHomeControlService
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  -[HUCCCompactModuleContentViewController activeAssertion](self, "activeAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CCUIButtonModuleViewController setExpanded:](self, "setExpanded:", 0);
    -[HUCCCompactModuleContentViewController dashboardContainerViewController](self, "dashboardContainerViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopRemoteViewController");

    -[HUCCCompactModuleContentViewController resetToInitialState](self, "resetToInitialState");
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_230FD4000, v5, OS_LOG_TYPE_DEFAULT, "Terminating HomeControlService", v10, 2u);
    }

    objc_msgSend(MEMORY[0x24BE4F478], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissService");

    objc_msgSend(MEMORY[0x24BE4D0B0], "sharedDispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "homeManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCCCompactModuleContentViewController activeAssertion](self, "activeAssertion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_endActiveAssertion:", v9);

    -[HUCCCompactModuleContentViewController setActiveAssertion:](self, "setActiveAssertion:", 0);
  }
}

- (BOOL)shouldExpandModuleOnTouch:(id)a3
{
  BOOL v4;
  void *v5;
  _QWORD v7[5];

  v4 = -[HUCCCompactModuleContentViewController accessAllowedForCurrentLockState](self, "accessAllowedForCurrentLockState", a3);
  if (v4)
  {
    -[HUCCCompactModuleContentViewController expandedView](self, "expandedView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 1.0);

  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = sub_230FD5B48;
    v7[3] = &unk_24FFD57C8;
    v7[4] = self;
    -[HUCCCompactModuleContentViewController requestAuthenticationIfLockedWithCompletionHandler:](self, "requestAuthenticationIfLockedWithCompletionHandler:", v7);
  }
  return v4;
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x24BE4D0B0], "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_os_feature_enabled_impl() & 1) != 0 || (objc_msgSend(v4, "hf_hasVisibleAccessories") & 1) == 0)
  {
    -[HUCCCompactModuleContentViewController _openHomeApp](self, "_openHomeApp");
    v5 = 0;
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)customAnimator
{
  HUCCCompactModulePropertyAnimator *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];

  v3 = -[UIViewPropertyAnimator initWithDuration:curve:animations:]([HUCCCompactModulePropertyAnimator alloc], "initWithDuration:curve:animations:", 0, 0, 0.4);
  -[HUCCCompactModulePropertyAnimator setDelegate:](v3, "setDelegate:", self);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6FA8]), "initWithDuration:curve:animations:", 0, 0, 0.1);
  -[HUCCCompactModuleContentViewController transitionIconView](self, "transitionIconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[CCUIButtonModuleViewController buttonView](self, "buttonView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "snapshotViewAfterScreenUpdates:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCCCompactModuleContentViewController setTransitionIconView:](self, "setTransitionIconView:", v7);

    -[HUCCCompactModuleContentViewController transitionIconView](self, "transitionIconView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContentMode:", 4);

    -[HUCCCompactModuleContentViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCCCompactModuleContentViewController transitionIconView](self, "transitionIconView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

  }
  v11 = -[CCUIButtonModuleViewController isExpanded](self, "isExpanded");
  v12 = MEMORY[0x24BDAC760];
  if (v11)
  {
    -[CCUIButtonModuleViewController buttonView](self, "buttonView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAlpha:", 0.0);

    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = sub_230FD5E88;
    v20[3] = &unk_24FFD57F0;
    v20[4] = self;
    -[UIViewPropertyAnimator addAnimations:](v3, "addAnimations:", v20);
  }
  else
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = sub_230FD6218;
    v18[3] = &unk_24FFD5818;
    v18[4] = self;
    v19 = v4;
    -[UIViewPropertyAnimator addAnimations:](v3, "addAnimations:", v18);

  }
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = sub_230FD641C;
  v16[3] = &unk_24FFD5840;
  v16[4] = self;
  v17 = v4;
  v14 = v4;
  -[UIViewPropertyAnimator addCompletion:](v3, "addCompletion:", v16);

  return v3;
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v3 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HUCCCompactModuleContentViewController;
  -[CCUIButtonModuleViewController willTransitionToExpandedContentMode:](&v26, sel_willTransitionToExpandedContentMode_);
  -[HUCCCompactModuleContentViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentModuleContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHomeGestureDismissalAllowed:", v3);

  if (UIAccessibilityIsReduceMotionEnabled())
  {
    v7 = -[CCUIButtonModuleViewController isExpanded](self, "isExpanded");
    -[CCUIButtonModuleViewController buttonView](self, "buttonView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", v7);

    if (-[CCUIButtonModuleViewController isExpanded](self, "isExpanded"))
      v9 = 0.0;
    else
      v9 = 1.0;
    -[CCUIButtonModuleViewController buttonView](self, "buttonView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlpha:", v9);

    v11 = -[CCUIButtonModuleViewController isExpanded](self, "isExpanded") ^ 1;
    -[HUCCCompactModuleContentViewController expandedView](self, "expandedView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", v11);

    if (-[CCUIButtonModuleViewController isExpanded](self, "isExpanded"))
      v13 = 1.0;
    else
      v13 = 0.0;
    -[HUCCCompactModuleContentViewController expandedView](self, "expandedView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAlpha:", v13);

    -[HUCCCompactModuleContentViewController _expandedContentFrame](self, "_expandedContentFrame");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[HUCCCompactModuleContentViewController expandedView](self, "expandedView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

    -[HUCCCompactModuleContentViewController dashboardContainerViewController](self, "dashboardContainerViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "willBeginTransition:forCompactModule:", -[CCUIButtonModuleViewController isExpanded](self, "isExpanded"), 1);

    -[HUCCCompactModuleContentViewController dashboardContainerViewController](self, "dashboardContainerViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "willFinishTransition:forCompactModule:", -[CCUIButtonModuleViewController isExpanded](self, "isExpanded"), 1);

  }
}

- (CGRect)_iconViewInHomeGridCellFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BEDD108](self, sel_transitionCompressedAnimationStartFrame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)_iconViewInNavigationHeaderViewFrame
{
  void *v4;
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
  NSObject *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  -[HUCCCompactModuleContentViewController dashboardContainerViewController](self, "dashboardContainerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitionSubviewFrames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE4F3C8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "CGRectValue");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

  }
  else
  {
    HFLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_230FD8504((uint64_t)self, a2, v15);

    -[HUCCCompactModuleContentViewController _iconViewInHomeGridCellFrame](self, "_iconViewInHomeGridCellFrame");
    v8 = v16;
    v10 = v17;
    v12 = v18;
    v14 = v19;
  }

  v20 = v8;
  v21 = v10;
  v22 = v12;
  v23 = v14;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)_expandedContentFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  -[HUCCCompactModuleContentViewController preferredExpandedContentWidth](self, "preferredExpandedContentWidth");
  v4 = v3;
  -[HUCCCompactModuleContentViewController preferredExpandedContentHeight](self, "preferredExpandedContentHeight");
  v6 = v5;
  v7 = 0.0;
  v8 = 0.0;
  v9 = v4;
  result.size.height = v6;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (double)preferredExpandedContinuousCornerRadius
{
  double result;

  if (objc_msgSend(MEMORY[0x24BE4D198], "isAnIPad"))
    CCUIExpandedModuleContinuousCornerRadius();
  else
    MEMORY[0x24BEDD108](self, sel_transitionDeviceCornerRadius);
  return result;
}

- (double)preferredExpandedContentHeight
{
  double v2;

  -[HUCCCompactModuleContentViewController preferredExpandedSize](self, "preferredExpandedSize");
  return v2;
}

- (CGSize)preferredExpandedSize
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat Width;
  void *v9;
  void *v10;
  double v11;
  CGFloat Height;
  double v13;
  double v14;
  CGSize result;
  CGRect v16;
  CGRect v17;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 1)
  {
    -[HUCCCompactModuleContentViewController dashboardContainerViewController](self, "dashboardContainerViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    Width = v7;
    -[HUCCCompactModuleContentViewController dashboardContainerViewController](self, "dashboardContainerViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    Height = v11;

  }
  else
  {
    CCUIScreenBounds();
    Width = CGRectGetWidth(v16);
    CCUIScreenBounds();
    Height = CGRectGetHeight(v17);
  }
  v13 = Width;
  v14 = Height;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_openHomeApp
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = sub_230FD6934;
  v2[3] = &unk_24FFD5868;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)propertyAnimatorDidStartAnimating:(id)a3
{
  id v4;

  -[HUCCCompactModuleContentViewController dashboardContainerViewController](self, "dashboardContainerViewController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "willBeginTransition:forCompactModule:", -[CCUIButtonModuleViewController isExpanded](self, "isExpanded"), 1);

}

- (void)remoteDashboard:(id)a3 viewServiceDidTerminateWithError:(id)a4
{
  void *v4;
  id v5;

  -[HUCCCompactModuleContentViewController delegate](self, "delegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentModuleContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHomeGestureDismissalAllowed:", 1);

}

- (void)requestAuthenticationIfLockedWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  int v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  void (**v10)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  -[HUCCCompactModuleContentViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDeviceUnlockedForModuleContentViewController:", self);

  if (v6)
  {
    v4[2](v4, 1);
  }
  else
  {
    -[HUCCCompactModuleContentViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentModuleContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_230FD6B04;
      v9[3] = &unk_24FFD5890;
      v10 = v4;
      objc_msgSend(v8, "requestAuthenticationWithCompletionHandler:", v9);

    }
    else
    {
      v4[2](v4, 0);
    }

  }
}

- (void)requestDismissal
{
  void *v2;
  id v3;

  -[HUCCCompactModuleContentViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentModuleContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissModule");

}

- (void)quickControlsPresentationDidUpdate:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[HUCCCompactModuleContentViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentModuleContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHomeGestureDismissalAllowed:", !v3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)accessAllowedForCurrentLockState
{
  return self->_accessAllowedForCurrentLockState;
}

- (void)setAccessAllowedForCurrentLockState:(BOOL)a3
{
  self->_accessAllowedForCurrentLockState = a3;
}

- (NSObject)activeAssertion
{
  return self->_activeAssertion;
}

- (void)setActiveAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_activeAssertion, a3);
}

- (UIView)expandedView
{
  return self->_expandedView;
}

- (HUCCDashboardContainerViewController)dashboardContainerViewController
{
  return self->_dashboardContainerViewController;
}

- (void)setDashboardContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_dashboardContainerViewController, a3);
}

- (HUCCCompactModuleContentViewControllerDelegate)delegate
{
  return (HUCCCompactModuleContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)transitionIconView
{
  return self->_transitionIconView;
}

- (void)setTransitionIconView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionIconView, a3);
}

- (double)transitionDeviceCornerRadius
{
  return self->_transitionDeviceCornerRadius;
}

- (void)setTransitionDeviceCornerRadius:(double)a3
{
  self->_transitionDeviceCornerRadius = a3;
}

- (CGRect)transitionCompressedAnimationStartFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_transitionCompressedAnimationStartFrame.origin.x;
  y = self->_transitionCompressedAnimationStartFrame.origin.y;
  width = self->_transitionCompressedAnimationStartFrame.size.width;
  height = self->_transitionCompressedAnimationStartFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTransitionCompressedAnimationStartFrame:(CGRect)a3
{
  self->_transitionCompressedAnimationStartFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionIconView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dashboardContainerViewController, 0);
  objc_storeStrong((id *)&self->_expandedView, 0);
  objc_storeStrong((id *)&self->_activeAssertion, 0);
}

@end

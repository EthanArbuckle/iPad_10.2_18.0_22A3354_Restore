@implementation CKExpandedAppViewController

- (CKExpandedAppViewController)initWithConversation:(id)a3 plugin:(id)a4
{
  id v6;
  id v7;
  CKExpandedAppViewController *v8;
  CKExpandedAppViewController *v9;
  CKFullScreenAppNavbarManager *v10;
  void *v11;
  CKFullScreenAppNavbarManager *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  v8 = -[CKExpandedAppViewController init](self, "init");
  v9 = v8;
  if (v8)
  {
    v8->_addsVerticalPaddingForStatusBar = 1;
    v8->_usesDimmingView = 1;
    -[CKExpandedAppViewController setConversation:](v8, "setConversation:", v6);
    v10 = [CKFullScreenAppNavbarManager alloc];
    -[CKExpandedAppViewController conversation](v9, "conversation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CKFullScreenAppNavbarManager initWithConversation:plugin:](v10, "initWithConversation:plugin:", v11, v7);
    -[CKExpandedAppViewController setNavbarManager:](v9, "setNavbarManager:", v12);

    -[CKExpandedAppViewController navbarManager](v9, "navbarManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", v9);

    -[CKExpandedAppViewController navbarManager](v9, "navbarManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dismissButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addTarget:action:forEvents:", v9, sel_collapse_, 64);

    -[CKExpandedAppViewController navbarManager](v9, "navbarManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appIconButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addTarget:action:forEvents:", v9, sel__openParentApp_, 64);

    -[CKExpandedAppViewController _configureTitleView](v9, "_configureTitleView");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v9, sel__dragBegan_, CFSTR("CKBrowserDragManagerDidStartDraggingNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v9, sel__dragEnded_, CFSTR("CKBrowserDragManagerDidEndDraggingNotification"), 0);

  }
  return v9;
}

- (void)loadView
{
  void *v3;
  CKDismissView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKExpandedAppViewController;
  -[CKExpandedAppViewController loadView](&v12, sel_loadView);
  -[CKExpandedAppViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", 0);

  v4 = objc_alloc_init(CKDismissView);
  -[CKExpandedAppViewController setDismissView:](self, "setDismissView:", v4);

  -[CKExpandedAppViewController dismissView](self, "dismissView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "theme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fullscreenAppDismissViewColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v8);

  -[CKExpandedAppViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKExpandedAppViewController dismissView](self, "dismissView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKExpandedAppViewController setLastKnownDeviceOrientation:](self, "setLastKnownDeviceOrientation:", objc_msgSend(v11, "orientation"));

}

- (void)viewDidLayoutSubviews
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
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double Width;
  double v19;
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
  double v30;
  void *v31;
  double v32;
  uint64_t v33;
  double v34;
  objc_super v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v35.receiver = self;
  v35.super_class = (Class)CKExpandedAppViewController;
  -[CKExpandedAppViewController viewDidLayoutSubviews](&v35, sel_viewDidLayoutSubviews);
  -[CKExpandedAppViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  if (!-[CKExpandedAppViewController inTransition](self, "inTransition")
    && !-[CKExpandedAppViewController inDragAndDrop](self, "inDragAndDrop"))
  {
    v12 = -[CKExpandedAppViewController _currentPluginIsAppManager](self, "_currentPluginIsAppManager");
    -[CKExpandedAppViewController contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

      -[CKExpandedAppViewController dismissView](self, "dismissView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = 1;
    }
    else
    {
      -[CKExpandedAppViewController finalContentViewFrame](self, "finalContentViewFrame");
      objc_msgSend(v14, "setFrame:");

      v36.origin.x = v5;
      v36.origin.y = v7;
      v36.size.width = v9;
      v36.size.height = v11;
      Width = CGRectGetWidth(v36);
      -[CKExpandedAppViewController topAreaHeight](self, "topAreaHeight");
      -[CKExpandedAppViewController leftRightSafeAreaInsetRect:](self, "leftRightSafeAreaInsetRect:", 0.0, 0.0, Width, v19);
      -[CKAppGrabberView setFrame:](self->_grabberView, "setFrame:");
      -[CKExpandedAppViewController dismissView](self, "dismissView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = 0;
    }
    objc_msgSend(v15, "setHidden:", v17);

    -[CKExpandedAppViewController contentView](self, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "superview");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      -[CKExpandedAppViewController view](self, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKExpandedAppViewController contentView](self, "contentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addSubview:", v23);

    }
    -[CKExpandedAppViewController dismissView](self, "dismissView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFrame:", v5, v7, v9, v11);

    -[CKExpandedAppViewController _updateDimmingViewAlpha](self, "_updateDimmingViewAlpha");
    -[CKExpandedAppViewController view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bringSubviewToFront:", self->_grabberView);

    -[CKExpandedAppViewController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKExpandedAppViewController dismissView](self, "dismissView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sendSubviewToBack:", v27);

  }
  -[CKExpandedAppViewController navbarManager](self, "navbarManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "dismissButton");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "bounds");
  v30 = CGRectGetWidth(v37);
  objc_msgSend(v29, "imageView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bounds");
  v32 = v30 - CGRectGetWidth(v38);

  v33 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
  v34 = v32 * 0.5 + 5.0;
  if (v33)
    v34 = 0.0;
  objc_msgSend(v29, "setImageEdgeInsets:", 0.0, v34);

}

- (id)traitCollection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)CKExpandedAppViewController;
  -[CKExpandedAppViewController traitCollection](&v8, sel_traitCollection);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (CKIsRunningInCameraAppsClient())
  {
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0CEAB40];
    v9[0] = v2;
    v9[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "traitCollectionWithTraitsFromCollections:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v6;
  }
  return v2;
}

- (void)addNewGrabberView
{
  CKAppGrabberView *grabberView;
  CKAppGrabberView *v4;
  CKAppGrabberView *v5;
  void *v6;

  grabberView = self->_grabberView;
  if (grabberView)
    -[CKAppGrabberView removeFromSuperview](grabberView, "removeFromSuperview");
  v4 = objc_alloc_init(CKAppGrabberView);
  v5 = self->_grabberView;
  self->_grabberView = v4;

  -[CKAppGrabberView setDelegate:](self->_grabberView, "setDelegate:", self);
  -[CKAppGrabberView setAutoresizingMask:](self->_grabberView, "setAutoresizingMask:", 34);
  -[CKAppGrabberView setShowsAppTitle:](self->_grabberView, "setShowsAppTitle:", 1);
  -[CKExpandedAppViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_grabberView);

  if (-[CKExpandedAppViewController fadesOutDuringStickerDrag](self, "fadesOutDuringStickerDrag"))
    -[CKAppGrabberView setShowsGrabberPill:](self->_grabberView, "setShowsGrabberPill:", 0);
}

- (double)topAreaHeight
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "browserSwitcherExpandedGrabberHeaderHeight");
  v5 = v4;

  if (-[CKExpandedAppViewController addsVerticalPaddingForStatusBar](self, "addsVerticalPaddingForStatusBar"))
  {
    -[CKExpandedAppViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _UISheetMinimumTopInset();
    v5 = v5 + v7;

  }
  return v5;
}

- (void)setContentViewController:(id)a3
{
  void *v5;
  CKBrowserViewControllerProtocol *v6;
  CKBrowserViewControllerProtocol **p_contentViewController;
  CKBrowserViewControllerProtocol *contentViewController;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  CKBrowserViewControllerProtocol *v14;

  v14 = (CKBrowserViewControllerProtocol *)a3;
  -[CKExpandedAppViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 1.0);

  v6 = v14;
  p_contentViewController = &self->_contentViewController;
  contentViewController = self->_contentViewController;
  if (contentViewController != v14)
  {
    -[CKBrowserViewControllerProtocol willMoveToParentViewController:](contentViewController, "willMoveToParentViewController:", 0);
    -[CKBrowserViewControllerProtocol view](*p_contentViewController, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    -[CKBrowserViewControllerProtocol removeFromParentViewController](*p_contentViewController, "removeFromParentViewController");
    objc_storeStrong((id *)&self->_contentViewController, a3);
    if (v14)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[CKBrowserViewControllerProtocol browserScrolledOnScreen](v14, "browserScrolledOnScreen");
      -[CKExpandedAppViewController addChildViewController:](self, "addChildViewController:", *p_contentViewController);
      -[CKBrowserViewControllerProtocol view](*p_contentViewController, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKExpandedAppViewController setContentView:](self, "setContentView:", v10);

      -[CKBrowserViewControllerProtocol didMoveToParentViewController:](*p_contentViewController, "didMoveToParentViewController:", self);
      if (CKIsRunningInMessages())
      {
        v11 = -[CKExpandedAppViewController _currentPluginIsJellyfish](self, "_currentPluginIsJellyfish");
        objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setIdleTimerDisabled:", v11);

      }
    }
    -[CKExpandedAppViewController balloonPlugin](self, "balloonPlugin");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKExpandedAppViewController updateGrabberTitleAndIconForPlugin:](self, "updateGrabberTitleAndIconForPlugin:", v13);

    -[CKExpandedAppViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
    -[CKExpandedAppViewController reloadInputViews](self, "reloadInputViews");
    v6 = v14;
  }

}

- (void)updateGrabberTitleAndIconForPlugin:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CKAppGrabberView *grabberView;
  void *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "showInBrowser"))
  {
    objc_msgSend(v9, "browserDisplayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKExpandedAppViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "__ck_browserImageForInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    grabberView = self->_grabberView;
    objc_msgSend(v9, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAppGrabberView updateAppTitle:icon:appIdentifier:](grabberView, "updateAppTitle:icon:appIdentifier:", v4, v6, v8);

  }
  else
  {
    -[CKAppGrabberView updateAppTitle:icon:appIdentifier:](self->_grabberView, "updateAppTitle:icon:appIdentifier:", 0, 0, 0);
  }

}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView *contentView;
  void *v7;
  void *v8;
  void *v9;
  UIView *v10;

  v5 = (UIView *)a3;
  contentView = self->_contentView;
  v10 = v5;
  if (contentView != v5)
  {
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    -[CKExpandedAppViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v10);

    -[CKExpandedAppViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsLayout");

    -[CKExpandedAppViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutIfNeeded");

  }
}

- (CGRect)finalContentViewFrame
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[CKExpandedAppViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[CKExpandedAppViewController leftRightSafeAreaInsetRect:](self, "leftRightSafeAreaInsetRect:");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CKExpandedAppViewController topAreaHeight](self, "topAreaHeight");
  v13 = v7 + v12;
  v14 = v11 - (v12 + 0.0);
  v15 = v5 + 0.0;
  v16 = v9;
  result.size.height = v14;
  result.size.width = v16;
  result.origin.y = v13;
  result.origin.x = v15;
  return result;
}

- (UIEdgeInsets)additionalSafeAreaInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0CEB4B0];
  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGRect)leftRightSafeAreaInsetRect:(CGRect)a3
{
  CGFloat height;
  double width;
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKExpandedAppViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeAreaInsets");
  v9 = v8;
  v11 = v10;

  v12 = x + v9;
  v13 = y + 0.0;
  v14 = width - (v9 + v11);
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)animateBrowserViewFromSourceRect:(CGRect)a3 interactive:(BOOL)a4 grabberView:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double Width;
  double v41;
  CKImmediatePanGestureRecognizer *v42;
  CKImmediatePanGestureRecognizer *collapseGestureTracker;
  void *v44;
  double v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  uint64_t v55;
  id v56;
  id v57;
  id v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  double v63;
  double v64;
  double y;
  _QWORD v66[4];
  id v67;
  CKExpandedAppViewController *v68;
  id v69;
  double v70;
  double v71;
  double v72;
  double v73;
  _QWORD v74[4];
  id v75;
  id v76;
  CKExpandedAppViewController *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  uint64_t v83;
  double v84;
  double v85;
  CGRect v86;

  y = a3.origin.y;
  v9 = a5;
  v10 = a6;
  -[CKExpandedAppViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKExpandedAppViewController contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    -[CKExpandedAppViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v12);

  }
  -[CKExpandedAppViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v61 = v18;
  v62 = v16;
  v19 = v18;
  v21 = v20;
  v59 = v22;
  v60 = v20;
  v23 = v22;

  -[CKExpandedAppViewController leftRightSafeAreaInsetRect:](self, "leftRightSafeAreaInsetRect:", v17, v19, v21, v23);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[CKExpandedAppViewController finalContentViewFrame](self, "finalContentViewFrame");
  v31 = v30;
  v63 = v32;
  v64 = v30;
  v34 = v33;
  v35 = v32;
  v37 = v36;
  -[CKExpandedAppViewController setInitialBrowserFrame:](self, "setInitialBrowserFrame:", v25, y, v27, v29);
  v38 = v31;
  v39 = v34;
  -[CKExpandedAppViewController setTargetBrowserFrame:](self, "setTargetBrowserFrame:", v38, v34, v35, v37);
  -[CKExpandedAppViewController setInTransition:](self, "setInTransition:", 1);
  -[CKExpandedAppViewController setTransitionDirection:](self, "setTransitionDirection:", 1);
  objc_msgSend(v12, "setFrame:", v25, y, v27, v29);
  v86.origin.y = v61;
  v86.origin.x = v62;
  v86.size.height = v59;
  v86.size.width = v60;
  Width = CGRectGetWidth(v86);
  -[CKExpandedAppViewController topAreaHeight](self, "topAreaHeight");
  -[CKExpandedAppViewController leftRightSafeAreaInsetRect:](self, "leftRightSafeAreaInsetRect:", 0.0, 0.0, Width, v41);
  objc_msgSend(v9, "setFrame:");
  objc_msgSend(v11, "addSubview:", v9);
  objc_msgSend(v9, "setDelegate:", self);
  objc_storeStrong((id *)&self->_grabberView, a5);
  v42 = -[CKImmediatePanGestureRecognizer initWithTarget:action:]([CKImmediatePanGestureRecognizer alloc], "initWithTarget:action:", self, sel_collapseGestureTouchMoved_);
  collapseGestureTracker = self->_collapseGestureTracker;
  self->_collapseGestureTracker = v42;

  -[CKImmediatePanGestureRecognizer setDelegate:](self->_collapseGestureTracker, "setDelegate:", self);
  -[CKImmediatePanGestureRecognizer setDelaysTouchesEnded:](self->_collapseGestureTracker, "setDelaysTouchesEnded:", 0);
  -[CKImmediatePanGestureRecognizer setCancelsTouchesInView:](self->_collapseGestureTracker, "setCancelsTouchesInView:", 0);
  -[CKImmediatePanGestureRecognizer setDelaysTouchesBegan:](self->_collapseGestureTracker, "setDelaysTouchesBegan:", 0);
  objc_msgSend(v11, "addGestureRecognizer:", self->_collapseGestureTracker);
  -[CKExpandedAppViewController dismissView](self, "dismissView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setAlpha:", 0.0);

  -[CKAppGrabberView frame](self->_grabberView, "frame");
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v52 = v51;
  -[CKExpandedAppViewController topAreaHeight](self, "topAreaHeight");
  -[CKAppGrabberView setFrame:](self->_grabberView, "setFrame:", v46, y - v53, v50, v52);
  v54 = (void *)MEMORY[0x1E0CEABB0];
  v55 = MEMORY[0x1E0C809B0];
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = __99__CKExpandedAppViewController_animateBrowserViewFromSourceRect_interactive_grabberView_completion___block_invoke;
  v74[3] = &unk_1E27559E0;
  v78 = v64;
  v79 = v39;
  v80 = v63;
  v81 = v37;
  v75 = v12;
  v76 = v9;
  v82 = v46;
  v83 = v48;
  v84 = v50;
  v85 = v52;
  v77 = self;
  v66[0] = v55;
  v66[1] = 3221225472;
  v66[2] = __99__CKExpandedAppViewController_animateBrowserViewFromSourceRect_interactive_grabberView_completion___block_invoke_2;
  v66[3] = &unk_1E2755A08;
  v70 = v64;
  v71 = v39;
  v72 = v63;
  v73 = v37;
  v67 = v75;
  v68 = self;
  v69 = v10;
  v56 = v10;
  v57 = v75;
  v58 = v9;
  objc_msgSend(v54, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v74, v66, 0.4, 0.0, 1.0, 0.0);

}

void __99__CKExpandedAppViewController_animateBrowserViewFromSourceRect_interactive_grabberView_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  objc_msgSend(*(id *)(a1 + 40), "setRoundsTopCorners:", 1);
  objc_msgSend(*(id *)(a1 + 40), "setShowsAppTitle:", 1);
  if (objc_msgSend(*(id *)(a1 + 48), "_shouldShowDimmingView"))
  {
    objc_msgSend(*(id *)(a1 + 48), "dismissView");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAlpha:", 1.0);

  }
}

uint64_t __99__CKExpandedAppViewController_animateBrowserViewFromSourceRect_interactive_grabberView_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 40), "setInTransition:", 0);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)animateBrowserViewToTargetRect:(CGRect)a3 grabberView:(id)a4 completion:(id)a5
{
  double y;
  CKAppGrabberView *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  CKAppGrabberView *grabberView;
  CKAppGrabberView *v22;
  void *v23;
  UIViewPropertyAnimator *collapsePropertyAnimator;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;

  y = a3.origin.y;
  v8 = (CKAppGrabberView *)a4;
  v9 = a5;
  -[CKExpandedAppViewController setInTransition:](self, "setInTransition:", 1);
  -[CKExpandedAppViewController setTransitionDirection:](self, "setTransitionDirection:", 2);
  -[CKExpandedAppViewController contentViewController](self, "contentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  -[CKExpandedAppViewController contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  -[CKExpandedAppViewController setInitialBrowserFrame:](self, "setInitialBrowserFrame:", v13, v15, v17, v19);
  -[CKExpandedAppViewController setTargetBrowserFrame:](self, "setTargetBrowserFrame:", v13, y, v17, v19);
  -[CKAppGrabberView frame](self->_grabberView, "frame");
  -[CKAppGrabberView setFrame:](v8, "setFrame:");
  -[CKAppGrabberView removeFromSuperview](self->_grabberView, "removeFromSuperview");
  grabberView = self->_grabberView;
  self->_grabberView = v8;
  v22 = v8;

  -[CKExpandedAppViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", v22);

  -[CKAppGrabberView removeGestureRecognizer:](self->_grabberView, "removeGestureRecognizer:", self->_collapseGestureTracker);
  -[CKExpandedAppViewController setupPausedCollapseAnimatorIfNeeded](self, "setupPausedCollapseAnimatorIfNeeded");
  collapsePropertyAnimator = self->_collapsePropertyAnimator;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __85__CKExpandedAppViewController_animateBrowserViewToTargetRect_grabberView_completion___block_invoke;
  v27[3] = &unk_1E274CD78;
  v28 = v9;
  v25 = v9;
  -[UIViewPropertyAnimator addCompletion:](collapsePropertyAnimator, "addCompletion:", v27);
  v26 = objc_alloc_init(MEMORY[0x1E0CEA9D8]);
  -[UIViewPropertyAnimator continueAnimationWithTimingParameters:durationFactor:](self->_collapsePropertyAnimator, "continueAnimationWithTimingParameters:durationFactor:", v26, 1.0);

}

uint64_t __85__CKExpandedAppViewController_animateBrowserViewToTargetRect_grabberView_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)hideDimmingView
{
  id v2;

  -[CKExpandedAppViewController dismissView](self, "dismissView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

}

- (void)_configureTitleView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
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
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  -[CKExpandedAppViewController navbarManager](self, "navbarManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "canvasView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v6 = v5;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setHideTrailingBarButtons:", 1);
  objc_msgSend(v7, "setHideStandardTitle:", 1);
  objc_msgSend(v7, "setHideLeadingBarButtons:", 1);
  objc_msgSend(v7, "setHideBackButton:", 1);
  objc_msgSend(v7, "setHeight:", v6);
  objc_msgSend(v7, "addSubview:", v4);
  -[CKExpandedAppViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitleView:", v7);

  v17 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v4, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v20;
  objc_msgSend(v4, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v9;
  objc_msgSend(v4, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v12;
  objc_msgSend(v4, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activateConstraints:", v16);

}

- (void)appGrabberViewCloseButtonTapped:(id)a3
{
  id v3;

  -[CKExpandedAppViewController sendDelegate](self, "sendDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissAndReloadInputViews:", 1);

}

- (double)collapseTargetOriginY
{
  void *v3;
  double MaxY;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  double v17;
  CGRect v19;

  -[CKExpandedAppViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  MaxY = CGRectGetMaxY(v19);

  -[CKExpandedAppViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "expandedAppViewControllerCollapsedContentHeight:", self);
    v7 = v6;
    -[CKExpandedAppViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v8, "shouldAlwaysShowAppTitle") & 1) != 0)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "browserSwitcherExpandedGrabberHeaderHeight");
    }
    else
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "browserSwitcherCollapsedGrabberHeaderHeight");
    }
    v11 = v10;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "browserSwitcherExpandedGrabberHeaderHeight");
    v14 = v13 - v11;

    MaxY = MaxY - (v7 + v14);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isAppStripInKeyboard");

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CEA6C8], "__ck_appStripVerticalPadding");
      MaxY = MaxY + v17;
    }

  }
  return MaxY;
}

- (void)setupPausedCollapseAnimatorIfNeeded
{
  uint64_t v3;
  uint64_t v4;
  CKAppGrabberView *v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v9;
  uint64_t v10;
  CKAppGrabberView *v11;
  id v12;
  id v13;
  UIViewPropertyAnimator *v14;
  UIViewPropertyAnimator *collapsePropertyAnimator;
  UIViewPropertyAnimator *v16;
  CKAppGrabberView *v17;
  _QWORD v18[4];
  CKAppGrabberView *v19;
  id v20;
  BOOL v21;
  id location;
  _QWORD v23[4];
  CKAppGrabberView *v24;
  CKExpandedAppViewController *v25;
  id v26;
  id v27;
  uint64_t v28;

  if (!self->_collapsePropertyAnimator)
  {
    -[CKExpandedAppViewController collapseTargetOriginY](self, "collapseTargetOriginY");
    v4 = v3;
    v5 = self->_grabberView;
    -[CKExpandedAppViewController contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKExpandedAppViewController dismissView](self, "dismissView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CKAppGrabberView roundsTopCorners](v5, "roundsTopCorners");
    v9 = objc_alloc(MEMORY[0x1E0CEABC8]);
    v10 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __66__CKExpandedAppViewController_setupPausedCollapseAnimatorIfNeeded__block_invoke;
    v23[3] = &unk_1E274FBA0;
    v11 = v5;
    v28 = v4;
    v24 = v11;
    v25 = self;
    v12 = v6;
    v26 = v12;
    v13 = v7;
    v27 = v13;
    v14 = (UIViewPropertyAnimator *)objc_msgSend(v9, "initWithDuration:dampingRatio:animations:", v23, 0.25, 1.0);
    collapsePropertyAnimator = self->_collapsePropertyAnimator;
    self->_collapsePropertyAnimator = v14;

    location = 0;
    objc_initWeak(&location, self);
    v16 = self->_collapsePropertyAnimator;
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __66__CKExpandedAppViewController_setupPausedCollapseAnimatorIfNeeded__block_invoke_2;
    v18[3] = &unk_1E2755A30;
    objc_copyWeak(&v20, &location);
    v17 = v11;
    v19 = v17;
    v21 = v8;
    -[UIViewPropertyAnimator addCompletion:](v16, "addCompletion:", v18);
    -[UIViewPropertyAnimator pauseAnimation](self->_collapsePropertyAnimator, "pauseAnimation");

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

  }
}

void __66__CKExpandedAppViewController_setupPausedCollapseAnimatorIfNeeded__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  char v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  CGRect v18;

  objc_msgSend(*(id *)(a1 + 32), "frame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "visualOriginYInView:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", v3, *(double *)(a1 + 64) - v8, v5, v7);
  objc_msgSend(*(id *)(a1 + 32), "setRoundsTopCorners:", 0);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();
  v10 = 0;
  if ((v9 & 1) != 0)
    v10 = objc_msgSend(v17, "shouldAlwaysShowAppTitle", 0);
  objc_msgSend(*(id *)(a1 + 32), "setShowsAppTitle:", v10);
  objc_msgSend(*(id *)(a1 + 48), "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(*(id *)(a1 + 32), "frame");
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", v12, CGRectGetMaxY(v18), v14, v16);
  objc_msgSend(*(id *)(a1 + 56), "setAlpha:", 0.0);

}

void __66__CKExpandedAppViewController_setupPausedCollapseAnimatorIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD *WeakRetained;
  void *v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)WeakRetained[123];
    WeakRetained[123] = 0;

    WeakRetained = v6;
  }
  if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRoundsTopCorners:", *(unsigned __int8 *)(a1 + 48));
    WeakRetained = v6;
  }

}

- (void)reverseAndCleanupCollapseAnimator
{
  -[UIViewPropertyAnimator setReversed:](self->_collapsePropertyAnimator, "setReversed:", 1);
  -[UIViewPropertyAnimator startAnimation](self->_collapsePropertyAnimator, "startAnimation");
}

- (void)setGrabberView:(id)a3
{
  objc_storeStrong((id *)&self->_grabberView, a3);
}

- (void)collapseGestureTouchMoved:(id)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  uint64_t v8;
  CKImmediatePanGestureRecognizer *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v17;
  CKImmediatePanGestureRecognizer *collapseGestureTracker;
  void *v19;
  double v20;
  double v21;
  id v23;
  CGPoint v24;
  CGRect v25;

  v23 = a3;
  if (objc_msgSend(v23, "state") == 1)
  {
    -[CKImmediatePanGestureRecognizer locationInView:](self->_collapseGestureTracker, "locationInView:", self->_grabberView);
    v5 = v4;
    v7 = v6;
    -[CKAppGrabberView bounds](self->_grabberView, "bounds");
    v24.x = v5;
    v24.y = v7;
    if (CGRectContainsPoint(v25, v24))
    {
      self->_shouldDoCollapseInteraction = 1;
      self->_collapseGestureStartingLocation.x = v5;
      self->_collapseGestureStartingLocation.y = v7;
    }
  }
  if (self->_shouldDoCollapseInteraction)
  {
    v8 = objc_msgSend(v23, "state");
    switch(v8)
    {
      case 3:
        self->_shouldDoCollapseInteraction = 0;
        collapseGestureTracker = self->_collapseGestureTracker;
        -[CKExpandedAppViewController view](self, "view");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKImmediatePanGestureRecognizer translationInView:](collapseGestureTracker, "translationInView:", v19);
        v21 = v20;

        if (self->_collapseInteractionDidMove && v21 <= 50.0)
          -[CKExpandedAppViewController reverseAndCleanupCollapseAnimator](self, "reverseAndCleanupCollapseAnimator");
        else
          -[CKExpandedAppViewController collapse](self, "collapse");
        self->_collapseInteractionDidMove = 0;
        break;
      case 2:
        v9 = self->_collapseGestureTracker;
        -[CKExpandedAppViewController view](self, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKImmediatePanGestureRecognizer translationInView:](v9, "translationInView:", v10);
        v12 = v11;
        v14 = v13;

        -[CKExpandedAppViewController collapseTargetOriginY](self, "collapseTargetOriginY");
        -[UIViewPropertyAnimator setFractionComplete:](self->_collapsePropertyAnimator, "setFractionComplete:", v14 / (v15 - self->_collapseGestureStartingLocation.y));
        if (v14 > 2.0 || v12 > 2.0)
          self->_collapseInteractionDidMove = 1;
        -[UIViewPropertyAnimator fractionComplete](self->_collapsePropertyAnimator, "fractionComplete");
        if (v17 >= 1.0)
          -[CKImmediatePanGestureRecognizer finishCurrentInteraction](self->_collapseGestureTracker, "finishCurrentInteraction");
        break;
      case 1:
        self->_collapseInteractionDidMove = 0;
        -[CKExpandedAppViewController setupPausedCollapseAnimatorIfNeeded](self, "setupPausedCollapseAnimatorIfNeeded");
        break;
      default:
        self->_collapseInteractionDidMove = 0;
        if (self->_shouldDoCollapseInteraction)
        {
          self->_shouldDoCollapseInteraction = 0;
          -[CKExpandedAppViewController reverseAndCleanupCollapseAnimator](self, "reverseAndCleanupCollapseAnimator");
        }
        break;
    }
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  CKImmediatePanGestureRecognizer *v6;
  id v7;
  void *v8;
  char v9;
  BOOL v10;

  v6 = (CKImmediatePanGestureRecognizer *)a3;
  v7 = a4;
  v10 = 1;
  if (self->_collapseGestureTracker == v6)
  {
    -[CKAppGrabberView closeButton](self->_grabberView, "closeButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", v8);
    v9 = objc_msgSend(v8, "pointInside:withEvent:", 0);

    if ((v9 & 1) != 0)
      v10 = 0;
  }

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)collapse:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CKExpandedAppViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKExpandedAppViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "expandedAppViewControllerWantsToCollapse:", self);

  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  CKDismissView *dismissView;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdleTimerDisabled:", 0);

  dismissView = self->_dismissView;
  if (dismissView)
    -[CKDismissView setDelegate:](dismissView, "setDelegate:", 0);
  -[CKFullScreenAppNavbarManager setDelegate:](self->_navbarManager, "setDelegate:", 0);
  -[UIViewPropertyAnimator stopAnimation:](self->_collapsePropertyAnimator, "stopAnimation:", 1);
  v6.receiver = self;
  v6.super_class = (Class)CKExpandedAppViewController;
  -[CKExpandedAppViewController dealloc](&v6, sel_dealloc);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKExpandedAppViewController;
  -[CKExpandedAppViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CKExpandedAppViewController becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKExpandedAppViewController;
  -[CKExpandedAppViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  -[CKExpandedAppViewController contentViewController](self, "contentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKExpandedAppViewController contentViewController](self, "contentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKExpandedAppViewController contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDragTargetView:", v7);

  }
}

- (void)willMoveToParentViewController:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "setNavigationBarHidden:animated:", 1, 0);

}

- (unint64_t)supportedInterfaceOrientations
{
  CKBrowserViewControllerProtocol *contentViewController;
  void *v4;
  unint64_t v5;

  contentViewController = self->_contentViewController;
  if (contentViewController)
    return -[CKBrowserViewControllerProtocol supportedInterfaceOrientations](contentViewController, "supportedInterfaceOrientations");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportedInterfaceOrientations");

  return v5;
}

- (int64_t)preferredStatusBarStyle
{
  void *v3;
  void *v4;
  int64_t v5;
  objc_super v7;

  -[CKExpandedAppViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKExpandedAppViewController contentViewController](self, "contentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "preferredStatusBarStyle");

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CKExpandedAppViewController;
    return -[CKExpandedAppViewController preferredStatusBarStyle](&v7, sel_preferredStatusBarStyle);
  }
}

- (void)_dragBegan:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double MaxY;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  id v25;
  _QWORD v26[4];
  id v27;
  CKExpandedAppViewController *v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD aBlock[5];
  CGRect v38;

  -[CKExpandedAppViewController setInDragAndDrop:](self, "setInDragAndDrop:", 1);
  if (-[CKExpandedAppViewController fadesOutDuringStickerDrag](self, "fadesOutDuringStickerDrag"))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __42__CKExpandedAppViewController__dragBegan___block_invoke;
    aBlock[3] = &unk_1E274A208;
    aBlock[4] = self;
    v4 = _Block_copy(aBlock);
  }
  else
  {
    -[CKExpandedAppViewController contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKExpandedAppViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    v38.origin.x = v8;
    v38.origin.y = v10;
    v38.size.width = v12;
    v38.size.height = v14;
    MaxY = CGRectGetMaxY(v38);
    -[CKExpandedAppViewController topAreaHeight](self, "topAreaHeight");
    v17 = MaxY + v16;
    -[CKAppGrabberView frame](self->_grabberView, "frame");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    -[CKExpandedAppViewController topAreaHeight](self, "topAreaHeight");
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __42__CKExpandedAppViewController__dragBegan___block_invoke_2;
    v26[3] = &unk_1E2755A58;
    v29 = v8;
    v30 = v17;
    v31 = v12;
    v32 = v14;
    v27 = v5;
    v28 = self;
    v33 = v19;
    v34 = v17 - v24;
    v35 = v21;
    v36 = v23;
    v25 = v5;
    v4 = _Block_copy(v26);

  }
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v4, 0, 0.3, 0.3);

}

void __42__CKExpandedAppViewController__dragBegan___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

uint64_t __42__CKExpandedAppViewController__dragBegan___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 40), "dismissView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 968), "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
}

- (void)_dragEnded:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double x;
  CGFloat y;
  double width;
  double height;
  double MaxY;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  _QWORD v23[5];
  _QWORD aBlock[4];
  id v25;
  CKExpandedAppViewController *v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CGRect v35;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CKBrowserDragManagerDidEndDragSuccessKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) == 0)
  {
    -[CKExpandedAppViewController delegate](self, "delegate");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v22, "expandedAppViewControllerShouldDismissOnDragSuccess:", self))
    {
      -[CKExpandedAppViewController sendDelegate](self, "sendDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dismissAndReloadInputViews:", 1);

      return;
    }

  }
  v8 = -[CKExpandedAppViewController fadesOutDuringStickerDrag](self, "fadesOutDuringStickerDrag", v22);
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v10 = 0;
  }
  else
  {
    -[CKExpandedAppViewController contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKExpandedAppViewController finalContentViewFrame](self, "finalContentViewFrame");
    x = v35.origin.x;
    y = v35.origin.y;
    width = v35.size.width;
    height = v35.size.height;
    MaxY = CGRectGetMaxY(v35);
    -[CKExpandedAppViewController topAreaHeight](self, "topAreaHeight");
    objc_msgSend(v11, "setFrame:", x, MaxY + v17, width, height);
    -[CKAppGrabberView frame](self->_grabberView, "frame");
    aBlock[0] = v9;
    aBlock[1] = 3221225472;
    aBlock[2] = __42__CKExpandedAppViewController__dragEnded___block_invoke;
    aBlock[3] = &unk_1E2755A58;
    v27 = x;
    v28 = y;
    v29 = width;
    v30 = height;
    v25 = v11;
    v26 = self;
    v31 = v18;
    v32 = 0;
    v33 = v19;
    v34 = v20;
    v21 = v11;
    v10 = _Block_copy(aBlock);

  }
  v23[0] = v9;
  v23[1] = 3221225472;
  v23[2] = __42__CKExpandedAppViewController__dragEnded___block_invoke_2;
  v23[3] = &unk_1E274A1B8;
  v23[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v10, v23, 0.3, 0.3);

}

uint64_t __42__CKExpandedAppViewController__dragEnded___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  if (objc_msgSend(*(id *)(a1 + 40), "_shouldShowDimmingView"))
  {
    objc_msgSend(*(id *)(a1 + 40), "dismissView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAlpha:", 1.0);

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 968), "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
}

uint64_t __42__CKExpandedAppViewController__dragEnded___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInDragAndDrop:", 0);
}

- (id)inputAccessoryView
{
  return 0;
}

- (BOOL)canBecomeFirstResponder
{
  void *v2;
  char v3;

  -[CKExpandedAppViewController contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldShowChatChrome");

  return v3;
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
  v9.super_class = (Class)CKExpandedAppViewController;
  v7 = a4;
  -[CKExpandedAppViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__CKExpandedAppViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E27502E0;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

}

uint64_t __82__CKExpandedAppViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t result;
  void *v5;
  char v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "orientation");

  result = objc_msgSend(*(id *)(a1 + 32), "lastKnownDeviceOrientation");
  if (result != v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "expandedAppViewControllerDidTransitionFromOrientation:toOrientation:", objc_msgSend(*(id *)(a1 + 32), "lastKnownDeviceOrientation"), v3);

    }
    objc_msgSend(*(id *)(a1 + 32), "setLastKnownDeviceOrientation:", v3);
    return objc_msgSend(*(id *)(a1 + 32), "becomeFirstResponder");
  }
  return result;
}

- (void)_updateDimmingViewAlpha
{
  double v3;
  id v4;

  if (-[CKExpandedAppViewController _shouldShowDimmingView](self, "_shouldShowDimmingView"))
    v3 = 1.0;
  else
    v3 = 0.0;
  -[CKExpandedAppViewController dismissView](self, "dismissView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

}

- (void)_dismiss:(id)a3
{
  id v3;

  -[CKExpandedAppViewController sendDelegate](self, "sendDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestPresentationStyleExpanded:", 0);

}

- (void)collapse
{
  id v2;

  -[CKExpandedAppViewController sendDelegate](self, "sendDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestPresentationStyleExpanded:", 0);

}

- (BOOL)_currentPluginIsAppStore
{
  void *v2;
  void *v3;
  char v4;

  -[CKExpandedAppViewController balloonPlugin](self, "balloonPlugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D37568]);

  return v4;
}

- (BOOL)_currentPluginIsAppManager
{
  void *v2;
  void *v3;
  char v4;

  -[CKExpandedAppViewController balloonPlugin](self, "balloonPlugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.browser.MorePlugin"));

  return v4;
}

- (BOOL)_currentPluginIsJellyfish
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[CKExpandedAppViewController balloonPlugin](self, "balloonPlugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IMBalloonExtensionIDWithSuffix();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (CKBrowserViewControllerProtocol)contentViewController
{
  return self->_contentViewController;
}

- (CKExpandedAppViewControllerDelegate)delegate
{
  return (CKExpandedAppViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldDisableSnapshotView
{
  return self->_shouldDisableSnapshotView;
}

- (void)setShouldDisableSnapshotView:(BOOL)a3
{
  self->_shouldDisableSnapshotView = a3;
}

- (BOOL)addsVerticalPaddingForStatusBar
{
  return self->_addsVerticalPaddingForStatusBar;
}

- (void)setAddsVerticalPaddingForStatusBar:(BOOL)a3
{
  self->_addsVerticalPaddingForStatusBar = a3;
}

- (BOOL)fadesOutDuringStickerDrag
{
  return self->_fadesOutDuringStickerDrag;
}

- (void)setFadesOutDuringStickerDrag:(BOOL)a3
{
  self->_fadesOutDuringStickerDrag = a3;
}

- (BOOL)usesDimmingView
{
  return self->_usesDimmingView;
}

- (void)setUsesDimmingView:(BOOL)a3
{
  self->_usesDimmingView = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (CKDismissView)dismissView
{
  return self->_dismissView;
}

- (void)setDismissView:(id)a3
{
  objc_storeStrong((id *)&self->_dismissView, a3);
}

- (BOOL)inTransition
{
  return self->_inTransition;
}

- (void)setInTransition:(BOOL)a3
{
  self->_inTransition = a3;
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (CKFullScreenAppNavbarManager)navbarManager
{
  return self->_navbarManager;
}

- (void)setNavbarManager:(id)a3
{
  objc_storeStrong((id *)&self->_navbarManager, a3);
}

- (unint64_t)transitionDirection
{
  return self->_transitionDirection;
}

- (void)setTransitionDirection:(unint64_t)a3
{
  self->_transitionDirection = a3;
}

- (CGRect)initialBrowserFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_initialBrowserFrame.origin.x;
  y = self->_initialBrowserFrame.origin.y;
  width = self->_initialBrowserFrame.size.width;
  height = self->_initialBrowserFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInitialBrowserFrame:(CGRect)a3
{
  self->_initialBrowserFrame = a3;
}

- (CGRect)targetBrowserFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_targetBrowserFrame.origin.x;
  y = self->_targetBrowserFrame.origin.y;
  width = self->_targetBrowserFrame.size.width;
  height = self->_targetBrowserFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTargetBrowserFrame:(CGRect)a3
{
  self->_targetBrowserFrame = a3;
}

- (BOOL)inDragAndDrop
{
  return self->_inDragAndDrop;
}

- (void)setInDragAndDrop:(BOOL)a3
{
  self->_inDragAndDrop = a3;
}

- (int64_t)lastKnownDeviceOrientation
{
  return self->_lastKnownDeviceOrientation;
}

- (void)setLastKnownDeviceOrientation:(int64_t)a3
{
  self->_lastKnownDeviceOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navbarManager, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_dismissView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_collapsePropertyAnimator, 0);
  objc_storeStrong((id *)&self->_collapseGestureTracker, 0);
  objc_storeStrong((id *)&self->_grabberView, 0);
}

- (BOOL)wantsDarkUI
{
  return 0;
}

- (BOOL)wantsOpaqueUI
{
  return 0;
}

- (BOOL)supportsQuickView
{
  return 0;
}

- (BOOL)mayBeKeptInViewHierarchy
{
  return 0;
}

- (BOOL)shouldSuppressEntryView
{
  return 0;
}

- (BOOL)shouldDisableInsetsForGrabber
{
  return 0;
}

- (BOOL)isDismissing
{
  return 0;
}

- (BOOL)isPrimaryViewController
{
  return -[CKBrowserViewControllerProtocol isPrimaryViewController](self->_contentViewController, "isPrimaryViewController");
}

- (void)setIsPrimaryViewController:(BOOL)a3
{
  -[CKBrowserViewControllerProtocol setIsPrimaryViewController:](self->_contentViewController, "setIsPrimaryViewController:", a3);
}

- (UIViewController)presentationViewController
{
  return (UIViewController *)-[CKBrowserViewControllerProtocol presentationViewController](self->_contentViewController, "presentationViewController");
}

- (void)setPresentationViewController:(id)a3
{
  -[CKBrowserViewControllerProtocol setPresentationViewController:](self->_contentViewController, "setPresentationViewController:", a3);
}

- (CKBrowserViewControllerSendDelegate)sendDelegate
{
  return (CKBrowserViewControllerSendDelegate *)-[CKBrowserViewControllerProtocol sendDelegate](self->_contentViewController, "sendDelegate");
}

- (void)setSendDelegate:(id)a3
{
  -[CKBrowserViewControllerProtocol setSendDelegate:](self->_contentViewController, "setSendDelegate:", a3);
}

- (IMBalloonPlugin)balloonPlugin
{
  return (IMBalloonPlugin *)-[CKBrowserViewControllerProtocol balloonPlugin](self->_contentViewController, "balloonPlugin");
}

- (IMBalloonPluginDataSource)balloonPluginDataSource
{
  return (IMBalloonPluginDataSource *)-[CKBrowserViewControllerProtocol balloonPluginDataSource](self->_contentViewController, "balloonPluginDataSource");
}

- (void)setBalloonPluginDataSource:(id)a3
{
  -[CKBrowserViewControllerProtocol setBalloonPluginDataSource:](self->_contentViewController, "setBalloonPluginDataSource:", a3);
}

- (BOOL)shouldShowChatChrome
{
  return -[CKBrowserViewControllerProtocol shouldShowChatChrome](self->_contentViewController, "shouldShowChatChrome");
}

- (BOOL)isiMessage
{
  return -[CKBrowserViewControllerProtocol isiMessage](self->_contentViewController, "isiMessage");
}

- (void)setIsiMessage:(BOOL)a3
{
  -[CKBrowserViewControllerProtocol setIsiMessage:](self->_contentViewController, "setIsiMessage:", a3);
}

- (BOOL)isBusiness
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[CKBrowserViewControllerProtocol isBusiness](self->_contentViewController, "isBusiness");
  else
    return 0;
}

- (void)setIsBusiness:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CKBrowserViewControllerProtocol setIsBusiness:](self->_contentViewController, "setIsBusiness:", v3);
}

- (NSString)conversationID
{
  return (NSString *)-[CKBrowserViewControllerProtocol conversationID](self->_contentViewController, "conversationID");
}

- (void)setConversationID:(id)a3
{
  -[CKBrowserViewControllerProtocol setConversationID:](self->_contentViewController, "setConversationID:", a3);
}

- (int64_t)browserPresentationStyle
{
  return -[CKBrowserViewControllerProtocol browserPresentationStyle](self->_contentViewController, "browserPresentationStyle");
}

- (CKExpandedAppViewController)initWithBalloonPlugin:(id)a3 dataSource:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  __assert_rtn("-[CKExpandedAppViewController(CKBrowserViewControllerProtocol) initWithBalloonPlugin:dataSource:]", "CKExpandedAppViewController.m", 876, "false");
}

- (CKExpandedAppViewController)initWithBalloonPlugin:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[CKExpandedAppViewController(CKBrowserViewControllerProtocol) initWithBalloonPlugin:]", "CKExpandedAppViewController.m", 880, "false");
}

- (void)dismiss
{
  void *v3;
  char v4;
  void *v5;

  if (-[CKExpandedAppViewController _currentPluginIsAppManager](self, "_currentPluginIsAppManager"))
  {
    -[CKExpandedAppViewController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      -[CKExpandedAppViewController delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "expandedAppViewControllerWantsToCollapse:", self);

    }
  }
  -[CKExpandedAppViewController _dismiss:](self, "_dismiss:", 0);
}

- (BOOL)isLoaded
{
  return 0;
}

- (BOOL)inExpandedPresentation
{
  return 1;
}

- (BOOL)inFullScreenModalPresentation
{
  return 0;
}

@end

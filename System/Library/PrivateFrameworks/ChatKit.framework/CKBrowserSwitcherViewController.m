@implementation CKBrowserSwitcherViewController

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[CKBrowserSwitcherViewController unloadRemoteViewControllers](self, "unloadRemoteViewControllers");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdleTimerDisabled:", 0);

  -[UIViewPropertyAnimator stopAnimation:](self->_expandPropertyAnimator, "stopAnimation:", 1);
  v6.receiver = self;
  v6.super_class = (Class)CKBrowserSwitcherViewController;
  -[CKBrowserSwitcherViewController dealloc](&v6, sel_dealloc);
}

- (CKBrowserSwitcherViewController)initWithConversation:(id)a3 sendDelegate:(id)a4 presentingViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  CKBrowserSwitcherViewController *v11;
  CKBrowserTransitionCoordinator *v12;
  CFMutableDictionaryRef Mutable;
  NSMutableDictionary *livePluginIdentifierToTimestampMap;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CKBrowserSwitcherViewController;
  v11 = -[CKBrowserSwitcherViewController init](&v22, sel_init);
  if (v11)
  {
    v12 = objc_alloc_init(CKBrowserTransitionCoordinator);
    -[CKBrowserTransitionCoordinator setConversation:](v12, "setConversation:", v8);
    -[CKBrowserTransitionCoordinator setSendDelegate:](v12, "setSendDelegate:", v9);
    -[CKBrowserTransitionCoordinator setPresentingViewController:](v12, "setPresentingViewController:", v10);
    -[CKBrowserSwitcherViewController setTransitionCoordinator:](v11, "setTransitionCoordinator:", v12);
    -[CKBrowserTransitionCoordinator setDelegate:](v12, "setDelegate:", v11);
    -[CKBrowserSwitcherViewController setBrowserViewReadyForUserInteraction:](v11, "setBrowserViewReadyForUserInteraction:", 0);
    -[CKBrowserSwitcherViewController setAllowFooterLabelUpdates:](v11, "setAllowFooterLabelUpdates:", 0);
    if (!v11->_livePluginIdentifierToTimestampMap)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      livePluginIdentifierToTimestampMap = v11->_livePluginIdentifierToTimestampMap;
      v11->_livePluginIdentifierToTimestampMap = (NSMutableDictionary *)Mutable;

    }
    -[CKBrowserSwitcherViewController setTransitioningFromSnapshotToLiveView:](v11, "setTransitioningFromSnapshotToLiveView:", 0);
    -[CKBrowserSwitcherViewController setAllowPluginLaunchNotifications:](v11, "setAllowPluginLaunchNotifications:", 1);
    location = 0;
    objc_initWeak(&location, v11);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __94__CKBrowserSwitcherViewController_initWithConversation_sendDelegate_presentingViewController___block_invoke;
    v19[3] = &unk_1E2755FF0;
    objc_copyWeak(&v20, &location);
    v17 = (id)objc_msgSend(v15, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.messages.CKScreenTimeDidEnterCurrentAppRestrictionNotification"), 0, v16, v19);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

  }
  return v11;
}

void __94__CKBrowserSwitcherViewController_initWithConversation_sendDelegate_presentingViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "balloonPlugin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Downtime will show blocking shield notification received. Tearing down currently displayed MessageApp with bundleID: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  objc_msgSend(WeakRetained, "appGrabberViewCloseButtonTapped:", 0);

}

- (void)loadView
{
  _CKBrowserSwitcherView *v3;
  void *v4;
  _CKBrowserSwitcherView *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CKImmediatePanGestureRecognizer *v30;
  CKImmediatePanGestureRecognizer *expandGestureTracker;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)CKBrowserSwitcherViewController;
  -[CKBrowserSwitcherViewController loadView](&v40, sel_loadView);
  v3 = [_CKBrowserSwitcherView alloc];
  -[CKBrowserSwitcherViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v5 = -[_CKBrowserSwitcherView initWithFrame:](v3, "initWithFrame:");

  -[CKBrowserSwitcherViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CKBrowserSwitcherView setAutoresizingMask:](v5, "setAutoresizingMask:", objc_msgSend(v6, "autoresizingMask"));

  -[CKBrowserSwitcherViewController setView:](self, "setView:", v5);
  -[_CKBrowserSwitcherView bounds](v5, "bounds");
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v7, v8, v9, v10);
  -[CKBrowserSwitcherViewController setContentView:](self, "setContentView:", v11);
  -[CKBrowserSwitcherViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v11);

  objc_msgSend(v11, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[CKBrowserSwitcherViewController restingContainerViewOriginY](self, "restingContainerViewOriginY");
  v20 = v19;
  v21 = v18 - v19;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "browserSwitcherExpandThreshold");
  v24 = v21 + v23;

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v14, v20, v16, v24);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "theme");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "browserSwitcherGutterColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBackgroundColor:", v28);

  objc_msgSend(v25, "setAccessibilityIdentifier:", CFSTR("appBrowserSwitcherIdentifier"));
  objc_msgSend(v25, "setSemanticContentAttribute:", 3);
  -[CKBrowserSwitcherViewController setBrowserContainer:](self, "setBrowserContainer:", v25);
  objc_msgSend(v11, "addSubview:", v25);
  -[CKBrowserSwitcherViewController grabberView](self, "grabberView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v29);

  v30 = -[CKImmediatePanGestureRecognizer initWithTarget:action:]([CKImmediatePanGestureRecognizer alloc], "initWithTarget:action:", self, sel_expandGestureTouchMoved_);
  expandGestureTracker = self->_expandGestureTracker;
  self->_expandGestureTracker = v30;

  -[CKImmediatePanGestureRecognizer setDelegate:](self->_expandGestureTracker, "setDelegate:", self);
  -[CKImmediatePanGestureRecognizer setDelaysTouchesEnded:](self->_expandGestureTracker, "setDelaysTouchesEnded:", 0);
  -[CKImmediatePanGestureRecognizer setCancelsTouchesInView:](self->_expandGestureTracker, "setCancelsTouchesInView:", 0);
  -[CKImmediatePanGestureRecognizer setDelaysTouchesBegan:](self->_expandGestureTracker, "setDelaysTouchesBegan:", 0);
  -[_CKBrowserSwitcherView addGestureRecognizer:](v5, "addGestureRecognizer:", self->_expandGestureTracker);
  v32 = objc_alloc_init(MEMORY[0x1E0CEA730]);
  objc_msgSend(v32, "setMinimumPressDuration:", 0.0);
  objc_msgSend(v32, "setCancelsTouchesInView:", 0);
  objc_msgSend(v32, "setDelaysTouchesBegan:", 0);
  objc_msgSend(v32, "setDelaysTouchesEnded:", 0);
  objc_msgSend(v32, "setDelegate:", self);
  objc_msgSend(v25, "addGestureRecognizer:", v32);
  -[CKBrowserSwitcherViewController setTouchTracker:](self, "setTouchTracker:", v32);
  if (IMIsRunningIniMessageAppsViewService())
  {
    v33 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    -[CKBrowserSwitcherViewController setShadowView:](self, "setShadowView:", v33);

    -[CKBrowserSwitcherViewController shadowView](self, "shadowView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setShadowRadius:", 4.0);

    -[CKBrowserSwitcherViewController shadowView](self, "shadowView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setShadowOffset:", 0.0, -6.0);

    -[CKBrowserSwitcherViewController view](self, "view");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserSwitcherViewController shadowView](self, "shadowView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "insertSubview:atIndex:", v39, 0);

  }
}

- (id)activeBrowserView
{
  void *v2;
  void *v3;

  -[CKBrowserSwitcherViewController currentViewController](self, "currentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)viewDidLayoutSubviews
{
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
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  double v55;
  double v56;
  double v57;
  id v58;
  uint64_t v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  BOOL v71;
  double v72;
  float v73;
  void *v74;
  void *v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  double v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  _BOOL4 v94;
  void *v95;
  void *v96;
  void *v97;
  void (**v98)(void);
  objc_super v99;
  CGRect v100;

  v99.receiver = self;
  v99.super_class = (Class)CKBrowserSwitcherViewController;
  -[CKBrowserSwitcherViewController viewDidLayoutSubviews](&v99, sel_viewDidLayoutSubviews);
  -[CKBrowserSwitcherViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v7 = v6;

  -[CKBrowserSwitcherViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;

  v13 = v7 + v5;
  if (-[CKBrowserSwitcherViewController _hasLandscapeGutters](self, "_hasLandscapeGutters"))
  {
    -[CKBrowserSwitcherViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", 0);

  }
  v15 = v5 + v10;
  v16 = v12 - v13;
  -[CKBrowserSwitcherViewController grabberView](self, "grabberView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserSwitcherViewController contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isDescendantOfView:", v18);

  if (v19)
  {
    -[CKBrowserSwitcherViewController restingGrabberFrame](self, "restingGrabberFrame");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    -[CKBrowserSwitcherViewController grabberView](self, "grabberView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

    -[CKBrowserSwitcherViewController grabberView](self, "grabberView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "frame");
    v31 = v30;
    -[CKBrowserSwitcherViewController browserContainer](self, "browserContainer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "frame");
    v34 = v31 + v33;

    -[CKBrowserSwitcherViewController grabberView](self, "grabberView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "frame");
    v37 = v36;
    v39 = v38;
    -[CKBrowserSwitcherViewController grabberView](self, "grabberView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "frame");
    v42 = v41;
    -[CKBrowserSwitcherViewController shadowView](self, "shadowView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setFrame:", v37, v39, v42, v34);

    v44 = (void *)MEMORY[0x1E0CEA390];
    -[CKBrowserSwitcherViewController shadowView](self, "shadowView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "frame");
    v47 = v46;
    v49 = v48;
    v51 = v50;
    v53 = v52;
    v54 = UIRectCornersAtEdges();
    -[CKAppGrabberView _cornerRadius](self->_grabberView, "_cornerRadius");
    v56 = v55;
    -[CKAppGrabberView _cornerRadius](self->_grabberView, "_cornerRadius");
    objc_msgSend(v44, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v54, v47, v49, v51, v53, v56, v57);
    v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v59 = objc_msgSend(v58, "CGPath");
    -[CKBrowserSwitcherViewController shadowView](self, "shadowView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "layer");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setShadowPath:", v59);

  }
  else
  {
    -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserSwitcherViewController cachedCompactFrameInWindowCoordsForBrowserTransitionCoordinator:](self, "cachedCompactFrameInWindowCoordsForBrowserTransitionCoordinator:", v45);
    v63 = v62;
    v65 = v64;
    v67 = v66;
    v69 = v68;
    -[CKBrowserSwitcherViewController shadowView](self, "shadowView");
    v58 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setFrame:", v63, v65, v67, v69);
  }

  +[CKAppGrabberView compactRoundedCornerRadius](CKAppGrabberView, "compactRoundedCornerRadius");
  v71 = v70 <= 0.0;
  v72 = 0.06;
  if (v71)
    v72 = 0.0;
  v73 = v72;
  -[CKBrowserSwitcherViewController shadowView](self, "shadowView");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "layer");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v76 = v73;
  objc_msgSend(v75, "setShadowOpacity:", v76);

  -[CKBrowserSwitcherViewController contentView](self, "contentView");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserSwitcherViewController view](self, "view");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "bounds");
  objc_msgSend(v77, "setFrame:");

  -[CKBrowserSwitcherViewController contentView](self, "contentView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "bounds");
  v81 = v80;

  -[CKBrowserSwitcherViewController restingContainerViewOriginY](self, "restingContainerViewOriginY");
  v83 = v82;
  v84 = v81 - v82;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "browserSwitcherExpandThreshold");
  v87 = v84 + v86;

  -[CKBrowserSwitcherViewController browserContainer](self, "browserContainer");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setFrame:", v15, v83, v16, v87);

  -[CKBrowserSwitcherViewController cell](self, "cell");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserSwitcherViewController browserContainer](self, "browserContainer");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "bounds");
  objc_msgSend(v89, "setFrame:");

  -[CKBrowserSwitcherViewController currentViewController](self, "currentViewController");
  v91 = objc_claimAutoreleasedReturnValue();
  if (v91)
  {
    v92 = (void *)v91;
    -[CKBrowserSwitcherViewController activeBrowserView](self, "activeBrowserView");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "frame");
    v94 = CGRectEqualToRect(v100, *MEMORY[0x1E0C9D648]);

    if (v94)
    {
      -[CKBrowserSwitcherViewController currentViewController](self, "currentViewController");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "balloonPlugin");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBrowserSwitcherViewController _updateBrowserViewPositionForPluginAndInsertIfNecessary:](self, "_updateBrowserViewPositionForPluginAndInsertIfNecessary:", v96);

    }
  }
  -[CKBrowserSwitcherViewController setViewHasLaidOutSubviews:](self, "setViewHasLaidOutSubviews:", 1);
  -[CKBrowserSwitcherViewController performAfterFirstLayoutBlock](self, "performAfterFirstLayoutBlock");
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  if (v97)
  {
    -[CKBrowserSwitcherViewController performAfterFirstLayoutBlock](self, "performAfterFirstLayoutBlock");
    v98 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v98[2]();

    -[CKBrowserSwitcherViewController setPerformAfterFirstLayoutBlock:](self, "setPerformAfterFirstLayoutBlock:", 0);
  }
}

- (BOOL)isBrowserSwitcherFirstLaunch
{
  void *v2;
  char v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("BrowserSwitcherFirstLaunch"));

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBool:forKey:", 1, CFSTR("BrowserSwitcherFirstLaunch"));

  }
  return v3 ^ 1;
}

- (void)layoutMarginsDidChange
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Layout margins changed, calling setNeedsLayout", v5, 2u);
    }

  }
  -[CKBrowserSwitcherViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKBrowserSwitcherViewController;
  -[CKBrowserSwitcherViewController viewDidLoad](&v11, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_dragManagerWillStartDrag_, CFSTR("CKBrowserDragManagerWillStartDraggingNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_dragManagerDidStartDrag_, CFSTR("CKBrowserDragManagerDidStartDraggingNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_dragManagerDidEndDragging_, CFSTR("CKBrowserDragManagerDidEndDraggingNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__transitionSnapshotViewToBrowserViewAfterViewDidPrepareForDisplay_, CFSTR("CKMessageExtensionBrowserViewControllerDidPrepareForDisplay"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__handleRemoteViewControllerConnectionInterrupted_, *MEMORY[0x1E0D37E88], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__handleRemoteViewControllerConnectionInterrupted_, CFSTR("CKRemoteViewFailedInstantiationNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_saveSnapshotForCurrentBrowserViewControllerIfPossible, *MEMORY[0x1E0CEB358], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__handleVisibleSwitcherPluginsChanged_, CFSTR("CKBrowserSelectionControllerVisibleSwitcherPluginsChangedNotification"), 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKBrowserSwitcherViewController;
  -[CKBrowserSwitcherViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[CKBrowserSwitcherViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKBrowserSwitcherViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "switcherViewControllerWillAppear:", self);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKBrowserSwitcherViewController;
  -[CKBrowserSwitcherViewController viewWillDisappear:](&v10, sel_viewWillDisappear_, a3);
  -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "currentConsumer") == 1)
  {
    -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isPresentingFullScreenModal");

    if ((v6 & 1) == 0)
      -[CKBrowserSwitcherViewController _updateCurrentBrowserSnapshotIfPossible](self, "_updateCurrentBrowserSnapshotIfPossible");
  }
  else
  {

  }
  -[CKBrowserSwitcherViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CKBrowserSwitcherViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "switcherViewControllerWillDisappear:", self);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKBrowserSwitcherViewController;
  -[CKBrowserSwitcherViewController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "currentConsumer") != 1)
    goto LABEL_4;
  -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isPresentingFullScreenModal"))
  {

LABEL_4:
    goto LABEL_5;
  }
  -[CKBrowserSwitcherViewController currentViewController](self, "currentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isLoaded");

  if (v8)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__CKBrowserSwitcherViewController_viewDidAppear___block_invoke;
    v9[3] = &unk_1E274A208;
    v9[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v9);
  }
LABEL_5:
  -[CKBrowserSwitcherViewController setInsertedViaCollapse:](self, "setInsertedViaCollapse:", 0);
  if (__CurrentTestName)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("PPTDidShowBrowserSwitcherViewController"), self, 0);

    }
  }
}

uint64_t __49__CKBrowserSwitcherViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transitionSnapshotViewToBrowserView");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKBrowserSwitcherViewController;
  -[CKBrowserSwitcherViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CKBrowserSwitcherViewController setAllowFooterLabelUpdates:](self, "setAllowFooterLabelUpdates:", 0);
  -[CKBrowserSwitcherViewController stopExpandAnimatorAndCleanupState](self, "stopExpandAnimatorAndCleanupState");
}

- (void)transitionToFullscreen
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  if (!-[CKBrowserSwitcherViewController isTransitioningExpandedState](self, "isTransitioningExpandedState"))
  {
    -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "currentConsumer");

    if (v4 != 2)
    {
      -[CKBrowserSwitcherViewController setTransitioningExpandedState:](self, "setTransitioningExpandedState:", 1);
      -[CKBrowserSwitcherViewController currentViewController](self, "currentViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        if (self->_expandPropertyAnimator)
          -[CKBrowserSwitcherViewController stopExpandAnimatorAndCleanupState](self, "stopExpandAnimatorAndCleanupState");
        location = 0;
        objc_initWeak(&location, self);
        -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "releaseOwnershipOfBrowserForConsumer:", 1);

        -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __57__CKBrowserSwitcherViewController_transitionToFullscreen__block_invoke;
        v8[3] = &unk_1E274B548;
        objc_copyWeak(&v9, &location);
        objc_msgSend(v7, "transitionCurrentBrowserToExpandedPresentationAnimated:completion:", 1, v8);

        objc_destroyWeak(&v9);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __57__CKBrowserSwitcherViewController_transitionToFullscreen__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "setTransitioningExpandedState:", 0);

}

- (void)transitionToCollapsed
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  if (!-[CKBrowserSwitcherViewController isTransitioningExpandedState](self, "isTransitioningExpandedState"))
  {
    -[CKBrowserSwitcherViewController setTransitioningExpandedState:](self, "setTransitioningExpandedState:", 1);
    location = 0;
    objc_initWeak(&location, self);
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __56__CKBrowserSwitcherViewController_transitionToCollapsed__block_invoke;
    v10 = &unk_1E274B548;
    objc_copyWeak(&v11, &location);
    v3 = _Block_copy(&v7);
    -[CKBrowserSwitcherViewController balloonPlugin](self, "balloonPlugin", v7, v8, v9, v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldHideAppSwitcher");

    if (v5)
    {
      -[CKBrowserSwitcherViewController dismissBrowserFullscreenAnimated:withCompletion:](self, "dismissBrowserFullscreenAnimated:withCompletion:", 1, v3);
    }
    else
    {
      -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "transitionCurrentBrowserToCollapsedPresentationAnimated:completion:", 1, v3);

    }
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __56__CKBrowserSwitcherViewController_transitionToCollapsed__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setTransitioningExpandedState:", 0);

}

- (CGSize)browserTransitionCoordinator:(id)a3 preferredSizeForBrowser:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  v6 = a3;
  v7 = a4;
  v9 = *MEMORY[0x1E0C9D820];
  v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (-[CKBrowserSwitcherViewController viewHasLaidOutSubviews](self, "viewHasLaidOutSubviews")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CKBrowserSwitcherViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8;
    v12 = v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "browserTransitionCoordinator:preferredSizeForBrowser:", v6, v7);
      v12 = v13;
      v11 = v14;
    }
    v15 = v12 == v9 && v11 == v8;
    if (v15 && -[CKBrowserSwitcherViewController browserIsLoadingCompact](self, "browserIsLoadingCompact"))
    {
      -[CKBrowserSwitcherViewController browserContainer](self, "browserContainer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bounds");
      v12 = v17;
      v11 = v18;

    }
    v8 = v11;
    v9 = v12;
  }

  v19 = v9;
  v20 = v8;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)browserTransitionCoordinator:(id)a3 willPresentBrowserModally:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[CKBrowserSwitcherViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CKBrowserSwitcherViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "switcherViewController:willPresentBrowserModally:", self, v8);

  }
}

- (void)browserTransitionCoordinator:(id)a3 didTransitionFromOrientation:(int64_t)a4 toOrientation:(int64_t)a5
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[CKBrowserSwitcherViewController livePluginIdentifierToTimestampMap](self, "livePluginIdentifierToTimestampMap", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v7;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11);
        +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "existingViewControllerForPluginIdentifier:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "didTransitionFromOrientation:toOrientation:", a4, a5);
        -[CKBrowserSwitcherViewController balloonPlugin](self, "balloonPlugin");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v12);

        if ((v17 & 1) == 0)
          -[CKBrowserSwitcherViewController _removeBrowserWithPluginIdentifierFromViewHierarchy:](self, "_removeBrowserWithPluginIdentifierFromViewHierarchy:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  _QWORD v9[5];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[CKBrowserSwitcherViewController currentViewController](self, "currentViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__CKBrowserSwitcherViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E274B4D0;
  v9[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, 0);

}

void __86__CKBrowserSwitcherViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "childViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __86__CKBrowserSwitcherViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v3[3] = &unk_1E27592D0;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);

}

void __86__CKBrowserSwitcherViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE1E8320))
  {
    objc_msgSend(v4, "balloonPlugin");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_updateBrowserViewPositionForPluginAndInsertIfNecessary:", v3);

  }
}

- (void)reinsertAppGrabberViewForBrowserTransitionCoordinator:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CKBrowserSwitcherViewController grabberView](self, "grabberView", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CKBrowserSwitcherViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v9, "isDescendantOfView:", v4);

  if ((v5 & 1) == 0)
  {
    -[CKBrowserSwitcherViewController contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v9);

    objc_msgSend(v9, "setDelegate:", self);
    -[CKBrowserSwitcherViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayout");

    -[CKBrowserSwitcherViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutIfNeeded");

  }
}

- (CGRect)cachedCompactFrameInWindowCoordsForBrowserTransitionCoordinator:(id)a3
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
  double v14;
  double v15;
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
  CGRect result;

  -[CKBrowserSwitcherViewController browserContainer](self, "browserContainer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKBrowserSwitcherViewController restingContainerViewOriginY](self, "restingContainerViewOriginY");
  v12 = v11;
  objc_msgSend(v4, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertRect:toView:", 0, v6, v12, v8, v10);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)dismissBrowserFullscreenAnimated:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[CKBrowserSwitcherViewController setCurrentViewController:](self, "setCurrentViewController:", 0);
  -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissCurrentExpandedBrowserAnimated:completion:", v4, v6);

}

- (CGRect)restingGrabberFrame
{
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
  int v14;
  double v15;
  double v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  -[CKBrowserSwitcherViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[CKBrowserSwitcherViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeAreaInsets");
  v10 = v9;
  v12 = v11;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isAppStripInKeyboard");

  v15 = 0.0;
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CEA6C8], "__ck_appStripVerticalPadding");
    v15 = v16;
  }
  -[CKBrowserSwitcherViewController delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0
    && (-[CKBrowserSwitcherViewController delegate](self, "delegate"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v19, "switcherViewControllerShouldShowIconAndTitleWhenCompact:", self),
        v19,
        (v20 & 1) != 0))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "browserSwitcherExpandedGrabberHeaderHeight");
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "browserSwitcherCollapsedGrabberHeaderHeight");
  }
  v23 = v22;

  v24 = v5 + v10;
  v25 = v7 - (v10 + v12);
  v26 = v15;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v25;
  result.origin.y = v26;
  result.origin.x = v24;
  return result;
}

- (double)restingContainerViewOriginY
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  int v7;
  double v8;

  -[CKBrowserSwitcherViewController restingGrabberFrame](self, "restingGrabberFrame");
  v3 = v2;
  v5 = v4;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAppStripInKeyboard");

  v8 = -0.0;
  if (v7)
    v8 = v3;
  return v5 + v8;
}

- (double)_rubberBandOffsetWithoutDecorationForOffset:(double)result maxOffset:(double)a4 minOffset:(double)a5 range:(double)a6 outside:(BOOL *)a7
{
  if (a5 >= a4)
    a4 = a5;
  if (fabs(a6) >= 2.22044605e-16)
  {
    if (a4 < result)
    {
      result = a4 + (1.0 - 1.0 / ((result - a4) / a6 * 0.55 + 1.0)) * a6;
      if (!a7)
        return result;
LABEL_9:
      *a7 = 1;
      return result;
    }
    if (result < a5)
    {
      result = a5 - (1.0 - 1.0 / ((a5 - result) / a6 * 0.55 + 1.0)) * a6;
      if (a7)
        goto LABEL_9;
    }
  }
  return result;
}

- (void)setupPausedExpandAnimatorIfNeeded
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  UIViewPropertyAnimator *v13;
  UIViewPropertyAnimator *expandPropertyAnimator;
  UIViewPropertyAnimator *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void *v20;
  id v21;
  id v22;
  char v23;
  id location;
  _QWORD v25[4];
  id v26;
  CKBrowserSwitcherViewController *v27;
  id v28;
  double v29;

  if (!self->_expandPropertyAnimator)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "browserSwitcherExpandThreshold");
    v5 = -v4;

    -[CKBrowserSwitcherViewController grabberView](self, "grabberView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserSwitcherViewController browserContainer](self, "browserContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "roundsTopCorners");
    v9 = objc_alloc(MEMORY[0x1E0CEABC8]);
    v10 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __68__CKBrowserSwitcherViewController_setupPausedExpandAnimatorIfNeeded__block_invoke;
    v25[3] = &unk_1E274FBF0;
    v11 = v6;
    v29 = v5;
    v26 = v11;
    v27 = self;
    v12 = v7;
    v28 = v12;
    v13 = (UIViewPropertyAnimator *)objc_msgSend(v9, "initWithDuration:dampingRatio:animations:", v25, 0.25, 1.0);
    expandPropertyAnimator = self->_expandPropertyAnimator;
    self->_expandPropertyAnimator = v13;

    location = 0;
    objc_initWeak(&location, self);
    v15 = self->_expandPropertyAnimator;
    v17 = v10;
    v18 = 3221225472;
    v19 = __68__CKBrowserSwitcherViewController_setupPausedExpandAnimatorIfNeeded__block_invoke_2;
    v20 = &unk_1E2755A30;
    objc_copyWeak(&v22, &location);
    v16 = v11;
    v21 = v16;
    v23 = v8;
    -[UIViewPropertyAnimator addCompletion:](v15, "addCompletion:", &v17);
    -[UIViewPropertyAnimator pauseAnimation](self->_expandPropertyAnimator, "pauseAnimation", v17, v18, v19, v20);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

  }
}

uint64_t __68__CKBrowserSwitcherViewController_setupPausedExpandAnimatorIfNeeded__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
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
  CGRect v18;

  objc_msgSend(*(id *)(a1 + 32), "frame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "visualOriginYInView:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", v3, *(double *)(a1 + 56) - v8, v5, v7);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1104), "frame");
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "frame");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1104), "setFrame:", v10);
  objc_msgSend(*(id *)(a1 + 32), "setRoundsTopCorners:", 1);
  objc_msgSend(*(id *)(a1 + 48), "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(*(id *)(a1 + 32), "frame");
  return objc_msgSend(*(id *)(a1 + 48), "setFrame:", v12, CGRectGetMaxY(v18), v14, v16);
}

void __68__CKBrowserSwitcherViewController_setupPausedExpandAnimatorIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD *WeakRetained;
  void *v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)WeakRetained[122];
    WeakRetained[122] = 0;

    WeakRetained = v6;
  }
  if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRoundsTopCorners:", *(unsigned __int8 *)(a1 + 48));
    WeakRetained = v6;
  }

}

- (void)stopExpandAnimatorAndCleanupState
{
  -[UIViewPropertyAnimator stopAnimation:](self->_expandPropertyAnimator, "stopAnimation:", 1);
  -[CKBrowserSwitcherViewController cleanupExpandAnimatorState](self, "cleanupExpandAnimatorState");
}

- (void)cleanupExpandAnimatorState
{
  UIViewPropertyAnimator *expandPropertyAnimator;

  expandPropertyAnimator = self->_expandPropertyAnimator;
  self->_expandPropertyAnimator = 0;

  self->_isDoingExpandInteraction = 0;
}

- (void)reverseAndCleanupExpandAnimator
{
  -[UIViewPropertyAnimator setReversed:](self->_expandPropertyAnimator, "setReversed:", 1);
  -[UIViewPropertyAnimator startAnimation](self->_expandPropertyAnimator, "startAnimation");
}

- (void)expandGestureTouchMoved:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v15;
  double v16;
  CKImmediatePanGestureRecognizer *expandGestureTracker;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  double MaxY;
  double v36;
  double v37;
  double v38;
  UIViewPropertyAnimator *expandPropertyAnimator;
  double v40;
  double v41;
  _QWORD v42[4];
  id v43;
  id location;
  CGPoint v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  switch(v5)
  {
    case 3:
      self->_isDoingExpandInteraction = 0;
      if (self->_expandGestureStartedOnGrabber && !self->_expandInteractionDidMove
        || (-[UIViewPropertyAnimator fractionComplete](self->_expandPropertyAnimator, "fractionComplete"), v16 >= 1.0))
      {
        -[CKBrowserSwitcherViewController stopExpandAnimatorAndCleanupState](self, "stopExpandAnimatorAndCleanupState");
        -[CKBrowserSwitcherViewController handleExpandButton:](self, "handleExpandButton:", 0);
      }
      else
      {
        -[CKBrowserSwitcherViewController reverseAndCleanupExpandAnimator](self, "reverseAndCleanupExpandAnimator");
      }
      self->_expandInteractionDidMove = 0;
      break;
    case 2:
      if (!-[CKBrowserSwitcherViewController isDragging](self, "isDragging")
        && !-[CKBrowserSwitcherViewController isInDragAndDrop](self, "isInDragAndDrop"))
      {
        expandGestureTracker = self->_expandGestureTracker;
        -[CKBrowserSwitcherViewController view](self, "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKImmediatePanGestureRecognizer translationInView:](expandGestureTracker, "translationInView:", v18);
        v41 = v19;
        v21 = v20;

        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "browserSwitcherExpandThreshold");
        v24 = v23;

        -[CKBrowserSwitcherViewController contentView](self, "contentView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "bounds");
        v27 = v26;
        v29 = v28;
        v31 = v30;
        v33 = v32;

        v34 = v21 + self->_expandGestureTranslationOffset;
        v47.origin.x = v27;
        v47.origin.y = v29;
        v47.size.width = v31;
        v47.size.height = v33;
        MaxY = CGRectGetMaxY(v47);
        v48.origin.x = v27;
        v48.origin.y = v29;
        v48.size.width = v31;
        v48.size.height = v33;
        -[CKBrowserSwitcherViewController _rubberBandOffsetWithoutDecorationForOffset:maxOffset:minOffset:range:outside:](self, "_rubberBandOffsetWithoutDecorationForOffset:maxOffset:minOffset:range:outside:", 0, v34, MaxY, -24.0, CGRectGetHeight(v48));
        if (v36 > 0.0)
          v36 = 0.0;
        v37 = v36 / v24;
        if (v37 < 0.0)
          v37 = -v37;
        -[UIViewPropertyAnimator setFractionComplete:](self->_expandPropertyAnimator, "setFractionComplete:", v37);
        -[UIViewPropertyAnimator fractionComplete](self->_expandPropertyAnimator, "fractionComplete");
        if (v38 > 0.0 && !self->_isDoingExpandInteraction)
        {
          self->_isDoingExpandInteraction = 1;
          location = 0;
          objc_initWeak(&location, self);
          expandPropertyAnimator = self->_expandPropertyAnimator;
          v42[0] = MEMORY[0x1E0C809B0];
          v42[1] = 3221225472;
          v42[2] = __59__CKBrowserSwitcherViewController_expandGestureTouchMoved___block_invoke;
          v42[3] = &unk_1E274BAD8;
          objc_copyWeak(&v43, &location);
          -[UIViewPropertyAnimator addCompletion:](expandPropertyAnimator, "addCompletion:", v42);
          objc_destroyWeak(&v43);
          objc_destroyWeak(&location);
        }
        if (v21 > 2.0 || v41 > 2.0)
          self->_expandInteractionDidMove = 1;
        -[UIViewPropertyAnimator fractionComplete](self->_expandPropertyAnimator, "fractionComplete");
        if (v40 >= 1.0)
          -[CKImmediatePanGestureRecognizer finishCurrentInteraction](self->_expandGestureTracker, "finishCurrentInteraction");
      }
      break;
    case 1:
      if (!-[CKBrowserSwitcherViewController isDragging](self, "isDragging")
        && !-[CKBrowserSwitcherViewController isInDragAndDrop](self, "isInDragAndDrop"))
      {
        self->_expandInteractionDidMove = 0;
        self->_expandGestureStartedOnGrabber = 0;
        -[CKBrowserSwitcherViewController grabberView](self, "grabberView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKImmediatePanGestureRecognizer locationInView:](self->_expandGestureTracker, "locationInView:", v6);
        v8 = v7;
        v10 = v9;
        objc_msgSend(v6, "bounds");
        x = v46.origin.x;
        y = v46.origin.y;
        width = v46.size.width;
        height = v46.size.height;
        v45.x = v8;
        v45.y = v10;
        if (CGRectContainsPoint(v46, v45))
        {
          self->_expandGestureStartedOnGrabber = 1;
          v15 = 0.0;
        }
        else
        {
          v49.origin.x = x;
          v49.origin.y = y;
          v49.size.width = width;
          v49.size.height = height;
          v15 = v10 - CGRectGetMaxY(v49);
        }
        self->_expandGestureTranslationOffset = v15;
        -[CKBrowserSwitcherViewController setupPausedExpandAnimatorIfNeeded](self, "setupPausedExpandAnimatorIfNeeded");

      }
      break;
    default:
      self->_expandInteractionDidMove = 0;
      if (self->_isDoingExpandInteraction)
      {
        self->_isDoingExpandInteraction = 0;
        -[CKBrowserSwitcherViewController reverseAndCleanupExpandAnimator](self, "reverseAndCleanupExpandAnimator");
      }
      break;
  }

}

void __59__CKBrowserSwitcherViewController_expandGestureTouchMoved___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cleanupExpandAnimatorState");

}

- (void)setBrowserViewReadyForUserInteraction:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_browserViewReadyForUserInteraction != a3)
  {
    v3 = a3;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = CFSTR("YES");
        if (self->_browserViewReadyForUserInteraction)
          v7 = CFSTR("YES");
        else
          v7 = CFSTR("NO");
        if (!v3)
          v6 = CFSTR("NO");
        v11 = 138412546;
        v12 = v7;
        v13 = 2112;
        v14 = v6;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "_browserViewReadyForUserInteraction changing from %@ to %@", (uint8_t *)&v11, 0x16u);
      }

    }
    self->_browserViewReadyForUserInteraction = v3;
    -[CKBrowserSwitcherViewController currentViewController](self, "currentViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[CKBrowserSwitcherViewController currentViewController](self, "currentViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "endDisablingUserInteraction");

    }
  }
}

- (void)browserTransitionCoordinator:(id)a3 expandedStateDidChange:(BOOL)a4 withReason:(int64_t)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint8_t v20[8];
  _QWORD v21[5];

  v6 = a4;
  v8 = a3;
  -[CKBrowserSwitcherViewController setInteractiveExpandStarted:](self, "setInteractiveExpandStarted:", 0);
  if (a5 != 1 || v6)
  {
    v16 = IMOSLoggingEnabled();
    if (v6)
    {
      if (v16)
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v20 = 0;
          _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "Browser went expanded, nil out the currentViewController.", v20, 2u);
        }

      }
      -[CKBrowserSwitcherViewController setCurrentViewController:](self, "setCurrentViewController:", 0);
    }
    else if (v16)
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Browser went compact with keyboard launch context, but is currently owned by someone else!", v20, 2u);
      }

    }
  }
  else
  {
    objc_msgSend(v8, "requestOwnershipOfBrowserForConsumer:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "balloonPlugin");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "visibleSwitcherPlugins");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "indexOfObject:", v11);

      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v8, "releaseOwnershipOfBrowserForConsumer:", 1);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v20 = 0;
            _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Attempted browser re-insert after collapse, but browser is not in visiblePlugins!", v20, 2u);
          }

        }
      }
      else
      {
        -[CKBrowserSwitcherViewController setCurrentViewController:](self, "setCurrentViewController:", v10);
        if (objc_msgSend(v10, "isLoaded"))
        {
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __98__CKBrowserSwitcherViewController_browserTransitionCoordinator_expandedStateDidChange_withReason___block_invoke;
          v21[3] = &unk_1E274A208;
          v21[4] = self;
          objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v21);
        }
      }

    }
    -[CKBrowserSwitcherViewController delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "switcherViewControllerDidCollapse:", self);

  }
}

uint64_t __98__CKBrowserSwitcherViewController_browserTransitionCoordinator_expandedStateDidChange_withReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transitionSnapshotViewToBrowserView");
}

- (void)browserTransitionCoordinator:(id)a3 browserWillBecomeInactive:(id)a4
{
  -[CKBrowserSwitcherViewController setBrowserViewReadyForUserInteraction:](self, "setBrowserViewReadyForUserInteraction:", 0, a4);
}

- (void)browserTransitionCoordinatorWillTransitionOrPresentToFullscreen:(id)a3 withReason:(int64_t)a4
{
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CKBrowserSwitcherViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CKBrowserSwitcherViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "browserTransitionCoordinatorWillTransitionOrPresentToFullscreen:withReason:", v9, a4);

  }
}

- (void)browserTransitionCoordinatorDidTransitionOrPresentToFullscreen:(id)a3 withReason:(int64_t)a4
{
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CKBrowserSwitcherViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CKBrowserSwitcherViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "browserTransitionCoordinatorDidTransitionOrPresentToFullscreen:withReason:", v9, a4);

  }
}

- (void)browserTransitionCoordinatorWillCollapseOrDismiss:(id)a3 withReason:(int64_t)a4
{
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CKBrowserSwitcherViewController setBrowserIsCollapsingFromFullscreen:](self, "setBrowserIsCollapsingFromFullscreen:", 1);
  if (a4 == 1)
    -[CKBrowserSwitcherViewController setInsertedViaCollapse:](self, "setInsertedViaCollapse:", 1);
  -[CKBrowserSwitcherViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CKBrowserSwitcherViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "browserTransitionCoordinatorWillCollapseOrDismiss:withReason:", v9, a4);

  }
}

- (void)browserTransitionCoordinatorDidCollapseOrDismiss:(id)a3 withReason:(int64_t)a4
{
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CKBrowserSwitcherViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CKBrowserSwitcherViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "browserTransitionCoordinatorDidCollapseOrDismiss:withReason:", v9, a4);

  }
  -[CKBrowserSwitcherViewController setBrowserIsCollapsingFromFullscreen:](self, "setBrowserIsCollapsingFromFullscreen:", 0);

}

- (void)browserTransitionCoordinatorWantsPresentationOfAppStore:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CKBrowserSwitcherViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKBrowserSwitcherViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "switcherViewControllerDidSelectAppStore:shouldRestoreAppSwitcher:", self, 0);

  }
}

- (void)browserTransitionCoordinatorWantsPresentationOfAppManager:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CKBrowserSwitcherViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKBrowserSwitcherViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "switcherViewControllerDidSelectAppManager:shouldRestoreAppSwitcher:", self, 0);

  }
}

- (void)browserTransitionCoordinator:(id)a3 didSwitchToPlugin:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[CKBrowserSwitcherViewController setBalloonPlugin:](self, "setBalloonPlugin:", v6);
  -[CKBrowserSwitcherViewController setCurrentVisiblePlugin:](self, "setCurrentVisiblePlugin:", v6);

  -[CKBrowserSwitcherViewController setBrowserViewReadyForUserInteraction:](self, "setBrowserViewReadyForUserInteraction:", 1);
  -[CKBrowserSwitcherViewController delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "expandedAppViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "contentViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "switcherViewControllerDidFinishSwitching:toViewController:", self, v9);

}

- (void)browserTransitionCoordinator:(id)a3 hasUpdatedLastTouchDate:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[CKBrowserSwitcherViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CKBrowserSwitcherViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "switcherViewController:hasUpdatedLastTouchDate:", self, v8);

  }
}

- (double)browserTransitionCoordinatorCollapsedContentHeight:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  -[CKBrowserSwitcherViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "browserTransitionCoordinatorCollapsedContentHeight:", v4);
    v7 = v6;
  }
  else
  {
    +[CKInputView defaultContentSize](CKInputView, "defaultContentSize");
    v7 = v8;
  }

  return v7;
}

- (BOOL)browserTransitionCoordinatorShouldDismissOnDragSuccess:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CKBrowserSwitcherViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "browserTransitionCoordinatorShouldDismissOnDragSuccess:", v4);
  else
    v6 = 0;

  return v6;
}

- (BOOL)shouldAlwaysShowAppTitle
{
  void *v2;
  char v3;

  -[CKBrowserSwitcherViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "shouldAlwaysShowAppTitle");
  else
    v3 = 0;

  return v3;
}

- (id)transitionsPresentationViewController
{
  void *v2;
  void *v3;

  -[CKBrowserSwitcherViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "transitionsPresentationViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)appTitleOverride
{
  void *v2;
  void *v3;

  -[CKBrowserSwitcherViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "appTitleOverride");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)appIconOverride
{
  void *v2;
  void *v3;

  -[CKBrowserSwitcherViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "appIconOverride");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_performAfterFirstLayout:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  if (-[CKBrowserSwitcherViewController viewHasLaidOutSubviews](self, "viewHasLaidOutSubviews"))
    v4[2]();
  else
    -[CKBrowserSwitcherViewController setPerformAfterFirstLayoutBlock:](self, "setPerformAfterFirstLayoutBlock:", v4);

}

- (void)unloadRemoteViewControllers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[CKBrowserSwitcherViewController currentViewController](self, "currentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserSwitcherViewController _removeBrowserFromViewHierarchy:](self, "_removeBrowserFromViewHierarchy:", v3);

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[CKBrowserSwitcherViewController livePluginIdentifierToTimestampMap](self, "livePluginIdentifierToTimestampMap", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[CKBrowserSwitcherViewController _removeBrowserWithPluginIdentifierFromViewHierarchy:](self, "_removeBrowserWithPluginIdentifierFromViewHierarchy:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)setBalloonPlugin:(id)a3
{
  id v5;
  IMBalloonPlugin *v6;
  void *v7;
  void *v8;
  CKBrowserSwitcherCell *v9;
  void *v10;
  CKBrowserSwitcherCell *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  IMBalloonPlugin *v21;

  v21 = (IMBalloonPlugin *)a3;
  v5 = (id)-[CKBrowserSwitcherViewController view](self, "view");
  v6 = v21;
  if (self->_balloonPlugin != v21)
  {
    objc_storeStrong((id *)&self->_balloonPlugin, a3);
    -[CKBrowserSwitcherViewController cell](self, "cell");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CKBrowserSwitcherViewController cell](self, "cell");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperview");

    }
    v9 = [CKBrowserSwitcherCell alloc];
    -[CKBrowserSwitcherViewController browserContainer](self, "browserContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v11 = -[CKBrowserSwitcherCell initWithFrame:](v9, "initWithFrame:");

    -[IMBalloonPlugin identifier](v21, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserSwitcherViewController browserContainer](self, "browserContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "userInterfaceStyle");
    -[CKBrowserSwitcherViewController browserContainer](self, "browserContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    +[CKSnapshotCacheKey keyWithIdentifier:interfaceStyle:bounds:](CKSnapshotCacheKey, "keyWithIdentifier:interfaceStyle:bounds:", v12, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKBrowserSwitcherCell setPlugin:withSnapshotCacheKey:](v11, "setPlugin:withSnapshotCacheKey:", v21, v17);
    -[CKBrowserSwitcherViewController browserContainer](self, "browserContainer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v11);

    -[CKBrowserSwitcherViewController setCell:](self, "setCell:", v11);
    -[CKBrowserSwitcherViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setNeedsLayout");

    -[CKBrowserSwitcherViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layoutIfNeeded");

    -[CKBrowserSwitcherViewController _updateVisibleBrowserView](self, "_updateVisibleBrowserView");
    v6 = v21;
  }

}

- (void)showBrowserInSwitcherForPlugin:(id)a3 datasource:(id)a4 reloadData:(BOOL)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "In showBrowserInSwitcherForPlugin:datasource:reloadData:", buf, 2u);
    }

  }
  if (v7)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __88__CKBrowserSwitcherViewController_showBrowserInSwitcherForPlugin_datasource_reloadData___block_invoke;
    v11[3] = &unk_1E274A0B8;
    v11[4] = self;
    v12 = v7;
    v13 = v8;
    -[CKBrowserSwitcherViewController _performAfterFirstLayout:](self, "_performAfterFirstLayout:", v11);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Asking to show browser for nil plugin", buf, 2u);
    }

  }
}

uint64_t __88__CKBrowserSwitcherViewController_showBrowserInSwitcherForPlugin_datasource_reloadData___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBalloonPlugin:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_loadBrowserForBalloonPlugin:datasource:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)showBrowserFullscreenForPlugin:(id)a3 datasource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a4;
  v7 = a3;
  -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isExpanded");

  if (v9)
  {
    -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "expandedAppViewController:wantsToSwitchToPlugin:datasource:", 0, v7, v6);

  }
  else
  {
    -[CKBrowserSwitcherViewController setBalloonPlugin:](self, "setBalloonPlugin:", v7);
    -[CKBrowserSwitcherViewController setCurrentVisiblePlugin:](self, "setCurrentVisiblePlugin:", v7);
    -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "releaseOwnershipOfBrowserForConsumer:", 1);

    -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "updateBrowserSessionForPlugin:datasource:", v7, v6);

    if (!v12)
      return;
    -[CKBrowserSwitcherViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNeedsLayout");

    -[CKBrowserSwitcherViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutIfNeeded");

    -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "transitionCurrentBrowserToExpandedPresentationAnimated:completion:", 1, 0);
  }

}

- (void)showBrowserFullscreenModalForPlugin:(id)a3 datasource:(id)a4 preferredContentSize:(CGSize)a5
{
  double height;
  double width;
  id v9;
  id v10;
  id v11;

  height = a5.height;
  width = a5.width;
  v9 = a4;
  v10 = a3;
  -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentPluginFullScreenModal:datasource:preferredContentSize:animated:completion:", v10, v9, 1, 0, width, height);

}

- (void)animateInCompactWithCompletion:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double MaxY;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[9];
  CGRect v28;

  v4 = a3;
  -[CKBrowserSwitcherViewController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[CKBrowserSwitcherViewController contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  MaxY = CGRectGetMaxY(v28);

  -[CKBrowserSwitcherViewController contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v7, MaxY, v11, v13);

  v17 = (void *)MEMORY[0x1E0CEABB0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __66__CKBrowserSwitcherViewController_animateInCompactWithCompletion___block_invoke;
  v27[3] = &unk_1E274B8B8;
  v27[4] = self;
  *(double *)&v27[5] = v7;
  v27[6] = v9;
  *(double *)&v27[7] = v11;
  *(double *)&v27[8] = v13;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __66__CKBrowserSwitcherViewController_animateInCompactWithCompletion___block_invoke_2;
  v25[3] = &unk_1E274C780;
  v25[4] = self;
  v26 = v4;
  v18 = v4;
  objc_msgSend(v17, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v27, v25, 0.5, 0.0, 1.0, 410.0, 32.0, 0.0);
  -[CKBrowserSwitcherViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safeAreaInsets");
  v21 = v20;
  v23 = v22;

  if (v21 == 0.0 && v23 == 0.0)
  {
    -[CKBrowserSwitcherViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBackgroundColor:", 0);

  }
}

void __66__CKBrowserSwitcherViewController_animateInCompactWithCompletion___block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);

}

uint64_t __66__CKBrowserSwitcherViewController_animateInCompactWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateVisibleBrowserView");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)animateOutCompactWithCompletion:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double Height;
  void *v15;
  CGFloat v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  dispatch_time_t v25;
  id v26;
  _QWORD v27[5];
  id v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v4 = a3;
  -[CKBrowserSwitcherViewController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v29.origin.x = v7;
  v29.origin.y = v9;
  v29.size.width = v11;
  v29.size.height = v13;
  Height = CGRectGetHeight(v29);
  if (!-[CKBrowserSwitcherViewController _hasLandscapeGutters](self, "_hasLandscapeGutters"))
  {
    -[CKBrowserSwitcherViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", 0);

  }
  v16 = v9 + Height;
  objc_msgSend(MEMORY[0x1E0CD2710], "animation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setKeyPath:", CFSTR("position.y"));
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTimingFunction:", v18);

  objc_msgSend(v17, "setBeginTime:", CACurrentMediaTime());
  objc_msgSend(v17, "setDuration:", 0.200000003);
  v19 = (void *)MEMORY[0x1E0CB37E8];
  v30.origin.x = v7;
  v30.origin.y = v9;
  v30.size.width = v11;
  v30.size.height = v13;
  CGRectGetMidX(v30);
  v31.origin.x = v7;
  v31.origin.y = v9;
  v31.size.width = v11;
  v31.size.height = v13;
  objc_msgSend(v19, "numberWithDouble:", CGRectGetMidY(v31));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFromValue:", v20);

  v21 = (void *)MEMORY[0x1E0CB37E8];
  v32.origin.x = v7;
  v32.origin.y = v16;
  v32.size.width = v11;
  v32.size.height = v13;
  CGRectGetMidX(v32);
  v33.origin.x = v7;
  v33.origin.y = v16;
  v33.size.width = v11;
  v33.size.height = v13;
  objc_msgSend(v21, "numberWithDouble:", CGRectGetMidY(v33));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setToValue:", v22);

  objc_msgSend(v17, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v17, "setRemovedOnCompletion:", 0);
  -[CKBrowserSwitcherViewController contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addAnimation:forKey:", v17, CFSTR("SlideOutPresentation"));

  v25 = dispatch_time(0, 200000002);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __67__CKBrowserSwitcherViewController_animateOutCompactWithCompletion___block_invoke;
  v27[3] = &unk_1E274C2E0;
  v27[4] = self;
  v28 = v4;
  v26 = v4;
  dispatch_after(v25, MEMORY[0x1E0C80D38], v27);

}

uint64_t __67__CKBrowserSwitcherViewController_animateOutCompactWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  if ((objc_msgSend(*(id *)(a1 + 32), "_hasLandscapeGutters") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "contentView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setBackgroundColor:", 0);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)_hasLandscapeGutters
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  -[CKBrowserSwitcherViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeAreaInsets");
  v4 = v3;
  v6 = v5;

  return v6 != 0.0 || v4 != 0.0;
}

- (CKAppGrabberView)grabberView
{
  CKAppGrabberView *grabberView;
  CKAppGrabberView *v4;
  CKAppGrabberView *v5;
  CKAppGrabberView *v6;
  void *v7;

  grabberView = self->_grabberView;
  if (!grabberView)
  {
    v4 = objc_alloc_init(CKAppGrabberView);
    v5 = self->_grabberView;
    self->_grabberView = v4;

    -[CKAppGrabberView setDelegate:](self->_grabberView, "setDelegate:", self);
    -[CKAppGrabberView setAutoresizingMask:](self->_grabberView, "setAutoresizingMask:", 34);
    v6 = self->_grabberView;
    -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAppGrabberView setShowsAppTitle:](v6, "setShowsAppTitle:", objc_msgSend(v7, "shouldAlwaysShowAppTitle"));

    grabberView = self->_grabberView;
  }
  return grabberView;
}

- (void)saveSnapshotForCurrentBrowserViewControllerIfPossible
{
  void *v3;
  char v4;
  id v5;

  if (-[CKBrowserSwitcherViewController isBrowserReadyForUserInteraction](self, "isBrowserReadyForUserInteraction"))
  {
    -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "currentConsumer") == 1)
    {
      -[CKBrowserSwitcherViewController currentViewController](self, "currentViewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_opt_respondsToSelector();

      if ((v4 & 1) == 0)
        return;
      -[CKBrowserSwitcherViewController currentViewController](self, "currentViewController");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "saveSnapshotForBrowserViewController");
    }

  }
}

- (void)_handleVisibleSwitcherPluginsChanged:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "currentConsumer");

  if (v6 != 2)
  {
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("CKBrowserSelectionControllerUninstalledPluginsKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[CKBrowserSwitcherViewController livePluginIdentifierToTimestampMap](self, "livePluginIdentifierToTimestampMap", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (objc_msgSend(v8, "containsObject:", v15))
            -[CKBrowserSwitcherViewController _removeBrowserWithPluginIdentifierFromViewHierarchy:](self, "_removeBrowserWithPluginIdentifierFromViewHierarchy:", v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v12);
    }

    -[CKBrowserSwitcherViewController balloonPlugin](self, "balloonPlugin");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[CKBrowserSwitcherViewController _switchToVisiblePluginWithIdentifier:](self, "_switchToVisiblePluginWithIdentifier:", v17);

    if (!v18)
    {
      -[CKBrowserSwitcherViewController setAllowPluginLaunchNotifications:](self, "setAllowPluginLaunchNotifications:", 0);
      +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "visibleSwitcherPlugins");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKBrowserSwitcherViewController showBrowserInSwitcherForPlugin:datasource:reloadData:](self, "showBrowserInSwitcherForPlugin:datasource:reloadData:", v21, 0, 0);
      -[CKBrowserSwitcherViewController setAllowPluginLaunchNotifications:](self, "setAllowPluginLaunchNotifications:", 1);

    }
  }

}

- (void)_updateCurrentBrowserSnapshotIfPossible
{
  CKBrowserViewControllerProtocol *currentViewController;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;

  currentViewController = self->_currentViewController;
  if (currentViewController)
  {
    -[CKBrowserViewControllerProtocol view](currentViewController, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alpha");
    v6 = v5;

    -[CKBrowserViewControllerProtocol viewIfLoaded](self->_currentViewController, "viewIfLoaded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[CKBrowserSwitcherViewController isBrowserReadyForUserInteraction](self, "isBrowserReadyForUserInteraction"))
    {
      if (v6 > 0.0 && v8 != 0)
      {
        -[CKBrowserSwitcherViewController _snapshotCurrentViewController](self, "_snapshotCurrentViewController");
        -[CKBrowserSwitcherViewController setBrowserViewReadyForUserInteraction:](self, "setBrowserViewReadyForUserInteraction:", 0);
      }
    }
  }
}

- (BOOL)_pluginHasLiveBrowserViewInSwitcher:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CKBrowserSwitcherViewController *v8;

  v4 = a3;
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "existingViewControllerForPluginIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "parentViewController");
  v8 = (CKBrowserSwitcherViewController *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v8 == self;

  return (char)self;
}

- (BOOL)_shouldLimitExpandGestureToGrabber
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[CKBrowserSwitcherViewController balloonPlugin](self, "balloonPlugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    IMBalloonExtensionIDWithSuffix();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", v3);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v6 = a4;
  if (self->_expandGestureTracker != a3)
    goto LABEL_8;
  if (!-[CKBrowserSwitcherViewController isBrowserReadyForUserInteraction](self, "isBrowserReadyForUserInteraction"))
    goto LABEL_8;
  -[CKBrowserSwitcherViewController grabberView](self, "grabberView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "showsAppTitle");

  if (v8)
  {
    -[CKBrowserSwitcherViewController grabberView](self, "grabberView");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v9, "closeButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "locationInView:", v10);
    LOBYTE(v9) = objc_msgSend(v10, "pointInside:withEvent:", 0);

    if ((v9 & 1) != 0)
      goto LABEL_8;
  }
  if (!-[CKBrowserSwitcherViewController _shouldLimitExpandGestureToGrabber](self, "_shouldLimitExpandGestureToGrabber"))
  {
    v13 = 1;
    goto LABEL_9;
  }
  objc_msgSend(v6, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v6, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isDescendantOfView:", self->_grabberView);

  }
  else
  {
LABEL_8:
    v13 = 0;
  }
LABEL_9:

  return v13;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  CKImmediatePanGestureRecognizer *v4;
  CKImmediatePanGestureRecognizer *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  BOOL v20;
  void *v21;
  void *v22;
  char isKindOfClass;
  void *v24;
  char v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  CGPoint v32;
  CGPoint v33;
  CGRect v34;
  CGRect v35;

  v4 = (CKImmediatePanGestureRecognizer *)a3;
  -[CKBrowserSwitcherViewController touchTracker](self, "touchTracker");
  v5 = (CKImmediatePanGestureRecognizer *)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
    -[CKBrowserSwitcherViewController currentViewController](self, "currentViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "balloonPlugin");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBrowserSwitcherViewController delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_opt_respondsToSelector();

      if ((v25 & 1) == 0)
      {
        v20 = 1;
        goto LABEL_13;
      }
      -[CKBrowserSwitcherViewController delegate](self, "delegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "switcherViewController:hasUpdatedLastTouchDate:", self, v6);
      v20 = 1;
      goto LABEL_11;
    }
  }
  else if (self->_expandGestureTracker == v4)
  {
    -[CKBrowserSwitcherViewController currentViewController](self, "currentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "horizontalSwipeExclusionRect");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      objc_msgSend(v6, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKImmediatePanGestureRecognizer locationInView:](v4, "locationInView:", v15);
      v17 = v16;
      v19 = v18;

      v34.origin.x = v8;
      v34.origin.y = v10;
      v34.size.width = v12;
      v34.size.height = v14;
      v32.x = v17;
      v32.y = v19;
      if (CGRectContainsPoint(v34, v32))
      {
        v20 = 0;
LABEL_13:

        goto LABEL_14;
      }
    }
    -[CKBrowserSwitcherViewController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKImmediatePanGestureRecognizer locationInView:](self->_expandGestureTracker, "locationInView:", v26);
    v28 = v27;
    v30 = v29;
    objc_msgSend(v26, "bounds");
    v33.x = v28;
    v33.y = v30;
    v20 = CGRectContainsPoint(v35, v33);
LABEL_11:

    goto LABEL_13;
  }
  v20 = 1;
LABEL_14:

  return v20;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)setCurrentVisiblePlugin:(id)a3
{
  IMBalloonPlugin **p_currentVisiblePlugin;
  _BOOL8 v6;
  void *v7;
  IMBalloonPlugin *v8;

  p_currentVisiblePlugin = &self->_currentVisiblePlugin;
  v8 = (IMBalloonPlugin *)a3;
  if (*p_currentVisiblePlugin != v8)
  {
    objc_storeStrong((id *)&self->_currentVisiblePlugin, a3);
    -[CKBrowserSwitcherViewController setBrowserViewReadyForUserInteraction:](self, "setBrowserViewReadyForUserInteraction:", 0);
    -[CKBrowserSwitcherViewController updateGrabberTitleAndIconForPlugin:](self, "updateGrabberTitleAndIconForPlugin:", *p_currentVisiblePlugin);
    if (CKIsRunningInMessages())
    {
      v6 = -[CKBrowserSwitcherViewController _currentPluginIsJellyfish](self, "_currentPluginIsJellyfish");
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setIdleTimerDisabled:", v6);

    }
  }

}

- (void)updateGrabberTitleAndIconForPlugin:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "showInBrowser"))
  {
    objc_msgSend(v10, "browserDisplayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserSwitcherViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "__ck_browserImageForInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));
  }
  else
  {
    -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appTitleOverride");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appIconOverride");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKBrowserSwitcherViewController grabberView](self, "grabberView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateAppTitle:icon:appIdentifier:", v4, v7, v9);

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
  v8.super_class = (Class)CKBrowserSwitcherViewController;
  -[CKBrowserSwitcherViewController traitCollection](&v8, sel_traitCollection);
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

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKBrowserSwitcherViewController;
  v4 = a3;
  -[CKBrowserSwitcherViewController traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[CKBrowserSwitcherViewController traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[CKBrowserSwitcherViewController updateGrabberTitleAndIconForPlugin:](self, "updateGrabberTitleAndIconForPlugin:", self->_currentVisiblePlugin);
}

- (void)_snapshotCurrentViewController
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  CKBrowserViewControllerProtocol *currentViewController;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "In cancel touches and snapshot", (uint8_t *)&v10, 2u);
    }

  }
  if (self->_currentViewController)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        -[CKBrowserViewControllerProtocol balloonPlugin](self->_currentViewController, "balloonPlugin");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412290;
        v11 = v6;
        _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "===> snapshotting current view controller (%@) since we're moving away", (uint8_t *)&v10, 0xCu);

      }
    }
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    currentViewController = self->_currentViewController;
    -[CKBrowserSwitcherViewController browserContainer](self, "browserContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    objc_msgSend(v7, "updateSnapshotForBrowserViewController:currentBounds:", currentViewController);

  }
}

- (void)_updateVisibleBrowserView
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[CKBrowserSwitcherViewController currentViewController](self, "currentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "balloonPlugin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKBrowserSwitcherViewController balloonPlugin](self, "balloonPlugin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKBrowserSwitcherViewController _pluginHasLiveBrowserViewInSwitcher:](self, "_pluginHasLiveBrowserViewInSwitcher:", v4)&& objc_msgSend(v4, "isEqual:", v5))
  {
    -[CKBrowserSwitcherViewController _updateActiveBrowserTimestampForCurrentBalloonPlugin](self, "_updateActiveBrowserTimestampForCurrentBalloonPlugin");
    -[CKBrowserSwitcherViewController setBrowserViewReadyForUserInteraction:](self, "setBrowserViewReadyForUserInteraction:", 1);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412290;
        v16 = v7;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Requesting load of browser VC for %@", (uint8_t *)&v15, 0xCu);

      }
    }
    -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "releaseOwnershipOfBrowserForConsumer:", 1);

    -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "updateBrowserSessionForPlugin:datasource:", v5, 0);

    if ((v10 & 1) != 0)
    {
      -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "requestOwnershipOfBrowserForConsumer:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        -[CKBrowserSwitcherViewController setCurrentViewController:](self, "setCurrentViewController:", v12);

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v5, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138412290;
          v16 = v14;
          _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Transition coordinator failed to update browser session for %@", (uint8_t *)&v15, 0xCu);

        }
      }
      -[CKBrowserSwitcherViewController setBrowserViewReadyForUserInteraction:](self, "setBrowserViewReadyForUserInteraction:", 1);
      -[CKBrowserSwitcherViewController setCurrentViewController:](self, "setCurrentViewController:", 0);
    }
  }

}

- (void)_transitionSnapshotViewToBrowserViewAfterViewDidPrepareForDisplay:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "===> _transitionSnapshotViewToBrowserViewAfterRemoteViewDidLoad: called with notification: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("CKRemoteViewPluginKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserSwitcherViewController currentViewController](self, "currentViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "balloonPlugin");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "isEqualToString:", v11);

  if (v12)
  {
    -[CKBrowserSwitcherViewController _transitionSnapshotViewToBrowserView](self, "_transitionSnapshotViewToBrowserView");
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[CKBrowserSwitcherViewController livePluginIdentifierToTimestampMap](self, "livePluginIdentifierToTimestampMap", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v24;
      while (2)
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v13);
          v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v16);
          objc_msgSend(v7, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", v17);

          if (v19)
          {
            +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "existingViewControllerForPluginIdentifier:", v17);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "view");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setAlpha:", 1.0);

            goto LABEL_17;
          }
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v14)
          continue;
        break;
      }
    }

  }
LABEL_17:

}

- (void)_handleRemoteViewControllerConnectionInterrupted:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D37E80]);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[CKBrowserSwitcherViewController balloonPlugin](self, "balloonPlugin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", v12))
    goto LABEL_4;
  v7 = -[CKBrowserSwitcherViewController isBrowserReadyForUserInteraction](self, "isBrowserReadyForUserInteraction");

  if (v7)
  {
    -[CKBrowserSwitcherViewController balloonPlugin](self, "balloonPlugin");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "browserDisplayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKBrowserSwitcherViewController setBrowserViewReadyForUserInteraction:](self, "setBrowserViewReadyForUserInteraction:", 0);
    -[CKBrowserSwitcherViewController setBalloonPlugin:](self, "setBalloonPlugin:", 0);
    -[CKBrowserSwitcherViewController setCurrentVisiblePlugin:](self, "setCurrentVisiblePlugin:", 0);
    -[CKBrowserSwitcherViewController activeBrowserView](self, "activeBrowserView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    -[CKBrowserSwitcherViewController currentViewController](self, "currentViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromParentViewController");

    -[CKBrowserSwitcherViewController setCurrentViewController:](self, "setCurrentViewController:", 0);
    -[CKBrowserSwitcherViewController cell](self, "cell");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "showExtensionInterruptedViewWithDisplayName:", v5);

    -[CKBrowserSwitcherViewController livePluginIdentifierToTimestampMap](self, "livePluginIdentifierToTimestampMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v12);
LABEL_4:

  }
}

- (void)_transitionSnapshotViewToBrowserView
{
  void *v3;
  uint64_t v4;
  id v5;
  void (**v6)(void *, uint64_t);
  void *v7;
  int v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD aBlock[5];
  id v13;

  if (!-[CKBrowserSwitcherViewController isTransitioningFromSnapshotToLiveView](self, "isTransitioningFromSnapshotToLiveView"))
  {
    -[CKBrowserSwitcherViewController setTransitioningFromSnapshotToLiveView:](self, "setTransitioningFromSnapshotToLiveView:", 1);
    -[CKBrowserSwitcherViewController currentVisiblePlugin](self, "currentVisiblePlugin");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __71__CKBrowserSwitcherViewController__transitionSnapshotViewToBrowserView__block_invoke;
    aBlock[3] = &unk_1E274BE58;
    aBlock[4] = self;
    v5 = v3;
    v13 = v5;
    v6 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    -[CKBrowserSwitcherViewController cell](self, "cell");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isUsingFallbackSnapshot");

    if (v8)
    {
      v11[0] = v4;
      v11[1] = 3221225472;
      v11[2] = __71__CKBrowserSwitcherViewController__transitionSnapshotViewToBrowserView__block_invoke_401;
      v11[3] = &unk_1E274A208;
      v11[4] = self;
      v9 = _Block_copy(v11);
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v9, v6, 0.5, 0.0);

    }
    else
    {
      -[CKBrowserSwitcherViewController activeBrowserView](self, "activeBrowserView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAlpha:", 1.0);

      v6[2](v6, 1);
    }

  }
}

uint64_t __71__CKBrowserSwitcherViewController__transitionSnapshotViewToBrowserView__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v9[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "====> set the browser view's alpha to 1.0", v9, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "currentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "currentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "saveSnapshotForBrowserViewController");

  }
  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "currentVisiblePlugin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
    objc_msgSend(*(id *)(a1 + 32), "setBrowserViewReadyForUserInteraction:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setTransitioningFromSnapshotToLiveView:", 0);
}

void __71__CKBrowserSwitcherViewController__transitionSnapshotViewToBrowserView__block_invoke_401(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "activeBrowserView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  -[CKBrowserSwitcherViewController balloonPlugin](self, "balloonPlugin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D37568]))
  {

    v5 = 2;
LABEL_9:

    return v5;
  }
  -[CKBrowserSwitcherViewController balloonPlugin](self, "balloonPlugin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D37588]);

  if ((v8 & 1) == 0)
  {
    -[CKBrowserSwitcherViewController currentViewController](self, "currentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      -[CKBrowserSwitcherViewController currentViewController](self, "currentViewController");
    else
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "supportedInterfaceOrientations");
    goto LABEL_9;
  }
  return 2;
}

- (BOOL)_currentPluginIsJellyfish
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[CKBrowserSwitcherViewController currentVisiblePlugin](self, "currentVisiblePlugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IMBalloonExtensionIDWithSuffix();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (void)_insertCurrentBrowserAndRemoveOldBrowsersIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  __int128 v13;
  void *v14;
  unint64_t v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  void *v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  -[CKBrowserSwitcherViewController livePluginIdentifierToTimestampMap](self, "livePluginIdentifierToTimestampMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v50 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
        +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "existingViewControllerForPluginIdentifier:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          -[CKBrowserSwitcherViewController currentViewController](self, "currentViewController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v10 == v11;

          if (!v12 && (objc_msgSend(v10, "mayBeKeptInViewHierarchy") & 1) == 0)
            -[CKBrowserSwitcherViewController _removeBrowserWithPluginIdentifierFromViewHierarchy:](self, "_removeBrowserWithPluginIdentifierFromViewHierarchy:", v8);
        }

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    }
    while (v5);
  }

  v44 = 0;
  *(_QWORD *)&v13 = 138412290;
  v43 = v13;
  while (1)
  {
    -[CKBrowserSwitcherViewController livePluginIdentifierToTimestampMap](self, "livePluginIdentifierToTimestampMap", v43);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v15 > objc_msgSend(v16, "maxNumLiveBrowserViewsToKeepInViewHierarchy");

    if (!v17)
      break;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    -[CKBrowserSwitcherViewController livePluginIdentifierToTimestampMap](self, "livePluginIdentifierToTimestampMap");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    if (v19)
    {
      v20 = 0;
      v21 = 0;
      v22 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v46 != v22)
            objc_enumerationMutation(v18);
          v24 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
          -[CKBrowserSwitcherViewController livePluginIdentifierToTimestampMap](self, "livePluginIdentifierToTimestampMap");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKey:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v21 || objc_msgSend(v26, "compare:", v21) == -1)
          {
            v27 = v26;

            v28 = v24;
            v20 = v28;
            v21 = v27;
          }

        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      }
      while (v19);

      if (v20)
        -[CKBrowserSwitcherViewController _removeBrowserWithPluginIdentifierFromViewHierarchy:](self, "_removeBrowserWithPluginIdentifierFromViewHierarchy:", v20);
    }
    else
    {

      v21 = 0;
      v20 = 0;
    }
    if ((unint64_t)++v44 >= 2 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v43;
        v54 = v20;
        _os_log_impl(&dword_18DFCD000, v29, OS_LOG_TYPE_INFO, "CKBrowserSwitcherViewController: unexpectedly removing live browser for plugin %@", buf, 0xCu);
      }

    }
  }
  -[CKBrowserSwitcherViewController currentViewController](self, "currentViewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    -[CKBrowserSwitcherViewController childViewControllers](self, "childViewControllers");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserSwitcherViewController currentViewController](self, "currentViewController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "containsObject:", v32);

    if ((v33 & 1) == 0)
    {
      -[CKBrowserSwitcherViewController currentViewController](self, "currentViewController");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBrowserSwitcherViewController addChildViewController:](self, "addChildViewController:", v34);

      -[CKBrowserSwitcherViewController currentViewController](self, "currentViewController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "balloonPlugin");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v37, "isEqualToString:", *MEMORY[0x1E0D37588]) & 1) == 0
        && (objc_msgSend(v37, "isEqualToString:", *MEMORY[0x1E0D37568]) & 1) == 0)
      {
        -[CKBrowserSwitcherViewController currentViewController](self, "currentViewController");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKBrowserSwitcherViewController activeBrowserView](self, "activeBrowserView");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKBrowserSwitcherViewController _updateActiveBrowserAlphaStateOnInsertForCurrentController:currentView:](self, "_updateActiveBrowserAlphaStateOnInsertForCurrentController:currentView:", v38, v39);

      }
      -[CKBrowserSwitcherViewController currentViewController](self, "currentViewController");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "balloonPlugin");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBrowserSwitcherViewController _updateBrowserViewPositionForPluginAndInsertIfNecessary:](self, "_updateBrowserViewPositionForPluginAndInsertIfNecessary:", v41);

      -[CKBrowserSwitcherViewController currentViewController](self, "currentViewController");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "didMoveToParentViewController:", self);

    }
  }
}

- (void)_updateActiveBrowserAlphaStateOnInsertForCurrentController:(id)a3 currentView:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v5, "isLoaded") & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "====> set the browser view's alpha to 0.0!", v8, 2u);
      }

    }
    objc_msgSend(v6, "setAlpha:", 0.0);
  }

}

- (void)_updateBrowserViewPositionForPluginAndInsertIfNecessary:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CKBrowserSwitcherViewController *v9;

  v6 = a3;
  if (!-[CKBrowserSwitcherViewController isTransitioningExpandedState](self, "isTransitioningExpandedState")
    || -[CKBrowserSwitcherViewController browserIsCollapsingFromFullscreen](self, "browserIsCollapsingFromFullscreen"))
  {
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visibleSwitcherPlugins");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __91__CKBrowserSwitcherViewController__updateBrowserViewPositionForPluginAndInsertIfNecessary___block_invoke;
    v7[3] = &unk_1E27592F8;
    v8 = v6;
    v9 = self;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

  }
}

void __91__CKBrowserSwitcherViewController__updateBrowserViewPositionForPluginAndInsertIfNecessary___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a2;
  objc_msgSend(v21, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "_browserSize");
    v10 = v9;
    v12 = v11;
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "existingViewControllerForPluginIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v15, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAutoresizingMask:", 18);
      objc_msgSend(v16, "setFrame:", 0.0, 0.0, v10, v12);
      objc_msgSend(v16, "superview");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "browserContainer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17 != v18)
      {
        objc_msgSend(*(id *)(a1 + 40), "browserContainer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addSubview:", v16);

        objc_msgSend(*(id *)(a1 + 40), "browserContainer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "bringSubviewToFront:", v16);

      }
    }
    *a4 = 1;

  }
}

- (void)_removeBrowserWithPluginIdentifierFromViewHierarchy:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "existingViewControllerForPluginIdentifier:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[CKBrowserSwitcherViewController _removeBrowserFromViewHierarchy:](self, "_removeBrowserFromViewHierarchy:", v5);
  -[CKBrowserSwitcherViewController livePluginIdentifierToTimestampMap](self, "livePluginIdentifierToTimestampMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v7);

}

- (void)_removeBrowserFromViewHierarchy:(id)a3
{
  id v4;
  CKBrowserSwitcherViewController *v5;
  CKBrowserSwitcherViewController *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];

  v4 = a3;
  objc_msgSend(v4, "parentViewController");
  v5 = (CKBrowserSwitcherViewController *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

  }
  else
  {
    v6 = v5;
    objc_msgSend(v4, "parentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_14;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "deferredForceTearDownRemoteView");
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "forceTearDownRemoteView");
  }
  objc_msgSend(v4, "willMoveToParentViewController:", 0);
  objc_msgSend(v4, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromSuperview");

  objc_msgSend(v4, "removeFromParentViewController");
  -[CKBrowserSwitcherViewController removeChildViewController:](self, "removeChildViewController:", v4);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "====> set the browser view's alpha to 1.0 when removing from hierarchy", v11, 2u);
    }

  }
  objc_msgSend(v4, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", 1.0);

LABEL_14:
}

- (void)_updateActiveBrowserTimestampForCurrentBalloonPlugin
{
  NSMutableDictionary *Mutable;
  NSMutableDictionary *livePluginIdentifierToTimestampMap;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (!self->_livePluginIdentifierToTimestampMap)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    livePluginIdentifierToTimestampMap = self->_livePluginIdentifierToTimestampMap;
    self->_livePluginIdentifierToTimestampMap = Mutable;

  }
  -[CKBrowserSwitcherViewController balloonPlugin](self, "balloonPlugin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CKBrowserSwitcherViewController livePluginIdentifierToTimestampMap](self, "livePluginIdentifierToTimestampMap");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserSwitcherViewController balloonPlugin](self, "balloonPlugin");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v7, v9);

  }
}

- (void)setCurrentViewController:(id)a3
{
  CKBrowserViewControllerProtocol *v5;
  NSObject *v6;
  CKBrowserViewControllerProtocol **p_currentViewController;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  CKBrowserViewControllerProtocol *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  _QWORD v24[5];
  uint8_t buf[16];

  v5 = (CKBrowserViewControllerProtocol *)a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "In setCurrentViewController", buf, 2u);
    }

  }
  p_currentViewController = &self->_currentViewController;
  if (self->_currentViewController != v5)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "===> setCurrentViewController called, switching view controllers", buf, 2u);
      }

    }
    objc_storeStrong((id *)&self->_currentViewController, a3);
    if (v5)
    {
      -[CKBrowserSwitcherViewController _updateActiveBrowserTimestampForCurrentBalloonPlugin](self, "_updateActiveBrowserTimestampForCurrentBalloonPlugin");
      -[CKBrowserSwitcherViewController _insertCurrentBrowserAndRemoveOldBrowsersIfNeeded](self, "_insertCurrentBrowserAndRemoveOldBrowsersIfNeeded");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if (-[CKBrowserViewControllerProtocol isLoaded](v5, "isLoaded"))
          -[CKBrowserSwitcherViewController setBrowserViewReadyForUserInteraction:](self, "setBrowserViewReadyForUserInteraction:", 1);
      }
    }
    -[CKBrowserViewControllerProtocol balloonPlugin](v5, "balloonPlugin");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject updateLaunchStatus:forPlugin:withNotification:](v10, "updateLaunchStatus:forPlugin:withNotification:", 1, v9, 0);
    }
    else
    {
      if (!IMOSLoggingEnabled())
        goto LABEL_17;
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "===>  plugin is nil, not updating launch identifier, launch status or page control", buf, 2u);
      }
    }

LABEL_17:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "===>  informing delegate that we finished switching", buf, 2u);
      }

    }
    -[CKBrowserSwitcherViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "switcherViewControllerDidFinishSwitching:toViewController:", self, *p_currentViewController);

    -[CKBrowserSwitcherViewController contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserSwitcherViewController grabberView](self, "grabberView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bringSubviewToFront:", v14);

  }
  -[CKBrowserViewControllerProtocol balloonPlugin](v5, "balloonPlugin");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.messages.browser.RecentPlugin"));

  if (v17)
  {
    v18 = *p_currentViewController;
    -[CKBrowserSwitcherViewController contentView](self, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserViewControllerProtocol setDragTargetView:](v18, "setDragTargetView:", v19);

  }
  else
  {
    -[CKBrowserViewControllerProtocol balloonPlugin](v5, "balloonPlugin");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("com.apple.appstore.MessagesProvider"));

    if (v22)
      -[CKBrowserViewControllerProtocol setAdditionalSafeAreaInsets:](v5, "setAdditionalSafeAreaInsets:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
  }
  -[CKBrowserSwitcherViewController childViewControllers](self, "childViewControllers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __60__CKBrowserSwitcherViewController_setCurrentViewController___block_invoke;
  v24[3] = &unk_1E27592D0;
  v24[4] = self;
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", v24);

}

void __60__CKBrowserSwitcherViewController_setCurrentViewController___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  id v5;
  id v6;
  char v7;
  id v8;

  v8 = a2;
  v3 = objc_msgSend(v8, "conformsToProtocol:", &unk_1EE1E8320);
  v4 = v8;
  if (v3)
  {
    v5 = v8;
    objc_msgSend(*(id *)(a1 + 32), "currentViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v5)
    {
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
        objc_msgSend(v5, "browserScrolledOnScreen");
    }
    else
    {

    }
    v4 = v8;
  }

}

- (void)handleExpandButton:(id)a3
{
  if (!-[CKBrowserSwitcherViewController isDragging](self, "isDragging", a3))
  {
    if (-[CKBrowserSwitcherViewController isBrowserReadyForUserInteraction](self, "isBrowserReadyForUserInteraction"))
      -[CKBrowserSwitcherViewController transitionToFullscreen](self, "transitionToFullscreen");
  }
}

- (void)_loadBrowserForBalloonPlugin:(id)a3 datasource:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _QWORD v26[5];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v9;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Loading browser for plugin: %@", buf, 0xCu);

    }
  }
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "visibleSwitcherPlugins");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "indexOfObject:", v6);

  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v28 = v14;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Browser was not found for plugin: %@", buf, 0xCu);

      }
LABEL_9:

    }
  }
  else
  {
    -[CKBrowserSwitcherViewController currentViewController](self, "currentViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "releaseOwnershipOfBrowserForConsumer:", 1);

    }
    -[CKBrowserSwitcherViewController setBrowserIsLoadingCompact:](self, "setBrowserIsLoadingCompact:", 1);
    -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "updateBrowserSessionForPlugin:datasource:", v6, v7);

    if (!v18)
    {
      -[CKBrowserSwitcherViewController setCurrentViewController:](self, "setCurrentViewController:", 0);
      if (!IMOSLoggingEnabled())
        goto LABEL_30;
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "_loadBrowserForBalloonPlugin failed to update browser session", buf, 2u);
      }
      goto LABEL_9;
    }
    -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "wasCurrentBrowserExpanded");

    -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "requestOwnershipOfBrowserForConsumer:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKBrowserSwitcherViewController setBrowserIsLoadingCompact:](self, "setBrowserIsLoadingCompact:", 0);
    if (v20 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v22, "viewWillTransitionToCompactPresentation");
    if (v22)
    {
      objc_msgSend(v6, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBrowserSwitcherViewController _switchToVisiblePluginWithIdentifier:](self, "_switchToVisiblePluginWithIdentifier:", v23);

      -[CKBrowserSwitcherViewController setCurrentViewController:](self, "setCurrentViewController:", v22);
      objc_msgSend(v22, "balloonPlugin");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBrowserSwitcherViewController setCurrentVisiblePlugin:](self, "setCurrentVisiblePlugin:", v24);

      if (v20)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v22, "viewDidTransitionToCompactPresentation");
          if (objc_msgSend(v22, "isLoaded"))
          {
            v26[0] = MEMORY[0x1E0C809B0];
            v26[1] = 3221225472;
            v26[2] = __75__CKBrowserSwitcherViewController__loadBrowserForBalloonPlugin_datasource___block_invoke;
            v26[3] = &unk_1E274A208;
            v26[4] = self;
            objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v26);
          }
        }
      }
    }
    else
    {
      -[CKBrowserSwitcherViewController setCurrentViewController:](self, "setCurrentViewController:", 0);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "_loadBrowserForBalloonPlugin failed to acquire browser after load", buf, 2u);
        }

      }
    }

  }
LABEL_30:

}

uint64_t __75__CKBrowserSwitcherViewController__loadBrowserForBalloonPlugin_datasource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transitionSnapshotViewToBrowserView");
}

- (BOOL)_switchToVisiblePluginWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  CKBrowserSwitcherViewController *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleSwitcherPlugins");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__CKBrowserSwitcherViewController__switchToVisiblePluginWithIdentifier___block_invoke;
  v9[3] = &unk_1E2759320;
  v7 = v4;
  v10 = v7;
  v11 = self;
  v12 = &v13;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  LOBYTE(self) = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return (char)self;
}

void __72__CKBrowserSwitcherViewController__switchToVisiblePluginWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v9 = v6;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "isEqualToString:", v8);

  if ((_DWORD)v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "setBalloonPlugin:", v9);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }

}

- (void)dragManagerWillStartDrag:(id)a3
{
  id v4;
  NSObject *v5;
  UIViewPropertyAnimator *expandPropertyAnimator;
  uint8_t v7[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Switcher heard dragManagerWillStartDrag", v7, 2u);
    }

  }
  -[CKImmediatePanGestureRecognizer setEnabled:](self->_expandGestureTracker, "setEnabled:", 0);
  -[UIViewPropertyAnimator stopAnimation:](self->_expandPropertyAnimator, "stopAnimation:", 1);
  -[UIViewPropertyAnimator finishAnimationAtPosition:](self->_expandPropertyAnimator, "finishAnimationAtPosition:", 2);
  expandPropertyAnimator = self->_expandPropertyAnimator;
  self->_expandPropertyAnimator = 0;

}

- (void)dragManagerDidStartDrag:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Switcher heard dragManagerDidStartDrag", v6, 2u);
    }

  }
  -[CKBrowserSwitcherViewController setInDragAndDrop:](self, "setInDragAndDrop:", 1);

}

- (void)dragManagerDidEndDragging:(id)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  v4 = dispatch_time(0, 400000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__CKBrowserSwitcherViewController_dragManagerDidEndDragging___block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x1E0C80D38], block);
}

uint64_t __61__CKBrowserSwitcherViewController_dragManagerDidEndDragging___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Switcher heard dragManagerDidEndDragging", v4, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "setInDragAndDrop:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setEnabled:", 1);
}

- (CGSize)_browserSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[CKBrowserSwitcherViewController browserContainer](self, "browserContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[CKBrowserSwitcherViewController browserContainer](self, "browserContainer");
  else
    -[CKBrowserSwitcherViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)appGrabberViewCloseButtonTapped:(id)a3
{
  void *v3;
  id v4;

  -[CKBrowserSwitcherViewController transitionCoordinator](self, "transitionCoordinator", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissAndReloadInputViews:", 0);

}

- (id)backdropView:(id)a3 willChangeToGraphicsQuality:(int64_t)a4
{
  return (id)objc_msgSend(a3, "inputSettings");
}

- (CKBrowserSwitcherViewControllerDelegate)delegate
{
  return (CKBrowserSwitcherViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKBrowserViewControllerProtocol)currentViewController
{
  return self->_currentViewController;
}

- (CKBrowserTransitionCoordinator)transitionCoordinator
{
  return self->_transitionCoordinator;
}

- (void)setTransitionCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_transitionCoordinator, a3);
}

- (BOOL)isDragging
{
  return self->_dragging;
}

- (void)setDragging:(BOOL)a3
{
  self->_dragging = a3;
}

- (BOOL)isBrowserReadyForUserInteraction
{
  return self->_browserViewReadyForUserInteraction;
}

- (IMBalloonPlugin)balloonPlugin
{
  return self->_balloonPlugin;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIView)browserContainer
{
  return self->_browserContainer;
}

- (void)setBrowserContainer:(id)a3
{
  objc_storeStrong((id *)&self->_browserContainer, a3);
}

- (CKBrowserSwitcherCell)cell
{
  return self->_cell;
}

- (void)setCell:(id)a3
{
  objc_storeStrong((id *)&self->_cell, a3);
}

- (NSMutableDictionary)livePluginIdentifierToTimestampMap
{
  return self->_livePluginIdentifierToTimestampMap;
}

- (void)setLivePluginIdentifierToTimestampMap:(id)a3
{
  objc_storeStrong((id *)&self->_livePluginIdentifierToTimestampMap, a3);
}

- (UILongPressGestureRecognizer)touchTracker
{
  return self->_touchTracker;
}

- (void)setTouchTracker:(id)a3
{
  objc_storeStrong((id *)&self->_touchTracker, a3);
}

- (IMBalloonPlugin)currentVisiblePlugin
{
  return self->_currentVisiblePlugin;
}

- (void)setGrabberView:(id)a3
{
  objc_storeStrong((id *)&self->_grabberView, a3);
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowView, a3);
}

- (BOOL)insertedViaCollapse
{
  return self->_insertedViaCollapse;
}

- (void)setInsertedViaCollapse:(BOOL)a3
{
  self->_insertedViaCollapse = a3;
}

- (BOOL)isInDragAndDrop
{
  return self->_inDragAndDrop;
}

- (void)setInDragAndDrop:(BOOL)a3
{
  self->_inDragAndDrop = a3;
}

- (BOOL)interactiveExpandStarted
{
  return self->_interactiveExpandStarted;
}

- (void)setInteractiveExpandStarted:(BOOL)a3
{
  self->_interactiveExpandStarted = a3;
}

- (BOOL)isTransitioningFromSnapshotToLiveView
{
  return self->_transitioningFromSnapshotToLiveView;
}

- (void)setTransitioningFromSnapshotToLiveView:(BOOL)a3
{
  self->_transitioningFromSnapshotToLiveView = a3;
}

- (BOOL)isTransitioningExpandedState
{
  return self->_transitioningExpandedState;
}

- (void)setTransitioningExpandedState:(BOOL)a3
{
  self->_transitioningExpandedState = a3;
}

- (BOOL)allowFooterLabelUpdates
{
  return self->_allowFooterLabelUpdates;
}

- (void)setAllowFooterLabelUpdates:(BOOL)a3
{
  self->_allowFooterLabelUpdates = a3;
}

- (BOOL)allowPluginLaunchNotifications
{
  return self->_allowPluginLaunchNotifications;
}

- (void)setAllowPluginLaunchNotifications:(BOOL)a3
{
  self->_allowPluginLaunchNotifications = a3;
}

- (id)performAfterFirstLayoutBlock
{
  return self->_performAfterFirstLayoutBlock;
}

- (void)setPerformAfterFirstLayoutBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1112);
}

- (BOOL)viewHasLaidOutSubviews
{
  return self->_viewHasLaidOutSubviews;
}

- (void)setViewHasLaidOutSubviews:(BOOL)a3
{
  self->_viewHasLaidOutSubviews = a3;
}

- (NSDate)timeOfLastScrollingDecelerationEnded
{
  return self->_timeOfLastScrollingDecelerationEnded;
}

- (void)setTimeOfLastScrollingDecelerationEnded:(id)a3
{
  objc_storeStrong((id *)&self->_timeOfLastScrollingDecelerationEnded, a3);
}

- (BOOL)browserIsLoadingCompact
{
  return self->_browserIsLoadingCompact;
}

- (void)setBrowserIsLoadingCompact:(BOOL)a3
{
  self->_browserIsLoadingCompact = a3;
}

- (BOOL)browserIsCollapsingFromFullscreen
{
  return self->_browserIsCollapsingFromFullscreen;
}

- (void)setBrowserIsCollapsingFromFullscreen:(BOOL)a3
{
  self->_browserIsCollapsingFromFullscreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeOfLastScrollingDecelerationEnded, 0);
  objc_storeStrong(&self->_performAfterFirstLayoutBlock, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_grabberView, 0);
  objc_storeStrong((id *)&self->_currentVisiblePlugin, 0);
  objc_storeStrong((id *)&self->_touchTracker, 0);
  objc_storeStrong((id *)&self->_livePluginIdentifierToTimestampMap, 0);
  objc_storeStrong((id *)&self->_cell, 0);
  objc_storeStrong((id *)&self->_browserContainer, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_balloonPlugin, 0);
  objc_storeStrong((id *)&self->_transitionCoordinator, 0);
  objc_storeStrong((id *)&self->_currentViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_expandPropertyAnimator, 0);
  objc_storeStrong((id *)&self->_expandGestureTracker, 0);
}

@end

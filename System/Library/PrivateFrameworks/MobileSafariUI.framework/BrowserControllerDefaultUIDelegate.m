@implementation BrowserControllerDefaultUIDelegate

- (double)browserControllerCatalogViewPopoverWidth:(id)a3
{
  void *v3;
  void *v4;
  double Width;
  double v6;
  double v7;
  CGRect v9;

  -[BrowserController rootViewController](self->_browserController, "rootViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  Width = CGRectGetWidth(v9);
  objc_msgSend(v3, "horizontalMarginForCatalogViewInPopover");
  v7 = Width - v6;

  return v7;
}

- (void)browserControllerContentContainerViewFrameDidChange:(id)a3
{
  id v3;

  -[BrowserController rootViewController](self->_browserController, "rootViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateViewsAfterContentContainerViewBoundsChange");

}

- (id)browserControllerContentContainerView:(id)a3
{
  void *v3;
  void *v4;

  -[BrowserController rootViewController](self->_browserController, "rootViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)browserControllerShouldUpdateSnapshotForActiveTab:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[BrowserController tabCollectionViewProvider](self->_browserController, "tabCollectionViewProvider", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabThumbnailCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "presentationState") == 1 || objc_msgSend(v4, "presentationState") == 2;

  return v5;
}

- (void)updateTabViewPinchRecognizerForBrowserController:(id)a3
{
  id v3;

  -[BrowserController rootViewController](self->_browserController, "rootViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateTabViewPinchRecognizer");

}

- (id)browserControllerCatalogViewController:(id)a3
{
  void *v3;
  void *v4;

  -[BrowserController rootViewController](self->_browserController, "rootViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "catalogViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)browserControllerTabBarManager:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabBarManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)browserControllerNextResponder:(id)a3
{
  return -[BrowserController rootViewController](self->_browserController, "rootViewController", a3);
}

- (id)viewControllerToPresentFromForBrowserController:(id)a3
{
  return -[BrowserController rootViewController](self->_browserController, "rootViewController", a3);
}

- (BOOL)browserControllerShouldUpdateWebViewGeometryOnScroll:(id)a3
{
  return 1;
}

- (void)browserController:(id)a3 scrollViewDidScroll:(id)a4
{
  BrowserController *browserController;
  id v5;
  id v6;

  browserController = self->_browserController;
  v5 = a4;
  -[BrowserController rootViewController](browserController, "rootViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollViewDidScroll:", v5);

}

- (void)browserControllerDidEndObfuscating:(id)a3
{
  PrivateBrowsingObfuscationWindow *obfuscationWindow;
  PrivateBrowsingObfuscationWindow *v5;

  obfuscationWindow = self->_obfuscationWindow;
  if (obfuscationWindow)
  {
    -[PrivateBrowsingObfuscationWindow setHidden:](obfuscationWindow, "setHidden:", 1);
    v5 = self->_obfuscationWindow;
    self->_obfuscationWindow = 0;

  }
}

- (BOOL)browserControllerShouldIncreaseTopPaddingForStartPage:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;

  -[BrowserController rootViewController](self->_browserController, "rootViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "capsuleCollectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(v5, "integerValue") == 2)
  {
    v6 = 1;
  }
  else
  {
    -[BrowserController rootViewController](self->_browserController, "rootViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "usingUnifiedBar"))
      v6 = -[BrowserController tabBarDisplayMode](self->_browserController, "tabBarDisplayMode") == 2;
    else
      v6 = 0;

  }
  return v6;
}

- (void)browserControllerStartPageUpdatePolicyDidChange:(id)a3
{
  void *v3;
  id v4;

  -[BrowserController rootViewController](self->_browserController, "rootViewController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "catalogViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startPageUpdatePolicyDidChange");

}

- (id)sidebarUIProxyForBrowserController:(id)a3
{
  return -[BrowserController rootViewController](self->_browserController, "rootViewController", a3);
}

- (id)browserController:(id)a3 delegateForBannerController:(id)a4
{
  return -[BrowserController rootViewController](self->_browserController, "rootViewController", a3, a4);
}

- (void)browserControllerLayOutCatalogView:(id)a3
{
  id v3;

  -[BrowserController rootViewController](self->_browserController, "rootViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layOutCatalogView");

}

- (void)browserController:(id)a3 setCatalogViewController:(id)a4
{
  BrowserController *browserController;
  id v5;
  id v6;

  browserController = self->_browserController;
  v5 = a4;
  -[BrowserController rootViewController](browserController, "rootViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCatalogViewController:", v5);

}

- (void)browserControllerShouldUpdateUnifiedBarVisibility:(id)a3
{
  id v3;

  objc_msgSend(a3, "rootViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateUnifiedBarVisibility");

}

- (id)browserControllerNavigationBar:(id)a3
{
  void *v3;
  void *v4;

  -[BrowserController rootViewController](self->_browserController, "rootViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)browserController:(id)a3 willConnectToScene:(id)a4 session:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  MobileSafariWindow *window;
  MobileSafariWindow *v14;
  MobileSafariWindow *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  window = self->_window;
  if (window)
  {
    -[MobileSafariWindow setWindowScene:](window, "setWindowScene:", v10);
    -[MobileSafariWindow makeKeyAndVisible](self->_window, "makeKeyAndVisible");
  }
  else
  {
    v14 = -[MobileSafariWindow initWithWindowScene:]([MobileSafariWindow alloc], "initWithWindowScene:", v10);
    v15 = self->_window;
    self->_window = v14;

    -[MobileSafariWindow setSafariWindowDelegate:](self->_window, "setSafariWindowDelegate:", self);
    objc_msgSend(MEMORY[0x1E0DC3658], "sf_safariAccentColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MobileSafariWindow setTintColor:](self->_window, "setTintColor:", v16);

    -[MobileSafariWindow setOpaque:](self->_window, "setOpaque:", 0);
    -[MobileSafariWindow layer](self->_window, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHitTestsAsOpaque:", 1);

    objc_msgSend(v20, "rootViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MobileSafariWindow setRootViewController:](self->_window, "setRootViewController:", v18);

    -[MobileSafariWindow makeKeyAndVisible](self->_window, "makeKeyAndVisible");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", self, sel__windowDidResignKeyWindow_, *MEMORY[0x1E0DC5618], self->_window);

  }
  if (-[BrowserController isControlledByAutomation](self->_browserController, "isControlledByAutomation"))
    -[BrowserControllerDefaultUIDelegate _setUpAutomationOverlay](self, "_setUpAutomationOverlay");

}

- (void)browserController:(id)a3 updateViewForActiveTabDocument:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(a3, "rootViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateViewForTabDocument:", v5);

}

- (id)browserController:(id)a3 tabDocumentViewGeometryProviderForTabDocumentView:(id)a4
{
  return -[BrowserController rootViewController](self->_browserController, "rootViewController", a3, a4);
}

- (void)browserControllerMakeKey:(id)a3
{
  -[MobileSafariWindow makeKeyWindow](self->_window, "makeKeyWindow", a3);
}

- (id)browserControllerTabContentContainerView:(id)a3
{
  void *v3;
  void *v4;

  -[BrowserController rootViewController](self->_browserController, "rootViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BrowserControllerDefaultUIDelegate)initWithBrowserController:(id)a3
{
  id v5;
  BrowserControllerDefaultUIDelegate *v6;
  BrowserControllerDefaultUIDelegate *v7;
  BrowserControllerDefaultUIDelegate *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BrowserControllerDefaultUIDelegate;
  v6 = -[BrowserControllerDefaultUIDelegate init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_browserController, a3);
    v8 = v7;
  }

  return v7;
}

- (void)browserController:(id)a3 didDisconnectFromScene:(id)a4
{
  -[MobileSafariWindow setWindowScene:](self->_window, "setWindowScene:", 0, a4);
  if (-[BrowserController isControlledByAutomation](self->_browserController, "isControlledByAutomation"))
    -[BrowserControllerDefaultUIDelegate _tearDownAutomationOverlay](self, "_tearDownAutomationOverlay");
}

- (void)browserControllerMakeKeyAndVisible:(id)a3
{
  -[MobileSafariWindow makeKeyAndVisible](self->_window, "makeKeyAndVisible", a3);
}

- (void)browserControllerDidBeginIgnoringUserInteraction:(id)a3
{
  -[MobileSafariWindow setUserInteractionEnabled:](self->_window, "setUserInteractionEnabled:", 0);
}

- (void)browserControllerDidEndIgnoringUserInteraction:(id)a3
{
  -[MobileSafariWindow setUserInteractionEnabled:](self->_window, "setUserInteractionEnabled:", 1);
}

- (void)browserControllerWillBeginObfuscating:(id)a3
{
  PrivateBrowsingObfuscationWindow *v4;
  PrivateBrowsingObfuscationWindow *obfuscationWindow;

  if (!self->_obfuscationWindow)
  {
    +[PrivateBrowsingObfuscationWindow showPrivateBrowsingObfuscationWindowForApplicationWindow:](PrivateBrowsingObfuscationWindow, "showPrivateBrowsingObfuscationWindowForApplicationWindow:", self->_window);
    v4 = (PrivateBrowsingObfuscationWindow *)objc_claimAutoreleasedReturnValue();
    obfuscationWindow = self->_obfuscationWindow;
    self->_obfuscationWindow = v4;

  }
}

- (void)browserControllerWillBeginNavigationGesture:(id)a3
{
  -[MobileSafariWindow beginDisablingInterfaceAutorotation](self->_window, "beginDisablingInterfaceAutorotation", a3);
}

- (void)browserControllerDidEndNavigationGesture:(id)a3
{
  -[MobileSafariWindow endDisablingInterfaceAutorotation](self->_window, "endDisablingInterfaceAutorotation", a3);
}

- (CGRect)browserControllerWindowFrame:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[MobileSafariWindow frame](self->_window, "frame", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)browserControllerStatusBarWidth:(id)a3
{
  CGRect v4;

  -[MobileSafariWindow bounds](self->_window, "bounds", a3);
  return CGRectGetWidth(v4);
}

- (void)handleTabViewPinchForBrowserController:(id)a3
{
  -[BrowserController handleTabViewPinch](self->_browserController, "handleTabViewPinch", a3);
}

- (id)browserController:(id)a3 tabSnapshotContentProviderForTabDocument:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(a3, "rootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "snapshotContentProviderForTab:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)tabSnapshotGeneratorDelegateForBrowserController:(id)a3
{
  return (id)objc_msgSend(a3, "rootViewController");
}

- (id)browserControllerTabHoverPreview:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabHoverPreview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)browserControllerParentFocusEnvironment:(id)a3
{
  return (id)objc_msgSend(a3, "rootViewController");
}

- (id)browserControllerFocusItemContainer:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)browserControllerPreferredFocusEnvironments:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)safariWindow:(id)a3 statusBarChangedFromHeight:(double)a4 toHeight:(double)a5
{
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  _QWORD v12[5];
  uint8_t buf[4];
  double v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v14 = a4;
    v15 = 2048;
    v16 = a5;
    _os_log_impl(&dword_1D7CA3000, v8, OS_LOG_TYPE_DEFAULT, "Status bar height changed from %.f to %.f", buf, 0x16u);
  }
  -[BrowserController tabController](self->_browserController, "tabController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activeTabDocument");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "webViewIsFullscreen");

  if (v11)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __87__BrowserControllerDefaultUIDelegate_safariWindow_statusBarChangedFromHeight_toHeight___block_invoke;
    v12[3] = &unk_1E9CF1900;
    v12[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v12);
  }
  else
  {
    -[BrowserController statusBarHeightChanged](self->_browserController, "statusBarHeightChanged");
  }
}

uint64_t __87__BrowserControllerDefaultUIDelegate_safariWindow_statusBarChangedFromHeight_toHeight___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "statusBarHeightChanged");
}

- (void)_windowDidResignKeyWindow:(id)a3
{
  void *v4;
  void *v5;
  int v6;

  -[BrowserController tabController](self->_browserController, "tabController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeTabDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "webViewIsFullscreen");

  if (v6)
    -[BrowserController cancelFavorites](self->_browserController, "cancelFavorites");
}

- (void)_setUpAutomationOverlay
{
  AutomationOverlayWindow *v3;
  void *v4;
  AutomationOverlayWindow *v5;
  AutomationOverlayWindow *windowForAutomationOverlay;
  AutomationOverlayViewController *v7;

  v3 = [AutomationOverlayWindow alloc];
  -[MobileSafariWindow windowScene](self->_window, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AutomationOverlayWindow initWithWindowScene:](v3, "initWithWindowScene:", v4);
  windowForAutomationOverlay = self->_windowForAutomationOverlay;
  self->_windowForAutomationOverlay = v5;

  v7 = -[AutomationOverlayViewController initWithDelegate:]([AutomationOverlayViewController alloc], "initWithDelegate:", self);
  -[AutomationOverlayWindow setRootViewController:](self->_windowForAutomationOverlay, "setRootViewController:", v7);
  -[AutomationOverlayWindow setAutomationWindowDelegate:](self->_windowForAutomationOverlay, "setAutomationWindowDelegate:", v7);
  -[AutomationOverlayWindow makeKeyAndVisible](self->_windowForAutomationOverlay, "makeKeyAndVisible");

}

- (void)_tearDownAutomationOverlay
{
  AutomationOverlayWindow *windowForAutomationOverlay;

  -[AutomationOverlayWindow setHidden:](self->_windowForAutomationOverlay, "setHidden:", 1);
  windowForAutomationOverlay = self->_windowForAutomationOverlay;
  self->_windowForAutomationOverlay = 0;

}

- (BOOL)automationOverlayControllerShouldAllowUserInteraction:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  +[Application sharedApplication](Application, "sharedApplication", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "automationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "automationSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "isSimulatingUserInteraction");
  else
    v6 = 0;

  return v6;
}

- (void)browserController:(id)a3 animateSafariIconLinkFromPoint:(CGPoint)a4 inView:(id)a5
{
  double y;
  double x;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  y = a4.y;
  x = a4.x;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "rootViewController");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sidebarUIProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = objc_msgSend(v10, "isShowingSidebar");
  if ((_DWORD)v9)
  {
    objc_msgSend(v18, "sidebarButtonEmbeddedInSidebar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0DC3F10];
    _SFSafariIconLinkImage();
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    objc_msgSend(v12, "_sf_animateLinkImage:withAnimation:fromPoint:inView:toRect:inView:afterImageDisappearsBlock:afterDestinationLayerBouncesBlock:", v13, 1, v8, v11, 0, 0, x, y, v14, v15, v16, v17);

    v8 = (id)v13;
  }
  else
  {
    objc_msgSend(v18, "primaryBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "animateSafariIconLinkFromPoint:inView:", v8, x, y);
  }

}

- (void)browserController:(id)a3 animateLinkImage:(CGImage *)a4 fromRect:(CGRect)a5 inView:(id)a6 toBarItem:(int64_t)a7
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void (**v29)(_QWORD);
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t);
  void *v38;
  id v39;
  id v40;
  id v41[7];
  id location;
  _QWORD v43[4];
  id v44;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a3;
  v15 = a6;
  objc_msgSend(v14, "showBars");
  objc_msgSend(v14, "rootViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "navigationBar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "containsBarItem:", a7) & 1) != 0)
    objc_msgSend(v16, "navigationBar");
  else
    objc_msgSend(v16, "primaryBar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (a7 != 3 || !objc_msgSend(v16, "isShowingSidebar"))
  {
    CGImageRetain(a4);
    objc_initWeak(&location, v14);
    v35 = MEMORY[0x1E0C809B0];
    v36 = 3221225472;
    v37 = __99__BrowserControllerDefaultUIDelegate_browserController_animateLinkImage_fromRect_inView_toBarItem___block_invoke_2;
    v38 = &unk_1E9CF58D0;
    objc_copyWeak(v41, &location);
    v39 = v18;
    v41[1] = a4;
    v41[2] = *(id *)&x;
    v41[3] = *(id *)&y;
    v41[4] = *(id *)&width;
    v41[5] = *(id *)&height;
    v40 = v15;
    v41[6] = (id)a7;
    v29 = (void (**)(_QWORD))_Block_copy(&v35);
    objc_msgSend(v14, "tabBarManager", v35, v36, v37, v38);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "inlineTabBar");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(v16, "dynamicBarAnimator");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "isInSteadyState");

      if ((v33 & 1) == 0)
      {
        objc_msgSend(v14, "setAnimationPendingDynamicBarAnimatorSteadyState:", v29);
LABEL_12:

        objc_destroyWeak(v41);
        objc_destroyWeak(&location);
        goto LABEL_13;
      }
    }
    else
    {

    }
    objc_msgSend(v16, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "layoutIfNeeded");

    v29[2](v29);
    goto LABEL_12;
  }
  objc_msgSend(v16, "sidebarButtonEmbeddedInSidebar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "beginIgnoringUserInteraction:", CFSTR("animateLinkImage"));
  v20 = (void *)MEMORY[0x1E0DC3F10];
  objc_msgSend(v19, "bounds");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __99__BrowserControllerDefaultUIDelegate_browserController_animateLinkImage_fromRect_inView_toBarItem___block_invoke;
  v43[3] = &unk_1E9CF1900;
  v44 = v14;
  objc_msgSend(v20, "_sf_animateLinkImage:withAnimation:fromRect:inView:toRect:inView:afterImageDisappearsBlock:afterDestinationLayerBouncesBlock:", a4, 1, v15, v19, 0, v43, x, y, width, height, v22, v24, v26, v28);

LABEL_13:
}

uint64_t __99__BrowserControllerDefaultUIDelegate_browserController_animateLinkImage_fromRect_inView_toBarItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endIgnoringUserInteraction:", CFSTR("animateLinkImage"));
}

void __99__BrowserControllerDefaultUIDelegate_browserController_animateLinkImage_fromRect_inView_toBarItem___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "beginIgnoringUserInteraction:", CFSTR("animateLinkImage"));
    v4 = *(_QWORD *)(a1 + 56);
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 96);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __99__BrowserControllerDefaultUIDelegate_browserController_animateLinkImage_fromRect_inView_toBarItem___block_invoke_3;
    v8[3] = &unk_1E9CF1900;
    v9 = v3;
    objc_msgSend(v5, "animateLinkImage:fromRect:inView:toBarItem:afterImageDisappearsBlock:afterDestinationLayerBouncesBlock:", v4, v6, v7, 0, v8, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
    CGImageRelease(*(CGImageRef *)(a1 + 56));

  }
}

uint64_t __99__BrowserControllerDefaultUIDelegate_browserController_animateLinkImage_fromRect_inView_toBarItem___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endIgnoringUserInteraction:", CFSTR("animateLinkImage"));
}

- (void)automationOverlayController:(id)a3 didChangeAllowsUserInteraction:(BOOL)a4
{
  void *windowForAutomationOverlay;

  windowForAutomationOverlay = self->_windowForAutomationOverlay;
  if (a4)
  {
    objc_msgSend(windowForAutomationOverlay, "setHidden:", 1);
    windowForAutomationOverlay = self->_window;
  }
  objc_msgSend(windowForAutomationOverlay, "makeKeyAndVisible", a3);
}

- (void)automationOverlayControllerDidDisableAutomation:(id)a3
{
  void *v3;
  id v4;

  +[Application sharedApplication](Application, "sharedApplication", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "automationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsRemoteAutomation:", 0);

}

- (void)automationOverlayControllerDidCancelAutomation:(id)a3
{
  void *v3;
  id v4;

  +[Application sharedApplication](Application, "sharedApplication", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "automationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "terminateSession");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowForAutomationOverlay, 0);
  objc_storeStrong((id *)&self->_obfuscationWindow, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_browserController, 0);
}

@end

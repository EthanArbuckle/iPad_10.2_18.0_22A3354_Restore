@implementation CSMainPageContentViewController

- (void)notificationsLoadedForSectionIdentifier:(id)a3
{
  -[CSCombinedListViewController notificationsLoadedForSectionIdentifier:](self->_combinedListViewController, "notificationsLoadedForSectionIdentifier:", a3);
}

- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4
{
  -[CSCombinedListViewController updateNotificationSectionSettings:previousSectionSettings:](self->_combinedListViewController, "updateNotificationSectionSettings:previousSectionSettings:", a3, a4);
}

- (CSMainPageContentViewController)init
{
  CSMainPageContentViewController *v2;
  uint64_t v3;
  CSLockScreenSettings *testSettings;
  PRWidgetMetricsProvider *v5;
  PRWidgetMetricsProvider *widgetMetricsProvider;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  CHSWidgetHost *widgetHost;
  CSCombinedListViewController *v12;
  CSCombinedListViewController *combinedListViewController;
  CSCombinedListViewController *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CSMainPageContentViewController;
  v2 = -[CSMainPageContentViewController init](&v17, sel_init);
  if (v2)
  {
    +[CSLockScreenDomain rootSettings](CSLockScreenDomain, "rootSettings");
    v3 = objc_claimAutoreleasedReturnValue();
    testSettings = v2->_testSettings;
    v2->_testSettings = (CSLockScreenSettings *)v3;

    -[PTSettings addKeyObserver:](v2->_testSettings, "addKeyObserver:", v2);
    v5 = (PRWidgetMetricsProvider *)objc_alloc_init(MEMORY[0x1E0D7FBD0]);
    widgetMetricsProvider = v2->_widgetMetricsProvider;
    v2->_widgetMetricsProvider = v5;

    -[PRWidgetMetricsProvider lockScreenWidgetMetricsSpecifications](v2->_widgetMetricsProvider, "lockScreenWidgetMetricsSpecifications");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0D10150]);
    v9 = (void *)objc_msgSend(v8, "initWithContainerDescriptors:metricsSpecification:", MEMORY[0x1E0C9AA60], v7);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D101D0]), "initWithIdentifier:", CFSTR("LockScreen"));
    widgetHost = v2->_widgetHost;
    v2->_widgetHost = (CHSWidgetHost *)v10;

    -[CHSWidgetHost setConfiguration:](v2->_widgetHost, "setConfiguration:", v9);
    v12 = objc_alloc_init(CSCombinedListViewController);
    combinedListViewController = v2->_combinedListViewController;
    v2->_combinedListViewController = v12;

    -[CSCombinedListViewController setDelegate:](v2->_combinedListViewController, "setDelegate:", v2);
    -[CSCombinedListViewController setPage:](v2->_combinedListViewController, "setPage:", v2);
    -[CSCombinedListViewController setScrollablePage:](v2->_combinedListViewController, "setScrollablePage:", v2);
    v14 = v2->_combinedListViewController;
    -[CSMainPageContentViewController layoutStrategy](v2, "layoutStrategy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSCombinedListViewController setLayoutStrategy:](v14, "setLayoutStrategy:", v15);

    -[CSCombinedListViewController setWidgetMetricsProvider:](v2->_combinedListViewController, "setWidgetMetricsProvider:", v2->_widgetMetricsProvider);
  }
  return v2;
}

- (SBSWidgetMetricsProviding)widgetMetricsProvider
{
  return self->_widgetMetricsProvider;
}

- (CSMainPageContentViewController)initWithAuthenticationProvider:(id)a3
{
  id v5;
  CSMainPageContentViewController *v6;
  CSMainPageContentViewController *v7;

  v5 = a3;
  v6 = -[CSMainPageContentViewController init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_authenticationProvider, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[CHSWidgetHost invalidate](self->_widgetHost, "invalidate");
  -[PTSettings removeKeyObserver:](self->_testSettings, "removeKeyObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)CSMainPageContentViewController;
  -[CSCoverSheetViewControllerBase dealloc](&v3, sel_dealloc);
}

- (BOOL)isShowingMediaControls
{
  return -[CSCombinedListViewController isShowingMediaControls](self->_combinedListViewController, "isShowingMediaControls");
}

- (BOOL)hasVisibleBreakthroughContent
{
  return -[CSCombinedListViewController hasVisibleBreakthroughContent](self->_combinedListViewController, "hasVisibleBreakthroughContent");
}

- (void)setLayoutStrategy:(id)a3
{
  CSLayoutStrategy *v5;

  v5 = (CSLayoutStrategy *)a3;
  if (self->_layoutStrategy != v5)
  {
    objc_storeStrong((id *)&self->_layoutStrategy, a3);
    -[CSCombinedListViewController setLayoutStrategy:](self->_combinedListViewController, "setLayoutStrategy:", v5);
  }

}

- (void)setWallpaperColorProvider:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperColorProvider);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_wallpaperColorProvider, obj);
    -[CSLogoutButtonViewController setWallpaperColorProvider:](self->_logoutButtonViewController, "setWallpaperColorProvider:", obj);
  }

}

- (void)setUserPresenceMonitor:(id)a3
{
  CSUserPresenceMonitor *v5;
  CSUserPresenceMonitor **p_userPresenceMonitor;
  CSUserPresenceMonitor *userPresenceMonitor;
  CSUserPresenceMonitor *v8;

  v5 = (CSUserPresenceMonitor *)a3;
  p_userPresenceMonitor = &self->_userPresenceMonitor;
  userPresenceMonitor = self->_userPresenceMonitor;
  v8 = v5;
  if (userPresenceMonitor != v5)
  {
    -[CSUserPresenceMonitor disableDetectionForReason:](userPresenceMonitor, "disableDetectionForReason:", CFSTR("Paging Friction"));
    -[CSUserPresenceMonitor removeObserver:](*p_userPresenceMonitor, "removeObserver:", self);
    objc_storeStrong((id *)&self->_userPresenceMonitor, a3);
    -[CSUserPresenceMonitor addObserver:](*p_userPresenceMonitor, "addObserver:", self);
    -[CSCoverSheetViewControllerBase updateBehaviorForController:](self, "updateBehaviorForController:", self);
    -[CSCombinedListViewController setUserPresenceMonitor:](self->_combinedListViewController, "setUserPresenceMonitor:", v8);
  }

}

- (void)addInlineContentSupportForDelegate:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_inlineContentViewControllerDelegate, a3);
  if (objc_msgSend(v5, "shouldInlineContentReceiveBackgroundTouches"))
    -[CSMainPageContentViewController _setupInlineContentGestureRecognizer](self, "_setupInlineContentGestureRecognizer");
  else
    -[CSMainPageContentViewController _removeInlineContentGestureRecognizer](self, "_removeInlineContentGestureRecognizer");

}

- (void)removeInlineContentSupport
{
  CSMainPageInlineContentViewControllerDelegate *inlineContentViewControllerDelegate;

  if (self->_inlineContentGestureRecognizer)
    -[CSMainPageContentViewController _removeInlineContentGestureRecognizer](self, "_removeInlineContentGestureRecognizer");
  inlineContentViewControllerDelegate = self->_inlineContentViewControllerDelegate;
  self->_inlineContentViewControllerDelegate = 0;

}

- (void)inlineContentDidChange
{
  CSMainPageInlineContentViewControllerDelegate *inlineContentViewControllerDelegate;
  int v4;
  UITapGestureRecognizer *inlineContentGestureRecognizer;

  BSDispatchQueueAssertMain();
  inlineContentViewControllerDelegate = self->_inlineContentViewControllerDelegate;
  if (inlineContentViewControllerDelegate)
  {
    v4 = -[CSMainPageInlineContentViewControllerDelegate shouldInlineContentReceiveBackgroundTouches](inlineContentViewControllerDelegate, "shouldInlineContentReceiveBackgroundTouches");
    inlineContentGestureRecognizer = self->_inlineContentGestureRecognizer;
    if (v4)
    {
      if (!inlineContentGestureRecognizer)
        -[CSMainPageContentViewController _setupInlineContentGestureRecognizer](self, "_setupInlineContentGestureRecognizer");
    }
    else if (inlineContentGestureRecognizer)
    {
      -[CSMainPageContentViewController _removeInlineContentGestureRecognizer](self, "_removeInlineContentGestureRecognizer");
    }
  }
}

- (void)_setupInlineContentGestureRecognizer
{
  UITapGestureRecognizer *v3;
  UITapGestureRecognizer *inlineContentGestureRecognizer;
  id v5;

  if (!self->_inlineContentGestureRecognizer)
  {
    v3 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__inlineContentGestureRecognizerDidTap_);
    inlineContentGestureRecognizer = self->_inlineContentGestureRecognizer;
    self->_inlineContentGestureRecognizer = v3;

    -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_inlineContentGestureRecognizer, "setNumberOfTapsRequired:", 1);
    -[CSPageViewController view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addGestureRecognizer:", self->_inlineContentGestureRecognizer);

  }
}

- (void)_removeInlineContentGestureRecognizer
{
  void *v3;
  UITapGestureRecognizer *inlineContentGestureRecognizer;

  if (self->_inlineContentGestureRecognizer)
  {
    -[CSPageViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeGestureRecognizer:", self->_inlineContentGestureRecognizer);

    inlineContentGestureRecognizer = self->_inlineContentGestureRecognizer;
    self->_inlineContentGestureRecognizer = 0;

  }
}

- (void)_inlineContentGestureRecognizerDidTap:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
  {
    -[CSMainPageInlineContentViewControllerDelegate didReceiveBackgroundTouch](self->_inlineContentViewControllerDelegate, "didReceiveBackgroundTouch");
    -[CSCoverSheetViewControllerBase updateAppearanceForController:](self, "updateAppearanceForController:", self);
  }
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  -[CSPageViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DAC668], "idealSearchPlatterWidth");
  objc_msgSend(v3, "setContentWidth:");
  -[CSCoverSheetViewControllerBase registerView:forRole:](self, "registerView:forRole:", v3, 1);
  v4.receiver = self;
  v4.super_class = (Class)CSMainPageContentViewController;
  -[CSPageViewController viewDidLoad](&v4, sel_viewDidLoad);

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSMainPageContentViewController;
  -[CSPresentationViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[CSCombinedListViewController layoutListView](self->_combinedListViewController, "layoutListView");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSMainPageContentViewController;
  -[CSCoverSheetViewControllerBase viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CSMainPageContentViewController _updateSmoothestPermittedPagingStrategy](self, "_updateSmoothestPermittedPagingStrategy");
  -[CSMainPageContentViewController _addOrRemoveViewsAsAppropriate](self, "_addOrRemoveViewsAsAppropriate");
  -[CSCoverSheetViewControllerBase rebuildBehavior](self, "rebuildBehavior");
}

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (void)aggregateAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CSMainPageContentViewController;
  -[CSPageViewController aggregateAppearance:](&v19, sel_aggregateAppearance_, v4);
  -[CSCoverSheetViewControllerBase kitPresentedViewController](self, "kitPresentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      +[CSAppearance appearanceForProvider:](CSAppearance, "appearanceForProvider:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("MainPageUIKitModal:%@"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      +[CSAppearance appearanceWithIdentifier:](CSAppearance, "appearanceWithIdentifier:", v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "presentationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "shouldPresentInFullscreen");

      if (v11)
      {
        v12 = (void *)objc_opt_new();
        objc_msgSend(v12, "priority:", 10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "fakeStatusBar:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "fakeStatusBarLevel:", &unk_1E8E8A258);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addComponent:", v15);

      }
    }
    objc_msgSend(v4, "unionAppearance:", v6);

  }
  if (self->_inlineContentViewControllerDelegate)
    objc_msgSend(v4, "unionAppearance:");
  if (self->_useFakeBlur)
  {
    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "priority:", 10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "style:", &unk_1E8E8A270);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addComponent:", v18);

  }
}

- (void)aggregateBehavior:(id)a3
{
  id v4;
  uint64_t v5;
  id WeakRetained;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CSMainPageContentViewController;
  -[CSPageViewController aggregateBehavior:](&v17, sel_aggregateBehavior_, v4);
  v5 = objc_msgSend(v4, "scrollingStrategy");
  switch(self->_smoothestPermittedStrategy)
  {
    case 0:
      WeakRetained = objc_loadWeakRetained((id *)&self->_touchEnvironmentStatusProvider);
      if (objc_msgSend(WeakRetained, "expectsPocketTouches"))
        v7 = 1;
      else
        v7 = 2;

      break;
    case 1:
      v8 = -[SBFAuthenticationStatusProvider isAuthenticatedCached](self->_authenticationProvider, "isAuthenticatedCached");
      goto LABEL_11;
    case 2:
      v7 = 1;
      break;
    case 3:
      v7 = 2;
      break;
    case 4:
      v8 = -[CSUserPresenceMonitor userPresenceDetectedSinceWake](self->_userPresenceMonitor, "userPresenceDetectedSinceWake");
LABEL_11:
      if (v8)
        v7 = 2;
      else
        v7 = 1;
      break;
    default:
      v7 = 0;
      break;
  }
  if (v5 <= v7)
    v9 = v7;
  else
    v9 = v5;
  objc_msgSend(v4, "setScrollingStrategy:", v9);
  -[CSCoverSheetViewControllerBase kitPresentedViewController](self, "kitPresentedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "transitionCoordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 && (objc_msgSend(v12, "isInteractive") & 1) != 0)
      goto LABEL_28;
    +[CSBehavior behavior](CSBehavior, "behavior");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v14, "unionBehavior:", v11);
LABEL_27:
      objc_msgSend(v4, "unionBehavior:", v14);

LABEL_28:
      goto LABEL_29;
    }
    objc_msgSend(v14, "setIdleTimerMode:", 1);
    objc_msgSend(v11, "presentationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "shouldPresentInFullscreen"))
    {
      v16 = objc_msgSend(v11, "isBeingPresented");

      if (v16)
      {
        objc_msgSend(v14, "setScrollingStrategy:", 3);
        objc_msgSend(v14, "setIdleTimerDuration:", 10);
        objc_msgSend(v14, "setIdleWarnMode:", 2);
        goto LABEL_27;
      }
    }
    else
    {

    }
    objc_msgSend(v14, "setIdleTimerDuration:", 9);
    goto LABEL_27;
  }
LABEL_29:
  if (self->_inlineContentViewControllerDelegate)
    objc_msgSend(v4, "unionBehavior:");

}

- (void)updateForPresentation:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[CSMainPageContentViewController _mainPageView](self, "_mainPageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateForPresentation:", v4);

  v6.receiver = self;
  v6.super_class = (Class)CSMainPageContentViewController;
  -[CSCoverSheetViewControllerBase updateForPresentation:](&v6, sel_updateForPresentation_, v4);

}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  CSUserPictureViewController *userPictureViewController;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CSMainPageContentViewController;
  if (!-[CSPresentationViewController handleEvent:](&v17, sel_handleEvent_, v4)
    || (objc_msgSend(v4, "isConsumable") & 1) == 0)
  {
    v6 = objc_msgSend(v4, "type");
    v5 = 0;
    if (v6 > 12)
    {
      switch(v6)
      {
        case 13:
          -[CSCoverSheetViewControllerBase rebuildBehavior](self, "rebuildBehavior");
          break;
        case 21:
          if (-[CSMainPageInlineContentViewControllerDelegate shouldInlineContentReceiveBackgroundTouches](self->_inlineContentViewControllerDelegate, "shouldInlineContentReceiveBackgroundTouches"))-[CSMainPageInlineContentViewControllerDelegate didReceiveBackgroundScroll](self->_inlineContentViewControllerDelegate, "didReceiveBackgroundScroll");
          break;
        case 24:
          if (!-[CSCombinedListViewController hasContent](self->_combinedListViewController, "hasContent"))
          {
            dispatch_get_global_queue(17, 0);
            v8 = objc_claimAutoreleasedReturnValue();
            dispatch_async(v8, &__block_literal_global_0);

          }
          break;
        default:
          goto LABEL_20;
      }
    }
    else
    {
      switch(v6)
      {
        case 1:
          -[CSMainPageContentViewController _addOrRemoveViewsAsAppropriate](self, "_addOrRemoveViewsAsAppropriate");
          -[CSCoverSheetViewControllerBase activeAppearance](self, "activeAppearance");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "legibilitySettings");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          -[CSMainPageContentViewController _mainPageView](self, "_mainPageView");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "updateForLegibilitySettings:", v10);

          -[CSCoverSheetViewControllerBase activeAppearance](self, "activeAppearance");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "componentForType:property:", 6, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isHidden") ^ 1;

          -[CSMainPageContentViewController _mainPageView](self, "_mainPageView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setFakeWallpaperVisible:", v14);

          break;
        case 2:
          -[CSMainPageContentViewController _addOrRemoveViewsAsAppropriate](self, "_addOrRemoveViewsAsAppropriate");
          break;
        case 9:
          userPictureViewController = self->_userPictureViewController;
          self->_userPictureViewController = 0;

          break;
        default:
          goto LABEL_20;
      }
    }
    v5 = 0;
    goto LABEL_20;
  }
  v5 = objc_msgSend(v4, "isConsumable");
LABEL_20:

  return v5;
}

void __47__CSMainPageContentViewController_handleEvent___block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.springboard.lockNotificationListEmptyAtScreenOn"), 0, 0, 1u);
}

- (CSNotificationDispatcher)dispatcher
{
  return -[CSCombinedListViewController dispatcher](self->_combinedListViewController, "dispatcher");
}

- (void)setDispatcher:(id)a3
{
  -[CSCombinedListViewController setDispatcher:](self->_combinedListViewController, "setDispatcher:", a3);
}

- (void)postNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id WeakRetained;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "un_logDigest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v8;
    v16 = 2114;
    v17 = v10;
    v18 = 2114;
    v19 = v12;
    _os_log_impl(&dword_1D0337000, v6, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ posting notification %{public}@ to %{public}@", (uint8_t *)&v14, 0x20u);

  }
  -[CSCombinedListViewController postNotificationRequest:](self->_combinedListViewController, "postNotificationRequest:", v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_notificationObserver);
  objc_msgSend(WeakRetained, "didPostNotificationRequest:", v4);

}

- (void)updateNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "un_logDigest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_1D0337000, v6, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ updating notification %{public}@", (uint8_t *)&v11, 0x16u);

  }
  -[CSCombinedListViewController updateNotificationRequest:](self->_combinedListViewController, "updateNotificationRequest:", v4);

}

- (void)withdrawNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "un_logDigest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_1D0337000, v6, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ withdrawing notification %{public}@", (uint8_t *)&v11, 0x16u);

  }
  -[CSCombinedListViewController withdrawNotificationRequest:](self->_combinedListViewController, "withdrawNotificationRequest:", v4);

}

- (void)updateNotificationSystemSettings:(id)a3 previousSystemSettings:(id)a4
{
  -[CSCombinedListViewController updateNotificationSystemSettings:previousSystemSettings:](self->_combinedListViewController, "updateNotificationSystemSettings:previousSystemSettings:", a3, a4);
}

- (BOOL)isNotificationContentExtensionVisible:(id)a3
{
  id v4;
  void *v5;
  int v6;
  BOOL v7;

  v4 = a3;
  v7 = -[CSPageViewController participantState](self, "participantState") == 2
    && self->_combinedListViewController
    && (-[CSPresentationViewController contentViewControllers](self, "contentViewControllers"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "containsObject:", self->_combinedListViewController),
        v5,
        v6)
    && -[CSCombinedListViewController isNotificationContentExtensionVisible:](self->_combinedListViewController, "isNotificationContentExtensionVisible:", v4);

  return v7;
}

- (BOOL)isPresentingNotificationInLongLook
{
  void *v3;
  int v4;

  if (-[CSPageViewController participantState](self, "participantState") == 2
    && self->_combinedListViewController
    && (-[CSPresentationViewController contentViewControllers](self, "contentViewControllers"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "containsObject:", self->_combinedListViewController),
        v3,
        v4))
  {
    return -[CSCombinedListViewController isPresentingNotificationInLongLook](self->_combinedListViewController, "isPresentingNotificationInLongLook");
  }
  else
  {
    return 0;
  }
}

- (BOOL)dismissNotificationInLongLookAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;

  v3 = a3;
  if (-[CSPageViewController participantState](self, "participantState") == 2
    && self->_combinedListViewController
    && (-[CSPresentationViewController contentViewControllers](self, "contentViewControllers"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "containsObject:", self->_combinedListViewController),
        v5,
        v6))
  {
    return -[CSCombinedListViewController dismissNotificationInLongLookAnimated:](self->_combinedListViewController, "dismissNotificationInLongLookAnimated:", v3);
  }
  else
  {
    return 0;
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[CSMainPageContentViewController _addOrRemoveViewsAsAppropriate](self, "_addOrRemoveViewsAsAppropriate");
  -[CSLockScreenSettings dashBoardScrollModifierSettings](self->_testSettings, "dashBoardScrollModifierSettings");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6 && objc_msgSend(v8, "isEqualToString:", CFSTR("strategy")))
  {
    -[CSMainPageContentViewController _updateSmoothestPermittedPagingStrategy](self, "_updateSmoothestPermittedPagingStrategy");
    -[CSCoverSheetViewControllerBase updateBehaviorForController:](self, "updateBehaviorForController:", self);
  }

}

- (void)combinedListViewController:(id)a3 hasContent:(BOOL)a4
{
  -[CSMainPageContentViewController _addOrRemoveNotificationsListIfNecessaryAnimated:](self, "_addOrRemoveNotificationsListIfNecessaryAnimated:", 1, a4);
}

- (id)notificationSectionSettingsForCombinedListViewController:(id)a3
{
  void *v4;
  void *v5;

  -[CSMainPageContentViewController dispatcher](self, "dispatcher", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationSectionSettingsForDestination:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)combinedListViewControllerWillExpandNotificationListCount:(id)a3
{
  if (-[CSMainPageInlineContentViewControllerDelegate shouldInlineContentReceiveBackgroundTouches](self->_inlineContentViewControllerDelegate, "shouldInlineContentReceiveBackgroundTouches", a3))-[CSMainPageInlineContentViewControllerDelegate didReceiveBackgroundTouch](self->_inlineContentViewControllerDelegate, "didReceiveBackgroundTouch");
}

- (void)combinedListViewController:(id)a3 isShowingMediaControls:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;

  v4 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mediaControlsObserver);
  objc_msgSend(WeakRetained, "setShowingMediaControls:", v4);

}

- (void)userPresenceDetectedSinceWakeDidChange:(id)a3
{
  if (-[CSMainPageContentViewController _pagingStyleRequiresUserPresenceDetection](self, "_pagingStyleRequiresUserPresenceDetection", a3))
  {
    -[CSCoverSheetViewControllerBase updateBehaviorForController:](self, "updateBehaviorForController:", self);
  }
}

- (BOOL)_pagingStyleRequiresUserPresenceDetection
{
  void *v2;
  BOOL v3;

  -[CSLockScreenSettings dashBoardScrollModifierSettings](self->_testSettings, "dashBoardScrollModifierSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "strategy") == 4;

  return v3;
}

- (void)_updateSmoothestPermittedPagingStrategy
{
  void *v3;
  int64_t v4;
  _BOOL4 v5;
  unsigned int v6;
  CSUserPresenceMonitor *userPresenceMonitor;

  -[CSLockScreenSettings dashBoardScrollModifierSettings](self->_testSettings, "dashBoardScrollModifierSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "strategy");

  v5 = -[CSUserPresenceMonitor isUserPresenceDetectionSupported](self->_userPresenceMonitor, "isUserPresenceDetectionSupported");
  v6 = -[SBFAuthenticationStatusProvider hasPasscodeSet](self->_authenticationProvider, "hasPasscodeSet");
  if (v4 == 1)
    goto LABEL_6;
  if (v4 == 4)
  {
    userPresenceMonitor = self->_userPresenceMonitor;
    if (v5)
    {
      -[CSUserPresenceMonitor enableDetectionForReason:](userPresenceMonitor, "enableDetectionForReason:", CFSTR("Paging Friction"));
      v4 = 4;
      goto LABEL_7;
    }
    -[CSUserPresenceMonitor disableDetectionForReason:](userPresenceMonitor, "disableDetectionForReason:", CFSTR("Paging Friction"));
LABEL_6:
    v4 = v6;
  }
LABEL_7:
  self->_smoothestPermittedStrategy = v4;
}

+ (unint64_t)requiredCapabilities
{
  return 0;
}

+ (BOOL)isAvailableForConfiguration
{
  return 1;
}

- (unint64_t)dateTimeLayout
{
  if (-[CSMainPageContentViewController _listBelowDateTime](self, "_listBelowDateTime"))
    return 1;
  else
    return 2;
}

- (double)dateTimeInsetX
{
  void *v2;
  void *v4;
  uint64_t v5;
  double result;
  BOOL v7;
  int v8;
  char v9;
  int v10;
  char v11;
  double v12;
  double v13;
  double v14;
  int v16;
  char v17;
  int v18;
  char v19;
  double v20;
  double v21;
  double v22;
  int v23;
  char v24;
  int v25;
  char v26;
  double v27;
  BOOL v28;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  result = 16.0;
  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v7 = -[CSMainPageContentViewController _isPortrait](self, "_isPortrait", 16.0);
    result = 24.0;
    if (!v7)
    {
      v8 = __sb__runningInSpringBoard();
      v9 = v8;
      if (v8)
      {
        if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          goto LABEL_21;
        if (SBFEffectiveHomeButtonType() != 2)
        {
          if ((v9 & 1) != 0)
            goto LABEL_21;
LABEL_13:

          goto LABEL_21;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "userInterfaceIdiom") || SBFEffectiveHomeButtonType() != 2)
          goto LABEL_13;
      }
      v10 = __sb__runningInSpringBoard();
      v11 = v10;
      if (v10)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "_referenceBounds");
      }
      BSSizeRoundForScale();
      v13 = v12;
      v14 = *(double *)(MEMORY[0x1E0DAB260] + 120);
      if ((v11 & 1) == 0)

      if ((v9 & 1) == 0)
      if (v13 >= v14)
        return 88.0;
LABEL_21:
      v16 = __sb__runningInSpringBoard();
      v17 = v16;
      if (v16)
      {
        if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          goto LABEL_39;
        if (SBFEffectiveHomeButtonType() != 2)
        {
          if ((v17 & 1) != 0)
            goto LABEL_39;
LABEL_31:

          goto LABEL_39;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "userInterfaceIdiom") || SBFEffectiveHomeButtonType() != 2)
          goto LABEL_31;
      }
      v18 = __sb__runningInSpringBoard();
      v19 = v18;
      if (v18)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "_referenceBounds");
      }
      BSSizeRoundForScale();
      v21 = v20;
      v22 = *(double *)(MEMORY[0x1E0DAB260] + 88);
      if ((v19 & 1) == 0)

      if ((v17 & 1) == 0)
      if (v21 >= v22)
        return 78.0;
LABEL_39:
      v23 = __sb__runningInSpringBoard();
      v24 = v23;
      if (v23)
      {
        if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          return 40.0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "userInterfaceIdiom"))
        {

          return 40.0;
        }
      }
      v25 = __sb__runningInSpringBoard();
      v26 = v25;
      if (v25)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "_referenceBounds");
      }
      BSSizeRoundForScale();
      v28 = v27 >= *(double *)(MEMORY[0x1E0DAB260] + 56);
      if ((v26 & 1) != 0)
      {
        if ((v24 & 1) != 0)
          goto LABEL_50;
      }
      else
      {

        if ((v24 & 1) != 0)
        {
LABEL_50:
          if (v28)
            return 44.0;
          return 40.0;
        }
      }

      if (v28)
        return 44.0;
      return 40.0;
    }
  }
  return result;
}

- (double)minimumDateToListSpacing
{
  void *v2;
  void *v4;
  uint64_t v5;
  double v6;
  int v7;
  char v8;
  int v9;
  char v10;
  double v11;
  double v12;
  double v13;
  int v14;
  char v15;
  int v16;
  char v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  int v22;
  char v23;
  int v24;
  char v25;
  double v26;
  BOOL v27;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  v6 = 0.0;
  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1 || -[CSMainPageContentViewController _isPortrait](self, "_isPortrait"))
    return v6;
  v7 = __sb__runningInSpringBoard();
  v8 = v7;
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_20;
    if (SBFEffectiveHomeButtonType() != 2)
    {
      if ((v8 & 1) != 0)
        goto LABEL_20;
LABEL_13:

      goto LABEL_20;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "userInterfaceIdiom") || SBFEffectiveHomeButtonType() != 2)
      goto LABEL_13;
  }
  v9 = __sb__runningInSpringBoard();
  v10 = v9;
  if (v9)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v12 = v11;
  v13 = *(double *)(MEMORY[0x1E0DAB260] + 72);
  if ((v10 & 1) == 0)

  if ((v8 & 1) == 0)
  v6 = 24.0;
  if (v12 >= v13)
    return v6;
LABEL_20:
  v14 = __sb__runningInSpringBoard();
  v15 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "userInterfaceIdiom"))
    {

      goto LABEL_35;
    }
LABEL_26:
    v16 = __sb__runningInSpringBoard();
    v17 = v16;
    if (v16)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    v19 = v18;
    v20 = *(double *)(MEMORY[0x1E0DAB260] + 56);
    if ((v17 & 1) == 0)

    if ((v15 & 1) == 0)
    if (v19 >= v20)
    {
      v21 = 0x4044000000000000;
      return *(double *)&v21;
    }
    goto LABEL_35;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
    goto LABEL_26;
LABEL_35:
  v22 = __sb__runningInSpringBoard();
  v23 = v22;
  if (v22)
  {
    if (SBFEffectiveDeviceClass())
    {
      v6 = 24.0;
      if (SBFEffectiveDeviceClass() != 1)
        return v6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "userInterfaceIdiom"))
    {

      return 24.0;
    }
  }
  v24 = __sb__runningInSpringBoard();
  v25 = v24;
  if (v24)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v27 = v26 >= *(double *)(MEMORY[0x1E0DAB260] + 40);
  if ((v25 & 1) == 0)

  if ((v23 & 1) == 0)
  v6 = 24.0;
  if (v27)
  {
    v21 = 0x4040000000000000;
    return *(double *)&v21;
  }
  return v6;
}

- (unint64_t)listLayout
{
  if (-[CSMainPageContentViewController _listBelowDateTime](self, "_listBelowDateTime"))
    return 1;
  else
    return 3;
}

- (unint64_t)listWidthStrategy
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1 && !-[CSMainPageContentViewController _isPortrait](self, "_isPortrait"))
    return 2;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  return (v6 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (double)customListWidth
{
  void *v3;
  double Height;
  void *v5;
  double Width;
  void *v7;
  double v8;
  double v9;
  CGRect v11;
  CGRect v12;

  -[CSPageViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Height = CGRectGetHeight(v11);

  -[CSPageViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  Width = CGRectGetWidth(v12);

  if (Height >= Width)
    Height = Width;
  -[CSMainPageContentViewController combinedListViewController](self, "combinedListViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "horizontalInsetMargin");
  v9 = Height + v8 * -2.0;

  return v9;
}

- (double)listInsetX
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  double v6;
  double v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  double v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  double v29;
  int v30;
  double v31;
  double v32;
  double v34;
  double v35;
  double v37;
  int v38;
  double v39;
  int v40;
  double v41;
  double v42;
  int v43;
  int v44;
  double v45;
  double v46;
  double v47;
  int v48;
  int v49;
  double v50;
  double v51;
  int v52;
  int v53;
  int v54;
  int v55;
  double v56;
  int v57;
  double v58;
  double v59;
  int v60;
  int v61;
  double v62;
  uint64_t v63;
  double v64;
  double v65;
  int v66;
  int v67;
  int v68;
  double v69;
  double v70;
  int v71;
  double v72;
  uint64_t v73;
  double v74;
  double v75;
  int v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  int v134;
  uint64_t v135;
  uint64_t v136;
  _BYTE v137[12];
  _BYTE v138[20];
  uint64_t v139;
  uint64_t v140;
  __int128 v141;
  __int128 v142;
  int v143;
  int v144;
  int v145;
  int v146;
  int v147;
  int v148;
  int v149;
  int v150;
  int v151;

  -[CSMainPageContentViewController combinedListViewController](self, "combinedListViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "horizontalInsetMargin");
  v7 = v6;

  if (-[CSMainPageContentViewController _listBelowDateTime](self, "_listBelowDateTime"))
    return v7;
  v8 = __sb__runningInSpringBoard();
  if (v8)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v9 = 0;
      v10 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v126, "userInterfaceIdiom") != 1)
    {
      v9 = 0;
      v10 = 1;
      goto LABEL_11;
    }
  }
  v10 = v8 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v11 = __sb__runningInSpringBoard();
    if ((_DWORD)v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "_referenceBounds");
    }
    v9 = v11 ^ 1;
    BSSizeRoundForScale();
    if (v32 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v31 == *(double *)(MEMORY[0x1E0DAB260] + 280))
    {
      v150 = v11 ^ 1;
      v151 = v10;
      v140 = 0;
      v139 = 0;
      v141 = 0uLL;
      memset(v138, 0, sizeof(v138));
      memset(v137, 0, sizeof(v137));
      v142 = 0uLL;
      v135 = 0;
      v136 = 0;
      v149 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      v143 = 0;
      v144 = 0;
      v131 = 0;
      v145 = 0;
      v129 = 0;
      v146 = 0;
      v130 = 0;
      v147 = 0;
      v128 = 0;
      v22 = 0;
      v23 = 0;
      v148 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v7 = 0.0;
      goto LABEL_68;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_11:
  v12 = __sb__runningInSpringBoard();
  v150 = v9;
  v151 = v10;
  if (v12)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v13 = 0;
      v14 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v125, "userInterfaceIdiom") != 1)
    {
      v13 = 0;
      v14 = 1;
      goto LABEL_20;
    }
  }
  v14 = v12 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v11 = __sb__runningInSpringBoard();
    if ((_DWORD)v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "_referenceBounds");
    }
    v13 = v11 ^ 1;
    BSSizeRoundForScale();
    if (v34 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      v147 = v11 ^ 1;
      v148 = v14;
      v140 = 0;
      v139 = 0;
      v141 = 0uLL;
      memset(v138, 0, sizeof(v138));
      memset(v137, 0, sizeof(v137));
      v142 = 0uLL;
      v135 = 0;
      v136 = 0;
      v149 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      v143 = 0;
      v144 = 0;
      v131 = 0;
      v145 = 0;
      v129 = 0;
      v146 = 0;
      v130 = 0;
      v128 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v7 = 0.0;
      goto LABEL_68;
    }
  }
  else
  {
    v13 = 0;
  }
LABEL_20:
  v15 = __sb__runningInSpringBoard();
  v147 = v13;
  v148 = v14;
  if (v15)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v16 = 0;
      v17 = 0;
      goto LABEL_29;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v124, "userInterfaceIdiom") != 1)
    {
      v16 = 0;
      v17 = 1;
      goto LABEL_29;
    }
  }
  v17 = v15 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v11 = __sb__runningInSpringBoard();
    if ((_DWORD)v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "_referenceBounds");
    }
    v16 = v11 ^ 1;
    BSSizeRoundForScale();
    if (v35 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      v145 = v11 ^ 1;
      v146 = v17;
      v140 = 0;
      v139 = 0;
      v141 = 0uLL;
      memset(v138, 0, sizeof(v138));
      memset(v137, 0, sizeof(v137));
      v142 = 0uLL;
      v135 = 0;
      v136 = 0;
      v149 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      v143 = 0;
      v144 = 0;
      v131 = 0;
      v130 = 0;
      v129 = 0;
      v128 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v7 = 0.0;
      goto LABEL_68;
    }
  }
  else
  {
    v16 = 0;
  }
LABEL_29:
  v18 = __sb__runningInSpringBoard();
  v145 = v16;
  v146 = v17;
  if (v18)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v3 = 0;
      v19 = 0;
      goto LABEL_38;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v123, "userInterfaceIdiom") != 1)
    {
      v3 = 0;
      v19 = 1;
      goto LABEL_38;
    }
  }
  v19 = v18 ^ 1;
  v11 = __sb__runningInSpringBoard();
  if ((_DWORD)v11)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "_referenceBounds");
  }
  v3 = v11 ^ 1;
  BSSizeRoundForScale();
  if (v20 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    v143 = v11 ^ 1;
    v144 = v19;
    v140 = 0;
    v139 = 0;
    v141 = 0uLL;
    memset(v138, 0, sizeof(v138));
    memset(v137, 0, sizeof(v137));
    v142 = 0uLL;
    v135 = 0;
    v136 = 0;
    v149 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    v129 = 0;
    v130 = 0;
    v131 = 0;
    v128 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v7 = 0.0;
    goto LABEL_68;
  }
LABEL_38:
  v21 = __sb__runningInSpringBoard();
  v143 = v3;
  v144 = v19;
  if (v21)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v149 = 0;
      v2 = 0;
      goto LABEL_48;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v122, "userInterfaceIdiom") != 1)
    {
      v149 = 0;
      v2 = 1;
      goto LABEL_48;
    }
  }
  v2 = v21 ^ 1u;
  v11 = __sb__runningInSpringBoard();
  if ((_DWORD)v11)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "_referenceBounds");
  }
  v149 = v11 ^ 1;
  BSSizeRoundForScale();
  if (v29 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    DWORD2(v142) = 0;
    HIDWORD(v142) = v2;
    v140 = 0;
    v139 = 0;
    v141 = 0uLL;
    memset(v138, 0, sizeof(v138));
    memset(v137, 0, sizeof(v137));
    *(_QWORD *)&v142 = 0;
    v135 = 0;
    v136 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    v129 = 0;
    v130 = 0;
    v131 = 0;
    v128 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v7 = 0.0;
    goto LABEL_68;
  }
LABEL_48:
  v30 = __sb__runningInSpringBoard();
  HIDWORD(v142) = v2;
  if (v30)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_QWORD *)((char *)&v142 + 4) = 0;
      goto LABEL_179;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v121, "userInterfaceIdiom") != 1)
    {
      *(_QWORD *)((char *)&v142 + 4) = 0x100000000;
      goto LABEL_179;
    }
  }
  DWORD2(v142) = v30 ^ 1;
  v11 = __sb__runningInSpringBoard();
  if ((_DWORD)v11)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "_referenceBounds");
  }
  DWORD1(v142) = v11 ^ 1;
  BSSizeRoundForScale();
  if (v37 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    v140 = 0;
    v139 = 0;
    v141 = 0uLL;
    memset(v138, 0, sizeof(v138));
    memset(v137, 0, sizeof(v137));
    LODWORD(v142) = 0;
    v135 = 0;
    v136 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    v129 = 0;
    v130 = 0;
    v131 = 0;
    v128 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v7 = 0.0;
    goto LABEL_68;
  }
LABEL_179:
  v11 = __sb__runningInSpringBoard();
  if ((_DWORD)v11)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_181;
LABEL_187:
    v140 = 0;
    v139 = 0;
    v141 = 0uLL;
    memset(v138, 0, sizeof(v138));
    memset(v137, 0, sizeof(v137));
    v135 = 0;
    v136 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    v129 = 0;
    v130 = 0;
    v131 = 0;
    v128 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v7 = 0.0;
    LODWORD(v142) = v11 ^ 1;
    goto LABEL_68;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v119, "userInterfaceIdiom") == 1)
    goto LABEL_187;
LABEL_181:
  LODWORD(v142) = v11 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_185:
    *(_QWORD *)((char *)&v141 + 4) = 0;
    goto LABEL_195;
  }
  v38 = __sb__runningInSpringBoard();
  if (v38)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_185;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v113, "userInterfaceIdiom"))
    {
      *(_QWORD *)((char *)&v141 + 4) = 1;
      goto LABEL_195;
    }
  }
  DWORD1(v141) = v38 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v11 = __sb__runningInSpringBoard();
    if ((_DWORD)v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "_referenceBounds");
    }
    DWORD2(v141) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v41 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      v140 = 0;
      v139 = 0;
      LODWORD(v141) = 0;
      HIDWORD(v141) = 0;
      memset(v138, 0, sizeof(v138));
      memset(v137, 0, sizeof(v137));
      v135 = 0;
      v136 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      v129 = 0;
      v130 = 0;
      v131 = 0;
      v128 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v7 = 136.0;
      goto LABEL_68;
    }
  }
  else
  {
    DWORD2(v141) = 0;
  }
LABEL_195:
  v11 = __sb__runningInSpringBoard();
  if ((_DWORD)v11)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v141) = 0;
      HIDWORD(v141) = 0;
      goto LABEL_205;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v114, "userInterfaceIdiom"))
    {
      LODWORD(v141) = 0;
      HIDWORD(v141) = 1;
      goto LABEL_205;
    }
  }
  HIDWORD(v141) = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v11 = __sb__runningInSpringBoard();
    if ((_DWORD)v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "_referenceBounds");
    }
    LODWORD(v141) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v39 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_209;
  }
  else
  {
    LODWORD(v141) = 0;
  }
LABEL_205:
  if ((_SBF_Private_IsD94Like() & 1) != 0)
  {
    v140 = 0;
    v139 = 0;
    memset(v138, 0, sizeof(v138));
    memset(v137, 0, sizeof(v137));
    v135 = 0;
    v136 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    v129 = 0;
    v130 = 0;
    v131 = 0;
    v128 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v7 = 129.0;
    goto LABEL_68;
  }
LABEL_209:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_213:
    v140 = 0;
    goto LABEL_223;
  }
  v40 = __sb__runningInSpringBoard();
  if (v40)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_213;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v110, "userInterfaceIdiom"))
    {
      v140 = 0x100000000;
      goto LABEL_223;
    }
  }
  HIDWORD(v140) = v40 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v11 = __sb__runningInSpringBoard();
    if ((_DWORD)v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "_referenceBounds");
    }
    LODWORD(v140) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v46 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      v139 = 0;
      memset(v138, 0, sizeof(v138));
      memset(v137, 0, sizeof(v137));
      v135 = 0;
      v136 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      v129 = 0;
      v130 = 0;
      v131 = 0;
      v128 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v7 = 124.0;
      goto LABEL_68;
    }
  }
  else
  {
    LODWORD(v140) = 0;
  }
LABEL_223:
  v11 = __sb__runningInSpringBoard();
  if ((_DWORD)v11)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v139) = 0;
      *(_DWORD *)&v138[16] = 0;
      goto LABEL_233;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v112, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v138[16] = 0;
      HIDWORD(v139) = 1;
      goto LABEL_233;
    }
  }
  HIDWORD(v139) = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v11 = __sb__runningInSpringBoard();
    if ((_DWORD)v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "_referenceBounds");
    }
    *(_DWORD *)&v138[16] = v11 ^ 1;
    BSSizeRoundForScale();
    if (v42 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_237;
  }
  else
  {
    *(_DWORD *)&v138[16] = 0;
  }
LABEL_233:
  if ((_SBF_Private_IsD64Like() & 1) != 0)
  {
    LODWORD(v139) = 0;
    *(_QWORD *)v138 = 0;
    *(_QWORD *)&v138[8] = 0;
    memset(v137, 0, sizeof(v137));
    v135 = 0;
    v136 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    v129 = 0;
    v130 = 0;
    v131 = 0;
    v128 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v7 = 118.0;
    goto LABEL_68;
  }
LABEL_237:
  v43 = __sb__runningInSpringBoard();
  if (v43)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v139) = 0;
      *(_DWORD *)&v138[12] = 0;
      goto LABEL_247;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v111, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v138[12] = 0;
      LODWORD(v139) = 1;
      goto LABEL_247;
    }
  }
  LODWORD(v139) = v43 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v44 = __sb__runningInSpringBoard();
    if (v44)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "_referenceBounds");
    }
    v11 = v44 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v138[12] = v11;
    if (v45 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      *(_QWORD *)v138 = 0;
      memset(v137, 0, sizeof(v137));
      *(_DWORD *)&v138[8] = 0;
      v135 = 0;
      v136 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      v129 = 0;
      v130 = 0;
      v131 = 0;
      v128 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v7 = 124.0;
      goto LABEL_68;
    }
  }
  else
  {
    *(_DWORD *)&v138[12] = 0;
  }
LABEL_247:
  v11 = __sb__runningInSpringBoard();
  if ((_DWORD)v11)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)v138 = 0;
      *(_DWORD *)v137 = 0;
      goto LABEL_257;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v108, "userInterfaceIdiom"))
    {
      *(_DWORD *)v137 = 0;
      *(_DWORD *)v138 = 1;
      goto LABEL_257;
    }
  }
  *(_DWORD *)v138 = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v11 = __sb__runningInSpringBoard();
    if ((_DWORD)v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "_referenceBounds");
    }
    *(_DWORD *)v137 = v11 ^ 1;
    BSSizeRoundForScale();
    if (v47 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_267;
  }
  else
  {
    *(_DWORD *)v137 = 0;
  }
LABEL_257:
  if ((_SBF_Private_IsD54() & 1) != 0)
  {
    *(_QWORD *)&v138[4] = 0;
    *(_QWORD *)&v137[4] = 0;
    v135 = 0;
    v136 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    v129 = 0;
    v130 = 0;
    v131 = 0;
    v128 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v7 = 118.0;
    goto LABEL_68;
  }
LABEL_267:
  v48 = __sb__runningInSpringBoard();
  if (v48)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)&v138[4] = 0;
      goto LABEL_277;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v107, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v138[4] = 0;
      *(_DWORD *)&v138[8] = 1;
      goto LABEL_277;
    }
  }
  *(_DWORD *)&v138[8] = v48 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v49 = __sb__runningInSpringBoard();
    if (v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "_referenceBounds");
    }
    v11 = v49 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v138[4] = v11;
    if (v50 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      *(_QWORD *)&v137[4] = 0;
      v135 = 0;
      v136 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      v129 = 0;
      v130 = 0;
      v131 = 0;
      v128 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v7 = 118.0;
      goto LABEL_68;
    }
  }
  else
  {
    *(_DWORD *)&v138[4] = 0;
  }
LABEL_277:
  v11 = __sb__runningInSpringBoard();
  if ((_DWORD)v11)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)&v137[4] = 0;
      goto LABEL_287;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v104, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v137[4] = 0;
      *(_DWORD *)&v137[8] = 1;
      goto LABEL_287;
    }
  }
  *(_DWORD *)&v137[8] = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v11 = __sb__runningInSpringBoard();
    if ((_DWORD)v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "_referenceBounds");
    }
    *(_DWORD *)&v137[4] = v11 ^ 1;
    BSSizeRoundForScale();
    if (v51 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_296;
  }
  else
  {
    *(_DWORD *)&v137[4] = 0;
  }
LABEL_287:
  if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
  {
    v135 = 0;
    v136 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    v129 = 0;
    v130 = 0;
    v131 = 0;
    v128 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v7 = 118.0;
    goto LABEL_68;
  }
LABEL_296:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_300:
    v135 = 0;
    goto LABEL_307;
  }
  v52 = __sb__runningInSpringBoard();
  if (v52)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_300;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v99, "userInterfaceIdiom"))
    {
      v135 = 0x100000000;
      goto LABEL_307;
    }
  }
  HIDWORD(v135) = v52 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v53 = __sb__runningInSpringBoard();
    if (v53)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "_referenceBounds");
    }
    v11 = v53 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v135) = v11;
    if (v58 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      v136 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
      v129 = 0;
      v130 = 0;
      v131 = 0;
      v128 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v7 = 144.0;
      goto LABEL_68;
    }
  }
  else
  {
    LODWORD(v135) = 0;
  }
LABEL_307:
  v54 = __sb__runningInSpringBoard();
  if (v54)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v136) = 0;
      v11 = 0;
      goto LABEL_317;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v103, "userInterfaceIdiom"))
    {
      v11 = 0;
      HIDWORD(v136) = 1;
      goto LABEL_317;
    }
  }
  HIDWORD(v136) = v54 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v55 = __sb__runningInSpringBoard();
    if (v55)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "_referenceBounds");
    }
    v11 = v55 ^ 1u;
    BSSizeRoundForScale();
    if (v56 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_321;
  }
  else
  {
    v11 = 0;
  }
LABEL_317:
  if ((_SBF_Private_IsD93Like() & 1) != 0)
  {
    LODWORD(v136) = v11;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    v129 = 0;
    v130 = 0;
    v131 = 0;
    v128 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v7 = 93.0;
    goto LABEL_68;
  }
LABEL_321:
  LODWORD(v136) = v11;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_325:
    v133 = 0;
    goto LABEL_335;
  }
  v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_325;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v94, "userInterfaceIdiom"))
    {
      v133 = 0x100000000;
      goto LABEL_335;
    }
  }
  HIDWORD(v133) = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v11 = __sb__runningInSpringBoard();
    if ((_DWORD)v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v2, "_referenceBounds");
    }
    v90 = (void *)v2;
    LODWORD(v133) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v64 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v134 = 0;
      v132 = 0;
      v129 = 0;
      v130 = 0;
      v131 = 0;
      v128 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v7 = 135.0;
      goto LABEL_68;
    }
  }
  else
  {
    LODWORD(v133) = 0;
  }
LABEL_335:
  v11 = __sb__runningInSpringBoard();
  v2 = (uint64_t)&off_1D048E000;
  if ((_DWORD)v11)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v134 = 0;
      HIDWORD(v132) = 0;
      goto LABEL_345;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v98, "userInterfaceIdiom"))
    {
      HIDWORD(v132) = 0;
      v134 = 1;
      goto LABEL_345;
    }
  }
  v134 = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v11 = __sb__runningInSpringBoard();
    if ((_DWORD)v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "_referenceBounds");
    }
    HIDWORD(v132) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v59 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_349;
  }
  else
  {
    HIDWORD(v132) = 0;
  }
LABEL_345:
  if ((_SBF_Private_IsD63Like() & 1) != 0)
  {
    LODWORD(v132) = 0;
    v129 = 0;
    v130 = 0;
    v131 = 0;
    v128 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v7 = 87.0;
    goto LABEL_68;
  }
LABEL_349:
  v60 = __sb__runningInSpringBoard();
  if (v60)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v132) = 0;
      HIDWORD(v129) = 0;
      goto LABEL_359;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v95, "userInterfaceIdiom"))
    {
      HIDWORD(v129) = 0;
      LODWORD(v132) = 1;
      goto LABEL_359;
    }
  }
  LODWORD(v132) = v60 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v61 = __sb__runningInSpringBoard();
    if (v61)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v3, "_referenceBounds");
    }
    v91 = (void *)v3;
    v11 = v61 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v129) = v11;
    if (v62 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      v130 = 0;
      v131 = 0;
      LODWORD(v129) = 0;
      v128 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      *(double *)&v63 = 124.0;
LABEL_374:
      v7 = *(double *)&v63;
      goto LABEL_68;
    }
  }
  else
  {
    HIDWORD(v129) = 0;
  }
LABEL_359:
  v11 = __sb__runningInSpringBoard();
  v3 = (uint64_t)&off_1D048E000;
  if ((_DWORD)v11)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v131 = 0;
      goto LABEL_369;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v92, "userInterfaceIdiom"))
    {
      v131 = 0x100000000;
      goto LABEL_369;
    }
  }
  HIDWORD(v131) = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v11 = __sb__runningInSpringBoard();
    if ((_DWORD)v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "_referenceBounds");
    }
    LODWORD(v131) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v65 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_380;
  }
  else
  {
    LODWORD(v131) = 0;
  }
LABEL_369:
  if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
  {
    v130 = 0;
    LODWORD(v129) = 0;
    v128 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v7 = 118.0;
    goto LABEL_68;
  }
LABEL_380:
  v66 = __sb__runningInSpringBoard();
  if (v66)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v130) = 0;
      LODWORD(v129) = 0;
      goto LABEL_390;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v89, "userInterfaceIdiom"))
    {
      LODWORD(v129) = 0;
      HIDWORD(v130) = 1;
      goto LABEL_390;
    }
  }
  HIDWORD(v130) = v66 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v11 = __sb__runningInSpringBoard();
    if ((_DWORD)v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "_referenceBounds");
    }
    LODWORD(v129) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v69 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v128 = 0;
      LODWORD(v130) = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v7 = 135.0;
      goto LABEL_68;
    }
  }
  else
  {
    LODWORD(v129) = 0;
  }
LABEL_390:
  v67 = __sb__runningInSpringBoard();
  if (v67)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v128) = 0;
      v11 = 0;
      goto LABEL_400;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v86, "userInterfaceIdiom"))
    {
      v11 = 0;
      HIDWORD(v128) = 1;
      goto LABEL_400;
    }
  }
  HIDWORD(v128) = v67 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v68 = __sb__runningInSpringBoard();
    if (v68)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "_referenceBounds");
    }
    v11 = v68 ^ 1u;
    BSSizeRoundForScale();
    if (v70 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_408;
  }
  else
  {
    v11 = 0;
  }
LABEL_400:
  if ((_SBF_Private_IsD53() & 1) != 0)
  {
    LODWORD(v130) = v11;
LABEL_402:
    LODWORD(v128) = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v7 = 87.0;
    goto LABEL_68;
  }
LABEL_408:
  LODWORD(v130) = v11;
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
    LODWORD(v128) = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v7 = 118.0;
    goto LABEL_68;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
    goto LABEL_402;
  v7 = 118.0;
  if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
    LODWORD(v128) = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    goto LABEL_68;
  }
  if ((_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
  {
    LODWORD(v128) = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
LABEL_417:
    v7 = 87.0;
    goto LABEL_68;
  }
  v11 = __sb__runningInSpringBoard();
  if ((_DWORD)v11)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v128) = 0;
      v22 = 0;
      goto LABEL_428;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v82, "userInterfaceIdiom"))
    {
      v22 = 0;
      LODWORD(v128) = 1;
      goto LABEL_428;
    }
  }
  LODWORD(v128) = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "_referenceBounds");
    }
    v22 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v74 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      goto LABEL_68;
    }
  }
  else
  {
    v22 = 0;
  }
LABEL_428:
  v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v23 = 0;
      v24 = 0;
      goto LABEL_438;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v81, "userInterfaceIdiom"))
    {
      v24 = 0;
      v23 = 1;
      goto LABEL_438;
    }
  }
  v23 = v71 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "_referenceBounds");
    }
    v24 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v75 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      goto LABEL_417;
    }
  }
  else
  {
    v24 = 0;
  }
LABEL_438:
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v25 = 0;
      v26 = 0;
      goto LABEL_448;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v80, "userInterfaceIdiom"))
    {
      v26 = 0;
      v25 = 1;
      goto LABEL_448;
    }
  }
  v25 = v2 ^ 1;
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v11, "_referenceBounds");
  }
  v26 = v2 ^ 1;
  BSSizeRoundForScale();
  if (v72 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
  {
    v27 = 0;
    v28 = 0;
    *(double *)&v73 = 44.0;
    goto LABEL_455;
  }
LABEL_448:
  v3 = __sb__runningInSpringBoard();
  if ((_DWORD)v3)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v27 = 0;
      v28 = 0;
      *(double *)&v73 = 40.0;
LABEL_455:
      v7 = *(double *)&v73;
      goto LABEL_68;
    }
    goto LABEL_462;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)v2, "userInterfaceIdiom"))
  {
    v28 = 0;
    v27 = 1;
    *(double *)&v63 = 40.0;
    goto LABEL_374;
  }
LABEL_462:
  v27 = v3 ^ 1;
  v76 = __sb__runningInSpringBoard();
  if (v76)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v3, "_referenceBounds");
  }
  v28 = v76 ^ 1;
  BSSizeRoundForScale();
  if (v77 < *(double *)(MEMORY[0x1E0DAB260] + 40))
    v7 = 40.0;
  else
    v7 = 69.0;
LABEL_68:
  if (v28)

  if (v27)
  if (v26)

  if (v25)
  if (v24)

  if (v23)
  if (v22)

  if ((_DWORD)v128)
  if ((_DWORD)v130)

  if (HIDWORD(v128))
  if ((_DWORD)v129)

  if (HIDWORD(v130))
  if ((_DWORD)v131)

  if (HIDWORD(v131))
  if (HIDWORD(v129))

  if ((_DWORD)v132)
  if (HIDWORD(v132))

  if (v134)
  if ((_DWORD)v133)

  if (HIDWORD(v133))
  if ((_DWORD)v136)

  if (HIDWORD(v136))
  if ((_DWORD)v135)

  if (HIDWORD(v135))
  if (*(_DWORD *)&v137[4])

  if (*(_DWORD *)&v137[8])
  if (*(_DWORD *)&v138[4])

  if (*(_DWORD *)&v138[8])
  if (*(_DWORD *)v137)

  if (*(_DWORD *)v138)
  if (*(_DWORD *)&v138[12])

  if ((_DWORD)v139)
  if (*(_DWORD *)&v138[16])

  if (HIDWORD(v139))
  if ((_DWORD)v140)

  if (HIDWORD(v140))
  if ((_DWORD)v141)

  if (HIDWORD(v141))
  if (DWORD2(v141))

  if (DWORD1(v141))
  if ((_DWORD)v142)

  if (DWORD1(v142))
  if (DWORD2(v142))

  if (v149)
  if (HIDWORD(v142))
  {

    if (!v143)
      goto LABEL_158;
  }
  else if (!v143)
  {
LABEL_158:
    if (v144)
      goto LABEL_159;
    goto LABEL_169;
  }

  if (v144)
  {
LABEL_159:

    if (!v145)
      goto LABEL_160;
    goto LABEL_170;
  }
LABEL_169:
  if (!v145)
  {
LABEL_160:
    if (v146)
      goto LABEL_161;
    goto LABEL_171;
  }
LABEL_170:

  if (v146)
  {
LABEL_161:

    if (!v147)
      goto LABEL_162;
    goto LABEL_172;
  }
LABEL_171:
  if (!v147)
  {
LABEL_162:
    if (v148)
      goto LABEL_163;
    goto LABEL_173;
  }
LABEL_172:

  if (v148)
  {
LABEL_163:

    if (!v150)
      goto LABEL_164;
LABEL_174:

    if (!v151)
      return v7;
    goto LABEL_165;
  }
LABEL_173:
  if (v150)
    goto LABEL_174;
LABEL_164:
  if (v151)
LABEL_165:

  return v7;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSMainPageContentViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollablePageViewController:scrollViewWillBeginDragging:", self, v4);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSMainPageContentViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollablePageViewController:scrollViewDidScroll:", self, v4);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  id v8;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  -[CSMainPageContentViewController delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scrollablePageViewController:scrollViewWillEndDragging:withVelocity:", self, v7, x, y);

}

- (BOOL)_listBelowDateTime
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  return (v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 || -[CSMainPageContentViewController _isPortrait](self, "_isPortrait");
}

- (BOOL)_isPortrait
{
  return (unint64_t)(-[CSMainPageContentViewController interfaceOrientation](self, "interfaceOrientation") - 1) < 2;
}

- (void)_addOrRemoveUserPictureViewController
{
  CSUserPictureViewController *v3;
  CSUserPictureViewController *userPictureViewController;
  CSUserPictureViewController *v5;
  CSUserPictureViewController *v6;

  if (+[CSUserPictureViewController isUserPictureSupported](CSUserPictureViewController, "isUserPictureSupported")|| -[CSLockScreenSettings showUserPicture](self->_testSettings, "showUserPicture"))
  {
    if (!self->_userPictureViewController)
    {
      v3 = objc_alloc_init(CSUserPictureViewController);
      userPictureViewController = self->_userPictureViewController;
      self->_userPictureViewController = v3;

      -[CSPresentationViewController presentContentViewController:animated:](self, "presentContentViewController:animated:", self->_userPictureViewController, 0);
    }
  }
  else
  {
    v5 = self->_userPictureViewController;
    if (v5)
    {
      -[CSPresentationViewController dismissContentViewController:animated:](self, "dismissContentViewController:animated:", v5, 0);
      v6 = self->_userPictureViewController;
      self->_userPictureViewController = 0;

    }
  }
}

- (void)_addOrRemoveLogoutButtonViewController
{
  id WeakRetained;
  void *v4;
  char v5;
  CSLogoutButtonViewController *v6;
  CSLogoutButtonViewController *logoutButtonViewController;
  CSLogoutButtonViewController *v8;
  id v9;
  CSLogoutButtonViewController *v10;
  id v11;
  CSLogoutButtonViewController *v12;
  CSLogoutButtonViewController *v13;
  CSLogoutButtonViewController *v14;
  _QWORD v15[5];
  _QWORD v16[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_userSessionController);
  -[CSCoverSheetViewControllerBase activeBehavior](self, "activeBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "areRestrictedCapabilities:", 2048);

  if ((v5 & 1) == 0
    && ((objc_msgSend(WeakRetained, "isLogoutSupported") & 1) != 0
     || -[CSLockScreenSettings showLogoutButton](self->_testSettings, "showLogoutButton")))
  {
    if (!self->_logoutButtonViewController)
    {
      v6 = objc_alloc_init(CSLogoutButtonViewController);
      logoutButtonViewController = self->_logoutButtonViewController;
      self->_logoutButtonViewController = v6;

      -[CSLogoutButtonViewController setUserSessionController:](self->_logoutButtonViewController, "setUserSessionController:", WeakRetained);
      v8 = self->_logoutButtonViewController;
      v9 = objc_loadWeakRetained((id *)&self->_wallpaperColorProvider);
      -[CSLogoutButtonViewController setWallpaperColorProvider:](v8, "setWallpaperColorProvider:", v9);

      v10 = self->_logoutButtonViewController;
      v11 = objc_loadWeakRetained((id *)&self->_wallpaperProvider);
      -[CSLogoutButtonViewController setWallpaperProvider:](v10, "setWallpaperProvider:", v11);

      v12 = self->_logoutButtonViewController;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __73__CSMainPageContentViewController__addOrRemoveLogoutButtonViewController__block_invoke;
      v16[3] = &unk_1E8E2DB60;
      v16[4] = self;
      -[CSMainPageContentViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", v12, 0, v16);
    }
  }
  else
  {
    v13 = self->_logoutButtonViewController;
    if (v13)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __73__CSMainPageContentViewController__addOrRemoveLogoutButtonViewController__block_invoke_2;
      v15[3] = &unk_1E8E2DB60;
      v15[4] = self;
      -[CSMainPageContentViewController bs_removeChildViewController:animated:transitionBlock:](self, "bs_removeChildViewController:animated:transitionBlock:", v13, 0, v15);
      v14 = self->_logoutButtonViewController;
      self->_logoutButtonViewController = 0;

    }
  }

}

void __73__CSMainPageContentViewController__addOrRemoveLogoutButtonViewController__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(void);

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "_mainPageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLogoutButtonView:", v5);

  v6[2]();
}

void __73__CSMainPageContentViewController__addOrRemoveLogoutButtonViewController__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void (**v4)(void);

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "_mainPageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLogoutButtonView:", 0);

  v4[2]();
}

- (void)_addOrRemoveNotificationsListIfNecessaryAnimated:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  CSCombinedListViewController *combinedListViewController;

  -[CSCoverSheetViewControllerBase activeBehavior](self, "activeBehavior", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "notificationBehavior");

  combinedListViewController = self->_combinedListViewController;
  if (v5 == 3)
    -[CSPresentationViewController dismissContentViewController:animated:](self, "dismissContentViewController:animated:", combinedListViewController, 0);
  else
    -[CSPresentationViewController presentContentViewController:animated:](self, "presentContentViewController:animated:", combinedListViewController, 1);
}

- (void)_addOrRemoveViewsAsAppropriate
{
  -[CSMainPageContentViewController _addOrRemoveUserPictureViewController](self, "_addOrRemoveUserPictureViewController");
  -[CSMainPageContentViewController _addOrRemoveLogoutButtonViewController](self, "_addOrRemoveLogoutButtonViewController");
  -[CSMainPageContentViewController _addOrRemoveNotificationsListIfNecessaryAnimated:](self, "_addOrRemoveNotificationsListIfNecessaryAnimated:", 1);
}

+ (double)_phoneListWidth
{
  if (_phoneListWidth_onceToken != -1)
    dispatch_once(&_phoneListWidth_onceToken, &__block_literal_global_57);
  return *(double *)&_phoneListWidth_phoneListWidth;
}

double __50__CSMainPageContentViewController__phoneListWidth__block_invoke()
{
  double result;
  id v1;
  CGRect v2;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_referenceBounds");
  *(double *)&_phoneListWidth_phoneListWidth = CGRectGetWidth(v2) + -16.0;

  return result;
}

- (void)setUseFakeBlur:(BOOL)a3
{
  if (self->_useFakeBlur != a3)
  {
    self->_useFakeBlur = a3;
    -[CSCoverSheetViewControllerBase rebuildAppearance](self, "rebuildAppearance");
  }
}

- (CSCombinedListViewController)combinedListViewController
{
  return self->_combinedListViewController;
}

- (void)setCombinedListViewController:(id)a3
{
  objc_storeStrong((id *)&self->_combinedListViewController, a3);
}

- (CSLayoutStrategy)layoutStrategy
{
  return self->_layoutStrategy;
}

- (CSWallpaperColorProvider)wallpaperColorProvider
{
  return (CSWallpaperColorProvider *)objc_loadWeakRetained((id *)&self->_wallpaperColorProvider);
}

- (BOOL)useFakeBlur
{
  return self->_useFakeBlur;
}

- (CSScrollablePageViewControllerDelegate)delegate
{
  return (CSScrollablePageViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CSUserPresenceMonitor)userPresenceMonitor
{
  return self->_userPresenceMonitor;
}

- (CSMainPageContentViewControllerMediaControlsObserver)mediaControlsObserver
{
  return (CSMainPageContentViewControllerMediaControlsObserver *)objc_loadWeakRetained((id *)&self->_mediaControlsObserver);
}

- (void)setMediaControlsObserver:(id)a3
{
  objc_storeWeak((id *)&self->_mediaControlsObserver, a3);
}

- (CSTouchEnvironmentStatusProviding)touchEnvironmentStatusProvider
{
  return (CSTouchEnvironmentStatusProviding *)objc_loadWeakRetained((id *)&self->_touchEnvironmentStatusProvider);
}

- (void)setTouchEnvironmentStatusProvider:(id)a3
{
  objc_storeWeak((id *)&self->_touchEnvironmentStatusProvider, a3);
}

- (CSUserSessionControlling)userSessionController
{
  return (CSUserSessionControlling *)objc_loadWeakRetained((id *)&self->_userSessionController);
}

- (void)setUserSessionController:(id)a3
{
  objc_storeWeak((id *)&self->_userSessionController, a3);
}

- (CSWallpaperProviding)wallpaperProvider
{
  return (CSWallpaperProviding *)objc_loadWeakRetained((id *)&self->_wallpaperProvider);
}

- (void)setWallpaperProvider:(id)a3
{
  objc_storeWeak((id *)&self->_wallpaperProvider, a3);
}

- (CSMainPageContentViewControllerNotificationObserver)notificationObserver
{
  return (CSMainPageContentViewControllerNotificationObserver *)objc_loadWeakRetained((id *)&self->_notificationObserver);
}

- (void)setNotificationObserver:(id)a3
{
  objc_storeWeak((id *)&self->_notificationObserver, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_notificationObserver);
  objc_destroyWeak((id *)&self->_wallpaperProvider);
  objc_destroyWeak((id *)&self->_userSessionController);
  objc_destroyWeak((id *)&self->_touchEnvironmentStatusProvider);
  objc_destroyWeak((id *)&self->_mediaControlsObserver);
  objc_storeStrong((id *)&self->_userPresenceMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_wallpaperColorProvider);
  objc_storeStrong((id *)&self->_layoutStrategy, 0);
  objc_storeStrong((id *)&self->_inlineContentViewControllerDelegate, 0);
  objc_storeStrong((id *)&self->_inlineContentGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_widgetMetricsProvider, 0);
  objc_storeStrong((id *)&self->_widgetHost, 0);
  objc_storeStrong((id *)&self->_testSettings, 0);
  objc_storeStrong((id *)&self->_authenticationProvider, 0);
  objc_storeStrong((id *)&self->_logoutButtonViewController, 0);
  objc_storeStrong((id *)&self->_userPresenceMontior, 0);
  objc_storeStrong((id *)&self->_combinedListViewController, 0);
  objc_storeStrong((id *)&self->_userPictureViewController, 0);
}

@end

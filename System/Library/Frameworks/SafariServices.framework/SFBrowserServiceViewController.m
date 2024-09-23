@implementation SFBrowserServiceViewController

+ (id)_remoteViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE769F40);
}

+ (id)_exportedInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE756350);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_didFetchCustomActivities_excludedActivityTypes_, 0, 0);

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_requestPrewarmingWithTokens_, 0, 0);

  return v2;
}

+ (id)hostWindowSceneIdentifierForServiceWindowSceneIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id obj;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&hostWindowSceneIdentifierToServiceViewControllerLock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = (id)hostWindowSceneIdentifierToServiceViewController;
  v3 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend((id)hostWindowSceneIdentifierToServiceViewController, "objectForKey:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "window");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "windowScene");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_sceneIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v15);

        if ((v12 & 1) != 0)
        {
          v3 = v6;

          goto LABEL_11;
        }

      }
      v3 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock((os_unfair_lock_t)&hostWindowSceneIdentifierToServiceViewControllerLock);
  return v3;
}

+ (void)setHostWindowSceneIdentifier:(id)a3 forServiceViewController:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&hostWindowSceneIdentifierToServiceViewControllerLock);
  v6 = (void *)hostWindowSceneIdentifierToServiceViewController;
  if (!hostWindowSceneIdentifierToServiceViewController)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)hostWindowSceneIdentifierToServiceViewController;
    hostWindowSceneIdentifierToServiceViewController = v7;

    v6 = (void *)hostWindowSceneIdentifierToServiceViewController;
  }
  objc_msgSend(v6, "setObject:forKey:", v5, v9);
  os_unfair_lock_unlock((os_unfair_lock_t)&hostWindowSceneIdentifierToServiceViewControllerLock);

}

- (void)setConfiguration:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (objc_msgSend(v4, "_isBeingUsedForCellularServiceBootstrap")
    && (-[SFBrowserServiceViewController _hostAuditToken](self, "_hostAuditToken"),
        WBSAuditTokenHasEntitlement()))
  {
    objc_msgSend(v4, "_setEphemeral:", 1);
  }
  else
  {
    objc_msgSend(v4, "set_isBeingUsedForCellularServiceBootstrap:", 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)SFBrowserServiceViewController;
  -[_SFBrowserContentViewController setConfiguration:](&v5, sel_setConfiguration_, v4);

}

- (SFBrowserServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  SFBrowserServiceViewController *v8;
  uint64_t v9;
  NSDate *lastHostApplicationSuspendDate;
  void *v11;
  char v12;
  void *v13;
  SFBrowserServiceViewController *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SFBrowserServiceViewController;
  v8 = -[_SFBrowserContentViewController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, v6, v7);
  if (v8)
  {
    +[SFLocationManager setDefaultEffectiveBundleIdentifier:](SFLocationManager, "setDefaultEffectiveBundleIdentifier:", CFSTR("com.apple.mobilesafari"));
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v9 = objc_claimAutoreleasedReturnValue();
    lastHostApplicationSuspendDate = v8->_lastHostApplicationSuspendDate;
    v8->_lastHostApplicationSuspendDate = (NSDate *)v9;

    v8->_canNotifyHostApplicationOfRedirects = 1;
    -[_SFBrowserContentViewController wkPreferences](v8, "wkPreferences");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[_SFBrowserContentViewController wkPreferences](v8, "wkPreferences");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_setMediaCapabilityGrantsEnabled:", 0);

    }
    v14 = v8;
  }

  return v8;
}

- (void)dealloc
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id WeakRetained;
  objc_super v10;

  -[_SFWebViewUsageMonitor auditUsageIfNeeded](self->_usageMonitor, "auditUsageIfNeeded");
  if (self->_hasConnectedToHostApplication)
  {
    -[SFBrowserServiceViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)allHostAppBundleIDs, "removeObject:", v3);
    updatePowerLogEventForAllHostApps();

    +[SFLocationManager sharedLocationManager](SFLocationManager, "sharedLocationManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFBrowserServiceViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeClientForApplication:", v5);

    v6 = -[SFBrowserServiceViewController _hostProcessIdentifier](self, "_hostProcessIdentifier");
    if (self->_processPool)
    {
      safariViewControllerProcessPoolStorage();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "decrementReferenceForPID:", v6);

    }
    if (self->_persistentDataStore)
    {
      safariViewControllerDataStoreStorage();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "decrementReferenceForPID:", v6);

    }
  }
  -[SFBrowserServiceViewController closeDatabasesOnBackgroundingOrDismissal](self, "closeDatabasesOnBackgroundingOrDismissal");
  -[SFSystemAlert cancel](self->_webAuthenticationDataSharingConfirmation, "cancel");
  -[_SFBrowserContentViewController _invalidateUserActivity](self, "_invalidateUserActivity");
  WeakRetained = objc_loadWeakRetained((id *)&self->_redirectNotificationTimer);
  objc_msgSend(WeakRetained, "invalidate");

  v10.receiver = self;
  v10.super_class = (Class)SFBrowserServiceViewController;
  -[_SFBrowserContentViewController dealloc](&v10, sel_dealloc);
}

- (void)_willAppearInRemoteViewController
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _SFWebViewUsageMonitor *v9;
  _SFWebViewUsageMonitor *usageMonitor;
  void *v11;
  void *v12;
  id v13;
  id v14;

  self->_hasConnectedToHostApplication = 1;
  objc_msgSend(MEMORY[0x1E0DC3658], "sf_safariAccentColor");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[SFBrowserServiceViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v13);

  -[SFBrowserServiceViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)allHostAppBundleIDs;
  v14 = v5;
  if (!allHostAppBundleIDs)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)allHostAppBundleIDs;
    allHostAppBundleIDs = v7;

    v6 = (void *)allHostAppBundleIDs;
    v5 = v14;
  }
  objc_msgSend(v6, "addObject:", v5);
  updatePowerLogEventForAllHostApps();

  if (!self->_usageMonitor)
  {
    v9 = -[_SFWebViewUsageMonitor initWithHostAppIdentifier:]([_SFWebViewUsageMonitor alloc], "initWithHostAppIdentifier:", v14);
    usageMonitor = self->_usageMonitor;
    self->_usageMonitor = v9;

  }
  +[SFLocationManager sharedLocationManager](SFLocationManager, "sharedLocationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBrowserServiceViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addClientForApplication:", v12);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  _SFSafariViewControllerPrewarmingRequestThrottler *prewarmingRequestThrottler;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFBrowserServiceViewController;
  -[_SFBrowserContentViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  if (!-[_SFBrowserContentViewController viewDidAppearInHostApp](self, "viewDidAppearInHostApp"))
    self->_hostApplicationIsForeground = 1;
  -[_SFBrowserContentViewController setViewDidAppearInHostApp:](self, "setViewDidAppearInHostApp:", 1);
  -[SFBrowserServiceViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_rootSheetPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setShouldScaleDownBehindDescendantSheets:", 0);

  -[SFBrowserServiceViewController _updateRemoteSwipeGestureState](self, "_updateRemoteSwipeGestureState");
  prewarmingRequestThrottler = self->_prewarmingRequestThrottler;
  self->_prewarmingRequestThrottler = 0;

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFBrowserServiceViewController;
  -[_SFBrowserContentViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[_SFBrowserContentViewController setViewDidAppearInHostApp:](self, "setViewDidAppearInHostApp:", 0);
}

- (void)setDisplayMode:(int64_t)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFBrowserServiceViewController;
  -[_SFBrowserContentViewController setDisplayMode:](&v7, sel_setDisplayMode_);
  if (a3 == 1)
  {
    -[_SFBrowserContentViewController browserView](self, "browserView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "previewHeader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", self);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFBrowserServiceViewController;
  -[SFBrowserServiceViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  if (!-[_SFWebViewUsageMonitor userInteracted](self->_usageMonitor, "userInteracted"))
  {
    -[_SFBrowserContentViewController browserView](self, "browserView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFWebViewUsageMonitor setUserInteracted:](self->_usageMonitor, "setUserInteracted:", objc_msgSend(v4, "hasReceivedTouchEvents"));

  }
  -[SFBrowserServiceViewController closeDatabasesOnBackgroundingOrDismissal](self, "closeDatabasesOnBackgroundingOrDismissal");
  -[_SFBrowserContentViewController webViewController](self, "webViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "webView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sf_saveUnsubmittedGeneratedPasswordAndRemoveFormMetadata");

}

- (void)setPreferredBarTintColor:(id)a3 controlTintColor:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  -[_SFBrowserContentViewController setPreferredBarTintColor:](self, "setPreferredBarTintColor:", v7);
  -[_SFBrowserContentViewController setPreferredControlTintColor:](self, "setPreferredControlTintColor:", v6);

}

- (id)processPoolConfiguration
{
  void *v3;
  void *v4;
  _OWORD v6[4];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFBrowserServiceViewController;
  -[_SFBrowserContentViewController processPoolConfiguration](&v7, sel_processPoolConfiguration);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_msgSend(v4, "setPresentingApplicationPID:", -[SFBrowserServiceViewController _hostProcessIdentifier](self, "_hostProcessIdentifier"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SFBrowserServiceViewController _hostAuditToken](self, "_hostAuditToken");
    v6[0] = v6[2];
    v6[1] = v6[3];
    objc_msgSend(v4, "setPresentingApplicationProcessToken:", v6);
  }
  return v4;
}

- (void)updateScrollViewIndicatorVerticalInsets:(UIEdgeInsets)a3 horizontalInsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v8 = a3.right;
  v9 = a3.bottom;
  v10 = a3.left;
  v11 = a3.top;
  v15[3] = *MEMORY[0x1E0C80C00];
  if ((_SFInsetIsInvalid() & 1) != 0 || _SFInsetIsInvalid())
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXViewService();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      -[SFBrowserServiceViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFBrowserServiceViewController updateScrollViewIndicatorVerticalInsets:horizontalInsets:].cold.1(v14, (uint64_t)v15);
    }

  }
  else
  {
    -[_SFBrowserContentViewController _updateScrollIndicatorVerticalInsets:horizontalInsets:](self, "_updateScrollIndicatorVerticalInsets:horizontalInsets:", v11, v10, v9, v8, top, left, bottom, right);
  }
}

- (id)processPool
{
  WKProcessPool *processPool;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  WKProcessPool **p_processPool;
  WKProcessPool *v10;
  _QWORD v12[5];
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  processPool = self->_processPool;
  if (!processPool)
  {
    v4 = -[SFBrowserServiceViewController _hostProcessIdentifier](self, "_hostProcessIdentifier");
    if (!(_DWORD)v4 && objc_msgSend(MEMORY[0x1E0D8A8F8], "hasInternalContent"))
    {
      v5 = (id)WBS_LOG_CHANNEL_PREFIXViewService();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        v6 = objc_opt_class();
        -[SFBrowserServiceViewController processPool].cold.1(v6, v13, v5);
      }

    }
    safariViewControllerProcessPoolStorage();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__SFBrowserServiceViewController_processPool__block_invoke;
    v12[3] = &unk_1E4AC3050;
    v12[4] = self;
    objc_msgSend(v7, "incrementReferenceForPID:valueCreationBlock:", v4, v12);
    v8 = objc_claimAutoreleasedReturnValue();
    p_processPool = &self->_processPool;
    v10 = *p_processPool;
    *p_processPool = (WKProcessPool *)v8;

    processPool = *p_processPool;
  }
  return processPool;
}

id __45__SFBrowserServiceViewController_processPool__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newProcessPool");
}

- (void)loadURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSUInteger v7;
  uint64_t v8;
  void *v9;
  NSDictionary *additionalHeaderFieldsForInitialRequest;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id location;
  _QWORD v19[4];
  id v20;
  _BYTE v21[32];

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C925E8];
  -[SFBrowserServiceViewController _hostAuditToken](self, "_hostAuditToken");
  objc_msgSend(v5, "handleSSOExtensionIdentifier:", v21);
  -[_SFWebViewUsageMonitor checkURL:](self->_usageMonitor, "checkURL:", v4);
  objc_msgSend(MEMORY[0x1E0C92C80], "safari_nonAppInitiatedRequestWithURL:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = -[NSDictionary count](self->_additionalHeaderFieldsForInitialRequest, "count");
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    v9 = (void *)objc_msgSend(v6, "mutableCopy");

    additionalHeaderFieldsForInitialRequest = self->_additionalHeaderFieldsForInitialRequest;
    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = __42__SFBrowserServiceViewController_loadURL___block_invoke;
    v19[3] = &unk_1E4AC3078;
    v6 = v9;
    v20 = v6;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](additionalHeaderFieldsForInitialRequest, "enumerateKeysAndObjectsUsingBlock:", v19);

  }
  -[_SFBrowserContentViewController loadRequest:](self, "loadRequest:", v6);
  -[_SFBrowserContentViewController configuration](self, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "_redirectNotificationBehavior");

  if (v12 == 1)
  {
    objc_initWeak(&location, self);
    v13 = (void *)MEMORY[0x1E0C99E88];
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __42__SFBrowserServiceViewController_loadURL___block_invoke_2;
    v16[3] = &unk_1E4AC30A0;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v13, "timerWithTimeInterval:repeats:block:", 0, v16, 10.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTolerance:", 1.0);
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addTimer:forMode:", v14, *MEMORY[0x1E0C99860]);

    objc_storeWeak((id *)&self->_redirectNotificationTimer, v14);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

uint64_t __42__SFBrowserServiceViewController_loadURL___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

void __42__SFBrowserServiceViewController_loadURL___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    WeakRetained[2001] = 1;

}

- (BOOL)_shouldAcceptMessage:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "originIdentifier") != 0xC181BADB23D8497BLL)
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXEventAttribution();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SFBrowserServiceViewController _shouldAcceptMessage:].cold.3((uint64_t)v12, objc_msgSend(v3, "originIdentifier"), v8);

    goto LABEL_12;
  }
  v4 = objc_msgSend(v3, "timestamp");
  if (v4 <= -[SFBrowserServiceViewController _shouldAcceptMessage:]::lastSeenBackBoardTimestamp)
  {
    v9 = WBS_LOG_CHANNEL_PREFIXEventAttribution();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SFBrowserServiceViewController _shouldAcceptMessage:].cold.2();
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0D00CC8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "authenticateMessage:", v3);

  if ((v6 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    v10 = WBS_LOG_CHANNEL_PREFIXEventAttribution();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SFBrowserServiceViewController _shouldAcceptMessage:].cold.1();
LABEL_12:
    v7 = 0;
    goto LABEL_13;
  }
  -[SFBrowserServiceViewController _shouldAcceptMessage:]::lastSeenBackBoardTimestamp = v4;
  v7 = 1;
LABEL_13:

  return v7;
}

- (id)_trustedReportEndpoint
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v14;
  _BYTE v15[32];
  _BYTE v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CA5898];
  -[SFBrowserServiceViewController _hostAuditToken](self, "_hostAuditToken");
  v14 = 0;
  objc_msgSend(v2, "bundleRecordForAuditToken:error:", v15, &v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v14;
  v5 = v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (v6)
  {
    objc_msgSend(v3, "infoDictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:ofClass:](v7, "objectForKey:ofClass:", CFSTR("NSAdvertisingAttributionReportEndpoint"), objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "safari_isHTTPSURL") & 1) != 0)
    {
      v9 = v11;
    }
    else
    {
      v12 = WBS_LOG_CHANNEL_PREFIXEventAttribution();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SFBrowserServiceViewController _trustedReportEndpoint].cold.2();
      v9 = 0;
    }

  }
  else
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXEventAttribution();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFBrowserServiceViewController _trustedReportEndpoint].cold.1(v8, (uint64_t)v16);
    }
    v9 = 0;
  }

  return v9;
}

- (void)addClickAttribution:(id)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "eventMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SFBrowserServiceViewController _shouldAcceptMessage:](self, "_shouldAcceptMessage:", v4);

  if (v5)
  {
    -[SFBrowserServiceViewController _trustedReportEndpoint](self, "_trustedReportEndpoint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v9, "clickAttributionWithReportEndpoint:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC37A8]), "initWithUISClickAttribution:", v7);
      -[_SFBrowserContentViewController addTrustedEventAttribution:](self, "addTrustedEventAttribution:", v8);

    }
  }

}

- (void)decideCookieSharingForURL:(id)a3 callback:(id)a4 proxiedAssociatedDomains:(id)a5
{
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  SFSystemAlert *v23;
  SFSystemAlert *webAuthenticationDataSharingConfirmation;
  SFSystemAlert *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  id v41;
  id v42;
  _QWORD v43[4];
  void (**v44)(_QWORD, _QWORD);
  _QWORD v45[4];
  id v46;
  id v47;
  _BYTE v48[32];
  id location;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v8 = a4;
  v41 = a5;
  objc_initWeak(&location, self);
  if (objc_msgSend(v8, "callbackType") != 1)
  {
LABEL_6:
    -[SFBrowserServiceViewController set_isUsedForAuthentication:](self, "set_isUsedForAuthentication:", 1);
    -[SFBrowserServiceViewController setHostApplicationCallback:](self, "setHostApplicationCallback:", v8);
    -[_SFBrowserContentViewController setStoreBannersAreDisabled:](self, "setStoreBannersAreDisabled:", 1);
    v13 = MEMORY[0x1E0C809B0];
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __94__SFBrowserServiceViewController_decideCookieSharingForURL_callback_proxiedAssociatedDomains___block_invoke;
    v45[3] = &unk_1E4AC30C8;
    objc_copyWeak(&v47, &location);
    v14 = v42;
    v46 = v14;
    v15 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A8598C40](v45);
    if (-[SFBrowserServiceViewController _isUsedForAuthentication](self, "_isUsedForAuthentication"))
    {
      -[_SFBrowserContentViewController configuration](self, "configuration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "_storageModeForAuthenticationSession");

      if (v17 == 1)
      {
        v18 = 3;
        goto LABEL_22;
      }
      if (v17 == 2)
      {
        v18 = 1;
LABEL_22:
        v15[2](v15, v18);
LABEL_23:

        objc_destroyWeak(&v47);
        goto LABEL_24;
      }
    }
    -[SFBrowserServiceViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0D4ED88];
    objc_msgSend(v14, "safari_highLevelDomain");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (!v21)
    {
      objc_msgSend(v14, "host");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "webAuthenticationAlertForDomain:appBundleID:", v22, v19);
    v23 = (SFSystemAlert *)objc_claimAutoreleasedReturnValue();
    webAuthenticationDataSharingConfirmation = self->_webAuthenticationDataSharingConfirmation;
    self->_webAuthenticationDataSharingConfirmation = v23;

    if (!v21)
    v25 = self->_webAuthenticationDataSharingConfirmation;
    v43[0] = v13;
    v43[1] = 3221225472;
    v43[2] = __94__SFBrowserServiceViewController_decideCookieSharingForURL_callback_proxiedAssociatedDomains___block_invoke_2;
    v43[3] = &unk_1E4AC30F0;
    v44 = v15;
    -[SFSystemAlert scheduleWithCompletionBlock:](v25, "scheduleWithCompletionBlock:", v43);

    goto LABEL_23;
  }
  if (objc_msgSend(v41, "count"))
  {
    -[SFBrowserServiceViewController _hostAuditToken](self, "_hostAuditToken");
    if ((WBSAuditTokenHasEntitlement() & 1) == 0)
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v52 = *MEMORY[0x1E0CB2D68];
      v53[0] = CFSTR("Process is not entitled to perform proxied requests.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C92598], 1, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = WBS_LOG_CHANNEL_PREFIXAuthenticationSession();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[SFBrowserServiceViewController decideCookieSharingForURL:callback:proxiedAssociatedDomains:].cold.1();
      -[SFBrowserServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "didDecideCookieSharingForURL:shouldCancel:withError:", v42, 1, v28);

      goto LABEL_24;
    }
    objc_msgSend(v8, "host");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v41, "containsObject:", v9);

    if ((v10 & 1) != 0)
      goto LABEL_6;
  }
  v11 = (void *)MEMORY[0x1E0CB3B38];
  -[SFBrowserServiceViewController _hostAuditToken](self, "_hostAuditToken");
  objc_msgSend(v8, "host");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_msgSend(v11, "safari_applicationWithAuditToken:hasApprovedWebCredentialsDomainAssociationForDomain:", v48, v12);

  if ((v11 & 1) != 0)
    goto LABEL_6;
  v31 = (void *)MEMORY[0x1E0CB35C8];
  v50 = *MEMORY[0x1E0CB2D68];
  v32 = (void *)MEMORY[0x1E0CB3940];
  -[SFBrowserServiceViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "host");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "host");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v36;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C92598], 1, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = WBS_LOG_CHANNEL_PREFIXAuthenticationSession();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    -[SFBrowserServiceViewController decideCookieSharingForURL:callback:proxiedAssociatedDomains:].cold.1();
  -[SFBrowserServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "didDecideCookieSharingForURL:shouldCancel:withError:", v42, 1, v38);

LABEL_24:
  objc_destroyWeak(&location);

}

void __94__SFBrowserServiceViewController_decideCookieSharingForURL_callback_proxiedAssociatedDomains___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "setWebAuthenticationDataSharingConfirmation:", 0);
    if (a2 != 2)
    {
      v5 = 3;
      if (a2 == 3)
        v5 = 4;
      if (a2 == 1)
        v6 = 2;
      else
        v6 = v5;
      objc_msgSend(v8, "setSafariDataSharingMode:", v6);
    }
    objc_msgSend(v8, "_remoteViewControllerProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didDecideCookieSharingForURL:shouldCancel:withError:", *(_QWORD *)(a1 + 32), a2 == 2, 0);

    WeakRetained = v8;
  }

}

uint64_t __94__SFBrowserServiceViewController_decideCookieSharingForURL_callback_proxiedAssociatedDomains___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startResolveRedirectionForURL:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;

  v4 = a3;
  -[_SFBrowserContentViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_isEphemeral");

  if ((v6 & 1) != 0)
  {
    -[_SFBrowserContentViewController setSafariDataSharingMode:](self, "setSafariDataSharingMode:", 4);
    -[_SFBrowserContentViewController _setUpWebViewControllerIfNeeded](self, "_setUpWebViewControllerIfNeeded");
    -[SFBrowserServiceViewController loadURL:](self, "loadURL:", v4);
  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXSVCPrivacy();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SFBrowserServiceViewController startResolveRedirectionForURL:].cold.1();
    -[SFBrowserServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didResolveRedirectionWithURL:appLink:", v4, 0);

  }
}

- (void)prepareForDisplayWithCompletionHandler:(id)a3
{
  void *v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  -[_SFBrowserContentViewController browserView](self, "browserView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentReadyForDisplay");

  v5[2]();
}

- (void)requestPrewarmingWithTokens:(id)a3
{
  id v4;
  _SFSafariViewControllerPrewarmingRequestThrottler *v5;
  _SFSafariViewControllerPrewarmingRequestThrottler *prewarmingRequestThrottler;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[4];
  id v16;
  id location;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_prewarmingRequestThrottler)
  {
    objc_initWeak(&location, self);
    v5 = objc_alloc_init(_SFSafariViewControllerPrewarmingRequestThrottler);
    prewarmingRequestThrottler = self->_prewarmingRequestThrottler;
    self->_prewarmingRequestThrottler = v5;

    -[_SFSafariViewControllerPrewarmingRequestThrottler setMinimumRequestDelay:](self->_prewarmingRequestThrottler, "setMinimumRequestDelay:", 2.0);
    -[_SFSafariViewControllerPrewarmingRequestThrottler setMaximumValidConnectionCount:](self->_prewarmingRequestThrottler, "setMaximumValidConnectionCount:", 20);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __62__SFBrowserServiceViewController_requestPrewarmingWithTokens___block_invoke;
    v15[3] = &unk_1E4AC3118;
    objc_copyWeak(&v16, &location);
    -[_SFSafariViewControllerPrewarmingRequestThrottler setConnectionHandler:](self->_prewarmingRequestThrottler, "setConnectionHandler:", v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        -[_SFSafariViewControllerPrewarmingRequestThrottler requestToken:](self->_prewarmingRequestThrottler, "requestToken:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v18, 16);
    }
    while (v8);
  }

}

void __62__SFBrowserServiceViewController_requestPrewarmingWithTokens___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_prewarmConnectionsToURLs:", v3);

}

- (void)invalidatePrewarmingTokenWithID:(unint64_t)a3
{
  -[_SFSafariViewControllerPrewarmingRequestThrottler invalidateTokenWithID:](self->_prewarmingRequestThrottler, "invalidateTokenWithID:", a3);
}

- (void)_prewarmConnectionsToURLs:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  SFBrowserServiceViewController *v7;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __60__SFBrowserServiceViewController__prewarmConnectionsToURLs___block_invoke;
    v5[3] = &unk_1E4AC0590;
    v6 = v4;
    v7 = self;
    -[_SFBrowserContentViewController decideDataSharingModeAndSetUpWebViewWithCompletionHandler:](self, "decideDataSharingModeAndSetUpWebViewWithCompletionHandler:", v5);

  }
}

void __60__SFBrowserServiceViewController__prewarmConnectionsToURLs___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t v13[128];
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = WBS_LOG_CHANNEL_PREFIXPrewarming();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138739971;
    v15 = v3;
    _os_log_impl(&dword_1A3B2D000, v2, OS_LOG_TYPE_INFO, "Prewarming connections to %{sensitive}@", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "_preconnectToServer:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)clearWebsiteDataWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v4 = (void (**)(_QWORD))a3;
  if (!-[_SFBrowserContentViewController safariDataSharingMode](self, "safariDataSharingMode"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__SFBrowserServiceViewController_clearWebsiteDataWithCompletionHandler___block_invoke;
    v9[3] = &unk_1E4AC2E10;
    v9[4] = self;
    -[SFBrowserServiceViewController _getSafariDataSharingModeWithCompletion:](self, "_getSafariDataSharingModeWithCompletion:", v9);
  }
  if (-[_SFBrowserContentViewController safariDataSharingMode](self, "safariDataSharingMode") == 1
    || -[_SFBrowserContentViewController safariDataSharingMode](self, "safariDataSharingMode") == 3)
  {
    v4[2](v4);
  }
  else
  {
    -[SFBrowserServiceViewController websiteDataStoreConfiguration](self, "websiteDataStoreConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CEF650], "safari_dataStoreWithConfiguration:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEF650], "safari_allDataTypes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeDataOfTypes:modifiedSince:completionHandler:", v7, v8, v4);

    }
    else
    {
      v4[2](v4);
    }

  }
}

uint64_t __72__SFBrowserServiceViewController_clearWebsiteDataWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSafariDataSharingMode:", a2);
}

- (void)setHostWindowSceneIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "setHostWindowSceneIdentifier:forServiceViewController:", v4, self);

}

- (void)setAdditionalHeaderFieldsForInitialLoad:(id)a3
{
  NSDictionary *v4;
  NSDictionary *additionalHeaderFieldsForInitialRequest;
  id v6;

  v6 = a3;
  v4 = (NSDictionary *)objc_msgSend(v6, "copy");
  additionalHeaderFieldsForInitialRequest = self->_additionalHeaderFieldsForInitialRequest;
  self->_additionalHeaderFieldsForInitialRequest = v4;

}

- (void)_didResolveDestinationURL:(id)a3 pendingAppLinkCheck:(BOOL)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  -[_SFBrowserContentViewController configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_isEphemeral");

  if ((v8 & 1) != 0
    && !-[_SFBrowserContentViewController viewDidAppearInHostApp](self, "viewDidAppearInHostApp")
    && !-[_SFBrowserContentViewController isShowingErrorPage](self, "isShowingErrorPage"))
  {
    if (a4)
    {
      v9 = (void *)MEMORY[0x1E0CA5838];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __80__SFBrowserServiceViewController__didResolveDestinationURL_pendingAppLinkCheck___block_invoke;
      v11[3] = &unk_1E4AC3168;
      v11[4] = self;
      v12 = v6;
      objc_msgSend(v9, "getAppLinkWithURL:completionHandler:", v12, v11);

    }
    else
    {
      -[SFBrowserServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "didResolveRedirectionWithURL:appLink:", v6, 0);

    }
  }

}

void __80__SFBrowserServiceViewController__didResolveDestinationURL_pendingAppLinkCheck___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__SFBrowserServiceViewController__didResolveDestinationURL_pendingAppLinkCheck___block_invoke_2;
  block[3] = &unk_1E4AC3140;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __80__SFBrowserServiceViewController__didResolveDestinationURL_pendingAppLinkCheck___block_invoke_2(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "_remoteViewControllerProxy");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "didResolveRedirectionWithURL:appLink:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

  }
}

- (void)openCurrentURLInSafariFromPreviewAction
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SFBrowserServiceViewController;
  -[_SFBrowserContentViewController _openCurrentURLInSafari](&v2, sel__openCurrentURLInSafari);
}

- (void)_openCurrentURLInSafari
{
  void *v3;
  objc_super v4;

  -[SFBrowserServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "willOpenCurrentPageInBrowser");

  v4.receiver = self;
  v4.super_class = (Class)SFBrowserServiceViewController;
  -[_SFBrowserContentViewController _openCurrentURLInSafari](&v4, sel__openCurrentURLInSafari);
}

- (id)_safariWebDataStoreRootURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E98];
  _SFSafariContainerPath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("/Library"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByResolvingSymlinksInPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_sharedWebDataStoreRootURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[_SFSafariDataSharingController sharedController](_SFSafariDataSharingController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBrowserServiceViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemDataContainerURLWithAppBundleID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("/Library"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_webDataStoreRootURL
{
  void *v3;

  if (-[_SFBrowserContentViewController safariDataSharingMode](self, "safariDataSharingMode") == 3
    || -[_SFBrowserContentViewController safariDataSharingMode](self, "safariDataSharingMode") == 1)
  {
    -[SFBrowserServiceViewController _safariWebDataStoreRootURL](self, "_safariWebDataStoreRootURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[_SFBrowserContentViewController safariDataSharingMode](self, "safariDataSharingMode") == 2)
  {
    -[SFBrowserServiceViewController _sharedWebDataStoreRootURL](self, "_sharedWebDataStoreRootURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_websiteDataStoreURL
{
  void *v2;
  void *v3;

  -[SFBrowserServiceViewController _webDataStoreRootURL](self, "_webDataStoreRootURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("/WebKit/WebsiteData/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_cookieStoreURL
{
  void *v2;
  void *v3;

  -[SFBrowserServiceViewController _webDataStoreRootURL](self, "_webDataStoreRootURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("/Cookies/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_ensureWebsiteDataStoreURL:(id)a3 cookieStoreURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  char v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v22;
  id v23;
  _BYTE v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

    if ((v11 & 1) == 0)
    {
      v23 = 0;
      v12 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v23);
      v13 = v23;
      v14 = v13;
      if ((v12 & 1) == 0)
      {
        v18 = (id)WBS_LOG_CHANNEL_PREFIXViewService();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v14, "safari_privacyPreservingDescription");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFBrowserServiceViewController _ensureWebsiteDataStoreURL:cookieStoreURL:].cold.2((uint64_t)v5, v19, (uint64_t)v24);
        }
        goto LABEL_14;
      }

    }
    objc_msgSend(v7, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v9, "fileExistsAtPath:", v15);

    if ((v16 & 1) != 0)
    {
      v8 = 1;
LABEL_16:

      goto LABEL_17;
    }
    v22 = 0;
    v17 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v22);
    v14 = v22;
    if ((v17 & 1) != 0)
    {
      v8 = 1;
LABEL_15:

      goto LABEL_16;
    }
    v18 = (id)WBS_LOG_CHANNEL_PREFIXViewService();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "safari_privacyPreservingDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFBrowserServiceViewController _ensureWebsiteDataStoreURL:cookieStoreURL:].cold.1((uint64_t)v7, v20, (uint64_t)v24);
    }
LABEL_14:

    v8 = 0;
    goto LABEL_15;
  }
LABEL_17:

  return v8;
}

- (id)websiteDataStoreConfiguration
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
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
  id v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CEF738]);
  -[SFBrowserServiceViewController _webDataStoreRootURL](self, "_webDataStoreRootURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBrowserServiceViewController _websiteDataStoreURL](self, "_websiteDataStoreURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBrowserServiceViewController _cookieStoreURL](self, "_cookieStoreURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SFBrowserServiceViewController _ensureWebsiteDataStoreURL:cookieStoreURL:](self, "_ensureWebsiteDataStoreURL:cookieStoreURL:", v5, v6))
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXSVCPrivacy();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[SFBrowserServiceViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v8;
      v22 = 2114;
      v23 = v4;
      _os_log_impl(&dword_1A3B2D000, v7, OS_LOG_TYPE_DEFAULT, "Data Store URL for app %{public}@ is %{public}@.", (uint8_t *)&v20, 0x16u);

    }
    v9 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v6, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("/Cookies.binarycookies"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileURLWithPath:isDirectory:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setCookieStorageFile:", v12);

    objc_msgSend(v3, "_setWebStorageDirectory:", v5);
    objc_msgSend(v3, "_setWebSQLDatabaseDirectory:", v5);
    objc_msgSend(v3, "_setResourceLoadStatisticsDirectory:", v5);
    objc_msgSend(v3, "_setIndexedDBDatabaseDirectory:", v5);
    objc_msgSend(v3, "_setCacheStorageDirectory:", v5);
    objc_msgSend(v3, "_setServiceWorkerRegistrationDirectory:", v5);
    objc_msgSend(v3, "setSourceApplicationBundleIdentifier:", CFSTR("com.apple.mobilesafari"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "setAlternativeServicesStorageDirectory:", v5);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "setHSTSStorageDirectory:", v5);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("Default"), 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setGeneralStorageDirectory:", v13);

    }
    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("NetworkCache"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNetworkCacheDirectory:", v14);

    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("OfflineWebApplicationCache"), 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setApplicationCacheDirectory:", v15);

    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("MediaCache"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMediaCacheDirectory:", v16);

    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("MediaKeys"), 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMediaKeysStorageDirectory:", v17);

    v18 = v3;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)_createPersistentDataStoreWithConfiguration:(id)a3
{
  id v4;
  WKWebsiteDataStore *persistentDataStore;
  WKWebsiteDataStore *v6;
  uint64_t v7;
  void *v8;
  WKWebsiteDataStore *v9;
  WKWebsiteDataStore *v10;
  _QWORD v12[4];
  id v13;
  SFBrowserServiceViewController *v14;

  v4 = a3;
  persistentDataStore = self->_persistentDataStore;
  if (persistentDataStore)
  {
    v6 = persistentDataStore;
  }
  else
  {
    v7 = -[SFBrowserServiceViewController _hostProcessIdentifier](self, "_hostProcessIdentifier");
    safariViewControllerDataStoreStorage();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __78__SFBrowserServiceViewController__createPersistentDataStoreWithConfiguration___block_invoke;
    v12[3] = &unk_1E4AC3190;
    v13 = v4;
    v14 = self;
    objc_msgSend(v8, "incrementReferenceForPID:additionalKey:valueCreationBlock:", v7, 0, v12);
    v9 = (WKWebsiteDataStore *)objc_claimAutoreleasedReturnValue();
    v10 = self->_persistentDataStore;
    self->_persistentDataStore = v9;

    v6 = self->_persistentDataStore;
  }

  return v6;
}

id __78__SFBrowserServiceViewController__createPersistentDataStoreWithConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)SFBrowserServiceViewController;
  objc_msgSendSuper2(&v3, sel__createPersistentDataStoreWithConfiguration_, v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_getSafariDataSharingModeWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  -[_SFBrowserContentViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_isEphemeral");

  if (!v6)
  {
    -[SFBrowserServiceViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "hasPrefix:", CFSTR("com.apple.")) & 1) != 0
      || (objc_msgSend(v8, "dataContainerURL"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (!-[SFBrowserServiceViewController _isUsedForAuthentication](self, "_isUsedForAuthentication"))
      {
        v12 = WBS_LOG_CHANNEL_PREFIXViewService();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = 138543362;
          v14 = v7;
          _os_log_impl(&dword_1A3B2D000, v12, OS_LOG_TYPE_DEFAULT, "SFSafariViewController is used by system app %{public}@, which may not have data container", (uint8_t *)&v13, 0xCu);
        }
        v11 = 1;
        goto LABEL_11;
      }
    }
    else
    {

    }
    +[_SFSafariDataSharingController sharedController](_SFSafariDataSharingController, "sharedController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "checkInAppBundleIDIfNeeded:", v7);

    v11 = 2;
LABEL_11:
    v4[2](v4, v11);

    goto LABEL_12;
  }
  v4[2](v4, 4);
LABEL_12:

}

- (void)didFetchCustomActivities:(id)a3 excludedActivityTypes:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SFHostApplicationCustomActivity *v12;
  _SFAddBookmarkActivity *v13;
  _SFFindOnPageUIActivity *v14;
  void *v15;
  _SFFindOnPageUIActivity *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  id activityViewControllerInfoFetchCompletionHandler;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v6 = a4;
  if (self->_activityViewControllerInfoFetchCompletionHandler)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v19;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v21;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v8);
          v12 = -[SFHostApplicationCustomActivity initWithActivityProxy:]([SFHostApplicationCustomActivity alloc], "initWithActivityProxy:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11));
          -[_SFActivity setDelegate:](v12, "setDelegate:", self);
          objc_msgSend(v7, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }

    if (!-[SFBrowserServiceViewController _isUsedForAuthentication](self, "_isUsedForAuthentication"))
    {
      v13 = objc_alloc_init(_SFAddBookmarkActivity);
      -[_SFActivity setDelegate:](v13, "setDelegate:", self);
      objc_msgSend(v7, "addObject:", v13);

    }
    v14 = [_SFFindOnPageUIActivity alloc];
    -[_SFBrowserContentViewController activeWebView](self, "activeWebView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[_SFFindOnPageUIActivity initWithWebView:](v14, "initWithWebView:", v15);
    objc_msgSend(v7, "addObject:", v16);

    v17 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8598C40](self->_activityViewControllerInfoFetchCompletionHandler);
    activityViewControllerInfoFetchCompletionHandler = self->_activityViewControllerInfoFetchCompletionHandler;
    self->_activityViewControllerInfoFetchCompletionHandler = 0;

    ((void (**)(_QWORD, void *, id))v17)[2](v17, v7, v6);
  }

}

- (void)_fetchActivityViewControllerInfoForURL:(id)a3 title:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id activityViewControllerInfoFetchCompletionHandler;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(v9, "copy");
  activityViewControllerInfoFetchCompletionHandler = self->_activityViewControllerInfoFetchCompletionHandler;
  self->_activityViewControllerInfoFetchCompletionHandler = v10;

  -[SFBrowserServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchActivityViewControllerInfoForURL:title:", v13, v8);

}

- (void)repostNotificationInViewService:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DC4868]))
    -[_SFBrowserContentViewController setViewDidAppearInHostApp:](self, "setViewDidAppearInHostApp:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", v6, v5);

}

- (void)setIsRunningTransitionAnimation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[_SFWebViewUsageMonitor setUserInteracted:](self->_usageMonitor, "setUserInteracted:", 1);
  -[SFBrowserServiceViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", !v3);

}

- (void)setDismissButtonStyle:(int64_t)a3
{
  id v4;

  -[_SFBrowserContentViewController browserView](self, "browserView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateDismissButtonStyle:", a3);

}

- (void)didDetectRemoteViewControllerViewIsHidden
{
  -[_SFWebViewUsageMonitor setViewControllerViewIsHidden:](self->_usageMonitor, "setViewControllerViewIsHidden:", 1);
}

- (void)didDetectUserInteractionFromHostApp
{
  -[_SFWebViewUsageMonitor setUserInteracted:](self->_usageMonitor, "setUserInteracted:", 1);
}

- (void)didRequestShowLinkPreviews:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  id v10;

  v3 = a3;
  -[_SFBrowserContentViewController browserView](self, "browserView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "previewHeader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLinkPreviewEnabled:", v3);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (const __CFString *)*MEMORY[0x1E0C9B228];
  v10 = v6;
  CFPreferencesSetAppValue((CFStringRef)*MEMORY[0x1E0D4F698], v6, (CFStringRef)*MEMORY[0x1E0C9B228]);
  CFPreferencesAppSynchronize(v7);
  -[SFBrowserServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didDecideShouldShowLinkPreviews:", v3);

}

- (void)_dismiss
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "nil SFRemoteViewControllerProtocol", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_updateRemoteSwipeGestureState
{
  id v3;

  -[SFBrowserServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteSwipeGestureEnabled:", -[_SFBrowserContentViewController remoteSwipeGestureEnabled](self, "remoteSwipeGestureEnabled"));

}

- (BOOL)_notifyInitialLoadDidFinish:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v8;

  v3 = a3;
  -[_SFBrowserContentViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_redirectNotificationBehavior");

  if (!v6 && v3 && self->_isExpectingClientRedirect)
    return 0;
  -[SFBrowserServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didFinishInitialLoad:", v3);

  return 1;
}

- (BOOL)_redirectToHostAppForAuthenticationSession:(id)a3
{
  id v4;
  char v5;
  NSObject *v6;
  void *v7;
  ASWebAuthenticationSessionCallback *hostApplicationCallback;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  ASWebAuthenticationSessionCallback *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ASWebAuthenticationSessionCallback matchesURL:](self->_hostApplicationCallback, "matchesURL:", v4);
  if ((v5 & 1) != 0)
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXSVCPrivacy();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[SFBrowserServiceViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      hostApplicationCallback = self->_hostApplicationCallback;
      v11 = 138543618;
      v12 = v7;
      v13 = 2114;
      v14 = hostApplicationCallback;
      _os_log_impl(&dword_1A3B2D000, v6, OS_LOG_TYPE_DEFAULT, "Application %{public}@ is able to handle %{public}@ for authentication", (uint8_t *)&v11, 0x16u);

    }
    -[SFBrowserServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "willOpenURLInHostApplication:", v4);

  }
  return v5;
}

- (BOOL)_redirectToHostAppWithNavigationResult:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  void *v9;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C925E8], "resetSSOExtensionIdentifier");
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SFBrowserServiceViewController _redirectToHostAppForAuthenticationSession:](self, "_redirectToHostAppForAuthenticationSession:", v6);

  if (v7)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v5, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SFBrowserServiceViewController _willURLOpenHostApp:](self, "_willURLOpenHostApp:", v9);

  }
  return v8;
}

- (BOOL)_willURLOpenHostApp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  BOOL v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationsAvailableForOpeningURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    -[SFBrowserServiceViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "bundleIdentifier", (_QWORD)v17);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v7);

          if (v13)
          {
            -[SFBrowserServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "willOpenURLInHostApplication:", v4);

            v14 = 1;
            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          continue;
        break;
      }
    }
    v14 = 0;
LABEL_12:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_didLoadWebView
{
  id v2;

  -[SFBrowserServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didLoadWebView");

}

- (void)_hostApplicationWillEnterForeground
{
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_6_0((uint64_t)a1, a2, 5.8381e-34);
  OUTLINED_FUNCTION_1_2(&dword_1A3B2D000, v3, (uint64_t)v3, "Failed to set PID to hinerit application state from: %{public}@", v4);

  OUTLINED_FUNCTION_3_0();
}

- (void)_hostApplicationDidEnterBackground
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSDate *v6;
  NSDate *lastHostApplicationSuspendDate;
  _QWORD v8[5];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  self->_hostApplicationIsForeground = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v4 = (void *)*MEMORY[0x1E0DC4730];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__SFBrowserServiceViewController__hostApplicationDidEnterBackground__block_invoke;
  v9[3] = &unk_1E4ABFDC0;
  v9[4] = &v10;
  v5 = objc_msgSend(v4, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("com.apple.SafariViewService.stopCountingUsageTimeForBackgroundedApp"), v9);
  v11[3] = v5;
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __68__SFBrowserServiceViewController__hostApplicationDidEnterBackground__block_invoke_2;
  v8[3] = &unk_1E4ABFDC0;
  v8[4] = &v10;
  -[_SFBrowserContentViewController stopDigitalHealthTrackingWithCompletionHandler:](self, "stopDigitalHealthTrackingWithCompletionHandler:", v8);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastHostApplicationSuspendDate = self->_lastHostApplicationSuspendDate;
  self->_lastHostApplicationSuspendDate = v6;

  -[SFBrowserServiceViewController closeDatabasesOnBackgroundingOrDismissal](self, "closeDatabasesOnBackgroundingOrDismissal");
  -[SFSystemAlert cancel](self->_webAuthenticationDataSharingConfirmation, "cancel");
  _Block_object_dispose(&v10, 8);
}

uint64_t __68__SFBrowserServiceViewController__hostApplicationDidEnterBackground__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

uint64_t __68__SFBrowserServiceViewController__hostApplicationDidEnterBackground__block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

- (void)closeDatabasesOnBackgroundingOrDismissal
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v4 = (void *)*MEMORY[0x1E0DC4730];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__SFBrowserServiceViewController_closeDatabasesOnBackgroundingOrDismissal__block_invoke;
  v12[3] = &unk_1E4ABFDC0;
  v12[4] = &v13;
  v5 = objc_msgSend(v4, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("com.apple.SafariViewService.closeDatabasesOnBackgroundingOrDismissalTask"), v12);
  v14[3] = v5;
  objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __74__SFBrowserServiceViewController_closeDatabasesOnBackgroundingOrDismissal__block_invoke_221;
  v11[3] = &unk_1E4ABFDC0;
  v11[4] = &v13;
  objc_msgSend(v6, "savePendingProviderChangesWithCompletion:", v11);

  if (-[_SFBrowserContentViewController safariDataSharingMode](self, "safariDataSharingMode") == 1
    || -[_SFBrowserContentViewController safariDataSharingMode](self, "safariDataSharingMode") == 3)
  {
    -[_SFBrowserContentViewController webView](self, "webView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "websiteDataStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "httpCookieStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "_flushCookiesToDiskWithCompletionHandler:", &__block_literal_global_26);

  }
  _Block_object_dispose(&v13, 8);
}

uint64_t __74__SFBrowserServiceViewController_closeDatabasesOnBackgroundingOrDismissal__block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXViewService();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __74__SFBrowserServiceViewController_closeDatabasesOnBackgroundingOrDismissal__block_invoke_cold_1();
  return objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

uint64_t __74__SFBrowserServiceViewController_closeDatabasesOnBackgroundingOrDismissal__block_invoke_221(uint64_t a1)
{
  return objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

- (id)_applicationPayloadForOpeningInSafari
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFBrowserServiceViewController;
  -[_SFBrowserContentViewController _applicationPayloadForOpeningInSafari](&v8, sel__applicationPayloadForOpeningInSafari);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[SFBrowserServiceViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D4F228]);

  v6 = (void *)objc_msgSend(v4, "copy");
  return v6;
}

- (int64_t)_persona
{
  if (-[SFBrowserServiceViewController _isUsedForAuthentication](self, "_isUsedForAuthentication"))
    return 2;
  else
    return 1;
}

- (BOOL)_shouldReloadImmediatelyAfterPageLoadError
{
  return self->_hostApplicationIsForeground;
}

- (void)webViewController:(id)a3 didReceiveServerRedirectForProvisionalNavigation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SFBrowserServiceViewController;
  -[_SFBrowserContentViewController webViewController:didReceiveServerRedirectForProvisionalNavigation:](&v11, sel_webViewController_didReceiveServerRedirectForProvisionalNavigation_, v6, v7);
  if (self->_canNotifyHostApplicationOfRedirects)
  {
    -[SFBrowserServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "webView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "initialLoadDidRedirectToURL:", v10);

  }
}

- (void)webViewControllerDidCancelClientRedirect:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFBrowserServiceViewController;
  -[_SFBrowserContentViewController webViewControllerDidCancelClientRedirect:](&v4, sel_webViewControllerDidCancelClientRedirect_, a3);
  self->_isExpectingClientRedirect = 0;
}

- (void)webViewController:(id)a3 willPerformClientRedirectToURL:(id)a4 withDelay:(double)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  objc_super v12;

  v8 = a3;
  v9 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFBrowserServiceViewController;
  -[_SFBrowserContentViewController webViewController:willPerformClientRedirectToURL:withDelay:](&v12, sel_webViewController_willPerformClientRedirectToURL_withDelay_, v8, v9, a5);
  if (self->_canNotifyHostApplicationOfRedirects)
  {
    -[_SFBrowserContentViewController configuration](self, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "_redirectNotificationBehavior");

    if (a5 == 0.0 || v11)
      self->_isExpectingClientRedirect = 1;
  }

}

- (void)webViewController:(id)a3 didStartProvisionalNavigation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SFBrowserServiceViewController;
  -[_SFBrowserContentViewController webViewController:didStartProvisionalNavigation:](&v13, sel_webViewController_didStartProvisionalNavigation_, v6, v7);
  if (self->_canNotifyHostApplicationOfRedirects)
  {
    if (self->_isExpectingClientRedirect)
    {
      -[SFBrowserServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "webView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "initialLoadDidRedirectToURL:", v10);

    }
    else if (self->_hasBegunFirstNavigation)
    {
      -[_SFBrowserContentViewController configuration](self, "configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "_redirectNotificationBehavior");

      if (!v12)
        self->_canNotifyHostApplicationOfRedirects = 0;
    }
    self->_hasBegunFirstNavigation = 1;
  }

}

- (void)webViewController:(id)a3 didFinishDocumentLoadForNavigation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SFBrowserServiceViewController;
  -[_SFBrowserContentViewController webViewController:didFinishDocumentLoadForNavigation:](&v10, sel_webViewController_didFinishDocumentLoadForNavigation_, v6, v7);
  -[_SFBrowserContentViewController configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_redirectNotificationBehavior");

  if (!v9 && !self->_isExpectingClientRedirect)
    self->_canNotifyHostApplicationOfRedirects = 0;

}

- (void)webViewController:(id)a3 didChangeFullScreen:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFBrowserServiceViewController;
  -[_SFBrowserContentViewController webViewController:didChangeFullScreen:](&v8, sel_webViewController_didChangeFullScreen_, v6, v4);
  -[SFBrowserServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didChangeFullScreen:", v4);

}

- (void)webViewControllerWebProcessDidCrash:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SFBrowserServiceViewController;
  -[_SFBrowserContentViewController webViewControllerWebProcessDidCrash:](&v6, sel_webViewControllerWebProcessDidCrash_, v4);
  -[SFBrowserServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didChangeFullScreen:", 0);

}

- (void)safariActivity:(id)a3 didFinish:(BOOL)a4
{
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilesafari.activity.addBookmark"));

  if ((v6 & 1) == 0)
  {
    v7 = v12;
    -[SFBrowserServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "activityProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "activityProxyID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "executeCustomActivityProxyID:", v11);

  }
}

- (void)browserViewDidReceiveTouchEvent:(id)a3
{
  _BOOL4 touchEventsShouldStopRedirectNotifications;
  id v5;

  -[_SFBrowserContentViewController configuration](self, "configuration", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_redirectNotificationBehavior") == 1)
  {
    touchEventsShouldStopRedirectNotifications = self->_touchEventsShouldStopRedirectNotifications;

    if (touchEventsShouldStopRedirectNotifications)
      self->_canNotifyHostApplicationOfRedirects = 0;
  }
  else
  {

  }
}

- (void)linkPreviewHeader:(id)a3 didEnableLinkPreview:(BOOL)a4
{
  -[SFBrowserServiceViewController didRequestShowLinkPreviews:](self, "didRequestShowLinkPreviews:", a4);
}

- (void)_updateMaxVisibleHeightPercentageUserDriven:(BOOL)a3
{
  objc_super v3;

  if (self->_hostApplicationIsForeground)
  {
    v3.receiver = self;
    v3.super_class = (Class)SFBrowserServiceViewController;
    -[_SFBrowserContentViewController _updateMaxVisibleHeightPercentageUserDriven:](&v3, sel__updateMaxVisibleHeightPercentageUserDriven_, a3);
  }
}

- (void)activityViewController:(id)a3 didCompleteActivity:(id)a4 success:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  objc_super v11;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SFBrowserServiceViewController;
  -[_SFBrowserContentViewController activityViewController:didCompleteActivity:success:](&v11, sel_activityViewController_didCompleteActivity_success_, v8, v9, v5);
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.mobilesafari.activity.addToHomeScreen")) & v5)
  {
    -[SFBrowserServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "suspendApplication");

  }
}

- (BOOL)_isUsedForAuthentication
{
  return self->_isUsedForAuthentication;
}

- (void)set_isUsedForAuthentication:(BOOL)a3
{
  self->_isUsedForAuthentication = a3;
}

- (SFSystemAlert)webAuthenticationDataSharingConfirmation
{
  return self->_webAuthenticationDataSharingConfirmation;
}

- (void)setWebAuthenticationDataSharingConfirmation:(id)a3
{
  objc_storeStrong((id *)&self->_webAuthenticationDataSharingConfirmation, a3);
}

- (ASWebAuthenticationSessionCallback)hostApplicationCallback
{
  return self->_hostApplicationCallback;
}

- (void)setHostApplicationCallback:(id)a3
{
  objc_storeStrong((id *)&self->_hostApplicationCallback, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostApplicationCallback, 0);
  objc_storeStrong((id *)&self->_webAuthenticationDataSharingConfirmation, 0);
  objc_storeStrong((id *)&self->_additionalHeaderFieldsForInitialRequest, 0);
  objc_storeStrong((id *)&self->_prewarmingRequestThrottler, 0);
  objc_destroyWeak((id *)&self->_redirectNotificationTimer);
  objc_storeStrong((id *)&self->_persistentDataStore, 0);
  objc_storeStrong((id *)&self->_processPool, 0);
  objc_storeStrong((id *)&self->_lastHostApplicationSuspendDate, 0);
  objc_storeStrong((id *)&self->_usageMonitor, 0);
  objc_storeStrong(&self->_activityViewControllerInfoFetchCompletionHandler, 0);
}

- (void)updateScrollViewIndicatorVerticalInsets:(void *)a1 horizontalInsets:(uint64_t)a2 .cold.1(void *a1, uint64_t a2)
{
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_6_0((uint64_t)a1, a2, 5.8381e-34);
  _os_log_fault_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_FAULT, "Received invalid scroll view indicator insets from host app: %{public}@", v4, 0xCu);

  OUTLINED_FUNCTION_3_0();
}

- (void)processPool
{
  id v5;

  v5 = (id)OUTLINED_FUNCTION_6_0(a1, (uint64_t)a2, 5.8381e-34);
  _os_log_fault_impl(&dword_1A3B2D000, a3, OS_LOG_TYPE_FAULT, "%{public}@ was asked to create its process pool before it has the host app's information", a2, 0xCu);

}

- (void)_shouldAcceptMessage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_2(&dword_1A3B2D000, v0, v1, "Private click not accepted because authentication failed with status %ld", v2);
  OUTLINED_FUNCTION_3_2();
}

- (void)_shouldAcceptMessage:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "Private click not accepted because its timestamp indicates it was reused", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_shouldAcceptMessage:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_1_2(&dword_1A3B2D000, a3, (uint64_t)a3, "Private click not accepted because its origin identifier was %llu", (uint8_t *)a1);
}

- (void)_trustedReportEndpoint
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_2(&dword_1A3B2D000, v0, v1, "Private click not accepted because report endpoint <%@> was not a valid https URL", v2);
  OUTLINED_FUNCTION_3_2();
}

- (void)decideCookieSharingForURL:callback:proxiedAssociatedDomains:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_2(&dword_1A3B2D000, v0, v1, "%{public}@", v2);
  OUTLINED_FUNCTION_3_2();
}

- (void)startResolveRedirectionForURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "Redirection resolving is only allowed in ephemeral mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_ensureWebsiteDataStoreURL:(uint64_t)a3 cookieStoreURL:.cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_0_2(a1, (uint64_t)a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_2_0(&dword_1A3B2D000, "Failed to create cookie data store URL at %{public}@, error: %{public}@", v4, v5);

  OUTLINED_FUNCTION_3_0();
}

- (void)_ensureWebsiteDataStoreURL:(uint64_t)a3 cookieStoreURL:.cold.2(uint64_t a1, void *a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_0_2(a1, (uint64_t)a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_2_0(&dword_1A3B2D000, "Failed to create data store URL at %{public}@, error: %{public}@", v4, v5);

  OUTLINED_FUNCTION_3_0();
}

void __74__SFBrowserServiceViewController_closeDatabasesOnBackgroundingOrDismissal__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "Background task expired while waiting for Contact AutoFill database to close and touch icon cache to save", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end

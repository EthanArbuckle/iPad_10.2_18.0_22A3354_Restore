@implementation CPSClipOverlayViewController

- (CPSClipOverlayViewController)initWithAppClipBundleID:(id)a3
{
  CPSClipOverlayViewController *v3;
  CPSClipOverlayViewController *v4;
  CPSClipOverlayViewController *v5;

  v3 = -[CPSClipOverlayViewController _initWithAppClipBundleID:](self, "_initWithAppClipBundleID:", a3);
  v4 = v3;
  if (v3)
  {
    -[CPSClipOverlayViewController _loadClipRecordUsingBundleID](v3, "_loadClipRecordUsingBundleID");
    v5 = v4;
  }

  return v4;
}

- (CPSClipOverlayViewController)initWithAppClipRecord:(id)a3
{
  id v5;
  void *v6;
  CPSClipOverlayViewController *v7;
  CPSClipOverlayViewController *v8;

  v5 = a3;
  objc_msgSend(v5, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CPSClipOverlayViewController _initWithAppClipBundleID:](self, "_initWithAppClipBundleID:", v6);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_clipRecord, a3);
    v8 = v7;
  }

  return v7;
}

- (id)_initWithAppClipBundleID:(id)a3
{
  id v4;
  CPSClipOverlayViewController *v5;
  CPSClipOverlayViewController *v6;
  uint64_t v7;
  CPSAppClipRecord *clipRecord;
  CPSClipOverlayViewController *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPSClipOverlayViewController;
  v5 = -[CPSClipOverlayViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    v5->_sceneActivationState = -1;
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D107D8]), "initWithBundleID:", v4);
    clipRecord = v6->_clipRecord;
    v6->_clipRecord = (CPSAppClipRecord *)v7;

    v6->_showingDemoProgress = CPSUsesDemoProgressFill();
    v9 = v6;
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[CPSBannerContainerView removeObserver:forKeyPath:context:](self->_bannerContainer, "removeObserver:forKeyPath:context:", self, CFSTR("bannerHidden"), kvoContext);
  -[CPSBannerContainerView removeObserver:forKeyPath:context:](self->_bannerContainer, "removeObserver:forKeyPath:context:", self, CFSTR("trackingBannerDismissGesture"), kvoContext);
  -[CPSBannerContainerView removeObserver:forKeyPath:context:](self->_bannerContainer, "removeObserver:forKeyPath:context:", self, CFSTR("bannerHasAccessibilityFocus"), kvoContext);
  -[CPSClipOverlayViewController _setClipSessionProxy:](self, "_setClipSessionProxy:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CPSClipOverlayViewController;
  -[CPSClipOverlayViewController dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  CPSBannerContainerView *v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = (CPSBannerContainerView *)a4;
  v12 = a5;
  if ((void *)kvoContext == a6)
  {
    if (self->_bannerContainer == v11)
      -[CPSClipOverlayViewController _scheduleBannerDismissTimerIfNeeded](self, "_scheduleBannerDismissTimerIfNeeded");
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CPSClipOverlayViewController;
    -[CPSClipOverlayViewController observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)viewDidLoad
{
  void *v3;
  CPSAppAttributionBanner *v4;
  CPSAppAttributionBanner *banner;
  void *v6;
  CPSBannerContainerView *v7;
  CPSBannerContainerView *bannerContainer;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CPSClipOverlayViewController;
  -[CPSClipOverlayViewController viewDidLoad](&v17, sel_viewDidLoad);
  -[CPSClipOverlayViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = objc_alloc_init(CPSAppAttributionBanner);
  banner = self->_banner;
  self->_banner = v4;

  _CPSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAppAttributionBanner setSupertitle:](self->_banner, "setSupertitle:", v6);

  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __43__CPSClipOverlayViewController_viewDidLoad__block_invoke;
  v14 = &unk_1E8E8AE38;
  objc_copyWeak(&v15, &location);
  -[CPSAppAttributionBanner setTapAction:](self->_banner, "setTapAction:", &v11);
  -[CPSClipOverlayViewController _updateBanner](self, "_updateBanner", v11, v12, v13, v14);
  v7 = -[CPSBannerContainerView initWithBannerView:]([CPSBannerContainerView alloc], "initWithBannerView:", self->_banner);
  bannerContainer = self->_bannerContainer;
  self->_bannerContainer = v7;

  -[CPSBannerContainerView setAutoresizingMask:](self->_bannerContainer, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "bounds");
  -[CPSBannerContainerView setFrame:](self->_bannerContainer, "setFrame:");
  -[CPSBannerContainerView addObserver:forKeyPath:options:context:](self->_bannerContainer, "addObserver:forKeyPath:options:context:", self, CFSTR("bannerHidden"), 0, kvoContext);
  -[CPSBannerContainerView addObserver:forKeyPath:options:context:](self->_bannerContainer, "addObserver:forKeyPath:options:context:", self, CFSTR("trackingBannerDismissGesture"), 0, kvoContext);
  -[CPSBannerContainerView addObserver:forKeyPath:options:context:](self->_bannerContainer, "addObserver:forKeyPath:options:context:", self, CFSTR("bannerHasAccessibilityFocus"), 0, kvoContext);
  objc_msgSend(v3, "addSubview:", self->_bannerContainer);
  -[CPSAppClipRecord fullApplicationName](self->_clipRecord, "fullApplicationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

  }
  else
  {
    -[CPSAppClipRecord fullApplicationCaption](self->_clipRecord, "fullApplicationCaption");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      -[CPSClipOverlayViewController _loadClipRecordUsingBundleID](self, "_loadClipRecordUsingBundleID");
  }
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __43__CPSClipOverlayViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didTapBanner");

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPSClipOverlayViewController;
  -[CPSClipOverlayViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  self->_initialAppearanceTime = CACurrentMediaTime();
}

- (int64_t)preferredStatusBarStyle
{
  return -1;
}

- (void)setWebClipID:(id)a3
{
  NSString *v4;
  NSString *webClipID;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  CPSPromise *sessionPromise;
  CPSPromise *v10;
  CPSPromise *v11;
  NSString *v12;

  v4 = (NSString *)a3;
  webClipID = self->_webClipID;
  if (webClipID != v4)
  {
    v12 = v4;
    v6 = -[NSString isEqualToString:](webClipID, "isEqualToString:", v4);
    v4 = v12;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v12, "copy");
      v8 = self->_webClipID;
      self->_webClipID = v7;

      sessionPromise = self->_sessionPromise;
      if (sessionPromise)
        -[CPSPromise finishWithError:](sessionPromise, "finishWithError:", 0);
      objc_msgSend(MEMORY[0x1E0D10810], "promise");
      v10 = (CPSPromise *)objc_claimAutoreleasedReturnValue();
      v11 = self->_sessionPromise;
      self->_sessionPromise = v10;

      -[CPSClipOverlayViewController _loadClipMetadataUsingPlaceholderWebClipID](self, "_loadClipMetadataUsingPlaceholderWebClipID");
      v4 = v12;
    }
  }

}

- (void)setDisplayedOverPlaceholder:(BOOL)a3 forWebClipID:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  _BOOL4 displayedOverPlaceholder;
  int v11;
  id v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v5 = a5;
  v6 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    displayedOverPlaceholder = self->_displayedOverPlaceholder;
    v11 = 138478595;
    v12 = v8;
    v13 = 1024;
    v14 = displayedOverPlaceholder;
    v15 = 1024;
    v16 = v6;
    v17 = 1024;
    v18 = v5;
    _os_log_impl(&dword_1D0512000, v9, OS_LOG_TYPE_DEFAULT, "Displaying overlay for web clip %{private}@. Was over placeholder (%d), is over placeholder (%d), animated (%d).", (uint8_t *)&v11, 0x1Eu);
  }
  -[CPSClipOverlayViewController setWebClipID:](self, "setWebClipID:", v8);
  if (self->_displayedOverPlaceholder != v6 || self->_showingDemoProgress)
  {
    self->_displayedOverPlaceholder = v6;
    if (v6 || self->_showingDemoProgress)
      -[CPSClipOverlayViewController _presentLoadingViewAnimated:](self, "_presentLoadingViewAnimated:", v5);
    else
      -[CPSClipOverlayViewController _dismissLoadingViewAnimated:](self, "_dismissLoadingViewAnimated:", v5);
  }

}

- (void)setDisplayedOverPlaceholder:(BOOL)a3 usingClipMetadata:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;

  v5 = a5;
  v6 = a3;
  v8 = a4;
  objc_msgSend(v8, "webClipID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipOverlayViewController setWebClipID:](self, "setWebClipID:", v9);

  -[CPSClipOverlayViewController _setPlaceholderClipMetadata:](self, "_setPlaceholderClipMetadata:", v8);
  objc_msgSend(v8, "webClipID");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[CPSClipOverlayViewController setDisplayedOverPlaceholder:forWebClipID:animated:](self, "setDisplayedOverPlaceholder:forWebClipID:animated:", v6, v10, v5);
}

- (void)setSceneActivationState:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v7;
  int64_t sceneActivationState;
  _BOOL8 displayedOverPlaceholder;
  void *v10;
  _BOOL4 v11;
  CPSPromise *sessionPromise;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  CPSClipOverlayViewController *v16;
  __int16 v17;
  int64_t v18;
  __int16 v19;
  int64_t v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v7 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    sceneActivationState = self->_sceneActivationState;
    *(_DWORD *)buf = 134218752;
    v16 = self;
    v17 = 2048;
    v18 = a3;
    v19 = 2048;
    v20 = sceneActivationState;
    v21 = 1024;
    v22 = v4;
    _os_log_impl(&dword_1D0512000, v7, OS_LOG_TYPE_DEFAULT, "CPSClipOverlayViewController (%p): Setting scene activation state to %ld from %ld, animated (%d).", buf, 0x26u);
  }
  if (self->_sceneActivationState != a3)
  {
    self->_sceneActivationState = a3;
    -[CPSClipOverlayViewController loadViewIfNeeded](self, "loadViewIfNeeded");
    if ((unint64_t)(a3 - 1) < 2 || a3 == -1)
    {
      -[CPSClipOverlayViewController _setBannerHidden:animated:](self, "_setBannerHidden:animated:", 1, v4);
      return;
    }
    if (a3)
      return;
    if (self->_displayedOverPlaceholder)
    {
      displayedOverPlaceholder = 1;
    }
    else
    {
      -[CPSClipLoadingView superview](self->_loadingView, "superview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10 == 0;

      if (!v11)
        goto LABEL_13;
      displayedOverPlaceholder = self->_displayedOverPlaceholder;
    }
    -[CPSClipOverlayViewController _setBannerHidden:animated:](self, "_setBannerHidden:animated:", displayedOverPlaceholder, v4);
LABEL_13:
    if (!self->_displayedOverPlaceholder && -[NSString length](self->_webClipID, "length") && !self->_usesMockData)
    {
      objc_initWeak((id *)buf, self);
      sessionPromise = self->_sessionPromise;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __65__CPSClipOverlayViewController_setSceneActivationState_animated___block_invoke;
      v13[3] = &unk_1E8E8AE60;
      objc_copyWeak(&v14, (id *)buf);
      -[CPSPromise addCompletionBlock:](sessionPromise, "addCompletionBlock:", v13);
      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __65__CPSClipOverlayViewController_setSceneActivationState_animated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      v8 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __65__CPSClipOverlayViewController_setSceneActivationState_animated___block_invoke_cold_1();
    }
    v9 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134218242;
      v13 = WeakRetained;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1D0512000, v9, OS_LOG_TYPE_DEFAULT, "CPSClipOverlayViewController (%p): Calling -notifyWebClipActivationWithBundleID on session proxy: %@", (uint8_t *)&v12, 0x16u);
    }
    objc_msgSend(WeakRetained, "webClipID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "referrerBundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "notifyWebClipActivationWithBundleID:referrerBundleID:", v10, v11);

  }
}

- (void)setClipNeedsUpdateToLatestVersion
{
  NSObject *v3;
  CPSAppClipRecord *clipRecord;
  NSObject *v5;
  void *v6;
  CPSPromise *sessionPromise;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    clipRecord = self->_clipRecord;
    v5 = v3;
    -[CPSAppClipRecord bundleID](clipRecord, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1D0512000, v5, OS_LOG_TYPE_DEFAULT, "Update to latest version requested for: %@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  self->_clipNeedsUpdate = 1;
  sessionPromise = self->_sessionPromise;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__CPSClipOverlayViewController_setClipNeedsUpdateToLatestVersion__block_invoke;
  v8[3] = &unk_1E8E8AE60;
  objc_copyWeak(&v9, (id *)buf);
  -[CPSPromise addCompletionBlock:](sessionPromise, "addCompletionBlock:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __65__CPSClipOverlayViewController_setClipNeedsUpdateToLatestVersion__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v8 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __65__CPSClipOverlayViewController_setClipNeedsUpdateToLatestVersion__block_invoke_cold_1(v8, v7);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65__CPSClipOverlayViewController_setClipNeedsUpdateToLatestVersion__block_invoke_18;
    v9[3] = &unk_1E8E8AED8;
    objc_copyWeak(&v11, (id *)(a1 + 32));
    v10 = v5;
    objc_msgSend(v10, "prewarmClipWithCompletionHandler:", v9);

    objc_destroyWeak(&v11);
  }

}

void __65__CPSClipOverlayViewController_setClipNeedsUpdateToLatestVersion__block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3)
    {
      v5 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v9 = v3;
        _os_log_impl(&dword_1D0512000, v5, OS_LOG_TYPE_INFO, "Unable to prewarm clip for updating: %{priate}@", buf, 0xCu);
      }
    }
    else
    {
      v6 = *(void **)(a1 + 32);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __65__CPSClipOverlayViewController_setClipNeedsUpdateToLatestVersion__block_invoke_19;
      v7[3] = &unk_1E8E8AEB0;
      v7[4] = WeakRetained;
      objc_msgSend(v6, "installClipWithCompletion:", v7);
    }
  }

}

void __65__CPSClipOverlayViewController_setClipNeedsUpdateToLatestVersion__block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1000);
    v6 = v4;
    objc_msgSend(v5, "bundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412547;
    v10 = v7;
    v11 = 2113;
    v12 = v3;
    _os_log_impl(&dword_1D0512000, v6, OS_LOG_TYPE_DEFAULT, "Performing update to latest verison for clip with bundle ID: %@, error: %{private}@", buf, 0x16u);

  }
  if (!v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__CPSClipOverlayViewController_setClipNeedsUpdateToLatestVersion__block_invoke_20;
    block[3] = &unk_1E8E8AE88;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __65__CPSClipOverlayViewController_setClipNeedsUpdateToLatestVersion__block_invoke_20(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1080) = 0;
  return result;
}

- (void)setReferrerBundleID:(id)a3
{
  uint64_t v5;
  NSString *v6;
  NSString **p_referrerBundleID;
  BOOL v8;
  NSString *v9;

  v9 = (NSString *)a3;
  v5 = -[NSString length](v9, "length");
  v6 = v9;
  if (v5)
  {
    p_referrerBundleID = &self->_referrerBundleID;
    if (*p_referrerBundleID != v9)
    {
      v8 = -[NSString isEqualToString:](v9, "isEqualToString:", CFSTR("com.apple.ClipServices.clipserviced"));
      v6 = v9;
      if (!v8)
      {
        objc_storeStrong((id *)p_referrerBundleID, a3);
        v6 = v9;
      }
    }
  }

}

- (void)_loadClipRecordUsingBundleID
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  if (!self->_usesMockData)
  {
    objc_msgSend(MEMORY[0x1E0D107E0], "defaultStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSAppClipRecord bundleID](self->_clipRecord, "bundleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __60__CPSClipOverlayViewController__loadClipRecordUsingBundleID__block_invoke;
    v5[3] = &unk_1E8E8AF28;
    v5[4] = self;
    objc_msgSend(v3, "getAppClipRecordWithBundleID:completion:", v4, v5);

  }
}

void __60__CPSClipOverlayViewController__loadClipRecordUsingBundleID__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __60__CPSClipOverlayViewController__loadClipRecordUsingBundleID__block_invoke_2;
    v5[3] = &unk_1E8E8AF00;
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

uint64_t __60__CPSClipOverlayViewController__loadClipRecordUsingBundleID__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setClipRecord:", *(_QWORD *)(a1 + 40));
}

- (void)_setClipRecord:(id)a3
{
  CPSAppClipRecord *v5;
  CPSAppClipRecord *v6;

  v5 = (CPSAppClipRecord *)a3;
  if (self->_clipRecord != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_clipRecord, a3);
    -[CPSClipOverlayViewController _updateBanner](self, "_updateBanner");
    v5 = v6;
  }

}

- (void)_loadClipMetadataUsingPlaceholderWebClipID
{
  NSString *v3;
  void *v4;
  _QWORD v5[4];
  NSString *v6;
  CPSClipOverlayViewController *v7;

  if (!self->_usesMockData)
  {
    -[CPSClipOverlayViewController _setPlaceholderClipMetadata:](self, "_setPlaceholderClipMetadata:", 0);
    -[CPSClipOverlayViewController _setClipSessionProxy:](self, "_setClipSessionProxy:", 0);
    v3 = self->_webClipID;
    if (-[NSString length](v3, "length"))
    {
      objc_msgSend(MEMORY[0x1E0D10840], "sharedStore");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __74__CPSClipOverlayViewController__loadClipMetadataUsingPlaceholderWebClipID__block_invoke;
      v5[3] = &unk_1E8E8AF50;
      v6 = v3;
      v7 = self;
      objc_msgSend(v4, "getAppClipWithIdentifier:receiveOnQueue:completionHandler:", v6, MEMORY[0x1E0C80D38], v5);

    }
  }
}

void __74__CPSClipOverlayViewController__loadClipMetadataUsingPlaceholderWebClipID__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;

  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1064), a2);
    objc_msgSend(*(id *)(a1 + 40), "_updateBannerLabels");
    objc_msgSend(*(id *)(a1 + 40), "_setUpNewSessionProxy");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1072), "finishWithResult:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1040));
  }
  else
  {
    v5 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __74__CPSClipOverlayViewController__loadClipMetadataUsingPlaceholderWebClipID__block_invoke_cold_1(a1, v5, v6);
  }

}

- (void)_setUpNewSessionProxy
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_alloc(MEMORY[0x1E0D10820]);
  -[CPSWebClip pageURL](self->_webClip, "pageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "initWithURL:", v4);

  objc_msgSend(MEMORY[0x1E0D10818], "localConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConfiguration:", v5);

  objc_msgSend(v7, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsForSwitcherOverlay:", 1);

  -[CPSClipOverlayViewController _setClipSessionProxy:](self, "_setClipSessionProxy:", v7);
}

- (void)_setPlaceholderClipMetadata:(id)a3
{
  CPSClipMetadata *v5;
  CPSClipMetadata *v6;

  v5 = (CPSClipMetadata *)a3;
  if (self->_placeholderClipMetadata != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_placeholderClipMetadata, a3);
    -[CPSClipOverlayViewController _updateLoadingView](self, "_updateLoadingView");
    v5 = v6;
  }

}

- (void)_setClipSessionProxy:(id)a3
{
  CPSSessionProxy *v5;
  CPSSessionProxy *sessionProxy;
  char v7;
  CPSSessionProxy *v8;
  CPSSessionProxy *v9;

  v5 = (CPSSessionProxy *)a3;
  if (!v5)
    self->_attemptToShowBannerOnceSessionProxyIsResolved = 0;
  sessionProxy = self->_sessionProxy;
  if (sessionProxy != v5)
  {
    v9 = v5;
    v7 = -[CPSSessionProxy isEqual:](sessionProxy, "isEqual:", v5);
    v5 = v9;
    if ((v7 & 1) == 0)
    {
      v8 = self->_sessionProxy;
      objc_storeStrong((id *)&self->_sessionProxy, a3);
      if (v8)
      {
        -[CPSSessionProxy disconnect](v8, "disconnect");
        -[CPSSessionProxy setDelegate:](v8, "setDelegate:", 0);
      }
      if (v9)
      {
        -[CPSSessionProxy setDelegate:](v9, "setDelegate:", self);
        -[CPSSessionProxy connectToService](v9, "connectToService");
        if (self->_attemptToShowBannerOnceSessionProxyIsResolved)
        {
          self->_attemptToShowBannerOnceSessionProxyIsResolved = 0;
          -[CPSClipOverlayViewController _setBannerHidden:animated:](self, "_setBannerHidden:animated:", self->_displayedOverPlaceholder, 1);
        }
      }

      v5 = v9;
    }
  }

}

- (void)proxyDidUpdateMetadata:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__CPSClipOverlayViewController_proxyDidUpdateMetadata___block_invoke;
  v6[3] = &unk_1E8E8AF00;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __55__CPSClipOverlayViewController_proxyDidUpdateMetadata___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "metadata");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_setPlaceholderClipMetadata:", v2);

}

- (void)proxyDidChangeProgress:(id)a3
{
  void *v4;
  int v5;
  int v6;
  _QWORD v7[5];
  int v8;

  if (!self->_showingDemoProgress)
  {
    objc_msgSend(a3, "estimatedProgress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "floatValue");
    v6 = v5;

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__CPSClipOverlayViewController_proxyDidChangeProgress___block_invoke;
    v7[3] = &unk_1E8E8AF78;
    v7[4] = self;
    v8 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v7);
  }
}

uint64_t __55__CPSClipOverlayViewController_proxyDidChangeProgress___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "setLoadingProgress:completion:", 0, a2);
}

- (void)proxy:(id)a3 didFinishLoadingWithError:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  if (!self->_showingDemoProgress)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __64__CPSClipOverlayViewController_proxy_didFinishLoadingWithError___block_invoke;
    v8[3] = &unk_1E8E8AFA0;
    objc_copyWeak(&v11, &location);
    v9 = v7;
    v10 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

void __64__CPSClipOverlayViewController_proxy_didFinishLoadingWithError___block_invoke(id *a1)
{
  id *WeakRetained;
  double v3;
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  id *v12;

  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v4 = a1[4];
    v12 = WeakRetained;
    if (!v4)
    {
      LODWORD(v3) = 1.0;
      objc_msgSend(WeakRetained[127], "setLoadingProgress:completion:", 0, v3);
LABEL_10:
      WeakRetained = v12;
      goto LABEL_11;
    }
    objc_msgSend(v4, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", *MEMORY[0x1E0D10798]);

    v7 = objc_msgSend(a1[4], "code");
    WeakRetained = v12;
    if (v7 != 17 || !*((_BYTE *)v12 + 1080))
    {
      objc_msgSend(MEMORY[0x1E0D107D0], "sharedLogger");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "metadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "clipBundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "recordDidShowErrorWithBundleID:place:errorCode:", v10, CFSTR("launchScreen"), objc_msgSend(a1[4], "code"));

      if (v6)
        v11 = objc_msgSend(a1[4], "code") == 17;
      else
        v11 = 0;
      objc_msgSend(v12, "_showFailedLoadingStateAndReloadMetadata:animated:", v11, v6 ^ 1u);
      goto LABEL_10;
    }
  }
LABEL_11:

}

- (void)proxyRemoteServiceDidCrash:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CPSClipOverlayViewController *v9;

  v4 = a3;
  v5 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[CPSClipOverlayViewController proxyRemoteServiceDidCrash:].cold.1();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__CPSClipOverlayViewController_proxyRemoteServiceDidCrash___block_invoke;
  v7[3] = &unk_1E8E8AF00;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __59__CPSClipOverlayViewController_proxyRemoteServiceDidCrash___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "disconnect");
  v2 = objc_msgSend(MEMORY[0x1E0D10800], "isSupported");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "connectToService");
  }
  else if (v3 == *(void **)(*(_QWORD *)(a1 + 40) + 1040))
  {
    v4 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v8 = 134217984;
      v9 = v5;
      _os_log_impl(&dword_1D0512000, v4, OS_LOG_TYPE_DEFAULT, "CPSClipOverlayViewController (%p): Skip reconnection as app clips are not supported", (uint8_t *)&v8, 0xCu);
    }
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 1040);
    *(_QWORD *)(v6 + 1040) = 0;

  }
}

- (void)proxy:(id)a3 didRetrieveHeroImage:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CPSClipOverlayViewController *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__CPSClipOverlayViewController_proxy_didRetrieveHeroImage___block_invoke;
  v7[3] = &unk_1E8E8AF00;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __59__CPSClipOverlayViewController_proxy_didRetrieveHeroImage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(v2, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageWithContentsOfFile:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1016), "setBackgroundImage:animated:", v5, CACurrentMediaTime() - *(double *)(*(_QWORD *)(a1 + 40) + 1056) > 0.15);

}

- (void)_presentLoadingViewAnimated:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  CPSClipLoadingView *v7;
  CPSClipLoadingView *loadingView;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  uint8_t buf[16];

  -[CPSClipLoadingView superview](self->_loadingView, "superview", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0512000, v5, OS_LOG_TYPE_DEFAULT, "Requested to present the loading view, but it is already presented.", buf, 2u);
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0512000, v5, OS_LOG_TYPE_DEFAULT, "Presenting the loading view.", buf, 2u);
    }
    v7 = objc_alloc_init(CPSClipLoadingView);
    loadingView = self->_loadingView;
    self->_loadingView = v7;

    -[CPSClipOverlayViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    -[CPSClipLoadingView setFrame:](self->_loadingView, "setFrame:");

    -[CPSClipLoadingView setAutoresizingMask:](self->_loadingView, "setAutoresizingMask:", 18);
    -[CPSClipOverlayViewController _updateLoadingView](self, "_updateLoadingView");
    -[CPSClipOverlayViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertSubview:belowSubview:", self->_loadingView, self->_bannerContainer);

    if (self->_usesMockData || self->_showingDemoProgress)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __60__CPSClipOverlayViewController__presentLoadingViewAnimated___block_invoke;
      v12[3] = &unk_1E8E8AFC8;
      v12[4] = self;
      v11 = (id)objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 1, v12, 0.15);
    }
  }
}

void __60__CPSClipOverlayViewController__presentLoadingViewAnimated___block_invoke(uint64_t a1, void *a2)
{
  float v3;
  void *v4;
  float v5;
  double v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "loadingProgress");
  if (v3 >= 1.0)
  {
    objc_msgSend(v7, "invalidate");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1049) = 0;
    objc_msgSend(*(id *)(a1 + 32), "setDisplayedOverPlaceholder:animated:", 0, 1);
  }
  else
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 1016);
    objc_msgSend(v4, "loadingProgress");
    v6 = v5 + 0.03;
    *(float *)&v6 = v6;
    objc_msgSend(v4, "setLoadingProgress:completion:", 0, v6);
  }

}

- (void)_updateLoadingView
{
  void *v3;
  void *v4;
  void *v5;
  CPSClipLoadingView *loadingView;
  id v7;
  void *v8;
  void *v9;
  id v10;

  -[CPSClipLoadingView setPoweredByThirdParty:](self->_loadingView, "setPoweredByThirdParty:", -[CPSClipMetadata isPoweredByThirdParty](self->_placeholderClipMetadata, "isPoweredByThirdParty"));
  -[CPSClipMetadata clipName](self->_placeholderClipMetadata, "clipName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipLoadingView setName:](self->_loadingView, "setName:", v3);

  -[CPSClipMetadata fullAppShortName](self->_placeholderClipMetadata, "fullAppShortName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CPSClipLoadingView setProvider:](self->_loadingView, "setProvider:", v4);
  }
  else
  {
    -[CPSClipMetadata fullAppName](self->_placeholderClipMetadata, "fullAppName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSClipLoadingView setProvider:](self->_loadingView, "setProvider:", v5);

  }
  -[CPSClipMetadata clipHeroImageURL](self->_placeholderClipMetadata, "clipHeroImageURL");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "cps_isFileURL"))
  {
    loadingView = self->_loadingView;
    v7 = objc_alloc(MEMORY[0x1E0CEA638]);
    objc_msgSend(v10, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithContentsOfFile:", v8);
    -[CPSClipLoadingView setBackgroundImage:animated:](loadingView, "setBackgroundImage:animated:", v9, 0);

  }
}

- (void)_showFailedLoadingStateAndReloadMetadata:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  CPSClipLoadingView *loadingView;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  v4 = a4;
  v5 = a3;
  objc_initWeak(&location, self);
  loadingView = self->_loadingView;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __82__CPSClipOverlayViewController__showFailedLoadingStateAndReloadMetadata_animated___block_invoke;
  v11 = &unk_1E8E8AE38;
  objc_copyWeak(&v12, &location);
  -[CPSClipLoadingView setLoadingHasFailed:animated:reason:reloadHandler:](loadingView, "setLoadingHasFailed:animated:reason:reloadHandler:", 1, v4, 0, &v8);
  if (v5)
    -[CPSSessionProxy fetchClipMetadataAndImages](self->_sessionProxy, "fetchClipMetadataAndImages", v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __82__CPSClipOverlayViewController__showFailedLoadingStateAndReloadMetadata_animated___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  _QWORD *v3;
  void *v4;
  _QWORD v5[5];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(v1);
    v4 = (void *)v3[130];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __82__CPSClipOverlayViewController__showFailedLoadingStateAndReloadMetadata_animated___block_invoke_2;
    v5[3] = &unk_1E8E8AEB0;
    v5[4] = v3;
    objc_msgSend(v4, "prewarmClipWithCompletionHandler:", v5);

  }
}

void __82__CPSClipOverlayViewController__showFailedLoadingStateAndReloadMetadata_animated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = v4;
      objc_msgSend(v3, "cps_privacyPreservingDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1D0512000, v5, OS_LOG_TYPE_INFO, "Unable to prewarm clip again after attempting to reload: %{public}@", buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "installClip");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__CPSClipOverlayViewController__showFailedLoadingStateAndReloadMetadata_animated___block_invoke_38;
    block[3] = &unk_1E8E8AE88;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __82__CPSClipOverlayViewController__showFailedLoadingStateAndReloadMetadata_animated___block_invoke_38(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "setLoadingHasFailed:animated:reason:reloadHandler:", 0, 1, 0, 0);
}

- (void)_dismissLoadingViewAnimated:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  CPSClipLoadingView *loadingView;
  _QWORD v8[5];
  uint8_t buf[16];

  -[CPSClipLoadingView superview](self->_loadingView, "superview", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0512000, v5, OS_LOG_TYPE_DEFAULT, "Starting to dismiss the loading view.", buf, 2u);
    }
    -[CPSClipOverlayViewController _updateBanner](self, "_updateBanner");
    loadingView = self->_loadingView;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__CPSClipOverlayViewController__dismissLoadingViewAnimated___block_invoke;
    v8[3] = &unk_1E8E8AE88;
    v8[4] = self;
    -[CPSClipLoadingView finishLoadingWithCompletion:](loadingView, "finishLoadingWithCompletion:", v8);
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0512000, v5, OS_LOG_TYPE_DEFAULT, "Requested to dismiss the loading view, but the loading view is not yet presented.", buf, 2u);
  }
}

uint64_t __60__CPSClipOverlayViewController__dismissLoadingViewAnimated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1016);
  *(_QWORD *)(v2 + 1016) = 0;

  v4 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D0512000, v4, OS_LOG_TYPE_DEFAULT, "The loading view has been removed from the view hierarcy.", v6, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_setBannerHidden:animated:", 0, 1);
}

- (void)_setBannerHidden:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  CPSSessionProxy *v9;
  _QWORD v10[4];
  CPSSessionProxy *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  BOOL v16;
  id location;

  if (a3)
  {
    -[CPSBannerContainerView setBannerHidden:animated:animationCompletion:](self->_bannerContainer, "setBannerHidden:animated:animationCompletion:", 1, a4, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    v6 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __58__CPSClipOverlayViewController__setBannerHidden_animated___block_invoke;
    v14[3] = &unk_1E8E8AFF0;
    objc_copyWeak(&v15, &location);
    v16 = a4;
    v7 = MEMORY[0x1D17E1B78](v14);
    v8 = (void *)v7;
    if (self->_appAttributionBannerPolicy)
    {
      (*(void (**)(uint64_t))(v7 + 16))(v7);
    }
    else
    {
      v9 = self->_sessionProxy;
      if (v9)
      {
        self->_attemptToShowBannerOnceSessionProxyIsResolved = 0;
        v10[0] = v6;
        v10[1] = 3221225472;
        v10[2] = __58__CPSClipOverlayViewController__setBannerHidden_animated___block_invoke_2;
        v10[3] = &unk_1E8E8B040;
        objc_copyWeak(&v13, &location);
        v11 = v9;
        v12 = v8;
        -[CPSSessionProxy checkAndConsumeShowsAppAttributionBannerWithCompletion:](v11, "checkAndConsumeShowsAppAttributionBannerWithCompletion:", v10);

        objc_destroyWeak(&v13);
      }
      else
      {
        self->_attemptToShowBannerOnceSessionProxyIsResolved = 1;
      }

    }
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __58__CPSClipOverlayViewController__setBannerHidden_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (*((_BYTE *)WeakRetained + 1008) || *((_QWORD *)WeakRetained + 129))
    {
      if (!*((_QWORD *)WeakRetained + 138))
        *((_QWORD *)WeakRetained + 138) = 1;
    }
    else
    {
      if (*((_QWORD *)WeakRetained + 138) == 1)
        *((_QWORD *)WeakRetained + 138) = 0;
      v3 = WeakRetained;
      objc_msgSend(*((id *)WeakRetained + 124), "setBannerHidden:animated:animationCompletion:", 0, *(unsigned __int8 *)(a1 + 40), 0);
      WeakRetained = v3;
    }
  }

}

void __58__CPSClipOverlayViewController__setBannerHidden_animated___block_invoke_2(id *a1, char a2)
{
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  char v8;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__CPSClipOverlayViewController__setBannerHidden_animated___block_invoke_3;
  v4[3] = &unk_1E8E8B018;
  objc_copyWeak(&v7, a1 + 6);
  v8 = a2;
  v5 = a1[4];
  v6 = a1[5];
  dispatch_async(MEMORY[0x1E0C80D38], v4);

  objc_destroyWeak(&v7);
}

void __58__CPSClipOverlayViewController__setBannerHidden_animated___block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  BOOL v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(_BYTE *)(a1 + 56))
    v3 = WeakRetained == 0;
  else
    v3 = 1;
  if (!v3 && WeakRetained[130] == *(_QWORD *)(a1 + 32))
  {
    v4 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    WeakRetained = v4;
  }

}

- (void)_scheduleBannerDismissTimerIfNeeded
{
  CPSBannerContainerView *bannerContainer;
  NSObject *v4;
  NSTimer **p_automaticBannerDismissTimer;
  NSTimer *v6;
  NSObject *v7;
  void *v8;
  NSTimer *v9;
  NSTimer *automaticBannerDismissTimer;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  bannerContainer = self->_bannerContainer;
  if (!bannerContainer
    || -[CPSBannerContainerView isBannerHidden](bannerContainer, "isBannerHidden")
    || -[CPSBannerContainerView isTrackingBannerDismissGesture](self->_bannerContainer, "isTrackingBannerDismissGesture")|| -[CPSBannerContainerView bannerHasAccessibilityFocus](self->_bannerContainer, "bannerHasAccessibilityFocus"))
  {
    if (self->_automaticBannerDismissTimer)
    {
      v4 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0512000, v4, OS_LOG_TYPE_INFO, "Invalidated banner dismiss timer.", buf, 2u);
      }
      p_automaticBannerDismissTimer = &self->_automaticBannerDismissTimer;
      -[NSTimer invalidate](*p_automaticBannerDismissTimer, "invalidate");
      v6 = *p_automaticBannerDismissTimer;
      *p_automaticBannerDismissTimer = 0;

    }
  }
  else if (!self->_automaticBannerDismissTimer)
  {
    v7 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v14 = 0x4018000000000000;
      _os_log_impl(&dword_1D0512000, v7, OS_LOG_TYPE_INFO, "Scheduling banner dismiss timer with for %.1fs.", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    v8 = (void *)MEMORY[0x1E0C99E88];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__CPSClipOverlayViewController__scheduleBannerDismissTimerIfNeeded__block_invoke;
    v11[3] = &unk_1E8E8B068;
    objc_copyWeak(&v12, (id *)buf);
    objc_msgSend(v8, "scheduledTimerWithTimeInterval:repeats:block:", 0, v11, 6.0);
    v9 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    automaticBannerDismissTimer = self->_automaticBannerDismissTimer;
    self->_automaticBannerDismissTimer = v9;

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
}

void __67__CPSClipOverlayViewController__scheduleBannerDismissTimerIfNeeded__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v2;
  id v3;
  uint8_t v4[16];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D0512000, v2, OS_LOG_TYPE_INFO, "Banner dismiss timer fired, hiding banner.", v4, 2u);
    }
    objc_msgSend(WeakRetained[121], "invalidate");
    v3 = WeakRetained[121];
    WeakRetained[121] = 0;

    objc_msgSend(WeakRetained, "_setBannerHidden:animated:", 1, 1);
  }

}

- (void)_updateBanner
{
  NSObject *v3;
  CPSAppClipRecord *v4;
  void *v5;
  CPSAppClipRecord *v6;
  _QWORD v7[4];
  CPSAppClipRecord *v8;
  CPSClipOverlayViewController *v9;
  uint8_t buf[16];

  v3 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0512000, v3, OS_LOG_TYPE_DEFAULT, "Updating the attribution banner", buf, 2u);
  }
  -[CPSClipOverlayViewController _updateBannerLabels](self, "_updateBannerLabels");
  v4 = self->_clipRecord;
  +[CPSAppAttributionBanner preferredImageDescriptor](CPSAppAttributionBanner, "preferredImageDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__CPSClipOverlayViewController__updateBanner__block_invoke;
  v7[3] = &unk_1E8E8B090;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[CPSAppClipRecord getApplicationIconForImageDescriptor:resultHandler:](v6, "getApplicationIconForImageDescriptor:resultHandler:", v5, v7);

}

uint64_t __45__CPSClipOverlayViewController__updateBanner__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(result + 32) == *(_QWORD *)(v2 + 1000))
    return objc_msgSend(*(id *)(v2 + 984), "setIcon:", a2);
  return result;
}

- (void)_updateBannerLabels
{
  void *v3;
  CPSAppAttributionBanner **p_banner;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CPSAppClipRecord fullApplicationName](self->_clipRecord, "fullApplicationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    p_banner = &self->_banner;
    -[CPSAppAttributionBanner setTitle:](self->_banner, "setTitle:", v3);
  }
  else
  {
    -[CPSWebClip fullAppName](self->_webClip, "fullAppName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    p_banner = &self->_banner;
    -[CPSAppAttributionBanner setTitle:](self->_banner, "setTitle:", v5);

  }
  -[CPSAppClipRecord fullApplicationCaption](self->_clipRecord, "fullApplicationCaption");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[CPSAppAttributionBanner setSubtitle:](*p_banner, "setSubtitle:", v6);
  }
  else
  {
    -[CPSWebClip fullAppCaption](self->_webClip, "fullAppCaption");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSAppAttributionBanner setSubtitle:](*p_banner, "setSubtitle:", v7);

  }
  -[CPSAppClipRecord fullApplicationStoreURL](self->_clipRecord, "fullApplicationStoreURL");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[CPSAppAttributionBanner setShowsAppStoreButton:](*p_banner, "setShowsAppStoreButton:", 1);
  }
  else
  {
    -[CPSWebClip fullAppStoreURL](self->_webClip, "fullAppStoreURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSAppAttributionBanner setShowsAppStoreButton:](*p_banner, "setShowsAppStoreButton:", v8 != 0);

  }
}

- (void)_didTapBanner
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = a2;
  objc_msgSend(v2, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D0512000, v3, v5, "No App Store URL recorded for full application with ID %{private}@", v6);

  OUTLINED_FUNCTION_4();
}

- (CPSClipOverlayViewController)initWithAppClipBundleID:(id)a3 webClipID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CPSClipOverlayViewController *v16;
  CPSClipOverlayViewController *v17;

  v6 = a4;
  v7 = a3;
  v8 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[CPSClipOverlayViewController initWithAppClipBundleID:webClipID:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  v16 = -[CPSClipOverlayViewController initWithAppClipBundleID:](self, "initWithAppClipBundleID:", v7);

  if (v16)
  {
    -[CPSClipOverlayViewController setWebClipID:](v16, "setWebClipID:", v6);
    v17 = v16;
  }

  return v16;
}

- (void)setDisplayedOverPlaceholder:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a4;
  v5 = a3;
  v7 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[CPSClipOverlayViewController setDisplayedOverPlaceholder:animated:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  -[CPSClipOverlayViewController setDisplayedOverPlaceholder:forWebClipID:animated:](self, "setDisplayedOverPlaceholder:forWebClipID:animated:", v5, self->_webClipID, v4);
}

- (NSString)webClipID
{
  return self->_webClipID;
}

- (NSString)referrerBundleID
{
  return self->_referrerBundleID;
}

- (BOOL)usesMockData
{
  return self->_usesMockData;
}

- (void)setUsesMockData:(BOOL)a3
{
  self->_usesMockData = a3;
}

- (int64_t)appAttributionBannerPolicy
{
  return self->_appAttributionBannerPolicy;
}

- (void)setAppAttributionBannerPolicy:(int64_t)a3
{
  self->_appAttributionBannerPolicy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referrerBundleID, 0);
  objc_storeStrong((id *)&self->_webClipID, 0);
  objc_storeStrong((id *)&self->_sessionPromise, 0);
  objc_storeStrong((id *)&self->_webClip, 0);
  objc_storeStrong((id *)&self->_sessionProxy, 0);
  objc_storeStrong((id *)&self->_placeholderClipMetadata, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_clipRecord, 0);
  objc_storeStrong((id *)&self->_bannerContainer, 0);
  objc_storeStrong((id *)&self->_banner, 0);
  objc_storeStrong((id *)&self->_automaticBannerDismissTimer, 0);
}

void __65__CPSClipOverlayViewController_setSceneActivationState_animated___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1D0512000, v1, OS_LOG_TYPE_ERROR, "CPSClipOverlayViewController (%p): Error in update promise completion block: %@", v2, 0x16u);
  OUTLINED_FUNCTION_3();
}

void __65__CPSClipOverlayViewController_setClipNeedsUpdateToLatestVersion__block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D0512000, v3, v5, "Not performing update to latest version: %@", v6);

  OUTLINED_FUNCTION_4();
}

void __74__CPSClipOverlayViewController__loadClipMetadataUsingPlaceholderWebClipID__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_0(&dword_1D0512000, a2, a3, "No clip with ID %{public}@.", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3();
}

- (void)proxyRemoteServiceDidCrash:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D0512000, v0, v1, "CPSClipOverlayViewController: Remote service did crash for proxy (%p)", v2);
  OUTLINED_FUNCTION_3();
}

- (void)initWithAppClipBundleID:(uint64_t)a3 webClipID:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1D0512000, a1, a3, "Use -initWithAppClipBundleID:.", a5, a6, a7, a8, 0);
}

- (void)setDisplayedOverPlaceholder:(uint64_t)a3 animated:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1D0512000, a1, a3, "Use -setDisplayedOverPlaceholderForWebClipID:animated:.", a5, a6, a7, a8, 0);
}

@end

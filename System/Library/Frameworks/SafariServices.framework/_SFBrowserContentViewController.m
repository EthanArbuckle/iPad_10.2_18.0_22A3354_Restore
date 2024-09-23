@implementation _SFBrowserContentViewController

- (_SFBrowserContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  char *v8;
  _OWORD *v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  SFSafariViewControllerConfiguration *v18;
  void *v19;
  _SFPerSitePreferencesVendor *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _SFNavigationUtilitiesManager *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  _SFBarManager *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  char v47;
  char *v48;
  id v50;
  _QWORD v51[4];
  id v52;
  id location;
  objc_super v54;

  v6 = a3;
  v7 = a4;
  v54.receiver = self;
  v54.super_class = (Class)_SFBrowserContentViewController;
  v8 = -[_SFBrowserContentViewController initWithNibName:bundle:](&v54, sel_initWithNibName_bundle_, v6, v7);
  if (v8)
  {
    v50 = v6;
    objc_initWeak(&location, v8);
    v9 = (_OWORD *)MEMORY[0x1E0DC49E8];
    v10 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
    *(_OWORD *)(v8 + 1400) = *MEMORY[0x1E0DC49E8];
    *(_OWORD *)(v8 + 1416) = v10;
    v11 = v9[1];
    *(_OWORD *)(v8 + 1432) = *v9;
    *(_OWORD *)(v8 + 1448) = v11;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v8 + 227);
    *((_QWORD *)v8 + 227) = v12;

    objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc_init(MEMORY[0x1E0CEF5F0]);
    v16 = (void *)*((_QWORD *)v8 + 232);
    *((_QWORD *)v8 + 232) = v15;

    objc_msgSend(*((id *)v8 + 232), "setJavaScriptCanOpenWindowsAutomatically:", objc_msgSend(v14, "_sf_javaScriptCanOpenWindowsAutomatically"));
    objc_msgSend(*((id *)v8 + 232), "setJavaScriptEnabled:", objc_msgSend(v14, "_sf_javaScriptEnabled"));
    objc_msgSend(v14, "addObserver:forKeyPath:options:context:", v8, *MEMORY[0x1E0D4F530], 3, kvoContext);
    v17 = *MEMORY[0x1E0D4F398];
    objc_msgSend(*((id *)v8 + 232), "_setApplePayCapabilityDisclosureAllowed:", objc_msgSend(v14, "BOOLForKey:", *MEMORY[0x1E0D4F398]));
    objc_msgSend(v14, "addObserver:forKeyPath:options:context:", v8, v17, 3, kvoContext);
    objc_msgSend(*((id *)v8 + 232), "_setShouldSuppressKeyboardInputDuringProvisionalNavigation:", 1);
    objc_msgSend(*((id *)v8 + 232), "_setShouldAllowUserInstalledFonts:", 0);
    objc_msgSend(*((id *)v8 + 232), "setShouldPrintBackgrounds:", 1);
    objc_msgSend(*((id *)v8 + 232), "_setNeedsSiteSpecificQuirks:", objc_msgSend(v14, "BOOLForKey:", *MEMORY[0x1E0D4F6A0]));
    objc_msgSend(*((id *)v8 + 232), "_setMediaDevicesEnabled:", 1);
    objc_msgSend(*((id *)v8 + 232), "_setInterruptAudioOnPageVisibilityChangeEnabled:", 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*((id *)v8 + 232), "_setTextExtractionEnabled:", objc_msgSend(MEMORY[0x1E0D8A8F8], "isWebKitTextExtractionEnabled"));
    objc_msgSend(v8, "_initializeWebKitExperimentalFeatures");
    v18 = objc_alloc_init(SFSafariViewControllerConfiguration);
    v19 = (void *)*((_QWORD *)v8 + 239);
    *((_QWORD *)v8 + 239) = v18;

    v20 = [_SFPerSitePreferencesVendor alloc];
    objc_msgSend(v8, "webExtensionsController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[_SFPerSitePreferencesVendor initWithExtensionsController:profileProvider:](v20, "initWithExtensionsController:profileProvider:", v21, 0);
    v23 = (void *)*((_QWORD *)v8 + 168);
    *((_QWORD *)v8 + 168) = v22;

    v24 = -[_SFNavigationUtilitiesManager initWithPerSitePreferencesVendor:]([_SFNavigationUtilitiesManager alloc], "initWithPerSitePreferencesVendor:", *((_QWORD *)v8 + 168));
    objc_msgSend(v8, "set_navigationUtilitiesManager:", v24);

    objc_msgSend(v8, "normalBrowsingUserDefinedContentBlockerManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_navigationUtilitiesManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setUserDefinedContentBlockerManager:", v25);

    objc_msgSend(v8, "_navigationUtilitiesManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setBrowserDocument:", v8);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", v8, sel__perSiteAutomaticReaderActivationPreferenceDidChange_, *MEMORY[0x1E0D8B280], 0);
    objc_msgSend(v28, "addObserver:selector:name:object:", v8, sel__perSitePageZoomPreferenceDidChange_, *MEMORY[0x1E0D8B1C8], 0);
    objc_msgSend(v28, "addObserver:selector:name:object:", v8, sel__perSiteLockdownModePreferenceDidChange_, *MEMORY[0x1E0D8B290], 0);
    v29 = objc_alloc_init(MEMORY[0x1E0CEF638]);
    objc_msgSend(v29, "defaultWebpagePreferences");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)*((_QWORD *)v8 + 212);
    *((_QWORD *)v8 + 212) = v30;

    objc_msgSend(*((id *)v8 + 212), "addObserver:forKeyPath:options:context:", v8, *MEMORY[0x1E0D8B148], 4, kvoContext);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObserver:selector:name:object:", v8, sel__translationAvailabilityDidChange_, *MEMORY[0x1E0D8B6B8], 0);

    v8[1080] = 1;
    v33 = objc_alloc_init(_SFBarManager);
    v34 = (void *)*((_QWORD *)v8 + 137);
    *((_QWORD *)v8 + 137) = v33;

    objc_msgSend(*((id *)v8 + 137), "setDelegate:", v8);
    v35 = (void *)*((_QWORD *)v8 + 137);
    v36 = (void *)MEMORY[0x1E0DC39D0];
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __58___SFBrowserContentViewController_initWithNibName_bundle___block_invoke;
    v51[3] = &unk_1E4AC5D88;
    objc_copyWeak(&v52, &location);
    objc_msgSend(v36, "safari_menuWithTitle:uncachedChildrenProvider:", CFSTR("Debug (Internal Only)"), v51);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setBarItem:menu:", 6, v37);

    objc_msgSend(v8, "beginDigitalHealthTracking");
    v38 = objc_alloc(MEMORY[0x1E0D8A790]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "safari_safariCoreBundle");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "URLForResource:withExtension:", CFSTR("WBSAutoFillQuirks"), CFSTR("plist"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "safari_autoFillQuirksDownloadDirectoryURL");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v38, "initWithBuiltInQuirksURL:downloadsDirectoryURL:resourceName:resourceVersion:updateDateDefaultsKey:updateInterval:", v40, v42, CFSTR("AutoFillQuirks"), CFSTR("1"), *MEMORY[0x1E0D8B378], 0.0);
    v44 = (void *)*((_QWORD *)v8 + 206);
    *((_QWORD *)v8 + 206) = v43;

    objc_msgSend(*((id *)v8 + 206), "setShouldAttemptToDownloadConfiguration:", 0);
    objc_msgSend(*((id *)v8 + 206), "beginLoadingQuirksFromDisk");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = (void *)*((_QWORD *)v8 + 174);
    *((_QWORD *)v8 + 174) = v45;

    v47 = objc_msgSend(MEMORY[0x1E0D8AD68], "isLockdownModeEnabledForSafari");
    v8[1689] = v47;
    v8[1688] = v47;
    v48 = v8;
    objc_destroyWeak(&v52);

    objc_destroyWeak(&location);
    v6 = v50;
  }

  return (_SFBrowserContentViewController *)v8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void (**pendingNavigationActionDueToExternalSchemePromptHandler)(id, _QWORD);
  objc_super v6;

  -[WBSURLSpoofingMitigator removeObserver:forKeyPath:context:](self->_URLSpoofingMitigator, "removeObserver:forKeyPath:context:", self, CFSTR("UIShouldReflectCommittedURLInsteadOfCurrentURL"), kvoContext);
  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, *MEMORY[0x1E0D4F530], kvoContext);
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, *MEMORY[0x1E0D4F398], kvoContext);
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, *MEMORY[0x1E0DD9958], kvoContext);
  -[_SFBrowserContentViewController stopDigitalHealthTrackingWithCompletionHandler:](self, "stopDigitalHealthTrackingWithCompletionHandler:", 0);
  -[_SFBrowserContentViewController _invalidateUserActivity](self, "_invalidateUserActivity");
  -[WBSWellKnownURLResponseCodeReliabilityChecker cancel](self->_wellKnownURLResponseCodeReliabilityChecker, "cancel");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0D8B280], 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0D8B6B8], 0);
  -[_SFBrowserContentViewController _invalidateWebViewControllers](self, "_invalidateWebViewControllers");
  -[_SFReloadOptionsController invalidate](self->_reloadOptionsController, "invalidate");
  pendingNavigationActionDueToExternalSchemePromptHandler = (void (**)(id, _QWORD))self->_pendingNavigationActionDueToExternalSchemePromptHandler;
  if (pendingNavigationActionDueToExternalSchemePromptHandler)
    pendingNavigationActionDueToExternalSchemePromptHandler[2](pendingNavigationActionDueToExternalSchemePromptHandler, 0);

  v6.receiver = self;
  v6.super_class = (Class)_SFBrowserContentViewController;
  -[_SFBrowserContentViewController dealloc](&v6, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  void *v4;
  _SFBrowserView *v5;
  _SFBrowserView *v6;
  _SFBrowserView *browserView;
  UITapGestureRecognizer *v8;
  UITapGestureRecognizer *showBarsFromBottomBarRecognizer;
  WBSURLSpoofingMitigator *v10;
  WBSURLSpoofingMitigator *URLSpoofingMitigator;
  _SFPrintController *v12;
  _SFPrintController *printController;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  SFTouchDownGestureRecognizer *v18;
  SFTouchDownGestureRecognizer *touchDownGestureRecognizer;
  SFTouchUpGestureRecognizer *v20;
  SFTouchUpGestureRecognizer *touchUpGestureRecognizer;
  objc_super v22;
  _QWORD v23[2];
  CGRect v24;

  v23[1] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)_SFBrowserContentViewController;
  -[_SFBrowserContentViewController loadView](&v22, sel_loadView);
  -[_SFBrowserContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = [_SFBrowserView alloc];
  objc_msgSend(v3, "bounds");
  v6 = -[_SFBrowserView initWithFrame:](v5, "initWithFrame:");
  browserView = self->_browserView;
  self->_browserView = v6;

  -[_SFBrowserView setAutoresizingMask:](self->_browserView, "setAutoresizingMask:", 18);
  -[_SFBrowserView setDelegate:](self->_browserView, "setDelegate:", self);
  objc_msgSend(v3, "addSubview:", self->_browserView);
  v8 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__showBarsFromBottomBarTap_);
  showBarsFromBottomBarRecognizer = self->_showBarsFromBottomBarRecognizer;
  self->_showBarsFromBottomBarRecognizer = v8;

  -[UITapGestureRecognizer setDelegate:](self->_showBarsFromBottomBarRecognizer, "setDelegate:", self);
  -[_SFBrowserView addGestureRecognizer:](self->_browserView, "addGestureRecognizer:", self->_showBarsFromBottomBarRecognizer);
  v10 = (WBSURLSpoofingMitigator *)objc_alloc_init(MEMORY[0x1E0D8AD80]);
  URLSpoofingMitigator = self->_URLSpoofingMitigator;
  self->_URLSpoofingMitigator = v10;

  -[WBSURLSpoofingMitigator addObserver:forKeyPath:options:context:](self->_URLSpoofingMitigator, "addObserver:forKeyPath:options:context:", self, CFSTR("UIShouldReflectCommittedURLInsteadOfCurrentURL"), 0, kvoContext);
  v12 = objc_alloc_init(_SFPrintController);
  printController = self->_printController;
  self->_printController = v12;

  -[_SFPrintController setDelegate:](self->_printController, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:forKeyPath:options:context:", self, *MEMORY[0x1E0DD9958], 3, kvoContext);

  -[_SFBrowserContentViewController _updateTrackerProtectionPreferences](self, "_updateTrackerProtectionPreferences");
  objc_msgSend(v3, "bounds");
  CGRectGetWidth(v24);
  self->_usesNarrowLayout = _SFWidthIsCompactSizeClass();
  -[_SFBrowserContentViewController _setUpTopBarAndBottomBar](self, "_setUpTopBarAndBottomBar");
  -[_SFBrowserContentViewController _updateStatusBarStyleForced:](self, "_updateStatusBarStyleForced:", 1);
  -[_SFBrowserView navigationBar](self->_browserView, "navigationBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[_SFBarHoverAssistant attachToBar:withAnimator:inContainerView:](_SFBarHoverAssistant, "attachToBar:withAnimator:inContainerView:", v15, self->_dynamicBarAnimator, v3);

  v23[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)-[_SFBrowserContentViewController registerForTraitChanges:withTarget:action:](self, "registerForTraitChanges:withTarget:action:", v16, self, sel__updateDarkModeEnabled);

  v18 = (SFTouchDownGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EE60]), "initWithTarget:action:", self, sel__receivedTouchDown_);
  touchDownGestureRecognizer = self->_touchDownGestureRecognizer;
  self->_touchDownGestureRecognizer = v18;

  -[SFTouchDownGestureRecognizer setDelegate:](self->_touchDownGestureRecognizer, "setDelegate:", self);
  -[_SFBrowserView addGestureRecognizer:](self->_browserView, "addGestureRecognizer:", self->_touchDownGestureRecognizer);
  v20 = (SFTouchUpGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EE68]), "initWithTarget:action:", self, sel__receivedTouchUp_);
  touchUpGestureRecognizer = self->_touchUpGestureRecognizer;
  self->_touchUpGestureRecognizer = v20;

  -[SFTouchUpGestureRecognizer setDelegate:](self->_touchUpGestureRecognizer, "setDelegate:", self);
  -[_SFBrowserView addGestureRecognizer:](self->_browserView, "addGestureRecognizer:", self->_touchUpGestureRecognizer);

}

- (void)_updateDarkModeEnabled
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[_SFBrowserContentViewController traitCollection](self, "traitCollection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "userInterfaceStyle");

  -[_SFBrowserContentViewController webViewController](self, "webViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readerController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "configurationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((((v3 == 2) ^ objc_msgSend(v5, "darkModeEnabled")) & 1) != 0)
  {
    objc_msgSend(v5, "setDarkModeEnabled:", v3 == 2);
    objc_msgSend(v7, "sendConfigurationToWebProcess");
  }

}

- (_SFBrowserView)browserView
{
  -[_SFBrowserContentViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return self->_browserView;
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  -[_SFBrowserContentViewController _currentWebView](self, "_currentWebView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_SFBrowserContentViewController _currentWebView](self, "_currentWebView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend(v5, "becomeFirstResponder");

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_SFBrowserContentViewController;
    v6 = -[_SFBrowserContentViewController becomeFirstResponder](&v8, sel_becomeFirstResponder);
  }

  return v6;
}

- (BOOL)canBecomeFirstResponder
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[_SFBrowserContentViewController _currentWebView](self, "_currentWebView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_SFBrowserContentViewController _currentWebView](self, "_currentWebView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "canBecomeFirstResponder");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_currentlyEditingText
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[_SFBrowserContentViewController webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "sf_inResponderChain"))
  {
    -[_SFBrowserContentViewController webViewController](self, "webViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasFormControlInteraction");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  return v5;
}

- (BOOL)_onlyWantsWebAppShortcuts
{
  return -[_SFBrowserContentViewController _persona](self, "_persona") == 3 && self->_displayMode == 2;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  char v16;
  objc_super v18;

  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0D4EBE8], "sharedProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "commandConflictsWithTextEditing:", v6) & 1) == 0)
  {

    goto LABEL_6;
  }
  v8 = -[_SFBrowserContentViewController _currentlyEditingText](self, "_currentlyEditingText");

  if (!v8)
  {
LABEL_6:
    v10 = -[_SFBrowserContentViewController _onlyWantsWebAppShortcuts](self, "_onlyWantsWebAppShortcuts");
    -[_SFBrowserContentViewController webViewController](self, "webViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (sel_reloadKeyPressed == a3 || sel_reloadFromOriginKeyPressed == a3)
      goto LABEL_21;
    if (sel_find_ == a3 || sel_takeFindStringKeyPressed == a3)
    {
      v13 = -[_SFBrowserContentViewController canFindOnPage](self, "canFindOnPage");
      goto LABEL_24;
    }
    if (sel_navigateBackKeyPressed == a3)
    {
      objc_msgSend(v11, "webView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "canGoBack");
    }
    else
    {
      if (sel_navigateForwardKeyPressed != a3)
      {
        if (sel_toggleReaderKeyPressed == a3)
        {
          if (!v10)
          {
            v13 = -[_SFBrowserContentViewController _canShowPageFormatMenu](self, "_canShowPageFormatMenu");
            goto LABEL_24;
          }
          goto LABEL_41;
        }
        if (sel_emailCurrentPage == a3)
        {
          if (v10 || !objc_msgSend(getMFMailComposeViewControllerClass(), "canSendMail"))
            goto LABEL_41;
          objc_msgSend(v12, "webView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "URL");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_22;
        }
        if (sel_increaseSize_ != a3 && sel_decreaseSize_ != a3 && sel_resetPageZoomLevelAndFontSize != a3)
        {
          if (sel_dismissSFSafariViewControllerKeyPressed == a3)
          {
            if (!self->_webViewIsInFullScreen)
            {
              v9 = -[_SFBrowserContentViewController _persona](self, "_persona") == 1;
              goto LABEL_29;
            }
          }
          else
          {
            if (sel_saveKeyPressed != a3 && sel_saveWebpageAlternativeKeyPressed != a3)
            {
              v18.receiver = self;
              v18.super_class = (Class)_SFBrowserContentViewController;
              v13 = -[_SFBrowserContentViewController canPerformAction:withSender:](&v18, sel_canPerformAction_withSender_, a3, v6);
LABEL_24:
              v9 = v13;
LABEL_29:

              goto LABEL_30;
            }
            if (!v10)
            {
              v13 = -[_SFBrowserContentViewController _canSaveWebpage](self, "_canSaveWebpage");
              goto LABEL_24;
            }
          }
LABEL_41:
          v9 = 0;
          goto LABEL_29;
        }
        if (v10)
          goto LABEL_41;
LABEL_21:
        objc_msgSend(v11, "webView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "URL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
        v9 = v15 != 0;

LABEL_28:
        goto LABEL_29;
      }
      objc_msgSend(v11, "webView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "canGoForward");
    }
    v9 = v16;
    goto LABEL_28;
  }
  v9 = 0;
LABEL_30:

  return v9;
}

- (void)_cleanUpWebViewController:(id)a3
{
  void *v4;
  _SFSafariSharingExtensionController *sharingExtensionController;
  _SFReloadOptionsController *reloadOptionsController;
  _SFCalendarEventDetector *calendarEventDetector;
  _SFPageLoadErrorController *pageLoadErrorController;
  id v9;

  v9 = a3;
  if (v9)
  {
    -[_SFTelephonyNavigationMitigationPolicy setDialogPresenter:](self->_telephonyNavigationPolicy, "setDialogPresenter:", 0);
    objc_msgSend(v9, "setDelegate:", 0);
    objc_msgSend(v9, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    objc_msgSend(v9, "removeFromParentViewController");
    objc_msgSend(v9, "invalidate");
    -[_SFBrowserContentViewController _setWebViewController:](self, "_setWebViewController:", 0);
    sharingExtensionController = self->_sharingExtensionController;
    self->_sharingExtensionController = 0;

    -[_SFReloadOptionsController invalidate](self->_reloadOptionsController, "invalidate");
    reloadOptionsController = self->_reloadOptionsController;
    self->_reloadOptionsController = 0;

    -[_SFCalendarEventDetector cancelCheckForConfirmationPage](self->_calendarEventDetector, "cancelCheckForConfirmationPage");
    calendarEventDetector = self->_calendarEventDetector;
    self->_calendarEventDetector = 0;

    -[_SFPageLoadErrorController invalidate](self->_pageLoadErrorController, "invalidate");
    pageLoadErrorController = self->_pageLoadErrorController;
    self->_pageLoadErrorController = 0;

  }
}

- (void)_setCurrentWebViewController:(id)a3
{
  id v4;
  _SFTelephonyNavigationMitigationPolicy *telephonyNavigationPolicy;
  _SFTelephonyNavigationMitigationPolicy *v6;
  _SFTelephonyNavigationMitigationPolicy *v7;
  void *v8;
  void *v9;
  void *v10;
  _SFPageLoadErrorController *v11;
  void *v12;
  _SFPageLoadErrorController *v13;
  _SFPageLoadErrorController *pageLoadErrorController;
  void *v15;
  void *v16;

  v4 = a3;
  if (v4)
  {
    telephonyNavigationPolicy = self->_telephonyNavigationPolicy;
    v16 = v4;
    if (!telephonyNavigationPolicy)
    {
      v6 = objc_alloc_init(_SFTelephonyNavigationMitigationPolicy);
      v7 = self->_telephonyNavigationPolicy;
      self->_telephonyNavigationPolicy = v6;

      telephonyNavigationPolicy = self->_telephonyNavigationPolicy;
      v4 = v16;
    }
    -[_SFTelephonyNavigationMitigationPolicy setDialogPresenter:](telephonyNavigationPolicy, "setDialogPresenter:", v4);
    objc_msgSend(v16, "webView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setIndicatorInsetAdjustmentBehavior:", 2);

    _SFCustomUserAgentStringIfNeeded();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v8, "setCustomUserAgent:", v10);

    objc_msgSend(v16, "setDelegate:", self);
    -[_SFBrowserContentViewController addChildViewController:](self, "addChildViewController:", v16);
    objc_msgSend(v16, "didMoveToParentViewController:", self);
    -[_SFBrowserContentViewController _setWebViewController:](self, "_setWebViewController:", v16);
    v11 = [_SFPageLoadErrorController alloc];
    objc_msgSend(v16, "webView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[_SFPageLoadErrorController initWithWebView:](v11, "initWithWebView:", v12);
    pageLoadErrorController = self->_pageLoadErrorController;
    self->_pageLoadErrorController = v13;

    -[_SFPageLoadErrorController setDelegate:](self->_pageLoadErrorController, "setDelegate:", self);
    -[_SFPageLoadErrorController setDialogPresenter:](self->_pageLoadErrorController, "setDialogPresenter:", v16);
    -[_SFPrintController setWebView:](self->_printController, "setWebView:", v8);
    objc_msgSend(v16, "readerController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFPrintController setReaderController:](self->_printController, "setReaderController:", v15);

    -[_SFPrintController setDialogPresenter:](self->_printController, "setDialogPresenter:", v16);
    -[_SFBrowserContentViewController _setUpReloadOptionsControllerIfNeeded](self, "_setUpReloadOptionsControllerIfNeeded");
    -[_SFBrowserContentViewController _setUpCalendarEventDetectorIfNeeded](self, "_setUpCalendarEventDetectorIfNeeded");
    -[_SFBrowserContentViewController _updateTrackerProtectionPreferences](self, "_updateTrackerProtectionPreferences");
    -[_SFBrowserContentViewController _invalidateEVOrganizationName](self, "_invalidateEVOrganizationName");
    -[_SFBrowserContentViewController _setUpToolbar](self, "_setUpToolbar");
    -[_SFBrowserContentViewController _updateUI](self, "_updateUI");
    -[_SFBrowserContentViewController _setUpAnalyticsPersona](self, "_setUpAnalyticsPersona");
    -[_SFBrowserContentViewController _setUpMenu](self, "_setUpMenu");
    -[SFScribbleController setWebView:](self->_sfScribbleController, "setWebView:", v8);

    v4 = v16;
  }

}

- (SFReaderEnabledWebViewController)webViewController
{
  return (SFReaderEnabledWebViewController *)-[NSMutableArray lastObject](self->_webViewControllers, "lastObject");
}

- (void)_pushWebViewController:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_SFBrowserContentViewController webViewController](self, "webViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController _cleanUpWebViewController:](self, "_cleanUpWebViewController:", v4);

  -[NSMutableArray addObject:](self->_webViewControllers, "addObject:", v5);
  -[_SFBrowserContentViewController _setCurrentWebViewController:](self, "_setCurrentWebViewController:", v5);

}

- (void)_popWebViewController
{
  id v3;
  id v4;

  -[_SFBrowserContentViewController webViewController](self, "webViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController _cleanUpWebViewController:](self, "_cleanUpWebViewController:");

  -[NSMutableArray removeLastObject](self->_webViewControllers, "removeLastObject");
  -[_SFBrowserContentViewController webViewController](self, "webViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController _setCurrentWebViewController:](self, "_setCurrentWebViewController:");

}

- (void)_invalidateWebViewControllers
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_webViewControllers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "invalidate", (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  -[_SFBrowserContentViewController webViewController](self, "webViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController _cleanUpWebViewController:](self, "_cleanUpWebViewController:", v7);

  -[NSMutableArray removeAllObjects](self->_webViewControllers, "removeAllObjects");
}

- (void)_setUpAnalyticsPersona
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "_sf_safariServicesBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_normalizedVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_SFBrowserContentViewController _persona](self, "_persona") - 1;
  if (v5 > 3)
    v6 = 3;
  else
    v6 = qword_1A3CB2348[v5];
  objc_msgSend(v7, "registerSafariVersion:persona:", v4, v6);

}

- (SFReaderEnabledWebViewController)rootWebViewController
{
  return (SFReaderEnabledWebViewController *)-[NSMutableArray firstObject](self->_webViewControllers, "firstObject");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  WKWebpagePreferences *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  _SFBrowserContentViewController *v18;

  v10 = a3;
  v11 = (WKWebpagePreferences *)a4;
  v12 = a5;
  v13 = v12;
  if ((void *)kvoContext == a6)
  {
    if ((WKWebpagePreferences *)self->_URLSpoofingMitigator == v11)
    {
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("UIShouldReflectCommittedURLInsteadOfCurrentURL")))
        -[_SFBrowserContentViewController _updateUI](self, "_updateUI");
    }
    else if (self->_defaultWebpagePreferences == v11)
    {
      if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D8B148]))
        -[_SFBrowserContentViewController _updateUsesLockdownStatusBar](self, "_updateUsesLockdownStatusBar");
    }
    else
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]);
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 | v15 && (objc_msgSend((id)v14, "isEqual:", v15) & 1) == 0)
      {
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __82___SFBrowserContentViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
        v16[3] = &unk_1E4AC0590;
        v17 = v10;
        v18 = self;
        dispatch_async(MEMORY[0x1E0C80D38], v16);

      }
    }
  }

}

- (void)setDisplayMode:(int64_t)a3
{
  _BOOL4 v5;
  _SFBrowserView *browserView;
  _QWORD v7[5];

  if (self->_displayMode != a3)
  {
    v5 = -[_SFBrowserContentViewController _isPreviewing](self, "_isPreviewing");
    browserView = self->_browserView;
    if (v5)
    {
      -[_SFBrowserView setPreviewHeader:](browserView, "setPreviewHeader:", 0);
    }
    else
    {
      -[_SFBrowserView setNavigationBar:](browserView, "setNavigationBar:", 0);
      -[_SFBrowserView setToolbar:](self->_browserView, "setToolbar:", 0);
    }
    self->_displayMode = a3;
    -[_SFBrowserContentViewController _setSuppressingPreviewProgressAnimation:](self, "_setSuppressingPreviewProgressAnimation:", -[_SFBrowserContentViewController _isPreviewing](self, "_isPreviewing"));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50___SFBrowserContentViewController_setDisplayMode___block_invoke;
    v7[3] = &unk_1E4AC1080;
    v7[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v7);
  }
}

- (id)processPoolConfiguration
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CEF6C0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "builtInPlugInsURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("SafariServices.wkbundle"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInjectedBundleURL:", v6);

  v9[0] = CFSTR("safari-reader");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCachePartitionedURLSchemes:", v7);

  objc_msgSend(v3, "setPrewarmsProcessesAutomatically:", 1);
  objc_msgSend(v3, "setJITEnabled:", -[SFSafariViewControllerConfiguration _isJITEnabled](self->_configuration, "_isJITEnabled"));
  return v3;
}

- (id)newProcessPool
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WKProcessPool *v10;

  v3 = objc_alloc(MEMORY[0x1E0CEF5F8]);
  -[_SFBrowserContentViewController processPoolConfiguration](self, "processPoolConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "_initWithConfiguration:", v4);

  objc_msgSend(MEMORY[0x1E0DCCB88], "sharedWebFilterSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v6, "isWebFilterEnabled");

  if ((_DWORD)v3)
  {
    +[_SFSearchEngineController sharedInstance](_SFSearchEngineController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "engines");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setObject:forBundleParameter:", v8, *MEMORY[0x1E0D8B778]);

  }
  +[_SFDownloadDispatcher sharedDownloadDispatcher](_SFDownloadDispatcher, "sharedDownloadDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setDownloadDelegate:", v9);

  SafariShared::ReaderAvailabilityController::configureProcessPool((SafariShared::ReaderAvailabilityController *)v5, v10);
  return v5;
}

- (id)processPool
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)-[_SFBrowserContentViewController processPool]::processPool;
  if (!-[_SFBrowserContentViewController processPool]::processPool)
  {
    v4 = -[_SFBrowserContentViewController newProcessPool](self, "newProcessPool");
    v5 = (void *)-[_SFBrowserContentViewController processPool]::processPool;
    -[_SFBrowserContentViewController processPool]::processPool = (uint64_t)v4;

    v3 = (void *)-[_SFBrowserContentViewController processPool]::processPool;
  }
  return v3;
}

- (id)websiteDataStoreConfiguration
{
  return 0;
}

+ (void)createDefaultWebsiteDataStore
{
  id v2;

  v2 = mobileSafariDefaultDataStore();
}

- (id)_createPersistentDataStoreWithConfiguration:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CEF650], "safari_dataStoreWithConfiguration:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)websiteDataStore
{
  uint64_t v3;
  void *v4;
  void *v6;

  if (-[_SFBrowserContentViewController safariDataSharingMode](self, "safariDataSharingMode") == 4
    || -[_SFBrowserContentViewController isSafariRestricted](self, "isSafariRestricted"))
  {
    mobileSafariNonPersistentDataStore(self->_configuration);
    v3 = objc_claimAutoreleasedReturnValue();
LABEL_4:
    v4 = (void *)v3;
    return v4;
  }
  if (-[_SFBrowserContentViewController safariDataSharingMode](self, "safariDataSharingMode") == 1
    || -[_SFBrowserContentViewController safariDataSharingMode](self, "safariDataSharingMode") == 3)
  {
    mobileSafariDefaultDataStore();
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  -[_SFBrowserContentViewController websiteDataStoreConfiguration](self, "websiteDataStoreConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[_SFBrowserContentViewController _createPersistentDataStoreWithConfiguration:](self, "_createPersistentDataStoreWithConfiguration:", v6);
  else
    mobileSafariNonPersistentDataStore(self->_configuration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (WKUserContentController)userContentController
{
  if (-[_SFBrowserContentViewController isPrivate](self, "isPrivate"))
    objc_msgSend(MEMORY[0x1E0CEF608], "safari_privateBrowsingUserContentController");
  else
    objc_msgSend(MEMORY[0x1E0CEF608], "safari_userContentController");
  return (WKUserContentController *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_setUpCookieStoragePolicyForDataStore:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "httpCookieStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sf_applySafariCookieStoragePolicy");

  -[WKPreferences sf_applySafariStorageBlockingPolicy](self->_wkPreferences, "sf_applySafariStorageBlockingPolicy");
  v6 = (id)WBS_LOG_CHANNEL_PREFIXSVCPrivacy();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0C92C08], "sharedHTTPCookieStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 134217984;
    v9 = objc_msgSend(v7, "cookieAcceptPolicy");
    _os_log_impl(&dword_1A3B2D000, v6, OS_LOG_TYPE_DEFAULT, "Set cookie storage policy to %ld", (uint8_t *)&v8, 0xCu);

  }
}

- (id)webViewConfiguration
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unsigned int IsPad;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;

  v3 = objc_alloc_init(MEMORY[0x1E0CEF638]);
  -[_SFBrowserContentViewController websiteDataStore](self, "websiteDataStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWebsiteDataStore:", v4);
  -[_SFBrowserContentViewController processPool](self, "processPool");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProcessPool:", v5);

  -[_SFBrowserContentViewController userContentController](self, "userContentController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserContentController:", v6);

  objc_msgSend(v3, "setPreferences:", self->_wkPreferences);
  objc_msgSend(v3, "setAllowsPictureInPictureMediaPlayback:", 0);
  _SFApplicationNameForUserAgent();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setApplicationNameForUserAgent:", v7);

  objc_msgSend(v3, "_setApplePayEnabled:", 1);
  objc_msgSend(v3, "setIgnoresViewportScaleLimits:", 1);
  objc_msgSend(v3, "_setNeedsStorageAccessFromFileURLsQuirk:", 0);
  objc_msgSend(v3, "preferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "_sf_warnAboutFraudulentWebsites");
    objc_msgSend(v3, "preferences");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_setSafeBrowsingEnabled:", v11);

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = objc_msgSend(v13, "BOOLForKey:", *MEMORY[0x1E0D4F3B0]);
  if (objc_msgSend(v13, "BOOLForKey:", *MEMORY[0x1E0D4F688]))
    v14 = v14 | 2;
  else
    v14 = v14;
  objc_msgSend(v3, "setMediaTypesRequiringUserActionForPlayback:", v14);
  IsPad = _SFDeviceIsPad();
  if (v14)
    v16 = IsPad;
  else
    v16 = 1;
  objc_msgSend(v3, "_setMediaDataLoadsAutomatically:", v16);
  objc_msgSend(v3, "_setMainContentUserGestureOverrideEnabled:", objc_msgSend(v13, "BOOLForKey:", *MEMORY[0x1E0D4F558]));
  objc_msgSend(v3, "setAllowsInlineMediaPlayback:", objc_msgSend(v13, "BOOLForKey:", *MEMORY[0x1E0D4F570]));
  objc_msgSend(v3, "_setInlineMediaPlaybackRequiresPlaysInlineAttribute:", objc_msgSend(v13, "BOOLForKey:", *MEMORY[0x1E0D4F4F8]));
  objc_msgSend(v3, "_setInvisibleAutoplayNotPermitted:", objc_msgSend(v13, "BOOLForKey:", *MEMORY[0x1E0D4F510]));
  objc_msgSend(v3, "_setLegacyEncryptedMediaAPIEnabled:", objc_msgSend(v13, "BOOLForKey:", *MEMORY[0x1E0D4F540]));
  objc_msgSend(v3, "_setDragLiftDelay:", 2);
  objc_msgSend(MEMORY[0x1E0C92C08], "sharedHTTPCookieStorage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "webui_trackerProtectionEnabled");
  objc_msgSend(v3, "websiteDataStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_setResourceLoadStatisticsEnabled:", v18);

  objc_msgSend(v3, "defaultWebpagePreferences");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  _SFApplicationNameForDesktopUserAgent();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_setApplicationNameForUserAgentWithModernCompatibility:", v21);

  objc_msgSend(v3, "_setSystemPreviewEnabled:", 1);
  -[_SFBrowserContentViewController _hostAppBundleId](self, "_hostAppBundleId");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) != 0)
    {
      -[_SFBrowserContentViewController _hostAppBundleId](self, "_hostAppBundleId");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_setAttributedBundleIdentifier:", v24);

    }
  }
  -[_SFBrowserContentViewController _setUpCookieStoragePolicyForDataStore:](self, "_setUpCookieStoragePolicyForDataStore:", v4);

  return v3;
}

- (BOOL)isSafariRestricted
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", CFSTR("com.apple.mobilesafari"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRestricted");

  return v4;
}

- (_SFReloadOptionsController)reloadOptionsController
{
  -[_SFBrowserContentViewController _setUpReloadOptionsControllerIfNeeded](self, "_setUpReloadOptionsControllerIfNeeded");
  return self->_reloadOptionsController;
}

- (void)_updateTrackerProtectionPreferences
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[_SFBrowserContentViewController webView](self, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "websiteDataStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C92C08], "sharedHTTPCookieStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setResourceLoadStatisticsEnabled:", objc_msgSend(v4, "webui_trackerProtectionEnabled"));

}

- (void)_initializeWebKitExperimentalFeatures
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(MEMORY[0x1E0CEF5F0], "_experimentalFeatures", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99EA0], "safari_keyForWebKitExperimentalFeature:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 == 0;

        if (!v11)
          -[WKPreferences _setEnabled:forExperimentalFeature:](self->_wkPreferences, "_setEnabled:forExperimentalFeature:", objc_msgSend(v3, "BOOLForKey:", v9), v8);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void)_setUpWebViewControllerIfNeeded
{
  SFReaderEnabledWebViewController *v3;
  void *v4;
  void *v5;
  SFReaderEnabledWebViewController *v6;

  if (!-[NSMutableArray count](self->_webViewControllers, "count"))
  {
    v3 = [SFReaderEnabledWebViewController alloc];
    -[_SFBrowserContentViewController webViewConfiguration](self, "webViewConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFBrowserContentViewController contentBlockerManager](self, "contentBlockerManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SFWebViewController initWithWebViewConfiguration:contentBlockerManager:](v3, "initWithWebViewConfiguration:contentBlockerManager:", v4, v5);

    -[_SFBrowserContentViewController _pushWebViewController:](self, "_pushWebViewController:", v6);
    -[_SFBrowserContentViewController _didLoadWebView](self, "_didLoadWebView");

  }
}

- (BOOL)_hideFindOnPage
{
  void *v2;
  void *v3;
  char v4;

  -[_SFBrowserContentViewController _currentWebView](self, "_currentWebView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "isFindNavigatorVisible");
  if ((v4 & 1) != 0)
    objc_msgSend(v3, "dismissFindNavigator");

  return v4;
}

- (BOOL)_shouldGoBackToOwnerWebView
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  if ((unint64_t)-[NSMutableArray count](self->_webViewControllers, "count") < 2)
    return 0;
  -[_SFBrowserContentViewController webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backForwardList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)objc_msgSend(v5, "count") < 2;

  return v6;
}

- (void)_willBeginUserInitiatedNavigation
{
  void *v3;

  -[_SFBrowserContentViewController webViewController](self, "webViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "willBeginUserInitiatedNavigation");

  -[WBSURLSpoofingMitigator willStartNewBrowserChromeInitiatedNavigation](self->_URLSpoofingMitigator, "willStartNewBrowserChromeInitiatedNavigation");
}

- (void)_goBack
{
  id v3;
  id v4;

  -[_SFBrowserContentViewController _dismissTransientUIAnimated:](self, "_dismissTransientUIAnimated:", 1);
  self->_shouldDismissReaderInReponseToSameDocumentNavigation = 1;
  if (-[_SFBrowserContentViewController _shouldGoBackToOwnerWebView](self, "_shouldGoBackToOwnerWebView"))
  {
    -[_SFBrowserContentViewController _goBackToOwnerWebView](self, "_goBackToOwnerWebView");
  }
  else
  {
    self->_loadWasUserDriven = 1;
    -[_SFBrowserContentViewController _willBeginUserInitiatedNavigation](self, "_willBeginUserInitiatedNavigation");
    -[_SFBrowserContentViewController webView](self, "webView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v4, "goBack");

  }
}

- (void)_goForward
{
  id v3;
  id v4;

  -[_SFBrowserContentViewController _dismissTransientUIAnimated:](self, "_dismissTransientUIAnimated:", 1);
  self->_shouldDismissReaderInReponseToSameDocumentNavigation = 1;
  self->_loadWasUserDriven = 1;
  -[_SFBrowserContentViewController _willBeginUserInitiatedNavigation](self, "_willBeginUserInitiatedNavigation");
  -[_SFBrowserContentViewController webView](self, "webView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "goForward");

}

- (void)_setUpReloadOptionsControllerIfNeeded
{
  void *v3;
  _SFInjectedJavaScriptController *v4;
  _SFReloadOptionsController *v5;
  void *v6;
  _SFReloadOptionsController *v7;
  _SFReloadOptionsController *reloadOptionsController;
  void *v9;
  _SFReloadOptionsController *v10;
  void *v11;
  int64_t v12;
  void *v13;
  id v14;

  if (!self->_reloadOptionsController)
  {
    -[_SFBrowserContentViewController webView](self, "webView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v14 = v3;
      v4 = -[_SFInjectedJavaScriptController initWithWebView:]([_SFInjectedJavaScriptController alloc], "initWithWebView:", v3);
      v5 = [_SFReloadOptionsController alloc];
      -[_SFPerSitePreferencesVendor requestDesktopSitePreferenceManager](self->_perSitePreferencesVendor, "requestDesktopSitePreferenceManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[_SFReloadOptionsController initWithWebView:activityJSController:perSitePreferenceManager:](v5, "initWithWebView:activityJSController:perSitePreferenceManager:", v14, v4, v6);
      reloadOptionsController = self->_reloadOptionsController;
      self->_reloadOptionsController = v7;

      objc_msgSend(v14, "URL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFReloadOptionsController setSupportsAdvancedPrivacyProtections:](self->_reloadOptionsController, "setSupportsAdvancedPrivacyProtections:", -[_SFBrowserContentViewController supportsAdvancedPrivacyProtectionsForURL:](self, "supportsAdvancedPrivacyProtectionsForURL:", v9));

      v10 = self->_reloadOptionsController;
      -[_SFBrowserContentViewController _navigationUtilitiesManager](self, "_navigationUtilitiesManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setReloadOptionsController:", v10);

      v12 = -[_SFBrowserContentViewController _persona](self, "_persona");
      -[_SFBrowserContentViewController _navigationUtilitiesManager](self, "_navigationUtilitiesManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPersona:", v12);

      v3 = v14;
    }

  }
}

- (void)_setUpCalendarEventDetectorIfNeeded
{
  _SFCalendarEventDetector *v3;
  _SFCalendarEventDetector *v4;
  _SFCalendarEventDetector *calendarEventDetector;
  id v6;

  if (!self->_calendarEventDetector)
  {
    v3 = [_SFCalendarEventDetector alloc];
    -[_SFBrowserContentViewController webView](self, "webView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = -[_SFCalendarEventDetector initWithWebView:](v3, "initWithWebView:");
    calendarEventDetector = self->_calendarEventDetector;
    self->_calendarEventDetector = v4;

  }
}

- (void)_setUpTopBarAndBottomBar
{
  _SFBrowserNavigationBar *v3;
  void *v4;
  UIPanGestureRecognizer *v5;
  UIPanGestureRecognizer *hideNavigationBarGestureRecognizer;
  SFNavigationBarItem *v7;
  SFNavigationBarItem *navigationBarItem;
  _SFDynamicBarAnimator *v9;
  _SFDynamicBarAnimator *dynamicBarAnimator;
  WBSFluidProgressController *v11;
  WBSFluidProgressController *fluidProgressController;
  WBSFluidProgressController *v13;
  WBSFluidProgressController *v14;
  void *v15;
  WBSFluidProgressController *v16;
  WBSFluidProgressController *v17;
  _SFDynamicBarAnimator *v18;
  _SFLinkPreviewHeader *v19;

  switch(self->_displayMode)
  {
    case 0:
    case 3:
      v3 = [_SFBrowserNavigationBar alloc];
      v19 = -[_SFNavigationBar initWithFrame:inputMode:](v3, "initWithFrame:inputMode:", 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      objc_storeStrong((id *)&self->_navigationBar, v19);
      _SFBackdropGroupNameForOwner();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFLinkPreviewHeader setBackdropGroupName:](v19, "setBackdropGroupName:", v4);

      -[_SFLinkPreviewHeader setDelegate:](v19, "setDelegate:", self);
      -[_SFLinkPreviewHeader setUsesNarrowLayout:](v19, "setUsesNarrowLayout:", self->_usesNarrowLayout);
      -[_SFBrowserView setNavigationBar:](self->_browserView, "setNavigationBar:", v19);
      v5 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel__hideNavigationBarGestureRecognized_);
      hideNavigationBarGestureRecognizer = self->_hideNavigationBarGestureRecognizer;
      self->_hideNavigationBarGestureRecognizer = v5;

      -[UIPanGestureRecognizer _setCanPanHorizontally:](self->_hideNavigationBarGestureRecognizer, "_setCanPanHorizontally:", 0);
      -[UIPanGestureRecognizer setDelegate:](self->_hideNavigationBarGestureRecognizer, "setDelegate:", self);
      -[_SFLinkPreviewHeader addGestureRecognizer:](v19, "addGestureRecognizer:", self->_hideNavigationBarGestureRecognizer);
      v7 = (SFNavigationBarItem *)objc_alloc_init(MEMORY[0x1E0D4ECD8]);
      navigationBarItem = self->_navigationBarItem;
      self->_navigationBarItem = v7;

      -[SFNavigationBarItem setCustomPlaceholderText:](self->_navigationBarItem, "setCustomPlaceholderText:", &stru_1E4AC8470);
      -[_SFBrowserContentViewController _setUpToolbar](self, "_setUpToolbar");
      v9 = objc_alloc_init(_SFDynamicBarAnimator);
      dynamicBarAnimator = self->_dynamicBarAnimator;
      self->_dynamicBarAnimator = v9;

      -[_SFDynamicBarAnimator setDelegate:](self->_dynamicBarAnimator, "setDelegate:", self);
      -[_SFBrowserContentViewController _updateDynamicBarGeometry](self, "_updateDynamicBarGeometry");
      v11 = (WBSFluidProgressController *)objc_alloc_init(MEMORY[0x1E0D8A908]);
      fluidProgressController = self->_fluidProgressController;
      self->_fluidProgressController = v11;

      -[WBSFluidProgressController setWindowDelegate:](self->_fluidProgressController, "setWindowDelegate:", self);
      -[SFNavigationBarItem setFluidProgressController:](self->_navigationBarItem, "setFluidProgressController:", self->_fluidProgressController);
      -[_SFBrowserContentViewController _updateBarTheme](self, "_updateBarTheme");
      -[_SFNavigationBar setItem:](self->_navigationBar, "setItem:", self->_navigationBarItem);
      goto LABEL_6;
    case 1:
      v19 = -[_SFLinkPreviewHeader initWithMinimumPreviewUI:]([_SFLinkPreviewHeader alloc], "initWithMinimumPreviewUI:", 0);
      -[_SFBrowserView setPreviewHeader:](self->_browserView, "setPreviewHeader:");
      v13 = (WBSFluidProgressController *)objc_alloc_init(MEMORY[0x1E0D8A908]);
      v14 = self->_fluidProgressController;
      self->_fluidProgressController = v13;

      -[WBSFluidProgressController setWindowDelegate:](self->_fluidProgressController, "setWindowDelegate:", self);
      -[_SFLinkPreviewHeader progressView](v19, "progressView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSFluidProgressController setDelegate:](self->_fluidProgressController, "setDelegate:", v15);
      goto LABEL_5;
    case 2:
      v18 = self->_dynamicBarAnimator;
      self->_dynamicBarAnimator = 0;

      self->_shouldAutoHideHomeIndicator = 1;
      return;
    case 4:
      v19 = -[_SFLinkPreviewHeader initWithMinimumPreviewUI:]([_SFLinkPreviewHeader alloc], "initWithMinimumPreviewUI:", 1);
      -[_SFBrowserView setPreviewHeader:](self->_browserView, "setPreviewHeader:");
      v16 = (WBSFluidProgressController *)objc_alloc_init(MEMORY[0x1E0D8A908]);
      v17 = self->_fluidProgressController;
      self->_fluidProgressController = v16;

      -[WBSFluidProgressController setWindowDelegate:](self->_fluidProgressController, "setWindowDelegate:", self);
      -[_SFLinkPreviewHeader progressView](v19, "progressView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSFluidProgressController setDelegate:](self->_fluidProgressController, "setDelegate:", v15);
LABEL_5:

LABEL_6:
      break;
    default:
      return;
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  if (!v4)
  {
    -[_SFReaderViewController readerWebView](self->_readerViewController, "readerWebView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", 0);

  }
  v7.receiver = self;
  v7.super_class = (Class)_SFBrowserContentViewController;
  -[_SFBrowserContentViewController didMoveToParentViewController:](&v7, sel_didMoveToParentViewController_, v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SFBrowserContentViewController;
  -[_SFBrowserContentViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50___SFBrowserContentViewController_viewWillAppear___block_invoke;
  v4[3] = &unk_1E4AC1080;
  v4[4] = self;
  -[_SFBrowserContentViewController decideDataSharingModeAndSetUpWebViewWithCompletionHandler:](self, "decideDataSharingModeAndSetUpWebViewWithCompletionHandler:", v4);
  -[_SFBrowserView setNeedsLayout](self->_browserView, "setNeedsLayout");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SFBrowserContentViewController;
  -[_SFBrowserContentViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFBrowserContentViewController;
  -[_SFBrowserContentViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[_SFBrowserContentViewController _cancelPendingUpdateUserActivityTimer](self, "_cancelPendingUpdateUserActivityTimer");
  -[_SFBrowserContentViewController _invalidateUserActivity](self, "_invalidateUserActivity");
}

- (BOOL)_isPreviewing
{
  int64_t displayMode;

  displayMode = self->_displayMode;
  return displayMode == 1 || displayMode == 4;
}

- (void)decideDataSharingModeAndSetUpWebViewWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  uint64_t v6;
  void (**v7)(_QWORD);
  void *v8;
  _QWORD v9[5];
  void (**v10)(_QWORD);
  _QWORD v11[5];
  void (**v12)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[_SFBrowserContentViewController webViewController](self, "webViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v4[2](v4);
  }
  else
  {
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __93___SFBrowserContentViewController_decideDataSharingModeAndSetUpWebViewWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E4AC5DB0;
    v11[4] = self;
    v12 = v4;
    v7 = (void (**)(_QWORD))MEMORY[0x1A8598C40](v11);
    v8 = v7;
    if (self->_safariDataSharingMode)
    {
      v7[2](v7);
    }
    else
    {
      v9[0] = v6;
      v9[1] = 3221225472;
      v9[2] = __93___SFBrowserContentViewController_decideDataSharingModeAndSetUpWebViewWithCompletionHandler___block_invoke_2;
      v9[3] = &unk_1E4AC5DD8;
      v9[4] = self;
      v10 = v7;
      -[_SFBrowserContentViewController _getSafariDataSharingModeWithCompletion:](self, "_getSafariDataSharingModeWithCompletion:", v9);

    }
  }

}

- (void)_setUpInterfaceIfNeeded
{
  dispatch_time_t v3;
  _QWORD block[5];

  if (!self->_didSetUpInterface)
  {
    self->_didSetUpInterface = 1;
    -[_SFBrowserContentViewController _updateInterfaceFillsScreen](self, "_updateInterfaceFillsScreen");
    -[_SFBrowserContentViewController _updateDynamicBarGeometry](self, "_updateDynamicBarGeometry");
    -[_SFBrowserContentViewController _updateUsesNarrowLayout](self, "_updateUsesNarrowLayout");
    -[_SFBrowserContentViewController _updateScrollToTopView](self, "_updateScrollToTopView");
    -[_SFBrowserContentViewController _updateUsesLockdownStatusBar](self, "_updateUsesLockdownStatusBar");
    -[_SFBrowserContentViewController _updateWebViewLayoutSize](self, "_updateWebViewLayoutSize");
    -[_SFBrowserContentViewController _updateWebViewShrinkToFit](self, "_updateWebViewShrinkToFit");
    -[_SFBrowserContentViewController _updateDarkModeEnabled](self, "_updateDarkModeEnabled");
    if (-[_SFBrowserContentViewController _isPreviewing](self, "_isPreviewing"))
    {
      v3 = dispatch_time(0, 250000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58___SFBrowserContentViewController__setUpInterfaceIfNeeded__block_invoke;
      block[3] = &unk_1E4AC1080;
      block[4] = self;
      dispatch_after(v3, MEMORY[0x1E0C80D38], block);
    }
  }
}

- (void)_getSafariDataSharingModeWithCompletion:(id)a3
{
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (BOOL)_redirectToHostAppForAuthenticationSession:(id)a3
{
  return 0;
}

- (void)_layOutBrowserViewForSizeTransition
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  void *v6;

  -[_SFBrowserContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  self->_lastSizeUsedForBrowserViewLayout.width = v4;
  self->_lastSizeUsedForBrowserViewLayout.height = v5;

  -[_SFBrowserContentViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  -[_SFBrowserView setFrame:](self->_browserView, "setFrame:");

  -[_SFBrowserContentViewController _updateInterfaceFillsScreen](self, "_updateInterfaceFillsScreen");
  -[_SFBrowserContentViewController _updateDynamicBarGeometry](self, "_updateDynamicBarGeometry");
  -[_SFBrowserContentViewController _updateUsesNarrowLayout](self, "_updateUsesNarrowLayout");
  -[_SFBrowserContentViewController _updateWebViewLayoutSize](self, "_updateWebViewLayoutSize");
  -[_SFBrowserContentViewController _updatePinnableBannerFrame](self, "_updatePinnableBannerFrame");
  -[_SFPageFormatMenuController dismissMenu](self->_pageFormatMenuController, "dismissMenu");
  -[_SFBrowserView setNeedsLayout](self->_browserView, "setNeedsLayout");
}

- (void)_didCompleteViewSizeTransition
{
  -[_SFBrowserContentViewController _updateCurrentScrollViewInsets](self, "_updateCurrentScrollViewInsets");
  -[_SFBrowserContentViewController _updateUI](self, "_updateUI");
  -[_SFBrowserContentViewController _updateScrollToTopView](self, "_updateScrollToTopView");
  -[_SFBrowserContentViewController _updateWebViewShrinkToFit](self, "_updateWebViewShrinkToFit");
  -[_SFBrowserContentViewController _updateMaxVisibleHeightPercentageUserDriven:](self, "_updateMaxVisibleHeightPercentageUserDriven:", 1);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)_SFBrowserContentViewController;
  -[_SFBrowserContentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  ++self->_sizeTransitionCount;
  v8[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86___SFBrowserContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E4AC5E00;
  v9[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86___SFBrowserContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_1E4AC5E00;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, v8);

}

- (void)_updateHomeIndicatorAutoHideState
{
  _BOOL4 autoHidingHomeIndicatorPermitted;

  autoHidingHomeIndicatorPermitted = self->_autoHidingHomeIndicatorPermitted;
  if (self->_autoHidingHomeIndicatorPermitted)
    autoHidingHomeIndicatorPermitted = self->_shouldAutoHideHomeIndicator;
  if (self->_prefersHomeIndicatorAutoHidden != autoHidingHomeIndicatorPermitted)
  {
    self->_prefersHomeIndicatorAutoHidden = autoHidingHomeIndicatorPermitted;
    -[_SFBrowserContentViewController setNeedsUpdateOfHomeIndicatorAutoHidden](self, "setNeedsUpdateOfHomeIndicatorAutoHidden");
  }
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return self->_prefersHomeIndicatorAutoHidden;
}

- (BOOL)_safeAreaShouldAffectWebViewObscuredInsets
{
  void *v2;
  char v3;

  -[_SFBrowserView currentWebView](self->_browserView, "currentWebView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_safeAreaShouldAffectObscuredInsets");

  return v3;
}

- (UIEdgeInsets)_effectiveWebViewSafeAreaInsets
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
  UIEdgeInsets result;

  if (-[_SFBrowserContentViewController _safeAreaShouldAffectWebViewObscuredInsets](self, "_safeAreaShouldAffectWebViewObscuredInsets"))
  {
    -[_SFBrowserView currentWebView](self->_browserView, "currentWebView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeAreaInsets");
    v5 = v4;
    v7 = v6;
    v9 = v8;

    v10 = 0.0;
  }
  else
  {
    v5 = *MEMORY[0x1E0DC49E8];
    v7 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v10 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v9 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.right = v13;
  result.bottom = v10;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)_updateWebViewLayoutSize
{
  double *v3;
  void *v4;
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
  double v17;
  double v18;
  double v19;
  double v20;
  _BOOL4 v21;
  _SFBrowserView *browserView;
  double v23;
  double v24;
  double v25;
  double v26;
  char v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  char v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  CGRect v50;

  if (self->_displayMode == 2)
  {
    -[_SFBrowserView statusBarBackgroundView](self->_browserView, "statusBarBackgroundView");
    v45 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "bounds");
    CGRectGetHeight(v50);
  }
  else
  {
    -[_SFBrowserContentViewController _currentWebView](self, "_currentWebView");
    v45 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "safeAreaInsets");
    v3 = (double *)MEMORY[0x1E0C9D820];
    -[_SFToolbar sizeThatFits:](self->_bottomToolbar, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    -[_SFBrowserView navigationBar](self->_browserView, "navigationBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultHeight");
    objc_msgSend(v4, "defaultHeight");
    -[_SFBrowserView toolbar](self->_browserView, "toolbar");

    if (!self->_keepBarsMinimized)
    {
      objc_msgSend(v4, "sizeThatFits:", *v3, v3[1]);
      -[_SFBrowserView toolbar](self->_browserView, "toolbar");

    }
  }

  -[_SFBrowserContentViewController _effectiveWebViewSafeAreaInsets](self, "_effectiveWebViewSafeAreaInsets");
  UIEdgeInsetsMax();
  v43 = v5;
  v44 = v6;
  v41 = v7;
  v42 = v8;
  UIEdgeInsetsMax();
  v39 = v10;
  v40 = v9;
  v37 = v12;
  v38 = v11;
  UIEdgeInsetsMax();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = -[_SFBrowserContentViewController _isPreviewing](self, "_isPreviewing");
  browserView = self->_browserView;
  if (v21)
    -[_SFBrowserView unscaledWebViewBounds](browserView, "unscaledWebViewBounds");
  else
    -[_SFBrowserView bounds](browserView, "bounds");
  v25 = v23;
  v26 = v24;
  -[_SFBrowserContentViewController webView](self, "webView");
  v46 = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_opt_respondsToSelector();
  v28 = v25 - (v38 + v37);
  v29 = v26 - (v40 + v39);
  v30 = v25 - (v16 + v20);
  v31 = v26 - (v14 + v18);
  v32 = v26 - (v43 + v41);
  v33 = v25 - (v44 + v42);

  -[_SFBrowserContentViewController webView](self, "webView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v34;
  if ((v27 & 1) != 0)
    objc_msgSend(v34, "_overrideLayoutParametersWithMinimumLayoutSize:minimumUnobscuredSizeOverride:maximumUnobscuredSizeOverride:", v33, v32, v28, v29, v30, v31);
  else
    objc_msgSend(v34, "_overrideLayoutParametersWithMinimumLayoutSize:maximumUnobscuredSizeOverride:", v33, v32, v30, v31);

  -[_SFReaderViewController readerWebView](self->_readerViewController, "readerWebView");
  v48 = (id)objc_claimAutoreleasedReturnValue();
  v35 = objc_opt_respondsToSelector();

  -[_SFReaderViewController readerWebView](self->_readerViewController, "readerWebView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v36;
  if ((v35 & 1) != 0)
    objc_msgSend(v36, "_overrideLayoutParametersWithMinimumLayoutSize:minimumUnobscuredSizeOverride:maximumUnobscuredSizeOverride:", v33, v32, v28, v29, v30, v31);
  else
    objc_msgSend(v36, "_overrideLayoutParametersWithMinimumLayoutSize:maximumUnobscuredSizeOverride:", v33, v32, v30, v31);

}

- (BOOL)_isSplitScreen
{
  void *v2;
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  BOOL v17;
  CGRect v19;
  CGRect v20;

  -[_SFBrowserContentViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v20.origin.x = v13;
  v20.origin.y = v14;
  v20.size.width = v15;
  v20.size.height = v16;
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  v17 = !CGRectEqualToRect(v19, v20);

  return v17;
}

- (void)_updateWebViewShrinkToFit
{
  _BOOL8 v3;
  id v4;

  v3 = -[_SFBrowserContentViewController _isSplitScreen](self, "_isSplitScreen");
  -[_SFBrowserContentViewController webView](self, "webView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setAllowsViewportShrinkToFit:", v3);

}

- (void)_updateCurrentScrollViewInsets
{
  double *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  _SFBrowserView *browserView;
  void *v10;
  CGFloat Height;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
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
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  UIEdgeInsets *p_verticalScrollIndicatorBaseInsets;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double top;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double right;
  double v61;
  double bottom;
  double v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  _BOOL4 v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double left;
  double v85;
  double v86;
  id v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  -[_SFBrowserView currentWebView](self->_browserView, "currentWebView");
  v87 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (double *)MEMORY[0x1E0DC49E8];
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v86 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  if (-[_SFBrowserContentViewController _isPreviewing](self, "_isPreviewing"))
  {
    -[_SFBrowserView previewHeader](self->_browserView, "previewHeader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
    v7 = v6;

    -[_SFBrowserView previewScaleFactor](self->_browserView, "previewScaleFactor");
    v83 = v7 / v8;
  }
  else
  {
    browserView = self->_browserView;
    if (self->_displayMode == 2)
    {
      -[_SFBrowserView statusBarBackgroundView](browserView, "statusBarBackgroundView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      Height = CGRectGetHeight(v88);

      v83 = Height;
    }
    else
    {
      -[_SFBrowserView safeAreaInsets](browserView, "safeAreaInsets");
      v13 = v12;
      -[_SFBrowserView crashBanner](self->_browserView, "crashBanner");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bounds");
      v15 = CGRectGetHeight(v89);

      -[_SFBrowserView pinnableBanner](self->_browserView, "pinnableBanner");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bounds");
      CGRectGetHeight(v90);

      -[_SFBrowserView navigationBar](self->_browserView, "navigationBar");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "defaultHeight");
      v19 = v15 + v13 + v18;

      if (self->_showingReader)
        v20 = v13;
      else
        v20 = v19;
      -[_SFDynamicBarAnimator topBarHeight](self->_dynamicBarAnimator, "topBarHeight");
      if (self->_showingCrashBanner)
        -[_SFBrowserView crashBannerOffset](self->_browserView, "crashBannerOffset");
      if (self->_showingPinnableBanner)
      {
        -[_SFBrowserView pinnableBannerOffset](self->_browserView, "pinnableBannerOffset");
        objc_msgSend(v87, "scrollView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "contentOffset");

      }
      v83 = v20;
      -[_SFBrowserContentViewController _maximumHeightObscuredByBottomBar](self, "_maximumHeightObscuredByBottomBar");
      v23 = v22;
      -[_SFDynamicBarAnimator bottomBarOffset](self->_dynamicBarAnimator, "bottomBarOffset");
      v4 = v23 - v24;
    }
  }
  v85 = v4;
  if (self->_showingReader)
  {
    -[_SFBrowserView safeAreaInsets](self->_browserView, "safeAreaInsets");
    v85 = v4 - v25;
  }
  objc_msgSend(v87, "safeAreaInsets");
  UIEdgeInsetsMax();
  UIEdgeInsetsSubtract();
  v75 = v27;
  v76 = v26;
  v77 = v29;
  v78 = v28;
  -[_SFBrowserContentViewController _effectiveWebViewSafeAreaInsets](self, "_effectiveWebViewSafeAreaInsets");
  UIEdgeInsetsMax();
  v79 = v31;
  v81 = v30;
  v33 = v32;
  v35 = v34;
  UIEdgeInsetsMax();
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;
  objc_msgSend(v87, "scrollView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "_sf_setContentInsetAdjustments:", v81, v33, v79, v35);

  objc_msgSend(v87, "_setObscuredInsets:", v37, v39, v41, v43);
  p_verticalScrollIndicatorBaseInsets = &self->_verticalScrollIndicatorBaseInsets;
  if ((objc_msgSend(MEMORY[0x1E0DC3C28], "_sf_baseVerticalScrollIndicatorInsetsExtendFullHeight:", self->_verticalScrollIndicatorBaseInsets.top, self->_verticalScrollIndicatorBaseInsets.left, self->_verticalScrollIndicatorBaseInsets.bottom, self->_verticalScrollIndicatorBaseInsets.right) & 1) != 0&& objc_msgSend(MEMORY[0x1E0DC3C28], "_sf_baseHorizontalScrollIndicatorInsetsExtendFullWidth:", self->_horizontalScrollIndicatorBaseInsets.top, self->_horizontalScrollIndicatorBaseInsets.left, self->_horizontalScrollIndicatorBaseInsets.bottom, self->_horizontalScrollIndicatorBaseInsets.right))
  {
    UIEdgeInsetsMax();
    v80 = v46;
    v82 = v47;
    left = v48;
    v50 = v49;
    UIEdgeInsetsMax();
    top = v51;
    v54 = v53;
    v56 = v55;
    v58 = v57;
  }
  else
  {
    left = self->_verticalScrollIndicatorBaseInsets.left;
    top = self->_horizontalScrollIndicatorBaseInsets.top;
    v59 = self->_horizontalScrollIndicatorBaseInsets.left;
    right = self->_horizontalScrollIndicatorBaseInsets.right;
    if (p_verticalScrollIndicatorBaseInsets->top <= v83)
      v61 = v83;
    else
      v61 = p_verticalScrollIndicatorBaseInsets->top;
    v80 = v61;
    v82 = self->_verticalScrollIndicatorBaseInsets.right;
    if (self->_verticalScrollIndicatorBaseInsets.bottom <= v85)
      bottom = v85;
    else
      bottom = self->_verticalScrollIndicatorBaseInsets.bottom;
    v50 = bottom;
    if (v85 <= self->_horizontalScrollIndicatorBaseInsets.bottom)
      v63 = self->_horizontalScrollIndicatorBaseInsets.bottom;
    else
      v63 = v85;
    v56 = v63;
    -[_SFBrowserContentViewController view](self, "view");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "safeAreaInsets");
    v66 = v65;

    if (v56 >= v66)
      v67 = 0.0;
    else
      v67 = v59;
    if (v56 >= v66)
      v58 = 0.0;
    else
      v58 = right;
    if (v86 <= v67)
      v68 = v67;
    else
      v68 = v86;
    v54 = v68;
  }
  objc_msgSend(v87, "scrollView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setVerticalScrollIndicatorInsets:", v80, left, v50, v82);
  objc_msgSend(v69, "setHorizontalScrollIndicatorInsets:", top, v54, v56, v58);
  v70 = -[_SFBrowserContentViewController _safeAreaShouldAffectWebViewObscuredInsets](self, "_safeAreaShouldAffectWebViewObscuredInsets");
  v71 = *v3;
  v72 = v3[1];
  if (!v70)
  {
    v71 = v76;
    v72 = v75;
  }
  v73 = v3[2];
  v74 = v3[3];
  if (!v70)
  {
    v73 = v78;
    v74 = v77;
  }
  objc_msgSend(v87, "_setUnobscuredSafeAreaInsets:", v71, v72, v73, v74);

}

- (void)_updateScrollIndicatorVerticalInsets:(UIEdgeInsets)a3 horizontalInsets:(UIEdgeInsets)a4
{
  self->_verticalScrollIndicatorBaseInsets = a3;
  self->_horizontalScrollIndicatorBaseInsets = a4;
  -[_SFBrowserContentViewController _updateCurrentScrollViewInsets](self, "_updateCurrentScrollViewInsets");
}

- (void)webViewControllerDidChangeSafeAreaInsets:(id)a3
{
  -[_SFBrowserContentViewController _updateWebViewLayoutSize](self, "_updateWebViewLayoutSize", a3);
  -[_SFBrowserContentViewController _updateCurrentScrollViewInsets](self, "_updateCurrentScrollViewInsets");
}

- (void)webViewControllerDidChangeSafeAreaShouldAffectObscuredInsets:(id)a3
{
  -[_SFBrowserContentViewController _updateWebViewLayoutSize](self, "_updateWebViewLayoutSize", a3);
  -[_SFBrowserContentViewController _updateCurrentScrollViewInsets](self, "_updateCurrentScrollViewInsets");
}

- (BOOL)_canScrollToTopInView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;

  v4 = a3;
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  objc_msgSend(v4, "contentInset");
  v8 = v6 > -v7 || -[_SFDynamicBarAnimator state](self->_dynamicBarAnimator, "state") == 0;

  return v8;
}

- (void)_scrollToTopFromScrollToTopView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  -[_SFBrowserContentViewController _currentWebView](self, "_currentWebView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (-[_SFBrowserContentViewController _canScrollToTopInView:](self, "_canScrollToTopInView:", v8))
  {
    objc_msgSend(v8, "contentOffset");
    v5 = v4;
    objc_msgSend(v8, "contentInset");
    v7 = v6;
    if (-[_SFBrowserContentViewController scrollViewShouldScrollToTop:](self, "scrollViewShouldScrollToTop:", v8))
      objc_msgSend(v8, "setContentOffset:animated:", 1, v5, -v7);
  }

}

- (BOOL)_usesScrollToTopView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[_SFBrowserContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusBarManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isStatusBarHidden"))
  {
    -[_SFBrowserContentViewController _currentWebView](self, "_currentWebView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_SFBrowserContentViewController _canScrollToTopInView:](self, "_canScrollToTopInView:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_updateScrollToTopView
{
  BOOL v3;
  void *v4;
  void *v5;
  id v6;

  v3 = -[_SFBrowserView shouldUseScrollToTopView](self->_browserView, "shouldUseScrollToTopView");
  -[_SFBrowserView setShouldUseScrollToTopView:](self->_browserView, "setShouldUseScrollToTopView:", -[_SFBrowserContentViewController _usesScrollToTopView](self, "_usesScrollToTopView"));
  -[_SFBrowserView scrollToTopView](self->_browserView, "scrollToTopView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (!v3)
    {
      -[_SFBrowserView scrollToTopView](self->_browserView, "scrollToTopView");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__scrollToTopFromScrollToTopView);
      objc_msgSend(v6, "addGestureRecognizer:", v5);

    }
  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double Width;
  double v10;
  objc_super v11;
  CGRect v12;
  CGRect v13;

  v11.receiver = self;
  v11.super_class = (Class)_SFBrowserContentViewController;
  -[_SFBrowserContentViewController viewWillLayoutSubviews](&v11, sel_viewWillLayoutSubviews);
  -[_SFBrowserContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_SFBrowserContentViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  CGRectGetWidth(v12);
  v7 = _SFSizeClassForWidth();
  objc_msgSend(v5, "traitOverrides");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHorizontalSizeClass:", v7);

  if (-[_SFBrowserContentViewController _isPreviewing](self, "_isPreviewing"))
  {
    -[_SFBrowserContentViewController preferredContentSize](self, "preferredContentSize");
    v10 = Width;
    if (Width == 0.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bounds");
      Width = CGRectGetWidth(v13);
    }
    -[_SFBrowserView setUnscaledWebViewWidth:](self->_browserView, "setUnscaledWebViewWidth:", Width);
    if (v10 == 0.0)

  }
  else
  {
    -[_SFBrowserView setUnscaledWebViewWidth:](self->_browserView, "setUnscaledWebViewWidth:", 0.0);
  }

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  unint64_t sizeTransitionCount;
  BOOL showingReader;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_SFBrowserContentViewController;
  -[_SFBrowserContentViewController viewDidLayoutSubviews](&v9, sel_viewDidLayoutSubviews);
  -[_SFBrowserContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  if (v5 == self->_lastSizeUsedForBrowserViewLayout.width && v4 == self->_lastSizeUsedForBrowserViewLayout.height)
  {

  }
  else
  {
    sizeTransitionCount = self->_sizeTransitionCount;

    if (!sizeTransitionCount)
    {
      -[_SFBrowserContentViewController _layOutBrowserViewForSizeTransition](self, "_layOutBrowserViewForSizeTransition");
      -[_SFBrowserContentViewController _didCompleteViewSizeTransition](self, "_didCompleteViewSizeTransition");
    }
  }
  -[_SFBrowserContentViewController _updateCurrentScrollViewInsets](self, "_updateCurrentScrollViewInsets");
  if (self->_interfaceFillsScreen || (showingReader = self->_showingReader))
    showingReader = self->_quickLookDocumentController == 0;
  self->_autoHidingHomeIndicatorPermitted = showingReader;
  -[_SFBrowserContentViewController _updateHomeIndicatorAutoHideState](self, "_updateHomeIndicatorAutoHideState");
  -[_SFBrowserContentViewController _updateBarTheme](self, "_updateBarTheme");
  -[_SFBrowserContentViewController _updateWebViewLayoutSize](self, "_updateWebViewLayoutSize");
}

- (int64_t)preferredStatusBarStyle
{
  return self->_customPreferredStatusBarStyle;
}

- (void)_updateStatusBarStyleForced:(BOOL)a3
{
  void *v5;
  void *v6;
  int64_t v7;

  -[_SFBrowserView navigationBar](self->_browserView, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectiveTheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "backdropIsDark"))
    v7 = 1;
  else
    v7 = 3;

  if (self->_customPreferredStatusBarStyle != v7 || a3)
  {
    self->_customPreferredStatusBarStyle = v7;
    -[_SFBrowserContentViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  NSComparisonResult v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFBrowserContentViewController;
  -[_SFBrowserContentViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = UIContentSizeCategoryCompareToCategory(v5, v7);

  if (v8)
  {
    -[_SFBrowserView pinnableBanner](self->_browserView, "pinnableBanner");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentSizeCategoryDidChange");

  }
}

- (void)_setUpToolbar
{
  void *v3;
  int64_t displayMode;
  _BOOL8 v6;
  _SFToolbar *bottomToolbar;
  _SFToolbar *v9;
  _SFToolbar *v10;
  void *v11;

  -[_SFBrowserView navigationBar](self->_browserView, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    displayMode = self->_displayMode;
    v6 = !self->_usesNarrowLayout && displayMode != 3;
    bottomToolbar = self->_bottomToolbar;
    if (!self->_usesNarrowLayout || displayMode == 3)
    {
      if (bottomToolbar)
      {
        self->_bottomToolbar = 0;

      }
    }
    else if (!bottomToolbar)
    {
      v9 = -[_SFToolbar initWithPlacement:]([_SFToolbar alloc], "initWithPlacement:", 1);
      v10 = self->_bottomToolbar;
      self->_bottomToolbar = v9;

      _SFBackdropGroupNameForOwner();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFToolbar setBackdropGroupName:](self->_bottomToolbar, "setBackdropGroupName:", v11);

      -[_SFBarManager registerToolbar:withLayout:persona:](self->_barManager, "registerToolbar:withLayout:persona:", self->_bottomToolbar, 2, -[_SFBrowserContentViewController _persona](self, "_persona"));
    }
    -[_SFBrowserView setToolbar:](self->_browserView, "setToolbar:", self->_bottomToolbar);
    -[_SFNavigationBar setHasToolbar:](self->_navigationBar, "setHasToolbar:", v6);
  }
}

- (void)setPreferredBarTintColor:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", self->_preferredBarTintColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_preferredBarTintColor, a3);
    -[_SFBrowserContentViewController viewIfLoaded](self, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsLayout");

  }
}

- (void)setPreferredControlTintColor:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", self->_preferredControlTintColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_preferredControlTintColor, a3);
    -[_SFBrowserContentViewController viewIfLoaded](self, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsLayout");

  }
}

- (void)setHostAppModalPresentationStyle:(int64_t)a3
{
  self->_hostAppModalPresentationStyle = a3;
  if (!-[_SFBrowserContentViewController _effectiveBarCollapsingEnabled](self, "_effectiveBarCollapsingEnabled"))
    -[_SFBrowserContentViewController _showBars](self, "_showBars");
}

- (BOOL)_effectiveBarCollapsingEnabled
{
  _BOOL4 v3;

  v3 = -[SFSafariViewControllerConfiguration barCollapsingEnabled](self->_configuration, "barCollapsingEnabled");
  if (v3)
    LOBYTE(v3) = !-[_SFBrowserContentViewController _isPresentedAsSheet](self, "_isPresentedAsSheet");
  return v3;
}

- (BOOL)_isPresentedAsSheet
{
  return (unint64_t)(self->_hostAppModalPresentationStyle - 1) < 2;
}

- (void)_updateBarTheme
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[_SFBrowserContentViewController traitCollection](self, "traitCollection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v7, "userInterfaceStyle");

  if (v3 == 2)
    v4 = 2;
  else
    v4 = 1;
  objc_msgSend(MEMORY[0x1E0D4EF20], "themeWithBarTintStyle:preferredBarTintColor:controlsTintColor:", v4, self->_preferredBarTintColor, self->_preferredControlTintColor);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[_SFNavigationBar setTheme:](self->_navigationBar, "setTheme:");
  -[_SFToolbar setTheme:](self->_bottomToolbar, "setTheme:", v8);
  objc_msgSend(MEMORY[0x1E0D4EBC8], "themeWithTheme:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserView crashBanner](self->_browserView, "crashBanner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTheme:", v5);

}

- (void)setDismissButtonStyle:(int64_t)a3
{
  self->_dismissButtonStyle = a3;
  -[_SFBrowserView updateDismissButtonStyle:](self->_browserView, "updateDismissButtonStyle:");
}

- (void)setConfiguration:(id)a3
{
  id v5;
  _SFApplicationExtensionActivity *customButtonUIActivity;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  _SFApplicationExtensionActivity *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v18;
  _BYTE v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_configuration, a3);
  -[_SFBrowserContentViewController _updateModalInPresentation](self, "_updateModalInPresentation");
  customButtonUIActivity = self->_customButtonUIActivity;
  self->_customButtonUIActivity = 0;

  self->_customActivityButtonIsValid = 0;
  -[SFSafariViewControllerConfiguration activityButton](self->_configuration, "activityButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((objc_msgSend(v7, "_fieldsAreValid") & 1) != 0)
    {
      objc_msgSend(v8, "extensionIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", v9, &v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v18;
      if (v11 || !v10)
      {
        v12 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v11, "safari_privacyPreservingDescription");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[_SFBrowserContentViewController setConfiguration:].cold.2((uint64_t)v9, v16, (uint64_t)v19, v12);
        }
      }
      else
      {
        -[_SFBrowserContentViewController _hostAppBundleId](self, "_hostAppBundleId");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = -[UIApplicationExtensionActivity initWithApplicationExtension:]([_SFApplicationExtensionActivity alloc], "initWithApplicationExtension:", v10);
        v14 = -[_SFApplicationExtensionActivity validateExtensionHasSameContainerAsHostApp:](v13, "validateExtensionHasSameContainerAsHostApp:", v12);
        self->_customActivityButtonIsValid = v14;
        if (v14)
        {
          objc_storeStrong((id *)&self->_customButtonUIActivity, v13);
        }
        else
        {
          v17 = WBS_LOG_CHANNEL_PREFIXExtensions();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            -[_SFBrowserContentViewController setConfiguration:].cold.1((uint64_t)v9, (uint64_t)v12, v17);
        }

      }
    }
    else
    {
      v15 = WBS_LOG_CHANNEL_PREFIXExtensions();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[_SFBrowserContentViewController setConfiguration:].cold.3();
    }
  }
  -[_SFBrowserContentViewController _updateUI](self, "_updateUI");

}

- (void)_updateUsesNarrowLayout
{
  void *v3;
  uint64_t IsCompactSizeClass;

  -[_SFBrowserContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  IsCompactSizeClass = _SFWidthIsCompactSizeClass();

  if (self->_usesNarrowLayout != (_DWORD)IsCompactSizeClass)
  {
    self->_usesNarrowLayout = IsCompactSizeClass;
    -[_SFNavigationBar setUsesNarrowLayout:](self->_navigationBar, "setUsesNarrowLayout:", IsCompactSizeClass);
    -[_SFBrowserContentViewController _setUpToolbar](self, "_setUpToolbar");
  }
}

- (void)_updateInterfaceFillsScreen
{
  void *v3;

  -[_SFBrowserContentViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_interfaceFillsScreen = objc_msgSend(v3, "verticalSizeClass") == 1;

  -[_SFBrowserView setNavigationBarBehavior:](self->_browserView, "setNavigationBarBehavior:", self->_interfaceFillsScreen);
}

- (void)_updateUsesLockdownStatusBar
{
  int v3;
  id v4;
  SFNavigationBarItem *navigationBarItem;
  void *v6;

  v3 = objc_msgSend(MEMORY[0x1E0D8AD68], "isLockdownModeEnabledForSafari");
  if (v3)
    v4 = objc_alloc_init(MEMORY[0x1E0D4ECC0]);
  else
    v4 = 0;
  -[_SFNavigationBar setLockdownStatusBar:](self->_navigationBar, "setLockdownStatusBar:", v4);
  if (v3)

  navigationBarItem = self->_navigationBarItem;
  -[_SFNavigationBar lockdownStatusBar](self->_navigationBar, "lockdownStatusBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNavigationBarItem:", navigationBarItem);

  -[_SFBrowserContentViewController _updateDynamicBarGeometry](self, "_updateDynamicBarGeometry");
}

- (id)_currentWebView
{
  if (self->_showingReader)
    -[_SFReaderViewController readerWebView](self->_readerViewController, "readerWebView");
  else
    -[_SFBrowserContentViewController webView](self, "webView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)_maximumHeightObscuredByBottomBar
{
  double v3;
  double v4;
  CGRect v6;

  if (!self->_usesNarrowLayout)
    return 0.0;
  -[_SFToolbar sizeThatFits:](self->_bottomToolbar, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v4 = v3;
  -[_SFBrowserContentViewController _sf_bottomUnsafeAreaFrameForToolbar](self, "_sf_bottomUnsafeAreaFrameForToolbar");
  return v4 + CGRectGetHeight(v6);
}

- (void)_updateDynamicBarGeometry
{
  _SFDynamicBarAnimator *dynamicBarAnimator;
  _QWORD v3[5];

  dynamicBarAnimator = self->_dynamicBarAnimator;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60___SFBrowserContentViewController__updateDynamicBarGeometry__block_invoke;
  v3[3] = &unk_1E4AC1080;
  v3[4] = self;
  -[_SFDynamicBarAnimator performBatchUpdates:](dynamicBarAnimator, "performBatchUpdates:", v3);
}

- (double)_offsetForDynamicBarAnimator
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;

  if (-[UIPanGestureRecognizer state](self->_hideNavigationBarGestureRecognizer, "state") == 2)
  {
    -[UIPanGestureRecognizer translationInView:](self->_hideNavigationBarGestureRecognizer, "translationInView:", self->_navigationBar);
    return -v3;
  }
  else
  {
    -[_SFBrowserContentViewController _currentWebView](self, "_currentWebView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentOffset");
    v4 = v7;

  }
  return v4;
}

- (double)dynamicBarAnimator:(id)a3 minimumTopBarHeightForOffset:(double)a4
{
  id v6;
  double v7;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;

  v6 = a3;
  if (self->_keepBarsMinimized || self->_alwaysShowTopBar)
  {
    v7 = 2.22507386e-308;
  }
  else
  {
    -[_SFBrowserView navigationBar](self->_browserView, "navigationBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "defaultHeight");
    v11 = v10;

    -[_SFBrowserContentViewController _currentWebView](self, "_currentWebView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scrollView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentInset");
    v7 = v11 - v14 - a4;

  }
  return v7;
}

- (double)_bottomToolbarHeight
{
  double v2;

  -[_SFToolbar sizeThatFits:](self->_bottomToolbar, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  return v2;
}

- (void)_setWebViewController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_SFBrowserView addWebViewController:](self->_browserView, "addWebViewController:");
  objc_msgSend(v6, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[_SFBrowserContentViewController _updateCurrentScrollViewInsets](self, "_updateCurrentScrollViewInsets");
  objc_msgSend(v4, "_setFindInteractionEnabled:", -[_SFBrowserContentViewController _onlyWantsWebAppShortcuts](self, "_onlyWantsWebAppShortcuts") ^ 1);
  -[_SFBrowserContentViewController becomeFirstResponder](self, "becomeFirstResponder");

}

- (WKWebView)webView
{
  void *v2;
  void *v3;

  -[_SFBrowserContentViewController webViewController](self, "webViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WKWebView *)v3;
}

- (void)_hideReaderAnimated:(BOOL)a3 deactivationMode:(unint64_t)a4
{
  -[_SFBrowserContentViewController _setShowingReader:deactivationMode:animated:](self, "_setShowingReader:deactivationMode:animated:", 0, a4, a3);
}

- (void)_showReaderAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (!-[_SFBrowserContentViewController isBlockedByScreenTime](self, "isBlockedByScreenTime"))
    -[_SFBrowserContentViewController _setShowingReader:deactivationMode:animated:](self, "_setShowingReader:deactivationMode:animated:", 1, 2, v3);
}

- (BOOL)_readerViewControllerNeedsSetUp
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[_SFBrowserContentViewController webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backForwardList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_readerViewController)
    v6 = objc_msgSend(v5, "isEqual:", self->_lastBackFowardListItemOnWhichReaderWasActivated) ^ 1;
  else
    LOBYTE(v6) = 1;

  return v6;
}

- (void)_setUpReaderViewController
{
  _SFReaderViewController *v3;
  _SFReaderViewController *readerViewController;

  if (-[_SFBrowserContentViewController _readerViewControllerNeedsSetUp](self, "_readerViewControllerNeedsSetUp"))
  {
    -[_SFBrowserContentViewController _makeReaderViewController](self, "_makeReaderViewController");
    v3 = (_SFReaderViewController *)objc_claimAutoreleasedReturnValue();
    readerViewController = self->_readerViewController;
    self->_readerViewController = v3;

  }
}

- (id)_makeReaderViewController
{
  void *v3;
  void *v4;
  void *v5;
  WKBackForwardListItem *v6;
  _SFReaderViewController *v7;
  void *v8;
  void *v9;
  WKBackForwardListItem *lastBackFowardListItemOnWhichReaderWasActivated;

  -[_SFBrowserContentViewController webViewController](self, "webViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backForwardList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentItem");
  v6 = (WKBackForwardListItem *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFReaderViewController initWithOriginalWebView:]([_SFReaderViewController alloc], "initWithOriginalWebView:", v4);
  -[_SFReaderViewController setDelegate:](v7, "setDelegate:", self);
  objc_msgSend(v4, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSupportsAdvancedPrivacyProtections:", -[_SFBrowserContentViewController supportsAdvancedPrivacyProtectionsForURL:](self, "supportsAdvancedPrivacyProtectionsForURL:", v8));

  -[_SFReaderViewController view](v7, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUpReaderWithReaderWebView:", v9);

  lastBackFowardListItemOnWhichReaderWasActivated = self->_lastBackFowardListItemOnWhichReaderWasActivated;
  self->_lastBackFowardListItemOnWhichReaderWasActivated = v6;

  return v7;
}

- (void)_setShowingReader:(BOOL)a3 deactivationMode:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _SFBrowserContentViewController *v30;
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t v34;
  double *v35;
  uint64_t v36;
  __n128 (*v37)(uint64_t, uint64_t);
  uint64_t (*v38)();
  void *v39;
  __int128 v40;
  __int128 v41;

  if (self->_showingReader != a3)
  {
    v5 = a5;
    v7 = a3;
    -[_SFBrowserContentViewController _setShowingReader:](self, "_setShowingReader:");
    -[_SFBrowserContentViewController _updateUI](self, "_updateUI");
    -[_SFBrowserContentViewController _updateUserActivitySoon](self, "_updateUserActivitySoon");
    -[_SFBrowserContentViewController pageFormatMenuController](self, "pageFormatMenuController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, 0);

    -[_SFBrowserContentViewController webViewController](self, "webViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dialogController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "owningTabWillClose");

    -[_SFBrowserView contentContainerView](self->_browserView, "contentContainerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "snapshotViewAfterScreenUpdates:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[_SFBrowserContentViewController _setUpReaderViewController](self, "_setUpReaderViewController");
      -[_SFBrowserContentViewController addChildViewController:](self, "addChildViewController:", self->_readerViewController);
      -[_SFReaderViewController didMoveToParentViewController:](self->_readerViewController, "didMoveToParentViewController:", self);
      -[_SFBrowserContentViewController _setWebViewController:](self, "_setWebViewController:", self->_readerViewController);
      if (!v5)
        goto LABEL_10;
    }
    else
    {
      -[_SFReaderViewController willMoveToParentViewController:](self->_readerViewController, "willMoveToParentViewController:", 0);
      -[_SFReaderViewController removeFromParentViewController](self->_readerViewController, "removeFromParentViewController");
      -[_SFBrowserContentViewController _setWebViewController:](self, "_setWebViewController:", v11);
      self->_lastReaderDeactivationMode = a4;
      if (!v5)
      {
LABEL_10:

        return;
      }
    }
    -[_SFBrowserView window](self->_browserView, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setUserInteractionEnabled:", 0);
    v34 = 0;
    v35 = (double *)&v34;
    v36 = 0x5012000000;
    v37 = __Block_byref_object_copy__10;
    v38 = __Block_byref_object_dispose__10;
    v39 = &unk_1A3CE3B2B;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(v14, "bounds");
    *(_QWORD *)&v40 = v16;
    *((_QWORD *)&v40 + 1) = v17;
    *(_QWORD *)&v41 = v18;
    *((_QWORD *)&v41 + 1) = v19;
    v20 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v21 = (void *)objc_msgSend(v20, "initWithFrame:", v35[6], v35[7], v35[8], v35[9]);
    objc_msgSend(v21, "setClipsToBounds:", 1);
    objc_msgSend(v21, "addSubview:", v14);
    -[_SFBrowserView contentContainerView](self->_browserView, "contentContainerView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_showingReader)
      -[_SFReaderViewController view](self->_readerViewController, "view");
    else
      objc_msgSend(v11, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "insertSubview:aboveSubview:", v21, v23);

    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __79___SFBrowserContentViewController__setShowingReader_deactivationMode_animated___block_invoke;
    v28[3] = &unk_1E4AC5EA0;
    v24 = v15;
    v33 = &v34;
    v29 = v24;
    v30 = self;
    v25 = v21;
    v31 = v25;
    v32 = v14;
    v26 = (void *)MEMORY[0x1A8598C40](v28);
    objc_msgSend(v11, "readerController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setUpReaderWebViewIfNeededAndPerformBlock:", v26);

    _Block_object_dispose(&v34, 8);
    goto LABEL_10;
  }
}

- (void)_setShowingReader:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  SafariShared::ReaderAvailabilityController *v6;
  WKProcessPool *v7;
  id v8;

  if (self->_showingReader != a3)
  {
    v3 = a3;
    self->_showingReader = a3;
    -[_SFBrowserContentViewController webViewController](self, "webViewController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "readerController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setReaderIsActive:", v3);

    if (v3)
    {
      -[_SFBrowserContentViewController processPool](self, "processPool");
      v6 = (SafariShared::ReaderAvailabilityController *)objc_claimAutoreleasedReturnValue();
      SafariShared::ReaderAvailabilityController::updateReaderOrTranslationLastActivated(v6, v7);

    }
  }
}

- (id)_requestBySettingAdvancedPrivacyProtectionsFlag:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_SFBrowserContentViewController supportsAdvancedPrivacyProtectionsForURL:](self, "supportsAdvancedPrivacyProtectionsForURL:", v5);

  objc_msgSend(v4, "safari_requestBySettingAdvancedPrivacyProtectionsFlagIsEnabled:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)loadRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  WBSWellKnownURLResponseCodeReliabilityChecker *v10;
  WBSWellKnownURLResponseCodeReliabilityChecker *wellKnownURLResponseCodeReliabilityChecker;
  WBSWellKnownURLResponseCodeReliabilityChecker *v12;
  void *v13;
  id v14;
  NSURL *v15;
  NSURL *originalRequestURL;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v4 = a3;
  self->_loadWasUserDriven = 1;
  -[_SFBrowserContentViewController _willBeginUserInitiatedNavigation](self, "_willBeginUserInitiatedNavigation");
  -[_SFBrowserContentViewController _requestBySettingAdvancedPrivacyProtectionsFlag:](self, "_requestBySettingAdvancedPrivacyProtectionsFlag:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_originalRequestURL
    || (objc_msgSend(v5, "URL"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "safari_isWellKnownChangePasswordURL"),
        v6,
        !v7))
  {
    -[_SFBrowserContentViewController webView](self, "webView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "loadRequest:", v5);

  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0D8ADD0]);
    objc_msgSend(v5, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (WBSWellKnownURLResponseCodeReliabilityChecker *)objc_msgSend(v8, "initWithURL:", v9);
    wellKnownURLResponseCodeReliabilityChecker = self->_wellKnownURLResponseCodeReliabilityChecker;
    self->_wellKnownURLResponseCodeReliabilityChecker = v10;

    objc_initWeak(&location, self);
    v12 = self->_wellKnownURLResponseCodeReliabilityChecker;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __47___SFBrowserContentViewController_loadRequest___block_invoke;
    v17[3] = &unk_1E4AC30C8;
    objc_copyWeak(&v19, &location);
    v18 = v5;
    -[WBSWellKnownURLResponseCodeReliabilityChecker checkReliabilityWithCompletion:](v12, "checkReliabilityWithCompletion:", v17);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  -[_SFPageLoadErrorController clearFailedRequest](self->_pageLoadErrorController, "clearFailedRequest");
  objc_msgSend(v5, "URL");
  v15 = (NSURL *)objc_claimAutoreleasedReturnValue();
  originalRequestURL = self->_originalRequestURL;
  self->_originalRequestURL = v15;

  -[_SFBrowserContentViewController becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)addTrustedEventAttribution:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXEventAttribution();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1A3B2D000, v5, OS_LOG_TYPE_INFO, "Giving valid UIEventAttribution to WebKit", v8, 2u);
  }
  -[_SFBrowserContentViewController webView](self, "webView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController _hostAppBundleId](self, "_hostAppBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setEphemeralUIEventAttribution:forApplicationWithBundleID:", v4, v7);

}

- (BOOL)isShowingErrorPage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;

  -[_SFBrowserContentViewController quickLookDocument](self, "quickLookDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[_SFBrowserContentViewController webView](self, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
  {
    objc_msgSend(v4, "_unreachableURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v7 = 1;
      goto LABEL_9;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "_safeBrowsingWarning");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

    if (!v3)
      goto LABEL_6;
  }
  else
  {
    v7 = 0;
    if (!v3)
    {
LABEL_6:
      v8 = 0;
LABEL_9:

    }
  }

  return v7;
}

- (BOOL)isSecure
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[_SFBrowserContentViewController webView](self, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v2, "_negotiatedLegacyTLS") & 1) != 0
    || !objc_msgSend(v2, "hasOnlySecureContent"))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v2, "URL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_committedURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isEqual:", v4);

  }
  return v5;
}

- (id)_EVOrganizationName
{
  NSString *v3;
  void *v4;
  NSString *v5;
  NSString *EVOrganizationName;

  if (-[_SFBrowserContentViewController isSecure](self, "isSecure"))
  {
    if (self->_EVOrganizationNameIsValid)
    {
      v3 = self->_EVOrganizationName;
    }
    else
    {
      self->_EVOrganizationNameIsValid = 1;
      -[_SFBrowserContentViewController webView](self, "webView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "evOrganizationName");
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      EVOrganizationName = self->_EVOrganizationName;
      self->_EVOrganizationName = v5;

      v3 = self->_EVOrganizationName;
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_invalidateEVOrganizationName
{
  NSString *EVOrganizationName;

  EVOrganizationName = self->_EVOrganizationName;
  self->_EVOrganizationName = 0;

  self->_EVOrganizationNameIsValid = 0;
}

- (void)_updateNavigationBar
{
  void *v3;
  void *v4;
  void *v5;
  _SFDownload *activeDownload;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *navigationBarItem;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  void *v19;
  _BOOL4 isShowingHTTPAuthenticationDialog;
  uint64_t v21;
  void *v22;
  char v23;
  _BOOL8 v24;
  uint64_t v25;
  SFNanoDomainContainerView *nanoDomainContainerView;
  void *v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;

  if (self->_navigationBarItem)
  {
    -[_SFBrowserContentViewController webViewController](self, "webViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "webView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[WBSURLSpoofingMitigator UIShouldReflectCommittedURLInsteadOfCurrentURL](self->_URLSpoofingMitigator, "UIShouldReflectCommittedURLInsteadOfCurrentURL"))objc_msgSend(v4, "_committedURL");
    else
      objc_msgSend(v4, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      activeDownload = self->_activeDownload;
      if (activeDownload)
      {
        -[_SFDownload sourceURL](activeDownload, "sourceURL");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }
    }
    objc_msgSend(v5, "safari_userVisibleStringConsideringLongURLs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      -[SFNavigationBarItem customPlaceholderText](self->_navigationBarItem, "customPlaceholderText");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    v30 = 0;
    objc_msgSend(v10, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 5, 0, &v30);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(v10, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 1, &v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_isShowingHTTPAuthenticationDialog)
    {
      _WBSLocalizedString();
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = (__CFString *)v12;
      -[SFNavigationBarItem setText:textWhenExpanded:startIndex:](self->_navigationBarItem, "setText:textWhenExpanded:startIndex:", v12, v12, 0x7FFFFFFFFFFFFFFFLL);
    }
    else if (objc_msgSend(v5, "safari_isDataURL"))
    {

      v11 = CFSTR("data:");
      -[SFNavigationBarItem setText:textWhenExpanded:startIndex:](self->_navigationBarItem, "setText:textWhenExpanded:startIndex:", CFSTR("data:"), CFSTR("data:"), 0x7FFFFFFFFFFFFFFFLL);
    }
    else
    {
      if (v29 >= v30)
        v13 = v29 - v30;
      else
        v13 = 0x7FFFFFFFFFFFFFFFLL;
      -[SFNavigationBarItem setText:textWhenExpanded:startIndex:](self->_navigationBarItem, "setText:textWhenExpanded:startIndex:", v28, v11, v13);
    }
    if (v28
      && -[_SFBrowserContentViewController isPageEligibileToShowNotSecureWarning](self, "isPageEligibileToShowNotSecureWarning"))
    {
      navigationBarItem = self->_navigationBarItem;
      v15 = objc_msgSend(v3, "hasFocusedInputFieldOnCurrentPage");
      v16 = 1;
    }
    else
    {
      navigationBarItem = self->_navigationBarItem;
      v15 = objc_msgSend(v3, "hasFocusedInputFieldOnCurrentPage");
      v16 = 0;
    }
    objc_msgSend(navigationBarItem, "setSecurityAnnotation:hasFocusedInputFieldOnCurrentPage:", v16, v15);
    if (self->_wasLoadedWithLockdownModeEnabled)
      v17 = 1;
    else
      v17 = 2;
    -[SFNavigationBarItem setLockdownModeAnnotation:](self->_navigationBarItem, "setLockdownModeAnnotation:", v17);
    v18 = !self->_isShowingHTTPAuthenticationDialog && -[_SFBrowserContentViewController isSecure](self, "isSecure");
    -[SFNavigationBarItem setShowsLockIcon:](self->_navigationBarItem, "setShowsLockIcon:", v18);
    v19 = self->_navigationBarItem;
    isShowingHTTPAuthenticationDialog = self->_isShowingHTTPAuthenticationDialog;
    if (self->_isShowingHTTPAuthenticationDialog)
    {
      v21 = 0;
    }
    else
    {
      objc_msgSend(v3, "readerController");
      navigationBarItem = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(navigationBarItem, "isReaderAvailable");
    }
    objc_msgSend(v19, "setShowsReaderButton:showsAvailabilityText:", v21, 0);
    if (!isShowingHTTPAuthenticationDialog)

    -[SFNavigationBarItem setShowsTranslationButton:showsAvailabilityText:](self->_navigationBarItem, "setShowsTranslationButton:showsAvailabilityText:", -[WBSTranslationContext detectionNotificationLevel](self->_translationContext, "detectionNotificationLevel") == 1, 0);
    -[SFNavigationBarItem setReaderButtonSelected:](self->_navigationBarItem, "setReaderButtonSelected:", self->_showingReader);
    objc_msgSend(v4, "URL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFNavigationBarItem setShowsStopReloadButtons:](self->_navigationBarItem, "setShowsStopReloadButtons:", v22 != 0);

    -[SFNavigationBarItem setStopReloadButtonShowsStop:](self->_navigationBarItem, "setStopReloadButtonShowsStop:", objc_msgSend(v3, "isLoading"));
    v23 = objc_opt_respondsToSelector();
    if ((v23 & 1) != 0)
    {
      objc_msgSend(v4, "_safeBrowsingWarning");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v19 != 0;
    }
    else
    {
      v24 = 0;
    }
    -[SFNavigationBarItem setOverrideBarStyleForSecurityWarning:](self->_navigationBarItem, "setOverrideBarStyleForSecurityWarning:", v24);
    if ((v23 & 1) != 0)

    -[SFNavigationBarItem setShowsPageFormatButton:](self->_navigationBarItem, "setShowsPageFormatButton:", -[_SFBrowserContentViewController _canShowPageFormatMenu](self, "_canShowPageFormatMenu"));
    v25 = -[SFNavigationBarItem showsLockIcon](self->_navigationBarItem, "showsLockIcon");
    nanoDomainContainerView = self->_nanoDomainContainerView;
    -[SFNavigationBarItem text](self->_navigationBarItem, "text");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFNanoDomainContainerView updateWithDomain:isSecure:showsNotSecureAnnotation:](nanoDomainContainerView, "updateWithDomain:isSecure:showsNotSecureAnnotation:", v27, v25, 0);

    -[_SFBrowserContentViewController didUpdateNavigationBarItem:](self, "didUpdateNavigationBarItem:", self->_navigationBarItem);
  }
}

- (BOOL)_canShowPageFormatMenu
{
  void *v2;
  void *v3;
  int v4;

  -[_SFBrowserContentViewController webView](self, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "safari_isHTTPFamilyURL")
    || (objc_msgSend(v2, "_isDisplayingPDF") & 1) != 0
    || (objc_msgSend(v2, "_isDisplayingStandaloneImageDocument") & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = objc_msgSend(v2, "_isDisplayingStandaloneMediaDocument") ^ 1;
  }

  return v4;
}

- (void)_updatePreviewLoadingUI
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *activeDownload;
  _SFBrowserView *browserView;
  void *v9;
  id v10;
  id v11;

  -[_SFBrowserView previewHeader](self->_browserView, "previewHeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[WBSURLSpoofingMitigator UIShouldReflectCommittedURLInsteadOfCurrentURL](self->_URLSpoofingMitigator, "UIShouldReflectCommittedURLInsteadOfCurrentURL");
    -[_SFBrowserContentViewController webView](self, "webView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v5;
    if (v4)
      objc_msgSend(v5, "_committedURL");
    else
      objc_msgSend(v5, "URL");
    v6 = objc_claimAutoreleasedReturnValue();

    activeDownload = (void *)v6;
    if (!v6)
    {
      activeDownload = self->_activeDownload;
      if (activeDownload)
      {
        objc_msgSend(activeDownload, "sourceURL");
        activeDownload = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    browserView = self->_browserView;
    v11 = activeDownload;
    objc_msgSend(activeDownload, "safari_userVisibleString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFBrowserView updatePreviewHeaderWithURLString:](browserView, "updatePreviewHeaderWithURLString:", v9);

  }
}

- (void)_updateBarItems
{
  void *v3;
  _SFBarManager *barManager;
  id v5;
  _QWORD v6[5];
  id v7;

  -[_SFBrowserContentViewController webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  barManager = self->_barManager;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50___SFBrowserContentViewController__updateBarItems__block_invoke;
  v6[3] = &unk_1E4AC0590;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  -[_SFBarManager performCoalescedUpdates:](barManager, "performCoalescedUpdates:", v6);

}

- (void)_updateUI
{
  id v3;

  -[_SFBrowserContentViewController _updateNavigationBar](self, "_updateNavigationBar");
  -[_SFBrowserContentViewController _updateBarItems](self, "_updateBarItems");
  -[_SFBrowserContentViewController _updatePreviewLoadingUI](self, "_updatePreviewLoadingUI");
  -[_SFBrowserContentViewController _updateStatusBarStyleForced:](self, "_updateStatusBarStyleForced:", 0);
  -[_SFBrowserContentViewController webView](self, "webView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController setRemoteSwipeGestureEnabled:](self, "setRemoteSwipeGestureEnabled:", objc_msgSend(v3, "canGoBack") ^ 1);

}

- (void)setRemoteSwipeGestureEnabled:(BOOL)a3
{
  if (self->_remoteSwipeGestureEnabled != a3)
  {
    self->_remoteSwipeGestureEnabled = a3;
    -[_SFBrowserContentViewController _updateRemoteSwipeGestureState](self, "_updateRemoteSwipeGestureState");
  }
}

- (void)_showGenericDownloadAlert
{
  -[_SFPageLoadErrorController addDownloadFailedAlertWithDescription:](self->_pageLoadErrorController, "addDownloadFailedAlertWithDescription:", 0);
}

- (double)_crashBannerDraggingOffsetForContentOffset:(CGPoint)a3
{
  double y;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  CGRect v17;

  y = a3.y;
  v5 = -[_SFBrowserView navigationBarBehavior](self->_browserView, "navigationBarBehavior", a3.x);
  -[_SFNavigationBar maximumHeight](self->_navigationBar, "maximumHeight");
  v7 = v6;
  v8 = 0.0;
  if (!v5)
  {
    -[_SFNavigationBar minimumHeight](self->_navigationBar, "minimumHeight");
    v8 = v9;
  }
  -[_SFBrowserView currentWebView](self->_browserView, "currentWebView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "adjustedContentInset");
  v13 = v12;
  -[_SFBrowserView pinnableBanner](self->_browserView, "pinnableBanner");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v15 = v7 - v8 - v13 + CGRectGetHeight(v17);

  if (v15 <= y)
    return y;
  else
    return v15;
}

- (void)_updateCrashBannerOffset
{
  void *v3;
  double v4;
  double v5;
  double crashBannerDraggingOffset;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  CGRect v12;

  -[_SFBrowserView crashBanner](self->_browserView, "crashBanner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v3;
  if (self->_showingCrashBanner)
  {
    -[_SFBrowserView setCrashBannerOffset:](self->_browserView, "setCrashBannerOffset:", 0.0);
    if (self->_scrollViewIsDragging)
    {
      -[_SFBrowserView crashBannerOffset](self->_browserView, "crashBannerOffset");
      v5 = v4;
      crashBannerDraggingOffset = self->_crashBannerDraggingOffset;
      -[_SFBrowserContentViewController _currentWebView](self, "_currentWebView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "scrollView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "contentOffset");
      if (v5 >= crashBannerDraggingOffset - v9)
        v10 = crashBannerDraggingOffset - v9;
      else
        v10 = v5;
      -[_SFBrowserView setCrashBannerOffset:](self->_browserView, "setCrashBannerOffset:", v10);

    }
  }
  else
  {
    objc_msgSend(v3, "bounds");
    -[_SFBrowserView setCrashBannerOffset:](self->_browserView, "setCrashBannerOffset:", -CGRectGetHeight(v12));
  }

}

- (void)_updatePinnableBannerOffset
{
  void *v3;
  double Height;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double MaxY;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  -[_SFBrowserView pinnableBanner](self->_browserView, "pinnableBanner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && self->_showingPinnableBanner)
  {
    v15 = v3;
    objc_msgSend(v3, "frame");
    Height = CGRectGetHeight(v16);
    if (self->_showingCrashBanner)
    {
      -[_SFBrowserView crashBanner](self->_browserView, "crashBanner");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "frame");
      v6 = CGRectGetHeight(v17);
      -[_SFBrowserView crashBannerOffset](self->_browserView, "crashBannerOffset");
      v8 = v6 + v7 + 0.0;

    }
    else
    {
      v8 = 0.0;
    }
    if (self->_showingPinnableBanner)
      v9 = Height;
    else
      v9 = -0.0;
    -[_SFNavigationBar bounds](self->_navigationBar, "bounds");
    MaxY = CGRectGetMaxY(v18);
    -[_SFBrowserContentViewController _currentWebView](self, "_currentWebView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scrollView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "convertPoint:fromView:", self->_navigationBar, 0.0, v8 + v9 + MaxY);

    -[_SFBrowserContentViewController _currentWebView](self, "_currentWebView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scrollView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contentOffset");
    -[_SFBrowserView setPinnableBannerOffset:](self->_browserView, "setPinnableBannerOffset:");

    v3 = v15;
  }

}

- (void)_hideCrashBanner
{
  -[_SFBrowserContentViewController _setShowingCrashBanner:animated:](self, "_setShowingCrashBanner:animated:", 0, 1);
}

- (void)_updatePinnableBannerFrame
{
  void *v3;
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
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;

  -[_SFBrowserView pinnableBanner](self->_browserView, "pinnableBanner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && self->_showingPinnableBanner)
  {
    v22 = v3;
    -[_SFBrowserView currentWebView](self->_browserView, "currentWebView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFBrowserContentViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutMargins");
    objc_msgSend(v22, "setLayoutMargins:");

    objc_msgSend(v4, "scrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;

    objc_msgSend(v22, "sizeThatFits:", v10, v12);
    objc_msgSend(v22, "setFrame:", v8, 0.0, v13, v14);
    -[_SFBrowserView layoutIfNeeded](self->_browserView, "layoutIfNeeded");
    -[_SFBrowserContentViewController _updatePinnableBannerOffset](self, "_updatePinnableBannerOffset");
    -[_SFBrowserContentViewController _updateBarTheme](self, "_updateBarTheme");
    -[_SFBrowserContentViewController _updateCurrentScrollViewInsets](self, "_updateCurrentScrollViewInsets");
    objc_msgSend(v4, "scrollView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentOffset");
    v17 = v16;
    v19 = v18;
    objc_msgSend(v15, "adjustedContentInset");
    if (v19 <= -v20)
      v21 = -v20;
    else
      v21 = v19;
    objc_msgSend(v15, "setContentOffset:", v17, v21);

    v3 = v22;
  }

}

- (BOOL)_updateAppInfoOverlayForBanner:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  objc_msgSend(v4, "overlayProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserView currentWebView](self->_browserView, "currentWebView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(v5, "hideOverlayAnimated:", 0);
    goto LABEL_5;
  }
  if (!objc_msgSend(v5, "isAvailable"))
  {
LABEL_5:
    -[_SFBrowserView setAppInfoOverlay:](self->_browserView, "setAppInfoOverlay:", 0);
    objc_msgSend(v5, "setDelegate:", 0);
    v11 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v5, "setDelegate:", self);
  -[_SFBrowserContentViewController webViewController](self, "webViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "showOverlayInScrollView:viewController:", v7, v8);

  -[_SFBrowserView setPinnableBanner:](self->_browserView, "setPinnableBanner:", v4);
  objc_msgSend(v5, "overlayViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserView setAppInfoOverlay:](self->_browserView, "setAppInfoOverlay:", v10);

  v11 = 1;
LABEL_6:

  return v11;
}

- (void)_setShowingPinnableBanner:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  double MaxY;
  _SFNavigationBar *navigationBar;
  double v12;
  double v13;
  double v14;
  double v15;
  _QWORD v16[5];
  _QWORD v17[5];
  CGRect v18;
  CGRect v19;

  v4 = a4;
  v6 = a3;
  if (!-[_SFBrowserContentViewController _updateAppInfoOverlayForBanner:](self, "_updateAppInfoOverlayForBanner:", v6))
  {
    v7 = v6 != 0;
    if (self->_showingPinnableBanner != v7)
    {
      self->_showingPinnableBanner = v7;
      if (v6)
      {
        -[_SFBrowserView setPinnableBanner:](self->_browserView, "setPinnableBanner:", v6);
        -[_SFBrowserContentViewController _updatePinnableBannerFrame](self, "_updatePinnableBannerFrame");
        -[_SFBrowserView currentWebView](self->_browserView, "currentWebView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "scrollView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "frame");
        MaxY = CGRectGetMaxY(v18);
        navigationBar = self->_navigationBar;
        -[_SFNavigationBar bounds](navigationBar, "bounds");
        -[_SFNavigationBar convertPoint:toView:](navigationBar, "convertPoint:toView:", v9, 0.0, CGRectGetMaxY(v19));
        if (MaxY >= v12 && (objc_msgSend(v6, "isInitiallyBehindNavigationBar") & 1) == 0)
        {
          objc_msgSend(v9, "contentOffset");
          v14 = v13;
          objc_msgSend(v9, "adjustedContentInset");
          objc_msgSend(v9, "setContentOffset:", v14, -v15);
        }

      }
      else
      {
        v16[4] = self;
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __70___SFBrowserContentViewController__setShowingPinnableBanner_animated___block_invoke;
        v17[3] = &unk_1E4AC1080;
        v17[4] = self;
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __70___SFBrowserContentViewController__setShowingPinnableBanner_animated___block_invoke_2;
        v16[3] = &unk_1E4AC5E78;
        objc_msgSend(MEMORY[0x1E0DC3F10], "sf_animate:usingDefaultTimingWithOptions:animations:completion:", v4, 2, v17, v16);
      }
    }
  }

}

- (void)_setShowingCrashBanner:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  BOOL v8;
  id v9;
  id v10;

  v4 = a4;
  v5 = a3;
  -[_SFBrowserView crashBanner](self->_browserView, "crashBanner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  v8 = self->_showingCrashBanner != v5 || v7 == 0;
  if (v8 || objc_msgSend(v7, "messageType"))
  {
    if (v5)
      v9 = objc_alloc_init(MEMORY[0x1E0D4EC48]);
    else
      v9 = 0;
    -[_SFBrowserContentViewController _showCrashBanner:animated:](self, "_showCrashBanner:animated:", v9, v4);

  }
}

- (void)_showCrashBanner:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
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
  uint64_t v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[5];
  id v25;

  v4 = a4;
  v6 = a3;
  -[_SFBrowserView crashBanner](self->_browserView, "crashBanner");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 && v7)
  {
    v9 = objc_msgSend(v6, "messageType");
    if (v9 == objc_msgSend(v8, "messageType"))
      goto LABEL_12;
    goto LABEL_8;
  }
  if (v6 && !v7)
  {
    _SFBackdropGroupNameForOwner();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackdropGroupName:", v10);

    objc_msgSend(v6, "closeButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__hideCrashBanner, 64);

    -[_SFBrowserView setCrashBanner:](self->_browserView, "setCrashBanner:", v6);
    -[_SFBrowserView bounds](self->_browserView, "bounds");
    v13 = v12;
    v15 = v14;
    objc_msgSend(v6, "sizeThatFits:", v16, v17);
    objc_msgSend(v6, "setFrame:", v13, v15, v18, v19);
    -[_SFBrowserContentViewController _updateCrashBannerOffset](self, "_updateCrashBannerOffset");
    -[_SFBrowserView layoutIfNeeded](self->_browserView, "layoutIfNeeded");
    -[_SFBrowserContentViewController _updateBarTheme](self, "_updateBarTheme");
LABEL_8:
    self->_showingCrashBanner = v6 != 0;
LABEL_10:
    -[_SFBrowserView navigationBar](self->_browserView, "navigationBar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setSuppressesBlur:", 0);

    goto LABEL_11;
  }
  self->_showingCrashBanner = v6 != 0;
  if (v6)
    goto LABEL_10;
LABEL_11:
  v21 = MEMORY[0x1E0C809B0];
  v22 = (void *)MEMORY[0x1E0DC3F10];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __61___SFBrowserContentViewController__showCrashBanner_animated___block_invoke;
  v24[3] = &unk_1E4AC0590;
  v24[4] = self;
  v25 = v6;
  v23[0] = v21;
  v23[1] = 3221225472;
  v23[2] = __61___SFBrowserContentViewController__showCrashBanner_animated___block_invoke_2;
  v23[3] = &unk_1E4AC5E78;
  v23[4] = self;
  objc_msgSend(v22, "sf_animate:usingDefaultTimingWithOptions:animations:completion:", v4, 2, v24, v23);

LABEL_12:
}

- (BOOL)_notifyInitialLoadDidFinish:(BOOL)a3
{
  return 1;
}

- (void)_initialLoadFinishedWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  NSURL *originalRequestURL;

  v3 = a3;
  originalRequestURL = self->_originalRequestURL;
  self->_originalRequestURL = 0;

  if (!self->_didNotifyInitialLoadFinish)
  {
    if (-[_SFBrowserContentViewController _notifyInitialLoadDidFinish:](self, "_notifyInitialLoadDidFinish:", v3))
      self->_didNotifyInitialLoadFinish = 1;
  }
}

- (void)_fetchActivityViewControllerInfoForURL:(id)a3 title:(id)a4 completion:(id)a5
{
  (*((void (**)(id, _QWORD, _QWORD))a5 + 2))(a5, 0, 0);
}

- (BOOL)canPrint
{
  return 0;
}

- (id)_applicationPayloadForOpeningInSafari
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[_SFBrowserContentViewController webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sessionState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_showingReader);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D4F218]);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D4F220]);
  v8 = (void *)objc_msgSend(v6, "copy");

  return v8;
}

- (void)_openCurrentURLInSafari
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[_SFBrowserContentViewController _applicationPayloadForOpeningInSafari](self, "_applicationPayloadForOpeningInSafari");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController webView](self, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CA57D8];
  v9[0] = *MEMORY[0x1E0CA57F8];
  v9[1] = v7;
  v10[0] = v3;
  v10[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_sf_openURL:withOptions:completionHandler:", v6, v8, 0);

}

- (void)_updatePageZoomWithPreference
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[_SFPerSitePreferencesVendor pageZoomPreferenceManager](self->_perSitePreferencesVendor, "pageZoomPreferenceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController webView](self, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64___SFBrowserContentViewController__updatePageZoomWithPreference__block_invoke;
  v6[3] = &unk_1E4AC5F18;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "getPageZoomFactorForURL:usingBlock:", v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_increasePageZoomSetting
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id location;

  -[_SFBrowserContentViewController webViewController](self, "webViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_showingReader)
  {
    objc_msgSend(v3, "readerController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "canIncreaseReaderTextSize");

    if (v6)
    {
      objc_msgSend(v4, "readerController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "increaseReaderTextSize");

    }
  }
  else
  {
    objc_initWeak(&location, self);
    -[_SFPerSitePreferencesVendor pageZoomPreferenceManager](self->_perSitePreferencesVendor, "pageZoomPreferenceManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "webView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59___SFBrowserContentViewController__increasePageZoomSetting__block_invoke;
    v11[3] = &unk_1E4AC5F40;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v8, "zoomInOnURL:completionHandler:", v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (void)_decreasePageZoomSetting
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id location;

  -[_SFBrowserContentViewController webViewController](self, "webViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_showingReader)
  {
    objc_msgSend(v3, "readerController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "canDecreaseReaderTextSize");

    if (v6)
    {
      objc_msgSend(v4, "readerController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "decreaseReaderTextSize");

    }
  }
  else
  {
    objc_initWeak(&location, self);
    -[_SFPerSitePreferencesVendor pageZoomPreferenceManager](self->_perSitePreferencesVendor, "pageZoomPreferenceManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "webView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59___SFBrowserContentViewController__decreasePageZoomSetting__block_invoke;
    v11[3] = &unk_1E4AC5F40;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v8, "zoomOutOnURL:completionHandler:", v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (void)_resetPageZoomSetting
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  -[_SFBrowserContentViewController webViewController](self, "webViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_showingReader)
  {
    objc_msgSend(v3, "readerController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resetReaderTextSize");

  }
  else
  {
    objc_initWeak(&location, self);
    -[_SFPerSitePreferencesVendor pageZoomPreferenceManager](self->_perSitePreferencesVendor, "pageZoomPreferenceManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "webView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56___SFBrowserContentViewController__resetPageZoomSetting__block_invoke;
    v9[3] = &unk_1E4AC5F40;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v6, "resetZoomLevelOnURL:completionHandler:", v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

- (void)_invokeCustomActivity
{
  void *v3;
  void *v4;
  int v5;
  _QWORD v6[5];

  -[UIApplicationExtensionActivity applicationExtension](self->_customButtonUIActivity, "applicationExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionPointIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.share-services"));

  if (v5)
    getSLComposeViewControllerClass();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56___SFBrowserContentViewController__invokeCustomActivity__block_invoke;
  v6[3] = &unk_1E4AC5F90;
  v6[4] = self;
  -[_SFBrowserContentViewController _fetchSharingURLWithCompletionHandler:](self, "_fetchSharingURLWithCompletionHandler:", v6);
}

- (void)_showQuickLookDocumentView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_SFBrowserContentViewController webView](self, "webView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setZoomScale:", 1.0);

  objc_msgSend(v6, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setZoomEnabled:", 0);

  -[SFQuickLookDocumentController documentView](self->_quickLookDocumentController, "documentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserView setQuickLookDocumentView:](self->_browserView, "setQuickLookDocumentView:", v5);

  objc_msgSend(v6, "setHidden:", 1);
}

- (void)_hideQuickLookDocumentView
{
  void *v3;
  id v4;

  -[_SFBrowserView setQuickLookDocumentView:](self->_browserView, "setQuickLookDocumentView:", 0);
  -[_SFBrowserContentViewController webView](self, "webView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);
  objc_msgSend(v4, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setZoomEnabled:", 1);

}

- (WBSTranslationContext)translationContext
{
  WBSTranslationContext *v3;

  if (-[_SFBrowserContentViewController _canTranslateWebpages](self, "_canTranslateWebpages"))
    v3 = self->_translationContext;
  else
    v3 = 0;
  return v3;
}

- (BOOL)_canTranslateWebpages
{
  return (unint64_t)(-[_SFBrowserContentViewController _persona](self, "_persona") - 5) < 0xFFFFFFFFFFFFFFFELL;
}

- (id)dataForQuickLookDocument:(id)a3
{
  void *v3;
  void *v4;

  -[_SFBrowserContentViewController webView](self, "webView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_dataForDisplayedPDF");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)suggestedFileNameForQuickLookDocument:(id)a3
{
  void *v3;
  void *v4;

  -[_SFBrowserContentViewController webView](self, "webView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sf_suggestedFilename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)suggestedFileExtensionForQuickLookDocument:(id)a3
{
  return CFSTR("pdf");
}

- (id)quickLookDocumentForCurrentBackForwardListItem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[_SFBrowserContentViewController webView](self, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backForwardList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_sf_quickLookDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setQuickLookDocumentForCurrentBackForwardListItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_SFBrowserContentViewController webView](self, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backForwardList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sf_setQuickLookDocument:", v7);

}

- (id)quickLookDocument
{
  SFQuickLookDocument *quickLookDocument;
  SFQuickLookDocument *v4;
  SFQuickLookDocument *v6;
  SFQuickLookDocument *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  SFQuickLookDocument *v12;
  SFQuickLookDocument *v13;
  SFQuickLookDocument *v14;
  SFQuickLookDocument *v15;
  void *v16;

  quickLookDocument = self->_quickLookDocument;
  if (!self->_quickLookDocumentCheckCompleted && quickLookDocument == 0)
  {
    self->_quickLookDocumentCheckCompleted = 1;
    -[SFQuickLookDocumentWriter quickLookDocument](self->_quickLookDocumentWriter, "quickLookDocument");
    v6 = (SFQuickLookDocument *)objc_claimAutoreleasedReturnValue();
    v7 = self->_quickLookDocument;
    self->_quickLookDocument = v6;

    if (self->_quickLookDocument)
      -[_SFBrowserContentViewController setQuickLookDocumentForCurrentBackForwardListItem:](self, "setQuickLookDocumentForCurrentBackForwardListItem:");
    -[_SFBrowserContentViewController webView](self, "webView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!self->_quickLookDocument)
    {
      if (objc_msgSend(v8, "_isDisplayingPDF"))
      {
        objc_msgSend(v9, "_sf_suggestedFilename");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_alloc(MEMORY[0x1E0D4ED18]);
        v12 = (SFQuickLookDocument *)objc_msgSend(v11, "initWithFileName:mimeType:uti:needsQuickLookDocumentView:", v10, 0, *MEMORY[0x1E0CA5C00], 0);
        v13 = self->_quickLookDocument;
        self->_quickLookDocument = v12;

      }
      if (!self->_quickLookDocument)
      {
        -[_SFBrowserContentViewController quickLookDocumentForCurrentBackForwardListItem](self, "quickLookDocumentForCurrentBackForwardListItem");
        v14 = (SFQuickLookDocument *)objc_claimAutoreleasedReturnValue();
        v15 = self->_quickLookDocument;
        self->_quickLookDocument = v14;

      }
    }
    objc_msgSend(v9, "URL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFQuickLookDocument setSourceURL:](self->_quickLookDocument, "setSourceURL:", v16);

    -[SFQuickLookDocument setDocumentSource:](self->_quickLookDocument, "setDocumentSource:", self);
    v4 = self->_quickLookDocument;

  }
  else
  {
    v4 = quickLookDocument;
  }
  return v4;
}

- (void)webViewController:(id)a3 didStartProvisionalNavigation:(id)a4
{
  SFQuickLookDocumentWriter *quickLookDocumentWriter;
  SFQuickLookDocument *quickLookDocument;
  void *v7;
  void *v8;
  NSError *lastLoadErrorForFormatMenu;
  SFPinnableBanner *pinnableBannerPendingFirstPaint;
  void *v11;
  WBSTranslationContext *v12;
  WBSTranslationContext *translationContext;
  void *v14;
  id v15;

  v15 = a3;
  -[_SFCalendarEventDetector cancelCheckForConfirmationPage](self->_calendarEventDetector, "cancelCheckForConfirmationPage");
  -[WBSURLSpoofingMitigator didStartProvisionalNavigationWithUserInitiatedAction:](self->_URLSpoofingMitigator, "didStartProvisionalNavigationWithUserInitiatedAction:", self->_lastUserInitiatedAction);
  quickLookDocumentWriter = self->_quickLookDocumentWriter;
  self->_quickLookDocumentWriter = 0;

  quickLookDocument = self->_quickLookDocument;
  self->_quickLookDocument = 0;

  objc_msgSend(v15, "webView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_unreachableURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    lastLoadErrorForFormatMenu = self->_lastLoadErrorForFormatMenu;
    self->_lastLoadErrorForFormatMenu = 0;

  }
  pinnableBannerPendingFirstPaint = self->_pinnableBannerPendingFirstPaint;
  self->_pinnableBannerPendingFirstPaint = 0;

  -[_SFBrowserContentViewController webView](self, "webView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_translationContext)
  {
    objc_msgSend(MEMORY[0x1E0D8AD58], "translationContextWithWebView:delegate:", v11, self);
    v12 = (WBSTranslationContext *)objc_claimAutoreleasedReturnValue();
    translationContext = self->_translationContext;
    self->_translationContext = v12;

    -[WBSTranslationContext setFluidProgressController:](self->_translationContext, "setFluidProgressController:", self->_fluidProgressController);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__translationContextStateDidChange_, *MEMORY[0x1E0D8B6D0], self->_translationContext);

  }
  -[_SFBrowserContentViewController _updateUserActivitySoon](self, "_updateUserActivitySoon");

}

- (void)webViewController:(id)a3 authenticationChallenge:(id)a4 shouldAllowLegacyTLS:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _SFPageLoadErrorController *pageLoadErrorController;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  -[_SFBrowserContentViewController legacyTLSHostManager](self, "legacyTLSHostManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "protectionSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "host");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isLegacyTLSAllowedForHost:", v12);

  if ((v13 & 1) == 0)
  {
    pageLoadErrorController = self->_pageLoadErrorController;
    objc_msgSend(v8, "protectionSpace");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "safari_URL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "webView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFPageLoadErrorController handleLegacyTLSWithFailingURL:clickThroughURL:authenticationChallenge:](pageLoadErrorController, "handleLegacyTLSWithFailingURL:clickThroughURL:authenticationChallenge:", v16, v18, v8);

  }
  v9[2](v9, v13);

}

- (void)authenticationChallengeDidNegotiateModernTLS:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_SFBrowserContentViewController legacyTLSHostManager](self, "legacyTLSHostManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearLegacyTLSForHostIfPresent:", v5);

}

- (void)webViewController:(id)a3 didCommitNavigation:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSString *suggestedFilenameForNextCommit;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _SFDownload *downloadToShowInQuickLook;
  SFQuickLookDocument *v15;
  SFQuickLookDocument *quickLookDocument;
  _SFDownload *v17;
  SFQuickLookDocumentController *quickLookDocumentController;
  SFQuickLookDocumentController *v19;
  SFQuickLookDocumentController *v20;
  SFQuickLookDocument *v21;
  SFQuickLookDocumentController *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v6 = a4;
  -[_SFReloadOptionsController setEffectiveContentMode:](self->_reloadOptionsController, "setEffectiveContentMode:", objc_msgSend(v6, "effectiveContentMode"));
  objc_msgSend(v26, "webView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (self->_suggestedFilenameForNextCommit)
  {
    objc_msgSend(v7, "setSuggestedFilenameForCurrentBackForwardListItem:");
    suggestedFilenameForNextCommit = self->_suggestedFilenameForNextCommit;
    self->_suggestedFilenameForNextCommit = 0;

  }
  -[_SFBrowserContentViewController sfScribbleController](self, "sfScribbleController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "host");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateUserDefinedContentBlockerWithHost:", v13);

  self->_wasLoadedWithLockdownModeEnabled = self->_pendingNavigationWillLoadWithLockdownModeEnabled;
  -[WBSURLSpoofingMitigator didCommitNavigation](self->_URLSpoofingMitigator, "didCommitNavigation");
  self->_externalAppRedirectState = 0;
  -[_SFBrowserContentViewController _setShowingPinnableBanner:animated:](self, "_setShowingPinnableBanner:animated:", 0, 0);
  -[_SFBrowserContentViewController _hideReaderAnimated:deactivationMode:](self, "_hideReaderAnimated:deactivationMode:", 1, 0);
  -[_SFBrowserContentViewController _invalidateEVOrganizationName](self, "_invalidateEVOrganizationName");
  -[_SFBrowserContentViewController _updateUI](self, "_updateUI");
  -[_SFBrowserContentViewController _updateUserActivitySoon](self, "_updateUserActivitySoon");
  -[WBSFluidProgressController progressStateSourceDidCommitLoad:loadingSingleResource:](self->_fluidProgressController, "progressStateSourceDidCommitLoad:loadingSingleResource:", self, 0);
  if (v6 || -[_SFBrowserContentViewController _persona](self, "_persona") != 3)
    -[_SFPageLoadErrorController clearFailedRequest](self->_pageLoadErrorController, "clearFailedRequest");
  -[_SFBrowserContentViewController _updatePageZoomWithPreference](self, "_updatePageZoomWithPreference");
  downloadToShowInQuickLook = self->_downloadToShowInQuickLook;
  if (downloadToShowInQuickLook)
  {
    -[_SFDownload quickLookDocument](downloadToShowInQuickLook, "quickLookDocument");
    v15 = (SFQuickLookDocument *)objc_claimAutoreleasedReturnValue();
    quickLookDocument = self->_quickLookDocument;
    self->_quickLookDocument = v15;

    v17 = self->_downloadToShowInQuickLook;
    self->_downloadToShowInQuickLook = 0;

    quickLookDocumentController = self->_quickLookDocumentController;
    if (!quickLookDocumentController)
    {
      v19 = (SFQuickLookDocumentController *)objc_alloc_init(MEMORY[0x1E0D4ED20]);
      v20 = self->_quickLookDocumentController;
      self->_quickLookDocumentController = v19;

      -[_SFBrowserContentViewController _showQuickLookDocumentView](self, "_showQuickLookDocumentView");
      quickLookDocumentController = self->_quickLookDocumentController;
    }
    -[SFQuickLookDocumentController updateWithQuickLookDocument:](quickLookDocumentController, "updateWithQuickLookDocument:", self->_quickLookDocument);
  }
  else
  {
    v21 = self->_quickLookDocument;
    self->_quickLookDocument = 0;

    self->_quickLookDocumentCheckCompleted = 0;
    if (self->_quickLookDocumentController)
    {
      -[_SFBrowserContentViewController _hideQuickLookDocumentView](self, "_hideQuickLookDocumentView");
      v22 = self->_quickLookDocumentController;
      self->_quickLookDocumentController = 0;

    }
  }
  -[_SFBrowserContentViewController _checkForAppLink](self, "_checkForAppLink");
  -[_SFBrowserContentViewController translationContext](self, "translationContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "owningWebViewDidCommitNavigationWithURL:completionHandler:", v24, 0);

  -[_SFBrowserContentViewController assistantController](self, "assistantController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "clearAssistantResult");

}

- (void)webViewController:(id)a3 didFinishNavigation:(id)a4
{
  _SFReloadOptionsController *reloadOptionsController;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[_SFBrowserContentViewController _updateUI](self, "_updateUI");
  -[WBSFluidProgressController finishFluidProgressWithProgressStateSource:](self->_fluidProgressController, "finishFluidProgressWithProgressStateSource:", self);
  -[_SFPageLoadErrorController scheduleResetCrashCount](self->_pageLoadErrorController, "scheduleResetCrashCount");
  -[_SFCalendarEventDetector containsCalendarEventForPageWithSchemaOrgMarkup:](self->_calendarEventDetector, "containsCalendarEventForPageWithSchemaOrgMarkup:", 0);
  -[_SFBrowserContentViewController _initialLoadFinishedWithSuccess:](self, "_initialLoadFinishedWithSuccess:", 1);
  self->_shouldDismissReaderInReponseToSameDocumentNavigation = 0;
  self->_canOpenDownloadForInitialLoad = 0;
  -[_SFBrowserContentViewController _updateUserActivitySoon](self, "_updateUserActivitySoon");
  if (-[_SFBrowserContentViewController _persona](self, "_persona") == 1)
  {
    reloadOptionsController = self->_reloadOptionsController;
    objc_msgSend(v13, "webView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFReloadOptionsController logCompletedPageloadToDifferentialPrivacy:](reloadOptionsController, "logCompletedPageloadToDifferentialPrivacy:", v7);

  }
  -[_SFBrowserContentViewController _updateDigitalHealthTracking](self, "_updateDigitalHealthTracking");
  objc_msgSend(MEMORY[0x1E0D8A818], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController webView](self, "webView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "host");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController webView](self, "webView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clearCertificateBypassesForHostIfNecessary:withTrust:", v11, objc_msgSend(v12, "serverTrust"));

}

- (void)webViewController:(id)a3 didFinishDocumentLoadForNavigation:(id)a4
{
  void *v5;
  id v6;

  -[_SFBrowserContentViewController webView](self, "webView", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_committedURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController _didResolveDestinationURL:pendingAppLinkCheck:](self, "_didResolveDestinationURL:pendingAppLinkCheck:", v5, 0);

}

- (void)_checkForAppLink
{
  void *v3;
  void *v4;
  WKBackForwardListItem *v5;
  void *v6;
  WKBackForwardListItem *v7;
  WKBackForwardListItem *backForwardListItemForCurrentAppLinkBannerCheck;
  BOOL shouldRevealAppLinkBannerForNextCommit;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  BOOL v16;
  id location;

  if (-[_SFBrowserContentViewController _shouldAllowUniversalLinkBanner](self, "_shouldAllowUniversalLinkBanner"))
  {
    -[_SFBrowserContentViewController webView](self, "webView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "safari_isHTTPFamilyURL")
      && !-[_SFBrowserContentViewController isShowingErrorPage](self, "isShowingErrorPage"))
    {
      objc_msgSend(v3, "backForwardList");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentItem");
      v7 = (WKBackForwardListItem *)objc_claimAutoreleasedReturnValue();
      backForwardListItemForCurrentAppLinkBannerCheck = self->_backForwardListItemForCurrentAppLinkBannerCheck;
      self->_backForwardListItemForCurrentAppLinkBannerCheck = v7;

      shouldRevealAppLinkBannerForNextCommit = self->_shouldRevealAppLinkBannerForNextCommit;
      self->_shouldRevealAppLinkBannerForNextCommit = 0;
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A760]), "initWithURL:", v4);
      objc_initWeak(&location, self);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __51___SFBrowserContentViewController__checkForAppLink__block_invoke;
      v12[3] = &unk_1E4AC6008;
      v11 = v10;
      v13 = v11;
      objc_copyWeak(&v15, &location);
      v14 = v3;
      v16 = shouldRevealAppLinkBannerForNextCommit;
      objc_msgSend(v11, "decideOpenStrategyWithCompletionHandler:", v12);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);

    }
    else
    {
      v5 = self->_backForwardListItemForCurrentAppLinkBannerCheck;
      self->_backForwardListItemForCurrentAppLinkBannerCheck = 0;

    }
  }
}

- (BOOL)_shouldAllowUniversalLinkBanner
{
  return (unint64_t)-[_SFBrowserContentViewController _persona](self, "_persona") < 2;
}

- (void)dismissAppSuggestionBanner:(id)a3
{
  -[_SFBrowserContentViewController _setShowingPinnableBanner:animated:](self, "_setShowingPinnableBanner:animated:", 0, 1);
}

- (void)setAppSuggestionBanner:(id)a3 isPinned:(BOOL)a4
{
  -[_SFBrowserContentViewController _setShowingPinnableBanner:animated:](self, "_setShowingPinnableBanner:animated:", a3, 0);
}

- (BOOL)shouldBlockAppSuggestionBanner:(id)a3
{
  return 0;
}

- (void)webViewController:(id)a3 didFindAppBannerWithContent:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  if (!self->_storeBannersAreDisabled)
  {
    -[_SFBrowserContentViewController expectedOrCurrentURL](self, "expectedOrCurrentURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFBrowserContentViewController _hostAppBundleId](self, "_hostAppBundleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SFCreateAppSuggestionBannerFromMetaTagContent();

  }
}

- (void)webViewControllerDidFirstPaint:(id)a3
{
  SFPinnableBanner *pinnableBannerPendingFirstPaint;
  SFPinnableBanner *v5;

  pinnableBannerPendingFirstPaint = self->_pinnableBannerPendingFirstPaint;
  if (pinnableBannerPendingFirstPaint)
  {
    -[_SFBrowserContentViewController _setShowingPinnableBanner:animated:](self, "_setShowingPinnableBanner:animated:", pinnableBannerPendingFirstPaint, 0);
    v5 = self->_pinnableBannerPendingFirstPaint;
    self->_pinnableBannerPendingFirstPaint = 0;

  }
}

- (void)webViewControllerDidDetermineReaderAvailability:(id)a3 dueTo:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, char);
  void *v16;
  id v17;
  id location;

  v6 = a3;
  if (a4 != 2)
  {
    -[_SFBrowserContentViewController _updateUI](self, "_updateUI");
    -[_SFBrowserContentViewController webViewController](self, "webViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "readerController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isReaderAvailable");

    if ((v9 & 1) != 0)
    {
      if (!-[SFSafariViewControllerConfiguration entersReaderIfAvailable](self->_configuration, "entersReaderIfAvailable"))
      {
        -[_SFBrowserContentViewController _committedDomainForPreferences](self, "_committedDomainForPreferences");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v10, "length")
          || a4 == 1 && self->_lastReaderDeactivationMode == 1
          || !-[_SFBrowserContentViewController _shouldAllowAutomaticReader](self, "_shouldAllowAutomaticReader"))
        {
          -[SFNavigationBarItem setShowsReaderButton:showsAvailabilityText:](self->_navigationBarItem, "setShowsReaderButton:showsAvailabilityText:", 1, 0);
        }
        else
        {
          objc_initWeak(&location, self);
          v13 = MEMORY[0x1E0C809B0];
          v14 = 3221225472;
          v15 = __89___SFBrowserContentViewController_webViewControllerDidDetermineReaderAvailability_dueTo___block_invoke;
          v16 = &unk_1E4AC6080;
          objc_copyWeak(&v17, &location);
          v11 = (void *)MEMORY[0x1A8598C40](&v13);
          -[_SFPerSitePreferencesVendor automaticReaderActivationManager](self->_perSitePreferencesVendor, "automaticReaderActivationManager", v13, v14, v15, v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "getAutomaticReaderEnabledForDomain:usingBlock:", v10, v11);

          objc_destroyWeak(&v17);
          objc_destroyWeak(&location);
        }
        goto LABEL_12;
      }
      -[SFNavigationBarItem setShowsReaderButton:showsAvailabilityText:](self->_navigationBarItem, "setShowsReaderButton:showsAvailabilityText:", 1, 0);
      -[_SFBrowserContentViewController _showReaderAnimated:](self, "_showReaderAnimated:", self->_displayMode == 0);
      if (!-[_SFBrowserContentViewController isBlockedByScreenTime](self, "isBlockedByScreenTime"))
      {
        objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "didActivateReaderWithTrigger:", 3);
LABEL_12:

      }
    }
  }

}

- (void)webViewController:(id)a3 didClickLinkInReaderWithRequest:(id)a4
{
  -[_SFBrowserContentViewController loadRequest:](self, "loadRequest:", a4);
}

- (void)webViewController:(id)a3 didExtractTextSamplesForTranslation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[_SFBrowserContentViewController translationContext](self, "translationContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "webView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __89___SFBrowserContentViewController_webViewController_didExtractTextSamplesForTranslation___block_invoke;
  v12[3] = &unk_1E4AC60A8;
  objc_copyWeak(&v14, &location);
  v11 = v6;
  v13 = v11;
  objc_msgSend(v8, "setWebpageLocaleWithExtractedTextSamples:url:completionHandler:", v7, v10, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)webViewControllerDidChangeLoadingState:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  -[_SFBrowserContentViewController webViewController](self, "webViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLoading");

  if (v5)
    -[WBSFluidProgressController startFluidProgressWithProgressStateSource:](self->_fluidProgressController, "startFluidProgressWithProgressStateSource:", self);
  if ((objc_msgSend(v6, "isLoading") & 1) == 0)
    self->_loadWasUserDriven = 0;
  -[_SFBrowserContentViewController _updateUI](self, "_updateUI");

}

- (void)webViewControllerDidChangeEstimatedProgress:(id)a3
{
  void *v4;
  int v5;

  -[_SFBrowserContentViewController webViewController](self, "webViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLoading");

  if (v5)
    -[WBSFluidProgressController updateFluidProgressWithProgressStateSource:](self->_fluidProgressController, "updateFluidProgressWithProgressStateSource:", self);
}

- (void)webViewController:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  NSString *suggestedFilenameForNextCommit;
  id v8;

  v8 = a5;
  if ((objc_msgSend(v8, "safari_matchesErrorDomain:andCode:", *MEMORY[0x1E0CEF800], 204) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lastLoadErrorForFormatMenu, a5);
    suggestedFilenameForNextCommit = self->_suggestedFilenameForNextCommit;
    self->_suggestedFilenameForNextCommit = 0;

    -[WBSFluidProgressController cancelFluidProgressWithProgressStateSource:](self->_fluidProgressController, "cancelFluidProgressWithProgressStateSource:", self);
    -[_SFPageLoadErrorController handleFrameLoadError:](self->_pageLoadErrorController, "handleFrameLoadError:", v8);
    -[_SFBrowserContentViewController _initialLoadFinishedWithSuccess:](self, "_initialLoadFinishedWithSuccess:", 0);
    -[_SFBrowserContentViewController _updateUserActivitySoon](self, "_updateUserActivitySoon");
  }

}

- (void)webViewControllerDidFirstVisuallyNonEmptyLayout:(id)a3
{
  -[_SFBrowserContentViewController _updateUI](self, "_updateUI", a3);
  -[_SFBrowserContentViewController _updateDigitalHealthTracking](self, "_updateDigitalHealthTracking");
}

- (BOOL)_redirectToHostAppWithNavigationResult:(id)a3 options:(id)a4
{
  return 0;
}

- (void)_cleanUpAfterRedirectToExternalApp
{
  if (-[_SFBrowserContentViewController _shouldGoBackToOwnerWebView](self, "_shouldGoBackToOwnerWebView"))
    -[_SFBrowserContentViewController _goBack](self, "_goBack");
  else
    -[_SFBrowserContentViewController _dismiss](self, "_dismiss");
}

- (void)_completeRedirectToExternalNavigationResult:(id)a3 fromOriginalRequest:(id)a4 dialogResult:(int64_t)a5
{
  void *v7;
  void *v8;
  unint64_t externalAppRedirectState;
  id v10;

  v10 = a3;
  -[_SFBrowserContentViewController webView](self, "webView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_committedURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if ((objc_msgSend(v10, "appliesOneTimeUserInitiatedActionPolicy") & 1) == 0)
    {
      externalAppRedirectState = self->_externalAppRedirectState;
      self->_externalAppRedirectState = externalAppRedirectState | 2;
      if (a5)
        self->_externalAppRedirectState = externalAppRedirectState | 6;
    }
  }
  else
  {
    -[_SFBrowserContentViewController _cleanUpAfterRedirectToExternalApp](self, "_cleanUpAfterRedirectToExternalApp");
  }

}

- (void)_queueAlertForRedirectToExternalNavigationResult:(id)a3 fromOriginalRequest:(id)a4 isMainFrame:(BOOL)a5 promptPolicy:(int64_t)a6 userAction:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _SFPageLoadErrorController *pageLoadErrorController;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  BOOL v29;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  objc_initWeak(&location, self);
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __140___SFBrowserContentViewController__queueAlertForRedirectToExternalNavigationResult_fromOriginalRequest_isMainFrame_promptPolicy_userAction___block_invoke;
  v24 = &unk_1E4AC60D0;
  objc_copyWeak(&v28, &location);
  v15 = v12;
  v25 = v15;
  v16 = v13;
  v26 = v16;
  v29 = a5;
  v17 = v14;
  v27 = v17;
  v18 = (void *)MEMORY[0x1A8598C40](&v21);
  if ((objc_msgSend(v15, "externalApplicationCategory", v21, v22, v23, v24) | 2) == 2)
  {
    self->_externalAppRedirectState |= 8uLL;
    pageLoadErrorController = self->_pageLoadErrorController;
    objc_msgSend(MEMORY[0x1E0D4EC60], "redirectDialogWithNavigationResult:promptPolicy:completionHandler:", v15, a6, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFPageLoadErrorController addDialog:](pageLoadErrorController, "addDialog:", v20);

  }
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

}

- (BOOL)_willURLOpenHostApp:(id)a3
{
  return 0;
}

- (void)_redirectToExternalNavigationResult:(id)a3 fromOriginalRequest:(id)a4 promptPolicy:(int64_t)a5 isMainFrame:(BOOL)a6 userAction:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _SFTelephonyNavigationMitigationPolicy *telephonyNavigationPolicy;
  id *v21;
  id *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  _QWORD v33[3];

  v8 = a6;
  v33[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  objc_msgSend(v12, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)*MEMORY[0x1E0DC4730], "canOpenURL:", v15) & 1) != 0)
  {
    objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("Referer"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
    {
      v32 = *MEMORY[0x1E0CA5810];
      v33[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    if (-[_SFBrowserContentViewController _redirectToHostAppWithNavigationResult:options:](self, "_redirectToHostAppWithNavigationResult:options:", v12, v18)|| self->_externalAppRedirectState == 8)
    {
      goto LABEL_18;
    }
    if (objc_msgSend(v12, "shouldPromptWithPolicy:telephonyNavigationPolicy:userAction:inBackgroundOrPrivateBrowsing:inLockdownMode:", a5, self->_telephonyNavigationPolicy, v14, -[_SFBrowserContentViewController viewDidAppearInHostApp](self, "viewDidAppearInHostApp") ^ 1, self->_wasLoadedWithLockdownModeEnabled))
    {
      -[_SFBrowserContentViewController _queueAlertForRedirectToExternalNavigationResult:fromOriginalRequest:isMainFrame:promptPolicy:userAction:](self, "_queueAlertForRedirectToExternalNavigationResult:fromOriginalRequest:isMainFrame:promptPolicy:userAction:", v12, v13, v8, a5, v14);
    }
    else
    {
      v19 = objc_msgSend(v12, "externalApplicationCategory");
      if (!v19 || v19 == 2)
      {
        objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "externalApplication");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __127___SFBrowserContentViewController__redirectToExternalNavigationResult_fromOriginalRequest_promptPolicy_isMainFrame_userAction___block_invoke_3;
        v25[3] = &unk_1E4AC2EB0;
        v25[4] = self;
        v26 = v12;
        v27 = v13;
        objc_msgSend(v23, "_sf_openURL:inApplication:withOptions:completionHandler:", v15, v24, v18, v25);

        v21 = &v26;
        v22 = &v27;
      }
      else
      {
        if (v19 != 1 || self->_isDisplayingTelephonyPrompt)
          goto LABEL_18;
        self->_isDisplayingTelephonyPrompt = 1;
        telephonyNavigationPolicy = self->_telephonyNavigationPolicy;
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __127___SFBrowserContentViewController__redirectToExternalNavigationResult_fromOriginalRequest_promptPolicy_isMainFrame_userAction___block_invoke;
        v28[3] = &unk_1E4AC60F8;
        v28[4] = self;
        v29 = v15;
        v30 = v12;
        v31 = v13;
        -[_SFTelephonyNavigationMitigationPolicy handleNavigationToURL:completionHandler:](telephonyNavigationPolicy, "handleNavigationToURL:completionHandler:", v29, v28);
        v21 = &v29;
        v22 = &v30;
        v23 = v31;
      }

    }
LABEL_18:

    goto LABEL_19;
  }
  if (v8)
    -[_SFPageLoadErrorController addInvalidURLAlert](self->_pageLoadErrorController, "addInvalidURLAlert");
LABEL_19:

}

- (id)resultOfLoadingRequest:(id)a3 inMainFrame:(BOOL)a4 disallowRedirectToExternalApps:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _SFBrowserContentViewController *v14;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __101___SFBrowserContentViewController_resultOfLoadingRequest_inMainFrame_disallowRedirectToExternalApps___block_invoke;
  v12[3] = &unk_1E4AC6120;
  v13 = v8;
  v14 = self;
  v9 = v8;
  +[_SFNavigationResult resultOfLoadingRequest:isMainFrame:disallowRedirectToExternalApps:preferredApplicationBundleIdentifier:redirectDecisionHandler:](_SFNavigationResult, "resultOfLoadingRequest:isMainFrame:disallowRedirectToExternalApps:preferredApplicationBundleIdentifier:redirectDecisionHandler:", v9, v6, v5, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_determineResultOfLoadingRequest:(id)a3 inMainFrame:(BOOL)a4 disallowRedirectToExternalApps:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  BOOL v20;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = a6;
  -[_SFBrowserContentViewController webView](self, "webView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_committedURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[_SFReloadOptionsController loadedUsingDesktopUserAgent](self->_reloadOptionsController, "loadedUsingDesktopUserAgent");
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __129___SFBrowserContentViewController__determineResultOfLoadingRequest_inMainFrame_disallowRedirectToExternalApps_completionHandler___block_invoke;
  v17[3] = &unk_1E4AC6148;
  v15 = v10;
  v18 = v15;
  v16 = v13;
  v19 = v16;
  v20 = v14;
  +[_SFNavigationResult determineResultOfLoadingRequest:isMainFrame:disallowRedirectToExternalApps:preferredApplicationBundleIdentifier:redirectDecisionHandler:completionHandler:](_SFNavigationResult, "determineResultOfLoadingRequest:isMainFrame:disallowRedirectToExternalApps:preferredApplicationBundleIdentifier:redirectDecisionHandler:completionHandler:", v15, v8, v7, 0, v17, v11);

}

- (void)_redirectToNewsIfNeededForRequest:(id)a3 isMainFrame:(BOOL)a4 userAction:(id)a5 decisionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  BOOL v24;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A760]), "initWithURL:", v13);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __108___SFBrowserContentViewController__redirectToNewsIfNeededForRequest_isMainFrame_userAction_decisionHandler___block_invoke;
  v19[3] = &unk_1E4AC6170;
  v15 = v12;
  v23 = v15;
  v19[4] = self;
  v16 = v10;
  v20 = v16;
  v21 = v14;
  v17 = v11;
  v22 = v17;
  v24 = a4;
  v18 = v14;
  objc_msgSend(v18, "_sf_decideOpenStrategyAndCallCompletionHandlerOnMainThread:", v19);

}

- (void)webViewController:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  int64_t *p_concurrentNavigationActionPolicyDecisions;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  char v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  char v26;
  uint8_t buf[4];
  _SFBrowserContentViewController *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "targetFrame");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11
    && (objc_msgSend(v9, "targetFrame"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "isMainFrame"),
        v12,
        v11,
        !v13))
  {
    v19 = 0;
  }
  else
  {
    p_concurrentNavigationActionPolicyDecisions = &self->_concurrentNavigationActionPolicyDecisions;
    ++self->_concurrentNavigationActionPolicyDecisions;
    v15 = WBS_LOG_CHANNEL_PREFIXPageLoading();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = *p_concurrentNavigationActionPolicyDecisions;
      *(_DWORD *)buf = 134218240;
      v28 = self;
      v29 = 2048;
      v30 = v16;
      _os_log_impl(&dword_1A3B2D000, v15, OS_LOG_TYPE_INFO, "(%p) Concurrent navigation action policy decisions: %zd", buf, 0x16u);
    }
    if (*p_concurrentNavigationActionPolicyDecisions >= 21)
    {
      v17 = WBS_LOG_CHANNEL_PREFIXPageLoading();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[_SFBrowserContentViewController webViewController:decidePolicyForNavigationAction:decisionHandler:].cold.1(&self->_concurrentNavigationActionPolicyDecisions, v17);
      objc_msgSend(v8, "webView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_killWebContentProcessAndResetState");

    }
    v19 = 1;
  }
  objc_initWeak((id *)buf, self);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __101___SFBrowserContentViewController_webViewController_decidePolicyForNavigationAction_decisionHandler___block_invoke;
  v22[3] = &unk_1E4AC6198;
  objc_copyWeak(&v25, (id *)buf);
  v20 = v9;
  v23 = v20;
  v21 = v10;
  v24 = v21;
  v26 = v19;
  -[_SFBrowserContentViewController _internalWebViewController:decidePolicyForNavigationAction:decisionHandler:](self, "_internalWebViewController:decidePolicyForNavigationAction:decisionHandler:", v8, v20, v22);

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);

}

- (void)_internalWebViewController:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void (**v21)(id, _QWORD);
  _WKUserInitiatedAction *v22;
  _WKUserInitiatedAction *lastUserInitiatedAction;
  void *v24;
  id *v25;
  void *v26;
  int v27;
  _SFPageLoadErrorController *pageLoadErrorController;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void (**pendingNavigationActionDueToExternalSchemePromptHandler)(id, _QWORD);
  void *v35;
  void *v36;
  void (**v37)(id, _QWORD);
  id v38;
  id *v39;
  id *v40;
  id *v41;
  void *v42;
  void *v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  id v55[2];
  char v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  id v61;
  id location[2];

  v44 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = v11;
  objc_msgSend(v8, "targetFrame");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v12;
  if (v12)
    v13 = objc_msgSend(v12, "isMainFrame");
  else
    v13 = 1;
  objc_initWeak(location, self);
  if ((self->_externalAppRedirectState & 8) != 0)
  {
    if (!(_DWORD)v13)
      goto LABEL_10;
  }
  else if (!self->_isDisplayingTelephonyPrompt || (v13 & 1) == 0)
  {
    goto LABEL_10;
  }
  objc_msgSend(v8, "request");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[_SFBrowserContentViewController _willURLOpenHostApp:](self, "_willURLOpenHostApp:", v15);

  if (v16)
  {
LABEL_10:
    v38 = v9;
    v17 = (void *)objc_msgSend(v8, "navigationType");
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __110___SFBrowserContentViewController__internalWebViewController_decidePolicyForNavigationAction_decisionHandler___block_invoke_2;
    v51[3] = &unk_1E4AC6210;
    objc_copyWeak(v55, location);
    v18 = v9;
    v54 = v18;
    v19 = v8;
    v52 = v19;
    v20 = v11;
    v56 = v13;
    v53 = v20;
    v55[1] = v17;
    v21 = (void (**)(id, _QWORD))MEMORY[0x1A8598C40](v51);
    self->_didReceivePolicyForInitialLoad = 1;
    objc_msgSend(v19, "_userInitiatedAction");
    v22 = (_WKUserInitiatedAction *)objc_claimAutoreleasedReturnValue();
    lastUserInitiatedAction = self->_lastUserInitiatedAction;
    self->_lastUserInitiatedAction = v22;

    -[WBSURLSpoofingMitigator setNavigationSource:](self->_URLSpoofingMitigator, "setNavigationSource:", !self->_loadWasUserDriven);
    v40 = &v52;
    v41 = &v54;
    v39 = &v53;
    if ((_DWORD)v13
      && ((objc_msgSend(v20, "safari_isHTTPFamilyURL") & 1) != 0
       || objc_msgSend(v20, "safari_hasScheme:", CFSTR("ftp")))
      && objc_msgSend(v20, "safari_hasUserOrPassword"))
    {
      v21[2](v21, 0);
      objc_msgSend(v20, "safari_URLByDeletingUserAndPassword");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v55;
      v9 = v38;
      if (v24)
      {
        objc_msgSend(MEMORY[0x1E0C92C80], "safari_nonAppInitiatedRequestWithURL:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SFBrowserContentViewController loadRequest:](self, "loadRequest:", v26);

      }
    }
    else
    {
      v27 = objc_msgSend(v19, "_sf_shouldAskAboutInsecureFormSubmission");
      pageLoadErrorController = self->_pageLoadErrorController;
      if (v27)
      {
        _WBSLocalizedString();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SFPageLoadErrorController addFormAlertWithTitle:decisionHandler:](pageLoadErrorController, "addFormAlertWithTitle:decisionHandler:", v29, v21);

      }
      else
      {
        if (-[_SFPageLoadErrorController crashesSinceLastSuccessfulLoad](self->_pageLoadErrorController, "crashesSinceLastSuccessfulLoad"))
        {
          if ((_DWORD)v13)
          {
            objc_msgSend(v19, "targetFrame");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "request");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "URL");
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (v32)
              -[_SFBrowserContentViewController _setShowingCrashBanner:animated:](self, "_setShowingCrashBanner:animated:", 0, 1);
          }
        }
        if ((self->_externalAppRedirectState & 4) != 0)
          v33 = objc_msgSend(v19, "_isUserInitiated") ^ 1;
        else
          v33 = 0;
        objc_msgSend(v19, "request");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __110___SFBrowserContentViewController__internalWebViewController_decidePolicyForNavigationAction_decisionHandler___block_invoke_4;
        v45[3] = &unk_1E4AC6238;
        objc_copyWeak(&v50, location);
        v48 = v18;
        v46 = v44;
        v47 = v19;
        v37 = v21;
        v49 = v37;
        -[_SFBrowserContentViewController _determineResultOfLoadingRequest:inMainFrame:disallowRedirectToExternalApps:completionHandler:](self, "_determineResultOfLoadingRequest:inMainFrame:disallowRedirectToExternalApps:completionHandler:", v36, v13, v33, v45);

        objc_destroyWeak(&v50);
        v21 = v37;
      }
      v25 = v55;
      v9 = v38;
    }
    goto LABEL_31;
  }
  pendingNavigationActionDueToExternalSchemePromptHandler = (void (**)(id, _QWORD))self->_pendingNavigationActionDueToExternalSchemePromptHandler;
  if (pendingNavigationActionDueToExternalSchemePromptHandler)
    pendingNavigationActionDueToExternalSchemePromptHandler[2](pendingNavigationActionDueToExternalSchemePromptHandler, 0);
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __110___SFBrowserContentViewController__internalWebViewController_decidePolicyForNavigationAction_decisionHandler___block_invoke;
  v57[3] = &unk_1E4AC61C0;
  v25 = &v61;
  objc_copyWeak(&v61, location);
  v41 = &v60;
  v60 = v9;
  v40 = &v58;
  v58 = v44;
  v39 = &v59;
  v59 = v8;
  v35 = (void *)MEMORY[0x1A8598C40](v57);
  v21 = (void (**)(id, _QWORD))self->_pendingNavigationActionDueToExternalSchemePromptHandler;
  self->_pendingNavigationActionDueToExternalSchemePromptHandler = v35;
LABEL_31:

  objc_destroyWeak(v25);
  objc_destroyWeak(location);

}

- (void)_internalWebViewController:(id)a3 decidePolicyForNavigationAction:(id)a4 withResult:(id)a5 decisionHandler:(id)a6
{
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  id v29;

  v29 = a4;
  v9 = a5;
  v10 = (void (**)(id, _QWORD))a6;
  objc_msgSend(v29, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "targetFrame");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    v15 = objc_msgSend(v13, "isMainFrame");
  else
    v15 = 1;
  if (-[_SFBrowserContentViewController _redirectToHostAppForAuthenticationSession:](self, "_redirectToHostAppForAuthenticationSession:", v12))
  {
LABEL_5:
    v10[2](v10, 0);
    goto LABEL_6;
  }
  switch(objc_msgSend(v9, "type"))
  {
    case 0:
      objc_msgSend(v9, "URL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "_webkit_isJavaScriptURL");

      if (v17)
      {
        -[_SFPageLoadErrorController addDisallowedUseOfJavaScriptAlert](self->_pageLoadErrorController, "addDisallowedUseOfJavaScriptAlert");
      }
      else if ((_DWORD)v15
             && !-[_SFBrowserContentViewController _redirectToHostAppForAuthenticationSession:](self, "_redirectToHostAppForAuthenticationSession:", v12))
      {
        -[_SFPageLoadErrorController addInvalidURLAlert](self->_pageLoadErrorController, "addInvalidURLAlert");
      }
      goto LABEL_5;
    case 1:
      if ((self->_externalAppRedirectState & 4) != 0 && !objc_msgSend(v29, "_isUserInitiated"))
      {
        v21 = 1;
        if ((_DWORD)v15)
          goto LABEL_37;
        goto LABEL_44;
      }
      if (self->_wasLoadedWithLockdownModeEnabled)
      {
        v21 = objc_msgSend(v12, "hasTelephonyScheme") ^ 1;
        if ((v21 & 1) != 0)
        {
LABEL_36:
          if ((_DWORD)v15)
          {
LABEL_37:
            objc_msgSend(v9, "URL");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[_SFBrowserContentViewController _didResolveDestinationURL:pendingAppLinkCheck:](self, "_didResolveDestinationURL:pendingAppLinkCheck:", v25, 1);

            v26 = objc_msgSend(v29, "_shouldOpenAppLinks");
            if (v21)
              v27 = 3;
            else
              v27 = 1;
            if (v26)
              v28 = v27;
            else
              v28 = 3;
            goto LABEL_45;
          }
LABEL_44:
          v28 = 3;
LABEL_45:
          v10[2](v10, v28);
          goto LABEL_6;
        }
      }
      else
      {
        v21 = 0;
      }
      if (((v15 ^ 1) & 1) != 0)
        goto LABEL_36;
      if (!objc_msgSend(v29, "_shouldOpenExternalSchemes")
        || self->_displayMode == 1
        || !objc_msgSend(v12, "safari_isAppleNewsURL"))
      {
        v21 = 0;
        goto LABEL_36;
      }
      objc_msgSend(v29, "request");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "_userInitiatedAction");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFBrowserContentViewController _redirectToNewsIfNeededForRequest:isMainFrame:userAction:decisionHandler:](self, "_redirectToNewsIfNeededForRequest:isMainFrame:userAction:decisionHandler:", v19, v15, v20, v10);
LABEL_11:

LABEL_6:
      return;
    case 2:
      v10[2](v10, 0);
      v18 = (void *)MEMORY[0x1E0C92C80];
      objc_msgSend(v9, "URL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "safari_nonAppInitiatedRequestWithURL:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFBrowserContentViewController loadRequest:](self, "loadRequest:", v20);
      goto LABEL_11;
    case 3:
      v10[2](v10, 0);
      objc_msgSend(v9, "URL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFBrowserContentViewController _didResolveDestinationURL:pendingAppLinkCheck:](self, "_didResolveDestinationURL:pendingAppLinkCheck:", v22, 0);

      if (!(_DWORD)v15 || !objc_msgSend(v29, "_shouldOpenExternalSchemes") || self->_displayMode == 1)
        goto LABEL_6;
      if (self->_wasLoadedWithLockdownModeEnabled)
        goto LABEL_22;
      if ((objc_msgSend(v29, "_sf_allowsExternalRedirectWithoutPrompting") & 1) != 0)
      {
        v24 = 0;
      }
      else if (self->_didNotifyInitialLoadFinish)
      {
LABEL_22:
        objc_msgSend(v29, "_userInitiatedAction");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          v24 = 2;
        else
          v24 = 3;

      }
      else
      {
        v24 = 1;
      }
      objc_msgSend(v29, "request");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "_userInitiatedAction");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFBrowserContentViewController _redirectToExternalNavigationResult:fromOriginalRequest:promptPolicy:isMainFrame:userAction:](self, "_redirectToExternalNavigationResult:fromOriginalRequest:promptPolicy:isMainFrame:userAction:", v9, v19, v24, 1, v20);
      goto LABEL_11;
    case 4:
      -[_SFPageLoadErrorController addDisallowedFileURLAlert](self->_pageLoadErrorController, "addDisallowedFileURLAlert");
      goto LABEL_5;
    default:
      goto LABEL_5;
  }
}

- (id)_quickLookDocumentForDownload:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "filename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_lastPathComponentWithoutZipExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0D4ED18]);
  objc_msgSend(v3, "response");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "MIMEType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithFileName:mimeType:uti:needsQuickLookDocumentView:", v5, v8, 0, 1);

  objc_msgSend(v3, "sourceURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSourceURL:", v10);

  return v9;
}

- (id)_fallbackURLForWellKnownChangePasswordURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[_SFBrowserContentViewController _fallbackURLForWellKnownChangePasswordURLFromQuirks:](self, "_fallbackURLForWellKnownChangePasswordURLFromQuirks:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[_SFBrowserContentViewController _homePageForURL:](self, "_homePageForURL:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)_fallbackURLForWellKnownChangePasswordURLFromQuirks:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[WBSAutoFillQuirksManager changePasswordURLManager](self->_autoFillQuirksManager, "changePasswordURLManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_highLevelDomainFromHost");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changePasswordURLForHighLevelDomain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_homePageForURL:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "safari_URLByRemovingUserPasswordPathQueryAndFragment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_URLByReplacingSchemeWithString:", CFSTR("http"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_didDecideNavigationPolicy:(int64_t)a3 forNavigationResponse:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *suggestedFilenameForNextCommit;
  void *v14;

  v6 = a4;
  v7 = v6;
  if (a3 == 1)
  {
    v14 = v6;
    v8 = objc_msgSend(v6, "isForMainFrame");
    v7 = v14;
    if (v8)
    {
      objc_msgSend(v14, "_frame");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "webView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFBrowserContentViewController webView](self, "webView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v14;
      if (v10 == v11)
      {
        objc_msgSend(v14, "_sf_explicitSuggestedFilename");
        v12 = (NSString *)objc_claimAutoreleasedReturnValue();
        suggestedFilenameForNextCommit = self->_suggestedFilenameForNextCommit;
        self->_suggestedFilenameForNextCommit = v12;

        v7 = v14;
      }
    }
  }

}

- (void)webViewController:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  NSURL *v14;
  void *v15;
  void *v16;
  NSURL *urlForPendingNavigationToFallbackURLForWellKnownChangePasswordURL;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  BOOL v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  _QWORD v44[5];
  id v45;
  id v46;

  v41 = a3;
  v8 = a4;
  v9 = a5;
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __103___SFBrowserContentViewController_webViewController_decidePolicyForNavigationResponse_decisionHandler___block_invoke;
  v44[3] = &unk_1E4AC6260;
  v44[4] = self;
  v10 = v8;
  v45 = v10;
  v11 = v9;
  v46 = v11;
  v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A8598C40](v44);
  objc_msgSend(v10, "response");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v13, "safari_statusCodeGroup") & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    v14 = self->_originalRequestURL;
    if (-[NSURL safari_isWellKnownChangePasswordURL](v14, "safari_isWellKnownChangePasswordURL"))
    {
      v12[2](v12, 0);
      -[_SFBrowserContentViewController _fallbackURLForWellKnownChangePasswordURLFromQuirks:](self, "_fallbackURLForWellKnownChangePasswordURLFromQuirks:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_storeStrong((id *)&self->_urlForPendingNavigationToFallbackURLForWellKnownChangePasswordURL, v15);
        objc_msgSend(MEMORY[0x1E0C92C80], "safari_nonAppInitiatedRequestWithURL:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SFBrowserContentViewController loadRequest:](self, "loadRequest:", v16);
      }
      else
      {
        v36 = (void *)MEMORY[0x1E0C92C80];
        -[_SFBrowserContentViewController _homePageForURL:](self, "_homePageForURL:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "safari_nonAppInitiatedRequestWithURL:", v16);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SFBrowserContentViewController loadRequest:](self, "loadRequest:", v37);

      }
      goto LABEL_35;
    }
    if (-[NSURL isEqual:](v14, "isEqual:", self->_urlForPendingNavigationToFallbackURLForWellKnownChangePasswordURL))
    {
      v12[2](v12, 0);
      urlForPendingNavigationToFallbackURLForWellKnownChangePasswordURL = self->_urlForPendingNavigationToFallbackURLForWellKnownChangePasswordURL;
      self->_urlForPendingNavigationToFallbackURLForWellKnownChangePasswordURL = 0;

      v18 = (void *)MEMORY[0x1E0C92C80];
      -[_SFBrowserContentViewController _homePageForURL:](self, "_homePageForURL:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "safari_nonAppInitiatedRequestWithURL:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFBrowserContentViewController loadRequest:](self, "loadRequest:", v16);
LABEL_35:

      goto LABEL_36;
    }

  }
  v42 = 0;
  v43 = 0;
  v19 = objc_msgSend(v10, "_sf_responsePolicy:uti:", &v43, &v42);
  v14 = (NSURL *)v42;
  if (!v19)
  {
    v20 = 1;
    goto LABEL_13;
  }
  if (self->_activeDownload)
  {
    v20 = 0;
LABEL_13:
    v12[2](v12, v20);
    goto LABEL_36;
  }
  objc_msgSend(v13, "MIMEType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "suggestedFilename");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "safari_filenameByFixingIllegalCharacters");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "safari_lastPathComponentWithoutZipExtension");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v43;
  if (v43 == 3)
  {
    if ((objc_msgSend(getPKAddPassesViewControllerClass(), "canAddPasses") & 1) == 0)
    {
LABEL_19:
      v43 = 0;
      goto LABEL_20;
    }
    v24 = v43;
  }
  if (v24 == 7 && (objc_msgSend(getPKAddPassesViewControllerClass(), "canAddPasses") & 1) == 0)
    goto LABEL_19;
LABEL_20:
  objc_msgSend(v40, "pathExtension");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "caseInsensitiveCompare:", CFSTR("swf"));

  v27 = objc_msgSend(v21, "caseInsensitiveCompare:", CFSTR("application/x-shockwave-flash"));
  v28 = objc_msgSend(v10, "isForMainFrame");
  if (v26)
    v29 = v27 == 0;
  else
    v29 = 1;
  v30 = v29;
  if (!v43 || (v30 & ~v28 & 1) != 0)
  {
    v12[2](v12, 0);
  }
  else
  {
    v38 = v21;
    objc_msgSend(v10, "_request");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_sf_suggestedFilename");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[_SFDownload provisionalDownloadWithMIMEType:request:response:filename:uti:userInitiatedAction:](_SFDownload, "provisionalDownloadWithMIMEType:request:response:filename:uti:userInitiatedAction:", v21, v31, v13, v32, v14, self->_lastUserInitiatedAction);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43 == 2)
    {
      -[_SFBrowserContentViewController _quickLookDocumentForDownload:](self, "_quickLookDocumentForDownload:", v33);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v39 = 0;
    }
    +[_SFDownloadDispatcher sharedDownloadDispatcher](_SFDownloadDispatcher, "sharedDownloadDispatcher");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "webView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setPendingDownload:forWebView:", v33, v35);

    objc_msgSend(v33, "setQuickLookDocument:", v39);
    objc_msgSend(v33, "setDelegate:", self);
    objc_msgSend(v33, "setFluidProgressController:", self->_fluidProgressController);
    objc_storeStrong((id *)&self->_activeDownload, v33);
    v12[2](v12, 2 * (v33 != 0));

    v21 = v38;
  }

LABEL_36:
}

- (void)_didDecideNavigationPolicy:(int64_t)a3 forNavigationAction:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  -[_SFBrowserContentViewController translationContext](self, "translationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController webView](self, "webView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backForwardList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "owningWebViewDidDecidePolicy:forNavigationAction:currentBackForwardListItem:", a3, v10, v9);

}

- (void)webViewController:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  NSString *suggestedFilenameForNextCommit;
  id v11;

  v11 = a5;
  if (-[NSURL safari_isWellKnownChangePasswordURL](self->_originalRequestURL, "safari_isWellKnownChangePasswordURL"))
  {
    v7 = (void *)MEMORY[0x1E0C92C80];
    -[_SFBrowserContentViewController _fallbackURLForWellKnownChangePasswordURL:](self, "_fallbackURLForWellKnownChangePasswordURL:", self->_originalRequestURL);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safari_nonAppInitiatedRequestWithURL:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFBrowserContentViewController loadRequest:](self, "loadRequest:", v9);

  }
  else
  {
    objc_storeStrong((id *)&self->_lastLoadErrorForFormatMenu, a5);
    suggestedFilenameForNextCommit = self->_suggestedFilenameForNextCommit;
    self->_suggestedFilenameForNextCommit = 0;

    -[WBSURLSpoofingMitigator didFailProvisionalNavigationWithError:](self->_URLSpoofingMitigator, "didFailProvisionalNavigationWithError:", v11);
    -[WBSFluidProgressController cancelFluidProgressWithProgressStateSource:](self->_fluidProgressController, "cancelFluidProgressWithProgressStateSource:", self);
    -[_SFPageLoadErrorController handleFrameLoadError:](self->_pageLoadErrorController, "handleFrameLoadError:", v11);
    -[_SFBrowserContentViewController _initialLoadFinishedWithSuccess:](self, "_initialLoadFinishedWithSuccess:", 0);
    -[_SFBrowserContentViewController _updateUserActivitySoon](self, "_updateUserActivitySoon");
    -[_SFBrowserContentViewController _updateNavigationBar](self, "_updateNavigationBar");
  }

}

- (void)webViewController:(id)a3 didSameDocumentNavigation:(id)a4 ofType:(int64_t)a5
{
  -[_SFBrowserContentViewController _updateNavigationBar](self, "_updateNavigationBar", a3, a4);
  if (a5)
  {
    if (self->_shouldDismissReaderInReponseToSameDocumentNavigation)
      -[_SFBrowserContentViewController _hideReaderAnimated:deactivationMode:](self, "_hideReaderAnimated:deactivationMode:", 0, 0);
    self->_shouldDismissReaderInReponseToSameDocumentNavigation = 0;
  }
}

- (void)webViewController:(id)a3 willEndNavigationGestureToBackForwardListItem:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  self->_shouldDismissReaderInReponseToSameDocumentNavigation = 1;
  if (v6 && -[_SFBrowserContentViewController _shouldGoBackToOwnerWebView](self, "_shouldGoBackToOwnerWebView"))
    self->_gestureRequiresGoingBackToOwnerWebView = 1;

}

- (void)webViewController:(id)a3 didEndNavigationGestureToBackForwardListItem:(id)a4
{
  if (a4)
  {
    if (self->_gestureRequiresGoingBackToOwnerWebView)
    {
      -[_SFBrowserContentViewController _goBackToOwnerWebView](self, "_goBackToOwnerWebView", a3);
      self->_gestureRequiresGoingBackToOwnerWebView = 0;
    }
  }
}

- (void)webViewController:(id)a3 willGoToBackForwardListItem:(id)a4 inPageCache:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  id v8;

  v5 = a5;
  v8 = a4;
  -[_SFBrowserContentViewController translationContext](self, "translationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "owningWebViewWillNavigateToBackForwardListItem:inPageCache:", v8, v5);

}

- (id)_openNewWebViewIfNeededWithConfiguration:(id)a3 forNavigationAction:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  SFReaderEnabledWebViewController *v11;
  void *v12;
  SFReaderEnabledWebViewController *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v5 = a3;
  -[_SFBrowserContentViewController webView](self, "webView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backForwardList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_saveBackForwardSnapshotForItem:", v8);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __96___SFBrowserContentViewController__openNewWebViewIfNeededWithConfiguration_forNavigationAction___block_invoke;
  v18[3] = &unk_1E4AC6288;
  v9 = v8;
  v19 = v9;
  objc_msgSend(v6, "_sessionStateWithFilter:", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [SFReaderEnabledWebViewController alloc];
  -[_SFBrowserContentViewController contentBlockerManager](self, "contentBlockerManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SFWebViewController initWithWebViewConfiguration:contentBlockerManager:](v11, "initWithWebViewConfiguration:contentBlockerManager:", v5, v12);

  -[_SFBrowserContentViewController _pushWebViewController:](self, "_pushWebViewController:", v13);
  -[SFWebViewController webView](v13, "webView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "_restoreSessionState:andNavigate:", v10, 0);

  -[_SFBrowserContentViewController webView](self, "webView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)webViewController:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, void *);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, int);
  void *v19;
  _SFBrowserContentViewController *v20;
  id v21;
  id v22;
  void (**v23)(id, void *);

  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, void *))a6;
  if (objc_msgSend(v10, "_isUserInitiated"))
  {
    -[_SFBrowserContentViewController _openNewWebViewIfNeededWithConfiguration:forNavigationAction:](self, "_openNewWebViewIfNeededWithConfiguration:forNavigationAction:", v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v12);

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0D4EC60];
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __122___SFBrowserContentViewController_webViewController_createWebViewWithConfiguration_forNavigationAction_completionHandler___block_invoke;
    v19 = &unk_1E4AC62B0;
    v20 = self;
    v21 = v9;
    v22 = v10;
    v23 = v11;
    objc_msgSend(v13, "blockedPopupWindowDialogWithCompletionHandler:", &v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFBrowserContentViewController webViewController](self, "webViewController", v16, v17, v18, v19, v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "presentDialog:sender:", v14, self);

  }
}

- (void)webViewController:(id)a3 webViewDidClose:(id)a4
{
  if ((unint64_t)-[NSMutableArray count](self->_webViewControllers, "count", a3, a4) >= 2)
    -[_SFBrowserContentViewController _popWebViewController](self, "_popWebViewController");
}

- (void)webViewControllerWebProcessDidCrash:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  _SFPageLoadErrorController *pageLoadErrorController;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  _SFReaderViewController *readerViewController;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  -[_SFBrowserContentViewController setMediaStateIcon:](self, "setMediaStateIcon:", 0);
  -[_SFPageLoadErrorController clearCrashCountResetTimer](self->_pageLoadErrorController, "clearCrashCountResetTimer");
  -[_SFBrowserContentViewController webViewController](self, "webViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
LABEL_4:
    v22 = *MEMORY[0x1E0CB32F0];
    v23[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v5, "backForwardList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB35C8];
  if (v6)
    goto LABEL_4;
  v10 = 0;
  v11 = 1;
LABEL_5:
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.SafariViewService"), 0, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 & 1) == 0)

  pageLoadErrorController = self->_pageLoadErrorController;
  objc_msgSend(v6, "safari_userVisibleString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(pageLoadErrorController) = -[_SFPageLoadErrorController updateCrashesAndShowCrashError:URLString:](pageLoadErrorController, "updateCrashesAndShowCrashError:URLString:", v12, v14);

  if ((_DWORD)pageLoadErrorController)
  {
    -[_SFBrowserContentViewController _setShowingCrashBanner:animated:](self, "_setShowingCrashBanner:animated:", 0, 1);
  }
  else if ((v11 & 1) == 0)
  {
    -[_SFBrowserContentViewController _setShowingCrashBanner:animated:](self, "_setShowingCrashBanner:animated:", 1, 1);
    -[_SFBrowserContentViewController _willBeginUserInitiatedNavigation](self, "_willBeginUserInitiatedNavigation");
    objc_msgSend(v5, "_committedURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqual:", v6);

    if (v16)
    {
      v17 = (id)objc_msgSend(v5, "reload");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C92C80], "requestWithURL:", v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFBrowserContentViewController _requestBySettingAdvancedPrivacyProtectionsFlag:](self, "_requestBySettingAdvancedPrivacyProtectionsFlag:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (id)objc_msgSend(v5, "loadRequest:", v19);
    }
    -[_SFReaderViewController setDelegate:](self->_readerViewController, "setDelegate:", 0);
    readerViewController = self->_readerViewController;
    self->_readerViewController = 0;

  }
}

- (void)webViewControllerDidChangeHasOnlySecureContent:(id)a3
{
  -[_SFBrowserContentViewController _invalidateEVOrganizationName](self, "_invalidateEVOrganizationName", a3);
  -[_SFBrowserContentViewController _updateUI](self, "_updateUI");
}

- (void)webViewController:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  _QWORD v29[5];

  v7 = a4;
  v8 = (void (**)(id, _QWORD, void *))a5;
  objc_msgSend(v7, "protectionSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "protectionSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "authenticationMethod");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C92B70]);

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D8A818], "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "protectionSpace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "didInvalidCertificateExceptionsApplySuccessfullyForProtectionSpace:inPrivateBrowsing:", v14, 0);

    if (v15)
    {
      v16 = (void *)MEMORY[0x1E0C92C60];
      objc_msgSend(v7, "protectionSpace");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "credentialForTrust:", objc_msgSend(v17, "serverTrust"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, 0, v18);
LABEL_10:

      goto LABEL_11;
    }
    objc_msgSend(v7, "protectionSpace");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFPageLoadErrorController setProtectionSpaceForInvalidCertificateBypass:](self->_pageLoadErrorController, "setProtectionSpaceForInvalidCertificateBypass:", v23);

    goto LABEL_8;
  }
  objc_msgSend(v7, "protectionSpace");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "_sf_canAuthenticate");

  if ((v20 & 1) == 0)
  {
LABEL_8:
    v8[2](v8, 3, 0);
    goto LABEL_11;
  }
  objc_msgSend(v9, "authenticationMethod");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0C92B30]);

  if (!v22)
  {
    -[_SFBrowserContentViewController webViewController](self, "webViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0D4EC60];
    objc_msgSend(v17, "webView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_committedURL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "authenticationDialogWithAuthenticationChallenge:committedURL:completionHandler:", v7, v26, v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "dialogController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28[4] = self;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __105___SFBrowserContentViewController_webViewController_didReceiveAuthenticationChallenge_completionHandler___block_invoke;
    v29[3] = &unk_1E4AC1080;
    v29[4] = self;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __105___SFBrowserContentViewController_webViewController_didReceiveAuthenticationChallenge_completionHandler___block_invoke_2;
    v28[3] = &unk_1E4AC1080;
    objc_msgSend(v27, "presentDialog:animateAlongsidePresentation:dismissal:", v18, v29, v28);

    goto LABEL_10;
  }
  -[_SFPageLoadErrorController handleClientCertificateAuthenticationChallenge:completionHandler:](self->_pageLoadErrorController, "handleClientCertificateAuthenticationChallenge:completionHandler:", v7, v8);
LABEL_11:

}

- (BOOL)webViewControllerCanPromptForAccountSecurityRecommendation:(id)a3
{
  return !-[SFSafariViewControllerConfiguration _isPerformingAccountSecurityUpgrade](self->_configuration, "_isPerformingAccountSecurityUpgrade", a3);
}

- (BOOL)webViewControllerShouldFillStringForFind:(id)a3
{
  id v4;
  _QWORD v6[5];

  v4 = objc_alloc_init(MEMORY[0x1E0D8AC10]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76___SFBrowserContentViewController_webViewControllerShouldFillStringForFind___block_invoke;
  v6[3] = &unk_1E4AC1080;
  v6[4] = self;
  objc_msgSend(v4, "setHandler:", v6);
  LOBYTE(self) = self->_shouldFillStringForFind;

  return (char)self;
}

- (BOOL)webViewControllerCanFindNextOrPrevious:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (-[_SFBrowserContentViewController _onlyWantsWebAppShortcuts](self, "_onlyWantsWebAppShortcuts"))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "webView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CEF630], "_stringForFind");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v8, "length") != 0;

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (BOOL)webViewControllerShouldAutofillESimInformation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  id v20;
  id v21;
  _OWORD v22[4];
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0u;
  v24 = 0u;
  -[_SFBrowserContentViewController _hostAuditToken](self, "_hostAuditToken");
  memset(&v22[2], 0, 32);
  WBSAuditTokenValueArrayForEntitlement();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", CFSTR("public-cellular-plan")) & 1) != 0)
  {
    v22[0] = v23;
    v22[1] = v24;
    v21 = 0;
    objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForAuditToken:error:", v22, &v21);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v21;
    if (v6)
    {
      objc_msgSend(v6, "bundleIdentifier");
      v8 = objc_claimAutoreleasedReturnValue();
      if ((-[NSObject isEqualToString:](v8, "isEqualToString:", CFSTR("com.apple.Preferences")) & 1) != 0)
      {
LABEL_4:
        v9 = 1;
LABEL_20:

        goto LABEL_21;
      }
      objc_msgSend(v6, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.sfapp"));

      if ((v11 & 1) != 0)
      {
        v9 = 1;
LABEL_21:

        goto LABEL_22;
      }
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", 0);

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v4, "webView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "URL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "host");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "bundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        v16 = -[NSObject isAutofilleSIMIdAllowedForDomain:clientBundleIdentifier:error:](v8, "isAutofilleSIMIdAllowedForDomain:clientBundleIdentifier:error:", v14, v15, &v20);
        v7 = v20;

        if ((v16 & 1) != 0)
          goto LABEL_4;
        if (v7)
        {
          v17 = (id)WBS_LOG_CHANNEL_PREFIXESim();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v7, "safari_privacyPreservingDescription");
            objc_claimAutoreleasedReturnValue();
            -[_SFBrowserContentViewController webViewControllerShouldAutofillESimInformation:].cold.2();
          }

        }
      }
      else
      {
        v18 = WBS_LOG_CHANNEL_PREFIXESim();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[_SFBrowserContentViewController webViewControllerShouldAutofillESimInformation:].cold.3();
        v7 = 0;
      }
    }
    else
    {
      v8 = (id)WBS_LOG_CHANNEL_PREFIXESim();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[_SFBrowserContentViewController webViewControllerShouldAutofillESimInformation:].cold.1();
      }
    }
    v9 = 0;
    goto LABEL_20;
  }
  v9 = 0;
LABEL_22:

  return v9;
}

- (id)_contextMenuConfigurationForWebView:(id)a3 element:(id)a4
{
  +[_SFLinkPreviewHelper contextMenuConfigurationForWebView:elementInfo:handler:](_SFLinkPreviewHelper, "contextMenuConfigurationForWebView:elementInfo:handler:", a3, a4, self);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_contextMenuContentPreviewForWebView:(id)a3 element:(id)a4
{
  +[_SFLinkPreviewHelper contextMenuContentPreviewForWebView:elementInfo:handler:](_SFLinkPreviewHelper, "contextMenuContentPreviewForWebView:elementInfo:handler:", a3, a4, self);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_willCommitContextMenuForWebView:(id)a3 withAnimator:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "previewViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v6, "setPreferredCommitStyle:", objc_opt_isKindOfClass() & 1);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81___SFBrowserContentViewController__willCommitContextMenuForWebView_withAnimator___block_invoke;
  v9[3] = &unk_1E4AC1080;
  v8 = v5;
  v10 = v8;
  objc_msgSend(v6, "addAnimations:", v9);

}

- (void)webViewController:(id)a3 contextMenuConfigurationForElement:(id)a4 completionHandler:(id)a5
{
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v8 = (void (**)(id, void *))a5;
  objc_msgSend(a3, "webView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController _contextMenuConfigurationForWebView:element:](self, "_contextMenuConfigurationForWebView:element:", v9, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v10);

}

- (id)webViewController:(id)a3 contextMenuContentPreviewForElement:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "webView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController _contextMenuContentPreviewForWebView:element:](self, "_contextMenuContentPreviewForWebView:element:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)webViewController:(id)a3 contextMenuForElement:(id)a4 willCommitWithAnimator:(id)a5
{
  void *v7;
  id v8;

  v8 = a5;
  objc_msgSend(a3, "webView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController _willCommitContextMenuForWebView:withAnimator:](self, "_willCommitContextMenuForWebView:withAnimator:", v7, v8);

}

- (void)webViewController:(id)a3 contextMenuDidEndForElement:(id)a4
{
  void *v5;
  NSTimer *v6;
  NSTimer *previewCloseTimer;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_SFLinkPreviewHelper invalidateLinkPreviewHelperForWebView:](_SFLinkPreviewHelper, "invalidateLinkPreviewHelperForWebView:", v5);

  -[_SFBrowserContentViewController _invalidatePreviewCloseTimer](self, "_invalidatePreviewCloseTimer");
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__closePreviewDocumentTimerFired_, 0, 0, 0.0);
  v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  previewCloseTimer = self->_previewCloseTimer;
  self->_previewCloseTimer = v6;

}

- (void)_closePreviewDocumentTimerFired:(id)a3
{
  WKWebView *previewWebView;

  -[WKWebView _close](self->_previewWebView, "_close", a3);
  previewWebView = self->_previewWebView;
  self->_previewWebView = 0;

  -[_SFBrowserContentViewController _invalidatePreviewCloseTimer](self, "_invalidatePreviewCloseTimer");
}

- (void)_invalidatePreviewCloseTimer
{
  NSTimer *previewCloseTimer;

  -[NSTimer invalidate](self->_previewCloseTimer, "invalidate");
  previewCloseTimer = self->_previewCloseTimer;
  self->_previewCloseTimer = 0;

}

- (void)contextMenuConfigurationForReaderViewController:(id)a3 element:(id)a4 completionHandler:(id)a5
{
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v8 = (void (**)(id, void *))a5;
  objc_msgSend(a3, "readerWebView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController _contextMenuConfigurationForWebView:element:](self, "_contextMenuConfigurationForWebView:element:", v9, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v10);

}

- (void)readerViewController:(id)a3 contextMenuForElement:(id)a4 willCommitWithAnimator:(id)a5
{
  void *v7;
  id v8;

  v8 = a5;
  objc_msgSend(a3, "readerWebView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController _willCommitContextMenuForWebView:withAnimator:](self, "_willCommitContextMenuForWebView:withAnimator:", v7, v8);

}

- (void)readerViewController:(id)a3 contextMenuDidEndForElement:(id)a4
{
  id v4;

  objc_msgSend(a3, "readerWebView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[_SFLinkPreviewHelper invalidateLinkPreviewHelperForWebView:](_SFLinkPreviewHelper, "invalidateLinkPreviewHelperForWebView:");

}

- (id)linkPreviewHelper:(id)a3 previewViewControllerForURL:(id)a4
{
  id v6;
  id v7;
  _SFBrowserContentViewController *v8;
  void *v9;
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
  void *v21;
  void *v22;
  SFReaderEnabledWebViewController *v23;
  void *v24;
  void *v25;
  SFReaderEnabledWebViewController *v26;
  void *v27;
  void *v28;
  void *v29;
  WKWebView *v30;
  WKWebView *previewWebView;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(_SFBrowserContentViewController);
  -[_SFBrowserContentViewController browserView](v8, "browserView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentReadyForDisplay");
  objc_msgSend(v6, "elementInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController setActivatedElementInfo:](v8, "setActivatedElementInfo:", v10);

  -[_SFBrowserContentViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[_SFBrowserContentViewController view](v8, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController view](v8, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBackgroundColor:", v21);

  v23 = [SFReaderEnabledWebViewController alloc];
  -[_SFBrowserContentViewController webViewConfiguration](self, "webViewConfiguration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController contentBlockerManager](self, "contentBlockerManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[SFWebViewController initWithWebViewConfiguration:contentBlockerManager:](v23, "initWithWebViewConfiguration:contentBlockerManager:", v24, v25);

  -[_SFBrowserContentViewController _pushWebViewController:](v8, "_pushWebViewController:", v26);
  -[_SFBrowserContentViewController webViewController](v8, "webViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "webView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "_setAllowsMediaDocumentInlinePlayback:", 1);

  -[_SFBrowserContentViewController _didLoadWebView](v8, "_didLoadWebView");
  -[_SFBrowserContentViewController webViewController](v8, "webViewController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "webView");
  v30 = (WKWebView *)objc_claimAutoreleasedReturnValue();
  previewWebView = self->_previewWebView;
  self->_previewWebView = v30;

  -[_SFBrowserContentViewController webView](self, "webView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "_sessionState");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[_SFBrowserContentViewController webViewController](v8, "webViewController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "webView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (id)objc_msgSend(v35, "_restoreSessionState:andNavigate:", v33, 0);

  -[_SFBrowserContentViewController setDisplayMode:](v8, "setDisplayMode:", 1);
  -[_SFReloadOptionsController setSupportsAdvancedPrivacyProtections:](v8->_reloadOptionsController, "setSupportsAdvancedPrivacyProtections:", -[_SFBrowserContentViewController supportsAdvancedPrivacyProtectionsForURL:](self, "supportsAdvancedPrivacyProtectionsForURL:", v7));
  if (-[_SFReloadOptionsController loadedUsingDesktopUserAgent](self->_reloadOptionsController, "loadedUsingDesktopUserAgent"))
  {
    -[_SFReloadOptionsController requestDesktopSiteWithURL:](v8->_reloadOptionsController, "requestDesktopSiteWithURL:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C92C80], "safari_nonAppInitiatedRequestWithURL:", v7);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFBrowserContentViewController _requestBySettingAdvancedPrivacyProtectionsFlag:](self, "_requestBySettingAdvancedPrivacyProtectionsFlag:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    -[_SFBrowserContentViewController loadRequest:](v8, "loadRequest:", v38);
  }
  objc_msgSend(v9, "previewHeader");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActiveLinkPreviewHeader:", v39);

  return v8;
}

- (void)linkPreviewHelper:(id)a3 commitPreviewViewControllerForAction:(int64_t)a4 withTabOrder:(int64_t)a5
{
  id v6;
  NSObject *v7;
  WKWebView *previewWebView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  void *v15;
  _OWORD v16[3];
  uint8_t buf[16];

  v6 = a3;
  v7 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3B2D000, v7, OS_LOG_TYPE_DEFAULT, "Committing link preview of webpage link", buf, 2u);
  }
  -[_SFBrowserContentViewController _invalidatePreviewCloseTimer](self, "_invalidatePreviewCloseTimer");
  previewWebView = self->_previewWebView;
  self->_previewWebView = 0;

  objc_msgSend(v6, "previewContentViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "webViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "webView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  objc_msgSend(v11, "setBounds:");

  -[_SFBrowserContentViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  UIRectGetCenter();
  objc_msgSend(v11, "setCenter:");

  v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v16[0] = *MEMORY[0x1E0C9BAA8];
  v16[1] = v14;
  v16[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v11, "setTransform:", v16);
  objc_msgSend(v11, "_setAllowsMediaDocumentInlinePlayback:", 0);
  objc_msgSend(v11, "_unreachableURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    -[_SFPageLoadErrorController webViewDidCommitErrorPagePreview:](self->_pageLoadErrorController, "webViewDidCommitErrorPagePreview:", v11);
  objc_msgSend(v9, "_invalidateWebViewControllers");
  -[_SFBrowserContentViewController _popWebViewController](self, "_popWebViewController");
  -[_SFBrowserContentViewController _pushWebViewController:](self, "_pushWebViewController:", v10);
  -[_SFBrowserContentViewController _hideReaderAnimated:deactivationMode:](self, "_hideReaderAnimated:deactivationMode:", 0, 0);
  -[_SFBrowserContentViewController _updateUI](self, "_updateUI");

}

- (BOOL)linkPreviewHelper:(id)a3 supportsAction:(int64_t)a4 forURL:(id)a5
{
  return (unint64_t)a4 > 4 || (a4 & 0x1F) == 2;
}

- (id)linkPreviewHelper:(id)a3 resultOfLoadingURL:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C92C80], "safari_nonAppInitiatedRequestWithURL:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController resultOfLoadingRequest:inMainFrame:disallowRedirectToExternalApps:](self, "resultOfLoadingRequest:inMainFrame:disallowRedirectToExternalApps:", v5, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)linkPreviewHelper:(id)a3 redirectToExternalNavigationResult:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C92C80];
  v9 = v5;
  objc_msgSend(v5, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_nonAppInitiatedRequestWithURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController _redirectToExternalNavigationResult:fromOriginalRequest:promptPolicy:isMainFrame:userAction:](self, "_redirectToExternalNavigationResult:fromOriginalRequest:promptPolicy:isMainFrame:userAction:", v9, v8, 0, 1, 0);

}

- (void)linkPreviewHelper:(id)a3 didProduceNavigationIntent:(id)a4 forAction:(int64_t)a5
{
  void *v6;
  void *v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0C92C80];
  objc_msgSend(a4, "URL", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_nonAppInitiatedRequestWithURL:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController loadRequest:](self, "loadRequest:", v7);

}

- (void)linkPreviewHelperWillDisableLinkPreview
{
  WKWebView *previewWebView;

  -[WKWebView _close](self->_previewWebView, "_close");
  previewWebView = self->_previewWebView;
  self->_previewWebView = 0;

}

- (void)linkPreviewHelperWillOpenUniversalLinkLocally:(id)a3
{
  self->_shouldRevealAppLinkBannerForNextCommit = 1;
}

- (void)webViewControllerWillPresentJavaScriptDialog:(id)a3
{
  -[_SFDynamicBarAnimator attemptTransitionToState:animated:](self->_dynamicBarAnimator, "attemptTransitionToState:animated:", 1, 1);
}

- (void)webViewController:(id)a3 printFrame:(id)a4
{
  id v5;

  v5 = a4;
  if (-[_SFBrowserContentViewController canPrint](self, "canPrint"))
    -[_SFPrintController printFrame:initiatedByWebContent:completion:](self->_printController, "printFrame:initiatedByWebContent:completion:", v5, 1, 0);

}

- (void)webViewController:(id)a3 didStartLoadForQuickLookDocumentInMainFrameWithFileName:(id)a4 uti:(id)a5
{
  id v7;
  id v8;
  NSString *suggestedFilenameForNextCommit;
  SFQuickLookDocumentWriter *v10;
  SFQuickLookDocumentWriter *quickLookDocumentWriter;
  NSString *v12;

  v12 = (NSString *)a4;
  v7 = a5;
  v8 = objc_alloc(MEMORY[0x1E0D4ED28]);
  if (self->_suggestedFilenameForNextCommit)
    suggestedFilenameForNextCommit = self->_suggestedFilenameForNextCommit;
  else
    suggestedFilenameForNextCommit = v12;
  v10 = (SFQuickLookDocumentWriter *)objc_msgSend(v8, "initWithFileName:uti:", suggestedFilenameForNextCommit, v7);
  quickLookDocumentWriter = self->_quickLookDocumentWriter;
  self->_quickLookDocumentWriter = v10;

}

- (void)webViewController:(id)a3 didFinishLoadForQuickLookDocumentInMainFrame:(id)a4
{
  -[SFQuickLookDocumentWriter writeDataAndClose:completionHandler:](self->_quickLookDocumentWriter, "writeDataAndClose:completionHandler:", a4, 0);
}

- (int64_t)webViewController:(id)a3 presentationPolicyForDialog:(id)a4
{
  return objc_msgSend(a4, "completionHandlerBlocksWebProcess", a3) && self->_showingReader;
}

- (void)webViewController:(id)a3 didChangeFullScreen:(BOOL)a4
{
  self->_webViewIsInFullScreen = a4;
}

- (id)webViewController:(id)a3 didStartDownload:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  if (self->_activeDownload)
  {
    v6 = 0;
  }
  else
  {
    +[_SFDownloadDispatcher sharedDownloadDispatcher](_SFDownloadDispatcher, "sharedDownloadDispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "downloadFromWKDownload:userInitiatedAction:", v5, self->_lastUserInitiatedAction);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", self);
    objc_msgSend(v6, "setFluidProgressController:", self->_fluidProgressController);
    objc_storeStrong((id *)&self->_activeDownload, v6);

  }
  return v6;
}

- (void)webViewController:(id)a3 decidePolicyForSOAuthorizationLoadWithCurrentPolicy:(int64_t)a4 forExtension:(id)a5 completionHandler:(id)a6
{
  void (**v7)(id, _QWORD);

  v7 = (void (**)(id, _QWORD))a6;
  v7[2](v7, -[_SFBrowserContentViewController _isPreviewing](self, "_isPreviewing"));

}

- (BOOL)printControllerShouldPrintReader:(id)a3
{
  return self->_showingReader;
}

- (BOOL)printControllerPageIsLoading:(id)a3
{
  void *v3;
  char v4;

  -[_SFBrowserContentViewController webViewController](self, "webViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLoading");

  return v4;
}

- (BOOL)printControllerCanPresentPrintUI:(id)a3
{
  return !-[_SFBrowserContentViewController isBlockedByScreenTime](self, "isBlockedByScreenTime", a3);
}

- (void)printController:(id)a3 didCreatePrintInfo:(id)a4
{
  -[SFQuickLookDocument addQuickLookPrintSettingsToPrintInfo:](self->_quickLookDocument, "addQuickLookPrintSettingsToPrintInfo:", a4);
}

- (BOOL)isPageEligibileToShowNotSecureWarning
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[_SFBrowserContentViewController webViewController](self, "webViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserView quickLookDocumentView](self->_browserView, "quickLookDocumentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(v3, "didFirstVisuallyNonEmptyLayout"))
    {
      -[_SFBrowserContentViewController expectedOrCurrentURL](self, "expectedOrCurrentURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "safari_isEligibleToShowNotSecureWarning");
LABEL_11:

      goto LABEL_12;
    }
  }
  else if (objc_msgSend(v3, "didFirstVisuallyNonEmptyLayout"))
  {
    -[_SFBrowserContentViewController expectedOrCurrentURL](self, "expectedOrCurrentURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "safari_isEligibleToShowNotSecureWarning") & 1) != 0
      || (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v4, "_negotiatedLegacyTLS"))
    {
      objc_msgSend(v4, "_committedURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "host");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "safari_highLevelDomainFromHost");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFBrowserContentViewController expectedOrCurrentURL](self, "expectedOrCurrentURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "host");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "safari_highLevelDomainFromHost");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v10, "isEqualToString:", v13);

    }
    else
    {
      v7 = 0;
    }
    goto LABEL_11;
  }
  v7 = 0;
LABEL_12:

  return v7;
}

- (void)updateBottomBarOffset:(double)a3 topBarHeight:(double)a4
{
  -[_SFBrowserView setBottomBarOffset:](self->_browserView, "setBottomBarOffset:", a3);
  -[_SFBrowserView setTopBarHeight:](self->_browserView, "setTopBarHeight:", a4);
}

- (void)_dismiss
{
  -[_SFBrowserContentViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_showBarsFromBottomBarTap:(id)a3
{
  self->_pageScrollsWithBottomBar = 1;
  -[_SFDynamicBarAnimator attemptTransitionToState:animated:](self->_dynamicBarAnimator, "attemptTransitionToState:animated:", 1, 1);
}

- (void)_receivedTouchDown:(id)a3
{
  SFStepperContainer *stepperContainer;
  _QWORD v5[5];

  if (objc_msgSend(a3, "state") == 3)
  {
    stepperContainer = self->_stepperContainer;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __54___SFBrowserContentViewController__receivedTouchDown___block_invoke;
    v5[3] = &unk_1E4AC1080;
    v5[4] = self;
    -[SFStepperContainer hideStepperWithCompletion:](stepperContainer, "hideStepperWithCompletion:", v5);
  }
}

- (void)_receivedTouchUp:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 3 && self->_stepperMovedToRootView)
  {
    self->_stepperMovedToRootView = 0;
    -[_SFDynamicBarAnimator attemptTransitionToState:animated:](self->_dynamicBarAnimator, "attemptTransitionToState:animated:", 1, 1);
  }

}

- (void)stopLoading
{
  void *v3;
  id v4;

  -[_SFBrowserContentViewController webViewController](self, "webViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLoading:", 0);
  objc_msgSend(v4, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopLoading");

  -[WBSFluidProgressController cancelFluidProgressWithProgressStateSource:](self->_fluidProgressController, "cancelFluidProgressWithProgressStateSource:", self);
}

- (BOOL)dynamicBarAnimator:(id)a3 canTransitionToState:(int64_t)a4 byDraggingWithOffset:(double)a5
{
  BOOL v5;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double MaxY;
  double v17;
  CGRect v19;

  v9 = a3;
  if (a4 == 1)
  {
    v5 = !self->_keepBarsMinimized;
  }
  else if (!a4)
  {
    if (-[UIPanGestureRecognizer state](self->_hideNavigationBarGestureRecognizer, "state") <= 0)
    {
      -[_SFBrowserContentViewController _currentWebView](self, "_currentWebView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scrollView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "contentSize");
      v13 = v12;
      objc_msgSend(v11, "contentInset");
      v15 = v14;
      objc_msgSend(v11, "bounds");
      MaxY = CGRectGetMaxY(v19);
      -[_SFBrowserContentViewController _bottomToolbarHeight](self, "_bottomToolbarHeight");
      v5 = v13 + v15 - MaxY - a5 > v17;

    }
    else
    {
      v5 = 1;
    }
  }

  return v5;
}

- (void)dynamicBarAnimatorWillEnterSteadyState:(id)a3
{
  id v4;

  v4 = a3;
  -[_SFBrowserContentViewController _updateMaxVisibleHeightPercentageUserDriven:](self, "_updateMaxVisibleHeightPercentageUserDriven:", 1);
  if (objc_msgSend(v4, "state") == 1)
  {
    -[_SFDynamicBarAnimator setIgnoresDragging:](self->_dynamicBarAnimator, "setIgnoresDragging:", 0);
    self->_alwaysShowTopBar = 0;
  }

}

- (void)dynamicBarAnimatorStateDidChange:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_keepBarsMinimized && objc_msgSend(v4, "state") == 1)
  {
    self->_keepBarsMinimized = 0;
    -[_SFBrowserContentViewController _updateWebViewLayoutSize](self, "_updateWebViewLayoutSize");
  }

}

- (void)dynamicBarAnimatorOutputsDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  CGRect v10;
  CGRect v11;
  CGRect v12;

  v9 = a3;
  objc_msgSend(v9, "topBarHeight");
  if (self->_alwaysShowTopBar)
  {
    -[_SFBrowserView navigationBar](self->_browserView, "navigationBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultHeight");

  }
  objc_msgSend(v9, "bottomBarOffset");
  -[_SFBrowserContentViewController updateBottomBarOffset:topBarHeight:](self, "updateBottomBarOffset:topBarHeight:");
  -[_SFBrowserContentViewController _updateCrashBannerOffset](self, "_updateCrashBannerOffset");
  -[_SFBrowserContentViewController _updatePinnableBannerOffset](self, "_updatePinnableBannerOffset");
  -[_SFBrowserContentViewController _updateCurrentScrollViewInsets](self, "_updateCurrentScrollViewInsets");
  if (self->_pageScrollsWithBottomBar)
  {
    -[_SFBrowserView safeAreaInsets](self->_browserView, "safeAreaInsets");
    objc_msgSend(v9, "bottomBarOffset");
    -[_SFBrowserView bounds](self->_browserView, "bounds");
    CGRectGetHeight(v10);
    -[_SFBrowserView toolbar](self->_browserView, "toolbar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    CGRectGetHeight(v11);

    -[_SFBrowserView toolbar](self->_browserView, "toolbar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    CGRectGetMinY(v12);

    -[_SFBrowserView currentWebView](self->_browserView, "currentWebView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "contentOffset");
    objc_msgSend(v8, "setContentOffset:");

  }
  self->_shouldAutoHideHomeIndicator = objc_msgSend(v9, "state") == 0;
  -[_SFBrowserContentViewController _updateHomeIndicatorAutoHideState](self, "_updateHomeIndicatorAutoHideState");

}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id v4;
  _SFDynamicBarAnimator *dynamicBarAnimator;
  BOOL v6;

  v4 = a3;
  dynamicBarAnimator = self->_dynamicBarAnimator;
  if (dynamicBarAnimator && !-[_SFDynamicBarAnimator state](dynamicBarAnimator, "state"))
  {
    -[_SFDynamicBarAnimator attemptTransitionToState:animated:](self->_dynamicBarAnimator, "attemptTransitionToState:animated:", 1, 1);
    v6 = 0;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  double v5;
  _SFDynamicBarAnimator *dynamicBarAnimator;
  double v7;
  id v8;

  v4 = a3;
  self->_scrollViewIsDragging = 1;
  v8 = v4;
  objc_msgSend(v4, "contentOffset");
  -[_SFBrowserContentViewController _crashBannerDraggingOffsetForContentOffset:](self, "_crashBannerDraggingOffsetForContentOffset:");
  self->_crashBannerDraggingOffset = v5;
  if (-[_SFBrowserContentViewController _effectiveBarCollapsingEnabled](self, "_effectiveBarCollapsingEnabled"))
  {
    dynamicBarAnimator = self->_dynamicBarAnimator;
    objc_msgSend(v8, "contentOffset");
    -[_SFDynamicBarAnimator beginDraggingWithOffset:](dynamicBarAnimator, "beginDraggingWithOffset:", v7);
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  void *v6;
  CGFloat v7;
  _SFDynamicBarAnimator *dynamicBarAnimator;
  double v9;
  id v10;
  CGRect v11;

  v10 = a3;
  -[_SFBrowserContentViewController _updateScrollToTopView](self, "_updateScrollToTopView");
  if (self->_showingCrashBanner)
  {
    -[_SFBrowserContentViewController _updateCrashBannerOffset](self, "_updateCrashBannerOffset");
    -[_SFBrowserView crashBannerOffset](self->_browserView, "crashBannerOffset");
    v5 = v4;
    -[_SFBrowserView crashBanner](self->_browserView, "crashBanner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v7 = -CGRectGetHeight(v11);

    if (v5 < v7)
      -[_SFBrowserContentViewController _setShowingCrashBanner:animated:](self, "_setShowingCrashBanner:animated:", 0, 0);
  }
  if (self->_showingPinnableBanner)
    -[_SFBrowserContentViewController _updatePinnableBannerOffset](self, "_updatePinnableBannerOffset");
  if (self->_showingCrashBanner || self->_showingPinnableBanner)
    -[_SFBrowserContentViewController _updateCurrentScrollViewInsets](self, "_updateCurrentScrollViewInsets");
  -[_SFBrowserView layoutIfNeeded](self->_browserView, "layoutIfNeeded");
  if (-[_SFBrowserContentViewController _effectiveBarCollapsingEnabled](self, "_effectiveBarCollapsingEnabled"))
  {
    if (-[_SFDynamicBarAnimator isTrackingDrag](self->_dynamicBarAnimator, "isTrackingDrag"))
      self->_pageScrollsWithBottomBar = 0;
    -[_SFBrowserContentViewController _updateDynamicBarGeometry](self, "_updateDynamicBarGeometry");
    if (self->_scrollViewIsDragging)
    {
      if (self->_usesNarrowLayout
        && objc_msgSend(v10, "_sf_isScrolledToOrPastBottom")
        && !self->_keepBarsMinimized)
      {
        -[_SFDynamicBarAnimator attemptTransitionToState:animated:](self->_dynamicBarAnimator, "attemptTransitionToState:animated:", 1, 1);
      }
      dynamicBarAnimator = self->_dynamicBarAnimator;
      objc_msgSend(v10, "contentOffset");
      -[_SFDynamicBarAnimator updateDraggingWithOffset:](dynamicBarAnimator, "updateDraggingWithOffset:", v9);
      -[_SFBrowserContentViewController _updateMaxVisibleHeightPercentageUserDriven:](self, "_updateMaxVisibleHeightPercentageUserDriven:", 1);
    }
  }

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  id v8;

  y = a4.y;
  v8 = a3;
  if (self->_scrollViewIsDragging)
  {
    self->_scrollViewIsDragging = 0;
    if (-[_SFBrowserContentViewController _effectiveBarCollapsingEnabled](self, "_effectiveBarCollapsingEnabled"))
      -[_SFDynamicBarAnimator endDraggingWithTargetOffset:velocity:](self->_dynamicBarAnimator, "endDraggingWithTargetOffset:velocity:", a5->y, y * 1000.0);
  }

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[_SFBrowserContentViewController _didCompleteScrolling](self, "_didCompleteScrolling", a3);
}

- (void)_didCompleteScrolling
{
  -[_SFBrowserContentViewController _updateMaxVisibleHeightPercentageUserDriven:](self, "_updateMaxVisibleHeightPercentageUserDriven:", 1);
}

- (void)_updateModalInPresentation
{
  if (-[_SFBrowserContentViewController _isUsedForAuthentication](self, "_isUsedForAuthentication")
    || -[SFSafariViewControllerConfiguration _isPerformingAccountSecurityUpgrade](self->_configuration, "_isPerformingAccountSecurityUpgrade"))
  {
    -[_SFBrowserContentViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  }
}

- (NSString)_hostAppBundleId
{
  return 0;
}

- (BOOL)_shouldReloadImmediatelyAfterPageLoadError
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[_SFBrowserContentViewController viewIfLoaded](self, "viewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "activationState") == 0;
  else
    v5 = 0;

  return v5;
}

- (void)setSafariDataSharingMode:(int64_t)a3
{
  void *v5;
  _SFToolbar *bottomToolbar;
  SFReaderEnabledWebViewController *v7;
  void *v8;
  void *v9;
  SFReaderEnabledWebViewController *v10;
  int64_t v11;
  void *v12;
  void *v13;
  id v14;

  if (self->_safariDataSharingMode != a3)
  {
    -[_SFBrowserContentViewController webView](self, "webView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    -[_SFBrowserContentViewController _hideReaderAnimated:deactivationMode:](self, "_hideReaderAnimated:deactivationMode:", 0, 0);
    -[_SFBrowserContentViewController _invalidateWebViewControllers](self, "_invalidateWebViewControllers");
    bottomToolbar = self->_bottomToolbar;
    self->_bottomToolbar = 0;

    self->_safariDataSharingMode = a3;
    v7 = [SFReaderEnabledWebViewController alloc];
    -[_SFBrowserContentViewController webViewConfiguration](self, "webViewConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFBrowserContentViewController contentBlockerManager](self, "contentBlockerManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SFWebViewController initWithWebViewConfiguration:contentBlockerManager:](v7, "initWithWebViewConfiguration:contentBlockerManager:", v8, v9);

    -[_SFBrowserContentViewController _pushWebViewController:](self, "_pushWebViewController:", v10);
    v11 = -[_SFBrowserContentViewController _persona](self, "_persona");
    -[_SFPerSitePreferencesVendor requestDesktopSitePreferenceManager](self->_perSitePreferencesVendor, "requestDesktopSitePreferenceManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setClientPrefersMobileUserAgentByDefault:", ((v11 - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0);

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0C92C80], "safari_nonAppInitiatedRequestWithURL:", v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFBrowserContentViewController loadRequest:](self, "loadRequest:", v13);

    }
    -[_SFBrowserContentViewController _updateModalInPresentation](self, "_updateModalInPresentation");

  }
}

- (void)navigationBarMetricsDidChange:(id)a3
{
  void *v4;

  -[_SFDynamicBarAnimator attemptTransitionToState:animated:](self->_dynamicBarAnimator, "attemptTransitionToState:animated:", 1, 0);
  -[_SFBrowserView navigationBar](self->_browserView, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultHeight");
  -[_SFBrowserView setTopBarHeight:](self->_browserView, "setTopBarHeight:");

  -[_SFBrowserContentViewController _layOutBrowserViewForSizeTransition](self, "_layOutBrowserViewForSizeTransition");
  -[_SFBrowserContentViewController _didCompleteViewSizeTransition](self, "_didCompleteViewSizeTransition");
}

- (void)_showBars
{
  -[_SFDynamicBarAnimator attemptTransitionToState:animated:](self->_dynamicBarAnimator, "attemptTransitionToState:animated:", 1, 1);
}

- (id)pageFormatMenuController
{
  _SFPageFormatMenuController *pageFormatMenuController;
  _SFPageFormatMenuController *v4;
  _SFPageFormatMenuController *v5;

  pageFormatMenuController = self->_pageFormatMenuController;
  if (!pageFormatMenuController)
  {
    v4 = -[_SFPageFormatMenuController initWithBrowserContentController:]([_SFPageFormatMenuController alloc], "initWithBrowserContentController:", self);
    v5 = self->_pageFormatMenuController;
    self->_pageFormatMenuController = v4;

    pageFormatMenuController = self->_pageFormatMenuController;
  }
  return pageFormatMenuController;
}

- (void)navigationBarFormatMenuButtonWasTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[_SFBrowserContentViewController pageFormatMenuController](self, "pageFormatMenuController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reportSVCToolbarButtonUsage:", 35);

  }
  -[_SFBrowserContentViewController _dismissTransientUIAnimated:](self, "_dismissTransientUIAnimated:", 1);
  objc_msgSend(v4, "formatMenuButtonPopoverSourceInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "presentMenuFromViewController:withSourceInfo:", self, v9);

  if ((v10 & 1) != 0)
  {
    -[_SFBrowserContentViewController assistantController](self, "assistantController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFBrowserContentViewController webView](self, "webView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_committedURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74___SFBrowserContentViewController_navigationBarFormatMenuButtonWasTapped___block_invoke;
    v14[3] = &unk_1E4AC5E78;
    v15 = v5;
    objc_msgSend(v11, "updateAssistantContentForURL:completionHandler:", v13, v14);

  }
}

- (void)navigationBarFormatMenuButtonBecameUnavailable:(id)a3
{
  void *v3;
  id v4;

  -[_SFBrowserContentViewController pageFormatMenuController](self, "pageFormatMenuController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_hideNavigationBarGestureRecognized:(id)a3
{
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "translationInView:", self->_browserView);
  v5 = v4;
  -[_SFBrowserView currentWebView](self->_browserView, "currentWebView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v10, "state");
  if ((unint64_t)(v7 - 3) >= 3)
  {
    v9 = -v5;
    if (v7 == 1)
    {
      objc_msgSend(v6, "_beginInteractiveObscuredInsetsChange");
      -[_SFDynamicBarAnimator beginDraggingWithOffset:](self->_dynamicBarAnimator, "beginDraggingWithOffset:", v9);
    }
    else if (v7 == 2)
    {
      -[_SFBrowserContentViewController _updateDynamicBarGeometry](self, "_updateDynamicBarGeometry");
      -[_SFDynamicBarAnimator updateDraggingWithOffset:](self->_dynamicBarAnimator, "updateDraggingWithOffset:", v9);
    }
  }
  else
  {
    objc_msgSend(v6, "_endInteractiveObscuredInsetsChange");
    objc_msgSend(v10, "velocityInView:", self->_browserView);
    -[_SFDynamicBarAnimator endDraggingWithTargetOffset:velocity:](self->_dynamicBarAnimator, "endDraggingWithTargetOffset:velocity:", (double)(v8 / log(*MEMORY[0x1E0DC5368]) - v5), v8 * -1000.0);
    if (!-[_SFDynamicBarAnimator targetState](self->_dynamicBarAnimator, "targetState"))
      self->_keepBarsMinimized = 1;
  }

}

- (void)navigationBarReaderButtonWasTapped:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_showingReader
    || (-[_SFBrowserContentViewController webViewController](self, "webViewController"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "readerController"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isReaderAvailable"),
        v5,
        v4,
        v6))
  {
    -[_SFBrowserContentViewController toggleShowingReaderForUserAction](self, "toggleShowingReaderForUserAction");
  }
  objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reportSVCToolbarButtonUsage:", 25);

}

- (void)navigationBarTranslateButtonWasTapped:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  _SFTranslationTargetLocaleAlertController *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[_SFBrowserContentViewController translationContext](self, "translationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "availableTargetLocaleIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    if (v6 == 1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v7 = (_SFTranslationTargetLocaleAlertController *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "requestTranslatingWebpageToLocale:completionHandler:", v7, 0);
    }
    else
    {
      v7 = -[_SFTranslationTargetLocaleAlertController initWithTranslationContext:]([_SFTranslationTargetLocaleAlertController alloc], "initWithTranslationContext:", v4);
      objc_msgSend(v10, "formatMenuButtonPopoverSourceInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFTranslationTargetLocaleAlertController configurePopoverWithSourceInfo:](v7, "configurePopoverWithSourceInfo:", v8);

      -[_SFBrowserContentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
    }

  }
  objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reportSVCToolbarButtonUsage:", 27);

}

- (void)_translationAvailabilityDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _SFBrowserContentViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69___SFBrowserContentViewController__translationAvailabilityDidChange___block_invoke;
  v6[3] = &unk_1E4AC0590;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)navigationBarFormatMenuButtonStartedInteraction:(id)a3
{
  void *v3;
  id v4;

  -[_SFBrowserContentViewController webViewController](self, "webViewController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "checkReaderAvailability");

}

- (void)navigationBarReloadButtonWasTapped:(id)a3
{
  id v4;

  if (!-[_SFBrowserContentViewController _suppressReloadToPreventLoadingJavaScriptIfNecessary](self, "_suppressReloadToPreventLoadingJavaScriptIfNecessary", a3))
  {
    -[_SFBrowserContentViewController _reloadFromOrigin:](self, "_reloadFromOrigin:", 0);
    self->_isNavigatingViaNormalReload = 1;
    objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reportSVCToolbarButtonUsage:", 22);

  }
}

- (void)_reloadFromOrigin:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  id v7;
  _SFReaderViewController *readerViewController;
  id v9;

  v3 = a3;
  if (!-[_SFBrowserContentViewController _suppressReloadToPreventLoadingJavaScriptIfNecessary](self, "_suppressReloadToPreventLoadingJavaScriptIfNecessary"))
  {
    self->_externalAppRedirectState = 4;
    self->_loadWasUserDriven = 1;
    -[_SFBrowserContentViewController _willBeginUserInitiatedNavigation](self, "_willBeginUserInitiatedNavigation");
    -[_SFBrowserContentViewController webViewController](self, "webViewController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "webView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLoading:", 1);
    if (v3)
      v6 = (id)objc_msgSend(v5, "reloadFromOrigin");
    else
      v7 = (id)objc_msgSend(v5, "reload");
    -[_SFReaderViewController setDelegate:](self->_readerViewController, "setDelegate:", 0);
    readerViewController = self->_readerViewController;
    self->_readerViewController = 0;

  }
}

- (void)navigationBarStopLoadingButtonWasTapped:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[_SFBrowserContentViewController webViewController](self, "webViewController", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLoading:", 0);
  objc_msgSend(v5, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopLoading");

  objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportSVCToolbarButtonUsage:", 23);

}

- (id)navigationBarURLForSharing:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[_SFBrowserContentViewController webView](self, "webView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setTitle:", v5);

  return v4;
}

- (void)navigationBarMediaStateMuteButtonWasTapped:(id)a3
{
  uint64_t v3;
  id v4;

  -[_SFBrowserContentViewController webView](self, "webView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (_SFMediaStateIconIsMuted())
    v3 = 0;
  else
    v3 = 2;
  objc_msgSend(v4, "_setPageMuted:", v3);

}

- (void)navigationBar:(id)a3 didCreateLeadingToolbar:(id)a4 trailingToolbar:(id)a5
{
  id v7;
  int64_t v8;
  id v9;

  v9 = a4;
  v7 = a5;
  v8 = -[_SFBrowserContentViewController _persona](self, "_persona");
  -[_SFBarManager registerToolbar:withLayout:persona:](self->_barManager, "registerToolbar:withLayout:persona:", v9, 0, v8);
  -[_SFBarManager registerToolbar:withLayout:persona:](self->_barManager, "registerToolbar:withLayout:persona:", v7, 1, v8);

}

- (BOOL)createFluidProgressState
{
  _SFDownload *downloadToShowInQuickLook;
  WBSFluidProgressState *v4;
  WBSFluidProgressState *fluidProgressState;
  WBSFluidProgressState *v6;
  void *v7;
  void *v8;

  downloadToShowInQuickLook = self->_downloadToShowInQuickLook;
  if (!downloadToShowInQuickLook && !self->_fluidProgressState)
  {
    v4 = (WBSFluidProgressState *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A910]), "initWithType:", 0);
    fluidProgressState = self->_fluidProgressState;
    self->_fluidProgressState = v4;

    v6 = self->_fluidProgressState;
    -[_SFBrowserContentViewController expectedOrCurrentURL](self, "expectedOrCurrentURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safari_originalDataAsString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSFluidProgressState setLoadURL:](v6, "setLoadURL:", v8);

  }
  return downloadToShowInQuickLook == 0;
}

- (void)clearFluidProgressState
{
  WBSFluidProgressState *fluidProgressState;

  fluidProgressState = self->_fluidProgressState;
  self->_fluidProgressState = 0;

}

- (id)progressState
{
  return self->_fluidProgressState;
}

- (void)_setSuppressingPreviewProgressAnimation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if (self->_isSuppressingPreviewProgressAnimation != a3)
  {
    v3 = a3;
    self->_isSuppressingPreviewProgressAnimation = a3;
    -[_SFBrowserView previewHeader](self->_browserView, "previewHeader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "progressView");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
      -[WBSFluidProgressController setProgressAnimationSuppressed:forProgressStateSource:animated:](self->_fluidProgressController, "setProgressAnimationSuppressed:forProgressStateSource:animated:", v3, self, 0);

  }
}

- (id)expectedOrCurrentURL
{
  void *v2;
  void *v3;

  -[_SFBrowserContentViewController webView](self, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)estimatedProgress
{
  void *v2;
  double v3;
  double v4;

  -[_SFBrowserContentViewController webView](self, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "estimatedProgress");
  v4 = v3;

  return v4;
}

- (BOOL)hasFailedURL
{
  void *v2;
  void *v3;
  BOOL v4;

  -[_SFBrowserContentViewController webView](self, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_unreachableURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)currentFluidProgressStateSource
{
  _SFDownload *activeDownload;
  _SFDownload *v3;
  uint64_t v5;
  void *v6;
  BOOL v7;
  _SFBrowserContentViewController *v8;

  activeDownload = self->_activeDownload;
  if (activeDownload)
  {
    v3 = activeDownload;
  }
  else
  {
    -[_SFBrowserContentViewController translationContext](self, "translationContext");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = !self->_shouldReflectTranslationAsFluidProgress;
    else
      v7 = 1;
    if (v7)
      v8 = self;
    else
      v8 = (_SFBrowserContentViewController *)v5;
    v3 = v8;

  }
  return v3;
}

- (void)fluidProgressRocketAnimationDidComplete
{
  id v2;

  if (self->_shouldReflectTranslationAsFluidProgress)
  {
    -[_SFBrowserContentViewController translationContext](self, "translationContext");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "clearFluidProgressState");

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UITapGestureRecognizer *v6;
  id v7;
  BOOL v8;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  CGRect v15;

  v6 = (UITapGestureRecognizer *)a3;
  v7 = a4;
  if (self->_showBarsFromBottomBarRecognizer == v6)
  {
    if (self->_keepBarsMinimized || -[_SFDynamicBarAnimator state](self->_dynamicBarAnimator, "state"))
    {
      v8 = 0;
    }
    else
    {
      -[_SFBrowserView bounds](self->_browserView, "bounds");
      v11 = v10;
      objc_msgSend(v7, "locationInView:", self->_browserView);
      v13 = v12;
      -[_SFBrowserView toolbar](self->_browserView, "toolbar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bounds");
      v8 = v11 - v13 < CGRectGetHeight(v15);

    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  return self->_showBarsFromBottomBarRecognizer == a3;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *v5;

  v4 = (UITapGestureRecognizer *)a3;
  v5 = v4;
  if ((UITapGestureRecognizer *)self->_hideNavigationBarGestureRecognizer == v4)
  {
    LOBYTE(self) = -[_SFBrowserContentViewController canHideToolbar](self, "canHideToolbar");
  }
  else if (self->_showBarsFromBottomBarRecognizer == v4)
  {
    LODWORD(self) = !-[_SFDynamicBarAnimator isTrackingDrag](self->_dynamicBarAnimator, "isTrackingDrag");
  }
  else
  {
    LOBYTE(self) = 1;
  }

  return (char)self;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return self->_touchDownGestureRecognizer == a3 || self->_touchUpGestureRecognizer == a3;
}

- (void)addBookmarkNavController:(id)a3 didFinishWithResult:(BOOL)a4 bookmark:(id)a5
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0, a5);
}

- (BOOL)addBookmarkNavControllerCanSaveBookmarkChanges:(id)a3
{
  return 1;
}

- (BOOL)pageLoadErrorControllerShouldHandleCertificateError:(id)a3
{
  return 1;
}

- (void)pageLoadErrorController:(id)a3 loadFailedRequestAfterError:(id)a4
{
  -[_SFBrowserContentViewController loadRequest:](self, "loadRequest:", a4);
}

- (id)pageLoadErrorControllerGetSecIdentityPreferencesController:(id)a3
{
  _SFSecIdentityPreferencesController *secIdentityPreferencesController;
  _SFSecIdentityPreferencesController *v5;
  _SFSecIdentityPreferencesController *v6;

  secIdentityPreferencesController = self->_secIdentityPreferencesController;
  if (!secIdentityPreferencesController)
  {
    +[_SFSecIdentityPreferencesController sharedPersistentSecIdentityPreferencesController](_SFSecIdentityPreferencesController, "sharedPersistentSecIdentityPreferencesController", a3);
    v5 = (_SFSecIdentityPreferencesController *)objc_claimAutoreleasedReturnValue();
    v6 = self->_secIdentityPreferencesController;
    self->_secIdentityPreferencesController = v5;

    secIdentityPreferencesController = self->_secIdentityPreferencesController;
  }
  return secIdentityPreferencesController;
}

- (void)pageLoadErrorController:(id)a3 presentViewController:(id)a4
{
  -[_SFBrowserContentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
}

- (BOOL)pageLoadErrorControllerShouldPermanentlyAcceptCertificate:(id)a3
{
  return 1;
}

- (void)pageLoadErrorControllerReloadWithoutPrivateRelay:(id)a3
{
  -[_SFBrowserContentViewController reloadEnablingDowngradedPrivateRelay:](self, "reloadEnablingDowngradedPrivateRelay:", 1);
}

- (void)downloadDidFail:(id)a3
{
  _SFDownload *activeDownload;

  activeDownload = self->_activeDownload;
  self->_activeDownload = 0;

}

- (void)downloadDidFinish:(id)a3
{
  id v4;
  _SFDownload *activeDownload;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  activeDownload = self->_activeDownload;
  self->_activeDownload = 0;

  if (-[_SFBrowserContentViewController _canShowDownloadWithoutPrompting:](self, "_canShowDownloadWithoutPrompting:", v4))
  {
    -[_SFBrowserContentViewController _showDownload:](self, "_showDownload:", v4);
  }
  else
  {
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E0D4EC60];
    v7 = objc_msgSend(v4, "fileType");
    -[_SFBrowserContentViewController webView](self, "webView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53___SFBrowserContentViewController_downloadDidFinish___block_invoke;
    v12[3] = &unk_1E4AC62D8;
    objc_copyWeak(&v14, &location);
    v13 = v4;
    objc_msgSend(v6, "downloadBlockedDialogWithFileType:initiatingURL:completionHandler:", v7, v9, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[_SFBrowserContentViewController webViewController](self, "webViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentDialog:sender:", v10, self);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

- (void)downloadDidReceiveResponse:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "fileType") == 2)
  {
    objc_msgSend(v6, "quickLookDocument");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[_SFBrowserContentViewController _quickLookDocumentForDownload:](self, "_quickLookDocumentForDownload:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setQuickLookDocument:", v5);

    }
  }

}

- (BOOL)_canShowDownloadWithoutPrompting:(id)a3
{
  id v4;
  int v5;
  _WKUserInitiatedAction *v7;
  _WKUserInitiatedAction *v8;

  v4 = a3;
  if (objc_msgSend(v4, "fileType") == 1 || objc_msgSend(v4, "fileType") == 6)
  {
    LOBYTE(v5) = 0;
  }
  else if (objc_msgSend(v4, "fileType") == 2 || self->_canOpenDownloadForInitialLoad)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_msgSend(v4, "userInitiatedAction");
    v7 = (_WKUserInitiatedAction *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && v7 == self->_lastUserInitiatedAction)
      v5 = -[_WKUserInitiatedAction isConsumed](v7, "isConsumed") ^ 1;
    else
      LOBYTE(v5) = 0;

  }
  return v5;
}

- (void)_showDownload:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  _SFContactPreviewViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  BOOL v31;
  NSObject *v32;
  void *v33;
  _SFContactPreviewViewController *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  objc_class *v38;
  NSObject *v39;
  void *v40;
  id v41;
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[4];
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;

  v5 = a3;
  v6 = objc_msgSend(v5, "fileType");
  objc_msgSend(v5, "fileDownloadPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_canOpenDownloadForInitialLoad = 0;
  objc_msgSend(v5, "userInitiatedAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isConsumed");

  if ((v9 & 1) == 0)
  {
    objc_msgSend(v5, "userInitiatedAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "consume");

  }
  switch(v6)
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v7);
      v11 = (_SFContactPreviewViewController *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_web_removeFileOnlyAtPath:", v7);

      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lastPathComponent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SFBrowserContentViewController bundleIdentifierForProfileInstallation](self, "bundleIdentifierForProfileInstallation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __49___SFBrowserContentViewController__showDownload___block_invoke_311;
        v42[3] = &unk_1E4AC6328;
        v42[4] = self;
        objc_msgSend(v13, "queueFileDataForAcceptance:originalFileName:forBundleID:completion:", v11, v14, v15, v42);

        goto LABEL_22;
      }
      v39 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        -[_SFBrowserContentViewController _showDownload:].cold.2();
      -[_SFPageLoadErrorController addInvalidProfileAlert](self->_pageLoadErrorController, "addInvalidProfileAlert");
      goto LABEL_23;
    case 2:
      objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mimeType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uti");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_sf_didBeginDownloadWithMIMEType:uti:downloadType:promptType:browserPersona:", v17, v18, 0, 0, -[_SFBrowserContentViewController _persona](self, "_persona"));

      objc_storeStrong((id *)&self->_downloadToShowInQuickLook, a3);
      objc_msgSend(v5, "quickLookDocument");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setSavedPath:shouldDelete:", v7, 1);

      -[_SFBrowserContentViewController webView](self, "webView");
      v11 = (_SFContactPreviewViewController *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sourceURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFContactPreviewViewController _loadAlternateHTMLString:baseURL:forUnreachableURL:](v11, "_loadAlternateHTMLString:baseURL:forUnreachableURL:", 0, 0, v13);
      goto LABEL_22;
    case 3:
      v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v7, 0);
      objc_msgSend(v5, "uti");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23 && (objc_msgSend(v23, "conformsToType:", *MEMORY[0x1E0CEC6B0]) & 1) != 0)
        {
          v52 = 0;
          v53 = &v52;
          v54 = 0x2050000000;
          v25 = (void *)getPKPassesXPCContainerClass(void)::softClass;
          v55 = getPKPassesXPCContainerClass(void)::softClass;
          if (!getPKPassesXPCContainerClass(void)::softClass)
          {
            v47 = MEMORY[0x1E0C809B0];
            v48 = 3221225472;
            v49 = ___ZL28getPKPassesXPCContainerClassv_block_invoke;
            v50 = &unk_1E4ABFDC0;
            v51 = &v52;
            ___ZL28getPKPassesXPCContainerClassv_block_invoke((uint64_t)&v47);
            v25 = (void *)v53[3];
          }
          v26 = objc_retainAutorelease(v25);
          _Block_object_dispose(&v52, 8);
          v27 = (void *)objc_msgSend([v26 alloc], "initWithFileURL:", v21);
          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = __49___SFBrowserContentViewController__showDownload___block_invoke;
          v44[3] = &unk_1E4AC6300;
          v45 = v20;
          objc_msgSend(v27, "unarchivePassesWithBlock:", v44);
          v28 = 0;
          v29 = v45;
          goto LABEL_35;
        }
      }
      else
      {
        v24 = 0;
      }
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v21);
      v52 = 0;
      v53 = &v52;
      v54 = 0x2050000000;
      v40 = (void *)getPKPassClass(void)::softClass;
      v55 = getPKPassClass(void)::softClass;
      if (!getPKPassClass(void)::softClass)
      {
        v47 = MEMORY[0x1E0C809B0];
        v48 = 3221225472;
        v49 = ___ZL14getPKPassClassv_block_invoke;
        v50 = &unk_1E4ABFDC0;
        v51 = &v52;
        ___ZL14getPKPassClassv_block_invoke((uint64_t)&v47);
        v40 = (void *)v53[3];
      }
      v41 = objc_retainAutorelease(v40);
      _Block_object_dispose(&v52, 8);
      v46 = 0;
      v29 = (void *)objc_msgSend(v41, "createWithData:warnings:error:", v27, 0, &v46);
      v28 = v46;
      objc_msgSend(v20, "safari_addObjectUnlessNil:", v29);
LABEL_35:

      if (!objc_msgSend(v20, "count") || v28)
        -[_SFBrowserContentViewController _showGenericDownloadAlert](self, "_showGenericDownloadAlert");
      else
        -[_SFBrowserContentViewController _showPassBookControllerForPasses:](self, "_showPassBookControllerForPasses:", v20);

LABEL_24:
      return;
    case 4:
      objc_msgSend(v5, "sourceURL");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[_SFBrowserContentViewController _showICSControllerForPath:sourceURL:](self, "_showICSControllerForPath:sourceURL:", v7, v30);

      if (!v31)
      {
        v32 = WBS_LOG_CHANNEL_PREFIXDownloads();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          -[_SFBrowserContentViewController _showDownload:].cold.1();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "_web_removeFileOnlyAtPath:", v7);

        -[_SFBrowserContentViewController _showGenericDownloadAlert](self, "_showGenericDownloadAlert");
      }
      goto LABEL_24;
    case 5:
      v34 = [_SFContactPreviewViewController alloc];
      objc_msgSend(v5, "sourceURL");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[_SFContactPreviewViewController initWithFilePath:sourceURL:deleteFileWhenDone:beforeDismissHandler:](v34, "initWithFilePath:sourceURL:deleteFileWhenDone:beforeDismissHandler:", v7, v35, 1, 0);

      if (v11)
      {
        -[_SFBrowserContentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
      }
      else
      {
        objc_msgSend(v5, "removeFromDisk");
        -[_SFBrowserContentViewController _showGenericDownloadAlert](self, "_showGenericDownloadAlert");
      }
      goto LABEL_23;
    case 6:
      v52 = 0;
      v53 = &v52;
      v54 = 0x2050000000;
      v36 = (void *)getCLKWatchFaceLibraryClass(void)::softClass;
      v55 = getCLKWatchFaceLibraryClass(void)::softClass;
      v37 = MEMORY[0x1E0C809B0];
      if (!getCLKWatchFaceLibraryClass(void)::softClass)
      {
        v47 = MEMORY[0x1E0C809B0];
        v48 = 3221225472;
        v49 = ___ZL27getCLKWatchFaceLibraryClassv_block_invoke;
        v50 = &unk_1E4ABFDC0;
        v51 = &v52;
        ___ZL27getCLKWatchFaceLibraryClassv_block_invoke((uint64_t)&v47);
        v36 = (void *)v53[3];
      }
      v38 = objc_retainAutorelease(v36);
      _Block_object_dispose(&v52, 8);
      v11 = (_SFContactPreviewViewController *)objc_alloc_init(v38);
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v7, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v37;
      v43[1] = 3221225472;
      v43[2] = __49___SFBrowserContentViewController__showDownload___block_invoke_308;
      v43[3] = &unk_1E4AC1230;
      v43[4] = self;
      -[_SFContactPreviewViewController _addWatchFaceAtURL:shouldValidate:completionHandler:](v11, "_addWatchFaceAtURL:shouldValidate:completionHandler:", v13, 0, v43);
LABEL_22:

      goto LABEL_23;
    case 7:
      v11 = (_SFContactPreviewViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v7, 0);
      -[_SFBrowserContentViewController _showFinanceKitOrderPreviewControllerWithURL:dismissalHandler:](self, "_showFinanceKitOrderPreviewControllerWithURL:dismissalHandler:", v11, 0);
      if ((objc_msgSend(v5, "explicitlySaved") & 1) == 0)
        objc_msgSend(v5, "removeFromDisk");
LABEL_23:

      goto LABEL_24;
    default:
      goto LABEL_24;
  }
}

- (void)_showPassBookControllerForPasses:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)getPKAddPassesViewControllerClass()), "initWithPasses:fromPresentationSource:", v5, 0);
  objc_msgSend(v4, "setDelegate:", self);
  -[_SFBrowserContentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)_showFinanceKitOrderPreviewControllerWithURL:(id)a3 dismissalHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v8 = (void *)getFKSaveOrderClass(void)::softClass;
  v20 = getFKSaveOrderClass(void)::softClass;
  v9 = MEMORY[0x1E0C809B0];
  if (!getFKSaveOrderClass(void)::softClass)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = ___ZL19getFKSaveOrderClassv_block_invoke;
    v16[3] = &unk_1E4ABFDC0;
    v16[4] = &v17;
    ___ZL19getFKSaveOrderClassv_block_invoke((uint64_t)v16);
    v8 = (void *)v18[3];
  }
  v10 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v17, 8);
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __97___SFBrowserContentViewController__showFinanceKitOrderPreviewControllerWithURL_dismissalHandler___block_invoke;
  v12[3] = &unk_1E4AC6350;
  objc_copyWeak(&v14, &location);
  v11 = v7;
  v13 = v11;
  objc_msgSend(v10, "saveOrderAtURL:completion:", v6, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (BOOL)_showICSControllerForPath:(id)a3 sourceURL:(id)a4
{
  id v6;
  id v7;
  _SFICSPreviewViewController *v8;
  _SFICSPreviewViewController *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[_SFICSPreviewViewController initWithFilePath:sourceURL:]([_SFICSPreviewViewController alloc], "initWithFilePath:sourceURL:", v6, v7);
  v9 = v8;
  if (v8)
  {
    -[_SFICSPreviewViewController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 2);
    -[_SFBrowserContentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
  }

  return v9 != 0;
}

- (void)_fetchSharingURLWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _SFSharingLinkExtractor *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  -[_SFBrowserContentViewController webView](self, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_SFSharingLinkExtractor initWithWebView:]([_SFSharingLinkExtractor alloc], "initWithWebView:", v5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73___SFBrowserContentViewController__fetchSharingURLWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E4AC6378;
  v8 = v6;
  v11 = v8;
  v9 = v4;
  v12 = v9;
  -[_SFSharingLinkExtractor fetchSharingLinkWithCompletionHandler:](v7, "fetchSharingLinkWithCompletionHandler:", v10);

}

- (id)_itemProviderCollectionForSharingURL:(id)a3 title:(id)a4
{
  id v5;
  void *v6;
  _SFActivityItemProviderCollection *v7;
  _SFLinkWithPreviewActivityItemProvider *v8;
  void *v9;
  _SFLinkWithPreviewActivityItemProvider *v10;
  void *v11;
  _SFActivityExtensionItemProvider *v12;
  void *v13;
  _SFActivityExtensionItemProvider *v14;
  _SFDownloadActivityItemProvider *v15;
  void *v16;
  _SFDownloadActivityItemProvider *v17;
  _SFPrintActivityItemProvider *v18;
  _SFBrowserDocumentActivityItemProvider *v19;

  v5 = a3;
  -[_SFBrowserContentViewController webView](self, "webView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_SFActivityItemProviderCollection initWithWebView:]([_SFActivityItemProviderCollection alloc], "initWithWebView:", v6);
  -[_SFActivityItemProviderCollection setDisplayingStandaloneImage:](v7, "setDisplayingStandaloneImage:", objc_msgSend(v6, "_isDisplayingStandaloneImageDocument"));
  -[_SFActivityItemProviderCollection setDisplayingStandaloneMedia:](v7, "setDisplayingStandaloneMedia:", objc_msgSend(v6, "_isDisplayingStandaloneMediaDocument"));
  v8 = [_SFLinkWithPreviewActivityItemProvider alloc];
  objc_msgSend(v6, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_SFLinkWithPreviewActivityItemProvider initWithPlaceholderItem:URL:pageTitle:webView:](v8, "initWithPlaceholderItem:URL:pageTitle:webView:", v5, v5, v9, v6);
  -[_SFActivityItemProviderCollection setLinkProvider:](v7, "setLinkProvider:", v10);

  if (!-[_SFBrowserContentViewController isShowingErrorPage](self, "isShowingErrorPage"))
  {
    +[_SFActivityViewController activeWebPageExtensionItemForURL:withPreviewImageHandler:](_SFActivityViewController, "activeWebPageExtensionItemForURL:withPreviewImageHandler:", v5, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = [_SFActivityExtensionItemProvider alloc];
    objc_msgSend(v6, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[_SFActivityExtensionItemProvider initWithExtensionItem:URL:pageTitle:webView:](v12, "initWithExtensionItem:URL:pageTitle:webView:", v11, v5, v13, v6);

    -[_SFActivityItemProviderCollection setJavaScriptExtensionProvider:](v7, "setJavaScriptExtensionProvider:", v14);
  }
  v15 = [_SFDownloadActivityItemProvider alloc];
  -[_SFBrowserContentViewController quickLookDocument](self, "quickLookDocument");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[_SFDownloadActivityItemProvider initWithQuickLookDocument:URL:webView:](v15, "initWithQuickLookDocument:URL:webView:", v16, v5, v6);
  -[_SFActivityItemProviderCollection setDownloadProvider:](v7, "setDownloadProvider:", v17);

  v18 = -[_SFPrintActivityItemProvider initWithPrintController:webView:]([_SFPrintActivityItemProvider alloc], "initWithPrintController:webView:", self->_printController, v6);
  -[_SFActivityItemProviderCollection setPrintProvider:](v7, "setPrintProvider:", v18);

  v19 = -[_SFBrowserDocumentActivityItemProvider initWithBrowserDocument:]([_SFBrowserDocumentActivityItemProvider alloc], "initWithBrowserDocument:", self);
  -[_SFActivityItemProviderCollection setDocumentProvider:](v7, "setDocumentProvider:", v19);

  return v7;
}

- (void)_presentActivityViewController
{
  id *p_navigationBar;
  void *v4;
  void *v5;
  SFQuickLookDocumentController *quickLookDocumentController;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  p_navigationBar = (id *)&self->_navigationBar;
  if (!-[_SFNavigationBar hasToolbar](self->_navigationBar, "hasToolbar"))
    p_navigationBar = (id *)&self->_bottomToolbar;
  objc_msgSend(*p_navigationBar, "popoverSourceInfoForBarItem:", 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController quickLookDocument](self, "quickLookDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (quickLookDocumentController = self->_quickLookDocumentController, v5, quickLookDocumentController))
  {
    -[SFQuickLookDocumentController presentDocumentInteractionControllerFromSource:](self->_quickLookDocumentController, "presentDocumentInteractionControllerFromSource:", v4);
  }
  else
  {
    -[_SFBrowserContentViewController webView](self, "webView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65___SFBrowserContentViewController__presentActivityViewController__block_invoke;
    v9[3] = &unk_1E4AC63C8;
    v9[4] = self;
    v10 = v7;
    v11 = v4;
    v8 = v7;
    -[_SFBrowserContentViewController _fetchSharingURLWithCompletionHandler:](self, "_fetchSharingURLWithCompletionHandler:", v9);

  }
}

- (void)activityViewController:(id)a3 prepareActivity:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void (**v10)(_QWORD);
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;

  v25 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  if (v9)
    v10 = v9;
  else
    v10 = (void (**)(_QWORD))&__block_literal_global_332;
  -[_SFBrowserContentViewController webView](self, "webView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v8;
    objc_msgSend(v12, "bookmarkNavigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sharingURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "safari_userVisibleString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v13, "addBookmarkWithTitle:address:parentBookmark:", v14, v16, 0);

    v10[2](v10);
LABEL_15:

    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "activityViewController");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    getSLComposeViewControllerClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "title");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setInitialText:", v18);

    }
    goto LABEL_14;
  }
  objc_msgSend(v8, "activityType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CEB1D0]);

  if (v20)
  {
    objc_msgSend(v8, "activityViewController");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "_sf_isMFMailComposeViewController"))
    {
      -[_SFBrowserContentViewController _mailContentProvider](self, "_mailContentProvider");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setRestrictAddingPDFContent:", 1);
      objc_msgSend(v25, "customizationController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = _SFPreferredMailContentTypeForActivityContentType(objc_msgSend(v22, "selectedContentType"));

      objc_msgSend(v25, "sharingURL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "prepareMailComposeViewController:withMailToURL:contentURL:preferredContentType:completionHandler:", v12, 0, v24, v23, v10);

      objc_msgSend(v21, "setRestrictAddingPDFContent:", 0);
      goto LABEL_15;
    }
LABEL_14:
    v10[2](v10);
    goto LABEL_15;
  }
  v10[2](v10);
LABEL_16:

}

- (void)perSiteSettingsUIPresentSettings
{
  _SFPerSitePreferencesPopoverViewController *v3;
  void *v4;
  void *v5;
  _SFPerSitePreferencesPopoverViewController *v6;

  v3 = [_SFPerSitePreferencesPopoverViewController alloc];
  -[_SFBrowserContentViewController perSitePreferencesVendor](self, "perSitePreferencesVendor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_SFPerSitePreferencesPopoverViewController initWithBrowserDocument:perSitePreferencesVendor:](v3, "initWithBrowserDocument:perSitePreferencesVendor:", self, v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v6);
  objc_msgSend(v5, "setModalPresentationStyle:", 2);
  -[_SFBrowserContentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

}

- (BOOL)_suppressReloadToPreventLoadingJavaScriptIfNecessary
{
  void *v3;
  void *v4;
  char v5;

  -[_SFBrowserContentViewController expectedOrCurrentURL](self, "expectedOrCurrentURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safari_isJavaScriptURLString");

  if ((v5 & 1) != 0)
    -[_SFPageLoadErrorController addDisallowedUseOfJavaScriptAlert](self->_pageLoadErrorController, "addDisallowedUseOfJavaScriptAlert");
  return v5;
}

- (void)reload
{
  -[_SFBrowserContentViewController _reloadFromOrigin:](self, "_reloadFromOrigin:", 0);
}

- (void)reloadEnablingDowngradedPrivateRelay:(BOOL)a3
{
  void *v5;
  NSURL *v6;
  NSURL *urlToReloadEnablingPrivateRelay;

  if (!-[_SFBrowserContentViewController _suppressReloadToPreventLoadingJavaScriptIfNecessary](self, "_suppressReloadToPreventLoadingJavaScriptIfNecessary"))
  {
    -[_SFBrowserView currentWebView](self->_browserView, "currentWebView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
    urlToReloadEnablingPrivateRelay = self->_urlToReloadEnablingPrivateRelay;
    self->_urlToReloadEnablingPrivateRelay = v6;

    self->_disablePrivateRelayWhenReloading = a3;
    self->_isNavigatingViaReloadWithoutPrivateRelay = a3;
    -[_SFBrowserContentViewController _reloadFromOrigin:](self, "_reloadFromOrigin:", 0);
  }
}

- (BOOL)wasLoadedWithContentBlockersEnabled
{
  return self->_wasLoadedWithContentBlockersEnabled;
}

- (void)reloadDisablingContentBlockers:(BOOL)a3
{
  void *v5;
  NSURL *v6;
  NSURL *urlToReloadForcingContentBlockers;

  if (!-[_SFBrowserContentViewController _suppressReloadToPreventLoadingJavaScriptIfNecessary](self, "_suppressReloadToPreventLoadingJavaScriptIfNecessary"))
  {
    -[_SFBrowserView currentWebView](self->_browserView, "currentWebView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
    urlToReloadForcingContentBlockers = self->_urlToReloadForcingContentBlockers;
    self->_urlToReloadForcingContentBlockers = v6;

    self->_disableContentBlockersWhenReloading = a3;
    -[_SFBrowserContentViewController _reloadFromOrigin:](self, "_reloadFromOrigin:", 0);
  }
}

- (void)reloadDisablingAdvancedPrivateBrowsingPrivacyProtections:(BOOL)a3
{
  void *v5;
  NSURL *v6;
  NSURL *urlToReloadForAdvancedPrivateBrowsingPrivacyProtections;

  if (!-[_SFBrowserContentViewController _suppressReloadToPreventLoadingJavaScriptIfNecessary](self, "_suppressReloadToPreventLoadingJavaScriptIfNecessary"))
  {
    -[_SFBrowserContentViewController webView](self, "webView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
    urlToReloadForAdvancedPrivateBrowsingPrivacyProtections = self->_urlToReloadForAdvancedPrivateBrowsingPrivacyProtections;
    self->_urlToReloadForAdvancedPrivateBrowsingPrivacyProtections = v6;

    self->_disableAdvancedPrivateBrowsingPrivacyProtectionsWhenReloading = a3;
    -[_SFBrowserContentViewController _reloadFromOrigin:](self, "_reloadFromOrigin:", 0);
  }
}

- (BOOL)browserHasMultipleProfiles
{
  return 0;
}

- (_SFPerSitePreferencesVendor)perSitePreferencesVendor
{
  return self->_perSitePreferencesVendor;
}

- (_SFPageZoomPreferenceManager)pageZoomManager
{
  return -[_SFPerSitePreferencesVendor pageZoomPreferenceManager](self->_perSitePreferencesVendor, "pageZoomPreferenceManager");
}

- (BOOL)isPrivateBrowsingEnabled
{
  return 0;
}

- (BOOL)privacyReportShouldSeparateBlockedTrackers
{
  _SFBrowserContentViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[_SFBrowserContentViewController webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[_SFBrowserContentViewController supportsAdvancedPrivacyProtectionsForURL:](v2, "supportsAdvancedPrivacyProtectionsForURL:", v4);

  return (char)v2;
}

- (BOOL)canHideToolbar
{
  return 0;
}

- (NSURL)URLForPerSitePreferences
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[_SFBrowserContentViewController webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_committedURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    || (objc_msgSend(v4, "safari_isHTTPFamilyURL") & 1) == 0
    && -[_SFBrowserContentViewController isShowingErrorPage](self, "isShowingErrorPage"))
  {
    -[_SFBrowserContentViewController webView](self, "webView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return (NSURL *)v4;
}

- (SFReaderContext)readerContext
{
  void *v2;
  void *v3;

  -[_SFBrowserContentViewController webViewController](self, "webViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SFReaderContext *)v3;
}

- (BOOL)hasEnteredScribbleMode
{
  return 0;
}

- (SFScribbleController)sfScribbleController
{
  SFScribbleController *sfScribbleController;
  id v4;
  void *v5;
  SFScribbleController *v6;
  SFScribbleController *v7;

  sfScribbleController = self->_sfScribbleController;
  if (!sfScribbleController)
  {
    v4 = objc_alloc(MEMORY[0x1E0D4ED38]);
    -[_SFBrowserContentViewController webView](self, "webView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (SFScribbleController *)objc_msgSend(v4, "initWithWebView:delegate:", v5, self);
    v7 = self->_sfScribbleController;
    self->_sfScribbleController = v6;

    -[SFScribbleController setUserInitiatedScribblingDisabled:](self->_sfScribbleController, "setUserInitiatedScribblingDisabled:", 1);
    sfScribbleController = self->_sfScribbleController;
  }
  return sfScribbleController;
}

- (BOOL)isShowingReader
{
  return self->_showingReader;
}

- (void)toggleShowingReaderForUserAction
{
  id v2;

  if (self->_showingReader)
  {
    -[_SFBrowserContentViewController _hideReaderAnimated:deactivationMode:](self, "_hideReaderAnimated:deactivationMode:", 1, 1);
  }
  else
  {
    -[_SFBrowserContentViewController _showReaderAnimated:](self, "_showReaderAnimated:", 1);
    objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "didActivateReaderWithTrigger:", 0);

  }
}

- (BOOL)canReadActiveLanguage
{
  return 0;
}

- (void)presentModalViewController:(id)a3 completion:(id)a4
{
  -[_SFBrowserContentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a3, 1, a4);
}

- (BOOL)canFindOnPage
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[_SFBrowserContentViewController _onlyWantsWebAppShortcuts](self, "_onlyWantsWebAppShortcuts"))
    return 0;
  -[_SFBrowserContentViewController webViewController](self, "webViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6 != 0;

  return v3;
}

- (BOOL)allowsBrowsingAssistant
{
  return objc_msgSend(MEMORY[0x1E0D8A7F8], "userConsentState") == 1;
}

- (WBSBrowsingAssistantController)assistantController
{
  WBSBrowsingAssistantController *assistantController;
  WBSBrowsingAssistantController *v4;
  WBSBrowsingAssistantController *v5;

  assistantController = self->_assistantController;
  if (!assistantController)
  {
    v4 = (WBSBrowsingAssistantController *)objc_alloc_init(MEMORY[0x1E0D8A7F8]);
    v5 = self->_assistantController;
    self->_assistantController = v4;

    -[WBSBrowsingAssistantController setDelegate:](self->_assistantController, "setDelegate:", self);
    assistantController = self->_assistantController;
  }
  return assistantController;
}

- (void)willPresentBrowsingAssistantInSheet
{
  self->_alwaysShowTopBar = 1;
  -[_SFDynamicBarAnimator setIgnoresDragging:](self->_dynamicBarAnimator, "setIgnoresDragging:", 1);
  -[_SFDynamicBarAnimator setMinimumTopBarHeight:](self->_dynamicBarAnimator, "setMinimumTopBarHeight:", 2.22507386e-308);
  -[_SFDynamicBarAnimator attemptTransitionToState:animated:](self->_dynamicBarAnimator, "attemptTransitionToState:animated:", 0, 1);
}

- (void)willDismissBrowsingAssistantInSheet
{
  if (!-[_SFPageFormatMenuController stepperIsInTransitionView](self->_pageFormatMenuController, "stepperIsInTransitionView"))-[_SFDynamicBarAnimator attemptTransitionToState:animated:](self->_dynamicBarAnimator, "attemptTransitionToState:animated:", 1, 1);
}

- (void)showFindOnPage
{
  id v2;

  -[_SFBrowserContentViewController activeWebView](self, "activeWebView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "find:", 0);

}

- (void)handleSearchResult:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C92C80];
  objc_msgSend(a3, "_sf_punchoutURL");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestWithURL:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController loadRequest:](self, "loadRequest:", v5);

}

- (BOOL)canAddToBookmarks
{
  return 0;
}

- (BOOL)canAddToQuickNote
{
  return 0;
}

- (BOOL)canAddToReadingList
{
  return 0;
}

- (BOOL)canMoveToTabGroup
{
  return 0;
}

- (BOOL)canPrintCurrentTab
{
  return 0;
}

- (BOOL)canTogglePinningTab
{
  return 0;
}

- (BOOL)currentTabIsPinned
{
  return 0;
}

- (void)takeOwnershipOfStepperContainer:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  if (!self->_stepperContainer)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_stepperContainer, a3);
    -[_SFBrowserContentViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    objc_msgSend(v6, "convertRect:fromView:", v8);
    objc_msgSend(v8, "setFrame:");

    -[_SFBrowserContentViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    self->_stepperMovedToRootView = 1;
    v5 = v8;
  }

}

- (void)setKeepBarsMinimized:(BOOL)a3
{
  if (self->_keepBarsMinimized != a3)
  {
    self->_keepBarsMinimized = a3;
    if (a3)
    {
      -[_SFDynamicBarAnimator setMinimumTopBarHeight:](self->_dynamicBarAnimator, "setMinimumTopBarHeight:", 2.22507386e-308);
      -[_SFDynamicBarAnimator attemptTransitionToState:animated:](self->_dynamicBarAnimator, "attemptTransitionToState:animated:", 0, 1);
    }
  }
}

- (BOOL)keepBarsMinimized
{
  return self->_keepBarsMinimized;
}

- (BOOL)hasUnviewedDownloads
{
  return 0;
}

- (unint64_t)downloadsCount
{
  return 0;
}

- (BOOL)supportsPrivacyReport
{
  return 0;
}

- (BOOL)supportsSiriReadThis
{
  return 0;
}

- (BOOL)hasDedicatedMediaStateButton
{
  return 1;
}

- (BOOL)hasDedicatedDownloadsToolbarItem
{
  return 0;
}

- (SFContentBlockerManager)contentBlockerManager
{
  SFContentBlockerManager *contentBlockerManager;
  SFContentBlockerManager *v4;
  void *v5;
  void *v6;
  SFContentBlockerManager *v7;
  SFContentBlockerManager *v8;

  contentBlockerManager = self->_contentBlockerManager;
  if (!contentBlockerManager)
  {
    v4 = [SFContentBlockerManager alloc];
    -[_SFBrowserContentViewController userContentController](self, "userContentController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFBrowserContentViewController webExtensionsController](self, "webExtensionsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SFContentBlockerManager initWithUserContentController:webExtensionsController:](v4, "initWithUserContentController:webExtensionsController:", v5, v6);
    v8 = self->_contentBlockerManager;
    self->_contentBlockerManager = v7;

    contentBlockerManager = self->_contentBlockerManager;
  }
  return contentBlockerManager;
}

- (SFWebExtensionsController)webExtensionsController
{
  SFWebExtensionsController *webExtensionsController;
  id v4;
  uint64_t v5;
  void *v6;
  SFWebExtensionsController *v7;
  SFWebExtensionsController *v8;

  webExtensionsController = self->_webExtensionsController;
  if (!webExtensionsController)
  {
    v4 = objc_alloc(MEMORY[0x1E0D4EF08]);
    v5 = *MEMORY[0x1E0D8AFB8];
    objc_msgSend(MEMORY[0x1E0CEF608], "safari_userContentController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (SFWebExtensionsController *)objc_msgSend(v4, "initWithProfileServerID:userContentController:", v5, v6);
    v8 = self->_webExtensionsController;
    self->_webExtensionsController = v7;

    -[SFWebExtensionsController setProfileDelegate:](self->_webExtensionsController, "setProfileDelegate:", self);
    webExtensionsController = self->_webExtensionsController;
  }
  return webExtensionsController;
}

- (WBSWebExtensionTab)activeTabForExtensions
{
  return 0;
}

- (BOOL)hasDedicatedExtensionsButton
{
  return 0;
}

- (void)collectDiagnosticsForAutoFillWithCompletionHandler:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_SFBrowserContentViewController webViewController](self, "webViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectDiagnosticsForAutoFillWithCompletionHandler:", v5);

}

- (id)sfWebExtensionsControllersForAllProfiles:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[_SFBrowserContentViewController webExtensionsController](self, "webExtensionsController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sfWebExtensionsControllersContentBlockerManagersForAllProfiles:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[_SFBrowserContentViewController contentBlockerManager](self, "contentBlockerManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_updateUserActivitySoon
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1A3B2D000, v0, v1, "Will update NSUserActivity soon", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_updateUserActivityTimerFired
{
  -[_SFBrowserContentViewController _cancelPendingUpdateUserActivityTimer](self, "_cancelPendingUpdateUserActivityTimer");
  -[_SFBrowserContentViewController _updateUserActivity](self, "_updateUserActivity");
}

- (void)_cancelPendingUpdateUserActivityTimer
{
  NSTimer *updateContinuityTimer;
  NSTimer *v4;

  updateContinuityTimer = self->_updateContinuityTimer;
  if (updateContinuityTimer)
  {
    -[NSTimer invalidate](updateContinuityTimer, "invalidate");
    v4 = self->_updateContinuityTimer;
    self->_updateContinuityTimer = 0;

  }
}

- (id)handoffURL
{
  void *v2;
  void *v3;

  -[_SFBrowserContentViewController webView](self, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateUserActivity
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "Invalid URL for NSUserActivity; it won't be updated",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

- (void)_invalidateUserActivity
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1A3B2D000, v0, v1, "Invalidating NSUserActivity", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_setUpMenu
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D4EBE8], "sharedProvider");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rebuildMenuIfNeededForPersona:", -[_SFBrowserContentViewController _persona](self, "_persona"));

}

- (void)validateCommand:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_SFBrowserContentViewController;
  -[_SFBrowserContentViewController validateCommand:](&v6, sel_validateCommand_, v4);
  if ((char *)objc_msgSend(v4, "action") == sel_saveKeyPressed)
  {
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDiscoverabilityTitle:", v5);

  }
}

- (void)reloadKeyPressed
{
  -[_SFBrowserContentViewController _dismissTransientUIAnimated:](self, "_dismissTransientUIAnimated:", 1);
  if (!-[_SFBrowserContentViewController _suppressReloadToPreventLoadingJavaScriptIfNecessary](self, "_suppressReloadToPreventLoadingJavaScriptIfNecessary"))
  {
    -[_SFBrowserContentViewController _reloadFromOrigin:](self, "_reloadFromOrigin:", 0);
    self->_isNavigatingViaNormalReload = 1;
  }
}

- (void)reloadFromOriginKeyPressed
{
  -[_SFBrowserContentViewController _dismissTransientUIAnimated:](self, "_dismissTransientUIAnimated:", 1);
  if (!-[_SFBrowserContentViewController _suppressReloadToPreventLoadingJavaScriptIfNecessary](self, "_suppressReloadToPreventLoadingJavaScriptIfNecessary"))-[_SFBrowserContentViewController _reloadFromOrigin:](self, "_reloadFromOrigin:", 1);
}

- (void)find:(id)a3
{
  id v3;
  id v4;

  -[_SFBrowserContentViewController activeWebView](self, "activeWebView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "find:", 0);

  objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didFindOnPageWithTrigger:", 0);

}

- (void)takeFindStringKeyPressed
{
  id v2;

  self->_shouldFillStringForFind = 1;
  -[_SFBrowserContentViewController _currentWebView](self, "_currentWebView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_takeFindStringFromSelection:", 0);

}

- (void)cancelKeyPressed
{
  id v3;

  if (self->_showingReader)
  {
    -[_SFBrowserContentViewController _hideReaderAnimated:deactivationMode:](self, "_hideReaderAnimated:deactivationMode:", 1, 1);
  }
  else if (!-[_SFBrowserContentViewController _dismissTransientUIAnimated:](self, "_dismissTransientUIAnimated:", 1))
  {
    -[_SFBrowserContentViewController webView](self, "webView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopLoading");

  }
}

- (BOOL)_dismissTransientUIAnimated:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v3 = a3;
  v5 = -[_SFBrowserContentViewController _hideFindOnPage](self, "_hideFindOnPage");
  -[_SFBrowserContentViewController webViewController](self, "webViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dialogController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "presentedDialog");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "presentationStyle") == 1)
  {
    objc_msgSend(v7, "cancelPresentedDialogIfNeeded");
    v5 = 1;
  }
  -[_SFBrowserContentViewController presentedViewController](self, "presentedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && (objc_msgSend(v10, "isBeingDismissed") & 1) == 0)
  {
    objc_msgSend(v11, "dismissViewControllerAnimated:completion:", v3, 0);
    goto LABEL_9;
  }
  if (v5)
  {
LABEL_9:
    v12 = 1;
    goto LABEL_10;
  }
  v12 = -[_SFPrintController isDisplayingPrintUI](self->_printController, "isDisplayingPrintUI");
LABEL_10:
  -[_SFPrintController dismissPrintInteractionControllerAnimated:](self->_printController, "dismissPrintInteractionControllerAnimated:", 1);

  return v12;
}

- (void)autoFillFormKeyPressed
{
  id v2;

  -[_SFBrowserContentViewController webViewController](self, "webViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performPageLevelAutoFill");

}

- (void)emailCurrentPage
{
  -[_SFBrowserContentViewController _emailCurrentPageWithPreferredContentType:](self, "_emailCurrentPageWithPreferredContentType:", 0);
}

- (void)_emailCurrentPageWithPreferredContentType:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __77___SFBrowserContentViewController__emailCurrentPageWithPreferredContentType___block_invoke;
  v3[3] = &unk_1E4AC6438;
  v3[4] = self;
  v3[5] = a3;
  -[_SFBrowserContentViewController _fetchSharingURLWithCompletionHandler:](self, "_fetchSharingURLWithCompletionHandler:", v3);
}

- (id)_mailContentProvider
{
  _SFMailContentProvider *cachedMailContentProvider;
  _SFMailContentProvider *v4;
  _SFMailContentProvider *v5;

  cachedMailContentProvider = self->_cachedMailContentProvider;
  if (!cachedMailContentProvider)
  {
    v4 = objc_alloc_init(_SFMailContentProvider);
    v5 = self->_cachedMailContentProvider;
    self->_cachedMailContentProvider = v4;

    -[_SFMailContentProvider setDataSource:](self->_cachedMailContentProvider, "setDataSource:", self);
    cachedMailContentProvider = self->_cachedMailContentProvider;
  }
  return cachedMailContentProvider;
}

- (id)readerControllerForMailContentProvider:(id)a3
{
  void *v3;
  void *v4;

  -[_SFBrowserContentViewController webViewController](self, "webViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "readerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)readerViewIsVisibleForMailContentProvider:(id)a3
{
  return self->_showingReader;
}

- (id)webViewForMailContentProvider:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[_SFBrowserContentViewController webViewController](self, "webViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_showingReader)
  {
    objc_msgSend(v4, "readerController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "readerWebView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "webView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)printControllerForContentProvider:(id)a3
{
  return self->_printController;
}

- (id)_committedDomainForPreferences
{
  void *v2;
  void *v3;
  void *v4;

  -[_SFBrowserContentViewController webView](self, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_committedURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_userVisibleHostWithoutWWWSubdomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_shouldAllowAutomaticReader
{
  unint64_t v2;

  v2 = -[_SFBrowserContentViewController _persona](self, "_persona");
  return (v2 > 4) | (3u >> v2) & 1;
}

- (void)_perSiteAutomaticReaderActivationPreferenceDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __88___SFBrowserContentViewController__perSiteAutomaticReaderActivationPreferenceDidChange___block_invoke;
  v6[3] = &unk_1E4AC0590;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)_perSitePageZoomPreferenceDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _SFBrowserContentViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71___SFBrowserContentViewController__perSitePageZoomPreferenceDidChange___block_invoke;
  v6[3] = &unk_1E4AC0590;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)_perSiteLockdownModePreferenceDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _SFBrowserContentViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75___SFBrowserContentViewController__perSiteLockdownModePreferenceDidChange___block_invoke;
  v6[3] = &unk_1E4AC0590;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (id)_digitalHealthManager
{
  WBSDigitalHealthManager *cachedDigitalHealthManager;
  WBSDigitalHealthManager *v4;
  WBSDigitalHealthManager *v5;

  cachedDigitalHealthManager = self->_cachedDigitalHealthManager;
  if (!cachedDigitalHealthManager)
  {
    v4 = (WBSDigitalHealthManager *)objc_alloc_init(MEMORY[0x1E0D8A8C0]);
    v5 = self->_cachedDigitalHealthManager;
    self->_cachedDigitalHealthManager = v4;

    -[WBSDigitalHealthManager setDelegate:](self->_cachedDigitalHealthManager, "setDelegate:", self);
    -[WBSDigitalHealthManager startObserving](self->_cachedDigitalHealthManager, "startObserving");
    cachedDigitalHealthManager = self->_cachedDigitalHealthManager;
  }
  return cachedDigitalHealthManager;
}

- (void)_updateDigitalHealthTracking
{
  _QWORD v3[4];
  id v4;
  id location;

  if (-[_SFBrowserContentViewController _personaShouldUseScreenTime](self, "_personaShouldUseScreenTime"))
  {
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __63___SFBrowserContentViewController__updateDigitalHealthTracking__block_invoke;
    v3[3] = &unk_1E4AC11B8;
    objc_copyWeak(&v4, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

- (void)_showDigitalHealthOverlayWithPolicy:(int64_t)a3
{
  void *v5;
  void *v6;
  SFScreenTimeOverlayViewController *v7;
  SFScreenTimeOverlayViewController *screenTimeOverlayViewController;
  id v9;
  void *v10;
  void *v11;
  id v12;

  if (-[_SFBrowserContentViewController _personaShouldUseScreenTime](self, "_personaShouldUseScreenTime"))
  {
    if (self->_showingReader)
      -[_SFBrowserContentViewController _hideReaderAnimated:deactivationMode:](self, "_hideReaderAnimated:deactivationMode:", 0, 1);
    if (!-[_SFBrowserContentViewController isBlockedByScreenTime](self, "isBlockedByScreenTime"))
    {
      -[_SFBrowserContentViewController webViewController](self, "webViewController");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "webView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "URL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = (SFScreenTimeOverlayViewController *)objc_alloc_init(MEMORY[0x1E0D4ED30]);
        screenTimeOverlayViewController = self->_screenTimeOverlayViewController;
        self->_screenTimeOverlayViewController = v7;

        v9 = (id)-[SFScreenTimeOverlayViewController showBlockingViewControllerForURL:withPolicy:animated:](self->_screenTimeOverlayViewController, "showBlockingViewControllerForURL:withPolicy:animated:", v6, a3, 1);
        objc_msgSend(v12, "addChildViewController:", self->_screenTimeOverlayViewController);
        -[SFScreenTimeOverlayViewController didMoveToParentViewController:](self->_screenTimeOverlayViewController, "didMoveToParentViewController:", v12);
        -[SFScreenTimeOverlayViewController view](self->_screenTimeOverlayViewController, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bounds");
        objc_msgSend(v10, "setFrame:");
        objc_msgSend(v11, "addSubview:", v10);

      }
    }
  }
}

- (void)_hideDigitalHealthOverlay
{
  void *v3;
  SFScreenTimeOverlayViewController *screenTimeOverlayViewController;

  if (-[_SFBrowserContentViewController _personaShouldUseScreenTime](self, "_personaShouldUseScreenTime"))
  {
    if (-[_SFBrowserContentViewController isBlockedByScreenTime](self, "isBlockedByScreenTime"))
    {
      -[SFScreenTimeOverlayViewController willMoveToParentViewController:](self->_screenTimeOverlayViewController, "willMoveToParentViewController:", 0);
      -[SFScreenTimeOverlayViewController removeFromParentViewController](self->_screenTimeOverlayViewController, "removeFromParentViewController");
      -[SFScreenTimeOverlayViewController view](self->_screenTimeOverlayViewController, "view");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeFromSuperview");

      screenTimeOverlayViewController = self->_screenTimeOverlayViewController;
      self->_screenTimeOverlayViewController = 0;

    }
  }
}

- (BOOL)isBlockedByScreenTime
{
  return self->_screenTimeOverlayViewController != 0;
}

- (void)beginDigitalHealthTracking
{
  NSURL *currentUsageTrackingURL;
  void *v4;
  id v5;

  if (-[_SFBrowserContentViewController _personaShouldUseScreenTime](self, "_personaShouldUseScreenTime"))
  {
    -[_SFBrowserContentViewController _digitalHealthManager](self, "_digitalHealthManager");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    currentUsageTrackingURL = self->_currentUsageTrackingURL;
    -[_SFBrowserContentViewController _hostAppBundleId](self, "_hostAppBundleId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateUsageTrackingForURL:withBundleIdentifier:profileIdentifier:toState:", currentUsageTrackingURL, v4, *MEMORY[0x1E0D8AFB8], 2);

    objc_msgSend(v5, "startObserving");
  }
}

- (void)stopDigitalHealthTrackingWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  NSURL *currentUsageTrackingURL;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82___SFBrowserContentViewController_stopDigitalHealthTrackingWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E4AC3660;
  v6 = v4;
  v16 = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x1A8598C40](v15);
  if (-[_SFBrowserContentViewController _personaShouldUseScreenTime](self, "_personaShouldUseScreenTime"))
  {
    -[_SFBrowserContentViewController _digitalHealthManager](self, "_digitalHealthManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    currentUsageTrackingURL = self->_currentUsageTrackingURL;
    v10 = *MEMORY[0x1E0D8AFB8];
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __82___SFBrowserContentViewController_stopDigitalHealthTrackingWithCompletionHandler___block_invoke_2;
    v12[3] = &unk_1E4AC5DB0;
    v13 = v8;
    v14 = v6;
    v11 = v8;
    objc_msgSend(v11, "stopUsageTrackingForURL:profileIdentifier:withCompletionHandler:", currentUsageTrackingURL, v10, v12);

  }
  else
  {
    v7[2](v7);
  }

}

- (BOOL)_personaShouldUseScreenTime
{
  return ((-[_SFBrowserContentViewController _persona](self, "_persona") - 2) & 0xFFFFFFFFFFFFFFFDLL) != 0;
}

- (BOOL)isPlayingAudio
{
  void *v2;
  char v3;

  -[_SFBrowserContentViewController webView](self, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isPlayingAudio");

  return v3;
}

- (BOOL)isShowingSystemStartPage
{
  return 0;
}

- (void)barManager:(id)a3 didReceiveTapForBarItem:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  switch(a4)
  {
    case 0:
      -[_SFBrowserContentViewController _goBack](self, "_goBack");
      objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "reportSVCToolbarButtonUsage:", 0);
      goto LABEL_7;
    case 1:
      -[_SFBrowserContentViewController _goForward](self, "_goForward");
      objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "reportSVCToolbarButtonUsage:", 1);
      goto LABEL_7;
    case 6:
      -[_SFBrowserContentViewController _presentActivityViewController](self, "_presentActivityViewController");
      objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "reportSVCToolbarButtonUsage:", 3);
      goto LABEL_7;
    case 9:
      -[_SFBrowserContentViewController _openCurrentURLInSafari](self, "_openCurrentURLInSafari");
      objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "reportSVCToolbarButtonUsage:", 36);
      goto LABEL_7;
    case 10:
      -[_SFBrowserContentViewController _invokeCustomActivity](self, "_invokeCustomActivity");
      objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "reportSVCToolbarButtonUsage:", 37);
LABEL_7:

      break;
    default:
      break;
  }

}

- (unint64_t)mediaStateIcon
{
  return self->_cachedMediaStateIcon;
}

- (void)setMediaStateIcon:(unint64_t)a3
{
  if (self->_cachedMediaStateIcon != a3)
  {
    self->_cachedMediaStateIcon = a3;
    -[SFNavigationBarItem setMediaStateIcon:](self->_navigationBarItem, "setMediaStateIcon:");
  }
}

- (void)webViewController:(id)a3 mediaCaptureStateDidChange:(unint64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v6 = 1;
  v7 = 4;
  if ((a4 & 8) == 0)
    v7 = ((uint64_t)(a4 << 61) >> 63) & 3;
  if ((a4 & 1) == 0)
    v6 = v7;
  if ((a4 & 2) != 0)
    v8 = 2;
  else
    v8 = v6;
  -[_SFBrowserContentViewController setMediaStateIcon:](self, "setMediaStateIcon:", v8);

}

- (BOOL)_canSaveWebpage
{
  _SFBrowserContentViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[_SFBrowserContentViewController webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[_SFBrowserContentViewController _canSaveWebpageForURL:](v2, "_canSaveWebpageForURL:", v4);

  return (char)v2;
}

- (BOOL)_canSaveWebpageForURL:(id)a3
{
  id v4;
  _BOOL4 v5;

  v4 = a3;
  if (v4 && !self->_saveToFilesOperation)
    v5 = !-[_SFBrowserContentViewController isBlockedByScreenTime](self, "isBlockedByScreenTime");
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (void)_presentSaveWebpageViewController
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  if (-[_SFBrowserContentViewController _canSaveWebpage](self, "_canSaveWebpage"))
  {
    -[_SFBrowserContentViewController webView](self, "webView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __68___SFBrowserContentViewController__presentSaveWebpageViewController__block_invoke;
    v5[3] = &unk_1E4AC6488;
    v5[4] = self;
    v6 = v3;
    v4 = v3;
    -[_SFBrowserContentViewController _fetchSharingURLWithCompletionHandler:](self, "_fetchSharingURLWithCompletionHandler:", v5);

  }
}

- (void)saveToFilesOperation:(id)a3 presentViewController:(id)a4
{
  -[_SFBrowserContentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
}

- (void)saveToFilesOperation:(id)a3 didFinishWithSuccess:(BOOL)a4
{
  _SFSaveToFilesOperation *saveToFilesOperation;

  saveToFilesOperation = self->_saveToFilesOperation;
  self->_saveToFilesOperation = 0;

}

- (void)customizationControllerCustomizationsDidChange:(id)a3
{
  -[_SFActivityViewController customizationControllerCustomizationsDidChange:](self->_activityViewController, "customizationControllerCustomizationsDidChange:", a3);
}

- (id)webViewForCustomizationController:(id)a3
{
  -[_SFBrowserContentViewController webView](self, "webView", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isDisplayingQuickLookDocumentForCustomizationController:(id)a3
{
  void *v3;
  BOOL v4;

  -[_SFBrowserContentViewController quickLookDocument](self, "quickLookDocument", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isReaderAvailableForCustomizationController:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[_SFBrowserContentViewController webViewController](self, "webViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "readerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isReaderAvailable");

  return v5;
}

- (BOOL)isShowingReaderForCustomizationController:(id)a3
{
  return self->_showingReader;
}

- (void)translationContextReloadPageInOriginalLanguage:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82___SFBrowserContentViewController_translationContextReloadPageInOriginalLanguage___block_invoke;
  block[3] = &unk_1E4AC1080;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (BOOL)translationContextIsUsingPrivateBrowsing:(id)a3
{
  return 0;
}

- (void)translationContext:(id)a3 urlForCurrentPageWithCompletionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __93___SFBrowserContentViewController_translationContext_urlForCurrentPageWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4AC0FB8;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

- (void)translationContext:(id)a3 showFirstTimeConsentAlertWithCompletionHandler:(id)a4
{
  -[_SFBrowserContentViewController _presentTranslationConsentAlertWithType:completionHandler:](self, "_presentTranslationConsentAlertWithType:completionHandler:", 0, a4);
}

- (void)translationContext:(id)a3 showFeedbackConsentAlertWithCompletionHandler:(id)a4
{
  -[_SFBrowserContentViewController _presentTranslationConsentAlertWithType:completionHandler:](self, "_presentTranslationConsentAlertWithType:completionHandler:", 1, a4);
}

- (id)safariApplicationVersionForTranslationContext:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "_sf_safariServicesBundle", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_normalizedVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)translationContext:(id)a3 showTranslationErrorAlertWithTitle:(id)a4 message:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _SFBrowserContentViewController *v10;

  v6 = a5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __97___SFBrowserContentViewController_translationContext_showTranslationErrorAlertWithTitle_message___block_invoke;
  v8[3] = &unk_1E4AC0590;
  v9 = v6;
  v10 = self;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

- (void)translationContext:(id)a3 shouldReportProgressInUnifiedField:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __89___SFBrowserContentViewController_translationContext_shouldReportProgressInUnifiedField___block_invoke;
  v4[3] = &unk_1E4AC64B0;
  v4[4] = self;
  v5 = a4;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
}

- (void)translationContextNeedsScrollHeightVisibilityUpdate:(id)a3
{
  -[_SFBrowserContentViewController _updateMaxVisibleHeightPercentageUserDriven:](self, "_updateMaxVisibleHeightPercentageUserDriven:", 0);
}

- (void)translationContextWillRequestTranslatingWebpage:(id)a3
{
  WKProcessPool *v3;
  SafariShared::ReaderAvailabilityController *v4;

  -[_SFBrowserContentViewController processPool](self, "processPool", a3);
  v4 = (SafariShared::ReaderAvailabilityController *)objc_claimAutoreleasedReturnValue();
  SafariShared::ReaderAvailabilityController::updateReaderOrTranslationLastActivated(v4, v3);

}

- (void)_updateMaxVisibleHeightPercentageUserDriven:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v3 = a3;
  -[_SFBrowserContentViewController webView](self, "webView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentSize");
  v7 = v6;
  if (-[_SFToolbar placement](self->_bottomToolbar, "placement") == 1)
  {
    -[_SFToolbar superview](self->_bottomToolbar, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFToolbar origin](self->_bottomToolbar, "origin");
    objc_msgSend(v8, "convertPoint:toView:", v5);
    v10 = v9;

  }
  else
  {
    objc_msgSend(v5, "contentOffset");
    v12 = v11;
    objc_msgSend(v14, "frame");
    v10 = v12 + v13;
  }
  -[WBSTranslationContext updateMaxVisibleHeightPercentageIfNeeded:userDriven:](self->_translationContext, "updateMaxVisibleHeightPercentageIfNeeded:userDriven:", v3, v10 / v7);

}

- (void)_translationContextStateDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69___SFBrowserContentViewController__translationContextStateDidChange___block_invoke;
  block[3] = &unk_1E4AC1080;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_presentTranslationConsentAlertWithType:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  unint64_t v10;

  v6 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93___SFBrowserContentViewController__presentTranslationConsentAlertWithType_completionHandler___block_invoke;
  block[3] = &unk_1E4AC6500;
  v9 = v6;
  v10 = a3;
  block[4] = self;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)addPassesViewControllerDidFinish:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_SFBrowserContentViewController _currentWebView](self, "_currentWebView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_committedURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
  else
    -[_SFBrowserContentViewController _dismiss](self, "_dismiss");

}

- (id)legacyTLSHostManager
{
  WBSAllowedLegacyTLSHostManager *cachedLegacyTLSHostManager;
  id v4;
  void *v5;
  WBSAllowedLegacyTLSHostManager *v6;
  WBSAllowedLegacyTLSHostManager *v7;

  cachedLegacyTLSHostManager = self->_cachedLegacyTLSHostManager;
  if (!cachedLegacyTLSHostManager)
  {
    v4 = objc_alloc(MEMORY[0x1E0D8A750]);
    objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (WBSAllowedLegacyTLSHostManager *)objc_msgSend(v4, "initWithBrowserDefaults:", v5);
    v7 = self->_cachedLegacyTLSHostManager;
    self->_cachedLegacyTLSHostManager = v6;

    cachedLegacyTLSHostManager = self->_cachedLegacyTLSHostManager;
  }
  return cachedLegacyTLSHostManager;
}

- (void)pageLoadErrorController:(id)a3 allowLegacyTLSConnectionForURL:(id)a4 navigateToURL:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  -[_SFBrowserContentViewController legacyTLSHostManager](self, "legacyTLSHostManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allowLegacyTLSForHost:", v9);

  objc_msgSend(MEMORY[0x1E0C92C80], "safari_nonAppInitiatedRequestWithURL:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController loadRequest:](self, "loadRequest:", v10);

}

- (BOOL)isPrivate
{
  return -[_SFBrowserContentViewController safariDataSharingMode](self, "safariDataSharingMode") == 4;
}

- (void)overlayDidHide:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double MaxY;
  _SFNavigationBar *navigationBar;
  double v10;
  id v11;
  CGRect v12;
  CGRect v13;

  v11 = a3;
  -[_SFBrowserView pinnableBanner](self->_browserView, "pinnableBanner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController _setShowingPinnableBanner:animated:](self, "_setShowingPinnableBanner:animated:", v4, 1);

  if ((objc_msgSend(v11, "isAvailable") & 1) == 0)
  {
    -[_SFBrowserView currentWebView](self->_browserView, "currentWebView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[_SFBrowserView pinnableBanner](self->_browserView, "pinnableBanner");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    MaxY = CGRectGetMaxY(v12);

    navigationBar = self->_navigationBar;
    -[_SFNavigationBar bounds](navigationBar, "bounds");
    -[_SFNavigationBar convertPoint:toView:](navigationBar, "convertPoint:toView:", v6, 0.0, CGRectGetMaxY(v13));
    if (MaxY > v10)
    {
      objc_msgSend(v6, "contentOffset");
      objc_msgSend(v6, "setContentOffset:");
    }

  }
}

- (BOOL)supportsAdvancedPrivacyProtectionsForURL:(id)a3
{
  id v4;
  void *v5;
  char v6;
  unint64_t v7;
  unsigned int v8;

  v4 = a3;
  if ((objc_msgSend(v4, "safari_isSafariWebExtensionURL") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "safari_enableAdvancedPrivacyProtections:", 0),
        v5,
        (v6 & 1) == 0))
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    v7 = -[_SFBrowserContentViewController _persona](self, "_persona");
    if (v7 <= 3)
      v8 = (3u >> (v7 & 0xF)) & 1;
    else
      LOBYTE(v8) = 0;
  }

  return v8;
}

- (void)browsingAssistantControllerDidReset:(id)a3
{
  -[SFNavigationBarItem resetContentOptions](self->_navigationBarItem, "resetContentOptions", a3);
}

- (void)browsingAssistantController:(id)a3 didUpdateContentOptionsForURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD v19[4];
  id v20;
  _SFBrowserContentViewController *v21;
  id v22;

  v6 = a3;
  v7 = a4;
  -[_SFBrowserContentViewController webView](self, "webView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_committedURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((WBSIsEqual() & 1) != 0)
  {
    objc_msgSend(v6, "result");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "contentOptions");

    objc_msgSend(v6, "result");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "tableOfContentsAvailable");

    -[_SFBrowserContentViewController webViewController](self, "webViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "readerController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_showingReader
      && ((v11 | v13) & 1) != 0
      && -[_SFBrowserContentViewController allowsBrowsingAssistant](self, "allowsBrowsingAssistant"))
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __93___SFBrowserContentViewController_browsingAssistantController_didUpdateContentOptionsForURL___block_invoke;
      v19[3] = &unk_1E4AC6528;
      v20 = v15;
      v21 = self;
      v22 = v9;
      objc_msgSend(v6, "fetchAssistantContentFromPegasusForURL:withCompletionHandler:", v22, v19);

    }
    -[SFNavigationBarItem updateContentOptions:](self->_navigationBarItem, "updateContentOptions:", v11);
    v16 = WBSBrowsingAssistantContentOptionsMostProminentRemoteOption();
    v17 = 64 - __clz(v16);
    if (v16)
      v18 = v17;
    else
      v18 = 0;
    -[SFNavigationBarItem setBrowsingAssistantDetectionResult:](self->_navigationBarItem, "setBrowsingAssistantDetectionResult:", v18);

  }
}

- (void)browsingAssistantControllerDidUpdateUserConsentState:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[_SFBrowserContentViewController allowsBrowsingAssistant](self, "allowsBrowsingAssistant"))
  {
    -[_SFBrowserContentViewController expectedOrCurrentURL](self, "expectedOrCurrentURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSTranslationContext webpageLocale](self->_translationContext, "webpageLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "checkForAssistantContentFromPegasusForURL:locale:", v4, v5);

  }
}

- (id)currentHostForScribbleController:(id)a3
{
  void *v3;
  void *v4;

  -[_SFBrowserContentViewController expectedOrCurrentURL](self, "expectedOrCurrentURL", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)sfScribbleControllerDidEndScribbling:(id)a3
{
  -[SFNavigationBarItem setOverlayConfiguration:](self->_navigationBarItem, "setOverlayConfiguration:", 0);
  -[_SFBrowserContentViewController _updateUI](self, "_updateUI");
}

- (void)sfScribbleControllerDidStartScribbling:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_SFPageFormatMenuController dismissMenu](self->_pageFormatMenuController, "dismissMenu");
  objc_msgSend(v5, "urlFieldOverlayConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFNavigationBarItem setOverlayConfiguration:](self->_navigationBarItem, "setOverlayConfiguration:", v4);

  -[_SFBrowserContentViewController _updateUI](self, "_updateUI");
}

- (void)sfScribbleControllerDidUpdateHiddenElementCount:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SFNavigationBarItem setHasHiddenElements:](self->_navigationBarItem, "setHasHiddenElements:", objc_msgSend(v5, "hiddenElementCount") != 0);
  if (objc_msgSend(v5, "isScribbling"))
  {
    objc_msgSend(v5, "urlFieldOverlayConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFNavigationBarItem setOverlayConfiguration:](self->_navigationBarItem, "setOverlayConfiguration:", v4);

  }
  -[_SFPageFormatMenuController reloadBrowsingAssistantIfNeeded](self->_pageFormatMenuController, "reloadBrowsingAssistantIfNeeded");

}

- (void)sfScribbleController:(id)a3 presentAlert:(id)a4
{
  -[_SFBrowserContentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
}

- (id)overlayContainerViewForScribbleController:(id)a3
{
  -[_SFBrowserView contentContainerView](self->_browserView, "contentContainerView", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isPrivateBrowsing
{
  return 0;
}

- (NSArray)normalBrowsingUserContentControllers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEF608], "safari_userContentController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (WBSUserDefinedContentBlockerManager)normalBrowsingUserDefinedContentBlockerManager
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)-[_SFBrowserContentViewController normalBrowsingUserDefinedContentBlockerManager]::manager;
  if (!-[_SFBrowserContentViewController normalBrowsingUserDefinedContentBlockerManager]::manager)
  {
    v3 = objc_alloc(MEMORY[0x1E0D8AD90]);
    objc_msgSend(MEMORY[0x1E0D8AD98], "sharedStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithDataStore:", v4);
    v6 = (void *)-[_SFBrowserContentViewController normalBrowsingUserDefinedContentBlockerManager]::manager;
    -[_SFBrowserContentViewController normalBrowsingUserDefinedContentBlockerManager]::manager = v5;

    v2 = (void *)-[_SFBrowserContentViewController normalBrowsingUserDefinedContentBlockerManager]::manager;
  }
  return (WBSUserDefinedContentBlockerManager *)v2;
}

- (WBSPrivateBrowsingUserDefinedContentBlockerManager)privateBrowsingUserDefinedContentBlockerManager
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)-[_SFBrowserContentViewController privateBrowsingUserDefinedContentBlockerManager]::manager;
  if (!-[_SFBrowserContentViewController privateBrowsingUserDefinedContentBlockerManager]::manager)
  {
    v4 = objc_alloc(MEMORY[0x1E0D8AB20]);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8AD98]), "initWithDatabaseURL:", 0);
    v6 = objc_msgSend(v4, "initWithDataStore:", v5);
    v7 = (void *)-[_SFBrowserContentViewController privateBrowsingUserDefinedContentBlockerManager]::manager;
    -[_SFBrowserContentViewController privateBrowsingUserDefinedContentBlockerManager]::manager = v6;

    -[_SFBrowserContentViewController normalBrowsingUserDefinedContentBlockerManager](self, "normalBrowsingUserDefinedContentBlockerManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)-[_SFBrowserContentViewController privateBrowsingUserDefinedContentBlockerManager]::manager, "setNormalBrowsingUserDefinedContentBlockerManager:", v8);

    v3 = (void *)-[_SFBrowserContentViewController privateBrowsingUserDefinedContentBlockerManager]::manager;
  }
  return (WBSPrivateBrowsingUserDefinedContentBlockerManager *)v3;
}

- (WBSScribbleQuirksManager)scribbleQuirksManager
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)-[_SFBrowserContentViewController scribbleQuirksManager]::manager;
  if (!-[_SFBrowserContentViewController scribbleQuirksManager]::manager)
  {
    v3 = objc_opt_new();
    v4 = (void *)-[_SFBrowserContentViewController scribbleQuirksManager]::manager;
    -[_SFBrowserContentViewController scribbleQuirksManager]::manager = v3;

    v2 = (void *)-[_SFBrowserContentViewController scribbleQuirksManager]::manager;
  }
  return (WBSScribbleQuirksManager *)v2;
}

- (BOOL)wasLoadedWithPrivateRelay
{
  return self->_wasLoadedWithPrivateRelay;
}

- (BOOL)isNavigatingViaReloadWithoutPrivateRelay
{
  return self->_isNavigatingViaReloadWithoutPrivateRelay;
}

- (void)setIsNavigatingViaReloadWithoutPrivateRelay:(BOOL)a3
{
  self->_isNavigatingViaReloadWithoutPrivateRelay = a3;
}

- (BOOL)wasLoadedWithAdvancedPrivateBrowsingPrivacyProtections
{
  return self->_wasLoadedWithAdvancedPrivateBrowsingPrivacyProtections;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1816);
}

- (int64_t)siriReaderPlaybackStateForActiveTab
{
  return self->siriReaderPlaybackStateForActiveTab;
}

- (BOOL)shouldShowListeningControls
{
  return self->shouldShowListeningControls;
}

- (void)setShouldShowListeningControls:(BOOL)a3
{
  self->shouldShowListeningControls = a3;
}

- (_SFBrowserContentViewControllerDelegate)delegate
{
  return (_SFBrowserContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)displayMode
{
  return self->_displayMode;
}

- (void)setReloadOptionsController:(id)a3
{
  objc_storeStrong((id *)&self->_reloadOptionsController, a3);
}

- (BOOL)storeBannersAreDisabled
{
  return self->_storeBannersAreDisabled;
}

- (void)setStoreBannersAreDisabled:(BOOL)a3
{
  self->_storeBannersAreDisabled = a3;
}

- (WKPreferences)wkPreferences
{
  return self->_wkPreferences;
}

- (NSArray)linkActions
{
  return self->_linkActions;
}

- (void)setLinkActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1864);
}

- (_WKActivatedElementInfo)activatedElementInfo
{
  return self->_activatedElementInfo;
}

- (void)setActivatedElementInfo:(id)a3
{
  objc_storeStrong((id *)&self->_activatedElementInfo, a3);
}

- (BOOL)remoteSwipeGestureEnabled
{
  return self->_remoteSwipeGestureEnabled;
}

- (UIColor)preferredBarTintColor
{
  return self->_preferredBarTintColor;
}

- (UIColor)preferredControlTintColor
{
  return self->_preferredControlTintColor;
}

- (int64_t)hostAppModalPresentationStyle
{
  return self->_hostAppModalPresentationStyle;
}

- (int64_t)dismissButtonStyle
{
  return self->_dismissButtonStyle;
}

- (SFSafariViewControllerConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)webViewLayoutUnderlapsStatusBar
{
  return self->_webViewLayoutUnderlapsStatusBar;
}

- (void)setWebViewLayoutUnderlapsStatusBar:(BOOL)a3
{
  self->_webViewLayoutUnderlapsStatusBar = a3;
}

- (NSString)bundleIdentifierForProfileInstallation
{
  return self->_bundleIdentifierForProfileInstallation;
}

- (BOOL)_isUsedForAuthentication
{
  return self->__isUsedForAuthentication;
}

- (int64_t)_persona
{
  return self->__persona;
}

- (int64_t)safariDataSharingMode
{
  return self->_safariDataSharingMode;
}

- (BOOL)didNotifyInitialLoadFinish
{
  return self->_didNotifyInitialLoadFinish;
}

- (BOOL)viewDidAppearInHostApp
{
  return self->_viewDidAppearInHostApp;
}

- (void)setViewDidAppearInHostApp:(BOOL)a3
{
  self->_viewDidAppearInHostApp = a3;
}

- (_SFNavigationUtilitiesManager)_navigationUtilitiesManager
{
  return self->__navigationUtilitiesManager;
}

- (void)set_navigationUtilitiesManager:(id)a3
{
  objc_storeStrong((id *)&self->__navigationUtilitiesManager, a3);
}

- (SFNavigationBarItem)navigationBarItem
{
  return self->_navigationBarItem;
}

- (void)setTranslationContext:(id)a3
{
  objc_storeStrong((id *)&self->_translationContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translationContext, 0);
  objc_storeStrong((id *)&self->__navigationUtilitiesManager, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierForProfileInstallation, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_preferredControlTintColor, 0);
  objc_storeStrong((id *)&self->_preferredBarTintColor, 0);
  objc_storeStrong((id *)&self->_activatedElementInfo, 0);
  objc_storeStrong((id *)&self->_linkActions, 0);
  objc_storeStrong((id *)&self->_wkPreferences, 0);
  objc_storeStrong((id *)&self->_reloadOptionsController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_touchUpGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_touchDownGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_stepperContainer, 0);
  objc_storeStrong((id *)&self->_assistantController, 0);
  objc_storeStrong((id *)&self->_urlForPendingNavigationToFallbackURLForWellKnownChangePasswordURL, 0);
  objc_storeStrong((id *)&self->_webExtensionsController, 0);
  objc_storeStrong((id *)&self->_contentBlockerManager, 0);
  objc_storeStrong((id *)&self->_urlToReloadForAdvancedPrivateBrowsingPrivacyProtections, 0);
  objc_storeStrong((id *)&self->_defaultWebpagePreferences, 0);
  objc_storeStrong((id *)&self->_wellKnownURLResponseCodeReliabilityChecker, 0);
  objc_storeStrong((id *)&self->_autoFillQuirksManager, 0);
  objc_storeStrong((id *)&self->_cachedLegacyTLSHostManager, 0);
  objc_storeStrong((id *)&self->_backForwardListItemForCurrentAppLinkBannerCheck, 0);
  objc_storeStrong(&self->_pendingNavigationActionDueToExternalSchemePromptHandler, 0);
  objc_storeStrong((id *)&self->_lastLoadErrorForFormatMenu, 0);
  objc_storeStrong((id *)&self->_hideNavigationBarGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pageFormatMenuController, 0);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong((id *)&self->_saveToFilesOperation, 0);
  objc_storeStrong((id *)&self->_customButtonUIActivity, 0);
  objc_storeStrong((id *)&self->_suggestedFilenameForNextCommit, 0);
  objc_storeStrong((id *)&self->_downloadToShowInQuickLook, 0);
  objc_storeStrong((id *)&self->_quickLookDocumentWriter, 0);
  objc_storeStrong((id *)&self->_quickLookDocumentController, 0);
  objc_storeStrong((id *)&self->_quickLookDocument, 0);
  objc_storeStrong((id *)&self->_sfScribbleController, 0);
  objc_storeStrong((id *)&self->_originalRequestURL, 0);
  objc_storeStrong((id *)&self->_webViewControllers, 0);
  objc_storeStrong((id *)&self->_urlToReloadEnablingPrivateRelay, 0);
  objc_storeStrong((id *)&self->_urlToReloadForcingContentBlockers, 0);
  objc_storeStrong((id *)&self->_perSitePreferencesVendor, 0);
  objc_storeStrong((id *)&self->_secIdentityPreferencesController, 0);
  objc_storeStrong((id *)&self->_printController, 0);
  objc_storeStrong((id *)&self->_telephonyNavigationPolicy, 0);
  objc_storeStrong((id *)&self->_sharingExtensionController, 0);
  objc_storeStrong((id *)&self->_EVOrganizationName, 0);
  objc_storeStrong((id *)&self->_pinnableBannerPendingFirstPaint, 0);
  objc_storeStrong((id *)&self->_activeDownload, 0);
  objc_storeStrong((id *)&self->_calendarEventDetector, 0);
  objc_storeStrong((id *)&self->_pageLoadErrorController, 0);
  objc_storeStrong((id *)&self->_showBarsFromBottomBarRecognizer, 0);
  objc_storeStrong((id *)&self->_fluidProgressController, 0);
  objc_storeStrong((id *)&self->_fluidProgressState, 0);
  objc_storeStrong((id *)&self->_URLSpoofingMitigator, 0);
  objc_storeStrong((id *)&self->_navigationBarItem, 0);
  objc_storeStrong((id *)&self->_dynamicBarAnimator, 0);
  objc_storeStrong((id *)&self->_updateContinuityTimer, 0);
  objc_storeStrong((id *)&self->_nanoDomainContainerView, 0);
  objc_storeStrong((id *)&self->_barManager, 0);
  objc_storeStrong((id *)&self->_lastUserInitiatedAction, 0);
  objc_storeStrong((id *)&self->_cachedMailContentProvider, 0);
  objc_storeStrong((id *)&self->_bottomToolbar, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_lastBackFowardListItemOnWhichReaderWasActivated, 0);
  objc_storeStrong((id *)&self->_readerViewController, 0);
  objc_storeStrong((id *)&self->_browserView, 0);
  objc_storeStrong((id *)&self->_previewCloseTimer, 0);
  objc_storeStrong((id *)&self->_previewWebView, 0);
  objc_storeStrong((id *)&self->_currentUsageTrackingURL, 0);
  objc_storeStrong((id *)&self->_screenTimeOverlayViewController, 0);
  objc_storeStrong((id *)&self->_cachedDigitalHealthManager, 0);
}

- (void)setConfiguration:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  OUTLINED_FUNCTION_1_5(&dword_1A3B2D000, a3, (uint64_t)a3, "Can't run extension '%{public}@' because it isn't part of the app '%{public}@'", (uint8_t *)&v3);
}

- (void)setConfiguration:(uint64_t)a3 .cold.2(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_1_5(&dword_1A3B2D000, a4, a3, "Couldn't find extension '%{public}@': %{public}@; the button won't be shown",
    (uint8_t *)a3);

  OUTLINED_FUNCTION_3_0();
}

- (void)setConfiguration:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "Some fields of the toolbar button are not valid; the button won't be shown",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

- (void)webViewController:(uint64_t *)a1 decidePolicyForNavigationAction:(NSObject *)a2 decisionHandler:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_error_impl(&dword_1A3B2D000, a2, OS_LOG_TYPE_ERROR, "Killing web process as a mitigation after it has rapidly attempted %zd navigations concurrently", (uint8_t *)&v3, 0xCu);
}

- (void)webViewControllerShouldAutofillESimInformation:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_1A3B2D000, v3, v4, "Could not fetch bundle record for connected process: %{public}@.", v5);

  OUTLINED_FUNCTION_3_0();
}

- (void)webViewControllerShouldAutofillESimInformation:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_1_1(&dword_1A3B2D000, v3, v4, "Failed to check if domain is allowed with error %@", v5);

  OUTLINED_FUNCTION_3_0();
}

- (void)webViewControllerShouldAutofillESimInformation:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "CoreTelephonyClient does not respond to selector isAutofilleSIMIdAllowedForDomain:clientBundleIdentifier:error:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_showDownload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "Failed to download calendar file", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_showDownload:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "Failed to download Profile; data is nil on disk", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end

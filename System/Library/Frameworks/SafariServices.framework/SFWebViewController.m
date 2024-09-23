@implementation SFWebViewController

- (SFWebViewController)initWithWebViewConfiguration:(id)a3 contentBlockerManager:(id)a4
{
  id v7;
  id v8;
  SFWebViewController *v9;
  SFWebViewController *v10;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v12;
  uint64_t v13;
  NSUUID *UUID;
  void *v15;
  uint64_t v16;
  NSUUID *tabIDForAutoFill;
  SFWebViewController *v18;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SFWebViewController;
  v9 = -[SFWebViewController init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_webViewConfiguration, a3);
    objc_storeStrong((id *)&v10->_contentBlockerManager, a4);
    -[SFContentBlockerManager reloadUserContentControllerReadingStateFromDisk:](v10->_contentBlockerManager, "reloadUserContentControllerReadingStateFromDisk:", 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v10, (CFNotificationCallback)contentBlockerDidChange, CFSTR("com.apple.SafariServices.ContentBlockerDidChange"), 0, (CFNotificationSuspensionBehavior)1028);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, sel__automaticPasswordInputViewNotification_, CFSTR("_SFAutomaticPasswordInputViewButtonPressedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = objc_claimAutoreleasedReturnValue();
    UUID = v10->_UUID;
    v10->_UUID = (NSUUID *)v13;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v10, sel__automaticPasswordInputViewAutoFillContextProviderRequiredNotification_, CFSTR("SFAutomaticPasswordInputViewAutoFillContextProviderRequiredNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = objc_claimAutoreleasedReturnValue();
    tabIDForAutoFill = v10->_tabIDForAutoFill;
    v10->_tabIDForAutoFill = (NSUUID *)v16;

    v18 = v10;
  }

  return v10;
}

- (void)_loadWebView
{
  _SFWebView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  WKWebViewConfiguration *webViewConfiguration;
  WKWebViewConfiguration *v9;
  _SFWebView *v10;
  void *v11;
  _SFFormAutoFillController *v12;
  _SFFormAutoFillController *autoFillController;
  SFDialogController *v14;
  SFDialogController *dialogController;
  _SFWebView *webView;

  v3 = [_SFWebView alloc];
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  webViewConfiguration = self->_webViewConfiguration;
  v9 = webViewConfiguration;
  if (!webViewConfiguration)
    v9 = (WKWebViewConfiguration *)objc_alloc_init(MEMORY[0x1E0CEF638]);
  v10 = -[_SFWebView initWithFrame:configuration:](v3, "initWithFrame:configuration:", v9, v4, v5, v6, v7);
  if (!webViewConfiguration)

  -[_SFWebView setNavigationDelegate:](v10, "setNavigationDelegate:", self);
  -[_SFWebView setUIDelegate:](v10, "setUIDelegate:", self);
  -[_SFWebView _setInputDelegate:](v10, "_setInputDelegate:", self);
  -[_SFWebView setDelegate:](v10, "setDelegate:", self);
  -[_SFWebView _setBackgroundExtendsBeyondPage:](v10, "_setBackgroundExtendsBeyondPage:", 1);
  -[_SFWebView setAllowsLinkPreview:](v10, "setAllowsLinkPreview:", 1);
  -[_SFWebView setInspectable:](v10, "setInspectable:", 1);
  -[_SFWebView setAutoresizingMask:](v10, "setAutoresizingMask:", 18);
  -[_SFWebView scrollView](v10, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setScrollsToTop:", 1);

  -[_SFWebView addObserver:forKeyPath:options:context:](v10, "addObserver:forKeyPath:options:context:", self, CFSTR("estimatedProgress"), 0, SFWebViewControllerObserverContext);
  -[_SFWebView addObserver:forKeyPath:options:context:](v10, "addObserver:forKeyPath:options:context:", self, CFSTR("URL"), 0, SFWebViewControllerObserverContext);
  -[_SFWebView addObserver:forKeyPath:options:context:](v10, "addObserver:forKeyPath:options:context:", self, CFSTR("hasOnlySecureContent"), 0, SFWebViewControllerObserverContext);
  -[_SFWebView addObserver:forKeyPath:options:context:](v10, "addObserver:forKeyPath:options:context:", self, CFSTR("_negotiatedLegacyTLS"), 0, SFWebViewControllerObserverContext);
  -[_SFWebView addObserver:forKeyPath:options:context:](v10, "addObserver:forKeyPath:options:context:", self, CFSTR("_webProcessIsResponsive"), 0, SFWebViewControllerObserverContext);
  -[_SFWebView addObserver:forKeyPath:options:context:](v10, "addObserver:forKeyPath:options:context:", self, CFSTR("themeColor"), 0, SFWebViewControllerObserverContext);
  -[_SFWebView addObserver:forKeyPath:options:context:](v10, "addObserver:forKeyPath:options:context:", self, CFSTR("underPageBackgroundColor"), 0, SFWebViewControllerObserverContext);
  -[_SFWebView _setObservedRenderingProgressEvents:](v10, "_setObservedRenderingProgressEvents:", 71);
  v12 = -[_SFFormAutoFillController initWithWebView:delegate:]([_SFFormAutoFillController alloc], "initWithWebView:delegate:", v10, self);
  autoFillController = self->_autoFillController;
  self->_autoFillController = v12;

  -[_SFFormAutoFillController setMetadataCorrectionsEnabled:](self->_autoFillController, "setMetadataCorrectionsEnabled:", 1);
  v14 = (SFDialogController *)objc_alloc_init(MEMORY[0x1E0D4EC68]);
  dialogController = self->_dialogController;
  self->_dialogController = v14;

  -[SFDialogController setDelegate:](self->_dialogController, "setDelegate:", self);
  -[SFDialogController setDialogPresenter:](self->_dialogController, "setDialogPresenter:", v10);
  -[SFDialogController setViewControllerPresenter:](self->_dialogController, "setViewControllerPresenter:", self);
  -[SFDialogController owningWebViewWillBecomeActive](self->_dialogController, "owningWebViewWillBecomeActive");
  webView = self->_webView;
  self->_webView = v10;

}

- (void)_loadWebViewIfNeeded
{
  if (!self->_webView)
    -[SFWebViewController _loadWebView](self, "_loadWebView");
}

- (void)loadView
{
  id v3;

  -[SFWebViewController _loadWebViewIfNeeded](self, "_loadWebViewIfNeeded");
  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v3, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "addSubview:", self->_webView);
  -[SFWebViewController setView:](self, "setView:", v3);

}

- (id)_presentingViewControllerForWebView:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentingViewControllerForWebViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (WKWebView)webView
{
  -[SFWebViewController _loadWebViewIfNeeded](self, "_loadWebViewIfNeeded");
  return (WKWebView *)self->_webView;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v6;

  -[SFWebViewController webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUIDelegate:", 0);
  -[SFDialogController owningTabWillClose](self->_dialogController, "owningTabWillClose");
  objc_msgSend(v3, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("estimatedProgress"), SFWebViewControllerObserverContext);
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("URL"), SFWebViewControllerObserverContext);
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("hasOnlySecureContent"), SFWebViewControllerObserverContext);
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("_negotiatedLegacyTLS"), SFWebViewControllerObserverContext);
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("_webProcessIsResponsive"), SFWebViewControllerObserverContext);
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("themeColor"), SFWebViewControllerObserverContext);
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("underPageBackgroundColor"), SFWebViewControllerObserverContext);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  -[_SFFormAutoFillController invalidate](self->_autoFillController, "invalidate");

  v6.receiver = self;
  v6.super_class = (Class)SFWebViewController;
  -[SFWebViewController dealloc](&v6, sel_dealloc);
}

- (void)invalidate
{
  -[WBSPermissionDialogThrottler invalidate](self->_permissionDialogThrottler, "invalidate");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id WeakRetained;
  void *v10;
  int v11;
  void *v12;

  v8 = a3;
  if (self->_webView == a4)
  {
    v12 = v8;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("estimatedProgress")))
    {
      objc_msgSend(WeakRetained, "webViewControllerDidChangeEstimatedProgress:", self);
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("URL")))
    {
      objc_msgSend(WeakRetained, "webViewControllerDidChangeURL:", self);
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("hasOnlySecureContent")) & 1) != 0
           || objc_msgSend(v12, "isEqualToString:", CFSTR("_negotiatedLegacyTLS")))
    {
      objc_msgSend(WeakRetained, "webViewControllerDidChangeHasOnlySecureContent:", self);
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("_webProcessIsResponsive")))
    {
      -[SFWebViewController webView](self, "webView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "_webProcessIsResponsive");

      if (v11)
        objc_msgSend(WeakRetained, "webViewControllerWebProcessDidBecomeResponsive:", self);
      else
        objc_msgSend(WeakRetained, "webViewControllerWebProcessDidBecomeUnresponsive:", self);
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("themeColor"))
            || objc_msgSend(v12, "isEqualToString:", CFSTR("underPageBackgroundColor")))
           && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "webViewControllerDidUpdateThemeColor:", self);
    }

    v8 = v12;
  }

}

- (void)setLoading:(BOOL)a3
{
  id WeakRetained;

  if (self->_loading != a3)
  {
    self->_loading = a3;
    if (!a3)
      self->_shouldSuppressDialogsThatBlockWebProcess = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "webViewControllerDidChangeLoadingState:", self);

  }
}

- (void)willActivateWebViewController
{
  -[SFDialogController owningWebViewWillBecomeActive](self->_dialogController, "owningWebViewWillBecomeActive");
}

- (void)willBeginUserInitiatedNavigation
{
  self->_shouldSuppressDialogsThatBlockWebProcess = 1;
  -[SFDialogController owningWebViewWillNavigate](self->_dialogController, "owningWebViewWillNavigate");
}

- (void)reloadContentBlockers
{
  -[SFContentBlockerManager reloadUserContentControllerReadingStateFromDisk:](self->_contentBlockerManager, "reloadUserContentControllerReadingStateFromDisk:", 1);
  -[SFContentBlockerManager informObserversThatContentBlockerManagerExtensionListDidChange](self->_contentBlockerManager, "informObserversThatContentBlockerManagerExtensionListDidChange");
}

- (void)collectDiagnosticsForAutoFillWithCompletionHandler:(id)a3
{
  -[_SFFormAutoFillController collectDiagnosticsForAutoFillWithCompletionHandler:](self->_autoFillController, "collectDiagnosticsForAutoFillWithCompletionHandler:", a3);
}

- (void)setUpFormTelemetryDataMonitorWithWebpageLocale:(id)a3
{
  -[_SFFormAutoFillController setUpFormTelemetryDataMonitorWithWebpageLocale:](self->_autoFillController, "setUpFormTelemetryDataMonitorWithWebpageLocale:", a3);
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  -[_SFFormAutoFillController offerToSaveUnsubmittedFormDataIfNeeded](self->_autoFillController, "offerToSaveUnsubmittedFormDataIfNeeded");
  -[SFWebViewController setLoading:](self, "setLoading:", 1);
  self->_didFinishDocumentLoad = 0;
  self->_didFirstLayout = 0;
  self->_didFirstVisuallyNonEmptyLayout = 0;
  self->_didFirstPaint = 0;
  -[WBSPermissionDialogThrottler willPerformUserInitiatedNavigation](self->_permissionDialogThrottler, "willPerformUserInitiatedNavigation");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "webViewController:didStartProvisionalNavigation:", self, v6);

}

- (void)webView:(id)a3 didReceiveServerRedirectForProvisionalNavigation:(id)a4
{
  SFWebViewControllerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "webViewController:didReceiveServerRedirectForProvisionalNavigation:", self, v6);

}

- (void)_webView:(id)a3 willPerformClientRedirectToURL:(id)a4 delay:(double)a5
{
  SFWebViewControllerDelegate **p_delegate;
  id v8;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "webViewController:willPerformClientRedirectToURL:withDelay:", self, v8, a5);

}

- (void)_webViewDidCancelClientRedirect:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "webViewControllerDidCancelClientRedirect:", self);

}

- (void)webView:(id)a3 didCommitNavigation:(id)a4
{
  id v6;
  SFDialogController *dialogController;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  NSString *domainWhereUserDeclinedAutomaticStrongPassword;
  id v13;

  v13 = a3;
  v6 = a4;
  dialogController = self->_dialogController;
  objc_msgSend(v13, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDialogController owningWebViewDidCommitNavigationWithURL:](dialogController, "owningWebViewDidCommitNavigationWithURL:", v8);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "webViewController:didCommitNavigation:", self, v6);

  -[_SFFormAutoFillController setLastFilledCreditCardData:](self->_autoFillController, "setLastFilledCreditCardData:", 0);
  objc_msgSend(v13, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safari_userVisibleHostWithoutWWWSubdomain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "isEqualToString:", self->_domainWhereUserDeclinedAutomaticStrongPassword) & 1) == 0)
  {
    domainWhereUserDeclinedAutomaticStrongPassword = self->_domainWhereUserDeclinedAutomaticStrongPassword;
    self->_domainWhereUserDeclinedAutomaticStrongPassword = 0;

  }
  self->_hasFocusedInputFieldOnCurrentPage = 0;
  self->_shouldSuppressDialogsThatBlockWebProcess = 0;
  self->_hasFormControlInteraction = 0;

}

- (void)_webView:(id)a3 navigation:(id)a4 didSameDocumentNavigation:(int64_t)a5
{
  id v8;
  id WeakRetained;
  id v10;

  v10 = a3;
  v8 = a4;
  if (a5)
    -[_SFFormAutoFillController offerToSaveUnsubmittedFormDataIfNeeded](self->_autoFillController, "offerToSaveUnsubmittedFormDataIfNeeded");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "webViewController:didSameDocumentNavigation:ofType:", self, v8, a5);

}

- (void)_webView:(id)a3 authenticationChallenge:(id)a4 shouldAllowLegacyTLS:(id)a5
{
  void (**v7)(id, _QWORD);
  id WeakRetained;
  void *v9;
  id v10;

  v10 = a4;
  v7 = (void (**)(id, _QWORD))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "webViewController:authenticationChallenge:shouldAllowLegacyTLS:", self, v10, v7);
  else
    v7[2](v7, 0);

}

- (void)_webView:(id)a3 didNegotiateModernTLSForURL:(id)a4
{
  SFWebViewControllerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "authenticationChallengeDidNegotiateModernTLS:", v5);

}

- (void)_webView:(id)a3 decidePolicyForSOAuthorizationLoadWithCurrentPolicy:(int64_t)a4 forExtension:(id)a5 completionHandler:(id)a6
{
  void (**v9)(id, uint64_t);
  id WeakRetained;
  id v11;

  v11 = a5;
  v9 = (void (**)(id, uint64_t))a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "webViewController:decidePolicyForSOAuthorizationLoadWithCurrentPolicy:forExtension:completionHandler:", self, a4, v11, v9);
  else
    v9[2](v9, 1);

}

- (void)_webViewWillEndNavigationGesture:(id)a3 withNavigationToBackForwardListItem:(id)a4
{
  SFWebViewControllerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "webViewController:willEndNavigationGestureToBackForwardListItem:", self, v6);

}

- (void)_webViewDidEndNavigationGesture:(id)a3 withNavigationToBackForwardListItem:(id)a4
{
  SFWebViewControllerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "webViewController:didEndNavigationGestureToBackForwardListItem:", self, v6);

}

- (void)_webView:(id)a3 willGoToBackForwardListItem:(id)a4 inPageCache:(BOOL)a5
{
  _BOOL8 v5;
  id WeakRetained;
  id v8;

  v5 = a5;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "webViewController:willGoToBackForwardListItem:inPageCache:", self, v8, v5);

}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  -[SFWebViewController setLoading:](self, "setLoading:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "webViewController:didFinishNavigation:", self, v6);

}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 preferences:(id)a5 decisionHandler:(id)a6
{
  id v8;
  id WeakRetained;
  void *v10;
  id v11;

  v11 = a4;
  v8 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "webViewController:decidePolicyForNavigationAction:decisionHandler:", self, v11, v8);
  else
    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);

}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  void (**v7)(id, _QWORD);
  id WeakRetained;
  void *v9;
  id v10;

  v10 = a4;
  v7 = (void (**)(id, _QWORD))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "webViewController:decidePolicyForNavigationResponse:decisionHandler:", self, v10, v7);
  else
    v7[2](v7, 0);

}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v7;
  id WeakRetained;
  id v9;

  v9 = a4;
  v7 = a5;
  -[SFWebViewController setLoading:](self, "setLoading:", 0);
  self->_didFirstVisuallyNonEmptyLayout = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "webViewController:didFailProvisionalNavigation:withError:", self, v9, v7);

}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v7;
  id WeakRetained;
  id v9;

  v9 = a4;
  v7 = a5;
  -[SFWebViewController setLoading:](self, "setLoading:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "webViewController:didFailNavigation:withError:", self, v9, v7);

}

- (void)_webView:(id)a3 renderingProgressDidChange:(unint64_t)a4
{
  char v4;
  id WeakRetained;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  if ((v4 & 1) != 0)
  {
    self->_didFirstLayout = 1;
    -[_SFFormAutoFillController prefillFormsSoonIfNeeded](self->_autoFillController, "prefillFormsSoonIfNeeded");
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = WeakRetained;
  if ((v4 & 2) != 0)
  {
    self->_didFirstVisuallyNonEmptyLayout = 1;
    objc_msgSend(WeakRetained, "webViewControllerDidFirstVisuallyNonEmptyLayout:", self);
    objc_msgSend(v7, "webViewControllerUpdateNavigationBar:", self);
  }
  if ((v4 & 0x40) != 0)
  {
    self->_didFirstPaint = 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "webViewControllerDidFirstPaint:", self);
  }

}

- (void)_webView:(id)a3 navigationDidFinishDocumentLoad:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  self->_didFinishDocumentLoad = 1;
  -[_SFFormAutoFillController prefillFormsSoonIfNeeded](self->_autoFillController, "prefillFormsSoonIfNeeded");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "webViewController:didFinishDocumentLoadForNavigation:", self, v6);

}

- (void)_webViewWebProcessDidCrash:(id)a3
{
  id WeakRetained;

  -[SFDialogController owningWebViewDidChangeProcessID](self->_dialogController, "owningWebViewDidChangeProcessID", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "webViewControllerWebProcessDidCrash:", self);

}

- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5
{
  void (**v7)(id, uint64_t, _QWORD);
  id WeakRetained;
  void *v9;
  id v10;

  v10 = a4;
  v7 = (void (**)(id, uint64_t, _QWORD))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "webViewController:didReceiveAuthenticationChallenge:completionHandler:", self, v10, v7);
  else
    v7[2](v7, 2, 0);

}

- (void)_webView:(id)a3 didStartLoadForQuickLookDocumentInMainFrameWithFileName:(id)a4 uti:(id)a5
{
  SFWebViewControllerDelegate **p_delegate;
  id v8;
  id v9;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v8 = a5;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "webViewController:didStartLoadForQuickLookDocumentInMainFrameWithFileName:uti:", self, v9, v8);

}

- (void)_webView:(id)a3 didFinishLoadForQuickLookDocumentInMainFrame:(id)a4
{
  SFWebViewControllerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "webViewController:didFinishLoadForQuickLookDocumentInMainFrame:", self, v6);

}

- (_SFAuthenticationContext)autoFillAuthenticationContext
{
  return -[_SFFormAutoFillController authenticationContext](self->_autoFillController, "authenticationContext");
}

- (BOOL)formAutoFillControllerCanPrefillForm:(id)a3
{
  return self->_didFinishDocumentLoad && self->_didFirstLayout;
}

- (id)formAutoFillControllerURLForFormAutoFill:(id)a3
{
  void *v3;
  void *v4;

  -[SFWebViewController webView](self, "webView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)formAutoFillControllerShouldDisableStreamlinedLogin:(id)a3
{
  return 0;
}

- (id)currentSavedAccountContextForFormAutoFillController:(id)a3
{
  return 0;
}

- (BOOL)formAutoFillControllerDidUserDeclineAutomaticStrongPasswordForCurrentDomain:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[SFWebViewController webView](self, "webView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_userVisibleHostWithoutWWWSubdomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqualToString:", self->_domainWhereUserDeclinedAutomaticStrongPassword);
  return (char)v4;
}

- (void)formAutoFillControllerUserChoseToUseGeneratedPassword:(id)a3
{
  NSString *domainWhereUserDeclinedAutomaticStrongPassword;

  domainWhereUserDeclinedAutomaticStrongPassword = self->_domainWhereUserDeclinedAutomaticStrongPassword;
  self->_domainWhereUserDeclinedAutomaticStrongPassword = 0;

}

- (void)formAutoFillControllerGetAuthenticationForAutoFill:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "authenticationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__SFWebViewController_formAutoFillControllerGetAuthenticationForAutoFill_completion___block_invoke;
  v10[3] = &unk_1E4AC37F0;
  v8 = v6;
  v12 = v8;
  v9 = v5;
  v11 = v9;
  objc_msgSend(v7, "authenticateForClient:userInitiated:completion:", v9, 1, v10);

}

void __85__SFWebViewController_formAutoFillControllerGetAuthenticationForAutoFill_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "authenticationContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authenticatedContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, a2, v4);

}

- (void)performPageLevelAutoFill
{
  -[_SFFormAutoFillController performPageLevelAutoFill](self->_autoFillController, "performPageLevelAutoFill");
}

- (void)_automaticPasswordInputViewNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v10, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("SFAutoFillContextProviderIdentifierUserInfoKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithUUIDString:", v6);

  objc_msgSend(v10, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safari_numberForKey:", CFSTR("_SFAutomaticPasswordInputViewNotificationPressedButtonUserInfoKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && objc_msgSend(v9, "integerValue") == 1)
  {
    -[_SFFormAutoFillController removeAutomaticPasswordButtonInitiatedByUser:](self->_autoFillController, "removeAutomaticPasswordButtonInitiatedByUser:", 1);
    -[SFWebViewController _userDeclinedAutomaticStrongPasswordForCurrentDomainOnTabWithUUID:](self, "_userDeclinedAutomaticStrongPasswordForCurrentDomainOnTabWithUUID:", v7);
  }

}

- (void)_userDeclinedAutomaticStrongPasswordForCurrentDomainOnTabWithUUID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SFWebViewController webView](self, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_userVisibleHostWithoutWWWSubdomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFWebViewController UUID](self, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v8, "isEqual:", v7);

  if ((_DWORD)v5)
    objc_storeStrong((id *)&self->_domainWhereUserDeclinedAutomaticStrongPassword, v6);

}

- (void)_automaticPasswordInputViewAutoFillContextProviderRequiredNotification:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SFAutomaticPasswordInputViewControllerKey"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAutoFillContextProvider:", self);
}

- (void)formAutoFillControllerDidFocusSensitiveFormField:(id)a3
{
  _BOOL4 hasFocusedInputFieldOnCurrentPage;
  id WeakRetained;

  hasFocusedInputFieldOnCurrentPage = self->_hasFocusedInputFieldOnCurrentPage;
  self->_hasFocusedInputFieldOnCurrentPage = 1;
  if (!hasFocusedInputFieldOnCurrentPage)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "webViewControllerUpdateNavigationBar:", self);

  }
}

- (void)_webView:(id)a3 willStartInputSession:(id)a4
{
  _SFFormAutoFillInputSession *v5;
  id v6;

  v6 = a4;
  v5 = -[_SFFormAutoFillInputSession initWithFormInputSession:]([_SFFormAutoFillInputSession alloc], "initWithFormInputSession:", v6);
  if (!objc_msgSend(v6, "requiresStrongPasswordAssistance")
    || (-[_SFFormAutoFillController prepareForShowingAutomaticStrongPasswordWithInputSession:](self->_autoFillController, "prepareForShowingAutomaticStrongPasswordWithInputSession:", v5), (objc_msgSend(MEMORY[0x1E0D8A8F8], "isPasswordManagerAppEnabledAndInstalled") & 1) != 0))
  {
    -[_SFFormAutoFillController fieldWillFocusWithInputSession:](self->_autoFillController, "fieldWillFocusWithInputSession:", v5);
  }

}

- (void)_webView:(id)a3 didStartInputSession:(id)a4
{
  id WeakRetained;
  _SFFormAutoFillController *autoFillController;
  _SFFormAutoFillInputSession *v7;
  id v8;

  v8 = a4;
  if ((objc_msgSend(v8, "requiresStrongPasswordAssistance") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[_SFFormAutoFillController setShouldAutofillESimInformation:](self->_autoFillController, "setShouldAutofillESimInformation:", objc_msgSend(WeakRetained, "webViewControllerShouldAutofillESimInformation:", self));
    autoFillController = self->_autoFillController;
    v7 = -[_SFFormAutoFillInputSession initWithFormInputSession:]([_SFFormAutoFillInputSession alloc], "initWithFormInputSession:", v8);
    -[_SFFormAutoFillController fieldDidFocusWithInputSession:](autoFillController, "fieldDidFocusWithInputSession:", v7);

  }
}

- (void)_webViewDidShowSafeBrowsingWarning:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didShowSafeBrowsingWarningWithSource:", 0);

}

- (int64_t)_webView:(id)a3 decidePolicyForFocusedElement:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (-[_SFFormAutoFillController elementIsBeingFocusedForStreamlinedLogin:](self->_autoFillController, "elementIsBeingFocusedForStreamlinedLogin:", v7))
  {
    -[SFWebViewController presentedViewController](self, "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = 2;
    else
      v9 = 1;
  }
  else
  {
    objc_msgSend(v6, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_committedURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqual:", v10))
      v9 = 0;
    else
      v9 = 2;

  }
  return v9;
}

- (BOOL)_webView:(id)a3 focusRequiresStrongPasswordAssistance:(id)a4
{
  id v5;
  _SFFormAutoFillController *autoFillController;
  _SFFormAutoFillInputSession *v7;
  void *v8;

  v5 = a4;
  autoFillController = self->_autoFillController;
  v7 = -[_SFFormAutoFillInputSession initWithFocusedElement:]([_SFFormAutoFillInputSession alloc], "initWithFocusedElement:", v5);
  -[_SFFormAutoFillController beginAutomaticPasswordInteractionWithInputSession:](autoFillController, "beginAutomaticPasswordInteractionWithInputSession:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(autoFillController) = v8 != 0;

  return (char)autoFillController;
}

- (void)_webView:(id)a3 didResignInputElementStrongPasswordAppearanceWithUserInfo:(id)a4
{
  -[_SFFormAutoFillController removeAutomaticPasswordVisualTreatment](self->_autoFillController, "removeAutomaticPasswordVisualTreatment", a3, a4);
}

- (id)_webViewAdditionalContextForStrongPasswordAssistance:(id)a3
{
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("SFAutoFillContextProviderIdentifierUserInfoKey");
  -[NSUUID UUIDString](self->_UUID, "UUIDString", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)currentStrongPassword
{
  return -[_SFFormAutoFillController currentStrongPassword](self->_autoFillController, "currentStrongPassword");
}

- (NSString)defaultStrongPassword
{
  return -[_SFFormAutoFillController defaultStrongPassword](self->_autoFillController, "defaultStrongPassword");
}

- (NSString)alphanumericStrongPassword
{
  return (NSString *)-[_SFFormAutoFillController alphanumericStrongPassword](self->_autoFillController, "alphanumericStrongPassword");
}

- (void)replaceCurrentPasswordWithPassword:(id)a3
{
  -[_SFFormAutoFillController replaceCurrentPasswordWithPassword:](self->_autoFillController, "replaceCurrentPasswordWithPassword:", a3);
}

- (void)makeStrongPasswordFieldViewableAndEditable:(BOOL)a3
{
  -[_SFFormAutoFillController makeStrongPasswordFieldViewableAndEditable:](self->_autoFillController, "makeStrongPasswordFieldViewableAndEditable:", a3);
}

- (void)copyCurrentStrongPassword
{
  -[_SFFormAutoFillController copyCurrentStrongPassword](self->_autoFillController, "copyCurrentStrongPassword");
}

- (void)_webView:(id)a3 willSubmitFormValues:(id)a4 userObject:(id)a5 submissionHandler:(id)a6
{
  -[_SFFormAutoFillController willSubmitFormValues:userObject:submissionHandler:](self->_autoFillController, "willSubmitFormValues:userObject:submissionHandler:", a4, a5, a6);
}

- (void)_webView:(id)a3 accessoryViewCustomButtonTappedInFormInputSession:(id)a4
{
  -[_SFFormAutoFillController autoFill](self->_autoFillController, "autoFill", a3, a4);
}

- (void)_webView:(id)a3 insertTextSuggestion:(id)a4 inInputSession:(id)a5
{
  -[_SFFormAutoFillController insertTextSuggestion:](self->_autoFillController, "insertTextSuggestion:", a4);
}

- (void)webView:(id)a3 runJavaScriptAlertPanelWithMessage:(id)a4 initiatedByFrame:(id)a5 completionHandler:(id)a6
{
  SFDialogController *dialogController;
  id v7;

  dialogController = self->_dialogController;
  objc_msgSend(MEMORY[0x1E0D4EC60], "javaScriptAlertDialogWithMessage:completionHandler:", a4, a6, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SFDialogController presentDialog:](dialogController, "presentDialog:");

}

- (void)webView:(id)a3 runJavaScriptConfirmPanelWithMessage:(id)a4 initiatedByFrame:(id)a5 completionHandler:(id)a6
{
  SFDialogController *dialogController;
  id v7;

  dialogController = self->_dialogController;
  objc_msgSend(MEMORY[0x1E0D4EC60], "javaScriptConfirmDialogWithMessage:completionHandler:", a4, a6, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SFDialogController presentDialog:](dialogController, "presentDialog:");

}

- (void)webView:(id)a3 runJavaScriptTextInputPanelWithPrompt:(id)a4 defaultText:(id)a5 initiatedByFrame:(id)a6 completionHandler:(id)a7
{
  SFDialogController *dialogController;
  id v8;

  dialogController = self->_dialogController;
  objc_msgSend(MEMORY[0x1E0D4EC60], "javaScriptPromptDialogWithMessage:defaultText:completionHandler:", a4, a5, a7, a6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SFDialogController presentDialog:](dialogController, "presentDialog:");

}

- (void)_webView:(id)a3 requestStorageAccessPanelForDomain:(id)a4 underCurrentDomain:(id)a5 completionHandler:(id)a6
{
  SFDialogController *dialogController;
  id v7;

  dialogController = self->_dialogController;
  objc_msgSend(MEMORY[0x1E0D4EC60], "requestStorageAccessDialogForDomain:underCurrentDomain:extensionsController:completionHandler:", a4, a5, 0, a6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SFDialogController presentDialog:](dialogController, "presentDialog:");

}

- (void)webViewDidClose:(id)a3
{
  SFWebViewControllerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "webViewController:webViewDidClose:", self, v5);

}

- (void)_webView:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 windowFeatures:(id)a6 completionHandler:(id)a7
{
  id v10;
  void (**v11)(id, _QWORD);
  id WeakRetained;
  void *v13;
  id v14;

  v14 = a4;
  v10 = a5;
  v11 = (void (**)(id, _QWORD))a7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v13 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "webViewController:createWebViewWithConfiguration:forNavigationAction:completionHandler:", self, v14, v10, v11);
  else
    v11[2](v11, 0);

}

- (BOOL)_webView:(id)a3 shouldIncludeAppLinkActionsForElement:(id)a4
{
  return 0;
}

- (void)_webView:(id)a3 contextMenuConfigurationForElement:(id)a4 completionHandler:(id)a5
{
  void (**v7)(id, _QWORD);
  id WeakRetained;
  id v9;

  v9 = a4;
  v7 = (void (**)(id, _QWORD))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "webViewController:contextMenuConfigurationForElement:completionHandler:", self, v9, v7);
  else
    v7[2](v7, 0);

}

- (void)_webView:(id)a3 contextMenuWillPresentForElement:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "webViewController:contextMenuWillPresentForElement:", self, v6);

}

- (id)_webView:(id)a3 contextMenuContentPreviewForElement:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "webViewController:contextMenuContentPreviewForElement:", self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_webView:(id)a3 contextMenuForElement:(id)a4 willCommitWithAnimator:(id)a5
{
  id v7;
  id WeakRetained;
  id v9;

  v9 = a4;
  v7 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "webViewController:contextMenuForElement:willCommitWithAnimator:", self, v9, v7);

}

- (void)_webView:(id)a3 contextMenuDidEndForElement:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "webViewController:contextMenuDidEndForElement:", self, v6);

}

- (void)_webView:(id)a3 printFrame:(id)a4
{
  SFWebViewControllerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "webViewController:printFrame:", self, v6);

}

- (void)_webViewDidEnterFullscreen:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "webViewController:didChangeFullScreen:", self, 1);

}

- (void)_webViewDidExitFullscreen:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "webViewController:didChangeFullScreen:", self, 0);

}

- (void)_webView:(id)a3 requestGeolocationAuthorizationForURL:(id)a4 frame:(id)a5 decisionHandler:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a4;
  v9 = a5;
  v10 = a6;
  +[_SFGeolocationPermissionManager sharedManager](_SFGeolocationPermissionManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requestPermissionForURL:frame:dialogPresenter:completionHandler:", v12, v9, self, v10);

}

- (void)_webView:(id)a3 didChangeSafeAreaShouldAffectObscuredInsets:(BOOL)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "webViewControllerDidChangeSafeAreaShouldAffectObscuredInsets:", self);

}

- (int64_t)_webView:(id)a3 dataOwnerForDropSession:(id)a4
{
  return SFDataOwnerForWebViewInteraction();
}

- (int64_t)_webView:(id)a3 dataOwnerForDragSession:(id)a4
{
  return SFDataOwnerForWebViewInteraction();
}

- (void)_webView:(id)a3 requestWebAuthenticationConditionalMediationRegistrationForUser:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v7 = a4;
  v8 = a5;
  +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFWebViewController tabIDForAutoFill](self, "tabIDForAutoFill");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFWebViewController webView](self, "webView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __114__SFWebViewController__webView_requestWebAuthenticationConditionalMediationRegistrationForUser_completionHandler___block_invoke;
  v14[3] = &unk_1E4AC3818;
  v13 = v8;
  v15 = v13;
  objc_msgSend(v9, "canAutomaticallyRegisterPasskeyForUsername:inTabWithID:currentURL:completionHandler:", v7, v10, v12, v14);

}

uint64_t __114__SFWebViewController__webView_requestWebAuthenticationConditionalMediationRegistrationForUser_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_webView:(id)a3 requestUserMediaAuthorizationForDevices:(unint64_t)a4 url:(id)a5 mainFrameURL:(id)a6 decisionHandler:(id)a7
{
  id v11;
  id v12;
  void *v13;
  id v14;

  v14 = a5;
  v11 = a6;
  v12 = a7;
  +[WBSUserMediaPermissionController sharedController](_SFUserMediaPermissionController, "sharedController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requestUserMediaAuthorizationForDevices:url:mainFrameURL:decisionHandler:dialogPresenter:", a4, v14, v11, v12, self);

}

- (void)_webView:(id)a3 checkUserMediaPermissionForURL:(id)a4 mainFrameURL:(id)a5 frameIdentifier:(unint64_t)a6 decisionHandler:(id)a7
{
  id v10;
  id v11;
  void *v12;
  id v13;

  v13 = a4;
  v10 = a5;
  v11 = a7;
  +[WBSUserMediaPermissionController sharedController](_SFUserMediaPermissionController, "sharedController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "checkUserMediaPermissionForURL:mainFrameURL:frameIdentifier:decisionHandler:", v13, v10, a6, v11);

}

- (void)_webView:(id)a3 mediaCaptureStateDidChange:(unint64_t)a4
{
  id v6;

  -[SFWebViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "webViewController:mediaCaptureStateDidChange:", self, a4);

}

- (void)_webView:(id)a3 queryPermission:(id)a4 forOrigin:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v8 = a4;
  v9 = a5;
  v10 = a6;
  v11 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v9, "protocol");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setScheme:", v12);

  objc_msgSend(v9, "host");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_webkit_decodeHostName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHost:", v14);

  if (objc_msgSend(v9, "port"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "port"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPort:", v15);

  }
  objc_msgSend(v11, "host");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("geolocation")))
  {
    +[_SFGeolocationPermissionManager sharedManager](_SFGeolocationPermissionManager, "sharedManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __76__SFWebViewController__webView_queryPermission_forOrigin_completionHandler___block_invoke;
    v23[3] = &unk_1E4AC3840;
    v24 = v10;
    objc_msgSend(v17, "getGeolocationSettingForDomain:completionHandler:", v16, v23);
    v18 = &v24;
  }
  else
  {
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("camera")) & 1) == 0
      && (objc_msgSend(v8, "isEqualToString:", CFSTR("microphone")) & 1) == 0)
    {
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
      goto LABEL_9;
    }
    +[WBSUserMediaPermissionController sharedController](_SFUserMediaPermissionController, "sharedController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __76__SFWebViewController__webView_queryPermission_forOrigin_completionHandler___block_invoke_2;
    v20[3] = &unk_1E4AC3868;
    v21 = v8;
    v22 = v10;
    objc_msgSend(v19, "getPermissionForOrigin:topLevelOrigin:completionHandler:", v16, v16, v20);
    v18 = &v21;

    v17 = v22;
  }

LABEL_9:
}

uint64_t __76__SFWebViewController__webView_queryPermission_forOrigin_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = WBSUserMediaPermissionToWKPermissionDecision();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, v2);
}

uint64_t __76__SFWebViewController__webView_queryPermission_forOrigin_completionHandler___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("camera"));
  v3 = *(_QWORD *)(a1 + 40);
  if (v2)
    v4 = WBSUserMediaPermissionToWKPermissionDecisionCamera();
  else
    v4 = WBSUserMediaPermissionToWKPermissionDecisionMicrophone();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

- (BOOL)_webView:(id)a3 fileUploadPanelContentIsManagedWithInitiatingFrame:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isURLManaged:", v7);

  return v8;
}

- (void)_webView:(id)a3 updatedAppBadge:(id)a4 fromSecurityOrigin:(id)a5
{
  id v7;
  id WeakRetained;
  id v9;

  v9 = a4;
  v7 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "webViewController:updatedAppBadge:fromSecurityOrigin:", self, v9, v7);

}

- (int64_t)dialogController:(id)a3 presentationPolicyForDialog:(id)a4
{
  id v5;
  int64_t v6;
  id WeakRetained;

  v5 = a4;
  if (objc_msgSend(v5, "completionHandlerBlocksWebProcess")
    && self->_shouldSuppressDialogsThatBlockWebProcess)
  {
    v6 = 1;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_msgSend(WeakRetained, "webViewController:presentationPolicyForDialog:", self, v5);

  }
  return v6;
}

- (void)dialogController:(id)a3 willPresentDialog:(id)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "webViewControllerWillPresentJavaScriptDialog:", self);

}

- (void)presentDialog:(id)a3 sender:(id)a4
{
  -[SFDialogController presentDialog:](self->_dialogController, "presentDialog:", a3, a4);
}

- (id)permissionDialogThrottler
{
  WBSPermissionDialogThrottler *permissionDialogThrottler;
  WBSPermissionDialogThrottler *v4;
  WBSPermissionDialogThrottler *v5;

  permissionDialogThrottler = self->_permissionDialogThrottler;
  if (!permissionDialogThrottler)
  {
    v4 = (WBSPermissionDialogThrottler *)objc_alloc_init(MEMORY[0x1E0D8AAE8]);
    v5 = self->_permissionDialogThrottler;
    self->_permissionDialogThrottler = v4;

    permissionDialogThrottler = self->_permissionDialogThrottler;
  }
  return permissionDialogThrottler;
}

- (void)dialogController:(id)a3 presentViewController:(id)a4 withAdditionalAnimations:(id)a5
{
  id v7;
  id v8;

  v8 = a4;
  v7 = a5;
  -[SFWebViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
  objc_msgSend(v8, "_sf_animateAlongsideTransitionOrPerform:", v7);

}

- (void)dialogController:(id)a3 dismissViewController:(id)a4 withAdditionalAnimations:(id)a5
{
  id v6;
  id v7;

  v7 = a4;
  v6 = a5;
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(v7, "_sf_animateAlongsideTransitionOrPerform:", v6);

}

- (void)sfWebViewDidChangeSafeAreaInsets:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "webViewControllerDidChangeSafeAreaInsets:", self);

}

- (void)sfWebViewDidBecomeFirstResponder:(id)a3
{
  -[_SFFormAutoFillController updateSuggestions](self->_autoFillController, "updateSuggestions", a3);
}

- (void)sfWebViewDidStartFormControlInteraction:(id)a3
{
  self->_hasFormControlInteraction = 1;
}

- (void)sfWebViewDidEndFormControlInteraction:(id)a3
{
  self->_hasFormControlInteraction = 0;
}

- (id)sfWebView:(id)a3 didStartDownload:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "webViewController:didStartDownload:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)sfWebViewCanPromptForAccountSecurityRecommendation
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(WeakRetained, "webViewControllerCanPromptForAccountSecurityRecommendation:", self);
  else
    v4 = 1;

  return v4;
}

- (BOOL)sfWebViewShouldFillStringForFind:(id)a3
{
  id WeakRetained;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(WeakRetained, "webViewControllerShouldFillStringForFind:", self);
  else
    v5 = 0;

  return v5;
}

- (BOOL)sfWebViewCanFindNextOrPrevious:(id)a3
{
  id WeakRetained;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(WeakRetained, "webViewControllerCanFindNextOrPrevious:", self);
  else
    v5 = 1;

  return v5;
}

- (void)_webView:(id)a3 requestNotificationPermissionForSecurityOrigin:(id)a4 decisionHandler:(id)a5
{
  void (**v7)(id, _QWORD);
  id WeakRetained;
  id v9;

  v9 = a4;
  v7 = (void (**)(id, _QWORD))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "webViewController:requestNotificationPermissionForSecurityOrigin:decisionHandler:", self, v9, v7);
  else
    v7[2](v7, 0);

}

- (_SFFormAutoFillController)autoFillController
{
  return self->_autoFillController;
}

- (NSURL)url
{
  void *v2;
  void *v3;

  -[SFWebViewController webView](self, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (unint64_t)autoFillFormType
{
  return -[_SFFormAutoFillController autoFillFormType](self->_autoFillController, "autoFillFormType");
}

- (NSUUID)tabIDForAutoFill
{
  return self->_tabIDForAutoFill;
}

- (SFWebViewControllerDelegate)delegate
{
  return (SFWebViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (BOOL)didFirstVisuallyNonEmptyLayout
{
  return self->_didFirstVisuallyNonEmptyLayout;
}

- (WKWebViewConfiguration)webViewConfiguration
{
  return self->_webViewConfiguration;
}

- (SFDialogController)dialogController
{
  return self->_dialogController;
}

- (BOOL)didFirstPaint
{
  return self->_didFirstPaint;
}

- (BOOL)hasFocusedInputFieldOnCurrentPage
{
  return self->_hasFocusedInputFieldOnCurrentPage;
}

- (BOOL)hasFormControlInteraction
{
  return self->_hasFormControlInteraction;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_dialogController, 0);
  objc_storeStrong((id *)&self->_webViewConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tabIDForAutoFill, 0);
  objc_storeStrong((id *)&self->_contentBlockerManager, 0);
  objc_storeStrong((id *)&self->_permissionDialogThrottler, 0);
  objc_storeStrong((id *)&self->_domainWhereUserDeclinedAutomaticStrongPassword, 0);
  objc_storeStrong((id *)&self->_autoFillController, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

@end

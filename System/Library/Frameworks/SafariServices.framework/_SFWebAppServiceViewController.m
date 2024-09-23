@implementation _SFWebAppServiceViewController

+ (id)serviceViewControllers
{
  if (serviceViewControllers_once != -1)
    dispatch_once(&serviceViewControllers_once, &__block_literal_global_23);
  return (id)serviceViewControllers_serviceViewControllers;
}

+ (id)_remoteViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE769FB8);
}

+ (id)_exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE756508);
}

- (BOOL)_clientIsWebApp
{
  void *v2;
  char v3;

  -[_SFWebAppServiceViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("com.apple.webapp"));

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[BKSApplicationStateMonitor invalidate](self->_stateMonitor, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_SFWebAppServiceViewController;
  -[SFBrowserServiceViewController dealloc](&v3, sel_dealloc);
}

- (void)clearWebViewAndWebsiteDataWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  -[_SFBrowserContentViewController webView](self, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_SFBrowserContentViewController webView](self, "webView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopLoading");

    -[_SFBrowserContentViewController webViewController](self, "webViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "willMoveToParentViewController:", 0);
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    objc_msgSend(v7, "removeFromParentViewController");
  }
  -[_SFWebAppServiceViewController websiteDataStore](self, "websiteDataStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = *MEMORY[0x1E0DC4878];
  v10 = (void *)*MEMORY[0x1E0DC4730];
  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __75___SFWebAppServiceViewController_clearWebViewAndWebsiteDataWithCompletion___block_invoke;
  v20[3] = &unk_1E4AC2BB8;
  v12 = v4;
  v21 = v12;
  v22 = &v23;
  v13 = objc_msgSend(v10, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("com.apple.SafariViewService.deleteWebAppData"), v20);
  v24[3] = v13;
  objc_msgSend(v9, "_setCompletionHandlerForRemovalFromNetworkProcess:", &__block_literal_global_127);
  objc_msgSend(MEMORY[0x1E0CEF650], "safari_allDataTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __75___SFWebAppServiceViewController_clearWebViewAndWebsiteDataWithCompletion___block_invoke_130;
  v17[3] = &unk_1E4AC2BB8;
  v16 = v12;
  v18 = v16;
  v19 = &v23;
  objc_msgSend(v9, "removeDataOfTypes:modifiedSince:completionHandler:", v14, v15, v17);

  _Block_object_dispose(&v23, 8);
}

- (void)clearWebsiteDataWithWebClipIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  _SFWebAppServiceViewController *v8;
  _SFWebAppServiceViewController *v9;
  UIWebClip *v10;
  UIWebClip *webClip;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "serviceViewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v12);
  v8 = (_SFWebAppServiceViewController *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3F68], "webClipWithIdentifier:", v12);
    v10 = (UIWebClip *)objc_claimAutoreleasedReturnValue();
    webClip = self->_webClip;
    self->_webClip = v10;

    v9 = self;
  }
  -[_SFWebAppServiceViewController clearWebViewAndWebsiteDataWithCompletion:](v9, "clearWebViewAndWebsiteDataWithCompletion:", v6);

}

- (void)viewDidLoad
{
  UIView *v3;
  UIView *statusBarBackgroundView;
  void *v5;
  UIView *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SFWebAppServiceViewController;
  -[_SFWebAppServiceViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[SFBrowserServiceViewController setDisplayMode:](self, "setDisplayMode:", 2);
  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  statusBarBackgroundView = self->_statusBarBackgroundView;
  self->_statusBarBackgroundView = v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_statusBarBackgroundView, "setBackgroundColor:", v5);

  v6 = self->_statusBarBackgroundView;
  -[_SFBrowserContentViewController browserView](self, "browserView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStatusBarBackgroundView:", v6);

}

- (int64_t)preferredStatusBarStyle
{
  unint64_t v3;
  int64_t result;
  UIColor *themeColor;

  v3 = -[_SFBrowserContentViewController displayMode](self, "displayMode");
  result = 0;
  if (v3 <= 4 && ((1 << v3) & 0x16) != 0)
  {
    themeColor = self->_themeColor;
    if (themeColor)
    {
      if (-[UIColor safari_meetsThresholdForDarkAppearance](themeColor, "safari_meetsThresholdForDarkAppearance"))return 1;
      else
        return 3;
    }
    else
    {
      -[UIWebClip webClipStatusBarStyle](self->_webClip, "webClipStatusBarStyle");
      return UIStatusBarStyleFromUIWebClipStatusBarStyle();
    }
  }
  return result;
}

- (void)setNeedsStatusBarAppearanceUpdate
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v8;
  _QWORD v9[5];
  id v10;

  v3 = -[UIWebClip webClipStatusBarStyle](self->_webClip, "webClipStatusBarStyle");
  if (v3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_statusBarBackgroundView, "setBackgroundColor:", v4);

  }
  else
  {
    -[_SFWebAppServiceViewController _updateThemeColor](self, "_updateThemeColor");
    -[UIColor colorWithAlphaComponent:](self->_themeColor, "colorWithAlphaComponent:", 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      if (-[_SFWebAppServiceViewController preferredStatusBarStyle](self, "preferredStatusBarStyle"))
        objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)MEMORY[0x1E0DC3F10];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __67___SFWebAppServiceViewController_setNeedsStatusBarAppearanceUpdate__block_invoke;
    v9[3] = &unk_1E4ABFB20;
    v9[4] = self;
    v10 = v5;
    v7 = v5;
    objc_msgSend(v6, "_animateUsingDefaultTimingWithOptions:animations:completion:", 50331648, v9, 0);

  }
  -[_SFBrowserContentViewController setWebViewLayoutUnderlapsStatusBar:](self, "setWebViewLayoutUnderlapsStatusBar:", v3 == 2);
  v8.receiver = self;
  v8.super_class = (Class)_SFWebAppServiceViewController;
  -[_SFWebAppServiceViewController setNeedsStatusBarAppearanceUpdate](&v8, sel_setNeedsStatusBarAppearanceUpdate);
}

- (void)_hostApplicationDidEnterBackground
{
  void *v3;
  char v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SFWebAppServiceViewController;
  -[SFBrowserServiceViewController _hostApplicationDidEnterBackground](&v6, sel__hostApplicationDidEnterBackground);
  -[WKWebsiteDataStore httpCookieStore](self->_websiteDataStore, "httpCookieStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WKWebsiteDataStore httpCookieStore](self->_websiteDataStore, "httpCookieStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_flushCookiesToDiskWithCompletionHandler:", &__block_literal_global_142);

  }
}

- (void)webAppDidBecomeActive
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[_SFWebAppServiceViewController _showBlankViewWithAlertIfNeeded](self, "_showBlankViewWithAlertIfNeeded");
  if ((_SFMediaStateIconIsMuted() & 1) == 0)
  {
    -[_SFBrowserContentViewController webViewController](self, "webViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "webView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setPageMuted:", 0);

  }
  objc_msgSend(MEMORY[0x1E0D8A7C0], "sharedManager");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  -[UIWebClip identifier](self->_webClip, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebClip _sf_applicationManifest](self->_webClip, "_sf_applicationManifest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebClip _sf_applicationManifest](self->_webClip, "_sf_applicationManifest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "manifestId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "donateWebAppInFocusEventWithStarting:date:webAppType:identifier:name:manifestId:", 1, v5, 0, v6, v8, v11);

}

- (void)webAppWillResignActive
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  self->_mediaStateIconBeforeSuspension = -[_SFBrowserContentViewController mediaStateIcon](self, "mediaStateIcon");
  +[_SFWebAppMediaCaptureStatusBarManager sharedManager](_SFWebAppMediaCaptureStatusBarManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelStatusBarOverride");

  objc_msgSend(MEMORY[0x1E0D8A7C0], "sharedManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  -[UIWebClip identifier](self->_webClip, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebClip _sf_applicationManifest](self->_webClip, "_sf_applicationManifest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebClip _sf_applicationManifest](self->_webClip, "_sf_applicationManifest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "manifestId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "donateWebAppInFocusEventWithStarting:date:webAppType:identifier:name:manifestId:", 0, v4, 0, v5, v7, v10);

}

- (void)_showBlankViewWithAlertIfNeeded
{
  uint64_t v3;
  uint64_t v4;
  UIViewController *containingAlertController;
  UIViewController *v6;
  UIViewController *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIWebClip *webClip;
  UIAlertController *v15;
  UIAlertController *alertController;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[5];

  -[UIWebClip _reloadProperties](self->_webClip, "_reloadProperties");
  v3 = -[UIWebClip eligibilityStatus](self->_webClip, "eligibilityStatus");
  if (v3)
  {
    v4 = v3;
    containingAlertController = self->_containingAlertController;
    if (!containingAlertController)
    {
      v6 = (UIViewController *)objc_alloc_init(MEMORY[0x1E0DC3F20]);
      v7 = self->_containingAlertController;
      self->_containingAlertController = v6;

      -[UIViewController setModalPresentationStyle:](self->_containingAlertController, "setModalPresentationStyle:", 0);
      v8 = objc_alloc(MEMORY[0x1E0DC36B0]);
      objc_msgSend(MEMORY[0x1E0DC3698], "emptyConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithConfiguration:", v9);
      -[UIViewController setView:](self->_containingAlertController, "setView:", v10);

      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](self->_containingAlertController, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setBackgroundColor:", v11);

      containingAlertController = self->_containingAlertController;
    }
    -[UIViewController presentingViewController](containingAlertController, "presentingViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      -[_SFBrowserContentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_containingAlertController, 0, 0);
    if (!self->_alertController)
    {
      webClip = self->_webClip;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __65___SFWebAppServiceViewController__showBlankViewWithAlertIfNeeded__block_invoke;
      v21[3] = &unk_1E4AC05E0;
      v21[4] = self;
      -[UIWebClip eligibilityAlert:](webClip, "eligibilityAlert:", v21);
      v15 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
      alertController = self->_alertController;
      self->_alertController = v15;

    }
    if (v4 == 2)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIWebClip pageURL](self->_webClip, "pageURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __65___SFWebAppServiceViewController__showBlankViewWithAlertIfNeeded__block_invoke_3;
      v20[3] = &unk_1E4AC05E0;
      v20[4] = self;
      objc_msgSend(v18, "openURL:options:completionHandler:", v19, MEMORY[0x1E0C9AA70], v20);

    }
    else if (v4 == 1)
    {
      -[UIAlertController presentingViewController](self->_alertController, "presentingViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
        -[UIViewController presentViewController:animated:completion:](self->_containingAlertController, "presentViewController:animated:completion:", self->_alertController, 1, 0);
    }
  }
}

- (void)webViewController:(id)a3 requestNotificationPermissionForSecurityOrigin:(id)a4 decisionHandler:(id)a5
{
  void (**v6)(id, _QWORD);
  NSObject *v7;
  void *v8;
  NSObject *v9;
  UIWebClip *webClip;
  NSObject *v11;
  void *v12;
  void *v13;
  void (**v14)(id, _QWORD);
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a5;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXWebPush();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3B2D000, v7, OS_LOG_TYPE_DEFAULT, "requestNotificationPermissionForSecurityOrigin: Cannot get push placeholder bundle identifier from UIWebClip", buf, 2u);
    }
    v6[2](v6, 0);
  }
  -[UIWebClip placeholderBundleIdentifier](self->_webClip, "placeholderBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = WBS_LOG_CHANNEL_PREFIXWebPush();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    webClip = self->_webClip;
    v11 = v9;
    -[UIWebClip identifier](webClip, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v12;
    _os_log_impl(&dword_1A3B2D000, v11, OS_LOG_TYPE_DEFAULT, "Requesting push notification permission for Web Clip %{public}@", buf, 0xCu);

  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", v8);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __115___SFWebAppServiceViewController_webViewController_requestNotificationPermissionForSecurityOrigin_decisionHandler___block_invoke;
  v15[3] = &unk_1E4AC2C48;
  v16 = v6;
  v14 = v6;
  objc_msgSend(v13, "requestAuthorizationWithOptions:completionHandler:", 7, v15);

}

- (void)webViewController:(id)a3 updatedAppBadge:(id)a4 fromSecurityOrigin:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  char v11;
  NSObject *v12;
  _BOOL4 v13;
  UIWebClip *webClip;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  NSObject *v23;
  UIWebClip *v24;
  NSObject *v25;
  void *v26;
  int v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v20 = WBS_LOG_CHANNEL_PREFIXWebPush();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    LOWORD(v27) = 0;
    v21 = "Denied attempt to update app badge from a window object: Missing selector to verify script origin should be allowed";
    v22 = v20;
    goto LABEL_13;
  }
  -[UIWebClip pageURL](self->_webClip, "pageURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isSameSiteAsURL:", v9);

  if ((v10 & 1) != 0)
  {
    v11 = objc_opt_respondsToSelector();
    v12 = WBS_LOG_CHANNEL_PREFIXWebPush();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if ((v11 & 1) != 0)
    {
      if (v13)
      {
        webClip = self->_webClip;
        v15 = v12;
        -[UIWebClip identifier](webClip, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543875;
        v28 = v16;
        v29 = 2113;
        v30 = v8;
        v31 = 2112;
        v32 = v7;
        _os_log_impl(&dword_1A3B2D000, v15, OS_LOG_TYPE_DEFAULT, "Web Clip with identifier '%{public}@', script from origin %{private}@ updated app badge count to %@", (uint8_t *)&v27, 0x20u);

      }
      v17 = objc_alloc(MEMORY[0x1E0DC5B68]);
      -[UIWebClip placeholderBundleIdentifier](self->_webClip, "placeholderBundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "initWithBundleIdentifier:", v18);

      objc_msgSend(v19, "setBadgeValue:", v7);
      goto LABEL_14;
    }
    if (!v13)
      goto LABEL_14;
    LOWORD(v27) = 0;
    v21 = "Denied attempt to update app badge from a window object: Cannot get push placeholder bundle identifier from UIWebClip";
    v22 = v12;
LABEL_13:
    _os_log_impl(&dword_1A3B2D000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v27, 2u);
    goto LABEL_14;
  }
  v23 = WBS_LOG_CHANNEL_PREFIXWebPush();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = self->_webClip;
    v25 = v23;
    -[UIWebClip pageURL](v24, "pageURL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138478083;
    v28 = v8;
    v29 = 2117;
    v30 = v26;
    _os_log_impl(&dword_1A3B2D000, v25, OS_LOG_TYPE_DEFAULT, "Denied attempt to update app badge from a window object: Script origin %{private}@ is a different site from Web Clip page URL %{sensitive}@", (uint8_t *)&v27, 0x16u);

  }
LABEL_14:

}

- (void)webViewControllerDidChangeLoadingState:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SFWebAppServiceViewController;
  v4 = a3;
  -[_SFBrowserContentViewController webViewControllerDidChangeLoadingState:](&v7, sel_webViewControllerDidChangeLoadingState_, v4);
  -[_SFWebAppServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isLoading");

  objc_msgSend(v5, "didChangeLoadingState:", v6);
}

- (void)webViewControllerDidFirstVisuallyNonEmptyLayout:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SFWebAppServiceViewController;
  -[_SFBrowserContentViewController webViewControllerDidFirstVisuallyNonEmptyLayout:](&v5, sel_webViewControllerDidFirstVisuallyNonEmptyLayout_, a3);
  -[_SFWebAppServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didFinishInitialLoad:", 1);

}

- (void)webViewController:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  id v18;
  void (**v19)(_QWORD, _QWORD);
  void *v20;
  void *v21;
  _SFWebAppServiceViewController *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  objc_super v37;
  _QWORD v38[5];
  id v39;
  id v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v9, "navigationType");
  objc_msgSend(v9, "targetFrame");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v9, "targetFrame");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isMainFrame");

  }
  else
  {
    v16 = 1;
  }

  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __100___SFWebAppServiceViewController_webViewController_decidePolicyForNavigationAction_decisionHandler___block_invoke;
  v38[3] = &unk_1E4AC2C98;
  v38[4] = self;
  v17 = v12;
  v42 = v16;
  v39 = v17;
  v41 = v13;
  v18 = v10;
  v40 = v18;
  v19 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A8598C40](v38);
  objc_msgSend(v9, "request");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "valueForHTTPHeaderField:", CFSTR("Referer"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v8;
  v22 = self;
  if (v21)
  {
    v43 = *MEMORY[0x1E0CA5810];
    v44[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    v35 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "URLOverrideForURL:", v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "scheme");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scheme");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v25, "caseInsensitiveCompare:", v26);

  if (v27)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)v35;
    objc_msgSend(v28, "openURL:withOptions:", v24, v35);
  }
  else if (objc_msgSend(v17, "hasTelephonyScheme"))
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v17, "phoneNumber");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "telephonyURLWithDestinationID:promptUser:", v31, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)v35;
    objc_msgSend(v28, "openURL:withOptions:", v32, v35);

  }
  else
  {
    if ((objc_msgSend(v17, "isFaceTimeURL") & 1) == 0 && !objc_msgSend(v17, "isFaceTimeAudioURL"))
    {
      objc_msgSend(v9, "_sf_setAllowsExternalRedirectWithoutPrompting:", 1);
      v37.receiver = v22;
      v37.super_class = (Class)_SFWebAppServiceViewController;
      v34 = v36;
      -[_SFBrowserContentViewController webViewController:decidePolicyForNavigationAction:decisionHandler:](&v37, sel_webViewController_decidePolicyForNavigationAction_decisionHandler_, v36, v9, v18);
      v29 = (void *)v35;
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "faceTimePromptURLWithURL:", v17);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)v35;
    objc_msgSend(v28, "openURL:withOptions:", v33, v35);

  }
  v19[2](v19, 0);
  v34 = v36;
LABEL_15:

}

- (BOOL)_isURLOutOfManifestScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  v4 = a3;
  -[UIWebClip _sf_applicationManifest](self->_webClip, "_sf_applicationManifest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "scope");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (objc_msgSend(v4, "safari_hasSameOriginAsURL:", v7))
      {
        objc_msgSend(v4, "path");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "path");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "hasPrefix:", v9) ^ 1;

      }
      else
      {
        LOBYTE(v10) = 1;
      }
    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)_isURLOutOfLegacyScope:(id)a3 withLoginURLExempted:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a4;
  v6 = a3;
  -[UIWebClip _sf_applicationManifest](self->_webClip, "_sf_applicationManifest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    -[UIWebClip pageURL](self->_webClip, "pageURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safari_absoluteStringWithoutFragment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "safari_absoluteStringWithoutFragment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "safari_isVisualDuplicateOfURLString:", v10);
    LOBYTE(v8) = (v4 | v12) ^ 1;
    if (v4 && (v12 & 1) == 0)
    {
      if ((objc_msgSend(v11, "safari_looksLikeWillRedirectToURLStringAfterAuthentication:", v10) & 1) != 0)
      {
        LOBYTE(v8) = 0;
      }
      else
      {
        -[_SFBrowserContentViewController webViewController](self, "webViewController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "webView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "URL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "absoluteString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v11, "safari_looksLikeWillRedirectToURLStringAfterAuthentication:", v16) ^ 1;

      }
    }

  }
  return v8;
}

- (BOOL)_isURLOutOfScope:(id)a3 withLoginURLExempted:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  BOOL v7;

  v4 = a4;
  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (-[UIWebClip ignoreManifestScope](self->_webClip, "ignoreManifestScope") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v7 = -[_SFWebAppServiceViewController _isURLOutOfManifestScope:](self, "_isURLOutOfManifestScope:", v6)
      || -[_SFWebAppServiceViewController _isURLOutOfLegacyScope:withLoginURLExempted:](self, "_isURLOutOfLegacyScope:withLoginURLExempted:", v6, v4);
  }

  return v7;
}

- (void)webViewController:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SFWebAppServiceViewController;
  -[_SFBrowserContentViewController webViewController:didFailProvisionalNavigation:withError:](&v6, sel_webViewController_didFailProvisionalNavigation_withError_, a3, a4, a5);
  -[_SFWebAppServiceViewController _loadNextFallbackURL](self, "_loadNextFallbackURL");
}

- (void)webViewController:(id)a3 didFinishNavigation:(id)a4
{
  NSMutableArray *fallbackURLs;
  id v7;
  id v8;
  objc_super v9;

  fallbackURLs = self->_fallbackURLs;
  self->_fallbackURLs = 0;
  v7 = a4;
  v8 = a3;

  v9.receiver = self;
  v9.super_class = (Class)_SFWebAppServiceViewController;
  -[_SFBrowserContentViewController webViewController:didFinishNavigation:](&v9, sel_webViewController_didFinishNavigation_, v8, v7);

  -[_SFWebAppServiceViewController _fetchApplicationManifestIfNeeded](self, "_fetchApplicationManifestIfNeeded");
  -[_SFWebAppServiceViewController _updateDisplayMode](self, "_updateDisplayMode");
}

- (void)webViewControllerDidChangeURL:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFWebAppServiceViewController;
  -[_SFBrowserContentViewController webViewControllerDidChangeURL:](&v4, sel_webViewControllerDidChangeURL_, a3);
  -[_SFWebAppServiceViewController _updateDisplayMode](self, "_updateDisplayMode");
}

- (void)_updateDisplayMode
{
  id v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  BOOL v21;

  -[_SFBrowserContentViewController webViewController](self, "webViewController");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController rootWebViewController](self, "rootWebViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFBrowserContentViewController isShowingErrorPage](self, "isShowingErrorPage");
  v7 = -[_SFWebAppServiceViewController _isURLOutOfScope:withLoginURLExempted:](self, "_isURLOutOfScope:withLoginURLExempted:", v5, 0);
  v8 = v7;
  v9 = 2;
  if (v6)
    v9 = 3;
  if (v7)
    v10 = 0;
  else
    v10 = v9;
  -[SFBrowserServiceViewController setDisplayMode:](self, "setDisplayMode:", v10);
  if (v18 != v3 || v8 || v6)
  {
    if (v18 == v3)
    {
      objc_msgSend(v18, "webView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "backForwardList");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "backList");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __52___SFWebAppServiceViewController__updateDisplayMode__block_invoke;
      v19[3] = &unk_1E4AC2CC0;
      v19[4] = self;
      v21 = v6;
      v20 = v5;
      v15 = objc_msgSend(v14, "safari_containsObjectPassingTest:", v19);

      v11 = v15 ^ 1u;
    }
    else
    {
      v11 = 0;
    }
    -[_SFBrowserContentViewController browserView](self, "browserView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "navigationBar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setDismissButtonHidden:", v11);
  }

}

- (BOOL)canPrint
{
  return !-[_SFBrowserContentViewController isBlockedByScreenTime](self, "isBlockedByScreenTime");
}

- (id)websiteDataStoreConfigurationWithWebClipIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
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

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CEF738]);
  v6 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0DC3F68], "pathForWebClipStorageWithIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("Default"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setWebStorageDirectory:", v8);
  objc_msgSend(v5, "_setWebSQLDatabaseDirectory:", v8);
  objc_msgSend(v5, "_webSQLDatabaseDirectory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("___IndexedDB"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setIndexedDBDatabaseDirectory:", v11);

  v12 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v8, "URLByDeletingLastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("Cookies"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByAppendingPathComponent:", CFSTR("/Cookies.binarycookies"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fileURLWithPath:isDirectory:", v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setCookieStorageFile:", v17);

  objc_msgSend(v5, "_setResourceLoadStatisticsDirectory:", v8);
  objc_msgSend(v5, "setSourceApplicationBundleIdentifier:", CFSTR("com.apple.mobilesafari"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_SFWebAppServiceViewController _canonicalPageURL](self, "_canonicalPageURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStandaloneApplicationURL:", v18);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setAlternativeServicesStorageDirectory:", v8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setHSTSStorageDirectory:", v8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setGeneralStorageDirectory:", v9);
  objc_msgSend(v5, "_setCacheStorageDirectory:", v8);
  objc_msgSend(v5, "_setServiceWorkerRegistrationDirectory:", v8);
  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("NetworkCache"), 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNetworkCacheDirectory:", v19);

  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("OfflineWebApplicationCache"), 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setApplicationCacheDirectory:", v20);

  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("MediaCache"), 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMediaCacheDirectory:", v21);

  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("MediaKeys"), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMediaKeysStorageDirectory:", v22);

  objc_msgSend(v5, "setWebPushMachServiceName:", CFSTR("com.apple.webkit.webpushd.service"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setWebPushPartitionString:", v4);

  return v5;
}

- (id)createWebsiteDataStoreForWebClipIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0CEF650];
  -[_SFWebAppServiceViewController websiteDataStoreConfigurationWithWebClipIdentifier:](self, "websiteDataStoreConfigurationWithWebClipIdentifier:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_dataStoreWithConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "set_delegate:", self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = (void *)objc_opt_new();
    -[_SFWebAppServiceViewController setupPreferences:](self, "setupPreferences:", v7);
    objc_msgSend(v6, "_setServiceWorkerOverridePreferences:", v7);

  }
  -[UIWebClip _sf_stagedCookiesURL](self->_webClip, "_sf_stagedCookiesURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D8A890], "sharedController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "copyCookiesFromFolderAtURL:intoDataStore:", v8, v6);

  }
  return v6;
}

- (id)websiteDataStore
{
  WKWebsiteDataStore *websiteDataStore;
  void *v4;
  WKWebsiteDataStore *v5;
  WKWebsiteDataStore *v6;

  websiteDataStore = self->_websiteDataStore;
  if (!websiteDataStore)
  {
    -[UIWebClip identifier](self->_webClip, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFWebAppServiceViewController createWebsiteDataStoreForWebClipIdentifier:](self, "createWebsiteDataStoreForWebClipIdentifier:", v4);
    v5 = (WKWebsiteDataStore *)objc_claimAutoreleasedReturnValue();
    v6 = self->_websiteDataStore;
    self->_websiteDataStore = v5;

    websiteDataStore = self->_websiteDataStore;
  }
  return websiteDataStore;
}

- (void)setupPreferences:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "_setStandalone:", 1);
  objc_msgSend(v3, "_setNotificationsEnabled:", 1);
  objc_msgSend(v3, "_setPushAPIEnabled:", 1);
  objc_msgSend(v3, "_setNotificationEventEnabled:", 1);
  objc_msgSend(v3, "_setAppBadgeEnabled:", 1);

}

- (id)webViewConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SFWebAppServiceViewController;
  -[_SFBrowserContentViewController webViewConfiguration](&v8, sel_webViewConfiguration);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIgnoresViewportScaleLimits:", 0);
  objc_msgSend(v3, "preferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFWebAppServiceViewController setupPreferences:](self, "setupPreferences:", v4);

  -[_SFWebAppServiceViewController websiteDataStore](self, "websiteDataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWebsiteDataStore:", v5);

  -[UIWebClip _sf_applicationManifest](self->_webClip, "_sf_applicationManifest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setApplicationManifest:", v6);

  return v3;
}

- (void)_setCurrentWebViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_SFWebAppServiceViewController;
  -[_SFBrowserContentViewController _setCurrentWebViewController:](&v7, sel__setCurrentWebViewController_, v4);
  if (v4)
  {
    objc_msgSend(v4, "webView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsLinkPreview:", 0);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3658]), "initWithRed:green:blue:alpha:", 0.360784314, 0.388235294, 0.403921569, 1.0);
    objc_msgSend(v5, "setBackgroundColor:", v6);

    -[_SFWebAppServiceViewController _updateDisplayMode](self, "_updateDisplayMode");
  }

}

- (BOOL)_usesScrollToTopView
{
  return 1;
}

- (id)processPool
{
  WKProcessPool *processPool;
  WKProcessPool *v4;
  WKProcessPool *v5;

  processPool = self->_processPool;
  if (!processPool)
  {
    v4 = -[_SFBrowserContentViewController newProcessPool](self, "newProcessPool");
    v5 = self->_processPool;
    self->_processPool = v4;

    processPool = self->_processPool;
  }
  return processPool;
}

- (void)_initialLoadFinishedWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (!-[NSMutableArray count](self->_fallbackURLs, "count"))
  {
    v5.receiver = self;
    v5.super_class = (Class)_SFWebAppServiceViewController;
    -[_SFBrowserContentViewController _initialLoadFinishedWithSuccess:](&v5, sel__initialLoadFinishedWithSuccess_, v3);
  }
}

- (int64_t)_persona
{
  return 3;
}

- (void)navigationBarDoneButtonWasTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];

  v14 = a3;
  -[_SFBrowserContentViewController webViewController](self, "webViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserContentViewController rootWebViewController](self, "rootWebViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    objc_msgSend(v4, "webView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backForwardList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reverseObjectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __67___SFWebAppServiceViewController_navigationBarDoneButtonWasTapped___block_invoke;
    v15[3] = &unk_1E4AC2CE8;
    v15[4] = self;
    objc_msgSend(v10, "safari_firstObjectPassingTest:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v4, "webView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v12, "goToBackForwardListItem:", v11);

    }
    else
    {
      objc_msgSend(v14, "setDismissButtonHidden:", 1);
    }

  }
  else
  {
    -[_SFBrowserContentViewController _goBackToOwnerWebView](self, "_goBackToOwnerWebView");
  }

}

- (void)loadWebAppWithIdentifier:(id)a3
{
  id v4;
  UIWebClip *v5;
  UIWebClip *webClip;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  BKSApplicationStateMonitor *v21;
  BKSApplicationStateMonitor *stateMonitor;
  _QWORD v23[4];
  id v24;
  id location;
  void *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_SFWebAppServiceViewController _clientIsWebApp](self, "_clientIsWebApp"))
  {
    objc_initWeak(&location, self);
    -[_SFBrowserContentViewController setStoreBannersAreDisabled:](self, "setStoreBannersAreDisabled:", 1);
    objc_msgSend(MEMORY[0x1E0DC3F68], "webClipWithIdentifier:", v4);
    v5 = (UIWebClip *)objc_claimAutoreleasedReturnValue();
    webClip = self->_webClip;
    self->_webClip = v5;

    -[_SFWebAppServiceViewController _showBlankViewWithAlertIfNeeded](self, "_showBlankViewWithAlertIfNeeded");
    v7 = (void *)MEMORY[0x1E0C99D50];
    -[UIWebClip _sf_applicationManifestPath](self->_webClip, "_sf_applicationManifestPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataWithContentsOfURL:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIWebClip _sf_setApplicationManifest:](self->_webClip, "_sf_setApplicationManifest:", v10);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v11 = (id)WBS_LOG_CHANNEL_PREFIXWebApp();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = -[UIWebClip bundleVersion](self->_webClip, "bundleVersion");
        *(_DWORD *)buf = 138543618;
        v28 = v4;
        v29 = 2048;
        v30 = v12;
        _os_log_impl(&dword_1A3B2D000, v11, OS_LOG_TYPE_DEFAULT, "Loading UIWebClip with identifier '%{public}@'; version: %lu",
          buf,
          0x16u);
      }

    }
    else
    {
      v13 = WBS_LOG_CHANNEL_PREFIXWebApp();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v28 = v4;
        _os_log_impl(&dword_1A3B2D000, v13, OS_LOG_TYPE_DEFAULT, "Loading UIWebClip with identifier '%{public}@'; unable to get version information",
          buf,
          0xCu);
      }
    }
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (-[UIWebClip ensurePlaceholderBundle](self->_webClip, "ensurePlaceholderBundle") & 1) == 0)
    {
      v14 = WBS_LOG_CHANNEL_PREFIXWebApp();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[_SFWebAppServiceViewController loadWebAppWithIdentifier:].cold.1((uint64_t)v4, v14, v15);
    }
    -[_SFBrowserContentViewController setSafariDataSharingMode:](self, "setSafariDataSharingMode:", 2);
    -[UIWebClip pageURL](self->_webClip, "pageURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFWebAppServiceViewController _loadWebClipPageURL:](self, "_loadWebClipPageURL:", v16);

    objc_msgSend((id)objc_opt_class(), "serviceViewControllers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", self, v4);

    -[_SFWebAppServiceViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
    v18 = objc_alloc(MEMORY[0x1E0CFE2F0]);
    -[_SFWebAppServiceViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (BKSApplicationStateMonitor *)objc_msgSend(v18, "initWithBundleIDs:states:", v20, 40);
    stateMonitor = self->_stateMonitor;
    self->_stateMonitor = v21;

    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __59___SFWebAppServiceViewController_loadWebAppWithIdentifier___block_invoke;
    v23[3] = &unk_1E4AC1E08;
    objc_copyWeak(&v24, &location);
    -[BKSApplicationStateMonitor setHandler:](self->_stateMonitor, "setHandler:", v23);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

}

- (id)placeholderBundleIdentifierForDataStore:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "_webPushPartition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.WebKit.PushBundle.%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)notificationPermissionsForWebsiteDataStore:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  UIWebClip *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  id v34;
  NSObject *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  void *v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CEC7A0]);
  -[_SFWebAppServiceViewController placeholderBundleIdentifierForDataStore:](self, "placeholderBundleIdentifierForDataStore:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithBundleIdentifier:", v6);

  v8 = dispatch_semaphore_create(0);
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__2;
  v41 = __Block_byref_object_dispose__2;
  v42 = 0;
  dispatch_get_global_queue(33, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = __77___SFWebAppServiceViewController_notificationPermissionsForWebsiteDataStore___block_invoke;
  v33 = &unk_1E4AC2AB8;
  v10 = v7;
  v34 = v10;
  v36 = &v37;
  v11 = v8;
  v35 = v11;
  dispatch_async(v9, &v30);

  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  v12 = objc_msgSend((id)v38[5], "authorizationStatus", v30, v31, v32, v33);
  v13 = self->_webClip;
  -[UIWebClip identifier](v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_webPushPartition");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqualToString:", v15);

  if ((v16 & 1) == 0)
  {
    v17 = (void *)MEMORY[0x1E0DC3F68];
    objc_msgSend(v4, "_webPushPartition");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "webClipWithIdentifier:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v13 = (UIWebClip *)v19;
  }
  -[UIWebClip pageURL](v13, "pageURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "absoluteString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "scheme");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "length") == 0;

  if (v23)
  {
    objc_msgSend(v20, "safari_originalDataAsString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_web_bestURLForUserTypedString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "absoluteString");
    v26 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v26;
  }
  v43 = v21;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12 == 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v37, 8);
  return v28;
}

- (void)websiteDataStore:(id)a3 showNotification:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIWebClip *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = WBS_LOG_CHANNEL_PREFIXWebPush();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(v6, "_webPushPartition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v44 = v10;
    _os_log_impl(&dword_1A3B2D000, v9, OS_LOG_TYPE_DEFAULT, "About to show push notification with targetContentIdentifier %{public}@", buf, 0xCu);

  }
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setDefaultActionBundleIdentifier:", CFSTR("com.apple.webapp"));
  objc_msgSend(v6, "_webPushPartition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTargetContentIdentifier:", v12);

  objc_msgSend(v7, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:", v13);

  objc_msgSend(v7, "body");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBody:", v14);

  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v7, "alert") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CEC760], "defaultSound");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSound:", v15);

  }
  v16 = self->_webClip;
  -[UIWebClip identifier](v16, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_webPushPartition");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isEqualToString:", v18);

  if ((v19 & 1) == 0)
  {
    v20 = (void *)MEMORY[0x1E0DC3F68];
    objc_msgSend(v6, "_webPushPartition");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "webClipWithIdentifier:", v21);
    v22 = objc_claimAutoreleasedReturnValue();

    v16 = (UIWebClip *)v22;
  }
  -[UIWebClip title](v16, "title");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v23, "length"))
  {
    v24 = WBS_LOG_CHANNEL_PREFIXWebPush();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[_SFWebAppServiceViewController websiteDataStore:showNotification:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);
    objc_msgSend(v7, "origin");
    v32 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v32;
  }
  v33 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "stringWithFormat:", v34, v23);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSubtitle:", v35);

  objc_msgSend(v7, "userInfo");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUserInfo:", v36);

  -[_SFWebAppServiceViewController placeholderBundleIdentifierForDataStore:](self, "placeholderBundleIdentifierForDataStore:", v6);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC738], "iconForApplicationIdentifier:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIcon:", v38);

  v39 = (void *)MEMORY[0x1E0CEC740];
  objc_msgSend(v7, "identifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "requestWithIdentifier:content:trigger:", v40, v11, 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", v37);
  objc_msgSend(v42, "addNotificationRequest:withCompletionHandler:", v41, &__block_literal_global_245);

}

- (void)websiteDataStore:(id)a3 getDisplayedNotificationsForWorkerOrigin:(id)a4 completionHandler:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v7 = a5;
  -[_SFWebAppServiceViewController placeholderBundleIdentifierForDataStore:](self, "placeholderBundleIdentifierForDataStore:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", v8);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __110___SFWebAppServiceViewController_websiteDataStore_getDisplayedNotificationsForWorkerOrigin_completionHandler___block_invoke;
  v11[3] = &unk_1E4AC0B18;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "getDeliveredNotificationsWithCompletionHandler:", v11);

}

- (void)websiteDataStore:(id)a3 openWindow:(id)a4 fromServiceWorkerOrigin:(id)a5 completionHandler:(id)a6
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  __int16 v14[8];

  v8 = a4;
  v9 = (void (**)(id, void *))a6;
  if ((objc_msgSend(v8, "safari_isEligibleToBeOpenedByServiceWorkers") & 1) != 0)
  {
    -[_SFWebAppServiceViewController webViewConfiguration](self, "webViewConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFBrowserContentViewController _openNewWebViewIfNeededWithConfiguration:forNavigationAction:](self, "_openNewWebViewIfNeededWithConfiguration:forNavigationAction:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C92C80], "requestWithURL:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFBrowserContentViewController loadRequest:](self, "loadRequest:", v12);

    }
    v9[2](v9, v11);

  }
  else
  {
    v13 = WBS_LOG_CHANNEL_PREFIXWebPush();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14[0] = 0;
      _os_log_impl(&dword_1A3B2D000, v13, OS_LOG_TYPE_INFO, "Web push notification URL is ineligible to be opened", (uint8_t *)v14, 2u);
    }
    v9[2](v9, 0);
  }

}

- (void)websiteDataStore:(id)a3 workerOrigin:(id)a4 updatedAppBadge:(id)a5
{
  id v8;
  id v9;
  id v10;
  UIWebClip *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  char v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  int v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = self->_webClip;
    -[UIWebClip identifier](v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_webPushPartition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    if ((v14 & 1) == 0)
    {
      v15 = (void *)MEMORY[0x1E0DC3F68];
      objc_msgSend(v8, "_webPushPartition");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "webClipWithIdentifier:", v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v11 = (UIWebClip *)v17;
    }
    -[UIWebClip pageURL](v11, "pageURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v9, "isSameSiteAsURL:", v18);

    if ((v19 & 1) != 0)
    {
      v20 = objc_opt_respondsToSelector();
      v21 = WBS_LOG_CHANNEL_PREFIXWebPush();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      if ((v20 & 1) != 0)
      {
        if (v22)
        {
          v23 = v21;
          objc_msgSend(v8, "_webPushPartition");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 138412803;
          v33 = v24;
          v34 = 2113;
          v35 = v9;
          v36 = 2112;
          v37 = v10;
          _os_log_impl(&dword_1A3B2D000, v23, OS_LOG_TYPE_DEFAULT, "Web clip with identifier '%@' worker from origin %{private}@ updated app badge count to %@", (uint8_t *)&v32, 0x20u);

        }
        v25 = objc_alloc(MEMORY[0x1E0DC5B68]);
        -[UIWebClip placeholderBundleIdentifier](v11, "placeholderBundleIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v25, "initWithBundleIdentifier:", v26);

        objc_msgSend(v27, "setBadgeValue:", v10);
      }
      else if (v22)
      {
        LOWORD(v32) = 0;
        _os_log_impl(&dword_1A3B2D000, v21, OS_LOG_TYPE_DEFAULT, "Denied attempt to update app badge from a worker: Cannot get push placeholder bundle identifier from UIWebClip", (uint8_t *)&v32, 2u);
      }
    }
    else
    {
      v29 = WBS_LOG_CHANNEL_PREFIXWebPush();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = v29;
        -[UIWebClip pageURL](v11, "pageURL");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138478083;
        v33 = v9;
        v34 = 2117;
        v35 = v31;
        _os_log_impl(&dword_1A3B2D000, v30, OS_LOG_TYPE_DEFAULT, "Denied attempt to update app badge from a worker: Worker origin %{private}@ is a different site from Web Clip page URL %{sensitive}@", (uint8_t *)&v32, 0x16u);

      }
    }

  }
  else
  {
    v28 = WBS_LOG_CHANNEL_PREFIXWebPush();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      _os_log_impl(&dword_1A3B2D000, v28, OS_LOG_TYPE_DEFAULT, "Denied attempt to update app badge from a worker: Missing selector to verify worker script origin should be allowed", (uint8_t *)&v32, 2u);
    }
  }

}

- (void)processWebPushForWebAppWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  _SFWebAppServiceViewController *v18;
  _QWORD block[6];
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s for %@"), "-[_SFWebAppServiceViewController processWebPushForWebAppWithIdentifier:]", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0DC4730];
  v7 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __72___SFWebAppServiceViewController_processWebPushForWebAppWithIdentifier___block_invoke;
  v23[3] = &unk_1E4ABFE00;
  v8 = v4;
  v24 = v8;
  v9 = objc_msgSend(v6, "beginBackgroundTaskWithName:expirationHandler:", v5, v23);
  v10 = WBS_LOG_CHANNEL_PREFIXWebPush();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v8;
    _os_log_impl(&dword_1A3B2D000, v10, OS_LOG_TYPE_DEFAULT, "Processing push for Web clip with identifier: '%@'", buf, 0xCu);
  }
  if (self->_webClip)
  {
    -[_SFWebAppServiceViewController websiteDataStore](self, "websiteDataStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v11, "_webPushPartition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", v8);

  if ((v13 & 1) == 0)
  {
    -[_SFWebAppServiceViewController createWebsiteDataStoreForWebClipIdentifier:](self, "createWebsiteDataStoreForWebClipIdentifier:", v8);
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v14;
  }
  v15 = dispatch_group_create();
  dispatch_group_enter(v15);
  v20[0] = v7;
  v20[1] = 3221225472;
  v20[2] = __72___SFWebAppServiceViewController_processWebPushForWebAppWithIdentifier___block_invoke_251;
  v20[3] = &unk_1E4AC00B0;
  v21 = v15;
  v22 = v11;
  v16 = v11;
  v17 = v15;
  objc_msgSend(v16, "_getPendingPushMessages:", v20);
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __72___SFWebAppServiceViewController_processWebPushForWebAppWithIdentifier___block_invoke_257;
  block[3] = &unk_1E4ABFBC0;
  block[4] = self;
  block[5] = v9;
  v18 = self;
  dispatch_group_notify(v17, MEMORY[0x1E0C80D38], block);

}

- (void)handlePushNotificationActivation:(id)a3
{
  UIWebClip *webClip;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _SFWebAppServiceViewController *v16;
  _QWORD block[6];
  _QWORD v18[4];
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  webClip = self->_webClip;
  v5 = a3;
  -[UIWebClip identifier](webClip, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s for %@"), "-[_SFWebAppServiceViewController handlePushNotificationActivation:]", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)*MEMORY[0x1E0DC4730];
  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __67___SFWebAppServiceViewController_handlePushNotificationActivation___block_invoke;
  v20[3] = &unk_1E4ABFE00;
  v10 = v6;
  v21 = v10;
  v11 = objc_msgSend(v8, "beginBackgroundTaskWithName:expirationHandler:", v7, v20);
  v12 = WBS_LOG_CHANNEL_PREFIXWebPush();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v10;
    _os_log_impl(&dword_1A3B2D000, v12, OS_LOG_TYPE_DEFAULT, "Processing push notification activation for Web clip with identifier: '%@'", buf, 0xCu);
  }
  v13 = dispatch_group_create();
  dispatch_group_enter(v13);
  -[_SFWebAppServiceViewController websiteDataStore](self, "websiteDataStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __67___SFWebAppServiceViewController_handlePushNotificationActivation___block_invoke_258;
  v18[3] = &unk_1E4AC05E0;
  v19 = v13;
  v15 = v13;
  objc_msgSend(v14, "_processPersistentNotificationClick:completionHandler:", v5, v18);

  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __67___SFWebAppServiceViewController_handlePushNotificationActivation___block_invoke_259;
  block[3] = &unk_1E4ABFBC0;
  block[4] = self;
  block[5] = v11;
  v16 = self;
  dispatch_group_notify(v15, MEMORY[0x1E0C80D38], block);

}

- (void)_handleHostStateUpdate:(id)a3
{
  void *v4;
  unsigned int v5;
  unsigned int hostState;
  void *v9;
  void *v10;
  const __CFString *v11;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CFE2C0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntValue");

  hostState = self->_hostState;
  if (v5 == 8 && hostState != 8)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = CFSTR("_UIViewServiceHostWillEnterForegroundNotification");
LABEL_11:
    objc_msgSend(v9, "postNotificationName:object:", v11, self);

    goto LABEL_12;
  }
  if (v5 == 32 && hostState != 32)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = CFSTR("_UIViewServiceHostDidEnterBackgroundNotification");
    goto LABEL_11;
  }
LABEL_12:
  self->_hostState = v5;
}

- (id)_canonicalPageURL
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[UIWebClip pageURL](self->_webClip, "pageURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(v2, "safari_originalDataAsString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_web_bestURLForUserTypedString");
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v5;
  }
  objc_msgSend(v2, "_webkit_canonicalize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_loadWebClipPageURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[_SFBrowserContentViewController browserView](self, "browserView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentReadyForDisplay");

  objc_msgSend(v11, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v11, "_webkit_canonicalize");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFBrowserServiceViewController loadURL:](self, "loadURL:", v6);
  }
  else
  {
    objc_msgSend(v11, "safari_originalDataAsString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_web_possibleURLsForUserTypedString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v8, "mutableCopy");

    if (objc_msgSend(v6, "count"))
    {
      if ((unint64_t)objc_msgSend(v6, "count") >= 2)
      {
        objc_msgSend(v6, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v9);

      }
      objc_storeStrong((id *)&self->_fallbackURLs, v6);
      -[_SFWebAppServiceViewController _loadNextFallbackURL](self, "_loadNextFallbackURL");
    }
    else
    {
      objc_msgSend(v11, "_webkit_canonicalize");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFBrowserServiceViewController loadURL:](self, "loadURL:", v10);

    }
  }

}

- (void)_loadNextFallbackURL
{
  id v3;

  -[NSMutableArray firstObject](self->_fallbackURLs, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_fallbackURLs, "removeObjectAtIndex:", 0);
    -[SFBrowserServiceViewController loadURL:](self, "loadURL:", v3);
  }

}

- (BOOL)canOverrideStatusBar
{
  return -[_SFBrowserContentViewController displayMode](self, "displayMode") != 0;
}

- (void)setMediaStateIcon:(unint64_t)a3
{
  BOOL v5;
  _BOOL4 v6;
  unint64_t v7;
  void *v8;
  objc_super v9;

  if (-[_SFBrowserContentViewController mediaStateIcon](self, "mediaStateIcon") != a3)
  {
    if (-[_SFBrowserContentViewController mediaStateIcon](self, "mediaStateIcon") == 1)
    {
      v5 = a3 - 1 < 2;
      v6 = 1;
    }
    else
    {
      v7 = -[_SFBrowserContentViewController mediaStateIcon](self, "mediaStateIcon");
      v5 = a3 - 1 < 2;
      v6 = v7 == 2;
      if (v7 != 2 && a3 - 1 <= 1)
      {
        +[_SFWebAppMediaCaptureStatusBarManager sharedManager](_SFWebAppMediaCaptureStatusBarManager, "sharedManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "recordingDocumentDidBeginMediaCapture:audioOnly:", self, a3 == 1);
        goto LABEL_10;
      }
    }
    if (v5 || !v6)
      goto LABEL_11;
    +[_SFWebAppMediaCaptureStatusBarManager sharedManager](_SFWebAppMediaCaptureStatusBarManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recordingDocumentDidEndMediaCapture:", self);
LABEL_10:

LABEL_11:
    v9.receiver = self;
    v9.super_class = (Class)_SFWebAppServiceViewController;
    -[_SFBrowserContentViewController setMediaStateIcon:](&v9, sel_setMediaStateIcon_, a3);
  }
}

- (NSString)URLString
{
  void *v2;
  void *v3;
  void *v4;

  -[_SFBrowserContentViewController webView](self, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)muteMediaCapture
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v6;

  -[_SFBrowserContentViewController mediaStateIcon](self, "mediaStateIcon");
  if ((_SFMediaStateIconIsMuted() & 1) == 0)
  {
    -[_SFBrowserContentViewController webViewController](self, "webViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "webView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setPageMuted:", 2);

    -[_SFBrowserContentViewController mediaStateIcon](self, "mediaStateIcon");
    v5 = _SFMediaStateIconMutedVariant();
    v6.receiver = self;
    v6.super_class = (Class)_SFWebAppServiceViewController;
    -[_SFBrowserContentViewController setMediaStateIcon:](&v6, sel_setMediaStateIcon_, v5);
  }
}

- (BOOL)audioOnly
{
  return -[_SFBrowserContentViewController mediaStateIcon](self, "mediaStateIcon") == 1;
}

- (void)statusBarIndicatorTappedWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _SFWebAppServiceViewController *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  v17 = self;
  -[_SFBrowserContentViewController mediaStateIcon](self, "mediaStateIcon");
  _WBSLocalizedString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v16, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __80___SFWebAppServiceViewController_statusBarIndicatorTappedWithCompletionHandler___block_invoke;
  v20[3] = &unk_1E4AC01E0;
  v10 = v4;
  v21 = v10;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v11);

  v12 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __80___SFWebAppServiceViewController_statusBarIndicatorTappedWithCompletionHandler___block_invoke_2;
  v18[3] = &unk_1E4AC01E0;
  v19 = v10;
  v14 = v10;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v15);

  -[_SFBrowserContentViewController presentViewController:animated:completion:](v17, "presentViewController:animated:completion:", v6, 1, 0);
}

- (void)_fetchApplicationManifestIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  WBSApplicationManifestFetcher *v7;
  WBSApplicationManifestFetcher *applicationManifestFetcher;
  WBSApplicationManifestFetcher *v9;
  uint64_t v10;
  _SFInjectedJavaScriptController *v11;
  void *v12;
  void *v13;
  _SFInjectedJavaScriptController *v14;
  _SFInjectedJavaScriptController *activityJSController;
  _SFWebClipMetadataFetcher *v16;
  _SFWebClipMetadataFetcher *webClipMetadataFetcher;
  _SFWebClipMetadataFetcher *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  -[UIWebClip _sf_applicationManifest](self->_webClip, "_sf_applicationManifest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else if (!self->_applicationManifestFetcher)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc(MEMORY[0x1E0D8A770]);
    -[_SFBrowserContentViewController webViewController](self, "webViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "webView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (WBSApplicationManifestFetcher *)objc_msgSend(v4, "initWithWebView:", v6);
    applicationManifestFetcher = self->_applicationManifestFetcher;
    self->_applicationManifestFetcher = v7;

    v9 = self->_applicationManifestFetcher;
    v10 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __67___SFWebAppServiceViewController__fetchApplicationManifestIfNeeded__block_invoke;
    v21[3] = &unk_1E4AC2D80;
    objc_copyWeak(&v22, &location);
    -[WBSApplicationManifestFetcher getApplicationManifestWithCompletionHandler:](v9, "getApplicationManifestWithCompletionHandler:", v21);
    if (!-[UIWebClip webClipStatusBarStyle](self->_webClip, "webClipStatusBarStyle")
      && !self->_activityJSController
      && !self->_webClipMetadataFetcher)
    {
      v11 = [_SFInjectedJavaScriptController alloc];
      -[_SFBrowserContentViewController webViewController](self, "webViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "webView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[_SFInjectedJavaScriptController initWithWebView:](v11, "initWithWebView:", v13);
      activityJSController = self->_activityJSController;
      self->_activityJSController = v14;

      v16 = -[_SFWebClipMetadataFetcher initWithInjectedJavascriptController:]([_SFWebClipMetadataFetcher alloc], "initWithInjectedJavascriptController:", self->_activityJSController);
      webClipMetadataFetcher = self->_webClipMetadataFetcher;
      self->_webClipMetadataFetcher = v16;

      v18 = self->_webClipMetadataFetcher;
      v19[0] = v10;
      v19[1] = 3221225472;
      v19[2] = __67___SFWebAppServiceViewController__fetchApplicationManifestIfNeeded__block_invoke_2;
      v19[3] = &unk_1E4AC2DA8;
      objc_copyWeak(&v20, &location);
      -[_SFWebClipMetadataFetcher fetchMetadataWithConsumer:](v18, "fetchMetadataWithConsumer:", v19);
      objc_destroyWeak(&v20);
    }
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

- (void)_updateThemeColor
{
  id v3;
  int64_t v4;
  void *themeColor;
  void *v6;
  void *v7;
  _QWORD v8[5];

  if (!self->_updatingThemeColor)
  {
    self->_updatingThemeColor = 1;
    v3 = objc_alloc_init(MEMORY[0x1E0D8AC10]);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51___SFWebAppServiceViewController__updateThemeColor__block_invoke;
    v8[3] = &unk_1E4ABFE00;
    v8[4] = self;
    objc_msgSend(v3, "setHandler:", v8);
    v4 = -[_SFBrowserContentViewController displayMode](self, "displayMode");
    if (v4 != 3 && v4)
    {
      -[_SFBrowserContentViewController webViewController](self, "webViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "webView");
      themeColor = (void *)objc_claimAutoreleasedReturnValue();

      if (themeColor)
      {
        objc_msgSend(MEMORY[0x1E0D8AD30], "updateThemeColorForWebView:darkModeEnabled:allowFallbackColors:updateUnderPageBackgroundColor:", themeColor, 0, 0, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }
      objc_storeStrong((id *)&self->_themeColor, v7);
      if (themeColor)

    }
    else
    {
      themeColor = self->_themeColor;
      self->_themeColor = 0;
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containingAlertController, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_themeColor, 0);
  objc_storeStrong((id *)&self->_webClipMetadataFetcher, 0);
  objc_storeStrong((id *)&self->_activityJSController, 0);
  objc_storeStrong((id *)&self->_applicationManifestFetcher, 0);
  objc_storeStrong((id *)&self->_stateMonitor, 0);
  objc_storeStrong((id *)&self->_fallbackURLs, 0);
  objc_storeStrong((id *)&self->_websiteDataStore, 0);
  objc_storeStrong((id *)&self->_processPool, 0);
  objc_storeStrong((id *)&self->_statusBarBackgroundView, 0);
  objc_storeStrong((id *)&self->_webClip, 0);
}

- (void)loadWebAppWithIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_1_2(&dword_1A3B2D000, a2, a3, "Fail to create placeholder bundle for UIWebClip with identifier: '%{public}@'.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3_2();
}

- (void)websiteDataStore:(uint64_t)a3 showNotification:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, a1, a3, "Web App title for notification source is empty. Falling back to notification source URL", a5, a6, a7, a8, 0);
}

@end

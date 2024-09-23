@implementation SFAddToHomeScreenViewController

- (SFAddToHomeScreenViewController)initWithWebView:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  SFAddToHomeScreenViewController *v9;
  uint64_t v10;
  NSURL *initialURL;
  uint64_t v12;
  id completionHandler;
  SFWebAppDataProvider *v14;
  SFWebAppDataProvider *provider;
  WKWebView *webView;
  SFAddToHomeScreenViewController *v17;
  SFAddToHomeScreenViewController *v18;
  _QWORD v20[4];
  SFAddToHomeScreenViewController *v21;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SFAddToHomeScreenViewController;
  v9 = -[SFAddToHomeScreenViewController init](&v22, sel_init);
  if (v9)
  {
    objc_msgSend(v7, "URL");
    v10 = objc_claimAutoreleasedReturnValue();
    initialURL = v9->_initialURL;
    v9->_initialURL = (NSURL *)v10;

    objc_storeStrong((id *)&v9->_webView, a3);
    v12 = MEMORY[0x1A8598C40](v8);
    completionHandler = v9->_completionHandler;
    v9->_completionHandler = (id)v12;

    if ((objc_msgSend(MEMORY[0x1E0CB34D0], "safari_isSafariViewServiceBundle") & 1) != 0)
    {
      v14 = objc_alloc_init(SFWebAppDataProvider);
      provider = v9->_provider;
      v9->_provider = v14;

      -[SFWebAppDataProvider setDelegate:](v9->_provider, "setDelegate:", v9);
    }
    else
    {
      -[SFAddToHomeScreenViewController _initializeViewService](v9, "_initializeViewService");
    }
    webView = v9->_webView;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __62__SFAddToHomeScreenViewController_initWithWebView_completion___block_invoke;
    v20[3] = &unk_1E4AC4860;
    v17 = v9;
    v21 = v17;
    -[WKWebView _getApplicationManifestWithCompletionHandler:](webView, "_getApplicationManifestWithCompletionHandler:", v20);
    v18 = v17;

  }
  return v9;
}

void __62__SFAddToHomeScreenViewController_initWithWebView_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1008), a2);
  v4 = (void *)objc_opt_new();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(v6 + 1008);
  if (v7)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("Manifest"));
    v6 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v6 + 1000), "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("PageTitle"));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("PageURL"));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "themeColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "themeColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("PageThemeColor"));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "underPageBackgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "underPageBackgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("UnderPageBackgroundColor"));

  }
  v16 = objc_msgSend(MEMORY[0x1E0CB34D0], "safari_isSafariViewServiceBundle");
  v17 = *(_QWORD *)(a1 + 32);
  if ((v16 & 1) != 0)
  {
    objc_msgSend(*(id *)(v17 + 1032), "prepareWithManifestData:", v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "activityViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addChildViewController:", v18);
    objc_msgSend(v18, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v19);

    objc_msgSend(*(id *)(a1 + 32), "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    objc_msgSend(v19, "setFrame:");

    objc_msgSend(v19, "setAutoresizingMask:", 18);
  }
  else
  {
    objc_msgSend(*(id *)(v17 + 984), "didFetchManifestData:", v5);
  }
  objc_msgSend(*(id *)(a1 + 32), "_fetchWebClipMetadataViaJavaScript");

}

- (SFAddToHomeScreenViewController)initWithAddToHomeScreenActivityItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  SFAddToHomeScreenViewController *v8;
  uint64_t v9;
  id completionHandler;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  SFAddToHomeScreenViewController *v15;
  void (**v16)(_QWORD, _QWORD);
  void *v17;
  uint64_t v18;
  id v19;
  SFAddToHomeScreenViewController *v20;
  _QWORD v22[4];
  id v23;
  SFAddToHomeScreenViewController *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  void (**v28)(_QWORD, _QWORD);
  _QWORD v29[4];
  SFAddToHomeScreenViewController *v30;
  objc_super v31;

  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)SFAddToHomeScreenViewController;
  v8 = -[SFAddToHomeScreenViewController init](&v31, sel_init);
  if (v8)
  {
    v9 = MEMORY[0x1A8598C40](v7);
    completionHandler = v8->_completionHandler;
    v8->_completionHandler = (id)v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("PageTitle"));

    objc_msgSend(v6, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("PageURL"));

    -[SFAddToHomeScreenViewController _initializeViewService](v8, "_initializeViewService");
    v14 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __82__SFAddToHomeScreenViewController_initWithAddToHomeScreenActivityItem_completion___block_invoke;
    v29[3] = &unk_1E4AC4888;
    v15 = v8;
    v30 = v15;
    v16 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A8598C40](v29);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v25[0] = v14;
      v25[1] = 3221225472;
      v25[2] = __82__SFAddToHomeScreenViewController_initWithAddToHomeScreenActivityItem_completion___block_invoke_2;
      v25[3] = &unk_1E4AC48D8;
      v26 = v6;
      v27 = v11;
      v28 = v16;
      objc_msgSend(v26, "getWebAppManifestWithCompletionHandler:", v25);

    }
    else
    {
      ((void (**)(_QWORD, void *))v16)[2](v16, v11);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "iconItemProvider");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 && objc_msgSend(v17, "canLoadObjectOfClass:", objc_opt_class()))
      {
        v18 = objc_opt_class();
        v22[0] = v14;
        v22[1] = 3221225472;
        v22[2] = __82__SFAddToHomeScreenViewController_initWithAddToHomeScreenActivityItem_completion___block_invoke_11;
        v22[3] = &unk_1E4AC4900;
        v23 = v6;
        v24 = v15;
        v19 = (id)objc_msgSend(v17, "loadObjectOfClass:completionHandler:", v18, v22);

      }
    }
    v20 = v15;

  }
  return v8;
}

uint64_t __82__SFAddToHomeScreenViewController_initWithAddToHomeScreenActivityItem_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "didFetchManifestData:", a2);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "didFetchWebClipMetadata:", 0);
}

void __82__SFAddToHomeScreenViewController_initWithAddToHomeScreenActivityItem_completion___block_invoke_2(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__SFAddToHomeScreenViewController_initWithAddToHomeScreenActivityItem_completion___block_invoke_3;
  v5[3] = &unk_1E4AC48B0;
  v6 = v3;
  v7 = a1[4];
  v8 = a1[5];
  v9 = a1[6];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __82__SFAddToHomeScreenViewController_initWithAddToHomeScreenActivityItem_completion___block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v10[16];
  uint8_t buf[16];

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = objc_alloc(MEMORY[0x1E0CEF688]);
    objc_msgSend(*(id *)(a1 + 32), "jsonData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "manifestURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v2, "initWithJSONData:manifestURL:documentURL:", v3, v4, v5);

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v6, CFSTR("Manifest"));
    }
    else
    {
      v8 = WBS_LOG_CHANNEL_PREFIXWebApp();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3B2D000, v8, OS_LOG_TYPE_DEFAULT, "Could not create _WKApplicationManifest.", buf, 2u);
      }
    }

  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXWebApp();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A3B2D000, v7, OS_LOG_TYPE_DEFAULT, "BEWebAppManifest was nil. Cannot apply to web clip.", v10, 2u);
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __82__SFAddToHomeScreenViewController_initWithAddToHomeScreenActivityItem_completion___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 984), "didReceiveWebClipIcon:", v5);
  }
  else if (v6)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXWebApp();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __82__SFAddToHomeScreenViewController_initWithAddToHomeScreenActivityItem_completion___block_invoke_11_cold_1(a1, v8, v7);
  }

}

- (id)_stagedCookiesDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "temporaryDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("StagedCookies"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_removeStageCookiesDirectoryIfNeeded
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v4 = a2;
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_1A3B2D000, v6, v7, "Failed to clean up staged cookies, URL: %@, error: %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_0_1();
}

- (id)_issueReadOnlySandboxExtensionForURL:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;

  objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  v3 = sandbox_extension_issue_file();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    free(v4);
  }
  else
  {
    v6 = WBS_LOG_CHANNEL_PREFIXWebApp();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SFAddToHomeScreenViewController _issueReadOnlySandboxExtensionForURL:].cold.1(v6);
    v5 = 0;
  }
  return v5;
}

- (void)_copyCurrentCookiesToStagingDirectory
{
  void *v3;
  void *v4;
  WKWebView *webView;
  id v6;
  _QWORD v7[5];
  id v8;

  -[SFAddToHomeScreenViewController _removeStageCookiesDirectoryIfNeeded](self, "_removeStageCookiesDirectoryIfNeeded");
  -[SFAddToHomeScreenViewController _stagedCookiesDirectoryURL](self, "_stagedCookiesDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D8A890], "sharedController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  webView = self->_webView;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__SFAddToHomeScreenViewController__copyCurrentCookiesToStagingDirectory__block_invoke;
  v7[3] = &unk_1E4AC15B8;
  v7[4] = self;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "copyCookiesFromWebView:intoFolderAtURL:completionHandler:", webView, v6, v7);

}

void __72__SFAddToHomeScreenViewController__copyCurrentCookiesToStagingDirectory__block_invoke(uint64_t a1, char a2)
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_issueReadOnlySandboxExtensionForURL:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v8 = v3;
      v4 = objc_msgSend(MEMORY[0x1E0CB34D0], "safari_isSafariViewServiceBundle");
      v6 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      if ((v4 & 1) != 0)
        objc_msgSend(*(id *)(v6 + 1032), "updateWithStagedCookiesDirectoryURL:sandboxExtensionToken:", v5, v8);
      else
        objc_msgSend(*(id *)(v6 + 984), "didCopyStagedCookiesToURL:sandboxExtensionToken:", v5, v8);
      v3 = v8;
    }

  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXWebApp();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __72__SFAddToHomeScreenViewController__copyCurrentCookiesToStagingDirectory__block_invoke_cold_1(v7);
  }
}

- (void)_fetchWebClipMetadataViaJavaScript
{
  void *v3;
  void *v4;
  WKWebView *webView;
  void *v6;
  _QWORD v7[5];

  +[_SFWebClipMetadataFetcher metadataFetcherScriptSource](_SFWebClipMetadataFetcher, "metadataFetcherScriptSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("return WebClipMetadataFinderJS.webClipMetadata();"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  webView = self->_webView;
  objc_msgSend(MEMORY[0x1E0CEF5E0], "worldWithName:", CFSTR("WebClipMetadataFetcherWorld"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__SFAddToHomeScreenViewController__fetchWebClipMetadataViaJavaScript__block_invoke;
  v7[3] = &unk_1E4AC4928;
  v7[4] = self;
  -[WKWebView callAsyncJavaScript:arguments:inFrame:inContentWorld:completionHandler:](webView, "callAsyncJavaScript:arguments:inFrame:inContentWorld:completionHandler:", v4, 0, 0, v6, v7);

}

void __69__SFAddToHomeScreenViewController__fetchWebClipMetadataViaJavaScript__block_invoke(uint64_t a1, void *a2, void *a3)
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
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXViewService();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __69__SFAddToHomeScreenViewController__fetchWebClipMetadataViaJavaScript__block_invoke_cold_1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
    v15 = objc_msgSend(MEMORY[0x1E0CB34D0], "safari_isSafariViewServiceBundle");
    v16 = *(_QWORD *)(a1 + 32);
    if ((v15 & 1) != 0)
      objc_msgSend(*(id *)(v16 + 1032), "updateWithWebClipMetadata:", MEMORY[0x1E0C9AA70]);
    else
      objc_msgSend(*(id *)(v16 + 984), "didFetchWebClipMetadata:", 0);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1016), a2);
    v17 = (void *)objc_opt_new();
    v18 = v17;
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1016);
    if (v19)
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("MetaAndLinkTags"));
    v20 = objc_msgSend(MEMORY[0x1E0CB34D0], "safari_isSafariViewServiceBundle");
    v21 = *(_QWORD *)(a1 + 32);
    if ((v20 & 1) != 0)
      objc_msgSend(*(id *)(v21 + 1032), "updateWithWebClipMetadata:", v18);
    else
      objc_msgSend(*(id *)(v21 + 984), "didFetchWebClipMetadata:", v18);
    objc_msgSend(*(id *)(a1 + 32), "_copyCurrentCookiesToStagingDirectory");

  }
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFAddToHomeScreenViewController;
  -[SFAddToHomeScreenViewController loadView](&v3, sel_loadView);
  -[SFAddToHomeScreenViewController _addPlaceholderView](self, "_addPlaceholderView");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFAddToHomeScreenViewController;
  -[SFAddToHomeScreenViewController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAddToHomeScreenViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (void)_initializeViewService
{
  SFQueueingServiceViewControllerProxy *v3;
  SFAddToHomeScreenServiceProtocol *serviceProxy;

  if (!self->_serviceProxy)
  {
    v3 = -[SFQueueingServiceViewControllerProxy initWithProtocol:]([SFQueueingServiceViewControllerProxy alloc], "initWithProtocol:", &unk_1EE78AD78);
    serviceProxy = self->_serviceProxy;
    self->_serviceProxy = (SFAddToHomeScreenServiceProtocol *)v3;

    -[SFAddToHomeScreenServiceProtocol setDelegate:](self->_serviceProxy, "setDelegate:", self);
    -[SFAddToHomeScreenViewController _connectToService](self, "_connectToService");
  }
}

- (void)_connectToService
{
  id v3;
  _UIAsyncInvocation *v4;
  _UIAsyncInvocation *cancelViewServiceRequest;
  _QWORD v6[5];

  v3 = (id)-[_UIAsyncInvocation invoke](self->_cancelViewServiceRequest, "invoke");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__SFAddToHomeScreenViewController__connectToService__block_invoke;
  v6[3] = &unk_1E4AC3A80;
  v6[4] = self;
  +[SFAddToHomeScreenRemoteViewController requestViewControllerWithConnectionHandler:](SFAddToHomeScreenRemoteViewController, "requestViewControllerWithConnectionHandler:", v6);
  v4 = (_UIAsyncInvocation *)objc_claimAutoreleasedReturnValue();
  cancelViewServiceRequest = self->_cancelViewServiceRequest;
  self->_cancelViewServiceRequest = v4;

}

void __52__SFAddToHomeScreenViewController__connectToService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 976);
  *(_QWORD *)(v7 + 976) = 0;

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_didLoadRemoteViewController:", v5);
  }
  else
  {
    v9 = WBS_LOG_CHANNEL_PREFIXViewService();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __52__SFAddToHomeScreenViewController__connectToService__block_invoke_cold_1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
  }

}

- (id)serviceProxy
{
  -[SFAddToHomeScreenViewController _initializeViewService](self, "_initializeViewService");
  return self->_serviceProxy;
}

- (void)_didLoadRemoteViewController:(id)a3
{
  id v5;
  void *v6;
  SFAddToHomeScreenServiceProtocol *serviceProxy;
  _QWORD v8[5];

  v5 = a3;
  objc_storeStrong((id *)&self->_remoteViewController, a3);
  objc_msgSend(v5, "serviceViewControllerProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAddToHomeScreenServiceProtocol setTarget:](self->_serviceProxy, "setTarget:", v6);

  objc_msgSend(v5, "setDelegate:", self);
  if ((objc_msgSend(MEMORY[0x1E0CB34D0], "safari_isSafariViewServiceBundle") & 1) != 0)
  {
    -[SFAddToHomeScreenViewController _addRemoteViewControllerIfNeeded](self, "_addRemoteViewControllerIfNeeded");
  }
  else
  {
    serviceProxy = self->_serviceProxy;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __64__SFAddToHomeScreenViewController__didLoadRemoteViewController___block_invoke;
    v8[3] = &unk_1E4ABFE00;
    v8[4] = self;
    -[SFAddToHomeScreenServiceProtocol prepareForDisplayWithCompletionHandler:](serviceProxy, "prepareForDisplayWithCompletionHandler:", v8);
  }

}

uint64_t __64__SFAddToHomeScreenViewController__didLoadRemoteViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addRemoteViewControllerIfNeeded");
}

- (void)_addRemoteViewControllerIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SFAddToHomeScreenViewController _removePlaceholderView](self, "_removePlaceholderView");
  -[SFAddToHomeScreenViewController addChildViewController:](self, "addChildViewController:", self->_remoteViewController);
  -[SFAddToHomeScreenRemoteViewController view](self->_remoteViewController, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SFAddToHomeScreenViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v7);

  -[SFAddToHomeScreenViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v7, "setFrame:");

  objc_msgSend(v7, "setAutoresizingMask:", 18);
  -[_UIRemoteViewController didMoveToParentViewController:](self->_remoteViewController, "didMoveToParentViewController:", self);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAddToHomeScreenViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

}

- (void)_addPlaceholderView
{
  id v3;
  SFWebClipPlaceholderViewController *v4;
  UINavigationController *v5;
  UINavigationController *wrappingPlaceholderNavigationController;
  void *v7;
  id v8;

  v3 = objc_alloc(MEMORY[0x1E0DC3A40]);
  v4 = objc_alloc_init(SFWebClipPlaceholderViewController);
  v5 = (UINavigationController *)objc_msgSend(v3, "initWithRootViewController:", v4);
  wrappingPlaceholderNavigationController = self->_wrappingPlaceholderNavigationController;
  self->_wrappingPlaceholderNavigationController = v5;

  -[SFAddToHomeScreenViewController addChildViewController:](self, "addChildViewController:", self->_wrappingPlaceholderNavigationController);
  -[SFAddToHomeScreenViewController view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UINavigationController view](self->_wrappingPlaceholderNavigationController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v7);
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v7, "setAutoresizingMask:", 18);
  -[UINavigationController didMoveToParentViewController:](self->_wrappingPlaceholderNavigationController, "didMoveToParentViewController:", self);

}

- (void)_removePlaceholderView
{
  UINavigationController *wrappingPlaceholderNavigationController;
  void *v4;
  UINavigationController *v5;

  wrappingPlaceholderNavigationController = self->_wrappingPlaceholderNavigationController;
  if (wrappingPlaceholderNavigationController)
  {
    -[UINavigationController willMoveToParentViewController:](wrappingPlaceholderNavigationController, "willMoveToParentViewController:", 0);
    -[UINavigationController view](self->_wrappingPlaceholderNavigationController, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[UINavigationController removeFromParentViewController](self->_wrappingPlaceholderNavigationController, "removeFromParentViewController");
    v5 = self->_wrappingPlaceholderNavigationController;
    self->_wrappingPlaceholderNavigationController = 0;

  }
}

- (void)serviceProxyWillQueueInvocation:(id)a3
{
  if (!self->_cancelViewServiceRequest)
    -[SFAddToHomeScreenViewController _connectToService](self, "_connectToService", a3);
}

- (void)remoteViewController:(id)a3 didFinishWithResult:(BOOL)a4
{
  _BOOL8 v4;
  void (**completionHandler)(id, _BOOL8);

  v4 = a4;
  -[SFAddToHomeScreenViewController _removeStageCookiesDirectoryIfNeeded](self, "_removeStageCookiesDirectoryIfNeeded", a3);
  if (v4)
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "suspend");
  completionHandler = (void (**)(id, _BOOL8))self->_completionHandler;
  if (completionHandler)
    completionHandler[2](completionHandler, v4);
}

- (void)dataProvider:(id)a3 didFinishWithResult:(BOOL)a4
{
  void (**completionHandler)(id, BOOL);

  completionHandler = (void (**)(id, BOOL))self->_completionHandler;
  if (completionHandler)
    completionHandler[2](completionHandler, a4);
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  return (_UIRemoteViewController *)self->_remoteViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappingPlaceholderNavigationController, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_webClipMetadataFetcherResult, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_initialURL, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_cancelViewServiceRequest, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

void __82__SFAddToHomeScreenViewController_initWithAddToHomeScreenActivityItem_completion___block_invoke_11_cold_1(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_1A3B2D000, v8, v9, "Failed to receive icon, URL: %{sensitive}@, error: %{public}@", v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_0_1();
}

- (void)_issueReadOnlySandboxExtensionForURL:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1A3B2D000, v1, OS_LOG_TYPE_ERROR, "Failed to issue sandbox extension token for copying cookies, errno = %d", (uint8_t *)v3, 8u);

  OUTLINED_FUNCTION_3_2();
}

void __72__SFAddToHomeScreenViewController__copyCurrentCookiesToStagingDirectory__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3B2D000, log, OS_LOG_TYPE_ERROR, "Failed to copy cookies into temporary directory", v1, 2u);
}

void __69__SFAddToHomeScreenViewController__fetchWebClipMetadataViaJavaScript__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_4(&dword_1A3B2D000, a2, a3, "Failed to get remote view controller with error: %{private}@", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_3_2();
}

void __52__SFAddToHomeScreenViewController__connectToService__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_4(&dword_1A3B2D000, a2, a3, "Failed to get remote view controller with error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_2();
}

@end

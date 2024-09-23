@implementation MUWebPlacecardBridge

- (MUWebPlacecardBridge)initWithConfiguration:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  MUWebPlacecardBridge *v9;
  MUWebPlacecardBridge *v10;
  uint64_t v11;
  WKWebView *webView;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MUWebPlacecardBridge;
  v9 = -[MUWebPlacecardBridge init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bridgeConfiguration, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = -[MUWebPlacecardBridge _newConfiguredWebView](v10, "_newConfiguredWebView");
    webView = v10->_webView;
    v10->_webView = (WKWebView *)v11;

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[WKWebViewConfiguration userContentController](self->_webViewConfiguration, "userContentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUWebPlacecardBridgeConfiguration nativeControllerName](self->_bridgeConfiguration, "nativeControllerName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEF5E0], "pageWorld");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeScriptMessageHandlerForName:contentWorld:", v4, v5);

  v6.receiver = self;
  v6.super_class = (Class)MUWebPlacecardBridge;
  -[MUWebPlacecardBridge dealloc](&v6, sel_dealloc);
}

- (id)_newConfiguredWebView
{
  MUWebPlacecardMessageHandlerWithReply *v3;
  id WeakRetained;
  MUWebPlacecardMessageHandlerWithReply *v5;
  WKWebViewConfiguration *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  WKWebViewConfiguration *webViewConfiguration;
  WKWebViewConfiguration *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = [MUWebPlacecardMessageHandlerWithReply alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = -[MUWebPlacecardMessageHandlerWithReply initWithDelegate:](v3, "initWithDelegate:", WeakRetained);

  v6 = (WKWebViewConfiguration *)objc_alloc_init(MEMORY[0x1E0CEF638]);
  -[MUWebPlacecardBridge pool](self, "pool");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKWebViewConfiguration setProcessPool:](v6, "setProcessPool:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0CEF608]);
  -[WKWebViewConfiguration setUserContentController:](v6, "setUserContentController:", v8);

  -[WKWebViewConfiguration setValue:forKey:](v6, "setValue:forKey:", CFSTR("TRUE"), CFSTR("allowUniversalAccessFromFileURLs"));
  -[WKWebViewConfiguration userContentController](v6, "userContentController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEF5E0], "pageWorld");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUWebPlacecardBridgeConfiguration nativeControllerName](self->_bridgeConfiguration, "nativeControllerName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addScriptMessageHandlerWithReply:contentWorld:name:", v5, v10, v11);

  webViewConfiguration = self->_webViewConfiguration;
  self->_webViewConfiguration = v6;
  v13 = v6;

  v14 = objc_alloc(MEMORY[0x1E0CEF630]);
  v15 = (void *)objc_msgSend(v14, "initWithFrame:configuration:", v13, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v15, "setNavigationDelegate:", self);
  objc_msgSend(v15, "scrollView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setScrollsToTop:", 0);

  objc_msgSend(v15, "scrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMaximumZoomScale:", 1.0);

  objc_msgSend(v15, "scrollView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setMinimumZoomScale:", 1.0);

  objc_msgSend(v15, "setOpaque:", 0);
  return v15;
}

- (WKProcessPool)pool
{
  WKProcessPool *pool;
  id v4;
  WKProcessPool *v5;
  WKProcessPool *v6;

  pool = self->_pool;
  if (!pool)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CEF6C0]);
    objc_msgSend(v4, "setUsesSingleWebProcess:", 1);
    v5 = (WKProcessPool *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF5F8]), "_initWithConfiguration:", v4);
    v6 = self->_pool;
    self->_pool = v5;

    pool = self->_pool;
  }
  return pool;
}

- (void)callMethod:(id)a3 arguments:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0C99E08];
  v8 = a4;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("name"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("arguments"));

  v23 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v9, 0, &v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v23;
  if (objc_msgSend(v10, "length"))
    v12 = v11 == 0;
  else
    v12 = 0;
  if (!v12)
  {
    MUGetMUWebContentLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v11;
      _os_log_impl(&dword_191DB8000, v13, OS_LOG_TYPE_ERROR, "Error serializing json into string: %@", buf, 0xCu);
    }

  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v10, 4);
  v15 = (void *)MEMORY[0x1E0CB3940];
  -[MUWebPlacecardBridgeConfiguration webControllerName](self->_bridgeConfiguration, "webControllerName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("return window.%@.receiveMessage(%@)"), v16, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[MUWebPlacecardBridge webView](self, "webView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEF5E0], "pageWorld");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __45__MUWebPlacecardBridge_callMethod_arguments___block_invoke;
  v21[3] = &unk_1E2E015C8;
  v22 = v6;
  v20 = v6;
  objc_msgSend(v18, "callAsyncJavaScript:arguments:inFrame:inContentWorld:completionHandler:", v17, 0, 0, v19, v21);

}

void __45__MUWebPlacecardBridge_callMethod_arguments___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    MUGetMUWebContentLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v13 = 138412546;
      v14 = v8;
      v15 = 2112;
      v16 = v6;
      v9 = "Calling JavaScript message %@ failed with error %@";
      v10 = v7;
      v11 = 22;
LABEL_4:
      _os_log_impl(&dword_191DB8000, v10, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&v13, v11);
    }
  }
  else
  {
    if (v5)
      goto LABEL_7;
    MUGetMUWebContentLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 138412290;
      v14 = v12;
      v9 = "Calling JavaScript message %@ returned a nil object from web module";
      v10 = v7;
      v11 = 12;
      goto LABEL_4;
    }
  }

LABEL_7:
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  objc_storeStrong((id *)&self->_currentNavigation, a4);
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (self->_currentNavigation == a4)
  {
    MUGetMUWebContentLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v12 = 134218242;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_191DB8000, v10, OS_LOG_TYPE_DEBUG, "<WKWebView: %p> failed to load content with error %@", (uint8_t *)&v12, 0x16u);
    }

    -[MUWebPlacecardBridge webView](self, "webView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stopLoading");

  }
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (self->_currentNavigation == a4)
  {
    MUGetMUWebContentLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v12 = 134218242;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_191DB8000, v10, OS_LOG_TYPE_DEBUG, "<WKWebView: %p> failed to load content with error %@", (uint8_t *)&v12, 0x16u);
    }

    -[MUWebPlacecardBridge webView](self, "webView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stopLoading");

  }
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_pool, 0);
  objc_storeStrong((id *)&self->_currentNavigation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webViewConfiguration, 0);
  objc_storeStrong((id *)&self->_bridgeConfiguration, 0);
}

@end

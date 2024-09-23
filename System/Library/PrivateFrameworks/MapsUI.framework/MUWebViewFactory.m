@implementation MUWebViewFactory

+ (id)sharedWebViewFactory
{
  if (qword_1ED01B5A8 != -1)
    dispatch_once(&qword_1ED01B5A8, &__block_literal_global_15);
  return (id)_MergedGlobals_120;
}

void __40__MUWebViewFactory_sharedWebViewFactory__block_invoke()
{
  MUWebViewFactory *v0;
  void *v1;

  v0 = objc_alloc_init(MUWebViewFactory);
  v1 = (void *)_MergedGlobals_120;
  _MergedGlobals_120 = (uint64_t)v0;

}

- (MUWebViewFactory)init
{
  MUWebViewFactory *v2;
  id v3;
  uint64_t v4;
  WKProcessPool *processPool;
  NSCache *v6;
  NSCache *webViewCache;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MUWebViewFactory;
  v2 = -[MUWebViewFactory init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CEF6C0]);
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEF5F8]), "_initWithConfiguration:", v3);
    processPool = v2->_processPool;
    v2->_processPool = (WKProcessPool *)v4;

    v6 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    webViewCache = v2->_webViewCache;
    v2->_webViewCache = v6;

  }
  return v2;
}

- (id)dequeueItemWithBridgeConfiguration:(id)a3
{
  id v4;
  void *v5;
  MUWebViewFactoryItem *v6;
  MUWebViewMessageHandlerProxy *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  -[NSCache objectForKey:](self->_webViewCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "lastObject");
    v6 = (MUWebViewFactoryItem *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeLastObject");
  }
  else
  {
    v7 = objc_alloc_init(MUWebViewMessageHandlerProxy);
    v8 = objc_alloc_init(MEMORY[0x1E0CEF608]);
    objc_msgSend(v4, "nativeControllerName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addScriptMessageHandler:name:", v7, v9);

    v10 = objc_alloc_init(MEMORY[0x1E0CEF638]);
    objc_msgSend(v10, "_setClientNavigationsRunAtForegroundPriority:", 1);
    objc_msgSend(v10, "setIgnoresViewportScaleLimits:", 0);
    objc_msgSend(v10, "setSuppressesIncrementalRendering:", 1);
    objc_msgSend(v10, "setProcessPool:", self->_processPool);
    objc_msgSend(v10, "setUserContentController:", v8);
    v11 = objc_alloc(MEMORY[0x1E0CEF630]);
    v12 = (void *)objc_msgSend(v11, "initWithFrame:configuration:", v10, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v12, "scrollView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setScrollsToTop:", 0);

    objc_msgSend(v12, "scrollView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBounces:", 0);

    objc_msgSend(v12, "scrollView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setScrollEnabled:", 0);

    objc_msgSend(v12, "scrollView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMaximumZoomScale:", 1.0);

    objc_msgSend(v12, "scrollView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setMinimumZoomScale:", 1.0);

    objc_msgSend(v12, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v18);

    v6 = -[MUWebViewFactoryItem initWithBridgeConfiguration:webView:messageHandlerProxy:]([MUWebViewFactoryItem alloc], "initWithBridgeConfiguration:webView:messageHandlerProxy:", v4, v12, v7);
  }

  return v6;
}

- (void)requeueItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSCache *webViewCache;
  void *v9;
  void *v10;
  NSCache *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "messageHandlerProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTarget:", 0);

  objc_msgSend(v13, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavigationDelegate:", 0);

  objc_msgSend(v13, "webView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUIDelegate:", 0);

  objc_msgSend(v13, "webView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopLoading");

  webViewCache = self->_webViewCache;
  objc_msgSend(v13, "bridgeConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](webViewCache, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self->_webViewCache;
    objc_msgSend(v13, "bridgeConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache setObject:forKey:](v11, "setObject:forKey:", v10, v12);

  }
  objc_msgSend(v10, "addObject:", v13);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webViewCache, 0);
  objc_storeStrong((id *)&self->_processPool, 0);
}

@end

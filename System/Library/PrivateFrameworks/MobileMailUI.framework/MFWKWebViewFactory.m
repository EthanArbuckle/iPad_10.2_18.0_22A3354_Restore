@implementation MFWKWebViewFactory

void __48__MFWKWebViewFactory_sharedWebViewFactoryFuture__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend((id)daemonInterface, "messageRepository");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "remoteContentURLCache");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "then:", &__block_literal_global_38);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedWebViewFactoryFuture_sFactoryFuture;
  sharedWebViewFactoryFuture_sFactoryFuture = v1;

}

+ (void)setDaemonInterface:(id)a3 URLCacheWithMemoryCapacity:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t block;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;

  v5 = a3;
  block = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __68__MFWKWebViewFactory_setDaemonInterface_URLCacheWithMemoryCapacity___block_invoke;
  v12 = &unk_1E9A02D88;
  v7 = v5;
  v13 = v7;
  if (setDaemonInterface_URLCacheWithMemoryCapacity__onceToken != -1)
    dispatch_once(&setDaemonInterface_URLCacheWithMemoryCapacity__onceToken, &block);
  objc_msgSend((id)daemonInterface, "messageRepository", v7, block, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUpURLCacheWithMemoryCapacity:", a4);

}

- (void)preallocateWebViews
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__MFWKWebViewFactory_preallocateWebViews__block_invoke;
  block[3] = &unk_1E9A02D88;
  block[4] = self;
  if (preallocateWebViews_onceToken != -1)
    dispatch_once(&preallocateWebViews_onceToken, block);
}

+ (id)sharedWebViewFactoryFuture
{
  void *v5;

  if (!daemonInterface)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MFWKWebViewFactory.m"), 83, CFSTR("daemonInterface is not set"));

  }
  if (sharedWebViewFactoryFuture_onceToken != -1)
    dispatch_once(&sharedWebViewFactoryFuture_onceToken, &__block_literal_global_11);
  return (id)sharedWebViewFactoryFuture_sFactoryFuture;
}

id __48__MFWKWebViewFactory_sharedWebViewFactoryFuture__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  MFWKWebViewFactory *v3;
  void *v4;

  v2 = a2;
  v3 = -[MFWKWebViewFactory initWithRemoteContentURLCache:]([MFWKWebViewFactory alloc], "initWithRemoteContentURLCache:", v2);
  objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (MFWKWebViewFactory)initWithRemoteContentURLCache:(id)a3
{
  id v4;
  MFWKWebViewFactory *v5;
  uint64_t v6;
  EMRemoteContentURLSession *urlSession;
  uint64_t v8;
  EMRemoteContentURLSchemeHandler *proxySchemeHandler;
  uint64_t v10;
  EMRemoteContentURLSchemeHandler *noProxySchemeHandler;
  uint64_t v12;
  NSHashTable *configurations;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MFWKWebViewFactory;
  v5 = -[MFWKWebViewFactory init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1E2E8]), "initWithCache:", v4);
    urlSession = v5->_urlSession;
    v5->_urlSession = (EMRemoteContentURLSession *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1E2E0]), "initWithSession:schemePrefix:allowProxying:", v5->_urlSession, CFSTR("x-apple-mail-proxy-"), 1);
    proxySchemeHandler = v5->_proxySchemeHandler;
    v5->_proxySchemeHandler = (EMRemoteContentURLSchemeHandler *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1E2E0]), "initWithSession:schemePrefix:allowProxying:", v5->_urlSession, CFSTR("x-apple-mail-noproxy-"), 0);
    noProxySchemeHandler = v5->_noProxySchemeHandler;
    v5->_noProxySchemeHandler = (EMRemoteContentURLSchemeHandler *)v10;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v12 = objc_claimAutoreleasedReturnValue();
    configurations = v5->_configurations;
    v5->_configurations = (NSHashTable *)v12;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v5, sel__didReceiveMemoryWarning_, *MEMORY[0x1E0DC4778], 0);

  }
  return v5;
}

void __41__MFWKWebViewFactory_preallocateWebViews__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  +[MFWKWebViewFactory log](MFWKWebViewFactory, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D56AF000, v2, OS_LOG_TYPE_DEFAULT, "Preallocate webViews", v7, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D1EF78], "boundedQueueWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPreallocatedWebViews:", v3);

  v4 = 3;
  do
  {
    objc_msgSend(*(id *)(a1 + 32), "preallocatedWebViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_instantiateWebView:", v4 != 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enqueue:", v6);

    --v4;
  }
  while (v4);
}

- (EFQueue)preallocatedWebViews
{
  return self->_preallocatedWebViews;
}

- (id)_instantiateWebView:(BOOL)a3
{
  _BOOL8 v3;
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

  v3 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CEF630]);
  -[MFWKWebViewFactory _createConfiguration:](self, "_createConfiguration:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithFrame:configuration:", v6, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  objc_msgSend(v7, "setAllowsLinkPreview:", 1);
  objc_msgSend(v7, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setScrollsToTop:", 0);

  objc_msgSend(v7, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setScrollEnabled:", 0);

  objc_msgSend(v7, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBouncesVertically:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v11);

  objc_msgSend(v7, "scrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContentInsetAdjustmentBehavior:", 2);

  objc_msgSend(v7, "scrollView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_setIndicatorInsetAdjustmentBehavior:", 1);

  objc_msgSend(v7, "_setObservedRenderingProgressEvents:", objc_msgSend(v7, "_observedRenderingProgressEvents") | 0x40);
  return v7;
}

- (void)setPreallocatedWebViews:(id)a3
{
  objc_storeStrong((id *)&self->_preallocatedWebViews, a3);
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__MFWKWebViewFactory_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_8 != -1)
    dispatch_once(&log_onceToken_8, block);
  return (OS_os_log *)(id)log_log_8;
}

- (id)_createConfiguration:(BOOL)a3
{
  _BOOL8 v3;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[2];

  v3 = a3;
  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0CEF638]);
  objc_msgSend(v5, "_setAllowsMetaRefresh:", 0);
  objc_msgSend(v5, "_setAllowsJavaScriptMarkup:", 0);
  objc_msgSend(v5, "_setAttachmentElementEnabled:", 1);
  if (_os_feature_enabled_impl() && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "_setAttachmentWideLayoutEnabled:", 1);
  objc_msgSend(v5, "_setWaitsForPaintAfterViewDidMoveToWindow:", 0);
  objc_msgSend(v5, "_setColorFilterEnabled:", 1);
  objc_msgSend(v5, "setDataDetectorTypes:", -1);
  objc_msgSend(v5, "setSelectionGranularity:", 1);
  objc_msgSend(v5, "preferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setTextAutosizingEnabled:", 0);

  objc_msgSend(v5, "preferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setPunchOutWhiteBackgroundsInDarkMode:", 1);

  objc_msgSend(v5, "defaultWebpagePreferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setNetworkConnectionIntegrityPolicy:", 256);

  -[MFWKWebViewFactory processPool](self, "processPool");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProcessPool:", v9);

  objc_msgSend(v5, "_setDelaysWebProcessLaunchUntilFirstLoad:", v3);
  v26[0] = *MEMORY[0x1E0D1ED78];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setAdditionalSupportedImageTypes:", v10);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "_setMarkedTextInputEnabled:", 1);
  -[EMRemoteContentURLSchemeHandler setOnWebViewConfiguration:](self->_proxySchemeHandler, "setOnWebViewConfiguration:", v5);
  -[EMRemoteContentURLSchemeHandler setOnWebViewConfiguration:](self->_noProxySchemeHandler, "setOnWebViewConfiguration:", v5);
  objc_msgSend(MEMORY[0x1E0D46DA8], "sharedHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setURLSchemeHandler:forURLScheme:", v11, *MEMORY[0x1E0D4D488]);

  objc_msgSend(MEMORY[0x1E0D46DA8], "sharedHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFMessageContentURLProtocol scheme](MFMessageContentURLProtocol, "scheme");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setURLSchemeHandler:forURLScheme:", v12, v13);

  objc_msgSend(v5, "userContentController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  +[MFUserScriptLibrary userScripts](MFUserScriptLibrary, "userScripts", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(v14, "addUserScript:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v18++));
      }
      while (v16 != v18);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }

  -[MFWKWebViewFactory configurations](self, "configurations");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v5);

  return v5;
}

- (WKProcessPool)processPool
{
  WKProcessPool *processPool;
  id v4;
  void *v5;
  void *v6;
  WKProcessPool *v7;
  WKProcessPool *v8;
  WKProcessPool *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  processPool = self->_processPool;
  if (!processPool)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CEF6C0]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLForResource:withExtension:subdirectory:", CFSTR("MailWebProcessBundle"), CFSTR("bundle"), CFSTR("PlugIns"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInjectedBundleURL:", v6);

    objc_msgSend(v4, "setShouldTakeUIBackgroundAssertion:", 0);
    v7 = (WKProcessPool *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF5F8]), "_initWithConfiguration:", v4);
    v8 = self->_processPool;
    self->_processPool = v7;

    v9 = self->_processPool;
    v17[0] = CFSTR("remoteContentProxySchemePrefix");
    -[EMRemoteContentURLSchemeHandler schemePrefix](self->_proxySchemeHandler, "schemePrefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    v17[1] = CFSTR("remoteContentNoProxySchemePrefix");
    -[EMRemoteContentURLSchemeHandler schemePrefix](self->_noProxySchemeHandler, "schemePrefix");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v11;
    v17[2] = CFSTR("isMailPrivacyProtectionAllowed");
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "isMailPrivacyProtectionAllowed"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKProcessPool _setObjectsForBundleParametersWithDictionary:](v9, "_setObjectsForBundleParametersWithDictionary:", v15);

    processPool = self->_processPool;
  }
  return processPool;
}

- (NSHashTable)configurations
{
  return self->_configurations;
}

void __68__MFWKWebViewFactory_setDaemonInterface_URLCacheWithMemoryCapacity___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)&daemonInterface, *(id *)(a1 + 32));
}

void __25__MFWKWebViewFactory_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_8;
  log_log_8 = (uint64_t)v1;

}

+ (id)sharedWebViewFactory
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "sharedWebViewFactoryFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (MFWKWebViewFactory)init
{
  void *v3;
  void *v4;
  void *v5;
  MFWKWebViewFactory *v6;

  objc_msgSend((id)daemonInterface, "messageRepository");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteContentURLCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[MFWKWebViewFactory initWithRemoteContentURLCache:](self, "initWithRemoteContentURLCache:", v5);
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[EMRemoteContentURLSession invalidateAndCancel:](self->_urlSession, "invalidateAndCancel:", 1);
  v3.receiver = self;
  v3.super_class = (Class)MFWKWebViewFactory;
  -[MFWKWebViewFactory dealloc](&v3, sel_dealloc);
}

- (void)_didReceiveMemoryWarning:(id)a3
{
  -[MFWKWebViewFactory setPreallocatedWebViews:](self, "setPreallocatedWebViews:", 0);
}

- (void)setContentRuleListManager:(id)a3
{
  void *v4;
  id v5;
  EFAutoCancelationToken *v6;
  EFAutoCancelationToken *contentRuleListManagerObserverCancelable;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v12 = 0;
  objc_msgSend(a3, "addObserver:activeRuleLists:", self, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  v6 = (EFAutoCancelationToken *)objc_alloc_init(MEMORY[0x1E0D1EE78]);
  contentRuleListManagerObserverCancelable = self->_contentRuleListManagerObserverCancelable;
  self->_contentRuleListManagerObserverCancelable = v6;

  -[EFAutoCancelationToken addCancelable:](self->_contentRuleListManagerObserverCancelable, "addCancelable:", v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__MFWKWebViewFactory_setContentRuleListManager___block_invoke;
  v10[3] = &unk_1E9A02DD8;
  v10[4] = self;
  v8 = v5;
  v11 = v8;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performSyncBlock:", v10);

}

void __48__MFWKWebViewFactory_setContentRuleListManager___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "configurations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v16;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v16 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v5), "userContentController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 0u;
        v14 = 0u;
        v11 = 0u;
        v12 = 0u;
        v7 = *(id *)(a1 + 40);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
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
              objc_msgSend(v6, "addContentRuleList:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
            }
            while (v8 != v10);
            v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
          }
          while (v8);
        }

        ++v5;
      }
      while (v5 != v3);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v3);
  }

}

- (void)preallocateWebViewIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  -[MFWKWebViewFactory preallocatedWebViews](self, "preallocatedWebViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MFWKWebViewFactory preallocatedWebViews](self, "preallocatedWebViews");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "count");

    if (!v4)
    {
      -[MFWKWebViewFactory preallocatedWebViews](self, "preallocatedWebViews");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[MFWKWebViewFactory _instantiateWebView:](self, "_instantiateWebView:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "enqueue:", v5);

    }
  }
  else
  {
    v6 = -[MFWKWebViewFactory preallocatedWebViews](self, "preallocatedWebViews");
  }
}

- (id)webView
{
  void *v3;
  void *v4;

  -[MFWKWebViewFactory preallocatedWebViews](self, "preallocatedWebViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[MFWKWebViewFactory _instantiateWebView:](self, "_instantiateWebView:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)contentRuleListManager:(id)a3 didAddRuleList:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  MFWKWebViewFactory *v9;
  id v10;

  v5 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v9 = self;
  v6 = v5;
  v10 = v6;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler", v8, 3221225472, __60__MFWKWebViewFactory_contentRuleListManager_didAddRuleList___block_invoke, &unk_1E9A02DD8, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performSyncBlock:", &v8);

}

void __60__MFWKWebViewFactory_contentRuleListManager_didAddRuleList___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "configurations", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v5), "userContentController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addContentRuleList:", *(_QWORD *)(a1 + 40));

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)contentRuleListManager:(id)a3 didUpdateContentRuleList:(id)a4 oldContentRuleList:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __89__MFWKWebViewFactory_contentRuleListManager_didUpdateContentRuleList_oldContentRuleList___block_invoke;
  v12[3] = &unk_1E9A02D38;
  v12[4] = self;
  v9 = v8;
  v13 = v9;
  v10 = v7;
  v14 = v10;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "performSyncBlock:", v12);

}

void __89__MFWKWebViewFactory_contentRuleListManager_didUpdateContentRuleList_oldContentRuleList___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "configurations", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v5), "userContentController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "removeContentRuleList:", *(_QWORD *)(a1 + 40));
        objc_msgSend(v6, "addContentRuleList:", *(_QWORD *)(a1 + 48));

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)contentRuleListManager:(id)a3 didRemoveRuleList:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  MFWKWebViewFactory *v9;
  id v10;

  v5 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v9 = self;
  v6 = v5;
  v10 = v6;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler", v8, 3221225472, __63__MFWKWebViewFactory_contentRuleListManager_didRemoveRuleList___block_invoke, &unk_1E9A02DD8, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performSyncBlock:", &v8);

}

void __63__MFWKWebViewFactory_contentRuleListManager_didRemoveRuleList___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "configurations", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v5), "userContentController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "removeContentRuleList:", *(_QWORD *)(a1 + 40));

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (EMRemoteContentURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_configurations, a3);
}

- (void)setProcessPool:(id)a3
{
  objc_storeStrong((id *)&self->_processPool, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processPool, 0);
  objc_storeStrong((id *)&self->_preallocatedWebViews, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_contentRuleListManagerObserverCancelable, 0);
  objc_storeStrong((id *)&self->_noProxySchemeHandler, 0);
  objc_storeStrong((id *)&self->_proxySchemeHandler, 0);
}

@end

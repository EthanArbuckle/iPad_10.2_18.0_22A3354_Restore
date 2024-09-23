@implementation LPMetadataProvider

+ (id)_callbackQueue
{
  void *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;

  v2 = (void *)_callbackQueue_queue;
  if (!_callbackQueue_queue)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.LinkPresentation.MetadataProvider", v3);
    v5 = (void *)_callbackQueue_queue;
    _callbackQueue_queue = (uint64_t)v4;

    v2 = (void *)_callbackQueue_queue;
  }
  return v2;
}

+ (id)_postProcessingQueue
{
  void *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;

  v2 = (void *)_postProcessingQueue_queue;
  if (!_postProcessingQueue_queue)
  {
    dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.LinkPresentation.MetadataProvider.PostProcessing", v3);
    v5 = (void *)_postProcessingQueue_queue;
    _postProcessingQueue_queue = (uint64_t)v4;

    v2 = (void *)_postProcessingQueue_queue;
  }
  return v2;
}

+ (id)_visionAnalysisQueue
{
  void *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;

  v2 = (void *)_visionAnalysisQueue_queue;
  if (!_visionAnalysisQueue_queue)
  {
    dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.LinkPresentation.MetadataProvider.VisionAnalysis", v3);
    v5 = (void *)_visionAnalysisQueue_queue;
    _visionAnalysisQueue_queue = (uint64_t)v4;

    v2 = (void *)_visionAnalysisQueue_queue;
  }
  return v2;
}

+ (id)_incompleteMetadataRequests
{
  if (_incompleteMetadataRequests_onceToken != -1)
    dispatch_once(&_incompleteMetadataRequests_onceToken, &__block_literal_global_13);
  return (id)_incompleteMetadataRequests_incompleteRequests;
}

void __49__LPMetadataProvider__incompleteMetadataRequests__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)_incompleteMetadataRequests_incompleteRequests;
  _incompleteMetadataRequests_incompleteRequests = (uint64_t)v0;

}

+ (id)requestMetadataForURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C80]), "initWithURL:", v6);
  objc_msgSend(a1, "_requestMetadataForRequest:completionHandler:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_requestMetadataForRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "startFetchingMetadataForRequest:completionHandler:", v6, v7);

  return v8;
}

+ (id)requestMetadataForWebView:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "startFetchingMetadataForWebView:completionHandler:", v6, v7);

  return v8;
}

+ (id)_copyDefaultWebViewConfiguration
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v2 = (void *)_copyDefaultWebViewConfiguration_configuration;
  if (!_copyDefaultWebViewConfiguration_configuration)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CEF638]);
    v4 = (void *)_copyDefaultWebViewConfiguration_configuration;
    _copyDefaultWebViewConfiguration_configuration = (uint64_t)v3;

    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "_setAllowsJavaScriptMarkup:", 0);
    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "_setAllowsMetaRefresh:", 0);
    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "_setLoadsSubresources:", 0);
    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "_setClientNavigationsRunAtForegroundPriority:", 1);
    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "_setIgnoresAppBoundDomains:", 1);
    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "preferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setExtensibleSSOEnabled:", 0);
    v6 = objc_alloc_init(MEMORY[0x1E0CEF6C0]);
    objc_msgSend(v6, "setJITEnabled:", 0);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF5F8]), "_initWithConfiguration:", v6);
    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "setProcessPool:", v7);

    v2 = (void *)_copyDefaultWebViewConfiguration_configuration;
  }
  v8 = (void *)objc_msgSend(v2, "copy");
  objc_msgSend(MEMORY[0x1E0CEF650], "nonPersistentDataStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWebsiteDataStore:", v9);

  if (+[LPApplicationCompatibilityQuirks needsFreshWKUserContentController](LPApplicationCompatibilityQuirks, "needsFreshWKUserContentController"))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CEF608]);
    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "setUserContentController:", v10);

  }
  +[LPTestingOverrides customLoader](LPTestingOverrides, "customLoader");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    +[LPTestingOverrides customLoader](LPTestingOverrides, "customLoader");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "installCustomWebViewLoader:", v8);

  }
  return v8;
}

- (id)_copyWebViewConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend((id)objc_opt_class(), "_copyDefaultWebViewConfiguration");
  v4 = v3;
  if (self->_requirePrivateRelayForAllNetworkTraffic)
  {
    objc_msgSend(v3, "defaultWebpagePreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setNetworkConnectionIntegrityPolicy:", objc_msgSend(v5, "_networkConnectionIntegrityPolicy") | 0x10);

  }
  return v4;
}

+ (id)_defaultUserAgent
{
  return CFSTR("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/601.2.4 (KHTML, like Gecko) Version/9.0.1 Safari/601.2.4 facebookexternalhit/1.1 Facebot Twitterbot/1.0");
}

- (LPMetadataProvider)init
{
  LPMetadataProvider *v2;
  NSMutableArray *v3;
  NSMutableArray *pendingFetchers;
  dispatch_group_t v5;
  OS_dispatch_group *subresourceFetchGroup;
  LPMetadataProvider *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LPMetadataProvider;
  v2 = -[LPMetadataProvider init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingFetchers = v2->_pendingFetchers;
    v2->_pendingFetchers = v3;

    v2->_useSpecializedProviders = 1;
    v2->_allowedSpecializedProviders = -1;
    v2->_shouldFetchSubresources = 1;
    *(_WORD *)&v2->_shouldDownloadMediaSubresources = 257;
    v2->_timeout = 30.0;
    v5 = dispatch_group_create();
    subresourceFetchGroup = v2->_subresourceFetchGroup;
    v2->_subresourceFetchGroup = (OS_dispatch_group *)v5;

    v2->_loggingID = ++init_nextLoggingID_0;
    v7 = v2;
  }

  return v2;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A0C41000, v0, v1, "LPMetadataProvider<%d>: dealloc", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (BOOL)_shouldFailFetchDueToLockdownModeWithCompletionHandler:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  int v7;
  void *v8;
  id completionHandler;

  v4 = a3;
  v5 = +[LPTestingOverrides forceEnableLockdownMode](LPTestingOverrides, "forceEnableLockdownMode");
  objc_msgSend(MEMORY[0x1E0D44638], "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 | objc_msgSend(v6, "enabled");

  if ((v7 & 1) != 0)
  {
    v8 = _Block_copy(v4);
    completionHandler = self->_completionHandler;
    self->_completionHandler = v8;

    -[LPMetadataProvider _failedWithErrorCode:underlyingError:](self, "_failedWithErrorCode:underlyingError:", 5, 0);
  }

  return v7;
}

- (void)_willStartFetchingMetadata
{
  LPEvent *v3;
  LPEvent *event;
  void *v5;
  void *v6;
  NSObject *v7;
  unsigned int loggingID;
  NSObject *v9;
  unsigned int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  BKSProcessAssertion *v14;
  BKSProcessAssertion *processAssertion;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id buf;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[LPEventTimeline eventWithType:subtitle:](LPEventTimeline, "eventWithType:subtitle:", 0, 0);
  v3 = (LPEvent *)objc_claimAutoreleasedReturnValue();
  event = self->_event;
  self->_event = v3;

  +[LPMetadataProvider _incompleteMetadataRequests](LPMetadataProvider, "_incompleteMetadataRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  +[LPMetadataProvider _incompleteMetadataRequests](LPMetadataProvider, "_incompleteMetadataRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", self);

  objc_sync_exit(v5);
  -[LPMetadataProvider _startWatchdogTimer](self, "_startWatchdogTimer");
  if (self->_fetchIsNotUserInitiated)
  {
    v7 = LPLogChannelFetching();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      loggingID = self->_loggingID;
      LODWORD(buf) = 67109120;
      HIDWORD(buf) = loggingID;
      _os_log_impl(&dword_1A0C41000, v7, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: using zero-click fetch mode", (uint8_t *)&buf, 8u);
    }
  }
  v9 = LPLogChannelFetching();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_loggingID;
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v10;
    _os_log_impl(&dword_1A0C41000, v9, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: acquiring process assertion", (uint8_t *)&buf, 8u);
  }
  v11 = objc_alloc(MEMORY[0x1E0CFE308]);
  v12 = getpid();
  v13 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __48__LPMetadataProvider__willStartFetchingMetadata__block_invoke;
  v18[3] = &unk_1E44A81F8;
  v18[4] = self;
  v14 = (BKSProcessAssertion *)objc_msgSend(v11, "initWithPID:flags:reason:name:withHandler:", v12, 1, 4, CFSTR("com.apple.LinkPresentation.MetadataProvider.Fetch"), v18);
  processAssertion = self->_processAssertion;
  self->_processAssertion = v14;

  objc_initWeak(&buf, self);
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __48__LPMetadataProvider__willStartFetchingMetadata__block_invoke_27;
  v16[3] = &unk_1E44A84B8;
  objc_copyWeak(&v17, &buf);
  -[BKSProcessAssertion setInvalidationHandler:](self->_processAssertion, "setInvalidationHandler:", v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&buf);
}

void __48__LPMetadataProvider__willStartFetchingMetadata__block_invoke(uint64_t a1, char a2)
{
  _QWORD block[5];

  if ((a2 & 1) == 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__LPMetadataProvider__willStartFetchingMetadata__block_invoke_2;
    block[3] = &unk_1E44A7CE8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __48__LPMetadataProvider__willStartFetchingMetadata__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = LPLogChannelFetching();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_1A0C41000, v2, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: cancelling fetch because process assertion was not acquired", (uint8_t *)v5, 8u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_cancelDueToTimeout");
}

void __48__LPMetadataProvider__willStartFetchingMetadata__block_invoke_27(uint64_t a1)
{
  _DWORD *WeakRetained;
  NSObject *v2;
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = LPLogChannelFetching();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = WeakRetained[2];
      v4[0] = 67109120;
      v4[1] = v3;
      _os_log_impl(&dword_1A0C41000, v2, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: cancelling fetch due to process assertion expiration", (uint8_t *)v4, 8u);
    }
    objc_msgSend(WeakRetained, "_stopWatchdogTimer");
    objc_msgSend(WeakRetained, "_cancelDueToTimeout");
  }

}

- (void)startFetchingMetadataForURL:(NSURL *)URL completionHandler:(void *)completionHandler
{
  void *v6;
  void *v7;
  NSURL *v8;

  v8 = URL;
  v6 = completionHandler;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C80]), "initWithURL:", v8);
  -[LPMetadataProvider startFetchingMetadataForRequest:completionHandler:](self, "startFetchingMetadataForRequest:completionHandler:", v7, v6);

}

- (void)startFetchingMetadataForRequest:(NSURLRequest *)request completionHandler:(void *)completionHandler
{
  NSURLRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSURLRequest **p_URLRequest;
  NSURL *v13;
  NSURL *originalURL;
  void *v15;
  NSURLRequest *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  unsigned int loggingID;
  NSURLRequest *v21;
  NSObject *v22;
  unsigned int v23;
  void *v24;
  BOOL v25;
  _QWORD v26[5];
  _QWORD block[5];
  id v28;
  uint8_t buf[4];
  unsigned int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = request;
  v8 = completionHandler;
  if (!-[LPMetadataProvider _shouldFailFetchDueToLockdownModeWithCompletionHandler:](self, "_shouldFailFetchDueToLockdownModeWithCompletionHandler:", v8))
  {
    if (v7 && (-[NSURLRequest URL](v7, "URL"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9))
    {
      -[LPMetadataProvider _willStartFetchingMetadata](self, "_willStartFetchingMetadata");
      v10 = _Block_copy(v8);
      v11 = self->_completionHandler;
      self->_completionHandler = v10;

      p_URLRequest = &self->_URLRequest;
      objc_storeStrong((id *)&self->_URLRequest, request);
      -[NSURLRequest URL](self->_URLRequest, "URL");
      v13 = (NSURL *)objc_claimAutoreleasedReturnValue();
      originalURL = self->_originalURL;
      self->_originalURL = v13;

      +[LPPresentationSpecializations canonicalMetadataURLForURL:](LPPresentationSpecializations, "canonicalMetadataURLForURL:", self->_originalURL);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "isEqual:", self->_originalURL) & 1) != 0)
      {
        v16 = 0;
      }
      else
      {
        v16 = (NSURLRequest *)-[NSURLRequest mutableCopy](*p_URLRequest, "mutableCopy");
        -[NSURLRequest setURL:](v16, "setURL:", v15);
      }
      urlByRemovingTrackingInformation(v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "isEqual:", v18) & 1) == 0)
      {
        if (!v16)
          v16 = (NSURLRequest *)-[NSURLRequest mutableCopy](*p_URLRequest, "mutableCopy");
        -[NSURLRequest setURL:](v16, "setURL:", v18);
        v19 = LPLogChannelFetching();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          loggingID = self->_loggingID;
          *(_DWORD *)buf = 67109120;
          v30 = loggingID;
          _os_log_impl(&dword_1A0C41000, v19, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: removed known tracking information from URL", buf, 8u);
        }
      }
      v21 = v16;
      if (!v16)
        v21 = *p_URLRequest;
      objc_storeStrong((id *)&self->_URLRequest, v21);
      v22 = LPLogChannelFetching();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = self->_loggingID;
        *(_DWORD *)buf = 67109120;
        v30 = v23;
        _os_log_impl(&dword_1A0C41000, v22, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: start fetching for URL", buf, 8u);
      }
      if (self->_hasStartedFetching)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Trying to start fetching on an LPMetadataProvider that has already started. LPMetadataProvider is a one-shot object."));
      self->_hasStartedFetching = 1;
      -[NSURLRequest URL](self->_URLRequest, "URL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[LPMetadataProvider _switchToSpecializationIfPossibleForURL:](self, "_switchToSpecializationIfPossibleForURL:", v24);

      if (!v25)
      {
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __72__LPMetadataProvider_startFetchingMetadataForRequest_completionHandler___block_invoke_32;
        v26[3] = &unk_1E44A7CE8;
        v26[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], v26);
      }

    }
    else
    {
      +[LPMetadataProvider _callbackQueue](LPMetadataProvider, "_callbackQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __72__LPMetadataProvider_startFetchingMetadataForRequest_completionHandler___block_invoke;
      block[3] = &unk_1E44A7F60;
      block[4] = self;
      v28 = v8;
      dispatch_async(v17, block);

    }
  }

}

void __72__LPMetadataProvider_startFetchingMetadataForRequest_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  void *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = LPLogChannelFetching();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1A0C41000, v2, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: failing fetch due to nil URL", (uint8_t *)v6, 8u);
  }
  v4 = *(_QWORD *)(a1 + 40);
  makeLPError(2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

}

_BYTE *__72__LPMetadataProvider_startFetchingMetadataForRequest_completionHandler___block_invoke_32(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[88])
    return (_BYTE *)objc_msgSend(result, "_internalStartFetchingMetadataFromURLRequest");
  return result;
}

- (void)_internalStartFetchingMetadataFromURLRequest
{
  void *v3;
  char v4;
  LPEvent *v5;
  LPEvent *mainResourceLoadEvent;
  void *v7;
  LPEvent *v8;
  LPEvent *webProcessLaunchEvent;
  WKWebView *webView;
  id v11;
  id v12;
  WKWebView *v13;
  WKWebView *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  unsigned int loggingID;
  _DWORD v20[2];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[NSURLRequest URL](self->_URLRequest, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_lp_isHTTPFamilyURL");

  if ((v4 & 1) != 0)
  {
    -[LPEvent didCompleteWithStatus:](self->_mainResourceLoadEvent, "didCompleteWithStatus:", 3);
    -[LPEvent childWithType:subtitle:](self->_event, "childWithType:subtitle:", 2, CFSTR("Main Resource"));
    v5 = (LPEvent *)objc_claimAutoreleasedReturnValue();
    mainResourceLoadEvent = self->_mainResourceLoadEvent;
    self->_mainResourceLoadEvent = v5;

    -[NSURLRequest URL](self->_URLRequest, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPEvent setURL:](self->_mainResourceLoadEvent, "setURL:", v7);

    -[LPEvent didCompleteWithStatus:](self->_webProcessLaunchEvent, "didCompleteWithStatus:", 3);
    -[LPEvent childWithType:subtitle:](self->_event, "childWithType:subtitle:", 7, 0);
    v8 = (LPEvent *)objc_claimAutoreleasedReturnValue();
    webProcessLaunchEvent = self->_webProcessLaunchEvent;
    self->_webProcessLaunchEvent = v8;

    self->_hasStartedFetchingMetadataFromWebView = 0;
    webView = self->_webView;
    if (!webView)
    {
      v11 = objc_alloc(MEMORY[0x1E0CEF630]);
      v12 = -[LPMetadataProvider _copyWebViewConfiguration](self, "_copyWebViewConfiguration");
      v13 = (WKWebView *)objc_msgSend(v11, "initWithFrame:configuration:", v12, 0.0, 0.0, 1024.0, 768.0);
      v14 = self->_webView;
      self->_webView = v13;

      -[WKWebView setNavigationDelegate:](self->_webView, "setNavigationDelegate:", self);
      -[NSURLRequest URL](self->_URLRequest, "URL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[LPPresentationSpecializations userAgentForURL:](LPPresentationSpecializations, "userAgentForURL:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[WKWebView setCustomUserAgent:](self->_webView, "setCustomUserAgent:", v16);

      webView = self->_webView;
    }
    v17 = -[WKWebView loadRequest:](webView, "loadRequest:", self->_URLRequest);
    if (self->_shouldFetchSubresources)
      -[LPMetadataProvider _fetchImplicitIcons](self, "_fetchImplicitIcons");
  }
  else
  {
    v18 = LPLogChannelFetching();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      loggingID = self->_loggingID;
      v20[0] = 67109120;
      v20[1] = loggingID;
      _os_log_impl(&dword_1A0C41000, v18, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: cancelling before main resource load due to non-HTTP-family URL", (uint8_t *)v20, 8u);
    }
    -[LPMetadataProvider _failedWithErrorCode:underlyingError:](self, "_failedWithErrorCode:underlyingError:", 2, 0);
  }
}

- (id)_startFetchingMetadataForURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C80]), "initWithURL:", v6);
  -[LPMetadataProvider _startFetchingMetadataForRequest:completionHandler:](self, "_startFetchingMetadataForRequest:completionHandler:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_startFetchingMetadataForRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  LPLinkMetadata *v9;
  LPLinkMetadata *metadata;
  void *v11;
  id v12;
  id v13;
  LPLinkMetadata *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, void *);
  void *v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(LPLinkMetadata);
  metadata = self->_metadata;
  self->_metadata = v9;

  -[LPLinkMetadata _createAsynchronousLoadDeferralToken](self->_metadata, "_createAsynchronousLoadDeferralToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_originalURL, v8);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __73__LPMetadataProvider__startFetchingMetadataForRequest_completionHandler___block_invoke;
  v19 = &unk_1E44A8EC0;
  v12 = v11;
  v20 = v12;
  v13 = v7;
  v21 = v13;
  -[LPMetadataProvider startFetchingMetadataForRequest:completionHandler:](self, "startFetchingMetadataForRequest:completionHandler:", v6, &v16);
  -[LPLinkMetadata setOriginalURL:](self->_metadata, "setOriginalURL:", v8, v16, v17, v18, v19);
  v14 = self->_metadata;

  return v14;
}

void __73__LPMetadataProvider__startFetchingMetadataForRequest_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;

  v5 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

- (void)startFetchingMetadataForWebView:(id)a3 completionHandler:(id)a4
{
  -[LPMetadataProvider _internalStartFetchingMetadataForWebView:isNonAppInitiated:completionHandler:](self, "_internalStartFetchingMetadataForWebView:isNonAppInitiated:completionHandler:", a3, 0, a4);
}

- (void)_internalStartFetchingMetadataForWebView:(id)a3 isNonAppInitiated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  NSURL *v11;
  NSURL *originalURL;
  NSURLRequest *v13;
  NSURLRequest *URLRequest;
  NSURLRequest *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  unsigned int loggingID;
  const char *v21;
  NSObject *v22;
  unsigned int v23;
  void *v24;
  id completionHandler;
  NSObject *v26;
  unsigned int v27;
  _QWORD v28[5];
  id v29;
  uint8_t buf[4];
  unsigned int v31;
  uint64_t v32;

  v6 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!-[LPMetadataProvider _shouldFailFetchDueToLockdownModeWithCompletionHandler:](self, "_shouldFailFetchDueToLockdownModeWithCompletionHandler:", v10))
  {
    objc_msgSend(v9, "URL");
    v11 = (NSURL *)objc_claimAutoreleasedReturnValue();
    originalURL = self->_originalURL;
    self->_originalURL = v11;

    -[NSURL _lp_requestWithAttribution:](self->_originalURL, "_lp_requestWithAttribution:", v6);
    v13 = (NSURLRequest *)objc_claimAutoreleasedReturnValue();
    URLRequest = self->_URLRequest;
    self->_URLRequest = v13;

    v15 = self->_URLRequest;
    if (v15
      && (-[NSURLRequest URL](v15, "URL"), v16 = (void *)objc_claimAutoreleasedReturnValue(), v16, v16))
    {
      -[NSURLRequest URL](self->_URLRequest, "URL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = +[LPPresentationSpecializations shouldLoadInsteadOfUsingExistingWebViewForURL:](LPPresentationSpecializations, "shouldLoadInsteadOfUsingExistingWebViewForURL:", v17);

      if (v18)
      {
        v19 = LPLogChannelFetching();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          loggingID = self->_loggingID;
          *(_DWORD *)buf = 67109120;
          v31 = loggingID;
          v21 = "LPMetadataProvider<%d>: falling back from using existing WKWebView to fetching because of specializations";
LABEL_11:
          _os_log_impl(&dword_1A0C41000, v19, OS_LOG_TYPE_DEFAULT, v21, buf, 8u);
          goto LABEL_12;
        }
        goto LABEL_12;
      }
      if (objc_msgSend(v9, "isLoading"))
      {
        v19 = LPLogChannelFetching();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v23 = self->_loggingID;
          *(_DWORD *)buf = 67109120;
          v31 = v23;
          v21 = "LPMetadataProvider<%d>: falling back from using existing WKWebView to fetching because web view is still loading";
          goto LABEL_11;
        }
LABEL_12:
        -[LPMetadataProvider startFetchingMetadataForRequest:completionHandler:](self, "startFetchingMetadataForRequest:completionHandler:", self->_URLRequest, v10);
        goto LABEL_20;
      }
      -[LPMetadataProvider _willStartFetchingMetadata](self, "_willStartFetchingMetadata");
      v24 = _Block_copy(v10);
      completionHandler = self->_completionHandler;
      self->_completionHandler = v24;

      objc_storeStrong((id *)&self->_webView, a3);
      self->_fetchingFromExistingWebView = 1;
      v26 = LPLogChannelFetching();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = self->_loggingID;
        *(_DWORD *)buf = 67109120;
        v31 = v27;
        _os_log_impl(&dword_1A0C41000, v26, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: start fetching for WKWebView", buf, 8u);
      }
      -[LPMetadataProvider _fetchMetadataFromWebView](self, "_fetchMetadataFromWebView");
      if (self->_shouldFetchSubresources)
        -[LPMetadataProvider _fetchImplicitIcons](self, "_fetchImplicitIcons");
      if (self->_hasStartedFetching)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Trying to start fetching on an LPMetadataProvider that has already started. LPMetadataProvider is a one-shot object."));
      self->_hasStartedFetching = 1;
    }
    else
    {
      +[LPMetadataProvider _callbackQueue](LPMetadataProvider, "_callbackQueue");
      v22 = objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __99__LPMetadataProvider__internalStartFetchingMetadataForWebView_isNonAppInitiated_completionHandler___block_invoke;
      v28[3] = &unk_1E44A7F60;
      v28[4] = self;
      v29 = v10;
      dispatch_async(v22, v28);

    }
  }
LABEL_20:

}

void __99__LPMetadataProvider__internalStartFetchingMetadataForWebView_isNonAppInitiated_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  void *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = LPLogChannelFetching();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1A0C41000, v2, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: failing fetch from existing WKWebView due to nil URL", (uint8_t *)v6, 8u);
  }
  v4 = *(_QWORD *)(a1 + 40);
  makeLPError(2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

}

- (id)_startFetchingMetadataForWebView:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  LPLinkMetadata *v8;
  LPLinkMetadata *metadata;
  void *v10;
  id v11;
  id v12;
  void *v13;
  LPLinkMetadata *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, void *);
  void *v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(LPLinkMetadata);
  metadata = self->_metadata;
  self->_metadata = v8;

  -[LPLinkMetadata _createAsynchronousLoadDeferralToken](self->_metadata, "_createAsynchronousLoadDeferralToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __73__LPMetadataProvider__startFetchingMetadataForWebView_completionHandler___block_invoke;
  v19 = &unk_1E44A8EC0;
  v11 = v10;
  v20 = v11;
  v12 = v7;
  v21 = v12;
  -[LPMetadataProvider _internalStartFetchingMetadataForWebView:isNonAppInitiated:completionHandler:](self, "_internalStartFetchingMetadataForWebView:isNonAppInitiated:completionHandler:", v6, 0, &v16);
  -[LPLinkMetadata setOriginalURL:](self->_metadata, "setOriginalURL:", self->_originalURL, v16, v17, v18, v19);
  objc_msgSend(v6, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata setTitle:](self->_metadata, "setTitle:", v13);

  v14 = self->_metadata;
  return v14;
}

void __73__LPMetadataProvider__startFetchingMetadataForWebView_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;

  v5 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

- (id)_startFetchingMetadataForWebView:(id)a3 isNonAppInitiated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  LPLinkMetadata *v10;
  LPLinkMetadata *metadata;
  void *v12;
  id v13;
  id v14;
  void *v15;
  LPLinkMetadata *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, void *);
  void *v21;
  id v22;
  id v23;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(LPLinkMetadata);
  metadata = self->_metadata;
  self->_metadata = v10;

  -[LPLinkMetadata _createAsynchronousLoadDeferralToken](self->_metadata, "_createAsynchronousLoadDeferralToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __91__LPMetadataProvider__startFetchingMetadataForWebView_isNonAppInitiated_completionHandler___block_invoke;
  v21 = &unk_1E44A8EC0;
  v13 = v12;
  v22 = v13;
  v14 = v9;
  v23 = v14;
  -[LPMetadataProvider _internalStartFetchingMetadataForWebView:isNonAppInitiated:completionHandler:](self, "_internalStartFetchingMetadataForWebView:isNonAppInitiated:completionHandler:", v8, v6, &v18);
  -[LPLinkMetadata setOriginalURL:](self->_metadata, "setOriginalURL:", self->_originalURL, v18, v19, v20, v21);
  objc_msgSend(v8, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata setTitle:](self->_metadata, "setTitle:", v15);

  v16 = self->_metadata;
  return v16;
}

void __91__LPMetadataProvider__startFetchingMetadataForWebView_isNonAppInitiated_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;

  v5 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

- (void)startFetchingSubresourcesForPartialMetadata:(id)a3 completionHandler:(id)a4
{
  -[LPMetadataProvider _startFetchingSubresourcesForPartialMetadata:isNonAppInitiated:completionHandler:](self, "_startFetchingSubresourcesForPartialMetadata:isNonAppInitiated:completionHandler:", a3, 0, a4);
}

- (void)_startFetchingSubresourcesForPartialMetadata:(id)a3 isNonAppInitiated:(BOOL)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id completionHandler;
  NSURL *v13;
  NSURL *originalURL;
  NSObject *v15;
  unsigned int loggingID;
  _DWORD v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!-[LPMetadataProvider _shouldFailFetchDueToLockdownModeWithCompletionHandler:](self, "_shouldFailFetchDueToLockdownModeWithCompletionHandler:", v10))
  {
    self->_subresourceFetchIsNonAppInitiated = a4;
    -[LPMetadataProvider _willStartFetchingMetadata](self, "_willStartFetchingMetadata");
    v11 = _Block_copy(v10);
    completionHandler = self->_completionHandler;
    self->_completionHandler = v11;

    objc_storeStrong((id *)&self->_metadata, a3);
    objc_msgSend(v9, "originalURL");
    v13 = (NSURL *)objc_claimAutoreleasedReturnValue();
    originalURL = self->_originalURL;
    self->_originalURL = v13;

    v15 = LPLogChannelFetching();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      loggingID = self->_loggingID;
      v17[0] = 67109120;
      v17[1] = loggingID;
      _os_log_impl(&dword_1A0C41000, v15, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: performing deferred fetch of subresources", (uint8_t *)v17, 8u);
    }
    -[LPMetadataProvider _fetchImplicitIcons](self, "_fetchImplicitIcons");
    -[LPMetadataProvider _fetchSubresources](self, "_fetchSubresources");
    if (self->_hasStartedFetching)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Trying to start fetching on an LPMetadataProvider that has already started. LPMetadataProvider is a one-shot object."));
    self->_hasStartedFetching = 1;
  }

}

- (void)_startWatchdogTimer
{
  void *v3;
  double timeout;
  NSTimer *v5;
  NSTimer *watchdog;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0C99E88];
  timeout = self->_timeout;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__LPMetadataProvider__startWatchdogTimer__block_invoke;
  v7[3] = &unk_1E44A8EE8;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, v7, timeout);
  v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  watchdog = self->_watchdog;
  self->_watchdog = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __41__LPMetadataProvider__startWatchdogTimer__block_invoke(uint64_t a1)
{
  _DWORD *WeakRetained;
  _DWORD *v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_BYTE *)WeakRetained + 88))
    {
      v3 = LPLogChannelFetching();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        __41__LPMetadataProvider__startWatchdogTimer__block_invoke_cold_1();
    }
    else
    {
      v4 = LPLogChannelFetching();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = v2[2];
        v6[0] = 67109120;
        v6[1] = v5;
        _os_log_impl(&dword_1A0C41000, v4, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: watchdog timer fired, cancelling", (uint8_t *)v6, 8u);
      }
      objc_msgSend(v2, "_cancelDueToTimeout");
    }
  }

}

- (void)_stopWatchdogTimer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A0C41000, v0, v1, "LPMetadataProvider<%d>: invalidating watchdog timer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)_setMetadata:(id)a3 onlyUpgradeFields:(BOOL)a4
{
  id v6;
  LPLinkMetadata *v7;
  LPLinkMetadata **p_metadata;
  LPLinkMetadata *metadata;
  id v10;

  v6 = a3;
  metadata = self->_metadata;
  p_metadata = &self->_metadata;
  v7 = metadata;
  v10 = v6;
  if (metadata)
    -[LPLinkMetadata _copyPropertiesFrom:onlyUpgradeFields:](v7, "_copyPropertiesFrom:onlyUpgradeFields:");
  else
    objc_storeStrong((id *)p_metadata, a3);

}

- (void)_fetchMetadataFromWebView
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4(&dword_1A0C41000, v0, v1, "LPMetadataProvider<%d>: unexpectedly reached _fetchMetadataFromWebView more than once; ignoring",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1_3();
}

void __47__LPMetadataProvider__fetchMetadataFromWebView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedWithErrorCode:underlyingError:", 2, v6);
    objc_msgSend(*(id *)(a1 + 40), "didCompleteWithStatus:", 2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "didCompleteWithStatus:", 1);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v5;
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("error"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = (id)LPLogChannelFetching();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8);
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("error"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          __47__LPMetadataProvider__fetchMetadataFromWebView__block_invoke_cold_1(v11, (uint64_t)v15, v10, v9);
        }

        objc_msgSend(*(id *)(a1 + 32), "_failedWithErrorCode:underlyingError:", 2, 0);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "_fetchedMetadata:", v7);
      }

    }
    else
    {
      v12 = (id)LPLogChannelFetching();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v14 = (void *)objc_opt_class();
        __47__LPMetadataProvider__fetchMetadataFromWebView__block_invoke_cold_2(v14, (uint64_t)v15, v13, v12);
      }

      objc_msgSend(*(id *)(a1 + 32), "_failedWithErrorCode:underlyingError:", 2, 0);
    }
  }

}

- (BOOL)_switchToSpecializationIfPossibleForMIMEType:(id)a3 URL:(id)a4 hasLoadedResource:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  BOOL v10;
  LPMetadataProviderSpecializationContext *v11;
  LPMetadataProviderSpecializationContext *v12;
  void *v13;
  NSObject *v14;
  unsigned int loggingID;
  uint64_t v16;
  LPFetcherGroup *iconFetcherGroup;
  uint64_t v19;
  _QWORD v20[5];
  uint8_t buf[4];
  unsigned int v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v5 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (self->_useSpecializedProviders && !self->_specializationState)
  {
    v11 = [LPMetadataProviderSpecializationContext alloc];
    LOBYTE(v19) = self->_fetchIsNotUserInitiated;
    v12 = -[LPMetadataProviderSpecializationContext initWithOriginalURL:postRedirectURL:MIMEType:webView:hasLoadedResource:shouldFetchSubresources:allowedSpecializations:fetchIsNotUserInitiated:](v11, "initWithOriginalURL:postRedirectURL:MIMEType:webView:hasLoadedResource:shouldFetchSubresources:allowedSpecializations:fetchIsNotUserInitiated:", self->_originalURL, v9, v8, self->_webView, v5, self->_shouldFetchSubresources, self->_allowedSpecializedProviders, v19);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __89__LPMetadataProvider__switchToSpecializationIfPossibleForMIMEType_URL_hasLoadedResource___block_invoke;
    v20[3] = &unk_1E44A8F38;
    v20[4] = self;
    -[LPMetadataProviderSpecializationContext setEventGenerator:](v12, "setEventGenerator:", v20);
    +[LPMetadataProviderSpecialization specializedMetadataProviderForResourceWithContext:](LPMetadataProviderSpecialization, "specializedMetadataProviderForResourceWithContext:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13 != 0;
    if (v13)
    {
      v14 = (id)LPLogChannelFetching();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        loggingID = self->_loggingID;
        v16 = objc_opt_class();
        *(_DWORD *)buf = 67109378;
        v22 = loggingID;
        v23 = 2112;
        v24 = v16;
        _os_log_impl(&dword_1A0C41000, v14, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: switching to specialization (%@) due to MIME type", buf, 0x12u);
      }

      -[LPFetcherGroup cancel](self->_iconFetcherGroup, "cancel");
      iconFetcherGroup = self->_iconFetcherGroup;
      self->_iconFetcherGroup = 0;

      objc_storeStrong((id *)&self->_specializedMetadataProvider, v13);
      -[LPMetadataProviderSpecialization setDelegate:](self->_specializedMetadataProvider, "setDelegate:", self);
      -[LPMetadataProviderSpecialization start](self->_specializedMetadataProvider, "start");
      self->_specializationState = 1;
      -[LPMetadataProviderSpecializationContext ensureEventWithSpecialization:](v12, "ensureEventWithSpecialization:", objc_msgSend((id)objc_opt_class(), "specialization"));

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __89__LPMetadataProvider__switchToSpecializationIfPossibleForMIMEType_URL_hasLoadedResource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "childWithType:subtitle:", 4, CFSTR("MIME Type"));
}

- (BOOL)_switchToSpecializationIfPossibleForMetadata:(id)a3 URL:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  LPMetadataProviderSpecializationContext *v9;
  NSURL *originalURL;
  void *v11;
  LPMetadataProviderSpecializationContext *v12;
  void *v13;
  NSObject *v14;
  unsigned int loggingID;
  uint64_t v16;
  LPFetcherGroup *iconFetcherGroup;
  uint64_t v19;
  _QWORD v20[5];
  uint8_t buf[4];
  unsigned int v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_useSpecializedProviders && !self->_specializationState)
  {
    v9 = [LPMetadataProviderSpecializationContext alloc];
    originalURL = self->_originalURL;
    -[WKWebView _MIMEType](self->_webView, "_MIMEType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v19) = self->_fetchIsNotUserInitiated;
    v12 = -[LPMetadataProviderSpecializationContext initWithOriginalURL:postRedirectURL:MIMEType:webView:hasLoadedResource:shouldFetchSubresources:allowedSpecializations:fetchIsNotUserInitiated:](v9, "initWithOriginalURL:postRedirectURL:MIMEType:webView:hasLoadedResource:shouldFetchSubresources:allowedSpecializations:fetchIsNotUserInitiated:", originalURL, v7, v11, self->_webView, 1, self->_shouldFetchSubresources, self->_allowedSpecializedProviders, v19);

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __71__LPMetadataProvider__switchToSpecializationIfPossibleForMetadata_URL___block_invoke;
    v20[3] = &unk_1E44A8F38;
    v20[4] = self;
    -[LPMetadataProviderSpecializationContext setEventGenerator:](v12, "setEventGenerator:", v20);
    +[LPMetadataProviderSpecialization specializedMetadataProviderForMetadata:withContext:](LPMetadataProviderSpecialization, "specializedMetadataProviderForMetadata:withContext:", v6, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13 != 0;
    if (v13)
    {
      v14 = (id)LPLogChannelFetching();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        loggingID = self->_loggingID;
        v16 = objc_opt_class();
        *(_DWORD *)buf = 67109378;
        v22 = loggingID;
        v23 = 2112;
        v24 = v16;
        _os_log_impl(&dword_1A0C41000, v14, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: switching to specialization (%@) due to retrieved metadata", buf, 0x12u);
      }

      -[LPFetcherGroup cancel](self->_iconFetcherGroup, "cancel");
      iconFetcherGroup = self->_iconFetcherGroup;
      self->_iconFetcherGroup = 0;

      objc_storeStrong((id *)&self->_specializedMetadataProvider, v13);
      -[LPMetadataProviderSpecialization setDelegate:](self->_specializedMetadataProvider, "setDelegate:", self);
      -[LPMetadataProviderSpecialization start](self->_specializedMetadataProvider, "start");
      self->_specializationState = 1;
      -[LPMetadataProviderSpecializationContext ensureEventWithSpecialization:](v12, "ensureEventWithSpecialization:", objc_msgSend((id)objc_opt_class(), "specialization"));

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __71__LPMetadataProvider__switchToSpecializationIfPossibleForMetadata_URL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "childWithType:subtitle:", 4, CFSTR("Metadata"));
}

- (BOOL)_switchToSpecializationIfPossibleForURL:(id)a3
{
  id v4;
  BOOL v5;
  LPMetadataProviderSpecializationContext *v6;
  LPMetadataProviderSpecializationContext *v7;
  void *v8;
  NSObject *v9;
  unsigned int loggingID;
  void *v11;
  id v12;
  LPFetcherGroup *iconFetcherGroup;
  uint64_t v15;
  _QWORD v16[5];
  uint8_t buf[4];
  unsigned int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_useSpecializedProviders && !self->_specializationState)
  {
    v6 = [LPMetadataProviderSpecializationContext alloc];
    LOBYTE(v15) = self->_fetchIsNotUserInitiated;
    v7 = -[LPMetadataProviderSpecializationContext initWithOriginalURL:postRedirectURL:MIMEType:webView:hasLoadedResource:shouldFetchSubresources:allowedSpecializations:fetchIsNotUserInitiated:](v6, "initWithOriginalURL:postRedirectURL:MIMEType:webView:hasLoadedResource:shouldFetchSubresources:allowedSpecializations:fetchIsNotUserInitiated:", self->_originalURL, v4, 0, self->_webView, 0, self->_shouldFetchSubresources, self->_allowedSpecializedProviders, v15);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __62__LPMetadataProvider__switchToSpecializationIfPossibleForURL___block_invoke;
    v16[3] = &unk_1E44A8F38;
    v16[4] = self;
    -[LPMetadataProviderSpecializationContext setEventGenerator:](v7, "setEventGenerator:", v16);
    +[LPMetadataProviderSpecialization specializedMetadataProviderForURLWithContext:](LPMetadataProviderSpecialization, "specializedMetadataProviderForURLWithContext:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8 != 0;
    if (v8)
    {
      v9 = (id)LPLogChannelFetching();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        loggingID = self->_loggingID;
        v11 = (void *)objc_opt_class();
        *(_DWORD *)buf = 67109378;
        v18 = loggingID;
        v19 = 2112;
        v20 = v11;
        v12 = v11;
        _os_log_impl(&dword_1A0C41000, v9, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: switching to specialization (%@) due to URL", buf, 0x12u);

      }
      -[LPFetcherGroup cancel](self->_iconFetcherGroup, "cancel");
      iconFetcherGroup = self->_iconFetcherGroup;
      self->_iconFetcherGroup = 0;

      objc_storeStrong((id *)&self->_specializedMetadataProvider, v8);
      -[LPMetadataProviderSpecialization setDelegate:](self->_specializedMetadataProvider, "setDelegate:", self);
      -[LPMetadataProviderSpecialization start](self->_specializedMetadataProvider, "start");
      self->_specializationState = 1;
      -[LPMetadataProviderSpecializationContext ensureEventWithSpecialization:](v7, "ensureEventWithSpecialization:", objc_msgSend((id)objc_opt_class(), "specialization"));
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __62__LPMetadataProvider__switchToSpecializationIfPossibleForURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "childWithType:subtitle:", 4, CFSTR("URL"));
}

- (void)_generateSpecializationIfPossibleForCompleteMetadata:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  LPMetadataProviderSpecializationContext *v9;
  NSURL *originalURL;
  void *v11;
  void *v12;
  LPMetadataProviderSpecializationContext *v13;
  uint64_t v14;
  LPMetadataProviderSpecializationContext *v15;
  uint64_t v16;
  _QWORD block[4];
  id v18;
  LPMetadataProviderSpecializationContext *v19;
  id v20;
  _QWORD v21[5];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_useSpecializedProviders && self->_specializationState != 1)
  {
    v9 = [LPMetadataProviderSpecializationContext alloc];
    originalURL = self->_originalURL;
    objc_msgSend(v6, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWebView _MIMEType](self->_webView, "_MIMEType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = self->_fetchIsNotUserInitiated;
    v13 = -[LPMetadataProviderSpecializationContext initWithOriginalURL:postRedirectURL:MIMEType:webView:hasLoadedResource:shouldFetchSubresources:allowedSpecializations:fetchIsNotUserInitiated:](v9, "initWithOriginalURL:postRedirectURL:MIMEType:webView:hasLoadedResource:shouldFetchSubresources:allowedSpecializations:fetchIsNotUserInitiated:", originalURL, v11, v12, self->_webView, 1, self->_shouldFetchSubresources, self->_allowedSpecializedProviders, v16);

    v14 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __93__LPMetadataProvider__generateSpecializationIfPossibleForCompleteMetadata_completionHandler___block_invoke;
    v21[3] = &unk_1E44A8F38;
    v21[4] = self;
    -[LPMetadataProviderSpecializationContext setEventGenerator:](v13, "setEventGenerator:", v21);
    block[0] = v14;
    block[1] = 3221225472;
    block[2] = __93__LPMetadataProvider__generateSpecializationIfPossibleForCompleteMetadata_completionHandler___block_invoke_2;
    block[3] = &unk_1E44A8220;
    v18 = v6;
    v19 = v13;
    v20 = v8;
    v15 = v13;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

uint64_t __93__LPMetadataProvider__generateSpecializationIfPossibleForCompleteMetadata_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "childWithType:subtitle:", 4, CFSTR("Complete Metadata"));
}

uint64_t __93__LPMetadataProvider__generateSpecializationIfPossibleForCompleteMetadata_completionHandler___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = +[LPMetadataProviderSpecialization generateSpecializedMetadataForCompleteMetadata:withContext:completionHandler:](LPMetadataProviderSpecialization, "generateSpecializedMetadataForCompleteMetadata:withContext:completionHandler:", a1[4], a1[5], a1[6]);
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  return result;
}

- (void)cancel
{
  NSObject *v3;
  unsigned int loggingID;
  LPMetadataProviderSpecialization *specializedMetadataProvider;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = LPLogChannelFetching();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    loggingID = self->_loggingID;
    v6[0] = 67109120;
    v6[1] = loggingID;
    _os_log_impl(&dword_1A0C41000, v3, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: fetch cancelled by client", (uint8_t *)v6, 8u);
  }
  -[LPMetadataProvider setCancelled:](self, "setCancelled:", 1);
  specializedMetadataProvider = self->_specializedMetadataProvider;
  if (specializedMetadataProvider)
    -[LPMetadataProviderSpecialization cancel](specializedMetadataProvider, "cancel");
  -[LPMetadataProvider _failedWithErrorCode:underlyingError:](self, "_failedWithErrorCode:underlyingError:", 3, 0);
}

- (void)_cancelDueToTimeout
{
  NSObject *v3;
  unsigned int loggingID;
  LPMetadataProviderSpecialization *specializedMetadataProvider;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = LPLogChannelFetching();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    loggingID = self->_loggingID;
    v6[0] = 67109120;
    v6[1] = loggingID;
    _os_log_impl(&dword_1A0C41000, v3, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: cancelling due to timeout", (uint8_t *)v6, 8u);
  }
  -[LPMetadataProvider _stopWatchdogTimer](self, "_stopWatchdogTimer");
  -[LPMetadataProvider setCancelled:](self, "setCancelled:", 1);
  self->_timedOut = 1;
  specializedMetadataProvider = self->_specializedMetadataProvider;
  if (specializedMetadataProvider)
    -[LPMetadataProviderSpecialization cancel](specializedMetadataProvider, "cancel");
  -[LPMetadataProvider _failedWithErrorCode:underlyingError:](self, "_failedWithErrorCode:underlyingError:", 4, 0);
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t);
  void *v9;
  char v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  unsigned int loggingID;
  _DWORD v20[2];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(id, uint64_t))a5;
  objc_msgSend(v7, "targetFrame");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isMainFrame");

  if ((v10 & 1) == 0
    || (objc_msgSend(v7, "request"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "URL"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = -[LPMetadataProvider _switchToSpecializationIfPossibleForURL:](self, "_switchToSpecializationIfPossibleForURL:", v12), v12, v11, v13))
  {
    v14 = 0;
LABEL_4:
    v8[2](v8, v14);
    goto LABEL_5;
  }
  objc_msgSend(v7, "request");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "_lp_isHTTPFamilyURL");

  if ((v17 & 1) != 0)
  {
    v14 = 1;
    goto LABEL_4;
  }
  v18 = LPLogChannelFetching();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    loggingID = self->_loggingID;
    v20[0] = 67109120;
    v20[1] = loggingID;
    _os_log_impl(&dword_1A0C41000, v18, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: cancelling main resource load due to non-HTTP-family URL", (uint8_t *)v20, 8u);
  }
  v8[2](v8, 0);
  -[LPMetadataProvider _failedWithErrorCode:underlyingError:](self, "_failedWithErrorCode:underlyingError:", 2, 0);
LABEL_5:

}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t);
  void *v9;
  char isKindOfClass;
  void *v11;
  NSObject *v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  unsigned int loggingID;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  NSObject *v29;
  unsigned int v30;
  void *v31;
  void *v32;
  uint64_t v33;
  int v34;
  unsigned int v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(id, uint64_t))a5;
  objc_msgSend(v7, "response");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_7:
    objc_msgSend(v7, "response");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "expectedContentLength");

    objc_msgSend(v7, "response");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "MIMEType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = +[LPMIMETypeRegistry isWebPageType:](LPMIMETypeRegistry, "isWebPageType:", v17);

    if (v18)
    {
      if (v15 > 0x100000)
      {
        v19 = LPLogChannelFetching();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        goto LABEL_21;
      }
    }
    else
    {
      objc_msgSend(v7, "response");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "MIMEType");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = +[LPMIMETypeRegistry isImageType:](LPMIMETypeRegistry, "isImageType:", v21);

      if (v22)
      {
        if (v15 > 10485760)
        {
          v19 = LPLogChannelFetching();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
LABEL_14:
            loggingID = self->_loggingID;
            v34 = 67109376;
            v35 = loggingID;
            v36 = 2048;
            v37 = v15;
            _os_log_impl(&dword_1A0C41000, v19, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: cancelling main resource load due to excessive size: %{iec-bytes}lld", (uint8_t *)&v34, 0x12u);
          }
LABEL_21:
          v33 = 0;
LABEL_26:
          v8[2](v8, v33);
          goto LABEL_27;
        }
      }
      else
      {
        objc_msgSend(v7, "response");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "MIMEType");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "response");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "URL");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[LPMetadataProvider _switchToSpecializationIfPossibleForMIMEType:URL:hasLoadedResource:](self, "_switchToSpecializationIfPossibleForMIMEType:URL:hasLoadedResource:", v25, v27, 0);

        if (v28)
          goto LABEL_21;
        if (!self->_useSpecializedProviders || (self->_allowedSpecializedProviders & 2) == 0)
        {
          v29 = (id)LPLogChannelFetching();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v30 = self->_loggingID;
            objc_msgSend(v7, "response");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "MIMEType");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = 67109378;
            v35 = v30;
            v36 = 2112;
            v37 = (uint64_t)v32;
            _os_log_impl(&dword_1A0C41000, v29, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: cancelling main resource load due to unknown MIME type: \"%@\", (uint8_t *)&v34, 0x12u);

          }
          goto LABEL_21;
        }
        if (v15 >= 104857601)
        {
          v19 = LPLogChannelFetching();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            goto LABEL_21;
          goto LABEL_14;
        }
      }
    }
    v33 = 1;
    goto LABEL_26;
  }
  objc_msgSend(v7, "response");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(MEMORY[0x1E0C92C18], "isErrorStatusCode:", objc_msgSend(v11, "statusCode")))
  {

    goto LABEL_7;
  }
  v12 = (id)LPLogChannelFetching();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = self->_loggingID;
    v34 = 67109376;
    v35 = v13;
    v36 = 2048;
    v37 = objc_msgSend(v11, "statusCode");
    _os_log_impl(&dword_1A0C41000, v12, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: cancelling main resource load due to error status code: %ld", (uint8_t *)&v34, 0x12u);
  }

  v8[2](v8, 0);
LABEL_27:

}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  LPEvent *webProcessLaunchEvent;

  -[LPEvent didCompleteWithStatus:](self->_webProcessLaunchEvent, "didCompleteWithStatus:", 1, a4);
  webProcessLaunchEvent = self->_webProcessLaunchEvent;
  self->_webProcessLaunchEvent = 0;

}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  NSObject *v5;
  unsigned int loggingID;
  LPEvent *mainResourceLoadEvent;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = LPLogChannelFetching();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    loggingID = self->_loggingID;
    v8[0] = 67109120;
    v8[1] = loggingID;
    _os_log_impl(&dword_1A0C41000, v5, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: -webView:didFinishNavigation:", (uint8_t *)v8, 8u);
  }
  -[LPEvent didCompleteWithStatus:](self->_mainResourceLoadEvent, "didCompleteWithStatus:", 1);
  mainResourceLoadEvent = self->_mainResourceLoadEvent;
  self->_mainResourceLoadEvent = 0;

  -[LPMetadataProvider _fetchMetadataFromWebView](self, "_fetchMetadataFromWebView");
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v6;
  NSObject *v7;
  unsigned int loggingID;
  LPEvent *mainResourceLoadEvent;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  v7 = LPLogChannelFetching();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    loggingID = self->_loggingID;
    v10[0] = 67109120;
    v10[1] = loggingID;
    _os_log_impl(&dword_1A0C41000, v7, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: -webView:didFailNavigation:", (uint8_t *)v10, 8u);
  }
  -[LPEvent didCompleteWithStatus:](self->_mainResourceLoadEvent, "didCompleteWithStatus:", 2);
  mainResourceLoadEvent = self->_mainResourceLoadEvent;
  self->_mainResourceLoadEvent = 0;

  -[LPMetadataProvider _failedWithErrorCode:underlyingError:](self, "_failedWithErrorCode:underlyingError:", 2, v6);
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v6;
  NSObject *v7;
  unsigned int loggingID;
  LPEvent *mainResourceLoadEvent;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  if (!self->_specializedMetadataProvider)
  {
    v7 = LPLogChannelFetching();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      loggingID = self->_loggingID;
      v10[0] = 67109120;
      v10[1] = loggingID;
      _os_log_impl(&dword_1A0C41000, v7, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: -webView:didFailProvisionalNavigation:", (uint8_t *)v10, 8u);
    }
    -[LPEvent didCompleteWithStatus:](self->_mainResourceLoadEvent, "didCompleteWithStatus:", 2);
    mainResourceLoadEvent = self->_mainResourceLoadEvent;
    self->_mainResourceLoadEvent = 0;

    -[LPMetadataProvider _failedWithErrorCode:underlyingError:](self, "_failedWithErrorCode:underlyingError:", 2, v6);
  }

}

- (void)webViewWebContentProcessDidTerminate:(id)a3
{
  NSObject *v4;
  LPEvent *mainResourceLoadEvent;

  v4 = LPLogChannelFetching();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[LPMetadataProvider webViewWebContentProcessDidTerminate:].cold.1();
  -[LPEvent didCompleteWithStatus:](self->_mainResourceLoadEvent, "didCompleteWithStatus:", 2);
  mainResourceLoadEvent = self->_mainResourceLoadEvent;
  self->_mainResourceLoadEvent = 0;

  -[LPMetadataProvider _failedWithErrorCode:underlyingError:](self, "_failedWithErrorCode:underlyingError:", 2, 0);
}

- (void)_fetchedMetadata:(id)a3
{
  id v4;
  NSObject *v5;
  unsigned int loggingID;
  id v7;
  LPLinkMetadata *metadata;
  void *v9;
  NSObject *v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = LPLogChannelFetching();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    loggingID = self->_loggingID;
    v12 = 67109120;
    v13 = loggingID;
    _os_log_impl(&dword_1A0C41000, v5, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: fetched metadata", (uint8_t *)&v12, 8u);
  }
  if (!-[LPMetadataProvider cancelled](self, "cancelled"))
  {
    v7 = -[LPLinkMetadata _initWithDictionary:]([LPLinkMetadata alloc], "_initWithDictionary:", v4);
    objc_msgSend(v7, "setOriginalURL:", self->_originalURL);
    -[LPMetadataProvider _setMetadata:onlyUpgradeFields:](self, "_setMetadata:onlyUpgradeFields:", v7, 1);
    metadata = self->_metadata;
    -[WKWebView URL](self->_webView, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(metadata) = -[LPMetadataProvider _switchToSpecializationIfPossibleForMetadata:URL:](self, "_switchToSpecializationIfPossibleForMetadata:URL:", metadata, v9);

    if ((metadata & 1) == 0)
    {
      -[LPMetadataProvider _redistinguishImagesAndIcons](self, "_redistinguishImagesAndIcons");
      -[LPMetadataProvider _simplifyTitle](self, "_simplifyTitle");
      -[LPMetadataProvider _propagateYouTubeTimestamps](self, "_propagateYouTubeTimestamps");
      if (self->_shouldFetchSubresources)
      {
        -[LPMetadataProvider _fetchSubresources](self, "_fetchSubresources");
        -[LPLinkMetadata _invokePendingAsynchronousLoadUpdateHandlers](self->_metadata, "_invokePendingAsynchronousLoadUpdateHandlers");
      }
      else
      {
        v10 = LPLogChannelFetching();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = self->_loggingID;
          v12 = 67109120;
          v13 = v11;
          _os_log_impl(&dword_1A0C41000, v10, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: skipping subresource fetch", (uint8_t *)&v12, 8u);
        }
        -[LPMetadataProvider _completedWithError:](self, "_completedWithError:", 0);
      }
    }

  }
}

- (id)subresourceFetcherConfiguration
{
  LPFetcherConfiguration *v3;
  _BOOL8 v4;

  v3 = objc_alloc_init(LPFetcherConfiguration);
  -[LPFetcherConfiguration setRootEvent:](v3, "setRootEvent:", self->_event);
  v4 = -[NSURLRequest attribution](self->_URLRequest, "attribution") == NSURLRequestAttributionUser
    || self->_subresourceFetchIsNonAppInitiated;
  -[LPFetcherConfiguration setLoadingIsNonAppInitiated:](v3, "setLoadingIsNonAppInitiated:", v4);
  -[LPFetcherConfiguration setWebViewForProcessSharing:](v3, "setWebViewForProcessSharing:", self->_webView);
  -[LPFetcherConfiguration setFetchIsNotUserInitiated:](v3, "setFetchIsNotUserInitiated:", self->_fetchIsNotUserInitiated);
  return v3;
}

- (void)_fetchImplicitIcons
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
  void *v12;
  void *v13;
  LPFetcherGroup *v14;
  void *v15;
  LPFetcherGroup *v16;
  LPFetcherGroup *iconFetcherGroup;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  LPIconMetadata *v22;
  void *v23;
  void *v24;
  void *v25;
  id obja;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  _BYTE v33[128];
  _QWORD v34[5];

  v34[3] = *MEMORY[0x1E0C80C00];
  if (!self->_iconFetcherGroup)
  {
    v3 = (void *)MEMORY[0x1E0C99E98];
    -[NSURLRequest URL](self->_URLRequest, "URL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLWithString:relativeToURL:", CFSTR("/apple-touch-icon-precomposed.png"), v25);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "absoluteURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v5;
    v6 = (void *)MEMORY[0x1E0C99E98];
    -[NSURLRequest URL](self->_URLRequest, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLWithString:relativeToURL:", CFSTR("/apple-touch-icon.png"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "absoluteURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v9;
    v10 = (void *)MEMORY[0x1E0C99E98];
    -[NSURLRequest URL](self->_URLRequest, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLWithString:relativeToURL:", CFSTR("/favicon.ico"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "absoluteURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
    obja = (id)objc_claimAutoreleasedReturnValue();

    v14 = [LPFetcherGroup alloc];
    -[LPMetadataProvider subresourceFetcherConfiguration](self, "subresourceFetcherConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __41__LPMetadataProvider__fetchImplicitIcons__block_invoke;
    v32[3] = &unk_1E44A8A20;
    v32[4] = self;
    v16 = -[LPFetcherGroup initWithPolicy:configuration:description:completionHandler:](v14, "initWithPolicy:configuration:description:completionHandler:", 1, v15, CFSTR("Icons"), v32);
    iconFetcherGroup = self->_iconFetcherGroup;
    self->_iconFetcherGroup = v16;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = obja;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v29;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(obj);
          v21 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v20);
          v22 = objc_alloc_init(LPIconMetadata);
          -[LPIconMetadata setURL:](v22, "setURL:", v21);
          -[LPMetadataProvider subresourceFetcherConfiguration](self, "subresourceFetcherConfiguration");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[LPImageFetcher imageFetcherForConfiguration:](LPImageFetcher, "imageFetcherForConfiguration:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "setURL:", v21);
          objc_msgSend(v24, "setUserData:", v22);
          objc_msgSend(v24, "setResponseClass:", objc_opt_class());
          -[LPFetcherGroup appendFetcher:](self->_iconFetcherGroup, "appendFetcher:", v24);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v18);
    }

    -[NSMutableArray addObject:](self->_pendingFetchers, "addObject:", self->_iconFetcherGroup);
  }
}

void __41__LPMetadataProvider__fetchImplicitIcons__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v3;
  if (v3)
  {
    objc_msgSend(v3, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v5 = a1 + 32;
    objc_msgSend(*(id *)(v6 + 80), "setIcon:", v4);

    objc_msgSend(v8, "userData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)v5 + 80), "setIconMetadata:", v7);

    objc_msgSend(*(id *)(*(_QWORD *)v5 + 80), "_invokePendingAsynchronousLoadUpdateHandlers");
  }
  else
  {
    v5 = a1 + 32;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)v5 + 112));

}

- (void)setFetchSubresources:(BOOL)a3
{
  self->_shouldFetchSubresources = a3;
}

- (BOOL)fetchSubresources
{
  return self->_shouldFetchSubresources;
}

- (void)_fetchSubresources
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  unsigned int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  _BOOL4 v26;
  LPFetcherGroup *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  BOOL v37;
  LPFetcherGroup *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  BOOL v57;
  LPFetcherGroup *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t m;
  void *v63;
  LPRawURLContentsFetcher *v64;
  void *v65;
  LPFetcherGroup *v66;
  NSObject *v67;
  unsigned int v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t n;
  void *v73;
  LPMediaAssetFetcher *v74;
  void *v75;
  unsigned int v76;
  NSObject *v77;
  unsigned int v78;
  unsigned int v79;
  unsigned int v80;
  unsigned int v81;
  unsigned int v82;
  NSObject *subresourceFetchGroup;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  id v92;
  unsigned int loggingID;
  LPFetcherGroup *v94;
  void *v95;
  LPFetcherGroup *v96;
  void *v97;
  void *v98;
  LPFetcherGroup *v99;
  void *v100;
  void *v101;
  void *v102;
  LPFetcherGroup *v103;
  _QWORD block[5];
  _QWORD v105[5];
  LPFetcherGroup *v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _QWORD v111[5];
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _QWORD v116[5];
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _QWORD v125[5];
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _QWORD v130[5];
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  uint8_t v135[128];
  uint8_t buf[4];
  unsigned int v137;
  __int16 v138;
  _BYTE v139[10];
  uint64_t v140;
  _BYTE v141[10];
  __int16 v142;
  uint64_t v143;
  __int16 v144;
  uint64_t v145;
  __int16 v146;
  uint64_t v147;
  uint64_t v148;

  v148 = *MEMORY[0x1E0C80C00];
  v92 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[LPLinkMetadata streamingVideos](self->_metadata, "streamingVideos");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[LPLinkMetadata streamingVideos](self->_metadata, "streamingVideos");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "addObjectsFromArray:", v4);

  }
  -[LPLinkMetadata videos](self->_metadata, "videos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LPLinkMetadata videos](self->_metadata, "videos");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "addObjectsFromArray:", v6);

  }
  -[LPLinkMetadata audios](self->_metadata, "audios");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[LPLinkMetadata audios](self->_metadata, "audios");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "addObjectsFromArray:", v8);

  }
  v9 = (id)LPLogChannelFetching();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    loggingID = self->_loggingID;
    -[LPLinkMetadata images](self->_metadata, "images");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = objc_msgSend(v100, "count");
    -[LPLinkMetadata contentImagesMetadata](self->_metadata, "contentImagesMetadata");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v97, "count");
    -[LPLinkMetadata icons](self->_metadata, "icons");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v95, "count");
    v84 = objc_msgSend(v92, "count");
    -[LPLinkMetadata arAssets](self->_metadata, "arAssets");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v88, "count");
    -[LPLinkMetadata images](self->_metadata, "images");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v85, "count");
    -[LPLinkMetadata contentImagesMetadata](self->_metadata, "contentImagesMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");
    -[LPLinkMetadata icons](self->_metadata, "icons");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");
    v16 = objc_msgSend(v92, "count");
    -[LPLinkMetadata arAssets](self->_metadata, "arAssets");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67110656;
    v137 = loggingID;
    v138 = 2048;
    *(_QWORD *)v139 = v87 + v90 + v86 + v84 + v10;
    *(_WORD *)&v139[8] = 2048;
    v140 = v11;
    *(_WORD *)v141 = 2048;
    *(_QWORD *)&v141[2] = v13;
    v142 = 2048;
    v143 = v15;
    v144 = 2048;
    v145 = v16;
    v146 = 2048;
    v147 = objc_msgSend(v17, "count");
    _os_log_impl(&dword_1A0C41000, v9, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: resolving %lu subresources (%lu images, %lu content images, %lu icons, %lu videos/audios, %lu AR assets)", buf, 0x44u);

  }
  if (!self->_shouldDownloadImageSubresources)
  {
    v18 = LPLogChannelFetching();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = self->_loggingID;
      *(_DWORD *)buf = 67109120;
      v137 = v19;
      _os_log_impl(&dword_1A0C41000, v18, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: skipping image subresources because _shouldDownloadImageSubresources is set", buf, 8u);
    }
  }
  -[LPMetadataProvider subresourceFetcherConfiguration](self, "subresourceFetcherConfiguration");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata images](self->_metadata, "images");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  -[LPLinkMetadata associatedApplication](self->_metadata, "associatedApplication");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bundleIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23 != 0;
  v89 = v23;

  if ((v21 != 0 || v24) && self->_shouldDownloadImageSubresources)
  {
    dispatch_group_enter((dispatch_group_t)self->_subresourceFetchGroup);
    v101 = (void *)objc_msgSend(v91, "copy");
    -[NSURLRequest URL](self->_URLRequest, "URL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = +[LPPresentationSpecializations shouldAllowMultipleImagesForURL:](LPPresentationSpecializations, "shouldAllowMultipleImagesForURL:", v25);

    if (v26)
      objc_msgSend(v101, "setMaximumResponseCount:", 4);
    if (v89)
      objc_msgSend(v101, "setMaximumResponseCount:", 1);
    v27 = [LPFetcherGroup alloc];
    v130[0] = MEMORY[0x1E0C809B0];
    v130[1] = 3221225472;
    v130[2] = __40__LPMetadataProvider__fetchSubresources__block_invoke;
    v130[3] = &unk_1E44A8A20;
    v130[4] = self;
    v94 = -[LPFetcherGroup initWithPolicy:configuration:description:completionHandler:](v27, "initWithPolicy:configuration:description:completionHandler:", 2, v101, CFSTR("Images"), v130);
    v128 = 0u;
    v129 = 0u;
    v126 = 0u;
    v127 = 0u;
    -[LPLinkMetadata images](self->_metadata, "images");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v126, v135, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v127;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v127 != v30)
            objc_enumerationMutation(v28);
          v32 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * i);
          -[LPMetadataProvider subresourceFetcherConfiguration](self, "subresourceFetcherConfiguration");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          +[LPImageFetcher imageFetcherForConfiguration:](LPImageFetcher, "imageFetcherForConfiguration:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v32, "URL");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setURL:", v35);

          objc_msgSend(v34, "setUserData:", v32);
          objc_msgSend(v34, "setResponseClass:", objc_opt_class());
          -[LPFetcherGroup appendFetcher:](v94, "appendFetcher:", v34);

        }
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v126, v135, 16);
      }
      while (v29);
    }

    if (!v89)
      -[LPFetcherGroup doneAddingFetchers](v94, "doneAddingFetchers");
    -[NSMutableArray addObject:](self->_pendingFetchers, "addObject:", v94);

  }
  else
  {
    v94 = 0;
  }
  -[LPLinkMetadata contentImagesMetadata](self->_metadata, "contentImagesMetadata");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "count") == 0;

  if (v37 || !self->_shouldDownloadImageSubresources)
  {
    v96 = 0;
  }
  else
  {
    dispatch_group_enter((dispatch_group_t)self->_subresourceFetchGroup);
    v102 = (void *)objc_msgSend(v91, "copy");
    objc_msgSend(v102, "setMaximumResponseCount:", 4);
    v38 = [LPFetcherGroup alloc];
    v125[0] = MEMORY[0x1E0C809B0];
    v125[1] = 3221225472;
    v125[2] = __40__LPMetadataProvider__fetchSubresources__block_invoke_2;
    v125[3] = &unk_1E44A8A20;
    v125[4] = self;
    v96 = -[LPFetcherGroup initWithPolicy:configuration:description:completionHandler:](v38, "initWithPolicy:configuration:description:completionHandler:", 2, v102, CFSTR("Content Images"), v125);
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    -[LPLinkMetadata contentImagesMetadata](self->_metadata, "contentImagesMetadata");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v121, v134, 16);
    if (v40)
    {
      v41 = *(_QWORD *)v122;
      do
      {
        for (j = 0; j != v40; ++j)
        {
          if (*(_QWORD *)v122 != v41)
            objc_enumerationMutation(v39);
          v43 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * j);
          -[LPMetadataProvider subresourceFetcherConfiguration](self, "subresourceFetcherConfiguration");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          +[LPImageFetcher imageFetcherForConfiguration:](LPImageFetcher, "imageFetcherForConfiguration:", v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v43, "URL");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setURL:", v46);

          objc_msgSend(v45, "setUserData:", v43);
          objc_msgSend(v45, "setResponseClass:", objc_opt_class());
          -[LPFetcherGroup appendFetcher:](v96, "appendFetcher:", v45);

        }
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v121, v134, 16);
      }
      while (v40);
    }

    -[LPFetcherGroup doneAddingFetchers](v96, "doneAddingFetchers");
    -[NSMutableArray addObject:](self->_pendingFetchers, "addObject:", v96);

  }
  dispatch_group_enter((dispatch_group_t)self->_subresourceFetchGroup);
  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  -[LPLinkMetadata icons](self->_metadata, "icons");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "reverseObjectEnumerator");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v117, v133, 16);
  if (v49)
  {
    v50 = *(_QWORD *)v118;
    do
    {
      for (k = 0; k != v49; ++k)
      {
        if (*(_QWORD *)v118 != v50)
          objc_enumerationMutation(v48);
        v52 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * k);
        -[LPMetadataProvider subresourceFetcherConfiguration](self, "subresourceFetcherConfiguration");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        +[LPImageFetcher imageFetcherForConfiguration:](LPImageFetcher, "imageFetcherForConfiguration:", v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v52, "URL");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setURL:", v55);

        objc_msgSend(v54, "setUserData:", v52);
        objc_msgSend(v54, "setResponseClass:", objc_opt_class());
        -[LPFetcherGroup prependFetcher:](self->_iconFetcherGroup, "prependFetcher:", v54);

      }
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v117, v133, 16);
    }
    while (v49);
  }

  -[LPFetcherGroup doneAddingFetchers](self->_iconFetcherGroup, "doneAddingFetchers");
  -[LPLinkMetadata arAssets](self->_metadata, "arAssets");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "count") == 0;

  if (v57)
  {
    v103 = 0;
  }
  else
  {
    dispatch_group_enter((dispatch_group_t)self->_subresourceFetchGroup);
    v98 = (void *)objc_msgSend(v91, "copy");
    v58 = [LPFetcherGroup alloc];
    v116[0] = MEMORY[0x1E0C809B0];
    v116[1] = 3221225472;
    v116[2] = __40__LPMetadataProvider__fetchSubresources__block_invoke_3;
    v116[3] = &unk_1E44A8A20;
    v116[4] = self;
    v103 = -[LPFetcherGroup initWithPolicy:configuration:description:completionHandler:](v58, "initWithPolicy:configuration:description:completionHandler:", 1, v98, CFSTR("ARAssets"), v116);
    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    -[LPLinkMetadata arAssets](self->_metadata, "arAssets");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v112, v132, 16);
    if (v60)
    {
      v61 = *(_QWORD *)v113;
      do
      {
        for (m = 0; m != v60; ++m)
        {
          if (*(_QWORD *)v113 != v61)
            objc_enumerationMutation(v59);
          v63 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * m);
          v64 = objc_alloc_init(LPRawURLContentsFetcher);
          objc_msgSend(v63, "URL");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPRawURLContentsFetcher setURL:](v64, "setURL:", v65);

          -[LPFetcher setUserData:](v64, "setUserData:", v63);
          -[LPFetcher setResponseClass:](v64, "setResponseClass:", objc_opt_class());
          -[LPFetcherGroup appendFetcher:](v103, "appendFetcher:", v64);

        }
        v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v112, v132, 16);
      }
      while (v60);
    }

    -[LPFetcherGroup doneAddingFetchers](v103, "doneAddingFetchers");
    -[NSMutableArray addObject:](self->_pendingFetchers, "addObject:", v103);

  }
  if (!objc_msgSend(v92, "count"))
  {
    v99 = 0;
    if (!v89)
      goto LABEL_72;
    goto LABEL_71;
  }
  dispatch_group_enter((dispatch_group_t)self->_subresourceFetchGroup);
  v66 = [LPFetcherGroup alloc];
  v111[0] = MEMORY[0x1E0C809B0];
  v111[1] = 3221225472;
  v111[2] = __40__LPMetadataProvider__fetchSubresources__block_invoke_4;
  v111[3] = &unk_1E44A8A20;
  v111[4] = self;
  v99 = -[LPFetcherGroup initWithPolicy:configuration:description:completionHandler:](v66, "initWithPolicy:configuration:description:completionHandler:", 1, v91, CFSTR("Videos"), v111);
  if (!self->_shouldDownloadMediaSubresources)
  {
    v67 = LPLogChannelFetching();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      v68 = self->_loggingID;
      *(_DWORD *)buf = 67109120;
      v137 = v68;
      _os_log_impl(&dword_1A0C41000, v67, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: only fetching metadata for media subresources because _shouldDownloadMediaSubresources is not set", buf, 8u);
    }
  }
  v110 = 0u;
  v108 = 0u;
  v109 = 0u;
  v107 = 0u;
  v69 = v92;
  v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v107, v131, 16);
  if (v70)
  {
    v71 = *(_QWORD *)v108;
    do
    {
      for (n = 0; n != v70; ++n)
      {
        if (*(_QWORD *)v108 != v71)
          objc_enumerationMutation(v69);
        v73 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * n);
        v74 = objc_alloc_init(LPMediaAssetFetcher);
        -[LPMediaAssetFetcher setShouldDownloadIfPossible:](v74, "setShouldDownloadIfPossible:", self->_shouldDownloadMediaSubresources);
        objc_opt_class();
        objc_opt_isKindOfClass();
        objc_msgSend(v73, "URL");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPMediaAssetFetcher setURL:](v74, "setURL:", v75);

        -[LPFetcher setUserData:](v74, "setUserData:", v73);
        -[LPFetcherGroup appendFetcher:](v99, "appendFetcher:", v74);

      }
      v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v107, v131, 16);
    }
    while (v70);
  }

  -[LPFetcherGroup doneAddingFetchers](v99, "doneAddingFetchers");
  -[NSMutableArray addObject:](self->_pendingFetchers, "addObject:", v99);
  if (v89)
  {
LABEL_71:
    v105[0] = MEMORY[0x1E0C809B0];
    v105[1] = 3221225472;
    v105[2] = __40__LPMetadataProvider__fetchSubresources__block_invoke_99;
    v105[3] = &unk_1E44A8F60;
    v105[4] = self;
    v106 = v94;
    -[LPMetadataProvider _fetchAssociatedApplicationMetadataWithCompletionHandler:](self, "_fetchAssociatedApplicationMetadataWithCompletionHandler:", v105);

  }
LABEL_72:
  v76 = -[LPFetcherGroup loggingID](v99, "loggingID");
  v77 = (id)LPLogChannelFetching();
  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
  {
    v78 = self->_loggingID;
    v79 = -[LPFetcherGroup loggingID](v94, "loggingID");
    v80 = -[LPFetcherGroup loggingID](v96, "loggingID");
    v81 = -[LPFetcherGroup loggingID](self->_iconFetcherGroup, "loggingID");
    v82 = -[LPFetcherGroup loggingID](v103, "loggingID");
    *(_DWORD *)buf = 67110400;
    v137 = v78;
    v138 = 1024;
    *(_DWORD *)v139 = v79;
    *(_WORD *)&v139[4] = 1024;
    *(_DWORD *)&v139[6] = v80;
    LOWORD(v140) = 1024;
    *(_DWORD *)((char *)&v140 + 2) = v81;
    HIWORD(v140) = 1024;
    *(_DWORD *)v141 = v82;
    *(_WORD *)&v141[4] = 1024;
    *(_DWORD *)&v141[6] = v76;
    _os_log_impl(&dword_1A0C41000, v77, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: started subresource fetcher group ids: images=%d, contentImages=%d, icons=%d, arAssets=%d, media=%d", buf, 0x26u);
  }

  subresourceFetchGroup = self->_subresourceFetchGroup;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__LPMetadataProvider__fetchSubresources__block_invoke_101;
  block[3] = &unk_1E44A7CE8;
  block[4] = self;
  dispatch_group_notify(subresourceFetchGroup, MEMORY[0x1E0C80D38], block);

}

void __40__LPMetadataProvider__fetchSubresources__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  v10 = v3;
  if (v3)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("image"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v4, "count") >= 2)
    {
      objc_msgSend(v4, "subarrayWithRange:", 1, objc_msgSend(v4, "count") - 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setAlternateImages:", v5);

    }
    objc_msgSend(v10, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setImage:", v7);

    objc_msgSend(v10, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setImageMetadata:", v9);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "_invokePendingAsynchronousLoadUpdateHandlers");
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 112));

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 112));
  }

}

void __40__LPMetadataProvider__fetchSubresources__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (v3)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("image"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v5 = a1 + 32;
    objc_msgSend(*(id *)(v6 + 80), "setContentImages:", v4);

    objc_msgSend(v8, "valueForKey:", CFSTR("userData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)v5 + 80), "setContentImagesMetadata:", v7);

    objc_msgSend(*(id *)(*(_QWORD *)v5 + 80), "_invokePendingAsynchronousLoadUpdateHandlers");
  }
  else
  {
    v5 = a1 + 32;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)v5 + 112));

}

void __40__LPMetadataProvider__fetchSubresources__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  v10 = v3;
  if (v3)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arAsset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v6 = a1 + 32;
    objc_msgSend(*(id *)(v7 + 80), "setArAsset:", v5);

    objc_msgSend(v10, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)v6 + 80), "setArAssetMetadata:", v9);

    objc_msgSend(*(id *)(*(_QWORD *)v6 + 80), "_invokePendingAsynchronousLoadUpdateHandlers");
  }
  else
  {
    v6 = a1 + 32;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)v6 + 112));

}

void __40__LPMetadataProvider__fetchSubresources__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  LPVideoMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  LPAudioMetadata *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;

  objc_msgSend(a2, "firstObject");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v22, "video");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setVideo:", v3);

      objc_msgSend(v22, "userData");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_alloc_init(LPVideoMetadata);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setVideoMetadata:", v5);

      objc_msgSend(v4, "URL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "videoMetadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setURL:", v6);

      objc_msgSend(v4, "type");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "videoMetadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setType:", v8);

      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_9:

        goto LABEL_10;
      }
      objc_msgSend(v4, "size");
      v11 = v10;
      v13 = v12;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "videoMetadata");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setSize:", v11, v13);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_10:
        v21 = *(_QWORD *)(a1 + 32);
        v15 = a1 + 32;
        objc_msgSend(*(id *)(v21 + 80), "_invokePendingAsynchronousLoadUpdateHandlers");
        goto LABEL_11;
      }
      objc_msgSend(v22, "audio");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setAudio:", v16);

      objc_msgSend(v22, "userData");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_alloc_init(LPAudioMetadata);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setAudioMetadata:", v17);

      objc_msgSend(v4, "URL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "audioMetadata");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setURL:", v18);

      objc_msgSend(v4, "type");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "audioMetadata");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setType:", v14);

    }
    goto LABEL_9;
  }
  v15 = a1 + 32;
LABEL_11:
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)v15 + 112));

}

void __40__LPMetadataProvider__fetchSubresources__block_invoke_99(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "clipHeroImageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "subresourceFetcherConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[LPImageFetcher imageFetcherForConfiguration:](LPImageFetcher, "imageFetcherForConfiguration:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "clipHeroImageURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setURL:", v6);

    objc_msgSend(v5, "setResponseClass:", objc_opt_class());
    objc_msgSend(*(id *)(a1 + 40), "appendFetcher:", v5);

  }
  objc_msgSend(*(id *)(a1 + 40), "doneAddingFetchers");

}

uint64_t __40__LPMetadataProvider__fetchSubresources__block_invoke_101(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "video");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)v2 + 80), "audio");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (id)LPLogChannelFetching();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_DWORD *)(v6 + 8);
    objc_msgSend(*(id *)(v6 + 80), "image");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "contentImages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "icon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "arAsset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67110656;
    v15 = v7;
    v16 = 1024;
    v17 = v13 != 0;
    v18 = 2048;
    v19 = v9;
    v20 = 1024;
    v21 = v10 != 0;
    v22 = 1024;
    v23 = v11 != 0;
    v24 = 1024;
    v25 = v3 != 0;
    v26 = 1024;
    v27 = v4 != 0;
    _os_log_impl(&dword_1A0C41000, v5, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: subresource fetch finished: got image=%d, contentImages=%lu, icons=%d, arAssets=%d, video=%d, audio=%d", buf, 0x30u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_completedWithError:", 0);
}

- (void)_fetchAssociatedApplicationMetadataWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  LPFetcherGroup *v6;
  id v7;
  LPFetcherGroup *v8;
  LPAssociatedApplicationMetadataFetcher *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  LPMetadataProvider *v18;
  id v19;

  v4 = a3;
  dispatch_group_enter((dispatch_group_t)self->_subresourceFetchGroup);
  -[LPMetadataProvider subresourceFetcherConfiguration](self, "subresourceFetcherConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [LPFetcherGroup alloc];
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __79__LPMetadataProvider__fetchAssociatedApplicationMetadataWithCompletionHandler___block_invoke;
  v17 = &unk_1E44A8F88;
  v7 = v4;
  v18 = self;
  v19 = v7;
  v8 = -[LPFetcherGroup initWithPolicy:configuration:description:completionHandler:](v6, "initWithPolicy:configuration:description:completionHandler:", 1, v5, CFSTR("App Clip Icon URL"), &v14);
  v9 = objc_alloc_init(LPAssociatedApplicationMetadataFetcher);
  -[LPLinkMetadata URL](self->_metadata, "URL", v14, v15, v16, v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    -[LPLinkMetadata originalURL](self->_metadata, "originalURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[LPAssociatedApplicationMetadataFetcher setURL:](v9, "setURL:", v11);
  if (!v10)

  -[LPLinkMetadata associatedApplication](self->_metadata, "associatedApplication");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPAssociatedApplicationMetadataFetcher setBundleIdentifier:](v9, "setBundleIdentifier:", v13);

  -[LPFetcherGroup appendFetcher:](v8, "appendFetcher:", v9);
  -[LPFetcherGroup doneAddingFetchers](v8, "doneAddingFetchers");
  -[NSMutableArray addObject:](self->_pendingFetchers, "addObject:", v8);

}

void __79__LPMetadataProvider__fetchAssociatedApplicationMetadataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  LPImageProperties *v14;
  LPImage *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;

  objc_msgSend(a2, "firstObject");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = v21;
    objc_msgSend(v3, "metadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clipCaption");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "associatedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCaption:", v5);

    objc_msgSend(v3, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clipOpenButtonTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "associatedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAction:", v8);

    objc_msgSend(v3, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "clipAction");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "associatedApplication");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setClipAction:", v11);

    objc_msgSend(v3, "iconURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v13, "isFileURL");

    if ((_DWORD)v12)
    {
      v14 = objc_alloc_init(LPImageProperties);
      -[LPImageProperties setType:](v14, "setType:", 6);
      v15 = [LPImage alloc];
      objc_msgSend(v3, "iconURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[LPImage initByReferencingFileURL:MIMEType:properties:](v15, "initByReferencingFileURL:MIMEType:properties:", v16, CFSTR("image/png"), v14);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "associatedApplication");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setIcon:", v17);

    }
    v19 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "metadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 112));

}

- (void)_redistinguishImagesAndIcons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  BOOL v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  LPIconMetadata *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  LPARAssetMetadata *v40;
  void *v41;
  id v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id obj;
  void *v50;
  id v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  -[LPLinkMetadata arAssets](self->_metadata, "arAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_msgSend(v3, "mutableCopy");

  -[LPLinkMetadata icons](self->_metadata, "icons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend(v4, "mutableCopy");

  -[LPLinkMetadata images](self->_metadata, "images");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v5, "mutableCopy");

  -[LPLinkMetadata contentImagesMetadata](self->_metadata, "contentImagesMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(v6, "mutableCopy");

  v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!objc_msgSend(v46, "count"))
  {
    if (objc_msgSend(v47, "count"))
    {
      -[NSURLRequest URL](self->_URLRequest, "URL");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = +[LPPresentationSpecializations shouldAllowHoistingContentImagesForURL:](LPPresentationSpecializations, "shouldAllowHoistingContentImagesForURL:", v43);

      if (v44)
      {
        objc_msgSend(v47, "firstObject");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addObject:", v45);

        objc_msgSend(v47, "removeObjectAtIndex:", 0);
      }
    }
  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v46;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v62 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        objc_msgSend(v11, "URL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = +[LPPresentationSpecializations isTwitterProfileImageURL:](LPPresentationSpecializations, "isTwitterProfileImageURL:", v12);

        if (v13)
          objc_msgSend(v7, "addObject:", v11);
        if (+[LPPresentationSpecializations isTwitterSummaryCardMetadata:](LPPresentationSpecializations, "isTwitterSummaryCardMetadata:", self->_metadata)&& +[LPPresentationSpecializations isArticleWithActivityPub:](LPPresentationSpecializations, "isArticleWithActivityPub:", self->_metadata))
        {
          objc_msgSend(v7, "addObject:", v11);
        }
        objc_msgSend(v11, "URL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[LPPresentationSpecializations isAppleNewsURL:](LPPresentationSpecializations, "isAppleNewsURL:", v14))
        {

        }
        else
        {
          -[NSURLRequest URL](self->_URLRequest, "URL");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = +[LPPresentationSpecializations isStocksNewsURL:](LPPresentationSpecializations, "isStocksNewsURL:", v15);

          if (!v16)
            goto LABEL_16;
        }
        objc_msgSend(v7, "addObject:", v11);
LABEL_16:
        objc_msgSend(v11, "URL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = +[LPPresentationSpecializations isRedditStaticImage:](LPPresentationSpecializations, "isRedditStaticImage:", v17);

        if (v18)
          objc_msgSend(v7, "addObject:", v11);
        -[NSURLRequest URL](self->_URLRequest, "URL");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = +[LPPresentationSpecializations isWebexSiteURL:](LPPresentationSpecializations, "isWebexSiteURL:", v19);

        if (v20)
          objc_msgSend(v51, "addObject:", v11);
        objc_msgSend(v11, "URL");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = +[LPPresentationSpecializations isKnownBlankImageURL:](LPPresentationSpecializations, "isKnownBlankImageURL:", v21);

        if (v22)
          objc_msgSend(v51, "addObject:", v11);
        -[NSURLRequest URL](self->_URLRequest, "URL");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[LPPresentationSpecializations isStockSymbolURL:](LPPresentationSpecializations, "isStockSymbolURL:", v23))
        {
          v24 = objc_msgSend(v52, "count") == 0;

          if (!v24)
            objc_msgSend(v51, "addObject:", v11);
        }
        else
        {

        }
        objc_msgSend(v11, "type");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = +[LPMIMETypeRegistry isARAssetType:](LPMIMETypeRegistry, "isARAssetType:", v25);

        if (v26)
          objc_msgSend(v48, "addObject:", v11);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
    }
    while (v8);
  }

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  objc_msgSend(v7, "reverseObjectEnumerator");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v58 != v29)
          objc_enumerationMutation(v27);
        v31 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
        v32 = [LPIconMetadata alloc];
        objc_msgSend(v31, "URL");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = -[LPIconMetadata _initWithURL:](v32, "_initWithURL:", v33);

        objc_msgSend(v52, "insertObject:atIndex:", v34, 0);
      }
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    }
    while (v28);
  }

  objc_msgSend(obj, "removeObjectsInArray:", v7);
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v48, "reverseObjectEnumerator");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
  if (v36)
  {
    v37 = *(_QWORD *)v54;
    do
    {
      for (k = 0; k != v36; ++k)
      {
        if (*(_QWORD *)v54 != v37)
          objc_enumerationMutation(v35);
        v39 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * k);
        v40 = [LPARAssetMetadata alloc];
        objc_msgSend(v39, "URL");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = -[LPARAssetMetadata _initWithURL:](v40, "_initWithURL:", v41);

        objc_msgSend(v50, "insertObject:atIndex:", v42, 0);
      }
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
    }
    while (v36);
  }

  objc_msgSend(obj, "removeObjectsInArray:", v48);
  objc_msgSend(obj, "removeObjectsInArray:", v51);
  -[LPLinkMetadata setIcons:](self->_metadata, "setIcons:", v52);
  -[LPLinkMetadata setImages:](self->_metadata, "setImages:", obj);
  -[LPLinkMetadata setArAssets:](self->_metadata, "setArAssets:", v50);
  -[LPLinkMetadata setContentImagesMetadata:](self->_metadata, "setContentImagesMetadata:", v47);

}

- (void)_simplifyTitle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[LPLinkMetadata title](self->_metadata, "title");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata setOriginalTitle:](self->_metadata, "setOriginalTitle:");

  -[LPLinkMetadata title](self->_metadata, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[LPLinkMetadata title](self->_metadata, "title");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[NSURLRequest URL](self->_URLRequest, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[LPPresentationSpecializations articleTitleFromTitle:withURL:](LPPresentationSpecializations, "articleTitleFromTitle:withURL:", v7, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setTitle:](self->_metadata, "setTitle:", v5);

  }
}

- (void)_propagateYouTubeTimestamps
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  -[NSURLRequest URL](self->_URLRequest, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[LPPresentationSpecializations youTubeVideoComponentsForVideoURL:](LPPresentationSpecializations, "youTubeVideoComponentsForVideoURL:", v3);
  v27 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v27;
  if (v27)
  {
    objc_msgSend(v27, "startTime");
    v4 = v27;
    if (v5 != 0.0)
    {
      -[LPLinkMetadata videos](self->_metadata, "videos");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      v4 = v27;
      if (v7 == 1)
      {
        -[LPLinkMetadata videos](self->_metadata, "videos");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "URL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[LPPresentationSpecializations youTubeVideoComponentsForEmbedURL:](LPPresentationSpecializations, "youTubeVideoComponentsForEmbedURL:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v11, "startTime");
          if (v12 == 0.0)
          {
            -[LPLinkMetadata videos](self->_metadata, "videos");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "URL");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "_lp_components");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "queryItems");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = (void *)MEMORY[0x1E0CB39D8];
            v19 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v27, "startTime");
            objc_msgSend(v19, "numberWithDouble:");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "stringValue");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "queryItemWithName:value:", CFSTR("start"), v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "arrayByAddingObject:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setQueryItems:", v23);

            objc_msgSend(v16, "URL");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[LPLinkMetadata videos](self->_metadata, "videos");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setURL:", v24);

          }
        }

        v4 = v27;
      }
    }
  }

}

- (void)_failedWithErrorCode:(int64_t)a3 underlyingError:(id)a4
{
  id v6;
  NSObject *v7;
  unsigned int loggingID;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = LPLogChannelFetching();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    loggingID = self->_loggingID;
    v10[0] = 67109376;
    v10[1] = loggingID;
    v11 = 2048;
    v12 = a3;
    _os_log_impl(&dword_1A0C41000, v7, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: fetch failed with error code %ld", (uint8_t *)v10, 0x12u);
  }
  makeLPError(a3, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPMetadataProvider _completedWithError:](self, "_completedWithError:", v9);

}

- (void)_completedWithError:(id)a3
{
  id v4;
  NSObject *v5;
  unsigned int loggingID;
  _BOOL4 v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSMutableArray *pendingFetchers;
  LPEvent *mainResourceLoadEvent;
  LPEvent *webProcessLaunchEvent;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  LPMetadataProvider *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  unsigned int v31;
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  _BOOL4 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = LPLogChannelFetching();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    loggingID = self->_loggingID;
    v7 = self->_metadata != 0;
    *(_DWORD *)buf = 67109632;
    v31 = loggingID;
    v32 = 1024;
    v33 = v7;
    v34 = 1024;
    v35 = v4 != 0;
    _os_log_impl(&dword_1A0C41000, v5, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: starting postprocessing (has metadata=%d, has error=%d)", buf, 0x14u);
  }
  if (!self->_complete)
  {
    self->_complete = 1;
    v8 = (void *)-[NSMutableArray copy](self->_pendingFetchers, "copy");
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "cancel");
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v10);
    }

    pendingFetchers = self->_pendingFetchers;
    self->_pendingFetchers = 0;

    -[LPAnimatedImageTranscoder cancel](self->_imageTranscoder, "cancel");
    -[LPEvent didCompleteWithStatus:](self->_mainResourceLoadEvent, "didCompleteWithStatus:", 4);
    mainResourceLoadEvent = self->_mainResourceLoadEvent;
    self->_mainResourceLoadEvent = 0;

    -[LPEvent didCompleteWithStatus:](self->_webProcessLaunchEvent, "didCompleteWithStatus:", 4);
    webProcessLaunchEvent = self->_webProcessLaunchEvent;
    self->_webProcessLaunchEvent = 0;

    -[LPLinkMetadata setOriginalURL:](self->_metadata, "setOriginalURL:", self->_originalURL);
    -[LPLinkMetadata URL](self->_metadata, "URL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16 == 0;

    if (v17)
    {
      -[NSURLRequest URL](self->_URLRequest, "URL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPLinkMetadata setURL:](self->_metadata, "setURL:", v18);

    }
    if (self->_fetchIsNotUserInitiated)
      -[LPLinkMetadata _setIncomplete:](self->_metadata, "_setIncomplete:", 1);
    -[LPEvent childWithType:subtitle:](self->_event, "childWithType:subtitle:", 5, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __42__LPMetadataProvider__completedWithError___block_invoke;
    v21[3] = &unk_1E44A8DD0;
    v22 = v19;
    v23 = self;
    v24 = v4;
    v20 = v19;
    -[LPMetadataProvider _postProcessResolvedMetadataWithEvent:completionHandler:](self, "_postProcessResolvedMetadataWithEvent:completionHandler:", v20, v21);

  }
}

void __42__LPMetadataProvider__completedWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  objc_msgSend(*(id *)(a1 + 32), "didCompleteWithStatus:", 1);
  v2 = *(_QWORD *)(a1 + 40);
  if (!*(_BYTE *)(v2 + 89))
  {
    objc_msgSend(*(id *)(v2 + 16), "_close");
    v2 = *(_QWORD *)(a1 + 40);
  }
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__3;
  v18[4] = __Block_byref_object_dispose__3;
  v19 = *(id *)(v2 + 16);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = 0;

  v5 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v5 + 92))
  {
    v6 = 4;
  }
  else
  {
    v7 = objc_msgSend((id)v5, "cancelled");
    v5 = *(_QWORD *)(a1 + 40);
    if ((v7 & 1) != 0)
    {
      v6 = 3;
    }
    else if (*(_QWORD *)(v5 + 80) && !*(_QWORD *)(a1 + 48))
    {
      v6 = 1;
    }
    else
    {
      v6 = 2;
    }
  }
  objc_msgSend(*(id *)(v5 + 56), "didCompleteWithStatus:", v6);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__115;
  v16[4] = __Block_byref_object_dispose__116;
  v17 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 40) + 176));
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(v8 + 176);
  *(_QWORD *)(v8 + 176) = 0;

  +[LPMetadataProvider _callbackQueue](LPMetadataProvider, "_callbackQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__LPMetadataProvider__completedWithError___block_invoke_117;
  v12[3] = &unk_1E44A8FD8;
  v11 = *(void **)(a1 + 48);
  v12[4] = *(_QWORD *)(a1 + 40);
  v13 = v11;
  v14 = v16;
  v15 = v18;
  dispatch_async(v10, v12);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);

}

void __42__LPMetadataProvider__completedWithError___block_invoke_117(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[6];
  uint8_t buf[4];
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = LPLogChannelFetching();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = *(_DWORD *)(v3 + 8);
    LODWORD(v3) = *(_QWORD *)(v3 + 80) != 0;
    v5 = a1[5] != 0;
    *(_DWORD *)buf = 67109632;
    v11 = v4;
    v12 = 1024;
    v13 = v3;
    v14 = 1024;
    v15 = v5;
    _os_log_impl(&dword_1A0C41000, v2, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: completed (has metadata=%d, has error=%d)", buf, 0x14u);
  }
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) + 16))();
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__LPMetadataProvider__completedWithError___block_invoke_118;
  v9[3] = &unk_1E44A8FB0;
  v8 = a1[7];
  v9[4] = a1[4];
  v9[5] = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v9);
}

uint64_t __42__LPMetadataProvider__completedWithError___block_invoke_118(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  +[LPMetadataProvider _incompleteMetadataRequests](LPMetadataProvider, "_incompleteMetadataRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  +[LPMetadataProvider _incompleteMetadataRequests](LPMetadataProvider, "_incompleteMetadataRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 32));

  objc_sync_exit(v4);
  v6 = LPLogChannelFetching();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9[0] = 67109120;
    v9[1] = v7;
    _os_log_impl(&dword_1A0C41000, v6, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: invalidating process assertion", (uint8_t *)v9, 8u);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "invalidate");
}

- (void)_postProcessResolvedMetadataWithEvent:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (self->_metadata)
  {
    +[LPMetadataProvider _postProcessingQueue](LPMetadataProvider, "_postProcessingQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__LPMetadataProvider__postProcessResolvedMetadataWithEvent_completionHandler___block_invoke;
    block[3] = &unk_1E44A8220;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(v8, block);

  }
  else
  {
    dispatch_async(MEMORY[0x1E0C80D38], v7);
  }

}

void __78__LPMetadataProvider__postProcessResolvedMetadataWithEvent_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __78__LPMetadataProvider__postProcessResolvedMetadataWithEvent_completionHandler___block_invoke_2;
  v3[3] = &unk_1E44A8418;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_internalPostProcessResolvedMetadataWithEvent:completionHandler:", v2, v3);

}

void __78__LPMetadataProvider__postProcessResolvedMetadataWithEvent_completionHandler___block_invoke_2(uint64_t a1)
{
  dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
}

- (BOOL)_firstImage:(id)a3 isSimilarToSecondImage:(id)a4 usingAnalyzer:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  float v14;
  BOOL v15;
  NSObject *v17;
  unsigned int loggingID;
  float v19;
  id v20;
  uint8_t buf[4];
  unsigned int v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  objc_msgSend(v10, "computeSimilarityOf:with:error:", v8, v9, &v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v20;
  if (v12)
  {
    v13 = LPLogChannelFetching();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[LPMetadataProvider _firstImage:isSimilarToSecondImage:usingAnalyzer:].cold.1();
    goto LABEL_5;
  }
  objc_msgSend(v11, "floatValue");
  if (v14 > 0.5)
  {
LABEL_5:
    v15 = 0;
    goto LABEL_6;
  }
  v17 = (id)LPLogChannelFetching();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    loggingID = self->_loggingID;
    objc_msgSend(v11, "floatValue");
    *(_DWORD *)buf = 67109376;
    v22 = loggingID;
    v23 = 2048;
    v24 = v19;
    _os_log_impl(&dword_1A0C41000, v17, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: discarding content image because it is a duplicate. (similarity score %f)", buf, 0x12u);
  }

  v15 = 1;
LABEL_6:

  return v15;
}

- (void)_filteredUniqueContentImages:(id)a3
{
  id v4;
  void *v5;
  unint64_t i;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  id v24;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; ++i)
  {
    -[LPLinkMetadata contentImages](self->_metadata, "contentImages");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (i >= v8)
      break;
    -[LPLinkMetadata contentImages](self->_metadata, "contentImages");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", i);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[LPLinkMetadata contentImagesMetadata](self->_metadata, "contentImagesMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", i);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setObject:forKey:", v12, v10);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[LPMetadataProvider _visionAnalysisQueue](LPMetadataProvider, "_visionAnalysisQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__LPMetadataProvider__filteredUniqueContentImages___block_invoke;
  block[3] = &unk_1E44A9028;
  block[4] = self;
  v21 = v13;
  v22 = v5;
  v23 = v14;
  v24 = v4;
  v16 = v4;
  v17 = v14;
  v18 = v5;
  v19 = v13;
  dispatch_async(v15, block);

}

void __51__LPMetadataProvider__filteredUniqueContentImages___block_invoke(uint64_t a1)
{
  _TtC16LinkPresentation16LPVisionAnalyzer *v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[2];
  BOOL (*v27)(uint64_t);
  void *v28;
  uint64_t v29;
  id v30;
  _TtC16LinkPresentation16LPVisionAnalyzer *v31;
  unint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(_TtC16LinkPresentation16LPVisionAnalyzer);
  v3 = 0;
  v4 = MEMORY[0x1E0C809B0];
  while (1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "contentImages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v3 < objc_msgSend(v5, "count");

    if (!v6)
      break;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "contentImages");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(id **)(a1 + 32);
    objc_msgSend(v9[10], "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = objc_msgSend(v9, "_firstImage:isSimilarToSecondImage:usingAnalyzer:", v10, v8, v2);

    if ((v9 & 1) == 0)
    {
      v26[0] = v4;
      v26[1] = 3221225472;
      v27 = __51__LPMetadataProvider__filteredUniqueContentImages___block_invoke_2;
      v28 = &unk_1E44A9000;
      v11 = *(_QWORD *)(a1 + 32);
      v32 = v3;
      v29 = v11;
      v12 = v8;
      v30 = v12;
      v31 = v2;
      if ((((uint64_t (*)(_QWORD *))v27)(v26) & 1) == 0)
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);

    }
    ++v3;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = *(id *)(a1 + 40);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v23;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(a1 + 48), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
    }
    while (v14);
  }

  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __51__LPMetadataProvider__filteredUniqueContentImages___block_invoke_3;
  block[3] = &unk_1E44A7D60;
  v21 = *(id *)(a1 + 64);
  v19 = *(id *)(a1 + 40);
  v20 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

BOOL __51__LPMetadataProvider__filteredUniqueContentImages___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 56) + 1;
  do
  {
    v3 = v2;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "contentImages");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v3 >= v5)
      break;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "contentImages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v6) = objc_msgSend(*(id *)(a1 + 32), "_firstImage:isSimilarToSecondImage:usingAnalyzer:", *(_QWORD *)(a1 + 40), v7, *(_QWORD *)(a1 + 48));
    v2 = v3 + 1;
  }
  while (!(_DWORD)v6);
  return v3 < v5;
}

uint64_t __51__LPMetadataProvider__filteredUniqueContentImages___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)deduplicateContentImagesWithEvent:(id)a3 inGroup:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  BOOL v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  LPMetadataProvider *v13;
  NSObject *v14;

  v6 = a3;
  v7 = a4;
  -[LPLinkMetadata contentImages](self->_metadata, "contentImages");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "count"))
    goto LABEL_4;
  v9 = +[LPTestingOverrides forceDisableImageDeduplication](LPTestingOverrides, "forceDisableImageDeduplication");

  if (!v9)
  {
    objc_msgSend(v6, "childWithType:subtitle:", 9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v7);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__LPMetadataProvider_deduplicateContentImagesWithEvent_inGroup___block_invoke;
    v11[3] = &unk_1E44A9050;
    v12 = v10;
    v13 = self;
    v14 = v7;
    v8 = v10;
    -[LPMetadataProvider _filteredUniqueContentImages:](self, "_filteredUniqueContentImages:", v11);

LABEL_4:
  }

}

void __64__LPMetadataProvider_deduplicateContentImagesWithEvent_inGroup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "didCompleteWithStatus:", 1);
  if (objc_msgSend(v8, "count"))
    v6 = v8;
  else
    v6 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "setContentImages:", v6);
  if (objc_msgSend(v5, "count"))
    v7 = v5;
  else
    v7 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "setContentImagesMetadata:", v7);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

- (void)_internalPostProcessResolvedMetadataWithEvent:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  dispatch_group_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  LPAnimatedImageTranscoder *v19;
  void *v20;
  LPAnimatedImageTranscoder *v21;
  LPAnimatedImageTranscoder *imageTranscoder;
  LPAnimatedImageTranscoder *v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *group;
  _QWORD v49[5];
  id v50;
  _QWORD v51[4];
  id v52;
  NSObject *v53;
  _QWORD v54[5];
  NSObject *v55;
  _QWORD v56[5];
  id v57;
  NSObject *v58;
  _QWORD block[4];
  id v60;
  NSObject *v61;
  _QWORD v62[5];
  id v63;
  NSObject *v64;
  NSObject *v65;
  _QWORD v66[5];
  NSObject *v67;
  _QWORD v68[5];
  NSObject *v69;
  _QWORD v70[4];
  id v71;
  LPMetadataProvider *v72;
  NSObject *v73;
  id v74;
  _QWORD aBlock[4];
  NSObject *v76;
  LPMetadataProvider *v77;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_group_create();
  v9 = dispatch_group_create();
  group = dispatch_group_create();
  v45 = v7;
  objc_msgSend(v6, "childWithType:subtitle:", 8, 0, v9, v8, v6);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke;
  aBlock[3] = &unk_1E44A7D10;
  v11 = v9;
  v76 = v11;
  v77 = self;
  v12 = _Block_copy(aBlock);
  v47 = v12;
  -[LPLinkMetadata video](self->_metadata, "video");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

  }
  else
  {
    -[LPLinkMetadata image](self->_metadata, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "_isAnimated");

    if (v15)
    {
      dispatch_group_enter(v8);
      -[LPEvent childWithType:subtitle:](self->_event, "childWithType:subtitle:", 6, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPLinkMetadata imageMetadata](self->_metadata, "imageMetadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "URL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setURL:", v18);

      v19 = [LPAnimatedImageTranscoder alloc];
      -[LPLinkMetadata image](self->_metadata, "image");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[LPAnimatedImageTranscoder initWithAnimatedImage:](v19, "initWithAnimatedImage:", v20);
      imageTranscoder = self->_imageTranscoder;
      self->_imageTranscoder = v21;

      v23 = self->_imageTranscoder;
      v70[0] = v10;
      v70[1] = 3221225472;
      v70[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_125;
      v70[3] = &unk_1E44A90A0;
      v24 = v16;
      v71 = v24;
      v72 = self;
      v74 = v47;
      v73 = v8;
      -[LPAnimatedImageTranscoder transcodeWithCompletionHandler:](v23, "transcodeWithCompletionHandler:", v70);

      goto LABEL_6;
    }
  }
  (*((void (**)(void *))v12 + 2))(v12);
LABEL_6:
  dispatch_group_enter(v11);
  -[LPLinkMetadata icon](self->_metadata, "icon");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v10;
  v68[1] = 3221225472;
  v68[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_2_127;
  v68[3] = &unk_1E44A9078;
  v68[4] = self;
  v26 = v11;
  v69 = v26;
  fitImageInSize(v25, v68, 1024.0, 1024.0);

  dispatch_group_enter(v26);
  -[LPLinkMetadata alternateImages](self->_metadata, "alternateImages");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v10;
  v66[1] = 3221225472;
  v66[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_3;
  v66[3] = &unk_1E44A90C8;
  v66[4] = self;
  v28 = v26;
  v67 = v28;
  fitImagesInSize(v27, v66, 1024.0, 1024.0);

  dispatch_group_enter(v28);
  -[LPLinkMetadata contentImages](self->_metadata, "contentImages");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v10;
  v62[1] = 3221225472;
  v62[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_128;
  v62[3] = &unk_1E44A90F0;
  v62[4] = self;
  v30 = v6;
  v63 = v30;
  v31 = v8;
  v64 = v31;
  v32 = v28;
  v65 = v32;
  fitImagesInSize(v29, v62, 1024.0, 1024.0);

  dispatch_group_enter(v31);
  +[LPMetadataProvider _postProcessingQueue](LPMetadataProvider, "_postProcessingQueue");
  v33 = objc_claimAutoreleasedReturnValue();
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_129;
  block[3] = &unk_1E44A7D10;
  v34 = v46;
  v60 = v34;
  v35 = v31;
  v61 = v35;
  dispatch_group_notify(v32, v33, block);

  if (self->_webView)
  {
    objc_msgSend(v30, "childWithType:subtitle:", 10, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v35);
    v56[0] = v10;
    v56[1] = 3221225472;
    v56[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_2_130;
    v56[3] = &unk_1E44A8DD0;
    v56[4] = self;
    v57 = v36;
    v58 = v35;
    v37 = v36;
    dispatch_async(MEMORY[0x1E0C80D38], v56);

  }
  if (self->_specializedMetadataProvider)
  {
    objc_msgSend(v30, "childWithType:subtitle:", 11, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v35);
    dispatch_group_enter(group);
    +[LPMetadataProvider _postProcessingQueue](LPMetadataProvider, "_postProcessingQueue");
    v39 = objc_claimAutoreleasedReturnValue();
    v54[0] = v10;
    v54[1] = 3221225472;
    v54[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_4;
    v54[3] = &unk_1E44A7D10;
    v54[4] = self;
    v40 = group;
    v55 = v40;
    dispatch_group_notify(v32, v39, v54);

    +[LPMetadataProvider _postProcessingQueue](LPMetadataProvider, "_postProcessingQueue");
    v41 = objc_claimAutoreleasedReturnValue();
    v51[0] = v10;
    v51[1] = 3221225472;
    v51[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_6;
    v51[3] = &unk_1E44A7D10;
    v52 = v38;
    v53 = v35;
    v42 = v38;
    dispatch_group_notify(v40, v41, v51);

  }
  +[LPMetadataProvider _postProcessingQueue](LPMetadataProvider, "_postProcessingQueue");
  v43 = objc_claimAutoreleasedReturnValue();
  v49[0] = v10;
  v49[1] = 3221225472;
  v49[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_7;
  v49[3] = &unk_1E44A7F60;
  v49[4] = self;
  v50 = v45;
  v44 = v45;
  dispatch_group_notify(v35, v43, v49);

}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  int8x16_t v4;
  _QWORD v5[4];
  int8x16_t v6;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_2;
  v5[3] = &unk_1E44A9078;
  v4 = *(int8x16_t *)(a1 + 32);
  v3 = (id)v4.i64[0];
  v6 = vextq_s8(v4, v4, 8uLL);
  fitImageInSize(v2, v5, 1024.0, 1024.0);

}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "_computeDominantColorForProperties");
  if (imageIsInteresting(v3))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setImage:", v3);
  }
  else
  {
    v4 = LPLogChannelFetching();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v6[0] = 67109120;
      v6[1] = v5;
      _os_log_impl(&dword_1A0C41000, v4, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: discarding primary image because it is uninteresting", (uint8_t *)v6, 8u);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setImage:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setImageMetadata:", 0);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_125(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  LPVideoMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v13 = v3;
  if (v3)
  {
    objc_msgSend(v4, "didCompleteWithStatus:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "setVideo:", v13);
    v5 = objc_alloc_init(LPVideoMetadata);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "setVideoMetadata:", v5);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "imageMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "videoMetadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setURL:", v7);

    objc_msgSend(v13, "MIMEType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "videoMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setType:", v9);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "setImage:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "setImageMetadata:", 0);
  }
  else
  {
    objc_msgSend(v4, "didCompleteWithStatus:", 2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(void **)(v11 + 128);
  *(_QWORD *)(v11 + 128) = 0;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_2_127(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setIcon:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_computeDominantColorForProperties");

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  int v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "_computeDominantColorForProperties");
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
    }
    while (v4);
  }

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v9)
  {
    v11 = *(_QWORD *)v19;
    *(_QWORD *)&v10 = 67109120;
    v17 = v10;
    do
    {
      for (j = 0; j != v9; ++j)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
        if ((imageIsInteresting(v13) & 1) != 0)
        {
          objc_msgSend(v7, "addObject:", v13);
        }
        else
        {
          v14 = LPLogChannelFetching();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8);
            *(_DWORD *)buf = v17;
            v27 = v15;
            _os_log_impl(&dword_1A0C41000, v14, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: discarding alternate image because it is uninteresting", buf, 8u);
          }
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v7, "count"))
    v16 = v7;
  else
    v16 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setAlternateImages:", v16, v17, (_QWORD)v18);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_128(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  unsigned int v9;
  __int128 v10;
  unint64_t v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  int v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v23;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v6++), "_computeDominantColorForProperties");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v4);
  }

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = 0;
  *(_QWORD *)&v10 = 67109120;
  v21 = v10;
  while (1)
  {
    v11 = v9;
    if (objc_msgSend(v3, "count", v21, (_QWORD)v22) <= (unint64_t)v9)
      break;
    objc_msgSend(v3, "objectAtIndexedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((imageIsInteresting(v12) & 1) != 0)
    {
      objc_msgSend(v7, "addObject:", v12);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "contentImagesMetadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count") > v11;

      if (v14)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "contentImagesMetadata");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndexedSubscript:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v16);

      }
    }
    else
    {
      v17 = LPLogChannelFetching();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8);
        *(_DWORD *)buf = v21;
        v27 = v18;
        _os_log_impl(&dword_1A0C41000, v17, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: discarding content image because it is uninteresting", buf, 8u);
      }
    }

    v9 = v11 + 1;
  }
  if (objc_msgSend(v7, "count"))
    v19 = v7;
  else
    v19 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setContentImages:", v19);
  if (objc_msgSend(v8, "count"))
    v20 = v8;
  else
    v20 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setContentImagesMetadata:", v20);
  objc_msgSend(*(id *)(a1 + 32), "deduplicateContentImagesWithEvent:inGroup:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_129(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didCompleteWithStatus:", 1);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_2_130(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_3_131;
  v6[3] = &unk_1E44A8DD0;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v3, "_doAfterNextPresentationUpdate:", v6);

}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_3_131(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "didCompleteWithStatus:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "themeColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "setThemeColor:", v2);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_5;
  v3[3] = &unk_1E44A7CE8;
  v4 = v1;
  objc_msgSend(v2, "_internalPostProcessResolvedMetadataWithCompletionHandler:", v3);

}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_5(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didCompleteWithStatus:", 1);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_7(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "_reduceSizeByDroppingResourcesIfNeeded");
  v3 = *(_QWORD **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = v3[10];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_8;
  v5[3] = &unk_1E44A9118;
  v5[4] = v3;
  v6 = v2;
  objc_msgSend(v3, "_generateSpecializationIfPossibleForCompleteMetadata:completionHandler:", v4, v5);

}

void __86__LPMetadataProvider__internalPostProcessResolvedMetadataWithEvent_completionHandler___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setMetadata:onlyUpgradeFields:", v3, 0);
    v4 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_DWORD *)(v5 + 8);
      objc_msgSend(*(id *)(v5 + 80), "specialization");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = 67109378;
      v8[1] = v6;
      v9 = 2112;
      v10 = objc_opt_class();
      _os_log_impl(&dword_1A0C41000, v4, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: generated specialization (%@) due to retrieved metadata", (uint8_t *)v8, 0x12u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (void)_requestSourceApplicationMetadataForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  +[LPiTunesMediaMetadataProviderSpecialization requestSourceApplicationMetadataForBundleIdentifier:completionHandler:](LPiTunesMediaMetadataProviderSpecialization, "requestSourceApplicationMetadataForBundleIdentifier:completionHandler:", a3, a4);
}

- (void)metadataProviderSpecialization:(id)a3 didFetchPreliminaryMetadata:(id)a4
{
  id v5;
  NSObject *v6;
  unsigned int loggingID;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = LPLogChannelFetching();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    loggingID = self->_loggingID;
    v8[0] = 67109120;
    v8[1] = loggingID;
    _os_log_impl(&dword_1A0C41000, v6, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: specialization provided preliminary metadata", (uint8_t *)v8, 8u);
  }
  objc_msgSend(v5, "_populateMetadataForBackwardCompatibility");
  -[LPMetadataProvider _setMetadata:onlyUpgradeFields:](self, "_setMetadata:onlyUpgradeFields:", v5, 1);
  -[LPLinkMetadata _invokePendingAsynchronousLoadUpdateHandlers](self->_metadata, "_invokePendingAsynchronousLoadUpdateHandlers");

}

- (void)metadataProviderSpecialization:(id)a3 didCompleteWithMetadata:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  unsigned int loggingID;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[LPMetadataProviderSpecialization context](self->_specializedMetadataProvider, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "event");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didCompleteWithStatus:", 1);

  v8 = LPLogChannelFetching();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    loggingID = self->_loggingID;
    v10[0] = 67109120;
    v10[1] = loggingID;
    _os_log_impl(&dword_1A0C41000, v8, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: completed from specialization", (uint8_t *)v10, 8u);
  }
  objc_msgSend(v5, "_populateMetadataForBackwardCompatibility");
  -[LPMetadataProvider _setMetadata:onlyUpgradeFields:](self, "_setMetadata:onlyUpgradeFields:", v5, 0);
  -[LPMetadataProvider _completedWithError:](self, "_completedWithError:", 0);

}

- (void)metadataProviderSpecializationDidFail:(id)a3
{
  void *v4;
  void *v5;
  LPMetadataProviderSpecialization *specializedMetadataProvider;
  NSObject *v7;
  unsigned int loggingID;
  _QWORD block[5];
  uint8_t buf[4];
  unsigned int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[LPMetadataProviderSpecialization context](self->_specializedMetadataProvider, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didCompleteWithStatus:", 2);

  specializedMetadataProvider = self->_specializedMetadataProvider;
  self->_specializationState = 2;
  self->_specializedMetadataProvider = 0;

  v7 = LPLogChannelFetching();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    loggingID = self->_loggingID;
    *(_DWORD *)buf = 67109120;
    v11 = loggingID;
    _os_log_impl(&dword_1A0C41000, v7, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider<%d>: specialization failed, retrying without specialization", buf, 8u);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__LPMetadataProvider_metadataProviderSpecializationDidFail___block_invoke;
  block[3] = &unk_1E44A7CE8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __60__LPMetadataProvider_metadataProviderSpecializationDidFail___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalStartFetchingMetadataFromURLRequest");
}

- (unint64_t)allowedSpecializedProviders
{
  return self->_allowedSpecializedProviders;
}

- (void)setAllowedSpecializedProviders:(unint64_t)a3
{
  self->_allowedSpecializedProviders = a3;
}

- (BOOL)requirePrivateRelayForAllNetworkTraffic
{
  return self->_requirePrivateRelayForAllNetworkTraffic;
}

- (void)setRequirePrivateRelayForAllNetworkTraffic:(BOOL)a3
{
  self->_requirePrivateRelayForAllNetworkTraffic = a3;
}

- (LPEvent)_event
{
  return self->_event;
}

- (BOOL)_shouldDownloadMediaSubresources
{
  return self->_shouldDownloadMediaSubresources;
}

- (void)_setShouldDownloadMediaSubresources:(BOOL)a3
{
  self->_shouldDownloadMediaSubresources = a3;
}

- (BOOL)_shouldDownloadImageSubresources
{
  return self->_shouldDownloadImageSubresources;
}

- (void)_setShouldDownloadImageSubresources:(BOOL)a3
{
  self->_shouldDownloadImageSubresources = a3;
}

- (BOOL)_fetchIsNotUserInitiated
{
  return self->_fetchIsNotUserInitiated;
}

- (void)_setFetchIsNotUserInitiated:(BOOL)a3
{
  self->_fetchIsNotUserInitiated = a3;
}

- (BOOL)shouldFetchSubresources
{
  return self->_shouldFetchSubresources;
}

- (void)setShouldFetchSubresources:(BOOL)shouldFetchSubresources
{
  self->_shouldFetchSubresources = shouldFetchSubresources;
}

- (NSTimeInterval)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(NSTimeInterval)timeout
{
  self->_timeout = timeout;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)useSpecializedProviders
{
  return self->_useSpecializedProviders;
}

- (void)setUseSpecializedProviders:(BOOL)a3
{
  self->_useSpecializedProviders = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_specializedMetadataProvider, 0);
  objc_storeStrong((id *)&self->_pendingFetchers, 0);
  objc_storeStrong((id *)&self->_imageTranscoder, 0);
  objc_storeStrong((id *)&self->_iconFetcherGroup, 0);
  objc_storeStrong((id *)&self->_subresourceFetchGroup, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_webProcessLaunchEvent, 0);
  objc_storeStrong((id *)&self->_mainResourceLoadEvent, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_watchdog, 0);
  objc_storeStrong((id *)&self->_originalURL, 0);
  objc_storeStrong((id *)&self->_URLRequest, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

void __41__LPMetadataProvider__startWatchdogTimer__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A0C41000, v0, v1, "LPMetadataProvider<%d>: watchdog timer fired after completion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

void __47__LPMetadataProvider__fetchMetadataFromWebView__block_invoke_cold_1(void *a1, uint64_t a2, int a3, NSObject *a4)
{
  *(_DWORD *)a2 = 67109378;
  *(_DWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 8) = 2112;
  *(_QWORD *)(a2 + 10) = a1;
  OUTLINED_FUNCTION_5(&dword_1A0C41000, a4, OS_LOG_TYPE_ERROR, "LPMetadataProvider<%d>: error thrown in MetadataExtractor.js: %@", (uint8_t *)a2);

}

void __47__LPMetadataProvider__fetchMetadataFromWebView__block_invoke_cold_2(void *a1, uint64_t a2, int a3, NSObject *a4)
{
  id v6;

  *(_DWORD *)a2 = 67109378;
  *(_DWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 8) = 2112;
  *(_QWORD *)(a2 + 10) = a1;
  v6 = a1;
  OUTLINED_FUNCTION_5(&dword_1A0C41000, a4, OS_LOG_TYPE_ERROR, "LPMetadataProvider<%d>: non-dictionary object returned in MetadataExtractor.js: %@", (uint8_t *)a2);

}

- (void)webViewWebContentProcessDidTerminate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4(&dword_1A0C41000, v0, v1, "LPMetadataProvider<%d>: Web Content process was terminated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)_firstImage:isSimilarToSecondImage:usingAnalyzer:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[8];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_1();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_5(&dword_1A0C41000, v1, OS_LOG_TYPE_ERROR, "LPMetadataProvider<%d>: failed to determine similarity between images (%@)", v2);
}

@end

@implementation MFMessageContentView

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__MFMessageContentView_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_5 != -1)
    dispatch_once(&log_onceToken_5, block);
  return (id)log_log_5;
}

void __27__MFMessageContentView_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.mobilemail", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_5;
  log_log_5 = (uint64_t)v1;

}

+ (OS_os_log)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__MFMessageContentView_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_0 != -1)
    dispatch_once(&signpostLog_onceToken_0, block);
  return (OS_os_log *)(id)signpostLog_log_0;
}

void __35__MFMessageContentView_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log_0;
  signpostLog_log_0 = (uint64_t)v1;

}

- (unint64_t)signpostID
{
  NSObject *v3;
  os_signpost_id_t v4;

  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[MFMessageContentView _stopObservingContentHeight](self, "_stopObservingContentHeight");
  -[MFMessageHeaderView setDelegate:](self->_headerView, "setDelegate:", 0);
  -[MFWebViewLoadingController setWebProcessDelegate:](self->_webViewLoadingController, "setWebProcessDelegate:", 0);
  -[EFCancelationToken cancel](self->_loadingCancelable, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)MFMessageContentView;
  -[MFMessageContentView dealloc](&v3, sel_dealloc);
}

- (MFMessageContentView)initWithFrame:(CGRect)a3
{
  MFMessageContentView *v3;
  MFMessageContentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFMessageContentView;
  v3 = -[MFMessageContentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MFMessageContentView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  void *v3;
  EFScheduler *v4;
  EFScheduler *trustConfigurationScheduler;
  MFWebViewLoadingController *v6;
  MFWebViewLoadingController *webViewLoadingController;
  id v8;
  UIViewPropertyAnimator *v9;
  UIViewPropertyAnimator *moveMessageBodyPropertyAnimator;
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
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  MFMessageHeaderView *v39;
  MFMessageHeaderView *v40;
  MFMessageHeaderView *headerView;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  MFMessageContentLoadingView *v53;
  MFMessageContentLoadingView *loadingView;
  NSMutableSet *v55;
  NSMutableSet *inFlightURLs;
  NSMutableDictionary *v57;
  NSMutableDictionary *failedProxyURLs;
  _MFTapPreventingRecognizer *v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  id location[2];

  -[MFMessageContentView setPreservesSuperviewLayoutMargins:](self, "setPreservesSuperviewLayoutMargins:", 1);
  -[MFMessageContentView setContentPaddingFollowsLayoutMargins:](self, "setContentPaddingFollowsLayoutMargins:", 1);
  -[MFMessageContentView setInsetsLayoutMarginsFromSafeArea:](self, "setInsetsLayoutMarginsFromSafeArea:", 0);
  -[MFMessageContentView setAllowLoadOfBlockedMessageContent:](self, "setAllowLoadOfBlockedMessageContent:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "mailConversationViewExpandedCellBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageContentView setBackgroundColor:](self, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.mobilemail.messageViewTrustConfiguration"), 25);
  v4 = (EFScheduler *)objc_claimAutoreleasedReturnValue();
  trustConfigurationScheduler = self->_trustConfigurationScheduler;
  self->_trustConfigurationScheduler = v4;

  v6 = objc_alloc_init(MFWebViewLoadingController);
  webViewLoadingController = self->_webViewLoadingController;
  self->_webViewLoadingController = v6;

  self->_suppressContentSizeNotificationsUntilFirstPaint = 1;
  v8 = objc_alloc(MEMORY[0x1E0DC3F38]);
  v9 = (UIViewPropertyAnimator *)objc_msgSend(v8, "initWithDuration:curve:animations:", 0, &__block_literal_global_5, *MEMORY[0x1E0CC6920]);
  moveMessageBodyPropertyAnimator = self->_moveMessageBodyPropertyAnimator;
  self->_moveMessageBodyPropertyAnimator = v9;

  -[MFWebViewLoadingController webView](self->_webViewLoadingController, "webView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNavigationDelegate:", self);
  objc_msgSend(v11, "_setInputDelegate:", self);
  objc_msgSend(v11, "setUIDelegate:", self);
  objc_msgSend(v11, "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", self);

  objc_msgSend(v11, "scrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlwaysBounceVertical:", 0);

  -[MFMessageContentView addSubview:](self, "addSubview:", v11);
  -[MFMessageContentView _reloadUserStyleSheets](self, "_reloadUserStyleSheets");
  -[MFMessageContentView _updateMinimumFontSize](self, "_updateMinimumFontSize");
  objc_msgSend(v11, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "userContentController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeAllScriptMessageHandlers");

  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, self);
  v16 = (void *)MEMORY[0x1E0D1E3C8];
  -[MFMessageContentView webView](self, "webView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addScriptHandlerForWebView:key:handler:", v17, CFSTR("MCVLog"), &__block_literal_global_72);

  v18 = (void *)MEMORY[0x1E0D1E3C8];
  -[MFMessageContentView webView](self, "webView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addScriptHandlerForWebView:key:handler:", v19, CFSTR("MCVError"), &__block_literal_global_79);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageContentView webViewConstants](self, "webViewConstants");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, CFSTR("isInlineGenmojiEnabled"));

  v22 = (void *)MEMORY[0x1E0D1E3C8];
  -[MFMessageContentView webView](self, "webView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x1E0C809B0];
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = __35__MFMessageContentView__commonInit__block_invoke_93;
  v74[3] = &unk_1E9A03528;
  objc_copyWeak(&v75, location);
  objc_msgSend(v22, "addScriptHandlerForWebView:key:handler:", v23, CFSTR("AttachmentNodeWasTapped"), v74);

  v25 = (void *)MEMORY[0x1E0D1E3C8];
  -[MFMessageContentView webView](self, "webView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v24;
  v72[1] = 3221225472;
  v72[2] = __35__MFMessageContentView__commonInit__block_invoke_2_96;
  v72[3] = &unk_1E9A03528;
  objc_copyWeak(&v73, location);
  objc_msgSend(v25, "addScriptHandlerForWebView:key:handler:", v26, CFSTR("AttachmentSaveWasTapped"), v72);

  v27 = (void *)MEMORY[0x1E0D1E3C8];
  -[MFMessageContentView webView](self, "webView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v24;
  v70[1] = 3221225472;
  v70[2] = __35__MFMessageContentView__commonInit__block_invoke_3;
  v70[3] = &unk_1E9A03550;
  objc_copyWeak(&v71, location);
  objc_msgSend(v27, "addScriptHandlerForWebView:key:handler:", v28, CFSTR("ExpandQuoteButtonTappedWithYOffset"), v70);

  v29 = (void *)MEMORY[0x1E0D1E3C8];
  -[MFMessageContentView webView](self, "webView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v24;
  v68[1] = 3221225472;
  v68[2] = __35__MFMessageContentView__commonInit__block_invoke_106;
  v68[3] = &unk_1E9A03578;
  objc_copyWeak(&v69, location);
  objc_msgSend(v29, "addScriptHandlerForWebView:key:handler:", v30, CFSTR("HasBlockquotesToExpand"), v68);

  v31 = (void *)MEMORY[0x1E0D1E3C8];
  -[MFMessageContentView webView](self, "webView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v24;
  v66[1] = 3221225472;
  v66[2] = __35__MFMessageContentView__commonInit__block_invoke_2_112;
  v66[3] = &unk_1E9A03578;
  objc_copyWeak(&v67, location);
  objc_msgSend(v31, "addScriptHandlerForWebView:key:handler:", v32, CFSTR("FinishedReformattingMessage"), v66);

  v33 = (void *)MEMORY[0x1E0D1E3C8];
  -[MFMessageContentView webView](self, "webView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v24;
  v64[1] = 3221225472;
  v64[2] = __35__MFMessageContentView__commonInit__block_invoke_4;
  v64[3] = &unk_1E9A035C8;
  objc_copyWeak(&v65, location);
  objc_msgSend(v33, "addScriptHandlerForWebView:key:handler:", v34, CFSTR("FoundImageCIDAttachments"), v64);

  v35 = (void *)MEMORY[0x1E0D1E3C8];
  -[MFMessageContentView webView](self, "webView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v24;
  v62[1] = 3221225472;
  v62[2] = __35__MFMessageContentView__commonInit__block_invoke_5;
  v62[3] = &unk_1E9A035F0;
  objc_copyWeak(&v63, location);
  objc_msgSend(v35, "addScriptHandlerForWebView:key:handler:", v36, CFSTR("TextSelected"), v62);

  v37 = (void *)MEMORY[0x1E0D1E3C8];
  -[MFMessageContentView webView](self, "webView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v24;
  v60[1] = 3221225472;
  v60[2] = __35__MFMessageContentView__commonInit__block_invoke_6;
  v60[3] = &unk_1E9A035F0;
  objc_copyWeak(&v61, location);
  objc_msgSend(v37, "addScriptHandlerForWebView:key:handler:", v38, CFSTR("ImageError"), v60);

  -[MFMessageContentView setMessageBlockingReason:](self, "setMessageBlockingReason:", 0);
  -[MFMessageContentView setInitialScale:](self, "setInitialScale:", -1.0);
  -[MFMessageContentView setInitiallyZoomsToShowAllContent:](self, "setInitiallyZoomsToShowAllContent:", 1);
  -[MFMessageContentView setShowsBanners:](self, "setShowsBanners:", 1);
  -[MFMessageContentView setZoomEnabled:](self, "setZoomEnabled:", 1);
  v39 = [MFMessageHeaderView alloc];
  -[MFMessageContentView frame](self, "frame");
  v40 = -[MFMessageHeaderView initWithFrame:](v39, "initWithFrame:", 0.0, 0.0);
  headerView = self->_headerView;
  self->_headerView = v40;

  -[MFMessageHeaderView setDelegate:](self->_headerView, "setDelegate:", self);
  -[MFMessageContentView addSubview:](self, "addSubview:", self->_headerView);
  -[MFMessageHeaderView topAnchor](self->_headerView, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageContentView topAnchor](self, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setActive:", 1);

  -[MFMessageHeaderView leadingAnchor](self->_headerView, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageContentView leadingAnchor](self, "leadingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setActive:", 1);

  -[MFMessageHeaderView trailingAnchor](self->_headerView, "trailingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageContentView trailingAnchor](self, "trailingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setActive:", 1);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addObserver:selector:name:object:", self, sel__fontSizeDidChange_, *MEMORY[0x1E0CC67D0], 0);
  objc_msgSend(v51, "addObserver:selector:name:object:", self, sel__darkerSystemColorsStatusDidChange_, *MEMORY[0x1E0DC4508], 0);
  v52 = objc_alloc(MEMORY[0x1E0CC68D0]);
  v53 = (MFMessageContentLoadingView *)objc_msgSend(v52, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  loadingView = self->_loadingView;
  self->_loadingView = v53;

  -[MFMessageContentView _addLoadingSubview:](self, "_addLoadingSubview:", self->_loadingView);
  v55 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  inFlightURLs = self->_inFlightURLs;
  self->_inFlightURLs = v55;

  v57 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  failedProxyURLs = self->_failedProxyURLs;
  self->_failedProxyURLs = v57;

  -[MFWebViewLoadingController setWebProcessDelegate:](self->_webViewLoadingController, "setWebProcessDelegate:", self);
  -[MFMessageContentView _setupWebProcessLocalizedStrings](self, "_setupWebProcessLocalizedStrings");
  v59 = objc_alloc_init(_MFTapPreventingRecognizer);
  -[_MFTapPreventingRecognizer setNumberOfTapsRequired:](v59, "setNumberOfTapsRequired:", 2);
  -[MFMessageContentView addGestureRecognizer:](self, "addGestureRecognizer:", v59);
  -[MFMessageContentView _observeBlockedSenderListChangedNotification](self, "_observeBlockedSenderListChangedNotification");

  objc_destroyWeak(&v61);
  objc_destroyWeak(&v63);
  objc_destroyWeak(&v65);
  objc_destroyWeak(&v67);
  objc_destroyWeak(&v69);
  objc_destroyWeak(&v71);
  objc_destroyWeak(&v73);
  objc_destroyWeak(&v75);
  objc_destroyWeak(location);

}

void __35__MFMessageContentView__commonInit__block_invoke_2(uint64_t a1, void *a2)
{
  __CFString *v2;
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  MFLogGeneral();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("«empty»");
    if (v2)
      v4 = v2;
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1D56AF000, v3, OS_LOG_TYPE_DEFAULT, "#Warning [MCVLog] %{public}@", (uint8_t *)&v5, 0xCu);
  }

}

void __35__MFMessageContentView__commonInit__block_invoke_77(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  MFLogGeneral();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("name"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("message"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("stack"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543874;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    _os_log_error_impl(&dword_1D56AF000, v3, OS_LOG_TYPE_ERROR, "[MCVError] Unhandled JS Exception: %{public}@ \"%@\" - callstack: %{public}@", (uint8_t *)&v7, 0x20u);

  }
}

void __35__MFMessageContentView__commonInit__block_invoke_93(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleAttachmentTapMessage:", v3);

}

void __35__MFMessageContentView__commonInit__block_invoke_2_96(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleAttachmentSaveMessage:", v3);

}

void __35__MFMessageContentView__commonInit__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  double v10;
  float v11;
  double v12;
  NSObject *v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v3;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("currentOffsetTop"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v8 = v7;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("preOffsetTop"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    v10 = v8;
    v12 = v11;

  }
  else
  {
    MFLogGeneral();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __35__MFMessageContentView__commonInit__block_invoke_3_cold_1(v13);

    v10 = 0.0;
    v12 = 0.0;
  }
  objc_msgSend(WeakRetained, "_expandQuoteWithCollapsedBlockquoteOffset:expandedOffset:", v10, v12);

}

void __35__MFMessageContentView__commonInit__block_invoke_106(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v6, "BOOLValue");
    objc_msgSend(WeakRetained, "footerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMessageContainsBlockQuotes:", v4);

  }
}

void __35__MFMessageContentView__commonInit__block_invoke_2_112(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "contentRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentRepresentationFuture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __35__MFMessageContentView__commonInit__block_invoke_3_113;
    v7[3] = &unk_1E9A035A0;
    v8 = v3;
    objc_msgSend(v6, "addSuccessBlock:", v7);

  }
}

void __35__MFMessageContentView__commonInit__block_invoke_3_113(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setSkipMessageReformatting:", objc_msgSend(*(id *)(a1 + 32), "BOOLValue") ^ 1);

}

void __35__MFMessageContentView__commonInit__block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_foundImageCIDAttachments:", v3);

}

void __35__MFMessageContentView__commonInit__block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setSelectedHTML:", v3);

  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "selectedHTML");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageContentView:didChangeSelectedHTML:", WeakRetained, v5);

  }
}

void __35__MFMessageContentView__commonInit__block_invoke_6(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(WeakRetained, "webProcessDidFailLoadingResourceWithURL:", v4);

}

- (WKWebView)webView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MFMessageContentView webViewLoadingController](self, "webViewLoadingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46B58]);

  -[MFMessageContentView webViewLoadingController](self, "webViewLoadingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "webView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (WKWebView *)v6;
}

- (MFWebViewDictionary)webViewConstants
{
  void *v2;
  void *v3;

  -[MFMessageContentView webViewLoadingController](self, "webViewLoadingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "webViewConstants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MFWebViewDictionary *)v3;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 2;
    else
      v6 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 4;
    else
      v7 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 8;
    else
      v8 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 16;
    else
      v9 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 256;
    else
      v10 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 32;
    else
      v11 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v11;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = 64;
    else
      v12 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v12;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 128;
    else
      v13 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v13;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = 512;
    else
      v14 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFDFF | v14;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = 1024;
    else
      v15 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFBFF | v15;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = 2048;
    else
      v16 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xF7FF | v16;
    v5 = obj;
  }

}

- (id)_updatedHeaderViewModelForMessage:(id)a3 replyToList:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MessageHeaderViewModel *v9;
  id v10;
  id v11;
  id v12;
  MessageHeaderViewModel *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  MFMessageContentView *v18;
  id v19;

  v6 = a3;
  v7 = a4;
  -[MFMessageContentView _mailboxForBanner:](self, "_mailboxForBanner:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [MessageHeaderViewModel alloc];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__MFMessageContentView__updatedHeaderViewModelForMessage_replyToList___block_invoke;
  v15[3] = &unk_1E9A03618;
  v10 = v6;
  v16 = v10;
  v11 = v7;
  v17 = v11;
  v18 = self;
  v12 = v8;
  v19 = v12;
  v13 = -[MessageHeaderViewModel initWithBuilder:](v9, "initWithBuilder:", v15);

  return v13;
}

void __70__MFMessageContentView__updatedHeaderViewModelForMessage_replyToList___block_invoke(uint64_t a1, void *a2)
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
  id v25;

  v25 = a2;
  objc_msgSend(*(id *)(a1 + 32), "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setItemID:", v3);

  objc_msgSend(*(id *)(a1 + 32), "flags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setRead:", objc_msgSend(v4, "read"));
  objc_msgSend(v25, "setFlagged:", objc_msgSend(v4, "flagged"));
  objc_msgSend(*(id *)(a1 + 32), "flagColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFlagColors:", v5);

  objc_msgSend(v25, "setReplied:", objc_msgSend(v4, "replied"));
  objc_msgSend(v25, "setForwarded:", objc_msgSend(v4, "forwarded"));
  objc_msgSend(v25, "setVIP:", objc_msgSend(*(id *)(a1 + 32), "isVIP"));
  objc_msgSend(v25, "setNotify:", objc_msgSend(*(id *)(a1 + 32), "conversationNotificationLevel") == 2);
  objc_msgSend(v25, "setMute:", objc_msgSend(*(id *)(a1 + 32), "conversationNotificationLevel") == 1);
  objc_msgSend(v25, "setBlockedSender:", objc_msgSend(*(id *)(a1 + 32), "isBlocked"));
  objc_msgSend(v25, "setUnsubscribeType:", objc_msgSend(*(id *)(a1 + 32), "unsubscribeType"));
  objc_msgSend(v25, "setHasAttachments:", objc_msgSend(*(id *)(a1 + 32), "hasAttachments"));
  objc_msgSend(*(id *)(a1 + 32), "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setDateSent:", v6);

  objc_msgSend(*(id *)(a1 + 32), "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setDate:", v7);

  objc_msgSend(*(id *)(a1 + 32), "subject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSubject:", v8);

  objc_msgSend(*(id *)(a1 + 32), "senderList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSenderList:", v9);

  objc_msgSend(v25, "setReplyToList:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "toList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setToList:", v10);

  objc_msgSend(*(id *)(a1 + 32), "ccList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setCcList:", v11);

  objc_msgSend(*(id *)(a1 + 32), "bccList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBccList:", v12);

  objc_msgSend(*(id *)(a1 + 48), "mailboxProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "objectID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "legacyMailboxForObjectID:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setMailbox:", v15);

  objc_msgSend(*(id *)(a1 + 48), "atomManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAtomManager:", v16);

  objc_msgSend(*(id *)(a1 + 48), "brandIndicatorProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "brandIndicatorLocation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "brandIndicatorFutureForLocation:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBrandIndicatorFuture:", v19);

  objc_msgSend(*(id *)(a1 + 32), "readLater");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setReadLaterDate:", v21);

  objc_msgSend(*(id *)(a1 + 32), "sendLaterDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSendLaterDate:", v22);

  objc_msgSend(*(id *)(a1 + 32), "followUp");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFollowUp:", v23);

  objc_msgSend(*(id *)(a1 + 32), "displayDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setDisplayDate:", v24);

}

- (void)setContentRequest:(id)a3
{
  MessageContentRepresentationRequest **p_contentRequest;
  EFCancelationToken *loadingCancelable;
  MFMessageLoadingContext *loadingContext;
  EFCancelationToken *v8;
  EFCancelationToken *v9;
  void *v10;
  void *v11;
  MessageContentItemsHelper *v12;
  void *v13;
  MessageContentItemsHelper *v14;
  MessageContentItemsHelper *relatedItemsHelper;
  void *v16;
  MFAddressAtomStatusManager *v17;
  void *v18;
  void *v19;
  void *v20;
  MFAddressAtomStatusManager *v21;
  MFConversationItemFooterView *footerView;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  EFCancelationToken *v36;
  MessageContentRepresentationRequest *v37;
  void *v38;
  NSObject *v39;
  objc_class *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  MessageContentRepresentationRequest *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  _QWORD v48[5];
  id v49;
  os_activity_scope_state_s state;
  _BYTE buf[12];
  __int16 v52;
  MFMessageContentView *v53;
  __int16 v54;
  MessageContentRepresentationRequest *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  p_contentRequest = &self->_contentRequest;
  v44 = (MessageContentRepresentationRequest *)a3;
  if (*p_contentRequest != v44)
  {
    state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
    state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
    v42 = _os_activity_create(&dword_1D56AF000, "message content view loading", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v42, &state);
    -[EFCancelationToken cancel](self->_loadingCancelable, "cancel");
    loadingCancelable = self->_loadingCancelable;
    self->_loadingCancelable = 0;

    loadingContext = self->_loadingContext;
    self->_loadingContext = 0;

    objc_storeStrong((id *)&self->_contentRequest, a3);
    v8 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E0D1EE90]);
    v9 = self->_loadingCancelable;
    self->_loadingCancelable = v8;

    -[MFMessageContentView delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "contentItemHandlingDelegateForMessageContentView:", self, v42);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = [MessageContentItemsHelper alloc];
      -[MFMessageContentView webView](self, "webView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[MessageContentItemsHelper initWithWebView:contentItemHandler:](v12, "initWithWebView:contentItemHandler:", v13, v11);
      relatedItemsHelper = self->_relatedItemsHelper;
      self->_relatedItemsHelper = v14;

    }
    -[MessageContentRepresentationRequest message](v44, "message", v42);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = [MFAddressAtomStatusManager alloc];
    objc_msgSend(v16, "mailboxes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "account");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[MFAddressAtomStatusManager initWithAccount:](v17, "initWithAccount:", v20);
    -[MFMessageContentView setAtomManager:](self, "setAtomManager:", v21);

    -[MFMessageContentView setHasVisibleContent:](self, "setHasVisibleContent:", 0);
    -[MFMessageContentView setBlockedContentTypes:](self, "setBlockedContentTypes:", 0);
    -[MFMessageContentView _clearAllBannersAnimated:](self, "_clearAllBannersAnimated:", 0);
    -[MFMessageContentView _stopObservingContentHeight](self, "_stopObservingContentHeight");
    footerView = self->_footerView;
    +[MFQuotedContentAttribution noAttribution](MFQuotedContentAttribution, "noAttribution");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFConversationItemFooterView render:](footerView, "render:", v23);

    -[MFMessageContentView setSelectedHTML:](self, "setSelectedHTML:", 0);
    if (v44)
    {
      EMLogCategoryMessageLoading();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "ef_publicDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v26;
        v52 = 2048;
        v53 = self;
        v54 = 2114;
        v55 = v44;
        v56 = 2114;
        v57 = v27;
        _os_log_impl(&dword_1D56AF000, v24, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: set message content request: %{public}@ for message: %{public}@", buf, 0x2Au);

      }
      -[MFMessageContentView showDelayedProgressUI](self, "showDelayedProgressUI");
      +[MFMessageContentView signpostLog](MFMessageContentView, "signpostLog");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = -[MessageContentRepresentationRequest signpostID](*p_contentRequest, "signpostID");
      if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D56AF000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v29, "MFMessageContentView", (const char *)&unk_1D5717B15, buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0D1F070], "globalAsyncScheduler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = MEMORY[0x1E0C809B0];
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __42__MFMessageContentView_setContentRequest___block_invoke;
      v48[3] = &unk_1E9A02DD8;
      v48[4] = self;
      v32 = v16;
      v49 = v32;
      objc_msgSend(v30, "afterDelay:performBlock:", v48, 3.0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageContentView setLoadingSpinnerTailspinToken:](self, "setLoadingSpinnerTailspinToken:", v33);

      -[MFMessageContentView _updatedHeaderViewModelForMessage:replyToList:](self, "_updatedHeaderViewModelForMessage:replyToList:", v32, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageHeaderView displayMessageUsingViewModel:](self->_headerView, "displayMessageUsingViewModel:", v34);
      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = self->_loadingCancelable;
      v37 = *p_contentRequest;
      v45[0] = v31;
      v45[1] = 3221225472;
      v45[2] = __42__MFMessageContentView_setContentRequest___block_invoke_172;
      v45[3] = &unk_1E9A03640;
      objc_copyWeak(&v47, (id *)buf);
      v46 = v32;
      -[MessageContentRepresentationRequest onScheduler:addLoadObserver:](v37, "onScheduler:addLoadObserver:", v35, v45);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[EFCancelationToken addCancelable:](v36, "addCancelable:", v38);

      -[MessageContentRepresentationRequest start](*p_contentRequest, "start");
      objc_destroyWeak(&v47);

      objc_destroyWeak((id *)buf);
    }
    else
    {
      -[MFMessageContentView clearMessage](self, "clearMessage");
      EMLogCategoryMessageLoading();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = (objc_class *)objc_opt_class();
        NSStringFromClass(v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v41;
        v52 = 2048;
        v53 = self;
        _os_log_impl(&dword_1D56AF000, v39, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: set nil content request, removing loading indicator", buf, 0x16u);

      }
      -[MFMessageContentView setLoadingIndicatorVisible:](self, "setLoadingIndicatorVisible:", 0);
    }

    os_activity_scope_leave(&state);
  }

}

void __42__MFMessageContentView_setContentRequest___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Loading spinner displayed for %fl seconds"), 0x4008000000000000);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  EFSaveTailspin();
  +[MFMessageContentView log](MFMessageContentView, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v9 = v5;
    v10 = 2048;
    v11 = v6;
    v12 = 2114;
    v13 = v2;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_1D56AF000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: %{public}@ for message: %{public}@", buf, 0x2Au);

  }
}

void __42__MFMessageContentView_setContentRequest___block_invoke_172(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  int v20;
  void *v21;
  __int16 v22;
  id *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "loadingSpinnerTailspinToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancel");

  objc_msgSend(WeakRetained, "setContentRepresentationError:", v6);
  if (v5 && WeakRetained)
  {
    v9 = WeakRetained[76];
    objc_msgSend(v5, "contentURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

    objc_msgSend(WeakRetained, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "messageContentView:handleContentRepresentation:", WeakRetained, v5);

    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "replyToList");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_updatedHeaderViewModelForMessage:replyToList:", v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();

    +[MFMessageContentView log](MFMessageContentView, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v17;
      v22 = 2048;
      v23 = WeakRetained;
      v24 = 2114;
      v25 = v18;
      _os_log_impl(&dword_1D56AF000, v15, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: Updating header for message: %{public}@", (uint8_t *)&v20, 0x20u);

    }
    objc_msgSend(WeakRetained[54], "displayMessageUsingViewModel:", v14);
  }
  else
  {
    +[MFMessageContentView log](MFMessageContentView, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      objc_claimAutoreleasedReturnValue();
      __42__MFMessageContentView_setContentRequest___block_invoke_172_cold_1();
    }
  }

  objc_msgSend(WeakRetained, "contentRequestDidReceiveContentRepresentation:error:", v5, v6);
}

- (id)_mailboxForBanner:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "mailboxes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_firstObjectPassingTest:", &__block_literal_global_175);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "ef_firstObjectPassingTest:", &__block_literal_global_176);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(v3, "ef_firstObjectPassingTest:", &__block_literal_global_177);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
      {
        objc_msgSend(v3, "firstObject");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return v4;
}

uint64_t __42__MFMessageContentView__mailboxForBanner___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isInboxMailbox");
}

uint64_t __42__MFMessageContentView__mailboxForBanner___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "canArchive");
}

BOOL __42__MFMessageContentView__mailboxForBanner___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 4;
}

- (void)setPreviousContentSnapshot:(id)a3
{
  UIView *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  UIView *previousContentSnapshot;
  UIView **p_previousContentSnapshot;
  UIView *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  UIView *v20;
  UIView *previousContentSnapshotWrapperView;
  void *v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  UIView *v26;
  void *v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  UIView *v31;
  int v32;
  void *v33;
  __int16 v34;
  MFMessageContentView *v35;
  __int16 v36;
  UIView *v37;
  __int16 v38;
  UIView *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = (UIView *)a3;
  EMLogCategoryMessageLoading();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    previousContentSnapshot = self->_previousContentSnapshot;
    v32 = 138544130;
    v33 = v8;
    v34 = 2048;
    v35 = self;
    v36 = 2048;
    v37 = v5;
    v38 = 2048;
    v39 = previousContentSnapshot;
    _os_log_impl(&dword_1D56AF000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: setPreviousContentSnapshot:%p (was %p)", (uint8_t *)&v32, 0x2Au);

  }
  p_previousContentSnapshot = &self->_previousContentSnapshot;
  v11 = self->_previousContentSnapshot;
  if (v11 != v5)
  {
    -[UIView removeFromSuperview](v11, "removeFromSuperview");
    objc_storeStrong((id *)p_previousContentSnapshot, a3);
    if (*p_previousContentSnapshot)
    {
      -[UIView frame](*p_previousContentSnapshot, "frame");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      -[MFMessageContentView layoutMargins](self, "layoutMargins");
      -[UIView setFrame:](*p_previousContentSnapshot, "setFrame:", v18, v13, v15, v17);
      if (!self->_previousContentSnapshotWrapperView)
      {
        v19 = objc_alloc(MEMORY[0x1E0DC3F10]);
        -[MFMessageContentView bounds](self, "bounds");
        v20 = (UIView *)objc_msgSend(v19, "initWithFrame:");
        previousContentSnapshotWrapperView = self->_previousContentSnapshotWrapperView;
        self->_previousContentSnapshotWrapperView = v20;

        objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](self->_previousContentSnapshotWrapperView, "setBackgroundColor:", v22);

        -[UIView setAutoresizingMask:](self->_previousContentSnapshotWrapperView, "setAutoresizingMask:", 18);
      }
      -[MFMessageContentView bounds](self, "bounds");
      -[UIView setFrame:](self->_previousContentSnapshotWrapperView, "setFrame:");
      -[UIView addSubview:](self->_previousContentSnapshotWrapperView, "addSubview:", *p_previousContentSnapshot);
      -[UIView setAlpha:](self->_previousContentSnapshotWrapperView, "setAlpha:", 1.0);
      EMLogCategoryMessageLoading();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = self->_previousContentSnapshotWrapperView;
        v32 = 138543874;
        v33 = v25;
        v34 = 2048;
        v35 = self;
        v36 = 2048;
        v37 = v26;
        _os_log_impl(&dword_1D56AF000, v23, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: adding previousContentSnapshotWrapperView: %p", (uint8_t *)&v32, 0x20u);

      }
      -[MFMessageContentView scrollView](self, "scrollView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addSubview:", self->_previousContentSnapshotWrapperView);

    }
    else
    {
      EMLogCategoryMessageLoading();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = self->_previousContentSnapshotWrapperView;
        v32 = 138543874;
        v33 = v30;
        v34 = 2048;
        v35 = self;
        v36 = 2048;
        v37 = v31;
        _os_log_impl(&dword_1D56AF000, v28, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: removing previousContentSnapshotWrapperView: %p", (uint8_t *)&v32, 0x20u);

      }
      -[UIView removeFromSuperview](self->_previousContentSnapshotWrapperView, "removeFromSuperview");
    }
  }

}

- (BOOL)sourceIsManaged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  -[MFMessageContentView contentRequest](self, "contentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "message");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mailboxes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "ef_all:", &__block_literal_global_179);
  }
  else
  {
    -[MFMessageContentView loadingContext](self, "loadingContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "sourceIsManaged");

  }
  return v7;
}

uint64_t __39__MFMessageContentView_sourceIsManaged__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sourceIsManaged");

  return v3;
}

- (EMContentRepresentation)contentRepresentationIfAvailable
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  MFMessageContentView *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MFMessageContentView contentRequest](self, "contentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resultIfAvailable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    EMLogCategoryMessageLoading();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageContentView contentRequest](self, "contentRequest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v8;
      v12 = 2048;
      v13 = self;
      v14 = 2114;
      v15 = v9;
      _os_log_error_impl(&dword_1D56AF000, v5, OS_LOG_TYPE_ERROR, "<%{public}@: %p>: contentRepresentation requested before it finished loading: %{public}@", (uint8_t *)&v10, 0x20u);

    }
  }
  return (EMContentRepresentation *)v4;
}

- (EMContentRepresentation)contentRepresentation
{
  void *v2;
  void *v3;

  -[MFMessageContentView contentRequest](self, "contentRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "waitForResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EMContentRepresentation *)v3;
}

- (void)sceneMovedToForeground
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  unint64_t backgroundWebProcessCrashCount;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  MFMessageContentView *v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_backgroundWebProcessCrashCount)
  {
    -[NSMutableSet removeAllObjects](self->_inFlightURLs, "removeAllObjects");
    EMLogCategoryMessageLoading();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      backgroundWebProcessCrashCount = self->_backgroundWebProcessCrashCount;
      *(_DWORD *)buf = 138543874;
      v10 = v5;
      v11 = 2048;
      v12 = self;
      v13 = 2048;
      v14 = backgroundWebProcessCrashCount;
      _os_log_impl(&dword_1D56AF000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: Reloading web view (background crash count: %ld)", buf, 0x20u);

    }
    self->_backgroundWebProcessCrashCount = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46__MFMessageContentView_sceneMovedToForeground__block_invoke;
    v8[3] = &unk_1E9A02D88;
    v8[4] = self;
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performBlock:", v8);

  }
}

void __46__MFMessageContentView_sceneMovedToForeground__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "webViewLoadingController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "slapWebView");

}

- (void)_setupWebProcessLocalizedStrings
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__MFMessageContentView__setupWebProcessLocalizedStrings__block_invoke;
  v6[3] = &unk_1E9A03708;
  v6[4] = self;
  objc_msgSend(&unk_1E9A145A0, "ef_map:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v3, &unk_1E9A145A0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageContentView webViewConstants](self, "webViewConstants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("localizedStrings"));

}

id __56__MFMessageContentView__setupWebProcessLocalizedStrings__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, &stru_1E9A04480, CFSTR("Main"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  UIView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  UIView *previousContentSnapshotWrapperView;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  MFMessageContentView *v23;
  __int16 v24;
  UIView *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)MFMessageContentView;
  -[MFMessageContentView layoutSubviews](&v19, sel_layoutSubviews);
  if (-[MFMessageContentView showMessageFooter](self, "showMessageFooter"))
  {
    -[MFMessageContentView _layoutFooterView](self, "_layoutFooterView");
    -[MFMessageContentView bringSubviewToFront:](self, "bringSubviewToFront:", self->_footerView);
  }
  -[MFMessageContentView loadingView](self, "loadingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    EMLogCategoryMessageLoading();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageContentView loadingView](self, "loadingView");
      v8 = (UIView *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v7;
      v22 = 2048;
      v23 = self;
      v24 = 2048;
      v25 = v8;
      _os_log_impl(&dword_1D56AF000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: bringing loading view to front: %p", buf, 0x20u);

    }
    -[MFMessageContentView _layoutLoadingView](self, "_layoutLoadingView");
    -[MFMessageContentView loadingView](self, "loadingView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageContentView loadingView](self, "loadingView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bringSubviewToFront:", v11);

    -[MFMessageContentView scrollView](self, "scrollView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setZoomEnabled:", 0);

    -[MFMessageContentView scrollView](self, "scrollView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setScrollEnabled:", 0);

  }
  if (self->_previousContentSnapshotWrapperView)
  {
    EMLogCategoryMessageLoading();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      previousContentSnapshotWrapperView = self->_previousContentSnapshotWrapperView;
      *(_DWORD *)buf = 138543874;
      v21 = v16;
      v22 = 2048;
      v23 = self;
      v24 = 2048;
      v25 = previousContentSnapshotWrapperView;
      _os_log_impl(&dword_1D56AF000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: bringing previous content snapshot wrapper view to front: %p", buf, 0x20u);

    }
    -[UIView superview](self->_previousContentSnapshotWrapperView, "superview");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bringSubviewToFront:", self->_previousContentSnapshotWrapperView);

  }
  -[UIView mf_activateDebugModeIfEnabled](self, "mf_activateDebugModeIfEnabled");
}

- (void)_layoutFooterView
{
  double Height;
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
  double v14;
  double v15;
  double Width;
  double v17;
  double v18;
  id v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  -[MFMessageContentView footerView](self, "footerView");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bounds");
  Height = CGRectGetHeight(v30);
  if (Height > 0.0)
  {
    objc_msgSend(v29, "layoutMargins");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[MFMessageContentView layoutMargins](self, "layoutMargins");
    if (v7 != v15 || v5 != v12 || v11 != v14 || v9 != v13)
    {
      -[MFMessageContentView layoutMargins](self, "layoutMargins");
      objc_msgSend(v29, "setLayoutMargins:");
    }
    -[MFMessageContentView bounds](self, "bounds");
    Width = CGRectGetWidth(v31);
    objc_msgSend(v29, "bounds");
    if (v18 != Width || v17 != Height)
    {
      v19 = v29;
      objc_msgSend(v19, "frame");
      objc_msgSend(v19, "setFrame:");

    }
    if (-[MFMessageContentView shouldHideStickyFooterView](self, "shouldHideStickyFooterView"))
    {
      objc_msgSend(v29, "frame");
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;
      -[MFMessageContentView frame](self, "frame");
      CGRectGetHeight(v32);
      v33.origin.x = v21;
      v33.origin.y = v23;
      v33.size.width = v25;
      v33.size.height = v27;
      CGRectGetHeight(v33);
      UIRoundToViewScale();
      objc_msgSend(v29, "setFrame:", v21, v28, v25, v27);
    }
  }

}

- (BOOL)shouldHideStickyFooterView
{
  void *v2;
  char v3;

  -[MFMessageContentView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mf_hasCompactDimension");

  return v3;
}

- (void)_layoutLoadingView
{
  double v3;
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
  double v14;
  id v15;
  id v16;

  -[MFMessageContentView scrollView](self, "scrollView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contentInset");
  v4 = v3;
  v6 = v5;

  -[MFMessageContentView bounds](self, "bounds");
  v8 = v7;
  v10 = v9 + 0.0;
  v12 = v4 + v11;
  v14 = v13 - (v4 + v6);
  -[MFMessageContentView loadingView](self, "loadingView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v10, v12, v8, v14);

}

- (double)_viewportWidth
{
  CGRect v3;

  -[MFMessageContentView frame](self, "frame");
  return floor(CGRectGetWidth(v3));
}

- (void)setFrame:(CGRect)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFMessageContentView;
  -[MFMessageContentView setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__MFMessageContentView_setFrame___block_invoke;
  v4[3] = &unk_1E9A02D88;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v4);
}

void __33__MFMessageContentView_setFrame___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  BOOL v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  CGRect v25;
  CGRect v26;

  objc_msgSend(*(id *)(a1 + 32), "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v26.origin.x = v11;
  v26.origin.y = v12;
  v26.size.width = v13;
  v26.size.height = v14;
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  v15 = CGRectEqualToRect(v25, v26);

  if (!v15)
  {
    objc_msgSend(*(id *)(a1 + 32), "bounds");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    objc_msgSend(*(id *)(a1 + 32), "webView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

    if (objc_msgSend(*(id *)(a1 + 32), "contentPaddingFollowsLayoutMargins"))
      objc_msgSend(*(id *)(a1 + 32), "_setNeedsPaddingConstantsUpdate");
  }
}

- (BOOL)_firstResponderIsInWebView
{
  void *v3;
  void *v4;
  char v5;

  -[MFMessageContentView firstResponder](self, "firstResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MFMessageContentView webView](self, "webView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isDescendantOfView:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v7;
  BOOL v8;
  objc_super v10;

  v6 = a4;
  if (sel_selectAll_ == a3)
  {
    v7 = -[MFMessageContentView _firstResponderIsInWebView](self, "_firstResponderIsInWebView");
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MFMessageContentView;
    v7 = -[MFMessageContentView canPerformAction:withSender:](&v10, sel_canPerformAction_withSender_, a3, v6);
  }
  v8 = v7;

  return v8;
}

- (void)selectAll:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[MFMessageContentView _firstResponderIsInWebView](self, "_firstResponderIsInWebView"))
  {
    -[MFMessageContentView firstResponder](self, "firstResponder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectAll:", v5);

  }
}

- (void)setDisplayMetrics:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!-[MFMessageDisplayMetrics isEqual:](self->_displayMetrics, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_displayMetrics, a3);
    -[MFMessageContentView headerView](self, "headerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisplayMetrics:", v6);

    -[MFConversationItemFooterView setDisplayMetrics:](self->_footerView, "setDisplayMetrics:", v6);
    if (-[MFMessageContentView contentPaddingFollowsLayoutMargins](self, "contentPaddingFollowsLayoutMargins"))
      -[MFMessageContentView _setNeedsPaddingConstantsUpdate](self, "_setNeedsPaddingConstantsUpdate");
  }

}

- (void)setAutomaticallyCollapseQuotedContent:(BOOL)a3 reloadIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  double v12;
  id v13;
  id v14;
  id v15;

  if (self->_automaticallyCollapseQuotedContent != a3)
  {
    v4 = a4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[MFMessageContentView webViewLoadingController](self, "webViewLoadingController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "webViewConstants");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("collapseQuotedContent"));

    self->_automaticallyCollapseQuotedContent = a3;
    if (v4)
    {
      -[MFMessageContentView webViewLoadingController](self, "webViewLoadingController");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "reload");

    }
    if (-[MFMessageContentView shouldHideStickyFooterView](self, "shouldHideStickyFooterView"))
    {
      v9 = -[MFMessageContentView automaticallyCollapseQuotedContent](self, "automaticallyCollapseQuotedContent");
      -[MFMessageContentView footerView](self, "footerView");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "seeMoreButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = 0.0;
      if (v9)
        v12 = 1.0;
      objc_msgSend(v10, "setAlpha:", v12);

    }
  }
}

- (void)setAutomaticallyCollapseQuotedContent:(BOOL)a3
{
  -[MFMessageContentView setAutomaticallyCollapseQuotedContent:reloadIfNeeded:](self, "setAutomaticallyCollapseQuotedContent:reloadIfNeeded:", a3, 0);
}

- (void)setShowMessageFooter:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  if (self->_showMessageFooter != a3)
  {
    v3 = a3;
    self->_showMessageFooter = a3;
    -[MFMessageContentView footerView](self, "footerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      -[MFMessageContentView addSubview:](self, "addSubview:", v5);
    else
      objc_msgSend(v5, "removeFromSuperview");

  }
}

- (MFConversationItemFooterView)footerView
{
  MFConversationItemFooterView *footerView;
  MFConversationItemFooterView *v4;
  MFConversationItemFooterView *v5;
  void *v6;

  footerView = self->_footerView;
  if (!footerView)
  {
    v4 = objc_alloc_init(MFConversationItemFooterView);
    v5 = self->_footerView;
    self->_footerView = v4;

    -[MFConversationItemFooterView setDelegate:](self->_footerView, "setDelegate:", self);
    -[MFConversationItemFooterView addTarget:action:toButton:](self->_footerView, "addTarget:action:toButton:", self, sel__revealActionsButtonTapped, 1);
    -[MFConversationItemFooterView addTarget:action:toButton:](self->_footerView, "addTarget:action:toButton:", self, sel__seeMoreButtonTapped, 0);
    -[MFConversationItemFooterView addTarget:action:toButton:](self->_footerView, "addTarget:action:toButton:", self, sel__undoSendButtonTapped, 2);
    -[MFMessageContentView displayMetrics](self, "displayMetrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFConversationItemFooterView setDisplayMetrics:](self->_footerView, "setDisplayMetrics:", v6);

    -[MFConversationItemFooterView setAlpha:](self->_footerView, "setAlpha:", 0.0);
    footerView = self->_footerView;
  }
  return footerView;
}

- (void)setMessageBlockingReason:(int64_t)a3
{
  void *v4;
  id v5;

  self->_messageBlockingReason = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3 == 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MFMessageContentView webViewConstants](self, "webViewConstants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("showRemoteImages"));

}

- (void)setInitialScale:(double)a3
{
  void *v4;
  id v5;

  self->_initialScale = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MFMessageContentView webViewConstants](self, "webViewConstants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("initial-scale"));

}

- (void)_updateMinimumFontSize
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = *MEMORY[0x1E0DC48D0];
  v18[0] = *MEMORY[0x1E0DC48D8];
  v18[1] = v4;
  v5 = *MEMORY[0x1E0DC48C0];
  v18[2] = *MEMORY[0x1E0DC48C8];
  v18[3] = v5;
  v18[4] = *MEMORY[0x1E0DC48B8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "containsObject:", v9);

  v11 = 0.0;
  if (v10)
  {
    -[MFMessageContentView _bodyFont](self, "_bodyFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pointSize");
    v11 = v13;

  }
  -[MFMessageContentView webView](self, "webView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "preferences");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "minimumFontSize");
  if (vabdd_f64(v17, v11) > 0.00000011920929)
  {
    objc_msgSend(v16, "setMinimumFontSize:", v11);
    -[MFMessageContentView _reloadUserStyleSheets](self, "_reloadUserStyleSheets");
  }

}

- (void)layoutMarginsDidChange
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MFMessageContentView;
  -[MFMessageContentView layoutMarginsDidChange](&v10, sel_layoutMarginsDidChange);
  -[UIView frame](self->_previousContentSnapshot, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[MFMessageContentView layoutMargins](self, "layoutMargins");
  -[UIView setFrame:](self->_previousContentSnapshot, "setFrame:", v9, v4, v6, v8);
  -[MFMessageContentView _layoutFooterView](self, "_layoutFooterView");
}

- (void)_fontSizeDidChange:(id)a3
{
  double Width;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  CGRect v10;

  -[MFMessageContentView _updateMinimumFontSize](self, "_updateMinimumFontSize", a3);
  -[MFMessageContentView frame](self, "frame");
  Width = CGRectGetWidth(v10);
  -[MFMessageContentView safeAreaInsets](self, "safeAreaInsets");
  +[MFReadableContentMarginCalculator readableContentMarginsForWidth:minMargins:safeAreaInsets:](MFReadableContentMarginCalculator, "readableContentMarginsForWidth:minMargins:safeAreaInsets:", Width, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24), v5, v6, v7, v8);
  -[MFMessageContentView setLayoutMargins:](self, "setLayoutMargins:");
  -[MFMessageContentView webViewLoadingController](self, "webViewLoadingController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reload");

}

- (id)_bodyFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CC68B0], "sharedFontMetricCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedPreferredFontForStyle:", *MEMORY[0x1E0DC4A88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setNeedsPaddingConstantsUpdate
{
  if (!self->_paddingConstantsNeedUpdate)
  {
    self->_paddingConstantsNeedUpdate = 1;
    -[MFMessageContentView performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__updateWebViewPaddingConstants, 0, 0);
  }
}

- (void)_updateWebViewPaddingConstants
{
  double v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  int v18;
  double v19;
  double v20;
  double *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  objc_class *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  _QWORD v50[2];
  _QWORD v51[2];
  uint8_t buf[4];
  id v53;
  __int16 v54;
  MFMessageContentView *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  double v63;
  _QWORD v64[5];

  v64[4] = *MEMORY[0x1E0C80C00];
  -[MFMessageContentView _viewportWidth](self, "_viewportWidth");
  v5 = v4;
  -[MFMessageContentView quickReplyAnimationContext](self, "quickReplyAnimationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0.0;
  if (v6)
  {
    -[MFMessageContentView quickReplyAnimationContext](self, "quickReplyAnimationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insets");
    v7 = v9;

  }
  -[MFMessageContentView layoutMargins](self, "layoutMargins");
  v11 = v10;
  v13 = v12;
  -[MFMessageContentView showMessageFooter](self, "showMessageFooter");
  -[MFMessageContentView _bodyFont](self, "_bodyFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageContentView displayMetrics](self, "displayMetrics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "hasCompactLayout"))
    v16 = 29.0;
  else
    v16 = 32.0;

  objc_msgSend(v14, "_scaledValueForValue:", v16);
  objc_msgSend(v14, "lineHeight");
  objc_msgSend(v14, "leading");
  -[MFMessageContentView displayMetrics](self, "displayMetrics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hasGenerousMargins");
  v19 = v7 + v13 + -7.0;
  v20 = v11 + -7.0;

  v21 = (double *)MEMORY[0x1E0DC49E8];
  if (v18)
    v22 = v11 + -7.0;
  else
    v22 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  if (v18)
    v23 = v19;
  else
    v23 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  if (v18)
    v24 = v20 + v19;
  else
    v24 = 0.0;
  -[MFMessageContentView webView](self, "webView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_setObscuredInsets:", *v21, v22);

  -[MFMessageContentView webView](self, "webView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v5 - v24;
  objc_msgSend(v26, "_overrideLayoutParametersWithMinimumLayoutSize:maximumUnobscuredSizeOverride:");

  -[MFMessageContentView webView](self, "webView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "scrollView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "contentInset");
  v30 = v29;
  v32 = v31;

  -[MFMessageContentView webView](self, "webView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "scrollView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setContentInset:", v30, v22, v32, v23);

  UIEdgeInsetsSubtract();
  MFFloatToCSSPixelString();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v35;
  MFFloatToCSSPixelString();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v36;
  MFFloatToCSSPixelString();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v37;
  MFFloatToCSSPixelString();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v64[3] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 4);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "componentsJoinedByString:", CFSTR(" "));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFMessageContentView log](MFMessageContentView, "log");
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = (objc_class *)objc_opt_class();
    NSStringFromClass(v42);
    v43 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageContentView webView](self, "webView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v53 = v43;
    v54 = 2048;
    v55 = self;
    v56 = 2114;
    v57 = v44;
    v58 = 2048;
    v59 = v45;
    v60 = 2114;
    v61 = v40;
    v62 = 2048;
    v63 = v49;
    _os_log_impl(&dword_1D56AF000, v41, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: %{public}@ webView = %p padding:%{public}@ viewport-width:%f", buf, 0x3Eu);

  }
  -[MFMessageContentView webViewConstants](self, "webViewConstants");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = CFSTR("padding");
  v50[1] = CFSTR("viewport-width");
  v51[0] = v40;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v49);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v47;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setValuesForKeysWithDictionary:", v48);

  self->_paddingConstantsNeedUpdate = 0;
}

- (id)_styleSheetWithPadding:(UIEdgeInsets)a3 useWideLayout:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v4 = a4;
  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CSSString(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("padding-left"));

  CSSString(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("padding-right"));

  MFFloatToCSSPixelString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("padding-top"));

  MFFloatToCSSPixelString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("padding-bottom"));

  v13 = CFSTR("BODY");
  v14[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  MFCSSStringFromDictionary();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_reloadUserStyleSheets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[MFMessageContentView webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userContentController");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_removeAllUserStyleSheets");
  MFUserStyleSheetCSS();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _styleSheetWithSource(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_addUserStyleSheet:", v6);

  if (_reloadUserStyleSheets_onceToken != -1)
    dispatch_once(&_reloadUserStyleSheets_onceToken, &__block_literal_global_240);
  objc_msgSend(v9, "_addUserStyleSheet:", _reloadUserStyleSheets_attachmentStyleSheet);
  -[MFMessageContentView _styleSheetWithPadding:useWideLayout:](self, "_styleSheetWithPadding:useWideLayout:", 0, 0.0, 16.0, 0.0, 16.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _styleSheetWithSource(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_addUserStyleSheet:", v8);

}

void __46__MFMessageContentView__reloadUserStyleSheets__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pathForResource:ofType:", CFSTR("attachments"), CFSTR("css"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithContentsOfFile:encoding:error:", v2, 4, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _styleSheetWithSource(v3);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)_reloadUserStyleSheets_attachmentStyleSheet;
  _reloadUserStyleSheets_attachmentStyleSheet = v4;

}

- (void)clearMessage
{
  void *v3;
  void *v4;

  -[MFMessageContentView webViewLoadingController](self, "webViewLoadingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopLoading");

  -[UIView removeFromSuperview](self->_previousContentSnapshotWrapperView, "removeFromSuperview");
  -[MFMessageContentView previousContentSnapshot](self, "previousContentSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[MFMessageContentView setPreviousContentSnapshot:](self, "setPreviousContentSnapshot:", 0);
  -[MFMessageContentView _stopObservingContentHeight](self, "_stopObservingContentHeight");
  -[MFMessageHeaderView removeHeaderBlock:animated:](self->_headerView, "removeHeaderBlock:animated:", self->_mailDropBanner, 0);
  -[MFMessageContentView _clearAllBannersAnimated:](self, "_clearAllBannersAnimated:", 0);
  -[MFMessageContentView setAttachments:](self, "setAttachments:", MEMORY[0x1E0C9AA60]);
}

- (void)_clearAllBannersAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[MFMessageContentView _clearLoadRemoteImagesBannerAnimated:](self, "_clearLoadRemoteImagesBannerAnimated:");
  -[MFMessageContentView _clearHasMoreContentBannerAnimated:](self, "_clearHasMoreContentBannerAnimated:", v3);
  -[MFMessageContentView _clearBlockedSenderBannerAnimated:](self, "_clearBlockedSenderBannerAnimated:", v3);
  -[MFMessageContentView _clearLoadFailedProxyContentBannerAnimated:](self, "_clearLoadFailedProxyContentBannerAnimated:", v3);
  -[MFMessageContentView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageContentView:clearSuggestionsBannerAnimated:", self, v3);

}

- (void)_addLoadingSubview:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFMessageContentView scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageContentView insertSubview:above:](self, "insertSubview:above:", v5, v4);
  objc_msgSend(v4, "setZoomEnabled:", 0);
  objc_msgSend(v4, "setScrollEnabled:", 0);

}

- (void)_removeLoadingSubview:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MFMessageContentView scrollView](self, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");
    objc_msgSend(v5, "setZoomEnabled:", 1);
    objc_msgSend(v5, "setScrollEnabled:", 1);

  }
}

- (void)showDelayedProgressUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  -[MFMessageContentView loadingView](self, "loadingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

  -[MFMessageContentView loadingView](self, "loadingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageContentView _addLoadingSubview:](self, "_addLoadingSubview:", v4);

  -[MFMessageContentView loadingIndicatorCancelable](self, "loadingIndicatorCancelable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __45__MFMessageContentView_showDelayedProgressUI__block_invoke;
  v11 = &unk_1E9A02B00;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v6, "afterDelay:performBlock:", &v8, 0.85);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFMessageContentView setLoadingIndicatorCancelable:](self, "setLoadingIndicatorCancelable:", v7, v8, v9, v10, v11);
  -[EFCancelationToken addCancelable:](self->_loadingCancelable, "addCancelable:", v7);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __45__MFMessageContentView_showDelayedProgressUI__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  EMLogCategoryMessageLoading();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543618;
    v6 = v4;
    v7 = 2048;
    v8 = WeakRetained;
    _os_log_impl(&dword_1D56AF000, v2, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: showing delayed progress indicator", (uint8_t *)&v5, 0x16u);

  }
  objc_msgSend(WeakRetained, "setLoadingIndicatorVisible:", 1);

}

- (BOOL)isLoadingIndicatorVisible
{
  void *v2;
  char v3;

  -[MFMessageContentView loadingView](self, "loadingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLoadingIndicatorVisible");

  return v3;
}

- (void)setLoadingIndicatorVisible:(BOOL)a3
{
  -[MFMessageContentView setLoadingIndicatorVisible:animated:](self, "setLoadingIndicatorVisible:animated:", a3, 0);
}

- (void)setLoadingIndicatorVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  _QWORD aBlock[4];
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  MFMessageContentView *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v4 = a4;
  v5 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  -[MFMessageContentView loadingIndicatorCancelable](self, "loadingIndicatorCancelable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancel");

  -[MFMessageContentView loadingView](self, "loadingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  EMLogCategoryMessageLoading();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "isLoadingIndicatorVisible");
    NSStringFromBOOL();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v24 = v11;
    v25 = 2048;
    v26 = self;
    v27 = 2112;
    v28 = v12;
    v29 = 2048;
    v30 = v8;
    v31 = 2112;
    v32 = v13;
    _os_log_impl(&dword_1D56AF000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: loadingIndicatorVisible=%@ (view: %p wasVisible %@)", buf, 0x34u);

  }
  objc_msgSend(v8, "setAlpha:", 1.0);
  if (v5)
  {
    v14 = 0;
    v15 = 0;
    -[MFMessageContentView _addLoadingSubview:](self, "_addLoadingSubview:", v8);
  }
  else
  {
    v16 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__MFMessageContentView_setLoadingIndicatorVisible_animated___block_invoke;
    aBlock[3] = &unk_1E9A02D88;
    v17 = v8;
    v22 = v17;
    v14 = (unint64_t)_Block_copy(aBlock);
    v19[0] = v16;
    v19[1] = 3221225472;
    v19[2] = __60__MFMessageContentView_setLoadingIndicatorVisible_animated___block_invoke_2;
    v19[3] = &unk_1E9A03750;
    v19[4] = self;
    v20 = v17;
    v15 = (unint64_t)_Block_copy(v19);

  }
  objc_msgSend(v8, "setLoadingIndicatorVisible:animated:", v5, v4);
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    -[MFMessageContentView delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "messageContentView:loadingIndicatorDidChangeVisibility:", self, -[MFMessageContentView isLoadingIndicatorVisible](self, "isLoadingIndicatorVisible"));

  }
  if (v14 | v15)
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v14, v15, *MEMORY[0x1E0CC6918]);
    }
    else
    {
      if (v14)
        (*(void (**)(unint64_t))(v14 + 16))(v14);
      if (v15)
        (*(void (**)(unint64_t, uint64_t))(v15 + 16))(v15, 1);
    }
  }

}

uint64_t __60__MFMessageContentView_setLoadingIndicatorVisible_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __60__MFMessageContentView_setLoadingIndicatorVisible_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeLoadingSubview:", *(_QWORD *)(a1 + 40));
}

- (void)reload
{
  id v2;

  -[MFMessageContentView webViewLoadingController](self, "webViewLoadingController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reload");

}

- (void)clearSelectedHTML
{
  -[MFMessageContentView setSelectedHTML:](self, "setSelectedHTML:", 0);
}

- (UIScrollView)scrollView
{
  void *v2;
  void *v3;

  -[MFMessageContentView webView](self, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIScrollView *)v3;
}

- (void)contentRequestDidReceiveContentRepresentation:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  MFMailDropBannerView *mailDropBanner;
  MFMailDropBannerView *v17;
  MFMailDropBannerView *v18;
  uint64_t v19;
  MFMailDropBannerView *v20;
  MFMailDropBannerView *v21;
  objc_class *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  MFMailDropBannerView *v28;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  MFMessageContentView *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1D56AF000, "-[MFMessageContentView contentRequestDidReceiveContentRepresentation:error:]", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  self->_showingError = 0;
  if (v6)
  {
    objc_msgSend(v6, "relatedContentItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MessageContentItemsHelper setContentItems:](self->_relatedItemsHelper, "setContentItems:", v9);

    -[MFMessageContentView _requestWebViewLoadWithRepresentation:](self, "_requestWebViewLoadWithRepresentation:", v6);
    if (objc_msgSend(v6, "hasMoreContent"))
    {
      EMLogCategoryMessageLoading();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[MFMessageContentView contentRequest](self, "contentRequest");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "message");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "ef_publicDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v31 = v13;
        _os_log_impl(&dword_1D56AF000, v10, OS_LOG_TYPE_DEFAULT, "Add hasMoreContent banner for message: %{public}@", buf, 0xCu);

      }
      -[MFMessageContentView _addHasMoreContentBannerWithRemainingBytes:](self, "_addHasMoreContentBannerWithRemainingBytes:", objc_msgSend(v6, "remainingByteCount"));
    }
    else
    {
      -[MFMessageContentView _clearHasMoreContentBannerAnimated:](self, "_clearHasMoreContentBannerAnimated:", 1);
    }
    -[MFMessageContentView _addBlockedSenderBannerIfNeeded](self, "_addBlockedSenderBannerIfNeeded");
    -[MFMessageContentView _addHideMyEmailBannerIfNeeded](self, "_addHideMyEmailBannerIfNeeded");
    -[MFMessageContentView _addNotAuthenticatedBannerIfNeeded](self, "_addNotAuthenticatedBannerIfNeeded");
    -[MessageContentItemsHelper mailDropBannerMetadata](self->_relatedItemsHelper, "mailDropBannerMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      mailDropBanner = self->_mailDropBanner;
      if (!mailDropBanner)
      {
        v17 = objc_alloc_init(MFMailDropBannerView);
        v18 = self->_mailDropBanner;
        self->_mailDropBanner = v17;

        -[MFMailDropBannerView setDelegate:](self->_mailDropBanner, "setDelegate:", self);
        mailDropBanner = self->_mailDropBanner;
      }
      -[MFMailDropBannerView setMetaData:](mailDropBanner, "setMetaData:", v15);
      if (-[MessageContentItemsHelper allMailDropsDownloaded](self->_relatedItemsHelper, "allMailDropsDownloaded"))
        v19 = 3;
      else
        v19 = 1;
      -[MFMailDropBannerView setBannerState:](self->_mailDropBanner, "setBannerState:", v19);
      v20 = self->_mailDropBanner;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __76__MFMessageContentView_contentRequestDidReceiveContentRepresentation_error___block_invoke;
      v27[3] = &unk_1E9A03778;
      v21 = v20;
      v28 = v21;
      -[MessageContentItemsHelper setMaildropProgressHandler:](self->_relatedItemsHelper, "setMaildropProgressHandler:", v27);
      -[MFMessageHeaderView addHeaderBlock:animated:](self->_headerView, "addHeaderBlock:animated:", self->_mailDropBanner, 0);

    }
  }
  else
  {
    self->_showingError = 1;
    EMLogCategoryMessageLoading();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      -[MFMessageContentView contentRequest](self, "contentRequest");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "message");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ef_publicDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v31 = v23;
      v32 = 2048;
      v33 = self;
      v34 = 2112;
      v35 = v25;
      v36 = 2114;
      v37 = v26;
      _os_log_error_impl(&dword_1D56AF000, v14, OS_LOG_TYPE_ERROR, "<%{public}@: %p>: Error loading content represenation for message %@ : %{public}@", buf, 0x2Au);

    }
    -[MFMessageContentView webViewLoadingController](self, "webViewLoadingController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "requestWebViewLoadWithError:", v7);
  }

  os_activity_scope_leave(&state);
}

uint64_t __76__MFMessageContentView_contentRequestDidReceiveContentRepresentation_error___block_invoke(uint64_t result, uint64_t a2, double a3)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = result;
  if (a2 == 3)
  {
    objc_msgSend(*(id *)(result + 32), "setBannerState:", 2);
    return objc_msgSend(*(id *)(v3 + 32), "setDownloadProgress:", a3);
  }
  else
  {
    if (a2 == 2)
    {
      v4 = *(void **)(result + 32);
      v5 = 1;
    }
    else
    {
      if (a2 != 1)
        return result;
      v4 = *(void **)(result + 32);
      v5 = 3;
    }
    return objc_msgSend(v4, "setBannerState:", v5);
  }
}

- (void)_requestWebViewLoadWithRepresentation:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _BOOL4 v24;
  int v25;
  void *v26;
  BOOL v27;
  char v28;
  uint64_t v29;
  void *v30;
  char v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  NSDate *lastCrashDate;
  void *v39;
  void *v40;
  void *v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  MFMessageContentView *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  EMLogCategoryMessageLoading();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentMessage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ef_publicDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v43 = v7;
    v44 = 2048;
    v45 = self;
    v46 = 2114;
    v47 = v9;
    v48 = 2114;
    v49 = v10;
    _os_log_impl(&dword_1D56AF000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: Request webView load for message-id: %{public}@, representation: %{public}@", buf, 0x2Au);

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLForKey:", CFSTR("DisableDisplayInfoCache"));

  if ((v12 & 1) != 0)
    v13 = 0;
  else
    v13 = objc_msgSend(v4, "skipMessageReformatting");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageContentView webViewConstants](self, "webViewConstants");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("shouldSkipReformatting"));

  objc_msgSend(v4, "securityInformation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageContentView _configureTrustEvaluationsForSignersInSecurityInformation:](self, "_configureTrustEvaluationsForSignersInSecurityInformation:", v16);
  -[MFMessageContentView atomManager](self, "atomManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "updateWithSecurityInformation:", v16);

  -[MFMessageContentView contentRequest](self, "contentRequest");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "message");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "senderList");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "replyToList");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[MFAddressAtomStatusManager shouldDecorateAtomListForSender:replyTo:](MFAddressAtomStatusManager, "shouldDecorateAtomListForSender:replyTo:", v41, v40))
  {
    -[MFMessageContentView atomManager](self, "atomManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "updateWithReplyToInformation:", v40);

  }
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
  {
    -[MFMessageContentView delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "messageContentView:didLoadSecurityInformation:", self, v16);

  }
  if ((objc_msgSend(v16, "hasEncryptedDescendantPart") & 1) != 0)
  {
    v22 = 2;
  }
  else
  {
    objc_msgSend(v16, "signers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (unint64_t)objc_msgSend(v23, "count") > 1;

    if (!v24)
      goto LABEL_15;
    v22 = 3;
  }
  -[MFMessageContentView setMessageBlockingReason:](self, "setMessageBlockingReason:", v22);
  if (!-[MFMessageContentView allowLoadOfBlockedMessageContent](self, "allowLoadOfBlockedMessageContent"))
  {
    -[MFMessageContentView _loadBlockedMessageContactWarningWithRepresentation:](self, "_loadBlockedMessageContactWarningWithRepresentation:", v4);
    goto LABEL_32;
  }
LABEL_15:
  v25 = objc_msgSend(v16, "isEncrypted");
  if ((v25 & objc_msgSend(v16, "isSigned")) != 1)
  {
    if ((v25 & 1) != 0)
      goto LABEL_17;
LABEL_20:
    objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "mf_blockRemoteContent");

    if ((v31 & 1) != 0)
    {
      v28 = 0;
      v29 = 4;
    }
    else
    {
      v32 = objc_msgSend(MEMORY[0x1E0C99EA0], "em_lockdownModeEnabled");
      v28 = v32 ^ 1;
      if (v32)
        v29 = 5;
      else
        v29 = 0;
    }
    goto LABEL_25;
  }
  objc_msgSend(v16, "smimeError");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26 == 0;

  if (v27)
    goto LABEL_20;
LABEL_17:
  v28 = 0;
  v29 = 1;
LABEL_25:
  objc_msgSend(v16, "signers");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "firstObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "signingCertificateTrustInfo");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "trustEvaluation");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "requiresReevaluationWithNetworkAccess");

  if (v37)
    -[MFMessageContentView setBlockedContentTypes:](self, "setBlockedContentTypes:", -[MFMessageContentView blockedContentTypes](self, "blockedContentTypes") | 2);
  if ((v28 & 1) != 0
    || -[MFMessageContentView allowLoadOfBlockedMessageContent](self, "allowLoadOfBlockedMessageContent")
    || objc_msgSend(v4, "showRemoteImages"))
  {
    v29 = 0;
  }
  -[MFMessageContentView setMessageBlockingReason:](self, "setMessageBlockingReason:", v29);
  -[MFMessageContentView _setRemoteContentToLoadWithoutProxy](self, "_setRemoteContentToLoadWithoutProxy");
  self->_webProcessCrashCount = 0;
  self->_backgroundWebProcessCrashCount = 0;
  lastCrashDate = self->_lastCrashDate;
  self->_lastCrashDate = 0;

  -[MFMessageContentView webViewLoadingController](self, "webViewLoadingController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "requestWebViewLoadWithContentRepresentation:", v4);

  -[MFMessageContentView _performQuickReplyMoveMessageBodyAnimationIfNeeded](self, "_performQuickReplyMoveMessageBodyAnimationIfNeeded");
LABEL_32:

}

- (void)_requestWebViewLoadWithLoadingContext:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  int v19;
  uint64_t v20;
  NSDate *lastCrashDate;
  void *v22;
  __int16 v23;

  v4 = a3;
  objc_msgSend(v4, "messageBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasEncryptedDescendantPart");

  if ((v6 & 1) != 0)
  {
    v7 = 2;
  }
  else
  {
    objc_msgSend(v4, "messageBody");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "signers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10 < 2)
    {
LABEL_6:
      objc_msgSend(v4, "messageBody");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "topLevelPart");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = 0;
      v13 = (id)objc_msgSend(v12, "decryptedMessageBodyIsEncrypted:isSigned:", (char *)&v23 + 1, &v23);
      if (HIBYTE(v23)
        && (!(_BYTE)v23
         || (objc_msgSend(v12, "SMIMEError"), v14 = (void *)objc_claimAutoreleasedReturnValue(), v14, v14)))
      {
        v15 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "mf_blockRemoteContent");

        if ((v17 & 1) != 0)
        {
          v15 = 4;
        }
        else
        {
          if (!objc_msgSend(MEMORY[0x1E0C99EA0], "em_lockdownModeEnabled"))
          {
            v20 = 0;
LABEL_18:
            -[MFMessageContentView setMessageBlockingReason:](self, "setMessageBlockingReason:", v20);
            -[MFMessageContentView _setRemoteContentToLoadWithoutProxy](self, "_setRemoteContentToLoadWithoutProxy");
            self->_webProcessCrashCount = 0;
            self->_backgroundWebProcessCrashCount = 0;
            lastCrashDate = self->_lastCrashDate;
            self->_lastCrashDate = 0;

            -[MFMessageContentView webViewLoadingController](self, "webViewLoadingController");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "requestWebViewLoadWithContext:", v4);

            goto LABEL_19;
          }
          v15 = 5;
        }
      }
      -[MFMessageContentView contentRepresentation](self, "contentRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "showRemoteImages");

      if (v19)
        v20 = 0;
      else
        v20 = v15;
      goto LABEL_18;
    }
    v7 = 3;
  }
  -[MFMessageContentView setMessageBlockingReason:](self, "setMessageBlockingReason:", v7);
  if (-[MFMessageContentView allowLoadOfBlockedMessageContent](self, "allowLoadOfBlockedMessageContent"))
    goto LABEL_6;
  -[MFMessageContentView _loadBlockedMessageContactWarning](self, "_loadBlockedMessageContactWarning");
LABEL_19:

}

- (void)_setRemoteContentToLoadWithoutProxy
{
  void *v3;
  NSObject *v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  MFMessageContentView *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_allRemoteURLs)
  {
    -[NSMutableDictionary allKeys](self->_failedProxyURLs, "allKeys");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      EMLogCategoryMessageLoading();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = (objc_class *)objc_opt_class();
        NSStringFromClass(v5);
        v6 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "ef_map:", &__block_literal_global_1416);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = 138543874;
        v11 = v6;
        v12 = 2048;
        v13 = self;
        v14 = 2114;
        v15 = v8;
        _os_log_impl(&dword_1D56AF000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: URLs to load without proxy: %{public}@", (uint8_t *)&v10, 0x20u);

      }
    }
    -[MFMessageContentView webViewConstants](self, "webViewConstants");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v3, CFSTR("remoteContentToLoadWithoutProxy"));

  }
}

- (void)_triggerWebViewLoad
{
  void *v3;
  void *v4;
  id v5;

  -[MFMessageContentView loadingContext](self, "loadingContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFMessageContentView webViewLoadingController](self, "webViewLoadingController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MFMessageContentView loadingContext](self, "loadingContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestWebViewLoadWithContext:", v4);
  }
  else
  {
    -[MFMessageContentView contentRepresentation](self, "contentRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestWebViewLoadWithContentRepresentation:", v4);
  }

}

- (void)_triggerWebViewLoadWithoutShowingContentRepresentation
{
  void *v3;
  void *v4;
  id v5;

  -[MFMessageContentView loadingContext](self, "loadingContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFMessageContentView webViewLoadingController](self, "webViewLoadingController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MFMessageContentView loadingContext](self, "loadingContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestWebViewLoadWithoutShowingMessageWithContext:", v4);
  }
  else
  {
    -[MFMessageContentView contentRepresentation](self, "contentRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestWebViewLoadWithoutShowingMessageWithRepresentation:", v4);
  }

}

- (void)_loadBlockedMessageContactWarningWithRepresentation:(id)a3
{
  -[MFMessageContentView setBlockedContentTypes:](self, "setBlockedContentTypes:", -[MFMessageContentView blockedContentTypes](self, "blockedContentTypes", a3) | 4);
  -[MFMessageContentView _triggerWebViewLoadWithoutShowingContentRepresentation](self, "_triggerWebViewLoadWithoutShowingContentRepresentation");
}

- (void)_loadBlockedMessageContactWarning
{
  -[MFMessageContentView setBlockedContentTypes:](self, "setBlockedContentTypes:", -[MFMessageContentView blockedContentTypes](self, "blockedContentTypes") | 4);
  -[MFMessageContentView _triggerWebViewLoadWithoutShowingContentRepresentation](self, "_triggerWebViewLoadWithoutShowingContentRepresentation");
}

- (void)generateSnapshotImageWithCompletion:(id)a3
{
  id v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  MFMessageContentView *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;
  CGSize v36;

  v35 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  -[MFMessageContentView headerView](self, "headerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0DC3C88]);
  objc_msgSend(v24, "frame");
  v5 = (void *)objc_msgSend(v4, "initWithFrame:");
  objc_msgSend(v5, "captureSnapshotOfView:withSnapshotType:", v24, 0);
  objc_msgSend(v5, "bounds");
  v36.width = v6;
  v36.height = v7;
  UIGraphicsBeginImageContextWithOptions(v36, 1, 0.0);
  objc_msgSend(v5, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "renderInContext:", UIGraphicsGetCurrentContext());

  UIGraphicsGetImageFromCurrentImageContext();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  -[MFMessageContentView webView](self, "webView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  v13 = v12;
  -[MFMessageContentView loadingContext](self, "loadingContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "message");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "messageID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[MFMessageContentView log](MFMessageContentView, "log");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v34 = v16;
    _os_log_impl(&dword_1D56AF000, v17, OS_LOG_TYPE_DEFAULT, "Waiting for a WebKit presentation update for message - libraryid=%{public}@", buf, 0xCu);
  }

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __60__MFMessageContentView_generateSnapshotImageWithCompletion___block_invoke;
  v25[3] = &unk_1E9A037F0;
  v18 = v10;
  v26 = v18;
  v19 = v11;
  v27 = v19;
  v20 = v16;
  v28 = v20;
  v29 = self;
  v32 = v13;
  v21 = v9;
  v30 = v21;
  v22 = v23;
  v31 = v22;
  objc_msgSend(v18, "_doAfterNextPresentationUpdate:", v25);

}

void __60__MFMessageContentView_generateSnapshotImageWithCompletion___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  double v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  if (v9 > v10 + v10)
    v9 = v10 + v10;
  +[MFMessageContentView log](MFMessageContentView, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543362;
    v23 = v12;
    _os_log_impl(&dword_1D56AF000, v11, OS_LOG_TYPE_DEFAULT, "ask webkit to take a snapshot - libraryid=%{public}@", buf, 0xCu);
  }

  v13 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 56), "bounds");
  v14 = *(double *)(a1 + 80);
  v16 = v14 * v15;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __60__MFMessageContentView_generateSnapshotImageWithCompletion___block_invoke_255;
  v17[3] = &unk_1E9A037C8;
  v21 = v14;
  v18 = *(id *)(a1 + 64);
  v19 = *(id *)(a1 + 32);
  v20 = *(id *)(a1 + 72);
  objc_msgSend(v13, "_snapshotRect:intoImageOfWidth:completionHandler:", v17, v3, v5, v7, v9, v16);

}

void __60__MFMessageContentView_generateSnapshotImageWithCompletion___block_invoke_255(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  double v26;
  double v27;
  uint64_t v28;
  double v29;

  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", a2, 0, *(double *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "size");
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 40), "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentSize");
  v14 = v13;
  v16 = v15;

  v17 = objc_alloc(MEMORY[0x1E0DC3828]);
  v18 = v11 + v16;
  if (v11 + v16 <= v7)
    v19 = v14;
  else
    v19 = v5;
  if (v11 + v16 > v7)
    v18 = v7;
  v20 = (void *)objc_msgSend(v17, "initWithSize:", v19, v18);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __60__MFMessageContentView_generateSnapshotImageWithCompletion___block_invoke_2;
  v23[3] = &unk_1E9A037A0;
  v22 = v3;
  v24 = v22;
  v26 = v5;
  v27 = v7;
  v25 = *(id *)(a1 + 32);
  v28 = v9;
  v29 = v11;
  objc_msgSend(v20, "imageWithActions:", v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __60__MFMessageContentView_generateSnapshotImageWithCompletion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 48), *(double *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 40), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (id)_libraryMessage
{
  void *v2;

  -[MFMessageLoadingContext message](self->_loadingContext, "message");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v2 = 0;
  }
  return v2;
}

- (void)_foundImageCIDAttachments:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("elementID"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("contentID"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[MessageContentItemsHelper associateElementID:withContentID:](self->_relatedItemsHelper, "associateElementID:withContentID:", v8, v9);
        -[MFMessageContentView webView](self, "webView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("wkIdentifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_attachmentForIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[MFMessageContentView _updateFileWrapperForAttachment:contentID:](self, "_updateFileWrapperForAttachment:contentID:", v12, v9);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

- (NSArray)contentItems
{
  return -[MessageContentItemsHelper contentItems](self->_relatedItemsHelper, "contentItems");
}

- (void)_displayDismissibleAttachmentErrorWithTitle:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  MFMessageContentView *v14;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__MFMessageContentView__displayDismissibleAttachmentErrorWithTitle_message___block_invoke;
  v11[3] = &unk_1E9A02D38;
  v8 = v6;
  v12 = v8;
  v9 = v7;
  v13 = v9;
  v14 = self;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "performBlock:", v11);

}

void __76__MFMessageContentView__displayDismissibleAttachmentErrorWithTitle_message___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", a1[4], a1[5], 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E9A04480, CFSTR("Main"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionWithTitle:style:handler:", v4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v5);

  WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 680));
  objc_msgSend(WeakRetained, "presentingViewControllerForMessageContentView:", a1[6]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentViewController:animated:completion:", v8, 1, 0);

}

- (void)_alertMailDropDownloadIsTooLargeForCell:(BOOL)a3
{
  void *v4;
  void *v5;
  int v6;
  char v7;
  __CFString *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MULTI_MAILDROP_ATTACHMENT_LARGE_TITLE"), &stru_1E9A04480, CFSTR("Main"));
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend((id)CPGetDeviceRegionCode(), "isEqualToString:", CFSTR("CH"));
    v7 = v6;
    v8 = CFSTR("MULTI_MAILDROP_ATTACHMENT_LARGE_MESSAGE");
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_CH"), CFSTR("MULTI_MAILDROP_ATTACHMENT_LARGE_MESSAGE"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SINGLE_MAILDROP_ATTACHMENT_LARGE_TITLE"), &stru_1E9A04480, CFSTR("Main"));
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend((id)CPGetDeviceRegionCode(), "isEqualToString:", CFSTR("CH"));
    v7 = v10;
    v8 = CFSTR("SINGLE_MAILDROP_ATTACHMENT_LARGE_MESSAGE");
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_CH"), CFSTR("SINGLE_MAILDROP_ATTACHMENT_LARGE_MESSAGE"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v8, &stru_1E9A04480, CFSTR("Main"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 & 1) != 0)

  -[MFMessageContentView _displayDismissibleAttachmentErrorWithTitle:message:](self, "_displayDismissibleAttachmentErrorWithTitle:message:", v12, v11);
}

- (void)_handleAttachmentTapMessage:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("element_id"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rect"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MUICGRectFromNSDictionary();
  -[MFMessageContentView _adjustedRectForWebRect:](self, "_adjustedRectForWebRect:");
  -[MessageContentItemsHelper attachmentWasTappedWithElementID:rect:view:](self->_relatedItemsHelper, "attachmentWasTappedWithElementID:rect:view:", v4, self);

}

- (void)_handleAttachmentSaveMessage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[MFMessageContentView contentItemForSaveMenu](self, "contentItemForSaveMenu");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("element_id"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageContentView _contentItemForElement:](self, "_contentItemForElement:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (-[MFMessageContentView sourceIsManaged](self, "sourceIsManaged"))
      {
        -[MFMessageContentView _saveContentItemToPicker:](self, "_saveContentItemToPicker:", v6);
      }
      else
      {
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("rect"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        MUICGRectFromNSDictionary();
        v9 = v8;
        v11 = v10;
        v13 = v12;
        v15 = v14;

        -[MFMessageContentView setContentItemForSaveMenu:](self, "setContentItemForSaveMenu:", v6);
        -[MFMessageContentView _adjustedRectForWebRect:](self, "_adjustedRectForWebRect:", v9, v11, v13, v15);
        -[MFMessageContentView setContentItemRectForSaveMenu:](self, "setContentItemRectForSaveMenu:");
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36C0]), "initWithDelegate:", self);
        -[MFMessageContentView webView](self, "webView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addInteraction:", v16);

        objc_msgSend(v16, "_presentMenuAtLocation:", v9, v11);
      }
    }

  }
}

- (CGRect)_adjustedRectForWebRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  __int128 v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MFMessageContentView webView](self, "webView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "zoomScale");
  v11 = v10;

  *(_QWORD *)&v12 = -1;
  *((_QWORD *)&v12 + 1) = -1;
  *(_OWORD *)&v34.c = v12;
  *(_OWORD *)&v34.tx = v12;
  *(_OWORD *)&v34.a = v12;
  CGAffineTransformMakeScale(&v34, v11, v11);
  v33 = v34;
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v36 = CGRectApplyAffineTransform(v35, &v33);
  v13 = v36.origin.x;
  v14 = v36.origin.y;
  v15 = v36.size.width;
  v16 = v36.size.height;
  -[MFMessageContentView webView](self, "webView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scrollView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contentOffset");
  v20 = v19;
  -[MFMessageContentView webView](self, "webView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "scrollView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "contentOffset");
  v24 = -v23;
  v37.origin.x = v13;
  v37.origin.y = v14;
  v37.size.width = v15;
  v37.size.height = v16;
  v38 = CGRectOffset(v37, -v20, v24);
  v25 = v38.origin.x;
  v26 = v38.origin.y;
  v27 = v38.size.width;
  v28 = v38.size.height;

  v29 = v25;
  v30 = v26;
  v31 = v27;
  v32 = v28;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)_expandQuoteWithCollapsedBlockquoteOffset:(double)a3 expandedOffset:(double)a4
{
  double v7;
  double v8;
  id v9;
  CGRect v10;
  CGRect v11;

  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    -[MFMessageHeaderView frame](self->_headerView, "frame");
    v7 = a3 - CGRectGetHeight(v10);
    -[MFMessageHeaderView frame](self->_headerView, "frame");
    v8 = a4 - CGRectGetHeight(v11);
    -[MFMessageContentView delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messageContentView:expandQuoteAtCollapsedOffset:expandedOffset:", self, 0.0, v7, 0.0, v8);

  }
}

- (void)_seeMoreButtonTapped
{
  id v3;

  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    -[MFMessageContentView delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "messageContentView:expandQuoteAtCollapsedOffset:expandedOffset:", self, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

  }
}

- (void)_revealActionsButtonTapped
{
  void *v3;
  id v4;

  if ((*(_WORD *)&self->_flags & 0x80) != 0)
  {
    -[MFMessageContentView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[MFConversationItemFooterView revealActionsButton](self->_footerView, "revealActionsButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageContentView:didTapRevealActionsButton:", self, v3);

  }
}

- (void)_undoSendButtonTapped
{
  void *v3;
  id v4;

  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    -[MFMessageContentView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[MFConversationItemFooterView undoSendButton](self->_footerView, "undoSendButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageContentView:didTapUndoSendButton:", self, v3);

  }
}

- (id)_quotedContentAttributionForMessage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D1EEC0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__MFMessageContentView__quotedContentAttributionForMessage___block_invoke;
  v9[3] = &unk_1E9A03818;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "futureWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __60__MFMessageContentView__quotedContentAttributionForMessage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "messageContentView:quotedContentAttributionForMessage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  else
    +[MFQuotedContentAttribution unknownAttribution](MFQuotedContentAttribution, "unknownAttribution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)webProcessDidFailLoadingResourceWithURL:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  MFMessageContentView *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  EMLogCategoryMessageLoading();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0D1EF48];
    objc_msgSend(v4, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fullyRedactedStringForString:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[MFMessageContentView contentRequest](self, "contentRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageContentView contentRequest](self, "contentRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "message");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544386;
    v15 = v7;
    v16 = 2048;
    v17 = self;
    v18 = 2114;
    v19 = v10;
    v20 = 2114;
    v21 = v11;
    v22 = 2114;
    v23 = v13;
    _os_log_error_impl(&dword_1D56AF000, v5, OS_LOG_TYPE_ERROR, "<%{public}@: %p> Web process did fail to load resource URL: %{public}@ for content request: %{public}@, message: %{public}@", (uint8_t *)&v14, 0x34u);

  }
  -[MessageContentItemsHelper noteDidFailLoadingResourceWithURL:](self->_relatedItemsHelper, "noteDidFailLoadingResourceWithURL:", v4);

}

- (void)webProcessDidFinishDocumentLoadForURL:(id)a3 andRequestedRemoteURLs:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSSet *v12;
  NSSet *allRemoteURLs;
  NSMutableDictionary *failedProxyURLs;
  _QWORD v15[5];
  os_activity_scope_state_s state;

  v6 = a4;
  v7 = a3;
  v8 = _os_activity_create(&dword_1D56AF000, "-[MFMessageContentView webProcessDidFinishDocumentLoadForURL:andRequestedRemoteURLs:]", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  -[MessageContentItemsHelper noteDidFinishDocumentLoadForURL:](self->_relatedItemsHelper, "noteDidFinishDocumentLoadForURL:", v7);

  -[MFMessageContentView delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((*(_WORD *)&self->_flags & 1) != 0)
    objc_msgSend(v9, "messageContentViewDidFinishLoadingMessage:", self);
  -[MFMessageContentView _beginObservingContentHeight](self, "_beginObservingContentHeight");
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "launchedToTest"))
    objc_msgSend(v10, "messageContentViewContentLayerFinished:", self);
  objc_msgSend(v6, "ef_mapSelector:", sel_absoluteString);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v11);
  allRemoteURLs = self->_allRemoteURLs;
  self->_allRemoteURLs = v12;

  failedProxyURLs = self->_failedProxyURLs;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__MFMessageContentView_webProcessDidFinishDocumentLoadForURL_andRequestedRemoteURLs___block_invoke;
  v15[3] = &unk_1E9A03840;
  v15[4] = self;
  -[NSMutableDictionary ef_removeObjectsPassingTest:](failedProxyURLs, "ef_removeObjectsPassingTest:", v15);
  -[MFMessageContentView _showLoadFailedProxyContentBannerIfNeeded](self, "_showLoadFailedProxyContentBannerIfNeeded");
  objc_msgSend(v10, "messageContentView:viewedRemoteURLs:", self, v6);

  os_activity_scope_leave(&state);
}

uint64_t __85__MFMessageContentView_webProcessDidFinishDocumentLoadForURL_andRequestedRemoteURLs___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 616), "containsObject:", a2) ^ 1;
}

- (void)webProcessDidFinishLoadForURL:(id)a3
{
  NSObject *v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  MFMessageContentView *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  EMLogCategoryMessageLoading();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[MFMessageContentView contentRequest](self, "contentRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ef_publicDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageContentView contentRequest](self, "contentRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "message");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ef_publicDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138544130;
    v17 = v6;
    v18 = 2048;
    v19 = self;
    v20 = 2114;
    v21 = v8;
    v22 = 2114;
    v23 = v11;
    _os_log_impl(&dword_1D56AF000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Web process did finish load for content request: %{public}@ message: %{public}@", (uint8_t *)&v16, 0x2Au);

  }
  -[MFMessageContentView webView](self, "webView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_dataDetectionResults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1F070], "globalAsyncScheduler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageContentView ef_onScheduler:](self, "ef_onScheduler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_processDataDetectionMetricsFromResults:", v13);

}

- (void)webProcessDidBlockLoadingResourceWithURL:(id)a3
{
  NSObject *v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  MFMessageContentView *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[MFMessageContentView setBlockedContentTypes:](self, "setBlockedContentTypes:", -[MFMessageContentView blockedContentTypes](self, "blockedContentTypes", a3) | 1);
  EMLogCategoryMessageLoading();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[MFMessageContentView contentRequest](self, "contentRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ef_publicDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageContentView contentRequest](self, "contentRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "message");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ef_publicDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544130;
    v13 = v6;
    v14 = 2048;
    v15 = self;
    v16 = 2114;
    v17 = v8;
    v18 = 2114;
    v19 = v11;
    _os_log_impl(&dword_1D56AF000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Web process did block loading resource for content request: %{public}@ message: %{public}@", (uint8_t *)&v12, 0x2Au);

  }
}

- (void)webProcessFailedToLoadResourceWithProxyForURL:(id)a3 failureReason:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSSet *allRemoteURLs;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  MFMessageContentView *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  EMLogCategoryMessageLoading();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[MFMessageContentView contentRequest](self, "contentRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ef_publicDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageContentView contentRequest](self, "contentRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "message");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ef_publicDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138544130;
    v19 = v12;
    v20 = 2048;
    v21 = self;
    v22 = 2114;
    v23 = v14;
    v24 = 2114;
    v25 = v17;
    _os_log_error_impl(&dword_1D56AF000, v7, OS_LOG_TYPE_ERROR, "<%{public}@: %p> Web process did fail to load content request: %{public}@ message: %{public}@", (uint8_t *)&v18, 0x2Au);

  }
  objc_msgSend(v6, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  allRemoteURLs = self->_allRemoteURLs;
  if (!allRemoteURLs || -[NSSet containsObject:](allRemoteURLs, "containsObject:", v8))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_failedProxyURLs, "setObject:forKeyedSubscript:", v10, v8);

  }
  -[MFMessageContentView _showLoadFailedProxyContentBannerIfNeeded](self, "_showLoadFailedProxyContentBannerIfNeeded");

}

- (void)_showLoadFailedProxyContentBannerIfNeeded
{
  NSMutableDictionary *failedProxyURLs;
  void *v4;
  char v5;
  MFLoadFailedProxyContentBannerView *v6;
  MFLoadFailedProxyContentBannerView *v7;
  MFLoadFailedProxyContentBannerView *loadFailedProxyContentBanner;
  NSObject *v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  MFMessageContentView *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[MFMessageContentView showsBanners](self, "showsBanners")
    && self->_allRemoteURLs
    && -[NSMutableDictionary count](self->_failedProxyURLs, "count")
    && !self->_loadFailedProxyContentBanner)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    failedProxyURLs = self->_failedProxyURLs;
    v19 = 2;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __65__MFMessageContentView__showLoadFailedProxyContentBannerIfNeeded__block_invoke;
    v15[3] = &unk_1E9A03868;
    v15[4] = &v16;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](failedProxyURLs, "enumerateKeysAndObjectsUsingBlock:", v15);
    if (v17[3] != 2
      || (objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "BOOLForKey:", *MEMORY[0x1E0D1E070]),
          v4,
          (v5 & 1) == 0))
    {
      v6 = [MFLoadFailedProxyContentBannerView alloc];
      v7 = -[MFLoadFailedProxyContentBannerView initWithFrame:failureReason:](v6, "initWithFrame:failureReason:", v17[3], *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      loadFailedProxyContentBanner = self->_loadFailedProxyContentBanner;
      self->_loadFailedProxyContentBanner = v7;

      -[MFLoadFailedProxyContentBannerView setDelegate:](self->_loadFailedProxyContentBanner, "setDelegate:", self);
      -[MFMessageHeaderView insertHeaderBlock:atIndex:animated:](self->_headerView, "insertHeaderBlock:atIndex:animated:", self->_loadFailedProxyContentBanner, 0, 1);
      EMLogCategoryMessageLoading();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary allKeys](self->_failedProxyURLs, "allKeys");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "ef_map:", &__block_literal_global_1416);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543874;
        v21 = v11;
        v22 = 2048;
        v23 = self;
        v24 = 2114;
        v25 = v14;
        _os_log_impl(&dword_1D56AF000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: Displaying failed proxy load banner due to: %{public}@", buf, 0x20u);

      }
    }
    _Block_object_dispose(&v16, 8);
  }
}

void __65__MFMessageContentView__showLoadFailedProxyContentBannerIfNeeded__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v6 = objc_msgSend(v9, "integerValue");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(_QWORD *)(v7 + 24);
  if (v6 < v8)
  {
    *(_QWORD *)(v7 + 24) = v6;
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  if (!v8)
    *a4 = 1;

}

- (void)setBlockedContentTypes:(unint64_t)a3
{
  MFLoadBlockedContentBannerView *loadImagesHeaderBlock;
  MFLoadBlockedContentBannerView *v5;
  unint64_t blockedContentTypes;
  int64_t v7;
  MFLoadBlockedContentBannerView *v8;
  MFLoadBlockedContentBannerView *v9;

  if (self->_blockedContentTypes != a3)
  {
    self->_blockedContentTypes = a3;
    if (-[MFMessageContentView showsBanners](self, "showsBanners"))
    {
      if (self->_blockedContentTypes)
      {
        loadImagesHeaderBlock = self->_loadImagesHeaderBlock;
        if (loadImagesHeaderBlock)
        {
          -[MFLoadBlockedContentBannerView setBlockedContentTypes:](loadImagesHeaderBlock, "setBlockedContentTypes:");
        }
        else
        {
          v5 = [MFLoadBlockedContentBannerView alloc];
          blockedContentTypes = self->_blockedContentTypes;
          v7 = -[MFMessageContentView messageBlockingReason](self, "messageBlockingReason");
          v8 = -[MFLoadBlockedContentBannerView initWithFrame:blockedContentTypes:blockingReason:](v5, "initWithFrame:blockedContentTypes:blockingReason:", blockedContentTypes, v7, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
          v9 = self->_loadImagesHeaderBlock;
          self->_loadImagesHeaderBlock = v8;

          -[MFLoadBlockedContentBannerView setDelegate:](self->_loadImagesHeaderBlock, "setDelegate:", self);
          -[MFMessageHeaderView insertHeaderBlock:atIndex:animated:](self->_headerView, "insertHeaderBlock:atIndex:animated:", self->_loadImagesHeaderBlock, 0, 1);
        }
      }
      else
      {
        -[MFMessageContentView _clearLoadRemoteImagesBannerAnimated:](self, "_clearLoadRemoteImagesBannerAnimated:", 1);
      }
    }
  }
}

- (void)_configureTrustEvaluationsForSignersInSecurityInformation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  MFMessageContentView *v15;
  id v16;
  uint64_t v17;

  v4 = a3;
  objc_msgSend(v4, "signers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mf_blockRemoteContent");

  -[MFMessageContentView trustConfigurationScheduler](self, "trustConfigurationScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v10 = 0;
  else
    v10 = 3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__MFMessageContentView__configureTrustEvaluationsForSignersInSecurityInformation___block_invoke;
  v13[3] = &unk_1E9A03160;
  v11 = v6;
  v17 = v10;
  v14 = v11;
  v15 = self;
  v12 = v4;
  v16 = v12;
  objc_msgSend(v9, "performBlock:", v13);

}

void __82__MFMessageContentView__configureTrustEvaluationsForSignersInSecurityInformation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "evaluateTrustsWithOptions:", *(_QWORD *)(a1 + 56));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __82__MFMessageContentView__configureTrustEvaluationsForSignersInSecurityInformation___block_invoke_2;
  v4[3] = &unk_1E9A02DD8;
  v2 = *(void **)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = v2;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler", v4[0], 3221225472, __82__MFMessageContentView__configureTrustEvaluationsForSignersInSecurityInformation___block_invoke_2, &unk_1E9A02DD8, v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performBlock:", v4);

}

void __82__MFMessageContentView__configureTrustEvaluationsForSignersInSecurityInformation___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "atomManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateWithSecurityInformation:", *(_QWORD *)(a1 + 40));

}

- (void)webProcessDidCreateBrowserContextControllerLoadDelegate
{
  id v2;

  -[MFMessageContentView webViewLoadingController](self, "webViewLoadingController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "webProcessBrowserContextControllerDidBecomeAvailable");

}

- (void)_processDataDetectionMetricsFromResults:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v9 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__MFMessageContentView__processDataDetectionMetricsFromResults___block_invoke;
  v10[3] = &unk_1E9A03890;
  v5 = v3;
  v11 = v5;
  v6 = v4;
  v12 = v6;
  v7 = objc_msgSend(v9, "ef_countObjectsPassingTest:", v10);
  if (v7 >= 5)
    v8 = 5;
  else
    v8 = v7;
  for (; v8; --v8)
    objc_msgSend(MEMORY[0x1E0D198B8], "shownViaDataDetectorsLinkInApp:", 3);

}

BOOL __64__MFMessageContentView__processDataDetectionMetricsFromResults___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  objc_msgSend(v2, "coreResult");
  if (DDResultGetCategory() == 4
    && (objc_msgSend(v2, "coreResult"), DDResultHasProperties()))
  {
    objc_msgSend(v2, "coreResult");
    v3 = DDResultIsPastDate() == 0;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (int64_t)_webView:(id)a3 decidePolicyForFocusedElement:(id)a4
{
  if (objc_msgSend(a4, "isUserInitiated", a3))
    return 0;
  else
    return 2;
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void (*v34)(id, uint64_t);
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  NSObject *v41;
  objc_class *v42;
  objc_class *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  objc_class *v58;
  objc_class *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  _QWORD v67[5];
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  MFMessageContentView *v71;
  __int16 v72;
  void *v73;
  _QWORD v74[2];

  v74[1] = *MEMORY[0x1E0C80C00];
  v66 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  objc_msgSend(v8, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "scheme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageContentView contentRepresentationIfAvailable](self, "contentRepresentationIfAvailable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "scheme");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", v15))
  {
    objc_msgSend(v11, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "hasPrefix:", v17);

  }
  else
  {
    v18 = 0;
  }

  objc_msgSend(v8, "targetFrame");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isMainFrame");

  v21 = objc_msgSend(&unk_1E9A145B8, "containsObject:", v12);
  if (v18)
  {
    objc_msgSend(v11, "fragment");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      -[MFMessageContentView webView](self, "webView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v74[0] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "mcv_dictionaryFromJavaScriptMethod:arguments:", CFSTR("rectForAnchor"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v67[0] = MEMORY[0x1E0C809B0];
      v67[1] = 3221225472;
      v67[2] = __80__MFMessageContentView_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke;
      v67[3] = &unk_1E9A038B8;
      v67[4] = self;
      objc_msgSend(v25, "addSuccessBlock:", v67);

    }
    else if (objc_msgSend(v8, "navigationType") == -1 || objc_msgSend(v8, "navigationType") == 3)
    {
      v26 = 1;
      goto LABEL_16;
    }
    v26 = 0;
LABEL_16:
    -[NSMutableSet removeAllObjects](self->_inFlightURLs, "removeAllObjects");
    v9[2](v9, v26);

    goto LABEL_17;
  }
  v27 = v21;
  if (!-[NSMutableSet containsObject:](self->_inFlightURLs, "containsObject:", v11))
  {
    if (v27)
    {
      v9[2](v9, 0);
      if (!v20)
        goto LABEL_17;
      objc_msgSend(MEMORY[0x1E0D1CF68], "sharedController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "_dataDetectionResults");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageContentView _dataDetectionContextForWebView:](self, "_dataDetectionContextForWebView:", v66);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "defaultActionForURL:results:context:", v11, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "performAction:inView:interactionDelegate:", v31, v66, 0);
LABEL_22:

      goto LABEL_17;
    }
    if (v20 && objc_msgSend(v11, "isFaceTimeMultiwayURL"))
    {
      v9[2](v9, 0);
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD308]), "initWithURL:", v11);
      v28 = v32;
      if (v32)
      {
        objc_msgSend(v32, "setWantsStagingArea:", 1);
        objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "launchAppForJoinRequest:", v28);

      }
      goto LABEL_22;
    }
    v34 = v9[2];
    if (self->_showingError)
    {
      v34(v9, 1);
      goto LABEL_17;
    }
    v34(v9, 0);
    -[MFMessageContentView delegate](self, "delegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageContentView contentRepresentationIfAvailable](self, "contentRepresentationIfAvailable");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      -[MFMessageContentView contentRequest](self, "contentRequest");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "message");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "messageContentView:clickedLinkInMessage:scheme:", self, v38, v12);

    }
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("file")))
    {
      objc_msgSend(v11, "path");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "containsString:", CFSTR("Library/Mail"));

      if (v40)
      {
        EMLogCategoryMessageLoading();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
        {
          v42 = (objc_class *)objc_opt_class();
          NSStringFromClass(v42);
          objc_claimAutoreleasedReturnValue();
          -[MFMessageContentView webView:decidePolicyForNavigationAction:decisionHandler:].cold.1();
        }
      }
      else
      {
        EMLogCategoryMessageLoading();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v58 = (objc_class *)objc_opt_class();
          NSStringFromClass(v58);
          objc_claimAutoreleasedReturnValue();
          -[MFMessageContentView webView:decidePolicyForNavigationAction:decisionHandler:].cold.2();
        }
      }
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("prefs")))
    {
      EMLogCategoryMessageLoading();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v43 = (objc_class *)objc_opt_class();
        NSStringFromClass(v43);
        objc_claimAutoreleasedReturnValue();
        -[MFMessageContentView webView:decidePolicyForNavigationAction:decisionHandler:].cold.3();
      }
    }
    else
    {
      objc_msgSend(v8, "targetFrame");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
        v45 = v20;
      else
        v45 = 1;

      if (v45 == 1)
      {
        if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D1DCD8]))
        {
          -[MFMessageContentView contentRequest](self, "contentRequest");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "resultIfAvailable");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "requestedHeaders");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "headersForKey:", *MEMORY[0x1E0D1E570]);
          v65 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v11, 1);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v65;
          if (objc_msgSend(v65, "count"))
          {
            v63 = v49;
            objc_msgSend(v65, "firstObject");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D1E7B8], "tagValueListFromString:error:", v62, 0);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_alloc(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v49, "queryItems");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = (void *)objc_msgSend(v51, "initWithArray:copyItems:", v52, 1);

            v53 = objc_alloc(MEMORY[0x1E0CB39D8]);
            objc_msgSend(MEMORY[0x1E0C99E98], "em_mailToFromQueryItemKey");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "objectForKeyedSubscript:", *MEMORY[0x1E0D1DC30]);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = (void *)objc_msgSend(v53, "initWithName:value:", v54, v55);

            v49 = v63;
            objc_msgSend(v61, "addObject:", v56);
            objc_msgSend(v63, "setQueryItems:", v61);

            v50 = v65;
          }
          objc_msgSend(v49, "URL");
          v57 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v57;
        }
        objc_msgSend(v35, "messageContentView:openPossibleStoreURL:", self, v11);
        goto LABEL_48;
      }
      EMLogCategoryMessageLoading();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v59 = (objc_class *)objc_opt_class();
        NSStringFromClass(v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v69 = v60;
        v70 = 2048;
        v71 = self;
        v72 = 2112;
        v73 = v11;
        _os_log_error_impl(&dword_1D56AF000, v41, OS_LOG_TYPE_ERROR, "<%{public}@: %p>: Blocking navigation action for request whose target frame is not the main frame (iframe, probably): %@", buf, 0x20u);

      }
    }

LABEL_48:
    goto LABEL_17;
  }
  v9[2](v9, 0);
  -[NSMutableSet removeObject:](self->_inFlightURLs, "removeObject:", v11);
LABEL_17:

}

void __80__MFMessageContentView_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  CGRect v15;

  v3 = a2;
  if (v3)
  {
    v14 = v3;
    MUICGRectFromNSDictionary();
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15.origin.x = v5;
    v15.origin.y = v7;
    v15.size.width = v9;
    v15.size.height = v11;
    if (!CGRectEqualToRect(v15, *MEMORY[0x1E0C9D648]) && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v13 = *(void **)(a1 + 32);
      objc_msgSend(v13, "_adjustedRectForWebRect:", v5, v7, v9, v11);
      objc_msgSend(v12, "messageContentView:scrollToRect:", v13);
    }

    v3 = v14;
  }

}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  (*((void (**)(id, uint64_t))a5 + 2))(a5, 1);
}

- (void)_webView:(id)a3 renderingProgressDidChange:(unint64_t)a4
{
  char v4;
  id v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  BOOL v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  _BOOL8 v33;
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  MFMessageContentView *v40;
  uint64_t v41;

  v4 = a4;
  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((v4 & 0x40) != 0)
  {
    -[MFMessageContentView initialContentOffset](self, "initialContentOffset");
    if (v7 > 0.0 || (-[MFMessageContentView initialContentOffset](self, "initialContentOffset"), v8 > 0.0))
    {
      -[MFMessageContentView scrollView](self, "scrollView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageContentView initialContentOffset](self, "initialContentOffset");
      objc_msgSend(v9, "setContentOffset:");

    }
    self->_suppressContentSizeNotificationsUntilFirstPaint = 0;
    v10 = MEMORY[0x1E0C809B0];
    if ((*(_WORD *)&self->_flags & 2) != 0)
    {
      -[MFMessageContentView delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "messageContentViewDidFinishFirstPaint:", self);

      objc_msgSend(v6, "scrollView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "contentSize");
      -[MFMessageContentView _notifyDelegateScrollViewSizeChanged:](self, "_notifyDelegateScrollViewSizeChanged:");

      -[MFMessageContentView scrollView](self, "scrollView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "contentOffset");
      v15 = v14;
      -[MFMessageContentView scrollView](self, "scrollView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "contentInset");
      v18 = v17;
      objc_msgSend(v6, "scrollView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setContentOffset:", v15, -v18);

      v36[0] = v10;
      v36[1] = 3221225472;
      v36[2] = __60__MFMessageContentView__webView_renderingProgressDidChange___block_invoke;
      v36[3] = &unk_1E9A02D88;
      v36[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v36, 0.2);
    }
    EMLogCategoryMessageLoading();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v22;
      v39 = 2048;
      v40 = self;
      _os_log_impl(&dword_1D56AF000, v20, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: rendering progress did first paint, removing loading indicator", buf, 0x16u);

    }
    -[MFMessageContentView setLoadingIndicatorVisible:](self, "setLoadingIndicatorVisible:", 0);
    -[MFMessageContentView _performQuickReplySnapshotFadeOutAnimationIfNecessary](self, "_performQuickReplySnapshotFadeOutAnimationIfNecessary");
    if (-[MFMessageContentView initiallyZoomsToShowAllContent](self, "initiallyZoomsToShowAllContent"))
    {
      -[MFMessageContentView scrollView](self, "scrollView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "minimumZoomScale");
      v25 = v24;
      -[MFMessageContentView scrollView](self, "scrollView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setZoomScale:", v25);

    }
    -[MFMessageContentView previousContentSnapshot](self, "previousContentSnapshot");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27 == 0;

    if (!v28)
    {
      EMLogCategoryMessageLoading();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v31;
        v39 = 2048;
        v40 = self;
        _os_log_impl(&dword_1D56AF000, v29, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: removing previous content snapshot", buf, 0x16u);

      }
      v34[4] = self;
      v35[0] = v10;
      v35[1] = 3221225472;
      v35[2] = __60__MFMessageContentView__webView_renderingProgressDidChange___block_invoke_328;
      v35[3] = &unk_1E9A02D88;
      v35[4] = self;
      v34[0] = v10;
      v34[1] = 3221225472;
      v34[2] = __60__MFMessageContentView__webView_renderingProgressDidChange___block_invoke_2;
      v34[3] = &unk_1E9A038E0;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v35, v34, 0.100000001);
    }
    -[MFMessageContentView contentRepresentationIfAvailable](self, "contentRepresentationIfAvailable");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32 != 0;

    -[MFMessageContentView _logRequestFinishWithSuccess:](self, "_logRequestFinishWithSuccess:", v33);
    -[MFMessageContentView setHasVisibleContent:](self, "setHasVisibleContent:", 1);
  }

}

void __60__MFMessageContentView__webView_renderingProgressDidChange___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "footerView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __60__MFMessageContentView__webView_renderingProgressDidChange___block_invoke_328(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setAlpha:", 0.0);
}

uint64_t __60__MFMessageContentView__webView_renderingProgressDidChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPreviousContentSnapshot:", 0);
}

- (void)setHasVisibleContent:(BOOL)a3
{
  void *v4;
  id v5;
  id v6;

  if (self->_hasVisibleContent != a3)
  {
    self->_hasVisibleContent = a3;
    if (a3 && (*(_WORD *)&self->_flags & 4) != 0)
    {
      -[MFMessageContentView delegate](self, "delegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[MFMessageContentView contentRepresentationIfAvailable](self, "contentRepresentationIfAvailable");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "messageContentViewDidDisplayContent:success:", self, v4 != 0);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", MFMessageContentViewDidAppear, self);

  }
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  MFMessageContentView *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  EMLogCategoryMessageLoading();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ef_publicDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v9;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = v10;
    _os_log_error_impl(&dword_1D56AF000, v7, OS_LOG_TYPE_ERROR, "<%{public}@: %p>: Message Content View did fail navigation: %{public}@", (uint8_t *)&v11, 0x20u);

  }
}

- (void)_webViewWebProcessDidBecomeUnresponsive:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  MFMessageContentView *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  EMLogCategoryMessageLoading();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544386;
    v12 = v9;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = v10;
    v17 = 2112;
    v18 = v5;
    v19 = 1024;
    v20 = objc_msgSend(v5, "_webProcessIdentifier");
    _os_log_error_impl(&dword_1D56AF000, v6, OS_LOG_TYPE_ERROR, "<%{public}@: %p>: %{public}@ %@ (pid: %d)", (uint8_t *)&v11, 0x30u);

  }
  -[MFMessageContentView webView](self, "webView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_killWebContentProcess");

}

- (BOOL)_lastCrashDateExceedsThreshhold
{
  NSDate *lastCrashDate;
  double v3;

  lastCrashDate = self->_lastCrashDate;
  if (lastCrashDate)
  {
    -[NSDate timeIntervalSinceNow](lastCrashDate, "timeIntervalSinceNow");
    LOBYTE(lastCrashDate) = v3 > 300.0;
  }
  return (char)lastCrashDate;
}

- (void)_webView:(id)a3 webContentProcessDidTerminateWithReason:(int64_t)a4
{
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  unint64_t webProcessCrashCount;
  unint64_t backgroundWebProcessCrashCount;
  uint64_t v14;
  void (**v15)(_QWORD);
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  id v24;
  objc_class *v25;
  id v26;
  void *v27;
  int v28;
  unint64_t v29;
  objc_class *v30;
  int v31;
  unint64_t v32;
  NSDate *lastCrashDate;
  void *v34;
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  SEL v39;
  _QWORD block[5];
  _QWORD aBlock[6];
  uint8_t buf[4];
  id v43;
  __int16 v44;
  MFMessageContentView *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  unint64_t v49;
  __int16 v50;
  _BYTE v51[14];
  __int16 v52;
  unint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  NSDate *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (-[MFMessageContentView _lastCrashDateExceedsThreshhold](self, "_lastCrashDateExceedsThreshhold"))
  {
    EMLogCategoryMessageLoading();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      webProcessCrashCount = self->_webProcessCrashCount;
      backgroundWebProcessCrashCount = self->_backgroundWebProcessCrashCount;
      *(_DWORD *)buf = 138544386;
      v43 = v10;
      v44 = 2048;
      v45 = self;
      v46 = 2114;
      v47 = v11;
      v48 = 2048;
      v49 = webProcessCrashCount;
      v50 = 2048;
      *(_QWORD *)v51 = backgroundWebProcessCrashCount;
      _os_log_impl(&dword_1D56AF000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: %{public}@ resetting crash count: %ld and background crash count: %ld to 0 due to exceeded time threshold", buf, 0x34u);

    }
    self->_webProcessCrashCount = 0;
    self->_backgroundWebProcessCrashCount = 0;
  }
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__MFMessageContentView__webView_webContentProcessDidTerminateWithReason___block_invoke;
  aBlock[3] = &unk_1E9A03360;
  aBlock[4] = self;
  aBlock[5] = a4;
  v15 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[MFMessageContentView window](self, "window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "windowScene");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "activationState");

  if (v18 == 2)
  {
    ++self->_backgroundWebProcessCrashCount;
    EMLogCategoryMessageLoading();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v7, "_webProcessIdentifier");
      v29 = self->_backgroundWebProcessCrashCount;
      *(_DWORD *)buf = 138544898;
      v43 = v26;
      v44 = 2048;
      v45 = self;
      v46 = 2114;
      v47 = v27;
      v48 = 2112;
      v49 = (unint64_t)v7;
      v50 = 1024;
      *(_DWORD *)v51 = v28;
      *(_WORD *)&v51[4] = 2048;
      *(_QWORD *)&v51[6] = a4;
      v52 = 2048;
      v53 = v29;
      _os_log_error_impl(&dword_1D56AF000, v19, OS_LOG_TYPE_ERROR, "<%{public}@: %p>: %{public}@ %@ (pid: %d; reason: %ld; background crash count: %ld)",
        buf,
        0x44u);

    }
  }
  else
  {
    -[NSMutableSet removeAllObjects](self->_inFlightURLs, "removeAllObjects");
    ++self->_webProcessCrashCount;
    EMLogCategoryMessageLoading();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v35 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v7, "_webProcessIdentifier");
      v32 = self->_webProcessCrashCount;
      lastCrashDate = self->_lastCrashDate;
      *(_DWORD *)buf = 138545410;
      v43 = v35;
      v44 = 2048;
      v45 = self;
      v46 = 2114;
      v47 = v34;
      v48 = 2112;
      v49 = (unint64_t)v7;
      v50 = 1024;
      *(_DWORD *)v51 = v31;
      *(_WORD *)&v51[4] = 2048;
      *(_QWORD *)&v51[6] = a4;
      v52 = 2048;
      v53 = v32;
      v54 = 2048;
      v55 = v18;
      v56 = 2114;
      v57 = lastCrashDate;
      _os_log_error_impl(&dword_1D56AF000, v20, OS_LOG_TYPE_ERROR, "<%{public}@: %p>: %{public}@ %@ (pid: %d; reason: %ld; crash count: %ld; activation state: %ld lastCrashDate:%{public}@)",
        buf,
        0x58u);

    }
    v21 = self->_webProcessCrashCount;
    if (v21 > 2)
    {
      if (v21 == 3)
      {
        -[MFMessageContentView webView](self, "webView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "URL");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v36[0] = v14;
        v36[1] = 3221225472;
        v36[2] = __73__MFMessageContentView__webView_webContentProcessDidTerminateWithReason___block_invoke_2;
        v36[3] = &unk_1E9A03160;
        v36[4] = self;
        v39 = a2;
        v37 = v7;
        v38 = v23;
        v24 = v23;
        dispatch_async(MEMORY[0x1E0C80D38], v36);

      }
    }
    else
    {
      block[0] = v14;
      block[1] = 3221225472;
      block[2] = __73__MFMessageContentView__webView_webContentProcessDidTerminateWithReason___block_invoke_329;
      block[3] = &unk_1E9A02D88;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
  v15[2](v15);

}

void __73__MFMessageContentView__webView_webContentProcessDidTerminateWithReason___block_invoke(uint64_t a1)
{
  _WORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_WORD **)(a1 + 32);
  if ((v2[328] & 0x800) != 0)
  {
    objc_msgSend(v2, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "messageContentView:webViewDidTerminateWithReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 648);
  *(_QWORD *)(v5 + 648) = v4;

}

void __73__MFMessageContentView__webView_webContentProcessDidTerminateWithReason___block_invoke_329(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "webViewLoadingController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "slapWebView");

}

void __73__MFMessageContentView__webView_webContentProcessDidTerminateWithReason___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  EMLogCategoryMessageLoading();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    v15 = v10;
    v16 = 2048;
    v17 = v11;
    v18 = 2114;
    v19 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_error_impl(&dword_1D56AF000, v2, OS_LOG_TYPE_ERROR, "<%{public}@: %p>: %{public}@ setting error message to web view %@", buf, 0x2Au);

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MESSAGE_CAUSED_PROBLEM_REPEATEDLY"), &stru_1E9A04480, CFSTR("Main"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "mf_stringByEscapingHTMLCodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", CFSTR("<html dir=auto><body><i><font color=#888>%@</font></i></body></html>"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_loadAlternateHTMLString:baseURL:forUnreachableURL:", v8, 0, *(_QWORD *)(a1 + 48));

}

- (void)_webView:(id)a3 dataInteraction:(id)a4 sessionWillBegin:(id)a5
{
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "contentItemHandlingDelegateForMessageContentView:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hideMenuForSelectedContentRepresentation");

  }
}

- (void)_webView:(id)a3 dataInteraction:(id)a4 session:(id)a5 didEndWithOperation:(unint64_t)a6
{
  -[MFMessageContentView setAttachmentDragPreviews:](self, "setAttachmentDragPreviews:", 0, a4, a5, a6);
}

- (id)_webView:(id)a3 adjustedDataInteractionItemProvidersForItemProvider:(id)a4 representingObjects:(id)a5 additionalData:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(a6, "objectForKey:", *MEMORY[0x1E0CC6860]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v9, 4);
    -[MessageContentItemsHelper updateDragItemProvider:forElementID:](self->_relatedItemsHelper, "updateDragItemProvider:forElementID:", v8, v10);
    -[MessageContentItemsHelper contentItemForElementID:](self->_relatedItemsHelper, "contentItemForElementID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[MessageContentItemsHelper displayStateForContentItem:](self->_relatedItemsHelper, "displayStateForContentItem:", v11) == 1)
    {
      v15[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v14 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)_webView:(id)a3 willUpdateDropProposalToProposal:(id)a4 forSession:(id)a5
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3788]), "initWithDropOperation:", 0);
}

- (BOOL)_objectContainsNonEmptyString:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0CB3780], "whitespaceAndNewlineCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addCharactersInString:", CFSTR("\uFFFC"));
    objc_msgSend(v4, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invertedSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "rangeOfCharacterFromSet:", v7) != 0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_attachmentPreviewsFromData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, 0);
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, *MEMORY[0x1E0CB2CD0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_webView:(id)a3 previewItem:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double MaxY;
  void *v18;
  CGRect v20;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v7, "itemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "teamData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithData:encoding:", v10, 4);

  -[MFMessageContentView attachmentDragPreviews](self, "attachmentDragPreviews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "scrollView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentInset");
  v16 = v15;
  -[MFMessageHeaderView frame](self->_headerView, "frame");
  MaxY = CGRectGetMaxY(v20);

  objc_msgSend(v13, "targetedDragPreviewInContainer:centerOffset:", v6, v16, MaxY);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_webView:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  -[MFMessageContentView _webView:previewItem:](self, "_webView:previewItem:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_webView:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  -[MFMessageContentView _webView:previewItem:](self, "_webView:previewItem:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_dataDetectionContextForWebView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageContentView contentRequest](self, "contentRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultIfAvailable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFMessageContentView contentRepresentationIfAvailable](self, "contentRepresentationIfAvailable");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7 && v8)
  {
    objc_msgSend(v7, "subject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subjectWithoutPrefix");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "length"))
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D1CF70]);
    objc_msgSend(v7, "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D1CF78]);

    objc_msgSend(v9, "publicMessageURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D1CF80]);

  }
  return v4;
}

- (int64_t)_webView:(id)a3 dataOwnerForDragSession:(id)a4
{
  if (-[MFMessageContentView sourceIsManaged](self, "sourceIsManaged", a3, a4))
    return 2;
  else
    return 1;
}

- (void)_webView:(id)a3 didInsertAttachment:(id)a4 withSource:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a5;
  -[MFMessageContentView _updateFileWrapperForAttachment:contentID:](self, "_updateFileWrapperForAttachment:contentID:", v10, v7);
  -[MessageContentItemsHelper contentItemForContentID:](self->_relatedItemsHelper, "contentItemForContentID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[MessageContentItemsHelper contentItemForElementID:](self->_relatedItemsHelper, "contentItemForElementID:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      -[MessageContentItemsHelper associateElementID:withContentID:](self->_relatedItemsHelper, "associateElementID:withContentID:", v7, v7);
  }

}

- (void)_updateFileWrapperForAttachment:(id)a3 contentID:(id)a4
{
  void *v6;
  void *v7;
  MessageContentItemsHelper *relatedItemsHelper;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  -[MessageContentItemsHelper contentItemForContentID:](self->_relatedItemsHelper, "contentItemForContentID:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    relatedItemsHelper = self->_relatedItemsHelper;
    objc_msgSend(v6, "contentID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MessageContentItemsHelper associateElementID:withWKAttachmentID:](relatedItemsHelper, "associateElementID:withWKAttachmentID:", v9, v10);

    v11 = -[MessageContentItemsHelper startDownloadForContentItem:userInitiated:](self->_relatedItemsHelper, "startDownloadForContentItem:userInitiated:", v7, 0);
  }

}

- (BOOL)mayShareToUnmanaged
{
  void *v2;
  char v3;

  if (!-[MFMessageContentView sourceIsManaged](self, "sourceIsManaged"))
    return 1;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mayOpenFromManagedToUnmanaged");

  return v3;
}

- (BOOL)_allAttachmentsArePhotosOrVideos
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[MessageContentItemsHelper contentItems](self->_relatedItemsHelper, "contentItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "count") < 2)
  {
    v10 = 0;
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v13;
      v6 = *MEMORY[0x1E0CEC568];
      v7 = *MEMORY[0x1E0CEC520];
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v13 != v5)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "type", (_QWORD)v12);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v9, "conformsToType:", v6) & 1) == 0 && (objc_msgSend(v9, "conformsToType:", v7) & 1) == 0)
          {

            v10 = 0;
            goto LABEL_14;
          }

        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v4)
          continue;
        break;
      }
    }
    v10 = 1;
LABEL_14:

  }
  return v10;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  -[MFMessageContentView contentItemForSaveMenu](self, "contentItemForSaveMenu", a3, a4.x, a4.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0;
  v6 = (void *)MEMORY[0x1E0DC36B8];
  -[MFMessageContentView contentItemForSaveMenu](self, "contentItemForSaveMenu");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v11[3] = &unk_1E9A03980;
  v11[4] = self;
  objc_msgSend(v6, "configurationWithIdentifier:previewProvider:actionProvider:", v8, 0, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  uint64_t v2;
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
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];

  v18[3] = *MEMORY[0x1E0C80C00];
  v2 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
  v17[3] = &unk_1E9A03958;
  v17[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC36F8], "elementWithUncachedProvider:", v17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v4 = (void *)MEMORY[0x1E0DC3428];
  _EFLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", *MEMORY[0x1E0CC67E0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v2;
  v16[1] = 3221225472;
  v16[2] = __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_7;
  v16[3] = &unk_1E9A02B90;
  v16[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, v6, CFSTR("com.apple.documentmanager.downloads"), v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v7;
  v8 = (void *)MEMORY[0x1E0DC3428];
  _EFLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", *MEMORY[0x1E0CC6850]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v15[1] = 3221225472;
  v15[2] = __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_8;
  v15[3] = &unk_1E9A02B90;
  v15[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v9, v10, CFSTR("com.apple.documentmanager.browse"), v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1F070], "globalAsyncScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3;
  v9[3] = &unk_1E9A03908;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v11 = v7;
  v8 = v3;
  v12 = v8;
  objc_msgSend(v5, "performBlock:", v9);

}

void __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  _QWORD v15[2];
  id v16;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_doc_destinationLocationExists:", 2);

  if (v3)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4;
    v14[3] = &unk_1E9A03908;
    v4 = *(id *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(a1 + 48);
    v15[0] = v4;
    v15[1] = v5;
    v16 = v6;
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performBlock:", v14);
    v8 = (id *)v15;

    v9 = v16;
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_6;
    v11[3] = &unk_1E9A03930;
    v13 = *(id *)(a1 + 48);
    v12 = *(id *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "performBlock:", v11);
    v8 = &v13;

    v9 = v12;
  }

}

uint64_t __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v2 = (void *)a1[4];
  v3 = (void *)MEMORY[0x1E0DC3428];
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", *MEMORY[0x1E0CC67D8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_5;
  v8[3] = &unk_1E9A02B90;
  v8[4] = a1[5];
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v4, v5, CFSTR("com.apple.documentmanager.cats"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v6);

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_5(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  id v3;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[53];
  objc_msgSend(v1, "contentItemForSaveMenu");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "saveContentItem:toDestination:");

}

uint64_t __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_7(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  id v3;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[53];
  objc_msgSend(v1, "contentItemForSaveMenu");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "saveContentItem:toDestination:");

}

void __78__MFMessageContentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_8(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "contentItemForSaveMenu");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_saveContentItemToPicker:");

}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageContentView contentItemForSaveMenu](self, "contentItemForSaveMenu");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v10)
  {
    -[MFMessageContentView setContentItemForSaveMenu:](self, "setContentItemForSaveMenu:", 0);
    -[MFMessageContentView setContentItemRectForSaveMenu:](self, "setContentItemRectForSaveMenu:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[MFMessageContentView webView](self, "webView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeInteraction:", v12);

  }
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;

  -[MFMessageContentView contentItemRectForSaveMenu](self, "contentItemRectForSaveMenu", a3, a4, a5);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v6, v7, v8, v9);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v11);

  UIRectGetCenter();
  v13 = v12;
  v15 = v14;
  v16 = objc_alloc(MEMORY[0x1E0DC3B88]);
  -[MFMessageContentView webView](self, "webView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithContainer:center:", v17, v13, v15 + 5.0);

  v19 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:target:", v10, v19, v18);

  return v20;
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a4, "identifier", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageContentView contentItemForSaveMenu](self, "contentItemForSaveMenu");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v7)
  {
    objc_msgSend(MEMORY[0x1E0DC40C8], "defaultStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPreferredLayout:", 3);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)_saveContentItemToPicker:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  -[MessageContentItemsHelper futureForContentItem:download:](self->_relatedItemsHelper, "futureForContentItem:download:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__MFMessageContentView__saveContentItemToPicker___block_invoke;
  v6[3] = &unk_1E9A02F80;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "onScheduler:addSuccessBlock:", v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __49__MFMessageContentView__saveContentItemToPicker___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_alloc(MEMORY[0x1E0DC3730]);
  objc_msgSend(v3, "contentURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initForExportingURLs:asCopy:", v7, 1);

  objc_msgSend(v8, "_setIsContentManaged:", objc_msgSend(WeakRetained, "sourceIsManaged"));
  objc_msgSend(WeakRetained, "presentViewController:", v8);

}

- (id)_contextMenuConfigurationForAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  MFMessageContentView *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  char v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  MFMessageContentView *v41;
  char v42;
  _QWORD v43[5];
  id v44;
  int64_t v45;

  v4 = a3;
  objc_msgSend(v4, "ID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageContentView _contentItemForElement:](self, "_contentItemForElement:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[MessageContentItemsHelper displayStateForContentItem:](self->_relatedItemsHelper, "displayStateForContentItem:", v6);
    if (v7 == 1)
    {
      v27 = v4;
      -[MessageContentItemsHelper futureForContentItem:download:](self->_relatedItemsHelper, "futureForContentItem:download:", v6, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "contentItemHandlingDelegateForMessageContentView:", self);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "type");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "result");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "contentURL");
      v13 = objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = -[objc_class canPreviewItem:](getQLPreviewControllerClass(), "canPreviewItem:", v13);
        v15 = (void *)v13;
        v16 = v8;
      }
      else
      {
        v15 = 0;
        v16 = v8;
        v14 = 0;
      }
      v26 = (void *)MEMORY[0x1E0DC36B8];
      v19 = MEMORY[0x1E0C809B0];
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_3;
      v37[3] = &unk_1E9A039D0;
      v38 = v6;
      v42 = v14;
      v39 = v11;
      v25 = v11;
      v40 = v15;
      v41 = self;
      v28[0] = v19;
      v28[1] = 3221225472;
      v28[2] = __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_4;
      v28[3] = &unk_1E9A03A90;
      v29 = v38;
      v30 = self;
      v36 = v14;
      v20 = v40;
      v31 = v20;
      v21 = v10;
      v32 = v21;
      v22 = v39;
      v33 = v22;
      v23 = v16;
      v34 = v23;
      v35 = v27;
      objc_msgSend(v26, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v37, v28, v25);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v27;
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0DC36B8];
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke;
      v43[3] = &unk_1E9A039A8;
      v45 = v7;
      v43[4] = self;
      v44 = v6;
      objc_msgSend(v18, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v43);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

id __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  id (*v15)(uint64_t);
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 48) != 2)
    return 0;
  v2 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DOWNLOAD"), &stru_1E9A04480, CFSTR("Main"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", *MEMORY[0x1E0CC6840]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_2;
  v16 = &unk_1E9A02BB8;
  v6 = *(void **)(a1 + 40);
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v6;
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v4, v5, 0, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC39D0];
  objc_msgSend(*(id *)(a1 + 40), "displayName", v13, v14, v15, v16, v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "menuWithTitle:children:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_2(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "startDownloadForContentItem:userInitiated:", *(_QWORD *)(a1 + 40), 1);
}

id __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "exchangeEventUID"))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CAA078]);
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA220]), "initWithEventUID:eventStore:", objc_msgSend(*(id *)(a1 + 32), "exchangeEventUID"), v2);
    objc_msgSend(v3, "viewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else if (*(_BYTE *)(a1 + 64) || objc_msgSend(*(id *)(a1 + 32), "exchangeEventUID"))
  {
    objc_msgSend(*(id *)(a1 + 40), "preferredMIMEType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(getQLItemClass()), "initWithURL:MIMEType:", *(_QWORD *)(a1 + 48), v6);
    v8 = objc_alloc(getQLPreviewControllerClass());
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithPreviewItems:", v9);

    objc_msgSend(v10, "setIsContentManaged:", objc_msgSend(*(id *)(a1 + 56), "sourceIsManaged"));
    return v10;
  }
  else
  {
    return 0;
  }
}

id __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void (**v49)(void *, uint64_t);
  void *v50;
  void *v51;
  uint64_t v53;
  int8x16_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD aBlock[4];
  id v61;
  id v62;
  _QWORD v63[4];
  int8x16_t v64;
  id v65;
  _QWORD v66[4];
  id v67;
  uint64_t v68;
  id v69;
  _QWORD v70[6];

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "exchangeEventUID"))
  {
    v4 = 0;
    goto LABEL_18;
  }
  v56 = v3;
  objc_msgSend(*(id *)(a1 + 40), "contentRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = v6;
  objc_msgSend(*(id *)(a1 + 40), "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageSourceMailboxObjectIDForMessageContentView:", *(_QWORD *)(a1 + 40));
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "contactStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "senderDisplayNameUsingContactStore:", v8);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v6, "shouldShowReplyAll");
  if (*(_BYTE *)(a1 + 88))
  {
    v10 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v6, "objectID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "subjectString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "webView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(a1 + 56);
    objc_msgSend(v15, "assetViewerManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v53) = 0;
    +[MessageAttachmentActionGenerator quicklookActionForURL:messageObjectID:mailboxObjectID:subject:senderDisplayName:shouldShowReplyAll:originView:attachmentRect:useFullScreenPresentation:contentRepresentationHandlingDelegate:assetViewerManager:](MessageAttachmentActionGenerator, "quicklookActionForURL:messageObjectID:mailboxObjectID:subject:senderDisplayName:shouldShowReplyAll:originView:attachmentRect:useFullScreenPresentation:contentRepresentationHandlingDelegate:assetViewerManager:", v10, v11, v58, v13, v57, v9, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), v14, v53, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "addObject:", v17);

    v6 = v55;
  }
  objc_msgSend(*(id *)(a1 + 64), "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "ef_conformsToMarkupUTType");

  if (v19)
  {
    v20 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v6, "objectID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "subjectString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "webView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *(void **)(a1 + 56);
    objc_msgSend(v25, "assetViewerManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v53) = 0;
    +[MessageAttachmentActionGenerator markupDocumentActionForURL:messageObjectID:mailboxObjectID:subject:senderDisplayName:shouldShowReplyAll:originView:useFullScreenPresentation:contentRepresentationHandlingDelegate:assetViewerManager:](MessageAttachmentActionGenerator, "markupDocumentActionForURL:messageObjectID:mailboxObjectID:subject:senderDisplayName:shouldShowReplyAll:originView:useFullScreenPresentation:contentRepresentationHandlingDelegate:assetViewerManager:", v20, v21, v58, v23, v57, v9, v24, v53, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "ef_addOptionalObject:", v27);

  }
  v28 = objc_msgSend(*(id *)(a1 + 40), "mayShareToUnmanaged");
  v29 = MEMORY[0x1E0C809B0];
  if (v28)
  {
    if (objc_msgSend(*(id *)(a1 + 64), "conformsToType:", *MEMORY[0x1E0CEC568]))
    {
      +[MessageAttachmentActionGenerator saveVideoActionForFutureRepresentation:](MessageAttachmentActionGenerator, "saveVideoActionForFutureRepresentation:", *(_QWORD *)(a1 + 72));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "addObject:", v30);
    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 64), "conformsToType:", *MEMORY[0x1E0CEC520]))
        goto LABEL_13;
      +[MessageAttachmentActionGenerator saveImageActionForFutureRepresentation:](MessageAttachmentActionGenerator, "saveImageActionForFutureRepresentation:", *(_QWORD *)(a1 + 72));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "addObject:", v30);
    }

LABEL_13:
    if (objc_msgSend(*(id *)(a1 + 40), "_allAttachmentsArePhotosOrVideos"))
    {
      objc_msgSend(*(id *)(a1 + 56), "localizedTitleForSaveAllAttachmentsAction");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 424), "contentItems");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v70[0] = v29;
      v70[1] = 3221225472;
      v70[2] = __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_5;
      v70[3] = &unk_1E9A039F8;
      v70[4] = *(_QWORD *)(a1 + 40);
      objc_msgSend(v32, "ef_map:", v70);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[MessageAttachmentActionGenerator saveAllAttachmentsActionWithTitle:futureRepresentations:](MessageAttachmentActionGenerator, "saveAllAttachmentsActionWithTitle:futureRepresentations:", v31, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "addObject:", v34);

    }
  }
  v35 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("SAVE_TO_FILES"), &stru_1E9A04480, CFSTR("Main"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", *MEMORY[0x1E0CC6850]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v29;
  v66[1] = 3221225472;
  v66[2] = __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_6;
  v66[3] = &unk_1E9A03A20;
  v39 = *(id *)(a1 + 48);
  v40 = *(_QWORD *)(a1 + 40);
  v67 = v39;
  v68 = v40;
  v69 = *(id *)(a1 + 80);
  objc_msgSend(v35, "actionWithTitle:image:identifier:handler:", v37, v38, 0, v66);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addObject:", v41);

  v42 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("SHARE"), &stru_1E9A04480, CFSTR("Main"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", *MEMORY[0x1E0CC6858]);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_7;
  v63[3] = &unk_1E9A03A20;
  v54 = *(int8x16_t *)(a1 + 32);
  v46 = (id)v54.i64[0];
  v64 = vextq_s8(v54, v54, 8uLL);
  v65 = *(id *)(a1 + 80);
  objc_msgSend(v42, "actionWithTitle:image:identifier:handler:", v44, v45, 0, v63);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addObject:", v47);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_8;
  aBlock[3] = &unk_1E9A03A68;
  v61 = v56;
  v48 = v59;
  v62 = v48;
  v49 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if (objc_msgSend(*(id *)(a1 + 40), "mayShareToUnmanaged"))
    v49[2](v49, 2);
  v49[2](v49, 12);
  v49[2](v49, 13);
  v50 = (void *)MEMORY[0x1E0DC39D0];
  objc_msgSend(*(id *)(a1 + 32), "displayName");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "menuWithTitle:children:", v51, v48);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = v56;
LABEL_18:

  return v4;
}

id __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_5(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "futureForContentItem:download:", a2, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_6(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0DC3730]);
  v10[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initForExportingURLs:asCopy:", v3, 1);

  objc_msgSend(v4, "_setIsContentManaged:", objc_msgSend(*(id *)(a1 + 40), "sourceIsManaged"));
  v5 = *(_QWORD **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "boundingRect");
  objc_msgSend(v5, "_adjustedRectForWebRect:");
  v5[64] = v6;
  v5[65] = v7;
  v5[66] = v8;
  v5[67] = v9;
  objc_msgSend(*(id *)(a1 + 40), "presentViewController:", v4);

}

void __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
  objc_msgSend(*(id *)(a1 + 48), "boundingRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "webView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showMenuForContentItem:rect:view:", v2, v5, v7, v9, v11);

}

void __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_8(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  _QWORD v5[5];

  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_9;
  v5[3] = &__block_descriptor_40_e23_B16__0__UIMenuElement_8l;
  v5[4] = a2;
  objc_msgSend(v3, "ef_firstObjectPassingTest:", v5);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

}

BOOL __63__MFMessageContentView__contextMenuConfigurationForAttachment___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = (void *)MEMORY[0x1E0CEF6B0];
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4 == objc_msgSend(v5, "elementActionTypeForUIActionIdentifier:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_webView:(id)a3 contextMenuConfigurationForElement:(id)a4 completionHandler:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(id, void *);

  v10 = (void (**)(id, void *))a5;
  objc_msgSend(a4, "_activatedElementInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((unint64_t)(objc_msgSend(v7, "type") - 1) >= 2)
    {
      v9 = 0;
    }
    else
    {
      -[MFMessageContentView _contextMenuConfigurationForAttachment:](self, "_contextMenuConfigurationForAttachment:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10[2](v10, v9);

  }
  else
  {
    v10[2](v10, 0);
  }

}

- (void)webView:(id)a3 contextMenuForElement:(id)a4 willCommitWithAnimator:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "_activatedElementInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "boundingRect");
    -[MFMessageContentView _adjustedRectForWebRect:](self, "_adjustedRectForWebRect:");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __77__MFMessageContentView_webView_contextMenuForElement_willCommitWithAnimator___block_invoke;
    v19[3] = &unk_1E9A03AB8;
    v19[4] = self;
    v20 = v10;
    v21 = v12;
    v22 = v14;
    v23 = v16;
    v24 = v18;
    objc_msgSend(v8, "addCompletion:", v19);

  }
}

void __77__MFMessageContentView_webView_contextMenuForElement_willCommitWithAnimator___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
  objc_msgSend(*(id *)(a1 + 40), "ID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachmentWasTappedWithElementID:rect:view:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

}

- (id)_contentItemForElement:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MessageContentItemsHelper contentItemForElementID:](self->_relatedItemsHelper, "contentItemForElementID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[MessageContentItemsHelper contentItemForContentID:](self->_relatedItemsHelper, "contentItemForContentID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)downloadFutureForContentItem:(id)a3
{
  -[MessageContentItemsHelper futureForContentItem:download:](self->_relatedItemsHelper, "futureForContentItem:download:", a3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)webView:(id)a3 showLockdownModeFirstUseMessage:(id)a4 completionHandler:(id)a5
{
  void (**v5)(id, uint64_t);
  NSObject *v6;
  uint8_t v7[16];

  v5 = (void (**)(id, uint64_t))a5;
  +[MFMessageContentView log](MFMessageContentView, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D56AF000, v6, OS_LOG_TYPE_DEFAULT, "Skipping lockdown first use message", v7, 2u);
  }

  v5[2](v5, 3);
}

- (void)headerViewDidChangeHeight:(id)a3
{
  double v4;

  -[MFMessageContentView _adjustWebViewInsetsToAccomodateHeaderAndFooter](self, "_adjustWebViewInsetsToAccomodateHeaderAndFooter", a3);
  if (v4 != 0.0)
    -[MFMessageContentView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)footerViewDidChangeHeight:(id)a3
{
  double v4;

  -[MFMessageContentView _adjustWebViewInsetsToAccomodateHeaderAndFooter](self, "_adjustWebViewInsetsToAccomodateHeaderAndFooter", a3);
  if (v4 < 0.0)
    v4 = -v4;
  if (v4 > 0.0)
    -[MFMessageContentView layoutIfNeeded](self, "layoutIfNeeded");
}

- (double)_adjustWebViewInsetsToAccomodateHeaderAndFooter
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double Height;
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
  CGRect v22;
  CGRect v23;

  -[MFMessageContentView webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "contentInset");
  v6 = v5;
  v8 = v7;
  -[MFMessageHeaderView bounds](self->_headerView, "bounds");
  Height = CGRectGetHeight(v22);
  if (self->_showMessageFooter)
  {
    -[MFConversationItemFooterView bounds](self->_footerView, "bounds");
    v10 = ceil(CGRectGetHeight(v23));
  }
  else
  {
    v10 = 0.0;
  }
  objc_msgSend(v4, "contentInset");
  v12 = v11;
  objc_msgSend(v4, "contentInset");
  v14 = ceil(Height);
  v15 = v10 + v14 - v12 - v13;
  v16 = -v15;
  if (v15 >= 0.0)
    v16 = v10 + v14 - v12 - v13;
  if (v16 > 0.00000011920929 && !self->_suppressContentSizeNotifications)
  {
    objc_msgSend(v4, "contentOffset");
    v18 = v17;
    v20 = v19;
    objc_msgSend(v4, "setContentInset:", v14, v6, v10, v8);
    objc_msgSend(v4, "setContentOffset:", v18, v20 - v15);
  }

  return v15;
}

- (void)_adjustHeaderOffsetForZoom
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double Height;
  MFMessageHeaderView *headerView;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGRect v11;

  -[MFMessageContentView webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentOffset");
  v6 = v5;

  -[MFMessageHeaderView bounds](self->_headerView, "bounds");
  Height = CGRectGetHeight(v11);
  CGAffineTransformMakeTranslation(&v10, 0.0, -fmax(v6 + ceil(Height), 0.0));
  headerView = self->_headerView;
  v9 = v10;
  -[MFMessageHeaderView setTransform:](headerView, "setTransform:", &v9);
}

- (void)_resetHeaderOffsetForZoom
{
  MFMessageHeaderView *headerView;
  __int128 v3;
  _OWORD v4[3];

  headerView = self->_headerView;
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[MFMessageHeaderView setTransform:](headerView, "setTransform:", v4);
}

- (void)_beginObservingContentHeight
{
  void *v3;
  EFCancelable *v4;
  EFCancelable *contentSizeObservation;
  _QWORD v6[4];
  id v7;
  id location;

  if (!self->_contentSizeObservation)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    -[MFMessageContentView webView](self, "webView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __52__MFMessageContentView__beginObservingContentHeight__block_invoke;
    v6[3] = &unk_1E9A03528;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v3, "ef_observeKeyPath:options:usingBlock:", CFSTR("scrollView.contentSize"), 1, v6);
    v4 = (EFCancelable *)objc_claimAutoreleasedReturnValue();
    contentSizeObservation = self->_contentSizeObservation;
    self->_contentSizeObservation = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __52__MFMessageContentView__beginObservingContentHeight__block_invoke(uint64_t a1, void *a2)
{
  _BYTE *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CGSizeValue");
  objc_msgSend(WeakRetained, "_notifyDelegateScrollViewSizeChanged:");

  if (objc_msgSend(WeakRetained, "suppressScrolling"))
  {
    objc_msgSend(WeakRetained, "webView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setScrollEnabled:", 0);

  }
  if (WeakRetained && !WeakRetained[552] && !WeakRetained[553])
  {
    objc_msgSend(WeakRetained, "scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentOffset");
    v9 = v8;
    objc_msgSend(WeakRetained, "scrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentInset");
    v12 = v11;
    objc_msgSend(WeakRetained, "webView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scrollView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContentOffset:", v9, -v12);

  }
}

- (void)_notifyDelegateScrollViewSizeChanged:(CGSize)a3
{
  double height;
  double v5;
  double v6;
  id v7;
  CGRect v8;
  CGRect v9;

  if ((*(_WORD *)&self->_flags & 8) != 0
    && !self->_suppressContentSizeNotifications
    && !self->_suppressContentSizeNotificationsUntilFirstPaint)
  {
    height = a3.height;
    -[MFMessageHeaderView bounds](self->_headerView, "bounds", a3.width);
    v5 = height + CGRectGetHeight(v8);
    -[MFConversationItemFooterView bounds](self->_footerView, "bounds");
    v6 = v5 + CGRectGetHeight(v9);
    -[MFMessageContentView delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "messageContentView:didFinishRenderingWithHeight:", self, v6);

  }
}

- (void)_stopObservingContentHeight
{
  EFCancelable *contentSizeObservation;

  -[EFCancelable cancel](self->_contentSizeObservation, "cancel");
  contentSizeObservation = self->_contentSizeObservation;
  self->_contentSizeObservation = 0;

}

- (void)mailDropBannerDidTriggerDownload:(id)a3
{
  void *v4;
  char v5;
  char v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0D4D5B8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFatPipe");

  if (-[MessageContentItemsHelper totalMailDropDownloadSize](self->_relatedItemsHelper, "totalMailDropDownloadSize") < 0x6400001)
    v6 = 1;
  else
    v6 = v5;
  if ((v6 & 1) != 0)
  {
    -[MFMessageContentView _downloadAllMailDropAttachments](self, "_downloadAllMailDropAttachments");
  }
  else
  {
    -[MFMessageContentView _alertMailDropDownloadIsTooLargeForCell:](self, "_alertMailDropDownloadIsTooLargeForCell:", 1);
    objc_msgSend(v7, "setBannerState:", 1);
  }

}

- (void)_downloadAllMailDropAttachments
{
  -[MessageContentItemsHelper downloadAllMailDropAttachments](self->_relatedItemsHelper, "downloadAllMailDropAttachments");
}

- (id)viewPrintFormatter
{
  void *v2;
  void *v3;

  -[MFMessageContentView webView](self, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewPrintFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)loadHasMoreContentBannerIfNecessary
{
  -[MFHasMoreContentBannerView requestLoad](self->_loadHasMoreContentBanner, "requestLoad");
}

- (void)_addHasMoreContentBannerWithRemainingBytes:(unint64_t)a3
{
  MFHasMoreContentBannerView *loadHasMoreContentBanner;
  MFHasMoreContentBannerView *v5;
  MFHasMoreContentBannerView *v6;

  loadHasMoreContentBanner = self->_loadHasMoreContentBanner;
  if (!loadHasMoreContentBanner)
  {
    +[MFHasMoreContentBannerView bannerWithFrame:isPlainText:remainingBytes:](MFHasMoreContentBannerView, "bannerWithFrame:isPlainText:remainingBytes:", a3 == 0, a3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v5 = (MFHasMoreContentBannerView *)objc_claimAutoreleasedReturnValue();
    v6 = self->_loadHasMoreContentBanner;
    self->_loadHasMoreContentBanner = v5;

    -[MFHasMoreContentBannerView setDelegate:](self->_loadHasMoreContentBanner, "setDelegate:", self);
    -[MFMessageHeaderView insertHeaderBlock:atIndex:animated:](self->_headerView, "insertHeaderBlock:atIndex:animated:", self->_loadHasMoreContentBanner, 0, 1);
    loadHasMoreContentBanner = self->_loadHasMoreContentBanner;
  }
  -[MFHasMoreContentBannerView reloadData](loadHasMoreContentBanner, "reloadData", a3);
}

- (void)_updateHasMoreContentBannerWithRemainingBytes:(unint64_t)a3 error:(id)a4
{
  -[MFHasMoreContentBannerView updateBannerWithRemainingBytes:error:](self->_loadHasMoreContentBanner, "updateBannerWithRemainingBytes:error:", a3, a4);
}

- (void)didTapHasMoreContentBannerView:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];

  -[MFMessageContentView contentRepresentation](self, "contentRepresentation", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__MFMessageContentView_didTapHasMoreContentBannerView___block_invoke;
  v6[3] = &unk_1E9A03AE0;
  v6[4] = self;
  v5 = (id)objc_msgSend(v4, "requestAdditionalContentWithCompletion:", v6);

}

void __55__MFMessageContentView_didTapHasMoreContentBannerView___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__MFMessageContentView_didTapHasMoreContentBannerView___block_invoke_2;
  v7[3] = &unk_1E9A02DD8;
  v5 = v3;
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v4, "performBlock:", v7);

}

void __55__MFMessageContentView_didTapHasMoreContentBannerView___block_invoke_2(uint64_t a1)
{
  _BOOL4 v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32) == 0;
  +[MFMessageContentView log](MFMessageContentView, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "contentRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ef_publicDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v8;
      _os_log_impl(&dword_1D56AF000, v4, OS_LOG_TYPE_DEFAULT, "Finished requesting additional content for content representation: %{public}@", (uint8_t *)&v13, 0xCu);

    }
    v9 = *(void **)(a1 + 40);
    objc_msgSend(v9, "contentRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentRequestDidReceiveContentRepresentation:error:", v6, 0);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "contentRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ef_publicDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2114;
      v16 = v12;
      _os_log_error_impl(&dword_1D56AF000, v4, OS_LOG_TYPE_ERROR, "Failed to request additional content for content representation: %{public}@ due to error: %{public}@", (uint8_t *)&v13, 0x16u);

    }
    v5 = *(void **)(a1 + 40);
    objc_msgSend(v5, "contentRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_updateHasMoreContentBannerWithRemainingBytes:error:", objc_msgSend(v6, "remainingByteCount"), *(_QWORD *)(a1 + 32));
  }

}

- (void)_clearHasMoreContentBannerAnimated:(BOOL)a3
{
  MFHasMoreContentBannerView *loadHasMoreContentBanner;

  -[MFMessageHeaderView removeHeaderBlock:animated:](self->_headerView, "removeHeaderBlock:animated:", self->_loadHasMoreContentBanner, a3);
  loadHasMoreContentBanner = self->_loadHasMoreContentBanner;
  self->_loadHasMoreContentBanner = 0;

}

- (void)_addHideMyEmailBannerIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MFHideMyEmailBannerView *v7;
  MFHideMyEmailBannerView *v8;
  MFHideMyEmailBannerView *hideMyEmailBanner;

  if (!self->_hideMyEmailBanner)
  {
    -[MFMessageContentView contentRequest](self, "contentRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resultIfAvailable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestedHeaders");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "headersForKey:", *MEMORY[0x1E0D1E570]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [MFHideMyEmailBannerView alloc];
      v8 = -[MFHideMyEmailBannerView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      hideMyEmailBanner = self->_hideMyEmailBanner;
      self->_hideMyEmailBanner = v8;

      -[MFHideMyEmailBannerView setDelegate:](self->_hideMyEmailBanner, "setDelegate:", self);
      -[MFMessageHeaderView insertHeaderBlock:atIndex:animated:](self->_headerView, "insertHeaderBlock:atIndex:animated:", self->_hideMyEmailBanner, 0, 1);
    }
  }
}

- (void)didTapHideMyEmailBannerView:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC68E8], "hideMyEmailURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, 0);

}

- (void)didDismissHideMyEmailBannerView:(id)a3
{
  MFHideMyEmailBannerView *hideMyEmailBanner;

  -[MFMessageHeaderView removeHeaderBlock:animated:](self->_headerView, "removeHeaderBlock:animated:", self->_hideMyEmailBanner, 1);
  hideMyEmailBanner = self->_hideMyEmailBanner;
  self->_hideMyEmailBanner = 0;

}

- (void)_clearLoadRemoteImagesBannerAnimated:(BOOL)a3
{
  MFLoadBlockedContentBannerView *loadImagesHeaderBlock;

  -[MFMessageHeaderView removeHeaderBlock:animated:](self->_headerView, "removeHeaderBlock:animated:", self->_loadImagesHeaderBlock, a3);
  loadImagesHeaderBlock = self->_loadImagesHeaderBlock;
  self->_loadImagesHeaderBlock = 0;

}

- (void)presentViewController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MFMessageContentView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentingViewControllerForMessageContentView:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)loadBlockedContent
{
  char v3;

  -[MFMessageContentView setMessageBlockingReason:](self, "setMessageBlockingReason:", 0);
  v3 = -[MFMessageContentView blockedContentTypes](self, "blockedContentTypes");
  -[MFMessageContentView setBlockedContentTypes:](self, "setBlockedContentTypes:", 0);
  if ((v3 & 4) != 0)
  {
    -[MFMessageContentView _reloadWithPartiallyEncryptedMessageAllowed](self, "_reloadWithPartiallyEncryptedMessageAllowed");
    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0)
        return;
LABEL_7:
      -[MFMessageContentView _reevaluateTrustWithNetworkAccessAllowed](self, "_reevaluateTrustWithNetworkAccessAllowed");
      return;
    }
  }
  else if ((v3 & 1) == 0)
  {
    goto LABEL_3;
  }
  -[MFMessageContentView _reloadWithRemoteContentAllowed](self, "_reloadWithRemoteContentAllowed");
  if ((v3 & 2) != 0)
    goto LABEL_7;
}

- (void)_reloadWithPartiallyEncryptedMessageAllowed
{
  -[MFMessageContentView setAllowLoadOfBlockedMessageContent:](self, "setAllowLoadOfBlockedMessageContent:", 1);
  -[MFMessageContentView _triggerWebViewLoad](self, "_triggerWebViewLoad");
}

- (void)_reloadWithRemoteContentAllowed
{
  void *v3;

  -[MFMessageContentView setAllowLoadOfBlockedMessageContent:](self, "setAllowLoadOfBlockedMessageContent:", 1);
  -[MFMessageContentView contentRepresentation](self, "contentRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowRemoteImages:", 1);

  -[MFMessageContentView reload](self, "reload");
}

- (void)_reevaluateTrustWithNetworkAccessAllowed
{
  void *v2;
  id v3;

  -[MFMessageContentView contentRepresentation](self, "contentRepresentation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "securityInformation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reevaluateTrustWithNetworkAccessAllowed");

}

- (void)dismissPresentedViewController:(id)a3
{
  void *v4;
  id v5;

  -[MFMessageContentView delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewControllerForMessageContentView:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_clearLoadFailedProxyContentBannerAnimated:(BOOL)a3
{
  MFLoadFailedProxyContentBannerView *loadFailedProxyContentBanner;

  -[MFMessageHeaderView removeHeaderBlock:animated:](self->_headerView, "removeHeaderBlock:animated:", self->_loadFailedProxyContentBanner, a3);
  loadFailedProxyContentBanner = self->_loadFailedProxyContentBanner;
  self->_loadFailedProxyContentBanner = 0;

}

- (void)loadFailedProxyContentBannerDidTriggerLoad:(id)a3
{
  NSSet *allRemoteURLs;

  -[MFMessageContentView _clearLoadFailedProxyContentBannerAnimated:](self, "_clearLoadFailedProxyContentBannerAnimated:", 1);
  -[MFMessageContentView _setRemoteContentToLoadWithoutProxy](self, "_setRemoteContentToLoadWithoutProxy");
  -[MFMessageContentView reload](self, "reload");
  -[NSMutableDictionary removeAllObjects](self->_failedProxyURLs, "removeAllObjects");
  allRemoteURLs = self->_allRemoteURLs;
  self->_allRemoteURLs = 0;

}

- (void)loadFailedProxyContentBannerWasDismissed:(id)a3
{
  id v3;

  -[MFMessageContentView _clearLoadFailedProxyContentBannerAnimated:](self, "_clearLoadFailedProxyContentBannerAnimated:", 1);
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBool:forKey:", 1, *MEMORY[0x1E0D1E070]);

}

- (void)_showModalViewController:(id)a3 presentationSource:(id)a4
{
  -[MFMessageContentView _showModalViewController:presentationSource:forceNavigationController:](self, "_showModalViewController:presentationSource:forceNavigationController:", a3, a4, 1);
}

- (void)_showModalViewController:(id)a3 presentationSource:(id)a4 forceNavigationController:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a5;
  v14 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v14);

        v9 = (void *)v10;
      }
      else
      {
        v9 = v14;
      }
      v14 = v9;
      objc_msgSend(v9, "setModalPresentationStyle:", 7);
    }
  }
  objc_msgSend(v14, "popoverPresentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", self);
  objc_msgSend(v8, "mui_setAsSourceForPopoverPresentationController:", v11);
  -[MFMessageContentView delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentingViewControllerForMessageContentView:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "presentViewController:animated:completion:", v14, 1, 0);
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(a3, "presentedViewController");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "topViewController");
    v7 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v7;
  }
  if (a4 == -1 || a4 == 7)
  {
    objc_msgSend(v15, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rightBarButtonItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageContentView presentedControllerDoneButtonItem](self, "presentedControllerDoneButtonItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v10)
    {
      objc_msgSend(v15, "navigationItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setRightBarButtonItem:", 0);
LABEL_9:

    }
  }
  else
  {
    objc_msgSend(v15, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rightBarButtonItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      -[MFMessageContentView presentedControllerDoneButtonItem](self, "presentedControllerDoneButtonItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "navigationItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setRightBarButtonItem:", v11);

      goto LABEL_9;
    }
  }

}

- (void)mui_setAsSourceForPopoverPresentationController:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setSourceView:", self);
  objc_msgSend(v4, "setSourceRect:", self->_activatedAttachmentRect.origin.x, self->_activatedAttachmentRect.origin.y, self->_activatedAttachmentRect.size.width, self->_activatedAttachmentRect.size.height);

}

- (void)mui_setAsTargetedSourceOnSceneConfiguration:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", self);
  objc_msgSend(v5, "setPreview:", v4);

}

- (id)presentedControllerDoneButtonItem
{
  UIBarButtonItem *presentedControllerDoneButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  presentedControllerDoneButtonItem = self->_presentedControllerDoneButtonItem;
  if (!presentedControllerDoneButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_dismissPresentedViewController_);
    v5 = self->_presentedControllerDoneButtonItem;
    self->_presentedControllerDoneButtonItem = v4;

    presentedControllerDoneButtonItem = self->_presentedControllerDoneButtonItem;
  }
  return presentedControllerDoneButtonItem;
}

- (id)viewForZoomingInScrollView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[MFMessageContentView loadingView](self, "loadingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

LABEL_5:
    objc_msgSend(v4, "setZoomEnabled:", 0);
    v9 = 0;
    goto LABEL_6;
  }
  v7 = -[MFMessageContentView isZoomEnabled](self, "isZoomEnabled");

  if (!v7)
    goto LABEL_5;
  objc_msgSend(v4, "subviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v9;
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id WeakRetained;
  id v20;

  v5 = a3;
  self->_suppressContentSizeNotifications = 1;
  v20 = v5;
  objc_msgSend(v5, "contentSize");
  v7 = v6;
  objc_msgSend(v20, "minimumZoomScale");
  v9 = v8;
  objc_msgSend(v20, "contentInset");
  -[MFMessageContentView webView](self, "webView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_obscuredInsets");
  UIEdgeInsetsSubtract();
  self->_originalZoomInsets.top = v11;
  self->_originalZoomInsets.left = v12;
  self->_originalZoomInsets.bottom = v13;
  self->_originalZoomInsets.right = v14;

  objc_msgSend(v20, "contentInset");
  v16 = v15;
  objc_msgSend(v20, "contentInset");
  v17 = fabs(v7 + v7 / (v9 / -3.0));
  objc_msgSend(v20, "setContentInset:", v17 + v16, *(double *)(MEMORY[0x1E0DC49E8] + 8), v17 + v18, *(double *)(MEMORY[0x1E0DC49E8] + 24));
  if ((*(_WORD *)&self->_flags & 0x20) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "messageContentViewWillBeginZoomingMessage:", self);

  }
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  id v7;
  void *v8;
  UIEdgeInsets *p_originalZoomInsets;
  double v10;
  double v11;
  double left;
  double v13;
  double v14;
  double top;
  void *v16;
  double v17;
  double v18;
  __int128 v19;
  id WeakRetained;
  id v21;

  v21 = a3;
  v7 = a4;
  v8 = v21;
  p_originalZoomInsets = &self->_originalZoomInsets;
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_originalZoomInsets.top), (int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_originalZoomInsets.bottom))))) & 1) != 0)
  {
    objc_msgSend(v21, "contentOffset");
    v11 = v10;
    left = self->_originalZoomInsets.left;
    objc_msgSend(v21, "contentOffset");
    v14 = v13;
    top = p_originalZoomInsets->top;
    -[MFMessageContentView webView](self, "webView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_obscuredInsets");
    UIEdgeInsetsAdd();
    objc_msgSend(v21, "setContentInset:");
    v17 = v11 - left;
    v18 = v14 + top;

    v19 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
    *(_OWORD *)&p_originalZoomInsets->top = *MEMORY[0x1E0DC49E8];
    *(_OWORD *)&self->_originalZoomInsets.bottom = v19;
    v8 = v21;
  }
  else
  {
    v17 = *MEMORY[0x1E0C9D538];
    v18 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  self->_suppressContentSizeNotifications = 0;
  if ((*(_WORD *)&self->_flags & 0x40) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "messageContentView:didEndZoomingMessageWithOffset:", self, v17, v18);

    v8 = v21;
  }
  objc_msgSend(v8, "contentSize");
  -[MFMessageContentView _notifyDelegateScrollViewSizeChanged:](self, "_notifyDelegateScrollViewSizeChanged:");
  -[MFMessageContentView _resetHeaderOffsetForZoom](self, "_resetHeaderOffsetForZoom");

}

- (void)setSuppressScrolling:(BOOL)a3
{
  void *v3;
  id v4;

  self->_suppressScrolling = a3;
  if (!a3)
  {
    -[MFMessageContentView webView](self, "webView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scrollView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setScrollEnabled:", 1);

  }
}

- (void)setContentPaddingFollowsLayoutMargins:(BOOL)a3
{
  NSObject *v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  MFMessageContentView *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_contentPaddingFollowsLayoutMargins != a3)
  {
    self->_contentPaddingFollowsLayoutMargins = a3;
    if (a3)
    {
      +[MFMessageContentView log](MFMessageContentView, "log");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFMessageContentView webView](self, "webView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138544130;
        v11 = v7;
        v12 = 2048;
        v13 = self;
        v14 = 2114;
        v15 = v8;
        v16 = 2048;
        v17 = v9;
        _os_log_impl(&dword_1D56AF000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: %{public}@ webView = %p", (uint8_t *)&v10, 0x2Au);

      }
      -[MFMessageContentView _setNeedsPaddingConstantsUpdate](self, "_setNeedsPaddingConstantsUpdate");
    }
  }
}

- (void)scrollViewDidZoom:(id)a3
{
  void *v4;
  id v5;
  double v6;
  _BOOL8 v7;
  void *v8;
  id v9;

  v9 = a3;
  -[MFMessageContentView webView](self, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v9)
  {
    if (-[MFMessageContentView suppressScrolling](self, "suppressScrolling"))
    {
      objc_msgSend(v9, "zoomScale");
      v7 = fabs(v6 + -1.0) > 0.00000011920929;
    }
    else
    {
      v7 = 1;
    }
    objc_msgSend(v9, "setScrollEnabled:", v7);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v8);

    if ((objc_msgSend(v9, "isZooming") & 1) != 0 || objc_msgSend(v9, "isZoomBouncing"))
      -[MFMessageContentView _adjustHeaderOffsetForZoom](self, "_adjustHeaderOffsetForZoom");
  }

}

- (void)_logRequestFinishWithSuccess:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
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
  NSObject *v17;
  os_signpost_id_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[MFMessageContentView contentRepresentationIfAvailable](self, "contentRepresentationIfAvailable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "transportType");
    v6 = 0;
    v24 = 0;
LABEL_5:

    goto LABEL_6;
  }
  -[MFMessageContentView contentRepresentationError](self, "contentRepresentationError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    v6 = objc_msgSend(v7, "code");
    objc_msgSend(v8, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D1DBD0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v9, "integerValue");

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("Rendering progress failed without error"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = -1;
LABEL_6:
  -[MFMessageContentView contentRequest](self, "contentRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "message");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mailboxesIfAvailable");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "account");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "statisticsKind");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    v16 = objc_msgSend(MEMORY[0x1E0D46D98], "accountStatisticsKindToIdentifier:", v15);
  else
    v16 = 0;
  +[MFMessageContentView signpostLog](MFMessageContentView, "signpostLog");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = -[MessageContentRepresentationRequest signpostID](self->_contentRequest, "signpostID");
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    -[MFMessageContentView webView](self, "webView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MessageContentRepresentationRequest itemID](self->_contentRequest, "itemID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134349826;
    v26 = v19;
    v27 = 2114;
    v28 = v20;
    v29 = 2050;
    v30 = v16 | (v5 << 8);
    v31 = 2050;
    v32 = v6;
    _os_signpost_emit_with_name_impl(&dword_1D56AF000, v17, OS_SIGNPOST_INTERVAL_END, v18, "MFMessageContentView", "WebView=%{signpost.description:attribute,public}p itemID=%{signpost.description:attribute,public}@ AccountType=%{public, signpost.telemetry:number1}lu Status=%{public, signpost.telemetry:number2}ld enableTelemetry=YES ", buf, 0x2Au);

  }
  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MessageContentRepresentationRequest message](self->_contentRequest, "message");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("MFMessageContentViewDidFinishFirstPaintMessageKey"));

  if (v24)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v24, CFSTR("MFMessageContentViewDidFinishFirstPaintErrorKey"));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "postNotificationName:object:userInfo:", MFMessageContentViewDidFinishFirstPaint, self, v21);

}

- (void)prepareForReuse
{
  EFCancelationToken *loadingCancelable;
  id v4;

  -[EFCancelationToken cancel](self->_loadingCancelable, "cancel");
  loadingCancelable = self->_loadingCancelable;
  self->_loadingCancelable = 0;

  -[NSMutableSet removeAllObjects](self->_inFlightURLs, "removeAllObjects");
  -[MFMessageContentView removeQuickReplyAnimationContextIfNecessary](self, "removeQuickReplyAnimationContextIfNecessary");
  -[MFMessageContentView didEndTextSearch](self, "didEndTextSearch");
  -[MFMessageContentView headerView](self, "headerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepareForReuse");

}

- (void)_addBlockedSenderBannerIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  MFBlockedSenderBannerView *v6;
  MFBlockedSenderBannerView *v7;
  MFBlockedSenderBannerView *blockedSenderBanner;

  if (objc_msgSend(MEMORY[0x1E0D1E0F0], "shouldPromptForBlockedSender")
    && !-[MFMessageContentView hideSenderSpecificBanners](self, "hideSenderSpecificBanners")
    && (-[MFMessageContentView contentRequest](self, "contentRequest"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "message"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isBlocked"),
        v4,
        v3,
        v5))
  {
    if (!self->_blockedSenderBanner)
    {
      v6 = [MFBlockedSenderBannerView alloc];
      v7 = -[MFBlockedSenderBannerView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      blockedSenderBanner = self->_blockedSenderBanner;
      self->_blockedSenderBanner = v7;

      -[MFBlockedSenderBannerView setDelegate:](self->_blockedSenderBanner, "setDelegate:", self);
      -[MFMessageHeaderView insertHeaderBlock:atIndex:animated:](self->_headerView, "insertHeaderBlock:atIndex:animated:", self->_blockedSenderBanner, 0, 1);
    }
  }
  else
  {
    -[MFMessageContentView _clearBlockedSenderBannerAnimated:](self, "_clearBlockedSenderBannerAnimated:", 1);
  }
}

- (void)_clearBlockedSenderBannerAnimated:(BOOL)a3
{
  MFBlockedSenderBannerView *blockedSenderBanner;

  -[MFMessageHeaderView removeHeaderBlock:animated:](self->_headerView, "removeHeaderBlock:animated:", self->_blockedSenderBanner, a3);
  blockedSenderBanner = self->_blockedSenderBanner;
  self->_blockedSenderBanner = 0;

}

- (void)didTapBlockedSenderBannerView:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC68E8], "blockedSenderURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, 0);

}

- (void)didDismissBlockedSenderBannerView:(id)a3
{
  -[MFMessageContentView _clearBlockedSenderBannerAnimated:](self, "_clearBlockedSenderBannerAnimated:", 1);
  objc_msgSend(MEMORY[0x1E0D1E0F0], "setPromptForBlockedSender:", 0);
}

- (void)_addNotAuthenticatedBannerIfNeeded
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _TtC12MobileMailUI28MFNotAuthenticatedBannerView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _TtC12MobileMailUI28MFNotAuthenticatedBannerView *v13;
  _TtC12MobileMailUI28MFNotAuthenticatedBannerView *notAuthenticatedBanner;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20[2];
  id location;

  -[MFMessageContentView contentRequest](self, "contentRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[MFMessageContentView allowNotAuthenticatedBanner](self, "allowNotAuthenticatedBanner");
  if (v5)
    v7 = v6;
  else
    v7 = 0;
  if (v7 && (objc_msgSend(v5, "isAuthenticated") & 1) == 0)
  {
    if (!self->_notAuthenticatedBanner)
    {
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      v8 = [_TtC12MobileMailUI28MFNotAuthenticatedBannerView alloc];
      objc_msgSend(v5, "senderList");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "emailAddressValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "simpleAddress");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __58__MFMessageContentView__addNotAuthenticatedBannerIfNeeded__block_invoke;
      v18 = &unk_1E9A03B08;
      objc_copyWeak(v20, &location);
      v20[1] = (id)a2;
      v19 = v5;
      v13 = -[MFNotAuthenticatedBannerView initWithSender:dismissAction:](v8, "initWithSender:dismissAction:", v12, &v15);
      notAuthenticatedBanner = self->_notAuthenticatedBanner;
      self->_notAuthenticatedBanner = v13;

      -[MFMessageHeaderView insertHeaderBlock:atIndex:animated:](self->_headerView, "insertHeaderBlock:atIndex:animated:", self->_notAuthenticatedBanner, 0, 1, v15, v16, v17, v18);
      objc_destroyWeak(v20);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    -[MFMessageContentView _clearNotAuthenticatedBannerAnimated:](self, "_clearNotAuthenticatedBannerAnimated:", 1);
  }

}

void __58__MFMessageContentView__addNotAuthenticatedBannerIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_clearNotAuthenticatedBannerAnimated:", 1);
    objc_msgSend(v3, "contentRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "message");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "repository");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), v3, CFSTR("MFMessageContentView.m"), 2951, CFSTR("Cannot clear Not Authenticated Banner - Message Repository not found."));

    }
    v7 = objc_alloc(MEMORY[0x1E0D1E370]);
    v11[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithMessageListItems:origin:actor:", v8, 3, 2);

    objc_msgSend(v6, "performMessageChangeAction:", v9);
  }

}

- (void)_clearNotAuthenticatedBannerAnimated:(BOOL)a3
{
  _TtC12MobileMailUI28MFNotAuthenticatedBannerView *notAuthenticatedBanner;

  -[MFMessageHeaderView removeHeaderBlock:animated:](self->_headerView, "removeHeaderBlock:animated:", self->_notAuthenticatedBanner, a3);
  notAuthenticatedBanner = self->_notAuthenticatedBanner;
  self->_notAuthenticatedBanner = 0;

}

- (void)_observeBlockedSenderListChangedNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleBlockSenderListChanged_, *MEMORY[0x1E0D1DBB0], 0);

}

- (void)_handleBlockSenderListChanged:(id)a3
{
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__MFMessageContentView__handleBlockSenderListChanged___block_invoke;
  v4[3] = &unk_1E9A02D88;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performBlock:", v4);

}

uint64_t __54__MFMessageContentView__handleBlockSenderListChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addBlockedSenderBannerIfNeeded");
}

- (void)didBeginTextSearch
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  _BOOL4 isTextSearchActive;
  int v11;
  MFMessageContentView *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v3 = 1;
    if (self->_isTextSearchActive)
      goto LABEL_5;
    self->_isTextSearchActive = 1;
  }
  -[MFMessageContentView webView](self, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didBeginTextSearchOperation");

  -[MFMessageContentView headerView](self, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConversationSearchOverlay");

  -[MFMessageContentView footerView](self, "footerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addConversationSearchOverlay");

  v3 = 0;
LABEL_5:
  +[MFMessageContentView log](MFMessageContentView, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[MFMessageContentView webView](self, "webView");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (self)
      isTextSearchActive = self->_isTextSearchActive;
    else
      isTextSearchActive = 0;
    v11 = 134218752;
    v12 = self;
    v13 = 2048;
    v14 = v8;
    v15 = 1024;
    v16 = v3;
    v17 = 1024;
    v18 = isTextSearchActive;
    _os_log_impl(&dword_1D56AF000, v7, OS_LOG_TYPE_DEFAULT, "didBeginTextSearch: self = %p, webView = %p, searchWasActive = %{BOOL}d, searchIsActive = %{BOOL}d", (uint8_t *)&v11, 0x22u);

  }
}

- (void)didEndTextSearch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _BOOL4 isTextSearchActive;
  int v12;
  MFMessageContentView *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self && self->_isTextSearchActive)
  {
    self->_isTextSearchActive = 0;
    -[MFMessageContentView webView](self, "webView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clearAllDecoratedFoundText");

    -[MFMessageContentView webView](self, "webView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didEndTextSearchOperation");

    -[MFMessageContentView headerView](self, "headerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeConversationSearchOverlay");

    -[MFMessageContentView footerView](self, "footerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeConversationSearchOverlay");

    v7 = 1;
  }
  else
  {
    v7 = 0;
  }
  +[MFMessageContentView log](MFMessageContentView, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[MFMessageContentView webView](self, "webView");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (self)
      isTextSearchActive = self->_isTextSearchActive;
    else
      isTextSearchActive = 0;
    v12 = 134218752;
    v13 = self;
    v14 = 2048;
    v15 = v9;
    v16 = 1024;
    v17 = v7;
    v18 = 1024;
    v19 = isTextSearchActive;
    _os_log_impl(&dword_1D56AF000, v8, OS_LOG_TYPE_DEFAULT, "didEndTextSearch: self = %p, webView = %p, searchWasActive = %{BOOL}d, searchIsActive = %{BOOL}d", (uint8_t *)&v12, 0x22u);

  }
}

- (void)clearAllDecoratedFoundText
{
  id v2;

  -[MFMessageContentView webView](self, "webView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearAllDecoratedFoundText");

}

- (void)showSearchResultsAtRange:(id)a3 usingStyle:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MFMessageContentView webView](self, "webView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFMessageContentView log](MFMessageContentView, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[MFMessageContentView contentRequest](self, "contentRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "itemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136316162;
    v12 = "-[MFMessageContentView showSearchResultsAtRange:usingStyle:]";
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v10;
    v19 = 2048;
    v20 = a4;
    _os_log_impl(&dword_1D56AF000, v8, OS_LOG_TYPE_DEFAULT, "%s: webview %@ returned rect for range: %@, item: %@, style: %lu", (uint8_t *)&v11, 0x34u);

  }
  objc_msgSend(v7, "decorateFoundTextRange:inDocument:usingStyle:", v6, 0, a4);

}

- (void)requestRectForFoundTextRange:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = a4;
  -[MFMessageContentView webView](self, "webView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__MFMessageContentView_requestRectForFoundTextRange_completionHandler___block_invoke;
  v10[3] = &unk_1E9A03B30;
  v10[4] = self;
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "_requestRectForFoundTextRange:completionHandler:", v6, v10);

}

uint64_t __71__MFMessageContentView_requestRectForFoundTextRange_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_adjustedRectForWebRect:");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)prepareForQuickReplyAnimationWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  MFMessageContentView *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_os_feature_enabled_impl() && ((*(uint64_t (**)(void))(*MEMORY[0x1E0D1ED90] + 16))() & 1) == 0)
  {
    -[MFMessageContentView setQuickReplyAnimationContext:](self, "setQuickReplyAnimationContext:", v4);
    -[MFMessageContentView headerView](self, "headerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 1);
    objc_msgSend(v5, "setAlpha:", 0.0);
    -[MFMessageContentView webView](self, "webView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 0.0);
    -[MFMessageContentView scrollView](self, "scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentInset");
    objc_msgSend(v4, "insets");
    objc_msgSend(v7, "setContentInset:");
    objc_msgSend(v4, "backgroundSnapshot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageContentView addSubview:](self, "addSubview:", v8);
    -[MFMessageContentView bringSubviewToFront:](self, "bringSubviewToFront:", v8);
    objc_msgSend(v8, "setHidden:", 1);
    objc_msgSend(v4, "buttonsSnapshot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageContentView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v9, v8);
    objc_msgSend(v4, "compositionSnapshot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageContentView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v10, v8);
    +[MFMessageContentView log](MFMessageContentView, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v13;
      v16 = 2048;
      v17 = self;
      _os_log_impl(&dword_1D56AF000, v11, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: [Quick Reply][Send Animation] Did apply quick-reply snapshots", (uint8_t *)&v14, 0x16u);

    }
    -[MFMessageContentView _updateWebViewPaddingConstants](self, "_updateWebViewPaddingConstants");

  }
}

- (void)_performQuickReplyMoveMessageBodyAnimationIfNeeded
{
  void *v3;
  NSObject *v4;
  objc_class *v5;
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
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  id v61[15];
  _BYTE buf[12];
  __int16 v63;
  MFMessageContentView *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    -[MFMessageContentView quickReplyAnimationContext](self, "quickReplyAnimationContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      +[MFMessageContentView log](MFMessageContentView, "log");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = (objc_class *)objc_opt_class();
        NSStringFromClass(v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v6;
        v63 = 2048;
        v64 = self;
        _os_log_impl(&dword_1D56AF000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: [Quick Reply][Send Animation] Will perform quick-reply move-message-body animation", buf, 0x16u);

      }
      -[MFMessageContentView quickReplyAnimationContext](self, "quickReplyAnimationContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "backgroundSnapshot");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      -[MFMessageContentView quickReplyAnimationContext](self, "quickReplyAnimationContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "compositionSnapshot");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      -[MFMessageContentView quickReplyAnimationContext](self, "quickReplyAnimationContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "buttonsSnapshot");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[MFMessageContentView headerView](self, "headerView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "frame");
      v13 = v12;
      -[MFMessageContentView quickReplyAnimationContext](self, "quickReplyAnimationContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "cornerRadius");
      v48 = v15;

      objc_msgSend(v49, "frame");
      v46 = v17;
      v47 = v16;
      v19 = v18;
      v21 = v20;
      objc_msgSend(v10, "frame");
      v44 = v23;
      v45 = v22;
      v43 = v24;
      v26 = v25;
      objc_msgSend(v50, "frame");
      v42 = v27;
      v29 = v28;
      v31 = v30;
      -[MFMessageContentView frame](self, "frame");
      v33 = v32;
      -[MFMessageContentView moveMessageBodyPropertyAnimator](self, "moveMessageBodyPropertyAnimator");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      v35 = MEMORY[0x1E0C809B0];
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __74__MFMessageContentView__performQuickReplyMoveMessageBodyAnimationIfNeeded__block_invoke;
      v57[3] = &unk_1E9A03B58;
      objc_copyWeak(v61, (id *)buf);
      v36 = v10;
      v58 = v36;
      v61[1] = v13;
      v37 = v49;
      v59 = v37;
      v61[2] = v19;
      *(double *)&v61[3] = *(double *)&v13 + -15.0 + v21;
      v61[4] = v47;
      v61[5] = v46;
      v61[6] = v45;
      *(double *)&v61[7] = *(double *)&v13 + -15.0 + v26;
      v61[8] = v44;
      v61[9] = v43;
      v38 = v50;
      v60 = v38;
      v61[10] = v42;
      v61[11] = v29;
      v61[12] = v31;
      v61[13] = v33;
      v61[14] = v48;
      objc_msgSend(v34, "addAnimations:", v57);
      v54[0] = v35;
      v54[1] = 3221225472;
      v54[2] = __74__MFMessageContentView__performQuickReplyMoveMessageBodyAnimationIfNeeded__block_invoke_2;
      v54[3] = &unk_1E9A02DD8;
      v39 = v11;
      v55 = v39;
      v40 = v38;
      v56 = v40;
      objc_msgSend(v34, "addAnimations:delayFactor:", v54, 0.5);
      v51[0] = v35;
      v51[1] = 3221225472;
      v51[2] = __74__MFMessageContentView__performQuickReplyMoveMessageBodyAnimationIfNeeded__block_invoke_3;
      v51[3] = &unk_1E9A03B80;
      objc_copyWeak(&v53, (id *)buf);
      v41 = v40;
      v52 = v41;
      objc_msgSend(v34, "addCompletion:", v51);
      objc_msgSend(v34, "startAnimation");

      objc_destroyWeak(&v53);
      objc_destroyWeak(v61);
      objc_destroyWeak((id *)buf);

    }
  }
}

void __74__MFMessageContentView__performQuickReplyMoveMessageBodyAnimationIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
    objc_msgSend(v7, "scrollView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentInset");
    objc_msgSend(v3, "setContentInset:", *(double *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
    objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
    objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160));
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160), *(double *)(a1 + 168));
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = objc_msgSend(v4, "CGPath");
    objc_msgSend(*(id *)(a1 + 48), "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShadowPath:", v5);

    WeakRetained = v7;
  }

}

uint64_t __74__MFMessageContentView__performQuickReplyMoveMessageBodyAnimationIfNeeded__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

void __74__MFMessageContentView__performQuickReplyMoveMessageBodyAnimationIfNeeded__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
    objc_msgSend(WeakRetained, "_updateWebViewPaddingConstants");
    objc_msgSend(WeakRetained, "setHasCompletedMoveMessageBodyAnimation:", 1);
  }

}

- (void)_performQuickReplySnapshotFadeOutAnimationIfNecessary
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _BYTE buf[12];
  __int16 v32;
  MFMessageContentView *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[MFMessageContentView quickReplyAnimationContext](self, "quickReplyAnimationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _os_feature_enabled_impl();
  if (v3)
    v5 = v4;
  else
    v5 = 0;
  if (v5 == 1)
  {
    +[MFMessageContentView log](MFMessageContentView, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v8;
      v32 = 2048;
      v33 = self;
      _os_log_impl(&dword_1D56AF000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: [Quick Reply] Will perform quick-reply snapshot-fade-out animation", buf, 0x16u);

    }
    objc_msgSend(v3, "compositionSnapshot");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "buttonsSnapshot");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageContentView webView](self, "webView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageContentView moveMessageBodyPropertyAnimator](self, "moveMessageBodyPropertyAnimator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x1E0DC3F38]);
    v12 = *MEMORY[0x1E0CC6928];
    v13 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __77__MFMessageContentView__performQuickReplySnapshotFadeOutAnimationIfNecessary__block_invoke;
    v28[3] = &unk_1E9A02DD8;
    v14 = v19;
    v29 = v14;
    v15 = v9;
    v30 = v15;
    v16 = (void *)objc_msgSend(v11, "initWithDuration:curve:animations:", 0, v28, v12);
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = __77__MFMessageContentView__performQuickReplySnapshotFadeOutAnimationIfNecessary__block_invoke_2;
    v23[3] = &unk_1E9A03BA8;
    objc_copyWeak(&v27, (id *)buf);
    v17 = v14;
    v24 = v17;
    v18 = v20;
    v25 = v18;
    v26 = v3;
    objc_msgSend(v16, "addCompletion:", v23);
    if (-[MFMessageContentView hasCompletedMoveMessageBodyAnimation](self, "hasCompletedMoveMessageBodyAnimation"))
    {
      objc_msgSend(v16, "startAnimation");
    }
    else
    {
      v21[0] = v13;
      v21[1] = 3221225472;
      v21[2] = __77__MFMessageContentView__performQuickReplySnapshotFadeOutAnimationIfNecessary__block_invoke_3;
      v21[3] = &unk_1E9A03BD0;
      v22 = v16;
      objc_msgSend(v10, "addCompletion:", v21);

    }
    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);

  }
}

uint64_t __77__MFMessageContentView__performQuickReplySnapshotFadeOutAnimationIfNecessary__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

void __77__MFMessageContentView__performQuickReplySnapshotFadeOutAnimationIfNecessary__block_invoke_2(id *a1)
{
  void (**v2)(void);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    objc_msgSend(a1[4], "removeFromSuperview");
    objc_msgSend(a1[5], "removeFromSuperview");
    objc_msgSend(a1[6], "completionBlock");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v2[2]();

    objc_msgSend(WeakRetained, "setQuickReplyAnimationContext:", 0);
  }

}

uint64_t __77__MFMessageContentView__performQuickReplySnapshotFadeOutAnimationIfNecessary__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startAnimation");
}

- (void)removeQuickReplyAnimationContextIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void (**v12)(void);
  id v13;

  -[MFMessageContentView quickReplyAnimationContext](self, "quickReplyAnimationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v13 = v3;
    objc_msgSend(v3, "backgroundSnapshot");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    objc_msgSend(v13, "compositionSnapshot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    objc_msgSend(v13, "buttonsSnapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[MFMessageContentView headerView](self, "headerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 1.0);
    objc_msgSend(v7, "setHidden:", 0);
    -[MFMessageContentView webView](self, "webView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", 1.0);

    objc_msgSend(v7, "frame");
    v10 = v9;
    -[MFMessageContentView scrollView](self, "scrollView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentInset");
    objc_msgSend(v11, "setContentInset:", v10);
    objc_msgSend(v13, "completionBlock");
    v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v12[2]();

    -[MFMessageContentView setQuickReplyAnimationContext:](self, "setQuickReplyAnimationContext:", 0);
    v3 = v13;
  }

}

- (MFMessageContentViewDelegate)delegate
{
  return (MFMessageContentViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (MFMessageContentViewDataSource)dataSource
{
  return (MFMessageContentViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (MessageContentRepresentationRequest)contentRequest
{
  return self->_contentRequest;
}

- (MFMessageLoadingContext)loadingContext
{
  return self->_loadingContext;
}

- (void)setLoadingContext:(id)a3
{
  objc_storeStrong((id *)&self->_loadingContext, a3);
}

- (CGPoint)initialContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialContentOffset.x;
  y = self->_initialContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialContentOffset:(CGPoint)a3
{
  self->_initialContentOffset = a3;
}

- (NSString)selectedHTML
{
  return self->_selectedHTML;
}

- (void)setSelectedHTML:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 712);
}

- (MFMessageHeaderView)headerView
{
  return self->_headerView;
}

- (UIView)headerViewSubjectBlock
{
  return self->_headerViewSubjectBlock;
}

- (void)setHeaderViewSubjectBlock:(id)a3
{
  objc_storeStrong((id *)&self->_headerViewSubjectBlock, a3);
}

- (BOOL)automaticallyCollapseQuotedContent
{
  return self->_automaticallyCollapseQuotedContent;
}

- (BOOL)showMessageFooter
{
  return self->_showMessageFooter;
}

- (BOOL)shouldArchiveByDefault
{
  return self->_shouldArchiveByDefault;
}

- (void)setShouldArchiveByDefault:(BOOL)a3
{
  self->_shouldArchiveByDefault = a3;
}

- (int64_t)messageBlockingReason
{
  return self->_messageBlockingReason;
}

- (unint64_t)blockedContentTypes
{
  return self->_blockedContentTypes;
}

- (UIView)previousContentSnapshot
{
  return self->_previousContentSnapshot;
}

- (MFMessageDisplayMetrics)displayMetrics
{
  return self->_displayMetrics;
}

- (BOOL)initiallyZoomsToShowAllContent
{
  return self->_initiallyZoomsToShowAllContent;
}

- (void)setInitiallyZoomsToShowAllContent:(BOOL)a3
{
  self->_initiallyZoomsToShowAllContent = a3;
}

- (BOOL)suppressScrolling
{
  return self->_suppressScrolling;
}

- (BOOL)contentPaddingFollowsLayoutMargins
{
  return self->_contentPaddingFollowsLayoutMargins;
}

- (BOOL)hasVisibleContent
{
  return self->_hasVisibleContent;
}

- (BOOL)showsBanners
{
  return self->_showsBanners;
}

- (void)setShowsBanners:(BOOL)a3
{
  self->_showsBanners = a3;
}

- (BOOL)allowNotAuthenticatedBanner
{
  return self->_allowNotAuthenticatedBanner;
}

- (void)setAllowNotAuthenticatedBanner:(BOOL)a3
{
  self->_allowNotAuthenticatedBanner = a3;
}

- (BOOL)hideSenderSpecificBanners
{
  return self->_hideSenderSpecificBanners;
}

- (void)setHideSenderSpecificBanners:(BOOL)a3
{
  self->_hideSenderSpecificBanners = a3;
}

- (BOOL)isZoomEnabled
{
  return self->_zoomEnabled;
}

- (void)setZoomEnabled:(BOOL)a3
{
  self->_zoomEnabled = a3;
}

- (MFMailboxProvider)mailboxProvider
{
  return self->_mailboxProvider;
}

- (void)setMailboxProvider:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxProvider, a3);
}

- (EMDaemonInterface)daemonInterface
{
  return self->_daemonInterface;
}

- (void)setDaemonInterface:(id)a3
{
  objc_storeStrong((id *)&self->_daemonInterface, a3);
}

- (MUIBrandIndicatorProvider)brandIndicatorProvider
{
  return self->_brandIndicatorProvider;
}

- (void)setBrandIndicatorProvider:(id)a3
{
  objc_storeStrong((id *)&self->_brandIndicatorProvider, a3);
}

- (EMCachingContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (MFAddressAtomStatusManager)atomManager
{
  return self->_atomManager;
}

- (void)setAtomManager:(id)a3
{
  objc_storeStrong((id *)&self->_atomManager, a3);
}

- (NSArray)attachments
{
  return (NSArray *)objc_getProperty(self, a2, 800, 1);
}

- (void)setAttachments:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 800);
}

- (EFCancelable)loadingIndicatorCancelable
{
  return self->_loadingIndicatorCancelable;
}

- (void)setLoadingIndicatorCancelable:(id)a3
{
  objc_storeStrong((id *)&self->_loadingIndicatorCancelable, a3);
}

- (MFMessageContentLoadingView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingView, a3);
}

- (double)initialScale
{
  return self->_initialScale;
}

- (MFWebViewLoadingController)webViewLoadingController
{
  return self->_webViewLoadingController;
}

- (void)setWebViewLoadingController:(id)a3
{
  objc_storeStrong((id *)&self->_webViewLoadingController, a3);
}

- (NSDictionary)attachmentDragPreviews
{
  return self->_attachmentDragPreviews;
}

- (void)setAttachmentDragPreviews:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentDragPreviews, a3);
}

- (BOOL)allowLoadOfBlockedMessageContent
{
  return self->_allowLoadOfBlockedMessageContent;
}

- (void)setAllowLoadOfBlockedMessageContent:(BOOL)a3
{
  self->_allowLoadOfBlockedMessageContent = a3;
}

- (NSError)contentRepresentationError
{
  return self->_contentRepresentationError;
}

- (void)setContentRepresentationError:(id)a3
{
  objc_storeStrong((id *)&self->_contentRepresentationError, a3);
}

- (BOOL)showingError
{
  return self->_showingError;
}

- (void)setShowingError:(BOOL)a3
{
  self->_showingError = a3;
}

- (EFCancelable)loadingSpinnerTailspinToken
{
  return self->_loadingSpinnerTailspinToken;
}

- (void)setLoadingSpinnerTailspinToken:(id)a3
{
  objc_storeStrong((id *)&self->_loadingSpinnerTailspinToken, a3);
}

- (EFScheduler)trustConfigurationScheduler
{
  return self->_trustConfigurationScheduler;
}

- (EMContentItem)contentItemForSaveMenu
{
  return self->_contentItemForSaveMenu;
}

- (void)setContentItemForSaveMenu:(id)a3
{
  objc_storeStrong((id *)&self->_contentItemForSaveMenu, a3);
}

- (CGRect)contentItemRectForSaveMenu
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentItemRectForSaveMenu.origin.x;
  y = self->_contentItemRectForSaveMenu.origin.y;
  width = self->_contentItemRectForSaveMenu.size.width;
  height = self->_contentItemRectForSaveMenu.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentItemRectForSaveMenu:(CGRect)a3
{
  self->_contentItemRectForSaveMenu = a3;
}

- (MFQuickReplyAnimationContext)quickReplyAnimationContext
{
  return self->_quickReplyAnimationContext;
}

- (void)setQuickReplyAnimationContext:(id)a3
{
  objc_storeStrong((id *)&self->_quickReplyAnimationContext, a3);
}

- (UIViewPropertyAnimator)moveMessageBodyPropertyAnimator
{
  return self->_moveMessageBodyPropertyAnimator;
}

- (void)setMoveMessageBodyPropertyAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_moveMessageBodyPropertyAnimator, a3);
}

- (BOOL)hasCompletedMoveMessageBodyAnimation
{
  return self->_hasCompletedMoveMessageBodyAnimation;
}

- (void)setHasCompletedMoveMessageBodyAnimation:(BOOL)a3
{
  self->_hasCompletedMoveMessageBodyAnimation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moveMessageBodyPropertyAnimator, 0);
  objc_storeStrong((id *)&self->_quickReplyAnimationContext, 0);
  objc_storeStrong((id *)&self->_contentItemForSaveMenu, 0);
  objc_storeStrong((id *)&self->_trustConfigurationScheduler, 0);
  objc_storeStrong((id *)&self->_loadingSpinnerTailspinToken, 0);
  objc_storeStrong((id *)&self->_contentRepresentationError, 0);
  objc_storeStrong((id *)&self->_attachmentDragPreviews, 0);
  objc_storeStrong((id *)&self->_webViewLoadingController, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_loadingIndicatorCancelable, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_atomManager, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_brandIndicatorProvider, 0);
  objc_storeStrong((id *)&self->_daemonInterface, 0);
  objc_storeStrong((id *)&self->_mailboxProvider, 0);
  objc_storeStrong((id *)&self->_displayMetrics, 0);
  objc_storeStrong((id *)&self->_previousContentSnapshot, 0);
  objc_storeStrong((id *)&self->_headerViewSubjectBlock, 0);
  objc_storeStrong((id *)&self->_selectedHTML, 0);
  objc_storeStrong((id *)&self->_loadingContext, 0);
  objc_storeStrong((id *)&self->_contentRequest, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastCrashDate, 0);
  objc_storeStrong((id *)&self->_failedProxyURLs, 0);
  objc_storeStrong((id *)&self->_allRemoteURLs, 0);
  objc_storeStrong((id *)&self->_inFlightURLs, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_contentSizeObservation, 0);
  objc_storeStrong((id *)&self->_presentedControllerDoneButtonItem, 0);
  objc_storeStrong((id *)&self->_previousContentSnapshotWrapperView, 0);
  objc_storeStrong((id *)&self->_notAuthenticatedBanner, 0);
  objc_storeStrong((id *)&self->_loadFailedProxyContentBanner, 0);
  objc_storeStrong((id *)&self->_blockedSenderBanner, 0);
  objc_storeStrong((id *)&self->_loadImagesHeaderBlock, 0);
  objc_storeStrong((id *)&self->_hideMyEmailBanner, 0);
  objc_storeStrong((id *)&self->_loadHasMoreContentBanner, 0);
  objc_storeStrong((id *)&self->_mailDropBanner, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_relatedItemsHelper, 0);
  objc_storeStrong((id *)&self->_loadingCancelable, 0);
}

void __35__MFMessageContentView__commonInit__block_invoke_3_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D56AF000, log, OS_LOG_TYPE_ERROR, "Got NULL value for SeeMoreButtonTappedWithYOffset", v1, 2u);
}

void __42__MFMessageContentView_setContentRequest___block_invoke_172_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_0(&dword_1D56AF000, "<%{public}@: %p>: Skipping content request. Content representation is nil", v4, v5);

  OUTLINED_FUNCTION_1();
}

- (void)webView:decidePolicyForNavigationAction:decisionHandler:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  os_log_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.8382e-34);
  _os_log_fault_impl(&dword_1D56AF000, v5, OS_LOG_TYPE_FAULT, "<%{public}@: %p>: Blocking file:// URL from web view.", v4, 0x16u);

  OUTLINED_FUNCTION_1();
}

- (void)webView:decidePolicyForNavigationAction:decisionHandler:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_0(&dword_1D56AF000, "<%{public}@: %p>: Blocking file:// URL from web view.", v4, v5);

  OUTLINED_FUNCTION_1();
}

- (void)webView:decidePolicyForNavigationAction:decisionHandler:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_0(&dword_1D56AF000, "<%{public}@: %p>: Blocking prefs: URL from web view.", v4, v5);

  OUTLINED_FUNCTION_1();
}

- (void)_attachmentPreviewsFromData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D56AF000, a2, OS_LOG_TYPE_ERROR, "Failed to decode attachment previews: %@", (uint8_t *)&v2, 0xCu);
}

@end

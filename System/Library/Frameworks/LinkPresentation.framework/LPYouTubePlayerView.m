@implementation LPYouTubePlayerView

- (LPYouTubePlayerView)initWithFrame:(CGRect)a3
{
  LPYouTubePlayerView *v3;
  LPYouTubePlayerView *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  LPYouTubePlayerView *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)LPYouTubePlayerView;
  v3 = -[LPYouTubePlayerView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_startsPlayingAutomatically = 1;
    v3->_showsControls = 1;
    v3->_startTime = 0.0;
    v3->_endTime = -1.0;
    if (+[LPSettings showDebugIndicators](LPSettings, "showDebugIndicators"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
      v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v6 = objc_msgSend(v5, "CGColor");
      -[LPYouTubePlayerView layer](v4, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBorderColor:", v6);

      -[LPYouTubePlayerView layer](v4, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBorderWidth:", 6.0);

    }
    v9 = v4;
  }

  return v4;
}

- (void)dispatchErrorWithCode:(int64_t)a3
{
  char v5;
  void *v6;
  id v7;
  id v8;

  -[LPYouTubePlayerView delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[LPYouTubePlayerView delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("LPYouTubePlayerErrorDomain"), a3, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "youTubePlayer:didReceiveError:", self, v6);

  }
}

- (void)loadVideoWithURL:(id)a3
{
  void *v4;
  id v5;

  +[LPPresentationSpecializations youTubeVideoComponentsForVideoURL:](LPPresentationSpecializations, "youTubeVideoComponentsForVideoURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoID");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[LPYouTubePlayerView loadVideoWithID:](self, "loadVideoWithID:", v5);
  else
    -[LPYouTubePlayerView dispatchErrorWithCode:](self, "dispatchErrorWithCode:", 4);

}

- (void)loadVideoWithEmbedURL:(id)a3
{
  void *v4;
  id v5;

  +[LPPresentationSpecializations youTubeVideoComponentsForEmbedURL:](LPPresentationSpecializations, "youTubeVideoComponentsForEmbedURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoID");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[LPYouTubePlayerView loadVideoWithID:](self, "loadVideoWithID:", v5);
  else
    -[LPYouTubePlayerView dispatchErrorWithCode:](self, "dispatchErrorWithCode:", 4);

}

- (void)loadVideoWithID:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_videoID, a3);
  self->_state = 0;
  if (self->_videoID
    || (-[LPYouTubePlayerView delegate](self, "delegate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_opt_respondsToSelector(),
        v5,
        (v6 & 1) == 0))
  {
    -[LPYouTubePlayerView createVideoPlayerView](self, "createVideoPlayerView");
  }
  else
  {
    -[LPYouTubePlayerView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("LPYouTubePlayerErrorDomain"), 5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "youTubePlayer:didReceiveError:", self, v8);

  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  LPYouTubePlayerWebView *webView;
  objc_super v6;

  -[LPYouTubePlayerWebView configuration](self->_webView, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userContentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeScriptMessageHandlerForName:", CFSTR("playerContainer"));

  -[LPYouTubePlayerWebView _close](self->_webView, "_close");
  webView = self->_webView;
  self->_webView = 0;

  v6.receiver = self;
  v6.super_class = (Class)LPYouTubePlayerView;
  -[LPYouTubePlayerView dealloc](&v6, sel_dealloc);
}

- (void)_evaluatePlayerCommand:(id)a3
{
  id v4;
  NSMutableArray *commandsPendingPlayerReadiness;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (self->_ready)
  {
    -[LPYouTubePlayerWebView evaluateJavaScript:completionHandler:](self->_webView, "evaluateJavaScript:completionHandler:", v4, 0);
  }
  else
  {
    commandsPendingPlayerReadiness = self->_commandsPendingPlayerReadiness;
    if (!commandsPendingPlayerReadiness)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = self->_commandsPendingPlayerReadiness;
      self->_commandsPendingPlayerReadiness = v6;

      commandsPendingPlayerReadiness = self->_commandsPendingPlayerReadiness;
      v4 = v8;
    }
    -[NSMutableArray addObject:](commandsPendingPlayerReadiness, "addObject:", v4);
  }

}

- (void)play
{
  -[LPYouTubePlayerView _evaluatePlayerCommand:](self, "_evaluatePlayerCommand:", CFSTR("startPlaying()"));
}

- (void)pause
{
  -[LPYouTubePlayerView _evaluatePlayerCommand:](self, "_evaluatePlayerCommand:", CFSTR("pausePlaying()"));
}

- (void)seekTo:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("seekTo(%f)"), *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[LPYouTubePlayerView _evaluatePlayerCommand:](self, "_evaluatePlayerCommand:");

}

- (BOOL)_shouldUseElementFullScreen
{
  return 0;
}

- (void)enterFullScreen
{
  const __CFString *v3;

  if ((unint64_t)(self->_state - 2) <= 3)
  {
    if (-[LPYouTubePlayerView _shouldUseElementFullScreen](self, "_shouldUseElementFullScreen"))
    {
      -[LPYouTubePlayerWebView setAllowFirstResponder:](self->_webView, "setAllowFirstResponder:", 1);
      -[LPYouTubePlayerWebView becomeFirstResponder](self->_webView, "becomeFirstResponder");
      v3 = CFSTR("enterElementFullScreen()");
    }
    else
    {
      v3 = CFSTR("enterVideoFullScreen()");
    }
    -[LPYouTubePlayerView _evaluatePlayerCommand:](self, "_evaluatePlayerCommand:", v3);
  }
}

- (void)exitFullScreen
{
  -[LPYouTubePlayerView _evaluatePlayerCommand:](self, "_evaluatePlayerCommand:", CFSTR("exitFullScreen()"));
  -[LPYouTubePlayerWebView setAllowFirstResponder:](self->_webView, "setAllowFirstResponder:", 0);
}

- (void)setMuted:(BOOL)a3
{
  const __CFString *v3;

  if (self->_muted != a3)
  {
    self->_muted = a3;
    if (a3)
      v3 = CFSTR("mute()");
    else
      v3 = CFSTR("unMute()");
    -[LPYouTubePlayerView _evaluatePlayerCommand:](self, "_evaluatePlayerCommand:", v3);
  }
}

- (id)_parameterScript
{
  id v3;
  BOOL v4;
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
  _QWORD v17[4];
  _QWORD v18[4];
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  v19[0] = CFSTR("rel");
  v19[1] = CFSTR("showinfo");
  v19[2] = CFSTR("iv_load_policy");
  v19[3] = CFSTR("controls");
  v4 = !self->_showsControls;
  v5 = &unk_1E44EEC00;
  v20[0] = &unk_1E44EEBD0;
  v20[1] = &unk_1E44EEBD0;
  if (v4)
    v5 = &unk_1E44EEBD0;
  v20[2] = &unk_1E44EEBE8;
  v20[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithDictionary:", v6);

  if (self->_startTime != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("start"));

  }
  if (self->_endTime != -1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("end"));

  }
  v18[0] = self->_videoID;
  v17[0] = CFSTR("videoId");
  v17[1] = CFSTR("startsPlayingAutomatically");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_startsPlayingAutomatically);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  v17[2] = CFSTR("startsPlayingMuted");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_muted);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = CFSTR("playerVars");
  v18[2] = v11;
  v18[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v12, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v13, 4);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("window.parameters = %@;"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)createVideoPlayerView
{
  LPYouTubePlayerScriptMessageHandler *v3;
  LPYouTubePlayerScriptMessageHandler *scriptMessageHandler;
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
  id v17;
  void *v18;
  void *v19;
  LPYouTubePlayerWebView *v20;
  LPYouTubePlayerWebView *v21;
  LPYouTubePlayerWebView *webView;
  void *v23;
  void *v24;
  void *v25;
  LPYouTubePlayerViewFullScreenDelegate *v26;
  LPYouTubePlayerViewFullScreenDelegate *fullScreenDelegate;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  LPYouTubePlayerWebView *v35;
  void *v36;
  id v37;
  id v38;

  v3 = -[LPYouTubePlayerScriptMessageHandler initWithPlayerView:]([LPYouTubePlayerScriptMessageHandler alloc], "initWithPlayerView:", self);
  scriptMessageHandler = self->_scriptMessageHandler;
  self->_scriptMessageHandler = v3;

  v38 = objc_alloc_init(MEMORY[0x1E0CEF638]);
  v5 = objc_alloc_init(MEMORY[0x1E0CEF6C0]);
  linkPresentationBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "builtInPlugInsURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("YouTubePlayer.wkbundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInjectedBundleURL:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF5F8]), "_initWithConfiguration:", v5);
  objc_msgSend(v38, "setProcessPool:", v9);

  objc_msgSend(v38, "processPool");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[LPApplicationIdentification isMessagesOrMessagesViewService](LPApplicationIdentification, "isMessagesOrMessagesViewService"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setObject:forBundleParameter:", v11, CFSTR("isMessagesOrMessagesViewService"));

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF738]), "initNonPersistentConfiguration");
  objc_msgSend(v12, "setDeviceManagementRestrictionsEnabled:", 1);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF650]), "_initWithConfiguration:", v12);
  objc_msgSend(v38, "setWebsiteDataStore:", v13);

  objc_msgSend(v38, "_setIgnoresAppBoundDomains:", 1);
  objc_msgSend(v38, "setMediaTypesRequiringUserActionForPlayback:", 0);
  objc_msgSend(v38, "setAllowsInlineMediaPlayback:", 1);
  objc_msgSend(v38, "_setInlineMediaPlaybackRequiresPlaysInlineAttribute:", 0);
  objc_msgSend(v38, "setAllowsPictureInPictureMediaPlayback:", 0);
  if (+[LPSettings showDebugIndicators](LPSettings, "showDebugIndicators"))
  {
    objc_msgSend(v38, "preferences");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setCompositingBordersVisible:", 1);

  }
  if (-[LPYouTubePlayerView _shouldUseElementFullScreen](self, "_shouldUseElementFullScreen"))
  {
    objc_msgSend(v38, "preferences");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_setFullScreenEnabled:", 1);

  }
  objc_msgSend(v38, "userContentController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addScriptMessageHandler:name:", self->_scriptMessageHandler, CFSTR("playerContainer"));
  v17 = objc_alloc(MEMORY[0x1E0CEF610]);
  -[LPYouTubePlayerView _parameterScript](self, "_parameterScript");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithSource:injectionTime:forMainFrameOnly:", v18, 0, 1);
  objc_msgSend(v16, "addUserScript:", v19);

  v20 = [LPYouTubePlayerWebView alloc];
  -[LPYouTubePlayerView bounds](self, "bounds");
  v21 = -[LPYouTubePlayerWebView initWithFrame:configuration:](v20, "initWithFrame:configuration:", v38);
  webView = self->_webView;
  self->_webView = v21;

  -[LPYouTubePlayerWebView setNavigationDelegate:](self->_webView, "setNavigationDelegate:", self);
  -[LPYouTubePlayerWebView setUIDelegate:](self->_webView, "setUIDelegate:", self);
  -[LPYouTubePlayerWebView setCustomUserAgent:](self->_webView, "setCustomUserAgent:", CFSTR("Mozilla/5.0 (iPhone; CPU iPhone OS 13_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.5 Mobile/15E148 Safari/604.1"));
  -[LPYouTubePlayerWebView scrollView](self->_webView, "scrollView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setDelegate:", self);

  -[LPYouTubePlayerWebView scrollView](self->_webView, "scrollView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setScrollEnabled:", 0);

  -[LPYouTubePlayerWebView scrollView](self->_webView, "scrollView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setContentInsetAdjustmentBehavior:", 2);

  v26 = objc_alloc_init(LPYouTubePlayerViewFullScreenDelegate);
  fullScreenDelegate = self->_fullScreenDelegate;
  self->_fullScreenDelegate = v26;

  -[LPYouTubePlayerWebView _setFullscreenDelegate:](self->_webView, "_setFullscreenDelegate:", self->_fullScreenDelegate);
  if (+[LPSettings showDebugIndicators](LPSettings, "showDebugIndicators"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v29 = objc_msgSend(v28, "CGColor");
    -[LPYouTubePlayerWebView layer](self->_webView, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setBorderColor:", v29);

    -[LPYouTubePlayerWebView layer](self->_webView, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setBorderWidth:", 9.0);

  }
  linkPresentationBundle();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "URLForResource:withExtension:", CFSTR("YouTubeContainer"), CFSTR("html"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", v33, 4, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = self->_webView;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://www.youtube.com/"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (id)-[LPYouTubePlayerWebView loadHTMLString:baseURL:](v35, "loadHTMLString:baseURL:", v34, v36);

  -[LPYouTubePlayerView addSubview:](self, "addSubview:", self->_webView);
}

- (void)webViewWebContentProcessDidTerminate:(id)a3
{
  NSObject *v4;

  v4 = LPLogChannelVideo();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[LPYouTubePlayerView webViewWebContentProcessDidTerminate:].cold.1(v4);
  -[LPYouTubePlayerView dispatchErrorWithCode:](self, "dispatchErrorWithCode:", 7);
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 preferences:(id)a5 decisionHandler:(id)a6
{
  id v8;
  void (**v9)(id, uint64_t, id);
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a4;
  v8 = a5;
  v9 = (void (**)(id, uint64_t, id))a6;
  objc_msgSend(v14, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "navigationType") || !objc_msgSend(v11, "_lp_isHTTPFamilyURL"))
  {
    v13 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "openURL:options:completionHandler:", v11, MEMORY[0x1E0C9AA70], &__block_literal_global_21);

    v13 = 0;
  }
  v9[2](v9, v13, v8);

}

- (id)webView:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 windowFeatures:(id)a6
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a5, "request", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "_lp_isHTTPFamilyURL") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "openURL:options:completionHandler:", v7, MEMORY[0x1E0C9AA70], &__block_literal_global_168);

  }
  return 0;
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  -[LPYouTubePlayerView dispatchErrorWithCode:](self, "dispatchErrorWithCode:", 7, a4, a5);
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  -[LPYouTubePlayerView dispatchErrorWithCode:](self, "dispatchErrorWithCode:", 7, a4, a5);
}

- (void)_webView:(id)a3 navigation:(id)a4 didFailProvisionalLoadInSubframe:(id)a5 withError:(id)a6
{
  -[LPYouTubePlayerView dispatchErrorWithCode:](self, "dispatchErrorWithCode:", 7, a4, a5, a6);
}

- (void)scrollViewDidScroll:(id)a3
{
  objc_msgSend(a3, "setContentOffset:animated:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (void)layoutSubviews
{
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
  double v15;
  double v16;
  void *v17;
  objc_super v18;
  CGRect v19;
  CGRect v20;

  v18.receiver = self;
  v18.super_class = (Class)LPYouTubePlayerView;
  -[LPYouTubePlayerView layoutSubviews](&v18, sel_layoutSubviews);
  -[LPYouTubePlayerWebView frame](self->_webView, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[LPYouTubePlayerView bounds](self, "bounds");
  v20.origin.x = v11;
  v20.origin.y = v12;
  v20.size.width = v13;
  v20.size.height = v14;
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  if (!CGRectEqualToRect(v19, v20))
  {
    -[LPYouTubePlayerView bounds](self, "bounds");
    -[LPYouTubePlayerWebView setFrame:](self->_webView, "setFrame:");
    v15 = *MEMORY[0x1E0C9D538];
    v16 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[LPYouTubePlayerWebView scrollView](self->_webView, "scrollView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setContentOffset:", v15, v16);

  }
}

- (void)didReceiveScriptMessage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *commandsPendingPlayerReadiness;
  id v14;
  uint64_t v15;
  int64_t v16;
  void *v17;
  char v18;
  id v19;
  uint64_t v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "body");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("message"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("onReady")))
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("onStateChange")))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("data"));
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (v15 = objc_msgSend(v14, "integerValue"), (unint64_t)(v15 + 1) <= 6))
      {
        v16 = qword_1A0D661B0[v15 + 1];
      }
      else
      {
        v16 = 6;
      }

      self->_state = v16;
      -[LPYouTubePlayerView delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_opt_respondsToSelector();

      if ((v22 & 1) == 0)
        goto LABEL_40;
      -[LPYouTubePlayerView delegate](self, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "youTubePlayer:didChangeToState:", self, self->_state);
LABEL_39:

      goto LABEL_40;
    }
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("onError")))
    {
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("onPresentationModeChange")))
        goto LABEL_40;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFullScreen"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v23, "BOOLValue") & 1) == 0)
        -[LPYouTubePlayerWebView resignFirstResponder](self->_webView, "resignFirstResponder");
      -[LPYouTubePlayerView delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_opt_respondsToSelector();

      if ((v25 & 1) == 0)
        goto LABEL_39;
      -[LPYouTubePlayerView delegate](self, "delegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "youTubePlayer:didChangeToFullScreen:", self, objc_msgSend(v23, "BOOLValue"));
LABEL_38:

      goto LABEL_39;
    }
    -[LPYouTubePlayerView delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) == 0)
      goto LABEL_40;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("data"));
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = objc_msgSend(v19, "integerValue");
      if (v20 <= 100)
      {
        if (v20 == 2)
        {
          v27 = 0;
          goto LABEL_37;
        }
        if (v20 == 5)
        {
          v27 = 1;
          goto LABEL_37;
        }
        if (v20 != 100)
          goto LABEL_36;
LABEL_41:
        v27 = 2;
        goto LABEL_37;
      }
      switch(v20)
      {
        case 101:
          goto LABEL_35;
        case 105:
          goto LABEL_41;
        case 150:
LABEL_35:
          v27 = 3;
LABEL_37:

          -[LPYouTubePlayerView delegate](self, "delegate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("LPYouTubePlayerErrorDomain"), v27, 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "youTubePlayer:didReceiveError:", self, v26);
          goto LABEL_38;
      }
    }
LABEL_36:
    v27 = 6;
    goto LABEL_37;
  }
  -[LPYouTubePlayerView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[LPYouTubePlayerView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "youTubePlayerDidBecomeReady:", self);

  }
  self->_ready = 1;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = self->_commandsPendingPlayerReadiness;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v29;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v9);
        -[LPYouTubePlayerView _evaluatePlayerCommand:](self, "_evaluatePlayerCommand:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v12++), (_QWORD)v28);
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v10);
  }

  commandsPendingPlayerReadiness = self->_commandsPendingPlayerReadiness;
  self->_commandsPendingPlayerReadiness = 0;

LABEL_40:
}

- (LPYouTubePlayerDelegate)delegate
{
  return (LPYouTubePlayerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)startsPlayingAutomatically
{
  return self->_startsPlayingAutomatically;
}

- (void)setStartsPlayingAutomatically:(BOOL)a3
{
  self->_startsPlayingAutomatically = a3;
}

- (BOOL)showsControls
{
  return self->_showsControls;
}

- (void)setShowsControls:(BOOL)a3
{
  self->_showsControls = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_commandsPendingPlayerReadiness, 0);
  objc_storeStrong((id *)&self->_scriptMessageHandler, 0);
  objc_storeStrong((id *)&self->_videoID, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_fullScreenDelegate, 0);
}

- (void)webViewWebContentProcessDidTerminate:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A0C41000, log, OS_LOG_TYPE_ERROR, "LPYouTubePlayerView: Web Content process was terminated", v1, 2u);
}

@end

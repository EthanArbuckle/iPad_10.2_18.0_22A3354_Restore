@implementation EDWebContentParser

void ___ef_log_EDWebContentParser_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "EDWebContentParser");
  v1 = (void *)_ef_log_EDWebContentParser_log;
  _ef_log_EDWebContentParser_log = (uint64_t)v0;

}

+ (OS_os_log)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__EDWebContentParser_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_11 != -1)
    dispatch_once(&signpostLog_onceToken_11, block);
  return (OS_os_log *)(id)signpostLog_log_11;
}

void __33__EDWebContentParser_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log_11;
  signpostLog_log_11 = (uint64_t)v1;

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

- (EDWebContentParser)initWithOptions:(unint64_t)a3 cancelationToken:(id)a4
{
  id v7;
  EDWebContentParser *v8;
  EDWebContentParser *v9;
  id v10;
  void *v11;
  uint64_t v12;
  EFLocked *state;
  EFCancelationToken *v14;
  EFCancelationToken *contentRuleListsObservationToken;
  ECWebContentObserver *v16;
  ECWebContentObserver *webContentObserver;
  uint64_t v18;
  EFScheduler *backgroundWorkScheduler;
  NSMutableArray *v20;
  NSMutableArray *currentContentRuleLists;
  objc_super v23;

  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)EDWebContentParser;
  v8 = -[EDWebContentParser init](&v23, sel_init);
  v9 = v8;
  if (v8)
  {
    -[EDWebContentParser setOptions:](v8, "setOptions:", a3);
    objc_storeStrong((id *)&v9->_token, a4);
    v10 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    v11 = (void *)objc_opt_new();
    v12 = objc_msgSend(v10, "initWithObject:", v11);
    state = v9->_state;
    v9->_state = (EFLocked *)v12;

    v14 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E0D1EE90]);
    contentRuleListsObservationToken = v9->_contentRuleListsObservationToken;
    v9->_contentRuleListsObservationToken = v14;

    v16 = -[ECWebContentObserver initWithParser:]([ECWebContentObserver alloc], "initWithParser:", v9);
    webContentObserver = v9->_webContentObserver;
    v9->_webContentObserver = v16;

    v9->_remoteContentParserLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.email.EDWebContentParser"), 9);
    v18 = objc_claimAutoreleasedReturnValue();
    backgroundWorkScheduler = v9->_backgroundWorkScheduler;
    v9->_backgroundWorkScheduler = (EFScheduler *)v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    currentContentRuleLists = v9->_currentContentRuleLists;
    v9->_currentContentRuleLists = v20;

    v9->_contentRuleListsNeedUpdate = 1;
    v9->_contentRuleListsLock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if ((self->_options & 1) != 0)
  {
    -[WKWebView _remoteObjectRegistry](self->_webView, "_remoteObjectRegistry");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unregisterExportedObject:interface:", self->_webContentObserver, self->_webContentObserverInterface);

  }
  -[EFCancelationToken cancel](self->_contentRuleListsObservationToken, "cancel");
  v4.receiver = self;
  v4.super_class = (Class)EDWebContentParser;
  -[EDWebContentParser dealloc](&v4, sel_dealloc);
}

- (void)test_tearDown
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDWebContentParser.m"), 142, CFSTR("%s can only be called from unit tests"), "-[EDWebContentParser test_tearDown]");

  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
  -[EDWebContentParser backgroundWorkScheduler](self, "backgroundWorkScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__EDWebContentParser_test_tearDown__block_invoke;
  v9[3] = &unk_1E949AEB8;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "performBlock:", v9);
  while (1)
  {

    if ((objc_msgSend(v6, "tryLockWhenCondition:", 1) & 1) != 0)
      break;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.001);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "runUntilDate:", v5);

    objc_msgSend(MEMORY[0x1E0CB3978], "sleepUntilDate:", v5);
  }
  objc_msgSend(v6, "unlock");

}

uint64_t __35__EDWebContentParser_test_tearDown__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unlockWithCondition:", 1);
}

- (id)webViewConfiguration
{
  void *v5;
  _QWORD block[5];

  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDWebContentParser.m"), 164, CFSTR("Current thread must be main"));

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__EDWebContentParser_webViewConfiguration__block_invoke;
  block[3] = &unk_1E949AEB8;
  block[4] = self;
  if (webViewConfiguration_onceToken != -1)
    dispatch_once(&webViewConfiguration_onceToken, block);
  -[EDWebContentParser _updateContentRuleListsIfNeededForWebViewConfiguration:](self, "_updateContentRuleListsIfNeededForWebViewConfiguration:", webViewConfiguration_configuration);
  return (id)webViewConfiguration_configuration;
}

void __42__EDWebContentParser_webViewConfiguration__block_invoke(uint64_t a1)
{
  id v2;
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
  id v13;

  v2 = objc_alloc_init((Class)getWKWebViewConfigurationClass[0]());
  v3 = (void *)webViewConfiguration_configuration;
  webViewConfiguration_configuration = (uint64_t)v2;

  objc_msgSend((id)webViewConfiguration_configuration, "_setClientNavigationsRunAtForegroundPriority:", 1);
  objc_msgSend((id)webViewConfiguration_configuration, "defaultWebpagePreferences");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAllowsContentJavaScript:", 0);

  if (_os_feature_enabled_impl() && (objc_msgSend(*(id *)(a1 + 32), "options") & 2) != 0)
    objc_msgSend((id)webViewConfiguration_configuration, "setDataDetectorTypes:", -1);
  v13 = objc_alloc_init((Class)get_WKProcessPoolConfigurationClass[0]());
  objc_msgSend(MEMORY[0x1E0D1E6D8], "bundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForResource:withExtension:subdirectory:", CFSTR("EmailCore"), CFSTR("wkbundle"), CFSTR("PlugIns"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setInjectedBundleURL:", v5);

  v6 = (void *)objc_msgSend(objc_alloc((Class)getWKProcessPoolClass[0]()), "_initWithConfiguration:", v13);
  objc_msgSend((id)webViewConfiguration_configuration, "setProcessPool:", v6);
  getWKUserContentControllerClass[0]();
  v7 = (void *)objc_opt_new();
  objc_msgSend((id)webViewConfiguration_configuration, "setUserContentController:", v7);

  if ((objc_msgSend(*(id *)(a1 + 32), "options") & 4) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_richLinkMetadataScript");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend((id)webViewConfiguration_configuration, "userContentController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addUserScript:", v8);

    }
    objc_msgSend((id)webViewConfiguration_configuration, "userContentController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addScriptMessageHandler:name:", *(_QWORD *)(a1 + 32), CFSTR("MetadataMessageHandler"));

    objc_msgSend((id)webViewConfiguration_configuration, "userContentController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addScriptMessageHandler:name:", *(_QWORD *)(a1 + 32), CFSTR("LogHandler"));

  }
}

- (WKWebView)webView
{
  WKWebView *webView;
  uint32_t v5;
  int v6;
  double v7;
  int v8;
  double v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  WKWebView *v19;
  WKWebView *v20;
  void *v22;

  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDWebContentParser.m"), 211, CFSTR("Current thread must be main"));

  }
  webView = self->_webView;
  if (!webView)
  {
    v5 = arc4random_uniform(3u);
    if ((arc4random() & 1) != 0)
      v6 = 1;
    else
      v6 = -1;
    EFARC4NormallyDistributedRandomDoubleInRange();
    v8 = v6 * (int)v7;
    EFARC4NormallyDistributedRandomDoubleInRange();
    v10 = v6 * (int)v9;
    v11 = (double)(v8 + 390);
    v12 = (double)(v10 + 844);
    v13 = (double)(v8 + 834);
    v14 = (double)(v10 + 1194);
    if (v5)
    {
      v13 = 0.0;
      v14 = 0.0;
    }
    if (v5 != 1)
    {
      v11 = v13;
      v12 = v14;
    }
    if (v5 == 2)
      v15 = (double)(v8 + 1325);
    else
      v15 = v11;
    if (v5 == 2)
      v16 = (double)(v10 + 906);
    else
      v16 = v12;
    v17 = objc_alloc((Class)getWKWebViewClass[0]());
    -[EDWebContentParser webViewConfiguration](self, "webViewConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (WKWebView *)objc_msgSend(v17, "initWithFrame:configuration:", v18, 0.0, 0.0, v15, v16);
    v20 = self->_webView;
    self->_webView = v19;

    -[WKWebView setNavigationDelegate:](self->_webView, "setNavigationDelegate:", self);
    -[EDWebContentParser _addRemoteContentWebViewObserver](self, "_addRemoteContentWebViewObserver");
    webView = self->_webView;
  }
  return webView;
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  (*((void (**)(id, uint64_t))a5 + 2))(a5, 1);
}

- (id)_richLinkMetadataScript
{
  id v2;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__EDWebContentParser__richLinkMetadataScript__block_invoke;
  block[3] = &unk_1E949AEB8;
  block[4] = self;
  if (_richLinkMetadataScript_onceToken != -1)
    dispatch_once(&_richLinkMetadataScript_onceToken, block);
  v2 = objc_alloc(MEMORY[0x1E0CEF610]);
  return (id)objc_msgSend(v2, "initWithSource:injectionTime:forMainFrameOnly:", _richLinkMetadataScript_findRichLinkMetadataSource, 1, 0);
}

void __45__EDWebContentParser__richLinkMetadataScript__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  _BYTE v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("FindRichLinkMetadata"), CFSTR("js"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithContentsOfFile:encoding:error:", v1, 4, &v7);
  v3 = v7;
  v4 = (void *)_richLinkMetadataScript_findRichLinkMetadataSource;
  _richLinkMetadataScript_findRichLinkMetadataSource = v2;

  if (!_richLinkMetadataScript_findRichLinkMetadataSource)
  {
    _ef_log_EDWebContentParser();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "ef_publicDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      __45__EDWebContentParser__richLinkMetadataScript__block_invoke_cold_1(v6, (uint64_t)v8, v5);
    }

  }
}

- (void)parseHTMLData:(id)a3 characterEncodingName:(id)a4 withOptions:(unint64_t)a5 forMessage:(id)a6 withSubject:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, void *);
  NSObject *v19;
  void *v20;
  EFScheduler *backgroundWorkScheduler;
  id v22;
  id v23;
  id v24;
  void (**v25)(id, void *);
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  void (**v30)(id, void *);
  unint64_t v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = (void (**)(id, void *))a8;
  if ((a5 & 2) != 0)
  {
    _ef_log_EDWebContentParser();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v16;
      _os_log_impl(&dword_1D2F2C000, v19, OS_LOG_TYPE_INFO, "Scheduling data detection work for message %@", buf, 0xCu);
    }

  }
  if ((a5 & 8) != 0)
  {
    -[EDWebContentParser _extractOneTimeCodeFromHTMLString:orWithData:characterEncodingName:withSubject:](self, "_extractOneTimeCodeFromHTMLString:orWithData:characterEncodingName:withSubject:", 0, v14, v15, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2](v18, v20);

  }
  backgroundWorkScheduler = self->_backgroundWorkScheduler;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __111__EDWebContentParser_parseHTMLData_characterEncodingName_withOptions_forMessage_withSubject_completionHandler___block_invoke;
  v26[3] = &unk_1E94A36A8;
  v26[4] = self;
  v22 = v14;
  v27 = v22;
  v23 = v15;
  v28 = v23;
  v31 = a5;
  v24 = v16;
  v29 = v24;
  v25 = v18;
  v30 = v25;
  -[EFScheduler performBlock:](backgroundWorkScheduler, "performBlock:", v26);

}

void __111__EDWebContentParser_parseHTMLData_characterEncodingName_withOptions_forMessage_withSubject_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_parseHTMLString:orWithData:characterEncodingName:withOptions:messageID:", 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

- (void)parseHTMLString:(id)a3 withOptions:(unint64_t)a4 forMessage:(id)a5 withSubject:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, void *);
  NSObject *v16;
  void *v17;
  EFScheduler *backgroundWorkScheduler;
  id v19;
  id v20;
  void (**v21)(id, void *);
  _QWORD v22[5];
  id v23;
  id v24;
  void (**v25)(id, void *);
  unint64_t v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, void *))a7;
  if ((a4 & 2) != 0)
  {
    _ef_log_EDWebContentParser();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v13;
      _os_log_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_INFO, "Scheduling data detection work for message %@", buf, 0xCu);
    }

  }
  if ((a4 & 8) != 0)
  {
    -[EDWebContentParser _extractOneTimeCodeFromHTMLString:orWithData:characterEncodingName:withSubject:](self, "_extractOneTimeCodeFromHTMLString:orWithData:characterEncodingName:withSubject:", v12, 0, 0, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, v17);

  }
  backgroundWorkScheduler = self->_backgroundWorkScheduler;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __91__EDWebContentParser_parseHTMLString_withOptions_forMessage_withSubject_completionHandler___block_invoke;
  v22[3] = &unk_1E949C2F0;
  v22[4] = self;
  v19 = v12;
  v23 = v19;
  v26 = a4;
  v20 = v13;
  v24 = v20;
  v21 = v15;
  v25 = v21;
  -[EFScheduler performBlock:](backgroundWorkScheduler, "performBlock:", v22);

}

void __91__EDWebContentParser_parseHTMLString_withOptions_forMessage_withSubject_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_parseHTMLString:orWithData:characterEncodingName:withOptions:messageID:", *(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (id)_extractPlainTextFromHTMLString:(id)a3 orWithData:(id)a4 characterEncodingName:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    ECConvertCharacterSetNameToEncoding();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      v12 = objc_msgSend(v10, "unsignedIntegerValue");
    else
      v12 = 4;
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, v12);

    v7 = (id)v13;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D1E770], "snippetFromHTMLBody:options:maxLength:preservingQuotedForwardedContent:", v7, 32, 0x7FFFFFFFFFFFFFFFLL, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _ef_log_EDWebContentParser();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[EDWebContentParser _extractPlainTextFromHTMLString:orWithData:characterEncodingName:].cold.1(v15);

    v14 = 0;
  }

  return v14;
}

- (id)_extractOneTimeCodeFromHTMLString:(id)a3 orWithData:(id)a4 characterEncodingName:(id)a5 withSubject:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  EDWebContentParserResults *v13;

  v10 = a6;
  -[EDWebContentParser _extractPlainTextFromHTMLString:orWithData:characterEncodingName:](self, "_extractPlainTextFromHTMLString:orWithData:characterEncodingName:", a3, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDDataDetectionUtilities extractOneTimeCode:withSubject:](EDDataDetectionUtilities, "extractOneTimeCode:withSubject:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(EDWebContentParserResults);
  -[EDWebContentParserResults setOneTimeCode:](v13, "setOneTimeCode:", v12);

  return v13;
}

- (id)_parseHTMLString:(id)a3 orWithData:(id)a4 characterEncodingName:(id)a5 withOptions:(unint64_t)a6 messageID:(id)a7
{
  char v8;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  uint64_t v17;
  NSObject *v18;
  os_signpost_id_t v19;
  uint64_t v20;
  EFLocked *state;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  os_signpost_id_t v36;
  NSObject *v37;
  os_signpost_id_t v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  os_signpost_id_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  os_signpost_id_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  id v54;
  void *v55;
  id v56;
  void *v57;
  uint64_t v58;
  id v59;
  id v60;
  EDWebContentParserResults *v61;
  id v62;
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  EDWebContentParser *v67;
  id v68;
  id v69;
  _BYTE *v70;
  _QWORD v71[9];
  char v72;
  char v73;
  char v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  uint8_t v93[4];
  uint64_t v94;
  _BYTE buf[24];
  uint64_t (*v96)(uint64_t, uint64_t);
  void (*v97)(uint64_t);
  id v98;
  uint64_t v99;

  v8 = a6;
  v99 = *MEMORY[0x1E0C80C00];
  v59 = a3;
  v60 = a4;
  v12 = a5;
  v13 = a7;
  if ((-[EFCancelationToken isCanceled](self->_token, "isCanceled") & 1) != 0)
  {
    v61 = 0;
  }
  else
  {
    v58 = (uint64_t)v13;
    v61 = objc_alloc_init(EDWebContentParserResults);
    if ((v8 & 2) != 0)
    {
      _ef_log_EDWebContentParser();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v58;
        _os_log_impl(&dword_1D2F2C000, v14, OS_LOG_TYPE_INFO, "Starting data detection work for message %@", buf, 0xCu);
      }

      -[EDWebContentParser _enableDataDetection](self, "_enableDataDetection");
      +[EDWebContentParser signpostLog](EDWebContentParser, "signpostLog");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = -[EDWebContentParser signpostID](self, "signpostID");
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v16, "EDWebContentParserDataDetection", ", buf, 2u);
      }

    }
    v17 = v8 & 1;
    if ((v8 & 1) != 0)
    {
      +[EDWebContentParser signpostLog](EDWebContentParser, "signpostLog");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = -[EDWebContentParser signpostID](self, "signpostID");
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v19, "EDWebContentParserLinkParsing", ", buf, 2u);
      }

    }
    os_unfair_lock_lock(&self->_remoteContentParserLock);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v96 = __Block_byref_object_copy__44;
    v97 = __Block_byref_object_dispose__44;
    v98 = 0;
    v87 = 0;
    v88 = &v87;
    v89 = 0x3032000000;
    v90 = __Block_byref_object_copy__44;
    v91 = __Block_byref_object_dispose__44;
    v92 = 0;
    v81 = 0;
    v82 = &v81;
    v83 = 0x3032000000;
    v84 = __Block_byref_object_copy__44;
    v85 = __Block_byref_object_dispose__44;
    v86 = 0;
    v75 = 0;
    v76 = &v75;
    v77 = 0x3032000000;
    v78 = __Block_byref_object_copy__44;
    v79 = __Block_byref_object_dispose__44;
    v80 = 0;
    if (!v12)
    {
      CFStringConvertEncodingToIANACharSetName(0x600u);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v57 = v12;
    v20 = v8 & 2;
    state = self->_state;
    v22 = v8 & 4;
    v23 = MEMORY[0x1E0C809B0];
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = __94__EDWebContentParser__parseHTMLString_orWithData_characterEncodingName_withOptions_messageID___block_invoke;
    v71[3] = &unk_1E94A36D0;
    v72 = (v8 & 2) >> 1;
    v71[4] = self;
    v71[5] = &v87;
    v73 = v8 & 1;
    v74 = (v8 & 4) >> 2;
    v71[6] = &v81;
    v71[7] = &v75;
    v71[8] = buf;
    -[EFLocked performWhileLocked:](state, "performWhileLocked:", v71);
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v23;
    v65[1] = 3221225472;
    v65[2] = __94__EDWebContentParser__parseHTMLString_orWithData_characterEncodingName_withOptions_messageID___block_invoke_2;
    v65[3] = &unk_1E94A36F8;
    v66 = v59;
    v67 = self;
    v70 = buf;
    v54 = v60;
    v68 = v54;
    v56 = v57;
    v69 = v56;
    objc_msgSend(v24, "performCancelableBlock:", v65);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v27 = (void *)v82[5];
      v64 = 0;
      objc_msgSend(v27, "resultWithTimeout:error:", &v64, 10.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v64;
      -[EDWebContentParserResults setRemoteContentLinks:](v61, "setRemoteContentLinks:", v28);

    }
    else
    {
      v26 = 0;
    }
    if (v20)
    {
      v30 = (void *)v88[5];
      v63 = 0;
      objc_msgSend(v30, "resultWithTimeout:error:", &v63, 10.0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v63;
      -[EDWebContentParserResults setDataDetectionResults:](v61, "setDataDetectionResults:", v31);

    }
    else
    {
      v29 = 0;
    }
    if (v22)
    {
      v33 = (void *)v76[5];
      v62 = 0;
      objc_msgSend(v33, "resultWithTimeout:error:", &v62, 10.0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v62;
      -[EDWebContentParserResults setRichLinkResults:](v61, "setRichLinkResults:", v34);

    }
    else
    {
      v32 = 0;
    }
    if (objc_msgSend(v26, "ef_isTimeoutError", v54))
    {
      +[EDWebContentParser signpostLog](EDWebContentParser, "signpostLog");
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = -[EDWebContentParser signpostID](self, "signpostID");
      if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        *(_WORD *)v93 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v35, OS_SIGNPOST_INTERVAL_END, v36, "EDWebContentParserLinkParsing", "Parsing remote content links timed out", v93, 2u);
      }

      objc_msgSend(v25, "cancel");
    }
    if (v20 && objc_msgSend(v29, "ef_isTimeoutError"))
    {
      +[EDWebContentParser signpostLog](EDWebContentParser, "signpostLog");
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = -[EDWebContentParser signpostID](self, "signpostID");
      if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
      {
        *(_WORD *)v93 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v37, OS_SIGNPOST_INTERVAL_END, v38, "EDWebContentParserDataDetection", "Data detection timed out", v93, 2u);
      }

      _ef_log_EDWebContentParser();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v93 = 138412290;
        v94 = v58;
        _os_log_impl(&dword_1D2F2C000, v39, OS_LOG_TYPE_INFO, "Data detection for message %@ timed out", v93, 0xCu);
      }

      objc_msgSend(v25, "cancel");
    }
    if (objc_msgSend(v32, "ef_isTimeoutError"))
    {
      _ef_log_EDWebContentParser();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        -[EDWebContentParser _parseHTMLString:orWithData:characterEncodingName:withOptions:messageID:].cold.1(v58, v40, v41);

      objc_msgSend(v25, "cancel");
    }

    _Block_object_dispose(&v75, 8);
    _Block_object_dispose(&v81, 8);

    _Block_object_dispose(&v87, 8);
    _Block_object_dispose(buf, 8);

    os_unfair_lock_unlock(&self->_remoteContentParserLock);
    if (v17)
    {
      +[EDWebContentParser signpostLog](EDWebContentParser, "signpostLog");
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = -[EDWebContentParser signpostID](self, "signpostID");
      if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
      {
        -[EDWebContentParserResults remoteContentLinks](v61, "remoteContentLinks");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "count");
        v46 = objc_msgSend(v55, "length");
        *(_DWORD *)buf = 134349312;
        *(_QWORD *)&buf[4] = v45;
        *(_WORD *)&buf[12] = 2050;
        *(_QWORD *)&buf[14] = v46;
        _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v42, OS_SIGNPOST_INTERVAL_END, v43, "EDWebContentParserLinkParsing", "Parsed NumberOfRemoteLinks=%{public,signpost.telemetry:number1}lu from SizeOfBody=%{public,signpost.telemetry:number2}lu enableTelemetry=YES ", buf, 0x16u);

      }
    }
    if (v20)
    {
      +[EDWebContentParser signpostLog](EDWebContentParser, "signpostLog");
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = -[EDWebContentParser signpostID](self, "signpostID");
      if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
      {
        -[EDWebContentParserResults dataDetectionResults](v61, "dataDetectionResults");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "count");
        v51 = objc_msgSend(v55, "length");
        *(_DWORD *)buf = 134349312;
        *(_QWORD *)&buf[4] = v50;
        *(_WORD *)&buf[12] = 2050;
        *(_QWORD *)&buf[14] = v51;
        _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v47, OS_SIGNPOST_INTERVAL_END, v48, "EDWebContentParserDataDetection", "Found NumberOfDataDtectionResults=%{public,signpost.telemetry:number1}lu from SizeOfBody=%{public,signpost.telemetry:number2}lu enableTelemetry=YES ", buf, 0x16u);

      }
      _ef_log_EDWebContentParser();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v58;
        _os_log_impl(&dword_1D2F2C000, v52, OS_LOG_TYPE_INFO, "Data detection for message %@ finished.", buf, 0xCu);
      }

    }
    v12 = v56;
    v13 = (id)v58;
  }

  return v61;
}

void __94__EDWebContentParser__parseHTMLString_orWithData_characterEncodingName_withOptions_messageID___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;

  v3 = a2;
  v35 = v3;
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(v3, "dataDetectionPromise");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancel");

    objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setDataDetectionPromise:", v5);

    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(v35, "dataDetectionPromise");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addCancelable:", v7);

    objc_msgSend(v35, "dataDetectionPromise");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "future");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v3 = v35;
  }
  if (*(_BYTE *)(a1 + 73))
  {
    objc_msgSend(v3, "remoteContentPromise");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cancel");

    objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setRemoteContentPromise:", v13);

    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(v35, "remoteContentPromise");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addCancelable:", v15);

    objc_msgSend(v35, "remoteContentPromise");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "future");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

  }
  if (*(_BYTE *)(a1 + 74))
  {
    objc_msgSend(v35, "richLinkPromise");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "cancel");

    objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setRichLinkPromise:", v21);

    v22 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(v35, "richLinkPromise");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addCancelable:", v23);

    objc_msgSend(v35, "richLinkPromise");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "future");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v25;

  }
  v28 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v28, "setScheme:", CFSTR("x-apple-mail-parser"));
  v29 = _parseHTMLString_orWithData_characterEncodingName_withOptions_messageID__baseURLCount++;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setPath:", v30);

  objc_msgSend(v28, "URL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setBaseURL:", v31);

  objc_msgSend(v35, "baseURL");
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v34 = *(void **)(v33 + 40);
  *(_QWORD *)(v33 + 40) = v32;

}

void __94__EDWebContentParser__parseHTMLString_orWithData_characterEncodingName_withOptions_messageID___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  v7 = a2;
  v3 = (void *)a1[5];
  if (a1[4])
  {
    objc_msgSend(v3, "webView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "loadHTMLString:baseURL:", a1[4], *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40));
  }
  else
  {
    objc_msgSend(v3, "webView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v4, "loadData:MIMEType:characterEncodingName:baseURL:", a1[6], CFSTR("text/html"), a1[7], *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40));
  }

}

- (void)baseURL:(id)a3 didRequestRemoteContentURLs:(id)a4
{
  id v6;
  id v7;
  EFLocked *state;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__44;
  v20 = __Block_byref_object_dispose__44;
  v21 = 0;
  state = self->_state;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __58__EDWebContentParser_baseURL_didRequestRemoteContentURLs___block_invoke;
  v13 = &unk_1E94A3720;
  v9 = v6;
  v14 = v9;
  v15 = &v16;
  -[EFLocked performWhileLocked:](state, "performWhileLocked:", &v10);
  objc_msgSend((id)v17[5], "finishWithResult:", v7, v10, v11, v12, v13);

  _Block_object_dispose(&v16, 8);
}

void __58__EDWebContentParser_baseURL_didRequestRemoteContentURLs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9 = v3;
  objc_msgSend(v3, "baseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "isEqual:", v5);

  if ((_DWORD)v4)
  {
    objc_msgSend(v9, "remoteContentPromise");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

- (void)_addRemoteContentWebViewObserver
{
  _WKRemoteObjectInterface *v3;
  _WKRemoteObjectInterface *webContentObserverInterface;
  _WKRemoteObjectInterface *v5;
  _WKRemoteObjectInterface *v6;
  void *v7;
  uint64_t v8;
  _WKRemoteObjectInterface *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;

  objc_msgSend((Class)get_WKRemoteObjectInterfaceClass[0](), "remoteObjectInterfaceWithProtocol:", &unk_1EFCEC048);
  v3 = (_WKRemoteObjectInterface *)objc_claimAutoreleasedReturnValue();
  webContentObserverInterface = self->_webContentObserverInterface;
  self->_webContentObserverInterface = v3;

  v5 = self->_webContentObserverInterface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[_WKRemoteObjectInterface setClasses:forSelector:argumentIndex:ofReply:](v5, "setClasses:forSelector:argumentIndex:ofReply:");

  v6 = self->_webContentObserverInterface;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_WKRemoteObjectInterface setClasses:forSelector:argumentIndex:ofReply:](v6, "setClasses:forSelector:argumentIndex:ofReply:");

  v9 = self->_webContentObserverInterface;
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[_WKRemoteObjectInterface setClasses:forSelector:argumentIndex:ofReply:](v9, "setClasses:forSelector:argumentIndex:ofReply:");

  -[WKWebView _remoteObjectRegistry](self->_webView, "_remoteObjectRegistry");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "registerExportedObject:interface:", self->_webContentObserver, self->_webContentObserverInterface);

}

- (void)_enableDataDetection
{
  if (!-[EDWebContentParser isDataDetectionEnabled](self, "isDataDetectionEnabled"))
    -[EDWebContentParser setIsDataDetectionEnabled:](self, "setIsDataDetectionEnabled:", 1);
}

- (void)_disableDataDetection
{
  if (-[EDWebContentParser isDataDetectionEnabled](self, "isDataDetectionEnabled"))
    -[EDWebContentParser setIsDataDetectionEnabled:](self, "setIsDataDetectionEnabled:", 0);
}

- (void)requestDataDetectionResultsWithBaseURL:(id)a3
{
  id v4;
  EFLocked *state;
  _QWORD v6[4];
  id v7;
  EDWebContentParser *v8;
  uint64_t *v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  if (self->_webView && -[EDWebContentParser isDataDetectionEnabled](self, "isDataDetectionEnabled"))
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__44;
    v24 = __Block_byref_object_dispose__44;
    v25 = 0;
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = __Block_byref_object_copy__44;
    v18[4] = __Block_byref_object_dispose__44;
    v19 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__44;
    v16 = __Block_byref_object_dispose__44;
    v17 = 0;
    state = self->_state;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61__EDWebContentParser_requestDataDetectionResultsWithBaseURL___block_invoke;
    v6[3] = &unk_1E94A3748;
    v9 = &v20;
    v10 = v18;
    v7 = v4;
    v8 = self;
    v11 = &v12;
    -[EFLocked performWhileLocked:](state, "performWhileLocked:", v6);
    objc_msgSend((id)v21[5], "finishWithResult:", v13[5]);

    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(v18, 8);

    _Block_object_dispose(&v20, 8);
  }

}

void __61__EDWebContentParser_requestDataDetectionResultsWithBaseURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v15 = v3;
  objc_msgSend(v3, "baseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "isEqual:", v5);

  if ((_DWORD)v4)
  {
    objc_msgSend(v15, "dataDetectionPromise");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "_dataDetectionResults");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    objc_msgSend(*(id *)(a1 + 40), "_extractDataDetectorResultsMetadata:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
}

- (id)_extractDataDetectorResultsMetadata:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  _BOOL4 v20;
  id v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v31;
  uint64_t v32;
  id obj;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v31;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16, v31);
  if (v5)
  {
    v6 = *(_QWORD *)v36;
    v34 = *MEMORY[0x1E0D1CBC0];
    v32 = *MEMORY[0x1E0D1CAE0];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v36 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        -[EDWebContentParser _getDataDetectionCategoryString:](self, "_getDataDetectionCategoryString:", objc_msgSend(v8, "category"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          if (objc_msgSend(v9, "isEqualToString:", CFSTR("link")))
          {
            objc_msgSend(v8, "type");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v11, "isEqualToString:", v34))
            {

            }
            else
            {
              objc_msgSend(v8, "type");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v12, "isEqualToString:", v32);

              if ((v13 & 1) == 0)
                goto LABEL_26;
            }
          }
          if (objc_msgSend(v10, "isEqualToString:", CFSTR("misc")))
          {
            objc_msgSend(v8, "type");
            v14 = objc_claimAutoreleasedReturnValue();

            v10 = (void *)v14;
          }
          if (objc_msgSend(v10, "isEqualToString:", CFSTR("link")))
          {
            objc_msgSend(v8, "type");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v15, "isEqualToString:", v34))
            {

            }
            else
            {
              objc_msgSend(v8, "type");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isEqualToString:", v32);

              if ((v17 & 1) == 0)
                goto LABEL_26;
            }
          }
          if (objc_msgSend(v10, "isEqualToString:", CFSTR("misc")))
          {
            objc_msgSend(v8, "type");
            v18 = objc_claimAutoreleasedReturnValue();

            v10 = (void *)v18;
          }
          objc_msgSend(v4, "objectForKeyedSubscript:", v10);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19 == 0;

          if (v20)
          {
            v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, v10);

          }
          if (objc_msgSend(v8, "category") != 1
            || (objc_msgSend(v8, "url"),
                v22 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v22, "absoluteString"),
                v23 = (void *)objc_claimAutoreleasedReturnValue(),
                v24 = v23 == 0,
                v23,
                v22,
                v24))
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", v10);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "value");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v26);
          }
          else
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", v10);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "url");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "absoluteString");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v27);

          }
        }
LABEL_26:

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v5);
  }

  _ef_log_EDWebContentParser();
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedDictionary:", v4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v40 = v29;
    _os_log_impl(&dword_1D2F2C000, v28, OS_LOG_TYPE_DEFAULT, "Found data detection results: %@", buf, 0xCu);

  }
  return v4;
}

- (id)_getDataDetectionCategoryString:(int)a3
{
  if ((a3 - 1) > 4)
    return 0;
  else
    return off_1E94A37D0[a3 - 1];
}

- (void)_updateContentRuleListsIfNeededForWebViewConfiguration:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDWebContentParser.m"), 582, CFSTR("Current thread must be main"));

  }
  os_unfair_lock_lock(&self->_contentRuleListsLock);
  if (self->_contentRuleListsNeedUpdate)
  {
    v6 = -[NSMutableArray copy](self->_currentContentRuleLists, "copy");
    v7 = (void *)v6;
    v8 = (void *)MEMORY[0x1E0C9AA60];
    if (v6)
      v8 = (void *)v6;
    v9 = v8;

    self->_contentRuleListsNeedUpdate = 0;
    os_unfair_lock_unlock(&self->_contentRuleListsLock);
    objc_msgSend(v5, "userContentController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAllContentRuleLists");
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(v10, "addContentRuleList:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
  else
  {
    os_unfair_lock_unlock(&self->_contentRuleListsLock);
  }

}

- (void)contentRuleListManager:(id)a3 didAddRuleList:(id)a4
{
  os_unfair_lock_s *p_contentRuleListsLock;
  id v6;

  p_contentRuleListsLock = &self->_contentRuleListsLock;
  v6 = a4;
  os_unfair_lock_lock(p_contentRuleListsLock);
  -[NSMutableArray addObject:](self->_currentContentRuleLists, "addObject:", v6);

  self->_contentRuleListsNeedUpdate = 1;
  os_unfair_lock_unlock(p_contentRuleListsLock);
}

- (void)contentRuleListManager:(id)a3 didUpdateContentRuleList:(id)a4 oldContentRuleList:(id)a5
{
  id v7;
  id v8;

  v8 = a4;
  v7 = a5;
  os_unfair_lock_lock(&self->_contentRuleListsLock);
  -[NSMutableArray removeObject:](self->_currentContentRuleLists, "removeObject:", v7);
  -[NSMutableArray addObject:](self->_currentContentRuleLists, "addObject:", v8);
  self->_contentRuleListsNeedUpdate = 1;
  os_unfair_lock_unlock(&self->_contentRuleListsLock);

}

- (void)contentRuleListManager:(id)a3 didRemoveRuleList:(id)a4
{
  os_unfair_lock_s *p_contentRuleListsLock;
  id v6;

  p_contentRuleListsLock = &self->_contentRuleListsLock;
  v6 = a4;
  os_unfair_lock_lock(p_contentRuleListsLock);
  -[NSMutableArray removeObject:](self->_currentContentRuleLists, "removeObject:", v6);

  self->_contentRuleListsNeedUpdate = 1;
  os_unfair_lock_unlock(p_contentRuleListsLock);
}

- (void)_retrieveRichLinkMetadata:(id)a3
{
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  EDRichLinkData *v17;
  void *v18;
  EDRichLinkData *v19;
  EFLocked *state;
  id v21;
  id v23;
  id obj;
  uint64_t v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE buf[24];
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v21;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v39, 16, v21);
  if (v3)
  {
    v25 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("url"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "length"))
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (v7)
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = 0;
            v32 = &v31;
            v33 = 0x2050000000;
            v9 = (void *)getLPLinkMetadataClass_softClass;
            v34 = getLPLinkMetadataClass_softClass;
            if (!getLPLinkMetadataClass_softClass)
            {
              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = __getLPLinkMetadataClass_block_invoke;
              v36 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E94A3798;
              v37 = (void (*)(uint64_t))&v31;
              __getLPLinkMetadataClass_block_invoke((uint64_t)buf);
              v9 = (void *)v32[3];
            }
            v10 = objc_retainAutorelease(v9);
            _Block_object_dispose(&v31, 8);
            v11 = (void *)objc_opt_new();
            objc_msgSend(v11, "setTitle:", v8);
            objc_msgSend(v11, "setOriginalURL:", v7);
            _ef_log_EDWebContentParser();
            v12 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", v8);
              v13 = (id)objc_claimAutoreleasedReturnValue();
              v14 = (void *)MEMORY[0x1E0D1EF48];
              objc_msgSend(v7, "absoluteString");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "partiallyRedactedStringForString:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v13;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v16;
              _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "Found rich link with title: %@ and url: %@", buf, 0x16u);

            }
            v17 = [EDRichLinkData alloc];
            objc_msgSend(v11, "dataRepresentation");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = -[EDRichLinkData initWithTitle:url:data:](v17, "initWithTitle:url:data:", v8, v7, v18);

            objc_msgSend(v23, "addObject:", v19);
          }

        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    }
    while (v3);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v36 = __Block_byref_object_copy__44;
  v37 = __Block_byref_object_dispose__44;
  v38 = 0;
  state = self->_state;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __48__EDWebContentParser__retrieveRichLinkMetadata___block_invoke;
  v26[3] = &unk_1E94A3770;
  v26[4] = buf;
  -[EFLocked performWhileLocked:](state, "performWhileLocked:", v26);
  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "finishWithResult:", v23);
  _Block_object_dispose(buf, 8);

}

void __48__EDWebContentParser__retrieveRichLinkMetadata___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "richLinkPromise");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)logWebBundleMessage:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _ef_log_EDWebContentParser();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "[WebBundle] %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("MetadataMessageHandler"));

  if (v7)
  {
    objc_msgSend(v5, "body");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDWebContentParser _retrieveRichLinkMetadata:](self, "_retrieveRichLinkMetadata:", v8);

  }
  objc_msgSend(v5, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", CFSTR("LogHandler"));

  if (v10)
  {
    _ef_log_EDWebContentParser();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "body");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v12;
      _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v13, 0xCu);

    }
  }

}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (BOOL)isDataDetectionEnabled
{
  return self->_isDataDetectionEnabled;
}

- (void)setIsDataDetectionEnabled:(BOOL)a3
{
  self->_isDataDetectionEnabled = a3;
}

- (EFScheduler)backgroundWorkScheduler
{
  return self->_backgroundWorkScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundWorkScheduler, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_contentRuleListsObservationToken, 0);
  objc_storeStrong((id *)&self->_currentContentRuleLists, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_webContentObserver, 0);
  objc_storeStrong((id *)&self->_webContentObserverInterface, 0);
}

void __45__EDWebContentParser__richLinkMetadataScript__block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a3, (uint64_t)a3, "could not load  FindRichLinkMetadata.js: %{public}@", (uint8_t *)a2);

}

- (void)_extractPlainTextFromHTMLString:(os_log_t)log orWithData:characterEncodingName:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Data from HTML in this message could not be decoded with our UTF8 encoding protocol.", v1, 2u);
}

- (void)_parseHTMLString:(uint64_t)a3 orWithData:characterEncodingName:withOptions:messageID:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a2, a3, "Extracting rich links for message %@ timed out", (uint8_t *)&v3);
}

@end

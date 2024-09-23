@implementation _SFReaderExtractor

- (_SFReaderExtractor)init
{
  _SFReaderExtractor *v2;
  _SFReaderExtractor *v3;
  _SFReaderExtractor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SFReaderExtractor;
  v2 = -[_SFReaderExtractor init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_SFReaderExtractor _setUpReaderController](v2, "_setUpReaderController");
    v4 = v3;
  }

  return v3;
}

- (id)_processPool
{
  WKProcessPool *processPool;
  WKProcessPool *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  WKProcessPool *v9;
  WKProcessPool *v10;

  processPool = self->_processPool;
  if (processPool)
  {
    v3 = processPool;
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CEF6C0]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "builtInPlugInsURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("SafariServices.wkbundle"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInjectedBundleURL:", v8);

    v9 = (WKProcessPool *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF5F8]), "_initWithConfiguration:", v5);
    v10 = self->_processPool;
    self->_processPool = v9;

    v3 = self->_processPool;
  }
  return v3;
}

- (id)_configuration
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0CEF638]);
  -[_SFReaderExtractor _processPool](self, "_processPool");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProcessPool:", v4);

  objc_msgSend(MEMORY[0x1E0CEF650], "safari_nonPersistentDataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWebsiteDataStore:", v5);

  objc_msgSend(v3, "_setClientNavigationsRunAtForegroundPriority:", 1);
  return v3;
}

- (void)_setUpReaderController
{
  id v3;
  void *v4;
  WKWebView *v5;
  WKWebView *webView;
  void *v7;
  _SFReaderController *v8;
  _SFReaderController *readerController;

  v3 = objc_alloc(MEMORY[0x1E0CEF630]);
  -[_SFReaderExtractor _configuration](self, "_configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (WKWebView *)objc_msgSend(v3, "initWithFrame:configuration:", v4, 0.0, 0.0, 1264.0, 760.0);
  webView = self->_webView;
  self->_webView = v5;

  _SFMacSafariUserAgentString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKWebView _setCustomUserAgent:](self->_webView, "_setCustomUserAgent:", v7);

  -[WKWebView setNavigationDelegate:](self->_webView, "setNavigationDelegate:", self);
  -[WKWebView setInspectable:](self->_webView, "setInspectable:", 0);
  v8 = -[_SFReaderController initWithWebView:]([_SFReaderController alloc], "initWithWebView:", self->_webView);
  readerController = self->_readerController;
  self->_readerController = v8;

  -[_SFReaderController setDelegate:](self->_readerController, "setDelegate:", self);
}

- (void)_finishWithContent:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  NSURL *v9;
  id completionHandler;
  NSURL *currentURL;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  _SFReaderExtractedData *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_SFReaderExtractor _invalidateTimers](self, "_invalidateTimers");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8598C40](self->_completionHandler);
  v9 = self->_currentURL;
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  currentURL = self->_currentURL;
  self->_currentURL = 0;

  if (v8)
  {
    if (v7)
    {
      ((void (**)(_QWORD, _QWORD, id))v8)[2](v8, 0, v7);
    }
    else
    {
      if (objc_msgSend(v6, "count"))
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("error"));
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v12)
        {
          v20[0] = CFSTR("error");
          v20[1] = CFSTR("stack");
          v21[0] = v12;
          objc_msgSend(v6, "objectForKeyedSubscript:");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = (void *)v14;
          v16 = CFSTR("No stack trace");
          if (v14)
            v16 = (const __CFString *)v14;
          v21[1] = v16;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
          v17 = (_SFReaderExtractedData *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.safariservices.readerExtractorErrorDomain"), 2, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v18);

          v19 = WBS_LOG_CHANNEL_PREFIXReaderExtraction();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
            -[_SFReaderExtractor _finishWithContent:error:].cold.1((uint64_t)v9, (uint64_t)v13, v19);
        }
        else
        {
          v17 = -[_SFReaderExtractedData initWithReaderContent:url:]([_SFReaderExtractedData alloc], "initWithReaderContent:url:", v6, v9);
          ((void (**)(_QWORD, _SFReaderExtractedData *, _QWORD))v8)[2](v8, v17, 0);
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.safariservices.readerExtractorErrorDomain"), 1, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v13);
      }

    }
  }

}

- (void)_invalidateTimers
{
  NSTimer *loadingTimeoutTimer;
  NSTimer *v4;
  NSTimer *readerExtractionTimer;
  NSTimer *v6;

  loadingTimeoutTimer = self->_loadingTimeoutTimer;
  if (loadingTimeoutTimer)
  {
    -[NSTimer invalidate](loadingTimeoutTimer, "invalidate");
    v4 = self->_loadingTimeoutTimer;
    self->_loadingTimeoutTimer = 0;

  }
  readerExtractionTimer = self->_readerExtractionTimer;
  if (readerExtractionTimer)
  {
    -[NSTimer invalidate](readerExtractionTimer, "invalidate");
    v6 = self->_readerExtractionTimer;
    self->_readerExtractionTimer = 0;

  }
}

- (void)_scheduleLoadingTimeout
{
  void *v3;
  NSTimer *v4;
  NSTimer *loadingTimeoutTimer;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0C99E88];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45___SFReaderExtractor__scheduleLoadingTimeout__block_invoke;
  v6[3] = &unk_1E4AC1450;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, v6, 30.0);
  v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  loadingTimeoutTimer = self->_loadingTimeoutTimer;
  self->_loadingTimeoutTimer = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_scheduleReaderDataExtractionTimeout
{
  void *v3;
  NSTimer *v4;
  NSTimer *readerExtractionTimer;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0C99E88];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58___SFReaderExtractor__scheduleReaderDataExtractionTimeout__block_invoke;
  v6[3] = &unk_1E4AC1450;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, v6, 10.0);
  v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  readerExtractionTimer = self->_readerExtractionTimer;
  self->_readerExtractionTimer = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)getExtractedDataForURL:(id)a3 withCompletion:(id)a4
{
  void *v7;
  id completionHandler;
  WKWebView *webView;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  v7 = (void *)MEMORY[0x1A8598C40](a4);
  completionHandler = self->_completionHandler;
  self->_completionHandler = v7;

  objc_storeStrong((id *)&self->_currentURL, a3);
  webView = self->_webView;
  objc_msgSend(MEMORY[0x1E0C92C80], "safari_nonAppInitiatedRequestWithURL:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WKWebView loadRequest:](webView, "loadRequest:", v10);

  -[_SFReaderExtractor _scheduleLoadingTimeout](self, "_scheduleLoadingTimeout");
}

- (void)getExtractedDataForURL:(id)a3 withData:(id)a4 withCompletion:(id)a5
{
  id v9;
  void *v10;
  id completionHandler;
  id v12;
  id v13;

  v13 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1A8598C40](a5);
  completionHandler = self->_completionHandler;
  self->_completionHandler = v10;

  objc_storeStrong((id *)&self->_currentURL, a3);
  v12 = -[WKWebView loadData:MIMEType:characterEncodingName:baseURL:](self->_webView, "loadData:MIMEType:characterEncodingName:baseURL:", v9, CFSTR("text/html"), CFSTR("UTF-8"), self->_currentURL);

}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  NSObject *v5;
  uint8_t v6[16];

  -[_SFReaderExtractor _invalidateTimers](self, "_invalidateTimers", a3, a4);
  v5 = WBS_LOG_CHANNEL_PREFIXReaderExtraction();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A3B2D000, v5, OS_LOG_TYPE_DEFAULT, "Collecting article content after finishing navigation", v6, 2u);
  }
  -[_SFReaderController collectArticleContent](self->_readerController, "collectArticleContent");
  -[_SFReaderExtractor _scheduleReaderDataExtractionTimeout](self, "_scheduleReaderDataExtractionTimeout");
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v6;
  NSObject *v7;

  v6 = a5;
  v7 = WBS_LOG_CHANNEL_PREFIXReaderExtraction();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[_SFReaderExtractor webView:didFailProvisionalNavigation:withError:].cold.1(v7, v6);
  -[_SFReaderExtractor _finishWithContent:error:](self, "_finishWithContent:error:", 0, v6);

}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  v7 = objc_msgSend(v6, "code");
  v8 = WBS_LOG_CHANNEL_PREFIXReaderExtraction();
  v9 = v8;
  if (v7 == -999)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_1A3B2D000, v10, OS_LOG_TYPE_DEFAULT, "Failed navigation but ignoring error: %{public}@", (uint8_t *)&v12, 0xCu);

    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_SFReaderExtractor webView:didFailNavigation:withError:].cold.1(v9, v6);
    -[_SFReaderExtractor _finishWithContent:error:](self, "_finishWithContent:error:", 0, v6);
  }

}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;
  void (**v11)(id, _BOOL8);

  v11 = (void (**)(id, _BOOL8))a5;
  v7 = a4;
  objc_msgSend(v7, "response");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v8) = objc_msgSend(v7, "isForMainFrame");
  v10 = (v8 & 1) != 0
     || !objc_msgSend(v9, "safari_isHTTPFamilyURL")
     || objc_msgSend(v9, "safari_hasSameOriginAsURL:", self->_currentURL);
  v11[2](v11, v10);

}

- (void)webViewWebContentProcessDidTerminate:(id)a3
{
  NSObject *v4;
  void *v5;

  v4 = WBS_LOG_CHANNEL_PREFIXReaderExtraction();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[_SFReaderExtractor webViewWebContentProcessDidTerminate:].cold.1(v4);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.safariservices.readerExtractorErrorDomain"), 3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFReaderExtractor _finishWithContent:error:](self, "_finishWithContent:error:", 0, v5);

}

- (void)readerController:(id)a3 didCollectArticleContent:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = WBS_LOG_CHANNEL_PREFIXReaderExtraction();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138739971;
    v8 = v5;
    _os_log_impl(&dword_1A3B2D000, v6, OS_LOG_TYPE_DEFAULT, "Did collect article content: %{sensitive}@", (uint8_t *)&v7, 0xCu);
  }
  -[_SFReaderExtractor _finishWithContent:error:](self, "_finishWithContent:error:", v5, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_readerExtractionTimer, 0);
  objc_storeStrong((id *)&self->_loadingTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_readerController, 0);
  objc_storeStrong((id *)&self->_currentURL, 0);
  objc_storeStrong((id *)&self->_processPool, 0);
  objc_storeStrong((id *)&self->_readerWebView, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

- (void)_finishWithContent:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138740227;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_fault_impl(&dword_1A3B2D000, log, OS_LOG_TYPE_FAULT, "Encountered error on %{sensitive}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)webView:(void *)a1 didFailProvisionalNavigation:(void *)a2 withError:.cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v5, v6, "Failed provisional navigation: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_6();
}

- (void)webView:(void *)a1 didFailNavigation:(void *)a2 withError:.cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v5, v6, "Failed navigation: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_6();
}

- (void)webViewWebContentProcessDidTerminate:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3B2D000, log, OS_LOG_TYPE_ERROR, "Web content process crashed", v1, 2u);
}

@end

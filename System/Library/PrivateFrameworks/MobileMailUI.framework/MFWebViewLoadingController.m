@implementation MFWebViewLoadingController

- (MFWebViewLoadingController)init
{
  MFWebViewLoadingController *v2;
  MFWebViewLoadingController *v3;
  void *v4;
  uint64_t v5;
  WKWebView *webView;
  MFWebViewDictionary *v7;
  MFWebViewDictionary *webViewConstants;
  void *v9;
  void *v10;
  uint64_t v11;
  _WKRemoteObjectInterface *remoteObjectInterface;
  _WKRemoteObjectInterface *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MFWebViewLoadingController;
  v2 = -[MFWebViewLoadingController init](&v18, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_webProcessPluginNeedsUpdate = 1;
    +[MFWKWebViewFactory sharedWebViewFactory](MFWKWebViewFactory, "sharedWebViewFactory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "webView");
    v5 = objc_claimAutoreleasedReturnValue();
    webView = v3->_webView;
    v3->_webView = (WKWebView *)v5;

    v7 = objc_alloc_init(MFWebViewDictionary);
    webViewConstants = v3->_webViewConstants;
    v3->_webViewConstants = v7;

    objc_msgSend(MEMORY[0x1E0CB38E8], "ec_attributionExpression");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pattern");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFWebViewDictionary setObject:forKeyedSubscript:](v3->_webViewConstants, "setObject:forKeyedSubscript:", v10, CFSTR("outdentedAttributionsPattern"));

    objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EFF67B38);
    v11 = objc_claimAutoreleasedReturnValue();
    remoteObjectInterface = v3->_remoteObjectInterface;
    v3->_remoteObjectInterface = (_WKRemoteObjectInterface *)v11;

    v13 = v3->_remoteObjectInterface;
    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WKRemoteObjectInterface setClasses:forSelector:argumentIndex:ofReply:](v13, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_webProcessDidFinishDocumentLoadForURL_andRequestedRemoteURLs_, 1, 0);

    -[MFWebViewLoadingController _reconveneWebProcessBundle](v3, "_reconveneWebProcessBundle");
  }
  return v3;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_webProcessDelegate);
  -[MFWebViewLoadingController _unregisterWebProcessDelegate:](self, "_unregisterWebProcessDelegate:", WeakRetained);

  v4.receiver = self;
  v4.super_class = (Class)MFWebViewLoadingController;
  -[MFWebViewLoadingController dealloc](&v4, sel_dealloc);
}

- (void)_unregisterWebProcessDelegate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (v10)
  {
    -[MFWebViewLoadingController webView](self, "webView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_remoteObjectRegistry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4D610], "weakProxyForObject:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFWebViewLoadingController remoteObjectInterface](self, "remoteObjectInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unregisterExportedObject:interface:", v6, v7);

    +[MFWKWebViewFactory sharedWebViewFactory](MFWKWebViewFactory, "sharedWebViewFactory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "urlSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "unregisterObserver:", self);
  }

}

- (void)_registerWebProcessDelegate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (v10)
  {
    -[MFWebViewLoadingController webView](self, "webView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_remoteObjectRegistry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4D610], "weakProxyForObject:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFWebViewLoadingController remoteObjectInterface](self, "remoteObjectInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerExportedObject:interface:", v6, v7);

    +[MFWKWebViewFactory sharedWebViewFactory](MFWKWebViewFactory, "sharedWebViewFactory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "urlSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "registerObserver:", self);
  }

}

- (void)setWebProcessDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webProcessDelegate);
  if (WeakRetained != obj)
  {
    -[MFWebViewLoadingController _unregisterWebProcessDelegate:](self, "_unregisterWebProcessDelegate:", WeakRetained);
    objc_storeWeak((id *)&self->_webProcessDelegate, obj);
    -[MFWebViewLoadingController _registerWebProcessDelegate:](self, "_registerWebProcessDelegate:", obj);
  }

}

- (void)setLoadingURL:(id)a3
{
  NSURL *v4;
  EMContentRepresentation *contentRepresentation;
  NSError *error;
  NSURL *loadingURL;

  v4 = (NSURL *)a3;
  contentRepresentation = self->_contentRepresentation;
  self->_contentRepresentation = 0;

  error = self->_error;
  self->_error = 0;

  loadingURL = self->_loadingURL;
  self->_loadingURL = v4;

}

- (void)setContentRepresentation:(id)a3
{
  EMContentRepresentation *v4;
  NSURL *loadingURL;
  NSError *error;
  EMContentRepresentation *contentRepresentation;

  v4 = (EMContentRepresentation *)a3;
  loadingURL = self->_loadingURL;
  self->_loadingURL = 0;

  error = self->_error;
  self->_error = 0;

  contentRepresentation = self->_contentRepresentation;
  self->_contentRepresentation = v4;

}

- (void)slapWebView
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  objc_class *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  MFWebViewLoadingController *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  EMLogCategoryMessageLoading();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFWebViewLoadingController webView](self, "webView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v9;
    v13 = 2048;
    v14 = self;
    v15 = 2112;
    v16 = v10;
    _os_log_error_impl(&dword_1D56AF000, v3, OS_LOG_TYPE_ERROR, "<%{public}@: %p>: Killing and resetting webview: %@", (uint8_t *)&v11, 0x20u);

  }
  -[MFWebViewLoadingController webView](self, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_killWebContentProcessAndResetState");

  -[MFWebViewLoadingController contentRepresentation](self, "contentRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_6:
    -[MFWebViewLoadingController _doIssueLoadRequest](self, "_doIssueLoadRequest");
    return;
  }
  -[MFWebViewLoadingController loadingURL](self, "loadingURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  if (!v7)
    goto LABEL_6;
  -[MFWebViewLoadingController reload](self, "reload");
}

- (void)reload
{
  NSObject *v3;
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  MFWebViewLoadingController *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  EMLogCategoryMessageLoading();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFWebViewLoadingController webView](self, "webView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v7;
    v11 = 2048;
    v12 = self;
    v13 = 2112;
    v14 = v8;
    _os_log_debug_impl(&dword_1D56AF000, v3, OS_LOG_TYPE_DEBUG, "<%{public}@: %p>: Sending request to reload webview: %@", (uint8_t *)&v9, 0x20u);

  }
  -[MFWebViewLoadingController webView](self, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "reload");

}

- (void)stopLoading
{
  NSObject *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  MFWebViewLoadingController *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  EMLogCategoryMessageLoading();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFWebViewLoadingController webView](self, "webView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v6;
    v10 = 2048;
    v11 = self;
    v12 = 2112;
    v13 = v7;
    _os_log_debug_impl(&dword_1D56AF000, v3, OS_LOG_TYPE_DEBUG, "<%{public}@: %p>: Sending request to stop loading webview: %@", (uint8_t *)&v8, 0x20u);

  }
  -[MFWebViewLoadingController webView](self, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopLoading");

}

- (void)_doIssueLoadRequest
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  objc_class *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  MFWebViewLoadingController *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[MFWebViewLoadingController contentRepresentation](self, "contentRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFWebViewLoadingController error](self, "error");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
  {
    objc_msgSend(v3, "contentURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    EMLogCategoryMessageLoading();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "ef_publicDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543874;
      v25 = v9;
      v26 = 2048;
      v27 = self;
      v28 = 2114;
      v29 = v10;
      _os_log_impl(&dword_1D56AF000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: Sending request to load webview with content representation: %{public}@", (uint8_t *)&v24, 0x20u);

    }
    -[MFWebViewLoadingController webView](self, "webView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "loadFileURL:allowingReadAccessToURL:", v6, v6);
LABEL_5:

    goto LABEL_10;
  }
  if (!v4)
  {
    EMLogCategoryMessageLoading();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFWebViewLoadingController loadingURL](self, "loadingURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543874;
      v25 = v16;
      v26 = 2048;
      v27 = self;
      v28 = 2112;
      v29 = v17;
      _os_log_impl(&dword_1D56AF000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>: Sending request to load webview with loading URL: %@", (uint8_t *)&v24, 0x20u);

    }
    -[MFWebViewLoadingController webView](self, "webView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CB39E0];
    -[MFWebViewLoadingController loadingURL](self, "loadingURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "requestWithURL:cachePolicy:timeoutInterval:", v11, 0, 60.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend(v6, "loadRequest:", v19);

    goto LABEL_5;
  }
  EMLogCategoryMessageLoading();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ef_publicDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543874;
    v25 = v22;
    v26 = 2048;
    v27 = self;
    v28 = 2114;
    v29 = v23;
    _os_log_error_impl(&dword_1D56AF000, v13, OS_LOG_TYPE_ERROR, "<%{public}@: %p>: Sending request to load webview with error: %{public}@", (uint8_t *)&v24, 0x20u);

  }
  -[MFWebViewLoadingController requestWebViewLoadWithError:](self, "requestWebViewLoadWithError:", v5);
LABEL_10:

}

- (void)requestWebViewLoadWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
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
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[MFMessageContentURLProtocol URLForLoadingContext:](MFMessageContentURLProtocol, "URLForLoadingContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isInternal");

  if (v7)
  {
    objc_msgSend(v4, "message");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v5, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subjectString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB39D8];
    objc_msgSend(v8, "messageID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "queryItemWithName:value:", CFSTR("message-id"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v13;
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("subject"), v25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v14;
    v15 = (void *)MEMORY[0x1E0CB39D8];
    -[WKWebView _webProcessIdentifier](self->_webView, "_webProcessIdentifier");
    EFStringWithInt64();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "queryItemWithName:value:", CFSTR("pid"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setQueryItems:", v18);

    objc_msgSend(v26, "URL");
    v19 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "messageID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("(%@) %@"), v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFWebViewLoadingController webView](self, "webView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_setRemoteInspectionNameOverride:", v23);

    v5 = (void *)v19;
  }
  -[MFWebViewLoadingController setLoadingURL:](self, "setLoadingURL:", v5);
  -[MFWebViewLoadingController _doIssueLoadRequest](self, "_doIssueLoadRequest");

}

- (void)requestWebViewLoadWithoutShowingMessageWithContext:(id)a3
{
  void *v4;
  id v5;
  id v6;

  +[MFMessageContentURLProtocol URLForLoadingContext:](MFMessageContentURLProtocol, "URLForLoadingContext:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MFWebViewLoadingController setLoadingURL:](self, "setLoadingURL:");
  -[MFWebViewLoadingController webView](self, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "loadHTMLString:baseURL:", &stru_1E9A04480, v6);

}

- (void)requestWebViewLoadWithoutShowingMessageWithRepresentation:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(a3, "contentURL");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MFWebViewLoadingController setLoadingURL:](self, "setLoadingURL:");
  -[MFWebViewLoadingController webView](self, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "loadHTMLString:baseURL:", &stru_1E9A04480, v6);

}

- (void)requestWebViewLoadWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  -[MFWebViewLoadingController setError:](self, "setError:");
  v4 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v4, "setScheme:", CFSTR("x-apple-msg-load-wk2"));
  objc_msgSend(v10, "mf_messageFragment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFWebViewLoadingController webView](self, "webView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markupString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v6, "loadHTMLString:baseURL:", v7, v8);

}

- (void)requestWebViewLoadWithContentRepresentation:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInternal");

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[WKWebView _webProcessIdentifier](self->_webView, "_webProcessIdentifier");
    EFStringWithInt64();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contentItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("(%@) %@"), v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFWebViewLoadingController webView](self, "webView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setRemoteInspectionNameOverride:", v10);

  }
  -[MFWebViewLoadingController setContentRepresentation:](self, "setContentRepresentation:", v12);
  objc_msgSend(MEMORY[0x1E0CC68D8], "registerContentRepresentation:", v12);
  -[MFWebViewLoadingController _doIssueLoadRequest](self, "_doIssueLoadRequest");

}

- (void)_reconveneWebProcessBundle
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1D56AF000, log, OS_LOG_TYPE_DEBUG, "<%{public}@: %p>: updatingWebProcessPlugin", buf, 0x16u);

}

- (void)remoteContentURLSession:(id)a3 failedToProxyURL:(id)a4 failureReason:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  int64_t v12;

  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__MFWebViewLoadingController_remoteContentURLSession_failedToProxyURL_failureReason___block_invoke;
  v10[3] = &unk_1E9A03DC8;
  v10[4] = self;
  v8 = v7;
  v11 = v8;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performSyncBlock:", v10);

}

void __85__MFWebViewLoadingController_remoteContentURLSession_failedToProxyURL_failureReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "webProcessDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "webProcessFailedToLoadResourceWithProxyForURL:failureReason:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (MFWebViewDictionary)webViewConstants
{
  return self->_webViewConstants;
}

- (MFMailWebProcessDelegate)webProcessDelegate
{
  return (MFMailWebProcessDelegate *)objc_loadWeakRetained((id *)&self->_webProcessDelegate);
}

- (_WKRemoteObjectInterface)remoteObjectInterface
{
  return self->_remoteObjectInterface;
}

- (void)setRemoteObjectInterface:(id)a3
{
  objc_storeStrong((id *)&self->_remoteObjectInterface, a3);
}

- (EMContentRepresentation)contentRepresentation
{
  return self->_contentRepresentation;
}

- (NSURL)loadingURL
{
  return self->_loadingURL;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)webProcessPluginNeedsUpdate
{
  return self->_webProcessPluginNeedsUpdate;
}

- (void)setWebProcessPluginNeedsUpdate:(BOOL)a3
{
  self->_webProcessPluginNeedsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_loadingURL, 0);
  objc_storeStrong((id *)&self->_contentRepresentation, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_destroyWeak((id *)&self->_webProcessDelegate);
  objc_storeStrong((id *)&self->_webViewConstants, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

@end

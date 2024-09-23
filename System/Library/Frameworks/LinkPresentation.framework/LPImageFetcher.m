@implementation LPImageFetcher

+ (id)imageFetcherForConfiguration:(id)a3
{
  id v3;
  int v4;
  __objc2_class **v5;
  id v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "fetchIsNotUserInitiated");
  v5 = off_1E44A6130;
  if (!v4)
    v5 = off_1E44A61F8;
  v6 = objc_alloc_init(*v5);

  return v6;
}

- (void)fetchWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSURL *URL;
  void *v11;
  void *v12;
  id completionHandler;
  NSObject *v14;
  void *v15;
  void *v16;
  WKWebView *v17;
  NSObject *v18;
  id v19;
  id v20;
  WKWebView *v21;
  WKWebView *webView;
  void *v23;
  _QWORD v24[4];
  id v25;
  id location;
  _BYTE v27[16];
  _BYTE v28[8];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "rootEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "childWithType:subtitle:", 2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPFetcher set_event:](self, "set_event:", v9);

  URL = self->_URL;
  -[LPFetcher _event](self, "_event");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setURL:", URL);

  v12 = _Block_copy(v7);
  completionHandler = self->_completionHandler;
  self->_completionHandler = v12;

  v14 = (id)LPLogChannelFetching();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[LPImageFetcher fetchWithConfiguration:completionHandler:].cold.2((uint64_t)v28, -[LPFetcher _loggingID](self, "_loggingID"));

  -[LPImageFetcher URL](self, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_lp_requestWithAttribution:", objc_msgSend(v6, "loadingIsNonAppInitiated"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "webViewForProcessSharing");
  v17 = (WKWebView *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v18 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[LPImageFetcher fetchWithConfiguration:completionHandler:].cold.1((uint64_t)v27, -[LPFetcher _loggingID](self, "_loggingID"));

    v19 = objc_alloc(MEMORY[0x1E0CEF630]);
    v20 = +[LPMetadataProvider _copyDefaultWebViewConfiguration](LPMetadataProvider, "_copyDefaultWebViewConfiguration");
    v21 = (WKWebView *)objc_msgSend(v19, "initWithFrame:configuration:", v20, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    webView = self->_webView;
    self->_webView = v21;

    +[LPMetadataProvider _defaultUserAgent](LPMetadataProvider, "_defaultUserAgent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWebView setCustomUserAgent:](self->_webView, "setCustomUserAgent:", v23);

    v17 = self->_webView;
  }
  objc_initWeak(&location, self);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __59__LPImageFetcher_fetchWithConfiguration_completionHandler___block_invoke;
  v24[3] = &unk_1E44A9A40;
  objc_copyWeak(&v25, &location);
  -[WKWebView _loadAndDecodeImage:constrainedToSize:maximumBytesFromNetwork:completionHandler:](v17, "_loadAndDecodeImage:constrainedToSize:maximumBytesFromNetwork:completionHandler:", v16, 10485760, v24, 1024.0, 1024.0);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

void __59__LPImageFetcher_fetchWithConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      v9 = (id)LPLogChannelFetching();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = objc_msgSend(v8, "_loggingID");
        objc_msgSend(v6, "domain");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = 67109891;
        v12[1] = v10;
        v13 = 2112;
        v14 = v11;
        v15 = 2048;
        v16 = objc_msgSend(v6, "code");
        v17 = 2117;
        v18 = v6;
        _os_log_error_impl(&dword_1A0C41000, v9, OS_LOG_TYPE_ERROR, "LPImageFetcher<%d>: subresource load completed with error: Domain=%@ Code=%ld Error=%{sensitive}@", (uint8_t *)v12, 0x26u);

      }
      objc_msgSend(v8, "_failedWithErrorCode:underlyingError:", 2, v6);
    }
    else
    {
      objc_msgSend(WeakRetained, "_completedWithImage:error:", v5, 0);
    }
  }

}

- (void)cancel
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1(a1, a2, 1.5047e-36);
  OUTLINED_FUNCTION_0_4(&dword_1A0C41000, v2, v3, "LPImageFetcher<%d>: cancelling subresource load explicitly", v4);
}

- (void)_failedWithErrorCode:(int64_t)a3 underlyingError:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  _DWORD v11[2];
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_completionHandler)
  {
    if (a3 != 3)
    {
      v7 = (id)LPLogChannelFetching();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v9 = -[LPFetcher _loggingID](self, "_loggingID");
        objc_msgSend(v6, "domain");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = 67109891;
        v11[1] = v9;
        v12 = 2112;
        v13 = v10;
        v14 = 2048;
        v15 = objc_msgSend(v6, "code");
        v16 = 2117;
        v17 = v6;
        _os_log_error_impl(&dword_1A0C41000, v7, OS_LOG_TYPE_ERROR, "LPImageFetcher<%d>: failed subresource load: Domain=%@ Code=%ld Error=%{sensitive}@", (uint8_t *)v11, 0x26u);

      }
    }
    makeLPError(a3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPImageFetcher _completedWithImage:error:](self, "_completedWithImage:error:", 0, v8);

  }
}

- (void)_completedWithImage:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id completionHandler;
  void (**v9)(void *, LPFetcherErrorResponse *);
  id v10;
  NSObject *v11;
  objc_class *v12;
  LPFetcherErrorResponse *v13;
  WKWebView *webView;
  void *v15;
  _QWORD block[5];
  _QWORD v17[5];
  WKWebView *v18;
  _BYTE v19[8];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    v9 = (void (**)(void *, LPFetcherErrorResponse *))_Block_copy(completionHandler);
    v10 = self->_completionHandler;
    self->_completionHandler = 0;

    if (!v6)
      goto LABEL_8;
    v11 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[LPImageFetcher _completedWithImage:error:].cold.1((uint64_t)v19, -[LPFetcher _loggingID](self, "_loggingID"));

    v12 = -[LPFetcher responseClass](self, "responseClass");
    if (!v12)
      v12 = (objc_class *)objc_opt_class();
    -[objc_class responseForFetcher:withImage:](v12, "responseForFetcher:withImage:", self, v6);
    v13 = (LPFetcherErrorResponse *)objc_claimAutoreleasedReturnValue();
    if (!v13)
LABEL_8:
      v13 = -[LPFetcherErrorResponse initWithError:fetcher:]([LPFetcherErrorResponse alloc], "initWithError:fetcher:", v7, self);
    -[WKWebView _close](self->_webView, "_close");
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__5;
    v17[4] = __Block_byref_object_dispose__5;
    v18 = self->_webView;
    webView = self->_webView;
    self->_webView = 0;

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__LPImageFetcher__completedWithImage_error___block_invoke;
    block[3] = &unk_1E44A7DB0;
    block[4] = v17;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    -[LPFetcher _event](self, "_event");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "didCompleteWithErrorCode:", objc_msgSend(v7, "code"));

    v9[2](v9, v13);
    _Block_object_dispose(v17, 8);

  }
}

void __44__LPImageFetcher__completedWithImage_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)fetchWithConfiguration:(uint64_t)a1 completionHandler:(int)a2 .cold.1(uint64_t a1, int a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1(a1, a2, 1.5047e-36);
  OUTLINED_FUNCTION_0_4(&dword_1A0C41000, v2, v3, "LPImageFetcher<%d>: allocating fallback web view, did not have webViewForProcessSharing", v4);
}

- (void)fetchWithConfiguration:(uint64_t)a1 completionHandler:(int)a2 .cold.2(uint64_t a1, int a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1(a1, a2, 1.5047e-36);
  OUTLINED_FUNCTION_0_4(&dword_1A0C41000, v2, v3, "LPImageFetcher<%d>: starting subresource load", v4);
}

- (void)_completedWithImage:(uint64_t)a1 error:(int)a2 .cold.1(uint64_t a1, int a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1(a1, a2, 1.5047e-36);
  OUTLINED_FUNCTION_0_4(&dword_1A0C41000, v2, v3, "LPImageFetcher<%d>: successfully finished load", v4);
}

@end

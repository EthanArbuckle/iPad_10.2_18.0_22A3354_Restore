@implementation LPRawURLContentsFetcher

- (void)fetchWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  LPFetcherErrorResponse *v8;
  void *v9;
  LPFetcherErrorResponse *v10;
  void *v11;
  void *v12;
  NSURL *URL;
  void *v14;
  void *v15;
  id completionHandler;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  WKWebView *v21;
  NSObject *v22;
  id v23;
  id v24;
  WKWebView *v25;
  WKWebView *webView;
  void *v27;
  _QWORD v28[5];
  char v29[16];
  char v30[16];
  char v31[8];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (objc_msgSend(v6, "fetchIsNotUserInitiated"))
  {
    v8 = [LPFetcherErrorResponse alloc];
    makeLPError(5, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[LPFetcherErrorResponse initWithError:fetcher:](v8, "initWithError:fetcher:", v9, self);
    v7[2](v7, v10);

  }
  else
  {
    objc_msgSend(v6, "rootEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "childWithType:subtitle:", 2, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPFetcher set_event:](self, "set_event:", v12);

    URL = self->_URL;
    -[LPFetcher _event](self, "_event");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setURL:", URL);

    v15 = _Block_copy(v7);
    completionHandler = self->_completionHandler;
    self->_completionHandler = v15;

    v17 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[LPRawURLContentsFetcher fetchWithConfiguration:completionHandler:].cold.3((uint64_t)v31, -[LPFetcher _loggingID](self, "_loggingID"));

    -[LPRawURLContentsFetcher URL](self, "URL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_lp_requestWithAttribution:", objc_msgSend(v6, "loadingIsNonAppInitiated"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[LPRawURLContentsFetcher fetchWithConfiguration:completionHandler:].cold.2((uint64_t)v30, -[LPFetcher _loggingID](self, "_loggingID"));

    objc_msgSend(v6, "webViewForProcessSharing");
    v21 = (WKWebView *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      v22 = (id)LPLogChannelFetching();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[LPRawURLContentsFetcher fetchWithConfiguration:completionHandler:].cold.1((uint64_t)v29, -[LPFetcher _loggingID](self, "_loggingID"));

      v23 = objc_alloc(MEMORY[0x1E0CEF630]);
      v24 = +[LPMetadataProvider _copyDefaultWebViewConfiguration](LPMetadataProvider, "_copyDefaultWebViewConfiguration");
      v25 = (WKWebView *)objc_msgSend(v23, "initWithFrame:configuration:", v24, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      webView = self->_webView;
      self->_webView = v25;

      +[LPMetadataProvider _defaultUserAgent](LPMetadataProvider, "_defaultUserAgent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[WKWebView setCustomUserAgent:](self->_webView, "setCustomUserAgent:", v27);

      v21 = self->_webView;
    }
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __68__LPRawURLContentsFetcher_fetchWithConfiguration_completionHandler___block_invoke;
    v28[3] = &unk_1E44A9E10;
    v28[4] = self;
    -[WKWebView _dataTaskWithRequest:runAtForegroundPriority:completionHandler:](v21, "_dataTaskWithRequest:runAtForegroundPriority:completionHandler:", v19, 1, v28);

  }
}

uint64_t __68__LPRawURLContentsFetcher_fetchWithConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)dataTask:(id)a3 didReceiveResponse:(id)a4 decisionHandler:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD);
  id v9;
  NSObject *v10;
  Class v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  void *v17;
  NSMutableData *v18;
  NSMutableData *data;
  NSString *v20;
  NSString *MIMEType;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(id, _QWORD))a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
    if (objc_msgSend(MEMORY[0x1E0C92C18], "isErrorStatusCode:", objc_msgSend(v9, "statusCode")))
    {
      v10 = (id)LPLogChannelFetching();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[LPRawURLContentsFetcher dataTask:didReceiveResponse:decisionHandler:].cold.1((uint64_t)v22, -[LPFetcher _loggingID](self, "_loggingID"), objc_msgSend(v9, "statusCode"));

      v8[2](v8, 0);
      -[LPRawURLContentsFetcher _failedWithErrorCode:underlyingError:](self, "_failedWithErrorCode:underlyingError:", 2, 0);

      goto LABEL_19;
    }

  }
  v11 = -[LPFetcher responseClass](self, "responseClass");
  objc_msgSend(v7, "MIMEType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = -[objc_class isValidMIMEType:](v11, "isValidMIMEType:", v12);

  if ((v11 & 1) != 0)
  {
    v13 = objc_msgSend(v7, "expectedContentLength");
    if (v13 == -1)
      v14 = 0;
    else
      v14 = v13;
    if (v14 <= 10485760)
    {
      v18 = (NSMutableData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v14);
      data = self->_data;
      self->_data = v18;

      objc_msgSend(v7, "MIMEType");
      v20 = (NSString *)objc_claimAutoreleasedReturnValue();
      MIMEType = self->_MIMEType;
      self->_MIMEType = v20;

      v8[2](v8, 1);
      goto LABEL_19;
    }
    v15 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[LPRawURLContentsFetcher dataTask:didReceiveResponse:decisionHandler:].cold.2((uint64_t)v22, -[LPFetcher _loggingID](self, "_loggingID"), objc_msgSend(v7, "expectedContentLength"));
  }
  else
  {
    v15 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = -[LPFetcher _loggingID](self, "_loggingID");
      objc_msgSend(v7, "MIMEType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPRawURLContentsFetcher dataTask:didReceiveResponse:decisionHandler:].cold.3(v17, (uint64_t)v22, v16, v15);
    }
  }

  v8[2](v8, 0);
  -[LPRawURLContentsFetcher _failedWithErrorCode:underlyingError:](self, "_failedWithErrorCode:underlyingError:", 2, 0);
LABEL_19:

}

- (void)dataTask:(id)a3 didReceiveData:(id)a4
{
  id v6;
  id v7;
  NSUInteger v8;
  unint64_t v9;
  NSObject *v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[NSMutableData length](self->_data, "length");
  v9 = objc_msgSend(v7, "length") + v8;
  if (v9 <= 0xA00000)
  {
    -[NSMutableData appendData:](self->_data, "appendData:", v7);
  }
  else
  {
    v10 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[LPRawURLContentsFetcher dataTask:didReceiveData:].cold.1((uint64_t)v11, -[LPFetcher _loggingID](self, "_loggingID"), v9);

    objc_msgSend(v6, "cancel");
    -[LPRawURLContentsFetcher _failedWithErrorCode:underlyingError:](self, "_failedWithErrorCode:underlyingError:", 2, 0);
  }

}

- (void)dataTask:(id)a3 didCompleteWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
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
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = -[LPFetcher _loggingID](self, "_loggingID");
      objc_msgSend(v7, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = 67109891;
      v11[1] = v9;
      v12 = 2112;
      v13 = v10;
      v14 = 2048;
      v15 = objc_msgSend(v7, "code");
      v16 = 2117;
      v17 = v7;
      _os_log_error_impl(&dword_1A0C41000, v8, OS_LOG_TYPE_ERROR, "LPRawURLContentsFetcher<%d>: subresource load completed with error: Domain=%@ Code=%ld Error=%{sensitive}@", (uint8_t *)v11, 0x26u);

    }
    -[LPRawURLContentsFetcher _failedWithErrorCode:underlyingError:](self, "_failedWithErrorCode:underlyingError:", 2, v7);
  }
  else
  {
    -[LPRawURLContentsFetcher _completedWithData:MIMEType:error:](self, "_completedWithData:MIMEType:error:", self->_data, self->_MIMEType, 0);
  }

}

- (void)cancel
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1(a1, a2, 1.5047e-36);
  OUTLINED_FUNCTION_0_4(&dword_1A0C41000, v2, v3, "LPRawURLContentsFetcher<%d>: cancelling subresource load explicitly", v4);
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
        _os_log_error_impl(&dword_1A0C41000, v7, OS_LOG_TYPE_ERROR, "LPRawURLContentsFetcher<%d>: failed subresource load: Domain=%@ Code=%ld Error=%{sensitive}@", (uint8_t *)v11, 0x26u);

      }
    }
    makeLPError(a3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPRawURLContentsFetcher _completedWithData:MIMEType:error:](self, "_completedWithData:MIMEType:error:", 0, 0, v8);

  }
}

- (void)_completedWithData:(id)a3 MIMEType:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id completionHandler;
  void (**v12)(void *, LPFetcherErrorResponse *);
  id v13;
  NSObject *v14;
  LPFetcherErrorResponse *v15;
  WKWebView *webView;
  void *v17;
  _QWORD block[5];
  _QWORD v19[5];
  WKWebView *v20;
  _BYTE v21[8];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    v12 = (void (**)(void *, LPFetcherErrorResponse *))_Block_copy(completionHandler);
    v13 = self->_completionHandler;
    self->_completionHandler = 0;

    if (!v8)
      goto LABEL_6;
    v14 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[LPRawURLContentsFetcher _completedWithData:MIMEType:error:].cold.1((uint64_t)v21, -[LPFetcher _loggingID](self, "_loggingID"));

    -[objc_class responseForFetcher:withData:MIMEType:](-[LPFetcher responseClass](self, "responseClass"), "responseForFetcher:withData:MIMEType:", self, v8, v9);
    v15 = (LPFetcherErrorResponse *)objc_claimAutoreleasedReturnValue();
    if (!v15)
LABEL_6:
      v15 = -[LPFetcherErrorResponse initWithError:fetcher:]([LPFetcherErrorResponse alloc], "initWithError:fetcher:", v10, self);
    -[WKWebView _close](self->_webView, "_close");
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__8;
    v19[4] = __Block_byref_object_dispose__8;
    v20 = self->_webView;
    webView = self->_webView;
    self->_webView = 0;

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__LPRawURLContentsFetcher__completedWithData_MIMEType_error___block_invoke;
    block[3] = &unk_1E44A7DB0;
    block[4] = v19;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    -[LPFetcher _event](self, "_event");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "didCompleteWithErrorCode:", objc_msgSend(v10, "code"));

    v12[2](v12, v15);
    _Block_object_dispose(v19, 8);

  }
}

void __61__LPRawURLContentsFetcher__completedWithData_MIMEType_error___block_invoke(uint64_t a1)
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
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)fetchWithConfiguration:(uint64_t)a1 completionHandler:(int)a2 .cold.1(uint64_t a1, int a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1(a1, a2, 1.5047e-36);
  OUTLINED_FUNCTION_0_4(&dword_1A0C41000, v2, v3, "LPRawURLContentsFetcher<%d>: allocating fallback web view, did not have webViewForProcessSharing", v4);
}

- (void)fetchWithConfiguration:(uint64_t)a1 completionHandler:(int)a2 .cold.2(uint64_t a1, int a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1(a1, a2, 1.5047e-36);
  OUTLINED_FUNCTION_0_4(&dword_1A0C41000, v2, v3, "LPRawURLContentsFetcher<%d>: using WKDataTask", v4);
}

- (void)fetchWithConfiguration:(uint64_t)a1 completionHandler:(int)a2 .cold.3(uint64_t a1, int a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1(a1, a2, 1.5047e-36);
  OUTLINED_FUNCTION_0_4(&dword_1A0C41000, v2, v3, "LPRawURLContentsFetcher<%d>: starting subresource load", v4);
}

- (void)dataTask:(uint64_t)a1 didReceiveResponse:(int)a2 decisionHandler:(uint64_t)a3 .cold.1(uint64_t a1, int a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_2_2(a1, a2, a3, 1.5047e-36);
  OUTLINED_FUNCTION_1_5(&dword_1A0C41000, "LPRawURLContentsFetcher<%d>: cancelling subresource load due to error status code: %ld", v3, v4);
}

- (void)dataTask:(uint64_t)a1 didReceiveResponse:(int)a2 decisionHandler:(uint64_t)a3 .cold.2(uint64_t a1, int a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_2_2(a1, a2, a3, 1.5047e-36);
  OUTLINED_FUNCTION_1_5(&dword_1A0C41000, "LPRawURLContentsFetcher<%d>: cancelling subresource load due to excessive size: %lld", v3, v4);
}

- (void)dataTask:(int)a3 didReceiveResponse:(NSObject *)a4 decisionHandler:.cold.3(void *a1, uint64_t a2, int a3, NSObject *a4)
{
  *(_DWORD *)a2 = 67109378;
  *(_DWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 8) = 2112;
  *(_QWORD *)(a2 + 10) = a1;
  OUTLINED_FUNCTION_1_5(&dword_1A0C41000, "LPRawURLContentsFetcher<%d>: cancelling subresource load due to unknown MIME type: \"%@\", (uint8_t *)a2, a4);

}

- (void)dataTask:(uint64_t)a3 didReceiveData:.cold.1(uint64_t a1, int a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_2_2(a1, a2, a3, 1.5047e-36);
  OUTLINED_FUNCTION_1_5(&dword_1A0C41000, "LPRawURLContentsFetcher<%d>: cancelling subresource load due to excessive size (during load): %lu", v3, v4);
}

- (void)_completedWithData:(uint64_t)a1 MIMEType:(int)a2 error:.cold.1(uint64_t a1, int a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1(a1, a2, 1.5047e-36);
  OUTLINED_FUNCTION_0_4(&dword_1A0C41000, v2, v3, "LPRawURLContentsFetcher<%d>: successfully finished subresource load", v4);
}

@end

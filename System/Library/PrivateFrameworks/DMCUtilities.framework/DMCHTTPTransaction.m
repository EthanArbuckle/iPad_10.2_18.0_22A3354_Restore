@implementation DMCHTTPTransaction

- (__SecIdentity)copyIdentity
{
  __SecIdentity *result;

  result = self->_identity;
  if (result)
  {
    CFRetain(result);
    return self->_identity;
  }
  return result;
}

- (void)setIdentity:(__SecIdentity *)a3
{
  __SecIdentity *identity;

  identity = self->_identity;
  if (identity)
    CFRelease(identity);
  self->_identity = a3;
  if (a3)
    CFRetain(a3);
}

- (DMCHTTPTransaction)initWithURL:(id)a3 method:(id)a4
{
  id v7;
  id v8;
  DMCHTTPTransaction *v9;
  DMCHTTPTransaction *v10;
  uint64_t v11;
  NSString *method;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DMCHTTPTransaction;
  v9 = -[DMCHTTPTransaction init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestURL, a3);
    v11 = objc_msgSend(v8, "copy");
    method = v10->_method;
    v10->_method = (NSString *)v11;

    objc_storeStrong((id *)&v10->_userAgent, CFSTR("DeviceManagementClient/1.0"));
    v10->_timeout = 45.0;
  }

  return v10;
}

- (DMCHTTPTransaction)initWithURL:(id)a3 method:(id)a4 downloadURL:(id)a5
{
  id v9;
  DMCHTTPTransaction *v10;
  DMCHTTPTransaction *v11;

  v9 = a5;
  v10 = -[DMCHTTPTransaction initWithURL:method:](self, "initWithURL:method:", a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_downloadURL, a5);

  return v11;
}

- (void)dealloc
{
  __SecIdentity *identity;
  objc_super v4;

  identity = self->_identity;
  if (identity)
    CFRelease(identity);
  v4.receiver = self;
  v4.super_class = (Class)DMCHTTPTransaction;
  -[DMCHTTPTransaction dealloc](&v4, sel_dealloc);
}

- (void)addHeaderKey:(id)a3 value:(id)a4
{
  id v6;
  NSMutableDictionary *headers;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  headers = self->_headers;
  if (!headers)
  {
    v8 = (NSMutableDictionary *)objc_opt_new();
    v9 = self->_headers;
    self->_headers = v8;

    headers = self->_headers;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](headers, "setObject:forKeyedSubscript:", v6, v10);

}

- (id)_constructRequestOutError:(id *)a3
{
  void *v5;
  NSString *contentType;
  NSString *userAgent;
  void *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  void *v13;
  NSMutableDictionary *headers;
  NSMutableDictionary *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  NSObject *v26;
  id v27;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  id v35;
  _BYTE v36[128];
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:cachePolicy:timeoutInterval:", self->_requestURL, 4, self->_timeout);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHTTPMethod:", self->_method);
  contentType = self->_contentType;
  if (contentType)
    objc_msgSend(v5, "addValue:forHTTPHeaderField:", contentType, CFSTR("Content-Type"));
  userAgent = self->_userAgent;
  if (userAgent)
    objc_msgSend(v5, "addValue:forHTTPHeaderField:", userAgent, CFSTR("User-Agent"));
  if (self->_data)
    objc_msgSend(v5, "setHTTPBody:");
  if (self->_CMSSignatureHeaderName && self->_identity)
  {
    v37 = *MEMORY[0x1E0CD6C58];
    v38[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = SecCMSCreateSignedData();
    if (v10)
    {
      v11 = v10;
      v12 = *DMCLogObjects();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v35) = v11;
        _os_log_impl(&dword_1A4951000, v12, OS_LOG_TYPE_ERROR, "Cannot compute message signature. Error: %d", buf, 8u);
      }
    }
    else
    {
      objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addValue:forHTTPHeaderField:", v13, self->_CMSSignatureHeaderName);

    }
  }
  headers = self->_headers;
  if (headers)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v15 = headers;
    v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v31 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_headers, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addValue:forHTTPHeaderField:", v21, v20);

        }
        v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v17);
    }

  }
  -[DMCHTTPTransaction authenticator](self, "authenticator");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
    goto LABEL_29;
  -[DMCHTTPTransaction authenticator](self, "authenticator");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v24 = objc_msgSend(v23, "authenticateRequest:error:", v5, &v29);
  v25 = v29;

  if ((v24 & 1) != 0)
    goto LABEL_28;
  v26 = *DMCLogObjects();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v35 = v25;
    _os_log_impl(&dword_1A4951000, v26, OS_LOG_TYPE_ERROR, "Failed to authenticate request with error: %{public}@", buf, 0xCu);
  }
  if (-[DMCHTTPTransaction ignoreAuthenticatorError](self, "ignoreAuthenticatorError"))
  {
LABEL_28:

LABEL_29:
    v27 = v5;
    goto LABEL_30;
  }
  if (a3)
    *a3 = objc_retainAutorelease(v25);

  v27 = 0;
LABEL_30:

  return v27;
}

- (void)_beginTransaction
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = 0;
  -[DMCHTTPTransaction _constructRequestOutError:](self, "_constructRequestOutError:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  v5 = v8;
  if (v3)
  {
    self->_rememberData = 0;
    objc_msgSend(MEMORY[0x1E0CB39F8], "ephemeralSessionConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTLSMinimumSupportedProtocolVersion:", 771);
    -[DMCHTTPTransaction downloadURL](self, "downloadURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      -[DMCHTTPTransaction _beginDownloadTaskWithSessionConfiguration:request:](self, "_beginDownloadTaskWithSessionConfiguration:request:", v6, v3);
    else
      -[DMCHTTPTransaction _beginDataTaskWithSessionConfiguration:request:](self, "_beginDataTaskWithSessionConfiguration:request:", v6, v3);

  }
  else
  {
    objc_storeStrong((id *)&self->_error, v4);
    -[DMCHTTPTransaction _completeTransaction](self, "_completeTransaction");
  }

}

- (void)_beginDataTaskWithSessionConfiguration:(id)a3 request:(id)a4
{
  void *v6;
  id v7;
  NSURLSession *v8;
  NSURLSession *session;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB39F0];
  v7 = a4;
  objc_msgSend(v6, "sessionWithConfiguration:delegate:delegateQueue:", a3, self, 0);
  v8 = (NSURLSession *)objc_claimAutoreleasedReturnValue();
  session = self->_session;
  self->_session = v8;

  -[NSURLSession dataTaskWithRequest:](self->_session, "dataTaskWithRequest:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[DMCHTTPTransaction authenticator](self, "authenticator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_opt_respondsToSelector();

  v12 = 0;
  if ((v7 & 1) != 0
    && (-[DMCHTTPTransaction authenticator](self, "authenticator"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = 0,
        v14 = objc_msgSend(v13, "prepareTask:error:", v10, &v17),
        v15 = v17,
        v12 = v17,
        v13,
        (v14 & 1) == 0))
  {
    v16 = *DMCLogObjects();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v12;
      _os_log_impl(&dword_1A4951000, v16, OS_LOG_TYPE_ERROR, "Failed to prepare data task with error: %{public}@", buf, 0xCu);
    }
    objc_storeStrong((id *)&self->_error, v15);
    -[DMCHTTPTransaction _completeTransaction](self, "_completeTransaction");
  }
  else
  {
    objc_msgSend(v10, "resume");
    -[NSURLSession finishTasksAndInvalidate](self->_session, "finishTasksAndInvalidate");
  }

}

- (void)_beginDownloadTaskWithSessionConfiguration:(id)a3 request:(id)a4
{
  void *v6;
  id v7;
  NSURLSession *v8;
  NSURLSession *session;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB39F0];
  v7 = a4;
  objc_msgSend(v6, "sessionWithConfiguration:delegate:delegateQueue:", a3, self, 0);
  v8 = (NSURLSession *)objc_claimAutoreleasedReturnValue();
  session = self->_session;
  self->_session = v8;

  -[NSURLSession downloadTaskWithRequest:](self->_session, "downloadTaskWithRequest:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[DMCHTTPTransaction authenticator](self, "authenticator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_opt_respondsToSelector();

  v12 = 0;
  if ((v7 & 1) != 0
    && (-[DMCHTTPTransaction authenticator](self, "authenticator"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = 0,
        v14 = objc_msgSend(v13, "prepareTask:error:", v10, &v17),
        v15 = v17,
        v12 = v17,
        v13,
        (v14 & 1) == 0))
  {
    v16 = *DMCLogObjects();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v12;
      _os_log_impl(&dword_1A4951000, v16, OS_LOG_TYPE_ERROR, "Failed to prepare download task with error: %{public}@", buf, 0xCu);
    }
    objc_storeStrong((id *)&self->_error, v15);
    -[DMCHTTPTransaction _completeTransaction](self, "_completeTransaction");
  }
  else
  {
    objc_msgSend(v10, "resume");
    -[NSURLSession finishTasksAndInvalidate](self->_session, "finishTasksAndInvalidate");
  }

}

- (void)_simulateTransaction
{
  NSObject *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v5;
  id v6;
  NSMutableData *v7;
  NSMutableData *responseData;
  NSError *v9;
  NSError *error;
  id v11;
  id v12;
  uint8_t buf[8];
  int64_t v14;

  v14 = 200;
  v3 = *DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4951000, v3, OS_LOG_TYPE_INFO, "Simulating transaction with transaction block", buf, 2u);
  }
  -[DMCHTTPTransaction simulatedTransactionBlock](self, "simulatedTransactionBlock");
  v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = 0;
  ((void (**)(_QWORD, int64_t *, id *, id *))v4)[2](v4, &v14, &v12, &v11);
  v5 = v12;
  v6 = v11;

  self->_statusCode = v14;
  v7 = (NSMutableData *)objc_msgSend(v5, "copy");
  responseData = self->_responseData;
  self->_responseData = v7;

  v9 = (NSError *)objc_msgSend(v6, "copy");
  error = self->_error;
  self->_error = v9;

  -[DMCHTTPTransaction _completeTransaction](self, "_completeTransaction");
}

- (void)performSynchronously
{
  NSObject *v3;
  NSURL *requestURL;
  dispatch_semaphore_t v5;
  NSObject *v6;
  NSObject *v7;
  NSURL *v8;
  _QWORD v9[4];
  NSObject *v10;
  uint8_t buf[4];
  NSURL *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = *DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    requestURL = self->_requestURL;
    *(_DWORD *)buf = 138543362;
    v12 = requestURL;
    _os_log_impl(&dword_1A4951000, v3, OS_LOG_TYPE_INFO, "Beginning synchronous HTTP request to URL: %{public}@", buf, 0xCu);
  }
  v5 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__DMCHTTPTransaction_performSynchronously__block_invoke;
  v9[3] = &unk_1E4D37148;
  v6 = v5;
  v10 = v6;
  -[DMCHTTPTransaction performCompletionBlock:](self, "performCompletionBlock:", v9);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = *DMCLogObjects();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = self->_requestURL;
    *(_DWORD *)buf = 138543362;
    v12 = v8;
    _os_log_impl(&dword_1A4951000, v7, OS_LOG_TYPE_INFO, "Synchronous HTTP request complete to URL: %{public}@", buf, 0xCu);
  }

}

intptr_t __42__DMCHTTPTransaction_performSynchronously__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)performCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  NSURL *requestURL;
  NSMutableData *v7;
  NSMutableData *responseData;
  NSError *error;
  uint64_t v10;
  id v11;
  void *v12;
  id transactionCompletionBlock;
  NSObject *v14;
  _QWORD block[5];
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  NSURL *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *DMCLogObjects();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    requestURL = self->_requestURL;
    *(_DWORD *)buf = 138543362;
    v19 = requestURL;
    _os_log_impl(&dword_1A4951000, v5, OS_LOG_TYPE_INFO, "Beginning HTTP request to URL: %{public}@", buf, 0xCu);
  }
  v7 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
  responseData = self->_responseData;
  self->_responseData = v7;

  error = self->_error;
  self->_error = 0;

  objc_storeStrong((id *)&self->_currentURL, self->_requestURL);
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __45__DMCHTTPTransaction_performCompletionBlock___block_invoke;
  v16[3] = &unk_1E4D370F8;
  v16[4] = self;
  v17 = v4;
  v11 = v4;
  v12 = (void *)MEMORY[0x1A85A3C10](v16);
  transactionCompletionBlock = self->_transactionCompletionBlock;
  self->_transactionCompletionBlock = v12;

  dispatch_get_global_queue(21, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __45__DMCHTTPTransaction_performCompletionBlock___block_invoke_13;
  block[3] = &unk_1E4D37148;
  block[4] = self;
  dispatch_async(v14, block);

}

uint64_t __45__DMCHTTPTransaction_performCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t result;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 112))
  {
    v3 = *(void **)(v2 + 120);
    *(_QWORD *)(v2 + 120) = 0;

  }
  v4 = *DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1A4951000, v4, OS_LOG_TYPE_INFO, "HTTP request complete to URL: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __45__DMCHTTPTransaction_performCompletionBlock___block_invoke_13(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "simulatedTransactionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "_simulateTransaction");
  else
    return objc_msgSend(v3, "_beginTransaction");
}

- (void)_completeTransaction
{
  void *v3;
  void (**v4)(void);

  -[DMCHTTPTransaction transactionCompletionBlock](self, "transactionCompletionBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DMCHTTPTransaction transactionCompletionBlock](self, "transactionCompletionBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

    -[DMCHTTPTransaction setTransactionCompletionBlock:](self, "setTransactionCompletionBlock:", 0);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v10;
  void (**v11)(id, id);
  id v12;
  NSDictionary *v13;
  NSDictionary *responseHeaders;
  void *v15;
  NSURL *v16;
  NSURL *currentURL;
  int64_t statusCode;
  NSObject *v19;
  _BOOL4 v20;
  NSURL *v21;
  NSURL *v22;
  NSURL *permanentlyRedirectedURL;
  NSURL *v24;
  int v25;
  NSURL *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = (void (**)(id, id))a7;
  v12 = a5;
  self->_statusCode = objc_msgSend(v12, "statusCode");
  objc_msgSend(v12, "allHeaderFields");
  v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  responseHeaders = self->_responseHeaders;
  self->_responseHeaders = v13;

  objc_msgSend(v10, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (NSURL *)objc_msgSend(v15, "copy");
  currentURL = self->_currentURL;
  self->_currentURL = v16;

  statusCode = self->_statusCode;
  v19 = *DMCLogObjects();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (statusCode == 301)
  {
    if (v20)
    {
      v21 = self->_currentURL;
      v25 = 138543362;
      v26 = v21;
      _os_log_impl(&dword_1A4951000, v19, OS_LOG_TYPE_DEFAULT, "Redirected permanently to URL: %{public}@", (uint8_t *)&v25, 0xCu);
    }
    v22 = (NSURL *)-[NSURL copy](self->_currentURL, "copy");
    permanentlyRedirectedURL = self->_permanentlyRedirectedURL;
    self->_permanentlyRedirectedURL = v22;

  }
  else if (v20)
  {
    v24 = self->_currentURL;
    v25 = 138543362;
    v26 = v24;
    _os_log_impl(&dword_1A4951000, v19, OS_LOG_TYPE_DEFAULT, "Redirected to URL: %{public}@", (uint8_t *)&v25, 0xCu);
  }
  v11[2](v11, v10);

}

- (BOOL)_shouldAllowTrust:(__SecTrust *)a3 forHost:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  CFErrorRef error;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3)
  {
    if (SecTrustGetCertificateCount(a3) < 1)
    {
      LOBYTE(a3) = 0;
    }
    else if (-[NSArray count](self->_pinnedSecCertificateRefs, "count"))
    {
      LOBYTE(a3) = -[DMCHTTPTransaction _shouldAllowTrustWithPinning:forHost:](self, "_shouldAllowTrustWithPinning:forHost:", a3, v6);
    }
    else
    {
      error = 0;
      LODWORD(a3) = SecTrustEvaluateWithError(a3, &error);
      if ((a3 & 1) == 0)
        CFRelease(error);
      v7 = *DMCLogObjects();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v8 = v7;
        DMCStringForBool((int)a3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v13 = v6;
        v14 = 2114;
        v15 = v9;
        _os_log_impl(&dword_1A4951000, v8, OS_LOG_TYPE_DEBUG, "Evaluating trust for host: %{public}@ result: %{public}@", buf, 0x16u);

      }
    }
  }

  return (char)a3;
}

- (BOOL)_shouldAllowTrustWithPinning:(__SecTrust *)a3 forHost:(id)a4
{
  __CFString *v6;
  const __CFData *v7;
  const __CFData *v8;
  uint64_t v9;
  __SecTrust *v10;
  SecPolicyRef SSL;
  void *v12;
  SecPolicyRef Revocation;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  BOOL v20;
  NSObject *v22;
  CFTypeRef cf;
  uint8_t buf[16];
  _BYTE v25[12];
  __int16 v26;
  CFTypeRef v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a4;
  cf = 0;
  *(_QWORD *)v25 = 0;
  if (!a3)
    goto LABEL_18;
  v7 = (const __CFData *)SecTrustSerialize();
  if (!v7)
  {
    v16 = *DMCLogObjects();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4951000, v16, OS_LOG_TYPE_ERROR, "Failed to serialize trust when copying", buf, 2u);
    }
    goto LABEL_18;
  }
  v8 = v7;
  if (CFDataGetLength(v7))
  {
    v9 = SecTrustDeserialize();
    if (v9)
    {
      v10 = (__SecTrust *)v9;
      CFRelease(v8);
      SSL = SecPolicyCreateSSL(1u, v6);
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", SSL);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (self->_pinningRevocationCheckRequired)
      {
        Revocation = SecPolicyCreateRevocation(0xBuLL);
        objc_msgSend(v12, "addObject:", Revocation);

      }
      if (SecTrustSetPolicies(v10, v12))
      {
        v14 = *DMCLogObjects();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v25 = 138543362;
          *(_QWORD *)&v25[4] = v6;
          v15 = "Failed to set policies when evaluating pinning trust for host %{public}@";
LABEL_25:
          _os_log_impl(&dword_1A4951000, v14, OS_LOG_TYPE_ERROR, v15, v25, 0xCu);
        }
      }
      else
      {
        if (!SecTrustSetAnchorCertificates(v10, (CFArrayRef)self->_pinnedSecCertificateRefs))
        {
          cf = 0;
          v20 = SecTrustEvaluateWithError(v10, (CFErrorRef *)&cf);
          if (cf)
          {
            v22 = *DMCLogObjects();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v25 = 138543618;
              *(_QWORD *)&v25[4] = v6;
              v26 = 2114;
              v27 = cf;
              _os_log_impl(&dword_1A4951000, v22, OS_LOG_TYPE_ERROR, "Evaluating pinned trust for host %{public}@ failed with error %{public}@", v25, 0x16u);
            }
          }
          goto LABEL_27;
        }
        v14 = *DMCLogObjects();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v25 = 138543362;
          *(_QWORD *)&v25[4] = v6;
          v15 = "Failed to set anchors when evaluating pinning trust for host %{public}@";
          goto LABEL_25;
        }
      }
      v20 = 0;
LABEL_27:

      if (cf)
        CFRelease(cf);
      CFRelease(v10);
      goto LABEL_21;
    }
    v17 = *DMCLogObjects();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v18 = "Failed to deserialize trust when copying";
    goto LABEL_16;
  }
  v17 = *DMCLogObjects();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v18 = "Failed to serialize trust when copying, zero length result";
LABEL_16:
    _os_log_impl(&dword_1A4951000, v17, OS_LOG_TYPE_ERROR, v18, buf, 2u);
  }
LABEL_17:
  CFRelease(v8);
LABEL_18:
  v19 = *DMCLogObjects();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v25 = 138543362;
    *(_QWORD *)&v25[4] = v6;
    _os_log_impl(&dword_1A4951000, v19, OS_LOG_TYPE_ERROR, "Failed to copy trust when evaluating pinning trust for host %{public}@", v25, 0xCu);
  }
  v20 = 0;
LABEL_21:

  return v20;
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  void (**v8)(id, uint64_t, _QWORD);
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSError *v23;
  NSError *error;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSError *v36;
  NSError *v37;
  _BOOL4 v38;
  NSObject *v39;
  void *v40;
  uint8_t v41[16];
  _BYTE buf[24];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, uint64_t, _QWORD))a6;
  objc_msgSend(a5, "protectionSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "authenticationMethod");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *DMCLogObjects();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v10;
    _os_log_impl(&dword_1A4951000, v11, OS_LOG_TYPE_DEBUG, "Handling challenge: %{public}@", buf, 0xCu);
  }
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB32C8]))
  {
    v12 = objc_msgSend(v9, "serverTrust");
    objc_msgSend(v9, "host");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = -[DMCHTTPTransaction _shouldAllowTrust:forHost:](self, "_shouldAllowTrust:forHost:", v12, v13);

    if ((v12 & 1) == 0)
    {
      if (!self->_error)
      {
        v21 = (void *)MEMORY[0x1E0CB35C8];
        DMCErrorArray(CFSTR("HTTP_ERROR_INVALID_SERVER_CERT_P_URL_%@"), v14, v15, v16, v17, v18, v19, v20, self->_requestURL);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "DMCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("DMCHTTPTransactionErrorDomain"), 23002, v22, CFSTR("DMCFatalError"));
        v23 = (NSError *)objc_claimAutoreleasedReturnValue();
        error = self->_error;
        self->_error = v23;

      }
      v25 = *DMCLogObjects();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4951000, v25, OS_LOG_TYPE_DEBUG, "NOT sending client identity certificate", buf, 2u);
      }
      v8[2](v8, 2, 0);
      goto LABEL_22;
    }
  }
  else if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB32A8]) & 1) == 0)
  {
    v8[2](v8, 3, 0);
    goto LABEL_22;
  }
  if (self->_identity)
  {
    v26 = *DMCLogObjects();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4951000, v26, OS_LOG_TYPE_DEBUG, "Preparing to send identity...", buf, 2u);
    }
    *(_QWORD *)buf = 0;
    if (!SecIdentityCopyCertificate(self->_identity, (SecCertificateRef *)buf) && self->_identity && *(_QWORD *)buf)
    {
      v38 = +[DMCFeatureOverrides bypassMDMTLSClientAuthentication](DMCFeatureOverrides, "bypassMDMTLSClientAuthentication");
      v39 = *DMCLogObjects();
      if (v38)
      {
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v41 = 0;
          _os_log_impl(&dword_1A4951000, v39, OS_LOG_TYPE_ERROR, "Ignoring request for client identity and performing default handling", v41, 2u);
        }
        v8[2](v8, 1, 0);
      }
      else
      {
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v41 = 0;
          _os_log_impl(&dword_1A4951000, v39, OS_LOG_TYPE_DEBUG, "Sending client identity certificate", v41, 2u);
        }
        objc_msgSend(MEMORY[0x1E0CB39A8], "credentialWithIdentity:certificates:persistence:", self->_identity, 0, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v40);

      }
    }
    else
    {
      if (!self->_error)
      {
        v34 = (void *)MEMORY[0x1E0CB35C8];
        DMCErrorArray(CFSTR("HTTP_ERROR_INVALID_IDENTITY_P_URL_%@"), v27, v28, v29, v30, v31, v32, v33, self->_requestURL);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "DMCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("DMCHTTPTransactionErrorDomain"), 23000, v35, CFSTR("DMCFatalError"));
        v36 = (NSError *)objc_claimAutoreleasedReturnValue();
        v37 = self->_error;
        self->_error = v36;

      }
      v8[2](v8, 2, 0);
    }
    if (*(_QWORD *)buf)
      CFRelease(*(CFTypeRef *)buf);
  }
  else
  {
    v8[2](v8, 0, 0);
  }
LABEL_22:

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSError *v16;
  NSError *error;
  NSObject *v18;
  NSURL *currentURL;
  NSError *v20;
  NSObject *v21;
  void *v22;
  int64_t statusCode;
  NSObject *v24;
  NSURL *v25;
  void *v26;
  _BOOL4 v27;
  NSError *v28;
  NSError *v29;
  void *v30;
  NSURL *v31;
  void *v32;
  NSURL *requestURL;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  NSError *v42;
  NSError *v43;
  id v44;
  uint8_t buf[4];
  NSURL *v46;
  __int16 v47;
  void *v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  objc_msgSend(v8, "originalRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "response");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[DMCHTTPLog logHTTPDetailsForIdentifier:request:response:responseData:responseError:](DMCHTTPLog, "logHTTPDetailsForIdentifier:request:response:responseData:responseError:", CFSTR("Logs"), v9, v10, self->_responseData, v7);
  if (v7)
  {
    if (!self->_error)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v7, "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v7, "code");
      objc_msgSend(v7, "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "DMCErrorWithDomain:code:descriptionArray:errorType:", v12, v13, v15, CFSTR("DMCFatalError"));
      v16 = (NSError *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v16;

    }
    v18 = *DMCLogObjects();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      currentURL = self->_currentURL;
      v20 = self->_error;
      v21 = v18;
      -[NSError DMCVerboseDescription](v20, "DMCVerboseDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = currentURL;
      v47 = 2114;
      v48 = v22;
      _os_log_impl(&dword_1A4951000, v21, OS_LOG_TYPE_ERROR, "Connection to %{public}@ failed with error: %{public}@", buf, 0x16u);

    }
    goto LABEL_17;
  }
  statusCode = self->_statusCode;
  v24 = *DMCLogObjects();
  if (statusCode == 403)
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = self->_currentURL;
      *(_DWORD *)buf = 138543362;
      v46 = v25;
      _os_log_impl(&dword_1A4951000, v24, OS_LOG_TYPE_ERROR, "Connection to %{public}@ finished with 403 response", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0C99D80], "dmc_jsonDictionaryFromData:", self->_responseData);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v44 = 0;
      v27 = +[DMCHTTPRequestor parse403ErrorWithResponseDictionary:outError:](DMCHTTPRequestor, "parse403ErrorWithResponseDictionary:outError:", v26, &v44);
      v28 = (NSError *)v44;
      v29 = v28;
      if (v27)
      {
        v29 = v28;
        v30 = self->_error;
        self->_error = v29;
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      v29 = 0;
    }
    v32 = (void *)MEMORY[0x1E0CB35C8];
    requestURL = self->_requestURL;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_statusCode);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    DMCErrorArray(CFSTR("HTTP_ERROR_REQUEST_FAILED_%@_%@"), v34, v35, v36, v37, v38, v39, v40, requestURL);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "DMCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("DMCHTTPTransactionErrorDomain"), 23010, v41, CFSTR("DMCFatalError"));
    v42 = (NSError *)objc_claimAutoreleasedReturnValue();
    v43 = self->_error;
    self->_error = v42;

    goto LABEL_16;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    v31 = self->_currentURL;
    *(_DWORD *)buf = 138543362;
    v46 = v31;
    _os_log_impl(&dword_1A4951000, v24, OS_LOG_TYPE_DEBUG, "Connection finished loading to URL %{public}@", buf, 0xCu);
  }
LABEL_17:
  -[DMCHTTPTransaction _completeTransaction](self, "_completeTransaction");

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  void (**v8)(_QWORD);
  id v9;
  NSDictionary *v10;
  NSDictionary *responseHeaders;
  NSObject *v12;
  int64_t statusCode;
  int64_t v14;
  void *v15;
  NSURL *requestURL;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSError *v25;
  NSError *error;
  void *v27;
  uint8_t buf[4];
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(_QWORD))a6;
  v9 = a5;
  self->_statusCode = objc_msgSend(v9, "statusCode");
  objc_msgSend(v9, "allHeaderFields");
  v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  responseHeaders = self->_responseHeaders;
  self->_responseHeaders = v10;

  v12 = *DMCLogObjects();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    statusCode = self->_statusCode;
    *(_DWORD *)buf = 67109120;
    v29 = statusCode;
    _os_log_impl(&dword_1A4951000, v12, OS_LOG_TYPE_DEBUG, "Received response status code: %d", buf, 8u);
  }
  v14 = self->_statusCode;
  if (v14 == 403 || v14 == 200)
  {
    self->_rememberData = 1;
  }
  else if (!self->_error)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    requestURL = self->_requestURL;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    DMCErrorArray(CFSTR("HTTP_ERROR_REQUEST_FAILED_%@_%@"), v17, v18, v19, v20, v21, v22, v23, requestURL);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "DMCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("DMCHTTPTransactionErrorDomain"), 23002, v24, CFSTR("DMCFatalError"));
    v25 = (NSError *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v25;

  }
  v8[2](v8);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  if (self->_rememberData)
    -[NSMutableData appendData:](self->_responseData, "appendData:", a5, a4);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v7;
  void *v8;
  NSDictionary *v9;
  NSDictionary *responseHeaders;
  NSObject *v11;
  int64_t statusCode;
  void *v13;
  void *v14;
  int v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  id v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(a4, "response");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_statusCode = objc_msgSend(v8, "statusCode");
  objc_msgSend(v8, "allHeaderFields");
  v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  responseHeaders = self->_responseHeaders;
  self->_responseHeaders = v9;

  v11 = *DMCLogObjects();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    statusCode = self->_statusCode;
    *(_DWORD *)buf = 67109120;
    LODWORD(v45) = statusCode;
    _os_log_impl(&dword_1A4951000, v11, OS_LOG_TYPE_DEBUG, "Received response status code: %d", buf, 8u);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCHTTPTransaction downloadURL](self, "downloadURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v15 = objc_msgSend(v13, "removeItemAtURL:error:", v14, &v43);
  v16 = v43;
  v17 = v43;

  if (v15)
  {
    v18 = *DMCLogObjects();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = v18;
      -[DMCHTTPTransaction downloadURL](self, "downloadURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v21;
      _os_log_impl(&dword_1A4951000, v19, OS_LOG_TYPE_DEBUG, "Removed existing downloaded data file at %{public}@", buf, 0xCu);

    }
    goto LABEL_8;
  }
  objc_msgSend(v17, "domain");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {
    v23 = objc_msgSend(v17, "code");

    if (v23 == 4)
    {
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCHTTPTransaction downloadURL](self, "downloadURL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v17;
      v26 = objc_msgSend(v24, "moveItemAtURL:toURL:error:", v7, v25, &v42);
      v27 = v42;
      v28 = v42;

      v29 = *DMCLogObjects();
      if ((v26 & 1) != 0)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          v30 = v29;
          objc_msgSend(v7, "path");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[DMCHTTPTransaction downloadURL](self, "downloadURL");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "path");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v45 = v31;
          v46 = 2114;
          v47 = v33;
          _os_log_impl(&dword_1A4951000, v30, OS_LOG_TYPE_DEBUG, "Moved downloaded data file at %{public}@, to %{public}@", buf, 0x16u);

        }
      }
      else
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v34 = v29;
          objc_msgSend(v7, "path");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[DMCHTTPTransaction downloadURL](self, "downloadURL");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "path");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v45 = v35;
          v46 = 2114;
          v47 = v37;
          v48 = 2114;
          v49 = v28;
          _os_log_impl(&dword_1A4951000, v34, OS_LOG_TYPE_ERROR, "Could not move downloaded data file at %{public}@, to %{public}@: %{public}@", buf, 0x20u);

        }
        objc_storeStrong((id *)&self->_error, v27);
      }
      v17 = v28;
      goto LABEL_19;
    }
  }
  else
  {

  }
  v38 = *DMCLogObjects();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    v39 = v38;
    -[DMCHTTPTransaction downloadURL](self, "downloadURL");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "path");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v45 = v41;
    v46 = 2114;
    v47 = v17;
    _os_log_impl(&dword_1A4951000, v39, OS_LOG_TYPE_ERROR, "Failed to remove existing downloaded data file at %{public}@: %{public}@", buf, 0x16u);

  }
  objc_storeStrong((id *)&self->_error, v16);
LABEL_19:

}

+ (id)emptySuccessResponseBlock
{
  return &__block_literal_global_9;
}

void __47__DMCHTTPTransaction_emptySuccessResponseBlock__block_invoke(uint64_t a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  *a2 = 200;
  *a3 = 0;
  if (a4)
    *a4 = 0;
}

- (NSURL)url
{
  return self->_requestURL;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_requestURL, a3);
}

- (NSString)method
{
  return self->_method;
}

- (void)setMethod:(id)a3
{
  objc_storeStrong((id *)&self->_method, a3);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
  objc_storeStrong((id *)&self->_userAgent, a3);
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
  objc_storeStrong((id *)&self->_contentType, a3);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSArray)pinnedSecCertificateRefs
{
  return self->_pinnedSecCertificateRefs;
}

- (void)setPinnedSecCertificateRefs:(id)a3
{
  objc_storeStrong((id *)&self->_pinnedSecCertificateRefs, a3);
}

- (BOOL)pinningRevocationCheckRequired
{
  return self->_pinningRevocationCheckRequired;
}

- (void)setPinningRevocationCheckRequired:(BOOL)a3
{
  self->_pinningRevocationCheckRequired = a3;
}

- (NSData)responseData
{
  return &self->_responseData->super;
}

- (NSString)CMSSignatureHeaderName
{
  return self->_CMSSignatureHeaderName;
}

- (void)setCMSSignatureHeaderName:(id)a3
{
  objc_storeStrong((id *)&self->_CMSSignatureHeaderName, a3);
}

- (NSError)error
{
  return self->_error;
}

- (NSURL)permanentlyRedirectedURL
{
  return self->_permanentlyRedirectedURL;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (DMCHTTPAuthenticator)authenticator
{
  return self->_authenticator;
}

- (void)setAuthenticator:(id)a3
{
  objc_storeStrong((id *)&self->_authenticator, a3);
}

- (BOOL)ignoreAuthenticatorError
{
  return self->_ignoreAuthenticatorError;
}

- (void)setIgnoreAuthenticatorError:(BOOL)a3
{
  self->_ignoreAuthenticatorError = a3;
}

- (NSURL)downloadURL
{
  return self->_downloadURL;
}

- (void)setDownloadURL:(id)a3
{
  objc_storeStrong((id *)&self->_downloadURL, a3);
}

- (NSDictionary)responseHeaders
{
  return self->_responseHeaders;
}

- (id)simulatedTransactionBlock
{
  return self->_simulatedTransactionBlock;
}

- (void)setSimulatedTransactionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (id)transactionCompletionBlock
{
  return self->_transactionCompletionBlock;
}

- (void)setTransactionCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transactionCompletionBlock, 0);
  objc_storeStrong(&self->_simulatedTransactionBlock, 0);
  objc_storeStrong((id *)&self->_responseHeaders, 0);
  objc_storeStrong((id *)&self->_downloadURL, 0);
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong((id *)&self->_pinnedSecCertificateRefs, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_permanentlyRedirectedURL, 0);
  objc_storeStrong((id *)&self->_currentURL, 0);
  objc_storeStrong((id *)&self->_CMSSignatureHeaderName, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_method, 0);
  objc_storeStrong((id *)&self->_requestURL, 0);
}

@end

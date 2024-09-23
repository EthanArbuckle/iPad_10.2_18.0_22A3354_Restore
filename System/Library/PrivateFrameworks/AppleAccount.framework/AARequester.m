@implementation AARequester

- (AARequester)initWithRequest:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  AARequester *v9;
  uint64_t v10;
  id handler;
  NSMutableData *v12;
  NSMutableData *data;
  OS_dispatch_queue *handlerQueue;
  uint64_t v15;
  AKAppleIDSession *appleIDSession;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)AARequester;
  v9 = -[AARequester init](&v18, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    handler = v9->_handler;
    v9->_handler = (id)v10;

    v12 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    data = v9->_data;
    v9->_data = v12;

    objc_storeStrong((id *)&v9->_request, a3);
    v9->_responseClass = (Class)objc_msgSend((id)objc_opt_class(), "responseClass");
    v9->_canceled = 0;
    handlerQueue = v9->_handlerQueue;
    v9->_handlerQueue = 0;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D00140]), "initWithIdentifier:", CFSTR("com.apple.icloud"));
    appleIDSession = v9->_appleIDSession;
    v9->_appleIDSession = (AKAppleIDSession *)v15;

  }
  return v9;
}

- (void)cancel
{
  NSURLConnection *urlConnection;
  NSObject *handlerQueue;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  AARequester *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  AARequester *v15;

  urlConnection = self->_urlConnection;
  if (urlConnection)
    -[NSURLConnection cancel](urlConnection, "cancel");
  if (!-[AARequester isFinished](self, "isFinished"))
  {
    handlerQueue = self->_handlerQueue;
    if (handlerQueue)
    {
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __21__AARequester_cancel__block_invoke;
      v14 = &unk_1E416E3A8;
      v15 = self;
      v5 = &v11;
    }
    else
    {
      v6 = MEMORY[0x1E0C809B0];
      v7 = 3221225472;
      v8 = __21__AARequester_cancel__block_invoke_2;
      v9 = &unk_1E416E3A8;
      v10 = self;
      handlerQueue = MEMORY[0x1E0C80D38];
      v5 = &v6;
    }
    dispatch_async(handlerQueue, v5);
  }
  -[AARequester setCanceled:](self, "setCanceled:", 1, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
}

uint64_t __21__AARequester_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callHandler");
}

uint64_t __21__AARequester_cancel__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callHandler");
}

- (void)start
{
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  AAResponse *v7;
  AAResponse *response;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[AARequester setIsExecuting:](self, "setIsExecuting:", 1);
  -[AARequester setFinished:](self, "setFinished:", 0);
  -[AARequest urlString](self->_request, "urlString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AARequest urlRequest](self->_request, "urlRequest");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[AARequester _kickOffRequest:](self, "_kickOffRequest:");

  }
  else
  {
    _AALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_19EACA000, v4, OS_LOG_TYPE_DEFAULT, "AARequester starting an AARequest (%@) with nil URL. Calling handler with an error.", buf, 0xCu);

    }
    v7 = (AAResponse *)objc_msgSend(objc_alloc(self->_responseClass), "initWithHTTPResponse:data:", 0, 0);
    response = self->_response;
    self->_response = v7;

    v9 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ICLOUD_CONFIG_ERROR"), 0, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.appleaccount"), -2, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAResponse setError:](self->_response, "setError:", v13);

    -[AARequester setIsExecuting:](self, "setIsExecuting:", 0);
    -[AARequester setFinished:](self, "setFinished:", 1);
    -[AARequester _callHandler](self, "_callHandler");
  }
}

- (void)_kickOffRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSURLConnection *v13;
  NSURLConnection *urlConnection;
  NSURLConnection *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  NSObject *v22;
  uint8_t v23[16];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  -[AKAppleIDSession appleIDHeadersForRequest:](self->_appleIDSession, "appleIDHeadersForRequest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setValue:forHTTPHeaderField:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }
  objc_msgSend(MEMORY[0x1E0C92C58], "connectionWithRequest:delegate:", v5, self);
  v13 = (NSURLConnection *)objc_claimAutoreleasedReturnValue();
  urlConnection = self->_urlConnection;
  self->_urlConnection = v13;

  v15 = self->_urlConnection;
  v16 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  -[NSURLConnection setDelegateQueue:](v15, "setDelegateQueue:", v16);

  if (self->_urlConnection)
  {
    v17 = *MEMORY[0x1E0C99748];
    do
    {
      if (-[AARequester isFinished](self, "isFinished"))
        break;
      if (-[AARequester isCanceled](self, "isCanceled"))
        break;
      objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "runMode:beforeDate:", v17, v19);

    }
    while ((v20 & 1) != 0);
    _AALogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_19EACA000, v21, OS_LOG_TYPE_DEFAULT, "AARequester runloop finished", v23, 2u);
    }

    if (!-[AARequester isFinished](self, "isFinished") && !-[AARequester isCanceled](self, "isCanceled"))
    {
      _AALogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_19EACA000, v22, OS_LOG_TYPE_DEFAULT, "AARequester: Premature runloop exit, calling cancel", v23, 2u);
      }

      -[AARequester cancel](self, "cancel");
    }
  }
  else
  {
    -[AARequester setIsExecuting:](self, "setIsExecuting:", 0);
    -[AARequester setFinished:](self, "setFinished:", 1);
    -[AARequester _callHandler](self, "_callHandler");
  }

}

- (void)_callHandler
{
  NSObject *handlerQueue;
  _QWORD *v4;
  id v5;
  _QWORD block[5];
  _QWORD v7[5];

  if (self->_shouldRetry)
  {
    -[NSURLConnection originalRequest](self->_urlConnection, "originalRequest");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[AARequester _kickOffRequest:](self, "_kickOffRequest:", v5);

  }
  else
  {
    handlerQueue = self->_handlerQueue;
    if (handlerQueue)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __27__AARequester__callHandler__block_invoke;
      v7[3] = &unk_1E416E3A8;
      v7[4] = self;
      v4 = v7;
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __27__AARequester__callHandler__block_invoke_2;
      block[3] = &unk_1E416E3A8;
      block[4] = self;
      handlerQueue = MEMORY[0x1E0C80D38];
      v4 = block;
    }
    dispatch_async(handlerQueue, v4);
  }
}

uint64_t __27__AARequester__callHandler__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__unsafe_callHandler");
}

uint64_t __27__AARequester__callHandler__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__unsafe_callHandler");
}

- (void)__unsafe_callHandler
{
  (*((void (**)(void))self->_handler + 2))();
  -[AARequester setIsExecuting:](self, "setIsExecuting:", 0);
  -[AARequester setFinished:](self, "setFinished:", 1);
}

- (void)connection:(id)a3 willSendRequestForAuthenticationChallenge:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  +[AACertificatePinner sharedPinner](AACertificatePinner, "sharedPinner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  _AALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v9 & 1) != 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[AARequester connection:willSendRequestForAuthenticationChallenge:].cold.1(a2, v7, v11);

    +[AACertificatePinner sharedPinner](AACertificatePinner, "sharedPinner");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "connection:willSendRequestForAuthenticationChallenge:", v6, v7);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AARequester connection:willSendRequestForAuthenticationChallenge:].cold.2(a2, v11);

    objc_msgSend(v7, "sender");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "performDefaultHandlingForAuthenticationChallenge:", v7);
  }

}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  NSHTTPURLResponse *v6;
  id v7;
  NSObject *v8;
  void *v9;
  AKAppleIDSession *appleIDSession;
  void *v11;
  NSHTTPURLResponse *httpResponse;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = (NSHTTPURLResponse *)a4;
  v7 = a3;
  _AALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[NSHTTPURLResponse allHeaderFields](v6, "allHeaderFields");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v9;
    _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "Received response. Headers: %@", (uint8_t *)&v13, 0xCu);

  }
  self->_shouldRetry = 0;
  appleIDSession = self->_appleIDSession;
  objc_msgSend(v7, "originalRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKAppleIDSession handleResponse:forRequest:shouldRetry:](appleIDSession, "handleResponse:forRequest:shouldRetry:", v6, v11, &self->_shouldRetry);
  httpResponse = self->_httpResponse;
  self->_httpResponse = v6;

}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = objc_msgSend(v5, "length");
    _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "Received %lu bytes.", (uint8_t *)&v7, 0xCu);
  }

  -[NSMutableData appendData:](self->_data, "appendData:", v5);
}

- (void)connectionDidFinishLoading:(id)a3
{
  NSObject *v4;
  NSUInteger v5;
  AAResponse *v6;
  AAResponse *response;
  int v8;
  NSUInteger v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[NSMutableData length](self->_data, "length");
    v8 = 134217984;
    v9 = v5;
    _os_log_impl(&dword_19EACA000, v4, OS_LOG_TYPE_DEFAULT, "Finished loading: %lu bytes.", (uint8_t *)&v8, 0xCu);
  }

  v6 = (AAResponse *)objc_msgSend(objc_alloc(self->_responseClass), "initWithHTTPResponse:data:", self->_httpResponse, self->_data);
  response = self->_response;
  self->_response = v6;

  -[AARequester _callHandler](self, "_callHandler");
  -[AARequester setIsExecuting:](self, "setIsExecuting:", 0);
  -[AARequester setFinished:](self, "setFinished:", 1);
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  AAResponse *v9;
  AAResponse *response;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "Connection failed.", (uint8_t *)&v12, 2u);
  }

  if (v5)
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_19EACA000, v7, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v12, 0xCu);

    }
  }
  v9 = (AAResponse *)objc_msgSend(objc_alloc(self->_responseClass), "initWithHTTPResponse:data:", self->_httpResponse, self->_data);
  response = self->_response;
  self->_response = v9;

  objc_msgSend(v5, "_aa_userReadableError");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAResponse setError:](self->_response, "setError:", v11);

  -[AARequester _callHandler](self, "_callHandler");
  -[AARequester setIsExecuting:](self, "setIsExecuting:", 0);
  -[AARequester setFinished:](self, "setFinished:", 1);

}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

- (BOOL)isCanceled
{
  return self->_isCanceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_isCanceled = a3;
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (void)setIsExecuting:(BOOL)a3
{
  self->_isExecuting = a3;
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (void)setHandlerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_handlerQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong((id *)&self->_appleIDSession, 0);
  objc_storeStrong((id *)&self->_httpResponse, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_urlConnection, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)connection:(NSObject *)a3 willSendRequestForAuthenticationChallenge:.cold.1(const char *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "protectionSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138478083;
  v9 = v5;
  v10 = 2113;
  v11 = v7;
  _os_log_debug_impl(&dword_19EACA000, a3, OS_LOG_TYPE_DEBUG, "AACertificatePinner responds to %{private}@, routing challenge for host: %{private}@", (uint8_t *)&v8, 0x16u);

}

- (void)connection:(const char *)a1 willSendRequestForAuthenticationChallenge:(NSObject *)a2 .cold.2(const char *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138477827;
  v5 = v3;
  _os_log_error_impl(&dword_19EACA000, a2, OS_LOG_TYPE_ERROR, "AACertificatePinner does not respond to %{private}@!", (uint8_t *)&v4, 0xCu);

}

@end

@implementation FMCommandBase

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (BOOL)wasSuccessful
{
  void *v2;
  uint64_t v3;

  -[FMCommandBase response](self, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "statusCode");

  return (unint64_t)(v3 - 200) < 0x64;
}

- (id)headers
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMCommandBase authHeaders](self, "authHeaders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  return v3;
}

- (id)valueForResponseHTTPHeader:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[FMCommandBase response](self, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allHeaderFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (FMCommandBase)init
{
  FMCommandBase *v2;
  FMCommandBase *v3;
  NSObject *v4;
  void *v5;
  id v6;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  FMCommandBase *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)FMCommandBase;
  v2 = -[FMCommandBase init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[FMCommandBase setTimeout:](v2, "setTimeout:", 120.0);
    -[FMCommandBase setCommandTaskComplete:](v3, "setCommandTaskComplete:", 0);
    LogCategory_Networking();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v10 = v5;
      v11 = 2048;
      v12 = v3;
      v6 = v5;
      _os_log_impl(&dword_1C9967000, v4, OS_LOG_TYPE_INFO, "%@ created [%p]", buf, 0x16u);

    }
  }
  return v3;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_redirectedHostname, 0);
  objc_storeStrong((id *)&self->_originalHostname, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_destroyWeak((id *)&self->_serverInteractionController);
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_scheme, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)_dataTaskCompletionHandlerWithData:(id)a3 response:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[FMCommandBase task](self, "task");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "state");

  if (v12 != 3)
  {
    LogCategory_Networking();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[FMCommandBase _dataTaskCompletionHandlerWithData:response:error:].cold.1(self, v13);

  }
  -[FMCommandBase setCommandTaskComplete:](self, "setCommandTaskComplete:", 1);
  v14 = (void *)objc_msgSend(v10, "copy");

  -[FMCommandBase setResponseData:](self, "setResponseData:", v14);
  -[FMCommandBase setError:](self, "setError:", v8);

  -[FMCommandBase setResponse:](self, "setResponse:", v9);
  -[FMCommandBase error](self, "error");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[FMCommandBase isTransactionCompleteWithError:](self, "isTransactionCompleteWithError:", v15);

  if (v16)
  {
    -[FMCommandBase willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    -[FMCommandBase didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  }
}

- (id)authHeaders
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[FMCommandBase username](self, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {

    goto LABEL_5;
  }
  -[FMCommandBase password](self, "password");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
  {
LABEL_5:
    v11 = 0;
    v13 = 0;
    goto LABEL_6;
  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[FMCommandBase username](self, "username");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMCommandBase password](self, "password");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@:%@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataUsingEncoding:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = CFSTR("Authorization");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Basic %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v13;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)password
{
  return self->_password;
}

- (NSData)responseData
{
  return self->_responseData;
}

- (BOOL)isTransactionCompleteWithError:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSString *v33;
  NSString *originalHostname;
  NSString *v35;
  NSString *redirectedHostname;
  void *v37;
  void *v38;
  _QWORD v39[2];
  _QWORD v40[2];
  uint8_t buf[4];
  FMCommandBase *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  -[FMCommandBase response](self, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_11;
  -[FMCommandBase response](self, "response");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allHeaderFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[FMCommandBase response](self, "response");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "statusCode");

  LogCategory_Networking();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 < 400)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      -[FMCommandBase response](self, "response");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218240;
      v42 = self;
      v43 = 2048;
      v44 = objc_msgSend(v12, "statusCode");
      v13 = v11;
      v14 = OS_LOG_TYPE_INFO;
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[FMCommandBase response](self, "response");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218240;
    v42 = self;
    v43 = 2048;
    v44 = objc_msgSend(v12, "statusCode");
    v13 = v11;
    v14 = OS_LOG_TYPE_DEFAULT;
LABEL_7:
    _os_log_impl(&dword_1C9967000, v13, v14, "[%p] response_http_status : %ld", buf, 0x16u);

  }
  LogCategory_NetworkingVerbose();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v42 = self;
    v43 = 2112;
    v44 = (uint64_t)v7;
    _os_log_impl(&dword_1C9967000, v15, OS_LOG_TYPE_INFO, "[%p] response_headers: %@", buf, 0x16u);
  }

LABEL_11:
  if (!a3)
  {
    -[FMCommandBase response](self, "response");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "statusCode");

    if (v17 == 330)
    {
      -[FMCommandBase request](self, "request");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "URL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "host");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[FMCommandBase valueForResponseHTTPHeader:](self, "valueForResponseHTTPHeader:", CFSTR("X-Apple-Mme-Host"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "length") && objc_msgSend(v21, "length"))
      {
        if (-[FMCommandBase redirectCount](self, "redirectCount") <= 4)
        {
          -[FMCommandBase setRedirectCount:](self, "setRedirectCount:", -[FMCommandBase redirectCount](self, "redirectCount") + 1);
          if (!self->_originalHostname)
          {
            v33 = (NSString *)objc_msgSend(v20, "copy");
            originalHostname = self->_originalHostname;
            self->_originalHostname = v33;

          }
          v35 = (NSString *)objc_msgSend(v21, "copy");
          redirectedHostname = self->_redirectedHostname;
          self->_redirectedHostname = v35;

          -[FMCommandBase setHost:](self, "setHost:", v21);
          v39[0] = CFSTR("originalHostname");
          v39[1] = CFSTR("redirectedHostname");
          v40[0] = v20;
          v40[1] = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "postNotificationName:object:userInfo:", FMCommandRedirectedNotification, self, v37);

          -[FMCommandBase sendRequest](self, "sendRequest");
          v23 = 0;
          goto LABEL_23;
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -1007, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[FMCommandBase setError:](self, "setError:", v22);

        -[FMCommandBase cancel](self, "cancel");
      }
      else
      {
        LogCategory_ServerError();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[FMCommandBase isTransactionCompleteWithError:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);

      }
      v23 = 1;
LABEL_23:

      return v23;
    }
  }
  return 1;
}

- (NSHTTPURLResponse)response
{
  return self->_response;
}

- (void)sendRequest
{
  OUTLINED_FUNCTION_0(&dword_1C9967000, a1, a3, "FMCommandBase could not sendRequest. Session is nil.", a5, a6, a7, a8, 0);
}

- (double)timeout
{
  return self->_timeout;
}

- (BOOL)commandTaskComplete
{
  return self->_commandTaskComplete;
}

- (BOOL)wasRedirected
{
  return self->_originalHostname && self->_redirectedHostname != 0;
}

- (NSURLSessionDataTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (void)setServerInteractionController:(id)a3
{
  objc_storeWeak((id *)&self->_serverInteractionController, a3);
}

- (void)setScheme:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void)setResponseData:(id)a3
{
  objc_storeStrong((id *)&self->_responseData, a3);
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void)setHost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 256);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void)setCommandTaskComplete:(BOOL)a3
{
  self->_commandTaskComplete = a3;
}

- (FMServerInteractionController)serverInteractionController
{
  return (FMServerInteractionController *)objc_loadWeakRetained((id *)&self->_serverInteractionController);
}

- (NSString)scheme
{
  return self->_scheme;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (NSNumber)port
{
  return self->_port;
}

- (NSString)host
{
  return self->_host;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 256, 1);
}

- (NSURLConnection)connection
{
  return self->_connection;
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  -[FMCommandBase task](self, "task");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)FMCommandBase;
  -[FMCommandBase cancel](&v4, sel_cancel);
}

- (BOOL)isConcurrent
{
  return 1;
}

- (BOOL)isExecuting
{
  return !-[FMCommandBase commandTaskComplete](self, "commandTaskComplete");
}

void __28__FMCommandBase_sendRequest__block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__FMCommandBase_sendRequest__block_invoke_2;
  v3[3] = &unk_1E82AA508;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  objc_msgSend(WeakRetained, "addOperationWithBlock:", v3);
  objc_destroyWeak(&v4);

}

void __28__FMCommandBase_sendRequest__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    LogCategory_Networking();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "request");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "URL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "timeout");
      v7 = 138412546;
      v8 = v4;
      v9 = 2048;
      v10 = v5;
      _os_log_impl(&dword_1C9967000, v2, OS_LOG_TYPE_DEFAULT, "Transaction %@ timed out after %.1f s", (uint8_t *)&v7, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -1001, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setError:", v6);

    objc_msgSend(WeakRetained, "cancel");
  }

}

uint64_t __28__FMCommandBase_sendRequest__block_invoke_24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dataTaskCompletionHandlerWithData:response:error:", a2, a3, a4);
}

- (void)generateFakeResponse:(id)a3 data:(id)a4 error:(id)a5
{
  -[FMCommandBase _dataTaskCompletionHandlerWithData:response:error:](self, "_dataTaskCompletionHandlerWithData:response:error:", a4, a3, a5);
}

- (id)method
{
  return (id)FMCommandHTTPMethodPost;
}

- (id)path
{
  return CFSTR("/");
}

- (id)body
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "data");
}

- (NSString)originalHostname
{
  return self->_originalHostname;
}

- (NSString)redirectedHostname
{
  return self->_redirectedHostname;
}

- (void)setPort:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (unint64_t)redirectCount
{
  return self->_redirectCount;
}

- (void)setRedirectCount:(unint64_t)a3
{
  self->_redirectCount = a3;
}

- (void)setOriginalHostname:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (void)setRedirectedHostname:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (void)_dataTaskCompletionHandlerWithData:(void *)a1 response:(NSObject *)a2 error:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "task");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 134217984;
  v5 = objc_msgSend(v3, "state");
  _os_log_error_impl(&dword_1C9967000, a2, OS_LOG_TYPE_ERROR, "BUG in NSURLSessionDataTask: self.task.state is %ld in completion handler <rdar://problem/16847465", (uint8_t *)&v4, 0xCu);

}

- (void)isTransactionCompleteWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9967000, a1, a3, "Missing X-Apple-MMe-Host header!", a5, a6, a7, a8, 0);
}

@end

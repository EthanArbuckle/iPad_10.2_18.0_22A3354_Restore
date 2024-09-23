@implementation NSURLSessionTaskLocalHTTPAuthenticator

- (void)getAuthenticationHeadersForTask:(id)a3 task:(id)a4 response:(id)a5 completionHandler:(id)a6
{
  NSObject *v11;
  _QWORD v12[9];
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  NSSet *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v11 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v14 = objc_msgSend(a4, "_loggableDescription");
    v15 = 2112;
    v16 = a5;
    v17 = 2112;
    v18 = -[NSURLSessionTaskHTTPAuthenticator statusCodes](self, "statusCodes");
    _os_log_impl(&dword_183ECA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ local authenticator getting headers for %@ codes %@", buf, 0x20u);
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __106__NSURLSessionTaskLocalHTTPAuthenticator_getAuthenticationHeadersForTask_task_response_completionHandler___block_invoke;
  v12[3] = &unk_1E14FDE58;
  v12[4] = self;
  v12[5] = a4;
  v12[6] = a3;
  v12[7] = a5;
  v12[8] = a6;
  -[NSURLSession runDelegateBlock:]((uint64_t)a3, v12);
}

- (NSURLSessionTaskLocalHTTPAuthenticator)initWithSessionAuthenticator:(id)a3 statusCodes:(id)a4
{
  NSURLSessionTaskLocalHTTPAuthenticator *v7;
  NSURLSessionTaskLocalHTTPAuthenticator *v8;
  objc_super v10;
  uint8_t buf[16];

  if (!a3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "NSURLSessionAppleIDContext required.", buf, 2u);
  }
  v10.receiver = self;
  v10.super_class = (Class)NSURLSessionTaskLocalHTTPAuthenticator;
  v7 = -[NSURLSessionTaskHTTPAuthenticator initWithStatusCodes:](&v10, sel_initWithStatusCodes_, a4);
  v8 = v7;
  if (v7)
    -[NSURLSessionTaskLocalHTTPAuthenticator setExternalAuthenticator:](v7, "setExternalAuthenticator:", a3);
  return v8;
}

- (void)setExternalAuthenticator:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void)dealloc
{
  objc_super v3;

  -[NSURLSessionTaskLocalHTTPAuthenticator setExternalAuthenticator:](self, "setExternalAuthenticator:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NSURLSessionTaskLocalHTTPAuthenticator;
  -[NSURLSessionTaskHTTPAuthenticator dealloc](&v3, sel_dealloc);
}

uint64_t __106__NSURLSessionTaskLocalHTTPAuthenticator_getAuthenticationHeadersForTask_task_response_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, int, uint64_t);
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, int, uint64_t, uint64_t);
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "externalAuthenticator");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v2 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(*(id *)(a1 + 40), "_loggableDescription");
      *(_DWORD *)buf = 138543362;
      v23 = v3;
      _os_log_impl(&dword_183ECA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ local authenticator will provide headers or request", buf, 0xCu);
    }
    v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "externalAuthenticator");
    v6 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __106__NSURLSessionTaskLocalHTTPAuthenticator_getAuthenticationHeadersForTask_task_response_completionHandler___block_invoke_26;
    v19 = &unk_1E14FDE08;
    v7 = *(_QWORD *)(a1 + 64);
    v20 = v6;
    v21 = v7;
    return objc_msgSend(v4, "URLSession:task:getAppleIDRequestOrHeadersForResponse:completionHandler:", v5);
  }
  else
  {
    v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "externalAuthenticator");
    v11 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __106__NSURLSessionTaskLocalHTTPAuthenticator_getAuthenticationHeadersForTask_task_response_completionHandler___block_invoke_27;
    v15 = &unk_1E14FDE30;
    return objc_msgSend(v9, "URLSession:task:getAppleIDHeadersForResponse:completionHandler:", v10, MEMORY[0x1E0C809B0], 3221225472, __106__NSURLSessionTaskLocalHTTPAuthenticator_getAuthenticationHeadersForTask_task_response_completionHandler___block_invoke_27, &unk_1E14FDE30, v11, *(_QWORD *)(a1 + 64));
  }
}

- (NSURLSessionAppleIDContext)externalAuthenticator
{
  return (NSURLSessionAppleIDContext *)objc_getProperty(self, a2, 16, 1);
}

uint64_t __106__NSURLSessionTaskLocalHTTPAuthenticator_getAuthenticationHeadersForTask_task_response_completionHandler___block_invoke_26(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  NSObject *v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v8 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "_loggableDescription");
    v11 = 138544131;
    v12 = v9;
    v13 = 1024;
    v14 = a2;
    v15 = 2117;
    v16 = a4;
    v17 = 2117;
    v18 = a3;
    _os_log_impl(&dword_183ECA000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ authenticator finished cont %d req %{sensitive}@ headers %{sensitive}@", (uint8_t *)&v11, 0x26u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __106__NSURLSessionTaskLocalHTTPAuthenticator_getAuthenticationHeadersForTask_task_response_completionHandler___block_invoke_27(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v6 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "_loggableDescription");
    v9 = 138543875;
    v10 = v7;
    v11 = 1024;
    v12 = a2;
    v13 = 2117;
    v14 = a3;
    _os_log_impl(&dword_183ECA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ authenticator finished cont %d headers %{sensitive}@", (uint8_t *)&v9, 0x1Cu);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end

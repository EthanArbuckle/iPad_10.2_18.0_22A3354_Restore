@implementation NSURLSessionTaskBackgroundHTTPAuthenticator

- (NSURLSessionTaskBackgroundHTTPAuthenticator)initWithStatusCodes:(id)a3
{
  objc_super v6;
  uint8_t buf[16];

  if (!a3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "HTTPStatusCodes required.", buf, 2u);
  }
  v6.receiver = self;
  v6.super_class = (Class)NSURLSessionTaskBackgroundHTTPAuthenticator;
  return -[NSURLSessionTaskHTTPAuthenticator initWithStatusCodes:](&v6, sel_initWithStatusCodes_, a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NSURLSessionTaskBackgroundHTTPAuthenticator;
  -[NSURLSessionTaskHTTPAuthenticator dealloc](&v2, sel_dealloc);
}

- (void)getAuthenticationHeadersForTask:(id)a3 task:(id)a4 response:(id)a5 completionHandler:(id)a6
{
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v14[6];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  NSSet *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v10 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v16 = objc_msgSend(a4, "_loggableDescription");
    v17 = 2112;
    v18 = a5;
    v19 = 2112;
    v20 = -[NSURLSessionTaskHTTPAuthenticator statusCodes](self, "statusCodes");
    _os_log_impl(&dword_183ECA000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ background authenticator getting headers for %@ codes %@", buf, 0x20u);
  }
  if (-[NSURLSessionTaskHTTPAuthenticator statusCodes](self, "statusCodes"))
  {
    if (a4)
    {
      v11 = *((_QWORD *)a4 + 88);
      if (!v11)
        v11 = *((_QWORD *)a4 + 87);
    }
    else
    {
      v11 = 0;
    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __111__NSURLSessionTaskBackgroundHTTPAuthenticator_getAuthenticationHeadersForTask_task_response_completionHandler___block_invoke;
    v14[3] = &unk_1E14FDE08;
    v14[4] = a4;
    v14[5] = a6;
    -[__NSCFURLSessionDelegateWrapper task:_getAuthHeadersForResponse:completionHandler:](v11, a4, a5, v14);
  }
  else
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v12 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(a4, "_loggableDescription");
      *(_DWORD *)buf = 138543362;
      v16 = v13;
      _os_log_impl(&dword_183ECA000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ background authenticator does not have status codes, skipping callback", buf, 0xCu);
    }
    (*((void (**)(id, uint64_t, _QWORD, _QWORD))a6 + 2))(a6, 1, 0, 0);
  }
}

uint64_t __111__NSURLSessionTaskBackgroundHTTPAuthenticator_getAuthenticationHeadersForTask_task_response_completionHandler___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
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

@end

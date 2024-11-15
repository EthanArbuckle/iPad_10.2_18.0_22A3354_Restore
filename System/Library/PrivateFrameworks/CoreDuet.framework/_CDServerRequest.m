@implementation _CDServerRequest

- (_CDServerRequest)init
{
  _CDServerRequest *v2;
  NSOperationQueue *v3;
  NSOperationQueue *sessionQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_CDServerRequest;
  v2 = -[_CDServerRequest init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    sessionQueue = v2->_sessionQueue;
    v2->_sessionQueue = v3;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_sessionQueue, "setMaxConcurrentOperationCount:", 1);
  }
  return v2;
}

- (void)_newDefaultSession
{
  void *v1;
  void *v2;
  SEL v3;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", v2, v1, objc_getProperty(v1, v3, 16, 1));
    v1 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (id)_requestForMethod:(uint64_t)a3 URI:(void *)a4 queryItems:(void *)a5 headers:(void *)a6 body:(double)a7 timeoutInterval:
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;

  if (a1)
  {
    v12 = (void *)MEMORY[0x1E0C99E98];
    v13 = a6;
    v14 = a5;
    v15 = a4;
    v16 = a2;
    objc_msgSend(v12, "URLWithString:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v17, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setQueryItems:", v15);

    objc_msgSend(v18, "URL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:cachePolicy:timeoutInterval:", v19, 1, a7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setHTTPMethod:", v16);

    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __82___CDServerRequest__requestForMethod_URI_queryItems_headers_body_timeoutInterval___block_invoke;
    v23[3] = &unk_1E26E43C8;
    v21 = v20;
    v24 = v21;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v23);

    objc_msgSend(v21, "setHTTPBody:", v13);
  }
  else
  {
    v21 = 0;
  }
  return v21;
}

- (id)startDataTaskWithURI:(void *)a3 headers:(void *)a4 timeoutInterval:(double)a5 responseHandler:
{
  id v5;
  id v9;
  void *v10;
  SEL v11;
  SEL v12;
  const char *v13;
  void *v14;
  SEL v15;
  SEL v16;
  void *v17;
  SEL v18;
  id v19;
  SEL v20;

  v5 = a1;
  if (a1)
  {
    v9 = a4;
    -[_CDServerRequest _requestForMethod:URI:queryItems:headers:body:timeoutInterval:]((uint64_t)v5, CFSTR("GET"), a2, 0, a3, 0, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(v5, v11, v10, 32);

    objc_setProperty_atomic_copy(v5, v12, v9, 8);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      -[_CDServerRequest startDataTaskWithURI:headers:timeoutInterval:responseHandler:].cold.1(v5, v13);
    v14 = -[_CDServerRequest _newDefaultSession](v5);
    objc_setProperty_atomic(v5, v15, v14, 24);

    objc_msgSend(objc_getProperty(v5, v16, 24, 1), "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeoutIntervalForResource");
    objc_msgSend(v17, "setTimeoutIntervalForRequest:");
    v19 = objc_getProperty(v5, v18, 24, 1);
    objc_msgSend(v19, "dataTaskWithRequest:", objc_getProperty(v5, v20, 32, 1));
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "resume");
  }
  return v5;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  const char *v5;
  void *v6;
  id Property;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    Property = objc_getProperty(self, v5, 32, 1);
  else
    Property = 0;
  objc_msgSend(Property, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p>{ url=%@ }"), v6, self, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  id Property;
  NSObject *v10;
  id v11;
  id v12;
  SEL v13;
  const char *v14;
  id v15;
  const char *v16;

  v6 = a3;
  v8 = a4;
  if (self)
    Property = objc_getProperty(self, v7, 24, 1);
  else
    Property = 0;
  if (Property == v6)
  {
    if (self)
    {
      v12 = objc_getProperty(self, v7, 8, 1);
      objc_setProperty_atomic_copy(self, v13, 0, 8);
      if (v12)
        (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v12 + 2))(v12, 0, 0, 0, v8);
      v15 = objc_getProperty(self, v14, 24, 1);
    }
    else
    {
      v12 = 0;
      v15 = 0;
    }
    objc_msgSend(v15, "invalidateAndCancel");
    if (self)
      objc_setProperty_atomic(self, v16, 0, 24);

  }
  else
  {
    v10 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[_CDServerRequest URLSession:didBecomeInvalidWithError:].cold.1((uint64_t)v6, (const char *)(self == 0), self);

  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  id v11;
  id Property;
  NSObject *v13;
  id v14;
  const char *v15;
  SEL v16;
  void (**v17)(id, void *, id, id, _QWORD);
  SEL v18;
  void *v19;
  SEL v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v11 = a5;
  if (self)
    Property = objc_getProperty(self, v10, 24, 1);
  else
    Property = 0;
  if (Property == v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      -[_CDServerRequest URLSession:downloadTask:didFinishDownloadingToURL:].cold.2();
    objc_msgSend(v9, "response");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (!((self == 0) | ((objc_opt_isKindOfClass() & 1) == 0)))
    {
      objc_setProperty_atomic(self, v15, v13, 40);
      v17 = (void (**)(id, void *, id, id, _QWORD))objc_getProperty(self, v16, 8, 1);
      objc_setProperty_atomic_copy(self, v18, 0, 8);
      if (v17)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "taskIdentifier"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_getProperty(self, v20, 40, 1);
        v17[2](v17, v19, v21, v11, 0);

      }
    }
  }
  else
  {
    v13 = MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[_CDServerRequest URLSession:didBecomeInvalidWithError:].cold.1((uint64_t)v8, (const char *)(self == 0), self);
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v9;
  const char *v10;
  id v11;
  id Property;
  NSObject *v13;
  id v14;

  v9 = a3;
  v11 = a4;
  if (self)
    Property = objc_getProperty(self, v10, 24, 1);
  else
    Property = 0;
  if (Property == v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      -[_CDServerRequest URLSession:task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:].cold.1();
  }
  else
  {
    v13 = MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[_CDServerRequest URLSession:didBecomeInvalidWithError:].cold.1((uint64_t)v9, (const char *)(self == 0), self);

  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  id v11;
  id Property;
  NSObject *v13;
  id v14;
  _BOOL4 v15;
  const char *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  char isKindOfClass;
  const char *v24;
  SEL v25;
  const char *v26;
  void *v27;
  SEL v28;
  id v29;
  SEL v30;
  id v31;
  id v32;
  const char *v33;

  v8 = a3;
  v9 = a4;
  v11 = a5;
  if (self)
    Property = objc_getProperty(self, v10, 24, 1);
  else
    Property = 0;
  if (Property != v8)
  {
    v13 = MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[_CDServerRequest URLSession:task:didCompleteWithError:].cold.3((uint64_t)v8, (const char *)(self != 0), self);
    goto LABEL_28;
  }
  v15 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
  if (!v11)
  {
    if (v15)
    {
      -[_CDServerRequest URLSession:task:didCompleteWithError:].cold.1();
      if (!self)
        goto LABEL_13;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (!v15)
  {
LABEL_11:
    if (!self)
      goto LABEL_13;
    goto LABEL_12;
  }
  -[_CDServerRequest URLSession:task:didCompleteWithError:].cold.2();
  if (!self)
    goto LABEL_13;
LABEL_12:
  if (!objc_getProperty(self, v16, 32, 1))
  {
LABEL_13:
    objc_msgSend(v9, "originalRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "mutableCopy");
    if (self)
      objc_setProperty_atomic(self, v19, v20, 32);

  }
  if (!self || !objc_getProperty(self, v17, 40, 1))
  {
    objc_msgSend(v9, "response");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if (self && (isKindOfClass & 1) != 0)
      objc_setProperty_atomic(self, v24, v22, 40);

  }
  if (self)
  {
    v13 = objc_getProperty(self, v21, 8, 1);
    objc_setProperty_atomic_copy(self, v25, 0, 8);
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "taskIdentifier"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_getProperty(self, v28, 40, 1);
      v31 = objc_getProperty(self, v30, 48, 1);
      ((void (*)(NSObject *, void *, id, id, id))v13[2].isa)(v13, v27, v29, v31, v11);

    }
    v32 = objc_getProperty(self, v26, 24, 1);
  }
  else
  {
    v13 = 0;
    v32 = 0;
  }
  objc_msgSend(v32, "invalidateAndCancel");
  if (self)
    objc_setProperty_atomic(self, v33, 0, 24);
LABEL_28:

}

+ (void)addHTTPIfModifiedSinceToHeaders:(void *)a3 date:
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v4 = a3;
  objc_opt_self();
  if (v8 && v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v5, "setDateFormat:", CFSTR("EEE, dd MMM yyyy HH:mm:ss zzz"));
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimeZone:", v6);

    objc_msgSend(v5, "stringFromDate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("If-Modified-Since"));

  }
}

+ (id)getHTTPModifiedSinceFromHeaders:(uint64_t)a1
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_opt_self();
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Last-Modified"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v4, "setDateFormat:", CFSTR("EEE, dd MMM yyyy HH:mm:ss zzz"));
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTimeZone:", v5);

    objc_msgSend(v4, "dateFromString:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_httpResponse, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong(&self->_responseHandler, 0);
}

- (void)startDataTaskWithURI:(void *)a1 headers:(const char *)a2 timeoutInterval:responseHandler:.cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_7_4(a1, a2, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, MEMORY[0x1E0C81028], v2, "Will start data task with request: %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_5();
}

- (void)URLSession:(void *)a3 didBecomeInvalidWithError:.cold.1(uint64_t a1, const char *a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  if ((a2 & 1) == 0)
    OUTLINED_FUNCTION_3_4(a3, a2);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_5(&dword_18DDBE000, MEMORY[0x1E0C81028], v3, "Delegate session %@ is NOT the same as our session %@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_1();
}

- (void)URLSession:(void *)a1 downloadTask:(uint64_t)a2 didFinishDownloadingToURL:(uint8_t *)buf .cold.1(void *a1, uint64_t a2, uint8_t *buf)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unexpected exception processing download of '%@': %@", buf, 0x16u);

}

- (void)URLSession:downloadTask:didFinishDownloadingToURL:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, MEMORY[0x1E0C81028], v0, "%@ finished download", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

- (void)URLSession:task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v3 = 2048;
  v4 = v0;
  v5 = 2048;
  v6 = v1;
  _os_log_debug_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Session task %@ did send data: %lld of %lld", v2, 0x20u);
}

- (void)URLSession:task:didCompleteWithError:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, MEMORY[0x1E0C81028], v0, "%@ finished", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

- (void)URLSession:task:didCompleteWithError:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_5(&dword_18DDBE000, MEMORY[0x1E0C81028], v0, "%@ finished with error %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

- (void)URLSession:(uint64_t)a1 task:(const char *)a2 didCompleteWithError:(void *)a3 .cold.3(uint64_t a1, const char *a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  if ((a2 & 1) != 0)
    OUTLINED_FUNCTION_3_4(a3, a2);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_5(&dword_18DDBE000, MEMORY[0x1E0C81028], v3, "Delegate session %@ is NOT the same as our session %@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_1();
}

@end

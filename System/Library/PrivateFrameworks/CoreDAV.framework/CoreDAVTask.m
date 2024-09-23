@implementation CoreDAVTask

+ (unsigned)uniqueQueryID
{
  return ++uniqueQueryID_uniqueQueryID;
}

- (CoreDAVTask)initWithURL:(id)a3
{
  id v5;
  CoreDAVTask *v6;
  CoreDAVTask *v7;
  uint64_t v8;
  NSString *uniqueID;
  void *v10;
  id WeakRetained;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  CoreDAVTask *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  CoreDAVTask *v30;
  __int16 v31;
  NSString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CoreDAVTask;
  v6 = -[CoreDAVTask init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v7->_depth = 0;
    v7->_timeoutInterval = 240.0;
    v7->_responseStatusCode = -1;
    v7->_allowAutomaticRedirects = 1;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), +[CoreDAVTask uniqueQueryID](CoreDAVTask, "uniqueQueryID"));
    v8 = objc_claimAutoreleasedReturnValue();
    uniqueID = v7->_uniqueID;
    v7->_uniqueID = (NSString *)v8;

    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&v7->_accountInfoProvider);
    objc_msgSend(v10, "logHandleForAccountInfoProvider:", WeakRetained);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = v12;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _sessionForLogging](v7, "_sessionForLogging");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _requestForLogging](v7, "_requestForLogging");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v7->_uniqueID;
        *(_DWORD *)buf = 138413570;
        v22 = v15;
        v23 = 2048;
        v24 = v7;
        v25 = 2048;
        v26 = v16;
        v27 = 2048;
        v28 = v17;
        v29 = 2112;
        v30 = v7;
        v31 = 2114;
        v32 = v18;
        _os_log_impl(&dword_209602000, v13, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Task initting %@ with ID %{public}@", buf, 0x3Eu);

      }
    }

  }
  return v7;
}

- (void)dealloc
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  CoreDAVTask *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logHandleForAccountInfoProvider:", 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v20 = self;
    v21 = 2114;
    v22 = v8;
    _os_log_impl(&dword_209602000, v6, OS_LOG_TYPE_INFO, "Task %p of class %{public}@ deallocing", buf, 0x16u);

  }
  if (!self->_finished)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVTask.m"), 193, CFSTR("<%@ %p>: Tasks must be finished before deallocation"), v11, self);

  }
  if (self->_session)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVTask.m"), 194, CFSTR("<%@ %p>: Connection better have been nil in our dealloc: %p"), v14, self, self->_session);

  }
  if (self->_error)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVTask.m"), 195, CFSTR("<%@ %p>: Error better have been nil in our dealloc: %p"), v17, self, self->_error);

  }
  v18.receiver = self;
  v18.super_class = (Class)CoreDAVTask;
  -[CoreDAVTask dealloc](&v18, sel_dealloc);
}

- (NSString)description
{
  id v3;
  void *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  objc_super v12;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v12.receiver = self;
  v12.super_class = (Class)CoreDAVTask;
  -[CoreDAVTask description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@ "), v4);

  if (self->_request)
    objc_msgSend(v3, "appendFormat:", CFSTR("| Request: [%@]"), self->_request);
  if (self->_session)
    objc_msgSend(v3, "appendFormat:", CFSTR("| Connection: [%@]"), self->_session);
  if (self->_task)
    objc_msgSend(v3, "appendFormat:", CFSTR("| Connection: [%@]"), self->_task);
  if (self->_response)
    objc_msgSend(v3, "appendFormat:", CFSTR("| Response: [%@]"), self->_response);
  if (self->_error)
    objc_msgSend(v3, "appendFormat:", CFSTR("| Error: [%@]"), self->_error);
  v5 = "[RequestSent]";
  v6 = "";
  if (!self->_didSendRequest)
    v5 = "";
  if (self->_didReceiveResponse)
    v7 = "[ReceivedResponse]";
  else
    v7 = "";
  v8 = "[ReceivedData]";
  if (!self->_didReceiveData)
    v8 = "";
  if (self->_didFinishLoading)
    v9 = "[FinishedLoading]";
  else
    v9 = "";
  if (self->_didFailWithError)
    v10 = "[FailedWithError]";
  else
    v10 = "";
  if (self->_didCancel)
    v6 = "[Cancelled]";
  objc_msgSend(v3, "appendFormat:", CFSTR("| Status: [%s%s%s%s%s%s]"), v5, v7, v8, v9, v10, v6);
  objc_msgSend(v3, "appendFormat:", CFSTR("]"));
  return (NSString *)v3;
}

- (id)redactedDescription
{
  id v3;
  void *v4;
  NSHTTPURLResponse *response;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  objc_super v13;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v13.receiver = self;
  v13.super_class = (Class)CoreDAVTask;
  -[CoreDAVTask description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@ "), v4);

  response = self->_response;
  if (response)
    objc_msgSend(v3, "appendFormat:", CFSTR("| Response Status Code: [%ld]"), -[NSHTTPURLResponse statusCode](response, "statusCode"));
  if (self->_error)
    objc_msgSend(v3, "appendFormat:", CFSTR("| Error: [%@]"), self->_error);
  v6 = CFSTR("[RequestSent]");
  v7 = &stru_24C1DBD70;
  if (!self->_didSendRequest)
    v6 = &stru_24C1DBD70;
  if (self->_didReceiveResponse)
    v8 = CFSTR("[ReceivedResponse]");
  else
    v8 = &stru_24C1DBD70;
  v9 = CFSTR("[ReceivedData]");
  if (!self->_didReceiveData)
    v9 = &stru_24C1DBD70;
  if (self->_didFinishLoading)
    v10 = CFSTR("[FinishedLoading]");
  else
    v10 = &stru_24C1DBD70;
  if (self->_didFailWithError)
    v11 = CFSTR("[FailedWithError]");
  else
    v11 = &stru_24C1DBD70;
  if (self->_didCancel)
    v7 = CFSTR("[Cancelled]");
  objc_msgSend(v3, "appendFormat:", CFSTR("| Status: [%@%@%@%@%@%@]"), v6, v8, v9, v10, v11, v7);
  objc_msgSend(v3, "appendFormat:", CFSTR("]"));
  return v3;
}

- (NSRunLoop)workRunLoop
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  CoreDAVTask *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[CoreDAVTask taskManager](self, "taskManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CoreDAVTask taskManager](self, "taskManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "workRunLoop");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSRunLoop *)v5;
  }
  else
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    objc_msgSend(v7, "logHandleForAccountInfoProvider:", WeakRetained);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = v9;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138413058;
        v16 = v12;
        v17 = 2048;
        v18 = self;
        v19 = 2048;
        v20 = v13;
        v21 = 2048;
        v22 = v14;
        _os_log_impl(&dword_209602000, v10, OS_LOG_TYPE_ERROR, "[%@ %p, sess %p, request %p] Could not get the Task Manager's work run loop because the task manager is nil. Defaulting to current run loop.", (uint8_t *)&v15, 0x2Au);

      }
    }

    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    return (NSRunLoop *)(id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)httpMethod
{
  return CFSTR("REPORT");
}

- (BOOL)_includeGeneralHeaders
{
  void *v2;
  char v3;

  -[CoreDAVTask httpMethod](self, "httpMethod");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("OPTIONS")) ^ 1;

  return v3;
}

- (id)requestBodyStream
{
  return 0;
}

- (id)requestBody
{
  void *v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  CoreDAVTask *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  objc_msgSend(v3, "logHandleForAccountInfoProvider:", WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138413058;
      v13 = v8;
      v14 = 2048;
      v15 = self;
      v16 = 2048;
      v17 = v9;
      v18 = 2048;
      v19 = v10;
      _os_log_impl(&dword_209602000, v6, OS_LOG_TYPE_ERROR, "[%@ %p, sess %p, request %p] requestBody to be implemented by subclass", (uint8_t *)&v12, 0x2Au);

    }
  }

  return 0;
}

- (id)copyDefaultParserForContentType:(id)a3
{
  return 0;
}

- (BOOL)shouldLogResponseBody
{
  return 1;
}

- (void)loadRequest:(id)a3
{
  id v5;
  void *callbackThread;
  NSThread *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSURLRequest *v14;
  NSURLRequest *request;
  NSURLRequest *v16;
  CoreDAVRequestLogger *v17;
  id WeakRetained;
  CoreDAVRequestLogger *v19;
  CoreDAVRequestLogger *logger;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  BOOL v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  char v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  char v50;
  NSURLSession *v51;
  NSURLSession *session;
  NSURLSessionDataTask *v53;
  NSURLSessionDataTask *task;
  NSDate *v55;
  NSDate *dateConnectionWentOut;
  void *v57;
  id v58;
  void *v59;
  NSObject *v60;
  objc_class *v61;
  void *v62;
  void *v63;
  void *v64;
  NSURLRequest *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  NSThread *v77;
  void *v78;
  _QWORD v79[5];
  id v80;
  _QWORD v81[4];
  id v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  _BYTE buf[24];
  void *v88;
  _BYTE v89[10];
  __int16 v90;
  NSURLRequest *v91;
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[CoreDAVTask tearDownResources](self, "tearDownResources");
  v78 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVTask.m"), 282, &stru_24C1DBD70);

  }
  if (self->_session)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVTask.m"), 283, &stru_24C1DBD70);

  }
  if (self->_task)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVTask.m"), 284, &stru_24C1DBD70);

  }
  if (self->_response)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVTask.m"), 285, &stru_24C1DBD70);

  }
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v76, "isMainThread"))
  {
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = 0;
  }
  else
  {
    v77 = v76;
    v74 = 0;
  }
  if (!self->_callbackThreadSet)
  {
    self->_callbackThreadSet = 1;
    v7 = v77;
    callbackThread = self->_callbackThread;
    self->_callbackThread = v7;
    goto LABEL_16;
  }
  if (v77 != self->_callbackThread)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    callbackThread = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(callbackThread, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVTask.m"), 306, CFSTR("_callbackThread (%@) doesn't match current thread (%@)"), self->_callbackThread, v77);
LABEL_16:

  }
  -[CoreDAVTask accountInfoProvider](self, "accountInfoProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0
    && (-[CoreDAVTask accountInfoProvider](self, "accountInfoProvider"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "getAppleIDSession"),
        v75 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v75))
  {
    v11 = (void *)objc_msgSend(v78, "mutableCopy");
    objc_msgSend(v75, "appleIDHeadersForRequest:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = MEMORY[0x24BDAC760];
    v81[1] = 3221225472;
    v81[2] = __27__CoreDAVTask_loadRequest___block_invoke;
    v81[3] = &unk_24C1D9CC0;
    v82 = v11;
    v13 = v11;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v81);
    objc_msgSend(v13, "ak_addDeviceUDIDHeader");
    objc_msgSend(v13, "ak_addClientInfoHeader");
    v14 = (NSURLRequest *)objc_msgSend(v13, "copy");
    request = self->_request;
    self->_request = v14;

  }
  else
  {
    v16 = (NSURLRequest *)objc_msgSend(v78, "copy");
    v75 = 0;
    v12 = self->_request;
    self->_request = v16;
  }

  v17 = [CoreDAVRequestLogger alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  v19 = -[CoreDAVRequestLogger initWithProvider:](v17, "initWithProvider:", WeakRetained);
  logger = self->_logger;
  self->_logger = v19;

  -[CoreDAVTask setResponseBodyParser:](self, "setResponseBodyParser:", 0);
  -[NSURLRequest URL](self->_request, "URL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "absoluteString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "length");

  -[NSURLRequest HTTPBody](self->_request, "HTTPBody");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "length");

  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  objc_msgSend(v26, "logHandleForAccountInfoProvider:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = v28;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v31;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2048;
      v88 = v32;
      *(_WORD *)v89 = 2048;
      *(_QWORD *)&v89[2] = v33;
      v90 = 2048;
      v91 = (NSURLRequest *)(v25 + v23);
      _os_log_impl(&dword_209602000, v29, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Size of outgoing, unencrypted request: %ld", buf, 0x34u);

    }
  }

  -[CoreDAVRequestLogger logCoreDAVRequest:withTaskIdentifier:](self->_logger, "logCoreDAVRequest:withTaskIdentifier:", self->_request, self->_uniqueID);
  -[CoreDAVTask _logSantizedRequest:withTaskID:](self, "_logSantizedRequest:withTaskID:", self->_request, self->_uniqueID);
  -[CoreDAVTask url](self, "url");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "host");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v35, "hasSuffix:", CFSTR("simulated.calendar.apple.com")))
  {
    v36 = CalDAVServerSimulatorLibraryCore() == 0;

    if (!v36)
    {
      self->_simulated = 1;
      v83 = 0;
      v84 = &v83;
      v85 = 0x2050000000;
      v37 = (void *)getCalDAVServerSimulatorClass_softClass;
      v86 = getCalDAVServerSimulatorClass_softClass;
      v38 = MEMORY[0x24BDAC760];
      if (!getCalDAVServerSimulatorClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getCalDAVServerSimulatorClass_block_invoke;
        v88 = &unk_24C1D9E50;
        *(_QWORD *)v89 = &v83;
        __getCalDAVServerSimulatorClass_block_invoke((uint64_t)buf);
        v37 = (void *)v84[3];
      }
      v39 = objc_retainAutorelease(v37);
      _Block_object_dispose(&v83, 8);
      objc_msgSend(v39, "simulatorForTask:", self);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "URL");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "user");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask setResponseStatusCode:](self, "setResponseStatusCode:", objc_msgSend(v40, "simulateTask:as:", self, v42));

      if (-[CoreDAVTask responseStatusCode](self, "responseStatusCode") >= 200
        && -[CoreDAVTask responseStatusCode](self, "responseStatusCode") < 300)
      {
        v43 = 0;
      }
      else
      {
        v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("CoreDAVHTTPStatusErrorDomain"), -[CoreDAVTask responseStatusCode](self, "responseStatusCode"), 0);
      }
      -[CoreDAVTask workRunLoop](self, "workRunLoop");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask workRunLoop](self, "workRunLoop");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      CDVRunLoopModesToPerformDelayedSelectorsInFromRunLoop(v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v79[0] = v38;
      v79[1] = 3221225472;
      v79[2] = __27__CoreDAVTask_loadRequest___block_invoke_80;
      v79[3] = &unk_24C1D9AB8;
      v79[4] = self;
      v80 = v43;
      v66 = v43;
      objc_msgSend(v67, "performInModes:block:", v69, v79);

LABEL_47:
      goto LABEL_48;
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x24BDB74B8], "defaultSessionConfiguration");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setURLCache:", 0);
  v44 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  v45 = objc_opt_respondsToSelector();

  if ((v45 & 1) != 0)
  {
    v46 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    objc_msgSend(v46, "customConnectionProperties");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVTask _assignConnectionProperties:toSessionConfiguration:](self, "_assignConnectionProperties:toSessionConfiguration:", v47, v40);

  }
  v48 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v49 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    v50 = objc_msgSend(v49, "handleShouldUseCredentialStorage");

    if ((v50 & 1) == 0)
      objc_msgSend(v40, "setURLCredentialStorage:", 0);
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x24BDB74B0], "sessionWithConfiguration:delegate:delegateQueue:", v40, self, v74);
  v51 = (NSURLSession *)objc_claimAutoreleasedReturnValue();
  session = self->_session;
  self->_session = v51;

  -[NSURLSession dataTaskWithRequest:](self->_session, "dataTaskWithRequest:", self->_request);
  v53 = (NSURLSessionDataTask *)objc_claimAutoreleasedReturnValue();
  task = self->_task;
  self->_task = v53;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v55 = (NSDate *)objc_claimAutoreleasedReturnValue();
  dateConnectionWentOut = self->_dateConnectionWentOut;
  self->_dateConnectionWentOut = v55;

  -[NSURLSessionDataTask resume](self->_task, "resume");
  if (!self->_task)
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    objc_msgSend(v57, "logHandleForAccountInfoProvider:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (v59)
    {
      v60 = v59;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = (objc_class *)objc_opt_class();
        NSStringFromClass(v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = self->_request;
        *(_DWORD *)buf = 138413314;
        *(_QWORD *)&buf[4] = v62;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2048;
        v88 = v63;
        *(_WORD *)v89 = 2048;
        *(_QWORD *)&v89[2] = v64;
        v90 = 2112;
        v91 = v65;
        _os_log_impl(&dword_209602000, v60, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Error creating task with request %@", buf, 0x34u);

      }
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1308], -1, 0);
    v66 = (id)objc_claimAutoreleasedReturnValue();
    -[CoreDAVTask finishCoreDAVTaskWithError:](self, "finishCoreDAVTaskWithError:", v66);
    goto LABEL_47;
  }
LABEL_48:

}

uint64_t __27__CoreDAVTask_loadRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

uint64_t __27__CoreDAVTask_loadRequest___block_invoke_80(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishCoreDAVTaskWithError:", *(_QWORD *)(a1 + 40));
}

- (void)_assignConnectionProperties:(id)a3 toSessionConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  CoreDAVTask *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  __int128 v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v26;
    v13 = *MEMORY[0x24BDB76F0];
    v24 = *MEMORY[0x24BDB77C0];
    *(_QWORD *)&v10 = 138543362;
    v21 = v10;
    v22 = *MEMORY[0x24BDB76F0];
    v23 = v8;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v15, v21);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[CoreDAVTask _assignConnectionProperties:toSessionConfiguration:](self, "_assignConnectionProperties:toSessionConfiguration:", v16, v7);
        }
        else if (objc_msgSend(v15, "isEqualToString:", v13))
        {
          objc_msgSend(v7, "set_sourceApplicationSecondaryIdentifier:", v16);
        }
        else if (objc_msgSend(v15, "isEqualToString:", v24))
        {
          objc_msgSend(v7, "set_sourceApplicationBundleIdentifier:", v16);
        }
        else
        {
          v17 = self;
          +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "logHandleForAccountInfoProvider:", 0);
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v19 && os_log_type_enabled(v19, (os_log_type_t)6u))
          {
            *(_DWORD *)buf = v21;
            v30 = v15;
            _os_log_impl(&dword_209602000, v20, (os_log_type_t)6u, "Connection property: %{public}@ is not set", buf, 0xCu);
          }

          self = v17;
          v13 = v22;
          v8 = v23;
        }

      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v11);
  }

}

- (void)_logSantizedRequest:(id)a3 withTaskID:(id)a4
{
  id v5;
  void *v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *uniqueID;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  CoreDAVTask *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  NSString *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  objc_msgSend(v6, "logHandleForAccountInfoProvider:", WeakRetained);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      uniqueID = self->_uniqueID;
      objc_msgSend(v5, "HTTPMethod");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v5, "URL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "scheme");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "URL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "host");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@://%@"), v13, v14);
      *(_DWORD *)buf = 138413826;
      v23 = v20;
      v24 = 2048;
      v25 = self;
      v26 = 2048;
      v27 = v19;
      v28 = 2048;
      v29 = v11;
      v30 = 2114;
      v31 = uniqueID;
      v32 = 2114;
      v33 = v16;
      v34 = 2114;
      v35 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v35;
      _os_log_impl(&dword_209602000, v9, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Performing Task with ID %{public}@. Method:: %{public}@ RequestURL:: %{public}@", buf, 0x48u);

    }
  }

}

- (void)tearDownResources
{
  NSURLSession *session;
  NSURLSession *v4;
  NSURLSessionDataTask *task;
  NSHTTPURLResponse *response;
  NSURLRequest *request;
  NSError *error;

  session = self->_session;
  if (session)
  {
    self->_didCancel = 1;
    -[NSURLSession invalidateAndCancel](session, "invalidateAndCancel");
    v4 = self->_session;
    self->_session = 0;

  }
  task = self->_task;
  self->_task = 0;

  response = self->_response;
  self->_response = 0;

  request = self->_request;
  self->_request = 0;

  error = self->_error;
  self->_error = 0;

}

- (id)_compressBodyData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  int v6;
  int v7;
  z_stream v9;
  _BYTE v10[8192];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  memset(&v9, 0, sizeof(v9));
  v4 = 0;
  if (!deflateInit2_(&v9, -1, 8, 31, 8, 0, "1.2.12", 112))
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_retainAutorelease(v3);
    v9.avail_in = objc_msgSend(v5, "length", objc_msgSend(v5, "bytes"));
    do
    {
      v9.avail_out = 0x2000;
      v9.next_out = v10;
      v6 = deflate(&v9, 4);
      if (v6 == -2)
        -[CoreDAVTask _compressBodyData:].cold.1();
      v7 = v6;
      objc_msgSend(v4, "appendBytes:length:", v10, 0x2000 - v9.avail_out);
    }
    while (!v9.avail_out);
    if (v9.avail_in)
      -[CoreDAVTask _compressBodyData:].cold.3();
    if (v7 != 1)
      -[CoreDAVTask _compressBodyData:].cold.2();
    deflateEnd(&v9);
  }

  return v4;
}

- (id)_createBodyData
{
  void *v3;
  id WeakRetained;
  id v5;
  uint64_t v6;
  void *v7;

  -[CoreDAVTask requestBody](self, "requestBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_requestIsCompressed = 0;
  if (!self->_compressedRequestFailed)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_8;
    v5 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    if (!objc_msgSend(v5, "shouldCompressRequests"))
    {
LABEL_7:

      goto LABEL_8;
    }
    v6 = objc_msgSend(v3, "length");

    if (v6)
    {
      -[CoreDAVTask _compressBodyData:](self, "_compressBodyData:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = v7;
      if (v7)
      {
        self->_requestIsCompressed = 1;
        WeakRetained = v7;
        v5 = v3;
        v3 = WeakRetained;
        goto LABEL_7;
      }
LABEL_8:

    }
  }
  return v3;
}

- (void)_failImmediately
{
  void *v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  CoreDAVTask *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  objc_msgSend(v3, "logHandleForAccountInfoProvider:", WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138413058;
      v13 = v8;
      v14 = 2048;
      v15 = self;
      v16 = 2048;
      v17 = v9;
      v18 = 2048;
      v19 = v10;
      _os_log_impl(&dword_209602000, v6, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Account says we should fail now, finishing with error", (uint8_t *)&v12, 0x2Au);

    }
  }

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 0, 0);
  -[CoreDAVTask finishCoreDAVTaskWithError:](self, "finishCoreDAVTaskWithError:", v11);

}

- (id)additionalHeaderValues
{
  return 0;
}

- (void)overrideRequestHeader:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *overriddenHeaders;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  CoreDAVTask *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    overriddenHeaders = self->_overriddenHeaders;
    if (!overriddenHeaders)
    {
      v9 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 1);
      v10 = self->_overriddenHeaders;
      self->_overriddenHeaders = v9;

      overriddenHeaders = self->_overriddenHeaders;
    }
    -[NSMutableDictionary setValue:forKey:](overriddenHeaders, "setValue:forKey:", v7, v6);
  }
  else
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    objc_msgSend(v11, "logHandleForAccountInfoProvider:", WeakRetained);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = v13;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138413314;
        v20 = v16;
        v21 = 2048;
        v22 = self;
        v23 = 2048;
        v24 = v17;
        v25 = 2048;
        v26 = v18;
        v27 = 2112;
        v28 = v6;
        _os_log_impl(&dword_209602000, v14, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Ignoring nil value for header: %@", (uint8_t *)&v19, 0x34u);

      }
    }

  }
}

- (unint64_t)cachePolicy
{
  return 1;
}

+ (id)stringFromDepth:(int)a3
{
  if (a3 > 3)
    return 0;
  else
    return (id)qword_24C1D9E70[a3];
}

- (void)performCoreDAVTask
{
  BOOL v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _UNKNOWN **v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_class *v34;
  id v35;
  id v36;
  id v37;
  NSObject *v38;
  id v39;
  objc_class *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  NSObject *v47;
  objc_class *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  int v53;
  _QWORD *v54;
  double v55;
  void *v56;
  id v57;
  void *v58;
  NSObject *v59;
  objc_class *v60;
  id v61;
  id v62;
  id v63;
  NSObject *v64;
  id v65;
  unint64_t v66;
  void *v67;
  id v68;
  id v69;
  int v70;
  void *v71;
  id v72;
  void *v73;
  NSObject *v74;
  objc_class *v75;
  NSObject *v76;
  id v77;
  id v78;
  id v79;
  void *v80;
  id v81;
  void *v82;
  NSObject *v83;
  objc_class *v84;
  NSObject *v85;
  id v86;
  id v87;
  id v88;
  id v89;
  void *v90;
  uint64_t v91;
  NSDictionary *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t i;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  id v100;
  _UNKNOWN **v101;
  void *v102;
  void *v103;
  void *v104;
  int v105;
  id v106;
  char v107;
  id v108;
  int v109;
  void *v110;
  id v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  void *v116;
  void *v117;
  id v118;
  char v119;
  id v120;
  void *v121;
  id v122;
  char v123;
  id v124;
  void *v125;
  id v126;
  char v127;
  id v128;
  void *v129;
  void *v130;
  id v131;
  void *v132;
  NSObject *v133;
  objc_class *v134;
  id v135;
  id v136;
  id v137;
  void *v138;
  void *v139;
  id v140;
  void *v141;
  void *v142;
  id v143;
  void *v144;
  NSObject *v145;
  objc_class *v146;
  id v147;
  void *v148;
  id v149;
  id v150;
  NSObject *v151;
  NSObject *v152;
  __CFArray *v153;
  __CFArray *v154;
  uint64_t v155;
  void *v156;
  id v157;
  void *v158;
  NSObject *v159;
  objc_class *v160;
  id v161;
  id v162;
  id v163;
  id v164;
  char v165;
  id v166;
  uint64_t v167;
  id v168;
  char v169;
  id v170;
  const void *v171;
  void *v172;
  id v173;
  void *v174;
  void *v175;
  void *v176;
  NSObject *v177;
  objc_class *v178;
  id v179;
  id v180;
  id v181;
  uint64_t v182;
  void *v183;
  id v184;
  NSObject *v185;
  objc_class *v186;
  id v187;
  id v188;
  NSObject *v189;
  void *v190;
  id v191;
  const char *v192;
  id v193;
  objc_class *v194;
  NSObject *log;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  id v204;
  NSObject *v205;
  NSObject *v206;
  NSObject *v207;
  NSObject *v208;
  void *v209;
  _QWORD v210[4];
  id v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  _QWORD v216[5];
  id v217;
  uint8_t v218[128];
  uint8_t buf[4];
  id v220;
  __int16 v221;
  CoreDAVTask *v222;
  __int16 v223;
  id v224;
  __int16 v225;
  id v226;
  __int16 v227;
  NSObject *v228;
  __int16 v229;
  CoreDAVTask *v230;
  uint64_t v231;

  v231 = *MEMORY[0x24BDAC8D0];
  v217 = 0;
  v3 = -[CoreDAVTask validate:](self, "validate:", &v217);
  v4 = v217;
  if (v3)
  {
    -[CoreDAVTask url](self, "url");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject user](v5, "user");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
      goto LABEL_26;
    WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    objc_msgSend(WeakRetained, "user");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    objc_msgSend(v11, "logHandleForAccountInfoProvider:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (v13)
      {
        v14 = v13;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          v16 = (id)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
          v205 = v4;
          v17 = (id)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
          v18 = (id)objc_claimAutoreleasedReturnValue();
          v19 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
          objc_msgSend(v19, "user");
          v207 = v5;
          v20 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413570;
          v220 = v16;
          v221 = 2048;
          v222 = self;
          v223 = 2048;
          v224 = v17;
          v225 = 2048;
          v226 = v18;
          v227 = 2112;
          v228 = v20;
          v229 = 2112;
          v230 = self;
          _os_log_impl(&dword_209602000, v14, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] No user on task, adding user %@: %@", buf, 0x3Eu);

          v5 = v207;
          v4 = v205;

        }
      }

      -[NSObject host](v5, "host");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "length"))
      {
        -[NSObject scheme](v5, "scheme");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "length");

        v24 = &off_24C1D9000;
        if (v23)
        {
          v11 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
          objc_msgSend(v11, "user");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject CDVURLWithUser:](v5, "CDVURLWithUser:", v13);
          v25 = v5;
          v5 = objc_claimAutoreleasedReturnValue();
LABEL_24:

          goto LABEL_25;
        }
      }
      else
      {

        v24 = &off_24C1D9000;
      }
      objc_msgSend(v24[66], "sharedLogging");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      objc_msgSend(v11, "logHandleForAccountInfoProvider:", v39);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v25 = v13;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v40 = (objc_class *)objc_opt_class();
          NSStringFromClass(v40);
          v41 = (id)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
          v42 = (id)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
          v43 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v220 = v41;
          v221 = 2048;
          v222 = self;
          v223 = 2048;
          v224 = v42;
          v225 = 2048;
          v226 = v43;
          v227 = 2112;
          v228 = v5;
          _os_log_impl(&dword_209602000, v25, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] URL is invalid (%@)", buf, 0x34u);

        }
LABEL_23:
        v13 = v25;
        goto LABEL_24;
      }
    }
    else if (v13)
    {
      v25 = v13;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        v35 = (id)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
        v36 = (id)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
        v37 = (id)objc_claimAutoreleasedReturnValue();
        v38 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
        *(_DWORD *)buf = 138413570;
        v220 = v35;
        v221 = 2048;
        v222 = self;
        v223 = 2048;
        v224 = v36;
        v225 = 2048;
        v226 = v37;
        v227 = 2112;
        v228 = v38;
        v229 = 2112;
        v230 = self;
        _os_log_impl(&dword_209602000, v25, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] accountInfoProvider [%@] had no username, task was: %@", buf, 0x3Eu);

      }
      goto LABEL_23;
    }
LABEL_25:

LABEL_26:
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    objc_msgSend(v44, "logHandleForAccountInfoProvider:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      v47 = v46;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        v48 = (objc_class *)objc_opt_class();
        NSStringFromClass(v48);
        v49 = (id)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
        v50 = (id)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
        v51 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v220 = v49;
        v221 = 2048;
        v222 = self;
        v223 = 2048;
        v224 = v50;
        v225 = 2048;
        v226 = v51;
        v227 = 2112;
        v228 = v5;
        _os_log_impl(&dword_209602000, v47, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] URL: %@", buf, 0x34u);

      }
    }

    v52 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    v53 = objc_msgSend(v52, "shouldFailAllTasks");

    if (v53)
    {
      -[CoreDAVTask _failImmediately](self, "_failImmediately");
LABEL_136:

      goto LABEL_137;
    }
    v216[0] = MEMORY[0x24BDAC760];
    v216[1] = 3221225472;
    v216[2] = __33__CoreDAVTask_performCoreDAVTask__block_invoke;
    v216[3] = &unk_24C1D9A40;
    v216[4] = self;
    v54 = v216;
    if (performCoreDAVTask_forcedTimeoutPredicate != -1)
      dispatch_once(&performCoreDAVTask_forcedTimeoutPredicate, v54);

    v55 = *(double *)&performCoreDAVTask_forcedTimeoutInterval;
    if (*(double *)&performCoreDAVTask_forcedTimeoutInterval >= 1.0)
      -[CoreDAVTask setTimeoutInterval:](self, "setTimeoutInterval:", *(double *)&performCoreDAVTask_forcedTimeoutInterval);
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    objc_msgSend(v56, "logHandleForAccountInfoProvider:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
    {
      v59 = v58;
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
      {
        v60 = (objc_class *)objc_opt_class();
        NSStringFromClass(v60);
        v61 = (id)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
        v62 = (id)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
        v63 = (id)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask timeoutInterval](self, "timeoutInterval");
        *(_DWORD *)buf = 138413314;
        v220 = v61;
        v221 = 2048;
        v222 = self;
        v223 = 2048;
        v224 = v62;
        v225 = 2048;
        v226 = v63;
        v227 = 2048;
        v228 = v64;
        _os_log_impl(&dword_209602000, v59, OS_LOG_TYPE_DEBUG, "[%@ %p, sess %p, request %p] Using timeout of %lf", buf, 0x34u);

      }
    }

    -[CoreDAVTask httpMethod](self, "httpMethod");
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_alloc(MEMORY[0x24BDB7458]);
    v66 = -[CoreDAVTask cachePolicy](self, "cachePolicy");
    -[CoreDAVTask timeoutInterval](self, "timeoutInterval");
    v67 = (void *)objc_msgSend(v65, "initWithURL:cachePolicy:timeoutInterval:", v5, v66);
    v68 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    v208 = v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v69 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      v70 = objc_msgSend(v69, "shouldUseOpportunisticSockets");

      if (v70)
      {
        +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
        objc_msgSend(v71, "logHandleForAccountInfoProvider:", v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        if (v73)
        {
          v74 = v73;
          if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
          {
            v75 = (objc_class *)objc_opt_class();
            NSStringFromClass(v75);
            v76 = v4;
            v77 = (id)objc_claimAutoreleasedReturnValue();
            -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
            v78 = (id)objc_claimAutoreleasedReturnValue();
            -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
            v79 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v220 = v77;
            v221 = 2048;
            v222 = self;
            v223 = 2048;
            v224 = v78;
            v225 = 2048;
            v226 = v79;
            _os_log_impl(&dword_209602000, v74, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Account requested an opportunistic socket.  Doing that", buf, 0x2Au);

            v4 = v76;
            v5 = v208;
          }

        }
        objc_msgSend(v67, "setNetworkServiceType:", 5);
        goto LABEL_53;
      }
    }
    else
    {

    }
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    objc_msgSend(v80, "logHandleForAccountInfoProvider:", v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    if (v82)
    {
      v83 = v82;
      if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
      {
        v84 = (objc_class *)objc_opt_class();
        NSStringFromClass(v84);
        v85 = v4;
        v86 = (id)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
        v87 = (id)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
        v88 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v220 = v86;
        v221 = 2048;
        v222 = self;
        v223 = 2048;
        v224 = v87;
        v225 = 2048;
        v226 = v88;
        _os_log_impl(&dword_209602000, v83, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Not using opportunistic sockets for task", buf, 0x2Au);

        v4 = v85;
        v5 = v208;
      }

    }
LABEL_53:
    v206 = v4;
    v89 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    objc_msgSend(v89, "password");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v90, "length");

    if (!v91)
      objc_msgSend(v67, "_setProperty:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDB7858]);
    v214 = 0u;
    v215 = 0u;
    v212 = 0u;
    v213 = 0u;
    v92 = self->_requestProperties;
    v93 = -[NSDictionary countByEnumeratingWithState:objects:count:](v92, "countByEnumeratingWithState:objects:count:", &v212, v218, 16);
    if (v93)
    {
      v94 = v93;
      v95 = *(_QWORD *)v213;
      do
      {
        for (i = 0; i != v94; ++i)
        {
          if (*(_QWORD *)v213 != v95)
            objc_enumerationMutation(v92);
          v97 = *(_QWORD *)(*((_QWORD *)&v212 + 1) + 8 * i);
          -[NSDictionary objectForKey:](self->_requestProperties, "objectForKey:", v97);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "_setProperty:forKey:", v98, v97);

        }
        v94 = -[NSDictionary countByEnumeratingWithState:objects:count:](v92, "countByEnumeratingWithState:objects:count:", &v212, v218, 16);
      }
      while (v94);
    }

    objc_msgSend(v67, "setHTTPMethod:", v209);
    -[CoreDAVTask requestBodyStream](self, "requestBodyStream");
    v99 = objc_claimAutoreleasedReturnValue();
    if (v99)
    {
      objc_msgSend(v67, "setHTTPBodyStream:", v99);
      v100 = 0;
      v101 = &off_24C1D9000;
    }
    else
    {
      v100 = -[CoreDAVTask _createBodyData](self, "_createBodyData");
      objc_msgSend(v67, "setHTTPBody:", v100);
      v101 = &off_24C1D9000;
      if (-[CoreDAVTask _includeGeneralHeaders](self, "_includeGeneralHeaders") || objc_msgSend(v100, "length"))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v100, "length"));
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "setValue:forHTTPHeaderField:", v102, CFSTR("Content-Length"));

      }
      if (!v100)
      {
LABEL_69:
        v203 = (void *)v99;
        v4 = v206;
        if (-[CoreDAVTask _includeGeneralHeaders](self, "_includeGeneralHeaders"))
        {
          objc_msgSend((id)objc_opt_class(), "stringFromDepth:", -[CoreDAVTask depth](self, "depth"));
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          if (v103)
            objc_msgSend(v67, "setValue:forHTTPHeaderField:", v103, CFSTR("Depth"));
          -[NSObject scheme](v5, "scheme");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = objc_msgSend(v104, "isEqualToString:", CFSTR("https"));

          if (v105)
          {
            v106 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
            v107 = objc_opt_respondsToSelector();

            if ((v107 & 1) != 0)
            {
              v108 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
              v109 = objc_msgSend(v108, "shouldSendClientInfoHeaderForURL:", v5);

              if (v109)
              {
                CDVAppleClientInfoString();
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "setValue:forHTTPHeaderField:", v110, CFSTR("X-Apple-Client-Info"));

              }
            }
          }

        }
        v111 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
        objc_msgSend(v111, "userAgentHeader");
        v112 = (void *)objc_claimAutoreleasedReturnValue();

        v204 = v100;
        if (v112)
        {
          v113 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
          objc_msgSend(v113, "userAgentHeader");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "setValue:forHTTPHeaderField:", v114, CFSTR("User-Agent"));

        }
        else
        {
          CDVDefaultUserAgent();
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "setValue:forHTTPHeaderField:", v113, CFSTR("User-Agent"));
        }

        v210[0] = MEMORY[0x24BDAC760];
        v210[1] = 3221225472;
        v210[2] = __33__CoreDAVTask_performCoreDAVTask__block_invoke_116;
        v210[3] = &unk_24C1D9CE8;
        v115 = v67;
        v211 = v115;
        v116 = (void *)MEMORY[0x20BD114EC](v210);
        -[CoreDAVTask additionalHeaderValues](self, "additionalHeaderValues");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "enumerateKeysAndObjectsUsingBlock:", v116);

        v118 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
        v119 = objc_opt_respondsToSelector();

        if ((v119 & 1) != 0)
        {
          v120 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
          objc_msgSend(v120, "additionalHeaderValues");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "enumerateKeysAndObjectsUsingBlock:", v116);

        }
        v122 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
        v123 = objc_opt_respondsToSelector();

        if ((v123 & 1) != 0)
        {
          v124 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
          objc_msgSend(v124, "clientToken");
          v125 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v125, "length"))
            objc_msgSend(v115, "setValue:forHTTPHeaderField:", v125, CFSTR("X-ClientToken"));

        }
        if (self->_ignoresGuardianRestrictions)
          objc_msgSend(v115, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-mme-guardian-restricted-relaxed"));
        v126 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
        v127 = objc_opt_respondsToSelector();

        if ((v127 & 1) != 0)
        {
          v128 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
          objc_msgSend(v128, "oauthInfoProvider");
          v129 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v129, "oauthVariant") == 1)
          {
            v199 = v116;
            objc_msgSend(v101[66], "sharedLogging");
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            v131 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
            objc_msgSend(v130, "logHandleForAccountInfoProvider:", v131);
            v132 = (void *)objc_claimAutoreleasedReturnValue();

            if (v132)
            {
              v133 = v132;
              if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
              {
                v134 = (objc_class *)objc_opt_class();
                NSStringFromClass(v134);
                v196 = v129;
                v135 = (id)objc_claimAutoreleasedReturnValue();
                -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
                v136 = (id)objc_claimAutoreleasedReturnValue();
                -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
                v137 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413058;
                v220 = v135;
                v221 = 2048;
                v222 = self;
                v223 = 2048;
                v224 = v136;
                v225 = 2048;
                v226 = v137;
                _os_log_impl(&dword_209602000, v133, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Pre-authing with Bearer + OAuth2 token", buf, 0x2Au);

                v129 = v196;
              }

              v5 = v208;
            }

            objc_msgSend(v129, "oauth2Token");
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v138, "length"))
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Bearer %@"), v138);
              v139 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v115, "setValue:forHTTPHeaderField:", v139, CFSTR("Authorization"));

            }
            v101 = &off_24C1D9000;
            v116 = v199;
          }
        }
        else
        {
          v129 = 0;
        }
        if (self->_requestIsCompressed)
        {
          objc_msgSend(v115, "setValue:forHTTPHeaderField:", CFSTR("gzip"), CFSTR("Content-Encoding"));
          objc_msgSend(v115, "setValue:forHTTPHeaderField:", CFSTR("no-transform"), CFSTR("Cache-Control"));
        }
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_overriddenHeaders, "enumerateKeysAndObjectsUsingBlock:", v116);
        v140 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
        objc_msgSend(v140, "identityPersist");
        v141 = (void *)objc_claimAutoreleasedReturnValue();

        v202 = v141;
        if (v141)
        {
          v197 = v129;
          v200 = v116;
          objc_msgSend(v101[66], "sharedLogging");
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          v143 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
          objc_msgSend(v142, "logHandleForAccountInfoProvider:", v143);
          v144 = (void *)objc_claimAutoreleasedReturnValue();

          if (v144)
          {
            v145 = v144;
            if (os_log_type_enabled(v145, OS_LOG_TYPE_INFO))
            {
              v146 = (objc_class *)objc_opt_class();
              NSStringFromClass(v146);
              v147 = (id)objc_claimAutoreleasedReturnValue();
              -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
              v148 = v141;
              v149 = (id)objc_claimAutoreleasedReturnValue();
              -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
              v150 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v220 = v147;
              v221 = 2048;
              v222 = self;
              v223 = 2048;
              v224 = v149;
              v225 = 2048;
              v226 = v150;
              _os_log_impl(&dword_209602000, v145, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Found identity, attaching client certificate", buf, 0x2Au);

              v4 = v206;
              v141 = v148;

            }
          }

          v151 = _CoreDAVSecCopyIdentityFromPersist(v141);
          if (v151)
          {
            v152 = v151;
            v153 = _CoreDAVSecIdentityCopySSLClientAuthenticationChain(v151);
            v5 = v208;
            v129 = v197;
            if (v153)
            {
              v154 = v153;
              -[CoreDAVTask _applyAuthenticationChain:toRequest:](self, "_applyAuthenticationChain:toRequest:", v153, v115);
              v155 = objc_claimAutoreleasedReturnValue();

              CFRelease(v154);
              v115 = (id)v155;
            }
            else
            {
              +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
              v156 = (void *)objc_claimAutoreleasedReturnValue();
              v157 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
              objc_msgSend(v156, "logHandleForAccountInfoProvider:", v157);
              v158 = (void *)objc_claimAutoreleasedReturnValue();

              if (v158)
              {
                v159 = v158;
                if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
                {
                  v160 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v160);
                  v161 = (id)objc_claimAutoreleasedReturnValue();
                  -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
                  log = v159;
                  v162 = (id)objc_claimAutoreleasedReturnValue();
                  -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
                  v163 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138413314;
                  v220 = v161;
                  v221 = 2048;
                  v222 = self;
                  v223 = 2048;
                  v224 = v162;
                  v225 = 2048;
                  v226 = v163;
                  v227 = 2112;
                  v228 = v152;
                  _os_log_impl(&dword_209602000, log, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] No auth chain for sec identity %@", buf, 0x34u);

                  v159 = log;
                  v129 = v197;
                }

              }
              v5 = v208;
            }
            CFRelease(v152);
            v101 = &off_24C1D9000;
            v116 = v200;
          }
          else
          {
            v5 = v208;
            v101 = &off_24C1D9000;
            v129 = v197;
            v116 = v200;
          }
        }
        v164 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
        v165 = objc_opt_respondsToSelector();

        if ((v165 & 1) != 0)
        {
          v166 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
          v167 = objc_msgSend(v166, "shouldHandleHTTPCookiesForURL:", v5);

          objc_msgSend(v115, "setHTTPShouldHandleCookies:", v167);
          if ((_DWORD)v167)
          {
            v168 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
            v169 = objc_opt_respondsToSelector();

            if ((v169 & 1) != 0)
            {
              v170 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
              v171 = (const void *)objc_msgSend(v170, "copyStorageSession");

              if (v171)
              {
                v201 = v116;
                +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
                v172 = (void *)objc_claimAutoreleasedReturnValue();
                v173 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
                v174 = v172;
                objc_msgSend(v172, "logHandleForAccountInfoProvider:", v173);
                v175 = (void *)objc_claimAutoreleasedReturnValue();

                v176 = v203;
                if (v175)
                {
                  v198 = v129;
                  v177 = v175;
                  if (os_log_type_enabled(v177, OS_LOG_TYPE_INFO))
                  {
                    v178 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v178);
                    v179 = (id)objc_claimAutoreleasedReturnValue();
                    -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
                    v180 = (id)objc_claimAutoreleasedReturnValue();
                    -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
                    v181 = (id)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138413058;
                    v220 = v179;
                    v221 = 2048;
                    v222 = self;
                    v223 = 2048;
                    v224 = v180;
                    v225 = 2048;
                    v226 = v181;
                    _os_log_impl(&dword_209602000, v177, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Account requested custom storage session.  Doing that", buf, 0x2Au);

                    v4 = v206;
                    v176 = v203;

                  }
                  v129 = v198;
                }

                -[CoreDAVTask _applyStorageSession:toRequest:](self, "_applyStorageSession:toRequest:", v171, v115);
                v182 = objc_claimAutoreleasedReturnValue();

                CFRelease(v171);
                v115 = (id)v182;
                v5 = v208;
                v101 = &off_24C1D9000;
                v116 = v201;
LABEL_127:
                if (v176)
                {
                  objc_msgSend(v101[66], "sharedLogging");
                  v183 = (void *)objc_claimAutoreleasedReturnValue();
                  v184 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
                  objc_msgSend(v183, "logHandleForAccountInfoProvider:", v184);
                  v185 = objc_claimAutoreleasedReturnValue();

                  if (v185)
                  {
                    v185 = v185;
                    if (!os_log_type_enabled(v185, OS_LOG_TYPE_DEBUG))
                    {
LABEL_132:

                      goto LABEL_133;
                    }
                    v186 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v186);
                    v187 = (id)objc_claimAutoreleasedReturnValue();
                    -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
                    v188 = (id)objc_claimAutoreleasedReturnValue();
                    -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
                    v189 = v4;
                    v190 = v129;
                    v191 = (id)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138413058;
                    v220 = v187;
                    v221 = 2048;
                    v222 = self;
                    v223 = 2048;
                    v224 = v188;
                    v225 = 2048;
                    v226 = v191;
                    v192 = "[%@ %p, sess %p, request %p] Outgoing request body is streamed";
LABEL_131:
                    _os_log_impl(&dword_209602000, v185, OS_LOG_TYPE_DEBUG, v192, buf, 0x2Au);

                    v129 = v190;
                    v4 = v189;
                    v5 = v208;

                    v176 = v203;
                    goto LABEL_132;
                  }
                }
                else
                {
                  if (objc_msgSend(objc_retainAutorelease(v204), "bytes"))
                    goto LABEL_135;
                  objc_msgSend(v101[66], "sharedLogging");
                  v183 = (void *)objc_claimAutoreleasedReturnValue();
                  v193 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
                  objc_msgSend(v183, "logHandleForAccountInfoProvider:", v193);
                  v185 = objc_claimAutoreleasedReturnValue();

                  if (v185)
                  {
                    v185 = v185;
                    if (!os_log_type_enabled(v185, OS_LOG_TYPE_DEBUG))
                      goto LABEL_132;
                    v194 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v194);
                    v187 = (id)objc_claimAutoreleasedReturnValue();
                    -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
                    v188 = (id)objc_claimAutoreleasedReturnValue();
                    -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
                    v189 = v4;
                    v190 = v129;
                    v191 = (id)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138413058;
                    v220 = v187;
                    v221 = 2048;
                    v222 = self;
                    v223 = 2048;
                    v224 = v188;
                    v225 = 2048;
                    v226 = v191;
                    v192 = "[%@ %p, sess %p, request %p] Outgoing request body is empty";
                    goto LABEL_131;
                  }
                }
LABEL_133:

LABEL_135:
                objc_msgSend(v115, "_setNonAppInitiated:", 1);
                -[CoreDAVTask loadRequest:](self, "loadRequest:", v115);

                goto LABEL_136;
              }
              v101 = &off_24C1D9000;
            }
          }
        }
        else
        {
          objc_msgSend(v115, "setHTTPShouldHandleCookies:", 0);
        }
        v176 = v203;
        goto LABEL_127;
      }
    }
    objc_msgSend(v67, "setValue:forHTTPHeaderField:", CFSTR("text/xml"), CFSTR("Content-Type"));
    goto LABEL_69;
  }
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  objc_msgSend(v26, "logHandleForAccountInfoProvider:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = v28;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v220 = v31;
      v221 = 2048;
      v222 = self;
      v223 = 2048;
      v224 = v32;
      v225 = 2048;
      v226 = v33;
      v227 = 2112;
      v228 = v4;
      v229 = 2112;
      v230 = self;
      _os_log_impl(&dword_209602000, v29, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Validation error: [%@], task: [%@]", buf, 0x3Eu);

    }
  }

  -[CoreDAVTask finishCoreDAVTaskWithError:](self, "finishCoreDAVTaskWithError:", v4);
LABEL_137:

}

void __33__CoreDAVTask_performCoreDAVTask__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("CoreDAVForcedTaskTimeoutInterval"));
  performCoreDAVTask_forcedTimeoutInterval = v3;

  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v4, "logHandleForAccountInfoProvider:", WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v10, "_sessionForLogging");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_requestForLogging");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138413314;
      v14 = v9;
      v15 = 2048;
      v16 = v10;
      v17 = 2048;
      v18 = v11;
      v19 = 2048;
      v20 = v12;
      v21 = 2048;
      v22 = performCoreDAVTask_forcedTimeoutInterval;
      _os_log_impl(&dword_209602000, v7, OS_LOG_TYPE_DEBUG, "[%@ %p, sess %p, request %p] Attempting to force a permanent CoreDAVTask timeout of [%lf]", (uint8_t *)&v13, 0x34u);

    }
  }

}

uint64_t __33__CoreDAVTask_performCoreDAVTask__block_invoke_116(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

- (BOOL)validate:(id *)a3
{
  return 1;
}

- (void)_sendTimeSpentInNetworkingToProvider
{
  CoreDAVAccountInfoProvider **p_accountInfoProvider;
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  char v8;
  NSDate *dateConnectionWentOut;

  if (self->_dateConnectionWentOut)
  {
    p_accountInfoProvider = &self->_accountInfoProvider;
    WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    v5 = objc_opt_respondsToSelector();

    v6 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    if ((v5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", self->_dateConnectionWentOut);
      objc_msgSend(v6, "noteTimeSpentInNetworking:forTask:", self);
    }
    else
    {
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) == 0)
      {
LABEL_8:
        dateConnectionWentOut = self->_dateConnectionWentOut;
        self->_dateConnectionWentOut = 0;

        return;
      }
      v6 = objc_loadWeakRetained((id *)p_accountInfoProvider);
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", self->_dateConnectionWentOut);
      objc_msgSend(v6, "noteTimeSpentInNetworking:");
    }

    goto LABEL_8;
  }
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  id v4;
  NSURLSession *session;
  NSURLSession *v6;
  NSURLSessionDataTask *task;
  NSURLRequest *request;
  void *v9;
  void (**v10)(void);
  void *v11;
  char v12;
  void *v13;
  id WeakRetained;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *uniqueID;
  id v22;
  int v23;
  void *v24;
  __int16 v25;
  CoreDAVTask *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  NSString *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[CoreDAVTask markAsFinished](self, "markAsFinished"))
    goto LABEL_16;
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_performCoreDAVTask, 0);
  -[CoreDAVTask reportStatusWithError:](self, "reportStatusWithError:", v4);
  if (!self->_didFinishLoading)
    -[CoreDAVRequestLogger finishCoreDAVResponse](self->_logger, "finishCoreDAVResponse");
  -[CoreDAVTask setError:](self, "setError:", v4);
  session = self->_session;
  if (session)
  {
    self->_didCancel = 1;
    -[NSURLSession invalidateAndCancel](session, "invalidateAndCancel");
    v6 = self->_session;
    self->_session = 0;

  }
  task = self->_task;
  self->_task = 0;

  request = self->_request;
  self->_request = 0;

  -[CoreDAVTask completionBlock](self, "completionBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CoreDAVTask completionBlock](self, "completionBlock");
    v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v10[2]();
LABEL_10:

    goto LABEL_11;
  }
  -[CoreDAVTask delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[CoreDAVTask delegate](self, "delegate");
    v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "task:didFinishWithError:", self, v4);
    goto LABEL_10;
  }
LABEL_11:
  -[CoreDAVTask tearDownResources](self, "tearDownResources");
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  objc_msgSend(v13, "logHandleForAccountInfoProvider:", WeakRetained);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = v15;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      uniqueID = self->_uniqueID;
      v23 = 138413570;
      v24 = v18;
      v25 = 2048;
      v26 = self;
      v27 = 2048;
      v28 = v19;
      v29 = 2048;
      v30 = v20;
      v31 = 2114;
      v32 = uniqueID;
      v33 = 2112;
      v34 = v4;
      _os_log_impl(&dword_209602000, v16, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] FinishCoreDAVTaskWithError [ID=%{public}@, error=%@]", (uint8_t *)&v23, 0x3Eu);

    }
  }

  -[CoreDAVTask _sendTimeSpentInNetworkingToProvider](self, "_sendTimeSpentInNetworkingToProvider");
  v22 = objc_loadWeakRetained((id *)&self->_taskManager);
  objc_msgSend(v22, "coreDAVTaskDidFinish:", self);

LABEL_16:
}

- (BOOL)isFinished
{
  CoreDAVTask *v2;
  BOOL finished;

  v2 = self;
  objc_sync_enter(v2);
  finished = v2->_finished;
  objc_sync_exit(v2);

  return finished;
}

- (BOOL)markAsFinished
{
  CoreDAVTask *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = !v2->_finished;
  v2->_finished = 1;
  objc_sync_exit(v2);

  return v3;
}

- (id)credentialForClientCertificateChallenge:(id)a3
{
  CoreDAVAccountInfoProvider **p_accountInfoProvider;
  void *WeakRetained;
  id v5;
  void *v6;
  uint64_t v7;
  const void *v8;
  void *v9;

  p_accountInfoProvider = &self->_accountInfoProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    objc_msgSend(v5, "clientCertificateInfoProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6 || (v7 = objc_msgSend(v6, "copySecIdentity")) == 0)
    {
      v9 = 0;
      goto LABEL_8;
    }
    v8 = (const void *)v7;
    objc_msgSend(v6, "secCertificates");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB7480]), "initWithIdentity:certificates:persistence:", v8, WeakRetained, 1);
    CFRelease(v8);
  }
  else
  {
    v6 = 0;
    v9 = 0;
  }

LABEL_8:
  return v9;
}

- (id)credentialForOAuthChallenge:(id)a3
{
  id v4;
  CoreDAVAccountInfoProvider **p_accountInfoProvider;
  id WeakRetained;
  char v7;
  id v8;
  void *v9;
  void *v10;
  const void *OAuth2;
  void *v12;

  v4 = a3;
  p_accountInfoProvider = &self->_accountInfoProvider;
  WeakRetained = objc_loadWeakRetained((id *)p_accountInfoProvider);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    objc_msgSend(v8, "oauthInfoProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "oauth2Token");
    objc_msgSend(v4, "protectionSpace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "realm");
    OAuth2 = (const void *)_CFURLCredentialCreateOAuth2();

  }
  else
  {
    OAuth2 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && !OAuth2)
    OAuth2 = (const void *)objc_msgSend(v9, "newOAuth1CredentialForChallenge:", v4);
  if (OAuth2)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB7480]), "_initWithCFURLCredential:", OAuth2);
    CFRelease(OAuth2);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_applyAuthenticationChain:(__CFArray *)a3 toRequest:(id)a4
{
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  const void *MutableCopy;
  const void *v17;
  const __CFDictionary *SSLProperties;
  __CFDictionary *Mutable;
  __CFDictionary *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  CoreDAVTask *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  __CFArray *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  objc_msgSend(v7, "logHandleForAccountInfoProvider:", WeakRetained);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138413570;
      v24 = v12;
      v25 = 2048;
      v26 = self;
      v27 = 2048;
      v28 = v13;
      v29 = 2048;
      v30 = v14;
      v31 = 2112;
      v32 = a3;
      v33 = 2112;
      v34 = v6;
      _os_log_impl(&dword_209602000, v10, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Applying authentication chain %@ to request %@", (uint8_t *)&v23, 0x3Eu);

    }
  }

  v15 = objc_retainAutorelease(v6);
  objc_msgSend(v15, "_CFURLRequest");
  MutableCopy = (const void *)CFURLRequestCreateMutableCopy();
  v17 = (const void *)*MEMORY[0x24BDB77E0];
  SSLProperties = (const __CFDictionary *)CFURLRequestGetSSLProperties();
  if (SSLProperties)
    Mutable = CFDictionaryCreateMutableCopy(0, 0, SSLProperties);
  else
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v20 = Mutable;
  CFDictionarySetValue(Mutable, v17, a3);
  CFURLRequestSetSSLProperties();
  CFRelease(v20);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB7458]), "_initWithCFURLRequest:", MutableCopy);

  CFRelease(MutableCopy);
  return v21;
}

- (id)_applyStorageSession:(__CFURLStorageSession *)a3 toRequest:(id)a4
{
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  const void *MutableCopy;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  CoreDAVTask *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  __CFURLStorageSession *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  objc_msgSend(v7, "logHandleForAccountInfoProvider:", WeakRetained);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138413570;
      v20 = v12;
      v21 = 2048;
      v22 = self;
      v23 = 2048;
      v24 = v13;
      v25 = 2048;
      v26 = v14;
      v27 = 2112;
      v28 = a3;
      v29 = 2112;
      v30 = v6;
      _os_log_impl(&dword_209602000, v10, OS_LOG_TYPE_DEBUG, "[%@ %p, sess %p, request %p] Applying storage session %@ to request %@", (uint8_t *)&v19, 0x3Eu);

    }
  }

  v15 = objc_retainAutorelease(v6);
  objc_msgSend(v15, "_CFURLRequest");
  MutableCopy = (const void *)CFURLRequestCreateMutableCopy();
  _CFURLRequestSetStorageSession();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB7458]), "_initWithCFURLRequest:", MutableCopy);

  CFRelease(MutableCopy);
  return v17;
}

- (void)_handleBadPasswordResponse
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  char v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  objc_class *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  objc_class *v29;
  void *v30;
  id v31;
  void *v32;
  _QWORD v33[5];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  CoreDAVTask *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __41__CoreDAVTask__handleBadPasswordResponse__block_invoke;
  v33[3] = &unk_24C1D9D10;
  v33[4] = self;
  v3 = (void *)MEMORY[0x20BD114EC](v33, a2);
  -[CoreDAVTask responseHeaders](self, "responseHeaders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CDVObjectForKeyCaseInsensitive:", CFSTR("X-Web-Login-Required"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      objc_msgSend(v9, "logHandleForAccountInfoProvider:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = v11;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = (objc_class *)objc_opt_class();
          NSStringFromClass(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
          v18 = (objc_class *)objc_opt_class();
          NSStringFromClass(v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v35 = v14;
          v36 = 2048;
          v37 = self;
          v38 = 2048;
          v39 = v15;
          v40 = 2048;
          v41 = v16;
          v42 = 2114;
          v43 = v19;
          _os_log_impl(&dword_209602000, v12, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] XWebLoginRequired header defined. Invoking _accountInfoProvider - %{public}@ HandleWebLogin delegate", buf, 0x34u);

        }
      }

      -[CoreDAVTask handleWebLoginRequestWithCompletionBlock:](self, "handleWebLoginRequestWithCompletionBlock:", v3);
      goto LABEL_14;
    }
  }
  else
  {

  }
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  objc_msgSend(v20, "logHandleForAccountInfoProvider:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = v22;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
      v32 = v3;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v35 = v25;
      v36 = 2048;
      v37 = self;
      v38 = 2048;
      v39 = v26;
      v40 = 2048;
      v41 = v27;
      v42 = 2114;
      v43 = v30;
      _os_log_impl(&dword_209602000, v23, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] _accountInfoProvider - %{public}@ Prompting User for Password. This may result in renewCredentials call.", buf, 0x34u);

      v3 = v32;
    }

  }
  v31 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  objc_msgSend(v31, "promptUserForNewCoreDAVPasswordWithCompletionBlock:", v3);

LABEL_14:
}

void __41__CoreDAVTask__handleBadPasswordResponse__block_invoke(uint64_t a1, int a2)
{
  char v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  objc_class *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  objc_class *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(*(id *)(a1 + 32), "isFinished");
  v5 = *(_QWORD *)(a1 + 32);
  if ((v4 & 1) != 0)
  {
    v6 = *(void **)(v5 + 120);
    *(_QWORD *)(v5 + 120) = 0;

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(v5 + 8));
    objc_msgSend(WeakRetained, "coreDAVTaskEndModal:", *(_QWORD *)(a1 + 32));

    if ((a2 - 1) >= 3)
    {
      if (!a2)
      {
        v22 = *(_QWORD *)(a1 + 32);
        v23 = *(void **)(v22 + 120);
        *(_QWORD *)(v22 + 120) = 0;

        +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
        objc_msgSend(v24, "logHandleForAccountInfoProvider:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          v27 = v26;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            v28 = (objc_class *)objc_opt_class();
            NSStringFromClass(v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = *(void **)(a1 + 32);
            objc_msgSend(v30, "_sessionForLogging");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "_requestForLogging");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
            v34 = (objc_class *)objc_opt_class();
            NSStringFromClass(v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v40 = v29;
            v41 = 2048;
            v42 = v30;
            v43 = 2048;
            v44 = v31;
            v45 = 2048;
            v46 = v32;
            v47 = 2114;
            v48 = v35;
            _os_log_impl(&dword_209602000, v27, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] _accountInfoProvider %{public}@ User Entered New Password. Retrying Task.", buf, 0x34u);

          }
        }

        v36 = *(void **)(a1 + 32);
        CDVRunLoopModesToPerformDelayedSelectorsIn();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "performSelector:withObject:afterDelay:inModes:", sel_performCoreDAVTask, 0, v37, 0.0);

      }
    }
    else
    {
      v8 = *(id *)(*(_QWORD *)(a1 + 32) + 120);
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 120);
      *(_QWORD *)(v9 + 120) = 0;

      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
      objc_msgSend(v11, "logHandleForAccountInfoProvider:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = v13;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = *(void **)(a1 + 32);
          objc_msgSend(v17, "_sessionForLogging");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "_requestForLogging");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
          v20 = (objc_class *)objc_opt_class();
          NSStringFromClass(v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v40 = v16;
          v41 = 2048;
          v42 = v17;
          v43 = 2048;
          v44 = v38;
          v45 = 2048;
          v46 = v18;
          v47 = 2114;
          v48 = v21;
          _os_log_impl(&dword_209602000, v14, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] _accountInfoProvider %{public}@ User either Cancelled/Rejected prompt or System can not prompt for password. Finishing Task.", buf, 0x34u);

        }
      }

      objc_msgSend(*(id *)(a1 + 32), "finishCoreDAVTaskWithError:", v8);
    }
  }
}

- (void)_runOnThisThread:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)_runOnCallbackThread:(id)a3
{
  NSThread *callbackThread;
  id v5;

  callbackThread = self->_callbackThread;
  if (callbackThread)
  {
    v5 = (id)MEMORY[0x20BD114EC](a3, a2);
    -[CoreDAVTask performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel__runOnThisThread_, callbackThread, v5, 0);

  }
  else
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v5;
  void *v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  CoreDAVTask *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (v5)
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    objc_msgSend(v6, "logHandleForAccountInfoProvider:", WeakRetained);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = v8;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138413314;
        v15 = v11;
        v16 = 2048;
        v17 = self;
        v18 = 2048;
        v19 = v12;
        v20 = 2048;
        v21 = v13;
        v22 = 2112;
        v23 = v5;
        _os_log_impl(&dword_209602000, v9, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] session invalidated with error %@", (uint8_t *)&v14, 0x34u);

      }
    }

  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __64__CoreDAVTask_URLSession_didReceiveChallenge_completionHandler___block_invoke;
  v11[3] = &unk_24C1D9D38;
  v11[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  -[CoreDAVTask _runOnCallbackThread:](self, "_runOnCallbackThread:", v11);

}

uint64_t __64__CoreDAVTask_URLSession_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAuthenticationChallenge:task:completionHandler:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  CoreDAVTask *v14;
  int64_t v15;
  int64_t v16;

  v10 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __87__CoreDAVTask_URLSession_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke;
  v12[3] = &unk_24C1D9D60;
  v13 = v10;
  v14 = self;
  v15 = a6;
  v16 = a7;
  v11 = v10;
  -[CoreDAVTask _runOnCallbackThread:](self, "_runOnCallbackThread:", v12);

}

void __87__CoreDAVTask_URLSession_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD **)(a1 + 40);
  if (v3 == v2[7])
  {
    objc_msgSend(v2, "requestProgressBlock");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 && (*(_QWORD *)(a1 + 48) & 0x8000000000000000) == 0)
    {
      v16 = *(_QWORD *)(a1 + 56);

      if (v16 < 0)
        return;
      objc_msgSend(*(id *)(a1 + 40), "requestProgressBlock");
      v17 = objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t))(v17 + 16))(v17, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 1);
      v15 = (void *)v17;
    }

    return;
  }
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
  objc_msgSend(v4, "logHandleForAccountInfoProvider:", WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 40);
      objc_msgSend(v10, "_sessionForLogging");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_requestForLogging");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
      *(_DWORD *)buf = 138413570;
      v19 = v9;
      v20 = 2048;
      v21 = v10;
      v22 = 2048;
      v23 = v11;
      v24 = 2048;
      v25 = v12;
      v26 = 2048;
      v27 = v13;
      v28 = 2048;
      v29 = v14;
      _os_log_impl(&dword_209602000, v7, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Ignoring -URLSession:task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend: callback for task %p because it doesn't match our current task, %p", buf, 0x3Eu);

    }
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  CoreDAVTask *v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __69__CoreDAVTask_URLSession_task_didReceiveChallenge_completionHandler___block_invoke;
  v15[3] = &unk_24C1D9D88;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v19 = v11;
  v12 = v10;
  v13 = v11;
  v14 = v9;
  -[CoreDAVTask _runOnCallbackThread:](self, "_runOnCallbackThread:", v15);

}

uint64_t __69__CoreDAVTask_URLSession_task_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD **)(a1 + 40);
  if (v3 == v2[7])
    return objc_msgSend(v2, "_handleAuthenticationChallenge:task:completionHandler:", *(_QWORD *)(a1 + 48));
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
  objc_msgSend(v4, "logHandleForAccountInfoProvider:", WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 40);
      objc_msgSend(v10, "_sessionForLogging");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_requestForLogging");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
      v16 = 138413570;
      v17 = v9;
      v18 = 2048;
      v19 = v10;
      v20 = 2048;
      v21 = v11;
      v22 = 2048;
      v23 = v12;
      v24 = 2048;
      v25 = v13;
      v26 = 2048;
      v27 = v14;
      _os_log_impl(&dword_209602000, v7, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Ignoring -URLSession:task:didReceiveChallenge:completionHandler: callback for task %p because it doesn't match our current task, %p", (uint8_t *)&v16, 0x3Eu);

    }
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  CoreDAVTask *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __50__CoreDAVTask_URLSession_dataTask_didReceiveData___block_invoke;
  v14[3] = &unk_24C1D9DB0;
  v15 = v9;
  v16 = self;
  v17 = v8;
  v18 = v10;
  v11 = v10;
  v12 = v8;
  v13 = v9;
  -[CoreDAVTask _runOnCallbackThread:](self, "_runOnCallbackThread:", v14);

}

void __50__CoreDAVTask_URLSession_dataTask_didReceiveData___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD **)(a1 + 40);
  if (v3 == v2[7])
  {
    objc_msgSend(v2, "_session:dataTask:didReceiveData:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
    objc_msgSend(v4, "logHandleForAccountInfoProvider:", WeakRetained);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = v6;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(a1 + 40);
        objc_msgSend(v10, "_sessionForLogging");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "_requestForLogging");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(a1 + 32);
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
        v15 = 138413570;
        v16 = v9;
        v17 = 2048;
        v18 = v10;
        v19 = 2048;
        v20 = v11;
        v21 = 2048;
        v22 = v12;
        v23 = 2048;
        v24 = v13;
        v25 = 2048;
        v26 = v14;
        _os_log_impl(&dword_209602000, v7, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Ignoring -URLSession:dataTask:didReceiveData: callback for task %p because it doesn't match our current task, %p", (uint8_t *)&v15, 0x3Eu);

      }
    }

  }
}

- (void)_session:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v9;
  NSURLSessionDataTask *v10;
  NSData *fakeResponseData;
  NSData *v12;
  void *v13;
  int v14;
  void *v15;
  id WeakRetained;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  unint64_t v34;
  void (**v35)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v36;
  id v37;
  NSObject *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  id v45;
  objc_class *v46;
  void *v47;
  uint64_t v48;
  unint64_t v49;
  void *v50;
  void *v51;
  _BOOL4 v52;
  void *v53;
  CoreDAVXMLParser *v54;
  void *v55;
  CoreDAVXMLParser *v56;
  CoreDAVXMLParser *v57;
  void *v58;
  char v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  NSData *v67;
  void *v68;
  void *v69;
  char v70;
  id v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  char isKindOfClass;
  void *v78;
  id v79;
  void *v80;
  NSObject *v81;
  objc_class *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  NSObject *v91;
  objc_class *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  void *context;
  _BOOL4 v104;
  NSURLSessionDataTask *v105;
  NSData *v106;
  uint8_t buf[4];
  void *v108;
  __int16 v109;
  CoreDAVTask *v110;
  __int16 v111;
  void *v112;
  __int16 v113;
  void *v114;
  __int16 v115;
  uint64_t v116;
  __int16 v117;
  unint64_t v118;
  __int16 v119;
  unint64_t v120;
  uint64_t v121;

  v121 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = (NSURLSessionDataTask *)a4;
  v106 = (NSData *)a5;
  fakeResponseData = self->_fakeResponseData;
  if (!fakeResponseData)
  {
LABEL_4:
    self->_didReceiveData = 1;
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "shouldLogAtLevel:forAccountInfoProvider:", 7, 0);

    v105 = v10;
    if (v14)
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      objc_msgSend(v15, "logHandleForAccountInfoProvider:", WeakRetained);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v18 = v17;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v108 = v20;
          v109 = 2048;
          v110 = self;
          v111 = 2048;
          v112 = v21;
          v113 = 2048;
          v114 = v22;
          _os_log_impl(&dword_209602000, v18, OS_LOG_TYPE_DEBUG, "[%@ %p, sess %p, request %p] didReceiveData", buf, 0x2Au);

          v10 = v105;
        }

      }
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v106, 4);
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      objc_msgSend(v24, "logHandleForAccountInfoProvider:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        v27 = v26;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          v28 = (objc_class *)objc_opt_class();
          NSStringFromClass(v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v108 = v29;
          v109 = 2048;
          v110 = self;
          v111 = 2048;
          v112 = v30;
          v113 = 2048;
          v114 = v31;
          v115 = 2112;
          v116 = (uint64_t)v23;
          _os_log_impl(&dword_209602000, v27, OS_LOG_TYPE_DEBUG, "[%@ %p, sess %p, request %p] That data is %@", buf, 0x34u);

          v10 = v105;
        }

      }
    }
    -[CoreDAVTask setTotalBytesReceived:](self, "setTotalBytesReceived:", -[CoreDAVTask totalBytesReceived](self, "totalBytesReceived") + -[NSData length](v106, "length"));
    v32 = -[NSHTTPURLResponse expectedContentLength](self->_response, "expectedContentLength");
    -[CoreDAVTask responseProgressBlock](self, "responseProgressBlock");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      if (v32 == -1)
      {

        v34 = 0;
      }
      else
      {

        v34 = v32;
        if ((v32 & 0x8000000000000000) != 0)
          goto LABEL_21;
      }
      -[CoreDAVTask responseProgressBlock](self, "responseProgressBlock");
      v35 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, unint64_t, unint64_t, BOOL))v35)[2](v35, -[CoreDAVTask totalBytesReceived](self, "totalBytesReceived"), v34, v32 != -1);

    }
    if (v32 == -1)
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      objc_msgSend(v36, "logHandleForAccountInfoProvider:", v45);
      v38 = objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        v38 = v38;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          v46 = (objc_class *)objc_opt_class();
          NSStringFromClass(v46);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = -[NSData length](v106, "length");
          v49 = -[CoreDAVTask totalBytesReceived](self, "totalBytesReceived");
          *(_DWORD *)buf = 138413570;
          v108 = v40;
          v109 = 2048;
          v110 = self;
          v111 = 2048;
          v112 = v41;
          v113 = 2048;
          v114 = v47;
          v115 = 2048;
          v116 = v48;
          v10 = v105;
          v117 = 2048;
          v118 = v49;
          _os_log_impl(&dword_209602000, v38, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] didReceiveData: %lu new bytes, have received a total of %lld, no information on expected total", buf, 0x3Eu);

          goto LABEL_28;
        }
LABEL_29:

      }
LABEL_30:

LABEL_31:
      if (self->_task != v10)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVTask.m"), 1067, CFSTR("Incoming task should be what we're expecting"));

      }
      if (-[CoreDAVTask shouldLogResponseBody](self, "shouldLogResponseBody"))
        -[CoreDAVRequestLogger logCoreDAVResponseSnippet:withTaskIdentifier:isBody:](self->_logger, "logCoreDAVResponseSnippet:withTaskIdentifier:isBody:", v106, 0, 1);
      -[NSHTTPURLResponse allHeaderFields](self->_response, "allHeaderFields");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "valueForKey:", CFSTR("Content-Type"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[CoreDAVTask _shouldHandleStatusCode:](self, "_shouldHandleStatusCode:", -[NSHTTPURLResponse statusCode](self->_response, "statusCode")))
      {
        v52 = +[CoreDAVXMLParser canHandleContentType:](CoreDAVXMLParser, "canHandleContentType:", v51);
      }
      else
      {
        v52 = 0;
      }
      -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v53)
      {
        v54 = -[CoreDAVTask copyDefaultParserForContentType:](self, "copyDefaultParserForContentType:", v51);
        -[CoreDAVTask setResponseBodyParser:](self, "setResponseBodyParser:", v54);
        -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v55)
        {
          if (v52)
            v56 = -[CoreDAVXMLParser initWithRootElementNameSpace:name:parseClass:baseURL:]([CoreDAVXMLParser alloc], "initWithRootElementNameSpace:name:parseClass:baseURL:", 0, 0, 0, 0);
          else
            v56 = objc_alloc_init(CoreDAVNullParser);
          v57 = v56;

          -[CoreDAVTask setResponseBodyParser:](self, "setResponseBodyParser:", v57);
          v54 = v57;
        }

      }
      -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v58 != 0;

      v60 = MEMORY[0x20BD1136C]();
      v61 = -[NSData length](v106, "length");
      v62 = v61;
      v104 = v52;
      context = (void *)v60;
      if (v61 > 0x1000 && v58)
      {
        v99 = v9;
        v100 = v51;
        v63 = 0;
        v64 = -4096;
        do
        {
          v65 = (void *)MEMORY[0x20BD1136C]();
          v66 = objc_alloc(MEMORY[0x24BDBCE50]);
          v67 = objc_retainAutorelease(v106);
          v68 = (void *)objc_msgSend(v66, "initWithBytesNoCopy:length:freeWhenDone:", -[NSData bytes](v67, "bytes") + v63, 4096, 0);
          if (AnalyticsIsEventUsed()
            && !-[CoreDAVTask totalBytesWasProcessedAsAbnormallyLarge](self, "totalBytesWasProcessedAsAbnormallyLarge")
            && -[CoreDAVTask totalBytesReceived](self, "totalBytesReceived") >= 0x40000001)
          {
            AnalyticsSendEventLazy();
            -[CoreDAVTask setTotalBytesWasProcessedAsAbnormallyLarge:](self, "setTotalBytesWasProcessedAsAbnormallyLarge:", 1);
          }
          -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v69, "processData:forTask:", v68, self);

          v63 += 4096;
          objc_autoreleasePoolPop(v65);
          if (v62 + v64 <= 0x1000)
            break;
          v64 -= 4096;
        }
        while ((v59 & 1) != 0);
        if (v62 == v63)
          v70 = 0;
        else
          v70 = v59;
        v9 = v99;
        v51 = v100;
        v10 = v105;
        if ((v70 & 1) != 0)
        {
          if (v63)
          {
            v71 = objc_alloc(MEMORY[0x24BDBCE50]);
            v72 = (uint64_t)(-[NSData bytes](objc_retainAutorelease(v67), "bytes") + v63);
            v73 = v71;
            v51 = v100;
            v74 = (void *)objc_msgSend(v73, "initWithBytesNoCopy:length:freeWhenDone:", v72, v62 - v63, 0);
            -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = objc_msgSend(v75, "processData:forTask:", v74, self);

LABEL_63:
            goto LABEL_64;
          }
LABEL_62:
          -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v74, "processData:forTask:", v106, self);
          goto LABEL_63;
        }
      }
      else if (v61 && v58)
      {
        goto LABEL_62;
      }
LABEL_64:
      objc_autoreleasePoolPop(context);
      if (v104
        && (-[CoreDAVTask responseBodyParser](self, "responseBodyParser"),
            v76 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            isKindOfClass = objc_opt_isKindOfClass(),
            v76,
            (isKindOfClass & 1) != 0))
      {
        if ((v59 & 1) == 0)
        {
          +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
          objc_msgSend(v78, "logHandleForAccountInfoProvider:", v79);
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          if (v80)
          {
            v81 = v80;
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
            {
              v82 = (objc_class *)objc_opt_class();
              NSStringFromClass(v82);
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
              v101 = v51;
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "parserError");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              v108 = v83;
              v109 = 2048;
              v110 = self;
              v111 = 2048;
              v112 = v84;
              v113 = 2048;
              v114 = v85;
              v115 = 2112;
              v116 = (uint64_t)v87;
              _os_log_impl(&dword_209602000, v81, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Parser failed to parse XML body of response %@", buf, 0x34u);

              v10 = v105;
              v51 = v101;

            }
          }

LABEL_78:
        }
      }
      else if ((v59 & 1) == 0)
      {
        +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
        objc_msgSend(v88, "logHandleForAccountInfoProvider:", v89);
        v90 = (void *)objc_claimAutoreleasedReturnValue();

        if (v90)
        {
          v91 = v90;
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
          {
            v92 = (objc_class *)objc_opt_class();
            NSStringFromClass(v92);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
            v102 = v51;
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v96, "parserError");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v108 = v93;
            v109 = 2048;
            v110 = self;
            v111 = 2048;
            v112 = v94;
            v113 = 2048;
            v114 = v95;
            v115 = 2112;
            v116 = (uint64_t)v97;
            _os_log_impl(&dword_209602000, v91, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Parser failed to parse with error %@", buf, 0x34u);

            v10 = v105;
            v51 = v102;

          }
        }

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 3, 0);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask finishCoreDAVTaskWithError:](self, "finishCoreDAVTaskWithError:", v78);
        goto LABEL_78;
      }

      goto LABEL_80;
    }
LABEL_21:
    if (-[NSData length](v106, "length") >= v32)
      goto LABEL_31;
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    objc_msgSend(v36, "logHandleForAccountInfoProvider:", v37);
    v38 = objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v38 = v38;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v39 = (objc_class *)objc_opt_class();
        NSStringFromClass(v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = -[NSData length](v106, "length");
        v44 = -[CoreDAVTask totalBytesReceived](self, "totalBytesReceived");
        *(_DWORD *)buf = 138413826;
        v108 = v40;
        v109 = 2048;
        v110 = self;
        v111 = 2048;
        v112 = v41;
        v113 = 2048;
        v114 = v42;
        v115 = 2048;
        v116 = v43;
        v117 = 2048;
        v118 = v44;
        v119 = 2048;
        v120 = v32;
        _os_log_impl(&dword_209602000, v38, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] didReceiveData: %lu new bytes, now received %lu/%lld total", buf, 0x48u);

        v10 = v105;
LABEL_28:

        goto LABEL_29;
      }
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  if (!self->_haveParsedFakeResponseData)
  {
    v12 = fakeResponseData;

    self->_haveParsedFakeResponseData = 1;
    v106 = v12;
    goto LABEL_4;
  }
LABEL_80:

}

id __48__CoreDAVTask__session_dataTask_didReceiveData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "responseHeaders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Host"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("Host"));

  objc_msgSend(*(id *)(a1 + 32), "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("URL"));

  return v2;
}

- (BOOL)_shouldHandleStatusCode:(int64_t)a3
{
  BOOL v4;

  v4 = a3 > 499 && a3 != 503;
  return a3 == 403 || v4;
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  CoreDAVTask *v13;
  id v14;

  v7 = a4;
  v8 = a5;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__CoreDAVTask_URLSession_task_needNewBodyStream___block_invoke;
  v11[3] = &unk_24C1D9D38;
  v12 = v7;
  v13 = self;
  v14 = v8;
  v9 = v8;
  v10 = v7;
  -[CoreDAVTask _runOnCallbackThread:](self, "_runOnCallbackThread:", v11);

}

void __49__CoreDAVTask_URLSession_task_needNewBodyStream___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
  objc_msgSend(v4, "logHandleForAccountInfoProvider:", WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    if (v6)
    {
      v15 = v6;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 40);
        objc_msgSend(v18, "_sessionForLogging");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "_requestForLogging");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *(_QWORD *)(a1 + 40);
        v23 = 138413314;
        v24 = v17;
        v25 = 2048;
        v26 = v18;
        v27 = 2048;
        v28 = v19;
        v29 = 2048;
        v30 = v20;
        v31 = 2112;
        v32 = v21;
        _os_log_impl(&dword_209602000, v15, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Connection needs a new body stream, self %@", (uint8_t *)&v23, 0x34u);

      }
    }

    objc_msgSend(*(id *)(a1 + 40), "requestBodyStream");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    if (v6)
    {
      v7 = v6;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(a1 + 40);
        objc_msgSend(v10, "_sessionForLogging");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "_requestForLogging");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(a1 + 32);
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
        v23 = 138413570;
        v24 = v9;
        v25 = 2048;
        v26 = v10;
        v27 = 2048;
        v28 = v11;
        v29 = 2048;
        v30 = v12;
        v31 = 2048;
        v32 = v13;
        v33 = 2048;
        v34 = v14;
        _os_log_impl(&dword_209602000, v7, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Ignoring -URLSession:task:needNewBodyStream: callback for task %p because it doesn't match our current task, %p", (uint8_t *)&v23, 0x3Eu);

      }
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (id)lastRedirectURL
{
  return (id)-[NSMutableArray lastObject](self->_redirectHistory, "lastObject");
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  CoreDAVTask *v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __87__CoreDAVTask_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke;
  v22[3] = &unk_24C1D9E00;
  v23 = v13;
  v24 = self;
  v25 = v12;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v17 = v15;
  v18 = v14;
  v19 = v12;
  v20 = v16;
  v21 = v13;
  -[CoreDAVTask _runOnCallbackThread:](self, "_runOnCallbackThread:", v22);

}

uint64_t __87__CoreDAVTask_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD **)(a1 + 40);
  if (v3 == v2[7])
    return objc_msgSend(v2, "_session:task:willPerformHTTPRedirection:newRequest:completionHandler:", *(_QWORD *)(a1 + 48));
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
  objc_msgSend(v4, "logHandleForAccountInfoProvider:", WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 40);
      objc_msgSend(v10, "_sessionForLogging");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_requestForLogging");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
      v16 = 138413570;
      v17 = v9;
      v18 = 2048;
      v19 = v10;
      v20 = 2048;
      v21 = v11;
      v22 = 2048;
      v23 = v12;
      v24 = 2048;
      v25 = v13;
      v26 = 2048;
      v27 = v14;
      _os_log_impl(&dword_209602000, v7, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Ignoring -URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler: callback for task %p because it doesn't match our current task, %p", (uint8_t *)&v16, 0x3Eu);

    }
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

- (void)_session:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  unint64_t v14;
  id v15;
  void (**v16)(id, _QWORD);
  NSURLRequest **p_request;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  id v22;
  id v23;
  void (**v24)(id, _QWORD);
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id WeakRetained;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  NSObject *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  void *v41;
  NSURLRequest *v42;
  void *v43;
  id v44;
  void *v45;
  NSObject *v46;
  objc_class *v47;
  void *v48;
  void *v49;
  NSMutableArray *redirectHistory;
  id v51;
  char v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  NSObject *v62;
  objc_class *v63;
  void *v64;
  uint64_t v65;
  NSURLRequest *request;
  void *v67;
  CoreDAVRequestLogger *logger;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSMutableArray *v73;
  NSMutableArray *v74;
  NSMutableArray *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  char v80;
  uint64_t v81;
  unint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void (**v91)(id, _QWORD);
  void (**v92)(id, _QWORD);
  char loga;
  os_log_t log;
  NSObject *logb;
  id v96;
  id v97;
  uint8_t buf[4];
  void *v99;
  __int16 v100;
  CoreDAVTask *v101;
  __int16 v102;
  void *v103;
  __int16 v104;
  uint64_t v105;
  __int16 v106;
  id v107;
  __int16 v108;
  void *v109;
  __int16 v110;
  id v111;
  __int16 v112;
  unint64_t v113;
  __int16 v114;
  unint64_t v115;
  uint64_t v116;

  v116 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = (unint64_t)a5;
  v15 = a6;
  v16 = (void (**)(id, _QWORD))a7;
  self->_didSendRequest = 1;
  if (!v14 || -[CoreDAVTask allowAutomaticRedirects](self, "allowAutomaticRedirects"))
  {
    v96 = v13;
    p_request = &self->_request;
    -[NSURLRequest URL](self->_request, "URL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scheme");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "hasPrefix:", CFSTR("https")) & 1) != 0)
    {
      objc_msgSend(v15, "URL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "scheme");
      v21 = v14;
      v22 = v15;
      v23 = v12;
      v24 = v16;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      loga = objc_msgSend(v25, "hasPrefix:", CFSTR("https"));

      v16 = v24;
      v12 = v23;
      v15 = v22;
      v14 = v21;
      p_request = &self->_request;

      if ((loga & 1) == 0)
      {
        v16[2](v16, 0);
LABEL_41:
        v13 = v96;
        goto LABEL_42;
      }
    }
    else
    {

    }
    v91 = v16;
    v26 = (void *)objc_msgSend(v15, "mutableCopy");
    objc_msgSend(v15, "URL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "host");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "length");

    if (v29)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      objc_msgSend(WeakRetained, "user");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "CDVURLWithUser:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "CDVURLWithPassword:", 0);
      v33 = objc_claimAutoreleasedReturnValue();

      log = (os_log_t)v33;
      objc_msgSend(v26, "setURL:", v33);
    }
    else
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      objc_msgSend(v43, "logHandleForAccountInfoProvider:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
      {
        v46 = v45;
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v47 = (objc_class *)objc_opt_class();
          NSStringFromClass(v47);
          logb = v46;
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask url](self, "url");
          v87 = v27;
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          redirectHistory = self->_redirectHistory;
          *(_DWORD *)buf = 138413826;
          v99 = v89;
          v100 = 2048;
          v101 = self;
          v102 = 2048;
          v103 = v85;
          v104 = 2048;
          v105 = (uint64_t)v48;
          v106 = 2112;
          v107 = v49;
          v108 = 2112;
          v109 = redirectHistory;
          v110 = 2112;
          v111 = v87;
          _os_log_impl(&dword_209602000, logb, OS_LOG_TYPE_ERROR, "[%@ %p, sess %p, request %p] Received redirect where request.url.host is empty, not setting user on the redirected URL. \nOriginal URL: %@\nRedirect history: %@\nRedirected to:%@  ", buf, 0x48u);

          v27 = v87;
          v46 = logb;
        }

      }
      log = v27;
    }
    v51 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    v52 = objc_opt_respondsToSelector();

    if ((v52 & 1) != 0)
    {
      v53 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      v54 = objc_msgSend(v53, "shouldHandleHTTPCookiesForURL:", log);

    }
    else
    {
      v54 = 0;
    }
    objc_msgSend(v26, "setHTTPShouldHandleCookies:", v54);
    -[NSURLRequest HTTPBodyStream](*p_request, "HTTPBodyStream");
    v55 = objc_claimAutoreleasedReturnValue();
    v90 = (void *)v55;
    if (v55)
    {
      objc_msgSend(v26, "setHTTPBodyStream:", v55);
    }
    else
    {
      -[NSURLRequest HTTPBody](*p_request, "HTTPBody");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setHTTPBody:", v56);

    }
    -[NSURLRequest HTTPMethod](*p_request, "HTTPMethod");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setHTTPMethod:", v57);

    -[NSURLRequest allHTTPHeaderFields](*p_request, "allHTTPHeaderFields");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAllHTTPHeaderFields:", v58);

    if (v14)
    {
      v88 = v27;
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      objc_msgSend(v59, "logHandleForAccountInfoProvider:", v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      v86 = v12;
      if (v61)
      {
        v62 = v61;
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          v63 = (objc_class *)objc_opt_class();
          NSStringFromClass(v63);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
          v65 = objc_claimAutoreleasedReturnValue();
          request = self->_request;
          *(_DWORD *)buf = 138414338;
          v99 = v84;
          v100 = 2048;
          v101 = self;
          v102 = 2048;
          v103 = v64;
          v104 = 2048;
          v105 = v65;
          v67 = (void *)v65;
          v106 = 2112;
          v107 = v86;
          v108 = 2112;
          v109 = request;
          v110 = 2112;
          v111 = v15;
          v112 = 2112;
          v113 = (unint64_t)v26;
          v114 = 2112;
          v115 = v14;
          _os_log_impl(&dword_209602000, v62, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Connection is getting redirected: [%@]\nInitial request: [%@]\nProposed request: [%@]\nReconstructed request: [%@]\nRedirect response: [%@]", buf, 0x5Cu);

        }
      }

      logger = self->_logger;
      v69 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v26, "URL");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "stringWithFormat:", CFSTR("REDIRECT: %@\n\n"), v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "dataUsingEncoding:", 4);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVRequestLogger logCoreDAVResponseSnippet:withTaskIdentifier:](logger, "logCoreDAVResponseSnippet:withTaskIdentifier:", v72, self->_uniqueID);

      if (objc_msgSend((id)v14, "statusCode") == 301)
      {
        v73 = self->_redirectHistory;
        if (!v73)
        {
          v74 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
          v75 = self->_redirectHistory;
          self->_redirectHistory = v74;

          v73 = self->_redirectHistory;
        }
        -[NSMutableArray addObject:](v73, "addObject:", log);
      }
      objc_msgSend(v15, "URL");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "host");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSURLRequest URL](*p_request, "URL");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "host");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v77, "isEqualToString:", v79);

      v12 = v86;
      v27 = v88;
      if ((v80 & 1) == 0)
        *(_WORD *)&self->_justTriedTokenAuth = 0;
    }
    -[CoreDAVRequestLogger finishCoreDAVResponse](self->_logger, "finishCoreDAVResponse");
    objc_storeStrong((id *)p_request, v26);
    objc_msgSend(v15, "HTTPBodyStream");
    v81 = objc_claimAutoreleasedReturnValue();
    v82 = v14 | v81;

    v16 = v91;
    if (!v82)
    {
      -[CoreDAVTask requestBodyStream](self, "requestBodyStream");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      if (v83)
        objc_msgSend(v26, "setHTTPBodyStream:", v83);

    }
    ((void (**)(id, void *))v91)[2](v91, v26);

    goto LABEL_41;
  }
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  objc_msgSend(v34, "logHandleForAccountInfoProvider:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    v37 = v36;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      v97 = v13;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
      v92 = v16;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = self->_request;
      *(_DWORD *)buf = 138414082;
      v99 = v39;
      v100 = 2048;
      v101 = self;
      v102 = 2048;
      v103 = v40;
      v104 = 2048;
      v105 = (uint64_t)v41;
      v106 = 2112;
      v107 = v12;
      v108 = 2112;
      v109 = v42;
      v110 = 2112;
      v111 = v15;
      v112 = 2112;
      v113 = v14;
      _os_log_impl(&dword_209602000, v37, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Connection is getting redirected but automatic redirections are disabled.  Connection: [%@]\nInitial request: [%@]\nProposed request: [%@]\nRedirect response: [%@]", buf, 0x52u);

      v16 = v92;
      v13 = v97;
    }

  }
  v16[2](v16, 0);
LABEL_42:

}

- (BOOL)_canAuthenticateAgainstProtectionSpace:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  char v15;
  id v16;
  char v17;
  char v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  id v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v31;
  id v32;
  char v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  CoreDAVTask *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  objc_msgSend(v5, "logHandleForAccountInfoProvider:", WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v35 = v10;
      v36 = 2048;
      v37 = self;
      v38 = 2048;
      v39 = v11;
      v40 = 2048;
      v41 = v12;
      _os_log_impl(&dword_209602000, v8, OS_LOG_TYPE_DEBUG, "[%@ %p, sess %p, request %p] _canAuthenticateAgainstProtectionSpace:", buf, 0x2Au);

    }
  }

  objc_msgSend(v4, "authenticationMethod");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    v16 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    v17 = objc_msgSend(v16, "handleAuthenticateAgainstProtectionSpace:", v4);
LABEL_9:
    v18 = v17;

    goto LABEL_14;
  }
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDB7408]))
  {
    v16 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    v17 = objc_opt_respondsToSelector();
    goto LABEL_9;
  }
  if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDB7410]) & 1) != 0
    || (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDB73F0]) & 1) != 0)
  {
    v18 = 1;
  }
  else
  {
    v18 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDB73F8]);
  }
LABEL_14:
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  objc_msgSend(v19, "logHandleForAccountInfoProvider:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = v21;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
      v33 = v18;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v33 & 1);
      v32 = v4;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413826;
      v35 = v24;
      v36 = 2048;
      v37 = self;
      v38 = 2048;
      v39 = v31;
      v40 = 2048;
      v41 = v25;
      v42 = 2114;
      v43 = v28;
      v44 = 2114;
      v45 = v13;
      v46 = 2114;
      v47 = v29;
      _os_log_impl(&dword_209602000, v22, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] _accountInfoProvider: (%{public}@) Can authenticate against protection space %{public}@? %{public}@", buf, 0x48u);

      v4 = v32;
      v18 = v33;

    }
  }

  return v18 & 1;
}

- (void)_didReceiveAuthenticationChallenge:(id)a3 forTask:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  _UNKNOWN **v10;
  void *v11;
  id WeakRetained;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  NSObject *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  NSObject *v48;
  objc_class *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t *v57;
  uint64_t v58;
  int v59;
  void *v60;
  id v61;
  NSObject *v62;
  objc_class *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  NSObject *v78;
  objc_class *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  id v86;
  char v87;
  id v88;
  NSObject *v89;
  objc_class *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  NSObject *v97;
  objc_class *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  char v103;
  id v104;
  int v105;
  void *v106;
  void *v107;
  id v108;
  void *v109;
  NSObject *v110;
  objc_class *v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  objc_class *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  id v122;
  void *v123;
  CoreDAVTask *v124;
  id v125;
  void *v126;
  id *location;
  uint8_t buf[4];
  void *v129;
  __int16 v130;
  CoreDAVTask *v131;
  __int16 v132;
  void *v133;
  __int16 v134;
  void *v135;
  __int16 v136;
  id v137;
  __int16 v138;
  uint64_t v139;
  uint64_t v140;

  v140 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v125 = a4;
  v9 = a5;
  objc_msgSend(v8, "protectionSpace");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "authenticationMethod");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = &off_24C1D9000;
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = self;
  location = (id *)&self->_accountInfoProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  objc_msgSend(v11, "logHandleForAccountInfoProvider:", WeakRetained);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = v13;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
      v17 = v9;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
      v19 = v8;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v129 = v16;
      v130 = 2048;
      v131 = v124;
      v10 = &off_24C1D9000;
      v132 = 2048;
      v133 = v18;
      v134 = 2048;
      v135 = v20;
      v136 = 2114;
      v137 = v126;
      v138 = 2048;
      v139 = objc_msgSend(v19, "previousFailureCount");
      _os_log_impl(&dword_209602000, v14, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Received authentication challenge for method %{public}@, previous failure count %ld", buf, 0x3Eu);

      v8 = v19;
      v9 = v17;

    }
  }

  objc_msgSend(v8, "failureResponse");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "allHeaderFields");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "CDVObjectForKeyCaseInsensitive:", CFSTR("X-ClientToken-Request"));
  v23 = objc_claimAutoreleasedReturnValue();
  if (!v23)
    goto LABEL_13;
  v24 = (void *)v23;
  v25 = objc_loadWeakRetained(location);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_12:

LABEL_13:
    goto LABEL_14;
  }
  v26 = v9;
  v27 = objc_loadWeakRetained(location);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    v9 = v26;
    goto LABEL_12;
  }
  v28 = v8;
  v29 = objc_loadWeakRetained(location);
  objc_msgSend(v29, "clientToken");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = objc_msgSend(v30, "length");

  v8 = v28;
  v9 = v26;
  if (v121)
    goto LABEL_14;
  v31 = objc_loadWeakRetained(location);
  objc_msgSend(v31, "clientTokenRequestedByServer");

  v32 = objc_loadWeakRetained(location);
  objc_msgSend(v32, "clientToken");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "length");

  if (!v34)
  {
LABEL_14:
    if (objc_msgSend(v8, "previousFailureCount"))
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_loadWeakRetained(location);
      objc_msgSend(v37, "logHandleForAccountInfoProvider:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v39)
      {
LABEL_20:

        v36 = v126;
LABEL_21:

LABEL_22:
        objc_msgSend(v10[66], "sharedLogging");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_loadWeakRetained(location);
        objc_msgSend(v45, "logHandleForAccountInfoProvider:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          v48 = v47;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            v49 = (objc_class *)objc_opt_class();
            NSStringFromClass(v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            -[CoreDAVTask _sessionForLogging](v124, "_sessionForLogging");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            -[CoreDAVTask _requestForLogging](v124, "_requestForLogging");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v129 = v50;
            v130 = 2048;
            v131 = v124;
            v132 = 2048;
            v133 = v51;
            v134 = 2048;
            v135 = v52;
            _os_log_impl(&dword_209602000, v48, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] continuing without credential for challenge", buf, 0x2Au);

          }
        }

        (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
LABEL_27:
        v35 = v123;
        goto LABEL_28;
      }
      v40 = v39;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        v41 = (objc_class *)objc_opt_class();
        NSStringFromClass(v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _sessionForLogging](v124, "_sessionForLogging");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _requestForLogging](v124, "_requestForLogging");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413315;
        v129 = v42;
        v130 = 2048;
        v131 = v124;
        v132 = 2048;
        v133 = v43;
        v134 = 2048;
        v135 = v44;
        v136 = 2113;
        v137 = v8;
        _os_log_impl(&dword_209602000, v40, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] ignoring challenge %{private}@ because it's already failed", buf, 0x34u);

      }
      v39 = v40;
LABEL_19:

      goto LABEL_20;
    }
    v53 = v9;
    objc_msgSend(v125, "currentRequest");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "URL");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "scheme");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "isEqualToString:", CFSTR("http"));
    v57 = (uint64_t *)MEMORY[0x24BDB73F0];
    if (v56)
    {
      v58 = *MEMORY[0x24BDB73F0];
      v36 = v126;
      v59 = objc_msgSend(v126, "isEqualToString:", *MEMORY[0x24BDB73F0]);

      if (v59)
      {
        +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_loadWeakRetained(location);
        objc_msgSend(v60, "logHandleForAccountInfoProvider:", v61);
        v62 = objc_claimAutoreleasedReturnValue();

        v9 = v53;
        if (!v62)
        {
          v10 = &off_24C1D9000;
          goto LABEL_61;
        }
        v62 = v62;
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          v63 = (objc_class *)objc_opt_class();
          NSStringFromClass(v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _sessionForLogging](v124, "_sessionForLogging");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _requestForLogging](v124, "_requestForLogging");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v129 = v64;
          v130 = 2048;
          v131 = v124;
          v132 = 2048;
          v133 = v65;
          v134 = 2048;
          v135 = v66;
          v136 = 2112;
          v137 = v37;
          _os_log_impl(&dword_209602000, v62, OS_LOG_TYPE_ERROR, "[%@ %p, sess %p, request %p] Cancelling authentication challenge for insecure connection using basic authentication for URL %@", buf, 0x34u);

        }
        v10 = &off_24C1D9000;
LABEL_35:

LABEL_61:
        objc_msgSend(v10[66], "sharedLogging");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = objc_loadWeakRetained(location);
        objc_msgSend(v94, "logHandleForAccountInfoProvider:", v95);
        v96 = (void *)objc_claimAutoreleasedReturnValue();

        v36 = v126;
        if (v96)
        {
          v97 = v96;
          if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
          {
            v98 = (objc_class *)objc_opt_class();
            NSStringFromClass(v98);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            -[CoreDAVTask _sessionForLogging](v124, "_sessionForLogging");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            -[CoreDAVTask _requestForLogging](v124, "_requestForLogging");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v129 = v99;
            v130 = 2048;
            v131 = v124;
            v132 = 2048;
            v133 = v100;
            v134 = 2048;
            v135 = v101;
            _os_log_impl(&dword_209602000, v97, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Cancelling auth challenge", buf, 0x2Au);

          }
        }

        (*((void (**)(id, uint64_t, _QWORD))v9 + 2))(v9, 2, 0);
        goto LABEL_27;
      }
    }
    else
    {

      v58 = *v57;
      v36 = v126;
    }
    if ((objc_msgSend(v36, "isEqualToString:", v58) & 1) != 0
      || objc_msgSend(v36, "isEqualToString:", *MEMORY[0x24BDB73F8]))
    {
      if (!-[CoreDAVTask _shouldCreateCredentialForBasicOrDigestAuthChallenge:](v124, "_shouldCreateCredentialForBasicOrDigestAuthChallenge:", v8))
      {
        objc_msgSend(v8, "proposedCredential");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "password");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend(v84, "length");

        v9 = v53;
        if (v85)
        {
          v10 = &off_24C1D9000;
          goto LABEL_21;
        }
        +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = objc_loadWeakRetained(location);
        objc_msgSend(v39, "logHandleForAccountInfoProvider:", v88);
        v40 = objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          v89 = v40;
          if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
          {
            v90 = (objc_class *)objc_opt_class();
            NSStringFromClass(v90);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            -[CoreDAVTask _sessionForLogging](v124, "_sessionForLogging");
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            -[CoreDAVTask _requestForLogging](v124, "_requestForLogging");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            v122 = objc_loadWeakRetained(location);
            objc_msgSend(v122, "accountID");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v129 = v91;
            v130 = 2048;
            v131 = v124;
            v132 = 2048;
            v133 = v120;
            v134 = 2048;
            v135 = v92;
            v136 = 2114;
            v137 = v93;
            _os_log_impl(&dword_209602000, v89, OS_LOG_TYPE_ERROR, "[%@ %p, sess %p, request %p] Got a credential challenge, but we don't have any credentials. This request will likely fail. accountID = %{public}@", buf, 0x34u);

            v9 = v53;
          }

        }
        v10 = &off_24C1D9000;
        goto LABEL_19;
      }
      v67 = (void *)MEMORY[0x24BDB7480];
      v68 = objc_loadWeakRetained(location);
      objc_msgSend(v68, "user");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "CDVStringByRemovingPercentEscapesForHREF");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v8;
      v72 = objc_loadWeakRetained(location);
      objc_msgSend(v72, "password");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "credentialWithUser:password:persistence:", v70, v73, 1);
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = v126;
      v8 = v71;

      v9 = v53;
    }
    else
    {
      v9 = v53;
      if (!objc_msgSend(v36, "isEqualToString:", *MEMORY[0x24BDB7408])
        || (v86 = objc_loadWeakRetained(location), v87 = objc_opt_respondsToSelector(),
                                                   v86,
                                                   (v87 & 1) == 0))
      {
        v10 = &off_24C1D9000;
        if (!objc_msgSend(v36, "isEqualToString:", *MEMORY[0x24BDB73D8]))
        {
          v102 = objc_loadWeakRetained(location);
          v103 = objc_opt_respondsToSelector();

          if ((v103 & 1) != 0)
          {
            v104 = objc_loadWeakRetained(location);
            v105 = objc_msgSend(v104, "handleTrustChallenge:completionHandler:", v8, v9);

            if (v105)
            {
              CDVRunLoopModesToPerformDelayedSelectorsIn();
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              -[CoreDAVTask performSelector:withObject:afterDelay:inModes:](v124, "performSelector:withObject:afterDelay:inModes:", sel_performCoreDAVTask, 0, v106, 0.0);

            }
            +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            v108 = objc_loadWeakRetained(location);
            objc_msgSend(v107, "logHandleForAccountInfoProvider:", v108);
            v109 = (void *)objc_claimAutoreleasedReturnValue();

            if (v109)
            {
              v110 = v109;
              if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
              {
                v111 = (objc_class *)objc_opt_class();
                NSStringFromClass(v111);
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                -[CoreDAVTask _sessionForLogging](v124, "_sessionForLogging");
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                -[CoreDAVTask _requestForLogging](v124, "_requestForLogging");
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413058;
                v129 = v112;
                v130 = 2048;
                v131 = v124;
                v132 = 2048;
                v133 = v113;
                v134 = 2048;
                v135 = v114;
                _os_log_impl(&dword_209602000, v110, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Waiting for runloop callback to decide what to do", buf, 0x2Au);

              }
            }

            goto LABEL_27;
          }
          +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = objc_loadWeakRetained(location);
          objc_msgSend(v60, "logHandleForAccountInfoProvider:", v115);
          v62 = objc_claimAutoreleasedReturnValue();

          if (!v62)
            goto LABEL_61;
          v62 = v62;
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            v116 = (objc_class *)objc_opt_class();
            NSStringFromClass(v116);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            -[CoreDAVTask _sessionForLogging](v124, "_sessionForLogging");
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            -[CoreDAVTask _requestForLogging](v124, "_requestForLogging");
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v129 = v117;
            v130 = 2048;
            v131 = v124;
            v10 = &off_24C1D9000;
            v132 = 2048;
            v133 = v118;
            v134 = 2048;
            v135 = v119;
            _os_log_impl(&dword_209602000, v62, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] AccountInfoProvider doesn't know how to handle a trust challenge, so we're just going to have to cancel.", buf, 0x2Au);

          }
          goto LABEL_35;
        }
        -[CoreDAVTask credentialForClientCertificateChallenge:](v124, "credentialForClientCertificateChallenge:", v8);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_42:

        if (v74)
        {
          +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = objc_loadWeakRetained(location);
          objc_msgSend(v75, "logHandleForAccountInfoProvider:", v76);
          v77 = (void *)objc_claimAutoreleasedReturnValue();

          if (v77)
          {
            v78 = v77;
            if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
            {
              v79 = (objc_class *)objc_opt_class();
              NSStringFromClass(v79);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              -[CoreDAVTask _sessionForLogging](v124, "_sessionForLogging");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              -[CoreDAVTask _requestForLogging](v124, "_requestForLogging");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413315;
              v129 = v80;
              v130 = 2048;
              v131 = v124;
              v132 = 2048;
              v133 = v81;
              v134 = 2048;
              v135 = v82;
              v136 = 2113;
              v137 = v74;
              _os_log_impl(&dword_209602000, v78, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Using credential %{private}@ for challenge", buf, 0x34u);

            }
            v36 = v126;
          }

          (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v74);
          goto LABEL_27;
        }
        goto LABEL_22;
      }
      -[CoreDAVTask credentialForOAuthChallenge:](v124, "credentialForOAuthChallenge:", v8);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = &off_24C1D9000;
    goto LABEL_42;
  }
  v124->_shouldRetryWithClientToken = 1;
  (*((void (**)(id, uint64_t, _QWORD))v9 + 2))(v9, 2, 0);
  v35 = v123;
  v36 = v126;
LABEL_28:

}

- (BOOL)_shouldCreateCredentialForBasicOrDigestAuthChallenge:(id)a3
{
  id v4;
  CoreDAVAccountInfoProvider **p_accountInfoProvider;
  void *WeakRetained;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  int v15;

  v4 = a3;
  p_accountInfoProvider = &self->_accountInfoProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  objc_msgSend(WeakRetained, "password");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    v8 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    objc_msgSend(v8, "user");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (!v10)
    {
      LOBYTE(v15) = 0;
      goto LABEL_7;
    }
    objc_msgSend(v4, "proposedCredential");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasPassword");

    objc_msgSend(v4, "proposedCredential");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "password");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    objc_msgSend(v13, "password");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v12 & objc_msgSend(v7, "isEqualToString:", v14) ^ 1;

  }
  else
  {
    LOBYTE(v15) = 0;
  }

LABEL_7:
  return v15;
}

- (void)_handleAuthenticationChallenge:(id)a3 task:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  __CFString *v12;
  void *v13;
  CoreDAVAccountInfoProvider **p_accountInfoProvider;
  id WeakRetained;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  CoreDAVAccountInfoProvider **v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  NSObject *v39;
  objc_class *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  NSObject *v59;
  objc_class *v60;
  void *v61;
  void *v62;
  void *v63;
  const void *XMobileMeAuthToken;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  NSObject *v69;
  objc_class *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  const __CFString *v75;
  void *v76;
  id v77;
  void *v78;
  NSObject *v79;
  objc_class *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  void (**v89)(id, uint64_t, _QWORD);
  void (**v90)(id, uint64_t, _QWORD);
  void (**v91)(id, uint64_t, _QWORD);
  void *v92;
  __CFString *v93;
  id v94;
  id v95;
  id v96;
  uint8_t buf[4];
  void *v98;
  __int16 v99;
  CoreDAVTask *v100;
  __int16 v101;
  void *v102;
  __int16 v103;
  uint64_t v104;
  __int16 v105;
  const __CFString *v106;
  uint64_t v107;

  v107 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  objc_msgSend(v8, "protectionSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "authenticationMethod");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  p_accountInfoProvider = &self->_accountInfoProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  objc_msgSend(v13, "logHandleForAccountInfoProvider:", WeakRetained);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = v16;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v89 = v10;
      v94 = v9;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
      v20 = v12;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
      v22 = v11;
      v23 = v8;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v98 = v19;
      v99 = 2048;
      v100 = self;
      v101 = 2048;
      v102 = v21;
      v103 = 2048;
      v104 = (uint64_t)v24;
      v105 = 2114;
      v106 = v20;
      _os_log_impl(&dword_209602000, v17, OS_LOG_TYPE_DEBUG, "[%@ %p, sess %p, request %p] _handleAuthenticationChallenge:task:completionHandler: for auth mechanism %{public}@", buf, 0x34u);

      v8 = v23;
      v11 = v22;
      p_accountInfoProvider = &self->_accountInfoProvider;

      v12 = (__CFString *)v20;
      v9 = v94;
      v10 = v89;
    }

  }
  if (!-[__CFString isEqualToString:](v12, "isEqualToString:", *MEMORY[0x24BDB7418]))
  {
    self->_justTriedTokenAuth = 0;
    if (-[CoreDAVTask _canAuthenticateAgainstProtectionSpace:](self, "_canAuthenticateAgainstProtectionSpace:", v11))
    {
      -[CoreDAVTask _didReceiveAuthenticationChallenge:forTask:completionHandler:](self, "_didReceiveAuthenticationChallenge:forTask:completionHandler:", v8, v9, v10);
      goto LABEL_22;
    }
    if ((-[__CFString isEqualToString:](v12, "isEqualToString:", *MEMORY[0x24BDB7410]) & 1) != 0
      || -[__CFString isEqualToString:](v12, "isEqualToString:", *MEMORY[0x24BDB73D8]))
    {
      v10[2](v10, 1, 0);
      goto LABEL_22;
    }
    goto LABEL_16;
  }
  v93 = v12;
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_loadWeakRetained((id *)p_accountInfoProvider);
  objc_msgSend(v25, "logHandleForAccountInfoProvider:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = v27;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
      v90 = v10;
      v95 = v9;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
      v32 = p_accountInfoProvider;
      v33 = v11;
      v34 = v8;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v98 = v30;
      v99 = 2048;
      v100 = self;
      v101 = 2048;
      v102 = v31;
      v103 = 2048;
      v104 = (uint64_t)v35;
      _os_log_impl(&dword_209602000, v28, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] MobileMeAuth requested", buf, 0x2Au);

      v8 = v34;
      v11 = v33;
      p_accountInfoProvider = v32;

      v9 = v95;
      v10 = v90;

    }
  }

  if (self->_everTriedTokenAuth)
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    objc_msgSend(v36, "logHandleForAccountInfoProvider:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v93;
    if (v38)
    {
      v39 = v38;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = (objc_class *)objc_opt_class();
        NSStringFromClass(v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
        v91 = v10;
        v42 = v9;
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
        v44 = v11;
        v45 = v8;
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v98 = v41;
        v99 = 2048;
        v100 = self;
        v101 = 2048;
        v102 = v43;
        v103 = 2048;
        v104 = (uint64_t)v46;
        _os_log_impl(&dword_209602000, v39, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Rejecting token auth because we've already tried it.", buf, 0x2Au);

        v8 = v45;
        v11 = v44;

        v9 = v42;
        v10 = v91;

        v12 = v93;
      }

    }
LABEL_16:
    v10[2](v10, 3, 0);
    goto LABEL_22;
  }
  v88 = v8;
  v92 = v11;
  v96 = v9;
  *(_WORD *)&self->_justTriedTokenAuth = 257;
  v47 = objc_loadWeakRetained((id *)p_accountInfoProvider);
  objc_msgSend(v47, "user");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "length");

  if (v49)
  {
    v50 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    objc_msgSend(v50, "user");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    objc_msgSend(v52, "password");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v92, "realm");
    v54 = objc_claimAutoreleasedReturnValue();
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    objc_msgSend(v55, "logHandleForAccountInfoProvider:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v96;
    v86 = v53;
    v87 = (void *)v54;
    if (v57)
    {
      v58 = v51;
      v59 = v57;
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        v60 = (objc_class *)objc_opt_class();
        NSStringFromClass(v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v98 = v61;
        v99 = 2048;
        v100 = self;
        v101 = 2048;
        v102 = v62;
        v103 = 2048;
        v104 = (uint64_t)v63;
        _os_log_impl(&dword_209602000, v59, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Creating mme token", buf, 0x2Au);

        v9 = v96;
      }

      v51 = v58;
      v53 = v86;
    }

    XMobileMeAuthToken = (const void *)_CFURLCredentialCreateXMobileMeAuthToken();
    v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB7480]), "_initWithCFURLCredential:", XMobileMeAuthToken);
    CFRelease(XMobileMeAuthToken);
    ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v65);
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    objc_msgSend(v66, "logHandleForAccountInfoProvider:", v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v88;
    v12 = v93;
    if (v68)
    {
      v85 = v51;
      v69 = v68;
      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
      {
        v70 = (objc_class *)objc_opt_class();
        NSStringFromClass(v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
        v73 = objc_claimAutoreleasedReturnValue();
        v74 = (void *)v73;
        *(_DWORD *)buf = 138413314;
        v75 = CFSTR("Valid");
        v98 = v71;
        if (!v65)
          v75 = CFSTR("InValid");
        v99 = 2048;
        v100 = self;
        v101 = 2048;
        v102 = v72;
        v103 = 2048;
        v104 = v73;
        v105 = 2114;
        v106 = v75;
        _os_log_impl(&dword_209602000, v69, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Responded to authChallenge with a %{public}@ mme token", buf, 0x34u);

        v9 = v96;
        v12 = v93;

      }
      v51 = v85;
      v53 = v86;
    }

    v11 = v92;
  }
  else
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    objc_msgSend(v76, "logHandleForAccountInfoProvider:", v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v88;
    v9 = v96;
    if (v78)
    {
      v79 = v78;
      if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
      {
        v80 = (objc_class *)objc_opt_class();
        NSStringFromClass(v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v98 = v81;
        v99 = 2048;
        v100 = self;
        v101 = 2048;
        v102 = v82;
        v103 = 2048;
        v104 = (uint64_t)v83;
        _os_log_impl(&dword_209602000, v79, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Using existing token because no user was provided.", buf, 0x2Au);

        v8 = v88;
        v9 = v96;

      }
    }

    objc_msgSend(v8, "proposedCredential");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v84);

    v12 = v93;
  }
LABEL_22:

}

- (void)handleWebLoginRequestWithCompletionBlock:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id WeakRetained;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t))a3;
  -[CoreDAVTask responseHeaders](self, "responseHeaders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CDVObjectForKeyCaseInsensitive:", CFSTR("X-Web-Login-Required"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    CDVExtractValuesFromRedirectString(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("kCDVRedirectReasonKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("kCDVRedirectURLKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[NSURLRequest URL](self->_request, "URL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "CDVIsSafeRedirectForRequestURL:", v10);

      if (v11)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
        objc_msgSend(WeakRetained, "webLoginRequestedAtURL:reasonString:inQueue:completionBlock:", v9, v8, MEMORY[0x24BDAC9B8], v4);

LABEL_16:
        goto LABEL_17;
      }
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      objc_msgSend(v13, "logHandleForAccountInfoProvider:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v18 = v17;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v9, "scheme");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "host");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSURLRequest URL](self->_request, "URL");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "scheme");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSURLRequest URL](self->_request, "URL");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "host");
          *(_DWORD *)buf = 138413058;
          v26 = v24;
          v27 = 2112;
          v28 = v23;
          v29 = 2112;
          v30 = v21;
          v31 = 2112;
          v32 = objc_claimAutoreleasedReturnValue();
          v20 = (void *)v32;
          _os_log_impl(&dword_209602000, v18, OS_LOG_TYPE_ERROR, "Web login URL (%@://%@) does not match our current host URL (%@://%@). Ignoring request.", buf, 0x2Au);

        }
      }

    }
    else
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      objc_msgSend(v13, "logHandleForAccountInfoProvider:", v14);
      v15 = objc_claimAutoreleasedReturnValue();

      if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v6;
        _os_log_impl(&dword_209602000, v15, OS_LOG_TYPE_ERROR, "Couldn't parse a valid URL from \"%@\". Failing this task.", buf, 0xCu);
      }

    }
    v4[2](v4, 3);
    goto LABEL_16;
  }
  v4[2](v4, 3);
LABEL_17:

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  CoreDAVTask *v13;
  id v14;

  v7 = a4;
  v8 = a5;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__CoreDAVTask_URLSession_task_didCompleteWithError___block_invoke;
  v11[3] = &unk_24C1D9AE0;
  v12 = v7;
  v13 = self;
  v14 = v8;
  v9 = v8;
  v10 = v7;
  -[CoreDAVTask _runOnCallbackThread:](self, "_runOnCallbackThread:", v11);

}

void __52__CoreDAVTask_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD **)(a1 + 40);
  if (v3 == v2[7])
  {
    if (*(_QWORD *)(a1 + 48))
      objc_msgSend(v2, "_task:didFailWithError:");
    else
      objc_msgSend(v2, "_taskFinishedLoading:");
  }
  else
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
    objc_msgSend(v4, "logHandleForAccountInfoProvider:", WeakRetained);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = v6;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(a1 + 40);
        objc_msgSend(v10, "_sessionForLogging");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "_requestForLogging");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(a1 + 32);
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
        v15 = 138413570;
        v16 = v9;
        v17 = 2048;
        v18 = v10;
        v19 = 2048;
        v20 = v11;
        v21 = 2048;
        v22 = v12;
        v23 = 2048;
        v24 = v13;
        v25 = 2048;
        v26 = v14;
        _os_log_impl(&dword_209602000, v7, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Ignoring -URLSession:task:didCompleteWithError: callback for task %p because it doesn't match our current task, %p", (uint8_t *)&v15, 0x3Eu);

      }
    }

  }
}

- (void)_taskFinishedLoading:(id)a3
{
  NSURLSessionDataTask *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  CoreDAVTask *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  char v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSHTTPURLResponse *response;
  void *v30;
  id v31;
  void *v32;
  NSObject *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  void *v37;
  int64_t v38;
  id v39;
  id v40;
  int v41;
  void *v42;
  id v43;
  void *v44;
  NSObject *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  NSObject *v53;
  objc_class *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  NSObject *v65;
  objc_class *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSURLSessionDataTask *v71;
  CoreDAVTask *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  NSObject *v77;
  objc_class *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  NSObject *v89;
  objc_class *v90;
  void *v91;
  void *v92;
  NSURLSessionDataTask *v93;
  void *v94;
  void *v95;
  int v96;
  void *v97;
  __int16 v98;
  CoreDAVTask *v99;
  __int16 v100;
  void *v101;
  __int16 v102;
  void *v103;
  __int16 v104;
  CoreDAVTask *v105;
  __int16 v106;
  NSURLSessionDataTask *v107;
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  v5 = (NSURLSessionDataTask *)a3;
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  objc_msgSend(v6, "logHandleForAccountInfoProvider:", WeakRetained);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
      v13 = (CoreDAVTask *)v5;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = 138413314;
      v97 = v11;
      v98 = 2048;
      v99 = self;
      v100 = 2048;
      v101 = v12;
      v102 = 2048;
      v103 = v14;
      v104 = 2112;
      v105 = v13;
      _os_log_impl(&dword_209602000, v9, OS_LOG_TYPE_DEBUG, "[%@ %p, sess %p, request %p] Connection did finish loading %@", (uint8_t *)&v96, 0x34u);

      v5 = (NSURLSessionDataTask *)v13;
    }

  }
  self->_didFinishLoading = 1;
  -[CoreDAVRequestLogger finishCoreDAVResponse](self->_logger, "finishCoreDAVResponse");
  -[CoreDAVTask _sendTimeSpentInNetworkingToProvider](self, "_sendTimeSpentInNetworkingToProvider");
  -[CoreDAVTask responseHeaders](self, "responseHeaders");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "CDVObjectForKeyCaseInsensitive:", CFSTR("X-ClientToken-Request"));
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    v18 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) == 0)
      goto LABEL_9;
    v15 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    objc_msgSend(v15, "clientTokenRequestedByServer");
  }

LABEL_9:
  if (self->_task != v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVTask.m"), 1485, CFSTR("Incoming connection should be what we're expecting"));

  }
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  objc_msgSend(v20, "logHandleForAccountInfoProvider:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = v22;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = 138413058;
      v97 = v25;
      v98 = 2048;
      v99 = self;
      v100 = 2048;
      v101 = v26;
      v102 = 2048;
      v103 = v27;
      _os_log_impl(&dword_209602000, v23, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] connection finished loading", (uint8_t *)&v96, 0x2Au);

    }
  }

  -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "processData:forTask:", 0, self);

  response = self->_response;
  if (response)
  {
    -[CoreDAVTask setResponseStatusCode:](self, "setResponseStatusCode:", -[NSHTTPURLResponse statusCode](response, "statusCode"));
    if (-[CoreDAVTask responseStatusCode](self, "responseStatusCode") < 200
      || -[CoreDAVTask responseStatusCode](self, "responseStatusCode") >= 300)
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      objc_msgSend(v30, "logHandleForAccountInfoProvider:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        v33 = v32;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = (objc_class *)objc_opt_class();
          NSStringFromClass(v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = -[CoreDAVTask responseStatusCode](self, "responseStatusCode");
          v96 = 138413314;
          v97 = v35;
          v98 = 2048;
          v99 = self;
          v100 = 2048;
          v101 = v36;
          v102 = 2048;
          v103 = v37;
          v104 = 2048;
          v105 = (CoreDAVTask *)v38;
          _os_log_impl(&dword_209602000, v33, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Received a successful finish, but had http status of %ld", (uint8_t *)&v96, 0x34u);

        }
      }

      if (-[CoreDAVTask responseStatusCode](self, "responseStatusCode") == 401)
      {
        v39 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v40 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
          v41 = objc_msgSend(v40, "shouldRetryUnauthorizedTask:", v5);

          if (v41)
          {
            +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
            objc_msgSend(v42, "logHandleForAccountInfoProvider:", v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            if (v44)
            {
              v45 = v44;
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                v46 = (objc_class *)objc_opt_class();
                NSStringFromClass(v46);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v96 = 138413314;
                v97 = v47;
                v98 = 2048;
                v99 = self;
                v100 = 2048;
                v101 = v48;
                v102 = 2048;
                v103 = v49;
                v104 = 1024;
                LODWORD(v105) = 401;
                _os_log_impl(&dword_209602000, v45, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Received %d; retrying task because [_accountInfoProvider shouldRetryUnaut"
                  "horizedConnection] returned YES.",
                  (uint8_t *)&v96,
                  0x30u);

              }
            }

            goto LABEL_50;
          }
        }
        else
        {

        }
      }
      if (-[CoreDAVTask responseStatusCode](self, "responseStatusCode") != 501 || !self->_requestIsCompressed)
      {
        v82 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        -[NSHTTPURLResponse allHeaderFields](self->_response, "allHeaderFields");
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        if (v83)
        {
          -[NSHTTPURLResponse allHeaderFields](self->_response, "allHeaderFields");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "setObject:forKey:", v84, CFSTR("CoreDAVHTTPHeaders"));

        }
        v85 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("CoreDAVHTTPStatusErrorDomain"), -[CoreDAVTask responseStatusCode](self, "responseStatusCode"), v82);
        if (-[CoreDAVTask responseStatusCode](self, "responseStatusCode") == 401
          && -[CoreDAVTask _handleUnauthorizedAccessError:](self, "_handleUnauthorizedAccessError:", v85))
        {
          +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
          objc_msgSend(v86, "logHandleForAccountInfoProvider:", v87);
          v88 = (void *)objc_claimAutoreleasedReturnValue();

          if (v88)
          {
            v89 = v88;
            if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
            {
              v90 = (objc_class *)objc_opt_class();
              NSStringFromClass(v90);
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
              v93 = v5;
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              v96 = 138413058;
              v97 = v91;
              v98 = 2048;
              v99 = self;
              v100 = 2048;
              v101 = v92;
              v102 = 2048;
              v103 = v94;
              _os_log_impl(&dword_209602000, v89, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Received a HTTP 401 - unauthorized error And we handled it. Finishing task.", (uint8_t *)&v96, 0x2Au);

              v5 = v93;
            }

          }
        }
        else
        {
          -[CoreDAVTask finishCoreDAVTaskWithError:](self, "finishCoreDAVTaskWithError:", v85);
        }

        goto LABEL_62;
      }
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      objc_msgSend(v74, "logHandleForAccountInfoProvider:", v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      if (v76)
      {
        v77 = v76;
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          v78 = (objc_class *)objc_opt_class();
          NSStringFromClass(v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = 138413058;
          v97 = v79;
          v98 = 2048;
          v99 = self;
          v100 = 2048;
          v101 = v80;
          v102 = 2048;
          v103 = v81;
          _os_log_impl(&dword_209602000, v77, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] The server rejected our compressed request. Attempting an uncompressed request before giving up.", (uint8_t *)&v96, 0x2Au);

        }
      }

      self->_compressedRequestFailed = 1;
LABEL_50:
      CDVRunLoopModesToPerformDelayedSelectorsIn();
      v82 = (id)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel_performCoreDAVTask, 0, v82, 0.0);
LABEL_62:

      goto LABEL_63;
    }
    -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "parserError");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v61)
    {
      -[CoreDAVTask finishCoreDAVTaskWithError:](self, "finishCoreDAVTaskWithError:", 0);
      goto LABEL_63;
    }
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    objc_msgSend(v62, "logHandleForAccountInfoProvider:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (v64)
    {
      v65 = v64;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        v66 = (objc_class *)objc_opt_class();
        NSStringFromClass(v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "parserError");
        v71 = v5;
        v72 = (CoreDAVTask *)objc_claimAutoreleasedReturnValue();
        v96 = 138413314;
        v97 = v67;
        v98 = 2048;
        v99 = self;
        v100 = 2048;
        v101 = v68;
        v102 = 2048;
        v103 = v69;
        v104 = 2112;
        v105 = v72;
        _os_log_impl(&dword_209602000, v65, OS_LOG_TYPE_ERROR, "[%@ %p, sess %p, request %p] Parser failed to parse with error %@", (uint8_t *)&v96, 0x34u);

        v5 = v71;
      }

    }
    v58 = (void *)MEMORY[0x24BDD1540];
    v59 = 3;
  }
  else
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    objc_msgSend(v50, "logHandleForAccountInfoProvider:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      v53 = v52;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        v54 = (objc_class *)objc_opt_class();
        NSStringFromClass(v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = 138413570;
        v97 = v55;
        v98 = 2048;
        v99 = self;
        v100 = 2048;
        v101 = v56;
        v102 = 2048;
        v103 = v57;
        v104 = 2112;
        v105 = self;
        v106 = 2112;
        v107 = v5;
        _os_log_impl(&dword_209602000, v53, OS_LOG_TYPE_ERROR, "[%@ %p, sess %p, request %p] Received a didFinishLoading without receiving a response from the server.  Treating the following task as an unknown error: %@ %@", (uint8_t *)&v96, 0x3Eu);

      }
    }

    v58 = (void *)MEMORY[0x24BDD1540];
    v59 = 6;
  }
  objc_msgSend(v58, "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), v59, 0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVTask finishCoreDAVTaskWithError:](self, "finishCoreDAVTaskWithError:", v73);

LABEL_63:
}

- (BOOL)_handleUnauthorizedAccessError:(id)a3
{
  id v3;
  void *v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  char v15;
  _BOOL4 triedRenewingCredential;
  void *v17;
  id v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  objc_class *v34;
  void *v35;
  id v36;
  char v37;
  id v38;
  int v39;
  void *v40;
  id v41;
  void *v42;
  NSObject *v43;
  objc_class *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  NSObject *v52;
  objc_class *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  objc_class *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  int v63;
  id v64;
  NSObject *v65;
  objc_class *v66;
  void *v67;
  void *v68;
  void *v69;
  BOOL v70;
  void *v71;
  id v72;
  void *v73;
  NSObject *v74;
  objc_class *v75;
  void *v76;
  void *v77;
  void *v78;
  objc_class *v79;
  id v80;
  void *v81;
  NSObject *v82;
  objc_class *v83;
  void *v84;
  void *v85;
  void *v86;
  id v88;
  id v89;
  uint8_t buf[4];
  void *v91;
  __int16 v92;
  CoreDAVTask *v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  id v99;
  __int16 v100;
  CoreDAVTask *v101;
  uint64_t v102;

  v3 = a3;
  v102 = *MEMORY[0x24BDAC8D0];
  v89 = a3;
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  objc_msgSend(v5, "logHandleForAccountInfoProvider:", WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = v3;
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v91 = v11;
      v92 = 2048;
      v93 = self;
      v94 = 2048;
      v95 = v12;
      v96 = 2048;
      v97 = v13;
      v98 = 2112;
      v99 = v89;
      v100 = 2112;
      v101 = self;
      _os_log_impl(&dword_209602000, v8, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Figuring out if we should handle unauthorized access error %@ Self = %@", buf, 0x3Eu);

      v3 = v10;
    }

  }
  v14 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    triedRenewingCredential = self->_triedRenewingCredential;
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    objc_msgSend(v17, "logHandleForAccountInfoProvider:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    if (triedRenewingCredential)
    {
      if (v19)
      {
        v19 = v19;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = (objc_class *)objc_opt_class();
          NSStringFromClass(v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v91 = v21;
          v92 = 2048;
          v93 = self;
          v94 = 2048;
          v95 = v22;
          v96 = 2048;
          v97 = v23;
          v24 = "[%@ %p, sess %p, request %p] Already tried renewing credential";
LABEL_45:
          _os_log_impl(&dword_209602000, v19, OS_LOG_TYPE_INFO, v24, buf, 0x2Au);

          goto LABEL_46;
        }
        goto LABEL_46;
      }
      goto LABEL_47;
    }
    if (v19)
    {
      v57 = v19;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        v58 = (objc_class *)objc_opt_class();
        NSStringFromClass(v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v91 = v59;
        v92 = 2048;
        v93 = self;
        v94 = 2048;
        v95 = v60;
        v96 = 2048;
        v97 = v61;
        _os_log_impl(&dword_209602000, v57, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Attempting to renew credential", buf, 0x2Au);

      }
    }

    self->_triedRenewingCredential = 1;
    v62 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    v63 = objc_msgSend(v62, "renewCredential");

    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    objc_msgSend(v17, "logHandleForAccountInfoProvider:", v64);
    v19 = objc_claimAutoreleasedReturnValue();

    if (!v63)
    {
      if (v19)
      {
        v19 = v19;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v79 = (objc_class *)objc_opt_class();
          NSStringFromClass(v79);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v91 = v21;
          v92 = 2048;
          v93 = self;
          v94 = 2048;
          v95 = v22;
          v96 = 2048;
          v97 = v23;
          v24 = "[%@ %p, sess %p, request %p] Unable to renew credential";
          goto LABEL_45;
        }
LABEL_46:

      }
LABEL_47:

LABEL_48:
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      objc_msgSend(v49, "logHandleForAccountInfoProvider:", v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();

      if (v81)
      {
        v82 = v81;
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          v83 = (objc_class *)objc_opt_class();
          NSStringFromClass(v83);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413570;
          v91 = v84;
          v92 = 2048;
          v93 = self;
          v94 = 2048;
          v95 = v85;
          v96 = 2048;
          v97 = v86;
          v98 = 2112;
          v99 = v89;
          v100 = 2112;
          v101 = self;
          _os_log_impl(&dword_209602000, v82, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Unable to handle unauthorized access error %@ Self = %@", buf, 0x3Eu);

        }
      }

      v70 = 0;
      goto LABEL_53;
    }
    if (v19)
    {
      v65 = v19;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        v66 = (objc_class *)objc_opt_class();
        NSStringFromClass(v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v91 = v67;
        v92 = 2048;
        v93 = self;
        v94 = 2048;
        v95 = v68;
        v96 = 2048;
        v97 = v69;
        _os_log_impl(&dword_209602000, v65, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Renewed credential.  Retrying task", buf, 0x2Au);

      }
    }

    CDVRunLoopModesToPerformDelayedSelectorsIn();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVTask performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel_performCoreDAVTask, 0, v49, 0.0);
LABEL_36:
    v70 = 1;
    goto LABEL_53;
  }
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  objc_msgSend(v25, "logHandleForAccountInfoProvider:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = v27;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v88 = v3;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v91 = v30;
      v92 = 2048;
      v93 = self;
      v94 = 2048;
      v95 = v31;
      v96 = 2048;
      v97 = v32;
      v98 = 2114;
      v99 = v35;
      _os_log_impl(&dword_209602000, v28, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Received bad password (and %{public}@ doesn't respond to shouldTryRenewingCredential)", buf, 0x34u);

      v3 = v88;
    }

  }
  v36 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  v37 = objc_opt_respondsToSelector();

  if ((v37 & 1) != 0)
  {
    v38 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    v39 = objc_msgSend(v38, "shouldTurnModalOnBadPassword");

    if (!v39)
      goto LABEL_48;
  }
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  objc_msgSend(v40, "logHandleForAccountInfoProvider:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    v43 = v42;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = (objc_class *)objc_opt_class();
      NSStringFromClass(v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v91 = v45;
      v92 = 2048;
      v93 = self;
      v94 = 2048;
      v95 = v46;
      v96 = 2048;
      v97 = v47;
      _os_log_impl(&dword_209602000, v43, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Bad password error received.", buf, 0x2Au);

    }
  }

  if (self->_receivedBadPasswordResponse)
  {
    objc_storeStrong((id *)&self->_passwordNotificationError, v3);
    v48 = objc_loadWeakRetained((id *)&self->_taskManager);
    objc_msgSend(v48, "coreDAVTaskRequestModal:", self);

    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    objc_msgSend(v49, "logHandleForAccountInfoProvider:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
    {
      v52 = v51;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        v53 = (objc_class *)objc_opt_class();
        NSStringFromClass(v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v91 = v54;
        v92 = 2048;
        v93 = self;
        v94 = 2048;
        v95 = v55;
        v96 = 2048;
        v97 = v56;
        _os_log_impl(&dword_209602000, v52, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Starting Modal to handle Unauthorized Error.", buf, 0x2Au);

      }
    }

    goto LABEL_36;
  }
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  objc_msgSend(v71, "logHandleForAccountInfoProvider:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (v73)
  {
    v74 = v73;
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      v75 = (objc_class *)objc_opt_class();
      NSStringFromClass(v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v91 = v76;
      v92 = 2048;
      v93 = self;
      v94 = 2048;
      v95 = v77;
      v96 = 2048;
      v97 = v78;
      _os_log_impl(&dword_209602000, v74, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Received bad password response.  Optimistically trying one more time", buf, 0x2Au);

    }
  }

  v70 = 1;
  self->_receivedBadPasswordResponse = 1;
  CDVRunLoopModesToPerformDelayedSelectorsIn();
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVTask performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel_performCoreDAVTask, 0, v49, 0.0);
LABEL_53:

  return v70;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  CoreDAVTask *v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __72__CoreDAVTask_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
  v18[3] = &unk_24C1D9E28;
  v19 = v11;
  v20 = self;
  v22 = v12;
  v23 = v13;
  v21 = v10;
  v14 = v12;
  v15 = v10;
  v16 = v13;
  v17 = v11;
  -[CoreDAVTask _runOnCallbackThread:](self, "_runOnCallbackThread:", v18);

}

uint64_t __72__CoreDAVTask_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD **)(a1 + 40);
  if (v3 == v2[7])
    return objc_msgSend(v2, "_session:dataTask:didReceiveResponse:completionHandler:", *(_QWORD *)(a1 + 48));
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
  objc_msgSend(v4, "logHandleForAccountInfoProvider:", WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 40);
      objc_msgSend(v10, "_sessionForLogging");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_requestForLogging");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
      v16 = 138413570;
      v17 = v9;
      v18 = 2048;
      v19 = v10;
      v20 = 2048;
      v21 = v11;
      v22 = 2048;
      v23 = v12;
      v24 = 2048;
      v25 = v13;
      v26 = 2048;
      v27 = v14;
      _os_log_impl(&dword_209602000, v7, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Ignoring -URLSession:dataTask:didReceiveResponse:completionHandler: callback for task %p because it doesn't match our current task, %p", (uint8_t *)&v16, 0x3Eu);

    }
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)_session:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, uint64_t);
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  CoreDAVAccountInfoProvider **p_accountInfoProvider;
  id WeakRetained;
  void *v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  CoreDAVRequestLogger *logger;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  NSObject *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSString *uniqueID;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  NSObject *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  NSObject *v54;
  objc_class *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void (**v63)(id, uint64_t);
  void *v64;
  char v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  CoreDAVTask *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  const __CFString *v75;
  __int16 v76;
  uint64_t v77;
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, uint64_t))a6;
  v65 = 0;
  -[CoreDAVTask accountInfoProvider](self, "accountInfoProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0
    && (-[CoreDAVTask accountInfoProvider](self, "accountInfoProvider"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v14, "getAppleIDSession"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        v15))
  {
    objc_msgSend(v9, "currentRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleResponse:forRequest:shouldRetry:", v10, v16, &v65);

    if (v65)
    {
      CDVRunLoopModesToPerformDelayedSelectorsIn();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel_performCoreDAVTask, 0, v17, 0.0);
      v18 = 0;
      goto LABEL_23;
    }
    v62 = v15;
    v63 = v11;
  }
  else
  {
    v62 = 0;
    v63 = v11;
  }
  self->_didReceiveResponse = 1;
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  p_accountInfoProvider = &self->_accountInfoProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  objc_msgSend(v19, "logHandleForAccountInfoProvider:", WeakRetained);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v64 = v10;
  if (v22)
  {
    v23 = v22;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v64, "statusCode");
      *(_DWORD *)buf = 138413314;
      v67 = v25;
      v68 = 2048;
      v69 = self;
      v70 = 2048;
      v71 = v26;
      v72 = 2048;
      v73 = v27;
      v74 = 2048;
      v75 = (const __CFString *)v28;
      _os_log_impl(&dword_209602000, v23, OS_LOG_TYPE_DEBUG, "[%@ %p, sess %p, request %p] received response with status %ld", buf, 0x34u);

    }
    v10 = v64;
  }

  objc_storeStrong((id *)&self->_response, a5);
  -[CoreDAVTask setTotalBytesReceived:](self, "setTotalBytesReceived:", 0);
  -[CoreDAVTask setTotalBytesWasProcessedAsAbnormallyLarge:](self, "setTotalBytesWasProcessedAsAbnormallyLarge:", 0);
  logger = self->_logger;
  objc_msgSend(v10, "allHeaderFields");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVRequestLogger logCoreDAVResponseHeaders:andStatusCode:withTaskIdentifier:](logger, "logCoreDAVResponseHeaders:andStatusCode:withTaskIdentifier:", v30, objc_msgSend(v10, "statusCode"), self->_uniqueID);

  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  objc_msgSend(v31, "logHandleForAccountInfoProvider:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    v34 = v33;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v9;
      uniqueID = self->_uniqueID;
      v41 = objc_msgSend(v64, "statusCode");
      *(_DWORD *)buf = 138413570;
      v67 = v36;
      v68 = 2048;
      v69 = self;
      v70 = 2048;
      v71 = v37;
      v72 = 2048;
      v73 = v38;
      v74 = 2114;
      v75 = (const __CFString *)uniqueID;
      v9 = v39;
      v10 = v64;
      v76 = 2048;
      v77 = v41;
      _os_log_impl(&dword_209602000, v34, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Task ID %{public}@ Connection Received Status [%ld]", buf, 0x3Eu);

    }
  }

  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  objc_msgSend(v42, "logHandleForAccountInfoProvider:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    v45 = v44;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      v46 = (objc_class *)objc_opt_class();
      NSStringFromClass(v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "allHeaderFields");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("X-Apple-Jingle-Correlation-Key"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v67 = v47;
      v68 = 2048;
      v69 = self;
      v70 = 2048;
      v71 = v48;
      v72 = 2048;
      v73 = v49;
      v74 = 2114;
      v75 = CFSTR("X-Apple-Jingle-Correlation-Key");
      v76 = 2114;
      v77 = (uint64_t)v51;
      _os_log_impl(&dword_209602000, v45, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Response Header %{public}@ = %{public}@", buf, 0x3Eu);

      v10 = v64;
      p_accountInfoProvider = &self->_accountInfoProvider;

    }
  }

  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_loadWeakRetained((id *)p_accountInfoProvider);
  objc_msgSend(v17, "logHandleForAccountInfoProvider:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    v54 = v53;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      v55 = (objc_class *)objc_opt_class();
      NSStringFromClass(v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "allHeaderFields");
      v61 = v9;
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("X-Apple-Request-UUID"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v67 = v56;
      v68 = 2048;
      v69 = self;
      v70 = 2048;
      v71 = v57;
      v72 = 2048;
      v73 = v58;
      v74 = 2114;
      v75 = CFSTR("X-Apple-Request-UUID");
      v76 = 2114;
      v77 = (uint64_t)v60;
      _os_log_impl(&dword_209602000, v54, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Response Header %{public}@ = %{public}@", buf, 0x3Eu);

      v10 = v64;
      v9 = v61;

    }
  }

  v18 = 1;
  v15 = v62;
  v11 = v63;
LABEL_23:

  v11[2](v11, v18);
}

- (void)_task:(id)a3 didFailWithError:(id)a4
{
  NSURLSessionDataTask *v7;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  NSURLSessionDataTask *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  char v22;
  id v23;
  id v24;
  int v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  void *v37;
  id v38;
  void *v39;
  NSObject *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  objc_class *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  NSObject *v51;
  objc_class *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  char v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  NSObject *v62;
  objc_class *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  const char *v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  CoreDAVTask *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  id v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v7 = (NSURLSessionDataTask *)a3;
  v8 = a4;
  self->_didFailWithError = 1;
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  objc_msgSend(v9, "logHandleForAccountInfoProvider:", WeakRetained);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = v11;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v68 = a2;
      v14 = v7;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v70 = v15;
      v71 = 2048;
      v72 = self;
      v73 = 2048;
      v74 = v16;
      v75 = 2048;
      v76 = v17;
      v77 = 2112;
      v78 = v8;
      _os_log_impl(&dword_209602000, v12, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] connection died with error %@", buf, 0x34u);

      v7 = v14;
      a2 = v68;
    }

  }
  -[CoreDAVTask _sendTimeSpentInNetworkingToProvider](self, "_sendTimeSpentInNetworkingToProvider");
  if (self->_task != v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVTask.m"), 1642, CFSTR("Incoming task should be what we're expecting"));

  }
  -[CoreDAVTask responseHeaders](self, "responseHeaders");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "CDVObjectForKeyCaseInsensitive:", CFSTR("X-ClientToken-Request"));
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19)
    goto LABEL_10;
  v20 = (void *)v19;
  v21 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  v22 = objc_opt_respondsToSelector();

  if ((v22 & 1) != 0)
  {
    v18 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    objc_msgSend(v18, "clientTokenRequestedByServer");
LABEL_10:

  }
  if (self->_shouldRetryWithClientToken && !self->_didRetryWithClientToken)
  {
    self->_didRetryWithClientToken = 1;
LABEL_36:
    CDVRunLoopModesToPerformDelayedSelectorsIn();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVTask performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel_performCoreDAVTask, 0, v47, 0.0);

    goto LABEL_37;
  }
  if (objc_msgSend(v8, "code") == 401)
  {
    v23 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v24 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      v25 = objc_msgSend(v24, "shouldRetryUnauthorizedTask:", v7);

      if (v25)
      {
        +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
        objc_msgSend(v26, "logHandleForAccountInfoProvider:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          v29 = v28;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v30 = (objc_class *)objc_opt_class();
            NSStringFromClass(v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v70 = v31;
            v71 = 2048;
            v72 = self;
            v73 = 2048;
            v74 = v32;
            v75 = 2048;
            v76 = v33;
            v77 = 1024;
            LODWORD(v78) = 401;
            v34 = "[%@ %p, sess %p, request %p] Received %d; retrying task because [_accountInfoProvider shouldRetryUnaut"
                  "horizedConnection] returned YES.";
            v35 = v29;
            v36 = 48;
LABEL_33:
            _os_log_impl(&dword_209602000, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);

            goto LABEL_34;
          }
          goto LABEL_34;
        }
        goto LABEL_35;
      }
    }
    else
    {

    }
  }
  if (objc_msgSend(v8, "code") == 501 && self->_requestIsCompressed)
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    objc_msgSend(v37, "logHandleForAccountInfoProvider:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      v40 = v39;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = (objc_class *)objc_opt_class();
        NSStringFromClass(v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v70 = v42;
        v71 = 2048;
        v72 = self;
        v73 = 2048;
        v74 = v43;
        v75 = 2048;
        v76 = v44;
        _os_log_impl(&dword_209602000, v40, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] The server rejected our compressed request. Attempting an uncompressed request before giving up.", buf, 0x2Au);

      }
    }

    self->_compressedRequestFailed = 1;
    goto LABEL_36;
  }
  if (objc_msgSend(v8, "code") == 401 && self->_justTriedTokenAuth)
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    objc_msgSend(v26, "logHandleForAccountInfoProvider:", v45);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = v28;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v46 = (objc_class *)objc_opt_class();
        NSStringFromClass(v46);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v70 = v31;
        v71 = 2048;
        v72 = self;
        v73 = 2048;
        v74 = v32;
        v75 = 2048;
        v76 = v33;
        v34 = "[%@ %p, sess %p, request %p] Tried token auth but got unauthorized response. Trying without token-auth.";
        v35 = v29;
        v36 = 42;
        goto LABEL_33;
      }
LABEL_34:

    }
LABEL_35:

    goto LABEL_36;
  }
  if (objc_msgSend(v8, "code") == 401)
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    objc_msgSend(v48, "logHandleForAccountInfoProvider:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      v51 = v50;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        v52 = (objc_class *)objc_opt_class();
        NSStringFromClass(v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v70 = v53;
        v71 = 2048;
        v72 = self;
        v73 = 2048;
        v74 = v54;
        v75 = 2048;
        v76 = v55;
        _os_log_impl(&dword_209602000, v51, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Bad password error received.", buf, 0x2Au);

      }
    }

    -[CoreDAVTask _handleUnauthorizedAccessError:](self, "_handleUnauthorizedAccessError:", v8);
  }
  else
  {
    v56 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    v57 = objc_msgSend(v56, "handleCertificateError:", v8);

    if ((v57 & 1) != 0)
    {
      CDVRunLoopModesToPerformDelayedSelectorsIn();
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel_performCoreDAVTask, 0, v58, 0.0);

      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      objc_msgSend(v59, "logHandleForAccountInfoProvider:", v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      if (v61)
      {
        v62 = v61;
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          v63 = (objc_class *)objc_opt_class();
          NSStringFromClass(v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _sessionForLogging](self, "_sessionForLogging");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVTask _requestForLogging](self, "_requestForLogging");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v70 = v64;
          v71 = 2048;
          v72 = self;
          v73 = 2048;
          v74 = v65;
          v75 = 2048;
          v76 = v66;
          _os_log_impl(&dword_209602000, v62, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Handled client certificate request and re-issued NSURLRequest.", buf, 0x2Au);

        }
      }

    }
    else
    {
      -[CoreDAVTask finishCoreDAVTaskWithError:](self, "finishCoreDAVTaskWithError:", v8);
    }
  }
LABEL_37:

}

- (NSDictionary)responseHeaders
{
  if (self->_simulated)
    return (NSDictionary *)self->_simulatedResponseHeaders;
  -[NSHTTPURLResponse allHeaderFields](self->_response, "allHeaderFields");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)finishEarlyWithError:(id)a3
{
  -[CoreDAVTask finishCoreDAVTaskWithError:](self, "finishCoreDAVTaskWithError:", a3);
  -[CoreDAVTask setDelegate:](self, "setDelegate:", 0);
}

- (void)submitWithTaskManager:(id)a3
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  CoreDAVTask *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    -[CoreDAVTask setTaskManager:](self, "setTaskManager:");
    -[CoreDAVTask taskManager](self, "taskManager");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "submitQueuedCoreDAVTask:", self);

  }
  else
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logHandleForAccountInfoProvider:", 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v10 = self;
        _os_log_impl(&dword_209602000, v6, OS_LOG_TYPE_ERROR, "Task %@ submitted with no taskManager, returning immediately", buf, 0xCu);
      }
    }

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 6, 0);
    -[CoreDAVTask finishEarlyWithError:](self, "finishEarlyWithError:", v7);

  }
}

- (void)reset
{
  void *v4;

  if (-[CoreDAVTask isFinished](self, "isFinished"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVTask.m"), 1716, CFSTR("Getting reset, but why was I finished?"));

  }
  *(_WORD *)&self->_didReceiveData = 0;
  *(_DWORD *)&self->_didSendRequest = 0;
}

- (int64_t)numDownloadedElements
{
  return self->_numDownloadedElements;
}

- (void)reportStatusWithError:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  char v7;
  id v8;
  int64_t v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  CoreDAVAccountInfoProvider **p_accountInfoProvider;
  id v15;
  char v16;
  id v17;
  char v18;
  int64_t v19;
  id v20;
  void *v21;
  int v22;
  uint64_t v23;
  char v24;
  char v25;
  char v26;
  id v27;
  char v28;
  char v29;
  id v30;

  v4 = a3;
  v30 = v4;
  if (!v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    v7 = objc_opt_respondsToSelector();

    v8 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    if ((v7 & 1) != 0)
    {
      v9 = -[CoreDAVTask numDownloadedElements](self, "numDownloadedElements");
      v10 = v8;
LABEL_6:
      objc_msgSend(v10, "noteSuccessfulRequestWithNumDownloadedElements:forTask:", v9, self);
LABEL_26:

      goto LABEL_27;
    }
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) == 0)
      goto LABEL_27;
    v8 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    v19 = -[CoreDAVTask numDownloadedElements](self, "numDownloadedElements");
    v20 = v8;
LABEL_14:
    objc_msgSend(v20, "noteSuccessfulRequestWithNumDownloadedElements:", v19);
    goto LABEL_26;
  }
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("CoreDAVHTTPStatusErrorDomain")))
  {

    goto LABEL_8;
  }
  objc_msgSend(v30, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD1308]);

  if (!v12)
  {
    objc_msgSend(v30, "domain");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("CoreDAVErrorDomain"));

    if (!v22)
    {
      p_accountInfoProvider = &self->_accountInfoProvider;
      v15 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
LABEL_22:
      v26 = objc_opt_respondsToSelector();

      v27 = objc_loadWeakRetained((id *)p_accountInfoProvider);
      v8 = v27;
      if ((v26 & 1) != 0)
      {
        objc_msgSend(v27, "noteFailedNetworkRequestForTask:", self);
        goto LABEL_26;
      }
      v28 = objc_opt_respondsToSelector();

      if ((v28 & 1) != 0)
      {
        v8 = objc_loadWeakRetained((id *)p_accountInfoProvider);
        objc_msgSend(v8, "noteFailedNetworkRequest");
        goto LABEL_26;
      }
      goto LABEL_27;
    }
    v23 = objc_msgSend(v30, "code");
    p_accountInfoProvider = &self->_accountInfoProvider;
    v15 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    if (v23 != 1)
      goto LABEL_9;
    v24 = objc_opt_respondsToSelector();

    v10 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    v8 = v10;
    if ((v24 & 1) != 0)
    {
      v9 = 0;
      goto LABEL_6;
    }
    v29 = objc_opt_respondsToSelector();

    if ((v29 & 1) == 0)
      goto LABEL_27;
    v20 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    v8 = v20;
    v19 = 0;
    goto LABEL_14;
  }
LABEL_8:
  v13 = objc_msgSend(v30, "code");
  p_accountInfoProvider = &self->_accountInfoProvider;
  v15 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  if (v13 != 500)
    goto LABEL_22;
LABEL_9:
  v16 = objc_opt_respondsToSelector();

  v17 = objc_loadWeakRetained((id *)p_accountInfoProvider);
  v8 = v17;
  if ((v16 & 1) != 0)
  {
    objc_msgSend(v17, "noteFailedProtocolRequestForTask:", self);
    goto LABEL_26;
  }
  v25 = objc_opt_respondsToSelector();

  if ((v25 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    objc_msgSend(v8, "noteFailedProtocolRequest");
    goto LABEL_26;
  }
LABEL_27:

}

- (id)_sessionForLogging
{
  return self->_session;
}

- (id)_requestForLogging
{
  return self->_request;
}

- (CoreDAVItem)rootElement
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;

  if (self->_simulated)
  {
    -[CoreDAVTask simulatedRootElement](self, "simulatedRootElement");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "rootElement");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }
  }
  return (CoreDAVItem *)v3;
}

- (CoreDAVTaskManager)taskManager
{
  return (CoreDAVTaskManager *)objc_loadWeakRetained((id *)&self->_taskManager);
}

- (void)setTaskManager:(id)a3
{
  objc_storeWeak((id *)&self->_taskManager, a3);
}

- (CoreDAVAccountInfoProvider)accountInfoProvider
{
  return (CoreDAVAccountInfoProvider *)objc_loadWeakRetained((id *)&self->_accountInfoProvider);
}

- (void)setAccountInfoProvider:(id)a3
{
  objc_storeWeak((id *)&self->_accountInfoProvider, a3);
}

- (CoreDAVTaskDelegate)delegate
{
  return (CoreDAVTaskDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (int)depth
{
  return self->_depth;
}

- (void)setDepth:(int)a3
{
  self->_depth = a3;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (CoreDAVResponseBodyParser)responseBodyParser
{
  return self->_responseBodyParser;
}

- (void)setResponseBodyParser:(id)a3
{
  objc_storeStrong((id *)&self->_responseBodyParser, a3);
}

- (int64_t)responseStatusCode
{
  return self->_responseStatusCode;
}

- (void)setResponseStatusCode:(int64_t)a3
{
  self->_responseStatusCode = a3;
}

- (id)requestProgressBlock
{
  return self->_requestProgressBlock;
}

- (void)setRequestProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (id)responseProgressBlock
{
  return self->_responseProgressBlock;
}

- (void)setResponseProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (unint64_t)totalBytesReceived
{
  return self->_totalBytesReceived;
}

- (void)setTotalBytesReceived:(unint64_t)a3
{
  self->_totalBytesReceived = a3;
}

- (BOOL)allowAutomaticRedirects
{
  return self->_allowAutomaticRedirects;
}

- (void)setAllowAutomaticRedirects:(BOOL)a3
{
  self->_allowAutomaticRedirects = a3;
}

- (NSDictionary)requestProperties
{
  return self->_requestProperties;
}

- (void)setRequestProperties:(id)a3
{
  objc_storeStrong((id *)&self->_requestProperties, a3);
}

- (BOOL)ignoresGuardianRestrictions
{
  return self->_ignoresGuardianRestrictions;
}

- (void)setIgnoresGuardianRestrictions:(BOOL)a3
{
  self->_ignoresGuardianRestrictions = a3;
}

- (BOOL)simulated
{
  return self->_simulated;
}

- (void)setSimulated:(BOOL)a3
{
  self->_simulated = a3;
}

- (NSMutableDictionary)simulatedResponseHeaders
{
  return self->_simulatedResponseHeaders;
}

- (void)setSimulatedResponseHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_simulatedResponseHeaders, a3);
}

- (int64_t)simulatedStatusCode
{
  return self->_simulatedStatusCode;
}

- (void)setSimulatedStatusCode:(int64_t)a3
{
  self->_simulatedStatusCode = a3;
}

- (CoreDAVItem)simulatedRootElement
{
  return self->_simulatedRootElement;
}

- (void)setSimulatedRootElement:(id)a3
{
  objc_storeStrong((id *)&self->_simulatedRootElement, a3);
}

- (BOOL)totalBytesWasProcessedAsAbnormallyLarge
{
  return self->_totalBytesWasProcessedAsAbnormallyLarge;
}

- (void)setTotalBytesWasProcessedAsAbnormallyLarge:(BOOL)a3
{
  self->_totalBytesWasProcessedAsAbnormallyLarge = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simulatedRootElement, 0);
  objc_storeStrong((id *)&self->_simulatedResponseHeaders, 0);
  objc_storeStrong((id *)&self->_callbackThread, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_fakeResponseData, 0);
  objc_storeStrong((id *)&self->_requestProperties, 0);
  objc_storeStrong((id *)&self->_redirectHistory, 0);
  objc_storeStrong((id *)&self->_overriddenHeaders, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_responseProgressBlock, 0);
  objc_storeStrong(&self->_requestProgressBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_responseBodyParser, 0);
  objc_storeStrong((id *)&self->_passwordNotificationError, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_dateConnectionWentOut, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_destroyWeak((id *)&self->_accountInfoProvider);
  objc_destroyWeak((id *)&self->_taskManager);
}

- (void)_compressBodyData:.cold.1()
{
  __assert_rtn("-[CoreDAVTask _compressBodyData:]", "CoreDAVTask.m", 474, "ret != Z_STREAM_ERROR");
}

- (void)_compressBodyData:.cold.2()
{
  __assert_rtn("-[CoreDAVTask _compressBodyData:]", "CoreDAVTask.m", 480, "ret == Z_STREAM_END");
}

- (void)_compressBodyData:.cold.3()
{
  __assert_rtn("-[CoreDAVTask _compressBodyData:]", "CoreDAVTask.m", 478, "strm.avail_in == 0");
}

@end

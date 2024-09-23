@implementation GEODataURLSessionTask

uint64_t __93__GEODataURLSessionTask_URLSessionTask__dataURLSession_didReceiveResponse_completionHandler___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56))
  {
    GEOGetDataSessionURLLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_INFO, "Converting task %@ to download task", (uint8_t *)&v9, 0xCu);
    }

  }
  else
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", bodySizeEstimateFromResponse(*(void **)(a1 + 40)));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v4;

  }
  if (*(_BYTE *)(a1 + 56))
    v7 = 2;
  else
    v7 = 1;
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v7);
}

- (GEODataURLSessionTask)initWithSession:(id)a3 delegate:(id)a4 delegateQueue:(id)a5 requestKind:(id)a6 priority:(float)a7
{
  id v12;
  id v13;
  id v14;
  GEODataURLSessionTask *v15;
  GEODataURLSessionTask *v16;
  uint64_t v17;
  OS_dispatch_queue *sessionIsolation;
  os_activity_t v19;
  OS_os_activity *activity;
  NSObject *v21;
  os_activity_scope_state_s v23;
  objc_super v24;
  uint8_t buf[4];
  GEODataURLSessionTask *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v24.receiver = self;
  v24.super_class = (Class)GEODataURLSessionTask;
  v15 = -[GEODataURLSessionTask init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_priority = a7;
    objc_msgSend(v12, "sessionIsolation");
    v17 = objc_claimAutoreleasedReturnValue();
    sessionIsolation = v16->_sessionIsolation;
    v16->_sessionIsolation = (OS_dispatch_queue *)v17;

    objc_storeWeak((id *)&v16->_delegate, v13);
    objc_storeStrong((id *)&v16->_delegateQueue, a5);
    v16->_requestKind = ($7466BF22B2A7275A1F5DB80FF4552E0B)a6;
    *(int64x2_t *)&v16->_startTime = vdupq_n_s64(0x10000000000000uLL);
    v19 = _os_activity_create(&dword_1885A9000, "URL Task", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    activity = v16->_activity;
    v16->_activity = (OS_os_activity *)v19;

    v23.opaque[0] = 0;
    v23.opaque[1] = 0;
    os_activity_scope_enter((os_activity_t)v16->_activity, &v23);
    GEOGetDataSessionURLLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v16;
      _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_DEBUG, "Created task %@", buf, 0xCu);
    }

    os_activity_scope_leave(&v23);
  }

  return v16;
}

- (void)didReceiveData:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  os_activity_scope_state_s v7;
  uint8_t buf[4];
  GEODataURLSessionTask *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &v7);
  GEOGetDataSessionURLLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v4, "length");
    *(_DWORD *)buf = 138412546;
    v9 = self;
    v10 = 2048;
    v11 = v6;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "Task %@ received %{bytes}zu", buf, 0x16u);
  }

  -[NSMutableData appendData:](self->_receivedData, "appendData:", v4);
  os_activity_scope_leave(&v7);

}

- (id)createURLSessionTaskWithSession:(id)a3 request:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSURLSessionTask *v9;
  NSURLSessionTask *backingTask;
  double v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSURLSessionTask *v15;
  double priority;
  NSURLSessionTask *v17;
  os_activity_scope_state_s v19;
  uint8_t buf[4];
  NSURLSessionTask *v21;
  __int16 v22;
  double v23;
  __int16 v24;
  GEODataURLSessionTask *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v19.opaque[0] = 0;
  v19.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &v19);
  objc_storeStrong((id *)&self->_request, a4);
  -[GEODataURLSessionTask createURLRequest](self, "createURLRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEODataURLSessionTask _createBackingTaskWithRequest:session:](self, "_createBackingTaskWithRequest:session:", v8, v6);
  v9 = (NSURLSessionTask *)objc_claimAutoreleasedReturnValue();
  backingTask = self->_backingTask;
  self->_backingTask = v9;

  *(float *)&v11 = self->_priority;
  -[NSURLSessionTask setPriority:](self->_backingTask, "setPriority:", v11);
  objc_msgSend(v7, "cachedData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEODataURLSessionTask setCachedData:](self, "setCachedData:", v12);

  if (self->_backingTaskNeedsResume)
  {
    objc_msgSend(v7, "requestCounterTicket");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "startingRequestWithTask:", self->_backingTask);

    -[NSURLSessionTask resume](self->_backingTask, "resume");
  }
  GEOGetDataSessionURLLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = self->_backingTask;
    priority = self->_priority;
    *(_DWORD *)buf = 138412802;
    v21 = v15;
    v22 = 2048;
    v23 = priority;
    v24 = 2112;
    v25 = self;
    _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_DEBUG, "Created backing task %@ (priority %4.2f) for task %@", buf, 0x20u);
  }

  v17 = self->_backingTask;
  os_activity_scope_leave(&v19);

  return v17;
}

- (id)createURLRequest
{
  void *v2;
  void *v3;

  -[GEODataURLSessionTask request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newURLRequest");

  return v3;
}

- (GEODataRequest)request
{
  return self->_request;
}

- (id)_createBackingTaskWithRequest:(id)a3 session:(id)a4
{
  return (id)objc_msgSend(a4, "dataTaskWithRequest:", a3);
}

- (void)setSessionIdentifier:(unsigned int)a3
{
  self->_sessionIdentifier = a3;
}

- (void)setCachedData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)didCollectMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_urlTaskMetrics, a3);
}

- (void)dataURLSession:(id)a3 didReceiveResponse:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableData *v17;
  NSMutableData *receivedData;
  _QWORD v19[4];
  id v20;
  id v21;
  GEODataURLSessionTask *v22;
  id v23;
  id v24;
  uint64_t v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  v12 = bodySizeEstimateFromResponse(v11);
  -[NSURLSessionTask _incompleteTaskMetrics](self->_backingTask, "_incompleteTaskMetrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "transactionMetrics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  self->_mptcpNegotiated = objc_msgSend(v15, "isMultipath");

  -[GEODataURLSessionTask delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __93__GEODataURLSessionTask_URLSessionTask__dataURLSession_didReceiveResponse_completionHandler___block_invoke;
    v19[3] = &unk_1E1C016F0;
    v20 = v16;
    v21 = v8;
    v22 = self;
    v25 = v12;
    v23 = v11;
    v24 = v10;
    -[GEODataURLSessionTask delegateAsync:](self, "delegateAsync:", v19);

  }
  else
  {
    v17 = (NSMutableData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", bodySizeEstimateFromResponse(v11));
    receivedData = self->_receivedData;
    self->_receivedData = v17;

    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
  }

}

- (void)dataURLSession:(id)a3 willSendRequestForEstablishedConnection:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  void *v16;
  GEODataURLSessionTask *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[GEODataURLSessionTask delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[GEODataURLSessionTask request](self, "request");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __114__GEODataURLSessionTask_URLSessionTask__dataURLSession_willSendRequestForEstablishedConnection_completionHandler___block_invoke;
    v13[3] = &unk_1E1C0B010;
    v14 = v11;
    v15 = v8;
    v16 = v12;
    v17 = self;
    v19 = v10;
    v18 = v9;
    -[GEODataURLSessionTask delegateAsync:](self, "delegateAsync:", v13);

  }
  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v9);
  }

}

- (void)notifyDelegateWithSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  GEODataURLSessionTask *v10;

  v4 = a3;
  -[GEODataURLSessionTask delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__GEODataURLSessionTask_notifyDelegateWithSession___block_invoke;
    v7[3] = &unk_1E1C01790;
    v8 = v5;
    v9 = v4;
    v10 = self;
    -[GEODataURLSessionTask delegateAsync:](self, "delegateAsync:", v7);

  }
}

- (GEODataURLSessionTaskDelegate)delegate
{
  return (GEODataURLSessionTaskDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)delegateAsync:(id)a3
{
  id v4;
  dispatch_block_t v5;
  NSObject *queue;

  v4 = a3;
  -[GEODataURLSessionTask delegateQueue](self, "delegateQueue");
  queue = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)self->_qos, 0, v4);

  dispatch_async(queue, v5);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

uint64_t __51__GEODataURLSessionTask_notifyDelegateWithSession___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dataURLSession:didCompleteTask:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_start
{
  OS_voucher *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  NSURLSessionTask *backingTask;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  void *v18;
  OS_voucher *v19;
  OS_voucher *voucher;
  int v21;
  GEODataURLSessionTask *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = self->_voucher;
  voucher_adopt();
  GEOGetDataSessionURLLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

  if (v5)
  {
    -[GEODataRequest additionalHTTPHeaders](self->_request, "additionalHTTPHeaders");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "removeObjectForKey:", CFSTR("Maps-Auth-Token"));
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("Proxy-Authorization"));
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("X-Env-Sec-Mat"));
  }
  else
  {
    v7 = 0;
  }
  backingTask = self->_backingTask;
  v9 = objc_msgSend(v7, "count");
  GEOGetDataSessionURLLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (!backingTask)
  {
    if (v9)
    {
      if (v11)
      {
        v21 = 138412547;
        v22 = self;
        v23 = 2113;
        v24 = v7;
        v15 = "Will resume task upon creation %@ %{private}@";
        v16 = v10;
        v17 = 22;
LABEL_17:
        _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v21, v17);
      }
    }
    else if (v11)
    {
      v21 = 138412290;
      v22 = self;
      v15 = "Will resume task upon creation %@";
      v16 = v10;
      v17 = 12;
      goto LABEL_17;
    }

    self->_backingTaskNeedsResume = 1;
    goto LABEL_19;
  }
  if (v9)
  {
    if (v11)
    {
      v21 = 138412547;
      v22 = self;
      v23 = 2113;
      v24 = v7;
      v12 = "Starting task %@ %{private}@";
      v13 = v10;
      v14 = 22;
LABEL_13:
      _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v21, v14);
    }
  }
  else if (v11)
  {
    v21 = 138412290;
    v22 = self;
    v12 = "Starting task %@";
    v13 = v10;
    v14 = 12;
    goto LABEL_13;
  }

  -[GEODataRequest requestCounterTicket](self->_request, "requestCounterTicket");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "startingRequestWithTask:", self->_backingTask);

  -[NSURLSessionTask resume](self->_backingTask, "resume");
LABEL_19:
  v19 = (OS_voucher *)voucher_adopt();
  voucher = self->_voucher;
  self->_voucher = v19;

}

- (void)dataURLSession:(id)a3 taskDidCompleteWithError:(id)a4
{
  id v6;
  NSError *v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSError *v13;
  NSError *nonBackingTaskError;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  os_activity_scope_state_s v18;
  uint8_t buf[4];
  GEODataURLSessionTask *v20;
  __int16 v21;
  NSError *v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (NSError *)a4;
  v18.opaque[0] = 0;
  v18.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &v18);
  GEOMachAbsoluteTimeGetCurrent();
  self->_endTime = v8;
  self->_finished = 1;
  if (v7)
    goto LABEL_8;
  if (-[GEODataURLSessionTask HTTPStatusCode](self, "HTTPStatusCode") >= 200
    && -[GEODataURLSessionTask HTTPStatusCode](self, "HTTPStatusCode") < 400)
  {
    goto LABEL_12;
  }
  v9 = (void *)MEMORY[0x1E0CB35C8];
  v10 = -[GEODataURLSessionTask HTTPStatusCode](self, "HTTPStatusCode") == 451 ? -6 : -7;
  v23 = CFSTR("HTTPStatus");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[GEODataURLSessionTask HTTPStatusCode](self, "HTTPStatusCode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "GEOErrorWithCode:userInfo:", v10, v12);
  v13 = (NSError *)objc_claimAutoreleasedReturnValue();
  nonBackingTaskError = self->_nonBackingTaskError;
  self->_nonBackingTaskError = v13;

  v7 = self->_nonBackingTaskError;
  if (v7)
  {
LABEL_8:
    GEOGetDataSessionURLLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412547;
      v20 = self;
      v21 = 2113;
      v22 = v7;
      _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_DEBUG, "Task %@ did fail: %{private}@", buf, 0x16u);
    }

    +[GEOMapsAuthServiceHelper sharedAuthHelper](GEOMapsAuthServiceHelper, "sharedAuthHelper");
    v16 = objc_claimAutoreleasedReturnValue();
    -[NSObject checkNetworkError:sendingGeoDErrorIfApplicable:](v16, "checkNetworkError:sendingGeoDErrorIfApplicable:", v7, -1000);
  }
  else
  {
LABEL_12:
    GEOGetDataSessionURLLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v20 = self;
      _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_DEBUG, "Task %@ did succeed", buf, 0xCu);
    }
    v7 = 0;
  }

  -[GEODataURLSessionTask requestCounterTicket](self, "requestCounterTicket");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "requestCompleted:", v7);

  -[GEODataURLSessionTask notifyDelegateWithSession:](self, "notifyDelegateWithSession:", v6);
  os_activity_scope_leave(&v18);

}

- (int64_t)HTTPStatusCode
{
  void *v2;
  int64_t v3;

  -[GEODataURLSessionTask response](self, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "statusCode");

  return v3;
}

- (NSHTTPURLResponse)response
{
  void *v2;
  void *v3;
  NSHTTPURLResponse *v4;

  -[NSURLSessionTask response](self->_backingTask, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (GEORequestCounterTicket)requestCounterTicket
{
  return -[GEODataRequest requestCounterTicket](self->_request, "requestCounterTicket");
}

- (GEOClientMetrics)clientMetrics
{
  void *v3;
  void *v4;
  GEOClientMetrics *v5;
  GEOClientMetrics *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[NSURLSessionTaskMetrics _geo_clientMetrics](self->_urlTaskMetrics, "_geo_clientMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = objc_alloc_init(GEOClientMetrics);
  v6 = v5;

  -[NSDate timeIntervalSince1970](self->_originalStartDate, "timeIntervalSince1970");
  v8 = v7;
  -[GEOClientMetrics networkMetrics](v6, "networkMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRequestStart:", v8);

  v10 = 1;
  if (!-[GEODataURLSessionTask failedDueToCancel](self, "failedDueToCancel"))
  {
    -[GEODataURLSessionTask error](self, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      v10 = 1;
    else
      v10 = 2;
  }
  -[GEOClientMetrics setResponseSource:](v6, "setResponseSource:", v10);
  v12 = -[NSURLSessionTask countOfBytesSent](self->_backingTask, "countOfBytesSent");
  -[GEOClientMetrics networkMetrics](v6, "networkMetrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRequestDataSize:", v12);

  v14 = -[NSURLSessionTask _countOfBytesReceivedEncoded](self->_backingTask, "_countOfBytesReceivedEncoded");
  -[GEOClientMetrics networkMetrics](v6, "networkMetrics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setResponseDataSize:", v14);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[GEOClientMetrics networkMetrics](v6, "networkMetrics", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "transactionMetrics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v23 = -[GEODataRequest multipathServiceType](self->_request, "multipathServiceType") - 1;
        if (v23 < 3)
          v24 = (v23 + 1);
        else
          v24 = 0;
        objc_msgSend(v22, "setMultipathServiceType:", v24);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v19);
  }

  v25 = -[GEODataURLSessionTask receivedRNFNotification](self, "receivedRNFNotification");
  -[GEOClientMetrics networkMetrics](v6, "networkMetrics");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setRnfTriggered:", v25);

  return v6;
}

- (BOOL)failedDueToCancel
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[GEODataURLSessionTask error](self, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
      v5 = objc_msgSend(v3, "code") == -999;
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSError)error
{
  void *nonBackingTaskError;
  void *v4;
  NSError *v5;

  -[NSURLSessionTask error](self->_backingTask, "error");
  nonBackingTaskError = (void *)objc_claimAutoreleasedReturnValue();
  v4 = nonBackingTaskError;
  if (!nonBackingTaskError)
    nonBackingTaskError = self->_nonBackingTaskError;
  v5 = nonBackingTaskError;

  return v5;
}

- (BOOL)receivedRNFNotification
{
  return self->_receivedRNFNotification;
}

- (void)cancel
{
  NSObject *sessionIsolation;
  _QWORD block[5];

  sessionIsolation = self->_sessionIsolation;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__GEODataURLSessionTask_cancel__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(sessionIsolation, block);
}

- (void)start
{
  uint64_t v3;
  uint64_t v4;
  qos_class_t v5;
  OS_voucher *v6;
  OS_voucher *voucher;
  NSObject *sessionIsolation;
  dispatch_block_t v9;
  _QWORD block[6];
  qos_class_t v11;

  GEOMachAbsoluteTimeGetCurrent();
  v4 = v3;
  v5 = qos_class_self();
  v6 = (OS_voucher *)voucher_copy();
  voucher = self->_voucher;
  self->_voucher = v6;

  sessionIsolation = self->_sessionIsolation;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__GEODataURLSessionTask_start__block_invoke;
  block[3] = &unk_1E1C0AFC0;
  block[4] = self;
  block[5] = v4;
  v11 = v5;
  v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(sessionIsolation, v9);

}

- (BOOL)didValidateEntityTagForData:(id *)a3 entityTag:(id *)a4
{
  int64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v7 = -[GEODataURLSessionTask HTTPStatusCode](self, "HTTPStatusCode");
  if (v7 == 304)
  {
    -[GEODataURLSessionTask entityTag](self, "entityTag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      -[GEODataURLSessionTask originalURLRequest](self, "originalURLRequest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "allHTTPHeaderFields");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("If-None-Match"));
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[GEODataURLSessionTask cachedData](self, "cachedData");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_retainAutorelease(v10);
    *a4 = v13;

  }
  return v7 == 304;
}

- (NSString)entityTag
{
  void *v2;
  void *v3;
  void *v4;

  -[GEODataURLSessionTask response](self, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allHeaderFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ETag"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSData)cachedData
{
  return self->_cachedData;
}

- (NSData)receivedData
{
  return (NSData *)self->_receivedData;
}

- (BOOL)protocolBufferHasPreamble
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadedFileURL, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_originalStartDate, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_urlTaskMetrics, 0);
  objc_storeStrong((id *)&self->_receivedData, 0);
  objc_storeStrong((id *)&self->_cachedData, 0);
  objc_storeStrong((id *)&self->_nonBackingTaskError, 0);
  objc_storeStrong((id *)&self->_backingTask, 0);
  objc_storeStrong((id *)&self->_sessionIsolation, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __31__GEODataURLSessionTask_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  uint64_t v4;
  os_activity_scope_state_s v5;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 117))
  {
    v5.opaque[0] = 0;
    v5.opaque[1] = 0;
    os_activity_scope_enter(*(os_activity_t *)(v1 + 128), &v5);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 117) = 1;
    GEOGetDataSessionURLLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "Cancelled task %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "cancel");
    os_activity_scope_leave(&v5);
  }
}

void __114__GEODataURLSessionTask_URLSessionTask__dataURLSession_willSendRequestForEstablishedConnection_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __114__GEODataURLSessionTask_URLSessionTask__dataURLSession_willSendRequestForEstablishedConnection_completionHandler___block_invoke_2;
  v8[3] = &unk_1E1C0AFE8;
  v8[4] = v4;
  v11 = *(id *)(a1 + 72);
  v6 = *(id *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 56);
  v9 = v6;
  v10 = v7;
  objc_msgSend(v2, "dataURLSession:willSendRequest:forTask:completionHandler:", v3, v4, v5, v8);

}

void __114__GEODataURLSessionTask_URLSessionTask__dataURLSession_willSendRequestForEstablishedConnection_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  void (*v7)(void);
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(id *)(a1 + 32) == v3)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_10:
    v7();
    goto LABEL_11;
  }
  GEOGetDataSessionURLLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (!v3)
  {
    if (v5)
    {
      v8 = *(_QWORD *)(a1 + 48);
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_INFO, "Cancelling task %@ -- willSendRequestForEstablishedConnection returned nil.", (uint8_t *)&v9, 0xCu);
    }

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_10;
  }
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 48);
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_INFO, "Updating task %@ request -- willSendRequestForEstablishedConnection returned new object.", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 48), "updateRequest:completionHandler:", v3, *(_QWORD *)(a1 + 56));
LABEL_11:

}

void __93__GEODataURLSessionTask_URLSessionTask__dataURLSession_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  uint64_t v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 72);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __93__GEODataURLSessionTask_URLSessionTask__dataURLSession_didReceiveResponse_completionHandler___block_invoke_2;
  v6[3] = &unk_1E1C0B060;
  v5 = *(void **)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = *(id *)(a1 + 64);
  objc_msgSend(v2, "dataURLSession:shouldConvertDataTask:toDownloadTaskForEstimatedResponseSize:completionHandler:", v3, v7, v4, v6);

}

void __93__GEODataURLSessionTask_URLSessionTask__dataURLSession_didReceiveResponse_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  char v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[2] = __93__GEODataURLSessionTask_URLSessionTask__dataURLSession_didReceiveResponse_completionHandler___block_invoke_3;
  v6[3] = &unk_1E1C0B038;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(v3 + 32);
  v6[1] = 3221225472;
  v9 = a2;
  v6[4] = v3;
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  dispatch_async(v5, v6);

}

void __30__GEODataURLSessionTask_start__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  os_activity_scope_state_s v6;

  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 128), &v6);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = *(_QWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 136))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 136);
    *(_QWORD *)(v4 + 136) = v3;

    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_DWORD *)(v2 + 120) = *(_DWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_start");
  os_activity_scope_leave(&v6);
}

- (void)didFinishDownloadingToURL:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSURL *v13;
  NSObject *p_super;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E98];
  v5 = a3;
  NSTemporaryDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  LODWORD(v7) = objc_msgSend(v11, "moveItemAtURL:toURL:error:", v5, v10, &v15);

  v12 = v15;
  if ((_DWORD)v7)
  {
    v13 = v10;
    p_super = &self->_downloadedFileURL->super;
    self->_downloadedFileURL = v13;
  }
  else
  {
    GEOGetDataSessionURLLog();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v12;
      _os_log_impl(&dword_1885A9000, p_super, OS_LOG_TYPE_ERROR, "Failed to move downloaded data to temporary URL: %{public}@", buf, 0xCu);
    }
  }

}

- (void)backingTask:(id)a3 didBecomeDownloadTask:(id)a4
{
  NSURLSessionTask *v6;
  id v7;
  NSObject *v8;
  int v9;
  GEODataURLSessionTask *v10;
  __int16 v11;
  NSURLSessionTask *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = (NSURLSessionTask *)a3;
  v7 = a4;
  if (self->_backingTask == v6)
  {
    GEOGetDataSessionURLLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412802;
      v10 = self;
      v11 = 2112;
      v12 = v6;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEBUG, "Task %@'s backing task did change: %@ -> %@", (uint8_t *)&v9, 0x20u);
    }

    objc_storeStrong((id *)&self->_backingTask, a4);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    LOWORD(v9) = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: dataTask == _backingTask", (uint8_t *)&v9, 2u);
  }

}

- (unsigned)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (GEODataURLSessionTask)init
{
  GEODataURLSessionTask *result;

  result = (GEODataURLSessionTask *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (void)_prepareForRestart
{
  NSURLSessionTask *backingTask;
  NSError *nonBackingTaskError;
  NSMutableData *receivedData;
  NSURLSessionTaskMetrics *urlTaskMetrics;

  -[NSURLSessionTask cancel](self->_backingTask, "cancel");
  backingTask = self->_backingTask;
  self->_backingTask = 0;

  self->_startTime = 0.0;
  self->_finished = 0;
  nonBackingTaskError = self->_nonBackingTaskError;
  self->_nonBackingTaskError = 0;

  receivedData = self->_receivedData;
  self->_receivedData = 0;

  urlTaskMetrics = self->_urlTaskMetrics;
  self->_urlTaskMetrics = 0;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GEODataURLSessionTask originalRequestURL](self, "originalRequestURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEODataURLSessionTask backingTask](self, "backingTask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEODataURLSessionTask requestCounterTicket](self, "requestCounterTicket");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<DUT %p URL: %@ Backing: %@ ticket: %@>"), self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSURLSessionTaskState v7;
  void *v8;
  void *v9;
  NSMutableData *receivedData;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEODataURLSessionTask originalRequestURL](self, "originalRequestURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[GEODataURLSessionTask originalRequestURL](self, "originalRequestURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" \"%@\"), v5);

  }
  -[GEODataURLSessionTask delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" delegate: %p"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR(", underlying: <%@: %p>"), objc_opt_class(), self->_backingTask);
  v7 = -[NSURLSessionTask state](self->_backingTask, "state");
  if ((unint64_t)v7 <= NSURLSessionTaskStateCompleted)
    objc_msgSend(v3, "appendString:", off_1E1C0B080[v7]);
  -[GEODataURLSessionTask response](self, "response");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v3, "appendFormat:", CFSTR(", status code: %u"), objc_msgSend(v8, "statusCode"));
  receivedData = self->_receivedData;
  if (receivedData)
    objc_msgSend(v3, "appendFormat:", CFSTR(", data: %zu"), -[NSMutableData length](receivedData, "length"));

  return v3;
}

- (float)priority
{
  NSObject *sessionIsolation;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  sessionIsolation = self->_sessionIsolation;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__GEODataURLSessionTask_priority__block_invoke;
  v5[3] = &unk_1E1C00760;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(sessionIsolation, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __33__GEODataURLSessionTask_priority__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 108);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setPriority:(float)a3
{
  NSObject *sessionIsolation;
  _QWORD v4[5];
  float v5;

  sessionIsolation = self->_sessionIsolation;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__GEODataURLSessionTask_setPriority___block_invoke;
  v4[3] = &unk_1E1BFFBC8;
  v4[4] = self;
  v5 = a3;
  dispatch_async_and_wait(sessionIsolation, v4);
}

void __37__GEODataURLSessionTask_setPriority___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  os_activity_scope_state_s v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  double v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 128), &v8);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 108) = *(_DWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (v3)
  {
    LODWORD(v2) = *(_DWORD *)(a1 + 40);
    objc_msgSend(v3, "setPriority:", v2);
    GEOGetDataSessionURLLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(v5 + 40);
      v7 = *(float *)(v5 + 108);
      *(_DWORD *)buf = 138412802;
      v10 = v6;
      v11 = 2048;
      v12 = v7;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "Changed backing task %@ priority to %4.2f for task %@", buf, 0x20u);
    }

  }
  os_activity_scope_leave(&v8);
}

- (NSURLSessionTaskMetrics)urlTaskMetrics
{
  NSURLSessionTaskMetrics *urlTaskMetrics;

  urlTaskMetrics = self->_urlTaskMetrics;
  if (urlTaskMetrics)
    return urlTaskMetrics;
  -[NSURLSessionTask _incompleteTaskMetrics](self->_backingTask, "_incompleteTaskMetrics");
  return (NSURLSessionTaskMetrics *)(id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)receivedDataLength
{
  NSMutableData *receivedData;
  unint64_t result;
  void *v5;
  void *v6;
  void *v7;

  receivedData = self->_receivedData;
  if (receivedData)
    return -[NSMutableData length](receivedData, "length");
  if (!self->_downloadedFileURL)
    return 0;
  result = self->_cachedDownloadFileSize;
  if (!result)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL path](self->_downloadedFileURL, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributesOfItemAtPath:error:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_cachedDownloadFileSize = objc_msgSend(v7, "fileSize");

    return self->_cachedDownloadFileSize;
  }
  return result;
}

- (NSURL)downloadedFileURL
{
  return self->_downloadedFileURL;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_nonBackingTaskError, a3);
}

- (NSURLRequest)originalURLRequest
{
  return -[NSURLSessionTask originalRequest](self->_backingTask, "originalRequest");
}

- (unint64_t)outgoingPayloadSize
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[NSURLSessionTask originalRequest](self->_backingTask, "originalRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "HTTPBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  return v4;
}

- (unint64_t)incomingPayloadSize
{
  return -[NSURLSessionTask countOfBytesReceived](self->_backingTask, "countOfBytesReceived");
}

- (NSString)remoteAddressAndPort
{
  return (NSString *)-[NSURLSessionTaskMetrics _geo_remoteAddressAndPort](self->_urlTaskMetrics, "_geo_remoteAddressAndPort");
}

- (unint64_t)requestedMultipathServiceType
{
  return -[GEODataRequest multipathServiceType](self->_request, "multipathServiceType");
}

- (BOOL)validateTransportWithError:(id *)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  -[GEODataURLSessionTask error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    if (-[GEODataURLSessionTask HTTPStatusCode](self, "HTTPStatusCode") == 200)
    {
      v7 = 1;
      goto LABEL_12;
    }
    if (a3)
    {
      v19[0] = CFSTR("HTTPStatus");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[GEODataURLSessionTask HTTPStatusCode](self, "HTTPStatusCode"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v8;
      v19[1] = *MEMORY[0x1E0CB32F0];
      -[GEODataURLSessionTask response](self, "response");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v10;
      v19[2] = *MEMORY[0x1E0CB3300];
      -[GEODataURLSessionTask response](self, "response");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "absoluteString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
      GEOErrorDomain();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[GEODataURLSessionTask HTTPStatusCode](self, "HTTPStatusCode") == 451)
        v17 = -6;
      else
        v17 = -7;
      *a3 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, v17, v14);

    }
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  if (!a3)
    goto LABEL_11;
  v7 = 0;
  *a3 = objc_retainAutorelease(v5);
LABEL_12:

  return v7;
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (OS_dispatch_queue)sessionIsolation
{
  return self->_sessionIsolation;
}

- ($C4D369C9F02205611300857CFD58F739)requestKind
{
  return ($C4D369C9F02205611300857CFD58F739)self->_requestKind;
}

- (double)startTime
{
  return self->_startTime;
}

- (NSURLSessionTask)backingTask
{
  return self->_backingTask;
}

- (BOOL)finished
{
  return self->_finished;
}

- (BOOL)mptcpNegotiated
{
  return self->_mptcpNegotiated;
}

- (void)setReceivedRNFNotification:(BOOL)a3
{
  self->_receivedRNFNotification = a3;
}

- (void)updateRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *sessionIsolation;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  sessionIsolation = self->_sessionIsolation;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__GEODataURLSessionTask_URLSessionTask__updateRequest_completionHandler___block_invoke;
  block[3] = &unk_1E1BFFC90;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(sessionIsolation, block);

}

void __73__GEODataURLSessionTask_URLSessionTask__updateRequest_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  GEOGetDataSessionURLLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_INFO, (const char *)&unk_189D97683, v4, 2u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "createURLRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (double)elapsedTime
{
  double result;
  double v4;

  result = 0.0;
  if (self->_startTime != 2.22507386e-308)
  {
    GEOMachAbsoluteTimeGetCurrent();
    return v4 - self->_startTime;
  }
  return result;
}

- (double)loadTime
{
  double startTime;
  double result;
  double endTime;

  startTime = self->_startTime;
  result = 0.0;
  if (startTime != 2.22507386e-308)
  {
    endTime = self->_endTime;
    if (endTime != 2.22507386e-308)
      return endTime - startTime;
  }
  return result;
}

- (double)loadTimeIncludingTask:(id)a3
{
  double *v4;
  double startTime;
  double v6;
  double endTime;
  double v9;
  double v10;

  v4 = (double *)a3;
  startTime = self->_startTime;
  v6 = 0.0;
  if (startTime != 2.22507386e-308)
  {
    if (v4)
    {
      endTime = self->_endTime;
      if (endTime != 2.22507386e-308)
      {
        v9 = v4[10];
        if (v9 != 2.22507386e-308)
        {
          v10 = v4[11];
          if (v10 != 2.22507386e-308)
          {
            if (endTime <= v10)
              endTime = v4[11];
            if (startTime >= v9)
              startTime = v4[10];
            v6 = endTime - startTime;
          }
        }
      }
    }
  }

  return v6;
}

- (BOOL)validateTileResponse:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v4;

  if (a3
    || (v4 = -[GEODataURLSessionTask validateNonEmptyResponseWithError:](self, "validateNonEmptyResponseWithError:", a4)))
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (BOOL)validateNonEmptyResponseWithError:(id *)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (-[GEODataURLSessionTask receivedDataLength](self, "receivedDataLength")
    || !-[GEODataURLSessionTask contentLength](self, "contentLength"))
  {
    return 1;
  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[GEODataURLSessionTask originalRequestURL](self, "originalRequestURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Connection closed without receiving any data for url: %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = CFSTR("requester msg");
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:userInfo:", -1, v9);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (BOOL)validateContentLengthWithError:(id *)a3
{
  unint64_t v5;
  void *v7;
  void *v8;

  v5 = -[GEODataURLSessionTask receivedDataLength](self, "receivedDataLength");
  if (-[GEODataURLSessionTask contentLength](self, "contentLength") == 0x7FFFFFFFFFFFFFFFLL
    || -[GEODataURLSessionTask contentLength](self, "contentLength") == v5)
  {
    return 1;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Content-Length: %lu, Actual data read: %lu"), -[GEODataURLSessionTask contentLength](self, "contentLength"), v5);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("requester msg"), 0);
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:userInfo:", -7, v8);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (NSString)contentLengthString
{
  void *v2;
  void *v3;
  void *v4;

  -[GEODataURLSessionTask response](self, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allHeaderFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Content-Length"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (unint64_t)contentLength
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[GEODataURLSessionTask contentLengthString](self, "contentLengthString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (NSURL)originalRequestURL
{
  void *v2;
  void *v3;

  -[GEODataURLSessionTask originalURLRequest](self, "originalURLRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

@end

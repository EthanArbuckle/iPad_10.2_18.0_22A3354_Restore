@implementation FCAssetDownloadOperation

+ (id)sharedURLSession
{
  if (qword_1ED0F7C30 != -1)
    dispatch_once(&qword_1ED0F7C30, &__block_literal_global_175);
  return (id)qword_1ED0F7C28;
}

void __44__FCAssetDownloadOperation_sharedURLSession__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if ((FCProcessIsMemoryConstrained() & 1) != 0)
    objc_msgSend(MEMORY[0x1E0C92CA0], "ephemeralSessionConfiguration");
  else
    objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsCellularAccess:", 1);
  objc_msgSend(v7, "setRequestCachePolicy:", 1);
  objc_msgSend(v7, "setURLCache:", 0);
  objc_msgSend(v7, "setTimeoutIntervalForRequest:", 15.0);
  objc_msgSend(v7, "setTimeoutIntervalForResource:", 240.0);
  objc_msgSend(v7, "set_timingDataOptions:", 1);
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", &__block_literal_global_3_10);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProtocolClasses:", v0);

  objc_msgSend(v7, "setHTTPMaximumConnectionsPerHost:", 6);
  objc_msgSend(v7, "setHTTPShouldUsePipelining:", 1);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.newsd")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.nanonews")) & 1) != 0
    || objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.nanonews.widget")))
  {
    objc_msgSend(v7, "set_sourceApplicationBundleIdentifier:", CFSTR("com.apple.news"));
  }
  v3 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  objc_msgSend(v3, "setName:", CFSTR("FCAssetManager.downloadCallbackQueue"));
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMaxConcurrentOperationCount:", objc_msgSend(v4, "processorCount"));

  objc_msgSend(MEMORY[0x1E0C92C98], "sessionWithConfiguration:delegate:delegateQueue:", v7, 0, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ED0F7C28;
  qword_1ED0F7C28 = v5;

}

void __44__FCAssetDownloadOperation_sharedURLSession__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());

}

+ (id)sharedURLRequestScheduler
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__FCAssetDownloadOperation_sharedURLRequestScheduler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED0F7C40 != -1)
    dispatch_once(&qword_1ED0F7C40, block);
  return (id)qword_1ED0F7C38;
}

void __53__FCAssetDownloadOperation_sharedURLRequestScheduler__block_invoke(uint64_t a1)
{
  FCURLRequestScheduler *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = [FCURLRequestScheduler alloc];
  objc_msgSend(*(id *)(a1 + 32), "sharedURLSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[FCURLRequestScheduler initWithURLSession:](v2, "initWithURLSession:", v5);
  v4 = (void *)qword_1ED0F7C38;
  qword_1ED0F7C38 = v3;

}

- (FCAssetDownloadOperation)init
{
  void *v3;
  FCAssetDownloadOperation *v4;

  +[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FCAssetDownloadOperation initWithNetworkReachability:URLRequestScheduler:](self, "initWithNetworkReachability:URLRequestScheduler:", v3, 0);

  return v4;
}

- (FCAssetDownloadOperation)initWithNetworkReachability:(id)a3
{
  return -[FCAssetDownloadOperation initWithNetworkReachability:URLRequestScheduler:](self, "initWithNetworkReachability:URLRequestScheduler:", a3, 0);
}

- (FCAssetDownloadOperation)initWithNetworkReachability:(id)a3 URLRequestScheduler:(id)a4
{
  id v6;
  FCAssetDownloadOperation *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCAssetDownloadOperation;
  v7 = -[FCNetworkOperation initWithNetworkReachability:](&v14, sel_initWithNetworkReachability_, a3);
  if (v7)
  {
    v8 = v6;
    if (!v6)
    {
      objc_msgSend((id)objc_opt_class(), "sharedURLRequestScheduler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v7->_scheduler, v8);
    if (!v6)

    v7->_cachePolicy = 1;
    v9 = time(0);
    v10 = atomic_load(&qword_1ED0F7C48);
    if (v9 > v10)
    {
      atomic_store(v9, &qword_1ED0F7C48);
      atomic_store(0, (unsigned int *)&_MergedGlobals_9);
    }
    do
      v11 = __ldaxr((unsigned int *)&_MergedGlobals_9);
    while (__stlxr(v11 + 1, (unsigned int *)&_MergedGlobals_9));
    if (v11 >= 0x1F5)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("More than %lu asset downloads were triggered within one second"), 500);
        *(_DWORD *)buf = 136315906;
        v16 = "-[FCAssetDownloadOperation initWithNetworkReachability:URLRequestScheduler:]";
        v17 = 2080;
        v18 = "FCAssetDownloadOperation.m";
        v19 = 1024;
        v20 = 150;
        v21 = 2114;
        v22 = v13;
        _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: TooManyAssetDownloads) : %s %s:%d %{public}@", buf, 0x26u);

      }
      atomic_store(0, (unsigned int *)&_MergedGlobals_9);
    }
  }

  return v7;
}

- (BOOL)validateOperation
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[FCAssetDownloadOperation URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("asset download operation must have a non-nil URL"));
    v9 = 136315906;
    v10 = "-[FCAssetDownloadOperation validateOperation]";
    v11 = 2080;
    v12 = "FCAssetDownloadOperation.m";
    v13 = 1024;
    v14 = 163;
    v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

  }
  -[FCAssetDownloadOperation scheduler](self, "scheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("asset download operation must have a non-nil scheduler"));
    v9 = 136315906;
    v10 = "-[FCAssetDownloadOperation validateOperation]";
    v11 = 2080;
    v12 = "FCAssetDownloadOperation.m";
    v13 = 1024;
    v14 = 167;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

  }
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  return !v5;
}

- (void)prepareOperation
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCAssetDownloadOperation setRequestUUID:](self, "setRequestUUID:", v3);

}

- (void)performOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int64_t v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, void *, void *, void *);
  void *v28;
  FCAssetDownloadOperation *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C92C28];
  -[FCAssetDownloadOperation URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  FCOperationFlagsApplyToURLRequest(-[FCOperation flags](self, "flags"), v5);
  -[FCNetworkOperation preferredTimeoutIntervalForRequest](self, "preferredTimeoutIntervalForRequest");
  objc_msgSend(v5, "setTimeoutInterval:");
  objc_msgSend(v5, "setCachePolicy:", -[FCAssetDownloadOperation cachePolicy](self, "cachePolicy"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCAssetDownloadOperation requestUUID](self, "requestUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("X-Apple-Request-UUID"));

  FCClientInfoHeaderValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("X-MMe-Client-Info"));

  FCUserAgentHeaderValue();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("User-Agent"));

  -[FCAssetDownloadOperation additionalRequestHTTPHeaders](self, "additionalRequestHTTPHeaders");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[FCAssetDownloadOperation additionalRequestHTTPHeaders](self, "additionalRequestHTTPHeaders");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addEntriesFromDictionary:", v11);

  }
  objc_msgSend(v5, "setAllHTTPHeaderFields:", v6);
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __44__FCAssetDownloadOperation_performOperation__block_invoke;
  v28 = &unk_1E464A6E0;
  v29 = self;
  v12 = v5;
  v30 = v12;
  v13 = _Block_copy(&v25);
  -[FCAssetDownloadOperation scheduler](self, "scheduler", v25, v26, v27, v28, v29);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[FCAssetDownloadOperation downloadDestination](self, "downloadDestination");
  v16 = -[FCOperation relativePriority](self, "relativePriority");
  -[FCOperation shortOperationDescription](self, "shortOperationDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scheduleURLRequest:destination:priority:loggingKey:completion:", v12, v15, v16, v17, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v18);
  v19 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v20 = v19;
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCAssetDownloadOperation loggingKey](self, "loggingKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCAssetDownloadOperation requestUUID](self, "requestUUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCAssetDownloadOperation URL](self, "URL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v32 = v21;
    v33 = 2114;
    v34 = v22;
    v35 = 2114;
    v36 = v23;
    v37 = 2114;
    v38 = v24;
    _os_log_impl(&dword_1A1B90000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ will download asset %{public}@ with request UUID: %{public}@, URL: %{public}@", buf, 0x2Au);

  }
}

void __44__FCAssetDownloadOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  FCNetworkEvent *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  FCNetworkEvent *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v43 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    objc_msgSend(v10, "shortOperationDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v45 = v14;
    _os_log_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ finished", buf, 0xCu);

  }
  objc_opt_class();
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v9;
    if ((objc_msgSend(v15, "statusCode") < 200 || objc_msgSend(v15, "statusCode") >= 300)
      && objc_msgSend(v15, "statusCode") != 304)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "allHeaderFields");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v15, "allHeaderFields");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("FCErrorHTTPResponseHeaders"));

      }
      if (objc_msgSend(v15, "statusCode") >= 500 && objc_msgSend(v15, "statusCode") <= 598)
      {
        objc_msgSend(v15, "allHeaderFields");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Retry-After"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          v21 = objc_msgSend(v20, "integerValue");
          if (v21)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
            v22 = objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              v23 = (void *)v22;
              objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, CFSTR("FCErrorRetryAfter"));

            }
          }
        }

      }
      v24 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(*(id *)(a1 + 32), "URL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v15, "statusCode");
      objc_msgSend(*(id *)(a1 + 32), "requestUUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "fc_HTTPErrorWithURL:statusCode:requestUUID:additionalUserInfo:", v25, v26, v27, v16);
      v28 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v28;
    }
  }
  else
  {
    v15 = 0;
  }
  v42 = v9;
  if (!v11)
  {
    v41 = objc_msgSend(*(id *)(a1 + 32), "downloadDestination");
    if (v41 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "setDownloadedData:", v43);
    }
    else if (!v41)
    {
      objc_msgSend(*(id *)(a1 + 32), "setDownloadedFileURL:", v43);
    }
  }
  v29 = [FCNetworkEvent alloc];
  v30 = objc_msgSend(*(id *)(a1 + 32), "networkEventType");
  v31 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "operationID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestUUID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "operationStartTime");
  v35 = v34;
  objc_msgSend(v10, "_incompleteCurrentTaskTransactionMetrics");
  v36 = v10;
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[FCNetworkEvent initWithType:URLRequest:operationID:requestUUID:startTime:HTTPResponse:metrics:containerName:error:](v29, "initWithType:URLRequest:operationID:requestUUID:startTime:HTTPResponse:metrics:containerName:error:", v30, v31, v32, v33, v15, v37, v35, 0, v11);
  objc_msgSend(*(id *)(a1 + 32), "setNetworkEvent:", v38);

  objc_msgSend(*(id *)(a1 + 32), "networkBehaviorMonitor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "networkEvent");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "logNetworkEvent:", v40);

  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v11);
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  unint64_t v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  int64_t v30;
  void *v31;
  void (**v32)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  unint64_t v45;
  __int16 v46;
  unint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v10 = (void *)FCOperationLog;
    if (!os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v7 = v10;
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCAssetDownloadOperation loggingKey](self, "loggingKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB34E8];
    -[FCAssetDownloadOperation networkEvent](self, "networkEvent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringFromByteCount:countStyle:", objc_msgSend(v14, "responseSize"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCAssetDownloadOperation networkEvent](self, "networkEvent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "totalDuration");
    v18 = (unint64_t)(fmax(v17, 0.0) * 1000.0);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v20 = v19;
    -[FCAssetDownloadOperation networkEvent](self, "networkEvent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "startTime");
    v38 = 138544386;
    v39 = v11;
    v40 = 2114;
    v41 = v12;
    v42 = 2114;
    v43 = v15;
    v44 = 2048;
    v45 = v18;
    v46 = 2048;
    v47 = (unint64_t)(fmax(v20 - v22, 0.0) * 1000.0);
    _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully downloaded asset %{public}@ with size: %{public}@, network time: %llums, total time: %llums", (uint8_t *)&v38, 0x34u);

    goto LABEL_9;
  }
  if (objc_msgSend(v4, "fc_isCancellationError"))
  {
    v6 = (void *)FCOperationLog;
    if (!os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v7 = v6;
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCAssetDownloadOperation loggingKey](self, "loggingKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 138543618;
    v39 = v8;
    v40 = 2114;
    v41 = v9;
    _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelled downloading asset %{public}@", (uint8_t *)&v38, 0x16u);
    goto LABEL_5;
  }
  objc_msgSend(v5, "userInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("FCErrorHTTPStatusCode"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)FCOperationLog;
  v26 = os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR);
  if (v24)
  {
    if (v26)
    {
      v7 = v25;
      -[FCOperation shortOperationDescription](self, "shortOperationDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCAssetDownloadOperation loggingKey](self, "loggingKey");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userInfo");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("FCErrorHTTPStatusCode"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 138543874;
      v39 = v8;
      v40 = 2114;
      v41 = v27;
      v42 = 2114;
      v43 = v29;
      _os_log_error_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_ERROR, "%{public}@ failed to download asset %{public}@ with response status code: %{public}@", (uint8_t *)&v38, 0x20u);

      goto LABEL_6;
    }
  }
  else if (v26)
  {
    v7 = v25;
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCAssetDownloadOperation loggingKey](self, "loggingKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedDescription");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 138543874;
    v39 = v8;
    v40 = 2114;
    v41 = v9;
    v42 = 2114;
    v43 = v37;
    _os_log_error_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_ERROR, "%{public}@ failed to download asset %{public}@ with error: %{public}@", (uint8_t *)&v38, 0x20u);

LABEL_5:
LABEL_6:

LABEL_9:
  }
LABEL_14:
  v30 = -[FCAssetDownloadOperation downloadDestination](self, "downloadDestination");
  if (v30 == 1)
  {
    -[FCAssetDownloadOperation dataDownloadCompletionHandler](self, "dataDownloadCompletionHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      -[FCAssetDownloadOperation dataDownloadCompletionHandler](self, "dataDownloadCompletionHandler");
      v32 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[FCAssetDownloadOperation downloadedData](self, "downloadedData");
      v33 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
  }
  else if (!v30)
  {
    -[FCAssetDownloadOperation fileDownloadCompletionHandler](self, "fileDownloadCompletionHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      -[FCAssetDownloadOperation fileDownloadCompletionHandler](self, "fileDownloadCompletionHandler");
      v32 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[FCAssetDownloadOperation downloadedFileURL](self, "downloadedFileURL");
      v33 = objc_claimAutoreleasedReturnValue();
LABEL_20:
      v35 = (void *)v33;
      -[FCAssetDownloadOperation networkEvent](self, "networkEvent");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *, void *))v32)[2](v32, v35, v36, v5);

    }
  }

}

- (unint64_t)maxRetries
{
  return 0;
}

- (id)throttleGroup
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[FCAssetDownloadOperation URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[FCAssetDownloadOperation networkEventType](self, "networkEventType") == 16)
  {
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("-appconfig"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return v4;
}

- (BOOL)areNetworkRequirementsSatisfiedWithReachability:(id)a3 offlineReason:(int64_t *)a4
{
  id v5;
  char v6;

  v5 = a3;
  v6 = objc_msgSend(v5, "isCloudKitReachable");
  if ((v6 & 1) == 0)
    *a4 = objc_msgSend(v5, "offlineReason");

  return v6;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (NSString)loggingKey
{
  return self->_loggingKey;
}

- (void)setLoggingKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (int64_t)downloadDestination
{
  return self->_downloadDestination;
}

- (void)setDownloadDestination:(int64_t)a3
{
  self->_downloadDestination = a3;
}

- (int)networkEventType
{
  return self->_networkEventType;
}

- (void)setNetworkEventType:(int)a3
{
  self->_networkEventType = a3;
}

- (unint64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (void)setCachePolicy:(unint64_t)a3
{
  self->_cachePolicy = a3;
}

- (NSDictionary)additionalRequestHTTPHeaders
{
  return self->_additionalRequestHTTPHeaders;
}

- (void)setAdditionalRequestHTTPHeaders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (FCNetworkBehaviorMonitor)networkBehaviorMonitor
{
  return self->_networkBehaviorMonitor;
}

- (void)setNetworkBehaviorMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_networkBehaviorMonitor, a3);
}

- (id)fileDownloadCompletionHandler
{
  return self->_fileDownloadCompletionHandler;
}

- (void)setFileDownloadCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (id)dataDownloadCompletionHandler
{
  return self->_dataDownloadCompletionHandler;
}

- (void)setDataDownloadCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (FCURLRequestScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_scheduler, a3);
}

- (NSURL)downloadedFileURL
{
  return self->_downloadedFileURL;
}

- (void)setDownloadedFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_downloadedFileURL, a3);
}

- (NSData)downloadedData
{
  return self->_downloadedData;
}

- (void)setDownloadedData:(id)a3
{
  objc_storeStrong((id *)&self->_downloadedData, a3);
}

- (NSString)requestUUID
{
  return self->_requestUUID;
}

- (void)setRequestUUID:(id)a3
{
  objc_storeStrong((id *)&self->_requestUUID, a3);
}

- (FCNetworkEvent)networkEvent
{
  return self->_networkEvent;
}

- (void)setNetworkEvent:(id)a3
{
  objc_storeStrong((id *)&self->_networkEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkEvent, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
  objc_storeStrong((id *)&self->_downloadedData, 0);
  objc_storeStrong((id *)&self->_downloadedFileURL, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong(&self->_dataDownloadCompletionHandler, 0);
  objc_storeStrong(&self->_fileDownloadCompletionHandler, 0);
  objc_storeStrong((id *)&self->_networkBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_additionalRequestHTTPHeaders, 0);
  objc_storeStrong((id *)&self->_loggingKey, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end

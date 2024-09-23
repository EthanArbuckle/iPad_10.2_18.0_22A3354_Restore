@implementation GEOOfflineServiceRequesterOperation

- (GEOOfflineServiceRequesterOperation)initWithRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 config:(id)a6 throttleToken:(id)a7 options:(unint64_t)a8 willSendRequestHandler:(id)a9 validationHandler:(id)a10 completionHandler:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  GEOOfflineServiceRequesterOperation *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  GEOTaskQueue *taskQueue;
  uint64_t v29;
  id willSendRequestHandler;
  uint64_t v31;
  id validationHandler;
  id v33;
  id v34;
  uint64_t v35;
  id completionHandler;
  id v38;
  void *v39;
  id obj;
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  id location;
  objc_super v50;

  v17 = a3;
  obj = a4;
  v18 = a4;
  v43 = a5;
  v41 = a6;
  v19 = a6;
  v42 = a7;
  v20 = a9;
  v21 = a10;
  v22 = v20;
  v23 = a11;
  v50.receiver = self;
  v50.super_class = (Class)GEOOfflineServiceRequesterOperation;
  v24 = -[GEOOfflineServiceRequesterOperation init](&v50, sel_init);
  if (v24)
  {
    v38 = v19;
    v39 = v17;
    objc_msgSend(v19, "debugRequestName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copy");

    objc_storeStrong((id *)&v24->_debugRequestName, v26);
    objc_storeStrong((id *)&v24->_request, a3);
    objc_storeStrong((id *)&v24->_auditToken, a5);
    objc_storeStrong((id *)&v24->_traits, obj);
    objc_storeStrong((id *)&v24->_config, v41);
    v24->_dataRequestKind = ($7466BF22B2A7275A1F5DB80FF4552E0B)-[GEOServiceRequestConfiguring dataRequestKindForRequest:traits:](v24->_config, "dataRequestKindForRequest:traits:", v24->_request, v18);
    objc_storeStrong((id *)&v24->_throttleToken, a7);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[GEOServiceRequestConfiguring offlineTaskQueue](v24->_config, "offlineTaskQueue");
      v27 = objc_claimAutoreleasedReturnValue();
      taskQueue = v24->_taskQueue;
      v24->_taskQueue = (GEOTaskQueue *)v27;

    }
    v29 = objc_msgSend(v22, "copy");
    willSendRequestHandler = v24->_willSendRequestHandler;
    v24->_willSendRequestHandler = (id)v29;

    v31 = objc_msgSend(v21, "copy");
    validationHandler = v24->_validationHandler;
    v24->_validationHandler = (id)v31;

    objc_initWeak(&location, v24);
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __161__GEOOfflineServiceRequesterOperation_initWithRequest_traits_auditToken_config_throttleToken_options_willSendRequestHandler_validationHandler_completionHandler___block_invoke;
    v44[3] = &unk_1E1C21860;
    objc_copyWeak(&v48, &location);
    v45 = v39;
    v46 = v26;
    v47 = v23;
    v33 = v26;
    v17 = v39;
    v34 = v33;
    v35 = MEMORY[0x18D765024](v44);
    completionHandler = v24->_completionHandler;
    v24->_completionHandler = (id)v35;

    objc_destroyWeak(&v48);
    objc_destroyWeak(&location);
    v19 = v38;
  }

  return v24;
}

void __161__GEOOfflineServiceRequesterOperation_initWithRequest_traits_auditToken_config_throttleToken_options_willSendRequestHandler_validationHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  GEOGetOfflineRequesterLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 32);
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138413314;
    v19 = v10;
    v20 = 2048;
    v21 = v11;
    v22 = 2112;
    v23 = v13;
    v24 = 2048;
    v25 = v5;
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEBUG, "Completed request %@<%p> with response %@<%p> error: %@", (uint8_t *)&v18, 0x34u);

  }
  GEOFindOrCreateLog("com.apple.Maps.RequestResponse", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v6)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412546;
      v19 = 0;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, "Error for task %@ : %@", (uint8_t *)&v18, 0x16u);
    }
    _GEORequestResponseLogError((uint64_t)v15, 0, v6);
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "data");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "length");
      v18 = 138412546;
      v19 = 0;
      v20 = 1024;
      LODWORD(v21) = v17;
      _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_INFO, "Response from task %@ - responseSize: %u", (uint8_t *)&v18, 0x12u);

    }
    _GEORequestResponseLogResponse(v15, 0, v5);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "_recordAnalyticsDataForResponse:", v5);
  objc_msgSend(WeakRetained[15], "taskFinished:", WeakRetained);

}

- (void)start
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  PBRequest *request;
  NSObject *v7;
  objc_class *v8;
  PBRequest *v9;
  void *v10;
  GEOTaskQueue *taskQueue;
  int v12;
  void *v13;
  __int16 v14;
  PBRequest *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  GEOGetOfflineRequesterLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    request = self->_request;
    v12 = 138412546;
    v13 = v5;
    v14 = 2048;
    v15 = request;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "Issuing request %@<%p>", (uint8_t *)&v12, 0x16u);

  }
  GEOFindOrCreateLog("com.apple.Maps.RequestResponse", -[NSString UTF8String](self->_debugRequestName, "UTF8String"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (PBRequest *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(0, "publicLogDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = 0;
    v14 = 2114;
    v15 = v9;
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_INFO, "Request with task %@, RequestType: %{public}@, dataRequest: %{public}@", (uint8_t *)&v12, 0x20u);

  }
  _GEORequestResponseLogRequest(v7, 0, 0, self->_request);

  taskQueue = self->_taskQueue;
  if (taskQueue)
    -[GEOTaskQueue addTask:](taskQueue, "addTask:", self);
  else
    -[GEOOfflineServiceRequesterOperation _start](self, "_start");
}

- (void)_start
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  +[GEOOfflineDataAccess sharedInstance](GEOOfflineDataAccess, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  offlineServiceQueue();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__GEOOfflineServiceRequesterOperation__start__block_invoke;
  v5[3] = &unk_1E1C02930;
  v5[4] = self;
  objc_msgSend(v3, "getFullyDownloadedRegionsWithCallbackQueue:callback:", v4, v5);

}

void __45__GEOOfflineServiceRequesterOperation__start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD **)(a1 + 32);
  if (v5 || !v6)
  {
    v8 = v7[5];
    if (v8)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __45__GEOOfflineServiceRequesterOperation__start__block_invoke_2;
      v9[3] = &unk_1E1C21888;
      v9[4] = v7;
      v10 = v5;
      (*(void (**)(uint64_t, _QWORD *))(v8 + 16))(v8, v9);

    }
    else
    {
      objc_msgSend(v7, "_processRequestWithAvailableRegions:requestToSend:", v5, v7[3]);
    }
  }
  else
  {
    (*(void (**)(void))(v7[7] + 16))();
  }

}

void __45__GEOOfflineServiceRequesterOperation__start__block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v4 = a2;
  if (!a2)
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v5 = v4;
  v6 = a2;
  offlineServiceQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__GEOOfflineServiceRequesterOperation__start__block_invoke_3;
  block[3] = &unk_1E1C01790;
  v8 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v11 = v8;
  v12 = v5;
  v9 = v5;
  dispatch_async(v7, block);

}

uint64_t __45__GEOOfflineServiceRequesterOperation__start__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processRequestWithAvailableRegions:requestToSend:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_processRequestWithAvailableRegions:(id)a3 requestToSend:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void (**completionHandler)(id, _QWORD, void *);
  void *v10;
  GEOPBOfflineRequestMetadata *v11;
  GEOPBOfflineRequestMetadata *requestMetadata;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  int type;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  GEOOfflineServiceRequest *v25;
  NSUInteger v26;
  NSObject *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  id v32;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  _QWORD v48[5];
  id v49;
  uint64_t v50;
  id v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  GEOOfflineServiceRequest *v55;
  _QWORD v56[5];
  _QWORD v57[7];

  v57[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  offlineServiceQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (!self->_canceled)
  {
    v11 = objc_alloc_init(GEOPBOfflineRequestMetadata);
    requestMetadata = self->_requestMetadata;
    self->_requestMetadata = v11;

    do
      v13 = __ldaxr((unsigned int *)&_requestCounter);
    while (__stlxr(v13 + 1, (unsigned int *)&_requestCounter));
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@<%p>:%u"), v16, self->_request, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPBOfflineRequestMetadata setRequestIdentifier:](self->_requestMetadata, "setRequestIdentifier:", v17);

    if (GEOConfigGetBOOL(GeoOfflineConfig_DebugLogsEnabled, (uint64_t)off_1EDF4E8C8))
      -[GEOPBOfflineRequestMetadata setDebugLog:](self->_requestMetadata, "setDebugLog:", 1);
    v18 = (void *)objc_msgSend(v6, "mutableCopy");
    -[GEOPBOfflineRequestMetadata setDownloadedRegions:](self->_requestMetadata, "setDownloadedRegions:", v18);

    type = self->_dataRequestKind.type;
    if (type > 767)
    {
      v20 = 1;
      if (type != 768 && type != 1792)
      {
        if (type != 2857)
          goto LABEL_19;
        v20 = 5;
      }
    }
    else
    {
      switch(type)
      {
        case 512:
          v20 = 2;
          break;
        case 672:
          v20 = 3;
          break;
        case 673:
          v20 = 4;
          break;
        default:
          goto LABEL_19;
      }
    }
    -[GEOPBOfflineRequestMetadata setMessageType:](self->_requestMetadata, "setMessageType:", v20);
LABEL_19:
    if (!-[GEOPBOfflineRequestMetadata hasMessageType](self->_requestMetadata, "hasMessageType"))
    {
      v31 = (void *)MEMORY[0x1E0CB35C8];
      v32 = (id)*MEMORY[0x1E0C9AFA8];
      v57[0] = CFSTR("Offline request not implemented (yet?)");
      v56[0] = v32;
      v56[1] = CFSTR("GEORequestClass");
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v57[1] = v34;
      v56[2] = CFSTR("GEODataRequestKind");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (self->_dataRequestKind.subtype.raw | self->_dataRequestKind.type));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v57[2] = v35;
      v56[3] = CFSTR("GEODataRequestKindString");
      GEODataRequestKindAsString(*(_QWORD *)&self->_dataRequestKind);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v57[3] = v36;
      v56[4] = CFSTR("GEOServiceRequestConfiguring");
      -[GEOServiceRequestConfiguring description](self->_config, "description");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v57[4] = v37;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 5);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "GEOErrorWithCode:userInfo:", -10, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(void))self->_completionHandler + 2))();
      -[GEOOfflineServiceRequesterOperation _cleanup](self, "_cleanup");

      goto LABEL_39;
    }
    +[GEORequestCounter sharedCounter](GEORequestCounter, "sharedCounter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "requestCounterTicketForType:auditToken:traits:", -[GEOServiceRequestConfiguring dataRequestKindForRequest:traits:](self->_config, "dataRequestKindForRequest:traits:", self->_request, self->_traits), self->_auditToken, self->_traits);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "startingRequestWithExplicitInterfaces:", 256);
    v51 = 0;
    -[GEOOfflineServiceRequesterOperation validateRequest:withAvailableRegions:returningResponseOrError:](self, "validateRequest:withAvailableRegions:returningResponseOrError:", v7, v6, &v51);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v51;
    if (!(v23 | (unint64_t)v24))
    {
      v25 = -[GEOOfflineServiceRequest initWithTraits:auditToken:throttleToken:]([GEOOfflineServiceRequest alloc], "initWithTraits:auditToken:throttleToken:", self->_traits, self->_auditToken, self->_throttleToken);
      objc_msgSend(v7, "data");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOOfflineServiceRequest setRequest:](v25, "setRequest:", v40);

      -[GEOPBOfflineRequestMetadata data](self->_requestMetadata, "data");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOOfflineServiceRequest setRequestMetadata:](v25, "setRequestMetadata:", v41);

      -[GEOOfflineServiceRequest request](v25, "request");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "length");
      -[GEOOfflineServiceRequest requestMetadata](v25, "requestMetadata");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "length") + v43;

      offlineServiceConnection();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      offlineServiceQueue();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __89__GEOOfflineServiceRequesterOperation__processRequestWithAvailableRegions_requestToSend___block_invoke;
      v48[3] = &unk_1E1C218B0;
      v48[4] = self;
      v49 = v22;
      v50 = v45;
      -[GEOXPCRequest send:withReply:handler:](v25, "send:withReply:handler:", v46, v47, v48);

LABEL_38:
      goto LABEL_39;
    }
    v25 = (GEOOfflineServiceRequest *)v24;
    v26 = -[NSString length](self->_debugRequestName, "length");
    if (v23)
    {
      if (v26)
      {
        GEOFindOrCreateLog("com.apple.Maps.RequestResponse", -[NSString UTF8String](self->_debugRequestName, "UTF8String"));
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          objc_msgSend((id)v23, "data");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "length");
          *(_DWORD *)buf = 138412546;
          v53 = 0;
          v54 = 1024;
          LODWORD(v55) = v29;
          _os_log_impl(&dword_1885A9000, v27, OS_LOG_TYPE_INFO, "Response from task %@ - responseSize: %u", buf, 0x12u);

        }
        _GEORequestResponseLogResponse(v27, 0, (void *)v23);

      }
      (*((void (**)(void))self->_validationHandler + 2))();
      v30 = objc_claimAutoreleasedReturnValue();

      if (!v30)
      {
        v25 = 0;
        goto LABEL_37;
      }
      v25 = (GEOOfflineServiceRequest *)v30;
    }
    else
    {
      if (!v26)
      {
LABEL_35:
        v23 = 0;
LABEL_37:
        objc_msgSend(v22, "explicitInterfaceRequestCompleted:xmitBytes:recvBytes:", v25, 0, 0);
        -[GEOOfflineServiceRequesterOperation _requestCompletedWithResponse:error:](self, "_requestCompletedWithResponse:error:", v23, v25);

        goto LABEL_38;
      }
      GEOFindOrCreateLog("com.apple.Maps.RequestResponse", -[NSString UTF8String](self->_debugRequestName, "UTF8String"));
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v53 = 0;
        v54 = 2112;
        v55 = v25;
        _os_log_impl(&dword_1885A9000, (os_log_t)v23, OS_LOG_TYPE_ERROR, "Error for task %@ : %@", buf, 0x16u);
      }
      _GEORequestResponseLogError(v23, 0, v25);
    }

    goto LABEL_35;
  }
  completionHandler = (void (**)(id, _QWORD, void *))self->_completionHandler;
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  completionHandler[2](completionHandler, 0, v10);

  -[GEOOfflineServiceRequesterOperation _cleanup](self, "_cleanup");
LABEL_39:

}

void __89__GEOOfflineServiceRequesterOperation__processRequestWithAvailableRegions_requestToSend___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "response");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  objc_msgSend(v5, "responseMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length") + v8;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "explicitInterfaceRequestCompleted:xmitBytes:recvBytes:", v11, *(_QWORD *)(a1 + 48), v10);
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "_cleanup");

    v12 = v6;
    goto LABEL_34;
  }
  if (!v6)
  {
    objc_msgSend(v5, "error");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "response");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (!v14)
  {
    if (!v6)
    {
      v17 = 0;
      goto LABEL_27;
    }
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "length"))
    {
      GEOFindOrCreateLog("com.apple.Maps.RequestResponse", (const char *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "UTF8String"));
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v29 = 138412546;
        v30 = 0;
        v31 = 2112;
        v32 = v6;
        _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_ERROR, "Error for task %@ : %@", (uint8_t *)&v29, 0x16u);
      }
      _GEORequestResponseLogError((uint64_t)v21, 0, v6);

    }
    v17 = 0;
LABEL_20:
    v12 = v6;
    goto LABEL_28;
  }
  v15 = *(void **)(a1 + 32);
  objc_msgSend(v5, "response");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "parseResponse:ofType:", v16, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "responseClass"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "length"))
    {
      GEOFindOrCreateLog("com.apple.Maps.RequestResponse", (const char *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "UTF8String"));
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v29 = 138412546;
        v30 = 0;
        v31 = 2112;
        v32 = v12;
        _os_log_impl(&dword_1885A9000, v22, OS_LOG_TYPE_ERROR, "Error for task %@ : %@", (uint8_t *)&v29, 0x16u);
      }
      _GEORequestResponseLogError((uint64_t)v22, 0, v12);

    }
    v17 = 0;
    goto LABEL_28;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "length"))
  {
    GEOFindOrCreateLog("com.apple.Maps.RequestResponse", (const char *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "UTF8String"));
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v17, "data");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138412546;
      v30 = 0;
      v31 = 1024;
      LODWORD(v32) = objc_msgSend(v19, "length");
      _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_INFO, "Response from task %@ - responseSize: %u", (uint8_t *)&v29, 0x12u);

    }
    _GEORequestResponseLogResponse(v18, 0, v17);

  }
  if (v6)
    goto LABEL_20;
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (!v20)
  {
LABEL_27:
    v12 = 0;
    goto LABEL_28;
  }
  (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:
  objc_msgSend(v5, "responseMetadata");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  if (v24)
  {
    v25 = *(void **)(a1 + 32);
    objc_msgSend(v5, "responseMetadata");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "parseResponse:ofType:", v26, objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    GEOGetOfflineRequesterLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v29 = 138412290;
      v30 = v27;
      _os_log_impl(&dword_1885A9000, v28, OS_LOG_TYPE_DEBUG, "Got response metadata: %@", (uint8_t *)&v29, 0xCu);
    }

  }
  else
  {
    v27 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "explicitInterfaceRequestCompleted:xmitBytes:recvBytes:", v12, *(_QWORD *)(a1 + 48), v10);
  objc_msgSend(*(id *)(a1 + 32), "_requestCompletedWithResponse:error:", v17, v12);

LABEL_34:
}

- (void)_requestCompletedWithResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void (*v8)(void);
  void *v9;
  NSObject *v10;
  void *v11;
  double Double;
  void *global_queue;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void (*)(void))*((_QWORD *)self->_completionHandler + 2);
LABEL_8:
    v8();
    goto LABEL_9;
  }
  if (-[GEOMapServiceTraits requestMode](self->_traits, "requestMode") != 1)
  {
    v8 = (void (*)(void))*((_QWORD *)self->_completionHandler + 2);
    goto LABEL_8;
  }
  -[GEOApplicationAuditToken offlineCohortId](self->_auditToken, "offlineCohortId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  GEOGetOfflineRequesterLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v9;
    _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_INFO, "ONLINE_OFFLINE_FAILOVER request succeeded offline. Waiting for cohort %{public}@ to enter offline mode...", buf, 0xCu);
  }

  +[GEOOfflineStateManager shared](GEOOfflineStateManager, "shared");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  Double = GEOConfigGetDouble(GeoOfflineConfig_OnlineOfflineFailoverTimeout, (uint64_t)off_1EDF4EB38);
  qos_class_self();
  global_queue = (void *)geo_get_global_queue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__GEOOfflineServiceRequesterOperation__requestCompletedWithResponse_error___block_invoke_30;
  v15[3] = &unk_1E1C218F8;
  objc_copyWeak(&v19, &location);
  v14 = v9;
  v16 = v14;
  v17 = v6;
  v18 = 0;
  objc_msgSend(v11, "waitForTransitionToActiveState:forCohortId:timeout:callbackQueue:callback:", &__block_literal_global_212, v14, global_queue, v15, Double);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

LABEL_9:
}

BOOL __75__GEOOfflineServiceRequesterOperation__requestCompletedWithResponse_error___block_invoke(uint64_t a1, int a2)
{
  int v3;
  _BOOL8 result;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a2 < 2u)
    return 0;
  if (a2 == 2)
  {
    if (BYTE2(a2) == 1)
      return 1;
    GEOGetOfflineRequesterLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      GEOOfflineStateAsString(a2 & 0xFF00FFFF | (BYTE2(a2) << 16));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_FAULT, "Waiting to transition to Offline:?:Local but got: %{public}@", (uint8_t *)&v7, 0xCu);

    }
    return 0;
  }
  result = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
  if (result)
  {
    v7 = 67109120;
    LODWORD(v8) = v3;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", (uint8_t *)&v7, 8u);
    return 0;
  }
  return result;
}

void __75__GEOOfflineServiceRequesterOperation__requestCompletedWithResponse_error___block_invoke_30(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained && !*((_BYTE *)WeakRetained + 16))
  {
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x18D765024](*((_QWORD *)WeakRetained + 7));
    if (v6)
    {
      GEOGetOfflineRequesterLog();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
      if (a2)
      {
        if (v8)
        {
          v9 = *(_QWORD *)(a1 + 32);
          v12 = 138543362;
          v13 = v9;
        }

        v6[2](v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      }
      else
      {
        if (v8)
        {
          v10 = *(_QWORD *)(a1 + 32);
          v12 = 138543362;
          v13 = v10;
          _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_INFO, "Timed out waiting for cohort '%{public}@' failed to transition to offline mode. Returning error.", (uint8_t *)&v12, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v6)[2](v6, 0, v11);

      }
    }

  }
}

- (id)parseResponse:(id)a3 ofType:(Class)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  Class v22;
  __int16 v23;
  int v24;
  __int16 v25;
  $7466BF22B2A7275A1F5DB80FF4552E0B *p_dataRequestKind;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v6);
  if (!objc_msgSend(v6, "length") || (-[objc_class isValid:](a4, "isValid:", v7) & 1) == 0)
  {
    GEOGetOfflineRequesterLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v22 = a4;
      v23 = 1040;
      v24 = 8;
      v25 = 2098;
      p_dataRequestKind = &self->_dataRequestKind;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_FAULT, "Failed to decode protobuf response of type %@ for %{public, geo:DataRequestKind}.*P", buf, 0x1Cu);
    }
    v8 = 0;
    goto LABEL_15;
  }
  v8 = objc_alloc_init(a4);
  objc_msgSend(v8, "readFrom:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v8, "mapsResults", 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "place");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "forceUncacheable");

        }
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }
LABEL_15:

  }
  return v8;
}

- (id)validateRequest:(id)a3 withAvailableRegions:(id)a4 returningResponseOrError:(id *)a5
{
  if (a5)
    *a5 = 0;
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[GEOOfflineServiceRequesterOperation _cleanup](self, "_cleanup");
  v3.receiver = self;
  v3.super_class = (Class)GEOOfflineServiceRequesterOperation;
  -[GEOOfflineServiceRequesterOperation dealloc](&v3, sel_dealloc);
}

- (void)_cleanup
{
  id completionHandler;

  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

}

- (void)cancel
{
  NSObject *v3;
  _QWORD block[5];

  offlineServiceQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__GEOOfflineServiceRequesterOperation_cancel__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __45__GEOOfflineServiceRequesterOperation_cancel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  GEOOfflineServiceRequestCancel *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 120);
  if (v3)
  {
    v4 = objc_msgSend(v3, "removeTaskIfPending:");
    v2 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v4 = 0;
  }
  if (*(_QWORD *)(v2 + 112))
  {
    v5 = -[GEOOfflineServiceRequestCancel initWithTraits:auditToken:throttleToken:]([GEOOfflineServiceRequestCancel alloc], "initWithTraits:auditToken:throttleToken:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOOfflineServiceRequestCancel setRequestMetadata:](v5, "setRequestMetadata:", v6);

    offlineServiceConnection();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOXPCRequest send:](v5, "send:", v7);

    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v2 + 16) = 1;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "length"))
  {
    GEOFindOrCreateLog("com.apple.Maps.RequestResponse", (const char *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "UTF8String"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = 0;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_INFO, "Canceled for task %@", (uint8_t *)&v11, 0xCu);
    }
    _GEORequestResponseLogError((uint64_t)v8, 0, 0);

  }
  if (v4)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

    objc_msgSend(*(id *)(a1 + 32), "_cleanup");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_requestMetadata, 0);
  objc_storeStrong((id *)&self->_throttleToken, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_validationHandler, 0);
  objc_storeStrong(&self->_willSendRequestHandler, 0);
  objc_storeStrong((id *)&self->_debugRequestName, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end

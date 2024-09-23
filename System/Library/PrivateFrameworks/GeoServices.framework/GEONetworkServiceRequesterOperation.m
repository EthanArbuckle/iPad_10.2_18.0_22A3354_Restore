@implementation GEONetworkServiceRequesterOperation

- (void)dealloc
{
  objc_super v3;

  -[GEONetworkServiceRequesterOperation _cleanup](self, "_cleanup");
  v3.receiver = self;
  v3.super_class = (Class)GEONetworkServiceRequesterOperation;
  -[GEONetworkServiceRequesterOperation dealloc](&v3, sel_dealloc);
}

- (void)protobufSession:(id)a3 didCompleteTask:(id)a4
{
  id v5;
  void (**completionHandler)(id, _QWORD, void *);
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void (**v17)(id, void *, void *);
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(v5, "completedAsCancelled"))
  {
    completionHandler = (void (**)(id, _QWORD, void *))self->_completionHandler;
    if (completionHandler)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      completionHandler[2](completionHandler, 0, v7);
LABEL_15:

    }
  }
  else
  {
    if (-[NSString length](self->_debugRequestName, "length"))
    {
      objc_msgSend(v5, "response");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        GEOFindOrCreateLog("com.apple.Maps.RequestResponse", -[NSString UTF8String](self->_debugRequestName, "UTF8String"));
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v5, "response");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "data");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138412546;
          v20 = v5;
          v21 = 1024;
          LODWORD(v22) = objc_msgSend(v11, "length");
          _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_INFO, "Response from task %@ - responseSize: %u", (uint8_t *)&v19, 0x12u);

        }
        objc_msgSend(v5, "response");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        _GEORequestResponseLogResponse(v9, v5, v12);

      }
      objc_msgSend(v5, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        GEOFindOrCreateLog("com.apple.Maps.RequestResponse", -[NSString UTF8String](self->_debugRequestName, "UTF8String"));
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v5, "error");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138412546;
          v20 = v5;
          v21 = 2112;
          v22 = v15;
          _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_ERROR, "Error for task %@ : %@", (uint8_t *)&v19, 0x16u);

        }
        objc_msgSend(v5, "error");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _GEORequestResponseLogError((uint64_t)v14, v5, v16);

      }
    }
    -[GEONetworkServiceRequesterOperation _recordNetworkEventDataForTask](self, "_recordNetworkEventDataForTask");
    v17 = (void (**)(id, void *, void *))self->_completionHandler;
    if (v17)
    {
      objc_msgSend(v5, "response");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "error");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v17[2](v17, v7, v18);

      goto LABEL_15;
    }
  }
  -[GEONetworkServiceRequesterOperation _cleanup](self, "_cleanup");

}

- (void)_cleanup
{
  id completionHandler;
  GEOProtobufSessionTask *task;

  -[GEOProtobufSessionTask cancel](self->_task, "cancel");
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  task = self->_task;
  self->_task = 0;

}

- (void)_recordNetworkEventDataForTask
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSString *appIdentifier;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  id v13;

  -[GEOServiceRequestConfiguring serviceTypeNumber](self->_config, "serviceTypeNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[GEOServiceRequestConfiguring additionalStatesForNetworkEvent](self->_config, "additionalStatesForNetworkEvent");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GEOServiceRequestConfiguring usesBackgroundURL](self->_config, "usesBackgroundURL"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
    v5 = -[GEOServiceRequestConfiguring dataRequestKindForRequest:traits:](self->_config, "dataRequestKindForRequest:traits:", self->_request, self->_traits);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = -[GEOServiceRequestConfiguring analyticNetworkServiceTypeForRequest:traits:](self->_config, "analyticNetworkServiceTypeForRequest:traits:", self->_request, self->_traits);
      appIdentifier = self->_appIdentifier;
      -[GEOMapServiceTraits appMajorVersion](self->_traits, "appMajorVersion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOMapServiceTraits appMinorVersion](self->_traits, "appMinorVersion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOProtobufSessionTask error](self->_task, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOProtobufSessionTask clientMetrics](self->_task, "clientMetrics");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[GEONetworkEventDataRecorder recordNetworkEventDataForDataRequestKind:networkService:usedBackgroundURL:requestAppIdentifier:appMajorVersion:appMinorVersion:error:clientMetrics:additionalStates:](GEONetworkEventDataRecorder, "recordNetworkEventDataForDataRequestKind:networkService:usedBackgroundURL:requestAppIdentifier:appMajorVersion:appMinorVersion:error:clientMetrics:additionalStates:", v5, v6, v4, appIdentifier, v8, v9, v10, v11, v13);
    }
    else
    {
      v12 = self->_appIdentifier;
      -[GEOMapServiceTraits appMajorVersion](self->_traits, "appMajorVersion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOMapServiceTraits appMinorVersion](self->_traits, "appMinorVersion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOProtobufSessionTask error](self->_task, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOProtobufSessionTask clientMetrics](self->_task, "clientMetrics");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[GEONetworkEventDataRecorder recordNetworkEventDataForDataRequestKind:usedBackgroundURL:requestAppIdentifier:appMajorVersion:appMinorVersion:error:clientMetrics:additionalStates:](GEONetworkEventDataRecorder, "recordNetworkEventDataForDataRequestKind:usedBackgroundURL:requestAppIdentifier:appMajorVersion:appMinorVersion:error:clientMetrics:additionalStates:", v5, v4, v12, v8, v9, v10, v11, v13);
    }

  }
}

- (GEONetworkServiceRequesterOperation)initWithRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 config:(id)a6 throttleToken:(id)a7 options:(unint64_t)a8 willSendRequestHandler:(id)a9 validationHandler:(id)a10 completionHandler:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  double v21;
  double v22;
  uint64_t v23;
  GEONetworkServiceRequesterOperation *v24;
  void *v25;
  uint64_t v26;
  NSString *debugRequestName;
  void *v28;
  uint64_t v29;
  NSString *appIdentifier;
  uint64_t v31;
  id willSendRequestHandler;
  uint64_t v33;
  id validationHandler;
  uint64_t v35;
  id completionHandler;
  GEONetworkServiceRequesterOperation *v37;
  void *v39;
  id obj;
  id v42;
  id v43;
  id v44;
  id v45;
  objc_super v46;

  v44 = a3;
  v45 = a4;
  v43 = a5;
  v17 = a6;
  obj = a7;
  v18 = a7;
  v19 = a9;
  v42 = a10;
  v20 = a11;
  v21 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v17, "timeout");
    v21 = v22;
  }
  v23 = objc_msgSend(v17, "dataRequestKindForRequest:traits:", v44, v45);
  if ((_DWORD)v23)
  {
    v46.receiver = self;
    v46.super_class = (Class)GEONetworkServiceRequesterOperation;
    v24 = -[GEONetworkServiceRequesterOperation init](&v46, sel_init);
    if (v24)
    {
      v39 = v20;
      objc_msgSend(v17, "debugRequestName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "copy");
      debugRequestName = v24->_debugRequestName;
      v24->_debugRequestName = (NSString *)v26;

      objc_msgSend(v43, "bundleId");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "length"))
        objc_msgSend(v43, "bundleId");
      else
        objc_msgSend(v45, "appIdentifier");
      v29 = objc_claimAutoreleasedReturnValue();
      appIdentifier = v24->_appIdentifier;
      v24->_appIdentifier = (NSString *)v29;

      objc_storeStrong((id *)&v24->_request, a3);
      objc_storeStrong((id *)&v24->_auditToken, a5);
      v24->_timeout = v21;
      v24->_dataRequestKind = ($7466BF22B2A7275A1F5DB80FF4552E0B)v23;
      objc_storeStrong((id *)&v24->_traits, a4);
      objc_storeStrong((id *)&v24->_config, a6);
      objc_storeStrong((id *)&v24->_throttleToken, obj);
      v24->_requestOptions = a8;
      v31 = objc_msgSend(v19, "copy");
      willSendRequestHandler = v24->_willSendRequestHandler;
      v24->_willSendRequestHandler = (id)v31;

      v33 = objc_msgSend(v42, "copy");
      validationHandler = v24->_validationHandler;
      v24->_validationHandler = (id)v33;

      v20 = v39;
      v35 = objc_msgSend(v39, "copy");
      completionHandler = v24->_completionHandler;
      v24->_completionHandler = (id)v35;

    }
    self = v24;
    v37 = self;
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (id)protobufSession:(id)a3 validateResponse:(id)a4
{
  return (id)(*((uint64_t (**)(void))self->_validationHandler + 2))();
}

- (id)_fullURL
{
  NSURL *url;
  NSURL *v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSURL *v16;
  NSURL *v17;

  url = self->_url;
  if (url)
  {
    v3 = url;
  }
  else
  {
    GEOGetURLWithSource(-[GEOServiceRequestConfiguring urlType](self->_config, "urlType"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v5, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOServiceRequestConfiguring additionalURLQueryItems](self->_config, "additionalURLQueryItems");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (v8)
      {
        -[GEOServiceRequestConfiguring additionalURLQueryItems](self->_config, "additionalURLQueryItems");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v9, "mutableCopy");

        objc_msgSend(v6, "queryItems");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        if (v12)
        {
          objc_msgSend(v6, "queryItems");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObjectsFromArray:", v13);

        }
        objc_msgSend(v6, "setQueryItems:", v10);

      }
      v14 = -[GEOServiceRequestConfiguring dataRequestKindForRequest:traits:](self->_config, "dataRequestKindForRequest:traits:", self->_request, self->_traits);
      +[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "updateURLComponents:forRequestKind:", v6, v14);

      objc_msgSend(v6, "URL");
      v16 = (NSURL *)objc_claimAutoreleasedReturnValue();
      v17 = self->_url;
      self->_url = v16;

      v3 = self->_url;
    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

void __44__GEONetworkServiceRequesterOperation_start__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  GEODataRequest *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  GEODataRequest *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[16])
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = *(_BYTE **)(a1 + 32);
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v2, "_fullURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (v3)
    {
LABEL_6:
      objc_msgSend(*(id *)(a1 + 40), "requestCompleted:", v3);
      v5 = *(_QWORD **)(a1 + 32);
      v6 = v5[7];
      if (v6)
      {
        (*(void (**)(_QWORD, _QWORD, void *))(v6 + 16))(v5[7], 0, v3);
        v5 = *(_QWORD **)(a1 + 32);
      }
      objc_msgSend(v5, "_cleanup");
      goto LABEL_27;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -4);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
    if (v7)
      goto LABEL_6;
  }
  v8 = GEOURLNeedsAuthForURLType(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "urlType"));
  if (GEOURLSupportsMPTCP(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "urlType"))
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v38 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "multipathServiceType");
  }
  else
  {
    v38 = 0;
  }
  v9 = (_QWORD *)(a1 + 32);
  if (v8)
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) | 8;
  else
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
  v11 = [GEODataRequest alloc];
  v12 = *v9;
  v13 = *(_QWORD *)(*v9 + 24);
  objc_msgSend(*(id *)(*v9 + 72), "additionalHTTPHeaders");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v4;
  v15 = (uint64_t *)(v12 + 96);
  v16 = *(_QWORD *)(*v9 + 88);
  v17 = *(double *)(*v9 + 112);
  v18 = *(_QWORD *)(*v9 + 104);
  v19 = *(_QWORD *)(a1 + 40);
  v20 = GEOURLMultipathAlternatePort(objc_msgSend(*(id *)(*v9 + 72), "urlType"));
  v21 = *v15;
  v4 = v39;
  v22 = -[GEODataRequest initWithKind:protobufRequest:URL:additionalHTTPHeaders:auditToken:timeoutInterval:traits:requestCounterTicket:multipathServiceType:multipathAlternatePort:throttleToken:options:](v11, "initWithKind:protobufRequest:URL:additionalHTTPHeaders:auditToken:timeoutInterval:traits:requestCounterTicket:multipathServiceType:multipathAlternatePort:throttleToken:options:", v21, v13, v39, v14, v16, v18, v17, v19, v38, v20, *(_QWORD *)(*v9 + 120), v10);

  +[GEOProtobufSession sharedProtobufSession](GEOProtobufSession, "sharedProtobufSession");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOProtobufSession sharedDelegateQueue](GEOProtobufSession, "sharedDelegateQueue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "taskWithRequest:requestTypeCode:responseClass:delegate:delegateQueue:", v22, objc_msgSend(*(id *)(*v9 + 24), "requestTypeCode"), objc_msgSend(*(id *)(*v9 + 24), "responseClass"), *v9, v24);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = *(_QWORD *)(a1 + 32);
  v27 = *(void **)(v26 + 8);
  *(_QWORD *)(v26 + 8) = v25;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "length"))
  {
    GEOFindOrCreateLog("com.apple.Maps.RequestResponse", (const char *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "UTF8String"));
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEODataRequest publicLogDescription](v22, "publicLogDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v41 = v29;
      v42 = 2114;
      v43 = v31;
      v44 = 2114;
      v45 = v32;
      _os_log_impl(&dword_1885A9000, v28, OS_LOG_TYPE_INFO, "Request with task %@, RequestType: %{public}@, dataRequest: %{public}@", buf, 0x20u);

    }
    v33 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    -[GEODataRequest URL](v22, "URL");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    _GEORequestResponseLogRequest(v28, v33, v34, *(void **)(*(_QWORD *)(a1 + 32) + 24));

  }
  v35 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v35)
  {
    objc_msgSend(v35, "start");
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -13);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "requestCompleted:", v3);
    v36 = *(_QWORD **)(a1 + 32);
    v37 = v36[7];
    if (v37)
    {
      (*(void (**)(_QWORD, _QWORD, void *))(v37 + 16))(v36[7], 0, v3);
      v36 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v36, "_cleanup");
  }

LABEL_27:
}

- (void)protobufSession:(id)a3 willSendRequest:(id)a4 forTask:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  +[GEOProtobufSession sharedDelegateQueue](GEOProtobufSession, "sharedDelegateQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __97__GEONetworkServiceRequesterOperation_protobufSession_willSendRequest_forTask_completionHandler___block_invoke;
  v16[3] = &unk_1E1C064B8;
  v16[4] = self;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  dispatch_async(v12, v16);

}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  +[GEORequestCounter sharedCounter](GEORequestCounter, "sharedCounter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestCounterTicketForType:auditToken:traits:", -[GEOServiceRequestConfiguring dataRequestKindForRequest:traits:](self->_config, "dataRequestKindForRequest:traits:", self->_request, self->_traits), self->_auditToken, self->_traits);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[GEOProtobufSession sharedDelegateQueue](GEOProtobufSession, "sharedDelegateQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__GEONetworkServiceRequesterOperation_start__block_invoke;
  v7[3] = &unk_1E1C13D00;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  GEOWaitForURLsFromManifestAndThenOnQueue(v5, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttleToken, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_validationHandler, 0);
  objc_storeStrong(&self->_willSendRequestHandler, 0);
  objc_storeStrong((id *)&self->_debugRequestName, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

void __97__GEONetworkServiceRequesterOperation_protobufSession_willSendRequest_forTask_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (v2)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __97__GEONetworkServiceRequesterOperation_protobufSession_willSendRequest_forTask_completionHandler___block_invoke_2;
    v5[3] = &unk_1E1C13D28;
    v9 = *(id *)(a1 + 56);
    v3 = *(id *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 32);
    v6 = v3;
    v7 = v4;
    v8 = *(id *)(a1 + 48);
    (*(void (**)(uint64_t, _QWORD *))(v2 + 16))(v2, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (void)cancel
{
  GEOProtobufSessionTask *v3;
  NSObject *v4;
  int v5;
  GEOProtobufSessionTask *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  self->_canceled = 1;
  if (-[NSString length](self->_debugRequestName, "length"))
  {
    v3 = self->_task;
    GEOFindOrCreateLog("com.apple.Maps.RequestResponse", -[NSString UTF8String](self->_debugRequestName, "UTF8String"));
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_INFO, "Canceled for task %@", (uint8_t *)&v5, 0xCu);
    }
    _GEORequestResponseLogError((uint64_t)v4, v3, 0);

  }
  -[GEOProtobufSessionTask cancel](self->_task, "cancel");
}

void __97__GEONetworkServiceRequesterOperation_protobufSession_willSendRequest_forTask_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "updatedRequestWithNewProtobufRequest:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    GEOURLLogFacility(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "urlType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      GEOFindOrCreateLog("com.apple.Maps.RequestResponse", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = *(_QWORD *)(a1 + 48);
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "publicLogDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412802;
        v18 = v7;
        v19 = 2114;
        v20 = (uint64_t)v9;
        v21 = 2114;
        v22 = v10;
        _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_INFO, "Request with task %@, RequestType: %{public}@, dataRequest: %{public}@", (uint8_t *)&v17, 0x20u);

      }
      v11 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "_fullURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _GEORequestResponseLogRequest(v6, v11, v12, v3);

    }
    v13 = objc_retainAutorelease(v5);
    GEOFindOrCreateLog("com.apple.GeoServices", (const char *)objc_msgSend(v13, "UTF8String"));
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = *(_QWORD *)(a1 + 40);
      v16 = objc_opt_class();
      v17 = 134218498;
      v18 = v15;
      v19 = 2114;
      v20 = v16;
      v21 = 2048;
      v22 = v3;
      _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_INFO, "Sending request for task for provider %p with updated PB request <%{public}@: %p>.", (uint8_t *)&v17, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

@end

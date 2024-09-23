@implementation MADComputeService

- (MADComputeService)init
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v3)
    -[MADComputeService init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  return 0;
}

- (id)initInternal
{
  MADComputeService *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *connectionQueue;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *progressHandlerQueue;
  uint64_t v8;
  NSMutableDictionary *progressHandlers;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *resultsHandlerQueue;
  uint64_t v13;
  NSMutableDictionary *resultsHandlers;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MADComputeService;
  v2 = -[MADComputeService init](&v16, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("MAD.connectionQueue", 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("MAD.progressHandlerQueue", v5);
    progressHandlerQueue = v2->_progressHandlerQueue;
    v2->_progressHandlerQueue = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    progressHandlers = v2->_progressHandlers;
    v2->_progressHandlers = (NSMutableDictionary *)v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("MAD.resultsHandlerQueue", v10);
    resultsHandlerQueue = v2->_resultsHandlerQueue;
    v2->_resultsHandlerQueue = (OS_dispatch_queue *)v11;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    resultsHandlers = v2->_resultsHandlers;
    v2->_resultsHandlers = (NSMutableDictionary *)v13;

  }
  return v2;
}

+ (id)service
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initInternal");
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MADComputeService;
  -[MADComputeService dealloc](&v3, sel_dealloc);
}

+ (id)serviceName
{
  return CFSTR("com.apple.mediaanalysisd.computeservice");
}

+ (id)serverProtocol
{
  return &unk_1EFEB0858;
}

+ (id)allowedClasses
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[13];

  v6[12] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  v6[4] = objc_opt_class();
  v6[5] = objc_opt_class();
  v6[6] = objc_opt_class();
  v6[7] = objc_opt_class();
  v6[8] = objc_opt_class();
  v6[9] = objc_opt_class();
  v6[10] = objc_opt_class();
  v6[11] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)configureServerInterface:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(a1, "allowedClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_requestProcessing_assetURLs_extensionData_resultDirectoryURL_resultExtensionData_requestID_reply_, 0, 0);

  objc_msgSend(a1, "allowedClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_requestProcessing_assetURLs_extensionData_resultDirectoryURL_resultExtensionData_requestID_reply_, 1, 0);

  objc_msgSend(a1, "allowedClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_requestProcessing_localIdentifiers_photoLibraryURL_resultDirectoryURL_resultExtensionData_requestID_reply_, 0, 0);

  objc_msgSend(a1, "allowedClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_scheduleProcessing_assetURLs_extensionData_resultDirectoryURL_resultExtensionData_requestID_reply_, 0, 0);

  objc_msgSend(a1, "allowedClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_scheduleProcessing_assetURLs_extensionData_resultDirectoryURL_resultExtensionData_requestID_reply_, 1, 0);

  objc_msgSend(a1, "allowedClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_scheduleProcessing_localIdentifiers_photoLibraryURL_resultDirectoryURL_resultExtensionData_requestID_reply_, 0, 0);

}

+ (void)configureClientInterface:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "allowedClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_handleResults_assetRepresentation_requestID_error_acknowledgement_, 0, 0);

  objc_msgSend(a1, "allowedClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_handleResults_assetRepresentation_requestID_error_acknowledgement_, 1, 0);

}

- (id)connection
{
  NSObject *connectionQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  connectionQueue = self->_connectionQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__MADComputeService_connection__block_invoke;
  v5[3] = &unk_1E97E24A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(connectionQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __31__MADComputeService_connection__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  MADComputeServiceProxy *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3B38]);
    objc_msgSend((id)objc_opt_class(), "serviceName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithMachServiceName:options:", v4, 0);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = v5;

    v8 = -[MADComputeServiceProxy initWithCoordinator:]([MADComputeServiceProxy alloc], "initWithCoordinator:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setExportedObject:", v8);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFEAD410);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setExportedInterface:", v9);

    v10 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "exportedInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configureClientInterface:", v11);

    v12 = (void *)MEMORY[0x1E0CB3B50];
    objc_msgSend((id)objc_opt_class(), "serverProtocol");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "interfaceWithProtocol:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "configureServerInterface:", v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setRemoteObjectInterface:", v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setInterruptionHandler:", &__block_literal_global_1);
    objc_initWeak(&location, *(id *)(a1 + 32));
    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __31__MADComputeService_connection__block_invoke_60;
    v19 = &unk_1E97E2480;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v15, "setInvalidationHandler:", &v16);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resume", v16, v17, v18, v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void __31__MADComputeService_connection__block_invoke_2()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    __31__MADComputeService_connection__block_invoke_2_cold_1();
}

void __31__MADComputeService_connection__block_invoke_60(uint64_t a1)
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject **WeakRetained;
  NSObject **v11;
  NSObject *v12;
  _QWORD block[5];

  v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v2)
    __31__MADComputeService_connection__block_invoke_60_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    v12 = WeakRetained[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __31__MADComputeService_connection__block_invoke_61;
    block[3] = &unk_1E97E2458;
    block[4] = v11;
    dispatch_async(v12, block);
  }

}

void __31__MADComputeService_connection__block_invoke_61(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;

}

- (id)performRequests:(id)a3 assetURLs:(id)a4 options:(id)a5 progressHandler:(id)a6 resultsHandler:(id)a7 completionHandler:(id)a8
{
  void (**v13)(id, _QWORD, void *);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void (**v45)(id, _QWORD, void *);
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  MADComputeService *v54;
  id v55;
  void (**v56)(id, _QWORD, void *);
  _QWORD v57[5];
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint8_t buf[4];
  uint64_t v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v50 = a3;
  v51 = a4;
  v49 = a6;
  v48 = a7;
  v13 = (void (**)(id, _QWORD, void *))a8;
  v14 = (void *)MEMORY[0x1E0CB3940];
  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "hash"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("OnDemand-%@"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request: %@ %@ with assets %@"), v19, v50, v51);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v70 = v20;
    _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MADComputeService] %@", buf, 0xCu);
  }
  v61 = 0;
  v62 = 0;
  v47 = (void *)v20;
  -[MADComputeService extensionDataForResultDirectoryURL:error:](self, "extensionDataForResultDirectoryURL:error:", &v62, &v61);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v62;
  v23 = v61;
  v24 = v23;
  if (v21 && v22)
  {
    v60 = v23;
    -[MADComputeService extensionDataFromAssetURLs:error:](self, "extensionDataFromAssetURLs:error:", v51, &v60);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v60;

    if (!objc_msgSend(v25, "count"))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:].cold.1();
      v32 = (void *)objc_msgSend(v26, "copy");
      v13[2](v13, 0, v32);

      goto LABEL_20;
    }
    v27 = -[MADComputeService registerProgressHandler:requestID:](self, "registerProgressHandler:requestID:", v49, v19);
    if ((_DWORD)v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MADComputeService] Failed to register progressHandler (%d)"), v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:].cold.2();
      v67 = *MEMORY[0x1E0CB2D50];
      v68 = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], (int)v27, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, 0, v30);

LABEL_20:
      v31 = 0;
      goto LABEL_21;
    }
    v33 = -[MADComputeService registerResultsHandler:requestID:](self, "registerResultsHandler:requestID:", v48, v19);
    if ((_DWORD)v33)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MADComputeService] Failed to register resultsHandler (%d)"), v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:].cold.2();
      v65 = *MEMORY[0x1E0CB2D50];
      v66 = v34;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], (int)v33, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, 0, v36);

      goto LABEL_20;
    }
    -[MADComputeService connection](self, "connection");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __104__MADComputeService_performRequests_assetURLs_options_progressHandler_resultsHandler_completionHandler___block_invoke;
    v57[3] = &unk_1E97E2AC0;
    v57[4] = self;
    v31 = v19;
    v58 = v31;
    v45 = v13;
    v59 = v45;
    objc_msgSend(v38, "remoteObjectProxyWithErrorHandler:", v57);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __104__MADComputeService_performRequests_assetURLs_options_progressHandler_resultsHandler_completionHandler___block_invoke_72;
      v52[3] = &unk_1E97E2AE8;
      v53 = v47;
      v54 = self;
      v39 = v31;
      v55 = v39;
      v56 = v45;
      objc_msgSend(v46, "requestProcessing:assetURLs:extensionData:resultDirectoryURL:resultExtensionData:requestID:reply:", v50, v51, v25, v22, v21, v39, v52);

      v40 = v39;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MADComputeService] Failed to connect to analysis service during %s"), "-[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:]");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:].cold.2();
      v63 = *MEMORY[0x1E0CB2D50];
      v64 = v44;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADComputeService deregisterProgressHandlerForRequestID:](self, "deregisterProgressHandlerForRequestID:", v31);
      -[MADComputeService deregisterResultsHandlerForRequestID:](self, "deregisterResultsHandlerForRequestID:", v31);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, id, void *))v45)[2](v45, v31, v42);

      v43 = v31;
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:].cold.5();
    v25 = (void *)objc_msgSend(v24, "copy");
    v31 = 0;
    v13[2](v13, 0, v25);
    v26 = v24;
  }
LABEL_21:

  return v31;
}

void __104__MADComputeService_performRequests_assetURLs_options_progressHandler_resultsHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __104__MADComputeService_performRequests_assetURLs_options_progressHandler_resultsHandler_completionHandler___block_invoke_cold_1();
  objc_msgSend(*(id *)(a1 + 32), "deregisterProgressHandlerForRequestID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "deregisterResultsHandlerForRequestID:", *(_QWORD *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = (void *)objc_msgSend(v3, "copy");
  (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, v5, v6);

}

void __104__MADComputeService_performRequests_assetURLs_options_progressHandler_resultsHandler_completionHandler___block_invoke_72(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MADComputeService][Finish] %@", (uint8_t *)&v8, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "deregisterProgressHandlerForRequestID:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "deregisterResultsHandlerForRequestID:", *(_QWORD *)(a1 + 48));
  v6 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v7 = (void *)objc_msgSend(v3, "copy");
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, v6, v7);

}

- (id)performRequests:(id)a3 pixelBuffer:(__CVBuffer *)a4 options:(id)a5 progressHandler:(id)a6 resultsHandler:(id)a7 completionHandler:(id)a8
{
  void (**v8)(id, void *, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, void *, void *))a8;
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "hash"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("OnDemand-%@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MADComputeService] Unimplemented method %s"), "-[MADComputeService performRequests:pixelBuffer:options:progressHandler:resultsHandler:completionHandler:]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:].cold.2();
  v19 = *MEMORY[0x1E0CB2D50];
  v20[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v14, v17);

  return 0;
}

- (id)scheduleRequests:(id)a3 assetURLs:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  const __CFString *v33;
  id v34;
  uint64_t *v35;
  id *v36;
  _QWORD v37[4];
  __CFString *v38;
  uint64_t *v39;
  id *v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  void *v51;
  uint8_t buf[4];
  const __CFString *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v9 = a4;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__0;
  v48 = __Block_byref_object_dispose__0;
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "hash"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("Offline-%@"), v14);
  v49 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Schedule: %@ %@ with assets %@"), v45[5], v31, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v53 = CFSTR("[MADComputeService]");
    v54 = 2112;
    v55 = v15;
    _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@[Start] %@", buf, 0x16u);
  }
  v42 = 0;
  v43 = 0;
  -[MADComputeService extensionDataForResultDirectoryURL:error:](self, "extensionDataForResultDirectoryURL:error:", &v43, &v42);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v43;
  v18 = v42;
  v19 = v18;
  if (v16 && v17)
  {
    v41 = v18;
    -[MADComputeService extensionDataFromAssetURLs:error:](self, "extensionDataFromAssetURLs:error:", v9, &v41);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v41;

    if (objc_msgSend(v30, "count"))
    {
      -[MADComputeService connection](self, "connection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = MEMORY[0x1E0C809B0];
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __62__MADComputeService_scheduleRequests_assetURLs_options_error___block_invoke;
      v37[3] = &unk_1E97E2B10;
      v38 = CFSTR("[MADComputeService]");
      v39 = &v44;
      v40 = a6;
      objc_msgSend(v20, "synchronousRemoteObjectProxyWithErrorHandler:", v37);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v23 = v45[5];
        v32[0] = v21;
        v32[1] = 3221225472;
        v32[2] = __62__MADComputeService_scheduleRequests_assetURLs_options_error___block_invoke_83;
        v32[3] = &unk_1E97E2B38;
        v33 = CFSTR("[MADComputeService]");
        v34 = v15;
        v35 = &v44;
        v36 = a6;
        objc_msgSend(v22, "scheduleProcessing:assetURLs:extensionData:resultDirectoryURL:resultExtensionData:requestID:reply:", v31, v9, v30, v17, v16, v23, v32);

        v24 = (void *)v33;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Failed to connect to compute service"), CFSTR("[MADComputeService]"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:].cold.2();
        if (a6)
        {
          v50 = *MEMORY[0x1E0CB2D50];
          v51 = v24;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v26);
          *a6 = (id)objc_claimAutoreleasedReturnValue();

        }
        v27 = (void *)v45[5];
        v45[5] = 0;

      }
      v25 = (id)v45[5];

    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[MADComputeService scheduleRequests:assetURLs:options:error:].cold.1();
      v25 = 0;
      if (a6)
        *a6 = (id)objc_msgSend(v29, "copy");
    }

    v19 = v29;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[MADComputeService scheduleRequests:assetURLs:options:error:].cold.3();
    v25 = 0;
    if (a6)
      *a6 = (id)objc_msgSend(v19, "copy");
  }

  _Block_object_dispose(&v44, 8);
  return v25;
}

void __62__MADComputeService_scheduleRequests_assetURLs_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __62__MADComputeService_scheduleRequests_assetURLs_options_error___block_invoke_cold_1();
  if (*(_QWORD *)(a1 + 48))
    **(_QWORD **)(a1 + 48) = (id)objc_msgSend(v3, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

void __62__MADComputeService_scheduleRequests_assetURLs_options_error___block_invoke_83(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@[Finish] %@", (uint8_t *)&v10, 0x16u);
  }
  if ((a2 & 1) == 0)
  {
    if (*(_QWORD *)(a1 + 56))
      **(_QWORD **)(a1 + 56) = (id)objc_msgSend(v5, "copy");
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

  }
}

- (BOOL)pauseWithRequestID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  -[MADComputeService connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__MADComputeService_pauseWithRequestID_error___block_invoke;
  v11[3] = &unk_1E97E2648;
  v11[4] = &v18;
  v11[5] = &v12;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancelWithRequestID:", v6);

  if (a4)
    *a4 = (id)objc_msgSend((id)v13[5], "copy");
  v9 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __46__MADComputeService_pauseWithRequestID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __46__MADComputeService_pauseWithRequestID_error___block_invoke_cold_1();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)resumeWithRequestID:(id)a3 progressHandler:(id)a4 resultsHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void (**v25)(id, _QWORD, void *);
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  MADComputeService *v33;
  id v34;
  void (**v35)(id, _QWORD, void *);
  _QWORD v36[5];
  id v37;
  id v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v30 = a5;
  v12 = (void (**)(id, _QWORD, void *))a6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ResumeRequest: %@"), v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v13;
    _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MADComputeService][Resume] %@", buf, 0xCu);
  }
  v14 = -[MADComputeService registerProgressHandler:requestID:](self, "registerProgressHandler:requestID:", v11, v10);
  if ((_DWORD)v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MADComputeService][Resume] Failed to register progressHandler (%d)"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:].cold.2();
    v43 = *MEMORY[0x1E0CB2D50];
    v44 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], (int)v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, v17);

  }
  else
  {
    v18 = -[MADComputeService registerResultsHandler:requestID:](self, "registerResultsHandler:requestID:", v30, v10);
    if ((_DWORD)v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MADComputeService][Resume] Failed to register resultsHandler (%d)"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:].cold.2();
      v41 = *MEMORY[0x1E0CB2D50];
      v42 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], (int)v18, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0, v21);

    }
    else
    {
      -[MADComputeService connection](self, "connection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = MEMORY[0x1E0C809B0];
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __90__MADComputeService_resumeWithRequestID_progressHandler_resultsHandler_completionHandler___block_invoke;
      v36[3] = &unk_1E97E2AC0;
      v36[4] = self;
      v24 = v10;
      v37 = v24;
      v25 = v12;
      v38 = v25;
      objc_msgSend(v22, "remoteObjectProxyWithErrorHandler:", v36);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        v31[0] = v23;
        v31[1] = 3221225472;
        v31[2] = __90__MADComputeService_resumeWithRequestID_progressHandler_resultsHandler_completionHandler___block_invoke_93;
        v31[3] = &unk_1E97E2AE8;
        v32 = v13;
        v33 = self;
        v34 = v24;
        v35 = v25;
        objc_msgSend(v29, "resumeWithRequestID:reply:", v34, v31);

        v26 = v32;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MADComputeService][Resume] Failed to connect to analysis service during %s"), "-[MADComputeService resumeWithRequestID:progressHandler:resultsHandler:completionHandler:]");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:].cold.2();
        v39 = *MEMORY[0x1E0CB2D50];
        v40 = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[MADComputeService deregisterProgressHandlerForRequestID:](self, "deregisterProgressHandlerForRequestID:", v24);
        -[MADComputeService deregisterResultsHandlerForRequestID:](self, "deregisterResultsHandlerForRequestID:", v24);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, id, void *))v25)[2](v25, v24, v28);

      }
    }
  }

}

void __90__MADComputeService_resumeWithRequestID_progressHandler_resultsHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __90__MADComputeService_resumeWithRequestID_progressHandler_resultsHandler_completionHandler___block_invoke_cold_1();
  objc_msgSend(*(id *)(a1 + 32), "deregisterProgressHandlerForRequestID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "deregisterResultsHandlerForRequestID:", *(_QWORD *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = (void *)objc_msgSend(v3, "copy");
  (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, v5, v6);

}

void __90__MADComputeService_resumeWithRequestID_progressHandler_resultsHandler_completionHandler___block_invoke_93(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MADComputeService][Resume][Finish] %@", (uint8_t *)&v8, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "deregisterProgressHandlerForRequestID:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "deregisterResultsHandlerForRequestID:", *(_QWORD *)(a1 + 48));
  v6 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v7 = (void *)objc_msgSend(v3, "copy");
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, v6, v7);

}

- (void)cancelWithRequestID:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MADComputeService connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_96);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelWithRequestID:", v6);

}

void __41__MADComputeService_cancelWithRequestID___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __46__MADComputeService_pauseWithRequestID_error___block_invoke_cold_1();
}

- (void)cancelAllRequests
{
  void *v2;
  id v3;

  -[MADComputeService connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_97);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelAllRequests");

}

void __38__MADComputeService_cancelAllRequests__block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __38__MADComputeService_cancelAllRequests__block_invoke_cold_1();
}

- (void)reportProgress:(double)a3 requestID:(id)a4
{
  id v6;
  NSObject *progressHandlerQueue;
  id v8;
  uint64_t v9;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__98;
  v17 = __Block_byref_object_dispose__99;
  v18 = 0;
  progressHandlerQueue = self->_progressHandlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MADComputeService_reportProgress_requestID___block_invoke;
  block[3] = &unk_1E97E2B60;
  v12 = &v13;
  block[4] = self;
  v8 = v6;
  v11 = v8;
  dispatch_sync(progressHandlerQueue, block);
  v9 = v14[5];
  if (v9)
  {
    (*(void (**)(uint64_t, id, double))(v9 + 16))(v9, v8, a3);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[MADComputeService reportProgress:requestID:].cold.1();
  }

  _Block_object_dispose(&v13, 8);
}

void __46__MADComputeService_reportProgress_requestID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (int)registerProgressHandler:(id)a3 requestID:(id)a4
{
  id v6;
  id v7;
  NSObject *progressHandlerQueue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  progressHandlerQueue = self->_progressHandlerQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__MADComputeService_registerProgressHandler_requestID___block_invoke;
  v12[3] = &unk_1E97E2B88;
  v12[4] = self;
  v13 = v7;
  v14 = v6;
  v15 = &v16;
  v9 = v6;
  v10 = v7;
  dispatch_sync(progressHandlerQueue, v12);
  LODWORD(v6) = *((_DWORD *)v17 + 6);

  _Block_object_dispose(&v16, 8);
  return (int)v6;
}

void __55__MADComputeService_registerProgressHandler_requestID___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __55__MADComputeService_registerProgressHandler_requestID___block_invoke_cold_2();
    v3 = *(_QWORD *)(a1[7] + 8);
    v4 = -18;
LABEL_5:
    *(_DWORD *)(v3 + 24) = v4;
    return;
  }
  if (!a1[6])
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __55__MADComputeService_registerProgressHandler_requestID___block_invoke_cold_1();
    v3 = *(_QWORD *)(a1[7] + 8);
    v4 = -50;
    goto LABEL_5;
  }
  v5 = (id)MEMORY[0x1D825F508]();
  objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKeyedSubscript:");

}

- (int)deregisterProgressHandlerForRequestID:(id)a3
{
  id v4;
  NSObject *progressHandlerQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  progressHandlerQueue = self->_progressHandlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MADComputeService_deregisterProgressHandlerForRequestID___block_invoke;
  block[3] = &unk_1E97E2BB0;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(progressHandlerQueue, block);
  LODWORD(progressHandlerQueue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)progressHandlerQueue;
}

void __59__MADComputeService_deregisterProgressHandlerForRequestID___block_invoke(_QWORD *a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1[4] + 32), "removeObjectForKey:", a1[5]);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __59__MADComputeService_deregisterProgressHandlerForRequestID___block_invoke_cold_1();
    *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = -18;
  }
}

- (void)handleResults:(id)a3 assetRepresentation:(id)a4 requestID:(id)a5 error:(id)a6 acknowledgement:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(_QWORD);
  NSObject *resultsHandlerQueue;
  id v18;
  uint64_t v19;
  _QWORD block[5];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(_QWORD))a7;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__98;
  v27 = __Block_byref_object_dispose__99;
  v28 = 0;
  resultsHandlerQueue = self->_resultsHandlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__MADComputeService_handleResults_assetRepresentation_requestID_error_acknowledgement___block_invoke;
  block[3] = &unk_1E97E2B60;
  v22 = &v23;
  block[4] = self;
  v18 = v14;
  v21 = v18;
  dispatch_sync(resultsHandlerQueue, block);
  v19 = v24[5];
  if (v19)
  {
    (*(void (**)(uint64_t, id, id, id, id))(v19 + 16))(v19, v18, v13, v12, v15);
    v16[2](v16);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[MADComputeService handleResults:assetRepresentation:requestID:error:acknowledgement:].cold.1();
  }

  _Block_object_dispose(&v23, 8);
}

void __87__MADComputeService_handleResults_assetRepresentation_requestID_error_acknowledgement___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 48), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (int)registerResultsHandler:(id)a3 requestID:(id)a4
{
  id v6;
  id v7;
  NSObject *resultsHandlerQueue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  resultsHandlerQueue = self->_resultsHandlerQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__MADComputeService_registerResultsHandler_requestID___block_invoke;
  v12[3] = &unk_1E97E2B88;
  v12[4] = self;
  v13 = v7;
  v14 = v6;
  v15 = &v16;
  v9 = v6;
  v10 = v7;
  dispatch_sync(resultsHandlerQueue, v12);
  LODWORD(v6) = *((_DWORD *)v17 + 6);

  _Block_object_dispose(&v16, 8);
  return (int)v6;
}

void __54__MADComputeService_registerResultsHandler_requestID___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 48), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __54__MADComputeService_registerResultsHandler_requestID___block_invoke_cold_2();
    v3 = *(_QWORD *)(a1[7] + 8);
    v4 = -18;
LABEL_5:
    *(_DWORD *)(v3 + 24) = v4;
    return;
  }
  if (!a1[6])
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __54__MADComputeService_registerResultsHandler_requestID___block_invoke_cold_1();
    v3 = *(_QWORD *)(a1[7] + 8);
    v4 = -50;
    goto LABEL_5;
  }
  v5 = (id)MEMORY[0x1D825F508]();
  objc_msgSend(*(id *)(a1[4] + 48), "setObject:forKeyedSubscript:");

}

- (int)deregisterResultsHandlerForRequestID:(id)a3
{
  id v4;
  NSObject *resultsHandlerQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  resultsHandlerQueue = self->_resultsHandlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MADComputeService_deregisterResultsHandlerForRequestID___block_invoke;
  block[3] = &unk_1E97E2BB0;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(resultsHandlerQueue, block);
  LODWORD(resultsHandlerQueue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)resultsHandlerQueue;
}

void __58__MADComputeService_deregisterResultsHandlerForRequestID___block_invoke(_QWORD *a1)
{
  uint64_t *v2;
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 5;
  objc_msgSend(*(id *)(a1[4] + 48), "objectForKeyedSubscript:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v4 = *v2;
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MADComputeService] Deregister resultsHandler for %@", (uint8_t *)&v5, 0xCu);
    }
    objc_msgSend(*(id *)(a1[4] + 48), "removeObjectForKey:", a1[5]);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __58__MADComputeService_deregisterResultsHandlerForRequestID___block_invoke_cold_1();
    *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = -18;
  }
}

- (id)resultDirectoryURL
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v2, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, &v16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v16;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v3;
    _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MADComputeService] applicationSupportURL %@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resourceURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("/usr/local/bin"));

  if (!v10)
  {
    objc_msgSend(v3, "URLByAppendingPathComponent:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_5:
    v11 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileURLWithPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v13;
    _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MADComputeService] resultDirectoryURL %@", buf, 0xCu);
  }
  objc_msgSend(v13, "URLByAppendingPathComponent:", CFSTR("madcs"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)extensionDataForResultDirectoryURL:(id *)a3 error:(id *)a4
{
  void *v6;
  id v7;
  char v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  uint64_t v25;
  id v26;
  uint8_t buf[4];
  const __CFString *v28;
  __int16 v29;
  id v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[MADComputeService resultDirectoryURL](self, "resultDirectoryURL");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *a3;
    v24 = 0;
    v8 = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v24);
    v9 = v24;

    if ((v8 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[MADComputeService extensionDataForResultDirectoryURL:error:].cold.3();
      v20 = 0;
      if (a4)
        *a4 = (id)objc_msgSend(v9, "copy");
      goto LABEL_27;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v10 = *a3;
      *(_DWORD *)buf = 138412546;
      v28 = CFSTR("[MADComputeService][URLExtensionDataResultDirectory]");
      v29 = 2112;
      v30 = v10;
      _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ Preparing extension data for URL at %@", buf, 0x16u);
    }
    objc_msgSend(*a3, "path");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "UTF8String");
    v12 = (void *)sandbox_extension_issue_file();

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      free(v12);
      if (objc_msgSend(v13, "length"))
      {
        v14 = (void *)MEMORY[0x1E0C99D50];
        v15 = objc_retainAutorelease(v13);
        v16 = objc_msgSend(v15, "UTF8String");
        v17 = objc_retainAutorelease(v15);
        objc_msgSend(v14, "dataWithBytes:length:", v16, strlen((const char *)objc_msgSend(v17, "UTF8String")) + 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = v18;
          v20 = v19;
          goto LABEL_23;
        }
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Failed to generate extension data"), CFSTR("[MADComputeService][URLExtensionDataResultDirectory]"));
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:].cold.2();
    if (!a4)
    {
      v20 = 0;
      goto LABEL_26;
    }
    v25 = *MEMORY[0x1E0CB2D50];
    v26 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v17);
    v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

LABEL_26:
LABEL_27:
    v21 = v9;
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Missing directoryURL"), CFSTR("[MADComputeService][URLExtensionDataResultDirectory]"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:].cold.2();
  if (a4)
  {
    v31 = *MEMORY[0x1E0CB2D50];
    v32[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v22);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v20 = 0;
LABEL_28:

  return v20;
}

- (id)extensionDataFromAssetURLs:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v21;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  void *v30;
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v21;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1D825F3AC]();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v32 = CFSTR("[MADComputeService][URLExtensionData]");
          v33 = 2112;
          v34 = v7;
          _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ Preparing extension data for URL at %@", buf, 0x16u);
        }
        objc_msgSend(v7, "path");
        v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v9, "UTF8String");
        v10 = (void *)sandbox_extension_issue_file();

        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          free(v10);
          if (objc_msgSend(v11, "length"))
          {
            v12 = (void *)MEMORY[0x1E0C99D50];
            v13 = objc_retainAutorelease(v11);
            objc_msgSend(v12, "dataWithBytes:length:", objc_msgSend(v13, "UTF8String"), strlen((const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String")) + 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
              objc_msgSend(v23, "addObject:", v14);
          }
          else
          {
            v14 = 0;
          }

        }
        objc_autoreleasePoolPop(v8);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    }
    while (v4);
  }

  v15 = objc_msgSend(obj, "count");
  if (v15 == objc_msgSend(v23, "count"))
  {
    v16 = v23;
    v17 = v23;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Failed to prepare extension data to all assets (%lu, expected: %lu)"), CFSTR("[MADComputeService][URLExtensionData]"), objc_msgSend(v23, "count"), objc_msgSend(obj, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:].cold.2();
    if (a4)
    {
      v29 = *MEMORY[0x1E0CB2D50];
      v30 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v19);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v17 = 0;
    v16 = v23;
  }

  return v17;
}

- (BOOL)_validFileURL:(id)a3 toRequestID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v14 = 138412546;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MADComputeService] Checking file %@ comfining to %@", (uint8_t *)&v14, 0x16u);
  }
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("-"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("-"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v9, "count") < 3)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

  }
  return v12;
}

- (id)fetchResultsWithRequestID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  BOOL v19;
  void *v21;
  void *v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  const __CFString *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("result-%@"), v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADComputeService resultDirectoryURL](self, "resultDirectoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v6, 0, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = v22;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1D825F3AC]();
        if (-[MADComputeService _validFileURL:toRequestID:](self, "_validFileURL:toRequestID:", v11, v4))
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)MEMORY[0x1E0CB3710];
          v15 = objc_opt_class();
          v24 = 0;
          objc_msgSend(v14, "unarchivedObjectOfClass:fromData:error:", v15, v13, &v24);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v24;
          v18 = v17;
          if (v16)
            v19 = v17 == 0;
          else
            v19 = 0;
          if (v19)
          {
            objc_msgSend(v23, "addObject:", v16);
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v30 = CFSTR("[MADComputeService][FetchResults]");
            v31 = 2112;
            v32 = v18;
            _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ Failed to load result data %@", buf, 0x16u);
          }

        }
        objc_autoreleasePoolPop(v12);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v8);
  }

  return v23;
}

- (BOOL)purgeResultsWithRequestID:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id obj;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  void *v36;
  uint8_t buf[4];
  const __CFString *v38;
  uint64_t v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("result-%@"), v5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADComputeService resultDirectoryURL](self, "resultDirectoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v7, 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v32;
    v26 = *MEMORY[0x1E0CB2F90];
    v27 = *MEMORY[0x1E0CB2D50];
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1D825F3AC]();
        if (-[MADComputeService _validFileURL:toRequestID:](self, "_validFileURL:toRequestID:", v12, v5))
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0;
          v15 = objc_msgSend(v14, "removeItemAtURL:error:", v12, &v30);
          v16 = v30;

          if (!(v15 & 1 | (a4 == 0)))
          {
            v17 = (void *)MEMORY[0x1E0CB35C8];
            v39 = v27;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to purge result %@ - %@"), v5, v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v18;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "errorWithDomain:code:userInfo:", v26, -50, v19);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

            v15 = 0;
          }

        }
        else
        {
          v15 = 1;
        }
        objc_autoreleasePoolPop(v13);
        if (!v15)
        {
          v21 = obj;
          goto LABEL_19;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      if (v9)
        continue;
      break;
    }
  }

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v38 = CFSTR("[MADComputeService][PurgeResults]");
    _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ Result does not exist!", buf, 0xCu);
  }
  if (a4)
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Result for %@ is not available"), v5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v22);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_19:
  }

  return 0;
}

- (BOOL)removeRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v19;
  _QWORD v20[4];
  const __CFString *v21;
  id v22;
  _BYTE *v23;
  id *v24;
  _QWORD v25[4];
  __CFString *v26;
  id *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _BYTE buf[24];
  char v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = CFSTR("[MADComputeService][RemoveRequest]");
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ Start removing %@ ...", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v33 = 0;
  -[MADComputeService connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __41__MADComputeService_removeRequest_error___block_invoke;
  v25[3] = &unk_1E97E2BD8;
  v26 = CFSTR("[MADComputeService][RemoveRequest]");
  v27 = a4;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __41__MADComputeService_removeRequest_error___block_invoke_132;
    v20[3] = &unk_1E97E2B38;
    v21 = CFSTR("[MADComputeService][RemoveRequest]");
    v22 = v6;
    v23 = buf;
    v24 = a4;
    objc_msgSend(v9, "removeWithRequestID:reply:", v22, v20);

    v10 = (void *)v21;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Failed to connect to compute service"), CFSTR("[MADComputeService][RemoveRequest]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:].cold.2();
    if (a4)
    {
      v30 = *MEMORY[0x1E0CB2D50];
      v31 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    v19 = 0;
    v12 = -[MADComputeService purgeResultsWithRequestID:error:](self, "purgeResultsWithRequestID:error:", v6, &v19);
    v13 = v19;
    if (v12)
    {
      if (a4)
      {
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v28 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Task removed, but result purging is incomplete - %@"), v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v16);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      *(_BYTE *)(*(_QWORD *)&buf[8] + 24) = 0;
    }

    v17 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
  }
  else
  {
    v17 = 0;
  }

  _Block_object_dispose(buf, 8);
  return v17;
}

void __41__MADComputeService_removeRequest_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __62__MADComputeService_scheduleRequests_assetURLs_options_error___block_invoke_cold_1();
  if (*(_QWORD *)(a1 + 40))
    **(_QWORD **)(a1 + 40) = (id)objc_msgSend(v3, "copy");

}

void __41__MADComputeService_removeRequest_error___block_invoke_132(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ Finished removing %@", (uint8_t *)&v8, 0x16u);
  }
  if ((a2 & 1) == 0 && *(_QWORD *)(a1 + 56))
    **(_QWORD **)(a1 + 56) = (id)objc_msgSend(v5, "copy");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsHandlers, 0);
  objc_storeStrong((id *)&self->_resultsHandlerQueue, 0);
  objc_storeStrong((id *)&self->_progressHandlers, 0);
  objc_storeStrong((id *)&self->_progressHandlerQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_0(&dword_1D461A000, MEMORY[0x1E0C81028], a3, "[MADComputeService init] unavialable; please call [MADComputeService service]",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_1();
}

void __31__MADComputeService_connection__block_invoke_2_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADComputeService] Client XPC connection interrupted", v0, 2u);
  OUTLINED_FUNCTION_1();
}

void __31__MADComputeService_connection__block_invoke_60_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D461A000, MEMORY[0x1E0C81028], a3, "[MADComputeService] Client XPC connection invalidated", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_1D461A000, MEMORY[0x1E0C81028], v0, "[MADComputeService] Failed to get sandbox extension data for assetURLs - %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_1D461A000, MEMORY[0x1E0C81028], v0, "%@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_1D461A000, MEMORY[0x1E0C81028], v0, "[MADComputeService] Failed to get extension data for resultDirectoryURL - %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __104__MADComputeService_performRequests_assetURLs_options_progressHandler_resultsHandler_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_1D461A000, MEMORY[0x1E0C81028], v0, "[MADComputeService] Error connecting to analysis service - %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)scheduleRequests:assetURLs:options:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_3_1(&dword_1D461A000, MEMORY[0x1E0C81028], v0, "%@ Failed to get extension data for assetURLs - %@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)scheduleRequests:assetURLs:options:error:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_3_1(&dword_1D461A000, MEMORY[0x1E0C81028], v0, "%@ Failed to get extension data for resultDirectoryURL - %@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3();
}

void __62__MADComputeService_scheduleRequests_assetURLs_options_error___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_1(&dword_1D461A000, MEMORY[0x1E0C81028], v0, "%@ Error connecting to analysis service - %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __46__MADComputeService_pauseWithRequestID_error___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_1D461A000, MEMORY[0x1E0C81028], v0, "[MADComputeService] Error connecting to service to cancelRequestID %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __90__MADComputeService_resumeWithRequestID_progressHandler_resultsHandler_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_1D461A000, MEMORY[0x1E0C81028], v0, "[MADComputeService][Resume] Error connecting to analysis service - %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __38__MADComputeService_cancelAllRequests__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_1D461A000, MEMORY[0x1E0C81028], v0, "[MADComputeService] Error connecting to service to cancelAllRequests %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)reportProgress:requestID:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_1D461A000, MEMORY[0x1E0C81028], v0, "[MADComputeService] No progressHandler for %@; cannot report",
    v1,
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_3();
}

void __55__MADComputeService_registerProgressHandler_requestID___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_0(&dword_1D461A000, MEMORY[0x1E0C81028], v0, "[MADComputeService] No progressHandler defined for %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __55__MADComputeService_registerProgressHandler_requestID___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_0(&dword_1D461A000, MEMORY[0x1E0C81028], v0, "[MADComputeService] ProgressHandler already set for %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __59__MADComputeService_deregisterProgressHandlerForRequestID___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_0(&dword_1D461A000, MEMORY[0x1E0C81028], v0, "[MADComputeService] ProgressHandler NOT set for %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)handleResults:assetRepresentation:requestID:error:acknowledgement:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_1D461A000, MEMORY[0x1E0C81028], v0, "[MADComputeService] No resultsHandler for %@; cannot report",
    v1,
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_3();
}

void __54__MADComputeService_registerResultsHandler_requestID___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_0(&dword_1D461A000, MEMORY[0x1E0C81028], v0, "[MADComputeService] No resultsHandler defined for %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __54__MADComputeService_registerResultsHandler_requestID___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_0(&dword_1D461A000, MEMORY[0x1E0C81028], v0, "[MADComputeService] ResultsHandler already set for %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __58__MADComputeService_deregisterResultsHandlerForRequestID___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_0(&dword_1D461A000, MEMORY[0x1E0C81028], v0, "[MADComputeService] ResultsHandler NOT set for %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)extensionDataForResultDirectoryURL:error:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  v2 = 138412802;
  v3 = CFSTR("[MADComputeService][URLExtensionDataResultDirectory]");
  v4 = 2112;
  v5 = v0;
  v6 = 2112;
  v7 = v1;
  _os_log_error_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Failed to create URL at %@ - %@", (uint8_t *)&v2, 0x20u);
}

@end

@implementation MADService

+ (BOOL)isEntitled
{
  if (+[MADService isEntitled]::onceToken != -1)
    dispatch_once(&+[MADService isEntitled]::onceToken, &__block_literal_global);
  return +[MADService isEntitled]::entitled;
}

+ (id)service
{
  _BOOL4 v2;
  __objc2_class **v3;

  v2 = +[MADService isEntitled](MADService, "isEntitled");
  v3 = off_1E97E1CC0;
  if (!v2)
    v3 = off_1E97E1CD0;
  return (id)objc_msgSend(objc_alloc(*v3), "initInternal");
}

- (id)initInternal
{
  MADService *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *connectionQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *progressHandlerQueue;
  uint64_t v7;
  NSMutableDictionary *progressHandlers;
  dispatch_queue_t v9;
  OS_dispatch_queue *resultHandlerQueue;
  uint64_t v11;
  NSMutableDictionary *resultHandlers;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MADService;
  v2 = -[MADService init](&v14, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("MADService.connectionQueue", 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v3;

    atomic_store(1u, (unsigned int *)&v2->_requestID);
    v5 = dispatch_queue_create("MADService.progressHandlerQueue", 0);
    progressHandlerQueue = v2->_progressHandlerQueue;
    v2->_progressHandlerQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    progressHandlers = v2->_progressHandlers;
    v2->_progressHandlers = (NSMutableDictionary *)v7;

    v9 = dispatch_queue_create("MADService.resultHandlerQueue", 0);
    resultHandlerQueue = v2->_resultHandlerQueue;
    v2->_resultHandlerQueue = (OS_dispatch_queue *)v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    resultHandlers = v2->_resultHandlers;
    v2->_resultHandlers = (NSMutableDictionary *)v11;

  }
  return v2;
}

const void **__24__MADService_isEntitled__block_invoke()
{
  SecTaskRef v0;
  CFTypeRef v1;
  CFTypeID v2;
  BOOL v3;
  const char *v4;
  SecTaskRef v6;
  _BYTE cf1[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v0 = SecTaskCreateFromSelf(0);
  v6 = v0;
  if (v0)
  {
    v1 = SecTaskCopyValueForEntitlement(v0, CFSTR("com.apple.mediaanalysisd.client"), 0);
    *(_QWORD *)cf1 = v1;
    v3 = v1
      && (v2 = CFGetTypeID(v1), v2 == CFBooleanGetTypeID())
      && CFEqual(*(CFTypeRef *)cf1, (CFTypeRef)*MEMORY[0x1E0C9AE50]) != 0;
    +[MADService isEntitled]::entitled = v3;
    CF<CGColorSpace *>::~CF((const void **)cf1);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    if (+[MADService isEntitled]::entitled)
      v4 = "Entitled";
    else
      v4 = "Not entitled";
    *(_DWORD *)cf1 = 136315138;
    *(_QWORD *)&cf1[4] = v4;
    _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Process is %s", cf1, 0xCu);
  }
  return CF<CGColorSpace *>::~CF((const void **)&v6);
}

- (MADService)init
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
    -[MADService init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MADService;
  -[MADService dealloc](&v3, sel_dealloc);
}

+ (void)configureServerInterface:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "allowedClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_requestImageProcessing_forIOSurface_withOrientation_identifier_requestID_andReply_, 0, 0);

  objc_msgSend((id)objc_opt_class(), "allowedClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_requestImageProcessing_forIOSurface_withOrientation_identifier_requestID_andReply_, 0, 1);

  objc_msgSend((id)objc_opt_class(), "allowedClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_requestImageProcessing_forAssetURL_withSandboxToken_identifier_requestID_andReply_, 0, 0);

  objc_msgSend((id)objc_opt_class(), "allowedClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_requestImageProcessing_forAssetURL_withSandboxToken_identifier_requestID_andReply_, 0, 1);

  objc_msgSend((id)objc_opt_class(), "allowedVideoRequestClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_requestVideoProcessing_assetURL_sandboxToken_identifier_requestID_reply_, 0, 0);

  objc_msgSend((id)objc_opt_class(), "allowedVideoResultClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_requestVideoProcessing_assetURL_sandboxToken_identifier_requestID_reply_, 0, 1);

  objc_msgSend((id)objc_opt_class(), "allowedTextRequestClasses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_requestTextPrewarming_requestID_reply_, 0, 0);

  objc_msgSend((id)objc_opt_class(), "allowedTextRequestClasses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_requestTextProcessing_textInputs_requestID_reply_, 0, 0);

  v12 = (void *)MEMORY[0x1E0C99E60];
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_requestTextProcessing_textInputs_requestID_reply_, 1, 0);

  objc_msgSend((id)objc_opt_class(), "allowedTextResultClasses");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_requestTextProcessing_textInputs_requestID_reply_, 0, 1);

  objc_msgSend((id)objc_opt_class(), "allowedMultiModalRequestClasses");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_requestMultiModalPrewarming_requestID_reply_, 0, 0);

  objc_msgSend((id)objc_opt_class(), "allowedMultiModalRequestClasses");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_requestProcessing_multiModalInputs_requestID_reply_, 0, 0);

  objc_msgSend((id)objc_opt_class(), "allowedMultiModalInputClasses");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_requestProcessing_multiModalInputs_requestID_reply_, 1, 0);

  objc_msgSend((id)objc_opt_class(), "allowedMultiModalResultClasses");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_requestProcessing_multiModalInputs_requestID_reply_, 0, 1);

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
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  connectionQueue = self->_connectionQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__MADService_connection__block_invoke;
  v5[3] = &unk_1E97E24A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(connectionQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __24__MADService_connection__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  MADServiceProxy *v9;
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

    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v9 = -[MADServiceProxy initWithService:]([MADServiceProxy alloc], "initWithService:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v8, "setExportedObject:", v9);

    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFEAAA68);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setExportedInterface:", v11);

    v12 = (void *)MEMORY[0x1E0CB3B50];
    objc_msgSend((id)objc_opt_class(), "serverProtocol");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "interfaceWithProtocol:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "configureServerInterface:", v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setRemoteObjectInterface:", v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setInterruptionHandler:", &__block_literal_global_53);
    objc_initWeak(&location, *(id *)(a1 + 32));
    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __24__MADService_connection__block_invoke_54;
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

void __24__MADService_connection__block_invoke_2()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    __24__MADService_connection__block_invoke_2_cold_1();
}

void __24__MADService_connection__block_invoke_54(uint64_t a1)
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
    __24__MADService_connection__block_invoke_54_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    v12 = WeakRetained[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __24__MADService_connection__block_invoke_55;
    block[3] = &unk_1E97E2458;
    block[4] = v11;
    dispatch_async(v12, block);
  }

}

void __24__MADService_connection__block_invoke_55(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;

}

- (void)addProgressHandler:(id)a3 forRequestID:(int)a4
{
  id v6;
  void *v7;
  NSObject *progressHandlerQueue;
  id v9;
  _QWORD block[5];
  id v11;
  int v12;

  v6 = a3;
  v7 = &__block_literal_global_57;
  if (v6)
    v7 = v6;
  progressHandlerQueue = self->_progressHandlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MADService_addProgressHandler_forRequestID___block_invoke_2;
  block[3] = &unk_1E97E2510;
  v12 = a4;
  block[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_sync(progressHandlerQueue, block);

}

void __46__MADService_addProgressHandler_forRequestID___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __46__MADService_addProgressHandler_forRequestID___block_invoke_2_cold_1();
  }
  else
  {
    v7 = (id)MEMORY[0x1D825F508](*(_QWORD *)(a1 + 40));
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v5);

  }
}

- (void)removeProgressHandlerForRequestID:(int)a3
{
  NSObject *progressHandlerQueue;
  _QWORD v4[5];
  int v5;

  progressHandlerQueue = self->_progressHandlerQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__MADService_removeProgressHandlerForRequestID___block_invoke;
  v4[3] = &unk_1E97E2538;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(progressHandlerQueue, v4);
}

void __48__MADService_removeProgressHandlerForRequestID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:");

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    __48__MADService_removeProgressHandlerForRequestID___block_invoke_cold_1();
  }
}

- (void)reportProgress:(double)a3 forRequest:(int)a4
{
  NSObject *progressHandlerQueue;
  _QWORD block[6];
  int v6;

  progressHandlerQueue = self->_progressHandlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__MADService_reportProgress_forRequest___block_invoke;
  block[3] = &unk_1E97E2560;
  block[4] = self;
  v6 = a4;
  *(double *)&block[5] = a3;
  dispatch_sync(progressHandlerQueue, block);
}

void __40__MADService_reportProgress_forRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, double);

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v4[2](v4, *(unsigned int *)(a1 + 48), *(double *)(a1 + 40));
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    __40__MADService_reportProgress_forRequest___block_invoke_cold_1();
  }

}

- (void)addResultHandler:(id)a3 forRequestID:(int)a4
{
  id v6;
  void *v7;
  NSObject *resultHandlerQueue;
  id v9;
  _QWORD block[5];
  id v11;
  int v12;

  v6 = a3;
  v7 = &__block_literal_global_60;
  if (v6)
    v7 = v6;
  resultHandlerQueue = self->_resultHandlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MADService_addResultHandler_forRequestID___block_invoke_2;
  block[3] = &unk_1E97E2510;
  v12 = a4;
  block[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_sync(resultHandlerQueue, block);

}

void __44__MADService_addResultHandler_forRequestID___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __44__MADService_addResultHandler_forRequestID___block_invoke_2_cold_1();
  }
  else
  {
    v7 = (id)MEMORY[0x1D825F508](*(_QWORD *)(a1 + 40));
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v5);

  }
}

- (void)removeResultHandlerForRequestID:(int)a3
{
  NSObject *resultHandlerQueue;
  _QWORD v4[5];
  int v5;

  resultHandlerQueue = self->_resultHandlerQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__MADService_removeResultHandlerForRequestID___block_invoke;
  v4[3] = &unk_1E97E2538;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(resultHandlerQueue, v4);
}

void __46__MADService_removeResultHandlerForRequestID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:");

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    __46__MADService_removeResultHandlerForRequestID___block_invoke_cold_1();
  }
}

- (void)handleResult:(id)a3 atRequestIdx:(unint64_t)a4 forRequestID:(int)a5
{
  uint64_t v5;
  id v8;
  NSObject *resultHandlerQueue;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD block[6];
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__61;
  v24 = __Block_byref_object_dispose__62;
  v25 = 0;
  resultHandlerQueue = self->_resultHandlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MADService_handleResult_atRequestIdx_forRequestID___block_invoke;
  block[3] = &unk_1E97E25A8;
  block[4] = self;
  block[5] = &v20;
  v19 = v5;
  dispatch_sync(resultHandlerQueue, block);
  v10 = v21[5];
  if (v10)
  {
    (*(void (**)(uint64_t, id, unint64_t))(v10 + 16))(v10, v8, a4);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[MADService handleResult:atRequestIdx:forRequestID:].cold.1(v5, v11, v12, v13, v14, v15, v16, v17);
  }
  _Block_object_dispose(&v20, 8);

}

void __53__MADService_handleResult_atRequestIdx_forRequestID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (int)performRequests:(id)a3 onPixelBuffer:(__CVBuffer *)a4 withOrientation:(unsigned int)a5 andIdentifier:(id)a6 completionHandler:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  atomic<int> *p_requestID;
  void *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  os_signpost_id_t v37;
  int v38;
  _QWORD v39[4];
  id v40;
  int v41;
  uint8_t buf[4];
  int v43;
  __int16 v44;
  id v45;
  uint64_t v46;
  _QWORD v47[3];

  v9 = *(_QWORD *)&a5;
  v47[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  CVPixelBufferGetIOSurface(a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    p_requestID = &self->_requestID;
    do
      v17 = (void *)__ldaxr((unsigned int *)p_requestID);
    while (__stlxr((_DWORD)v17 + 1, (unsigned int *)p_requestID));
    v32 = v14;
    MADSignpostLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_signpost_id_generate(v18);

    MADSignpostLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_DWORD *)buf = 67109378;
      v43 = (int)v17;
      v44 = 2112;
      v45 = v13;
      _os_signpost_emit_with_name_impl(&dword_1D461A000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "MADService_performRequestsOnPixelBuffer", "Request: %d Identifier: %@", buf, 0x12u);
    }

    -[MADService connection](self, "connection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v13;
    v24 = v12;
    v25 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke;
    v39[3] = &unk_1E97E25D0;
    v26 = v14;
    v40 = v26;
    v41 = (int)v17;
    objc_msgSend(v22, "remoteObjectProxyWithErrorHandler:", v39);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v25;
    v33[1] = 3221225472;
    v33[2] = __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_69;
    v33[3] = &unk_1E97E25F8;
    v37 = v19;
    v38 = (int)v17;
    v34 = v23;
    v35 = v24;
    v36 = v26;
    objc_msgSend(v27, "requestImageProcessing:forIOSurface:withOrientation:identifier:requestID:andReply:", v35, v15, v9, v34, v17, v33);

    v14 = v32;
    v12 = v24;
    v13 = v23;

    v28 = v40;
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v46 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CVPixelBuffer must be IOSurface-backed"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, void *))v14 + 2))(v14, 0xFFFFFFFFLL, v30);

    LODWORD(v17) = -1;
  }

  return (int)v17;
}

void __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v4)
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  uint64_t v11;
  unint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _DWORD v19[2];
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  MADSignpostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = *(_DWORD *)(a1 + 64);
    v11 = *(_QWORD *)(a1 + 32);
    v19[0] = 67109378;
    v19[1] = v10;
    v20 = 2112;
    v21 = v11;
    _os_signpost_emit_with_name_impl(&dword_1D461A000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_performRequestsOnPixelBuffer", "Request: %d Identifier: %@", (uint8_t *)v19, 0x12u);
  }

  for (i = 0; i < objc_msgSend(*(id *)(a1 + 40), "count"); ++i)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "results");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setResults:", v15);

    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setError:", v18);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (int)performRequests:(id)a3 onCGImage:(CGImage *)a4 withOrientation:(unsigned int)a5 andIdentifier:(id)a6 completionHandler:(id)a7
{
  uint64_t v9;
  atomic<int> *p_requestID;
  uint64_t v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  size_t Width;
  size_t Height;
  uint64_t v24;
  id v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  unint64_t v30;
  unsigned int v31;
  CGImagePropertyOrientation v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  os_signpost_id_t v50;
  int v51;
  _QWORD v52[4];
  id v53;
  int v54;
  uint64_t v55;
  void *v56;
  uint8_t v57[128];
  uint8_t buf[8];
  __int16 v59;
  id v60;
  uint64_t v61;

  v9 = *(_QWORD *)&a5;
  v61 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v39 = a6;
  v40 = a7;
  CGImageGetProperty();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    p_requestID = &self->_requestID;
    do
      v13 = __ldaxr((unsigned int *)p_requestID);
    while (__stlxr(v13 + 1, (unsigned int *)p_requestID));
    MADSignpostLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_signpost_id_generate(v14);

    MADSignpostLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v13;
      v59 = 2112;
      v60 = v39;
      _os_signpost_emit_with_name_impl(&dword_1D461A000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "MADService_performRequestsOnCGImage", "Request: %d Identifier: %@", buf, 0x12u);
    }

    -[MADService connection](self, "connection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __88__MADService_performRequests_onCGImage_withOrientation_andIdentifier_completionHandler___block_invoke;
    v52[3] = &unk_1E97E25D0;
    v20 = v40;
    v53 = v20;
    v54 = v13;
    objc_msgSend(v18, "remoteObjectProxyWithErrorHandler:", v52);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v19;
    v46[1] = 3221225472;
    v46[2] = __88__MADService_performRequests_onCGImage_withOrientation_andIdentifier_completionHandler___block_invoke_71;
    v46[3] = &unk_1E97E25F8;
    v50 = v15;
    v51 = v13;
    v47 = v39;
    v48 = v41;
    v49 = v20;
    objc_msgSend(v21, "requestImageProcessing:forIOSurface:withOrientation:identifier:requestID:andReply:", v48, v38, v9, v47, v13, v46);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MADService] Requested CGImage is not IOSurface backed, creating CVPixelBuffer on-demand (scaling if needed)", buf, 2u);
    }
    Width = CGImageGetWidth(a4);
    Height = CGImageGetHeight(a4);
    v24 = v9;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v25 = v41;
    v26 = 0;
    v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v57, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v43 != v28)
            objc_enumerationMutation(v25);
          v30 = objc_msgSend((id)objc_opt_class(), "targetResolution");
          if (v26 <= v30)
            v26 = v30;
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v57, 16);
      }
      while (v27);
    }

    v33 = 1.0;
    if (Height * Width > 11 * v26 / 0xA)
      v33 = sqrt((double)v26 / (double)(Height * Width));
    *(_QWORD *)buf = 0;
    if (CGImage_CreateCVPixelBufferWithTransform(a4, (__CVBuffer **)buf, v31, v32, v33))
    {
      v34 = (void *)MEMORY[0x1E0CB35C8];
      v55 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error creating CVPixelBuffer from non-IOSurface-backed CGImage with downscaling factor %f"), *(_QWORD *)&v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v36);
      v13 = objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, uint64_t, uint64_t))v40 + 2))(v40, 0xFFFFFFFFLL, v13);

      LODWORD(v13) = -1;
    }
    else
    {
      LODWORD(v13) = -[MADService performRequests:onPixelBuffer:withOrientation:andIdentifier:completionHandler:](self, "performRequests:onPixelBuffer:withOrientation:andIdentifier:completionHandler:", v25, *(_QWORD *)buf, v24, v39, v40);
    }
    CF<CGColorSpace *>::~CF((const void **)buf);
  }

  return v13;
}

void __88__MADService_performRequests_onCGImage_withOrientation_andIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v4)
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __88__MADService_performRequests_onCGImage_withOrientation_andIdentifier_completionHandler___block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  uint64_t v11;
  unint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _DWORD v19[2];
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  MADSignpostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = *(_DWORD *)(a1 + 64);
    v11 = *(_QWORD *)(a1 + 32);
    v19[0] = 67109378;
    v19[1] = v10;
    v20 = 2112;
    v21 = v11;
    _os_signpost_emit_with_name_impl(&dword_1D461A000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_performRequestsOnCGImage", "Request: %d Identifier: %@", (uint8_t *)v19, 0x12u);
  }

  for (i = 0; i < objc_msgSend(*(id *)(a1 + 40), "count"); ++i)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "results");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setResults:", v15);

    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setError:", v18);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (int)performRequests:(id)a3 onCIImage:(id)a4 withOrientation:(unsigned int)a5 andIdentifier:(id)a6 completionHandler:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  void (**v15)(id, uint64_t, void *);
  int v16;
  const __CFDictionary *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __CVBuffer *v22;
  const void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  CFTypeRef cf;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];

  v9 = *(_QWORD *)&a5;
  v34[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(id, uint64_t, void *))a7;
  if (objc_msgSend(v13, "pixelBuffer") && CVPixelBufferGetIOSurface((CVPixelBufferRef)objc_msgSend(v13, "pixelBuffer")))
  {
    v16 = -[MADService performRequests:onPixelBuffer:withOrientation:andIdentifier:completionHandler:](self, "performRequests:onPixelBuffer:withOrientation:andIdentifier:completionHandler:", v12, objc_msgSend(v13, "pixelBuffer"), v9, v14, v15);
  }
  else
  {
    cf = 0;
    v33 = *MEMORY[0x1E0CA8FF0];
    v34[0] = MEMORY[0x1E0C9AA70];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1, 0);
    v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "extent");
    v19 = v18;
    objc_msgSend(v13, "extent");
    v21 = v20;
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
    CVPixelBufferCreate(0, (unint64_t)v19, (unint64_t)v21, 0x42475241u, v17, (CVPixelBufferRef *)&cf);
    v22 = (__CVBuffer *)cf;
    if (cf)
    {
      v23 = (const void *)objc_msgSend(v13, "colorSpace");
      CVBufferSetAttachment(v22, (CFStringRef)*MEMORY[0x1E0CA8CD8], v23, kCVAttachmentMode_ShouldPropagate);
      objc_msgSend(MEMORY[0x1E0C9DD90], "context");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "render:toCVPixelBuffer:", v13, cf);

      v16 = -[MADService performRequests:onPixelBuffer:withOrientation:andIdentifier:completionHandler:](self, "performRequests:onPixelBuffer:withOrientation:andIdentifier:completionHandler:", v12, cf, v9, v14, v15);
    }
    else
    {
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error allocating CVPixelBuffer"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, 0xFFFFFFFFLL, v28);

      v16 = -1;
    }

    CF<CGColorSpace *>::~CF(&cf);
  }

  return v16;
}

- (int)performRequests:(id)a3 onPixelBuffer:(__CVBuffer *)a4 withOrientation:(unsigned int)a5 completionHandler:(id)a6
{
  uint64_t v6;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v6 = *(_QWORD *)&a5;
  v10 = a6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__MADService_performRequests_onPixelBuffer_withOrientation_completionHandler___block_invoke;
  v13[3] = &unk_1E97E2620;
  v14 = v10;
  v11 = v10;
  LODWORD(v6) = -[MADService performRequests:onPixelBuffer:withOrientation:andIdentifier:completionHandler:](self, "performRequests:onPixelBuffer:withOrientation:andIdentifier:completionHandler:", a3, a4, v6, 0, v13);

  return v6;
}

uint64_t __78__MADService_performRequests_onPixelBuffer_withOrientation_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)sandboxExtensionForURL:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "path");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "UTF8String");
  v7 = (void *)sandbox_extension_issue_file();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
    free(v7);
  }
  else if (a4)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2D50];
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Failed to create sandbox extension for %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

- (int)performRequests:(id)a3 onImageURL:(id)a4 withIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  atomic<int> *p_requestID;
  uint64_t v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  os_signpost_id_t v32;
  int v33;
  _QWORD v34[4];
  id v35;
  int v36;
  id v37;
  uint8_t buf[4];
  int v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v37 = 0;
  -[MADService sandboxExtensionForURL:error:](self, "sandboxExtensionForURL:error:", v10, &v37);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v37;
  v26 = v14;
  if (v13)
  {
    p_requestID = &self->_requestID;
    do
      v16 = __ldaxr((unsigned int *)p_requestID);
    while (__stlxr(v16 + 1, (unsigned int *)p_requestID));
    MADSignpostLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_signpost_id_generate(v17);

    MADSignpostLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_DWORD *)buf = 67109378;
      v39 = v16;
      v40 = 2112;
      v41 = v11;
      _os_signpost_emit_with_name_impl(&dword_1D461A000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "MADService_performRequestsOnImageURL", "Request: %d Identifier: %@", buf, 0x12u);
    }

    -[MADService connection](self, "connection", v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __74__MADService_performRequests_onImageURL_withIdentifier_completionHandler___block_invoke;
    v34[3] = &unk_1E97E25D0;
    v23 = v12;
    v35 = v23;
    v36 = v16;
    objc_msgSend(v21, "remoteObjectProxyWithErrorHandler:", v34);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v22;
    v28[1] = 3221225472;
    v28[2] = __74__MADService_performRequests_onImageURL_withIdentifier_completionHandler___block_invoke_80;
    v28[3] = &unk_1E97E25F8;
    v32 = v18;
    v33 = v16;
    v29 = v11;
    v30 = v27;
    v31 = v23;
    objc_msgSend(v24, "requestImageProcessing:forAssetURL:withSandboxToken:identifier:requestID:andReply:", v30, v10, v13, v29, v16, v28);

  }
  else
  {
    LODWORD(v16) = -1;
    (*((void (**)(id, uint64_t, id))v12 + 2))(v12, 0xFFFFFFFFLL, v14);
  }

  return v16;
}

void __74__MADService_performRequests_onImageURL_withIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v4)
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __74__MADService_performRequests_onImageURL_withIdentifier_completionHandler___block_invoke_80(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  uint64_t v11;
  unint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _DWORD v19[2];
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  MADSignpostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = *(_DWORD *)(a1 + 64);
    v11 = *(_QWORD *)(a1 + 32);
    v19[0] = 67109378;
    v19[1] = v10;
    v20 = 2112;
    v21 = v11;
    _os_signpost_emit_with_name_impl(&dword_1D461A000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_performRequestsOnImageURL", "Request: %d Identifier: %@", (uint8_t *)v19, 0x12u);
  }

  for (i = 0; i < objc_msgSend(*(id *)(a1 + 40), "count"); ++i)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "results");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setResults:", v15);

    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setError:", v18);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (int)performRequests:(id)a3 onImageURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__MADService_performRequests_onImageURL_completionHandler___block_invoke;
  v11[3] = &unk_1E97E2620;
  v12 = v8;
  v9 = v8;
  LODWORD(a4) = -[MADService performRequests:onImageURL:withIdentifier:completionHandler:](self, "performRequests:onImageURL:withIdentifier:completionHandler:", a3, a4, 0, v11);

  return (int)a4;
}

uint64_t __59__MADService_performRequests_onImageURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)performRequests:(id)a3 onImageURL:(id)a4 withIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  atomic<int> *p_requestID;
  uint64_t v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  BOOL v25;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  os_signpost_id_t v33;
  int v34;
  _QWORD v35[6];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  id obj;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint8_t buf[4];
  int v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v11;
  v27 = v12;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy_;
  v45 = __Block_byref_object_dispose_;
  v46 = 0;
  obj = 0;
  -[MADService sandboxExtensionForURL:error:](self, "sandboxExtensionForURL:error:", v11, &obj);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v46, obj);
  if (v14)
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 1;
    p_requestID = &self->_requestID;
    do
      v16 = __ldaxr((unsigned int *)p_requestID);
    while (__stlxr(v16 + 1, (unsigned int *)p_requestID));
    MADSignpostLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_signpost_id_generate(v17);

    MADSignpostLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_DWORD *)buf = 67109378;
      v48 = v16;
      v49 = 2112;
      v50 = v27;
      _os_signpost_emit_with_name_impl(&dword_1D461A000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "MADService_performRequestsOnImageURLSync", "Request: %d Identifier: %@", buf, 0x12u);
    }

    -[MADService connection](self, "connection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __62__MADService_performRequests_onImageURL_withIdentifier_error___block_invoke;
    v35[3] = &unk_1E97E2648;
    v35[4] = &v41;
    v35[5] = &v36;
    objc_msgSend(v21, "synchronousRemoteObjectProxyWithErrorHandler:", v35);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v22;
    v28[1] = 3221225472;
    v28[2] = __62__MADService_performRequests_onImageURL_withIdentifier_error___block_invoke_81;
    v28[3] = &unk_1E97E2670;
    v33 = v18;
    v34 = v16;
    v29 = v27;
    v30 = v10;
    v31 = &v36;
    v32 = &v41;
    v13 = v11;
    objc_msgSend(v23, "requestImageProcessing:forAssetURL:withSandboxToken:identifier:requestID:andReply:", v30, v11, v14, v29, v16, v28);

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v48 = v16;
      _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MADService] Analysis returns for RequestID %d (synchronous)", buf, 8u);
    }
    if (a6)
    {
      v24 = (void *)v42[5];
      if (v24)
        *a6 = objc_retainAutorelease(v24);
    }
    v25 = *((_BYTE *)v37 + 24) != 0;

    _Block_object_dispose(&v36, 8);
  }
  else
  {
    v25 = 0;
    if (a6)
      *a6 = (id)objc_msgSend((id)v42[5], "copy");
  }

  _Block_object_dispose(&v41, 8);
  return v25;
}

void __62__MADService_performRequests_onImageURL_withIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v3 = a2;
  v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v4)
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = objc_msgSend(v3, "copy");
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

void __62__MADService_performRequests_onImageURL_withIdentifier_error___block_invoke_81(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  uint64_t v11;
  unint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _DWORD v22[2];
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  MADSignpostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = *(_DWORD *)(a1 + 72);
    v11 = *(_QWORD *)(a1 + 32);
    v22[0] = 67109378;
    v22[1] = v10;
    v23 = 2112;
    v24 = v11;
    _os_signpost_emit_with_name_impl(&dword_1D461A000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_performRequestsOnImageURLSync", "Request: %d Identifier: %@", (uint8_t *)v22, 0x12u);
  }

  for (i = 0; i < objc_msgSend(*(id *)(a1 + 40), "count"); ++i)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "results");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setResults:", v15);

    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setError:", v18);

  }
  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __62__MADService_performRequests_onImageURL_withIdentifier_error___block_invoke_81_cold_1();
    v19 = objc_msgSend(v6, "copy");
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

  }
}

- (int)performRequests:(id)a3 onImageData:(id)a4 withUniformTypeIdentifier:(id)a5 andIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  atomic<int> *p_requestID;
  uint64_t v17;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  os_signpost_id_t v35;
  int v36;
  _QWORD v37[4];
  id v38;
  int v39;
  uint8_t buf[4];
  int v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v30 = a7;
  p_requestID = &self->_requestID;
  do
    v17 = __ldaxr((unsigned int *)p_requestID);
  while (__stlxr(v17 + 1, (unsigned int *)p_requestID));
  MADSignpostLog();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_signpost_id_generate(v18);

  MADSignpostLog();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_DWORD *)buf = 67109378;
    v41 = v17;
    v42 = 2112;
    v43 = v15;
    _os_signpost_emit_with_name_impl(&dword_1D461A000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "MADService_performRequestsOnImageData", "Request: %d Identifier: %@", buf, 0x12u);
  }

  -[MADService connection](self, "connection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __100__MADService_performRequests_onImageData_withUniformTypeIdentifier_andIdentifier_completionHandler___block_invoke;
  v37[3] = &unk_1E97E25D0;
  v24 = v30;
  v38 = v24;
  v39 = v17;
  objc_msgSend(v22, "remoteObjectProxyWithErrorHandler:", v37);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v23;
  v31[1] = 3221225472;
  v31[2] = __100__MADService_performRequests_onImageData_withUniformTypeIdentifier_andIdentifier_completionHandler___block_invoke_82;
  v31[3] = &unk_1E97E25F8;
  v35 = v19;
  v36 = v17;
  v26 = v15;
  v32 = v26;
  v27 = v12;
  v33 = v27;
  v28 = v24;
  v34 = v28;
  objc_msgSend(v25, "requestImageProcessing:forImageData:withUniformTypeIdentifier:identifier:requestID:andReply:", v27, v13, v14, v26, v17, v31);

  return v17;
}

void __100__MADService_performRequests_onImageData_withUniformTypeIdentifier_andIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v4)
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __100__MADService_performRequests_onImageData_withUniformTypeIdentifier_andIdentifier_completionHandler___block_invoke_82(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  uint64_t v11;
  unint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _DWORD v19[2];
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  MADSignpostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = *(_DWORD *)(a1 + 64);
    v11 = *(_QWORD *)(a1 + 32);
    v19[0] = 67109378;
    v19[1] = v10;
    v20 = 2112;
    v21 = v11;
    _os_signpost_emit_with_name_impl(&dword_1D461A000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_performRequestsOnImageData", "Request: %d Identifier: %@", (uint8_t *)v19, 0x12u);
  }

  for (i = 0; i < objc_msgSend(*(id *)(a1 + 40), "count"); ++i)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "results");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setResults:", v15);

    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setError:", v18);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (BOOL)performRequests:(id)a3 onImageData:(id)a4 withUniformTypeIdentifier:(id)a5 andIdentifier:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  atomic<int> *p_requestID;
  uint64_t v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  BOOL v26;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  os_signpost_id_t v35;
  int v36;
  _QWORD v37[6];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint8_t buf[4];
  int v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v29 = a5;
  v28 = a6;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 1;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy_;
  v42 = __Block_byref_object_dispose_;
  v43 = 0;
  p_requestID = &self->_requestID;
  do
    v15 = __ldaxr((unsigned int *)p_requestID);
  while (__stlxr(v15 + 1, (unsigned int *)p_requestID));
  MADSignpostLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_signpost_id_generate(v16);

  MADSignpostLog();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_DWORD *)buf = 67109378;
    v49 = v15;
    v50 = 2112;
    v51 = v28;
    _os_signpost_emit_with_name_impl(&dword_1D461A000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "MADService_performRequestsOnImageDataSync", "Request: %d Identifier: %@", buf, 0x12u);
  }

  -[MADService connection](self, "connection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __88__MADService_performRequests_onImageData_withUniformTypeIdentifier_andIdentifier_error___block_invoke;
  v37[3] = &unk_1E97E2648;
  v37[4] = &v38;
  v37[5] = &v44;
  objc_msgSend(v20, "synchronousRemoteObjectProxyWithErrorHandler:", v37);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v21;
  v30[1] = 3221225472;
  v30[2] = __88__MADService_performRequests_onImageData_withUniformTypeIdentifier_andIdentifier_error___block_invoke_83;
  v30[3] = &unk_1E97E2670;
  v35 = v17;
  v36 = v15;
  v23 = v28;
  v31 = v23;
  v24 = v12;
  v32 = v24;
  v33 = &v44;
  v34 = &v38;
  objc_msgSend(v22, "requestImageProcessing:forImageData:withUniformTypeIdentifier:identifier:requestID:andReply:", v24, v13, v29, v23, v15, v30);

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v49 = v15;
    _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MADService] Analysis returns for RequestID %d (synchronous)", buf, 8u);
  }
  if (a7)
  {
    v25 = (void *)v39[5];
    if (v25)
      *a7 = objc_retainAutorelease(v25);
  }
  v26 = *((_BYTE *)v45 + 24) != 0;

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return v26;
}

void __88__MADService_performRequests_onImageData_withUniformTypeIdentifier_andIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v3 = a2;
  v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v4)
    __88__MADService_performRequests_onImageData_withUniformTypeIdentifier_andIdentifier_error___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = objc_msgSend(v3, "copy");
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

void __88__MADService_performRequests_onImageData_withUniformTypeIdentifier_andIdentifier_error___block_invoke_83(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  uint64_t v11;
  unint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _DWORD v22[2];
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  MADSignpostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = *(_DWORD *)(a1 + 72);
    v11 = *(_QWORD *)(a1 + 32);
    v22[0] = 67109378;
    v22[1] = v10;
    v23 = 2112;
    v24 = v11;
    _os_signpost_emit_with_name_impl(&dword_1D461A000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_performRequestsOnImageDataSync", "Request: %d Identifier: %@", (uint8_t *)v22, 0x12u);
  }

  for (i = 0; i < objc_msgSend(*(id *)(a1 + 40), "count"); ++i)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "results");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setResults:", v15);

    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setError:", v18);

  }
  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __62__MADService_performRequests_onImageURL_withIdentifier_error___block_invoke_81_cold_1();
    v19 = objc_msgSend(v6, "copy");
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

  }
}

- (int)performRequests:(id)a3 videoURL:(id)a4 identifier:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  atomic<int> *p_requestID;
  uint64_t v18;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v28;
  void *v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  MADService *v34;
  id v35;
  id v36;
  os_signpost_id_t v37;
  int v38;
  _QWORD v39[5];
  id v40;
  int v41;
  id v42;
  uint8_t buf[4];
  int v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v31 = a5;
  v30 = a6;
  v14 = a7;
  v42 = 0;
  -[MADService sandboxExtensionForURL:error:](self, "sandboxExtensionForURL:error:", v13, &v42);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v42;
  v29 = v16;
  if (v15)
  {
    p_requestID = &self->_requestID;
    do
      v18 = __ldaxr((unsigned int *)p_requestID);
    while (__stlxr(v18 + 1, (unsigned int *)p_requestID));
    v28 = v12;
    MADSignpostLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_signpost_id_generate(v19);

    MADSignpostLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_DWORD *)buf = 67109378;
      v44 = v18;
      v45 = 2112;
      v46 = v31;
      _os_signpost_emit_with_name_impl(&dword_1D461A000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "MADService_performRequestsOnVideoURL", "Request: %d Identifier: %@", buf, 0x12u);
    }

    -[MADService addProgressHandler:forRequestID:](self, "addProgressHandler:forRequestID:", v30, v18);
    -[MADService connection](self, "connection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __84__MADService_performRequests_videoURL_identifier_progressHandler_completionHandler___block_invoke;
    v39[3] = &unk_1E97E2698;
    v39[4] = self;
    v41 = v18;
    v25 = v14;
    v40 = v25;
    objc_msgSend(v23, "remoteObjectProxyWithErrorHandler:", v39);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v24;
    v32[1] = 3221225472;
    v32[2] = __84__MADService_performRequests_videoURL_identifier_progressHandler_completionHandler___block_invoke_84;
    v32[3] = &unk_1E97E26C0;
    v37 = v20;
    v38 = v18;
    v33 = v31;
    v34 = self;
    v12 = v28;
    v35 = v28;
    v36 = v25;
    objc_msgSend(v26, "requestVideoProcessing:assetURL:sandboxToken:identifier:requestID:reply:", v35, v13, v15, v33, v18, v32);

  }
  else
  {
    LODWORD(v18) = -1;
    (*((void (**)(id, uint64_t, id))v14 + 2))(v14, 0xFFFFFFFFLL, v16);
  }

  return v18;
}

void __84__MADService_performRequests_videoURL_identifier_progressHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v4)
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  objc_msgSend(*(id *)(a1 + 32), "removeProgressHandlerForRequestID:", *(unsigned int *)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __84__MADService_performRequests_videoURL_identifier_progressHandler_completionHandler___block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  uint64_t v11;
  unint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _DWORD v18[2];
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  MADSignpostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = *(_DWORD *)(a1 + 72);
    v11 = *(_QWORD *)(a1 + 32);
    v18[0] = 67109378;
    v18[1] = v10;
    v19 = 2112;
    v20 = v11;
    _os_signpost_emit_with_name_impl(&dword_1D461A000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_performRequestsOnVideoURL", "Request: %d Identifier: %@", (uint8_t *)v18, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 40), "removeProgressHandlerForRequestID:", *(unsigned int *)(a1 + 72));
  for (i = 0; i < objc_msgSend(v5, "count"); ++i)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "results");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setResults:", v15);

    objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", i);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setError:", v17);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)cancelRequestID:(int)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)&a3;
  -[MADService connection](self, "connection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_85);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelRequest:", v3);

}

void __30__MADService_cancelRequestID___block_invoke()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v0)
    __30__MADService_cancelRequestID___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

- (void)cancelAllRequests
{
  void *v2;
  id v3;

  -[MADService connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_86);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelAllRequests");

}

void __31__MADService_cancelAllRequests__block_invoke()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v0)
    __30__MADService_cancelRequestID___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

- (unint64_t)currentOutstandingTasks
{
  void *v2;
  void *v3;
  unint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[MADService connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_87);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__MADService_currentOutstandingTasks__block_invoke_88;
  v6[3] = &unk_1E97E2748;
  v6[4] = &v7;
  objc_msgSend(v3, "currentOutstandingTasksWithReply:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __37__MADService_currentOutstandingTasks__block_invoke()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v0)
    __30__MADService_cancelRequestID___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

uint64_t __37__MADService_currentOutstandingTasks__block_invoke_88(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultHandlers, 0);
  objc_storeStrong((id *)&self->_resultHandlerQueue, 0);
  objc_storeStrong((id *)&self->_progressHandlers, 0);
  objc_storeStrong((id *)&self->_progressHandlerQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

- (int)performRequests:(id)a3 onAssetWithIdentifier:(id)a4 identifierType:(unint64_t)a5 fromPhotoLibraryWithURL:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  atomic<int> *p_requestID;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  os_signpost_id_t v36;
  int v37;
  _QWORD v38[4];
  id v39;
  int v40;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;
  _QWORD v44[3];

  v44[1] = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v12 = a4;
  v31 = a6;
  v13 = a7;
  if ((objc_msgSend((id)objc_opt_class(), "isEntitled") & 1) != 0)
  {
    p_requestID = &self->_requestID;
    do
      v15 = __ldaxr((unsigned int *)p_requestID);
    while (__stlxr(v15 + 1, (unsigned int *)p_requestID));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request: %d Identifier: (%lu)%@"), v15, a5, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    MADSignpostLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_signpost_id_generate(v17);

    MADSignpostLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v16;
      _os_signpost_emit_with_name_impl(&dword_1D461A000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "MADService_performRequestsOnAsset", "%@", buf, 0xCu);
    }

    -[MADService connection](self, "connection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __117__MADService_Photos__performRequests_onAssetWithIdentifier_identifierType_fromPhotoLibraryWithURL_completionHandler___block_invoke;
    v38[3] = &unk_1E97E25D0;
    v23 = v13;
    v39 = v23;
    v40 = v15;
    objc_msgSend(v21, "remoteObjectProxyWithErrorHandler:", v38);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v22;
    v32[1] = 3221225472;
    v32[2] = __117__MADService_Photos__performRequests_onAssetWithIdentifier_identifierType_fromPhotoLibraryWithURL_completionHandler___block_invoke_147;
    v32[3] = &unk_1E97E25F8;
    v36 = v18;
    v25 = v16;
    v33 = v25;
    v34 = v30;
    v35 = v23;
    v37 = v15;
    objc_msgSend(v24, "requestImageProcessing:forAssetWithIdentifier:identifierType:fromPhotoLibraryWithURL:requestID:andReply:", v34, v12, a5, v31, v15, v32);

    v26 = v39;
  }
  else
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v43 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Photos asset processing not available"));
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v44[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, void *))v13 + 2))(v13, 0xFFFFFFFFLL, v28);

    LODWORD(v15) = -1;
  }

  return v15;
}

void __117__MADService_Photos__performRequests_onAssetWithIdentifier_identifierType_fromPhotoLibraryWithURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v4)
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __117__MADService_Photos__performRequests_onAssetWithIdentifier_identifierType_fromPhotoLibraryWithURL_completionHandler___block_invoke_147(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  unint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  MADSignpostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v18 = 138412290;
    v19 = v10;
    _os_signpost_emit_with_name_impl(&dword_1D461A000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_performRequestsOnAsset", "%@", (uint8_t *)&v18, 0xCu);
  }

  for (i = 0; i < objc_msgSend(*(id *)(a1 + 40), "count"); ++i)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "results");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setResults:", v14);

    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setError:", v17);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (int)performRequests:(id)a3 onAssetWithLocalIdentifier:(id)a4 fromPhotoLibraryWithURL:(id)a5 completionHandler:(id)a6
{
  return -[MADService performRequests:onAssetWithIdentifier:identifierType:fromPhotoLibraryWithURL:completionHandler:](self, "performRequests:onAssetWithIdentifier:identifierType:fromPhotoLibraryWithURL:completionHandler:", a3, a4, 0, a5, a6);
}

- (BOOL)performRequests:(id)a3 onAssetWithIdentifier:(id)a4 identifierType:(unint64_t)a5 fromPhotoLibraryWithURL:(id)a6 error:(id *)a7
{
  id v12;
  atomic<int> *p_requestID;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint64_t *v33;
  __int128 *p_buf;
  os_signpost_id_t v35;
  int v36;
  _QWORD v37[6];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint8_t v42[4];
  int v43;
  __int128 buf;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v12 = a4;
  v29 = a6;
  if ((objc_msgSend((id)objc_opt_class(), "isEntitled") & 1) != 0)
  {
    p_requestID = &self->_requestID;
    do
      v14 = __ldaxr((unsigned int *)p_requestID);
    while (__stlxr(v14 + 1, (unsigned int *)p_requestID));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request: %d Identifier: (%lu)%@"), v14, a5, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    MADSignpostLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_signpost_id_generate(v16);

    MADSignpostLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_signpost_emit_with_name_impl(&dword_1D461A000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "MADService_performRequestsOnAssetSync", "%@", (uint8_t *)&buf, 0xCu);
    }

    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v41 = 1;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v45 = 0x3032000000;
    v46 = __Block_byref_object_copy_;
    v47 = __Block_byref_object_dispose_;
    v48 = 0;
    -[MADService connection](self, "connection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __105__MADService_Photos__performRequests_onAssetWithIdentifier_identifierType_fromPhotoLibraryWithURL_error___block_invoke;
    v37[3] = &unk_1E97E2648;
    v37[4] = &buf;
    v37[5] = &v38;
    objc_msgSend(v20, "synchronousRemoteObjectProxyWithErrorHandler:", v37);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v21;
    v30[1] = 3221225472;
    v30[2] = __105__MADService_Photos__performRequests_onAssetWithIdentifier_identifierType_fromPhotoLibraryWithURL_error___block_invoke_148;
    v30[3] = &unk_1E97E2670;
    v35 = v17;
    v23 = v15;
    v31 = v23;
    v32 = v28;
    v33 = &v38;
    v36 = v14;
    p_buf = &buf;
    objc_msgSend(v22, "requestImageProcessing:forAssetWithIdentifier:identifierType:fromPhotoLibraryWithURL:requestID:andReply:", v32, v12, a5, v29, v14, v30);

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v42 = 67109120;
      v43 = v14;
      _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MADService] Analysis returns for RequestID %d (synchronous)", v42, 8u);
    }
    if (a7)
    {
      v24 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      if (v24)
        *a7 = objc_retainAutorelease(v24);
    }
    LOBYTE(a7) = *((_BYTE *)v39 + 24) != 0;

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v38, 8);
    goto LABEL_15;
  }
  if (a7)
  {
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v49 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Photos asset processing not available"));
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v50[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v26);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a7) = 0;
LABEL_15:

  }
  return (char)a7;
}

void __105__MADService_Photos__performRequests_onAssetWithIdentifier_identifierType_fromPhotoLibraryWithURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v3 = a2;
  v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v4)
    __88__MADService_performRequests_onImageData_withUniformTypeIdentifier_andIdentifier_error___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = objc_msgSend(v3, "copy");
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

void __105__MADService_Photos__performRequests_onAssetWithIdentifier_identifierType_fromPhotoLibraryWithURL_error___block_invoke_148(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  unint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  MADSignpostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v21 = 138412290;
    v22 = v10;
    _os_signpost_emit_with_name_impl(&dword_1D461A000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_performRequestsOnAssetSync", "%@", (uint8_t *)&v21, 0xCu);
  }

  for (i = 0; i < objc_msgSend(*(id *)(a1 + 40), "count"); ++i)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "results");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setResults:", v14);

    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setError:", v17);

  }
  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __62__MADService_performRequests_onImageURL_withIdentifier_error___block_invoke_81_cold_1();
    v18 = objc_msgSend(v6, "copy");
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
}

- (BOOL)performRequests:(id)a3 onAssetWithSyndicationIdentifier:(id)a4 error:(id *)a5
{
  return -[MADService performRequests:onAssetWithIdentifier:identifierType:fromPhotoLibraryWithURL:error:](self, "performRequests:onAssetWithIdentifier:identifierType:fromPhotoLibraryWithURL:error:", a3, a4, 2, 0, a5);
}

- (BOOL)performRequests:(id)a3 assetLocalIdentifier:(id)a4 photoLibraryURL:(id)a5 error:(id *)a6
{
  return -[MADService performRequests:onAssetWithIdentifier:identifierType:fromPhotoLibraryWithURL:error:](self, "performRequests:onAssetWithIdentifier:identifierType:fromPhotoLibraryWithURL:error:", a3, a4, 0, a5, a6);
}

- (int)_performRequests:(id)a3 onIOSurface:(id)a4 withOrientation:(unsigned int)a5 assetLocalIdentifier:(id)a6 photoLibraryURL:(id)a7 completionHandler:(id)a8
{
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  atomic<int> *p_requestID;
  uint64_t v18;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  os_signpost_id_t v38;
  int v39;
  _QWORD v40[4];
  id v41;
  int v42;
  uint8_t buf[4];
  int v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v11 = *(_QWORD *)&a5;
  v47 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v33 = a4;
  v15 = a6;
  v16 = a7;
  v32 = a8;
  p_requestID = &self->_requestID;
  do
    v18 = __ldaxr((unsigned int *)p_requestID);
  while (__stlxr(v18 + 1, (unsigned int *)p_requestID));
  MADSignpostLog();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_signpost_id_generate(v19);

  MADSignpostLog();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_DWORD *)buf = 67109378;
    v44 = v18;
    v45 = 2112;
    v46 = v15;
    _os_signpost_emit_with_name_impl(&dword_1D461A000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "MADService_performRequestsOnAsset", "Request: %d Identifier: %@", buf, 0x12u);
  }

  -[MADService connection](self, "connection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v14;
  v25 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __122__MADService_Photos___performRequests_onIOSurface_withOrientation_assetLocalIdentifier_photoLibraryURL_completionHandler___block_invoke;
  v40[3] = &unk_1E97E25D0;
  v26 = v32;
  v41 = v26;
  v42 = v18;
  objc_msgSend(v23, "remoteObjectProxyWithErrorHandler:", v40);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v25;
  v34[1] = 3221225472;
  v34[2] = __122__MADService_Photos___performRequests_onIOSurface_withOrientation_assetLocalIdentifier_photoLibraryURL_completionHandler___block_invoke_149;
  v34[3] = &unk_1E97E25F8;
  v38 = v20;
  v39 = v18;
  v28 = v15;
  v35 = v28;
  v29 = v24;
  v36 = v29;
  v30 = v26;
  v37 = v30;
  objc_msgSend(v27, "requestImageProcessing:forIOSurface:withOrientation:assetLocalIdentifier:photoLibraryURL:requestID:andReply:", v29, v33, v11, v28, v16, v18, v34);

  return v18;
}

void __122__MADService_Photos___performRequests_onIOSurface_withOrientation_assetLocalIdentifier_photoLibraryURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v4)
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __122__MADService_Photos___performRequests_onIOSurface_withOrientation_assetLocalIdentifier_photoLibraryURL_completionHandler___block_invoke_149(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  uint64_t v11;
  unint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _DWORD v19[2];
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  MADSignpostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = *(_DWORD *)(a1 + 64);
    v11 = *(_QWORD *)(a1 + 32);
    v19[0] = 67109378;
    v19[1] = v10;
    v20 = 2112;
    v21 = v11;
    _os_signpost_emit_with_name_impl(&dword_1D461A000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_performRequestsOnAsset", "Request: %d Identifier: %@", (uint8_t *)v19, 0x12u);
  }

  for (i = 0; i < objc_msgSend(*(id *)(a1 + 40), "count"); ++i)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "results");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setResults:", v15);

    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setError:", v18);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (int)performRequests:(id)a3 onPixelBuffer:(__CVBuffer *)a4 withOrientation:(unsigned int)a5 assetLocalIdentifier:(id)a6 photoLibraryURL:(id)a7 completionHandler:(id)a8
{
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  void (**v17)(id, uint64_t, void *);
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v11 = *(_QWORD *)&a5;
  v29[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = (void (**)(id, uint64_t, void *))a8;
  if ((objc_msgSend((id)objc_opt_class(), "isEntitled") & 1) == 0)
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Photos asset processing not available"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2](v17, 0xFFFFFFFFLL, v22);
LABEL_6:

    v19 = -1;
    goto LABEL_7;
  }
  CVPixelBufferGetIOSurface(a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CVPixelBuffer must be IOSurface-backed"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2](v17, 0xFFFFFFFFLL, v24);

    goto LABEL_6;
  }
  v19 = -[MADService _performRequests:onIOSurface:withOrientation:assetLocalIdentifier:photoLibraryURL:completionHandler:](self, "_performRequests:onIOSurface:withOrientation:assetLocalIdentifier:photoLibraryURL:completionHandler:", v14, v18, v11, v15, v16, v17);
LABEL_7:

  return v19;
}

- (int)performRequests:(id)a3 onCGImage:(CGImage *)a4 withOrientation:(unsigned int)a5 assetLocalIdentifier:(id)a6 photoLibraryURL:(id)a7 completionHandler:(id)a8
{
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  void (**v17)(id, uint64_t, void *);
  unsigned int v18;
  CGImagePropertyOrientation v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CVPixelBufferRef pixelBuffer;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];

  v11 = *(_QWORD *)&a5;
  v34[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = (void (**)(id, uint64_t, void *))a8;
  if ((objc_msgSend((id)objc_opt_class(), "isEntitled") & 1) == 0)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Photos asset processing not available"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2](v17, 0xFFFFFFFFLL, v24);

    goto LABEL_5;
  }
  CGImageGetProperty();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    pixelBuffer = 0;
    if (!CGImage_CreateCVPixelBufferWithTransform(a4, &pixelBuffer, v18, v19, 1.0))
    {
      CVPixelBufferGetIOSurface(pixelBuffer);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      CF<CGColorSpace *>::~CF((const void **)&pixelBuffer);
      goto LABEL_3;
    }
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to transfer CGImage to IOSurface"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2](v17, 0xFFFFFFFFLL, v29);

    CF<CGColorSpace *>::~CF((const void **)&pixelBuffer);
    v20 = 0;
LABEL_5:
    v21 = -1;
    goto LABEL_6;
  }
LABEL_3:
  v21 = -[MADService _performRequests:onIOSurface:withOrientation:assetLocalIdentifier:photoLibraryURL:completionHandler:](self, "_performRequests:onIOSurface:withOrientation:assetLocalIdentifier:photoLibraryURL:completionHandler:", v14, v20, v11, v15, v16, v17);
LABEL_6:

  return v21;
}

- (int)performRequests:(id)a3 onAssetWithCloudIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  atomic<int> *p_requestID;
  void *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  os_signpost_id_t v29;
  int v30;
  _QWORD v31[4];
  id v32;
  int v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  id v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend((id)objc_opt_class(), "isEntitled") & 1) != 0)
  {
    p_requestID = &self->_requestID;
    do
      v12 = (void *)__ldaxr((unsigned int *)p_requestID);
    while (__stlxr((_DWORD)v12 + 1, (unsigned int *)p_requestID));
    MADSignpostLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_signpost_id_generate(v13);

    MADSignpostLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_DWORD *)buf = 67109378;
      v35 = (int)v12;
      v36 = 2112;
      v37 = v9;
      _os_signpost_emit_with_name_impl(&dword_1D461A000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "MADService_performRequestsOnAsset", "Request: %d cloudIdentifier: %@", buf, 0x12u);
    }

    -[MADService connection](self, "connection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __83__MADService_Photos__performRequests_onAssetWithCloudIdentifier_completionHandler___block_invoke;
    v31[3] = &unk_1E97E25D0;
    v19 = v10;
    v32 = v19;
    v33 = (int)v12;
    objc_msgSend(v17, "remoteObjectProxyWithErrorHandler:", v31);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v18;
    v25[1] = 3221225472;
    v25[2] = __83__MADService_Photos__performRequests_onAssetWithCloudIdentifier_completionHandler___block_invoke_152;
    v25[3] = &unk_1E97E25F8;
    v29 = v14;
    v30 = (int)v12;
    v26 = v9;
    v27 = v8;
    v28 = v19;
    objc_msgSend(v20, "requestImageProcessing:forAssetWithCloudIdentifier:requestID:andReply:", v27, v26, v12, v25);

    v21 = v32;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v38 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Photos asset processing not available"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, void *))v10 + 2))(v10, 0xFFFFFFFFLL, v23);

    LODWORD(v12) = -1;
  }

  return (int)v12;
}

void __83__MADService_Photos__performRequests_onAssetWithCloudIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v4)
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __83__MADService_Photos__performRequests_onAssetWithCloudIdentifier_completionHandler___block_invoke_152(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  uint64_t v11;
  unint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _DWORD v19[2];
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  MADSignpostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = *(_DWORD *)(a1 + 64);
    v11 = *(_QWORD *)(a1 + 32);
    v19[0] = 67109378;
    v19[1] = v10;
    v20 = 2112;
    v21 = v11;
    _os_signpost_emit_with_name_impl(&dword_1D461A000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_performRequestsOnAsset", "Request: %d cloudIdentifier: %@", (uint8_t *)v19, 0x12u);
  }

  for (i = 0; i < objc_msgSend(*(id *)(a1 + 40), "count"); ++i)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "results");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setResults:", v15);

    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setError:", v18);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (int)performRequestsWithCloudIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  atomic<int> *p_requestID;
  void *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  os_signpost_id_t v25;
  int v26;
  _QWORD v27[4];
  id v28;
  int v29;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "isEntitled") & 1) != 0)
  {
    p_requestID = &self->_requestID;
    do
      v9 = (void *)__ldaxr((unsigned int *)p_requestID);
    while (__stlxr((_DWORD)v9 + 1, (unsigned int *)p_requestID));
    MADSignpostLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_signpost_id_generate(v10);

    MADSignpostLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_DWORD *)buf = 67109376;
      v31 = (int)v9;
      v32 = 2048;
      v33 = objc_msgSend(v6, "count");
      _os_signpost_emit_with_name_impl(&dword_1D461A000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "MADService_performRequestsOnAsset", "[MADService RequestID %d]: %lu cloudIdentifiers", buf, 0x12u);
    }

    -[MADService connection](self, "connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __76__MADService_Photos__performRequestsWithCloudIdentifiers_completionHandler___block_invoke;
    v27[3] = &unk_1E97E25D0;
    v16 = v7;
    v28 = v16;
    v29 = (int)v9;
    objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __76__MADService_Photos__performRequestsWithCloudIdentifiers_completionHandler___block_invoke_153;
    v22[3] = &unk_1E97E2798;
    v25 = v11;
    v26 = (int)v9;
    v23 = v6;
    v24 = v16;
    objc_msgSend(v17, "requestImageProcessingWithCloudIdentifierRequests:requestID:andReply:", v23, v9, v22);

    v18 = v28;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Photos asset processing not available"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, void *))v7 + 2))(v7, 0xFFFFFFFFLL, v20);

    LODWORD(v9) = -1;
  }

  return (int)v9;
}

void __76__MADService_Photos__performRequestsWithCloudIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v4)
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __76__MADService_Photos__performRequestsWithCloudIdentifiers_completionHandler___block_invoke_153(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  MADSignpostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 48);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = *(_DWORD *)(a1 + 56);
    v11 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 67109376;
    v17 = v10;
    v18 = 2048;
    v19 = v11;
    _os_signpost_emit_with_name_impl(&dword_1D461A000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_performRequestsOnAsset", "[MADService RequestID %d]: %lu cloudIdentifiers", buf, 0x12u);
  }

  v12 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__MADService_Photos__performRequestsWithCloudIdentifiers_completionHandler___block_invoke_154;
  v14[3] = &unk_1E97E2770;
  v13 = v5;
  v15 = v13;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v14);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __76__MADService_Photos__performRequestsWithCloudIdentifiers_completionHandler___block_invoke_154(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  for (i = 0; i < objc_msgSend(v5, "count"); ++i)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", i);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "results");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setResults:", v10);

    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setError:", v14);

  }
}

- (int)performRequests:(id)a3 assetLocalIdentifier:(id)a4 photoLibraryURL:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  atomic<int> *p_requestID;
  void *v15;
  void *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  MADService *v35;
  id v36;
  id v37;
  os_signpost_id_t v38;
  int v39;
  _QWORD v40[5];
  id v41;
  int v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;
  _QWORD v46[3];

  v46[1] = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v32 = a4;
  v12 = a5;
  v31 = a6;
  v13 = a7;
  if ((objc_msgSend((id)objc_opt_class(), "isEntitled") & 1) != 0)
  {
    p_requestID = &self->_requestID;
    do
      v15 = (void *)__ldaxr((unsigned int *)p_requestID);
    while (__stlxr((_DWORD)v15 + 1, (unsigned int *)p_requestID));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request: %d Identifier: %@ (%lu)"), v15, v32, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    MADSignpostLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_signpost_id_generate(v17);

    MADSignpostLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v16;
      _os_signpost_emit_with_name_impl(&dword_1D461A000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "MADService_performRequestsOnVideoAsset", "%@", buf, 0xCu);
    }

    -[MADService addProgressHandler:forRequestID:](self, "addProgressHandler:forRequestID:", v31, v15);
    -[MADService connection](self, "connection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v12;
    v23 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __109__MADService_Photos__performRequests_assetLocalIdentifier_photoLibraryURL_progressHandler_completionHandler___block_invoke;
    v40[3] = &unk_1E97E2698;
    v40[4] = self;
    v42 = (int)v15;
    v24 = v13;
    v41 = v24;
    objc_msgSend(v21, "remoteObjectProxyWithErrorHandler:", v40);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v23;
    v33[1] = 3221225472;
    v33[2] = __109__MADService_Photos__performRequests_assetLocalIdentifier_photoLibraryURL_progressHandler_completionHandler___block_invoke_159;
    v33[3] = &unk_1E97E26C0;
    v38 = v18;
    v26 = v16;
    v34 = v26;
    v35 = self;
    v39 = (int)v15;
    v36 = v30;
    v37 = v24;
    v12 = v22;
    objc_msgSend(v25, "requestVideoProcessing:assetIdentifier:identifierType:photoLibraryURL:requestID:isIncremental:reply:", v36, v32, 0, v22, v15, 0, v33);

  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v45 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Photos asset processing not available"));
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v46[0] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, void *))v13 + 2))(v13, 0xFFFFFFFFLL, v28);

    LODWORD(v15) = -1;
  }

  return (int)v15;
}

void __109__MADService_Photos__performRequests_assetLocalIdentifier_photoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v4)
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  objc_msgSend(*(id *)(a1 + 32), "removeProgressHandlerForRequestID:", *(unsigned int *)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __109__MADService_Photos__performRequests_assetLocalIdentifier_photoLibraryURL_progressHandler_completionHandler___block_invoke_159(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  unint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  MADSignpostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v17 = 138412290;
    v18 = v10;
    _os_signpost_emit_with_name_impl(&dword_1D461A000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_performRequestsOnVideoAsset", "%@", (uint8_t *)&v17, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "removeProgressHandlerForRequestID:", *(unsigned int *)(a1 + 72));
  for (i = 0; i < objc_msgSend(v5, "count"); ++i)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "results");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setResults:", v14);

    objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", i);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "error");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setError:", v16);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (int)performRequests:(id)a3 assetLocalIdentifier:(id)a4 photoLibraryURL:(id)a5 progressHandler:(id)a6 resultHandler:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  atomic<int> *p_requestID;
  uint64_t v17;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  MADService *v41;
  id v42;
  os_signpost_id_t v43;
  int v44;
  _QWORD v45[5];
  id v46;
  int v47;
  _QWORD v48[4];
  id v49;
  id v50;
  int v51;
  uint8_t buf[4];
  void *v53;
  uint64_t v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v38 = a4;
  v14 = a5;
  v36 = a6;
  v37 = a7;
  v15 = a8;
  if ((objc_msgSend((id)objc_opt_class(), "isEntitled") & 1) != 0)
  {
    p_requestID = &self->_requestID;
    do
      v17 = __ldaxr((unsigned int *)p_requestID);
    while (__stlxr(v17 + 1, (unsigned int *)p_requestID));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request: %d Identifier: %@ (%lu)"), v17, v38, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v14;
    MADSignpostLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_signpost_id_generate(v18);

    MADSignpostLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v34;
      _os_signpost_emit_with_name_impl(&dword_1D461A000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "MADService_performRequestsOnVideoAsset", "%@", buf, 0xCu);
    }

    -[MADService addProgressHandler:forRequestID:](self, "addProgressHandler:forRequestID:", v36, v17);
    v22 = MEMORY[0x1E0C809B0];
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __123__MADService_Photos__performRequests_assetLocalIdentifier_photoLibraryURL_progressHandler_resultHandler_completionHandler___block_invoke;
    v48[3] = &unk_1E97E27C0;
    v23 = v35;
    v49 = v23;
    v51 = v17;
    v50 = v37;
    v24 = (void *)MEMORY[0x1D825F508](v48);
    -[MADService addResultHandler:forRequestID:](self, "addResultHandler:forRequestID:", v24, v17);
    -[MADService connection](self, "connection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v22;
    v45[1] = 3221225472;
    v45[2] = __123__MADService_Photos__performRequests_assetLocalIdentifier_photoLibraryURL_progressHandler_resultHandler_completionHandler___block_invoke_160;
    v45[3] = &unk_1E97E2698;
    v45[4] = self;
    v47 = v17;
    v26 = v15;
    v46 = v26;
    objc_msgSend(v25, "remoteObjectProxyWithErrorHandler:", v45);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v22;
    v39[1] = 3221225472;
    v39[2] = __123__MADService_Photos__performRequests_assetLocalIdentifier_photoLibraryURL_progressHandler_resultHandler_completionHandler___block_invoke_161;
    v39[3] = &unk_1E97E25F8;
    v43 = v19;
    v28 = v34;
    v40 = v28;
    v41 = self;
    v44 = v17;
    v42 = v26;
    v14 = v33;
    objc_msgSend(v27, "requestVideoProcessing:assetIdentifier:identifierType:photoLibraryURL:requestID:isIncremental:reply:", v23, v38, 0, v33, v17, 1, v39);

    v29 = v49;
  }
  else
  {
    v30 = (void *)MEMORY[0x1E0CB35C8];
    v54 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Photos asset processing not available"));
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v55[0] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, void *))v15 + 2))(v15, 0xFFFFFFFFLL, v31);

    LODWORD(v17) = -1;
  }

  return v17;
}

void __123__MADService_Photos__performRequests_assetLocalIdentifier_photoLibraryURL_progressHandler_resultHandler_completionHandler___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count") >= a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "results");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setResults:", v7);

    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setError:", v9);

    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
    {
      v11 = *(unsigned int *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v10 + 16))(v10, v11, v12);

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    __123__MADService_Photos__performRequests_assetLocalIdentifier_photoLibraryURL_progressHandler_resultHandler_completionHandler___block_invoke_cold_1(a3, a1);
  }

}

void __123__MADService_Photos__performRequests_assetLocalIdentifier_photoLibraryURL_progressHandler_resultHandler_completionHandler___block_invoke_160(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v4)
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  objc_msgSend(*(id *)(a1 + 32), "removeProgressHandlerForRequestID:", *(unsigned int *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "removeResultHandlerForRequestID:", *(unsigned int *)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __123__MADService_Photos__performRequests_assetLocalIdentifier_photoLibraryURL_progressHandler_resultHandler_completionHandler___block_invoke_161(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MADSignpostLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 56);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412290;
    v10 = v8;
    _os_signpost_emit_with_name_impl(&dword_1D461A000, v6, OS_SIGNPOST_INTERVAL_END, v7, "MADService_performRequestsOnVideoAsset", "%@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "removeProgressHandlerForRequestID:", *(unsigned int *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 40), "removeResultHandlerForRequestID:", *(unsigned int *)(a1 + 64));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (BOOL)_isEntitledForVUIndexAccess
{
  if (+[MADService(Photos) _isEntitledForVUIndexAccess]::onceToken != -1)
    dispatch_once(&+[MADService(Photos) _isEntitledForVUIndexAccess]::onceToken, &__block_literal_global_162);
  return +[MADService(Photos) _isEntitledForVUIndexAccess]::entitled;
}

const void **__49__MADService_Photos___isEntitledForVUIndexAccess__block_invoke()
{
  SecTaskRef v0;
  CFTypeRef v1;
  CFTypeID v2;
  BOOL v3;
  const char *v4;
  SecTaskRef v6;
  _BYTE cf1[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v0 = SecTaskCreateFromSelf(0);
  v6 = v0;
  if (v0)
  {
    v1 = SecTaskCopyValueForEntitlement(v0, CFSTR("com.apple.private.mediaanalysisd.datamanagement.vuindex"), 0);
    *(_QWORD *)cf1 = v1;
    v3 = v1
      && (v2 = CFGetTypeID(v1), v2 == CFBooleanGetTypeID())
      && CFEqual(*(CFTypeRef *)cf1, (CFTypeRef)*MEMORY[0x1E0C9AE50]) != 0;
    +[MADService(Photos) _isEntitledForVUIndexAccess]::entitled = v3;
    CF<CGColorSpace *>::~CF((const void **)cf1);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    if (+[MADService(Photos) _isEntitledForVUIndexAccess]::entitled)
      v4 = "Entitled";
    else
      v4 = "Not entitled";
    *(_DWORD *)cf1 = 136315138;
    *(_QWORD *)&cf1[4] = v4;
    _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Process is %s for VU Index access", cf1, 0xCu);
  }
  return CF<CGColorSpace *>::~CF((const void **)&v6);
}

- (id)requestVUIndexURLForSystemPhotosLibraryWithError:(id *)a3
{
  -[MADService requestVUIndexURLForPhotoLibraryURL:error:](self, "requestVUIndexURLForPhotoLibraryURL:error:", 0, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)requestVUIndexURLForPhotoLibraryURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "_isEntitledForVUIndexAccess") & 1) != 0)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy_;
    v27 = __Block_byref_object_dispose_;
    v28 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    v22 = 0;
    -[MADService connection](self, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke;
    v16[3] = &unk_1E97E2808;
    v16[4] = &v17;
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke_167;
    v15[3] = &unk_1E97E2830;
    v15[4] = &v23;
    v15[5] = &v17;
    objc_msgSend(v9, "requestVisionCacheStorageDirectoryURLForPhotoLibraryURL:reply:", v6, v15);

    if (a4)
    {
      v10 = (void *)v18[5];
      if (v10)
        *a4 = (id)objc_msgSend(v10, "copy");
    }
    a4 = (id *)(id)v24[5];
    _Block_object_dispose(&v17, 8);

    _Block_object_dispose(&v23, 8);
  }
  else if (a4)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Process is not entitled! exiting ..."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -19, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

void __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke_cold_1();
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke_167(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7 && v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v7;
      _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MADService] Packaging VU Index directory secure URL %@", buf, 0xCu);
    }
    MEMORY[0x1D825F2A4](v7, v8);
    v10 = objc_msgSend(v7, "startAccessingSecurityScopedResource");
    objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("VUIndex.sqlite"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "fileExistsAtPath:", v12);

    if (v10)
      objc_msgSend(v7, "stopAccessingSecurityScopedResource");
    if (v14)
    {
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v16 = v7;
      v17 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v16;
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VUIndex file does not exist"), *MEMORY[0x1E0CB2D50]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v22);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v25 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = v23;

      v26 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v26)
        __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke_167_cold_1(v26, v27, v28, v29, v30, v31, v32, v33);
      v34 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v17 = *(void **)(v34 + 40);
      *(_QWORD *)(v34 + 40) = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke_167_cold_2();
    v18 = objc_msgSend(v9, "copy");
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;
  }

}

- (int64_t)queryVUIndexAssetCountForType:(int64_t)a3 photoLibraryURL:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "_isEntitledForVUIndexAccess") & 1) != 0)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 0;
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy_;
    v23 = __Block_byref_object_dispose_;
    v24 = 0;
    -[MADService connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __74__MADService_Photos__queryVUIndexAssetCountForType_photoLibraryURL_error___block_invoke;
    v18[3] = &unk_1E97E2808;
    v18[4] = &v19;
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __74__MADService_Photos__queryVUIndexAssetCountForType_photoLibraryURL_error___block_invoke_176;
    v17[3] = &unk_1E97E2858;
    v17[4] = &v19;
    v17[5] = &v25;
    objc_msgSend(v11, "queryVUIndexAssetCountForType:photoLibraryURL:reply:", a3, v8, v17);

    if (a5)
    {
      v12 = (void *)v20[5];
      if (v12)
        *a5 = (id)objc_msgSend(v12, "copy");
    }
    a5 = (id *)v26[3];
    _Block_object_dispose(&v19, 8);

    _Block_object_dispose(&v25, 8);
  }
  else if (a5)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Process is not entitled to query VU index asset count! exiting ..."));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -19, v15);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }

  return (int64_t)a5;
}

void __74__MADService_Photos__queryVUIndexAssetCountForType_photoLibraryURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke_cold_1();
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __74__MADService_Photos__queryVUIndexAssetCountForType_photoLibraryURL_error___block_invoke_176(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __74__MADService_Photos__queryVUIndexAssetCountForType_photoLibraryURL_error___block_invoke_176_cold_1();
    v6 = objc_msgSend(v5, "copy");
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (int)queryVUIndexLastFullModeClusterDate:(id *)a3 photoLibraryURL:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  if (a3)
    *a3 = 0;
  -[MADService connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __80__MADService_Photos__queryVUIndexLastFullModeClusterDate_photoLibraryURL_error___block_invoke;
  v17[3] = &unk_1E97E2808;
  v17[4] = &v18;
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __80__MADService_Photos__queryVUIndexLastFullModeClusterDate_photoLibraryURL_error___block_invoke_178;
  v16[3] = &unk_1E97E2880;
  v16[4] = &v18;
  v16[5] = &v24;
  objc_msgSend(v11, "queryVUIndexLastFullModeClusterDateWithPhotoLibraryURL:reply:", v8, v16);

  if (a3)
  {
    v12 = (void *)v25[5];
    if (v12)
      *a3 = objc_retainAutorelease(v12);
  }
  v13 = 0;
  if (a5)
  {
    v14 = (void *)v19[5];
    if (v14)
    {
      v13 = objc_msgSend(v14, "code");
      *a5 = (id)objc_msgSend((id)v19[5], "copy");
    }
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v13;
}

void __80__MADService_Photos__queryVUIndexLastFullModeClusterDate_photoLibraryURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke_cold_1();
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __80__MADService_Photos__queryVUIndexLastFullModeClusterDate_photoLibraryURL_error___block_invoke_178(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __80__MADService_Photos__queryVUIndexLastFullModeClusterDate_photoLibraryURL_error___block_invoke_178_cold_1();
    v8 = objc_msgSend(v7, "copy");
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (id)requestApplicationDataFolderIdentifierVisionServiceWithPhotosLibraryURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  -[MADService connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __100__MADService_Photos__requestApplicationDataFolderIdentifierVisionServiceWithPhotosLibraryURL_error___block_invoke;
  v14[3] = &unk_1E97E2808;
  v14[4] = &v15;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __100__MADService_Photos__requestApplicationDataFolderIdentifierVisionServiceWithPhotosLibraryURL_error___block_invoke_180;
  v13[3] = &unk_1E97E2830;
  v13[4] = &v21;
  v13[5] = &v15;
  objc_msgSend(v9, "requestVisionCacheStorageDirectoryURLForPhotoLibraryURL:reply:", v6, v13);

  if (a4)
  {
    v10 = (void *)v16[5];
    if (v10)
      *a4 = (id)objc_msgSend(v10, "copy");
  }
  v11 = (id)v22[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __100__MADService_Photos__requestApplicationDataFolderIdentifierVisionServiceWithPhotosLibraryURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke_cold_1();
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __100__MADService_Photos__requestApplicationDataFolderIdentifierVisionServiceWithPhotosLibraryURL_error___block_invoke_180(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7 && v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v15 = 138412290;
      v16 = v7;
      _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MADService] Packaging directory secure URL %@", (uint8_t *)&v15, 0xCu);
    }
    MEMORY[0x1D825F2A4](v7, v8);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = v7;
    v12 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v11;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke_167_cold_2();
    v13 = objc_msgSend(v9, "copy");
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;
  }

}

- (id)queryPerformanceMeasurements
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[MADService connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_211);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__MADService_Performance__queryPerformanceMeasurements__block_invoke_212;
  v6[3] = &unk_1E97E28C8;
  v6[4] = &v7;
  objc_msgSend(v3, "queryPerformanceMeasurementsWithReply:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __55__MADService_Performance__queryPerformanceMeasurements__block_invoke()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v0)
    __30__MADService_cancelRequestID___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

void __55__MADService_Performance__queryPerformanceMeasurements__block_invoke_212(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)resetPerformanceMeasurements
{
  void *v2;
  id v3;

  -[MADService connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_214);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetPerformanceMeasurements");

}

void __55__MADService_Performance__resetPerformanceMeasurements__block_invoke()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v0)
    __30__MADService_cancelRequestID___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

+ (NSString)serviceName
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v2)
    +[MADService(ProtocolDefaults) serviceName].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
  return 0;
}

+ (Protocol)serverProtocol
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v2)
    +[MADService(ProtocolDefaults) serviceName].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
  return 0;
}

+ (NSSet)allowedClasses
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v2)
    +[MADService(ProtocolDefaults) serviceName].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
  return 0;
}

+ (NSSet)allowedVideoRequestClasses
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v2)
    +[MADService(ProtocolDefaults) serviceName].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
  return 0;
}

+ (NSSet)allowedVideoResultClasses
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v2)
    +[MADService(ProtocolDefaults) serviceName].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
  return 0;
}

+ (id)allowedTextRequestClasses
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v2)
    +[MADService(ProtocolDefaults) serviceName].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
  return 0;
}

+ (id)allowedTextResultClasses
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v2)
    +[MADService(ProtocolDefaults) serviceName].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
  return 0;
}

+ (NSSet)allowedMultiModalRequestClasses
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v2)
    +[MADService(ProtocolDefaults) serviceName].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
  return 0;
}

+ (NSSet)allowedMultiModalInputClasses
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (NSSet)allowedMultiModalResultClasses
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (id)userSafetyEnabled:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  -[MADService connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_245);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__MADService_UserSafety__userSafetyEnabled___block_invoke_246;
  v9[3] = &unk_1E97E2930;
  v9[4] = &v16;
  v9[5] = &v10;
  objc_msgSend(v5, "queryUserSafetyEnablement:", v9);

  if (a3)
  {
    v6 = (void *)v11[5];
    if (v6)
      *a3 = (id)objc_msgSend(v6, "copy");
  }
  v7 = (void *)objc_msgSend((id)v17[5], "copy");
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

void __44__MADService_UserSafety__userSafetyEnabled___block_invoke()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v0)
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

void __44__MADService_UserSafety__userSafetyEnabled___block_invoke_246(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)startEntryPointWithQueryID:(unint64_t)a3
{
  void *v4;
  id v5;

  -[MADService connection](self, "connection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_250);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startEntryPointWithQueryID:", a3);

}

void __54__MADService_VIAnalytics__startEntryPointWithQueryID___block_invoke()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v0)
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

- (void)startEntryPointWithQueryID:(unint64_t)a3 andEvent:(unint64_t)a4
{
  void *v6;
  id v7;

  -[MADService connection](self, "connection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_251);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startEntryPointWithQueryID:andEvent:", a3, a4);

}

void __63__MADService_VIAnalytics__startEntryPointWithQueryID_andEvent___block_invoke()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v0)
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

- (void)cacheHitWithQueryID:(unint64_t)a3 cachedResultQueryID:(unint64_t)a4
{
  void *v6;
  id v7;

  -[MADService connection](self, "connection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_252);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cacheHitWithQueryID:cachedResultQueryID:", a3, a4);

}

void __67__MADService_VIAnalytics__cacheHitWithQueryID_cachedResultQueryID___block_invoke()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v0)
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

- (void)cacheHitWithQueryID:(unint64_t)a3 cachedResultQueryID:(unint64_t)a4 engagementSuggestionType:(id)a5
{
  void *v8;
  void *v9;
  id v10;

  v10 = a5;
  -[MADService connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_253);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cacheHitWithQueryID:cachedResultQueryID:engagementSuggestionType:", a3, a4, v10);

}

void __92__MADService_VIAnalytics__cacheHitWithQueryID_cachedResultQueryID_engagementSuggestionType___block_invoke()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v0)
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

- (void)endEntryPoint
{
  void *v2;
  id v3;

  -[MADService connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_254);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endEntryPoint");

}

void __40__MADService_VIAnalytics__endEntryPoint__block_invoke()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v0)
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

- (int)prewarmTextRequests:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  atomic<int> *p_requestID;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  os_signpost_id_t v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  p_requestID = &self->_requestID;
  do
    v9 = __ldaxr((unsigned int *)p_requestID);
  while (__stlxr(v9 + 1, (unsigned int *)p_requestID));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request: %d"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  MADSignpostLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  MADSignpostLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v10;
    _os_signpost_emit_with_name_impl(&dword_1D461A000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "MADService_PrewarmTextRequest", "%@", buf, 0xCu);
  }

  v15 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __63__MADService_Spotlight__prewarmTextRequests_completionHandler___block_invoke;
  v25[3] = &unk_1E97E29D8;
  v28 = v12;
  v16 = v10;
  v26 = v16;
  v17 = v7;
  v27 = v17;
  v18 = (void *)MEMORY[0x1D825F508](v25);
  -[MADService connection](self, "connection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __63__MADService_Spotlight__prewarmTextRequests_completionHandler___block_invoke_266;
  v23[3] = &unk_1E97E2A00;
  v20 = v18;
  v24 = v20;
  objc_msgSend(v19, "remoteObjectProxyWithErrorHandler:", v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "requestTextPrewarming:requestID:reply:", v6, v9, v20);

  return v9;
}

void __63__MADService_Spotlight__prewarmTextRequests_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MADSignpostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = a1[6];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = a1[4];
    v8 = 138412290;
    v9 = v7;
    _os_signpost_emit_with_name_impl(&dword_1D461A000, v5, OS_SIGNPOST_INTERVAL_END, v6, "MADService_PrewarmTextRequest", "%@", (uint8_t *)&v8, 0xCu);
  }

  if (v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "description");
    objc_claimAutoreleasedReturnValue();
    __63__MADService_Spotlight__prewarmTextRequests_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(a1[5] + 16))();

}

void __63__MADService_Spotlight__prewarmTextRequests_completionHandler___block_invoke_266(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v11 = *MEMORY[0x1E0CB2D50];
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Error connecting to analysis service (%@)"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v10);

}

- (int)performRequests:(id)a3 textInputs:(id)a4 completionHandler:(id)a5
{
  id v8;
  atomic<int> *p_requestID;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  os_signpost_id_t v33;
  int v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v8 = a4;
  v26 = a5;
  p_requestID = &self->_requestID;
  do
    v10 = __ldaxr((unsigned int *)p_requestID);
  while (__stlxr(v10 + 1, (unsigned int *)p_requestID));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request: %d"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MADSignpostLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);

  MADSignpostLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v11;
    _os_signpost_emit_with_name_impl(&dword_1D461A000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "MADService_ProcessTextRequest", "%@", buf, 0xCu);
  }

  v16 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __70__MADService_Spotlight__performRequests_textInputs_completionHandler___block_invoke;
  v29[3] = &unk_1E97E25F8;
  v33 = v13;
  v17 = v11;
  v30 = v17;
  v18 = v25;
  v31 = v18;
  v19 = v26;
  v32 = v19;
  v34 = v10;
  v20 = (void *)MEMORY[0x1D825F508](v29);
  -[MADService connection](self, "connection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v16;
  v27[1] = 3221225472;
  v27[2] = __70__MADService_Spotlight__performRequests_textInputs_completionHandler___block_invoke_269;
  v27[3] = &unk_1E97E2A00;
  v22 = v20;
  v28 = v22;
  objc_msgSend(v21, "remoteObjectProxyWithErrorHandler:", v27);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "requestTextProcessing:textInputs:requestID:reply:", v18, v8, v10, v22);

  return v10;
}

void __70__MADService_Spotlight__performRequests_textInputs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  unint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  MADSignpostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v18 = 138412290;
    v19 = v10;
    _os_signpost_emit_with_name_impl(&dword_1D461A000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_ProcessTextRequest", "%@", (uint8_t *)&v18, 0xCu);
  }

  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "description");
      objc_claimAutoreleasedReturnValue();
      __63__MADService_Spotlight__prewarmTextRequests_completionHandler___block_invoke_cold_1();
    }
  }
  else
  {
    for (i = 0; i < objc_msgSend(v5, "count"); ++i)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "results");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setResults:", v14);

      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "error");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setError:", v17);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __70__MADService_Spotlight__performRequests_textInputs_completionHandler___block_invoke_269(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v11 = *MEMORY[0x1E0CB2D50];
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Error connecting to analysis service (%@)"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v10);

}

- (int)performRequests:(id)a3 text:(id)a4 identifier:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  MADTextInput *v17;
  int v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v13);
        v17 = -[MADTextInput initWithText:]([MADTextInput alloc], "initWithText:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16));
        objc_msgSend(v12, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  v18 = -[MADService performRequests:textInputs:completionHandler:](self, "performRequests:textInputs:completionHandler:", v9, v12, v11);
  return v18;
}

- (void)submitSpotlightAssetURL:(id)a3 uniqueIdentifier:(id)a4 bundleIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v35 = a4;
  v36 = a5;
  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __101__MADService_Spotlight__submitSpotlightAssetURL_uniqueIdentifier_bundleIdentifier_completionHandler___block_invoke;
  v42[3] = &unk_1E97E2A00;
  v13 = v11;
  v43 = v13;
  v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D825F508](v42);
  v41 = 0;
  v15 = *MEMORY[0x1E0C998E0];
  v40 = 0;
  LOBYTE(a6) = objc_msgSend(v10, "getResourceValue:forKey:error:", &v41, v15, &v40);
  v16 = v41;
  v17 = v40;
  v18 = v17;
  if ((a6 & 1) != 0)
  {
    v39 = v17;
    -[MADService sandboxExtensionForURL:error:](self, "sandboxExtensionForURL:error:", v10, &v39);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v39;

    if (v19)
    {
      -[MADService connection](self, "connection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v12;
      v37[1] = 3221225472;
      v37[2] = __101__MADService_Spotlight__submitSpotlightAssetURL_uniqueIdentifier_bundleIdentifier_completionHandler___block_invoke_275;
      v37[3] = &unk_1E97E2A00;
      v21 = v14;
      v38 = v21;
      objc_msgSend(v20, "remoteObjectProxyWithErrorHandler:", v37);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "submitSpotlightAssetURL:uniqueIdentifier:bundleIdentifier:typeIdentifier:sandboxToken:reply:", v10, v35, v36, v23, v19, v21);

      v24 = v38;
    }
    else
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v44 = *MEMORY[0x1E0CB2D50];
      v30 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v34, "description");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", CFSTR("Failed to create sandbox extension for asset (%@)"), v24);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v14)[2](v14, v33);

    }
    v18 = v34;
  }
  else
  {
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v46 = *MEMORY[0x1E0CB2D50];
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v17, "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("Failed to obtain UTType for asset (%@)"), v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v14)[2](v14, v28);

  }
}

void __101__MADService_Spotlight__submitSpotlightAssetURL_uniqueIdentifier_bundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "description");
    objc_claimAutoreleasedReturnValue();
    __63__MADService_Spotlight__prewarmTextRequests_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __101__MADService_Spotlight__submitSpotlightAssetURL_uniqueIdentifier_bundleIdentifier_completionHandler___block_invoke_275(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v11 = *MEMORY[0x1E0CB2D50];
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Error connecting to analysis service (%@)"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v10);

}

- (void)submitSearchableItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(v11, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADService submitSpotlightAssetURL:uniqueIdentifier:bundleIdentifier:completionHandler:](self, "submitSpotlightAssetURL:uniqueIdentifier:bundleIdentifier:completionHandler:", v8, v9, v10, v6);

}

- (int)prewarmMultiModalRequests:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  atomic<int> *p_requestID;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  os_signpost_id_t v28;
  int v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  p_requestID = &self->_requestID;
  do
    v9 = __ldaxr((unsigned int *)p_requestID);
  while (__stlxr(v9 + 1, (unsigned int *)p_requestID));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request: %d"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  MADSignpostLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  MADSignpostLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v10;
    _os_signpost_emit_with_name_impl(&dword_1D461A000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "MADService_PrewarmMultiModalRequest", "%@", buf, 0xCu);
  }

  v15 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __70__MADService_MultiModal__prewarmMultiModalRequests_completionHandler___block_invoke;
  v25[3] = &unk_1E97E2A28;
  v28 = v12;
  v16 = v10;
  v26 = v16;
  v17 = v7;
  v27 = v17;
  v29 = v9;
  v18 = (void *)MEMORY[0x1D825F508](v25);
  -[MADService connection](self, "connection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __70__MADService_MultiModal__prewarmMultiModalRequests_completionHandler___block_invoke_284;
  v23[3] = &unk_1E97E2A00;
  v20 = v18;
  v24 = v20;
  objc_msgSend(v19, "remoteObjectProxyWithErrorHandler:", v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "requestMultiModalPrewarming:requestID:reply:", v6, v9, v20);

  return v9;
}

void __70__MADService_MultiModal__prewarmMultiModalRequests_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MADSignpostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = a1[6];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = a1[4];
    v8 = 138412290;
    v9 = v7;
    _os_signpost_emit_with_name_impl(&dword_1D461A000, v5, OS_SIGNPOST_INTERVAL_END, v6, "MADService_PrewarmMultiModalRequest", "%@", (uint8_t *)&v8, 0xCu);
  }

  if (v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "description");
    objc_claimAutoreleasedReturnValue();
    __63__MADService_Spotlight__prewarmTextRequests_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(a1[5] + 16))();

}

void __70__MADService_MultiModal__prewarmMultiModalRequests_completionHandler___block_invoke_284(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v11 = *MEMORY[0x1E0CB2D50];
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Error connecting to analysis service (%@)"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v10);

}

- (int)performRequests:(id)a3 multiModalInputs:(id)a4 completionHandler:(id)a5
{
  id v8;
  atomic<int> *p_requestID;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  os_signpost_id_t v33;
  int v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v8 = a4;
  v26 = a5;
  p_requestID = &self->_requestID;
  do
    v10 = __ldaxr((unsigned int *)p_requestID);
  while (__stlxr(v10 + 1, (unsigned int *)p_requestID));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request: %d"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MADSignpostLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);

  MADSignpostLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v11;
    _os_signpost_emit_with_name_impl(&dword_1D461A000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "MADService_ProcessMultiModalRequest", "%@", buf, 0xCu);
  }

  v16 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __77__MADService_MultiModal__performRequests_multiModalInputs_completionHandler___block_invoke;
  v29[3] = &unk_1E97E25F8;
  v33 = v13;
  v17 = v11;
  v30 = v17;
  v18 = v25;
  v31 = v18;
  v19 = v26;
  v32 = v19;
  v34 = v10;
  v20 = (void *)MEMORY[0x1D825F508](v29);
  -[MADService connection](self, "connection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v16;
  v27[1] = 3221225472;
  v27[2] = __77__MADService_MultiModal__performRequests_multiModalInputs_completionHandler___block_invoke_285;
  v27[3] = &unk_1E97E2A00;
  v22 = v20;
  v28 = v22;
  objc_msgSend(v21, "remoteObjectProxyWithErrorHandler:", v27);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "requestProcessing:multiModalInputs:requestID:reply:", v18, v8, v10, v22);

  return v10;
}

void __77__MADService_MultiModal__performRequests_multiModalInputs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  unint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  MADSignpostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v18 = 138412290;
    v19 = v10;
    _os_signpost_emit_with_name_impl(&dword_1D461A000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_ProcessMultiModalRequest", "%@", (uint8_t *)&v18, 0xCu);
  }

  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "description");
      objc_claimAutoreleasedReturnValue();
      __63__MADService_Spotlight__prewarmTextRequests_completionHandler___block_invoke_cold_1();
    }
  }
  else
  {
    for (i = 0; i < objc_msgSend(v5, "count"); ++i)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "results");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setResults:", v14);

      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "error");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setError:", v17);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __77__MADService_MultiModal__performRequests_multiModalInputs_completionHandler___block_invoke_285(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v11 = *MEMORY[0x1E0CB2D50];
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Error connecting to analysis service (%@)"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v10);

}

- (void)init
{
  OUTLINED_FUNCTION_0(&dword_1D461A000, MEMORY[0x1E0C81028], a3, "[MADService init] unavialable; please call [MADService service]",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_1();
}

void __24__MADService_connection__block_invoke_2_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADService] Client XPC connection interrupted", v0, 2u);
  OUTLINED_FUNCTION_1();
}

void __24__MADService_connection__block_invoke_54_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D461A000, MEMORY[0x1E0C81028], a3, "[MADService] Client XPC connection invalidated", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __46__MADService_addProgressHandler_forRequestID___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_1D461A000, MEMORY[0x1E0C81028], v0, "[MADService] Multiple progress handlers for request %d; cannot add",
    v1,
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_1();
}

void __48__MADService_removeProgressHandlerForRequestID___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_1D461A000, MEMORY[0x1E0C81028], v0, "[MADService] No progress handler for request %d; cannot remove",
    v1,
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_1();
}

void __40__MADService_reportProgress_forRequest___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_1D461A000, MEMORY[0x1E0C81028], v0, "[MADService] No progress handler for request %d; cannot report",
    v1,
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_1();
}

void __44__MADService_addResultHandler_forRequestID___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_1D461A000, MEMORY[0x1E0C81028], v0, "[MADService] Multiple result handlers for request %d; cannot add",
    v1,
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_1();
}

void __46__MADService_removeResultHandlerForRequestID___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_1D461A000, MEMORY[0x1E0C81028], v0, "[MADService] No result handler for request %d; cannot remove",
    v1,
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_1();
}

- (void)handleResult:(uint64_t)a3 atRequestIdx:(uint64_t)a4 forRequestID:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1D461A000, MEMORY[0x1E0C81028], a3, "[MADService] No result handler for request %d; cannot handle",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_1();
}

void __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D461A000, MEMORY[0x1E0C81028], a3, "[MADService] Error connecting to analysis service", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __62__MADService_performRequests_onImageURL_withIdentifier_error___block_invoke_81_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_1D461A000, MEMORY[0x1E0C81028], v0, "[MADService] Error during analysis service for RequestID %d (synchronous)", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void __88__MADService_performRequests_onImageData_withUniformTypeIdentifier_andIdentifier_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D461A000, MEMORY[0x1E0C81028], a3, "[MADService] Error connecting to analysis service (synchronous)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __30__MADService_cancelRequestID___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D461A000, MEMORY[0x1E0C81028], a3, "[MADService] Error connecting to background analysis service", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __123__MADService_Photos__performRequests_assetLocalIdentifier_photoLibraryURL_progressHandler_resultHandler_completionHandler___block_invoke_cold_1(int a1, uint64_t a2)
{
  int v2;
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a2 + 48);
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = v2;
  _os_log_error_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADService] Failed to report incremental result for request at index %d in MADRequest %d", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_3();
}

void __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke_cold_1()
{
  uint64_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1D461A000, MEMORY[0x1E0C81028], v0, "[MADService] Error connecting to background analysis service - %@", v1);
  OUTLINED_FUNCTION_3();
}

void __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke_167_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D461A000, MEMORY[0x1E0C81028], a3, "[MADService] VUIndex file does not exist", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke_167_cold_2()
{
  uint64_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1D461A000, MEMORY[0x1E0C81028], v0, "[MADService] Failed to connect to service (%@)", v1);
  OUTLINED_FUNCTION_3();
}

void __74__MADService_Photos__queryVUIndexAssetCountForType_photoLibraryURL_error___block_invoke_176_cold_1()
{
  uint64_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1D461A000, MEMORY[0x1E0C81028], v0, "[MADService] Failed to query VU index asset count - %@", v1);
  OUTLINED_FUNCTION_3();
}

void __80__MADService_Photos__queryVUIndexLastFullModeClusterDate_photoLibraryURL_error___block_invoke_178_cold_1()
{
  uint64_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1D461A000, MEMORY[0x1E0C81028], v0, "[MADService] Failed to query VU index full-mode cluster status - %@", v1);
  OUTLINED_FUNCTION_3();
}

void __63__MADService_Spotlight__prewarmTextRequests_completionHandler___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_1D461A000, MEMORY[0x1E0C81028], v3, "%@", v4);

  OUTLINED_FUNCTION_8();
}

@end

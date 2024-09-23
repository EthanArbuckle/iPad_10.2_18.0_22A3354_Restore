@implementation VCPHomeKitAnalysisSession

- (VCPHomeKitAnalysisSession)initWithProperties:(id)a3 withResultsHandler:(id)a4 andInterruptionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  VCPHomeKitAnalysisSession *v11;
  VCPHomeKitAnalysisSession *v12;
  NSXPCConnection *connection;
  dispatch_queue_t v14;
  OS_dispatch_queue *managementQueue;
  dispatch_queue_t v16;
  OS_dispatch_queue *handlerQueue;
  void *v18;
  id resultsHandler;
  void *v20;
  id interruptionHander;
  void *v22;
  uint64_t v23;
  void *v24;
  VCPHomeKitAnalysisSession *v25;
  uint64_t v26;
  _QWORD v28[6];
  _QWORD v29[6];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  objc_super v40;
  uint8_t buf[4];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v40.receiver = self;
  v40.super_class = (Class)VCPHomeKitAnalysisSession;
  v11 = -[VCPHomeKitAnalysisSession init](&v40, sel_init);
  v12 = v11;
  if (!v11)
    goto LABEL_4;
  connection = v11->_connection;
  v11->_connection = 0;

  v14 = dispatch_queue_create("com.apple.homekitanalysis.session.management", 0);
  managementQueue = v12->_managementQueue;
  v12->_managementQueue = (OS_dispatch_queue *)v14;

  v16 = dispatch_queue_create("com.apple.homekitanalysis.session.handler", 0);
  handlerQueue = v12->_handlerQueue;
  v12->_handlerQueue = (OS_dispatch_queue *)v16;

  v18 = _Block_copy(v9);
  resultsHandler = v12->_resultsHandler;
  v12->_resultsHandler = v18;

  v20 = _Block_copy(v10);
  interruptionHander = v12->_interruptionHander;
  v12->_interruptionHander = v20;

  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__17;
  v38 = __Block_byref_object_dispose__17;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 1;
  -[VCPHomeKitAnalysisSession connection](v12, "connection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __90__VCPHomeKitAnalysisSession_initWithProperties_withResultsHandler_andInterruptionHandler___block_invoke;
  v29[3] = &unk_1E6B175C0;
  v29[4] = &v30;
  v29[5] = &v34;
  objc_msgSend(v22, "synchronousRemoteObjectProxyWithErrorHandler:", v29);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v23;
  v28[1] = 3221225472;
  v28[2] = __90__VCPHomeKitAnalysisSession_initWithProperties_withResultsHandler_andInterruptionHandler___block_invoke_130;
  v28[3] = &unk_1E6B175C0;
  v28[4] = &v30;
  v28[5] = &v34;
  objc_msgSend(v24, "startSessionWithProperties:andReply:", v8, v28);

  if (*((_BYTE *)v31 + 24))
  {
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);

LABEL_4:
    v25 = v12;
    goto LABEL_9;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v26 = v35[5];
    *(_DWORD *)buf = 138412290;
    v42 = v26;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[HomeKit] VCPHomeKitAnalysisSession initialization fails (%@)", buf, 0xCu);
  }
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  v25 = 0;
LABEL_9:

  return v25;
}

void __90__VCPHomeKitAnalysisSession_initWithProperties_withResultsHandler_andInterruptionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[HomeKit] Failed to connect to analysis service (%@)", (uint8_t *)&v6, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __90__VCPHomeKitAnalysisSession_initWithProperties_withResultsHandler_andInterruptionHandler___block_invoke_130(uint64_t a1, void *a2)
{
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[HomeKit] Failed to connect to analysis service (%@)", (uint8_t *)&v5, 0xCu);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

+ (id)sessionWithProperties:(id)a3 andResultsHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithProperties:withResultsHandler:andInterruptionHandler:", v5, v6, &__block_literal_global_33);

  return v7;
}

+ (id)sessionWithProperties:(id)a3 withResultsHandler:(id)a4 andInterruptionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithProperties:withResultsHandler:andInterruptionHandler:", v7, v8, v9);

  return v10;
}

- (id)connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  VCPHomeKitSessionExportedObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSXPCConnection *v13;
  NSXPCConnection *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id location[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.mediaanalysisd.homekitsession"), 0);
    v5 = self->_connection;
    self->_connection = v4;

    v6 = objc_alloc_init(VCPHomeKitSessionExportedObject);
    -[VCPHomeKitSessionExportedObject setWeakSession:](v6, "setWeakSession:", self);
    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", v6);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1A28F0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1665B8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v9 = (void *)getHMIVideoAnalyzerClass(void)::softClass;
    v27 = getHMIVideoAnalyzerClass(void)::softClass;
    v10 = MEMORY[0x1E0C809B0];
    if (!getHMIVideoAnalyzerClass(void)::softClass)
    {
      location[0] = (id)MEMORY[0x1E0C809B0];
      location[1] = (id)3221225472;
      location[2] = ___ZL24getHMIVideoAnalyzerClassv_block_invoke;
      location[3] = &unk_1E6B15540;
      location[4] = &v24;
      ___ZL24getHMIVideoAnalyzerClassv_block_invoke((uint64_t)location);
      v9 = (void *)v25[3];
    }
    v11 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v24, 8);
    objc_msgSend(v11, "allowedClasses");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_processVideoFragmentAssetData_withOptions_andReply_, 1, 0);
    objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_processVideoFragmentAssetData_withOptions_andReply_, 0, 1);
    objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_processMessageWithOptions_andReply_, 0, 0);
    objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_processMessageWithOptions_andReply_, 0, 1);
    objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_startSessionWithProperties_andReply_, 0, 0);
    objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_processResults_withReply_, 0, 0);
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v7);
    -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", v8);
    objc_initWeak(location, self);
    v13 = self->_connection;
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __39__VCPHomeKitAnalysisSession_connection__block_invoke;
    v21[3] = &unk_1E6B16988;
    objc_copyWeak(&v22, location);
    -[NSXPCConnection setInterruptionHandler:](v13, "setInterruptionHandler:", v21);
    v14 = self->_connection;
    v16 = v10;
    v17 = 3221225472;
    v18 = __39__VCPHomeKitAnalysisSession_connection__block_invoke_147;
    v19 = &unk_1E6B16988;
    objc_copyWeak(&v20, location);
    -[NSXPCConnection setInvalidationHandler:](v14, "setInvalidationHandler:", &v16);
    -[NSXPCConnection resume](self->_connection, "resume", v16, v17, v18, v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(location);

    connection = self->_connection;
  }
  return connection;
}

void __39__VCPHomeKitAnalysisSession_connection__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  uint8_t v5[16];

  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[HomeKit] Client XPC connection interrupted", v5, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;

    (*(void (**)(void))(v3[6] + 16))();
  }

}

void __39__VCPHomeKitAnalysisSession_connection__block_invoke_147(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  uint8_t v5[16];

  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[HomeKit] Client XPC connection invalidated", v5, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;

    (*(void (**)(void))(v3[6] + 16))();
  }

}

- (void)processVideoFragmentAssetData:(id)a3 withOptions:(id)a4 andErrorHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *managementQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andErrorHandler___block_invoke;
  block[3] = &unk_1E6B17630;
  block[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(managementQueue, block);

}

void __87__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andErrorHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_148);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __87__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andErrorHandler___block_invoke_149;
  v6[3] = &unk_1E6B17608;
  v4 = *(_QWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v3, "processVideoFragmentAssetData:withOptions:andReply:", v4, v5, v6);

}

void __87__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andErrorHandler___block_invoke_2()
{
  uint8_t v0[16];

  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[HomeKit] Error connecting to background analysis service", v0, 2u);
  }
}

void __87__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andErrorHandler___block_invoke_149(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andErrorHandler___block_invoke_2_150;
  v8[3] = &unk_1E6B15D68;
  v9 = v4;
  v10 = v5;
  v7 = v4;
  dispatch_async(v6, v8);

}

uint64_t __87__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andErrorHandler___block_invoke_2_150(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)processVideoFragmentAssetData:(id)a3 withOptions:(id)a4 andCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *managementQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andCompletionHandler___block_invoke;
  block[3] = &unk_1E6B17658;
  block[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_sync(managementQueue, block);

}

void __92__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
  {
    v3 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __92__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andCompletionHandler___block_invoke_2;
    v14[3] = &unk_1E6B16158;
    v15 = *(id *)(a1 + 56);
    objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v3;
    v12[1] = 3221225472;
    v12[2] = __92__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andCompletionHandler___block_invoke_157;
    v12[3] = &unk_1E6B17608;
    v5 = *(_QWORD *)(a1 + 40);
    v12[4] = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 48);
    v13 = *(id *)(a1 + 56);
    objc_msgSend(v4, "processVideoFragmentAssetData:withOptions:andReply:", v5, v6, v12);

    v7 = v15;
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 56);
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[HomeKit] XPC connection invalidated. Please restart the session."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v11);

  }
}

void __92__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint8_t v4[16];

  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[HomeKit] Error connecting to background analysis service", v4, 2u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __92__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andCompletionHandler___block_invoke_157(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andCompletionHandler___block_invoke_2_158;
  block[3] = &unk_1E6B15DE0;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __92__VCPHomeKitAnalysisSession_processVideoFragmentAssetData_withOptions_andCompletionHandler___block_invoke_2_158(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)processMessageWithOptions:(id)a3 andCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *managementQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__VCPHomeKitAnalysisSession_processMessageWithOptions_andCompletionHandler___block_invoke;
  block[3] = &unk_1E6B17680;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_sync(managementQueue, block);

}

void __76__VCPHomeKitAnalysisSession_processMessageWithOptions_andCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
  {
    v3 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __76__VCPHomeKitAnalysisSession_processMessageWithOptions_andCompletionHandler___block_invoke_2;
    v13[3] = &unk_1E6B16158;
    v14 = *(id *)(a1 + 48);
    objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v13);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v3;
    v11[1] = 3221225472;
    v11[2] = __76__VCPHomeKitAnalysisSession_processMessageWithOptions_andCompletionHandler___block_invoke_159;
    v11[3] = &unk_1E6B17608;
    v5 = *(_QWORD *)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v4, "processMessageWithOptions:andReply:", v5, v11);

    v6 = v14;
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[HomeKit] XPC connection invalidated. Please restart the session."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v10);

  }
}

void __76__VCPHomeKitAnalysisSession_processMessageWithOptions_andCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint8_t v4[16];

  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[HomeKit] Error connecting to background analysis service", v4, 2u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __76__VCPHomeKitAnalysisSession_processMessageWithOptions_andCompletionHandler___block_invoke_159(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__VCPHomeKitAnalysisSession_processMessageWithOptions_andCompletionHandler___block_invoke_2_160;
  block[3] = &unk_1E6B15DE0;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __76__VCPHomeKitAnalysisSession_processMessageWithOptions_andCompletionHandler___block_invoke_2_160(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)processResults:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *handlerQueue;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD block[5];
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (self->_resultsHandler)
  {
    handlerQueue = self->_handlerQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__VCPHomeKitAnalysisSession_processResults_withReply___block_invoke;
    block[3] = &unk_1E6B16D58;
    block[4] = self;
    v14 = v6;
    dispatch_async(handlerQueue, block);
    v7[2](v7, 0);

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No result handler registered"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v7)[2](v7, v12);

  }
}

uint64_t __54__VCPHomeKitAnalysisSession_processResults_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
}

- (void)invalidate
{
  NSObject *managementQueue;
  _QWORD block[5];

  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__VCPHomeKitAnalysisSession_invalidate__block_invoke;
  block[3] = &unk_1E6B15468;
  block[4] = self;
  dispatch_sync(managementQueue, block);
}

uint64_t __39__VCPHomeKitAnalysisSession_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_interruptionHander, 0);
  objc_storeStrong(&self->_resultsHandler, 0);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_formatDescription.value_);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong((id *)&self->_managementQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end

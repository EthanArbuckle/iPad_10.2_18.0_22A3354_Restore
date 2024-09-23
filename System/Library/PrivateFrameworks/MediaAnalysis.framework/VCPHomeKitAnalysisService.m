@implementation VCPHomeKitAnalysisService

- (VCPHomeKitAnalysisService)init
{
  VCPHomeKitAnalysisService *v2;
  VCPHomeKitAnalysisService *v3;
  NSXPCConnection *connection;
  dispatch_queue_t v5;
  OS_dispatch_queue *managementQueue;
  dispatch_queue_t v7;
  OS_dispatch_queue *handlerQueue;
  uint64_t v9;
  NSMutableDictionary *progressBlocks;
  VCPHomeKitAnalysisService *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VCPHomeKitAnalysisService;
  v2 = -[VCPHomeKitAnalysisService init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    connection = v2->_connection;
    v2->_connection = 0;

    v5 = dispatch_queue_create("com.apple.homekitanalysis.service.management", 0);
    managementQueue = v3->_managementQueue;
    v3->_managementQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("com.apple.homekitanalysis.service.handler", 0);
    handlerQueue = v3->_handlerQueue;
    v3->_handlerQueue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    progressBlocks = v3->_progressBlocks;
    v3->_progressBlocks = (NSMutableDictionary *)v9;

    v3->_nextRequestID = 1;
    v11 = v3;
  }

  return v3;
}

+ (id)analysisService
{
  return objc_alloc_init(VCPHomeKitAnalysisService);
}

- (id)connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSXPCConnection *v15;
  void *v16;
  NSXPCConnection *v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.mediaanalysisd.homekit"), 0);
    v5 = self->_connection;
    self->_connection = v4;

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1A29B0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v7 = (void *)getHMIAnalysisServiceClass_softClass;
    v28 = getHMIAnalysisServiceClass_softClass;
    v8 = MEMORY[0x1E0C809B0];
    if (!getHMIAnalysisServiceClass_softClass)
    {
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __getHMIAnalysisServiceClass_block_invoke;
      v23 = &unk_1E6B19610;
      v24 = &v25;
      __getHMIAnalysisServiceClass_block_invoke((uint64_t)&v20);
      v7 = (void *)v26[3];
    }
    v9 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v25, 8);
    v10 = objc_alloc_init(v9);
    objc_msgSend(v10, "expectedClasses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_requestAnalysis_ofFragmentData_withRequestID_properties_andReply_, 3, 0);
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_requestAnalysis_ofFragmentData_withRequestID_properties_andReply_, 0, 1);
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_requestAnalysis_ofFragmentSurface_withRequestID_properties_andReply_, 3, 0);
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_requestAnalysis_ofFragmentSurface_withRequestID_properties_andReply_, 0, 1);
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v12 = (void *)getHMITaskServiceClass_softClass;
    v28 = getHMITaskServiceClass_softClass;
    if (!getHMITaskServiceClass_softClass)
    {
      v20 = v8;
      v21 = 3221225472;
      v22 = __getHMITaskServiceClass_block_invoke;
      v23 = &unk_1E6B19610;
      v24 = &v25;
      __getHMITaskServiceClass_block_invoke((uint64_t)&v20);
      v12 = (void *)v26[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v25, 8);
    objc_msgSend(v13, "allowedClasses");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_requestResidentMaintenance_withOptions_andReply_, 0, 1);

    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v6);
    v15 = self->_connection;
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF17B1B8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v15, "setExportedInterface:", v16);

    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_81);
    v17 = self->_connection;
    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = __39__VCPHomeKitAnalysisService_connection__block_invoke_150;
    v19[3] = &unk_1E6B15440;
    v19[4] = self;
    -[NSXPCConnection setInvalidationHandler:](v17, "setInvalidationHandler:", v19);
    -[NSXPCConnection resume](self->_connection, "resume");

    connection = self->_connection;
  }
  return connection;
}

void __39__VCPHomeKitAnalysisService_connection__block_invoke()
{
  uint8_t v0[16];

  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "HomeKit analysis client XPC connection interrupted", v0, 2u);
  }
}

void __39__VCPHomeKitAnalysisService_connection__block_invoke_150(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint8_t v4[16];

  if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HomeKit analysis client XPC connection invalidated", v4, 2u);
  }
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

}

- (int)requestAnalysis:(unint64_t)a3 ofAssetData:(id)a4 withProperties:(id)a5 progressHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *managementQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__VCPHomeKitAnalysisService_requestAnalysis_ofAssetData_withProperties_progressHandler_andCompletionHandler___block_invoke;
  block[3] = &unk_1E6B1AD20;
  v26 = v15;
  v27 = &v29;
  v28 = a3;
  block[4] = self;
  v23 = v12;
  v24 = v13;
  v25 = v14;
  v17 = v13;
  v18 = v12;
  v19 = v15;
  v20 = v14;
  dispatch_sync(managementQueue, block);
  LODWORD(self) = *((_DWORD *)v30 + 6);

  _Block_object_dispose(&v29, 8);
  return (int)self;
}

void __109__VCPHomeKitAnalysisService_requestAnalysis_ofAssetData_withProperties_progressHandler_andCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  const void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  _QWORD v22[5];
  __int128 v23;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_QWORD *)(a1 + 56))
    v5 = *(const void **)(a1 + 56);
  else
    v5 = &__block_literal_global_152;
  v6 = _Block_copy(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __109__VCPHomeKitAnalysisService_requestAnalysis_ofAssetData_withProperties_progressHandler_andCompletionHandler___block_invoke_3;
  v22[3] = &unk_1E6B1AC80;
  v22[4] = *(_QWORD *)(a1 + 32);
  v18 = *(_OWORD *)(a1 + 64);
  v10 = (id)v18;
  v23 = v18;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 72);
  v13 = *(_QWORD *)(a1 + 80);
  v14 = *(void **)(a1 + 64);
  v15 = *(unsigned int *)(*(_QWORD *)(v12 + 8) + 24);
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __109__VCPHomeKitAnalysisService_requestAnalysis_ofAssetData_withProperties_progressHandler_andCompletionHandler___block_invoke_3_157;
  v19[3] = &unk_1E6B1ACF8;
  v17 = *(_QWORD *)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 48);
  v19[4] = *(_QWORD *)(a1 + 32);
  v21 = v12;
  v20 = v14;
  objc_msgSend(v11, "requestAnalysis:ofFragmentData:withRequestID:properties:andReply:", v13, v17, v15, v16, v19);

}

void __109__VCPHomeKitAnalysisService_requestAnalysis_ofAssetData_withProperties_progressHandler_andCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  id v7;
  __int128 v8;
  _QWORD block[5];
  id v10;
  __int128 v11;
  uint8_t buf[16];

  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[HomeKitAnalysis] Error connecting to background analysis service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__VCPHomeKitAnalysisService_requestAnalysis_ofAssetData_withProperties_progressHandler_andCompletionHandler___block_invoke_154;
  block[3] = &unk_1E6B1AC58;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __109__VCPHomeKitAnalysisService_requestAnalysis_ofAssetData_withProperties_progressHandler_andCompletionHandler___block_invoke_154(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __109__VCPHomeKitAnalysisService_requestAnalysis_ofAssetData_withProperties_progressHandler_andCompletionHandler___block_invoke_2_155;
  v5[3] = &unk_1E6B1AC30;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __109__VCPHomeKitAnalysisService_requestAnalysis_ofAssetData_withProperties_progressHandler_andCompletionHandler___block_invoke_2_155(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __109__VCPHomeKitAnalysisService_requestAnalysis_ofAssetData_withProperties_progressHandler_andCompletionHandler___block_invoke_3_157(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  _QWORD block[5];
  id v14;
  id v15;
  __int128 v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__VCPHomeKitAnalysisService_requestAnalysis_ofAssetData_withProperties_progressHandler_andCompletionHandler___block_invoke_4;
  block[3] = &unk_1E6B1ACD0;
  block[4] = v7;
  v12 = *(_OWORD *)(a1 + 40);
  v9 = (id)v12;
  v16 = v12;
  v14 = v5;
  v15 = v6;
  v10 = v6;
  v11 = v5;
  dispatch_async(v8, block);

}

void __109__VCPHomeKitAnalysisService_requestAnalysis_ofAssetData_withProperties_progressHandler_andCompletionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__VCPHomeKitAnalysisService_requestAnalysis_ofAssetData_withProperties_progressHandler_andCompletionHandler___block_invoke_5;
  block[3] = &unk_1E6B1ACA8;
  v8 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __109__VCPHomeKitAnalysisService_requestAnalysis_ofAssetData_withProperties_progressHandler_andCompletionHandler___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestAnalysis:(unint64_t)a3 ofAssetSurface:(id)a4 withProperties:(id)a5 progressHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *managementQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__VCPHomeKitAnalysisService_requestAnalysis_ofAssetSurface_withProperties_progressHandler_andCompletionHandler___block_invoke;
  block[3] = &unk_1E6B1AD20;
  v26 = v15;
  v27 = &v29;
  v28 = a3;
  block[4] = self;
  v23 = v12;
  v24 = v13;
  v25 = v14;
  v17 = v13;
  v18 = v12;
  v19 = v15;
  v20 = v14;
  dispatch_sync(managementQueue, block);
  LODWORD(self) = *((_DWORD *)v30 + 6);

  _Block_object_dispose(&v29, 8);
  return (int)self;
}

void __112__VCPHomeKitAnalysisService_requestAnalysis_ofAssetSurface_withProperties_progressHandler_andCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  const void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  _QWORD v22[5];
  __int128 v23;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_QWORD *)(a1 + 56))
    v5 = *(const void **)(a1 + 56);
  else
    v5 = &__block_literal_global_159_0;
  v6 = _Block_copy(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __112__VCPHomeKitAnalysisService_requestAnalysis_ofAssetSurface_withProperties_progressHandler_andCompletionHandler___block_invoke_3;
  v22[3] = &unk_1E6B1AC80;
  v22[4] = *(_QWORD *)(a1 + 32);
  v18 = *(_OWORD *)(a1 + 64);
  v10 = (id)v18;
  v23 = v18;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 72);
  v13 = *(_QWORD *)(a1 + 80);
  v14 = *(void **)(a1 + 64);
  v15 = *(unsigned int *)(*(_QWORD *)(v12 + 8) + 24);
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __112__VCPHomeKitAnalysisService_requestAnalysis_ofAssetSurface_withProperties_progressHandler_andCompletionHandler___block_invoke_3_162;
  v19[3] = &unk_1E6B1ACF8;
  v17 = *(_QWORD *)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 48);
  v19[4] = *(_QWORD *)(a1 + 32);
  v21 = v12;
  v20 = v14;
  objc_msgSend(v11, "requestAnalysis:ofFragmentSurface:withRequestID:properties:andReply:", v13, v17, v15, v16, v19);

}

void __112__VCPHomeKitAnalysisService_requestAnalysis_ofAssetSurface_withProperties_progressHandler_andCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  id v7;
  __int128 v8;
  _QWORD block[5];
  id v10;
  __int128 v11;
  uint8_t buf[16];

  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[HomeKitAnalysis] Error connecting to background analysis service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__VCPHomeKitAnalysisService_requestAnalysis_ofAssetSurface_withProperties_progressHandler_andCompletionHandler___block_invoke_160;
  block[3] = &unk_1E6B1AC58;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __112__VCPHomeKitAnalysisService_requestAnalysis_ofAssetSurface_withProperties_progressHandler_andCompletionHandler___block_invoke_160(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __112__VCPHomeKitAnalysisService_requestAnalysis_ofAssetSurface_withProperties_progressHandler_andCompletionHandler___block_invoke_2_161;
  v5[3] = &unk_1E6B1AC30;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __112__VCPHomeKitAnalysisService_requestAnalysis_ofAssetSurface_withProperties_progressHandler_andCompletionHandler___block_invoke_2_161(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __112__VCPHomeKitAnalysisService_requestAnalysis_ofAssetSurface_withProperties_progressHandler_andCompletionHandler___block_invoke_3_162(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  _QWORD block[5];
  id v14;
  id v15;
  __int128 v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__VCPHomeKitAnalysisService_requestAnalysis_ofAssetSurface_withProperties_progressHandler_andCompletionHandler___block_invoke_4;
  block[3] = &unk_1E6B1ACD0;
  block[4] = v7;
  v12 = *(_OWORD *)(a1 + 40);
  v9 = (id)v12;
  v16 = v12;
  v14 = v5;
  v15 = v6;
  v10 = v6;
  v11 = v5;
  dispatch_async(v8, block);

}

void __112__VCPHomeKitAnalysisService_requestAnalysis_ofAssetSurface_withProperties_progressHandler_andCompletionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__VCPHomeKitAnalysisService_requestAnalysis_ofAssetSurface_withProperties_progressHandler_andCompletionHandler___block_invoke_5;
  block[3] = &unk_1E6B1ACA8;
  v8 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __112__VCPHomeKitAnalysisService_requestAnalysis_ofAssetSurface_withProperties_progressHandler_andCompletionHandler___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)reportProgress:(double)a3 forRequest:(int)a4
{
  NSObject *managementQueue;
  _QWORD block[6];
  int v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109376;
    v11 = a4;
    v12 = 2048;
    v13 = a3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[HomeKitAnalysis] Request %d is %.2f%% complete", buf, 0x12u);
  }
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__VCPHomeKitAnalysisService_reportProgress_forRequest___block_invoke;
  block[3] = &unk_1E6B1AD70;
  block[4] = self;
  v9 = a4;
  *(double *)&block[5] = a3;
  dispatch_async(managementQueue, block);
}

void __55__VCPHomeKitAnalysisService_reportProgress_forRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__VCPHomeKitAnalysisService_reportProgress_forRequest___block_invoke_2;
    v6[3] = &unk_1E6B1AD48;
    v7 = v4;
    v8 = *(_QWORD *)(a1 + 40);
    dispatch_async(v5, v6);

  }
}

uint64_t __55__VCPHomeKitAnalysisService_reportProgress_forRequest___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)cancelRequest:(int)a3
{
  NSObject *managementQueue;
  _QWORD v4[5];
  int v5;

  managementQueue = self->_managementQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__VCPHomeKitAnalysisService_cancelRequest___block_invoke;
  v4[3] = &unk_1E6B1ADB8;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(managementQueue, v4);
}

void __43__VCPHomeKitAnalysisService_cancelRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  uint8_t buf[4];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_163_0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelRequest:", *(unsigned int *)(a1 + 40));

  }
  else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)buf = 67109120;
    v9 = v6;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[HomeKitAnalysis] Unknown analysis request %d; dropping cancellation request",
      buf,
      8u);
  }
}

void __43__VCPHomeKitAnalysisService_cancelRequest___block_invoke_2()
{
  uint8_t v0[16];

  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[HomeKitAnalysis] Error connecting to background analysis service", v0, 2u);
  }
}

- (void)cancelAllRequests
{
  NSObject *managementQueue;
  _QWORD block[5];

  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__VCPHomeKitAnalysisService_cancelAllRequests__block_invoke;
  block[3] = &unk_1E6B15440;
  block[4] = self;
  dispatch_sync(managementQueue, block);
}

void __46__VCPHomeKitAnalysisService_cancelAllRequests__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint8_t buf[16];

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_164);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancelAllRequests");

  }
  else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[HomeKitAnalysis] No active analysis requests; dropping cancellation request",
      buf,
      2u);
  }
}

void __46__VCPHomeKitAnalysisService_cancelAllRequests__block_invoke_2()
{
  uint8_t v0[16];

  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[HomeKitAnalysis] Error connecting to background analysis service", v0, 2u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressBlocks, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong((id *)&self->_managementQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (int)requestResidentMaintenanceWithOptions:(id)a3 andCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *managementQueue;
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
  v19 = -1;
  managementQueue = self->_managementQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __98__VCPHomeKitAnalysisService_Resident__requestResidentMaintenanceWithOptions_andCompletionHandler___block_invoke;
  v12[3] = &unk_1E6B1AE08;
  v14 = v7;
  v15 = &v16;
  v12[4] = self;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(managementQueue, v12);
  LODWORD(v6) = *((_DWORD *)v17 + 6);

  _Block_object_dispose(&v16, 8);
  return (int)v6;
}

void __98__VCPHomeKitAnalysisService_Resident__requestResidentMaintenanceWithOptions_andCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  __int128 v12;
  _QWORD v13[4];
  id v14;
  _QWORD aBlock[5];
  __int128 v16;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", &__block_literal_global_183, v5);

  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__VCPHomeKitAnalysisService_Resident__requestResidentMaintenanceWithOptions_andCompletionHandler___block_invoke_3;
  aBlock[3] = &unk_1E6B1ACF8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v12 = *(_OWORD *)(a1 + 48);
  v7 = (id)v12;
  v16 = v12;
  v8 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __98__VCPHomeKitAnalysisService_Resident__requestResidentMaintenanceWithOptions_andCompletionHandler___block_invoke_6;
  v13[3] = &unk_1E6B1ADE0;
  v14 = v8;
  v10 = v8;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requestResidentMaintenance:withOptions:andReply:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(a1 + 40), v10);

}

void __98__VCPHomeKitAnalysisService_Resident__requestResidentMaintenanceWithOptions_andCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  _QWORD block[5];
  id v14;
  id v15;
  __int128 v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__VCPHomeKitAnalysisService_Resident__requestResidentMaintenanceWithOptions_andCompletionHandler___block_invoke_4;
  block[3] = &unk_1E6B1ACD0;
  block[4] = v7;
  v12 = *(_OWORD *)(a1 + 40);
  v9 = (id)v12;
  v16 = v12;
  v14 = v5;
  v15 = v6;
  v10 = v6;
  v11 = v5;
  dispatch_async(v8, block);

}

void __98__VCPHomeKitAnalysisService_Resident__requestResidentMaintenanceWithOptions_andCompletionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__VCPHomeKitAnalysisService_Resident__requestResidentMaintenanceWithOptions_andCompletionHandler___block_invoke_5;
  block[3] = &unk_1E6B1ACA8;
  v8 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __98__VCPHomeKitAnalysisService_Resident__requestResidentMaintenanceWithOptions_andCompletionHandler___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __98__VCPHomeKitAnalysisService_Resident__requestResidentMaintenanceWithOptions_andCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
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

@end

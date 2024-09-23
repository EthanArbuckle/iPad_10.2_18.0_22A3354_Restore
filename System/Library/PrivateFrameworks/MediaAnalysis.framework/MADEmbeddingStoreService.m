@implementation MADEmbeddingStoreService

- (MADEmbeddingStoreService)init
{
  uint8_t v4[16];

  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADEmbeddingStoreService init] unavialable; please call [MADEmbeddingStoreService service]",
      v4,
      2u);
  }

  return 0;
}

- (id)initInternal
{
  MADEmbeddingStoreService *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *connectionQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *sandboxQueue;
  uint64_t v7;
  NSMutableDictionary *sandboxHandles;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MADEmbeddingStoreService;
  v2 = -[MADEmbeddingStoreService init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("MADEmbeddingStoreService.connectionQueue", 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("MADEmbeddingStoreService.sandboxQueue", 0);
    sandboxQueue = v2->_sandboxQueue;
    v2->_sandboxQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    sandboxHandles = v2->_sandboxHandles;
    v2->_sandboxHandles = (NSMutableDictionary *)v7;

  }
  return v2;
}

+ (id)sharedService
{
  if (+[MADEmbeddingStoreService sharedService]::once != -1)
    dispatch_once(&+[MADEmbeddingStoreService sharedService]::once, &__block_literal_global_23);
  return (id)+[MADEmbeddingStoreService sharedService]::instance;
}

void __41__MADEmbeddingStoreService_sharedService__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[MADEmbeddingStoreService initInternal]([MADEmbeddingStoreService alloc], "initInternal");
  v1 = (void *)+[MADEmbeddingStoreService sharedService]::instance;
  +[MADEmbeddingStoreService sharedService]::instance = (uint64_t)v0;

}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary allValues](self->_sandboxHandles, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "longLongValue");
        sandbox_extension_release();
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v7.receiver = self;
  v7.super_class = (Class)MADEmbeddingStoreService;
  -[MADEmbeddingStoreService dealloc](&v7, sel_dealloc);
}

+ (id)serviceName
{
  return CFSTR("com.apple.mediaanalysisd.embeddingstore");
}

+ (id)allowedClasses
{
  return 0;
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
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99E60];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_fetchEmbeddingsWithAssetUUIDs_photoLibraryURL_options_reply_, 0, 0);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  v18[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_fetchEmbeddingsWithAssetUUIDs_photoLibraryURL_options_reply_, 0, 1);

  v10 = (void *)MEMORY[0x1E0C99E60];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_searchWithEmbeddings_photoLibraryURL_options_reply_, 0, 0);

  v13 = (void *)MEMORY[0x1E0C99E60];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14, v16[0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_searchWithEmbeddings_photoLibraryURL_options_reply_, 0, 1);

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
  v9 = __Block_byref_object_copy__14;
  v10 = __Block_byref_object_dispose__14;
  v11 = 0;
  connectionQueue = self->_connectionQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__MADEmbeddingStoreService_connection__block_invoke;
  v5[3] = &unk_1E6B16E48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(connectionQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __38__MADEmbeddingStoreService_connection__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  MADEmbeddingStoreServiceProxy *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
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
    v9 = -[MADEmbeddingStoreServiceProxy initWithService:]([MADEmbeddingStoreServiceProxy alloc], "initWithService:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v8, "setExportedObject:", v9);

    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF160300);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setExportedInterface:", v11);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1A2830);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "configureServerInterface:", v12);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setRemoteObjectInterface:", v12);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setInterruptionHandler:", &__block_literal_global_167);
    objc_initWeak(&location, *(id *)(a1 + 32));
    v13 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __38__MADEmbeddingStoreService_connection__block_invoke_168;
    v17 = &unk_1E6B16988;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v13, "setInvalidationHandler:", &v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resume", v14, v15, v16, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void __38__MADEmbeddingStoreService_connection__block_invoke_2()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    __38__MADEmbeddingStoreService_connection__block_invoke_2_cold_1();
}

void __38__MADEmbeddingStoreService_connection__block_invoke_168(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  _QWORD block[5];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __38__MADEmbeddingStoreService_connection__block_invoke_168_cold_1();
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__MADEmbeddingStoreService_connection__block_invoke_169;
    block[3] = &unk_1E6B15468;
    block[4] = v3;
    dispatch_async(v4, block);
  }

}

void __38__MADEmbeddingStoreService_connection__block_invoke_169(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;

}

+ (BOOL)isEntitledForInProcessAccess
{
  if (+[MADEmbeddingStoreService isEntitledForInProcessAccess]::onceToken != -1)
    dispatch_once(&+[MADEmbeddingStoreService isEntitledForInProcessAccess]::onceToken, &__block_literal_global_170);
  return +[MADEmbeddingStoreService isEntitledForInProcessAccess]::entitled;
}

const void **__56__MADEmbeddingStoreService_isEntitledForInProcessAccess__block_invoke()
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
    v1 = SecTaskCopyValueForEntitlement(v0, CFSTR("com.apple.private.mediaanalysisd.datamanagement.embedding"), 0);
    *(_QWORD *)cf1 = v1;
    v3 = v1
      && (v2 = CFGetTypeID(v1), v2 == CFBooleanGetTypeID())
      && CFEqual(*(CFTypeRef *)cf1, (CFTypeRef)*MEMORY[0x1E0C9AE50]) != 0;
    +[MADEmbeddingStoreService isEntitledForInProcessAccess]::entitled = v3;
    CF<opaqueCMSampleBuffer *>::~CF((const void **)cf1);
  }
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    if (+[MADEmbeddingStoreService isEntitledForInProcessAccess]::entitled)
      v4 = "entitled";
    else
      v4 = "NOT entitled";
    *(_DWORD *)cf1 = 136315138;
    *(_QWORD *)&cf1[4] = v4;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Process is %s to access embedding store in-process", cf1, 0xCu);
  }
  return CF<opaqueCMSampleBuffer *>::~CF((const void **)&v6);
}

- (void)checkSandboxExtensionForPhotoLibraryURL:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *sandboxQueue;
  id v8;
  _QWORD block[5];
  id v10;
  id *v11;

  v6 = a3;
  sandboxQueue = self->_sandboxQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__MADEmbeddingStoreService_checkSandboxExtensionForPhotoLibraryURL_error___block_invoke;
  block[3] = &unk_1E6B16EB8;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(sandboxQueue, block);

}

void __74__MADEmbeddingStoreService_checkSandboxExtensionForPhotoLibraryURL_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[6];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__14;
    v20 = __Block_byref_object_dispose__14;
    v21 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = -1;
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __74__MADEmbeddingStoreService_checkSandboxExtensionForPhotoLibraryURL_error___block_invoke_2;
    v11[3] = &unk_1E6B166B0;
    v11[4] = &v16;
    objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __74__MADEmbeddingStoreService_checkSandboxExtensionForPhotoLibraryURL_error___block_invoke_176;
    v10[3] = &unk_1E6B16E90;
    v10[4] = &v16;
    v10[5] = &v12;
    objc_msgSend(v5, "requestEmbeddingStoreSandboxExtensionWithPhotoLibraryURL:reply:", v6, v10);

    v7 = (void *)v17[5];
    if (v7)
    {
      **(_QWORD **)(a1 + 48) = objc_retainAutorelease(v7);
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v13[3]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v9, *(_QWORD *)(a1 + 40));

      }
    }
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);

  }
}

void __74__MADEmbeddingStoreService_checkSandboxExtensionForPhotoLibraryURL_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADEmbeddingStoreService] Error connecting to embedding store service - %@", (uint8_t *)&v7, 0xCu);
  }
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __74__MADEmbeddingStoreService_checkSandboxExtensionForPhotoLibraryURL_error___block_invoke_176(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint8_t v17[8];
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v14 = objc_msgSend(v6, "copy");
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
  else
  {
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = sandbox_extension_consume();
    if ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) & 0x8000000000000000) != 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADEmbeddingStoreService] Failed to consume EmbeddingStore directory sandbox extension", v17, 2u);
      }
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MADEmbeddingStoreService] Failed to consume EmbeddingStore directory sandbox extension"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

    }
  }

}

- (id)fetchEmbeddingsWithAssetUUIDs:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  id *v15;
  void *v16;
  id v17;
  int v18;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  os_signpost_id_t v31;
  NSObject *v32;
  os_signpost_id_t v33;
  NSObject *v34;
  NSObject *v35;
  id *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  id *v42;
  _QWORD v43[6];
  _QWORD v44[5];
  id v45;
  id obj;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint8_t buf[4];
  int v60;
  uint64_t v61;

  v42 = a6;
  v61 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__14;
  v57 = __Block_byref_object_dispose__14;
  v58 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__14;
  v51 = __Block_byref_object_dispose__14;
  v52 = 0;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD16F0], "systemPhotoLibraryURL");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;
  if (!objc_msgSend((id)objc_opt_class(), "isEntitledForInProcessAccess"))
  {
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 67109120;
      v60 = v18;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MADEmbeddingStoreService] Performing XPC embedding fetching for %u assets", buf, 8u);
    }
    VCPSignPostLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_signpost_id_generate(v19);

    VCPSignPostLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "MADEmbeddingStore_XPCFetch", ", buf, 2u);
    }

    -[MADEmbeddingStoreService connection](self, "connection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v9;
    v25 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __88__MADEmbeddingStoreService_fetchEmbeddingsWithAssetUUIDs_photoLibraryURL_options_error___block_invoke;
    v44[3] = &unk_1E6B166B0;
    v44[4] = &v53;
    objc_msgSend(v23, "synchronousRemoteObjectProxyWithErrorHandler:", v44);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v25;
    v43[1] = 3221225472;
    v43[2] = __88__MADEmbeddingStoreService_fetchEmbeddingsWithAssetUUIDs_photoLibraryURL_options_error___block_invoke_185;
    v43[3] = &unk_1E6B15FD8;
    v43[4] = &v47;
    v43[5] = &v53;
    v9 = v24;
    objc_msgSend(v26, "fetchEmbeddingsWithAssetUUIDs:photoLibraryURL:options:reply:", v24, v13, v11, v43);

    VCPSignPostLog();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v20 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v27))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v29 = "MADEmbeddingStore_XPCFetch";
    v30 = v28;
    v31 = v20;
    goto LABEL_26;
  }
  if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 67109120;
    v60 = v14;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MADEmbeddingStoreService] Performing in-process embedding fetching for %u assets", buf, 8u);
  }
  v15 = (id *)(v54 + 5);
  obj = (id)v54[5];
  -[MADEmbeddingStoreService checkSandboxExtensionForPhotoLibraryURL:error:](self, "checkSandboxExtensionForPhotoLibraryURL:error:", v13, &obj, v42);
  objc_storeStrong(v15, obj);
  v16 = (void *)v54[5];
  if (v16)
  {
    v17 = 0;
    if (v42)
      *v42 = objc_retainAutorelease(v16);
    goto LABEL_31;
  }
  VCPSignPostLog();
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = os_signpost_id_generate(v32);

  VCPSignPostLog();
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "MADEmbeddingStore_InProcessFetch", ", buf, 2u);
  }

  v36 = (id *)(v54 + 5);
  v45 = (id)v54[5];
  +[MADEmbeddingStore fetchEmbeddingsWithAssetUUIDs:photoLibraryURL:options:error:](MADEmbeddingStore, "fetchEmbeddingsWithAssetUUIDs:photoLibraryURL:options:error:", v9, v13, v11, &v45);
  v37 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v36, v45);
  v38 = (void *)v48[5];
  v48[5] = v37;

  VCPSignPostLog();
  v39 = objc_claimAutoreleasedReturnValue();
  v28 = v39;
  if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
  {
    *(_WORD *)buf = 0;
    v29 = "MADEmbeddingStore_InProcessFetch";
    v30 = v28;
    v31 = v33;
LABEL_26:
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v30, OS_SIGNPOST_INTERVAL_END, v31, v29, "", buf, 2u);
  }
LABEL_27:

  if (v42)
  {
    v40 = (void *)v54[5];
    if (v40)
      *v42 = objc_retainAutorelease(v40);
  }
  v17 = (id)v48[5];
LABEL_31:

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  return v17;
}

void __88__MADEmbeddingStoreService_fetchEmbeddingsWithAssetUUIDs_photoLibraryURL_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADEmbeddingStoreService] Error connecting to embedding store service - %@", (uint8_t *)&v7, 0xCu);
  }
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __88__MADEmbeddingStoreService_fetchEmbeddingsWithAssetUUIDs_photoLibraryURL_options_error___block_invoke_185(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v7 = objc_msgSend(v6, "copy");
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (id)searchWithEmbeddings:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id *v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  os_signpost_id_t v31;
  NSObject *v32;
  os_signpost_id_t v33;
  NSObject *v34;
  NSObject *v35;
  id *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  id *v42;
  _QWORD v43[6];
  _QWORD v44[5];
  id v45;
  id obj;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint8_t buf[4];
  uint64_t v60;
  uint64_t v61;

  v42 = a6;
  v61 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__14;
  v57 = __Block_byref_object_dispose__14;
  v58 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__14;
  v51 = __Block_byref_object_dispose__14;
  v52 = 0;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD16F0], "systemPhotoLibraryURL");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;
  if (!objc_msgSend((id)objc_opt_class(), "isEntitledForInProcessAccess"))
  {
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 134217984;
      v60 = v18;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MADEmbeddingStoreService] XPC search with %llu embeddings", buf, 0xCu);
    }
    VCPSignPostLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_signpost_id_generate(v19);

    VCPSignPostLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "MADEmbeddingStore_XPCSearch", ", buf, 2u);
    }

    -[MADEmbeddingStoreService connection](self, "connection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v9;
    v25 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __79__MADEmbeddingStoreService_searchWithEmbeddings_photoLibraryURL_options_error___block_invoke;
    v44[3] = &unk_1E6B166B0;
    v44[4] = &v53;
    objc_msgSend(v23, "synchronousRemoteObjectProxyWithErrorHandler:", v44);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v25;
    v43[1] = 3221225472;
    v43[2] = __79__MADEmbeddingStoreService_searchWithEmbeddings_photoLibraryURL_options_error___block_invoke_189;
    v43[3] = &unk_1E6B16EE0;
    v43[4] = &v47;
    v43[5] = &v53;
    v9 = v24;
    objc_msgSend(v26, "searchWithEmbeddings:photoLibraryURL:options:reply:", v24, v13, v11, v43);

    VCPSignPostLog();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v20 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v27))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v29 = "MADEmbeddingStore_XPCSearch";
    v30 = v28;
    v31 = v20;
    goto LABEL_26;
  }
  if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 134217984;
    v60 = v14;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MADEmbeddingStoreService] In-process search with %llu embeddings", buf, 0xCu);
  }
  v15 = (id *)(v54 + 5);
  obj = (id)v54[5];
  -[MADEmbeddingStoreService checkSandboxExtensionForPhotoLibraryURL:error:](self, "checkSandboxExtensionForPhotoLibraryURL:error:", v13, &obj, v42);
  objc_storeStrong(v15, obj);
  v16 = (void *)v54[5];
  if (v16)
  {
    v17 = 0;
    if (v42)
      *v42 = objc_retainAutorelease(v16);
    goto LABEL_31;
  }
  VCPSignPostLog();
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = os_signpost_id_generate(v32);

  VCPSignPostLog();
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "MADEmbeddingStore_InProcessSearch", ", buf, 2u);
  }

  v36 = (id *)(v54 + 5);
  v45 = (id)v54[5];
  +[MADEmbeddingStore searchWithEmbeddings:photoLibraryURL:options:error:](MADEmbeddingStore, "searchWithEmbeddings:photoLibraryURL:options:error:", v9, v13, v11, &v45);
  v37 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v36, v45);
  v38 = (void *)v48[5];
  v48[5] = v37;

  VCPSignPostLog();
  v39 = objc_claimAutoreleasedReturnValue();
  v28 = v39;
  if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
  {
    *(_WORD *)buf = 0;
    v29 = "MADEmbeddingStore_InProcessSearch";
    v30 = v28;
    v31 = v33;
LABEL_26:
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v30, OS_SIGNPOST_INTERVAL_END, v31, v29, "", buf, 2u);
  }
LABEL_27:

  if (v42)
  {
    v40 = (void *)v54[5];
    if (v40)
      *v42 = objc_retainAutorelease(v40);
  }
  v17 = (id)v48[5];
LABEL_31:

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  return v17;
}

void __79__MADEmbeddingStoreService_searchWithEmbeddings_photoLibraryURL_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADEmbeddingStoreService] Error connecting to embedding store service - %@", (uint8_t *)&v7, 0xCu);
  }
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __79__MADEmbeddingStoreService_searchWithEmbeddings_photoLibraryURL_options_error___block_invoke_189(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v7 = objc_msgSend(v6, "copy");
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)prewarmSearchWithConcurrencyLimit:(unint64_t)a3 photoLibraryURL:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id *v12;
  void *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  NSObject *v27;
  os_signpost_id_t v28;
  NSObject *v29;
  NSObject *v30;
  id *v31;
  NSObject *v32;
  _QWORD v33[5];
  _QWORD v34[5];
  id v35;
  id obj;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t buf[4];
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = v8;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__14;
  v41 = __Block_byref_object_dispose__14;
  v42 = 0;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD16F0], "systemPhotoLibraryURL");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  if (objc_msgSend((id)objc_opt_class(), "isEntitledForInProcessAccess"))
  {
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v44 = a3;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MADEmbeddingStoreService] In-process prewarm with concurrencyLimit %u", buf, 8u);
    }
    v12 = (id *)(v38 + 5);
    obj = (id)v38[5];
    -[MADEmbeddingStoreService checkSandboxExtensionForPhotoLibraryURL:error:](self, "checkSandboxExtensionForPhotoLibraryURL:error:", v11, &obj);
    objc_storeStrong(v12, obj);
    v13 = (void *)v38[5];
    if (v13)
    {
      if (!a5)
        goto LABEL_27;
      goto LABEL_26;
    }
    VCPSignPostLog();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_signpost_id_generate(v27);

    VCPSignPostLog();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v28, "MADEmbeddingStore_InProcessPrewarm", ", buf, 2u);
    }

    v31 = (id *)(v38 + 5);
    v35 = (id)v38[5];
    +[MADEmbeddingStore prewarmSearchWithConcurrencyLimit:photoLibraryURL:error:](MADEmbeddingStore, "prewarmSearchWithConcurrencyLimit:photoLibraryURL:error:", a3, v9, &v35);
    objc_storeStrong(v31, v35);
    VCPSignPostLog();
    v32 = objc_claimAutoreleasedReturnValue();
    v23 = v32;
    if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      v24 = "MADEmbeddingStore_InProcessPrewarm";
      v25 = v23;
      v26 = v28;
      goto LABEL_23;
    }
  }
  else
  {
    VCPSignPostLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_signpost_id_generate(v14);

    VCPSignPostLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "MADEmbeddingStore_XPCPrewarm", ", buf, 2u);
    }

    -[MADEmbeddingStoreService connection](self, "connection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v11;
    v20 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __84__MADEmbeddingStoreService_prewarmSearchWithConcurrencyLimit_photoLibraryURL_error___block_invoke;
    v34[3] = &unk_1E6B166B0;
    v34[4] = &v37;
    objc_msgSend(v18, "synchronousRemoteObjectProxyWithErrorHandler:", v34);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v20;
    v33[1] = 3221225472;
    v33[2] = __84__MADEmbeddingStoreService_prewarmSearchWithConcurrencyLimit_photoLibraryURL_error___block_invoke_193;
    v33[3] = &unk_1E6B166B0;
    v33[4] = &v37;
    v11 = v19;
    objc_msgSend(v21, "prewarmSearchWithConcurrencyLimit:photoLibraryURL:reply:", a3, v19, v33);

    VCPSignPostLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      v24 = "MADEmbeddingStore_XPCPrewarm";
      v25 = v23;
      v26 = v15;
LABEL_23:
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v25, OS_SIGNPOST_INTERVAL_END, v26, v24, "", buf, 2u);
    }
  }

  if (a5)
  {
    v13 = (void *)v38[5];
    if (v13)
LABEL_26:
      *a5 = objc_retainAutorelease(v13);
  }
LABEL_27:

  _Block_object_dispose(&v37, 8);
}

void __84__MADEmbeddingStoreService_prewarmSearchWithConcurrencyLimit_photoLibraryURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADEmbeddingStoreService] Error connecting to embedding store service - %@", (uint8_t *)&v7, 0xCu);
  }
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __84__MADEmbeddingStoreService_prewarmSearchWithConcurrencyLimit_photoLibraryURL_error___block_invoke_193(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxHandles, 0);
  objc_storeStrong((id *)&self->_sandboxQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

void __38__MADEmbeddingStoreService_connection__block_invoke_2_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADEmbeddingStoreService] Client XPC connection interrupted", v0, 2u);
}

void __38__MADEmbeddingStoreService_connection__block_invoke_168_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADEmbeddingStoreService] Client XPC connection invalidated", v0, 2u);
}

@end

@implementation VCPMediaAnalyzer

- (VCPMediaAnalyzer)init
{
  VCPMediaAnalyzer *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *analysisQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *storageQueue;
  dispatch_queue_t v7;
  OS_dispatch_queue *searchQueue;
  dispatch_group_t v9;
  OS_dispatch_group *storageGroup;
  NSNumber *standalone;
  NSNumber *noResultStrip;
  NSXPCConnection *connection;
  NSXPCConnection *mediaAnalysisServiceConnection;
  dispatch_queue_t v15;
  OS_dispatch_queue *sandboxQueue;
  uint64_t v17;
  NSMutableDictionary *sandboxHandles;
  dispatch_queue_t v19;
  OS_dispatch_queue *cancelQueue;
  uint64_t v21;
  NSMutableDictionary *cancelTokens;
  VCPMediaAnalyzer *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)VCPMediaAnalyzer;
  v2 = -[VCPMediaAnalyzer init](&v25, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.mediaanalysis.ondemand", 0);
    analysisQueue = v2->_analysisQueue;
    v2->_analysisQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.mediaanalysis.storage", 0);
    storageQueue = v2->_storageQueue;
    v2->_storageQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("com.apple.mediaanalysis.search", 0);
    searchQueue = v2->_searchQueue;
    v2->_searchQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_group_create();
    storageGroup = v2->_storageGroup;
    v2->_storageGroup = (OS_dispatch_group *)v9;

    standalone = v2->_standalone;
    v2->_standalone = 0;

    noResultStrip = v2->_noResultStrip;
    v2->_noResultStrip = 0;

    connection = v2->_connection;
    v2->_connection = 0;

    mediaAnalysisServiceConnection = v2->_mediaAnalysisServiceConnection;
    v2->_mediaAnalysisServiceConnection = 0;

    v15 = dispatch_queue_create("com.apple.mediaanalysis.VCPMediaAnalyzer.sandboxQueue", 0);
    sandboxQueue = v2->_sandboxQueue;
    v2->_sandboxQueue = (OS_dispatch_queue *)v15;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    sandboxHandles = v2->_sandboxHandles;
    v2->_sandboxHandles = (NSMutableDictionary *)v17;

    atomic_store(0, (unsigned int *)&v2->_nextRequestID);
    v19 = dispatch_queue_create("com.apple.mediaanalysis.VCPMediaAnalyzer.cancelQueue", 0);
    cancelQueue = v2->_cancelQueue;
    v2->_cancelQueue = (OS_dispatch_queue *)v19;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    cancelTokens = v2->_cancelTokens;
    v2->_cancelTokens = (NSMutableDictionary *)v21;

    v23 = v2;
  }

  return v2;
}

+ (id)sharedMediaAnalyzer
{
  if (+[VCPMediaAnalyzer sharedMediaAnalyzer]::once != -1)
    dispatch_once(&+[VCPMediaAnalyzer sharedMediaAnalyzer]::once, &__block_literal_global_64);
  return (id)+[VCPMediaAnalyzer sharedMediaAnalyzer]::instance;
}

void __39__VCPMediaAnalyzer_sharedMediaAnalyzer__block_invoke()
{
  VCPMediaAnalyzer *v0;
  void *v1;

  v0 = objc_alloc_init(VCPMediaAnalyzer);
  v1 = (void *)+[VCPMediaAnalyzer sharedMediaAnalyzer]::instance;
  +[VCPMediaAnalyzer sharedMediaAnalyzer]::instance = (uint64_t)v0;

}

+ (unint64_t)getUnifiedEmbeddingVersion
{
  return +[VCPVideoTransformerBackbone embeddingVersion](VCPVideoTransformerBackbone, "embeddingVersion");
}

+ (void)getEmbeddingFormatForVersion:(unint64_t)a3 dimension:(int *)a4 type:(unint64_t *)a5 error:(id *)a6
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a3 - 5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    if (a4)
      *a4 = 512;
    if (a5)
      *a5 = 1;
  }
  else if (a6)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("version %d is not supported"), a4, a5, a3, *MEMORY[0x1E0CB2D50]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v9);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
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
  -[NSXPCConnection invalidate](self->_mediaAnalysisServiceConnection, "invalidate");
  v7.receiver = self;
  v7.super_class = (Class)VCPMediaAnalyzer;
  -[VCPMediaAnalyzer dealloc](&v7, sel_dealloc);
}

- (void)_setupMediaAnalysisServiceConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *mediaAnalysisServiceConnection;
  void *v5;
  NSXPCConnection *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  if (!self->_mediaAnalysisServiceConnection)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.mediaanalysisd.analysis"), 0);
    mediaAnalysisServiceConnection = self->_mediaAnalysisServiceConnection;
    self->_mediaAnalysisServiceConnection = v3;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1A27D0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_mediaAnalysisServiceConnection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection setInterruptionHandler:](self->_mediaAnalysisServiceConnection, "setInterruptionHandler:", &__block_literal_global_544);
    objc_initWeak(&location, self);
    v6 = self->_mediaAnalysisServiceConnection;
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __56__VCPMediaAnalyzer__setupMediaAnalysisServiceConnection__block_invoke_545;
    v10 = &unk_1E6B16988;
    objc_copyWeak(&v11, &location);
    -[NSXPCConnection setInvalidationHandler:](v6, "setInvalidationHandler:", &v7);
    -[NSXPCConnection resume](self->_mediaAnalysisServiceConnection, "resume", v7, v8, v9, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __56__VCPMediaAnalyzer__setupMediaAnalysisServiceConnection__block_invoke()
{
  uint8_t v0[16];

  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VCPMediaAnalyzer] Client XPC connection interrupted", v0, 2u);
  }
}

void __56__VCPMediaAnalyzer__setupMediaAnalysisServiceConnection__block_invoke_545(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[VCPMediaAnalyzer] Client XPC connection invalidated", buf, 2u);
  }
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[10];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__VCPMediaAnalyzer__setupMediaAnalysisServiceConnection__block_invoke_546;
    block[3] = &unk_1E6B15468;
    block[4] = v3;
    dispatch_async(v4, block);
  }

}

void __56__VCPMediaAnalyzer__setupMediaAnalysisServiceConnection__block_invoke_546(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 72);
  *(_QWORD *)(v1 + 72) = 0;

}

- (int64_t)_getSandboxExtensionForMediaAnalysisDatabaseWithPhotoLibraryURL:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSXPCConnection *mediaAnalysisServiceConnection;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int64_t v11;
  _QWORD v13[4];
  NSObject *v14;
  uint8_t *v15;
  _QWORD v16[4];
  NSObject *v17;
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  -[VCPMediaAnalyzer _setupMediaAnalysisServiceConnection](self, "_setupMediaAnalysisServiceConnection");
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VCPMediaAnalyzer] Acquiring media analysis directory sandbox extension...", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v19 = buf;
  v20 = 0x2020000000;
  v21 = -1;
  v5 = dispatch_semaphore_create(0);
  mediaAnalysisServiceConnection = self->_mediaAnalysisServiceConnection;
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__VCPMediaAnalyzer__getSandboxExtensionForMediaAnalysisDatabaseWithPhotoLibraryURL___block_invoke;
  v16[3] = &unk_1E6B16130;
  v8 = v5;
  v17 = v8;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](mediaAnalysisServiceConnection, "remoteObjectProxyWithErrorHandler:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __84__VCPMediaAnalyzer__getSandboxExtensionForMediaAnalysisDatabaseWithPhotoLibraryURL___block_invoke_548;
  v13[3] = &unk_1E6B1A140;
  v15 = buf;
  v10 = v8;
  v14 = v10;
  objc_msgSend(v9, "requestMediaAnalysisDatabaseAccessSandboxExtensionWithPhotoLibraryURL:andReply:", v4, v13);

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v11 = *((_QWORD *)v19 + 3);

  _Block_object_dispose(buf, 8);
  return v11;
}

void __84__VCPMediaAnalyzer__getSandboxExtensionForMediaAnalysisDatabaseWithPhotoLibraryURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = CFSTR("com.apple.mediaanalysisd.analysis");
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[VCPMediaAnalyzer] Failed to establish connection or connection lost to service %@; %@",
      (uint8_t *)&v5,
      0x16u);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __84__VCPMediaAnalyzer__getSandboxExtensionForMediaAnalysisDatabaseWithPhotoLibraryURL___block_invoke_548(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  os_log_type_t v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  __int16 v9;
  uint8_t buf[2];

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = sandbox_extension_consume();
    if ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) & 0x8000000000000000) != 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v5 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v6 = MEMORY[0x1E0C81028];
          v7 = "[VCPMediaAnalyzer] Failed to consume media analysis directory sandbox extension";
          v8 = buf;
          goto LABEL_9;
        }
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v5 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v9 = 0;
        v6 = MEMORY[0x1E0C81028];
        v7 = "[VCPMediaAnalyzer] Consumed media analysis directory sandbox extension";
        v8 = (uint8_t *)&v9;
LABEL_9:
        _os_log_impl(&dword_1B6C4A000, v6, v5, v7, v8, 2u);
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  void *v6;

  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.mediaanalysisd.photos"), 0);
    v5 = self->_connection;
    self->_connection = v4;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1A2950);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection resume](self->_connection, "resume");
    connection = self->_connection;
  }
  return connection;
}

- (int64_t)_getDatabaseSandboxExtensionForPhotoLibraryURL:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int64_t v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = -1;
  v5 = dispatch_semaphore_create(0);
  -[VCPMediaAnalyzer connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67__VCPMediaAnalyzer__getDatabaseSandboxExtensionForPhotoLibraryURL___block_invoke;
  v16[3] = &unk_1E6B16130;
  v8 = v5;
  v17 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __67__VCPMediaAnalyzer__getDatabaseSandboxExtensionForPhotoLibraryURL___block_invoke_558;
  v13[3] = &unk_1E6B1A140;
  v15 = &v18;
  v10 = v8;
  v14 = v10;
  objc_msgSend(v9, "registerClient:forPhotoLibraryURL:withReply:", CFSTR("VCPMediaAnalyzer"), v4, v13);

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v11 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v11;
}

intptr_t __67__VCPMediaAnalyzer__getDatabaseSandboxExtensionForPhotoLibraryURL___block_invoke(uint64_t a1)
{
  uint8_t v3[16];

  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] failed to get database sandbox extension", v3, 2u);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __67__VCPMediaAnalyzer__getDatabaseSandboxExtensionForPhotoLibraryURL___block_invoke_558(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  os_log_type_t v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  __int16 v9;
  uint8_t buf[2];

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = sandbox_extension_consume();
    if ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) & 0x8000000000000000) != 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v5 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v6 = MEMORY[0x1E0C81028];
          v7 = "[MediaAnalysis] failed to consume sandbox extension";
          v8 = buf;
          goto LABEL_9;
        }
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v5 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v9 = 0;
        v6 = MEMORY[0x1E0C81028];
        v7 = "[MediaAnalysis] Consumed sandbox extension";
        v8 = (uint8_t *)&v9;
LABEL_9:
        _os_log_impl(&dword_1B6C4A000, v6, v5, v7, v8, 2u);
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)_databaseForPhotoLibrary:(id)a3
{
  id v4;
  NSObject *sandboxQueue;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  VCPMediaAnalyzer *v14;

  v4 = a3;
  sandboxQueue = self->_sandboxQueue;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __45__VCPMediaAnalyzer__databaseForPhotoLibrary___block_invoke;
  v12 = &unk_1E6B16D58;
  v6 = v4;
  v13 = v6;
  v14 = self;
  dispatch_sync(sandboxQueue, &v9);
  +[VCPClientDatabaseManager sharedDatabaseForPhotoLibrary:](VCPClientDatabaseManager, "sharedDatabaseForPhotoLibrary:", v6, v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __45__VCPMediaAnalyzer__databaseForPhotoLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v2, "photoLibraryURL");
  else
    objc_msgSend(MEMORY[0x1E0CD16F0], "vcp_defaultURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_msgSend(*(id *)(a1 + 40), "_getSandboxExtensionForMediaAnalysisDatabaseWithPhotoLibraryURL:", v3);
    if (v5 < 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "path");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412290;
        v9 = v7;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Failed to obtain analysis sandbox extension for Photo Library (%@); client may not be able to "
          "open analysis database",
          (uint8_t *)&v8,
          0xCu);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "setObject:forKeyedSubscript:", v6, v3);

    }
  }

}

- (id)_addClassificationResults:(id)a3 analysis:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v26 = a4;
  if (v5
    && (objc_msgSend(v5, "vcp_modificationDate"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v5, "sceneClassifications");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v12, "confidence");
          if (v13 != 0.0 && objc_msgSend(v12, "extendedSceneIdentifier"))
          {
            v14 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v12, "confidence");
            objc_msgSend(v14, "numberWithDouble:");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v12, "extendedSceneIdentifier"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "stringValue");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKey:", v15, v17);

          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
      }
      while (v9);
    }

    if (v7 && objc_msgSend(v7, "count"))
    {
      if (v26)
      {
        v18 = (id)objc_msgSend(v26, "mutableCopy");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "vcp_setVersion:", 69);
        objc_msgSend(v5, "vcp_modificationDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "vcp_setDateModified:", v21);

        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "vcp_setDateAnalyzed:", v22);

        v18 = v20;
        objc_msgSend(v20, "vcp_setFlags:", 0);
      }
      v31 = CFSTR("attributes");
      v32 = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "vcp_setResult:forKey:", v24, CFSTR("ClassificationResults"));

      objc_msgSend(v18, "vcp_addTypes:", 0x4000);
    }
    else
    {
      v18 = v26;
    }

    v19 = v26;
  }
  else
  {
    v19 = v26;
    v18 = v26;
  }

  return v18;
}

- (unint64_t)_metaAnalysisTypesForAsset:(id)a3
{
  return 4 * (objc_msgSend(a3, "mediaType") == 1);
}

- (unint64_t)_typesToRemove:(unint64_t)a3 requested:(unint64_t)a4
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3 & ~a4 & 0xFFFFFFFFFFFFFF33;
  if ((a3 & 0xC) == 4)
    v5 = v4 | 4;
  else
    v5 = a3 & ~a4 & 0xFFFFFFFFFFFFFF33;
  if ((a4 & 0xC) == 0)
    v4 |= 0xCuLL;
  if ((a4 & 0xC) == 8)
    v4 = v5;
  if ((a3 & 0xC0) == 0x40)
    v6 = v4 | 0x40;
  else
    v6 = v4;
  if ((a4 & 0xC0) == 0)
    v4 |= 0xC0uLL;
  if ((a4 & 0xC0) == 0x80)
    return v6;
  else
    return v4;
}

- (id)_postProcessMovieHighlights:(id)a3 analysis:(id)a4 withOptions:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  const __CFDictionary *v12;
  id v13;
  __int128 v14;
  float v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  const __CFDictionary *v26;
  double Seconds;
  float v28;
  double v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  CFDictionaryRef v34;
  CFDictionaryRef v35;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
  NSObject *v40;
  os_signpost_id_t v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  CFDictionaryRef v45;
  NSObject *v46;
  NSObject *v47;
  double v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  unint64_t v59;
  unint64_t v60;
  void *v61;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t j;
  const __CFDictionary *v69;
  double v70;
  float v71;
  void *v72;
  const __CFDictionary *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  CMTime v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  CMTime v85;
  CMTime v86;
  id v87;
  CMTime v88;
  CMTime time;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  CMTime time2;
  CMTime time1;
  CMTime v96;
  CMTime duration;
  CMTimeRange v98;
  _BYTE v99[128];
  _QWORD v100[3];
  _QWORD v101[3];
  _QWORD v102[4];
  _QWORD v103[4];
  _QWORD v104[3];
  _QWORD v105[3];
  void *v106;
  void *v107;
  CMTimeRange buf;
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v77 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  v78 = v8;
  if (v8)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MaxHighlightDuration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HighlightBestTrim"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HighlightContexts"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HighlightPreferredRange"));
    v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    memset(&v98, 0, sizeof(v98));
    v73 = v12;
    if (v12)
    {
      CMTimeRangeMakeFromDictionary(&v98, v12);
    }
    else
    {
      v14 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
      *(_OWORD *)&v98.start.value = *MEMORY[0x1E0CA2E50];
      *(_OWORD *)&v98.start.epoch = v14;
      *(_OWORD *)&v98.duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HighlightTargetDuration"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HighlightTolerance"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      LOWORD(buf.start.value) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Movie Highlights post processing with input options", (uint8_t *)&buf, 2u);
    }
    if (v11)
    {
      objc_msgSend(v11, "floatValue");
      if (v15 > 10.0)
      {
        if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.start.value) = 134218240;
          *(double *)((char *)&buf.start.value + 4) = 10.0;
          LOWORD(buf.start.flags) = 2048;
          *(double *)((char *)&buf.start.flags + 2) = 10.0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Requested max highlight duration longer than %.2fs, fall back to %.2fs", (uint8_t *)&buf, 0x16u);
        }
        LODWORD(v16) = 1092616192;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
        v17 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v17;
      }
    }
    objc_msgSend(v8, "vcp_results");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("MovieHighlightResults"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 || v79 && objc_msgSend(v79, "count"))
    {

    }
    else if ((v98.start.flags & 1) != 0
           && (v98.duration.flags & 1) != 0
           && !v98.duration.epoch
           && (v98.duration.value & 0x8000000000000000) == 0)
    {
      duration = v98.duration;
      v96 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      v38 = CMTimeCompare(&duration, &v96) == 0;

      if (v38)
      {
        v13 = v78;
LABEL_93:

        goto LABEL_94;
      }
LABEL_18:
      if ((objc_msgSend(v77, "vcp_isVideoSlowmo") & 1) != 0
        || v79 && objc_msgSend(v79, "count")
        || (v98.start.flags & 1) == 0
        || (v98.duration.flags & 1) == 0
        || v98.duration.epoch
        || v98.duration.value < 0)
      {
        v20 = 10.0;
      }
      else
      {
        time1 = v98.duration;
        time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
        v20 = 10.0;
        if (!CMTimeCompare(&time1, &time2) && !v75)
        {
          v92 = 0u;
          v93 = 0u;
          v90 = 0u;
          v91 = 0u;
          objc_msgSend(v78, "vcp_results");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("MovieHighlightResults"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v90, v109, 16);
          if (v23)
          {
            v24 = *(_QWORD *)v91;
            v20 = 0.0;
            while (2)
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v91 != v24)
                  objc_enumerationMutation(v22);
                v26 = *(const __CFDictionary **)(*((_QWORD *)&v90 + 1) + 8 * i);
                memset(&buf, 0, sizeof(buf));
                CMTimeRangeMakeFromDictionary(&buf, v26);
                if (v11)
                {
                  time = buf.duration;
                  Seconds = CMTimeGetSeconds(&time);
                  objc_msgSend(v11, "floatValue");
                  if (Seconds > v28)
                  {

                    goto LABEL_40;
                  }
                }
                v88 = buf.duration;
                v29 = CMTimeGetSeconds(&v88);
                if (v20 < v29)
                  v20 = v29;
              }
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v90, v109, 16);
              if (v23)
                continue;
              break;
            }
          }
          else
          {
            v20 = 0.0;
          }

          if (!v76 || !objc_msgSend(v76, "BOOLValue"))
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v83 = 0u;
            v84 = 0u;
            v81 = 0u;
            v82 = 0u;
            objc_msgSend(v78, "vcp_results");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("MovieHighlightResults"));
            v65 = (void *)objc_claimAutoreleasedReturnValue();

            v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v81, v99, 16);
            if (v66)
            {
              v67 = *(_QWORD *)v82;
              do
              {
                for (j = 0; j != v66; ++j)
                {
                  if (*(_QWORD *)v82 != v67)
                    objc_enumerationMutation(v65);
                  v69 = *(const __CFDictionary **)(*((_QWORD *)&v81 + 1) + 8 * j);
                  memset(&buf, 0, sizeof(buf));
                  CMTimeRangeMakeFromDictionary(&buf, v69);
                  v80 = buf.duration;
                  v70 = CMTimeGetSeconds(&v80);
                  -[NSNumber floatValue](self->_minHighlightDuration, "floatValue");
                  if (v70 >= v71)
                    objc_msgSend(v63, "addObject:", v69);
                }
                v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v81, v99, 16);
              }
              while (v66);
            }

            v72 = (void *)objc_msgSend(v78, "mutableCopy");
            objc_msgSend(v72, "vcp_setResult:forKey:", v63, CFSTR("MovieHighlightResults"));
            v13 = v78;

            goto LABEL_93;
          }
        }
      }
LABEL_40:
      if (v79 && objc_msgSend(v79, "count"))
      {
        objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("SearchQueryString"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30 == 0;

        if (v31)
        {
          v34 = 0;
        }
        else
        {
          v32 = (void *)objc_msgSend(v10, "mutableCopy");
          objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("SearchQueryString"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, CFSTR("SearchQueryString"));

          v34 = (CFDictionaryRef)v32;
        }
        if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v77, "localIdentifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf.start.value) = 138412290;
          *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v39;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis][%@] find time ranges matching highlight contexts", (uint8_t *)&buf, 0xCu);

        }
        VCPSignPostLog();
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = os_signpost_id_generate(v40);

        VCPSignPostLog();
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = v42;
        if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
        {
          LOWORD(buf.start.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v43, OS_SIGNPOST_INTERVAL_BEGIN, v41, "VCPMovieHighlightContexts", ", (uint8_t *)&buf, 2u);
        }

        v107 = v78;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
          v45 = v34;
        else
          v45 = (CFDictionaryRef)v10;
        v87 = 0;
        -[VCPMediaAnalyzer findTimeRangesFor:inAsset:withOptions:results:andError:](self, "findTimeRangesFor:inAsset:withOptions:results:andError:", v79, v77, v45, v44, &v87);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (CFDictionaryRef)v87;

        VCPSignPostLog();
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = v46;
        if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
        {
          LOWORD(buf.start.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v47, OS_SIGNPOST_INTERVAL_END, v41, "VCPMovieHighlightContexts", ", (uint8_t *)&buf, 2u);
        }

        if (v11)
        {
          v36 = v76;
          v76 = (void *)MEMORY[0x1E0C9AAB0];
        }
        else
        {
          LODWORD(v48) = 1092616192;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v48);
          v49 = objc_claimAutoreleasedReturnValue();
          v36 = v76;
          v76 = (void *)MEMORY[0x1E0C9AAB0];
          v11 = (void *)v49;
        }
      }
      else
      {
        if ((v98.start.flags & 1) != 0
          && (v98.duration.flags & 1) != 0
          && !v98.duration.epoch
          && (v98.duration.value & 0x8000000000000000) == 0)
        {
          v86 = v98.duration;
          v85 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
          if (!CMTimeCompare(&v86, &v85))
          {
            v37 = 0;
            goto LABEL_75;
          }
        }
        v104[0] = CFSTR("start");
        *(_OWORD *)&buf.start.value = *(_OWORD *)&v98.start.value;
        buf.start.epoch = v98.start.epoch;
        v35 = CMTimeCopyAsDictionary(&buf.start, 0);
        v105[0] = v35;
        v104[1] = CFSTR("duration");
        buf.start = v98.duration;
        v34 = CMTimeCopyAsDictionary(&buf.start, 0);
        v104[2] = CFSTR("quality");
        v105[1] = v34;
        v105[2] = &unk_1E6B72440;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, v104, 3);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = v36;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v106, 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
      }

LABEL_75:
      v102[0] = CFSTR("HighlightMaxDuration");
      v50 = v11;
      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v51 = (void *)MEMORY[0x1E0C9AAA0];
      if (v76)
        v51 = v76;
      v103[0] = v50;
      v103[1] = v51;
      v102[1] = CFSTR("HighlightBestTrim");
      v102[2] = CFSTR("HighlightFullResult");
      v102[3] = CFSTR("HighlightContexts");
      if (v37)
        v52 = v37;
      else
        v52 = (void *)MEMORY[0x1E0C9AA60];
      v103[2] = MEMORY[0x1E0C9AAB0];
      v103[3] = v52;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, v102, 4);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)

      if (v75)
      {
        v54 = (void *)objc_msgSend(v53, "mutableCopy");
        objc_msgSend(v54, "removeObjectForKey:", CFSTR("HighlightMaxDuration"));
        objc_msgSend(v54, "removeObjectForKey:", CFSTR("HighlightBestTrim"));
        v100[0] = CFSTR("HighlightTargetDuration");
        v100[1] = CFSTR("HighlightTolerance");
        v55 = &unk_1E6B71FC0;
        if (v74)
          v55 = v74;
        v101[0] = v75;
        v101[1] = v55;
        v100[2] = CFSTR("HighlightIndex");
        v101[2] = &unk_1E6B74900;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, v100, 3);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "addEntriesFromDictionary:", v56);

      }
      else
      {
        v54 = v53;
      }
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AllowOnDemand"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "BOOLValue");

      v59 = objc_msgSend(v77, "pixelWidth");
      v60 = objc_msgSend(v77, "pixelHeight");
      if (v58)
        v61 = v77;
      else
        v61 = 0;
      MediaAnalysisPostProcessMovieHighlights(v78, v54, v61, (double)v59, (double)v60);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_93;
    }

    goto LABEL_18;
  }
  v13 = 0;
LABEL_94:

  return v13;
}

- (id)_addCaptionToHighlightResults:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  id obj;
  void *v34;
  uint64_t v35;
  CMTimeRange v36;
  CMTimeRange buf;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  objc_msgSend(v31, "vcp_results");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v31, "vcp_results");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MiCaVideoCaptionResults"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
LABEL_5:

LABEL_6:
      objc_msgSend(v31, "vcp_results");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("VideoSegmentCaptionResults"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = v10;
      v11 = objc_msgSend(v10, "count");
      if (!v11)
      {
        objc_msgSend(v31, "vcp_results");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MiCaVideoCaptionResults"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "count"))
        {
          v34 = v13;
        }
        else
        {
          objc_msgSend(v31, "vcp_results");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("VideoCaptionResults"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      objc_msgSend(v31, "vcp_results");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("MovieHighlightResults"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v19;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v39 != v21)
              objc_enumerationMutation(obj);
            v23 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            v24 = (void *)objc_msgSend(v23, "mutableCopy");
            memset(&buf, 0, sizeof(buf));
            CMTimeRangeMakeFromDictionary(&buf, (CFDictionaryRef)v23);
            v36 = buf;
            -[VCPMediaAnalyzer _getCaptionFor:withCaptions:hasSegment:](self, "_getCaptionFor:withCaptions:hasSegment:", &v36, v34, v11 != 0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v25;
            if (v25)
            {
              v27 = (void *)objc_msgSend(v25, "mutableCopy");
              objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("attributes"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "addEntriesFromDictionary:", v28);

              objc_msgSend(v24, "setObject:forKeyedSubscript:", v27, CFSTR("attributes"));
            }
            objc_msgSend(v17, "addObject:", v24);

          }
          v19 = obj;
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        }
        while (v20);
      }

      v29 = (void *)objc_msgSend(v31, "mutableCopy");
      objc_msgSend(v29, "vcp_setResult:forKey:", v17, CFSTR("MovieHighlightResults"));

      return v31;
    }
    objc_msgSend(v31, "vcp_results");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("VideoSegmentCaptionResults"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {

      goto LABEL_5;
    }
    objc_msgSend(v31, "vcp_results");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("VideoCaptionResults"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v15, "count");

    if (v35)
      goto LABEL_6;
  }
  else
  {

  }
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.start.value) = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalyzer]Caption add to Highlight - no highlight or caption", (uint8_t *)&buf, 2u);
  }
  return v31;
}

- (id)_getCaptionFor:(id *)a3 withCaptions:(id)a4 hasSegment:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFDictionary *v12;
  void *v13;
  void *v14;
  CMTime v16;
  CMTimeRange range;
  CMTimeRange time;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CMTime v23;
  CMTime v24;
  CMTime rhs;
  _BYTE v26[128];
  uint64_t v27;

  v5 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (v5)
  {
    memset(&v24, 0, sizeof(v24));
    *(_OWORD *)&time.start.value = *(_OWORD *)&a3->var1.var0;
    time.start.epoch = a3->var1.var3;
    CMTimeMultiplyByRatio(&v23, &time.start, 1, 2);
    *(_OWORD *)&time.start.value = *(_OWORD *)&a3->var0.var0;
    time.start.epoch = a3->var0.var3;
    rhs = v23;
    CMTimeAdd(&v24, &time.start, &rhs);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v20;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v8);
          v12 = *(const __CFDictionary **)(*((_QWORD *)&v19 + 1) + 8 * v11);
          memset(&time, 0, sizeof(time));
          CMTimeRangeMakeFromDictionary(&time, v12);
          range = time;
          v16 = v24;
          if (CMTimeRangeContainsTime(&range, &v16))
          {
            -[__CFDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("attributes"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_15;
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
        if (v9)
          continue;
        break;
      }
    }

  }
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("attributes"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
LABEL_15:

  return v14;
}

- (id)_analyzeOndemand:(id)a3 forAnalysisTypes:(unint64_t)a4 withExistingAnalysis:(id)a5 andOptions:(id)a6 storeAnalysis:(BOOL)a7 cancelBlock:(id)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *analysisQueue;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  NSObject *storageQueue;
  void *v25;
  float v26;
  int v27;
  uint64_t v28;
  id v29;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  id v35;
  VCPMediaAnalyzer *v36;
  uint64_t *v37;
  _QWORD block[4];
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;

  v9 = a7;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__40;
  v49 = __Block_byref_object_dispose__40;
  v50 = 0;
  analysisQueue = self->_analysisQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__VCPMediaAnalyzer__analyzeOndemand_forAnalysisTypes_withExistingAnalysis_andOptions_storeAnalysis_cancelBlock___block_invoke;
  block[3] = &unk_1E6B1A168;
  v19 = v14;
  v39 = v19;
  v20 = v16;
  v40 = v20;
  v44 = a4;
  v21 = v15;
  v41 = v21;
  v43 = &v45;
  v22 = v17;
  v42 = v22;
  dispatch_sync(analysisQueue, block);
  if (v9)
  {
    v23 = (void *)v46[5];
    if (v23)
    {
      if (objc_msgSend(v23, "vcp_types") && !-[NSNumber BOOLValue](self->_standalone, "BOOLValue"))
      {
        dispatch_group_enter((dispatch_group_t)self->_storageGroup);
        storageQueue = self->_storageQueue;
        v31 = MEMORY[0x1E0C809B0];
        v32 = 3221225472;
        v33 = __112__VCPMediaAnalyzer__analyzeOndemand_forAnalysisTypes_withExistingAnalysis_andOptions_storeAnalysis_cancelBlock___block_invoke_2;
        v34 = &unk_1E6B16B08;
        v37 = &v45;
        v35 = v19;
        v36 = self;
        dispatch_async(storageQueue, &v31);

      }
    }
  }
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("ScaledSlomoTime"), v31, v32, v33, v34);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "floatValue");
  if (v26 == 0.0)
    goto LABEL_9;
  v27 = objc_msgSend(v19, "vcp_isVideoSlowmo");

  if (v27)
  {
    MediaAnalysisPostProcessAnalysis(v19, (void *)v46[5], 0);
    v28 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v46[5];
    v46[5] = v28;
LABEL_9:

  }
  v29 = (id)v46[5];

  _Block_object_dispose(&v45, 8);
  return v29;
}

void __112__VCPMediaAnalyzer__analyzeOndemand_forAnalysisTypes_withExistingAnalysis_andOptions_storeAnalysis_cancelBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  VCPMovieAnalyzer *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v2 = (void *)MEMORY[0x1BCCA1B2C]();
  objc_msgSend(MEMORY[0x1E0CD1440], "vcp_allAcceptableResourcesForAsset:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "vcp_fullAnalysisTypesForResources:", v3);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("AllowStreaming"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "BOOLValue"))
  {
    +[VCPInternetReachability sharedInstance](VCPInternetReachability, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "hasWifiOrEthernetConnection") && (*(_QWORD *)(a1 + 72) & ~v4) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "vcp_eligibleForStreaming:", 0))
        v7 = objc_msgSend(*(id *)(a1 + 32), "vcp_eligibleForVideoDownload:", v3);
      else
        v7 = 0;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  if (objc_msgSend(*(id *)(a1 + 32), "isVideo"))
  {
    if ((v7 & 1) != 0
      || +[VCPMovieAnalyzer canAnalyzeUndegraded:withResources:](VCPMovieAnalyzer, "canAnalyzeUndegraded:withResources:", *(_QWORD *)(a1 + 32), v3))
    {
      v9 = -[VCPMovieAnalyzer initWithPHAsset:withExistingAnalysis:forAnalysisTypes:]([VCPMovieAnalyzer alloc], "initWithPHAsset:withExistingAnalysis:forAnalysisTypes:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72));
      -[VCPMovieAnalyzer setAllowStreaming:](v9, "setAllowStreaming:", v7);
      -[VCPMovieAnalyzer setOnDemand:](v9, "setOnDemand:", 1);
      -[VCPMovieAnalyzer analyzeAsset:streamed:](v9, "analyzeAsset:streamed:", *(_QWORD *)(a1 + 56), 0);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      MediaAnalysisStripKeyframeResourceResultsFromAnalysis(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_17:
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      goto LABEL_18;
    }
    if ((*(_BYTE *)(a1 + 73) & 8) != 0
      && objc_msgSend(v3, "vcp_hasLocalPhoto:", objc_msgSend(*(id *)(a1 + 32), "hasAdjustments")))
    {
      v9 = -[VCPPhotoAnalyzer initWithPHAsset:withExistingAnalysis:forAnalysisTypes:]([VCPPhotoAnalyzer alloc], "initWithPHAsset:withExistingAnalysis:forAnalysisTypes:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), 2048);
      -[VCPMovieAnalyzer analyzeAsset:withOptions:](v9, "analyzeAsset:withOptions:", *(_QWORD *)(a1 + 56), 0);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isPhoto"))
  {
    v9 = -[VCPPhotoAnalyzer initWithPHAsset:withExistingAnalysis:forAnalysisTypes:]([VCPPhotoAnalyzer alloc], "initWithPHAsset:withExistingAnalysis:forAnalysisTypes:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72));
    -[VCPMovieAnalyzer setAllowStreaming:](v9, "setAllowStreaming:", v7);
    -[VCPMovieAnalyzer setOnDemand:](v9, "setOnDemand:", 1);
    -[VCPMovieAnalyzer analyzeAsset:withOptions:](v9, "analyzeAsset:withOptions:", *(_QWORD *)(a1 + 56), 0);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
LABEL_18:

  objc_autoreleasePoolPop(v2);
}

void __112__VCPMediaAnalyzer__analyzeOndemand_forAnalysisTypes_withExistingAnalysis_andOptions_storeAnalysis_cancelBlock___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(v3, "vcp_results");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithDictionary:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v3, "vcp_types");
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("FaceQualityResults"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("ParallaxResults"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("WallpaperExportResults"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("WatchFaceResults"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("PetsResults"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("PetsFaceResults"));
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("metadataRanges"));
    if (objc_msgSend(v6, "count"))
      objc_msgSend(v3, "vcp_setResults:", v6);
    objc_msgSend(v3, "vcp_setTypes:", v7 & 0xFFFFFF67FFFDFFFFLL);

  }
  else
  {
    v3 = 0;
  }

  if (objc_msgSend(v3, "vcp_types"))
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v8;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis][%@] Storing on-demand analysis", buf, 0xCu);

    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.mediaanalysisd.photos"), 0);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1A2950);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRemoteObjectInterface:", v10);

    objc_msgSend(v9, "resume");
    v11 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __112__VCPMediaAnalyzer__analyzeOndemand_forAnalysisTypes_withExistingAnalysis_andOptions_storeAnalysis_cancelBlock___block_invoke_571;
    v20[3] = &unk_1E6B1A190;
    v12 = *(id *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v21 = v12;
    v22 = v13;
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "photoLibraryURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __112__VCPMediaAnalyzer__analyzeOndemand_forAnalysisTypes_withExistingAnalysis_andOptions_storeAnalysis_cancelBlock___block_invoke_572;
    v19[3] = &unk_1E6B15468;
    v19[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v14, "storeAnalysis:forAsset:fromPhotoLibraryURL:withReply:", v3, v15, v17, v19);

    dispatch_group_wait(*(dispatch_group_t *)(*(_QWORD *)(a1 + 40) + 32), 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend(v9, "invalidate");

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v18;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis][%@] No valid on-demand analysis; skipping",
        buf,
        0xCu);

    }
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 40) + 32));
  }

}

void __112__VCPMediaAnalyzer__analyzeOndemand_forAnalysisTypes_withExistingAnalysis_andOptions_storeAnalysis_cancelBlock___block_invoke_571(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = v4;
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis][%@] Failed to store on-demand analysis - %@", (uint8_t *)&v5, 0x16u);

  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 40) + 32));

}

void __112__VCPMediaAnalyzer__analyzeOndemand_forAnalysisTypes_withExistingAnalysis_andOptions_storeAnalysis_cancelBlock___block_invoke_572(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 32));
}

- (id)requestAnalysisTypes:(unint64_t)a3 forAssetWithResourceURLs:(id)a4 withOptions:(id)a5 error:(id *)a6
{
  void *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__40;
  v14 = __Block_byref_object_dispose__40;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__VCPMediaAnalyzer_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_error___block_invoke;
  v9[3] = &unk_1E6B1A1B8;
  v9[4] = &v10;
  v9[5] = a6;
  +[VCPFullAnalysisURLProcessingTask taskForURLAsset:withOptions:analysisTypes:progressHandler:completionHandler:](VCPFullAnalysisURLProcessingTask, "taskForURLAsset:withOptions:analysisTypes:progressHandler:completionHandler:", a4, a5, a3, 0, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "run");
  v7 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v7;
}

void __84__VCPMediaAnalyzer_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v6 = a2;
  v7 = objc_retainAutorelease(a3);
  **(_QWORD **)(a1 + 40) = v7;

}

- (id)analyzeOndemand:(id)a3 pairedURL:(id)a4 forAnalysisTypes:(unint64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v24 = 0;
  v11 = *MEMORY[0x1E0C998E0];
  objc_msgSend(v9, "getResourceValue:forKey:error:", &v24, *MEMORY[0x1E0C998E0], 0);
  v12 = v24;
  v13 = *MEMORY[0x1E0CEC568];
  if ((objc_msgSend(v12, "conformsToType:", *MEMORY[0x1E0CEC568]) & 1) == 0)
  {
    v14 = *MEMORY[0x1E0CEC640];
    if (!objc_msgSend(v12, "conformsToType:", *MEMORY[0x1E0CEC640]))
    {
      if (!objc_msgSend(v12, "conformsToType:", *MEMORY[0x1E0CEC520]))
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] [MediaAnalyzer requestAnalysisTypes] call with invalid resourceURLs", buf, 2u);
        }
        v17 = 0;
        v18 = -50;
        goto LABEL_14;
      }
      if (v10)
      {
        v23 = 0;
        objc_msgSend(v10, "getResourceValue:forKey:error:", &v23, v11, 0);
        v20 = v23;
        if ((objc_msgSend(v20, "conformsToType:", v13) & 1) == 0
          && !objc_msgSend(v20, "conformsToType:", v14))
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] [MediaAnalyzer requestAnalysisTypes] call with invalid resourceURLs", buf, 2u);
          }

          goto LABEL_37;
        }
        +[VCPURLAsset livePhotoAssetWithImageURL:andMovieURL:](VCPURLAsset, "livePhotoAssetWithImageURL:andMovieURL:", v9, v10);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
LABEL_21:
          +[VCPPhotoAnalyzer analyzerWithVCPAsset:forAnalysisTypes:](VCPPhotoAnalyzer, "analyzerWithVCPAsset:forAnalysisTypes:", v21, a5);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "analyzeAsset:withOptions:", &__block_literal_global_579, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "status") == 2)
            v18 = 0;
          else
            v18 = -18;

          goto LABEL_13;
        }
      }
      else
      {
        +[VCPURLAsset imageAssetWithURL:](VCPURLAsset, "imageAssetWithURL:", v9);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          goto LABEL_21;
      }
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v9;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis][%@]Failed to create asset", buf, 0xCu);
      }
LABEL_37:
      v17 = 0;
      v18 = -50;
      goto LABEL_14;
    }
  }
  +[VCPURLAsset movieAssetWithURL:](VCPURLAsset, "movieAssetWithURL:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    +[VCPMovieAnalyzer analyzerWithVCPAsset:withExistingAnalysis:forAnalysisTypes:withOptions:](VCPMovieAnalyzer, "analyzerWithVCPAsset:withExistingAnalysis:forAnalysisTypes:withOptions:", v15, 0, a5, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "analyzeAsset:streamed:", &__block_literal_global_577, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "status") == 2)
      v18 = 0;
    else
      v18 = -18;

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v9;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis][%@]Unable to open movie", buf, 0xCu);
    }
    v17 = 0;
    v18 = -50;
  }

LABEL_13:
  if (v18)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v18, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    v17 = 0;
  }

  return v17;
}

uint64_t __69__VCPMediaAnalyzer_analyzeOndemand_pairedURL_forAnalysisTypes_error___block_invoke()
{
  return 0;
}

uint64_t __69__VCPMediaAnalyzer_analyzeOndemand_pairedURL_forAnalysisTypes_error___block_invoke_578()
{
  return 0;
}

- (id)_requestAnalysis:(unint64_t)a3 forAsset:(id)a4 withExistingAnalysis:(id)a5 andDatabase:(id)a6 andOptions:(id)a7 cancelBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  unint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  int v31;
  void *v32;
  void *v33;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  char v48;
  int v49;
  void *v50;
  uint64_t v51;
  __objc2_class **v52;
  int v53;
  uint64_t v54;
  int v55;
  void *v56;
  id v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  _BOOL4 v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  os_signpost_id_t spid;
  id spida;
  unsigned __int8 v72;
  id v73;
  id v74;
  void *v75;
  id v76;
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  _QWORD v83[5];
  _QWORD v84[7];

  v84[5] = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v74 = a6;
  v16 = a7;
  v73 = a8;
  objc_msgSend(v14, "localIdentifier");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("AllowOnDemand"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("SkipMetaDataOnDemand"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v19, "BOOLValue");

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ScaledSlomoTime"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "BOOLValue");

  objc_msgSend(v14, "fetchPropertySetsIfNeeded");
  if (a3 && (int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    MediaAnalysisTypeDescription(a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v78 = v75;
    v79 = 2112;
    v80 = (uint64_t)v22;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MediaAnalysis][%@] Received analysis request: %@", buf, 0x16u);

  }
  if (!-[NSNumber BOOLValue](self->_standalone, "BOOLValue"))
  {
    v76 = 0;
    v31 = objc_msgSend(v74, "isAssetBlacklisted:blacklistDate:", v75, &v76);
    v23 = v76;
    if (v31)
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v78 = v75;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis][%@] Analysis requested for blacklisted asset", buf, 0xCu);
      }
      v83[0] = CFSTR("version");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 69);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v84[0] = v32;
      v83[1] = CFSTR("dateModified");
      objc_msgSend(v14, "vcp_modificationDate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v84[1] = v33;
      v84[2] = v23;
      v83[2] = CFSTR("dateAnalyzed");
      v83[3] = CFSTR("performedAnalysisTypes");
      v83[4] = CFSTR("flags");
      v84[3] = &unk_1E6B74918;
      v84[4] = &unk_1E6B74930;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 5);
      v30 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_28;
    }
    if ((int)objc_msgSend(v15, "vcp_version") < 7)
    {

      v15 = 0;
    }
    MediaAnalysisPostProcessAnalysis(v14, v15, v21 ^ 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if ((a3 & 0x40000) == 0 || (objc_msgSend(v35, "vcp_types") & 0x40000) == 0)
    {
      v15 = v35;
      goto LABEL_52;
    }
    VCPSignPostLog();
    v36 = objc_claimAutoreleasedReturnValue();
    spid = os_signpost_id_generate(v36);

    VCPSignPostLog();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v38, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPPostProcessMovieHighlights", ", buf, 2u);
    }

    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("CaptionWithHighlight"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "BOOLValue"))
    {
      objc_msgSend(v35, "vcp_results");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("MiCaVideoCaptionResults"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v40, "count"))
      {
        objc_msgSend(v35, "vcp_results");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("VideoSegmentCaptionResults"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v65, "count"))
        {
          objc_msgSend(v35, "vcp_results");
          v64 = v40;
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("VideoCaptionResults"));
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v61, "count") == 0;

          if (v62)
          {
            if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalyzer]Early termination - no caption available, set results to nil", buf, 2u);
            }
            v15 = 0;
            goto LABEL_47;
          }
LABEL_45:
          -[VCPMediaAnalyzer _postProcessMovieHighlights:analysis:withOptions:](self, "_postProcessMovieHighlights:analysis:withOptions:", v14, v35, v16);
          v15 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("CaptionWithHighlight"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "BOOLValue");

          if (!v42)
            goto LABEL_48;
          -[VCPMediaAnalyzer _addCaptionToHighlightResults:](self, "_addCaptionToHighlightResults:", v15);
          v35 = v15;
          v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_47:

LABEL_48:
          VCPSignPostLog();
          v43 = objc_claimAutoreleasedReturnValue();
          v44 = v43;
          if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v44, OS_SIGNPOST_INTERVAL_END, spid, "VCPPostProcessMovieHighlights", ", buf, 2u);
          }

LABEL_52:
          if ((a3 & 0x4000) != 0 && objc_msgSend(v14, "isPhoto"))
          {
            -[VCPMediaAnalyzer _addClassificationResults:analysis:](self, "_addClassificationResults:analysis:", v14, v15);
            v45 = objc_claimAutoreleasedReturnValue();

            v15 = (id)v45;
          }
          if (!v15)
            goto LABEL_8;
          objc_msgSend(v15, "vcp_dateModified");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "vcp_modificationDate");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v46, "isEqualToDate:", v47);

          if ((v48 & 1) != 0)
          {
            if (!a3)
            {
LABEL_72:
              v15 = v15;
              v30 = v15;
LABEL_28:

              goto LABEL_30;
            }
            v49 = objc_msgSend(v15, "vcp_degraded");
            if ((_DWORD)v18)
            {
              objc_msgSend(MEMORY[0x1E0CD1440], "vcp_allAcceptableResourcesForAsset:", v14);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = objc_msgSend(v14, "mediaType");
              v52 = off_1E6B0FA70;
              if (v51 != 1)
                v52 = off_1E6B0FA68;
              v53 = -[__objc2_class canAnalyzeUndegraded:withResources:](*v52, "canAnalyzeUndegraded:withResources:", v14, v50);
              MediaAnalysisStripOutdatedAnalysis(v14, v15);
              v54 = objc_claimAutoreleasedReturnValue();

              v55 = v53 ^ 1;
              v15 = (id)v54;
            }
            else
            {
              v55 = v49;
            }
            if (((objc_msgSend(v15, "vcp_degraded") ^ 1 | v55) & 1) != 0)
            {
              if ((a3 & ~objc_msgSend(v15, "vcp_types")) == 0)
              {
                if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                {
                  MediaAnalysisTypeDescription(objc_msgSend(v15, "vcp_types"));
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v78 = v75;
                  v79 = 2112;
                  v80 = (uint64_t)v59;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MediaAnalysis][%@] Existing analysis satisfies request (%@)", buf, 0x16u);

                }
                goto LABEL_72;
              }
              if (((objc_msgSend(v15, "vcp_degraded") | v55 ^ 1) & 1) != 0)
              {
                if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                {
                  MediaAnalysisTypeDescription(objc_msgSend(v15, "vcp_types"));
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v78 = v75;
                  v79 = 2112;
                  v80 = (uint64_t)v60;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MediaAnalysis][%@] Existing analysis doesn't satisfy request (%@)", buf, 0x16u);

                }
                a3 &= ~objc_msgSend(v15, "vcp_types");
                goto LABEL_8;
              }
              if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v78 = v75;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MediaAnalysis][%@] Existing analysis doesn't match asset state", buf, 0xCu);
              }
            }
            else if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v78 = v75;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MediaAnalysis][%@] Existing analysis based on degraded asset", buf, 0xCu);
            }
          }
          else if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v15, "vcp_dateModified");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "description");
            spida = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v67 = objc_msgSend(spida, "UTF8String");
            objc_msgSend(v14, "vcp_modificationDate");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "description");
            v57 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v58 = objc_msgSend(v57, "UTF8String");
            *(_DWORD *)buf = 138412802;
            v78 = v75;
            v79 = 2080;
            v80 = v67;
            v81 = 2080;
            v82 = v58;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MediaAnalysis][%@] Existing analysis based on old modification - (%s vs %s)", buf, 0x20u);

          }
          goto LABEL_7;
        }

      }
    }

    goto LABEL_45;
  }
  v23 = v15;
LABEL_7:
  v15 = 0;
LABEL_8:

  if ((_DWORD)v18)
    v24 = a3;
  else
    v24 = 0;
  if (((v18 | v72) & 1) == 0)
    v24 = -[VCPMediaAnalyzer _metaAnalysisTypesForAsset:](self, "_metaAnalysisTypesForAsset:", v14) & a3;
  if (v24)
  {
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      MediaAnalysisTypeDescription(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v78 = v75;
      v79 = 2112;
      v80 = (uint64_t)v25;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis][%@] Generating analysis on-demand: %@", buf, 0x16u);

    }
    -[VCPMediaAnalyzer _analyzeOndemand:forAnalysisTypes:withExistingAnalysis:andOptions:storeAnalysis:cancelBlock:](self, "_analyzeOndemand:forAnalysisTypes:withExistingAnalysis:andOptions:storeAnalysis:cancelBlock:", v14, v24, v15, v16, v18, v73);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v24 & 0x40000) != 0)
    {
      -[VCPMediaAnalyzer _postProcessMovieHighlights:analysis:withOptions:](self, "_postProcessMovieHighlights:analysis:withOptions:", v14, v26, v16);
      v27 = objc_claimAutoreleasedReturnValue();

      v26 = (void *)v27;
    }
    MediaAnalysisMergeAnalysis(v15, v26, v18);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      MediaAnalysisTypeDescription(objc_msgSend(v28, "vcp_types"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v78 = v75;
      v79 = 2112;
      v80 = (uint64_t)v29;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MediaAnalysis][%@] Analysis served: (%@)", buf, 0x16u);

    }
    v30 = v28;

  }
  else
  {
    v15 = v15;
    v30 = v15;
  }
LABEL_30:

  return v30;
}

- (int)requestAnalysisForAsset:(id)a3 analysisTypes:(unint64_t)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  VCPMediaAnalyzer *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD block[4];
  id v18;
  id v19;
  VCPMediaAnalyzer *v20;
  id v21;
  unint64_t v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  objc_msgSend((id)objc_opt_class(), "sharedMediaAnalyzer");
  v11 = (VCPMediaAnalyzer *)objc_claimAutoreleasedReturnValue();

  if (v11 == self)
  {
    objc_msgSend(v9, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPMediaAnalyzer _databaseForPhotoLibrary:](self, "_databaseForPhotoLibrary:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      dispatch_get_global_queue(0, 0);
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __92__VCPMediaAnalyzer_requestAnalysisForAsset_analysisTypes_progressHandler_completionHandler___block_invoke;
      block[3] = &unk_1E6B1A220;
      v18 = v13;
      v19 = v9;
      v20 = self;
      v22 = a4;
      v21 = v10;
      dispatch_async(v14, block);

    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "localIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v15;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] Failed to obtain database for Photo Library %@", buf, 0xCu);

      }
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    }

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] [MediaAnalyzer requestAnalysisForAsset] call from invalid instance", buf, 2u);
    }
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

  return -1;
}

void __92__VCPMediaAnalyzer_requestAnalysisForAsset_analysisTypes_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queryAnalysisForAsset:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 32);
  v14 = CFSTR("AllowOnDemand");
  v15[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_requestAnalysis:forAsset:withExistingAnalysis:andDatabase:andOptions:cancelBlock:", v7, v6, v4, v8, v9, &__block_literal_global_584);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(_QWORD *)(a1 + 56);
  v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "BOOLValue");
  v13 = v10;
  if ((v12 & 1) == 0)
  {
    MediaAnalysisStripInternalResultsFromAnalysis(v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v13);
  if ((v12 & 1) == 0)

}

uint64_t __92__VCPMediaAnalyzer_requestAnalysisForAsset_analysisTypes_progressHandler_completionHandler___block_invoke_2()
{
  return 0;
}

- (BOOL)cancelAnalysisWithRequestID:(int)a3
{
  NSObject *cancelQueue;
  char v4;
  _QWORD block[6];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  cancelQueue = self->_cancelQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__VCPMediaAnalyzer_cancelAnalysisWithRequestID___block_invoke;
  block[3] = &unk_1E6B1A248;
  v7 = a3;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(cancelQueue, block);
  v4 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __48__VCPMediaAnalyzer_cancelAnalysisWithRequestID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  os_log_type_t v5;
  int v6;
  NSObject *v7;
  const char *v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "cancel");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v5 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v6 = *(_DWORD *)(a1 + 48);
        v10 = 67109120;
        v11 = v6;
        v7 = MEMORY[0x1E0C81028];
        v8 = "[MediaAnalysis] Cancelling request %d";
LABEL_8:
        _os_log_impl(&dword_1B6C4A000, v7, v5, v8, (uint8_t *)&v10, 8u);
      }
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v5 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_DWORD *)(a1 + 48);
      v10 = 67109120;
      v11 = v9;
      v7 = MEMORY[0x1E0C81028];
      v8 = "[MediaAnalysis] Failed to find request %d; cannot cancel";
      goto LABEL_8;
    }
  }

}

- (void)assetsFromPhotoLibrary:(id)a3 analyzedSinceDate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  VCPMediaAnalyzer *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  objc_msgSend((id)objc_opt_class(), "sharedMediaAnalyzer");
  v11 = (VCPMediaAnalyzer *)objc_claimAutoreleasedReturnValue();

  if (v11 == self)
  {
    if (!-[NSNumber BOOLValue](self->_standalone, "BOOLValue"))
    {
      -[VCPMediaAnalyzer _databaseForPhotoLibrary:](self, "_databaseForPhotoLibrary:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "queryAssetsAnalyzedSince:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(MEMORY[0x1E0CD1398], "vcp_fetchOptionsForLibrary:forTaskID:", v8, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v16;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setSortDescriptors:", v17);

          objc_msgSend(MEMORY[0x1E0CD1398], "fetchAssetsWithLocalIdentifiers:options:", v14, v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "fetchedObjects");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v10[2](v10, v19);

          goto LABEL_7;
        }

      }
      else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "photoLibraryURL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "path");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v21;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] Failed to obtain database for Photo Library (%@)", buf, 0xCu);

      }
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] [MediaAnalyzer assetsAnalyzedSinceDate] call from invalid instance", buf, 2u);
  }
  v10[2](v10, 0);
LABEL_7:

}

- (void)assetsAnalyzedSinceDate:(id)a3 completionHandler:(id)a4
{
  -[VCPMediaAnalyzer assetsFromPhotoLibrary:analyzedSinceDate:completionHandler:](self, "assetsFromPhotoLibrary:analyzedSinceDate:completionHandler:", 0, a3, a4);
}

- (void)_checkDuplicate:(id)a3 withAsset:(id)a4 duplicate:(int64_t *)a5
{
  id v7;
  dispatch_semaphore_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int64_t v12;
  id v13;

  v13 = a3;
  v7 = a4;
  v8 = dispatch_semaphore_create(0);
  objc_msgSend(v13, "vcp_fingerprint:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "vcp_fingerprint:", v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = -1;
  if (v9 && v10)
    v12 = objc_msgSend(v9, "isEqualToFingerprint:", v10);
  *a5 = v12;

}

- (void)_getSceneDescriptors:(id)a3 asDescriptorClass:(Class)a4 withSceneRange:(id *)a5 andAnalysisResults:(id)a6
{
  id v9;
  CMTime *v10;
  objc_class *v11;
  __CFString **v12;
  unint64_t v13;
  __int128 v14;
  __int128 v15;
  void *v16;
  const __CFDictionary *v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  CFDictionaryRef v26;
  void *v27;
  __int128 v28;
  Class v29;
  id v30;
  __CFString *v31;
  CMTime v32;
  CMTime v33;
  CMTimeRange otherRange;
  CMTimeRange v35;
  CMTimeRange v36;
  CMTime rhs;
  CMTime lhs;
  CMTime duration;
  CMTime start;
  CMTimeRange v41;
  CMTimeRange v42;
  CMTime time2;
  CMTime time1;
  CMTimeRange range;
  CMTime v46;
  CMTime v47;
  _QWORD v48[2];
  _QWORD v49[2];
  CMTime buf;
  uint64_t v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v9 = a6;
  v10 = (CMTime *)MEMORY[0x1E0CA2E68];
  v47 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  v11 = (objc_class *)objc_opt_class();
  v12 = MediaAnalysisResultSceneprintAttributeKey;
  v29 = a4;
  if (v11 != a4)
    v12 = MediaAnalysisResultFeatureVectorAttributeKey;
  v31 = *v12;
  v13 = 0;
  *(_QWORD *)&v14 = 138413058;
  v28 = v14;
  while (objc_msgSend(v9, "count", v28) > v13)
  {
    if (v13 == objc_msgSend(v9, "count") - 1)
    {
      v15 = *(_OWORD *)&a5->var0.var3;
      *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
      *(_OWORD *)&range.start.epoch = v15;
      *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a5->var1.var1;
      CMTimeRangeGetEnd(&v41.start, &range);
      v46 = v41.start;
    }
    else
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v13 + 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("start"));
      v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CMTimeMakeFromDictionary(&v41.start, v17);
      v46 = v41.start;

    }
    time1 = v47;
    v18 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)&v42.start.value = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&v42.start.epoch = v18;
    *(_OWORD *)&v42.duration.timescale = *(_OWORD *)&a5->var1.var1;
    CMTimeRangeGetEnd(&time2, &v42);
    if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
      break;
    memset(&v41, 0, sizeof(v41));
    start = v47;
    lhs = v46;
    rhs = v47;
    CMTimeSubtract(&duration, &lhs, &rhs);
    CMTimeRangeMake(&v41, &start, &duration);
    v35 = v41;
    memset(&v36, 0, sizeof(v36));
    v19 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&otherRange.start.epoch = v19;
    *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a5->var1.var1;
    CMTimeRangeGetIntersection(&v36, &v35, &otherRange);
    if ((v36.start.flags & 1) != 0
      && (v36.duration.flags & 1) != 0
      && !v36.duration.epoch
      && (v36.duration.value & 0x8000000000000000) == 0)
    {
      v33 = v36.duration;
      v32 = *v10;
      if (CMTimeCompare(&v33, &v32))
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v13);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("attributes"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", v31);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          -[objc_class descriptorWithData:](v29, "descriptorWithData:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v23 && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v24 = objc_msgSend(v22, "length");
            objc_msgSend(v22, "description");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf.value) = v28;
            *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v29;
            LOWORD(buf.flags) = 2112;
            *(_QWORD *)((char *)&buf.flags + 2) = v31;
            HIWORD(buf.epoch) = 2048;
            v51 = v24;
            v52 = 2112;
            v53 = v25;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Cannot load %@ for %@, NSData length: %lu, content: %@", (uint8_t *)&buf, 0x2Au);

          }
          v48[0] = CFSTR("duration");
          buf = v36.duration;
          v26 = CMTimeCopyAsDictionary(&buf, 0);
          v48[1] = CFSTR("attributes");
          v49[0] = v26;
          v49[1] = v23;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v27);

        }
      }
    }
    v47 = v46;
    ++v13;
  }

}

- (id)_queryDistanceDescriptor:(Class)a3 ofAsset:(id)a4 withExistingAnalysis:(id)a5 andDatabase:(id)a6 timeRange:(id *)a7 lastFeature:(BOOL)a8 isDegraded:(BOOL *)a9
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  CFDictionaryRef v19;
  void *v20;
  uint64_t v21;
  void *value;
  void *v23;
  void *v24;
  int v25;
  objc_class *v26;
  __CFString **v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFDictionary *v36;
  $C7CBA4C8288BA02ADCCB8E56B4665FF4 *v37;
  __int128 v38;
  objc_class *v39;
  __CFString **v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  BOOL v46;
  int32_t v48;
  CMTimeValue v49;
  void *v50;
  __CFString *v51;
  void *v52;
  __CFString *v54;
  id v55;
  id v56;
  CMTime v57;
  CMTimeRange v58;
  CMTime time2;
  CMTime time1;
  CMTime v61;
  _QWORD v62[2];
  _QWORD v63[2];
  CMTimeRange time;
  _QWORD v65[2];
  _QWORD v66[5];

  v9 = a8;
  v66[2] = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v56 = a6;
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v55 = (id)objc_claimAutoreleasedReturnValue();
    if ((Class)objc_opt_class() != a3
      || !-[objc_class usePHAssetData](a3, "usePHAssetData")
      || objc_msgSend(v14, "mediaType") != 1)
    {
LABEL_18:
      v16 = v15;
      if (!v16)
      {
        if (-[NSNumber BOOLValue](self->_standalone, "BOOLValue"))
        {
          v16 = 0;
          goto LABEL_61;
        }
        if ((Class)objc_opt_class() == a3)
          v31 = 46;
        else
          v31 = 12;
        v32 = (void *)MEMORY[0x1E0C99E20];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setWithObject:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "mediaType") == 2)
          objc_msgSend(v34, "addObject:", &unk_1E6B74948);
        objc_msgSend(v14, "localIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "queryAnalysisForAsset:withTypes:", v35, v34);
        v16 = (id)objc_claimAutoreleasedReturnValue();

        if (!v16)
          goto LABEL_61;
      }
      if ((int)objc_msgSend(v16, "vcp_version") < 7
        || (objc_msgSend(v14, "vcp_modificationDate"),
            v23 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v16, "vcp_dateModified"),
            v24 = (void *)objc_claimAutoreleasedReturnValue(),
            v25 = objc_msgSend(v23, "isEqualToDate:", v24),
            v24,
            v23,
            !v25))
      {
LABEL_61:
        if (a9)
        {
          if (objc_msgSend(v14, "isVideo"))
            v46 = (~(unsigned __int16)objc_msgSend(v16, "vcp_types") & 0x880) != 0;
          else
            v46 = 0;
          *a9 = v46;
        }
LABEL_66:

        goto LABEL_67;
      }
      v26 = (objc_class *)objc_opt_class();
      v27 = MediaAnalysisSceneprintResultsKey;
      if (v26 != a3)
        v27 = MediaAnalysisFeatureVectorResultsKey;
      v51 = *v27;
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("metadataRanges"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", v51);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "mediaType") == 2)
      {
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("metadataRanges"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("SceneResults"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v29)
          goto LABEL_60;
      }
      else
      {
        v52 = 0;
        if (!v29)
        {
LABEL_60:

          goto LABEL_61;
        }
      }
      if (objc_msgSend(v29, "count"))
      {
        if (v52)
        {
          if (v9)
            objc_msgSend(v52, "lastObject");
          else
            objc_msgSend(v52, "firstObject");
          v36 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          memset(&time, 0, sizeof(time));
          v37 = a7;
          if ((a7->var0.var2 & 1) == 0
            || (a7->var1.var2 & 1) == 0
            || a7->var1.var3
            || a7->var1.var0 < 0
            || (time1 = (CMTime)a7->var1,
                time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68],
                v48 = CMTimeCompare(&time1, &time2),
                v37 = a7,
                v48))
          {
            v38 = *(_OWORD *)&v37->var0.var3;
            *(_OWORD *)&time.start.value = *(_OWORD *)&v37->var0.var0;
            *(_OWORD *)&time.start.epoch = v38;
            *(_OWORD *)&time.duration.timescale = *(_OWORD *)&v37->var1.var1;
          }
          else
          {
            CMTimeRangeMakeFromDictionary(&time, v36);
          }
          v58 = time;
          -[VCPMediaAnalyzer _getSceneDescriptors:asDescriptorClass:withSceneRange:andAnalysisResults:](self, "_getSceneDescriptors:asDescriptorClass:withSceneRange:andAnalysisResults:", v55, a3, &v58, v29);
        }
        else
        {
          if (v9)
            objc_msgSend(v29, "lastObject");
          else
            objc_msgSend(v29, "firstObject");
          v36 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          v39 = (objc_class *)objc_opt_class();
          v40 = MediaAnalysisResultSceneprintAttributeKey;
          if (v39 != a3)
            v40 = MediaAnalysisResultFeatureVectorAttributeKey;
          v54 = *v40;
          -[__CFDictionary objectForKeyedSubscript:](v36, "objectForKeyedSubscript:", CFSTR("attributes"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "objectForKeyedSubscript:", v54);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (v42)
          {
            -[objc_class descriptorWithData:](a3, "descriptorWithData:", v42);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            if (v50)
            {
              v62[0] = CFSTR("duration");
              CMTimeMake(&v57, 1, 1);
              CMTimeToNSDictionary(&v57);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v62[1] = CFSTR("attributes");
              v63[0] = v43;
              v63[1] = v50;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "addObject:", v44);

            }
            else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              v49 = objc_msgSend(v42, "length");
              objc_msgSend(v42, "description");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(time.start.value) = 138413058;
              *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)a3;
              LOWORD(time.start.flags) = 2112;
              *(_QWORD *)((char *)&time.start.flags + 2) = v51;
              HIWORD(time.start.epoch) = 2048;
              time.duration.value = v49;
              LOWORD(time.duration.timescale) = 2112;
              *(_QWORD *)((char *)&time.duration.timescale + 2) = v45;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Cannot load %@ for %@, NSData length: %lu, content: %@", (uint8_t *)&time, 0x2Au);

            }
          }

          v52 = 0;
        }

      }
      goto LABEL_60;
    }
    objc_msgSend(v14, "fetchPropertySetsIfNeeded");
    if ((Class)objc_opt_class() == a3)
    {
      objc_msgSend(v14, "sceneprintProperties");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sceneprint");
      v16 = (id)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      objc_msgSend(v14, "distanceIdentity");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_17;
    }
    -[objc_class descriptorWithData:](a3, "descriptorWithData:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v65[0] = CFSTR("duration");
      CMTimeMake(&v61, 1, 1);
      time.start = v61;
      v19 = CMTimeCopyAsDictionary(&time.start, 0);
      v65[1] = CFSTR("attributes");
      v66[0] = v19;
      v66[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "addObject:", v20);

      if (a9)
        *a9 = 0;

      goto LABEL_66;
    }
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v21 = objc_msgSend(v16, "length");
      objc_msgSend(v16, "description");
      LODWORD(time.start.value) = 138412802;
      *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)a3;
      LOWORD(time.start.flags) = 2048;
      *(_QWORD *)((char *)&time.start.flags + 2) = v21;
      HIWORD(time.start.epoch) = 2112;
      time.duration.value = objc_claimAutoreleasedReturnValue();
      value = (void *)time.duration.value;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Cannot load %@ from PHAsset, NSData length: %lu, content: %@", (uint8_t *)&time, 0x20u);

    }
    goto LABEL_17;
  }
  v55 = 0;
LABEL_67:

  return v55;
}

+ (Class)_getDistanceDescriptorClass
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    +[VCPMediaAnalyzer _getDistanceDescriptorClass]::descriptorClass = objc_opt_class();
  }
  return (Class)(id)+[VCPMediaAnalyzer _getDistanceDescriptorClass]::descriptorClass;
}

+ (BOOL)includeTorsoOnlyForOneUP
{
  return 1;
}

- (void)distanceFromAsset:(id)a3 toAsset:(id)a4 duplicate:(int64_t *)a5 distance:(float *)a6
{
  id v10;
  id v11;
  unsigned __int8 v12;
  VCPMediaAnalyzer *v13;
  void *v14;
  void *v15;
  void *v16;
  VCPInterAssetAnalyzer *v17;
  _OWORD *v18;
  __int128 v19;
  void *v20;
  __int128 v21;
  void *v22;
  void *v23;
  int v24;
  _OWORD v25[3];
  _OWORD v26[3];
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  if ((v12 & 1) == 0
  {
    -[VCPMediaAnalyzer distanceFromAsset:toAsset:duplicate:distance:]::kDescriptorClass = +[VCPMediaAnalyzer _getDistanceDescriptorClass](VCPMediaAnalyzer, "_getDistanceDescriptorClass");
  }
  objc_msgSend((id)objc_opt_class(), "sharedMediaAnalyzer");
  v13 = (VCPMediaAnalyzer *)objc_claimAutoreleasedReturnValue();

  if (v13 == self)
  {
    objc_msgSend(v10, "photoLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPMediaAnalyzer _databaseForPhotoLibrary:](self, "_databaseForPhotoLibrary:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[NSNumber BOOLValue](self->_standalone, "BOOLValue"))
      goto LABEL_7;
    objc_msgSend(v10, "localIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isAssetBlacklisted:blacklistDate:", v16, 0))
    {

    }
    else
    {
      objc_msgSend(v11, "localIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v15, "isAssetBlacklisted:blacklistDate:", v23, 0);

      if (!v24)
      {
LABEL_7:
        -[VCPMediaAnalyzer _checkDuplicate:withAsset:duplicate:](self, "_checkDuplicate:withAsset:duplicate:", v10, v11, a5);
        if (*a5 == 1)
        {
          *a6 = 0.0;
LABEL_22:

          goto LABEL_23;
        }
        v17 = objc_alloc_init(VCPInterAssetAnalyzer);
        if (v17)
        {
          v18 = (_OWORD *)MEMORY[0x1E0CA2E50];
          v19 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
          v26[0] = *MEMORY[0x1E0CA2E50];
          v26[1] = v19;
          v26[2] = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
          -[VCPMediaAnalyzer _queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:](self, "_queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:", -[VCPMediaAnalyzer distanceFromAsset:toAsset:duplicate:distance:]::kDescriptorClass, v10, 0, v15, v26, 1, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v18[1];
          v25[0] = *v18;
          v25[1] = v21;
          v25[2] = v18[2];
          -[VCPMediaAnalyzer _queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:](self, "_queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:", -[VCPMediaAnalyzer distanceFromAsset:toAsset:duplicate:distance:]::kDescriptorClass, v11, 0, v15, v25, 0, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "count") && objc_msgSend(v22, "count"))
          {
            -[VCPInterAssetAnalyzer computeDistance:fromArray:toArray:](v17, "computeDistance:fromArray:toArray:", a6, v20, v22);
LABEL_21:

            goto LABEL_22;
          }
          if (!-[VCPInterAssetAnalyzer computeDistance:withDescriptorClass:fromAsset:toAsset:](v17, "computeDistance:withDescriptorClass:fromAsset:toAsset:", a6, -[VCPMediaAnalyzer distanceFromAsset:toAsset:duplicate:distance:]::kDescriptorClass, v10, v11))goto LABEL_21;
        }
        else
        {
          v20 = 0;
          v22 = 0;
        }
        *a6 = -1.0;
        goto LABEL_21;
      }
    }
    *a5 = -1;
    *a6 = -1.0;
    goto LABEL_22;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] [MediaAnalyzer distanceFromAsset] call from invalid instance", buf, 2u);
  }
LABEL_23:

}

- (void)distanceFromAsset:(id)a3 timeRange:(id *)a4 toAsset:(id)a5 timeRange:(id *)a6 duplicate:(int64_t *)a7 distance:(float *)a8
{
  id v14;
  id v15;
  unsigned __int8 v16;
  VCPMediaAnalyzer *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  VCPInterAssetAnalyzer *v25;
  __int128 v26;
  void *v27;
  __int128 v28;
  void *v29;
  void *v30;
  _OWORD v31[3];
  _OWORD v32[3];
  CMTimeRange range2;
  CMTimeRange range1;
  uint8_t buf[16];

  v14 = a3;
  v15 = a5;
  if ((v16 & 1) == 0
  {
    -[VCPMediaAnalyzer distanceFromAsset:timeRange:toAsset:timeRange:duplicate:distance:]::kDescriptorClass = +[VCPMediaAnalyzer _getDistanceDescriptorClass](VCPMediaAnalyzer, "_getDistanceDescriptorClass");
  }
  objc_msgSend((id)objc_opt_class(), "sharedMediaAnalyzer");
  v17 = (VCPMediaAnalyzer *)objc_claimAutoreleasedReturnValue();

  if (v17 == self)
  {
    objc_msgSend(v14, "photoLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPMediaAnalyzer _databaseForPhotoLibrary:](self, "_databaseForPhotoLibrary:", v18);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[NSNumber BOOLValue](self->_standalone, "BOOLValue"))
      goto LABEL_7;
    objc_msgSend(v14, "localIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "isAssetBlacklisted:blacklistDate:", v22, 0))
    {

    }
    else
    {
      objc_msgSend(v15, "localIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v30, "isAssetBlacklisted:blacklistDate:", v23, 0);

      if (!v24)
      {
LABEL_7:
        -[VCPMediaAnalyzer _checkDuplicate:withAsset:duplicate:](self, "_checkDuplicate:withAsset:duplicate:", v14, v15, a7);
        if (*a7)
        {
          if (objc_msgSend(v14, "mediaType") == 2)
          {
            v19 = *(_OWORD *)&a4->var0.var3;
            *(_OWORD *)&range1.start.value = *(_OWORD *)&a4->var0.var0;
            *(_OWORD *)&range1.start.epoch = v19;
            *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&a4->var1.var1;
            v20 = *(_OWORD *)&a6->var0.var3;
            *(_OWORD *)&range2.start.value = *(_OWORD *)&a6->var0.var0;
            *(_OWORD *)&range2.start.epoch = v20;
            *(_OWORD *)&range2.duration.timescale = *(_OWORD *)&a6->var1.var1;
            v21 = CMTimeRangeEqual(&range1, &range2);
            *a7 = v21 != 0;
            if (v21)
            {
LABEL_10:
              *a8 = 0.0;
LABEL_25:

              goto LABEL_26;
            }
          }
          else if (*a7 == 1)
          {
            goto LABEL_10;
          }
        }
        v25 = objc_alloc_init(VCPInterAssetAnalyzer);
        if (v25)
        {
          v26 = *(_OWORD *)&a4->var0.var3;
          v32[0] = *(_OWORD *)&a4->var0.var0;
          v32[1] = v26;
          v32[2] = *(_OWORD *)&a4->var1.var1;
          -[VCPMediaAnalyzer _queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:](self, "_queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:", -[VCPMediaAnalyzer distanceFromAsset:timeRange:toAsset:timeRange:duplicate:distance:]::kDescriptorClass, v14, 0, v30, v32, 1, 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = *(_OWORD *)&a6->var0.var3;
          v31[0] = *(_OWORD *)&a6->var0.var0;
          v31[1] = v28;
          v31[2] = *(_OWORD *)&a6->var1.var1;
          -[VCPMediaAnalyzer _queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:](self, "_queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:", -[VCPMediaAnalyzer distanceFromAsset:timeRange:toAsset:timeRange:duplicate:distance:]::kDescriptorClass, v15, 0, v30, v31, 0, 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v27, "count") && objc_msgSend(v29, "count"))
          {
            -[VCPInterAssetAnalyzer computeDistance:fromArray:toArray:](v25, "computeDistance:fromArray:toArray:", a8, v27, v29);
LABEL_24:

            goto LABEL_25;
          }
          if (!-[VCPInterAssetAnalyzer computeDistance:withDescriptorClass:fromAsset:toAsset:](v25, "computeDistance:withDescriptorClass:fromAsset:toAsset:", a8, -[VCPMediaAnalyzer distanceFromAsset:timeRange:toAsset:timeRange:duplicate:distance:]::kDescriptorClass, v14, v15))goto LABEL_24;
        }
        else
        {
          v27 = 0;
          v29 = 0;
        }
        *a8 = -1.0;
        goto LABEL_24;
      }
    }
    *a7 = -1;
    *a8 = -1.0;
    goto LABEL_25;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] [MediaAnalyzer distanceFromAsset] call from invalid instance", buf, 2u);
  }
LABEL_26:

}

- (int)requestAnalysisTypes:(unint64_t)a3 forAssets:(id)a4 withOptions:(id)a5 andProgressHandler:(id)a6 cancelBlock:(id)a7 analyses:(id)a8
{
  id v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  id v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  id v25;
  VCPInterAssetAnalyzer *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  unint64_t v31;
  BOOL v32;
  void *v33;
  void *v34;
  id v35;
  char v36;
  void *v37;
  BOOL v38;
  char v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  BOOL v59;
  unint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t i;
  BOOL v65;
  void *v66;
  int v67;
  id v68;
  id v69;
  void *v70;
  uint64_t v71;
  __int128 v72;
  uint64_t v73;
  __int128 v74;
  void *v75;
  void *v76;
  double v77;
  void *v78;
  void *v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  id v87;
  void *v88;
  int v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  int v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  int v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  int v113;
  char v115;
  VCPInterAssetAnalyzer *v116;
  unint64_t v117;
  int v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t (**v123)(void);
  id v124;
  void *v125;
  void *v127;
  void *context;
  void (**v129)(id, unint64_t, double);
  void *v130;
  void *v131;
  void *v132;
  id v133;
  void *v134;
  unint64_t v135;
  void *v136;
  id v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  id v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  int v147;
  uint8_t buf[16];
  CMTime v149;
  id v150;
  CMTime v151;
  id v152;
  _OWORD v153[3];
  _OWORD v154[3];
  CMTime v155;
  id v156;
  CMTime v157;
  id v158;
  _OWORD v159[3];
  _OWORD v160[3];
  unsigned __int8 v161;
  _BYTE v162[128];
  void *v163;
  _QWORD v164[4];
  _QWORD v165[4];
  _QWORD v166[2];
  _QWORD v167[2];
  _QWORD v168[2];
  _QWORD v169[2];
  _QWORD v170[2];
  _QWORD v171[2];
  _QWORD v172[2];
  _QWORD v173[4];

  v173[2] = *MEMORY[0x1E0C80C00];
  v133 = a4;
  v13 = a5;
  v129 = (void (**)(id, unint64_t, double))a6;
  v123 = (uint64_t (**)(void))a7;
  v124 = a8;
  v125 = v13;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AllowOnDemand"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = objc_msgSend(v14, "BOOLValue");

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("HighlightContexts"));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("HighlightPreferredRange"));
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  if (v127 && objc_msgSend(v127, "count"))
  {
    v15 = a3 & 0xFFFFFFFBFEBDF363 | 0x40142089CLL;
    goto LABEL_6;
  }
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("HighlightPreferredRange"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v15 = a3 & 0xFFFFFFFBFEBDF363 | 0x40142089CLL;
    if (v127)
    {
LABEL_6:
      if (objc_msgSend(v127, "count"))
        v15 = a3 & 0xFFFEF7FBFEBDF363 | 0x108040142089CLL;
    }
  }
  else
  {
    v15 = a3 & 0xFFFFFFFFFFFFFBFFLL;
  }
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("CaptionWithHighlight"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  if (v18)
  {
    if (+[VCPVideoCaptionAnalyzer mode](VCPVideoCaptionAnalyzer, "mode") == 1)
    {
      v15 |= 0x2200000000000uLL;
    }
    else if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v19 = MEMORY[0x1E0C81028];
      v20 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Caption disabled, NO caption will be returned with Highlight!", buf, 2u);
      }

    }
  }
  objc_msgSend(v127, "allKeys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "containsObject:", CFSTR("SearchQueryString"));

  if (v22)
  {
    -[VCPMediaAnalyzer prepareContextsQueryEmbedding:](self, "prepareContextsQueryEmbedding:", v127);
    v23 = objc_claimAutoreleasedReturnValue();

    v24 = (void *)objc_msgSend(v13, "mutableCopy");
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, CFSTR("HighlightContexts"));
    v25 = v24;

    v127 = (void *)v23;
    v125 = v25;
  }
  if ((a3 & 0x400) != 0)
  {
    v26 = objc_alloc_init(VCPInterAssetAnalyzer);
    if (v15)
      v15 |= 0x800uLL;
    else
      v15 = 0;
    v116 = v26;
    if (!v26)
    {
      v140 = 0;
      v141 = 0;
      v130 = 0;
      v131 = 0;
      v142 = 0;
      v35 = 0;
      v132 = 0;
      v113 = -18;
      goto LABEL_166;
    }
  }
  else
  {
    v116 = 0;
  }
  v120 = 0;
  if (v15 && v15 != 0x7FFFFFFFFFBFFLL)
  {
    MediaAnalysisResultsTypesForAnalysisTypes(v15);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v118 && !+[VCPDeviceInformation canRenderVariation](VCPDeviceInformation, "canRenderVariation"))
    v15 &= ~0x100000uLL;
  objc_msgSend(v133, "objectAtIndexedSubscript:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "photoLibrary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = v15;
  -[VCPMediaAnalyzer _databaseForPhotoLibrary:](self, "_databaseForPhotoLibrary:", v28);
  v121 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v121 && (int)MediaAnalysisLogLevel() >= 4)
  {
    v29 = MEMORY[0x1E0C81028];
    v30 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Failed to obtain database for assets", buf, 2u);
    }

  }
  +[VCPDatabaseBatchIterator iteratorForAssets:withDatabaseReader:resultTypes:batchSize:](VCPDatabaseBatchIterator, "iteratorForAssets:withDatabaseReader:resultTypes:batchSize:", v133, v121, v120, 100);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v134)
  {
    v140 = 0;
    v141 = 0;
    v130 = 0;
    v131 = 0;
    v142 = 0;
    v35 = 0;
    v132 = 0;
    goto LABEL_164;
  }
  if (v129)
    v129[2](v129, a3, 0.0);
  v31 = 0;
  v32 = 0;
  v33 = 0;
  v130 = 0;
  v131 = 0;
  v34 = 0;
  v142 = 0;
  v35 = 0;
  v132 = 0;
  v36 = v118;
  if (!v127)
    v36 = 1;
  v115 = v36;
  while (1)
  {
    v140 = v33;
    v141 = v34;
    if (!objc_msgSend(v134, "next") || objc_msgSend(v133, "count") <= v31)
      break;
    context = (void *)MEMORY[0x1BCCA1B2C]();
    objc_msgSend(v134, "asset");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v161 = 0;

    v135 = v31 + 1;
    if (!v138)
    {
      v139 = 0;
      v137 = 0;
      v40 = 0;
      v142 = 0;
      v35 = 0;
      goto LABEL_112;
    }
    if ((objc_msgSend(v136, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
      goto LABEL_86;
    objc_msgSend(v136, "vcp_modificationDate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37 == 0;

    if (v38)
      goto LABEL_86;
    if (v123 && (v123[2]() & 1) != 0)
    {
      v39 = 0;
      v139 = 0;
    }
    else
    {
      if (v117)
      {
        v41 = (void *)objc_msgSend(v125, "mutableCopy");
        objc_msgSend(v41, "removeObjectForKey:", CFSTR("HighlightPreferredRange"));
        if (objc_msgSend(v119, "count") > v31)
        {
          objc_msgSend(v119, "objectAtIndexedSubscript:", v31);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setObject:forKeyedSubscript:", v42, CFSTR("HighlightPreferredRange"));

        }
        if ((v115 & 1) == 0 && objc_msgSend(v127, "count"))
          objc_msgSend(v41, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("SkipMetaDataOnDemand"));
        objc_msgSend(v134, "analysis");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCPMediaAnalyzer _requestAnalysis:forAsset:withExistingAnalysis:andDatabase:andOptions:cancelBlock:](self, "_requestAnalysis:forAsset:withExistingAnalysis:andDatabase:andOptions:cancelBlock:", v117, v136, v43, v121, v41, v123);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (v44)
        {
          objc_msgSend(v138, "addEntriesFromDictionary:", v44);
          if ((objc_msgSend(v138, "vcp_flags") & 0x80000000) != 0)
          {

            goto LABEL_86;
          }
          objc_msgSend(v138, "objectForKeyedSubscript:", CFSTR("metadataRanges"));
          v139 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v139 = 0;
        }

      }
      else
      {
        v139 = 0;
      }
      if (!v123 || (v123[2]() & 1) == 0)
      {
        if ((a3 & 0x400) == 0)
        {
          v45 = 0;
          v137 = 0;
          v40 = 0;
          v142 = 0;
          v35 = 0;
          goto LABEL_89;
        }
        if (!v139)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v46 = objc_claimAutoreleasedReturnValue();
          if (v46)
          {
            v139 = (void *)v46;
            objc_msgSend(v138, "setObject:forKey:");
            goto LABEL_72;
          }
LABEL_86:
          v139 = 0;
          v137 = 0;
LABEL_87:
          v40 = 0;
          v142 = 0;
          v35 = 0;
LABEL_88:
          v45 = -50;
LABEL_89:
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v138);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          if (a3 == 0x10000)
          {
            v57 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v139);
            v57 = (id)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v56, "removeObjectForKey:", CFSTR("metadataRanges"));
          objc_msgSend(v56, "objectForKey:", CFSTR("quality"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v58 == 0;

          if (!v59)
            objc_msgSend(v56, "vcp_addTypes:", 0x10000);
          if (v57)
          {
            if (objc_msgSend(v57, "count"))
            {
              v60 = -[VCPMediaAnalyzer _typesToRemove:requested:](self, "_typesToRemove:requested:", objc_msgSend(v56, "vcp_types"), a3);
              v145 = 0u;
              v146 = 0u;
              v143 = 0u;
              v144 = 0u;
              MediaAnalysisResultsKeysForAnalysisTypes(v60 & 0xFFFFFFFFFFFFF3FFLL);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v143, v162, 16);
              if (v62)
              {
                v63 = *(_QWORD *)v144;
                do
                {
                  for (i = 0; i != v62; ++i)
                  {
                    if (*(_QWORD *)v144 != v63)
                      objc_enumerationMutation(v61);
                    objc_msgSend(v57, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v143 + 1) + 8 * i));
                  }
                  v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v143, v162, 16);
                }
                while (v62);
              }

              if ((a3 & 0x400) == 0)
                objc_msgSend(v57, "removeObjectForKey:", CFSTR("DistanceResults"));
            }
            if (objc_msgSend(v57, "count"))
              objc_msgSend(v56, "setObject:forKey:", v57, CFSTR("metadataRanges"));
          }
          v65 = -[NSNumber BOOLValue](self->_noResultStrip, "BOOLValue");
          v66 = v56;
          if (!v65)
          {
            MediaAnalysisStripInternalResultsFromAnalysis(v56);
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = v122;
          }
          objc_msgSend(v124, "addObject:", v66);
          if (!v65)

          if (v45)
          {
LABEL_112:

            v67 = 0;
            v140 = 0;
            v141 = 0;
            v130 = 0;
            v131 = 0;
            v132 = 0;
          }
          else
          {
            v35 = v35;

            v142 = v142;
            v68 = v136;

            v69 = v138;
            v40 = v40;

            v140 = v40;
            v141 = v68;
            v67 = v161;
            v130 = v69;
            v131 = v142;
            v132 = v35;
          }
          if (v129)
            v129[2](v129, a3, (double)(int)v135 * 100.0 / (double)(unint64_t)objc_msgSend(v133, "count"));
          v32 = v67 != 0;

          v39 = 1;
          goto LABEL_117;
        }
LABEL_72:
        if (v141 && objc_msgSend(v141, "mediaType") == 2)
        {
          v47 = v130;
          if (!v117)
            v47 = 0;
          v137 = v47;
          v48 = objc_opt_class();
          v49 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
          v160[0] = *MEMORY[0x1E0CA2E50];
          v160[1] = v49;
          v160[2] = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
          -[VCPMediaAnalyzer _queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:](self, "_queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:", v48, v141, v137, v121, v160, 1, 0);
          v50 = objc_claimAutoreleasedReturnValue();

          v131 = (void *)v50;
          v51 = objc_opt_class();
          v52 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
          v159[0] = *MEMORY[0x1E0CA2E50];
          v159[1] = v52;
          v159[2] = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
          -[VCPMediaAnalyzer _queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:](self, "_queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:", v51, v141, v137, v121, v159, 1, 0);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          v132 = v53;
          if (v118 && (!objc_msgSend(v53, "count") || !objc_msgSend(v131, "count")))
          {
            v54 = (uint64_t)v140;
            if (!v140)
            {
              objc_msgSend(MEMORY[0x1E0CD1440], "vcp_allAcceptableResourcesForAsset:", v136);
              v54 = objc_claimAutoreleasedReturnValue();
            }
            v140 = (void *)v54;
            if (+[VCPInterAssetAnalyzer canUseLastFrameOfAsset:withResources:](VCPInterAssetAnalyzer, "canUseLastFrameOfAsset:withResources:", v141))
            {
              if (objc_msgSend(v131, "count"))
                goto LABEL_83;
              v158 = 0;
              v95 = -[VCPInterAssetAnalyzer generateDistanceDescriptor:withDescriptorClass:forAsset:withResources:lastFrame:](v116, "generateDistanceDescriptor:withDescriptorClass:forAsset:withResources:lastFrame:", &v158, objc_opt_class(), v141, v140, 1);
              v96 = v158;
              v97 = v96;
              if (v95)
              {
LABEL_149:

                goto LABEL_87;
              }
              v104 = (void *)MEMORY[0x1E0C99D20];
              v172[0] = CFSTR("duration");
              CMTimeMake(&v157, 1, 1);
              CMTimeToNSDictionary(&v157);
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              v172[1] = CFSTR("attributes");
              v173[0] = v105;
              v173[1] = v97;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v173, v172, 2);
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v104, "arrayWithObject:", v106);
              v107 = objc_claimAutoreleasedReturnValue();

              v131 = (void *)v107;
LABEL_83:
              if (!objc_msgSend(v132, "count"))
              {
                v156 = 0;
                v102 = -[VCPInterAssetAnalyzer generateDistanceDescriptor:withDescriptorClass:forAsset:withResources:lastFrame:](v116, "generateDistanceDescriptor:withDescriptorClass:forAsset:withResources:lastFrame:", &v156, objc_opt_class(), v141, v140, 1);
                v96 = v156;
                v103 = v96;
                if (v102)
                  goto LABEL_149;
                v108 = (void *)MEMORY[0x1E0C99D20];
                v170[0] = CFSTR("duration");
                CMTimeMake(&v155, 1, 1);
                CMTimeToNSDictionary(&v155);
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                v170[1] = CFSTR("attributes");
                v171[0] = v109;
                v171[1] = v103;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v171, v170, 2);
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v108, "arrayWithObject:", v110);
                v111 = objc_claimAutoreleasedReturnValue();

                v132 = (void *)v111;
              }
            }
          }
          v55 = v137;
        }
        else
        {
          v55 = 0;
        }
        v70 = v138;
        if (!v117)
          v70 = 0;
        v137 = v70;

        v71 = objc_opt_class();
        v72 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
        v154[0] = *MEMORY[0x1E0CA2E50];
        v154[1] = v72;
        v154[2] = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
        -[VCPMediaAnalyzer _queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:](self, "_queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:", v71, v136, v137, v121, v154, 0, 0);
        v142 = (id)objc_claimAutoreleasedReturnValue();
        v73 = objc_opt_class();
        v74 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
        v153[0] = *MEMORY[0x1E0CA2E50];
        v153[1] = v74;
        v153[2] = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
        -[VCPMediaAnalyzer _queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:](self, "_queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:", v73, v136, v137, v121, v153, 0, &v161);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v75;
        if (!v118 || objc_msgSend(v75, "count") && objc_msgSend(v142, "count"))
        {
          v40 = 0;
          goto LABEL_126;
        }
        objc_msgSend(MEMORY[0x1E0CD1440], "vcp_allAcceptableResourcesForAsset:", v136);
        v40 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v40, "vcp_hasLocalPhoto:", objc_msgSend(v136, "hasAdjustments")))
        {
          if (objc_msgSend(v142, "count"))
            goto LABEL_142;
          v152 = 0;
          v89 = -[VCPInterAssetAnalyzer generateDistanceDescriptor:withDescriptorClass:forAsset:withResources:lastFrame:](v116, "generateDistanceDescriptor:withDescriptorClass:forAsset:withResources:lastFrame:", &v152, objc_opt_class(), v136, v40, 0);
          v87 = v152;
          v90 = v87;
          if (v89)
          {
LABEL_144:

            goto LABEL_88;
          }
          v91 = (void *)MEMORY[0x1E0C99D20];
          v168[0] = CFSTR("duration");
          CMTimeMake(&v151, 1, 1);
          CMTimeToNSDictionary(&v151);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v168[1] = CFSTR("attributes");
          v169[0] = v92;
          v169[1] = v90;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v169, v168, 2);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "arrayWithObject:", v93);
          v94 = objc_claimAutoreleasedReturnValue();

          v142 = (id)v94;
LABEL_142:
          if (!objc_msgSend(v35, "count"))
          {
            v150 = 0;
            v86 = -[VCPInterAssetAnalyzer generateDistanceDescriptor:withDescriptorClass:forAsset:withResources:lastFrame:](v116, "generateDistanceDescriptor:withDescriptorClass:forAsset:withResources:lastFrame:", &v150, objc_opt_class(), v136, v40, 0);
            v87 = v150;
            v88 = v87;
            if (v86)
              goto LABEL_144;
            v98 = (void *)MEMORY[0x1E0C99D20];
            v166[0] = CFSTR("duration");
            CMTimeMake(&v149, 1, 1);
            CMTimeToNSDictionary(&v149);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            v166[1] = CFSTR("attributes");
            v167[0] = v99;
            v167[1] = v88;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v167, v166, 2);
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "arrayWithObject:", v100);
            v101 = objc_claimAutoreleasedReturnValue();

            v35 = (id)v101;
          }
        }
LABEL_126:
        v45 = 0;
        if (!v132 || !v35)
          goto LABEL_89;
        if (!objc_msgSend(v132, "count"))
          goto LABEL_145;
        v45 = 0;
        if (!objc_msgSend(v35, "count") || !v131 || !v142)
          goto LABEL_89;
        if (objc_msgSend(v131, "count") && objc_msgSend(v142, "count"))
        {
          *(_DWORD *)buf = 0;
          v147 = 0;
          v45 = -[VCPInterAssetAnalyzer computeDistance:fromArray:toArray:](v116, "computeDistance:fromArray:toArray:", buf, v132, v35);
          if (!v45)
          {
            v45 = -[VCPInterAssetAnalyzer computeDistance:fromArray:toArray:](v116, "computeDistance:fromArray:toArray:", &v147, v131, v142);
            if (!v45)
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              v78 = v76;
              if (v76)
              {
                if (v32 || v161 != 0)
                  objc_msgSend(v76, "setObject:forKey:", &unk_1E6B74960, CFSTR("flags"));
                v164[0] = CFSTR("distance");
                LODWORD(v77) = *(_DWORD *)buf;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v77);
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                v165[0] = v79;
                v164[1] = CFSTR("sceneprintDistance");
                LODWORD(v80) = v147;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v80);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                v165[1] = v81;
                v164[2] = CFSTR("neighbor");
                objc_msgSend(v141, "localIdentifier");
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                v165[2] = v82;
                v164[3] = CFSTR("neighborDateModified");
                objc_msgSend(v141, "vcp_modificationDate");
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                v165[3] = v83;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v165, v164, 4);
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "setObject:forKey:", v84, CFSTR("attributes"));

                v163 = v78;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v163, 1);
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v139, "setObject:forKey:", v85, CFSTR("DistanceResults"));

                objc_msgSend(v138, "vcp_addTypes:", 1024);
                v45 = 0;
              }
              else
              {
                v45 = -108;
              }

            }
          }
        }
        else
        {
LABEL_145:
          v45 = 0;
        }
        goto LABEL_89;
      }
      v39 = 0;
    }
    v142 = 0;
    v35 = 0;
LABEL_117:

    v33 = v140;
    v34 = v141;
    objc_autoreleasePoolPop(context);
    v31 = v135;
    if ((v39 & 1) == 0)
    {
      v113 = -128;
      goto LABEL_165;
    }
  }
  v112 = objc_msgSend(v133, "count");
  if (v112 == objc_msgSend(v124, "count"))
  {
    v113 = 0;
    goto LABEL_165;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] failed to request analyses", buf, 2u);
  }
LABEL_164:
  v113 = -18;
LABEL_165:

LABEL_166:
  return v113;
}

- (int)requestAnalysesForAssets:(id)a3 analysisTypes:(unint64_t)a4 allowOndemand:(BOOL)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  const __CFString *v18;
  _QWORD v19[2];

  v9 = a5;
  v19[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v18 = CFSTR("AllowOnDemand");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = -[VCPMediaAnalyzer requestAnalysis:forAssets:withOptions:andProgressHandler:andCompletionHandler:](self, "requestAnalysis:forAssets:withOptions:andProgressHandler:andCompletionHandler:", a4, v12, v16, v13, v14);

  return a4;
}

- (int)requestAnalysis:(unint64_t)a3 forAssets:(id)a4 withOptions:(id)a5 andProgressHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD);
  VCPMediaAnalyzer *v16;
  void *v17;
  int v18;
  void *v19;
  NSNumber *v20;
  NSNumber *standalone;
  void *v22;
  NSNumber *v23;
  NSNumber *noResultStrip;
  atomic<int> *p_nextRequestID;
  int v26;
  VCPCancelToken *v27;
  VCPCancelToken *v28;
  void *v29;
  NSObject *cancelQueue;
  VCPCancelToken *v31;
  NSObject *v32;
  id v33;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  id v39;
  void (**v40)(id, _QWORD);
  unint64_t v41;
  int v42;
  _QWORD block[5];
  VCPCancelToken *v44;
  int v45;
  _QWORD aBlock[4];
  VCPCancelToken *v47;
  uint8_t buf[16];

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, _QWORD))a7;
  objc_msgSend((id)objc_opt_class(), "sharedMediaAnalyzer");
  v16 = (VCPMediaAnalyzer *)objc_claimAutoreleasedReturnValue();

  if (v16 != self)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] [requestAnalysesForAssets] call from invalid instance", buf, 2u);
    }
    goto LABEL_17;
  }
  if (!v12 || !objc_msgSend(v12, "count"))
  {
LABEL_17:
    v15[2](v15, 0);
    v26 = -1;
    goto LABEL_18;
  }
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AllowOnDemand"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  if (!self->_standalone
    || (objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Standalone")),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v19,
        v19))
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Standalone"));
    v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    standalone = self->_standalone;
    self->_standalone = v20;

  }
  if (!self->_noResultStrip
    || (objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("KeepPrivateResults")),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v22,
        v22))
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("KeepPrivateResults"));
    v23 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    noResultStrip = self->_noResultStrip;
    self->_noResultStrip = v23;

  }
  if (((!-[NSNumber BOOLValue](self->_standalone, "BOOLValue") | v18) & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] [requestAnalysesForAssets] in standalone mode but on-demand not allowed", buf, 2u);
    }
    goto LABEL_17;
  }
  p_nextRequestID = &self->_nextRequestID;
  do
    v26 = __ldaxr((unsigned int *)p_nextRequestID);
  while (__stlxr(v26 + 1, (unsigned int *)p_nextRequestID));
  v27 = objc_alloc_init(VCPCancelToken);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__VCPMediaAnalyzer_requestAnalysis_forAssets_withOptions_andProgressHandler_andCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E6B15CE8;
  v28 = v27;
  v47 = v28;
  v29 = _Block_copy(aBlock);
  cancelQueue = self->_cancelQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__VCPMediaAnalyzer_requestAnalysis_forAssets_withOptions_andProgressHandler_andCompletionHandler___block_invoke_2;
  block[3] = &unk_1E6B1A270;
  v45 = v26;
  block[4] = self;
  v44 = v28;
  v31 = v28;
  dispatch_sync(cancelQueue, block);
  dispatch_get_global_queue(0, 0);
  v32 = objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __98__VCPMediaAnalyzer_requestAnalysis_forAssets_withOptions_andProgressHandler_andCompletionHandler___block_invoke_3;
  v35[3] = &unk_1E6B1A298;
  v35[4] = self;
  v41 = a3;
  v36 = v12;
  v37 = v13;
  v38 = v14;
  v39 = v29;
  v40 = v15;
  v42 = v26;
  v33 = v29;
  dispatch_async(v32, v35);

LABEL_18:
  return v26;
}

uint64_t __98__VCPMediaAnalyzer_requestAnalysis_forAssets_withOptions_andProgressHandler_andCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isCanceled");
}

void __98__VCPMediaAnalyzer_requestAnalysis_forAssets_withOptions_andProgressHandler_andCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v1);

}

void __98__VCPMediaAnalyzer_requestAnalysis_forAssets_withOptions_andProgressHandler_andCompletionHandler___block_invoke_3(uint64_t a1)
{
  int v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  int v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(a1 + 32), "requestAnalysisTypes:forAssets:withOptions:andProgressHandler:cancelBlock:analyses:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v3 = v6;
  if (v2)
  {

    v3 = 0;
  }
  v7 = v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 104);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__VCPMediaAnalyzer_requestAnalysis_forAssets_withOptions_andProgressHandler_andCompletionHandler___block_invoke_4;
  block[3] = &unk_1E6B16108;
  block[4] = v4;
  v9 = *(_DWORD *)(a1 + 88);
  dispatch_sync(v5, block);

}

void __98__VCPMediaAnalyzer_requestAnalysis_forAssets_withOptions_andProgressHandler_andCompletionHandler___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeObjectForKey:");

}

- (id)requestAnalysisTypes:(unint64_t)a3 forAssets:(id)a4 allowOndemand:(BOOL)a5 progressHandler:(id)a6 error:(id *)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v18;
  _QWORD v19[2];

  v9 = a5;
  v19[1] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a6;
  v18 = CFSTR("AllowOnDemand");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPMediaAnalyzer requestAnalysis:forAssets:withOptions:andProgressHandler:andError:](self, "requestAnalysis:forAssets:withOptions:andProgressHandler:andError:", a3, v12, v15, v13, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)requestAnalysis:(unint64_t)a3 forAssets:(id)a4 withOptions:(id)a5 andProgressHandler:(id)a6 andError:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  NSNumber *v18;
  NSNumber *standalone;
  void *v20;
  NSNumber *v21;
  NSNumber *noResultStrip;
  VCPMediaAnalyzer *v23;
  void *v24;
  int v25;
  uint8_t v27[16];
  uint8_t buf[16];

  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AllowOnDemand"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  if (!self->_standalone
    || (objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Standalone")),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v17,
        v17))
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Standalone"));
    v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    standalone = self->_standalone;
    self->_standalone = v18;

  }
  if (!self->_noResultStrip
    || (objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("KeepPrivateResults")),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v20,
        v20))
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("KeepPrivateResults"));
    v21 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    noResultStrip = self->_noResultStrip;
    self->_noResultStrip = v21;

  }
  objc_msgSend((id)objc_opt_class(), "sharedMediaAnalyzer");
  v23 = (VCPMediaAnalyzer *)objc_claimAutoreleasedReturnValue();

  if (v23 != self)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] call from invalid instance", buf, 2u);
    }
    v24 = 0;
    v25 = -18;
LABEL_12:
    if (a7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v25, 0);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_15;
  }
  if (objc_msgSend(v12, "count"))
  {
    if (((!-[NSNumber BOOLValue](self->_standalone, "BOOLValue") | v16) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[VCPMediaAnalyzer requestAnalysisTypes:forAssets:withOptions:andProgressHandler:cancelBlock:analyses:](self, "requestAnalysisTypes:forAssets:withOptions:andProgressHandler:cancelBlock:analyses:", a3, v12, v13, v14, &__block_literal_global_597, v24);
      if (!v25)
        goto LABEL_16;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v27 = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] on-demand analysis requested in standalone mode", v27, 2u);
      }
      v24 = 0;
      v25 = -50;
    }
    goto LABEL_12;
  }
LABEL_15:
  v24 = 0;
LABEL_16:

  return v24;
}

uint64_t __86__VCPMediaAnalyzer_requestAnalysis_forAssets_withOptions_andProgressHandler_andError___block_invoke()
{
  return 0;
}

- (id)curateMovieAssetsForCollection:(id)a3 withAlreadyCuratedAssets:(id)a4 andDesiredCount:(unint64_t)a5 allowOnDemand:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  unsigned __int8 v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  _OWORD *v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  __int128 v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  int v46;
  uint64_t m;
  uint64_t v48;
  int v49;
  _BOOL4 v50;
  char v51;
  int v52;
  void *v53;
  void *v54;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t k;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *context;
  uint64_t v73;
  VCPInterAssetAnalyzer *v74;
  id v75;
  id obj;
  void *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _OWORD v82[3];
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _OWORD v91[3];
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  uint8_t v104[128];
  uint8_t buf[4];
  void *v106;
  uint64_t v107;

  v6 = a6;
  v107 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v75 = a4;
  v64 = v9;
  if ((v10 & 1) == 0
  {
    -[VCPMediaAnalyzer curateMovieAssetsForCollection:withAlreadyCuratedAssets:andDesiredCount:allowOnDemand:]::kDescriptorClass = +[VCPMediaAnalyzer _getDistanceDescriptorClass](VCPMediaAnalyzer, "_getDistanceDescriptorClass");
  }
  v11 = 0;
  if (v9 && a5)
  {
    if (v6 && (int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Warning: On demand analysis is not supported.", buf, 2u);
    }
    objc_msgSend(v9, "photoLibrary");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPMediaAnalyzer _databaseForPhotoLibrary:](self, "_databaseForPhotoLibrary:", v63);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v12;
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD1398], "vcp_fetchOptionsForLibrary:forTaskID:", v63, 1);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD1398], "fetchAssetsInAssetCollection:options:", v9);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      obj = v61;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v97;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v97 != v14)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * i);
            v17 = (void *)MEMORY[0x1BCCA1B2C]();
            if (objc_msgSend(v16, "isVideo") && (objc_msgSend(v75, "containsObject:", v16) & 1) == 0)
            {
              objc_msgSend(v16, "fetchPropertySetsIfNeeded");
              objc_msgSend(v16, "localIdentifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "queryAnalysisForAsset:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              MediaAnalysisPostProcessCurationScore(v16, v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (v20)
              {
                if ((objc_msgSend(v20, "vcp_types") & 0x80) != 0 && (objc_msgSend(v20, "vcp_flags") & 0x80000000) == 0)
                {
                  objc_msgSend(v20, "vcp_quality");
                  *(float *)&v21 = v21;
                  if (*(float *)&v21 > 0.4)
                  {
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v69, "objectForKey:", v22);
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v23)
                    {
                      objc_msgSend(MEMORY[0x1E0C99E20], "set");
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v69, "setObject:forKey:", v23, v22);
                    }
                    objc_msgSend(v23, "addObject:", v16);

                  }
                }
              }

            }
            objc_autoreleasePoolPop(v17);
          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
        }
        while (v13);
      }

      objc_msgSend(v69, "allKeys");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "sortedArrayUsingSelector:", sel_compare_);
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      v26 = v75;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v92, v103, 16);
      v28 = (_OWORD *)MEMORY[0x1E0CA2E50];
      if (v27)
      {
        v29 = *(_QWORD *)v93;
        do
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v93 != v29)
              objc_enumerationMutation(v26);
            v31 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * j);
            v32 = (void *)MEMORY[0x1BCCA1B2C]();
            v33 = v28[1];
            v91[0] = *v28;
            v91[1] = v33;
            v91[2] = v28[2];
            -[VCPMediaAnalyzer _queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:](self, "_queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:", -[VCPMediaAnalyzer curateMovieAssetsForCollection:withAlreadyCuratedAssets:andDesiredCount:allowOnDemand:]::kDescriptorClass, v31, 0, v77, v91, 0, 0);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v34, "count"))
            {
              if ((unint64_t)objc_msgSend(v34, "count") >= 0xB)
              {
                objc_msgSend(v34, "subarrayWithRange:", 0, 10);
                v35 = objc_claimAutoreleasedReturnValue();

                v34 = (void *)v35;
              }
              objc_msgSend(v25, "addObject:", v34);
            }

            objc_autoreleasePoolPop(v32);
          }
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v92, v103, 16);
        }
        while (v27);
      }

      v74 = objc_alloc_init(VCPInterAssetAnalyzer);
      if (!v74)
        goto LABEL_92;
      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      v65 = v25;
      objc_msgSend(v62, "reverseObjectEnumerator");
      v58 = (id)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v87, v102, 16);
      if (v36)
      {
        v37 = 0;
        v56 = v36;
        v57 = *(_QWORD *)v88;
        while (1)
        {
          for (k = 0; k != v56; ++k)
          {
            if (*(_QWORD *)v88 != v57)
              objc_enumerationMutation(v58);
            v38 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * k);
            v83 = 0u;
            v84 = 0u;
            v85 = 0u;
            v86 = 0u;
            objc_msgSend(v69, "objectForKey:", v38);
            v11 = objc_claimAutoreleasedReturnValue();
            v67 = (id)v11;
            v39 = objc_msgSend((id)v11, "countByEnumeratingWithState:objects:count:", &v83, v101, 16);
            if (v39)
            {
              v70 = *(_QWORD *)v84;
LABEL_45:
              v40 = 0;
              v71 = v39;
              while (1)
              {
                if (*(_QWORD *)v84 != v70)
                  objc_enumerationMutation(v67);
                v73 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * v40);
                context = (void *)MEMORY[0x1BCCA1B2C]();
                v41 = v28[1];
                v82[0] = *v28;
                v82[1] = v41;
                v82[2] = v28[2];
                -[VCPMediaAnalyzer _queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:](self, "_queryDistanceDescriptor:ofAsset:withExistingAnalysis:andDatabase:timeRange:lastFeature:isDegraded:", -[VCPMediaAnalyzer curateMovieAssetsForCollection:withAlreadyCuratedAssets:andDesiredCount:allowOnDemand:]::kDescriptorClass, v73, 0, v77, v82, 0, 0);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                if (!objc_msgSend(v42, "count"))
                {
                  v52 = 16;
                  goto LABEL_77;
                }
                if ((unint64_t)objc_msgSend(v42, "count") >= 0xB)
                {
                  objc_msgSend(v42, "subarrayWithRange:", 0, 10);
                  v43 = objc_claimAutoreleasedReturnValue();

                  v42 = (void *)v43;
                }
                v80 = 0u;
                v81 = 0u;
                v78 = 0u;
                v79 = 0u;
                v44 = v25;
                v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v78, v100, 16);
                if (v45)
                {
                  v11 = *(_QWORD *)v79;
                  v46 = 1;
                  while (2)
                  {
                    for (m = 0; m != v45; ++m)
                    {
                      if (*(_QWORD *)v79 != v11)
                        objc_enumerationMutation(v44);
                      v48 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * m);
                      *(float *)buf = 0.0;
                      v49 = -[VCPInterAssetAnalyzer computeDistance:fromArray:toArray:](v74, "computeDistance:fromArray:toArray:", buf, v42, v48);
                      if (v49)
                        v37 = v49;
                      else
                        v46 = (*(float *)buf >= 0.1) & v46;
                      if (v49 || *(float *)buf < 0.1)
                      {
                        v11 = *(float *)buf >= 0.1;
                        v50 = v49 == 0;

                        v25 = v65;
                        v51 = !v50 | v11;
                        if (v50)
                          v52 = 0;
                        else
                          v52 = 12;
                        if ((v51 & 1) == 0 && ((v46 ^ 1) & 1) == 0)
                          goto LABEL_73;
                        goto LABEL_77;
                      }
                    }
                    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v78, v100, 16);
                    if (v45)
                      continue;
                    break;
                  }

                  v25 = v65;
                  if ((v46 & 1) != 0)
                    goto LABEL_73;
                }
                else
                {

LABEL_73:
                  v11 = (uint64_t)v66;
                  objc_msgSend(v66, "addObject:", v73);
                  if (objc_msgSend(v66, "count") == a5)
                  {
                    v37 = 0;
                    v52 = 12;
                    goto LABEL_77;
                  }
                  objc_msgSend(v44, "addObject:", v42);
                }
                v52 = 0;
LABEL_77:

                objc_autoreleasePoolPop(context);
                if ((v52 | 0x10) != 0x10)
                {

                  if (v52 == 12)
                    goto LABEL_91;
LABEL_97:

LABEL_98:
                  v12 = v77;
                  goto LABEL_99;
                }
                if (++v40 == v71)
                {
                  v11 = (uint64_t)v67;
                  v39 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v83, v101, 16);
                  if (v39)
                    goto LABEL_45;
                  break;
                }
              }
            }

          }
          v56 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v87, v102, 16);
          if (!v56)
            goto LABEL_90;
        }
      }
      v37 = 0;
LABEL_90:

LABEL_91:
      if (!v37)
      {
        if (objc_msgSend(v66, "count"))
          v54 = v66;
        else
          v54 = 0;
      }
      else
      {
LABEL_92:
        v54 = 0;
      }
      v11 = v54;
      goto LABEL_97;
    }
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "localIdentifier");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)buf = 5.7779e-34;
      v106 = v53;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Failed to obtain database for collection %@", buf, 0xCu);

      v11 = 0;
      goto LABEL_98;
    }
    v11 = 0;
LABEL_99:

  }
  return (id)v11;
}

- (id)requestMovieHighlightsForAssets:(id)a3 withOptions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  VCPMovieCurationResults *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  int v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  const __CFDictionary *v34;
  void *v35;
  unsigned int v36;
  unsigned int v37;
  void *v38;
  const __CFDictionary *v39;
  void *v40;
  unsigned int v41;
  unsigned int v42;
  VCPVideoKeyFrameResult *v43;
  VCPVideoKeyFrameResult *v44;
  void *v45;
  VCPMovieHighlightResult *v46;
  VCPMovieHighlightResult *v47;
  void *v48;
  void *v50;
  int v51;
  void *v52;
  int v53;
  id v55;
  void *v56;
  void *context;
  void *v58;
  unint64_t v59;
  void *v60;
  id obj;
  CMTimeRange v62;
  CMTime v63;
  CMTime v64;
  CMTimeRange buf;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v58 = v5;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPMediaAnalyzer _databaseForPhotoLibrary:](self, "_databaseForPhotoLibrary:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  v52 = (void *)v9;
  if (v9)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AllowOnDemand"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ScaledSlomoTime"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HighlightContexts"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", CFSTR("SearchQueryString"));

    if (v15)
    {
      -[VCPMediaAnalyzer prepareContextsQueryEmbedding:](self, "prepareContextsQueryEmbedding:", v13);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)objc_msgSend(v6, "mutableCopy");
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v50, CFSTR("HighlightContexts"));

    }
    else
    {
      v50 = v13;
      v16 = v6;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v55 = (id)objc_claimAutoreleasedReturnValue();
    v59 = 0;
    v51 = v12 ^ 1;
    while (1)
    {
      if (objc_msgSend(v58, "count") <= v59)
      {

        v6 = v16;
        goto LABEL_39;
      }
      objc_msgSend(v58, "objectAtIndexedSubscript:");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      context = (void *)MEMORY[0x1BCCA1B2C]();
      v17 = v60;
      objc_msgSend(v60, "fetchPropertySetsIfNeeded");
      v18 = -[VCPMovieCurationResults initWithPHAsset:]([VCPMovieCurationResults alloc], "initWithPHAsset:", v60);
      if (objc_msgSend(v60, "isVideo"))
      {
        if ((objc_msgSend(v60, "vcp_isShortMovie") & 1) == 0)
          break;
      }
LABEL_37:
      objc_msgSend(v55, "addObject:", v18);

      objc_autoreleasePoolPop(context);
      ++v59;
    }
    if (-[NSNumber BOOLValue](self->_standalone, "BOOLValue"))
    {
      v56 = 0;
    }
    else
    {
      objc_msgSend(v60, "localIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "queryAnalysisForAsset:", v19);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v60;
      if ((objc_msgSend(v56, "vcp_types") & 0x80000040000) != 0)
      {
        MediaAnalysisPostProcessAnalysis(v60, v56, v51);
        v20 = objc_claimAutoreleasedReturnValue();

        VCPSignPostLog();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = os_signpost_id_generate(v21);

        VCPSignPostLog();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
        {
          LOWORD(buf.start.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "VCPPostProcessMovieHighlights", ", (uint8_t *)&buf, 2u);
        }

        -[VCPMediaAnalyzer _postProcessMovieHighlights:analysis:withOptions:](self, "_postProcessMovieHighlights:analysis:withOptions:", v60, v20, v16);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        VCPSignPostLog();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
        {
          LOWORD(buf.start.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v27, OS_SIGNPOST_INTERVAL_END, v22, "VCPPostProcessMovieHighlights", ", (uint8_t *)&buf, 2u);
        }

        v56 = (void *)v20;
        v17 = v60;
        goto LABEL_24;
      }
    }
    v25 = 0;
LABEL_24:
    if (v25)
      v28 = 0;
    else
      v28 = v53;
    if (v28 == 1)
    {
      -[VCPMediaAnalyzer _analyzeOndemand:forAnalysisTypes:withExistingAnalysis:andOptions:storeAnalysis:cancelBlock:](self, "_analyzeOndemand:forAnalysisTypes:withExistingAnalysis:andOptions:storeAnalysis:cancelBlock:", v17, 0x80000040000, v56, v16, 1, &__block_literal_global_601);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPMediaAnalyzer _postProcessMovieHighlights:analysis:withOptions:](self, "_postProcessMovieHighlights:analysis:withOptions:", v17, v29, v16);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    objc_msgSend(v25, "vcp_results");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("MovieHighlightResults"));
    obj = (id)objc_claimAutoreleasedReturnValue();

    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v67 != v32)
            objc_enumerationMutation(obj);
          v34 = *(const __CFDictionary **)(*((_QWORD *)&v66 + 1) + 8 * i);
          memset(&buf, 0, sizeof(buf));
          CMTimeRangeMakeFromDictionary(&buf, v34);
          -[__CFDictionary objectForKeyedSubscript:](v34, "objectForKeyedSubscript:", CFSTR("quality"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "floatValue");
          v37 = v36;

          -[__CFDictionary objectForKeyedSubscript:](v34, "objectForKeyedSubscript:", CFSTR("attributes"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          memset(&v64, 0, sizeof(v64));
          objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("keyFrameTime"));
          v39 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          CMTimeMakeFromDictionary(&v64, v39);

          objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("keyFrameScore"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "floatValue");
          v42 = v41;

          v43 = [VCPVideoKeyFrameResult alloc];
          v63 = v64;
          v44 = -[VCPVideoKeyFrameResult initWithTime:andScore:](v43, "initWithTime:andScore:", &v63, COERCE_DOUBLE(__PAIR64__(HIDWORD(v64.value), v42)));
          -[VCPMovieCurationResults highlights](v18, "highlights");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = [VCPMovieHighlightResult alloc];
          v62 = buf;
          v47 = -[VCPMovieHighlightResult initWithTimeRange:score:andKeyFrame:](v46, "initWithTimeRange:score:andKeyFrame:", &v62, v44, COERCE_DOUBLE(__PAIR64__(buf.duration.flags, v37)));
          objc_msgSend(v45, "addObject:", v47);

          v48 = (void *)objc_msgSend(v25, "mutableCopy");
          -[VCPMovieCurationResults setResults:](v18, "setResults:", v48);

        }
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
      }
      while (v31);
    }

    goto LABEL_37;
  }
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.start.value) = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Failed to obtain database for assets", (uint8_t *)&buf, 2u);
  }
  v55 = 0;
LABEL_39:

  return v55;
}

uint64_t __64__VCPMediaAnalyzer_requestMovieHighlightsForAssets_withOptions___block_invoke()
{
  return 0;
}

- ($C7CBA4C8288BA02ADCCB8E56B4665FF4)postProcessMovieHighlightDuration:(SEL)a3 withOptions:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t i;
  const __CFDictionary *v20;
  double Seconds;
  int v22;
  const __CFDictionary *v23;
  uint64_t v24;
  __int128 v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  float v32;
  uint64_t j;
  void *v34;
  void *v35;
  float v36;
  float v37;
  __int128 v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFDictionary *v44;
  uint64_t v45;
  __int128 v46;
  $C7CBA4C8288BA02ADCCB8E56B4665FF4 *result;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  __int128 v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  CMTime time;
  CMTimeRange v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[4];
  _QWORD v65[4];
  _QWORD v66[5];
  _QWORD v67[5];
  _BYTE v68[128];
  _QWORD v69[4];
  _QWORD v70[4];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v53 = a4;
  v7 = a5;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HighlightTargetDuration"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HighlightTolerance"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HighlightIndex"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MaxHighlightDuration"));
  *(_QWORD *)&v52 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HighlightBestTrim"));
  *((_QWORD *)&v52 + 1) = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    objc_msgSend(v53, "vcp_results");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MovieHighlightResults"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HighlightStartRange"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9 || !objc_msgSend(v9, "count"))
    goto LABEL_30;
  v10 = (void *)v52;
  if (v52 != 0)
  {
    if ((_QWORD)v52)
    {
      v69[0] = CFSTR("HighlightMaxDuration");
    }
    else
    {
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      objc_msgSend(v53, "vcp_results");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("MovieHighlightResults"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v61;
        v18 = 0.0;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v61 != v17)
              objc_enumerationMutation(v15);
            v20 = *(const __CFDictionary **)(*((_QWORD *)&v60 + 1) + 8 * i);
            memset(&v59, 0, sizeof(v59));
            CMTimeRangeMakeFromDictionary(&v59, v20);
            time = v59.duration;
            Seconds = CMTimeGetSeconds(&time);
            if (v18 < Seconds)
              v18 = Seconds;
          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
        }
        while (v16);
      }
      else
      {
        v18 = 0.0;
      }

      v69[0] = CFSTR("HighlightMaxDuration");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v39 = *((_QWORD *)&v52 + 1);
    if (!*((_QWORD *)&v52 + 1))
      v39 = MEMORY[0x1E0C9AAA0];
    v70[0] = v10;
    v70[1] = v39;
    v69[1] = CFSTR("HighlightBestTrim");
    v69[2] = CFSTR("HighlightIndex");
    v69[3] = CFSTR("HighlightFullResult");
    v40 = &unk_1E6B74900;
    if (v51)
      v40 = v51;
    v70[2] = v40;
    v70[3] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!(_QWORD)v52)

LABEL_55:
    MediaAnalysisPostProcessMovieHighlights(v53, v26, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v41
      && (objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("MovieHighlightResults")),
          v43 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v43, "objectAtIndexedSubscript:", 0),
          v44 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(),
          v43,
          v44))
    {
      CMTimeRangeMakeFromDictionary((CMTimeRange *)retstr, v44);
    }
    else
    {
      v44 = 0;
      v45 = MEMORY[0x1E0CA2E50];
      v46 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
      *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E50];
      *(_OWORD *)&retstr->var0.var3 = v46;
      *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v45 + 32);
    }

    goto LABEL_60;
  }
  if (v50)
  {
    v11 = &unk_1E6B71FC0;
    v12 = &unk_1E6B74900;
    if (v49)
    {
      v66[0] = CFSTR("HighlightStartRange");
      v66[1] = CFSTR("HighlightTargetDuration");
      v67[0] = v49;
      v67[1] = v50;
      if (v48)
        v11 = v48;
      v66[2] = CFSTR("HighlightTolerance");
      v66[3] = CFSTR("HighlightIndex");
      if (v51)
        v12 = v51;
      v67[2] = v11;
      v67[3] = v12;
      v66[4] = CFSTR("HighlightFullResult");
      v67[4] = MEMORY[0x1E0C9AAA0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 5);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v64[0] = CFSTR("HighlightTargetDuration");
      v64[1] = CFSTR("HighlightTolerance");
      if (v48)
        v11 = v48;
      v65[0] = v50;
      v65[1] = v11;
      if (v51)
        v12 = v51;
      v64[2] = CFSTR("HighlightIndex");
      v64[3] = CFSTR("HighlightFullResult");
      v65[2] = v12;
      v65[3] = MEMORY[0x1E0C9AAA0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 4);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v26 = (void *)v13;
    goto LABEL_55;
  }
  if (v51)
  {
    if ((objc_msgSend(v51, "intValue") & 0x80000000) == 0)
    {
      v22 = objc_msgSend(v51, "intValue");
      if (objc_msgSend(v9, "count") > (unint64_t)v22)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", (int)objc_msgSend(v51, "intValue"));
        v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CMTimeRangeMakeFromDictionary((CMTimeRange *)retstr, v23);

        goto LABEL_60;
      }
    }
LABEL_30:
    v24 = MEMORY[0x1E0CA2E40];
    v25 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E40];
    *(_OWORD *)&retstr->var0.var3 = v25;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v24 + 32);
    goto LABEL_60;
  }
  v27 = MEMORY[0x1E0CA2E40];
  v28 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&retstr->var0.var3 = v28;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v27 + 32);
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v29 = v9;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v55;
    v32 = 0.0;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v55 != v31)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
        objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("quality"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "floatValue");
        v37 = v36;

        if (v32 < v37)
        {
          CMTimeRangeMakeFromDictionary(&v59, (CFDictionaryRef)v34);
          v38 = *(_OWORD *)&v59.start.epoch;
          *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v59.start.value;
          *(_OWORD *)&retstr->var0.var3 = v38;
          *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&v59.duration.timescale;
          v32 = v37;
        }
      }
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
    }
    while (v30);
  }

LABEL_60:
  return result;
}

- (id)requestLivePhotoEffectsForAssets:(id)a3 allowOnDemand:(BOOL)a4 flags:(unint64_t)a5
{
  _BOOL4 v5;
  id v7;
  VCPMediaAnalyzer *v8;
  os_log_type_t v9;
  NSObject *v10;
  const char *v11;
  id v12;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  _BOOL8 v38;
  void *v39;
  void *v40;
  VCPEffectsAnalyzer *v41;
  void *v42;
  int v43;
  id v44;
  int v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  VCPProtoLivePhotoEffectsRecipe *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  int v68;
  _BOOL4 v69;
  void *v70;
  id v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  uint8_t buf[16];

  v5 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "sharedMediaAnalyzer");
  v8 = (VCPMediaAnalyzer *)objc_claimAutoreleasedReturnValue();

  if (v8 != self)
  {
    if ((int)MediaAnalysisLogLevel() < 3)
      goto LABEL_13;
    v9 = OS_LOG_TYPE_ERROR;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v10 = MEMORY[0x1E0C81028];
    v11 = "[MediaAnalysis] [requestLivePhotoEffectsForAssets] call from invalid instance";
LABEL_5:
    _os_log_impl(&dword_1B6C4A000, v10, v9, v11, buf, 2u);
LABEL_13:
    v12 = 0;
    goto LABEL_14;
  }
  if (!v7 || !objc_msgSend(v7, "count"))
    goto LABEL_13;
  if (-[NSNumber BOOLValue](self->_standalone, "BOOLValue") && !v5)
  {
    if ((int)MediaAnalysisLogLevel() < 4)
      goto LABEL_13;
    v9 = OS_LOG_TYPE_DEFAULT;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v10 = MEMORY[0x1E0C81028];
    v11 = "[MediaAnalysis] [requestLivePhotoEffectsForAssets] in standalone mode but on-demand not allowed";
    goto LABEL_5;
  }
  v71 = v7;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v14;
  MediaAnalysisResultsTypesForAnalysisTypes(0x100000);
  v65 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "photoLibrary");
  v16 = objc_claimAutoreleasedReturnValue();

  v67 = (void *)v16;
  -[VCPMediaAnalyzer _databaseForPhotoLibrary:](self, "_databaseForPhotoLibrary:", v16);
  v69 = v5;
  v64 = objc_claimAutoreleasedReturnValue();
  +[VCPDatabaseBatchIterator iteratorForAssets:withDatabaseReader:resultTypes:batchSize:](VCPDatabaseBatchIterator, "iteratorForAssets:withDatabaseReader:resultTypes:batchSize:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0;
  v18 = -1;
  v70 = v17;
  while (objc_msgSend(v17, "next"))
  {
    if (objc_msgSend(v7, "count") <= (unint64_t)++v18)
      break;
    v19 = (void *)MEMORY[0x1BCCA1B2C]();
    objc_msgSend(v17, "asset");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v20;
    objc_msgSend(v20, "fetchPropertySetsIfNeeded");
    objc_msgSend(v17, "analysis");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "vcp_results");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("LivePhotoEffectsResults"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v74 = v23;
    v24 = objc_msgSend(v21, "vcp_types");
    v25 = objc_msgSend(v23, "count");
    v26 = v25 != 0;
    if (v25)
    {
      objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("attributes"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("loopSuggestionState"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "intValue");

      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("longExposureSuggestionState"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "intValue");

      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("livePhotoEffectsRecipe"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v30;
      v34 = v32;

      v20 = v75;
    }
    else
    {
      v72 = 0;
      v34 = 0;
      v33 = 0;
    }
    if (!v69 || v33)
      goto LABEL_39;
    objc_msgSend(v67, "librarySpecificFetchOptions");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setIncludedDetectionTypes:", &unk_1E6B76830);
    objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesInAsset:options:", v20, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "count");
    v38 = v37 != 0;
    if (!v37 && (v24 & 0xC) != 0)
    {
      objc_msgSend(v21, "vcp_results");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("FaceResults"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v40 != 0;

    }
    v41 = -[VCPEffectsAnalyzer initWithFlagHasFaceOrPet:]([VCPEffectsAnalyzer alloc], "initWithFlagHasFaceOrPet:", v38);
    if (v41)
    {
      *(_QWORD *)buf = 0;
      v66 = v36;
      +[VCPPhotosAsset assetWithPHAsset:](VCPPhotosAsset, "assetWithPHAsset:", v20);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = 0;
      v43 = -[VCPEffectsAnalyzer analyzeAsset:onDemand:cancel:statsFlags:results:](v41, "analyzeAsset:onDemand:cancel:statsFlags:results:", v42, 1, &__block_literal_global_611, buf, &v76);
      v44 = v76;

      v45 = v43 ? v43 : v68;
      v68 = v45;
      if (v43)
      {
        v33 = 0;
        v46 = 10;
      }
      else
      {
        objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("LivePhotoEffectsResults"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v47, "count"))
        {
          v63 = v47;
          objc_msgSend(v47, "objectAtIndexedSubscript:", 0);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("attributes"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("loopSuggestionState"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v50, "intValue");

          objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("longExposureSuggestionState"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "intValue");

          objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("livePhotoEffectsRecipe"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = v51;
          v34 = v53;

          v26 = 1;
          v47 = v63;
        }
        else
        {
          v33 = 0;
        }

        v46 = 0;
      }

      v36 = v66;
    }
    else
    {
      v33 = 0;
      v46 = 10;
      v68 = -108;
    }

    if (!v46)
    {
LABEL_39:
      if (v26)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v72);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setObject:forKey:", v55, CFSTR("loopSuggestionState"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v34);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setObject:forKey:", v56, CFSTR("longExposureSuggestionState"));

        if (v33)
        {
          v57 = -[VCPProtoLivePhotoEffectsRecipe initWithData:]([VCPProtoLivePhotoEffectsRecipe alloc], "initWithData:", v33);
          -[VCPProtoLivePhotoEffectsRecipe exportToLegacyDictionary](v57, "exportToLegacyDictionary");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "setObject:forKey:", v58, CFSTR("livePhotoEffectsRecipe"));

        }
        objc_msgSend(v75, "localIdentifier");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "setObject:forKey:", v54, v59);

      }
      v46 = 0;
    }

    v17 = v70;
    v7 = v71;
    v14 = v73;
    objc_autoreleasePoolPop(v19);
    if (v46)
    {
      v61 = (void *)v64;
      v60 = (void *)v65;
      goto LABEL_47;
    }
  }
  v61 = (void *)v64;
  v60 = (void *)v65;
LABEL_47:
  if (v68)
    v62 = 0;
  else
    v62 = v14;
  v12 = v62;

LABEL_14:
  return v12;
}

uint64_t __73__VCPMediaAnalyzer_requestLivePhotoEffectsForAssets_allowOnDemand_flags___block_invoke()
{
  return 0;
}

- (void)completeStorage
{
  dispatch_group_wait((dispatch_group_t)self->_storageGroup, 0xFFFFFFFFFFFFFFFFLL);
}

+ (id)personModelFilepathForPhotoLibrary:(id)a3
{
  objc_msgSend(a3, "vcp_vipModelFilepathForVIPType:", 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)loadPersonModelAtPath:(id)a3 error:(id *)a4
{
  +[VCPFaceIDModel loadVIPModelAtPath:withVIPType:error:](VCPFaceIDModel, "loadVIPModelAtPath:withVIPType:error:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (unint64_t)faceprintRevisionForPersonModel:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "faceprintRequestRevision");

  return v4;
}

+ (id)classifyFaceObservation:(id)a3 withPersonsModel:(id)a4 error:(id *)a5
{
  +[VCPFaceIDModel classifyFaceObservation:withModel:error:](VCPFaceIDModel, "classifyFaceObservation:withModel:error:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getTimeRangesForSceneIdentifiers:(id)a3 withResults:(id)a4
{
  id v5;
  void *v6;
  char isKindOfClass;
  const __CFDictionary *v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  BOOL v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  CFDictionaryRef v22;
  id obj;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const __CFDictionary *dictionaryRepresentation;
  id v29;
  id v30;
  uint64_t i;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  CMTimeRange v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  CMTimeRange range;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v30 = a4;
  v32 = v5;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v29 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v32);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("ClassificationResults"));
      obj = (id)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v48 != v26)
              objc_enumerationMutation(obj);
            v8 = *(const __CFDictionary **)(*((_QWORD *)&v47 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = 0u;
            v46 = 0u;
            v43 = 0u;
            v44 = 0u;
            dictionaryRepresentation = v8;
            -[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("attributes"));
            v33 = (id)objc_claimAutoreleasedReturnValue();
            v9 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
            if (v9)
            {
              v34 = *(_QWORD *)v44;
              do
              {
                v35 = v9;
                for (j = 0; j != v35; ++j)
                {
                  if (*(_QWORD *)v44 != v34)
                    objc_enumerationMutation(v33);
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * j), "intValue"));
                  v11 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "addObject:", v11);
                  objc_msgSend(v36, "objectForKeyedSubscript:", v11);
                  v12 = (void *)objc_claimAutoreleasedReturnValue();
                  v13 = v12 == 0;

                  if (v13)
                  {
                    objc_msgSend(MEMORY[0x1E0D75258], "vcp_sharedTaxonomy");
                    v15 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v15, "mad_allAncestorsForSceneId:", objc_msgSend(v11, "unsignedIntValue"));
                    v16 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v16)
                    {
                      objc_msgSend(MEMORY[0x1E0C99E20], "set");
                      v17 = (void *)objc_claimAutoreleasedReturnValue();
                      v41 = 0u;
                      v42 = 0u;
                      v39 = 0u;
                      v40 = 0u;
                      v14 = v16;
                      v18 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
                      if (v18)
                      {
                        v19 = *(_QWORD *)v40;
                        do
                        {
                          for (k = 0; k != v18; ++k)
                          {
                            if (*(_QWORD *)v40 != v19)
                              objc_enumerationMutation(v14);
                            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * k), "sceneClassId"));
                            v21 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v17, "addObject:", v21);

                          }
                          v18 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
                        }
                        while (v18);
                      }

                      objc_msgSend(v36, "setObject:forKeyedSubscript:", v17, v11);
                      objc_msgSend(v37, "unionSet:", v17);

                    }
                    else
                    {
                      v14 = 0;
                    }
                  }
                  else
                  {
                    objc_msgSend(v36, "objectForKeyedSubscript:", v11);
                    v14 = (id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v37, "unionSet:", v14);
                  }

                }
                v9 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
              }
              while (v9);
            }

            if (objc_msgSend(v27, "intersectsSet:", v37))
            {
              memset(&v38, 0, sizeof(v38));
              CMTimeRangeMakeFromDictionary(&v38, dictionaryRepresentation);
              range = v38;
              v22 = CMTimeRangeCopyAsDictionary(&range, 0);
              objc_msgSend(v29, "addObject:", v22);

            }
          }
          v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
        }
        while (v25);
      }

    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LOWORD(range.start.value) = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "sceneIdentifer type expected to be NSNumber", (uint8_t *)&range, 2u);
      }
      v29 = 0;
    }
  }
  else
  {
    v29 = (id)MEMORY[0x1E0C9AA60];
  }

  return v29;
}

- (id)getTimeRangesForActionIDs:(id)a3 withResults:(id)a4
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  float v20;
  float v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  float v26;
  _BOOL4 v27;
  CFDictionaryRef v28;
  id v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t i;
  id v36;
  id v37;
  CMTimeRange v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  CMTimeRange range;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v30 = a4;
  v34 = v5;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v36 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("HumanActionClassificationResults"));
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      if (v33)
      {
        v32 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v44 != v32)
              objc_enumerationMutation(obj);
            v8 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
            v39 = 0u;
            v40 = 0u;
            v41 = 0u;
            v42 = 0u;
            v37 = v34;
            v9 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
            if (v9)
            {
              v10 = *(_QWORD *)v40;
              do
              {
                for (j = 0; j != v9; ++j)
                {
                  if (*(_QWORD *)v40 != v10)
                    objc_enumerationMutation(v37);
                  v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
                  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("attributes"));
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("humanActions"));
                  v14 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v12, "stringValue");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "objectForKeyedSubscript:", v15);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  v17 = v16 == 0;

                  if (!v17)
                  {
                    objc_msgSend(v12, "stringValue");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v14, "objectForKeyedSubscript:", v18);
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v19, "floatValue");
                    v21 = v20;

                    objc_msgSend(v12, "stringValue");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    VCPHumanActionOperatingPointFromActionID(v22);
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v23)
                    {
                      objc_msgSend(v12, "stringValue");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      VCPHumanActionOperatingPointFromActionID(v24);
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v25, "floatValue");
                      v27 = v21 > v26;

                      if (v27)
                      {
                        memset(&v38, 0, sizeof(v38));
                        CMTimeRangeMakeFromDictionary(&v38, (CFDictionaryRef)v8);
                        range = v38;
                        v28 = CMTimeRangeCopyAsDictionary(&range, 0);
                        objc_msgSend(v36, "addObject:", v28);

                      }
                    }
                    else
                    {

                    }
                  }

                }
                v9 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
              }
              while (v9);
            }

          }
          v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
        }
        while (v33);
      }

    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LOWORD(range.start.value) = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "actionID type expected to be NSNumber", (uint8_t *)&range, 2u);
      }
      v36 = 0;
    }
  }
  else
  {
    v36 = (id)MEMORY[0x1E0C9AA60];
  }

  return v36;
}

- (id)getTimeRangesForSoundIdentifiers:(id)a3 withResults:(id)a4
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  int v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  const __CFDictionary *v22;
  CFDictionaryRef v23;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t i;
  id obj;
  id v31;
  void *v32;
  CMTimeRange v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  CMTimeRange range;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v27 = a4;
  v28 = v5;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend((id)objc_opt_class(), "mad_audioTaxonomy:useResultsKey:", 0, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      obj = v27;
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v43 != v26)
              objc_enumerationMutation(obj);
            v9 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
            objc_msgSend(v32, "allValues", v25);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "containsObject:", v9);

            if ((v11 & 1) != 0)
            {
              v40 = 0u;
              v41 = 0u;
              v38 = 0u;
              v39 = 0u;
              v31 = v28;
              v12 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
              if (v12)
              {
                v13 = *(_QWORD *)v39;
                do
                {
                  for (j = 0; j != v12; ++j)
                  {
                    if (*(_QWORD *)v39 != v13)
                      objc_enumerationMutation(v31);
                    objc_msgSend(v32, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j));
                    v15 = (void *)objc_claimAutoreleasedReturnValue();
                    v16 = objc_msgSend(v15, "isEqualToString:", v9);

                    if (v16)
                    {
                      objc_msgSend(obj, "objectForKeyedSubscript:", v9);
                      v17 = (void *)objc_claimAutoreleasedReturnValue();
                      v36 = 0u;
                      v37 = 0u;
                      v34 = 0u;
                      v35 = 0u;
                      v18 = v17;
                      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
                      if (v19)
                      {
                        v20 = *(_QWORD *)v35;
                        do
                        {
                          for (k = 0; k != v19; ++k)
                          {
                            if (*(_QWORD *)v35 != v20)
                              objc_enumerationMutation(v18);
                            v22 = *(const __CFDictionary **)(*((_QWORD *)&v34 + 1) + 8 * k);
                            memset(&v33, 0, sizeof(v33));
                            CMTimeRangeMakeFromDictionary(&v33, v22);
                            range = v33;
                            v23 = CMTimeRangeCopyAsDictionary(&range, 0);
                            objc_msgSend(v8, "addObject:", v23);

                          }
                          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
                        }
                        while (v19);
                      }

                    }
                  }
                  v12 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
                }
                while (v12);
              }

            }
          }
          v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
        }
        while (v25);
      }

    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LOWORD(range.start.value) = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "soundIdentifier type expected to be NSNumber", (uint8_t *)&range, 2u);
      }
      v8 = 0;
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (id)getTimeRangesInAsset:(id)a3 forPersonLocalIdentifiers:(id)a4 withAnalysis:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  VCPMediaAnalyzer *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  _QWORD v41[3];

  v26 = self;
  v41[1] = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v7 = a4;
  v28 = a5;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "librarySpecificFetchOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = v9;
    objc_msgSend(v9, "setIncludeTorsoOnlyDetectionData:", 1);
    v41[0] = *MEMORY[0x1E0CD1B58];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFetchPropertySets:", v10);

    objc_msgSend(v9, "setIncludeMediaAnalysisProcessingRangeTypes:", 3);
    objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesInAsset:options:", v29, v9);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v14, "personLocalIdentifier", v26);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15 == 0;

          if (!v16)
          {
            objc_msgSend(v14, "personLocalIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "personLocalIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "componentsSeparatedByString:", CFSTR("/"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v19, "count"))
            {
              objc_msgSend(v19, "firstObject");
              v20 = objc_claimAutoreleasedReturnValue();

              v17 = (void *)v20;
            }
            objc_msgSend(v14, "personLocalIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v7, "containsObject:", v21) & 1) != 0)
            {

              goto LABEL_13;
            }
            v22 = objc_msgSend(v7, "containsObject:", v17);

            if ((v22 & 1) != 0)
LABEL_13:
              objc_msgSend(v30, "addObject:", v14);

            continue;
          }
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v11);
    }

    if (!objc_msgSend(v30, "count")
      && (int)MediaAnalysisLogLevel() >= 6
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v29, "localIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v37 = v7;
      v38 = 2112;
      v39 = v23;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "MediaAnalyzer : no PHFaces found for persons %@ in asset %@", buf, 0x16u);

    }
    -[VCPMediaAnalyzer getTimeRangesInAsset:forFaces:withAnalysis:](v26, "getTimeRangesInAsset:forFaces:withAnalysis:", v29, v30, v28, v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v24;
}

- (id)getTimeRangesInAsset:(id)a3 forFaces:(id)a4 withAnalysis:(id)a5
{
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  float v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  float v27;
  float v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  int v44;
  CFDictionaryRef v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t m;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  CFDictionaryRef v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v61;
  uint64_t v62;
  id obj;
  id v64;
  void *v65;
  id v66;
  id v67;
  int v68;
  uint64_t i;
  int v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  CMTimeRange v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  id v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  CMTimeRange buf;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v64 = a3;
  v66 = a4;
  v67 = a5;
  v7 = objc_msgSend(v66, "count");
  v8 = (id)MEMORY[0x1E0C9AA60];
  if (v67 && v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    obj = v66;
    v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v98, 16);
    if (v61)
    {
      v68 = 0;
      v62 = *(_QWORD *)v92;
      do
      {
        for (i = 0; i != v61; ++i)
        {
          if (*(_QWORD *)v92 != v62)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
          if (objc_msgSend(v9, "detectionType") == 1)
          {
            objc_msgSend(v9, "fetchPropertySetsIfNeeded");
            objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("metadataRanges"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("FacePrintResults"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            v89 = 0u;
            v90 = 0u;
            v87 = 0u;
            v88 = 0u;
            v71 = v11;
            v12 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
            if (v12)
            {
              v73 = *(_QWORD *)v88;
              v70 = -1;
              v13 = 1.0;
              while (2)
              {
                v72 = v12;
                for (j = 0; j != v72; ++j)
                {
                  if (*(_QWORD *)v88 != v73)
                    objc_enumerationMutation(v71);
                  v15 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * j);
                  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("attributes"));
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("facePrint"));
                  v75 = (void *)objc_claimAutoreleasedReturnValue();

                  v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v75, 0);
                  objc_msgSend(v74, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("facePrint"));
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v9, "faceClusteringProperties");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "faceprint");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "faceprintData");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v20)
                  {
                    v21 = objc_alloc(MEMORY[0x1E0CEDEE8]);
                    v86 = 0;
                    v22 = (void *)objc_msgSend(v21, "initWithState:error:", v20, &v86);
                    v23 = v86;
                    if (!v22)
                    {
                      if ((int)MediaAnalysisLogLevel() >= 3
                        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                      {
                        objc_msgSend(v9, "localIdentifier");
                        v57 = (void *)objc_claimAutoreleasedReturnValue();
                        LODWORD(buf.start.value) = 138412546;
                        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v57;
                        LOWORD(buf.start.flags) = 2112;
                        *(_QWORD *)((char *)&buf.start.flags + 2) = v23;
                        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "MediaAnalyzer : failed to initalize faceprint data for face: %@. Error: %@", (uint8_t *)&buf, 0x16u);

                      }
                      v58 = 0;
                      v59 = v65;
                      goto LABEL_70;
                    }
                    objc_msgSend(v22, "faceprint");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    v85 = v23;
                    objc_msgSend(v24, "computeDistance:withDistanceFunction:error:", v17, 0, &v85);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    v26 = v85;

                    if (v25)
                    {
                      objc_msgSend(v25, "floatValue");
                      v28 = v27;
                      if (v27 < v13)
                      {
                        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("attributes"));
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("faceId"));
                        v30 = (void *)objc_claimAutoreleasedReturnValue();
                        v70 = objc_msgSend(v30, "intValue");

                        v13 = v28;
                      }
                    }
                    else
                    {
                      if ((int)MediaAnalysisLogLevel() >= 3
                        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                      {
                        objc_msgSend(v9, "localIdentifier");
                        v32 = (void *)objc_claimAutoreleasedReturnValue();
                        LODWORD(buf.start.value) = 138412546;
                        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v32;
                        LOWORD(buf.start.flags) = 2112;
                        *(_QWORD *)((char *)&buf.start.flags + 2) = v26;
                        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "MediaAnalyzer : failed to compute distance for face: %@. Error: %@", (uint8_t *)&buf, 0x16u);

                      }
                      v68 = -18;
                    }

                    if (!v25)
                    {

                      goto LABEL_67;
                    }
                  }
                  else
                  {
                    if ((int)MediaAnalysisLogLevel() >= 4
                      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(v9, "localIdentifier");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      LODWORD(buf.start.value) = 138412290;
                      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v31;
                      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "MediaAnalyzer : Failed to get faceClusteringProperties.faceprint.faceprintData for face %@", (uint8_t *)&buf, 0xCu);

                    }
                  }
                }
                v12 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
                if (v12)
                  continue;
                break;
              }

              if (v13 < 0.1)
              {
                v83 = 0u;
                v84 = 0u;
                v81 = 0u;
                v82 = 0u;
                objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("metadataRanges"));
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("FaceResults"));
                v34 = (void *)objc_claimAutoreleasedReturnValue();

                v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
                if (v35)
                {
                  v36 = *(_QWORD *)v82;
                  do
                  {
                    for (k = 0; k != v35; ++k)
                    {
                      if (*(_QWORD *)v82 != v36)
                        objc_enumerationMutation(v34);
                      v38 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * k);
                      objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("attributes"));
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("faceId"));
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      v41 = v40 == 0;

                      if (v41)
                      {
                        if ((int)MediaAnalysisLogLevel() >= 5
                          && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                        {
                          objc_msgSend(v64, "localIdentifier");
                          v46 = (void *)objc_claimAutoreleasedReturnValue();
                          LODWORD(buf.start.value) = 138412290;
                          *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v46;
                          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "MediaAnalyzer getTimeRangesInAsset : video faceID not available for asset %@", (uint8_t *)&buf, 0xCu);

                        }
                      }
                      else
                      {
                        objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("attributes"));
                        v42 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("faceId"));
                        v43 = (void *)objc_claimAutoreleasedReturnValue();
                        v44 = objc_msgSend(v43, "intValue");

                        if (v44 == v70)
                        {
                          memset(&v80, 0, sizeof(v80));
                          CMTimeRangeMakeFromDictionary(&v80, (CFDictionaryRef)v38);
                          buf = v80;
                          v45 = CMTimeRangeCopyAsDictionary(&buf, 0);
                          objc_msgSend(v65, "addObject:", v45);

                        }
                      }
                    }
                    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
                  }
                  while (v35);
                }

                if (objc_msgSend((id)objc_opt_class(), "includeTorsoOnlyForOneUP"))
                {
                  v78 = 0u;
                  v79 = 0u;
                  v76 = 0u;
                  v77 = 0u;
                  objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("metadataRanges"));
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("TorsoResults"));
                  v48 = (void *)objc_claimAutoreleasedReturnValue();

                  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v76, v95, 16);
                  if (v49)
                  {
                    v50 = *(_QWORD *)v77;
                    do
                    {
                      for (m = 0; m != v49; ++m)
                      {
                        if (*(_QWORD *)v77 != v50)
                          objc_enumerationMutation(v48);
                        v52 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * m);
                        objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("attributes"));
                        v53 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("faceId"));
                        v54 = (void *)objc_claimAutoreleasedReturnValue();
                        v55 = objc_msgSend(v54, "intValue");

                        if (v55 == v70)
                        {
                          memset(&v80, 0, sizeof(v80));
                          CMTimeRangeMakeFromDictionary(&v80, (CFDictionaryRef)v52);
                          buf = v80;
                          v56 = CMTimeRangeCopyAsDictionary(&buf, 0);
                          objc_msgSend(v65, "addObject:", v56);

                        }
                      }
                      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v76, v95, 16);
                    }
                    while (v49);
                  }
                  goto LABEL_56;
                }
              }
            }
            else
            {
              v48 = v71;
LABEL_56:

            }
          }
        }
        v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v98, 16);
      }
      while (v61);
    }
    else
    {
      v68 = 0;
    }
LABEL_67:

    v59 = v65;
    if (v68)
      v58 = 0;
    else
      v58 = v65;
LABEL_70:
    v8 = v58;

  }
  return v8;
}

- (id)getTimeRangesWithSearchResults:(id)a3
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  const __CFDictionary *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  float v15;
  uint64_t i;
  double v17;
  unint64_t v20;
  float v21;
  const __CFDictionary *v22;
  double v23;
  float v24;
  CFDictionaryRef v26;
  CFDictionaryRef v27;
  double v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  CMTime v33;
  CMTime v34;
  CMTimeRange v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  CMTimeRange range;
  CMTime v41;
  CMTime v42;
  CMTime rhs;
  CMTime lhs;
  _QWORD v45[3];
  _QWORD v46[3];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  +[VCPFreeFormSearch getMinSimilarityDiffFor1UP](VCPFreeFormSearch, "getMinSimilarityDiffFor1UP");
  v4 = v3;
  +[VCPFreeFormSearch getMinSimilarityOneToken](VCPFreeFormSearch, "getMinSimilarityOneToken");
  v6 = v5;
  +[VCPFreeFormSearch getMinSimilarity](VCPFreeFormSearch, "getMinSimilarity");
  v8 = v7;
  +[VCPFreeFormSearch getHighSimilarityThreshold](VCPFreeFormSearch, "getHighSimilarityThreshold");
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  memset(&v41, 0, sizeof(v41));
  if (objc_msgSend(v31, "count"))
  {
    objc_msgSend(v31, "lastObject");
    v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeRangeMakeFromDictionary(&range, v11);
    CMTimeRangeGetEnd(&v41, &range);

  }
  else
  {
    v41 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v12 = v31;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v37;
    v15 = 0.0;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v37 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "vcp_quality");
        *(float *)&v17 = v17;
        v15 = fmaxf(*(float *)&v17, v15);
        if (v15 > v6 && v15 < v8)
          v8 = v15 - v4;
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
    }
    while (v13);
  }
  else
  {
    v15 = 0.0;
  }

  if (v15 >= v8)
  {
    v20 = 0;
    v21 = fmaxf(v8, v15 - v4);
    while (1)
    {
      if (objc_msgSend(v12, "count") <= v20)
        goto LABEL_19;
      objc_msgSend(v12, "objectAtIndexedSubscript:", v20);
      v22 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      memset(&v35, 0, sizeof(v35));
      CMTimeRangeMakeFromDictionary(&v35, v22);
      -[__CFDictionary vcp_quality](v22, "vcp_quality");
      v24 = v23;
      if (v21 <= v24 || v10 < v24)
        break;
LABEL_32:

      ++v20;
    }
    memset(&v34, 0, sizeof(v34));
    lhs = v35.start;
    rhs = v35.duration;
    CMTimeAdd(&v34, &lhs, &rhs);
    if (objc_msgSend(v12, "count") - 1 > v20
      && (CMTimeMake(&v33, 1, 1),
          lhs = v41,
          rhs = v33,
          CMTimeSubtract(&v42, &lhs, &rhs),
          lhs = v34,
          rhs = v42,
          CMTimeCompare(&lhs, &rhs) < 0))
    {
      CMTimeMake(&v33, 1, 1);
      rhs = v34;
      v42 = v33;
      CMTimeAdd(&lhs, &rhs, &v42);
      v34 = lhs;
      if (!v20)
        goto LABEL_31;
    }
    else if (!v20)
    {
LABEL_31:
      lhs = v34;
      rhs = v35.start;
      CMTimeSubtract(&v42, &lhs, &rhs);
      v35.duration = v42;
      lhs = v35.start;
      v45[0] = CFSTR("start");
      v26 = CMTimeCopyAsDictionary(&lhs, 0);
      v46[0] = v26;
      v45[1] = CFSTR("duration");
      lhs = v35.duration;
      v27 = CMTimeCopyAsDictionary(&lhs, 0);
      v46[1] = v27;
      v45[2] = CFSTR("quality");
      *(float *)&v28 = v24;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v46[2] = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObject:", v30);

      goto LABEL_32;
    }
    CMTimeMake(&v33, 1, 1);
    rhs = v35.start;
    v42 = v33;
    CMTimeSubtract(&lhs, &rhs, &v42);
    v35.start = lhs;
    goto LABEL_31;
  }
LABEL_19:

  return v32;
}

- (id)getAnalysisResultsForURLAsset:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)searchForQuery:(id)a3 forAssets:(id)a4 withOptions:(id)a5 matchingScoreOnly:(BOOL)a6 isURLAsset:(BOOL)a7 analyses:(id)a8
{
  _BOOL4 v9;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  os_log_type_t v20;
  uint32_t v21;
  void *v22;
  VCPTextEncoder *textEncoder;
  VCPTextEncoder *v24;
  VCPTextEncoder *v25;
  VCPFreeFormSearch *v26;
  VCPFreeFormSearch *freeFormSearch;
  void *v28;
  unint64_t i;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  BOOL v50;
  NSObject *searchQueue;
  id v52;
  BOOL v54;
  void *v55;
  id v57;
  id v58;
  id v59;
  _QWORD block[5];
  id v61;
  id v62;
  _BYTE *v63;
  int v64;
  BOOL v65;
  _BYTE buf[24];
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t v70;

  v9 = a7;
  v70 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v59 = a4;
  v57 = a5;
  v14 = a8;
  v58 = v13;
  v15 = objc_msgSend(v14, "count");
  if (v15 != objc_msgSend(v59, "count"))
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_45;
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = objc_msgSend(v14, "count");
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v59, "count");
    v18 = MEMORY[0x1E0C81028];
    v19 = "Analyses vs assets acount mismatch: %lu vs %lu";
    v20 = OS_LOG_TYPE_ERROR;
    v21 = 22;
    goto LABEL_8;
  }
  if (!v58 || !objc_msgSend(v58, "length"))
  {
    objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("SearchQueryString"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
      goto LABEL_45;
    textEncoder = self->_textEncoder;
    if (textEncoder
      || (v24 = objc_alloc_init(VCPTextEncoder),
          v25 = self->_textEncoder,
          self->_textEncoder = v24,
          v25,
          (textEncoder = self->_textEncoder) != 0))
    {
      objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("SearchQueryString"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPTextEncoder textEmbeddingForQuery:useFP16:](textEncoder, "textEmbeddingForQuery:useFP16:", v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    }
    if ((int)MediaAnalysisLogLevel() < 4 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
LABEL_45:
      v52 = 0;
      v17 = v58;
      goto LABEL_46;
    }
    *(_WORD *)buf = 0;
    v18 = MEMORY[0x1E0C81028];
    v19 = "Failed to create text encoder";
    v20 = OS_LOG_TYPE_DEFAULT;
    v21 = 2;
LABEL_8:
    _os_log_impl(&dword_1B6C4A000, v18, v20, v19, buf, v21);
    goto LABEL_45;
  }
  +[VCPTextEncoder convertFloat16ToFloat32:](VCPTextEncoder, "convertFloat16ToFloat32:", v58);
  v16 = v58;
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  if (self->_freeFormSearch
    || (v26 = objc_alloc_init(VCPFreeFormSearch),
        freeFormSearch = self->_freeFormSearch,
        self->_freeFormSearch = v26,
        freeFormSearch,
        self->_freeFormSearch))
  {
    v54 = a6;
    v55 = v17;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; ; ++i)
    {
      if (objc_msgSend(v14, "count") <= i)
      {
        objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("MaxSearchResults"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (v46)
        {
          objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("MaxSearchResults"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "intValue");

        }
        else
        {
          v48 = -1;
        }

        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v67 = __Block_byref_object_copy__40;
        v68 = __Block_byref_object_dispose__40;
        v69 = 0;
        objc_msgSend(v28, "allKeys");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "count") == 0;

        if (!v50)
        {
          searchQueue = self->_searchQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __95__VCPMediaAnalyzer_searchForQuery_forAssets_withOptions_matchingScoreOnly_isURLAsset_analyses___block_invoke;
          block[3] = &unk_1E6B1A320;
          block[4] = self;
          v61 = v28;
          v63 = buf;
          v62 = v55;
          v65 = v54;
          v64 = v48;
          dispatch_sync(searchQueue, block);

        }
        v52 = *(id *)(*(_QWORD *)&buf[8] + 40);
        _Block_object_dispose(buf, 8);

        v17 = v55;
        goto LABEL_46;
      }
      if (v9)
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", i);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", i);
        v31 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v31, "vcp_results");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "objectAtIndexedSubscript:", i);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v31) = (int)objc_msgSend(v32, "vcp_version") < 64;

        if ((v31 & 1) != 0)
          goto LABEL_31;
      }
      if (+[VCPMovieAnalyzer enableAudioVideoFusion](VCPMovieAnalyzer, "enableAudioVideoFusion")
        && +[MADEmbeddingStore includeAudioFusedVideoEmbeddings](MADEmbeddingStore, "includeAudioFusedVideoEmbeddings")&& (objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("AudioFusedVideoEmbeddingResults")), v33 = (void *)objc_claimAutoreleasedReturnValue(), v34 = v33 == 0, v33, !v34))
      {
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("AudioFusedVideoEmbeddingResults"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "objectAtIndexedSubscript:", i);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v35, v36);

      }
      else
      {
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("VideoEmbeddingResults"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v37 == 0;

        if (v38)
        {
          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("ImageEmbeddingResults"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v41 == 0;

          if (v42)
          {
            if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v59, "objectAtIndexedSubscript:", i);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v45;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "searchForQuery : missing embedding results for asset %@", buf, 0xCu);

            }
          }
          else
          {
            objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("ImageEmbeddingResults"));
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "objectAtIndexedSubscript:", i);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v43, v44);

          }
        }
        else
        {
          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("VideoEmbeddingResults"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "objectAtIndexedSubscript:", i);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setObject:forKeyedSubscript:", v39, v40);

        }
      }
LABEL_31:

    }
  }
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to initialize search", buf, 2u);
  }
  v52 = 0;
LABEL_46:

  return v52;
}

void __95__VCPMediaAnalyzer_searchForQuery_forAssets_withOptions_matchingScoreOnly_isURLAsset_analyses___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "loadEmbeddings:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "searchForQuery:matchingScoreOnly:topK:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 68), *(unsigned int *)(a1 + 64));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (id)loadAssetsFromPhotoLibrary:(id)a3 withAssetIdentifiers:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v22 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CD16F0], "vcp_defaultPhotoLibrary");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v7;
  if (v7)
    goto LABEL_6;
  -[VCPMediaAnalyzer _databaseForPhotoLibrary:](self, "_databaseForPhotoLibrary:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "queryAssetsAnalyzedSince:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
    objc_msgSend(MEMORY[0x1E0CD1398], "vcp_fetchOptionsForLibrary:forTaskID:", v8, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1398], "fetchAssetsWithLocalIdentifiers:options:", v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v15 = v13;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v24 != v17)
              objc_enumerationMutation(v15);
            objc_msgSend(v14, "addObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v16);
      }

    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] No available assets for search", buf, 2u);
      }
      v14 = 0;
    }

    goto LABEL_20;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v8, "photoLibraryURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v29 = v21;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] Failed to obtain database for Photo Library (%@)", buf, 0xCu);

  }
  v14 = 0;
LABEL_20:

  return v14;
}

- (id)requestSearchResultsForAssets:(id)a3 forPhotoLibraryURL:(id)a4 withQueryEmbeddings:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[VCPMediaAnalyzer requestSearchResultsForAssets:forPhotoLibraryURL:withQueryEmbeddings:matchingScoreOnly:options:](self, "requestSearchResultsForAssets:forPhotoLibraryURL:withQueryEmbeddings:matchingScoreOnly:options:", v10, v11, v12, objc_msgSend(v10, "count") == 1, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)requestSearchResultsForAssets:(id)a3 forPhotoLibraryURL:(id)a4 withQueryEmbeddings:(id)a5 matchingScoreOnly:(BOOL)a6 options:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[16];
  const __CFString *v48;
  uint64_t v49;
  _BYTE v50[128];
  uint64_t v51;

  v8 = a6;
  v51 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v40 = a4;
  v13 = a5;
  v42 = a7;
  v38 = v12;
  v39 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count")
    || (objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("SearchQueryString")),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        v14))
  {
    if (objc_msgSend(v12, "count"))
    {
      v35 = objc_msgSend(v12, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0C99DE8], "array", v35);
    }
    else
    {
      if (v40)
      {
        v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD16F0]), "initWithPhotoLibraryURL:", v40);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CD16F0], "vcp_defaultPhotoLibrary");
        v15 = objc_claimAutoreleasedReturnValue();
      }
      v17 = (void *)v15;
      -[VCPMediaAnalyzer loadAssetsFromPhotoLibrary:withAssetIdentifiers:](self, "loadAssetsFromPhotoLibrary:withAssetIdentifiers:", v15, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v18, "mutableCopy");

      objc_msgSend(MEMORY[0x1E0C99DE8], "array", v37);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v8;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v22 = v36;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v44 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v26, "localIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27 == 0;

          if (!v28)
          {
            objc_msgSend(v26, "localIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v29);

          }
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
      }
      while (v23);
    }

    v48 = CFSTR("AllowOnDemand");
    v49 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[VCPMediaAnalyzer requestAnalysisTypes:forAssets:withOptions:andProgressHandler:cancelBlock:analyses:](self, "requestAnalysisTypes:forAssets:withOptions:andProgressHandler:cancelBlock:analyses:", 0x1080000000000, v22, v30, 0, &__block_literal_global_624, v19);

    if (v31)
    {
      v32 = 0;
    }
    else
    {
      objc_msgSend(v39, "firstObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPMediaAnalyzer searchForQuery:forAssets:withOptions:matchingScoreOnly:isURLAsset:analyses:](self, "searchForQuery:forAssets:withOptions:matchingScoreOnly:isURLAsset:analyses:", v33, v21, v42, v20, 0, v19);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = v32;
    }
    v16 = v32;

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[FreeFromSearch] No query input for search", buf, 2u);
    }
    v16 = 0;
  }

  return v16;
}

uint64_t __115__VCPMediaAnalyzer_requestSearchResultsForAssets_forPhotoLibraryURL_withQueryEmbeddings_matchingScoreOnly_options___block_invoke()
{
  return 0;
}

- (id)findTimeRangesFor:(id)a3 inAsset:(id)a4 withOptions:(id)a5 results:(id)a6 andError:(id *)a7
{
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t i;
  int v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  __int128 v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  objc_class *v60;
  id v61;
  objc_class *v62;
  id v63;
  objc_class *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  BOOL v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  __int128 v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  id v87;
  uint64_t j;
  uint64_t v89;
  uint64_t v91;
  uint64_t k;
  id obj;
  id v94;
  id v95;
  id v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  void *v113;
  void *v114;
  uint8_t v115[128];
  uint8_t buf[4];
  uint64_t v117;
  __int16 v118;
  id v119;
  __int16 v120;
  id v121;
  __int16 v122;
  void *v123;
  void *v124;
  _BYTE v125[128];
  _BYTE v126[128];
  id v127;
  _BYTE v128[128];
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v96 = a4;
  v94 = a5;
  v95 = a6;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v128, 16);
  v13 = 0;
  if (v12)
  {
    v14 = *(_QWORD *)v110;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v110 != v14)
          objc_enumerationMutation(obj);
        v16 = objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * i), "intValue");
        v17 = v16;
        switch(v16)
        {
          case 1:
            v13 |= 8uLL;
            break;
          case 2:
            v13 |= 0x4000uLL;
            break;
          case 3:
            v13 |= 0x40000000uLL;
            break;
          case 4:
            v13 |= 0x200010uLL;
            break;
          case 5:
            v13 |= 0x1080000000000uLL;
            break;
          default:
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              v18 = MEMORY[0x1E0C81028];
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                v117 = v17;
                _os_log_impl(&dword_1B6C4A000, v18, OS_LOG_TYPE_DEFAULT, "Unknown query type %ld", buf, 0xCu);
              }
            }
            break;
        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v128, 16);
    }
    while (v12);
  }

  objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("SearchQueryString"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v20)
    v21 = (void *)v13;
  else
    v21 = (void *)(v13 | 0x1080000000000);
  if (v21)
  {
    if (objc_msgSend(v95, "count"))
      goto LABEL_22;
    +[VCPMediaAnalyzer sharedMediaAnalyzer](VCPMediaAnalyzer, "sharedMediaAnalyzer");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = v96;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v127, 1);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "requestAnalysis:forAssets:withOptions:andProgressHandler:andError:", v21, v78, 0, 0, a7);
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    v95 = v79;
    if (*a7)
      goto LABEL_85;
    if (objc_msgSend(v79, "count"))
    {
LABEL_22:
      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      v86 = obj;
      v85 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v105, v126, 16);
      if (v85)
      {
        v84 = *(_QWORD *)v106;
        *(_QWORD *)&v22 = 134218754;
        v82 = v22;
        do
        {
          for (j = 0; j != v85; ++j)
          {
            if (*(_QWORD *)v106 != v84)
              objc_enumerationMutation(v86);
            v23 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * j);
            v24 = objc_msgSend(v23, "intValue", v82);
            v25 = v24;
            switch(v24)
            {
              case 1:
                objc_msgSend(v86, "objectForKeyedSubscript:", v23);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v95, "firstObject");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[VCPMediaAnalyzer getTimeRangesInAsset:forPersonLocalIdentifiers:withAnalysis:](self, "getTimeRangesInAsset:forPersonLocalIdentifiers:withAnalysis:", v96, v26, v27);
                v28 = (void *)objc_claimAutoreleasedReturnValue();

                if (v28)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "stringValue");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v83, "setObject:forKeyedSubscript:", v28, v30);

                }
                goto LABEL_63;
              case 2:
                objc_msgSend(v86, "objectForKeyedSubscript:", v23);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v95, "firstObject");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("metadataRanges"));
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                -[VCPMediaAnalyzer getTimeRangesForSceneIdentifiers:withResults:](self, "getTimeRangesForSceneIdentifiers:withResults:", v45, v47);
                v28 = (void *)objc_claimAutoreleasedReturnValue();

                if (v28)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "stringValue");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v83, "setObject:forKeyedSubscript:", v28, v49);

                }
                goto LABEL_63;
              case 3:
                objc_msgSend(v86, "objectForKeyedSubscript:", v23);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v95, "firstObject");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("metadataRanges"));
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                -[VCPMediaAnalyzer getTimeRangesForActionIDs:withResults:](self, "getTimeRangesForActionIDs:withResults:", v50, v52);
                v28 = (void *)objc_claimAutoreleasedReturnValue();

                if (v28)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 3);
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "stringValue");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v83, "setObject:forKeyedSubscript:", v28, v54);

                }
                goto LABEL_63;
              case 4:
                objc_msgSend(v86, "objectForKeyedSubscript:", v23);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v95, "firstObject");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("metadataRanges"));
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                -[VCPMediaAnalyzer getTimeRangesForSoundIdentifiers:withResults:](self, "getTimeRangesForSoundIdentifiers:withResults:", v55, v57);
                v28 = (void *)objc_claimAutoreleasedReturnValue();

                if (v28)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 4);
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v58, "stringValue");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v83, "setObject:forKeyedSubscript:", v28, v59);

                }
LABEL_63:

                continue;
              case 5:
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v103 = 0u;
                v104 = 0u;
                v101 = 0u;
                v102 = 0u;
                objc_msgSend(v86, "objectForKeyedSubscript:", v23);
                v87 = (id)objc_claimAutoreleasedReturnValue();
                v91 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v101, v125, 16);
                if (!v91)
                  goto LABEL_67;
                v89 = *(_QWORD *)v102;
                break;
              default:
                if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134217984;
                  v117 = v25;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unknown query type %ld", buf, 0xCu);
                }
                continue;
            }
            while (2)
            {
              for (k = 0; k != v91; ++k)
              {
                if (*(_QWORD *)v102 != v89)
                  objc_enumerationMutation(v87);
                v32 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * k);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v32, "vectors");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if ((int)MediaAnalysisLogLevel() >= 4
                      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                    {
                      v60 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v60);
                      v61 = (id)objc_claimAutoreleasedReturnValue();
                      v62 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v62);
                      v63 = (id)objc_claimAutoreleasedReturnValue();
                      v64 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v64);
                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = v82;
                      v117 = 5;
                      v118 = 2112;
                      v119 = v61;
                      v120 = 2112;
                      v121 = v63;
                      v122 = 2112;
                      v123 = v65;
                      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Mismatch data type for query %ld, skip. Expect %@ or %@. Got %@", buf, 0x2Au);

                    }
                    goto LABEL_67;
                  }
                  v124 = v32;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v124, 1);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                }
                v99 = 0u;
                v100 = 0u;
                v97 = 0u;
                v98 = 0u;
                v34 = v33;
                v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v97, v115, 16);
                if (v35)
                {
                  v36 = *(_QWORD *)v98;
                  do
                  {
                    for (m = 0; m != v35; ++m)
                    {
                      if (*(_QWORD *)v98 != v36)
                        objc_enumerationMutation(v34);
                      v38 = *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * m);
                      objc_msgSend(v96, "localIdentifier");
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      v114 = v39;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v114, 1);
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      -[VCPMediaAnalyzer searchForQuery:forAssets:withOptions:matchingScoreOnly:isURLAsset:analyses:](self, "searchForQuery:forAssets:withOptions:matchingScoreOnly:isURLAsset:analyses:", v38, v40, v94, 1, 0, v95);
                      v41 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v96, "localIdentifier");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v41, "objectForKeyedSubscript:", v42);
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      -[VCPMediaAnalyzer getTimeRangesWithSearchResults:](self, "getTimeRangesWithSearchResults:", v43);
                      v44 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v44)
                        objc_msgSend(v31, "addObjectsFromArray:", v44);

                    }
                    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v97, v115, 16);
                  }
                  while (v35);
                }

              }
              v91 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v101, v125, 16);
              if (v91)
                continue;
              break;
            }
LABEL_67:

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 5);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "stringValue");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "setObject:forKeyedSubscript:", v31, v67);

          }
          v85 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v105, v126, 16);
        }
        while (v85);
      }

      objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("SearchQueryString"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v68 == 0;

      if (!v69)
      {
        objc_msgSend(v96, "localIdentifier");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = v70;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v113, 1);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCPMediaAnalyzer searchForQuery:forAssets:withOptions:matchingScoreOnly:isURLAsset:analyses:](self, "searchForQuery:forAssets:withOptions:matchingScoreOnly:isURLAsset:analyses:", 0, v71, v94, 1, 0, v95);
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v96, "localIdentifier");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "objectForKeyedSubscript:", v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCPMediaAnalyzer getTimeRangesWithSearchResults:](self, "getTimeRangesWithSearchResults:", v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        if (v75)
        {
          objc_msgSend(&unk_1E6B749C0, "stringValue");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "setObject:forKeyedSubscript:", v75, v76);

        }
      }
      -[VCPMediaAnalyzer postProcessTimeRanges:options:](self, "postProcessTimeRanges:options:", v83, v94);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_85:
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v96, "localIdentifier");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v117 = (uint64_t)v80;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "MediaAnalyzer failed to get results for asset %@", buf, 0xCu);

      }
      v21 = 0;
    }
  }

  return v21;
}

- (int)findTimeRangesFor:(id)a3 inAsset:(id)a4 withOptions:(id)a5 andProgressHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, double);
  id v16;
  atomic<int> *p_nextRequestID;
  int v18;
  NSObject *v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  void (**v25)(_QWORD, double);
  id v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(_QWORD, double))a6;
  v16 = a7;
  if (v12 && v13 && (objc_msgSend(v13, "isVideo") & 1) != 0)
  {
    p_nextRequestID = &self->_nextRequestID;
    do
      v18 = __ldaxr((unsigned int *)p_nextRequestID);
    while (__stlxr(v18 + 1, (unsigned int *)p_nextRequestID));
    if (v15)
      v15[2](v15, 0.0);
    dispatch_get_global_queue(0, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __98__VCPMediaAnalyzer_findTimeRangesFor_inAsset_withOptions_andProgressHandler_andCompletionHandler___block_invoke;
    v21[3] = &unk_1E6B1A368;
    v21[4] = self;
    v22 = v12;
    v23 = v13;
    v24 = v14;
    v25 = v15;
    v26 = v16;
    dispatch_async(v19, v21);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v16 + 2))(v16, 0, 0);
    v18 = -1;
  }

  return v18;
}

void __98__VCPMediaAnalyzer_findTimeRangesFor_inAsset_withOptions_andProgressHandler_andCompletionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t j;
  void *v24;
  NSObject *v25;
  Float64 Seconds;
  Float64 v27;
  void *v28;
  _QWORD *v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  CMTime v33;
  CMTime time;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  CMTimeRange v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  uint8_t buf[16];
  __int128 v46;
  __int128 v47;
  uint8_t v48[4];
  Float64 v49;
  __int16 v50;
  Float64 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v29 = a1;
  v5 = a1[7];
  v44 = 0;
  objc_msgSend(v2, "findTimeRangesFor:inAsset:withOptions:results:andError:", v3, v4, v5, 0, &v44);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v44;
  v6 = v29;
  if (!objc_msgSend(v30, "count")
    && (int)MediaAnalysisLogLevel() >= 6
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend((id)v29[6], "localIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "No matching timeranges found for asset %@", buf, 0xCu);

    v6 = v29;
  }
  v8 = v6[8];
  if (v8)
    (*(void (**)(double))(v8 + 16))(100.0);
  if (v31 || !objc_msgSend(v30, "count"))
  {
    (*(void (**)(void))(v6[9] + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v10 = v30;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v41 != v12)
            objc_enumerationMutation(v10);
          v14 = (void *)MEMORY[0x1E0CB3B18];
          CMTimeRangeMakeFromDictionary(&v39, *(CFDictionaryRef *)(*((_QWORD *)&v40 + 1) + 8 * i));
          objc_msgSend(v14, "valueWithCMTimeRange:", &v39);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
      }
      while (v11);
    }

    v16 = (void *)v29[4];
    objc_msgSend((id)v29[7], "objectForKeyedSubscript:", CFSTR("MinTimeRangeGap"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "mergeTimeRanges:mergeGap:", v9, v17);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend((id)v29[6], "localIdentifier", v28);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v18;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "MediaAnalysis findTimeRanges for asset %@", buf, 0xCu);

    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v19 = v28;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v36;
      v22 = MEMORY[0x1E0C81028];
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v36 != v21)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            v25 = v22;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              if (v24)
              {
                objc_msgSend(v24, "CMTimeRangeValue");
              }
              else
              {
                v46 = 0u;
                v47 = 0u;
                *(_OWORD *)buf = 0u;
              }
              *(_OWORD *)&time.value = *(_OWORD *)buf;
              time.epoch = v46;
              Seconds = CMTimeGetSeconds(&time);
              if (v24)
                objc_msgSend(v24, "CMTimeRangeValue");
              else
                memset(v32, 0, sizeof(v32));
              v33 = *(CMTime *)&v32[1];
              v27 = CMTimeGetSeconds(&v33);
              *(_DWORD *)v48 = 134218240;
              v49 = Seconds;
              v50 = 2048;
              v51 = v27;
              _os_log_impl(&dword_1B6C4A000, v22, OS_LOG_TYPE_INFO, "[%f, %f]", v48, 0x16u);
            }

          }
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
      }
      while (v20);
    }

    (*(void (**)(void))(v29[9] + 16))();
  }

}

- (int)findTimeRangesFor:(id)a3 inURLAsset:(id)a4 withOptions:(id)a5 andProgressHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  int v20;
  uint64_t v21;
  NSObject *v22;
  dispatch_semaphore_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  unsigned int *p_nextRequestID;
  int v28;
  VCPCancelToken *v29;
  void *v30;
  NSObject *cancelQueue;
  NSObject *v32;
  NSObject *v33;
  id v34;
  id v35;
  VCPMediaAnalyzer *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void (**v42)(double);
  VCPCancelToken *v43;
  _QWORD v44[5];
  id v45;
  id v46;
  NSObject *v47;
  id v48;
  id v49;
  id v50;
  void (**v51)(double);
  id v52;
  _BYTE *v53;
  _QWORD *v54;
  uint64_t v55;
  int v56;
  _QWORD block[5];
  VCPCancelToken *v58;
  int v59;
  _QWORD v60[4];
  VCPCancelToken *v61;
  _QWORD aBlock[4];
  NSObject *v63;
  _BYTE *v64;
  _QWORD v65[5];
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE buf[24];
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v41 = a5;
  v42 = (void (**)(double))a6;
  v14 = a7;
  v39 = v12;
  v40 = v13;
  if (v12 && v13)
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Received timeRange request for asset: %@ with query: %@", buf, 0x16u);
    }
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v15 = v12;
    v38 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
    v37 = self;
    v17 = 0;
    if (v16)
    {
      v18 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v68 != v18)
            objc_enumerationMutation(v15);
          v20 = objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i), "intValue", v37);
          v21 = v20;
          switch(v20)
          {
            case 1:
              v17 |= 8uLL;
              break;
            case 2:
              v17 |= 0x4000uLL;
              break;
            case 3:
              v17 |= 0x40000000uLL;
              break;
            case 4:
              v17 |= 0x200010uLL;
              break;
            case 5:
              v17 |= 0x1080000000000uLL;
              break;
            default:
              if ((int)MediaAnalysisLogLevel() >= 4)
              {
                v22 = MEMORY[0x1E0C81028];
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134217984;
                  *(_QWORD *)&buf[4] = v21;
                  _os_log_impl(&dword_1B6C4A000, v22, OS_LOG_TYPE_DEFAULT, "Unknown query type %ld", buf, 0xCu);
                }
              }
              break;
          }
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
      }
      while (v16);
    }

    if (v42)
      v42[2](0.0);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v72 = __Block_byref_object_copy__40;
    v73 = __Block_byref_object_dispose__40;
    v74 = 0;
    v65[0] = 0;
    v65[1] = v65;
    v65[2] = 0x3032000000;
    v65[3] = __Block_byref_object_copy__40;
    v65[4] = __Block_byref_object_dispose__40;
    v66 = 0;
    v23 = dispatch_semaphore_create(0);
    v24 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __101__VCPMediaAnalyzer_findTimeRangesFor_inURLAsset_withOptions_andProgressHandler_andCompletionHandler___block_invoke;
    aBlock[3] = &unk_1E6B1A390;
    v64 = buf;
    v25 = v23;
    v63 = v25;
    v26 = _Block_copy(aBlock);
    p_nextRequestID = (unsigned int *)&v37->_nextRequestID;
    do
      v28 = __ldaxr(p_nextRequestID);
    while (__stlxr(v28 + 1, p_nextRequestID));
    v60[0] = v24;
    v60[1] = 3221225472;
    v60[2] = __101__VCPMediaAnalyzer_findTimeRangesFor_inURLAsset_withOptions_andProgressHandler_andCompletionHandler___block_invoke_2;
    v60[3] = &unk_1E6B15CE8;
    v29 = objc_alloc_init(VCPCancelToken);
    v61 = v29;
    v30 = _Block_copy(v60);
    cancelQueue = v37->_cancelQueue;
    block[0] = v24;
    block[1] = 3221225472;
    block[2] = __101__VCPMediaAnalyzer_findTimeRangesFor_inURLAsset_withOptions_andProgressHandler_andCompletionHandler___block_invoke_3;
    block[3] = &unk_1E6B1A270;
    v59 = v28;
    block[4] = v37;
    v58 = v29;
    v43 = v29;
    dispatch_sync(cancelQueue, block);
    dispatch_get_global_queue(0, 0);
    v32 = objc_claimAutoreleasedReturnValue();
    v44[0] = v24;
    v44[1] = 3221225472;
    v44[2] = __101__VCPMediaAnalyzer_findTimeRangesFor_inURLAsset_withOptions_andProgressHandler_andCompletionHandler___block_invoke_4;
    v44[3] = &unk_1E6B1A3B8;
    v53 = buf;
    v44[4] = v37;
    v45 = v40;
    v49 = v26;
    v50 = v30;
    v46 = v41;
    v47 = v25;
    v54 = v65;
    v55 = v17;
    v48 = v15;
    v51 = v42;
    v52 = v38;
    v56 = v28;
    v33 = v25;
    v34 = v30;
    v35 = v26;
    dispatch_async(v32, v44);

    _Block_object_dispose(v65, 8);
    _Block_object_dispose(buf, 8);

    v14 = v38;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] [MediaAnalyzer findTimeRangesFor:inURLAsset] call with nil queries or resourceURL", buf, 2u);
    }
    (*((void (**)(id, _QWORD, _QWORD))v14 + 2))(v14, 0, 0);
    v28 = -1;
  }

  return v28;
}

void __101__VCPMediaAnalyzer_findTimeRangesFor_inURLAsset_withOptions_andProgressHandler_andCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  FILE *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (FILE *)*MEMORY[0x1E0C80C10];
    objc_msgSend(v5, "description");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    fprintf(v7, "[ERROR] Analyze file failed (%s)\n", (const char *)objc_msgSend(v8, "UTF8String"));

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("metadataRanges"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __101__VCPMediaAnalyzer_findTimeRangesFor_inURLAsset_withOptions_andProgressHandler_andCompletionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isCanceled");
}

void __101__VCPMediaAnalyzer_findTimeRangesFor_inURLAsset_withOptions_andProgressHandler_andCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v1);

}

void __101__VCPMediaAnalyzer_findTimeRangesFor_inURLAsset_withOptions_andProgressHandler_andCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  objc_class *v44;
  id v45;
  objc_class *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t m;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  uint64_t n;
  void *v66;
  NSObject *v67;
  Float64 Seconds;
  Float64 v69;
  uint64_t v70;
  NSObject *v71;
  id obj;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  uint64_t i;
  uint64_t v78;
  uint64_t v79;
  uint64_t j;
  id v81;
  id v82;
  void *v83;
  _QWORD block[5];
  int v85;
  __int128 v86;
  _OWORD v87[2];
  CMTime v88;
  CMTime time;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  CMTimeRange v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _BYTE buf[32];
  __int128 v112;
  uint8_t v113[4];
  Float64 v114;
  __int16 v115;
  Float64 v116;
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;
  void *v120;
  _BYTE v121[128];
  void *v122;
  _BYTE v123[128];
  _BYTE v124[128];
  _QWORD v125[4];

  v125[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "getAnalysisResultsForURLAsset:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
  if (!v5 || !objc_msgSend(v5, "count"))
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("AllowOnDemand"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("AllowOnDemand"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "BOOLValue");

      if (v8)
      {
        v125[0] = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v125, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[VCPFullAnalysisURLProcessingTask taskForURLAsset:withOptions:analysisTypes:progressHandler:completionHandler:](VCPFullAnalysisURLProcessingTask, "taskForURLAsset:withOptions:analysisTypes:progressHandler:completionHandler:", v9, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 120), 0, *(_QWORD *)(a1 + 72));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "runWithCancelBlock:", *(_QWORD *)(a1 + 80));
        dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL);

      }
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40)
    || !objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "count"))
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] [MediaAnalyzer searchFor:inURLAsset] analysis failed", buf, 2u);
    }
  }
  else
  {
    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    obj = *(id *)(a1 + 64);
    v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v124, 16);
    if (v75)
    {
      v74 = *(_QWORD *)v108;
      do
      {
        for (i = 0; i != v75; ++i)
        {
          if (*(_QWORD *)v108 != v74)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "intValue");
          v13 = v12;
          switch(v12)
          {
            case 1:
              if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                *(_QWORD *)&buf[4] = 1;
                v14 = MEMORY[0x1E0C81028];
                v15 = "Query type not supported as of now (%ld)";
                goto LABEL_23;
              }
              continue;
            case 2:
              v16 = *(void **)(a1 + 32);
              objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v11);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "getTimeRangesForSceneIdentifiers:withResults:", v17, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v18)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "stringValue");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v73, "setObject:forKeyedSubscript:", v18, v20);

              }
              goto LABEL_32;
            case 3:
              v21 = *(void **)(a1 + 32);
              objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v11);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "getTimeRangesForActionIDs:withResults:", v22, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v18)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 3);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "stringValue");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v73, "setObject:forKeyedSubscript:", v18, v24);

              }
              goto LABEL_32;
            case 4:
              v25 = *(void **)(a1 + 32);
              objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v11);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "getTimeRangesForSoundIdentifiers:withResults:", v26, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v18)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 4);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "stringValue");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v73, "setObject:forKeyedSubscript:", v18, v28);

              }
LABEL_32:

              continue;
            case 5:
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              v105 = 0u;
              v106 = 0u;
              v103 = 0u;
              v104 = 0u;
              objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v11);
              v76 = (id)objc_claimAutoreleasedReturnValue();
              v79 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v103, v123, 16);
              if (!v79)
                goto LABEL_57;
              v78 = *(_QWORD *)v104;
              break;
            default:
              if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                *(_QWORD *)&buf[4] = v13;
                v14 = MEMORY[0x1E0C81028];
                v15 = "Unknown query type %ld";
LABEL_23:
                _os_log_impl(&dword_1B6C4A000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
              }
              continue;
          }
          while (2)
          {
            for (j = 0; j != v79; ++j)
            {
              if (*(_QWORD *)v104 != v78)
                objc_enumerationMutation(v76);
              v29 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v29, "vectors");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if ((int)MediaAnalysisLogLevel() >= 4
                    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                  {
                    v44 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v44);
                    v45 = (id)objc_claimAutoreleasedReturnValue();
                    v46 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v46);
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 134218498;
                    *(_QWORD *)&buf[4] = 5;
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v45;
                    *(_WORD *)&buf[22] = 2112;
                    *(_QWORD *)&buf[24] = v47;
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Mismatch data type for query %ld, skip. Expect %@ or %@", buf, 0x20u);

                  }
                  goto LABEL_57;
                }
                v122 = v29;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v122, 1);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v101 = 0u;
              v102 = 0u;
              v99 = 0u;
              v100 = 0u;
              v81 = v30;
              v31 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v99, v121, 16);
              if (v31)
              {
                v32 = *(_QWORD *)v100;
                do
                {
                  for (k = 0; k != v31; ++k)
                  {
                    if (*(_QWORD *)v100 != v32)
                      objc_enumerationMutation(v81);
                    v34 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * k);
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), *(_QWORD *)(a1 + 40));
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    v36 = *(void **)(a1 + 32);
                    v120 = v35;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v120, 1);
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    v38 = *(_QWORD *)(a1 + 48);
                    v119 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v119, 1);
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v36, "searchForQuery:forAssets:withOptions:matchingScoreOnly:isURLAsset:analyses:", v34, v37, v38, 1, 1, v39);
                    v40 = (void *)objc_claimAutoreleasedReturnValue();

                    v41 = *(void **)(a1 + 32);
                    objc_msgSend(v40, "objectForKeyedSubscript:", v35);
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v41, "getTimeRangesWithSearchResults:", v42);
                    v43 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v43)
                      objc_msgSend(v83, "addObjectsFromArray:", v43);

                  }
                  v31 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v99, v121, 16);
                }
                while (v31);
              }

            }
            v79 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v103, v123, 16);
            if (v79)
              continue;
            break;
          }
LABEL_57:

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 5);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "stringValue");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "setObject:forKeyedSubscript:", v83, v49);

        }
        v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v124, 16);
      }
      while (v75);
    }

  }
  v50 = *(_QWORD *)(a1 + 88);
  if (v50)
    (*(void (**)(double))(v50 + 16))(100.0);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "postProcessTimeRanges:options:", v73, *(_QWORD *)(a1 + 48));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v95, v118, 16);
    if (v53)
    {
      v54 = *(_QWORD *)v96;
      do
      {
        for (m = 0; m != v53; ++m)
        {
          if (*(_QWORD *)v96 != v54)
            objc_enumerationMutation(v52);
          v56 = (void *)MEMORY[0x1E0CB3B18];
          CMTimeRangeMakeFromDictionary(&v94, *(CFDictionaryRef *)(*((_QWORD *)&v95 + 1) + 8 * m));
          objc_msgSend(v56, "valueWithCMTimeRange:", &v94);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "addObject:", v57);

        }
        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v95, v118, 16);
      }
      while (v53);
    }

    v58 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("MinTimeRangeGap"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "mergeTimeRanges:mergeGap:", v51, v59);
    v82 = (id)objc_claimAutoreleasedReturnValue();

    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v60 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v60;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "MediaAnalysis findTimeRanges for url %@", buf, 0xCu);
    }
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    v61 = v82;
    v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v90, v117, 16);
    if (v62)
    {
      v63 = *(_QWORD *)v91;
      v64 = MEMORY[0x1E0C81028];
      do
      {
        for (n = 0; n != v62; ++n)
        {
          if (*(_QWORD *)v91 != v63)
            objc_enumerationMutation(v61);
          v66 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * n);
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            v67 = v64;
            if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
            {
              if (v66)
              {
                objc_msgSend(v66, "CMTimeRangeValue");
              }
              else
              {
                v112 = 0u;
                memset(buf, 0, sizeof(buf));
              }
              time = *(CMTime *)buf;
              Seconds = CMTimeGetSeconds(&time);
              if (v66)
              {
                objc_msgSend(v66, "CMTimeRangeValue");
              }
              else
              {
                memset(v87, 0, sizeof(v87));
                v86 = 0u;
              }
              v88 = *(CMTime *)((char *)v87 + 8);
              v69 = CMTimeGetSeconds(&v88);
              *(_DWORD *)v113 = 134218240;
              v114 = Seconds;
              v115 = 2048;
              v116 = v69;
              _os_log_impl(&dword_1B6C4A000, v64, OS_LOG_TYPE_INFO, "[%f, %f]", v113, 0x16u);
            }

          }
        }
        v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v90, v117, 16);
      }
      while (v62);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
  }
  v70 = *(_QWORD *)(a1 + 32);
  v71 = *(NSObject **)(v70 + 104);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__VCPMediaAnalyzer_findTimeRangesFor_inURLAsset_withOptions_andProgressHandler_andCompletionHandler___block_invoke_633;
  block[3] = &unk_1E6B16108;
  block[4] = v70;
  v85 = *(_DWORD *)(a1 + 128);
  dispatch_sync(v71, block);

}

void __101__VCPMediaAnalyzer_findTimeRangesFor_inURLAsset_withOptions_andProgressHandler_andCompletionHandler___block_invoke_633(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeObjectForKey:");

}

- (int)findTimeRangesWithContext:(id)a3 inAsset:(id)a4 withOptions:(id)a5 andProgressHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(a3, "entities");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = -[VCPMediaAnalyzer findTimeRangesFor:inAsset:withOptions:andProgressHandler:andCompletionHandler:](self, "findTimeRangesFor:inAsset:withOptions:andProgressHandler:andCompletionHandler:", v16, v12, v13, v14, v15);

  return (int)self;
}

- (int)findTimeRangesWithContext:(id)a3 inURLAsset:(id)a4 withOptions:(id)a5 andProgressHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(a3, "entities");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = -[VCPMediaAnalyzer findTimeRangesFor:inURLAsset:withOptions:andProgressHandler:andCompletionHandler:](self, "findTimeRangesFor:inURLAsset:withOptions:andProgressHandler:andCompletionHandler:", v16, v12, v13, v14, v15);

  return (int)self;
}

- (id)postProcessTimeRanges:(id)a3 options:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v4, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend(v4, "objectForKeyedSubscript:", v10, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v17;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v17 != v13)
                objc_enumerationMutation(v11);
              objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14++));
            }
            while (v12 != v14);
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v12);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)mergeTimeRanges:(id)a3 mergeGap:(id)a4
{
  id v5;
  unsigned __int8 v6;
  float v7;
  id v8;
  void *v9;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  CMTimeValue v12;
  CMTimeFlags v13;
  CMTimeScale v14;
  CMTimeEpoch v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  id obj;
  id obja;
  CMTimeValue v26;
  CMTimeScale v27;
  CMTimeFlags v28;
  CMTimeEpoch v29;
  CMTimeValue v30;
  CMTimeScale v31;
  CMTimeFlags v32;
  CMTimeEpoch v33;
  CMTimeValue v34;
  CMTimeScale v35;
  CMTimeFlags v36;
  CMTimeEpoch v37;
  CMTimeValue v38;
  CMTimeScale v39;
  CMTimeFlags v40;
  CMTimeEpoch v41;
  CMTimeRange otherRange;
  CMTimeRange v43;
  CMTimeRange lhs;
  CMTimeRange range;
  CMTime v46;
  CMTime v47;
  CMTime time2;
  CMTime time1;
  CMTimeRange v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  CMTime start;
  CMTime rhs;
  _BYTE v57[128];
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  obj = a3;
  v5 = a4;
  if ((v6 & 1) == 0
  {
    CMTimeMakeWithSeconds((CMTime *)-[VCPMediaAnalyzer mergeTimeRanges:mergeGap:]::kMergeGap, 1.0, 600);
  }
  start = *(CMTime *)-[VCPMediaAnalyzer mergeTimeRanges:mergeGap:]::kMergeGap;
  if (v5)
  {
    objc_msgSend(v5, "floatValue");
    CMTimeMakeWithSeconds(&v50.start, fmaxf(v7, 0.0), 600);
    start = v50.start;
  }
  if ((unint64_t)objc_msgSend(obj, "count", v5) > 1)
  {
    objc_msgSend(obj, "sortedArrayUsingComparator:", &__block_literal_global_635);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    value = *MEMORY[0x1E0CA2E50];
    flags = *(_DWORD *)(MEMORY[0x1E0CA2E50] + 12);
    timescale = *(_DWORD *)(MEMORY[0x1E0CA2E50] + 8);
    epoch = *(_QWORD *)(MEMORY[0x1E0CA2E50] + 16);
    v12 = *(_QWORD *)(MEMORY[0x1E0CA2E50] + 24);
    v14 = *(_DWORD *)(MEMORY[0x1E0CA2E50] + 32);
    v13 = *(_DWORD *)(MEMORY[0x1E0CA2E50] + 36);
    v15 = *(_QWORD *)(MEMORY[0x1E0CA2E50] + 40);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    obja = v9;
    v16 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (!v16)
      goto LABEL_24;
    v17 = *(_QWORD *)v52;
    while (1)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v52 != v17)
          objc_enumerationMutation(obja);
        v19 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        memset(&v50, 0, sizeof(v50));
        if (v19)
          objc_msgSend(v19, "CMTimeRangeValue");
        if ((flags & 1) != 0 && (v13 & 1) != 0 && !v15 && (v12 & 0x8000000000000000) == 0)
        {
          time1.value = v12;
          time1.timescale = v14;
          time1.flags = v13;
          time1.epoch = 0;
          time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
          if (!CMTimeCompare(&time1, &time2))
            goto LABEL_20;
        }
        range.start.value = value;
        range.start.timescale = timescale;
        range.start.flags = flags;
        range.start.epoch = epoch;
        range.duration.value = v12;
        range.duration.timescale = v14;
        range.duration.flags = v13;
        range.duration.epoch = v15;
        CMTimeRangeGetEnd(&v46, &range);
        *(_OWORD *)&lhs.start.value = *(_OWORD *)&v50.start.value;
        lhs.start.epoch = v50.start.epoch;
        rhs = v46;
        CMTimeSubtract(&v47, &lhs.start, &rhs);
        lhs.start = v47;
        rhs = start;
        if ((CMTimeCompare(&lhs.start, &rhs) & 0x80000000) == 0)
        {
          v34 = value;
          v35 = timescale;
          v36 = flags;
          v37 = epoch;
          v38 = v12;
          v39 = v14;
          v40 = v13;
          v41 = v15;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTimeRange:", &v34);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v20);

LABEL_20:
          value = v50.start.value;
          flags = v50.start.flags;
          timescale = v50.start.timescale;
          v12 = v50.duration.value;
          epoch = v50.start.epoch;
          v14 = v50.duration.timescale;
          v13 = v50.duration.flags;
          v15 = v50.duration.epoch;
          continue;
        }
        v43.start.value = value;
        v43.start.timescale = timescale;
        v43.start.flags = flags;
        v43.start.epoch = epoch;
        v43.duration.value = v12;
        v43.duration.timescale = v14;
        v43.duration.flags = v13;
        v43.duration.epoch = v15;
        otherRange = v50;
        CMTimeRangeGetUnion(&lhs, &v43, &otherRange);
        value = lhs.start.value;
        flags = lhs.start.flags;
        timescale = lhs.start.timescale;
        epoch = lhs.start.epoch;
        v12 = lhs.duration.value;
        v14 = lhs.duration.timescale;
        v13 = lhs.duration.flags;
        v15 = lhs.duration.epoch;
      }
      v16 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      if (!v16)
      {
LABEL_24:

        v26 = value;
        v27 = timescale;
        v28 = flags;
        v29 = epoch;
        v30 = v12;
        v31 = v14;
        v32 = v13;
        v33 = v15;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTimeRange:", &v26);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v21);

        goto LABEL_25;
      }
    }
  }
  v8 = obj;
  obja = v8;
LABEL_25:

  return v8;
}

uint64_t __45__VCPMediaAnalyzer_mergeTimeRanges_mergeGap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  CMTimeEpoch v6;
  uint64_t v7;
  CMTime v9;
  _BYTE time1[32];
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  CMTime time2;

  v4 = a2;
  v5 = a3;
  if (v4)
  {
    objc_msgSend(v4, "CMTimeRangeValue");
  }
  else
  {
    v11 = 0u;
    memset(time1, 0, sizeof(time1));
  }
  v12 = *(_OWORD *)time1;
  v13 = *(_QWORD *)&time1[16];
  if (v5)
  {
    objc_msgSend(v5, "CMTimeRangeValue");
  }
  else
  {
    v11 = 0u;
    memset(time1, 0, sizeof(time1));
  }
  *(_OWORD *)&v9.value = *(_OWORD *)time1;
  v6 = *(_QWORD *)&time1[16];
  v9.epoch = *(_QWORD *)&time1[16];
  *(_OWORD *)time1 = v12;
  *(_QWORD *)&time1[16] = v13;
  *(_OWORD *)&time2.value = *(_OWORD *)&v9.value;
  time2.epoch = v6;
  if (CMTimeCompare((CMTime *)time1, &time2))
  {
    *(_OWORD *)time1 = v12;
    *(_QWORD *)&time1[16] = v13;
    time2 = v9;
    if (CMTimeCompare((CMTime *)time1, &time2) < 0)
      v7 = -1;
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)loadVideoAssetsFromPhotoLibraryURL:(id)a3 withAssetIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v25 = v6;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD16F0]), "initWithPhotoLibraryURL:", v6);
  v9 = v7;
  v10 = v9;
  if (v9)
    goto LABEL_4;
  -[VCPMediaAnalyzer _databaseForPhotoLibrary:](self, "_databaseForPhotoLibrary:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "queryAssetsAnalyzedSince:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_4:
    objc_msgSend(MEMORY[0x1E0CD1398], "vcp_fetchOptionsForLibrary:forTaskID:", v8, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "vcp_moviesPredicate:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPredicate:", v14);

    objc_msgSend(MEMORY[0x1E0CD1398], "fetchAssetsWithLocalIdentifiers:options:", v10, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v7;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v17 = v15;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16, v24, v6);
      if (v18)
      {
        v19 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v27 != v19)
              objc_enumerationMutation(v17);
            objc_msgSend(v16, "addObject:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v18);
      }

    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] No available assets for search", buf, 2u);
      }
      v16 = 0;
    }

    goto LABEL_18;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v8, "photoLibraryURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v23;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] Failed to obtain database for Photo Library (%@)", buf, 0xCu);

  }
  v16 = 0;
LABEL_18:

  return v16;
}

- (id)loadEmbeddingSearchResultWithContext:(id)a3 forPhotoLibraryURL:(id)a4 fromAssets:(id)a5 withOptions:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  objc_class *v24;
  id v25;
  objc_class *v26;
  void *v27;
  void *v28;
  id v31;
  id v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  void *v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v31 = a4;
  v32 = a5;
  v33 = a6;
  v34 = v9;
  if (v9 && (objc_msgSend(v9, "entities"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    objc_msgSend(v9, "entities");
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    if (v12)
    {
      v36 = *(_QWORD *)v43;
      do
      {
        v13 = 0;
        v35 = v12;
        do
        {
          if (*(_QWORD *)v43 != v36)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v13);
          v15 = objc_msgSend(v14, "intValue");
          if (v15 == 5)
          {
            v40 = 0u;
            v41 = 0u;
            v38 = 0u;
            v39 = 0u;
            objc_msgSend(obj, "objectForKeyedSubscript:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
            if (v17)
            {
              v18 = *(_QWORD *)v39;
              v19 = v11;
              while (2)
              {
                v20 = 0;
                v11 = v19;
                do
                {
                  if (*(_QWORD *)v39 != v18)
                    objc_enumerationMutation(v16);
                  v21 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v20);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v21, "vectors");
                    v22 = objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      if ((int)MediaAnalysisLogLevel() >= 4
                        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                      {
                        v24 = (objc_class *)objc_opt_class();
                        NSStringFromClass(v24);
                        v25 = (id)objc_claimAutoreleasedReturnValue();
                        v26 = (objc_class *)objc_opt_class();
                        NSStringFromClass(v26);
                        v27 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 134218498;
                        v47 = 5;
                        v48 = 2112;
                        v49 = v25;
                        v50 = 2112;
                        v51 = v27;
                        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Mismatch data type for query %ld, skip. Expect %@ or %@", buf, 0x20u);

                      }
                      goto LABEL_27;
                    }
                    v52 = v21;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
                    v22 = objc_claimAutoreleasedReturnValue();
                  }
                  v19 = (void *)v22;

                  ++v20;
                  v11 = v19;
                }
                while (v17 != v20);
                v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
                if (v17)
                  continue;
                break;
              }
            }
            else
            {
LABEL_27:
              v19 = v11;
            }

            v11 = v19;
            v12 = v35;
          }
          else if ((int)MediaAnalysisLogLevel() >= 4)
          {
            v23 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              v47 = v15;
              _os_log_impl(&dword_1B6C4A000, v23, OS_LOG_TYPE_DEFAULT, "Unsupport query type %ld in search context for ranking", buf, 0xCu);
            }
          }
          ++v13;
        }
        while (v13 != v12);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
      }
      while (v12);
    }

    -[VCPMediaAnalyzer requestSearchResultsForAssets:forPhotoLibraryURL:withQueryEmbeddings:matchingScoreOnly:options:](self, "requestSearchResultsForAssets:forPhotoLibraryURL:withQueryEmbeddings:matchingScoreOnly:options:", v32, v31, v11, 1, v33);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[VCPMediaAnalyzer requestSearchResultsForAssets:forPhotoLibraryURL:withQueryEmbeddings:matchingScoreOnly:options:](self, "requestSearchResultsForAssets:forPhotoLibraryURL:withQueryEmbeddings:matchingScoreOnly:options:", v32, v31, MEMORY[0x1E0C9AA60], 1, v33);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v28;
}

- (void)addVideoRankingSignalsToDictionary:(id)a3 fromPhotoLibraryURL:(id)a4 amongAssets:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  float v21;
  uint64_t j;
  void *v23;
  float v24;
  float v25;
  NSObject *v26;
  const char *v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  BOOL v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  BOOL v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  float v46;
  uint64_t k;
  void *v48;
  float v49;
  float v50;
  unint64_t v51;
  unint64_t v52;
  void *v53;
  BOOL v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  void *v60;
  id v61;
  id obj;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  const __CFString *v79;
  void *v80;
  _BYTE v81[128];
  const __CFString *v82;
  void *v83;
  uint8_t v84[128];
  uint8_t buf[4];
  void *v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v61 = a5;
  +[VCPClientDatabaseManager sharedDatabaseForPhotoLibraryURL:](VCPClientDatabaseManager, "sharedDatabaseForPhotoLibraryURL:", a4);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  MediaAnalysisResultsTypesForAnalysisTypes(128);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  obj = v61;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
  if (v8)
  {
    v63 = *(_QWORD *)v76;
    do
    {
      v66 = v8;
      for (i = 0; i != v66; ++i)
      {
        if (*(_QWORD *)v76 != v63)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * i), "localIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "queryAnalysisForAsset:withTypes:", v10, v65);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          objc_msgSend(v11, "vcp_results");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("InterestingnessResults"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14 == 0;

          if (v15)
          {
            if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v86 = v10;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[VideoRankingSignals][%@] Missing video signal interestingness from full analysis results", buf, 0xCu);
            }
          }
          else
          {
            objc_msgSend(v12, "vcp_results");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("InterestingnessResults"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            v73 = 0u;
            v74 = 0u;
            v71 = 0u;
            v72 = 0u;
            v18 = v17;
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
            if (v19)
            {
              v20 = *(_QWORD *)v72;
              v21 = 0.0;
              do
              {
                for (j = 0; j != v19; ++j)
                {
                  if (*(_QWORD *)v72 != v20)
                    objc_enumerationMutation(v18);
                  objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * j), "objectForKeyedSubscript:", CFSTR("quality"));
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "floatValue");
                  v25 = v24;

                  v21 = v21 + v25;
                }
                v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
              }
              while (v19);
            }
            else
            {
              v21 = 0.0;
            }

            v28 = objc_msgSend(v18, "count");
            if (v28 <= 1)
              v29 = 1;
            else
              v29 = v28;
            objc_msgSend(v7, "objectForKeyedSubscript:", v10);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v30 == 0;

            if (v31)
            {
              v82 = CFSTR("InterestingnessScore");
              *(float *)&v32 = v21 / (float)v29;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v83 = v34;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKey:", v37, v10);

            }
            else
            {
              objc_msgSend(v7, "objectForKeyedSubscript:", v10);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = (void *)objc_msgSend(v33, "mutableCopy");

              *(float *)&v35 = v21 / (float)v29;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setObject:forKeyedSubscript:", v36, CFSTR("InterestingnessScore"));

              objc_msgSend(v7, "setObject:forKeyedSubscript:", v34, v10);
            }

          }
          objc_msgSend(v12, "vcp_results");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("QualityResults"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v39 == 0;

          if (v40)
          {
            if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v86 = v10;
              v26 = MEMORY[0x1E0C81028];
              v27 = "[VideoRankingSignals][%@] Missing video signal quality from full analysis results";
              goto LABEL_42;
            }
          }
          else
          {
            objc_msgSend(v12, "vcp_results");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("QualityResults"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            v69 = 0u;
            v70 = 0u;
            v67 = 0u;
            v68 = 0u;
            v43 = v42;
            v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
            if (v44)
            {
              v45 = *(_QWORD *)v68;
              v46 = 0.0;
              do
              {
                for (k = 0; k != v44; ++k)
                {
                  if (*(_QWORD *)v68 != v45)
                    objc_enumerationMutation(v43);
                  objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * k), "objectForKeyedSubscript:", CFSTR("quality"));
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "floatValue");
                  v50 = v49;

                  v46 = v46 + v50;
                }
                v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
              }
              while (v44);
            }
            else
            {
              v46 = 0.0;
            }

            v51 = objc_msgSend(v43, "count");
            if (v51 <= 1)
              v52 = 1;
            else
              v52 = v51;
            objc_msgSend(v7, "objectForKeyedSubscript:", v10);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = v53 == 0;

            if (v54)
            {
              v79 = CFSTR("QualityScore");
              *(float *)&v55 = v46 / (float)v52;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v55);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v80 = v57;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKey:", v60, v10);

            }
            else
            {
              objc_msgSend(v7, "objectForKeyedSubscript:", v10);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = (void *)objc_msgSend(v56, "mutableCopy");

              *(float *)&v58 = v46 / (float)v52;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v58);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "setObject:forKeyedSubscript:", v59, CFSTR("QualityScore"));

              objc_msgSend(v7, "setObject:forKeyedSubscript:", v57, v10);
            }

          }
        }
        else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v86 = v10;
          v26 = MEMORY[0x1E0C81028];
          v27 = "[VideoRankingSignals][%@] No analysis results from MAD database, skip fetching";
LABEL_42:
          _os_log_impl(&dword_1B6C4A000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 0xCu);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
    }
    while (v8);
  }

}

- (id)rankAssetsWithContext:(id)a3 forAssetIdentifiers:(id)a4 forPhotoLibraryURL:(id)a5 withOptions:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  VideoRanker *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint8_t buf[8];
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v33 = v13;
  v34 = a6;
  if (v12 && (objc_msgSend(v12, "entities"), (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SearchQueryString"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Empty search context and no query string for search ranking.", buf, 2u);
      }
      if (!a7)
      {
        v22 = 0;
        goto LABEL_31;
      }
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v40 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Empty search context and no query string for search ranking."));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v20);
      v22 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
  }
  if (v14)
  {
    v17 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD16F0], "systemPhotoLibraryURL");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;
  -[VCPMediaAnalyzer loadVideoAssetsFromPhotoLibraryURL:withAssetIdentifiers:](self, "loadVideoAssetsFromPhotoLibraryURL:withAssetIdentifiers:", v17, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19 && objc_msgSend(v19, "count"))
  {
    -[VCPMediaAnalyzer loadEmbeddingSearchResultWithContext:forPhotoLibraryURL:fromAssets:withOptions:](self, "loadEmbeddingSearchResultWithContext:forPhotoLibraryURL:fromAssets:withOptions:", v12, v18, v20, v34);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v23 = -[VideoRanker initWithCorpus:]([VideoRanker alloc], "initWithCorpus:", v21);
    v24 = v23;
    if (v23)
    {
      -[VideoRanker rankingScores](v23, "rankingScores");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "mutableCopy");

      v22 = (id)v26;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to initialize BM25 video ranker, allow to skip adding BM25 ranking scores.", buf, 2u);
      }
      if (a7)
      {
        v32 = (void *)MEMORY[0x1E0CB35C8];
        v36 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to initialize BM25 video ranker."));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v31;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    -[VCPMediaAnalyzer addVideoRankingSignalsToDictionary:fromPhotoLibraryURL:amongAssets:](self, "addVideoRankingSignalsToDictionary:fromPhotoLibraryURL:amongAssets:", v22, v18, v20);
    goto LABEL_29;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Empty search in assets fetched for videos.", buf, 2u);
  }
  if (a7)
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v38 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Empty search in assets fetched for videos."));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v24);
    v22 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

    goto LABEL_30;
  }
  v22 = 0;
LABEL_30:

LABEL_31:
  return v22;
}

- (id)prepareContextsQueryEmbedding:(id)a3
{
  id v4;
  VCPTextEncoder *v5;
  VCPTextEncoder *textEncoder;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_textEncoder
    || (v5 = objc_alloc_init(VCPTextEncoder),
        textEncoder = self->_textEncoder,
        self->_textEncoder = v5,
        textEncoder,
        self->_textEncoder))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SearchQueryString"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v8);
          -[VCPTextEncoder textEmbeddingForQuery:useFP16:](self->_textEncoder, "textEmbeddingForQuery:useFP16:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v9);
    }

    v13 = (void *)objc_msgSend(v4, "mutableCopy");
    if (objc_msgSend(v7, "count"))
      objc_msgSend(v13, "setObject:forKey:", v7, &unk_1E6B749C0);
    objc_msgSend(v13, "removeObjectForKey:", CFSTR("SearchQueryString"));

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to create text encoder", buf, 2u);
    }
    v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_freeFormSearch, 0);
  objc_storeStrong((id *)&self->_textEncoder, 0);
  objc_storeStrong((id *)&self->_cancelTokens, 0);
  objc_storeStrong((id *)&self->_cancelQueue, 0);
  objc_storeStrong((id *)&self->_sandboxHandles, 0);
  objc_storeStrong((id *)&self->_sandboxQueue, 0);
  objc_storeStrong((id *)&self->_mediaAnalysisServiceConnection, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_noResultStrip, 0);
  objc_storeStrong((id *)&self->_minHighlightDuration, 0);
  objc_storeStrong((id *)&self->_standalone, 0);
  objc_storeStrong((id *)&self->_storageGroup, 0);
  objc_storeStrong((id *)&self->_storageQueue, 0);
  objc_storeStrong((id *)&self->_searchQueue, 0);
  objc_storeStrong((id *)&self->_analysisQueue, 0);
}

@end

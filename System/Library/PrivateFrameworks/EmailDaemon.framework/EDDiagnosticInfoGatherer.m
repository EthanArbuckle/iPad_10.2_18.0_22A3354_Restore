@implementation EDDiagnosticInfoGatherer

void __31__EDDiagnosticInfoGatherer_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_29;
  log_log_29 = (uint64_t)v1;

}

- (EDDiagnosticInfoGatherer)initWithFetchController:(id)a3 remoteClientsProvider:(id)a4 persistence:(id)a5
{
  id v9;
  id v10;
  id v11;
  EDDiagnosticInfoGatherer *v12;
  EDDiagnosticInfoGatherer *v13;
  uint64_t v14;
  EFScheduler *gathererQueue;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)EDDiagnosticInfoGatherer;
  v12 = -[EDDiagnosticInfoGatherer init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fetchController, a3);
    objc_storeStrong((id *)&v13->_remoteClientsProvider, a4);
    objc_storeStrong((id *)&v13->_persistence, a5);
    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.email.daemon.EDDiagnosticInfoGatherer"), 25);
    v14 = objc_claimAutoreleasedReturnValue();
    gathererQueue = v13->_gathererQueue;
    v13->_gathererQueue = (EFScheduler *)v14;

  }
  return v13;
}

- (void)registerDiagnosticInfoProvider:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, id);
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, id))a4;
  objc_storeStrong((id *)&self->_diagnosticInfoProvider, a3);
  v9 = objc_alloc_init(MEMORY[0x1E0D1EE90]);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __77__EDDiagnosticInfoGatherer_registerDiagnosticInfoProvider_completionHandler___block_invoke;
  v14 = &unk_1E949C258;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v9, "addCancelationBlock:", &v11);
  +[EDDiagnosticInfoGatherer log](EDDiagnosticInfoGatherer, "log", v11, v12, v13, v14);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v18 = v7;
    _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Registered EMDiagnosticInfoProviding: <%p>", buf, 0xCu);
  }

  v8[2](v8, v9);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__EDDiagnosticInfoGatherer_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_29 != -1)
    dispatch_once(&log_onceToken_29, block);
  return (OS_os_log *)(id)log_log_29;
}

void __77__EDDiagnosticInfoGatherer_registerDiagnosticInfoProvider_completionHandler___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

- (void)fetchControllerStatusWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[EDDiagnosticInfoGatherer gathererQueue](self, "gathererQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__EDDiagnosticInfoGatherer_fetchControllerStatusWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E949C280;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performBlock:", v7);

}

void __71__EDDiagnosticInfoGatherer_fetchControllerStatusWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "fetchController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "diagnosticInformation");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)gatherDiagnosticsWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  unint64_t v26;
  id v27;
  uint8_t buf[4];
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  +[EDDiagnosticInfoGatherer log](EDDiagnosticInfoGatherer, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v29 = a3;
    _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "Gathering diagnostics with options: %lx...", buf, 0xCu);
  }

  v8 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fileURLWithPath:isDirectory:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("DiagnosticLogs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v13 = objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v27);
  v14 = v27;

  if ((v13 & 1) == 0)
  {
    +[EDDiagnosticInfoGatherer log](EDDiagnosticInfoGatherer, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDDiagnosticInfoGatherer gatherDiagnosticsWithOptions:completionHandler:].cold.1(v16, (uint64_t)v14, buf, v15);
    }

  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F068]), "initWithFileURL:readOnly:", v11, 0);
  -[EDDiagnosticInfoGatherer gathererQueue](self, "gathererQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __75__EDDiagnosticInfoGatherer_gatherDiagnosticsWithOptions_completionHandler___block_invoke;
  v22[3] = &unk_1E949C2F0;
  v22[4] = self;
  v19 = v17;
  v23 = v19;
  v26 = a3;
  v20 = v11;
  v24 = v20;
  v21 = v6;
  v25 = v21;
  objc_msgSend(v18, "performBlock:", v22);

}

void __75__EDDiagnosticInfoGatherer_gatherDiagnosticsWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "remoteClientsProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteClients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v7, "diagnosticInfoGatherer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "diagnosticInfoProvider");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v7, "clientResumer");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            objc_msgSend(v7, "clientResumer");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "resumeForUpdates");

          }
          objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = *(_QWORD *)(a1 + 64);
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __75__EDDiagnosticInfoGatherer_gatherDiagnosticsWithOptions_completionHandler___block_invoke_2;
          v22[3] = &unk_1E949C2A8;
          v14 = *(_QWORD *)(a1 + 40);
          v22[4] = *(_QWORD *)(a1 + 32);
          v23 = *(id *)(a1 + 48);
          v15 = v12;
          v24 = v15;
          objc_msgSend(v9, "provideDiagnosticsAt:options:completion:", v14, v13, v22);
          objc_msgSend(v15, "future");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v16);

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v4);
  }

  objc_msgSend(MEMORY[0x1E0D1EEC0], "combine:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __75__EDDiagnosticInfoGatherer_gatherDiagnosticsWithOptions_completionHandler___block_invoke_3;
  v19[3] = &unk_1E949BD50;
  v21 = *(id *)(a1 + 56);
  v20 = *(id *)(a1 + 40);
  objc_msgSend(v17, "always:", v19);
  objc_msgSend(v17, "addFailureBlock:", &__block_literal_global_17);

}

void __75__EDDiagnosticInfoGatherer_gatherDiagnosticsWithOptions_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_copySearchIndexerDatabaseIntoDirectoryURL:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_downloadMessagesWithObjectIDs:directoryURL:completionPromise:", v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_createDiagnosticsJSONForMessagesWithObjectIDs:directoryURL:", v8, *(_QWORD *)(a1 + 40));
  }
  else
  {
    v6 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishWithResult:error:", v7, v5);

  }
}

uint64_t __75__EDDiagnosticInfoGatherer_gatherDiagnosticsWithOptions_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __75__EDDiagnosticInfoGatherer_gatherDiagnosticsWithOptions_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;

  v2 = a2;
  +[EDDiagnosticInfoGatherer log](EDDiagnosticInfoGatherer, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __75__EDDiagnosticInfoGatherer_gatherDiagnosticsWithOptions_completionHandler___block_invoke_4_cold_1((uint64_t)v2, v3, v4);

}

- (void)_copySearchIndexerDatabaseIntoDirectoryURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForDirectory:inDomain:appropriateForURL:create:error:", 5, 1, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("Mail"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("SearchIndexer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("database"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "temporaryDirectory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = arc4random();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%08x%08x"), v13, arc4random());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByAppendingPathComponent:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v15, 1, 0, 0);

  objc_msgSend(v15, "URLByAppendingPathComponent:isDirectory:", CFSTR("SearchIndexer-database"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EDDiagnosticInfoGatherer _copyDatabaseFromURL:intoDatabaseAtURL:](self, "_copyDatabaseFromURL:intoDatabaseAtURL:", v9, v17))
  {
    if (-[EDDiagnosticInfoGatherer _compressDatabaseAtURL:intoDirectoryURL:](self, "_compressDatabaseAtURL:intoDirectoryURL:", v17, v4))
    {
      +[EDDiagnosticInfoGatherer log](EDDiagnosticInfoGatherer, "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2F2C000, v18, OS_LOG_TYPE_DEFAULT, "Added Search Indexer database.", buf, 2u);
      }
    }
    else
    {
      +[EDDiagnosticInfoGatherer log](EDDiagnosticInfoGatherer, "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[EDDiagnosticInfoGatherer _copySearchIndexerDatabaseIntoDirectoryURL:].cold.1(v18, v26, v27, v28, v29, v30, v31, v32);
    }
  }
  else
  {
    +[EDDiagnosticInfoGatherer log](EDDiagnosticInfoGatherer, "log");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[EDDiagnosticInfoGatherer _copySearchIndexerDatabaseIntoDirectoryURL:].cold.2(v18, v19, v20, v21, v22, v23, v24, v25);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "removeItemAtURL:error:", v15, 0);

}

- (BOOL)_compressDatabaseAtURL:(id)a3 intoDirectoryURL:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v20;
  id v21;

  v6 = a3;
  v21 = a4;
  objc_msgSend(v6, "lastPathComponent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByDeletingLastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringByAppendingString:", CFSTR(".aar"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "URLByAppendingPathComponent:isDirectory:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "temporaryDirectory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = arc4random();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%08x%08x.aar"), v13, arc4random());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByAppendingPathComponent:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[EDDiagnosticInfoGatherer _compressDirectoryAtURL:intoArchiveWithURL:](self, "_compressDirectoryAtURL:intoArchiveWithURL:", v7, v15);
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "moveItemAtURL:toURL:error:", v15, v9, 0);

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeItemAtURL:error:", v15, 0);

  return v16;
}

- (BOOL)_compressDirectoryAtURL:(id)a3 intoArchiveWithURL:(id)a4
{
  id v5;
  id v6;
  AAByteStream_impl *v7;
  AAByteStream_impl *v8;
  AAArchiveStream_impl *v9;
  AAFieldKeySet_impl *v10;
  id v11;
  AAPathList_impl *v12;
  id v13;
  int v14;

  v5 = a3;
  v6 = objc_retainAutorelease(a4);
  v7 = AAFileStreamOpenWithPath((const char *)objc_msgSend(v6, "fileSystemRepresentation"), 1537, 0x1A4u);
  v8 = AACompressionOutputStreamOpen(v7, 0x801u, 0x100000uLL, 0, 0);
  v9 = AAEncodeArchiveOutputStreamOpen(v8, 0, 0, 0, 0);
  v10 = AAFieldKeySetCreateWithString("FLG,MTM,CTM,DAT,SH5");
  v11 = objc_retainAutorelease(v5);
  v12 = AAPathListCreateWithDirectoryContents((const char *)objc_msgSend(v11, "fileSystemRepresentation"), 0, &__block_literal_global_33, (AAEntryMessageProc)entryMessageProc, 0, 0);
  v13 = objc_retainAutorelease(v11);
  v14 = AAArchiveStreamWritePathList(v9, v12, v10, (const char *)objc_msgSend(v13, "fileSystemRepresentation"), 0, 0, 0, 0);
  AAArchiveStreamClose(v9);
  AAByteStreamClose(v8);
  AAByteStreamClose(v7);
  AAFieldKeySetDestroy(v10);
  AAPathListDestroy(v12);

  return v14 == 0;
}

uint64_t __71__EDDiagnosticInfoGatherer__compressDirectoryAtURL_intoArchiveWithURL___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  void *v3;
  NSObject *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a2 == 11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", a3, 4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDDiagnosticInfoGatherer log](EDDiagnosticInfoGatherer, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_INFO, "Adding '%@'", (uint8_t *)&v6, 0xCu);
    }

  }
  return 0;
}

- (BOOL)_copyDatabaseFromURL:(id)a3 intoDatabaseAtURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  sqlite3 *v11;
  sqlite3 *ppDb;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    ppDb = 0;
    if (!sqlite3_open_v2((const char *)objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation"), &ppDb, 524289, 0))
    {
      v11 = 0;
      if (!sqlite3_open_v2((const char *)objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation"), &v11, 524294, 0))
      {
        v9 = -[EDDiagnosticInfoGatherer _copyFromDatabase:intoDatabase:](self, "_copyFromDatabase:intoDatabase:", ppDb, v11);
        sqlite3_close_v2(v11);
        sqlite3_close_v2(ppDb);
        sqlite3_sleep(10);
        goto LABEL_7;
      }
      sqlite3_close(ppDb);
    }
    v9 = 0;
  }
LABEL_7:

  return v9;
}

- (BOOL)_copyFromDatabase:(sqlite3 *)a3 intoDatabase:(sqlite3 *)a4
{
  sqlite3_backup *v4;
  int v5;

  v4 = sqlite3_backup_init(a4, "main", a3, "main");
  if (v4)
  {
    while (1)
    {
      do
        v5 = sqlite3_backup_step(v4, 5);
      while (!v5);
      if ((v5 - 5) > 1)
        break;
      sqlite3_sleep(100);
    }
    sqlite3_backup_finish(v4);
  }
  return v4 != 0;
}

- (void)_createDiagnosticsJSONForMessagesWithObjectIDs:(id)a3 directoryURL:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[EDDiagnosticInfoGatherer persistence](self, "persistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messagePersistence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "diagnosticsForForMessageObjectIDs:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "ef_URLByAppendingTimestampedPathComponent:withExtension:", CFSTR("messages"), CFSTR("json"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "writeToURL:options:error:", v11, 0, 0);

  }
}

- (void)_downloadMessagesWithObjectIDs:(id)a3 directoryURL:(id)a4 completionPromise:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  EDDiagnosticInfoGatherer *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[EDDiagnosticInfoGatherer gathererQueue](self, "gathererQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __90__EDDiagnosticInfoGatherer__downloadMessagesWithObjectIDs_directoryURL_completionPromise___block_invoke;
  v15[3] = &unk_1E949B680;
  v12 = v8;
  v16 = v12;
  v17 = self;
  v13 = v9;
  v18 = v13;
  v14 = v10;
  v19 = v14;
  objc_msgSend(v11, "performBlock:", v15);

}

void __90__EDDiagnosticInfoGatherer__downloadMessagesWithObjectIDs_directoryURL_completionPromise___block_invoke(id *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id obj;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  +[EDDiagnosticInfoGatherer log](EDDiagnosticInfoGatherer, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(a1[4], "count");
    *(_DWORD *)buf = 134217984;
    v30 = v3;
    _os_log_impl(&dword_1D2F2C000, v2, OS_LOG_TYPE_DEFAULT, "Download %lu message objects ids", buf, 0xCu);
  }

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[4], "count"));
  v4 = objc_msgSend(MEMORY[0x1E0D1E158], "uniqueRequestID");
  objc_msgSend(MEMORY[0x1E0D1E130], "optionsWithRequestedRepresentationType:networkUsage:", *MEMORY[0x1E0D1DBF0], 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = a1[4];
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v25;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v7);
        objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "future");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v10);

        objc_msgSend(a1[5], "persistence");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "messagePersistence");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __90__EDDiagnosticInfoGatherer__downloadMessagesWithObjectIDs_directoryURL_completionPromise___block_invoke_41;
        v20[3] = &unk_1E949C338;
        v21 = a1[6];
        v22 = v8;
        v13 = v9;
        v23 = v13;
        v14 = (id)objc_msgSend(v12, "requestContentForMessageObjectID:requestID:options:delegate:completionHandler:", v8, v4, v18, 0, v20);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0D1EEC0], "combine:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "map:", &__block_literal_global_49);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[7], "finishWithFuture:", v16);
}

void __90__EDDiagnosticInfoGatherer__downloadMessagesWithObjectIDs_directoryURL_completionPromise___block_invoke_41(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "contentURL");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = *(void **)(a1 + 32);
    v10 = objc_msgSend(*(id *)(a1 + 40), "globalMessageID");
    -[NSObject URLByDeletingPathExtension](v7, "URLByDeletingPathExtension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Message-%lld-%@"), v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ef_URLByAppendingTimestampedPathComponent:withExtension:", v13, CFSTR("eml"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    LODWORD(v13) = objc_msgSend(v15, "copyItemAtURL:toURL:error:", v7, v14, &v25);
    v16 = v25;

    if ((_DWORD)v13)
    {
      +[EDDiagnosticInfoGatherer log](EDDiagnosticInfoGatherer, "log");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v27 = v14;
        _os_log_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_DEFAULT, "Dumped raw eml at %{public}@", buf, 0xCu);
      }
      v18 = v6;
    }
    else
    {
      +[EDDiagnosticInfoGatherer log](EDDiagnosticInfoGatherer, "log");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        -[NSObject path](v7, "path");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "ef_publicDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v27 = v23;
        v28 = 2114;
        v29 = v14;
        v30 = 2114;
        v31 = v24;
        _os_log_error_impl(&dword_1D2F2C000, v20, OS_LOG_TYPE_ERROR, "Error copying the url at %{public}@ to %{public}@. Error: %{public}@", buf, 0x20u);

      }
      v18 = v16;
      v17 = v6;
    }

  }
  else
  {
    +[EDDiagnosticInfoGatherer log](EDDiagnosticInfoGatherer, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[NSObject ef_publicDescription](v6, "ef_publicDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      __90__EDDiagnosticInfoGatherer__downloadMessagesWithObjectIDs_directoryURL_completionPromise___block_invoke_41_cold_1(v19, (uint64_t)buf, v7);
    }
    v18 = v6;
  }

  v21 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "finishWithResult:error:", v22, v18);

}

id __90__EDDiagnosticInfoGatherer__downloadMessagesWithObjectIDs_directoryURL_completionPromise___block_invoke_47()
{
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)databaseStatisticsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[EDDiagnosticInfoGatherer gathererQueue](self, "gathererQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__EDDiagnosticInfoGatherer_databaseStatisticsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E949C280;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performBlock:", v7);

}

void __68__EDDiagnosticInfoGatherer_databaseStatisticsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "persistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistenceStatistics");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)searchableIndexDatabaseStatisticsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[EDDiagnosticInfoGatherer gathererQueue](self, "gathererQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__EDDiagnosticInfoGatherer_searchableIndexDatabaseStatisticsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E949C280;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performBlock:", v7);

}

void __83__EDDiagnosticInfoGatherer_searchableIndexDatabaseStatisticsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "persistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchableIndexStatistics");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (EMDiagnosticInfoProvidingXPC)diagnosticInfoProvider
{
  return self->_diagnosticInfoProvider;
}

- (void)setDiagnosticInfoProvider:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticInfoProvider, a3);
}

- (EDServerRemoteClientsProvider)remoteClientsProvider
{
  return self->_remoteClientsProvider;
}

- (void)setRemoteClientsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_remoteClientsProvider, a3);
}

- (EDFetchController)fetchController
{
  return self->_fetchController;
}

- (EFScheduler)gathererQueue
{
  return self->_gathererQueue;
}

- (void)setGathererQueue:(id)a3
{
  objc_storeStrong((id *)&self->_gathererQueue, a3);
}

- (EDPersistence)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_persistence, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_gathererQueue, 0);
  objc_storeStrong((id *)&self->_fetchController, 0);
  objc_storeStrong((id *)&self->_remoteClientsProvider, 0);
  objc_storeStrong((id *)&self->_diagnosticInfoProvider, 0);
}

- (void)gatherDiagnosticsWithOptions:(uint8_t *)buf completionHandler:(os_log_t)log .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Error creating directory at %{public}@, error: %{public}@", buf, 0x16u);

}

void __75__EDDiagnosticInfoGatherer_gatherDiagnosticsWithOptions_completionHandler___block_invoke_4_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a2, a3, "Error gathering diagnostics: %{public}@", (uint8_t *)&v3);
}

- (void)_copySearchIndexerDatabaseIntoDirectoryURL:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "Failed to compress Search Indexer database.", a5, a6, a7, a8, 0);
}

- (void)_copySearchIndexerDatabaseIntoDirectoryURL:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "Failed to copy Search Indexer database.", a5, a6, a7, a8, 0);
}

void __90__EDDiagnosticInfoGatherer__downloadMessagesWithObjectIDs_directoryURL_completionPromise___block_invoke_41_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a3, (uint64_t)a3, "Error requesting representation: %{public}@", (uint8_t *)a2);

}

@end

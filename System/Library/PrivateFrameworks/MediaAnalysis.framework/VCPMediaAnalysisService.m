@implementation VCPMediaAnalysisService

- (VCPMediaAnalysisService)init
{
  VCPMediaAnalysisService *v2;
  VCPMediaAnalysisService *v3;
  NSXPCConnection *connection;
  dispatch_queue_t v5;
  OS_dispatch_queue *managementQueue;
  dispatch_queue_t v7;
  OS_dispatch_queue *handlerQueue;
  uint64_t v9;
  NSMutableDictionary *progressBlocks;
  VCPMediaAnalysisService *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VCPMediaAnalysisService;
  v2 = -[VCPMediaAnalysisService init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    connection = v2->_connection;
    v2->_connection = 0;

    v5 = dispatch_queue_create("com.apple.mediaanalysis.service.management", 0);
    managementQueue = v3->_managementQueue;
    v3->_managementQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("com.apple.mediaanalysis.service.handler", 0);
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

+ (id)sharedAnalysisService
{
  if (+[VCPMediaAnalysisService sharedAnalysisService]::once != -1)
    dispatch_once(&+[VCPMediaAnalysisService sharedAnalysisService]::once, &__block_literal_global_10);
  return (id)+[VCPMediaAnalysisService sharedAnalysisService]::instance;
}

void __48__VCPMediaAnalysisService_sharedAnalysisService__block_invoke()
{
  VCPMediaAnalysisService *v0;
  void *v1;

  v0 = objc_alloc_init(VCPMediaAnalysisService);
  v1 = (void *)+[VCPMediaAnalysisService sharedAnalysisService]::instance;
  +[VCPMediaAnalysisService sharedAnalysisService]::instance = (uint64_t)v0;

}

+ (id)analysisService
{
  return objc_alloc_init((Class)objc_opt_class());
}

+ (id)errorWithDescription:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0CB2D50];
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("MediaAnalysisService"), 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)connection
{
  NSXPCConnection *connection;
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
  NSXPCConnection *v14;
  NSXPCConnection *v15;
  NSXPCConnection *v16;
  void *v17;
  NSXPCConnection *v18;
  _QWORD v20[5];
  _QWORD v21[3];
  _QWORD v22[8];
  _QWORD v23[9];

  v23[7] = *MEMORY[0x1E0C80C00];
  connection = self->_connection;
  if (!connection)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1A27D0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0C99E60];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v23[2] = objc_opt_class();
    v23[3] = objc_opt_class();
    v23[4] = objc_opt_class();
    v23[5] = objc_opt_class();
    v23[6] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_requestAssetProcessing_withTaskID_forLocalIdentifiers_fromPhotoLibraryWithURL_withOptions_andReply_, 0, 1);

    v8 = (void *)MEMORY[0x1E0C99E60];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v22[2] = objc_opt_class();
    v22[3] = objc_opt_class();
    v22[4] = objc_opt_class();
    v22[5] = objc_opt_class();
    v22[6] = objc_opt_class();
    v22[7] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_requestURLAssetAnalysis_forAssetWithResourcePaths_withOptions_analysisTypes_sandboxTokens_withReply_, 0, 1);

    v11 = (void *)MEMORY[0x1E0C99E60];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_queryAssetsPendingDeferredProcessingWithPhotoLibraryURL_andReply_, 0, 1);

    v14 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.mediaanalysisd.analysis"), 0);
    v15 = self->_connection;
    self->_connection = v14;

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v4);
    v16 = self->_connection;
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF157608);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v16, "setExportedInterface:", v17);

    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_345);
    v18 = self->_connection;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __37__VCPMediaAnalysisService_connection__block_invoke_346;
    v20[3] = &unk_1E6B15468;
    v20[4] = self;
    -[NSXPCConnection setInvalidationHandler:](v18, "setInvalidationHandler:", v20);
    -[NSXPCConnection resume](self->_connection, "resume");

    connection = self->_connection;
  }
  return connection;
}

void __37__VCPMediaAnalysisService_connection__block_invoke()
{
  uint8_t v0[16];

  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Media analysis client XPC connection interrupted", v0, 2u);
  }
}

void __37__VCPMediaAnalysisService_connection__block_invoke_346(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint8_t v4[16];

  if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Media analysis client XPC connection invalidated", v4, 2u);
  }
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

}

- (int)requestAnalysisTypes:(unint64_t)a3 forAssetWithResourceURLs:(id)a4 withOptions:(id)a5 progressHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  NSObject *managementQueue;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v35;
  void (**v36)(_QWORD, _QWORD, _QWORD);
  void *v38;
  id v39;
  id obj;
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  id v45;
  void (**v46)(_QWORD, _QWORD, _QWORD);
  __int128 *p_buf;
  unint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD block[6];
  uint64_t v54;
  const __CFString *v55;
  uint8_t v56[128];
  __int128 buf;
  uint64_t v58;
  int v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v39 = a6;
  v13 = a7;
  v38 = v12;
  if (v11 && (objc_msgSend(v11, "count") == 1 || objc_msgSend(v11, "count") == 2))
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("InProcess"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void (**)(_QWORD, _QWORD, _QWORD))v13;
    v15 = objc_msgSend(v14, "BOOLValue");

    if (v15)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v58 = 0x2020000000;
      v59 = 0;
      managementQueue = self->_managementQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke;
      block[3] = &unk_1E6B158A0;
      block[4] = self;
      block[5] = &buf;
      dispatch_sync(managementQueue, block);
      +[VCPFullAnalysisURLProcessingTask taskForURLAsset:withOptions:analysisTypes:progressHandler:completionHandler:](VCPFullAnalysisURLProcessingTask, "taskForURLAsset:withOptions:analysisTypes:progressHandler:completionHandler:", v11, v12, a3, 0, v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "run");
      v18 = *(_DWORD *)(*((_QWORD *)&buf + 1) + 24);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      v35 = a3;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      obj = v11;
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v50;
        while (2)
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v50 != v22)
              objc_enumerationMutation(obj);
            v24 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
            objc_msgSend(v24, "path");
            v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v25, "UTF8String");
            v26 = (void *)sandbox_extension_issue_file();

            if (!v26)
            {
              if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v24, "path");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(buf) = 138412290;
                *(_QWORD *)((char *)&buf + 4) = v30;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to issue sandbox extension on %@", (uint8_t *)&buf, 0xCu);

              }
              v31 = (void *)MEMORY[0x1E0CB35C8];
              v54 = *MEMORY[0x1E0CB2D50];
              v55 = CFSTR("Error issuing sandbox extension");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], 1, v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              ((void (**)(_QWORD, _QWORD, void *))v36)[2](v36, 0, v33);
              v18 = 0;
              goto LABEL_23;
            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v27);

            objc_msgSend(v24, "path");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v28);

            free(v26);
          }
          v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
          if (v21)
            continue;
          break;
        }
      }

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v58 = 0x2020000000;
      v59 = 0;
      v29 = self->_managementQueue;
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke_351;
      v41[3] = &unk_1E6B15E58;
      p_buf = &buf;
      v41[4] = self;
      v45 = v39;
      v46 = v36;
      v42 = v20;
      v43 = v38;
      v48 = v35;
      v44 = v19;
      dispatch_sync(v29, v41);
      v18 = *(_DWORD *)(*((_QWORD *)&buf + 1) + 24);

      _Block_object_dispose(&buf, 8);
LABEL_23:

    }
    v13 = v36;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] [MediaAnalyzer requestAnalysisTypes] call with invalid resourceURLs", (uint8_t *)&buf, 2u);
    }
    (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, 0, 0);
    v18 = 0;
  }

  return v18;
}

uint64_t __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_DWORD *)(v1 + 40);
  *(_DWORD *)(v1 + 40) = v2 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  return result;
}

void __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke_351(uint64_t a1)
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
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  _QWORD v24[5];
  __int128 v25;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_QWORD *)(a1 + 64))
    v5 = *(const void **)(a1 + 64);
  else
    v5 = &__block_literal_global_353;
  v6 = _Block_copy(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke_3;
  v24[3] = &unk_1E6B15DB8;
  v24[4] = *(_QWORD *)(a1 + 32);
  v20 = *(_OWORD *)(a1 + 72);
  v10 = (id)v20;
  v25 = v20;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(a1 + 72);
  v12 = *(_QWORD *)(a1 + 80);
  v14 = *(unsigned int *)(*(_QWORD *)(v12 + 8) + 24);
  v15 = *(_QWORD *)(a1 + 88);
  v16 = *(_QWORD *)(a1 + 48);
  v17 = *(_QWORD *)(a1 + 56);
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke_3_359;
  v21[3] = &unk_1E6B15E30;
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(_QWORD *)(a1 + 40);
  v23 = v12;
  v21[4] = v18;
  v22 = v13;
  objc_msgSend(v11, "requestURLAssetAnalysis:forAssetWithResourcePaths:withOptions:analysisTypes:sandboxTokens:withReply:", v14, v19, v16, v15, v17, v21);

}

void __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to background analysis service", buf, 2u);
  }
  NSLog(CFSTR("[MediaAnalysis] Error connecting to background analysis service"));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke_356;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke_356(uint64_t a1)
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
  v5[2] = __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke_2_357;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke_2_357(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke_3_359(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD block[5];
  id v15;
  id v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v19 = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request %d has completed", buf, 8u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke_360;
  block[3] = &unk_1E6B15E08;
  block[4] = v8;
  v13 = *(_OWORD *)(a1 + 40);
  v10 = (id)v13;
  v17 = v13;
  v15 = v5;
  v16 = v6;
  v11 = v6;
  v12 = v5;
  dispatch_async(v9, block);

}

void __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke_360(uint64_t a1)
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
  block[2] = __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke_2_361;
  block[3] = &unk_1E6B15DE0;
  v8 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __122__VCPMediaAnalysisService_requestAnalysisTypes_forAssetWithResourceURLs_withOptions_progressHandler_andCompletionHandler___block_invoke_2_361(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestAnalysisTypes:(unint64_t)a3 forAssets:(id)a4 withOptions:(id)a5 progressHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  BOOL v25;
  void *v26;
  NSObject *v27;
  NSObject *managementQueue;
  void *v29;
  void *v30;
  int v31;
  unint64_t v33;
  void *v34;
  void (**v35)(id, _QWORD, void *);
  id v36;
  _QWORD block[5];
  id v38;
  id v39;
  id v40;
  id v41;
  void (**v42)(id, _QWORD, void *);
  uint64_t *v43;
  unint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[6];
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  int v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v36 = a4;
  v12 = a5;
  v13 = a6;
  v34 = v13;
  v35 = (void (**)(id, _QWORD, void *))a7;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("InProcess"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "BOOLValue"))
  {

LABEL_16:
    v50 = 0;
    v51 = &v50;
    v52 = 0x2020000000;
    v53 = 0;
    managementQueue = self->_managementQueue;
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke;
    v49[3] = &unk_1E6B158A0;
    v49[4] = self;
    v49[5] = &v50;
    dispatch_sync(managementQueue, v49);
    +[VCPFullAnalysisAssetProcessingTask taskWithAsset:andAnalysisTypes:andOptions:andProgressHandler:andCompletionHandler:](VCPFullAnalysisAssetProcessingTask, "taskWithAsset:andAnalysisTypes:andOptions:andProgressHandler:andCompletionHandler:", v36, a3, v12, v13, v35);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "run");
    v31 = *((_DWORD *)v51 + 6);

    _Block_object_dispose(&v50, 8);
    goto LABEL_18;
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AllowOnDemand"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  if ((v16 & 1) == 0)
    goto LABEL_16;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v18 = v36;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  v33 = a3;
  v20 = 0;
  if (v19)
  {
    v21 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v46 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        if (v20)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "photoLibrary");
          v24 = (id)objc_claimAutoreleasedReturnValue();
          v25 = v24 == v20;

          if (!v25)
          {
            objc_msgSend((id)objc_opt_class(), "errorWithDescription:", CFSTR("Assets from multiple libraries not supported"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v35[2](v35, 0, v30);

            v31 = 0;
            goto LABEL_17;
          }
        }
        else
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "photoLibrary");
          v20 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v23, "localIdentifier", v33);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v26);

      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    }
    while (v19);
  }

  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  v27 = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_2;
  block[3] = &unk_1E6B15E58;
  v43 = &v50;
  block[4] = self;
  v41 = v34;
  v42 = v35;
  v38 = v17;
  v20 = v20;
  v39 = v20;
  v40 = v12;
  v44 = v33;
  dispatch_sync(v27, block);
  v31 = *((_DWORD *)v51 + 6);

  _Block_object_dispose(&v50, 8);
LABEL_17:

LABEL_18:
  return v31;
}

uint64_t __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_DWORD *)(v1 + 40);
  *(_DWORD *)(v1 + 40) = v2 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  return result;
}

void __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_2(uint64_t a1)
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
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[5];
  __int128 v21;
  _QWORD v22[5];
  __int128 v23;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_QWORD *)(a1 + 64))
    v5 = *(const void **)(a1 + 64);
  else
    v5 = &__block_literal_global_367;
  v6 = _Block_copy(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_4;
  v22[3] = &unk_1E6B15DB8;
  v22[4] = *(_QWORD *)(a1 + 32);
  v18 = *(_OWORD *)(a1 + 72);
  v10 = (id)v18;
  v23 = v18;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "photoLibraryURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 56);
  v16 = *(_QWORD *)(a1 + 88);
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_3_370;
  v20[3] = &unk_1E6B15E30;
  v20[4] = *(_QWORD *)(a1 + 32);
  v19 = *(_OWORD *)(a1 + 72);
  v17 = (id)v19;
  v21 = v19;
  objc_msgSend(v11, "requestAssetAnalysis:forLocalIdentifiers:fromPhotoLibraryWithURL:withOptions:analysisTypes:withReply:", v12, v13, v14, v15, v16, v20);

}

void __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to background analysis service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_368;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_368(uint64_t a1)
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
  v5[2] = __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_2_369;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_2_369(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_3_370(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD block[5];
  id v15;
  id v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v19 = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request %d has completed", buf, 8u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_371;
  block[3] = &unk_1E6B15E08;
  block[4] = v8;
  v13 = *(_OWORD *)(a1 + 40);
  v10 = (id)v13;
  v17 = v13;
  v15 = v5;
  v16 = v6;
  v11 = v6;
  v12 = v5;
  dispatch_async(v9, block);

}

void __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_371(uint64_t a1)
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
  block[2] = __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_2_372;
  block[3] = &unk_1E6B15DE0;
  v8 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __107__VCPMediaAnalysisService_requestAnalysisTypes_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_2_372(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestBackgroundAnalysisForAssets:(id)a3 fromPhotoLibraryWithURL:(id)a4 realTime:(BOOL)a5 progessHandler:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *managementQueue;
  int v17;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (v12 && objc_msgSend(v12, "count"))
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    managementQueue = self->_managementQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __128__VCPMediaAnalysisService_requestBackgroundAnalysisForAssets_fromPhotoLibraryWithURL_realTime_progessHandler_completionHandler___block_invoke;
    block[3] = &unk_1E6B15E80;
    v24 = &v26;
    block[4] = self;
    v22 = v14;
    v23 = v15;
    v20 = v13;
    v21 = v12;
    v25 = a5;
    dispatch_sync(managementQueue, block);
    v17 = *((_DWORD *)v27 + 6);

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v15 + 2))(v15, 0, 0);
    v17 = 0;
  }

  return v17;
}

void __128__VCPMediaAnalysisService_requestBackgroundAnalysisForAssets_fromPhotoLibraryWithURL_realTime_progessHandler_completionHandler___block_invoke(uint64_t a1)
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
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  _QWORD v23[5];
  __int128 v24;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_QWORD *)(a1 + 56))
    v5 = *(const void **)(a1 + 56);
  else
    v5 = &__block_literal_global_373;
  v6 = _Block_copy(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __128__VCPMediaAnalysisService_requestBackgroundAnalysisForAssets_fromPhotoLibraryWithURL_realTime_progessHandler_completionHandler___block_invoke_3;
  v23[3] = &unk_1E6B15DB8;
  v23[4] = *(_QWORD *)(a1 + 32);
  v19 = *(_OWORD *)(a1 + 64);
  v10 = (id)v19;
  v24 = v19;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(a1 + 64);
  v12 = *(_QWORD *)(a1 + 72);
  v14 = *(unsigned int *)(*(_QWORD *)(v12 + 8) + 24);
  v15 = *(unsigned __int8 *)(a1 + 80);
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __128__VCPMediaAnalysisService_requestBackgroundAnalysisForAssets_fromPhotoLibraryWithURL_realTime_progessHandler_completionHandler___block_invoke_3_376;
  v20[3] = &unk_1E6B15E30;
  v17 = *(_QWORD *)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 48);
  v18 = *(_QWORD *)(a1 + 32);
  v22 = v12;
  v20[4] = v18;
  v21 = v13;
  objc_msgSend(v11, "requestAssetAnalysis:forPhotoLibraryURL:withLocalIdentifiers:realTime:withReply:", v14, v17, v16, v15, v20);

}

void __128__VCPMediaAnalysisService_requestBackgroundAnalysisForAssets_fromPhotoLibraryWithURL_realTime_progessHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to background analysis service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __128__VCPMediaAnalysisService_requestBackgroundAnalysisForAssets_fromPhotoLibraryWithURL_realTime_progessHandler_completionHandler___block_invoke_374;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __128__VCPMediaAnalysisService_requestBackgroundAnalysisForAssets_fromPhotoLibraryWithURL_realTime_progessHandler_completionHandler___block_invoke_374(uint64_t a1)
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
  v5[2] = __128__VCPMediaAnalysisService_requestBackgroundAnalysisForAssets_fromPhotoLibraryWithURL_realTime_progessHandler_completionHandler___block_invoke_2_375;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __128__VCPMediaAnalysisService_requestBackgroundAnalysisForAssets_fromPhotoLibraryWithURL_realTime_progessHandler_completionHandler___block_invoke_2_375(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __128__VCPMediaAnalysisService_requestBackgroundAnalysisForAssets_fromPhotoLibraryWithURL_realTime_progessHandler_completionHandler___block_invoke_3_376(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD block[5];
  id v15;
  id v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v19 = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request %d has completed", buf, 8u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __128__VCPMediaAnalysisService_requestBackgroundAnalysisForAssets_fromPhotoLibraryWithURL_realTime_progessHandler_completionHandler___block_invoke_377;
  block[3] = &unk_1E6B15E08;
  block[4] = v8;
  v13 = *(_OWORD *)(a1 + 40);
  v10 = (id)v13;
  v17 = v13;
  v15 = v5;
  v16 = v6;
  v11 = v6;
  v12 = v5;
  dispatch_async(v9, block);

}

void __128__VCPMediaAnalysisService_requestBackgroundAnalysisForAssets_fromPhotoLibraryWithURL_realTime_progessHandler_completionHandler___block_invoke_377(uint64_t a1)
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
  block[2] = __128__VCPMediaAnalysisService_requestBackgroundAnalysisForAssets_fromPhotoLibraryWithURL_realTime_progessHandler_completionHandler___block_invoke_2_378;
  block[3] = &unk_1E6B15DE0;
  v8 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __128__VCPMediaAnalysisService_requestBackgroundAnalysisForAssets_fromPhotoLibraryWithURL_realTime_progessHandler_completionHandler___block_invoke_2_378(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestBackgroundAnalysisForAssets:(id)a3 realTime:(BOOL)a4 progessHandler:(id)a5 completionHandler:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  void *v13;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0CD16F0], "vcp_defaultURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = -[VCPMediaAnalysisService requestBackgroundAnalysisForAssets:fromPhotoLibraryWithURL:realTime:progessHandler:completionHandler:](self, "requestBackgroundAnalysisForAssets:fromPhotoLibraryWithURL:realTime:progessHandler:completionHandler:", v10, v13, v8, v11, v12);

  return v8;
}

- (int)requestProcessingWithTaskID:(unint64_t)a3 forPhotoLibrary:(id)a4 withOptions:(id)a5 progessHandler:(id)a6 andCompletionHandler:(id)a7
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
  block[2] = __119__VCPMediaAnalysisService_requestProcessingWithTaskID_forPhotoLibrary_withOptions_progessHandler_andCompletionHandler___block_invoke;
  block[3] = &unk_1E6B15EF0;
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

void __119__VCPMediaAnalysisService_requestProcessingWithTaskID_forPhotoLibrary_withOptions_progessHandler_andCompletionHandler___block_invoke(uint64_t a1)
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
  id v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[5];
  __int128 v20;
  _QWORD v21[5];
  __int128 v22;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_QWORD *)(a1 + 56))
    v5 = *(const void **)(a1 + 56);
  else
    v5 = &__block_literal_global_380;
  v6 = _Block_copy(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __119__VCPMediaAnalysisService_requestProcessingWithTaskID_forPhotoLibrary_withOptions_progessHandler_andCompletionHandler___block_invoke_3;
  v21[3] = &unk_1E6B15DB8;
  v21[4] = *(_QWORD *)(a1 + 32);
  v17 = *(_OWORD *)(a1 + 64);
  v10 = (id)v17;
  v22 = v17;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 80);
  v13 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 40), "photoLibraryURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 48);
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __119__VCPMediaAnalysisService_requestProcessingWithTaskID_forPhotoLibrary_withOptions_progessHandler_andCompletionHandler___block_invoke_3_383;
  v19[3] = &unk_1E6B15EC8;
  v19[4] = *(_QWORD *)(a1 + 32);
  v18 = *(_OWORD *)(a1 + 64);
  v16 = (id)v18;
  v20 = v18;
  objc_msgSend(v11, "requestLibraryProcessing:withTaskID:forPhotoLibraryURL:withOptions:andReply:", v13, v12, v14, v15, v19);

}

void __119__VCPMediaAnalysisService_requestProcessingWithTaskID_forPhotoLibrary_withOptions_progessHandler_andCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to Photos background analysis service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __119__VCPMediaAnalysisService_requestProcessingWithTaskID_forPhotoLibrary_withOptions_progessHandler_andCompletionHandler___block_invoke_381;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __119__VCPMediaAnalysisService_requestProcessingWithTaskID_forPhotoLibrary_withOptions_progessHandler_andCompletionHandler___block_invoke_381(uint64_t a1)
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
  v5[2] = __119__VCPMediaAnalysisService_requestProcessingWithTaskID_forPhotoLibrary_withOptions_progessHandler_andCompletionHandler___block_invoke_2_382;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __119__VCPMediaAnalysisService_requestProcessingWithTaskID_forPhotoLibrary_withOptions_progessHandler_andCompletionHandler___block_invoke_2_382(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __119__VCPMediaAnalysisService_requestProcessingWithTaskID_forPhotoLibrary_withOptions_progessHandler_andCompletionHandler___block_invoke_3_383(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[5];
  id v11;
  __int128 v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v14 = v4;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request %d has completed", buf, 8u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __119__VCPMediaAnalysisService_requestProcessingWithTaskID_forPhotoLibrary_withOptions_progessHandler_andCompletionHandler___block_invoke_384;
  block[3] = &unk_1E6B15D90;
  block[4] = v5;
  v9 = *(_OWORD *)(a1 + 40);
  v7 = (id)v9;
  v12 = v9;
  v11 = v3;
  v8 = v3;
  dispatch_async(v6, block);

}

void __119__VCPMediaAnalysisService_requestProcessingWithTaskID_forPhotoLibrary_withOptions_progessHandler_andCompletionHandler___block_invoke_384(uint64_t a1)
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
  v5[2] = __119__VCPMediaAnalysisService_requestProcessingWithTaskID_forPhotoLibrary_withOptions_progessHandler_andCompletionHandler___block_invoke_2_385;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __119__VCPMediaAnalysisService_requestProcessingWithTaskID_forPhotoLibrary_withOptions_progessHandler_andCompletionHandler___block_invoke_2_385(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (int)requestBackgroundProcessingWithTaskID:(unint64_t)a3 forPhotoLibrary:(id)a4 progessHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  int v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (a3 <= 7 && ((1 << a3) & 0x8E) != 0)
  {
    v13 = -[VCPMediaAnalysisService requestProcessingWithTaskID:forPhotoLibrary:withOptions:progessHandler:andCompletionHandler:](self, "requestProcessingWithTaskID:forPhotoLibrary:withOptions:progessHandler:andCompletionHandler:", a3, v10, 0, v11, v12);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v15 = 134217984;
      v16 = a3;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Unsupported task %lu", (uint8_t *)&v15, 0xCu);
    }
    v13 = -1;
  }

  return v13;
}

- (int)requestSceneProcessingForPhotoLibrary:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  return -[VCPMediaAnalysisService requestProcessingWithTaskID:forPhotoLibrary:withOptions:progessHandler:andCompletionHandler:](self, "requestProcessingWithTaskID:forPhotoLibrary:withOptions:progessHandler:andCompletionHandler:", 2, a3, a4, a5, a6);
}

- (int)requestFaceProcessingForPhotoLibrary:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  return -[VCPMediaAnalysisService requestProcessingWithTaskID:forPhotoLibrary:withOptions:progessHandler:andCompletionHandler:](self, "requestProcessingWithTaskID:forPhotoLibrary:withOptions:progessHandler:andCompletionHandler:", 3, a3, a4, a5, a6);
}

- (int)requestMultiWorkerProcessingForPhotoLibrary:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  return -[VCPMediaAnalysisService requestProcessingWithTaskID:forPhotoLibrary:withOptions:progessHandler:andCompletionHandler:](self, "requestProcessingWithTaskID:forPhotoLibrary:withOptions:progessHandler:andCompletionHandler:", 7, a3, a4, a5, a6);
}

- (int)requestFullProcessingForPhotoLibrary:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  return -[VCPMediaAnalysisService requestProcessingWithTaskID:forPhotoLibrary:withOptions:progessHandler:andCompletionHandler:](self, "requestProcessingWithTaskID:forPhotoLibrary:withOptions:progessHandler:andCompletionHandler:", 1, a3, a4, a5, a6);
}

- (int)requestVideoCaptionForFrames:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *managementQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  managementQueue = self->_managementQueue;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __105__VCPMediaAnalysisService_requestVideoCaptionForFrames_withOptions_progressHandler_andCompletionHandler___block_invoke;
  v20[3] = &unk_1E6B15F38;
  v24 = v13;
  v25 = &v26;
  v20[4] = self;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v15 = v11;
  v16 = v10;
  v17 = v13;
  v18 = v12;
  dispatch_sync(managementQueue, v20);
  LODWORD(v10) = *((_DWORD *)v27 + 6);

  _Block_object_dispose(&v26, 8);
  return (int)v10;
}

void __105__VCPMediaAnalysisService_requestVideoCaptionForFrames_withOptions_progressHandler_andCompletionHandler___block_invoke(uint64_t a1)
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
  void *v13;
  uint64_t v14;
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
    v5 = &__block_literal_global_386;
  v6 = _Block_copy(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __105__VCPMediaAnalysisService_requestVideoCaptionForFrames_withOptions_progressHandler_andCompletionHandler___block_invoke_3;
  v22[3] = &unk_1E6B15DB8;
  v22[4] = *(_QWORD *)(a1 + 32);
  v18 = *(_OWORD *)(a1 + 64);
  v10 = (id)v18;
  v23 = v18;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(a1 + 64);
  v12 = *(_QWORD *)(a1 + 72);
  v14 = *(unsigned int *)(*(_QWORD *)(v12 + 8) + 24);
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __105__VCPMediaAnalysisService_requestVideoCaptionForFrames_withOptions_progressHandler_andCompletionHandler___block_invoke_3_389;
  v19[3] = &unk_1E6B15E30;
  v16 = *(_QWORD *)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 48);
  v17 = *(_QWORD *)(a1 + 32);
  v21 = v12;
  v19[4] = v17;
  v20 = v13;
  objc_msgSend(v11, "requestVideoFramesProcessing:withTaskID:frames:options:andReply:", v14, 15, v16, v15, v19);

}

void __105__VCPMediaAnalysisService_requestVideoCaptionForFrames_withOptions_progressHandler_andCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to Photos background analysis service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__VCPMediaAnalysisService_requestVideoCaptionForFrames_withOptions_progressHandler_andCompletionHandler___block_invoke_387;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __105__VCPMediaAnalysisService_requestVideoCaptionForFrames_withOptions_progressHandler_andCompletionHandler___block_invoke_387(uint64_t a1)
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
  v5[2] = __105__VCPMediaAnalysisService_requestVideoCaptionForFrames_withOptions_progressHandler_andCompletionHandler___block_invoke_2_388;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __105__VCPMediaAnalysisService_requestVideoCaptionForFrames_withOptions_progressHandler_andCompletionHandler___block_invoke_2_388(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __105__VCPMediaAnalysisService_requestVideoCaptionForFrames_withOptions_progressHandler_andCompletionHandler___block_invoke_3_389(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD block[5];
  id v15;
  id v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v19 = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Asset processing request %d has completed", buf, 8u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__VCPMediaAnalysisService_requestVideoCaptionForFrames_withOptions_progressHandler_andCompletionHandler___block_invoke_390;
  block[3] = &unk_1E6B15E08;
  block[4] = v8;
  v13 = *(_OWORD *)(a1 + 40);
  v10 = (id)v13;
  v17 = v13;
  v15 = v5;
  v16 = v6;
  v11 = v6;
  v12 = v5;
  dispatch_async(v9, block);

}

void __105__VCPMediaAnalysisService_requestVideoCaptionForFrames_withOptions_progressHandler_andCompletionHandler___block_invoke_390(uint64_t a1)
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
  block[2] = __105__VCPMediaAnalysisService_requestVideoCaptionForFrames_withOptions_progressHandler_andCompletionHandler___block_invoke_2_391;
  block[3] = &unk_1E6B15DE0;
  v8 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __105__VCPMediaAnalysisService_requestVideoCaptionForFrames_withOptions_progressHandler_andCompletionHandler___block_invoke_2_391(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestRecentsProcessing:(unint64_t)a3 photoLibrary:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *managementQueue;
  id v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  managementQueue = self->_managementQueue;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __99__VCPMediaAnalysisService_requestRecentsProcessing_photoLibrary_progressHandler_completionHandler___block_invoke;
  v18[3] = &unk_1E6B15F60;
  v20 = v11;
  v21 = v12;
  v22 = &v24;
  v23 = a3;
  v18[4] = self;
  v19 = v10;
  v14 = v10;
  v15 = v12;
  v16 = v11;
  dispatch_sync(managementQueue, v18);
  LODWORD(self) = *((_DWORD *)v25 + 6);

  _Block_object_dispose(&v24, 8);
  return (int)self;
}

void __99__VCPMediaAnalysisService_requestRecentsProcessing_photoLibrary_progressHandler_completionHandler___block_invoke(uint64_t a1)
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
  id v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[5];
  __int128 v19;
  _QWORD v20[5];
  __int128 v21;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_QWORD *)(a1 + 48))
    v5 = *(const void **)(a1 + 48);
  else
    v5 = &__block_literal_global_392;
  v6 = _Block_copy(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __99__VCPMediaAnalysisService_requestRecentsProcessing_photoLibrary_progressHandler_completionHandler___block_invoke_3;
  v20[3] = &unk_1E6B15DB8;
  v20[4] = *(_QWORD *)(a1 + 32);
  v16 = *(_OWORD *)(a1 + 56);
  v10 = (id)v16;
  v21 = v16;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 72);
  v13 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 40), "photoLibraryURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __99__VCPMediaAnalysisService_requestRecentsProcessing_photoLibrary_progressHandler_completionHandler___block_invoke_3_395;
  v18[3] = &unk_1E6B15EC8;
  v18[4] = *(_QWORD *)(a1 + 32);
  v17 = *(_OWORD *)(a1 + 56);
  v15 = (id)v17;
  v19 = v17;
  objc_msgSend(v11, "requestRecentsProcessing:withTaskID:photoLibraryWithURL:reply:", v13, v12, v14, v18);

}

void __99__VCPMediaAnalysisService_requestRecentsProcessing_photoLibrary_progressHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to Photos background analysis service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__VCPMediaAnalysisService_requestRecentsProcessing_photoLibrary_progressHandler_completionHandler___block_invoke_393;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __99__VCPMediaAnalysisService_requestRecentsProcessing_photoLibrary_progressHandler_completionHandler___block_invoke_393(uint64_t a1)
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
  v5[2] = __99__VCPMediaAnalysisService_requestRecentsProcessing_photoLibrary_progressHandler_completionHandler___block_invoke_2_394;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __99__VCPMediaAnalysisService_requestRecentsProcessing_photoLibrary_progressHandler_completionHandler___block_invoke_2_394(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __99__VCPMediaAnalysisService_requestRecentsProcessing_photoLibrary_progressHandler_completionHandler___block_invoke_3_395(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[5];
  id v11;
  __int128 v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v14 = v4;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Asset processing request %d has completed", buf, 8u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__VCPMediaAnalysisService_requestRecentsProcessing_photoLibrary_progressHandler_completionHandler___block_invoke_396;
  block[3] = &unk_1E6B15D90;
  block[4] = v5;
  v9 = *(_OWORD *)(a1 + 40);
  v7 = (id)v9;
  v12 = v9;
  v11 = v3;
  v8 = v3;
  dispatch_async(v6, block);

}

void __99__VCPMediaAnalysisService_requestRecentsProcessing_photoLibrary_progressHandler_completionHandler___block_invoke_396(uint64_t a1)
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
  v5[2] = __99__VCPMediaAnalysisService_requestRecentsProcessing_photoLibrary_progressHandler_completionHandler___block_invoke_2_397;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __99__VCPMediaAnalysisService_requestRecentsProcessing_photoLibrary_progressHandler_completionHandler___block_invoke_2_397(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (int)requestProcessingWithTaskID:(unint64_t)a3 forAssets:(id)a4 withOptions:(id)a5 progressHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  BOOL v22;
  void *v23;
  NSObject *managementQueue;
  void *v25;
  int v26;
  unint64_t v28;
  id v29;
  id v30;
  _QWORD block[5];
  id v32;
  id v33;
  id v34;
  id v35;
  void (**v36)(id, _QWORD, void *);
  uint64_t *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  int v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v29 = a5;
  v30 = a6;
  v13 = (void (**)(id, _QWORD, void *))a7;
  objc_msgSend(MEMORY[0x1E0C99E20], "set", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v15 = v12;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  v28 = a3;
  v17 = 0;
  if (v16)
  {
    v18 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v44 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        if (v17)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "photoLibrary");
          v21 = (id)objc_claimAutoreleasedReturnValue();
          v22 = v21 == v17;

          if (!v22)
          {
            objc_msgSend((id)objc_opt_class(), "errorWithDescription:", CFSTR("Assets from multiple libraries not supported"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v13[2](v13, 0, v25);

            v26 = 0;
            goto LABEL_13;
          }
        }
        else
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "photoLibrary");
          v17 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v20, "localIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v23);

      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v16);
  }

  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114__VCPMediaAnalysisService_requestProcessingWithTaskID_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke;
  block[3] = &unk_1E6B15E58;
  v37 = &v39;
  block[4] = self;
  v35 = v30;
  v36 = v13;
  v38 = v28;
  v32 = v14;
  v17 = v17;
  v33 = v17;
  v34 = v29;
  dispatch_sync(managementQueue, block);
  v26 = *((_DWORD *)v40 + 6);

  _Block_object_dispose(&v39, 8);
LABEL_13:

  return v26;
}

void __114__VCPMediaAnalysisService_requestProcessingWithTaskID_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke(uint64_t a1)
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
  void *v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[5];
  __int128 v21;
  _QWORD v22[5];
  __int128 v23;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_QWORD *)(a1 + 64))
    v5 = *(const void **)(a1 + 64);
  else
    v5 = &__block_literal_global_398;
  v6 = _Block_copy(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __114__VCPMediaAnalysisService_requestProcessingWithTaskID_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_3;
  v22[3] = &unk_1E6B15DB8;
  v22[4] = *(_QWORD *)(a1 + 32);
  v18 = *(_OWORD *)(a1 + 72);
  v10 = (id)v18;
  v23 = v18;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 88);
  v13 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "photoLibraryURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(a1 + 56);
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __114__VCPMediaAnalysisService_requestProcessingWithTaskID_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_3_401;
  v20[3] = &unk_1E6B15E30;
  v20[4] = *(_QWORD *)(a1 + 32);
  v19 = *(_OWORD *)(a1 + 72);
  v17 = (id)v19;
  v21 = v19;
  objc_msgSend(v11, "requestAssetProcessing:withTaskID:forLocalIdentifiers:fromPhotoLibraryWithURL:withOptions:andReply:", v13, v12, v14, v15, v16, v20);

}

void __114__VCPMediaAnalysisService_requestProcessingWithTaskID_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to Photos background analysis service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114__VCPMediaAnalysisService_requestProcessingWithTaskID_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_399;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __114__VCPMediaAnalysisService_requestProcessingWithTaskID_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_399(uint64_t a1)
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
  v5[2] = __114__VCPMediaAnalysisService_requestProcessingWithTaskID_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_2_400;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __114__VCPMediaAnalysisService_requestProcessingWithTaskID_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_2_400(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __114__VCPMediaAnalysisService_requestProcessingWithTaskID_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_3_401(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD block[5];
  id v15;
  id v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v19 = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Asset processing request %d has completed", buf, 8u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114__VCPMediaAnalysisService_requestProcessingWithTaskID_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_402;
  block[3] = &unk_1E6B15E08;
  block[4] = v8;
  v13 = *(_OWORD *)(a1 + 40);
  v10 = (id)v13;
  v17 = v13;
  v15 = v5;
  v16 = v6;
  v11 = v6;
  v12 = v5;
  dispatch_async(v9, block);

}

void __114__VCPMediaAnalysisService_requestProcessingWithTaskID_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_402(uint64_t a1)
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
  block[2] = __114__VCPMediaAnalysisService_requestProcessingWithTaskID_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_2_403;
  block[3] = &unk_1E6B15DE0;
  v8 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __114__VCPMediaAnalysisService_requestProcessingWithTaskID_forAssets_withOptions_progressHandler_andCompletionHandler___block_invoke_2_403(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestLivePhotoEffectsForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v10 = a6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __109__VCPMediaAnalysisService_requestLivePhotoEffectsForAssets_withOptions_progressHandler_andCompletionHandler___block_invoke;
  v13[3] = &unk_1E6B15F88;
  v14 = v10;
  v11 = v10;
  LODWORD(a5) = -[VCPMediaAnalysisService requestProcessingWithTaskID:forAssets:withOptions:progressHandler:andCompletionHandler:](self, "requestProcessingWithTaskID:forAssets:withOptions:progressHandler:andCompletionHandler:", 4, a3, a4, a5, v13);

  return (int)a5;
}

uint64_t __109__VCPMediaAnalysisService_requestLivePhotoEffectsForAssets_withOptions_progressHandler_andCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int)requestSceneProcessingForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v10 = a6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __108__VCPMediaAnalysisService_requestSceneProcessingForAssets_withOptions_progressHandler_andCompletionHandler___block_invoke;
  v13[3] = &unk_1E6B15F88;
  v14 = v10;
  v11 = v10;
  LODWORD(a5) = -[VCPMediaAnalysisService requestProcessingWithTaskID:forAssets:withOptions:progressHandler:andCompletionHandler:](self, "requestProcessingWithTaskID:forAssets:withOptions:progressHandler:andCompletionHandler:", 2, a3, a4, a5, v13);

  return (int)a5;
}

uint64_t __108__VCPMediaAnalysisService_requestSceneProcessingForAssets_withOptions_progressHandler_andCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int)requestFaceProcessingForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v10 = a6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __107__VCPMediaAnalysisService_requestFaceProcessingForAssets_withOptions_progressHandler_andCompletionHandler___block_invoke;
  v13[3] = &unk_1E6B15F88;
  v14 = v10;
  v11 = v10;
  LODWORD(a5) = -[VCPMediaAnalysisService requestProcessingWithTaskID:forAssets:withOptions:progressHandler:andCompletionHandler:](self, "requestProcessingWithTaskID:forAssets:withOptions:progressHandler:andCompletionHandler:", 3, a3, a4, a5, v13);

  return (int)a5;
}

uint64_t __107__VCPMediaAnalysisService_requestFaceProcessingForAssets_withOptions_progressHandler_andCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int)requestQuickFaceIdentificationForPhotoLibraryURL:(id)a3 withOptions:(id)a4 andCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  NSObject *managementQueue;
  id v14;
  id v15;
  id v16;
  int v17;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  uint8_t *v23;
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  int v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("InProcess"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (v12 && (int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "In-Process quick face identification not supported", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v25 = buf;
  v26 = 0x2020000000;
  v27 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__VCPMediaAnalysisService_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke;
  block[3] = &unk_1E6B15FB0;
  v22 = v10;
  v23 = buf;
  block[4] = self;
  v20 = v8;
  v21 = v9;
  v14 = v9;
  v15 = v8;
  v16 = v10;
  dispatch_sync(managementQueue, block);
  v17 = *((_DWORD *)v25 + 6);

  _Block_object_dispose(buf, 8);
  return v17;
}

void __109__VCPMediaAnalysisService_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  _QWORD v19[5];
  __int128 v20;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", &__block_literal_global_404, v5);

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __109__VCPMediaAnalysisService_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke_3;
  v19[3] = &unk_1E6B15DB8;
  v19[4] = *(_QWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 56);
  v8 = (id)v15;
  v20 = v15;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 64);
  v11 = *(unsigned int *)(*(_QWORD *)(v10 + 8) + 24);
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __109__VCPMediaAnalysisService_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke_3_407;
  v16[3] = &unk_1E6B15EC8;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 40);
  v18 = v10;
  v16[4] = v12;
  v14 = *(_QWORD *)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  objc_msgSend(v9, "requestLibraryProcessing:withTaskID:forPhotoLibraryURL:withOptions:andReply:", v11, 8, v13, v14, v16);

}

void __109__VCPMediaAnalysisService_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to Photos Quick Face Identification service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__VCPMediaAnalysisService_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke_405;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __109__VCPMediaAnalysisService_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke_405(uint64_t a1)
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
  v5[2] = __109__VCPMediaAnalysisService_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke_2_406;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __109__VCPMediaAnalysisService_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke_2_406(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __109__VCPMediaAnalysisService_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke_3_407(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[5];
  id v11;
  __int128 v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v14 = v4;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Asset processing request %d has completed", buf, 8u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__VCPMediaAnalysisService_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke_408;
  block[3] = &unk_1E6B15D90;
  block[4] = v5;
  v9 = *(_OWORD *)(a1 + 40);
  v7 = (id)v9;
  v12 = v9;
  v11 = v3;
  v8 = v3;
  dispatch_async(v6, block);

}

void __109__VCPMediaAnalysisService_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke_408(uint64_t a1)
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
  v5[2] = __109__VCPMediaAnalysisService_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke_2_409;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __109__VCPMediaAnalysisService_requestQuickFaceIdentificationForPhotoLibraryURL_withOptions_andCompletionHandler___block_invoke_2_409(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (int)requestSceneprintProcessingForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  NSObject *managementQueue;
  void *v17;
  int v18;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("InProcess"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  if (v15)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    managementQueue = self->_managementQueue;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __113__VCPMediaAnalysisService_requestSceneprintProcessingForAssets_withOptions_progressHandler_andCompletionHandler___block_invoke;
    v20[3] = &unk_1E6B158A0;
    v20[4] = self;
    v20[5] = &v21;
    dispatch_sync(managementQueue, v20);
    +[VCPPhotosSceneprintAssetProcessingTask taskWithAssets:options:andCompletionHandler:](VCPPhotosSceneprintAssetProcessingTask, "taskWithAssets:options:andCompletionHandler:", v10, v11, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "run");
    v18 = *((_DWORD *)v22 + 6);

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v18 = -[VCPMediaAnalysisService requestProcessingWithTaskID:forAssets:withOptions:progressHandler:andCompletionHandler:](self, "requestProcessingWithTaskID:forAssets:withOptions:progressHandler:andCompletionHandler:", 5, v10, v11, v12, v13);
  }

  return v18;
}

uint64_t __113__VCPMediaAnalysisService_requestSceneprintProcessingForAssets_withOptions_progressHandler_andCompletionHandler___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_DWORD *)(v1 + 40);
  *(_DWORD *)(v1 + 40) = v2 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  return result;
}

- (int)requestVideoStabilizationForAssets:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  NSObject *managementQueue;
  void *v17;
  int v18;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("InProcess"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  if (v15)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    managementQueue = self->_managementQueue;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __111__VCPMediaAnalysisService_requestVideoStabilizationForAssets_withOptions_progressHandler_andCompletionHandler___block_invoke;
    v20[3] = &unk_1E6B158A0;
    v20[4] = self;
    v20[5] = &v21;
    dispatch_sync(managementQueue, v20);
    +[VCPVideoStabilizationAssetProcessingTask taskWithAssets:andOptions:andCompletionHandler:](VCPVideoStabilizationAssetProcessingTask, "taskWithAssets:andOptions:andCompletionHandler:", v10, v11, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "run");
    v18 = *((_DWORD *)v22 + 6);

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v18 = -[VCPMediaAnalysisService requestProcessingWithTaskID:forAssets:withOptions:progressHandler:andCompletionHandler:](self, "requestProcessingWithTaskID:forAssets:withOptions:progressHandler:andCompletionHandler:", 6, v10, v11, v12, v13);
  }

  return v18;
}

uint64_t __111__VCPMediaAnalysisService_requestVideoStabilizationForAssets_withOptions_progressHandler_andCompletionHandler___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_DWORD *)(v1 + 40);
  *(_DWORD *)(v1 + 40) = v2 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  return result;
}

- (int)requestFRCForAssetURL:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *managementQueue;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  id v43;
  void (**v44)(id, _QWORD, void *);
  __int128 *p_buf;
  _QWORD v46[6];
  _QWORD block[6];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  void *v59;
  id v60;
  __int128 buf;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint64_t v66;
  _QWORD v67[3];

  v67[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  if (!v10)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] requestFRCForAssetURL call with invalid assetURL", (uint8_t *)&buf, 2u);
    }
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v66 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MediaAnalysis] requestFRCForAssetURL call with invalid assetURL"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, &v66, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v13[2](v13, 0, v25);
    goto LABEL_15;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("InProcess"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  if (!v15)
  {
    objc_msgSend(v10, "path");
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v26, "UTF8String");
    v27 = (void *)sandbox_extension_issue_file();

    if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "path");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      free(v27);
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v62 = 0x2020000000;
      LODWORD(v63) = 0;
      managementQueue = self->_managementQueue;
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_417;
      v39[3] = &unk_1E6B16048;
      p_buf = &buf;
      v39[4] = self;
      v43 = v12;
      v44 = v13;
      v40 = v29;
      v41 = v11;
      v42 = v28;
      v31 = v28;
      v32 = v29;
      dispatch_sync(managementQueue, v39);
      v20 = *(_DWORD *)(*((_QWORD *)&buf + 1) + 24);

      v21 = (uint64_t *)&buf;
      goto LABEL_10;
    }
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "path");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v33;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to issue sandbox extension on %@", (uint8_t *)&buf, 0xCu);

    }
    v34 = (void *)MEMORY[0x1E0CB35C8];
    v58 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MediaAnalysis] Error issuing sandbox extension"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v35;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v13[2](v13, 0, v37);
LABEL_15:
    v20 = 0;
    goto LABEL_16;
  }
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__5;
  v64 = __Block_byref_object_dispose__5;
  v65 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__5;
  v52 = __Block_byref_object_dispose__5;
  v53 = 0;
  v16 = self->_managementQueue;
  v17 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke;
  block[3] = &unk_1E6B158A0;
  block[4] = self;
  block[5] = &v54;
  dispatch_sync(v16, block);
  v60 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v17;
  v46[1] = 3221225472;
  v46[2] = __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_2;
  v46[3] = &unk_1E6B15FD8;
  v46[4] = &v48;
  v46[5] = &buf;
  +[VCPFullAnalysisURLProcessingTask taskForURLAsset:withOptions:analysisTypes:progressHandler:completionHandler:](VCPFullAnalysisURLProcessingTask, "taskForURLAsset:withOptions:analysisTypes:progressHandler:completionHandler:", v18, v11, 0x20000000, 0, v46);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "run");
  v13[2](v13, v49[5], *(void **)(*((_QWORD *)&buf + 1) + 40));
  v20 = *((_DWORD *)v55 + 6);

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&buf, 8);

  v21 = &v54;
LABEL_10:
  _Block_object_dispose(v21, 8);
LABEL_16:

  return v20;
}

uint64_t __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_DWORD *)(v1 + 40);
  *(_DWORD *)(v1 + 40) = v2 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  return result;
}

void __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  v5 = a3;
  objc_msgSend(v16, "vcp_results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("InterpolationResults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("attributes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("interpolationURL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v5;

}

void __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_417(uint64_t a1)
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
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[5];
  __int128 v20;
  _QWORD v21[5];
  __int128 v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_QWORD *)(a1 + 64))
    v5 = *(const void **)(a1 + 64);
  else
    v5 = &__block_literal_global_419;
  v6 = _Block_copy(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_3;
  v21[3] = &unk_1E6B15DB8;
  v21[4] = *(_QWORD *)(a1 + 32);
  v17 = *(_OWORD *)(a1 + 72);
  v10 = (id)v17;
  v22 = v17;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  v24[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 48);
  v23 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_3_422;
  v19[3] = &unk_1E6B16020;
  v19[4] = *(_QWORD *)(a1 + 32);
  v18 = *(_OWORD *)(a1 + 72);
  v16 = (id)v18;
  v20 = v18;
  objc_msgSend(v11, "requestURLAssetAnalysis:forAssetWithResourcePaths:withOptions:analysisTypes:sandboxTokens:withReply:", v12, v13, v14, 0x20000000, v15, v19);

}

void __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to FRC analysis service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_420;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_420(uint64_t a1)
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
  v5[2] = __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_2_421;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_2_421(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_3_422(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  __int128 v22;
  _QWORD block[5];
  id v24;
  id v25;
  __int128 v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "vcp_results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("InterpolationResults"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("attributes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("interpolationURL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (v6)
  {
    v12 = 0;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FRC gating not passed"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], 0, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v12 = 0;
    v6 = (id)v16;
  }
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(NSObject **)(v17 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_4;
  block[3] = &unk_1E6B15E08;
  block[4] = v17;
  v22 = *(_OWORD *)(a1 + 40);
  v19 = (id)v22;
  v26 = v22;
  v24 = v12;
  v25 = v6;
  v20 = v6;
  v21 = v12;
  dispatch_async(v18, block);

}

void __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_4(uint64_t a1)
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
  block[2] = __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_5;
  block[3] = &unk_1E6B15DE0;
  v8 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __98__VCPMediaAnalysisService_requestFRCForAssetURL_withOptions_progressHandler_andCompletionHandler___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestWallpaperUpgradeAtURL:(id)a3 toDestinationURL:(id)a4 withOptions:(id)a5 andCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, id);
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *managementQueue;
  int v22;
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
  void *v34;
  void *v35;
  _QWORD block[5];
  id v38;
  id v39;
  id v40;
  id v41;
  void (**v42)(id, _QWORD, id);
  __int128 *p_buf;
  __int128 buf;
  uint64_t v45;
  int v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, id))a6;
  if (!v10 || !v11)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] requestWallpaperUpgradeAtURL call with invalid URL", (uint8_t *)&buf, 2u);
    }
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v51 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MediaAnalysis] requestWallpaperUpgradeAtURL call with invalid URL"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v25);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v13[2](v13, 0, v14);
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v15, "UTF8String");
  v16 = (void *)sandbox_extension_issue_file();

  if (!v16)
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "path");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v26;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to issue sandbox extension on %@", (uint8_t *)&buf, 0xCu);

    }
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v49 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MediaAnalysis] Error issuing sandbox extension"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v13[2](v13, 0, v30);
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v17);

  free(v16);
  objc_msgSend(v11, "path");
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v18, "UTF8String");
  v19 = (void *)sandbox_extension_issue_file();

  if (!v19)
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "path");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v31;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to issue sandbox extension on %@", (uint8_t *)&buf, 0xCu);

    }
    v32 = (void *)MEMORY[0x1E0CB35C8];
    v47 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MediaAnalysis] Error issuing sandbox extension"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v33;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v13[2](v13, 0, v35);
LABEL_18:
    v22 = 0;
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v20);

  free(v19);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v45 = 0x2020000000;
  v46 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__VCPMediaAnalysisService_requestWallpaperUpgradeAtURL_toDestinationURL_withOptions_andCompletionHandler___block_invoke;
  block[3] = &unk_1E6B16070;
  p_buf = &buf;
  block[4] = self;
  v42 = v13;
  v38 = v10;
  v39 = v11;
  v40 = v12;
  v14 = v14;
  v41 = v14;
  dispatch_sync(managementQueue, block);
  v22 = *(_DWORD *)(*((_QWORD *)&buf + 1) + 24);

  _Block_object_dispose(&buf, 8);
LABEL_19:

  return v22;
}

void __106__VCPMediaAnalysisService_requestWallpaperUpgradeAtURL_toDestinationURL_withOptions_andCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  _QWORD aBlock[5];
  __int128 v23;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", &__block_literal_global_427, v5);

  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __106__VCPMediaAnalysisService_requestWallpaperUpgradeAtURL_toDestinationURL_withOptions_andCompletionHandler___block_invoke_3;
  aBlock[3] = &unk_1E6B15DB8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v18 = *(_OWORD *)(a1 + 72);
  v7 = (id)v18;
  v23 = v18;
  v8 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(_QWORD *)(a1 + 80);
  v12 = *(unsigned int *)(*(_QWORD *)(v11 + 8) + 24);
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 56);
  v19[0] = v6;
  v19[1] = 3221225472;
  v19[2] = __106__VCPMediaAnalysisService_requestWallpaperUpgradeAtURL_toDestinationURL_withOptions_andCompletionHandler___block_invoke_3_430;
  v19[3] = &unk_1E6B15E30;
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 40);
  v21 = v11;
  v19[4] = v15;
  v17 = *(_QWORD *)(a1 + 64);
  v20 = *(id *)(a1 + 72);
  objc_msgSend(v10, "requestWallpaperUpgrade:atSourceURL:toDestinationURL:withOptions:sandboxTokens:andReply:", v12, v16, v13, v14, v17, v19);

}

void __106__VCPMediaAnalysisService_requestWallpaperUpgradeAtURL_toDestinationURL_withOptions_andCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to wallpaper upgrade service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__VCPMediaAnalysisService_requestWallpaperUpgradeAtURL_toDestinationURL_withOptions_andCompletionHandler___block_invoke_428;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __106__VCPMediaAnalysisService_requestWallpaperUpgradeAtURL_toDestinationURL_withOptions_andCompletionHandler___block_invoke_428(uint64_t a1)
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
  v5[2] = __106__VCPMediaAnalysisService_requestWallpaperUpgradeAtURL_toDestinationURL_withOptions_andCompletionHandler___block_invoke_2_429;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __106__VCPMediaAnalysisService_requestWallpaperUpgradeAtURL_toDestinationURL_withOptions_andCompletionHandler___block_invoke_2_429(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __106__VCPMediaAnalysisService_requestWallpaperUpgradeAtURL_toDestinationURL_withOptions_andCompletionHandler___block_invoke_3_430(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD block[5];
  id v15;
  id v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v19 = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Wallpaper upgrade %d has completed", buf, 8u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__VCPMediaAnalysisService_requestWallpaperUpgradeAtURL_toDestinationURL_withOptions_andCompletionHandler___block_invoke_431;
  block[3] = &unk_1E6B15E08;
  block[4] = v8;
  v13 = *(_OWORD *)(a1 + 40);
  v10 = (id)v13;
  v17 = v13;
  v15 = v5;
  v16 = v6;
  v11 = v6;
  v12 = v5;
  dispatch_async(v9, block);

}

void __106__VCPMediaAnalysisService_requestWallpaperUpgradeAtURL_toDestinationURL_withOptions_andCompletionHandler___block_invoke_431(uint64_t a1)
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
  block[2] = __106__VCPMediaAnalysisService_requestWallpaperUpgradeAtURL_toDestinationURL_withOptions_andCompletionHandler___block_invoke_2_432;
  block[3] = &unk_1E6B15DE0;
  v8 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __106__VCPMediaAnalysisService_requestWallpaperUpgradeAtURL_toDestinationURL_withOptions_andCompletionHandler___block_invoke_2_432(_QWORD *a1)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MediaAnalysis] Request %d is %.2f%% complete", buf, 0x12u);
  }
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__VCPMediaAnalysisService_reportProgress_forRequest___block_invoke;
  block[3] = &unk_1E6B160C0;
  block[4] = self;
  v9 = a4;
  *(double *)&block[5] = a3;
  dispatch_async(managementQueue, block);
}

void __53__VCPMediaAnalysisService_reportProgress_forRequest___block_invoke(uint64_t a1)
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
    v6[2] = __53__VCPMediaAnalysisService_reportProgress_forRequest___block_invoke_2;
    v6[3] = &unk_1E6B16098;
    v7 = v4;
    v8 = *(_QWORD *)(a1 + 40);
    dispatch_async(v5, v6);

  }
}

uint64_t __53__VCPMediaAnalysisService_reportProgress_forRequest___block_invoke_2(uint64_t a1)
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
  v4[2] = __41__VCPMediaAnalysisService_cancelRequest___block_invoke;
  v4[3] = &unk_1E6B16108;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(managementQueue, v4);
}

void __41__VCPMediaAnalysisService_cancelRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  id v6;
  id v7;
  uint8_t buf[4];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_433);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelRequest:", *(unsigned int *)(a1 + 40));

  }
  else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)buf = 67109120;
    v9 = v5;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Unknown analysis request %d; dropping cancellation request",
      buf,
      8u);
  }
}

void __41__VCPMediaAnalysisService_cancelRequest___block_invoke_2()
{
  uint8_t v0[16];

  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to background analysis service", v0, 2u);
  }
}

- (void)cancelAllRequests
{
  NSObject *managementQueue;
  _QWORD block[5];

  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__VCPMediaAnalysisService_cancelAllRequests__block_invoke;
  block[3] = &unk_1E6B15468;
  block[4] = self;
  dispatch_sync(managementQueue, block);
}

void __44__VCPMediaAnalysisService_cancelAllRequests__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint8_t buf[16];

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_434);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancelAllRequests");

  }
  else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] No active analysis requests; dropping cancellation request",
      buf,
      2u);
  }
}

void __44__VCPMediaAnalysisService_cancelAllRequests__block_invoke_2()
{
  uint8_t v0[16];

  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to background analysis service", v0, 2u);
  }
}

- (void)cancelBackgroundActivity
{
  NSObject *managementQueue;
  _QWORD block[5];

  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__VCPMediaAnalysisService_cancelBackgroundActivity__block_invoke;
  block[3] = &unk_1E6B15468;
  block[4] = self;
  dispatch_sync(managementQueue, block);
}

void __51__VCPMediaAnalysisService_cancelBackgroundActivity__block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  _QWORD aBlock[4];
  NSObject *v15;

  v2 = dispatch_semaphore_create(0);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__VCPMediaAnalysisService_cancelBackgroundActivity__block_invoke_2;
  aBlock[3] = &unk_1E6B16130;
  v4 = v2;
  v15 = v4;
  v5 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v3;
  v10 = 3221225472;
  v11 = __51__VCPMediaAnalysisService_cancelBackgroundActivity__block_invoke_435;
  v12 = &unk_1E6B16158;
  v7 = v5;
  v13 = v7;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancelBackgroundActivityWithReply:", v7, v9, v10, v11, v12);

  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

void __51__VCPMediaAnalysisService_cancelBackgroundActivity__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint32_t v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      v4 = MEMORY[0x1E0C81028];
      v5 = "[MediaAnalysis] Failed to cancel background analysis: %@";
      v6 = 12;
LABEL_8:
      _os_log_impl(&dword_1B6C4A000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v7, v6);
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    v4 = MEMORY[0x1E0C81028];
    v5 = "[MediaAnalysis] Background analysis canceled";
    v6 = 2;
    goto LABEL_8;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __51__VCPMediaAnalysisService_cancelBackgroundActivity__block_invoke_435(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  NSObject *managementQueue;
  _QWORD block[5];

  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__VCPMediaAnalysisService_invalidate__block_invoke;
  block[3] = &unk_1E6B15468;
  block[4] = self;
  dispatch_sync(managementQueue, block);
}

uint64_t __37__VCPMediaAnalysisService_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
}

- (void)notifyLibraryAvailableAtURL:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[VCPMediaAnalysisService connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_436);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notifyLibraryAvailableAtURL:", v6);

}

void __55__VCPMediaAnalysisService_notifyLibraryAvailableAtURL___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "description");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to background analysis service: %@", (uint8_t *)&v4, 0xCu);

  }
}

+ (int)queryProgress:(float *)a3 forPhotoLibrary:(id)a4 andTaskID:(unint64_t)a5
{
  return +[VCPAnalysisProgressQuery queryProgress:forPhotoLibrary:andTaskID:withExtendTimeoutBlock:](VCPAnalysisProgressQuery, "queryProgress:forPhotoLibrary:andTaskID:withExtendTimeoutBlock:", a3, a4, a5, 0);
}

+ (int)queryProgress:(float *)a3 forPhotoLibrary:(id)a4 andTaskID:(unint64_t)a5 withExtendTimeoutBlock:(id)a6
{
  return +[VCPAnalysisProgressQuery queryProgress:forPhotoLibrary:andTaskID:withExtendTimeoutBlock:](VCPAnalysisProgressQuery, "queryProgress:forPhotoLibrary:andTaskID:withExtendTimeoutBlock:", a3, a4, a5, a6);
}

+ (int)queryCachedFaceAnalysisProgress:(id *)a3 forPhotoLibrary:(id)a4
{
  return +[VCPAnalysisProgressQuery queryCachedFaceAnalysisProgress:forPhotoLibrary:withExtendTimeoutBlock:](VCPAnalysisProgressQuery, "queryCachedFaceAnalysisProgress:forPhotoLibrary:withExtendTimeoutBlock:", a3, a4, 0);
}

+ (int)queryCachedFaceAnalysisProgress:(id *)a3 forPhotoLibrary:(id)a4 withExtendTimeoutBlock:(id)a5
{
  return +[VCPAnalysisProgressQuery queryCachedFaceAnalysisProgress:forPhotoLibrary:withExtendTimeoutBlock:](VCPAnalysisProgressQuery, "queryCachedFaceAnalysisProgress:forPhotoLibrary:withExtendTimeoutBlock:", a3, a4, a5);
}

+ (int)queryProgressDetail:(id *)a3 forPhotoLibrary:(id)a4 andTaskID:(unint64_t)a5
{
  return +[VCPAnalysisProgressQuery queryProgressDetail:forPhotoLibrary:andTaskID:withExtendTimeoutBlock:](VCPAnalysisProgressQuery, "queryProgressDetail:forPhotoLibrary:andTaskID:withExtendTimeoutBlock:", a3, a4, a5, 0);
}

+ (int)queryProgressDetail:(id *)a3 forPhotoLibrary:(id)a4 andTaskID:(unint64_t)a5 withExtendTimeoutBlock:(id)a6
{
  return +[VCPAnalysisProgressQuery queryProgressDetail:forPhotoLibrary:andTaskID:withExtendTimeoutBlock:](VCPAnalysisProgressQuery, "queryProgressDetail:forPhotoLibrary:andTaskID:withExtendTimeoutBlock:", a3, a4, a5, a6);
}

+ (int)queryProgressDetail:(id *)a3 forPhotoLibraryURL:(id)a4 andTaskID:(unint64_t)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  int v10;

  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0CD16F0], "isMultiLibraryModeEnabled"))
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD16F0]), "initWithPhotoLibraryURL:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD16F0], "vcp_defaultPhotoLibrary");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
  v10 = +[VCPAnalysisProgressQuery queryProgressDetail:forPhotoLibrary:andTaskID:withExtendTimeoutBlock:](VCPAnalysisProgressQuery, "queryProgressDetail:forPhotoLibrary:andTaskID:withExtendTimeoutBlock:", a3, v8, a5, 0);

  return v10;
}

+ (int)queryProgressDetail:(id *)a3 forPhotoLibraryURL:(id)a4 andTaskID:(unint64_t)a5 withExtendTimeoutBlock:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  int v13;

  v9 = a4;
  v10 = a6;
  if (objc_msgSend(MEMORY[0x1E0CD16F0], "isMultiLibraryModeEnabled"))
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD16F0]), "initWithPhotoLibraryURL:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD16F0], "vcp_defaultPhotoLibrary");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
  v13 = +[VCPAnalysisProgressQuery queryProgressDetail:forPhotoLibrary:andTaskID:withExtendTimeoutBlock:](VCPAnalysisProgressQuery, "queryProgressDetail:forPhotoLibrary:andTaskID:withExtendTimeoutBlock:", a3, v11, a5, v10);

  return v13;
}

- (int)requestPersonPreferenceForPhotoLibraryURL:(id)a3 completionHandler:(id)a4
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
  v19 = 0;
  managementQueue = self->_managementQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__VCPMediaAnalysisService_requestPersonPreferenceForPhotoLibraryURL_completionHandler___block_invoke;
  v12[3] = &unk_1E6B161A0;
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

void __87__VCPMediaAnalysisService_requestPersonPreferenceForPhotoLibraryURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[5];
  __int128 v16;
  _QWORD aBlock[5];
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", &__block_literal_global_438, v5);

  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__VCPMediaAnalysisService_requestPersonPreferenceForPhotoLibraryURL_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E6B15DB8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v13 = *(_OWORD *)(a1 + 48);
  v7 = (id)v13;
  v18 = v13;
  v8 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __87__VCPMediaAnalysisService_requestPersonPreferenceForPhotoLibraryURL_completionHandler___block_invoke_3_441;
  v15[3] = &unk_1E6B15E30;
  v11 = *(_QWORD *)(a1 + 40);
  v15[4] = *(_QWORD *)(a1 + 32);
  v14 = *(_OWORD *)(a1 + 48);
  v12 = (id)v14;
  v16 = v14;
  objc_msgSend(v10, "requestPersonPreferenceForPhotoLibraryURL:andReply:", v11, v15);

}

void __87__VCPMediaAnalysisService_requestPersonPreferenceForPhotoLibraryURL_completionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request PersonPromoterStatus service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__VCPMediaAnalysisService_requestPersonPreferenceForPhotoLibraryURL_completionHandler___block_invoke_439;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __87__VCPMediaAnalysisService_requestPersonPreferenceForPhotoLibraryURL_completionHandler___block_invoke_439(uint64_t a1)
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
  v5[2] = __87__VCPMediaAnalysisService_requestPersonPreferenceForPhotoLibraryURL_completionHandler___block_invoke_2_440;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __87__VCPMediaAnalysisService_requestPersonPreferenceForPhotoLibraryURL_completionHandler___block_invoke_2_440(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __87__VCPMediaAnalysisService_requestPersonPreferenceForPhotoLibraryURL_completionHandler___block_invoke_3_441(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD block[5];
  id v15;
  id v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v19 = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request Person Preference %d has completed", buf, 8u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__VCPMediaAnalysisService_requestPersonPreferenceForPhotoLibraryURL_completionHandler___block_invoke_442;
  block[3] = &unk_1E6B15E08;
  block[4] = v8;
  v13 = *(_OWORD *)(a1 + 40);
  v10 = (id)v13;
  v17 = v13;
  v15 = v5;
  v16 = v6;
  v11 = v6;
  v12 = v5;
  dispatch_async(v9, block);

}

void __87__VCPMediaAnalysisService_requestPersonPreferenceForPhotoLibraryURL_completionHandler___block_invoke_442(uint64_t a1)
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
  block[2] = __87__VCPMediaAnalysisService_requestPersonPreferenceForPhotoLibraryURL_completionHandler___block_invoke_2_443;
  block[3] = &unk_1E6B15DE0;
  v8 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __87__VCPMediaAnalysisService_requestPersonPreferenceForPhotoLibraryURL_completionHandler___block_invoke_2_443(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestVIPModelFilepathForPhotoLibraryURL:(id)a3 forModelType:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *managementQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v15;
  id v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;

  v8 = a3;
  v9 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__VCPMediaAnalysisService_requestVIPModelFilepathForPhotoLibraryURL_forModelType_completionHandler___block_invoke;
  block[3] = &unk_1E6B16210;
  v16 = v9;
  v17 = &v19;
  block[4] = self;
  v15 = v8;
  v18 = a4;
  v11 = v8;
  v12 = v9;
  dispatch_sync(managementQueue, block);
  LODWORD(self) = *((_DWORD *)v20 + 6);

  _Block_object_dispose(&v19, 8);
  return (int)self;
}

void __100__VCPMediaAnalysisService_requestVIPModelFilepathForPhotoLibraryURL_forModelType_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  __int128 v17;
  _QWORD aBlock[5];
  __int128 v19;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", &__block_literal_global_444, v5);

  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__VCPMediaAnalysisService_requestVIPModelFilepathForPhotoLibraryURL_forModelType_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E6B15DB8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v14 = *(_OWORD *)(a1 + 48);
  v7 = (id)v14;
  v19 = v14;
  v8 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(_QWORD *)(a1 + 64);
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __100__VCPMediaAnalysisService_requestVIPModelFilepathForPhotoLibraryURL_forModelType_completionHandler___block_invoke_3_447;
  v16[3] = &unk_1E6B161E8;
  v12 = *(_QWORD *)(a1 + 40);
  v16[4] = *(_QWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 48);
  v13 = (id)v15;
  v17 = v15;
  objc_msgSend(v10, "requestVIPModelStorageFilepathForPhotoLibraryURL:forModelType:andReply:", v12, v11, v16);

}

void __100__VCPMediaAnalysisService_requestVIPModelFilepathForPhotoLibraryURL_forModelType_completionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request PersonPromoterStatus service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__VCPMediaAnalysisService_requestVIPModelFilepathForPhotoLibraryURL_forModelType_completionHandler___block_invoke_445;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __100__VCPMediaAnalysisService_requestVIPModelFilepathForPhotoLibraryURL_forModelType_completionHandler___block_invoke_445(uint64_t a1)
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
  v5[2] = __100__VCPMediaAnalysisService_requestVIPModelFilepathForPhotoLibraryURL_forModelType_completionHandler___block_invoke_2_446;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __100__VCPMediaAnalysisService_requestVIPModelFilepathForPhotoLibraryURL_forModelType_completionHandler___block_invoke_2_446(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __100__VCPMediaAnalysisService_requestVIPModelFilepathForPhotoLibraryURL_forModelType_completionHandler___block_invoke_3_447(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD block[5];
  id v15;
  id v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v19 = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request VIP model filepath Preference %d has completed", buf, 8u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__VCPMediaAnalysisService_requestVIPModelFilepathForPhotoLibraryURL_forModelType_completionHandler___block_invoke_448;
  block[3] = &unk_1E6B15E08;
  block[4] = v8;
  v13 = *(_OWORD *)(a1 + 40);
  v10 = (id)v13;
  v17 = v13;
  v15 = v5;
  v16 = v6;
  v11 = v6;
  v12 = v5;
  dispatch_async(v9, block);

}

void __100__VCPMediaAnalysisService_requestVIPModelFilepathForPhotoLibraryURL_forModelType_completionHandler___block_invoke_448(uint64_t a1)
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
  block[2] = __100__VCPMediaAnalysisService_requestVIPModelFilepathForPhotoLibraryURL_forModelType_completionHandler___block_invoke_2_449;
  block[3] = &unk_1E6B15DE0;
  v8 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __100__VCPMediaAnalysisService_requestVIPModelFilepathForPhotoLibraryURL_forModelType_completionHandler___block_invoke_2_449(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestMediaAnalysisDatabaseBackupForPhotoLibraryURL:(id)a3 withCompletionHandler:(id)a4
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
  v19 = 0;
  managementQueue = self->_managementQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __102__VCPMediaAnalysisService_requestMediaAnalysisDatabaseBackupForPhotoLibraryURL_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E6B161A0;
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

void __102__VCPMediaAnalysisService_requestMediaAnalysisDatabaseBackupForPhotoLibraryURL_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  _QWORD aBlock[5];
  __int128 v21;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", &__block_literal_global_451, v5);

  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __102__VCPMediaAnalysisService_requestMediaAnalysisDatabaseBackupForPhotoLibraryURL_withCompletionHandler___block_invoke_3;
  aBlock[3] = &unk_1E6B15DB8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v16 = *(_OWORD *)(a1 + 48);
  v7 = (id)v16;
  v21 = v16;
  v8 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *(void **)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v13 = *(unsigned int *)(*(_QWORD *)(v11 + 8) + 24);
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __102__VCPMediaAnalysisService_requestMediaAnalysisDatabaseBackupForPhotoLibraryURL_withCompletionHandler___block_invoke_3_454;
  v17[3] = &unk_1E6B15EC8;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  v19 = v11;
  v17[4] = v14;
  v18 = v12;
  objc_msgSend(v10, "requestMediaAnalysisDatabaseBackup:withPhotoLibraryURL:andReply:", v13, v15, v17);

}

void __102__VCPMediaAnalysisService_requestMediaAnalysisDatabaseBackupForPhotoLibraryURL_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request MediaAnalysis Database Backup service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__VCPMediaAnalysisService_requestMediaAnalysisDatabaseBackupForPhotoLibraryURL_withCompletionHandler___block_invoke_452;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __102__VCPMediaAnalysisService_requestMediaAnalysisDatabaseBackupForPhotoLibraryURL_withCompletionHandler___block_invoke_452(uint64_t a1)
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
  v5[2] = __102__VCPMediaAnalysisService_requestMediaAnalysisDatabaseBackupForPhotoLibraryURL_withCompletionHandler___block_invoke_2_453;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __102__VCPMediaAnalysisService_requestMediaAnalysisDatabaseBackupForPhotoLibraryURL_withCompletionHandler___block_invoke_2_453(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __102__VCPMediaAnalysisService_requestMediaAnalysisDatabaseBackupForPhotoLibraryURL_withCompletionHandler___block_invoke_3_454(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[5];
  id v11;
  __int128 v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v14 = v4;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request MediaAnalysis Database Backup %d has completed", buf, 8u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__VCPMediaAnalysisService_requestMediaAnalysisDatabaseBackupForPhotoLibraryURL_withCompletionHandler___block_invoke_455;
  block[3] = &unk_1E6B15D90;
  block[4] = v5;
  v9 = *(_OWORD *)(a1 + 40);
  v7 = (id)v9;
  v12 = v9;
  v11 = v3;
  v8 = v3;
  dispatch_async(v6, block);

}

void __102__VCPMediaAnalysisService_requestMediaAnalysisDatabaseBackupForPhotoLibraryURL_withCompletionHandler___block_invoke_455(uint64_t a1)
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
  v5[2] = __102__VCPMediaAnalysisService_requestMediaAnalysisDatabaseBackupForPhotoLibraryURL_withCompletionHandler___block_invoke_2_456;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __102__VCPMediaAnalysisService_requestMediaAnalysisDatabaseBackupForPhotoLibraryURL_withCompletionHandler___block_invoke_2_456(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (int)requestPhotosSceneFastPassProcessingForPhotoLibraryURL:(id)a3 withCompletionHandler:(id)a4
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
  v19 = 0;
  managementQueue = self->_managementQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __104__VCPMediaAnalysisService_requestPhotosSceneFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E6B161A0;
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

void __104__VCPMediaAnalysisService_requestPhotosSceneFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  _QWORD aBlock[5];
  __int128 v21;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", &__block_literal_global_457, v5);

  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __104__VCPMediaAnalysisService_requestPhotosSceneFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_3;
  aBlock[3] = &unk_1E6B15DB8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v16 = *(_OWORD *)(a1 + 48);
  v7 = (id)v16;
  v21 = v16;
  v8 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *(void **)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v13 = *(unsigned int *)(*(_QWORD *)(v11 + 8) + 24);
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __104__VCPMediaAnalysisService_requestPhotosSceneFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_3_460;
  v17[3] = &unk_1E6B15EC8;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  v19 = v11;
  v17[4] = v14;
  v18 = v12;
  objc_msgSend(v10, "requestPhotosSceneFastPassProcessing:withPhotoLibraryURL:andReply:", v13, v15, v17);

}

void __104__VCPMediaAnalysisService_requestPhotosSceneFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request FastPass Scene Processing service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__VCPMediaAnalysisService_requestPhotosSceneFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_458;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __104__VCPMediaAnalysisService_requestPhotosSceneFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_458(uint64_t a1)
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
  v5[2] = __104__VCPMediaAnalysisService_requestPhotosSceneFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_2_459;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __104__VCPMediaAnalysisService_requestPhotosSceneFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_2_459(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __104__VCPMediaAnalysisService_requestPhotosSceneFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_3_460(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[5];
  id v11;
  __int128 v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v14 = v4;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request FastPass Scene Processing %d has completed", buf, 8u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__VCPMediaAnalysisService_requestPhotosSceneFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_461;
  block[3] = &unk_1E6B15D90;
  block[4] = v5;
  v9 = *(_OWORD *)(a1 + 40);
  v7 = (id)v9;
  v12 = v9;
  v11 = v3;
  v8 = v3;
  dispatch_async(v6, block);

}

void __104__VCPMediaAnalysisService_requestPhotosSceneFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_461(uint64_t a1)
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
  v5[2] = __104__VCPMediaAnalysisService_requestPhotosSceneFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_2_462;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __104__VCPMediaAnalysisService_requestPhotosSceneFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_2_462(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (int)requestPhotosFaceFastPassProcessingForPhotoLibraryURL:(id)a3 withCompletionHandler:(id)a4
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
  v19 = 0;
  managementQueue = self->_managementQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __103__VCPMediaAnalysisService_requestPhotosFaceFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E6B161A0;
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

void __103__VCPMediaAnalysisService_requestPhotosFaceFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  _QWORD aBlock[5];
  __int128 v21;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", &__block_literal_global_463, v5);

  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__VCPMediaAnalysisService_requestPhotosFaceFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_3;
  aBlock[3] = &unk_1E6B15DB8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v16 = *(_OWORD *)(a1 + 48);
  v7 = (id)v16;
  v21 = v16;
  v8 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *(void **)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v13 = *(unsigned int *)(*(_QWORD *)(v11 + 8) + 24);
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __103__VCPMediaAnalysisService_requestPhotosFaceFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_3_466;
  v17[3] = &unk_1E6B15EC8;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  v19 = v11;
  v17[4] = v14;
  v18 = v12;
  objc_msgSend(v10, "requestPhotosFaceFastPassProcessing:withPhotoLibraryURL:andReply:", v13, v15, v17);

}

void __103__VCPMediaAnalysisService_requestPhotosFaceFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request FastPass Face Processing service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__VCPMediaAnalysisService_requestPhotosFaceFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_464;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __103__VCPMediaAnalysisService_requestPhotosFaceFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_464(uint64_t a1)
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
  v5[2] = __103__VCPMediaAnalysisService_requestPhotosFaceFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_2_465;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __103__VCPMediaAnalysisService_requestPhotosFaceFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_2_465(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __103__VCPMediaAnalysisService_requestPhotosFaceFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_3_466(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[5];
  id v11;
  __int128 v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v14 = v4;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request FastPass Face Processing %d has completed", buf, 8u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__VCPMediaAnalysisService_requestPhotosFaceFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_467;
  block[3] = &unk_1E6B15D90;
  block[4] = v5;
  v9 = *(_OWORD *)(a1 + 40);
  v7 = (id)v9;
  v12 = v9;
  v11 = v3;
  v8 = v3;
  dispatch_async(v6, block);

}

void __103__VCPMediaAnalysisService_requestPhotosFaceFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_467(uint64_t a1)
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
  v5[2] = __103__VCPMediaAnalysisService_requestPhotosFaceFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_2_468;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __103__VCPMediaAnalysisService_requestPhotosFaceFastPassProcessingForPhotoLibraryURL_withCompletionHandler___block_invoke_2_468(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (int)requestDatabaseRestoreFastPassProcessingWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *managementQueue;
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
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__VCPMediaAnalysisService_requestDatabaseRestoreFastPassProcessingWithCompletionHandler___block_invoke;
  block[3] = &unk_1E6B16258;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(managementQueue, block);
  LODWORD(managementQueue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)managementQueue;
}

void __89__VCPMediaAnalysisService_requestDatabaseRestoreFastPassProcessingWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  _QWORD aBlock[5];
  __int128 v20;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", &__block_literal_global_469, v5);

  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__VCPMediaAnalysisService_requestDatabaseRestoreFastPassProcessingWithCompletionHandler___block_invoke_3;
  aBlock[3] = &unk_1E6B15DB8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 40);
  v7 = (id)v15;
  v20 = v15;
  v8 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(unsigned int *)(*(_QWORD *)(v11 + 8) + 24);
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __89__VCPMediaAnalysisService_requestDatabaseRestoreFastPassProcessingWithCompletionHandler___block_invoke_3_472;
  v16[3] = &unk_1E6B15EC8;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(a1 + 40);
  v18 = v11;
  v16[4] = v13;
  v17 = v14;
  objc_msgSend(v10, "requestDatabaseRestoreFastPassProcessing:reply:", v12, v16);

}

void __89__VCPMediaAnalysisService_requestDatabaseRestoreFastPassProcessingWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request database restore FastPass service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__VCPMediaAnalysisService_requestDatabaseRestoreFastPassProcessingWithCompletionHandler___block_invoke_470;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __89__VCPMediaAnalysisService_requestDatabaseRestoreFastPassProcessingWithCompletionHandler___block_invoke_470(uint64_t a1)
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
  v5[2] = __89__VCPMediaAnalysisService_requestDatabaseRestoreFastPassProcessingWithCompletionHandler___block_invoke_2_471;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __89__VCPMediaAnalysisService_requestDatabaseRestoreFastPassProcessingWithCompletionHandler___block_invoke_2_471(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __89__VCPMediaAnalysisService_requestDatabaseRestoreFastPassProcessingWithCompletionHandler___block_invoke_3_472(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[5];
  id v11;
  __int128 v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v14 = v4;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request database restore FastPass service %d has completed", buf, 8u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__VCPMediaAnalysisService_requestDatabaseRestoreFastPassProcessingWithCompletionHandler___block_invoke_473;
  block[3] = &unk_1E6B15D90;
  block[4] = v5;
  v9 = *(_OWORD *)(a1 + 40);
  v7 = (id)v9;
  v12 = v9;
  v11 = v3;
  v8 = v3;
  dispatch_async(v6, block);

}

void __89__VCPMediaAnalysisService_requestDatabaseRestoreFastPassProcessingWithCompletionHandler___block_invoke_473(uint64_t a1)
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
  v5[2] = __89__VCPMediaAnalysisService_requestDatabaseRestoreFastPassProcessingWithCompletionHandler___block_invoke_2_474;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __89__VCPMediaAnalysisService_requestDatabaseRestoreFastPassProcessingWithCompletionHandler___block_invoke_2_474(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressBlocks, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong((id *)&self->_managementQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (int)requestSuggestedPersonsForPersonWithLocalIdentifier:(id)a3 toBeConfirmedPersonSuggestions:(id)a4 toBeRejectedPersonSuggestions:(id)a5 photoLibraryURL:(id)a6 progessHandler:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *managementQueue;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  int v39;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  managementQueue = self->_managementQueue;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __206__VCPMediaAnalysisService_FaceSuggestions__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke;
  v28[3] = &unk_1E6B16350;
  v34 = v19;
  v35 = &v36;
  v28[4] = self;
  v29 = v14;
  v30 = v15;
  v31 = v16;
  v32 = v17;
  v33 = v18;
  v21 = v17;
  v22 = v16;
  v23 = v15;
  v24 = v14;
  v25 = v19;
  v26 = v18;
  dispatch_sync(managementQueue, v28);
  LODWORD(self) = *((_DWORD *)v37 + 6);

  _Block_object_dispose(&v36, 8);
  return (int)self;
}

void __206__VCPMediaAnalysisService_FaceSuggestions__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  const void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  _QWORD aBlock[5];
  __int128 v26;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_QWORD *)(a1 + 72))
    v5 = *(const void **)(a1 + 72);
  else
    v5 = &__block_literal_global_588;
  v6 = _Block_copy(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __206__VCPMediaAnalysisService_FaceSuggestions__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E6B15DB8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v21 = *(_OWORD *)(a1 + 80);
  v9 = (id)v21;
  v26 = v21;
  v10 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *(void **)(a1 + 80);
  v13 = *(_QWORD *)(a1 + 88);
  v15 = *(unsigned int *)(*(_QWORD *)(v13 + 8) + 24);
  v16 = *(_QWORD *)(a1 + 48);
  v17 = *(_QWORD *)(a1 + 56);
  v18 = *(_QWORD *)(a1 + 64);
  v22[0] = v8;
  v22[1] = 3221225472;
  v22[2] = __206__VCPMediaAnalysisService_FaceSuggestions__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke_3_591;
  v22[3] = &unk_1E6B16328;
  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(_QWORD *)(a1 + 40);
  v24 = v13;
  v22[4] = v19;
  v23 = v14;
  objc_msgSend(v12, "requestSuggestedPersons:withPersonWithLocalIdentifier:toBeConfirmedPersonSuggestions:toBeRejectedPersonSuggestions:andPhotoLibraryURL:andReply:", v15, v20, v16, v17, v18, v22);

}

void __206__VCPMediaAnalysisService_FaceSuggestions__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request SuggestedPersons service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __206__VCPMediaAnalysisService_FaceSuggestions__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke_589;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __206__VCPMediaAnalysisService_FaceSuggestions__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke_589(uint64_t a1)
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
  v5[2] = __206__VCPMediaAnalysisService_FaceSuggestions__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke_2_590;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __206__VCPMediaAnalysisService_FaceSuggestions__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke_2_590(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __206__VCPMediaAnalysisService_FaceSuggestions__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke_3_591(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD block[5];
  id v15;
  id v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v19 = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request SuggestedPersons %d has completed", buf, 8u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __206__VCPMediaAnalysisService_FaceSuggestions__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke_592;
  block[3] = &unk_1E6B15E08;
  block[4] = v8;
  v13 = *(_OWORD *)(a1 + 40);
  v10 = (id)v13;
  v17 = v13;
  v15 = v5;
  v16 = v6;
  v11 = v6;
  v12 = v5;
  dispatch_async(v9, block);

}

void __206__VCPMediaAnalysisService_FaceSuggestions__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke_592(uint64_t a1)
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
  block[2] = __206__VCPMediaAnalysisService_FaceSuggestions__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke_2_593;
  block[3] = &unk_1E6B15DE0;
  v8 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __206__VCPMediaAnalysisService_FaceSuggestions__requestSuggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_photoLibraryURL_progessHandler_completionHandler___block_invoke_2_593(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestUpdateKeyFacesOfPersonsWithLocalIdentifiers:(id)a3 forceUpdate:(BOOL)a4 photoLibraryURL:(id)a5 progessHandler:(id)a6 completionHandler:(id)a7
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
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;

  v12 = a3;
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
  block[2] = __156__VCPMediaAnalysisService_FaceSuggestions__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke;
  block[3] = &unk_1E6B15E80;
  v26 = v15;
  v27 = &v29;
  block[4] = self;
  v23 = v12;
  v28 = a4;
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

void __156__VCPMediaAnalysisService_FaceSuggestions__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  const void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  _QWORD aBlock[5];
  __int128 v25;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_QWORD *)(a1 + 56))
    v5 = *(const void **)(a1 + 56);
  else
    v5 = &__block_literal_global_595;
  v6 = _Block_copy(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __156__VCPMediaAnalysisService_FaceSuggestions__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E6B15DB8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v20 = *(_OWORD *)(a1 + 64);
  v9 = (id)v20;
  v25 = v20;
  v10 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *(void **)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 72);
  v15 = *(unsigned int *)(*(_QWORD *)(v13 + 8) + 24);
  v16 = *(unsigned __int8 *)(a1 + 80);
  v21[0] = v8;
  v21[1] = 3221225472;
  v21[2] = __156__VCPMediaAnalysisService_FaceSuggestions__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke_3_598;
  v21[3] = &unk_1E6B163E8;
  v18 = *(_QWORD *)(a1 + 40);
  v17 = *(_QWORD *)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 32);
  v23 = v13;
  v21[4] = v19;
  v22 = v14;
  objc_msgSend(v12, "requestUpdateKeyFacesOfPersons:withLocalIdentifiers:andForceUpdate:andPhotoLibraryURL:andReply:", v15, v18, v16, v17, v21);

}

void __156__VCPMediaAnalysisService_FaceSuggestions__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request UpdateKeyFacesOfPersons service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __156__VCPMediaAnalysisService_FaceSuggestions__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke_596;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __156__VCPMediaAnalysisService_FaceSuggestions__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke_596(uint64_t a1)
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
  v5[2] = __156__VCPMediaAnalysisService_FaceSuggestions__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke_2_597;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __156__VCPMediaAnalysisService_FaceSuggestions__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke_2_597(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __156__VCPMediaAnalysisService_FaceSuggestions__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke_3_598(uint64_t a1, char a2, void *a3)
{
  id v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[5];
  id v13;
  __int128 v14;
  char v15;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v6 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v17 = v6;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request UpdateKeyFacesOfPersons %d has completed", buf, 8u);
  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __156__VCPMediaAnalysisService_FaceSuggestions__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke_599;
  block[3] = &unk_1E6B163C0;
  block[4] = v7;
  v11 = *(_OWORD *)(a1 + 40);
  v9 = (id)v11;
  v14 = v11;
  v15 = a2;
  v13 = v5;
  v10 = v5;
  dispatch_async(v8, block);

}

void __156__VCPMediaAnalysisService_FaceSuggestions__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke_599(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  char v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __156__VCPMediaAnalysisService_FaceSuggestions__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke_2_600;
  block[3] = &unk_1E6B16398;
  v7 = *(id *)(a1 + 48);
  v8 = *(_BYTE *)(a1 + 64);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, block);

}

uint64_t __156__VCPMediaAnalysisService_FaceSuggestions__requestUpdateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_photoLibraryURL_progessHandler_completionHandler___block_invoke_2_600(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (int)requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers:(id)a3 photoLibraryURL:(id)a4 progessHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *managementQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  managementQueue = self->_managementQueue;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __155__VCPMediaAnalysisService_FaceSuggestions__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke;
  v20[3] = &unk_1E6B15F38;
  v24 = v13;
  v25 = &v26;
  v20[4] = self;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v15 = v11;
  v16 = v10;
  v17 = v13;
  v18 = v12;
  dispatch_sync(managementQueue, v20);
  LODWORD(v10) = *((_DWORD *)v27 + 6);

  _Block_object_dispose(&v26, 8);
  return (int)v10;
}

void __155__VCPMediaAnalysisService_FaceSuggestions__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  const void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  _QWORD aBlock[5];
  __int128 v24;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_QWORD *)(a1 + 56))
    v5 = *(const void **)(a1 + 56);
  else
    v5 = &__block_literal_global_602;
  v6 = _Block_copy(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __155__VCPMediaAnalysisService_FaceSuggestions__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E6B15DB8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v19 = *(_OWORD *)(a1 + 64);
  v9 = (id)v19;
  v24 = v19;
  v10 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *(void **)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 72);
  v15 = *(unsigned int *)(*(_QWORD *)(v13 + 8) + 24);
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __155__VCPMediaAnalysisService_FaceSuggestions__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke_3_605;
  v20[3] = &unk_1E6B16328;
  v17 = *(_QWORD *)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 48);
  v18 = *(_QWORD *)(a1 + 32);
  v22 = v13;
  v20[4] = v18;
  v21 = v14;
  objc_msgSend(v12, "requestFaceCandidatesforKeyFace:withPersonsWithLocalIdentifiers:andPhotoLibraryURL:andReply:", v15, v17, v16, v20);

}

void __155__VCPMediaAnalysisService_FaceSuggestions__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request FaceCandidatesforKeyFace service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __155__VCPMediaAnalysisService_FaceSuggestions__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke_603;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __155__VCPMediaAnalysisService_FaceSuggestions__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke_603(uint64_t a1)
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
  v5[2] = __155__VCPMediaAnalysisService_FaceSuggestions__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke_2_604;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __155__VCPMediaAnalysisService_FaceSuggestions__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke_2_604(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __155__VCPMediaAnalysisService_FaceSuggestions__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke_3_605(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD block[5];
  id v15;
  id v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v19 = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request FaceCandidatesforKeyFace %d has completed", buf, 8u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __155__VCPMediaAnalysisService_FaceSuggestions__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke_606;
  block[3] = &unk_1E6B15E08;
  block[4] = v8;
  v13 = *(_OWORD *)(a1 + 40);
  v10 = (id)v13;
  v17 = v13;
  v15 = v5;
  v16 = v6;
  v11 = v6;
  v12 = v5;
  dispatch_async(v9, block);

}

void __155__VCPMediaAnalysisService_FaceSuggestions__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke_606(uint64_t a1)
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
  block[2] = __155__VCPMediaAnalysisService_FaceSuggestions__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke_2_607;
  block[3] = &unk_1E6B15DE0;
  v8 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __155__VCPMediaAnalysisService_FaceSuggestions__requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_photoLibraryURL_progessHandler_completionHandler___block_invoke_2_607(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestResetFaceClassificationModelForPhotoLibraryURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *managementQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __141__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke;
  block[3] = &unk_1E6B16430;
  v19 = v10;
  v20 = &v21;
  v17 = v8;
  v18 = v9;
  block[4] = self;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_sync(managementQueue, block);
  LODWORD(v8) = *((_DWORD *)v22 + 6);

  _Block_object_dispose(&v21, 8);
  return (int)v8;
}

void __141__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  const void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  _QWORD aBlock[5];
  __int128 v23;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_QWORD *)(a1 + 48))
    v5 = *(const void **)(a1 + 48);
  else
    v5 = &__block_literal_global_614;
  v6 = _Block_copy(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __141__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E6B15DB8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v18 = *(_OWORD *)(a1 + 56);
  v9 = (id)v18;
  v23 = v18;
  v10 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *(void **)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 64);
  v15 = *(unsigned int *)(*(_QWORD *)(v13 + 8) + 24);
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __141__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3_617;
  v19[3] = &unk_1E6B163E8;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v21 = v13;
  v19[4] = v16;
  v20 = v14;
  objc_msgSend(v12, "requestResetFaceClassificationModel:withPhotoLibraryURL:andReply:", v15, v17, v19);

}

void __141__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request ResetFaceClassificationModel service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __141__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_615;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __141__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_615(uint64_t a1)
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
  v5[2] = __141__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_616;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __141__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_616(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __141__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3_617(uint64_t a1, char a2, void *a3)
{
  id v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[5];
  id v13;
  __int128 v14;
  char v15;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v6 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v17 = v6;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request ResetFaceClassificationModel %d has completed", buf, 8u);
  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __141__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_618;
  block[3] = &unk_1E6B163C0;
  block[4] = v7;
  v11 = *(_OWORD *)(a1 + 40);
  v9 = (id)v11;
  v14 = v11;
  v15 = a2;
  v13 = v5;
  v10 = v5;
  dispatch_async(v8, block);

}

void __141__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_618(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  char v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __141__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_619;
  block[3] = &unk_1E6B16398;
  v7 = *(id *)(a1 + 48);
  v8 = *(_BYTE *)(a1 + 64);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, block);

}

uint64_t __141__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetFaceClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_619(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (int)requestResetPetClassificationModelForPhotoLibraryURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *managementQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __140__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPetClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke;
  block[3] = &unk_1E6B16430;
  v19 = v10;
  v20 = &v21;
  v17 = v8;
  v18 = v9;
  block[4] = self;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_sync(managementQueue, block);
  LODWORD(v8) = *((_DWORD *)v22 + 6);

  _Block_object_dispose(&v21, 8);
  return (int)v8;
}

void __140__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPetClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  const void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  _QWORD aBlock[5];
  __int128 v23;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_QWORD *)(a1 + 48))
    v5 = *(const void **)(a1 + 48);
  else
    v5 = &__block_literal_global_620;
  v6 = _Block_copy(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __140__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPetClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E6B15DB8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v18 = *(_OWORD *)(a1 + 56);
  v9 = (id)v18;
  v23 = v18;
  v10 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *(void **)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 64);
  v15 = *(unsigned int *)(*(_QWORD *)(v13 + 8) + 24);
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __140__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPetClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3_623;
  v19[3] = &unk_1E6B163E8;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v21 = v13;
  v19[4] = v16;
  v20 = v14;
  objc_msgSend(v12, "requestResetPetClassificationModel:withPhotoLibraryURL:andReply:", v15, v17, v19);

}

void __140__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPetClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request ResetPetClassificationModel service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __140__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPetClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_621;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __140__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPetClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_621(uint64_t a1)
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
  v5[2] = __140__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPetClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_622;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __140__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPetClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_622(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __140__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPetClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3_623(uint64_t a1, char a2, void *a3)
{
  id v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[5];
  id v13;
  __int128 v14;
  char v15;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v6 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v17 = v6;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request ResetPetClassificationModel %d has completed", buf, 8u);
  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __140__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPetClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_624;
  block[3] = &unk_1E6B163C0;
  block[4] = v7;
  v11 = *(_OWORD *)(a1 + 40);
  v9 = (id)v11;
  v14 = v11;
  v15 = a2;
  v13 = v5;
  v10 = v5;
  dispatch_async(v8, block);

}

void __140__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPetClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_624(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  char v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __140__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPetClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_625;
  block[3] = &unk_1E6B16398;
  v7 = *(id *)(a1 + 48);
  v8 = *(_BYTE *)(a1 + 64);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, block);

}

uint64_t __140__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPetClassificationModelForPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_625(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (int)requestSuggestedMePersonIdentifierWithContext:(id)a3 photoLibraryURL:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *managementQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  managementQueue = self->_managementQueue;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __149__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestSuggestedMePersonIdentifierWithContext_photoLibraryURL_progressHandler_completionHandler___block_invoke;
  v20[3] = &unk_1E6B15F38;
  v24 = v13;
  v25 = &v26;
  v20[4] = self;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v15 = v11;
  v16 = v10;
  v17 = v13;
  v18 = v12;
  dispatch_sync(managementQueue, v20);
  LODWORD(v10) = *((_DWORD *)v27 + 6);

  _Block_object_dispose(&v26, 8);
  return (int)v10;
}

void __149__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestSuggestedMePersonIdentifierWithContext_photoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  const void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  _QWORD aBlock[5];
  __int128 v24;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_QWORD *)(a1 + 56))
    v5 = *(const void **)(a1 + 56);
  else
    v5 = &__block_literal_global_626;
  v6 = _Block_copy(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __149__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestSuggestedMePersonIdentifierWithContext_photoLibraryURL_progressHandler_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E6B15DB8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v19 = *(_OWORD *)(a1 + 64);
  v9 = (id)v19;
  v24 = v19;
  v10 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *(void **)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 72);
  v15 = *(unsigned int *)(*(_QWORD *)(v13 + 8) + 24);
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __149__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestSuggestedMePersonIdentifierWithContext_photoLibraryURL_progressHandler_completionHandler___block_invoke_3_629;
  v20[3] = &unk_1E6B161E8;
  v17 = *(_QWORD *)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 48);
  v18 = *(_QWORD *)(a1 + 32);
  v22 = v13;
  v20[4] = v18;
  v21 = v14;
  objc_msgSend(v12, "requestSuggestedMePersonIdentifier:withContext:andPhotoLibraryURL:andReply:", v15, v17, v16, v20);

}

void __149__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestSuggestedMePersonIdentifierWithContext_photoLibraryURL_progressHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request SuggestedMePersonIdentifier service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __149__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestSuggestedMePersonIdentifierWithContext_photoLibraryURL_progressHandler_completionHandler___block_invoke_627;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __149__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestSuggestedMePersonIdentifierWithContext_photoLibraryURL_progressHandler_completionHandler___block_invoke_627(uint64_t a1)
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
  v5[2] = __149__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestSuggestedMePersonIdentifierWithContext_photoLibraryURL_progressHandler_completionHandler___block_invoke_2_628;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __149__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestSuggestedMePersonIdentifierWithContext_photoLibraryURL_progressHandler_completionHandler___block_invoke_2_628(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __149__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestSuggestedMePersonIdentifierWithContext_photoLibraryURL_progressHandler_completionHandler___block_invoke_3_629(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD block[5];
  id v15;
  id v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v19 = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request SuggestedMePersonIdentifier %d has completed", buf, 8u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __149__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestSuggestedMePersonIdentifierWithContext_photoLibraryURL_progressHandler_completionHandler___block_invoke_630;
  block[3] = &unk_1E6B15E08;
  block[4] = v8;
  v13 = *(_OWORD *)(a1 + 40);
  v10 = (id)v13;
  v17 = v13;
  v15 = v5;
  v16 = v6;
  v11 = v6;
  v12 = v5;
  dispatch_async(v9, block);

}

void __149__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestSuggestedMePersonIdentifierWithContext_photoLibraryURL_progressHandler_completionHandler___block_invoke_630(uint64_t a1)
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
  block[2] = __149__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestSuggestedMePersonIdentifierWithContext_photoLibraryURL_progressHandler_completionHandler___block_invoke_2_631;
  block[3] = &unk_1E6B15DE0;
  v8 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __149__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestSuggestedMePersonIdentifierWithContext_photoLibraryURL_progressHandler_completionHandler___block_invoke_2_631(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestPersonPromoterStatusWithAdvancedFlag:(BOOL)a3 photoLibraryURL:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *managementQueue;
  id v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  managementQueue = self->_managementQueue;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __147__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke;
  v18[3] = &unk_1E6B164B8;
  v21 = v12;
  v22 = &v24;
  v19 = v10;
  v20 = v11;
  v23 = a3;
  v18[4] = self;
  v14 = v10;
  v15 = v12;
  v16 = v11;
  dispatch_sync(managementQueue, v18);
  LODWORD(self) = *((_DWORD *)v25 + 6);

  _Block_object_dispose(&v24, 8);
  return (int)self;
}

void __147__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  const void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  _QWORD aBlock[5];
  __int128 v24;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_QWORD *)(a1 + 48))
    v5 = *(const void **)(a1 + 48);
  else
    v5 = &__block_literal_global_632;
  v6 = _Block_copy(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __147__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E6B15DB8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v19 = *(_OWORD *)(a1 + 56);
  v9 = (id)v19;
  v24 = v19;
  v10 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *(void **)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 64);
  v15 = *(unsigned int *)(*(_QWORD *)(v13 + 8) + 24);
  v16 = *(unsigned __int8 *)(a1 + 72);
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __147__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke_3_635;
  v20[3] = &unk_1E6B15E30;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(_QWORD *)(a1 + 40);
  v22 = v13;
  v20[4] = v17;
  v21 = v14;
  objc_msgSend(v12, "requestPersonPromoterStatus:withAdvancedFlag:andPhotoLibraryURL:andReply:", v15, v16, v18, v20);

}

void __147__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request PersonPromoterStatus service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __147__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke_633;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __147__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke_633(uint64_t a1)
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
  v5[2] = __147__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke_2_634;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __147__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke_2_634(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __147__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke_3_635(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD block[5];
  id v15;
  id v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v19 = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request PersonPromoterStatus %d has completed", buf, 8u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __147__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke_636;
  block[3] = &unk_1E6B15E08;
  block[4] = v8;
  v13 = *(_OWORD *)(a1 + 40);
  v10 = (id)v13;
  v17 = v13;
  v15 = v5;
  v16 = v6;
  v11 = v6;
  v12 = v5;
  dispatch_async(v9, block);

}

void __147__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke_636(uint64_t a1)
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
  block[2] = __147__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke_2_637;
  block[3] = &unk_1E6B15DE0;
  v8 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __147__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonPromoterStatusWithAdvancedFlag_photoLibraryURL_progressHandler_completionHandler___block_invoke_2_637(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestPersonProcessingForPhotoLibraryURL:(id)a3 options:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *managementQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  managementQueue = self->_managementQueue;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __137__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonProcessingForPhotoLibraryURL_options_progressHandler_completionHandler___block_invoke;
  v20[3] = &unk_1E6B15F38;
  v24 = v13;
  v25 = &v26;
  v20[4] = self;
  v21 = v11;
  v22 = v10;
  v23 = v12;
  v15 = v10;
  v16 = v11;
  v17 = v13;
  v18 = v12;
  dispatch_sync(managementQueue, v20);
  LODWORD(v10) = *((_DWORD *)v27 + 6);

  _Block_object_dispose(&v26, 8);
  return (int)v10;
}

void __137__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonProcessingForPhotoLibraryURL_options_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  const void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  _QWORD aBlock[5];
  __int128 v24;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_QWORD *)(a1 + 56))
    v5 = *(const void **)(a1 + 56);
  else
    v5 = &__block_literal_global_638;
  v6 = _Block_copy(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __137__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonProcessingForPhotoLibraryURL_options_progressHandler_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E6B15DB8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v19 = *(_OWORD *)(a1 + 64);
  v9 = (id)v19;
  v24 = v19;
  v10 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ModifyPersonRequest"));
  v15 = *(void **)(a1 + 64);
  v14 = *(_QWORD *)(a1 + 72);
  v16 = *(unsigned int *)(*(_QWORD *)(v14 + 8) + 24);
  v17 = *(_QWORD *)(a1 + 48);
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __137__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonProcessingForPhotoLibraryURL_options_progressHandler_completionHandler___block_invoke_3_641;
  v20[3] = &unk_1E6B15EC8;
  v18 = *(_QWORD *)(a1 + 32);
  v22 = v14;
  v20[4] = v18;
  v21 = v15;
  objc_msgSend(v12, "requestLibraryProcessing:withTaskID:forPhotoLibraryURL:withOptions:andReply:", v16, 3, v17, v13, v20);

}

void __137__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonProcessingForPhotoLibraryURL_options_progressHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request Face and Person workflow", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __137__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonProcessingForPhotoLibraryURL_options_progressHandler_completionHandler___block_invoke_639;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __137__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonProcessingForPhotoLibraryURL_options_progressHandler_completionHandler___block_invoke_639(uint64_t a1)
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
  v5[2] = __137__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonProcessingForPhotoLibraryURL_options_progressHandler_completionHandler___block_invoke_2_640;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __137__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonProcessingForPhotoLibraryURL_options_progressHandler_completionHandler___block_invoke_2_640(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __137__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonProcessingForPhotoLibraryURL_options_progressHandler_completionHandler___block_invoke_3_641(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[5];
  id v11;
  __int128 v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v14 = v4;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request Face and Person workflow %d has completed", buf, 8u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __137__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonProcessingForPhotoLibraryURL_options_progressHandler_completionHandler___block_invoke_642;
  block[3] = &unk_1E6B15D90;
  block[4] = v5;
  v9 = *(_OWORD *)(a1 + 40);
  v7 = (id)v9;
  v12 = v9;
  v11 = v3;
  v8 = v3;
  dispatch_async(v6, block);

}

void __137__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonProcessingForPhotoLibraryURL_options_progressHandler_completionHandler___block_invoke_642(uint64_t a1)
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
  v5[2] = __137__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonProcessingForPhotoLibraryURL_options_progressHandler_completionHandler___block_invoke_2_643;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __137__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestPersonProcessingForPhotoLibraryURL_options_progressHandler_completionHandler___block_invoke_2_643(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (int)requestResetPersons:(id)a3 forPhotoLibraryURL:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *managementQueue;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;

  v7 = a4;
  v8 = a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  managementQueue = self->_managementQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __110__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPersons_forPhotoLibraryURL_completionHandler___block_invoke;
  v13[3] = &unk_1E6B161A0;
  v15 = v8;
  v16 = &v17;
  v13[4] = self;
  v14 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_sync(managementQueue, v13);
  LODWORD(v7) = *((_DWORD *)v18 + 6);

  _Block_object_dispose(&v17, 8);
  return (int)v7;
}

void __110__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPersons_forPhotoLibraryURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  _QWORD aBlock[5];
  __int128 v19;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v3;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __110__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPersons_forPhotoLibraryURL_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E6B15DB8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v14 = *(_OWORD *)(a1 + 48);
  v5 = (id)v14;
  v19 = v14;
  v6 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  v11 = *(unsigned int *)(*(_QWORD *)(v9 + 8) + 24);
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __110__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPersons_forPhotoLibraryURL_completionHandler___block_invoke_3;
  v15[3] = &unk_1E6B163E8;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 40);
  v17 = v9;
  v15[4] = v12;
  v16 = v10;
  objc_msgSend(v8, "requestResetPersons:withPhotoLibraryURL:andReply:", v11, v13, v15);

}

void __110__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPersons_forPhotoLibraryURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request reset persons workflow", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __110__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPersons_forPhotoLibraryURL_completionHandler___block_invoke_644;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __110__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPersons_forPhotoLibraryURL_completionHandler___block_invoke_644(uint64_t a1)
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
  v5[2] = __110__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPersons_forPhotoLibraryURL_completionHandler___block_invoke_2_645;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __110__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPersons_forPhotoLibraryURL_completionHandler___block_invoke_2_645(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __110__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPersons_forPhotoLibraryURL_completionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[5];
  id v13;
  __int128 v14;
  char v15;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v6 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v17 = v6;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request reset persons workflow %d has completed", buf, 8u);
  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __110__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPersons_forPhotoLibraryURL_completionHandler___block_invoke_646;
  block[3] = &unk_1E6B163C0;
  block[4] = v7;
  v11 = *(_OWORD *)(a1 + 40);
  v9 = (id)v11;
  v14 = v11;
  v15 = a2;
  v13 = v5;
  v10 = v5;
  dispatch_async(v8, block);

}

void __110__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPersons_forPhotoLibraryURL_completionHandler___block_invoke_646(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  char v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __110__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPersons_forPhotoLibraryURL_completionHandler___block_invoke_2_647;
  block[3] = &unk_1E6B16398;
  v7 = *(id *)(a1 + 48);
  v8 = *(_BYTE *)(a1 + 64);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, block);

}

uint64_t __110__VCPMediaAnalysisService_PersonBuilderAndPromoter__requestResetPersons_forPhotoLibraryURL_completionHandler___block_invoke_2_647(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (int)requestClusterCacheValidationWithPhotoLibraryURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *managementQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __125__VCPMediaAnalysisService_InternalTools__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke;
  block[3] = &unk_1E6B16430;
  v19 = v10;
  v20 = &v21;
  v17 = v8;
  v18 = v9;
  block[4] = self;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_sync(managementQueue, block);
  LODWORD(v8) = *((_DWORD *)v22 + 6);

  _Block_object_dispose(&v21, 8);
  return (int)v8;
}

void __125__VCPMediaAnalysisService_InternalTools__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  const void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  _QWORD aBlock[5];
  __int128 v23;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_QWORD *)(a1 + 48))
    v5 = *(const void **)(a1 + 48);
  else
    v5 = &__block_literal_global_657;
  v6 = _Block_copy(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __125__VCPMediaAnalysisService_InternalTools__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E6B15DB8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v18 = *(_OWORD *)(a1 + 56);
  v9 = (id)v18;
  v23 = v18;
  v10 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *(void **)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 64);
  v15 = *(unsigned int *)(*(_QWORD *)(v13 + 8) + 24);
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __125__VCPMediaAnalysisService_InternalTools__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3_660;
  v19[3] = &unk_1E6B15E30;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v21 = v13;
  v19[4] = v16;
  v20 = v14;
  objc_msgSend(v12, "requestClusterCacheValidation:withPhotoLibraryURL:andReply:", v15, v17, v19);

}

void __125__VCPMediaAnalysisService_InternalTools__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request ClusterCacheValidation service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __125__VCPMediaAnalysisService_InternalTools__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_658;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __125__VCPMediaAnalysisService_InternalTools__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_658(uint64_t a1)
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
  v5[2] = __125__VCPMediaAnalysisService_InternalTools__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_659;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __125__VCPMediaAnalysisService_InternalTools__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_659(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __125__VCPMediaAnalysisService_InternalTools__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3_660(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD block[5];
  id v15;
  id v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v19 = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request ClusterCacheValidation %d has completed", buf, 8u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __125__VCPMediaAnalysisService_InternalTools__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_661;
  block[3] = &unk_1E6B15E08;
  block[4] = v8;
  v13 = *(_OWORD *)(a1 + 40);
  v10 = (id)v13;
  v17 = v13;
  v15 = v5;
  v16 = v6;
  v11 = v6;
  v12 = v5;
  dispatch_async(v9, block);

}

void __125__VCPMediaAnalysisService_InternalTools__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_661(uint64_t a1)
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
  block[2] = __125__VCPMediaAnalysisService_InternalTools__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_662;
  block[3] = &unk_1E6B15DE0;
  v8 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __125__VCPMediaAnalysisService_InternalTools__requestClusterCacheValidationWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_662(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestResetFaceClusteringStateWithPhotoLibraryURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *managementQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __127__VCPMediaAnalysisService_InternalTools__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke;
  block[3] = &unk_1E6B16430;
  v19 = v10;
  v20 = &v21;
  v17 = v8;
  v18 = v9;
  block[4] = self;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_sync(managementQueue, block);
  LODWORD(v8) = *((_DWORD *)v22 + 6);

  _Block_object_dispose(&v21, 8);
  return (int)v8;
}

void __127__VCPMediaAnalysisService_InternalTools__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  const void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  _QWORD aBlock[5];
  __int128 v23;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_QWORD *)(a1 + 48))
    v5 = *(const void **)(a1 + 48);
  else
    v5 = &__block_literal_global_663;
  v6 = _Block_copy(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __127__VCPMediaAnalysisService_InternalTools__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E6B15DB8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v18 = *(_OWORD *)(a1 + 56);
  v9 = (id)v18;
  v23 = v18;
  v10 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *(void **)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 64);
  v15 = *(unsigned int *)(*(_QWORD *)(v13 + 8) + 24);
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __127__VCPMediaAnalysisService_InternalTools__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3_666;
  v19[3] = &unk_1E6B163E8;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v21 = v13;
  v19[4] = v16;
  v20 = v14;
  objc_msgSend(v12, "requestResetFaceClusteringState:withPhotoLibraryURL:andReply:", v15, v17, v19);

}

void __127__VCPMediaAnalysisService_InternalTools__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request ResetFaceClusteringState service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __127__VCPMediaAnalysisService_InternalTools__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_664;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __127__VCPMediaAnalysisService_InternalTools__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_664(uint64_t a1)
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
  v5[2] = __127__VCPMediaAnalysisService_InternalTools__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_665;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __127__VCPMediaAnalysisService_InternalTools__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_665(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __127__VCPMediaAnalysisService_InternalTools__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3_666(uint64_t a1, char a2, void *a3)
{
  id v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[5];
  id v13;
  __int128 v14;
  char v15;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v6 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v17 = v6;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request ResetFaceClusteringState %d has completed", buf, 8u);
  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __127__VCPMediaAnalysisService_InternalTools__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_667;
  block[3] = &unk_1E6B163C0;
  block[4] = v7;
  v11 = *(_OWORD *)(a1 + 40);
  v9 = (id)v11;
  v14 = v11;
  v15 = a2;
  v13 = v5;
  v10 = v5;
  dispatch_async(v8, block);

}

void __127__VCPMediaAnalysisService_InternalTools__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_667(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  char v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __127__VCPMediaAnalysisService_InternalTools__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_668;
  block[3] = &unk_1E6B16398;
  v7 = *(id *)(a1 + 48);
  v8 = *(_BYTE *)(a1 + 64);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, block);

}

uint64_t __127__VCPMediaAnalysisService_InternalTools__requestResetFaceClusteringStateWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_668(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (int)requestReclusterFacesWithPhotoLibraryURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *managementQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __117__VCPMediaAnalysisService_InternalTools__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke;
  block[3] = &unk_1E6B16430;
  v19 = v10;
  v20 = &v21;
  v17 = v8;
  v18 = v9;
  block[4] = self;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_sync(managementQueue, block);
  LODWORD(v8) = *((_DWORD *)v22 + 6);

  _Block_object_dispose(&v21, 8);
  return (int)v8;
}

void __117__VCPMediaAnalysisService_InternalTools__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  const void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  _QWORD aBlock[5];
  __int128 v23;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_QWORD *)(a1 + 48))
    v5 = *(const void **)(a1 + 48);
  else
    v5 = &__block_literal_global_669;
  v6 = _Block_copy(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __117__VCPMediaAnalysisService_InternalTools__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E6B15DB8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v18 = *(_OWORD *)(a1 + 56);
  v9 = (id)v18;
  v23 = v18;
  v10 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *(void **)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 64);
  v15 = *(unsigned int *)(*(_QWORD *)(v13 + 8) + 24);
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __117__VCPMediaAnalysisService_InternalTools__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3_672;
  v19[3] = &unk_1E6B163E8;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v21 = v13;
  v19[4] = v16;
  v20 = v14;
  objc_msgSend(v12, "requestReclusterFaces:withPhotoLibraryURL:andReply:", v15, v17, v19);

}

void __117__VCPMediaAnalysisService_InternalTools__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request ReclusterFaces service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __117__VCPMediaAnalysisService_InternalTools__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_670;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __117__VCPMediaAnalysisService_InternalTools__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_670(uint64_t a1)
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
  v5[2] = __117__VCPMediaAnalysisService_InternalTools__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_671;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __117__VCPMediaAnalysisService_InternalTools__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_671(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __117__VCPMediaAnalysisService_InternalTools__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_3_672(uint64_t a1, char a2, void *a3)
{
  id v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[5];
  id v13;
  __int128 v14;
  char v15;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v6 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v17 = v6;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request ReclusterFaces %d has completed", buf, 8u);
  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __117__VCPMediaAnalysisService_InternalTools__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_673;
  block[3] = &unk_1E6B163C0;
  block[4] = v7;
  v11 = *(_OWORD *)(a1 + 40);
  v9 = (id)v11;
  v14 = v11;
  v15 = a2;
  v13 = v5;
  v10 = v5;
  dispatch_async(v8, block);

}

void __117__VCPMediaAnalysisService_InternalTools__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_673(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  char v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __117__VCPMediaAnalysisService_InternalTools__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_674;
  block[3] = &unk_1E6B16398;
  v7 = *(id *)(a1 + 48);
  v8 = *(_BYTE *)(a1 + 64);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, block);

}

uint64_t __117__VCPMediaAnalysisService_InternalTools__requestReclusterFacesWithPhotoLibraryURL_progressHandler_completionHandler___block_invoke_2_674(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (int)requestRebuildPersonsWithLocalIdentifiers:(id)a3 photoLibraryURL:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *managementQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  managementQueue = self->_managementQueue;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __134__VCPMediaAnalysisService_InternalTools__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke;
  v20[3] = &unk_1E6B15F38;
  v24 = v13;
  v25 = &v26;
  v20[4] = self;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v15 = v11;
  v16 = v10;
  v17 = v13;
  v18 = v12;
  dispatch_sync(managementQueue, v20);
  LODWORD(v10) = *((_DWORD *)v27 + 6);

  _Block_object_dispose(&v26, 8);
  return (int)v10;
}

void __134__VCPMediaAnalysisService_InternalTools__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  const void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  _QWORD aBlock[5];
  __int128 v24;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_QWORD *)(a1 + 56))
    v5 = *(const void **)(a1 + 56);
  else
    v5 = &__block_literal_global_675;
  v6 = _Block_copy(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __134__VCPMediaAnalysisService_InternalTools__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E6B15DB8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v19 = *(_OWORD *)(a1 + 64);
  v9 = (id)v19;
  v24 = v19;
  v10 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *(void **)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 72);
  v15 = *(unsigned int *)(*(_QWORD *)(v13 + 8) + 24);
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __134__VCPMediaAnalysisService_InternalTools__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke_3_678;
  v20[3] = &unk_1E6B163E8;
  v17 = *(_QWORD *)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 48);
  v18 = *(_QWORD *)(a1 + 32);
  v22 = v13;
  v20[4] = v18;
  v21 = v14;
  objc_msgSend(v12, "requestRebuildPersons:withLocalIdentifiers:andPhotoLibraryURL:andReply:", v15, v17, v16, v20);

}

void __134__VCPMediaAnalysisService_InternalTools__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request RebuildPersons service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __134__VCPMediaAnalysisService_InternalTools__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke_676;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __134__VCPMediaAnalysisService_InternalTools__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke_676(uint64_t a1)
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
  v5[2] = __134__VCPMediaAnalysisService_InternalTools__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke_2_677;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __134__VCPMediaAnalysisService_InternalTools__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke_2_677(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __134__VCPMediaAnalysisService_InternalTools__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke_3_678(uint64_t a1, char a2, void *a3)
{
  id v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[5];
  id v13;
  __int128 v14;
  char v15;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v6 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v17 = v6;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request RebuildPersons %d has completed", buf, 8u);
  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __134__VCPMediaAnalysisService_InternalTools__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke_679;
  block[3] = &unk_1E6B163C0;
  block[4] = v7;
  v11 = *(_OWORD *)(a1 + 40);
  v9 = (id)v11;
  v14 = v11;
  v15 = a2;
  v13 = v5;
  v10 = v5;
  dispatch_async(v8, block);

}

void __134__VCPMediaAnalysisService_InternalTools__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke_679(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  char v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __134__VCPMediaAnalysisService_InternalTools__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke_2_680;
  block[3] = &unk_1E6B16398;
  v7 = *(id *)(a1 + 48);
  v8 = *(_BYTE *)(a1 + 64);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, block);

}

uint64_t __134__VCPMediaAnalysisService_InternalTools__requestRebuildPersonsWithLocalIdentifiers_photoLibraryURL_progressHandler_completionHandler___block_invoke_2_680(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (int)queryAutoCounterOptInStatusForPhotoLibraryURL:(id)a3 withPersonLocalIdentifiers:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *managementQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __133__VCPMediaAnalysisService_InternalTools__queryAutoCounterOptInStatusForPhotoLibraryURL_withPersonLocalIdentifiers_completionHandler___block_invoke;
  block[3] = &unk_1E6B15FB0;
  v19 = v10;
  v20 = &v21;
  block[4] = self;
  v17 = v8;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_sync(managementQueue, block);
  LODWORD(v8) = *((_DWORD *)v22 + 6);

  _Block_object_dispose(&v21, 8);
  return (int)v8;
}

void __133__VCPMediaAnalysisService_InternalTools__queryAutoCounterOptInStatusForPhotoLibraryURL_withPersonLocalIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  _QWORD aBlock[5];
  __int128 v21;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", &__block_literal_global_681, v5);

  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __133__VCPMediaAnalysisService_InternalTools__queryAutoCounterOptInStatusForPhotoLibraryURL_withPersonLocalIdentifiers_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E6B15DB8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v16 = *(_OWORD *)(a1 + 56);
  v7 = (id)v16;
  v21 = v16;
  v8 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(_QWORD *)(a1 + 64);
  v12 = *(unsigned int *)(*(_QWORD *)(v11 + 8) + 24);
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __133__VCPMediaAnalysisService_InternalTools__queryAutoCounterOptInStatusForPhotoLibraryURL_withPersonLocalIdentifiers_completionHandler___block_invoke_3_684;
  v17[3] = &unk_1E6B15E30;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 40);
  v19 = v11;
  v17[4] = v13;
  v15 = *(_QWORD *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  objc_msgSend(v10, "queryAutoCounterOptInStatus:withPhotoLibraryURL:personLocalIdentifiers:andReply:", v12, v14, v15, v17);

}

void __133__VCPMediaAnalysisService_InternalTools__queryAutoCounterOptInStatusForPhotoLibraryURL_withPersonLocalIdentifiers_completionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to query AutoCounter Opt-In status service", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __133__VCPMediaAnalysisService_InternalTools__queryAutoCounterOptInStatusForPhotoLibraryURL_withPersonLocalIdentifiers_completionHandler___block_invoke_682;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __133__VCPMediaAnalysisService_InternalTools__queryAutoCounterOptInStatusForPhotoLibraryURL_withPersonLocalIdentifiers_completionHandler___block_invoke_682(uint64_t a1)
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
  v5[2] = __133__VCPMediaAnalysisService_InternalTools__queryAutoCounterOptInStatusForPhotoLibraryURL_withPersonLocalIdentifiers_completionHandler___block_invoke_2_683;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __133__VCPMediaAnalysisService_InternalTools__queryAutoCounterOptInStatusForPhotoLibraryURL_withPersonLocalIdentifiers_completionHandler___block_invoke_2_683(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __133__VCPMediaAnalysisService_InternalTools__queryAutoCounterOptInStatusForPhotoLibraryURL_withPersonLocalIdentifiers_completionHandler___block_invoke_3_684(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD block[5];
  id v15;
  id v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v19 = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Query AutoCounter Opt-In status %d has completed", buf, 8u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __133__VCPMediaAnalysisService_InternalTools__queryAutoCounterOptInStatusForPhotoLibraryURL_withPersonLocalIdentifiers_completionHandler___block_invoke_685;
  block[3] = &unk_1E6B15E08;
  block[4] = v8;
  v13 = *(_OWORD *)(a1 + 40);
  v10 = (id)v13;
  v17 = v13;
  v15 = v5;
  v16 = v6;
  v11 = v6;
  v12 = v5;
  dispatch_async(v9, block);

}

void __133__VCPMediaAnalysisService_InternalTools__queryAutoCounterOptInStatusForPhotoLibraryURL_withPersonLocalIdentifiers_completionHandler___block_invoke_685(uint64_t a1)
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
  block[2] = __133__VCPMediaAnalysisService_InternalTools__queryAutoCounterOptInStatusForPhotoLibraryURL_withPersonLocalIdentifiers_completionHandler___block_invoke_2_686;
  block[3] = &unk_1E6B15DE0;
  v8 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __133__VCPMediaAnalysisService_InternalTools__queryAutoCounterOptInStatusForPhotoLibraryURL_withPersonLocalIdentifiers_completionHandler___block_invoke_2_686(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestOptInAutoCounterForPhotoLibraryURL:(id)a3 withPersons:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *managementQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114__VCPMediaAnalysisService_InternalTools__requestOptInAutoCounterForPhotoLibraryURL_withPersons_completionHandler___block_invoke;
  block[3] = &unk_1E6B15FB0;
  v19 = v10;
  v20 = &v21;
  block[4] = self;
  v17 = v8;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_sync(managementQueue, block);
  LODWORD(v8) = *((_DWORD *)v22 + 6);

  _Block_object_dispose(&v21, 8);
  return (int)v8;
}

void __114__VCPMediaAnalysisService_InternalTools__requestOptInAutoCounterForPhotoLibraryURL_withPersons_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  _QWORD aBlock[5];
  __int128 v21;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", &__block_literal_global_687, v5);

  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __114__VCPMediaAnalysisService_InternalTools__requestOptInAutoCounterForPhotoLibraryURL_withPersons_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E6B15DB8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v16 = *(_OWORD *)(a1 + 56);
  v7 = (id)v16;
  v21 = v16;
  v8 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(_QWORD *)(a1 + 64);
  v12 = *(unsigned int *)(*(_QWORD *)(v11 + 8) + 24);
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __114__VCPMediaAnalysisService_InternalTools__requestOptInAutoCounterForPhotoLibraryURL_withPersons_completionHandler___block_invoke_3_690;
  v17[3] = &unk_1E6B15E30;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 40);
  v19 = v11;
  v17[4] = v13;
  v15 = *(_QWORD *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  objc_msgSend(v10, "requestOptInAutoCounter:withPhotoLibraryURL:persons:andReply:", v12, v14, v15, v17);

}

void __114__VCPMediaAnalysisService_InternalTools__requestOptInAutoCounterForPhotoLibraryURL_withPersons_completionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request Opt-In AutoCounter", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114__VCPMediaAnalysisService_InternalTools__requestOptInAutoCounterForPhotoLibraryURL_withPersons_completionHandler___block_invoke_688;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __114__VCPMediaAnalysisService_InternalTools__requestOptInAutoCounterForPhotoLibraryURL_withPersons_completionHandler___block_invoke_688(uint64_t a1)
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
  v5[2] = __114__VCPMediaAnalysisService_InternalTools__requestOptInAutoCounterForPhotoLibraryURL_withPersons_completionHandler___block_invoke_2_689;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __114__VCPMediaAnalysisService_InternalTools__requestOptInAutoCounterForPhotoLibraryURL_withPersons_completionHandler___block_invoke_2_689(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __114__VCPMediaAnalysisService_InternalTools__requestOptInAutoCounterForPhotoLibraryURL_withPersons_completionHandler___block_invoke_3_690(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD block[5];
  id v15;
  id v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v19 = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request Opt-In AutoCounter %d has completed", buf, 8u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114__VCPMediaAnalysisService_InternalTools__requestOptInAutoCounterForPhotoLibraryURL_withPersons_completionHandler___block_invoke_691;
  block[3] = &unk_1E6B15E08;
  block[4] = v8;
  v13 = *(_OWORD *)(a1 + 40);
  v10 = (id)v13;
  v17 = v13;
  v15 = v5;
  v16 = v6;
  v11 = v6;
  v12 = v5;
  dispatch_async(v9, block);

}

void __114__VCPMediaAnalysisService_InternalTools__requestOptInAutoCounterForPhotoLibraryURL_withPersons_completionHandler___block_invoke_691(uint64_t a1)
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
  block[2] = __114__VCPMediaAnalysisService_InternalTools__requestOptInAutoCounterForPhotoLibraryURL_withPersons_completionHandler___block_invoke_2_692;
  block[3] = &unk_1E6B15DE0;
  v8 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __114__VCPMediaAnalysisService_InternalTools__requestOptInAutoCounterForPhotoLibraryURL_withPersons_completionHandler___block_invoke_2_692(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestDumpAutoCounterForPhotoLibraryURL:(id)a3 completionHandler:(id)a4
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
  v19 = 0;
  managementQueue = self->_managementQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __101__VCPMediaAnalysisService_InternalTools__requestDumpAutoCounterForPhotoLibraryURL_completionHandler___block_invoke;
  v12[3] = &unk_1E6B161A0;
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

void __101__VCPMediaAnalysisService_InternalTools__requestDumpAutoCounterForPhotoLibraryURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  _QWORD aBlock[5];
  __int128 v21;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", &__block_literal_global_693, v5);

  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__VCPMediaAnalysisService_InternalTools__requestDumpAutoCounterForPhotoLibraryURL_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E6B15DB8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v16 = *(_OWORD *)(a1 + 48);
  v7 = (id)v16;
  v21 = v16;
  v8 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *(void **)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v13 = *(unsigned int *)(*(_QWORD *)(v11 + 8) + 24);
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __101__VCPMediaAnalysisService_InternalTools__requestDumpAutoCounterForPhotoLibraryURL_completionHandler___block_invoke_3_696;
  v17[3] = &unk_1E6B15E30;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  v19 = v11;
  v17[4] = v14;
  v18 = v12;
  objc_msgSend(v10, "requestDumpAutoCounter:withPhotoLibraryURL:andReply:", v13, v15, v17);

}

void __101__VCPMediaAnalysisService_InternalTools__requestDumpAutoCounterForPhotoLibraryURL_completionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request AutoCounter dump", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__VCPMediaAnalysisService_InternalTools__requestDumpAutoCounterForPhotoLibraryURL_completionHandler___block_invoke_694;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __101__VCPMediaAnalysisService_InternalTools__requestDumpAutoCounterForPhotoLibraryURL_completionHandler___block_invoke_694(uint64_t a1)
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
  v5[2] = __101__VCPMediaAnalysisService_InternalTools__requestDumpAutoCounterForPhotoLibraryURL_completionHandler___block_invoke_2_695;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __101__VCPMediaAnalysisService_InternalTools__requestDumpAutoCounterForPhotoLibraryURL_completionHandler___block_invoke_2_695(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __101__VCPMediaAnalysisService_InternalTools__requestDumpAutoCounterForPhotoLibraryURL_completionHandler___block_invoke_3_696(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD block[5];
  id v15;
  id v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v19 = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request AutoCounter dump %d has completed", buf, 8u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__VCPMediaAnalysisService_InternalTools__requestDumpAutoCounterForPhotoLibraryURL_completionHandler___block_invoke_697;
  block[3] = &unk_1E6B15E08;
  block[4] = v8;
  v13 = *(_OWORD *)(a1 + 40);
  v10 = (id)v13;
  v17 = v13;
  v15 = v5;
  v16 = v6;
  v11 = v6;
  v12 = v5;
  dispatch_async(v9, block);

}

void __101__VCPMediaAnalysisService_InternalTools__requestDumpAutoCounterForPhotoLibraryURL_completionHandler___block_invoke_697(uint64_t a1)
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
  block[2] = __101__VCPMediaAnalysisService_InternalTools__requestDumpAutoCounterForPhotoLibraryURL_completionHandler___block_invoke_2_698;
  block[3] = &unk_1E6B15DE0;
  v8 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __101__VCPMediaAnalysisService_InternalTools__requestDumpAutoCounterForPhotoLibraryURL_completionHandler___block_invoke_2_698(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestAutoCounterAccuracyCalculationForPhotoLibraryURL:(id)a3 completionHandler:(id)a4
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
  v19 = 0;
  managementQueue = self->_managementQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __116__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_completionHandler___block_invoke;
  v12[3] = &unk_1E6B161A0;
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

void __116__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  _QWORD aBlock[5];
  __int128 v21;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", &__block_literal_global_699, v5);

  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __116__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E6B15DB8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v16 = *(_OWORD *)(a1 + 48);
  v7 = (id)v16;
  v21 = v16;
  v8 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *(void **)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v13 = *(unsigned int *)(*(_QWORD *)(v11 + 8) + 24);
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __116__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_completionHandler___block_invoke_3_702;
  v17[3] = &unk_1E6B15E30;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  v19 = v11;
  v17[4] = v14;
  v18 = v12;
  objc_msgSend(v10, "requestAutoCounterAccuracyCalculation:withPhotoLibraryURL:andReply:", v13, v15, v17);

}

void __116__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_completionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request AutoCounter calculation", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __116__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_completionHandler___block_invoke_700;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __116__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_completionHandler___block_invoke_700(uint64_t a1)
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
  v5[2] = __116__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_completionHandler___block_invoke_2_701;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __116__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_completionHandler___block_invoke_2_701(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __116__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_completionHandler___block_invoke_3_702(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD block[5];
  id v15;
  id v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v19 = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request AutoCounter calculation %d has completed", buf, 8u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __116__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_completionHandler___block_invoke_703;
  block[3] = &unk_1E6B15E08;
  block[4] = v8;
  v13 = *(_OWORD *)(a1 + 40);
  v10 = (id)v13;
  v17 = v13;
  v15 = v5;
  v16 = v6;
  v11 = v6;
  v12 = v5;
  dispatch_async(v9, block);

}

void __116__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_completionHandler___block_invoke_703(uint64_t a1)
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
  block[2] = __116__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_completionHandler___block_invoke_2_704;
  block[3] = &unk_1E6B15DE0;
  v8 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __116__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_completionHandler___block_invoke_2_704(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestAutoCounterAccuracyCalculationForPhotoLibraryURL:(id)a3 clusterStateURL:(id)a4 groundTruthURL:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *managementQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  managementQueue = self->_managementQueue;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __147__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_clusterStateURL_groundTruthURL_completionHandler___block_invoke;
  v20[3] = &unk_1E6B165E0;
  v24 = v13;
  v25 = &v26;
  v20[4] = self;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = v13;
  dispatch_sync(managementQueue, v20);
  LODWORD(self) = *((_DWORD *)v27 + 6);

  _Block_object_dispose(&v26, 8);
  return (int)self;
}

void __147__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_clusterStateURL_groundTruthURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  _QWORD aBlock[5];
  __int128 v23;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", &__block_literal_global_705, v5);

  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __147__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_clusterStateURL_groundTruthURL_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E6B15DB8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v18 = *(_OWORD *)(a1 + 64);
  v7 = (id)v18;
  v23 = v18;
  v8 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *(void **)(a1 + 64);
  v11 = *(_QWORD *)(a1 + 72);
  v13 = *(unsigned int *)(*(_QWORD *)(v11 + 8) + 24);
  v14 = *(_QWORD *)(a1 + 48);
  v15 = *(_QWORD *)(a1 + 56);
  v19[0] = v6;
  v19[1] = 3221225472;
  v19[2] = __147__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_clusterStateURL_groundTruthURL_completionHandler___block_invoke_3_708;
  v19[3] = &unk_1E6B15E30;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v21 = v11;
  v19[4] = v16;
  v20 = v12;
  objc_msgSend(v10, "requestAutoCounterAccuracyCalculation:withPhotoLibraryURL:clusterStateURL:groundTruthURL:andReply:", v13, v17, v14, v15, v19);

}

void __147__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_clusterStateURL_groundTruthURL_completionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request AutoCounter calculation", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __147__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_clusterStateURL_groundTruthURL_completionHandler___block_invoke_706;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __147__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_clusterStateURL_groundTruthURL_completionHandler___block_invoke_706(uint64_t a1)
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
  v5[2] = __147__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_clusterStateURL_groundTruthURL_completionHandler___block_invoke_2_707;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __147__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_clusterStateURL_groundTruthURL_completionHandler___block_invoke_2_707(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __147__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_clusterStateURL_groundTruthURL_completionHandler___block_invoke_3_708(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD block[5];
  id v15;
  id v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v19 = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request AutoCounter calculation %d has completed", buf, 8u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __147__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_clusterStateURL_groundTruthURL_completionHandler___block_invoke_709;
  block[3] = &unk_1E6B15E08;
  block[4] = v8;
  v13 = *(_OWORD *)(a1 + 40);
  v10 = (id)v13;
  v17 = v13;
  v15 = v5;
  v16 = v6;
  v11 = v6;
  v12 = v5;
  dispatch_async(v9, block);

}

void __147__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_clusterStateURL_groundTruthURL_completionHandler___block_invoke_709(uint64_t a1)
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
  block[2] = __147__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_clusterStateURL_groundTruthURL_completionHandler___block_invoke_2_710;
  block[3] = &unk_1E6B15DE0;
  v8 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __147__VCPMediaAnalysisService_InternalTools__requestAutoCounterAccuracyCalculationForPhotoLibraryURL_clusterStateURL_groundTruthURL_completionHandler___block_invoke_2_710(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestAutoCounterSIMLValidationForPhotoLibraryURL:(id)a3 simlGroundTruthURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *managementQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __130__VCPMediaAnalysisService_InternalTools__requestAutoCounterSIMLValidationForPhotoLibraryURL_simlGroundTruthURL_completionHandler___block_invoke;
  block[3] = &unk_1E6B15FB0;
  v19 = v10;
  v20 = &v21;
  block[4] = self;
  v17 = v8;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_sync(managementQueue, block);
  LODWORD(v8) = *((_DWORD *)v22 + 6);

  _Block_object_dispose(&v21, 8);
  return (int)v8;
}

void __130__VCPMediaAnalysisService_InternalTools__requestAutoCounterSIMLValidationForPhotoLibraryURL_simlGroundTruthURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  _QWORD aBlock[5];
  __int128 v21;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", &__block_literal_global_711, v5);

  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __130__VCPMediaAnalysisService_InternalTools__requestAutoCounterSIMLValidationForPhotoLibraryURL_simlGroundTruthURL_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E6B15DB8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v16 = *(_OWORD *)(a1 + 56);
  v7 = (id)v16;
  v21 = v16;
  v8 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(_QWORD *)(a1 + 64);
  v12 = *(unsigned int *)(*(_QWORD *)(v11 + 8) + 24);
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __130__VCPMediaAnalysisService_InternalTools__requestAutoCounterSIMLValidationForPhotoLibraryURL_simlGroundTruthURL_completionHandler___block_invoke_3_714;
  v17[3] = &unk_1E6B15E30;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 40);
  v19 = v11;
  v17[4] = v13;
  v15 = *(_QWORD *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  objc_msgSend(v10, "requestAutoCounterSIMLValidation:withPhotoLibraryURL:simlGroundTruthURL:andReply:", v12, v14, v15, v17);

}

void __130__VCPMediaAnalysisService_InternalTools__requestAutoCounterSIMLValidationForPhotoLibraryURL_simlGroundTruthURL_completionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to request AutoCounter calculation", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __130__VCPMediaAnalysisService_InternalTools__requestAutoCounterSIMLValidationForPhotoLibraryURL_simlGroundTruthURL_completionHandler___block_invoke_712;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __130__VCPMediaAnalysisService_InternalTools__requestAutoCounterSIMLValidationForPhotoLibraryURL_simlGroundTruthURL_completionHandler___block_invoke_712(uint64_t a1)
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
  v5[2] = __130__VCPMediaAnalysisService_InternalTools__requestAutoCounterSIMLValidationForPhotoLibraryURL_simlGroundTruthURL_completionHandler___block_invoke_2_713;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __130__VCPMediaAnalysisService_InternalTools__requestAutoCounterSIMLValidationForPhotoLibraryURL_simlGroundTruthURL_completionHandler___block_invoke_2_713(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __130__VCPMediaAnalysisService_InternalTools__requestAutoCounterSIMLValidationForPhotoLibraryURL_simlGroundTruthURL_completionHandler___block_invoke_3_714(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD block[5];
  id v15;
  id v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v19 = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request AutoCounter SIML validation %d has completed", buf, 8u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __130__VCPMediaAnalysisService_InternalTools__requestAutoCounterSIMLValidationForPhotoLibraryURL_simlGroundTruthURL_completionHandler___block_invoke_715;
  block[3] = &unk_1E6B15E08;
  block[4] = v8;
  v13 = *(_OWORD *)(a1 + 40);
  v10 = (id)v13;
  v17 = v13;
  v15 = v5;
  v16 = v6;
  v11 = v6;
  v12 = v5;
  dispatch_async(v9, block);

}

void __130__VCPMediaAnalysisService_InternalTools__requestAutoCounterSIMLValidationForPhotoLibraryURL_simlGroundTruthURL_completionHandler___block_invoke_715(uint64_t a1)
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
  block[2] = __130__VCPMediaAnalysisService_InternalTools__requestAutoCounterSIMLValidationForPhotoLibraryURL_simlGroundTruthURL_completionHandler___block_invoke_2_716;
  block[3] = &unk_1E6B15DE0;
  v8 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __130__VCPMediaAnalysisService_InternalTools__requestAutoCounterSIMLValidationForPhotoLibraryURL_simlGroundTruthURL_completionHandler___block_invoke_2_716(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestIdentificationOfFaces:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  BOOL v17;
  void *v18;
  NSObject *managementQueue;
  int v20;
  int v21;
  VCPMediaAnalysisService *v23;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;
  uint8_t *v28;
  uint8_t buf[8];
  uint8_t *v30;
  uint64_t v31;
  int v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v7 && v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    v23 = self;
    v12 = 0;
    if (v11)
    {
      v13 = *(_QWORD *)v34;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if (v12)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "photoLibrary");
            v16 = (id)objc_claimAutoreleasedReturnValue();
            v17 = v12 == v16;

            if (!v17)
            {
              v21 = MediaAnalysisLogLevel();
              if (v21 >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Faces must all be from the same Photo Library", buf, 2u);
              }

              v20 = 0;
              goto LABEL_23;
            }
          }
          else
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "photoLibrary");
            v12 = (id)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v15, "localIdentifier", v23);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v18);

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v11)
          continue;
        break;
      }
    }

    *(_QWORD *)buf = 0;
    v30 = buf;
    v31 = 0x2020000000;
    v32 = 0;
    managementQueue = v23->_managementQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__VCPMediaAnalysisService_Hubble__requestIdentificationOfFaces_withCompletionHandler___block_invoke;
    block[3] = &unk_1E6B15FB0;
    v28 = buf;
    block[4] = v23;
    v27 = v7;
    v25 = v9;
    v12 = v12;
    v26 = v12;
    dispatch_sync(managementQueue, block);
    v20 = *((_DWORD *)v30 + 6);

    _Block_object_dispose(buf, 8);
LABEL_23:

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Faces must be non-empty and completion block must be non-nil", buf, 2u);
    }
    v20 = 0;
  }

  return v20;
}

void __86__VCPMediaAnalysisService_Hubble__requestIdentificationOfFaces_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  _QWORD v19[5];
  __int128 v20;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", &__block_literal_global_728, v5);

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __86__VCPMediaAnalysisService_Hubble__requestIdentificationOfFaces_withCompletionHandler___block_invoke_3;
  v19[3] = &unk_1E6B15DB8;
  v19[4] = *(_QWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 56);
  v8 = (id)v15;
  v20 = v15;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "photoLibraryURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 64);
  v14 = *(unsigned int *)(*(_QWORD *)(v12 + 8) + 24);
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __86__VCPMediaAnalysisService_Hubble__requestIdentificationOfFaces_withCompletionHandler___block_invoke_3_731;
  v16[3] = &unk_1E6B16020;
  v16[4] = *(_QWORD *)(a1 + 32);
  v18 = v12;
  v17 = v13;
  objc_msgSend(v9, "requestIdentificationOfFacesWithLocalIdentifiers:fromPhotoLibraryWithURL:withRequestID:andReply:", v10, v11, v14, v16);

}

void __86__VCPMediaAnalysisService_Hubble__requestIdentificationOfFaces_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to Media Analysis", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__VCPMediaAnalysisService_Hubble__requestIdentificationOfFaces_withCompletionHandler___block_invoke_729;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __86__VCPMediaAnalysisService_Hubble__requestIdentificationOfFaces_withCompletionHandler___block_invoke_729(uint64_t a1)
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
  v5[2] = __86__VCPMediaAnalysisService_Hubble__requestIdentificationOfFaces_withCompletionHandler___block_invoke_2_730;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __86__VCPMediaAnalysisService_Hubble__requestIdentificationOfFaces_withCompletionHandler___block_invoke_2_730(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __86__VCPMediaAnalysisService_Hubble__requestIdentificationOfFaces_withCompletionHandler___block_invoke_3_731(uint64_t a1, void *a2, void *a3)
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
  block[2] = __86__VCPMediaAnalysisService_Hubble__requestIdentificationOfFaces_withCompletionHandler___block_invoke_4;
  block[3] = &unk_1E6B15E08;
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

void __86__VCPMediaAnalysisService_Hubble__requestIdentificationOfFaces_withCompletionHandler___block_invoke_4(uint64_t a1)
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
  block[2] = __86__VCPMediaAnalysisService_Hubble__requestIdentificationOfFaces_withCompletionHandler___block_invoke_5;
  block[3] = &unk_1E6B15DE0;
  v8 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __86__VCPMediaAnalysisService_Hubble__requestIdentificationOfFaces_withCompletionHandler___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)requestProcessingTypes:(unint64_t)a3 forAssetsWithLocalIdentifiers:(id)a4 fromPhotoLibraryWithURL:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *managementQueue;
  int v18;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t *v25;
  unint64_t v26;
  uint8_t buf[8];
  uint8_t *v28;
  uint64_t v29;
  int v30;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (a3 && (v16 = objc_msgSend(v12, "count"), v15) && v13 && v16)
  {
    *(_QWORD *)buf = 0;
    v28 = buf;
    v29 = 0x2020000000;
    v30 = 0;
    managementQueue = self->_managementQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __146__VCPMediaAnalysisService_Hubble__requestProcessingTypes_forAssetsWithLocalIdentifiers_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke;
    block[3] = &unk_1E6B15EF0;
    v25 = buf;
    block[4] = self;
    v23 = v14;
    v24 = v15;
    v26 = a3;
    v21 = v12;
    v22 = v13;
    dispatch_sync(managementQueue, block);
    v18 = *((_DWORD *)v28 + 6);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] nil specified for non-nullable parameter", buf, 2u);
    }
    v18 = 0;
  }

  return v18;
}

void __146__VCPMediaAnalysisService_Hubble__requestProcessingTypes_forAssetsWithLocalIdentifiers_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
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
    v5 = &__block_literal_global_732;
  v6 = _Block_copy(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __146__VCPMediaAnalysisService_Hubble__requestProcessingTypes_forAssetsWithLocalIdentifiers_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_3;
  v22[3] = &unk_1E6B15DB8;
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
  v19[2] = __146__VCPMediaAnalysisService_Hubble__requestProcessingTypes_forAssetsWithLocalIdentifiers_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_3_735;
  v19[3] = &unk_1E6B15DB8;
  v17 = *(_QWORD *)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 48);
  v19[4] = *(_QWORD *)(a1 + 32);
  v21 = v12;
  v20 = v14;
  objc_msgSend(v11, "requestProcessingTypes:forAssetsWithLocalIdentifiers:fromPhotoLibraryWithURL:withRequestID:andReply:", v13, v17, v16, v15, v19);

}

void __146__VCPMediaAnalysisService_Hubble__requestProcessingTypes_forAssetsWithLocalIdentifiers_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to Media Analysis", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __146__VCPMediaAnalysisService_Hubble__requestProcessingTypes_forAssetsWithLocalIdentifiers_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_733;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __146__VCPMediaAnalysisService_Hubble__requestProcessingTypes_forAssetsWithLocalIdentifiers_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_733(uint64_t a1)
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
  v5[2] = __146__VCPMediaAnalysisService_Hubble__requestProcessingTypes_forAssetsWithLocalIdentifiers_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_2_734;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __146__VCPMediaAnalysisService_Hubble__requestProcessingTypes_forAssetsWithLocalIdentifiers_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_2_734(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __146__VCPMediaAnalysisService_Hubble__requestProcessingTypes_forAssetsWithLocalIdentifiers_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_3_735(uint64_t a1, void *a2)
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

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __146__VCPMediaAnalysisService_Hubble__requestProcessingTypes_forAssetsWithLocalIdentifiers_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_4;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __146__VCPMediaAnalysisService_Hubble__requestProcessingTypes_forAssetsWithLocalIdentifiers_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_4(uint64_t a1)
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
  v5[2] = __146__VCPMediaAnalysisService_Hubble__requestProcessingTypes_forAssetsWithLocalIdentifiers_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_5;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __146__VCPMediaAnalysisService_Hubble__requestProcessingTypes_forAssetsWithLocalIdentifiers_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (int)downloadVideoEncoderWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *managementQueue;
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
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__VCPMediaAnalysisService_Accessibility__downloadVideoEncoderWithCompletionHandler___block_invoke;
  block[3] = &unk_1E6B16258;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(managementQueue, block);
  LODWORD(managementQueue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)managementQueue;
}

void __84__VCPMediaAnalysisService_Accessibility__downloadVideoEncoderWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  __int128 v9;
  __int128 v10;
  _QWORD v11[5];
  __int128 v12;
  _QWORD v13[5];
  __int128 v14;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__VCPMediaAnalysisService_Accessibility__downloadVideoEncoderWithCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E6B15DB8;
  v13[4] = *(_QWORD *)(a1 + 32);
  v9 = *(_OWORD *)(a1 + 40);
  v6 = (id)v9;
  v14 = v9;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __84__VCPMediaAnalysisService_Accessibility__downloadVideoEncoderWithCompletionHandler___block_invoke_3;
  v11[3] = &unk_1E6B15DB8;
  v11[4] = *(_QWORD *)(a1 + 32);
  v10 = *(_OWORD *)(a1 + 40);
  v8 = (id)v10;
  v12 = v10;
  objc_msgSend(v7, "downloadVideoEncoderIfNeededWithReply:", v11);

}

void __84__VCPMediaAnalysisService_Accessibility__downloadVideoEncoderWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to Media Analysis", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__VCPMediaAnalysisService_Accessibility__downloadVideoEncoderWithCompletionHandler___block_invoke_739;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __84__VCPMediaAnalysisService_Accessibility__downloadVideoEncoderWithCompletionHandler___block_invoke_739(uint64_t a1)
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
  v5[2] = __84__VCPMediaAnalysisService_Accessibility__downloadVideoEncoderWithCompletionHandler___block_invoke_2_740;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __84__VCPMediaAnalysisService_Accessibility__downloadVideoEncoderWithCompletionHandler___block_invoke_2_740(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __84__VCPMediaAnalysisService_Accessibility__downloadVideoEncoderWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
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

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__VCPMediaAnalysisService_Accessibility__downloadVideoEncoderWithCompletionHandler___block_invoke_4;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __84__VCPMediaAnalysisService_Accessibility__downloadVideoEncoderWithCompletionHandler___block_invoke_4(uint64_t a1)
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
  v5[2] = __84__VCPMediaAnalysisService_Accessibility__downloadVideoEncoderWithCompletionHandler___block_invoke_5;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __84__VCPMediaAnalysisService_Accessibility__downloadVideoEncoderWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)defaultDeferredProcessingTypes
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addIndex:", 2);
  objc_msgSend(v2, "addIndex:", 8);
  return v2;
}

- (BOOL)requestDeferredProcessingTypes:(id)a3 assets:(id)a4 error:(id *)a5
{
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v30;
  id obj;
  id v32;
  id v33;
  void *v34;
  _QWORD v36[5];
  uint8_t v37[8];
  uint8_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[5];
  uint8_t buf[8];
  uint8_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;
  _QWORD v58[3];

  v58[1] = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v33 = a4;
  if (objc_msgSend(v32, "count") && objc_msgSend(v33, "count"))
  {
    *(_QWORD *)buf = 0;
    v49 = buf;
    v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__5;
    v52 = __Block_byref_object_dispose__5;
    v53 = 0;
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __80__VCPMediaAnalysisService_Moments__requestDeferredProcessingTypes_assets_error___block_invoke;
    v47[3] = &unk_1E6B16668;
    v47[4] = buf;
    objc_msgSend(v32, "enumerateIndexesUsingBlock:", v47);
    v6 = (void *)*((_QWORD *)v49 + 5);
    if (v6)
    {
      v7 = 0;
      *a5 = (id)objc_msgSend(v6, "copy");
    }
    else
    {
      objc_msgSend(v33, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "photoLibrary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "photoLibraryURL");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v33, "count"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      obj = v33;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v44;
        v15 = *MEMORY[0x1E0CB2F90];
        v16 = *MEMORY[0x1E0CB2D50];
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v44 != v14)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
            v19 = (void *)MEMORY[0x1BCCA1B2C]();
            objc_msgSend(v18, "photoLibrary");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "photoLibraryURL");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "isEqual:", v34);

            if ((v22 & 1) != 0)
            {
              objc_msgSend(v18, "localIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "addObject:", v23);
            }
            else
            {
              if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v37 = 0;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] All requested assets must come from the same photo library", v37, 2u);
              }
              v24 = (void *)MEMORY[0x1E0CB35C8];
              v54 = v16;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MediaAnalysis] All requested assets must come from the same photo library"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = v23;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "errorWithDomain:code:userInfo:", v15, -50, v25);
              *a5 = (id)objc_claimAutoreleasedReturnValue();

            }
            objc_autoreleasePoolPop(v19);
            if (!v22)
            {

              v7 = 0;
              goto LABEL_25;
            }
          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
          if (v13)
            continue;
          break;
        }
      }

      *(_QWORD *)v37 = 0;
      v38 = v37;
      v39 = 0x3032000000;
      v40 = __Block_byref_object_copy__5;
      v41 = __Block_byref_object_dispose__5;
      v42 = 0;
      -[VCPMediaAnalysisService connection](self, "connection");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_752);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __80__VCPMediaAnalysisService_Moments__requestDeferredProcessingTypes_assets_error___block_invoke_753;
      v36[3] = &unk_1E6B166B0;
      v36[4] = v37;
      objc_msgSend(v27, "requestDeferredProcessingTypes:forAssetsWithLocalIdentifiers:withPhotoLibraryURL:andReply:", v32, v30, v34, v36);

      *a5 = (id)objc_msgSend(*((id *)v38 + 5), "copy");
      v7 = *((_QWORD *)v38 + 5) == 0;
      _Block_object_dispose(v37, 8);

LABEL_25:
    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] nil specified for non-nullable parameter", buf, 2u);
    }
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v57 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MediaAnalysis] nil specified for non-nullable parameter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    v7 = 0;
  }

  return v7;
}

void __80__VCPMediaAnalysisService_Moments__requestDeferredProcessingTypes_assets_error___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a2 != 2 && a2 != 8)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v15 = a2;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] Invalid deferred processing type %u specified", buf, 8u);
    }
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MediaAnalysis] Invalid deferred processing type %u specified"), a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a3 = 1;
  }
}

void __80__VCPMediaAnalysisService_Moments__requestDeferredProcessingTypes_assets_error___block_invoke_751(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to Media Analysis: %@", (uint8_t *)&v3, 0xCu);
  }

}

void __80__VCPMediaAnalysisService_Moments__requestDeferredProcessingTypes_assets_error___block_invoke_753(uint64_t a1, void *a2)
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

- (id)assetsPendingDeferredProcessingWithPhotoLibraryURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
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
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__5;
  v22 = __Block_byref_object_dispose__5;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  -[VCPMediaAnalysisService connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_754);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __93__VCPMediaAnalysisService_Moments__assetsPendingDeferredProcessingWithPhotoLibraryURL_error___block_invoke_755;
  v11[3] = &unk_1E6B15FD8;
  v11[4] = &v18;
  v11[5] = &v12;
  objc_msgSend(v8, "queryAssetsPendingDeferredProcessingWithPhotoLibraryURL:andReply:", v6, v11);

  *a4 = (id)objc_msgSend((id)v13[5], "copy");
  v9 = (id)v19[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __93__VCPMediaAnalysisService_Moments__assetsPendingDeferredProcessingWithPhotoLibraryURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to Media Analysis: %@", (uint8_t *)&v3, 0xCu);
  }

}

void __93__VCPMediaAnalysisService_Moments__assetsPendingDeferredProcessingWithPhotoLibraryURL_error___block_invoke_755(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = objc_msgSend(v12, "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = objc_msgSend(v5, "copy");
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

- (int)requestForceDeferredProcessingWithProgessHandler:(id)a3 andCompletionHandler:(id)a4
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
  v19 = 0;
  managementQueue = self->_managementQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __106__VCPMediaAnalysisService_Moments__requestForceDeferredProcessingWithProgessHandler_andCompletionHandler___block_invoke;
  v12[3] = &unk_1E6B166F8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = &v16;
  v9 = v7;
  v10 = v6;
  dispatch_sync(managementQueue, v12);
  LODWORD(managementQueue) = *((_DWORD *)v17 + 6);

  _Block_object_dispose(&v16, 8);
  return (int)managementQueue;
}

void __106__VCPMediaAnalysisService_Moments__requestForceDeferredProcessingWithProgessHandler_andCompletionHandler___block_invoke(uint64_t a1)
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
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  _QWORD v20[5];
  __int128 v21;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_QWORD *)(a1 + 40))
    v5 = *(const void **)(a1 + 40);
  else
    v5 = &__block_literal_global_756;
  v6 = _Block_copy(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __106__VCPMediaAnalysisService_Moments__requestForceDeferredProcessingWithProgessHandler_andCompletionHandler___block_invoke_3;
  v20[3] = &unk_1E6B15DB8;
  v20[4] = *(_QWORD *)(a1 + 32);
  v16 = *(_OWORD *)(a1 + 48);
  v10 = (id)v16;
  v21 = v16;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v14 = *(unsigned int *)(*(_QWORD *)(v12 + 8) + 24);
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __106__VCPMediaAnalysisService_Moments__requestForceDeferredProcessingWithProgessHandler_andCompletionHandler___block_invoke_3_759;
  v17[3] = &unk_1E6B15EC8;
  v15 = *(_QWORD *)(a1 + 32);
  v19 = v12;
  v17[4] = v15;
  v18 = v13;
  objc_msgSend(v11, "requestForceDeferredProcessing:andReply:", v14, v17);

}

void __106__VCPMediaAnalysisService_Moments__requestForceDeferredProcessingWithProgessHandler_andCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
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
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to Media Analysis: %@", buf, 0xCu);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__VCPMediaAnalysisService_Moments__requestForceDeferredProcessingWithProgessHandler_andCompletionHandler___block_invoke_757;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __106__VCPMediaAnalysisService_Moments__requestForceDeferredProcessingWithProgessHandler_andCompletionHandler___block_invoke_757(uint64_t a1)
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
  v5[2] = __106__VCPMediaAnalysisService_Moments__requestForceDeferredProcessingWithProgessHandler_andCompletionHandler___block_invoke_2_758;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __106__VCPMediaAnalysisService_Moments__requestForceDeferredProcessingWithProgessHandler_andCompletionHandler___block_invoke_2_758(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __106__VCPMediaAnalysisService_Moments__requestForceDeferredProcessingWithProgessHandler_andCompletionHandler___block_invoke_3_759(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[5];
  id v11;
  __int128 v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v14 = v4;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Request %d has completed", buf, 8u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__VCPMediaAnalysisService_Moments__requestForceDeferredProcessingWithProgessHandler_andCompletionHandler___block_invoke_760;
  block[3] = &unk_1E6B15D90;
  block[4] = v5;
  v9 = *(_OWORD *)(a1 + 40);
  v7 = (id)v9;
  v12 = v9;
  v11 = v3;
  v8 = v3;
  dispatch_async(v6, block);

}

void __106__VCPMediaAnalysisService_Moments__requestForceDeferredProcessingWithProgessHandler_andCompletionHandler___block_invoke_760(uint64_t a1)
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
  v5[2] = __106__VCPMediaAnalysisService_Moments__requestForceDeferredProcessingWithProgessHandler_andCompletionHandler___block_invoke_2_761;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __106__VCPMediaAnalysisService_Moments__requestForceDeferredProcessingWithProgessHandler_andCompletionHandler___block_invoke_2_761(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (int)requestStaticStickerScoringForLibrary:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *managementQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  managementQueue = self->_managementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__VCPMediaAnalysisService_Stickers__requestStaticStickerScoringForLibrary_options_completionHandler___block_invoke;
  block[3] = &unk_1E6B15FB0;
  v19 = v10;
  v20 = &v21;
  block[4] = self;
  v17 = v8;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_sync(managementQueue, block);
  LODWORD(v8) = *((_DWORD *)v22 + 6);

  _Block_object_dispose(&v21, 8);
  return (int)v8;
}

void __101__VCPMediaAnalysisService_Stickers__requestStaticStickerScoringForLibrary_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  __int128 v17;
  _QWORD v18[5];
  __int128 v19;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v3;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", &__block_literal_global_772, v5);

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __101__VCPMediaAnalysisService_Stickers__requestStaticStickerScoringForLibrary_options_completionHandler___block_invoke_3;
  v18[3] = &unk_1E6B15DB8;
  v18[4] = *(_QWORD *)(a1 + 32);
  v14 = *(_OWORD *)(a1 + 56);
  v8 = (id)v14;
  v19 = v14;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 40), "photoLibraryURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 48);
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __101__VCPMediaAnalysisService_Stickers__requestStaticStickerScoringForLibrary_options_completionHandler___block_invoke_3_775;
  v16[3] = &unk_1E6B15EC8;
  v16[4] = *(_QWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 56);
  v13 = (id)v15;
  v17 = v15;
  objc_msgSend(v9, "requestStaticStickerScoring:photoLibraryURL:options:reply:", v10, v11, v12, v16);

}

void __101__VCPMediaAnalysisService_Stickers__requestStaticStickerScoringForLibrary_options_completionHandler___block_invoke_3(uint64_t a1, void *a2)
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
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Error connecting to Media Analysis: %@", buf, 0xCu);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__VCPMediaAnalysisService_Stickers__requestStaticStickerScoringForLibrary_options_completionHandler___block_invoke_773;
  block[3] = &unk_1E6B15D90;
  block[4] = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v3;
  v7 = v3;
  dispatch_async(v5, block);

}

void __101__VCPMediaAnalysisService_Stickers__requestStaticStickerScoringForLibrary_options_completionHandler___block_invoke_773(uint64_t a1)
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
  v5[2] = __101__VCPMediaAnalysisService_Stickers__requestStaticStickerScoringForLibrary_options_completionHandler___block_invoke_2_774;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __101__VCPMediaAnalysisService_Stickers__requestStaticStickerScoringForLibrary_options_completionHandler___block_invoke_2_774(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __101__VCPMediaAnalysisService_Stickers__requestStaticStickerScoringForLibrary_options_completionHandler___block_invoke_3_775(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[5];
  id v13;
  __int128 v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      objc_msgSend(v3, "description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      v16 = v4;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] Sticker score request %d failed (%@)", buf, 0x12u);

    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v6 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    v16 = v6;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis] Sticker score request %d completed", buf, 8u);
  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__VCPMediaAnalysisService_Stickers__requestStaticStickerScoringForLibrary_options_completionHandler___block_invoke_776;
  block[3] = &unk_1E6B15D90;
  block[4] = v7;
  v11 = *(_OWORD *)(a1 + 40);
  v9 = (id)v11;
  v14 = v11;
  v13 = v3;
  v10 = v3;
  dispatch_async(v8, block);

}

void __101__VCPMediaAnalysisService_Stickers__requestStaticStickerScoringForLibrary_options_completionHandler___block_invoke_776(uint64_t a1)
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
  v5[2] = __101__VCPMediaAnalysisService_Stickers__requestStaticStickerScoringForLibrary_options_completionHandler___block_invoke_2_777;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __101__VCPMediaAnalysisService_Stickers__requestStaticStickerScoringForLibrary_options_completionHandler___block_invoke_2_777(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (int)requestOTAMaintenanceWithOptions:(id)a3 progessHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *managementQueue;
  id v12;
  id v13;
  id v14;
  int v15;
  _QWORD v17[5];
  __CFString *v18;
  id v19;
  id v20;
  id v21;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = CFSTR("[RequestOTAMaintenance]");
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ Queuing request ...", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v24 = 0x2020000000;
  v25 = 0;
  managementQueue = self->_managementQueue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __98__VCPMediaAnalysisService_OTA__requestOTAMaintenanceWithOptions_progessHandler_completionHandler___block_invoke;
  v17[3] = &unk_1E6B16798;
  v17[4] = self;
  v18 = CFSTR("[RequestOTAMaintenance]");
  v21 = v10;
  p_buf = &buf;
  v19 = v8;
  v20 = v9;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_sync(managementQueue, v17);
  v15 = *(_DWORD *)(*((_QWORD *)&buf + 1) + 24);

  _Block_object_dispose(&buf, 8);
  return v15;
}

void __98__VCPMediaAnalysisService_OTA__requestOTAMaintenanceWithOptions_progessHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  void *v6;
  const void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 40);
  *(_DWORD *)(v2 + 40) = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v3;
  if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    *(_DWORD *)buf = 138412546;
    v32 = v4;
    v33 = 1024;
    v34 = v5;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ Starting Request %d", buf, 0x12u);
  }
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_QWORD *)(a1 + 56))
    v7 = *(const void **)(a1 + 56);
  else
    v7 = &__block_literal_global_783;
  v8 = _Block_copy(v7);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v8, v9);

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __98__VCPMediaAnalysisService_OTA__requestOTAMaintenanceWithOptions_progessHandler_completionHandler___block_invoke_2;
  v27[3] = &unk_1E6B16748;
  v12 = *(id *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 32);
  v28 = v12;
  v29 = v13;
  v21 = *(_OWORD *)(a1 + 64);
  v14 = (id)v21;
  v30 = v21;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v27);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  v23[0] = v11;
  v23[1] = 3221225472;
  v23[2] = __98__VCPMediaAnalysisService_OTA__requestOTAMaintenanceWithOptions_progessHandler_completionHandler___block_invoke_3;
  v23[3] = &unk_1E6B16770;
  v17 = *(_QWORD *)(a1 + 48);
  v18 = *(id *)(a1 + 40);
  v19 = *(_QWORD *)(a1 + 32);
  v24 = v18;
  v25 = v19;
  v22 = *(_OWORD *)(a1 + 64);
  v20 = (id)v22;
  v26 = v22;
  objc_msgSend(v15, "requestOTAMaintenance:options:reply:", v16, v17, v23);

}

void __98__VCPMediaAnalysisService_OTA__requestOTAMaintenanceWithOptions_progessHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[5];
  id v11;
  __int128 v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v14 = v4;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Error connecting to MAD: %@", buf, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__VCPMediaAnalysisService_OTA__requestOTAMaintenanceWithOptions_progessHandler_completionHandler___block_invoke_784;
  block[3] = &unk_1E6B15D90;
  block[4] = v5;
  v9 = *(_OWORD *)(a1 + 48);
  v7 = (id)v9;
  v12 = v9;
  v11 = v3;
  v8 = v3;
  dispatch_async(v6, block);

}

void __98__VCPMediaAnalysisService_OTA__requestOTAMaintenanceWithOptions_progessHandler_completionHandler___block_invoke_784(uint64_t a1)
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
  v5[2] = __98__VCPMediaAnalysisService_OTA__requestOTAMaintenanceWithOptions_progessHandler_completionHandler___block_invoke_2_785;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __98__VCPMediaAnalysisService_OTA__requestOTAMaintenanceWithOptions_progessHandler_completionHandler___block_invoke_2_785(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __98__VCPMediaAnalysisService_OTA__requestOTAMaintenanceWithOptions_progessHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  __int128 v10;
  _QWORD block[5];
  id v12;
  __int128 v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    *(_DWORD *)buf = 138412546;
    v15 = v4;
    v16 = 1024;
    v17 = v5;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ Request %d has completed", buf, 0x12u);
  }
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__VCPMediaAnalysisService_OTA__requestOTAMaintenanceWithOptions_progessHandler_completionHandler___block_invoke_786;
  block[3] = &unk_1E6B15D90;
  block[4] = v6;
  v10 = *(_OWORD *)(a1 + 48);
  v8 = (id)v10;
  v13 = v10;
  v12 = v3;
  v9 = v3;
  dispatch_async(v7, block);

}

void __98__VCPMediaAnalysisService_OTA__requestOTAMaintenanceWithOptions_progessHandler_completionHandler___block_invoke_786(uint64_t a1)
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
  v5[2] = __98__VCPMediaAnalysisService_OTA__requestOTAMaintenanceWithOptions_progessHandler_completionHandler___block_invoke_2_787;
  v5[3] = &unk_1E6B15D68;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

uint64_t __98__VCPMediaAnalysisService_OTA__requestOTAMaintenanceWithOptions_progessHandler_completionHandler___block_invoke_2_787(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end

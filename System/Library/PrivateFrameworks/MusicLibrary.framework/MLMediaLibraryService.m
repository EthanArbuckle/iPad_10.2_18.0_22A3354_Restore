@implementation MLMediaLibraryService

void __54__MLMediaLibraryService_validateDatabaseAtPath_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __43__MLMediaLibraryService__serviceConnection__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id from;
  id location;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.medialibraryd.xpc"), 0);
    +[MLMediaLibraryServiceInterface serviceInterface](MLMediaLibraryServiceInterface, "serviceInterface");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setRemoteObjectInterface:", v3);

    +[MLMediaLibraryServiceInterface clientInterface](MLMediaLibraryServiceInterface, "clientInterface");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setExportedInterface:", v4);

    objc_msgSend(v2, "setExportedObject:", *(_QWORD *)(a1 + 32));
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_initWeak(&from, v2);
    v5 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __43__MLMediaLibraryService__serviceConnection__block_invoke_2;
    v11[3] = &unk_1E5B64A48;
    objc_copyWeak(&v12, &from);
    objc_msgSend(v2, "setInterruptionHandler:", v11);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __43__MLMediaLibraryService__serviceConnection__block_invoke_189;
    v8[3] = &unk_1E5B64A70;
    objc_copyWeak(&v9, &from);
    objc_copyWeak(&v10, &location);
    objc_msgSend(v2, "setInvalidationHandler:", v8);
    objc_msgSend(v2, "resume");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    *(_QWORD *)(v6 + 24) = v2;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __50__MLMediaLibraryService_sharedMediaLibraryService__block_invoke()
{
  MLMediaLibraryService *v0;
  void *v1;

  v0 = objc_alloc_init(MLMediaLibraryService);
  v1 = (void *)sharedMediaLibraryService___service;
  sharedMediaLibraryService___service = (uint64_t)v0;

}

- (MLMediaLibraryService)init
{
  MLMediaLibraryService *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *serialQueue;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *replyQueue;
  NSMutableDictionary *v8;
  NSMutableDictionary *progressBlocksByUUID;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MLMediaLibraryService;
  v2 = -[MLMediaLibraryService init](&v11, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.MusicLibrary.MLMediaLibraryService", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.MusicLibrary.MLMediaLibraryServiceReplyQueue", v5);
    replyQueue = v2->_replyQueue;
    v2->_replyQueue = (OS_dispatch_queue *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    progressBlocksByUUID = v2->_progressBlocksByUUID;
    v2->_progressBlocksByUUID = v8;

  }
  return v2;
}

- (BOOL)executeUpdate:(id)a3 withParameters:(id)a4 onTransaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  BOOL v18;
  _QWORD v20[6];
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__16725;
  v33 = __Block_byref_object_dispose__16726;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  -[MLMediaLibraryService _serviceConnection](self, "_serviceConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __74__MLMediaLibraryService_executeUpdate_withParameters_onTransaction_error___block_invoke;
  v21[3] = &unk_1E5B64870;
  v15 = v12;
  v22 = v15;
  v23 = &v29;
  v24 = &v25;
  objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)v30[5];
  if (v17)
  {
    v18 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v17);
  }
  else
  {
    v20[0] = v14;
    v20[1] = 3221225472;
    v20[2] = __74__MLMediaLibraryService_executeUpdate_withParameters_onTransaction_error___block_invoke_2;
    v20[3] = &unk_1E5B64730;
    v20[4] = &v25;
    v20[5] = &v29;
    objc_msgSend(v16, "executeUpdate:withParameters:onTransaction:withCompletionHandler:", v10, v11, v15, v20);
    if (a6)
      *a6 = objc_retainAutorelease((id)v30[5]);
    v18 = *((_BYTE *)v26 + 24) != 0;
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v18;
}

- (BOOL)endTransaction:(id)a3 shouldCommit:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;
  _QWORD v16[6];
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v6 = a4;
  v8 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__16725;
  v25 = __Block_byref_object_dispose__16726;
  v26 = 0;
  -[MLMediaLibraryService _serviceConnection](self, "_serviceConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __59__MLMediaLibraryService_endTransaction_shouldCommit_error___block_invoke;
  v17[3] = &unk_1E5B64870;
  v11 = v8;
  v18 = v11;
  v19 = &v21;
  v20 = &v27;
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)v22[5];
  if (v13)
  {
    v14 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v13);
  }
  else
  {
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __59__MLMediaLibraryService_endTransaction_shouldCommit_error___block_invoke_2;
    v16[3] = &unk_1E5B64730;
    v16[4] = &v27;
    v16[5] = &v21;
    objc_msgSend(v12, "endTransaction:shouldCommit:withCompletionHandler:", v11, v6, v16);
    if (a5)
      *a5 = objc_retainAutorelease((id)v22[5]);
    v14 = *((_BYTE *)v28 + 24) != 0;
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (id)beginTransactionForDatabaseWithContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__16725;
  v28 = __Block_byref_object_dispose__16726;
  v29 = 0;
  -[MLMediaLibraryService _serviceConnection](self, "_serviceConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __70__MLMediaLibraryService_beginTransactionForDatabaseWithContext_error___block_invoke;
  v21[3] = &unk_1E5B64708;
  v9 = v6;
  v22 = v9;
  v23 = &v24;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)v25[5];
  if (v11)
  {
    v12 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v11);
  }
  else
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__16725;
    v19 = __Block_byref_object_dispose__16726;
    v20 = 0;
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __70__MLMediaLibraryService_beginTransactionForDatabaseWithContext_error___block_invoke_2;
    v14[3] = &unk_1E5B64848;
    v14[4] = &v15;
    v14[5] = &v24;
    objc_msgSend(v10, "beginTransactionForDatabaseWithContext:completionHandler:", v9, v14);
    if (a4)
      *a4 = objc_retainAutorelease((id)v25[5]);
    v12 = (id)v16[5];
    _Block_object_dispose(&v15, 8);

  }
  _Block_object_dispose(&v24, 8);

  return v12;
}

+ (id)sharedMediaLibraryService
{
  if (sharedMediaLibraryService___once != -1)
    dispatch_once(&sharedMediaLibraryService___once, &__block_literal_global_16805);
  return (id)sharedMediaLibraryService___service;
}

- (void)getLanguageResourcesWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t);
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];
  _QWORD v9[5];
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

  v4 = (void (**)(id, uint64_t, uint64_t))a3;
  if (v4)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__16725;
    v20 = __Block_byref_object_dispose__16726;
    v21 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__16725;
    v14 = __Block_byref_object_dispose__16726;
    v15 = 0;
    -[MLMediaLibraryService _serviceConnection](self, "_serviceConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__MLMediaLibraryService_getLanguageResourcesWithCompletion___block_invoke;
    v9[3] = &unk_1E5B64938;
    v9[4] = &v10;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __60__MLMediaLibraryService_getLanguageResourcesWithCompletion___block_invoke_2;
    v8[3] = &unk_1E5B64960;
    v8[4] = &v16;
    v8[5] = &v10;
    objc_msgSend(v7, "getLanguageResourcesWithCompletion:", v8);

    v4[2](v4, v17[5], v11[5]);
    _Block_object_dispose(&v10, 8);

    _Block_object_dispose(&v16, 8);
  }

}

- (BOOL)validateDatabaseAtPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  char v11;
  _QWORD v13[6];
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__16725;
  v21 = __Block_byref_object_dispose__16726;
  v22 = 0;
  -[MLMediaLibraryService _serviceConnection](self, "_serviceConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__MLMediaLibraryService_validateDatabaseAtPath_error___block_invoke;
  v14[3] = &unk_1E5B64708;
  v9 = v6;
  v15 = v9;
  v16 = &v17;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __54__MLMediaLibraryService_validateDatabaseAtPath_error___block_invoke_2;
  v13[3] = &unk_1E5B64730;
  v13[4] = &v23;
  v13[5] = &v17;
  objc_msgSend(v10, "validateDatabaseAtPath:withCompletionHandler:", v9, v13);

  if (a4)
    *a4 = objc_retainAutorelease((id)v18[5]);
  v11 = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

- (id)_serviceConnection
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__MLMediaLibraryService__serviceConnection__block_invoke;
  block[3] = &unk_1E5B65D80;
  block[4] = self;
  dispatch_sync(serialQueue, block);
  return self->_serviceConnection;
}

void __60__MLMediaLibraryService_getLanguageResourcesWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __74__MLMediaLibraryService_executeUpdate_withParameters_onTransaction_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __59__MLMediaLibraryService_endTransaction_shouldCommit_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __70__MLMediaLibraryService_beginTransactionForDatabaseWithContext_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_serviceConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MLMediaLibraryService;
  -[MLMediaLibraryService dealloc](&v3, sel_dealloc);
}

- (void)attemptDatabaseFileRecoveryAtPath:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  MLMediaLibraryService *v18;
  id v19;

  v6 = a3;
  v7 = a4;
  -[MLMediaLibraryService _serviceConnection](self, "_serviceConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __81__MLMediaLibraryService_attemptDatabaseFileRecoveryAtPath_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E5B64780;
  v17 = v6;
  v10 = v7;
  v18 = self;
  v19 = v10;
  v11 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __81__MLMediaLibraryService_attemptDatabaseFileRecoveryAtPath_withCompletionHandler___block_invoke_3;
  v14[3] = &unk_1E5B64CC8;
  v14[4] = self;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v12, "attemptDatabaseFileRecoveryAtPath:withCompletionHandler:", v11, v14);

}

- (void)checkIntegrityOfDatabaseAtPath:(id)a3 repairFaults:(BOOL)a4 withCompletionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[MLMediaLibraryService _serviceConnection](self, "_serviceConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __91__MLMediaLibraryService_checkIntegrityOfDatabaseAtPath_repairFaults_withCompletionHandler___block_invoke;
  v17[3] = &unk_1E5B647D0;
  v12 = v8;
  v17[4] = self;
  v18 = v12;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __91__MLMediaLibraryService_checkIntegrityOfDatabaseAtPath_repairFaults_withCompletionHandler___block_invoke_3;
  v15[3] = &unk_1E5B64CC8;
  v15[4] = self;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "checkIntegrityOfDatabaseAtPath:repairFaults:withCompletionHandler:", v9, v5, v15);

}

- (void)performDiagnosticWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  -[MLMediaLibraryService _serviceConnection](self, "_serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__MLMediaLibraryService_performDiagnosticWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E5B647D0;
  v7 = v4;
  v12[4] = self;
  v13 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __64__MLMediaLibraryService_performDiagnosticWithCompletionHandler___block_invoke_3;
  v10[3] = &unk_1E5B647F8;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "performDiagnosticWithCompletionHandler:", v10);

}

- (void)recreateDatabaseAtPath:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  MLMediaLibraryService *v18;
  id v19;

  v6 = a3;
  v7 = a4;
  -[MLMediaLibraryService _serviceConnection](self, "_serviceConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __70__MLMediaLibraryService_recreateDatabaseAtPath_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E5B64780;
  v17 = v6;
  v10 = v7;
  v18 = self;
  v19 = v10;
  v11 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __70__MLMediaLibraryService_recreateDatabaseAtPath_withCompletionHandler___block_invoke_3;
  v14[3] = &unk_1E5B64CC8;
  v14[4] = self;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v12, "recreateDatabaseAtPath:withCompletionHandler:", v11, v14);

}

- (void)beginTransactionForDatabaseWithContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  MLMediaLibraryService *v18;
  id v19;

  v6 = a3;
  v7 = a4;
  -[MLMediaLibraryService _serviceConnection](self, "_serviceConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__MLMediaLibraryService_beginTransactionForDatabaseWithContext_completionHandler___block_invoke;
  v16[3] = &unk_1E5B64780;
  v17 = v6;
  v10 = v7;
  v18 = self;
  v19 = v10;
  v11 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __82__MLMediaLibraryService_beginTransactionForDatabaseWithContext_completionHandler___block_invoke_3;
  v14[3] = &unk_1E5B64820;
  v14[4] = self;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v12, "beginTransactionForDatabaseWithContext:completionHandler:", v11, v14);

}

- (void)executeUpdate:(id)a3 withParameters:(id)a4 onTransaction:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;
  MLMediaLibraryService *v24;
  id v25;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  -[MLMediaLibraryService _serviceConnection](self, "_serviceConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __90__MLMediaLibraryService_executeUpdate_withParameters_onTransaction_withCompletionHandler___block_invoke;
  v22[3] = &unk_1E5B64780;
  v23 = v10;
  v16 = v11;
  v24 = self;
  v25 = v16;
  v17 = v10;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __90__MLMediaLibraryService_executeUpdate_withParameters_onTransaction_withCompletionHandler___block_invoke_3;
  v20[3] = &unk_1E5B64CC8;
  v20[4] = self;
  v21 = v16;
  v19 = v16;
  objc_msgSend(v18, "executeUpdate:withParameters:onTransaction:withCompletionHandler:", v13, v12, v17, v20);

}

- (void)executeQuery:(id)a3 withParameters:(id)a4 options:(id)a5 onTransaction:(id)a6 withCompletionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;
  MLMediaLibraryService *v27;
  id v28;

  v12 = a6;
  v13 = a7;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[MLMediaLibraryService _serviceConnection](self, "_serviceConnection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __97__MLMediaLibraryService_executeQuery_withParameters_options_onTransaction_withCompletionHandler___block_invoke;
  v25[3] = &unk_1E5B64780;
  v26 = v12;
  v19 = v13;
  v27 = self;
  v28 = v19;
  v20 = v12;
  objc_msgSend(v17, "remoteObjectProxyWithErrorHandler:", v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v18;
  v23[1] = 3221225472;
  v23[2] = __97__MLMediaLibraryService_executeQuery_withParameters_options_onTransaction_withCompletionHandler___block_invoke_3;
  v23[3] = &unk_1E5B64898;
  v23[4] = self;
  v24 = v19;
  v22 = v19;
  objc_msgSend(v21, "executeQuery:withParameters:options:onTransaction:withCompletionHandler:", v16, v15, v14, v20, v23);

}

- (void)endTransaction:(id)a3 shouldCommit:(BOOL)a4 withCompletionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  MLMediaLibraryService *v20;
  id v21;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[MLMediaLibraryService _serviceConnection](self, "_serviceConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __75__MLMediaLibraryService_endTransaction_shouldCommit_withCompletionHandler___block_invoke;
  v18[3] = &unk_1E5B64780;
  v19 = v8;
  v12 = v9;
  v20 = self;
  v21 = v12;
  v13 = v8;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __75__MLMediaLibraryService_endTransaction_shouldCommit_withCompletionHandler___block_invoke_3;
  v16[3] = &unk_1E5B64CC8;
  v16[4] = self;
  v17 = v12;
  v15 = v12;
  objc_msgSend(v14, "endTransaction:shouldCommit:withCompletionHandler:", v13, v6, v16);

}

- (void)performDatabaseOperation:(unint64_t)a3 withAttributes:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;
  MLMediaLibraryService *v23;
  id v24;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  -[MLMediaLibraryService _serviceConnection](self, "_serviceConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __91__MLMediaLibraryService_performDatabaseOperation_withAttributes_options_completionHandler___block_invoke;
  v21[3] = &unk_1E5B64780;
  v22 = v10;
  v15 = v11;
  v23 = self;
  v24 = v15;
  v16 = v10;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __91__MLMediaLibraryService_performDatabaseOperation_withAttributes_options_completionHandler___block_invoke_3;
  v19[3] = &unk_1E5B64CC8;
  v19[4] = self;
  v20 = v15;
  v18 = v15;
  objc_msgSend(v17, "performDatabaseOperation:withAttributes:options:completionHandler:", a3, v12, v16, v19);

}

- (BOOL)performDatabaseOperation:(unint64_t)a3 withAttributes:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  _QWORD v17[6];
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v10 = a4;
  v11 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__16725;
  v23 = __Block_byref_object_dispose__16726;
  v24 = 0;
  -[MLMediaLibraryService _serviceConnection](self, "_serviceConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __79__MLMediaLibraryService_performDatabaseOperation_withAttributes_options_error___block_invoke;
  v18[3] = &unk_1E5B648C0;
  v18[4] = &v25;
  v18[5] = &v19;
  objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (*((_BYTE *)v26 + 24))
  {
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __79__MLMediaLibraryService_performDatabaseOperation_withAttributes_options_error___block_invoke_2;
    v17[3] = &unk_1E5B64730;
    v17[4] = &v25;
    v17[5] = &v19;
    objc_msgSend(v14, "performDatabaseOperation:withAttributes:options:completionHandler:", a3, v10, v11, v17);
  }
  if (a6)
    *a6 = objc_retainAutorelease((id)v20[5]);
  v15 = *((_BYTE *)v26 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v15;
}

- (void)setOptions:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = a3;
  -[MLMediaLibraryService _serviceConnection](self, "_serviceConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__MLMediaLibraryService_setOptions_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E5B647D0;
  v10 = v6;
  v15[4] = self;
  v16 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __58__MLMediaLibraryService_setOptions_withCompletionHandler___block_invoke_3;
  v13[3] = &unk_1E5B64CC8;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "setOptions:withCompletionHandler:", v7, v13);

}

- (void)performImport:(id)a3 fromSource:(unint64_t)a4 withProgressBlock:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSMutableDictionary *progressBlocksByUUID;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  MLMediaLibraryService *v28;
  id v29;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[MLMediaLibraryService _serviceConnection](self, "_serviceConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __86__MLMediaLibraryService_performImport_fromSource_withProgressBlock_completionHandler___block_invoke;
  v26[3] = &unk_1E5B64780;
  v15 = v10;
  v27 = v15;
  v16 = v12;
  v28 = self;
  v29 = v16;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    progressBlocksByUUID = self->_progressBlocksByUUID;
    v20 = (void *)objc_msgSend(v11, "copy");
    -[NSMutableDictionary setObject:forKey:](progressBlocksByUUID, "setObject:forKey:", v20, v18);

  }
  v23[0] = v14;
  v23[1] = 3221225472;
  v23[2] = __86__MLMediaLibraryService_performImport_fromSource_withProgressBlock_completionHandler___block_invoke_3;
  v23[3] = &unk_1E5B64910;
  v23[4] = self;
  v24 = v18;
  v25 = v16;
  v21 = v16;
  v22 = v18;
  objc_msgSend(v17, "performImport:fromSource:withUUID:completionHandler:", v15, a4, v22, v23);

}

- (void)cancelImportOperation:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  v6 = a4;
  -[MLMediaLibraryService _serviceConnection](self, "_serviceConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__MLMediaLibraryService_cancelImportOperation_completionHandler___block_invoke;
  v14[3] = &unk_1E5B647D0;
  v9 = v6;
  v14[4] = self;
  v15 = v9;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __65__MLMediaLibraryService_cancelImportOperation_completionHandler___block_invoke_3;
  v12[3] = &unk_1E5B64CC8;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "cancelImportOperation:completionHandler:", a3, v12);

}

- (void)lockDatabaseForReason:(int64_t)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  v6 = a4;
  -[MLMediaLibraryService _serviceConnection](self, "_serviceConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__MLMediaLibraryService_lockDatabaseForReason_withCompletion___block_invoke;
  v14[3] = &unk_1E5B647D0;
  v9 = v6;
  v14[4] = self;
  v15 = v9;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __62__MLMediaLibraryService_lockDatabaseForReason_withCompletion___block_invoke_3;
  v12[3] = &unk_1E5B64CC8;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "lockDatabaseForReason:withCompletion:", a3, v12);

}

- (void)unlockDatabaseWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  -[MLMediaLibraryService _serviceConnection](self, "_serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__MLMediaLibraryService_unlockDatabaseWithCompletion___block_invoke;
  v12[3] = &unk_1E5B647D0;
  v7 = v4;
  v12[4] = self;
  v13 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __54__MLMediaLibraryService_unlockDatabaseWithCompletion___block_invoke_3;
  v10[3] = &unk_1E5B64CC8;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "unlockDatabaseWithCompletion:", v10);

}

- (void)updateSpotlightIndexForBundleID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = a3;
  -[MLMediaLibraryService _serviceConnection](self, "_serviceConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__MLMediaLibraryService_updateSpotlightIndexForBundleID_withCompletion___block_invoke;
  v15[3] = &unk_1E5B647D0;
  v10 = v6;
  v15[4] = self;
  v16 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __72__MLMediaLibraryService_updateSpotlightIndexForBundleID_withCompletion___block_invoke_3;
  v13[3] = &unk_1E5B64CC8;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "updateSpotlightIndexForBundleID:withCompletion:", v7, v13);

}

- (void)updateSpotlightIndexMetadataForItemsWithIdentifiers:(id)a3 bundleID:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;
  MLMediaLibraryService *v21;
  id v22;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[MLMediaLibraryService _serviceConnection](self, "_serviceConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __101__MLMediaLibraryService_updateSpotlightIndexMetadataForItemsWithIdentifiers_bundleID_withCompletion___block_invoke;
  v19[3] = &unk_1E5B64780;
  v20 = v8;
  v13 = v9;
  v21 = self;
  v22 = v13;
  v14 = v8;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __101__MLMediaLibraryService_updateSpotlightIndexMetadataForItemsWithIdentifiers_bundleID_withCompletion___block_invoke_3;
  v17[3] = &unk_1E5B64CC8;
  v17[4] = self;
  v18 = v13;
  v16 = v13;
  objc_msgSend(v15, "updateSpotlightIndexMetadataForItemsWithIdentifiers:bundleID:withCompletion:", v14, v10, v17);

}

- (void)updateSiriIndexMetadataForAllLibrariesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  -[MLMediaLibraryService _serviceConnection](self, "_serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__MLMediaLibraryService_updateSiriIndexMetadataForAllLibrariesWithCompletion___block_invoke;
  v12[3] = &unk_1E5B647D0;
  v7 = v4;
  v12[4] = self;
  v13 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __78__MLMediaLibraryService_updateSiriIndexMetadataForAllLibrariesWithCompletion___block_invoke_3;
  v10[3] = &unk_1E5B64CC8;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "updateSiriIndexMetadataForAllLibrariesWithCompletion:", v10);

}

- (void)performMaintenanceTasksForDatabaseAtPath:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  MLMediaLibraryService *v18;
  id v19;

  v6 = a3;
  v7 = a4;
  -[MLMediaLibraryService _serviceConnection](self, "_serviceConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __88__MLMediaLibraryService_performMaintenanceTasksForDatabaseAtPath_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E5B64780;
  v17 = v6;
  v10 = v7;
  v18 = self;
  v19 = v10;
  v11 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __88__MLMediaLibraryService_performMaintenanceTasksForDatabaseAtPath_withCompletionHandler___block_invoke_3;
  v14[3] = &unk_1E5B64CC8;
  v14[4] = self;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v12, "performMaintenanceTasksForDatabaseAtPath:withCompletionHandler:", v11, v14);

}

- (id)mediaLibraryResourcesServiceListenerEndpointWithError:(id *)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  dispatch_semaphore_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  void *v19;
  _QWORD v23[4];
  NSObject *v24;
  _QWORD v25[6];
  _QWORD v26[7];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__16725;
  v41 = __Block_byref_object_dispose__16726;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__16725;
  v35 = __Block_byref_object_dispose__16726;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v3 = MEMORY[0x1E0C809B0];
  while (1)
  {
    -[MLMediaLibraryService _serviceConnection](self, "_serviceConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v3;
    v26[1] = 3221225472;
    v26[2] = __79__MLMediaLibraryService_mediaLibraryResourcesServiceListenerEndpointWithError___block_invoke;
    v26[3] = &unk_1E5B64988;
    v26[5] = &v31;
    v26[6] = 10;
    v26[4] = &v27;
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v26);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v3;
    v25[1] = 3221225472;
    v25[2] = __79__MLMediaLibraryService_mediaLibraryResourcesServiceListenerEndpointWithError___block_invoke_2;
    v25[3] = &unk_1E5B649B0;
    v25[4] = &v37;
    v25[5] = &v31;
    objc_msgSend(v5, "getMediaLibraryResourcesServiceListenerEndpointWithCompletion:", v25);

    v6 = (void *)v38[5];
    if (v6)
      break;
    if (v28[3] >= 10)
    {
      v6 = 0;
      break;
    }
  }
  if (a3)
  {
    *a3 = objc_retainAutorelease((id)v32[5]);
    v6 = (void *)v38[5];
  }
  if (!v6)
  {
    v7 = dispatch_semaphore_create(0);
    v8 = (void *)MEMORY[0x1E0D4D030];
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (a3)
      v13 = *a3;
    else
      v13 = 0;
    objc_msgSend(v9, "stringWithFormat:", CFSTR("currentThread=%@ last connection error=%@"), v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0D4CE30];
    v23[0] = v3;
    v23[1] = 3221225472;
    v23[2] = __79__MLMediaLibraryService_mediaLibraryResourcesServiceListenerEndpointWithError___block_invoke_3;
    v23[3] = &unk_1E5B65D80;
    v16 = v7;
    v24 = v16;
    objc_msgSend(v8, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v15, CFSTR("Bug"), CFSTR("ML3ServiceConnectionBug"), v14, &stru_1E5B66908, 0, v23);

    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
    v6 = (void *)v38[5];
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MLMediaLibraryService.m"), 626, CFSTR("Unable to retrieve XPC listener endpoint for MediaLibraryResourcesService [fatal error after %ld retries] - error=%@"), v28[3], v32[5]);

      v6 = (void *)v38[5];
    }
  }
  v17 = v6;
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  return v17;
}

- (id)clientImportServiceListenerEndpointWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v10;
  _QWORD v13[6];
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__16725;
  v29 = __Block_byref_object_dispose__16726;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__16725;
  v23 = __Block_byref_object_dispose__16726;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v4 = MEMORY[0x1E0C809B0];
  while (1)
  {
    -[MLMediaLibraryService _serviceConnection](self, "_serviceConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v4;
    v14[1] = 3221225472;
    v14[2] = __70__MLMediaLibraryService_clientImportServiceListenerEndpointWithError___block_invoke;
    v14[3] = &unk_1E5B64988;
    v14[5] = &v19;
    v14[6] = 10;
    v14[4] = &v15;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v4;
    v13[1] = 3221225472;
    v13[2] = __70__MLMediaLibraryService_clientImportServiceListenerEndpointWithError___block_invoke_2;
    v13[3] = &unk_1E5B649B0;
    v13[4] = &v25;
    v13[5] = &v19;
    objc_msgSend(v6, "getClientImportServiceListenerEndpointWithCompletion:", v13);

    v7 = (void *)v26[5];
    if (v7)
      break;
    if (v16[3] >= 10)
    {
      v7 = 0;
      break;
    }
  }
  if (a3)
  {
    *a3 = objc_retainAutorelease((id)v20[5]);
    v7 = (void *)v26[5];
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MLMediaLibraryService.m"), 655, CFSTR("Unable to retrieve XPC listener endpoint for MediaLibraryResourcesService [fatal error after %ld retries] - error=%@"), v16[3], v20[5]);

    v7 = (void *)v26[5];
  }
  v8 = v7;
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v8;
}

- (id)securityScopedURLForItemPID:(unint64_t)a3 withDatabasePath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[7];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__16725;
  v18 = __Block_byref_object_dispose__16726;
  v19 = 0;
  -[MLMediaLibraryService _serviceConnection](self, "_serviceConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__MLMediaLibraryService_securityScopedURLForItemPID_withDatabasePath___block_invoke;
  v13[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v13[4] = a3;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __70__MLMediaLibraryService_securityScopedURLForItemPID_withDatabasePath___block_invoke_2;
  v12[3] = &unk_1E5B649F8;
  v12[4] = self;
  v12[5] = &v14;
  v12[6] = a3;
  objc_msgSend(v9, "securityScopedURLWrapperForItemPid:withDatabasePath:completionHandler:", a3, v6, v12);
  v10 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v10;
}

- (void)serviceTerminatedTransactionWithIdentifier:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  MLMediaLibraryService *v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__MLMediaLibraryService_serviceTerminatedTransactionWithIdentifier_error___block_invoke;
  block[3] = &unk_1E5B659D0;
  v11 = v7;
  v12 = v6;
  v13 = self;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)importOperationWithIdentifier:(id)a3 didUpdateWithProgress:(float)a4
{
  void *v6;
  void *v7;
  NSObject *replyQueue;
  _QWORD v9[4];
  id v10;
  float v11;

  -[NSMutableDictionary objectForKey:](self->_progressBlocksByUUID, "objectForKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    replyQueue = self->_replyQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __77__MLMediaLibraryService_importOperationWithIdentifier_didUpdateWithProgress___block_invoke;
    v9[3] = &unk_1E5B64A20;
    v10 = v6;
    v11 = a4;
    dispatch_async(replyQueue, v9);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressBlocksByUUID, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __43__MLMediaLibraryService__serviceConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = os_log_create("com.apple.amp.medialibrary", "Service");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138543362;
    v4 = WeakRetained;
    _os_log_impl(&dword_1AC149000, v2, OS_LOG_TYPE_DEFAULT, "Media library service %{public}@ closed.", (uint8_t *)&v3, 0xCu);
  }

}

void __43__MLMediaLibraryService__serviceConnection__block_invoke_189(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = os_log_create("com.apple.amp.medialibrary", "Service");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = WeakRetained;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "Media library service %{public}@ invalidated.", (uint8_t *)&v7, 0xCu);
  }

  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)v4[3];
  v4[3] = 0;

  v6 = (void *)v4[4];
  v4[4] = 0;

}

uint64_t __77__MLMediaLibraryService_importOperationWithIdentifier_didUpdateWithProgress___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, float))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(float *)(a1 + 40));
}

void __74__MLMediaLibraryService_serviceTerminatedTransactionWithIdentifier_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v5[0] = *MEMORY[0x1E0CB3388];
  v5[1] = CFSTR("MLTerminatedTransactionIdentifierKey");
  v2 = a1[5];
  v6[0] = a1[4];
  v6[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("MLMediaLibraryServiceDidTerminateTransactionNotification"), a1[6], v3);

}

void __70__MLMediaLibraryService_securityScopedURLForItemPID_withDatabasePath___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _ML3LogReplyError(a2, CFSTR("Could not fetch url wrapper for pid %llu"), a3, a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
}

void __70__MLMediaLibraryService_securityScopedURLForItemPID_withDatabasePath___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "url");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1[5] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
  v11 = os_log_create("com.apple.amp.medialibrary", "Service");
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = a1[4];
      v14 = a1[6];
      v20 = 138543875;
      v21 = v13;
      v22 = 2048;
      v23 = v14;
      v24 = 2113;
      v25 = v5;
      v15 = "%{public}@ Succesfully fetched url wrapper for item pid %llu. wrapper=%{private}@";
      v16 = v12;
      v17 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_1AC149000, v16, v17, v15, (uint8_t *)&v20, 0x20u);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v18 = a1[4];
    v19 = a1[6];
    v20 = 138543874;
    v21 = v18;
    v22 = 2048;
    v23 = v19;
    v24 = 2114;
    v25 = v6;
    v15 = "%{public}@ Failed to fetch url wrapper for item pid %llu. error=%{public}@";
    v16 = v12;
    v17 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

}

void __70__MLMediaLibraryService_clientImportServiceListenerEndpointWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  _ML3LogReplyError(v3, CFSTR("Could not retrieve XPC listener endpoint for ClientImportService - Try %ld of %ld"), v4, v5, v6, v7, v8, v9, ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v3;

}

void __70__MLMediaLibraryService_clientImportServiceListenerEndpointWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __79__MLMediaLibraryService_mediaLibraryResourcesServiceListenerEndpointWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  _ML3LogReplyError(v3, CFSTR("Could not retrieve XPC listener endpoint for MediaLibraryResourcesService - Try %ld of %ld"), v4, v5, v6, v7, v8, v9, ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v3;

}

void __79__MLMediaLibraryService_mediaLibraryResourcesServiceListenerEndpointWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

intptr_t __79__MLMediaLibraryService_mediaLibraryResourcesServiceListenerEndpointWithError___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __88__MLMediaLibraryService_performMaintenanceTasksForDatabaseAtPath_withCompletionHandler___block_invoke(uint64_t *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;

  v3 = a2;
  _ML3LogReplyError(v3, CFSTR("Could not perform maintenance task for database at path %@"), v4, v5, v6, v7, v8, v9, a1[4]);
  v10 = (void *)a1[6];
  if (v10)
  {
    v11 = *(NSObject **)(a1[5] + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__MLMediaLibraryService_performMaintenanceTasksForDatabaseAtPath_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5B64758;
    v14 = v10;
    v13 = v3;
    dispatch_async(v11, block);

  }
}

void __88__MLMediaLibraryService_performMaintenanceTasksForDatabaseAtPath_withCompletionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__MLMediaLibraryService_performMaintenanceTasksForDatabaseAtPath_withCompletionHandler___block_invoke_4;
    block[3] = &unk_1E5B647A8;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __88__MLMediaLibraryService_performMaintenanceTasksForDatabaseAtPath_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __88__MLMediaLibraryService_performMaintenanceTasksForDatabaseAtPath_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __78__MLMediaLibraryService_updateSiriIndexMetadataForAllLibrariesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12[4];
  id v13;
  id v14;

  v3 = a2;
  _ML3LogReplyError(v3, CFSTR("Could not update siri index for all libraries"), v4, v5, v6, v7, v8, v9, v12[0]);
  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = (uint64_t)__78__MLMediaLibraryService_updateSiriIndexMetadataForAllLibrariesWithCompletion___block_invoke_2;
    v12[3] = (uint64_t)&unk_1E5B64758;
    v14 = v10;
    v13 = v3;
    dispatch_async(v11, v12);

  }
}

void __78__MLMediaLibraryService_updateSiriIndexMetadataForAllLibrariesWithCompletion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__MLMediaLibraryService_updateSiriIndexMetadataForAllLibrariesWithCompletion___block_invoke_4;
    block[3] = &unk_1E5B647A8;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __78__MLMediaLibraryService_updateSiriIndexMetadataForAllLibrariesWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __78__MLMediaLibraryService_updateSiriIndexMetadataForAllLibrariesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __101__MLMediaLibraryService_updateSpotlightIndexMetadataForItemsWithIdentifiers_bundleID_withCompletion___block_invoke(uint64_t *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;

  v3 = a2;
  _ML3LogReplyError(v3, CFSTR("Could not update spotlight index for identifiers: %@"), v4, v5, v6, v7, v8, v9, a1[4]);
  v10 = (void *)a1[6];
  if (v10)
  {
    v11 = *(NSObject **)(a1[5] + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __101__MLMediaLibraryService_updateSpotlightIndexMetadataForItemsWithIdentifiers_bundleID_withCompletion___block_invoke_2;
    block[3] = &unk_1E5B64758;
    v14 = v10;
    v13 = v3;
    dispatch_async(v11, block);

  }
}

void __101__MLMediaLibraryService_updateSpotlightIndexMetadataForItemsWithIdentifiers_bundleID_withCompletion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __101__MLMediaLibraryService_updateSpotlightIndexMetadataForItemsWithIdentifiers_bundleID_withCompletion___block_invoke_4;
    block[3] = &unk_1E5B647A8;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __101__MLMediaLibraryService_updateSpotlightIndexMetadataForItemsWithIdentifiers_bundleID_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __101__MLMediaLibraryService_updateSpotlightIndexMetadataForItemsWithIdentifiers_bundleID_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __72__MLMediaLibraryService_updateSpotlightIndexForBundleID_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12[4];
  id v13;
  id v14;

  v3 = a2;
  _ML3LogReplyError(v3, CFSTR("Could not update spotlight index."), v4, v5, v6, v7, v8, v9, v12[0]);
  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = (uint64_t)__72__MLMediaLibraryService_updateSpotlightIndexForBundleID_withCompletion___block_invoke_2;
    v12[3] = (uint64_t)&unk_1E5B64758;
    v14 = v10;
    v13 = v3;
    dispatch_async(v11, v12);

  }
}

void __72__MLMediaLibraryService_updateSpotlightIndexForBundleID_withCompletion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__MLMediaLibraryService_updateSpotlightIndexForBundleID_withCompletion___block_invoke_4;
    block[3] = &unk_1E5B647A8;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __72__MLMediaLibraryService_updateSpotlightIndexForBundleID_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __72__MLMediaLibraryService_updateSpotlightIndexForBundleID_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __60__MLMediaLibraryService_getLanguageResourcesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __54__MLMediaLibraryService_unlockDatabaseWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12[4];
  id v13;
  id v14;

  v3 = a2;
  _ML3LogReplyError(v3, CFSTR("Could not unlock database."), v4, v5, v6, v7, v8, v9, v12[0]);
  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = (uint64_t)__54__MLMediaLibraryService_unlockDatabaseWithCompletion___block_invoke_2;
    v12[3] = (uint64_t)&unk_1E5B64758;
    v14 = v10;
    v13 = v3;
    dispatch_async(v11, v12);

  }
}

void __54__MLMediaLibraryService_unlockDatabaseWithCompletion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__MLMediaLibraryService_unlockDatabaseWithCompletion___block_invoke_4;
    block[3] = &unk_1E5B647A8;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __54__MLMediaLibraryService_unlockDatabaseWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __54__MLMediaLibraryService_unlockDatabaseWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __62__MLMediaLibraryService_lockDatabaseForReason_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12[4];
  id v13;
  id v14;

  v3 = a2;
  _ML3LogReplyError(v3, CFSTR("Could not lock database."), v4, v5, v6, v7, v8, v9, v12[0]);
  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = (uint64_t)__62__MLMediaLibraryService_lockDatabaseForReason_withCompletion___block_invoke_2;
    v12[3] = (uint64_t)&unk_1E5B64758;
    v14 = v10;
    v13 = v3;
    dispatch_async(v11, v12);

  }
}

void __62__MLMediaLibraryService_lockDatabaseForReason_withCompletion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__MLMediaLibraryService_lockDatabaseForReason_withCompletion___block_invoke_4;
    block[3] = &unk_1E5B647A8;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __62__MLMediaLibraryService_lockDatabaseForReason_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __62__MLMediaLibraryService_lockDatabaseForReason_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __65__MLMediaLibraryService_cancelImportOperation_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12[4];
  id v13;
  id v14;

  v3 = a2;
  _ML3LogReplyError(v3, CFSTR("Could not cancel import operation."), v4, v5, v6, v7, v8, v9, v12[0]);
  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = (uint64_t)__65__MLMediaLibraryService_cancelImportOperation_completionHandler___block_invoke_2;
    v12[3] = (uint64_t)&unk_1E5B64758;
    v14 = v10;
    v13 = v3;
    dispatch_async(v11, v12);

  }
}

void __65__MLMediaLibraryService_cancelImportOperation_completionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__MLMediaLibraryService_cancelImportOperation_completionHandler___block_invoke_4;
    block[3] = &unk_1E5B647A8;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __65__MLMediaLibraryService_cancelImportOperation_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __65__MLMediaLibraryService_cancelImportOperation_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __86__MLMediaLibraryService_performImport_fromSource_withProgressBlock_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "libraryPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _ML3LogReplyError(v3, CFSTR("Could not perform import for database at path %@."), v5, v6, v7, v8, v9, v10, (uint64_t)v4);

  v11 = *(void **)(a1 + 48);
  if (v11)
  {
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__MLMediaLibraryService_performImport_fromSource_withProgressBlock_completionHandler___block_invoke_2;
    block[3] = &unk_1E5B64758;
    v15 = v11;
    v14 = v3;
    dispatch_async(v12, block);

  }
}

void __86__MLMediaLibraryService_performImport_fromSource_withProgressBlock_completionHandler___block_invoke_3(_QWORD *a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  char v15;

  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1[4] + 40), "removeObjectForKey:", a1[5]);
  v9 = (void *)a1[6];
  if (v9)
  {
    v10 = *(NSObject **)(a1[4] + 16);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __86__MLMediaLibraryService_performImport_fromSource_withProgressBlock_completionHandler___block_invoke_4;
    v11[3] = &unk_1E5B648E8;
    v14 = v9;
    v15 = a2;
    v12 = v7;
    v13 = v8;
    dispatch_async(v10, v11);

  }
}

uint64_t __86__MLMediaLibraryService_performImport_fromSource_withProgressBlock_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __86__MLMediaLibraryService_performImport_fromSource_withProgressBlock_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32), 0);
}

void __58__MLMediaLibraryService_setOptions_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12[4];
  id v13;
  id v14;

  v3 = a2;
  _ML3LogReplyError(v3, CFSTR("Could not set options on media library service."), v4, v5, v6, v7, v8, v9, v12[0]);
  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = (uint64_t)__58__MLMediaLibraryService_setOptions_withCompletionHandler___block_invoke_2;
    v12[3] = (uint64_t)&unk_1E5B64758;
    v14 = v10;
    v13 = v3;
    dispatch_async(v11, v12);

  }
}

void __58__MLMediaLibraryService_setOptions_withCompletionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__MLMediaLibraryService_setOptions_withCompletionHandler___block_invoke_4;
    block[3] = &unk_1E5B647A8;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __58__MLMediaLibraryService_setOptions_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __58__MLMediaLibraryService_setOptions_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __79__MLMediaLibraryService_performDatabaseOperation_withAttributes_options_error___block_invoke(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

void __79__MLMediaLibraryService_performDatabaseOperation_withAttributes_options_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __91__MLMediaLibraryService_performDatabaseOperation_withAttributes_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("MLDatabaseOperationOptionDatabasePathKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _ML3LogReplyError(v3, CFSTR("Could not execute database operation on database at path %@."), v5, v6, v7, v8, v9, v10, (uint64_t)v4);
  v11 = *(void **)(a1 + 48);
  if (v11)
  {
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__MLMediaLibraryService_performDatabaseOperation_withAttributes_options_completionHandler___block_invoke_2;
    block[3] = &unk_1E5B64758;
    v15 = v11;
    v14 = v3;
    dispatch_async(v12, block);

  }
}

void __91__MLMediaLibraryService_performDatabaseOperation_withAttributes_options_completionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__MLMediaLibraryService_performDatabaseOperation_withAttributes_options_completionHandler___block_invoke_4;
    block[3] = &unk_1E5B647A8;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __91__MLMediaLibraryService_performDatabaseOperation_withAttributes_options_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __91__MLMediaLibraryService_performDatabaseOperation_withAttributes_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __59__MLMediaLibraryService_endTransaction_shouldCommit_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _ML3LogReplyError(v3, CFSTR("Could not end transaction %@."), v5, v6, v7, v8, v9, v10, (uint64_t)v4);

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v3;
  v13 = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
}

void __75__MLMediaLibraryService_endTransaction_shouldCommit_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _ML3LogReplyError(v3, CFSTR("Could not end transaction %@."), v5, v6, v7, v8, v9, v10, (uint64_t)v4);

  v11 = *(void **)(a1 + 48);
  if (v11)
  {
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__MLMediaLibraryService_endTransaction_shouldCommit_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5B64758;
    v15 = v11;
    v14 = v3;
    dispatch_async(v12, block);

  }
}

void __75__MLMediaLibraryService_endTransaction_shouldCommit_withCompletionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__MLMediaLibraryService_endTransaction_shouldCommit_withCompletionHandler___block_invoke_4;
    block[3] = &unk_1E5B647A8;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __75__MLMediaLibraryService_endTransaction_shouldCommit_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __75__MLMediaLibraryService_endTransaction_shouldCommit_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __97__MLMediaLibraryService_executeQuery_withParameters_options_onTransaction_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _ML3LogReplyError(v3, CFSTR("Could not execute query on transaction %@."), v5, v6, v7, v8, v9, v10, (uint64_t)v4);

  v11 = *(void **)(a1 + 48);
  if (v11)
  {
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __97__MLMediaLibraryService_executeQuery_withParameters_options_onTransaction_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5B64758;
    v15 = v11;
    v14 = v3;
    dispatch_async(v12, block);

  }
}

void __97__MLMediaLibraryService_executeQuery_withParameters_options_onTransaction_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __97__MLMediaLibraryService_executeQuery_withParameters_options_onTransaction_withCompletionHandler___block_invoke_4;
    block[3] = &unk_1E5B656C0;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __97__MLMediaLibraryService_executeQuery_withParameters_options_onTransaction_withCompletionHandler___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __97__MLMediaLibraryService_executeQuery_withParameters_options_onTransaction_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __74__MLMediaLibraryService_executeUpdate_withParameters_onTransaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _ML3LogReplyError(v3, CFSTR("Could not execute update on transaction %@."), v5, v6, v7, v8, v9, v10, (uint64_t)v4);

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v3;
  v13 = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
}

void __90__MLMediaLibraryService_executeUpdate_withParameters_onTransaction_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _ML3LogReplyError(v3, CFSTR("Could not execute update on transaction %@."), v5, v6, v7, v8, v9, v10, (uint64_t)v4);

  v11 = *(void **)(a1 + 48);
  if (v11)
  {
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__MLMediaLibraryService_executeUpdate_withParameters_onTransaction_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5B64758;
    v15 = v11;
    v14 = v3;
    dispatch_async(v12, block);

  }
}

void __90__MLMediaLibraryService_executeUpdate_withParameters_onTransaction_withCompletionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__MLMediaLibraryService_executeUpdate_withParameters_onTransaction_withCompletionHandler___block_invoke_4;
    block[3] = &unk_1E5B647A8;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __90__MLMediaLibraryService_executeUpdate_withParameters_onTransaction_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __90__MLMediaLibraryService_executeUpdate_withParameters_onTransaction_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __70__MLMediaLibraryService_beginTransactionForDatabaseWithContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _ML3LogReplyError(v3, CFSTR("Could not begin transaction for database at path %@."), v5, v6, v7, v8, v9, v10, (uint64_t)v4);

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v3;

}

void __82__MLMediaLibraryService_beginTransactionForDatabaseWithContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _ML3LogReplyError(v3, CFSTR("Could not begin transaction for database at path %@."), v5, v6, v7, v8, v9, v10, (uint64_t)v4);

  v11 = *(void **)(a1 + 48);
  if (v11)
  {
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__MLMediaLibraryService_beginTransactionForDatabaseWithContext_completionHandler___block_invoke_2;
    block[3] = &unk_1E5B64758;
    v15 = v11;
    v14 = v3;
    dispatch_async(v12, block);

  }
}

void __82__MLMediaLibraryService_beginTransactionForDatabaseWithContext_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__MLMediaLibraryService_beginTransactionForDatabaseWithContext_completionHandler___block_invoke_4;
    block[3] = &unk_1E5B656C0;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

void __82__MLMediaLibraryService_beginTransactionForDatabaseWithContext_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "msv_errorByRemovingUnsafeUserInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v1, v3);

}

uint64_t __82__MLMediaLibraryService_beginTransactionForDatabaseWithContext_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __70__MLMediaLibraryService_recreateDatabaseAtPath_withCompletionHandler___block_invoke(uint64_t *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;

  v3 = a2;
  _ML3LogReplyError(v3, CFSTR("Could not recreate database at path %@."), v4, v5, v6, v7, v8, v9, a1[4]);
  v10 = (void *)a1[6];
  if (v10)
  {
    v11 = *(NSObject **)(a1[5] + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__MLMediaLibraryService_recreateDatabaseAtPath_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5B64758;
    v14 = v10;
    v13 = v3;
    dispatch_async(v11, block);

  }
}

void __70__MLMediaLibraryService_recreateDatabaseAtPath_withCompletionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__MLMediaLibraryService_recreateDatabaseAtPath_withCompletionHandler___block_invoke_4;
    block[3] = &unk_1E5B647A8;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __70__MLMediaLibraryService_recreateDatabaseAtPath_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __70__MLMediaLibraryService_recreateDatabaseAtPath_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __64__MLMediaLibraryService_performDiagnosticWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12[4];
  id v13;
  id v14;

  v3 = a2;
  _ML3LogReplyError(v3, CFSTR("Could not perform diagnostic"), v4, v5, v6, v7, v8, v9, v12[0]);
  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = (uint64_t)__64__MLMediaLibraryService_performDiagnosticWithCompletionHandler___block_invoke_2;
    v12[3] = (uint64_t)&unk_1E5B64758;
    v14 = v10;
    v13 = v3;
    dispatch_async(v11, v12);

  }
}

void __64__MLMediaLibraryService_performDiagnosticWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__MLMediaLibraryService_performDiagnosticWithCompletionHandler___block_invoke_4;
    block[3] = &unk_1E5B656C0;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __64__MLMediaLibraryService_performDiagnosticWithCompletionHandler___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __64__MLMediaLibraryService_performDiagnosticWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __91__MLMediaLibraryService_checkIntegrityOfDatabaseAtPath_repairFaults_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;

  v3 = a2;
  _ML3LogReplyError(v3, CFSTR("Failed to obtain service proxy to perform integrity check. err=%@"), v4, v5, v6, v7, v8, v9, (uint64_t)v3);
  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__MLMediaLibraryService_checkIntegrityOfDatabaseAtPath_repairFaults_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5B64758;
    v14 = v10;
    v13 = v3;
    dispatch_async(v11, block);

  }
}

void __91__MLMediaLibraryService_checkIntegrityOfDatabaseAtPath_repairFaults_withCompletionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__MLMediaLibraryService_checkIntegrityOfDatabaseAtPath_repairFaults_withCompletionHandler___block_invoke_4;
    block[3] = &unk_1E5B647A8;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __91__MLMediaLibraryService_checkIntegrityOfDatabaseAtPath_repairFaults_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __91__MLMediaLibraryService_checkIntegrityOfDatabaseAtPath_repairFaults_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __81__MLMediaLibraryService_attemptDatabaseFileRecoveryAtPath_withCompletionHandler___block_invoke(uint64_t *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;

  v3 = a2;
  _ML3LogReplyError(v3, CFSTR("Could not attempt recovery at path: %@"), v4, v5, v6, v7, v8, v9, a1[4]);
  v10 = (void *)a1[6];
  if (v10)
  {
    v11 = *(NSObject **)(a1[5] + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__MLMediaLibraryService_attemptDatabaseFileRecoveryAtPath_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5B64758;
    v14 = v10;
    v13 = v3;
    dispatch_async(v11, block);

  }
}

void __81__MLMediaLibraryService_attemptDatabaseFileRecoveryAtPath_withCompletionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__MLMediaLibraryService_attemptDatabaseFileRecoveryAtPath_withCompletionHandler___block_invoke_4;
    block[3] = &unk_1E5B647A8;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __81__MLMediaLibraryService_attemptDatabaseFileRecoveryAtPath_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __81__MLMediaLibraryService_attemptDatabaseFileRecoveryAtPath_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __54__MLMediaLibraryService_validateDatabaseAtPath_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  _ML3LogReplyError(v3, CFSTR("Could not validate database at path %@."), v4, v5, v6, v7, v8, v9, *(_QWORD *)(a1 + 32));
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v3;

}

+ (void)_setDaemonProcessInfo:(id)a3
{
  objc_storeStrong((id *)&__daemonProcessInfo, a3);
}

@end

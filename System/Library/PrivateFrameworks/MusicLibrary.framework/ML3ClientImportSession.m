@implementation ML3ClientImportSession

- (ML3ClientImportSession)initWithConfiguration:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  ML3ClientImportSession *v8;
  ML3ClientImportSession *v9;
  uint64_t v10;
  ML3ClientImportSessionConfiguration *sessionConfiguration;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSProgress *progress;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ML3ClientImportSession;
  v8 = -[ML3ClientImportSession init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_delegate, a4);
    v10 = objc_msgSend(v6, "copy");
    sessionConfiguration = v9->_sessionConfiguration;
    v9->_sessionConfiguration = (ML3ClientImportSessionConfiguration *)v10;

    v12 = objc_msgSend(v6, "operationCount");
    if (v12)
      v13 = v12;
    else
      v13 = 100;
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    progress = v9->_progress;
    v9->_progress = (NSProgress *)v14;

  }
  return v9;
}

- (BOOL)start
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  ML3ClientImportSessionConfiguration *sessionConfiguration;
  BOOL v9;
  _QWORD v11[6];
  _QWORD v12[5];
  __int128 buf;
  uint64_t v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_ERROR, "%{public}@ Starting import session", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v14 = 0x2020000000;
  v15 = 0;
  -[ML3ClientImportSession _xpcClientConnection](self, "_xpcClientConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __31__ML3ClientImportSession_start__block_invoke;
    v12[3] = &unk_1E5B63CD0;
    v12[4] = self;
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    sessionConfiguration = self->_sessionConfiguration;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __31__ML3ClientImportSession_start__block_invoke_1;
    v11[3] = &unk_1E5B64708;
    v11[4] = self;
    v11[5] = &buf;
    objc_msgSend(v7, "beginSessionWithConfiguration:completion:", sessionConfiguration, v11);

  }
  v9 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return v9;
}

- (BOOL)finish
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  _QWORD v10[6];
  _QWORD v11[5];
  __int128 buf;
  uint64_t v13;
  char v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_ERROR, "%{public}@ Finishing import session", (uint8_t *)&buf, 0xCu);
  }

  if (!self->_hasActiveSession)
    return 1;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v13 = 0x2020000000;
  v14 = 0;
  -[ML3ClientImportSession _xpcClientConnection](self, "_xpcClientConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __32__ML3ClientImportSession_finish__block_invoke;
    v11[3] = &unk_1E5B63CD0;
    v11[4] = self;
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __32__ML3ClientImportSession_finish__block_invoke_2;
    v10[3] = &unk_1E5B64708;
    v10[4] = self;
    v10[5] = &buf;
    objc_msgSend(v7, "endSessionWithCompletion:", v10);

  }
  v8 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return v8;
}

- (BOOL)cancel
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  _QWORD v10[6];
  _QWORD v11[5];
  __int128 buf;
  uint64_t v13;
  char v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_ERROR, "%{public}@ Canceling import session", (uint8_t *)&buf, 0xCu);
  }

  if (!self->_hasActiveSession)
    return 1;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v13 = 0x2020000000;
  v14 = 0;
  -[ML3ClientImportSession _xpcClientConnection](self, "_xpcClientConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __32__ML3ClientImportSession_cancel__block_invoke;
    v11[3] = &unk_1E5B63CD0;
    v11[4] = self;
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __32__ML3ClientImportSession_cancel__block_invoke_3;
    v10[3] = &unk_1E5B64708;
    v10[4] = self;
    v10[5] = &buf;
    objc_msgSend(v7, "cancelSessionWithCompletion:", v10);

  }
  v8 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return v8;
}

- (BOOL)addItems:(id)a3
{
  void *v3;
  char v4;

  -[ML3ClientImportSession addItemsReturningResult:](self, "addItemsReturningResult:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "success");

  return v4;
}

- (id)addItemsReturningResult:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  ML3ClientImportResult *v11;
  ML3ClientImportResult *v12;
  void *v14;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a3;
  if (!self->_hasActiveSession)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3ClientImportSession.m"), 104, CFSTR("addItems cannot be called without an active session"));

  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__10533;
  v21 = __Block_byref_object_dispose__10534;
  v22 = 0;
  -[ML3ClientImportSession _xpcClientConnection](self, "_xpcClientConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __50__ML3ClientImportSession_addItemsReturningResult___block_invoke;
    v16[3] = &unk_1E5B63CD0;
    v16[4] = self;
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __50__ML3ClientImportSession_addItemsReturningResult___block_invoke_8;
    v15[3] = &unk_1E5B62E18;
    v15[4] = self;
    v15[5] = &v17;
    objc_msgSend(v9, "addItems:completion:", v5, v15);

  }
  v10 = (void *)v18[5];
  if (v10)
    v11 = v10;
  else
    v11 = objc_alloc_init(ML3ClientImportResult);
  v12 = v11;

  _Block_object_dispose(&v17, 8);
  return v12;
}

- (BOOL)updateItems:(id)a3
{
  void *v3;
  char v4;

  -[ML3ClientImportSession updateItemsReturningResult:](self, "updateItemsReturningResult:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "success");

  return v4;
}

- (id)updateItemsReturningResult:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  ML3ClientImportResult *v11;
  ML3ClientImportResult *v12;
  void *v14;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a3;
  if (!self->_hasActiveSession)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3ClientImportSession.m"), 126, CFSTR("updateItems cannot be called without an active session"));

  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__10533;
  v21 = __Block_byref_object_dispose__10534;
  v22 = 0;
  -[ML3ClientImportSession _xpcClientConnection](self, "_xpcClientConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __53__ML3ClientImportSession_updateItemsReturningResult___block_invoke;
    v16[3] = &unk_1E5B63CD0;
    v16[4] = self;
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __53__ML3ClientImportSession_updateItemsReturningResult___block_invoke_13;
    v15[3] = &unk_1E5B62E18;
    v15[4] = self;
    v15[5] = &v17;
    objc_msgSend(v9, "updateItems:completion:", v5, v15);

  }
  v10 = (void *)v18[5];
  if (v10)
    v11 = v10;
  else
    v11 = objc_alloc_init(ML3ClientImportResult);
  v12 = v11;

  _Block_object_dispose(&v17, 8);
  return v12;
}

- (BOOL)removeItems:(id)a3
{
  void *v3;
  char v4;

  -[ML3ClientImportSession removeItemsReturningResult:](self, "removeItemsReturningResult:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "success");

  return v4;
}

- (id)removeItemsReturningResult:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  ML3ClientImportResult *v11;
  ML3ClientImportResult *v12;
  void *v14;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a3;
  if (!self->_hasActiveSession)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3ClientImportSession.m"), 147, CFSTR("removeItems cannot be called without an active session"));

  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__10533;
  v21 = __Block_byref_object_dispose__10534;
  v22 = 0;
  -[ML3ClientImportSession _xpcClientConnection](self, "_xpcClientConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __53__ML3ClientImportSession_removeItemsReturningResult___block_invoke;
    v16[3] = &unk_1E5B63CD0;
    v16[4] = self;
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __53__ML3ClientImportSession_removeItemsReturningResult___block_invoke_16;
    v15[3] = &unk_1E5B62E18;
    v15[4] = self;
    v15[5] = &v17;
    objc_msgSend(v9, "removeItems:completion:", v5, v15);

  }
  v10 = (void *)v18[5];
  if (v10)
    v11 = v10;
  else
    v11 = objc_alloc_init(ML3ClientImportResult);
  v12 = v11;

  _Block_object_dispose(&v17, 8);
  return v12;
}

- (void)sessionFailedToAddItem:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  char v8;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = 1;
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
    -[ML3ClientImportSessionDelegate session:failedToAddItem:shouldStop:](self->_delegate, "session:failedToAddItem:shouldStop:", self, v6, &v8);
  v7[2](v7);

}

- (void)sessionFailedToUpdateItem:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  char v8;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = 1;
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
    -[ML3ClientImportSessionDelegate session:failedToAddItem:shouldStop:](self->_delegate, "session:failedToAddItem:shouldStop:", self, v6, &v8);
  v7[2](v7);

}

- (void)sessionFailedToRemoveItem:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  char v8;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = 1;
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
    -[ML3ClientImportSessionDelegate session:failedToAddItem:shouldStop:](self->_delegate, "session:failedToAddItem:shouldStop:", self, v6, &v8);
  v7[2](v7);

}

- (void)sessionDidUpdateProgress:(float)a3
{
  uint64_t v4;
  id v5;

  v4 = (uint64_t)(float)((float)-[NSProgress totalUnitCount](self->_progress, "totalUnitCount") * a3);
  -[ML3ClientImportSession progress](self, "progress");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCompletedUnitCount:", v4);

}

- (id)_xpcClientConnection
{
  NSXPCConnection *xpcClientConnection;
  void *v4;
  void *v5;
  id v6;
  NSXPCConnection *v7;
  NSXPCConnection *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  ML3ClientImportSession *v17;
  NSXPCConnection *v18;
  uint64_t v19;
  ML3ClientImportSession *v20;
  NSXPCConnection *v21;
  ML3ClientImportSession *v22;
  _QWORD v24[4];
  ML3ClientImportSession *v25;
  ML3ClientImportSession *v26;
  _QWORD v27[4];
  ML3ClientImportSession *v28;
  ML3ClientImportSession *v29;
  id v30;
  uint8_t buf[4];
  ML3ClientImportSession *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  xpcClientConnection = self->_xpcClientConnection;
  if (!xpcClientConnection)
  {
    +[MLMediaLibraryService sharedMediaLibraryService](MLMediaLibraryService, "sharedMediaLibraryService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(v4, "clientImportServiceListenerEndpointWithError:", &v30);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v30;

    if (v5)
    {
      v7 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v5);
      v8 = self->_xpcClientConnection;
      self->_xpcClientConnection = v7;

      -[NSXPCConnection setExportedObject:](self->_xpcClientConnection, "setExportedObject:", self);
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEC91BE0);
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_sessionFailedToAddItem_completion_, 0, 0);

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v9, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_sessionFailedToUpdateItem_completion_, 0, 0);

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v9, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_sessionFailedToRemoveItem_completion_, 0, 0);

      -[NSXPCConnection setExportedInterface:](self->_xpcClientConnection, "setExportedInterface:", v9);
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EECA04E0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_addItems_completion_, 0, 1);

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_updateItems_completion_, 0, 1);

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_removeItems_completion_, 0, 1);

      -[NSXPCConnection setRemoteObjectInterface:](self->_xpcClientConnection, "setRemoteObjectInterface:", v13);
      v17 = self;
      v18 = self->_xpcClientConnection;
      v19 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __46__ML3ClientImportSession__xpcClientConnection__block_invoke;
      v27[3] = &unk_1E5B65EB8;
      v20 = v17;
      v28 = v20;
      v29 = v20;
      -[NSXPCConnection setInterruptionHandler:](v18, "setInterruptionHandler:", v27);
      v21 = self->_xpcClientConnection;
      v24[0] = v19;
      v24[1] = 3221225472;
      v24[2] = __46__ML3ClientImportSession__xpcClientConnection__block_invoke_94;
      v24[3] = &unk_1E5B65EB8;
      v25 = v20;
      v26 = v20;
      v22 = v20;
      -[NSXPCConnection setInvalidationHandler:](v21, "setInvalidationHandler:", v24);
      -[NSXPCConnection resume](self->_xpcClientConnection, "resume");

    }
    else
    {
      v9 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v32 = self;
        v33 = 2114;
        v34 = v6;
        _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to obtain service listener endpoint. err=%{public}@", buf, 0x16u);
      }
    }

    xpcClientConnection = self->_xpcClientConnection;
  }
  return xpcClientConnection;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_xpcClientConnection, 0);
}

void __46__ML3ClientImportSession__xpcClientConnection__block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v2;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_ERROR, "%{public}@ Connection to client import service interrupted", (uint8_t *)&v6, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = 0;

}

void __46__ML3ClientImportSession__xpcClientConnection__block_invoke_94(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v2;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_ERROR, "%{public}@ Connection to client import service invalidated", (uint8_t *)&v6, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = 0;

}

void __53__ML3ClientImportSession_removeItemsReturningResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to connect to the remote service. err=%{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __53__ML3ClientImportSession_removeItemsReturningResult___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  ML3ClientImportResult *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  ML3ClientImportResult *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v10 = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Finished removing items. err=%{public}@", (uint8_t *)&v10, 0x16u);
  }

  v9 = v5;
  if (!v5)
    v9 = objc_alloc_init(ML3ClientImportResult);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v9);
  if (!v5)

}

void __53__ML3ClientImportSession_updateItemsReturningResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to connect to the remote service. err=%{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __53__ML3ClientImportSession_updateItemsReturningResult___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  ML3ClientImportResult *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  ML3ClientImportResult *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v10 = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Finished updating items. err=%{public}@", (uint8_t *)&v10, 0x16u);
  }

  v9 = v5;
  if (!v5)
    v9 = objc_alloc_init(ML3ClientImportResult);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v9);
  if (!v5)

}

void __50__ML3ClientImportSession_addItemsReturningResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to connect to the remote service. err=%{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __50__ML3ClientImportSession_addItemsReturningResult___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  ML3ClientImportResult *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  ML3ClientImportResult *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v10 = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Finished adding items. err=%{public}@", (uint8_t *)&v10, 0x16u);
  }

  v9 = v5;
  if (!v5)
    v9 = objc_alloc_init(ML3ClientImportResult);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v9);
  if (!v5)

}

void __32__ML3ClientImportSession_cancel__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to connect to the remote service. err=%{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __32__ML3ClientImportSession_cancel__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Canceled import session. err=%{public}@", (uint8_t *)&v6, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3 == 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;

}

void __32__ML3ClientImportSession_finish__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to connect to the remote service. err=%{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __32__ML3ClientImportSession_finish__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Ended import session. err=%{public}@", (uint8_t *)&v6, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3 == 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;

}

void __31__ML3ClientImportSession_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to connect to the remote service. err=%{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __31__ML3ClientImportSession_start__block_invoke_1(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Finished starting import session. err=%{public}@", (uint8_t *)&v6, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3 == 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

@end

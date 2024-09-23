@implementation MLMediaLibraryResourcesServiceClient

- (id)libraryContainerPathWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v15[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t v22[4];
  MLMediaLibraryResourcesServiceClient *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  _BYTE buf[24];
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = self;
    _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEBUG, "MLMediaLibraryResourcesServiceClient %p - libraryContainerPathWithError:", buf, 0xCu);
  }

  v6 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[MLMediaLibraryResourcesServiceClient accountChangeOperationQueue](self, "accountChangeOperationQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "MLMediaLibraryResourcesServiceClient %p - BLOCKING - Retrieving libraryContainerPath on serial queue: %@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v29 = __Block_byref_object_copy__7163;
  v30 = __Block_byref_object_dispose__7164;
  v31 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7163;
  v20 = __Block_byref_object_dispose__7164;
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__MLMediaLibraryResourcesServiceClient_libraryContainerPathWithError___block_invoke;
  v15[3] = &unk_1E5B65A78;
  v15[4] = self;
  v15[5] = buf;
  v15[6] = &v16;
  objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLMediaLibraryResourcesServiceClient accountChangeOperationQueue](self, "accountChangeOperationQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addOperation:", v8);

  objc_msgSend(v8, "waitUntilFinished");
  v10 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[MLMediaLibraryResourcesServiceClient accountChangeOperationQueue](self, "accountChangeOperationQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    *(_DWORD *)v22 = 134218498;
    v23 = self;
    v24 = 2112;
    v25 = v11;
    v26 = 2112;
    v27 = v12;
    _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEFAULT, "MLMediaLibraryResourcesServiceClient %p - UNBLOCKED - Retrieved mediaFolderPath on serial queue: %@ - %@", v22, 0x20u);

  }
  if (a3)
    *a3 = objc_retainAutorelease((id)v17[5]);
  v13 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(buf, 8);

  return v13;
}

- (id)musicContainerPathWithError:(id *)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v13[7];
  _QWORD v14[5];
  id v15;
  uint8_t v16[4];
  MLMediaLibraryResourcesServiceClient *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  _BYTE buf[24];
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[MLMediaLibraryResourcesServiceClient accountChangeOperationQueue](self, "accountChangeOperationQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v5;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "MLMediaLibraryResourcesServiceClient %p - BLOCKING - Retrieving musicContainerPath on serial queue: %@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v23 = __Block_byref_object_copy__7163;
  v24 = __Block_byref_object_dispose__7164;
  v25 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__7163;
  v14[4] = __Block_byref_object_dispose__7164;
  v15 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__MLMediaLibraryResourcesServiceClient_musicContainerPathWithError___block_invoke;
  v13[3] = &unk_1E5B65A78;
  v13[4] = self;
  v13[5] = buf;
  v13[6] = v14;
  objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLMediaLibraryResourcesServiceClient accountChangeOperationQueue](self, "accountChangeOperationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addOperation:", v6);

  objc_msgSend(v6, "waitUntilFinished");
  v8 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[MLMediaLibraryResourcesServiceClient accountChangeOperationQueue](self, "accountChangeOperationQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    *(_DWORD *)v16 = 134218498;
    v17 = self;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "MLMediaLibraryResourcesServiceClient %p - UNBLOCKED - Retrieved musicContainerPath on serial queue: %@ - %@", v16, 0x20u);

  }
  v11 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(buf, 8);

  return v11;
}

- (id)_initWithAccountChangeObserver:(id)a3
{
  id v5;
  NSObject *v6;
  MLMediaLibraryResourcesServiceClient *v7;
  MLMediaLibraryResourcesServiceClient *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *serialQueue;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *calloutQueue;
  NSOperationQueue *v15;
  NSOperationQueue *accountChangeOperationQueue;
  objc_super v18;
  uint8_t buf[4];
  MLMediaLibraryResourcesServiceClient *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v20 = self;
    _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEBUG, "MLMediaLibraryResourcesServiceClient %p - _initWithXPCListenerEndpoint:", buf, 0xCu);
  }

  v18.receiver = self;
  v18.super_class = (Class)MLMediaLibraryResourcesServiceClient;
  v7 = -[MLMediaLibraryResourcesServiceClient init](&v18, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_accountChangeObserver, a3);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.MusicLibrary.MLMediaLibraryResourceServiceClient.serial.queue", v9);
    serialQueue = v8->_serialQueue;
    v8->_serialQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_USER_INITIATED, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.MusicLibrary.MLMediaLibraryResourceServiceClient.callout.queue", v12);
    calloutQueue = v8->_calloutQueue;
    v8->_calloutQueue = (OS_dispatch_queue *)v13;

    v15 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    accountChangeOperationQueue = v8->_accountChangeOperationQueue;
    v8->_accountChangeOperationQueue = v15;

    -[NSOperationQueue setName:](v8->_accountChangeOperationQueue, "setName:", CFSTR("com.apple.MusicLibrary.MLMediaLibraryResourceServiceClient.path.change.queue"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v8->_accountChangeOperationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v8->_accountChangeOperationQueue, "setQualityOfService:", 25);
  }

  return v8;
}

- (id)_musicContainerPathWithError:(id *)a3
{
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__7163;
  v10 = __Block_byref_object_dispose__7164;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__MLMediaLibraryResourcesServiceClient__musicContainerPathWithError___block_invoke;
  v5[3] = &unk_1E5B62308;
  v5[4] = &v6;
  -[MLMediaLibraryResourcesServiceClient _performOnServerObjectWithMaxRetries:error:remoteObjectBlock:](self, "_performOnServerObjectWithMaxRetries:error:remoteObjectBlock:", 10, a3, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_libraryContainerPathWithError:(id *)a3
{
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__7163;
  v10 = __Block_byref_object_dispose__7164;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__MLMediaLibraryResourcesServiceClient__libraryContainerPathWithError___block_invoke;
  v5[3] = &unk_1E5B62308;
  v5[4] = &v6;
  -[MLMediaLibraryResourcesServiceClient _performOnServerObjectWithMaxRetries:error:remoteObjectBlock:](self, "_performOnServerObjectWithMaxRetries:error:remoteObjectBlock:", 10, a3, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_performOnServerObjectWithMaxRetries:(int64_t)a3 error:(id *)a4 remoteObjectBlock:(id)a5
{
  uint64_t (**v7)(id, void *);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  id *v16;
  _QWORD v17[8];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v16 = a4;
  v7 = (uint64_t (**)(id, void *))a5;
  v8 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__7163;
  v26 = __Block_byref_object_dispose__7164;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v9 = *MEMORY[0x1E0CB28A8];
  v10 = MEMORY[0x1E0C809B0];
  while (1)
  {
    -[MLMediaLibraryResourcesServiceClient xpcClientConnection](self, "xpcClientConnection", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __101__MLMediaLibraryResourcesServiceClient__performOnServerObjectWithMaxRetries_error_remoteObjectBlock___block_invoke;
    v17[3] = &unk_1E5B62330;
    v17[4] = self;
    v17[5] = &v18;
    v17[6] = &v22;
    v17[7] = a3;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if ((v7[2](v7, v12) & 1) != 0)
        break;
    }
    v13 = (void *)v23[5];
    if (!v13)
      goto LABEL_10;
    objc_msgSend(v13, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "isEqualToString:", v9) || objc_msgSend((id)v23[5], "code") != 4097)
    {

LABEL_10:
      if (v16)
        *v16 = objc_retainAutorelease((id)v23[5]);
      break;
    }
    v15 = v19[3];

    v8 = v12;
    if (v15 >= a3)
      goto LABEL_10;
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

}

- (void)performDatabasePathChange:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _ML3MultiUserAccountChangeOperation *v9;
  void *v10;
  _ML3MultiUserAccountChangeOperation *v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  MLMediaLibraryResourcesServiceClient *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218243;
    v18 = self;
    v19 = 2113;
    v20 = v6;
    _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEBUG, "MLMediaLibraryResourcesServiceClient %p - performDatabasePathChange: - newPath=%{private}@", buf, 0x16u);
  }

  v9 = [_ML3MultiUserAccountChangeOperation alloc];
  -[MLMediaLibraryResourcesServiceClient accountChangeObserver](self, "accountChangeObserver");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_ML3MultiUserAccountChangeOperation initWithDatabasePath:accountChangeObserver:](v9, "initWithDatabasePath:accountChangeObserver:", v6, v10);

  objc_initWeak((id *)buf, v11);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__MLMediaLibraryResourcesServiceClient_performDatabasePathChange_completion___block_invoke;
  v14[3] = &unk_1E5B62358;
  objc_copyWeak(&v16, (id *)buf);
  v12 = v7;
  v14[4] = self;
  v15 = v12;
  -[_ML3MultiUserAccountChangeOperation setCompletionBlock:](v11, "setCompletionBlock:", v14);
  -[MLMediaLibraryResourcesServiceClient accountChangeOperationQueue](self, "accountChangeOperationQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addOperation:", v11);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

}

- (void)emergencyDisconnectWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MLMediaLibraryResourcesServiceClient accountChangeObserver](self, "accountChangeObserver");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emergencyDisconnectWithCompletion:", v4);

}

- (void)terminateForFailureToPerformDatabasePathChange
{
  NSObject *v3;
  void *v4;
  int v5;
  MLMediaLibraryResourcesServiceClient *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 134217984;
    v6 = self;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEBUG, "MLMediaLibraryResourcesServiceClient %p - terminateForFailureToPrepareForAccountChange:", (uint8_t *)&v5, 0xCu);
  }

  -[MLMediaLibraryResourcesServiceClient accountChangeObserver](self, "accountChangeObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "terminateForFailureToPerformDatabasePathChange");

}

- (NSXPCConnection)xpcClientConnection
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__7163;
  v11 = __Block_byref_object_dispose__7164;
  v12 = 0;
  -[MLMediaLibraryResourcesServiceClient serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__MLMediaLibraryResourcesServiceClient_xpcClientConnection__block_invoke;
  v6[3] = &unk_1E5B65E48;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSXPCConnection *)v4;
}

- (id)connectionWithListenerEndpoint:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v4);
    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEC955F0);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRemoteObjectInterface:", v6);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEC8DF08);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v7);
    objc_msgSend(v5, "setExportedObject:", self);
    objc_initWeak(location, self);
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __71__MLMediaLibraryResourcesServiceClient_connectionWithListenerEndpoint___block_invoke;
    v14[3] = &unk_1E5B623A0;
    objc_copyWeak(&v16, location);
    v14[4] = self;
    v9 = v5;
    v15 = v9;
    objc_msgSend(v9, "setInterruptionHandler:", v14);
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __71__MLMediaLibraryResourcesServiceClient_connectionWithListenerEndpoint___block_invoke_3;
    v12[3] = &unk_1E5B62588;
    objc_copyWeak(&v13, location);
    v12[4] = self;
    objc_msgSend(v9, "setInvalidationHandler:", v12);
    objc_msgSend(v9, "resume");
    v10 = v9;
    objc_destroyWeak(&v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(location);

  }
  else
  {
    v6 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = self;
      _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_ERROR, "MLMediaLibraryResourcesServiceClient %p - Unable to create XPC Connection [no listener endpoint]", (uint8_t *)location, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (void)setXpcClientConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcClientConnection, a3);
}

- (MLMediaLibraryAccountChangeObserver)accountChangeObserver
{
  return self->_accountChangeObserver;
}

- (void)setAccountChangeObserver:(id)a3
{
  objc_storeStrong((id *)&self->_accountChangeObserver, a3);
}

- (NSOperationQueue)accountChangeOperationQueue
{
  return self->_accountChangeOperationQueue;
}

- (void)setAccountChangeOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accountChangeOperationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountChangeOperationQueue, 0);
  objc_storeStrong((id *)&self->_accountChangeObserver, 0);
  objc_storeStrong((id *)&self->_xpcClientConnection, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __71__MLMediaLibraryResourcesServiceClient_connectionWithListenerEndpoint___block_invoke(id *a1)
{
  id WeakRetained;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  _QWORD block[4];
  NSObject *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v4)
    {
      objc_msgSend(WeakRetained, "accountChangeObserver");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218240;
      v19 = WeakRetained;
      v20 = 2048;
      v21 = v5;
      _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "MLMediaLibraryResourcesServiceClient %p - XPC Connection interrupted [Processing] - accountChangeObserver=%p", buf, 0x16u);

    }
    objc_msgSend(a1[4], "serialQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__MLMediaLibraryResourcesServiceClient_connectionWithListenerEndpoint___block_invoke_91;
    block[3] = &unk_1E5B659D0;
    v8 = WeakRetained;
    v15 = v8;
    v9 = a1[5];
    v10 = a1[4];
    v16 = v9;
    v17 = v10;
    dispatch_sync(v6, block);

    objc_msgSend(a1[4], "calloutQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __71__MLMediaLibraryResourcesServiceClient_connectionWithListenerEndpoint___block_invoke_92;
    v12[3] = &unk_1E5B65D80;
    v13 = v8;
    dispatch_async(v11, v12);

    v3 = v15;
  }
  else if (v4)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "MLMediaLibraryResourcesServiceClient - XPC Connection interrupted [Unable to process ]", buf, 2u);
  }

}

void __71__MLMediaLibraryResourcesServiceClient_connectionWithListenerEndpoint___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = WeakRetained;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "MLMediaLibraryResourcesServiceClient %p - Connection to media library resources service invalidated", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "serialQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__MLMediaLibraryResourcesServiceClient_connectionWithListenerEndpoint___block_invoke_93;
  v7[3] = &unk_1E5B65EB8;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = WeakRetained;
  v9 = v5;
  v6 = WeakRetained;
  dispatch_sync(v4, v7);

}

void __71__MLMediaLibraryResourcesServiceClient_connectionWithListenerEndpoint___block_invoke_93(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 134217984;
    v7 = v3;
    _os_log_impl(&dword_1AC149000, v2, OS_LOG_TYPE_DEFAULT, "MLMediaLibraryResourcesServiceClient %p - Resetting XPC connection to nil", (uint8_t *)&v6, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = 0;

}

void __71__MLMediaLibraryResourcesServiceClient_connectionWithListenerEndpoint___block_invoke_91(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v6 = 134217984;
    v7 = v3;
    _os_log_impl(&dword_1AC149000, v2, OS_LOG_TYPE_DEFAULT, "MLMediaLibraryResourcesServiceClient %p - Resetting XPC connection to nil", (uint8_t *)&v6, 0xCu);
  }

  v4 = (void *)a1[5];
  v5 = a1[6];
  if (v4 == *(void **)(v5 + 24))
  {
    *(_QWORD *)(v5 + 24) = 0;

  }
}

void __71__MLMediaLibraryResourcesServiceClient_connectionWithListenerEndpoint___block_invoke_92(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "accountChangeObserver");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "emergencyDisconnectWithCompletion:", &__block_literal_global_7156);

}

void __59__MLMediaLibraryResourcesServiceClient_xpcClientConnection__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v18 = v4;
      _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "MLMediaLibraryResourcesServiceClient %p - Creating XPC Client Connection [started]", buf, 0xCu);
    }

    +[MLMediaLibraryService sharedMediaLibraryService](MLMediaLibraryService, "sharedMediaLibraryService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v5, "mediaLibraryResourcesServiceListenerEndpointWithError:", &v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v16;

    if (v7 || !v6)
    {
      v8 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134218242;
        v18 = v9;
        v19 = 2114;
        v20 = v7;
        _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_ERROR, "MLMediaLibraryResourcesServiceClient %p - Creating XPC Client Connection [failed] - error=%{public}@", buf, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "connectionWithListenerEndpoint:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 24);
    *(_QWORD *)(v11 + 24) = v10;

    v13 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 24);
      *(_DWORD *)buf = 134218242;
      v18 = v14;
      v19 = 2114;
      v20 = v15;
      _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_DEFAULT, "MLMediaLibraryResourcesServiceClient %p - Creating XPC Client Connection [ended] - connection=%{public}@", buf, 0x16u);
    }

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void __77__MLMediaLibraryResourcesServiceClient_performDatabasePathChange_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(_QWORD, BOOL, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3 != 0, v3);
  objc_msgSend(*(id *)(a1 + 32), "calloutQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__MLMediaLibraryResourcesServiceClient_performDatabasePathChange_completion___block_invoke_2;
  block[3] = &unk_1E5B65D80;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v4, block);

}

void __77__MLMediaLibraryResourcesServiceClient_performDatabasePathChange_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_1AC149000, v2, OS_LOG_TYPE_DEFAULT, "MLMediaLibraryResourcesServiceClient %p - Database path change completed [posting path change notification]", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("MLUserDatabasePathDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __101__MLMediaLibraryResourcesServiceClient__performOnServerObjectWithMaxRetries_error_remoteObjectBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {
    v5 = objc_msgSend(v3, "code");

    if (v5 == 4097)
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v6 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        v9 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 134218496;
        v17 = v7;
        v18 = 2048;
        v19 = v8;
        v20 = 2048;
        v21 = v9;
        _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_ERROR, "MLMediaLibraryResourcesServiceClient %p - Unable to retrieve path [XPC connection interrupted] - Recreating the connection - Attempt %ld of %ld", buf, 0x20u);
      }

      objc_msgSend(*(id *)(a1 + 32), "serialQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __101__MLMediaLibraryResourcesServiceClient__performOnServerObjectWithMaxRetries_error_remoteObjectBlock___block_invoke_30;
      block[3] = &unk_1E5B65D80;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_sync(v10, block);
      goto LABEL_9;
    }
  }
  else
  {

  }
  v10 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    v17 = v11;
    v18 = 2114;
    v19 = v3;
    _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_ERROR, "MLMediaLibraryResourcesServiceClient %p - Unable to retrieve path - error=%{public}@", buf, 0x16u);
  }
LABEL_9:

  v12 = objc_msgSend(v3, "copy");
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

void __101__MLMediaLibraryResourcesServiceClient__performOnServerObjectWithMaxRetries_error_remoteObjectBlock___block_invoke_30(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = 0;

}

BOOL __71__MLMediaLibraryResourcesServiceClient__libraryContainerPathWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__MLMediaLibraryResourcesServiceClient__libraryContainerPathWithError___block_invoke_2;
  v4[3] = &unk_1E5B622E0;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "libraryContainerPathWithCompletion:", v4);
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

void __71__MLMediaLibraryResourcesServiceClient__libraryContainerPathWithError___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

BOOL __69__MLMediaLibraryResourcesServiceClient__musicContainerPathWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__MLMediaLibraryResourcesServiceClient__musicContainerPathWithError___block_invoke_2;
  v4[3] = &unk_1E5B622E0;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "musicContainerPathWithCompletion:", v4);
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

void __69__MLMediaLibraryResourcesServiceClient__musicContainerPathWithError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __68__MLMediaLibraryResourcesServiceClient_musicContainerPathWithError___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_musicContainerPathWithError:", &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __70__MLMediaLibraryResourcesServiceClient_libraryContainerPathWithError___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_libraryContainerPathWithError:", &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

+ (MLMediaLibraryResourcesServiceClient)sharedService
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v7 = objc_opt_class();
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEBUG, "MLMediaLibraryResourcesServiceClient %p - sharedService:", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MLMediaLibraryResourcesServiceClient_sharedService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedService_onceToken[0] != -1)
    dispatch_once(sharedService_onceToken, block);
  return (MLMediaLibraryResourcesServiceClient *)(id)sharedService___sharedService;
}

void __53__MLMediaLibraryResourcesServiceClient_sharedService__block_invoke()
{
  NSObject *v0;
  MLMediaLibraryResourcesServiceClient *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138543362;
    v6 = objc_opt_class();
    _os_log_impl(&dword_1AC149000, v0, OS_LOG_TYPE_DEBUG, "%{public}@ - Initializing the shared service:", (uint8_t *)&v5, 0xCu);
  }

  v1 = [MLMediaLibraryResourcesServiceClient alloc];
  +[ML3MusicLibraryAccountChangeObserverProxy sharedProxy](ML3MusicLibraryAccountChangeObserverProxy, "sharedProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[MLMediaLibraryResourcesServiceClient _initWithAccountChangeObserver:](v1, "_initWithAccountChangeObserver:", v2);
  v4 = (void *)sharedService___sharedService;
  sharedService___sharedService = v3;

}

@end

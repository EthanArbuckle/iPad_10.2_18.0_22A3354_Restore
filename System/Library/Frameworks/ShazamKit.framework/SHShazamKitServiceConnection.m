@implementation SHShazamKitServiceConnection

- (void)dealloc
{
  objc_super v3;

  -[SHShazamKitServiceConnection tearDownConnection](self, "tearDownConnection");
  v3.receiver = self;
  v3.super_class = (Class)SHShazamKitServiceConnection;
  -[SHShazamKitServiceConnection dealloc](&v3, sel_dealloc);
}

- (SHShazamKitServiceConnection)initWithConnectionProvider:(id)a3
{
  id v5;
  SHShazamKitServiceConnection *v6;
  SHShazamKitServiceConnectionClient *v7;
  SHShazamKitServiceConnectionClient *shazamKitClient;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SHShazamKitServiceConnection;
  v6 = -[SHShazamKitServiceConnection init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(SHShazamKitServiceConnectionClient);
    shazamKitClient = v6->_shazamKitClient;
    v6->_shazamKitClient = v7;

    objc_storeStrong((id *)&v6->_connectionProvider, a3);
    v6->_connectionLock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (id)delegate
{
  void *v2;
  void *v3;

  -[SHShazamKitServiceConnection shazamKitClient](self, "shazamKitClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SHShazamKitServiceConnection shazamKitClient](self, "shazamKitClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

- (NSXPCConnection)connection
{
  os_unfair_lock_s *p_connectionLock;
  void *v4;
  NSXPCConnection *v5;
  NSXPCConnection *connection;
  void *v7;

  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  if (!self->_connection)
  {
    -[SHShazamKitServiceConnection connectionProvider](self, "connectionProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shazamKitServiceConnection");
    v5 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
    connection = self->_connection;
    self->_connection = v5;

    -[SHShazamKitServiceConnection shazamKitClient](self, "shazamKitClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", v7);

    -[SHShazamKitServiceConnection attachDefaultConnectionHandlers](self, "attachDefaultConnectionHandlers");
    -[NSXPCConnection resume](self->_connection, "resume");
  }
  os_unfair_lock_unlock(p_connectionLock);
  return self->_connection;
}

- (void)attachDefaultConnectionHandlers
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x24BDAC760];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__SHShazamKitServiceConnection_attachDefaultConnectionHandlers__block_invoke;
  v6[3] = &unk_24D9B7B88;
  objc_copyWeak(&v7, &location);
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v6);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __63__SHShazamKitServiceConnection_attachDefaultConnectionHandlers__block_invoke_3;
  v4[3] = &unk_24D9B7B88;
  objc_copyWeak(&v5, &location);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __63__SHShazamKitServiceConnection_attachDefaultConnectionHandlers__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  sh_log_object();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = 138412290;
    v6 = WeakRetained;
    _os_log_impl(&dword_218BF1000, v2, OS_LOG_TYPE_ERROR, "Fired XPC service interruption handler %@", (uint8_t *)&v5, 0xCu);

  }
  v4 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v4, "tearDownConnection");

}

void __63__SHShazamKitServiceConnection_attachDefaultConnectionHandlers__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  sh_log_object();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = 138412290;
    v6 = WeakRetained;
    _os_log_impl(&dword_218BF1000, v2, OS_LOG_TYPE_ERROR, "Fired XPC service invalidation handler %@", (uint8_t *)&v5, 0xCu);

  }
  v4 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v4, "tearDownConnection");

}

- (void)tearDownConnection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  _QWORD v8[4];
  NSXPCConnection *v9;

  connection = self->_connection;
  if (connection)
  {
    -[NSXPCConnection setExportedObject:](connection, "setExportedObject:", 0);
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", 0);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", 0);
    v4 = self->_connection;
    v5 = self->_connection;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __50__SHShazamKitServiceConnection_tearDownConnection__block_invoke;
    v8[3] = &unk_24D9B7DA8;
    v9 = v4;
    v6 = v4;
    -[NSXPCConnection scheduleSendBarrierBlock:](v5, "scheduleSendBarrierBlock:", v8);
    v7 = self->_connection;
    self->_connection = 0;

  }
}

uint64_t __50__SHShazamKitServiceConnection_tearDownConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (id)matcherDelegateErrorHandlerForSignature:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD aBlock[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__SHShazamKitServiceConnection_matcherDelegateErrorHandlerForSignature___block_invoke;
  aBlock[3] = &unk_24D9B7DD0;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  v5 = v4;
  v6 = _Block_copy(aBlock);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

void __72__SHShazamKitServiceConnection_matcherDelegateErrorHandlerForSignature___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id to;

  v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 40));
  v4 = objc_loadWeakRetained(&to);
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_25500CDE0);

  if (v6)
  {
    v7 = objc_loadWeakRetained(&to);
    objc_msgSend(v7, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE90530], "errorWithCode:underlyingError:", 100, v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_loadWeakRetained(&to);
    +[SHMatcherResponse errorResponseForSignature:error:](SHMatcherResponse, "errorResponseForSignature:error:", *(_QWORD *)(a1 + 32), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "matcher:didProduceResponse:", v10, v11);

  }
  objc_destroyWeak(&to);

}

- (void)prepareMatcherForRequestID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = a3;
  -[SHShazamKitServiceConnection connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  -[SHShazamKitServiceConnection matcherDelegateErrorHandlerForSignature:](self, "matcherDelegateErrorHandlerForSignature:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __77__SHShazamKitServiceConnection_prepareMatcherForRequestID_completionHandler___block_invoke;
  v13[3] = &unk_24D9B7DF8;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v11, "prepareMatcherForRequestID:completionHandler:", v7, v13);

}

uint64_t __77__SHShazamKitServiceConnection_prepareMatcherForRequestID_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  sh_log_object();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_218BF1000, v2, OS_LOG_TYPE_DEBUG, "Prepare recognition request completion handler called", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startRecognitionForRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SHShazamKitServiceConnection connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "signature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v6 = (void *)objc_opt_new();
  -[SHShazamKitServiceConnection matcherDelegateErrorHandlerForSignature:](self, "matcherDelegateErrorHandlerForSignature:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startRecognitionForRequest:completionHandler:", v9, &__block_literal_global_7);

  if (!v5)
}

void __59__SHShazamKitServiceConnection_startRecognitionForRequest___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  sh_log_object();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_218BF1000, v0, OS_LOG_TYPE_DEBUG, "Recognition request completion handler called", v1, 2u);
  }

}

- (void)matcher:(id)a3 didProduceResponse:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[SHShazamKitServiceConnection connection](self, "connection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "signature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHShazamKitServiceConnection matcherDelegateErrorHandlerForSignature:](self, "matcherDelegateErrorHandlerForSignature:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "matcher:didProduceResponse:", v7, v6);

}

- (void)stopRecognition
{
  void *v2;
  id v3;

  -[SHShazamKitServiceConnection connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopRecognition");

}

- (void)stopRecognitionForRequestID:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SHShazamKitServiceConnection connection](self, "connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopRecognitionForRequestID:", v4);

}

- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD aBlock[4];
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__SHShazamKitServiceConnection__synchronizeSnapshot_startCondition___block_invoke;
  aBlock[3] = &unk_24D9B7E20;
  objc_copyWeak(&v14, &location);
  v8 = v6;
  v13 = v8;
  v9 = _Block_copy(aBlock);
  -[SHShazamKitServiceConnection connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "synchronizeSnapshot:startCondition:completionHandler:", v8, v7, &__block_literal_global_67);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __68__SHShazamKitServiceConnection__synchronizeSnapshot_startCondition___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "conformsToProtocol:", &unk_25500D5B8);

  if (v3)
  {
    objc_msgSend(WeakRetained, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ShazamKit.ShazamLibrary"), 301, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "allItemIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_library:didProduceError:failedItemIdentifiers:", WeakRetained, v5, v6);

  }
}

void __68__SHShazamKitServiceConnection__synchronizeSnapshot_startCondition___block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  sh_log_object();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_218BF1000, v0, OS_LOG_TYPE_DEFAULT, "Synchronize difference completion handler called", v1, 2u);
  }

}

- (void)_libraryInfoWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD aBlock[4];
  id v10;

  v4 = a3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__SHShazamKitServiceConnection__libraryInfoWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_24D9B7DF8;
  v10 = v4;
  v5 = v4;
  v6 = _Block_copy(aBlock);
  -[SHShazamKitServiceConnection connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_libraryInfoWithCompletionHandler:", v5);

}

void __66__SHShazamKitServiceConnection__libraryInfoWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ShazamKit.ShazamLibrary"), 301, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_queryLibraryWithParameters:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD aBlock[4];
  id v13;

  v6 = a4;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__SHShazamKitServiceConnection__queryLibraryWithParameters_completionHandler___block_invoke;
  aBlock[3] = &unk_24D9B7DF8;
  v13 = v6;
  v7 = v6;
  v8 = a3;
  v9 = _Block_copy(aBlock);
  -[SHShazamKitServiceConnection connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_queryLibraryWithParameters:completionHandler:", v8, v7);

}

void __78__SHShazamKitServiceConnection__queryLibraryWithParameters_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ShazamKit.ShazamLibrary"), 301, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)mediaItemsForShazamIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD aBlock[4];
  id v13;

  v6 = a4;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__SHShazamKitServiceConnection_mediaItemsForShazamIDs_completionHandler___block_invoke;
  aBlock[3] = &unk_24D9B7DF8;
  v13 = v6;
  v7 = v6;
  v8 = a3;
  v9 = _Block_copy(aBlock);
  -[SHShazamKitServiceConnection connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mediaItemsForShazamIDs:completionHandler:", v8, v7);

}

void __73__SHShazamKitServiceConnection_mediaItemsForShazamIDs_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BE90530], "errorWithCode:underlyingError:", 100, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)hapticsForMediaItems:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD aBlock[4];
  id v13;

  v6 = a4;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__SHShazamKitServiceConnection_hapticsForMediaItems_completionHandler___block_invoke;
  aBlock[3] = &unk_24D9B7DF8;
  v13 = v6;
  v7 = v6;
  v8 = a3;
  v9 = _Block_copy(aBlock);
  -[SHShazamKitServiceConnection connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hapticsForMediaItems:completionHandler:", v8, v7);

}

void __71__SHShazamKitServiceConnection_hapticsForMediaItems_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BE90530], "errorWithCode:underlyingError:", 100, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)isHapticTrackAvailableForMediaItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD aBlock[4];
  id v13;

  v6 = a4;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__SHShazamKitServiceConnection_isHapticTrackAvailableForMediaItem_completionHandler___block_invoke;
  aBlock[3] = &unk_24D9B7DF8;
  v13 = v6;
  v7 = v6;
  v8 = a3;
  v9 = _Block_copy(aBlock);
  -[SHShazamKitServiceConnection connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "isHapticTrackAvailableForMediaItem:completionHandler:", v8, v7);

}

void __85__SHShazamKitServiceConnection_isHapticTrackAvailableForMediaItem_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BE90530], "errorWithCode:underlyingError:", 100, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (SHShazamKitServiceConnectionProvider)connectionProvider
{
  return self->_connectionProvider;
}

- (SHShazamKitServiceConnectionClient)shazamKitClient
{
  return self->_shazamKitClient;
}

- (os_unfair_lock_s)connectionLock
{
  return self->_connectionLock;
}

- (void)setConnectionLock:(os_unfair_lock_s)a3
{
  self->_connectionLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shazamKitClient, 0);
  objc_storeStrong((id *)&self->_connectionProvider, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end

@implementation AXServer

void __32__AXServer__handleActionResult___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "actionHandlers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v5 = *(id *)(a1 + 40);
  v4 = v3;
  AXPerformBlockAsynchronouslyOnMainThread();

}

void __32__AXServer__handleActionResult___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
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
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "handler", (_QWORD)v8);
        v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v7[2](v7, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (id)_handleActionResult:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v7;

  objc_msgSend(a3, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "integerValue");
    objc_msgSend(v3, "objectForKey:", CFSTR("payload"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7;
    AX_PERFORM_WITH_LOCK();

  }
  return 0;
}

- (AXServer)init
{
  AXServer *v2;
  dispatch_queue_t v3;
  uint64_t v4;
  NSMutableArray *actionHandlers;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXServer;
  v2 = -[AXServer init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.accessibility.AXServer.assertion", 0);
    -[AXServer setAssertionWorkQueue:](v2, "setAssertionWorkQueue:", v3);

    *(_QWORD *)&v2->_clientLock._os_unfair_lock_opaque = 0;
    v4 = objc_opt_new();
    actionHandlers = v2->_actionHandlers;
    v2->_actionHandlers = (NSMutableArray *)v4;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AXServer _willClearServer](self, "_willClearServer");
  -[AXServer client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPortDeathHandler:", 0);

  v4.receiver = self;
  v4.super_class = (Class)AXServer;
  -[AXServer dealloc](&v4, sel_dealloc);
}

- (NSString)serverIdentifier
{
  NSString *serverIdentifier;
  id v4;
  NSString *v5;
  NSString *v6;

  serverIdentifier = self->_serverIdentifier;
  if (!serverIdentifier)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    v5 = (NSString *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@-%d-%d"), CFSTR("com.apple.accessibility.AXSystemReplyServer"), getpid(), serverIdentifier_count);
    v6 = self->_serverIdentifier;
    self->_serverIdentifier = v5;

    ++serverIdentifier_count;
    serverIdentifier = self->_serverIdentifier;
  }
  return serverIdentifier;
}

- (void)sendSimpleMessage:(id)a3
{
  -[AXServer sendSimpleMessage:enqueueError:](self, "sendSimpleMessage:enqueueError:", a3, 0);
}

- (BOOL)sendSimpleMessage:(id)a3 enqueueError:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  -[AXServer client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "sendSimpleMessage:withError:", v6, a4);

  return (char)a4;
}

- (BOOL)sendSimpleMessageWithResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  -[AXServer sendSimpleMessageWithObjectResult:](self, "sendSimpleMessageWithObjectResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "BOOLValue");
  return v7;
}

- (id)sendSimpleMessageWithObjectResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v12;

  v4 = a3;
  if (-[AXServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    -[AXServer client](self, "client");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v5, "sendMessage:withError:", v4, &v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;

    if (v7)
    {
      AXLogIPC();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[AXServer sendSimpleMessageWithObjectResult:].cold.1(v4, v7);

    }
    objc_msgSend(v6, "payload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("result"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)sendMessage:(id)a3
{
  return -[AXServer _sendMessage:error:](self, "_sendMessage:error:", a3, 0);
}

- (id)_sendMessage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v6 = a3;
    -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
    -[AXServer client](self, "client");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendMessage:withError:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)sendAsynchronousMessage:(id)a3 replyOnQueue:(id)a4 BOOLResultHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__AXServer_sendAsynchronousMessage_replyOnQueue_BOOLResultHandler___block_invoke;
  v10[3] = &unk_1E24C54D0;
  v11 = v8;
  v9 = v8;
  -[AXServer sendAsynchronousMessage:replyOnQueue:objectResultHandler:](self, "sendAsynchronousMessage:replyOnQueue:objectResultHandler:", a3, a4, v10);

}

uint64_t __67__AXServer_sendAsynchronousMessage_replyOnQueue_BOOLResultHandler___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "BOOLValue"));
}

- (void)sendAsynchronousMessage:(id)a3 replyOnQueue:(id)a4 objectResultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__AXServer_sendAsynchronousMessage_replyOnQueue_objectResultHandler___block_invoke;
  v12[3] = &unk_1E24C5930;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[AXServer sendAsynchronousMessage:replyOnQueue:handler:](self, "sendAsynchronousMessage:replyOnQueue:handler:", v11, a4, v12);

}

void __69__AXServer_sendAsynchronousMessage_replyOnQueue_objectResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a3;
  if (v5)
  {
    AXLogIPC();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __69__AXServer_sendAsynchronousMessage_replyOnQueue_objectResultHandler___block_invoke_cold_1(a1, v5);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(a2, "payload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("result"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);

  }
}

- (void)sendAsynchronousMessage:(id)a3 replyOnQueue:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD block[4];
  id v13;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  if (v8)
  {
    -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
    -[AXServer client](self, "client");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendAsyncMessage:replyOnQueue:replyHandler:", v8, v10, v9);

  }
  else
  {
    _AXLogWithFacility();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__AXServer_sendAsynchronousMessage_replyOnQueue_handler___block_invoke;
    block[3] = &unk_1E24C5408;
    v13 = v9;
    dispatch_async(v10, block);

  }
}

uint64_t __57__AXServer_sendAsynchronousMessage_replyOnQueue_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_processAssertionBacklog
{
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = a1;
  v10 = 2112;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  _os_log_error_impl(&dword_18C62B000, a3, OS_LOG_TYPE_ERROR, "Timed out trying to %@ assertion with type: %@ identifier: error: %@. will retry.", (uint8_t *)&v8, 0x20u);

}

void __36__AXServer__processAssertionBacklog__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_processAssertionBacklog");

}

- (void)_initializeAssertionBookkeeping
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  -[AXServer assertionWorkBacklog](self, "assertionWorkBacklog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXServer setAssertionWorkBacklog:](self, "setAssertionWorkBacklog:", v4);

  }
  -[AXServer assertionRetryTimer](self, "assertionRetryTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CF3978]);
    -[AXServer assertionWorkQueue](self, "assertionWorkQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v6, "initWithTargetSerialQueue:", v7);

    objc_msgSend(v8, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
    -[AXServer setAssertionRetryTimer:](self, "setAssertionRetryTimer:", v8);

  }
}

- (void)acquireAssertionWithType:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD aBlock[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__AXServer_acquireAssertionWithType_identifier___block_invoke;
  aBlock[3] = &unk_1E24C5958;
  aBlock[4] = self;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  v10 = _Block_copy(aBlock);
  -[AXServer assertionWorkQueue](self, "assertionWorkQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v11, v10);

}

void __48__AXServer_acquireAssertionWithType_identifier___block_invoke(uint64_t a1)
{
  void *v2;
  AXAssertionWorkItem *v3;

  objc_msgSend(*(id *)(a1 + 32), "_initializeAssertionBookkeeping");
  v3 = -[AXAssertionWorkItem initWithType:identifier:isAcquisition:]([AXAssertionWorkItem alloc], "initWithType:identifier:isAcquisition:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
  objc_msgSend(*(id *)(a1 + 32), "assertionWorkBacklog");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  objc_msgSend(*(id *)(a1 + 32), "_processAssertionBacklog");
}

- (void)relinquishAssertionWithType:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD aBlock[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__AXServer_relinquishAssertionWithType_identifier___block_invoke;
  aBlock[3] = &unk_1E24C5958;
  aBlock[4] = self;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  v10 = _Block_copy(aBlock);
  -[AXServer assertionWorkQueue](self, "assertionWorkQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v11, v10);

}

void __51__AXServer_relinquishAssertionWithType_identifier___block_invoke(uint64_t a1)
{
  void *v2;
  AXAssertionWorkItem *v3;

  objc_msgSend(*(id *)(a1 + 32), "_initializeAssertionBookkeeping");
  v3 = -[AXAssertionWorkItem initWithType:identifier:isAcquisition:]([AXAssertionWorkItem alloc], "initWithType:identifier:isAcquisition:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
  objc_msgSend(*(id *)(a1 + 32), "assertionWorkBacklog");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  objc_msgSend(*(id *)(a1 + 32), "_processAssertionBacklog");
}

- (void)_didConnectToServer
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = -[AXServer _actionResultKey](self, "_actionResultKey");
  if ((_DWORD)v3)
  {
    v4 = v3;
    -[AXServer server](self, "server");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHandlerWithTarget:selector:forKey:", self, sel__handleActionResult_, v4);

  }
}

- (AXIPCClient)client
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__4;
  v8 = __Block_byref_object_dispose__4;
  v9 = 0;
  AX_PERFORM_WITH_LOCK();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (AXIPCClient *)v2;
}

void __18__AXServer_client__block_invoke(uint64_t a1)
{
  void *v2;
  AXIPCClient *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (!v2)
  {
    v3 = [AXIPCClient alloc];
    objc_msgSend(*(id *)(a1 + 32), "_serviceName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCClient initWithServiceName:](v3, "initWithServiceName:", v4);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setShouldRegisterCallbackSourceOnMainRunloop:", objc_msgSend(*(id *)(a1 + 32), "shouldRegisterClientCallbackSourceOnMainRunloop"));
    LODWORD(v8) = 1.0;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setTimeout:", v8);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

- (void)setClient:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AX_PERFORM_WITH_LOCK();

}

void __22__AXServer_setClient___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

- (BOOL)_connectIfNecessary
{
  void *v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id from;
  id location;
  id v15;

  -[AXServer client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isConnected") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v15 = 0;
    objc_msgSend(v3, "connectWithError:", &v15);
    v5 = v15;
    v4 = v5 == 0;
    if (v5)
    {
      AXLogSystemApp();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[AXServer _connectIfNecessary].cold.1(v5, v6);

    }
    else
    {
      -[AXServer serverIdentifier](self, "serverIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setClientIdentifier:", v7);

      objc_initWeak(&location, self);
      v8 = objc_initWeak(&from, v3);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __31__AXServer__connectIfNecessary__block_invoke;
      v10[3] = &unk_1E24C59A8;
      objc_copyWeak(&v11, &location);
      objc_copyWeak(&v12, &from);
      objc_msgSend(v3, "setPortDeathHandler:", v10);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    -[AXServer _didConnectToClient](self, "_didConnectToClient");

  }
  return v4;
}

void __31__AXServer__connectIfNecessary__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_wasDisconnectedFromClient");
  objc_msgSend(v2, "setPortDeathHandler:", 0);
  objc_msgSend(WeakRetained, "setClient:", 0);
  objc_msgSend(WeakRetained, "_willClearServer");
  objc_msgSend(WeakRetained, "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopServerWithError:", 0);

  objc_msgSend(WeakRetained, "setServer:", 0);
}

- (BOOL)_connectServerIfNecessary
{
  void *v3;
  char v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  AXIPCServer *v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint8_t *v19;
  id v21;
  uint8_t buf[2];
  __int16 v23;

  -[AXServer server](self, "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRunning");

  if ((v4 & 1) == 0)
  {
    -[AXServer server](self, "server");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
LABEL_4:
      -[AXServer server](self, "server");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isRunning");

      if ((v8 & 1) == 0)
      {
        -[AXServer server](self, "server");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0;
        v10 = objc_msgSend(v9, "startServerWithError:", &v21);
        v11 = v21;

        if (!v10 || v11)
        {
          AXLogIPC();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[AXServer _connectServerIfNecessary].cold.1((uint64_t)v11, v16);

        }
        else
        {
          -[AXServer _didConnectToServer](self, "_didConnectToServer");
        }

      }
      -[AXServer server](self, "server");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v13, "isRunning");
      goto LABEL_22;
    }
    -[AXServer client](self, "client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = objc_msgSend(v12, "clientCallbackPort");
      if ((_DWORD)v14)
      {
        v15 = -[AXIPCServer initWithPort:serviceRunLoopSource:]([AXIPCServer alloc], "initWithPort:serviceRunLoopSource:", v14, objc_msgSend(v13, "clientCallbackSource"));
        -[AXServer setServer:](self, "setServer:", v15);

        goto LABEL_4;
      }
      AXLogIPC();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v18 = "not connecting to server, no client callback port yet";
        v19 = buf;
        goto LABEL_20;
      }
    }
    else
    {
      AXLogIPC();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v23 = 0;
        v18 = "not connecting to server, no client yet";
        v19 = (uint8_t *)&v23;
LABEL_20:
        _os_log_impl(&dword_18C62B000, v17, OS_LOG_TYPE_INFO, v18, v19, 2u);
      }
    }

    v5 = 0;
LABEL_22:

    return v5;
  }
  return 1;
}

- (void)_ensureAssertionsHaveBeenProcessedWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[AXServer assertionWorkQueue](self, "assertionWorkQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, v4);

}

- (void)_registerActionHandler:(id)a3 withIdentifierCallback:(id)a4 retryInterval:(double)a5 registrationMessageKey:(int)a6
{
  uint64_t v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  AXIPCMessage *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  double v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  AXServer *v32;
  id v33;
  id v34;
  double v35;
  int v36;

  v6 = *(_QWORD *)&a6;
  v10 = a3;
  v11 = a4;
  if (-[AXServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    -[AXServer _connectServerIfNecessary](self, "_connectServerIfNecessary");
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_opt_new();
    objc_msgSend(v14, "setIdentifier:", v13);
    objc_msgSend(v14, "setHandler:", v10);
    v15 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", v6, &unk_1E24F8F30);
    -[AXServer client](self, "client");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __95__AXServer__registerActionHandler_withIdentifierCallback_retryInterval_registrationMessageKey___block_invoke_2;
    v21[3] = &unk_1E24C59F8;
    v21[4] = self;
    v22 = v14;
    v23 = v13;
    v24 = v11;
    v25 = v10;
    v26 = a5;
    v27 = v6;
    v17 = v11;
    v18 = v10;
    v19 = v13;
    v20 = v14;
    objc_msgSend(v16, "sendAsyncMessage:withReplyHandler:", v15, v21);

  }
  else
  {
    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = __95__AXServer__registerActionHandler_withIdentifierCallback_retryInterval_registrationMessageKey___block_invoke;
    v31 = &unk_1E24C59D0;
    v32 = self;
    v33 = v10;
    v34 = v11;
    v35 = a5;
    v36 = v6;
    v20 = v11;
    v15 = (AXIPCMessage *)v10;
    AXPerformBlockOnMainThreadAfterDelay();

  }
}

uint64_t __95__AXServer__registerActionHandler_withIdentifierCallback_retryInterval_registrationMessageKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerActionHandler:withIdentifierCallback:retryInterval:registrationMessageKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64), *(double *)(a1 + 56));
}

void __95__AXServer__registerActionHandler_withIdentifierCallback_retryInterval_registrationMessageKey___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  id *v8;
  id v9;
  id v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  uint64_t v17;
  id v18;

  objc_msgSend(a2, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("result"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    v13 = MEMORY[0x1E0C809B0];
    v15 = __95__AXServer__registerActionHandler_withIdentifierCallback_retryInterval_registrationMessageKey___block_invoke_3;
    v16 = &unk_1E24C5200;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v14 = 3221225472;
    v17 = v6;
    v8 = &v18;
    v18 = v7;
    AX_PERFORM_WITH_LOCK();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v8 = &v9;
    v9 = *(id *)(a1 + 64);
    v10 = *(id *)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 72);
    v12 = *(_DWORD *)(a1 + 80);
    AXPerformBlockOnMainThreadAfterDelay();

  }
}

void __95__AXServer__registerActionHandler_withIdentifierCallback_retryInterval_registrationMessageKey___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "actionHandlers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

uint64_t __95__AXServer__registerActionHandler_withIdentifierCallback_retryInterval_registrationMessageKey___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerActionHandler:withIdentifierCallback:retryInterval:registrationMessageKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64), *(double *)(a1 + 56));
}

- (void)_removeActionHandler:(id)a3 registrationMessageKey:(int)a4
{
  uint64_t v4;
  id v6;
  AXIPCMessage *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (v6)
  {
    -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v9 = v6;
    AX_PERFORM_WITH_LOCK();
    if (!*((_BYTE *)v11 + 24))
    {
      v7 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", v4, &unk_1E24F8F58);
      -[AXServer client](self, "client");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sendSimpleMessage:", v7);

    }
    _Block_object_dispose(&v10, 8);
  }

}

void __56__AXServer__removeActionHandler_registrationMessageKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "actionHandlers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__AXServer__removeActionHandler_registrationMessageKey___block_invoke_2;
  v4[3] = &unk_1E24C5A20;
  v5 = *(id *)(a1 + 40);
  v2 = objc_msgSend(v3, "indexOfObjectPassingTest:", v4);
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "removeObjectAtIndex:", v2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "count") != 0;
  }

}

uint64_t __56__AXServer__removeActionHandler_registrationMessageKey___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (int)_actionResultKey
{
  return 0;
}

- (AXIPCServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  objc_storeStrong((id *)&self->_server, a3);
}

- (void)setServerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)shouldRegisterClientCallbackSourceOnMainRunloop
{
  return self->_shouldRegisterClientCallbackSourceOnMainRunloop;
}

- (void)setShouldRegisterClientCallbackSourceOnMainRunloop:(BOOL)a3
{
  self->_shouldRegisterClientCallbackSourceOnMainRunloop = a3;
}

- (NSMutableArray)assertionWorkBacklog
{
  return self->_assertionWorkBacklog;
}

- (void)setAssertionWorkBacklog:(id)a3
{
  objc_storeStrong((id *)&self->_assertionWorkBacklog, a3);
}

- (AXDispatchTimer)assertionRetryTimer
{
  return self->_assertionRetryTimer;
}

- (void)setAssertionRetryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_assertionRetryTimer, a3);
}

- (OS_dispatch_queue)assertionWorkQueue
{
  return self->_assertionWorkQueue;
}

- (void)setAssertionWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_assertionWorkQueue, a3);
}

- (NSMutableArray)actionHandlers
{
  return self->_actionHandlers;
}

- (void)setActionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_actionHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionHandlers, 0);
  objc_storeStrong((id *)&self->_assertionWorkQueue, 0);
  objc_storeStrong((id *)&self->_assertionRetryTimer, 0);
  objc_storeStrong((id *)&self->_assertionWorkBacklog, 0);
  objc_storeStrong((id *)&self->_serverIdentifier, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

- (id)_serviceName
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (void)sendSimpleMessageWithObjectResult:(void *)a1 .cold.1(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a1, "key"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "ax_nonRedundantDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_0(&dword_18C62B000, v5, v6, "couldn't send message (%@): %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4();
}

void __69__AXServer_sendAsynchronousMessage_replyOnQueue_objectResultHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "ax_nonRedundantDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_0(&dword_18C62B000, v3, v4, "couldn't get async result for message %@: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4();
}

- (void)_connectIfNecessary
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "ax_nonRedundantDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_debug_impl(&dword_18C62B000, a2, OS_LOG_TYPE_DEBUG, "AX SystemApp: Error: %{public}@", (uint8_t *)&v4, 0xCu);

}

- (void)_connectServerIfNecessary
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18C62B000, a2, OS_LOG_TYPE_ERROR, "failed to start ipc server due to: %@", (uint8_t *)&v2, 0xCu);
}

@end

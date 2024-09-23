@implementation FMServerInteractionController

void __61__FMServerInteractionController_sendCommand_completionBlock___block_invoke_2(id *a1)
{
  id WeakRetained;
  double v3;
  dispatch_time_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(a1[4], "_simulatedLatency");
  if (v3 <= 0.0)
  {
    v6 = objc_loadWeakRetained(a1 + 7);
    objc_msgSend(WeakRetained, "processResponseForCommand:callback:", v6, a1[5]);

  }
  else
  {
    v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__FMServerInteractionController_sendCommand_completionBlock___block_invoke_3;
    block[3] = &unk_1E82AAB00;
    block[4] = WeakRetained;
    objc_copyWeak(&v9, a1 + 7);
    v8 = a1[5];
    dispatch_after(v4, v5, block);

    objc_destroyWeak(&v9);
  }

}

- (void)processResponseForCommand:(id)a3 callback:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *dq_inFlightCommands;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_initWeak(&location, self);
  if (v7)
  {
    v7[2](v7);
    objc_msgSend(v6, "setCompletionBlock:", 0);
  }
  dq_inFlightCommands = self->dq_inFlightCommands;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__FMServerInteractionController_processResponseForCommand_callback___block_invoke;
  block[3] = &unk_1E82AA9F8;
  objc_copyWeak(&v12, &location);
  v11 = v6;
  v9 = v6;
  dispatch_sync(dq_inFlightCommands, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)sendCommand:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *dq_inFlightCommands;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(id *);
  void *v16;
  FMServerInteractionController *v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v6);
  dq_inFlightCommands = self->dq_inFlightCommands;
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__FMServerInteractionController_sendCommand_completionBlock___block_invoke;
  block[3] = &unk_1E82AA9F8;
  objc_copyWeak(&v23, &location);
  v10 = v6;
  v22 = v10;
  dispatch_sync(dq_inFlightCommands, block);
  v13 = v9;
  v14 = 3221225472;
  v15 = __61__FMServerInteractionController_sendCommand_completionBlock___block_invoke_2;
  v16 = &unk_1E82AAB28;
  objc_copyWeak(&v19, &location);
  v17 = self;
  objc_copyWeak(&v20, &from);
  v11 = v7;
  v18 = v11;
  objc_msgSend(v10, "setCompletionBlock:", &v13);
  objc_msgSend(v10, "setServerInteractionController:", self, v13, v14, v15, v16, v17);
  -[FMServerInteractionController queue](self, "queue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addOperation:", v10);

  -[FMServerInteractionController networkActivityStatus:](self, "networkActivityStatus:", 1);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __68__FMServerInteractionController_processResponseForCommand_callback___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained[2], "removeObject:", *(_QWORD *)(a1 + 32));
  if (!objc_msgSend(WeakRetained[2], "count"))
    objc_msgSend(WeakRetained, "networkActivityStatus:", 0);

}

void __61__FMServerInteractionController_sendCommand_completionBlock___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained[2], "addObject:", *(_QWORD *)(a1 + 32));

}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (double)_simulatedLatency
{
  if (_simulatedLatency_onceToken != -1)
    dispatch_once(&_simulatedLatency_onceToken, &__block_literal_global_6);
  return *(double *)&_simulatedLatency_retValue;
}

- (void)dealloc
{
  NSObject *dq_inFlightCommands;
  objc_super v4;
  _QWORD block[5];

  dq_inFlightCommands = self->dq_inFlightCommands;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__FMServerInteractionController_dealloc__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = self;
  dispatch_sync(dq_inFlightCommands, block);
  v4.receiver = self;
  v4.super_class = (Class)FMServerInteractionController;
  -[FMServerInteractionController dealloc](&v4, sel_dealloc);
}

void __40__FMServerInteractionController_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;

}

- (FMServerInteractionController)init
{
  FMServerInteractionController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *dq_inFlightCommands;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)FMServerInteractionController;
  v2 = -[FMServerInteractionController init](&v18, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = dispatch_queue_create("com.apple.icloud.iscommon.FMServerInteractionController", 0);
    dq_inFlightCommands = v2->dq_inFlightCommands;
    v2->dq_inFlightCommands = (OS_dispatch_queue *)v3;

    v5 = v2->dq_inFlightCommands;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __37__FMServerInteractionController_init__block_invoke;
    v15 = &unk_1E82AA508;
    objc_copyWeak(&v16, &location);
    dispatch_sync(v5, &v12);
    v6 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    -[FMServerInteractionController setQueue:](v2, "setQueue:", v6, v12, v13, v14, v15);

    v7 = (void *)MEMORY[0x1E0CB39F0];
    -[FMServerInteractionController sessionConfiguration](v2, "sessionConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMServerInteractionController queue](v2, "queue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sessionWithConfiguration:delegate:delegateQueue:", v8, v2, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMServerInteractionController setSession:](v2, "setSession:", v10);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __37__FMServerInteractionController_init__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v2 = (void *)WeakRetained[2];
  WeakRetained[2] = v1;

}

void __50__FMServerInteractionController__simulatedLatency__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("FMSimulateLatency"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v1 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v1 = v3;
    _simulatedLatency_retValue = v2;
  }

}

- (NSURLSessionConfiguration)sessionConfiguration
{
  NSURLSessionConfiguration *sessionConfiguration;
  void *v4;
  void *v5;
  void *v6;
  NSURLSessionConfiguration *v7;
  NSURLSessionConfiguration *v8;

  sessionConfiguration = self->_sessionConfiguration;
  if (!sessionConfiguration)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00140]), "initWithIdentifier:", v5);
    objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
    v7 = (NSURLSessionConfiguration *)objc_claimAutoreleasedReturnValue();
    v8 = self->_sessionConfiguration;
    self->_sessionConfiguration = v7;

    -[NSURLSessionConfiguration set_appleIDContext:](self->_sessionConfiguration, "set_appleIDContext:", v6);
    sessionConfiguration = self->_sessionConfiguration;
  }
  return sessionConfiguration;
}

void __61__FMServerInteractionController_sendCommand_completionBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v2, "processResponseForCommand:callback:", WeakRetained, *(_QWORD *)(a1 + 40));

}

- (void)cancelCommand:(id)a3
{
  objc_msgSend(a3, "cancel");
}

- (void)cancelAllCommands
{
  NSObject *dq_inFlightCommands;
  _QWORD block[5];
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  id location;

  objc_initWeak(&location, self);
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  dq_inFlightCommands = self->dq_inFlightCommands;
  block[2] = __50__FMServerInteractionController_cancelAllCommands__block_invoke;
  block[3] = &unk_1E82AAB50;
  block[1] = 3221225472;
  objc_copyWeak(&v5, &location);
  block[4] = &v6;
  dispatch_sync(dq_inFlightCommands, block);
  objc_msgSend((id)v7[5], "enumerateObjectsWithOptions:usingBlock:", 1, &__block_literal_global_12);
  objc_destroyWeak(&v5);
  _Block_object_dispose(&v6, 8);

  objc_destroyWeak(&location);
}

void __50__FMServerInteractionController_cancelAllCommands__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained[2], "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(WeakRetained[2], "removeAllObjects");
}

uint64_t __50__FMServerInteractionController_cancelAllCommands__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancel");
}

- (void)invalidate
{
  void *v3;

  -[FMServerInteractionController session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateAndCancel");

  -[FMServerInteractionController setSession:](self, "setSession:", 0);
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  LogCategory_Networking();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1C9967000, v7, OS_LOG_TYPE_DEFAULT, "session: [%@] didBecomeInvalidWithError: [%@]", (uint8_t *)&v8, 0x16u);
  }

}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void)setSessionConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_sessionConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->inFlightCommands, 0);
  objc_storeStrong((id *)&self->dq_inFlightCommands, 0);
}

@end

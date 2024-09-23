@implementation _MXExtensionService

+ (id)extensionCompletionQueue
{
  if (_MergedGlobals_139 != -1)
    dispatch_once(&_MergedGlobals_139, &__block_literal_global_30);
  return (id)qword_1ECE2D960;
}

- (_MXExtensionService)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("_MXExtensionServiceNotAvailableException"), CFSTR("This method is unavailable."));

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_state == 2)
    -[NSExtension cancelExtensionRequestWithIdentifier:](self->_realExtension, "cancelExtensionRequestWithIdentifier:", self->_connectionIdentifier);
  v3.receiver = self;
  v3.super_class = (Class)_MXExtensionService;
  -[_MXExtensionService dealloc](&v3, sel_dealloc);
}

- (_MXExtensionService)initWithExtensionProxy:(id)a3
{
  id v5;
  _MXExtensionService *v6;
  _MXExtensionService *v7;
  _MXSerialQueue *v8;
  _MXSerialQueue *serialQueue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_MXExtensionService;
  v6 = -[_MXExtensionService init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extensionProxy, a3);
    v8 = objc_alloc_init(_MXSerialQueue);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = v8;

  }
  return v7;
}

- (void)setURLHandlingDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_URLHandlingDelegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_URLHandlingDelegate, obj);
    v6 = -[_MXExtensionService state](self, "state");
    v5 = obj;
    if (v6 == 2)
    {
      -[_MXExtensionService realExtension](self, "realExtension");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MXExtensionService connectionIdentifier](self, "connectionIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_extensionContextForUUID:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EDFEE4B0))
        objc_msgSend(v9, "setURLHandlingDelegate:", obj);

      v5 = obj;
    }
  }

}

- (void)setConnectionIdentifier:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *connectionIdentifier;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[NSUUID isEqual:](self->_connectionIdentifier, "isEqual:", v4) & 1) == 0)
  {
    v7[0] = 0;
    v7[1] = 0;
    objc_msgSend(v4, "getUUIDBytes:", v7);
    v5 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v7);
    connectionIdentifier = self->_connectionIdentifier;
    self->_connectionIdentifier = v5;

  }
}

- (void)connectExtensionWithHandler:(id)a3
{
  -[_MXExtensionService connectExtensionWithRemoteViewControllerNeeded:Handler:](self, "connectExtensionWithRemoteViewControllerNeeded:Handler:", 0, a3);
}

- (void)connectUIExtensionWithHandler:(id)a3
{
  -[_MXExtensionService connectExtensionWithRemoteViewControllerNeeded:Handler:](self, "connectExtensionWithRemoteViewControllerNeeded:Handler:", 1, a3);
}

- (void)connectExtensionWithRemoteViewControllerNeeded:(BOOL)a3 Handler:(id)a4
{
  id v6;
  _MXSerialQueue *serialQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  BOOL v12;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78___MXExtensionService_connectExtensionWithRemoteViewControllerNeeded_Handler___block_invoke;
  v9[3] = &unk_1E20D9A08;
  objc_copyWeak(&v11, &location);
  v8 = v6;
  v10 = v8;
  v12 = a3;
  -[_MXSerialQueue addTask:](serialQueue, "addTask:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)_connectExtensionWithRemoteViewControllerNeeded:(BOOL)a3 Handler:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, _MXExtensionService *, NSExtension *);
  unint64_t v7;
  NSExtension *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(id, _MXExtensionService *, NSExtension *);
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  void (**v16)(id, _MXExtensionService *, NSExtension *);
  _QWORD v17[5];
  void (**v18)(id, _MXExtensionService *, NSExtension *);

  v4 = a3;
  v6 = (void (**)(id, _MXExtensionService *, NSExtension *))a4;
  v7 = -[_MXExtensionService state](self, "state");
  if (v7)
  {
    if (v7 != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_MXExtensionServiceErrorDomain"), 16, 0);
      v8 = (NSExtension *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, self, v8);
      goto LABEL_18;
    }
    -[_MXExtension extension](self->_extensionProxy, "extension");
    v8 = (NSExtension *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[_MXExtensionService remoteViewController](self, "remoteViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "_errorWithExtensionServiceError:", 17);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
    }
    if (v8 == self->_realExtension)
    {
      v6[2](v6, self, 0);
      goto LABEL_18;
    }

  }
  -[_MXExtensionService extensionProxy](self, "extensionProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "extension");
  v8 = (NSExtension *)objc_claimAutoreleasedReturnValue();

  if ((-[NSExtension optedIn](v8, "optedIn") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_MXExtensionServiceErrorDomain"), 5, 0);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v14 = (void *)v13;
    v6[2](v6, self, (NSExtension *)v13);

    goto LABEL_18;
  }
  -[_MXExtensionService setState:](self, "setState:", 1);
  -[_MXExtensionService setRealExtension:](self, "setRealExtension:", v8);
  -[_MXExtensionService realExtension](self, "realExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __79___MXExtensionService__connectExtensionWithRemoteViewControllerNeeded_Handler___block_invoke_2;
    v15[3] = &unk_1E20D9A58;
    v15[4] = self;
    v16 = v6;
    objc_msgSend(v11, "instantiateViewControllerWithInputItems:connectionHandler:", 0, v15);

    v12 = v16;
  }
  else
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __79___MXExtensionService__connectExtensionWithRemoteViewControllerNeeded_Handler___block_invoke;
    v17[3] = &unk_1E20D9A30;
    v17[4] = self;
    v18 = v6;
    objc_msgSend(v11, "beginExtensionRequestWithInputItems:completion:", 0, v17);

    v12 = v18;
  }

LABEL_18:
}

- (void)disconnectExtension
{
  _MXSerialQueue *serialQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42___MXExtensionService_disconnectExtension__block_invoke;
  v4[3] = &unk_1E20D9A80;
  objc_copyWeak(&v5, &location);
  -[_MXSerialQueue addTask:](serialQueue, "addTask:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)handleRequest:(id)a3 requestDispatcher:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _MXExtensionRequestReceipt *v17;
  id v18;
  _MXExtensionRequestReceipt *v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__9;
  v30[4] = __Block_byref_object_dispose__9;
  v31 = (id)MEMORY[0x18D778DB8]();
  objc_msgSend((id)objc_opt_class(), "extensionCompletionQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __66___MXExtensionService_handleRequest_requestDispatcher_completion___block_invoke;
  v27[3] = &unk_1E20D9AD0;
  v13 = v11;
  v28 = v13;
  v29 = v30;
  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __66___MXExtensionService_handleRequest_requestDispatcher_completion___block_invoke_3;
  v23[3] = &unk_1E20D9B20;
  v14 = (id)MEMORY[0x18D778DB8](v27);
  v26 = v14;
  v15 = v8;
  v24 = v15;
  v16 = v9;
  v25 = v16;
  -[_MXExtensionService connectExtensionWithHandler:](self, "connectExtensionWithHandler:", v23);
  v17 = [_MXExtensionRequestReceipt alloc];
  v21[0] = v12;
  v21[1] = 3221225472;
  v21[2] = __66___MXExtensionService_handleRequest_requestDispatcher_completion___block_invoke_5;
  v21[3] = &unk_1E20D7EF8;
  v18 = v14;
  v22 = v18;
  v19 = -[_MXExtensionRequestReceipt initWithCompletion:](v17, "initWithCompletion:", v21);

  _Block_object_dispose(v30, 8);
  return v19;
}

- (id)startSendingUpdatesForRequest:(id)a3 requestDispatcher:(id)a4 toObserver:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _MXExtensionRequestReceipt *v20;
  id v21;
  _MXExtensionRequestReceipt *v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD *v28;
  _QWORD v29[4];
  id v30;
  _MXExtensionService *v31;
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __82___MXExtensionService_startSendingUpdatesForRequest_requestDispatcher_toObserver___block_invoke;
  v36[3] = &unk_1E20D9B70;
  v12 = v10;
  v37 = v12;
  v13 = v8;
  v38 = v13;
  v14 = v9;
  v39 = v14;
  -[_MXExtensionService connectExtensionWithHandler:](self, "connectExtensionWithHandler:", v36);
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__9;
  v34[4] = __Block_byref_object_dispose__9;
  v29[0] = v11;
  v29[1] = 3221225472;
  v29[2] = __82___MXExtensionService_startSendingUpdatesForRequest_requestDispatcher_toObserver___block_invoke_3;
  v29[3] = &unk_1E20D9B98;
  v15 = v12;
  v30 = v15;
  v31 = self;
  v16 = v13;
  v32 = v16;
  v17 = v14;
  v33 = v17;
  v35 = (id)MEMORY[0x18D778DB8](v29);
  objc_msgSend((id)objc_opt_class(), "extensionCompletionQueue");
  v26[0] = v11;
  v26[1] = 3221225472;
  v26[2] = __82___MXExtensionService_startSendingUpdatesForRequest_requestDispatcher_toObserver___block_invoke_4;
  v26[3] = &unk_1E20D7F20;
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v27 = v18;
  v28 = v34;
  v19 = (void *)MEMORY[0x18D778DB8](v26);
  v20 = [_MXExtensionRequestReceipt alloc];
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = __82___MXExtensionService_startSendingUpdatesForRequest_requestDispatcher_toObserver___block_invoke_6;
  v24[3] = &unk_1E20D7EF8;
  v21 = v19;
  v25 = v21;
  v22 = -[_MXExtensionRequestReceipt initWithCompletion:](v20, "initWithCompletion:", v24);

  _Block_object_dispose(v34, 8);
  return v22;
}

- (void)stopSendingUpdatesForRequest:(id)a3 requestDispatcher:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70___MXExtensionService_stopSendingUpdatesForRequest_requestDispatcher___block_invoke;
  v10[3] = &unk_1E20D9BC0;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[_MXExtensionService connectExtensionWithHandler:](self, "connectExtensionWithHandler:", v10);

}

- (id)vendorContextWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  if (-[_MXExtensionService state](self, "state") == 2)
  {
    -[_MXExtensionService realExtension](self, "realExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MXExtensionService connectionIdentifier](self, "connectionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53___MXExtensionService_vendorContextWithErrorHandler___block_invoke;
    v10[3] = &unk_1E20D9BE8;
    v10[4] = self;
    v11 = v4;
    objc_msgSend(v5, "_extensionVendorContextForUUID:withErrorHandler:", v6, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "_errorWithExtensionServiceError:", 18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v8);

    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSExtension identifier](self->_realExtension, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<_MXExtensionService:%p extension=%@ connectionIdentiifer=%@>"), self, v4, self->_connectionIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int)processIdentifier
{
  void *v3;
  int v4;

  if (-[_MXExtensionService state](self, "state") != 2 || !self->_connectionIdentifier)
    return 0;
  -[_MXExtensionService realExtension](self, "realExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pidForRequestIdentifier:", self->_connectionIdentifier);

  return v4;
}

- (NSUUID)connectionIdentifier
{
  return self->_connectionIdentifier;
}

- (NSExtension)realExtension
{
  return self->_realExtension;
}

- (void)setRealExtension:(id)a3
{
  objc_storeStrong((id *)&self->_realExtension, a3);
}

- (_MXExtension)extensionProxy
{
  return self->_extensionProxy;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (_MXExtensionURLHandling)URLHandlingDelegate
{
  return (_MXExtensionURLHandling *)objc_loadWeakRetained((id *)&self->_URLHandlingDelegate);
}

- (UIViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_destroyWeak((id *)&self->_URLHandlingDelegate);
  objc_storeStrong((id *)&self->_extensionProxy, 0);
  objc_storeStrong((id *)&self->_realExtension, 0);
  objc_storeStrong((id *)&self->_connectionIdentifier, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (id)context
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_MXExtensionService extensionProxy](self, "extensionProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MXExtensionService connectionIdentifier](self, "connectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_extensionContextForUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSUUID)serviceIdentifier
{
  void *v2;
  void *v3;

  -[_MXExtensionService connectionIdentifier](self, "connectionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSUUID *)v3;
}

- (id)resolveIntentSlot:(id)a3 forIntent:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  _MXExtensionRequestReceipt *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  _MXExtensionRequestReceipt *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD *v28;
  _QWORD v29[5];
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  -[_MXExtensionService _errorForIntent:](self, "_errorForIntent:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v10[2](v10, 0, v11);
    v12 = 0;
  }
  else
  {
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = __Block_byref_object_copy__17;
    v29[4] = __Block_byref_object_dispose__17;
    v30 = (id)MEMORY[0x18D778DB8](v10);
    objc_msgSend((id)objc_opt_class(), "extensionCompletionQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __77___MXExtensionService_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke;
    v26[3] = &unk_1E20DBC88;
    v15 = v13;
    v27 = v15;
    v28 = v29;
    v22[0] = v14;
    v22[1] = 3221225472;
    v22[2] = __77___MXExtensionService_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke_3;
    v22[3] = &unk_1E20D9B20;
    v16 = (id)MEMORY[0x18D778DB8](v26);
    v25 = v16;
    v23 = v9;
    v24 = v8;
    -[_MXExtensionService connectExtensionWithHandler:](self, "connectExtensionWithHandler:", v22);
    v17 = [_MXExtensionRequestReceipt alloc];
    v20[0] = v14;
    v20[1] = 3221225472;
    v20[2] = __77___MXExtensionService_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke_7;
    v20[3] = &unk_1E20D7EF8;
    v18 = v16;
    v21 = v18;
    v12 = -[_MXExtensionRequestReceipt initWithCompletion:](v17, "initWithCompletion:", v20);

    _Block_object_dispose(v29, 8);
  }

  return v12;
}

- (id)confirmIntent:(id)a3 expectResponseClass:(Class)a4 withCompletion:(id)a5
{
  return -[_MXExtensionService _handleOrConfirmIntent:expectResponseClass:isHandle:withCompletion:](self, "_handleOrConfirmIntent:expectResponseClass:isHandle:withCompletion:", a3, a4, 0, a5);
}

- (id)handleIntent:(id)a3 expectResponseClass:(Class)a4 withCompletion:(id)a5
{
  return -[_MXExtensionService _handleOrConfirmIntent:expectResponseClass:isHandle:withCompletion:](self, "_handleOrConfirmIntent:expectResponseClass:isHandle:withCompletion:", a3, a4, 1, a5);
}

- (id)_handleOrConfirmIntent:(id)a3 expectResponseClass:(Class)a4 isHandle:(BOOL)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  _MXExtensionRequestReceipt *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  _MXExtensionRequestReceipt *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  Class v26;
  BOOL v27;
  _QWORD v28[4];
  id v29;
  _QWORD *v30;
  _QWORD v31[5];
  id v32;

  v10 = a3;
  v11 = a6;
  -[_MXExtensionService _errorForIntent:](self, "_errorForIntent:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v11 + 2))(v11, 0, 0, 0, v12);
    v13 = 0;
  }
  else
  {
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x3032000000;
    v31[3] = __Block_byref_object_copy__17;
    v31[4] = __Block_byref_object_dispose__17;
    v32 = (id)MEMORY[0x18D778DB8](v11);
    objc_msgSend((id)objc_opt_class(), "extensionCompletionQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __100___MXExtensionService_INIntent___handleOrConfirmIntent_expectResponseClass_isHandle_withCompletion___block_invoke;
    v28[3] = &unk_1E20DBD00;
    v16 = v14;
    v29 = v16;
    v30 = v31;
    v23[0] = v15;
    v23[1] = 3221225472;
    v23[2] = __100___MXExtensionService_INIntent___handleOrConfirmIntent_expectResponseClass_isHandle_withCompletion___block_invoke_3;
    v23[3] = &unk_1E20DBD78;
    v17 = (id)MEMORY[0x18D778DB8](v28);
    v25 = v17;
    v26 = a4;
    v24 = v10;
    v27 = a5;
    -[_MXExtensionService connectExtensionWithHandler:](self, "connectExtensionWithHandler:", v23);
    v18 = [_MXExtensionRequestReceipt alloc];
    v21[0] = v15;
    v21[1] = 3221225472;
    v21[2] = __100___MXExtensionService_INIntent___handleOrConfirmIntent_expectResponseClass_isHandle_withCompletion___block_invoke_7;
    v21[3] = &unk_1E20D7EF8;
    v19 = v17;
    v22 = v19;
    v13 = -[_MXExtensionRequestReceipt initWithCompletion:](v18, "initWithCompletion:", v21);

    _Block_object_dispose(v31, 8);
  }

  return v13;
}

- (void)completeTransactionWithIntentIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84___MXExtensionService_INIntent__completeTransactionWithIntentIdentifier_completion___block_invoke;
  v8[3] = &unk_1E20D7EF8;
  v9 = v6;
  v7 = v6;
  -[_MXExtensionService _completeOrCancelTransaction:withIntentIdentifier:completion:](self, "_completeOrCancelTransaction:withIntentIdentifier:completion:", 1, a3, v8);

}

- (void)cancelTransactionDueToTimeoutWithIntentIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94___MXExtensionService_INIntent__cancelTransactionDueToTimeoutWithIntentIdentifier_completion___block_invoke;
  v8[3] = &unk_1E20D7EF8;
  v9 = v6;
  v7 = v6;
  -[_MXExtensionService _completeOrCancelTransaction:withIntentIdentifier:completion:](self, "_completeOrCancelTransaction:withIntentIdentifier:completion:", 0, a3, v8);

}

- (void)_completeOrCancelTransaction:(BOOL)a3 withIntentIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  BOOL v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __94___MXExtensionService_INIntent___completeOrCancelTransaction_withIntentIdentifier_completion___block_invoke;
  v12[3] = &unk_1E20DBDA0;
  v15 = a3;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[_MXExtensionService connectExtensionWithHandler:](self, "connectExtensionWithHandler:", v12);

}

- (id)startSendingUpdatesForIntent:(id)a3 toObserver:(id)a4
{
  id v6;
  id v7;
  _MXIntentResponseObserverProxy *v8;
  void *v9;
  _MXExtensionRequestReceipt *v10;
  uint64_t v11;
  _MXIntentResponseObserverProxy *v12;
  id v13;
  _MXExtensionRequestReceipt *v14;
  _QWORD v16[4];
  _MXIntentResponseObserverProxy *v17;
  _MXExtensionService *v18;
  id v19;
  _QWORD v20[4];
  _MXIntentResponseObserverProxy *v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = -[_MXIntentResponseObserverProxy initWithObserver:]([_MXIntentResponseObserverProxy alloc], "initWithObserver:", v7);

  -[_MXExtensionService _errorForIntent:](self, "_errorForIntent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[_MXIntentResponseObserverProxy didReceiveError:](v8, "didReceiveError:", v9);
    v10 = 0;
  }
  else
  {
    v11 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __73___MXExtensionService_INIntent__startSendingUpdatesForIntent_toObserver___block_invoke;
    v20[3] = &unk_1E20D9BC0;
    v12 = v8;
    v21 = v12;
    v13 = v6;
    v22 = v13;
    -[_MXExtensionService connectExtensionWithHandler:](self, "connectExtensionWithHandler:", v20);
    v14 = [_MXExtensionRequestReceipt alloc];
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __73___MXExtensionService_INIntent__startSendingUpdatesForIntent_toObserver___block_invoke_3;
    v16[3] = &unk_1E20D7E80;
    v17 = v12;
    v18 = self;
    v19 = v13;
    v10 = -[_MXExtensionRequestReceipt initWithCompletion:](v14, "initWithCompletion:", v16);

  }
  return v10;
}

- (void)stopSendingUpdatesForIntent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[_MXExtensionService intentResponseObserverProxy](self, "intentResponseObserverProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopObserving");

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61___MXExtensionService_INIntent__stopSendingUpdatesForIntent___block_invoke;
  v7[3] = &unk_1E20DBE10;
  v8 = v4;
  v6 = v4;
  -[_MXExtensionService connectExtensionWithHandler:](self, "connectExtensionWithHandler:", v7);

}

- (void)setIntentResponseObserverProxy:(id)a3
{
  id v4;
  void *v5;
  id value;

  value = a3;
  -[_MXExtensionService intentResponseObserverProxy](self, "intentResponseObserverProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = value;
  if (v4 != value)
  {
    objc_setAssociatedObject(self, (const void *)kIntentResponseObserverProxyKey, value, (void *)1);
    v5 = value;
  }

}

- (id)intentResponseObserverProxy
{
  return objc_getAssociatedObject(self, (const void *)kIntentResponseObserverProxyKey);
}

- (id)_errorForIntent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[_MXExtensionService extensionProxy](self, "extensionProxy");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "extension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "_canSupportIntent:", v4);
  if ((v5 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_MXExtensionServiceErrorDomain"), 7, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_errorForIntentVendorContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE079A40) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "_errorWithExtensionServiceError:", 7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_errorForIntentResponse:(id)a3 withExpectResponseClass:(Class)a4
{
  void *v4;

  v4 = 0;
  if (a3 && a4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return 0;
    objc_msgSend(MEMORY[0x1E0CB35C8], "_errorWithExtensionServiceError:", 9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)handleIntent:(id)a3 expectResponseClass:(Class)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __99___MXExtensionService_INIntent_willBeDepreicatedSoon__handleIntent_expectResponseClass_completion___block_invoke;
  v11[3] = &unk_1E20DBE38;
  v12 = v8;
  v9 = v8;
  v10 = -[_MXExtensionService handleIntent:expectResponseClass:withCompletion:](self, "handleIntent:expectResponseClass:withCompletion:", a3, a4, v11);

}

@end

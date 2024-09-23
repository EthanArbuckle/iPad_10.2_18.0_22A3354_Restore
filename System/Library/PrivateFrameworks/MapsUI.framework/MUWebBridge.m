@implementation MUWebBridge

- (MUWebBridge)initWithWebViewFactoryItem:(id)a3
{
  id v5;
  MUWebBridge *v6;
  MUWebBridge *v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *callHandlers;
  uint64_t v11;
  NSMutableDictionary *pendingCallbackHandlers;
  id defaultCallbackHandler;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MUWebBridge;
  v6 = -[MUWebBridge init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_webViewFactoryItem, a3);
    -[MUWebViewFactoryItem messageHandlerProxy](v7->_webViewFactoryItem, "messageHandlerProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTarget:", v7);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    callHandlers = v7->_callHandlers;
    v7->_callHandlers = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    pendingCallbackHandlers = v7->_pendingCallbackHandlers;
    v7->_pendingCallbackHandlers = (NSMutableDictionary *)v11;

    defaultCallbackHandler = v7->_defaultCallbackHandler;
    v7->_defaultCallbackHandler = &__block_literal_global_17;

  }
  return v7;
}

void __42__MUWebBridge_initWithWebViewFactoryItem___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    MUGetMUWebContentLog_1();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_191DB8000, v4, OS_LOG_TYPE_ERROR, "Bad message response: %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

+ (id)URLByAddingConfiguration:(id)a3 toURL:(id)a4 additionalQueryItems:(id)a5
{
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v7 = a5;
  v8 = (void *)MEMORY[0x1E0CB3998];
  v9 = a3;
  objc_msgSend(v8, "componentsWithURL:resolvingAgainstBaseURL:", a4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v10, "queryItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(v9, "bridgeVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "queryItemWithName:value:", CFSTR("bridgeVersion"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v16);

  v17 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend((id)objc_opt_class(), "_operatingSystemName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "queryItemWithName:value:", CFSTR("osName"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v19);

  v20 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend((id)objc_opt_class(), "_operatingSystemVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "queryItemWithName:value:", CFSTR("osVersion"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v22);

  if (objc_msgSend(v7, "count"))
    objc_msgSend(v13, "addObjectsFromArray:", v7);
  objc_msgSend(v10, "setQueryItems:", v13);
  objc_msgSend(v10, "URL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (void)_initializeConnection
{
  id v3;

  if (!self->_connectionState)
  {
    self->_connectionState = 1;
    -[MUWebBridge delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "webBridgeDidConnect:", self);

  }
}

- (void)closeConnection
{
  id v2;

  self->_connectionState = 2;
  -[MUWebViewFactoryItem messageHandlerProxy](self->_webViewFactoryItem, "messageHandlerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTarget:", 0);

}

- (void)callMethod:(id)a3 arguments:(id)a4 callbackHandler:(id)a5
{
  id v8;
  id v9;
  id defaultCallbackHandler;
  void *v11;
  int64_t nextCallNumber;
  void *v13;
  NSMutableDictionary *pendingCallbackHandlers;
  void *v15;
  MUWebMessage *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id location[2];

  v8 = a3;
  v9 = a4;
  defaultCallbackHandler = a5;
  v11 = defaultCallbackHandler;
  if (self->_connectionState == 1)
  {
    nextCallNumber = self->_nextCallNumber;
    self->_nextCallNumber = nextCallNumber + 1;
    if (nextCallNumber < 0)
    {
      MUGetMUWebContentLog_1();
      v16 = (MUWebMessage *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_191DB8000, &v16->super, OS_LOG_TYPE_ERROR, "Call limit exceeded", (uint8_t *)location, 2u);
      }
    }
    else
    {
      if (!defaultCallbackHandler)
        defaultCallbackHandler = self->_defaultCallbackHandler;
      v13 = _Block_copy(defaultCallbackHandler);
      pendingCallbackHandlers = self->_pendingCallbackHandlers;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", nextCallNumber);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](pendingCallbackHandlers, "setObject:forKeyedSubscript:", v13, v15);

      v16 = objc_alloc_init(MUWebMessage);
      -[MUWebMessage setType:](v16, "setType:", 0x1E2E14848);
      -[MUWebViewFactoryItem bridgeConfiguration](self->_webViewFactoryItem, "bridgeConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "nativeControllerName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUWebMessage setCaller:](v16, "setCaller:", v18);

      -[MUWebViewFactoryItem bridgeConfiguration](self->_webViewFactoryItem, "bridgeConfiguration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "webControllerName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUWebMessage setCallee:](v16, "setCallee:", v20);

      -[MUWebMessage setMethod:](v16, "setMethod:", v8);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", nextCallNumber);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUWebMessage setCallNumber:](v16, "setCallNumber:", v21);

      -[MUWebMessage setArguments:](v16, "setArguments:", v9);
      objc_initWeak(location, self);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __52__MUWebBridge_callMethod_arguments_callbackHandler___block_invoke;
      v22[3] = &unk_1E2E02940;
      objc_copyWeak(&v23, location);
      -[MUWebBridge _postMessage:completionHandler:](self, "_postMessage:completionHandler:", v16, v22);
      objc_destroyWeak(&v23);
      objc_destroyWeak(location);
    }

  }
}

void __52__MUWebBridge_callMethod_arguments_callbackHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *WeakRetained;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    MUGetMUWebContentLog_1();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_191DB8000, WeakRetained, OS_LOG_TYPE_ERROR, "Error evaluating JavaScript: %@", (uint8_t *)&v8, 0xCu);
    }
    goto LABEL_6;
  }
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    -[NSObject _receiveMessage:](WeakRetained, "_receiveMessage:", v5);
LABEL_6:

  }
}

- (void)addCallableMethod:(id)a3 handler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  v8 = (id)objc_msgSend(a4, "copy");
  v7 = _Block_copy(v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_callHandlers, "setObject:forKeyedSubscript:", v7, v6);

}

- (void)_receiveMessage:(id)a3
{
  id v4;
  MUWebMessage *v5;
  NSObject *p_super;
  void *v7;
  int v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = -[MUWebMessage initWithJSONObject:]([MUWebMessage alloc], "initWithJSONObject:", v4)) != 0)
  {
    p_super = &v5->super;
    -[MUWebMessage type](v5, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", 0x1E2E14848);

    if (v8)
    {
      -[MUWebBridge _dispatchCall:](self, "_dispatchCall:", p_super);
    }
    else
    {
      -[NSObject type](p_super, "type");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", 0x1E2E14868);

      if (v10)
      {
        -[MUWebBridge _dispatchCallback:](self, "_dispatchCallback:", p_super);
      }
      else
      {
        MUGetMUWebContentLog_1();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          -[NSObject type](p_super, "type");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 138412290;
          v14 = v12;
          _os_log_impl(&dword_191DB8000, v11, OS_LOG_TYPE_ERROR, "Unknown message type: %@", (uint8_t *)&v13, 0xCu);

        }
      }
    }
  }
  else
  {
    MUGetMUWebContentLog_1();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_191DB8000, p_super, OS_LOG_TYPE_ERROR, "Invalid message", (uint8_t *)&v13, 2u);
    }
  }

}

- (void)_postMessage:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD, id);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = (void (**)(id, _QWORD, id))a4;
  v7 = (void *)MEMORY[0x1E0CB36D8];
  objc_msgSend(a3, "JSONObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v7, "dataWithJSONObject:options:error:", v8, 0, &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v17;

  if (v9)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v9, 4);
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[MUWebViewFactoryItem bridgeConfiguration](self->_webViewFactoryItem, "bridgeConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "webControllerName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("window.%@.receiveMessage(%@)"), v14, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[MUWebViewFactoryItem webView](self->_webViewFactoryItem, "webView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "evaluateJavaScript:completionHandler:", v15, v6);

  }
  else
  {
    v6[2](v6, 0, v10);
  }

}

- (void)_dispatchCall:(id)a3
{
  id v4;
  void *v5;
  int64_t connectionState;
  void *v7;
  int v8;
  const __CFString *v9;
  void *v10;
  int v11;
  NSMutableDictionary *callHandlers;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v5, "setType:", 0x1E2E14868);
  connectionState = self->_connectionState;
  if (connectionState == 2)
  {
    objc_msgSend(v5, "setStatus:", 0x1E2E148A8);
    v9 = CFSTR("bridge closed");
    goto LABEL_13;
  }
  if (connectionState != 1)
  {
    if (connectionState)
    {
LABEL_14:
      -[MUWebBridge _postMessage:completionHandler:](self, "_postMessage:completionHandler:", v5, &__block_literal_global_33);
      goto LABEL_15;
    }
    objc_msgSend(v4, "method");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("init"));

    if (v8)
    {
      -[MUWebBridge _initializeConnection](self, "_initializeConnection");
      objc_msgSend(v5, "setStatus:", 0x1E2E14888);
      goto LABEL_14;
    }
    objc_msgSend(v5, "setStatus:", 0x1E2E148A8);
    v9 = CFSTR("bridge not initialized");
LABEL_13:
    objc_msgSend(v5, "setErrorMessage:", v9);
    goto LABEL_14;
  }
  objc_msgSend(v4, "method");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("init"));

  if (v11)
  {
    objc_msgSend(v5, "setStatus:", 0x1E2E148A8);
    v9 = CFSTR("bridge already initialized");
    goto LABEL_13;
  }
  callHandlers = self->_callHandlers;
  objc_msgSend(v4, "method");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](callHandlers, "objectForKeyedSubscript:", v13);
  v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(v5, "setStatus:", 0x1E2E148A8);
    v9 = CFSTR("method not supported");
    goto LABEL_13;
  }
  objc_initWeak(&location, self);
  objc_msgSend(v4, "arguments");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __29__MUWebBridge__dispatchCall___block_invoke;
  v16[3] = &unk_1E2E029A8;
  objc_copyWeak(&v18, &location);
  v17 = v5;
  ((void (**)(_QWORD, void *, _QWORD *))v14)[2](v14, v15, v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

LABEL_15:
}

void __29__MUWebBridge__dispatchCall___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "connectionState") == 1)
  {
    v8 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v8, "setStatus:", 0x1E2E148A8);
      objc_msgSend(*(id *)(a1 + 32), "setErrorMessage:", v5);
    }
    else
    {
      objc_msgSend(v8, "setStatus:", 0x1E2E14888);
      objc_msgSend(*(id *)(a1 + 32), "setResult:", v9);
    }
    objc_msgSend(v7, "_postMessage:completionHandler:", *(_QWORD *)(a1 + 32), &__block_literal_global_27);
  }

}

void __29__MUWebBridge__dispatchCall___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    MUGetMUWebContentLog_1();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_191DB8000, v4, OS_LOG_TYPE_ERROR, "Error evaluating JavaScript: %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

void __29__MUWebBridge__dispatchCall___block_invoke_32(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    MUGetMUWebContentLog_1();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_191DB8000, v4, OS_LOG_TYPE_ERROR, "Error evaluating JavaScript: %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)_dispatchCallback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MUWebBridge *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_connectionState == 1)
  {
    objc_msgSend(v4, "status");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", 0x1E2E14888))
    {
      objc_msgSend(v5, "callNumber");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "result");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = self;
      v10 = v7;
      v11 = v8;
      v12 = 0;
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", 0x1E2E148A8))
      {
        MUGetMUWebContentLog_1();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = 138412290;
          v15 = v5;
          _os_log_impl(&dword_191DB8000, v13, OS_LOG_TYPE_ERROR, "Unknown status in message: %@", (uint8_t *)&v14, 0xCu);
        }

        goto LABEL_10;
      }
      objc_msgSend(v5, "callNumber");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "errorMessage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = self;
      v10 = v7;
      v11 = 0;
      v12 = v8;
    }
    -[MUWebBridge _consumeCallbackHandlerWithNumber:result:errorMessage:](v9, "_consumeCallbackHandlerWithNumber:result:errorMessage:", v10, v11, v12);

LABEL_10:
  }

}

- (void)_consumeCallbackHandlerWithNumber:(id)a3 result:(id)a4 errorMessage:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingCallbackHandlers, "objectForKeyedSubscript:", v8);
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_pendingCallbackHandlers, "removeObjectForKey:", v8);
    ((void (**)(_QWORD, id, id))v11)[2](v11, v9, v10);
  }
  else
  {
    MUGetMUWebContentLog_1();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v8;
      _os_log_impl(&dword_191DB8000, v12, OS_LOG_TYPE_ERROR, "No matching callback handler found for callback %@", (uint8_t *)&v13, 0xCu);
    }

  }
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(v8, "frameInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMainFrame");

  if (v6)
  {
    objc_msgSend(v8, "body");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUWebBridge _receiveMessage:](self, "_receiveMessage:", v7);

  }
}

+ (id)_operatingSystemName
{
  return CFSTR("ios");
}

+ (id)_operatingSystemVersion
{
  void *v2;
  void *v3;
  __int128 v5;

  v5 = 0uLL;
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");
  else
    v5 = 0uLL;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d.%d.%d"), v5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)callHandlers
{
  return &self->_callHandlers->super;
}

- (MUWebViewFactoryItem)webViewFactoryItem
{
  return self->_webViewFactoryItem;
}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (MUWebBridgeDelegate)delegate
{
  return (MUWebBridgeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webViewFactoryItem, 0);
  objc_storeStrong((id *)&self->_callHandlers, 0);
  objc_storeStrong(&self->_defaultCallbackHandler, 0);
  objc_storeStrong((id *)&self->_pendingCallbackHandlers, 0);
}

@end

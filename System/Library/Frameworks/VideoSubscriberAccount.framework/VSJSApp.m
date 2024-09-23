@implementation VSJSApp

- (VSJSApp)initWithScriptURL:(id)a3
{
  id v5;
  VSJSApp *v6;
  VSJSApp *v7;
  VSJSApp *v8;
  VSSingleThreadDispatchQueue *v9;
  VSSingleThreadDispatchQueue *jsSingleThreadQueue;
  NSOperationQueue *v11;
  NSOperationQueue *privateQueue;
  NSOperationQueue *v13;
  objc_class *v14;
  void *v15;
  NSMutableArray *v16;
  NSMutableArray *scriptEvaluators;
  VSStateMachine *v18;
  VSStateMachine *stateMachine;
  objc_class *v20;
  void *v21;
  VSStateMachine *v22;
  VSStateMachine *v23;
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)VSJSApp;
  v6 = -[VSJSApp init](&v25, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v8 = v7;
    v9 = -[VSSingleThreadDispatchQueue initWithName:]([VSSingleThreadDispatchQueue alloc], "initWithName:", CFSTR("VSJSContext JS"));
    jsSingleThreadQueue = v8->_jsSingleThreadQueue;
    v8->_jsSingleThreadQueue = v9;

    v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    privateQueue = v8->_privateQueue;
    v8->_privateQueue = v11;

    v13 = v8->_privateQueue;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v13, "setName:", v15);

    v8->_state = 0;
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    scriptEvaluators = v8->_scriptEvaluators;
    v8->_scriptEvaluators = v16;

    v18 = objc_alloc_init(VSStateMachine);
    stateMachine = v8->_stateMachine;
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSStateMachine setName:](stateMachine, "setName:", v21);

    v22 = v8->_stateMachine;
    v8->_stateMachine = v18;
    v23 = v18;

    -[VSStateMachine setDelegate:](v23, "setDelegate:", v8);
    -[VSStateMachine setDestinationState:forEvent:inState:](v23, "setDestinationState:forEvent:inState:", CFSTR("Waiting For Boot URL"), CFSTR("Start"), CFSTR("Initial"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v23, "setDestinationState:forEvent:inState:", CFSTR("Stopped"), CFSTR("Stop"), CFSTR("Initial"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v23, "setDestinationState:forEvent:inState:", CFSTR("Waiting For Boot Script"), CFSTR("Fetched Boot URL"), CFSTR("Waiting For Boot URL"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v23, "setDestinationState:forEvent:inState:", CFSTR("Error"), CFSTR("Error"), CFSTR("Waiting For Boot URL"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v23, "setDestinationState:forEvent:inState:", CFSTR("Waiting For On Launch Callback"), CFSTR("Fetching Boot Script"), CFSTR("Waiting For Boot Script"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v23, "setDestinationState:forEvent:inState:", CFSTR("Error"), CFSTR("Error"), CFSTR("Waiting For Boot Script"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v23, "setDestinationState:forEvent:inState:", CFSTR("Ready"), CFSTR("Invoked OnLaunch Callback"), CFSTR("Waiting For On Launch Callback"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v23, "setDestinationState:forEvent:inState:", CFSTR("Error"), CFSTR("Error"), CFSTR("Waiting For On Launch Callback"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v23, "setDestinationState:forEvent:inState:", CFSTR("Error"), CFSTR("Timed Out"), CFSTR("Waiting For On Launch Callback"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v23, "setDestinationState:forEvent:inState:", CFSTR("Waiting For On Exit Callback"), CFSTR("Stop"), CFSTR("Ready"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v23, "setDestinationState:forEvent:inState:", CFSTR("Waiting For On Exit Callback"), CFSTR("Invoked OnExit"), CFSTR("Ready"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v23, "setDestinationState:forEvent:inState:", CFSTR("Stopped"), CFSTR("Received OnExit Callback"), CFSTR("Waiting For On Exit Callback"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v23, "setDestinationState:forEvent:inState:", CFSTR("Error"), CFSTR("Error"), CFSTR("Waiting For On Exit Callback"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v23, "setDestinationState:forEvent:inState:", CFSTR("Error"), CFSTR("Timed Out"), CFSTR("Waiting For On Exit Callback"));
    -[VSStateMachine activateWithState:](v23, "activateWithState:", CFSTR("Initial"));

  }
  return v7;
}

+ (id)currentContext
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  VSDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1D2419000, v2, OS_LOG_TYPE_DEFAULT, "currentContext thread=%@", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VSJSContextThread"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setExceptionWithMessage:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v9);

  -[VSJSApp context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBE108], "valueWithNewErrorFromMessage:inContext:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setException:", v8);

}

- (void)evaluateWithBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[VSJSApp jsSingleThreadQueue](self, "jsSingleThreadQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__VSJSApp_evaluateWithBlock___block_invoke;
  v7[3] = &unk_1E93A02A0;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "dispatchBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __29__VSJSApp_evaluateWithBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

- (void)evaluateScript:(id)a3 withSourceURL:(id)a4
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
  v10[2] = __40__VSJSApp_evaluateScript_withSourceURL___block_invoke;
  v10[3] = &unk_1E93A11F8;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[VSJSApp evaluateWithBlock:](self, "evaluateWithBlock:", v10);

}

void __40__VSJSApp_evaluateScript_withSourceURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  objc_msgSend(a2, "context");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "evaluateScript:withSourceURL:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)start
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[VSJSApp start]";
    _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  -[VSJSApp setState:](self, "setState:", 1);
  -[VSJSApp jsSingleThreadQueue](self, "jsSingleThreadQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __16__VSJSApp_start__block_invoke;
  v5[3] = &unk_1E93A1220;
  v5[4] = self;
  objc_msgSend(v4, "startWithCompletionHandler:", v5);

}

void __16__VSJSApp_start__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "underlyingThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("VSJSContextThread"));

  objc_msgSend(*(id *)(a1 + 32), "_initializeContext");
  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enqueueEvent:", CFSTR("Start"));

}

- (void)stop
{
  id v2;

  -[VSJSApp stateMachine](self, "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enqueueEvent:", CFSTR("Stop"));

}

- (void)_initializeContext
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[VSJSApp jsSingleThreadQueue](self, "jsSingleThreadQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__VSJSApp__initializeContext__block_invoke;
  v4[3] = &unk_1E939FD70;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "dispatchBlockSync:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __29__VSJSApp__initializeContext__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD aBlock[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CBE0F0]);
    objc_msgSend(WeakRetained, "setContext:", v2);
    objc_msgSend(WeakRetained, "jsSingleThreadQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_setDebuggerRunLoop:", objc_msgSend(v3, "underlyingRunLoop"));

    objc_msgSend(v2, "setExceptionHandler:", &__block_literal_global_54);
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("App"));
    objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("Error"));
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v5, "setObject:forKey:", &__block_literal_global_70_0, CFSTR("log"));
    objc_msgSend(v5, "setObject:forKey:", &__block_literal_global_72, CFSTR("error"));
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("console"));
    objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("XMLHttpRequest"));
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __29__VSJSApp__initializeContext__block_invoke_74;
    aBlock[3] = &unk_1E93A12C8;
    aBlock[4] = WeakRetained;
    v7 = _Block_copy(aBlock);
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("makeXMLHttpRequest"));

    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __29__VSJSApp__initializeContext__block_invoke_2_76;
    v10[3] = &unk_1E93A1318;
    v10[4] = WeakRetained;
    v8 = _Block_copy(v10);
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("evaluateScripts"));

    objc_msgSend(WeakRetained, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "app:prewarmWithContext:", WeakRetained, v2);

  }
}

void __29__VSJSApp__initializeContext__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __29__VSJSApp__initializeContext__block_invoke_2_cold_1();

}

void __29__VSJSApp__initializeContext__block_invoke_68(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "[JS][LOG] %@", (uint8_t *)&v4, 0xCu);
  }

}

void __29__VSJSApp__initializeContext__block_invoke_71(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  VSErrorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __29__VSJSApp__initializeContext__block_invoke_71_cold_1();

}

VSJSXMLHTTPRequest *__29__VSJSApp__initializeContext__block_invoke_74(uint64_t a1)
{
  return -[VSJSXMLHTTPRequest initWithContext:]([VSJSXMLHTTPRequest alloc], "initWithContext:", *(_QWORD *)(a1 + 32));
}

void __29__VSJSApp__initializeContext__block_invoke_2_76(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  VSJSAppScriptEvaluator *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  id location;

  v5 = a2;
  v6 = a3;
  v7 = -[VSJSAppScriptEvaluator initWithApp:urls:]([VSJSAppScriptEvaluator alloc], "initWithApp:urls:", *(_QWORD *)(a1 + 32), v5);
  objc_initWeak(&location, v7);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __29__VSJSApp__initializeContext__block_invoke_3;
  v15 = &unk_1E93A12F0;
  v8 = v6;
  v9 = *(_QWORD *)(a1 + 32);
  v16 = v8;
  v17 = v9;
  objc_copyWeak(&v18, &location);
  -[VSJSAppScriptEvaluator setCompletionBlock:](v7, "setCompletionBlock:", &v12);
  -[VSJSAppScriptEvaluator start](v7, "start", v12, v13, v14, v15);
  v10 = *(id *)(a1 + 32);
  objc_sync_enter(v10);
  objc_msgSend(*(id *)(a1 + 32), "scriptEvaluators");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v7);

  objc_sync_exit(v10);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

void __29__VSJSApp__initializeContext__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id WeakRetained;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v18;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v6), "loaded", (_QWORD)v17))
        {
          v7 = 0;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  v8 = *(void **)(a1 + 32);
  v9 = (void *)MEMORY[0x1E0CBE108];
  objc_msgSend(*(id *)(a1 + 40), "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueWithBool:inContext:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v8, "callWithArguments:", v12);

  v14 = *(id *)(a1 + 40);
  objc_sync_enter(v14);
  objc_msgSend(*(id *)(a1 + 40), "scriptEvaluators");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v15, "removeObject:", WeakRetained);

  objc_sync_exit(v14);
}

- (void)_invokeOnLaunch
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[VSJSApp _invokeOnLaunch]";
    _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[VSJSApp url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  if (v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [[self url] absoluteString] parameter must not be nil."));
  -[VSJSApp url](self, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("location"));
  objc_initWeak((id *)buf, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __26__VSJSApp__invokeOnLaunch__block_invoke;
  v11[3] = &unk_1E93A1368;
  objc_copyWeak(&v13, (id *)buf);
  v10 = v4;
  v12 = v10;
  -[VSJSApp evaluateWithBlock:](self, "evaluateWithBlock:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

}

void __26__VSJSApp__invokeOnLaunch__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD block[5];
  id v20;
  _QWORD aBlock[5];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = MEMORY[0x1E0C809B0];
    v7 = (void *)MEMORY[0x1E0CBE108];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __26__VSJSApp__invokeOnLaunch__block_invoke_2;
    aBlock[3] = &unk_1E93A1340;
    aBlock[4] = WeakRetained;
    v8 = _Block_copy(aBlock);
    objc_msgSend(v3, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueWithObject:inContext:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v10, CFSTR("callback"));
    objc_msgSend(v5, "_configureWatchdogWithSeconds:", 20);
    objc_msgSend(v3, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("App"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v22[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v12, "invokeMethod:withArguments:", CFSTR("onLaunch"), v13);

    objc_msgSend(v3, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "exception");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v5, "_exceptionErrorWithCode:", 0);
      block[0] = v6;
      block[1] = 3221225472;
      block[2] = __26__VSJSApp__invokeOnLaunch__block_invoke_87;
      block[3] = &unk_1E939F138;
      block[4] = v5;
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v17 = v20;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      objc_msgSend(v5, "stateMachine");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "enqueueEvent:", CFSTR("Error"));

    }
  }

}

void __26__VSJSApp__invokeOnLaunch__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v5 = a3;
  v6 = a2;
  VSDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1D2419000, v7, OS_LOG_TYPE_DEFAULT, "onLaunch callback invoked", v12, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_configureWatchdogWithSeconds:", 0);
  v8 = objc_msgSend(v6, "toBool");

  if ((v8 & 1) == 0)
  {
    VSErrorLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __26__VSJSApp__invokeOnLaunch__block_invoke_2_cold_1(v5, v9);

    objc_msgSend(*(id *)(a1 + 32), "stateMachine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "enqueueEvent:", CFSTR("Error"));

  }
  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enqueueEvent:", CFSTR("Invoked OnLaunch Callback"));

}

void __26__VSJSApp__invokeOnLaunch__block_invoke_87(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "app:didFailToStartWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_invokeOnExit
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __24__VSJSApp__invokeOnExit__block_invoke;
  v3[3] = &unk_1E93A0CC0;
  objc_copyWeak(&v4, &location);
  -[VSJSApp evaluateWithBlock:](self, "evaluateWithBlock:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __24__VSJSApp__invokeOnExit__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD aBlock[5];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)MEMORY[0x1E0CBE108];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __24__VSJSApp__invokeOnExit__block_invoke_2;
    aBlock[3] = &unk_1E939EE88;
    aBlock[4] = WeakRetained;
    v7 = _Block_copy(aBlock);
    objc_msgSend(v3, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueWithObject:inContext:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "_configureWatchdogWithSeconds:", 10);
    objc_msgSend(v3, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("App"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v11, "invokeMethod:withArguments:", CFSTR("onExit"), v12);

  }
}

void __24__VSJSApp__invokeOnExit__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  VSDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D2419000, v2, OS_LOG_TYPE_DEFAULT, "onExit callback invoked", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_configureWatchdogWithSeconds:", 0);
  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enqueueEvent:", CFSTR("Received OnExit Callback"));

}

- (void)_configureWatchdogWithSeconds:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;
  _QWORD handler[4];
  id v13;
  uint8_t buf[4];
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[VSJSApp watchdog](self, "watchdog");
  v5 = objc_claimAutoreleasedReturnValue();
  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v7)
    {
      *(_DWORD *)buf = 134217984;
      v15 = a3;
      _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Configuring watchdog timer for %lu seconds", buf, 0xCu);
    }

    if (v5)
    {
      dispatch_source_cancel(v5);
      -[VSJSApp setWatchdog:](self, "setWatchdog:", 0);
    }
    -[VSJSApp privateQueue](self, "privateQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "underlyingQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v9);

    v11 = dispatch_time(0, 1000000000 * a3);
    dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak((id *)buf, self);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __41__VSJSApp__configureWatchdogWithSeconds___block_invoke;
    handler[3] = &unk_1E939FD70;
    objc_copyWeak(&v13, (id *)buf);
    dispatch_source_set_event_handler(v10, handler);
    -[VSJSApp setWatchdog:](self, "setWatchdog:", v10);
    dispatch_activate(v10);
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
    goto LABEL_11;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Cancelling watchdog timer", buf, 2u);
  }

  if (v5)
  {
    dispatch_source_cancel(v5);
    -[VSJSApp setWatchdog:](self, "setWatchdog:", 0);
    v10 = v5;
LABEL_11:

  }
}

void __41__VSJSApp__configureWatchdogWithSeconds___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint8_t v6[16];

  VSDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D2419000, v2, OS_LOG_TYPE_DEFAULT, "Watchdog timer fired.", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "stateMachine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enqueueEvent:", CFSTR("Timed Out"));

  }
}

- (void)transitionToWaitingForBootUrlState
{
  NSObject *v3;
  VSApplicationBootURLOperation *v4;
  void *v5;
  VSApplicationBootURLOperation *v6;
  void *v7;
  VSApplicationBootURLOperation *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  VSApplicationBootURLOperation *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[VSJSApp transitionToWaitingForBootUrlState]";
    _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  v4 = [VSApplicationBootURLOperation alloc];
  -[VSJSApp url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VSApplicationBootURLOperation initWithBootURL:isDeveloper:](v4, "initWithBootURL:isDeveloper:", v5, 0);

  -[VSApplicationBootURLOperation setSkipSystemTrustVerification:](v6, "setSkipSystemTrustVerification:", -[VSJSApp enforceSystemTrust](self, "enforceSystemTrust") ^ 1);
  objc_initWeak((id *)buf, self);
  v7 = (void *)MEMORY[0x1E0CB34C8];
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __45__VSJSApp_transitionToWaitingForBootUrlState__block_invoke;
  v15 = &unk_1E93A13B8;
  objc_copyWeak(&v17, (id *)buf);
  v8 = v6;
  v16 = v8;
  objc_msgSend(v7, "blockOperationWithBlock:", &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addDependency:", v8, v12, v13, v14, v15);
  -[VSJSApp privateQueue](self, "privateQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addOperation:", v8);

  -[VSJSApp privateQueue](self, "privateQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addOperation:", v9);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

void __45__VSJSApp_transitionToWaitingForBootUrlState__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  _QWORD v4[5];
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "urlOrError");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __45__VSJSApp_transitionToWaitingForBootUrlState__block_invoke_2;
    v5[3] = &unk_1E93A1390;
    v5[4] = WeakRetained;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __45__VSJSApp_transitionToWaitingForBootUrlState__block_invoke_91;
    v4[3] = &unk_1E939ED90;
    v4[4] = WeakRetained;
    objc_msgSend(v2, "unwrapObject:error:", v5, v4);

  }
}

void __45__VSJSApp_transitionToWaitingForBootUrlState__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1D2419000, v4, OS_LOG_TYPE_DEFAULT, "Fetched final boot URL: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "setEffectiveURL:", v3);
  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enqueueEvent:", CFSTR("Fetched Boot URL"));

}

void __45__VSJSApp_transitionToWaitingForBootUrlState__block_invoke_91(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD block[5];
  id v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __45__VSJSApp_transitionToWaitingForBootUrlState__block_invoke_91_cold_1();

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = VSJSAppErrorDomain;
  v13 = *MEMORY[0x1E0CB3388];
  v14[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__VSJSApp_transitionToWaitingForBootUrlState__block_invoke_94;
  block[3] = &unk_1E939F138;
  block[4] = *(_QWORD *)(a1 + 32);
  v12 = v8;
  v9 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enqueueEvent:", CFSTR("Error"));

}

void __45__VSJSApp_transitionToWaitingForBootUrlState__block_invoke_94(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "app:didFailToStartWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)_errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v10 = *MEMORY[0x1E0CB3388];
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", VSJSAppErrorDomain, a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_exceptionErrorWithCode:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = VSJSAppErrorDomain;
  -[VSJSApp context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exception");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "toDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)transitionToWaitingForBootScriptState
{
  NSObject *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *, void *);
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[VSJSApp transitionToWaitingForBootScriptState]";
    _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  -[VSJSApp effectiveURL](self, "effectiveURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  if (v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [self effectiveURL] parameter must not be nil."));
  -[VSJSApp effectiveURL](self, "effectiveURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke;
  v14 = &unk_1E93A0C70;
  objc_copyWeak(&v16, (id *)buf);
  v9 = v6;
  v15 = v9;
  objc_msgSend(v8, "dataTaskWithURL:completionHandler:", v9, &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resume", v11, v12, v13, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

}

void __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id WeakRetained;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t);
  void *v42;
  id v43;
  void *v44;
  _QWORD block[5];
  void *v46;
  _QWORD v47[5];
  id v48;
  _QWORD v49[5];
  id v50;
  uint8_t buf[4];
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  VSDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v52 = v8;
    _os_log_impl(&dword_1D2419000, v10, OS_LOG_TYPE_DEFAULT, "Got response for boot script: %@", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v9)
    {
      VSErrorLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_cold_3();

      objc_msgSend(WeakRetained, "_errorWithCode:underlyingError:", 1, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = MEMORY[0x1E0C809B0];
      v40 = 3221225472;
      v41 = __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_106;
      v42 = &unk_1E939F138;
      v43 = WeakRetained;
      v44 = v13;
      v14 = v13;
      dispatch_async(MEMORY[0x1E0C80D38], &v39);
      objc_msgSend(WeakRetained, "stateMachine", v39, v40, v41, v42, v43);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "enqueueEvent:", CFSTR("Error"));

      v16 = v44;
    }
    else
    {
      if (v7)
      {
        v14 = v7;
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v14, 4);
        if (v17)
        {
          objc_msgSend(WeakRetained, "setScript:", v17);
          VSDefaultLogObject();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D2419000, v18, OS_LOG_TYPE_DEFAULT, "Will evaluate boot script", buf, 2u);
          }

          objc_msgSend(WeakRetained, "jsSingleThreadQueue");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v49[0] = MEMORY[0x1E0C809B0];
          v49[1] = 3221225472;
          v49[2] = __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_102;
          v49[3] = &unk_1E939F138;
          v49[4] = WeakRetained;
          v50 = v17;
          objc_msgSend(v19, "dispatchBlock:", v49);

        }
        else
        {
          VSErrorLogObject();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_cold_2(a1, v29, v30, v31, v32, v33, v34, v35);

          objc_msgSend(WeakRetained, "_errorWithCode:underlyingError:", 2, 0);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v47[0] = MEMORY[0x1E0C809B0];
          v47[1] = 3221225472;
          v47[2] = __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_104;
          v47[3] = &unk_1E939F138;
          v47[4] = WeakRetained;
          v48 = v36;
          v37 = v36;
          dispatch_async(MEMORY[0x1E0C80D38], v47);
          objc_msgSend(WeakRetained, "stateMachine");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "enqueueEvent:", CFSTR("Error"));

        }
        goto LABEL_21;
      }
      VSErrorLogObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_cold_1(a1, v20, v21, v22, v23, v24, v25, v26);

      objc_msgSend(WeakRetained, "_errorWithCode:underlyingError:", 2, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_105;
      block[3] = &unk_1E939F138;
      block[4] = WeakRetained;
      v46 = v27;
      v14 = v27;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      objc_msgSend(WeakRetained, "stateMachine");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "enqueueEvent:", CFSTR("Error"));

      v16 = v46;
    }

LABEL_21:
  }

}

void __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_102(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[16];

  VSDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2419000, v2, OS_LOG_TYPE_DEFAULT, "Evaluating boot script...", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "evaluateScript:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exception");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v7, "_exceptionErrorWithCode:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_103;
    v14 = &unk_1E939F138;
    v15 = *(_QWORD *)(a1 + 32);
    v16 = v8;
    v9 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], &v11);
    objc_msgSend(*(id *)(a1 + 32), "stateMachine", v11, v12, v13, v14, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "enqueueEvent:", CFSTR("Error"));

  }
  else
  {
    objc_msgSend(v7, "stateMachine");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "enqueueEvent:", CFSTR("Fetching Boot Script"));
  }

}

void __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_103(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "app:didFailToStartWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_104(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "app:didFailToStartWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_105(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "app:didFailToStartWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_106(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "app:didFailToStartWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)transitionToWaitingForOnLaunchCallbackState
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[VSJSApp transitionToWaitingForOnLaunchCallbackState]";
    _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v4, 0xCu);
  }

  -[VSJSApp _invokeOnLaunch](self, "_invokeOnLaunch");
}

- (void)transitionToWaitingForOnExitCallbackState
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[VSJSApp transitionToWaitingForOnExitCallbackState]";
    _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v4, 0xCu);
  }

  -[VSJSApp _invokeOnExit](self, "_invokeOnExit");
}

- (void)transitionToReadyState
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[VSJSApp transitionToReadyState]";
    _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__VSJSApp_transitionToReadyState__block_invoke;
  block[3] = &unk_1E939EE88;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __33__VSJSApp_transitionToReadyState__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appDidStart:", *(_QWORD *)(a1 + 32));

}

- (void)transitionToErrorState
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2419000, log, OS_LOG_TYPE_ERROR, "Application stopped in error state.", v1, 2u);
}

- (void)transitionToStoppedState
{
  void *v3;
  _QWORD block[5];

  -[VSJSApp jsSingleThreadQueue](self, "jsSingleThreadQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__VSJSApp_transitionToStoppedState__block_invoke;
  block[3] = &unk_1E939EE88;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __35__VSJSApp_transitionToStoppedState__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appDidStop:", *(_QWORD *)(a1 + 32));

}

- (JSContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (VSJSAppDelegate)delegate
{
  return (VSJSAppDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)enforceSystemTrust
{
  return self->_enforceSystemTrust;
}

- (void)setEnforceSystemTrust:(BOOL)a3
{
  self->_enforceSystemTrust = a3;
}

- (NSString)script
{
  return self->_script;
}

- (void)setScript:(id)a3
{
  objc_storeStrong((id *)&self->_script, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSURL)effectiveURL
{
  return self->_effectiveURL;
}

- (void)setEffectiveURL:(id)a3
{
  objc_storeStrong((id *)&self->_effectiveURL, a3);
}

- (VSSingleThreadDispatchQueue)jsSingleThreadQueue
{
  return self->_jsSingleThreadQueue;
}

- (void)setJsSingleThreadQueue:(id)a3
{
  objc_storeStrong((id *)&self->_jsSingleThreadQueue, a3);
}

- (VSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (OS_dispatch_source)watchdog
{
  return self->_watchdog;
}

- (void)setWatchdog:(id)a3
{
  objc_storeStrong((id *)&self->_watchdog, a3);
}

- (NSMutableArray)scriptEvaluators
{
  return self->_scriptEvaluators;
}

- (void)setScriptEvaluators:(id)a3
{
  objc_storeStrong((id *)&self->_scriptEvaluators, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scriptEvaluators, 0);
  objc_storeStrong((id *)&self->_watchdog, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_jsSingleThreadQueue, 0);
  objc_storeStrong((id *)&self->_effectiveURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_script, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
}

void __29__VSJSApp__initializeContext__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "[JS][Exception] %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __29__VSJSApp__initializeContext__block_invoke_71_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "[JS][ERROR LOG] %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __26__VSJSApp__invokeOnLaunch__block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1D2419000, a2, OS_LOG_TYPE_ERROR, "App indicated it is not ready to receive requests with error %@", v4, 0xCu);

}

void __45__VSJSApp_transitionToWaitingForBootUrlState__block_invoke_91_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error fetching boot URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "No JS returned for URL %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Unexpected encoding for JS returned with URL %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error fetching boot script: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end

@implementation VSUserAccountUpdateManager

- (VSUserAccountUpdateManager)initWithUserAccountUpdateRequests:(id)a3
{
  id v4;
  VSUserAccountUpdateManager *v5;
  uint64_t v6;
  NSMutableSet *updateRequests;
  NSMutableArray *v8;
  NSMutableArray *updatedUserAccounts;
  VSStateMachine *v10;
  VSStateMachine *stateMachine;
  VSStateMachine *v12;
  objc_class *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VSUserAccountUpdateManager;
  v5 = -[VSUserAccountUpdateManager init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    updateRequests = v5->_updateRequests;
    v5->_updateRequests = (NSMutableSet *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    updatedUserAccounts = v5->_updatedUserAccounts;
    v5->_updatedUserAccounts = v8;

    v10 = objc_alloc_init(VSStateMachine);
    stateMachine = v5->_stateMachine;
    v5->_stateMachine = v10;

    v12 = v5->_stateMachine;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSStateMachine setName:](v12, "setName:", v14);

    -[VSStateMachine setDelegate:](v5->_stateMachine, "setDelegate:", v5);
    -[VSStateMachine setDestinationState:forEvent:inState:](v5->_stateMachine, "setDestinationState:forEvent:inState:", CFSTR("Enqueuing Next User Account Set"), CFSTR("Start"), CFSTR("Initial"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v5->_stateMachine, "setDestinationState:forEvent:inState:", CFSTR("Done"), CFSTR("Done"), CFSTR("Initial"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v5->_stateMachine, "setDestinationState:forEvent:inState:", CFSTR("Booting App"), CFSTR("Done"), CFSTR("Enqueuing Next User Account Set"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v5->_stateMachine, "setDestinationState:forEvent:inState:", CFSTR("Notifying Finish"), CFSTR("Stop"), CFSTR("Enqueuing Next User Account Set"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v5->_stateMachine, "setDestinationState:forEvent:inState:", CFSTR("Waiting For App Boot"), CFSTR("Done"), CFSTR("Booting App"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v5->_stateMachine, "setDestinationState:forEvent:inState:", CFSTR("Notifying For User Account Set"), CFSTR("Error"), CFSTR("Booting App"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v5->_stateMachine, "setDestinationState:forEvent:inState:", CFSTR("Invoking On Request Callback"), CFSTR("Done"), CFSTR("Waiting For App Boot"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v5->_stateMachine, "setDestinationState:forEvent:inState:", CFSTR("Notifying For User Account Set"), CFSTR("Timeout"), CFSTR("Waiting For App Boot"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v5->_stateMachine, "setDestinationState:forEvent:inState:", CFSTR("Notifying For User Account Set"), CFSTR("Error"), CFSTR("Waiting For App Boot"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v5->_stateMachine, "setDestinationState:forEvent:inState:", CFSTR("Waiting For On Request Callback"), CFSTR("Done"), CFSTR("Invoking On Request Callback"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v5->_stateMachine, "setDestinationState:forEvent:inState:", CFSTR("Notifying For User Account Set"), CFSTR("Error"), CFSTR("Invoking On Request Callback"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v5->_stateMachine, "setDestinationState:forEvent:inState:", CFSTR("Stopping App"), CFSTR("Done"), CFSTR("Waiting For On Request Callback"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v5->_stateMachine, "setDestinationState:forEvent:inState:", CFSTR("Notifying For User Account Set"), CFSTR("Error"), CFSTR("Waiting For On Request Callback"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v5->_stateMachine, "setDestinationState:forEvent:inState:", CFSTR("Notifying For User Account Set"), CFSTR("Timeout"), CFSTR("Waiting For On Request Callback"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v5->_stateMachine, "setDestinationState:forEvent:inState:", CFSTR("Waiting for App Stop"), CFSTR("Done"), CFSTR("Stopping App"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v5->_stateMachine, "setDestinationState:forEvent:inState:", CFSTR("Notifying For User Account Set"), CFSTR("Done"), CFSTR("Waiting for App Stop"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v5->_stateMachine, "setDestinationState:forEvent:inState:", CFSTR("Notifying For User Account Set"), CFSTR("Timeout"), CFSTR("Waiting for App Stop"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v5->_stateMachine, "setDestinationState:forEvent:inState:", CFSTR("Enqueuing Next User Account Set"), CFSTR("Done"), CFSTR("Notifying For User Account Set"));
    -[VSStateMachine setDestinationState:forEvent:inState:](v5->_stateMachine, "setDestinationState:forEvent:inState:", CFSTR("Done"), CFSTR("Done"), CFSTR("Notifying Finish"));
    -[VSStateMachine activateWithState:](v5->_stateMachine, "activateWithState:", CFSTR("Initial"));
  }

  return v5;
}

- (void)updateUserAccounts
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  id v7;

  -[VSUserAccountUpdateManager updateRequests](self, "updateRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[VSUserAccountUpdateManager stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v4)
    v6 = CFSTR("Start");
  else
    v6 = CFSTR("Done");
  objc_msgSend(v5, "enqueueEvent:", v6);

}

- (id)_requestOptionsWithUserAccounts:(id)a3 callback:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("refreshAccounts"), CFSTR("requestType"));
  +[VSJSUserAccount jsUserAccountsFromUserAccounts:](VSJSUserAccount, "jsUserAccountsFromUserAccounts:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("currentUserAccounts"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("request"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("callback"));

  return v8;
}

- (void)_configureWatchdogWithSeconds:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  dispatch_time_t v9;
  _QWORD handler[4];
  id v11;
  uint8_t buf[4];
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[VSUserAccountUpdateManager watchdog](self, "watchdog");
  v5 = objc_claimAutoreleasedReturnValue();
  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v7)
    {
      *(_DWORD *)buf = 134217984;
      v13 = a3;
      _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Configuring watchdog timer for %lu seconds", buf, 0xCu);
    }

    if (v5)
    {
      dispatch_source_cancel(v5);
      -[VSUserAccountUpdateManager setWatchdog:](self, "setWatchdog:", 0);
    }
    v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);

    v9 = dispatch_time(0, 1000000000 * a3);
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak((id *)buf, self);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __60__VSUserAccountUpdateManager__configureWatchdogWithSeconds___block_invoke;
    handler[3] = &unk_1E939FD70;
    objc_copyWeak(&v11, (id *)buf);
    dispatch_source_set_event_handler(v8, handler);
    -[VSUserAccountUpdateManager setWatchdog:](self, "setWatchdog:", v8);
    dispatch_activate(v8);
    objc_destroyWeak(&v11);
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
    -[VSUserAccountUpdateManager setWatchdog:](self, "setWatchdog:", 0);
    v8 = v5;
LABEL_11:

  }
}

void __60__VSUserAccountUpdateManager__configureWatchdogWithSeconds___block_invoke(uint64_t a1)
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
    objc_msgSend(v5, "enqueueEvent:", CFSTR("Timeout"));

  }
}

- (void)transitionToEnqueuingNextUserAccountSetState
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[VSUserAccountUpdateManager setCurrentApp:](self, "setCurrentApp:", 0);
  -[VSUserAccountUpdateManager setCurrentUpdateRequest:](self, "setCurrentUpdateRequest:", 0);
  -[VSUserAccountUpdateManager updateRequests](self, "updateRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    VSDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Enqueuing update request: %@", (uint8_t *)&v11, 0xCu);
    }

    -[VSUserAccountUpdateManager updateRequests](self, "updateRequests");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v5);

    -[VSUserAccountUpdateManager setCurrentUpdateRequest:](self, "setCurrentUpdateRequest:", v5);
    -[VSUserAccountUpdateManager stateMachine](self, "stateMachine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("Done");
  }
  else
  {
    -[VSUserAccountUpdateManager stateMachine](self, "stateMachine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("Stop");
  }
  objc_msgSend(v8, "enqueueEvent:", v10);

}

- (void)transitionToBootingAppState
{
  void *v3;
  void *v4;
  VSJSApp *v5;
  void *v6;
  void *v7;
  id v8;

  -[VSUserAccountUpdateManager currentUpdateRequest](self, "currentUpdateRequest");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[VSJSApp initWithScriptURL:]([VSJSApp alloc], "initWithScriptURL:", v4);
  objc_msgSend(v8, "userAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSJSApp setEnforceSystemTrust:](v5, "setEnforceSystemTrust:", objc_msgSend(v6, "requiresSystemTrust"));

  -[VSUserAccountUpdateManager setCurrentApp:](self, "setCurrentApp:", v5);
  -[VSJSApp setDelegate:](v5, "setDelegate:", self);
  -[VSJSApp start](v5, "start");
  -[VSUserAccountUpdateManager stateMachine](self, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enqueueEvent:", CFSTR("Done"));

}

- (void)transitionToInvokingOnRequestCallbackState
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[VSUserAccountUpdateManager currentApp](self, "currentApp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__VSUserAccountUpdateManager_transitionToInvokingOnRequestCallbackState__block_invoke;
  v5[3] = &unk_1E939FDC0;
  v5[4] = self;
  objc_msgSend(v3, "evaluateWithBlock:", v5);

  -[VSUserAccountUpdateManager stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enqueueEvent:", CFSTR("Done"));

  -[VSUserAccountUpdateManager _configureWatchdogWithSeconds:](self, "_configureWatchdogWithSeconds:", 30);
}

void __72__VSUserAccountUpdateManager_transitionToInvokingOnRequestCallbackState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
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
  void *v14;
  void *v15;
  id v16;
  _QWORD aBlock[4];
  id v18;
  id location;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v4 = (void *)MEMORY[0x1E0CBE108];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__VSUserAccountUpdateManager_transitionToInvokingOnRequestCallbackState__block_invoke_2;
  aBlock[3] = &unk_1E939FD98;
  objc_copyWeak(&v18, &location);
  v5 = _Block_copy(aBlock);
  objc_msgSend(v3, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueWithObject:inContext:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "currentUpdateRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = v8 == 0;

  if ((_DWORD)v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [self currentUpdateRequest] parameter must not be nil."));
  objc_msgSend(*(id *)(a1 + 32), "currentUpdateRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_requestOptionsWithUserAccounts:callback:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("App"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  VSAssertWithMessage(v14 != 0, (uint64_t)CFSTR("App object undefined"));
  v20 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v14, "invokeMethod:withArguments:", CFSTR("onRequest"), v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __72__VSUserAccountUpdateManager_transitionToInvokingOnRequestCallbackState__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  NSObject *v16;
  _BOOL4 v17;
  int v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  VSDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412290;
    v19 = CFSTR("onRequest");
    _os_log_impl(&dword_1D2419000, v7, OS_LOG_TYPE_DEFAULT, "%@ callback invoked", (uint8_t *)&v18, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_configureWatchdogWithSeconds:", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!v5)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The responsePayloadOrNil parameter must not be nil."));
      objc_msgSend(v5, "userAccounts");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[VSJSUserAccount userAccountsFromJSUserAccounts:](VSJSUserAccount, "userAccountsFromJSUserAccounts:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "currentUpdateRequest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setUpdatedUserAccount:", v12);

      objc_msgSend(v9, "stateMachine");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "enqueueEvent:", CFSTR("Done"));

    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      VSErrorLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
      if ((isKindOfClass & 1) != 0)
      {
        if (v17)
          __72__VSUserAccountUpdateManager_transitionToInvokingOnRequestCallbackState__block_invoke_2_cold_1(v6, v16);
      }
      else
      {
        if (v17)
          __72__VSUserAccountUpdateManager_transitionToInvokingOnRequestCallbackState__block_invoke_2_cold_2(v16);

        objc_msgSend(v9, "currentApp");
        v16 = objc_claimAutoreleasedReturnValue();
        -[NSObject setExceptionWithMessage:](v16, "setExceptionWithMessage:", CFSTR("Must provide a valid ResponsePayload or Error object to onRequest callback."));
      }

      objc_msgSend(v9, "stateMachine");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "enqueueEvent:", CFSTR("Error"));
    }

  }
}

- (void)transitionToStoppingAppState
{
  void *v3;
  id v4;

  -[VSUserAccountUpdateManager currentApp](self, "currentApp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

  -[VSUserAccountUpdateManager stateMachine](self, "stateMachine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enqueueEvent:", CFSTR("Done"));

}

- (void)transitionToWaitingForAppStopState
{
  id v2;

  -[VSUserAccountUpdateManager stateMachine](self, "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enqueueEvent:", CFSTR("Done"));

}

- (void)transitionToNotifyingForUserAccountSetState
{
  void *v3;
  void *v4;
  id v5;

  -[VSUserAccountUpdateManager currentUpdateRequest](self, "currentUpdateRequest");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VSUserAccountUpdateManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateManager:updateRequestDidFinish:", self, v5);
  -[VSUserAccountUpdateManager stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enqueueEvent:", CFSTR("Done"));

}

- (void)transitionToNotifyingFinishState
{
  void *v3;
  id v4;

  -[VSUserAccountUpdateManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateManagerDidFinish:", self);

  -[VSUserAccountUpdateManager stateMachine](self, "stateMachine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enqueueEvent:", CFSTR("Done"));

}

- (void)app:(id)a3 prewarmWithContext:(id)a4
{
  id v4;

  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("App"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  VSAssertWithMessage(v4 != 0, (uint64_t)CFSTR("App object undefined"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("UserAccount"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("AppleSubscription"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("ResponsePayload"));

}

- (void)app:(id)a3 didFailToStartWithError:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a4;
  VSErrorLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[VSUserAccountUpdateManager app:didFailToStartWithError:].cold.1((uint64_t)v5, v6, v7);

  -[VSUserAccountUpdateManager currentUpdateRequest](self, "currentUpdateRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUpdateError:", v5);

  -[VSUserAccountUpdateManager stateMachine](self, "stateMachine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enqueueEvent:", CFSTR("Error"));

}

- (void)appDidStart:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D2419000, v4, OS_LOG_TYPE_DEFAULT, "JS app did finish starting.", v6, 2u);
  }

  -[VSUserAccountUpdateManager stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enqueueEvent:", CFSTR("Done"));

}

- (void)appDidStop:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D2419000, v4, OS_LOG_TYPE_DEFAULT, "JS app did stop.", v6, 2u);
  }

  -[VSUserAccountUpdateManager stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enqueueEvent:", CFSTR("Done"));

}

- (VSUserAccountUpdateManagerDelegate)delegate
{
  return (VSUserAccountUpdateManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableSet)updateRequests
{
  return self->_updateRequests;
}

- (void)setUpdateRequests:(id)a3
{
  objc_storeStrong((id *)&self->_updateRequests, a3);
}

- (NSMutableArray)updatedUserAccounts
{
  return self->_updatedUserAccounts;
}

- (void)setUpdatedUserAccounts:(id)a3
{
  objc_storeStrong((id *)&self->_updatedUserAccounts, a3);
}

- (VSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (VSJSApp)currentApp
{
  return self->_currentApp;
}

- (void)setCurrentApp:(id)a3
{
  objc_storeStrong((id *)&self->_currentApp, a3);
}

- (VSUserAccountUpdateRequest)currentUpdateRequest
{
  return self->_currentUpdateRequest;
}

- (void)setCurrentUpdateRequest:(id)a3
{
  objc_storeStrong((id *)&self->_currentUpdateRequest, a3);
}

- (OS_dispatch_source)watchdog
{
  return self->_watchdog;
}

- (void)setWatchdog:(id)a3
{
  objc_storeStrong((id *)&self->_watchdog, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdog, 0);
  objc_storeStrong((id *)&self->_currentUpdateRequest, 0);
  objc_storeStrong((id *)&self->_currentApp, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_updatedUserAccounts, 0);
  objc_storeStrong((id *)&self->_updateRequests, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __72__VSUserAccountUpdateManager_transitionToInvokingOnRequestCallbackState__block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1D2419000, a2, v4, "Error updating user account(s): %@", (uint8_t *)&v5);

}

void __72__VSUserAccountUpdateManager_transitionToInvokingOnRequestCallbackState__block_invoke_2_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2419000, log, OS_LOG_TYPE_ERROR, "JS application did not provide a valid ResponsePayload or Error object in onRequest callback.", v1, 2u);
}

- (void)app:(uint64_t)a3 didFailToStartWithError:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1D2419000, a2, a3, "JS app failed to start: %@", (uint8_t *)&v3);
}

@end

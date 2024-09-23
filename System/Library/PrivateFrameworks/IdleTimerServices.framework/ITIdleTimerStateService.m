@implementation ITIdleTimerStateService

- (BOOL)addIdleTimerConfiguration:(id)a3 fromProcess:(id)a4 forReason:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  BOOL v15;
  id WeakRetained;
  void *v17;
  objc_class *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  BSDispatchQueueAssert();
  -[ITIdleTimerStateService _identifierForClientProcess:](self, "_identifierForClientProcess:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_assertionReasonsByClientID, "objectForKeyedSubscript:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v12 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_assertionReasonsByClientID, "setObject:forKeyedSubscript:", v12, v11);
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_assertionsByReason, "objectForKeyedSubscript:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    ITLogIdleTimer();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v20;
      v23 = 2114;
      v24 = v9;
      v25 = 2114;
      v26 = v10;
      _os_log_error_impl(&dword_2063D2000, v14, OS_LOG_TYPE_ERROR, "%{public}@ - received duplicate assertion request from client: %{public}@ for reason: %{public}@", (uint8_t *)&v21, 0x20u);

    }
    v15 = 1;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "acquireIdleTimerAssertionWithConfiguration:fromClient:forReason:", v8, v9, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v17 != 0;
    if (v17)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_assertionsByReason, "setObject:forKeyedSubscript:", v17, v10);
      objc_msgSend(v12, "addObject:", v10);
    }

  }
  return v15;
}

- (id)_identifierForClientProcess:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "pid");

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%ld"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (ITIdleTimerStateService)initWithDispatchQueue:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  ITIdleTimerStateService *v9;
  ITIdleTimerStateService *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *assertionsByReason;
  NSMutableDictionary *v13;
  NSMutableDictionary *assertionReasonsByClientID;
  ITIdleTimerStateServer *v15;
  ITIdleTimerStateServer *server;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ITIdleTimerStateService;
  v9 = -[ITIdleTimerStateService init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_calloutDispatchQueue, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    assertionsByReason = v10->_assertionsByReason;
    v10->_assertionsByReason = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    assertionReasonsByClientID = v10->_assertionReasonsByClientID;
    v10->_assertionReasonsByClientID = v13;

    v15 = -[ITIdleTimerStateServer initWithCalloutQueue:delegate:]([ITIdleTimerStateServer alloc], "initWithCalloutQueue:delegate:", v10->_calloutDispatchQueue, v10);
    server = v10->_server;
    v10->_server = v15;

    -[ITIdleTimerStateService _addStateCaptureHandler](v10, "_addStateCaptureHandler");
  }

  return v10;
}

- (ITIdleTimerStateService)initWithDispatchQueue:(id)a3
{
  return -[ITIdleTimerStateService initWithDispatchQueue:delegate:](self, "initWithDispatchQueue:delegate:", a3, 0);
}

- (void)dealloc
{
  BSInvalidatable *stateCaptureAssertion;
  BSInvalidatable *v4;
  objc_super v5;

  stateCaptureAssertion = self->_stateCaptureAssertion;
  if (stateCaptureAssertion)
  {
    -[BSInvalidatable invalidate](stateCaptureAssertion, "invalidate");
    v4 = self->_stateCaptureAssertion;
    self->_stateCaptureAssertion = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)ITIdleTimerStateService;
  -[ITIdleTimerStateService dealloc](&v5, sel_dealloc);
}

- (void)removeIdleTimerConfigurationFromProcess:(id)a3 forReason:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a3;
  BSDispatchQueueAssert();
  -[ITIdleTimerStateService _identifierForClientProcess:](self, "_identifierForClientProcess:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_assertionReasonsByClientID, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_assertionsByReason, "objectForKeyedSubscript:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](self->_assertionsByReason, "removeObjectForKey:", v10);
    objc_msgSend(v9, "invalidate");
    objc_msgSend(v8, "removeObject:", v10);

  }
}

- (void)clientDidDisconnect:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BSDispatchQueueAssert();
  -[ITIdleTimerStateService _identifierForClientProcess:](self, "_identifierForClientProcess:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_assertionReasonsByClientID, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[ITIdleTimerStateService removeIdleTimerConfigurationFromProcess:forReason:](self, "removeIdleTimerConfigurationFromProcess:forReason:", v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  -[NSMutableDictionary removeObjectForKey:](self->_assertionReasonsByClientID, "removeObjectForKey:", v5);
}

- (BOOL)isIdleTimerServiceAvailable
{
  id WeakRetained;

  BSDispatchQueueAssert();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(self) = WeakRetained != 0;

  return (char)self;
}

- (BOOL)clientConfiguration:(id)a3 handleIdleEvent:(unint64_t)a4
{
  id v6;

  v6 = a3;
  BSDispatchQueueAssert();
  LOBYTE(a4) = -[ITIdleTimerStateServer clientConfiguration:handleIdleEvent:](self->_server, "clientConfiguration:handleIdleEvent:", v6, a4);

  return a4;
}

- (void)_addStateCaptureHandler
{
  BSInvalidatable *v3;
  BSInvalidatable *stateCaptureAssertion;
  id v5;
  id location;

  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  BSLogAddStateCaptureBlockWithTitle();
  v3 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  stateCaptureAssertion = self->_stateCaptureAssertion;
  self->_stateCaptureAssertion = v3;

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

__CFString *__50__ITIdleTimerStateService__addStateCaptureHandler__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  __CFString *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[4], "description");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_24BF08CF8;
  }

  return v3;
}

- (ITIdleTimerStateServiceDelegate)delegate
{
  return (ITIdleTimerStateServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong((id *)&self->_assertionReasonsByClientID, 0);
  objc_storeStrong((id *)&self->_assertionsByReason, 0);
  objc_storeStrong((id *)&self->_calloutDispatchQueue, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

@end

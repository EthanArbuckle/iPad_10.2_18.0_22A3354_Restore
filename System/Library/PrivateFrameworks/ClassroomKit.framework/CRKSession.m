@implementation CRKSession

- (CRKSession)initWithEndpoint:(id)a3
{
  id v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  int v11;
  CRKSession *v12;
  CRKSession *v13;
  CRKBoundedGrowthFunction *v14;
  CRKGrowthFunction *backoffGrowthFunction;
  uint64_t v16;
  CATStateMachine *mFSM;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  CRKExponentialGrowthFunction *v31;
  id v32;
  objc_super v33;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKSession.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endpoint"));

  }
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqualToString:", v10);

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKSession.m"), 63, CFSTR("CRKSession is an abstract class. Please do not initialize it directly."));

  }
  v33.receiver = self;
  v33.super_class = (Class)CRKSession;
  v12 = -[CRKSession init](&v33, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_endpoint, a3);
    *(_OWORD *)&v13->_lostBeaconTimeout = xmmword_218D50230;
    v13->_requiresBeacon = 1;
    v31 = -[CRKExponentialGrowthFunction initWithGrowthRate:]([CRKExponentialGrowthFunction alloc], "initWithGrowthRate:", 2.0);
    v14 = -[CRKBoundedGrowthFunction initWithGrowthFunction:lowerBound:upperBound:]([CRKBoundedGrowthFunction alloc], "initWithGrowthFunction:lowerBound:upperBound:", v31, 1.0, 64.0);
    backoffGrowthFunction = v13->_backoffGrowthFunction;
    v13->_backoffGrowthFunction = (CRKGrowthFunction *)v14;

    -[CRKSession registerDefaults](v13, "registerDefaults");
    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BE2C788]), "initWithTarget:", v13);
    mFSM = v13->mFSM;
    v13->mFSM = (CATStateMachine *)v16;

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", CFSTR("CRKClassSessionLogLevel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine setLogLevel:](v13->mFSM, "setLogLevel:", objc_msgSend(v19, "integerValue"));

    -[CATStateMachine addStateWithName:](v13->mFSM, "addStateWithName:", CFSTR("Out of Range"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine addStateWithName:](v13->mFSM, "addStateWithName:", CFSTR("No Network and Not in Range"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine addStateWithName:](v13->mFSM, "addStateWithName:", CFSTR("No Network"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine addStateWithName:](v13->mFSM, "addStateWithName:", CFSTR("Backoff Can Connect"));
    v32 = v6;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine addStateWithName:](v13->mFSM, "addStateWithName:", CFSTR("Should Connect?"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine addStateWithName:](v13->mFSM, "addStateWithName:", CFSTR("Connecting"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine addStateWithName:](v13->mFSM, "addStateWithName:", CFSTR("Connected"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine addStateWithName:](v13->mFSM, "addStateWithName:", CFSTR("Invalidated"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setEnterAction:", sel_enterOutOfRange);
    objc_msgSend(v20, "addTransitionToState:triggeringEvent:", v23, CFSTR("foundBeacon"));
    objc_msgSend(v20, "addTransitionToState:triggeringEvent:", 0, CFSTR("lostBeacon"));
    objc_msgSend(v20, "addTransitionToState:triggeringEvent:", 0, CFSTR("localWiFiBecameAvailable"));
    objc_msgSend(v20, "addTransitionToState:triggeringEvent:", v21, CFSTR("localWiFiBecameUnavailable"));
    objc_msgSend(v20, "addTransitionToState:triggeringEvent:", 0, CFSTR("connect"));
    objc_msgSend(v20, "addTransitionToState:triggeringEvent:", 0, CFSTR("lostConnection"));
    objc_msgSend(v20, "addTransitionToState:triggeringEvent:", 0, CFSTR("rejected"));
    objc_msgSend(v20, "addTransitionToState:triggeringEvent:", v26, CFSTR("invalidate"));
    objc_msgSend(v21, "addTransitionToState:triggeringEvent:", v22, CFSTR("foundBeacon"));
    objc_msgSend(v21, "addTransitionToState:triggeringEvent:", 0, CFSTR("lostBeacon"));
    objc_msgSend(v21, "addTransitionToState:triggeringEvent:", v20, CFSTR("localWiFiBecameAvailable"));
    objc_msgSend(v21, "addTransitionToState:triggeringEvent:", 0, CFSTR("localWiFiBecameUnavailable"));
    objc_msgSend(v21, "addTransitionToState:triggeringEvent:", 0, CFSTR("connect"));
    objc_msgSend(v21, "addTransitionToState:triggeringEvent:", 0, CFSTR("lostConnection"));
    objc_msgSend(v21, "addTransitionToState:triggeringEvent:", 0, CFSTR("rejected"));
    objc_msgSend(v21, "addTransitionToState:triggeringEvent:", v26, CFSTR("invalidate"));
    objc_msgSend(v22, "setEnterAction:", sel_enterNoNetwork);
    objc_msgSend(v22, "addTransitionToState:triggeringEvent:", 0, CFSTR("foundBeacon"));
    objc_msgSend(v22, "addTransitionToState:triggeringEvent:action:", v21, CFSTR("lostBeacon"), sel_delegateDidLoseBeacon);
    objc_msgSend(v22, "addTransitionToState:triggeringEvent:", v23, CFSTR("localWiFiBecameAvailable"));
    objc_msgSend(v22, "addTransitionToState:triggeringEvent:", 0, CFSTR("localWiFiBecameUnavailable"));
    objc_msgSend(v22, "addTransitionToState:triggeringEvent:", 0, CFSTR("connect"));
    objc_msgSend(v22, "addTransitionToState:triggeringEvent:", 0, CFSTR("lostConnection"));
    objc_msgSend(v22, "addTransitionToState:triggeringEvent:", 0, CFSTR("rejected"));
    objc_msgSend(v22, "addTransitionToState:triggeringEvent:", v26, CFSTR("invalidate"));
    objc_msgSend(v23, "setEnterAction:", sel_enterBackoffCanConnect);
    objc_msgSend(v23, "addTransitionToState:triggeringEvent:", 0, CFSTR("foundBeacon"));
    objc_msgSend(v23, "addTransitionToState:triggeringEvent:action:", v20, CFSTR("lostBeacon"), sel_delegateDidLoseBeacon);
    objc_msgSend(v23, "addTransitionToState:triggeringEvent:", 0, CFSTR("localWiFiBecameAvailable"));
    objc_msgSend(v23, "addTransitionToState:triggeringEvent:", v22, CFSTR("localWiFiBecameUnavailable"));
    objc_msgSend(v23, "addTransitionToState:triggeringEvent:", 0, CFSTR("lostConnection"));
    objc_msgSend(v23, "addTransitionToState:triggeringEvent:", 0, CFSTR("rejected"));
    objc_msgSend(v23, "addTransitionToState:triggeringEvent:", v30, CFSTR("backoffDidFinish"));
    objc_msgSend(v23, "addTransitionToState:triggeringEvent:", v26, CFSTR("invalidate"));
    objc_msgSend(v23, "setExitAction:", sel_exitBackoffCanConnect);
    objc_msgSend(v30, "setEnterAction:", sel_delegateDidBecomeConnectable);
    objc_msgSend(v30, "addTransitionToState:triggeringEvent:", v24, CFSTR("connect"));
    objc_msgSend(v30, "addTransitionToState:triggeringEvent:", v30, CFSTR("foundBeacon"));
    objc_msgSend(v30, "addTransitionToState:triggeringEvent:action:", v20, CFSTR("lostBeacon"), sel_delegateDidBecomeNotConnectableAndDidLoseBeacon);
    objc_msgSend(v30, "addTransitionToState:triggeringEvent:", 0, CFSTR("localWiFiBecameAvailable"));
    objc_msgSend(v30, "addTransitionToState:triggeringEvent:action:", v22, CFSTR("localWiFiBecameUnavailable"), sel_delegateDidBecomeNotConnectable);
    objc_msgSend(v30, "addTransitionToState:triggeringEvent:", 0, CFSTR("lostConnection"));
    objc_msgSend(v30, "addTransitionToState:triggeringEvent:", 0, CFSTR("rejected"));
    objc_msgSend(v30, "addTransitionToState:triggeringEvent:action:", v26, CFSTR("invalidate"), sel_delegateDidBecomeNotConnectable);
    objc_msgSend(v24, "setEnterAction:", sel_tryConnecting);
    objc_msgSend(v24, "addTransitionToState:triggeringEvent:", 0, CFSTR("foundBeacon"));
    objc_msgSend(v24, "addTransitionToState:triggeringEvent:action:", v20, CFSTR("lostBeacon"), sel_delegateDidLoseBeacon);
    objc_msgSend(v24, "addTransitionToState:triggeringEvent:", 0, CFSTR("localWiFiBecameAvailable"));
    objc_msgSend(v24, "addTransitionToState:triggeringEvent:", v22, CFSTR("localWiFiBecameUnavailable"));
    objc_msgSend(v24, "addTransitionToState:triggeringEvent:", v25, CFSTR("didConnect"));
    objc_msgSend(v24, "addTransitionToState:triggeringEvent:", v23, CFSTR("failedToConnect"));
    objc_msgSend(v24, "addTransitionToState:triggeringEvent:", 0, CFSTR("connect"));
    objc_msgSend(v24, "addTransitionToState:triggeringEvent:", 0, CFSTR("lostConnection"));
    objc_msgSend(v24, "addTransitionToState:triggeringEvent:", 0, CFSTR("rejected"));
    objc_msgSend(v24, "addTransitionToState:triggeringEvent:", v26, CFSTR("invalidate"));
    objc_msgSend(v24, "setExitAction:", sel_cancelConnectionAttempt);
    objc_msgSend(v25, "setEnterAction:", sel_delegateConnected);
    objc_msgSend(v25, "addTransitionToState:triggeringEvent:", 0, CFSTR("foundBeacon"));
    objc_msgSend(v25, "addTransitionToState:triggeringEvent:action:", v20, CFSTR("lostBeacon"), sel_delegateDidLoseBeacon);
    objc_msgSend(v25, "addTransitionToState:triggeringEvent:", 0, CFSTR("localWiFiBecameAvailable"));
    objc_msgSend(v25, "addTransitionToState:triggeringEvent:", v22, CFSTR("localWiFiBecameUnavailable"));
    objc_msgSend(v25, "addTransitionToState:triggeringEvent:", 0, CFSTR("connect"));
    objc_msgSend(v25, "addTransitionToState:triggeringEvent:", v23, CFSTR("rejected"));
    objc_msgSend(v25, "addTransitionToState:triggeringEvent:action:", v23, CFSTR("lostConnection"), sel_resetBackoff);
    objc_msgSend(v25, "addTransitionToState:triggeringEvent:", v26, CFSTR("invalidate"));
    objc_msgSend(v25, "setExitAction:", sel_delegateDisconnected);
    objc_msgSend(v26, "setEnterAction:", sel_delegateInvalidated);
    objc_msgSend(v26, "addTransitionToState:triggeringEvent:", 0, CFSTR("invalidate"));
    -[CATStateMachine start](v13->mFSM, "start");

    v6 = v32;
  }

  return v13;
}

- (void)setRequiresBeacon:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  CRKSession *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  if (_CRKLogBluetooth_onceToken_1 != -1)
    dispatch_once(&_CRKLogBluetooth_onceToken_1, &__block_literal_global_226);
  v5 = (void *)_CRKLogBluetooth_logObj_1;
  if (os_log_type_enabled((os_log_t)_CRKLogBluetooth_logObj_1, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = v5;
    objc_msgSend(v6, "numberWithBool:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 134218242;
    v10 = self;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_218C99000, v7, OS_LOG_TYPE_INFO, "Setting requiresBeacon for session %p: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  if (self->_requiresBeacon != v3)
  {
    self->_requiresBeacon = v3;
    -[CRKSession foundBeacon](self, "foundBeacon");
  }
}

- (void)foundBeacon
{
  CATStateMachine *mFSM;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKSession.m"), 195, CFSTR("%@ must be called from the main thread"), v8);

  }
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_lostBeacon, 0);
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_delegateWillLoseBeacon, 0);
  if (-[CRKSession requiresBeacon](self, "requiresBeacon"))
  {
    -[CRKSession willLoseBeaconWarningTimeout](self, "willLoseBeaconWarningTimeout");
    -[CRKSession performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_delegateWillLoseBeacon, 0);
  }
  mFSM = self->mFSM;
  v5 = (void *)MEMORY[0x24BE2C790];
  NSStringFromSelector(a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventWithTrigger:context:", v9, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATStateMachine transitionWithTriggeringEvent:](mFSM, "transitionWithTriggeringEvent:", v6);

}

- (void)localWiFiBecameAvailable
{
  CATStateMachine *mFSM;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKSession.m"), 206, CFSTR("%@ must be called from the main thread"), v8);

  }
  mFSM = self->mFSM;
  v5 = (void *)MEMORY[0x24BE2C790];
  NSStringFromSelector(a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventWithTrigger:context:", v9, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATStateMachine transitionWithTriggeringEvent:](mFSM, "transitionWithTriggeringEvent:", v6);

}

- (void)localWiFiBecameUnavailable
{
  CATStateMachine *mFSM;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKSession.m"), 211, CFSTR("%@ must be called from the main thread"), v8);

  }
  mFSM = self->mFSM;
  v5 = (void *)MEMORY[0x24BE2C790];
  NSStringFromSelector(a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventWithTrigger:context:", v9, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATStateMachine transitionWithTriggeringEvent:](mFSM, "transitionWithTriggeringEvent:", v6);

}

- (void)lostConnection
{
  CATStateMachine *mFSM;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKSession.m"), 216, CFSTR("%@ must be called from the main thread"), v8);

  }
  mFSM = self->mFSM;
  v5 = (void *)MEMORY[0x24BE2C790];
  NSStringFromSelector(a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventWithTrigger:context:", v9, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATStateMachine transitionWithTriggeringEvent:](mFSM, "transitionWithTriggeringEvent:", v6);

}

- (void)connect
{
  CATStateMachine *mFSM;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKSession.m"), 221, CFSTR("%@ must be called from the main thread"), v8);

  }
  mFSM = self->mFSM;
  v5 = (void *)MEMORY[0x24BE2C790];
  NSStringFromSelector(a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventWithTrigger:context:", v9, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATStateMachine transitionWithTriggeringEvent:](mFSM, "transitionWithTriggeringEvent:", v6);

}

- (void)invalidate
{
  CATStateMachine *mFSM;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKSession.m"), 226, CFSTR("%@ must be called from the main thread"), v8);

  }
  mFSM = self->mFSM;
  v5 = (void *)MEMORY[0x24BE2C790];
  NSStringFromSelector(a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventWithTrigger:context:", v9, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATStateMachine transitionWithTriggeringEvent:](mFSM, "transitionWithTriggeringEvent:", v6);

}

- (void)rejected
{
  CATStateMachine *mFSM;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKSession.m"), 231, CFSTR("%@ must be called from the main thread"), v8);

  }
  mFSM = self->mFSM;
  v5 = (void *)MEMORY[0x24BE2C790];
  NSStringFromSelector(a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventWithTrigger:context:", v9, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATStateMachine transitionWithTriggeringEvent:](mFSM, "transitionWithTriggeringEvent:", v6);

}

- (NSDictionary)stateDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;

  v3 = (void *)objc_opt_new();
  -[CRKSession stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("state"));

  -[CRKSession transport](self, "transport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("transport"));

  -[CRKSession transportPreflightOperation](self, "transportPreflightOperation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stateDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("transportPreflightOperation"));

  if (-[CRKSession requiresBeacon](self, "requiresBeacon"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("requiresBeacon"));
  v12 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v12;
}

- (void)lostBeacon
{
  CATStateMachine *mFSM;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKSession.m"), 247, CFSTR("%@ must be called from the main thread"), v8);

  }
  mFSM = self->mFSM;
  v5 = (void *)MEMORY[0x24BE2C790];
  NSStringFromSelector(a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventWithTrigger:context:", v9, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATStateMachine transitionWithTriggeringEvent:](mFSM, "transitionWithTriggeringEvent:", v6);

}

- (void)didConnect
{
  CATStateMachine *mFSM;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKSession.m"), 252, CFSTR("%@ must be called from the main thread"), v8);

  }
  mFSM = self->mFSM;
  v5 = (void *)MEMORY[0x24BE2C790];
  NSStringFromSelector(a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventWithTrigger:context:", v9, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATStateMachine transitionWithTriggeringEvent:](mFSM, "transitionWithTriggeringEvent:", v6);

}

- (void)failedToConnect
{
  CATStateMachine *mFSM;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKSession.m"), 257, CFSTR("%@ must be called from the main thread"), v8);

  }
  mFSM = self->mFSM;
  v5 = (void *)MEMORY[0x24BE2C790];
  NSStringFromSelector(a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventWithTrigger:context:", v9, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATStateMachine transitionWithTriggeringEvent:](mFSM, "transitionWithTriggeringEvent:", v6);

}

- (void)registerDefaults
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  _QWORD v5[6];

  v5[5] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = CFSTR("CRKStudentAdaptiveWriteTimeout");
  v4[1] = CFSTR("CRKStudentKeepAliveEnabled");
  v5[0] = &unk_24DA07FB8;
  v5[1] = MEMORY[0x24BDBD1C8];
  v4[2] = CFSTR("CRKStudentKeepAliveDelay");
  v4[3] = CFSTR("CRKStudentKeepAliveInterval");
  v5[2] = &unk_24DA07FD0;
  v5[3] = &unk_24DA07FD0;
  v4[4] = CFSTR("CRKStudentKeepAliveCount");
  v5[4] = &unk_24DA07FD0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerDefaults:", v3);

}

- (void)tryConnecting
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "endpoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_218C99000, a2, OS_LOG_TYPE_ERROR, "SESSION:%{public}@. IP:%{public}@. Failed to connect: No Client Identity", (uint8_t *)&v6, 0x16u);

}

uint64_t __27__CRKSession_tryConnecting__block_invoke(int a1, id a2)
{
  return objc_msgSend(objc_retainAutorelease(a2), "underlyingCertificate");
}

- (id)studentSocketOptions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("CRKStudentAdaptiveWriteTimeout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAdaptiveWriteTimeout:", v4);

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("CRKStudentKeepAliveEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeepAliveEnabled:", v6);

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", CFSTR("CRKStudentKeepAliveDelay"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeepAliveDelay:", v8);

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKey:", CFSTR("CRKStudentKeepAliveInterval"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeepAliveInterval:", v10);

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", CFSTR("CRKStudentKeepAliveCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeepAliveCount:", v12);

  return v2;
}

- (void)delegateWillLoseBeacon
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  char v9;
  id v10;

  -[CRKSession lostBeaconTimeout](self, "lostBeaconTimeout");
  v4 = v3;
  -[CRKSession willLoseBeaconWarningTimeout](self, "willLoseBeaconWarningTimeout");
  v6 = v4 - v5;
  if (v6 >= 0.0)
    v7 = v6;
  else
    v7 = 0.0;
  -[CRKSession performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_lostBeacon, 0, v7);
  -[CRKSession delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[CRKSession delegate](self, "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "session:willLoseBeaconAfterTimeInterval:", self, v7);

  }
}

- (void)delegateDidLoseBeacon
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __35__CRKSession_delegateDidLoseBeacon__block_invoke;
  v5[3] = &unk_24D9C7020;
  v5[4] = self;
  objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addOperation:", v4);

}

void __35__CRKSession_delegateDidLoseBeacon__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionDidLoseBeacon:", *(_QWORD *)(a1 + 32));

  }
}

- (void)delegateDidBecomeConnectable
{
  void *v3;
  char v4;
  id v5;

  -[CRKSession delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CRKSession delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sessionDidBecomeConnectable:", self);

  }
  else
  {
    -[CRKSession connect](self, "connect");
  }
}

- (void)delegateDidBecomeNotConnectable
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__CRKSession_delegateDidBecomeNotConnectable__block_invoke;
  v5[3] = &unk_24D9C7020;
  v5[4] = self;
  objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addOperation:", v4);

}

void __45__CRKSession_delegateDidBecomeNotConnectable__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionDidBecomeNotConnectable:", *(_QWORD *)(a1 + 32));

  }
}

- (void)delegateDidBecomeNotConnectableAndDidLoseBeacon
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __61__CRKSession_delegateDidBecomeNotConnectableAndDidLoseBeacon__block_invoke;
  v5[3] = &unk_24D9C7020;
  v5[4] = self;
  objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addOperation:", v4);

}

void __61__CRKSession_delegateDidBecomeNotConnectableAndDidLoseBeacon__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionDidBecomeNotConnectable:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sessionDidLoseBeacon:", *(_QWORD *)(a1 + 32));

  }
}

- (void)delegateConnected
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  CRKSession *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  _CRKLogSession();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[CRKSession endpoint](self, "endpoint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_218C99000, v3, OS_LOG_TYPE_INFO, "SESSION:%{public}@. IP:%{public}@. Connected", (uint8_t *)&v10, 0x16u);

  }
  -[CRKSession delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CRKSession delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKSession transport](self, "transport");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "session:didConnectWithTransport:", self, v9);

  }
}

- (void)delegateDisconnected
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__CRKSession_delegateDisconnected__block_invoke;
  v5[3] = &unk_24D9C7020;
  v5[4] = self;
  objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addOperation:", v4);

}

void __34__CRKSession_delegateDisconnected__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionDidDisconnect:", *(_QWORD *)(a1 + 32));

  }
}

- (void)delegateInvalidated
{
  void *v3;
  char v4;
  id v5;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_lostBeacon, 0);
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_delegateWillLoseBeacon, 0);
  -[CRKSession delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CRKSession delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sessionDidInvalidate:", self);

  }
}

- (void)enterBackoffCanConnect
{
  double mCurrentBackoffInterval;
  void *v4;
  double v5;

  mCurrentBackoffInterval = self->mCurrentBackoffInterval;
  -[CRKSession backoffGrowthFunction](self, "backoffGrowthFunction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "evaluateWithValue:", self->mCurrentBackoffInterval);
  self->mCurrentBackoffInterval = v5;

  -[CRKSession performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_backoffDidFinish, 0, mCurrentBackoffInterval);
}

- (void)exitBackoffCanConnect
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_backoffDidFinish, 0);
}

- (void)backoffDidFinish
{
  CATStateMachine *mFSM;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKSession.m"), 422, CFSTR("%@ must be called from the main thread"), v8);

  }
  mFSM = self->mFSM;
  v5 = (void *)MEMORY[0x24BE2C790];
  NSStringFromSelector(a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventWithTrigger:context:", v9, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATStateMachine transitionWithTriggeringEvent:](mFSM, "transitionWithTriggeringEvent:", v6);

}

- (void)resetBackoff
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  CRKSession *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _CRKLogSession();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[CRKSession endpoint](self, "endpoint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = self;
    v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_218C99000, v3, OS_LOG_TYPE_INFO, "SESSION:%{public}@. IP:%{public}@. Resetting session backoff.", (uint8_t *)&v6, 0x16u);

  }
  self->mCurrentBackoffInterval = 0.0;
}

- (void)startPreflightingTransport:(id)a3
{
  id v5;
  void *v6;
  CRKTransportPreflightOperation *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  -[CRKSession transportPreflightOperation](self, "transportPreflightOperation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKSession.m"), 434, CFSTR("Already preflighting a transport"));

  }
  v7 = -[CRKTransportPreflightOperation initWithTransport:session:]([CRKTransportPreflightOperation alloc], "initWithTransport:session:", v5, self);

  -[CRKSession setTransportPreflightOperation:](self, "setTransportPreflightOperation:", v7);
  -[CRKSession transportPreflightOperation](self, "transportPreflightOperation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTarget:selector:forOperationEvents:", self, sel_transportPreflightOperationDidFinish_, 6);

  objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[CRKSession transportPreflightOperation](self, "transportPreflightOperation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addOperation:", v9);

}

- (void)stopPreflightingTransport
{
  void *v3;

  -[CRKSession transportPreflightOperation](self, "transportPreflightOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[CRKSession setTransportPreflightOperation:](self, "setTransportPreflightOperation:", 0);
}

- (void)transportPreflightOperationDidFinish:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[CRKSession transportPreflightOperation](self, "transportPreflightOperation");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    -[CRKSession setTransportPreflightOperation:](self, "setTransportPreflightOperation:", 0);
    -[CRKSession processFinishedTransportPreflightOperation:](self, "processFinishedTransportPreflightOperation:", v5);
  }

}

- (void)processFinishedTransportPreflightOperation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    _CRKLogSession();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CRKSession processFinishedTransportPreflightOperation:].cold.1(self, v5, v6);

    -[CRKSession failedToConnect](self, "failedToConnect");
  }
  else
  {
    objc_msgSend(v4, "resultObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "takeTransport");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[CRKSession setTransport:](self, "setTransport:", v8);
      -[CRKSession didConnect](self, "didConnect");
    }
    else
    {
      if (objc_msgSend(v7, "shouldResetBackoff"))
        -[CRKSession resetBackoff](self, "resetBackoff");
      -[CRKSession failedToConnect](self, "failedToConnect");
    }

  }
}

- (CATStateMachine)stateMachine
{
  return self->mFSM;
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->mFSM, a3);
}

- (CRKSessionDelegate)delegate
{
  return (CRKSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CRKRemoteEndpoint)endpoint
{
  return (CRKRemoteEndpoint *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)requiresBeacon
{
  return self->_requiresBeacon;
}

- (CRKGrowthFunction)backoffGrowthFunction
{
  return self->_backoffGrowthFunction;
}

- (CATTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
  objc_storeStrong((id *)&self->_transport, a3);
}

- (double)lostBeaconTimeout
{
  return self->_lostBeaconTimeout;
}

- (void)setLostBeaconTimeout:(double)a3
{
  self->_lostBeaconTimeout = a3;
}

- (double)willLoseBeaconWarningTimeout
{
  return self->_willLoseBeaconWarningTimeout;
}

- (void)setWillLoseBeaconWarningTimeout:(double)a3
{
  self->_willLoseBeaconWarningTimeout = a3;
}

- (CRKTransportPreflightOperation)transportPreflightOperation
{
  return self->_transportPreflightOperation;
}

- (void)setTransportPreflightOperation:(id)a3
{
  objc_storeStrong((id *)&self->_transportPreflightOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportPreflightOperation, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_backoffGrowthFunction, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mFSM, 0);
}

- (void)processFinishedTransportPreflightOperation:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "endpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "verboseDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543874;
  v10 = a1;
  v11 = 2114;
  v12 = v7;
  v13 = 2114;
  v14 = v8;
  _os_log_error_impl(&dword_218C99000, a3, OS_LOG_TYPE_ERROR, "SESSION:%{public}@. IP:%{public}@. Transport preflight failed: %{public}@", (uint8_t *)&v9, 0x20u);

}

@end

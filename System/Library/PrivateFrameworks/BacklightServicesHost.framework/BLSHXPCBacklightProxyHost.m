@implementation BLSHXPCBacklightProxyHost

- (BOOL)isAlwaysOnEnabled
{
  return -[BLSBacklightProxy isAlwaysOnEnabled](self->_localBacklightProxy, "isAlwaysOnEnabled");
}

- (BLSHXPCBacklightProxyHost)initWithLocalBacklightProxy:(id)a3 peer:(id)a4
{
  id v7;
  id v8;
  BLSHXPCBacklightProxyHost *v9;
  BLSHXPCBacklightProxyHost *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BLSHXPCBacklightProxyHost;
  v9 = -[BLSHXPCBacklightProxyHost init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_entitlements = 0;
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(v8, "remoteProcess");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "hasEntitlement:", CFSTR("com.apple.backlight.backlightaccess")))
      v10->_entitlements |= 4u;
    if (objc_msgSend(v11, "hasEntitlement:", CFSTR("com.apple.backlight.performrequest")))
      v10->_entitlements |= 2u;
    if (objc_msgSend(v11, "hasEntitlement:", CFSTR("com.apple.backlight.anysource")))
      v10->_entitlements |= 1u;
    if (objc_msgSend(v11, "hasEntitlement:", CFSTR("com.apple.backlight.allowsActivationObservation")))
      v10->_entitlements |= 8u;
    if (objc_msgSend(v11, "hasEntitlement:", CFSTR("com.apple.backlight.allowsPerformingEventObservation")))v10->_entitlements |= 0x10u;
    objc_storeStrong((id *)&v10->_localBacklightProxy, a3);
    v10->_lock_valid = 1;
    objc_msgSend(v8, "remoteProcess");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_clientPid = objc_msgSend(v12, "pid");

  }
  return v10;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_2_3(&dword_2145AC000, v0, v1, "%p must invalidate before deallocating service for pid:%d", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_2();
}

- (os_unfair_lock_s)isValid
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;

  v1 = a1;
  if (a1)
  {
    v2 = a1 + 12;
    os_unfair_lock_lock(a1 + 12);
    v1 = (os_unfair_lock_s *)(BYTE2(v1[13]._os_unfair_lock_opaque) != 0);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInt:withName:", self->_clientPid, CFSTR("clientPID"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  RBSProcessMonitor *processMonitor;
  BLSXPCBacklightProxyClientInterface *lock_observingClient;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_valid = 0;
  -[RBSProcessMonitor invalidate](self->_processMonitor, "invalidate");
  processMonitor = self->_processMonitor;
  self->_processMonitor = 0;

  lock_observingClient = self->_lock_observingClient;
  self->_lock_observingClient = 0;

  -[BLSBacklightProxy removeObserver:](self->_localBacklightProxy, "removeObserver:", self);
  os_unfair_lock_unlock(p_lock);
}

- (id)getBacklightState
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[BLSBacklightProxy backlightState](self->_localBacklightProxy, "backlightState"));
}

- (id)getFlipbookState
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[BLSBacklightProxy flipbookState](self->_localBacklightProxy, "flipbookState"));
}

- (BOOL)isTransitioning
{
  return -[BLSBacklightProxy isTransitioning](self->_localBacklightProxy, "isTransitioning");
}

- (BOOL)deviceSupportsAlwaysOn
{
  return -[BLSBacklightProxy deviceSupportsAlwaysOn](self->_localBacklightProxy, "deviceSupportsAlwaysOn");
}

- (id)performChangeRequest:(id)a3
{
  id v4;
  unsigned int entitlements;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void **v11;
  uint64_t *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((-[BLSHXPCBacklightProxyHost isValid]((os_unfair_lock_s *)self) & 1) != 0)
  {
    entitlements = self->_entitlements;
    if ((entitlements & 4) == 0)
    {
      bls_backlight_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[BLSHXPCBacklightProxyHost performChangeRequest:].cold.1();

      v7 = (void *)MEMORY[0x24BDD1540];
      v8 = *MEMORY[0x24BE0B778];
      v28 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ no entitlement %@"), v4, CFSTR("com.apple.backlight.backlightaccess"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v9;
      v10 = (void *)MEMORY[0x24BDBCE70];
      v11 = &v29;
      v12 = &v28;
LABEL_19:
      objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 21, v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_20;
    }
    if ((entitlements & 2) == 0)
    {
      bls_backlight_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[BLSHXPCBacklightProxyHost performChangeRequest:].cold.2();

      v7 = (void *)MEMORY[0x24BDD1540];
      v8 = *MEMORY[0x24BE0B778];
      v26 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ no entitlement %@"), v4, CFSTR("com.apple.backlight.performrequest"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v9;
      v10 = (void *)MEMORY[0x24BDBCE70];
      v11 = &v27;
      v12 = &v26;
      goto LABEL_19;
    }
    if ((entitlements & 1) == 0 && objc_msgSend(v4, "sourceEvent") != 10)
    {
      bls_backlight_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[BLSHXPCBacklightProxyHost performChangeRequest:].cold.3();

      v7 = (void *)MEMORY[0x24BDD1540];
      v8 = *MEMORY[0x24BE0B778];
      v24 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ no entitlement %@"), v4, CFSTR("com.apple.backlight.anysource"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v9;
      v10 = (void *)MEMORY[0x24BDBCE70];
      v11 = &v25;
      v12 = &v24;
      goto LABEL_19;
    }
    v20 = (id)-[BLSBacklightProxy performChangeRequest:](self->_localBacklightProxy, "performChangeRequest:", v4);
    v18 = 0;
  }
  else
  {
    bls_backlight_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[BLSHXPCBacklightProxyHost performChangeRequest:].cold.4((uint64_t)self, v13);

    v14 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BE0B778];
    v30 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("proxy is invalid for pid:%d"), self->_clientPid);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 4, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_20:

  return v18;
}

- (void)nowObservingWithMask:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  BLSXPCBacklightProxyObserverMask *v31;
  BLSXPCBacklightProxyClientInterface *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  _QWORD v37[2];
  _QWORD v38[2];
  uint64_t v39;
  void *v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (((objc_msgSend(v6, "isObservingActivatingWithEvent") & 1) != 0
     || objc_msgSend(v6, "isObservingDeactivatingWithEvent"))
    && (self->_entitlements & 8) == 0)
  {
    bls_backlight_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BLSHXPCBacklightProxyHost nowObservingWithMask:completion:].cold.2();

    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BE0B778];
    v41 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Observing activating/deactivating requires entitlement %@"), CFSTR("com.apple.backlight.allowsActivationObservation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 21, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(0, "addObject:", v13);
    objc_msgSend(v6, "noActivatingMask");
    v14 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v14;
  }
  if (objc_msgSend(v6, "isObservingPerformingEvent") && (self->_entitlements & 0x10) == 0)
  {
    bls_backlight_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[BLSHXPCBacklightProxyHost nowObservingWithMask:completion:].cold.1();

    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BE0B778];
    v39 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Observing performing all events requires entitlement %@"), CFSTR("com.apple.backlight.allowsPerformingEventObservation"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 21, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(0, "addObject:", v20);
    objc_msgSend(v6, "noPerformingEventMask");
    v21 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v21;
  }
  objc_msgSend(0, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(0, "count") >= 2)
  {
    v23 = (void *)MEMORY[0x24BDD1540];
    v24 = *MEMORY[0x24BE0B778];
    v37[0] = *MEMORY[0x24BDD0FC8];
    v25 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v22, "localizedFailureReason");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (!v26)
    {
      objc_msgSend(v22, "localizedDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v25, "stringWithFormat:", CFSTR("Missing multiple observation entitlements including '%@'"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = *MEMORY[0x24BDD10D8];
    v38[0] = v28;
    v38[1] = 0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 21, v29);
    v30 = objc_claimAutoreleasedReturnValue();

    if (!v26)
    v22 = (void *)v30;
  }
  os_unfair_lock_lock(&self->_lock);
  v31 = self->_lock_observingMask;
  objc_storeStrong((id *)&self->_lock_observingMask, v6);
  v32 = self->_lock_observingClient;
  os_unfair_lock_unlock(&self->_lock);
  v33 = objc_msgSend(v6, "isObserving");
  if (v33 != -[BLSXPCBacklightProxyObserverMask isObserving](v31, "isObserving"))
  {
    if (v33)
    {
      -[BLSHXPCBacklightProxyHost beginObservation]((uint64_t)self);
      v34 = objc_claimAutoreleasedReturnValue();

      v32 = (BLSXPCBacklightProxyClientInterface *)v34;
    }
    else
    {
      -[BLSHXPCBacklightProxyHost endObservation]((uint64_t)self);
    }
  }
  if ((-[BLSBacklightProxy isTransitioning](self->_localBacklightProxy, "isTransitioning") & 1) == 0)
  {
    if (objc_msgSend(v6, "isObservingDidCompleteUpdateToState")
      && (-[BLSXPCBacklightProxyObserverMask isObservingDidCompleteUpdateToState](v31, "isObservingDidCompleteUpdateToState") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[BLSBacklightProxy backlightState](self->_localBacklightProxy, "backlightState"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[BLSXPCBacklightProxyClientInterface didCompleteUpdateToState:forEvents:abortedEvents:](v32, "didCompleteUpdateToState:forEvents:abortedEvents:", v35, 0, 0);

    }
    if (objc_msgSend(v6, "isObservingDidChangeAlwaysOnEnabled")
      && (-[BLSXPCBacklightProxyObserverMask isObservingDidChangeAlwaysOnEnabled](v31, "isObservingDidChangeAlwaysOnEnabled") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[BLSBacklightProxy isAlwaysOnEnabled](self->_localBacklightProxy, "isAlwaysOnEnabled"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[BLSXPCBacklightProxyClientInterface didChangeAlwaysOnEnabled:](v32, "didChangeAlwaysOnEnabled:", v36);

    }
  }
  v7[2](v7, v22);

}

- (id)beginObservation
{
  os_unfair_lock_s *v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id location;

  if (a1
    && (v2 = (os_unfair_lock_s *)(a1 + 48),
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48)),
        v3 = *(unsigned __int8 *)(a1 + 54),
        os_unfair_lock_unlock(v2),
        v3))
  {
    os_unfair_lock_lock(v2);
    v4 = *(_QWORD *)(a1 + 16);
    objc_msgSend(MEMORY[0x24BE0FA00], "currentContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteTarget");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      os_unfair_lock_unlock(v2);
      bls_backlight_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[BLSHXPCBacklightProxyHost beginObservation].cold.1();

    }
    else
    {
      objc_storeStrong((id *)(a1 + 16), v6);
      if (!*(_QWORD *)(a1 + 24))
      {
        objc_initWeak(&location, (id)a1);
        v8 = MEMORY[0x24BDAC760];
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 3221225472;
        v23[2] = __45__BLSHXPCBacklightProxyHost_beginObservation__block_invoke;
        v23[3] = &unk_24D1BDCF0;
        objc_copyWeak(&v24, &location);
        v9 = (void *)MEMORY[0x2199D2BD8](v23);
        v10 = (void *)MEMORY[0x24BE80D38];
        objc_msgSend(v5, "remoteProcess");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "targetWithPid:", objc_msgSend(v11, "pid"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        *(_BYTE *)(a1 + 52) = 1;
        v13 = (void *)MEMORY[0x24BE80CC8];
        v19[0] = v8;
        v19[1] = 3221225472;
        v19[2] = __45__BLSHXPCBacklightProxyHost_beginObservation__block_invoke_2;
        v19[3] = &unk_24D1BDD18;
        objc_copyWeak(&v22, &location);
        v14 = v12;
        v20 = v14;
        v15 = v9;
        v21 = v15;
        objc_msgSend(v13, "monitorWithConfiguration:", v19);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = *(void **)(a1 + 24);
        *(_QWORD *)(a1 + 24) = v16;

        objc_destroyWeak(&v22);
        objc_destroyWeak(&v24);

        objc_destroyWeak(&location);
      }
      os_unfair_lock_unlock(v2);
      objc_msgSend(*(id *)(a1 + 8), "addObserver:", a1);
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)endObservation
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_2_3(&dword_2145AC000, v0, v1, "%p was not observing from pid:%d", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_2();
}

void __45__BLSHXPCBacklightProxyHost_beginObservation__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v4;
  id v5;
  void *v6;
  int v7;
  _BOOL4 v9;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a4;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(v5, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "taskState");
  v9 = v7 == 4 || v7 == 2;
  -[BLSHXPCBacklightProxyHost clientProcessStateUpdate:]((uint64_t)WeakRetained, v9);

}

- (void)clientProcessStateUpdate:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  int v5;
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 48);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v5 = *(unsigned __int8 *)(a1 + 52);
    if (v5 != a2)
      *(_BYTE *)(a1 + 52) = a2;
    v6 = *(id *)(a1 + 16);
    v7 = *(unsigned __int8 *)(a1 + 53);
    if (a2)
      *(_BYTE *)(a1 + 53) = 0;
    os_unfair_lock_unlock(v4);
    if (v5 != a2 && v7 && a2)
    {
      v8 = objc_msgSend(*(id *)(a1 + 8), "backlightState");
      bls_backlight_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[BLSHXPCBacklightProxyHost clientProcessStateUpdate:].cold.1(a1, v8, v9);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "didCompleteUpdateToState:forEvents:abortedEvents:", v10, 0, 0);

    }
  }
}

void __45__BLSHXPCBacklightProxyHost_beginObservation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BE80CF8], "descriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValues:", 1);
    objc_msgSend(v3, "setStateDescriptor:", v5);
    objc_msgSend(MEMORY[0x24BE80CD8], "predicateMatchingTarget:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPredicates:", v7);

    objc_msgSend(v3, "setUpdateHandler:", *(_QWORD *)(a1 + 40));
  }

}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvents:(id)a5 abortedEvents:(id)a6
{
  id v9;
  id v10;
  char v11;
  _BOOL4 lock_clientIsTaskScheduled;
  BLSXPCBacklightProxyClientInterface *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  int clientPid;
  void *v18;
  void *v19;
  int v20;
  BLSHXPCBacklightProxyHost *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  if (-[BLSHXPCBacklightProxyHost isValid]((os_unfair_lock_s *)self))
  {
    os_unfair_lock_lock(&self->_lock);
    v11 = -[BLSXPCBacklightProxyObserverMask isObservingEventsArray](self->_lock_observingMask, "isObservingEventsArray");
    lock_clientIsTaskScheduled = self->_lock_clientIsTaskScheduled;
    v13 = self->_lock_observingClient;
    if (lock_clientIsTaskScheduled)
    {
      os_unfair_lock_unlock(&self->_lock);
      if ((v11 & 1) == 0)
      {
        if (v9)
        {
          objc_msgSend(v9, "firstObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v28[0] = v14;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
          v15 = objc_claimAutoreleasedReturnValue();

          v9 = (id)v15;
        }

        v10 = 0;
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
      v16 = objc_claimAutoreleasedReturnValue();
      -[BLSXPCBacklightProxyClientInterface didCompleteUpdateToState:forEvents:abortedEvents:](v13, "didCompleteUpdateToState:forEvents:abortedEvents:", v16, v9, v10);
    }
    else
    {
      self->_lock_stateIsStale = 1;
      os_unfair_lock_unlock(&self->_lock);
      bls_backlight_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        clientPid = self->_clientPid;
        NSStringFromBLSBacklightState();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromBLSBacklightChangeEvents();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 134218754;
        v21 = self;
        v22 = 1024;
        v23 = clientPid;
        v24 = 2114;
        v25 = v18;
        v26 = 2114;
        v27 = v19;
        _os_log_debug_impl(&dword_2145AC000, v16, OS_LOG_TYPE_DEBUG, "%p client not running pid:%d will not notify backlight update to state:%{public}@ events:%{public}@", (uint8_t *)&v20, 0x26u);

      }
    }

  }
}

- (void)backlight:(id)a3 didChangeAlwaysOnEnabled:(BOOL)a4
{
  _BOOL8 v4;
  os_unfair_lock_s *p_lock;
  BLSXPCBacklightProxyClientInterface *v7;
  id v8;

  v4 = a4;
  if (-[BLSHXPCBacklightProxyHost isValid]((os_unfair_lock_s *)self))
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v7 = self->_lock_observingClient;
    os_unfair_lock_unlock(p_lock);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[BLSXPCBacklightProxyClientInterface didChangeAlwaysOnEnabled:](v7, "didChangeAlwaysOnEnabled:", v8);

  }
}

- (BOOL)observesActivation
{
  os_unfair_lock_s *p_lock;
  char v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_valid)
    v4 = -[BLSXPCBacklightProxyObserverMask isObservingActivatingWithEvent](self->_lock_observingMask, "isObservingActivatingWithEvent");
  else
    v4 = 0;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)backlight:(id)a3 activatingWithEvent:(id)a4
{
  -[BLSHXPCBacklightProxyHost observePerformingEvent:]((uint64_t)self, a4);
}

- (void)observePerformingEvent:(uint64_t)a1
{
  os_unfair_lock_s *v3;
  int v4;
  id v5;
  id v6;

  v6 = a2;
  if (a1)
  {
    v3 = (os_unfair_lock_s *)(a1 + 48);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(unsigned __int8 *)(a1 + 54);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    if (v4)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
      v5 = *(id *)(a1 + 16);
      os_unfair_lock_unlock(v3);
      objc_msgSend(v5, "performingEvent:", v6);

    }
  }

}

- (BOOL)observesDeactivation
{
  os_unfair_lock_s *p_lock;
  char v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_valid)
    v4 = -[BLSXPCBacklightProxyObserverMask isObservingDeactivatingWithEvent](self->_lock_observingMask, "isObservingDeactivatingWithEvent");
  else
    v4 = 0;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)backlight:(id)a3 deactivatingWithEvent:(id)a4
{
  -[BLSHXPCBacklightProxyHost observePerformingEvent:]((uint64_t)self, a4);
}

- (BOOL)observesPerformingAllEvents
{
  os_unfair_lock_s *p_lock;
  char v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_valid)
    v4 = -[BLSXPCBacklightProxyObserverMask isObservingPerformingEvent](self->_lock_observingMask, "isObservingPerformingEvent");
  else
    v4 = 0;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)backlight:(id)a3 performingEvent:(id)a4
{
  -[BLSHXPCBacklightProxyHost observePerformingEvent:]((uint64_t)self, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_observingMask, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_lock_observingClient, 0);
  objc_storeStrong((id *)&self->_localBacklightProxy, 0);
}

- (void)performChangeRequest:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_6(&dword_2145AC000, v0, v1, "%{public}@: no entitlement %@ pid:%d");
  OUTLINED_FUNCTION_2_2();
}

- (void)performChangeRequest:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_6(&dword_2145AC000, v0, v1, "%{public}@: no entitlement %@ pid:%d");
  OUTLINED_FUNCTION_2_2();
}

- (void)performChangeRequest:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_6(&dword_2145AC000, v0, v1, "%{public}@: no entitlement %@ pid:%d");
  OUTLINED_FUNCTION_2_2();
}

- (void)performChangeRequest:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a1 + 40);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_2145AC000, a2, OS_LOG_TYPE_ERROR, "proxy is invalid for pid:%d", (uint8_t *)v3, 8u);
}

- (void)nowObservingWithMask:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_6_3(&dword_2145AC000, v0, v1, "Observing performing all events requires entitlement %@ pid:%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)nowObservingWithMask:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_6_3(&dword_2145AC000, v0, v1, "Observing activating/deactivating requires entitlement %@ pid:%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)beginObservation
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_2_3(&dword_2145AC000, v0, v1, "%p already observing from pid:%d", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_2();
}

- (void)clientProcessStateUpdate:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = *(_DWORD *)(a1 + 40);
  NSStringFromBLSBacklightState();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218498;
  v8 = a1;
  v9 = 1024;
  v10 = v5;
  v11 = 2114;
  v12 = v6;
  _os_log_debug_impl(&dword_2145AC000, a3, OS_LOG_TYPE_DEBUG, "%p client now running pid:%d update to backlight state:%{public}@", (uint8_t *)&v7, 0x1Cu);

}

@end

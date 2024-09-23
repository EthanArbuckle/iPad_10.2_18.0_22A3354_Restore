@implementation BKSMousePointerService

void __51__BKSMousePointerService_addPointerDeviceObserver___block_invoke(uint64_t a1, void *a2)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v4;
  id v5;

  v5 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 4);
    -[os_unfair_lock_s _locked_setMousePointerDeviceObservationEnabled:](v4, "_locked_setMousePointerDeviceObservationEnabled:", objc_msgSend(v5, "isActive"));
    os_unfair_lock_unlock(v4 + 4);
  }

}

- (void)_locked_updateServerWithPointerDeviceObservationState
{
  _BOOL8 isObservingDeviceConnection;
  void *v4;
  void *v5;
  id v6;

  os_unfair_lock_assert_owner(&self->_lock);
  isObservingDeviceConnection = self->_isObservingDeviceConnection;
  -[BKSMousePointerService _locked_serverTarget](self, "_locked_serverTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", isObservingDeviceConnection);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMousePointerDeviceObservationEnabled:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (isObservingDeviceConnection)
    -[BKSMousePointerService _locked_pointingDevicesDidChange:](self, "_locked_pointingDevicesDidChange:", v6);

}

- (void)_locked_setMousePointerDeviceObservationEnabled:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_isObservingDeviceConnection != v3)
  {
    self->_isObservingDeviceConnection = v3;
    -[BKSMousePointerService _locked_updateServerWithPointerDeviceObservationState](self, "_locked_updateServerWithPointerDeviceObservationState");
  }
}

- (id)_locked_serverTarget
{
  os_unfair_lock_assert_owner(&self->_lock);
  return (id)-[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
}

void __40__BKSMousePointerService_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[BKSMousePointerService _init]([BKSMousePointerService alloc], "_init");
  v1 = (void *)sharedInstance_service_3710;
  sharedInstance_service_3710 = (uint64_t)v0;

}

- (id)_init
{
  BKSMousePointerService *v2;
  BKSMousePointerService *v3;
  void *v4;
  uint64_t v5;
  OS_dispatch_queue *connectionQueue;
  void *v7;
  BKSMousePointerService *v8;
  uint64_t v9;
  BSCompoundAssertion *suppressMouseEvents;
  BSCompoundAssertion *v11;
  void *v12;
  _QWORD v14[4];
  BKSMousePointerService *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)BKSMousePointerService;
  v2 = -[BKSMousePointerService init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0D01760], "serial");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = BSDispatchQueueCreate();
    connectionQueue = v3->_connectionQueue;
    v3->_connectionQueue = (OS_dispatch_queue *)v5;

    v7 = (void *)MEMORY[0x1E0D01718];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __31__BKSMousePointerService__init__block_invoke;
    v14[3] = &unk_1E1EA0698;
    v8 = v3;
    v15 = v8;
    objc_msgSend(v7, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("suppressAllMouseEvents"), v14);
    v9 = objc_claimAutoreleasedReturnValue();
    suppressMouseEvents = v8->_suppressMouseEvents;
    v8->_suppressMouseEvents = (BSCompoundAssertion *)v9;

    v11 = v8->_suppressMouseEvents;
    BKLogMousePointer();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSCompoundAssertion setLog:](v11, "setLog:", v12);

    -[BKSMousePointerService _activateServerConnection](v8, "_activateServerConnection");
  }
  return v3;
}

- (void)_locked_pointingDevicesDidChange:(id)a3
{
  id v4;
  NSSet *v5;
  NSSet *attachedDevices;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = (NSSet *)objc_msgSend(v4, "copy");
  attachedDevices = self->_attachedDevices;
  self->_attachedDevices = v5;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[BSCompoundAssertion context](self->_deviceConnectionObservers, "context", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[BKSMousePointerService _locked_updateObserver:withPointingDevices:](self, "_locked_updateObserver:withPointingDevices:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), v4);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (id)addPointerDeviceObserver:(id)a3
{
  id v4;
  void *v5;
  BSCompoundAssertion *v6;
  BSCompoundAssertion *deviceConnectionObservers;
  BKSMousePointerDeviceObserverInfo *v8;
  BSCompoundAssertion *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id location;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_deviceConnectionObservers)
  {
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x1E0D01718];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __51__BKSMousePointerService_addPointerDeviceObserver___block_invoke;
    v13[3] = &unk_1E1EA0738;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v5, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("mouse-device-observers"), v13);
    v6 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
    deviceConnectionObservers = self->_deviceConnectionObservers;
    self->_deviceConnectionObservers = v6;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  v8 = objc_alloc_init(BKSMousePointerDeviceObserverInfo);
  -[BKSMousePointerDeviceObserverInfo setObserver:](v8, "setObserver:", v4);
  -[BKSMousePointerService _locked_updateObserver:withPointingDevices:](self, "_locked_updateObserver:withPointingDevices:", v8, self->_attachedDevices);
  os_unfair_lock_unlock(&self->_lock);
  v9 = self->_deviceConnectionObservers;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSCompoundAssertion acquireForReason:withContext:](v9, "acquireForReason:withContext:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_locked_updateObserver:(id)a3 withPointingDevices:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(v19, "visibleDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v8, "minusSet:", v7);
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v19, "observer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      objc_msgSend(v19, "observer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "mousePointerDevicesDidConnect:", v8);

    }
  }
  v12 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v12, "minusSet:", v6);
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v19, "observer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      objc_msgSend(v19, "observer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "mousePointerDevicesDidDisconnect:", v12);

    }
  }
  objc_msgSend(v19, "observer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    objc_msgSend(v19, "observer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "mousePointerDevicesDidChange:", v6);

  }
  objc_msgSend(v19, "setVisibleDevices:", v6);

}

void __51__BKSMousePointerService__activateServerConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = a2;
  +[BKSMousePointerServiceSessionSpecification serviceQuality](BKSMousePointerServiceSessionSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[BKSMousePointerServiceSessionSpecification interface](BKSMousePointerServiceSessionSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__BKSMousePointerService__activateServerConnection__block_invoke_2;
  v6[3] = &unk_1E1EA1800;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "setInterruptionHandler:", v6);
  objc_msgSend(v3, "setInvalidationHandler:", &__block_literal_global_113);

}

- (void)_activateServerConnection
{
  os_unfair_lock_s *p_lock;
  void *v4;
  BSServiceConnection *v5;
  BSServiceConnection *connection;
  BSServiceConnection *v7;
  NSObject *v8;
  BSServiceConnection *v9;
  BSServiceConnection *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  BSServiceConnection *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  +[BKSMousePointerServiceSessionSpecification identifier](BKSMousePointerServiceSessionSpecification, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[BKSHIDServiceConnection clientConnectionForServiceWithName:](BKSHIDServiceConnection, "clientConnectionForServiceWithName:", v4);
  v5 = (BSServiceConnection *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  self->_connection = v5;

  v7 = self->_connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__BKSMousePointerService__activateServerConnection__block_invoke;
  v11[3] = &unk_1E1EA1868;
  v11[4] = self;
  -[BSServiceConnection configureConnection:](v7, "configureConnection:", v11);
  BKLogMousePointer();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_connection;
    *(_DWORD *)buf = 138543362;
    v13 = v9;
    _os_log_impl(&dword_18A0F0000, v8, OS_LOG_TYPE_DEFAULT, "Activating Connection: %{public}@", buf, 0xCu);
  }

  v10 = self->_connection;
  os_unfair_lock_unlock(p_lock);
  -[BSServiceConnection activate](v10, "activate");

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3708 != -1)
    dispatch_once(&sharedInstance_onceToken_3708, &__block_literal_global_3709);
  return (id)sharedInstance_service_3710;
}

- (BKSMousePointerService)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSMousePointerService *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSMousePointerService *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init is unsupported -- use +sharedInstance instead"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("BKSMousePointerService.m");
    v17 = 1024;
    v18 = 93;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSMousePointerService *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)dealloc
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSMousePointerService *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_connection)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Must be invalidated before deallocation"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v10 = v5;
      v11 = 2114;
      v12 = v7;
      v13 = 2048;
      v14 = self;
      v15 = 2114;
      v16 = CFSTR("BKSMousePointerService.m");
      v17 = 1024;
      v18 = 127;
      v19 = 2114;
      v20 = v4;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A1229A0);
  }
  v8.receiver = self;
  v8.super_class = (Class)BKSMousePointerService;
  -[BKSMousePointerService dealloc](&v8, sel_dealloc);
}

- (CGPoint)globalPointerPosition
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[BKSMousePointerService _unlocked_serverTarget](self, "_unlocked_serverTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "globalPointerPosition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "bs_CGPointValue");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)normalizedGlobalPointerPosition
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[BKSMousePointerService _unlocked_serverTarget](self, "_unlocked_serverTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "normalizedGlobalPointerPosition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "bs_CGPointValue");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)setGlobalPointerPosition:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  id v6;

  y = a3.y;
  x = a3.x;
  -[BKSMousePointerService _unlocked_serverTarget](self, "_unlocked_serverTarget");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGPoint:", x, y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGlobalPointerPosition:", v5);

}

- (void)setPointerPosition:(CGPoint)a3 onDisplay:(id)a4 withAnimationParameters:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  id v12;

  y = a3.y;
  x = a3.x;
  v9 = a5;
  v10 = a4;
  -[BKSMousePointerService _unlocked_serverTarget](self, "_unlocked_serverTarget");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGPoint:", x, y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPointerPosition:onDisplay:withAnimationParameters:", v11, v10, v9);

}

- (void)setContextRelativePointerPosition:(id)a3 onDisplay:(id)a4 withAnimationParameters:(id)a5 restrictingToPID:(int)a6
{
  uint64_t v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v6 = *(_QWORD *)&a6;
  v14 = a3;
  v10 = a4;
  v11 = a5;
  if ((v6 & 0x80000000) != 0)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BKSMousePointerService _unlocked_serverTarget](self, "_unlocked_serverTarget");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContextRelativePointerPosition:onDisplay:withAnimationParameters:restrictingToPID:", v14, v10, v11, v12);

}

- (void)setContextRelativePointerPosition:(id)a3 withInitialVelocity:(id)a4 onDisplay:(id)a5 withDecelerationRate:(double)a6 restrictingToPID:(int)a7
{
  uint64_t v7;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v7 = *(_QWORD *)&a7;
  v17 = a3;
  v12 = a4;
  v13 = a5;
  if ((v7 & 0x80000000) != 0)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BKSMousePointerService _unlocked_serverTarget](self, "_unlocked_serverTarget");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setContextRelativePointerPosition:withInitialVelocity:onDisplay:withDecelerationRate:restrictingToPID:", v17, v12, v13, v16, v14);

}

- (id)acquireButtonDownPointerRepositionAssertionForReason:(id)a3 contextRelativePointerPosition:(id)a4 onDisplay:(id)a5 restrictingToPID:(int)a6
{
  uint64_t v6;
  id v11;
  id v12;
  id v13;
  void *v14;
  os_unfair_lock_s *p_lock;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  _BYTE location[12];
  __int16 v33;
  void *v34;
  __int16 v35;
  BKSMousePointerService *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v6 = *(_QWORD *)&a6;
  v43 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("point != ((void *)0)"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138544642;
      *(_QWORD *)&location[4] = v25;
      v33 = 2114;
      v34 = v27;
      v35 = 2048;
      v36 = self;
      v37 = 2114;
      v38 = CFSTR("BKSMousePointerService.m");
      v39 = 1024;
      v40 = 168;
      v41 = 2114;
      v42 = v24;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", location, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A122FC4);
  }
  v14 = v13;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)location, self);
  v17 = objc_alloc(MEMORY[0x1E0D01868]);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __137__BKSMousePointerService_acquireButtonDownPointerRepositionAssertionForReason_contextRelativePointerPosition_onDisplay_restrictingToPID___block_invoke;
  v28[3] = &unk_1E1EA06C0;
  objc_copyWeak(&v31, (id *)location);
  v18 = v16;
  v29 = v18;
  v19 = v14;
  v30 = v19;
  v20 = (void *)objc_msgSend(v17, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("BKSMousePointerService.buttonDownReposition"), v11, v28);
  if ((v6 & 0x80000000) != 0)
  {
    v21 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BKSMousePointerService _locked_serverTarget](self, "_locked_serverTarget");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "acquireButtonDownPointerRepositionAssertionWithUniqueIdentifier:forReason:contextRelativePointerPosition:onDisplay:restrictingToPID:", v18, v11, v12, v19, v21);

  os_unfair_lock_unlock(p_lock);
  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)location);

  return v20;
}

- (id)pointerSuppressionAssertionOnDisplay:(id)a3 forReason:(id)a4 withOptionsMask:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BKSMousePointerSuppressionAssertionDescriptor *v20;
  void *v21;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  BKSMousePointerService *v31;
  __CFString *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  BKSMousePointerService *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Suppression Options must suppress something"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v34 = v24;
      v35 = 2114;
      v36 = v26;
      v37 = 2048;
      v38 = self;
      v39 = 2114;
      v40 = CFSTR("BKSMousePointerService.m");
      v41 = 1024;
      v42 = 188;
      v43 = 2114;
      v44 = v23;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A1232B4);
  }
  v11 = v10;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v12 = (__CFString *)v9;
  v13 = -[__CFString length](v12, "length");
  v14 = CFSTR("<main>");
  if (v13)
    v14 = v12;
  v15 = v14;

  -[BKSMousePointerService _locked_infoForDisplayUUID:createIfNeeded:](self, "_locked_infoForDisplayUUID:createIfNeeded:", v15, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pointerSuppressionAssertion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v18 = (void *)MEMORY[0x1E0D01718];
    objc_msgSend(CFSTR("mouse-pointer-suppression:"), "stringByAppendingString:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __89__BKSMousePointerService_pointerSuppressionAssertionOnDisplay_forReason_withOptionsMask___block_invoke;
    v30 = &unk_1E1EA06E8;
    v31 = self;
    v32 = v15;
    objc_msgSend(v18, "assertionWithIdentifier:stateDidChangeHandler:", v19, &v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setPointerSuppressionAssertion:", v17, v27, v28, v29, v30, v31);
  }
  v20 = objc_alloc_init(BKSMousePointerSuppressionAssertionDescriptor);
  -[BKSMousePointerSuppressionAssertionDescriptor setSuppressionOptions:](v20, "setSuppressionOptions:", a5);
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v17, "acquireForReason:withContext:", v11, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)requestGlobalMouseEventsForDisplay:(id)a3 targetContextID:(unsigned int)a4
{
  return -[BKSMousePointerService requestGlobalMouseEventsForDisplay:targetContextID:options:](self, "requestGlobalMouseEventsForDisplay:targetContextID:options:", a3, *(_QWORD *)&a4, 0);
}

- (id)suppressPointerEventsForReason:(id)a3
{
  return (id)-[BSCompoundAssertion acquireForReason:](self->_suppressMouseEvents, "acquireForReason:", a3);
}

- (id)requestGlobalMouseEventsForDisplay:(id)a3 targetContextID:(unsigned int)a4 options:(id)a5
{
  uint64_t v6;
  id v9;
  id v10;
  void *v11;
  os_unfair_lock_s *p_lock;
  __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, void *);
  void *v34;
  id v35;
  int v36;
  _QWORD v37[5];
  __CFString *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  BKSMousePointerService *v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v6 = *(_QWORD *)&a4;
  v51 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!(_DWORD)v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("contextID != 0"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v40 = v28;
      v41 = 2114;
      v42 = v30;
      v43 = 2048;
      v44 = self;
      v45 = 2114;
      v46 = CFSTR("BKSMousePointerService.m");
      v47 = 1024;
      v48 = 227;
      v49 = 2114;
      v50 = v27;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A1235F0);
  }
  v11 = v10;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v13 = (__CFString *)v9;
  v14 = -[__CFString length](v13, "length");
  v15 = CFSTR("<main>");
  if (v14)
    v15 = v13;
  v16 = v15;

  -[BKSMousePointerService _locked_infoForDisplayUUID:createIfNeeded:](self, "_locked_infoForDisplayUUID:createIfNeeded:", v16, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "globalEventsAssertion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  if (!v18)
  {
    v20 = (void *)MEMORY[0x1E0D01718];
    objc_msgSend(CFSTR("global-events:"), "stringByAppendingString:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v19;
    v37[1] = 3221225472;
    v37[2] = __85__BKSMousePointerService_requestGlobalMouseEventsForDisplay_targetContextID_options___block_invoke;
    v37[3] = &unk_1E1EA06E8;
    v37[4] = self;
    v38 = v16;
    objc_msgSend(v20, "assertionWithIdentifier:stateDidChangeHandler:", v21, v37);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setGlobalEventsAssertion:", v18);
  }
  v31 = v19;
  v32 = 3221225472;
  v33 = __85__BKSMousePointerService_requestGlobalMouseEventsForDisplay_targetContextID_options___block_invoke_2;
  v34 = &unk_1E1EA0710;
  v36 = v6;
  v35 = v11;
  v22 = v11;
  +[BKSMousePointerEventGlobalRoute build:](BKSMousePointerEventGlobalRoute, "build:", &v31);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("display:%@ context:%X"), v16, v6, v31, v32, v33, v34);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "acquireForReason:withContext:", v24, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (void)getHitTestContextsAtPoint:(id)a3 withAdditionalContexts:(id)a4 onDisplay:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[BKSMousePointerService _unlocked_serverTarget](self, "_unlocked_serverTarget");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "getHitTestContextsAtPoint:withAdditionalContexts:onDisplay:withCompletion:", v13, v12, v11, v10);

}

- (BKSMousePointerDevicePreferences)globalDevicePreferences
{
  void *v2;
  void *v3;

  -[BKSMousePointerService _unlocked_serverTarget](self, "_unlocked_serverTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "globalDevicePreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BKSMousePointerDevicePreferences *)v3;
}

- (void)setGlobalDevicePreferences:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BKSMousePointerService _unlocked_serverTarget](self, "_unlocked_serverTarget");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGlobalDevicePreferences:", v4);

}

- (id)addPointerPreferencesObserver:(id)a3
{
  id v4;
  void *v5;
  BSCompoundAssertion *v6;
  BSCompoundAssertion *preferencesObservers;
  BKSMousePointerPreferencesObserverInfo *v8;
  BSCompoundAssertion *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id location;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_preferencesObservers)
  {
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x1E0D01718];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__BKSMousePointerService_addPointerPreferencesObserver___block_invoke;
    v13[3] = &unk_1E1EA0738;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v5, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("preferences-observers"), v13);
    v6 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
    preferencesObservers = self->_preferencesObservers;
    self->_preferencesObservers = v6;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  os_unfair_lock_unlock(&self->_lock);
  v8 = objc_alloc_init(BKSMousePointerPreferencesObserverInfo);
  -[BKSMousePointerPreferencesObserverInfo setObserver:](v8, "setObserver:", v4);
  v9 = self->_preferencesObservers;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSCompoundAssertion acquireForReason:withContext:](v9, "acquireForReason:withContext:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)preferencesForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[BKSMousePointerService _unlocked_serverTarget](self, "_unlocked_serverTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferencesForDevice:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setPreferences:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[BKSMousePointerService _unlocked_serverTarget](self, "_unlocked_serverTarget");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreferences:forDevice:", v7, v6);

}

- (id)_unlocked_serverTarget
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_locked_updateServerWithPreferencesObservationState
{
  void *v3;
  id v4;

  os_unfair_lock_assert_owner(&self->_lock);
  -[BKSMousePointerService _locked_serverTarget](self, "_locked_serverTarget");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isObservingPreferences);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMousePointerPreferenceObservationEnabled:", v3);

}

- (void)_locked_setMousePointerPreferencesObservationEnabled:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_isObservingPreferences != v3)
  {
    self->_isObservingPreferences = v3;
    -[BKSMousePointerService _locked_updateServerWithPreferencesObservationState](self, "_locked_updateServerWithPreferencesObservationState");
  }
}

- (id)_locked_infoForDisplayUUID:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  BKSMousePointerPerDisplayInfo *v7;
  BOOL v8;
  NSMutableDictionary *displayUUIDToPerDisplayInfo;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;

  v4 = a4;
  v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_displayUUIDToPerDisplayInfo, "objectForKeyedSubscript:", v6);
  v7 = (BKSMousePointerPerDisplayInfo *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = 1;
  else
    v8 = !v4;
  if (!v8)
  {
    v7 = objc_alloc_init(BKSMousePointerPerDisplayInfo);
    displayUUIDToPerDisplayInfo = self->_displayUUIDToPerDisplayInfo;
    if (!displayUUIDToPerDisplayInfo)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v11 = self->_displayUUIDToPerDisplayInfo;
      self->_displayUUIDToPerDisplayInfo = v10;

      displayUUIDToPerDisplayInfo = self->_displayUUIDToPerDisplayInfo;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](displayUUIDToPerDisplayInfo, "setObject:forKeyedSubscript:", v7, v6);
  }

  return v7;
}

- (void)_locked_sendCurrentAssertionParameters:(id)a3 forDisplayUUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  objc_msgSend(a3, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_reduce:block:", &unk_1E1EBC4B8, &__block_literal_global_106);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[BKSMousePointerService _locked_serverTarget](self, "_locked_serverTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applyAssertionParametersOnDisplay:withOptionsMask:", v6, v9);

}

- (void)_locked_updateEventRoutesFromContext:(id)a3 forDisplayUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[BKSMousePointerService _locked_serverTarget](self, "_locked_serverTarget");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setGlobalPointerEventRoutes:forDisplay:", v8, v6);
}

- (void)_locked_reactivateConnection
{
  NSMutableDictionary *displayUUIDToPerDisplayInfo;
  _QWORD v4[5];

  os_unfair_lock_assert_owner(&self->_lock);
  displayUUIDToPerDisplayInfo = self->_displayUUIDToPerDisplayInfo;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__BKSMousePointerService__locked_reactivateConnection__block_invoke;
  v4[3] = &unk_1E1EA0780;
  v4[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](displayUUIDToPerDisplayInfo, "enumerateKeysAndObjectsUsingBlock:", v4);
  -[BKSMousePointerService _locked_updateServerWithPointerDeviceObservationState](self, "_locked_updateServerWithPointerDeviceObservationState");
  -[BKSMousePointerService _locked_updateServerWithPreferencesObservationState](self, "_locked_updateServerWithPreferencesObservationState");
}

- (void)pointingDevicesDidChange:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  -[BKSMousePointerService _locked_pointingDevicesDidChange:](self, "_locked_pointingDevicesDidChange:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)pointerGlobalDevicePreferencesDidChange:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  -[BSCompoundAssertion context](self->_preferencesObservers, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  os_unfair_lock_unlock(p_lock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "observer", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "mousePointerGlobalDevicePreferencesDidChange:", v4);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachedDevices, 0);
  objc_storeStrong((id *)&self->_suppressMouseEvents, 0);
  objc_storeStrong((id *)&self->_preferencesObservers, 0);
  objc_storeStrong((id *)&self->_deviceConnectionObservers, 0);
  objc_storeStrong((id *)&self->_displayUUIDToPerDisplayInfo, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

void __51__BKSMousePointerService__activateServerConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  BKLogMousePointer();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_18A0F0000, v4, OS_LOG_TYPE_DEFAULT, "Received interruption for connection: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_locked_pointingDevicesDidChange:", v6);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v3, "activate");
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(a1 + 32), "_locked_reactivateConnection");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));

}

void __51__BKSMousePointerService__activateServerConnection__block_invoke_112(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  BKLogMousePointer();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_18A0F0000, v3, OS_LOG_TYPE_DEFAULT, "Received invalidation for connection: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __54__BKSMousePointerService__locked_reactivateConnection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(v5, "pointerSuppressionAssertion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "_locked_sendCurrentAssertionParameters:forDisplayUUID:", v6, v8);
  objc_msgSend(v5, "globalEventsAssertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "_locked_updateEventRoutesFromContext:forDisplayUUID:", v7, v8);

}

uint64_t __80__BKSMousePointerService__locked_sendCurrentAssertionParameters_forDisplayUUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  v6 = objc_msgSend(a2, "unsignedIntegerValue");
  v7 = objc_msgSend(v5, "suppressionOptions");

  return objc_msgSend(v4, "numberWithUnsignedInteger:", v7 | v6);
}

void __56__BKSMousePointerService_addPointerPreferencesObserver___block_invoke(uint64_t a1, void *a2)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v4;
  id v5;

  v5 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 4);
    -[os_unfair_lock_s _locked_setMousePointerPreferencesObservationEnabled:](v4, "_locked_setMousePointerPreferencesObservationEnabled:", objc_msgSend(v5, "isActive"));
    os_unfair_lock_unlock(v4 + 4);
  }

}

void __85__BKSMousePointerService_requestGlobalMouseEventsForDisplay_targetContextID_options___block_invoke(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;

  v3 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = a2;
  os_unfair_lock_lock(v3);
  objc_msgSend(*(id *)(a1 + 32), "_locked_updateEventRoutesFromContext:forDisplayUUID:", v4, *(_QWORD *)(a1 + 40));

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
}

void __85__BKSMousePointerService_requestGlobalMouseEventsForDisplay_targetContextID_options___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned int *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setContextID:", v3);
  objc_msgSend(v4, "setOptions:", *(_QWORD *)(a1 + 32));

}

void __89__BKSMousePointerService_pointerSuppressionAssertionOnDisplay_forReason_withOptionsMask___block_invoke(uint64_t a1, void *a2)
{
  const os_unfair_lock *v3;
  id v4;

  v3 = (const os_unfair_lock *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = a2;
  os_unfair_lock_assert_not_owner(v3);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(a1 + 32), "_locked_sendCurrentAssertionParameters:forDisplayUUID:", v4, *(_QWORD *)(a1 + 40));

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
}

void __137__BKSMousePointerService_acquireButtonDownPointerRepositionAssertionForReason_contextRelativePointerPosition_onDisplay_restrictingToPID___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_unlocked_serverTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateButtonDownPointerRepositionAssertionWithUniqueIdentifier:onDisplay:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __31__BKSMousePointerService__init__block_invoke(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = a2;
  os_unfair_lock_lock(v3);
  objc_msgSend(*(id *)(a1 + 32), "_locked_serverTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend(v4, "isActive");

  objc_msgSend(v6, "numberWithBool:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSuppressAllEvents:", v8);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
}

+ (id)new
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("+new is unsupported -- use +sharedInstance instead"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = a1;
    v15 = 2114;
    v16 = CFSTR("BKSMousePointerService.m");
    v17 = 1024;
    v18 = 88;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (BOOL)supportsReadyToReceiveEventServiceProperty
{
  return 1;
}

@end

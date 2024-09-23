@implementation CARSessionStatus

uint64_t __36__CARSessionStatus_initWithOptions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSession");
}

- (CARSessionStatus)init
{
  return -[CARSessionStatus initWithOptions:](self, "initWithOptions:", 0);
}

uint64_t __48__CARSessionStatus_waitForSessionInitialization__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSession");
}

- (void)waitForSessionInitialization
{
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend((id)objc_opt_class(), "sessionUpdatesQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CARSessionStatus_waitForSessionInitialization__block_invoke;
  block[3] = &unk_1E5427E58;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (CARSession)currentSession
{
  void *v2;
  id v3;

  -[CARSessionStatus session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_sessionReady"))
    v3 = v2;
  else
    v3 = 0;

  return (CARSession *)v3;
}

- (void)_updateSession
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[CARSessionStatus session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "endpoint");

  FigEndpointCopyActiveCarPlayEndpoint();
  if (v4)
  {
    -[CARSessionStatus _stopConnectingTimer](self, "_stopConnectingTimer");
    -[CARSessionStatus session](self, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CARSessionStatus setSession:](self, "setSession:", 0);
    if (objc_msgSend(v5, "_sessionReady"))
      -[CARSessionStatus _notifyDidDisconnectSession:](self, "_notifyDidDisconnectSession:", v5);

  }
}

- (CARSession)session
{
  return self->_session;
}

- (void)addSessionObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CARSessionStatus sessionObservers](self, "sessionObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (CARObserverHashTable)sessionObservers
{
  return self->_sessionObservers;
}

void __39__CARSessionStatus_sessionUpdatesQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.CarKit.CARSessionStatus", attr);
  v2 = (void *)sessionUpdatesQueue___updatesQueue;
  sessionUpdatesQueue___updatesQueue = (uint64_t)v1;

}

- (CARSessionStatus)initWithOptions:(unint64_t)a3
{
  CARSessionStatus *v4;
  CARSessionStatus *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  CARObserverHashTable *v10;
  void *v11;
  CARObserverHashTable *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v18;
  __CFNotificationCenter *v19;
  NSObject *v20;
  CARSessionStatus *v21;
  __CFNotificationCenter *v22;
  _QWORD block[4];
  CARSessionStatus *v25;
  _QWORD handler[4];
  id v27;
  id location;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)CARSessionStatus;
  v4 = -[CARSessionStatus init](&v29, sel_init);
  v5 = v4;
  if (v4)
  {
    -[CARSessionStatus setSession:](v4, "setSession:", 0);
    -[CARSessionStatus setTimeoutInterval:](v5, "setTimeoutInterval:", 30);
    objc_msgSend((id)objc_opt_class(), "sessionUpdatesQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v6);

    objc_initWeak(&location, v5);
    v8 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __36__CARSessionStatus_initWithOptions___block_invoke;
    handler[3] = &unk_1E5428130;
    objc_copyWeak(&v27, &location);
    dispatch_source_set_event_handler(v7, handler);
    -[CARSessionStatus setConnectingTimer:](v5, "setConnectingTimer:", v7);
    dispatch_activate(v7);
    +[CARSessionChangedNotificationConverter sharedInstance](CARSessionChangedNotificationConverter, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CARSessionStatus setNotificationConverter:](v5, "setNotificationConverter:", v9);

    v10 = [CARObserverHashTable alloc];
    objc_msgSend((id)objc_opt_class(), "sessionUpdatesQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CARObserverHashTable initWithProtocol:callbackQueue:](v10, "initWithProtocol:callbackQueue:", &unk_1EE9AC850, v11);
    -[CARSessionStatus setSessionObservers:](v5, "setSessionObservers:", v12);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v5, sel__handleAuthenticationSucceeded_, CFSTR("CARSessionAuthenticationSucceededNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v5, sel__handleEndpointActivated_, CFSTR("CARSessionEndpointActivatedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v5, sel__handleSessionChanged, CFSTR("CARSessionStatusChangedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v5, sel__handleSessionChanged, CFSTR("CARSessionServerConnectionDiedNotification"), 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)CRSessionStatusInCarNotificationCallback, CFSTR("com.apple.carplay.in-car"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v18 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v18, v5, (CFNotificationCallback)CRSessionStatusStartingWiredConnectionNotificationCallback, CFSTR("com.apple.carplay.starting-wired-connection"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v19 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v19, v5, (CFNotificationCallback)CRSessionStatusAccessoryUpdatedNotificationCallback, CFSTR("CARSessionAccessoryUpdatedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_msgSend((id)objc_opt_class(), "sessionUpdatesQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __36__CARSessionStatus_initWithOptions___block_invoke_2;
    block[3] = &unk_1E5427E58;
    v21 = v5;
    v25 = v21;
    dispatch_async(v20, block);

    v21->_sessionStatusOptions = a3;
    if ((a3 & 4) != 0)
    {
      v22 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v22, v21, (CFNotificationCallback)CRSessionStatusCapabilitiesUpdatedNotificationCallback, CFSTR("CARSessionCarCapabilitiesUpdatedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    if ((a3 & 1) != 0)
      -[CARSessionStatus waitForSessionInitialization](v21, "waitForSessionInitialization");

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);

  }
  return v5;
}

+ (id)sessionUpdatesQueue
{
  if (sessionUpdatesQueue_onceToken != -1)
    dispatch_once(&sessionUpdatesQueue_onceToken, &__block_literal_global_496);
  return (id)sessionUpdatesQueue___updatesQueue;
}

- (void)setTimeoutInterval:(unint64_t)a3
{
  self->_timeoutInterval = a3;
}

- (void)setSessionObservers:(id)a3
{
  objc_storeStrong((id *)&self->_sessionObservers, a3);
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void)setNotificationConverter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationConverter, a3);
}

- (void)setConnectingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_connectingTimer, a3);
}

void __36__CARSessionStatus_initWithOptions___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleConnectingTimeout");

}

- (id)initAndWaitUntilSessionUpdated
{
  return -[CARSessionStatus initWithOptions:](self, "initWithOptions:", 1);
}

- (id)initForCarPlayShell
{
  return -[CARSessionStatus initWithOptions:](self, "initWithOptions:", 30);
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)CARSessionStatus;
  -[CARSessionStatus dealloc](&v4, sel_dealloc);
}

- (void)setSessionObserver:(id)a3
{
  id WeakRetained;
  id v5;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sessionObserver);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_sessionObserver);
    -[CARSessionStatus removeSessionObserver:](self, "removeSessionObserver:", v5);

    objc_storeWeak((id *)&self->_sessionObserver, 0);
  }
  v6 = obj;
  if (obj)
  {
    objc_storeWeak((id *)&self->_sessionObserver, obj);
    -[CARSessionStatus addSessionObserver:](self, "addSessionObserver:", obj);
    v6 = obj;
  }

}

- (void)removeSessionObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CARSessionStatus sessionObservers](self, "sessionObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)_handleAuthenticationSucceeded:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  objc_msgSend((id)objc_opt_class(), "sessionUpdatesQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CARSessionStatus__handleAuthenticationSucceeded___block_invoke;
  block[3] = &unk_1E5427E58;
  block[4] = self;
  dispatch_async(v4, block);

}

void __51__CARSessionStatus__handleAuthenticationSucceeded___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;

  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAuthenticated");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setSession:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_updateSession");
  }
}

- (void)_handleEndpointActivated:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  objc_msgSend((id)objc_opt_class(), "sessionUpdatesQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CARSessionStatus__handleEndpointActivated___block_invoke;
  block[3] = &unk_1E5427E58;
  block[4] = self;
  dispatch_async(v4, block);

}

void __45__CARSessionStatus__handleEndpointActivated___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;

  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActivated");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setSession:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_updateSession");
  }
}

- (void)_handleInCarNotification
{
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend((id)objc_opt_class(), "sessionUpdatesQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CARSessionStatus__handleInCarNotification__block_invoke;
  block[3] = &unk_1E5427E58;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __44__CARSessionStatus__handleInCarNotification__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_notifyStartedConnectionAttemptOnTransport:", 3);
  return objc_msgSend(*(id *)(a1 + 32), "_startConnectingTimer");
}

- (void)_handleStartingWiredConnectionNotification
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend((id)objc_opt_class(), "sessionUpdatesQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__CARSessionStatus__handleStartingWiredConnectionNotification__block_invoke;
  v3[3] = &unk_1E5428130;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __62__CARSessionStatus__handleStartingWiredConnectionNotification__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notifyStartedConnectionAttemptOnTransport:", 1);
  objc_msgSend(WeakRetained, "_startConnectingTimer");

}

- (void)_handleSessionChanged
{
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend((id)objc_opt_class(), "sessionUpdatesQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CARSessionStatus__handleSessionChanged__block_invoke;
  block[3] = &unk_1E5427E58;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __41__CARSessionStatus__handleSessionChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSession");
}

- (void)_handleConfigurationUpdated
{
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend((id)objc_opt_class(), "sessionUpdatesQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CARSessionStatus__handleConfigurationUpdated__block_invoke;
  block[3] = &unk_1E5427E58;
  block[4] = self;
  dispatch_async(v3, block);

}

void __47__CARSessionStatus__handleConfigurationUpdated__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateConfiguration");

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_notifyDidUpdateSession:", v4);

  CarGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_DEFAULT, "Configuration updated for session %@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)_handleCarCapabilitiesUpdated
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend((id)objc_opt_class(), "sessionUpdatesQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__CARSessionStatus__handleCarCapabilitiesUpdated__block_invoke;
  v3[3] = &unk_1E5428130;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __49__CARSessionStatus__handleCarCapabilitiesUpdated__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateCarCapabilities");

  objc_msgSend(WeakRetained, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_notifyDidUpdateSession:", v3);

  CarGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = WeakRetained;
    _os_log_impl(&dword_1A83A2000, v4, OS_LOG_TYPE_DEFAULT, "CarCapabilities updated for session %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)_startConnectingTimer
{
  NSObject *v3;
  NSObject *v4;
  dispatch_time_t v5;
  uint8_t v6[16];

  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A83A2000, v3, OS_LOG_TYPE_INFO, "starting session connecting timeout", v6, 2u);
  }

  -[CARSessionStatus connectingTimer](self, "connectingTimer");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_time(0, 1000000000 * -[CARSessionStatus timeoutInterval](self, "timeoutInterval"));
  dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
  dispatch_activate(v4);

}

- (void)_stopConnectingTimer
{
  NSObject *v2;

  -[CARSessionStatus connectingTimer](self, "connectingTimer");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_source_cancel(v2);

}

- (void)_handleConnectingTimeout
{
  -[CARSessionStatus _stopConnectingTimer](self, "_stopConnectingTimer");
  -[CARSessionStatus _notifyCancelledConnectionAttemptOnTransport:](self, "_notifyCancelledConnectionAttemptOnTransport:", 3);
}

- (void)_notifyStartedConnectionAttemptOnTransport:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  CarGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    +[CARSessionConfiguration _descriptionForTransportType:](CARSessionConfiguration, "_descriptionForTransportType:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_DEFAULT, "attempting connection on transport %{public}@", (uint8_t *)&v8, 0xCu);

  }
  -[CARSessionStatus sessionObservers](self, "sessionObservers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startedConnectionAttemptOnTransport:", a3);

}

- (void)_notifyCancelledConnectionAttemptOnTransport:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  CarGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    +[CARSessionConfiguration _descriptionForTransportType:](CARSessionConfiguration, "_descriptionForTransportType:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_DEFAULT, "cancelled connection attempt on transport %{public}@", (uint8_t *)&v8, 0xCu);

  }
  -[CARSessionStatus sessionObservers](self, "sessionObservers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelledConnectionAttemptOnTransport:", a3);

}

- (void)_notifyDidConnectSession:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CarGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_DEFAULT, "connected session %@", (uint8_t *)&v7, 0xCu);
  }

  -[CARSessionStatus sessionObservers](self, "sessionObservers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sessionDidConnect:", v4);

}

- (void)_notifyDidDisconnectSession:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CarGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "_fig_safe_description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_DEFAULT, "disconnected session %@", (uint8_t *)&v8, 0xCu);

  }
  -[CARSessionStatus sessionObservers](self, "sessionObservers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sessionDidDisconnect:", v4);

}

- (void)_notifyDidUpdateSession:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CarGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_DEFAULT, "updated session %@", (uint8_t *)&v8, 0xCu);
  }

  -[CARSessionStatus sessionObservers](self, "sessionObservers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "session:didUpdateConfiguration:", v4, v7);

}

- (CARSessionObserving)sessionObserver
{
  return (CARSessionObserving *)objc_loadWeakRetained((id *)&self->_sessionObserver);
}

- (CARSessionChangedNotificationConverter)notificationConverter
{
  return self->_notificationConverter;
}

- (OS_dispatch_source)connectingTimer
{
  return self->_connectingTimer;
}

- (unint64_t)timeoutInterval
{
  return self->_timeoutInterval;
}

- (unint64_t)sessionStatusOptions
{
  return self->_sessionStatusOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectingTimer, 0);
  objc_storeStrong((id *)&self->_sessionObservers, 0);
  objc_storeStrong((id *)&self->_notificationConverter, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_sessionObserver);
}

@end

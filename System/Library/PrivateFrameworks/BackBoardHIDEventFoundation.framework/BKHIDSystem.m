@implementation BKHIDSystem

- (BKHIDEventDeliveryManager)deliveryManager
{
  return (BKHIDEventDeliveryManager *)objc_getProperty(self, a2, 48, 1);
}

- (void)bufferWillBeginDraining:(id)a3
{
  -[BKHIDEventProcessor bufferWillBeginDraining:](self->_eventProcessor, "bufferWillBeginDraining:", a3);
}

- (void)bufferDidFinishDraining:(id)a3
{
  -[BKHIDEventProcessor bufferDidEndDraining:](self->_eventProcessor, "bufferDidEndDraining:", a3);
}

- (void)bufferingDidAddNewBuffers:(id)a3
{
  -[BKHIDEventProcessor bufferingDidAddNewBuffers:](self->_eventProcessor, "bufferingDidAddNewBuffers:", a3);
}

uint64_t __52__BKHIDSystem_requestBufferReevaluationWithContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "reevaluateBufferingWithContext:", *(_QWORD *)(a1 + 40));
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2681 != -1)
    dispatch_once(&sharedInstance_onceToken_2681, &__block_literal_global_2682);
  return (id)sharedInstance___singleton;
}

- (BKHIDEventSenderCache)senderCache
{
  return (BKHIDEventSenderCache *)objc_getProperty(self, a2, 56, 1);
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  -[BKHIDEventProcessor processEvent:sender:dispatcher:](self->_eventProcessor, "processEvent:sender:dispatcher:", a3, a4, a5);
  return 1;
}

- (BKHIDEventDispatcherProviding)dispatcherProvider
{
  return self->_dispatcherProvider;
}

- (void)requestBufferReevaluationWithContext:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__BKHIDSystem_requestBufferReevaluationWithContext___block_invoke;
  v6[3] = &unk_1E81F7CF8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[BKHIDSystem _asyncScheduleWithHIDEventQuue:](self, "_asyncScheduleWithHIDEventQuue:", v6);

}

- (void)_asyncScheduleWithHIDEventQuue:(id)a3
{
  id v3;
  __CFRunLoop *Main;

  v3 = a3;
  Main = CFRunLoopGetMain();
  CFRunLoopPerformBlock(Main, (CFTypeRef)*MEMORY[0x1E0C9B280], v3);

  CFRunLoopWakeUp(Main);
}

- (BKHIDSystem)init
{
  BKHIDSystem *v2;
  uint64_t Serial;
  OS_dispatch_queue *gsEventQueue;
  BKHIDEventSenderCache *v5;
  uint64_t v6;
  BKHIDEventSenderCache *senderCache;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKHIDSystem;
  v2 = -[BKHIDSystem init](&v10, sel_init);
  if (v2)
  {
    Serial = BSDispatchQueueCreateSerial();
    gsEventQueue = v2->_gsEventQueue;
    v2->_gsEventQueue = (OS_dispatch_queue *)Serial;

    v5 = [BKHIDEventSenderCache alloc];
    v6 = -[BKHIDEventSenderCache initWithQueue:](v5, "initWithQueue:", MEMORY[0x1E0C80D38]);
    senderCache = v2->_senderCache;
    v2->_senderCache = (BKHIDEventSenderCache *)v6;

    +[BKHIDAccessibilitySender accessibilityHIDServices](BKHIDAccessibilitySender, "accessibilityHIDServices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKHIDEventSenderCache addSenderInfo:](v2->_senderCache, "addSenderInfo:", v8);
    v2->_HIDEventSystem = (__IOHIDEventSystem *)IOHIDEventSystemCreate();

  }
  return v2;
}

- (void)dealloc
{
  __IOHIDEventSystem *HIDEventSystem;
  __IOHIDEventSystemClient *HIDEventSystemClient;
  objc_super v5;

  HIDEventSystem = self->_HIDEventSystem;
  if (HIDEventSystem)
    CFRelease(HIDEventSystem);
  HIDEventSystemClient = self->_HIDEventSystemClient;
  if (HIDEventSystemClient)
    CFRelease(HIDEventSystemClient);
  v5.receiver = self;
  v5.super_class = (Class)BKHIDSystem;
  -[BKHIDSystem dealloc](&v5, sel_dealloc);
}

- (void)startHIDSystem
{
  __IOHIDEventSystemClient *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  BKHIDSystem *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!self->_HIDEventSystem)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IOHIDEventSystem creation failed"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544642;
      v18 = v6;
      v19 = 2114;
      v20 = v8;
      v21 = 2048;
      v22 = self;
      v23 = 2114;
      v24 = CFSTR("BKHIDSystem.m");
      v25 = 1024;
      v26 = 105;
      v27 = 2114;
      v28 = v5;
      _os_log_error_impl(&dword_1C8914000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v17, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1C8930FC4);
  }
  if (!IOHIDEventSystemOpen())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to open HID system fullly"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544642;
      v18 = v10;
      v19 = 2114;
      v20 = v12;
      v21 = 2048;
      v22 = self;
      v23 = 2114;
      v24 = CFSTR("BKHIDSystem.m");
      v25 = 1024;
      v26 = 108;
      v27 = 2114;
      v28 = v9;
      _os_log_error_impl(&dword_1C8914000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v17, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1C89310B0);
  }
  v4 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
  self->_HIDEventSystemClient = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKHID: Failed to create system client"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544642;
      v18 = v14;
      v19 = 2114;
      v20 = v16;
      v21 = 2048;
      v22 = self;
      v23 = 2114;
      v24 = CFSTR("BKHIDSystem.m");
      v25 = 1024;
      v26 = 111;
      v27 = 2114;
      v28 = v13;
      _os_log_error_impl(&dword_1C8914000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v17, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1C893119CLL);
  }
  CFRunLoopGetMain();
  IOHIDEventSystemClientScheduleWithRunLoop();
}

- (void)startEventRouting
{
  BKHIDClientConnectionManager *v2;
  void *v3;

  v2 = -[BKHIDClientConnectionManager initWithHIDEventSystem:]([BKHIDClientConnectionManager alloc], "initWithHIDEventSystem:", self->_HIDEventSystem);
  v3 = (void *)__HIDClientConnectionManager;
  __HIDClientConnectionManager = (uint64_t)v2;

}

- (void)startEventProcessor:(id)a3 mainDisplayObserver:(id)a4 deliveryManager:(id)a5 dispatcherProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  BKHIDDisplayChangeObserving *mainDisplayObserver;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id location;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_storeStrong((id *)&self->_eventProcessor, a3);
  objc_storeStrong((id *)&self->_mainDisplayObserver, a4);
  objc_storeStrong((id *)&self->_dispatcherProvider, a6);
  objc_storeStrong((id *)&self->_deliveryManager, a5);
  objc_initWeak(&location, self);
  mainDisplayObserver = self->_mainDisplayObserver;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __90__BKHIDSystem_startEventProcessor_mainDisplayObserver_deliveryManager_dispatcherProvider___block_invoke;
  v20 = &unk_1E81F7AB0;
  objc_copyWeak(&v21, &location);
  -[BKHIDDisplayChangeObserving setDisplayChangedHandler:](mainDisplayObserver, "setDisplayChangedHandler:", &v17);
  -[BKHIDDisplayChangeObserving display](self->_mainDisplayObserver, "display", v17, v18, v19, v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKHIDEventDeliveryManager setMainDisplay:](self->_deliveryManager, "setMainDisplay:", v16);
  -[BKHIDEventDeliveryManager setBufferingDispatcher:](self->_deliveryManager, "setBufferingDispatcher:", self);
  -[BKHIDSystem _beginHandlingEvents](self, "_beginHandlingEvents");

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (id)systemPropertyForKey:(id)a3
{
  id v5;
  id v6;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BKHIDSystem *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!self->_HIDEventSystem)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("need HID system"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138544642;
      v13 = v9;
      v14 = 2114;
      v15 = v11;
      v16 = 2048;
      v17 = self;
      v18 = 2114;
      v19 = CFSTR("BKHIDSystem.m");
      v20 = 1024;
      v21 = 159;
      v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_1C8914000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v12, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1C89314C8);
  }
  v6 = (id)IOHIDEventSystemGetProperty();

  return v6;
}

- (void)setSystemProperty:(id)a3 forKey:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  BKHIDSystem *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v7 = a4;
  if (!self->_HIDEventSystem)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("need HID system"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v14 = v9;
      v15 = 2114;
      v16 = v11;
      v17 = 2048;
      v18 = self;
      v19 = 2114;
      v20 = CFSTR("BKHIDSystem.m");
      v21 = 1024;
      v22 = 167;
      v23 = 2114;
      v24 = v8;
      _os_log_error_impl(&dword_1C8914000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1C8931640);
  }
  IOHIDEventSystemSetProperty();

}

- (void)injectHIDEvent:(__IOHIDEvent *)a3
{
  _BKHandleIOHIDEventFromSender(a3, 0);
}

- (void)injectGSEvent:(__GSEvent *)a3
{
  NSObject *gsEventQueue;
  _QWORD block[5];

  if (a3)
  {
    CFRetain(a3);
    gsEventQueue = self->_gsEventQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__BKHIDSystem_injectGSEvent___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a3;
    dispatch_async(gsEventQueue, block);
  }
}

- (__IOHIDEvent)systemEventOfType:(unsigned int)a3 matchingEvent:(__IOHIDEvent *)a4 options:(unsigned int)a5
{
  NSObject *v7;
  int v8;
  uint64_t Name;
  __int16 v10;
  __IOHIDEvent *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_HIDEventSystem)
    return (__IOHIDEvent *)IOHIDEventSystemCopyEvent();
  BKLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    Name = IOHIDEventTypeGetName();
    v10 = 2114;
    v11 = a4;
    _os_log_impl(&dword_1C8914000, v7, OS_LOG_TYPE_DEFAULT, "HIDSystem is not fully initialized, dropping systemEventOfType request: %{public}@ %{public}@", (uint8_t *)&v8, 0x16u);
  }

  return 0;
}

- (BKHIDClientConnectionManager)clientConnectionManager
{
  return (BKHIDClientConnectionManager *)(id)__HIDClientConnectionManager;
}

- (void)_beginHandlingEvents
{
  IOHIDEventSystemSetCallback();
}

- (id)IOHIDServicesMatching:(id)a3
{
  void *v3;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_HIDEventSystem)
  {
    v3 = (void *)IOHIDEventSystemCopyServices();
  }
  else
  {
    BKLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1C8914000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: _HIDEventSystem not initialized", (uint8_t *)&v8, 0xCu);

    }
    v3 = 0;
  }
  return v3;
}

- (void)registerIOHIDServicesCallback:(void *)a3 matchingDictionary:(id)a4 target:(void *)a5 refCon:(void *)a6
{
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_HIDEventSystem)
  {
    IOHIDEventSystemRegisterServicesCallback();
  }
  else
  {
    BKLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1C8914000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: _HIDEventSystem not initialized", (uint8_t *)&v9, 0xCu);

    }
  }
}

- (void)unregisterIOHIDServicesCallback:(void *)a3 matchingDictionary:(id)a4 target:(void *)a5 refCon:(void *)a6
{
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_HIDEventSystem)
  {
    IOHIDEventSystemUnregisterServicesCallback();
  }
  else
  {
    BKLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1C8914000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: _HIDEventSystem not initialized", (uint8_t *)&v9, 0xCu);

    }
  }
}

- (void)buffer:(id)a3 drainEvent:(__IOHIDEvent *)a4 withContext:(id)a5 sender:(id)a6 sequence:(id)a7 toResolution:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  __IOHIDEvent *v22;

  v22 = a4;
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a3;
  -[BKHIDSystem dispatcherProvider](self, "dispatcherProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dispatcherForEvent:", a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "processor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "processEvent:withContext:buffer:sequence:sender:dispatcher:resolution:", &v22, v17, v18, v15, v16, v20, v14);

}

- (BKHIDSystemDelegate)delegate
{
  return (BKHIDSystemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isFullyInitialized
{
  return self->_fullyInitialized;
}

- (void)setFullyInitialized:(BOOL)a3
{
  self->_fullyInitialized = a3;
}

- (OS_dispatch_mach)HIDSystemChannel
{
  return (OS_dispatch_mach *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHIDSystemChannel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BKHIDEventProcessor)eventProcessor
{
  return self->_eventProcessor;
}

- (BKHIDDisplayChangeObserving)mainDisplayObserver
{
  return self->_mainDisplayObserver;
}

- (void)setMainDisplayObserver:(id)a3
{
  objc_storeStrong((id *)&self->_mainDisplayObserver, a3);
}

- (void)setDispatcherProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dispatcherProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatcherProvider, 0);
  objc_storeStrong((id *)&self->_mainDisplayObserver, 0);
  objc_storeStrong((id *)&self->_eventProcessor, 0);
  objc_storeStrong((id *)&self->_HIDSystemChannel, 0);
  objc_storeStrong((id *)&self->_senderCache, 0);
  objc_storeStrong((id *)&self->_deliveryManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gsEventQueue, 0);
}

void __29__BKHIDSystem_injectGSEvent___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int *GSEventRecord;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  int v12;
  int v13;
  int Type;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  BKLogEventDelivery();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v13 = 67109120;
    Type = GSEventGetType();
    _os_log_error_impl(&dword_1C8914000, v2, OS_LOG_TYPE_ERROR, "Received a GSEvent of type %d, but GSEvents are no longer supported", (uint8_t *)&v13, 8u);
  }

  GSEventRecord = (int *)_GSEventGetGSEventRecord();
  if (!GSEventShouldRouteToFrontMost())
  {
    BKLogEventDelivery();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = GSEventGetType();
      v13 = 67109120;
      Type = v10;
      v11 = "Received a GSEvent that is not designated as being routed to frontmost (type %d), routing to system shell";
LABEL_12:
      _os_log_impl(&dword_1C8914000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 8u);
    }
LABEL_13:

    BKSendGSEvent(GSEventRecord, 0, 1);
    goto LABEL_14;
  }
  GSEventRemoveShouldRouteToFrontMost();
  if (GSEventGetType() != 50)
  {
    BKLogEventDelivery();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = GSEventGetType();
      v13 = 67109120;
      Type = v12;
      v11 = "Received a frontmost non-orientation GSEvent (type:%d), routing to system shell";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v4 = GSEventDeviceOrientation();
  v5 = v4;
  BKLogEventDelivery();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 67109120;
    Type = v4;
    _os_log_impl(&dword_1C8914000, v6, OS_LOG_TYPE_DEFAULT, "Got an orientation event from a GSEvent: %d", (uint8_t *)&v13, 8u);
  }

  +[BKHIDSystem sharedInstance](BKHIDSystem, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hidSystem:receivedUpdatedDeviceOrientation:", v7, v5);

LABEL_14:
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __90__BKHIDSystem_startEventProcessor_mainDisplayObserver_deliveryManager_dispatcherProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __90__BKHIDSystem_startEventProcessor_mainDisplayObserver_deliveryManager_dispatcherProvider___block_invoke_2;
  v6[3] = &unk_1E81F7CF8;
  v6[4] = WeakRetained;
  v7 = v3;
  v5 = v3;
  objc_msgSend(WeakRetained, "_asyncScheduleWithHIDEventQuue:", v6);

}

uint64_t __90__BKHIDSystem_startEventProcessor_mainDisplayObserver_deliveryManager_dispatcherProvider___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setMainDisplay:", *(_QWORD *)(a1 + 40));
}

void __29__BKHIDSystem_sharedInstance__block_invoke()
{
  BKHIDSystem *v0;
  void *v1;

  v0 = objc_alloc_init(BKHIDSystem);
  v1 = (void *)sharedInstance___singleton;
  sharedInstance___singleton = (uint64_t)v0;

}

@end

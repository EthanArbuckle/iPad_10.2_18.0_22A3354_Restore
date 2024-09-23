@implementation AWAttentionAwareService

- (unint64_t)clientCount
{
  return self->_clientCount;
}

- (AWAttentionAwareService)init
{
  AWAttentionAwareService *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  int v6;
  uint64_t v7;
  AWAttentionAwareService *v8;
  NSObject *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *schedulers;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  ScreenStateObserver *v18;
  ScreenStateObserver *screenStateObserver;
  CarPlayStateObserver *v20;
  CarPlayStateObserver *carPlayStateObserver;
  MotionActivityObserver *v22;
  MotionActivityObserver *motionActivityObserver;
  void *v24;
  void *v25;
  _QWORD handler[4];
  AWAttentionAwareService *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)AWAttentionAwareService;
  v2 = -[AWAttentionAwareService init](&v29, sel_init);
  if (v2)
  {
    awQueue(1);
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    if (deviceSupportsPearl())
      v5 = 207;
    else
      v5 = 79;
    v6 = MGGetBoolAnswer();
    v7 = v5 | 0x200;
    if (!v6)
      v7 = v5;
    v2->_supportedEvents = v7;
    v8 = v2;
    v9 = v2->_queue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __31__AWAttentionAwareService_init__block_invoke;
    handler[3] = &unk_1E5F8E740;
    v28 = v8;
    notify_register_dispatch("com.apple.AttentionAwareness.SupportedEventsChanged", &v8->_supportedEventsNotify, v9, handler);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    schedulers = v8->_schedulers;
    v8->_schedulers = v10;

    v12 = v8->_schedulers;
    +[AWScheduler sharedScheduler](AWScheduler, "sharedScheduler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v13, CFSTR("Face detect scheduler"));

    -[NSMutableDictionary objectForKeyedSubscript:](v8->_schedulers, "objectForKeyedSubscript:", CFSTR("Face detect scheduler"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObserver:", v8);

    if (MGGetBoolAnswer())
    {
      v15 = v8->_schedulers;
      +[AWScheduler sharedMotionDetectScheduler](AWScheduler, "sharedMotionDetectScheduler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v16, CFSTR("Motion detect scheduler"));

      -[NSMutableDictionary objectForKeyedSubscript:](v8->_schedulers, "objectForKeyedSubscript:", CFSTR("Motion detect scheduler"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObserver:", v8);

    }
    v18 = -[ScreenStateObserver initWithCallbackQueue:observer:]([ScreenStateObserver alloc], "initWithCallbackQueue:observer:", v2->_queue, v8);
    screenStateObserver = v8->_screenStateObserver;
    v8->_screenStateObserver = v18;

    v20 = -[CarPlayStateObserver initWithCallbackQueue:observer:]([CarPlayStateObserver alloc], "initWithCallbackQueue:observer:", v2->_queue, v8);
    carPlayStateObserver = v8->_carPlayStateObserver;
    v8->_carPlayStateObserver = v20;

    v22 = -[MotionActivityObserver initWithCallbackQueue:observer:]([MotionActivityObserver alloc], "initWithCallbackQueue:observer:", v2->_queue, v8);
    motionActivityObserver = v8->_motionActivityObserver;
    v8->_motionActivityObserver = v22;

    +[AWPersistentDataManager sharedManager](AWPersistentDataManager, "sharedManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "loadPersistentData");

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.AttentionAwareness"));
    objc_msgSend(v25, "setDelegate:", v8);
    objc_msgSend(v25, "resume");

  }
  return v2;
}

- (void)dealloc
{
  int supportedEventsNotify;
  objc_super v4;

  supportedEventsNotify = self->_supportedEventsNotify;
  if (supportedEventsNotify != -1)
    notify_cancel(supportedEventsNotify);
  v4.receiver = self;
  v4.super_class = (Class)AWAttentionAwareService;
  -[AWAttentionAwareService dealloc](&v4, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  int HasEntitlement;
  void *v9;
  _QWORD v11[5];
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  HasEntitlement = connectionHasEntitlement(v7, (uint64_t)CFSTR("com.apple.private.attentionawareness"));
  if (HasEntitlement)
  {
    xpcInterfaceForScheduler();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v9);

    objc_msgSend(v7, "setExportedObject:", self);
    objc_initWeak(&location, v7);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62__AWAttentionAwareService_listener_shouldAcceptNewConnection___block_invoke;
    v11[3] = &unk_1E5F8E458;
    v11[4] = self;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v7, "setInvalidationHandler:", v11);
    objc_msgSend(v7, "resume");
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return HasEntitlement;
}

- (void)clientCountChangedFrom:(unint64_t)a3 to:(unint64_t)a4 forScheduler:(id)a5
{
  id v8;
  NSObject *v9;
  unint64_t v10;
  double v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  double v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[AWAttentionAwareService setClientCount:](self, "setClientCount:", a4 - a3 + -[AWAttentionAwareService clientCount](self, "clientCount"));
  if (currentLogLevel >= 6)
  {
    _AALog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = absTimeNS();
      if (v10 == -1)
        v11 = INFINITY;
      else
        v11 = (double)v10 / 1000000000.0;
      v16 = 134218240;
      v17 = v11;
      v18 = 2048;
      v19 = -[AWAttentionAwareService clientCount](self, "clientCount");
      _os_log_impl(&dword_1AF589000, v9, OS_LOG_TYPE_DEFAULT, "%13.5f: %lu total attention aware service clients", (uint8_t *)&v16, 0x16u);
    }

  }
  if (!a4)
  {
    -[NSMutableDictionary valueForKey:](self->_schedulers, "valueForKey:", CFSTR("Unit test scheduler"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      -[NSMutableDictionary objectForKeyedSubscript:](self->_schedulers, "objectForKeyedSubscript:", CFSTR("Unit test scheduler"));
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (v14 == v8)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_schedulers, "objectForKeyedSubscript:", CFSTR("Unit test scheduler"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObserver:", 0);

        -[NSMutableDictionary removeObjectForKey:](self->_schedulers, "removeObjectForKey:", CFSTR("Unit test scheduler"));
      }
    }
  }

}

- (void)addClient:(id)a3 clientConfig:(id)a4 clientIndex:(int)a5 clientId:(id)a6 unitTestMode:(BOOL)a7 reply:(id)a8 subscribeForStreamingEvents:(BOOL)a9
{
  _BOOL4 v10;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, _QWORD, uint64_t, void *);
  void *v19;
  char HasEntitlement;
  NSObject *queue;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  unint64_t v27;
  double v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  void (**v34)(id, _QWORD, uint64_t, void *);
  int v35;
  BOOL v36;
  BOOL v37;
  uint64_t v38;
  const __CFString *v39;
  uint8_t buf[4];
  double v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v10 = a7;
  v44 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = (void (**)(id, _QWORD, uint64_t, void *))a8;
  if (v10
    && (objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        HasEntitlement = connectionHasEntitlement(v19, (uint64_t)CFSTR("com.apple.private.attentionawareness.unittest")),
        v19,
        (HasEntitlement & 1) == 0))
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v27 = absTimeNS();
        if (v27 == -1)
          v28 = INFINITY;
        else
          v28 = (double)v27 / 1000000000.0;
        objc_msgSend(v16, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v41 = v28;
        v42 = 2112;
        v43 = v29;
        _os_log_error_impl(&dword_1AF589000, v22, OS_LOG_TYPE_ERROR, "%13.5f: client %@ not entitled for unit test access", buf, 0x16u);

      }
    }
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2FE0];
    v38 = *MEMORY[0x1E0CB2D50];
    v39 = CFSTR(" Client not entitled to unit test access");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 1, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v18[2](v18, 0, 0xFFFFFFFFLL, v26);
  }
  else
  {
    queue = self->_queue;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __118__AWAttentionAwareService_addClient_clientConfig_clientIndex_clientId_unitTestMode_reply_subscribeForStreamingEvents___block_invoke;
    v30[3] = &unk_1E5F8DF48;
    v36 = v10;
    v30[4] = self;
    v31 = v16;
    v34 = v18;
    v37 = a9;
    v32 = v17;
    v33 = v15;
    v35 = a5;
    dispatch_sync(queue, v30);

  }
}

- (void)processHIDEvent:(__IOHIDEvent *)a3 mask:(unint64_t)a4 timestamp:(unint64_t)a5 senderID:(unint64_t)a6
{
  unint64_t v7;
  NSObject *queue;
  _QWORD block[9];

  v7 = a5;
  if (!a5)
    v7 = absTimeNS();
  CFRetain(a3);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__AWAttentionAwareService_processHIDEvent_mask_timestamp_senderID___block_invoke;
  block[3] = &unk_1E5F8DF98;
  block[6] = a4;
  block[7] = a6;
  block[4] = self;
  block[5] = v7;
  block[8] = a3;
  dispatch_async(queue, block);
}

- (void)setSmartCoverClosed:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__AWAttentionAwareService_setSmartCoverClosed___block_invoke;
  v4[3] = &unk_1E5F8EB88;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

- (void)getSupportedEventsWithReply:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  if (deviceSupportsPearl())
    v4 = 207;
  else
    v4 = 79;
  if (MGGetBoolAnswer())
    v5 = v4 | 0x200;
  else
    v5 = v4;
  (*((void (**)(id, uint64_t))a3 + 2))(v6, v5);

}

- (void)getDebugPreferences:(id)a3
{
  void (**v3)(id, CFDictionaryRef);
  CFDictionaryRef v4;

  v3 = (void (**)(id, CFDictionaryRef))a3;
  CFPreferencesAppSynchronize(CFSTR("com.apple.AttentionAwareness"));
  v4 = CFPreferencesCopyMultiple(0, CFSTR("com.apple.AttentionAwareness"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
  v3[2](v3, v4);

}

- (void)setDebugPreference:(id)a3 reply:(id)a4
{
  void (**v5)(id, __CFString *);
  void *v6;
  int HasEntitlement;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a3;
  v5 = (void (**)(id, __CFString *))a4;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HasEntitlement = connectionHasEntitlement(v6, (uint64_t)CFSTR("com.apple.private.attentionawareness.configuration"));

  if (!HasEntitlement)
  {
    v9 = CFSTR("Not entitled");
    goto LABEL_19;
  }
  v8 = objc_msgSend(v17, "rangeOfString:", CFSTR("="));
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v8;
    objc_msgSend(v17, "substringToIndex:", v8);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "substringFromIndex:", v10 + 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("LogLevel")))
    {
      v13 = objc_msgSend(v12, "intValue");
      if ((v13 & ~(v13 >> 31)) >= 7)
        v14 = 7;
      else
        v14 = v13 & ~(v13 >> 31);
      currentLogLevel = v14;
      if (v14 != 6)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
        v15 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        v16 = (void *)v15;
LABEL_16:
        CFPreferencesSetAppValue(v11, v16, CFSTR("com.apple.AttentionAwareness"));
        CFPreferencesAppSynchronize(CFSTR("com.apple.AttentionAwareness"));
        notify_post("com.apple.AttentionAwareness.PreferencesChanged");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("set %@ to %@"), v11, v16);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_18:
        goto LABEL_19;
      }
    }
    else
    {
      if (!-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("PearlDisabled")))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid key %@"), v11);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
      if (objc_msgSend(v12, "BOOLValue"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
    }
    v16 = 0;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no value specified for key %@"), v17);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_19:
  v5[2](v5, v9);

}

- (void)outputPowerLogWithReply:(id)a3
{
  void *v3;
  int HasEntitlement;
  void *v5;
  const __CFString *v6;
  void (**v7)(id, const __CFString *);

  v7 = (void (**)(id, const __CFString *))a3;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HasEntitlement = connectionHasEntitlement(v3, (uint64_t)CFSTR("com.apple.private.attentionawareness.configuration"));

  if (HasEntitlement)
  {
    +[AWSampleLogger sharedLogger](AWSampleLogger, "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "outputPowerLog");

    v6 = CFSTR("success");
  }
  else
  {
    v6 = CFSTR("Not entitled");
  }
  v7[2](v7, v6);

}

- (void)_createUnitTestScheduler
{
  void *v3;
  NSMutableDictionary *schedulers;
  void *v5;
  id v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary valueForKey:](self->_schedulers, "valueForKey:", CFSTR("Unit test scheduler"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    schedulers = self->_schedulers;
    +[AWScheduler sharedUnitTestScheduler](AWScheduler, "sharedUnitTestScheduler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](schedulers, "setObject:forKey:", v5, CFSTR("Unit test scheduler"));

    -[NSMutableDictionary objectForKeyedSubscript:](self->_schedulers, "objectForKeyedSubscript:", CFSTR("Unit test scheduler"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObserver:", self);

  }
}

- (void)getUnitTestSamplerWithReply:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  int HasEntitlement;
  NSObject *queue;
  NSObject *v8;
  unint64_t v9;
  double v10;
  void *v11;
  int v12;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  double v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HasEntitlement = connectionHasEntitlement(v5, (uint64_t)CFSTR("com.apple.private.attentionawareness.unittest"));

  if (HasEntitlement)
  {
    queue = self->_queue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __55__AWAttentionAwareService_getUnitTestSamplerWithReply___block_invoke;
    v13[3] = &unk_1E5F8EAC0;
    v13[4] = self;
    v13[5] = &v14;
    dispatch_sync(queue, v13);
  }
  else if (currentLogLevel >= 3)
  {
    _AALog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = absTimeNS();
      if (v9 == -1)
        v10 = INFINITY;
      else
        v10 = (double)v9 / 1000000000.0;
      objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "processIdentifier");
      *(_DWORD *)buf = 134218240;
      v21 = v10;
      v22 = 1024;
      v23 = v12;
      _os_log_error_impl(&dword_1AF589000, v8, OS_LOG_TYPE_ERROR, "%13.5f: process %d not entitled to use unit test sampling", buf, 0x12u);

    }
  }
  v4[2](v4, v15[5]);
  _Block_object_dispose(&v14, 8);

}

- (void)crashWithReply:(id)a3
{
  void (**v3)(id, void *);
  void *v4;
  int HasEntitlement;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  double v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  uint8_t buf[4];
  double v22;
  __int16 v23;
  int v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, void *))a3;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HasEntitlement = connectionHasEntitlement(v4, (uint64_t)CFSTR("com.apple.private.attentionawareness.unittest"));

  if (HasEntitlement)
  {
    if (MGGetBoolAnswer())
      abort();
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0CB2FE0];
    v25 = *MEMORY[0x1E0CB2D50];
    v26[0] = CFSTR(" Client not allowed to crash the process");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6;
    v10 = v7;
    v11 = 22;
  }
  else
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v16 = absTimeNS();
        if (v16 == -1)
          v17 = INFINITY;
        else
          v17 = (double)v16 / 1000000000.0;
        objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218240;
        v22 = v17;
        v23 = 1024;
        v24 = objc_msgSend(v18, "processIdentifier");
        _os_log_error_impl(&dword_1AF589000, v12, OS_LOG_TYPE_ERROR, "%13.5f: process %d not entitled to use unit test sampling", buf, 0x12u);

      }
    }
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2FE0];
    v19 = *MEMORY[0x1E0CB2D50];
    v20 = CFSTR(" Client not entitled to use crash the process");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v13;
    v10 = v14;
    v11 = 1;
  }
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, v11, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v3[2](v3, v15);
}

- (id)getMotionDetectScheduler
{
  return (id)-[NSMutableDictionary objectForKey:](self->_schedulers, "objectForKey:", CFSTR("Motion detect scheduler"));
}

- (id)getFaceDetectScheduler
{
  return (id)-[NSMutableDictionary objectForKey:](self->_schedulers, "objectForKey:", CFSTR("Face detect scheduler"));
}

- (void)screenStateChanging:(BOOL)a3
{
  NSMutableDictionary *schedulers;
  _QWORD v6[4];
  BOOL v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  schedulers = self->_schedulers;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__AWAttentionAwareService_screenStateChanging___block_invoke;
  v6[3] = &__block_descriptor_33_e38_v32__0__NSString_8__AWScheduler_16_B24l;
  v7 = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](schedulers, "enumerateKeysAndObjectsUsingBlock:", v6);
}

- (void)carPlayStateChanging:(BOOL)a3
{
  NSMutableDictionary *schedulers;
  _QWORD v6[4];
  BOOL v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  schedulers = self->_schedulers;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__AWAttentionAwareService_carPlayStateChanging___block_invoke;
  v6[3] = &__block_descriptor_33_e38_v32__0__NSString_8__AWScheduler_16_B24l;
  v7 = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](schedulers, "enumerateKeysAndObjectsUsingBlock:", v6);
}

- (void)MotionStateChanging:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  unint64_t v6;
  double v7;
  const char *v8;
  NSMutableDictionary *schedulers;
  _QWORD v10[4];
  BOOL v11;
  uint8_t buf[4];
  double v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (currentLogLevel >= 6)
  {
    _AALog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = absTimeNS();
      if (v6 == -1)
        v7 = INFINITY;
      else
        v7 = (double)v6 / 1000000000.0;
      v8 = "IS NOT";
      if (v3)
        v8 = "IS";
      *(_DWORD *)buf = 134218242;
      v13 = v7;
      v14 = 2080;
      v15 = v8;
      _os_log_impl(&dword_1AF589000, v5, OS_LOG_TYPE_DEFAULT, "%13.5f: Device %s stationary", buf, 0x16u);
    }

  }
  schedulers = self->_schedulers;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__AWAttentionAwareService_MotionStateChanging___block_invoke;
  v10[3] = &__block_descriptor_33_e38_v32__0__NSString_8__AWScheduler_16_B24l;
  v11 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](schedulers, "enumerateKeysAndObjectsUsingBlock:", v10);
}

- (void)LockScreenStateChanging:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  unint64_t v6;
  double v7;
  const char *v8;
  NSMutableDictionary *schedulers;
  _QWORD v10[4];
  BOOL v11;
  uint8_t buf[4];
  double v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (currentLogLevel >= 6)
  {
    _AALog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = absTimeNS();
      if (v6 == -1)
        v7 = INFINITY;
      else
        v7 = (double)v6 / 1000000000.0;
      v8 = "IS NOT";
      if (v3)
        v8 = "IS";
      *(_DWORD *)buf = 134218242;
      v13 = v7;
      v14 = 2080;
      v15 = v8;
      _os_log_impl(&dword_1AF589000, v5, OS_LOG_TYPE_DEFAULT, "%13.5f: Device %s on lock screen", buf, 0x16u);
    }

  }
  schedulers = self->_schedulers;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__AWAttentionAwareService_LockScreenStateChanging___block_invoke;
  v10[3] = &__block_descriptor_33_e38_v32__0__NSString_8__AWScheduler_16_B24l;
  v11 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](schedulers, "enumerateKeysAndObjectsUsingBlock:", v10);
}

- (void)setClientCount:(unint64_t)a3
{
  self->_clientCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockScreenStateObserver, 0);
  objc_storeStrong((id *)&self->_motionActivityObserver, 0);
  objc_storeStrong((id *)&self->_carPlayStateObserver, 0);
  objc_storeStrong((id *)&self->_screenStateObserver, 0);
  objc_storeStrong((id *)&self->_schedulers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __51__AWAttentionAwareService_LockScreenStateChanging___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "lockScreenStateChanging:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __47__AWAttentionAwareService_MotionStateChanging___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "motionActivityChanging:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __48__AWAttentionAwareService_carPlayStateChanging___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "carPlayStateChanging:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __47__AWAttentionAwareService_screenStateChanging___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "screenStateChanging:", *(unsigned __int8 *)(a1 + 32));
}

void __55__AWAttentionAwareService_getUnitTestSamplerWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_createUnitTestScheduler");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", CFSTR("Unit test scheduler"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attentionSampler");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "unitTestSampler");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __47__AWAttentionAwareService_setSmartCoverClosed___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[4];
  char v4;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__AWAttentionAwareService_setSmartCoverClosed___block_invoke_2;
  v3[3] = &__block_descriptor_33_e38_v32__0__NSString_8__AWScheduler_16_B24l;
  v4 = *(_BYTE *)(a1 + 40);
  return objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v3);
}

uint64_t __47__AWAttentionAwareService_setSmartCoverClosed___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setSmartCoverClosed:", *(unsigned __int8 *)(a1 + 32));
}

void __67__AWAttentionAwareService_processHIDEvent_mask_timestamp_senderID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  double v4;
  unint64_t v5;
  double v6;
  void *v7;
  unint64_t v8;
  BOOL v9;
  uint64_t v10;
  CFTypeID v12;
  id Property;
  void *v14;
  CFTypeID v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  int8x16_t v23;
  uint64_t v24;
  uint8_t buf[4];
  double v26;
  __int16 v27;
  double v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (currentLogLevel >= 7)
  {
    _AALog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = absTimeNS();
      if (v3 == -1)
        v4 = INFINITY;
      else
        v4 = (double)v3 / 1000000000.0;
      v5 = *(_QWORD *)(a1 + 40);
      if (v5 == -1)
        v6 = INFINITY;
      else
        v6 = (double)v5 / 1000000000.0;
      getEventMaskDescription(*(_QWORD *)(a1 + 48));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v26 = v4;
      v27 = 2048;
      v28 = v6;
      v29 = 2112;
      v30 = v7;
      _os_log_impl(&dword_1AF589000, v2, OS_LOG_TYPE_DEFAULT, "%13.5f: received event %13.5f: %@", buf, 0x20u);

    }
  }
  v8 = *(_QWORD *)(a1 + 48);
  v9 = v8 > 8;
  v10 = (1 << v8) & 0x114;
  if (v9 || v10 == 0)
    goto LABEL_22;
  v12 = *(_QWORD *)(a1 + 56) ? CFGetTypeID(*(CFTypeRef *)(a1 + 56)) : -1;
  if (v12 != IOHIDServiceGetTypeID())
    goto LABEL_22;
  Property = (id)IOHIDServiceGetProperty();
  if (Property)
  {
    v14 = Property;
    v15 = CFGetTypeID(Property);
    if (v15 == CFStringGetTypeID())
    {
      Property = v14;
      goto LABEL_23;
    }
LABEL_22:
    Property = 0;
  }
LABEL_23:
  v20[0] = MEMORY[0x1E0C809B0];
  v20[2] = __67__AWAttentionAwareService_processHIDEvent_mask_timestamp_senderID___block_invoke_52;
  v20[3] = &unk_1E5F8DF70;
  v16 = *(_QWORD *)(a1 + 64);
  v24 = *(_QWORD *)(a1 + 56);
  v17 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v20[1] = 3221225472;
  v23 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  v21 = Property;
  v22 = v16;
  v18 = Property;
  objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v20);
  CFRelease(*(CFTypeRef *)(a1 + 64));
  +[AWEventStatistics sharedStatistics](AWEventStatistics, "sharedStatistics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "logEvent:", *(_QWORD *)(a1 + 48));

}

void __67__AWAttentionAwareService_processHIDEvent_mask_timestamp_senderID___block_invoke_52(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "allowHIDEvents"))
    objc_msgSend(v4, "processHIDEvent:mask:timestamp:senderID:displayUUID:", a1[5], a1[6], a1[7], a1[8], a1[4]);

}

void __118__AWAttentionAwareService_addClient_clientConfig_clientIndex_clientId_unitTestMode_reply_subscribeForStreamingEvents___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  AWRemoteClient *v6;
  AWRemoteClient *v7;
  id v8;
  AWRemoteClient *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  double v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  double v27;
  void *v28;
  id v29;
  _QWORD block[5];
  uint64_t v31;
  const __CFString *v32;
  uint8_t buf[4];
  double v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 76))
  {
    objc_msgSend(*(id *)(a1 + 32), "_createUnitTestScheduler");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "valueForKey:", CFSTR("Unit test scheduler"));
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_msgSend(*(id *)(a1 + 40), "activateMotionDetect");
    v4 = *(void **)(a1 + 32);
    if (v3)
      objc_msgSend(v4, "getMotionDetectScheduler");
    else
      objc_msgSend(v4, "getFaceDetectScheduler");
    v2 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v2;
  if ((objc_msgSend(*(id *)(a1 + 40), "eventMask") & 0x80) != 0
    && (block[0] = MEMORY[0x1E0C809B0],
        block[1] = 3221225472,
        block[2] = __118__AWAttentionAwareService_addClient_clientConfig_clientIndex_clientId_unitTestMode_reply_subscribeForStreamingEvents___block_invoke_2,
        block[3] = &unk_1E5F8EC18,
        block[4] = *(_QWORD *)(a1 + 32),
        CARColorFilterIntensityBlueYellowKey_block_invoke_onceToken != -1))
  {
    dispatch_once(&CARColorFilterIntensityBlueYellowKey_block_invoke_onceToken, block);
    if (v5)
      goto LABEL_10;
  }
  else if (v5)
  {
LABEL_10:
    if (*(_BYTE *)(a1 + 77)
      && (objc_msgSend(v5, "resetInterruptedStreamingClientWithIdentifier:", *(_QWORD *)(a1 + 48)),
          (v6 = (AWRemoteClient *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7 = v6;
      if (-[AWRemoteClient invalid](v6, "invalid"))
        __assert_rtn("-[AWAttentionAwareService addClient:clientConfig:clientIndex:clientId:unitTestMode:reply:subscribeForStreamingEvents:]_block_invoke", "AttentionAwareService.m", 244, "!client.invalid");
      v8 = 0;
    }
    else
    {
      v9 = [AWRemoteClient alloc];
      v10 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(unsigned int *)(a1 + 72);
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      v29 = 0;
      v7 = -[AWRemoteClient initWithProxy:connection:clientConfig:clientIndex:clientId:scheduler:error:](v9, "initWithProxy:connection:clientConfig:clientIndex:clientId:scheduler:error:", v10, v11, v13, v12, v14, v5, &v29);
      v8 = v29;

      if (!v7)
      {
        if (currentLogLevel >= 3)
        {
          _AALog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v20 = absTimeNS();
            if (v20 == -1)
              v21 = INFINITY;
            else
              v21 = (double)v20 / 1000000000.0;
            *(_DWORD *)buf = 134218242;
            v34 = v21;
            v35 = 2112;
            v36 = v8;
            _os_log_error_impl(&dword_1AF589000, v17, OS_LOG_TYPE_ERROR, "%13.5f: addClient failed: %@", buf, 0x16u);
          }

        }
        v7 = 0;
        v18 = *(_QWORD *)(a1 + 64);
        v19 = 0xFFFFFFFFLL;
        goto LABEL_23;
      }
      if (*(_BYTE *)(a1 + 77))
      {
        -[AWRemoteClient clientId](v7, "clientId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addStreamingClient:withIdentifier:", v7, v15);
        v16 = objc_claimAutoreleasedReturnValue();

        v8 = (id)v16;
      }
      else
      {
        objc_msgSend(v5, "addClient:", v7);
      }
    }
    v18 = *(_QWORD *)(a1 + 64);
    v19 = -[AWRemoteClient clientIndex](v7, "clientIndex");
LABEL_23:
    (*(void (**)(uint64_t, AWRemoteClient *, uint64_t, id))(v18 + 16))(v18, v7, v19, v8);

    goto LABEL_33;
  }
  if (currentLogLevel >= 3)
  {
    _AALog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v26 = absTimeNS();
      if (v26 == -1)
        v27 = INFINITY;
      else
        v27 = (double)v26 / 1000000000.0;
      v28 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      v34 = v27;
      v35 = 2112;
      v36 = v28;
      _os_log_error_impl(&dword_1AF589000, v22, OS_LOG_TYPE_ERROR, "%13.5f: Unable to get a scheduler for client %@", buf, 0x16u);
    }

  }
  v23 = (void *)MEMORY[0x1E0CB35C8];
  v24 = *MEMORY[0x1E0CB2FE0];
  v31 = *MEMORY[0x1E0CB2D50];
  v32 = CFSTR(" Unable to get a suitable scheduler for client");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 42, v25);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_33:

}

void __118__AWAttentionAwareService_addClient_clientConfig_clientIndex_clientId_unitTestMode_reply_subscribeForStreamingEvents___block_invoke_2(uint64_t a1)
{
  LockScreenStateObserver *v2;
  uint64_t v3;
  void *v4;

  v2 = -[LockScreenStateObserver initWithCallbackQueue:observer:]([LockScreenStateObserver alloc], "initWithCallbackQueue:observer:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

}

void __62__AWAttentionAwareService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD v3[5];
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__AWAttentionAwareService_listener_shouldAcceptNewConnection___block_invoke_2;
  v3[3] = &unk_1E5F8E458;
  v3[4] = v1;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_async(v2, v3);
  objc_destroyWeak(&v4);
}

void __62__AWAttentionAwareService_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __62__AWAttentionAwareService_listener_shouldAcceptNewConnection___block_invoke_3;
  v2[3] = &unk_1E5F8DF20;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v2);
  objc_destroyWeak(&v3);
}

void __62__AWAttentionAwareService_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(v4, "removeInvalidClientsWithConnection:", WeakRetained);

}

uint64_t __31__AWAttentionAwareService_init__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  if (deviceSupportsPearl())
    v2 = 207;
  else
    v2 = 79;
  result = MGGetBoolAnswer();
  v4 = v2 | 0x200;
  if (!(_DWORD)result)
    v4 = v2;
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v5 + 32) != v4)
  {
    *(_QWORD *)(v5 + 32) = v4;
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_16);
  }
  return result;
}

uint64_t __31__AWAttentionAwareService_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "reevaluate");
}

+ (id)sharedAttentionService
{
  if (sharedAttentionService_onceToken != -1)
    dispatch_once(&sharedAttentionService_onceToken, &__block_literal_global_423);
  return (id)sharedAttentionService_attentionService;
}

void __49__AWAttentionAwareService_sharedAttentionService__block_invoke()
{
  AWAttentionAwareService *v0;
  void *v1;

  v0 = objc_alloc_init(AWAttentionAwareService);
  v1 = (void *)sharedAttentionService_attentionService;
  sharedAttentionService_attentionService = (uint64_t)v0;

}

@end

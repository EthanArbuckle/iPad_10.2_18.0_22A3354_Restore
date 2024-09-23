@implementation AXHeardController

void __32__AXHeardController_startServer__block_invoke_29(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (MEMORY[0x1DF0EBA00]() == MEMORY[0x1E0C81310])
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("XPC error: %s"), xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x1E0C81270]));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHeardController startServer]_block_invoke_29", 610, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_retainAutorelease(v6);
      v9 = v7;
      *(_DWORD *)buf = 136446210;
      v11 = objc_msgSend(v8, "UTF8String");
      _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
  else
  {
    v3 = v2;
    v4 = (void *)MEMORY[0x1DF0EB640]();
    +[AXHeardController sharedServer](AXHeardController, "sharedServer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleNewConnection:", v3);

    objc_autoreleasePoolPop(v4);
  }

}

- (void)handleNewConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id inited;
  id v12;
  _xpc_connection_s *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id from;
  id v19;
  id location;
  _QWORD block[4];
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D2F998], "clientWithConnection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__AXHeardController_handleNewConnection___block_invoke;
    block[3] = &unk_1EA8E8220;
    v8 = v5;
    v22 = v8;
    if (handleNewConnection__token != -1)
      dispatch_once(&handleNewConnection__token, block);
    -[AXHeardController clients](self, "clients");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "addObject:", v8);
    -[AXHeardController setClients:](self, "setClients:", v10);
    inited = objc_initWeak(&location, v4);
    objc_initWeak(&v19, self);
    objc_initWeak(&from, v8);
    v12 = inited;
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __41__AXHeardController_handleNewConnection___block_invoke_2;
    v14[3] = &unk_1EA8EACB8;
    objc_copyWeak(&v15, &from);
    v14[4] = self;
    objc_copyWeak(&v16, &v19);
    objc_copyWeak(&v17, &location);
    xpc_connection_set_event_handler((xpc_connection_t)v4, v14);

    v13 = (_xpc_connection_s *)objc_loadWeakRetained(&location);
    xpc_connection_resume(v13);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&from);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
}

- (void)setClients:(id)a3
{
  AXHeardController *v4;
  uint64_t v5;
  NSArray *clients;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  clients = v4->_clients;
  v4->_clients = (NSArray *)v5;

  objc_sync_exit(v4);
}

- (NSArray)clients
{
  AXHeardController *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSArray copy](v2->_clients, "copy");
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

void __41__AXHeardController_handleNewConnection___block_invoke(uint64_t a1)
{
  id v2;

  +[HUNearbySettings sharedInstance](HUNearbySettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "incomingXPCMessageID:fromPid:", 0, objc_msgSend(*(id *)(a1 + 32), "pid"));

}

- (void)handleMessage:(id)a3 forIdentifier:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  void *v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4 == 0x800000000)
  {
    v7 = *MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v20 = 0x800000000;
      v21 = 2160;
      v22 = 1752392040;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%llu - %{mask.hash}@", buf, 0x20u);
    }
  }
  else
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu - %@"), a4, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHeardController handleMessage:forIdentifier:]", 894, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_retainAutorelease(v9);
      v12 = v10;
      *(_DWORD *)buf = 136446210;
      v20 = objc_msgSend(v11, "UTF8String");
      _os_log_impl(&dword_1DE311000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
  v13 = (void *)MEMORY[0x1DF0EB640]();
  -[AXHeardController handlers](self, "handlers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v16)
  {
    objc_msgSend(v16, "block");
    v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v17)[2](v17, v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      -[AXHeardController sendMessage:withError:](self, "sendMessage:withError:", v18, 0);

  }
  objc_autoreleasePoolPop(v13);

}

uint64_t __32__AXHeardController_startServer__block_invoke_20(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleDatabaseRequest:", a2);
}

- (BOOL)sendMessage:(id)a3 withError:(id *)a4
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(v4, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sendMessage:errorBlock:", v4, &__block_literal_global_212);

  return v6;
}

- (NSDictionary)handlers
{
  AXHeardController *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSDictionary copy](v2->_handlers, "copy");
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (BOOL)connection:(id)a3 hasEntitlementForMessage:(unint64_t)a4
{
  id v5;
  SecTaskRef v6;
  void *v7;
  char v8;
  _QWORD v10[6];
  audit_token_t token;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v5 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v12 = 0u;
  v13 = 0u;
  xpc_connection_get_audit_token();
  memset(&token, 0, sizeof(token));
  v6 = SecTaskCreateWithAuditToken(0, &token);
  if (v6)
  {
    +[AXHeardController entitlementsForMessageID:](AXHeardController, "entitlementsForMessageID:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __57__AXHeardController_connection_hasEntitlementForMessage___block_invoke;
      v10[3] = &unk_1EA8EAC40;
      v10[4] = &v14;
      v10[5] = v6;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);
    }
    else
    {
      *((_BYTE *)v15 + 24) = 1;
    }
    CFRelease(v6);

  }
  v8 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v8;
}

+ (id)entitlementsForMessageID:(unint64_t)a3
{
  id result;
  uint64_t v4;

  result = 0;
  if ((uint64_t)a3 <= 0x1FFFFFFFFFLL)
  {
    if ((uint64_t)a3 < 0x200000)
    {
      if ((uint64_t)a3 >= 0x40000)
      {
        if (a3 == 0x40000)
          return &unk_1EA900628;
        if (a3 == 0x100000)
          return &unk_1EA900640;
      }
      else
      {
        if (a3 == 128)
          return &unk_1EA900610;
        if (a3 == 0x10000)
          return &unk_1EA900688;
      }
      return &unk_1EA9006A0;
    }
    if ((uint64_t)a3 <= 0x7FFFFFFFFLL)
    {
      if (a3 == 0x200000)
        return &unk_1EA900658;
      if (a3 == 0x400000)
        return &unk_1EA900670;
      return &unk_1EA9006A0;
    }
    if (a3 == 0x800000000)
      return &unk_1EA9005E0;
    if (a3 == 0x1000000000)
      return result;
    return &unk_1EA9006A0;
  }
  if ((uint64_t)a3 > 0x1FFFFFFFFFFLL)
  {
    if ((uint64_t)a3 > 0x7FFFFFFFFFFLL)
    {
      if (a3 != 0x80000000000 && a3 != 0x100000000000)
      {
        if (a3 == 0x200000000000)
          return &unk_1EA9005C8;
        return &unk_1EA9006A0;
      }
      return &unk_1EA9005E0;
    }
    if (a3 == 0x20000000000)
      return &unk_1EA9005E0;
    v4 = 0x40000000000;
LABEL_22:
    if (a3 == v4)
      return &unk_1EA9005F8;
    return &unk_1EA9006A0;
  }
  if ((uint64_t)a3 > 0x7FFFFFFFFFLL)
  {
    if (a3 == 0x8000000000)
      return result;
    if (a3 == 0x10000000000)
      return &unk_1EA9005E0;
    return &unk_1EA9006A0;
  }
  if (a3 != 0x2000000000)
  {
    v4 = 0x4000000000;
    goto LABEL_22;
  }
  return result;
}

void __57__AXHeardController_connection_hasEntitlementForMessage___block_invoke(uint64_t a1, const __CFString *a2, uint64_t a3, _BYTE *a4)
{
  CFTypeRef v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  CFTypeID v13;
  BOOL v14;
  CFErrorRef error;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  error = 0;
  v6 = SecTaskCopyValueForEntitlement(*(SecTaskRef *)(a1 + 40), a2, &error);
  if (error)
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to get entitlements for client task. Error: %@"), error);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHeardController connection:hasEntitlementForMessage:]_block_invoke", 666, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_retainAutorelease(v8);
      v11 = v9;
      v12 = objc_msgSend(v10, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v17 = v12;
      _os_log_impl(&dword_1DE311000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    CFRelease(error);
  }
  if (v6)
  {
    v13 = CFGetTypeID(v6);
    v14 = v13 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v6) != 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v14;
    CFRelease(v6);
  }
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

+ (id)sharedServer
{
  if (sharedServer_onceToken != -1)
    dispatch_once(&sharedServer_onceToken, &__block_literal_global_19);
  return (id)sharedServer_Server;
}

void __33__AXHeardController_sharedServer__block_invoke()
{
  AXHeardController *v0;
  void *v1;

  v0 = objc_alloc_init(AXHeardController);
  v1 = (void *)sharedServer_Server;
  sharedServer_Server = (uint64_t)v0;

}

- (AXHeardController)init
{
  AXHeardController *v2;
  void *v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *personalAudioQueue;
  id v13;
  uint64_t v14;
  AXDispatchTimer *shutdownTimer;
  AXHeardController *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)AXHeardController;
  v2 = -[AXHeardController init](&v18, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXHeardController setClients:](v2, "setClients:", v3);

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXHeardController setHandlers:](v2, "setHandlers:", v4);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)UserLevelHearingSetupAvailable, CFSTR("com.apple.accessibility.hearing.setup.ready"), 0, (CFNotificationSuspensionBehavior)0);
    v6 = (void *)MEMORY[0x1E0D03410];
    objc_msgSend(MEMORY[0x1E0D2F990], "bluetoothManagerQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSharedInstanceQueue:", v7);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel_bluetoothAvailabilityDidChange_, *MEMORY[0x1E0D03390], 0);

    v9 = (id)objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("personal_audio_access_queue", v10);
    personalAudioQueue = v2->_personalAudioQueue;
    v2->_personalAudioQueue = (OS_dispatch_queue *)v11;

    v13 = objc_alloc(MEMORY[0x1E0CF3978]);
    v14 = objc_msgSend(v13, "initWithTargetSerialQueue:", MEMORY[0x1E0C80D38]);
    shutdownTimer = v2->_shutdownTimer;
    v2->_shutdownTimer = (AXDispatchTimer *)v14;

    v17 = v2;
    AXPerformBlockOnMainThreadAfterDelay();

  }
  return v2;
}

uint64_t __25__AXHeardController_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "continueSetup");
}

- (void)bluetoothAvailabilityDidChange:(id)a3
{
  self->_bluetoothReady = 1;
}

- (void)updateHearingControlCenterModule
{
  void *v2;
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usedHearingFeatures");

  if (compoundAttributeContainsAttribute(v3, 2)
    || compoundAttributeContainsAttribute(v3, 8)
    || compoundAttributeContainsAttribute(v3, 1024)
    || compoundAttributeContainsAttribute(v3, 2048))
  {
    objc_msgSend(getCCSControlCenterServiceClass(), "sharedInstance");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "getEnabledStateOfModuleWithIdentifier:completionHandler:", CFSTR("com.apple.accessibility.controlcenter.hearingdevices"), &__block_literal_global_73_0);

  }
  else
  {
    HAInitializeLogging();
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = compoundAttributeContainsAttribute(v3, 2);
    v6 = compoundAttributeContainsAttribute(v3, 8);
    v7 = compoundAttributeContainsAttribute(v3, 1024);
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Not adding hearing module %lu - %d, %d, %d, %d"), v3, v5, v6, v7, compoundAttributeContainsAttribute(v3, 2048));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHeardController updateHearingControlCenterModule]", 260, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_retainAutorelease(v9);
      v12 = v10;
      *(_DWORD *)buf = 136446210;
      v15 = objc_msgSend(v11, "UTF8String");
      _os_log_impl(&dword_1DE311000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
}

void __53__AXHeardController_updateHearingControlCenterModule__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Hearing aid control status: %d"), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHeardController updateHearingControlCenterModule]_block_invoke", 249, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v10 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  if (a2 != 3)
  {
    objc_msgSend(getCCSControlCenterServiceClass(), "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requestEnableModuleWithIdentifier:completionHandler:", CFSTR("com.apple.accessibility.controlcenter.hearingdevices"), &__block_literal_global_81);

  }
}

void __53__AXHeardController_updateHearingControlCenterModule__block_invoke_79(uint64_t a1, unsigned int a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Added hearing to control center: %@ success: %d"), v4, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHeardController updateHearingControlCenterModule]_block_invoke", 253, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v6);
    v9 = v7;
    *(_DWORD *)buf = 136446210;
    v11 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

- (void)continueSetup
{
  AXPerformBlockOnMainThread();
}

void __34__AXHeardController_continueSetup__block_invoke(uint64_t a1)
{
  _BYTE *v1;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  double v41;
  double v42;
  uint64_t v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  id location;
  uint8_t buf[4];
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v1 = *(_BYTE **)(a1 + 32);
  if (!v1[40])
  {
    objc_initWeak(&location, v1);
    +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateHearingFeatureUsage");

    objc_msgSend(*(id *)(a1 + 32), "updateHearingControlCenterModule");
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __34__AXHeardController_continueSetup__block_invoke_2;
    v55[3] = &unk_1EA8E81D0;
    objc_copyWeak(&v56, &location);
    objc_msgSend(v4, "registerUpdateBlock:forRetrieveSelector:withListener:", v55, sel_usedHearingFeatures, *(_QWORD *)(a1 + 32));

    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerUpdateBlock:forRetrieveSelector:withListener:", &__block_literal_global_89, sel_pairedHearingAids, *(_QWORD *)(a1 + 32));

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
    PAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Setting up AA/PA"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHeardController continueSetup]_block_invoke", 288, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)*MEMORY[0x1E0D2F9A8];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      *(_DWORD *)buf = 136446210;
      v59 = v10;
      _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    objc_msgSend(getPASettingsClass_0(), "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "personalMediaConfiguration");

    v13 = (id)objc_msgSend(getPADatabaseManagerClass(), "sharedManager");
    +[AXHeardController sharedServer](AXHeardController, "sharedServer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updatePersonalAudioSettingsOnAccessories");

    objc_msgSend(getPASettingsClass_0(), "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v5;
    v53[1] = 3221225472;
    v53[2] = __34__AXHeardController_continueSetup__block_invoke_97;
    v53[3] = &unk_1EA8E81D0;
    objc_copyWeak(&v54, &location);
    +[AXHeardController sharedServer](AXHeardController, "sharedServer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "registerUpdateBlock:forRetrieveSelector:withListener:", v53, sel_personalMediaConfigurationByRouteUID, v16);

    v17 = (id)objc_msgSend(getPAAccessoryManagerClass(), "sharedInstance");
    v51[0] = v5;
    v51[1] = 3221225472;
    v51[2] = __34__AXHeardController_continueSetup__block_invoke_2_103;
    v51[3] = &unk_1EA8E81D0;
    objc_copyWeak(&v52, &location);
    v18 = (void *)MEMORY[0x1DF0EB808](v51);
    objc_msgSend(getPASettingsClass_0(), "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setShouldUpdateAccessory:", 1);

    objc_msgSend(getPASettingsClass_0(), "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXHeardController sharedServer](AXHeardController, "sharedServer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "registerUpdateBlock:forRetrieveSelector:withListener:", v18, sel_transparencyBalance, v21);

    objc_msgSend(getPASettingsClass_0(), "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXHeardController sharedServer](AXHeardController, "sharedServer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "registerUpdateBlock:forRetrieveSelector:withListener:", v18, sel_transparencyAmplification, v23);

    objc_msgSend(getPASettingsClass_0(), "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXHeardController sharedServer](AXHeardController, "sharedServer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "registerUpdateBlock:forRetrieveSelector:withListener:", v18, sel_transparencyTone, v25);

    objc_msgSend(getPASettingsClass_0(), "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXHeardController sharedServer](AXHeardController, "sharedServer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "registerUpdateBlock:forRetrieveSelector:withListener:", v18, sel_transparencyBeamforming, v27);

    objc_msgSend(getPASettingsClass_0(), "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXHeardController sharedServer](AXHeardController, "sharedServer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "registerUpdateBlock:forRetrieveSelector:withListener:", v18, sel_transparencyNoiseSupressor, v29);

    objc_msgSend(getPASettingsClass_0(), "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXHeardController sharedServer](AXHeardController, "sharedServer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "registerUpdateBlock:forRetrieveSelector:withListener:", v18, sel_personalAudioAccommodationTypes, v31);

    objc_msgSend(getPASettingsClass_0(), "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXHeardController sharedServer](AXHeardController, "sharedServer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "registerUpdateBlock:forRetrieveSelector:withListener:", v18, sel_personalMediaEnabled, v33);

    objc_msgSend(getPASettingsClass_0(), "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXHeardController sharedServer](AXHeardController, "sharedServer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "registerUpdateBlock:forRetrieveSelector:withListener:", v18, sel_transparencyCustomized, v35);

    v36 = +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
    if (objc_msgSend(MEMORY[0x1E0D2F990], "deviceIsWatch")
      && +[HUNoiseController deviceSupportsEnvironmentalDosimetry](HUNoiseController, "deviceSupportsEnvironmentalDosimetry"))
    {
      v37 = +[HUNoiseController sharedController](HUNoiseController, "sharedController");
    }
    v38 = +[HUAccessoryHearingSyncManager sharedInstance](HUAccessoryHearingSyncManager, "sharedInstance");
    v39 = +[HUComfortSoundsController sharedController](HUComfortSoundsController, "sharedController");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "timeIntervalSince1970");
    v42 = v41;
    v43 = objc_msgSend(MEMORY[0x1E0D2F990], "systemBootTime");

    if (v42 - (double)v43 < 90.0)
    {
      +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "isPairedWithFakeHearingAids");

      if (v45)
      {
        HAInitializeLogging();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Recently rebooted. Disabling fake hearing aids"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHeardController continueSetup]_block_invoke_3", 351, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (id)*MEMORY[0x1E0D2F928];
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          v49 = objc_msgSend(objc_retainAutorelease(v47), "UTF8String");
          *(_DWORD *)buf = 136446210;
          v59 = v49;
          _os_log_impl(&dword_1DE311000, v48, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }

        +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setPairedHearingAids:", 0);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "shutdownIfPossible");

    objc_destroyWeak(&v52);
    objc_destroyWeak(&v54);
    objc_destroyWeak(&v56);
    objc_destroyWeak(&location);
  }
}

void __34__AXHeardController_continueSetup__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateHearingControlCenterModule");

}

void __34__AXHeardController_continueSetup__block_invoke_3()
{
  void *v0;
  void *v1;
  _BOOL8 v2;
  id v3;

  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pairedHearingAids");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  objc_msgSend(getCCSControlCenterServiceClass(), "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVisibility:forModuleWithIdentifier:completionHandler:", v2, CFSTR("com.apple.accessibility.controlcenter.hearingaids"), &__block_literal_global_90_0);

}

void __34__AXHeardController_continueSetup__block_invoke_4(uint64_t a1, unsigned int a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Aids hearing aids module control center gallery: %@ success: %d"), v4, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHeardController continueSetup]_block_invoke_4", 282, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v6);
    v9 = v7;
    *(_DWORD *)buf = 136446210;
    v11 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

void __34__AXHeardController_continueSetup__block_invoke_97(uint64_t a1)
{
  id *v1;
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v14;
  _QWORD block[4];
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(getPASettingsClass_0(), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personalMediaConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AA changed %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHeardController continueSetup]_block_invoke", 297, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0D2F9A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v6);
    v9 = v7;
    *(_DWORD *)buf = 136446210;
    v18 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  if (WeakRetained)
  {
    v10 = WeakRetained[8];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__AXHeardController_continueSetup__block_invoke_100;
    block[3] = &unk_1EA8E8220;
    v16 = v4;
    dispatch_async(v10, block);

  }
  v11 = objc_loadWeakRetained(v1);
  objc_msgSend(v11, "updateAnalytics");

  v12 = objc_loadWeakRetained(v1);
  objc_msgSend(v12, "updatePersonalAudioSettingsOnAccessories");

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.accessibility.hearing.ui.availability"), 0, 0, 1u);
  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateHearingFeatureUsage");

}

void __34__AXHeardController_continueSetup__block_invoke_100(uint64_t a1)
{
  id v2;

  objc_msgSend(getPADatabaseManagerClass(), "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "saveConfiguration:", *(_QWORD *)(a1 + 32));

}

void __34__AXHeardController_continueSetup__block_invoke_2_103(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateAnalytics");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "updatePersonalAudioSettingsOnAccessories");

}

- (void)shutdownIfPossible
{
  _BOOL4 bluetoothReady;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  AXDispatchTimer *shutdownTimer;
  _QWORD v15[5];
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  bluetoothReady = self->_bluetoothReady;
  HAInitializeLogging();
  if (bluetoothReady)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BT ready, processing shutdown check"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHeardController shutdownIfPossible]", 374, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_retainAutorelease(v5);
      v8 = v6;
      *(_DWORD *)buf = 136446210;
      v17 = objc_msgSend(v7, "UTF8String");
      _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    -[AXDispatchTimer cancel](self->_shutdownTimer, "cancel");
    -[AXHeardController _shutdownIfPossible](self, "_shutdownIfPossible");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BT not yet ready, delaying shutdown check"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHeardController shutdownIfPossible]", 367, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_retainAutorelease(v10);
      v13 = v11;
      *(_DWORD *)buf = 136446210;
      v17 = objc_msgSend(v12, "UTF8String");
      _os_log_impl(&dword_1DE311000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    shutdownTimer = self->_shutdownTimer;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __39__AXHeardController_shutdownIfPossible__block_invoke;
    v15[3] = &unk_1EA8E8220;
    v15[4] = self;
    -[AXDispatchTimer afterDelay:processBlock:](shutdownTimer, "afterDelay:processBlock:", v15, 1.0);
  }
}

uint64_t __39__AXHeardController_shutdownIfPossible__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "shutdownIfPossible");
}

- (void)_shouldBeRunning:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__AXHeardController__shouldBeRunning___block_invoke;
  v5[3] = &unk_1EA8E8860;
  v6 = v3;
  v4 = v3;
  hearingDeamonShouldBeRunning(v5);

}

uint64_t __38__AXHeardController__shouldBeRunning___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t result;
  __int16 v16;
  __int16 v17;
  __int16 v18;

  if ((a2 & 1) != 0)
    goto LABEL_15;
  +[AXHAController sharedController](AXHAController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "liveListenController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isListening");

  if (v5)
  {
    HCLogHearingXPC();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 0;
      v7 = "heard will be running for Live Listen session";
      v8 = (uint8_t *)&v18;
LABEL_13:
      _os_log_impl(&dword_1DE311000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  +[HUHeadphoneLevelController sharedController](HUHeadphoneLevelController, "sharedController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isMeasurementEnabled");

  if (v10)
  {
    HCLogHearingXPC();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 0;
      v7 = "heard will be running for Headphone levels measurements";
      v8 = (uint8_t *)&v17;
      goto LABEL_13;
    }
LABEL_14:

LABEL_15:
    v14 = 1;
    goto LABEL_16;
  }
  objc_msgSend(getRTTSettingsClass_1(), "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "TTYSoftwareEnabled"))
  {

    goto LABEL_11;
  }
  objc_msgSend(getRTTSettingsClass_1(), "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "TTYHardwareEnabled");

  if (v13)
  {
LABEL_11:
    HCLogHearingXPC();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 0;
      v7 = "heard will be running for RTT";
      v8 = (uint8_t *)&v16;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v14 = 0;
LABEL_16:
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v14);
  return result;
}

- (void)_shutdownIfPossible
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__AXHeardController__shutdownIfPossible__block_invoke;
  v2[3] = &unk_1EA8E82F0;
  v2[4] = self;
  -[AXHeardController _shouldBeRunning:](self, "_shouldBeRunning:", v2);
}

void __40__AXHeardController__shutdownIfPossible__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("heard should be running. Continuing"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHeardController _shutdownIfPossible]_block_invoke", 419, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_retainAutorelease(v4);
      v7 = v5;
      *(_DWORD *)buf = 136446210;
      v17 = objc_msgSend(v6, "UTF8String");
      _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
LABEL_12:
    objc_msgSend(*(id *)(a1 + 32), "_setShutdownTimer");
    return;
  }
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("heard shouldn't be running. Starting timer"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHeardController _shutdownIfPossible]_block_invoke", 445, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_retainAutorelease(v11);
      v14 = v12;
      *(_DWORD *)buf = 136446210;
      v17 = objc_msgSend(v13, "UTF8String");
      _os_log_impl(&dword_1DE311000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
    goto LABEL_12;
  }
  HCLogHearingNearbyIDS();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __40__AXHeardController__shutdownIfPossible__block_invoke_cold_1(v8);

  +[HUNearbySettings sharedInstance](HUNearbySettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __40__AXHeardController__shutdownIfPossible__block_invoke_138;
  v15[3] = &unk_1EA8E8220;
  v15[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v9, "saveCollectedDataWithCompletion:", v15);

}

uint64_t __40__AXHeardController__shutdownIfPossible__block_invoke_138(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__AXHeardController__shutdownIfPossible__block_invoke_2;
  v3[3] = &unk_1EA8E82F0;
  v3[4] = v1;
  return objc_msgSend(v1, "_shouldBeRunning:", v3);
}

uint64_t __40__AXHeardController__shutdownIfPossible__block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  HCLogHearingNearbyIDS();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __40__AXHeardController__shutdownIfPossible__block_invoke_2_cold_1(a2, v4);

  if (!a2)
  {
    +[AXHAController sharedController](AXHAController, "sharedController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cleanUp");

    HCLogHearingXPC();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "heard shouldn't be running. Shutting down.", v8, 2u);
    }

    exit(0);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_setShutdownTimer");
}

- (void)_setShutdownTimer
{
  AXDispatchTimer *shutdownTimer;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  shutdownTimer = self->_shutdownTimer;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__AXHeardController__setShutdownTimer__block_invoke;
  v4[3] = &unk_1EA8E81D0;
  objc_copyWeak(&v5, &location);
  -[AXDispatchTimer afterDelay:processBlock:](shutdownTimer, "afterDelay:processBlock:", v4, 180.0);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __38__AXHeardController__setShutdownTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "shutdownIfPossible");

}

- (void)updateAnalytics
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;
  uint64_t v6;
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
  NSObject *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  _QWORD v23[4];
  __int128 buf;
  uint64_t v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(getPASettingsClass_0(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personalMediaConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu_%lu"), objc_msgSend(v3, "level"), objc_msgSend(v3, "shape"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1EA8EC4E0;
  }
  objc_msgSend(getPASettingsClass_0(), "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "personalAudioAccommodationTypes");

  v22[0] = CFSTR("enabled");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(getPASettingsClass_0(), "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithBool:", objc_msgSend(v8, "personalMediaEnabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v9;
  v22[1] = CFSTR("mediaEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", compoundAttributeContainsAttribute(v6, 4));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v10;
  v22[2] = CFSTR("phoneEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", compoundAttributeContainsAttribute(v6, 2));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v11;
  v22[3] = CFSTR("profile");
  v23[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  PAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Updating PME analytics %@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHeardController updateAnalytics]", 478, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)*MEMORY[0x1E0D2F9A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_retainAutorelease(v14);
    v17 = v15;
    v18 = objc_msgSend(v16, "UTF8String");
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = v18;
    _os_log_impl(&dword_1DE311000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

  }
  v19 = v12;
  AnalyticsSendEventLazy();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v25 = 0x2020000000;
  v20 = getpaCurrentBluetoothDeviceSupportingTransparencyAccommodationsAsyncSymbolLoc_ptr;
  v26 = getpaCurrentBluetoothDeviceSupportingTransparencyAccommodationsAsyncSymbolLoc_ptr;
  if (!getpaCurrentBluetoothDeviceSupportingTransparencyAccommodationsAsyncSymbolLoc_ptr)
  {
    v21 = (void *)PersonalAudioLibrary();
    v20 = dlsym(v21, "paCurrentBluetoothDeviceSupportingTransparencyAccommodationsAsync");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v20;
    getpaCurrentBluetoothDeviceSupportingTransparencyAccommodationsAsyncSymbolLoc_ptr = v20;
  }
  _Block_object_dispose(&buf, 8);
  if (!v20)
  {
    getADAFMetadataKeyHAEDataForGauge_cold_1();
    __break(1u);
  }
  ((void (*)(void *))v20)(&__block_literal_global_160);

}

id __36__AXHeardController_updateAnalytics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __36__AXHeardController_updateAnalytics__block_invoke_2(uint64_t a1, void *a2)
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  uint64_t v29;
  _QWORD v30[6];
  _QWORD v31[8];

  v31[6] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(a2, "address");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = CFSTR("enabled");
    v3 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(getPASettingsClass_0(), "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "numberWithBool:", objc_msgSend(v27, "transparencyCustomizedForAddress:", v2));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v26;
    v30[1] = CFSTR("amplification");
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(getPASettingsClass_0(), "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "transparencyAmplificationForAddress:", v2);
    objc_msgSend(v4, "numberWithDouble:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v24;
    v30[2] = CFSTR("balance");
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(getPASettingsClass_0(), "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transparencyBalanceForAddress:", v2);
    objc_msgSend(v5, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v7;
    v30[3] = CFSTR("beamformerEnabled");
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(getPASettingsClass_0(), "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberWithBool:", objc_msgSend(v9, "transparencyBeamformingForAddress:", v2));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v10;
    v30[4] = CFSTR("noiseSuppressorValue");
    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(getPASettingsClass_0(), "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transparencyNoiseSupressorForAddress:", v2);
    objc_msgSend(v11, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31[4] = v13;
    v30[5] = CFSTR("tone");
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(getPASettingsClass_0(), "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "transparencyToneForAddress:", v2);
    objc_msgSend(v14, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31[5] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    PAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Updating PSE analytics %@"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHeardController updateAnalytics]_block_invoke_2", 496, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)*MEMORY[0x1E0D2F9A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_retainAutorelease(v19);
      v22 = v20;
      *(_DWORD *)buf = 136446210;
      v29 = objc_msgSend(v21, "UTF8String");
      _os_log_impl(&dword_1DE311000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    v23 = v17;
    AnalyticsSendEventLazy();

  }
}

id __36__AXHeardController_updateAnalytics__block_invoke_175(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)updatePersonalAudioSettingsOnAccessories
{
  AXDispatchTimer *v3;
  AXDispatchTimer *transparencyHysteresisTimer;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!self->_transparencyHysteresisTimer)
  {
    v3 = (AXDispatchTimer *)objc_alloc_init(MEMORY[0x1E0CF3978]);
    transparencyHysteresisTimer = self->_transparencyHysteresisTimer;
    self->_transparencyHysteresisTimer = v3;

  }
  objc_msgSend(getPASettingsClass_0(), "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "shouldUpdateAccessory") & 1) != 0)
  {
    objc_msgSend(getPASettingsClass_0(), "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "personalMediaConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      PAInitializeLogging();
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(getPASettingsClass_0(), "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "shouldUpdateAccessory");
      objc_msgSend(getPASettingsClass_0(), "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "personalMediaConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("Sending accessory update %d, %d"), v10, v12 != 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHeardController updatePersonalAudioSettingsOnAccessories]", 515, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)*MEMORY[0x1E0D2F9A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
      {
        v16 = objc_retainAutorelease(v14);
        v17 = v15;
        *(_DWORD *)buf = 136446210;
        v29 = objc_msgSend(v16, "UTF8String");
        _os_log_impl(&dword_1DE311000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      if ((-[AXDispatchTimer isPending](self->_transparencyHysteresisTimer, "isPending") & 1) == 0)
        -[AXDispatchTimer afterDelay:processBlock:](self->_transparencyHysteresisTimer, "afterDelay:processBlock:", &__block_literal_global_178, 0.1);
      return;
    }
  }
  else
  {

  }
  PAInitializeLogging();
  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(getPASettingsClass_0(), "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "shouldUpdateAccessory");
  objc_msgSend(getPASettingsClass_0(), "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "personalMediaConfiguration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("Skipping accessory update %d, %d"), v20, v22 != 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHeardController updatePersonalAudioSettingsOnAccessories]", 527, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)*MEMORY[0x1E0D2F9A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
  {
    v26 = objc_retainAutorelease(v24);
    v27 = v25;
    *(_DWORD *)buf = 136446210;
    v29 = objc_msgSend(v26, "UTF8String");
    _os_log_impl(&dword_1DE311000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

void __61__AXHeardController_updatePersonalAudioSettingsOnAccessories__block_invoke()
{
  id v0;

  objc_msgSend(getPAAccessoryManagerClass(), "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sendUpdateToAccessory");

}

- (void)startServer
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  const char *v34;
  NSObject *v35;
  OS_xpc_object *mach_service;
  OS_xpc_object *service;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id v72;
  _QWORD v73[4];
  id v74;
  _QWORD v75[4];
  id v76;
  _QWORD v77[4];
  id v78;
  _QWORD v79[4];
  id v80;
  _QWORD v81[4];
  id v82;
  _QWORD v83[4];
  id v84;
  _QWORD v85[4];
  id v86;
  _QWORD v87[4];
  id v88;
  _QWORD v89[4];
  id v90;
  id location;

  v3 = (void *)MEMORY[0x1DF0EB640](self, a2);
  objc_initWeak(&location, self);
  objc_msgSend(getRTTControllerClass(), "sharedController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);
  +[AXHAController sharedController](AXHAController, "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v89[0] = MEMORY[0x1E0C809B0];
  v89[1] = 3221225472;
  v89[2] = __32__AXHeardController_startServer__block_invoke;
  v89[3] = &unk_1EA8EAB50;
  v7 = v5;
  v90 = v7;
  -[AXHeardController addHandler:andBlock:forMessageIdentifier:](self, "addHandler:andBlock:forMessageIdentifier:", v7, v89, 2);
  v87[0] = v6;
  v87[1] = 3221225472;
  v87[2] = __32__AXHeardController_startServer__block_invoke_2;
  v87[3] = &unk_1EA8EAB50;
  v8 = v7;
  v88 = v8;
  -[AXHeardController addHandler:andBlock:forMessageIdentifier:](self, "addHandler:andBlock:forMessageIdentifier:", v8, v87, 4);
  v85[0] = v6;
  v85[1] = 3221225472;
  v85[2] = __32__AXHeardController_startServer__block_invoke_3;
  v85[3] = &unk_1EA8EAB50;
  v9 = v8;
  v86 = v9;
  -[AXHeardController addHandler:andBlock:forMessageIdentifier:](self, "addHandler:andBlock:forMessageIdentifier:", v9, v85, 16);
  v83[0] = v6;
  v83[1] = 3221225472;
  v83[2] = __32__AXHeardController_startServer__block_invoke_4;
  v83[3] = &unk_1EA8EAB50;
  v10 = v9;
  v84 = v10;
  -[AXHeardController addHandler:andBlock:forMessageIdentifier:](self, "addHandler:andBlock:forMessageIdentifier:", v10, v83, 8);
  v81[0] = v6;
  v81[1] = 3221225472;
  v81[2] = __32__AXHeardController_startServer__block_invoke_5;
  v81[3] = &unk_1EA8EAB50;
  v11 = v10;
  v82 = v11;
  -[AXHeardController addHandler:andBlock:forMessageIdentifier:](self, "addHandler:andBlock:forMessageIdentifier:", v11, v81, 32);
  v79[0] = v6;
  v79[1] = 3221225472;
  v79[2] = __32__AXHeardController_startServer__block_invoke_6;
  v79[3] = &unk_1EA8EAB50;
  v12 = v11;
  v80 = v12;
  -[AXHeardController addHandler:andBlock:forMessageIdentifier:](self, "addHandler:andBlock:forMessageIdentifier:", v12, v79, 128);
  v77[0] = v6;
  v77[1] = 3221225472;
  v77[2] = __32__AXHeardController_startServer__block_invoke_7;
  v77[3] = &unk_1EA8EAB50;
  v13 = v12;
  v78 = v13;
  -[AXHeardController addHandler:andBlock:forMessageIdentifier:](self, "addHandler:andBlock:forMessageIdentifier:", v13, v77, 256);
  v75[0] = v6;
  v75[1] = 3221225472;
  v75[2] = __32__AXHeardController_startServer__block_invoke_8;
  v75[3] = &unk_1EA8EAB50;
  v14 = v13;
  v76 = v14;
  -[AXHeardController addHandler:andBlock:forMessageIdentifier:](self, "addHandler:andBlock:forMessageIdentifier:", v14, v75, 2048);
  v73[0] = v6;
  v73[1] = 3221225472;
  v73[2] = __32__AXHeardController_startServer__block_invoke_9;
  v73[3] = &unk_1EA8EAB50;
  v15 = v14;
  v74 = v15;
  -[AXHeardController addHandler:andBlock:forMessageIdentifier:](self, "addHandler:andBlock:forMessageIdentifier:", v15, v73, 0x8000);
  v71[0] = v6;
  v71[1] = 3221225472;
  v71[2] = __32__AXHeardController_startServer__block_invoke_10;
  v71[3] = &unk_1EA8EAB50;
  v16 = v15;
  v72 = v16;
  -[AXHeardController addHandler:andBlock:forMessageIdentifier:](self, "addHandler:andBlock:forMessageIdentifier:", v16, v71, 0x2000);
  v69[0] = v6;
  v69[1] = 3221225472;
  v69[2] = __32__AXHeardController_startServer__block_invoke_11;
  v69[3] = &unk_1EA8EAB50;
  v17 = v16;
  v70 = v17;
  -[AXHeardController addHandler:andBlock:forMessageIdentifier:](self, "addHandler:andBlock:forMessageIdentifier:", v17, v69, 0x8000000000000000);
  v67[0] = v6;
  v67[1] = 3221225472;
  v67[2] = __32__AXHeardController_startServer__block_invoke_12;
  v67[3] = &unk_1EA8EAB78;
  objc_copyWeak(&v68, &location);
  -[AXHeardController addHandler:andBlock:forMessageIdentifier:](self, "addHandler:andBlock:forMessageIdentifier:", self, v67, 0x10000);
  v65[0] = v6;
  v65[1] = 3221225472;
  v65[2] = __32__AXHeardController_startServer__block_invoke_13;
  v65[3] = &unk_1EA8EAB50;
  v18 = v17;
  v66 = v18;
  -[AXHeardController addHandler:andBlock:forMessageIdentifier:](self, "addHandler:andBlock:forMessageIdentifier:", self, v65, 0x20000);
  -[AXHeardController addHandler:andBlock:forMessageIdentifier:](self, "addHandler:andBlock:forMessageIdentifier:", v18, &__block_literal_global_182, 0x40000);
  +[HUHeadphoneLevelController sharedController](HUHeadphoneLevelController, "sharedController");
  v63[0] = v6;
  v63[1] = 3221225472;
  v63[2] = __32__AXHeardController_startServer__block_invoke_15;
  v63[3] = &unk_1EA8EAB50;
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v64 = v19;
  -[AXHeardController addHandler:andBlock:forMessageIdentifier:](self, "addHandler:andBlock:forMessageIdentifier:", v19, v63, 0x100000);
  v61[0] = v6;
  v61[1] = 3221225472;
  v61[2] = __32__AXHeardController_startServer__block_invoke_16;
  v61[3] = &unk_1EA8EAB50;
  v20 = v19;
  v62 = v20;
  -[AXHeardController addHandler:andBlock:forMessageIdentifier:](self, "addHandler:andBlock:forMessageIdentifier:", v20, v61, 0x200000);
  v59[0] = v6;
  v59[1] = 3221225472;
  v59[2] = __32__AXHeardController_startServer__block_invoke_17;
  v59[3] = &unk_1EA8EAB50;
  v21 = v20;
  v60 = v21;
  -[AXHeardController addHandler:andBlock:forMessageIdentifier:](self, "addHandler:andBlock:forMessageIdentifier:", v21, v59, 0x400000);
  +[HUComfortSoundsController sharedController](HUComfortSoundsController, "sharedController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHeardController addHandler:andBlock:forMessageIdentifier:](self, "addHandler:andBlock:forMessageIdentifier:", v22, &__block_literal_global_183, 0x1000000);

  v57[0] = v6;
  v57[1] = 3221225472;
  v57[2] = __32__AXHeardController_startServer__block_invoke_19;
  v57[3] = &unk_1EA8EAB50;
  v23 = v4;
  v58 = v23;
  -[AXHeardController addHandler:andBlock:forMessageIdentifier:](self, "addHandler:andBlock:forMessageIdentifier:", v23, v57, 0x1000000000);
  v55[0] = v6;
  v55[1] = 3221225472;
  v55[2] = __32__AXHeardController_startServer__block_invoke_20;
  v55[3] = &unk_1EA8EAB50;
  v24 = v23;
  v56 = v24;
  -[AXHeardController addHandler:andBlock:forMessageIdentifier:](self, "addHandler:andBlock:forMessageIdentifier:", v24, v55, 0x800000000);
  v53[0] = v6;
  v53[1] = 3221225472;
  v53[2] = __32__AXHeardController_startServer__block_invoke_21;
  v53[3] = &unk_1EA8EAB50;
  v25 = v24;
  v54 = v25;
  -[AXHeardController addHandler:andBlock:forMessageIdentifier:](self, "addHandler:andBlock:forMessageIdentifier:", v25, v53, 0x2000000000);
  v51[0] = v6;
  v51[1] = 3221225472;
  v51[2] = __32__AXHeardController_startServer__block_invoke_22;
  v51[3] = &unk_1EA8EAB50;
  v26 = v25;
  v52 = v26;
  -[AXHeardController addHandler:andBlock:forMessageIdentifier:](self, "addHandler:andBlock:forMessageIdentifier:", v26, v51, 0x4000000000);
  v49[0] = v6;
  v49[1] = 3221225472;
  v49[2] = __32__AXHeardController_startServer__block_invoke_23;
  v49[3] = &unk_1EA8EAB50;
  v27 = v26;
  v50 = v27;
  -[AXHeardController addHandler:andBlock:forMessageIdentifier:](self, "addHandler:andBlock:forMessageIdentifier:", v27, v49, 0x8000000000);
  v47[0] = v6;
  v47[1] = 3221225472;
  v47[2] = __32__AXHeardController_startServer__block_invoke_24;
  v47[3] = &unk_1EA8EAB50;
  v28 = v27;
  v48 = v28;
  -[AXHeardController addHandler:andBlock:forMessageIdentifier:](self, "addHandler:andBlock:forMessageIdentifier:", v28, v47, 0x10000000000);
  v45[0] = v6;
  v45[1] = 3221225472;
  v45[2] = __32__AXHeardController_startServer__block_invoke_25;
  v45[3] = &unk_1EA8EAB50;
  v29 = v28;
  v46 = v29;
  -[AXHeardController addHandler:andBlock:forMessageIdentifier:](self, "addHandler:andBlock:forMessageIdentifier:", v29, v45, 0x20000000000);
  v43[0] = v6;
  v43[1] = 3221225472;
  v43[2] = __32__AXHeardController_startServer__block_invoke_26;
  v43[3] = &unk_1EA8EAB50;
  v30 = v29;
  v44 = v30;
  -[AXHeardController addHandler:andBlock:forMessageIdentifier:](self, "addHandler:andBlock:forMessageIdentifier:", v30, v43, 0x80000000000);
  v41[0] = v6;
  v41[1] = 3221225472;
  v41[2] = __32__AXHeardController_startServer__block_invoke_27;
  v41[3] = &unk_1EA8EAB50;
  v31 = v30;
  v42 = v31;
  -[AXHeardController addHandler:andBlock:forMessageIdentifier:](self, "addHandler:andBlock:forMessageIdentifier:", v31, v41, 0x100000000000);
  v39[0] = v6;
  v39[1] = 3221225472;
  v39[2] = __32__AXHeardController_startServer__block_invoke_28;
  v39[3] = &unk_1EA8EAB50;
  v32 = v31;
  v40 = v32;
  -[AXHeardController addHandler:andBlock:forMessageIdentifier:](self, "addHandler:andBlock:forMessageIdentifier:", v32, v39, 0x200000000000);

  objc_destroyWeak(&v68);
  objc_destroyWeak(&location);
  objc_autoreleasePoolPop(v3);
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", CFSTR("com.apple.SoundDetectionNotifications"));
  objc_msgSend(v33, "setDelegate:", self);
  objc_msgSend(v33, "setWantsNotificationResponsesDelivered");
  v34 = (const char *)objc_msgSend((id)*MEMORY[0x1E0D2F910], "UTF8String");
  v35 = MEMORY[0x1E0C80D38];
  mach_service = xpc_connection_create_mach_service(v34, MEMORY[0x1E0C80D38], 1uLL);
  service = self->_service;
  self->_service = mach_service;

  xpc_connection_set_event_handler(self->_service, &__block_literal_global_188);
  xpc_connection_set_target_queue(self->_service, v35);

  xpc_connection_resume(self->_service);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.accessibility.hearing.server.ready"), 0, 0, 1u);

}

uint64_t __32__AXHeardController_startServer__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerForAvailableDevicesUpdates:", a2);
}

uint64_t __32__AXHeardController_startServer__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerForDeviceUpdates:", a2);
}

uint64_t __32__AXHeardController_startServer__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "readDeviceProperty:", a2);
}

uint64_t __32__AXHeardController_startServer__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeDeviceProperty:", a2);
}

uint64_t __32__AXHeardController_startServer__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "readAvailableDevices:", a2);
}

uint64_t __32__AXHeardController_startServer__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "toggleLiveListen:", a2);
}

uint64_t __32__AXHeardController_startServer__block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerForLiveListenUpdates:", a2);
}

uint64_t __32__AXHeardController_startServer__block_invoke_8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "readAvailableControllers:", a2);
}

uint64_t __32__AXHeardController_startServer__block_invoke_9(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "connectToControllerWithID:", a2);
}

uint64_t __32__AXHeardController_startServer__block_invoke_10(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "disconnectAndForceClient:", a2);
}

uint64_t __32__AXHeardController_startServer__block_invoke_11(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerForControlMessageUpdates:", a2);
}

id __32__AXHeardController_startServer__block_invoke_12(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "boostPriority:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __32__AXHeardController_startServer__block_invoke_13(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendMessagesPriority:", a2);
}

id __32__AXHeardController_startServer__block_invoke_14(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  +[HUNoiseController sharedController](HUNoiseController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForEnvironmentalDosimetryUpdates:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __32__AXHeardController_startServer__block_invoke_15(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerForHeadphoneLevelUpdates:", a2);
}

uint64_t __32__AXHeardController_startServer__block_invoke_16(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerForRemoteHeadphoneLevelUpdates:", a2);
}

uint64_t __32__AXHeardController_startServer__block_invoke_17(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerForRemoteHeadphoneLevelChangesUpdates:", a2);
}

id __32__AXHeardController_startServer__block_invoke_18(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  +[HUComfortSoundsController sharedController](HUComfortSoundsController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processComfortSoundsAssetRequest:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __32__AXHeardController_startServer__block_invoke_19(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "displayCallPrompt:", a2);
}

uint64_t __32__AXHeardController_startServer__block_invoke_21(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleDictionaryRequest:", a2);
}

uint64_t __32__AXHeardController_startServer__block_invoke_22(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleSettingsRequest:", a2);
}

uint64_t __32__AXHeardController_startServer__block_invoke_23(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleIncomingNotificationSuppressionChange:", a2);
}

uint64_t __32__AXHeardController_startServer__block_invoke_24(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleDatabaseRequest:", a2);
}

uint64_t __32__AXHeardController_startServer__block_invoke_25(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleDatabaseRequest:", a2);
}

uint64_t __32__AXHeardController_startServer__block_invoke_26(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleMediaAction:", a2);
}

uint64_t __32__AXHeardController_startServer__block_invoke_27(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleRTTControllerIsVisible:", a2);
}

uint64_t __32__AXHeardController_startServer__block_invoke_28(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleRTTVoicemailMessage:", a2);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  void (**v5)(void);

  v5 = (void (**)(void))a5;
  AXSDSoundDetectionHandleNotificationsForResponse();
  v5[2]();

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  xpc_connection_cancel(self->_service);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AXHeardController;
  -[AXHeardController dealloc](&v4, sel_dealloc);
}

- (void)setHandlers:(id)a3
{
  AXHeardController *v4;
  uint64_t v5;
  NSDictionary *handlers;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  handlers = v4->_handlers;
  v4->_handlers = (NSDictionary *)v5;

  objc_sync_exit(v4);
}

void __41__AXHeardController_handleNewConnection___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  id *v8;
  id *v9;
  id v10;
  id *v11;
  id v12;
  int v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  id WeakRetained;
  id v26;
  _xpc_connection_s *v27;
  uint64_t v28;
  _xpc_connection_s *v29;
  const char *v30;
  id v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  _xpc_connection_s *v35;
  pid_t pid;
  _xpc_connection_s *v37;
  const char *name;
  id v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  _QWORD block[4];
  id v45[2];
  id v46[6];
  id v47;
  uint8_t buf[4];
  _BYTE v49[14];
  __int16 v50;
  unint64_t v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1DF0EB640]();
  v5 = MEMORY[0x1DF0EBA00](v3);
  if (v5 == MEMORY[0x1E0C81310])
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error in client connection event handler"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHeardController handleNewConnection:]_block_invoke_2", 745, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_retainAutorelease(v20);
      v23 = v21;
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)v49 = objc_msgSend(v22, "UTF8String");
      _os_log_impl(&dword_1DE311000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    objc_msgSend(getRTTControllerClass(), "sharedController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained(a1 + 5);
    objc_msgSend(v24, "clientRemoved:", WeakRetained);

    v26 = objc_loadWeakRetained(a1 + 5);
    objc_msgSend(v26, "teardownConnection");

    v46[1] = (id)MEMORY[0x1E0C809B0];
    v46[2] = (id)3221225472;
    v46[3] = __41__AXHeardController_handleNewConnection___block_invoke_199;
    v46[4] = &unk_1EA8E8B68;
    v46[5] = a1[4];
    objc_copyWeak(&v47, a1 + 5);
    AXPerformBlockSynchronouslyOnMainThread();
    objc_destroyWeak(&v47);
  }
  else if (v5 == MEMORY[0x1E0C812F8])
  {
    v46[0] = 0;
    objc_msgSend(MEMORY[0x1E0CF3A10], "dictionaryFromXPCMessage:error:", v3, v46);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v46[0];
    objc_msgSend(v43, "objectForKey:", *MEMORY[0x1E0D2F8F8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedLongLongValue");

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__AXHeardController_handleNewConnection___block_invoke_4;
    block[3] = &unk_1EA8EAC90;
    v45[1] = (id)v7;
    v8 = a1 + 5;
    objc_copyWeak(v45, a1 + 5);
    if (CCSIconElementRequestErrorDomain_block_invoke_token == -1)
    {
      if (v7)
      {
LABEL_5:
        v9 = a1 + 6;
        v10 = objc_loadWeakRetained(a1 + 6);
        v11 = a1 + 7;
        v12 = objc_loadWeakRetained(a1 + 7);
        v13 = objc_msgSend(v10, "connection:hasEntitlementForMessage:", v12, v7);

        if (v13)
        {
          objc_msgSend(v43, "objectForKey:", *MEMORY[0x1E0D2F900]);
          v14 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = (void *)MEMORY[0x1E0D2F9A0];
            v16 = objc_loadWeakRetained(v8);
            objc_msgSend(v15, "messageWithPayload:xpcMessage:andClient:", v14, v3, v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              v18 = objc_loadWeakRetained(v9);
              objc_msgSend(v18, "handleMessage:forIdentifier:", v17, v7);

            }
          }
          goto LABEL_23;
        }
        if (v7 >> 35)
        {
          AXLogRTT();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v35 = (_xpc_connection_s *)objc_loadWeakRetained(v11);
            pid = xpc_connection_get_pid(v35);
            v37 = (_xpc_connection_s *)objc_loadWeakRetained(v11);
            name = xpc_connection_get_name(v37);
            v39 = objc_loadWeakRetained(v8);
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v49 = pid;
            *(_WORD *)&v49[4] = 2080;
            *(_QWORD *)&v49[6] = name;
            v50 = 2048;
            v51 = v7;
            v52 = 2112;
            v53 = v39;
            _os_log_error_impl(&dword_1DE311000, v14, OS_LOG_TYPE_ERROR, "Message missing entitlement %d - %s, message: %llu: %@", buf, 0x26u);

          }
          goto LABEL_23;
        }
        HAInitializeLogging();
        v41 = (void *)MEMORY[0x1E0CB3940];
        v27 = (_xpc_connection_s *)objc_loadWeakRetained(v11);
        v28 = xpc_connection_get_pid(v27);
        v29 = (_xpc_connection_s *)objc_loadWeakRetained(v11);
        v30 = xpc_connection_get_name(v29);
        v31 = objc_loadWeakRetained(v8);
        objc_msgSend(v41, "stringWithFormat:", CFSTR("Message missing entitlement %d - %llu - %s: %@"), v28, v7, v30, v31);
        v14 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHeardController handleNewConnection:]_block_invoke_5", 802, v14);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (id)*MEMORY[0x1E0D2F928];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)v49 = v34;
          _os_log_impl(&dword_1DE311000, v33, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
LABEL_22:

LABEL_23:
        objc_destroyWeak(v45);

        goto LABEL_24;
      }
    }
    else
    {
      dispatch_once(&CCSIconElementRequestErrorDomain_block_invoke_token, block);
      if (v7)
        goto LABEL_5;
    }
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Malformed message %@"), v43);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHeardController handleNewConnection:]_block_invoke", 812, v14);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (id)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v40 = objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)v49 = v40;
      _os_log_impl(&dword_1DE311000, v33, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    goto LABEL_22;
  }
LABEL_24:
  objc_autoreleasePoolPop(v4);

}

void __41__AXHeardController_handleNewConnection___block_invoke_199(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[3];
  char v11;

  objc_msgSend(*(id *)(a1 + 32), "clients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "removeObject:", WeakRetained);

  objc_msgSend(*(id *)(a1 + 32), "setClients:", v3);
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  objc_msgSend(*(id *)(a1 + 32), "clients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__AXHeardController_handleNewConnection___block_invoke_2_200;
  v9[3] = &unk_1EA8EAC68;
  v9[4] = v10;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __41__AXHeardController_handleNewConnection___block_invoke_3;
  v8[3] = &unk_1EA8EA5F0;
  v8[4] = v10;
  objc_msgSend(v7, "checkPartiallyPairedWithCompletion:", v8);

  _Block_object_dispose(v10, 8);
}

uint64_t __41__AXHeardController_handleNewConnection___block_invoke_2_200(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "wantsUpdatesForIdentifier:", 32);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __41__AXHeardController_handleNewConnection___block_invoke_3(uint64_t a1, char a2)
{
  unsigned int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  if ((a2 & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isiCloudPaired") ^ 1;

  }
  +[AXHAController sharedController](AXHAController, "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    v6 = v3;
  else
    v6 = 0;
  objc_msgSend(v5, "setListenForAvailableDeviceUpdates:", v6);

}

void __41__AXHeardController_handleNewConnection___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  id v4;

  +[HUNearbySettings sharedInstance](HUNearbySettings, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v4, "incomingXPCMessageID:fromPid:", v2, objc_msgSend(WeakRetained, "pid"));

}

void __43__AXHeardController_sendMessage_withError___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: %@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHeardController sendMessage:withError:]_block_invoke", 825, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v9 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

- (void)sendUpdateMessage:(id)a3 forIdentifier:(unint64_t)a4
{
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  unint64_t v13;

  v10 = a3;
  v6 = (void *)MEMORY[0x1DF0EB640]();
  objc_msgSend(v10, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 >= 2)
  {
    -[AXHeardController clients](self, "clients");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__AXHeardController_sendUpdateMessage_forIdentifier___block_invoke;
    v11[3] = &unk_1EA8EAD40;
    v13 = a4;
    v12 = v10;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);

  }
  objc_autoreleasePoolPop(v6);

}

void __53__AXHeardController_sendUpdateMessage_forIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "wantsUpdatesForIdentifier:", *(_QWORD *)(a1 + 40)))
    objc_msgSend(v3, "sendMessage:errorBlock:", *(_QWORD *)(a1 + 32), &__block_literal_global_215);

}

void __53__AXHeardController_sendUpdateMessage_forIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: %@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHeardController sendUpdateMessage:forIdentifier:]_block_invoke_2", 838, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v9 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

- (void)sendClientsMessageWithPayload:(id)a3 excluding:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v8 = a3;
  v6 = a4;
  if (objc_msgSend(v8, "count"))
  {
    -[AXHeardController clients](self, "clients");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__AXHeardController_sendClientsMessageWithPayload_excluding___block_invoke;
    v9[3] = &unk_1EA8EAD88;
    v10 = v6;
    v11 = v8;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

  }
}

void __61__AXHeardController_sendClientsMessageWithPayload_excluding___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D2F9A0], "messageWithPayload:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendMessage:errorBlock:", v3, &__block_literal_global_216);

  }
}

void __61__AXHeardController_sendClientsMessageWithPayload_excluding___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: %@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHeardController sendClientsMessageWithPayload:excluding:]_block_invoke_2", 854, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v9 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

- (unint64_t)countOfClientsListeningForIdentifier:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD v18[5];
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[AXHeardController clients](self, "clients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __58__AXHeardController_countOfClientsListeningForIdentifier___block_invoke;
  v18[3] = &__block_descriptor_40_e28_B32__0__HCXPCClient_8Q16_B24l;
  v18[4] = a3;
  objc_msgSend(v5, "indexesOfObjectsPassingTest:", v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HAInitializeLogging();
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[AXHeardController clients](self, "clients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectsAtIndexes:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Found clients %llu = %@"), a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHeardController countOfClientsListeningForIdentifier:]", 867, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_retainAutorelease(v11);
    v14 = v12;
    v15 = objc_msgSend(v13, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v20 = v15;
    _os_log_impl(&dword_1DE311000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v16 = objc_msgSend(v6, "count");

  return v16;
}

uint64_t __58__AXHeardController_countOfClientsListeningForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "wantsUpdatesForIdentifier:", *(_QWORD *)(a1 + 32));
}

- (void)addHandler:(id)a3 andBlock:(id)a4 forMessageIdentifier:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  AXHAMessageHandlerContext *v13;

  v8 = a4;
  v9 = a3;
  v13 = -[AXHAMessageHandlerContext initWithTarget:block:]([AXHAMessageHandlerContext alloc], "initWithTarget:block:", v9, v8);

  if (v13)
  {
    -[AXHeardController handlers](self, "handlers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v13, v12);

    -[AXHeardController setHandlers:](self, "setHandlers:", v11);
  }

}

- (id)boostPriority:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("ax_hearing_should_register_client_key"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v4, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWantsUpdates:forIdentifier:", v7, 0x10000);

  +[AXHeardController sharedServer](AXHeardController, "sharedServer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countOfClientsListeningForIdentifier:", 0x10000);

  if (v10)
    v11 = v4;
  else
    v11 = 0;
  -[AXHeardController setBoostMessage:](self, "setBoostMessage:", v11);
  HAInitializeLogging();
  v12 = (void *)MEMORY[0x1E0CB3940];
  -[AXHeardController boostMessage](self, "boostMessage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("Setting boost %@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHeardController boostPriority:]", 923, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_retainAutorelease(v15);
    v18 = v16;
    *(_DWORD *)buf = 136446210;
    v21 = objc_msgSend(v17, "UTF8String");
    _os_log_impl(&dword_1DE311000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  return 0;
}

- (void)registerFakeClient:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[AXHeardController clients](self, "clients");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v6, "addObject:", v4);
    -[AXHeardController setClients:](self, "setClients:", v6);

  }
}

- (OS_dispatch_queue)personalAudioQueue
{
  return self->_personalAudioQueue;
}

- (void)setPersonalAudioQueue:(id)a3
{
  objc_storeStrong((id *)&self->_personalAudioQueue, a3);
}

- (HCXPCMessage)boostMessage
{
  return self->_boostMessage;
}

- (void)setBoostMessage:(id)a3
{
  objc_storeStrong((id *)&self->_boostMessage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boostMessage, 0);
  objc_storeStrong((id *)&self->_personalAudioQueue, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_shutdownTimer, 0);
  objc_storeStrong((id *)&self->_transparencyHysteresisTimer, 0);
}

void __40__AXHeardController__shutdownIfPossible__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DE311000, log, OS_LOG_TYPE_DEBUG, "Will shutdown, save IDS stats", v1, 2u);
}

void __40__AXHeardController__shutdownIfPossible__block_invoke_2_cold_1(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1DE311000, a2, OS_LOG_TYPE_DEBUG, "IDS stats is saved, should be running: %d", (uint8_t *)v2, 8u);
}

@end

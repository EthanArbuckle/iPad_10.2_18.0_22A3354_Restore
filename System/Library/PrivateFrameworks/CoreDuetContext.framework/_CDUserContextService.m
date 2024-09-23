@implementation _CDUserContextService

- (BOOL)remoteDevicesHaveBeenActivated
{
  return self->_remoteDevicesHaveBeenActivated;
}

- (_CDContextPersisting)persistence
{
  return self->_persistence;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableSet *v9;
  BOOL v10;
  void *v11;
  _QWORD block[5];
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60___CDUserContextService_listener_shouldAcceptNewConnection___block_invoke;
    block[3] = &unk_1E26D46E0;
    block[4] = self;
    if (listener_shouldAcceptNewConnection__initialized != -1)
      dispatch_once(&listener_shouldAcceptNewConnection__initialized, block);
  }
  if (listener_shouldAcceptNewConnection__isUnitTests)
    goto LABEL_5;
  objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.coreduetd.context"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (v11 && (objc_msgSend(v11, "BOOLValue") & 1) != 0)
  {

LABEL_5:
    +[_CDUserContextServerClient clientOfService:withConnection:andContext:](_CDUserContextServerClient, "clientOfService:withConnection:andContext:", self, v7, self->_userContext);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self->_clients;
    objc_sync_enter(v9);
    -[NSMutableSet addObject:](self->_clients, "addObject:", v8);
    objc_sync_exit(v9);
    v10 = 1;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
  v9 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v9->super.super, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v7;
    _os_log_impl(&dword_18DD73000, &v9->super.super, OS_LOG_TYPE_INFO, "Client %@ does not have required entitlement", buf, 0xCu);
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (_CDUserContextService)initWithListener:(id)a3 withStorage:(id)a4 withStore:(id)a5
{
  return -[_CDUserContextService initWithListener:withPersistence:withStorage:withStore:](self, "initWithListener:withPersistence:withStorage:withStore:", a3, 0, a4, a5);
}

- (_CDUserContextService)initWithListener:(id)a3 withPersistence:(id)a4 withStorage:(id)a5 withStore:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _CDUserContextService *v15;
  uint64_t v16;
  NSMutableSet *clients;
  uint64_t v18;
  _CDInMemoryUserContext *userContext;
  _CDContextPersisting *v20;
  void *v21;
  uint64_t v22;
  NSMutableDictionary *mdcsEventSubscribersByToken;
  uint64_t v24;
  NSMutableDictionary *notificationEventSubscribersByToken;
  uint64_t v26;
  NSMutableDictionary *notificationEventSubscribersByClientIdentifier;
  NSObject *v28;
  NSObject *v29;
  dispatch_queue_t v30;
  OS_dispatch_queue *workQueue;
  void *v32;
  OS_dispatch_queue *v33;
  void *v34;
  uint64_t v35;
  _CDXPCEventPublisher *mdcsEventPublisher;
  void *v37;
  OS_dispatch_queue *v38;
  void *v39;
  uint64_t v40;
  _CDXPCEventPublisher *notificationEventPublisher;
  uint64_t v42;
  NSMutableDictionary *remoteDevicesByDeviceID;
  void *v45;
  uint64_t v46;
  _CDContextPersisting *persistence;
  objc_super v48;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v48.receiver = self;
  v48.super_class = (Class)_CDUserContextService;
  v15 = -[_CDUserContextService init](&v48, sel_init);
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    clients = v15->_clients;
    v15->_clients = (NSMutableSet *)v16;

    +[_CDInMemoryUserContext userContext](_CDInMemoryUserContext, "userContext");
    v18 = objc_claimAutoreleasedReturnValue();
    userContext = v15->_userContext;
    v15->_userContext = (_CDInMemoryUserContext *)v18;

    objc_storeStrong((id *)&v15->_listener, a3);
    if (v12)
    {
      v20 = (_CDContextPersisting *)v12;
    }
    else if (v13)
    {
      +[_CDCoreDataContextPersisting persistenceWithStorage:](_CDCoreDataContextPersisting, "persistenceWithStorage:", v13);
      v20 = (_CDContextPersisting *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/%@"), CFSTR("CDCSS"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D15938], "keyValueStoreWithName:size:", v21, 0);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        +[_CDSharedMemoryContextPersisting persistenceWithSharedMemoryKeyValueStore:](_CDSharedMemoryContextPersisting, "persistenceWithSharedMemoryKeyValueStore:", v45);
        v46 = objc_claimAutoreleasedReturnValue();
        persistence = v15->_persistence;
        v15->_persistence = (_CDContextPersisting *)v46;

        goto LABEL_9;
      }
      +[_CDSharedMemoryContextPersisting persistenceWithSharedMemoryKeyValueStore:](_CDSharedMemoryContextPersisting, "persistenceWithSharedMemoryKeyValueStore:", v14);
      v20 = (_CDContextPersisting *)objc_claimAutoreleasedReturnValue();
    }
    v21 = v15->_persistence;
    v15->_persistence = v20;
LABEL_9:

    -[_CDUserContextService regenerateState](v15, "regenerateState");
    -[NSXPCListener setDelegate:](v15->_listener, "setDelegate:", v15);
    v22 = objc_opt_new();
    mdcsEventSubscribersByToken = v15->_mdcsEventSubscribersByToken;
    v15->_mdcsEventSubscribersByToken = (NSMutableDictionary *)v22;

    v24 = objc_opt_new();
    notificationEventSubscribersByToken = v15->_notificationEventSubscribersByToken;
    v15->_notificationEventSubscribersByToken = (NSMutableDictionary *)v24;

    v26 = objc_opt_new();
    notificationEventSubscribersByClientIdentifier = v15->_notificationEventSubscribersByClientIdentifier;
    v15->_notificationEventSubscribersByClientIdentifier = (NSMutableDictionary *)v26;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v28, QOS_CLASS_UTILITY, 0);
    v29 = objc_claimAutoreleasedReturnValue();

    v30 = dispatch_queue_create("com.apple.coreduet.context-work-queue", v29);
    workQueue = v15->_workQueue;
    v15->_workQueue = (OS_dispatch_queue *)v30;

    v32 = (void *)MEMORY[0x1E0D15958];
    v33 = v15->_workQueue;
    objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "eventPublisherWithStreamName:delegate:queue:log:os_variant_diagnostic_subsystem:", "com.apple.coreduetcontext.mdcs_events", v15, v33, v34, "com.apple.coreduetcontext");
    v35 = objc_claimAutoreleasedReturnValue();
    mdcsEventPublisher = v15->_mdcsEventPublisher;
    v15->_mdcsEventPublisher = (_CDXPCEventPublisher *)v35;

    v37 = (void *)MEMORY[0x1E0D15958];
    v38 = v15->_workQueue;
    objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "eventPublisherWithStreamName:delegate:queue:log:os_variant_diagnostic_subsystem:", "com.apple.coreduetcontext.client_event_stream", v15, v38, v39, "com.apple.coreduetcontext");
    v40 = objc_claimAutoreleasedReturnValue();
    notificationEventPublisher = v15->_notificationEventPublisher;
    v15->_notificationEventPublisher = (_CDXPCEventPublisher *)v40;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v42 = objc_claimAutoreleasedReturnValue();
    remoteDevicesByDeviceID = v15->_remoteDevicesByDeviceID;
    v15->_remoteDevicesByDeviceID = (NSMutableDictionary *)v42;

  }
  return v15;
}

+ (id)sharedInstanceWithPersistence:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55___CDUserContextService_sharedInstanceWithPersistence___block_invoke;
  block[3] = &unk_1E26D46E0;
  v9 = v3;
  v4 = sharedInstanceWithPersistence__onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&sharedInstanceWithPersistence__onceToken, block);
  v6 = (id)sharedInstanceWithPersistence__service;

  return v6;
}

+ (id)sharedInstanceWithSharedMemoryStore:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61___CDUserContextService_sharedInstanceWithSharedMemoryStore___block_invoke;
  block[3] = &unk_1E26D46E0;
  v9 = v3;
  v4 = sharedInstanceWithSharedMemoryStore__onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&sharedInstanceWithSharedMemoryStore__onceToken, block);
  v6 = (id)sharedInstanceWithSharedMemoryStore__service;

  return v6;
}

- (void)addOpenRegistration:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id location;

  v4 = a3;
  v5 = self->_openRegistrations;
  objc_sync_enter(v5);
  -[NSMutableSet member:](self->_openRegistrations, "member:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  if (!v6)
    v6 = v4;
  objc_initWeak(&location, v6);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45___CDUserContextService_addOpenRegistration___block_invoke;
  v7[3] = &unk_1E26D59A0;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  objc_msgSend(v6, "setInformativeCallback:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)removeOpenRegistration:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_openRegistrations;
  objc_sync_enter(v5);
  if (-[NSMutableSet containsObject:](self->_openRegistrations, "containsObject:", v4))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_openRegistrations;
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (objc_msgSend(v10, "isEqual:", v4, (_QWORD)v11))
          {
            -[_CDInMemoryUserContext deregisterCallback:](self->_userContext, "deregisterCallback:", v10);
            -[NSMutableSet removeObject:](self->_openRegistrations, "removeObject:", v10);
            goto LABEL_12;
          }
        }
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

  }
  objc_sync_exit(v5);

}

- (id)obtainFiredRegistrationMatchingRegistration:(id)a3 info:(id *)a4
{
  id v6;
  NSMutableSet *v7;
  void *v8;
  NSMutableDictionary *firedRegistrationInfos;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;

  v6 = a3;
  v7 = self->_firedRegistrations;
  objc_sync_enter(v7);
  -[NSMutableSet member:](self->_firedRegistrations, "member:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[NSMutableSet removeObject:](self->_firedRegistrations, "removeObject:", v8);
    if (a4)
    {
      firedRegistrationInfos = self->_firedRegistrationInfos;
      objc_msgSend(v8, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](firedRegistrationInfos, "objectForKeyedSubscript:", v10);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v11 = self->_firedRegistrationInfos;
    objc_msgSend(v8, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", 0, v12);

  }
  objc_sync_exit(v7);

  return v8;
}

- (void)informClientOfFiredRegistration:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  NSObject *v20;
  id v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "clientIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[_CDUserContextService informClientOfFiredRegistration:info:].cold.3(v6);

    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    +[_CDXPCCodecs notificationEventWithRegistrationIdentifier:info:error:](_CDXPCContextCodecs, "notificationEventWithRegistrationIdentifier:info:error:", v10, v7, &v21);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v21;
    if (v11)
    {
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __62___CDUserContextService_informClientOfFiredRegistration_info___block_invoke;
      v19 = &unk_1E26D5220;
      v20 = v6;
      -[_CDUserContextService sendEvent:toClient:handler:](self, "sendEvent:toClient:handler:", v11, v8, &v16);
      v13 = v20;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[_CDUserContextService informClientOfFiredRegistration:info:].cold.2();
    }

  }
  objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel", v16, v17, v18, v19);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[_CDUserContextService informClientOfFiredRegistration:info:].cold.1(v6);

  objc_msgSend(v6, "identifier");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  notify_post((const char *)objc_msgSend(v15, "UTF8String"));

}

- (void)regenerateState
{
  _CDContextPersisting *persistence;
  _CDContextPersisting **p_persistence;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSMutableSet *v9;
  NSMutableSet *openRegistrations;
  NSMutableSet *v11;
  NSMutableSet *firedRegistrations;
  NSMutableDictionary *v13;
  NSMutableDictionary *firedRegistrationInfos;
  NSMutableSet *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSMutableSet *obj;
  void *v21;
  _QWORD v22[5];
  id v23;
  id location;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  p_persistence = &self->_persistence;
  persistence = self->_persistence;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -1209600.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContextPersisting deleteDataCreatedBefore:](persistence, "deleteDataCreatedBefore:", v5);

  -[_CDContextPersisting loadValues](*p_persistence, "loadValues");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __40___CDUserContextService_regenerateState__block_invoke;
  v29[3] = &unk_1E26D59C8;
  v29[4] = self;
  objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v29);
  v7 = (void *)MEMORY[0x1E0C99E20];
  -[_CDContextPersisting loadRegistrations](*p_persistence, "loadRegistrations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  openRegistrations = self->_openRegistrations;
  self->_openRegistrations = v9;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  firedRegistrations = self->_firedRegistrations;
  self->_firedRegistrations = v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableSet count](self->_openRegistrations, "count"));
  v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  firedRegistrationInfos = self->_firedRegistrationInfos;
  self->_firedRegistrationInfos = v13;

  obj = self->_openRegistrations;
  objc_sync_enter(obj);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v15 = self->_openRegistrations;
  v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_initWeak(&location, v19);
        v22[0] = v6;
        v22[1] = 3221225472;
        v22[2] = __40___CDUserContextService_regenerateState__block_invoke_2;
        v22[3] = &unk_1E26D59A0;
        objc_copyWeak(&v23, &location);
        v22[4] = self;
        objc_msgSend(v19, "setInformativeCallback:", v22);
        -[_CDInMemoryUserContext registerCallback:](self->_userContext, "registerCallback:", v19);
        objc_destroyWeak(&v23);
        objc_destroyWeak(&location);
      }
      v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v16);
  }

  objc_sync_exit(obj);
}

- (void)start
{
  -[NSXPCListener resume](self->_listener, "resume");
}

- (void)deleteSavedData
{
  -[_CDContextPersisting deleteAllData](self->_persistence, "deleteAllData");
}

- (void)clientWasInterrupted:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = self->_clients;
    objc_sync_enter(v5);
    -[NSMutableSet removeObject:](self->_clients, "removeObject:", v6);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

- (void)sendEvent:(id)a3 toProxy:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  _CDXPCEventPublisher *mdcsEventPublisher;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  -[_CDUserContextService subscriberForSourceDeviceUUID:](self, "subscriberForSourceDeviceUUID:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[_CDUserContextService sendEvent:toProxy:handler:].cold.1();

    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0D15BF0];
    v16 = (_QWORD *)MEMORY[0x1E0D15C30];
    goto LABEL_8;
  }
  mdcsEventPublisher = self->_mdcsEventPublisher;
  if (!mdcsEventPublisher)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0D15BF0];
    v16 = (_QWORD *)MEMORY[0x1E0D15C18];
LABEL_8:
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, *v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v17);

    goto LABEL_9;
  }
  -[_CDXPCEventPublisher sendEvent:toSubscriber:handler:](mdcsEventPublisher, "sendEvent:toSubscriber:handler:", v8, v11, v10);
LABEL_9:

}

- (void)sendEvent:(id)a3 toProxy:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  _CDXPCEventPublisher *mdcsEventPublisher;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  -[_CDUserContextService subscriberForSourceDeviceUUID:](self, "subscriberForSourceDeviceUUID:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[_CDUserContextService sendEvent:toProxy:handler:].cold.1();

    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0D15BF0];
    v16 = (_QWORD *)MEMORY[0x1E0D15C30];
    goto LABEL_8;
  }
  mdcsEventPublisher = self->_mdcsEventPublisher;
  if (!mdcsEventPublisher)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0D15BF0];
    v16 = (_QWORD *)MEMORY[0x1E0D15C18];
LABEL_8:
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, *v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v17);

    goto LABEL_9;
  }
  -[_CDXPCEventPublisher sendEvent:toSubscriber:replyHandler:](mdcsEventPublisher, "sendEvent:toSubscriber:replyHandler:", v8, v11, v10);
LABEL_9:

}

- (void)sendEvent:(id)a3 toClient:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  -[_CDUserContextService subscribersForClientIdentifier:](self, "subscribersForClientIdentifier:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[_CDUserContextService sendEvent:toClient:handler:].cold.1();

    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0D15BF0];
    v20 = (_QWORD *)MEMORY[0x1E0D15C28];
    goto LABEL_15;
  }
  if (!self->_notificationEventPublisher)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0D15BF0];
    v20 = (_QWORD *)MEMORY[0x1E0D15C18];
LABEL_15:
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, *v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v21);

    goto LABEL_16;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        -[_CDXPCEventPublisher sendEvent:toSubscriber:handler:](self->_notificationEventPublisher, "sendEvent:toSubscriber:handler:", v8, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), v10);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }
LABEL_16:

}

- (void)sendEvent:(id)a3 toClient:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  -[_CDUserContextService subscribersForClientIdentifier:](self, "subscribersForClientIdentifier:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[_CDUserContextService sendEvent:toClient:handler:].cold.1();

    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0D15BF0];
    v20 = (_QWORD *)MEMORY[0x1E0D15C28];
    goto LABEL_15;
  }
  if (!self->_mdcsEventPublisher)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0D15BF0];
    v20 = (_QWORD *)MEMORY[0x1E0D15C18];
LABEL_15:
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, *v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v21);

    goto LABEL_16;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        -[_CDXPCEventPublisher sendEvent:toSubscriber:replyHandler:](self->_notificationEventPublisher, "sendEvent:toSubscriber:replyHandler:", v8, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), v10);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }
LABEL_16:

}

- (BOOL)setMappingObject:(id)a3 forContextualKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138412802;
    v15 = v7;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v8;
    _os_log_debug_impl(&dword_18DD73000, v9, OS_LOG_TYPE_DEBUG, "SET MAPPING %@ => %@ / %@", (uint8_t *)&v14, 0x20u);
  }

  -[_CDInMemoryUserContext setObject:returningMetadataForContextualKeyPath:](self->_userContext, "setObject:returningMetadataForContextualKeyPath:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setLastModifiedDate:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[_CDUserContextService setMappingObject:forContextualKeyPath:].cold.1();

  }
  return v11 != 0;
}

- (void)setToken:(unint64_t)a3 forUserID:(unsigned int)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextQueries keyPathForMDCSProxyTokenWithUserID:](_CDContextQueries, "keyPathForMDCSProxyTokenWithUserID:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDUserContextService setMappingObject:forContextualKeyPath:](self, "setMappingObject:forContextualKeyPath:", v7, v9);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("_CDMDCSProxyTokenUpdated"), self);

}

- (void)removeTokenForUserID:(unsigned int)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextQueries keyPathForMDCSProxyTokenWithUserID:](_CDContextQueries, "keyPathForMDCSProxyTokenWithUserID:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[_CDUserContextService setMappingObject:forContextualKeyPath:](self, "setMappingObject:forContextualKeyPath:", 0, v6);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("_CDMDCSProxyTokenUpdated"), self);

}

- (void)addProxyWithSourceDeviceUUID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  +[_CDContextQueries keyPathForMDCSProxies](_CDContextQueries, "keyPathForMDCSProxies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInMemoryUserContext objectForKeyedSubscript:](self->_userContext, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v9) & 1) == 0)
  {
    if (v5)
    {
      v6 = (void *)objc_msgSend(v5, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    objc_msgSend(v6, "addObject:", v9);
    v8 = objc_msgSend(v7, "copy");

    -[_CDUserContextService setMappingObject:forContextualKeyPath:](self, "setMappingObject:forContextualKeyPath:", v8, v4);
    v5 = (void *)v8;
  }

}

- (void)setProxySourceDeviceUUID:(id)a3 forUserID:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  +[_CDContextQueries keyPathForMDCSUserIDWithProxySourceDeviceUUID:](_CDContextQueries, "keyPathForMDCSUserIDWithProxySourceDeviceUUID:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDUserContextService setMappingObject:forContextualKeyPath:](self, "setMappingObject:forContextualKeyPath:", v7, v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextQueries keyPathForMDCSProxySourceDeviceUUIDWithUserID:](_CDContextQueries, "keyPathForMDCSProxySourceDeviceUUIDWithUserID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CDUserContextService setMappingObject:forContextualKeyPath:](self, "setMappingObject:forContextualKeyPath:", v6, v9);
  -[_CDUserContextService addProxyWithSourceDeviceUUID:](self, "addProxyWithSourceDeviceUUID:", v6);

}

- (id)proxySourceDeviceUUIDForUserID:(unsigned int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextQueries keyPathForMDCSProxySourceDeviceUUIDWithUserID:](_CDContextQueries, "keyPathForMDCSProxySourceDeviceUUIDWithUserID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CDInMemoryUserContext propertiesForContextualKeyPath:](self->_userContext, "propertiesForContextualKeyPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)subscriberForSourceDeviceUUID:(id)a3
{
  id v4;
  unint64_t v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *mdcsEventSubscribersByToken;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = -[_CDUserContextService tokenForSourceDeviceUUID:](self, "tokenForSourceDeviceUUID:", v4);
  v6 = self->_mdcsEventSubscribersByToken;
  objc_sync_enter(v6);
  mdcsEventSubscribersByToken = self->_mdcsEventSubscribersByToken;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](mdcsEventSubscribersByToken, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v6);
  return v9;
}

- (unint64_t)tokenForSourceDeviceUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;

  v4 = a3;
  +[_CDContextQueries keyPathForMDCSUserIDWithProxySourceDeviceUUID:](_CDContextQueries, "keyPathForMDCSUserIDWithProxySourceDeviceUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInMemoryUserContext objectForKeyedSubscript:](self->_userContext, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[_CDContextQueries keyPathForMDCSProxyTokenWithUserID:](_CDContextQueries, "keyPathForMDCSProxyTokenWithUserID:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    -[_CDInMemoryUserContext objectForKeyedSubscript:](self->_userContext, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend(v8, "unsignedLongLongValue");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[_CDUserContextService tokenForSourceDeviceUUID:].cold.2();

      v10 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_CDUserContextService tokenForSourceDeviceUUID:].cold.1();
    v10 = 0;
  }

  return v10;
}

- (id)subscribersForClientIdentifier:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self->_notificationEventSubscribersByClientIdentifier;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_notificationEventSubscribersByClientIdentifier, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_sync_exit(v5);
  return v7;
}

- (void)fetchProxySourceDeviceUUIDFromSubscriber:(id)a3
{
  id v4;
  void *v5;
  _CDXPCEventPublisher *mdcsEventPublisher;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  +[_CDXPCCodecs fetchProxySourceDeviceUUIDEvent](_CDXPCContextCodecs, "fetchProxySourceDeviceUUIDEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    mdcsEventPublisher = self->_mdcsEventPublisher;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66___CDUserContextService_fetchProxySourceDeviceUUIDFromSubscriber___block_invoke;
    v8[3] = &unk_1E26D5870;
    v8[4] = self;
    v9 = v4;
    -[_CDXPCEventPublisher sendEvent:toSubscriber:replyHandler:](mdcsEventPublisher, "sendEvent:toSubscriber:replyHandler:", v5, v9, v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_CDUserContextService fetchProxySourceDeviceUUIDFromSubscriber:].cold.1();

  }
}

- (void)requestActivateDevicesFromAllSubscribersWithHandler:(id)a3
{
  void (**v4)(_QWORD);
  NSMutableDictionary *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  dispatch_time_t v9;
  NSObject *workQueue;
  uint64_t v11;
  void (**v12)(_QWORD);
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  id obj;
  _QWORD v19[5];
  void (**v20)(_QWORD);
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD block[4];
  id v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[4];
  _QWORD v39[5];
  id v40;
  _QWORD v41[4];
  int v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  v5 = self->_mdcsEventSubscribersByToken;
  objc_sync_enter(v5);
  -[NSMutableDictionary allValues](self->_mdcsEventSubscribersByToken, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  v7 = objc_msgSend(v6, "count");
  v17 = v4;
  if (v7)
  {
    v8 = v7;
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x2810000000;
    v41[3] = &unk_18DDAEC06;
    v42 = 0;
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3032000000;
    v39[3] = __Block_byref_object_copy__3;
    v39[4] = __Block_byref_object_dispose__3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    v38[3] = 0;
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x3032000000;
    v36[3] = __Block_byref_object_copy__3;
    v36[4] = __Block_byref_object_dispose__3;
    v37 = (id)os_transaction_create();
    v9 = dispatch_time(0, 10000000000);
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77___CDUserContextService_requestActivateDevicesFromAllSubscribersWithHandler___block_invoke;
    block[3] = &unk_1E26D59F0;
    v32 = v41;
    v33 = v39;
    v11 = v8;
    v35 = v8;
    v12 = v4;
    v31 = v12;
    v34 = v36;
    dispatch_after(v9, workQueue, block);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v6;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v43, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __77___CDUserContextService_requestActivateDevicesFromAllSubscribersWithHandler___block_invoke_35;
          v19[3] = &unk_1E26D5A18;
          v21 = v41;
          v22 = v39;
          v19[4] = v16;
          v23 = v38;
          v25 = v11;
          v20 = v12;
          v24 = v36;
          -[_CDUserContextService requestActivateDevicesFromSubscriber:withHandler:](self, "requestActivateDevicesFromSubscriber:withHandler:", v16, v19);

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v43, 16);
      }
      while (v13);
    }

    _Block_object_dispose(v36, 8);
    _Block_object_dispose(v38, 8);
    _Block_object_dispose(v39, 8);

    _Block_object_dispose(v41, 8);
  }
  else
  {
    v4[2](v4);
  }

}

- (void)requestActivateDevicesFromSubscriber:(id)a3 withHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  _CDXPCEventPublisher *mdcsEventPublisher;
  NSObject *v10;
  _QWORD v11[4];
  void (**v12)(_QWORD);

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  +[_CDXPCCodecs requestActivateDevicesEvent](_CDXPCContextCodecs, "requestActivateDevicesEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    mdcsEventPublisher = self->_mdcsEventPublisher;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __74___CDUserContextService_requestActivateDevicesFromSubscriber_withHandler___block_invoke;
    v11[3] = &unk_1E26D5A40;
    v12 = v7;
    -[_CDXPCEventPublisher sendEvent:toSubscriber:replyHandler:](mdcsEventPublisher, "sendEvent:toSubscriber:replyHandler:", v8, v6, v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_CDUserContextService requestActivateDevicesFromSubscriber:withHandler:].cold.1();

    if (v7)
      v7[2](v7);
  }

}

- (void)addSubscriber:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *mdcsEventSubscribersByToken;
  void *v12;
  void *v13;
  int v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *notificationEventSubscribersByToken;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  objc_msgSend(v4, "streamName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "token");
  v7 = objc_msgSend(v4, "uid");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.coreduetcontext.mdcs_events");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v5);

  if (v9)
  {
    v10 = self->_mdcsEventSubscribersByToken;
    objc_sync_enter(v10);
    mdcsEventSubscribersByToken = self->_mdcsEventSubscribersByToken;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](mdcsEventSubscribersByToken, "setObject:forKeyedSubscript:", v4, v12);

    objc_sync_exit(v10);
    -[_CDUserContextService setToken:forUserID:](self, "setToken:forUserID:", v6, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.coreduetcontext.client_event_stream");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", v5);

    if (v14)
    {
      v15 = self->_notificationEventSubscribersByToken;
      objc_sync_enter(v15);
      notificationEventSubscribersByToken = self->_notificationEventSubscribersByToken;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](notificationEventSubscribersByToken, "setObject:forKeyedSubscript:", v4, v17);

      objc_sync_exit(v15);
      v18 = self->_notificationEventSubscribersByClientIdentifier;
      objc_sync_enter(v18);
      objc_msgSend(v4, "clientIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](self->_notificationEventSubscribersByClientIdentifier, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_notificationEventSubscribersByClientIdentifier, "setObject:forKeyedSubscript:", v20, v19);
      }
      objc_msgSend(v20, "addObject:", v4);

      objc_sync_exit(v18);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
      v18 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v18->super.super, OS_LOG_TYPE_ERROR))
        -[_CDUserContextService addSubscriber:].cold.1();
    }

  }
  -[_CDUserContextService proxySourceDeviceUUIDForUserID:](self, "proxySourceDeviceUUIDForUserID:", v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[_CDUserContextService addProxyWithSourceDeviceUUID:](self, "addProxyWithSourceDeviceUUID:", v21);
  }
  else
  {
    -[_CDUserContextService fetchProxySourceDeviceUUIDFromSubscriber:](self, "fetchProxySourceDeviceUUIDFromSubscriber:", v4);
    -[_CDUserContextService requestActivateDevicesFromSubscriber:withHandler:](self, "requestActivateDevicesFromSubscriber:withHandler:", v4, 0);
  }

}

- (void)removeSubscriberWithToken:(unint64_t)a3 streamName:(id)a4
{
  id v6;
  void *v7;
  int v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *mdcsEventSubscribersByToken;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  int v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *notificationEventSubscribersByToken;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  void *v24;
  NSObject *v25;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.coreduetcontext.mdcs_events");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", v6);

  if (v8)
  {
    v9 = self->_mdcsEventSubscribersByToken;
    objc_sync_enter(v9);
    mdcsEventSubscribersByToken = self->_mdcsEventSubscribersByToken;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](mdcsEventSubscribersByToken, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = self->_mdcsEventSubscribersByToken;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", 0, v14);

    objc_sync_exit(v9);
    if (v12)
      -[_CDUserContextService removeTokenForUserID:](self, "removeTokenForUserID:", objc_msgSend(v12, "uid"));
LABEL_7:

    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.coreduetcontext.client_event_stream");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", v6);

  if (v16)
  {
    v17 = self->_notificationEventSubscribersByToken;
    objc_sync_enter(v17);
    notificationEventSubscribersByToken = self->_notificationEventSubscribersByToken;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](notificationEventSubscribersByToken, "objectForKeyedSubscript:", v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = self->_notificationEventSubscribersByToken;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", 0, v21);

    objc_sync_exit(v17);
    if (v12)
    {
      v22 = self->_notificationEventSubscribersByClientIdentifier;
      objc_sync_enter(v22);
      objc_msgSend(v12, "clientIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](self->_notificationEventSubscribersByClientIdentifier, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "removeObject:", v12);

      objc_sync_exit(v22);
    }
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    -[_CDUserContextService addSubscriber:].cold.1();

LABEL_11:
}

- (void)setPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_persistence, a3);
}

- (_CDInMemoryUserContext)userContext
{
  return self->_userContext;
}

- (void)setUserContext:(id)a3
{
  objc_storeStrong((id *)&self->_userContext, a3);
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_storeStrong((id *)&self->_clients, a3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (NSMutableSet)openRegistrations
{
  return self->_openRegistrations;
}

- (void)setOpenRegistrations:(id)a3
{
  objc_storeStrong((id *)&self->_openRegistrations, a3);
}

- (NSMutableSet)firedRegistrations
{
  return self->_firedRegistrations;
}

- (void)setFiredRegistrations:(id)a3
{
  objc_storeStrong((id *)&self->_firedRegistrations, a3);
}

- (NSMutableDictionary)firedRegistrationInfos
{
  return self->_firedRegistrationInfos;
}

- (void)setFiredRegistrationInfos:(id)a3
{
  objc_storeStrong((id *)&self->_firedRegistrationInfos, a3);
}

- (_CDXPCEventPublisher)mdcsEventPublisher
{
  return self->_mdcsEventPublisher;
}

- (void)setMdcsEventPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_mdcsEventPublisher, a3);
}

- (_CDXPCEventPublisher)notificationEventPublisher
{
  return self->_notificationEventPublisher;
}

- (void)setNotificationEventPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_notificationEventPublisher, a3);
}

- (NSMutableDictionary)mdcsEventSubscribersByToken
{
  return self->_mdcsEventSubscribersByToken;
}

- (void)setMdcsEventSubscribersByToken:(id)a3
{
  objc_storeStrong((id *)&self->_mdcsEventSubscribersByToken, a3);
}

- (NSMutableDictionary)notificationEventSubscribersByToken
{
  return self->_notificationEventSubscribersByToken;
}

- (void)setNotificationEventSubscribersByToken:(id)a3
{
  objc_storeStrong((id *)&self->_notificationEventSubscribersByToken, a3);
}

- (NSMutableDictionary)notificationEventSubscribersByClientIdentifier
{
  return self->_notificationEventSubscribersByClientIdentifier;
}

- (void)setNotificationEventSubscribersByClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_notificationEventSubscribersByClientIdentifier, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void)setRemoteDevicesHaveBeenActivated:(BOOL)a3
{
  self->_remoteDevicesHaveBeenActivated = a3;
}

- (NSMutableDictionary)remoteDevicesByDeviceID
{
  return self->_remoteDevicesByDeviceID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDevicesByDeviceID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_notificationEventSubscribersByClientIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationEventSubscribersByToken, 0);
  objc_storeStrong((id *)&self->_mdcsEventSubscribersByToken, 0);
  objc_storeStrong((id *)&self->_notificationEventPublisher, 0);
  objc_storeStrong((id *)&self->_mdcsEventPublisher, 0);
  objc_storeStrong((id *)&self->_firedRegistrationInfos, 0);
  objc_storeStrong((id *)&self->_firedRegistrations, 0);
  objc_storeStrong((id *)&self->_openRegistrations, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_userContext, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
}

- (void)informClientOfFiredRegistration:(void *)a1 info:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_1(&dword_18DD73000, v2, v3, "CDUserContext: posting notification for registration %@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)informClientOfFiredRegistration:info:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_18DD73000, v0, v1, "CDUserContext: Invalid registration: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)informClientOfFiredRegistration:(void *)a1 info:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_1(&dword_18DD73000, v2, v3, "CDUserContext: sending event for registration %@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)sendEvent:toProxy:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_18DD73000, v0, v1, "Unknown proxy source device id: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)sendEvent:toClient:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_18DD73000, v0, v1, "Unknown client identifier: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setMappingObject:forContextualKeyPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_18DD73000, v0, v1, "Failed to set mapping %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)tokenForSourceDeviceUUID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_18DD73000, v0, v1, "Missing token user id for proxy source device id %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)tokenForSourceDeviceUUID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_18DD73000, v0, v1, "Missing token for uid %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)fetchProxySourceDeviceUUIDFromSubscriber:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_6_1(&dword_18DD73000, v0, v1, "CDUserContext: failed to create event to fetch proxy source device uuid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13();
}

- (void)requestActivateDevicesFromSubscriber:withHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_6_1(&dword_18DD73000, v0, v1, "CDUserContext: failed to create event to request activate devices", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13();
}

- (void)addSubscriber:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_18DD73000, v0, v1, "Unknown event stream name: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end

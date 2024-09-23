@implementation _CDClientContext

- (void)setCachedValueIfClientHasRegistrations:(id)a3 forKeyPath:(id)a4
{
  id v6;
  NSCountedSet *v7;
  NSUInteger v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v10)
  {
    v7 = self->_keyPathsWithRegistrationsForAnyChange;
    objc_sync_enter(v7);
    v8 = -[NSCountedSet countForObject:](self->_keyPathsWithRegistrationsForAnyChange, "countForObject:", v6);
    objc_sync_exit(v7);

    if (v8)
    {
      v9 = self->_keyPathToValues;
      objc_sync_enter(v9);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_keyPathToValues, "setObject:forKeyedSubscript:", v10, v6);
      objc_sync_exit(v9);

    }
  }

}

- (void)handleContextualChange:(id)a3 info:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *log;
  NSMutableDictionary *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  OS_dispatch_queue *registrationCallbackQueue;
  _QWORD *v24;
  NSObject *v25;
  id v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _CDClientContext *v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  os_activity_scope_state_s state;
  uint64_t (*v42)(uint64_t);
  void *v43;
  id v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_18DD73000, "Duet: ClientContext handleContextualChange:info:handler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    LODWORD(state.opaque[0]) = 138412290;
    *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v8;
    _os_log_impl(&dword_18DD73000, log, OS_LOG_TYPE_INFO, "Registration fired for %@", (uint8_t *)&state, 0xCu);
  }
  v13 = self->_registrations;
  objc_sync_enter(v13);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_registrations, "objectForKeyedSubscript:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v13);

  if (v14)
  {
    v15 = self->_keyPathToValues;
    objc_sync_enter(v15);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v14, "predicate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "keyPaths");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v37 != v19)
            objc_enumerationMutation(v17);
          -[NSMutableDictionary removeObjectForKey:](self->_keyPathToValues, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v18);
    }

    objc_sync_exit(v15);
    objc_msgSend(v14, "callback");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    registrationCallbackQueue = self->_registrationCallbackQueue;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __56___CDClientContext_handleContextualChange_info_handler___block_invoke;
    v29[3] = &unk_1E26D53C8;
    v30 = v14;
    v31 = v8;
    v32 = v9;
    v34 = v21;
    v35 = v10;
    v33 = self;
    v24 = v29;
    v25 = registrationCallbackQueue;
    v26 = v21;
    v27 = (void *)os_transaction_create();
    state.opaque[0] = v22;
    state.opaque[1] = 3221225472;
    v42 = __cd_dispatch_async_capture_tx_block_invoke_0;
    v43 = &unk_1E26D4F60;
    v44 = v27;
    v45 = v24;
    v28 = v27;
    dispatch_async(v25, &state);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[_CDClientContext handleContextualChange:info:handler:].cold.1();
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

- (id)objectForContextualKeyPath:(id)a3
{
  if (!a3)
    return 0;
  -[_CDClientContext objectForContextualKeyPath:synchronous:responseQueue:withCompletion:](self, "objectForContextualKeyPath:synchronous:responseQueue:withCompletion:", a3, 1, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)objectForContextualKeyPath:(id)a3 synchronous:(BOOL)a4 responseQueue:(id)a5 withCompletion:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  int v29;
  NSObject *v30;
  NSObject *v31;
  const char *v32;
  void *v34;
  _QWORD v35[5];
  id v36;
  NSObject *v37;
  id v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  os_activity_scope_state_s state;
  _QWORD v47[4];
  id v48;
  NSObject *v49;
  _QWORD block[4];
  id v51;
  id v52;
  _QWORD v53[5];
  id v54;
  NSObject *v55;
  id v56;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[_CDClientContext logFaultIfDeprecatedKeyPath:](self, "logFaultIfDeprecatedKeyPath:", v10);
  v13 = MEMORY[0x1E0C809B0];
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __88___CDClientContext_objectForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke;
  v53[3] = &unk_1E26D52D8;
  v53[4] = self;
  v14 = v10;
  v54 = v14;
  v15 = v12;
  v56 = v15;
  v16 = v11;
  v55 = v16;
  v17 = (void *)MEMORY[0x193FEDDDC](v53);
  -[_CDClientContext currentConnection](self, "currentConnection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v8)
    objc_msgSend(v18, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  else
    objc_msgSend(v18, "remoteObjectProxyWithErrorHandler:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  +[_CDContextQueries keyPathForSystemTime](_CDContextQueries, "keyPathForSystemTime");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v14, "isEqual:", v21);

  if (!v22)
  {
    -[_CDClientContext cachedValueIfClientHasRegistrationsForKeyPath:](self, "cachedValueIfClientHasRegistrationsForKeyPath:", v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "value");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v23 = (id)v26;
      v34 = v20;
      v27 = v13;
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v23, "isEqual:", v28);

      if (v29)
      {

        v23 = 0;
      }
      if (!v15)
      {
        v20 = v34;
        goto LABEL_28;
      }
      v30 = v16;
      if (!v16)
      {
        -[_CDClientContext defaultCallbackQueue](self, "defaultCallbackQueue");
        v30 = objc_claimAutoreleasedReturnValue();
      }
      v47[0] = v27;
      v47[1] = 3221225472;
      v47[2] = __88___CDClientContext_objectForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_3;
      v47[3] = &unk_1E26D4F60;
      v49 = v15;
      v23 = v23;
      v48 = v23;
      dispatch_async(v30, v47);
      if (!v16)

      v31 = v49;
      v20 = v34;
    }
    else
    {
      if (v8)
        v32 = "Duet: ClientContext objectForContextualKeyPath:";
      else
        v32 = "Duet: ClientContext objectForContextualKeyPath:responseQueue:withCompletion:";
      v31 = _os_activity_create(&dword_18DD73000, v32, MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v31, &state);
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
        -[_CDClientContext objectForContextualKeyPath:synchronous:responseQueue:withCompletion:].cold.1();
      v40 = 0;
      v41 = &v40;
      v42 = 0x3032000000;
      v43 = __Block_byref_object_copy__1;
      v44 = __Block_byref_object_dispose__1;
      v45 = 0;
      v35[0] = v13;
      v35[1] = 3221225472;
      v35[2] = __88___CDClientContext_objectForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_126;
      v35[3] = &unk_1E26D5328;
      v39 = &v40;
      v35[4] = self;
      v36 = v14;
      v38 = v15;
      v37 = v16;
      objc_msgSend(v20, "propertiesOfPath:handler:", v36, v35);
      v23 = (id)v41[5];

      _Block_object_dispose(&v40, 8);
      os_activity_scope_leave(&state);
    }

LABEL_28:
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v24 = v16;
    if (!v16)
    {
      -[_CDClientContext defaultCallbackQueue](self, "defaultCallbackQueue");
      v24 = objc_claimAutoreleasedReturnValue();
    }
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __88___CDClientContext_objectForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_2;
    block[3] = &unk_1E26D4F60;
    v52 = v15;
    v23 = v23;
    v51 = v23;
    dispatch_async(v24, block);
    if (!v16)

    v25 = v52;
    goto LABEL_28;
  }
LABEL_29:

  return v23;
}

- (id)currentConnection
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37___CDClientContext_currentConnection__block_invoke;
  v5[3] = &unk_1E26D5188;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)logFaultIfDeprecatedKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  v4 = a3;
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[_CDContextQueries keyPathForDeviceName](_CDContextQueries, "keyPathForDeviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if (v9 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_FAULT))
      -[_CDClientContext logFaultIfDeprecatedKeyPath:].cold.1();

  }
}

- (id)cachedValueIfClientHasRegistrationsForKeyPath:(id)a3
{
  id v4;
  NSCountedSet *v5;
  NSUInteger v6;
  NSMutableDictionary *v7;
  void *v8;

  v4 = a3;
  v5 = self->_keyPathsWithRegistrationsForAnyChange;
  objc_sync_enter(v5);
  v6 = -[NSCountedSet countForObject:](self->_keyPathsWithRegistrationsForAnyChange, "countForObject:", v4);
  objc_sync_exit(v5);

  if (v6)
  {
    v7 = self->_keyPathToValues;
    objc_sync_enter(v7);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_keyPathToValues, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (_CDClientContext)initWithEndpoint:(id)a3
{
  id v4;
  _CDClientContext *v5;
  uint64_t v6;
  NSCountedSet *keyPathsWithRegistrationsForAnyChange;
  uint64_t v8;
  NSMutableDictionary *registrations;
  uint64_t v10;
  NSMutableDictionary *openRegistrationTokens;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *registrationCallbackQueue;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *xpcQueue;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *xpcEventQueue;
  uint64_t v24;
  NSMutableDictionary *keyPathToValues;
  os_log_t v26;
  OS_os_log *log;
  NSObject *v28;
  _CDClientContext *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t);
  void *v34;
  _CDClientContext *v35;
  id v36;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)_CDClientContext;
  v5 = -[_CDClientContext init](&v37, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    keyPathsWithRegistrationsForAnyChange = v5->_keyPathsWithRegistrationsForAnyChange;
    v5->_keyPathsWithRegistrationsForAnyChange = (NSCountedSet *)v6;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    registrations = v5->_registrations;
    v5->_registrations = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    openRegistrationTokens = v5->_openRegistrationTokens;
    v5->_openRegistrationTokens = (NSMutableDictionary *)v10;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.cdclientcontext.queue", v12);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v13;

    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.cdclientcontext.registrationCallbackQueue", v15);
    registrationCallbackQueue = v5->_registrationCallbackQueue;
    v5->_registrationCallbackQueue = (OS_dispatch_queue *)v16;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create("com.apple.cdclientcontext.xpcQueue", v18);
    xpcQueue = v5->_xpcQueue;
    v5->_xpcQueue = (OS_dispatch_queue *)v19;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create("com.apple.cdclientcontext.xpcEventQueue", v21);
    xpcEventQueue = v5->_xpcEventQueue;
    v5->_xpcEventQueue = (OS_dispatch_queue *)v22;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = objc_claimAutoreleasedReturnValue();
    keyPathToValues = v5->_keyPathToValues;
    v5->_keyPathToValues = (NSMutableDictionary *)v24;

    v5->_interrupted = 1;
    v26 = os_log_create("com.apple.coreduet.context", "client");
    log = v5->_log;
    v5->_log = (OS_os_log *)v26;

    v28 = v5->_queue;
    v31 = MEMORY[0x1E0C809B0];
    v32 = 3221225472;
    v33 = __37___CDClientContext_initWithEndpoint___block_invoke;
    v34 = &unk_1E26D46A8;
    v29 = v5;
    v35 = v29;
    v36 = v4;
    dispatch_sync(v28, &v31);
    -[_CDClientContext subscribeToEventStreams](v29, "subscribeToEventStreams", v31, v32, v33, v34);

  }
  return v5;
}

- (void)subscribeToEventStreams
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43___CDClientContext_subscribeToEventStreams__block_invoke;
  block[3] = &unk_1E26D46E0;
  block[4] = self;
  if (subscribeToEventStreams_onceToken != -1)
    dispatch_once(&subscribeToEventStreams_onceToken, block);
}

- (void)unprotectedSetUpXPCConnectionWithEndpoint:(id)a3
{
  __CFString *v5;
  NSObject *v6;
  NSObject *log;
  const __CFString *v8;
  NSXPCConnection *v9;
  NSXPCConnection *v10;
  void *v11;
  void *v12;
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  _CDClientContext *v19;
  id v20;
  os_activity_scope_state_s state;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a3;
  if (self->_interrupted)
  {
    v6 = _os_activity_create(&dword_18DD73000, "Duet: ClientContext setupXPCConnection:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v6, &state);
    os_activity_scope_leave(&state);

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("com.apple.coreduetd.context");
      if (v5)
        v8 = v5;
      LODWORD(state.opaque[0]) = 138412290;
      *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v8;
      _os_log_impl(&dword_18DD73000, log, OS_LOG_TYPE_DEFAULT, "Setting up XPC connection with %@", (uint8_t *)&state, 0xCu);
    }
    -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
    if (v5)
    {
      objc_storeStrong((id *)&self->_endpoint, a3);
      v9 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v5);
    }
    else
    {
      v9 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.coreduetd.context"), 4096);
    }
    v10 = v9;
    -[NSXPCConnection _setQueue:](v9, "_setQueue:", self->_xpcQueue);
    objc_initWeak((id *)&state, self);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __62___CDClientContext_unprotectedSetUpXPCConnectionWithEndpoint___block_invoke;
    v18 = &unk_1E26D5160;
    objc_copyWeak(&v20, (id *)&state);
    v19 = self;
    -[NSXPCConnection setInterruptionHandler:](v10, "setInterruptionHandler:", &v15);
    objc_msgSend((id)objc_opt_class(), "serverInterface", v15, v16, v17, v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v10, "setRemoteObjectInterface:", v11);

    objc_msgSend((id)objc_opt_class(), "clientInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v10, "setExportedInterface:", v12);

    -[NSXPCConnection setExportedObject:](v10, "setExportedObject:", self);
    -[NSXPCConnection resume](v10, "resume");
    self->_interrupted = 0;
    xpcConnection = self->_xpcConnection;
    self->_xpcConnection = v10;
    v14 = v10;

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)&state);
  }

}

+ (id)serverInterface
{
  if (serverInterface_onceToken != -1)
    dispatch_once(&serverInterface_onceToken, &__block_literal_global_28);
  return (id)serverInterface_serverInterface;
}

+ (id)clientInterface
{
  if (clientInterface_onceToken != -1)
    dispatch_once(&clientInterface_onceToken, &__block_literal_global_86);
  return (id)clientInterface_clientInterface;
}

+ (id)userContext
{
  if (userContext_onceToken != -1)
    dispatch_once(&userContext_onceToken, &__block_literal_global_110_0);
  return (id)userContext_context;
}

- (BOOL)setObject:(id)a3 forContextualKeyPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  os_activity_scope_state_s v11;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18DD73000, "Duet: ClientContext setObject:forContextualKeyPath:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v8, &v11);
  os_activity_scope_leave(&v11);

  if (v7)
    v9 = -[_CDClientContext setObject:forContextualKeyPath:synchronous:responseQueue:withCompletion:](self, "setObject:forContextualKeyPath:synchronous:responseQueue:withCompletion:", v6, v7, 1, 0, 0);
  else
    v9 = 0;

  return v9;
}

- (BOOL)setObject:(id)a3 forContextualKeyPath:(id)a4 synchronous:(BOOL)a5 responseQueue:(id)a6 withCompletion:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  NSObject *log;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  BOOL v29;
  _QWORD v31[4];
  id v32;
  _CDClientContext *v33;
  id v34;
  id v35;
  __int128 *p_buf;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  id v41;
  __int128 buf;
  uint64_t v43;
  char v44;
  uint64_t v45;

  v9 = a5;
  v45 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  -[_CDClientContext logFaultIfDeprecatedKeyPath:](self, "logFaultIfDeprecatedKeyPath:", v13);
  v16 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __92___CDClientContext_setObject_forContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke;
  v37[3] = &unk_1E26D53F0;
  v37[4] = self;
  v17 = v12;
  v38 = v17;
  v18 = v13;
  v39 = v18;
  v19 = v15;
  v41 = v19;
  v20 = v14;
  v40 = v20;
  v21 = (void *)MEMORY[0x193FEDDDC](v37);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v18;
    _os_log_impl(&dword_18DD73000, log, OS_LOG_TYPE_INFO, "Setting keypath: %@", (uint8_t *)&buf, 0xCu);
  }
  -[_CDClientContext currentConnection](self, "currentConnection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v9)
    objc_msgSend(v23, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  else
    objc_msgSend(v23, "remoteObjectProxyWithErrorHandler:", v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v43 = 0x2020000000;
  v44 = 0;
  v31[0] = v16;
  v31[1] = 3221225472;
  v31[2] = __92___CDClientContext_setObject_forContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_137;
  v31[3] = &unk_1E26D5440;
  p_buf = &buf;
  v26 = v19;
  v35 = v26;
  v27 = v20;
  v32 = v27;
  v33 = self;
  v28 = v18;
  v34 = v28;
  objc_msgSend(v25, "setObject:forPath:handler:", v17, v28, v31);
  v29 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return v29;
}

- (void)deregisterCallback:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *log;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  os_activity_scope_state_s v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_18DD73000, "Duet: ClientContext deregisterCallback:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v5, &v11);
  os_activity_scope_leave(&v11);

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v7 = log;
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11.opaque[0]) = 138412290;
    *(uint64_t *)((char *)v11.opaque + 4) = (uint64_t)v8;
    _os_log_impl(&dword_18DD73000, v7, OS_LOG_TYPE_DEFAULT, "Deregistering callback: %@", (uint8_t *)&v11, 0xCu);

  }
  -[_CDClientContext currentConnection](self, "currentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deregisterCallback:", v4);

  -[_CDClientContext cleanupInternalReferencesToRegistration:](self, "cleanupInternalReferencesToRegistration:", v4);
}

- (void)cleanupInternalReferencesToRegistration:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *registrations;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *openRegistrationTokens;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[_CDClientContext removeKeyPathsWithRegistrationsForAnyChangeFromRegistration:](self, "removeKeyPathsWithRegistrationsForAnyChangeFromRegistration:", v13);
  v4 = self->_registrations;
  objc_sync_enter(v4);
  registrations = self->_registrations;
  objc_msgSend(v13, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](registrations, "removeObjectForKey:", v6);

  objc_sync_exit(v4);
  v7 = self->_openRegistrationTokens;
  objc_sync_enter(v7);
  openRegistrationTokens = self->_openRegistrationTokens;
  objc_msgSend(v13, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](openRegistrationTokens, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    notify_cancel(objc_msgSend(v10, "intValue"));
    v11 = self->_openRegistrationTokens;
    objc_msgSend(v13, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v11, "removeObjectForKey:", v12);

  }
  objc_sync_exit(v7);

}

- (void)removeKeyPathsWithRegistrationsForAnyChangeFromRegistration:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSCountedSet *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  NSMutableDictionary *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "firesOnAnyChange");

  if (v6)
  {
    v7 = self->_keyPathsWithRegistrationsForAnyChange;
    objc_sync_enter(v7);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v4, "predicate", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "keyPaths");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v9);
          v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          -[NSCountedSet removeObject:](self->_keyPathsWithRegistrationsForAnyChange, "removeObject:", v13);
          if (!-[NSCountedSet countForObject:](self->_keyPathsWithRegistrationsForAnyChange, "countForObject:", v13))
          {
            v14 = self->_keyPathToValues;
            objc_sync_enter(v14);
            -[NSMutableDictionary removeObjectForKey:](self->_keyPathToValues, "removeObjectForKey:", v13);
            objc_sync_exit(v14);

          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    objc_sync_exit(v7);
  }

}

- (id)lastModifiedDateForContextualKeyPath:(id)a3
{
  if (!a3)
    return 0;
  -[_CDClientContext lastModifiedDateForContextualKeyPath:synchronous:responseQueue:withCompletion:](self, "lastModifiedDateForContextualKeyPath:synchronous:responseQueue:withCompletion:", a3, 1, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)lastModifiedDateForContextualKeyPath:(id)a3 synchronous:(BOOL)a4 responseQueue:(id)a5 withCompletion:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  _QWORD v30[5];
  id v31;
  NSObject *v32;
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  os_activity_scope_state_s state;
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD block[4];
  id v46;
  id v47;
  _QWORD v48[5];
  id v49;
  NSObject *v50;
  id v51;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[_CDClientContext logFaultIfDeprecatedKeyPath:](self, "logFaultIfDeprecatedKeyPath:", v10);
  v13 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __98___CDClientContext_lastModifiedDateForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke;
  v48[3] = &unk_1E26D52D8;
  v48[4] = self;
  v14 = v10;
  v49 = v14;
  v15 = v12;
  v51 = v15;
  v16 = v11;
  v50 = v16;
  v17 = (void *)MEMORY[0x193FEDDDC](v48);
  -[_CDClientContext currentConnection](self, "currentConnection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v8)
    objc_msgSend(v18, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  else
    objc_msgSend(v18, "remoteObjectProxyWithErrorHandler:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  +[_CDContextQueries keyPathForSystemTime](_CDContextQueries, "keyPathForSystemTime");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v14, "isEqual:", v21);

  if (!v22)
  {
    -[_CDClientContext cachedValueIfClientHasRegistrationsForKeyPath:](self, "cachedValueIfClientHasRegistrationsForKeyPath:", v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      if (v15)
      {
        v26 = v16;
        if (!v16)
        {
          -[_CDClientContext defaultCallbackQueue](self, "defaultCallbackQueue");
          v26 = objc_claimAutoreleasedReturnValue();
        }
        v42[0] = v13;
        v42[1] = 3221225472;
        v42[2] = __98___CDClientContext_lastModifiedDateForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_3;
        v42[3] = &unk_1E26D4F60;
        v44 = v15;
        v43 = v25;
        dispatch_async(v26, v42);
        if (!v16)

      }
      objc_msgSend(v25, "lastModifiedDate");
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v8)
        v27 = "Duet: ClientContext lastModifiedDateForContextualKeyPath:";
      else
        v27 = "Duet: ClientContext lastModifiedDateForContextualKeyPath:responseQueue:withCompletion:";
      v28 = _os_activity_create(&dword_18DD73000, v27, MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v28, &state);
      v35 = 0;
      v36 = &v35;
      v37 = 0x3032000000;
      v38 = __Block_byref_object_copy__1;
      v39 = __Block_byref_object_dispose__1;
      v40 = 0;
      v30[0] = v13;
      v30[1] = 3221225472;
      v30[2] = __98___CDClientContext_lastModifiedDateForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_4;
      v30[3] = &unk_1E26D5328;
      v34 = &v35;
      v30[4] = self;
      v31 = v14;
      v33 = v15;
      v32 = v16;
      objc_msgSend(v20, "propertiesOfPath:handler:", v31, v30);
      v23 = (id)v36[5];

      _Block_object_dispose(&v35, 8);
      os_activity_scope_leave(&state);

    }
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v24 = v16;
    if (!v16)
    {
      -[_CDClientContext defaultCallbackQueue](self, "defaultCallbackQueue");
      v24 = objc_claimAutoreleasedReturnValue();
    }
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __98___CDClientContext_lastModifiedDateForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_2;
    block[3] = &unk_1E26D4F60;
    v47 = v15;
    v23 = v23;
    v46 = v23;
    dispatch_async(v24, block);
    if (!v16)

    v25 = v47;
LABEL_23:

  }
  return v23;
}

- (BOOL)addObjects:(id)a3 toArrayAtKeyPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  os_activity_scope_state_s v11;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18DD73000, "Duet: ClientContext addObjects:toArrayAtKeyPath:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v8, &v11);
  os_activity_scope_leave(&v11);

  if (objc_msgSend(v6, "count"))
    v9 = -[_CDClientContext addObjects:toArrayAtKeyPath:synchronous:responseQueue:withCompletion:](self, "addObjects:toArrayAtKeyPath:synchronous:responseQueue:withCompletion:", v6, v7, 1, 0, 0);
  else
    v9 = 0;

  return v9;
}

- (BOOL)addObjects:(id)a3 toArrayAtKeyPath:(id)a4 synchronous:(BOOL)a5 responseQueue:(id)a6 withCompletion:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  NSObject *log;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  BOOL v29;
  _QWORD v31[4];
  id v32;
  _CDClientContext *v33;
  id v34;
  id v35;
  __int128 *p_buf;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  id v41;
  __int128 buf;
  uint64_t v43;
  char v44;
  uint64_t v45;

  v9 = a5;
  v45 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  -[_CDClientContext logFaultIfDeprecatedKeyPath:](self, "logFaultIfDeprecatedKeyPath:", v13);
  v16 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __89___CDClientContext_addObjects_toArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke;
  v37[3] = &unk_1E26D53F0;
  v37[4] = self;
  v17 = v12;
  v38 = v17;
  v18 = v13;
  v39 = v18;
  v19 = v15;
  v41 = v19;
  v20 = v14;
  v40 = v20;
  v21 = (void *)MEMORY[0x193FEDDDC](v37);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v18;
    _os_log_impl(&dword_18DD73000, log, OS_LOG_TYPE_INFO, "Adding object to keypath: %@", (uint8_t *)&buf, 0xCu);
  }
  -[_CDClientContext currentConnection](self, "currentConnection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v9)
    objc_msgSend(v23, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  else
    objc_msgSend(v23, "remoteObjectProxyWithErrorHandler:", v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v43 = 0x2020000000;
  v44 = 0;
  v31[0] = v16;
  v31[1] = 3221225472;
  v31[2] = __89___CDClientContext_addObjects_toArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_139;
  v31[3] = &unk_1E26D5440;
  p_buf = &buf;
  v26 = v19;
  v35 = v26;
  v27 = v20;
  v32 = v27;
  v33 = self;
  v28 = v18;
  v34 = v28;
  objc_msgSend(v25, "addObjects:andRemoveObjects:forArrayAtPath:handler:", v17, 0, v28, v31);
  v29 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return v29;
}

- (id)defaultCallbackQueue
{
  if (defaultCallbackQueue_onceToken != -1)
    dispatch_once(&defaultCallbackQueue_onceToken, &__block_literal_global_96_0);
  return (id)defaultCallbackQueue_callbackQueue;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_CDClientContext;
  -[_CDClientContext dealloc](&v3, sel_dealloc);
}

+ (id)userContextWithEndpoint:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEndpoint:", v3);

  return v4;
}

- (void)handleMDCSEvent:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  switch(+[_CDXPCCodecs eventTypeWithEvent:](_CDXPCContextCodecs, "eventTypeWithEvent:", v4))
  {
    case 1:
      -[_CDClientContext handleFetchPropertiesEvent:](self, "handleFetchPropertiesEvent:", v4);
      goto LABEL_11;
    case 2:
      -[_CDClientContext handleSubscribeToContextValueNotificationsEvent:](self, "handleSubscribeToContextValueNotificationsEvent:", v4);
      goto LABEL_11;
    case 3:
      -[_CDClientContext handleUnsubscribeFromContextValueNotificationsEvent:](self, "handleUnsubscribeFromContextValueNotificationsEvent:", v4);
      goto LABEL_11;
    case 4:
      -[_CDClientContext handleKeepAliveEvent:](self, "handleKeepAliveEvent:", v4);
      goto LABEL_11;
    case 5:
      -[_CDClientContext handleFetchProxySourceDeviceUUIDEvent:](self, "handleFetchProxySourceDeviceUUIDEvent:", v4);
      goto LABEL_11;
    case 6:
      -[_CDClientContext handleRequestActivateDevicesEvent:](self, "handleRequestActivateDevicesEvent:", v4);
      goto LABEL_11;
    default:
      v5 = (void *)MEMORY[0x193FEDFE0](v4);
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      {
        -[_CDClientContext handleMDCSEvent:].cold.1();
        if (!v5)
          goto LABEL_11;
      }
      else if (!v5)
      {
        goto LABEL_11;
      }
      free(v5);
LABEL_11:

      return;
  }
}

- (void)handleFetchPropertiesEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _CDRemoteUserContextServer *remoteUserContextProxy;
  void *v8;
  NSObject *log;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  v14 = 0;
  +[_CDXPCContextCodecs keyPathsFromFetchPropertiesEvent:error:](_CDXPCContextCodecs, "keyPathsFromFetchPropertiesEvent:error:", v4, &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  if (v5)
  {
    remoteUserContextProxy = self->_remoteUserContextProxy;
    if (remoteUserContextProxy)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __47___CDClientContext_handleFetchPropertiesEvent___block_invoke;
      v12[3] = &unk_1E26D51F8;
      v12[4] = self;
      v13 = v4;
      -[_CDRemoteUserContextServer fetchPropertiesOfRemoteKeyPaths:handler:](remoteUserContextProxy, "fetchPropertiesOfRemoteKeyPaths:handler:", v5, v12);

    }
    else
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        -[_CDClientContext handleFetchPropertiesEvent:].cold.1(log);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D15BF0], *MEMORY[0x1E0D15C10], 0);
      v10 = objc_claimAutoreleasedReturnValue();

      +[_CDXPCCodecs fetchPropertiesReplyWithEvent:error:](_CDXPCContextCodecs, "fetchPropertiesReplyWithEvent:error:", v4, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        xpc_dictionary_send_reply();

      v6 = (id)v10;
    }
  }
  else
  {
    +[_CDXPCCodecs fetchPropertiesReplyWithEvent:error:](_CDXPCContextCodecs, "fetchPropertiesReplyWithEvent:error:", v4, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      xpc_dictionary_send_reply();

  }
}

- (void)handleSubscribeToContextValueNotificationsEvent:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;
  id v7;
  id v8;
  NSObject *log;
  NSObject *v10;
  void *v11;
  _CDRemoteUserContextServer *remoteUserContextProxy;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_remoteUserContextProxy)
  {
    v17 = 0;
    v18 = 0;
    v16 = 0;
    v5 = +[_CDXPCContextCodecs parseSubscribeToContextValueNotificationsEvent:registration:deviceIDs:error:](_CDXPCContextCodecs, "parseSubscribeToContextValueNotificationsEvent:registration:deviceIDs:error:", v4, &v18, &v17, &v16);
    v6 = v18;
    v7 = v17;
    v8 = v16;
    if (v5)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        v10 = log;
        objc_msgSend(v6, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v20 = v11;
        v21 = 2112;
        v22 = v6;
        _os_log_impl(&dword_18DD73000, v10, OS_LOG_TYPE_INFO, "Handling subscribe to context value change notifications request with registration %@: %@", buf, 0x16u);

      }
      remoteUserContextProxy = self->_remoteUserContextProxy;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __68___CDClientContext_handleSubscribeToContextValueNotificationsEvent___block_invoke;
      v14[3] = &unk_1E26D5220;
      v15 = v4;
      -[_CDRemoteUserContextServer subscribeToContextValueChangeNotificationsWithRegistration:deviceIDs:handler:](remoteUserContextProxy, "subscribeToContextValueChangeNotificationsWithRegistration:deviceIDs:handler:", v6, v7, v14);
      v13 = v15;
    }
    else
    {
      +[_CDXPCContextCodecs subscribeToContextValueNotificationsReplyWithEvent:error:](_CDXPCContextCodecs, "subscribeToContextValueNotificationsReplyWithEvent:error:", v4, v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        xpc_dictionary_send_reply();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D15BF0], *MEMORY[0x1E0D15C10], 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[_CDXPCContextCodecs subscribeToContextValueNotificationsReplyWithEvent:error:](_CDXPCContextCodecs, "subscribeToContextValueNotificationsReplyWithEvent:error:", v4, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
      xpc_dictionary_send_reply();
  }

}

- (void)handleUnsubscribeFromContextValueNotificationsEvent:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;
  id v7;
  id v8;
  NSObject *log;
  NSObject *v10;
  void *v11;
  _CDRemoteUserContextServer *remoteUserContextProxy;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_remoteUserContextProxy)
  {
    v17 = 0;
    v18 = 0;
    v16 = 0;
    v5 = +[_CDXPCContextCodecs parseUnsubscribeFromContextValueNotificationsEvent:registration:deviceIDs:error:](_CDXPCContextCodecs, "parseUnsubscribeFromContextValueNotificationsEvent:registration:deviceIDs:error:", v4, &v18, &v17, &v16);
    v6 = v18;
    v7 = v17;
    v8 = v16;
    if (v5)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        v10 = log;
        objc_msgSend(v6, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v20 = v11;
        v21 = 2112;
        v22 = v6;
        _os_log_impl(&dword_18DD73000, v10, OS_LOG_TYPE_INFO, "Handling unsubscribe from context value change notifications request with registration %@: %@", buf, 0x16u);

      }
      remoteUserContextProxy = self->_remoteUserContextProxy;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __72___CDClientContext_handleUnsubscribeFromContextValueNotificationsEvent___block_invoke;
      v14[3] = &unk_1E26D5220;
      v15 = v4;
      -[_CDRemoteUserContextServer unsubscribeFromContextValueChangeNotificationsWithRegistration:deviceIDs:handler:](remoteUserContextProxy, "unsubscribeFromContextValueChangeNotificationsWithRegistration:deviceIDs:handler:", v6, v7, v14);
      v13 = v15;
    }
    else
    {
      +[_CDXPCContextCodecs unsubscribeFromContextValueNotificationsReplyWithEvent:error:](_CDXPCContextCodecs, "unsubscribeFromContextValueNotificationsReplyWithEvent:error:", v4, v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        xpc_dictionary_send_reply();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D15BF0], *MEMORY[0x1E0D15C10], 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[_CDXPCContextCodecs unsubscribeFromContextValueNotificationsReplyWithEvent:error:](_CDXPCContextCodecs, "unsubscribeFromContextValueNotificationsReplyWithEvent:error:", v4, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
      xpc_dictionary_send_reply();
  }

}

- (void)handleKeepAliveEvent:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  NSObject *log;
  _BOOL4 v9;
  const char *v10;
  _CDRemoteUserContextServer *remoteUserContextProxy;
  _QWORD v12[4];
  id v13;
  uint8_t buf[8];
  id v15;

  v4 = a3;
  if (!self->_remoteUserContextProxy)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D15BF0], *MEMORY[0x1E0D15C10], 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v15 = 0;
  v5 = +[_CDXPCCodecs keepAliveFromKeepAliveEvent:error:](_CDXPCContextCodecs, "keepAliveFromKeepAliveEvent:error:", v4, &v15);
  v6 = v15;
  if (!v6)
  {
    log = self->_log;
    v9 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        v10 = "Handling request to keep alive";
LABEL_12:
        _os_log_impl(&dword_18DD73000, log, OS_LOG_TYPE_INFO, v10, buf, 2u);
      }
    }
    else if (v9)
    {
      *(_WORD *)buf = 0;
      v10 = "Handling request to no longer keep alive";
      goto LABEL_12;
    }
    remoteUserContextProxy = self->_remoteUserContextProxy;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __41___CDClientContext_handleKeepAliveEvent___block_invoke;
    v12[3] = &unk_1E26D5220;
    v13 = v4;
    -[_CDRemoteUserContextServer subscribeToDeviceStatusChangeNotificationsForDeviceTypes:handler:](remoteUserContextProxy, "subscribeToDeviceStatusChangeNotificationsForDeviceTypes:handler:", 0xFFFFLL, v12);
    v7 = v13;
    goto LABEL_14;
  }
LABEL_5:
  +[_CDXPCCodecs keepAliveReplyWithEvent:error:](_CDXPCContextCodecs, "keepAliveReplyWithEvent:error:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    xpc_dictionary_send_reply();
LABEL_14:

}

- (void)handleFetchProxySourceDeviceUUIDEvent:(id)a3
{
  id v4;
  _CDRemoteUserContextServer *remoteUserContextProxy;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *log;
  uint8_t v12[16];

  v4 = a3;
  remoteUserContextProxy = self->_remoteUserContextProxy;
  if (!remoteUserContextProxy)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D15BF0], *MEMORY[0x1E0D15C10], 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDXPCCodecs keepAliveReplyWithEvent:error:](_CDXPCContextCodecs, "keepAliveReplyWithEvent:error:", v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_13;
    goto LABEL_12;
  }
  -[_CDRemoteUserContextServer sourceDeviceUUID](remoteUserContextProxy, "sourceDeviceUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D15BF0], *MEMORY[0x1E0D15C20], 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[_CDXPCCodecs fetchProxySourceDeviceUUIDReplyWithEvent:sourceDeviceUUID:error:](_CDXPCContextCodecs, "fetchProxySourceDeviceUUIDReplyWithEvent:sourceDeviceUUID:error:", v4, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[_CDXPCCodecs keepAliveReplyWithEvent:error:](_CDXPCContextCodecs, "keepAliveReplyWithEvent:error:", v4, v7);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_18DD73000, log, OS_LOG_TYPE_INFO, "Handling request for source device uuid", v12, 2u);
    }
  }

  if (v9)
LABEL_12:
    xpc_dictionary_send_reply();
LABEL_13:

}

- (void)handleRequestActivateDevicesEvent:(id)a3
{
  id v4;
  NSObject *log;
  _CDRemoteUserContextServer *remoteUserContextProxy;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  if (self->_remoteUserContextProxy)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DD73000, log, OS_LOG_TYPE_INFO, "Handling request for activate devices", buf, 2u);
    }
    remoteUserContextProxy = self->_remoteUserContextProxy;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54___CDClientContext_handleRequestActivateDevicesEvent___block_invoke;
    v9[3] = &unk_1E26D5220;
    v10 = v4;
    -[_CDRemoteUserContextServer requestActivateDevicesWithHandler:](remoteUserContextProxy, "requestActivateDevicesWithHandler:", v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D15BF0], *MEMORY[0x1E0D15C10], 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDXPCCodecs requestActivateDevicesReplyWithEvent:error:](_CDXPCContextCodecs, "requestActivateDevicesReplyWithEvent:error:", v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      xpc_dictionary_send_reply();

  }
}

- (void)handleNotificationEvent:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;
  id v7;
  id v8;
  NSObject *log;
  NSMutableDictionary *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[2];
  _QWORD v19[2];
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0;
  v17 = 0;
  v15 = 0;
  v5 = +[_CDXPCCodecs parseNotificationEvent:registrationIdentifier:info:error:](_CDXPCContextCodecs, "parseNotificationEvent:registrationIdentifier:info:error:", v4, &v17, &v16, &v15);
  v6 = v17;
  v7 = v16;
  v8 = v15;
  log = self->_log;
  if (v5)
  {
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v6;
      v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_18DD73000, log, OS_LOG_TYPE_DEFAULT, "Received context value change notification for registration %@: %@", buf, 0x16u);
    }
    v10 = self->_registrations;
    objc_sync_enter(v10);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_registrations, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v10);

    if (v11)
    {
      -[_CDClientContext handleContextualChange:info:handler:](self, "handleContextualChange:info:handler:", v6, v7, &__block_literal_global_119_0);
    }
    else
    {
      v12 = self->_log;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v6;
        _os_log_impl(&dword_18DD73000, v12, OS_LOG_TYPE_DEFAULT, "Sending change notification for registration %@", buf, 0xCu);
      }
      v18[0] = CFSTR("RegistrationIdentifier");
      v18[1] = CFSTR("Info");
      v19[0] = v6;
      v19[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("_CDClientContextContextChanged"), self, v13);

    }
  }
  else if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    -[_CDClientContext handleNotificationEvent:].cold.1((uint64_t)v6, (uint64_t)v8, log);
  }

}

- (BOOL)hasKnowledgeOfContextualKeyPath:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[5];
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  -[_CDClientContext logFaultIfDeprecatedKeyPath:](self, "logFaultIfDeprecatedKeyPath:", v4);
  +[_CDContextQueries keyPathForSystemTime](_CDContextQueries, "keyPathForSystemTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    -[_CDClientContext currentConnection](self, "currentConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __52___CDClientContext_hasKnowledgeOfContextualKeyPath___block_invoke;
    v14[3] = &unk_1E26D51F8;
    v14[4] = self;
    v10 = v4;
    v15 = v10;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __52___CDClientContext_hasKnowledgeOfContextualKeyPath___block_invoke_123;
    v13[3] = &unk_1E26D5288;
    v13[4] = &v16;
    objc_msgSend(v11, "hasKnowledgeOfPath:handler:", v10, v13);

    v7 = *((_BYTE *)v17 + 24) != 0;
    _Block_object_dispose(&v16, 8);
  }

  return v7;
}

- (void)objectForContextualKeyPath:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8 && v10)
  {
    v12 = -[_CDClientContext objectForContextualKeyPath:synchronous:responseQueue:withCompletion:](self, "objectForContextualKeyPath:synchronous:responseQueue:withCompletion:", v8, 0, v9, v10);
  }
  else if (v10)
  {
    v13 = v9;
    if (!v9)
    {
      -[_CDClientContext defaultCallbackQueue](self, "defaultCallbackQueue");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76___CDClientContext_objectForContextualKeyPath_responseQueue_withCompletion___block_invoke;
    block[3] = &unk_1E26D52B0;
    v15 = v11;
    dispatch_async(v13, block);
    if (!v9)

  }
}

- (void)lastModifiedDateForContextualKeyPath:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8 && v10)
  {
    v12 = -[_CDClientContext lastModifiedDateForContextualKeyPath:synchronous:responseQueue:withCompletion:](self, "lastModifiedDateForContextualKeyPath:synchronous:responseQueue:withCompletion:", v8, 0, v9, v10);
  }
  else if (v10)
  {
    v13 = v9;
    if (!v9)
    {
      -[_CDClientContext defaultCallbackQueue](self, "defaultCallbackQueue");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86___CDClientContext_lastModifiedDateForContextualKeyPath_responseQueue_withCompletion___block_invoke;
    block[3] = &unk_1E26D52B0;
    v15 = v11;
    dispatch_async(v13, block);
    if (!v9)

  }
}

- (void)addKeyPathsWithRegistrationsForAnyChangeFromRegistration:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSCountedSet *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "firesOnAnyChange");

  if (v6)
  {
    v7 = self->_keyPathsWithRegistrationsForAnyChange;
    objc_sync_enter(v7);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v4, "predicate", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "keyPaths");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v9);
          -[NSCountedSet addObject:](self->_keyPathsWithRegistrationsForAnyChange, "addObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

    objc_sync_exit(v7);
  }

}

- (void)clearCacheForKeyPathsWithFireOnChangeRegistrations:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "firesOnAnyChange");

  if (v6)
  {
    v7 = self->_keyPathToValues;
    objc_sync_enter(v7);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v4, "predicate", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "keyPaths");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v9);
          -[NSMutableDictionary removeObjectForKey:](self->_keyPathToValues, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

    objc_sync_exit(v7);
  }

}

- (void)retryTimes:(int)a3 block:(id)a4
{
  int v5;
  unsigned int v6;
  unsigned int (**v7)(void);

  v7 = (unsigned int (**)(void))a4;
  if (a3 >= 1)
  {
    v5 = a3 & ~(a3 >> 31);
    v6 = 1;
    do
    {
      if (!v7[2]())
        break;
      sleep(v6);
      v6 += v6 * arc4random_uniform(3u);
      --v5;
    }
    while (v5);
  }

}

- (void)registerCallback:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *log;
  NSObject *v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *registrations;
  void *v11;
  id v12;
  const char *v13;
  NSObject *registrationCallbackQueue;
  uint64_t v15;
  NSMutableDictionary *v16;
  void *v17;
  NSMutableDictionary *openRegistrationTokens;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD handler[5];
  id v24;
  int out_token;
  os_activity_scope_state_s state;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_18DD73000, "Duet: ClientContext registerCallback:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v7 = log;
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(state.opaque[0]) = 138412290;
    *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v8;
    _os_log_impl(&dword_18DD73000, v7, OS_LOG_TYPE_DEFAULT, "Registering callback: %@", (uint8_t *)&state, 0xCu);

  }
  v9 = self->_registrations;
  objc_sync_enter(v9);
  registrations = self->_registrations;
  objc_msgSend(v4, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](registrations, "setObject:forKeyedSubscript:", v4, v11);

  objc_sync_exit(v9);
  out_token = 0;
  objc_initWeak((id *)&state, v4);
  objc_msgSend(v4, "identifier");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = (const char *)objc_msgSend(v12, "UTF8String");
  registrationCallbackQueue = self->_registrationCallbackQueue;
  v15 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __37___CDClientContext_registerCallback___block_invoke;
  handler[3] = &unk_1E26D53A0;
  objc_copyWeak(&v24, (id *)&state);
  handler[4] = self;
  notify_register_dispatch(v13, &out_token, registrationCallbackQueue, handler);

  v16 = self->_openRegistrationTokens;
  objc_sync_enter(v16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  openRegistrationTokens = self->_openRegistrationTokens;
  objc_msgSend(v4, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](openRegistrationTokens, "setObject:forKeyedSubscript:", v17, v19);

  objc_sync_exit(v16);
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __37___CDClientContext_registerCallback___block_invoke_133;
  v21[3] = &unk_1E26D5378;
  v21[4] = self;
  v20 = v4;
  v22 = v20;
  -[_CDClientContext retryTimes:block:](self, "retryTimes:block:", 3, v21);
  -[_CDClientContext addKeyPathsWithRegistrationsForAnyChangeFromRegistration:](self, "addKeyPathsWithRegistrationsForAnyChangeFromRegistration:", v20);

  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)&state);

}

- (BOOL)evaluatePredicate:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *log;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[5];
  id v14;
  os_activity_scope_state_s state;
  uint64_t v16;
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_18DD73000, "Duet: ClientContext evaluatePredicate:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(state.opaque[0]) = 138412290;
    *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v4;
    _os_log_impl(&dword_18DD73000, log, OS_LOG_TYPE_DEFAULT, "Evaluating predicate: %@", (uint8_t *)&state, 0xCu);
  }
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v16 = 0x2020000000;
  v17 = 0;
  -[_CDClientContext currentConnection](self, "currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __38___CDClientContext_evaluatePredicate___block_invoke;
  v13[3] = &unk_1E26D51F8;
  v13[4] = self;
  v9 = v4;
  v14 = v9;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __38___CDClientContext_evaluatePredicate___block_invoke_135;
  v12[3] = &unk_1E26D5288;
  v12[4] = &state;
  objc_msgSend(v10, "evaluatePredicate:handler:", v9, v12);

  LOBYTE(v10) = *(_BYTE *)(state.opaque[1] + 24) != 0;
  _Block_object_dispose(&state, 8);

  return (char)v10;
}

- (void)handleRegistrationCompleted:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, BOOL);
  NSObject *v8;
  NSObject *log;
  NSMutableDictionary *v10;
  void *v11;
  os_activity_scope_state_s v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, BOOL))a4;
  v8 = _os_activity_create(&dword_18DD73000, "Duet: ClientContext handleRegistrationCompleted:handler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v8, &v12);
  os_activity_scope_leave(&v12);

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v12.opaque[0]) = 138412290;
    *(uint64_t *)((char *)v12.opaque + 4) = (uint64_t)v6;
    _os_log_impl(&dword_18DD73000, log, OS_LOG_TYPE_DEFAULT, "Registration completed for %@", (uint8_t *)&v12, 0xCu);
  }
  v10 = self->_registrations;
  objc_sync_enter(v10);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_registrations, "objectForKeyedSubscript:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v10);

  if (v11)
    -[_CDClientContext clearCacheForKeyPathsWithFireOnChangeRegistrations:](self, "clearCacheForKeyPathsWithFireOnChangeRegistrations:", v11);
  v7[2](v7, v11 != 0);

}

- (void)setObject:(id)a3 forContextualKeyPath:(id)a4 responseQueue:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  os_activity_scope_state_s state;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = _os_activity_create(&dword_18DD73000, "Duet: ClientContext setObject:forContextualKeyPath:responseQueue:withCompletion:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  os_activity_scope_leave(&state);

  if (v11)
  {
    -[_CDClientContext setObject:forContextualKeyPath:synchronous:responseQueue:withCompletion:](self, "setObject:forContextualKeyPath:synchronous:responseQueue:withCompletion:", v10, v11, 0, v12, v13);
  }
  else if (v13)
  {
    v15 = v12;
    if (!v12)
    {
      -[_CDClientContext defaultCallbackQueue](self, "defaultCallbackQueue");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80___CDClientContext_setObject_forContextualKeyPath_responseQueue_withCompletion___block_invoke;
    block[3] = &unk_1E26D52B0;
    v17 = v13;
    dispatch_async(v15, block);
    if (!v12)

  }
}

- (void)addObjects:(id)a3 toArrayAtKeyPath:(id)a4 responseQueue:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  os_activity_scope_state_s state;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = _os_activity_create(&dword_18DD73000, "Duet: ClientContext addObjects:toArrayAtKeyPath:responseQueue:withCompletion:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  os_activity_scope_leave(&state);

  if (objc_msgSend(v10, "count"))
  {
    -[_CDClientContext addObjects:toArrayAtKeyPath:synchronous:responseQueue:withCompletion:](self, "addObjects:toArrayAtKeyPath:synchronous:responseQueue:withCompletion:", v10, v11, 0, v12, v13);
  }
  else if (v13)
  {
    v15 = v12;
    if (!v12)
    {
      -[_CDClientContext defaultCallbackQueue](self, "defaultCallbackQueue");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77___CDClientContext_addObjects_toArrayAtKeyPath_responseQueue_withCompletion___block_invoke;
    block[3] = &unk_1E26D52B0;
    v17 = v13;
    dispatch_async(v15, block);
    if (!v12)

  }
}

- (BOOL)removeObjects:(id)a3 fromArrayAtKeyPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  os_activity_scope_state_s v11;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18DD73000, "Duet: ClientContext removeObjects:fromArrayAtKeyPath:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v8, &v11);
  os_activity_scope_leave(&v11);

  if (objc_msgSend(v6, "count"))
    v9 = -[_CDClientContext removeObjects:fromArrayAtKeyPath:synchronous:responseQueue:withCompletion:](self, "removeObjects:fromArrayAtKeyPath:synchronous:responseQueue:withCompletion:", v6, v7, 1, 0, 0);
  else
    v9 = 0;

  return v9;
}

- (void)removeObjects:(id)a3 fromArrayAtKeyPath:(id)a4 responseQueue:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  os_activity_scope_state_s state;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = _os_activity_create(&dword_18DD73000, "Duet: ClientContext removeObjects:fromArrayAtKeyPath:responseQueue:withCompletion:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  os_activity_scope_leave(&state);

  if (objc_msgSend(v10, "count"))
  {
    -[_CDClientContext removeObjects:fromArrayAtKeyPath:synchronous:responseQueue:withCompletion:](self, "removeObjects:fromArrayAtKeyPath:synchronous:responseQueue:withCompletion:", v10, v11, 0, v12, v13);
  }
  else if (v13)
  {
    v15 = v12;
    if (!v12)
    {
      -[_CDClientContext defaultCallbackQueue](self, "defaultCallbackQueue");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82___CDClientContext_removeObjects_fromArrayAtKeyPath_responseQueue_withCompletion___block_invoke;
    block[3] = &unk_1E26D52B0;
    v17 = v13;
    dispatch_async(v15, block);
    if (!v12)

  }
}

- (BOOL)removeObjects:(id)a3 fromArrayAtKeyPath:(id)a4 synchronous:(BOOL)a5 responseQueue:(id)a6 withCompletion:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  NSObject *log;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  BOOL v29;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  __int128 *p_buf;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  __int128 buf;
  uint64_t v42;
  char v43;
  uint64_t v44;

  v9 = a5;
  v44 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  -[_CDClientContext logFaultIfDeprecatedKeyPath:](self, "logFaultIfDeprecatedKeyPath:", v13);
  v16 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __94___CDClientContext_removeObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke;
  v36[3] = &unk_1E26D53F0;
  v36[4] = self;
  v17 = v12;
  v37 = v17;
  v18 = v13;
  v38 = v18;
  v19 = v15;
  v40 = v19;
  v20 = v14;
  v39 = v20;
  v21 = (void *)MEMORY[0x193FEDDDC](v36);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v18;
    _os_log_impl(&dword_18DD73000, log, OS_LOG_TYPE_INFO, "Removing object from keypath: %@", (uint8_t *)&buf, 0xCu);
  }
  -[_CDClientContext currentConnection](self, "currentConnection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v9)
    objc_msgSend(v23, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  else
    objc_msgSend(v23, "remoteObjectProxyWithErrorHandler:", v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v42 = 0x2020000000;
  v43 = 0;
  v31[0] = v16;
  v31[1] = 3221225472;
  v31[2] = __94___CDClientContext_removeObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_141;
  v31[3] = &unk_1E26D5468;
  p_buf = &buf;
  v31[4] = self;
  v26 = v18;
  v32 = v26;
  v27 = v19;
  v34 = v27;
  v28 = v20;
  v33 = v28;
  objc_msgSend(v25, "addObjects:andRemoveObjects:forArrayAtPath:handler:", 0, v17, v26, v31);
  v29 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return v29;
}

- (id)removeObjectsMatchingPredicate:(id)a3 fromArrayAtKeyPath:(id)a4
{
  if (!a3)
    return MEMORY[0x1E0C9AA60];
  -[_CDClientContext removeObjectsMatchingPredicate:fromArrayAtKeyPath:synchronous:responseQueue:withCompletion:](self, "removeObjectsMatchingPredicate:fromArrayAtKeyPath:synchronous:responseQueue:withCompletion:", a3, a4, 1, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)removeObjectsMatchingPredicate:(id)a3 fromArrayAtKeyPath:(id)a4 responseQueue:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  _QWORD block[4];
  id v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v10)
  {
    v15 = -[_CDClientContext removeObjectsMatchingPredicate:fromArrayAtKeyPath:synchronous:responseQueue:withCompletion:](self, "removeObjectsMatchingPredicate:fromArrayAtKeyPath:synchronous:responseQueue:withCompletion:", v10, v11, 0, v12, v13);
  }
  else if (v13)
  {
    v16 = v12;
    if (!v12)
    {
      -[_CDClientContext defaultCallbackQueue](self, "defaultCallbackQueue");
      v16 = objc_claimAutoreleasedReturnValue();
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __99___CDClientContext_removeObjectsMatchingPredicate_fromArrayAtKeyPath_responseQueue_withCompletion___block_invoke;
    block[3] = &unk_1E26D52B0;
    v18 = v14;
    dispatch_async(v16, block);
    if (!v12)

  }
}

- (id)removeObjectsMatchingPredicate:(id)a3 fromArrayAtKeyPath:(id)a4 synchronous:(BOOL)a5 responseQueue:(id)a6 withCompletion:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  NSObject *log;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  os_activity_scope_state_s *p_state;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  id v41;
  os_activity_scope_state_s state;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;

  v9 = a5;
  v47 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  -[_CDClientContext logFaultIfDeprecatedKeyPath:](self, "logFaultIfDeprecatedKeyPath:", v13);
  v16 = _os_activity_create(&dword_18DD73000, "Duet: ClientContext removeObjectsMatchingPredicate:fromArrayAtKeyPath:synchronous:responseQueue:withCompletion:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v16, &state);
  os_activity_scope_leave(&state);

  v17 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __111___CDClientContext_removeObjectsMatchingPredicate_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke;
  v37[3] = &unk_1E26D53F0;
  v37[4] = self;
  v18 = v12;
  v38 = v18;
  v19 = v13;
  v39 = v19;
  v20 = v15;
  v41 = v20;
  v21 = v14;
  v40 = v21;
  v22 = (void *)MEMORY[0x193FEDDDC](v37);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    LODWORD(state.opaque[0]) = 138412290;
    *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v19;
    _os_log_impl(&dword_18DD73000, log, OS_LOG_TYPE_INFO, "Removing objects matching predicate from keypath: %@", (uint8_t *)&state, 0xCu);
  }
  -[_CDClientContext currentConnection](self, "currentConnection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v9)
    objc_msgSend(v24, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
  else
    objc_msgSend(v24, "remoteObjectProxyWithErrorHandler:", v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__1;
  v45 = __Block_byref_object_dispose__1;
  v46 = 0;
  v32[0] = v17;
  v32[1] = 3221225472;
  v32[2] = __111___CDClientContext_removeObjectsMatchingPredicate_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_144;
  v32[3] = &unk_1E26D54B8;
  p_state = &state;
  v32[4] = self;
  v27 = v19;
  v33 = v27;
  v28 = v20;
  v35 = v28;
  v29 = v21;
  v34 = v29;
  objc_msgSend(v26, "removeObjectsMatchingPredicate:fromArrayAtPath:handler:", v18, v27, v32);
  v30 = *(id *)(state.opaque[1] + 40);

  _Block_object_dispose(&state, 8);
  return v30;
}

- (BOOL)addObjects:(id)a3 andRemoveObjects:(id)a4 fromArrayAtKeyPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  BOOL v12;
  os_activity_scope_state_s v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_18DD73000, "Duet: ClientContext addObjects:andRemoveObjects:fromArrayAtKeyPath:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v11, &v14);
  os_activity_scope_leave(&v14);

  v12 = (objc_msgSend(v8, "count") || objc_msgSend(v9, "count"))
     && -[_CDClientContext addObjects:andRemoveObjects:fromArrayAtKeyPath:synchronous:responseQueue:withCompletion:](self, "addObjects:andRemoveObjects:fromArrayAtKeyPath:synchronous:responseQueue:withCompletion:", v8, v9, v10, 1, 0, 0);

  return v12;
}

- (void)addObjects:(id)a3 andRemoveObjects:(id)a4 fromArrayAtKeyPath:(id)a5 responseQueue:(id)a6 withCompletion:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD block[4];
  id v20;
  os_activity_scope_state_s state;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = _os_activity_create(&dword_18DD73000, "Duet: ClientContext addObjects:andRemoveObjects:fromArrayAtKeyPath:responseQueue:withCompletion:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v17, &state);
  os_activity_scope_leave(&state);

  if (objc_msgSend(v12, "count") || objc_msgSend(v13, "count"))
  {
    -[_CDClientContext addObjects:andRemoveObjects:fromArrayAtKeyPath:synchronous:responseQueue:withCompletion:](self, "addObjects:andRemoveObjects:fromArrayAtKeyPath:synchronous:responseQueue:withCompletion:", v12, v13, v14, 0, v15, v16);
  }
  else if (v16)
  {
    v18 = v15;
    if (!v15)
    {
      -[_CDClientContext defaultCallbackQueue](self, "defaultCallbackQueue");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96___CDClientContext_addObjects_andRemoveObjects_fromArrayAtKeyPath_responseQueue_withCompletion___block_invoke;
    block[3] = &unk_1E26D52B0;
    v20 = v16;
    dispatch_async(v18, block);
    if (!v15)

  }
}

- (BOOL)addObjects:(id)a3 andRemoveObjects:(id)a4 fromArrayAtKeyPath:(id)a5 synchronous:(BOOL)a6 responseQueue:(id)a7 withCompletion:(id)a8
{
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  NSObject *log;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  BOOL v32;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  __int128 *p_buf;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  __int128 buf;
  uint64_t v46;
  char v47;
  uint64_t v48;

  v10 = a6;
  v48 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  -[_CDClientContext logFaultIfDeprecatedKeyPath:](self, "logFaultIfDeprecatedKeyPath:", v16);
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __108___CDClientContext_addObjects_andRemoveObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke;
  v39[3] = &unk_1E26D54E0;
  v39[4] = self;
  v19 = v14;
  v40 = v19;
  v20 = v15;
  v41 = v20;
  v21 = v16;
  v42 = v21;
  v22 = v18;
  v44 = v22;
  v23 = v17;
  v43 = v23;
  v24 = (void *)MEMORY[0x193FEDDDC](v39);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v21;
    _os_log_impl(&dword_18DD73000, log, OS_LOG_TYPE_INFO, "Adding to and removing from keypath: %@", (uint8_t *)&buf, 0xCu);
  }
  -[_CDClientContext currentConnection](self, "currentConnection");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v10)
    objc_msgSend(v26, "synchronousRemoteObjectProxyWithErrorHandler:", v24);
  else
    objc_msgSend(v26, "remoteObjectProxyWithErrorHandler:", v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v46 = 0x2020000000;
  v47 = 0;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __108___CDClientContext_addObjects_andRemoveObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_148;
  v34[3] = &unk_1E26D5468;
  p_buf = &buf;
  v34[4] = self;
  v29 = v21;
  v35 = v29;
  v30 = v22;
  v37 = v30;
  v31 = v23;
  v36 = v31;
  objc_msgSend(v28, "addObjects:andRemoveObjects:forArrayAtPath:handler:", v19, v20, v29, v34);
  v32 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return v32;
}

- (id)valuesForKeyPaths:(id)a3 inContextsMatchingPredicate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  _QWORD v15[5];
  os_activity_scope_state_s state;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18DD73000, "Duet: ClientContext valuesForKeyPaths:inContextsMatchingPredicate:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1;
  v19 = __Block_byref_object_dispose__1;
  v20 = 0;
  -[_CDClientContext currentConnection](self, "currentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66___CDClientContext_valuesForKeyPaths_inContextsMatchingPredicate___block_invoke;
  v15[3] = &unk_1E26D5220;
  v15[4] = self;
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __66___CDClientContext_valuesForKeyPaths_inContextsMatchingPredicate___block_invoke_150;
  v14[3] = &unk_1E26D5508;
  v14[4] = &state;
  objc_msgSend(v11, "valuesForPaths:inContextsMatching:handler:", v6, v7, v14);

  v12 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v12;
}

- (id)valuesForKeyPaths:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  os_activity_scope_state_s v8;

  v4 = a3;
  v5 = _os_activity_create(&dword_18DD73000, "Duet: ClientContext valuesForKeyPaths:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  os_activity_scope_leave(&v8);

  if (objc_msgSend(v4, "count"))
  {
    -[_CDClientContext valuesForKeyPaths:synchronous:responseQueue:withCompletion:](self, "valuesForKeyPaths:synchronous:responseQueue:withCompletion:", v4, 1, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v6;
}

- (void)valuesForKeyPaths:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_18DD73000, "Duet: ClientContext valuesForKeyPaths:responseQueue:withCompletion:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  v12 = objc_msgSend(v8, "count");
  if (v10 && v12)
  {
    v13 = -[_CDClientContext valuesForKeyPaths:synchronous:responseQueue:withCompletion:](self, "valuesForKeyPaths:synchronous:responseQueue:withCompletion:", v8, 0, v9, v10);
  }
  else if (v10)
  {
    v14 = v9;
    if (!v9)
    {
      -[_CDClientContext defaultCallbackQueue](self, "defaultCallbackQueue");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67___CDClientContext_valuesForKeyPaths_responseQueue_withCompletion___block_invoke;
    block[3] = &unk_1E26D52B0;
    v16 = v10;
    dispatch_async(v14, block);
    if (!v9)

  }
}

- (id)valuesForKeyPaths:(id)a3 synchronous:(BOOL)a4 responseQueue:(id)a5 withCompletion:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSObject *log;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v29[4];
  id v30;
  _CDClientContext *v31;
  id v32;
  id v33;
  __int128 *p_buf;
  _QWORD v35[5];
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 buf;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v8 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v39 != v14)
          objc_enumerationMutation(v10);
        -[_CDClientContext logFaultIfDeprecatedKeyPath:](self, "logFaultIfDeprecatedKeyPath:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v13);
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_18DD73000, log, OS_LOG_TYPE_DEFAULT, "Getting values for keypaths: %@", (uint8_t *)&buf, 0xCu);
  }
  v17 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __79___CDClientContext_valuesForKeyPaths_synchronous_responseQueue_withCompletion___block_invoke;
  v35[3] = &unk_1E26D5530;
  v35[4] = self;
  v18 = v12;
  v37 = v18;
  v19 = v11;
  v36 = v19;
  v20 = (void *)MEMORY[0x193FEDDDC](v35);
  -[_CDClientContext currentConnection](self, "currentConnection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v8)
    objc_msgSend(v21, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
  else
    objc_msgSend(v21, "remoteObjectProxyWithErrorHandler:", v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__1;
  v45 = __Block_byref_object_dispose__1;
  v46 = 0;
  v29[0] = v17;
  v29[1] = 3221225472;
  v29[2] = __79___CDClientContext_valuesForKeyPaths_synchronous_responseQueue_withCompletion___block_invoke_2;
  v29[3] = &unk_1E26D5558;
  p_buf = &buf;
  v24 = v18;
  v33 = v24;
  v25 = v19;
  v30 = v25;
  v31 = self;
  v26 = v10;
  v32 = v26;
  objc_msgSend(v23, "valuesForPaths:handler:", v26, v29);
  v27 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v27;
}

- (BOOL)setObject:(id)a3 lastModifiedDate:(id)a4 forContextualKeyPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *log;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  BOOL v19;
  _QWORD v21[5];
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  _BYTE state[24];
  char v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_18DD73000, "Duet: ClientContext setObject:lastModifiedDate:forContextualKeyPath:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  os_activity_scope_enter(v11, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)state = 138412546;
    *(_QWORD *)&state[4] = v10;
    *(_WORD *)&state[12] = 2112;
    *(_QWORD *)&state[14] = v9;
    _os_log_impl(&dword_18DD73000, log, OS_LOG_TYPE_INFO, "Setting object at keypath %@ with modified date: %@", state, 0x16u);
  }
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = state;
  *(_QWORD *)&state[16] = 0x2020000000;
  v27 = 0;
  -[_CDClientContext currentConnection](self, "currentConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __68___CDClientContext_setObject_lastModifiedDate_forContextualKeyPath___block_invoke;
  v22[3] = &unk_1E26D5580;
  v22[4] = self;
  v15 = v8;
  v23 = v15;
  v16 = v9;
  v24 = v16;
  v17 = v10;
  v25 = v17;
  objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __68___CDClientContext_setObject_lastModifiedDate_forContextualKeyPath___block_invoke_153;
  v21[3] = &unk_1E26D5288;
  v21[4] = state;
  objc_msgSend(v18, "setObject:lastModifiedDate:forContextualKeyPath:handler:", v15, v16, v17, v21);

  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    -[_CDClientContext setObject:lastModifiedDate:forContextualKeyPath:].cold.1();
  v19 = *(_BYTE *)(*(_QWORD *)&state[8] + 24) != 0;

  _Block_object_dispose(state, 8);
  return v19;
}

- (void)activateDevices:(id)a3 remoteUserContextProxySourceDeviceUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *log;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  os_activity_scope_state_s state;

  v6 = a4;
  v7 = a3;
  v8 = _os_activity_create(&dword_18DD73000, "Duet: ClientContext activateDevices:remoteUserContextProxySourceDeviceUUID:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_log_impl(&dword_18DD73000, log, OS_LOG_TYPE_DEFAULT, "Activating devices", (uint8_t *)&state, 2u);
  }
  -[_CDClientContext currentConnection](self, "currentConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75___CDClientContext_activateDevices_remoteUserContextProxySourceDeviceUUID___block_invoke;
  v13[3] = &unk_1E26D5220;
  v13[4] = self;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activateDevices:remoteUserContextProxySourceDeviceUUID:", v7, v6);

  v12 = self->_log;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_log_impl(&dword_18DD73000, v12, OS_LOG_TYPE_DEFAULT, "Done activating devices", (uint8_t *)&state, 2u);
  }
}

- (void)deactivateDevices:(id)a3 remoteUserContextProxySourceDeviceUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *log;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  os_activity_scope_state_s state;

  v6 = a4;
  v7 = a3;
  v8 = _os_activity_create(&dword_18DD73000, "Duet: ClientContext deactivateDevices:remoteUserContextProxySourceDeviceUUID:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_log_impl(&dword_18DD73000, log, OS_LOG_TYPE_DEFAULT, "Deactivating devices", (uint8_t *)&state, 2u);
  }
  -[_CDClientContext currentConnection](self, "currentConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77___CDClientContext_deactivateDevices_remoteUserContextProxySourceDeviceUUID___block_invoke;
  v13[3] = &unk_1E26D5220;
  v13[4] = self;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deactivateDevices:remoteUserContextProxySourceDeviceUUID:", v7, v6);

  v12 = self->_log;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_log_impl(&dword_18DD73000, v12, OS_LOG_TYPE_DEFAULT, "Done deactivating devices", (uint8_t *)&state, 2u);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)xpcQueue
{
  return self->_xpcQueue;
}

- (void)setXpcQueue:(id)a3
{
  objc_storeStrong((id *)&self->_xpcQueue, a3);
}

- (OS_dispatch_queue)xpcEventQueue
{
  return self->_xpcEventQueue;
}

- (void)setXpcEventQueue:(id)a3
{
  objc_storeStrong((id *)&self->_xpcEventQueue, a3);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_endpoint, a3);
}

- (BOOL)interrupted
{
  return self->_interrupted;
}

- (void)setInterrupted:(BOOL)a3
{
  self->_interrupted = a3;
}

- (NSMutableDictionary)keyPathToValues
{
  return self->_keyPathToValues;
}

- (void)setKeyPathToValues:(id)a3
{
  objc_storeStrong((id *)&self->_keyPathToValues, a3);
}

- (NSMutableDictionary)registrations
{
  return self->_registrations;
}

- (void)setRegistrations:(id)a3
{
  objc_storeStrong((id *)&self->_registrations, a3);
}

- (NSCountedSet)keyPathsWithRegistrationsForAnyChange
{
  return self->_keyPathsWithRegistrationsForAnyChange;
}

- (void)setKeyPathsWithRegistrationsForAnyChange:(id)a3
{
  objc_storeStrong((id *)&self->_keyPathsWithRegistrationsForAnyChange, a3);
}

- (OS_dispatch_queue)registrationCallbackQueue
{
  return self->_registrationCallbackQueue;
}

- (void)setRegistrationCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_registrationCallbackQueue, a3);
}

- (NSMutableDictionary)openRegistrationTokens
{
  return self->_openRegistrationTokens;
}

- (void)setOpenRegistrationTokens:(id)a3
{
  objc_storeStrong((id *)&self->_openRegistrationTokens, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (_CDRemoteUserContextServer)remoteUserContextProxy
{
  return self->_remoteUserContextProxy;
}

- (void)setRemoteUserContextProxy:(id)a3
{
  objc_storeStrong((id *)&self->_remoteUserContextProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteUserContextProxy, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_openRegistrationTokens, 0);
  objc_storeStrong((id *)&self->_registrationCallbackQueue, 0);
  objc_storeStrong((id *)&self->_keyPathsWithRegistrationsForAnyChange, 0);
  objc_storeStrong((id *)&self->_registrations, 0);
  objc_storeStrong((id *)&self->_keyPathToValues, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_xpcEventQueue, 0);
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)handleMDCSEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_18DD73000, v0, v1, "Ignoring unrecognized message: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleFetchPropertiesEvent:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DD73000, log, OS_LOG_TYPE_ERROR, "Missing delegate, unable to fetch properties", v1, 2u);
}

- (void)handleNotificationEvent:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_2_2(&dword_18DD73000, a2, a3, "Failed to parse context value change notification for registration %@: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

- (void)logFaultIfDeprecatedKeyPath:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_18DD73000, v0, OS_LOG_TYPE_FAULT, "the %@ contextual key path is deprecated and will be removed soon, please contact #help-biome", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)objectForContextualKeyPath:synchronous:responseQueue:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_18DD73000, v0, v1, "Uncached value for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleContextualChange:info:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_18DD73000, v0, v1, "Unable to find registration for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setObject:lastModifiedDate:forContextualKeyPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_18DD73000, v0, v1, "Done setting object at keypath %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end

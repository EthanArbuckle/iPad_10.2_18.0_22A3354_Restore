@implementation BiometricKitXPCClientConnection

void __60__BiometricKitXPCClientConnection_connectionWithDeviceType___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  objc_super v4;

  if (isFaceIDPlatform())
  {
    v4.receiver = *(id *)(a1 + 32);
    v4.super_class = (Class)&OBJC_METACLASS___BiometricKitXPCClientConnection;
    v2 = objc_msgSend(objc_msgSendSuper2(&v4, sel_allocWithZone_, 0), "initWithDeviceType:", 2);
    v3 = (void *)connectionWithDeviceType__pearlConnection;
    connectionWithDeviceType__pearlConnection = v2;

  }
}

- (BiometricKitXPCClientConnection)initWithDeviceType:(int64_t)a3
{
  BiometricKitXPCClientConnection *v3;
  BiometricKitXPCClientConnection *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *clients;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  void *v9;
  BiometricKitXPCClientConnection *v10;
  NSObject *v11;
  NSObject *v13;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v3 = self;
  v25 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 1) <= 1)
  {
    self->_deviceType = a3;
    v14.receiver = self;
    v14.super_class = (Class)BiometricKitXPCClientConnection;
    v4 = -[BiometricKitXPCClientConnection init](&v14, sel_init);
    if (v4)
    {
      v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      clients = v4->_clients;
      v4->_clients = v5;

      v7 = dispatch_queue_create("com.apple.BiometricKitXPCClientConnection.dispatch", 0);
      queue = v4->_queue;
      v4->_queue = (OS_dispatch_queue *)v7;

      -[BiometricKitXPCClientConnection xpcConnection](v4, "xpcConnection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        goto LABEL_4;
      v13 = (__osLog ? __osLog : MEMORY[0x1E0C81028]);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_4;
      *(_DWORD *)buf = 136316162;
      v16 = "[self xpcConnection]";
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = &unk_1AF575226;
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v23 = 1024;
      v24 = 125;
    }
    else
    {
      if (__osLog)
        v13 = __osLog;
      else
        v13 = MEMORY[0x1E0C81028];
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_4;
      *(_DWORD *)buf = 136316162;
      v16 = "self";
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = &unk_1AF575226;
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v23 = 1024;
      v24 = 117;
    }
    _os_log_impl(&dword_1AF533000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_4:
    v3 = v4;
    v10 = v3;
    goto LABEL_11;
  }
  if (__osLog)
    v11 = __osLog;
  else
    v11 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v16 = "0";
    v17 = 2048;
    v18 = 0;
    v19 = 2080;
    v20 = &unk_1AF575226;
    v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
    v23 = 1024;
    v24 = 112;
    _os_log_impl(&dword_1AF533000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)addClient:(id)a3
{
  id v4;
  BiometricKitXPCClientConnection *v5;
  NSMutableDictionary *clients;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  clients = v5->_clients;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "clientID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](clients, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 136316162;
      v14 = "![_clients objectForKey:@(client.clientID)]";
      v15 = 2048;
      v16 = 0;
      v17 = 2080;
      v18 = &unk_1AF575226;
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v21 = 1024;
      v22 = 307;
      _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v13, 0x30u);
    }
  }
  else
  {
    v9 = v5->_clients;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "clientID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v4, v10);

  }
  objc_sync_exit(v5);

  return v8 == 0;
}

- (BOOL)removeClient:(id)a3
{
  id v4;
  BiometricKitXPCClientConnection *v5;
  NSMutableDictionary *clients;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  clients = v5->_clients;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "clientID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](clients, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v5->_clients;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "clientID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", v10);

  }
  else
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 136316162;
      v14 = "[_clients objectForKey:@(client.clientID)]";
      v15 = 2048;
      v16 = 0;
      v17 = 2080;
      v18 = &unk_1AF575226;
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v21 = 1024;
      v22 = 328;
      _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v13, 0x30u);
    }
  }
  objc_sync_exit(v5);

  return v8 != 0;
}

+ (id)connectionWithDeviceType:(int64_t)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  _QWORD v7[5];
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3 == 2)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__BiometricKitXPCClientConnection_connectionWithDeviceType___block_invoke_2;
    v7[3] = &__block_descriptor_40_e5_v8__0l;
    v7[4] = a1;
    if (connectionWithDeviceType__once_1 != -1)
      dispatch_once(&connectionWithDeviceType__once_1, v7);
    v3 = (void *)connectionWithDeviceType__pearlConnection;
    goto LABEL_9;
  }
  if (a3 == 1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__BiometricKitXPCClientConnection_connectionWithDeviceType___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (connectionWithDeviceType__once != -1)
      dispatch_once(&connectionWithDeviceType__once, block);
    v3 = (void *)connectionWithDeviceType__touchIdConnection;
LABEL_9:
    v4 = v3;
    return v4;
  }
  if (__osLog)
    v5 = __osLog;
  else
    v5 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v10 = "0";
    v11 = 2048;
    v12 = 0;
    v13 = 2080;
    v14 = &unk_1AF575226;
    v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
    v17 = 1024;
    v18 = 89;
    _os_log_impl(&dword_1AF533000, v5, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  v4 = 0;
  return v4;
}

- (NSXPCConnection)xpcConnection
{
  BiometricKitXPCClientConnection *v2;
  NSXPCConnection *xpcConnection;
  int64_t deviceType;
  const __CFString *v5;
  uint64_t v6;
  NSXPCConnection *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  NSXPCConnection *v42;
  NSObject *v43;
  _QWORD block[4];
  id v46;
  _QWORD handler[4];
  id v48;
  _QWORD v49[5];
  id v50;
  _QWORD v51[4];
  id v52;
  id location;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  int v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  xpcConnection = v2->_xpcConnection;
  if (!xpcConnection || v2->_invalidated)
  {
    objc_initWeak(&location, v2);
    deviceType = v2->_deviceType;
    if (deviceType == 1)
    {
      v5 = CFSTR("com.apple.biometrickitd");
    }
    else
    {
      if (deviceType != 2)
      {
        if (__osLog)
          v43 = __osLog;
        else
          v43 = MEMORY[0x1E0C81028];
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          goto LABEL_22;
        *(_DWORD *)buf = 136316162;
        v55 = "0";
        v56 = 2048;
        v57 = 0;
        v58 = 2080;
        v59 = &unk_1AF575226;
        v60 = 2080;
        v61 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
        v62 = 1024;
        v63 = 162;
        goto LABEL_21;
      }
      v5 = CFSTR("com.apple.pearld");
    }
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", v5, 0);
    v7 = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v6;

    if (v2->_xpcConnection)
    {
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE4A788);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](v2->_xpcConnection, "setRemoteObjectInterface:", v8);

      -[NSXPCConnection remoteObjectInterface](v2->_xpcConnection, "remoteObjectInterface");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_getIdentityFromUUID_client_replyBlock_, 0, 1);

      -[NSXPCConnection remoteObjectInterface](v2->_xpcConnection, "remoteObjectInterface");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0C99E60];
      v13 = objc_opt_class();
      objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_identities_client_replyBlock_, 0, 1);

      -[NSXPCConnection remoteObjectInterface](v2->_xpcConnection, "remoteObjectInterface");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0C99E60];
      v17 = objc_opt_class();
      v18 = objc_opt_class();
      v19 = objc_opt_class();
      objc_msgSend(v16, "setWithObjects:", v17, v18, v19, objc_opt_class(), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_getLastMatchEvent_replyBlock_, 1, 1);

      -[NSXPCConnection remoteObjectInterface](v2->_xpcConnection, "remoteObjectInterface");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0C99E60];
      v23 = objc_opt_class();
      objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_getPreferencesValueForKey_client_replyBlock_, 1, 1);

      -[NSXPCConnection remoteObjectInterface](v2->_xpcConnection, "remoteObjectInterface");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0C99E60];
      v27 = objc_opt_class();
      objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setClasses:forSelector:argumentIndex:ofReply:", v28, sel_listAccessories_replyBlock_, 1, 1);

      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE45D50);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setExportedInterface:](v2->_xpcConnection, "setExportedInterface:", v29);

      -[NSXPCConnection setExportedObject:](v2->_xpcConnection, "setExportedObject:", v2);
      -[NSXPCConnection exportedInterface](v2->_xpcConnection, "exportedInterface");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x1E0C99E60];
      v32 = objc_opt_class();
      v33 = objc_opt_class();
      v34 = objc_opt_class();
      v35 = objc_opt_class();
      v36 = objc_opt_class();
      objc_msgSend(v31, "setWithObjects:", v32, v33, v34, v35, v36, objc_opt_class(), 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setClasses:forSelector:argumentIndex:ofReply:", v37, sel_statusMessage_details_client_, 1, 0);

      v38 = MEMORY[0x1E0C809B0];
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __48__BiometricKitXPCClientConnection_xpcConnection__block_invoke;
      v51[3] = &unk_1E5F83AF8;
      objc_copyWeak(&v52, &location);
      -[NSXPCConnection setInterruptionHandler:](v2->_xpcConnection, "setInterruptionHandler:", v51);
      v49[0] = v38;
      v49[1] = 3221225472;
      v49[2] = __48__BiometricKitXPCClientConnection_xpcConnection__block_invoke_224;
      v49[3] = &unk_1E5F83B20;
      objc_copyWeak(&v50, &location);
      v49[4] = v2;
      -[NSXPCConnection setInvalidationHandler:](v2->_xpcConnection, "setInvalidationHandler:", v49);
      if (!v2->_serverStartedNotificationToken)
      {
        dispatch_get_global_queue(0, 0);
        v39 = objc_claimAutoreleasedReturnValue();
        handler[0] = v38;
        handler[1] = 3221225472;
        handler[2] = __48__BiometricKitXPCClientConnection_xpcConnection__block_invoke_226;
        handler[3] = &unk_1E5F83B48;
        objc_copyWeak(&v48, &location);
        notify_register_dispatch("com.apple.BiometricKit.serverStarted", &v2->_serverStartedNotificationToken, v39, handler);

        objc_destroyWeak(&v48);
      }
      if (v2->_invalidated)
      {
        v2->_invalidated = 0;
        dispatch_get_global_queue(0, 0);
        v40 = objc_claimAutoreleasedReturnValue();
        block[0] = v38;
        block[1] = 3221225472;
        block[2] = __48__BiometricKitXPCClientConnection_xpcConnection__block_invoke_228;
        block[3] = &unk_1E5F83AF8;
        objc_copyWeak(&v46, &location);
        dispatch_async(v40, block);

        objc_destroyWeak(&v46);
      }
      if (xpc_user_sessions_enabled())
      {
        xpc_user_sessions_get_foreground_uid();
        -[NSXPCConnection _xpcConnection](v2->_xpcConnection, "_xpcConnection");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        xpc_connection_set_target_user_session_uid();

      }
      -[NSXPCConnection resume](v2->_xpcConnection, "resume");
      objc_destroyWeak(&v50);
      objc_destroyWeak(&v52);
      objc_destroyWeak(&location);
      xpcConnection = v2->_xpcConnection;
      goto LABEL_15;
    }
    if (__osLog)
      v43 = __osLog;
    else
      v43 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
LABEL_22:
      objc_destroyWeak(&location);
      v42 = 0;
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136316162;
    v55 = "_xpcConnection";
    v56 = 2048;
    v57 = 0;
    v58 = 2080;
    v59 = &unk_1AF575226;
    v60 = 2080;
    v61 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
    v62 = 1024;
    v63 = 167;
LABEL_21:
    _os_log_impl(&dword_1AF533000, v43, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_22;
  }
LABEL_15:
  v42 = xpcConnection;
LABEL_23:
  objc_sync_exit(v2);

  return v42;
}

void __60__BiometricKitXPCClientConnection_connectionWithDeviceType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  objc_super v4;

  if (isTouchIDPlatform())
  {
    v4.receiver = *(id *)(a1 + 32);
    v4.super_class = (Class)&OBJC_METACLASS___BiometricKitXPCClientConnection;
    v2 = objc_msgSend(objc_msgSendSuper2(&v4, sel_allocWithZone_, 0), "initWithDeviceType:", 1);
    v3 = (void *)connectionWithDeviceType__touchIdConnection;
    connectionWithDeviceType__touchIdConnection = v2;

  }
}

- (void)dealloc
{
  int serverStartedNotificationToken;
  objc_super v4;

  serverStartedNotificationToken = self->_serverStartedNotificationToken;
  if (serverStartedNotificationToken)
    notify_cancel(serverStartedNotificationToken);
  v4.receiver = self;
  v4.super_class = (Class)BiometricKitXPCClientConnection;
  -[BiometricKitXPCClientConnection dealloc](&v4, sel_dealloc);
}

void __48__BiometricKitXPCClientConnection_xpcConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  id *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[8];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (__osLog)
    v2 = __osLog;
  else
    v2 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v2, OS_LOG_TYPE_DEFAULT, "BiometricKitXPCClient::initWithDeviceType : connection interrupted\n", buf, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (id *)WeakRetained;
    objc_sync_enter(v5);
    objc_msgSend(v5[5], "allValues");
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "interruptConnection", (_QWORD)v10);
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
      }
      while (v7);
    }

    objc_sync_exit(v5);
  }

}

void __48__BiometricKitXPCClientConnection_xpcConnection__block_invoke_224(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  id *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[8];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (__osLog)
    v2 = __osLog;
  else
    v2 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v2, OS_LOG_TYPE_DEFAULT, "BiometricKitXPCClient::initWithDeviceType : connection invalidated\n", buf, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (id *)WeakRetained;
    objc_sync_enter(v5);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
    objc_msgSend(v5[5], "allValues");
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "interruptConnection", (_QWORD)v10);
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
      }
      while (v7);
    }

    objc_sync_exit(v5);
  }

}

void __48__BiometricKitXPCClientConnection_xpcConnection__block_invoke_226(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  id *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[8];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (__osLog)
    v2 = __osLog;
  else
    v2 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v2, OS_LOG_TYPE_DEFAULT, "BiometricKitXPCClient::initWithDeviceType : processing kBiometricKitServerStartedNotification\n", buf, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (id *)WeakRetained;
    objc_sync_enter(v5);
    objc_msgSend(v5[5], "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v5);

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "initializeConnection", (_QWORD)v11);
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v8);
    }

  }
}

void __48__BiometricKitXPCClientConnection_xpcConnection__block_invoke_228(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (id *)WeakRetained;
    objc_sync_enter(v3);
    objc_msgSend(v3[5], "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v3);

    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "initializeConnection", (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (id)client:(unint64_t)a3
{
  BiometricKitXPCClientConnection *v4;
  NSMutableDictionary *clients;
  void *v6;
  void *v7;

  v4 = self;
  objc_sync_enter(v4);
  clients = v4->_clients;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](clients, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v4);
  return v7;
}

- (void)enrollResult:(id)a3 details:(id)a4 client:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a4;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__BiometricKitXPCClientConnection_enrollResult_details_client___block_invoke;
  v13[3] = &unk_1E5F83B70;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

void __63__BiometricKitXPCClientConnection_enrollResult_details_client___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "client:", *(_QWORD *)(a1 + 56));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enrollResult:details:client:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)enrollUpdate:(id)a3 client:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__BiometricKitXPCClientConnection_enrollUpdate_client___block_invoke;
  block[3] = &unk_1E5F83B98;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

void __55__BiometricKitXPCClientConnection_enrollUpdate_client___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "client:", *(_QWORD *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enrollUpdate:client:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)enrollFeedback:(id)a3 client:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  unint64_t v10;

  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__BiometricKitXPCClientConnection_enrollFeedback_client___block_invoke;
  block[3] = &unk_1E5F83B98;
  v9 = v6;
  v10 = a4;
  block[4] = self;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __57__BiometricKitXPCClientConnection_enrollFeedback_client___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "client:", *(_QWORD *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enrollFeedback:client:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)matchResult:(id)a3 details:(id)a4 client:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a4;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__BiometricKitXPCClientConnection_matchResult_details_client___block_invoke;
  v13[3] = &unk_1E5F83B70;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

void __62__BiometricKitXPCClientConnection_matchResult_details_client___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "client:", *(_QWORD *)(a1 + 56));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "matchResult:details:client:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4
{
  NSObject *queue;
  _QWORD block[6];
  unsigned int v6;

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__BiometricKitXPCClientConnection_statusMessage_client___block_invoke;
  block[3] = &unk_1E5F83BC0;
  block[4] = self;
  block[5] = a4;
  v6 = a3;
  dispatch_async(queue, block);
}

void __56__BiometricKitXPCClientConnection_statusMessage_client___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "client:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statusMessage:client:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)statusMessage:(unsigned int)a3 details:(id)a4 client:(unint64_t)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  unsigned int v14;

  v8 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__BiometricKitXPCClientConnection_statusMessage_details_client___block_invoke;
  v11[3] = &unk_1E5F83BE8;
  v12 = v8;
  v13 = a5;
  v14 = a3;
  v11[4] = self;
  v10 = v8;
  dispatch_async(queue, v11);

}

void __64__BiometricKitXPCClientConnection_statusMessage_details_client___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "client:", *(_QWORD *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statusMessage:details:client:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)homeButtonPressed:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__BiometricKitXPCClientConnection_homeButtonPressed___block_invoke;
  v4[3] = &unk_1E5F83C10;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __53__BiometricKitXPCClientConnection_homeButtonPressed___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "client:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeButtonPressed:", *(_QWORD *)(a1 + 40));

}

- (void)touchIDButtonPressed:(BOOL)a3 client:(unint64_t)a4
{
  NSObject *queue;
  _QWORD block[6];
  BOOL v6;

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__BiometricKitXPCClientConnection_touchIDButtonPressed_client___block_invoke;
  block[3] = &unk_1E5F83C38;
  block[4] = self;
  block[5] = a4;
  v6 = a3;
  dispatch_async(queue, block);
}

void __63__BiometricKitXPCClientConnection_touchIDButtonPressed_client___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "client:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "touchIDButtonPressed:client:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)templateUpdate:(id)a3 details:(id)a4 client:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a4;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__BiometricKitXPCClientConnection_templateUpdate_details_client___block_invoke;
  v13[3] = &unk_1E5F83B70;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

void __65__BiometricKitXPCClientConnection_templateUpdate_details_client___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "client:", *(_QWORD *)(a1 + 56));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "templateUpdate:details:client:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)taskResumeStatus:(int)a3 client:(unint64_t)a4
{
  NSObject *queue;
  _QWORD block[6];
  int v6;

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__BiometricKitXPCClientConnection_taskResumeStatus_client___block_invoke;
  block[3] = &unk_1E5F83BC0;
  block[4] = self;
  block[5] = a4;
  v6 = a3;
  dispatch_async(queue, block);
}

void __59__BiometricKitXPCClientConnection_taskResumeStatus_client___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "client:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "taskResumeStatus:client:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end

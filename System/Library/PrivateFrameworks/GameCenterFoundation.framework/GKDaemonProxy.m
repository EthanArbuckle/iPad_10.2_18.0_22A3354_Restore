@implementation GKDaemonProxy

- (int)hostPID
{
  return self->_hostPID;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSString *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD block[4];
  id v25;
  GKDaemonProxy *v26;

  v5 = a5;
  v7 = a4;
  v8 = v7;
  if (v5)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSInvocation should response to userInfo, please file a radar against Foundation"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKDaemonProxy.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ ([invocation respondsToSelector:@selector(userInfo)])\n[%s (%s:%d)]"), v10, "-[GKDaemonProxy connection:handleInvocation:isReply:]", objc_msgSend(v12, "UTF8String"), 1121);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
    }
    objc_msgSend(v8, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0CB3C70]);
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "userInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", *MEMORY[0x1E0CB3C78]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      if (!os_log_GKGeneral)
        v18 = GKOSLoggers();
      v19 = (void *)os_log_GKPerf;
      if (os_log_type_enabled((os_log_t)os_log_GKPerf, OS_LOG_TYPE_DEBUG))
        -[GKDaemonProxy connection:handleInvocation:isReply:].cold.1((uint64_t)v15, v19, v17);
    }
    -[GKDaemonProxy replyQueueForRequestSelector:](self, "replyQueueForRequestSelector:", NSSelectorFromString(v15));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "retainArguments");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__GKDaemonProxy_connection_handleInvocation_isReply___block_invoke;
    block[3] = &unk_1E75B1A28;
    v21 = v8;
    v25 = v21;
    v26 = self;
    dispatch_async(v20, block);
    objc_msgSend(v17, "objectForKey:", CFSTR("requestID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", CFSTR("subproxy"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "replyToDuplicatesForRequest:withInvocation:queue:", v22, v21, v20);

  }
  else
  {
    objc_msgSend(v7, "_gkInvokeOnce");
  }

}

- (id)replyQueueForRequestSelector:(SEL)a3
{
  id v4;
  id v5;

  v4 = MEMORY[0x1E0C80D38];
  if (sel_isEqual(sel_getAuthenticatedPlayerIDWithHandler_, a3)
    || sel_isEqual(sel_getAccountNameWithHandler_, a3)
    || sel_isEqual(sel_getAuthenticatedPlayerInfo_, a3)
    || sel_isEqual(sel_getAuthenticatedPlayerCredential_, a3)
    || sel_isEqual(sel_getAuthenticatedLocalPlayersWithStatus_handler_, a3)
    || sel_isEqual(sel_getConcernsForPlayer_handler_, a3)
    || sel_isEqual(sel_getPreferenceForKey_handler_, a3)
    || sel_isEqual(sel_localizedMessageFromDictionary_forBundleID_handler_, a3))
  {
    if (replyQueueForRequestSelector__onceToken != -1)
      dispatch_once(&replyQueueForRequestSelector__onceToken, &__block_literal_global_142);
    v5 = (id)replyQueueForRequestSelector__sPrivateQueue;

  }
  else
  {
    v5 = (id)MEMORY[0x1E0C80D38];
  }
  return v5;
}

- (NSDictionary)interfaceLookup
{
  return self->_interfaceLookup;
}

void __53__GKDaemonProxy_authenticatedLocalPlayersWithStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__GKDaemonProxy_authenticatedLocalPlayersWithStatus___block_invoke_2;
  v7[3] = &unk_1E75B1C58;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "authenticatedLocalPlayersWithStatus:completion:", v5, v7);

}

- (void)authenticatedLocalPlayersWithStatus:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *authenticationQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  authenticationQueue = self->_authenticationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__GKDaemonProxy_authenticatedLocalPlayersWithStatus_completion___block_invoke;
  block[3] = &unk_1E75B5268;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(authenticationQueue, block);

}

- (void)addInterface:(id)a3 toLookup:(id)a4
{
  id v5;
  id v6;
  Protocol *v7;
  objc_method_description *v8;
  objc_method_description *v9;
  unsigned int v10;
  SEL *p_name;
  void *v12;
  void *v13;
  objc_method_description *v14;
  objc_method_description *v15;
  unsigned int v16;
  SEL *v17;
  void *v18;
  void *v19;
  unsigned int outCount;

  v5 = a3;
  v6 = a4;
  outCount = 0;
  objc_msgSend(v5, "protocol");
  v7 = (Protocol *)objc_claimAutoreleasedReturnValue();
  v8 = protocol_copyMethodDescriptionList(v7, 1, 1, &outCount);
  v9 = v8;
  if (outCount)
  {
    v10 = 0;
    p_name = &v8->name;
    do
    {
      NSStringFromSelector(*p_name);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        objc_msgSend(v6, "setObject:forKey:", v5, v12);

      ++v10;
      p_name += 2;
    }
    while (v10 < outCount);
  }
  free(v9);
  v14 = protocol_copyMethodDescriptionList(v7, 0, 1, &outCount);
  v15 = v14;
  if (outCount)
  {
    v16 = 0;
    v17 = &v14->name;
    do
    {
      NSStringFromSelector(*v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
        objc_msgSend(v6, "setObject:forKey:", v5, v18);

      ++v16;
      v17 += 2;
    }
    while (v16 < outCount);
  }
  free(v15);

}

- (void)addDataUpdateDelegate:(id)a3
{
  -[NSHashTable _gkSafeAddObject:](self->_dataUpdateDelegates, "_gkSafeAddObject:", a3);
}

+ (id)proxyForPlayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = a3;
  objc_msgSend(a1, "daemonProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "playerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "playerID");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v6 = 0;
    v8 = CFSTR("<no associated player>");
  }
  +[GKDaemonProxy proxiesForPlayer](GKDaemonProxy, "proxiesForPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __32__GKDaemonProxy_proxyForPlayer___block_invoke;
  v14[3] = &unk_1E75B50D8;
  v15 = v5;
  v16 = v6;
  v10 = v6;
  v11 = v5;
  objc_msgSend(v9, "objectForKeyWillReplace:objectProducerBlock:", v8, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)proxiesForPlayer
{
  if (proxiesForPlayer_once != -1)
    dispatch_once(&proxiesForPlayer_once, &__block_literal_global_6_0);
  return (id)proxiesForPlayer_proxies;
}

- (id)authenticatedLocalPlayersWithStatus:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  unint64_t v12;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKDaemonProxy.m", 522, "-[GKDaemonProxy authenticatedLocalPlayersWithStatus:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__GKDaemonProxy_authenticatedLocalPlayersWithStatus___block_invoke;
  v10[3] = &unk_1E75B2E50;
  v11 = v6;
  v12 = a3;
  v10[4] = self;
  v7 = v6;
  objc_msgSend(v7, "perform:", v10);
  objc_msgSend(v7, "wait");
  objc_msgSend(v7, "result");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

GKServiceProxy *__32__GKDaemonProxy_proxyForPlayer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  GKServiceProxy *v7;

  v3 = a2;
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "baseProxy"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = *(void **)(a1 + 32),
        v5,
        v5 == v6))
  {
    v7 = v4;
  }
  else
  {
    v7 = -[GKServiceProxy initWithPlayer:]([GKServiceProxy alloc], "initWithPlayer:", *(_QWORD *)(a1 + 40));
    -[GKServiceProxy setLocalPlayer:](v7, "setLocalPlayer:", *(_QWORD *)(a1 + 40));
    -[GKServiceProxy setBaseProxy:](v7, "setBaseProxy:", *(_QWORD *)(a1 + 32));
  }

  return v7;
}

void __28__GKDaemonProxy_daemonProxy__block_invoke()
{
  GKDaemonProxy *v0;
  void *v1;

  v0 = objc_alloc_init(GKDaemonProxy);
  v1 = (void *)daemonProxy_sDaemonProxy;
  daemonProxy_sDaemonProxy = (uint64_t)v0;

}

- (GKDaemonProxy)init
{
  GKDaemonProxy *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSHashTable *dataUpdateDelegates;
  dispatch_semaphore_t v10;
  OS_dispatch_semaphore *concurrentRequestSemaphore;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *invocationQueue;
  dispatch_queue_t v15;
  OS_dispatch_queue *authenticationQueue;
  uint64_t v17;
  NSXPCConnection *connection;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  NSObject *v24;
  id v25;
  id v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  id v30;
  int v31;
  NSObject *v32;
  id v33;
  id v34;
  char v35;
  id v37;
  _QWORD v38[4];
  id v39;
  id location;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)GKDaemonProxy;
  v2 = -[GKServiceProxy initWithPlayer:](&v41, sel_initWithPlayer_, 0);
  if (!v2)
    return v2;
  v2->_hostPID = getpid();
  -[GKServiceProxy setBaseProxy:](v2, "setBaseProxy:", v2);
  if (!v2->_hostPID)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_hostPID must not be 0"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKDaemonProxy.m");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (_hostPID != 0)\n[%s (%s:%d)]"), v4, "-[GKDaemonProxy init]", objc_msgSend(v6, "UTF8String"), 346);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v7);
  }
  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v8 = objc_claimAutoreleasedReturnValue();
  dataUpdateDelegates = v2->_dataUpdateDelegates;
  v2->_dataUpdateDelegates = (NSHashTable *)v8;

  v10 = dispatch_semaphore_create(10);
  concurrentRequestSemaphore = v2->_concurrentRequestSemaphore;
  v2->_concurrentRequestSemaphore = (OS_dispatch_semaphore *)v10;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = dispatch_queue_create("com.apple.gamecenter.GKDaemonProxy", v12);
  invocationQueue = v2->_invocationQueue;
  v2->_invocationQueue = (OS_dispatch_queue *)v13;

  v15 = dispatch_queue_create("com.apple.GameKit.GKDaemonProxy.authenticationQueue", 0);
  authenticationQueue = v2->_authenticationQueue;
  v2->_authenticationQueue = (OS_dispatch_queue *)v15;

  v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.gamed"), 256);
  connection = v2->_connection;
  v2->_connection = (NSXPCConnection *)v17;

  -[NSXPCConnection setExportedObject:](v2->_connection, "setExportedObject:", v2);
  +[GKClientInterface interface](GKClientInterface, "interface");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](v2->_connection, "setExportedInterface:", v19);

  +[GKDaemonInterface interface](GKDaemonInterface, "interface");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v20);

  -[NSXPCConnection setDelegate:](v2->_connection, "setDelegate:", v2);
  -[NSXPCConnection setInvalidationHandler:](v2->_connection, "setInvalidationHandler:", &__block_literal_global_73);
  objc_initWeak(&location, v2);
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __21__GKDaemonProxy_init__block_invoke_2;
  v38[3] = &unk_1E75B3670;
  objc_copyWeak(&v39, &location);
  -[NSXPCConnection setInterruptionHandler:](v2->_connection, "setInterruptionHandler:", v38);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bundleIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = +[GKEntitledContextProvider hasAnyGameCenterEntitlement](GKEntitledContextProvider, "hasAnyGameCenterEntitlement");
  v24 = os_log_GKGeneral;
  if (v23)
  {
    if (!os_log_GKGeneral)
    {
      v25 = GKOSLoggers();
      v24 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[GKDaemonProxy init].cold.1();
  }
  else
  {
    if (!os_log_GKGeneral)
      v26 = GKOSLoggers();
    v27 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
      -[GKDaemonProxy init].cold.6(v27);
    v28 = GKApplicationLinkedOnOrAfter();
    v29 = os_log_GKGeneral;
    if (v28)
    {
      if (!os_log_GKGeneral)
        v30 = GKOSLoggers();
      if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
        -[GKDaemonProxy init].cold.4();
      v31 = objc_msgSend(v22, "hasPrefix:", CFSTR("com.apple."));
      v32 = os_log_GKGeneral;
      if (!v31)
      {
        if (!os_log_GKGeneral)
        {
          v37 = GKOSLoggers();
          v32 = os_log_GKGeneral;
        }
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          -[GKDaemonProxy init].cold.3();
        v35 = 0;
        goto LABEL_28;
      }
      if (!os_log_GKGeneral)
      {
        v33 = GKOSLoggers();
        v32 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        -[GKDaemonProxy init].cold.2();
    }
    else
    {
      if (!os_log_GKGeneral)
      {
        v34 = GKOSLoggers();
        v29 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        -[GKDaemonProxy init].cold.5();
    }
  }
  v35 = 1;
LABEL_28:
  -[NSXPCConnection resume](v2->_connection, "resume");
  if ((v35 & 1) == 0)
    -[NSXPCConnection invalidate](v2->_connection, "invalidate");
  -[GKDaemonProxy buildInterfaceLookup](v2, "buildInterfaceLookup");

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
  return v2;
}

- (void)buildInterfaceLookup
{
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  +[GKServiceInterface interface](GKAccountServiceInterface, "interface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDaemonProxy addInterface:toLookup:](self, "addInterface:toLookup:", v3, v25);

  +[GKServiceInterface interface](GKProfileServiceInterface, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDaemonProxy addInterface:toLookup:](self, "addInterface:toLookup:", v4, v25);

  +[GKServiceInterface interface](GKFriendServiceInterface, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDaemonProxy addInterface:toLookup:](self, "addInterface:toLookup:", v5, v25);

  +[GKServiceInterface interface](GKGameServiceInterface, "interface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDaemonProxy addInterface:toLookup:](self, "addInterface:toLookup:", v6, v25);

  +[GKServiceInterface interface](GKGameStatServiceInterface, "interface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDaemonProxy addInterface:toLookup:](self, "addInterface:toLookup:", v7, v25);

  +[GKServiceInterface interface](GKChallengeServiceInterface, "interface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDaemonProxy addInterface:toLookup:](self, "addInterface:toLookup:", v8, v25);

  +[GKServiceInterface interface](GKMultiplayerServiceInterface, "interface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDaemonProxy addInterface:toLookup:](self, "addInterface:toLookup:", v9, v25);

  +[GKServiceInterface interface](GKTurnBasedServiceInterface, "interface");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDaemonProxy addInterface:toLookup:](self, "addInterface:toLookup:", v10, v25);

  +[GKServiceInterface interface](GKUtilityServiceInterface, "interface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDaemonProxy addInterface:toLookup:](self, "addInterface:toLookup:", v11, v25);

  +[GKServiceInterface interface](GKBulletinServiceInterface, "interface");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDaemonProxy addInterface:toLookup:](self, "addInterface:toLookup:", v12, v25);

  +[GKServiceInterface interface](GKGameSessionServiceInterface, "interface");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDaemonProxy addInterface:toLookup:](self, "addInterface:toLookup:", v13, v25);

  +[GKServiceInterface interface](GKAccountServicePrivateInterface, "interface");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDaemonProxy addInterface:toLookup:](self, "addInterface:toLookup:", v14, v25);

  +[GKServiceInterface interface](GKProfileServicePrivateInterface, "interface");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDaemonProxy addInterface:toLookup:](self, "addInterface:toLookup:", v15, v25);

  +[GKServiceInterface interface](GKFriendServicePrivateInterface, "interface");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDaemonProxy addInterface:toLookup:](self, "addInterface:toLookup:", v16, v25);

  +[GKServiceInterface interface](GKGameServicePrivateInterface, "interface");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDaemonProxy addInterface:toLookup:](self, "addInterface:toLookup:", v17, v25);

  +[GKServiceInterface interface](GKGameStatServicePrivateInterface, "interface");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDaemonProxy addInterface:toLookup:](self, "addInterface:toLookup:", v18, v25);

  +[GKServiceInterface interface](GKChallengeServicePrivateInterface, "interface");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDaemonProxy addInterface:toLookup:](self, "addInterface:toLookup:", v19, v25);

  +[GKServiceInterface interface](GKMultiplayerServicePrivateInterface, "interface");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDaemonProxy addInterface:toLookup:](self, "addInterface:toLookup:", v20, v25);

  +[GKServiceInterface interface](GKTurnBasedServicePrivateInterface, "interface");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDaemonProxy addInterface:toLookup:](self, "addInterface:toLookup:", v21, v25);

  +[GKServiceInterface interface](GKUtilityServicePrivateInterface, "interface");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDaemonProxy addInterface:toLookup:](self, "addInterface:toLookup:", v22, v25);

  +[GKServiceInterface interface](GKBulletinServicePrivateInterface, "interface");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDaemonProxy addInterface:toLookup:](self, "addInterface:toLookup:", v23, v25);

  +[GKServiceInterface interface](GKGameSessionServicePrivateInterface, "interface");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDaemonProxy addInterface:toLookup:](self, "addInterface:toLookup:", v24, v25);

  -[GKDaemonProxy setInterfaceLookup:](self, "setInterfaceLookup:", v25);
}

- (void)setInterfaceLookup:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceLookup, a3);
}

void __45__GKDaemonProxy_getActiveFriendRequestCount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[GKPreferences shared](GKPreferences, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "inboxContactsOnly");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v9);
        if (!v8 || objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "isInContacts", (_QWORD)v15))
          ++v12;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)getActiveFriendRequestCount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  +[GKDaemonProxy daemonProxy](GKDaemonProxy, "daemonProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "friendServicePrivate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__GKDaemonProxy_getActiveFriendRequestCount___block_invoke;
  v7[3] = &unk_1E75B1CF0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "getCombinedFriendInvitationListWithCompletion:", v7);

}

+ (GKDaemonProxy)daemonProxy
{
  if (daemonProxy_onceToken != -1)
    dispatch_once(&daemonProxy_onceToken, &__block_literal_global_32);
  return (GKDaemonProxy *)(id)daemonProxy_sDaemonProxy;
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_5(&dword_1BCDE3000, v0, v1, "GKDaemonProxy: Connection ALLOWED for unentitled but grandfathered process: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __64__GKDaemonProxy_authenticatedLocalPlayersWithStatus_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "_gkMapWithBlock:", &__block_literal_global_86);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __53__GKDaemonProxy_authenticatedLocalPlayersWithStatus___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setResult:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (OS_dispatch_semaphore)concurrentRequestSemaphore
{
  return self->_concurrentRequestSemaphore;
}

intptr_t __53__GKDaemonProxy_connection_handleInvocation_isReply___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_gkInvokeOnce");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 72));
}

- (OS_dispatch_queue)invocationQueue
{
  return self->_invocationQueue;
}

void __46__GKDaemonProxy_replyQueueForRequestSelector___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.GameKit.GKDaemonProxy.privateQueue", MEMORY[0x1E0C80D50]);
  v1 = (void *)replyQueueForRequestSelector__sPrivateQueue;
  replyQueueForRequestSelector__sPrivateQueue = (uint64_t)v0;

}

void __33__GKDaemonProxy_proxiesForPlayer__block_invoke()
{
  GKThreadsafeDictionary *v0;
  void *v1;

  v0 = -[GKThreadsafeDictionary initWithName:]([GKThreadsafeDictionary alloc], "initWithName:", CFSTR("com.apple.gamecenter.per-player-daemonproxies"));
  v1 = (void *)proxiesForPlayer_proxies;
  proxiesForPlayer_proxies = (uint64_t)v0;

}

void __64__GKDaemonProxy_authenticatedLocalPlayersWithStatus_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v9[2] = __64__GKDaemonProxy_authenticatedLocalPlayersWithStatus_completion___block_invoke_2;
  v9[3] = &unk_1E75B29C8;
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v10 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __64__GKDaemonProxy_authenticatedLocalPlayersWithStatus_completion___block_invoke_3;
  v7[3] = &unk_1E75B1CF0;
  v6 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v5, "getAuthenticatedLocalPlayersWithStatus:handler:", v6, v7);

}

+ (void)removeProxyForPlayer:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "internal");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v6, "playerID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDaemonProxy proxiesForPlayer](GKDaemonProxy, "proxiesForPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v4);

  }
}

+ (GKServiceProxy)proxyForLocalPlayer
{
  void *v2;
  void *v3;

  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDaemonProxy proxyForPlayer:](GKDaemonProxy, "proxyForPlayer:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GKServiceProxy *)v3;
}

- (id)matchmaker
{
  return +[GKMatchmaker sharedMatchmaker](GKMatchmaker, "sharedMatchmaker");
}

+ (void)messagesDidReceiveGameCenterURL:(id)a3 senderHandle:(id)a4 contactID:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v11 = GKOSLoggers();
    v10 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138412802;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v7;
    _os_log_debug_impl(&dword_1BCDE3000, v10, OS_LOG_TYPE_DEBUG, "GKDaemonProxy - received URL from %@ (%@) : %@", (uint8_t *)&v14, 0x20u);
    if (!v7)
      goto LABEL_8;
  }
  else if (!v7)
  {
    goto LABEL_8;
  }
  +[GKDaemonProxy daemonProxy](GKDaemonProxy, "daemonProxy");
  v12 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12[11], "remoteObjectProxyWithErrorHandler:", &__block_literal_global_17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v13, "messagesDidReceiveGameCenterURL:senderHandle:contactID:", v7, v8, v9);

LABEL_8:
}

void __72__GKDaemonProxy_messagesDidReceiveGameCenterURL_senderHandle_contactID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (v2)
  {
    if (!os_log_GKGeneral)
      v3 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      __72__GKDaemonProxy_messagesDidReceiveGameCenterURL_senderHandle_contactID___block_invoke_cold_1();
  }

}

+ (void)messagesDidReceiveGameCenterURL:(id)a3
{
  objc_msgSend(a1, "messagesDidReceiveGameCenterURL:senderHandle:contactID:", a3, &stru_1E75BB5A8, &stru_1E75BB5A8);
}

- (void)_resetServiceLookup
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  const char *label;
  void *v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint8_t buf[16];

  dispatch_get_current_queue();
  v3 = objc_claimAutoreleasedReturnValue();
  -[GKServiceProxy baseProxy](self, "baseProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invocationQueue");
  v5 = objc_claimAutoreleasedReturnValue();

  if (v3 != v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    label = dispatch_queue_get_label(v3);
    -[GKServiceProxy baseProxy](self, "baseProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invocationQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_get_label(v9);
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%s invoked on the wrong queue (got:%s expected:%s) at %@"), "-[GKDaemonProxy _resetServiceLookup]", label, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKDaemonProxy.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastPathComponent");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ (_actualCurrentQueue == self.baseProxy.invocationQueue)\n[%s (%s:%d)]"), v12, "-[GKDaemonProxy _resetServiceLookup]", objc_msgSend(v14, "UTF8String"), 203);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v15);
  }

  v16 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v17 = GKOSLoggers();
    v16 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v16, OS_LOG_TYPE_INFO, "Resetting service lookup", buf, 2u);
  }
  -[GKServiceProxy setServiceGeneration:](self, "setServiceGeneration:", -[GKServiceProxy serviceGeneration](self, "serviceGeneration") + 1);
  -[GKServiceProxy setServiceLookup:](self, "setServiceLookup:", 0);
}

- (void)resetServiceLookup
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[GKServiceProxy baseProxy](self, "baseProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invocationQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__GKDaemonProxy_resetServiceLookup__block_invoke;
  block[3] = &unk_1E75B1590;
  block[4] = self;
  dispatch_barrier_async(v4, block);

}

uint64_t __35__GKDaemonProxy_resetServiceLookup__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetServiceLookup");
}

- (void)setHostPID:(int)a3
{
  NSObject *invocationQueue;
  _QWORD v4[5];
  int v5;

  if (self->_hostPID != a3)
  {
    invocationQueue = self->_invocationQueue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __28__GKDaemonProxy_setHostPID___block_invoke;
    v4[3] = &unk_1E75B5140;
    v4[4] = self;
    v5 = a3;
    dispatch_barrier_async(invocationQueue, v4);
  }
}

void __28__GKDaemonProxy_setHostPID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  int v4;
  int v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  NSObject *v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v3 = GKOSLoggers();
    v2 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48);
    v5 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)buf = 67109376;
    v17 = v4;
    v18 = 1024;
    v19 = v5;
    _os_log_impl(&dword_1BCDE3000, v2, OS_LOG_TYPE_INFO, "Changing the host PID from %d to %d", buf, 0xEu);
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48) = *(_DWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_resetServiceLookup");
  CFAbsoluteTimeGetCurrent();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_56);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v8 = GKOSLoggers();
      v7 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCDE3000, v7, OS_LOG_TYPE_INFO, "Setting host PID", buf, 2u);
    }
    v9 = dispatch_group_create();
    dispatch_group_enter(v9);
    v10 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 48);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __28__GKDaemonProxy_setHostPID___block_invoke_57;
    v14[3] = &unk_1E75B1590;
    v11 = v9;
    v15 = v11;
    objc_msgSend(v6, "setHostPID:reply:", v10, v14);
    dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    if (!os_log_GKGeneral)
      v12 = GKOSLoggers();
    v13 = (void *)os_log_GKPerf;
    if (os_log_type_enabled((os_log_t)os_log_GKPerf, OS_LOG_TYPE_DEBUG))
      __28__GKDaemonProxy_setHostPID___block_invoke_cold_1(v13);

  }
}

void __28__GKDaemonProxy_setHostPID___block_invoke_55(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (v2)
  {
    if (!os_log_GKGeneral)
      v3 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      __28__GKDaemonProxy_setHostPID___block_invoke_55_cold_1();
  }

}

void __28__GKDaemonProxy_setHostPID___block_invoke_57(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)setTestGame:(id)a3 protocolVersion:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *invocationQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  invocationQueue = self->_invocationQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__GKDaemonProxy_setTestGame_protocolVersion_reply___block_invoke;
  v15[3] = &unk_1E75B1850;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_barrier_async(invocationQueue, v15);

}

void __51__GKDaemonProxy_setTestGame_protocolVersion_reply___block_invoke(uint64_t a1)
{
  dispatch_group_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  uint8_t buf[8];
  _QWORD v18[4];
  NSObject *v19;

  objc_msgSend(*(id *)(a1 + 32), "_resetServiceLookup");
  v2 = dispatch_group_create();
  CFAbsoluteTimeGetCurrent();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v4 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __51__GKDaemonProxy_setTestGame_protocolVersion_reply___block_invoke_2;
  v18[3] = &unk_1E75B1968;
  v5 = v2;
  v19 = v5;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v8 = GKOSLoggers();
      v7 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCDE3000, v7, OS_LOG_TYPE_INFO, "Setting test game", buf, 2u);
    }
    dispatch_group_enter(v5);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v14[0] = v4;
    v14[1] = 3221225472;
    v14[2] = __51__GKDaemonProxy_setTestGame_protocolVersion_reply___block_invoke_59;
    v14[3] = &unk_1E75B3580;
    v16 = *(id *)(a1 + 56);
    v11 = v5;
    v15 = v11;
    objc_msgSend(v6, "setTestGame:protocolVersion:reply:", v9, v10, v14);
    dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    if (!os_log_GKGeneral)
      v12 = GKOSLoggers();
    v13 = (void *)os_log_GKPerf;
    if (os_log_type_enabled((os_log_t)os_log_GKPerf, OS_LOG_TYPE_DEBUG))
      __51__GKDaemonProxy_setTestGame_protocolVersion_reply___block_invoke_cold_1(v13);

  }
}

void __51__GKDaemonProxy_setTestGame_protocolVersion_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  if (!os_log_GKGeneral)
    v4 = GKOSLoggers();
  if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
    __51__GKDaemonProxy_setTestGame_protocolVersion_reply___block_invoke_2_cold_1();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __51__GKDaemonProxy_setTestGame_protocolVersion_reply___block_invoke_59(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __21__GKDaemonProxy_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "resetServiceLookup");

}

- (id)authenticatedPlayerID
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__10;
  v12 = __Block_byref_object_dispose__10;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKDaemonProxy.m", 407, "-[GKDaemonProxy authenticatedPlayerID]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__GKDaemonProxy_authenticatedPlayerID__block_invoke;
  v7[3] = &unk_1E75B51B0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "perform:", v7);
  objc_msgSend(v4, "wait");
  v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  return v5;
}

void __38__GKDaemonProxy_authenticatedPlayerID__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __38__GKDaemonProxy_authenticatedPlayerID__block_invoke_2;
  v13[3] = &unk_1E75B29C8;
  v6 = v3;
  v14 = v6;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __38__GKDaemonProxy_authenticatedPlayerID__block_invoke_3;
  v10[3] = &unk_1E75B5188;
  v8 = *(_QWORD *)(a1 + 40);
  v11 = v6;
  v12 = v8;
  v9 = v6;
  objc_msgSend(v7, "getAuthenticatedPlayerIDWithHandler:", v10);

}

uint64_t __38__GKDaemonProxy_authenticatedPlayerID__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __38__GKDaemonProxy_authenticatedPlayerID__block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)accountName
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__10;
  v12 = __Block_byref_object_dispose__10;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKDaemonProxy.m", 426, "-[GKDaemonProxy accountName]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __28__GKDaemonProxy_accountName__block_invoke;
  v7[3] = &unk_1E75B51B0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "perform:", v7);
  objc_msgSend(v4, "wait");
  v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  return v5;
}

void __28__GKDaemonProxy_accountName__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __28__GKDaemonProxy_accountName__block_invoke_2;
  v13[3] = &unk_1E75B29C8;
  v6 = v3;
  v14 = v6;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __28__GKDaemonProxy_accountName__block_invoke_3;
  v10[3] = &unk_1E75B5188;
  v8 = *(_QWORD *)(a1 + 40);
  v11 = v6;
  v12 = v8;
  v9 = v6;
  objc_msgSend(v7, "getAccountNameWithHandler:", v10);

}

uint64_t __28__GKDaemonProxy_accountName__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __28__GKDaemonProxy_accountName__block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)hasAuthenticatedAccount
{
  void *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKDaemonProxy.m", 445, "-[GKDaemonProxy hasAuthenticatedAccount]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__GKDaemonProxy_hasAuthenticatedAccount__block_invoke;
  v6[3] = &unk_1E75B51B0;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v4, "perform:", v6);
  objc_msgSend(v4, "wait");
  LOBYTE(self) = *((_BYTE *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return (char)self;
}

void __40__GKDaemonProxy_hasAuthenticatedAccount__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __40__GKDaemonProxy_hasAuthenticatedAccount__block_invoke_2;
  v13[3] = &unk_1E75B29C8;
  v6 = v3;
  v14 = v6;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __40__GKDaemonProxy_hasAuthenticatedAccount__block_invoke_3;
  v10[3] = &unk_1E75B5188;
  v8 = *(_QWORD *)(a1 + 40);
  v11 = v6;
  v12 = v8;
  v9 = v6;
  objc_msgSend(v7, "getAuthenticatedPlayerIDWithHandler:", v10);

}

uint64_t __40__GKDaemonProxy_hasAuthenticatedAccount__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __40__GKDaemonProxy_hasAuthenticatedAccount__block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 != 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)authenticatedPlayerInfo
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__10;
  v12 = __Block_byref_object_dispose__10;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKDaemonProxy.m", 464, "-[GKDaemonProxy authenticatedPlayerInfo]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__GKDaemonProxy_authenticatedPlayerInfo__block_invoke;
  v7[3] = &unk_1E75B51B0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "perform:", v7);
  objc_msgSend(v4, "wait");
  v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  return v5;
}

void __40__GKDaemonProxy_authenticatedPlayerInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __40__GKDaemonProxy_authenticatedPlayerInfo__block_invoke_2;
  v13[3] = &unk_1E75B29C8;
  v6 = v3;
  v14 = v6;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __40__GKDaemonProxy_authenticatedPlayerInfo__block_invoke_3;
  v10[3] = &unk_1E75B51D8;
  v8 = *(_QWORD *)(a1 + 40);
  v11 = v6;
  v12 = v8;
  v9 = v6;
  objc_msgSend(v7, "getAuthenticatedPlayerInfo:", v10);

}

uint64_t __40__GKDaemonProxy_authenticatedPlayerInfo__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __40__GKDaemonProxy_authenticatedPlayerInfo__block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)authenticatedCredential
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__10;
  v12 = __Block_byref_object_dispose__10;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKDaemonProxy.m", 483, "-[GKDaemonProxy authenticatedCredential]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__GKDaemonProxy_authenticatedCredential__block_invoke;
  v7[3] = &unk_1E75B51B0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "perform:", v7);
  objc_msgSend(v4, "wait");
  v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  return v5;
}

void __40__GKDaemonProxy_authenticatedCredential__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __40__GKDaemonProxy_authenticatedCredential__block_invoke_2;
  v13[3] = &unk_1E75B29C8;
  v6 = v3;
  v14 = v6;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __40__GKDaemonProxy_authenticatedCredential__block_invoke_3;
  v10[3] = &unk_1E75B5200;
  v8 = *(_QWORD *)(a1 + 40);
  v11 = v6;
  v12 = v8;
  v9 = v6;
  objc_msgSend(v7, "getAuthenticatedPlayerCredential:", v10);

}

uint64_t __40__GKDaemonProxy_authenticatedCredential__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __40__GKDaemonProxy_authenticatedCredential__block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __64__GKDaemonProxy_authenticatedLocalPlayersWithStatus_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

GKLocalPlayer *__64__GKDaemonProxy_authenticatedLocalPlayersWithStatus_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  GKLocalPlayer *v3;

  v2 = a2;
  v3 = objc_alloc_init(GKLocalPlayer);
  -[GKPlayer setInternal:](v3, "setInternal:", v2);

  -[GKLocalPlayer setAuthenticated:](v3, "setAuthenticated:", 1);
  return v3;
}

- (id)getGamedFiredUp
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKDaemonProxy.m", 539, "-[GKDaemonProxy getGamedFiredUp]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__GKDaemonProxy_getGamedFiredUp__block_invoke;
  v8[3] = &unk_1E75B1788;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  objc_msgSend(v5, "perform:", v8);
  objc_msgSend(v5, "wait");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("message"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __32__GKDaemonProxy_getGamedFiredUp__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__GKDaemonProxy_getGamedFiredUp__block_invoke_2;
  block[3] = &unk_1E75B2BB0;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v8 = v5;
  v6 = v3;
  dispatch_async(v4, block);

}

void __32__GKDaemonProxy_getGamedFiredUp__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__GKDaemonProxy_getGamedFiredUp__block_invoke_3;
  v8[3] = &unk_1E75B29C8;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __32__GKDaemonProxy_getGamedFiredUp__block_invoke_4;
  v5[3] = &unk_1E75B2C28;
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "getGamedFiredUpWithHandler:", v5);

}

uint64_t __32__GKDaemonProxy_getGamedFiredUp__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __32__GKDaemonProxy_getGamedFiredUp__block_invoke_4(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, CFSTR("message"));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)getAccountNameWithHandler:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("getAccountNameWithHandler: should not be called on GKDaemonProxy, use accountName instead"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKDaemonProxy.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v4, "-[GKDaemonProxy getAccountNameWithHandler:]", objc_msgSend(v6, "UTF8String"), 628);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v7);
}

- (void)getAuthenticatedPlayerIDWithHandler:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("getAuthenticatedPlayerIDWithHandler: should not be called on GKDaemonProxy, use authenticedPlayerID instead"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKDaemonProxy.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v4, "-[GKDaemonProxy getAuthenticatedPlayerIDWithHandler:]", objc_msgSend(v6, "UTF8String"), 633);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v7);
}

- (void)removeDataUpdateDelegate:(id)a3
{
  -[NSHashTable _gkSafeRemoveObject:](self->_dataUpdateDelegates, "_gkSafeRemoveObject:", a3);
}

- (void)beginNetworkActivity
{
  id v2;

  -[GKDaemonProxy networkActivityIndicatorDelegate](self, "networkActivityIndicatorDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginNetworkActivity");

}

- (void)endNetworkActivity
{
  id v2;

  -[GKDaemonProxy networkActivityIndicatorDelegate](self, "networkActivityIndicatorDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endNetworkActivity");

}

- (void)resetNetworkActivity
{
  id v2;

  -[GKDaemonProxy networkActivityIndicatorDelegate](self, "networkActivityIndicatorDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetNetworkActivity");

}

- (void)setPreferencesValues:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[GKPreferences shared](GKPreferences, "shared");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverrideValues:", v3);

}

- (void)setCurrentGame:(id)a3 serverEnvironment:(int64_t)a4 reply:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  int64_t v14;

  v7 = a3;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__GKDaemonProxy_setCurrentGame_serverEnvironment_reply___block_invoke;
  block[3] = &unk_1E75B5268;
  v13 = v8;
  v14 = a4;
  v12 = v7;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __56__GKDaemonProxy_setCurrentGame_serverEnvironment_reply___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.GameOverlayUI"));

  if ((v4 & 1) == 0)
    +[GKGame setCurrentGameFromInternal:serverEnvironment:](GKGame, "setCurrentGameFromInternal:serverEnvironment:", a1[4], a1[6]);
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (void)authenticatedPlayersDidChange:(id)a3 authenticatingBundleID:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__GKDaemonProxy_authenticatedPlayersDidChange_authenticatingBundleID_reply___block_invoke;
  v11[3] = &unk_1E75B23E8;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  +[GKLocalPlayer authenticatedLocalPlayersDidChange:complete:](GKLocalPlayer, "authenticatedLocalPlayersDidChange:complete:", a3, v11);

}

uint64_t __76__GKDaemonProxy_authenticatedPlayersDidChange_authenticatingBundleID_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("com.apple.GameCenterUI.GameCenterHostingContainer")) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("com.apple.GameOverlayUI")))
  {
    v2 = objc_msgSend(MEMORY[0x1E0CB34D0], "_gkMainBundleIsGameCenterSystemProcess");
    +[GKLocalPlayer local](GKLocalPlayer, "local");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    v5 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v6 = GKOSLoggers();
      v5 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = (void *)MEMORY[0x1E0CB37E8];
      v9 = v5;
      objc_msgSend(v8, "numberWithBool:", v2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4 & 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v7;
      v16 = 2112;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_1BCDE3000, v9, OS_LOG_TYPE_INFO, "authenticatedPlayersDidChange - player authenticated from %@ (GC system process? %@, update local player? %@)", (uint8_t *)&v14, 0x20u);

    }
    if (!(v2 & 1 | ((v4 & 1) == 0)))
    {
      +[GKLocalPlayer local](GKLocalPlayer, "local");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "authenticationDidCompleteWithError:signInOrigin:", 0, 6);

    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)respondedToNearbyInvite:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKDaemonProxy matchmaker](self, "matchmaker");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localPlayerRespondedToNearbyInvite:", v4);

}

- (void)metricsValuesChanged
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("GKMetricsValuesChangedNotification"), self);

}

- (void)friendRequestSelected:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD block[5];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GKDaemonProxy dataUpdateDelegate](self, "dataUpdateDelegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[GKDaemonProxy dataUpdateDelegate](self, "dataUpdateDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __39__GKDaemonProxy_friendRequestSelected___block_invoke;
      block[3] = &unk_1E75B1A28;
      block[4] = self;
      v23 = v4;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSHashTable _gkSafeCopy](self->_dataUpdateDelegates, "_gkSafeCopy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    v13 = MEMORY[0x1E0C80D38];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __39__GKDaemonProxy_friendRequestSelected___block_invoke_2;
          v16[3] = &unk_1E75B1A28;
          v16[4] = v15;
          v17 = v4;
          dispatch_async(v13, v16);

        }
        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v11);
  }

}

void __39__GKDaemonProxy_friendRequestSelected___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "dataUpdateDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "friendRequestSelected:", *(_QWORD *)(a1 + 40));

}

uint64_t __39__GKDaemonProxy_friendRequestSelected___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "friendRequestSelected:", *(_QWORD *)(a1 + 40));
}

- (void)receivedChallengeSelected:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a3;
  +[GKChallengeEventHandler challengeEventHandler](GKChallengeEventHandler, "challengeEventHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__GKDaemonProxy_receivedChallengeSelected___block_invoke;
  v7[3] = &unk_1E75B1A28;
  v8 = v4;
  v9 = v3;
  v5 = v3;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __43__GKDaemonProxy_receivedChallengeSelected___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v2, "receivedChallengeSelected:", *(_QWORD *)(a1 + 40));
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[GKChallenge challengeForInternalRepresentation:](GKChallenge, "challengeForInternalRepresentation:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventEmitter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "player:wantsToPlayChallenge:", v5, v3);

}

- (void)dispatchCompletedChallenge:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id *v12;
  id *v13;
  id *v14;
  id v15;
  id v16;
  uint64_t *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  void *v28;
  id v29;

  v3 = a3;
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "receivingPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", 0);

  if (v6)
  {
    objc_msgSend(v3, "receivingPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKPlayer canonicalizedPlayerForInternal:](GKPlayer, "canonicalizedPlayerForInternal:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v9 = v4;
  }
  else
  {
    v8 = v4;
    objc_msgSend(v3, "receivingPlayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKPlayer canonicalizedPlayerForInternal:](GKPlayer, "canonicalizedPlayerForInternal:", v10);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  +[GKChallenge challengeForInternalRepresentation:](GKChallenge, "challengeForInternalRepresentation:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqual:", v4))
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __44__GKDaemonProxy_dispatchCompletedChallenge___block_invoke;
    v26[3] = &unk_1E75B1A78;
    v12 = &v27;
    v13 = &v28;
    v27 = v4;
    v28 = v11;
    v14 = &v29;
    v15 = v9;
    v29 = v15;
    v16 = v11;
    v17 = v26;
  }
  else
  {
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __44__GKDaemonProxy_dispatchCompletedChallenge___block_invoke_2;
    v22 = &unk_1E75B1A78;
    v12 = &v23;
    v13 = &v24;
    v23 = v4;
    v24 = v11;
    v14 = &v25;
    v15 = v8;
    v25 = v15;
    v18 = v11;
    v17 = &v19;
  }
  objc_msgSend(v15, "updateScopedIDs:", v17, v19, v20, v21, v22);

}

void __44__GKDaemonProxy_dispatchCompletedChallenge___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "eventEmitter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "player:didCompleteChallenge:issuedByFriend:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __44__GKDaemonProxy_dispatchCompletedChallenge___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "eventEmitter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "player:issuedChallengeWasCompleted:byFriend:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)completedChallengeSelected:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  GKDaemonProxy *v11;

  v4 = a3;
  +[GKChallengeEventHandler challengeEventHandler](GKChallengeEventHandler, "challengeEventHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__GKDaemonProxy_completedChallengeSelected___block_invoke;
  block[3] = &unk_1E75B1A78;
  v9 = v5;
  v10 = v4;
  v11 = self;
  v6 = v4;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __44__GKDaemonProxy_completedChallengeSelected___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v2, "completedChallengeSelected:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "dispatchCompletedChallenge:", *(_QWORD *)(a1 + 40));
}

- (void)challengeReceived:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[GKChallengeEventHandler challengeEventHandler](GKChallengeEventHandler, "challengeEventHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v6 = GKOSLoggers();
    v5 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_INFO, "Told by gamed we received a challenge %@, telling the handler %@", buf, 0x16u);
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__GKDaemonProxy_challengeReceived___block_invoke;
  v9[3] = &unk_1E75B1A28;
  v10 = v4;
  v11 = v3;
  v7 = v3;
  v8 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __35__GKDaemonProxy_challengeReceived___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v2, "challengeReceived:", *(_QWORD *)(a1 + 40));
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[GKChallenge challengeForInternalRepresentation:](GKChallenge, "challengeForInternalRepresentation:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventEmitter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "player:didReceiveChallenge:", v5, v3);

}

- (void)challengeCompleted:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  GKDaemonProxy *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[GKChallengeEventHandler challengeEventHandler](GKChallengeEventHandler, "challengeEventHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v7 = GKOSLoggers();
    v6 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v15 = v4;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "Told by gamed we completed a challenge %@, telling the handler %@", buf, 0x16u);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__GKDaemonProxy_challengeCompleted___block_invoke;
  block[3] = &unk_1E75B1A78;
  v11 = v5;
  v12 = v4;
  v13 = self;
  v8 = v4;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __36__GKDaemonProxy_challengeCompleted___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v2, "challengeCompleted:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "dispatchCompletedChallenge:", *(_QWORD *)(a1 + 40));
}

- (void)fetchTurnBasedData
{
  id v2;

  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchTurnBasedEvent");

}

- (void)acceptMultiplayerGameInvite
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__GKDaemonProxy_acceptMultiplayerGameInvite__block_invoke;
  block[3] = &unk_1E75B1590;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __44__GKDaemonProxy_acceptMultiplayerGameInvite__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "matchmaker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localPlayerAcceptedGameInvite");

  objc_msgSend(*(id *)(a1 + 32), "matchmaker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lookForInvite");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("GKAcceptedGameInvite"), v4);

}

- (void)acceptInviteWithNotification:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inviteeAcceptedGameInviteWithNotification:", v3);

}

- (void)declineInviteWithNotification:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inviteeDeclinedGameInviteWithNotification:", v3);

}

- (void)updateInviteWithNotification:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inviteeUpdateGameInviteWithNotification:", v3);

}

- (void)cancelInviteWithNotification:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelInviteWithNotification:", v3);

}

- (void)cancelGameInvite:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelGameInvite:", v3);

}

- (void)relayPushNotification:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB37D0];
  v4 = a3;
  objc_msgSend(v3, "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("GKRelayPushNotification"), 0, v4);

}

- (void)nearbyPlayerFoundForPlayerID:(id)a3 deviceID:(id)a4 discoveryInfo:(id)a5
{
  void *v5;
  id v6;

  -[GKDaemonProxy userInfoForPlayerID:deviceID:data:discoveryInfo:](self, "userInfoForPlayerID:deviceID:data:discoveryInfo:", a3, a4, 0, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("GKNearbyPlayerFoundNotification"), 0, v6);

}

- (void)nearbyPlayerLostForPlayerID:(id)a3 deviceID:(id)a4
{
  void *v4;
  id v5;

  -[GKDaemonProxy userInfoForPlayerID:deviceID:data:discoveryInfo:](self, "userInfoForPlayerID:deviceID:data:discoveryInfo:", a3, a4, 0, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("GKNearbyPlayerLostNotification"), 0, v5);

}

- (void)nearbyDataReceivedForPlayerID:(id)a3 deviceID:(id)a4 data:(id)a5
{
  void *v5;
  id v6;

  -[GKDaemonProxy userInfoForPlayerID:deviceID:data:discoveryInfo:](self, "userInfoForPlayerID:deviceID:data:discoveryInfo:", a3, a4, a5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("GKNearbyDataReceivedNotification"), 0, v6);

}

- (id)userInfoForPlayerID:(id)a3 deviceID:(id)a4 data:(id)a5 discoveryInfo:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v9)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("playerID"));
  if (v10)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("deviceID"));
  if (v11)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, CFSTR("data"));
  if (v12)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, CFSTR("discoveryInfo"));

  return v14;
}

- (void)didConnectToParticipantWithID:(id)a3
{
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_114_0);
}

- (void)didDisconnectFromParticipantWithID:(id)a3
{
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_115_0);
}

- (void)didReceiveData:(id)a3 reliably:(BOOL)a4 forRecipients:(id)a5 fromSender:(id)a6
{
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_116);
}

- (void)session:(id)a3 addedPlayer:(id)a4
{
  +[GKGameSession postSession:didAddPlayer:](GKGameSession, "postSession:didAddPlayer:", a3, a4);
}

- (void)session:(id)a3 removedPlayer:(id)a4
{
  +[GKGameSession postSession:didRemovePlayer:](GKGameSession, "postSession:didRemovePlayer:", a3, a4);
}

- (void)session:(id)a3 player:(id)a4 didChangeConnectionState:(int64_t)a5
{
  +[GKGameSession postSession:player:didChangeConnectionState:](GKGameSession, "postSession:player:didChangeConnectionState:", a3, a4, a5);
}

- (void)session:(id)a3 player:(id)a4 didSaveData:(id)a5
{
  +[GKGameSession postSession:player:didSaveData:](GKGameSession, "postSession:player:didSaveData:", a3, a4, a5);
}

- (void)session:(id)a3 didReceiveData:(id)a4 fromPlayer:(id)a5
{
  +[GKGameSession postSession:didReceiveData:fromPlayer:](GKGameSession, "postSession:didReceiveData:fromPlayer:", a3, a4, a5);
}

- (void)session:(id)a3 didReceiveMessage:(id)a4 withData:(id)a5 fromPlayer:(id)a6
{
  +[GKGameSession postSession:didReceiveMessage:withData:fromPlayer:](GKGameSession, "postSession:didReceiveMessage:withData:fromPlayer:", a3, a4, a5, a6);
}

- (id)localizedMessageFromDictionary:(id)a3 forBundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__10;
  v22 = __Block_byref_object_dispose__10;
  v23 = 0;
  if (v6 && v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKDaemonProxy.m", 988, "-[GKDaemonProxy localizedMessageFromDictionary:forBundleID:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__GKDaemonProxy_localizedMessageFromDictionary_forBundleID___block_invoke;
    v14[3] = &unk_1E75B52F0;
    v14[4] = self;
    v15 = v6;
    v16 = v8;
    v17 = &v18;
    objc_msgSend(v11, "perform:", v14);
    objc_msgSend(v11, "wait");

    v9 = (void *)v19[5];
  }
  v12 = v9;
  _Block_object_dispose(&v18, 8);

  return v12;
}

void __60__GKDaemonProxy_localizedMessageFromDictionary_forBundleID___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1[4] + 88);
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__GKDaemonProxy_localizedMessageFromDictionary_forBundleID___block_invoke_2;
  v15[3] = &unk_1E75B29C8;
  v6 = v3;
  v16 = v6;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a1[5];
  v9 = a1[6];
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __60__GKDaemonProxy_localizedMessageFromDictionary_forBundleID___block_invoke_118;
  v12[3] = &unk_1E75B5188;
  v10 = a1[7];
  v13 = v6;
  v14 = v10;
  v11 = v6;
  objc_msgSend(v7, "localizedMessageFromDictionary:forBundleID:handler:", v8, v9, v12);

}

void __60__GKDaemonProxy_localizedMessageFromDictionary_forBundleID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  if (v3)
  {
    if (!os_log_GKGeneral)
      v4 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      __60__GKDaemonProxy_localizedMessageFromDictionary_forBundleID___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __60__GKDaemonProxy_localizedMessageFromDictionary_forBundleID___block_invoke_118(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)loadRemoteImageDataForClientForURL:(id)a3 reply:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_119);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "loadRemoteImageDataForURL:reply:", v9, v6);

}

void __58__GKDaemonProxy_loadRemoteImageDataForClientForURL_reply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (v2)
  {
    if (!os_log_GKGeneral)
      v3 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      __58__GKDaemonProxy_loadRemoteImageDataForClientForURL_reply___block_invoke_cold_1();
  }

}

- (void)resetLoginCancelCount
{
  NSObject *invocationQueue;
  _QWORD block[5];

  invocationQueue = self->_invocationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__GKDaemonProxy_resetLoginCancelCount__block_invoke;
  block[3] = &unk_1E75B1590;
  block[4] = self;
  dispatch_barrier_async(invocationQueue, block);
}

void __38__GKDaemonProxy_resetLoginCancelCount__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_120_1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, "resetLoginCancelCount");
    v1 = v2;
  }

}

void __38__GKDaemonProxy_resetLoginCancelCount__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (v2)
  {
    if (!os_log_GKGeneral)
      v3 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      __38__GKDaemonProxy_resetLoginCancelCount__block_invoke_2_cold_1();
  }

}

- (void)setBadgeCount:(unint64_t)a3 forType:(unint64_t)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[GKDaemonProxy dataUpdateDelegate](self, "dataUpdateDelegate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[GKDaemonProxy dataUpdateDelegate](self, "dataUpdateDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[GKDaemonProxy dataUpdateDelegate](self, "dataUpdateDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBadgeCount:forType:", a3, a4);

    }
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSHashTable _gkSafeCopy](self->_dataUpdateDelegates, "_gkSafeCopy", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v16);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v17, "setBadgeCount:forType:", a3, a4);
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD block[5];
  id v28;
  int v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v4 = *(_QWORD *)&a3;
  v35 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v8 = GKOSLoggers();
    v7 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = v7;
    GKRefreshDataTypeAsString(v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v32 = v10;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_1BCDE3000, v9, OS_LOG_TYPE_INFO, "GKRefreshContents - received for dataType: %@ userInfo: %@", buf, 0x16u);

  }
  -[GKDaemonProxy dataUpdateDelegate](self, "dataUpdateDelegate");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[GKDaemonProxy dataUpdateDelegate](self, "dataUpdateDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __53__GKDaemonProxy_refreshContentsForDataType_userInfo___block_invoke;
      block[3] = &unk_1E75B3B70;
      block[4] = self;
      v29 = v4;
      v28 = v6;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[NSHashTable _gkSafeCopy](self->_dataUpdateDelegates, "_gkSafeCopy", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v19);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v20, "refreshContentsForDataType:userInfo:", v4, v6);
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v17);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  GKRefreshDataTypeAsString(v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "postNotificationName:object:userInfo:", v22, self, v6);

}

void __53__GKDaemonProxy_refreshContentsForDataType_userInfo___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "dataUpdateDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshContentsForDataType:userInfo:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)requestSandboxExtension:(id)a3
{
  void (**v3)(id, void *);
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, void *))a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundlePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v7 = GKOSLoggers();
    v6 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v13 = 138412290;
    v14 = v5;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "daemon requested sandbox extension for: %@", (uint8_t *)&v13, 0xCu);
  }
  v8 = objc_retainAutorelease(v5);
  objc_msgSend(v8, "UTF8String");
  v9 = sandbox_extension_issue_file();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, v11);

    free(v10);
  }
  else
  {
    if (!os_log_GKGeneral)
      v12 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      -[GKDaemonProxy requestSandboxExtension:].cold.1();
  }

}

- (void)setInvocationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_invocationQueue, a3);
}

- (OS_dispatch_queue)authenticationQueue
{
  return self->_authenticationQueue;
}

- (void)setAuthenticationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationQueue, a3);
}

- (void)setConcurrentRequestSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_concurrentRequestSemaphore, a3);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (GKDaemonProxyNetworkActivityIndicatorDelegate)networkActivityIndicatorDelegate
{
  return (GKDaemonProxyNetworkActivityIndicatorDelegate *)objc_loadWeakRetained((id *)&self->_networkActivityIndicatorDelegate);
}

- (void)setNetworkActivityIndicatorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_networkActivityIndicatorDelegate, a3);
}

- (GKDaemonProxyDataUpdateDelegate)dataUpdateDelegate
{
  return (GKDaemonProxyDataUpdateDelegate *)objc_loadWeakRetained((id *)&self->_dataUpdateDelegate);
}

- (void)setDataUpdateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dataUpdateDelegate, a3);
}

- (NSHashTable)dataUpdateDelegates
{
  return self->_dataUpdateDelegates;
}

- (void)setDataUpdateDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_dataUpdateDelegates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataUpdateDelegates, 0);
  objc_destroyWeak((id *)&self->_dataUpdateDelegate);
  objc_destroyWeak((id *)&self->_networkActivityIndicatorDelegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_interfaceLookup, 0);
  objc_storeStrong((id *)&self->_concurrentRequestSemaphore, 0);
  objc_storeStrong((id *)&self->_authenticationQueue, 0);
  objc_storeStrong((id *)&self->_invocationQueue, 0);
}

void __72__GKDaemonProxy_messagesDidReceiveGameCenterURL_senderHandle_contactID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "GKDaemonProxy->messagesDidReceiveGameCenterURL: error while getting the remoteObjectProxyWithErrorHandler:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __28__GKDaemonProxy_setHostPID___block_invoke_cold_1(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  int v3[6];

  OUTLINED_FUNCTION_16_0(a1);
  OUTLINED_FUNCTION_14_0();
  v3[0] = 136315394;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, v1, v2, "%s elapsed seconds:%g", (uint8_t *)v3);

  OUTLINED_FUNCTION_6_0();
}

void __28__GKDaemonProxy_setHostPID___block_invoke_55_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "GKDaemonProxy->setHostPID: error while getting the remoteObjectProxyWithErrorHandler:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __51__GKDaemonProxy_setTestGame_protocolVersion_reply___block_invoke_cold_1(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  int v3[6];

  OUTLINED_FUNCTION_16_0(a1);
  OUTLINED_FUNCTION_14_0();
  v3[0] = 136315394;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, v1, v2, "%s elapsed seconds:%g", (uint8_t *)v3);

  OUTLINED_FUNCTION_6_0();
}

void __51__GKDaemonProxy_setTestGame_protocolVersion_reply___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "GKDaemonProxy->setTestGame: error while getting the remoteObjectProxyWithHandler:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __60__GKDaemonProxy_localizedMessageFromDictionary_forBundleID___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "GKDaemonProxy->localizedMessageFromDictionary:forBundleID: error while getting the remoteObjectProxyWithHandler:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __58__GKDaemonProxy_loadRemoteImageDataForClientForURL_reply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "GKDaemonProxy->loadRemoteImageDataForClientForURL:reply: error while getting the remoteObjectProxyWithHandler:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __38__GKDaemonProxy_resetLoginCancelCount__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "GKDaemonProxy->resetLoginCancelCount error while getting the remoteObjectProxyWithHandler:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)requestSandboxExtension:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "failed to create sandbox extension for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)connection:(uint64_t)a1 handleInvocation:(void *)a2 isReply:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  double Current;
  void *v7;
  double v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(a3, "objectForKey:", CFSTR("timestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v10 = 138412546;
  v11 = a1;
  v12 = 2048;
  v13 = Current - v8;
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, v5, v9, "Received reply for request %@ duration(%fs)", (uint8_t *)&v10);

}

@end

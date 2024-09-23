@implementation BMAccessServiceListener

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v7;
  id v8;
  BOOL v9;
  id v10;
  void *fileServer;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v21 = 0;
  v9 = -[BMAccessServiceListener validateConnection:error:](self, "validateConnection:error:", v7, &v21);
  v10 = v21;
  if (v9)
  {
    objc_msgSend(v8, "selector");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      fileServer = self->_fileServer;
LABEL_9:
      objc_msgSend(v8, "invokeWithTarget:", fileServer);
      goto LABEL_13;
    }
    objc_msgSend(v8, "selector");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      fileServer = self->_accessServer;
      goto LABEL_9;
    }
    __biome_log_for_category(6);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BMAccessServiceListener connection:handleInvocation:isReply:].cold.1((uint64_t)v7, v8, v13);

    v14 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2D50];
    v15 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector((SEL)objc_msgSend(v8, "selector"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Failed to route request -%@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("BMAccessErrorDomain"), 6, v18);
    v19 = objc_claimAutoreleasedReturnValue();

    -[BMAccessServiceListener replyToInvocation:withError:](self, "replyToInvocation:withError:", v8, v19);
    objc_msgSend(v7, "invalidate");
    v10 = (id)v19;
  }
  else
  {
    __biome_log_for_category(6);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      NSStringFromSelector((SEL)objc_msgSend(v8, "selector"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v25 = v20;
      v26 = 2112;
      v27 = v7;
      v28 = 2112;
      v29 = v10;
      _os_log_fault_impl(&dword_1AEB31000, v12, OS_LOG_TYPE_FAULT, "Request -%@ from %@ failed validation with error %@", buf, 0x20u);

    }
    -[BMAccessServiceListener replyToInvocation:withError:](self, "replyToInvocation:withError:", v8, v10);
    objc_msgSend(v7, "invalidate");
  }
LABEL_13:

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  BMProcess *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  char v17;
  NSObject *v18;
  BOOL v19;
  NSObject *v20;
  int v22;
  void *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (BMProcess *)a4;
  v8 = (void *)MEMORY[0x1AF4569E0]();
  +[BMProcess processWithXPCConnection:](BMProcess, "processWithXPCConnection:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __biome_log_for_category(6);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "executableName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v11;
    v24 = 1024;
    v25 = objc_msgSend(v9, "pid");
    _os_log_impl(&dword_1AEB31000, v10, OS_LOG_TYPE_DEFAULT, "Incoming connection from %{public}@(%d)", (uint8_t *)&v22, 0x12u);

  }
  if (objc_msgSend(v9, "processType") != 4 && objc_msgSend(v9, "processType") != 5)
  {
    if ((objc_msgSend(v6, "isEqual:", self->_coreDuetListener) & 1) == 0)
    {
      +[BMAccessControlPolicy policyForProcess:connectionFlags:useCase:](BMAccessControlPolicy, "policyForProcess:connectionFlags:useCase:", v9, 0, CFSTR("__na__"));
      v14 = objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setBm_connectionFlags:](v7, 0);
      v13 = 0;
      if ((-[NSObject allowsConnectionToAccessServiceWithDomain:](v14, "allowsConnectionToAccessServiceWithDomain:", self->_domain) & 1) != 0)
      {
LABEL_21:
        __biome_log_for_category(6);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[BMAccessServiceListener listener:shouldAcceptNewConnection:].cold.1();
        goto LABEL_23;
      }
      goto LABEL_24;
    }
    +[BMAccessControlPolicy policyForProcess:connectionFlags:useCase:](BMAccessControlPolicy, "policyForProcess:connectionFlags:useCase:", v9, 2, CFSTR("__coreduet__"));
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setBm_accessControlPolicy:](v7, v13);
    -[NSXPCConnection setBm_connectionFlags:](v7, 2);
    v17 = -[NSObject allowsConnectionToAccessServiceWithDomain:](v13, "allowsConnectionToAccessServiceWithDomain:", self->_domain);
    __biome_log_for_category(6);
    v18 = objc_claimAutoreleasedReturnValue();
    v12 = v18;
    if ((v17 & 1) != 0)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[BMAccessServiceListener listener:shouldAcceptNewConnection:].cold.5();
      v14 = v13;
      goto LABEL_23;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[BMAccessServiceListener listener:shouldAcceptNewConnection:].cold.6();
LABEL_14:

LABEL_27:
    v19 = 0;
    goto LABEL_28;
  }
  -[NSMapTable objectForKey:](self->_clientSpecificListeners, "objectForKey:", v6);
  v12 = objc_claimAutoreleasedReturnValue();
  -[NSObject process](v12, "process");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!+[BMAccessControlPolicy process:canActOnBehalfOfProcess:](BMAccessControlPolicy, "process:canActOnBehalfOfProcess:", v9, v13))
  {
    __biome_log_for_category(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BMAccessServiceListener listener:shouldAcceptNewConnection:].cold.4(v9, v13, v16);

    goto LABEL_14;
  }
  +[BMAccessControlPolicy policyForProcess:connectionFlags:onBehalfOfProcessWithAccessControlPolicy:](BMAccessControlPolicy, "policyForProcess:connectionFlags:onBehalfOfProcessWithAccessControlPolicy:", v9, 1, v12);
  v14 = objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setBm_accessControlPolicy:](v7, v14);
  -[NSXPCConnection setBm_connectionFlags:](v7, 1);

  if ((-[NSObject allowsConnectionToAccessServiceWithDomain:](v14, "allowsConnectionToAccessServiceWithDomain:", self->_domain) & 1) == 0)
  {
LABEL_24:
    __biome_log_for_category(6);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[BMAccessServiceListener listener:shouldAcceptNewConnection:].cold.3();

    goto LABEL_27;
  }
  if (!v13)
    goto LABEL_21;
  __biome_log_for_category(6);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[BMAccessServiceListener listener:shouldAcceptNewConnection:].cold.2(v9, v13);

  v12 = v13;
LABEL_23:

  v19 = -[BMAccessServiceListener _acceptConnection:](self, "_acceptConnection:", v7);
  v13 = v14;
LABEL_28:

  objc_autoreleasePoolPop(v8);
  return v19;
}

- (BOOL)_acceptConnection:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = _acceptConnection__onceToken;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&_acceptConnection__onceToken, &__block_literal_global_1);
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setExportedInterface:", _acceptConnection__interface);
  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "_setQueue:", self->_queue);
  objc_msgSend(v5, "activate");

  return 1;
}

- (id)uniqueEndpointForAppScopedServicesActingOnBehalfOfClientWithAccessControlPolicy:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSMapTable *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v4, "process");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "processType");

  if (v6)
  {
    objc_msgSend(v4, "process");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = self->_clientSpecificListeners;
    v9 = -[NSMapTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v10 = v9;
      v21 = v4;
      v11 = 0;
      v12 = *(_QWORD *)v24;
LABEL_4:
      v13 = 0;
      v14 = v11;
      while (1)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v8);
        v11 = *(id *)(*((_QWORD *)&v23 + 1) + 8 * v13);

        -[NSMapTable objectForKey:](self->_clientSpecificListeners, "objectForKey:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "process");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqual:", v22);

        if ((v18 & 1) != 0)
          break;
        ++v13;
        v14 = v11;
        if (v10 == v13)
        {
          v10 = -[NSMapTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v10)
            goto LABEL_4;

          v4 = v21;
          goto LABEL_11;
        }
      }

      v4 = v21;
      if (v11)
        goto LABEL_14;
    }
    else
    {
LABEL_11:

    }
    +[BMXPCListener anonymousListenerWithQueue:](BMXPCListener, "anonymousListenerWithQueue:", self->_queue, v21);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", self);
    objc_msgSend(v11, "activate");
LABEL_14:
    -[NSMapTable setObject:forKey:](self->_clientSpecificListeners, "setObject:forKey:", v4, v11, v21);
    objc_msgSend(v11, "endpoint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (unint64_t)domain
{
  return self->_domain;
}

- (id)initLegacyWithQueue:(id)a3
{
  id v4;
  BMAccessServer *v5;
  void *v6;
  BMFileServer *v7;
  BMAccessServiceListener *v8;

  v4 = a3;
  v5 = -[BMAccessServer initWithListener:]([BMAccessServer alloc], "initWithListener:", self);
  +[BMPaths biomeDirectoryForDomain:](BMPaths, "biomeDirectoryForDomain:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BMFileServer initWithDirectory:]([BMFileServer alloc], "initWithDirectory:", v6);
  v8 = -[BMAccessServiceListener initWithMachServiceName:domain:queue:accessServer:fileServer:delegate:](self, "initWithMachServiceName:domain:queue:accessServer:fileServer:delegate:", CFSTR("com.apple.biome.PublicStreamAccessService"), 0, v4, v5, v7, 0);

  return v8;
}

- (BMAccessServiceListener)initWithMachServiceName:(id)a3 domain:(unint64_t)a4 queue:(id)a5 accessServer:(id)a6 fileServer:(id)a7
{
  return -[BMAccessServiceListener initWithMachServiceName:domain:queue:accessServer:fileServer:delegate:](self, "initWithMachServiceName:domain:queue:accessServer:fileServer:delegate:", a3, a4, a5, a6, a7, 0);
}

- (BMAccessServiceListener)initWithDomain:(unint64_t)a3 queue:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  BMAccessServer *v10;
  void *v11;
  BMFileServer *v12;
  __CFString **v13;
  __CFString *v14;
  BMAccessServiceListener *v15;

  v8 = a5;
  v9 = a4;
  v10 = -[BMAccessServer initWithListener:]([BMAccessServer alloc], "initWithListener:", self);
  +[BMPaths biomeDirectoryForDomain:](BMPaths, "biomeDirectoryForDomain:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[BMFileServer initWithDirectory:]([BMFileServer alloc], "initWithDirectory:", v11);
  if (a3)
  {
    if (a3 != 1)
    {
      v14 = 0;
      goto LABEL_7;
    }
    v13 = &BMMachServiceNameSystemAccessService;
  }
  else
  {
    v13 = &BMMachServiceNameUserAccessService;
  }
  v14 = *v13;
LABEL_7:
  v15 = -[BMAccessServiceListener initWithMachServiceName:domain:queue:accessServer:fileServer:delegate:](self, "initWithMachServiceName:domain:queue:accessServer:fileServer:delegate:", v14, a3, v9, v10, v12, v8);

  return v15;
}

- (BMAccessServiceListener)initWithMachServiceName:(id)a3 domain:(unint64_t)a4 queue:(id)a5 accessServer:(id)a6 fileServer:(id)a7 delegate:(id)a8
{
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  BMAccessServiceListener *v19;
  NSObject *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *queue;
  BMXPCListener *v24;
  BMXPCListener *listener;
  uint64_t v26;
  NSMapTable *clientSpecificListeners;
  NSObject *v28;
  uint8_t v30[16];
  objc_super v31;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v31.receiver = self;
  v31.super_class = (Class)BMAccessServiceListener;
  v19 = -[BMAccessServiceListener init](&v31, sel_init);
  if (v19)
  {
    __biome_log_for_category(6);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_1AEB31000, v20, OS_LOG_TYPE_DEFAULT, "Starting BMAccessServiceListener", v30, 2u);
    }

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create_with_target_V2("com.apple.biome.AccessService", v21, v15);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v22;

    if (v14)
    {
      v24 = -[BMXPCListener initWithMachServiceName:queue:]([BMXPCListener alloc], "initWithMachServiceName:queue:", v14, v15);
    }
    else
    {
      +[BMXPCListener anonymousListenerWithQueue:](BMXPCListener, "anonymousListenerWithQueue:", v15);
      v24 = (BMXPCListener *)objc_claimAutoreleasedReturnValue();
    }
    listener = v19->_listener;
    v19->_listener = v24;

    -[BMXPCListener setDelegate:](v19->_listener, "setDelegate:", v19);
    v19->_domain = a4;
    objc_msgSend(v16, "setDelegate:", v18);
    objc_storeStrong((id *)&v19->_accessServer, a6);
    objc_storeStrong((id *)&v19->_fileServer, a7);
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 4);
    clientSpecificListeners = v19->_clientSpecificListeners;
    v19->_clientSpecificListeners = (NSMapTable *)v26;

    __biome_log_for_category(6);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_1AEB31000, v28, OS_LOG_TYPE_DEFAULT, "Started BMAccessServiceListener", v30, 2u);
    }

  }
  return v19;
}

- (void)activate
{
  -[BMXPCListener activate](self->_listener, "activate");
}

- (NSXPCListenerEndpoint)endpoint
{
  return -[BMXPCListener endpoint](self->_listener, "endpoint");
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  __biome_log_for_category(6);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEB31000, v3, OS_LOG_TYPE_DEFAULT, "Stopping BMAccessService", buf, 2u);
  }

  -[BMXPCListener invalidate](self->_listener, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)BMAccessServiceListener;
  -[BMAccessServiceListener dealloc](&v4, sel_dealloc);
}

void __45__BMAccessServiceListener__acceptConnection___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE1E318);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_acceptConnection__interface;
  _acceptConnection__interface = v0;

  v2 = (void *)_acceptConnection__interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_requestBiomeEndpoint_reply_, 0, 1);

}

- (void)replyToInvocation:(id)a3 withError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  char *v18;
  uint64_t v19;
  id v20;

  v5 = a3;
  v6 = a4;
  v20 = v6;
  objc_msgSend(v5, "methodSignature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfArguments") - 1;

  v19 = 0;
  objc_msgSend(v5, "getArgument:atIndex:", &v19, v8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exportedInterface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "replyBlockSignatureForSelector:", objc_msgSend(v5, "selector"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0C99DD8];
    v13 = objc_retainAutorelease(v11);
    objc_msgSend(v12, "signatureWithObjCTypes:", objc_msgSend(v13, "UTF8String"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = objc_msgSend(v14, "numberOfArguments") - 1;
      if ((objc_msgSend((id)objc_msgSend(v15, "_classForObjectAtArgumentIndex:", v16), "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v15);
        v17 = objc_claimAutoreleasedReturnValue();
        -[NSObject retainArguments](v17, "retainArguments");
        -[NSObject setTarget:](v17, "setTarget:", v19);
        -[NSObject setArgument:atIndex:](v17, "setArgument:atIndex:", &v20, v16);
        -[NSObject invoke](v17, "invoke");
      }
      else
      {
        __biome_log_for_category(6);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          -[BMAccessServiceListener replyToInvocation:withError:].cold.2(v5, (const char *)v17);
      }
    }
    else
    {
      __biome_log_for_category(6);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        -[BMAccessServiceListener replyToInvocation:withError:].cold.1(v5, (const char *)v17);
    }

    v6 = v20;
  }
  else
  {
    __biome_log_for_category(6);
    v18 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_FAULT))
      -[BMAccessServiceListener replyToInvocation:withError:].cold.3(v5, v18);

  }
}

- (BOOL)validateConnection:(id)a3 error:(id *)a4
{
  BMProcess *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString **v16;
  uint64_t *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = (BMProcess *)a3;
  -[BMProcess bm_remoteUseCase](v6, "bm_remoteUseCase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NSXPCConnection bm_accessControlPolicy](v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[NSXPCConnection bm_accessControlPolicy](v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "useCase");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v7, "isEqual:", v10);

      if ((v11 & 1) == 0)
      {
        if (a4)
        {
          v23 = (void *)MEMORY[0x1E0CB35C8];
          v27 = *MEMORY[0x1E0CB2D50];
          v28 = CFSTR("Use case already set");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v23;
          v20 = 5;
          goto LABEL_15;
        }
        goto LABEL_17;
      }
      -[NSXPCConnection bm_accessControlPolicy](v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "useCase");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        if (a4)
        {
          v14 = (void *)MEMORY[0x1E0CB35C8];
          v25 = *MEMORY[0x1E0CB2D50];
          v26 = CFSTR("Connection missing use-case");
          v15 = (void *)MEMORY[0x1E0C99D80];
          v16 = &v26;
          v17 = &v25;
LABEL_9:
          objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v14;
          v20 = 1;
LABEL_15:
          objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("BMAccessErrorDomain"), v20, v18);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_16;
        }
        goto LABEL_17;
      }
    }
    else
    {
      if (!+[BMAccessControlPolicy allowsConfiguringConnection:forUseCase:inDomain:error:](BMAccessControlPolicy, "allowsConfiguringConnection:forUseCase:inDomain:error:", v6, v7, self->_domain, a4))
      {
LABEL_16:
        LOBYTE(a4) = 0;
        goto LABEL_17;
      }
      -[NSXPCConnection bm_process](v6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[BMAccessControlPolicy policyForProcess:connectionFlags:useCase:](BMAccessControlPolicy, "policyForProcess:connectionFlags:useCase:", v21, -[NSXPCConnection bm_connectionFlags](v6), v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSXPCConnection setBm_accessControlPolicy:](v6, v22);
    }
    LOBYTE(a4) = 1;
    goto LABEL_17;
  }
  if (a4)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D50];
    v30[0] = CFSTR("Connection missing use-case");
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = (const __CFString **)v30;
    v17 = &v29;
    goto LABEL_9;
  }
LABEL_17:

  return (char)a4;
}

- (id)endpointForCoreDuetUseCases
{
  BMXPCListener *coreDuetListener;
  BMXPCListener *v4;
  BMXPCListener *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  coreDuetListener = self->_coreDuetListener;
  if (!coreDuetListener)
  {
    +[BMXPCListener anonymousListenerWithQueue:](BMXPCListener, "anonymousListenerWithQueue:", self->_queue);
    v4 = (BMXPCListener *)objc_claimAutoreleasedReturnValue();
    v5 = self->_coreDuetListener;
    self->_coreDuetListener = v4;

    -[BMXPCListener setDelegate:](self->_coreDuetListener, "setDelegate:", self);
    -[BMXPCListener activate](self->_coreDuetListener, "activate");
    coreDuetListener = self->_coreDuetListener;
  }
  return -[BMXPCListener endpoint](coreDuetListener, "endpoint");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreDuetListener, 0);
  objc_storeStrong((id *)&self->_clientSpecificListeners, 0);
  objc_storeStrong((id *)&self->_fileServer, 0);
  objc_storeStrong((id *)&self->_accessServer, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  OUTLINED_FUNCTION_11();
  objc_msgSend(v1, "executableName");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x12u);

  OUTLINED_FUNCTION_0_0();
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(void *)a2 .cold.2(void *a1, void *a2)
{
  void *v2;
  void *v3;
  void *v5;
  os_log_t v6;
  os_log_type_t v7;
  const char *v8;
  uint8_t *v9;

  objc_msgSend(a1, "executableName");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  objc_msgSend(a2, "executableName");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(v5, v6, v7, v8, v9, 0x22u);

  OUTLINED_FUNCTION_4_0();
}

- (void)listener:shouldAcceptNewConnection:.cold.3()
{
  NSObject *v0;
  void *v1;
  id v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_11();
  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v2, "executableName");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_1AEB31000, v0, OS_LOG_TYPE_ERROR, "Refusing connection from %{public}@(%d), process not properly entitled", v3, 0x12u);

  OUTLINED_FUNCTION_0_0();
}

- (void)listener:(NSObject *)a3 shouldAcceptNewConnection:.cold.4(void *a1, void *a2, NSObject *a3)
{
  void *v3;
  void *v4;
  uint8_t v7[40];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "executableName");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  objc_msgSend(a2, "executableName");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_12();
  _os_log_fault_impl(&dword_1AEB31000, a3, OS_LOG_TYPE_FAULT, "Process %@(%d) not authorized to act on behalf of process %@(%d)", v7, 0x22u);

  OUTLINED_FUNCTION_4_0();
}

- (void)listener:shouldAcceptNewConnection:.cold.5()
{
  void *v0;
  id v1;
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  OUTLINED_FUNCTION_11();
  objc_msgSend(v1, "executableName");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x1Cu);

  OUTLINED_FUNCTION_7();
}

- (void)listener:shouldAcceptNewConnection:.cold.6()
{
  NSObject *v0;
  void *v1;
  id v2;
  uint8_t v3[20];
  const __CFString *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_11();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v2, "executableName");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3();
  v4 = CFSTR("coreduetd");
  _os_log_error_impl(&dword_1AEB31000, v0, OS_LOG_TYPE_ERROR, "Refusing connection from %{public}@(%d) via %{public}@, process not properly entitled", v3, 0x1Cu);

  OUTLINED_FUNCTION_7();
}

- (void)replyToInvocation:(void *)a1 withError:(const char *)a2 .cold.1(void *a1, const char *a2)
{
  const char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = (const char *)OUTLINED_FUNCTION_10(a1, a2);
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1AEB31000, v4, v5, "Unable to determine reply block signature for -%@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_5_0();
}

- (void)replyToInvocation:(void *)a1 withError:(const char *)a2 .cold.2(void *a1, const char *a2)
{
  const char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = (const char *)OUTLINED_FUNCTION_10(a1, a2);
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1AEB31000, v4, v5, "Unable to locate error parameter for reply block of -%@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_5_0();
}

- (void)replyToInvocation:(void *)a1 withError:(const char *)a2 .cold.3(void *a1, const char *a2)
{
  const char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = (const char *)OUTLINED_FUNCTION_10(a1, a2);
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1AEB31000, v4, v5, "Unable to locate reply block for -%@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_5_0();
}

- (void)connection:(uint64_t)a1 handleInvocation:(void *)a2 isReply:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector((SEL)objc_msgSend(a2, "selector"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_fault_impl(&dword_1AEB31000, a3, OS_LOG_TYPE_FAULT, "Connection %@ failed to route request -%@", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_0_0();
}

@end

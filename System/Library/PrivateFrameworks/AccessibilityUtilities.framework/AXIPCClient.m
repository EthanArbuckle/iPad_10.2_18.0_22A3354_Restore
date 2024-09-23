@implementation AXIPCClient

uint64_t __66__AXIPCClient__prepareToSendMessage_withError_prepSuccessHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  __CFMachPort *v3;
  uint64_t result;

  v2 = a1[4];
  v3 = *(__CFMachPort **)(v2 + 8);
  if (v3)
  {
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = CFMachPortGetPort(v3);
    v2 = a1[4];
  }
  result = *(_QWORD *)(v2 + 48);
  if (result)
    result = MSHGetMachPortFromSource();
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (BOOL)sendSimpleMessage:(id)a3 withError:(id *)a4
{
  return -[AXIPCClient sendSimpleMessage:synchronizationPort:error:](self, "sendSimpleMessage:synchronizationPort:error:", a3, 0, a4);
}

- (BOOL)sendSimpleMessage:(id)a3 synchronizationPort:(unsigned int)a4 error:(id *)a5
{
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id *v13;
  unsigned int v14;

  v8 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__AXIPCClient_sendSimpleMessage_synchronizationPort_error___block_invoke;
  v11[3] = &unk_1E24C7260;
  v14 = a4;
  v11[4] = self;
  v12 = v8;
  v13 = a5;
  v9 = v8;
  LOBYTE(a5) = -[AXIPCClient _prepareToSendMessage:withError:prepSuccessHandler:](self, "_prepareToSendMessage:withError:prepSuccessHandler:", v9, a5, v11);

  return (char)a5;
}

- (BOOL)_prepareToSendMessage:(id)a3 withError:(id *)a4 prepSuccessHandler:(id)a5
{
  id v8;
  uint64_t (**v9)(id, uint64_t, _QWORD, void *);
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;

  v8 = a3;
  v9 = (uint64_t (**)(id, uint64_t, _QWORD, void *))a5;
  if (-[AXIPCClient _verifyConnectionWithError:](self, "_verifyConnectionWithError:", a4))
  {
    if (v8)
    {
      v26 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v26);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    v17 = MEMORY[0x1E0C809B0];
    AX_PERFORM_WITH_LOCK();
    v12 = *((unsigned int *)v19 + 6);
    if ((_DWORD)v12)
    {
      v11 = v9[2](v9, v12, *((unsigned int *)v23 + 6), v10);
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      -[AXIPCClient serviceName](self, "serviceName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("Could not send simple message (%@). server port is NULL [%@]"), v14, v8, v17, 3221225472, __66__AXIPCClient__prepareToSendMessage_withError_prepSuccessHandler___block_invoke, &unk_1E24C7238, self, &v18, &v22);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXIPCClient _handleErrorWithMessage:outError:](self, "_handleErrorWithMessage:outError:", v15, a4);

      v11 = 0;
    }
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v22, 8);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

BOOL __59__AXIPCClient_sendSimpleMessage_synchronizationPort_error___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v7;
  int v8;
  id v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a4;
  v8 = *(_DWORD *)(a1 + 56);
  v9 = objc_retainAutorelease(v7);
  v10 = objc_msgSend(v9, "bytes");
  v11 = objc_msgSend(v9, "length");
  if (v8)
    v12 = _AXIPCSimpleSendDataWithFencePort(a2, a3, v8, 0, v10, v11);
  else
    v12 = _AXIPCSimpleSendData(a2, a3, 0, v10, v11);
  v13 = v12;
  if ((_DWORD)v12)
  {
    v14 = *(void **)(a1 + 32);
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v14, "serviceName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Could not send simple message (%@). Port:%d. Error:%d (0x%x). \n%@"), v16, a2, v13, v13, *(_QWORD *)(a1 + 40));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_handleErrorWithMessage:machError:outError:", v17, v13, *(_QWORD *)(a1 + 48));

  }
  return (_DWORD)v13 == 0;
}

- (BOOL)_verifyConnectionWithError:(id *)a3
{
  const __CFString *v5;

  if (self->_serverPort)
  {
    if (-[AXIPCClient isConnected](self, "isConnected"))
      v5 = 0;
    else
      v5 = CFSTR("Could not verify connection. client is not connected");
  }
  else
  {
    v5 = CFSTR("Could not verify connection. server port was nil");
  }
  return !-[AXIPCClient _handleErrorWithMessage:outError:](self, "_handleErrorWithMessage:outError:", v5, a3);
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (BOOL)_handleErrorWithMessage:(id)a3 outError:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    AXLogIPC();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v5;
      _os_log_impl(&dword_18C62B000, v6, OS_LOG_TYPE_INFO, "AX IPC Client: %{public}@", buf, 0xCu);
    }

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CF39C0], "errorWithDescription:", CFSTR("%@"), v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v8 = objc_retainAutorelease(v7);
      *a4 = v8;

    }
  }
  else if (a4)
  {
    v7 = 0;
    goto LABEL_8;
  }

  return v5 != 0;
}

+ (void)initialize
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___AXIPCClient;
  objc_msgSendSuper2(&v2, sel_initialize);
  if (initialize__AXIPCClientInitializeOnceToken != -1)
    dispatch_once(&initialize__AXIPCClientInitializeOnceToken, &__block_literal_global_84);
}

void __25__AXIPCClient_initialize__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v1 = (void *)AllClientLock;
  AllClientLock = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)AllClients;
  AllClients = v2;

}

+ (id)allClients
{
  void *v2;

  objc_msgSend((id)AllClientLock, "lock");
  objc_msgSend((id)AllClients, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)AllClientLock, "unlock");
  return v2;
}

- (void)_commonInit
{
  void *v3;
  id v4;

  self->_timeout = 0.25;
  objc_msgSend((id)AllClientLock, "lock");
  objc_msgSend((id)AllClients, "addPointer:", self);
  objc_msgSend((id)AllClientLock, "unlock");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXIPCClient setPostConnectionTasks:](self, "setPostConnectionTasks:", v3);

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF3940]), "initWithParentClass:description:appendUUIDToLabel:", objc_opt_class(), CFSTR("connection"), 1);
  -[AXIPCClient setConnectionQueue:](self, "setConnectionQueue:", v4);
  self->_connectionAttempts = 0;
  self->_clientIdentifierLock._os_unfair_lock_opaque = 0;
  self->_connectionServiceLock._os_unfair_lock_opaque = 0;

}

- (AXIPCClient)initWithServiceName:(id)a3
{
  id v4;
  AXIPCClient *v5;
  AXIPCClient *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXIPCClient;
  v5 = -[AXIPCClient init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_assignedServerMachPort = 0;
    -[AXIPCClient setServiceName:](v5, "setServiceName:", v4);
    -[AXIPCClient _commonInit](v6, "_commonInit");
  }

  return v6;
}

- (AXIPCClient)initWithPort:(unsigned int)a3
{
  AXIPCClient *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXIPCClient;
  v4 = -[AXIPCClient init](&v6, sel_init);
  if (v4)
  {
    AXIncrefSendRight(a3);
    v4->_assignedServerMachPort = a3;
    -[AXIPCClient _commonInit](v4, "_commonInit");
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t i;
  AXIPCClient *v9;
  uint64_t v10;
  const void *v11;
  objc_super v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  AXIPCClient *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  AXIPCClient *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)AllClientLock, "lock");
  objc_msgSend((id)AllClients, "compact");
  objc_msgSend((id)AllClientLock, "unlock");
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __22__AXIPCClient_dealloc__block_invoke;
  v25 = &unk_1E24C5980;
  v26 = self;
  v27 = &v28;
  AX_PERFORM_WITH_LOCK();
  if (!v29[3])
    goto LABEL_17;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  +[AXIPCClient allClients](AXIPCClient, "allClients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v32, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v19;
    v7 = 1;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v4);
        v9 = *(AXIPCClient **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (v9 != self)
        {
          v10 = -[AXIPCClient serverPort](v9, "serverPort");
          v7 &= v10 != v29[3];
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v32, 16);
    }
    while (v5);

    if ((v7 & 1) == 0)
      goto LABEL_15;
  }
  else
  {

  }
  CFMachPortInvalidate((CFMachPortRef)v29[3]);
LABEL_15:
  v11 = (const void *)v29[3];
  if (v11)
  {
    CFRelease(v11);
    v29[3] = 0;
  }
LABEL_17:
  v13 = v3;
  v14 = 3221225472;
  v15 = __22__AXIPCClient_dealloc__block_invoke_2;
  v16 = &unk_1E24C4C38;
  v17 = self;
  AX_PERFORM_WITH_LOCK();
  _Block_object_dispose(&v28, 8);
  v12.receiver = self;
  v12.super_class = (Class)AXIPCClient;
  -[AXIPCClient dealloc](&v12, sel_dealloc);
}

void __22__AXIPCClient_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  __CFRunLoopSource *v3;
  const void *v4;
  const void *v5;
  const void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(__CFRunLoopSource **)(v2 + 48);
  if (v3)
  {
    CFRunLoopSourceInvalidate(v3);
    v2 = *(_QWORD *)(a1 + 32);
    v4 = *(const void **)(v2 + 48);
    if (v4)
    {
      CFRelease(v4);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(v2 + 8);
  v5 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v5)
    CFRetain(v5);
  v6 = *(const void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v6)
  {
    CFRelease(v6);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  }
}

uint64_t __22__AXIPCClient_dealloc__block_invoke_2(uint64_t result)
{
  mach_port_name_t v1;

  v1 = *(_DWORD *)(*(_QWORD *)(result + 32) + 16);
  if (v1)
  {
    result = mach_port_deallocate(*MEMORY[0x1E0C83DA0], v1);
    if ((_DWORD)result)
      return _AXAssert();
  }
  return result;
}

- (id)description
{
  void *v3;
  NSString *serviceName;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__7;
  v15 = __Block_byref_object_dispose__7;
  v16 = 0;
  v9 = MEMORY[0x1E0C809B0];
  AX_PERFORM_WITH_LOCK();
  v3 = (void *)MEMORY[0x1E0CB3940];
  serviceName = self->_serviceName;
  v5 = v12[5];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_connected);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AXIPCClient:<%p> Service:%@ ID:%@ connected:%@"), self, serviceName, v5, v6, v9, 3221225472, __26__AXIPCClient_description__block_invoke, &unk_1E24C52F0, self, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v11, 8);
  return v7;
}

void __26__AXIPCClient_description__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unsigned)serviceMachPort
{
  __CFMachPort *serverPort;

  serverPort = self->_serverPort;
  if (serverPort)
    LODWORD(serverPort) = CFMachPortGetPort(serverPort);
  return serverPort;
}

- (NSString)clientIdentifier
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__7;
  v8 = __Block_byref_object_dispose__7;
  v9 = 0;
  AX_PERFORM_WITH_LOCK();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __31__AXIPCClient_clientIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setClientIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AXLogIPC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v4;
    _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_DEFAULT, "Setting client identifier %{public}@", buf, 0xCu);
  }

  v7 = MEMORY[0x1E0C809B0];
  v8 = v4;
  v6 = v4;
  AX_PERFORM_WITH_LOCK();
  -[AXIPCClient _registerWithServer](self, "_registerWithServer", v7, 3221225472, __35__AXIPCClient_setClientIdentifier___block_invoke, &unk_1E24C5200);

}

void __35__AXIPCClient_setClientIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  void **v2;
  _QWORD *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;

  v2 = (void **)(a1 + 32);
  v1 = *(void **)(a1 + 32);
  v3 = v2 + 1;
  v4 = (void *)*((_QWORD *)v2[1] + 5);
  if (v1 != v4)
  {
    if (v4)
    {
      AXLogIPC();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __35__AXIPCClient_setClientIdentifier___block_invoke_cold_1((uint64_t)(v2 + 1), v2, v5);

      v1 = *v2;
    }
    v6 = objc_msgSend(v1, "copy");
    v7 = *(void **)(*v3 + 40);
    *(_QWORD *)(*v3 + 40) = v6;

  }
}

- (__CFRunLoopSource)clientCallbackSource
{
  const void *v2;
  __CFRunLoopSource *v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  AX_PERFORM_WITH_LOCK();
  v2 = (const void *)v6[3];
  if (v2)
  {
    CFAutorelease(v2);
    v3 = (__CFRunLoopSource *)v6[3];
  }
  else
  {
    v3 = 0;
  }
  _Block_object_dispose(&v5, 8);
  return v3;
}

CFTypeRef __35__AXIPCClient_clientCallbackSource__block_invoke(uint64_t a1)
{
  CFTypeRef result;
  uint64_t v3;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 48);
  if (result)
  {
    result = CFRetain(result);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  }
  else
  {
    v3 = 0;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (unsigned)clientCallbackPort
{
  unsigned int v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  int v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  AX_PERFORM_WITH_LOCK();
  v2 = *((_DWORD *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __33__AXIPCClient_clientCallbackPort__block_invoke(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = MSHGetMachPortFromSource();
  }
  else
  {
    AXLogIPC();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_18C62B000, v1, OS_LOG_TYPE_INFO, "AX Asked for client callback port but we had not yet registered", v2, 2u);
    }

  }
}

- (void)_registerWithServer
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  __CFRunLoopSource *v14;
  uint64_t v15;
  __CFRunLoop *Main;
  NSObject *v17;
  uint8_t v18[12];
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  AXIPCClient *v24;
  _BYTE *v25;
  _BYTE buf[24];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  AXLogIPC();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithBool:", objc_msgSend(v8, "isMainThread"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXIPCClient shouldRegisterCallbackSourceOnMainRunloop](self, "shouldRegisterCallbackSourceOnMainRunloop"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2114;
    v27 = v6;
    v28 = 2114;
    v29 = v9;
    v30 = 2114;
    v31 = v10;
    _os_log_impl(&dword_18C62B000, v3, OS_LOG_TYPE_INFO, "Client (%{public}@) registering with server on thread (%{public}@:name:%{public}@:main:%{public}@). UsesMainThreadRunloop:%{public}@", buf, 0x34u);

  }
  -[AXIPCClient clientIdentifier](self, "clientIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == 0;

  if (!v12)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v27) = 0;
    v13 = MEMORY[0x1E0C809B0];
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __34__AXIPCClient__registerWithServer__block_invoke;
    v23 = &unk_1E24C52F0;
    v24 = self;
    v25 = buf;
    AX_PERFORM_WITH_LOCK();
    if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      v19 = 1024;
      v14 = (__CFRunLoopSource *)MSHCreateMIGServerSource();
      if (v14)
      {
        v15 = MSHGetMachPortFromSource();
        MEMORY[0x18D7863CC](*MEMORY[0x1E0C83DA0], v15, 1, &v19, 4);
        if (-[AXIPCClient shouldRegisterCallbackSourceOnMainRunloop](self, "shouldRegisterCallbackSourceOnMainRunloop"))
          Main = CFRunLoopGetMain();
        else
          Main = CFRunLoopGetCurrent();
        CFRunLoopAddSource(Main, v14, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
        AX_PERFORM_WITH_LOCK();
        -[AXIPCClient _sendRegistrationMessageWithRetries:](self, "_sendRegistrationMessageWithRetries:", 10, v13, 3221225472, __34__AXIPCClient__registerWithServer__block_invoke_99, &unk_1E24C6FE0, self, v14);
      }
      else
      {
        AXLogIPC();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v18 = 0;
          _os_log_impl(&dword_18C62B000, v17, OS_LOG_TYPE_DEFAULT, "Could not create a server source for the client to register with the server", v18, 2u);
        }

      }
    }
    _Block_object_dispose(buf, 8);
  }
}

uint64_t __34__AXIPCClient__registerWithServer__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 48) != 0;
  return result;
}

uint64_t __34__AXIPCClient__registerWithServer__block_invoke_99(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 48) = *(_QWORD *)(result + 40);
  return result;
}

- (void)_sendRegistrationMessageWithRetries:(int)a3
{
  void *v5;
  AXIPCMessage *v6;
  uint64_t v7;
  void *v8;
  AXIPCMessage *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  -[AXIPCClient clientIdentifier](self, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = CFSTR("client identifer was NULL");
    goto LABEL_13;
  }
  if (!-[AXIPCClient verifyConnectionExists](self, "verifyConnectionExists"))
  {
    AXLogIPC();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v5;
      _os_log_impl(&dword_18C62B000, v15, OS_LOG_TYPE_DEFAULT, "Could not register with server with client identifier: %{public}@", buf, 0xCu);
    }

    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = CFSTR("Couldn't register as connection did not exist");
LABEL_13:
    objc_msgSend(v13, "ax_errorWithDomain:description:", CFSTR("AXIPCErrorDomain"), v14);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_21;
    goto LABEL_14;
  }
  v6 = [AXIPCMessage alloc];
  v7 = AXIPCRegisterClientWithServer;
  v25 = CFSTR("identifier");
  v26[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AXIPCMessage initWithKey:payload:](v6, "initWithKey:payload:", v7, v8);

  v18 = 0;
  -[AXIPCClient sendSimpleMessage:withError:](self, "sendSimpleMessage:withError:", v9, &v18);
  v10 = v18;
  if (v10)
  {
    AXLogIPC();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "ax_nonRedundantDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v12;
      _os_log_impl(&dword_18C62B000, v11, OS_LOG_TYPE_DEFAULT, "Could not register with server: %{public}@", buf, 0xCu);

    }
  }

  if (v10)
  {
LABEL_14:
    AXLogIPC();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a3 < 1)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[AXIPCClient _sendRegistrationMessageWithRetries:].cold.1((uint64_t)v5, (uint64_t)v10, v17);

    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v20 = v5;
        v21 = 1024;
        v22 = a3;
        v23 = 2114;
        v24 = v10;
        _os_log_impl(&dword_18C62B000, v17, OS_LOG_TYPE_DEFAULT, "Could not register with server for %{public}@. %d tries remaining: %{public}@", buf, 0x1Cu);
      }

      AXPerformBlockOnMainThreadAfterDelay();
    }
  }
LABEL_21:

}

void __51__AXIPCClient__sendRegistrationMessageWithRetries___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x18D7864C8]();
  objc_msgSend(*(id *)(a1 + 32), "_sendRegistrationMessageWithRetries:", (*(_DWORD *)(a1 + 40) - 1));
  objc_autoreleasePoolPop(v2);
}

- (BOOL)verifyConnectionExists
{
  BOOL v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v8;
  uint8_t buf[4];
  AXIPCClient *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[AXIPCClient isConnected](self, "isConnected"))
    return 1;
  v8 = 0;
  v3 = -[AXIPCClient connectWithError:](self, "connectWithError:", &v8);
  v4 = v8;
  if (!v3)
  {
    AXLogIPC();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "ax_nonRedundantDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v10 = self;
      v11 = 2114;
      v12 = v6;
      _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_DEFAULT, "client could not connect to new service: %{public}@ %{public}@", buf, 0x16u);

    }
  }

  return v3;
}

- (BOOL)connectWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  __CFString *v7;
  mach_port_t assignedServerMachPort;
  _BOOL4 v9;
  mach_port_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  __CFMachPort *v14;
  NSObject *v15;
  __CFMachPort *serverPort;
  BOOL v17;
  mach_port_t sp;
  uint8_t buf[4];
  __CFMachPort *v21;
  __int16 v22;
  mach_port_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[AXIPCClient serviceName](self, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length") && !self->_assignedServerMachPort)
  {
    v6 = 0;
    v7 = CFSTR("Client could not connect. Was initialized with an empty service name.");
    goto LABEL_19;
  }
  if (-[AXIPCClient isConnected](self, "isConnected"))
  {
    v6 = 0;
    v7 = CFSTR("Client could not connect. It is already connected");
    goto LABEL_19;
  }
  assignedServerMachPort = self->_assignedServerMachPort;
  sp = assignedServerMachPort;
  if (assignedServerMachPort)
  {
    v6 = 0;
  }
  else
  {
    v9 = -[AXIPCClient usesPerPidLookup](self, "usesPerPidLookup");
    v10 = *MEMORY[0x1E0C81720];
    v11 = objc_retainAutorelease(v5);
    v12 = (const char *)objc_msgSend(v11, "UTF8String");
    if (v9)
    {
      -[AXIPCClient pid](self, "pid");
      v13 = bootstrap_look_up2();
    }
    else
    {
      v13 = bootstrap_look_up(v10, v12, &sp);
    }
    v6 = v13;
    assignedServerMachPort = sp;
    if (!sp || (_DWORD)v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not find server for service: %@. bootstrap error: %s"), v11, bootstrap_strerror(v13));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      assignedServerMachPort = sp;
      if (!sp)
        goto LABEL_19;
      goto LABEL_14;
    }
  }
  v7 = 0;
LABEL_14:
  v14 = CFMachPortCreateWithPort((CFAllocatorRef)*MEMORY[0x1E0C9AE00], assignedServerMachPort, 0, 0, 0);
  self->_serverPort = v14;
  if (v14)
  {
    CFMachPortSetInvalidationCallBack(v14, (CFMachPortInvalidationCallBack)AXIPCClient_handlePortInvalidCallback);
    AXLogIPC();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      serverPort = self->_serverPort;
      *(_DWORD *)buf = 138543618;
      v21 = serverPort;
      v22 = 1024;
      v23 = sp;
      _os_log_impl(&dword_18C62B000, v15, OS_LOG_TYPE_INFO, "Connected to server: %{public}@ %d", buf, 0x12u);
    }

    -[AXIPCClient setConnected:](self, "setConnected:", 1);
    -[AXIPCClient _registerWithServer](self, "_registerWithServer");
  }
  else
  {

    v7 = CFSTR("Could not make mach port");
  }
LABEL_19:
  v17 = -[AXIPCClient _handleErrorWithMessage:machError:outError:](self, "_handleErrorWithMessage:machError:outError:", v7, v6, a3);

  return !v17;
}

- (BOOL)disconnectWithError:(id *)a3
{
  __CFMachPort *v5;
  const void *v6;
  const __CFString *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (-[AXIPCClient isConnected](self, "isConnected"))
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v9 = MEMORY[0x1E0C809B0];
    AX_PERFORM_WITH_LOCK();
    v5 = (__CFMachPort *)v11[3];
    if (v5)
    {
      CFMachPortInvalidate(v5);
      v6 = (const void *)v11[3];
      if (v6)
      {
        CFRelease(v6);
        v11[3] = 0;
      }
    }
    -[AXIPCClient setConnected:](self, "setConnected:", 0, v9, 3221225472, __35__AXIPCClient_disconnectWithError___block_invoke, &unk_1E24C52F0, self, &v10);
    _Block_object_dispose(&v10, 8);
    v7 = 0;
  }
  else
  {
    v7 = CFSTR("Client could not disconnect. It is already disconnected");
  }
  return !-[AXIPCClient _handleErrorWithMessage:outError:](self, "_handleErrorWithMessage:outError:", v7, a3);
}

uint64_t __35__AXIPCClient_disconnectWithError___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  *(_QWORD *)(*(_QWORD *)(result + 32) + 8) = 0;
  return result;
}

- (void)sendSimpleMessage:(id)a3
{
  -[AXIPCClient sendSimpleMessage:withError:](self, "sendSimpleMessage:withError:", a3, 0);
}

- (id)sendMessage:(id)a3 withError:(id *)a4
{
  id v6;
  id v7;
  BOOL v8;
  uint64_t *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  id *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7;
  v20 = __Block_byref_object_dispose__7;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __37__AXIPCClient_sendMessage_withError___block_invoke;
  v12[3] = &unk_1E24C7288;
  v12[4] = self;
  v14 = &v16;
  v7 = v6;
  v13 = v7;
  v15 = a4;
  v8 = -[AXIPCClient _prepareToSendMessage:withError:prepSuccessHandler:](self, "_prepareToSendMessage:withError:prepSuccessHandler:", v7, a4, v12);
  v9 = v17;
  if (!v8 && v17[5])
  {
    _AXAssert();
    v9 = v17;
  }
  v10 = (id)v9[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

uint64_t __37__AXIPCClient_sendMessage_withError___block_invoke(uint64_t a1, uint64_t a2, int a3, id a4)
{
  uint64_t v7;
  id v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  unsigned int v20;
  uint64_t v21;

  v21 = 0;
  v20 = 0;
  v7 = (int)(float)(*(float *)(*(_QWORD *)(a1 + 32) + 32) * 1000.0);
  v8 = objc_retainAutorelease(a4);
  v9 = objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");

  v11 = _AXIPCSendData(a2, a3, v7, v9, v10, &v21, &v20);
  if ((_DWORD)v11)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "serviceName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Could not send message (%@). Port:%d. Error:%d (0x%x). Timeout:%f(%d). \n%@\n"), v13, a2, v11, v11, *(float *)(*(_QWORD *)(a1 + 32) + 32), v7, *(_QWORD *)(a1 + 40));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v20)
    {
      v14 = 0;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x18D786ABC](*MEMORY[0x1E0C83DA0], v21, v20);
    +[AXIPCMessage archivedMessageFromData:](AXIPCMessage, "archivedMessageFromData:", v13);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      v14 = 0;
    else
      v14 = CFSTR("Reply data could not be converted into a message");
  }

LABEL_8:
  v18 = objc_msgSend(*(id *)(a1 + 32), "_handleErrorWithMessage:machError:outError:", v14, v11, *(_QWORD *)(a1 + 56)) ^ 1;

  return v18;
}

- (BOOL)sendAsyncMessage:(id)a3 withReplyHandler:(id)a4
{
  void *v7;

  dispatch_get_global_queue(0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[AXIPCClient sendAsyncMessage:replyOnQueue:replyHandler:](self, "sendAsyncMessage:replyOnQueue:replyHandler:", a3, v7, a4);

  return (char)a4;
}

- (BOOL)sendAsyncMessage:(id)a3 replyOnQueue:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  BOOL v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[5];
  NSObject *v23;
  id v24;
  id v25;
  void **v26;
  void *v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v27 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __58__AXIPCClient_sendAsyncMessage_replyOnQueue_replyHandler___block_invoke;
  v22[3] = &unk_1E24C72B0;
  v22[4] = self;
  v12 = v9;
  v23 = v12;
  v13 = v10;
  v25 = v13;
  v14 = v8;
  v24 = v14;
  v26 = &v27;
  v15 = -[AXIPCClient _prepareToSendMessage:withError:prepSuccessHandler:](self, "_prepareToSendMessage:withError:prepSuccessHandler:", v14, &v27, v22);
  v16 = v27;
  if (!v15 && !v27)
  {
    _AXAssert();
    v16 = v27;
  }
  if (v16)
  {
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __58__AXIPCClient_sendAsyncMessage_replyOnQueue_replyHandler___block_invoke_2;
    v19[3] = &unk_1E24C54A8;
    v20 = v16;
    v21 = v13;
    v17 = v20;
    dispatch_async(v12, v19);

  }
  return v15;
}

BOOL __58__AXIPCClient_sendAsyncMessage_replyOnQueue_replyHandler___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v12;
  mach_port_name_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  mach_port_name_t name;

  v7 = a4;
  name = 0;
  v8 = mach_port_allocate(*MEMORY[0x1E0C83DA0], 1u, &name);
  if ((_DWORD)v8)
  {
    v9 = v8;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not allocate reply port: %d"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
LABEL_3:
      objc_msgSend(*(id *)(a1 + 32), "_handleErrorWithMessage:machError:outError:", v10, v9, *(_QWORD *)(a1 + 64));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_createRegistrationWithReplyMachPort:forAsyncReplyOnQueue:responseHandler:", name, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = name;
    v14 = objc_retainAutorelease(v7);
    v9 = _AXIPCSendDataWithAsyncReply(a2, a3, v13, 0, objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"));
    if ((_DWORD)v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "serviceName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "description");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("Could not send message (%@). Port:%d. Error:%@.  %@\n"), v17, a2, v15, v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "initialSendAborted");
    }
    else
    {
      v10 = 0;
    }

    if (v10)
      goto LABEL_3;
  }

  return v10 == 0;
}

uint64_t __58__AXIPCClient_sendAsyncMessage_replyOnQueue_replyHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (id)_createRegistrationWithReplyMachPort:(unsigned int)a3 forAsyncReplyOnQueue:(id)a4 responseHandler:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  AXIPCOutstandingAsyncRequest *v9;

  v6 = *(_QWORD *)&a3;
  v7 = a5;
  v8 = a4;
  v9 = -[AXIPCOutstandingAsyncRequest initWithReplyPort:handlerQueue:handler:]([AXIPCOutstandingAsyncRequest alloc], "initWithReplyPort:handlerQueue:handler:", v6, v8, v7);

  -[AXIPCOutstandingAsyncRequest registerAndListenForResponse](v9, "registerAndListenForResponse");
  return v9;
}

- (void)setPortDeathHandler:(id)a3
{
  id v4;
  id portDeathHandler;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  portDeathHandler = self->_portDeathHandler;
  if (portDeathHandler != v4)
  {
    v8 = v4;
    if (portDeathHandler)
    {
      self->_portDeathHandler = 0;

      v4 = v8;
    }
    if (v4)
    {
      v6 = (void *)objc_msgSend(v8, "copy");
      v7 = self->_portDeathHandler;
      self->_portDeathHandler = v6;

      v4 = v8;
    }
  }

}

- (void)_serverDied
{
  void *v3;
  void (**v4)(void);
  __CFMachPort *v5;
  const void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  -[AXIPCClient setConnected:](self, "setConnected:", 0);
  -[AXIPCClient portDeathHandler](self, "portDeathHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AXIPCClient portDeathHandler](self, "portDeathHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  AX_PERFORM_WITH_LOCK();
  v5 = (__CFMachPort *)v8[3];
  if (v5)
  {
    CFMachPortInvalidate(v5);
    v6 = (const void *)v8[3];
    if (v6)
    {
      CFRelease(v6);
      v8[3] = 0;
    }
  }
  _Block_object_dispose(&v7, 8);
}

void __26__AXIPCClient__serverDied__block_invoke(uint64_t a1)
{
  uint64_t v2;
  __CFRunLoopSource *v3;
  const void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(__CFRunLoopSource **)(v2 + 48);
  if (v3)
  {
    CFRunLoopSourceInvalidate(v3);
    v2 = *(_QWORD *)(a1 + 32);
    v4 = *(const void **)(v2 + 48);
    if (v4)
    {
      CFRelease(v4);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(v2 + 8);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
}

- (void)_attemptToEstablishConnection
{
  int v1;
  void *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138543362;
  v2 = &unk_1E24F9110;
  _os_log_error_impl(&dword_18C62B000, log, OS_LOG_TYPE_ERROR, "A connection to the server could not be made after %{public}@s. Calling timeout blocks", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

uint64_t __44__AXIPCClient__attemptToEstablishConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_attemptToEstablishConnection");
}

- (void)establishConnectionWithTimeout:(double)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  _QWORD v8[5];
  void (**v9)(id, _QWORD);
  double v10;

  v6 = (void (**)(id, _QWORD))a4;
  if (v6)
  {
    if (-[AXIPCClient isConnected](self, "isConnected"))
    {
      v6[2](v6, 0);
    }
    else
    {
      -[AXIPCClient connectionQueue](self, "connectionQueue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __57__AXIPCClient_establishConnectionWithTimeout_completion___block_invoke;
      v8[3] = &unk_1E24C72D8;
      v10 = a3;
      v8[4] = self;
      v9 = v6;
      objc_msgSend(v7, "performSynchronousWritingBlock:", v8);

    }
  }

}

void __57__AXIPCClient_establishConnectionWithTimeout_completion___block_invoke(uint64_t a1)
{
  AXPostConnectionTask *v2;
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  AXPostConnectionTask *v8;

  v2 = [AXPostConnectionTask alloc];
  v3 = *(double *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "connectionQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AXPostConnectionTask initWithConnectBlock:timeout:accessQueue:](v2, "initWithConnectBlock:timeout:accessQueue:", v4, v5, v3);

  objc_msgSend(*(id *)(a1 + 32), "postConnectionTasks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v8);

  v7 = *(_QWORD **)(a1 + 32);
  if (!v7[7])
    objc_msgSend(v7, "_attemptToEstablishConnection");

}

- (BOOL)_handleErrorWithMessage:(id)a3 machError:(int)a4 outError:(id *)a5
{
  uint64_t v6;
  _BOOL4 v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = *(_QWORD *)&a4;
  v7 = -[AXIPCClient _handleErrorWithMessage:outError:](self, "_handleErrorWithMessage:outError:", a3, a5);
  v8 = v7;
  if (a5 && v7 && *a5)
  {
    objc_msgSend(*a5, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("AXIPCErrorKeyMachError"));

    v12 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(*a5, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, objc_msgSend(*a5, "code"), v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)_descriptionForMachError:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  id result;

  if (a3 <= 15871)
  {
    if (a3 <= 2047)
    {
      if (!a3)
        return CFSTR("MACH_MSG_SUCCESS");
      if (a3 == 1024)
        return CFSTR("MACH_MSG_VM_KERNEL");
    }
    else
    {
      switch(a3)
      {
        case 0x800:
          return CFSTR("MACH_MSG_IPC_KERNEL");
        case 0x1000:
          return CFSTR("MACH_MSG_VM_SPACE");
        case 0x2000:
          v5 = CFSTR("MACH_MSG_IPC_SPACE");
          return v5;
      }
    }
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown mach error :%d (0x%x)"), *(_QWORD *)&a3, *(_QWORD *)&a3, v3, v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  switch(a3)
  {
    case 268435457:
      result = CFSTR("MACH_SEND_IN_PROGRESS");
      break;
    case 268435458:
      result = CFSTR("MACH_SEND_INVALID_DATA");
      break;
    case 268435459:
      result = CFSTR("MACH_SEND_INVALID_DEST");
      break;
    case 268435460:
      result = CFSTR("MACH_SEND_TIMED_OUT");
      break;
    case 268435461:
    case 268435462:
    case 268435474:
    case 268435475:
    case 268435476:
      goto LABEL_21;
    case 268435463:
      result = CFSTR("MACH_SEND_INTERRUPTED");
      break;
    case 268435464:
      result = CFSTR("MACH_SEND_MSG_TOO_SMALL");
      break;
    case 268435465:
      result = CFSTR("MACH_SEND_INVALID_REPLY");
      break;
    case 268435466:
      result = CFSTR("MACH_SEND_INVALID_RIGHT");
      break;
    case 268435467:
      result = CFSTR("MACH_SEND_INVALID_NOTIFY");
      break;
    case 268435468:
      result = CFSTR("MACH_SEND_INVALID_MEMORY");
      break;
    case 268435469:
      result = CFSTR("MACH_SEND_NO_BUFFER");
      break;
    case 268435470:
      result = CFSTR("MACH_SEND_TOO_LARGE");
      break;
    case 268435471:
      result = CFSTR("MACH_SEND_INVALID_TYPE");
      break;
    case 268435472:
      result = CFSTR("MACH_SEND_INVALID_HEADER");
      break;
    case 268435473:
      result = CFSTR("MACH_SEND_INVALID_TRAILER");
      break;
    case 268435477:
      result = CFSTR("MACH_SEND_INVALID_RT_OOL_SIZE");
      break;
    default:
      switch(a3)
      {
        case 268451841:
          result = CFSTR("MACH_RCV_IN_PROGRESS");
          break;
        case 268451842:
        case 268451844:
        case 268451856:
          goto LABEL_21;
        case 268451843:
          result = CFSTR("MACH_RCV_TIMED_OUT");
          break;
        case 268451845:
          result = CFSTR("MACH_RCV_INTERRUPTED");
          break;
        case 268451846:
          result = CFSTR("MACH_RCV_PORT_CHANGED");
          break;
        case 268451847:
          result = CFSTR("MACH_RCV_INVALID_NOTIFY");
          break;
        case 268451848:
          result = CFSTR("MACH_RCV_INVALID_DATA");
          break;
        case 268451849:
          result = CFSTR("MACH_RCV_PORT_DIED");
          break;
        case 268451850:
          result = CFSTR("MACH_RCV_IN_SET");
          break;
        case 268451851:
          result = CFSTR("MACH_RCV_HEADER_ERROR");
          break;
        case 268451852:
          result = CFSTR("MACH_RCV_BODY_ERROR");
          break;
        case 268451853:
          result = CFSTR("MACH_RCV_INVALID_TYPE");
          break;
        case 268451854:
          result = CFSTR("MACH_RCV_SCATTER_SMALL");
          break;
        case 268451855:
          result = CFSTR("MACH_RCV_INVALID_TRAILER");
          break;
        case 268451857:
          result = CFSTR("MACH_RCV_IN_PROGRESS_TIMED");
          break;
        default:
          if (a3 != 15872)
            goto LABEL_21;
          result = CFSTR("MACH_MSG_MASK");
          break;
      }
      break;
  }
  return result;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)portDeathHandler
{
  return self->_portDeathHandler;
}

- (__CFMachPort)serverPort
{
  return self->_serverPort;
}

- (float)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(float)a3
{
  self->_timeout = a3;
}

- (NSMutableArray)postConnectionTasks
{
  return self->_postConnectionTasks;
}

- (void)setPostConnectionTasks:(id)a3
{
  objc_storeStrong((id *)&self->_postConnectionTasks, a3);
}

- (AXAccessQueue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionQueue, a3);
}

- (BOOL)shouldRegisterCallbackSourceOnMainRunloop
{
  return self->shouldRegisterCallbackSourceOnMainRunloop;
}

- (void)setShouldRegisterCallbackSourceOnMainRunloop:(BOOL)a3
{
  self->shouldRegisterCallbackSourceOnMainRunloop = a3;
}

- (BOOL)usesPerPidLookup
{
  return self->_usesPerPidLookup;
}

- (void)setUsesPerPidLookup:(BOOL)a3
{
  self->_usesPerPidLookup = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_postConnectionTasks, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_outstandingAsyncRequests, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong(&self->_portDeathHandler, 0);
}

void __35__AXIPCClient_setClientIdentifier___block_invoke_cold_1(uint64_t a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(*(_QWORD *)a1 + 40);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = *a2;
  OUTLINED_FUNCTION_0_6(&dword_18C62B000, (uint64_t)a2, a3, "Why are you setting the client identifier twice? Old: %{public}@, New: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_5();
}

- (void)_sendRegistrationMessageWithRetries:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_6(&dword_18C62B000, a2, a3, "Exhausted registration attempts for %{public}@: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_5();
}

@end

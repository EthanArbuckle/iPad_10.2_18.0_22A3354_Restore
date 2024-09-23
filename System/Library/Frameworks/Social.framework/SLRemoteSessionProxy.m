@implementation SLRemoteSessionProxy

- (id)initForRemoteServiceName:(id)a3 remoteInterface:(id)a4
{
  id v7;
  id v8;
  SLRemoteSessionProxy *v9;
  SLRemoteSessionProxy *v10;
  NSMutableArray *v11;
  NSMutableArray *guaranteedRemoteCalls;
  NSLock *v13;
  NSLock *guaranteedRemoteCallsLock;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SLRemoteSessionProxy;
  v9 = -[SLRemoteSessionProxy init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceName, a3);
    objc_storeStrong((id *)&v10->_remoteInterface, a4);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    guaranteedRemoteCalls = v10->_guaranteedRemoteCalls;
    v10->_guaranteedRemoteCalls = v11;

    v13 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    guaranteedRemoteCallsLock = v10->_guaranteedRemoteCallsLock;
    v10->_guaranteedRemoteCallsLock = v13;

  }
  return v10;
}

- (void)dealloc
{
  NSMutableArray *guaranteedRemoteCalls;
  objc_super v4;

  -[SLRemoteSessionProxy disconnect](self, "disconnect");
  -[NSLock lock](self->_guaranteedRemoteCallsLock, "lock");
  guaranteedRemoteCalls = self->_guaranteedRemoteCalls;
  self->_guaranteedRemoteCalls = 0;

  -[NSLock unlock](self->_guaranteedRemoteCallsLock, "unlock");
  v4.receiver = self;
  v4.super_class = (Class)SLRemoteSessionProxy;
  -[SLRemoteSessionProxy dealloc](&v4, sel_dealloc);
}

- (void)_setupConnection
{
  uint64_t v2;
  NSXPCConnection *v4;
  NSXPCConnection *connection;
  Protocol *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  Protocol *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id remoteProxy;
  NSString *serviceName;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id location;

  -[SLRemoteSessionProxy disconnect](self, "disconnect");
  serviceName = self->_serviceName;
  _SLLog(v2, 7, CFSTR("Setting up connection to remote session at %@"));
  v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", self->_serviceName, serviceName);
  connection = self->_connection;
  self->_connection = v4;

  -[NSXPCInterface protocol](self->_remoteInterface, "protocol");
  v6 = (Protocol *)objc_claimAutoreleasedReturnValue();
  NSStringFromProtocol(v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v2, 7, CFSTR("Proxy is expecting remote interface %@"));

  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", self->_remoteInterface, v22);
  -[SLRemoteSessionProxy exportedObject](self, "exportedObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SLRemoteSessionProxy exportedInterface](self, "exportedInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[SLRemoteSessionProxy exportedInterface](self, "exportedInterface");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "protocol");
      v11 = (Protocol *)objc_claimAutoreleasedReturnValue();
      NSStringFromProtocol(v11);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      _SLLog(v2, 7, CFSTR("Exporting client session with advertised interface %@"));

      -[SLRemoteSessionProxy exportedObject](self, "exportedObject", v23);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLRemoteSessionProxy exportedInterface](self, "exportedInterface");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "protocol");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v12, "conformsToProtocol:", v14);

      if ((v15 & 1) == 0)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The provided client does not conform to the client protocol specified by the service."));
      -[SLRemoteSessionProxy exportedObject](self, "exportedObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", v16);

      -[SLRemoteSessionProxy exportedInterface](self, "exportedInterface");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", v17);

    }
  }
  objc_initWeak(&location, self);
  v18 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __40__SLRemoteSessionProxy__setupConnection__block_invoke;
  v26[3] = &unk_1E7590740;
  objc_copyWeak(&v27, &location);
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v26);
  v24[0] = v18;
  v24[1] = 3221225472;
  v24[2] = __40__SLRemoteSessionProxy__setupConnection__block_invoke_2;
  v24[3] = &unk_1E7590740;
  objc_copyWeak(&v25, &location);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v24);
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  remoteProxy = self->_remoteProxy;
  self->_remoteProxy = v19;

  -[NSXPCConnection resume](self->_connection, "resume");
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __40__SLRemoteSessionProxy__setupConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_remoteSessionConnectionWasInterrupted");

}

void __40__SLRemoteSessionProxy__setupConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    _SLLog(v1, 3, CFSTR("The connection to %@ was invalidated."));
    WeakRetained = v3;
  }

}

void __40__SLRemoteSessionProxy__setupConnection__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  objc_msgSend(a2, "localizedDescription");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  _SLLog(v2, 3, CFSTR("Remote proxy hit an error: %@"));

}

- (void)disconnect
{
  uint64_t v2;

  if (self->_connection)
  {
    _SLLog(v2, 7, CFSTR("Client is invalidating its remote connection."));
    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
}

- (void)_remoteSessionConnectionWasInterrupted
{
  uint64_t v2;
  id v4;
  void *v5;
  void *v6;
  void (**v7)(void);
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void (**v16)(void);
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  _SLLog(v2, 3, CFSTR("Connection to remote session was interrupted! Reconnecting..."));
  v4 = self->_remoteProxy;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_22_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLRemoteSessionProxy connectionResetBlock](self, "connectionResetBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    _SLLog(v2, 7, CFSTR("Executing connection reset block."));
    -[SLRemoteSessionProxy connectionResetBlock](self, "connectionResetBlock");
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v7[2]();

  }
  -[NSLock lock](self->_guaranteedRemoteCallsLock, "lock");
  v8 = (void *)-[NSMutableArray copy](self->_guaranteedRemoteCalls, "copy");
  -[NSLock unlock](self->_guaranteedRemoteCallsLock, "unlock");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
        _SLLog(v2, 7, CFSTR("Processing guranteed remote call."));
        objc_msgSend(v14, "proxy", (_QWORD)v17);
        v15 = (id)objc_claimAutoreleasedReturnValue();

        if (v15 == v4)
        {
          objc_msgSend(v14, "setProxy:", v5);
          objc_msgSend(v14, "block");
          v16 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v16[2]();

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

}

void __62__SLRemoteSessionProxy__remoteSessionConnectionWasInterrupted__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  objc_msgSend(a2, "localizedDescription");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  _SLLog(v2, 3, CFSTR("Remote proxy hit an error: %@"));

}

- (id)methodSignatureForSelector:(SEL)a3
{
  id remoteProxy;

  if (!self->_connection)
    -[SLRemoteSessionProxy _setupConnection](self, "_setupConnection");
  remoteProxy = self->_remoteProxy;
  if (!remoteProxy)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("SLRemoteSessionProxy: Cannot obtain method signature without a remote proxy"));
    remoteProxy = self->_remoteProxy;
  }
  return (id)objc_msgSend(remoteProxy, "methodSignatureForSelector:", a3);
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v3;
  void *v5;
  id remoteProxy;
  id v7;

  v7 = a3;
  if (!self->_connection)
    -[SLRemoteSessionProxy _setupConnection](self, "_setupConnection");
  if (!self->_remoteProxy)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("SLRemoteSessionProxy: Cannot forward invocation to nil proxy"));
  NSStringFromSelector((SEL)objc_msgSend(v7, "selector"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  remoteProxy = self->_remoteProxy;
  _SLLog(v3, 7, CFSTR("SLRemoteSessionProxy is forwarding invocation of %@ to %@"));

  objc_msgSend(v7, "invokeWithTarget:", self->_remoteProxy, v5, remoteProxy);
}

- (void)registerGuaranteedRemoteCall:(id)a3
{
  uint64_t v3;
  id v5;

  v5 = a3;
  _SLLog(v3, 7, CFSTR("Registering guaranteed remote call %@"));
  objc_msgSend(v5, "setProxy:", self->_remoteProxy, v5);
  -[NSLock lock](self->_guaranteedRemoteCallsLock, "lock");
  -[NSMutableArray addObject:](self->_guaranteedRemoteCalls, "addObject:", v5);

  -[NSLock unlock](self->_guaranteedRemoteCallsLock, "unlock");
}

- (void)dropGuaraneteedRemoteCall:(id)a3
{
  uint64_t v3;
  id v5;

  v5 = a3;
  _SLLog(v3, 7, CFSTR("No longer tracking guaranteed remote call %@"));
  -[NSLock lock](self->_guaranteedRemoteCallsLock, "lock", v5);
  -[NSMutableArray removeObject:](self->_guaranteedRemoteCalls, "removeObject:", v5);

  -[NSLock unlock](self->_guaranteedRemoteCallsLock, "unlock");
}

- (NSObject)exportedObject
{
  return objc_loadWeakRetained((id *)&self->_exportedObject);
}

- (void)setExportedObject:(id)a3
{
  objc_storeWeak((id *)&self->_exportedObject, a3);
}

- (NSXPCInterface)exportedInterface
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 64, 1);
}

- (void)setExportedInterface:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (id)connectionResetBlock
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setConnectionResetBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_connectionResetBlock, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_destroyWeak((id *)&self->_exportedObject);
  objc_storeStrong((id *)&self->_guaranteedRemoteCallsLock, 0);
  objc_storeStrong((id *)&self->_guaranteedRemoteCalls, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_remoteProxy, 0);
  objc_storeStrong((id *)&self->_remoteInterface, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end

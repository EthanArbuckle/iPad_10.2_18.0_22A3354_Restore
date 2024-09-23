@implementation NIServerConnection

- (NIServerConnection)initWithSessionID:(id)a3 queue:(id)a4 exportedObject:(id)a5 options:(unint64_t)a6
{
  id v12;
  id v13;
  id v14;
  NIServerConnection *v15;
  NIServerConnection *v16;
  os_log_t v17;
  OS_os_log *log;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  const __CFString *v25;
  uint64_t v26;
  NSXPCConnection *connection;
  NSXPCConnection *v28;
  void *v29;
  NSXPCConnection *v30;
  void *v31;
  void *v33;
  objc_super v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerConnection.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionID"));

  }
  v34.receiver = self;
  v34.super_class = (Class)NIServerConnection;
  v15 = -[NIServerConnection init](&v34, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sessionID, a3);
    objc_storeStrong((id *)&v16->_queue, a4);
    v16->_options = a6;
    v17 = os_log_create("com.apple.NearbyInteraction", "NIServerConnection");
    log = v16->_log;
    v16->_log = (OS_os_log *)v17;

    if (+[NIServerConnection _internalBuildShouldDenyConnection](NIServerConnection, "_internalBuildShouldDenyConnection"))
    {
      if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
      {
        v19 = v16->_log;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = (void *)MEMORY[0x1E0CB3898];
          v21 = v19;
          objc_msgSend(v20, "processInfo");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "processName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v36 = v23;
          _os_log_impl(&dword_1A0337000, v21, OS_LOG_TYPE_DEFAULT, "Deny connection: %@", buf, 0xCu);

        }
      }
    }
    else
    {
      v24 = objc_alloc(MEMORY[0x1E0CB3B38]);
      if ((a6 & 1) != 0)
        v25 = CFSTR("com.apple.nearbyd.xpc.nearbyinteraction.observer");
      else
        v25 = CFSTR("com.apple.nearbyd.xpc.nearbyinteraction");
      v26 = objc_msgSend(v24, "initWithMachServiceName:options:", v25, 4096);
      connection = v16->_connection;
      v16->_connection = (NSXPCConnection *)v26;

      v28 = v16->_connection;
      UWBMakeSessionDelegateXPCInterface();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setExportedInterface:](v28, "setExportedInterface:", v29);

      if (v14)
        -[NSXPCConnection setExportedObject:](v16->_connection, "setExportedObject:", v14);
      v30 = v16->_connection;
      UWBMakeSessionServerXPCInterface();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](v30, "setRemoteObjectInterface:", v31);

      -[NSXPCConnection _setQueue:](v16->_connection, "_setQueue:", v13);
    }
  }

  return v16;
}

- (void)dealloc
{
  objc_super v3;

  -[NIServerConnection invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)NIServerConnection;
  -[NIServerConnection dealloc](&v3, sel_dealloc);
}

- (id)remoteObjectProxy
{
  NSXPCConnection *connection;
  _QWORD v4[5];

  connection = self->_connection;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__NIServerConnection_remoteObjectProxy__block_invoke;
  v4[3] = &unk_1E4362B38;
  v4[4] = self;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __39__NIServerConnection_remoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __39__NIServerConnection_remoteObjectProxy__block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

}

- (id)synchronousRemoteObjectProxy
{
  NSXPCConnection *connection;
  _QWORD v4[5];

  connection = self->_connection;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__NIServerConnection_synchronousRemoteObjectProxy__block_invoke;
  v4[3] = &unk_1E4362B38;
  v4[4] = self;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __50__NIServerConnection_synchronousRemoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __50__NIServerConnection_synchronousRemoteObjectProxy__block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

}

- (id)interruptionHandler
{
  return -[NSXPCConnection interruptionHandler](self->_connection, "interruptionHandler");
}

- (id)invalidationHandler
{
  return -[NSXPCConnection invalidationHandler](self->_connection, "invalidationHandler");
}

- (void)setInterruptionHandler:(id)a3
{
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", a3);
}

- (void)setInvalidationHandler:(id)a3
{
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", a3);
}

- (void)resume
{
  -[NSXPCConnection resume](self->_connection, "resume");
}

- (void)invalidate
{
  NSXPCConnection *connection;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditTokenForConnection
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_connection;
  if (result)
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)-[$115C4C562B26FF47E01F9F4EA65B5887 auditToken](result, "auditToken");
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

+ (id)createOneShotConnectionAndResume:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  dispatch_queue_t v5;
  NIServerConnection *v6;
  void *v7;
  NIServerConnection *v8;

  v3 = a3;
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_queue_create("com.apple.NearbyInteraction", v4);
  v6 = [NIServerConnection alloc];
  v7 = (void *)objc_opt_new();
  v8 = -[NIServerConnection initWithSessionID:queue:exportedObject:options:](v6, "initWithSessionID:queue:exportedObject:options:", v7, v5, 0, 0);

  if (v3)
    -[NIServerConnection resume](v8, "resume");

  return v8;
}

+ (BOOL)_internalBuildShouldDenyConnection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR(".GlobalPreferences"));
    objc_msgSend(v2, "objectForKey:", CFSTR("com.apple.NearbyInteraction.ConnectionAllowList"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "processName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v3, "containsObject:", v5) ^ 1;
    }
    else
    {
      objc_msgSend(v2, "objectForKey:", CFSTR("com.apple.NearbyInteraction.ConnectionDenyList"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        LOBYTE(v6) = 0;
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "processName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v6) = objc_msgSend(v4, "containsObject:", v7);

    }
LABEL_11:

    return v6;
  }
  LOBYTE(v6) = 0;
  return v6;
}

- (NSUUID)sessionID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (id)exportedObject
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setExportedObject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __39__NIServerConnection_remoteObjectProxy__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A0337000, a2, a3, "Remote object error: %@", a5, a6, a7, a8, 2u);
}

void __50__NIServerConnection_synchronousRemoteObjectProxy__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A0337000, a2, a3, "Synchronous remote object error: %@", a5, a6, a7, a8, 2u);
}

@end

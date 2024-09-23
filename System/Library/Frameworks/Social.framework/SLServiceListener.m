@implementation SLServiceListener

- (SLServiceListener)initWithExportedSessionClass:(Class)a3 serviceProtocol:(id)a4
{
  uint64_t v4;
  id v8;
  SLServiceListener *v9;
  uint64_t v10;
  NSXPCListener *listener;
  objc_super v13;

  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SLServiceListener;
  v9 = -[SLServiceListener init](&v13, sel_init);
  if (v9)
  {
    _SLLog(v4, 7, CFSTR("Initializing listener for session class: %@"));
    v9->_sessionClass = a3;
    objc_storeStrong((id *)&v9->_serviceProtocol, a4);
    objc_msgSend(MEMORY[0x1E0CB3B58], "serviceListener", a3);
    v10 = objc_claimAutoreleasedReturnValue();
    listener = v9->_listener;
    v9->_listener = (NSXPCListener *)v10;

    -[NSXPCListener setDelegate:](v9->_listener, "setDelegate:", v9);
  }

  return v9;
}

- (void)restrictToClientsWithEntitlements:(id)a3
{
  objc_storeStrong((id *)&self->_allowedEntitlements, a3);
}

- (void)beginAcceptingConnections
{
  uint64_t v2;
  void *v4;
  __int128 v5;
  NSXPCListener *listener;

  -[SLServiceListener serviceName](self, "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  listener = self->_listener;
  v5 = *(_OWORD *)&self->_sessionClass;
  _SLLog(v2, 5, CFSTR("Service with type %@ session class %@ and protocol %@ is accepting connections at listener %@"));

  objc_msgSend(MEMORY[0x1E0CB3B58], "enableTransactions", v4, v5, listener);
  -[NSXPCListener resume](self->_listener, "resume");
}

- (BOOL)_verifyAuthorizationForConnection:(id)a3
{
  uint64_t v3;
  id v5;
  NSArray *allowedEntitlements;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  allowedEntitlements = self->_allowedEntitlements;
  if (allowedEntitlements)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = allowedEntitlements;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          if (objc_msgSend(v5, "sl_clientHasEntitlement:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i)))
          {
            _SLLog(v3, 7, CFSTR("Client has required entitlement %@"));
            v12 = 1;
            goto LABEL_12;
          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          continue;
        break;
      }
    }
    v12 = 0;
LABEL_12:

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v4;
  id v6;
  BOOL v7;
  NSString *v8;
  NSString *v9;
  SLDatabase *v10;
  Class sessionClass;
  void *v12;
  SLDatabase *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  Protocol *v18;
  void *v19;
  NSXPCInterface *clientInterface;
  Protocol *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  Class v27;
  NSString *v28;

  v6 = a4;
  v7 = -[SLServiceListener _verifyAuthorizationForConnection:](self, "_verifyAuthorizationForConnection:", v6);
  if (v7)
  {
    v8 = self->_persistentStoreName;
    v9 = self->_managedObjectModelPath;
    -[SLServiceListener serviceName](self, "serviceName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _SLLog(v4, 7, CFSTR("Service %@ wants persistent store named %@ matching MOM at %@"));

    v10 = 0;
    if (v8 && v9)
      v10 = -[SLDatabase initWithStoreName:modelPath:]([SLDatabase alloc], "initWithStoreName:modelPath:", v8, v9, v23, v8, v9);
    v28 = v9;
    sessionClass = self->_sessionClass;
    -[SLServiceListener serviceName](self, "serviceName", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = self->_sessionClass;
    _SLLog(v4, 7, CFSTR("Service %@ is expecting the remote session to be of class %@"));

    if ((-[objc_class isSubclassOfClass:](sessionClass, "isSubclassOfClass:", objc_opt_class(), v24, v27) & 1) == 0)
    {
      v12 = (void *)MEMORY[0x1E0C99DA0];
      v13 = v10;
      v14 = *MEMORY[0x1E0C99768];
      NSStringFromClass(self->_sessionClass);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v14;
      v10 = v13;
      objc_msgSend(v12, "raise:format:", v16, CFSTR("%@ is not a subclass of SLRemoteSession"), v15);

    }
    v17 = (void *)objc_msgSend([sessionClass alloc], "initWithConnection:database:", v6, v10);
    _SLLog(v4, 5, CFSTR("New remote session: %@"));
    v18 = self->_serviceProtocol;
    NSStringFromProtocol(v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _SLLog(v4, 7, CFSTR("Expecting remote session to conform to %@"));

    if ((objc_msgSend(v17, "conformsToProtocol:", v18, v25) & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The remote session does not conform to the required protocol."));
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setExportedInterface:", v19);

    objc_msgSend(v6, "setExportedObject:", v17);
    clientInterface = self->_clientInterface;
    if (clientInterface)
    {
      -[NSXPCInterface protocol](clientInterface, "protocol");
      v21 = (Protocol *)objc_claimAutoreleasedReturnValue();
      NSStringFromProtocol(v21);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      _SLLog(v4, 7, CFSTR("Expecting client session to conform to %@"));

      objc_msgSend(v6, "setRemoteObjectInterface:", self->_clientInterface, v26);
    }
    objc_msgSend(v6, "resume");

  }
  else
  {
    objc_msgSend(v6, "sl_localizedClientName");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    _SLLog(v4, 3, CFSTR("Denying client %@ because it lacks the proper entitlement to connect"));
  }

  return v7;
}

- (NSString)serviceName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSXPCInterface)clientInterface
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 24, 1);
}

- (void)setClientInterface:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)persistentStoreName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPersistentStoreName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)managedObjectModelPath
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setManagedObjectModelPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_allowedEntitlements, 0);
  objc_storeStrong((id *)&self->_managedObjectModelPath, 0);
  objc_storeStrong((id *)&self->_persistentStoreName, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_clientInterface, 0);
  objc_storeStrong((id *)&self->_serviceProtocol, 0);
}

@end

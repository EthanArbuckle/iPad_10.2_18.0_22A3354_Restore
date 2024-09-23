@implementation IDSDaemonProtocolController

- (IDSDaemonProtocolController)init
{
  NSObject *v3;
  IDSDaemonProtocolController *v4;
  objc_super v6;

  if (_IDSRunningInDaemon())
  {
    +[IDSLogging DaemonProxy](IDSLogging, "DaemonProxy");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_1907E7DEC((uint64_t)self, v3);

    v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)IDSDaemonProtocolController;
    self = -[IDSDaemonProtocolController init](&v6, sel_init);
    v4 = self;
  }

  return v4;
}

- (IDSGroupContextNotifyingObserver)observer
{
  return self->_observer;
}

+ (id)sharedInstance
{
  if (qword_1ECDD6730 != -1)
    dispatch_once(&qword_1ECDD6730, &unk_1E2C5FA30);
  return (id)qword_1ECDD66F0;
}

- (NSXPCConnection)connection
{
  IDSDaemonProtocolController *v2;
  NSXPCConnection *connection;
  uint64_t v4;
  NSXPCConnection *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  IDSGroupContextNotifyingObserver *v10;
  IDSGroupContextNotifyingObserver *observer;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSXPCConnection *v16;
  _QWORD v18[4];
  id v19;
  _BYTE buf[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  connection = v2->_connection;
  if (!connection)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.identityservicesd.nsxpc.auth"), 4096);
    v5 = v2->_connection;
    v2->_connection = (NSXPCConnection *)v4;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE20A018);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_fetchAllKnownGroups_, 0, 1);

    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v6);
    v10 = objc_alloc_init(IDSGroupContextNotifyingObserver);
    observer = v2->_observer;
    v2->_observer = v10;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE1EE270);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v2->_connection, "setExportedInterface:", v12);

    -[IDSDaemonProtocolController observer](v2, "observer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedObject:](v2->_connection, "setExportedObject:", v13);

    +[IDSLogging DaemonProxy](IDSLogging, "DaemonProxy");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[IDSDaemonProtocolController observer](v2, "observer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v15;
      _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "Client has set export object %@", buf, 0xCu);

    }
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v2);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_19074F7E0;
    v18[3] = &unk_1E2C60B88;
    objc_copyWeak(&v19, (id *)buf);
    -[NSXPCConnection setInvalidationHandler:](v2->_connection, "setInvalidationHandler:", v18);
    -[NSXPCConnection setInterruptionHandler:](v2->_connection, "setInterruptionHandler:", &unk_1E2C62BE0);
    -[NSXPCConnection resume](v2->_connection, "resume");
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);

    connection = v2->_connection;
  }
  v16 = connection;
  objc_sync_exit(v2);

  return v16;
}

- (void)setConnection:(id)a3
{
  NSXPCConnection *v4;
  NSXPCConnection *connection;
  IDSDaemonProtocolController *obj;

  v4 = (NSXPCConnection *)a3;
  obj = self;
  objc_sync_enter(obj);
  connection = obj->_connection;
  obj->_connection = v4;

  objc_sync_exit(obj);
}

- (IDSGroupContextDataSourceDaemonProtocol)groupContextDataSource
{
  void *v2;
  void *v3;

  -[IDSDaemonProtocolController connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IDSGroupContextDataSourceDaemonProtocol *)v3;
}

- (IDSGroupContextCacheMiddlewareDaemonProtocol)groupContextCacheMiddleware
{
  void *v2;
  void *v3;

  -[IDSDaemonProtocolController connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IDSGroupContextCacheMiddlewareDaemonProtocol *)v3;
}

- (void)setObserver:(id)a3
{
  objc_storeStrong((id *)&self->_observer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end

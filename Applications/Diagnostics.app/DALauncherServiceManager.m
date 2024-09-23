@implementation DALauncherServiceManager

+ (id)sharedInstance
{
  if (qword_10016E910 != -1)
    dispatch_once(&qword_10016E910, &stru_100133988);
  return (id)qword_10016E908;
}

- (DALauncherServiceManager)init
{
  DALauncherServiceManager *v2;
  NSMutableSet *v3;
  NSMutableSet *remoteClients;
  NSXPCListener *listener;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DALauncherServiceManager;
  v2 = -[DALauncherServiceManager init](&v7, "init");
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    remoteClients = v2->_remoteClients;
    v2->_remoteClients = v3;

    listener = v2->_listener;
    v2->_listener = 0;

    -[DALauncherServiceManager initListener](v2, "initListener");
  }
  return v2;
}

- (void)informExitingForReason:(int64_t)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DALauncherServiceManager remoteClients](self, "remoteClients", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "diagnosticsExitingForReason:", a3);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DALauncherServiceManager remoteClients](self, "remoteClients"));
  objc_msgSend(v10, "removeAllObjects");

}

- (void)initListener
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.diagnostics.launcher-service"));
  -[DALauncherServiceManager setListener:](self, "setListener:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DALauncherServiceManager listener](self, "listener"));
  objc_msgSend(v4, "setDelegate:", self);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[DALauncherServiceManager listener](self, "listener"));
  objc_msgSend(v5, "resume");

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  _QWORD v22[5];
  id v23;
  id location;
  uint8_t v25[4];
  id v26;
  __int128 buf;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v7 = a4;
  v8 = DiagnosticLogHandleForCategory(8);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "New connection %@ requested for remote runner service", (uint8_t *)&buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.diagnostics.launcher-service")));
  v11 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0 && objc_msgSend(v10, "BOOLValue"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___DADiagnosticsLauncherServerProtocol));
    objc_msgSend(v7, "setExportedObject:", self);
    objc_msgSend(v7, "setExportedInterface:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___DADiagnosticsLauncherClientProtocol));
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v28 = 0x3032000000;
    v29 = sub_100024E9C;
    v30 = sub_100024EAC;
    v31 = 0;
    objc_initWeak(&location, v7);
    objc_msgSend(v7, "setRemoteObjectInterface:", v13);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100024EB4;
    v22[3] = &unk_100133548;
    v22[4] = &buf;
    objc_copyWeak(&v23, &location);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v22));
    if (v14 && !*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[DALauncherServiceManager remoteClients](self, "remoteClients"));
      objc_msgSend(v18, "addObject:", v14);

      objc_msgSend(v7, "resume");
      v19 = DiagnosticLogHandleForCategory(8);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v25 = 138412290;
        v26 = v7;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Connection %@ established with launcher service", v25, 0xCu);
      }

      v15 = 1;
    }
    else
    {
      v15 = 0;
    }

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    v16 = DiagnosticLogHandleForCategory(8);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1000EB6C8((uint64_t)v7, v17);

    objc_msgSend(v7, "invalidate");
    v15 = 0;
  }

  return v15;
}

- (void)ping:(id)a3
{
  void (**v3)(_QWORD);
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = (void (**)(_QWORD))a3;
  v4 = DiagnosticLogHandleForCategory(8);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Launcher service from iOSDiagnostics is pinging to see if we are alive", v6, 2u);
  }

  v3[2](v3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (NSMutableSet)remoteClients
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRemoteClients:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteClients, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end

@implementation CBShellServer

+ (id)sharedInstance
{
  if (qword_10008BDF8 != -1)
    dispatch_once(&qword_10008BDF8, &stru_100076230);
  return (id)qword_10008BDF0;
}

- (CBShellServer)init
{
  CBShellServer *v2;
  id v3;
  NSXPCListener *v4;
  NSXPCListener *listener;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CBShellServer;
  v2 = -[CBShellServer init](&v7, "init");
  if (v2)
  {
    v3 = objc_alloc((Class)NSXPCListener);
    v4 = (NSXPCListener *)objc_msgSend(v3, "initWithMachServiceName:", kCheckerBoardRemoteServerMachName);
    listener = v2->_listener;
    v2->_listener = v4;

  }
  return v2;
}

- (void)start
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBShellServer listener](self, "listener"));
  objc_msgSend(v3, "setDelegate:", self);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CBShellServer listener](self, "listener"));
  objc_msgSend(v4, "resume");

}

- (void)createAlert:(id)a3 timeout:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[CBShellServer remoteAlertsDelegate](self, "remoteAlertsDelegate"));
  objc_msgSend(v10, "server:createAlert:timeout:completion:", self, v9, v8, (double)a4);

}

- (void)receiveResponseFromAlertWithIdentifier:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[CBShellServer remoteAlertsDelegate](self, "remoteAlertsDelegate"));
  objc_msgSend(v10, "server:receiveResponseFromAlertWithIdentifier:timeout:completion:", self, v9, v8, a4);

}

- (void)exitCheckerBoard
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002DEF8;
  block[3] = &unk_1000753E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)proxyServerWithCompletion:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  id v6;

  v4 = (void (**)(id, id))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBShellServer systemServicesDelegate](self, "systemServicesDelegate"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "proxyServer"));

  v4[2](v4, v6);
}

- (void)showSceneStatusBar
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CBShellServer systemServicesDelegate](self, "systemServicesDelegate"));
  objc_msgSend(v2, "showSceneStatusBar");

}

- (void)hideSceneStatusBar
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CBShellServer systemServicesDelegate](self, "systemServicesDelegate"));
  objc_msgSend(v2, "hideSceneStatusBar");

}

- (void)statusBarStyle:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CBShellServer systemServicesDelegate](self, "systemServicesDelegate"));
  objc_msgSend(v4, "statusBarStyle:", a3);

}

- (void)dimDisplay
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CBShellServer systemServicesDelegate](self, "systemServicesDelegate"));
  objc_msgSend(v2, "dimDisplay");

}

- (void)undimDisplay
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CBShellServer systemServicesDelegate](self, "systemServicesDelegate"));
  objc_msgSend(v2, "undimDisplay");

}

- (void)enableTouchButtonEvents
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CBShellServer systemServicesDelegate](self, "systemServicesDelegate"));
  objc_msgSend(v2, "enableTouchButtonEvents");

}

- (void)disableTouchButtonEvents
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CBShellServer systemServicesDelegate](self, "systemServicesDelegate"));
  objc_msgSend(v2, "disableTouchButtonEvents");

}

- (void)disableNetworkReconnect
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CBShellServer systemServicesDelegate](self, "systemServicesDelegate"));
  objc_msgSend(v2, "disableNetworkReconnect");

}

- (void)enableNetworkReconnect
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CBShellServer systemServicesDelegate](self, "systemServicesDelegate"));
  objc_msgSend(v2, "enableNetworkReconnect");

}

- (void)addShutdownTask:(id)a3 forReason:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CBShellServer systemServicesDelegate](self, "systemServicesDelegate"));
  objc_msgSend(v8, "addShutdownTask:forReason:", v7, v6);

}

- (void)removeShutdownTask:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CBShellServer systemServicesDelegate](self, "systemServicesDelegate"));
  objc_msgSend(v5, "removeShutdownTask:", v4);

}

- (void)launchDiagnostics
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10002E278;
  v2[3] = &unk_100075510;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)diagnosticsRunning:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CBShellServer systemServicesDelegate](self, "systemServicesDelegate"));
  objc_msgSend(v5, "diagnosticsRunning:", v4);

}

- (void)connectToSSID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v11[16];

  v6 = a3;
  v7 = a4;
  if (+[CBUtilities isInternalInstall](CBUtilities, "isInternalInstall"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBShellServer systemServicesDelegate](self, "systemServicesDelegate"));
    objc_msgSend(v8, "connectToSSID:completion:", v6, v7);

  }
  else
  {
    v9 = CheckerBoardLogHandleForCategory(5);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "This function is not available on customer install", v11, 2u);
    }

    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)connectToSSID:(id)a3 password:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t v14[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (+[CBUtilities isInternalInstall](CBUtilities, "isInternalInstall"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBShellServer systemServicesDelegate](self, "systemServicesDelegate"));
    objc_msgSend(v11, "connectToSSID:password:completion:", v8, v9, v10);

  }
  else
  {
    v12 = CheckerBoardLogHandleForCategory(5);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "This function is not available on customer install", v14, 2u);
    }

    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

- (void)networkScanWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  uint8_t buf[16];

  v4 = a3;
  if (+[CBUtilities isInternalInstall](CBUtilities, "isInternalInstall"))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[CBShellServer systemServicesDelegate](self, "systemServicesDelegate"));
    objc_msgSend(v7, "networkScanWithCompletion:", v4);

  }
  else
  {
    v5 = CheckerBoardLogHandleForCategory(5);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "This function is not available on customer install", buf, 2u);
    }

    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }
}

- (void)connectedNetwork:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  uint8_t buf[16];

  v4 = a3;
  if (+[CBUtilities isInternalInstall](CBUtilities, "isInternalInstall"))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[CBShellServer systemServicesDelegate](self, "systemServicesDelegate"));
    objc_msgSend(v7, "connectedNetwork:", v4);

  }
  else
  {
    v5 = CheckerBoardLogHandleForCategory(5);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "This function is not available on customer install", buf, 2u);
    }

    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }
}

- (void)displayDimmed:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CBShellServer systemServicesDelegate](self, "systemServicesDelegate"));
  objc_msgSend(v5, "displayDimmed:", v4);

}

- (void)networkReconnectEnabled:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CBShellServer systemServicesDelegate](self, "systemServicesDelegate"));
  objc_msgSend(v5, "networkReconnectEnabled:", v4);

}

- (void)currentLocaleIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CBShellServer systemServicesDelegate](self, "systemServicesDelegate"));
  objc_msgSend(v5, "currentLocaleIdentifier:", v4);

}

- (void)setLocaleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CBShellServer systemServicesDelegate](self, "systemServicesDelegate"));
  objc_msgSend(v8, "setLocaleIdentifier:completion:", v7, v6);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v5 = a4;
  v6 = -[CBShellServer _getEntitlementLevelForConnection:](self, "_getEntitlementLevelForConnection:", v5);
  switch(v6)
  {
    case 3uLL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CBSSystemServicesProtocol));
      objc_msgSend(v5, "setExportedInterface:", v8);
      break;
    case 2uLL:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CBSRemoteAlertServerProtocol));
      objc_msgSend(v5, "setExportedInterface:", v10);

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "exportedInterface"));
      -[CBShellServer _setClassesForRemoteAlertsOnInterface:](self, "_setClassesForRemoteAlertsOnInterface:", v9);
      goto LABEL_8;
    case 1uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CBSServerProtocol));
      objc_msgSend(v5, "setExportedInterface:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "exportedInterface"));
      -[CBShellServer _setClassesForRemoteAlertsOnInterface:](self, "_setClassesForRemoteAlertsOnInterface:", v8);
      break;
    default:
      v11 = 0;
      goto LABEL_10;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "exportedInterface"));
  -[CBShellServer _setClassesForProxyServerOnInterface:](self, "_setClassesForProxyServerOnInterface:", v9);
LABEL_8:

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "resume");
  v11 = 1;
LABEL_10:

  return v11;
}

- (void)_setClassesForRemoteAlertsOnInterface:(id)a3
{
  id v3;
  uint64_t v4;
  NSSet *v5;
  id v6;

  v3 = a3;
  v5 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(CBSUIAlert, v4));
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, "createAlert:timeout:completion:", 0, 0);

}

- (void)_setClassesForProxyServerOnInterface:(id)a3
{
  id v3;
  uint64_t v4;
  NSSet *v5;
  id v6;

  v3 = a3;
  v5 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(CBSProxyServer, v4));
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, "proxyServerWithCompletion:", 0, 1);

}

- (unint64_t)_getEntitlementLevelForConnection:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  __int128 v8;
  __int128 v9;

  v4 = a3;
  v5 = v4;
  v8 = 0u;
  v9 = 0u;
  if (v4)
    objc_msgSend(v4, "auditToken", v8, v9);
  if (-[CBShellServer _auditToken:hasEntitlement:](self, "_auditToken:hasEntitlement:", &v8, kCheckerBoardServicesEntitlement))
  {
    v6 = 1;
  }
  else if (-[CBShellServer _auditToken:hasEntitlement:](self, "_auditToken:hasEntitlement:", &v8, kCheckerBoardSystemServicesEntitlement))
  {
    v6 = 3;
  }
  else if (-[CBShellServer _auditToken:hasEntitlement:](self, "_auditToken:hasEntitlement:", &v8, kCheckerBoardRemoteAlertsEntitlement))
  {
    v6 = 2;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_auditToken:(id *)a3 hasEntitlement:(id)a4
{
  void *v4;
  void *v5;
  BOOL value;

  v4 = (void *)xpc_copy_entitlement_for_token(objc_msgSend(objc_retainAutorelease(a4), "UTF8String"), a3);
  v5 = v4;
  if (v4)
    value = xpc_BOOL_get_value(v4);
  else
    value = 0;

  return value;
}

- (CBRemoteAlertServerDelegate)remoteAlertsDelegate
{
  return (CBRemoteAlertServerDelegate *)objc_loadWeakRetained((id *)&self->_remoteAlertsDelegate);
}

- (void)setRemoteAlertsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_remoteAlertsDelegate, a3);
}

- (CBSystemServicesServerDelegate)systemServicesDelegate
{
  return (CBSystemServicesServerDelegate *)objc_loadWeakRetained((id *)&self->_systemServicesDelegate);
}

- (void)setSystemServicesDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_systemServicesDelegate, a3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_systemServicesDelegate);
  objc_destroyWeak((id *)&self->_remoteAlertsDelegate);
}

@end

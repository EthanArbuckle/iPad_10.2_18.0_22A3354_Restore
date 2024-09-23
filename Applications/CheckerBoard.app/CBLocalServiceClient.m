@implementation CBLocalServiceClient

- (CBLocalServiceClient)initWithMainNavController:(id)a3
{
  id v4;
  CBLocalServiceClient *v5;
  CBLocalServiceClient *v6;
  NSXPCConnection *v7;
  NSXPCConnection *connection;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CBLocalServiceClient;
  v5 = -[CBLocalServiceClient init](&v12, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_mainNavController, v4);
    v6->_didMoveToEndgame = 0;
    v7 = (NSXPCConnection *)objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.checkerboardd"), 4096);
    connection = v6->_connection;
    v6->_connection = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CBLocalServiceInterface serverInterface](CBLocalServiceInterface, "serverInterface"));
    -[NSXPCConnection setRemoteObjectInterface:](v6->_connection, "setRemoteObjectInterface:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CBLocalServiceInterface clientInterface](CBLocalServiceInterface, "clientInterface"));
    -[NSXPCConnection setExportedInterface:](v6->_connection, "setExportedInterface:", v10);

    -[NSXPCConnection setExportedObject:](v6->_connection, "setExportedObject:", v6);
    -[NSXPCConnection setInterruptionHandler:](v6->_connection, "setInterruptionHandler:", &stru_100075F38);
    -[NSXPCConnection setInvalidationHandler:](v6->_connection, "setInvalidationHandler:", &stru_100075F58);
  }

  return v6;
}

- (void)resume
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBLocalServiceClient connection](self, "connection"));
  objc_msgSend(v3, "resume");

  -[CBLocalServiceClient _ping](self, "_ping");
}

- (void)invalidate
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBLocalServiceClient connection](self, "connection"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CBLocalServiceClient connection](self, "connection"));
    objc_msgSend(v4, "invalidate");

  }
}

- (void)_ping
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CBLocalServiceClient connection](self, "connection"));
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &stru_100075F78));

  objc_msgSend(v3, "ping:", &stru_100075F98);
}

- (void)relaunchToDiagnosticsApp
{
  -[CBLocalServiceClient setDidMoveToEndgame:](self, "setDidMoveToEndgame:", 0);
  -[CBLocalServiceClient moveToDiagnosticsAppWithcompletion:](self, "moveToDiagnosticsAppWithcompletion:", &stru_100075FB8);
}

- (void)moveToDiagnosticsAppWithcompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  void (**v14)(id, _QWORD);
  uint8_t buf[16];

  v4 = (void (**)(id, _QWORD))a3;
  v5 = CheckerBoardLogHandleForCategory(11);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Local XPC - moveToDiagnosticsApp", buf, 2u);
  }

  if (-[CBLocalServiceClient didMoveToEndgame](self, "didMoveToEndgame"))
  {
    v7 = CheckerBoardLogHandleForCategory(11);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Local XPC - already moved to Diagnostics app", buf, 2u);
    }

    v4[2](v4, 0);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBLocalServiceClient mainNavController](self, "mainNavController"));

    if (v9)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100027580;
      v13[3] = &unk_100075FE0;
      v13[4] = self;
      v14 = v4;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);

    }
    else
    {
      v10 = CheckerBoardLogHandleForCategory(11);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Local XPC - moveToDiagnosticsApp: mainNavController is nil", buf, 2u);
      }

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CheckerBoard.daemonXPCErrorDomain"), 2, 0));
      ((void (**)(id, void *))v4)[2](v4, v12);

    }
  }

}

- (void)setProxyServer:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = CheckerBoardLogHandleForCategory(11);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Local XPC - Receive proxy server info. proxyServer = %@;",
      (uint8_t *)&v15,
      0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CBUserSettings sharedInstance](CBUserSettings, "sharedInstance"));
  objc_msgSend(v9, "assignProxyServer:", v5);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CBUserSettings sharedInstance](CBUserSettings, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "proxyServer"));

  if ((objc_msgSend(v11, "isEqual:", v5) & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v13 = CheckerBoardLogHandleForCategory(11);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v11;
      v17 = 2112;
      v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Local XPC - Failed to set assignedProxyServer = %@; proxyServer = %@;",
        (uint8_t *)&v15,
        0x16u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CheckerBoard.daemonXPCErrorDomain"), 1, 0));
  }
  v6[2](v6, v12);

}

- (BOOL)didMoveToEndgame
{
  return self->_didMoveToEndgame;
}

- (void)setDidMoveToEndgame:(BOOL)a3
{
  self->_didMoveToEndgame = a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (UINavigationController)mainNavController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_mainNavController);
}

- (void)setMainNavController:(id)a3
{
  objc_storeWeak((id *)&self->_mainNavController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mainNavController);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end

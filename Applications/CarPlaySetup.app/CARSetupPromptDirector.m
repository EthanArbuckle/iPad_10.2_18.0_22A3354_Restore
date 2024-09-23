@implementation CARSetupPromptDirector

- (CARSetupPromptDirector)initWithPresenter:(id)a3
{
  id v4;
  CARSetupPromptDirector *v5;
  CARSetupPromptDirector *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CARSetupPromptDirector;
  v5 = -[CARSetupPromptDirector init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_presenter, v4);
    -[CARSetupPromptDirector _setupConnection](v6, "_setupConnection");
    -[CARSetupPromptDirector _presenterIsReady](v6, "_presenterIsReady");
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[CARSetupPromptDirector invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CARSetupPromptDirector;
  -[CARSetupPromptDirector dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CARSetupPromptDirector connection](self, "connection"));
  objc_msgSend(v3, "invalidate");

  -[CARSetupPromptDirector setConnection:](self, "setConnection:", 0);
}

- (void)presenterDidDismiss
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CARSetupLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "presenterDidDismiss", v5, 2u);
  }

  -[CARSetupPromptDirector _synchronous_servicePerform:](self, "_synchronous_servicePerform:", &stru_10000C4D8);
}

- (void)_presenterIsReady
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CARSetupLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "presenterIsReady", v5, 2u);
  }

  -[CARSetupPromptDirector _synchronous_servicePerform:](self, "_synchronous_servicePerform:", &stru_10000C538);
}

- (id)_remoteAssetProgress
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v10[5];
  uint8_t buf[8];
  uint8_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint8_t v17[4];
  uint64_t v18;

  v3 = CARSetupLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "requesting remote asset progress", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v12 = buf;
  v13 = 0x3032000000;
  v14 = sub_100006234;
  v15 = sub_100006244;
  v16 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000624C;
  v10[3] = &unk_10000C5A0;
  v10[4] = buf;
  -[CARSetupPromptDirector _servicePerform:](self, "_servicePerform:", v10);
  v5 = CARSetupLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *((_QWORD *)v12 + 5);
    *(_DWORD *)v17 = 138412290;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "remote asset progress: %@", v17, 0xCu);
  }

  v8 = *((id *)v12 + 5);
  _Block_object_dispose(buf, 8);

  return v8;
}

- (void)_setupConnection
{
  id v3;
  void *v4;
  void *v5;
  CARSetupPromptPresenterProxy *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.carkit.setupPromptDirector.service"), 4096);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CRSetupPromptDirectorService));
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CRSetupPromptPresenterService));
  objc_msgSend(v3, "setExportedInterface:", v5);
  v6 = objc_alloc_init(CARSetupPromptPresenterProxy);
  -[CARSetupPromptPresenterProxy setDirector:](v6, "setDirector:", self);
  objc_msgSend(v3, "setExportedObject:", v6);
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006534;
  v9[3] = &unk_10000C5C8;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006608;
  v7[3] = &unk_10000C5C8;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_msgSend(v3, "resume");
  -[CARSetupPromptDirector setConnection:](self, "setConnection:", v3);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)_servicePerform:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  id v6;

  v4 = (void (**)(id, id))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARSetupPromptDirector connection](self, "connection"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &stru_10000C608));

  v4[2](v4, v6);
}

- (void)_synchronous_servicePerform:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  id v6;

  v4 = (void (**)(id, id))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARSetupPromptDirector connection](self, "connection"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &stru_10000C628));

  v4[2](v4, v6);
}

- (void)_handleConnectionReset
{
  -[CARSetupPromptDirector setConnection:](self, "setConnection:", 0);
}

- (CARSetupPromptPresenting)presenter
{
  return (CARSetupPromptPresenting *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_presenter);
}

@end

@implementation SOUIDaemonConnection

+ (id)_queue
{
  if (qword_100011D90 != -1)
    dispatch_once(&qword_100011D90, &stru_10000C2A0);
  return (id)qword_100011D88;
}

- (SOUIDaemonConnection)initWithViewController:(id)a3
{
  id v5;
  SOUIDaemonConnection *v6;
  void *v7;
  SOUIDaemonConnection *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SOUIDaemonConnection;
  v6 = -[SOUIDaemonConnection init](&v19, "init");
  if (!v6)
    goto LABEL_4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "xpcDaemonEndpoint"));

  if (v7)
  {
    objc_storeStrong((id *)&v6->_viewController, a3);
    -[SOUIDaemonConnection _connectToDaemon](v6, "_connectToDaemon");
LABEL_4:
    v8 = v6;
    goto LABEL_8;
  }
  v9 = sub_100003FB0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_1000074E0(v10, v11, v12, v13, v14, v15, v16, v17);

  v8 = 0;
LABEL_8:

  return v8;
}

- (BOOL)_connectToDaemon
{
  void *v3;
  id v4;
  NSXPCListenerEndpoint *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  SOUIServiceViewController *viewController;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  BOOL v24;
  id v26;
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id location;
  uint8_t buf[4];
  SOUIDaemonConnection *v34;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOUIDaemonConnection xpcConnection](self, "xpcConnection"));

  if (v3)
  {
    v4 = sub_100003FB0();
    v5 = (NSXPCListenerEndpoint *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_DEBUG))
      sub_100007574();
LABEL_8:
    v24 = 1;
    goto LABEL_9;
  }
  v5 = objc_opt_new(NSXPCListenerEndpoint);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SOUIServiceViewController xpcDaemonEndpoint](self->_viewController, "xpcDaemonEndpoint"));
  -[NSXPCListenerEndpoint _setEndpoint:](v5, "_setEndpoint:", v6);

  v7 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithListenerEndpoint:", v5);
  -[SOUIDaemonConnection setXpcConnection:](self, "setXpcConnection:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SOUIDaemonConnection xpcConnection](self, "xpcConnection"));
  if (v8)
  {
    v9 = objc_msgSend(sub_10000436C(), "interfaceWithInternalProtocol:", &OBJC_PROTOCOL___SOUIServiceProtocol);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SOUIDaemonConnection xpcConnection](self, "xpcConnection"));
    objc_msgSend(v11, "setExportedInterface:", v10);

    viewController = self->_viewController;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SOUIDaemonConnection xpcConnection](self, "xpcConnection"));
    objc_msgSend(v13, "setExportedObject:", viewController);

    v14 = objc_msgSend(sub_10000436C(), "interfaceWithInternalProtocol:", &OBJC_PROTOCOL___SODaemonUIProtocol);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SOUIDaemonConnection xpcConnection](self, "xpcConnection"));
    objc_msgSend(v16, "setRemoteObjectInterface:", v15);

    objc_initWeak(&location, self);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100004424;
    v30[3] = &unk_10000C2C8;
    objc_copyWeak(&v31, &location);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SOUIDaemonConnection xpcConnection](self, "xpcConnection"));
    objc_msgSend(v17, "setInvalidationHandler:", v30);

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10000447C;
    v28[3] = &unk_10000C2C8;
    objc_copyWeak(&v29, &location);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SOUIDaemonConnection xpcConnection](self, "xpcConnection"));
    objc_msgSend(v18, "setInterruptionHandler:", v28);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SOUIDaemonConnection xpcConnection](self, "xpcConnection"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[SOUIDaemonConnection _queue](SOUIDaemonConnection, "_queue"));
    objc_msgSend(v19, "_setQueue:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SOUIDaemonConnection xpcConnection](self, "xpcConnection"));
    objc_msgSend(v21, "resume");

    v22 = sub_100003FB0();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v34 = self;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: new XPC connection", buf, 0xCu);
    }

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
    goto LABEL_8;
  }
  v26 = sub_100003FB0();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    sub_100007514();

  v24 = 0;
LABEL_9:

  return v24;
}

- (void)authorizationDidCompleteWithCredential:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint8_t v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  if (-[SOUIDaemonConnection _connectToDaemon](self, "_connectToDaemon"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SOUIDaemonConnection xpcConnection](self, "xpcConnection"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", &stru_10000C308));
    objc_msgSend(v12, "authorizationDidCompleteWithCredential:error:completion:", v8, v9, v10);

LABEL_9:
    goto LABEL_10;
  }
  v13 = sub_100003FB0();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    sub_100007694(v14, v15, v16, v17, v18, v19, v20, v21);

  if (v10)
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x2050000000;
    v29 = (void *)qword_100011DB8;
    v36 = qword_100011DB8;
    if (!qword_100011DB8)
    {
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_100004830;
      v32[3] = &unk_10000C350;
      v32[4] = &v33;
      sub_100004830((uint64_t)v32, v22, v23, v24, v25, v26, v27, v28, v31);
      v29 = (void *)v34[3];
    }
    v30 = objc_retainAutorelease(v29);
    _Block_object_dispose(&v33, 8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "internalErrorWithMessage:", CFSTR("Failed to connect to AppSSO daemon")));
    v10[2](v10, 0, v11);
    goto LABEL_9;
  }
LABEL_10:

}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setXpcConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end

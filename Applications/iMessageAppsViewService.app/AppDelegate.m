@implementation AppDelegate

- (AppDelegate)init
{
  AppDelegate *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *xpcQueue;
  NSXPCListener *v7;
  NSXPCListener *sourceListener;
  AppDelegate *v9;
  _QWORD *v10;
  id v11;
  NSObject *v12;
  __int16 v14;
  _QWORD v15[4];
  AppDelegate *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AppDelegate;
  v2 = -[AppDelegate init](&v17, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.iMessageAppsViewService.xpcQueue", v4);
    xpcQueue = v2->_xpcQueue;
    v2->_xpcQueue = (OS_dispatch_queue *)v5;

    v7 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.iMessageAppsViewService.warmup-connection"));
    sourceListener = v2->_sourceListener;
    v2->_sourceListener = v7;

    -[NSXPCListener _setQueue:](v2->_sourceListener, "_setQueue:", v2->_xpcQueue);
    -[NSXPCListener setDelegate:](v2->_sourceListener, "setDelegate:", v2);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100005068;
    v15[3] = &unk_10000C728;
    v9 = v2;
    v16 = v9;
    v10 = objc_retainBlock(v15);
    v9->_lockToken = -1;
    v9 = (AppDelegate *)((char *)v9 + 24);
    notify_register_dispatch(kSBSLockStateNotifyKey, (int *)v9, (dispatch_queue_t)&_dispatch_main_q, v10);
    ((void (*)(_QWORD *, _QWORD))v10[2])(v10, LODWORD(v9->super.isa));
    v11 = sub_100006854();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Running but not yet listening", (uint8_t *)&v14, 2u);
    }

  }
  return v2;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5;
  NSObject *v6;
  _QWORD v8[5];
  uint8_t buf[16];

  v5 = sub_100006854();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Application didFinishLaunching", buf, 2u);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005198;
  v8[3] = &unk_10000C5C8;
  v8[4] = self;
  objc_msgSend(UIApp, "_performBlockAfterCATransactionCommits:", v8);
  return 1;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[8];

  v6 = a3;
  v7 = a4;
  v8 = sub_100006854();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = objc_msgSend(v7, "processIdentifier");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Accepting new source connection from PID %d", buf, 8u);
  }

  objc_msgSend(v7, "_setQueue:", self->_xpcQueue);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL____UIKeyboardMediaService));
  objc_msgSend(v7, "setExportedInterface:", v10);

  objc_msgSend(v7, "setExportedObject:", self);
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, v7);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100005414;
  v17[3] = &unk_10000C750;
  objc_copyWeak(&v18, (id *)buf);
  objc_msgSend(v7, "setInterruptionHandler:", v17);
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_1000054D0;
  v15 = &unk_10000C750;
  objc_copyWeak(&v16, (id *)buf);
  objc_msgSend(v7, "setInvalidationHandler:", &v12);
  objc_msgSend(v7, "resume", v12, v13, v14, v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (void)warmUp
{
  id v2;
  NSObject *v3;
  void *v4;
  _DWORD v5[2];

  v2 = sub_100006854();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
    v5[0] = 67109120;
    v5[1] = objc_msgSend(v4, "processIdentifier");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Warmed up by PID %d", (uint8_t *)v5, 8u);

  }
}

- (void)_didBecomeLocked
{
  exit(0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceListener, 0);
  objc_storeStrong((id *)&self->_xpcQueue, 0);
}

@end

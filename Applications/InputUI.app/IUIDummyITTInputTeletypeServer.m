@implementation IUIDummyITTInputTeletypeServer

+ (id)sharedServer
{
  return objc_alloc_init((Class)a1);
}

- (IUIDummyITTInputTeletypeServer)init
{
  IUIDummyITTInputTeletypeServer *v2;
  IUIDummyITTInputTeletypeServer *v3;
  id *v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v10[8];
  _QWORD v11[4];
  id *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)IUIDummyITTInputTeletypeServer;
  v2 = -[IUIDummyITTInputTeletypeServer init](&v13, "init");
  v3 = v2;
  if (v2)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100004358;
    v11[3] = &unk_10001C4C8;
    v4 = v2;
    v12 = v4;
    v5 = objc_claimAutoreleasedReturnValue(+[BSServiceConnectionListener listenerWithConfigurator:](BSServiceConnectionListener, "listenerWithConfigurator:", v11));
    v6 = v4[1];
    v4[1] = (id)v5;

    v7 = sub_1000039F4();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Initialize dummy input teletype server.", v10, 2u);
    }

    objc_msgSend(v4[1], "activate");
  }
  return v3;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;

  v5 = a4;
  v6 = sub_1000039F4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Rejecting connection: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(v5, "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bsConnectionlistener, 0);
}

@end

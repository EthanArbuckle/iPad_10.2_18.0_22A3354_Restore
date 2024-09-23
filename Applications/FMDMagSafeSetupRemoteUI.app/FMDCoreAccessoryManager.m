@implementation FMDCoreAccessoryManager

- (FMDCoreAccessoryManager)initWithDelegate:(id)a3
{
  id v4;
  FMDCoreAccessoryManager *v5;
  FMDCoreAccessoriesCache *v6;
  FMDCoreAccessoriesCache *cache;
  dispatch_queue_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint8_t v15[8];
  objc_super v16;
  uint64_t v17;
  _UNKNOWN **v18;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FMDCoreAccessoryManager;
  v5 = -[FMDCoreAccessoryManager init](&v16, "init");
  if (v5)
  {
    v6 = objc_opt_new(FMDCoreAccessoriesCache);
    cache = v5->_cache;
    v5->_cache = v6;

    -[FMDCoreAccessoryManager setDelegate:](v5, "setDelegate:", v4);
    v8 = dispatch_queue_create("FMDCoreAccessoryManager.serialQueue", 0);
    -[FMDCoreAccessoryManager setSerialQueue:](v5, "setSerialQueue:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDACCConnectionInfoFactory connectionInfo](FMDACCConnectionInfoFactory, "connectionInfo"));
    -[FMDCoreAccessoryManager setConnectionInfo:](v5, "setConnectionInfo:", v9);

    v17 = ACCConnectionInfoFilterAllowConnectionType;
    v18 = &off_1000398B8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCoreAccessoryManager connectionInfo](v5, "connectionInfo"));
    objc_msgSend(v11, "registerDelegate:withFilter:", v5, v10);

    v12 = sub_100005190();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "FMDCoreAccessoryManager intialised", v15, 2u);
    }

  }
  return v5;
}

- (NSDictionary)accessoryRawInfo
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCoreAccessoryManager cache](self, "cache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessoriesRawInfo"));

  return (NSDictionary *)v3;
}

- (void)accessoryConnectionAttached:(id)a3 type:(int)a4 info:(id)a5 properties:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  FMDCoreAccessoryManager *v20;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = objc_claimAutoreleasedReturnValue(-[FMDCoreAccessoryManager serialQueue](self, "serialQueue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100015484;
  v16[3] = &unk_100035908;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v20 = self;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(v12, v16);

}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  FMDCoreAccessoryManager *v22;
  id v23;
  int v24;
  int v25;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = objc_claimAutoreleasedReturnValue(-[FMDCoreAccessoryManager serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015710;
  block[3] = &unk_100035930;
  v20 = v14;
  v21 = v13;
  v22 = self;
  v23 = v12;
  v24 = a5;
  v25 = a4;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  dispatch_async(v15, block);

}

- (void)accessoryConnectionDetached:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;

  v4 = a3;
  v5 = sub_100005190();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[FMDCoreAccessoryManager accessoryConnectionDetached:]";
    v13 = 2112;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#CA %s %@", buf, 0x16u);
  }

  v7 = objc_claimAutoreleasedReturnValue(-[FMDCoreAccessoryManager serialQueue](self, "serialQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100015B9C;
  v9[3] = &unk_100034838;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

- (void)accessoryEndpointUpdate:(id)a3 protocol:(int)a4 properties:(id)a5 forConnection:(id)a6
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;

  v7 = a5;
  v8 = a6;
  v9 = sub_100005190();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315650;
    v12 = "-[FMDCoreAccessoryManager accessoryEndpointUpdate:protocol:properties:forConnection:]";
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#CA %s %@ %@", (uint8_t *)&v11, 0x20u);
  }

}

- (void)accessoryConnectionInfoPropertyChanged:(id)a3 properties:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = sub_100005190();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315650;
    v10 = "-[FMDCoreAccessoryManager accessoryConnectionInfoPropertyChanged:properties:]";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#CA %s %@ %@", (uint8_t *)&v9, 0x20u);
  }

}

- (void)accessoryEndpointInfoPropertyChanged:(id)a3 properties:(id)a4 forConnection:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  v7 = a4;
  v8 = a5;
  v9 = sub_100005190();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[FMDCoreAccessoryManager accessoryEndpointInfoPropertyChanged:properties:forConnection:]";
    v19 = 2112;
    v20 = v8;
    v21 = 2112;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#CA %s %@ %@", buf, 0x20u);
  }

  v11 = objc_claimAutoreleasedReturnValue(-[FMDCoreAccessoryManager serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001604C;
  block[3] = &unk_1000359A8;
  block[4] = self;
  v15 = v8;
  v16 = v7;
  v12 = v7;
  v13 = v8;
  dispatch_async(v11, block);

}

- (FMDCoreAccessoryManagerDelegateProtocol)delegate
{
  return (FMDCoreAccessoryManagerDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FMDACCConnectionInfo)connectionInfo
{
  return self->_connectionInfo;
}

- (void)setConnectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_connectionInfo, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (FMDCoreAccessoriesCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_connectionInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

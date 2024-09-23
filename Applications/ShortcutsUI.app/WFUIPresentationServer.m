@implementation WFUIPresentationServer

- (WFUIPresentationServer)init
{
  WFUIPresentationServer *v2;
  WFBannerManager *v3;
  WFBannerManager *bannerManager;
  WFUIPresentationServer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFUIPresentationServer;
  v2 = -[WFUIPresentationServer init](&v7, "init");
  if (v2)
  {
    v3 = objc_opt_new(WFBannerManager);
    bannerManager = v2->_bannerManager;
    v2->_bannerManager = v3;

    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  BSServiceConnectionListener *listener;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WFUIPresentationServer listener](self, "listener"));

  if (v3)
  {
    v4 = sub_100003744();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[WFUIPresentationServer dealloc]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Connection listener is invalidating because the server is getting deallocated", buf, 0xCu);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WFUIPresentationServer listener](self, "listener"));
    objc_msgSend(v6, "invalidate");

    listener = self->_listener;
    self->_listener = 0;

  }
  v8.receiver = self;
  v8.super_class = (Class)WFUIPresentationServer;
  -[WFUIPresentationServer dealloc](&v8, "dealloc");
}

- (void)start
{
  void *v3;
  void *v4;
  BSServiceConnectionListener *listener;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WFUIPresentationServer listener](self, "listener"));

  if (!v3)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100003968;
    v6[3] = &unk_100034728;
    v6[4] = self;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnectionListener listenerWithConfigurator:](BSServiceConnectionListener, "listenerWithConfigurator:", v6));
    objc_msgSend(v4, "activate");
    listener = self->_listener;
    self->_listener = (BSServiceConnectionListener *)v4;

  }
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  uint64_t WFXPCRunnerLogObject;
  NSObject *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  CFTimeInterval v19;

  v6 = a4;
  WFXPCRunnerLogObject = getWFXPCRunnerLogObject();
  v8 = objc_claimAutoreleasedReturnValue(WFXPCRunnerLogObject);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[WFUIPresentationServer listener:didReceiveConnection:withContext:]";
    v18 = 2048;
    v19 = CACurrentMediaTime();
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s [Performance] UI process received connection, %f", buf, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteProcess"));
  v10 = objc_msgSend(v9, "hasEntitlement:", CFSTR("com.apple.shortcuts.dialogpresentation"));

  if ((v10 & 1) != 0)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100003784;
    v15[3] = &unk_100034778;
    v15[4] = self;
    objc_msgSend(v6, "configureConnection:", v15);
    objc_msgSend(v6, "activate");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WFUIPresentationServer bannerManager](self, "bannerManager"));
    objc_msgSend(v11, "addConnectedHost:", v6);

  }
  else
  {
    v12 = sub_100003744();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteProcess"));
      *(_DWORD *)buf = 136315394;
      v17 = "-[WFUIPresentationServer listener:didReceiveConnection:withContext:]";
      v18 = 2112;
      v19 = *(double *)&v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [Server-side] Rejecting connection from process (%@) due to lack of entitlements", buf, 0x16u);

    }
    objc_msgSend(v6, "invalidate");
  }

}

- (BSServiceConnectionListener)listener
{
  return self->_listener;
}

- (WFBannerManager)bannerManager
{
  return self->_bannerManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerManager, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end

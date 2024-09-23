@implementation RPAngelConnectionManager

+ (id)sharedInstance
{
  if (qword_10003FA38 != -1)
    dispatch_once(&qword_10003FA38, &stru_100034BD8);
  return (id)qword_10003FA30;
}

- (RPAngelConnectionManager)init
{
  RPAngelConnectionManager *v2;
  RPAngelConnectionManager *v3;
  RPAngelConnectionManager *v4;
  uint64_t v5;
  BSServiceConnectionListener *publicListener;
  uint64_t v7;
  NSMutableDictionary *connections;
  _QWORD v10[4];
  RPAngelConnectionManager *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RPAngelConnectionManager;
  v2 = -[RPAngelConnectionManager init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100003758;
    v10[3] = &unk_100034C00;
    v4 = v2;
    v11 = v4;
    v5 = objc_claimAutoreleasedReturnValue(+[BSServiceConnectionListener listenerWithConfigurator:](BSServiceConnectionListener, "listenerWithConfigurator:", v10));
    publicListener = v4->_publicListener;
    v4->_publicListener = (BSServiceConnectionListener *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    connections = v4->_connections;
    v4->_connections = (NSMutableDictionary *)v7;

  }
  return v3;
}

- (void)dealloc
{
  NSMutableDictionary *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  RPAngelCameraPipViewController *cameraPipViewController;
  void *v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  -[BSServiceConnectionListener invalidate](self->_publicListener, "invalidate");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_connections;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_connections, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v7)));
        objc_msgSend(v8, "invalidate");

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  cameraPipViewController = self->_cameraPipViewController;
  self->_cameraPipViewController = 0;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[RPRemoteAlertManager sharedInstance](RPRemoteAlertManager, "sharedInstance"));
  objc_msgSend(v10, "clearRemoteHandle");

  v11.receiver = self;
  v11.super_class = (Class)RPAngelConnectionManager;
  -[RPAngelConnectionManager dealloc](&v11, "dealloc");
}

- (void)activateMachService
{
  -[BSServiceConnectionListener activate](self->_publicListener, "activate");
}

- (id)connectionManagerQueue
{
  if (qword_10003FA48 != -1)
    dispatch_once(&qword_10003FA48, &stru_100034C20);
  return (id)qword_10003FA40;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  _QWORD v9[5];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteProcess"));
  v8 = -[RPAngelConnectionManager isConnectingProcessAuthorized:](self, "isConnectingProcessAuthorized:", v7);

  if ((v8 & 1) != 0)
  {
    if (qword_10003FA58 != -1)
      dispatch_once(&qword_10003FA58, &stru_100034C40);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100003BE0;
    v9[3] = &unk_100034CE8;
    v9[4] = self;
    objc_msgSend(v6, "configureConnection:", v9);
    if (-[RPAngelConnectionManager addConnection:](self, "addConnection:", v6))
    {
      if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v11 = "-[RPAngelConnectionManager listener:didReceiveConnection:withContext:]";
        v12 = 1024;
        v13 = 125;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Activating Connection", buf, 0x12u);
      }
      objc_msgSend(v6, "activate");
    }
  }
  else if (__RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100024E08();
  }

}

- (BOOL)isConnectingProcessAuthorized:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  void *v19;

  v3 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
    v5 = objc_msgSend(v3, "pid");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForEntitlement:", CFSTR("application-identifier")));
    v10 = 136447234;
    v11 = "-[RPAngelConnectionManager isConnectingProcessAuthorized:]";
    v12 = 1024;
    v13 = 131;
    v14 = 2112;
    v15 = v4;
    v16 = 1024;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Connection BundleID=%@ pid=%d valueFor=%@", (uint8_t *)&v10, 0x2Cu);

  }
  if ((objc_msgSend(v3, "hasEntitlement:", CFSTR("com.apple.private.ReplayKitAngel.client")) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
    v7 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.springboard"));

  }
  return v7;
}

- (BOOL)addConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;

  v4 = a3;
  v5 = v4;
  if (!v4 || (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteToken")), v6, !v6))
  {
LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteToken"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForEntitlement:", CFSTR("application-identifier")));

  if (!v8)
  {
    if (__RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100024E84();
    goto LABEL_11;
  }
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136446978;
    v12 = "-[RPAngelConnectionManager addConnection:]";
    v13 = 1024;
    v14 = 139;
    v15 = 2048;
    v16 = v5;
    v17 = 2112;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d adding connection=%p identifer=%@", (uint8_t *)&v11, 0x26u);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_connections, "setObject:forKeyedSubscript:", v5, v8);

  v9 = 1;
LABEL_12:

  return v9;
}

- (void)showRecordingBanner
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;

  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446466;
    v4 = "-[RPAngelConnectionManager showRecordingBanner]";
    v5 = 1024;
    v6 = 152;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v3, 0x12u);
  }
  -[RPAngelConnectionManagerDelegate startRecording](self->_delegate, "startRecording");
}

- (void)stopRecordingCalled
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;

  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446466;
    v4 = "-[RPAngelConnectionManager stopRecordingCalled]";
    v5 = 1024;
    v6 = 157;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v3, 0x12u);
  }
  -[RPAngelConnectionManagerDelegate didTapStopButton](self->_delegate, "didTapStopButton");
}

- (void)hideAndStopRecordingBanner
{
  RPSessionProxy *v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;

  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446466;
    v4 = "-[RPAngelConnectionManager hideAndStopRecordingBanner]";
    v5 = 1024;
    v6 = 162;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v3, 0x12u);
  }
  v2 = objc_alloc_init(RPSessionProxy);
  -[RPSessionProxy finish](v2, "finish");

}

- (void)showSavedToPhotosBannerWithPhotosURL:(id)a3 identifier:(id)a4 sessionID:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  RPSessionProxy *v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD))a6;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136446722;
    v18 = "-[RPAngelConnectionManager showSavedToPhotosBannerWithPhotosURL:identifier:sessionID:completionHandler:]";
    v19 = 1024;
    v20 = 168;
    v21 = 2112;
    v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d sessionID=%@", (uint8_t *)&v17, 0x1Cu);
  }
  v14 = objc_alloc_init(RPSessionProxy);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPSessionProxy currentSessionID](v14, "currentSessionID"));
  if (self->_delegate && objc_msgSend(v12, "isEqualToString:", v15))
  {
    -[RPAngelConnectionManagerDelegate showSavedToPhotosBannerWithPhotosURL:identifier:sessionID:](self->_delegate, "showSavedToPhotosBannerWithPhotosURL:identifier:sessionID:", v10, v11, v12);
    v13[2](v13, 0);
  }
  else
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136446722;
      v18 = "-[RPAngelConnectionManager showSavedToPhotosBannerWithPhotosURL:identifier:sessionID:completionHandler:]";
      v19 = 1024;
      v20 = 175;
      v21 = 2112;
      v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d saved to photos completed when session has finished, currentSessionID=%@", (uint8_t *)&v17, 0x1Cu);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5800, 0));
    ((void (**)(id, void *))v13)[2](v13, v16);

  }
}

- (void)updateTimer:(id)a3
{
  id v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;

  v4 = a3;
  if (!__RPLogLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[RPAngelConnectionManager updateTimer:]";
    v7 = 1024;
    v8 = 182;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  -[RPAngelConnectionManagerDelegate updateTimer:](self->_delegate, "updateTimer:", v4);

}

- (void)startRecordingCountdown
{
  RPSessionProxy *v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;

  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446466;
    v4 = "-[RPAngelConnectionManager startRecordingCountdown]";
    v5 = 1024;
    v6 = 187;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v3, 0x12u);
  }
  v2 = objc_alloc_init(RPSessionProxy);
  -[RPSessionProxy start](v2, "start");

}

- (void)cancelRecordingCountdown
{
  RPSessionProxy *v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;

  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446466;
    v4 = "-[RPAngelConnectionManager cancelRecordingCountdown]";
    v5 = 1024;
    v6 = 193;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v3, 0x12u);
  }
  v2 = objc_alloc_init(RPSessionProxy);
  -[RPSessionProxy finish](v2, "finish");

}

- (void)connectToAngelWithCompletionHandler:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  RPSessionProxy *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;

  v3 = (void (**)(id, void *, _QWORD))a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[RPAngelConnectionManager connectToAngelWithCompletionHandler:]";
    v8 = 1024;
    v9 = 199;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v6, 0x12u);
  }
  v4 = objc_alloc_init(RPSessionProxy);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPSessionProxy currentSessionID](v4, "currentSessionID"));
  v3[2](v3, v5, 0);

}

- (void)setCountdownState:(id)a3
{
  id v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;

  v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[RPAngelConnectionManager setCountdownState:]";
    v7 = 1024;
    v8 = 205;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  -[RPAngelConnectionManagerDelegate setCountdownState:](self->_delegate, "setCountdownState:", v4);

}

- (void)enableCameraPip
{
  _QWORD block[5];
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  int v7;

  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v5 = "-[RPAngelConnectionManager enableCameraPip]";
    v6 = 1024;
    v7 = 211;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004C84;
  block[3] = &unk_100034D10;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)disableCameraPip
{
  _QWORD block[5];
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  int v7;

  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v5 = "-[RPAngelConnectionManager disableCameraPip]";
    v6 = 1024;
    v7 = 223;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004EAC;
  block[3] = &unk_100034D10;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)showReactionsTipForApplication:(id)a3 bundleID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;

  v5 = a3;
  v6 = a4;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136446466;
    v11 = "-[RPAngelConnectionManager showReactionsTipForApplication:bundleID:]";
    v12 = 1024;
    v13 = 231;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v10, 0x12u);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RPRemoteAlertManager sharedInstance](RPRemoteAlertManager, "sharedInstance"));
  v8 = objc_msgSend(v7, "createRemoteHandleForApplication:bundleID:", v5, v6);

  return v8;
}

- (void)dismissReactionsTipForApplication:(id)a3 bundleID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;

  v5 = a3;
  v6 = a4;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446466;
    v9 = "-[RPAngelConnectionManager dismissReactionsTipForApplication:bundleID:]";
    v10 = 1024;
    v11 = 236;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v8, 0x12u);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RPRemoteAlertManager sharedInstance](RPRemoteAlertManager, "sharedInstance"));
  objc_msgSend(v7, "clearRemoteHandle");

}

- (void)stopCurrentSession
{
  void *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;

  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[RPAngelConnectionManager stopCurrentSession]";
    v7 = 1024;
    v8 = 243;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connections, "objectForKeyedSubscript:", CFSTR("com.apple.springboard")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remoteTarget"));

  if (v4)
  {
    objc_msgSend(v4, "stopCurrentSession");
  }
  else if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[RPAngelConnectionManager stopCurrentSession]";
    v7 = 1024;
    v8 = 248;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelClientProtocol nil", (uint8_t *)&v5, 0x12u);
  }

}

- (void)countdownInterruptWithStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;

  v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446466;
    v8 = "-[RPAngelConnectionManager countdownInterruptWithStatus:]";
    v9 = 1024;
    v10 = 253;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v7, 0x12u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connections, "objectForKeyedSubscript:", CFSTR("com.apple.springboard")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteTarget"));

  if (v6)
  {
    objc_msgSend(v6, "countdownInterruptWithStatus:", v4);
  }
  else if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446466;
    v8 = "-[RPAngelConnectionManager countdownInterruptWithStatus:]";
    v9 = 1024;
    v10 = 258;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelClientProtocol nil", (uint8_t *)&v7, 0x12u);
  }

}

- (void)pauseCurrentSystemSession
{
  void *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;

  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[RPAngelConnectionManager pauseCurrentSystemSession]";
    v7 = 1024;
    v8 = 264;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connections, "objectForKeyedSubscript:", CFSTR("com.apple.replayd")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remoteTarget"));

  if (v4)
  {
    objc_msgSend(v4, "pauseCurrentSystemSession");
  }
  else if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[RPAngelConnectionManager pauseCurrentSystemSession]";
    v7 = 1024;
    v8 = 269;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelClientProtocol nil", (uint8_t *)&v5, 0x12u);
  }

}

- (void)resumeCurrentSystemSession
{
  void *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;

  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[RPAngelConnectionManager resumeCurrentSystemSession]";
    v7 = 1024;
    v8 = 274;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connections, "objectForKeyedSubscript:", CFSTR("com.apple.replayd")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remoteTarget"));

  if (v4)
  {
    objc_msgSend(v4, "resumeCurrentSystemSession");
  }
  else if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[RPAngelConnectionManager resumeCurrentSystemSession]";
    v7 = 1024;
    v8 = 279;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelClientProtocol nil", (uint8_t *)&v5, 0x12u);
  }

}

- (RPAngelConnectionManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_cameraPipViewController, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionManagerQueue, 0);
  objc_storeStrong((id *)&self->_publicListener, 0);
}

@end

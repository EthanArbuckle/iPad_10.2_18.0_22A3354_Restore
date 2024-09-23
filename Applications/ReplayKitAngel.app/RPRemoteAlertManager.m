@implementation RPRemoteAlertManager

+ (id)sharedInstance
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;

  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446466;
    v4 = "+[RPRemoteAlertManager sharedInstance]";
    v5 = 1024;
    v6 = 25;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v3, 0x12u);
  }
  if (qword_10003FA68 != -1)
    dispatch_once(&qword_10003FA68, &stru_100034DE0);
  return (id)qword_10003FA60;
}

- (RPRemoteAlertManager)init
{
  RPRemoteAlertManager *v3;
  RPRemoteAlertManager *v4;
  SBSRemoteAlertHandle *remoteAlertHandle;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;

  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPRemoteAlertManager init]";
    v10 = 1024;
    v11 = 35;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v7.receiver = self;
  v7.super_class = (Class)RPRemoteAlertManager;
  v3 = -[RPRemoteAlertManager init](&v7, "init");
  v4 = v3;
  if (v3)
  {
    remoteAlertHandle = v3->_remoteAlertHandle;
    v3->_remoteAlertHandle = 0;

  }
  return v4;
}

- (void)clearRemoteHandle
{
  SBSRemoteAlertHandle *remoteAlertHandle;
  SBSRemoteAlertHandle *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;

  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[RPRemoteAlertManager clearRemoteHandle]";
    v7 = 1024;
    v8 = 45;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  remoteAlertHandle = self->_remoteAlertHandle;
  if (remoteAlertHandle)
  {
    if (!__RPLogLevel)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136446466;
        v6 = "-[RPRemoteAlertManager clearRemoteHandle]";
        v7 = 1024;
        v8 = 48;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d client handle found, invalidating", (uint8_t *)&v5, 0x12u);
      }
      remoteAlertHandle = self->_remoteAlertHandle;
    }
    -[SBSRemoteAlertHandle unregisterObserver:](remoteAlertHandle, "unregisterObserver:", self);
    -[SBSRemoteAlertHandle invalidate](self->_remoteAlertHandle, "invalidate");
    v4 = self->_remoteAlertHandle;
    self->_remoteAlertHandle = 0;

  }
  else if (!__RPLogLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[RPRemoteAlertManager clearRemoteHandle]";
    v7 = 1024;
    v8 = 53;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d client handle not found", (uint8_t *)&v5, 0x12u);
  }
}

- (BOOL)createRemoteHandleForApplication:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  SBSRemoteAlertHandle *v13;
  SBSRemoteAlertHandle *remoteAlertHandle;
  id v15;
  _QWORD v17[2];
  _QWORD v18[2];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;

  v6 = a3;
  v7 = a4;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v20 = "-[RPRemoteAlertManager createRemoteHandleForApplication:bundleID:]";
    v21 = 1024;
    v22 = 58;
    v23 = 2112;
    v24 = v6;
    v25 = 2112;
    v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d app=%@ bundleId=%@", buf, 0x26u);
  }
  if (self->_remoteAlertHandle)
    -[RPRemoteAlertManager clearRemoteHandle](self, "clearRemoteHandle");
  v8 = objc_alloc((Class)SBSRemoteAlertDefinition);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessIdentity identityForAngelJobLabel:](RBSProcessIdentity, "identityForAngelJobLabel:", CFSTR("com.apple.replaykitangel")));
  v10 = objc_msgSend(v8, "initWithSceneProvidingProcess:configurationIdentifier:", v9, CFSTR("reactions-tip-alert"));

  v11 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
  v17[0] = CFSTR("applicationName");
  v17[1] = CFSTR("bundleIdentifier");
  v18[0] = v6;
  v18[1] = v7;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));
  objc_msgSend(v11, "setUserInfo:", v12);
  v13 = (SBSRemoteAlertHandle *)+[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:](SBSRemoteAlertHandle, "newHandleWithDefinition:configurationContext:", v10, v11);
  remoteAlertHandle = self->_remoteAlertHandle;
  self->_remoteAlertHandle = v13;

  -[SBSRemoteAlertHandle registerObserver:](self->_remoteAlertHandle, "registerObserver:", self);
  v15 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
  -[SBSRemoteAlertHandle activateWithContext:](self->_remoteAlertHandle, "activateWithContext:", v15);

  return 1;
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
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
    v6 = "-[RPRemoteAlertManager remoteAlertHandleDidDeactivate:]";
    v7 = 1024;
    v8 = 87;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  -[RPRemoteAlertManager clearRemoteHandle](self, "clearRemoteHandle");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
}

@end

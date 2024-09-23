@implementation FMDMagSafeSetupAgent

+ (id)sharedInstance
{
  if (qword_1000312A0 != -1)
    dispatch_once(&qword_1000312A0, &stru_100024950);
  return (id)qword_100031298;
}

- (FMDMagSafeSetupAgent)init
{
  FMDMagSafeSetupAgent *v2;
  id v3;
  NSObject *v4;
  dispatch_queue_t v5;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FMDMagSafeSetupAgent;
  v2 = -[FMDMagSafeSetupAgent init](&v8, "init");
  if (v2)
  {
    v3 = sub_10000430C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "intitializing setupAgent", v7, 2u);
    }

    v5 = dispatch_queue_create("FMDMagSafeSetupAgent", 0);
    -[FMDMagSafeSetupAgent setSerialQueue:](v2, "setSerialQueue:", v5);

  }
  return v2;
}

- (void)launchSetupModule:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  _UNKNOWN **v7;
  int v8;
  id v9;

  v4 = a3;
  v5 = sub_10000430C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "received notification %@", (uint8_t *)&v8, 0xCu);
  }

  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.icloud.FindMy.addMagSafeAccessory")))
    v7 = &off_100028C10;
  else
    v7 = (_UNKNOWN **)&__NSDictionary0__struct;
  -[FMDMagSafeSetupAgent _launchRemoteViewWithContext:](self, "_launchRemoteViewWithContext:", v7);

}

- (void)_launchRemoteViewWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupAgent serialQueue](self, "serialQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100009CAC;
  v7[3] = &unk_100024978;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)launchSetupModuleWith:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupAgent serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009EF4;
  block[3] = &unk_1000249A0;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  uint8_t v8[16];

  v4 = sub_10000430C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "remote handler deactivated", v8, 2u);
  }

  -[FMDMagSafeSetupAgent setRemoteAlertHandle:](self, "setRemoteAlertHandle:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupAgent launchCompleted](self, "launchCompleted"));

  if (v6)
  {
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupAgent launchCompleted](self, "launchCompleted"));
    v7[2](v7, 0);

  }
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  int v10;
  id v11;

  v5 = a4;
  v6 = sub_10000430C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "remote handler invalidated with error %@", (uint8_t *)&v10, 0xCu);
  }

  -[FMDMagSafeSetupAgent setRemoteAlertHandle:](self, "setRemoteAlertHandle:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupAgent launchCompleted](self, "launchCompleted"));

  if (v8)
  {
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupAgent launchCompleted](self, "launchCompleted"));
    ((void (**)(_QWORD, id))v9)[2](v9, v5);

  }
}

- (SBSRemoteAlertHandle)remoteAlertHandle
{
  return self->_remoteAlertHandle;
}

- (void)setRemoteAlertHandle:(id)a3
{
  objc_storeStrong((id *)&self->_remoteAlertHandle, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (id)launchCompleted
{
  return self->_launchCompleted;
}

- (void)setLaunchCompleted:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_launchCompleted, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
}

@end

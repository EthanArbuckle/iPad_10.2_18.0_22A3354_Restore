@implementation PasscodeEmbeddedRemoteViewController

+ (id)_exportedInterface
{
  if (qword_100092200 != -1)
    dispatch_once(&qword_100092200, &stru_10007A508);
  return (id)qword_100092208;
}

+ (id)_remoteViewControllerInterface
{
  if (qword_100092210 != -1)
    dispatch_once(&qword_100092210, &stru_10007A528);
  return (id)qword_100092218;
}

- (BOOL)_shouldForwardSystemLayoutFittingSizeChanges
{
  return 1;
}

- (void)setContext:(id)a3
{
  NSData *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSData *externalizedContext;
  int v10;
  const char *v11;

  v4 = (NSData *)a3;
  v7 = LALogForCategory(0, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "-[PasscodeEmbeddedRemoteViewController setContext:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v10, 0xCu);
  }

  externalizedContext = self->_externalizedContext;
  self->_externalizedContext = v4;

}

- (void)startEditing
{
  double v3;

  -[PasscodeEmbeddedRemoteViewController _backoffTimeout](self, "_backoffTimeout");
  if (v3 == 0.0)
    -[PasscodeEmbeddedViewController setPasscodeFocused:](self, "setPasscodeFocused:", 1);
}

- (void)endEditing
{
  -[PasscodeEmbeddedViewController setPasscodeFocused:](self, "setPasscodeFocused:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PasscodeEmbeddedRemoteViewController;
  -[PasscodeEmbeddedRemoteViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  -[PasscodeEmbeddedRemoteViewController _backoffTimeout](self, "_backoffTimeout");
  if (v4 > 0.0)
  {
    v5 = v4;
    -[PasscodeEmbeddedRemoteViewController _dispatchBackoffTimer](self, "_dispatchBackoffTimer");
    -[PasscodeEmbeddedViewController setBackoffTimeout:](self, "setBackoffTimeout:", v5);
  }
}

- (BOOL)verifyPasscode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSData *externalizedContext;
  NSNumber *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LACSecureData secureDataWithString:](LACSecureData, "secureDataWithString:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[LAPasscodeHelper sharedInstance](LAPasscodeHelper, "sharedInstance"));
  externalizedContext = self->_externalizedContext;
  v8 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", getuid());
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend(v6, "verifyPasswordUsingAKS:acmContext:userId:policy:options:bioLockoutRecovery:", v5, externalizedContext, v9, 0, &__NSDictionary0__struct, 0);

  objc_msgSend(v5, "reset");
  if (v10)
  {
    if (v10 == (id)2)
    {
      -[PasscodeEmbeddedRemoteViewController _backoffTimeout](self, "_backoffTimeout");
      -[PasscodeEmbeddedViewController setBackoffTimeout:](self, "setBackoffTimeout:");
      -[PasscodeEmbeddedRemoteViewController _dispatchBackoffTimer](self, "_dispatchBackoffTimer");
    }
    -[PasscodeEmbeddedRemoteViewController _notifyPasscodeVerificationFinishedWithSuccess:](self, "_notifyPasscodeVerificationFinishedWithSuccess:", 0);
  }
  else
  {
    v11 = objc_msgSend(objc_alloc((Class)LAContext), "initWithExternalizedContext:", self->_externalizedContext);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataUsingEncoding:", 4));
    objc_msgSend(v11, "setCredential:forProcessedEvent:credentialType:reply:", v12, 2, -1, &stru_10007A568);

    -[PasscodeEmbeddedRemoteViewController _notifyPasscodeVerificationFinishedWithSuccess:](self, "_notifyPasscodeVerificationFinishedWithSuccess:", 1);
  }

  return v10 == 0;
}

- (void)_notifyPasscodeVerificationFinishedWithSuccess:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSErrorUserInfoKey v8;
  const __CFString *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PasscodeEmbeddedRemoteViewController _remoteViewControllerProxyWithErrorHandler:](self, "_remoteViewControllerProxyWithErrorHandler:", &stru_10007A5A8));
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "passcodeVerificationFinished:", 0);
  }
  else
  {
    v8 = NSDebugDescriptionErrorKey;
    v9 = CFSTR("Passcode verification failed");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", &stru_10007CCD0, -1, v6));
    objc_msgSend(v5, "passcodeVerificationFinished:", v7);

  }
}

- (void)_dispatchBackoffTimer
{
  NSObject *backoffTimer;
  OS_dispatch_source *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id location;

  backoffTimer = self->_backoffTimer;
  if (backoffTimer)
  {
    dispatch_source_cancel(backoffTimer);
    v4 = self->_backoffTimer;
    self->_backoffTimer = 0;

  }
  v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 1uLL, (dispatch_queue_t)&_dispatch_main_q);
  v6 = self->_backoffTimer;
  self->_backoffTimer = v5;

  v7 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer((dispatch_source_t)self->_backoffTimer, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_initWeak(&location, self);
  v8 = self->_backoffTimer;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100022A54;
  v9[3] = &unk_100079B80;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v8, v9);
  dispatch_activate((dispatch_object_t)self->_backoffTimer);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (double)_backoffTimeout
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)MKBGetDeviceLockStateInfo(0, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", kMKBInfoBackOff));
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backoffTimer, 0);
  objc_storeStrong((id *)&self->_externalizedContext, 0);
}

@end

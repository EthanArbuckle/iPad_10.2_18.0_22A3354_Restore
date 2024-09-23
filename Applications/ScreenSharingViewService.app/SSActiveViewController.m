@implementation SSActiveViewController

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (SSActiveViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  NSBundle *v8;
  void *v9;
  SSActiveViewController *v10;
  id v11;
  void *v12;
  void *v13;
  SSActiveViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  SSActiveViewController *v22;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v23.receiver = self;
  v23.super_class = (Class)SSActiveViewController;
  v10 = -[SSActiveViewController initWithNibName:bundle:](&v23, "initWithNibName:bundle:", CFSTR("SSActiveViewController2"), v9);

  if (v10)
  {
    v11 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.ScreenSharingViewServiceHelper"), 0);
    -[SSActiveViewController setHelperToolConnection:](v10, "setHelperToolConnection:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___ViewServiceProtocol));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SSActiveViewController helperToolConnection](v10, "helperToolConnection"));
    objc_msgSend(v13, "setRemoteObjectInterface:", v12);

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000290C;
    v21[3] = &unk_100008210;
    v14 = v10;
    v22 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SSActiveViewController helperToolConnection](v14, "helperToolConnection"));
    objc_msgSend(v15, "setInvalidationHandler:", v21);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SSActiveViewController helperToolConnection](v14, "helperToolConnection"));
    objc_msgSend(v16, "resume");

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SSActiveViewController helperToolConnection](v14, "helperToolConnection"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "remoteObjectProxyWithErrorHandler:", &stru_100008250));
    -[SSActiveViewController setHelperTool:](v14, "setHelperTool:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SSActiveViewController helperTool](v14, "helperTool"));
    sub_10000254C(v19);

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[SSActiveViewController setHelperToolConnection:](self, "setHelperToolConnection:", 0);
  -[SSActiveViewController setHelperToolBackChannelInterface:](self, "setHelperToolBackChannelInterface:", 0);
  -[SSActiveViewController setHelperTool:](self, "setHelperTool:", 0);
  -[SSActiveViewController setViewerName:](self, "setViewerName:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SSActiveViewController;
  -[SSActiveViewController dealloc](&v3, "dealloc");
}

- (void)showControls
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[6];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSActiveViewController isPausedNumber](self, "isPausedNumber"));
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("kSSScreenSharingPaused"), &stru_100008398, 0));
    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSActiveViewController viewerName](self, "viewerName"));

    if (v8)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSActiveViewController viewerName](self, "viewerName"));
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("kSSAppleCare"), &stru_100008398, 0));

    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("kSSviewingScreen"), &stru_100008398, 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SSActiveViewController viewerName](self, "viewerName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v7, v6, 1));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SSActiveViewController isPausedNumber](self, "isPausedNumber"));
  v14 = objc_msgSend(v13, "BOOLValue");

  if (!v14)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("kSSPauseScreenSharing"), &stru_100008398, 0));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100002E9C;
    v32[3] = &unk_100008278;
    v32[4] = self;
    v19 = v32;
    goto LABEL_11;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SSActiveViewController isScreenLockedNumber](self, "isScreenLockedNumber"));
  v16 = objc_msgSend(v15, "BOOLValue");

  if ((v16 & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("kSSResumeScreenSharing"), &stru_100008398, 0));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100002E90;
    v33[3] = &unk_100008278;
    v33[4] = self;
    v19 = v33;
LABEL_11:
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v18, 0, v19));
    objc_msgSend(v12, "addAction:", v20);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("kSSCancel"), &stru_100008398, 0));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100002EA8;
  v31[3] = &unk_100008278;
  v31[4] = self;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v22, 1, v31));
  objc_msgSend(v12, "addAction:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("kSSEndScreenSharing"), &stru_100008398, 0));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100002EB4;
  v30[3] = &unk_100008278;
  v30[4] = self;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v25, 2, v30));
  objc_msgSend(v12, "addAction:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SSActiveViewController popoverPresentationController](self, "popoverPresentationController"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SSActiveViewController view](self, "view"));
  objc_msgSend(v27, "setSourceView:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[SSActiveViewController view](self, "view"));
  objc_msgSend(v29, "bounds");
  objc_msgSend(v27, "setSourceRect:");

  -[SSActiveViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SSActiveViewController;
  -[SSActiveViewController viewDidLoad](&v2, "viewDidLoad");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSActiveViewController;
  -[SSActiveViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  if (-[SSActiveViewController userInfoSet](self, "userInfoSet"))
    -[SSActiveViewController showControls](self, "showControls");
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SSActiveViewController;
  -[SSActiveViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)setUserInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char isKindOfClass;
  void *v18;
  unsigned int v19;
  int v20;
  id v21;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "setUserInfo begin", (uint8_t *)&v20, 2u);
  }
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPaused")));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPaused")));
      -[SSActiveViewController setIsPausedNumber:](self, "setIsPausedNumber:", v6);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isScreenLocked")));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isScreenLocked")));
      -[SSActiveViewController setIsScreenLockedNumber:](self, "setIsScreenLockedNumber:", v8);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("viewerName")));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("viewerName")));
      -[SSActiveViewController setViewerName:](self, "setViewerName:", v10);

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SSActiveViewController viewerName](self, "viewerName")));
        v12 = objc_msgSend(v11, "UTF8String");
        v20 = 136315138;
        v21 = v12;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*****set viewer name %s", (uint8_t *)&v20, 0xCu);

      }
    }
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAppleSupportRequest")));
    if (v13)
    {
      v14 = (void *)v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAppleSupportRequest")));
      v16 = objc_opt_class(NSNumber);
      isKindOfClass = objc_opt_isKindOfClass(v15, v16);

      if ((isKindOfClass & 1) != 0)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAppleSupportRequest")));
        -[SSActiveViewController setIsAppleSupportRequest:](self, "setIsAppleSupportRequest:", objc_msgSend(v18, "BOOLValue"));
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v19 = -[SSActiveViewController isAppleSupportRequest](self, "isAppleSupportRequest");
          v20 = 67109120;
          LODWORD(v21) = v19;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Apple Support %d", (uint8_t *)&v20, 8u);
        }

      }
    }
    -[SSActiveViewController setUserInfoSet:](self, "setUserInfoSet:", 1);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "userInfo:%@", (uint8_t *)&v20, 0xCu);
    }
  }

}

- (void)sendResultAndTerminate:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v8 = CFSTR("result");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSActiveViewController helperTool](self, "helperTool"));
  sub_100002674(v6, v5);

  -[NSXPCConnection invalidate](self->helperToolConnection, "invalidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v7, "terminateWithSuccess");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSNumber)isPausedNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIsPausedNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSNumber)isScreenLockedNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIsScreenLockedNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSXPCConnection)helperToolConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHelperToolConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (id)helperTool
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setHelperTool:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)userInfoSet
{
  return self->_userInfoSet;
}

- (void)setUserInfoSet:(BOOL)a3
{
  self->_userInfoSet = a3;
}

- (BOOL)isAppleSupportRequest
{
  return self->_isAppleSupportRequest;
}

- (void)setIsAppleSupportRequest:(BOOL)a3
{
  self->_isAppleSupportRequest = a3;
}

- (NSXPCInterface)helperToolBackChannelInterface
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 48, 1);
}

- (void)setHelperToolBackChannelInterface:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)viewerName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setViewerName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewerName, 0);
  objc_storeStrong((id *)&self->_helperToolBackChannelInterface, 0);
  objc_storeStrong(&self->helperTool, 0);
  objc_storeStrong((id *)&self->helperToolConnection, 0);
  objc_storeStrong((id *)&self->isScreenLockedNumber, 0);
  objc_storeStrong((id *)&self->isPausedNumber, 0);
}

@end

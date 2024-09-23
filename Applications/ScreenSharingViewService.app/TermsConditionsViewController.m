@implementation TermsConditionsViewController

- (TermsConditionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  TermsConditionsViewController *v8;
  id v9;
  void *v10;
  void *v11;
  TermsConditionsViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSNumber *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  TermsConditionsViewController *v23;
  objc_super v24;
  const __CFString *v25;
  void *v26;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)TermsConditionsViewController;
  v8 = -[TermsConditionsViewController initWithNibName:bundle:](&v24, "initWithNibName:bundle:", v6, v7);
  if (v8)
  {
    if (qword_10000D750 != -1)
      dispatch_once(&qword_10000D750, &stru_1000082B8);
    v9 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.ScreenSharingViewServiceHelper"), 0);
    -[TermsConditionsViewController setHelperToolConnection:](v8, "setHelperToolConnection:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___ViewServiceProtocol));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TermsConditionsViewController helperToolConnection](v8, "helperToolConnection"));
    objc_msgSend(v11, "setRemoteObjectInterface:", v10);

    v12 = v8;
    v23 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TermsConditionsViewController helperToolConnection](v12, "helperToolConnection", _NSConcreteStackBlock, 3221225472, sub_1000039A0, &unk_100008210));
    objc_msgSend(v13, "setInvalidationHandler:", &v22);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TermsConditionsViewController helperToolConnection](v12, "helperToolConnection"));
    objc_msgSend(v14, "resume");

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TermsConditionsViewController helperToolConnection](v12, "helperToolConnection"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", &stru_1000082D8));
    -[TermsConditionsViewController setHelperTool:](v12, "setHelperTool:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TermsConditionsViewController helperTool](v12, "helperTool"));
    v25 = CFSTR("pid");
    v18 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", getpid());
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v26 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
    objc_msgSend(v17, "pidNotification:", v20);

  }
  return v8;
}

- (unint64_t)supportedInterfaceOrientations
{
  objc_super v3;

  if (byte_10000D758 != 1)
    return 2;
  v3.receiver = self;
  v3.super_class = (Class)TermsConditionsViewController;
  return -[TermsConditionsViewController supportedInterfaceOrientations](&v3, "supportedInterfaceOrientations");
}

- (void)viewWillAppear:(BOOL)a3
{
  unsigned int v4;
  unsigned int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  uint8_t buf[4];
  unsigned int v22;

  v20.receiver = self;
  v20.super_class = (Class)TermsConditionsViewController;
  -[TermsConditionsViewController viewWillAppear:](&v20, "viewWillAppear:", a3);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[TermsConditionsViewController userInfoSet](self, "userInfoSet");
    *(_DWORD *)buf = 67109120;
    v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "viewWillAppear  self.userInfoSet %d", buf, 8u);
  }
  v5 = -[TermsConditionsViewController shareSettingsRequest](self, "shareSettingsRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = v6;
  if (v5)
    v8 = CFSTR("kSSGatherSettingsTerms");
  else
    v8 = CFSTR("KSSShareScreenTerms");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_100008398, 0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TermsConditionsViewController termsSubHeaderTextView](self, "termsSubHeaderTextView"));
  objc_msgSend(v10, "setText:", v9);

  v11 = -[TermsConditionsViewController isAppleSupportRequest](self, "isAppleSupportRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = v12;
  if (v11)
    v14 = CFSTR("kSSAppleSupportHeader");
  else
    v14 = CFSTR("kSSAppleCareHeader");
  if (v11)
    v15 = CFSTR("AppleSupport64");
  else
    v15 = CFSTR("AppleCare64");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_100008398, 0));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v15));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TermsConditionsViewController termsHeaderTextView](self, "termsHeaderTextView"));
  objc_msgSend(v18, "setText:", v16);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TermsConditionsViewController termsIcon](self, "termsIcon"));
  objc_msgSend(v19, "setImage:", v17);

  -[TermsConditionsViewController traitCollectionDidChange:](self, "traitCollectionDidChange:", 0);
}

- (void)viewDidLoad
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD block[5];
  objc_super v9;
  uint8_t buf[4];
  unsigned int v11;

  v9.receiver = self;
  v9.super_class = (Class)TermsConditionsViewController;
  -[TermsConditionsViewController viewDidLoad](&v9, "viewDidLoad");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "view did load", buf, 2u);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = -[TermsConditionsViewController userInfoSet](self, "userInfoSet");
    *(_DWORD *)buf = 67109120;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "self.userInfoSet %d", buf, 8u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathForResource:ofType:", CFSTR("TermsConditions"), CFSTR("txt")));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfFile:encoding:error:](NSString, "stringWithContentsOfFile:encoding:error:", v5, 4, 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TermsConditionsViewController termsTextView](self, "termsTextView"));
    objc_msgSend(v7, "setText:", v6);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No T&C - assume decline", buf, 2u);
    }
    -[TermsConditionsViewController postResultNotification:](self, "postResultNotification:", 0);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003F08;
  block[3] = &unk_100008210;
  block[4] = self;
  if (qword_10000D760 != -1)
    dispatch_once(&qword_10000D760, block);
  -[TermsConditionsViewController traitCollectionDidChange:](self, "traitCollectionDidChange:", 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TermsConditionsViewController;
  -[TermsConditionsViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TermsConditionsViewController termsTextView](self, "termsTextView"));
  objc_msgSend(v4, "setContentOffset:animated:", 0, CGPointZero.x, CGPointZero.y);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TermsConditionsViewController termsTextView](self, "termsTextView"));
  objc_msgSend(v5, "scrollRangeToVisible:", 0, 0);

}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TermsConditionsViewController;
  -[TermsConditionsViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle2));
  objc_msgSend(v4, "pointSize");
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
  objc_msgSend(v7, "pointSize");
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote));
  objc_msgSend(v10, "pointSize");
  v12 = v11;

  if (byte_10000D758)
    v13 = 36.0;
  else
    v13 = 20.0;
  if (byte_10000D758)
    v14 = 33.0;
  else
    v14 = 18.0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", v6, UIFontWeightSemibold));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TermsConditionsViewController termsHeaderTextView](self, "termsHeaderTextView"));
  objc_msgSend(v16, "setFont:", v15);

  if (v9 <= v13)
    v17 = v9;
  else
    v17 = v13;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TermsConditionsViewController termsSubHeaderTextView](self, "termsSubHeaderTextView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "font"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "fontWithSize:", v17));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TermsConditionsViewController termsSubHeaderTextView](self, "termsSubHeaderTextView"));
  objc_msgSend(v21, "setFont:", v20);

  if (v12 > v14)
    v12 = v14;
  v25 = (id)objc_claimAutoreleasedReturnValue(-[TermsConditionsViewController termsTextView](self, "termsTextView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "font"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "fontWithSize:", v12));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TermsConditionsViewController termsTextView](self, "termsTextView"));
  objc_msgSend(v24, "setFont:", v23);

}

- (void)setUserInfo:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  char v16;
  void *v17;
  unsigned int v18;
  int v19;
  id v20;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "userinfo called with %@", (uint8_t *)&v19, 0xCu);
  }
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isShareSettings")));
    if (v5)
    {
      v6 = (void *)v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isShareSettings")));
      v8 = objc_opt_class(NSNumber);
      isKindOfClass = objc_opt_isKindOfClass(v7, v8);

      if ((isKindOfClass & 1) != 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isShareSettings")));
        -[TermsConditionsViewController setShareSettingsRequest:](self, "setShareSettingsRequest:", objc_msgSend(v10, "BOOLValue"));
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v11 = -[TermsConditionsViewController shareSettingsRequest](self, "shareSettingsRequest");
          v19 = 67109120;
          LODWORD(v20) = v11;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Share settings %d", (uint8_t *)&v19, 8u);
        }

      }
    }
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAppleSupportRequest")));
    if (v12)
    {
      v13 = (void *)v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAppleSupportRequest")));
      v15 = objc_opt_class(NSNumber);
      v16 = objc_opt_isKindOfClass(v14, v15);

      if ((v16 & 1) != 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAppleSupportRequest")));
        -[TermsConditionsViewController setIsAppleSupportRequest:](self, "setIsAppleSupportRequest:", objc_msgSend(v17, "BOOLValue"));
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v18 = -[TermsConditionsViewController isAppleSupportRequest](self, "isAppleSupportRequest");
          v19 = 67109120;
          LODWORD(v20) = v18;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Apple Support %d", (uint8_t *)&v19, 8u);
        }

      }
    }
    -[TermsConditionsViewController setUserInfoSet:](self, "setUserInfoSet:", 1);
  }

}

- (void)postResultNotification:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v8 = CFSTR("result");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TermsConditionsViewController helperTool](self, "helperTool"));
  sub_1000035EC(v6, v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TermsConditionsViewController helperToolConnection](self, "helperToolConnection"));
  objc_msgSend(v7, "invalidate");

  exit(0);
}

- (void)agree:(id)a3
{
  uint8_t v4[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "user agreed to T&C", v4, 2u);
  }
  -[TermsConditionsViewController postResultNotification:](self, "postResultNotification:", 1);
}

- (void)decline:(id)a3
{
  uint8_t v4[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "user declined T&C", v4, 2u);
  }
  -[TermsConditionsViewController postResultNotification:](self, "postResultNotification:", 0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSXPCConnection)helperToolConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHelperToolConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (id)helperTool
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setHelperTool:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (UILabel)termsHeaderTextView
{
  return self->_termsHeaderTextView;
}

- (void)setTermsHeaderTextView:(id)a3
{
  self->_termsHeaderTextView = (UILabel *)a3;
}

- (UILabel)termsSubHeaderTextView
{
  return self->_termsSubHeaderTextView;
}

- (void)setTermsSubHeaderTextView:(id)a3
{
  self->_termsSubHeaderTextView = (UILabel *)a3;
}

- (UITextView)termsTextView
{
  return self->_termsTextView;
}

- (void)setTermsTextView:(id)a3
{
  self->_termsTextView = (UITextView *)a3;
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (void)setToolbar:(id)a3
{
  self->_toolbar = (UIToolbar *)a3;
}

- (BOOL)isAppleSupportRequest
{
  return self->_isAppleSupportRequest;
}

- (void)setIsAppleSupportRequest:(BOOL)a3
{
  self->_isAppleSupportRequest = a3;
}

- (UIImageView)termsIcon
{
  return self->_termsIcon;
}

- (void)setTermsIcon:(id)a3
{
  self->_termsIcon = (UIImageView *)a3;
}

- (NSXPCInterface)helperToolBackChannelInterface
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 72, 1);
}

- (void)setHelperToolBackChannelInterface:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)userInfoSet
{
  return self->_userInfoSet;
}

- (void)setUserInfoSet:(BOOL)a3
{
  self->_userInfoSet = a3;
}

- (BOOL)shareSettingsRequest
{
  return self->_shareSettingsRequest;
}

- (void)setShareSettingsRequest:(BOOL)a3
{
  self->_shareSettingsRequest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helperToolBackChannelInterface, 0);
  objc_storeStrong(&self->helperTool, 0);
  objc_storeStrong((id *)&self->helperToolConnection, 0);
}

@end

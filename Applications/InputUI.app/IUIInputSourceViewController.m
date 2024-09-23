@implementation IUIInputSourceViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)IUIInputSourceViewController;
  -[IUIInputSourceViewController viewDidLoad](&v20, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IUIInputSourceViewController sessionCoordinator](self, "sessionCoordinator"));
  objc_msgSend(v3, "reloadInputSource");

  v4 = sub_1000039F4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "InputUI view did load", v19, 2u);
  }

  if (qword_1000293D8 != -1)
    dispatch_once(&qword_1000293D8, &stru_10001C808);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TIPreferencesController sharedPreferencesController](TIPreferencesController, "sharedPreferencesController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForPreferenceKey:", CFSTR("InputUIWindowDebug")));

  LODWORD(v6) = objc_msgSend(v7, "BOOLValue");
  if ((_DWORD)v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 0.0, 0.0, 0.3));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IUIInputSourceViewController view](self, "view"));
    objc_msgSend(v9, "setBackgroundColor:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[IUIInputSourceViewController view](self, "view"));
    objc_msgSend(v10, "setUserInteractionEnabled:", 0);

    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor greenColor](UIColor, "greenColor")));
    v12 = objc_msgSend(v11, "CGColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[IUIInputSourceViewController view](self, "view"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layer"));
    objc_msgSend(v14, "setBorderColor:", v12);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[IUIInputSourceViewController view](self, "view"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layer"));
    objc_msgSend(v16, "setBorderWidth:", 5.0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[IUIInputSourceViewController view](self, "view"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layer"));
    objc_msgSend(v18, "setAllowsHitTesting:", 0);

  }
}

- (IUIRTIInputSource)textInputSource
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IUIInputSourceViewController sessionCoordinator](self, "sessionCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textInputSource"));

  return (IUIRTIInputSource *)v3;
}

- (IUISessionCoordinator)sessionCoordinator
{
  return self->_sessionCoordinator;
}

- (void)setSessionCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_sessionCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionCoordinator, 0);
}

@end

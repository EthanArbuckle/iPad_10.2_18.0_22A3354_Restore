@implementation ContinuityCaptureShieldUIAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  ContinuityCaptureShieldUIAppDelegate *v15;
  __int16 v16;
  void *v17;

  v5 = sub_100007074();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
    v12 = 136315650;
    v13 = "-[ContinuityCaptureShieldUIAppDelegate application:didFinishLaunchingWithOptions:]";
    v14 = 2048;
    v15 = self;
    v16 = 2112;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s: <%p> add ui state tracker %@", (uint8_t *)&v12, 0x20u);

  }
  v8 = sub_100007074();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[ContinuityCaptureShieldUIBackgroundPauseManager sharedInstance](ContinuityCaptureShieldUIBackgroundPauseManager, "sharedInstance"));
    v12 = 136315650;
    v13 = "-[ContinuityCaptureShieldUIAppDelegate application:didFinishLaunchingWithOptions:]";
    v14 = 2048;
    v15 = self;
    v16 = 2112;
    v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s: <%p> add background pause event manager %@", (uint8_t *)&v12, 0x20u);

  }
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  __objc2_class **v11;
  void *v12;
  unsigned int v13;

  v5 = a4;
  v6 = objc_alloc((Class)UISceneConfiguration);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "role"));
  v8 = objc_msgSend(v6, "initWithName:sessionRole:", 0, v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "role"));
  v10 = objc_msgSend(v9, "isEqualToString:", UIWindowSceneSessionRoleApplication);

  if ((v10 & 1) != 0)
  {
    v11 = off_100018088;
LABEL_5:
    objc_msgSend(v8, "setDelegateClass:", objc_opt_class(*v11));
    goto LABEL_6;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "role"));
  v13 = objc_msgSend(v12, "isEqualToString:", _UIWindowSceneSessionTypeCoverSheet);

  if (v13)
  {
    v11 = &off_100018090;
    goto LABEL_5;
  }
LABEL_6:

  return v8;
}

@end

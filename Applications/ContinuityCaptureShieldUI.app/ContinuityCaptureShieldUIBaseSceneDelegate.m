@implementation ContinuityCaptureShieldUIBaseSceneDelegate

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  ContinuityCaptureShieldUIBaseSceneDelegate *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  NSObject *v31;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "allObjects", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URL"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "options"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "annotation"));
    v10 = objc_opt_class(NSDictionary);
    v11 = v9;
    v12 = v11;
    if (v10)
    {
      if ((objc_opt_isKindOfClass(v11, v10) & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
    v14 = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("kContinuityCaptureLaunchUIConfigurationKey")));
    if (v15)
    {
      v23 = 0;
      v16 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(CMContinuityCaptureUIConfiguration), v15, &v23);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = v23;
      v19 = sub_100007074();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      v21 = v20;
      if (!v17 || v18)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          v25 = "-[ContinuityCaptureShieldUIBaseSceneDelegate scene:openURLContexts:]";
          v26 = 2048;
          v27 = self;
          v28 = 2112;
          v29 = v6;
          v30 = 2112;
          v31 = v18;
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s: <%p> Launching ShieldUI via URL without a valid URL payload for the launchUIConfiguration: %@ error: %@", buf, 0x2Au);
        }
      }
      else
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v25 = "-[ContinuityCaptureShieldUIBaseSceneDelegate scene:openURLContexts:]";
          v26 = 2048;
          v27 = self;
          v28 = 2112;
          v29 = v17;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s: <%p> Launching ShieldUI with launchUIConfiguration: %@", buf, 0x20u);
        }

        v21 = objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
        -[NSObject setUIConfiguration:](v21, "setUIConfiguration:", v17);
      }

    }
    else
    {
      v22 = sub_100007074();
      v18 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_10000BC44((uint64_t)self, (uint64_t)v6, v18);
    }

  }
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  UIWindow *window;
  int v8;
  const char *v9;
  __int16 v10;
  ContinuityCaptureShieldUIBaseSceneDelegate *v11;
  __int16 v12;
  id v13;

  v4 = a3;
  v5 = sub_100007074();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315650;
    v9 = "-[ContinuityCaptureShieldUIBaseSceneDelegate sceneDidDisconnect:]";
    v10 = 2048;
    v11 = self;
    v12 = 2112;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: <%p> Called %@", (uint8_t *)&v8, 0x20u);
  }

  -[UIWindow setRootViewController:](self->_window, "setRootViewController:", 0);
  window = self->_window;
  self->_window = 0;

}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
}

@end

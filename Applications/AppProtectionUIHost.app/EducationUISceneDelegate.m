@implementation EducationUISceneDelegate

- (EducationUISceneDelegate)init
{
  EducationUISceneDelegate *v2;
  id v3;
  NSObject *v4;
  objc_super v6;
  uint8_t buf[4];
  EducationUISceneDelegate *v8;

  v6.receiver = self;
  v6.super_class = (Class)EducationUISceneDelegate;
  v2 = -[EducationUISceneDelegate init](&v6, "init");
  v3 = sub_1000052CC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "init delegate %@", buf, 0xCu);
  }

  return v2;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  EducationUISceneDelegate *v7;

  v3 = sub_1000052CC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "deallocate delegate %@", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)EducationUISceneDelegate;
  -[EducationUISceneDelegate dealloc](&v5, "dealloc");
}

- (void)connectToInvokerEndpoint:(id)a3
{
  _xpc_endpoint_s *v4;
  id v5;
  NSObject *v6;
  OS_xpc_object *v7;
  OS_xpc_object *connectionToPresenter;
  uint8_t v9[16];

  v4 = (_xpc_endpoint_s *)a3;
  v5 = sub_1000052CC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "connecting to presenter", v9, 2u);
  }

  v7 = xpc_connection_create_from_endpoint(v4);
  connectionToPresenter = self->_connectionToPresenter;
  self->_connectionToPresenter = v7;

  xpc_connection_set_event_handler(self->_connectionToPresenter, &stru_100008208);
  xpc_connection_resume(self->_connectionToPresenter);
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  char *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  char *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char *v19;
  void *v20;
  void *v21;
  void *v22;
  char *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  APEducationViewControllerSystemActionDelegate *v29;
  APEducationViewControllerSystemActionDelegate *actionDelegate;
  UIWindow *v31;
  UIWindow *window;
  objc_class *v33;
  APEducationViewController *v34;
  APEducationViewController *educationVC;
  APEducationVCPresentingViewController *v36;
  APEducationVCPresentingViewController *presentingVC;
  void *v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  char *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;

  v8 = (char *)a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_1000052CC();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v40 = "-[EducationUISceneDelegate scene:willConnectToSession:options:]";
    v41 = 2112;
    v42 = v8;
    v43 = 2112;
    v44 = v9;
    v45 = 2112;
    v46 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: %@ %@ %@", buf, 0x2Au);
  }

  v13 = objc_opt_class(SBSUIRemoteAlertScene);
  if ((objc_opt_isKindOfClass(v8, v13) & 1) != 0)
  {
    v14 = v8;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "configurationContext"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "xpcEndpoint"));

    if (v16)
      -[EducationUISceneDelegate connectToInvokerEndpoint:](self, "connectToInvokerEndpoint:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "configurationContext"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "userInfo"));
    v19 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", kCFBundleIdentifierKey));

    if (v19)
    {
      v38 = v16;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "configurationContext"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "userInfo"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("feature")));
      v23 = (char *)objc_msgSend(v22, "unsignedIntegerValue");

      v24 = sub_1000052CC();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      v26 = v25;
      if ((unint64_t)(v23 - 4) > 0xFFFFFFFFFFFFFFFCLL)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v40 = v19;
          v41 = 2048;
          v42 = v23;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "init education VC for %@ feature %lld", buf, 0x16u);
        }

        v29 = (APEducationViewControllerSystemActionDelegate *)objc_alloc_init((Class)APEducationViewControllerSystemActionDelegate);
        actionDelegate = self->_actionDelegate;
        self->_actionDelegate = v29;

        -[APEducationViewControllerSystemActionDelegate setDelegate:](self->_actionDelegate, "setDelegate:", self);
        v31 = (UIWindow *)objc_msgSend(objc_alloc((Class)UIWindow), "initWithWindowScene:", v14);
        window = self->_window;
        self->_window = v31;

        v26 = objc_claimAutoreleasedReturnValue(+[APApplication applicationWithBundleIdentifier:](APApplication, "applicationWithBundleIdentifier:", v19));
        if (v23 == (char *)2)
        {
          v33 = (objc_class *)APHideEducationViewController;
        }
        else if (v23 == (char *)1)
        {
          v33 = (objc_class *)APLockEducationViewController;
        }
        else
        {
          v33 = (objc_class *)APEducationFlowViewController;
        }
        v34 = (APEducationViewController *)objc_msgSend([v33 alloc], "initForApplication:", v26);
        educationVC = self->_educationVC;
        self->_educationVC = v34;

        -[APEducationViewController setDelegate:](self->_educationVC, "setDelegate:", self->_actionDelegate);
        v36 = (APEducationVCPresentingViewController *)objc_alloc_init((Class)APEducationVCPresentingViewController);
        presentingVC = self->_presentingVC;
        self->_presentingVC = v36;

        -[UIWindow setRootViewController:](self->_window, "setRootViewController:", self->_presentingVC);
        -[UIWindow makeKeyAndVisible](self->_window, "makeKeyAndVisible");
        objc_msgSend(v14, "setAllowsAlertStacking:", 1);
        v16 = v38;
      }
      else
      {
        v16 = v38;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          sub_1000054A0((uint64_t)v23, v26, v27);
      }
    }
    else
    {
      v28 = sub_1000052CC();
      v26 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_1000053FC(v14, v26);
    }

  }
}

- (void)sceneDidDisconnect:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;

  v3 = a3;
  v4 = sub_1000052CC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[EducationUISceneDelegate sceneDidDisconnect:]";
    v8 = 2112;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  APEducationViewController *educationVC;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  APEducationViewController *v13;

  v4 = a3;
  v5 = sub_1000052CC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    educationVC = self->_educationVC;
    v8 = 136315650;
    v9 = "-[EducationUISceneDelegate sceneDidBecomeActive:]";
    v10 = 2112;
    v11 = v4;
    v12 = 2112;
    v13 = educationVC;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %@; presenting education VC %@",
      (uint8_t *)&v8,
      0x20u);
  }

  -[APEducationVCPresentingViewController presentEducationViewController:](self->_presentingVC, "presentEducationViewController:", self->_educationVC);
}

- (void)sceneWillResignActive:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;

  v3 = a3;
  v4 = sub_1000052CC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[EducationUISceneDelegate sceneWillResignActive:]";
    v8 = 2112;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;

  v3 = a3;
  v4 = sub_1000052CC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[EducationUISceneDelegate sceneWillEnterForeground:]";
    v8 = 2112;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;

  v3 = a3;
  v4 = sub_1000052CC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[EducationUISceneDelegate sceneDidEnterBackground:]";
    v8 = 2112;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)remoteAlertScene:(id)a3 handleButtonActions:(id)a4
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;

  v4 = a3;
  v5 = sub_1000052CC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[EducationUISceneDelegate remoteAlertScene:handleButtonActions:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v7, 0x16u);
  }

}

- (void)remoteAlertSceneDidInvalidateForRemoteAlertServiceInvalidation:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;

  v3 = a3;
  v4 = sub_1000052CC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[EducationUISceneDelegate remoteAlertSceneDidInvalidateForRemoteAlertServiceInvalidation:]";
    v8 = 2112;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)remoteAlertScene:(id)a3 didTransitionToAttachedToWindowedAccessory:(BOOL)a4 windowedAccessoryCutoutFrameInScreen:(CGRect)a5
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;

  v5 = a3;
  v6 = sub_1000052CC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[EducationUISceneDelegate remoteAlertScene:didTransitionToAttachedToWindowedAccessory:windowedAccessoryCutoutFrameInScreen:]";
    v10 = 2112;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v8, 0x16u);
  }

}

- (void)systemActionDelegate:(id)a3 requestsDismissalOfEducationController:(id)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004FFC;
  v4[3] = &unk_100008258;
  v4[4] = self;
  objc_msgSend(a4, "dismissViewControllerAnimated:completion:", 1, v4);
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
  objc_storeStrong((id *)&self->_connectionToPresenter, 0);
  objc_storeStrong((id *)&self->_presentingVC, 0);
  objc_storeStrong((id *)&self->_educationVC, 0);
  objc_storeStrong((id *)&self->_actionDelegate, 0);
}

@end

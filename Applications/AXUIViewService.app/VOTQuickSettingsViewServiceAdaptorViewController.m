@implementation VOTQuickSettingsViewServiceAdaptorViewController

- (void)viewDidLoad
{
  VOTQuickSettingsViewController *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VOTQuickSettingsViewServiceAdaptorViewController;
  -[VOTQuickSettingsViewServiceAdaptorViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = objc_alloc_init(VOTQuickSettingsViewController);
  -[VOTQuickSettingsViewServiceAdaptorViewController setRootViewController:](self, "setRootViewController:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsViewServiceAdaptorViewController rootViewController](self, "rootViewController"));
  objc_msgSend(v4, "setDelegate:", self);

}

- (void)viewDidAppear:(BOOL)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VOTQuickSettingsViewServiceAdaptorViewController;
  -[VOTQuickSettingsViewServiceAdaptorViewController viewDidAppear:](&v9, "viewDidAppear:", a3);
  -[VOTQuickSettingsViewServiceAdaptorViewController _setupRemoteProxy](self, "_setupRemoteProxy");
  v4 = objc_alloc((Class)UINavigationController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsViewServiceAdaptorViewController rootViewController](self, "rootViewController"));
  v6 = objc_msgSend(v4, "initWithRootViewController:", v5);

  objc_msgSend(v6, "setModalPresentationStyle:", 2);
  objc_msgSend(v6, "setModalTransitionStyle:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsViewServiceAdaptorViewController rootViewController](self, "rootViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentationController"));
  objc_msgSend(v8, "setDelegate:", v7);

  -[VOTQuickSettingsViewServiceAdaptorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, &stru_100024700);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VOTQuickSettingsViewServiceAdaptorViewController;
  -[VOTQuickSettingsViewServiceAdaptorViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[VOTQuickSettingsViewServiceAdaptorViewController _dismiss](self, "_dismiss");
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = VOTLogQuickSettings();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_10001324C((uint64_t)self, (uint64_t)v6, v9, v10);

  if (v7)
    v7[2](v7);

}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  id v22;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = VOTLogQuickSettings();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_100013370((uint64_t)self, v6, v9, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("data")));

  v22 = 0;
  v16 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(AXQuickSettingsData, v13, v14, v15), v12, &v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = v22;
  if (v18)
  {
    v19 = AXLogCommon();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_1000132FC((uint64_t)v18, v20);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsViewServiceAdaptorViewController rootViewController](self, "rootViewController"));
  objc_msgSend(v21, "setData:", v17);

  if (v7)
    v7[2](v7);

}

- (void)_setupRemoteProxy
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsViewServiceAdaptorViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v2, "setDismissalAnimationStyle:", 2);
  objc_msgSend(v2, "setOrientationChangedEventsEnabled:", 0);
  objc_msgSend(v2, "setAllowsMenuButtonDismissal:", 1);
  objc_msgSend(v2, "setWallpaperTunnelActive:", 0);

}

- (void)_dismiss
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100003A24;
  v2[3] = &unk_100024748;
  v2[4] = self;
  -[VOTQuickSettingsViewServiceAdaptorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v2);
}

- (VOTQuickSettingsViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_rootViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootViewController, 0);
}

@end

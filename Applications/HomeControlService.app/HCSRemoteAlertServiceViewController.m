@implementation HCSRemoteAlertServiceViewController

- (void)viewDidLoad
{
  HCSRemoteViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HCSRemoteAlertServiceViewController;
  -[HCSRemoteAlertServiceViewController viewDidLoad](&v11, "viewDidLoad");
  v3 = objc_alloc_init(HCSRemoteViewController);
  -[HCSRemoteAlertServiceViewController setRemoteViewController:](self, "setRemoteViewController:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteAlertServiceViewController remoteViewController](self, "remoteViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v5, "setClipsToBounds:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteAlertServiceViewController remoteViewController](self, "remoteViewController"));
  -[HCSRemoteAlertServiceViewController addChildViewController:](self, "addChildViewController:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteAlertServiceViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteAlertServiceViewController remoteViewController](self, "remoteViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v7, "addSubview:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteAlertServiceViewController remoteViewController](self, "remoteViewController"));
  objc_msgSend(v10, "didMoveToParentViewController:", self);

}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v5;
  NSObject *v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  HCSRemoteAlertServiceViewController *v21;
  __int16 v22;
  void *v23;

  v19.receiver = self;
  v19.super_class = (Class)HCSRemoteAlertServiceViewController;
  -[HCSRemoteAlertServiceViewController viewWillAppear:](&v19, "viewWillAppear:", a3);
  v5 = HFLogForCategory(70);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    *(_DWORD *)buf = 138412546;
    v21 = self;
    v22 = 2112;
    v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);

  }
  v9 = HFLogForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138412546;
    v21 = self;
    v22 = 2112;
    v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: %@ Disabling idle timer", buf, 0x16u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteAlertServiceViewController remoteViewController](self, "remoteViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "serviceContext"));
  v15 = objc_msgSend(v14, "serviceType");

  if (v15 == (id)2)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteAlertServiceViewController remoteViewController](self, "remoteViewController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "serviceContext"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "remoteViewControllerProxy"));
    objc_msgSend(v18, "setIdleTimerDisabled:forReason:", 1, CFSTR("DropIn"));

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v5;
  NSObject *v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  HCSRemoteAlertServiceViewController *v21;
  __int16 v22;
  void *v23;

  v19.receiver = self;
  v19.super_class = (Class)HCSRemoteAlertServiceViewController;
  -[HCSRemoteAlertServiceViewController viewWillDisappear:](&v19, "viewWillDisappear:", a3);
  v5 = HFLogForCategory(70);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    *(_DWORD *)buf = 138412546;
    v21 = self;
    v22 = 2112;
    v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);

  }
  v9 = HFLogForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138412546;
    v21 = self;
    v22 = 2112;
    v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: %@ Enabling idle timer", buf, 0x16u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteAlertServiceViewController remoteViewController](self, "remoteViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "serviceContext"));
  v15 = objc_msgSend(v14, "serviceType");

  if (v15 == (id)2)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteAlertServiceViewController remoteViewController](self, "remoteViewController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "serviceContext"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "remoteViewControllerProxy"));
    objc_msgSend(v18, "setIdleTimerDisabled:forReason:", 0, CFSTR("DropIn"));

  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  CGFloat v4;
  void *v5;
  CGFloat v6;
  void *v7;
  void *v8;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  v9.receiver = self;
  v9.super_class = (Class)HCSRemoteAlertServiceViewController;
  -[HCSRemoteAlertServiceViewController viewWillLayoutSubviews](&v9, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteAlertServiceViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v4 = CGRectGetWidth(v10) * 0.5;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteAlertServiceViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  v6 = CGRectGetHeight(v11) * 0.5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteAlertServiceViewController remoteViewController](self, "remoteViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  objc_msgSend(v8, "setCenter:", v4, v6);

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteAlertServiceViewController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v2, "userInterfaceIdiom") == (id)1)
    v3 = 30;
  else
    v3 = 2;

  return v3;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  objc_super v16;
  _QWORD v17[5];
  uint8_t buf[4];
  HCSRemoteAlertServiceViewController *v19;
  __int16 v20;
  void *v21;

  v7 = a3;
  v8 = a4;
  v9 = HFLogForCategory(34);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
    *(_DWORD *)buf = 138412546;
    v19 = self;
    v20 = 2112;
    v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ Configure remote view service with userInfo: %@", buf, 0x16u);

  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100003990;
  v17[3] = &unk_100008290;
  v17[4] = a2;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteAlertServiceViewController _remoteViewControllerProxyWithErrorHandler:](self, "_remoteViewControllerProxyWithErrorHandler:", v17));
  if (v12)
  {
    v13 = objc_msgSend(objc_alloc((Class)HUHomeControlServiceContext), "initWithAlertConfigurationContext:", v7);
    -[NSObject setRemoteViewControllerProxy:](v13, "setRemoteViewControllerProxy:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HCSRemoteAlertServiceViewController remoteViewController](self, "remoteViewController"));
    objc_msgSend(v14, "configureHomeControlServiceWithContext:", v13);

    objc_msgSend(v12, "setAllowsBanners:", 1);
    objc_msgSend(v12, "setAllowsAlertItems:", 1);
    objc_msgSend(v12, "setAllowsControlCenter:", 1);
    objc_msgSend(v12, "setAllowsSiri:", 1);
    objc_msgSend(v12, "setDismissalAnimationStyle:", 0);
    objc_msgSend(v12, "setAllowsMenuButtonDismissal:", 1);
    objc_msgSend(v12, "setDesiredHardwareButtonEvents:", 16);
    if (-[NSObject serviceType](v13, "serviceType") == (id)1 || -[NSObject serviceType](v13, "serviceType") == (id)2)
    {
      objc_msgSend(v12, "setAllowsMenuButtonDismissal:", 0);
      objc_msgSend(v12, "setAllowsControlCenter:", 0);
      objc_msgSend(v12, "setAllowsAlertStacking:", 1);
      objc_msgSend(v12, "setStatusBarHidden:withDuration:", 1, -1.0);
      objc_msgSend(v12, "setWallpaperStyle:withDuration:", 2, -1.0);
    }
    v16.receiver = self;
    v16.super_class = (Class)HCSRemoteAlertServiceViewController;
    -[HCSRemoteAlertServiceViewController configureWithContext:completion:](&v16, "configureWithContext:completion:", v7, v8);
  }
  else
  {
    v15 = HFLogForCategory(34);
    v13 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100003E44(a2, v13);
  }

}

- (void)handleButtonActions:(id)a3
{
  id v4;
  int v5;
  double v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100003B54;
  v9[3] = &unk_1000082B8;
  v9[4] = &v14;
  v9[5] = &v10;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
  v5 = *((unsigned __int8 *)v11 + 24);
  if (!*((_BYTE *)v15 + 24))
  {
    if (!*((_BYTE *)v11 + 24))
      goto LABEL_7;
    v5 = 1;
  }
  v6 = 0.0;
  v7[4] = self;
  v8[0] = _NSConcreteStackBlock;
  if (!v5)
    v6 = 0.5;
  v8[1] = 3221225472;
  v8[2] = sub_100003C48;
  v8[3] = &unk_1000082E0;
  v8[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100003D1C;
  v7[3] = &unk_100008308;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v8, v7, v6, 0.0);
LABEL_7:
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  void *v6;
  void (**v7)(void);

  v7 = (void (**)(void))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "reason"));
  -[HCSRemoteAlertServiceViewController setActivationReason:](self, "setActivationReason:", v6);

  v7[2]();
}

- (NSString)activationReason
{
  return self->_activationReason;
}

- (void)setActivationReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isWakingToLockScreen
{
  return self->_isWakingToLockScreen;
}

- (HCSRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_activationReason, 0);
}

@end

@implementation NearbyDevicesRemoteViewController

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NearbyDevicesRemoteViewController;
  -[NearbyDevicesRemoteViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  -[NearbyDevicesRemoteViewController _setupRemoteProxy](self, "_setupRemoteProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NearbyDevicesRemoteViewController navigationController](self, "navigationController"));
  -[NearbyDevicesRemoteViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, &stru_100004160);

}

- (void)_dismissViewService
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100001A00;
  v2[3] = &unk_100004188;
  v2[4] = self;
  -[NearbyDevicesRemoteViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v2);
}

- (void)_nearbyDevicesNavigationControllerDidDismiss
{
  -[NearbyDevicesRemoteViewController _dismiss](self, "_dismiss");
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
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  _NearbyDevicesNavigationController *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = ax_remote_general_log();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class(self);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v20 = 138412802;
    v21 = v12;
    v22 = 2112;
    v23 = v6;
    v24 = 2112;
    v25 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ - Did prepare for alert activation context: %@, userInfo: %@", (uint8_t *)&v20, 0x20u);

  }
  v14 = (void *)objc_opt_new(AXRNearbyDevicesViewController);
  v15 = -[_NearbyDevicesNavigationController initWithRootViewController:]([_NearbyDevicesNavigationController alloc], "initWithRootViewController:", v14);
  -[NearbyDevicesRemoteViewController setNavigationController:](self, "setNavigationController:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NearbyDevicesRemoteViewController navigationController](self, "navigationController"));
  objc_msgSend(v16, "setDismissObserver:", self);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NearbyDevicesRemoteViewController navigationController](self, "navigationController"));
  objc_msgSend(v17, "setModalPresentationStyle:", 1);

  v18 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 24, self, "_dismissViewService");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "navigationItem"));
  objc_msgSend(v19, "setRightBarButtonItem:", v18);

  if (v7)
    v7[2](v7);

}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  NSObject *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = ax_remote_general_log();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class(self);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v14 = 138412802;
    v15 = v12;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ - Did configure with alert configuration context : %@, userInfo : %@", (uint8_t *)&v14, 0x20u);

  }
  if (v7)
    v7[2](v7);

}

- (void)_setupRemoteProxy
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[NearbyDevicesRemoteViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v2, "setWallpaperTunnelActive:", 0);
  objc_msgSend(v2, "setWallpaperStyle:withDuration:", 0, 0.3);

}

- (void)_dismiss
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[NearbyDevicesRemoteViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v2, "deactivate");
  objc_msgSend(v2, "invalidate");
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1000041A8);

}

- (_NearbyDevicesNavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
}

@end

@implementation SSSDittoRemoteViewController

- (void)_addRootViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SSSDittoRemoteViewController addChildViewController:](self, "addChildViewController:", self->_rootViewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRootViewController view](self->_rootViewController, "view"));
  objc_msgSend(v3, "addSubview:", v4);

  -[SSSDittoRootViewController didMoveToParentViewController:](self->_rootViewController, "didMoveToParentViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRootViewController view](self->_rootViewController, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteViewController view](self, "view"));
  objc_msgSend(v6, "frame");
  objc_msgSend(v5, "setFrame:");

  -[SSSDittoRootViewController setDelegate:](self->_rootViewController, "setDelegate:", self);
}

- (void)_performDismiss
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteViewController viewControllerManager](self, "viewControllerManager"));
  objc_msgSend(v2, "screenshotsDismissed");

}

- (void)dittoRootViewController:(id)a3 willTransitionToState:(unint64_t)a4 changeBlock:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a5;
  v9 = v8;
  if (a4 == 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteViewController viewControllerManager](self, "viewControllerManager"));
    objc_msgSend(v10, "moveFromRemoteViewControllerToRemoteAlertViewControllerExecutingChangeBlockWhenReady:", v9);

  }
  else if (v8)
  {
    (*((void (**)(id))v8 + 2))(v8);
  }

}

- (void)dittoRootViewController:(id)a3 willShowShowSharingUIWithBlock:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteViewController viewControllerManager](self, "viewControllerManager"));
  objc_msgSend(v6, "moveFromRemoteViewControllerToRemoteAlertViewControllerExecutingChangeBlockWhenReady:", v5);

}

- (void)dittoRootViewController:(id)a3 willShowTestFlightUIWithBlock:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteViewController viewControllerManager](self, "viewControllerManager"));
  objc_msgSend(v6, "moveFromRemoteViewControllerToRemoteAlertViewControllerExecutingChangeBlockWhenReady:", v5);

}

- (void)becomeParentOfDittoRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_rootViewController, a3);
  -[SSSDittoRemoteViewController _addRootViewController](self, "_addRootViewController");
}

- (void)stopBeingParentOfDittoRootViewController:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(v4, "willMoveToParentViewController:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v3, "removeFromSuperview");

  objc_msgSend(v4, "removeFromParentViewController");
}

- (void)cleanupRootViewController
{
  SSSDittoRootViewController *rootViewController;

  -[SSSDittoRootViewController setDelegate:](self->_rootViewController, "setDelegate:", 0);
  rootViewController = self->_rootViewController;
  self->_rootViewController = 0;

}

- (SSSDittoRootViewController)rootViewController
{
  return self->_rootViewController;
}

- (SSSDittoRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SSSDittoRemoteViewController *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSSDittoRemoteViewController;
  v4 = -[SSSDittoRemoteViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", v4, "_statusBarHeightChanged", UIApplicationStatusBarHeightChangedNotification, 0);

  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SSSDittoRemoteViewController;
  -[SSSDittoRemoteViewController dealloc](&v4, "dealloc");
}

- (void)_statusBarHeightChanged
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "screen"));
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "window"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "screen"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "coordinateSpace"));
  objc_msgSend(v14, "convertRect:fromCoordinateSpace:", v18, v7, v9, v11, v13);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  v27 = (id)objc_claimAutoreleasedReturnValue(-[SSSDittoRootViewController view](self->_rootViewController, "view"));
  objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);

}

- (id)loadedView
{
  return -[SSSDittoRemoteViewController viewIfLoaded](self, "viewIfLoaded");
}

- (void)loadView
{
  SSSDittoRemoteView *v3;

  v3 = objc_opt_new(SSSDittoRemoteView);
  -[SSSDittoRemoteViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSSDittoRemoteViewController;
  -[SSSDittoRemoteViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor greenColor](UIColor, "greenColor"));
  SSApplyDebuggingCustomizationsToViewIfAppropriate(v3, v4, 20.0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSSDittoRemoteViewController;
  -[SSSDittoRemoteViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteViewController loadedView](self, "loadedView"));
  objc_msgSend(v4, "setAcceptsTouches:", 1);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSSDittoRemoteViewController;
  -[SSSDittoRemoteViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("SSSDittoRemoteViewControllerIsReadyForViewControllerManagerNotificationName"), self);

}

- (void)setViewControllerManager:(id)a3
{
  objc_storeWeak((id *)&self->_viewControllerManager, a3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SSSDittoRemoteViewController;
  v7 = a4;
  -[SSSDittoRemoteViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100049D2C;
  v8[3] = &unk_100092CD8;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (id)childViewControllerForStatusBarStyle
{
  return -[SSSDittoRootViewController childViewControllerForStatusBarStyle](self->_rootViewController, "childViewControllerForStatusBarStyle");
}

- (id)childViewControllerForStatusBarHidden
{
  return -[SSSDittoRootViewController childViewControllerForStatusBarHidden](self->_rootViewController, "childViewControllerForStatusBarHidden");
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (void)informHostThatScreenshotsHaveDismissed
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v3 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Service informing host that the screenshot experience dismissed", v6, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v4, "screenshotExperienceHasDismissed");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "dismiss");

}

- (void)tearDownScreenshotExperience
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Service received request to tear down screenshot experience", v5, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteViewController viewControllerManager](self, "viewControllerManager"));
  objc_msgSend(v4, "dismissScreenshots");

}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SSRemoteViewControllerServiceToHostInterface);
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SSRemoteViewControllerHostToServiceInterface);
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SSSViewControllerManager)viewControllerManager
{
  return (SSSViewControllerManager *)objc_loadWeakRetained((id *)&self->_viewControllerManager);
}

- (BOOL)willSoonUnparentChildDittoRootViewController
{
  return self->_willSoonUnparentChildDittoRootViewController;
}

- (void)setWillSoonUnparentChildDittoRootViewController:(BOOL)a3
{
  self->_willSoonUnparentChildDittoRootViewController = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_destroyWeak((id *)&self->_viewControllerManager);
}

@end

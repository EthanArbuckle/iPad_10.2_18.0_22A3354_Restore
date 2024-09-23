@implementation AXSBUIAudiographRootViewController

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void (**v10)(void);

  v10 = (void (**)(void))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc((Class)AXMChartDescriptor), "initWithDictionary:", v6);
    -[AXSBUIAudiographRootViewController setChartDescriptor:](self, "setChartDescriptor:", v7);

  }
  else
  {
    -[AXSBUIAudiographRootViewController setChartDescriptor:](self, "setChartDescriptor:", 0);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXSBUIAudiographRootViewController chartDescriptor](self, "chartDescriptor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXAudiographExplorerProvider makeAudiographExplorerView:](AXAudiographExplorerProvider, "makeAudiographExplorerView:", v8));
  -[AXSBUIAudiographRootViewController setHostingController:](self, "setHostingController:", v9);

  if (v10)
    v10[2]();

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXSBUIAudiographRootViewController;
  -[AXSBUIAudiographRootViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "selectedSeriesChanged:", CFSTR("AudiographExplorerSelectedSeriesChanged"), 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "toggleAudiographPlaybackState:", CFSTR("ToggleAudiographPlaybackState"), 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  _UNKNOWN **v7;
  AXSBUIAudiographNavigationController *v8;
  void *v9;
  AXSBUIAudiographNavigationController *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)AXSBUIAudiographRootViewController;
  -[AXSBUIAudiographRootViewController viewDidAppear:](&v21, "viewDidAppear:", a3);
  -[AXSBUIAudiographRootViewController _setupRemoteProxy](self, "_setupRemoteProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXSBUIAudiographRootViewController chartDescriptor](self, "chartDescriptor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "series"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 <= 1)
    v7 = &off_100025FB0;
  else
    v7 = &off_100025F98;
  UIAccessibilityPostNotification(0x432u, v7);
  v8 = [AXSBUIAudiographNavigationController alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXSBUIAudiographRootViewController hostingController](self, "hostingController"));
  v10 = -[AXSBUIAudiographNavigationController initWithRootViewController:](v8, "initWithRootViewController:", v9);

  -[AXSBUIAudiographNavigationController setDismissDelegate:](v10, "setDismissDelegate:", self);
  v11 = sub_10000DC74(CFSTR("AXAudiographExplorer.title"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AXSBUIAudiographRootViewController hostingController](self, "hostingController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "navigationItem"));
  objc_msgSend(v14, "setTitle:", v12);

  v15 = objc_alloc((Class)UIBarButtonItem);
  v16 = sub_10000DC74(CFSTR("AXAudiographExplorer.done"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = objc_msgSend(v15, "initWithTitle:style:target:action:", v17, 2, self, "dismiss");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[AXSBUIAudiographRootViewController hostingController](self, "hostingController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "navigationItem"));
  objc_msgSend(v20, "setRightBarButtonItem:", v18);

  -[AXSBUIAudiographRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 0, 0);
}

- (void)selectedSeriesChanged:(id)a3
{
  void *v3;
  void *v4;
  id argument;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  argument = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("seriesIndex")));

  v4 = argument;
  if (argument)
  {
    UIAccessibilityPostNotification(0x432u, argument);
    v4 = argument;
  }

}

- (void)toggleAudiographPlaybackState:(id)a3
{
  void *v3;
  void *v4;
  id argument;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  argument = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("shouldPlay")));

  v4 = argument;
  if (argument)
  {
    UIAccessibilityPostNotification(0x433u, argument);
    v4 = argument;
  }

}

- (void)dismiss
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100012478;
  v2[3] = &unk_100024748;
  v2[4] = self;
  -[AXSBUIAudiographRootViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, v2);
}

- (void)_setupRemoteProxy
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AXSBUIAudiographRootViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v2, "setOrientationChangedEventsEnabled:", 0);
  objc_msgSend(v2, "setAllowsMenuButtonDismissal:", 1);
  objc_msgSend(v2, "setWallpaperTunnelActive:", 1);
  objc_msgSend(v2, "setWallpaperStyle:withDuration:", 4, 0.3);
  objc_msgSend(v2, "setStatusBarHidden:withDuration:", 1, 0.3);

}

- (BOOL)accessibilityPostScreenChangedForChildViewController:(id)a3 isAddition:(BOOL)a4
{
  return a4;
}

- (AXMChartDescriptor)chartDescriptor
{
  return self->_chartDescriptor;
}

- (void)setChartDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_chartDescriptor, a3);
}

- (UIViewController)hostingController
{
  return self->_hostingController;
}

- (void)setHostingController:(id)a3
{
  objc_storeStrong((id *)&self->_hostingController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingController, 0);
  objc_storeStrong((id *)&self->_chartDescriptor, 0);
}

@end

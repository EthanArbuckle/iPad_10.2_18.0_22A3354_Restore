@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = objc_alloc((Class)UINavigationController);
  v6 = (void *)objc_opt_new(AXRNearbyDevicesViewController);
  v7 = objc_msgSend(v5, "initWithRootViewController:", v6);

  v8 = objc_alloc((Class)UIWindow);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v9, "bounds");
  v10 = objc_msgSend(v8, "initWithFrame:");
  -[AppDelegate setWindow:](self, "setWindow:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate window](self, "window"));
  objc_msgSend(v12, "setBackgroundColor:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate window](self, "window"));
  objc_msgSend(v13, "setRootViewController:", v7);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate window](self, "window"));
  objc_msgSend(v14, "makeKeyAndVisible");

  return 1;
}

- (void)applicationWillResignActive:(id)a3
{
  objc_msgSend(UIApp, "terminateWithSuccess", a3);
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

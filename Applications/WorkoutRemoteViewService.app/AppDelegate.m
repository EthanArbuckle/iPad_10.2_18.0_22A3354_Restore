@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  UIViewController *v10;
  void *v11;
  void *v12;

  v5 = objc_alloc((Class)UIWindow);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v6, "bounds");
  v7 = objc_msgSend(v5, "initWithFrame:");
  -[AppDelegate setWindow:](self, "setWindow:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate window](self, "window"));
  objc_msgSend(v9, "setBackgroundColor:", v8);

  v10 = objc_opt_new(UIViewController);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate window](self, "window"));
  objc_msgSend(v11, "setRootViewController:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate window](self, "window"));
  objc_msgSend(v12, "makeKeyAndVisible");

  return 1;
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

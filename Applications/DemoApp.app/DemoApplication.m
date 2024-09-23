@implementation DemoApplication

- (void)applicationDidFinishLaunching:(id)a3
{
  id v4;
  void *v5;
  UIWindow *v6;
  UIWindow *window;
  DemoPlayerViewController *v8;
  DemoPlayerViewController *playerViewController;

  v4 = objc_alloc((Class)UIWindow);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v5, "bounds");
  v6 = (UIWindow *)objc_msgSend(v4, "initWithFrame:");
  window = self->_window;
  self->_window = v6;

  v8 = -[DemoPlayerViewController initWithNibName:bundle:]([DemoPlayerViewController alloc], "initWithNibName:bundle:", 0, 0);
  playerViewController = self->_playerViewController;
  self->_playerViewController = v8;

  -[UIWindow setRootViewController:](self->_window, "setRootViewController:", self->_playerViewController);
  -[UIWindow makeKeyAndVisible](self->_window, "makeKeyAndVisible");
}

- (void)applicationDidEnterBackground:(id)a3
{
  -[DemoApplication terminateWithSuccess](self, "terminateWithSuccess", a3);
}

- (void)sendEvent:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DemoApplication;
  v4 = a3;
  -[DemoApplication sendEvent:](&v6, "sendEvent:", v4);
  v5 = objc_msgSend(v4, "type", v6.receiver, v6.super_class);

  if (!v5)
    -[DemoApplication suspend](self, "suspend");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end

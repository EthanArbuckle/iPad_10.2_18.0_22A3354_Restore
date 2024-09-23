@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  id v5;
  AAUIViewServiceURLHandler *v6;
  unsigned __int8 v7;

  v5 = a4;
  v6 = objc_alloc_init(AAUIViewServiceURLHandler);
  v7 = -[AAUIViewServiceURLHandler handleUniversalLinkInUserActivity:](v6, "handleUniversalLinkInUserActivity:", v5);

  return v7;
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

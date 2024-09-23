@implementation Application

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v6;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return 1;
}

- (void)applicationWillTerminate:(id)a3
{
  SetupController *v3;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[BuddyApplicationAndSceneSharedStorage setupController](BuddyApplicationAndSceneSharedStorage, "setupController");
  -[SetupController willTerminate](v3, "willTerminate");

  objc_storeStrong(location, 0);
}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  UIDevice *v5;
  id v6;
  id v8;
  id location[3];
  unint64_t v10;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v5 = +[UIDevice currentDevice](UIDevice, "currentDevice");
  v6 = -[UIDevice userInterfaceIdiom](v5, "userInterfaceIdiom");

  if (v6 == (id)1)
    v10 = 30;
  else
    v10 = 2;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v10;
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

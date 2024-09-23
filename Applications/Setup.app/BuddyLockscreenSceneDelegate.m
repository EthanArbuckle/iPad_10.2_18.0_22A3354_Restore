@implementation BuddyLockscreenSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7;
  uint64_t v8;
  NSAssertionHandler *v9;
  SetupController *v10;
  BuddyMiscState *v11;
  UIWindow *v12;
  id v13;
  UIWindow *v14;
  id v15;
  UIWindow *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id location;
  SEL v22;
  BuddyLockscreenSceneDelegate *v23;

  v23 = self;
  v22 = a2;
  location = 0;
  objc_storeStrong(&location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  v19 = 0;
  objc_storeStrong(&v19, a5);
  v7 = location;
  v8 = objc_opt_class(UIWindowScene);
  if (((objc_opt_isKindOfClass(v7, v8) ^ 1) & 1) != 0)
  {
    v9 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v9, "handleFailureInMethod:object:file:lineNumber:description:", v22, v23, CFSTR("BuddyLockscreenSceneDelegate.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[scene isKindOfClass:[UIWindowScene class]]"));

  }
  v18 = location;
  v10 = +[BuddyApplicationAndSceneSharedStorage setupController](BuddyApplicationAndSceneSharedStorage, "setupController");
  v11 = -[SetupController miscState](v10, "miscState");
  v17 = -[BuddyMiscState migrationLockscreenController](v11, "migrationLockscreenController");

  v12 = -[BuddyLockscreenSceneDelegate lockscreenWindow](v23, "lockscreenWindow");
  LOBYTE(v10) = v12 == 0;

  if ((v10 & 1) != 0)
  {
    v13 = objc_msgSend(objc_alloc((Class)sub_1001978F0()), "initWithWindowScene:", v18);
    -[BuddyLockscreenSceneDelegate setLockscreenWindow:](v23, "setLockscreenWindow:", v13);

  }
  v14 = -[BuddyLockscreenSceneDelegate lockscreenWindow](v23, "lockscreenWindow");
  v15 = objc_msgSend(v17, "navigationController");
  -[UIWindow setRootViewController:](v14, "setRootViewController:", v15);

  v16 = -[BuddyLockscreenSceneDelegate lockscreenWindow](v23, "lockscreenWindow");
  -[UIWindow makeKeyAndVisible](v16, "makeKeyAndVisible");

  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&location, 0);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v3;
  uint64_t v4;
  NSAssertionHandler *v5;
  UIWindow *v6;
  UIWindowScene *v7;
  UIWindowScene *v8;
  UIWindow *v9;
  id location;
  SEL v11;
  BuddyLockscreenSceneDelegate *v12;

  v12 = self;
  v11 = a2;
  location = 0;
  objc_storeStrong(&location, a3);
  v3 = location;
  v4 = objc_opt_class(UIWindowScene);
  if (((objc_opt_isKindOfClass(v3, v4) ^ 1) & 1) != 0)
  {
    v5 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v5, "handleFailureInMethod:object:file:lineNumber:description:", v11, v12, CFSTR("BuddyLockscreenSceneDelegate.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[scene isKindOfClass:[UIWindowScene class]]"));

  }
  v6 = -[BuddyLockscreenSceneDelegate lockscreenWindow](v12, "lockscreenWindow");
  v7 = -[UIWindow windowScene](v6, "windowScene");
  v8 = (UIWindowScene *)location;

  if (v7 == v8)
  {
    v9 = -[BuddyLockscreenSceneDelegate lockscreenWindow](v12, "lockscreenWindow");
    -[UIWindow setHidden:](v9, "setHidden:", 1);

    -[BuddyLockscreenSceneDelegate setLockscreenWindow:](v12, "setLockscreenWindow:", 0);
  }
  objc_storeStrong(&location, 0);
}

- (UIWindow)lockscreenWindow
{
  return self->_lockscreenWindow;
}

- (void)setLockscreenWindow:(id)a3
{
  objc_storeStrong((id *)&self->_lockscreenWindow, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockscreenWindow, 0);
}

@end

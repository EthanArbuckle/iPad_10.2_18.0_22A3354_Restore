@implementation BuddyMigrationLockscreenController

- (BuddyMigrationLockscreenController)initWithProgressTitle:(id)a3
{
  id v3;
  BuddyMigrationLockscreenController *v4;
  BuddyMigrationLockscreenProgressController *v5;
  BuddyMigrationLockscreenProgressController *v6;
  void *v7;
  dispatch_queue_t v8;
  void *v9;
  BuddyMigrationLockscreenController *v10;
  objc_super v12;
  id location[2];
  id v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v14;
  v14 = 0;
  v12.receiver = v3;
  v12.super_class = (Class)BuddyMigrationLockscreenController;
  v4 = -[BuddyMigrationLockscreenController init](&v12, "init");
  v14 = v4;
  objc_storeStrong(&v14, v4);
  if (v4)
  {
    v5 = [BuddyMigrationLockscreenProgressController alloc];
    v6 = -[BuddyMigrationLockscreenProgressController initWithTitle:detailText:icon:](v5, "initWithTitle:detailText:icon:", location[0], 0, 0);
    v7 = (void *)*((_QWORD *)v14 + 4);
    *((_QWORD *)v14 + 4) = v6;

    *((_QWORD *)v14 + 6) = 0;
    v8 = dispatch_queue_create("Disconnection Queue", 0);
    v9 = (void *)*((_QWORD *)v14 + 5);
    *((_QWORD *)v14 + 5) = v8;

  }
  v10 = (BuddyMigrationLockscreenController *)v14;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v14, 0);
  return v10;
}

- (void)setProgressTitle:(id)a3
{
  BuddyMigrationLockscreenProgressController *v3;
  id location[2];
  BuddyMigrationLockscreenController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyMigrationLockscreenController progressController](v5, "progressController");
  -[BuddyMigrationLockscreenProgressController setTitle:](v3, "setTitle:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)activate
{
  BuddyMigrationNavigationController *v2;
  BuddyMigrationLockscreenProgressController *v3;
  NSArray *v4;
  BuddyMigrationNavigationController *v5;
  id v6;
  BuddyMigrationNavigationController *v7;
  id v8;
  BuddyMigrationLockscreenProgressController *v11;

  v2 = objc_alloc_init(BuddyMigrationNavigationController);
  -[BuddyMigrationLockscreenController setNavigationController:](self, "setNavigationController:", v2, a2);

  v3 = -[BuddyMigrationLockscreenController progressController](self, "progressController");
  v11 = v3;
  v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1);
  v5 = -[BuddyMigrationLockscreenController navigationController](self, "navigationController");
  -[BuddyMigrationNavigationController setViewControllers:](v5, "setViewControllers:", v4);

  v6 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  v7 = -[BuddyMigrationLockscreenController navigationController](self, "navigationController");
  objc_msgSend(v6, "applyThemeToNavigationController:", v7);

  v8 = +[SBSSecureAppAssertion acquireSecureAppAssertionWithType:errorHandler:](SBSSecureAppAssertion, "acquireSecureAppAssertionWithType:errorHandler:", 10, &stru_100283770);
  -[BuddyMigrationLockscreenController setAssertion:](self, "setAssertion:", v8);

}

- (void)deactivate
{
  SBSSecureAppAssertion *v2;

  v2 = -[BuddyMigrationLockscreenController assertion](self, "assertion", a2);
  -[SBSSecureAppAssertion invalidate](v2, "invalidate");

  -[BuddyMigrationLockscreenController setAssertion:](self, "setAssertion:", 0);
}

- (void)deviceMigrationManager:(id)a3 didChangeConnectionInformation:(id)a4
{
  BuddyMigrationLockscreenProgressController *v5;
  NSObject *v6;
  void **v7;
  int v8;
  int v9;
  void (*v10)(id *);
  void *v11;
  id v12;
  BuddyMigrationLockscreenController *v13;
  id v14;
  id location[2];
  BuddyMigrationLockscreenController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v5 = -[BuddyMigrationLockscreenController progressController](v16, "progressController");
  -[BuddyMigrationLockscreenProgressController deviceMigrationManager:didChangeConnectionInformation:](v5, "deviceMigrationManager:didChangeConnectionInformation:", location[0], v14);

  v6 = -[BuddyMigrationLockscreenController disconnectionQueue](v16, "disconnectionQueue");
  v7 = _NSConcreteStackBlock;
  v8 = -1073741824;
  v9 = 0;
  v10 = sub_10014EA20;
  v11 = &unk_100280D00;
  v12 = v14;
  v13 = v16;
  dispatch_async(v6, &v7);

  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)deviceMigrationManager:(id)a3 didCompleteWithError:(id)a4
{
  BuddyMigrationLockscreenProgressController *v5;
  id v6;
  id location[2];
  BuddyMigrationLockscreenController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5 = -[BuddyMigrationLockscreenController progressController](v8, "progressController");
  -[BuddyMigrationLockscreenProgressController deviceMigrationManager:didCompleteWithError:](v5, "deviceMigrationManager:didCompleteWithError:", location[0], v6);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)deviceMigrationManager:(id)a3 didUpdateProgress:(id)a4
{
  BuddyMigrationLockscreenProgressController *v5;
  id v6;
  id location[2];
  BuddyMigrationLockscreenController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5 = -[BuddyMigrationLockscreenController progressController](v8, "progressController");
  -[BuddyMigrationLockscreenProgressController deviceMigrationManager:didUpdateProgress:](v5, "deviceMigrationManager:didUpdateProgress:", location[0], v6);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (BuddyMigrationNavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (SBSSecureAppAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_assertion, a3);
}

- (BuddyMigrationLockscreenDisconnectController)disconnectController
{
  return self->_disconnectController;
}

- (void)setDisconnectController:(id)a3
{
  objc_storeStrong((id *)&self->_disconnectController, a3);
}

- (BuddyMigrationLockscreenProgressController)progressController
{
  return self->_progressController;
}

- (void)setProgressController:(id)a3
{
  objc_storeStrong((id *)&self->_progressController, a3);
}

- (OS_dispatch_queue)disconnectionQueue
{
  return self->_disconnectionQueue;
}

- (void)setDisconnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_disconnectionQueue, a3);
}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(int64_t)a3
{
  self->_connectionState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disconnectionQueue, 0);
  objc_storeStrong((id *)&self->_progressController, 0);
  objc_storeStrong((id *)&self->_disconnectController, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

@end

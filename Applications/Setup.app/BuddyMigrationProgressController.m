@implementation BuddyMigrationProgressController

- (BuddyMigrationProgressController)initWithTitle:(id)a3 icon:(id)a4
{
  id v5;
  id v6;
  NSBundle *v7;
  id v8;
  NSString *v9;
  BuddyMigrationProgressController *v10;
  objc_super v12;
  id v13;
  id location[2];
  id v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v5 = v15;
  v6 = location[0];
  v7 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v8 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("PROGRESS_DETAIL_WIRELESS"));
  v9 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", v8, &stru_100284738, CFSTR("Migration"));
  v15 = 0;
  v12.receiver = v5;
  v12.super_class = (Class)BuddyMigrationProgressController;
  v15 = -[BuddyMigrationProgressController initWithTitle:detailText:icon:](&v12, "initWithTitle:detailText:icon:", v6, v9, v13);
  objc_storeStrong(&v15, v15);

  if (v15)
    objc_storeStrong((id *)v15 + 1, location[0]);
  v10 = (BuddyMigrationProgressController *)v15;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v15, 0);
  return v10;
}

- (void)loadView
{
  id v2;
  id v3;
  dispatch_queue_t v4;
  id location;
  objc_super v6;
  SEL v7;
  BuddyMigrationProgressController *v8;

  v8 = self;
  v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)BuddyMigrationProgressController;
  -[BuddyMigrationProgressController loadView](&v6, "loadView");
  v2 = objc_alloc((Class)UIBarButtonItem);
  location = objc_msgSend(v2, "initWithBarButtonSystemItem:target:action:", 1, v8, "_cancelTapped:");
  v3 = -[BuddyMigrationProgressController navigationItem](v8, "navigationItem");
  objc_msgSend(v3, "setLeftBarButtonItem:animated:", location, 0);

  v4 = dispatch_queue_create("Disconnection Queue", 0);
  -[BuddyMigrationProgressController setDisconnectionQueue:](v8, "setDisconnectionQueue:", v4);

  -[BuddyMigrationProgressController setConnectionState:](v8, "setConnectionState:", 0);
  objc_storeStrong(&location, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  BuddyMigrationLockscreenController *v3;
  id v4;
  BuddyMigrationLockscreenController *v5;
  BuddyMigrationLockscreenController *v6;
  BuddyMiscState *v7;
  MBDeviceTransferConnectionInfo *v8;
  BuddyMigrationLockscreenController *v9;
  BuddyTargetDeviceMigrationManager *v10;
  MBDeviceTransferConnectionInfo *v11;
  objc_super v12;
  BOOL v13;
  SEL v14;
  BuddyMigrationProgressController *v15;

  v15 = self;
  v14 = a2;
  v13 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BuddyMigrationProgressController;
  -[BuddyMigrationProgressController viewDidAppear:](&v12, "viewDidAppear:", a3);
  v3 = -[BuddyMigrationProgressController lockscreenController](v15, "lockscreenController");

  if (!v3)
  {
    v4 = -[BuddyMigrationProgressController createLockscreenController](v15, "createLockscreenController");
    -[BuddyMigrationProgressController setLockscreenController:](v15, "setLockscreenController:", v4);

    v5 = -[BuddyMigrationProgressController lockscreenController](v15, "lockscreenController");
    -[BuddyMigrationLockscreenController activate](v5, "activate");

    v6 = -[BuddyMigrationProgressController lockscreenController](v15, "lockscreenController");
    v7 = -[BuddyMigrationProgressController miscState](v15, "miscState");
    -[BuddyMiscState setMigrationLockscreenController:](v7, "setMigrationLockscreenController:", v6);

    v8 = -[BuddyMigrationProgressController connectionInfo](v15, "connectionInfo");
    if (v8)
    {
      v9 = -[BuddyMigrationProgressController lockscreenController](v15, "lockscreenController");
      v10 = -[BuddyMigrationProgressController manager](v15, "manager");
      v11 = -[BuddyMigrationProgressController connectionInfo](v15, "connectionInfo");
      -[BuddyMigrationLockscreenController deviceMigrationManager:didChangeConnectionInformation:](v9, "deviceMigrationManager:didChangeConnectionInformation:", v10, v11);

      -[BuddyMigrationProgressController setManager:](v15, "setManager:", 0);
      -[BuddyMigrationProgressController setConnectionInfo:](v15, "setConnectionInfo:", 0);
    }
  }
}

- (void)setProgressTitle:(id)a3
{
  id v3;
  BuddyMigrationLockscreenController *v4;
  id location[2];
  BuddyMigrationProgressController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v6->_progressTitle, location[0]);
  v3 = -[BuddyMigrationProgressController headerView](v6, "headerView");
  objc_msgSend(v3, "setTitle:", location[0]);

  v4 = -[BuddyMigrationProgressController lockscreenController](v6, "lockscreenController");
  -[BuddyMigrationLockscreenController setProgressTitle:](v4, "setProgressTitle:", location[0]);

  objc_storeStrong(location, 0);
}

- (id)createLockscreenController
{
  id v3;

  return v3;
}

- (void)confirmCancellation:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)cancelMigration
{
  id v2;
  id v3;

  v2 = -[BuddyMigrationProgressController navigationItem](self, "navigationItem", a2, self);
  v3 = objc_msgSend(v2, "leftBarButtonItem");
  objc_msgSend(v3, "setEnabled:", 0);

}

- (void)_cancelTapped:(id)a3
{
  BuddyMigrationProgressController *v3;
  void **v4;
  int v5;
  int v6;
  id (*v7)(uint64_t);
  void *v8;
  BuddyMigrationProgressController *v9;
  id location[2];
  BuddyMigrationProgressController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v11;
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_100123F80;
  v8 = &unk_100280730;
  v9 = v11;
  -[BuddyMigrationProgressController confirmCancellation:](v3, "confirmCancellation:", &v4);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 4;
}

- (BOOL)shouldAllowStartOver
{
  return 0;
}

- (void)deviceMigrationManager:(id)a3 didChangeConnectionInformation:(id)a4
{
  void *v5;
  NSObject *v6;
  void **v7;
  int v8;
  int v9;
  void (*v10)(id *);
  void *v11;
  id v12;
  BuddyMigrationProgressController *v13;
  void **block;
  int v15;
  int v16;
  id (*v17)(uint64_t);
  void *v18;
  BuddyMigrationProgressController *v19;
  id v20;
  id v21;
  id v22;
  id location[2];
  BuddyMigrationProgressController *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = 0;
  objc_storeStrong(&v22, a4);
  v5 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v15 = -1073741824;
  v16 = 0;
  v17 = sub_1001241C8;
  v18 = &unk_100281000;
  v19 = v24;
  v20 = location[0];
  v21 = v22;
  dispatch_async((dispatch_queue_t)v5, &block);

  v6 = -[BuddyMigrationProgressController disconnectionQueue](v24, "disconnectionQueue");
  v7 = _NSConcreteStackBlock;
  v8 = -1073741824;
  v9 = 0;
  v10 = sub_1001243F8;
  v11 = &unk_100280D00;
  v12 = v22;
  v13 = v24;
  dispatch_async(v6, &v7);

  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong((id *)&v19, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (void)deviceMigrationManager:(id)a3 didUpdateProgress:(id)a4
{
  BuddyMigrationLockscreenController *v5;
  void *v6;
  void **v7;
  int v8;
  int v9;
  id (*v10)(uint64_t);
  void *v11;
  BuddyMigrationProgressController *v12;
  id v13;
  id v14;
  id location[2];
  BuddyMigrationProgressController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v5 = -[BuddyMigrationProgressController lockscreenController](v16, "lockscreenController");
  -[BuddyMigrationLockscreenController deviceMigrationManager:didUpdateProgress:](v5, "deviceMigrationManager:didUpdateProgress:", location[0], v14);

  v6 = &_dispatch_main_q;
  v7 = _NSConcreteStackBlock;
  v8 = -1073741824;
  v9 = 0;
  v10 = sub_100124A14;
  v11 = &unk_100280D00;
  v12 = v16;
  v13 = v14;
  dispatch_async((dispatch_queue_t)v6, &v7);

  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)deviceMigrationManager:(id)a3 didCompleteWithError:(id)a4
{
  BuddyMigrationLockscreenController *v5;
  id v6;
  id location[2];
  BuddyMigrationProgressController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5 = -[BuddyMigrationProgressController lockscreenController](v8, "lockscreenController");
  -[BuddyMigrationLockscreenController deviceMigrationManager:didCompleteWithError:](v5, "deviceMigrationManager:didCompleteWithError:", location[0], v6);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (NSString)progressTitle
{
  return self->_progressTitle;
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
  objc_storeStrong((id *)&self->_miscState, a3);
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (BuddyMigrationLockscreenController)lockscreenController
{
  return self->_lockscreenController;
}

- (void)setLockscreenController:(id)a3
{
  objc_storeStrong((id *)&self->_lockscreenController, a3);
}

- (BuddyMigrationBaseDisconnectController)disconnectController
{
  return self->_disconnectController;
}

- (void)setDisconnectController:(id)a3
{
  objc_storeStrong((id *)&self->_disconnectController, a3);
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

- (BuddyTargetDeviceMigrationManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (MBDeviceTransferConnectionInfo)connectionInfo
{
  return self->_connectionInfo;
}

- (void)setConnectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_connectionInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionInfo, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_disconnectionQueue, 0);
  objc_storeStrong((id *)&self->_disconnectController, 0);
  objc_storeStrong((id *)&self->_lockscreenController, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_miscState, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_progressTitle, 0);
}

@end

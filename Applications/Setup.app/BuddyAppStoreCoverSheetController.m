@implementation BuddyAppStoreCoverSheetController

- (void)viewDidLoad
{
  id v2;
  BuddyFinishedController *v3;
  BuddyFinishedController *v4;
  BuddyAppStoreController *v5;
  BuddySuspendTask *v6;
  BuddyFinishedController *v7;
  BuddySuspendTask *v8;
  BuddyAppStoreController *v9;
  BuddyFinishedController *v10;
  BuddyAppStoreController *v11;
  BFFFlowItemDelegate *v12;
  BuddyFinishedController *v13;
  void **v14;
  int v15;
  int v16;
  void (*v17)(id *);
  void *v18;
  id v19;
  id location;
  objc_super v21;
  SEL v22;
  BuddyAppStoreCoverSheetController *v23;

  v23 = self;
  v22 = a2;
  v21.receiver = self;
  v21.super_class = (Class)BuddyAppStoreCoverSheetController;
  -[BuddyCoverSheetController viewDidLoad](&v21, "viewDidLoad");
  v2 = -[BuddyAppStoreCoverSheetController navigationItem](v23, "navigationItem");
  objc_msgSend(v2, "setHidesBackButton:", 1);

  v3 = objc_alloc_init(BuddyFinishedController);
  -[BuddyAppStoreCoverSheetController setFinishedController:](v23, "setFinishedController:", v3);

  v4 = -[BuddyAppStoreCoverSheetController finishedController](v23, "finishedController");
  -[BuddyFinishedController setDrawHomeAffordance:](v4, "setDrawHomeAffordance:", 1);

  v5 = objc_alloc_init(BuddyAppStoreController);
  -[BuddyAppStoreCoverSheetController setAppStoreController:](v23, "setAppStoreController:", v5);

  v6 = -[BuddyAppStoreCoverSheetController suspendTask](v23, "suspendTask");
  v7 = -[BuddyAppStoreCoverSheetController finishedController](v23, "finishedController");
  -[BuddyFinishedController setSuspendTask:](v7, "setSuspendTask:", v6);

  v8 = -[BuddyAppStoreCoverSheetController suspendTask](v23, "suspendTask");
  v9 = -[BuddyAppStoreCoverSheetController appStoreController](v23, "appStoreController");
  -[BuddyAppStoreController setSuspendTask:](v9, "setSuspendTask:", v8);

  v10 = -[BuddyAppStoreCoverSheetController finishedController](v23, "finishedController");
  -[BuddyCoverSheetController setForegroundViewController:](v23, "setForegroundViewController:", v10);

  v11 = -[BuddyAppStoreCoverSheetController appStoreController](v23, "appStoreController");
  -[BuddyCoverSheetController setBackgroundViewController:](v23, "setBackgroundViewController:", v11);

  v12 = -[BuddyAppStoreCoverSheetController delegate](v23, "delegate");
  v13 = -[BuddyAppStoreCoverSheetController finishedController](v23, "finishedController");
  -[BuddyFinishedController setDelegate:](v13, "setDelegate:", v12);

  objc_initWeak(&location, v23);
  v14 = _NSConcreteStackBlock;
  v15 = -1073741824;
  v16 = 0;
  v17 = sub_10011B458;
  v18 = &unk_1002806B8;
  objc_copyWeak(&v19, &location);
  -[BuddyCoverSheetController setBackgroundViewControllerPresented:](v23, "setBackgroundViewControllerPresented:", &v14);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

+ (id)cloudConfigSkipKey
{
  return +[BuddyAppStoreController cloudConfigSkipKey](BuddyAppStoreController, "cloudConfigSkipKey", a2, a1);
}

+ (BOOL)controllerNeedsToRun
{
  id v2;
  char v3;
  unsigned __int8 v4;
  char v6;
  id v7;

  v2 = +[BYDevice currentDevice](BYDevice, "currentDevice");
  v6 = 0;
  v3 = 0;
  if (!objc_msgSend(v2, "type"))
  {
    v7 = +[BYDevice currentDevice](BYDevice, "currentDevice");
    v6 = 1;
    v3 = objc_msgSend(v7, "hasHomeButton") ^ 1;
  }
  if ((v6 & 1) != 0)

  v4 = 0;
  if ((v3 & 1) != 0)
    v4 = +[BuddyFinishedController controllerNeedsToRun](BuddyFinishedController, "controllerNeedsToRun");
  return v4 & 1;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (unint64_t)allowedTerminationSources
{
  return 2;
}

- (BuddySuspendTask)suspendTask
{
  return self->_suspendTask;
}

- (void)setSuspendTask:(id)a3
{
  objc_storeStrong((id *)&self->_suspendTask, a3);
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BuddyFinishedController)finishedController
{
  return self->_finishedController;
}

- (void)setFinishedController:(id)a3
{
  objc_storeStrong((id *)&self->_finishedController, a3);
}

- (BuddyAppStoreController)appStoreController
{
  return self->_appStoreController;
}

- (void)setAppStoreController:(id)a3
{
  objc_storeStrong((id *)&self->_appStoreController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appStoreController, 0);
  objc_storeStrong((id *)&self->_finishedController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_suspendTask, 0);
}

@end

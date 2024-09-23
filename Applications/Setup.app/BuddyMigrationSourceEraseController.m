@implementation BuddyMigrationSourceEraseController

- (BuddyMigrationSourceEraseController)init
{
  id v2;
  id v3;
  id v4;
  void *v5;
  BuddyMigrationSourceEraseController *v6;
  void **v8;
  int v9;
  int v10;
  void (*v11)(id *);
  void *v12;
  id v13;
  void **v14;
  int v15;
  int v16;
  void (*v17)(id *);
  void *v18;
  id v19;
  id from;
  objc_super v21;
  SEL v22;
  id location;

  v22 = a2;
  location = 0;
  v21.receiver = self;
  v21.super_class = (Class)BuddyMigrationSourceEraseController;
  location = -[BuddyMigrationSourceEraseController init](&v21, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = objc_alloc((Class)sub_100108498());
    v3 = objc_msgSend(sub_100108584(), "setupAssistantConfiguration");
    v4 = objc_msgSend(v2, "initWithConfiguration:", v3);
    v5 = (void *)*((_QWORD *)location + 2);
    *((_QWORD *)location + 2) = v4;

    objc_initWeak(&from, location);
    v14 = _NSConcreteStackBlock;
    v15 = -1073741824;
    v16 = 0;
    v17 = sub_100108670;
    v18 = &unk_1002806B8;
    objc_copyWeak(&v19, &from);
    objc_msgSend(*((id *)location + 2), "setPresentNetworkSettings:", &v14);
    v8 = _NSConcreteStackBlock;
    v9 = -1073741824;
    v10 = 0;
    v11 = sub_1001086D8;
    v12 = &unk_1002806B8;
    objc_copyWeak(&v13, &from);
    objc_msgSend(*((id *)location + 2), "setCompletion:", &v8);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&from);
  }
  v6 = (BuddyMigrationSourceEraseController *)location;
  objc_storeStrong(&location, 0);
  return v6;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  DKEraseFlow *v3;
  void **v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  BuddyMigrationSourceEraseController *v9;
  id v10;
  id location[2];
  BuddyMigrationSourceEraseController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyMigrationSourceEraseController eraseFlow](v12, "eraseFlow");
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_10010882C;
  v8 = &unk_1002806E0;
  v9 = v12;
  v10 = location[0];
  -[DKEraseFlow prepareFlow:](v3, "prepareFlow:", &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (id)viewController
{
  return -[BuddyMigrationSourceEraseController initialViewController](self, "initialViewController", a2, self);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 0;
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DKEraseFlow)eraseFlow
{
  return self->_eraseFlow;
}

- (void)setEraseFlow:(id)a3
{
  objc_storeStrong((id *)&self->_eraseFlow, a3);
}

- (UIViewController)initialViewController
{
  return self->_initialViewController;
}

- (void)setInitialViewController:(id)a3
{
  objc_storeStrong((id *)&self->_initialViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialViewController, 0);
  objc_storeStrong((id *)&self->_eraseFlow, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

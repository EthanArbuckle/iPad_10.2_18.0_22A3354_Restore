@implementation BuddyUpdateFinishedFlow

- (BuddyUpdateFinishedFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
{
  id v9;
  NSArray *v10;
  BuddyUpdateFinishedFlow *v11;
  objc_super v13;
  id v14;
  id v15;
  id v16;
  id location[2];
  id v18;
  _QWORD v19[2];

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v15 = 0;
  objc_storeStrong(&v15, a5);
  v14 = 0;
  objc_storeStrong(&v14, a6);
  v9 = v18;
  v18 = 0;
  v13.receiver = v9;
  v13.super_class = (Class)BuddyUpdateFinishedFlow;
  v18 = -[BuddyUpdateFinishedFlow initWithNavigationController:flowDelegate:flowStarter:dependencyInjector:](&v13, "initWithNavigationController:flowDelegate:flowStarter:dependencyInjector:", location[0], v16, v15, v14);
  objc_storeStrong(&v18, v18);
  if (v18)
  {
    v19[0] = objc_opt_class(BuddyUpdateFinishedAutoUpdateController);
    v19[1] = objc_opt_class(BuddyUpdateFinishedController);
    v10 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2);
    objc_msgSend(v18, "setClassList:", v10);

  }
  v11 = (BuddyUpdateFinishedFlow *)v18;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v18, 0);
  return v11;
}

+ (id)allowedFlowItems
{
  _QWORD v3[2];

  v3[0] = objc_opt_class(BuddyUpdateFinishedAutoUpdateController);
  v3[1] = objc_opt_class(BuddyUpdateFinishedController);
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 2);
}

- (void)flowItemDone:(id)a3 nextItem:(id)a4
{
  objc_super v5;
  id v6;
  id location[2];
  BuddyUpdateFinishedFlow *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)BuddyUpdateFinishedFlow;
  -[BuddyUpdateFinishedFlow flowItemDone:nextItem:](&v5, "flowItemDone:nextItem:", location[0], 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)flowItemDone:(id)a3 nextItemClass:(Class)a4
{
  id location[2];
  BuddyUpdateFinishedFlow *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyUpdateFinishedFlow flowItemDone:nextItem:](v6, "flowItemDone:nextItem:", location[0], 0, a4);
  objc_storeStrong(location, 0);
}

- (void)flowItemDone:(id)a3
{
  id location[2];
  BuddyUpdateFinishedFlow *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyUpdateFinishedFlow flowItemDone:nextItem:](v4, "flowItemDone:nextItem:", location[0], 0);
  objc_storeStrong(location, 0);
}

@end

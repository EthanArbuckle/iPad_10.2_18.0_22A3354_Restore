@implementation BuddyActivationFlow

- (BuddyActivationFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
{
  id v9;
  NSArray *v10;
  BuddyActivationFlow *v11;
  objc_super v13;
  id v14;
  id v15;
  id v16;
  id location[2];
  id v18;
  _QWORD v19[6];

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
  v13.super_class = (Class)BuddyActivationFlow;
  v18 = -[BuddyActivationFlow initWithNavigationController:flowDelegate:flowStarter:dependencyInjector:](&v13, "initWithNavigationController:flowDelegate:flowStarter:dependencyInjector:", location[0], v16, v15, v14);
  objc_storeStrong(&v18, v18);
  if (v18)
  {
    v19[0] = objc_opt_class(ActivationController);
    v19[1] = objc_opt_class(BuddyActivationFailureController);
    v19[2] = objc_opt_class(BuddyActivationOptionsController);
    v19[3] = objc_opt_class(ActivateUsingComputerController);
    v19[4] = objc_opt_class(BuddyManagedSIMController);
    v19[5] = objc_opt_class(BuddyDemoController);
    v10 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 6);
    objc_msgSend(v18, "setClassList:", v10);

  }
  v11 = (BuddyActivationFlow *)v18;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v18, 0);
  return v11;
}

+ (id)allowedFlowItems
{
  _QWORD v3[6];

  v3[0] = objc_opt_class(ActivationController);
  v3[1] = objc_opt_class(ActivateUsingComputerController);
  v3[2] = objc_opt_class(BuddyActivationFailureController);
  v3[3] = objc_opt_class(BuddyActivationOptionsController);
  v3[4] = objc_opt_class(BuddyDemoController);
  v3[5] = objc_opt_class(BuddyManagedSIMController);
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 6);
}

- (void)configureFlowItem:(id)a3
{
  void **v3;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  BuddyActivationFlow *v8;
  id v9;
  objc_super v10;
  id location[2];
  BuddyActivationFlow *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10.receiver = v12;
  v10.super_class = (Class)BuddyActivationFlow;
  -[BuddyActivationFlow configureFlowItem:](&v10, "configureFlowItem:", location[0]);
  if ((objc_msgSend(location[0], "conformsToProtocol:", &OBJC_PROTOCOL___BuddyActivationRestarting) & 1) != 0)
  {
    v9 = location[0];
    v3 = _NSConcreteStackBlock;
    v4 = -1073741824;
    v5 = 0;
    v6 = sub_10006322C;
    v7 = &unk_100280730;
    v8 = v12;
    objc_msgSend(v9, "setRestartActivation:", &v3);
    objc_storeStrong((id *)&v8, 0);
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)flowItemDone:(id)a3 nextItem:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t i;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  objc_super v14;
  _QWORD __b[8];
  id v16;
  id v17;
  id v18;
  id v19;
  id location[2];
  BuddyActivationFlow *v21;
  _BYTE v22[128];
  _QWORD v23[4];

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v23[0] = objc_opt_class(ActivationController);
  v23[1] = objc_opt_class(BuddyActivationFailureController);
  v23[2] = objc_opt_class(BuddyActivationOptionsController);
  v23[3] = objc_opt_class(ActivateUsingComputerController);
  v18 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 4);
  if (!v19 || (objc_msgSend(v18, "containsObject:", objc_opt_class(v19)) & 1) == 0)
  {
    v17 = objc_alloc_init((Class)NSMutableArray);
    memset(__b, 0, sizeof(__b));
    v5 = -[BuddyActivationFlow controllers](v21, "controllers");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", __b, v22, 16);
    if (v6)
    {
      v7 = *(_QWORD *)__b[2];
      do
      {
        for (i = 0; i < (unint64_t)v6; ++i)
        {
          if (*(_QWORD *)__b[2] != v7)
            objc_enumerationMutation(v5);
          v16 = *(id *)(__b[1] + 8 * i);
          if ((objc_msgSend(v18, "containsObject:", objc_opt_class(v16)) & 1) != 0)
          {
            v9 = v16;
            v10 = objc_opt_class(UIViewController);
            if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
            {
              objc_msgSend(v17, "addObject:", v16);
            }
            else if ((objc_opt_respondsToSelector(v16, "viewController") & 1) != 0)
            {
              v11 = v17;
              v12 = objc_msgSend(v16, "viewController");
              objc_msgSend(v11, "addObject:", v12);

            }
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", __b, v22, 16);
      }
      while (v6);
    }

    v13 = -[BuddyActivationFlow navigationFlowDelegate](v21, "navigationFlowDelegate");
    objc_msgSend(v13, "removeViewControllersOnNextPush:", v17);

    objc_storeStrong(&v17, 0);
  }
  v14.receiver = v21;
  v14.super_class = (Class)BuddyActivationFlow;
  -[BuddyActivationFlow flowItemDone:nextItem:](&v14, "flowItemDone:nextItem:", location[0], v19);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

+ (BOOL)controllerNeedsToRun
{
  id v2;
  char v3;

  v2 = +[BuddyActivationConfiguration currentConfiguration](BuddyActivationConfiguration, "currentConfiguration", a2, a1);
  v3 = objc_msgSend(v2, "isActivated") ^ 1;

  return v3 & 1;
}

- (void)presentWiFiPaneForFlowItem:(id)a3
{
  id v3;
  char v4;
  id v5;
  id location[2];
  BuddyActivationFlow *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyActivationFlow flowItemDelegate](v7, "flowItemDelegate");
  v4 = objc_opt_respondsToSelector(v3, "presentWiFiPaneForFlowItem:");

  if ((v4 & 1) != 0)
  {
    v5 = -[BuddyActivationFlow flowItemDelegate](v7, "flowItemDelegate");
    objc_msgSend(v5, "presentWiFiPaneForFlowItem:", location[0]);

  }
  objc_storeStrong(location, 0);
}

- (id)_activationController
{
  id v2;
  id v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  uint64_t v7;
  int v9;
  _QWORD __b[8];
  id v11;
  SEL v12;
  BuddyActivationFlow *v13;
  id v14;
  _BYTE v15[128];

  v13 = self;
  v12 = a2;
  memset(__b, 0, sizeof(__b));
  v2 = -[BuddyActivationFlow controllers](v13, "controllers");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
  if (v3)
  {
    v4 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v3; ++i)
      {
        if (*(_QWORD *)__b[2] != v4)
          objc_enumerationMutation(v2);
        v11 = *(id *)(__b[1] + 8 * i);
        v6 = v11;
        v7 = objc_opt_class(ActivationController);
        if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
        {
          v14 = v11;
          v9 = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
    }
    while (v3);
  }
  v9 = 0;
LABEL_11:

  if (!v9)
    v14 = 0;
  return v14;
}

- (BuddyActivationState)activationState
{
  return self->_activationState;
}

- (void)setActivationState:(id)a3
{
  objc_storeStrong((id *)&self->_activationState, a3);
}

- (ActivationController)activationController
{
  return (ActivationController *)objc_loadWeakRetained((id *)&self->_activationController);
}

- (void)setActivationController:(id)a3
{
  objc_storeWeak((id *)&self->_activationController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activationController);
  objc_storeStrong((id *)&self->_activationState, 0);
}

@end

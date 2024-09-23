@implementation BuddySIMActivationController

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSIMSetup;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

- (BOOL)controllerNeedsToRun
{
  BYRunState *v2;
  unsigned __int8 v3;
  BOOL v4;
  char v6;
  CTCellularPlanProvisioningOnDeviceActivationRequest *v7;
  char v8;
  BuddyMiscState *v9;
  BOOL v11;

  v2 = -[BuddySIMActivationController runState](self, "runState");
  v3 = -[BYRunState hasCompletedInitialRun](v2, "hasCompletedInitialRun");
  v8 = 0;
  v6 = 0;
  v4 = 0;
  if ((v3 & 1) == 0)
  {
    v9 = -[BuddySIMActivationController miscState](self, "miscState");
    v8 = 1;
    v7 = -[BuddyMiscState activationPlanRequest](v9, "activationPlanRequest");
    v6 = 1;
    v4 = v7 != 0;
  }
  v11 = v4;
  if ((v6 & 1) != 0)

  if ((v8 & 1) != 0)
  return v11;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  id v6;
  void *v7;
  id v8;
  CoreTelephonyClient *v9;
  BuddyMiscState *v10;
  CTCellularPlanProvisioningOnDeviceActivationRequest *v11;
  void **v12;
  int v13;
  int v14;
  void (*v15)(id *, uint64_t, id);
  void *v16;
  id v17;
  id v18[3];
  id from;
  uint8_t buf[15];
  os_log_type_t v21;
  id v22;
  id location[2];
  BuddySIMActivationController *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = (id)_BYLoggingFacility(v3);
  v21 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v22;
    v5 = v21;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Adding cellular plan...", buf, 2u);
  }
  objc_storeStrong(&v22, 0);
  v6 = objc_alloc((Class)CoreTelephonyClient);
  v7 = &_dispatch_main_q;
  v8 = objc_msgSend(v6, "initWithQueue:", v7);
  -[BuddySIMActivationController setTelephonyClient:](v24, "setTelephonyClient:", v8);

  objc_initWeak(&from, v24);
  v9 = -[BuddySIMActivationController telephonyClient](v24, "telephonyClient");
  v10 = -[BuddySIMActivationController miscState](v24, "miscState");
  v11 = -[BuddyMiscState activationPlanRequest](v10, "activationPlanRequest");
  v12 = _NSConcreteStackBlock;
  v13 = -1073741824;
  v14 = 0;
  v15 = sub_1001CE410;
  v16 = &unk_100284680;
  objc_copyWeak(v18, &from);
  v17 = location[0];
  -[CoreTelephonyClient addPlanWith:completionHandler:](v9, "addPlanWith:completionHandler:", v11, &v12);

  objc_storeStrong(&v17, 0);
  objc_destroyWeak(v18);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

- (id)viewController
{
  TSSIMSetupFlow *v2;
  id v3;

  v2 = -[BuddySIMActivationController setupFlow](self, "setupFlow", a2, self);
  v3 = -[TSSIMSetupFlow rootViewController](v2, "rootViewController");

  return v3;
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  id v3;
  id v4;
  id v5;
  _BYTE *v6;
  id v7;
  id v8;
  id v9;
  NSIndexSet *v10;
  BFFFlowItemDelegate *v11;
  BFFFlowItemDelegate *v12;
  id location;
  _BYTE *v14;
  id v15[3];
  BuddySIMActivationController *v16;
  char *v17;
  id v18;
  id v19;
  char *v20;

  v16 = self;
  v15[2] = (id)a2;
  v15[1] = (id)a3;
  v3 = -[BuddySIMActivationController viewController](self, "viewController");
  v15[0] = objc_msgSend(v3, "navigationController");

  v4 = objc_msgSend(v15[0], "viewControllers");
  v5 = -[BuddySIMActivationController viewController](v16, "viewController");
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  v14 = v6;
  v7 = objc_msgSend(v15[0], "viewControllers");
  v8 = v6;
  v9 = objc_msgSend(v15[0], "viewControllers");
  v18 = v8;
  v17 = (char *)((_BYTE *)objc_msgSend(v9, "count") - v14);
  v19 = v8;
  v20 = v17;
  v10 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v8, v17, v8, v17);
  location = objc_msgSend(v7, "objectsAtIndexes:", v10);

  v11 = -[BuddySIMActivationController delegate](v16, "delegate");
  -[BFFFlowItemDelegate removeViewControllersOnNextPush:](v11, "removeViewControllersOnNextPush:", location);

  v12 = -[BuddySIMActivationController delegate](v16, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v12, "flowItemDone:", v16);

  objc_storeStrong(&location, 0);
  objc_storeStrong(v15, 0);
}

- (void)updateSourceProxCardState:(BOOL)a3
{
  ProximitySetupController *v3;

  v3 = -[BuddySIMActivationController proximitySetupController](self, "proximitySetupController");
  -[ProximitySetupController setSourceProxCardVisibliityForSIMSetupExternalAuthentication:](v3, "setSourceProxCardVisibliityForSIMSetupExternalAuthentication:", a3);

}

- (BFFFlowItemDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
  objc_storeStrong((id *)&self->_miscState, a3);
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
  objc_storeStrong((id *)&self->_runState, a3);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
}

- (CoreTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (void)setTelephonyClient:(id)a3
{
  objc_storeStrong((id *)&self->_telephonyClient, a3);
}

- (TSSIMSetupFlow)setupFlow
{
  return self->_setupFlow;
}

- (void)setSetupFlow:(id)a3
{
  objc_storeStrong((id *)&self->_setupFlow, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupFlow, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_storeStrong((id *)&self->_runState, 0);
  objc_storeStrong((id *)&self->_miscState, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end

@implementation BuddySIMTransferController

+ (BOOL)controllerNeedsToRun
{
  return (BYSetupAssistantHasCompletedInitialRun(a1, a2) ^ 1) & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  ProximitySetupController *v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(id *, uint64_t);
  void *v8;
  BuddySIMTransferController *v9;
  id v10;
  id location[2];
  BuddySIMTransferController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddySIMTransferController proximitySetupController](v12, "proximitySetupController");
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_100154314;
  v8 = &unk_100281078;
  v9 = v12;
  v10 = location[0];
  -[ProximitySetupController waitForIntent:](v3, "waitForIntent:", &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_endProximityIfApplicable
{
  NSObject *v2;
  void **block;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8[2];
  BuddySIMTransferController *v9;

  v9 = self;
  v8[1] = (id)a2;
  v2 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_100154C10;
  v7 = &unk_100280730;
  v8[0] = v9;
  dispatch_async(v2, &block);

  objc_storeStrong(v8, 0);
}

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

- (id)viewController
{
  TSSIMSetupFlow *v2;
  id v3;

  v2 = -[BuddySIMTransferController setupFlow](self, "setupFlow", a2, self);
  v3 = -[TSSIMSetupFlow rootViewController](v2, "rootViewController");

  return v3;
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  BFFFlowItemDelegate *v3;

  -[BuddySIMTransferController _endProximityIfApplicable](self, "_endProximityIfApplicable");
  v3 = -[BuddySIMTransferController delegate](self, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v3, "flowItemDone:", self);

}

- (void)updateSourceProxCardState:(BOOL)a3
{
  ProximitySetupController *v3;

  v3 = -[BuddySIMTransferController proximitySetupController](self, "proximitySetupController");
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

- (TSSIMSetupFlow)setupFlow
{
  return (TSSIMSetupFlow *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSetupFlow:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupFlow, 0);
  objc_storeStrong((id *)&self->_miscState, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end

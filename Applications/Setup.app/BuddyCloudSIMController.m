@implementation BuddyCloudSIMController

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSIMSetup;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

- (BOOL)controllerNeedsToRun
{
  BYRunState *v2;
  unsigned __int8 v3;
  BuddyMiscState *v4;
  BOOL v7;

  v2 = -[BuddyCloudSIMController runState](self, "runState");
  v3 = -[BYRunState hasCompletedInitialRun](v2, "hasCompletedInitialRun");

  if ((v3 & 1) == 0)
    return 1;
  v4 = -[BuddyCloudSIMController miscState](self, "miscState");
  v7 = -[BuddyMiscState launchedToShowSIMSetupAfterRestore](v4, "launchedToShowSIMSetupAfterRestore");

  return v7;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  BuddySetupMethod *v3;
  BOOL v4;
  id v5;
  ProximitySetupController *v6;
  unsigned __int8 v7;
  ProximitySetupController *v8;
  unsigned __int8 v9;
  id v10;
  id v11;
  id v12;
  NSNumber *v13;
  NSDictionary *v14;
  id v15;
  TSSIMSetupFlow *v16;
  BuddyCloudSIMController *v17;
  TSSIMSetupFlow *v18;
  TSSIMSetupFlow *v19;
  void **v20;
  int v21;
  int v22;
  void (*v23)(_QWORD *, void *);
  void *v24;
  id v25;
  uint64_t v26;
  int v27;
  id v28;
  char v29;
  id v30;
  id location[2];
  BuddyCloudSIMController *v32;
  _QWORD v33[2];
  _QWORD v34[2];

  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyCloudSIMController setupMethod](v32, "setupMethod");
  v29 = 0;
  v4 = 1;
  if ((id)-[BuddySetupMethod dataTransferMethod](v3, "dataTransferMethod") != (id)1)
  {
    v30 = -[BuddyCloudSIMController setupMethod](v32, "setupMethod");
    v29 = 1;
    v4 = objc_msgSend(v30, "dataTransferMethod") == (id)2;
  }
  if ((v29 & 1) != 0)

  if (v4)
  {
    v5 = +[CTCellularPlanManager sharedManager](CTCellularPlanManager, "sharedManager");
    v28 = objc_msgSend(v5, "planItemsShouldUpdate:", 1);

    if (!objc_msgSend(v28, "count"))
      CFPreferencesSetAppValue(CFSTR("ShouldShowSIMSetupInRestoreMiniBuddy"), kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
    if (location[0])
      (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
    v27 = 1;
    objc_storeStrong(&v28, 0);
  }
  else
  {
    v26 = 0;
    v6 = -[BuddyCloudSIMController proximitySetupController](v32, "proximitySetupController");
    v7 = -[ProximitySetupController hasAppliedSettings](v6, "hasAppliedSettings");

    if ((v7 & 1) != 0)
    {
      v8 = -[BuddyCloudSIMController proximitySetupController](v32, "proximitySetupController");
      v9 = -[ProximitySetupController hasConnection](v8, "hasConnection");

      if ((v9 & 1) != 0)
        v26 = 3;
      else
        v26 = 2;
    }
    else
    {
      v26 = 1;
    }
    v10 = sub_1000AA98C();
    v11 = sub_1000AAA78();
    v33[0] = v11;
    v34[0] = &off_100290D78;
    v12 = sub_1000AAB70();
    v33[1] = v12;
    v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v26);
    v34[1] = v13;
    v14 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v15 = objc_msgSend(v10, "flowWithOptions:", v14);
    -[BuddyCloudSIMController setSetupFlow:](v32, "setSetupFlow:", v15);

    v16 = -[BuddyCloudSIMController setupFlow](v32, "setupFlow");
    LOBYTE(v11) = v16 == 0;

    if ((v11 & 1) != 0)
    {
      (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
      v27 = 1;
    }
    else
    {
      v17 = v32;
      v18 = -[BuddyCloudSIMController setupFlow](v32, "setupFlow");
      -[TSSIMSetupFlow setDelegate:](v18, "setDelegate:", v17);

      v19 = -[BuddyCloudSIMController setupFlow](v32, "setupFlow");
      v20 = _NSConcreteStackBlock;
      v21 = -1073741824;
      v22 = 0;
      v23 = sub_1000AAC68;
      v24 = &unk_100282058;
      v25 = location[0];
      -[TSSIMSetupFlow firstViewController:](v19, "firstViewController:", &v20);

      objc_storeStrong(&v25, 0);
      v27 = 0;
    }
  }
  objc_storeStrong(location, 0);
}

- (id)viewController
{
  TSSIMSetupFlow *v2;
  id v3;

  v2 = -[BuddyCloudSIMController setupFlow](self, "setupFlow", a2, self);
  v3 = -[TSSIMSetupFlow rootViewController](v2, "rootViewController");

  return v3;
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  BFFFlowItemDelegate *v3;

  v3 = -[BuddyCloudSIMController delegate](self, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v3, "flowItemDone:", self);

}

- (void)updateSourceProxCardState:(BOOL)a3
{
  ProximitySetupController *v3;

  v3 = -[BuddyCloudSIMController proximitySetupController](self, "proximitySetupController");
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

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
  objc_storeStrong((id *)&self->_runState, a3);
}

- (BuddySetupMethod)setupMethod
{
  return self->_setupMethod;
}

- (void)setSetupMethod:(id)a3
{
  objc_storeStrong((id *)&self->_setupMethod, a3);
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
  return self->_setupFlow;
}

- (void)setSetupFlow:(id)a3
{
  objc_storeStrong((id *)&self->_setupFlow, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupFlow, 0);
  objc_storeStrong((id *)&self->_miscState, 0);
  objc_storeStrong((id *)&self->_setupMethod, 0);
  objc_storeStrong((id *)&self->_runState, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end

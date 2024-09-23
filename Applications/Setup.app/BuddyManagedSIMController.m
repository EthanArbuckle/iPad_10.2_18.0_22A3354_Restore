@implementation BuddyManagedSIMController

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSIMSetup;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (BOOL)controllerNeedsToRun
{
  BYRunState *v2;
  unsigned __int8 v3;
  MCProfileConnection *v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  char v8;
  BuddyActivationRecord *v9;
  BOOL v11;

  v2 = -[BuddyManagedSIMController runState](self, "runState");
  v3 = -[BYRunState hasCompletedInitialRun](v2, "hasCompletedInitialRun");

  if ((v3 & 1) != 0)
    return BYIsRunningInStoreDemoMode() & 1;
  v4 = -[BuddyManagedSIMController managedConfiguration](self, "managedConfiguration");
  v5 = -[MCProfileConnection activationRecordIndicatesCloudConfigurationIsAvailable](v4, "activationRecordIndicatesCloudConfigurationIsAvailable");
  v8 = 0;
  v6 = 1;
  if ((v5 & 1) == 0)
  {
    v9 = -[BuddyManagedSIMController activationRecord](self, "activationRecord");
    v8 = 1;
    v6 = -[BuddyActivationRecord impliesDemod](v9, "impliesDemod");
  }
  v11 = v6 & 1;
  if ((v8 & 1) != 0)

  return v11;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  unsigned __int8 v3;
  id v4;
  id v5;
  id v6;
  NSNumber *v7;
  id v8;
  BuddyNetworkProvider *v9;
  NSNumber *v10;
  NSDictionary *v11;
  id v12;
  TSSIMSetupFlow *v13;
  TSSIMSetupFlow *v14;
  void **v15;
  int v16;
  int v17;
  void (*v18)(_QWORD *, void *);
  void *v19;
  id v20;
  int v21;
  char v22;
  id v23;
  char v24;
  id location[2];
  BuddyManagedSIMController *v26;
  _QWORD v27[3];
  _QWORD v28[3];

  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v24 = 0;
  v22 = 0;
  v3 = 1;
  if ((BYIsRunningInStoreDemoMode() & 1) == 0)
  {
    v23 = -[BuddyManagedSIMController activationRecord](v26, "activationRecord");
    v22 = 1;
    v3 = objc_msgSend(v23, "impliesDemod");
  }
  if ((v22 & 1) != 0)

  if ((v3 & 1) != 0)
    v24 = 1;
  v4 = sub_100103984();
  v5 = sub_100103A70();
  v27[0] = v5;
  v28[0] = &off_100290D90;
  v6 = sub_100103B68();
  v27[1] = v6;
  v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v24 & 1);
  v28[1] = v7;
  v8 = sub_100103C60();
  v27[2] = v8;
  v9 = -[BuddyManagedSIMController networkProvider](v26, "networkProvider");
  v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", !-[BuddyNetworkProvider connectedOverWiFiAndNetworkReachable](v9, "connectedOverWiFiAndNetworkReachable"));
  v28[2] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v12 = objc_msgSend(v4, "flowWithOptions:", v11);
  -[BuddyManagedSIMController setSetupFlow:](v26, "setSetupFlow:", v12);

  v13 = -[BuddyManagedSIMController setupFlow](v26, "setupFlow");
  LOBYTE(v5) = v13 == 0;

  if ((v5 & 1) != 0)
  {
    (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
    v21 = 1;
  }
  else
  {
    v14 = -[BuddyManagedSIMController setupFlow](v26, "setupFlow");
    v15 = _NSConcreteStackBlock;
    v16 = -1073741824;
    v17 = 0;
    v18 = sub_100103D58;
    v19 = &unk_100282058;
    v20 = location[0];
    -[TSSIMSetupFlow firstViewController:](v14, "firstViewController:", &v15);

    objc_storeStrong(&v20, 0);
    v21 = 0;
  }
  objc_storeStrong(location, 0);
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
  objc_storeStrong((id *)&self->_networkProvider, a3);
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
  objc_storeStrong((id *)&self->_runState, a3);
}

- (BuddyActivationRecord)activationRecord
{
  return self->_activationRecord;
}

- (void)setActivationRecord:(id)a3
{
  objc_storeStrong((id *)&self->_activationRecord, a3);
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
  objc_storeStrong((id *)&self->_activationRecord, 0);
  objc_storeStrong((id *)&self->_runState, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

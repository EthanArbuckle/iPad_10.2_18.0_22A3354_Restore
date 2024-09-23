@implementation BuddyMigrationReconnectController

- (BuddyMigrationReconnectController)init
{
  NSBundle *v3;
  NSString *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  BuddyMigrationReconnectController *v10;
  objc_super v12;
  SEL v13;
  id location;

  v13 = a2;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("RECONNECTING"), &stru_100284738, CFSTR("Migration"));
  location = 0;
  v12.receiver = self;
  v12.super_class = (Class)BuddyMigrationReconnectController;
  location = -[BuddyMigrationReconnectController initWithSpinnerText:](&v12, "initWithSpinnerText:", v4);
  objc_storeStrong(&location, location);

  if (location)
  {
    v5 = objc_msgSend(location, "navigationItem");
    objc_msgSend(v5, "setTitle:", &stru_100284738);

    v6 = objc_msgSend(location, "navigationItem");
    objc_msgSend(v6, "setHidesBackButton:animated:", 1, 0);

    v7 = objc_msgSend(location, "navigationItem");
    v8 = objc_alloc((Class)UIBarButtonItem);
    v9 = objc_msgSend(v8, "initWithBarButtonSystemItem:target:action:", 1, location, "_cancelTapped:");
    objc_msgSend(v7, "setLeftBarButtonItem:animated:", v9, 0);

    objc_msgSend(location, "setDidReconnect:", 0);
    objc_msgSend(location, "setUserDidCancelReconnect:", 0);
  }
  v10 = (BuddyMigrationReconnectController *)location;
  objc_storeStrong(&location, 0);
  return v10;
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  ProximitySetupController *v6;
  ProximitySetupController *v7;
  void **v8;
  int v9;
  int v10;
  void (*v11)(uint64_t, char);
  void *v12;
  BuddyMigrationReconnectController *v13;
  uint8_t buf[15];
  os_log_type_t v15;
  os_log_t oslog;
  objc_super v17;
  BOOL v18;
  SEL v19;
  BuddyMigrationReconnectController *v20;

  v20 = self;
  v19 = a2;
  v18 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BuddyMigrationReconnectController;
  v3 = -[BuddyMigrationReconnectController viewDidAppear:](&v17, "viewDidAppear:", a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = oslog;
    v5 = v15;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Waiting for connection...", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v6 = -[BuddyMigrationReconnectController proximitySetupController](v20, "proximitySetupController");
  -[ProximitySetupController startReconnecting](v6, "startReconnecting");

  v7 = -[BuddyMigrationReconnectController proximitySetupController](v20, "proximitySetupController");
  v8 = _NSConcreteStackBlock;
  v9 = -1073741824;
  v10 = 0;
  v11 = sub_1000EE4CC;
  v12 = &unk_1002808D0;
  v13 = v20;
  -[ProximitySetupController waitForSessionReconnection:](v7, "waitForSessionReconnection:", &v8);

  objc_storeStrong((id *)&v13, 0);
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  ProximitySetupController *v3;
  unsigned __int8 v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t buf[15];
  os_log_type_t v9;
  os_log_t oslog;
  id location[2];
  BuddyMigrationReconnectController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyMigrationReconnectController proximitySetupController](v12, "proximitySetupController");
  v4 = -[ProximitySetupController hasConnection](v3, "hasConnection");

  if ((v4 & 1) != 0)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v5);
    v9 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = oslog;
      v7 = v9;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Already connected, starting migration...", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    -[BuddyMigrationReconnectController _startMigration](v12, "_startMigration");
    if (location[0])
      (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
  }
  else if (location[0])
  {
    (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
  }
  objc_storeStrong(location, 0);
}

- (BOOL)shouldAllowStartOver
{
  return 0;
}

- (void)_startMigrationIfPossible
{
  id v2;
  os_log_t oslog[2];
  BuddyMigrationReconnectController *v4;
  uint8_t buf[24];

  v4 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_10003CBAC((uint64_t)buf, -[BuddyMigrationReconnectController didReconnect](v4, "didReconnect"), -[BuddyMigrationReconnectController userDidCancelReconnect](v4, "userDidCancelReconnect"));
    _os_log_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEFAULT, "Considering starting migration - did reconnect %d, user did cancel %d", buf, 0xEu);
  }
  objc_storeStrong((id *)oslog, 0);
  if (-[BuddyMigrationReconnectController didReconnect](v4, "didReconnect")
    && !-[BuddyMigrationReconnectController userDidCancelReconnect](v4, "userDidCancelReconnect"))
  {
    -[BuddyMigrationReconnectController _startMigration](v4, "_startMigration");
    v2 = -[BuddyMigrationReconnectController delegate](v4, "delegate");
    objc_msgSend(v2, "flowItemDone:", v4);

  }
}

- (void)_startMigration
{
  void (**v2)(id, uint64_t);
  void (**v3)(_QWORD);

  v2 = (void (**)(id, uint64_t))-[BuddyMigrationReconnectController prepareForDeviceMigrationBlock](self, "prepareForDeviceMigrationBlock", a2);
  v2[2](v2, 1);

  v3 = (void (**)(_QWORD))-[BuddyMigrationReconnectController startDeviceMigrationBlock](self, "startDeviceMigrationBlock");
  v3[2](v3);

}

- (void)_cancelTapped:(id)a3
{
  uint64_t (**v3)(_QWORD);
  char v4;
  void **v5;
  int v6;
  int v7;
  void (*v8)(uint64_t, char);
  void *v9;
  BuddyMigrationReconnectController *v10;
  char v11;
  id v12;
  char v13;
  id location[2];
  BuddyMigrationReconnectController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyMigrationReconnectController setUserDidCancelReconnect:](v15, "setUserDidCancelReconnect:", 1);
  v13 = 0;
  v3 = (uint64_t (**)(_QWORD))-[BuddyMigrationReconnectController doesRestartFlowCauseEraseBlock](v15, "doesRestartFlowCauseEraseBlock");
  v4 = v3[2](v3);

  v13 = v4 & 1;
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_1000EEA24;
  v9 = &unk_100282C58;
  v10 = v15;
  v11 = v4 & 1;
  v12 = +[BuddyMigrationCancelAlertController alertControllerForTargetWithNeedsErase:completion:](BuddyMigrationCancelAlertController, "alertControllerForTargetWithNeedsErase:completion:", v4 & 1, &v5);
  -[BuddyMigrationReconnectController presentViewController:animated:completion:](v15, "presentViewController:animated:completion:", v12, 1, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)exitMigrationReconnectController
{
  id v2;
  id v3;

  v2 = -[BuddyMigrationReconnectController delegate](self, "delegate", a2, self);
  v3 = objc_msgSend(v2, "popToBuddyControllerWithClass:animated:", objc_opt_class(DeviceRestoreChoiceController), 1);

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

- (id)doesRestartFlowCauseEraseBlock
{
  return self->_doesRestartFlowCauseEraseBlock;
}

- (void)setDoesRestartFlowCauseEraseBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)prepareForDeviceMigrationBlock
{
  return self->_prepareForDeviceMigrationBlock;
}

- (void)setPrepareForDeviceMigrationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)startDeviceMigrationBlock
{
  return self->_startDeviceMigrationBlock;
}

- (void)setStartDeviceMigrationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (BOOL)didReconnect
{
  return self->_didReconnect;
}

- (void)setDidReconnect:(BOOL)a3
{
  self->_didReconnect = a3;
}

- (BOOL)userDidCancelReconnect
{
  return self->_userDidCancelReconnect;
}

- (void)setUserDidCancelReconnect:(BOOL)a3
{
  self->_userDidCancelReconnect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong(&self->_startDeviceMigrationBlock, 0);
  objc_storeStrong(&self->_prepareForDeviceMigrationBlock, 0);
  objc_storeStrong(&self->_doesRestartFlowCauseEraseBlock, 0);
  objc_storeStrong((id *)&self->_miscState, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
}

@end

@implementation BuddyProximityApplySettingsController

- (BuddyProximityApplySettingsController)init
{
  NSBundle *v2;
  id v3;
  id v4;
  BuddyProximityApplySettingsController *v5;
  id v6;
  id v7;
  BuddyProximityApplySettingsController *v8;
  objc_super v10;
  id v11[2];
  id location;

  location = self;
  v11[1] = (id)a2;
  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v3 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("PROXIMITY_SETUP_SETTING_UP"));
  v11[0] = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", v3, &stru_100284738, CFSTR("Localizable"));

  v4 = location;
  location = 0;
  v10.receiver = v4;
  v10.super_class = (Class)BuddyProximityApplySettingsController;
  v5 = -[BuddyProximityApplySettingsController initWithSpinnerText:](&v10, "initWithSpinnerText:", v11[0]);
  location = v5;
  objc_storeStrong(&location, v5);
  if (v5)
  {
    v6 = objc_msgSend(location, "navigationItem");
    objc_msgSend(v6, "setTitle:", &stru_100284738);

    v7 = objc_msgSend(location, "navigationItem");
    objc_msgSend(v7, "setHidesBackButton:animated:", 1, 0);

  }
  v8 = (BuddyProximityApplySettingsController *)location;
  objc_storeStrong(v11, 0);
  objc_storeStrong(&location, 0);
  return v8;
}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(id *);
  void *v8;
  BuddyProximityApplySettingsController *v9;
  objc_super v10;
  BOOL v11;
  SEL v12;
  BuddyProximityApplySettingsController *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BuddyProximityApplySettingsController;
  -[BuddyProximityApplySettingsController viewDidAppear:](&v10, "viewDidAppear:", a3);
  v3 = dispatch_get_global_queue(0, 0);
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_100061B88;
  v8 = &unk_100280730;
  v9 = v13;
  dispatch_async(v3, &v4);

  objc_storeStrong((id *)&v9, 0);
}

- (BOOL)addWirelessNetworks
{
  ProximitySetupController *v2;
  const void *v3;
  id v4;
  unint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSNull *v11;
  char v12;
  CFTypeRef cf;
  id location;
  id v16;
  unint64_t i;
  os_log_type_t v18;
  os_log_t oslog;
  char v20;
  CFTypeRef v21;
  id v22[3];
  uint8_t buf[24];

  v22[2] = self;
  v22[1] = (id)a2;
  v2 = -[BuddyProximityApplySettingsController proximitySetupController](self, "proximitySetupController");
  v22[0] = -[ProximitySetupController information](v2, "information");

  v3 = (const void *)WiFiManagerClientCreate(kCFAllocatorDefault, 0);
  v21 = v3;
  v20 = 0;
  if (v3)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v3);
    v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(v22[0], "networks");
      sub_1000342B4((uint64_t)buf, (uint64_t)objc_msgSend(v4, "count"));
      _os_log_impl((void *)&_mh_execute_header, oslog, v18, "Adding auto-join information for %llu Wi-Fi networks...", buf, 0xCu);

    }
    objc_storeStrong((id *)&oslog, 0);
    for (i = 0; ; ++i)
    {
      v5 = i;
      v6 = objc_msgSend(v22[0], "networks");
      v7 = objc_msgSend(v6, "count");

      if (v5 >= (unint64_t)v7)
        break;
      v8 = objc_msgSend(v22[0], "networks");
      v16 = objc_msgSend(v8, "objectAtIndexedSubscript:", i);

      v9 = objc_msgSend(v22[0], "networkPasswords");
      location = objc_msgSend(v9, "objectAtIndexedSubscript:", i);

      cf = (CFTypeRef)WiFiNetworkCreate(kCFAllocatorDefault, v16);
      v10 = location;
      v11 = +[NSNull null](NSNull, "null");
      LODWORD(v10) = objc_msgSend(v10, "isEqual:", v11) & 1;

      if (!(_DWORD)v10)
        WiFiNetworkSetPassword(cf, location);
      WiFiManagerClientAddNetwork(v21, cf);
      CFRelease(cf);
      v20 = 1;
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v16, 0);
    }
    CFRelease(v21);
  }
  v12 = v20;
  objc_storeStrong(v22, 0);
  return v12 & 1;
}

- (void)waitForWirelessConnection:(id)a3
{
  uint64_t v3;
  BYNetworkMonitor *v4;
  void **v5;
  int v6;
  int v7;
  void (*v8)(NSObject *, char);
  void *v9;
  BuddyProximityApplySettingsController *v10;
  id v11;
  os_log_type_t v12;
  os_log_t oslog;
  id location[2];
  BuddyProximityApplySettingsController *v15;
  uint8_t buf[8];

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100046FA0(buf, 15);
    _os_log_impl((void *)&_mh_execute_header, oslog, v12, "Proximity added Wi-Fi networks, waiting %d seconds for one to be joined...", buf, 8u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v4 = +[BYNetworkMonitor sharedInstance](BYNetworkMonitor, "sharedInstance");
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_100062380;
  v9 = &unk_100280708;
  v10 = v15;
  v11 = location[0];
  -[BYNetworkMonitor withMinimumNetworkType:timeout:runBlock:](v4, "withMinimumNetworkType:timeout:runBlock:", 1, &v5, 15.0);

  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)endProximityIfApplicable
{
  ProximitySetupController *v2;
  char v3;
  ProximitySetupController *v4;
  SASProximityInformation *v5;
  id v6;
  BOOL v7;
  ProximitySetupController *v8;
  SASProximityInformation *v9;
  id v10;
  unsigned __int8 v11;
  ProximitySetupController *v12;
  SASProximityInformation *v13;
  id v14;
  unsigned __int8 v15;
  ProximitySetupController *v16;
  char v17;
  BOOL v18;

  v2 = -[BuddyProximityApplySettingsController proximitySetupController](self, "proximitySetupController");
  v3 = !-[ProximitySetupController hasConnection](v2, "hasConnection");

  if ((v3 & 1) == 0)
  {
    v4 = -[BuddyProximityApplySettingsController proximitySetupController](self, "proximitySetupController");
    v5 = -[ProximitySetupController information](v4, "information");
    v6 = -[SASProximityInformation appleID](v5, "appleID");
    v7 = v6 != 0;

    v18 = v7;
    v8 = -[BuddyProximityApplySettingsController proximitySetupController](self, "proximitySetupController");
    v9 = -[ProximitySetupController information](v8, "information");
    v10 = -[SASProximityInformation hasTransferrableTelephonyPlan](v9, "hasTransferrableTelephonyPlan");
    v11 = objc_msgSend(v10, "BOOLValue");

    v17 = v11 & 1;
    v12 = -[BuddyProximityApplySettingsController proximitySetupController](self, "proximitySetupController");
    v13 = -[ProximitySetupController information](v12, "information");
    v14 = -[SASProximityInformation supportsDeviceToDeviceMigration](v13, "supportsDeviceToDeviceMigration");
    v15 = objc_msgSend(v14, "BOOLValue");

    if (!v18 && (v17 & 1) == 0 && (v15 & 1) == 0)
    {
      v16 = -[BuddyProximityApplySettingsController proximitySetupController](self, "proximitySetupController");
      -[ProximitySetupController setupFinished](v16, "setupFinished");

    }
  }
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  ProximitySetupController *v3;
  void **v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void *v8;
  BuddyProximityApplySettingsController *v9;
  id v10;
  id location[2];
  BuddyProximityApplySettingsController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyProximityApplySettingsController proximitySetupController](v12, "proximitySetupController");
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1000627AC;
  v8 = &unk_100281078;
  v9 = v12;
  v10 = location[0];
  -[ProximitySetupController waitForIntent:](v3, "waitForIntent:", &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)isEphemeral
{
  return 1;
}

- (BOOL)shouldAllowStartOver
{
  return 0;
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
  objc_storeStrong((id *)&self->_networkProvider, a3);
}

- (id)prepareForDeviceMigrationBlock
{
  return self->_prepareForDeviceMigrationBlock;
}

- (void)setPrepareForDeviceMigrationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)startTime
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStartTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong(&self->_prepareForDeviceMigrationBlock, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
}

@end

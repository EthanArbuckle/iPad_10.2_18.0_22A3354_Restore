@implementation BuddySafetyController

- (BuddySafetyController)init
{
  NSBundle *v3;
  NSString *v4;
  NSBundle *v5;
  NSString *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  BuddySafetyController *v12;
  objc_super v14;
  SEL v15;
  id location;

  v15 = a2;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("SAFETY_TITLE"), &stru_100284738, CFSTR("Localizable"));
  v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("SAFETY_DETAIL"), &stru_100284738, CFSTR("Localizable"));
  location = 0;
  v14.receiver = self;
  v14.super_class = (Class)BuddySafetyController;
  location = -[BuddySafetyController initWithTitle:detailText:symbolName:](&v14, "initWithTitle:detailText:symbolName:", v4, v6, 0);
  objc_storeStrong(&location, location);

  v7 = dispatch_get_global_queue(0, 0);
  v8 = (void *)*((_QWORD *)location + 5);
  *((_QWORD *)location + 5) = v7;

  v9 = objc_alloc((Class)CoreTelephonyClient);
  v10 = objc_msgSend(v9, "initWithQueue:", *((_QWORD *)location + 5));
  v11 = (void *)*((_QWORD *)location + 6);
  *((_QWORD *)location + 6) = v10;

  v12 = (BuddySafetyController *)location;
  objc_storeStrong(&location, 0);
  return v12;
}

- (void)viewDidLoad
{
  BuddySafetyController *v2;
  NSBundle *v3;
  NSString *v4;
  UIImage *v5;
  id v6;
  BuddySafetyController *v7;
  NSBundle *v8;
  NSString *v9;
  NSBundle *v10;
  NSString *v11;
  BYCapabilities *v12;
  BuddySafetyController *v13;
  NSBundle *v14;
  NSString *v15;
  NSBundle *v16;
  NSString *v17;
  UIImage *v18;
  CoreTelephonyClient *v19;
  id v20;
  BOOL v21;
  uint64_t v22;
  BuddySafetyController *v23;
  NSBundle *v24;
  NSString *v25;
  NSBundle *v26;
  NSString *v27;
  id v28;
  NSString *v29;
  id v30;
  NSArray *v31;
  char v32;
  NSString *v33;
  char v34;
  id v35;
  os_log_t oslog;
  id obj;
  id location;
  id v39;
  objc_super v40;
  SEL v41;
  BuddySafetyController *v42;
  uint64_t v43;
  uint8_t buf[24];

  v42 = self;
  v41 = a2;
  v40.receiver = self;
  v40.super_class = (Class)BuddySafetyController;
  -[BuddySafetyController viewDidLoad](&v40, "viewDidLoad");
  v2 = v42;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_100284738, CFSTR("Localizable"));
  -[BuddyWelcomeController addBoldButton:action:](v2, "addBoldButton:action:", v4, "_continueTapped");

  v39 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("d3x.arrows.left.and.right"));
  if ((SBUIIsSystemApertureEnabled() & 1) != 0)
  {
    v5 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("d7x.arrows.left.and.right"));
    v6 = v39;
    v39 = v5;

  }
  v7 = v42;
  v8 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v9 = -[NSBundle localizedStringForKey:value:table:](v8, "localizedStringForKey:value:table:", CFSTR("PRESS_HOLD_TO_CALL_TITLE"), &stru_100284738, CFSTR("Localizable"));
  v10 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v11 = -[NSBundle localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", CFSTR("PRESS_HOLD_TO_CALL_DESCRIPTION"), &stru_100284738, CFSTR("Localizable"));
  -[BuddySafetyController addBulletedListItemWithTitle:description:image:](v7, "addBulletedListItemWithTitle:description:image:", v9, v11, v39);

  v12 = -[BuddySafetyController capabilities](v42, "capabilities");
  LOBYTE(v7) = -[BYCapabilities supportsKappaDetection](v12, "supportsKappaDetection");

  if ((v7 & 1) != 0)
  {
    v13 = v42;
    v14 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v15 = -[NSBundle localizedStringForKey:value:table:](v14, "localizedStringForKey:value:table:", CFSTR("CAR_CRASH_DETECTION_TITLE"), &stru_100284738, CFSTR("Localizable"));
    v16 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v17 = -[NSBundle localizedStringForKey:value:table:](v16, "localizedStringForKey:value:table:", CFSTR("CAR_CRASH_DETECTION_DESCRIPTION"), &stru_100284738, CFSTR("Localizable"));
    v18 = +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("car"));
    -[BuddySafetyController addBulletedListItemWithTitle:description:image:](v13, "addBulletedListItemWithTitle:description:image:", v15, v17, v18);

  }
  location = 0;
  v19 = -[BuddySafetyController coreTelephonyClient](v42, "coreTelephonyClient");
  obj = 0;
  v20 = -[CoreTelephonyClient getStewieSupport:](v19, "getStewieSupport:", &obj);
  objc_storeStrong(&location, obj);
  v21 = 0;
  if ((objc_msgSend(v20, "hwSupport") & 1) != 0)
    v21 = location == 0;

  if (v21)
  {
    v23 = v42;
    v24 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v25 = -[NSBundle localizedStringForKey:value:table:](v24, "localizedStringForKey:value:table:", CFSTR("SATELLITE_TITLE"), &stru_100284738, CFSTR("Localizable"));
    v26 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v27 = -[NSBundle localizedStringForKey:value:table:](v26, "localizedStringForKey:value:table:", CFSTR("SATELLITE_DESCRIPTION"), &stru_100284738, CFSTR("Localizable"));
    v28 = +[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("satellite"));
    -[BuddySafetyController addBulletedListItemWithTitle:description:image:](v23, "addBulletedListItemWithTitle:description:image:", v25, v27, v28);

  }
  else if (location)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v22);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v34 = 0;
      v32 = 0;
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v29 = (NSString *)location;
      }
      else if (location)
      {
        v35 = objc_msgSend(location, "domain");
        v34 = 1;
        v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v35, objc_msgSend(location, "code"));
        v33 = v29;
        v32 = 1;
      }
      else
      {
        v29 = 0;
      }
      sub_100038C28((uint64_t)buf, (uint64_t)v29);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Error fetching Bifrost availibility %@", buf, 0xCu);
      if ((v32 & 1) != 0)

      if ((v34 & 1) != 0)
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v30 = -[BuddySafetyController buttonTray](v42, "buttonTray");
  v43 = BYPrivacySafetyFeaturesIdentifier;
  v31 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v43, 1);
  objc_msgSend(v30, "setPrivacyLinkForBundles:", v31);

  objc_storeStrong(&location, 0);
  objc_storeStrong(&v39, 0);
}

- (void)_continueTapped
{
  BYPreferencesController *v2;
  BFFFlowItemDelegate *v3;

  v2 = -[BuddySafetyController buddyPreferences](self, "buddyPreferences", a2);
  -[BYPreferencesController setObject:forKey:](v2, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("SafetyPresented"));

  v3 = -[BuddyWelcomeController delegate](self, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v3, "flowItemDone:", self);

}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupSafety;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

+ (void)skippedByCloudConfigWithEnvironment:(id)a3
{
  id v3;
  unsigned __int8 v4;
  id v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(location[0], "runState");
  v4 = objc_msgSend(v3, "hasCompletedInitialRun");

  if ((v4 & 1) == 0)
  {
    v5 = objc_msgSend(location[0], "emergencyExecutor");
    objc_msgSend(v5, "setKappaTriggersEmergencySOS:", 0);

  }
  objc_storeStrong(location, 0);
}

- (BOOL)controllerNeedsToRun
{
  BYCapabilities *v2;
  unsigned __int8 v3;
  char v4;
  char v6;
  BYPreferencesController *v7;
  char v9;

  v2 = -[BuddySafetyController capabilities](self, "capabilities");
  v3 = -[BYCapabilities supportsKappaDetection](v2, "supportsKappaDetection");
  v6 = 0;
  v4 = 0;
  if ((v3 & 1) != 0)
  {
    v7 = -[BuddySafetyController buddyPreferences](self, "buddyPreferences");
    v6 = 1;
    v4 = -[BYPreferencesController BOOLForKey:](v7, "BOOLForKey:", CFSTR("SafetyPresented")) ^ 1;
  }
  v9 = v4 & 1;
  if ((v6 & 1) != 0)

  return v9 & 1;
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferences, a3);
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
  objc_storeStrong((id *)&self->_runState, a3);
}

- (OS_dispatch_queue)stewieSupportQueue
{
  return self->_stewieSupportQueue;
}

- (void)setStewieSupportQueue:(id)a3
{
  objc_storeStrong((id *)&self->_stewieSupportQueue, a3);
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_stewieSupportQueue, 0);
  objc_storeStrong((id *)&self->_runState, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
}

@end

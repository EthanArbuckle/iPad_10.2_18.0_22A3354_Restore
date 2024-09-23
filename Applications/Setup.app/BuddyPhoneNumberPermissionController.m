@implementation BuddyPhoneNumberPermissionController

- (BuddyPhoneNumberPermissionController)init
{
  NSBundle *v2;
  NSBundle *v3;
  id v4;
  BuddyPhoneNumberPermissionController *v5;
  objc_super v7;
  id v8;
  id v9[2];
  id location;

  location = self;
  v9[1] = (id)a2;
  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v9[0] = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", CFSTR("PHONE_NUMBER_PERMISSION_TITLE"), &stru_100284738, CFSTR("Localizable"));

  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v8 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("PHONE_NUMBER_PERMISSION_INFO_WITHOUT_WIRELESS_DATA_NOTICE"), &stru_100284738, CFSTR("Localizable"));

  v4 = location;
  location = 0;
  v7.receiver = v4;
  v7.super_class = (Class)BuddyPhoneNumberPermissionController;
  location = -[BuddyPhoneNumberPermissionController initWithTitle:detailText:icon:](&v7, "initWithTitle:detailText:icon:", v9[0], v8, 0);
  objc_storeStrong(&location, location);
  if (location)
  {
    *((_BYTE *)location + 16) = 1;
    *((_BYTE *)location + 17) = 0;
  }
  v5 = (BuddyPhoneNumberPermissionController *)location;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v9, 0);
  objc_storeStrong(&location, 0);
  return v5;
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  double v4;
  id v5;
  NSArray *v6;
  BuddyPhoneNumberPermissionController *v7;
  NSBundle *v8;
  NSString *v9;
  BuddyPhoneNumberPermissionController *v10;
  NSBundle *v11;
  NSString *v12;
  id v13;
  objc_super v14;
  SEL v15;
  BuddyPhoneNumberPermissionController *v16;
  _QWORD v17[3];

  v16 = self;
  v15 = a2;
  v14.receiver = self;
  v14.super_class = (Class)BuddyPhoneNumberPermissionController;
  -[BuddyPhoneNumberPermissionController viewDidLoad](&v14, "viewDidLoad");
  v2 = -[BuddyPhoneNumberPermissionController headerView](v16, "headerView");
  objc_msgSend(v2, "setIconInheritsTint:", 0);

  v3 = -[BuddyPhoneNumberPermissionController headerView](v16, "headerView");
  LODWORD(v4) = 0;
  objc_msgSend(v3, "setTitleHyphenationFactor:", v4);

  v5 = -[BuddyPhoneNumberPermissionController buttonTray](v16, "buttonTray");
  v17[0] = BYPrivacyiMessageFaceTimeIdentifier;
  v17[1] = BYPrivacyFaceTimeIdentifier;
  v17[2] = BYPrivacyMessagesIdentifier;
  v6 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 3);
  objc_msgSend(v5, "setPrivacyLinkForBundles:", v6);

  v7 = v16;
  v8 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v9 = -[NSBundle localizedStringForKey:value:table:](v8, "localizedStringForKey:value:table:", CFSTR("PHONE_NUMBER_PERMISSION_ALLOW"), &stru_100284738, CFSTR("Localizable"));
  -[BuddyWelcomeController addBoldButton:action:](v7, "addBoldButton:action:", v9, "_continueTapped");

  v10 = v16;
  v11 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v12 = -[NSBundle localizedStringForKey:value:table:](v11, "localizedStringForKey:value:table:", CFSTR("PHONE_NUMBER_PERMISSION_NOTNOW"), &stru_100284738, CFSTR("Localizable"));
  -[BuddyWelcomeController addLinkButton:action:](v10, "addLinkButton:action:", v12, "_notNowTapped");

  v13 = -[BuddyPhoneNumberPermissionController buddy_animationController:](v16, "buddy_animationController:", CFSTR("iMessageFaceTime"));
  -[BuddyPhoneNumberPermissionController setAnimationController:](v16, "setAnimationController:", v13);

}

- (void)viewWillAppear:(BOOL)a3
{
  OBAnimationController *v3;
  objc_super v4;
  BOOL v5;
  SEL v6;
  BuddyPhoneNumberPermissionController *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyPhoneNumberPermissionController;
  -[BuddyPhoneNumberPermissionController viewWillAppear:](&v4, "viewWillAppear:", a3);
  v3 = -[BuddyPhoneNumberPermissionController animationController](v7, "animationController");
  -[OBAnimationController startAnimation](v3, "startAnimation");

}

+ (BOOL)controllerAffectedByTapFreeSetup
{
  return 1;
}

- (BOOL)controllerNeedsToRun
{
  BYPreferencesController *v2;
  unsigned __int8 v3;
  BYRunState *v4;
  char v5;
  BYCapabilities *v6;
  unsigned __int8 v7;
  id v8;
  char v9;
  NSObject *v10;
  os_log_type_t v11;
  NSObject *v12;
  os_log_type_t v13;
  NSObject *v14;
  os_log_type_t v15;
  id v16;
  BOOL v17;
  NSObject *v18;
  os_log_type_t v19;
  _WORD v21[3];
  os_log_type_t v22;
  os_log_t v23;
  char v24;
  id v25;
  char v26;
  id v27;
  uint8_t v28[7];
  os_log_type_t v29;
  os_log_t v30;
  uint8_t v31[7];
  os_log_type_t v32;
  os_log_t oslog;
  uint8_t buf[7];
  os_log_type_t v35;
  id location;
  char v37;
  BYCapabilities *v38;
  char v39;
  char v40;
  char v41;
  char v42;
  BOOL v43;
  SEL v44;
  BuddyPhoneNumberPermissionController *v45;

  v45 = self;
  v44 = a2;
  v43 = 1;
  v2 = -[BuddyPhoneNumberPermissionController buddyPreferences](self, "buddyPreferences");
  v3 = -[BYPreferencesController BOOLForKey:](v2, "BOOLForKey:", CFSTR("PhoneNumberPermissionPresentedKey"));

  v42 = v3 & 1;
  v4 = -[BuddyPhoneNumberPermissionController runState](v45, "runState");
  v5 = -[BYRunState hasCompletedInitialRun](v4, "hasCompletedInitialRun") ^ 1;

  v41 = v5 & 1;
  v6 = -[BuddyPhoneNumberPermissionController capabilities](v45, "capabilities");
  v7 = -[BYCapabilities mgHasCellularTelephony](v6, "mgHasCellularTelephony");

  v40 = v7 & 1;
  v39 = 0;
  v8 = (id)-[BuddyPhoneNumberPermissionController includeCellularDataCheck](v45, "includeCellularDataCheck");
  v37 = 0;
  v9 = 0;
  if ((v8 & 1) != 0)
  {
    v38 = -[BuddyPhoneNumberPermissionController capabilities](v45, "capabilities");
    v37 = 1;
    v8 = -[BYCapabilities mgHasCellularData](v38, "mgHasCellularData");
    v9 = (char)v8;
  }
  if ((v37 & 1) != 0)

  v39 = v9 & 1;
  if ((v41 & 1) == 0)
  {
    location = (id)_BYLoggingFacility(v8);
    v35 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      v10 = location;
      v11 = v35;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Phone Number Permission skipped because we're in mini-buddy", buf, 2u);
    }
    objc_storeStrong(&location, 0);
    return 0;
  }
  if ((v42 & 1) != 0)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v8);
    v32 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = oslog;
      v13 = v32;
      sub_100038C3C(v31);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Phone Number Permission already presented, skipping", v31, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    return 0;
  }
  if ((v39 & 1) == 0 && (v40 & 1) == 0)
  {
    v30 = (os_log_t)(id)_BYLoggingFacility(v8);
    v29 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v30;
      v15 = v29;
      sub_100038C3C(v28);
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Phone Number Permission needs cellular data/telephony, skipping", v28, 2u);
    }
    objc_storeStrong((id *)&v30, 0);
    return 0;
  }
  v16 = (id)-[BuddyPhoneNumberPermissionController includeAppleAccountCheck](v45, "includeAppleAccountCheck");
  v26 = 0;
  v24 = 0;
  v17 = 0;
  if ((v16 & 1) != 0)
  {
    v27 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
    v26 = 1;
    v16 = objc_msgSend(v27, "aa_primaryAppleAccount");
    v25 = v16;
    v24 = 1;
    v17 = v16 != 0;
  }
  if ((v24 & 1) != 0)

  if ((v26 & 1) != 0)
  if (!v17)
    return v43;
  v23 = (os_log_t)(id)_BYLoggingFacility(v16);
  v22 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v18 = v23;
    v19 = v22;
    sub_100038C3C(v21);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Phone Number Permission is only shown if there's no Apple ID signed in", (uint8_t *)v21, 2u);
  }
  objc_storeStrong((id *)&v23, 0);
  return 0;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  NSObject *v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(id *);
  void *v8;
  id v9;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = dispatch_get_global_queue(0, 0);
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1001891C0;
  v8 = &unk_100280780;
  v9 = location[0];
  dispatch_async(v3, &v4);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupiMessageAndFaceTime;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

+ (void)skippedByCloudConfigWithEnvironment:(id)a3
{
  NSObject *v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(uint64_t, uint64_t, id);
  void *v8;
  id v9[2];
  id location[2];
  id v11;

  v11 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_100189470;
  v8 = &unk_100283EA8;
  v9[1] = v11;
  v9[0] = location[0];
  v3 = dispatch_get_global_queue(2, 0);
  IDSRegistrationControlGetStateForRegistrationType(0, &v4, v3);

  objc_storeStrong(v9, 0);
  objc_storeStrong(location, 0);
}

+ (void)_registerPhoneNumberPermissionEnabled:(BOOL)a3 buddyPreferences:(id)a4
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  NSObject *v7;
  NSObject *v8;
  const void *v9;
  NSObject *v10;
  NSObject *v11;
  os_log_type_t v12;
  NSObject *v13;
  _WORD v14[7];
  os_log_type_t v15;
  os_log_t v16;
  os_log_type_t v17;
  os_log_t v18[2];
  id v19;
  CFTypeRef cf;
  uint8_t buf[7];
  os_log_type_t v22;
  os_log_t oslog;
  id location;
  BOOL v25;
  SEL v26;
  id v27;
  uint8_t v28[24];
  _QWORD v29[2];
  _QWORD v30[2];

  v27 = a1;
  v26 = a2;
  v25 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v4 = objc_msgSend(location, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("PhoneNumberPermissionPresentedKey"));
  if (v25)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v4);
    v22 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v5 = oslog;
      v6 = v22;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "User agreed to share phonenumber, registering enable state with IDS", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v7 = dispatch_get_global_queue(2, 0);
    IDSRegistrationControlEnableRegistrationType(0, &stru_100283EC8, v7);

    v8 = dispatch_get_global_queue(2, 0);
    v9 = (const void *)_CTServerConnectionCreateOnTargetQueue(kCFAllocatorDefault, CFSTR("com.apple.facetime"), v8, 0);

    cf = v9;
    if (v9)
    {
      v29[0] = kCTWiFiDataUsagePolicy;
      v30[0] = kCTCellularDataUsagePolicyAlwaysAllow;
      v29[1] = kCTCellularDataUsagePolicy;
      v30[1] = kCTCellularDataUsagePolicyAlwaysAllow;
      v19 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
      memset(&v18[1], 0, sizeof(os_log_t));
      v10 = _CTServerConnectionSetCellularUsagePolicy(cf, CFSTR("com.apple.facetime"), v19);
      v18[1] = v10;
      if (HIDWORD(v10))
      {
        v18[0] = (os_log_t)(id)_BYLoggingFacility(v10);
        v17 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v18[0], OS_LOG_TYPE_DEFAULT))
        {
          sub_10003CBAC((uint64_t)v28, SHIDWORD(v18[1]), (int)v18[1]);
          _os_log_impl((void *)&_mh_execute_header, v18[0], v17, "Could not enable data usage for FaceTime. error: %d domain: (%d)", v28, 0xEu);
        }
        objc_storeStrong((id *)v18, 0);
      }
      CFRelease(cf);
      objc_storeStrong(&v19, 0);
    }
  }
  else
  {
    v16 = (os_log_t)(id)_BYLoggingFacility(v4);
    v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v16;
      v12 = v15;
      sub_100038C3C(v14);
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "User declined to share phonenumber, registering disable state with IDS", (uint8_t *)v14, 2u);
    }
    objc_storeStrong((id *)&v16, 0);
    v13 = dispatch_get_global_queue(2, 0);
    IDSRegistrationControlDisableRegistrationType(0, &stru_100283EE8, v13);

  }
  objc_storeStrong(&location, 0);
}

- (void)_continueTapped
{
  void *v2;
  BYPreferencesController *v3;
  BFFFlowItemDelegate *v4;

  v2 = (void *)objc_opt_class(self);
  v3 = -[BuddyPhoneNumberPermissionController buddyPreferences](self, "buddyPreferences", a2);
  objc_msgSend(v2, "_registerPhoneNumberPermissionEnabled:buddyPreferences:", 1, v3);

  v4 = -[BuddyWelcomeController delegate](self, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v4, "flowItemDone:", self);

}

- (void)_notNowTapped
{
  void *v2;
  BYPreferencesController *v3;
  BFFFlowItemDelegate *v4;

  v2 = (void *)objc_opt_class(self);
  v3 = -[BuddyPhoneNumberPermissionController buddyPreferences](self, "buddyPreferences", a2);
  objc_msgSend(v2, "_registerPhoneNumberPermissionEnabled:buddyPreferences:", 0, v3);

  v4 = -[BuddyWelcomeController delegate](self, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v4, "flowItemDone:", self);

}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferences, a3);
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
  objc_storeStrong((id *)&self->_runState, a3);
}

- (BOOL)includeAppleAccountCheck
{
  return self->_includeAppleAccountCheck;
}

- (void)setIncludeAppleAccountCheck:(BOOL)a3
{
  self->_includeAppleAccountCheck = a3;
}

- (BOOL)includeCellularDataCheck
{
  return self->_includeCellularDataCheck;
}

- (void)setIncludeCellularDataCheck:(BOOL)a3
{
  self->_includeCellularDataCheck = a3;
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
  objc_storeStrong((id *)&self->_animationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_runState, 0);
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
}

@end

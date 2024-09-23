@implementation BuddyChinaPhoneNumberPermissionController

- (BuddyChinaPhoneNumberPermissionController)init
{
  BuddyChinaPhoneNumberPermissionController *v2;
  objc_super v4;
  SEL v5;
  id location;

  v5 = a2;
  location = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddyChinaPhoneNumberPermissionController;
  location = -[BuddyPhoneNumberPermissionController init](&v4, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    objc_msgSend(location, "setIncludeAppleAccountCheck:", 0);
    objc_msgSend(location, "setIncludeCellularDataCheck:", 1);
  }
  v2 = (BuddyChinaPhoneNumberPermissionController *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)viewDidLoad
{
  id v2;
  NSBundle *v3;
  id v4;
  NSString *v5;
  objc_super v6;
  SEL v7;
  BuddyChinaPhoneNumberPermissionController *v8;

  v8 = self;
  v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)BuddyChinaPhoneNumberPermissionController;
  -[BuddyPhoneNumberPermissionController viewDidLoad](&v6, "viewDidLoad");
  v2 = -[BuddyChinaPhoneNumberPermissionController headerView](v8, "headerView");
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("PHONE_NUMBER_PERMISSION_INFO_WITH_WIRELESS_DATA_NOTICE"));
  v5 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", v4, &stru_100284738, CFSTR("Localizable"));
  objc_msgSend(v2, "setDetailText:", v5);

}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupMessagingActivationUsingPhoneNumber;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (BOOL)controllerNeedsToRun
{
  BYCapabilities *v2;
  unsigned __int8 v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _WORD v8[7];
  os_log_type_t v9;
  os_log_t oslog;
  objc_super v11;
  SEL v12;
  BuddyChinaPhoneNumberPermissionController *v13;

  v13 = self;
  v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)BuddyChinaPhoneNumberPermissionController;
  if (!-[BuddyPhoneNumberPermissionController controllerNeedsToRun](&v11, "controllerNeedsToRun"))
    return 0;
  v2 = -[BuddyPhoneNumberPermissionController capabilities](v13, "capabilities");
  v3 = -[BYCapabilities mgHasGreenTea](v2, "mgHasGreenTea");

  if ((v3 & 1) != 0)
    return 1;
  oslog = (os_log_t)(id)_BYLoggingFacility(v4);
  v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v5 = oslog;
    v6 = v9;
    sub_100038C3C(v8);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "PhoneNumber Permission can only be shown in China, skipping", (uint8_t *)v8, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  return 0;
}

@end

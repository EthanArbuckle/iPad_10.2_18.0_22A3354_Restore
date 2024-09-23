@implementation BuddyAppleIDiCloudDrivePage

- (BuddyAppleIDiCloudDrivePage)init
{
  NSBundle *v3;
  NSString *v4;
  NSBundle *v5;
  NSString *v6;
  BuddyAppleIDiCloudDrivePage *v7;
  objc_super v9;
  SEL v10;
  id location;

  v10 = a2;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("ICLOUD_DRIVE_TITLE"), &stru_100284738, CFSTR("Localizable"));
  v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("ICLOUD_DRIVE_DETAIL"), &stru_100284738, CFSTR("Localizable"));
  location = 0;
  v9.receiver = self;
  v9.super_class = (Class)BuddyAppleIDiCloudDrivePage;
  location = -[BuddyAppleIDiCloudDrivePage initWithTitle:detailText:symbolName:](&v9, "initWithTitle:detailText:symbolName:", v4, v6, CFSTR("icloud.fill"));
  objc_storeStrong(&location, location);

  v7 = (BuddyAppleIDiCloudDrivePage *)location;
  objc_storeStrong(&location, 0);
  return v7;
}

- (void)viewDidLoad
{
  BuddyAppleIDiCloudDrivePage *v2;
  NSBundle *v3;
  NSString *v4;
  objc_super v5;
  SEL v6;
  BuddyAppleIDiCloudDrivePage *v7;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)BuddyAppleIDiCloudDrivePage;
  -[BuddyAppleIDiCloudDrivePage viewDidLoad](&v5, "viewDidLoad");
  v2 = v7;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_100284738, CFSTR("Localizable"));
  -[BuddyWelcomeController addBoldButton:action:](v2, "addBoldButton:action:", v4, "_continueTapped:");

}

- (void)_continueTapped:(id)a3
{
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  id v6;
  id v7;
  BFFFlowItemDelegate *v8;
  void **v9;
  int v10;
  int v11;
  void (*v12)(NSObject *, void *, void *, void *);
  void *v13;
  id v14;
  uint8_t buf[7];
  os_log_type_t v16;
  os_log_t oslog;
  id v18;
  id v19;
  id v20;
  id location[2];
  BuddyAppleIDiCloudDrivePage *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
  v20 = objc_msgSend(v3, "aa_primaryAppleAccount");

  v19 = objc_msgSend(v20, "aa_personID");
  v18 = objc_msgSend(objc_alloc((Class)AACloudKitStartMigrationRequest), "initWithAccount:", v20);
  oslog = (os_log_t)(id)_BYLoggingFacility(v18);
  v16 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = oslog;
    v5 = v16;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Starting request to begin CloudKit migration...", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v6 = v18;
  v9 = _NSConcreteStackBlock;
  v10 = -1073741824;
  v11 = 0;
  v12 = sub_1000AF7F0;
  v13 = &unk_100282140;
  v14 = v19;
  objc_msgSend(v6, "performRequestWithHandler:", &v9);
  objc_msgSend(v20, "aa_setUsesCloudDocs:", 1);
  v7 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
  objc_msgSend(v7, "saveAccount:withCompletionHandler:", v20, 0);

  v8 = -[BuddyWelcomeController delegate](v22, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v8, "flowItemDone:", v22);

  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)controllerNeedsToRun
{
  id v2;
  MCProfileConnection *v3;
  unsigned int v4;
  id location[2];
  BuddyAppleIDiCloudDrivePage *v7;
  BOOL v8;

  v7 = self;
  location[1] = (id)a2;
  v2 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
  location[0] = objc_msgSend(v2, "aa_primaryAppleAccount");

  if (location[0])
  {
    v3 = -[BuddyAppleIDiCloudDrivePage managedConfiguration](v7, "managedConfiguration");
    v4 = -[MCProfileConnection BOOLRestrictionForFeature:](v3, "BOOLRestrictionForFeature:", MCFeatureCloudDocumentSyncAllowed);

    v8 = v4 != 2;
  }
  else
  {
    v8 = 0;
  }
  objc_storeStrong(location, 0);
  return v8;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  id v6;
  void **v7;
  int v8;
  int v9;
  void (*v10)(NSObject *, void *, void *, void *);
  void *v11;
  id v12;
  uint8_t buf[15];
  os_log_type_t v14;
  os_log_t oslog;
  id v16;
  id v17;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
  v17 = objc_msgSend(v3, "aa_primaryAppleAccount");

  v16 = objc_msgSend(objc_alloc((Class)AACloudKitMigrationStateRequest), "initWithAccount:", v17);
  oslog = (os_log_t)(id)_BYLoggingFacility(v16);
  v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = oslog;
    v5 = v14;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Fetching CloudKit migration state...", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v6 = v16;
  v7 = _NSConcreteStackBlock;
  v8 = -1073741824;
  v9 = 0;
  v10 = sub_1000AFC2C;
  v11 = &unk_100281820;
  v12 = location[0];
  objc_msgSend(v6, "performRequestWithHandler:", &v7);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
}

@end

@implementation BuddyTermsConditionsFlow

- (BuddyTermsConditionsFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
{
  id v9;
  NSArray *v10;
  BuddyTermsConditionsFlow *v11;
  objc_super v13;
  id v14;
  id v15;
  id v16;
  id location[2];
  id v18;
  _QWORD v19[2];

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v15 = 0;
  objc_storeStrong(&v15, a5);
  v14 = 0;
  objc_storeStrong(&v14, a6);
  v9 = v18;
  v18 = 0;
  v13.receiver = v9;
  v13.super_class = (Class)BuddyTermsConditionsFlow;
  v18 = -[BuddyTermsConditionsFlow initWithNavigationController:flowDelegate:flowStarter:dependencyInjector:](&v13, "initWithNavigationController:flowDelegate:flowStarter:dependencyInjector:", location[0], v16, v15, v14);
  objc_storeStrong(&v18, v18);
  if (v18)
  {
    v19[0] = objc_opt_class(BuddyCombinedTermsController);
    v19[1] = objc_opt_class(BuddyTCController);
    v10 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2);
    objc_msgSend(v18, "setClassList:", v10);

  }
  v11 = (BuddyTermsConditionsFlow *)v18;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v18, 0);
  return v11;
}

+ (void)didAgreeToServerTerms
{
  NSObject *v2;
  os_log_type_t v3;
  _WORD v4[3];
  os_log_type_t v5;
  os_log_t oslog[3];

  oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(a1);
  v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v5;
    sub_100038C3C(v4);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Did agree to server terms", (uint8_t *)v4, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  byte_1002EEC88 = 1;
}

+ (id)allowedFlowItems
{
  _QWORD v3[2];

  v3[0] = objc_opt_class(BuddyCombinedTermsController);
  v3[1] = objc_opt_class(BuddyTCController);
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 2);
}

- (id)controllerFollowingControllerClass:(Class)a3 requestedNext:(Class)a4
{
  objc_super v5;
  Class v6;
  Class v7;
  SEL v8;
  BuddyTermsConditionsFlow *v9;
  id v10;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6 = a4;
  if ((objc_msgSend((id)objc_opt_class(self), "controllerNeedsToRun") & 1) != 0)
  {
    v5.receiver = v9;
    v5.super_class = (Class)BuddyTermsConditionsFlow;
    v10 = -[BuddyTermsConditionsFlow controllerFollowingControllerClass:requestedNext:](&v5, "controllerFollowingControllerClass:requestedNext:", v7, v6);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

+ (BOOL)controllerNeedsToRun
{
  unsigned __int8 v2;
  BOOL v3;

  v2 = +[BYLicenseAgreement needsToAcceptNewAgreement](BYLicenseAgreement, "needsToAcceptNewAgreement", a2, a1);
  v3 = 0;
  if ((v2 & 1) != 0)
    return !(byte_1002EEC88 & 1);
  return v3;
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupTOS;
}

+ (void)skippedByCloudConfig
{
  NSObject *v2;
  os_log_type_t v3;
  NSFileManager *v4;
  unsigned __int8 v5;
  uint64_t v6;
  NSString *v7;
  char v8;
  NSString *v9;
  char v10;
  id v11;
  os_log_t v12;
  id obj;
  id location;
  uint8_t buf[7];
  os_log_type_t v16;
  os_log_t oslog[3];
  uint8_t v18[24];

  oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(a1);
  v16 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v16;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Terms and Conditions pane skipped by cloud config, removing license and warranty sentinels", buf, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  location = 0;
  v4 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  obj = 0;
  v5 = -[NSFileManager removeItemAtPath:error:](v4, "removeItemAtPath:error:", CFSTR("/var/mobile/Media/iTunes_Control/iTunes/ShowLicense"), &obj);
  objc_storeStrong(&location, obj);

  if (((v5 ^ 1) & 1) != 0)
  {
    v12 = (os_log_t)(id)_BYLoggingFacility(v6);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v10 = 0;
      v8 = 0;
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v7 = (NSString *)location;
      }
      else if (location)
      {
        v11 = objc_msgSend(location, "domain");
        v10 = 1;
        v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v11, objc_msgSend(location, "code"));
        v9 = v7;
        v8 = 1;
      }
      else
      {
        v7 = 0;
      }
      sub_100039500((uint64_t)v18, (uint64_t)v7);
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to remove license sentinel file: %{public}@", v18, 0xCu);
      if ((v8 & 1) != 0)

      if ((v10 & 1) != 0)
    }
    objc_storeStrong((id *)&v12, 0);
  }
  +[BYWarranty acknowledge](BYWarranty, "acknowledge");
  +[BYLicenseAgreement recordUserAcceptedAgreementVersion:](BYLicenseAgreement, "recordUserAcceptedAgreementVersion:", +[BYLicenseAgreement versionOfOnDiskAgreement](BYLicenseAgreement, "versionOfOnDiskAgreement"));
  objc_storeStrong(&location, 0);
}

@end

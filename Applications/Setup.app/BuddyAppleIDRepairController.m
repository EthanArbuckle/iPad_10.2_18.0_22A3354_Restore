@implementation BuddyAppleIDRepairController

- (BuddyAppleIDRepairController)init
{
  BuddyAppleIDRepairController *v2;
  id v3;
  BuddyAppleIDRepairController *v4;
  objc_super v6;
  SEL v7;
  id location;

  v7 = a2;
  location = 0;
  v6.receiver = self;
  v6.super_class = (Class)BuddyAppleIDRepairController;
  v2 = -[BuddyAppleIDSpinnerPage init](&v6, "init");
  location = v2;
  objc_storeStrong(&location, v2);
  if (v2)
  {
    v3 = objc_msgSend(location, "navigationItem");
    objc_msgSend(v3, "setHidesBackButton:animated:", 1, 0);

  }
  v4 = (BuddyAppleIDRepairController *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v3;
  id v4;
  ACAccount *v5;
  AKAccountManager *v6;
  ACAccount *v7;
  id v8;
  AKAccountManager *v9;
  id v10;
  ACAccount *v11;
  id v12;
  BOOL v13;
  void **v14;
  int v15;
  int v16;
  void (*v17)(NSObject *, void *, void *);
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id location[2];
  BuddyAppleIDRepairController *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
  v4 = objc_msgSend(v3, "aa_primaryAppleAccount");
  -[BuddyAppleIDRepairController setPrimaryAccount:](v24, "setPrimaryAccount:", v4);

  if (location[0])
  {
    v5 = -[BuddyAppleIDRepairController primaryAccount](v24, "primaryAccount");

    if (v5)
    {
      v6 = +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
      v7 = -[BuddyAppleIDRepairController primaryAccount](v24, "primaryAccount");
      v8 = -[ACAccount aa_altDSID](v7, "aa_altDSID");
      v22 = -[AKAccountManager authKitAccountWithAltDSID:](v6, "authKitAccountWithAltDSID:", v8);

      v9 = +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
      v10 = -[AKAccountManager repairStateForAccount:](v9, "repairStateForAccount:", v22);

      v21 = v10;
      if (v10)
      {
        v13 = 1;
        if (v21 != (id)2)
          v13 = v21 == (id)3;
        (*((void (**)(id, BOOL))location[0] + 2))(location[0], v13);
      }
      else
      {
        v20 = (id)objc_opt_new(AKAppleIDAuthenticationController);
        v11 = -[BuddyAppleIDRepairController primaryAccount](v24, "primaryAccount");
        v12 = -[ACAccount aa_altDSID](v11, "aa_altDSID");
        v14 = _NSConcreteStackBlock;
        v15 = -1073741824;
        v16 = 0;
        v17 = sub_1000F72F8;
        v18 = &unk_100282DA8;
        v19 = location[0];
        objc_msgSend(v20, "getUserInformationForAltDSID:completion:", v12, &v14);

        objc_storeStrong(&v19, 0);
        objc_storeStrong(&v20, 0);
      }
      objc_storeStrong(&v22, 0);
    }
    else
    {
      (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
    }
  }
  objc_storeStrong(location, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3;
  ACAccount *v4;
  id v5;
  AKAppleIDAuthenticationPurpleBuddyContext *v6;
  AKAppleIDAuthenticationPurpleBuddyContext *v7;
  AKAppleIDAuthenticationPurpleBuddyContext *v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  id v12;
  AKAppleIDAuthenticationPurpleBuddyContext *v13;
  void **v14;
  int v15;
  int v16;
  void (*v17)(NSObject *, void *, void *);
  void *v18;
  BuddyAppleIDRepairController *v19;
  uint8_t buf[7];
  os_log_type_t v21;
  os_log_t oslog;
  id location;
  objc_super v24;
  BOOL v25;
  SEL v26;
  BuddyAppleIDRepairController *v27;

  v27 = self;
  v26 = a2;
  v25 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BuddyAppleIDRepairController;
  -[BuddyAppleIDSpinnerPage viewDidAppear:](&v24, "viewDidAppear:", a3);
  v3 = objc_alloc_init((Class)AKAppleIDAuthenticationPurpleBuddyContext);
  -[BuddyAppleIDRepairController setAuthContext:](v27, "setAuthContext:", v3);

  v4 = -[BuddyAppleIDRepairController primaryAccount](v27, "primaryAccount");
  v5 = -[ACAccount aa_altDSID](v4, "aa_altDSID");
  v6 = -[BuddyAppleIDRepairController authContext](v27, "authContext");
  -[AKAppleIDAuthenticationPurpleBuddyContext setAltDSID:](v6, "setAltDSID:", v5);

  v7 = -[BuddyAppleIDRepairController authContext](v27, "authContext");
  -[AKAppleIDAuthenticationPurpleBuddyContext setNeedsRepair:](v7, "setNeedsRepair:", 1);

  v8 = -[BuddyAppleIDRepairController authContext](v27, "authContext");
  v9 = -[BuddyAppleIDRepairController navigationController](v27, "navigationController");
  -[AKAppleIDAuthenticationPurpleBuddyContext setPresentingViewController:](v8, "setPresentingViewController:", v9);

  location = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  oslog = (os_log_t)(id)_BYLoggingFacility(location);
  v21 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = oslog;
    v11 = v21;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Starting Apple ID repair flow...", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v12 = location;
  v13 = -[BuddyAppleIDRepairController authContext](v27, "authContext");
  v14 = _NSConcreteStackBlock;
  v15 = -1073741824;
  v16 = 0;
  v17 = sub_1000F76E0;
  v18 = &unk_100282880;
  v19 = v27;
  objc_msgSend(v12, "authenticateWithContext:completion:", v13, &v14);

  objc_storeStrong((id *)&v19, 0);
  objc_storeStrong(&location, 0);
}

+ (unint64_t)applicableDispositions
{
  return 4;
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupAppleID;
}

- (BOOL)shouldSuppressExtendedInitializationActivityIndicator
{
  return 0;
}

- (BOOL)responsibleForViewController:(id)a3
{
  id v3;
  uint64_t v4;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = location[0];
  v4 = objc_opt_class(RUIPage);
  LOBYTE(v3) = objc_opt_isKindOfClass(v3, v4);
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (ACAccount)primaryAccount
{
  return (ACAccount *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPrimaryAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (AKAppleIDAuthenticationPurpleBuddyContext)authContext
{
  return (AKAppleIDAuthenticationPurpleBuddyContext *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAuthContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_primaryAccount, 0);
}

@end

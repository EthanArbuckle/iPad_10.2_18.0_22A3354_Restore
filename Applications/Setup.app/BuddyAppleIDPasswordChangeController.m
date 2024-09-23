@implementation BuddyAppleIDPasswordChangeController

+ (BOOL)controllerNeedsToRun
{
  id v2;
  unsigned __int8 v3;
  uint64_t v4;
  const __CFString *v5;
  os_log_t oslog;
  char v8;
  SEL v9;
  id v10;
  uint8_t buf[24];

  v10 = a1;
  v9 = a2;
  v2 = +[BYManagedAppleIDBootstrap sharedManager](BYManagedAppleIDBootstrap, "sharedManager");
  v3 = objc_msgSend(v2, "passwordChangeFlowNeedsToRun");

  v8 = v3 & 1;
  oslog = (os_log_t)(id)_BYLoggingFacility(v4);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if ((v8 & 1) != 0)
      v5 = CFSTR("YASE");
    else
      v5 = CFSTR("NERP");
    sub_100039500((uint64_t)buf, (uint64_t)v5);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Password change flow needs to run = %{public}@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  return v8 & 1;
}

- (BuddyAppleIDPasswordChangeController)init
{
  BuddyAppleIDPasswordChangeController *v2;
  objc_super v4;
  SEL v5;
  id location;

  v5 = a2;
  location = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddyAppleIDPasswordChangeController;
  location = -[BuddyAppleIDPasswordChangeController initWithSpinnerText:](&v4, "initWithSpinnerText:", &stru_100284738);
  v2 = (BuddyAppleIDPasswordChangeController *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  BYNetworkMonitor *v3;
  UINavigationController *v4;
  UINavigationController *originalNavController;
  objc_super v6;
  BOOL v7;
  SEL v8;
  BuddyAppleIDPasswordChangeController *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BuddyAppleIDPasswordChangeController;
  -[BuddyAppleIDPasswordChangeController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v3 = +[BYNetworkMonitor sharedInstance](BYNetworkMonitor, "sharedInstance");
  -[BYNetworkMonitor addObserver:](v3, "addObserver:", v9);

  v4 = (UINavigationController *)-[BuddyAppleIDPasswordChangeController navigationController](v9, "navigationController");
  originalNavController = v9->_originalNavController;
  v9->_originalNavController = v4;

  -[BuddyAppleIDPasswordChangeController setFlowRetryCount:](v9, "setFlowRetryCount:", 0);
  -[BuddyAppleIDPasswordChangeController setShouldRetryFlow:](v9, "setShouldRetryFlow:", 0);
  -[BuddyAppleIDPasswordChangeController _startFlow](v9, "_startFlow");
}

- (void)viewDidDisappear:(BOOL)a3
{
  UINavigationController *v3;
  UINavigationController *originalNavController;
  objc_super v5;
  BOOL v6;
  SEL v7;
  BuddyAppleIDPasswordChangeController *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v3 = (UINavigationController *)-[BuddyAppleIDPasswordChangeController navigationController](self, "navigationController");
  originalNavController = v8->_originalNavController;
  v8->_originalNavController = v3;

  v5.receiver = v8;
  v5.super_class = (Class)BuddyAppleIDPasswordChangeController;
  -[BuddyAppleIDPasswordChangeController viewDidDisappear:](&v5, "viewDidDisappear:", v6);
}

- (void)_retryFlowIfPossibleOrFailWithError:(id)a3
{
  uint64_t v3;
  BYNetworkMonitor *v4;
  NSString *v5;
  id v6;
  NSString *v7;
  id v8;
  NSBundle *v9;
  NSBundle *v10;
  NSString *v11;
  NSBundle *v12;
  id v13;
  BOOL v14;
  NSBundle *v15;
  NSString *v16;
  id v17;
  void *v18;
  void **block;
  int v20;
  int v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  BuddyAppleIDPasswordChangeController *v28;
  id v29;
  id v30;
  id v31;
  id v33;
  char v34;
  id v35;
  char v36;
  id v37;
  os_log_type_t v38;
  os_log_t oslog;
  void **v40;
  int v41;
  int v42;
  id (*v43)(NSObject *, char);
  void *v44;
  BuddyAppleIDPasswordChangeController *v45;
  os_log_type_t v46;
  id v47;
  id location[2];
  BuddyAppleIDPasswordChangeController *v49;
  uint8_t v50[16];
  uint8_t buf[24];

  v49 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0]
    && (v3 = -[BuddyAppleIDPasswordChangeController shouldRetryFlow](v49, "shouldRetryFlow"), (v3 & 1) != 0)
    && (v3 = -[BuddyAppleIDPasswordChangeController flowRetryCount](v49, "flowRetryCount"), v3 < 2))
  {
    v47 = (id)_BYLoggingFacility(-[BuddyAppleIDPasswordChangeController setFlowRetryCount:](v49, "setFlowRetryCount:", (char *)-[BuddyAppleIDPasswordChangeController flowRetryCount](v49, "flowRetryCount")+ 1));
    v46 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_DEFAULT))
    {
      sub_1000342B4((uint64_t)buf, -[BuddyAppleIDPasswordChangeController flowRetryCount](v49, "flowRetryCount"));
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v47, v46, "Retrying Apple ID Password Change flow, retry count: %ld", buf, 0xCu);
    }
    objc_storeStrong(&v47, 0);
    v4 = +[BYNetworkMonitor sharedInstance](BYNetworkMonitor, "sharedInstance");
    v40 = _NSConcreteStackBlock;
    v41 = -1073741824;
    v42 = 0;
    v43 = sub_10005FF44;
    v44 = &unk_1002808D0;
    v45 = v49;
    -[BYNetworkMonitor withMinimumNetworkType:timeout:runBlock:](v4, "withMinimumNetworkType:timeout:runBlock:", 1, &v40, 20.0);

    objc_storeStrong((id *)&v45, 0);
  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v3);
    v38 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v36 = 0;
      v34 = 0;
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v5 = (NSString *)location[0];
      }
      else if (location[0])
      {
        v37 = objc_msgSend(location[0], "domain");
        v36 = 1;
        v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v37, objc_msgSend(location[0], "code"));
        v35 = v5;
        v34 = 1;
      }
      else
      {
        v5 = 0;
      }
      sub_100039500((uint64_t)v50, (uint64_t)v5);
      _os_log_impl((void *)&_mh_execute_header, oslog, v38, "Failed password change: %{public}@", v50, 0xCu);
      if ((v34 & 1) != 0)

      if ((v36 & 1) != 0)
    }
    objc_storeStrong((id *)&oslog, 0);
    v33 = &stru_100284738;
    if (MGGetBoolAnswer(CFSTR("apple-internal-install")) & 1)
    {
      v6 = objc_msgSend(location[0], "localizedDescription");
      v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("\n(internal message): %@"), v6);
      v8 = v33;
      v33 = v7;

    }
    v9 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v31 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("SLT_UPGRADE_ERROR_TITLE"), &stru_100284738, CFSTR("Localizable"));

    v10 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v11 = -[NSBundle localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", CFSTR("SLT_UPGRADE_ERROR_MESSAGE"), &stru_100284738, CFSTR("Localizable"));
    v30 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%@%@"), v11, v33);

    v12 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v29 = -[NSBundle localizedStringForKey:value:table:](v12, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100284738, CFSTR("Localizable"));

    v13 = objc_msgSend(location[0], "domain");
    v14 = 0;
    if ((objc_msgSend(v13, "isEqualToString:", AKAppleIDAuthenticationErrorDomain) & 1) != 0)
      v14 = objc_msgSend(location[0], "code") == (id)-7027;

    if (v14)
    {
      v15 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v16 = -[NSBundle localizedStringForKey:value:table:](v15, "localizedStringForKey:value:table:", CFSTR("SLT_EXPIRED_TITLE"), &stru_100284738, CFSTR("Localizable"));
      v17 = v31;
      v31 = v16;

    }
    v18 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    v20 = -1073741824;
    v21 = 0;
    v22 = sub_100060068;
    v23 = &unk_100280F88;
    v24 = v31;
    v25 = v30;
    v26 = v29;
    v27 = location[0];
    v28 = v49;
    dispatch_async((dispatch_queue_t)v18, &block);

    objc_storeStrong((id *)&v28, 0);
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v33, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)_startFlow
{
  NSObject *v2;
  os_log_type_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  AKAppleIDAuthenticationPurpleBuddyContext *v7;
  AKAppleIDAuthenticationPurpleBuddyContext *context;
  AKAppleIDAuthenticationPurpleBuddyContext *v9;
  id v10;
  id v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  AKAppleIDAuthenticationPurpleBuddyContext *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  os_log_t v19;
  uint8_t v20[15];
  os_log_type_t v21;
  os_log_t v22;
  void **v23;
  int v24;
  int v25;
  void (*v26)(uint64_t, void *, void *);
  void *v27;
  id v28[2];
  os_log_type_t v29;
  os_log_t v30;
  char v31;
  id v32;
  os_log_type_t v33;
  os_log_t oslog;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t *v41;
  int v42;
  int v43;
  void (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  uint64_t v46;
  uint8_t buf[7];
  os_log_type_t v48;
  os_log_t location[2];
  BuddyAppleIDPasswordChangeController *v50;
  uint8_t v51[32];
  uint8_t v52[16];
  uint8_t v53[40];

  v50 = self;
  location[1] = (os_log_t)a2;
  location[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v48 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(location[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = location[0];
    v3 = v48;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Show Change Password sign in!", buf, 2u);
  }
  objc_storeStrong((id *)location, 0);
  v40 = 0;
  v41 = &v40;
  v42 = 838860800;
  v43 = 48;
  v44 = sub_100060960;
  v45 = sub_100060990;
  v46 = objc_opt_new(AKAppleIDAuthenticationController);
  objc_msgSend((id)v41[5], "setDelegate:", v50);
  v39 = +[UMUserManager sharedManager](UMUserManager, "sharedManager");
  v38 = objc_msgSend(v39, "currentUser");
  v37 = objc_msgSend(v38, "username");
  v36 = objc_msgSend(v38, "alternateDSID");
  v4 = +[BYManagedAppleIDBootstrap sharedManager](BYManagedAppleIDBootstrap, "sharedManager");
  v35 = objc_msgSend(v4, "shortLivedToken");

  oslog = (os_log_t)(id)_BYLoggingFacility(v5);
  v33 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    sub_10006099C((uint64_t)v53, (uint64_t)v37, (uint64_t)v36, (uint64_t)v35);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog, v33, "Username = %@, altDSID = %@, SLT = %@", v53, 0x20u);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (v37 && v36 && v35)
  {
    v7 = (AKAppleIDAuthenticationPurpleBuddyContext *)objc_alloc_init((Class)AKAppleIDAuthenticationPurpleBuddyContext);
    context = v50->_context;
    v50->_context = v7;

    v9 = v50->_context;
    v10 = -[BuddyAppleIDPasswordChangeController navigationController](v50, "navigationController");
    -[AKAppleIDAuthenticationPurpleBuddyContext setPresentingViewController:](v9, "setPresentingViewController:", v10);

    -[AKAppleIDAuthenticationPurpleBuddyContext setUsername:](v50->_context, "setUsername:", v37);
    -[AKAppleIDAuthenticationPurpleBuddyContext _setShortLivedToken:](v50->_context, "_setShortLivedToken:", v35);
    -[AKAppleIDAuthenticationPurpleBuddyContext setAltDSID:](v50->_context, "setAltDSID:", v36);
    -[AKAppleIDAuthenticationPurpleBuddyContext setShouldForceInteractiveAuth:](v50->_context, "setShouldForceInteractiveAuth:", 0);
    -[AKAppleIDAuthenticationPurpleBuddyContext setShouldUpdatePersistentServiceTokens:](v50->_context, "setShouldUpdatePersistentServiceTokens:", 1);
    -[AKAppleIDAuthenticationPurpleBuddyContext setServiceType:](v50->_context, "setServiceType:", 1);
    v32 = objc_opt_new(ACAccountStore);
    v11 = objc_msgSend(v32, "aa_primaryAppleAccount");
    LOBYTE(v9) = v11 != 0;

    v31 = v9 & 1;
    v30 = (os_log_t)(id)_BYLoggingFacility(v12);
    v29 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      if ((v31 & 1) != 0)
        v13 = CFSTR("YASE");
      else
        v13 = CFSTR("NERP");
      sub_100039500((uint64_t)v52, (uint64_t)v13);
      _os_log_impl((void *)&_mh_execute_header, v30, v29, "Primary account exists: %{public}@", v52, 0xCu);
    }
    objc_storeStrong((id *)&v30, 0);
    if ((v31 & 1) == 0)
      -[AKAppleIDAuthenticationPurpleBuddyContext setFirstTimeLogin:](v50->_context, "setFirstTimeLogin:", 1);
    v14 = (void *)v41[5];
    v15 = v50->_context;
    v23 = _NSConcreteStackBlock;
    v24 = -1073741824;
    v25 = 0;
    v26 = sub_1000609C4;
    v27 = &unk_100281028;
    v28[0] = v50;
    v28[1] = &v40;
    objc_msgSend(v14, "authenticateWithContext:completion:", v15, &v23);
    objc_storeStrong(v28, 0);
    objc_storeStrong(&v32, 0);
  }
  else
  {
    v22 = (os_log_t)(id)_BYLoggingFacility(v6);
    v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v22;
      v17 = v21;
      sub_100038C3C(v20);
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Missing edu login information!", v20, 2u);
    }
    objc_storeStrong((id *)&v22, 0);
    v19 = (os_log_t)(id)_BYLoggingFacility(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      sub_10006099C((uint64_t)v51, (uint64_t)v37, (uint64_t)v36, (uint64_t)v35);
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Username = %@, altDSID = %@, SLT = %@", v51, 0x20u);
    }
    objc_storeStrong((id *)&v19, 0);
    -[BuddyAppleIDPasswordChangeController _retryFlowIfPossibleOrFailWithError:](v50, "_retryFlowIfPossibleOrFailWithError:", 0);
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  _Block_object_dispose(&v40, 8);
  objc_storeStrong((id *)&v46, 0);
}

- (void)_stopSpinning
{
  UIViewController *v2;
  UINavigationItem *v3;
  UIViewController *v4;
  UIView *v5;
  UIWindow *v6;

  +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:](BFFViewControllerSpinnerManager, "stopAnimatingSpinnerFor:", CFSTR("passwordchange"), a2);
  v2 = -[UINavigationController topViewController](self->_originalNavController, "topViewController");
  v3 = -[UIViewController navigationItem](v2, "navigationItem");
  -[UINavigationItem setTitle:](v3, "setTitle:", 0);

  v4 = -[UINavigationController topViewController](self->_originalNavController, "topViewController");
  v5 = -[UIViewController view](v4, "view");
  v6 = -[UIView window](v5, "window");
  -[UIWindow setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 1);

}

- (BOOL)authenticationController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6
{
  void *v9;
  void **block;
  int v12;
  int v13;
  void (*v14)(_QWORD *);
  void *v15;
  BuddyAppleIDPasswordChangeController *v16;
  id v17;
  id v18;
  id v19;
  id location[2];
  BuddyAppleIDPasswordChangeController *v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v18 = 0;
  objc_storeStrong(&v18, a5);
  v17 = 0;
  objc_storeStrong(&v17, a6);
  v9 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v12 = -1073741824;
  v13 = 0;
  v14 = sub_100061080;
  v15 = &unk_100280730;
  v16 = v21;
  dispatch_async((dispatch_queue_t)v9, &block);

  objc_storeStrong((id *)&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return 1;
}

- (void)createAndRecoverAccountWithUsername:(id)a3 password:(id)a4 rawPassword:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void **v14;
  int v15;
  int v16;
  void (*v17)(uint64_t, char, char, id);
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = 0;
  objc_storeStrong(&v25, a4);
  v24 = 0;
  objc_storeStrong(&v24, a5);
  v23 = 0;
  objc_storeStrong(&v23, a6);
  v9 = objc_alloc((Class)BYAppleIDAccountsManager);
  v10 = +[BYManagedAppleIDBootstrap delegateBundleIDsForManagedAccount](BYManagedAppleIDBootstrap, "delegateBundleIDsForManagedAccount");
  v22 = objc_msgSend(v9, "initForDelegateBundleIDs:", v10);

  v11 = location[0];
  v12 = v25;
  v13 = v24;
  v14 = _NSConcreteStackBlock;
  v15 = -1073741824;
  v16 = 0;
  v17 = sub_1000613E8;
  v18 = &unk_100281050;
  v19 = v24;
  v20 = v22;
  v21 = v23;
  objc_msgSend(v22, "loginDelegateAccountsWithUsername:password:rawPassword:skipiTunes:onlyAppleIDPlugin:completion:", v11, v12, v13, 0, 0, &v14);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
}

- (void)controllerDone
{
  id v2;

  v2 = -[BuddyAppleIDPasswordChangeController delegate](self, "delegate", a2);
  objc_msgSend(v2, "flowItemDone:nextItemClass:", self, objc_opt_class(BuddyEDUAccountConfigurationSyncController));

}

- (void)networkChangedFromNetworkType:(int)a3 toNetworkType:(int)a4
{
  BOOL v4;

  v4 = 0;
  if (a3 == 1)
    v4 = a4 == 0;
  -[BuddyAppleIDPasswordChangeController setShouldRetryFlow:](self, "setShouldRetryFlow:", v4);
}

- (BOOL)shouldRetryFlow
{
  return self->_shouldRetryFlow;
}

- (void)setShouldRetryFlow:(BOOL)a3
{
  self->_shouldRetryFlow = a3;
}

- (int64_t)flowRetryCount
{
  return self->_flowRetryCount;
}

- (void)setFlowRetryCount:(int64_t)a3
{
  self->_flowRetryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalNavController, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end

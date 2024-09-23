@implementation BuddyStoreRenewController

- (BuddyStoreRenewController)init
{
  BuddyStoreRenewController *v2;
  objc_super v4;
  SEL v5;
  id location;

  v5 = a2;
  location = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddyStoreRenewController;
  location = -[BuddyStoreRenewController init](&v4, "init");
  objc_storeStrong(&location, location);
  if (location)
    *((_BYTE *)location + 8) = 1;
  v2 = (BuddyStoreRenewController *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)fetchAccounts:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)_authenticateThenSignInNextAccount
{
  NSMutableArray *v2;
  uint64_t v3;
  _BOOL8 v4;
  NSMutableArray *v5;
  NSObject *v6;
  os_log_type_t v7;
  BFFFlowItemDelegate *v8;
  _WORD v9[3];
  os_log_type_t v10;
  os_log_t v11;
  os_log_type_t v12;
  os_log_t oslog;
  void **v14;
  int v15;
  int v16;
  void (*v17)(id *, void *);
  void *v18;
  BuddyStoreRenewController *v19;
  id location[2];
  BuddyStoreRenewController *v21;
  uint8_t buf[24];

  v21 = self;
  location[1] = (id)a2;
  v2 = -[BuddyStoreRenewController storeAccountsToSignIn](self, "storeAccountsToSignIn");
  location[0] = -[NSMutableArray firstObject](v2, "firstObject");

  if (location[0])
  {
    if (-[BuddyStoreRenewController shouldOnlySetActiveStoreAccount](v21, "shouldOnlySetActiveStoreAccount")
      && -[BuddyStoreRenewController _isActiveBuddyStoreAccount:](v21, "_isActiveBuddyStoreAccount:", location[0]))
    {
      v14 = _NSConcreteStackBlock;
      v15 = -1073741824;
      v16 = 0;
      v17 = sub_10016EC00;
      v18 = &unk_100280B80;
      v19 = v21;
      -[BuddyStoreRenewController _makeStoreAccountActiveForAccount:completion:](v21, "_makeStoreAccountActiveForAccount:completion:", location[0], &v14);
      objc_storeStrong((id *)&v19, 0);
    }
    else
    {
      v4 = -[BuddyStoreRenewController _canSkipAccount:](v21, "_canSkipAccount:", location[0]);
      if (v4)
      {
        oslog = (os_log_t)(id)_BYLoggingFacility(v4);
        v12 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          sub_100038C28((uint64_t)buf, (uint64_t)location[0]);
          _os_log_impl((void *)&_mh_execute_header, oslog, v12, "Skipping %@...", buf, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        v5 = -[BuddyStoreRenewController storeAccountsToSignIn](v21, "storeAccountsToSignIn");
        -[NSMutableArray removeObjectAtIndex:](v5, "removeObjectAtIndex:", 0);

        -[BuddyStoreRenewController _authenticateThenSignInNextAccount](v21, "_authenticateThenSignInNextAccount");
      }
      else
      {
        -[BuddyStoreRenewController _authenticateNextAccount](v21, "_authenticateNextAccount");
      }
    }
  }
  else
  {
    v11 = (os_log_t)(id)_BYLoggingFacility(v3);
    v10 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v11;
      v7 = v10;
      sub_100038C3C(v9);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "No store accounts remaining to sign-in", (uint8_t *)v9, 2u);
    }
    objc_storeStrong((id *)&v11, 0);
    -[BuddyStoreRenewController setStoreAccountsToSignIn:](v21, "setStoreAccountsToSignIn:", 0);
    v8 = -[BuddyStoreRenewController delegate](v21, "delegate");
    -[BFFFlowItemDelegate flowItemDone:](v8, "flowItemDone:", v21);

  }
  objc_storeStrong(location, 0);
}

- (BOOL)_canSkipAccount:(id)a3
{
  BuddyStoreRenewController *v3;
  id v4;
  id v5;
  id v6;
  BOOL v7;
  NSNumber *v8;
  NSString *v9;
  id v10;
  char v12;
  id v13;
  char v14;
  NSNumber *v15;
  char v16;
  char v17;
  id location[2];
  BuddyStoreRenewController *v19;
  char v20;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = -[BuddyStoreRenewController _isActiveBuddyStoreAccount:](v19, "_isActiveBuddyStoreAccount:", location[0]);
  v16 = -[BuddyStoreRenewController _isPrimaryAccount:](v19, "_isPrimaryAccount:", location[0]);
  if (!v16 || (v17 & 1) != 0)
  {
    v14 = 0;
    v12 = 0;
    v7 = 0;
    if ((v16 & 1) == 0)
    {
      v15 = -[BuddyStoreRenewController mediaLinkedAccountDSID](v19, "mediaLinkedAccountDSID");
      v14 = 1;
      v7 = 0;
      if (v15)
      {
        v13 = objc_msgSend(location[0], "dsid");
        v12 = 1;
        v7 = v13 != 0;
      }
    }
    if ((v12 & 1) != 0)

    if ((v14 & 1) != 0)
    if (v7)
    {
      v8 = -[BuddyStoreRenewController mediaLinkedAccountDSID](v19, "mediaLinkedAccountDSID");
      v9 = -[NSNumber stringValue](v8, "stringValue");
      v10 = objc_msgSend(location[0], "dsid");
      v20 = -[NSString isEqualToString:](v9, "isEqualToString:", v10);

    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    v3 = v19;
    v4 = objc_msgSend(location[0], "username");
    v5 = objc_msgSend(location[0], "altDSID");
    v6 = -[BuddyStoreRenewController _amsStoreAccountForUsername:altDSID:](v3, "_amsStoreAccountForUsername:altDSID:", v4, v5);
    v20 = (objc_msgSend(v6, "isActive") ^ 1) & 1;

  }
  objc_storeStrong(location, 0);
  return v20 & 1;
}

- (void)_makeStoreAccountActiveForAccount:(id)a3 completion:(id)a4
{
  BuddyStoreRenewController *v5;
  id v6;
  id v7;
  uint64_t v8;
  void (**v9)(id, NSError *);
  NSError *v10;
  void **v11;
  int v12;
  int v13;
  void (*v14)(NSObject *, char, id);
  void *v15;
  BuddyStoreRenewController *v16;
  id v17;
  id v18;
  id v19;
  int v20;
  os_log_type_t v21;
  os_log_t oslog;
  id v23;
  id v24;
  id location[2];
  BuddyStoreRenewController *v26;
  uint8_t buf[24];

  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v24 = 0;
  objc_storeStrong(&v24, a4);
  v5 = v26;
  v6 = objc_msgSend(location[0], "username");
  v7 = objc_msgSend(location[0], "altDSID");
  v23 = -[BuddyStoreRenewController _amsStoreAccountForUsername:altDSID:](v5, "_amsStoreAccountForUsername:altDSID:", v6, v7);

  if (v23)
  {
    objc_msgSend(v23, "setActive:", 1);
    v19 = -[BuddyStoreRenewController _amsAccountStore](v26, "_amsAccountStore");
    v11 = _NSConcreteStackBlock;
    v12 = -1073741824;
    v13 = 0;
    v14 = sub_10016F188;
    v15 = &unk_1002836B0;
    v16 = v26;
    v17 = v23;
    v18 = v24;
    objc_msgSend(v19, "saveAccount:withCompletionHandler:", v23, &v11);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong((id *)&v16, 0);
    objc_storeStrong(&v19, 0);
    v20 = 0;
  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v8);
    v21 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_100038C28((uint64_t)buf, (uint64_t)location[0]);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, v21, "Failed to find store account for active store account: %@", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    if (v24)
    {
      v9 = (void (**)(id, NSError *))v24;
      v10 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", ACErrorDomain, 6, 0);
      v9[2](v9, v10);

    }
    v20 = 1;
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
}

- (void)_removeAccountsToSignIn:(id)a3
{
  NSMutableArray *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  unint64_t i;
  BuddyStoreAccount *v9;
  NSMutableArray *v10;
  id v11;
  _QWORD __b[8];
  uint64_t v13;
  int v14;
  id location[2];
  BuddyStoreRenewController *v16;
  _BYTE v17[128];

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyStoreRenewController storeAccountsToSignIn](v16, "storeAccountsToSignIn");
  v4 = -[NSMutableArray count](v3, "count");

  if (v4)
  {
    memset(__b, 0, sizeof(__b));
    v5 = location[0];
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", __b, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)__b[2];
      do
      {
        for (i = 0; i < (unint64_t)v6; ++i)
        {
          if (*(_QWORD *)__b[2] != v7)
            objc_enumerationMutation(v5);
          v13 = *(_QWORD *)(__b[1] + 8 * i);
          v9 = [BuddyStoreAccount alloc];
          v11 = -[BuddyStoreAccount initWithUsername:dsid:altDSID:](v9, "initWithUsername:dsid:altDSID:", v13, 0, 0);
          v10 = -[BuddyStoreRenewController storeAccountsToSignIn](v16, "storeAccountsToSignIn");
          -[NSMutableArray removeObject:](v10, "removeObject:", v11);

          objc_storeStrong(&v11, 0);
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", __b, v17, 16);
      }
      while (v6);
    }

    v14 = 0;
  }
  else
  {
    v14 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)_familyMembersForAccount:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void **v11;
  int v12;
  int v13;
  void (*v14)(id *, void *, void *);
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  v5 = +[AMSFamilyInfoLookupTask bagKeySet](AMSFamilyInfoLookupTask, "bagKeySet");
  v6 = +[AMSFamilyInfoLookupTask bagSubProfile](AMSFamilyInfoLookupTask, "bagSubProfile");
  v7 = +[AMSFamilyInfoLookupTask bagSubProfileVersion](AMSFamilyInfoLookupTask, "bagSubProfileVersion");
  +[AMSBagKeySet registerBagKeySet:forProfile:profileVersion:](AMSBagKeySet, "registerBagKeySet:forProfile:profileVersion:", v5, v6, v7);

  v8 = +[AMSFamilyInfoLookupTask bagSubProfile](AMSFamilyInfoLookupTask, "bagSubProfile");
  v9 = +[AMSFamilyInfoLookupTask bagSubProfileVersion](AMSFamilyInfoLookupTask, "bagSubProfileVersion");
  v19 = +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v8, v9);

  v10 = objc_alloc((Class)AMSFamilyInfoLookupTask);
  v18 = objc_msgSend(v10, "initWithAccount:bag:", location[0], v19);
  v17 = objc_msgSend(v18, "performFamilyInfoLookup");
  v11 = _NSConcreteStackBlock;
  v12 = -1073741824;
  v13 = 0;
  v14 = sub_10016F834;
  v15 = &unk_100283BD8;
  v16 = v20;
  objc_msgSend(v17, "addFinishBlock:", &v11);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (void)_authenticateNextAccount
{
  NSMutableArray *v2;
  id location[2];
  BuddyStoreRenewController *v4;

  v4 = self;
  location[1] = (id)a2;
  v2 = -[BuddyStoreRenewController storeAccountsToSignIn](self, "storeAccountsToSignIn");
  location[0] = -[NSMutableArray firstObject](v2, "firstObject");

  -[BuddyStoreRenewController _authenticateAccount:](v4, "_authenticateAccount:", location[0]);
  objc_storeStrong(location, 0);
}

- (void)_authenticateAccount:(id)a3
{
  BuddyAppleIDController *v3;
  BYPasscodeCacheManager *v4;
  BYAnalyticsManager *v5;
  BYRunState *v6;
  id v7;
  BuddyAppleIDController *v8;
  BuddyAppleIDController *v9;
  BFFFlowItemDelegate *v10;
  BuddyAppleIDController *v11;
  BuddyAppleIDController *v12;
  BFFNavigationController *v13;
  ProximitySetupController *v14;
  BuddyAppleIDController *v15;
  BFFNavigationController *v16;
  BYPasscodeCacheManager *v17;
  id v18;
  BuddyAppleIDSignInController *v19;
  id v20;
  BuddyStoreRenewController *v21;
  NSDictionary *v22;
  id v23;
  id v24;
  NSBundle *v25;
  NSString *v26;
  BuddyAppleIDSignInController *v27;
  NSString *v28;
  id v29;
  NSString *v30;
  BuddyAppleIDSignInController *v31;
  BuddyAppleIDSignInController *v32;
  NSBundle *v33;
  NSString *v34;
  BuddyAppleIDSignInController *v35;
  BuddyAppleIDSignInController *v36;
  uint64_t v37;
  id v38;
  BFFNavigationController *v39;
  BuddyAppleIDSignInController *v40;
  os_log_t oslog;
  void **v42;
  int v43;
  int v44;
  void (*v45)(id *, void *, void *);
  void *v46;
  id v47;
  id v48;
  void **v49;
  int v50;
  int v51;
  void (*v52)(id *);
  void *v53;
  id v54;
  id from;
  void **v56;
  int v57;
  int v58;
  void (*v59);
  void *v60;
  BuddyStoreRenewController *v61;
  id v62;
  id v63;
  id location[2];
  BuddyStoreRenewController *v65;
  uint8_t buf[24];

  v65 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [BuddyAppleIDController alloc];
  v4 = -[BuddyStoreRenewController passcodeCacheManager](v65, "passcodeCacheManager");
  v5 = -[BuddyStoreRenewController analyticsManager](v65, "analyticsManager");
  v6 = -[BuddyStoreRenewController runState](v65, "runState");
  v7 = +[BuddyFeatureFlags currentFlags](BuddyFeatureFlags, "currentFlags");
  v8 = -[BuddyAppleIDController initWithAccount:passcodeCacheManager:analyticsManager:runState:featureFlags:](v3, "initWithAccount:passcodeCacheManager:analyticsManager:runState:featureFlags:", 0, v4, v5, v6, v7);
  -[BuddyStoreRenewController setStoreAppleIDController:](v65, "setStoreAppleIDController:", v8);

  v9 = -[BuddyStoreRenewController storeAppleIDController](v65, "storeAppleIDController");
  -[BuddyAppleIDController setDelegate:](v9, "setDelegate:", v65);

  v10 = -[BuddyStoreRenewController delegate](v65, "delegate");
  v11 = -[BuddyStoreRenewController storeAppleIDController](v65, "storeAppleIDController");
  -[BuddyAppleIDController setFlowItemDelegate:](v11, "setFlowItemDelegate:", v10);

  v12 = -[BuddyStoreRenewController storeAppleIDController](v65, "storeAppleIDController");
  v13 = -[BuddyStoreRenewController navigationController](v65, "navigationController");
  -[BuddyAppleIDController setNavigationController:](v12, "setNavigationController:", v13);

  v14 = -[BuddyStoreRenewController proximitySetupController](v65, "proximitySetupController");
  LOBYTE(v13) = -[ProximitySetupController hasConnection](v14, "hasConnection");
  v15 = -[BuddyStoreRenewController storeAppleIDController](v65, "storeAppleIDController");
  -[BuddyAppleIDController setHasProximityConnection:](v15, "setHasProximityConnection:", v13 & 1);

  v16 = -[BuddyStoreRenewController navigationController](v65, "navigationController");
  v17 = -[BuddyStoreRenewController passcodeCacheManager](v65, "passcodeCacheManager");
  v18 = +[BuddyAppleIDSignInController federatedAuthSignInControllerInNavigationController:mode:passcodeCacheManager:](BuddyAppleIDSignInController, "federatedAuthSignInControllerInNavigationController:mode:passcodeCacheManager:", v16, 6, v17);
  -[BuddyStoreRenewController setSignInController:](v65, "setSignInController:", v18);

  v19 = -[BuddyStoreRenewController signInController](v65, "signInController");
  v20 = objc_msgSend(location[0], "username");
  -[BuddyAppleIDSignInController setUsername:](v19, "setUsername:", v20);

  v21 = v65;
  v22 = -[BuddyStoreRenewController storeAccountMap](v65, "storeAccountMap");
  v23 = objc_msgSend(location[0], "username");
  v24 = -[NSDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v23);
  v63 = -[BuddyStoreRenewController _localizedExtraStoresSignInTextForStoreContentMap:](v21, "_localizedExtraStoresSignInTextForStoreContentMap:", v24);

  if (v63)
  {
    v25 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v26 = -[NSBundle localizedStringForKey:value:table:](v25, "localizedStringForKey:value:table:", CFSTR("STORE_ACCOUNT_UPGRADE_TEXT_%@"), &stru_100284738, CFSTR("RestoreFromBackup"));
    v27 = -[BuddyStoreRenewController signInController](v65, "signInController");
    v28 = -[BuddyAppleIDSignInController username](v27, "username");
    v29 = +[AKUsernameFormatter formattedUsernameFromUsername:](AKUsernameFormatter, "formattedUsernameFromUsername:", v28);
    v62 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v26, v29);

    v30 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%@\n\n%@"), v63, v62);
    v31 = -[BuddyStoreRenewController signInController](v65, "signInController");
    -[BuddyAppleIDSignInController setDetailText:](v31, "setDetailText:", v30);

    objc_storeStrong(&v62, 0);
  }
  v32 = -[BuddyStoreRenewController signInController](v65, "signInController");
  v33 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v34 = -[NSBundle localizedStringForKey:value:table:](v33, "localizedStringForKey:value:table:", CFSTR("FORGOT_PASSWORD_QUESTION"), &stru_100284738, CFSTR("Localizable"));
  v56 = _NSConcreteStackBlock;
  v57 = -1073741824;
  v58 = 0;
  v59 = sub_1001704A0;
  v60 = &unk_100280730;
  v61 = v65;
  -[BuddyAppleIDSignInController setiForgotText:handler:](v32, "setiForgotText:handler:", v34, &v56);

  objc_initWeak(&from, v65);
  v35 = -[BuddyStoreRenewController signInController](v65, "signInController");
  v49 = _NSConcreteStackBlock;
  v50 = -1073741824;
  v51 = 0;
  v52 = sub_100170564;
  v53 = &unk_1002806B8;
  objc_copyWeak(&v54, &from);
  -[BuddyAppleIDSignInController setAppearanceHandler:](v35, "setAppearanceHandler:", &v49);

  v36 = -[BuddyStoreRenewController signInController](v65, "signInController");
  v42 = _NSConcreteStackBlock;
  v43 = -1073741824;
  v44 = 0;
  v45 = sub_1001705F4;
  v46 = &unk_100283C00;
  objc_copyWeak(&v48, &from);
  v47 = location[0];
  -[BuddyAppleIDSignInController setHandler:](v36, "setHandler:", &v42);

  oslog = (os_log_t)(id)_BYLoggingFacility(v37);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v38 = objc_msgSend(location[0], "username");
    sub_100038C28((uint64_t)buf, (uint64_t)v38);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Showing sign-in for %@...", buf, 0xCu);

  }
  objc_storeStrong((id *)&oslog, 0);
  v39 = -[BuddyStoreRenewController navigationController](v65, "navigationController");
  v40 = -[BuddyStoreRenewController signInController](v65, "signInController");
  -[BFFNavigationController pushViewController:animated:](v39, "pushViewController:animated:", v40, 1);

  objc_storeStrong(&v47, 0);
  objc_destroyWeak(&v48);
  objc_destroyWeak(&v54);
  objc_destroyWeak(&from);
  objc_storeStrong((id *)&v61, 0);
  objc_storeStrong(&v63, 0);
  objc_storeStrong(location, 0);
}

- (void)_didAuthenticateWithAuthenticationResults:(id)a3
{
  id v3;
  BFFNavigationController *v4;
  id v5;
  CDPUIController *v6;
  id v7;
  BFFNavigationController *v8;
  id v9;
  AAUISignInFlowControllerDelegate *v10;
  char v11;
  BFFNavigationController *v12;
  CDPUIController *v13;
  AAUISignInFlowControllerDelegate *v14;
  NSDictionary *v15;
  id v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  id v21;
  uint64_t v22;
  id v23;
  void **v24;
  int v25;
  int v26;
  void (*v27)(id *, char, id);
  void *v28;
  BuddyStoreRenewController *v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[7];
  os_log_type_t v34;
  os_log_t oslog;
  id v36;
  id v37;
  char v38;
  char v39;
  id v40;
  id v41;
  id v42;
  id location[2];
  BuddyStoreRenewController *v44;
  _QWORD v45[2];
  _QWORD v46[2];

  v44 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v42 = objc_msgSend(location[0], "objectForKeyedSubscript:", AKAuthenticationUsernameKey);
  v41 = objc_msgSend(location[0], "objectForKeyedSubscript:", AKAuthenticationAlternateDSIDKey);
  v3 = objc_alloc((Class)CDPUIController);
  v4 = -[BuddyStoreRenewController navigationController](v44, "navigationController");
  v5 = objc_msgSend(v3, "initWithPresentingViewController:", v4);
  -[BuddyStoreRenewController setCdpUIController:](v44, "setCdpUIController:", v5);

  v6 = -[BuddyStoreRenewController cdpUIController](v44, "cdpUIController");
  -[CDPUIController setForceInlinePresentation:](v6, "setForceInlinePresentation:", 1);

  v7 = objc_alloc((Class)AAUISignInFlowControllerDelegate);
  v8 = -[BuddyStoreRenewController navigationController](v44, "navigationController");
  v9 = objc_msgSend(v7, "initWithPresentingViewController:", v8);
  -[BuddyStoreRenewController setFlowControllerDelegate:](v44, "setFlowControllerDelegate:", v9);

  v10 = -[BuddyStoreRenewController flowControllerDelegate](v44, "flowControllerDelegate");
  -[AAUISignInFlowControllerDelegate setShouldStashLoginResponse:](v10, "setShouldStashLoginResponse:", 1);

  v40 = objc_alloc_init((Class)AMSSignInContext);
  v39 = -[BuddyStoreRenewController _isActiveBuddyStoreAccountWithUsername:orAltDSID:](v44, "_isActiveBuddyStoreAccountWithUsername:orAltDSID:", v42, v41);
  v38 = -[BuddyStoreRenewController _isPrimaryAccountWithUsername:orAltDSID:](v44, "_isPrimaryAccountWithUsername:orAltDSID:", v42, v41);
  objc_msgSend(v40, "setIgnoreAccountConversion:", 1);
  objc_msgSend(v40, "setCanMakeAccountActive:", v39 & 1);
  v11 = 0;
  if ((v38 & 1) != 0)
    v11 = v39;
  objc_msgSend(v40, "setSkipAuthentication:", v11 & 1);
  objc_msgSend(v40, "setDebugReason:", CFSTR("Setup Assistant"));
  v37 = objc_alloc_init((Class)AIDAMutableServiceContext);
  objc_msgSend(v37, "setAuthenticationResults:", location[0]);
  v12 = -[BuddyStoreRenewController navigationController](v44, "navigationController");
  objc_msgSend(v37, "setViewController:", v12);

  v13 = -[BuddyStoreRenewController cdpUIController](v44, "cdpUIController");
  objc_msgSend(v37, "setCdpUiProvider:", v13);

  objc_msgSend(v37, "setShouldForceOperation:", 0);
  objc_msgSend(v37, "setOperationUIPermissions:", 1);
  v45[0] = AIDAServiceTypeCloud;
  v14 = -[BuddyStoreRenewController flowControllerDelegate](v44, "flowControllerDelegate");
  v46[0] = v14;
  v45[1] = AIDAServiceTypeStore;
  v46[1] = v40;
  v15 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
  objc_msgSend(v37, "setSignInContexts:", v15);

  v16 = objc_alloc((Class)AIDAServiceOwnersManager);
  v17 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
  v36 = objc_msgSend(v16, "initWithAccountStore:", v17);

  oslog = (os_log_t)(id)_BYLoggingFacility(v18);
  v34 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v19 = oslog;
    v20 = v34;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Beginning sign-in for store account...", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[BuddyStoreRenewController _startSpinningWithIdentifier:](v44, "_startSpinningWithIdentifier:", CFSTR("signin"));
  v21 = v36;
  v22 = AIDAServiceTypeStore;
  v23 = v37;
  v24 = _NSConcreteStackBlock;
  v25 = -1073741824;
  v26 = 0;
  v27 = sub_1001712B0;
  v28 = &unk_100283C50;
  v29 = v44;
  v30 = v36;
  v31 = v42;
  v32 = v41;
  objc_msgSend(v21, "signInService:withContext:completion:", v22, v23, &v24);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong((id *)&v29, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(location, 0);
}

- (void)_didSignInUsername:(id)a3 altDSID:(id)a4
{
  NSMutableArray *v5;
  ACAccount *v6;
  BOOL v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  NSMutableArray *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  BuddyStoreRenewController *v16;
  ACAccount *v17;
  void **v18;
  int v19;
  int v20;
  void (*v21)(NSObject *, void *, void *);
  void *v22;
  BuddyStoreRenewController *v23;
  uint8_t v24[7];
  os_log_type_t v25;
  os_log_t v26;
  uint8_t buf[15];
  os_log_type_t v28;
  os_log_t oslog;
  char v30;
  id v31;
  id location[2];
  BuddyStoreRenewController *v33;

  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v31 = 0;
  objc_storeStrong(&v31, a4);
  v5 = -[BuddyStoreRenewController storeAccountsToSignIn](v33, "storeAccountsToSignIn");
  -[NSMutableArray removeObjectAtIndex:](v5, "removeObjectAtIndex:", 0);

  if (-[BuddyStoreRenewController _isActiveBuddyStoreAccountWithUsername:orAltDSID:](v33, "_isActiveBuddyStoreAccountWithUsername:orAltDSID:", location[0], v31))
  {
    v30 = 1;
    v6 = -[BuddyStoreRenewController activeStoreAccount](v33, "activeStoreAccount");
    v7 = v6 == 0;

    if (v7)
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v8);
      v28 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v9 = oslog;
        v10 = v28;
        sub_100038C3C(buf);
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "Skipping fetching family members as there is no active store account", buf, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v30 = 0;
    }
    v11 = -[BuddyStoreRenewController storeAccountsToSignIn](v33, "storeAccountsToSignIn");
    v12 = -[NSMutableArray count](v11, "count");

    if (!v12)
    {
      v26 = (os_log_t)(id)_BYLoggingFacility(v13);
      v25 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v26;
        v15 = v25;
        sub_100038C3C(v24);
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "Skipping fetching family members as there are no more accounts to authenticate", v24, 2u);
      }
      objc_storeStrong((id *)&v26, 0);
      v30 = 0;
    }
    if ((v30 & 1) != 0)
    {
      -[BuddyStoreRenewController _startSpinningWithIdentifier:](v33, "_startSpinningWithIdentifier:", CFSTR("family"));
      v16 = v33;
      v17 = -[BuddyStoreRenewController activeStoreAccount](v33, "activeStoreAccount");
      v18 = _NSConcreteStackBlock;
      v19 = -1073741824;
      v20 = 0;
      v21 = sub_1001719F0;
      v22 = &unk_100283C78;
      v23 = v33;
      -[BuddyStoreRenewController _familyMembersForAccount:completion:](v16, "_familyMembersForAccount:completion:", v17, &v18);

      objc_storeStrong((id *)&v23, 0);
    }
    else
    {
      -[BuddyStoreRenewController _authenticateThenSignInNextAccount](v33, "_authenticateThenSignInNextAccount");
    }
  }
  else
  {
    -[BuddyStoreRenewController _authenticateThenSignInNextAccount](v33, "_authenticateThenSignInNextAccount");
  }
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

- (id)_localizedExtraStoresSignInTextForStoreContentMap:(id)a3
{
  NSBundle *v3;
  id v5;
  id location[2];
  BuddyStoreRenewController *v7;
  NSString *v8;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[BuddyStoreRenewController _localizedExtraStoresSignInTextKeyForStoreContentMap:](v7, "_localizedExtraStoresSignInTextKeyForStoreContentMap:", location[0]);
  if (v5)
  {
    v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v8 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", v5, &stru_100284738, CFSTR("RestoreFromBackup"));

  }
  else
  {
    v8 = 0;
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (id)_localizedExtraStoresSignInTextKeyForStoreContentMap:(id)a3
{
  id v3;
  id v5;
  id v6;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("dataClasses"));
  v5 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("EXTRA_STORES"));
  if ((objc_msgSend(v6, "containsObject:", CFSTR("Book")) & 1) != 0)
    objc_msgSend(v5, "appendString:", CFSTR("_IBOOKS"));
  if ((objc_msgSend(v6, "containsObject:", CFSTR("Media")) & 1) != 0)
    objc_msgSend(v5, "appendString:", CFSTR("_ITUNES"));
  if ((objc_msgSend(v6, "containsObject:", CFSTR("Application")) & 1) != 0)
    objc_msgSend(v5, "appendString:", CFSTR("_APP"));
  v3 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v3;
}

- (void)_startSpinningWithIdentifier:(id)a3
{
  BFFNavigationController *v3;
  id v4;
  id v5;
  id v6;
  BFFNavigationController *v7;
  id v8;
  id location[2];
  BuddyStoreRenewController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyStoreRenewController navigationController](v10, "navigationController");
  v4 = -[BFFNavigationController topViewController](v3, "topViewController");
  v5 = objc_msgSend(v4, "view");
  v6 = objc_msgSend(v5, "window");
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  v7 = -[BuddyStoreRenewController navigationController](v10, "navigationController");
  v8 = -[BFFNavigationController topViewController](v7, "topViewController");
  +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:identifier:](BFFViewControllerSpinnerManager, "startAnimatingSpinnerFor:identifier:", v8, location[0]);

  objc_storeStrong(location, 0);
}

- (void)_stopSpinningForIdentifier:(id)a3
{
  BFFNavigationController *v3;
  id v4;
  id v5;
  id v6;
  id location[2];
  BuddyStoreRenewController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyStoreRenewController navigationController](v8, "navigationController");
  v4 = -[BFFNavigationController topViewController](v3, "topViewController");
  v5 = objc_msgSend(v4, "view");
  v6 = objc_msgSend(v5, "window");
  objc_msgSend(v6, "setUserInteractionEnabled:", 1);

  +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:](BFFViewControllerSpinnerManager, "stopAnimatingSpinnerFor:", location[0]);
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (BOOL)controllerNeedsToRun
{
  BuddyNetworkProvider *v2;
  unsigned __int8 v3;
  char v4;
  char v6;
  BuddyMiscState *v7;
  char v9;

  v2 = -[BuddyStoreRenewController networkProvider](self, "networkProvider");
  v3 = -[BuddyNetworkProvider networkReachable](v2, "networkReachable");
  v6 = 0;
  v4 = 1;
  if ((v3 & 1) == 0)
  {
    v7 = -[BuddyStoreRenewController miscState](self, "miscState");
    v6 = 1;
    v4 = !-[BuddyMiscState userSkippedWiFi](v7, "userSkippedWiFi");
  }
  v9 = v4 & 1;
  if ((v6 & 1) != 0)

  return v9 & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  BuddyStoreRenewController *v3;
  BuddyStoreRenewController *v4;
  NSObject *v5;
  void *v6;
  void **block;
  int v8;
  int v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  BuddyStoreRenewController *v12;
  id v13;
  void **v14;
  int v15;
  int v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  BuddyStoreRenewController *v19;
  id v20;
  void **v21;
  int v22;
  int v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  id location[2];
  BuddyStoreRenewController *v29;

  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v27 = dispatch_group_create();
  dispatch_group_enter((dispatch_group_t)v27);
  v3 = v29;
  v21 = _NSConcreteStackBlock;
  v22 = -1073741824;
  v23 = 0;
  v24 = sub_100172390;
  v25 = &unk_100280730;
  v26 = v27;
  -[BuddyStoreRenewController _fetchAccountsWithCompletion:](v3, "_fetchAccountsWithCompletion:", &v21);
  dispatch_group_enter((dispatch_group_t)v27);
  v4 = v29;
  v14 = _NSConcreteStackBlock;
  v15 = -1073741824;
  v16 = 0;
  v17 = sub_1001723B8;
  v18 = &unk_100283CA0;
  v19 = v29;
  v20 = v27;
  -[BuddyStoreRenewController _fetchMediaLinkedAccountDSIDWithCompletion:](v4, "_fetchMediaLinkedAccountDSIDWithCompletion:", &v14);
  v5 = v27;
  v6 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v8 = -1073741824;
  v9 = 0;
  v10 = sub_100172410;
  v11 = &unk_100281190;
  v13 = location[0];
  v12 = v29;
  dispatch_group_notify(v5, (dispatch_queue_t)v6, &block);

  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong((id *)&v19, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
}

- (void)_fetchAccountsWithCompletion:(id)a3
{
  BuddyStoreRenewController *v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(uint64_t, void *, void *);
  void *v8;
  BuddyStoreRenewController *v9;
  id v10;
  id location[2];
  BuddyStoreRenewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v12;
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_10017257C;
  v8 = &unk_100283D18;
  v9 = v12;
  v10 = location[0];
  -[BuddyStoreRenewController fetchAccounts:](v3, "fetchAccounts:", &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_fetchMediaLinkedAccountDSIDWithCompletion:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  AMSAccountCachedServerData *v10;
  id v11;
  id v12;
  id v13;
  os_log_t oslog;
  void **v15;
  int v16;
  int v17;
  void (*v18)(NSObject *, void *, void *);
  void *v19;
  id v20;
  void **v21;
  int v22;
  int v23;
  void (*v24)(NSObject *, void *, void *);
  void *v25;
  id v26;
  id v27;
  void **v28;
  int v29;
  int v30;
  void (*v31)(id *, void *);
  void *v32;
  id v33[2];
  id v34;
  _QWORD v35[2];
  int v36;
  int v37;
  char v38;
  id v39;
  os_log_type_t v40;
  id v41;
  id v42;
  id location[2];
  BuddyStoreRenewController *v44;
  uint8_t v45[16];
  uint8_t buf[24];

  v44 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v42 = -[BuddyStoreRenewController _primaryAccount](v44, "_primaryAccount");
  v3 = objc_msgSend(v42, "ams_DSID");

  if (v3)
  {
    v41 = (id)_BYLoggingFacility(v4);
    v40 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(v42, "username");
      v6 = objc_msgSend(v42, "ams_DSID");
      sub_1000C3528((uint64_t)buf, (uint64_t)v5, (uint64_t)v6);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v41, v40, "Fetching media link account DSID for %@: %{public}@", buf, 0x16u);

    }
    objc_storeStrong(&v41, 0);
    v7 = objc_alloc((Class)AMSAccountIdentity);
    v8 = objc_msgSend(v42, "ams_DSID");
    v9 = objc_msgSend(v42, "ams_altDSID");
    v39 = objc_msgSend(v7, "initWithDSID:altDSID:", v8, v9);

    v35[0] = 0;
    v35[1] = v35;
    v36 = 0x20000000;
    v37 = 32;
    v38 = 0;
    v28 = _NSConcreteStackBlock;
    v29 = -1073741824;
    v30 = 0;
    v31 = sub_1001735D0;
    v32 = &unk_100283D68;
    v33[1] = v35;
    v33[0] = location[0];
    v34 = objc_retainBlock(&v28);
    v10 = +[AMSAccountCachedServerData sharedInstance](AMSAccountCachedServerData, "sharedInstance");
    v11 = v39;
    v21 = _NSConcreteStackBlock;
    v22 = -1073741824;
    v23 = 0;
    v24 = sub_100173934;
    v25 = &unk_100283D90;
    v26 = v34;
    v27 = -[AMSAccountCachedServerData intForKey:accountID:updateBlock:](v10, "intForKey:accountID:updateBlock:", 2, v11, &v21);

    v12 = v27;
    v15 = _NSConcreteStackBlock;
    v16 = -1073741824;
    v17 = 0;
    v18 = sub_100173BA4;
    v19 = &unk_100283D90;
    v20 = v34;
    objc_msgSend(v12, "addFinishBlock:", &v15);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v34, 0);
    objc_storeStrong(v33, 0);
    _Block_object_dispose(v35, 8);
    objc_storeStrong(&v39, 0);
  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v4);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(v42, "username");
      sub_100038C28((uint64_t)v45, (uint64_t)v13);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Skip fetch media linked account. Failed to determine DSID for primary account: %@", v45, 0xCu);

    }
    objc_storeStrong((id *)&oslog, 0);
    if (location[0])
      (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
  }
  objc_storeStrong(&v42, 0);
  objc_storeStrong(location, 0);
}

- (void)startFlowItem:(BOOL)a3
{
  -[BuddyStoreRenewController _authenticateThenSignInNextAccount](self, "_authenticateThenSignInNextAccount");
}

- (id)viewController
{
  return -[BuddyStoreRenewController signInController](self, "signInController", a2, self);
}

- (void)appleIDControllerFinished:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)appleIDController:(id)a3 didAuthenticateForCredentialRecovery:(id)a4
{
  id v5;
  id location[2];
  BuddyStoreRenewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[BuddyStoreRenewController _didAuthenticateWithAuthenticationResults:](v7, "_didAuthenticateWithAuthenticationResults:", v5);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_isActiveBuddyStoreAccount:(id)a3
{
  BuddyStoreRenewController *v3;
  id v4;
  id v5;
  id location[2];
  BuddyStoreRenewController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v4 = objc_msgSend(location[0], "username");
  v5 = objc_msgSend(location[0], "altDSID");
  LOBYTE(v3) = -[BuddyStoreRenewController _isActiveBuddyStoreAccountWithUsername:orAltDSID:](v3, "_isActiveBuddyStoreAccountWithUsername:orAltDSID:", v4, v5);

  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (BOOL)_isActiveBuddyStoreAccountWithUsername:(id)a3 orAltDSID:(id)a4
{
  id v5;
  BuddyStoreAccount *v6;
  NSString *v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  id v10;
  char v12;
  NSString *v13;
  char v14;
  BuddyStoreAccount *v15;
  id v16;
  id location[2];
  BuddyStoreRenewController *v18;
  char v19;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v5 = location[0];
  v6 = -[BuddyStoreRenewController activeBuddyStoreAccount](v18, "activeBuddyStoreAccount");
  v7 = -[BuddyStoreAccount username](v6, "username");
  v8 = objc_msgSend(v5, "isEqualToString:", v7);
  v14 = 0;
  v12 = 0;
  v9 = 1;
  if ((v8 & 1) == 0)
  {
    v10 = v16;
    v15 = -[BuddyStoreRenewController activeBuddyStoreAccount](v18, "activeBuddyStoreAccount");
    v14 = 1;
    v13 = -[BuddyStoreAccount altDSID](v15, "altDSID");
    v12 = 1;
    v9 = objc_msgSend(v10, "isEqualToString:");
  }
  v19 = v9 & 1;
  if ((v12 & 1) != 0)

  if ((v14 & 1) != 0)
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v19 & 1;
}

- (BOOL)_isPrimaryAccount:(id)a3
{
  BuddyStoreRenewController *v3;
  id v4;
  id v5;
  id location[2];
  BuddyStoreRenewController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v4 = objc_msgSend(location[0], "username");
  v5 = objc_msgSend(location[0], "altDSID");
  LOBYTE(v3) = -[BuddyStoreRenewController _isPrimaryAccountWithUsername:orAltDSID:](v3, "_isPrimaryAccountWithUsername:orAltDSID:", v4, v5);

  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (BOOL)_isPrimaryAccountWithUsername:(id)a3 orAltDSID:(id)a4
{
  id v5;
  id v6;
  id v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  id v10;
  char v12;
  id v13;
  char v14;
  id v15;
  id v16;
  id location[2];
  BuddyStoreRenewController *v18;
  char v19;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v5 = location[0];
  v6 = -[BuddyStoreRenewController _primaryAccountInfo](v18, "_primaryAccountInfo");
  v7 = objc_msgSend(v6, "username");
  v8 = objc_msgSend(v5, "isEqualToString:", v7);
  v14 = 0;
  v12 = 0;
  v9 = 1;
  if ((v8 & 1) == 0)
  {
    v10 = v16;
    v15 = -[BuddyStoreRenewController _primaryAccountInfo](v18, "_primaryAccountInfo");
    v14 = 1;
    v13 = objc_msgSend(v15, "altDSID");
    v12 = 1;
    v9 = objc_msgSend(v10, "isEqualToString:");
  }
  v19 = v9 & 1;
  if ((v12 & 1) != 0)

  if ((v14 & 1) != 0)
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v19 & 1;
}

- (id)_amsAccountStore
{
  return +[ACAccountStore ams_sharedAccountStore](ACAccountStore, "ams_sharedAccountStore", a2, self);
}

- (id)_amsStoreAccountForUsername:(id)a3 altDSID:(id)a4
{
  id v6;
  id v7;
  id location[2];
  BuddyStoreRenewController *v9;
  id v10;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v6 = -[BuddyStoreRenewController _amsAccountStore](v9, "_amsAccountStore");
  if (v7)
    v10 = objc_msgSend(v6, "ams_iTunesAccountWithAltDSID:", v7);
  else
    v10 = objc_msgSend(v6, "ams_iTunesAccountWithUsername:", location[0]);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (id)_primaryAccount
{
  id v2;
  id v3;

  v2 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore", a2, self);
  v3 = objc_msgSend(v2, "aa_primaryAppleAccount");

  return v3;
}

- (id)_primaryAccountInfo
{
  return +[BFFAppleAccountInfo primaryAccountInfo](BFFAppleAccountInfo, "primaryAccountInfo", a2, self);
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
  objc_storeStrong((id *)&self->_miscState, a3);
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
  objc_storeStrong((id *)&self->_networkProvider, a3);
}

- (BFFNavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeCacheManager, a3);
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
  objc_storeStrong((id *)&self->_runState, a3);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
}

- (CDPUIController)cdpUIController
{
  return self->_cdpUIController;
}

- (void)setCdpUIController:(id)a3
{
  objc_storeStrong((id *)&self->_cdpUIController, a3);
}

- (AAUISignInFlowControllerDelegate)flowControllerDelegate
{
  return self->_flowControllerDelegate;
}

- (void)setFlowControllerDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_flowControllerDelegate, a3);
}

- (NSMutableArray)storeAccountsToSignIn
{
  return self->_storeAccountsToSignIn;
}

- (void)setStoreAccountsToSignIn:(id)a3
{
  objc_storeStrong((id *)&self->_storeAccountsToSignIn, a3);
}

- (NSDictionary)storeAccountMap
{
  return self->_storeAccountMap;
}

- (void)setStoreAccountMap:(id)a3
{
  objc_storeStrong((id *)&self->_storeAccountMap, a3);
}

- (BOOL)shouldOnlySetActiveStoreAccount
{
  return self->_shouldOnlySetActiveStoreAccount;
}

- (void)setShouldOnlySetActiveStoreAccount:(BOOL)a3
{
  self->_shouldOnlySetActiveStoreAccount = a3;
}

- (BuddyAppleIDController)storeAppleIDController
{
  return self->_storeAppleIDController;
}

- (void)setStoreAppleIDController:(id)a3
{
  objc_storeStrong((id *)&self->_storeAppleIDController, a3);
}

- (BuddyAppleIDSignInController)signInController
{
  return self->_signInController;
}

- (void)setSignInController:(id)a3
{
  objc_storeStrong((id *)&self->_signInController, a3);
}

- (BuddyStoreAccount)activeBuddyStoreAccount
{
  return self->_activeBuddyStoreAccount;
}

- (void)setActiveBuddyStoreAccount:(id)a3
{
  objc_storeStrong((id *)&self->_activeBuddyStoreAccount, a3);
}

- (ACAccount)activeStoreAccount
{
  return self->_activeStoreAccount;
}

- (void)setActiveStoreAccount:(id)a3
{
  objc_storeStrong((id *)&self->_activeStoreAccount, a3);
}

- (NSNumber)mediaLinkedAccountDSID
{
  return self->_mediaLinkedAccountDSID;
}

- (void)setMediaLinkedAccountDSID:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLinkedAccountDSID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaLinkedAccountDSID, 0);
  objc_storeStrong((id *)&self->_activeStoreAccount, 0);
  objc_storeStrong((id *)&self->_activeBuddyStoreAccount, 0);
  objc_storeStrong((id *)&self->_signInController, 0);
  objc_storeStrong((id *)&self->_storeAppleIDController, 0);
  objc_storeStrong((id *)&self->_storeAccountMap, 0);
  objc_storeStrong((id *)&self->_storeAccountsToSignIn, 0);
  objc_storeStrong((id *)&self->_flowControllerDelegate, 0);
  objc_storeStrong((id *)&self->_cdpUIController, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_storeStrong((id *)&self->_runState, 0);
  objc_storeStrong((id *)&self->_passcodeCacheManager, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
  objc_storeStrong((id *)&self->_miscState, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

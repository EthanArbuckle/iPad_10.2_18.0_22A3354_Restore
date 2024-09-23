@implementation BuddyAppleIDAuthManager

+ (id)managerWithNavigationController:(id)a3 passcodeCacheManager:(id)a4
{
  NSAssertionHandler *v5;
  id v6;
  id v7;
  id v9;
  id v10;
  id location;
  SEL v12;
  Class v13;

  v13 = (Class)a1;
  v12 = a2;
  location = 0;
  objc_storeStrong(&location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  if (!location)
  {
    v5 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v5, "handleFailureInMethod:object:file:lineNumber:description:", v12, v13, CFSTR("BuddyAppleIDAuthManager.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("navigationController != nil"));

  }
  v6 = [v13 alloc];
  v9 = objc_msgSend(v6, "initWithNavigationController:passcodeCacheManager:", location, v10);
  v7 = v9;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&location, 0);
  return v7;
}

- (BuddyAppleIDAuthManager)initWithNavigationController:(id)a3 passcodeCacheManager:(id)a4
{
  id v5;
  BuddyAppleIDAuthManager *v6;
  objc_super v8;
  id obj;
  id location[2];
  id v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  obj = 0;
  objc_storeStrong(&obj, a4);
  v5 = v11;
  v11 = 0;
  v8.receiver = v5;
  v8.super_class = (Class)BuddyAppleIDAuthManager;
  v11 = -[BuddyAppleIDAuthManager init](&v8, "init");
  objc_storeStrong(&v11, v11);
  if (v11)
  {
    objc_storeWeak((id *)v11 + 2, location[0]);
    objc_storeStrong((id *)v11 + 7, obj);
  }
  v6 = (BuddyAppleIDAuthManager *)v11;
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v11, 0);
  return v6;
}

+ (void)silentAuthenticationForPrimaryAccountWithCompletion:(id)a3
{
  id v3;
  id v4;
  id location[2];
  id v6;

  v6 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend((id)objc_opt_class(v6), "_contextForPrimaryAccountSilentAuth");
  objc_msgSend(v6, "_authWithContext:completion:", v3, location[0], v3);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

+ (void)silentAuthenticationWithAuthenticationResults:(id)a3 requiresAppleMAID:(BOOL)a4 completion:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id location[2];
  id v13;

  v13 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = a4;
  v10 = 0;
  objc_storeStrong(&v10, a5);
  v7 = (void *)objc_opt_class(v13);
  v8 = objc_msgSend(v7, "_contextFromAuthenticationResults:requiresAppleMAID:", location[0], v11);
  objc_msgSend(v13, "_authWithContext:completion:", v8, v10, v8);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

+ (void)_authWithContext:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  objc_msgSend(v5, "authenticateWithContext:completion:", location[0], v6);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

+ (id)_contextForPrimaryAccountSilentAuth
{
  id v2;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = objc_msgSend(a1, "_contextForPrimaryAccount");
  objc_msgSend(location[0], "setShouldPreventInteractiveAuth:", 1);
  objc_msgSend(location[0], "setIsUsernameEditable:", 0);
  v2 = location[0];
  objc_storeStrong(location, 0);
  return v2;
}

+ (id)_contextFromAuthenticationResults:(id)a3 requiresAppleMAID:(BOOL)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v10;
  BOOL v11;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = a4;
  v10 = (id)objc_opt_new(AKAppleIDAuthenticationInAppContext);
  v5 = objc_msgSend(location[0], "objectForKeyedSubscript:", AKAuthenticationUsernameKey);
  objc_msgSend(v10, "setUsername:", v5);

  v6 = objc_msgSend(location[0], "objectForKeyedSubscript:", AKAuthenticationAlternateDSIDKey);
  objc_msgSend(v10, "setAltDSID:", v6);

  objc_msgSend(v10, "setAuthenticationType:", 1);
  objc_msgSend(v10, "setIsUsernameEditable:", 0);
  v7 = objc_msgSend(location[0], "objectForKeyedSubscript:", AKAuthenticationIdentityTokenKey);
  objc_msgSend(v10, "_setIdentityToken:", v7);

  if (v11
    && (+[DMCFeatureOverrides allowAnyMAIDToSignIn](DMCFeatureOverrides, "allowAnyMAIDToSignIn") & 1) == 0)
  {
    objc_msgSend(v10, "setAppProvidedContext:", kAppleMAIDSignInProvidedContext);
  }
  v8 = v10;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v8;
}

+ (id)_contextForPrimaryAccount
{
  id v2;
  id v3;
  id v4;
  id location;
  id v7;
  id v8[3];

  v8[2] = a1;
  v8[1] = (id)a2;
  v8[0] = objc_alloc_init((Class)ACAccountStore);
  v7 = objc_msgSend(v8[0], "aa_primaryAppleAccount");
  location = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
  v2 = objc_msgSend(v7, "aa_altDSID");
  objc_msgSend(location, "setAltDSID:", v2);

  v3 = objc_msgSend(v7, "username");
  objc_msgSend(location, "setUsername:", v3);

  v4 = location;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(v8, 0);
  return v4;
}

- (NSString)usernameForCreating
{
  return (NSString *)-[AKAppleIDAuthenticationPurpleBuddyContext usernameForCreating](self->_authContext, "usernameForCreating", a2, self);
}

- (NSString)passwordForCreating
{
  return (NSString *)-[AKAppleIDAuthenticationPurpleBuddyContext passwordForCreating](self->_authContext, "passwordForCreating", a2, self);
}

- (id)authContext
{
  AKAppleIDAuthenticationPurpleBuddyContext *v2;
  AKAppleIDAuthenticationPurpleBuddyContext *authContext;
  AKAppleIDAuthenticationPurpleBuddyContext *v4;
  id WeakRetained;
  uint64_t serviceType;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  char v11;
  NSMutableDictionary *v12;
  id location[2];
  BuddyAppleIDAuthManager *v14;

  v14 = self;
  location[1] = (id)a2;
  if (!self->_authContext)
  {
    v2 = objc_opt_new(AKAppleIDAuthenticationPurpleBuddyContext);
    authContext = v14->_authContext;
    v14->_authContext = v2;

    v4 = v14->_authContext;
    WeakRetained = objc_loadWeakRetained((id *)&v14->_nav);
    -[AKAppleIDAuthenticationPurpleBuddyContext setPresentingViewController:](v4, "setPresentingViewController:", WeakRetained);

    -[AKAppleIDAuthenticationPurpleBuddyContext setShouldOfferSecurityUpgrade:](v14->_authContext, "setShouldOfferSecurityUpgrade:", v14->_shouldOfferSecurityUpgrade);
    -[AKAppleIDAuthenticationPurpleBuddyContext setFirstTimeLogin:](v14->_authContext, "setFirstTimeLogin:", v14->_firstTimeLogin);
    if (v14->_serviceType)
      serviceType = v14->_serviceType;
    else
      serviceType = 1;
    -[AKAppleIDAuthenticationPurpleBuddyContext setServiceType:](v14->_authContext, "setServiceType:", serviceType);
    if (-[BuddyAppleIDAuthManager hasContinuationKey](v14, "hasContinuationKey"))
    {
      -[AKAppleIDAuthenticationPurpleBuddyContext setShouldForceInteractiveAuth:](v14->_authContext, "setShouldForceInteractiveAuth:", 0);
      -[AKAppleIDAuthenticationPurpleBuddyContext setShouldPreventInteractiveAuth:](v14->_authContext, "setShouldPreventInteractiveAuth:", 1);
      -[AKAppleIDAuthenticationPurpleBuddyContext setIsUsernameEditable:](v14->_authContext, "setIsUsernameEditable:", 0);
    }
    v7 = -[AKAppleIDAuthenticationPurpleBuddyContext httpHeadersForRemoteUI](v14->_authContext, "httpHeadersForRemoteUI");
    v8 = (NSMutableDictionary *)objc_msgSend(v7, "mutableCopy");
    v9 = v8;
    v11 = 0;
    if (!v8)
    {
      v8 = objc_opt_new(NSMutableDictionary);
      v12 = v8;
      v11 = 1;
    }
    location[0] = v8;
    if ((v11 & 1) != 0)

    if ((+[BYWarranty shouldDisplay](BYWarranty, "shouldDisplay") & 1) != 0)
      objc_msgSend(location[0], "setObject:forKey:", CFSTR("true"), CFSTR("X-MMe-Show-Warranty"));
    -[AKAppleIDAuthenticationPurpleBuddyContext setHttpHeadersForRemoteUI:](v14->_authContext, "setHttpHeadersForRemoteUI:", location[0]);
    objc_storeStrong(location, 0);
  }
  return v14->_authContext;
}

- (void)_authenticateWithSignInController:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  id v10;
  id v11;
  void **v12;
  int v13;
  int v14;
  void (*v15)(id *, void *, void *);
  void *v16;
  id v17;
  id v18;
  uint8_t buf[15];
  os_log_type_t v20;
  os_log_t oslog;
  id v22;
  id v23;
  id location[2];
  BuddyAppleIDAuthManager *v25;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  objc_storeWeak((id *)&v25->_signInController, location[0]);
  objc_msgSend(location[0], "setEnabled:", 0);
  v22 = (id)objc_opt_new(AKAppleIDAuthenticationController);
  v5 = -[BuddyAppleIDAuthManager authContext](v25, "authContext");
  objc_msgSend(v5, "setAnticipateEscrowAttempt:", 1);

  v6 = -[BuddyAppleIDAuthManager authContext](v25, "authContext");
  objc_msgSend(v6, "setShouldRequestConfigurationInfo:", 1);

  oslog = (os_log_t)(id)_BYLoggingFacility(v7);
  v20 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = oslog;
    v9 = v20;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Starting authenticateWithContext...", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v10 = v22;
  v11 = -[BuddyAppleIDAuthManager authContext](v25, "authContext");
  v12 = _NSConcreteStackBlock;
  v13 = -1073741824;
  v14 = 0;
  v15 = sub_1000A8704;
  v16 = &unk_100281FE0;
  v17 = location[0];
  v18 = v23;
  objc_msgSend(v10, "authenticateWithContext:completion:", v11, &v12);

  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

- (void)authenticateWithSignInController:(id)a3 username:(id)a4 password:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id location[2];
  BuddyAppleIDAuthManager *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v10 = 0;
  objc_storeStrong(&v10, a5);
  v9 = 0;
  objc_storeStrong(&v9, a6);
  -[BuddyAppleIDAuthManager authenticateWithSignInController:username:password:altDSID:completion:](v13, "authenticateWithSignInController:username:password:altDSID:completion:", location[0], v11, v10, 0, v9);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)authenticateWithSignInController:(id)a3 username:(id)a4 password:(id)a5 altDSID:(id)a6 completion:(id)a7
{
  id v11;
  NSCharacterSet *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  AKAppleIDAuthenticationPurpleBuddyContext *authContext;
  id v18;
  AKAppleIDAuthenticationPurpleBuddyContext *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id location[2];
  BuddyAppleIDAuthManager *v27;

  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = 0;
  objc_storeStrong(&v25, a4);
  v24 = 0;
  objc_storeStrong(&v24, a5);
  v23 = 0;
  objc_storeStrong(&v23, a6);
  v22 = 0;
  objc_storeStrong(&v22, a7);
  objc_storeStrong((id *)&v27->_authContext, 0);
  v11 = v25;
  v12 = +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet");
  v13 = objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v12);
  v14 = v25;
  v25 = v13;

  v15 = -[BuddyAppleIDAuthManager authContext](v27, "authContext");
  objc_msgSend(v15, "setUsername:", v25);

  v16 = -[BuddyAppleIDAuthManager authContext](v27, "authContext");
  objc_msgSend(v16, "_setPassword:", v24);

  if (v27->_accountToUpgrade)
  {
    authContext = v27->_authContext;
    v18 = -[ACAccount aa_personID](v27->_accountToUpgrade, "aa_personID");
    -[AKAppleIDAuthenticationPurpleBuddyContext setDSID:](authContext, "setDSID:", v18);

    v19 = v27->_authContext;
    v20 = -[ACAccount aa_altDSID](v27->_accountToUpgrade, "aa_altDSID");
    -[AKAppleIDAuthenticationPurpleBuddyContext setAltDSID:](v19, "setAltDSID:", v20);

  }
  else if (v23)
  {
    v21 = -[BuddyAppleIDAuthManager authContext](v27, "authContext");
    objc_msgSend(v21, "setAltDSID:", v23);

  }
  -[BuddyAppleIDAuthManager _authenticateWithSignInController:completion:](v27, "_authenticateWithSignInController:completion:", location[0], v22);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
}

- (void)fetchAuthModeForUsername:(id)a3 requiresAppleMAID:(BOOL)a4 completion:(id)a5
{
  id v7;
  NSCharacterSet *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  id v14;
  void **v15;
  int v16;
  int v17;
  void (*v18)(NSObject *, void *, id);
  void *v19;
  id v20;
  id v21;
  uint8_t buf[7];
  os_log_type_t v23;
  os_log_t oslog;
  id v25;
  id v26;
  BOOL v27;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v27 = a4;
  v26 = 0;
  objc_storeStrong(&v26, a5);
  v25 = (id)objc_opt_new(AKAppleIDAuthenticationContext);
  v7 = location[0];
  v8 = +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet");
  v9 = objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
  v10 = location[0];
  location[0] = v9;

  v11 = objc_msgSend(v25, "setUsername:", location[0]);
  if (v27)
    v11 = objc_msgSend(v25, "setAppProvidedContext:", kAppleMAIDSignInProvidedContext);
  oslog = (os_log_t)(id)_BYLoggingFacility(v11);
  v23 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v12 = oslog;
    v13 = v23;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Fetching auth mode for account", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v21 = (id)objc_opt_new(AKAppleIDAuthenticationController);
  v14 = v25;
  v15 = _NSConcreteStackBlock;
  v16 = -1073741824;
  v17 = 0;
  v18 = sub_1000A91D8;
  v19 = &unk_100282030;
  v20 = v26;
  objc_msgSend(v21, "fetchAuthModeWithContext:completion:", v14, &v15);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)shouldOfferSecurityUpgrade
{
  return self->_shouldOfferSecurityUpgrade;
}

- (void)setShouldOfferSecurityUpgrade:(BOOL)a3
{
  self->_shouldOfferSecurityUpgrade = a3;
}

- (BOOL)firstTimeLogin
{
  return self->_firstTimeLogin;
}

- (void)setFirstTimeLogin:(BOOL)a3
{
  self->_firstTimeLogin = a3;
}

- (ACAccount)accountToUpgrade
{
  return self->_accountToUpgrade;
}

- (void)setAccountToUpgrade:(id)a3
{
  objc_storeStrong((id *)&self->_accountToUpgrade, a3);
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_serviceType = a3;
}

- (BOOL)hasContinuationKey
{
  return self->_hasContinuationKey;
}

- (void)setHasContinuationKey:(BOOL)a3
{
  self->_hasContinuationKey = a3;
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeCacheManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeCacheManager, 0);
  objc_storeStrong((id *)&self->_accountToUpgrade, 0);
  objc_destroyWeak((id *)&self->_signInController);
  objc_destroyWeak((id *)&self->_nav);
  objc_storeStrong((id *)&self->_authContext, 0);
}

@end

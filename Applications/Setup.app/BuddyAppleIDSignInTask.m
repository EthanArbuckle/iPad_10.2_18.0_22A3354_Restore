@implementation BuddyAppleIDSignInTask

- (BuddyAppleIDSignInTask)initWithFeatureFlags:(id)a3 accountTools:(id)a4
{
  id v5;
  unsigned __int8 v6;
  BuddyAppleIDSignInTask *v7;
  objc_super v9;
  id obj;
  id location[2];
  id v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  obj = 0;
  objc_storeStrong(&obj, a4);
  v5 = v12;
  v12 = 0;
  v9.receiver = v5;
  v9.super_class = (Class)BuddyAppleIDSignInTask;
  v12 = -[BuddyAppleIDSignInTask init](&v9, "init");
  objc_storeStrong(&v12, v12);
  if (v12)
  {
    *((_QWORD *)v12 + 3) = 1;
    *((_BYTE *)v12 + 10) = 1;
    *((_BYTE *)v12 + 11) = 1;
    v6 = +[AMSDevice deviceIsBundle](AMSDevice, "deviceIsBundle");
    *((_BYTE *)v12 + 14) = v6 & 1;
    objc_storeStrong((id *)v12 + 6, location[0]);
    objc_storeStrong((id *)v12 + 7, obj);
  }
  v7 = (BuddyAppleIDSignInTask *)v12;
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v12, 0);
  return v7;
}

- (void)authenticateWithProximity:(id)a3
{
  UINavigationController *v3;
  id v4;
  id v5;
  id location[2];
  BuddyAppleIDSignInTask *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = objc_alloc_init((Class)AKAppleIDProximityAuthenticationContext);
  objc_msgSend(v5, "setProximityAIDAHandler:", &stru_100283248);
  v3 = -[BuddyAppleIDSignInTask navigationController](v7, "navigationController");
  objc_msgSend(v5, "setPresentingViewController:", v3);

  if (-[BuddyAppleIDSignInTask requireAppleMAID](v7, "requireAppleMAID"))
    objc_msgSend(v5, "setAppProvidedContext:", kAppleMAIDSignInProvidedContext);
  v4 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  objc_msgSend(v4, "authenticateWithContext:completion:", v5, location[0]);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)authenticateWithUsername:(id)a3 password:(id)a4 completion:(id)a5
{
  id v7;
  NSCharacterSet *v8;
  id v9;
  id v10;
  UINavigationController *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  BuddyAppleIDSignInTask *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v13 = 0;
  objc_storeStrong(&v13, a5);
  v12 = -[BuddyAppleIDSignInTask _createAuthenticationContext](v16, "_createAuthenticationContext");
  v7 = location[0];
  v8 = +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet");
  v9 = objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
  v10 = location[0];
  location[0] = v9;

  v11 = -[BuddyAppleIDSignInTask navigationController](v16, "navigationController");
  objc_msgSend(v12, "setPresentingViewController:", v11);

  objc_msgSend(v12, "setUsername:", location[0]);
  objc_msgSend(v12, "_setPassword:", v14);
  if (-[BuddyAppleIDSignInTask requireAppleMAID](v16, "requireAppleMAID"))
    objc_msgSend(v12, "setAppProvidedContext:", kAppleMAIDSignInProvidedContext);
  -[BuddyAppleIDSignInTask _authenticateWithContext:completion:](v16, "_authenticateWithContext:completion:", v12, v13);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)authenticateWithUsername:(id)a3 companionDevice:(id)a4 anisetteDataProvider:(id)a5 completion:(id)a6
{
  UINavigationController *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id location[2];
  BuddyAppleIDSignInTask *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v12 = 0;
  objc_storeStrong(&v12, a5);
  v11 = 0;
  objc_storeStrong(&v11, a6);
  v10 = -[BuddyAppleIDSignInTask _createAuthenticationContext](v15, "_createAuthenticationContext");
  objc_msgSend(v10, "setUsername:", location[0]);
  v9 = -[BuddyAppleIDSignInTask navigationController](v15, "navigationController");
  objc_msgSend(v10, "setPresentingViewController:", v9);

  objc_msgSend(v10, "setCompanionDevice:", v13);
  objc_msgSend(v10, "setAnisetteDataProvider:", v12);
  objc_msgSend(v10, "setIsUsernameEditable:", 0);
  objc_msgSend(v10, "setShouldAllowAppleIDCreation:", 0);
  objc_msgSend(v10, "setShouldForceInteractiveAuth:", 0);
  objc_msgSend(v10, "setShouldUpdatePersistentServiceTokens:", 1);
  objc_msgSend(v10, "_setProxyingForApp:", 1);
  if (-[BuddyAppleIDSignInTask requireAppleMAID](v15, "requireAppleMAID"))
    objc_msgSend(v10, "setAppProvidedContext:", kAppleMAIDSignInProvidedContext);
  -[BuddyAppleIDSignInTask _authenticateWithContext:completion:](v15, "_authenticateWithContext:completion:", v10, v11);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)authenticateForAccountCreationWithCompletion:(id)a3
{
  UINavigationController *v3;
  id v4;
  id location[2];
  BuddyAppleIDSignInTask *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[BuddyAppleIDSignInTask _createAuthenticationContext](v6, "_createAuthenticationContext");
  v3 = -[BuddyAppleIDSignInTask navigationController](v6, "navigationController");
  objc_msgSend(v4, "setPresentingViewController:", v3);

  objc_msgSend(v4, "setNeedsNewAppleID:", 1);
  -[BuddyAppleIDSignInTask _authenticateWithContext:completion:](v6, "_authenticateWithContext:completion:", v4, location[0]);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)authenticateForCredentialRecoveryWithCompletion:(id)a3
{
  UINavigationController *v3;
  id v4;
  id location[2];
  BuddyAppleIDSignInTask *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[BuddyAppleIDSignInTask _createAuthenticationContext](v6, "_createAuthenticationContext");
  v3 = -[BuddyAppleIDSignInTask navigationController](v6, "navigationController");
  objc_msgSend(v4, "setPresentingViewController:", v3);

  objc_msgSend(v4, "setNeedsCredentialRecovery:", 1);
  -[BuddyAppleIDSignInTask _authenticateWithContext:completion:](v6, "_authenticateWithContext:completion:", v4, location[0]);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)signInToAllServicesWithAuthenticationResults:(id)a3 completion:(id)a4
{
  BuddyAppleIDSignInTask *v5;
  void **v6;
  int v7;
  int v8;
  void (*v9)(id *);
  void *v10;
  BuddyAppleIDSignInTask *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  BuddyAppleIDSignInTask *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v5 = v16;
  v6 = _NSConcreteStackBlock;
  v7 = -1073741824;
  v8 = 0;
  v9 = sub_10012194C;
  v10 = &unk_100281168;
  v11 = v16;
  v12 = location[0];
  v13 = v14;
  -[BuddyAppleIDSignInTask prepareSignInContext:](v5, "prepareSignInContext:", &v6);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)signInToServices:(id)a3 authenticationResults:(id)a4 completion:(id)a5
{
  BuddyAppleIDSignInTask *v7;
  void **v8;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  BuddyAppleIDSignInTask *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id location[2];
  BuddyAppleIDSignInTask *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v17 = 0;
  objc_storeStrong(&v17, a5);
  v7 = v20;
  v8 = _NSConcreteStackBlock;
  v9 = -1073741824;
  v10 = 0;
  v11 = sub_1001222CC;
  v12 = &unk_100282E88;
  v13 = v20;
  v14 = v18;
  v15 = location[0];
  v16 = v17;
  -[BuddyAppleIDSignInTask prepareSignInContext:](v7, "prepareSignInContext:", &v8);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (void)prepareSignInContext:(id)a3
{
  BuddyAccountTools *v3;
  BuddyAccountTools *v4;
  id location[2];
  BuddyAppleIDSignInTask *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyAppleIDSignInTask accountTools](v6, "accountTools");

  if (v3)
  {
    v4 = -[BuddyAppleIDSignInTask accountTools](v6, "accountTools");
    -[BuddyAccountTools waitUntilSafeToSignInWithCompletion:](v4, "waitUntilSafeToSignInWithCompletion:", location[0]);

  }
  else if (location[0])
  {
    (*((void (**)(void))location[0] + 2))();
  }
  objc_storeStrong(location, 0);
}

- (id)_createAuthenticationContext
{
  id v2;
  id location[2];
  BuddyAppleIDSignInTask *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = objc_alloc_init((Class)AKAppleIDAuthenticationPurpleBuddyContext);
  objc_msgSend(location[0], "setShouldOfferSecurityUpgrade:", 1);
  objc_msgSend(location[0], "setServiceType:", -[BuddyAppleIDSignInTask serviceType](v5, "serviceType"));
  objc_msgSend(location[0], "setAnticipateEscrowAttempt:", 1);
  if ((+[BYWarranty shouldDisplay](BYWarranty, "shouldDisplay") & 1) != 0)
    objc_msgSend(location[0], "setHttpHeadersForRemoteUI:", &off_100290C60);
  v2 = location[0];
  objc_storeStrong(location, 0);
  return v2;
}

- (id)_createServiceContextWithAuthenticationResults:(id)a3
{
  id v3;
  UINavigationController *v4;
  id v5;
  CDPUIController *v6;
  id v7;
  UINavigationController *v8;
  id v9;
  AAUISignInFlowControllerDelegate *v10;
  id v11;
  id v12;
  AAUISignInFlowControllerDelegate *v13;
  AAUISignInFlowControllerDelegate *v14;
  id v15;
  id v16;
  AAUISignInFlowControllerDelegate *v17;
  AAUISignInFlowControllerDelegate *v18;
  id v19;
  CUMessageSession *v20;
  AAUISignInFlowControllerDelegate *v21;
  id v22;
  AAUISignInFlowControllerDelegate *v23;
  id v24;
  BuddyFeatureFlags *v25;
  BuddyAppleIDSignInTask *v26;
  AAUISignInFlowControllerDelegate *v27;
  id v28;
  UINavigationController *v29;
  CDPUIController *v30;
  AAUISignInFlowControllerDelegate *v31;
  NSDictionary *v32;
  id v33;
  id v35;
  id v36;
  id location[2];
  BuddyAppleIDSignInTask *v38;
  _QWORD v39[2];
  _QWORD v40[2];

  v38 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_alloc((Class)CDPUIController);
  v4 = -[BuddyAppleIDSignInTask navigationController](v38, "navigationController");
  v5 = objc_msgSend(v3, "initWithPresentingViewController:", v4);
  -[BuddyAppleIDSignInTask setCdpUIController:](v38, "setCdpUIController:", v5);

  v6 = -[BuddyAppleIDSignInTask cdpUIController](v38, "cdpUIController");
  -[CDPUIController setForceInlinePresentation:](v6, "setForceInlinePresentation:", 1);

  v7 = objc_alloc((Class)AAUISignInFlowControllerDelegate);
  v8 = -[BuddyAppleIDSignInTask navigationController](v38, "navigationController");
  v9 = objc_msgSend(v7, "initWithPresentingViewController:", v8);
  -[BuddyAppleIDSignInTask setFlowControllerDelegate:](v38, "setFlowControllerDelegate:", v9);

  v10 = -[BuddyAppleIDSignInTask flowControllerDelegate](v38, "flowControllerDelegate");
  -[AAUISignInFlowControllerDelegate setShouldStashLoginResponse:](v10, "setShouldStashLoginResponse:", 1);

  v11 = objc_msgSend(location[0], "objectForKeyedSubscript:", AKAuthenticationAcceptedTermsKey);
  if (!v11)
  {
    v12 = -[BuddyAppleIDSignInTask _requiredTerms](v38, "_requiredTerms");
    v13 = -[BuddyAppleIDSignInTask flowControllerDelegate](v38, "flowControllerDelegate");
    -[AAUISignInFlowControllerDelegate setRequiredTerms:](v13, "setRequiredTerms:", v12);

  }
  if (-[BuddyAppleIDSignInTask enableFindMy](v38, "enableFindMy"))
  {
    v14 = -[BuddyAppleIDSignInTask flowControllerDelegate](v38, "flowControllerDelegate");
    -[AAUISignInFlowControllerDelegate setFindMyActivationAction:](v14, "setFindMyActivationAction:", 0);
  }
  else
  {
    v14 = -[BuddyAppleIDSignInTask flowControllerDelegate](v38, "flowControllerDelegate");
    -[AAUISignInFlowControllerDelegate setFindMyActivationAction:](v14, "setFindMyActivationAction:", 2);
  }

  v15 = objc_alloc((Class)CDPContext);
  v16 = objc_msgSend(v15, "initWithAuthenticationResults:", location[0]);
  v17 = -[BuddyAppleIDSignInTask flowControllerDelegate](v38, "flowControllerDelegate");
  -[AAUISignInFlowControllerDelegate setCdpContext:](v17, "setCdpContext:", v16);

  LOBYTE(v16) = -[BuddyAppleIDSignInTask ignoreLockAssertErrors](v38, "ignoreLockAssertErrors");
  v18 = -[BuddyAppleIDSignInTask flowControllerDelegate](v38, "flowControllerDelegate");
  v19 = -[AAUISignInFlowControllerDelegate cdpContext](v18, "cdpContext");
  objc_msgSend(v19, "set_ignoreLockAssertErrors:", v16 & 1);

  v20 = -[BuddyAppleIDSignInTask messageSession](v38, "messageSession");
  v21 = -[BuddyAppleIDSignInTask flowControllerDelegate](v38, "flowControllerDelegate");
  v22 = -[AAUISignInFlowControllerDelegate cdpContext](v21, "cdpContext");
  objc_msgSend(v22, "setSharingChannel:", v20);

  LOBYTE(v20) = -[BuddyAppleIDSignInTask restoreFromBackupMode](v38, "restoreFromBackupMode");
  v23 = -[BuddyAppleIDSignInTask flowControllerDelegate](v38, "flowControllerDelegate");
  v24 = -[AAUISignInFlowControllerDelegate cdpContext](v23, "cdpContext");
  objc_msgSend(v24, "setIsAttemptingBackupRestore:", v20 & 1);

  v25 = -[BuddyAppleIDSignInTask featureFlags](v38, "featureFlags");
  LOBYTE(v23) = -[BuddyFeatureFlags isUseCDPContextSecretInsteadOfSBDSecretEnabled](v25, "isUseCDPContextSecretInsteadOfSBDSecretEnabled");

  if ((v23 & 1) != 0)
  {
    v26 = v38;
    v27 = -[BuddyAppleIDSignInTask flowControllerDelegate](v38, "flowControllerDelegate");
    v28 = -[AAUISignInFlowControllerDelegate cdpContext](v27, "cdpContext");
    -[BuddyAppleIDSignInTask _addCachedLocalSecretToCDPContext:](v26, "_addCachedLocalSecretToCDPContext:", v28);

  }
  v36 = objc_alloc_init((Class)AMSSignInContext);
  objc_msgSend(v36, "setIgnoreAccountConversion:", 1);
  objc_msgSend(v36, "setDebugReason:", CFSTR("Setup Assistant"));
  v35 = objc_alloc_init((Class)AIDAMutableServiceContext);
  objc_msgSend(v35, "setAuthenticationResults:", location[0]);
  v29 = -[BuddyAppleIDSignInTask navigationController](v38, "navigationController");
  objc_msgSend(v35, "setViewController:", v29);

  v30 = -[BuddyAppleIDSignInTask cdpUIController](v38, "cdpUIController");
  objc_msgSend(v35, "setCdpUiProvider:", v30);

  objc_msgSend(v35, "setShouldForceOperation:", 0);
  objc_msgSend(v35, "setOperationUIPermissions:", 1);
  v39[0] = AIDAServiceTypeCloud;
  v31 = -[BuddyAppleIDSignInTask flowControllerDelegate](v38, "flowControllerDelegate");
  v40[0] = v31;
  v39[1] = AIDAServiceTypeStore;
  v40[1] = v36;
  v32 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
  objc_msgSend(v35, "setSignInContexts:", v32);

  v33 = v35;
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
  return v33;
}

- (void)_addCachedLocalSecretToCDPContext:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  os_log_t v6;
  os_log_type_t v7;
  os_log_t v8;
  id v9;
  os_log_type_t v10;
  os_log_t v11;
  id v12;
  int v13;
  os_log_type_t v14;
  os_log_t oslog;
  id location[2];
  BuddyAppleIDSignInTask *v17;
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t v20[16];
  uint8_t buf[24];

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v12 = -[BuddyAppleIDSignInTask cacheManager](v17, "cacheManager");
    if (v12)
    {
      v9 = objc_msgSend(v12, "cachedLocalSecret");
      if (v9)
      {
        v4 = objc_msgSend(v9, "validatedSecret");
        objc_msgSend(location[0], "setCachedLocalSecret:", v4);

        v5 = objc_msgSend(v9, "secretType");
        v6 = (os_log_t)(id)_BYLoggingFacility(objc_msgSend(location[0], "setCachedLocalSecretType:", v5));
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          sub_1000806F4((uint64_t)v18, (uint64_t)"-[BuddyAppleIDSignInTask _addCachedLocalSecretToCDPContext:]");
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Successfully updated local secret within CDPContext.", v18, 0xCu);
        }
        objc_storeStrong((id *)&v6, 0);
        v13 = 0;
      }
      else
      {
        v8 = (os_log_t)(id)_BYLoggingFacility(0);
        v7 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          sub_1000806F4((uint64_t)v19, (uint64_t)"-[BuddyAppleIDSignInTask _addCachedLocalSecretToCDPContext:]");
          _os_log_impl((void *)&_mh_execute_header, v8, v7, "%s: No cached local secret.", v19, 0xCu);
        }
        objc_storeStrong((id *)&v8, 0);
        v13 = 1;
      }
      objc_storeStrong(&v9, 0);
    }
    else
    {
      v11 = (os_log_t)(id)_BYLoggingFacility(0);
      v10 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        sub_1000806F4((uint64_t)v20, (uint64_t)"-[BuddyAppleIDSignInTask _addCachedLocalSecretToCDPContext:]");
        _os_log_error_impl((void *)&_mh_execute_header, v11, v10, "%s: Cache manager was released.", v20, 0xCu);
      }
      objc_storeStrong((id *)&v11, 0);
      v13 = 1;
    }
    objc_storeStrong(&v12, 0);
  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v3);
    v14 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_1000806F4((uint64_t)buf, (uint64_t)"-[BuddyAppleIDSignInTask _addCachedLocalSecretToCDPContext:]");
      _os_log_error_impl((void *)&_mh_execute_header, oslog, v14, "%s: Could not add cached local secret to nil CDPContext", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v13 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)_authenticateWithContext:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id location[3];

  location[2] = self;
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

- (id)_requiredTerms
{
  id v2;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = objc_alloc_init((Class)NSMutableSet);
  if ((+[BYWarranty shouldDisplay](BYWarranty, "shouldDisplay") & 1) != 0)
    objc_msgSend(location[0], "addObject:", AATermsEntryWarranty);
  if ((+[BYLicenseAgreement needsToAcceptNewAgreement](BYLicenseAgreement, "needsToAcceptNewAgreement") & 1) != 0)objc_msgSend(location[0], "addObject:", AATermsEntryDevice);
  v2 = location[0];
  objc_storeStrong(location, 0);
  return v2;
}

- (void)_updateAgreedTerms:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = objc_msgSend(location[0], "accountForService:", AIDAServiceTypeCloud);
  v3 = objc_msgSend(v6, "aa_lastAgreedTermsInfo");
  v5 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SLAVersion"));

  v4 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
  {
    +[BYLicenseAgreement recordUserAcceptedAgreementVersion:](BYLicenseAgreement, "recordUserAcceptedAgreementVersion:", objc_msgSend(v5, "integerValue"));
    +[BuddyTermsConditionsFlow didAgreeToServerTerms](BuddyTermsConditionsFlow, "didAgreeToServerTerms");
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)_signInToAllServicesUsingContext:(id)a3 serviceOwnersManager:(id)a4 completion:(id)a5
{
  _BOOL8 v7;
  NSObject *v8;
  os_log_type_t v9;
  id v10;
  id v11;
  void **v12;
  int v13;
  int v14;
  void (*v15)(_QWORD *, char, id);
  void *v16;
  id v17;
  id v18;
  uint8_t buf[15];
  os_log_type_t v20;
  os_log_t oslog;
  id v22;
  id v23;
  id location[2];
  BuddyAppleIDSignInTask *v25;
  _QWORD v26[5];

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  v22 = 0;
  objc_storeStrong(&v22, a5);
  v7 = -[BuddyAppleIDSignInTask forceForegroundSignIn](v25, "forceForegroundSignIn");
  if (v7)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v7);
    v20 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = oslog;
      v9 = v20;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Forcing synchronous sign-in of all services...", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v26[0] = AIDAServiceTypeCloud;
    v26[1] = AIDAServiceTypeStore;
    v26[2] = AIDAServiceTypeFaceTime;
    v26[3] = AIDAServiceTypeMessages;
    v26[4] = AIDAServiceTypeGameCenter;
    v18 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 5);
    v10 = v23;
    v11 = location[0];
    v12 = _NSConcreteStackBlock;
    v13 = -1073741824;
    v14 = 0;
    v15 = sub_1001233F0;
    v16 = &unk_1002832E8;
    v17 = v22;
    objc_msgSend(v10, "signInToServices:usingContext:completion:", v18, v11, &v12);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v18, 0);
  }
  else
  {
    objc_msgSend(v23, "signInToAllServicesInBackgroundUsingContext:completion:", location[0], v22);
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (BOOL)ignoreLockAssertErrors
{
  return self->_ignoreLockAssertErrors;
}

- (void)setIgnoreLockAssertErrors:(BOOL)a3
{
  self->_ignoreLockAssertErrors = a3;
}

- (BOOL)skipDataclassEnablement
{
  return self->_skipDataclassEnablement;
}

- (void)setSkipDataclassEnablement:(BOOL)a3
{
  self->_skipDataclassEnablement = a3;
}

- (BOOL)makeStoreServiceActive
{
  return self->_makeStoreServiceActive;
}

- (void)setMakeStoreServiceActive:(BOOL)a3
{
  self->_makeStoreServiceActive = a3;
}

- (BOOL)enableFindMy
{
  return self->_enableFindMy;
}

- (void)setEnableFindMy:(BOOL)a3
{
  self->_enableFindMy = a3;
}

- (BOOL)restoreFromBackupMode
{
  return self->_restoreFromBackupMode;
}

- (void)setRestoreFromBackupMode:(BOOL)a3
{
  self->_restoreFromBackupMode = a3;
}

- (BOOL)requireAppleMAID
{
  return self->_requireAppleMAID;
}

- (void)setRequireAppleMAID:(BOOL)a3
{
  self->_requireAppleMAID = a3;
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_serviceType = a3;
}

- (BOOL)forceForegroundSignIn
{
  return self->_forceForegroundSignIn;
}

- (void)setForceForegroundSignIn:(BOOL)a3
{
  self->_forceForegroundSignIn = a3;
}

- (CUMessageSession)messageSession
{
  return self->_messageSession;
}

- (void)setMessageSession:(id)a3
{
  objc_storeStrong((id *)&self->_messageSession, a3);
}

- (BYPasscodeCacheManager)cacheManager
{
  return (BYPasscodeCacheManager *)objc_loadWeakRetained((id *)&self->_cacheManager);
}

- (void)setCacheManager:(id)a3
{
  objc_storeWeak((id *)&self->_cacheManager, a3);
}

- (BuddyFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (BuddyAccountTools)accountTools
{
  return self->_accountTools;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flowControllerDelegate, 0);
  objc_storeStrong((id *)&self->_cdpUIController, 0);
  objc_storeStrong((id *)&self->_accountTools, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_destroyWeak((id *)&self->_cacheManager);
  objc_storeStrong((id *)&self->_messageSession, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

@end

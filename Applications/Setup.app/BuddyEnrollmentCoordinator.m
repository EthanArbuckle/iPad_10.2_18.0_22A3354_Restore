@implementation BuddyEnrollmentCoordinator

- (BuddyEnrollmentCoordinator)initWithPasscodeCacheManager:(id)a3 buddyPreferences:(id)a4 featureFlags:(id)a5
{
  id v7;
  BuddyEnrollmentCoordinator *v8;
  objc_super v10;
  id v11;
  id obj;
  id location[2];
  id v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  obj = 0;
  objc_storeStrong(&obj, a4);
  v11 = 0;
  objc_storeStrong(&v11, a5);
  v7 = v14;
  v14 = 0;
  v10.receiver = v7;
  v10.super_class = (Class)BuddyEnrollmentCoordinator;
  v14 = -[BuddyEnrollmentCoordinator init](&v10, "init");
  objc_storeStrong(&v14, v14);
  if (v14)
  {
    objc_storeStrong((id *)v14 + 10, location[0]);
    objc_storeStrong((id *)v14 + 11, obj);
    objc_storeStrong((id *)v14 + 1, v11);
  }
  v8 = (BuddyEnrollmentCoordinator *)v14;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v14, 0);
  return v8;
}

- (void)retrieveProfileDataWithBaseViewController:(id)a3 navigationController:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  BOOL v12;
  BYPreferencesController *v13;
  unsigned __int8 v14;
  void **v15;
  int v16;
  int v17;
  void (*v18)(NSObject *, char, char, id);
  void *v19;
  BuddyEnrollmentCoordinator *v20;
  id v21;
  id v22;
  id v23;
  void **v24;
  int v25;
  int v26;
  void (*v27)(uint64_t, void *, void *, void *, void *);
  void *v28;
  BuddyEnrollmentCoordinator *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id location[2];
  BuddyEnrollmentCoordinator *v37;

  v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v35 = 0;
  objc_storeStrong(&v35, a4);
  v34 = 0;
  objc_storeStrong(&v34, a5);
  -[BuddyEnrollmentCoordinator setBaseViewController:](v37, "setBaseViewController:", location[0]);
  -[BuddyEnrollmentCoordinator setNavController:](v37, "setNavController:", v35);
  v7 = +[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration");
  v33 = objc_msgSend(v7, "enrollmentServerURL");

  v8 = +[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration");
  v32 = objc_msgSend(v8, "enrollmentAnchorCertificates");

  v31 = objc_opt_new(BuddyEnrollmentFlowMCBridge);
  v24 = _NSConcreteStackBlock;
  v25 = -1073741824;
  v26 = 0;
  v27 = sub_1000C9AF0;
  v28 = &unk_1002824C0;
  v29 = v37;
  v30 = v34;
  objc_msgSend(v31, "setProfileInstallationRequestHandler:", &v24);
  v23 = +[DMCEnrollmentFlowController enrollmentFlowControllerWithPresenter:managedConfigurationHelper:](DMCEnrollmentFlowController, "enrollmentFlowControllerWithPresenter:managedConfigurationHelper:", v37, v31);
  v15 = _NSConcreteStackBlock;
  v16 = -1073741824;
  v17 = 0;
  v18 = sub_1000C9C50;
  v19 = &unk_1002824E8;
  v20 = v37;
  v21 = v34;
  v22 = objc_retainBlock(&v15);
  v9 = +[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration");
  v10 = objc_msgSend(v9, "details");
  v11 = objc_msgSend(v10, "objectForKeyedSubscript:", kCCRemoteManagementAccountIdentifierKey);
  v12 = objc_msgSend(v11, "length") != 0;

  v13 = -[BuddyEnrollmentCoordinator buddyPreferences](v37, "buddyPreferences");
  v14 = -[BYPreferencesController BOOLForKey:](v13, "BOOLForKey:", CFSTR("RestoreChoice"));

  if (v12)
    objc_msgSend(v23, "restartORGOEnrollmentWithServiceURL:anchorCertificates:isPostRestoration:restartIfFail:cleanupIfFail:completionHandler:", v33, v32, v14 & 1, 0, 1, v22);
  else
    objc_msgSend(v23, "startORGOEnrollmentFlowWithServiceURL:anchorCertificates:restartIfFail:completionHandler:", v33, v32, 0, v22);
  -[BuddyEnrollmentCoordinator setEnrollmentFlowController:](v37, "setEnrollmentFlowController:", v23);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong((id *)&v20, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong((id *)&v29, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

- (void)profileInstallationDone
{
  id v2;
  id v3;
  NSString *v4;

  v2 = -[BuddyEnrollmentCoordinator profileInstallationRequestCompleteHandler](self, "profileInstallationRequestCompleteHandler", a2);

  if (v2)
  {
    v3 = -[BuddyEnrollmentCoordinator profileInstallationRequestCompleteHandler](self, "profileInstallationRequestCompleteHandler");
    v4 = -[BuddyEnrollmentCoordinator profileIdentifier](self, "profileIdentifier");
    (*((void (**)(id, NSString *, _QWORD, _QWORD))v3 + 2))(v3, v4, 0, 0);

  }
  -[BuddyEnrollmentCoordinator _cacheAuthenticationResults:](self, "_cacheAuthenticationResults:", 0);
  -[BuddyEnrollmentCoordinator setProfileInstallationRequestCompleteHandler:](self, "setProfileInstallationRequestCompleteHandler:", 0);
}

- (void)discoverAndStoreEnrollmentChannelWithEnrollmentURL:(id)a3 certificateDatas:(id)a4 completionHandler:(id)a5
{
  id v7;
  DMCServiceDiscoveryHelper *v8;
  id v9;
  void **v10;
  int v11;
  int v12;
  void (*v13)(NSObject *, uint64_t, id, void *);
  void *v14;
  BuddyEnrollmentCoordinator *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id location[2];
  BuddyEnrollmentCoordinator *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  v19 = 0;
  objc_storeStrong(&v19, a5);
  v7 = +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection");
  v18 = objc_msgSend(v7, "getMachineInfo");

  v17 = (id)certificatesFromDERCertificateDataArray(v20);
  v8 = -[BuddyEnrollmentCoordinator servicediscoveryHelper](v22, "servicediscoveryHelper");
  v9 = location[0];
  v10 = _NSConcreteStackBlock;
  v11 = -1073741824;
  v12 = 0;
  v13 = sub_1000CA05C;
  v14 = &unk_100282510;
  v15 = v22;
  v16 = v19;
  -[DMCServiceDiscoveryHelper discoverEnrollmentMethodWithServiceURL:enrollmentType:machineInfo:anchorCertificateRefs:completionHandler:](v8, "discoverEnrollmentMethodWithServiceURL:enrollmentType:machineInfo:anchorCertificateRefs:completionHandler:", v9, 1, v18, v17, &v10);

  objc_storeStrong(&v16, 0);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (void)verifyEnrollmentStateWithCompletionHandler:(id)a3
{
  id v3;
  unsigned __int8 v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  NSObject *v19;
  os_log_type_t v20;
  id v21;
  id v22;
  id v23;
  DMCServiceDiscoveryHelper *v24;
  id v25;
  void **v26;
  int v27;
  int v28;
  void (*v29)(NSObject *, void *, void *);
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t v36[7];
  os_log_type_t v37;
  os_log_t v38;
  uint8_t v39[15];
  char v40;
  os_log_t v41;
  id v42;
  uint8_t v43[15];
  char v44;
  os_log_t oslog;
  id v46;
  uint8_t v47[7];
  os_log_type_t v48;
  id v49;
  id v50;
  int v51;
  uint8_t buf[15];
  os_log_type_t v53;
  id v54;
  id location[2];
  BuddyEnrollmentCoordinator *v56;

  v56 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration");
  v4 = objc_msgSend(v3, "isStoredProfileInstalled");

  if ((v4 & 1) != 0)
  {
    v54 = (id)_BYLoggingFacility(v5);
    v53 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v54;
      v7 = v53;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Stored profile has been installed already, return.", buf, 2u);
    }
    objc_storeStrong(&v54, 0);
    (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
    v51 = 1;
  }
  else
  {
    v8 = +[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration");
    v9 = objc_msgSend(v8, "details");
    v50 = objc_msgSend(v9, "objectForKeyedSubscript:", kCCRemoteManagementAccountIdentifierKey);

    if (objc_msgSend(v50, "length"))
    {
      v12 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
      v46 = objc_msgSend(v12, "dmc_remoteManagementAccountForIdentifier:", v50);

      if (v46)
      {
        v42 = objc_msgSend(v46, "dmc_bearerToken");
        v16 = objc_msgSend(v42, "length");
        if (v16)
        {
          v38 = (os_log_t)(id)_BYLoggingFacility(v16);
          v37 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            v19 = v38;
            v20 = v37;
            sub_100038C3C(v36);
            _os_log_impl((void *)&_mh_execute_header, v19, v20, "Cloud config indicates that there's a RMAccount with bearer token.", v36, 2u);
          }
          objc_storeStrong((id *)&v38, 0);
          v21 = +[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration");
          v35 = objc_msgSend(v21, "enrollmentServerURL");

          v22 = +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection");
          v34 = objc_msgSend(v22, "getMachineInfo");

          v23 = +[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration");
          v33 = objc_msgSend(v23, "enrollmentAnchorCertificates");

          v32 = (id)certificatesFromDERCertificateDataArray(v33);
          v24 = -[BuddyEnrollmentCoordinator servicediscoveryHelper](v56, "servicediscoveryHelper");
          v25 = v42;
          v26 = _NSConcreteStackBlock;
          v27 = -1073741824;
          v28 = 0;
          v29 = sub_1000CA750;
          v30 = &unk_100282538;
          v31 = location[0];
          -[DMCServiceDiscoveryHelper fetchEnrollmentProfileWithServiceURL:authToken:machineInfo:anchorCertificateRefs:completionHandler:](v24, "fetchEnrollmentProfileWithServiceURL:authToken:machineInfo:anchorCertificateRefs:completionHandler:", v35, v25, v34, v32, &v26);

          objc_storeStrong(&v31, 0);
          objc_storeStrong(&v32, 0);
          objc_storeStrong(&v33, 0);
          objc_storeStrong(&v34, 0);
          objc_storeStrong(&v35, 0);
          v51 = 0;
        }
        else
        {
          v41 = (os_log_t)(id)_BYLoggingFacility(0);
          v40 = 16;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            v17 = v41;
            v18 = v40;
            sub_100038C3C(v39);
            _os_log_error_impl((void *)&_mh_execute_header, v17, v18, "No bearer token.", v39, 2u);
          }
          objc_storeStrong((id *)&v41, 0);
          (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
          v51 = 1;
        }
        objc_storeStrong(&v42, 0);
      }
      else
      {
        oslog = (os_log_t)(id)_BYLoggingFacility(v13);
        v44 = 16;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          v14 = oslog;
          v15 = v44;
          sub_100038C3C(v43);
          _os_log_error_impl((void *)&_mh_execute_header, v14, v15, "Cloud config has RMAccount id but there's no RM Account locally.", v43, 2u);
        }
        objc_storeStrong((id *)&oslog, 0);
        (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
        v51 = 1;
      }
      objc_storeStrong(&v46, 0);
    }
    else
    {
      v49 = (id)_BYLoggingFacility(0);
      v48 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v49;
        v11 = v48;
        sub_100038C3C(v47);
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "No RM Account in the cloud config, return.", v47, 2u);
      }
      objc_storeStrong(&v49, 0);
      (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
      v51 = 1;
    }
    objc_storeStrong(&v50, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)interruptEnrollment
{
  DMCEnrollmentFlowController *v2;

  -[BuddyEnrollmentCoordinator _cacheAuthenticationResults:](self, "_cacheAuthenticationResults:", 0, a2);
  v2 = -[BuddyEnrollmentCoordinator enrollmentFlowController](self, "enrollmentFlowController");
  -[DMCEnrollmentFlowController terminateEnrollmentFlow](v2, "terminateEnrollmentFlow");

}

- (DMCServiceDiscoveryHelper)servicediscoveryHelper
{
  DMCServiceDiscoveryHelper *v2;
  DMCServiceDiscoveryHelper *servicediscoveryHelper;

  if (!self->_servicediscoveryHelper)
  {
    v2 = objc_opt_new(DMCServiceDiscoveryHelper);
    servicediscoveryHelper = self->_servicediscoveryHelper;
    self->_servicediscoveryHelper = v2;

  }
  return self->_servicediscoveryHelper;
}

- (unint64_t)mdmEnrollmentChannel
{
  return self->_mdmEnrollmentChannel;
}

- (void)requestMAIDAuthenticationWithManagedAppleID:(id)a3 personaID:(id)a4 ephemeral:(BOOL)a5 requireAppleMAID:(BOOL)a6 completionHandler:(id)a7
{
  char v11;
  void **v12;
  int v13;
  int v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  BuddyEnrollmentCoordinator *v17;
  id v18;
  id v19;
  id v20;
  BOOL v21;
  id v22;
  id v23;
  BOOL v24;
  BOOL v25;
  id v26;
  id location[2];
  BuddyEnrollmentCoordinator *v28;

  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v26 = 0;
  objc_storeStrong(&v26, a4);
  v25 = a5;
  v24 = a6;
  v23 = 0;
  objc_storeStrong(&v23, a7);
  v22 = -[BuddyEnrollmentCoordinator _cachedAuthenticationResults](v28, "_cachedAuthenticationResults");
  if (objc_msgSend(v22, "count"))
  {
    v11 = 0;
    if (v24)
      v11 = +[DMCFeatureOverrides allowAnyMAIDToSignIn](DMCFeatureOverrides, "allowAnyMAIDToSignIn") ^ 1;
    v12 = _NSConcreteStackBlock;
    v13 = -1073741824;
    v14 = 0;
    v15 = sub_1000CABC0;
    v16 = &unk_100282560;
    v20 = v23;
    v17 = v28;
    v18 = location[0];
    v19 = v26;
    v21 = v25;
    +[BuddyAppleIDAuthManager silentAuthenticationWithAuthenticationResults:requiresAppleMAID:completion:](BuddyAppleIDAuthManager, "silentAuthenticationWithAuthenticationResults:requiresAppleMAID:completion:", v22, v11 & 1, &v12);
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong((id *)&v17, 0);
    objc_storeStrong(&v20, 0);
  }
  else
  {
    -[BuddyEnrollmentCoordinator _requestInteractiveMAIDAuthenticationWithManagedAppleID:personaID:ephemeral:completionHandler:](v28, "_requestInteractiveMAIDAuthenticationWithManagedAppleID:personaID:ephemeral:completionHandler:", location[0], v26, v25, v23);
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

- (void)_requestInteractiveMAIDAuthenticationWithManagedAppleID:(id)a3 personaID:(id)a4 ephemeral:(BOOL)a5 completionHandler:(id)a6
{
  void *v9;
  void **block;
  int v11;
  int v12;
  void (*v13)(id *);
  void *v14;
  BuddyEnrollmentCoordinator *v15;
  id v16;
  id v17;
  id v18;
  BOOL v19;
  id v20;
  id location[2];
  BuddyEnrollmentCoordinator *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  v19 = a5;
  v18 = 0;
  objc_storeStrong(&v18, a6);
  v9 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v11 = -1073741824;
  v12 = 0;
  v13 = sub_1000CAEF8;
  v14 = &unk_100281168;
  v15 = v22;
  v16 = location[0];
  v17 = v18;
  dispatch_async((dispatch_queue_t)v9, &block);

  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (void)requestMAIDSignInWithAuthenticationResults:(id)a3 personaID:(id)a4 makeiTunesAccountActive:(BOOL)a5 completionHandler:(id)a6
{
  void *v9;
  void **v10;
  int v11;
  int v12;
  void (*v13)(uint64_t);
  void *v14;
  BuddyEnrollmentCoordinator *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BOOL v20;
  id v21;
  id location[2];
  BuddyEnrollmentCoordinator *v23;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = 0;
  objc_storeStrong(&v21, a4);
  v20 = a5;
  v19 = 0;
  objc_storeStrong(&v19, a6);
  v9 = &_dispatch_main_q;
  v10 = _NSConcreteStackBlock;
  v11 = -1073741824;
  v12 = 0;
  v13 = sub_1000CBC40;
  v14 = &unk_1002825D8;
  v15 = v23;
  v16 = location[0];
  v18 = v19;
  v17 = v21;
  dispatch_async((dispatch_queue_t)v9, &v10);

  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

- (void)showEnrollmentFailure:(id)a3
{
  void *v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  BuddyEnrollmentCoordinator *v9;
  id location[2];
  BuddyEnrollmentCoordinator *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1000CC5A8;
  v8 = &unk_100280730;
  v9 = v11;
  dispatch_async((dispatch_queue_t)v3, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_cacheAuthenticationResults:(id)a3
{
  NSFileManager *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  int v10;
  os_log_type_t v11;
  os_log_t oslog;
  id obj;
  id v14;
  id v15;
  id location[3];
  uint8_t buf[24];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = (id)MDMAuthenticationResultsCacheFilePath();
  if (objc_msgSend(location[0], "count"))
  {
    v9 = objc_opt_new(NSMutableDictionary);
    v5 = objc_msgSend(location[0], "objectForKeyedSubscript:", AKAuthenticationUsernameKey);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, AKAuthenticationUsernameKey);

    v6 = objc_msgSend(location[0], "objectForKeyedSubscript:", AKAuthenticationAlternateDSIDKey);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, AKAuthenticationAlternateDSIDKey);

    v7 = objc_msgSend(location[0], "objectForKeyedSubscript:", AKAuthenticationIdentityTokenKey);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, AKAuthenticationIdentityTokenKey);

    v8 = objc_msgSend(v9, "copy");
    objc_msgSend(v8, "DMCWriteToBinaryFile:", v15);

    DMCSetSkipBackupAttributeToItemAtPath(v15, 1);
    objc_storeStrong(&v9, 0);
    v10 = 0;
  }
  else
  {
    v14 = 0;
    v3 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
    obj = 0;
    -[NSFileManager removeItemAtPath:error:](v3, "removeItemAtPath:error:", v15, &obj);
    objc_storeStrong(&v14, obj);

    if (v14)
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v4);
      v11 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        sub_100039500((uint64_t)buf, (uint64_t)v14);
        _os_log_error_impl((void *)&_mh_execute_header, oslog, v11, "Failed to remove cached authentication results with error: %{public}@", buf, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    v10 = 1;
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

- (id)_cachedAuthenticationResults
{
  NSFileManager *v2;
  char v3;
  os_log_t oslog;
  id location;
  int v7;
  id v8[3];
  id v9;
  uint8_t buf[24];

  v8[2] = self;
  v8[1] = (id)a2;
  v8[0] = (id)MDMAuthenticationResultsCacheFilePath();
  v2 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  v3 = !-[NSFileManager fileExistsAtPath:](v2, "fileExistsAtPath:", v8[0]);

  if ((v3 & 1) != 0)
  {
    v9 = 0;
    v7 = 1;
  }
  else
  {
    location = +[NSDictionary DMCDictionaryFromFile:](NSDictionary, "DMCDictionaryFromFile:", v8[0]);
    oslog = (os_log_t)(id)_BYLoggingFacility(location);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100038C28((uint64_t)buf, (uint64_t)location);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Cached authentication results: %@", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v9 = location;
    v7 = 1;
    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(v8, 0);
  return v9;
}

- (BuddyFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (DMCEnrollmentFlowController)enrollmentFlowController
{
  return self->_enrollmentFlowController;
}

- (void)setEnrollmentFlowController:(id)a3
{
  objc_storeStrong((id *)&self->_enrollmentFlowController, a3);
}

- (UIViewController)baseViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_baseViewController);
}

- (void)setBaseViewController:(id)a3
{
  objc_storeWeak((id *)&self->_baseViewController, a3);
}

- (UINavigationController)navController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_navController);
}

- (void)setNavController:(id)a3
{
  objc_storeWeak((id *)&self->_navController, a3);
}

- (BuddyAppleIDSignInTask)signInTask
{
  return self->_signInTask;
}

- (void)setSignInTask:(id)a3
{
  objc_storeStrong((id *)&self->_signInTask, a3);
}

- (id)profileInstallationRequestCompleteHandler
{
  return self->_profileInstallationRequestCompleteHandler;
}

- (void)setProfileInstallationRequestCompleteHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (void)setProfileIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_profileIdentifier, a3);
}

- (void)setServicediscoveryHelper:(id)a3
{
  objc_storeStrong((id *)&self->_servicediscoveryHelper, a3);
}

- (void)setMdmEnrollmentChannel:(unint64_t)a3
{
  self->_mdmEnrollmentChannel = a3;
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeCacheManager, a3);
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferences, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_storeStrong((id *)&self->_passcodeCacheManager, 0);
  objc_storeStrong((id *)&self->_servicediscoveryHelper, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong(&self->_profileInstallationRequestCompleteHandler, 0);
  objc_storeStrong((id *)&self->_signInTask, 0);
  objc_destroyWeak((id *)&self->_navController);
  objc_destroyWeak((id *)&self->_baseViewController);
  objc_storeStrong((id *)&self->_enrollmentFlowController, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
}

@end

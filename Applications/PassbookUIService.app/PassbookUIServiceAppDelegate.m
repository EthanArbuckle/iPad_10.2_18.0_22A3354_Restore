@implementation PassbookUIServiceAppDelegate

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PSListController appearance](PSListController, "appearance", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  objc_msgSend(v4, "setTextColor:", v5);

  return 1;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  PKPassLibrary *v5;
  PKPassLibrary *passLibrary;
  PKPaymentService *v7;
  PKPaymentService *paymentService;
  PKRemoteNetworkPaymentCoordinator *v9;
  PKRemoteNetworkPaymentCoordinator *remotePaymentCoordinator;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  uint64_t Object;
  NSObject *v14;
  _QWORD v16[4];
  Block_layout *v17;

  v5 = (PKPassLibrary *)objc_claimAutoreleasedReturnValue(+[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance", a3, a4));
  passLibrary = self->_passLibrary;
  self->_passLibrary = v5;

  v7 = (PKPaymentService *)objc_alloc_init((Class)PKPaymentService);
  paymentService = self->_paymentService;
  self->_paymentService = v7;

  v9 = (PKRemoteNetworkPaymentCoordinator *)objc_alloc_init((Class)PKRemoteNetworkPaymentCoordinator);
  remotePaymentCoordinator = self->_remotePaymentCoordinator;
  self->_remotePaymentCoordinator = v9;

  -[PKRemoteNetworkPaymentCoordinator setDelegate:](self->_remotePaymentCoordinator, "setDelegate:", self);
  global_queue = dispatch_get_global_queue(21, 0);
  v12 = objc_claimAutoreleasedReturnValue(global_queue);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000046F0;
  v16[3] = &unk_1000082F0;
  v17 = &stru_1000082A0;
  dispatch_async(v12, v16);

  Object = PKLogFacilityTypeGetObject(0);
  v14 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Passbook UI Service Did Finish Launching", (uint8_t *)v16, 2u);
  }

  return 1;
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t Object;
  NSObject *v10;
  uint64_t v11;
  int v13;
  id v14;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scheme"));
  if (objc_msgSend(v7, "isEqual:", CFSTR("shoebox-service")))
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "host"));
    if (-[NSObject isEqualToString:](v8, "isEqualToString:", CFSTR("daemon-launch")))
    {
      Object = PKLogFacilityTypeGetObject(0);
      v10 = objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Launch request received from daemon; notifying.",
          (uint8_t *)&v13,
          2u);
      }

      -[PKPaymentService passbookUIServiceDidLaunch](self->_paymentService, "passbookUIServiceDidLaunch");
      goto LABEL_9;
    }

  }
  v11 = PKLogFacilityTypeGetObject(0);
  v8 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543362;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PassbookUIService did not understand URL %{public}@.", (uint8_t *)&v13, 0xCu);
  }
LABEL_9:

  return 1;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  id v6;
  void *v7;
  unsigned int v8;
  BOOL v9;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activityType"));
  v8 = objc_msgSend(v7, "isEqual:", NSUserActivityTypeBrowsingWeb);

  if (v8)
    v9 = -[PassbookUIServiceAppDelegate _handleUniversalLinkWithUserActivity:](self, "_handleUniversalLinkWithUserActivity:", v6);
  else
    v9 = 0;

  return v9;
}

- (id)_componentsForURL:(id)a3
{
  id v3;
  id v4;

  if (a3)
  {
    v3 = a3;
    v4 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", v3, 1);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)_handleUniversalLinkWithUserActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t Object;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  __CFString *v13;
  __CFString *v14;
  unsigned __int8 v15;
  __CFString *v16;
  __CFString *v17;
  unsigned int v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  unsigned int v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  unsigned int v28;
  void *v30;
  unsigned __int8 v31;
  PassbookUIServiceAppDelegate *v32;
  id v33;
  void *v34;
  uint8_t buf[4];
  void *v36;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "webpageURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PassbookUIServiceAppDelegate _componentsForURL:](self, "_componentsForURL:", v5));
  if (!v6)
  {
    v24 = 0;
    goto LABEL_26;
  }
  v32 = self;
  v33 = v4;
  Object = PKLogFacilityTypeGetObject(0);
  v8 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v36 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Processing URL %{public}@", buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scheme"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "host"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pathComponents"));

  v12 = objc_msgSend(v11, "count");
  v13 = v9;
  v14 = v13;
  if (v13 != CFSTR("http"))
  {
    if (!v13)
      goto LABEL_24;
    v15 = -[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("http"));

    if ((v15 & 1) == 0)
    {
      v16 = v14;
      if (v16 != CFSTR("https"))
      {
        v17 = v16;
        v18 = -[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("https"));

        if (!v18)
          goto LABEL_24;
      }
    }
  }
  v19 = (void *)PKWalletUniversalLinkHostName;
  v20 = v34;
  v21 = v19;
  if (v20 == v21)
  {

    if (!v12)
      goto LABEL_24;
  }
  else
  {
    v22 = v21;
    if (!v20 || !v21)
    {

      goto LABEL_24;
    }
    v23 = objc_msgSend(v20, "isEqualToString:", v21);

    if (!v23 || !v12)
      goto LABEL_24;
  }
  v25 = 0;
  v26 = PKURLActionRouteAppleCardPaymentPass;
  while (1)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v25));
    if (!objc_msgSend(v27, "isEqualToString:", CFSTR("/")))
      break;

LABEL_21:
    if (v12 == (id)++v25)
      goto LABEL_24;
  }
  v28 = objc_msgSend(v27, "isEqualToString:", v26);

  if (v28)
    goto LABEL_21;
  if (v25 == -1
    || (v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v25)),
        v31 = -[PassbookUIServiceAppDelegate _handleURLWithHost:components:userActivity:](v32, "_handleURLWithHost:components:userActivity:", v30, v6, v33), v30, (v31 & 1) == 0))
  {
LABEL_24:
    -[PassbookUIServiceAppDelegate _openURLInSafari:](v32, "_openURLInSafari:", v5);
    v24 = 0;
    goto LABEL_25;
  }
  v24 = 1;
LABEL_25:

  v4 = v33;
LABEL_26:

  return v24;
}

- (BOOL)_handleURLWithHost:(id)a3 components:(id)a4 userActivity:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  BOOL v24;
  uint64_t Object;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  unsigned int v34;
  void *v35;
  char *v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  unsigned int v42;
  PKRemoteNetworkPaymentCoordinator *remotePaymentCoordinator;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  int v48;
  void *v49;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
    goto LABEL_37;
  v11 = (void *)PKURLActionSecurePassSession;
  v12 = v8;
  v13 = v11;
  if (v13 == v12)
  {

    goto LABEL_7;
  }
  v14 = v13;
  if (!v13)
  {

    goto LABEL_12;
  }
  v15 = objc_msgSend(v12, "isEqualToString:", v13);

  if (v15)
  {
LABEL_7:
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fragment"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "componentsSeparatedByString:", CFSTR("&")));

    if (objc_msgSend(v17, "count") == (id)2)
    {
      v18 = objc_alloc((Class)NSData);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 0));
      v20 = objc_msgSend(v18, "initWithBase64EncodedString:options:", v19, 0);

      v21 = objc_alloc((Class)NSData);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 1));
      v23 = objc_msgSend(v21, "initWithBase64EncodedString:options:", v22, 0);

      v24 = -[PassbookUIServiceAppDelegate _handleIssuerBindingRequestWithIssuerData:signature:](self, "_handleIssuerBindingRequestWithIssuerData:signature:", v20, v23);
LABEL_19:

LABEL_24:
      goto LABEL_38;
    }
    Object = PKLogFacilityTypeGetObject(42);
    v26 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v48) = 0;
      v27 = "Missing required parameter for securePassSession.";
      v28 = v26;
      v29 = 2;
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v27, (uint8_t *)&v48, v29);
    }
LABEL_23:

    v24 = 0;
    goto LABEL_24;
  }
LABEL_12:
  v30 = (void *)PKURLActionProvisioningContinuityKey;
  v31 = v12;
  v32 = v30;
  v33 = v32;
  if (v32 == v31)
  {

    goto LABEL_17;
  }
  if (v32)
  {
    v34 = objc_msgSend(v31, "isEqualToString:", v32);

    if (!v34)
      goto LABEL_26;
LABEL_17:
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "pathComponents"));

    v36 = (char *)objc_msgSend(v17, "indexOfObject:", v33) + 1;
    if (v36 < objc_msgSend(v17, "count"))
    {
      v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v36));
      v24 = -[PassbookUIServiceAppDelegate _handleProvisioningContinuityNotification:](self, "_handleProvisioningContinuityNotification:", v20);
      goto LABEL_19;
    }
    v37 = PKLogFacilityTypeGetObject(41);
    v26 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v48 = 138412290;
      v49 = v17;
      v27 = "Unable to handle provisioningContinuity url with path components: %@";
      v28 = v26;
      v29 = 12;
      goto LABEL_22;
    }
    goto LABEL_23;
  }

LABEL_26:
  v38 = (void *)PKURLActionRemoteNetworkPaymentInitiate;
  v39 = v31;
  v40 = v38;
  if (v40 == v39)
  {

  }
  else
  {
    v41 = v40;
    if (!v40)
    {

LABEL_37:
      v24 = 0;
      goto LABEL_38;
    }
    v42 = objc_msgSend(v39, "isEqualToString:", v40);

    if (!v42)
      goto LABEL_37;
  }
  if ((PKRemoteNetworkPaymentEnabled() & 1) == 0)
  {
    v45 = PKLogFacilityTypeGetObject(45);
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v48) = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "App Delegate: URL not handled, feature not enabled", (uint8_t *)&v48, 2u);
    }

    goto LABEL_37;
  }
  remotePaymentCoordinator = self->_remotePaymentCoordinator;
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_originatingProcess"));
  -[PKRemoteNetworkPaymentCoordinator handlePaymentUserActivity:originProcess:](remotePaymentCoordinator, "handlePaymentUserActivity:originProcess:", v10, v44);

  v24 = 1;
LABEL_38:

  return v24;
}

- (BOOL)_handleIssuerBindingRequestWithIssuerData:(id)a3 signature:(id)a4
{
  id v6;
  id v7;
  int v8;

  v6 = a3;
  v7 = a4;
  v8 = PKValidateIssuerBindingData(v6, v7);
  if (v8)
    -[PKPassLibrary presentIssuerBindingFlowForIssuerData:signature:orientation:](self->_passLibrary, "presentIssuerBindingFlowForIssuerData:signature:orientation:", v6, v7, &off_100008570);

  return v8;
}

- (BOOL)_handleProvisioningContinuityNotification:(id)a3
{
  -[PKPaymentService userNotificationActionPerformed:notificationIdentifier:completion:](self->_paymentService, "userNotificationActionPerformed:notificationIdentifier:completion:", 2, a3, 0);
  return 1;
}

- (void)_openURLInSafari:(id)a3
{
  id v3;
  uint64_t Object;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  id v15;

  v3 = a3;
  Object = PKLogFacilityTypeGetObject(0);
  v5 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cannot handle universal link to URL: %@", buf, 0xCu);
  }

  v6 = objc_alloc_init((Class)_LSOpenConfiguration);
  v12 = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v13 = &__kCFBooleanTrue;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  objc_msgSend(v6, "setFrontBoardOptions:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000044F0;
  v10[3] = &unk_1000082C8;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v8, "openURL:configuration:completionHandler:", v9, v6, v10);

}

- (void)buildMenuWithBuilder:(id)a3
{
  objc_msgSend(a3, "removeMenuForIdentifier:", UIMenuAutoFill);
}

- (void)remoteNetworkPaymentCoordinator:(id)a3 didPresentPaymentSheet:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t Object;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;

  v4 = a4;
  Object = PKLogFacilityTypeGetObject(45);
  v6 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (v4)
      v7 = CFSTR("YES");
    v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "App Delegate: Received didPresentPaymentSheet: %@", (uint8_t *)&v8, 0xCu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotePaymentCoordinator, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
}

@end

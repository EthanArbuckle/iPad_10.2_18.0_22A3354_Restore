@implementation FMDMagSafeSetupRemoteUIViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController _remoteViewControllerProxyWithErrorHandler:](self, "_remoteViewControllerProxyWithErrorHandler:", &stru_100034718));
  -[FMDMagSafeSetupRemoteUIViewController setRemoteVCProxy:](self, "setRemoteVCProxy:", v8);

  v9 = sub_100005190();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v14 = 138412290;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "configContext = %@", (uint8_t *)&v14, 0xCu);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController remoteVCProxy](self, "remoteVCProxy"));
  objc_msgSend(v12, "setReachabilityDisabled:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController remoteVCProxy](self, "remoteVCProxy"));
  objc_msgSend(v13, "setAllowsAlertStacking:", 1);

  if (v7)
    v7[2](v7);

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;

  v6 = (void (**)(_QWORD))a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController _remoteViewControllerProxyWithErrorHandler:](self, "_remoteViewControllerProxyWithErrorHandler:", &stru_100034738));
  -[FMDMagSafeSetupRemoteUIViewController setRemoteVCProxy:](self, "setRemoteVCProxy:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("FMLaunchContext")));
  -[FMDMagSafeSetupRemoteUIViewController setLaunchContext:](self, "setLaunchContext:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController launchContext](self, "launchContext"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("launchedFromFindMyApp")));
  -[FMDMagSafeSetupRemoteUIViewController setLaunchedFromFindMyApp:](self, "setLaunchedFromFindMyApp:", objc_msgSend(v12, "BOOLValue"));

  v13 = sub_100005190();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController launchContext](self, "launchContext"));
    v16 = 138412290;
    v17 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "launchContext = %@", (uint8_t *)&v16, 0xCu);

  }
  if (v6)
    v6[2](v6);

}

- (void)viewWillAppear:(BOOL)a3
{
  id v4;
  NSObject *v5;
  unsigned int v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  FMDCoreAccessoryManager *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  objc_super v15;
  uint8_t buf[4];
  const char *v17;

  v15.receiver = self;
  v15.super_class = (Class)FMDMagSafeSetupRemoteUIViewController;
  -[FMDMagSafeSetupRemoteUIViewController viewWillAppear:](&v15, "viewWillAppear:", a3);
  v4 = sub_100005190();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[FMDMagSafeSetupRemoteUIViewController viewWillAppear:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "alert %s", buf, 0xCu);
  }

  -[FMDMagSafeSetupRemoteUIViewController setLockStateNotifyToken:](self, "setLockStateNotifyToken:", 0xFFFFFFFFLL);
  -[FMDMagSafeSetupRemoteUIViewController setProxCardState:](self, "setProxCardState:", 0);
  -[FMDMagSafeSetupRemoteUIViewController setPrevProxCardState:](self, "setPrevProxCardState:", 0);
  v6 = -[FMDMagSafeSetupRemoteUIViewController launchedFromFindMyApp](self, "launchedFromFindMyApp");
  v7 = objc_alloc((Class)FMDispatchTimer);
  if (v6)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100006F68;
    v14[3] = &unk_100034760;
    v14[4] = self;
    v8 = objc_msgSend(v7, "initWithQueue:timeout:completion:", &_dispatch_main_q, v14, 0.01);
    -[FMDMagSafeSetupRemoteUIViewController setShowAttachScreenTimer:](self, "setShowAttachScreenTimer:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController showAttachScreenTimer](self, "showAttachScreenTimer"));
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100006FDC;
    v13[3] = &unk_100034760;
    v13[4] = self;
    v10 = objc_msgSend(v7, "initWithQueue:timeout:completion:", &_dispatch_main_q, v13, 10.0);
    -[FMDMagSafeSetupRemoteUIViewController setTimeoutTimer:](self, "setTimeoutTimer:", v10);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController timeoutTimer](self, "timeoutTimer"));
  }
  v11 = v9;
  objc_msgSend(v9, "start");

  v12 = -[FMDCoreAccessoryManager initWithDelegate:]([FMDCoreAccessoryManager alloc], "initWithDelegate:", self);
  -[FMDMagSafeSetupRemoteUIViewController setCaAccessoryManager:](self, "setCaAccessoryManager:", v12);

}

- (void)viewDidLoad
{
  id v2;
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;

  v4.receiver = self;
  v4.super_class = (Class)FMDMagSafeSetupRemoteUIViewController;
  -[FMDMagSafeSetupRemoteUIViewController viewDidLoad](&v4, "viewDidLoad");
  v2 = sub_100005190();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[FMDMagSafeSetupRemoteUIViewController viewDidLoad]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "alert %s", buf, 0xCu);
  }

}

+ (BOOL)_isSecureForRemoteViewService
{
  id v2;
  NSObject *v3;
  int v5;
  const char *v6;

  v2 = sub_100005190();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "+[FMDMagSafeSetupRemoteUIViewController _isSecureForRemoteViewService]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "alert %s", (uint8_t *)&v5, 0xCu);
  }

  return 1;
}

- (BOOL)_canShowWhileLocked
{
  id v2;
  NSObject *v3;
  int v5;
  const char *v6;

  v2 = sub_100005190();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[FMDMagSafeSetupRemoteUIViewController _canShowWhileLocked]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "alert %s", (uint8_t *)&v5, 0xCu);
  }

  return 1;
}

- (void)proxCardFlowWillPresent
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = sub_100005190();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "presenting magSafe setup card", v4, 2u);
  }

}

- (void)proxCardFlowDidDismiss
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v3 = sub_100005190();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMDMagSafeSetupRemoteUIViewController: proxCardFlowDidDismiss get called", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController locationManager](self, "locationManager"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController locationManager](self, "locationManager"));
    objc_msgSend(v6, "stopUpdatingLocation");

    -[FMDMagSafeSetupRemoteUIViewController setLocationManager:](self, "setLocationManager:", 0);
  }
  -[FMDMagSafeSetupRemoteUIViewController setupEnded](self, "setupEnded");
}

- (void)setupEnded
{
  id v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = sub_100005190();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMDMagSafeSetupRemoteUIViewController: setupEnded get called", buf, 2u);
  }

  -[FMDMagSafeSetupRemoteUIViewController setCaAccessoryManager:](self, "setCaAccessoryManager:", 0);
  -[FMDMagSafeSetupRemoteUIViewController setPhysicalAccessory:](self, "setPhysicalAccessory:", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000742C;
  block[3] = &unk_100034760;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)accessoryDidConnect:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *i;
  void *v33;
  void *v34;
  unsigned int v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  id v56;
  NSObject *v57;
  dispatch_queue_global_t global_queue;
  NSObject *v59;
  void *v60;
  void *v61;
  _QWORD block[4];
  NSObject *v63;
  FMDMagSafeSetupRemoteUIViewController *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t v69[128];
  uint8_t buf[4];
  id v71;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController launchContext](self, "launchContext"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("serialNumber")));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController launchContext](self, "launchContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("serialNumber")));
    v10 = objc_msgSend(v4, "isEqualToString:", v9);

    if (!v10)
      goto LABEL_42;
  }
  else
  {

  }
  v11 = sub_100005190();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v71 = v4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "magsafe accessory with serial number %@ connected", buf, 0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController timeoutTimer](self, "timeoutTimer"));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController timeoutTimer](self, "timeoutTimer"));
    objc_msgSend(v14, "cancel");

    -[FMDMagSafeSetupRemoteUIViewController setTimeoutTimer:](self, "setTimeoutTimer:", 0);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController showAttachScreenTimer](self, "showAttachScreenTimer"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController showAttachScreenTimer](self, "showAttachScreenTimer"));
    objc_msgSend(v16, "cancel");

    -[FMDMagSafeSetupRemoteUIViewController setShowAttachScreenTimer:](self, "setShowAttachScreenTimer:", 0);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController presentingAccessorySerialNumber](self, "presentingAccessorySerialNumber"));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController presentingAccessorySerialNumber](self, "presentingAccessorySerialNumber"));
    v19 = objc_msgSend(v18, "isEqualToString:", v4);

    v20 = sub_100005190();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (v22)
        sub_10001EF98();
    }
    else if (v22)
    {
      sub_10001EFC4();
    }
    goto LABEL_41;
  }
  -[FMDMagSafeSetupRemoteUIViewController setPresentingAccessorySerialNumber:](self, "setPresentingAccessorySerialNumber:", v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController caAccessoryManager](self, "caAccessoryManager"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "accessoryRawInfo"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "allValues"));
  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "firstObject"));

  if (v4)
  {
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController caAccessoryManager](self, "caAccessoryManager"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "accessoryRawInfo"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "allValues"));

    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v66;
      while (2)
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(_QWORD *)v66 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "serialNumber"));
          v35 = objc_msgSend(v34, "isEqualToString:", v4);

          if (v35)
          {
            v36 = v33;

            v21 = v36;
            goto LABEL_28;
          }
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
        if (v30)
          continue;
        break;
      }
    }
LABEL_28:

  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController launchContext](self, "launchContext"));
  v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("serialNumber")));
  if (!v38)
    goto LABEL_36;
  v39 = (void *)v38;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject serialNumber](v21, "serialNumber"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController launchContext](self, "launchContext"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("serialNumber")));
  if (!objc_msgSend(v40, "isEqualToString:", v42))
  {
LABEL_35:

LABEL_36:
    goto LABEL_37;
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController launchContext](self, "launchContext"));
  v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("isNVMSetup")));
  if (!v44)
  {

    goto LABEL_35;
  }
  v45 = (void *)v44;
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController launchContext](self, "launchContext"));
  v61 = v43;
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("keysAvailable")));

  if (!v46)
  {
LABEL_37:
    v56 = sub_1000114EC();
    v57 = objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "launching spinner", buf, 2u);
    }

    -[FMDMagSafeSetupRemoteUIViewController progressFlowWithState:](self, "progressFlowWithState:", 14);
    global_queue = dispatch_get_global_queue(0, 0);
    v59 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007B90;
    block[3] = &unk_100034838;
    v63 = v21;
    v64 = self;
    dispatch_async(v59, block);

    v55 = v63;
    goto LABEL_40;
  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController launchContext](self, "launchContext"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("isNVMSetup")));
  -[NSObject setIsNVMSetup:](v21, "setIsNVMSetup:", objc_msgSend(v48, "BOOLValue"));

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController launchContext](self, "launchContext"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("keysAvailable")));
  -[NSObject setKeysAvailable:](v21, "setKeysAvailable:", objc_msgSend(v50, "BOOLValue"));

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController launchContext](self, "launchContext"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("phoneNumber")));
  -[NSObject setPhoneNumber:](v21, "setPhoneNumber:", v52);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController launchContext](self, "launchContext"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("email")));
  -[NSObject setEmail:](v21, "setEmail:", v54);

  -[FMDMagSafeSetupRemoteUIViewController setPhysicalAccessory:](self, "setPhysicalAccessory:", v21);
  v55 = objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController physicalAccessory](self, "physicalAccessory"));
  -[FMDMagSafeSetupRemoteUIViewController prepareForSetupFlowFor:](self, "prepareForSetupFlowFor:", v55);
LABEL_40:

LABEL_41:
LABEL_42:

}

- (void)accessoryDidDisconnect:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  int v11;
  id v12;

  v4 = a3;
  v5 = sub_1000114EC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "accessory with serialNumber %@ disconnected", (uint8_t *)&v11, 0xCu);
  }

  v7 = objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController presentingAccessorySerialNumber](self, "presentingAccessorySerialNumber"));
  if (!v7
    || (v8 = (void *)v7,
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController presentingAccessorySerialNumber](self, "presentingAccessorySerialNumber")), v10 = objc_msgSend(v9, "isEqualToString:", v4), v9, v8, v10))
  {
    -[FMDMagSafeSetupRemoteUIViewController setPresentingAccessorySerialNumber:](self, "setPresentingAccessorySerialNumber:", 0);
    -[FMDMagSafeSetupRemoteUIViewController setupEnded](self, "setupEnded");
  }

}

- (void)prepareForSetupFlowFor:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  NSObject *v16;
  unsigned int v17;
  unint64_t v18;
  FMDMagSafeSetupRemoteUIViewController *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  unsigned int v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  unsigned int v30;
  unint64_t v31;
  id v32;
  NSObject *v33;
  int v34;
  unsigned int v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  uint64_t v39;

  v4 = a3;
  -[FMDMagSafeSetupRemoteUIViewController setDeviceLockState:](self, "setDeviceLockState:", MKBGetDeviceLockState(0));
  v5 = sub_100005190();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v34) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "initialising prepareForSetupFlowFor", (uint8_t *)&v34, 2u);
  }

  -[FMDMagSafeSetupRemoteUIViewController setMagSafeState:](self, "setMagSafeState:", -[FMDMagSafeSetupRemoteUIViewController stateForAccessory:](self, "stateForAccessory:", v4));
  if ((id)-[FMDMagSafeSetupRemoteUIViewController magSafeState](self, "magSafeState") == (id)3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMDMagSafeDataStore sharedInstance](FMDMagSafeDataStore, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "readAllAccessoriesFromDisk"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serialNumber"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtHelper deviceIDFromAddress:](FMDExtHelper, "deviceIDFromAddress:", v9));

    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v10));
    if (!v11
      || (v12 = (void *)v11,
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v10)),
          v14 = objc_msgSend(v13, "findMyEnabled"),
          v13,
          v12,
          (v14 & 1) == 0))
    {
      -[FMDMagSafeSetupRemoteUIViewController _addAccessorytoDataStore:](self, "_addAccessorytoDataStore:", v4);
    }
    -[FMDMagSafeSetupRemoteUIViewController postNotification:](self, "postNotification:", CFSTR("com.apple.icloud.findmydeviced.findkit.magSafe.added"));

  }
  v15 = sub_100005190();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = -[FMDMagSafeSetupRemoteUIViewController deviceLockState](self, "deviceLockState");
    v18 = -[FMDMagSafeSetupRemoteUIViewController magSafeState](self, "magSafeState");
    v34 = 67109632;
    v35 = v17;
    v36 = 2048;
    v37 = v18;
    v38 = 2048;
    v39 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Device lock state = %d magSafeState = %lu proxCardState = %lu", (uint8_t *)&v34, 0x1Cu);
  }

  if (-[FMDMagSafeSetupRemoteUIViewController launchedFromFindMyApp](self, "launchedFromFindMyApp"))
  {
    if ((id)-[FMDMagSafeSetupRemoteUIViewController magSafeState](self, "magSafeState") == (id)3)
    {
      v19 = self;
      v20 = 2;
LABEL_35:
      -[FMDMagSafeSetupRemoteUIViewController progressFlowWithState:](v19, "progressFlowWithState:", v20);
      goto LABEL_36;
    }
    if ((id)-[FMDMagSafeSetupRemoteUIViewController magSafeState](self, "magSafeState") == (id)6)
    {
LABEL_14:
      v19 = self;
      v20 = 3;
      goto LABEL_35;
    }
    if ((id)-[FMDMagSafeSetupRemoteUIViewController magSafeState](self, "magSafeState") == (id)5)
    {
      -[FMDMagSafeSetupRemoteUIViewController setMagSafeState:](self, "setMagSafeState:", 1);
    }
    else if (!-[FMDMagSafeSetupRemoteUIViewController magSafeState](self, "magSafeState"))
    {
      v32 = sub_100005190();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        sub_10001F0F8();

      goto LABEL_14;
    }
  }
  if ((id)-[FMDMagSafeSetupRemoteUIViewController magSafeState](self, "magSafeState") != (id)3
    && -[FMDMagSafeSetupRemoteUIViewController magSafeState](self, "magSafeState")
    && (id)-[FMDMagSafeSetupRemoteUIViewController magSafeState](self, "magSafeState") != (id)5
    && (id)-[FMDMagSafeSetupRemoteUIViewController magSafeState](self, "magSafeState") != (id)6)
  {
    v23 = sub_100005190();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = -[FMDMagSafeSetupRemoteUIViewController deviceLockState](self, "deviceLockState");
      v26 = -[FMDMagSafeSetupRemoteUIViewController magSafeState](self, "magSafeState");
      v34 = 67109632;
      v35 = v25;
      v36 = 2048;
      v37 = v26;
      v38 = 2048;
      v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Device lock state = %d magSafeState = %lu proxCardState = %lu", (uint8_t *)&v34, 0x1Cu);
    }

    if (-[FMDMagSafeSetupRemoteUIViewController deviceLockState](self, "deviceLockState") == 1
      || -[FMDMagSafeSetupRemoteUIViewController deviceLockState](self, "deviceLockState") == 2)
    {
      if ((id)-[FMDMagSafeSetupRemoteUIViewController magSafeState](self, "magSafeState") == (id)2)
        v27 = 9;
      else
        v27 = 4;
    }
    else if ((id)-[FMDMagSafeSetupRemoteUIViewController magSafeState](self, "magSafeState") == (id)2)
    {
      v27 = 10;
    }
    else if ((id)-[FMDMagSafeSetupRemoteUIViewController magSafeState](self, "magSafeState") == (id)1)
    {
      v27 = 5;
    }
    else if ((id)-[FMDMagSafeSetupRemoteUIViewController magSafeState](self, "magSafeState") == (id)4)
    {
      v27 = 6;
    }
    else
    {
      v27 = 0;
    }
    v28 = sub_100005190();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = -[FMDMagSafeSetupRemoteUIViewController deviceLockState](self, "deviceLockState");
      v31 = -[FMDMagSafeSetupRemoteUIViewController magSafeState](self, "magSafeState");
      v34 = 67109632;
      v35 = v30;
      v36 = 2048;
      v37 = v31;
      v38 = 2048;
      v39 = v27;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Device lock state = %d magSafeState = %lu proxCardState = %lu", (uint8_t *)&v34, 0x1Cu);
    }

    v19 = self;
    v20 = v27;
    goto LABEL_35;
  }
  v21 = sub_100005190();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    sub_10001F07C(self, v22);

  -[FMDMagSafeSetupRemoteUIViewController setupEnded](self, "setupEnded");
LABEL_36:

}

- (unint64_t)stateForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  unsigned int v8;
  unsigned int v9;
  unint64_t v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;

  v4 = a3;
  if (!v4)
  {
    v10 = 0;
    goto LABEL_11;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAccessoryTypeValidator sharedInstance](FMDAccessoryTypeValidator, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessoryType"));
  if (!objc_msgSend(v5, "isAllowedAccessoryWithType:", v6))
  {

    goto LABEL_10;
  }
  v7 = objc_msgSend(v4, "isMF4i");

  if ((v7 & 1) == 0)
  {
LABEL_10:
    v10 = 6;
    goto LABEL_11;
  }
  v8 = objc_msgSend(v4, "isNVMSetup");
  v9 = objc_msgSend(v4, "keysAvailable");
  if (v8)
  {
    if (v9)
      v10 = 3;
    else
      v10 = 2;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[FMDMagSafeDataStore sharedInstance](FMDMagSafeDataStore, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "readAllAccessoriesFromDisk"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serialNumber"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtHelper deviceIDFromAddress:](FMDExtHelper, "deviceIDFromAddress:", v14));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v15));
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v15));
      v18 = objc_msgSend(v17, "findMyEnabled");

      if (v18)
      {
        -[FMDMagSafeSetupRemoteUIViewController _removeAccessoryToDataStoreWithID:](self, "_removeAccessoryToDataStoreWithID:", v15);
        v10 = 0;
      }
      else
      {
        v10 = 5;
      }
    }
    else
    {
      v10 = 1;
    }

  }
LABEL_11:

  return v10;
}

- (void)_removeAccessoryToDataStoreWithID:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD v8[4];
  NSObject *v9;

  v3 = a3;
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDMagSafeDataStore sharedInstance](FMDMagSafeDataStore, "sharedInstance"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100008DF8;
  v8[3] = &unk_100034860;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "removeAccessoryWithId:withCompletion:", v3, v8);

  v7 = dispatch_time(0, 1000000000);
  dispatch_group_wait(v6, v7);

}

- (void)_addAccessorytoDataStore:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  intptr_t v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  FMDMagSafeAccessory *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  dispatch_time_t v17;
  intptr_t v18;
  id v19;
  NSObject *v20;
  _QWORD v21[4];
  NSObject *v22;
  uint64_t *v23;
  _QWORD v24[4];
  NSObject *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v4 = a3;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_10000916C;
  v31 = sub_10000917C;
  v32 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController _computeName](self, "_computeName"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100009184;
    v24[3] = &unk_100034888;
    v26 = &v27;
    v25 = v5;
    objc_msgSend(v4, "setName:withCompletion:", v7, v24);

  }
  v8 = dispatch_time(0, 10000000000);
  v9 = dispatch_group_wait(v5, v8);
  if (v28[5])
    v10 = 0;
  else
    v10 = v9 == 0;
  if (v10)
  {
    v13 = -[FMDMagSafeAccessory initWithPhysicalAccessory:fmEnabled:]([FMDMagSafeAccessory alloc], "initWithPhysicalAccessory:fmEnabled:", v4, 1);
    -[FMDMagSafeSetupRemoteUIViewController setMagSafeAccessory:](self, "setMagSafeAccessory:", v13);

    dispatch_group_enter(v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMDMagSafeDataStore sharedInstance](FMDMagSafeDataStore, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController magSafeAccessory](self, "magSafeAccessory"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000925C;
    v21[3] = &unk_100034888;
    v23 = &v27;
    v16 = v5;
    v22 = v16;
    objc_msgSend(v14, "addAccessory:withCompletion:", v15, v21);

    v17 = dispatch_time(0, 1000000000);
    v18 = dispatch_group_wait(v16, v17);
    if (v28[5] || v18)
    {
      v19 = sub_100005190();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_10001F184();

    }
    v12 = v22;
  }
  else
  {
    v11 = sub_100005190();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10001F124();
  }

  _Block_object_dispose(&v27, 8);
}

- (void)progressFlowWithState:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  unint64_t v9;

  v5 = sub_100005190();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "flow with state = %lu", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100009420;
  v7[3] = &unk_1000348B0;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

- (id)proxCardUnlockedStartFlow
{
  FMDRemoteAsset *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  FMDRemoteAsset *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  FMDRemoteAsset *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  int v18;
  id v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  FMDMovieProxCardViewController *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  FMDRemoteAsset *v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;

  v3 = [FMDRemoteAsset alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController physicalAccessory](self, "physicalAccessory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessoryType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController physicalAccessory](self, "physicalAccessory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "style"));
  v34 = -[FMDRemoteAsset initWithAccessoryType:style:type:](v3, "initWithAccessoryType:style:type:", v5, v7, 0);

  v8 = [FMDRemoteAsset alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController physicalAccessory](self, "physicalAccessory"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accessoryType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController physicalAccessory](self, "physicalAccessory"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "style"));
  v13 = -[FMDRemoteAsset initWithAccessoryType:style:type:](v8, "initWithAccessoryType:style:type:", v10, v12, 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRemoteAsset getStoredAssetLocation](v34, "getStoredAssetLocation"));
  v15 = objc_claimAutoreleasedReturnValue(-[FMDRemoteAsset getStoredAssetLocation](v13, "getStoredAssetLocation"));
  v16 = (void *)v15;
  if (v14)
    v17 = v15 == 0;
  else
    v17 = 1;
  v18 = !v17;
  v19 = sub_1000114EC();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v21)
    {
      *(_DWORD *)buf = 138412546;
      v38 = v14;
      v39 = 2112;
      v40 = v16;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "using video = %@ and adjustmensts = %@", buf, 0x16u);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v14));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v16));
  }
  else
  {
    if (v21)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "using default video", buf, 2u);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "URLForResource:withExtension:", CFSTR("wallet1-pairing-video.mov"), 0));

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "URLForResource:withExtension:", CFSTR("wallet1-pairing-video-adjustments.plist"), 0));

  }
  v26 = -[FMDMovieProxCardViewController initWithMovieURL:adjustmentsURL:movieDimensions:productHeight:]([FMDMovieProxCardViewController alloc], "initWithMovieURL:adjustmentsURL:movieDimensions:productHeight:", v22, v23, 176.0, 304.0, 176.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_ACCESSORY_TITLE"), &stru_100036128, 0));
  -[FMDMovieProxCardViewController setTitle:](v26, "setTitle:", v28);

  -[FMDMovieProxCardViewController setDismissalType:](v26, "setDismissalType:", 3);
  objc_initWeak((id *)buf, self);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_CONTINUE"), &stru_100036128, 0));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100009B28;
  v35[3] = &unk_1000348D8;
  objc_copyWeak(&v36, (id *)buf);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v30, 0, v35));
  v32 = -[FMDMovieProxCardViewController addAction:](v26, "addAction:", v31);

  objc_destroyWeak(&v36);
  objc_destroyWeak((id *)buf);

  return v26;
}

- (void)continueWithAccountValidationFlow
{
  unint64_t v3;

  v3 = -[FMDMagSafeSetupRemoteUIViewController accountState](self, "accountState");
  if (v3 <= 3)
    -[FMDMagSafeSetupRemoteUIViewController progressFlowWithState:](self, "progressFlowWithState:", qword_100025E58[v3]);
}

- (void)setUpFindMyWithCompletion:(id)a3
{
  id v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  global_queue = dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100009C84;
  v8[3] = &unk_100034970;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)storeAccessoryAsNotFindmyEnabled:(id)a3
{
  id v4;
  FMDMagSafeAccessory *v5;
  void *v6;
  FMDMagSafeAccessory *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = [FMDMagSafeAccessory alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController physicalAccessory](self, "physicalAccessory"));
  v7 = -[FMDMagSafeAccessory initWithPhysicalAccessory:fmEnabled:](v5, "initWithPhysicalAccessory:fmEnabled:", v6, 0);
  -[FMDMagSafeSetupRemoteUIViewController setMagSafeAccessory:](self, "setMagSafeAccessory:", v7);

  v9 = (id)objc_claimAutoreleasedReturnValue(+[FMDMagSafeDataStore sharedInstance](FMDMagSafeDataStore, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController magSafeAccessory](self, "magSafeAccessory"));
  objc_msgSend(v9, "addAccessory:withCompletion:", v8, v4);

}

- (id)_computeName
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v2 = objc_alloc_init((Class)ACAccountStore);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "aa_primaryAppleAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aa_firstName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aa_lastName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_WALLET_NAME_PATTERN"), &stru_100036128, 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_WALLET_DEFAULT_NAME"), &stru_100036128, 0));

  v10 = sub_100005190();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_10001F2D8();

  if (objc_msgSend(v7, "containsString:", CFSTR("<firstName>")))
  {
    if (!v4)
      goto LABEL_10;
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<firstName>"), v4));

    v7 = (void *)v12;
  }
  if (!objc_msgSend(v7, "containsString:", CFSTR("<lastName>")))
  {
    v13 = v7;
    goto LABEL_11;
  }
  if (!v5)
  {
LABEL_10:
    v13 = v9;
    goto LABEL_11;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<lastName>"), v5));

  v7 = v13;
LABEL_11:
  v14 = v13;

  return v14;
}

- (id)proxCardAttachAccessory
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;
  void *v22;

  v3 = objc_alloc_init((Class)PRXIconContentViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_ATTACH_WALLET_TITLE"), &stru_100036128, 0));
  objc_msgSend(v3, "setTitle:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_ATTACH_WALLET_MESSAGE"), &stru_100036128, 0));
  objc_msgSend(v3, "setSubtitle:", v7);

  objc_msgSend(v3, "setDismissalType:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", UIFontTextStyleLargeTitle, 3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("plus.circle.fill"), v8));
  v22 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
  objc_msgSend(v3, "setImages:", v10);

  objc_initWeak(&location, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_CANCEL"), &stru_100036128, 0));
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_10000B5B4;
  v19 = &unk_1000348D8;
  objc_copyWeak(&v20, &location);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v12, 0, &v16));
  v14 = objc_msgSend(v3, "addAction:", v13, v16, v17, v18, v19);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v3;
}

- (id)proxCardUnsupportedAccessory
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;
  void *v22;

  v3 = objc_alloc_init((Class)PRXIconContentViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_NOT_SUPPORTED_TITLE"), &stru_100036128, 0));
  objc_msgSend(v3, "setTitle:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_NOT_SUPPORTED_MESSAGE"), &stru_100036128, 0));
  objc_msgSend(v3, "setSubtitle:", v7);

  objc_msgSend(v3, "setDismissalType:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", UIFontTextStyleLargeTitle, 3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.circle.fill"), v8));
  v22 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
  objc_msgSend(v3, "setImages:", v10);

  objc_initWeak(&location, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_CANCEL"), &stru_100036128, 0));
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_10000B8BC;
  v19 = &unk_1000348D8;
  objc_copyWeak(&v20, &location);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v12, 0, &v16));
  v14 = objc_msgSend(v3, "addAction:", v13, v16, v17, v18, v19);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v3;
}

- (id)proxCardAlreadyAttached
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;
  void *v22;

  v3 = objc_alloc_init((Class)PRXIconContentViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_ALREADY_ATTACHED_TITLE"), &stru_100036128, 0));
  objc_msgSend(v3, "setTitle:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_ALREADY_ATTACHED_MESSAGE"), &stru_100036128, 0));
  objc_msgSend(v3, "setSubtitle:", v7);

  objc_msgSend(v3, "setDismissalType:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", UIFontTextStyleLargeTitle, 3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.circle.fill"), v8));
  v22 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
  objc_msgSend(v3, "setImages:", v10);

  objc_initWeak(&location, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_CANCEL"), &stru_100036128, 0));
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_10000BBC4;
  v19 = &unk_1000348D8;
  objc_copyWeak(&v20, &location);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v12, 0, &v16));
  v14 = objc_msgSend(v3, "addAction:", v13, v16, v17, v18, v19);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v3;
}

- (id)proxCardAddToDevice
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id location;

  v3 = objc_alloc_init((Class)PRXCardContentViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_ACCESSORY_TITLE"), &stru_100036128, 0));
  objc_msgSend(v3, "setTitle:", v5);

  objc_msgSend(v3, "setDismissalType:", 3);
  objc_initWeak(&location, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_CONTINUE"), &stru_100036128, 0));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000BDE4;
  v11[3] = &unk_100034998;
  objc_copyWeak(&v12, &location);
  v11[4] = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v7, 0, v11));
  v9 = objc_msgSend(v3, "addAction:", v8);

  -[FMDMagSafeSetupRemoteUIViewController addImagetoCard:](self, "addImagetoCard:", v3);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v3;
}

- (BOOL)isFindMyEnabled
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  id v6;
  NSObject *v7;
  char v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000BF7C;
  v10[3] = &unk_1000349C0;
  v12 = &v13;
  v4 = v2;
  v11 = v4;
  objc_msgSend(v3, "fmipStateWithCompletion:", v10);

  v5 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v4, v5))
  {
    v6 = sub_100005190();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10001F34C();

  }
  v8 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)enableFindMyWithCompletion:(id)a3
{
  void (**v3)(id, void *);
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  int v8;
  void *v9;

  v3 = (void (**)(id, void *))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enableFMIPInContext:", 7));

  v6 = sub_100005190();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "enable Findmy with error = %@", (uint8_t *)&v8, 0xCu);
  }

  v3[2](v3, v5);
}

- (id)proxCardSetupFindmy
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void **v23;
  uint64_t v24;
  void (*v25)(id *, void *);
  void *v26;
  id v27;
  FMDMagSafeSetupRemoteUIViewController *v28;
  id v29;
  id location;
  void *v31;

  v3 = objc_alloc_init((Class)PRXIconContentViewController);
  objc_msgSend(v3, "setImageStyle:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Find_My")));
  v31 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
  objc_msgSend(v3, "setImages:", v5);

  objc_msgSend(v3, "setDismissalType:", 1);
  LODWORD(v5) = -[FMDMagSafeSetupRemoteUIViewController isRestrictedSKU](self, "isRestrictedSKU");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = v6;
  if ((_DWORD)v5)
    v8 = CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_ADD_TO_FIND_MY_MESSAGE_RESTRICTED_SKU");
  else
    v8 = CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_ADD_TO_FIND_MY_MESSAGE");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_100036128, 0));
  objc_msgSend(v3, "setBodyText:", v9);

  if (-[FMDMagSafeSetupRemoteUIViewController isFindMyAppInstalled](self, "isFindMyAppInstalled"))
  {
    v10 = -[FMDMagSafeSetupRemoteUIViewController isFindMyEnabled](self, "isFindMyEnabled");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = v11;
    if ((v10 & 1) != 0)
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_ADD_TO_FIND_MY?"), &stru_100036128, 0));
    else
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_ENABLE_FINDMY_TITLE"), &stru_100036128, 0));
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_INSTALL_FIND_MY?"), &stru_100036128, 0));
  }
  v14 = (void *)v13;
  objc_msgSend(v3, "setTitle:", v13);

  if (-[FMDMagSafeSetupRemoteUIViewController isFindMyAppInstalled](self, "isFindMyAppInstalled"))
  {
    if (-[FMDMagSafeSetupRemoteUIViewController isFindMyEnabled](self, "isFindMyEnabled"))
      v15 = CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_ADD_TO_FIND_MY_ACTION");
    else
      v15 = CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_ENABLE_FINDMY_ACTION");
  }
  else
  {
    v15 = CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_INSTALL_FIND_MY_ACTION");
  }
  -[FMDMagSafeSetupRemoteUIViewController addDismissButtonAction:](self, "addDismissButtonAction:", v3);
  objc_initWeak(&location, self);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", v15, &stru_100036128, 0));
  v23 = _NSConcreteStackBlock;
  v24 = 3221225472;
  v25 = sub_10000C3D8;
  v26 = &unk_100034A10;
  v18 = v3;
  v27 = v18;
  v28 = self;
  objc_copyWeak(&v29, &location);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v17, 0, &v23));
  v20 = objc_msgSend(v18, "addAction:", v19, v23, v24, v25, v26);

  v21 = v18;
  objc_destroyWeak(&v29);

  objc_destroyWeak(&location);
  return v21;
}

- (id)featurePlatterView:(id)a3 backgrounColor:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v5 = a4;
  v6 = a3;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", UIFontTextStyleBody, 1));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v6, v19));

  v7 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v18);
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v7, "setTintColor:", v8);

  objc_msgSend(v7, "setContentMode:", 4);
  objc_msgSend(v7, "setMaximumContentSizeCategory:", UIContentSizeCategoryLarge);
  v9 = objc_alloc_init((Class)UIView);
  objc_msgSend(v9, "_setLayoutDebuggingIdentifier:", CFSTR("PRXFeaturePlatter"));
  objc_msgSend(v9, "setBackgroundColor:", v5);

  objc_msgSend(v9, "_setContinuousCornerRadius:", 14.0);
  objc_msgSend(v9, "addSubview:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centerXAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "centerXAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  v20[0] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centerYAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "centerYAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
  v20[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

  return v9;
}

- (BOOL)isRestrictedSKU
{
  void *v2;
  unsigned __int8 v3;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  if (objc_msgSend(v2, "isInternalBuild"))
  {
    v3 = +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("simulateRestrictedRegionPresence"), CFSTR("com.apple.icloud.findmydeviced.notbackedup"));

    if ((v3 & 1) != 0)
      return 1;
  }
  else
  {

  }
  v5 = (void *)qword_100042CA0;
  if (!qword_100042CA0)
  {
    v6 = MGCopyAnswer(CFSTR("h63QSdBCiT/z0WU6rdQv6Q"), 0);
    v7 = (void *)qword_100042CA0;
    qword_100042CA0 = v6;

    v5 = (void *)qword_100042CA0;
  }
  return objc_msgSend(v5, "isEqualToString:", CFSTR("KH"));
}

- (id)proxCardSetupComplete
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  FMDRemoteAsset *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  FMDRemoteAsset *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  unsigned int v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[5];
  id v58;
  id location;
  void *v60;
  uint8_t buf[4];
  unsigned int v62;

  v3 = objc_alloc_init((Class)PRXFeatureListViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController magSafeAccessory](self, "magSafeAccessory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  objc_msgSend(v3, "setTitle:", v5);

  objc_msgSend(v3, "setDismissalType:", 3);
  objc_initWeak(&location, self);
  v6 = -[FMDMagSafeSetupRemoteUIViewController isRestrictedSKU](self, "isRestrictedSKU");
  v7 = sub_100005190();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v62 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "isRestrictedSKU %d", buf, 8u);
  }

  if (v6)
  {
    v9 = [FMDRemoteAsset alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController physicalAccessory](self, "physicalAccessory"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accessoryType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController physicalAccessory](self, "physicalAccessory"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "style"));
    v14 = -[FMDRemoteAsset initWithAccessoryType:style:type:](v9, "initWithAccessoryType:style:type:", v11, v13, 3);

    v15 = objc_claimAutoreleasedReturnValue(-[FMDRemoteAsset getStoredAssetLocation](v14, "getStoredAssetLocation"));
    if (!v15
      || (v16 = v15,
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v15)),
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:scale:](UIImage, "imageWithData:scale:", v17, 3.0)),
          v17,
          v15 = v16,
          !v53))
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("wallet1-pairing-non-owner")));
    }
    v52 = (void *)v15;
    v18 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v53);
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentView"));
    objc_msgSend(v19, "addSubview:", v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tableView"));
    objc_msgSend(v20, "setTableHeaderView:", v18);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "centerXAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tableView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "centerXAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));
    v60 = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v60, 1));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);

  }
  else
  {
    -[FMDMagSafeSetupRemoteUIViewController addDynamicMapToCard:](self, "addDynamicMapToCard:", v3);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController featurePlatterView:backgrounColor:](self, "featurePlatterView:backgrounColor:", CFSTR("location.fill"), v26));

    v27 = objc_alloc((Class)PRXFeature);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_LOCATION_FEATURE_TITLE"), &stru_100036128, 0));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_LOCATION_FEATURE_MESSAGE"), &stru_100036128, 0));
    v14 = (FMDRemoteAsset *)objc_msgSend(v27, "initWithTitle:detailText:imageView:valueChangedBlock:", v29, v31, v53, 0);

    -[FMDRemoteAsset setImageViewSize:](v14, "setImageViewSize:", 28.0);
    v32 = objc_msgSend(v3, "addFeature:", v14);
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemPinkColor](UIColor, "systemPinkColor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController featurePlatterView:backgrounColor:](self, "featurePlatterView:backgrounColor:", CFSTR("bell.fill"), v33));

  v34 = objc_alloc((Class)PRXFeature);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_NOTIFY_WHEN_DETACHED_FEATURE_TITLE"), &stru_100036128, 0));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_NOTIFY_WHEN_DETACHED_FEATURE_MESSAGE"), &stru_100036128, 0));
  v39 = objc_msgSend(v34, "initWithTitle:detailText:imageView:valueChangedBlock:", v36, v38, v54, 0);

  objc_msgSend(v39, "setImageViewSize:", 28.0);
  v40 = objc_msgSend(v3, "addFeature:", v39);
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tableView"));
  objc_msgSend(v41, "setSeparatorStyle:", 0);

  if (-[FMDMagSafeSetupRemoteUIViewController isFindMyAppInstalled](self, "isFindMyAppInstalled"))
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_VIEW_IN_FINDMY"), &stru_100036128, 0));
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_10000D1A8;
    v57[3] = &unk_100034998;
    objc_copyWeak(&v58, &location);
    v57[4] = self;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v43, 0, v57));

    v45 = objc_msgSend(v3, "addAction:", v44);
    objc_destroyWeak(&v58);
  }
  v46 = -[FMDMagSafeSetupRemoteUIViewController isFindMyAppInstalled](self, "isFindMyAppInstalled");
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_DONE_ACTION"), &stru_100036128, 0));
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_10000D2E8;
  v55[3] = &unk_1000348D8;
  objc_copyWeak(&v56, &location);
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v48, v46, v55));
  v50 = objc_msgSend(v3, "addAction:", v49);

  objc_destroyWeak(&v56);
  objc_destroyWeak(&location);
  return v3;
}

- (id)proxCardNonOwnerUnlocked
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  BOOL v32;
  id location;

  v3 = objc_alloc_init((Class)PRXCardContentViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_NON_OWNER_TITLE"), &stru_100036128, 0));
  objc_msgSend(v3, "setTitle:", v5);

  objc_msgSend(v3, "setDismissalType:", 3);
  objc_initWeak(&location, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController physicalAccessory](self, "physicalAccessory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "phoneNumber"));
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController physicalAccessory](self, "physicalAccessory"));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "email"));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController physicalAccessory](self, "physicalAccessory"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "phoneNumber"));
  v13 = v12 == 0;

  if (v9)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_ALERT_REGISTERED_TO"), &stru_100036128, 0));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v9));
    objc_msgSend(v3, "setSubtitle:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_CONTACT_OWNER"), &stru_100036128, 0));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10000D694;
    v29[3] = &unk_100034A38;
    objc_copyWeak(&v31, &location);
    v32 = v13;
    v30 = v9;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v18, 0, v29));
    v20 = objc_msgSend(v3, "addAction:", v19);

    objc_destroyWeak(&v31);
    v21 = 1;
  }
  else
  {
    v21 = 0;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_LEARN_MORE"), &stru_100036128, 0));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10000D864;
  v27[3] = &unk_1000348D8;
  objc_copyWeak(&v28, &location);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v23, v21, v27));
  v25 = objc_msgSend(v3, "addAction:", v24);

  -[FMDMagSafeSetupRemoteUIViewController addImagetoCard:](self, "addImagetoCard:", v3);
  objc_destroyWeak(&v28);

  objc_destroyWeak(&location);
  return v3;
}

- (id)proxCardSetupError
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;
  void *v22;

  v3 = objc_alloc_init((Class)PRXIconContentViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_SETUP_ERROR_TITLE"), &stru_100036128, 0));
  objc_msgSend(v3, "setTitle:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_SETUP_ERROR_MESSAGE"), &stru_100036128, 0));
  objc_msgSend(v3, "setSubtitle:", v7);

  objc_msgSend(v3, "setDismissalType:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", UIFontTextStyleLargeTitle, 3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.circle.fill"), v8));
  v22 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
  objc_msgSend(v3, "setImages:", v10);

  objc_initWeak(&location, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_DISMISS"), &stru_100036128, 0));
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_10000DB70;
  v19 = &unk_1000348D8;
  objc_copyWeak(&v20, &location);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v12, 0, &v16));
  v14 = objc_msgSend(v3, "addAction:", v13, v16, v17, v18, v19);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v3;
}

- (id)proxCardNotImplemeted
{
  id v3;
  void *v4;
  id v5;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  v3 = objc_alloc_init((Class)PRXCardContentViewController);
  objc_msgSend(v3, "setTitle:", CFSTR("Not Implemented"));
  objc_msgSend(v3, "setDismissalType:", 3);
  objc_initWeak(&location, self);
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_10000DCC0;
  v10 = &unk_1000348D8;
  objc_copyWeak(&v11, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", CFSTR("dismiss"), 0, &v7));
  v5 = objc_msgSend(v3, "addAction:", v4, v7, v8, v9, v10);

  -[FMDMagSafeSetupRemoteUIViewController addImagetoCard:](self, "addImagetoCard:", v3);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v3;
}

- (id)proxCardLockedFindMyNotPaired
{
  FMDRemoteAsset *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  FMDRemoteAsset *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  int v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  FMDMovieProxCardViewController *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  FMDRemoteAsset *v33;
  FMDRemoteAsset *v34;
  _QWORD v35[5];
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;

  v3 = [FMDRemoteAsset alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController physicalAccessory](self, "physicalAccessory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessoryType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController physicalAccessory](self, "physicalAccessory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "style"));
  v34 = -[FMDRemoteAsset initWithAccessoryType:style:type:](v3, "initWithAccessoryType:style:type:", v5, v7, 0);

  v8 = [FMDRemoteAsset alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController physicalAccessory](self, "physicalAccessory"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accessoryType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController physicalAccessory](self, "physicalAccessory"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "style"));
  v33 = -[FMDRemoteAsset initWithAccessoryType:style:type:](v8, "initWithAccessoryType:style:type:", v10, v12, 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRemoteAsset getStoredAssetLocation](v34, "getStoredAssetLocation"));
  v14 = objc_claimAutoreleasedReturnValue(-[FMDRemoteAsset getStoredAssetLocation](v33, "getStoredAssetLocation"));
  v15 = (void *)v14;
  if (v13)
    v16 = v14 == 0;
  else
    v16 = 1;
  v17 = !v16;
  v18 = sub_1000114EC();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v20)
    {
      *(_DWORD *)buf = 138412546;
      v38 = v13;
      v39 = 2112;
      v40 = v15;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "using video = %@ and adjustmensts = %@", buf, 0x16u);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v13));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v15));
  }
  else
  {
    if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "using default video", buf, 2u);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "URLForResource:withExtension:", CFSTR("wallet1-pairing-video.mov"), 0));

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "URLForResource:withExtension:", CFSTR("wallet1-pairing-video-adjustments.plist"), 0));

  }
  v25 = -[FMDMovieProxCardViewController initWithMovieURL:adjustmentsURL:movieDimensions:productHeight:]([FMDMovieProxCardViewController alloc], "initWithMovieURL:adjustmentsURL:movieDimensions:productHeight:", v21, v22, 176.0, 304.0, 176.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_ACCESSORY_TITLE"), &stru_100036128, 0));
  -[FMDMovieProxCardViewController setTitle:](v25, "setTitle:", v27);

  -[FMDMovieProxCardViewController setDismissalType:](v25, "setDismissalType:", 3);
  objc_initWeak((id *)buf, self);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_UNLOCK_ACTION"), &stru_100036128, 0));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10000E174;
  v35[3] = &unk_100034998;
  objc_copyWeak(&v36, (id *)buf);
  v35[4] = self;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v29, 0, v35));
  v31 = -[FMDMovieProxCardViewController addAction:](v25, "addAction:", v30);

  objc_destroyWeak(&v36);
  objc_destroyWeak((id *)buf);

  return v25;
}

- (id)proxCardNonOwnerLockedDevice
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id location;

  v3 = objc_alloc_init((Class)PRXCardContentViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_NON_OWNER_TITLE"), &stru_100036128, 0));
  objc_msgSend(v3, "setTitle:", v5);

  objc_msgSend(v3, "setDismissalType:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController physicalAccessory](self, "physicalAccessory"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "phoneNumber"));
  if (v7)
  {
    v8 = (void *)v7;

LABEL_4:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_ALERT_REGISTERED_TO"), &stru_100036128, 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v8));
    objc_msgSend(v3, "setSubtitle:", v12);

    goto LABEL_5;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController physicalAccessory](self, "physicalAccessory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "email"));

  if (v8)
    goto LABEL_4;
LABEL_5:
  objc_initWeak(&location, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_NON_OWNER_LOCK_ACTION"), &stru_100036128, 0));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000E634;
  v18[3] = &unk_100034AB0;
  v18[4] = self;
  objc_copyWeak(&v19, &location);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v14, 0, v18));
  v16 = objc_msgSend(v3, "addAction:", v15);

  -[FMDMagSafeSetupRemoteUIViewController addImagetoCard:](self, "addImagetoCard:", v3);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v3;
}

- (id)proxCardSpinner
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];

  v2 = objc_alloc_init((Class)PRXCardContentViewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_WAIT_TITLE"), &stru_100036128, 0));
  objc_msgSend(v2, "setTitle:", v4);

  objc_msgSend(v2, "setDismissalType:", 3);
  v5 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 101);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "startAnimating");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contentView"));
  objc_msgSend(v6, "addSubview:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contentView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mainContentGuide"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintGreaterThanOrEqualToAnchor:", v23));
  v25[0] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintLessThanOrEqualToAnchor:", v20));
  v25[1] = v19;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerYAnchor"));
  v18 = v2;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "centerYAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, 0.0));
  v25[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerXAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "centerXAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
  v25[3] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

  return v18;
}

- (id)proxCardNoAccount
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;
  void *v22;

  v3 = objc_alloc_init((Class)PRXIconContentViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_NO_ACCOUNT_ERROR_TITLE"), &stru_100036128, 0));
  objc_msgSend(v3, "setTitle:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_NO_ACCOUNT_ERROR_MESSAGE"), &stru_100036128, 0));
  objc_msgSend(v3, "setSubtitle:", v7);

  objc_msgSend(v3, "setDismissalType:", 1);
  -[FMDMagSafeSetupRemoteUIViewController addDismissButtonAction:](self, "addDismissButtonAction:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", UIFontTextStyleLargeTitle, 3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.circle.fill"), v8));
  v22 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
  objc_msgSend(v3, "setImages:", v10);

  objc_initWeak(&location, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_APPLE_ID_SETTINGS"), &stru_100036128, 0));
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_10000EDEC;
  v19 = &unk_1000348D8;
  objc_copyWeak(&v20, &location);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v12, 0, &v16));
  v14 = objc_msgSend(v3, "addAction:", v13, v16, v17, v18, v19);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v3;
}

- (id)proxCardUpgradeAccountSecurity
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;
  void *v21;

  v3 = objc_alloc_init((Class)PRXIconContentViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_UPGRADE_ACCOUNT_ERROR_TITLE"), &stru_100036128, 0));
  objc_msgSend(v3, "setTitle:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_UPGRADE_ACCOUNT_ERROR_MESSAGE"), &stru_100036128, 0));
  objc_msgSend(v3, "setSubtitle:", v7);

  objc_msgSend(v3, "setDismissalType:", 1);
  -[FMDMagSafeSetupRemoteUIViewController addDismissButtonAction:](self, "addDismissButtonAction:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", UIFontTextStyleLargeTitle, 3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("lock.shield.fill"), v8));
  v21 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  objc_msgSend(v3, "setImages:", v10);

  objc_initWeak(&location, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_APPLE_ID_SETTINGS"), &stru_100036128, 0));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000F23C;
  v17[3] = &unk_100034998;
  objc_copyWeak(&v19, &location);
  v13 = v3;
  v18 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v12, 0, v17));
  v15 = objc_msgSend(v13, "addAction:", v14);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v13;
}

- (id)proxCardUpgradeAccountSecurityError
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;
  void *v20;

  v3 = objc_alloc_init((Class)PRXIconContentViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_ACCOUNT_SETUP_ERROR_TITLE"), &stru_100036128, 0));
  objc_msgSend(v3, "setTitle:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_UPSELL_PROX_CARD_ACCOUNT_SETUP_ERROR_MESSAGE"), &stru_100036128, 0));
  objc_msgSend(v3, "setSubtitle:", v7);

  objc_msgSend(v3, "setDismissalType:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", UIFontTextStyleLargeTitle, 3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.circle.fill"), v8));
  v20 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  objc_msgSend(v3, "setImages:", v10);

  objc_initWeak(&location, self);
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_10000F4C0;
  v17 = &unk_1000348D8;
  objc_copyWeak(&v18, &location);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", CFSTR("Dismiss"), 0, &v14));
  v12 = objc_msgSend(v3, "addAction:", v11, v14, v15, v16, v17);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v3;
}

- (void)addImagetoCard:(id)a3
{
  id v4;
  FMDRemoteAsset *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  FMDRemoteAsset *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  FMDRemoteAsset *v33;
  _QWORD v34[4];

  v4 = a3;
  v5 = [FMDRemoteAsset alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController physicalAccessory](self, "physicalAccessory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessoryType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController physicalAccessory](self, "physicalAccessory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "style"));
  v10 = -[FMDRemoteAsset initWithAccessoryType:style:type:](v5, "initWithAccessoryType:style:type:", v7, v9, 3);

  v33 = v10;
  v11 = objc_claimAutoreleasedReturnValue(-[FMDRemoteAsset getStoredAssetLocation](v10, "getStoredAssetLocation"));
  if (!v11
    || (v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v11)),
        v13 = objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:scale:](UIImage, "imageWithData:scale:", v12, 3.0)),
        v12,
        !v13))
  {
    v13 = objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("wallet1-pairing-non-owner")));
  }
  v32 = (void *)v13;
  v14 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v13);
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
  objc_msgSend(v15, "addSubview:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mainContentGuide"));

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintGreaterThanOrEqualToAnchor:", v30));
  v34[0] = v29;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintLessThanOrEqualToAnchor:", v26));
  v34[1] = v18;
  v28 = (void *)v11;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerYAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "centerYAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
  v34[2] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerXAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "centerXAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
  v34[3] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);

}

- (void)addDynamicMapToCard:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  FMDRemoteAsset *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  FMDRemoteAsset *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  double MidX;
  void *v27;
  uint8_t v28[16];
  CGRect v29;
  CGRect v30;

  v4 = a3;
  v5 = sub_100005190();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "adding dynamic map", v28, 2u);
  }

  v7 = objc_msgSend(objc_alloc((Class)MKMapView), "initWithFrame:", 0.0, 0.0, 300.0, 200.0);
  v8 = [FMDRemoteAsset alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController physicalAccessory](self, "physicalAccessory"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accessoryType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController physicalAccessory](self, "physicalAccessory"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "style"));
  v13 = -[FMDRemoteAsset initWithAccessoryType:style:type:](v8, "initWithAccessoryType:style:type:", v10, v12, 2);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRemoteAsset getStoredAssetLocation](v13, "getStoredAssetLocation"));
  -[FMDMagSafeSetupRemoteUIViewController setMapDeviceImagePath:](self, "setMapDeviceImagePath:", v14);

  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "setMapType:", 0);
  objc_msgSend(v7, "setUserInteractionEnabled:", 0);
  objc_msgSend(v7, "setShowsUserLocation:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layer"));
  objc_msgSend(v15, "setCornerCurve:", kCACornerCurveContinuous);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layer"));
  objc_msgSend(v16, "setCornerRadius:", 16.0);

  -[FMDMagSafeSetupRemoteUIViewController setMapView:](self, "setMapView:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/FindMyDevice.framework")));
  v18 = objc_msgSend(objc_alloc((Class)CLLocationManager), "initWithEffectiveBundle:", v17);
  -[FMDMagSafeSetupRemoteUIViewController setLocationManager:](self, "setLocationManager:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController locationManager](self, "locationManager"));
  objc_msgSend(v19, "setDelegate:", self);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController locationManager](self, "locationManager"));
  objc_msgSend(v20, "setDesiredAccuracy:", kCLLocationAccuracyBest);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController locationManager](self, "locationManager"));
  objc_msgSend(v21, "setDistanceFilter:", 10.0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController locationManager](self, "locationManager"));
  objc_msgSend(v22, "startUpdatingLocation");

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
  objc_msgSend(v23, "addSubview:", v7);

  v24 = objc_alloc((Class)UIView);
  v25 = objc_msgSend(v24, "initWithFrame:", 0.0, 0.0, 300.0, PRXMainContentMargin + 200.0);
  objc_msgSend(v7, "setAutoresizingMask:", 5);
  objc_msgSend(v25, "bounds");
  MidX = CGRectGetMidX(v29);
  objc_msgSend(v7, "bounds");
  objc_msgSend(v7, "setCenter:", MidX, CGRectGetMidY(v30));
  objc_msgSend(v25, "addSubview:", v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tableView"));

  objc_msgSend(v27, "setTableHeaderView:", v25);
}

- (void)addDismissButtonAction:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, v4);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000FCCC;
  v6[3] = &unk_100034998;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", &stru_100036128, 0, v6));
  objc_msgSend(v4, "setDismissButtonAction:", v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (BOOL)isLocked
{
  int v2;
  id v3;
  NSObject *v4;

  v2 = MKBGetDeviceLockState(0);
  v3 = sub_1000114EC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10001F584(v2, v4);

  return v2 == 1 || v2 == 4;
}

- (void)postNotification:(id)a3
{
  __CFString *v3;
  id v4;
  NSObject *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v7;
  __CFString *v8;

  v3 = (__CFString *)a3;
  v4 = sub_1000114EC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setupModules posting notification %@", (uint8_t *)&v7, 0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v3, 0, 0, 1u);

}

- (BOOL)isFMFAllowed
{
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  int v8;

  if ((byte_100042CA8 & 1) == 0)
  {
    v8 = 0;
    v2 = (const __CFBoolean *)MGCopyAnswerWithError(CFSTR("FMFAllowed"), 0, &v8);
    v3 = v2;
    if (v8)
      v4 = 1;
    else
      v4 = v2 == 0;
    if (!v4)
    {
      byte_100042788 = CFBooleanGetValue(v2) != 0;
      byte_100042CA8 = 1;
LABEL_10:
      CFRelease(v3);
      return byte_100042788;
    }
    v5 = sub_1000114EC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10001F5F4(&v8, v6);

    if (v3)
      goto LABEL_10;
  }
  return byte_100042788;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;

  v5 = a4;
  v6 = sub_100005190();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    objc_msgSend(v8, "coordinate");
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    objc_msgSend(v11, "coordinate");
    v32 = 134283777;
    v33 = v10;
    v34 = 2049;
    v35 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#Map locationManager new didUpdateUserLocation %{private}f %{private}f", (uint8_t *)&v32, 0x16u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  objc_msgSend(v13, "coordinate");
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  objc_msgSend(v16, "coordinate");
  v18 = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController mapView](self, "mapView"));
  objc_msgSend(v19, "setRegion:animated:", 0, v15, v18, 0.001, 0.001);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController userLocationAnnotation](self, "userLocationAnnotation"));
  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController userLocationAnnotation](self, "userLocationAnnotation"));
    objc_msgSend(v21, "setCoordinate:", v15, v18);
  }
  else
  {
    v22 = objc_msgSend(objc_alloc((Class)MKPointAnnotation), "initWithCoordinate:title:subtitle:", 0, 0, v15, v18);
    -[FMDMagSafeSetupRemoteUIViewController setUserLocationAnnotation:](self, "setUserLocationAnnotation:", v22);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController mapView](self, "mapView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController userLocationAnnotation](self, "userLocationAnnotation"));
    objc_msgSend(v21, "addAnnotation:", v23);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController deviceAnnotation](self, "deviceAnnotation"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController mapView](self, "mapView"));
  v26 = v25;
  if (v24)
  {
    objc_msgSend(v25, "setRegion:animated:", 1, v15, v18, 0.001, 0.001);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController deviceAnnotation](self, "deviceAnnotation"));
    objc_msgSend(v27, "setCoordinate:", v15, v18);
  }
  else
  {
    objc_msgSend(v25, "setRegion:animated:", 0, v15, v18, 0.001, 0.001);

    v28 = objc_msgSend(objc_alloc((Class)MKPointAnnotation), "initWithCoordinate:title:subtitle:", 0, 0, v15, v18);
    -[FMDMagSafeSetupRemoteUIViewController setDeviceAnnotation:](self, "setDeviceAnnotation:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController mapView](self, "mapView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController deviceAnnotation](self, "deviceAnnotation"));
    objc_msgSend(v29, "addAnnotation:", v30);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController mapView](self, "mapView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController deviceAnnotation](self, "deviceAnnotation"));
    objc_msgSend(v27, "selectAnnotation:animated:", v31, 1);

  }
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  FMDeviceAnnotationView *v10;
  id v11;
  NSObject *v12;
  FMDeviceAnnotationView *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  int v27;
  id v28;

  v5 = a4;
  v6 = sub_100005190();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 138412290;
    v28 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#Map viewForAnnotation %@", (uint8_t *)&v27, 0xCu);
  }

  v8 = (id)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController deviceAnnotation](self, "deviceAnnotation"));
  if (v8 == v5)
  {
    v11 = sub_100005190();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 138412290;
      v28 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#Map creating deviceAnnotation view %@", (uint8_t *)&v27, 0xCu);
    }

    v13 = [FMDeviceAnnotationView alloc];
    v14 = (objc_class *)objc_opt_class(MKPointAnnotation);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v10 = -[FMDeviceAnnotationView initWithAnnotation:reuseIdentifier:](v13, "initWithAnnotation:reuseIdentifier:", v5, v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController mapDeviceImagePath](self, "mapDeviceImagePath"));
    if (!v17
      || (v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController mapDeviceImagePath](self, "mapDeviceImagePath")),
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithContentsOfFile:](UIImage, "imageWithContentsOfFile:", v18)),
          v18,
          !v19))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("wallet1-pairing-map")));
    }
    -[FMDeviceAnnotationView setDeviceImage:](v10, "setDeviceImage:", v19);

  }
  else
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController userLocationAnnotation](self, "userLocationAnnotation"));

    if (v9 == v5)
    {
      v20 = sub_100005190();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v27 = 138412290;
        v28 = v5;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#Map creating userLocationAnnotation view %@", (uint8_t *)&v27, 0xCu);
      }

      v22 = objc_alloc((Class)MKUserLocationView);
      v23 = (objc_class *)objc_opt_class(MKPointAnnotation);
      v24 = NSStringFromClass(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v10 = (FMDeviceAnnotationView *)objc_msgSend(v22, "initWithAnnotation:reuseIdentifier:", v5, v25);

      -[FMDeviceAnnotationView setCanShowCallout:](v10, "setCanShowCallout:", 0);
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (BOOL)isFindMyAppInstalled
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  _DWORD v11[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v4 = objc_msgSend(v3, "applicationIsInstalled:", CFSTR("com.apple.findmy"));

  v5 = sub_100005190();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#Find My installed? %i", (uint8_t *)v11, 8u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController appInstallCoordinator](self, "appInstallCoordinator"));
  if (v7)
    v8 = 0;
  else
    v8 = v4;
  if (v7 && ((v4 ^ 1) & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupRemoteUIViewController appInstallCoordinator](self, "appInstallCoordinator"));
    v8 = objc_msgSend(v9, "isComplete");

  }
  return v8;
}

- (void)triggerFindMyAppInstallation
{
  id v3;
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id buf[2];

  v3 = objc_msgSend(objc_alloc((Class)ASDSystemAppMetadata), "initWithBundleID:", CFSTR("com.apple.findmy"));
  objc_msgSend(v3, "setUserInitiated:", 1);
  v4 = sub_100005190();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#Starting installation of Find My", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000109FC;
  v6[3] = &unk_100034B20;
  objc_copyWeak(&v7, buf);
  +[ASDInstallApps installApp:withCompletionHandler:](ASDInstallApps, "installApp:withCompletionHandler:", v3, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);

}

- (unint64_t)accountState
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  unint64_t v10;
  id v11;
  id v12;
  int v14;
  NSObject *v15;

  v2 = objc_alloc_init((Class)ACAccountStore);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "aa_primaryAppleAccount"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accountPropertyForKey:", CFSTR("altDSID")));
    if (v5)
    {
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "authKitAccountWithAltDSID:", v5));
      if (v6)
      {
        v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "additionalInfoForAccount:", v6));
        v8 = sub_100005190();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v14 = 138412290;
          v15 = v7;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "got additional Info = %@", (uint8_t *)&v14, 0xCu);
        }

        if (objc_msgSend(v4, "securityLevelForAccount:", v6) == (id)4)
          v10 = 2;
        else
          v10 = 1;
      }
      else
      {
        v12 = sub_100005190();
        v7 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          sub_10001F7A8();
        v10 = 3;
      }

    }
    else
    {
      v11 = sub_100005190();
      v6 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_10001F77C();
      v10 = 3;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)upgradeAccountButtonPressedOn:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_ACCPUNT_UPGRADE_SETUP_LATER_ALERT_TITLE"), &stru_100036128, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_ACCPUNT_UPGRADE_SETUP_LATER_ALERT_MESSAGE"), &stru_100036128, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("MAGSAFE_PAIRING_ACCPUNT_UPGRADE_SETUP_LATER_ALERT_ACTION"), &stru_100036128, 0));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100010E88;
  v13[3] = &unk_100034B48;
  v13[4] = self;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 0, v13));

  objc_msgSend(v9, "addAction:", v12);
  objc_msgSend(v4, "presentViewController:animated:completion:", v9, 1, 0);

}

- (void)launchSettingsAppUpgradeFlow
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&aaaction=upgradeSecurityLevel")));
  v5 = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v6 = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, v4);

}

- (SFClient)sharingClient
{
  return self->_sharingClient;
}

- (void)setSharingClient:(id)a3
{
  objc_storeStrong((id *)&self->_sharingClient, a3);
}

- (SBUIRemoteAlertHostInterface)remoteVCProxy
{
  return self->_remoteVCProxy;
}

- (void)setRemoteVCProxy:(id)a3
{
  objc_storeStrong((id *)&self->_remoteVCProxy, a3);
}

- (FMDMagSafeProtocol)physicalAccessory
{
  return self->_physicalAccessory;
}

- (void)setPhysicalAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_physicalAccessory, a3);
}

- (FMDMagSafeAccessory)magSafeAccessory
{
  return self->_magSafeAccessory;
}

- (void)setMagSafeAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_magSafeAccessory, a3);
}

- (PRXCardContentViewController)presentedCard
{
  return self->_presentedCard;
}

- (void)setPresentedCard:(id)a3
{
  objc_storeStrong((id *)&self->_presentedCard, a3);
}

- (FMDCoreAccessoryManager)caAccessoryManager
{
  return self->_caAccessoryManager;
}

- (void)setCaAccessoryManager:(id)a3
{
  objc_storeStrong((id *)&self->_caAccessoryManager, a3);
}

- (NSString)presentingAccessorySerialNumber
{
  return self->_presentingAccessorySerialNumber;
}

- (void)setPresentingAccessorySerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_presentingAccessorySerialNumber, a3);
}

- (FMDispatchTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (FMDispatchTimer)showAttachScreenTimer
{
  return self->_showAttachScreenTimer;
}

- (void)setShowAttachScreenTimer:(id)a3
{
  objc_storeStrong((id *)&self->_showAttachScreenTimer, a3);
}

- (IXAppInstallCoordinator)appInstallCoordinator
{
  return self->_appInstallCoordinator;
}

- (void)setAppInstallCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_appInstallCoordinator, a3);
}

- (int)deviceLockState
{
  return self->_deviceLockState;
}

- (void)setDeviceLockState:(int)a3
{
  self->_deviceLockState = a3;
}

- (int)lockStateNotifyToken
{
  return self->_lockStateNotifyToken;
}

- (void)setLockStateNotifyToken:(int)a3
{
  self->_lockStateNotifyToken = a3;
}

- (unint64_t)magSafeState
{
  return self->_magSafeState;
}

- (void)setMagSafeState:(unint64_t)a3
{
  self->_magSafeState = a3;
}

- (unint64_t)proxCardState
{
  return self->_proxCardState;
}

- (void)setProxCardState:(unint64_t)a3
{
  self->_proxCardState = a3;
}

- (unint64_t)prevProxCardState
{
  return self->_prevProxCardState;
}

- (void)setPrevProxCardState:(unint64_t)a3
{
  self->_prevProxCardState = a3;
}

- (NSDictionary)launchContext
{
  return self->_launchContext;
}

- (void)setLaunchContext:(id)a3
{
  objc_storeStrong((id *)&self->_launchContext, a3);
}

- (BOOL)launchedFromFindMyApp
{
  return self->_launchedFromFindMyApp;
}

- (void)setLaunchedFromFindMyApp:(BOOL)a3
{
  self->_launchedFromFindMyApp = a3;
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
  objc_storeStrong((id *)&self->_mapView, a3);
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (MKPointAnnotation)deviceAnnotation
{
  return self->_deviceAnnotation;
}

- (void)setDeviceAnnotation:(id)a3
{
  objc_storeStrong((id *)&self->_deviceAnnotation, a3);
}

- (MKPointAnnotation)userLocationAnnotation
{
  return self->_userLocationAnnotation;
}

- (void)setUserLocationAnnotation:(id)a3
{
  objc_storeStrong((id *)&self->_userLocationAnnotation, a3);
}

- (NSString)mapDeviceImagePath
{
  return self->_mapDeviceImagePath;
}

- (void)setMapDeviceImagePath:(id)a3
{
  objc_storeStrong((id *)&self->_mapDeviceImagePath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapDeviceImagePath, 0);
  objc_storeStrong((id *)&self->_userLocationAnnotation, 0);
  objc_storeStrong((id *)&self->_deviceAnnotation, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_launchContext, 0);
  objc_storeStrong((id *)&self->_appInstallCoordinator, 0);
  objc_storeStrong((id *)&self->_showAttachScreenTimer, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_presentingAccessorySerialNumber, 0);
  objc_storeStrong((id *)&self->_caAccessoryManager, 0);
  objc_storeStrong((id *)&self->_presentedCard, 0);
  objc_storeStrong((id *)&self->_magSafeAccessory, 0);
  objc_storeStrong((id *)&self->_physicalAccessory, 0);
  objc_storeStrong((id *)&self->_remoteVCProxy, 0);
  objc_storeStrong((id *)&self->_sharingClient, 0);
}

@end

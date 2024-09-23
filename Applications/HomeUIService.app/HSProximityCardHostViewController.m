@implementation HSProximityCardHostViewController

- (BOOL)isLaunchedToSetupASpecificAccessory
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController setupAccessoryDescription](self, "setupAccessoryDescription"));
  v3 = objc_msgSend(v2, "hf_isKeyedToASpecificAccessory");

  return v3;
}

- (HSProximityCardHostViewController)init
{
  HSProximityCardHostViewController *v2;
  SFClient *v3;
  SFClient *sharingFrameworkClient;
  SFClient *v5;
  _QWORD v7[4];
  HSProximityCardHostViewController *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HSProximityCardHostViewController;
  v2 = -[HSProximityCardHostViewController init](&v9, "init");
  if (v2)
  {
    v3 = (SFClient *)objc_alloc_init((Class)SFClient);
    sharingFrameworkClient = v2->_sharingFrameworkClient;
    v2->_sharingFrameworkClient = v3;

    v5 = v2->_sharingFrameworkClient;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100047100;
    v7[3] = &unk_1000A2E28;
    v8 = v2;
    -[SFClient startProxCardTransactionWithOptions:completion:](v5, "startProxCardTransactionWithOptions:completion:", 0, v7);

  }
  return v2;
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)_refreshHomeGraphWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  HSProximityCardHostViewController *v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "homeManager"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100047264;
  v12[3] = &unk_1000A2FE0;
  v13 = v6;
  v14 = self;
  v15 = v4;
  v9 = v4;
  v10 = v6;
  v11 = objc_msgSend(v8, "_refreshBeforeDate:completionHandler:", v5, v12);

}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
    (*((void (**)(id))v7 + 2))(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v9, "setAllowsAlertStacking:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  -[HSProximityCardHostViewController setLaunchReason:](self, "setLaunchReason:", +[HUHomeUIServiceLaunchUserInfo launchReasonFromUserInfo:](HUHomeUIServiceLaunchUserInfo, "launchReasonFromUserInfo:", v10));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[HSAccessoryPairingEventLogger sharedLogger](HSAccessoryPairingEventLogger, "sharedLogger"));
  objc_msgSend(v11, "logHUISLaunchWithReason:accessoryDescription:", -[HSProximityCardHostViewController launchReason](self, "launchReason"), 0);

  v12 = HFLogForCategory(58);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[HSProximityCardHostViewController configureWithContext:completion:]";
    v25 = 2112;
    v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s userInfo %@", buf, 0x16u);
  }

  if (!-[HSProximityCardHostViewController launchReason](self, "launchReason"))
  {
    v14 = objc_msgSend(objc_alloc((Class)HMSetupAccessoryDescription), "initWithDictionaryRepresentation:", v10);
    if (!v14)
    {
      v17 = HFLogForCategory(58);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_1000607C0();

      v19 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, CFSTR("Failed to initialize setup accessory description from SBSRemoteAlertConfigurationContext user info"), 0));
      objc_exception_throw(v19);
    }
    v16 = objc_msgSend(objc_alloc((Class)MTSDeviceSetupRequest), "initWithDictionaryRepresentation:", v10);
    -[HSProximityCardHostViewController onSetupAccessoryDescription:matterDeviceSetupRequest:](self, "onSetupAccessoryDescription:matterDeviceSetupRequest:", v14, v16);

    goto LABEL_15;
  }
  if ((id)-[HSProximityCardHostViewController launchReason](self, "launchReason") == (id)1
    || (id)-[HSProximityCardHostViewController launchReason](self, "launchReason") == (id)2
    || (id)-[HSProximityCardHostViewController launchReason](self, "launchReason") == (id)3
    || (id)-[HSProximityCardHostViewController launchReason](self, "launchReason") == (id)4
    || (id)-[HSProximityCardHostViewController launchReason](self, "launchReason") == (id)5
    || (id)-[HSProximityCardHostViewController launchReason](self, "launchReason") == (id)6)
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", HUHomeUIServiceLaunchHomeUUIDString));
    v15 = objc_msgSend(v14, "copy");
    -[HSProximityCardHostViewController setResumeSetupHomeUUIDString:](self, "setResumeSetupHomeUUIDString:", v15);

    objc_initWeak((id *)buf, self);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100047958;
    v20[3] = &unk_1000A3078;
    objc_copyWeak(&v22, (id *)buf);
    v21 = v10;
    -[HSProximityCardHostViewController _refreshHomeGraphWithCompletion:](self, "_refreshHomeGraphWithCompletion:", v20);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
LABEL_15:

  }
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v2, "userInterfaceIdiom") == (id)1)
    v3 = 30;
  else
    v3 = 2;

  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;

  v9.receiver = self;
  v9.super_class = (Class)HSProximityCardHostViewController;
  -[HSProximityCardHostViewController viewDidLoad](&v9, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor hf_keyColor](UIColor, "hf_keyColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyWindow"));
  objc_msgSend(v5, "setTintColor:", v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[HSProximityCardHostViewController setConfigurators:](self, "setConfigurators:", v6);

  v7 = HFLogForCategory(58);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[HSProximityCardHostViewController viewDidLoad]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HSProximityCardHostViewController;
  -[HSProximityCardHostViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  if (-[HSProximityCardHostViewController _didPRXActuallyDismiss](self, "_didPRXActuallyDismiss"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController coordinator](self, "coordinator"));
    objc_msgSend(v4, "dismissProxCardFlowAfterExecuting:", 0);

  }
}

- (void)proxCardFlowWillPresent
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;

  v3 = HFLogForCategory(58);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[HSProximityCardHostViewController proxCardFlowWillPresent]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "setStatusBarHidden:withDuration:", 1, 0.0);
  objc_msgSend(v5, "setIdleTimerDisabled:forReason:", 1, CFSTR("HMSetup"));

}

- (void)proxCardFlowDidDismiss
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v3 = HFLogForCategory(58);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[HSProximityCardHostViewController proxCardFlowDidDismiss]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  if (-[HSProximityCardHostViewController _didPRXActuallyDismiss](self, "_didPRXActuallyDismiss"))
    -[HSProximityCardHostViewController _cleanup](self, "_cleanup");
}

- (BOOL)_didPRXActuallyDismiss
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController proxNavigationController](self, "proxNavigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "presentedViewController"));

  if (v3)
    v4 = objc_msgSend(v3, "modalPresentationStyle") != 0;
  else
    v4 = 1;

  return v4;
}

- (void)coordinator:(id)a3 updatedConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  id v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  void *v37;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController coordinator](self, "coordinator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activeTuple"));
  v10 = objc_msgSend(v9, "currentStep");

  v11 = HFLogForCategory(58);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class(self, v13);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", v10));
    *(_DWORD *)buf = 138413058;
    v31 = v16;
    v32 = 1024;
    v33 = 316;
    v34 = 2080;
    v35 = "-[HSProximityCardHostViewController coordinator:updatedConfiguration:]";
    v36 = 2112;
    v37 = v17;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ %d %s: %@", buf, 0x26u);

  }
  v18 = (id)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController coordinator](self, "coordinator"));
  v19 = v18 == v6;

  if (!v19)
    NSLog(CFSTR("Not the same coordinator"));
  if (v10 == (id)10)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController coordinator](self, "coordinator"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "activeTuple"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController coordinator](self, "coordinator"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAccessoryTuple"));
    v24 = v21 == v23;

    if (!v24)
      NSLog(CFSTR("Not configuring top accessory"));
    objc_initWeak((id *)buf, self);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController coordinator](self, "coordinator"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "nextViewController"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100048704;
    v28[3] = &unk_1000A3050;
    objc_copyWeak(&v29, (id *)buf);
    v27 = objc_msgSend(v26, "addSuccessBlock:", v28);

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
  }

}

- (void)coordinatorRequestedDismissal:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;

  v4 = HFLogForCategory(58);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[HSProximityCardHostViewController coordinatorRequestedDismissal:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[HSProximityCardHostViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)viewControllerForCoordinator:(id)a3 step:(int64_t)a4
{
  HSSetupNetworkRouterConfigurator *v5;
  void *v6;
  HSSetupNetworkRouterConfigurator *v7;
  void *v8;
  void *v9;

  if (a4 == 50)
  {
    v5 = [HSSetupNetworkRouterConfigurator alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController coordinator](self, "coordinator"));
    v7 = -[HSSetupNetworkRouterConfigurator initWithCoordinator:](v5, "initWithCoordinator:", v6);

    -[HSSetupNetworkRouterConfigurator setConfiguratorDelegate:](v7, "setConfiguratorDelegate:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController configurators](self, "configurators"));
    objc_msgSend(v8, "addObject:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupNetworkRouterConfigurator currentViewController](v7, "currentViewController"));
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (unint64_t)coordinatorGetNumberOfProxCards:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController proxNavigationController](self, "proxNavigationController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewControllers"));
  v5 = objc_msgSend(v4, "count");

  return (unint64_t)v5;
}

- (void)configuratorDidUpdateViewController:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;

  v4 = a3;
  v5 = HFLogForCategory(58);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[HSProximityCardHostViewController configuratorDidUpdateViewController:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController proxNavigationController](self, "proxNavigationController"));
  if (!v7)
    NSLog(CFSTR("We must have a navigationController at this point"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController configurators](self, "configurators"));
  v9 = objc_msgSend(v8, "containsObject:", v4);

  if ((v9 & 1) == 0)
    NSLog(CFSTR("Only my own configurators please"));
  objc_initWeak((id *)buf, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100048B40;
  v11[3] = &unk_1000A30A0;
  objc_copyWeak(&v13, (id *)buf);
  v12 = v4;
  v10 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (void)configuratorDidFinish:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;

  v4 = a3;
  v5 = HFLogForCategory(58);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[HSProximityCardHostViewController configuratorDidFinish:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController proxNavigationController](self, "proxNavigationController"));
  v8 = v7 == 0;

  if (v8)
    NSLog(CFSTR("We must have a navigationController at this point"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController configurators](self, "configurators"));
  v10 = objc_msgSend(v9, "containsObject:", v4);

  if ((v10 & 1) == 0)
    NSLog(CFSTR("Only my own configurators please"));
  objc_initWeak((id *)buf, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController coordinator](self, "coordinator"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nextViewController"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100048D80;
  v14[3] = &unk_1000A3050;
  objc_copyWeak(&v15, (id *)buf);
  v13 = objc_msgSend(v12, "addSuccessBlock:", v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

- (id)_allHomesDescription:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "na_map:", &stru_1000A30C0));
  else
    return &off_1000A8D10;
}

- (void)onSetupAccessoryDescription:(id)a3 matterDeviceSetupRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  NSObject *v14;
  HSEntitlementContext *v15;
  HSEntitlementContext *entitlementContext;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  NSObject *v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController resumeSetupHomeUUIDString](self, "resumeSetupHomeUUIDString"));

  if (v8)
  {
    v9 = HFLogForCategory(58);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100060948(self, v10);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController setupAccessoryDescription](self, "setupAccessoryDescription"));

    v12 = v11 == 0;
    v13 = HFLogForCategory(58);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v10 = v14;
    if (v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v28 = v6;
        v29 = 2112;
        v30 = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "HomeUIService launched with accessoryDescription: %@ matterDeviceSetupRequest: %@", buf, 0x16u);
      }

      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "homeUUID"));
      v15 = -[HSEntitlementContext initWithSetupAccessoryDescription:]([HSEntitlementContext alloc], "initWithSetupAccessoryDescription:", v6);
      entitlementContext = self->_entitlementContext;
      self->_entitlementContext = v15;

      v17 = HFLogForCategory(58);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController entitlementContext](self, "entitlementContext"));
        *(_DWORD *)buf = 138412290;
        v28 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Entitlement Context: %@", buf, 0xCu);

      }
      -[HSProximityCardHostViewController setSetupAccessoryDescription:](self, "setSetupAccessoryDescription:", v6);
      -[HSProximityCardHostViewController setMatterDeviceSetupRequest:](self, "setMatterDeviceSetupRequest:", v7);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[HSAccessoryPairingEventLogger sharedLogger](HSAccessoryPairingEventLogger, "sharedLogger"));
      v21 = -[HSProximityCardHostViewController launchReason](self, "launchReason");
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController setupAccessoryDescription](self, "setupAccessoryDescription"));
      objc_msgSend(v20, "logHUISLaunchWithReason:accessoryDescription:", v21, v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[HSAccessoryPairingEventLogger sharedLogger](HSAccessoryPairingEventLogger, "sharedLogger"));
      objc_msgSend(v23, "logLaunchedToSetupASpecificAccessory:", -[HSProximityCardHostViewController isLaunchedToSetupASpecificAccessory](self, "isLaunchedToSetupASpecificAccessory"));

      if (!v7 || v10)
      {
        objc_initWeak((id *)buf, self);
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_100049278;
        v24[3] = &unk_1000A3078;
        objc_copyWeak(&v26, (id *)buf);
        v10 = v10;
        v25 = v10;
        -[HSProximityCardHostViewController _refreshHomeGraphWithCompletion:](self, "_refreshHomeGraphWithCompletion:", v24);

        objc_destroyWeak(&v26);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        -[HSProximityCardHostViewController _initiateSetupFlow:](self, "_initiateSetupFlow:", 0);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      sub_1000608B0(self);
    }
  }

}

- (void)_initiateSetupFlow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  HSProxCardCoordinator *v19;
  _BOOL8 v20;
  void *v21;
  HSProxCardCoordinator *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  unsigned int v41;
  __int16 v42;
  id v43;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController setupAccessoryDescription](self, "setupAccessoryDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController matterDeviceSetupRequest](self, "matterDeviceSetupRequest"));
  if (-[HSProximityCardHostViewController isLaunchedToSetupASpecificAccessory](self, "isLaunchedToSetupASpecificAccessory"))
  {
    v7 = objc_alloc((Class)HFDiscoveredAccessory);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accessoryUUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accessoryName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "category"));
    v11 = objc_msgSend(v7, "initWithAccessoryUUID:accessoryName:accessoryCategory:", v8, v9, v10);

  }
  else
  {
    v11 = 0;
  }
  v12 = HFLogForCategory(58);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (objc_class *)objc_opt_class(self, v14);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
    *(_DWORD *)buf = 138413826;
    v31 = v17;
    v32 = 2112;
    v33 = v4;
    v34 = 2112;
    v35 = v18;
    v36 = 2112;
    v37 = v5;
    v38 = 2112;
    v39 = v6;
    v40 = 1024;
    v41 = -[HSProximityCardHostViewController isLaunchedToSetupASpecificAccessory](self, "isLaunchedToSetupASpecificAccessory");
    v42 = 2112;
    v43 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Launching %@ with home %@ home.uuid %@ accessoryDescription %@ matterDeviceSetupRequest %@ isLaunchedToSetupASpecificAccessory %d discoveredAccessory %@", buf, 0x44u);

  }
  v19 = [HSProxCardCoordinator alloc];
  v20 = -[HSProximityCardHostViewController isLaunchedToSetupASpecificAccessory](self, "isLaunchedToSetupASpecificAccessory");
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController entitlementContext](self, "entitlementContext"));
  v22 = -[HSProxCardCoordinator initWithHome:accessoryDescription:matterDeviceSetupRequest:setupSpecificAccessory:entitlementContext:discoveredAccessory:delegate:](v19, "initWithHome:accessoryDescription:matterDeviceSetupRequest:setupSpecificAccessory:entitlementContext:discoveredAccessory:delegate:", v4, v5, v6, v20, v21, v11, self);
  -[HSProximityCardHostViewController setCoordinator:](self, "setCoordinator:", v22);

  objc_initWeak((id *)buf, self);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController coordinator](self, "coordinator"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "nextViewController"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10004974C;
  v27[3] = &unk_1000A30E8;
  objc_copyWeak(&v29, (id *)buf);
  v25 = v5;
  v28 = v25;
  v26 = objc_msgSend(v24, "addSuccessBlock:", v27);

  objc_destroyWeak(&v29);
  objc_destroyWeak((id *)buf);

}

- (void)_presentProxCardFlowWithInitialViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___PRXCardContentProviding))
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[PRXFlowConfiguration defaultConfiguration](PRXFlowConfiguration, "defaultConfiguration"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController presentProxCardFlowWithDelegate:initialViewController:configuration:](self, "presentProxCardFlowWithDelegate:initialViewController:configuration:", self, v7, v8));
      -[HSProximityCardHostViewController setProxNavigationController:](self, "setProxNavigationController:", v9);

    }
    else
    {
      v19 = HFLogForCategory(58);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_100060A50(v20, v21, v22, v23, v24, v25, v26, v27);

      NSLog(CFSTR("Attempted to present a vc that is not PRXCardContentProviding %s"), "-[HSProximityCardHostViewController _presentProxCardFlowWithInitialViewController:]");
    }

  }
  else
  {
    v10 = HFLogForCategory(58);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000609E0(v11, v12, v13, v14, v15, v16, v17, v18);

    NSLog(CFSTR("Attempted to present ProxCardFlow with nil initial view controller %s"), "-[HSProximityCardHostViewController _presentProxCardFlowWithInitialViewController:]");
  }

}

- (void)pairingController:(id)a3 didTransitionToPhase:(unint64_t)a4 statusTitle:(id)a5 statusDescription:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  HSPCSetupNetworkRouterAppPunchoutViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  HSPCRouterReplaceViewController *v20;
  void *v21;
  HSPCSetupNetworkRouterAppPunchoutViewController *v22;
  _QWORD block[4];
  HSPCSetupNetworkRouterAppPunchoutViewController *v24;
  id v25;
  id location;

  v9 = a3;
  -[HSProximityCardHostViewController _updatePairingStatusIfNecessary:phase:](self, "_updatePairingStatusIfNecessary:phase:", a6, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "context"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "setupAccessoryDescription"));
  switch(a4)
  {
    case 0xAuLL:
      if (-[HSProximityCardHostViewController isLaunchedToSetupASpecificAccessory](self, "isLaunchedToSetupASpecificAccessory"))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController coordinator](self, "coordinator"));
        objc_msgSend(v16, "dismissProxCardFlowAfterExecuting:", 0);

      }
      break;
    case 7uLL:
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "category"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "categoryType"));
      v19 = objc_msgSend(v18, "isEqualToString:", HMAccessoryCategoryTypeWiFiRouter);

      if (v19)
      {
        v20 = [HSPCRouterReplaceViewController alloc];
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController coordinator](self, "coordinator"));
        v15 = -[HSPCRouterReplaceViewController initWithCoordinator:](v20, "initWithCoordinator:", v21);

        if (v15)
          goto LABEL_11;
      }
      break;
    case 6uLL:
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "category"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "categoryType"));
      v14 = objc_msgSend(v13, "isEqualToString:", HMAccessoryCategoryTypeWiFiRouter);

      if (!v14)
        break;
      v15 = -[HSPCSetupNetworkRouterAppPunchoutViewController initWithPopupDelegate:setupAccessoryDescription:]([HSPCSetupNetworkRouterAppPunchoutViewController alloc], "initWithPopupDelegate:setupAccessoryDescription:", self, v11);
      if (!v15)
        break;
LABEL_11:
      objc_initWeak(&location, self);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100049D74;
      block[3] = &unk_1000A30A0;
      objc_copyWeak(&v25, &location);
      v24 = v15;
      v22 = v15;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);

      break;
    default:
      break;
  }

}

- (void)_updatePairingStatusIfNecessary:(id)a3 phase:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  int v20;
  const char *v21;
  __int16 v22;
  id v23;

  v6 = a3;
  v7 = HFLogForCategory(58);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 136315394;
    v21 = "-[HSProximityCardHostViewController _updatePairingStatusIfNecessary:phase:]";
    v22 = 2112;
    v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v20, 0x16u);
  }

  if (objc_msgSend(v6, "length"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController coordinator](self, "coordinator"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activeTuple"));
    v11 = objc_msgSend(v10, "currentStep");

    if (v11 == (id)10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activeTuple"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAccessoryTuple"));

      if (v12 != v13)
        NSLog(CFSTR("Not configuring top accessory"));
      v15 = objc_opt_class(HSPCPairingViewController, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController proxNavigationController](self, "proxNavigationController"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topViewController"));
      if ((objc_opt_isKindOfClass(v17, v15) & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
      v19 = v18;

      objc_msgSend(v19, "updatePairingStatus:phase:", v6, a4);
    }

  }
}

- (void)pairingPopupDidFinish:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  HSProximityCardHostViewController *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "setupAccessoryDescription"));
  v6 = HFLogForCategory(58);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412802;
    v14 = self;
    v15 = 2112;
    v16 = v4;
    v17 = 2048;
    v18 = objc_msgSend(v4, "popupType");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%@ pairingPopupDidFinish:%@ pairingPopup.popupType %lu]", (uint8_t *)&v13, 0x20u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "category"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "categoryType"));
  v10 = objc_msgSend(v9, "isEqualToString:", HMAccessoryCategoryTypeWiFiRouter);

  if ((v10 & 1) == 0)
    NSLog(CFSTR("Only Routers are handled"));
  if (objc_msgSend(v4, "popupType") == (id)2)
  {
    v11 = objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController coordinator](self, "coordinator"));
    -[NSObject dismissProxCardFlowAfterExecuting:](v11, "dismissProxCardFlowAfterExecuting:", 0);
  }
  else
  {
    v12 = HFLogForCategory(58);
    v11 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100060AC0((uint64_t)self, v4);
  }

}

- (void)pairingPopupDidCancel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  HSProximityCardHostViewController *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "setupAccessoryDescription"));
  v6 = HFLogForCategory(58);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412802;
    v14 = self;
    v15 = 2112;
    v16 = v4;
    v17 = 2048;
    v18 = objc_msgSend(v4, "popupType");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%@ pairingPopupDidFinish:%@ pairingPopup.popupType %lu]", (uint8_t *)&v13, 0x20u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "category"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "categoryType"));
  v10 = objc_msgSend(v9, "isEqualToString:", HMAccessoryCategoryTypeWiFiRouter);

  if ((v10 & 1) == 0)
    NSLog(CFSTR("Only Routers are handled"));
  if (objc_msgSend(v4, "popupType") == (id)2)
  {
    v11 = objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController coordinator](self, "coordinator"));
    -[NSObject dismissProxCardFlowAfterExecuting:](v11, "dismissProxCardFlowAfterExecuting:", 0);
  }
  else
  {
    v12 = HFLogForCategory(58);
    v11 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100060AC0((uint64_t)self, v4);
  }

}

- (void)_willAppearInRemoteViewController
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  const char *v5;

  v2 = HFLogForCategory(58, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[HSProximityCardHostViewController _willAppearInRemoteViewController]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

}

- (void)didInvalidateForRemoteAlert
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v3 = HFLogForCategory(58);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[HSProximityCardHostViewController didInvalidateForRemoteAlert]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[HSProximityCardHostViewController _cleanup](self, "_cleanup");
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD *v10;
  void *v11;
  objc_super v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id buf;

  v4 = a3;
  v6 = a4;
  v7 = HFLogForCategory(70);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "dismissViewControllerAnimated: %d requesting invalidation from host", (uint8_t *)&buf, 8u);
  }

  objc_initWeak(&buf, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004A5A4;
  v13[3] = &unk_1000A3110;
  objc_copyWeak(&v15, &buf);
  v9 = v6;
  v14 = v9;
  v10 = objc_retainBlock(v13);
  v11 = v10;
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)HSProximityCardHostViewController;
    -[HSProximityCardHostViewController dismissViewControllerAnimated:completion:](&v12, "dismissViewControllerAnimated:completion:", 1, v10);
  }
  else
  {
    ((void (*)(_QWORD *))v10[2])(v10);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&buf);

}

- (void)_cleanup
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
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
  id v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  _QWORD *v22;
  id v23;
  void *v24;
  _QWORD v25[5];
  NSObject *v26;
  _QWORD v27[5];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;

  if (-[HSProximityCardHostViewController isCleaningUp](self, "isCleaningUp"))
  {
    v3 = HFLogForCategory(58);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[HSProximityCardHostViewController _cleanup]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: already cleaning up, returning early", buf, 0xCu);
    }
  }
  else
  {
    -[HSProximityCardHostViewController setIsCleaningUp:](self, "setIsCleaningUp:", 1);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10004A998;
    v27[3] = &unk_1000A10A8;
    v27[4] = self;
    v4 = objc_retainBlock(v27);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController resumeSetupHomeUUIDString](self, "resumeSetupHomeUUIDString"));

    if (v5)
    {
      ((void (*))v4[2].isa)(v4);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController coordinator](self, "coordinator"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pairingFuture"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pairingController"));

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "completedInfo"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController coordinator](self, "coordinator"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAccessoryTuple"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "configuration"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pairingError"));

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController setupAccessoryDescription](self, "setupAccessoryDescription"));
      if (objc_msgSend(v14, "isSetupInitiatedByOtherMatterEcosystem"))
      {

      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pairedAccessories"));
        v16 = objc_msgSend(v15, "count");

        if (!v16 && !v13 && !v9)
        {
          v17 = HFLogForCategory(58);
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v29 = "-[HSProximityCardHostViewController _cleanup]";
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: determined this is an early cancellation by the user, setting error HMFErrorCodeOperationCancelled", buf, 0xCu);
          }

          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hmfErrorWithCode:](NSError, "hmfErrorWithCode:", 12));
        }
      }
      v19 = HFLogForCategory(58);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[HSProximityCardHostViewController setupAccessoryDescription](self, "setupAccessoryDescription"));
        *(_DWORD *)buf = 136315906;
        v29 = "-[HSProximityCardHostViewController _cleanup]";
        v30 = 2112;
        v31 = v9;
        v32 = 2112;
        v33 = v13;
        v34 = 2112;
        v35 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: Finishing accessory setup with info %@, error %@ for setupAccessoryDescription %@", buf, 0x2Au);

      }
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10004AA48;
      v25[3] = &unk_1000A27F8;
      v25[4] = self;
      v26 = v4;
      v22 = objc_retainBlock(v25);
      v23 = objc_alloc_init((Class)HMAccessorySetupManager);
      v24 = v23;
      if (v13)
      {
        objc_msgSend(v23, "failAccessorySetupWithError:completionHandler:", v13, v22);
      }
      else if (v9)
      {
        objc_msgSend(v23, "finishAccessorySetupWithSetupCompletedInfo:completionHandler:", v9, v22);
      }
      else
      {
        objc_msgSend(v23, "finishAccessorySetupWithCompletionHandler:", v22);
      }

    }
  }

}

- (UINavigationController)proxNavigationController
{
  return self->proxNavigationController;
}

- (void)setProxNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->proxNavigationController, a3);
}

- (HSProxCardCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_coordinator, a3);
}

- (SFClient)sharingFrameworkClient
{
  return self->_sharingFrameworkClient;
}

- (void)setSharingFrameworkClient:(id)a3
{
  objc_storeStrong((id *)&self->_sharingFrameworkClient, a3);
}

- (HSEntitlementContext)entitlementContext
{
  return self->_entitlementContext;
}

- (NSMutableArray)configurators
{
  return self->_configurators;
}

- (void)setConfigurators:(id)a3
{
  objc_storeStrong((id *)&self->_configurators, a3);
}

- (HMSetupAccessoryDescription)setupAccessoryDescription
{
  return self->_setupAccessoryDescription;
}

- (void)setSetupAccessoryDescription:(id)a3
{
  objc_storeStrong((id *)&self->_setupAccessoryDescription, a3);
}

- (MTSDeviceSetupRequest)matterDeviceSetupRequest
{
  return self->_matterDeviceSetupRequest;
}

- (void)setMatterDeviceSetupRequest:(id)a3
{
  objc_storeStrong((id *)&self->_matterDeviceSetupRequest, a3);
}

- (int64_t)launchReason
{
  return self->_launchReason;
}

- (void)setLaunchReason:(int64_t)a3
{
  self->_launchReason = a3;
}

- (NSString)resumeSetupHomeUUIDString
{
  return self->_resumeSetupHomeUUIDString;
}

- (void)setResumeSetupHomeUUIDString:(id)a3
{
  objc_storeStrong((id *)&self->_resumeSetupHomeUUIDString, a3);
}

- (NSArray)accessoriesToResumeSetup
{
  return self->_accessoriesToResumeSetup;
}

- (void)setAccessoriesToResumeSetup:(id)a3
{
  objc_storeStrong((id *)&self->_accessoriesToResumeSetup, a3);
}

- (BOOL)isCleaningUp
{
  return self->_isCleaningUp;
}

- (void)setIsCleaningUp:(BOOL)a3
{
  self->_isCleaningUp = a3;
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_accessoriesToResumeSetup, 0);
  objc_storeStrong((id *)&self->_resumeSetupHomeUUIDString, 0);
  objc_storeStrong((id *)&self->_matterDeviceSetupRequest, 0);
  objc_storeStrong((id *)&self->_setupAccessoryDescription, 0);
  objc_storeStrong((id *)&self->_configurators, 0);
  objc_storeStrong((id *)&self->_entitlementContext, 0);
  objc_storeStrong((id *)&self->_sharingFrameworkClient, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->proxNavigationController, 0);
}

@end

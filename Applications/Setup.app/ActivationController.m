@implementation ActivationController

- (BOOL)controllerNeedsToRun
{
  id v2;
  unsigned __int8 v3;
  unsigned __int8 v4;
  char v6;
  BuddyMiscState *v7;
  char v8;
  id location[2];
  ActivationController *v10;
  char v11;

  v10 = self;
  location[1] = (id)a2;
  v2 = +[BYPreferencesController buddyPreferencesInternal](BYPreferencesController, "buddyPreferencesInternal");
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("networkAlwaysSupportActivation"));

  if ((v3 & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    location[0] = +[BuddyActivationConfiguration currentConfiguration](BuddyActivationConfiguration, "currentConfiguration");
    v8 = objc_msgSend(location[0], "isActivated") & 1;
    v6 = 0;
    v4 = 0;
    if (!v8)
    {
      v7 = -[ActivationController miscState](v10, "miscState");
      v6 = 1;
      v4 = -[BuddyMiscState userSelectedTetheredActivation](v7, "userSelectedTetheredActivation");
    }
    if ((v6 & 1) != 0)

    if ((v4 & 1) != 0)
      v11 = 0;
    else
      v11 = (v8 ^ 1) & 1;
    objc_storeStrong(location, 0);
  }
  return v11 & 1;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (void)_releaseOTAAssertion
{
  NSObject *v2;
  os_log_type_t v3;
  _WORD v4[3];
  os_log_type_t v5;
  os_log_t oslog[2];
  ActivationController *v7;

  v7 = self;
  oslog[1] = (os_log_t)a2;
  if (self->_otaAssertion)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
    v5 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      v2 = oslog[0];
      v3 = v5;
      sub_100038C3C(v4);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Buddy Activate: releasing OTA assertion", (uint8_t *)v4, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    CFRelease(v7->_otaAssertion);
    v7->_otaAssertion = 0;
  }
}

- (void)restart
{
  id v2;
  id v3;

  self->_state = 0;
  v2 = -[ActivationController navigationController](self, "navigationController", a2);
  v3 = objc_msgSend(v2, "popToViewController:animated:", self, 1);

}

- (void)_removeViewControllersIncludingSelf:(BOOL)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  BOOL v7;
  SEL v8;
  ActivationController *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6 = objc_alloc_init((Class)NSMutableArray);
  if (v7)
    objc_msgSend(v6, "addObject:", v9);
  v3 = v6;
  v4 = -[RemoteUIController displayedPages](v9->_remoteUIController, "displayedPages", v6);
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  v5 = -[ActivationController delegate](v9, "delegate");
  objc_msgSend(v5, "removeViewControllersOnNextPush:", v6);

  objc_storeStrong((id *)&v9->_remoteUIController, 0);
  objc_storeStrong(&v6, 0);
}

- (void)_attemptDismiss
{
  const __CFString *v2;
  id v3;
  id v4;
  BuddyActivationError *v5;
  BuddyActivationError *v6;
  BuddyActivationState *v7;
  id v8;
  id location;
  os_log_type_t v10;
  os_log_t oslog[2];
  ActivationController *v12;
  uint8_t buf[24];

  v12 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v10 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    if (v12->_displayTimerElapsed)
      v2 = CFSTR("YASE");
    else
      v2 = CFSTR("NERP");
    sub_10005A460((uint64_t)buf, v12->_state, (uint64_t)v2);
    _os_log_impl((void *)&_mh_execute_header, oslog[0], v10, "Buddy Activate: Attempt dismiss. State = %i, _displayTimerElapsed = %@", buf, 0x12u);
  }
  objc_storeStrong((id *)oslog, 0);
  if (v12->_displayTimerElapsed)
  {
    if (v12->_state != 3 || v12->_activationControllerDismissed)
    {
      if (v12->_state == 5)
      {
        -[ActivationController _addAnalyticsEventWithSuccess:](v12, "_addAnalyticsEventWithSuccess:", 0);
        v4 = -[ActivationController navigationController](v12, "navigationController");
        location = objc_msgSend(v4, "viewControllers");

        if ((objc_msgSend(location, "containsObject:", v12) & 1) != 0)
        {
          v5 = [BuddyActivationError alloc];
          v6 = -[BuddyActivationError initWithConnectionFailure:cellular:](v5, "initWithConnectionFailure:cellular:", v12->_connectionFailed, v12->_connectionOTA);
          v7 = -[ActivationController activationState](v12, "activationState");
          -[BuddyActivationState setError:](v7, "setError:", v6);

          -[ActivationController _removeViewControllersIncludingSelf:](v12, "_removeViewControllersIncludingSelf:", 0);
          -[ActivationController _releaseOTAAssertion](v12, "_releaseOTAAssertion");
          v8 = -[ActivationController delegate](v12, "delegate");
          objc_msgSend(v8, "flowItemDone:", v12);

        }
        objc_storeStrong(&location, 0);
      }
    }
    else
    {
      -[ActivationController _stopActivationLockExpirationTimer](v12, "_stopActivationLockExpirationTimer");
      -[ActivationController _clearDisplayTimer](v12, "_clearDisplayTimer");
      -[ActivationController _clearTicketAcceptedTimer](v12, "_clearTicketAcceptedTimer");
      -[ActivationController _releaseOTAAssertion](v12, "_releaseOTAAssertion");
      -[ActivationController _writeAcknowledgment](v12, "_writeAcknowledgment");
      -[ActivationController _addAnalyticsEventWithSuccess:](v12, "_addAnalyticsEventWithSuccess:", 1);
      -[ActivationController _removeViewControllersIncludingSelf:](v12, "_removeViewControllersIncludingSelf:", 1);
      -[ActivationController _restorePasteboard](v12, "_restorePasteboard");
      v3 = -[ActivationController delegate](v12, "delegate");
      objc_msgSend(v3, "flowItemDone:", v12);

      v12->_activationControllerDismissed = 1;
    }
  }
}

- (void)_enterState:(int)a3
{
  NSObject *v3;
  os_log_type_t v4;
  NSObject *v5;
  os_log_type_t v6;
  NSObject *v7;
  os_log_type_t v8;
  NSObject *v9;
  os_log_type_t v10;
  NSObject *v11;
  os_log_type_t v12;
  NSObject *v13;
  os_log_type_t v14;
  NSObject *v15;
  os_log_type_t v16;
  NSObject *v17;
  os_log_type_t v18;
  UIApplication *v19;
  UIApplication *v20;
  _WORD v21[3];
  os_log_type_t v22;
  os_log_t v23;
  uint8_t v24[7];
  os_log_type_t v25;
  os_log_t v26;
  uint8_t v27[7];
  os_log_type_t v28;
  os_log_t v29;
  uint8_t v30[7];
  os_log_type_t v31;
  os_log_t v32;
  uint8_t v33[7];
  os_log_type_t v34;
  os_log_t v35;
  uint8_t v36[7];
  os_log_type_t v37;
  os_log_t oslog;
  uint8_t v39[7];
  os_log_type_t v40;
  id v41;
  uint8_t buf[15];
  os_log_type_t v43;
  id location;
  int v45;
  SEL v46;
  ActivationController *v47;

  v47 = self;
  v46 = a2;
  v45 = a3;
  self->_state = a3;
  switch(v45)
  {
    case 0:
      location = (id)_BYLoggingFacility(self);
      v43 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
      {
        v3 = location;
        v4 = v43;
        sub_100038C3C(buf);
        _os_log_impl((void *)&_mh_execute_header, v3, v4, "Buddy Activate: Enter state Idle", buf, 2u);
      }
      objc_storeStrong(&location, 0);
      break;
    case 1:
      v41 = (id)_BYLoggingFacility(self);
      v40 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_DEFAULT))
      {
        v5 = v41;
        v6 = v40;
        sub_100038C3C(v39);
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "Buddy Activate: Enter state Activating", v39, 2u);
      }
      objc_storeStrong(&v41, 0);
      break;
    case 2:
      oslog = (os_log_t)(id)_BYLoggingFacility(self);
      v37 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v7 = oslog;
        v8 = v37;
        sub_100038C3C(v36);
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "Buddy Activate: Enter state TryActivate", v36, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      break;
    case 3:
      v35 = (os_log_t)(id)_BYLoggingFacility(self);
      v34 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v35;
        v10 = v34;
        sub_100038C3C(v33);
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "Buddy Activate: Enter state Activated", v33, 2u);
      }
      objc_storeStrong((id *)&v35, 0);
      break;
    case 4:
      v32 = (os_log_t)(id)_BYLoggingFacility(self);
      v31 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v32;
        v12 = v31;
        sub_100038C3C(v30);
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "Buddy Activate: Enter state NotSilentPreActivation", v30, 2u);
      }
      objc_storeStrong((id *)&v32, 0);
      break;
    case 5:
      v29 = (os_log_t)(id)_BYLoggingFacility(self);
      v28 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v29;
        v14 = v28;
        sub_100038C3C(v27);
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "Buddy Activate: Enter state Failure", v27, 2u);
      }
      objc_storeStrong((id *)&v29, 0);
      break;
    case 6:
      v26 = (os_log_t)(id)_BYLoggingFacility(self);
      v25 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v26;
        v16 = v25;
        sub_100038C3C(v24);
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "Buddy Activate: Enter state WaitingForSystemTimeUpdate", v24, 2u);
      }
      objc_storeStrong((id *)&v26, 0);
      break;
    case 7:
      v23 = (os_log_t)(id)_BYLoggingFacility(self);
      v22 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v23;
        v18 = v22;
        sub_100038C3C(v21);
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "Buddy Activate: Enter state WaitingForBaseband", (uint8_t *)v21, 2u);
      }
      objc_storeStrong((id *)&v23, 0);
      break;
    default:
      break;
  }
  if (v45 == 1 || v45 == 7 || v45 == 6 || v45 == 2 || !v47->_displayTimerElapsed)
  {
    v19 = +[UIApplication sharedApplication](UIApplication, "sharedApplication");
    -[UIApplication setIdleTimerDisabled:](v19, "setIdleTimerDisabled:", 1);

  }
  else
  {
    v20 = +[UIApplication sharedApplication](UIApplication, "sharedApplication");
    -[UIApplication setIdleTimerDisabled:](v20, "setIdleTimerDisabled:", 0);

  }
  -[ActivationController _attemptDismiss](v47, "_attemptDismiss");
}

- (BOOL)shouldSuppressExtendedInitializationActivityIndicator
{
  id v2;
  ActivationController *v3;
  BOOL v4;

  v2 = -[ActivationController navigationController](self, "navigationController");
  v3 = (ActivationController *)objc_msgSend(v2, "topViewController");
  v4 = v3 == self;

  return v4;
}

- (ActivationController)init
{
  NSBundle *v3;
  id v4;
  NSString *v5;
  ActivationController *v6;
  id v7;
  id v8;
  NSBundle *v9;
  NSString *v10;
  id v11;
  id v12;
  NSMutableArray *v13;
  void *v14;
  id v15;
  NSNotificationCenter *v16;
  NSNotificationCenter *v17;
  id v18;
  void *v19;
  ActivationController *v20;
  objc_super v22;
  SEL v23;
  id location;

  v23 = a2;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("ACTIVATION_TIME"));
  v5 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", v4, &stru_100284738, CFSTR("Localizable"));
  location = 0;
  v22.receiver = self;
  v22.super_class = (Class)ActivationController;
  v6 = -[ActivationController initWithSpinnerText:](&v22, "initWithSpinnerText:", v5);
  location = v6;
  objc_storeStrong(&location, v6);

  if (v6)
  {
    +[UINavigationBar _setUseCustomBackButtonAction:](UINavigationBar, "_setUseCustomBackButtonAction:", 1);
    v7 = objc_msgSend(location, "navigationItem");
    objc_msgSend(v7, "setTitle:", &stru_100284738);

    v8 = objc_alloc((Class)UIBarButtonItem);
    v9 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v10 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("BACK"), &stru_100284738, CFSTR("Localizable"));
    v11 = objc_msgSend(v8, "initWithTitle:style:target:action:", v10, 0, location, "back:");
    v12 = objc_msgSend(location, "navigationItem");
    objc_msgSend(v12, "setBackBarButtonItem:", v11);

    v13 = objc_opt_new(NSMutableArray);
    v14 = (void *)*((_QWORD *)location + 3);
    *((_QWORD *)location + 3) = v13;

    v15 = +[BuddyActivationConfiguration currentConfiguration](BuddyActivationConfiguration, "currentConfiguration");
    objc_msgSend(v15, "addDelegate:", location);

    v16 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:](v16, "addObserver:selector:name:object:", location, "didBecomeActive:", UIApplicationDidBecomeActiveNotification, 0);

    v17 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:](v17, "addObserver:selector:name:object:", location, "didResignActive:", UIApplicationWillResignActiveNotification, 0);

    v18 = objc_alloc_init((Class)SecureBackup);
    v19 = (void *)*((_QWORD *)location + 6);
    *((_QWORD *)location + 6) = v18;

  }
  v20 = (ActivationController *)location;
  objc_storeStrong(&location, 0);
  return v20;
}

- (void)dealloc
{
  NSNotificationCenter *v2;
  objc_super v3;
  CFNotificationCenterRef center;
  SEL v5;
  ActivationController *v6;

  v6 = self;
  v5 = a2;
  center = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(center, v6);
  v2 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:](v2, "removeObserver:", v6);

  -[ActivationController _cleanup](v6, "_cleanup");
  -[RemoteUIController setDelegate:](v6->_remoteUIController, "setDelegate:", 0);
  -[ActivationController _clearDisplayTimer](v6, "_clearDisplayTimer");
  -[ActivationController _clearWaitingForBasebandTimer](v6, "_clearWaitingForBasebandTimer");
  v3.receiver = v6;
  v3.super_class = (Class)ActivationController;
  -[ActivationController dealloc](&v3, "dealloc");
}

- (void)loadView
{
  id v2;
  id v3;
  id v4;
  objc_super v5;
  SEL v6;
  ActivationController *v7;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)ActivationController;
  -[ActivationController loadView](&v5, "loadView");
  -[ActivationController setActivityIndicatorHidden:](v7, "setActivityIndicatorHidden:", 1);
  v2 = +[OBPrivacyLinkController linkWithBundleIdentifier:](OBPrivacyLinkController, "linkWithBundleIdentifier:", BYPrivacyActivationIdentifier);
  -[ActivationController setPrivacyLinkController:](v7, "setPrivacyLinkController:", v2);

  v3 = -[ActivationController privacyLinkController](v7, "privacyLinkController");
  v4 = objc_msgSend(v3, "view");
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);

}

- (void)back:(id)a3
{
  id v3;
  uint64_t v4;
  char v5;
  id v6;
  id v7;
  char v8;
  id v9;
  id v10;
  id location[2];
  ActivationController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = -[ActivationController navigationController](v12, "navigationController");
  v3 = objc_msgSend(v10, "topViewController");
  v4 = objc_opt_class(BuddyActivationBasebandDeadController);
  v8 = 0;
  v5 = 0;
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v9 = -[ActivationController delegate](v12, "delegate");
    v8 = 1;
    v5 = objc_opt_respondsToSelector(v9, "presentWiFiPaneForFlowItem:");
  }
  if ((v8 & 1) != 0)

  if ((v5 & 1) != 0)
  {
    v6 = -[ActivationController delegate](v12, "delegate");
    objc_msgSend(v6, "presentWiFiPaneForFlowItem:", v12);

  }
  else
  {
    v7 = objc_msgSend(v10, "popViewControllerAnimated:", 1);
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)_addAnalyticsEventWithSuccess:(BOOL)a3
{
  BYAnalyticsManager *v3;
  NSNumber *v4;
  double v5;
  NSNumber *v6;
  NSNumber *v7;
  NSNumber *v8;
  NSNumber *v9;
  NSDictionary *v10;
  _QWORD v13[5];
  _QWORD v14[5];

  v3 = -[ActivationController analyticsManager](self, "analyticsManager");
  v13[0] = CFSTR("cellular");
  v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_connectionOTA);
  v14[0] = v4;
  v13[1] = CFSTR("duration");
  -[NSDate timeIntervalSinceNow](self->_startedActivationDate, "timeIntervalSinceNow");
  v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -v5);
  v14[1] = v6;
  v13[2] = CFSTR("hasPresentedUI");
  v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_hasPresentedRemoteUI);
  v14[2] = v7;
  v13[3] = CFSTR("bootstrap");
  v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_usingBootstrap);
  v14[3] = v8;
  v13[4] = CFSTR("success");
  v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3);
  v14[4] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  -[BYAnalyticsManager addEvent:withPayload:persist:](v3, "addEvent:withPayload:persist:", CFSTR("com.apple.setupassistant.ios.activation"), v10, 1);

}

- (void)_clearDisplayTimer
{
  NSObject *v2;
  os_log_type_t v3;
  _WORD v4[3];
  char v5;
  os_log_t oslog[2];
  ActivationController *v7;

  v7 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v5 = 2;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    v2 = oslog[0];
    v3 = v5;
    sub_100038C3C(v4);
    _os_log_debug_impl((void *)&_mh_execute_header, v2, v3, "Buddy Activate: Clear Display Timer", (uint8_t *)v4, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  -[NSTimer invalidate](v7->_displayTimer, "invalidate");
  objc_storeStrong((id *)&v7->_displayTimer, 0);
}

- (void)_checkActivationFailIfNotActivated:(BOOL)a3
{
  NSObject *v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  ActivationController *v9;
  BOOL v10;
  BOOL v11;
  SEL v12;
  ActivationController *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v3 = dispatch_get_global_queue(0, 0);
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_10009F110;
  v8 = &unk_100280B18;
  v9 = v13;
  v10 = v11;
  dispatch_async(v3, &v4);

  objc_storeStrong((id *)&v9, 0);
}

- (void)_checkActivationFailIfNotActivated:(BOOL)a3 isActivated:(BOOL)a4
{
  id v4;
  unsigned __int8 v5;
  os_log_t oslog;
  BOOL v7;
  BOOL v8;
  SEL v9;
  ActivationController *v10;
  uint8_t buf[24];

  v10 = self;
  v9 = a2;
  v8 = a3;
  v7 = a4;
  oslog = (os_log_t)(id)_BYLoggingFacility(self);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10003CBAC((uint64_t)buf, v10->_state, v7);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Buddy Activate: Check Activation! State = %d Activated = %d", buf, 0xEu);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (v7)
  {
    -[ActivationController _clearTicketAcceptedTimer](v10, "_clearTicketAcceptedTimer");
    if (v10->_state == 2)
    {
      -[ActivationController _enterState:](v10, "_enterState:", 3);
    }
    else
    {
      v4 = -[ActivationController delegate](v10, "delegate");
      v5 = objc_msgSend(v4, "isFlowItemOnTop:", v10);

      if ((v5 & 1) != 0)
        -[ActivationController _enterState:](v10, "_enterState:", 3);
    }
  }
  else if (v8)
  {
    -[ActivationController _clearTicketAcceptedTimer](v10, "_clearTicketAcceptedTimer");
    -[ActivationController _enterState:](v10, "_enterState:", 5);
  }
}

- (void)startOver
{
  id v2;
  BOOL v3;
  char v4;
  ActivationController *v5;
  id location[2];
  ActivationController *v7;

  v7 = self;
  location[1] = (id)a2;
  -[ActivationController _cleanup](self, "_cleanup");
  v7->_state = 0;
  location[0] = -[ActivationController navigationController](v7, "navigationController");
  v2 = objc_msgSend(location[0], "viewControllers");
  v4 = 0;
  v3 = 0;
  if (objc_msgSend(v2, "count") == (id)1)
  {
    v5 = (ActivationController *)objc_msgSend(location[0], "topViewController");
    v4 = 1;
    v3 = v5 == v7;
  }
  if ((v4 & 1) != 0)

  if (v3)
    -[ActivationController _activateIfNecessary](v7, "_activateIfNecessary");
  objc_storeStrong(location, 0);
}

- (void)_clearTicketAcceptedTimer
{
  NSObject *v2;
  os_log_type_t v3;
  _WORD v4[3];
  os_log_type_t v5;
  os_log_t oslog[2];
  ActivationController *v7;

  v7 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v5;
    sub_100038C3C(v4);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Buddy Activate: Clear ticket accepted timer", (uint8_t *)v4, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  -[NSTimer invalidate](v7->_ticketAcceptedTimer, "invalidate");
  objc_storeStrong((id *)&v7->_ticketAcceptedTimer, 0);
}

- (void)_ticketAcceptedDidTimeout
{
  NSObject *v2;
  os_log_type_t v3;
  _WORD v4[3];
  os_log_type_t v5;
  os_log_t oslog[2];
  ActivationController *v7;

  v7 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v5;
    sub_100038C3C(v4);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Buddy Activate: Ticket accepted timer timed out", (uint8_t *)v4, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  -[ActivationController _clearTicketAcceptedTimer](v7, "_clearTicketAcceptedTimer");
  -[ActivationController _checkActivationFailIfNotActivated:](v7, "_checkActivationFailIfNotActivated:", 1);
}

- (void)_activateIfNecessary
{
  _BOOL8 v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  NSTimer *v6;
  NSTimer *displayTimer;
  NSObject *v8;
  void **block;
  int v10;
  int v11;
  void (*v12)(uint64_t);
  void *v13;
  ActivationController *v14;
  uint8_t buf[15];
  char v16;
  id v17;
  id location[2];
  ActivationController *v19;

  v19 = self;
  location[1] = (id)a2;
  self->_displayTimerElapsed = 0;
  -[ActivationController _clearDisplayTimer](v19, "_clearDisplayTimer");
  v2 = +[BuddyActivationBasebandDeadController controllerNeedsToRun](BuddyActivationBasebandDeadController, "controllerNeedsToRun");
  if (v2)
  {
    location[0] = objc_alloc_init(BuddyActivationBasebandDeadController);
    v3 = -[ActivationController navigationController](v19, "navigationController");
    objc_msgSend(v3, "pushViewController:animated:", location[0], 1);

    objc_storeStrong(location, 0);
  }
  else
  {
    v17 = (id)_BYLoggingFacility(v2);
    v16 = 2;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEBUG))
    {
      v4 = v17;
      v5 = v16;
      sub_100038C3C(buf);
      _os_log_debug_impl((void *)&_mh_execute_header, v4, v5, "Buddy Activate: Set Display Timer", buf, 2u);
    }
    objc_storeStrong(&v17, 0);
    v6 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v19, "_displayTimerTimeout", 0, 0, 1.0);
    displayTimer = v19->_displayTimer;
    v19->_displayTimer = v6;

    if (v19->_state != 1 && v19->_state != 2 && v19->_state != 6 && v19->_state != 7)
    {
      v8 = dispatch_get_global_queue(0, 0);
      block = _NSConcreteStackBlock;
      v10 = -1073741824;
      v11 = 0;
      v12 = sub_10009F8C4;
      v13 = &unk_100280730;
      v14 = v19;
      dispatch_async(v8, &block);

      objc_storeStrong((id *)&v14, 0);
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  ActivationController *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)ActivationController;
  -[ActivationController viewWillAppear:](&v3, "viewWillAppear:", a3);
  v6->_activationControllerDismissed = 0;
  if ((-[ActivationController isMovingToParentViewController](v6, "isMovingToParentViewController") & 1) == 0)
    -[ActivationController _stopActivationLockExpirationTimer](v6, "_stopActivationLockExpirationTimer");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  ActivationController *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)ActivationController;
  -[ActivationController viewDidAppear:](&v3, "viewDidAppear:", a3);
  if ((v4
     || (-[ActivationController isMovingToParentViewController](v6, "isMovingToParentViewController") & 1) != 0)
    && !v6->_appIsSuspended)
  {
    -[ActivationController _activateIfNecessary](v6, "_activateIfNecessary");
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  NSNotificationCenter *v6;
  objc_super v7;
  uint8_t buf[15];
  os_log_type_t v9;
  os_log_t oslog;
  BOOL v11;
  SEL v12;
  ActivationController *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v3 = -[ActivationController isMovingFromParentViewController](self, "isMovingFromParentViewController");
  if ((v3 & 1) != 0)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v3);
    v9 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v4 = oslog;
      v5 = v9;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "ActivationController Pop.", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    -[ActivationController _clearWaitingForBasebandTimer](v13, "_clearWaitingForBasebandTimer");
    -[ActivationController _clearDisplayTimer](v13, "_clearDisplayTimer");
    -[ActivationController _cleanup](v13, "_cleanup");
    -[ActivationController _releaseOTAAssertion](v13, "_releaseOTAAssertion");
    -[ActivationController _enterState:](v13, "_enterState:", 0);
    objc_storeStrong((id *)&v13->_engine, 0);
  }
  v6 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:](v6, "removeObserver:name:object:", v13, CFSTR("BuddySystemTimeUpdateFinishedNotification"), 0);

  v7.receiver = v13;
  v7.super_class = (Class)ActivationController;
  -[ActivationController viewWillDisappear:](&v7, "viewWillDisappear:", v11);
}

- (void)didResignActive:(id)a3
{
  id location[2];
  ActivationController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4->_appIsSuspended = 1;
  objc_storeStrong(location, 0);
}

- (void)didBecomeActive:(id)a3
{
  BOOL v3;
  char v4;
  ActivationController *v5;
  char v6;
  id v7;
  id location[2];
  ActivationController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9->_appIsSuspended = 0;
  v6 = 0;
  v4 = 0;
  v3 = 0;
  if (!v9->_activationControllerDismissed)
  {
    v7 = -[ActivationController navigationController](v9, "navigationController");
    v6 = 1;
    v5 = (ActivationController *)objc_msgSend(v7, "topViewController");
    v4 = 1;
    v3 = v5 == v9;
  }
  if ((v4 & 1) != 0)

  if ((v6 & 1) != 0)
  if (v3)
    -[ActivationController _activateIfNecessary](v9, "_activateIfNecessary");
  objc_storeStrong(location, 0);
}

- (void)_displayTimerTimeout
{
  NSObject *v2;
  os_log_type_t v3;
  _WORD v4[3];
  os_log_type_t v5;
  os_log_t oslog[2];
  ActivationController *v7;

  v7 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v5;
    sub_100038C3C(v4);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Buddy Activate: Display Timer Fired", (uint8_t *)v4, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  -[ActivationController _clearDisplayTimer](v7, "_clearDisplayTimer");
  v7->_displayTimerElapsed = 1;
  -[ActivationController _enterState:](v7, "_enterState:", v7->_state);
}

- (void)_cleanup
{
  -[BuddyActivationEngine cancel](self->_engine, "cancel", a2, self);
}

- (void)startSpinningWithIdentifier:(id)a3
{
  id v3;
  UIViewController *v4;
  UIViewController *spinningViewController;
  uint64_t v6;
  UIView *v7;
  UIWindow *v8;
  os_log_t oslog;
  id location[2];
  ActivationController *v11;
  uint8_t buf[24];

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[ActivationController navigationController](v11, "navigationController");
  v4 = (UIViewController *)objc_msgSend(v3, "topViewController");
  spinningViewController = v11->_spinningViewController;
  v11->_spinningViewController = v4;

  if (v11->_spinningViewController)
  {
    v7 = -[UIViewController view](v11->_spinningViewController, "view");
    v8 = -[UIView window](v7, "window");
    -[UIWindow setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", 0);

    +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:identifier:](BFFViewControllerSpinnerManager, "startAnimatingSpinnerFor:identifier:", v11->_spinningViewController, location[0]);
  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v6);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
    {
      sub_100038C28((uint64_t)buf, (uint64_t)location[0]);
      _os_log_fault_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_FAULT, "ActivationController: startSpinning has no viewController for %@", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)stopSpinningForIdentifier:(id)a3
{
  uint64_t v3;
  UIView *v4;
  UIWindow *v5;
  os_log_t oslog;
  id location[2];
  ActivationController *v8;
  uint8_t buf[24];

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v8->_spinningViewController)
  {
    v4 = -[UIViewController view](v8->_spinningViewController, "view");
    v5 = -[UIView window](v4, "window");
    -[UIWindow setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 1);

    +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:](BFFViewControllerSpinnerManager, "stopAnimatingSpinnerFor:", location[0]);
    objc_storeStrong((id *)&v8->_spinningViewController, 0);
  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v3);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100038C28((uint64_t)buf, (uint64_t)location[0]);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "ActivationController: Unmatched stopSpinning for %@", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)startRequest:(id)a3 completion:(id)a4
{
  unsigned __int8 v5;
  NSUserDefaults *v6;
  id v7;
  id v8;
  uint64_t v9;
  unint64_t i;
  id v11;
  id v12;
  void *v13;
  id v14;
  void **v15;
  int v16;
  int v17;
  void (*v18)(uint64_t, void *, void *, void *, void *);
  void *v19;
  id v20;
  id v21;
  _QWORD __b[8];
  uint64_t v23;
  id v24;
  char v25;
  id v26;
  char v27;
  id v28;
  id v29;
  id location[2];
  id v31;
  _BYTE v32[128];

  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29 = 0;
  objc_storeStrong(&v29, a4);
  v27 = 0;
  v25 = 0;
  v5 = 0;
  if ((os_variant_allows_internal_security_policies("com.apple.purplebuddy") & 1) != 0)
  {
    v28 = objc_msgSend(location[0], "URL");
    v27 = 1;
    v26 = objc_msgSend(v28, "absoluteString");
    v25 = 1;
    v5 = objc_msgSend(v26, "hasSuffix:", CFSTR("/deviceActivation"));
  }
  if ((v25 & 1) != 0)

  if ((v27 & 1) != 0)
  if ((v5 & 1) != 0)
  {
    v6 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
    v24 = -[NSUserDefaults dictionaryForKey:](v6, "dictionaryForKey:", CFSTR("CustomActivationHeaders"));

    memset(__b, 0, sizeof(__b));
    v7 = v24;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", __b, v32, 16);
    if (v8)
    {
      v9 = *(_QWORD *)__b[2];
      do
      {
        for (i = 0; i < (unint64_t)v8; ++i)
        {
          if (*(_QWORD *)__b[2] != v9)
            objc_enumerationMutation(v7);
          v23 = *(_QWORD *)(__b[1] + 8 * i);
          v11 = location[0];
          v12 = objc_msgSend(v24, "objectForKeyedSubscript:", v23);
          objc_msgSend(v11, "setValue:forHTTPHeaderField:", v12, v23);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", __b, v32, 16);
      }
      while (v8);
    }

    objc_storeStrong(&v24, 0);
  }
  v13 = (void *)*((_QWORD *)v31 + 1);
  v14 = location[0];
  v15 = _NSConcreteStackBlock;
  v16 = -1073741824;
  v17 = 0;
  v18 = sub_1000A057C;
  v19 = &unk_100281DF0;
  v20 = v31;
  v21 = v29;
  objc_msgSend(v13, "makeRequest:completion:", v14, &v15);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
}

- (void)_handleActivationData:(id)a3 responseHeaders:(id)a4 baseURL:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSUserDefaults *v10;
  unsigned __int8 v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  RemoteUIController *v15;
  RemoteUIController *remoteUIController;
  RemoteUIController *v17;
  id v18;
  RemoteUIController *v19;
  id v20;
  RemoteUIController *v21;
  RemoteUIController *v22;
  RemoteUIController *v23;
  RemoteUIController *v24;
  NSURLSessionConfiguration *v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  NSObject *v30;
  NSObject *v31;
  os_log_type_t v32;
  _WORD v33[3];
  os_log_type_t v34;
  os_log_t v35;
  void **block;
  int v37;
  int v38;
  void (*v39)(uint64_t);
  void *v40;
  id v41;
  id v42;
  ActivationController *v43;
  id v44;
  uint8_t v45[7];
  os_log_type_t v46;
  os_log_t v47;
  os_log_type_t v48;
  os_log_t oslog;
  void **v50;
  int v51;
  int v52;
  void (*v53)(id *, void *, void *, void *);
  void *v54;
  id v55;
  void **v56;
  int v57;
  int v58;
  void (*v59)(id *, void *, void *, void *);
  void *v60;
  id v61;
  void **v62;
  int v63;
  int v64;
  void (*v65)(id *, void *, void *, void *);
  void *v66;
  id v67;
  id from;
  uint8_t v69[7];
  os_log_type_t v70;
  id v71;
  os_log_type_t v72;
  id v73;
  os_log_type_t v74;
  id v75[3];
  id v76;
  _BYTE v77[9];
  id v78;
  id v79;
  id location[2];
  ActivationController *v81;
  uint8_t v82[16];
  uint8_t v83[16];
  uint8_t buf[40];

  v81 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v79 = 0;
  objc_storeStrong(&v79, a4);
  v78 = 0;
  objc_storeStrong(&v78, a5);
  *(_QWORD *)&v77[1] = objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("Content-Type"));
  v77[0] = 0;
  v7 = objc_alloc((Class)NSString);
  v76 = objc_msgSend(v7, "initWithData:encoding:", location[0], 4);
  if (*(_QWORD *)&v77[1])
  {
    v8 = objc_msgSend(*(id *)&v77[1], "containsString:", CFSTR("application/x-buddyml"));
    v77[0] = v8 & 1;
  }
  else
  {
    v8 = objc_msgSend(v76, "rangeOfString:", CFSTR("<xmlui"));
    v75[1] = v8;
    v75[2] = v9;
    *(_QWORD *)v77 = v8 != (id)0x7FFFFFFFFFFFFFFFLL;
  }
  v75[0] = (id)_BYLoggingFacility(v8);
  v74 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v75[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_1000A1110((uint64_t)buf, v81->_state, (uint64_t)objc_msgSend(location[0], "length"), *(uint64_t *)&v77[1]);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v75[0], v74, "Buddy Activate: connectionDidFinishLoading state = %d response size = %ld, contentType = %@\n", buf, 0x1Cu);
  }
  objc_storeStrong(v75, 0);
  v10 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
  v11 = -[NSUserDefaults BOOLForKey:](v10, "BOOLForKey:", CFSTR("LogFullActivationResponse"));

  if ((v11 & 1) != 0)
  {
    v73 = (id)_BYLoggingFacility(v12);
    v72 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v73, OS_LOG_TYPE_DEFAULT))
    {
      sub_100038C28((uint64_t)v83, (uint64_t)v76);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v73, v72, "Buddy Activate: Got Response: %@\n", v83, 0xCu);
    }
    objc_storeStrong(&v73, 0);
  }
  if ((v77[0] & 1) != 0)
  {
    v81->_nonSilentActivation = 1;
    v71 = (id)_BYLoggingFacility(v12);
    v70 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v71, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v71;
      v14 = v70;
      sub_100038C3C(v69);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Buddy Activate: Render xmlui\n", v69, 2u);
    }
    objc_storeStrong(&v71, 0);
    -[ActivationController _enterState:](v81, "_enterState:", 4);
    -[RUIPage setLoading:](v81->_loadingPage, "setLoading:", 0);
    objc_storeStrong((id *)&v81->_loadingPage, 0);
    if (!v81->_remoteUIController)
    {
      v15 = (RemoteUIController *)objc_alloc_init((Class)RemoteUIController);
      remoteUIController = v81->_remoteUIController;
      v81->_remoteUIController = v15;

      v17 = v81->_remoteUIController;
      v18 = -[ActivationController navigationController](v81, "navigationController");
      -[RemoteUIController setNavigationController:](v17, "setNavigationController:", v18);

      -[RemoteUIController setDelegate:](v81->_remoteUIController, "setDelegate:");
      v19 = v81->_remoteUIController;
      v20 = +[RUIStyle setupAssistantStyle](RUIStyle, "setupAssistantStyle");
      -[RemoteUIController setStyle:](v19, "setStyle:", v20);

      objc_initWeak(&from, v81);
      v21 = v81->_remoteUIController;
      v62 = _NSConcreteStackBlock;
      v63 = -1073741824;
      v64 = 0;
      v65 = sub_1000A113C;
      v66 = &unk_100281E18;
      objc_copyWeak(&v67, &from);
      -[RemoteUIController setHandlerForElementName:handler:](v21, "setHandlerForElementName:handler:", CFSTR("agree"), &v62);
      v22 = v81->_remoteUIController;
      v56 = _NSConcreteStackBlock;
      v57 = -1073741824;
      v58 = 0;
      v59 = sub_1000A11E4;
      v60 = &unk_100281E18;
      objc_copyWeak(&v61, &from);
      -[RemoteUIController setHandlerForElementName:handler:](v22, "setHandlerForElementName:handler:", CFSTR("disagree"), &v56);
      v23 = v81->_remoteUIController;
      v50 = _NSConcreteStackBlock;
      v51 = -1073741824;
      v52 = 0;
      v53 = sub_1000A128C;
      v54 = &unk_100281E18;
      objc_copyWeak(&v55, &from);
      -[RemoteUIController setHandlerForElementName:handler:](v23, "setHandlerForElementName:handler:", CFSTR("tryAgain"), &v50);
      -[ActivationController _setHandlerForPasscode](v81, "_setHandlerForPasscode");
      objc_destroyWeak(&v55);
      objc_destroyWeak(&v61);
      objc_destroyWeak(&v67);
      objc_destroyWeak(&from);
    }
    v24 = v81->_remoteUIController;
    v25 = -[BuddyActivationEngine sessionConfiguration](v81->_engine, "sessionConfiguration");
    -[RemoteUIController setSessionConfiguration:](v24, "setSessionConfiguration:", v25);

    -[RemoteUIController loadData:baseURL:](v81->_remoteUIController, "loadData:baseURL:", location[0], v78);
  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v12);
    v48 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100046FA0(v82, v81->_state);
      _os_log_impl((void *)&_mh_execute_header, oslog, v48, "Buddy Activate: Non xmlui response! State = %d\n", v82, 8u);
    }
    objc_storeStrong((id *)&oslog, 0);
    if (v81->_state == 1 || v81->_state == 4)
    {
      v27 = -[ActivationController _enterState:](v81, "_enterState:", 2);
      if (!v79)
      {
        v47 = (os_log_t)(id)_BYLoggingFacility(v27);
        v46 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          v28 = v47;
          v29 = v46;
          sub_100038C3C(v45);
          _os_log_impl((void *)&_mh_execute_header, v28, v29, "No headers in activation response!", v45, 2u);
        }
        objc_storeStrong((id *)&v47, 0);
      }
      v30 = dispatch_get_global_queue(25, 0);
      block = _NSConcreteStackBlock;
      v37 = -1073741824;
      v38 = 0;
      v39 = sub_1000A1334;
      v40 = &unk_100280E90;
      v41 = v79;
      v42 = location[0];
      v43 = v81;
      v44 = v76;
      dispatch_async(v30, &block);

      objc_storeStrong(&v44, 0);
      objc_storeStrong((id *)&v43, 0);
      objc_storeStrong(&v42, 0);
      objc_storeStrong(&v41, 0);
    }
    else
    {
      v35 = (os_log_t)(id)_BYLoggingFacility(v26);
      v34 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v31 = v35;
        v32 = v34;
        sub_100038C3C(v33);
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "Buddy Activate: Warning: Unhandled state in connection response.\n", (uint8_t *)v33, 2u);
      }
      objc_storeStrong((id *)&v35, 0);
    }
    -[RUIPage setLoading:](v81->_loadingPage, "setLoading:", 0);
    objc_storeStrong((id *)&v81->_loadingPage, 0);
  }
  -[ActivationController _cleanup](v81, "_cleanup");
  objc_storeStrong(&v76, 0);
  objc_storeStrong((id *)&v77[1], 0);
  objc_storeStrong(&v78, 0);
  objc_storeStrong(&v79, 0);
  objc_storeStrong(location, 0);
}

- (void)_handleFailureWithError:(id)a3
{
  uint64_t v3;
  int state;
  NSString *v5;
  char v6;
  NSString *v7;
  char v8;
  id v9;
  os_log_t oslog;
  id location[2];
  ActivationController *v12;
  uint8_t buf[24];

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    state = v12->_state;
    v8 = 0;
    v6 = 0;
    if ((_BYIsInternalInstall() & 1) != 0)
    {
      v5 = (NSString *)location[0];
    }
    else if (location[0])
    {
      v9 = objc_msgSend(location[0], "domain");
      v8 = 1;
      v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v9, objc_msgSend(location[0], "code"));
      v7 = v5;
      v6 = 1;
    }
    else
    {
      v5 = 0;
    }
    sub_1000503FC((uint64_t)buf, state, (uint64_t)v5);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Buddy Activate: connection failed, state = %d, error = '%{public}@'", buf, 0x12u);
    if ((v6 & 1) != 0)

    if ((v8 & 1) != 0)
  }
  objc_storeStrong((id *)&oslog, 0);
  if (v12->_state != 3)
  {
    v12->_connectionFailed = 1;
    -[ActivationController _enterState:](v12, "_enterState:", 5);
  }
  -[RUIPage setLoading:](v12->_loadingPage, "setLoading:", 0);
  objc_storeStrong((id *)&v12->_loadingPage, 0);
  -[ActivationController _cleanup](v12, "_cleanup");
  objc_storeStrong(location, 0);
}

- (void)_getSRPInitNonceRequestOptionsCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  os_signpost_type_t v7;
  os_signpost_id_t v8;
  id v9;
  id v10;
  void **v11;
  int v12;
  int v13;
  void (*v14)(_QWORD *, void *, void *);
  void *v15;
  id v16[3];
  os_log_type_t v17;
  os_log_t oslog;
  uint8_t buf[16];
  void *v20;
  char v21;
  os_log_t log;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id location[2];
  ActivationController *v32;
  uint8_t v33[24];

  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = -[SecureBackup srpInitNonce](v32->_secureBackup, "srpInitNonce");
  v29 = objc_msgSend(v30, "base64EncodedStringWithOptions:", 0);
  v28 = objc_alloc_init((Class)FMDDeviceIdentityFactory);
  v27 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  if (v29)
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v29, CFSTR("nonce"));
  v26 = 0;
  v25 = 0;
  v3 = (id)_BYSignpostSubsystem();
  v4 = (void *)_BYSignpostCreate(v3);
  v24 = v5;
  v23 = v4;

  log = (os_log_t)(id)_BYSignpostSubsystem();
  v21 = 1;
  v20 = v23;
  if (v23 && v20 != (void *)-1 && os_signpost_enabled(log))
  {
    v6 = log;
    v7 = v21;
    v8 = (os_signpost_id_t)v20;
    sub_100038C3C(buf);
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, v7, v8, "ActivationFindMyIdentity", ", buf, 2u);
  }
  objc_storeStrong((id *)&log, 0);
  oslog = (os_log_t)(id)_BYSignpostSubsystem();
  v17 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000342B4((uint64_t)v33, (uint64_t)v23);
    _os_log_impl((void *)&_mh_execute_header, oslog, v17, "BEGIN [%lld]: ActivationFindMyIdentity ", v33, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v25 = v23;
  v26 = v24;
  v9 = v28;
  v10 = v27;
  v11 = _NSConcreteStackBlock;
  v12 = -1073741824;
  v13 = 0;
  v14 = sub_1000A1FF8;
  v15 = &unk_100281E40;
  v16[1] = v23;
  v16[2] = v24;
  v16[0] = location[0];
  objc_msgSend(v9, "identityForPasscodeActivationUnlockWithContext:completion:", v10, &v11);
  objc_storeStrong(v16, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

- (void)_tryActivateWithOptions:(id)a3 requestMutator:(id)a4
{
  id v5;
  unsigned __int8 v6;
  void *v7;
  BuddyActivationEngine *engine;
  id v9;
  id v10;
  void **v11;
  int v12;
  int v13;
  void (*v14)(id *, void *, void *, void *, void *);
  void *v15;
  ActivationController *v16;
  int v17;
  void **block;
  int v19;
  int v20;
  id (*v21)(uint64_t);
  void *v22;
  ActivationController *v23;
  id v24;
  id location[2];
  ActivationController *v26;

  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v24 = 0;
  objc_storeStrong(&v24, a4);
  v5 = +[BYPreferencesController buddyPreferencesInternal](BYPreferencesController, "buddyPreferencesInternal");
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("ForceActivationFailure"));

  if ((v6 & 1) != 0)
  {
    v7 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    v19 = -1073741824;
    v20 = 0;
    v21 = sub_1000A2570;
    v22 = &unk_100280730;
    v23 = v26;
    dispatch_async((dispatch_queue_t)v7, &block);

    v17 = 1;
    objc_storeStrong((id *)&v23, 0);
  }
  else
  {
    if (v26->_engine)
    {
      engine = v26->_engine;
      v9 = location[0];
      v10 = v24;
      v11 = _NSConcreteStackBlock;
      v12 = -1073741824;
      v13 = 0;
      v14 = sub_1000A259C;
      v15 = &unk_100281E68;
      v16 = v26;
      -[BuddyActivationEngine tryActivateWithOptions:requestMutator:completion:](engine, "tryActivateWithOptions:requestMutator:completion:", v9, v10, &v11);
      objc_storeStrong((id *)&v16, 0);
    }
    v17 = 0;
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
}

- (void)_startActivation
{
  NSDate *v2;
  NSDate *startedActivationDate;
  BuddyActivationState *v4;
  id v5;
  char v6;
  CFTypeID v7;
  NSURL *v8;
  id v9;
  CFTypeID v10;
  NSURL *v11;
  id v12;
  CFPropertyListRef v13;
  CFTypeID v14;
  CFTypeID v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  id v21;
  id v22;
  BuddyActivationEngine *v23;
  BuddyActivationEngine *engine;
  NSObject *v25;
  os_log_type_t v26;
  BuddyActivationEngine *v27;
  BuddyActivationEngine *v28;
  ActivationController *v29;
  void **v30;
  int v31;
  int v32;
  void (*v33)(id *, void *);
  void *v34;
  ActivationController *v35;
  uint8_t v36[15];
  os_log_type_t v37;
  os_log_t v38[2];
  CFTypeRef v39;
  uint8_t __b[40];
  uint8_t v41[15];
  os_log_type_t v42;
  os_log_t v43;
  os_log_type_t v44;
  os_log_t v45;
  os_log_type_t v46;
  os_log_t v47;
  os_log_type_t v48;
  os_log_t oslog;
  CFTypeRef cf;
  CFTypeRef v51;
  CFTypeRef v52;
  char v53;
  id location;
  id v55;
  char v56;
  BuddyNetworkProvider *v57;
  char v58;
  BuddyNetworkProvider *v59;
  char v60;
  SEL v61;
  ActivationController *v62;
  uint8_t v63[16];
  uint8_t v64[16];
  uint8_t buf[24];

  v62 = self;
  v61 = a2;
  objc_storeStrong((id *)&self->_escrowSessionKey, 0);
  objc_storeStrong((id *)&v62->_srpInitResponse, 0);
  objc_storeStrong((id *)&v62->_accountDSID, 0);
  v62->_hasPresentedRemoteUI = 0;
  v2 = +[NSDate date](NSDate, "date");
  startedActivationDate = v62->_startedActivationDate;
  v62->_startedActivationDate = v2;

  -[ActivationController _enterState:](v62, "_enterState:", 1);
  v62->_cdmaSelectionActivation = 0;
  v62->_connectionFailed = 0;
  v4 = -[ActivationController activationState](v62, "activationState");
  -[BuddyActivationState setError:](v4, "setError:", 0);

  v60 = 0;
  v5 = +[BuddyActivationConfiguration currentConfiguration](BuddyActivationConfiguration, "currentConfiguration");
  v58 = 0;
  v56 = 0;
  v6 = 0;
  if ((objc_msgSend(v5, "supportsCellularActivation") & 1) != 0)
  {
    v59 = -[ActivationController networkProvider](v62, "networkProvider");
    v58 = 1;
    v6 = 1;
    if (-[BuddyNetworkProvider networkReachable](v59, "networkReachable"))
    {
      v57 = -[ActivationController networkProvider](v62, "networkProvider");
      v56 = 1;
      v6 = !-[BuddyNetworkProvider connectedOverWiFi](v57, "connectedOverWiFi");
    }
  }
  if ((v56 & 1) != 0)

  if ((v58 & 1) != 0)
  v60 = v6 & 1;
  v55 = 0;
  location = 0;
  v53 = 0;
  v52 = CFPreferencesCopyAppValue(CFSTR("ActivationURL"), CFSTR("com.apple.purplebuddy"));
  if (v52)
  {
    v7 = CFGetTypeID(v52);
    if (v7 == CFStringGetTypeID())
    {
      v8 = +[NSURL URLWithString:](NSURL, "URLWithString:", v52);
      v9 = v55;
      v55 = v8;

    }
    CFRelease(v52);
  }
  v51 = CFPreferencesCopyAppValue(CFSTR("ActivationSessionURL"), CFSTR("com.apple.purplebuddy"));
  if (v51)
  {
    v10 = CFGetTypeID(v51);
    if (v10 == CFStringGetTypeID())
    {
      v11 = +[NSURL URLWithString:](NSURL, "URLWithString:", v51);
      v12 = location;
      location = v11;

    }
    CFRelease(v51);
  }
  v13 = CFPreferencesCopyAppValue(CFSTR("ActivationAllowAnyHTTPSCertificate"), CFSTR("com.apple.purplebuddy"));
  cf = v13;
  if (v13)
  {
    v14 = CFGetTypeID(cf);
    if (v14 == CFStringGetTypeID())
    {
      v53 = objc_msgSend((id)cf, "BOOLValue") & 1;
    }
    else
    {
      v15 = CFGetTypeID(cf);
      if (v15 == CFBooleanGetTypeID())
        v53 = cf == kCFBooleanTrue;
    }
    CFRelease(cf);
  }
  oslog = (os_log_t)(id)_BYLoggingFacility(v13);
  v48 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100038C28((uint64_t)buf, (uint64_t)v55);
    _os_log_impl((void *)&_mh_execute_header, oslog, v48, "Buddy Activate: Got activation URL override: %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v47 = (os_log_t)(id)_BYLoggingFacility(v16);
  v46 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    sub_100038C28((uint64_t)v64, (uint64_t)location);
    _os_log_impl((void *)&_mh_execute_header, v47, v46, "Buddy Activate: Got session URL override: %@", v64, 0xCu);
  }
  objc_storeStrong((id *)&v47, 0);
  v45 = (os_log_t)(id)_BYLoggingFacility(v17);
  v44 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    sub_100046FA0(v63, v53 & 1);
    _os_log_impl((void *)&_mh_execute_header, v45, v44, "Buddy Activate: Allow any HTTPS certificate = %d", v63, 8u);
  }
  objc_storeStrong((id *)&v45, 0);
  v18 = -[BuddyActivationEngine cancel](v62->_engine, "cancel");
  if ((v60 & 1) != 0)
  {
    v43 = (os_log_t)(id)_BYLoggingFacility(v18);
    v42 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v43;
      v20 = v42;
      sub_100038C3C(v41);
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Creating Activation Connection OTA.", v41, 2u);
    }
    objc_storeStrong((id *)&v43, 0);
    v62->_connectionOTA = 1;
    v21 = +[BuddyActivationConfiguration currentConfiguration](BuddyActivationConfiguration, "currentConfiguration");
    v22 = objc_msgSend(v21, "cellularActivationMethod");

    if (v22)
    {
      if (v22 == (id)1)
      {
        v62->_usingBootstrap = 1;
LABEL_37:
        v23 = (BuddyActivationEngine *)+[BuddyActivationEngine cellularActivationEngineWithOverrideActivationURL:sessionURL:usingBootstrap:](BuddyActivationEngine, "cellularActivationEngineWithOverrideActivationURL:sessionURL:usingBootstrap:", v55, location, v62->_usingBootstrap);
        engine = v62->_engine;
        v62->_engine = v23;

        if (!v62->_otaAssertion)
        {
          memset(__b, 0, sizeof(__b));
          v39 = (CFTypeRef)_CTServerConnectionCreate(kCFAllocatorDefault, sub_1000A2F20, __b);
          if (v39)
          {
            v38[1] = (os_log_t)_CTServerConnectionOTAActivationAssertionCreate(v39, CFSTR("iOSSetupAssistant"), &v62->_otaAssertion);
            CFRelease(v39);
          }
        }
        goto LABEL_44;
      }
      if (v22 != (id)2)
        goto LABEL_37;
    }
    v62->_usingBootstrap = 0;
    goto LABEL_37;
  }
  v38[0] = (os_log_t)(id)_BYLoggingFacility(v18);
  v37 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v38[0], OS_LOG_TYPE_DEFAULT))
  {
    v25 = v38[0];
    v26 = v37;
    sub_100038C3C(v36);
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "Creating Activation Connection WiFi.", v36, 2u);
  }
  objc_storeStrong((id *)v38, 0);
  v62->_connectionOTA = 0;
  v62->_usingBootstrap = 0;
  v27 = (BuddyActivationEngine *)+[BuddyActivationEngine wifiActivationEngineWithOverrideActivationURL:sessionURL:](BuddyActivationEngine, "wifiActivationEngineWithOverrideActivationURL:sessionURL:", v55, location);
  v28 = v62->_engine;
  v62->_engine = v27;

LABEL_44:
  -[BuddyActivationEngine setAllowAnyHTTPSCertificate:](v62->_engine, "setAllowAnyHTTPSCertificate:", v53 & 1);
  v29 = v62;
  v30 = _NSConcreteStackBlock;
  v31 = -1073741824;
  v32 = 0;
  v33 = sub_1000A2F3C;
  v34 = &unk_100281E90;
  v35 = v62;
  -[ActivationController _getSRPInitNonceRequestOptionsCompletion:](v29, "_getSRPInitNonceRequestOptionsCompletion:", &v30);
  objc_storeStrong((id *)&v35, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v55, 0);
}

- (void)_checkBasebandStatusBeforeActivation
{
  const void *v2;
  CFTypeID v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  NSObject *v9;
  os_log_type_t v10;
  NSObject *v11;
  os_log_type_t v12;
  NSObject *v13;
  os_log_type_t v14;
  NSTimer *v15;
  NSTimer *waitingForBasebandTimer;
  _WORD v17[3];
  os_log_type_t v18;
  os_log_t v19;
  uint8_t v20[7];
  os_log_type_t v21;
  os_log_t v22;
  uint8_t v23[7];
  os_log_type_t v24;
  os_log_t v25;
  uint8_t v26[7];
  os_log_type_t v27;
  os_log_t v28;
  os_log_type_t v29;
  os_log_t oslog;
  CFTypeRef cf;
  BOOL v32;
  char v33;
  SEL v34;
  ActivationController *v35;
  uint8_t buf[24];

  v35 = self;
  v34 = a2;
  v33 = 0;
  v32 = 0;
  v2 = (const void *)MGCopyAnswer(CFSTR("BasebandStatus"), 0);
  cf = v2;
  if (v2)
  {
    v3 = CFGetTypeID(cf);
    if (v3 == CFStringGetTypeID())
    {
      v4 = objc_msgSend((id)cf, "isEqualToString:", kCTPostponementStatusNotReady);
      v5 = 1;
      if ((v4 & 1) == 0)
        v5 = objc_msgSend((id)cf, "isEqualToString:", CFSTR("BBNotReady"));
      v33 = v5 & 1;
      v6 = objc_msgSend((id)cf, "length");
      v32 = v6 != 0;
      oslog = (os_log_t)(id)_BYLoggingFacility(v6);
      v29 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        sub_1000A33AC((uint64_t)buf, (uint64_t)cf, v33 & 1);
        _os_log_impl((void *)&_mh_execute_header, oslog, v29, "Buddy Activate: _checkBasebandStatusBeforeActivation = %@, notReady = %d", buf, 0x12u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    CFRelease(cf);
  }
  if ((v33 & 1) == 0 && v32)
  {
    -[ActivationController _startActivation](v35, "_startActivation");
  }
  else if ((float)((float)++v35->_waitingForBasebandFailureCount * 2.0) <= 120.0)
  {
    if (v32)
    {
      v22 = (os_log_t)(id)_BYLoggingFacility(v2);
      v21 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v22;
        v12 = v21;
        sub_100038C3C(v20);
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "Buddy Activate: BasebandStatus = NotReady. Waiting for Baseband.", v20, 2u);
      }
      objc_storeStrong((id *)&v22, 0);
    }
    else
    {
      v19 = (os_log_t)(id)_BYLoggingFacility(v2);
      v18 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v19;
        v14 = v18;
        sub_100038C3C(v17);
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "Buddy Activate: Unable to read BasebandStatus. Waiting for Baseband.", (uint8_t *)v17, 2u);
      }
      objc_storeStrong((id *)&v19, 0);
    }
    -[ActivationController _enterState:](v35, "_enterState:", 7);
    v15 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v35, "_waitingForBasebandTimeout", 0, 0, 2.0);
    waitingForBasebandTimer = v35->_waitingForBasebandTimer;
    v35->_waitingForBasebandTimer = v15;

  }
  else
  {
    if (v32)
    {
      v28 = (os_log_t)(id)_BYLoggingFacility(v2);
      v27 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v7 = v28;
        v8 = v27;
        sub_100038C3C(v26);
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "Buddy Activate: BasebandStatus = NotReady. Too many failures.", v26, 2u);
      }
      objc_storeStrong((id *)&v28, 0);
    }
    else
    {
      v25 = (os_log_t)(id)_BYLoggingFacility(v2);
      v24 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v25;
        v10 = v24;
        sub_100038C3C(v23);
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "Buddy Activate: Unable to read BasebandStatus. Too many failures.", v23, 2u);
      }
      objc_storeStrong((id *)&v25, 0);
    }
    -[ActivationController _enterState:](v35, "_enterState:", 5);
  }
}

- (void)_clearWaitingForBasebandTimer
{
  -[NSTimer invalidate](self->_waitingForBasebandTimer, "invalidate", a2);
  objc_storeStrong((id *)&self->_waitingForBasebandTimer, 0);
}

- (void)_waitingForBasebandTimeout
{
  -[ActivationController _clearWaitingForBasebandTimer](self, "_clearWaitingForBasebandTimer", a2);
  -[ActivationController _checkBasebandStatusBeforeActivation](self, "_checkBasebandStatusBeforeActivation");
}

- (void)_sanitizeSystemTime
{
  NSString *v2;
  uint64_t v3;
  double v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  timeval v6;
  __darwin_time_t v7;
  double v8;
  os_log_type_t v9;
  os_log_t oslog;
  id location;
  id v12[3];
  uint8_t buf[24];

  v12[2] = self;
  v12[1] = (id)a2;
  v12[0] = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v12[0], "setDateFormat:", CFSTR("MMM d yyyy"));
  v2 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", "Aug  6 2024", 1);
  location = objc_msgSend(v12[0], "dateFromString:", v2);

  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100038C28((uint64_t)buf, (uint64_t)location);
    _os_log_impl((void *)&_mh_execute_header, oslog, v9, "Setting Device to default date: %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_msgSend(location, "timeIntervalSince1970");
  v8 = v4;
  v7 = (uint64_t)rint(v4);
  memset(&v6, 0, sizeof(v6));
  v6.tv_sec = v7;
  v6.tv_usec = 0;
  settimeofday(&v6, 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SignificantTimeChangeNotification"), 0, 0, 1u);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v12, 0);
}

- (void)_systemTimeUpdated
{
  NSNotificationCenter *v2;
  BuddySystemTimeUpdateManager *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _WORD v8[3];
  os_log_type_t v9;
  os_log_t oslog[2];
  ActivationController *v11;

  v11 = self;
  oslog[1] = (os_log_t)a2;
  v2 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:](v2, "removeObserver:name:object:", v11, CFSTR("BuddySystemTimeUpdateFinishedNotification"), 0);

  v3 = -[ActivationController systemTimeUpdateManager](v11, "systemTimeUpdateManager");
  v4 = -[BuddySystemTimeUpdateManager status](v3, "status");

  if (v4 == (id)3)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(v5);
    v9 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      v6 = oslog[0];
      v7 = v9;
      sub_100038C3C(v8);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Device Time Update failed.", (uint8_t *)v8, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    -[ActivationController _sanitizeSystemTime](v11, "_sanitizeSystemTime");
  }
  -[ActivationController _checkBasebandStatusBeforeActivation](v11, "_checkBasebandStatusBeforeActivation");
}

- (void)_activate
{
  double v2;
  BuddySystemTimeUpdateManager *v3;
  id v4;
  NSNotificationCenter *v5;
  id location[2];
  ActivationController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = +[NSDate date](NSDate, "date");
  v7->_waitingForBasebandFailureCount = 0;
  objc_msgSend(location[0], "timeIntervalSince1970");
  if (v2 < 315532800.0)
  {
    v3 = -[ActivationController systemTimeUpdateManager](v7, "systemTimeUpdateManager");
    v4 = -[BuddySystemTimeUpdateManager status](v3, "status");

    if (v4 == (id)1)
    {
      -[ActivationController _enterState:](v7, "_enterState:", 6);
      v5 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
      -[NSNotificationCenter addObserver:selector:name:object:](v5, "addObserver:selector:name:object:", v7, "_systemTimeUpdated", CFSTR("BuddySystemTimeUpdateFinishedNotification"), 0);

    }
    else
    {
      -[ActivationController _sanitizeSystemTime](v7, "_sanitizeSystemTime");
    }
  }
  if (v7->_state != 6)
    -[ActivationController _checkBasebandStatusBeforeActivation](v7, "_checkBasebandStatusBeforeActivation");
  objc_storeStrong(location, 0);
}

- (void)_dismissRemoteUI
{
  os_log_t oslog[2];
  ActivationController *v3;
  uint8_t buf[8];

  v3 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_100046FA0(buf, v3->_state);
    _os_log_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEFAULT, "Buddy Activate: Dismiss RemoteUI, state = %d", buf, 8u);
  }
  objc_storeStrong((id *)oslog, 0);
  -[ActivationController _enterState:](v3, "_enterState:", 5);
}

- (void)_writeAcknowledgment
{
  NSObject *v2;

  v2 = dispatch_get_global_queue(0, 0);
  dispatch_async(v2, &stru_100281EB0);

}

- (void)_startActivationLockExpirationTimerForPage:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  NSTimer *v9;
  NSTimer *activationLockTimer;
  void **v11;
  int v12;
  int v13;
  void (*v14)(NSObject *, void *);
  void *v15;
  ActivationController *v16;
  uint8_t v17[7];
  os_log_type_t v18;
  os_log_t oslog;
  uint8_t buf[15];
  os_log_type_t v21;
  id v22;
  id location[2];
  ActivationController *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = (id)_BYLoggingFacility(v3);
  v21 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v22;
    v5 = v21;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Starting Activation Lock Expiration timer", buf, 2u);
  }
  objc_storeStrong(&v22, 0);
  if (v24->_activationLockTimer)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v6);
    v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = oslog;
      v8 = v18;
      sub_100038C3C(v17);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Buddy Activate: Pushing a second Activation lock page?", v17, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    -[NSTimer invalidate](v24->_activationLockTimer, "invalidate");
  }
  objc_storeStrong((id *)&v24->_activationLockPage, location[0]);
  v11 = _NSConcreteStackBlock;
  v12 = -1073741824;
  v13 = 0;
  v14 = sub_1000A3CA4;
  v15 = &unk_100281ED8;
  v16 = v24;
  v9 = +[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v11, 3600.0);
  activationLockTimer = v24->_activationLockTimer;
  v24->_activationLockTimer = v9;

  objc_storeStrong((id *)&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)_stopActivationLockExpirationTimer
{
  NSObject *v2;
  os_log_type_t v3;
  _WORD v4[3];
  os_log_type_t v5;
  os_log_t oslog[2];
  ActivationController *v7;

  v7 = self;
  oslog[1] = (os_log_t)a2;
  if (self->_activationLockTimer)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
    v5 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      v2 = oslog[0];
      v3 = v5;
      sub_100038C3C(v4);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Stopping Activation Lock Expiration timer", (uint8_t *)v4, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    objc_storeStrong((id *)&v7->_activationLockPage, 0);
    -[NSTimer invalidate](v7->_activationLockTimer, "invalidate");
    objc_storeStrong((id *)&v7->_activationLockTimer, 0);
  }
}

- (void)agreeToRemoteUIDialog
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  UIAlertAction *v10;
  id v11;
  UIAlertAction *v12;
  void **v13;
  uint64_t v14;
  void (*v15)(id *, void *);
  void *v16;
  ActivationController *v17;
  id location;
  id v19;
  id v20;
  id v21;
  id v22[2];
  ActivationController *v23;

  v23 = self;
  v22[1] = (id)a2;
  -[ActivationController _cleanup](self, "_cleanup");
  v2 = -[NSMutableArray lastObject](v23->_objectModels, "lastObject");
  v3 = objc_msgSend(v2, "clientInfo");
  v22[0] = objc_msgSend(v3, "objectForKey:", CFSTR("agreeDialogTitle"));

  v4 = -[NSMutableArray lastObject](v23->_objectModels, "lastObject");
  v5 = objc_msgSend(v4, "clientInfo");
  v21 = objc_msgSend(v5, "objectForKey:", CFSTR("agreeDialogText"));

  v6 = -[NSMutableArray lastObject](v23->_objectModels, "lastObject");
  v7 = objc_msgSend(v6, "clientInfo");
  v20 = objc_msgSend(v7, "objectForKey:", CFSTR("agreeDialogOK"));

  v8 = -[NSMutableArray lastObject](v23->_objectModels, "lastObject");
  v9 = objc_msgSend(v8, "clientInfo");
  v19 = objc_msgSend(v9, "objectForKey:", CFSTR("agreeDialogCancel"));

  if (v21 && v20 && v19)
  {
    location = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v22[0], v21, 1);
    v10 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v19, 1, 0);
    objc_msgSend(location, "addAction:", v10);

    v11 = location;
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_1000A4260;
    v16 = &unk_100280A28;
    v17 = v23;
    v12 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v20, 0, &v13);
    objc_msgSend(v11, "addAction:", v12, v13, v14, v15, v16);

    -[ActivationController presentViewController:animated:completion:](v23, "presentViewController:animated:completion:", location, 1, 0);
    objc_storeStrong((id *)&v17, 0);
    objc_storeStrong(&location, 0);
  }
  else
  {
    -[ActivationController _userAgreedToTCs:](v23, "_userAgreedToTCs:", 1);
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(v22, 0);
}

- (void)disagreeToRemoteUIDialog
{
  -[ActivationController _cleanup](self, "_cleanup", a2);
  -[ActivationController _userAgreedToTCs:](self, "_userAgreedToTCs:", 0);
}

- (void)tryAgainOnRemoteUIDialog
{
  id v2;
  id v3;

  -[ActivationController _cleanup](self, "_cleanup", a2);
  self->_state = 0;
  v2 = -[ActivationController navigationController](self, "navigationController");
  v3 = objc_msgSend(v2, "popToViewController:animated:", self, 1);

}

- (BOOL)isEphemeral
{
  return 0;
}

- (void)_stashPasteboard
{
  UIPasteboard *v2;
  NSArray *v3;
  NSArray *previousPasteboard;
  UIPasteboard *v5;

  v2 = +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard", a2);
  v3 = -[UIPasteboard strings](v2, "strings");
  previousPasteboard = self->_previousPasteboard;
  self->_previousPasteboard = v3;

  v5 = +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
  -[UIPasteboard setStrings:](v5, "setStrings:", 0);

}

- (void)_restorePasteboard
{
  BOOL v2;
  UIPasteboard *v3;
  char v4;
  NSArray *v5;
  char v6;
  UIPasteboard *v7;

  v6 = 0;
  v4 = 0;
  v2 = 0;
  if (self->_previousPasteboard)
  {
    v7 = +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
    v6 = 1;
    v5 = -[UIPasteboard strings](v7, "strings");
    v4 = 1;
    v2 = -[NSArray count](v5, "count") == 0;
  }
  if ((v4 & 1) != 0)

  if ((v6 & 1) != 0)
  if (v2)
  {
    v3 = +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
    -[UIPasteboard setStrings:](v3, "setStrings:", self->_previousPasteboard);

    objc_storeStrong((id *)&self->_previousPasteboard, 0);
  }
}

- (void)activationConfigurationChanged:(BOOL)a3 isActivated:(BOOL)a4
{
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  void **v7;
  int v8;
  int v9;
  id (*v10)(uint64_t);
  void *v11;
  ActivationController *v12;
  BOOL v13;
  uint8_t buf[15];
  os_log_type_t v15;
  id location;
  BOOL v17;
  BOOL v18;
  SEL v19;
  ActivationController *v20;

  v20 = self;
  v19 = a2;
  v18 = a3;
  v17 = a4;
  if (a3)
  {
    location = (id)_BYLoggingFacility(self);
    v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      v4 = location;
      v5 = v15;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Buddy Activate: Activation State Changed!", buf, 2u);
    }
    objc_storeStrong(&location, 0);
    v6 = &_dispatch_main_q;
    v7 = _NSConcreteStackBlock;
    v8 = -1073741824;
    v9 = 0;
    v10 = sub_1000A4698;
    v11 = &unk_100280B18;
    v12 = v20;
    v13 = v17;
    dispatch_async((dispatch_queue_t)v6, &v7);

    objc_storeStrong((id *)&v12, 0);
  }
}

- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5
{
  id v7;
  RUIPage *v8;
  RUIPage *loadingPage;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  BuddyMiscState *v14;
  id v15;
  id v16;
  unsigned __int8 v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v23;
  os_log_type_t v24;
  os_log_t oslog;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  int v31;
  id v32;
  id v33;
  id location[2];
  ActivationController *v35;
  char v36;
  uint8_t buf[24];

  v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v33 = 0;
  objc_storeStrong(&v33, a4);
  v32 = 0;
  objc_storeStrong(&v32, a5);
  if (v35->_state == 3)
  {
    v36 = 0;
    v31 = 1;
  }
  else
  {
    -[ActivationController _cleanup](v35, "_cleanup");
    -[RUIPage setLoading:](v35->_loadingPage, "setLoading:", 0);
    v7 = -[NSMutableArray lastObject](v35->_objectModels, "lastObject");
    v8 = (RUIPage *)objc_msgSend(v7, "visiblePage");
    loadingPage = v35->_loadingPage;
    v35->_loadingPage = v8;

    -[RUIPage setLoading:](v35->_loadingPage, "setLoading:", 1);
    v10 = -[NSMutableArray lastObject](v35->_objectModels, "lastObject");
    v11 = objc_msgSend(v10, "clientInfo");
    v30 = objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("elementIdForiCloudAppleId"));

    if (!objc_msgSend(v30, "length"))
      objc_storeStrong(&v30, CFSTR("login"));
    v12 = -[NSMutableArray lastObject](v35->_objectModels, "lastObject");
    v29 = objc_msgSend(v12, "rowForFormField:", v30);

    if (v29)
    {
      v28 = objc_alloc_init((Class)NSMutableDictionary);
      objc_msgSend(v29, "populatePostbackDictionary:", v28);
      v27 = objc_msgSend(v28, "objectForKeyedSubscript:", v30);
      if (v27)
      {
        v13 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v27, v13) & 1) != 0)
        {
          v14 = -[ActivationController miscState](v35, "miscState");
          -[BuddyMiscState setICloudAppleIdFromActivation:](v14, "setICloudAppleIdFromActivation:", v27);

        }
      }
      objc_storeStrong(&v27, 0);
      objc_storeStrong(&v28, 0);
    }
    v26 = 0;
    v15 = objc_msgSend(v33, "HTTPMethod");
    v16 = objc_msgSend(v15, "lowercaseString");
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("post"));

    if ((v17 & 1) != 0)
    {
      v19 = -[NSMutableArray lastObject](v35->_objectModels, "lastObject");
      v20 = objc_msgSend(v19, "postbackData");
      v21 = v26;
      v26 = v20;

    }
    if (v26)
    {
      objc_msgSend(v33, "setHTTPBody:", v26);
      objc_msgSend(v33, "setHTTPMethod:", CFSTR("POST"));
      v18 = objc_msgSend(v33, "setValue:forHTTPHeaderField:", CFSTR("application/x-plist"), CFSTR("Content-Type"));
    }
    oslog = (os_log_t)(id)_BYLoggingFacility(v18);
    v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend(v33, "URL");
      sub_100038C28((uint64_t)buf, (uint64_t)v23);
      _os_log_impl((void *)&_mh_execute_header, oslog, v24, "Buddy Activate: RemoteUI hand off of request for URL %@", buf, 0xCu);

      objc_storeStrong(&v23, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    -[ActivationController startRequest:completion:](v35, "startRequest:completion:", v33, 0);
    v36 = 0;
    v31 = 1;
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
  }
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
  return v36 & 1;
}

- (void)_handleEscrowResponse:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t isKindOfClass;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSData *v14;
  NSData *srpInitResponse;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSString *v19;
  NSObject *v20;
  os_log_type_t v21;
  id v22;
  os_log_type_t v23;
  os_log_t v24;
  uint8_t v25[15];
  os_log_type_t v26;
  os_log_t v27;
  char v28;
  id v29;
  char v30;
  id v31;
  id v32;
  os_log_type_t v33;
  os_log_t v34;
  id v35;
  os_log_type_t v36;
  os_log_t v37;
  id v38;
  id v39;
  os_log_type_t v40;
  os_log_t v41;
  id v42;
  id v43;
  os_log_type_t v44;
  os_log_t oslog;
  id v46;
  id obj;
  id v48;
  id v49;
  id v50;
  id v51;
  id location[2];
  ActivationController *v53;
  uint8_t v54[16];
  uint8_t v55[32];
  uint8_t v56[16];
  uint8_t v57[16];
  uint8_t buf[24];

  v53 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = location[0];
  v4 = objc_opt_class(NSString);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);
  if ((isKindOfClass & 1) != 0)
  {
    v51 = location[0];
    v50 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v51, 1);
    if (v50)
    {
      v49 = 0;
      obj = 0;
      v6 = +[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v50, 0, &obj);
      objc_storeStrong(&v49, obj);
      v48 = v6;
      if (v49
        || (v8 = v48, v9 = objc_opt_class(NSDictionary),
                      v7 = objc_opt_isKindOfClass(v8, v9),
                      (v7 & 1) == 0))
      {
        v34 = (os_log_t)(id)_BYLoggingFacility(v7);
        v33 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v18 = (id)objc_opt_class(v48);
          v32 = v18;
          v30 = 0;
          v28 = 0;
          if ((_BYIsInternalInstall() & 1) != 0)
          {
            v19 = (NSString *)v49;
          }
          else if (v49)
          {
            v31 = objc_msgSend(v49, "domain");
            v30 = 1;
            v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v31, objc_msgSend(v49, "code"));
            v29 = v19;
            v28 = 1;
          }
          else
          {
            v19 = 0;
          }
          sub_10003A6BC((uint64_t)v55, (uint64_t)v18, (uint64_t)v19);
          _os_log_impl((void *)&_mh_execute_header, v34, v33, "Buddy Activate: Failed to json-decode esecrowResponse. json type = %{public}@, error = %{public}@", v55, 0x16u);
          if ((v28 & 1) != 0)

          if ((v30 & 1) != 0)
          objc_storeStrong(&v32, 0);
        }
        objc_storeStrong((id *)&v34, 0);
      }
      else
      {
        v46 = objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("escrowSessionKey"));
        v10 = objc_opt_class(NSString);
        v11 = objc_opt_isKindOfClass(v46, v10);
        if ((v11 & 1) != 0)
        {
          objc_storeStrong((id *)&v53->_escrowSessionKey, v46);
        }
        else
        {
          oslog = (os_log_t)(id)_BYLoggingFacility(v11);
          v44 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            v43 = (id)objc_opt_class(v46);
            sub_100039500((uint64_t)buf, (uint64_t)v43);
            _os_log_impl((void *)&_mh_execute_header, oslog, v44, "Buddy Activate: Escrow session key was not a string, it was a %{public}@", buf, 0xCu);
            objc_storeStrong(&v43, 0);
          }
          objc_storeStrong((id *)&oslog, 0);
        }
        v42 = objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("responseBlob"));
        v12 = objc_opt_class(NSString);
        v13 = objc_opt_isKindOfClass(v42, v12);
        if ((v13 & 1) != 0)
        {
          v14 = (NSData *)objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v42, 0);
          srpInitResponse = v53->_srpInitResponse;
          v53->_srpInitResponse = v14;

        }
        else
        {
          v41 = (os_log_t)(id)_BYLoggingFacility(v13);
          v40 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v39 = (id)objc_opt_class(v42);
            sub_100039500((uint64_t)v57, (uint64_t)v39);
            _os_log_impl((void *)&_mh_execute_header, v41, v40, "Buddy Activate: SRP Init Response was not a string, it was a %{public}@", v57, 0xCu);
            objc_storeStrong(&v39, 0);
          }
          objc_storeStrong((id *)&v41, 0);
        }
        v38 = objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("uniqueId"));
        v16 = objc_opt_class(NSString);
        v17 = objc_opt_isKindOfClass(v38, v16);
        if ((v17 & 1) != 0)
        {
          objc_storeStrong((id *)&v53->_accountDSID, v38);
        }
        else
        {
          v37 = (os_log_t)(id)_BYLoggingFacility(v17);
          v36 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            v35 = (id)objc_opt_class(v38);
            sub_100039500((uint64_t)v56, (uint64_t)v35);
            _os_log_impl((void *)&_mh_execute_header, v37, v36, "Buddy Activate: UniqueID was not a string, it was a %{public}@", v56, 0xCu);
            objc_storeStrong(&v35, 0);
          }
          objc_storeStrong((id *)&v37, 0);
        }
        objc_storeStrong(&v38, 0);
        objc_storeStrong(&v42, 0);
        objc_storeStrong(&v46, 0);
      }
      objc_storeStrong(&v48, 0);
      objc_storeStrong(&v49, 0);
    }
    else
    {
      v27 = (os_log_t)(id)_BYLoggingFacility(0);
      v26 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v20 = v27;
        v21 = v26;
        sub_100038C3C(v25);
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "Buddy Activate: Could not base64-decode escrowResponse", v25, 2u);
      }
      objc_storeStrong((id *)&v27, 0);
    }
    objc_storeStrong(&v50, 0);
    objc_storeStrong(&v51, 0);
  }
  else
  {
    v24 = (os_log_t)(id)_BYLoggingFacility(isKindOfClass);
    v23 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (id)objc_opt_class(location[0]);
      sub_100039500((uint64_t)v54, (uint64_t)v22);
      _os_log_impl((void *)&_mh_execute_header, v24, v23, "Buddy Activate: Escrow response has wrong type, expecting string, got %{public}@", v54, 0xCu);
      objc_storeStrong(&v22, 0);
    }
    objc_storeStrong((id *)&v24, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)_handlePlanAddition:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unsigned __int8 v8;
  id v9;
  void *v10;
  id v11;
  BuddyMiscState *v12;
  BuddyMiscState *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  int v20;
  id v21;
  id v22;
  id v23;
  id location[2];
  ActivationController *v25;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("eid"));
  v22 = objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("iccid"));
  v21 = objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("phoneNumber"));
  if (v23 && v22 && v21)
  {
    v3 = objc_alloc((Class)CTCellularPlanProvisioningOnDeviceActivationRequest);
    v18 = objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("sourceIccid"));
    v4 = objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("UnusableIccid"));
    v15 = objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("mcc"));
    v17 = objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("mnc"));
    v16 = objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("gid1"));
    v5 = objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("gid2"));
    v6 = objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("smdpAddress"));
    v7 = objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("useDS"));
    v8 = objc_msgSend(v7, "BOOLValue");
    v9 = objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("isESim"));
    v10 = v5;
    LOBYTE(v14) = v8 & 1;
    BYTE1(v14) = objc_msgSend(v9, "BOOLValue") & 1;
    v11 = objc_msgSend(v3, "initWithDetails:installIccid:sourceIccid:unusableIccid:phoneNumber:mcc:mnc:gid1:gid2:smdp:useDS:esim:flowType:", v23, v22, v18, v4, v21, v15, v17, v16, v5, v6, v14, CFSTR("ODA"));
    v12 = -[ActivationController miscState](v25, "miscState");
    -[BuddyMiscState setActivationPlanRequest:](v12, "setActivationPlanRequest:", v11);

    v19 = objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("success"));
    if ((objc_msgSend(v19, "BOOLValue") & 1) != 0)
    {
      v13 = -[ActivationController miscState](v25, "miscState");
      -[BuddyMiscState setSkipActivationForActivationPlanRequest:](v13, "setSkipActivationForActivationPlanRequest:", 0);
    }
    else
    {
      v13 = -[ActivationController miscState](v25, "miscState");
      -[BuddyMiscState setSkipActivationForActivationPlanRequest:](v13, "setSkipActivationForActivationPlanRequest:", 1);
    }

    objc_storeStrong(&v19, 0);
    v20 = 0;
  }
  else
  {
    v20 = 1;
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  BOOL v11;
  NSObject *v12;
  os_log_type_t v13;
  NSObject *v14;
  os_log_type_t v15;
  id v16;
  id v17;
  NSURL *v18;
  NSURL *v19;
  NSURL *v20;
  id v21;
  id v22;
  NSURL *v23;
  NSURL *v24;
  NSURL *v25;
  ActivationController *v26;
  id v27;
  char v28;
  NSURL *v29;
  char v30;
  NSURL *v31;
  uint8_t v32[7];
  os_log_type_t v33;
  os_log_t v34;
  uint8_t v35[7];
  os_log_type_t v36;
  os_log_t v37;
  char v38;
  id v39;
  uint8_t buf[7];
  os_log_type_t v41;
  os_log_t oslog;
  id v43;
  unint64_t *v44;
  id v45;
  id location[2];
  ActivationController *v47;

  v47 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v45 = 0;
  objc_storeStrong(&v45, a4);
  v44 = a5;
  v43 = objc_msgSend(v45, "clientInfo");
  v7 = objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("carrierSelection"));
  LOBYTE(a4) = objc_msgSend(v7, "BOOLValue");

  if ((a4 & 1) != 0)
  {
    v47->_cdmaSelectionActivation = 1;
    oslog = (os_log_t)(id)_BYLoggingFacility(v8);
    v41 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = oslog;
      v10 = v41;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Buddy Activate: carrierSelection.", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v38 = 0;
  v11 = 0;
  if (v44)
  {
    v39 = -[RemoteUIController displayedPages](v47->_remoteUIController, "displayedPages");
    v38 = 1;
    v8 = objc_msgSend(v39, "count");
    v11 = v8 == 0;
  }
  if ((v38 & 1) != 0)

  if (v11)
  {
    if (*v44 == 3)
    {
      v37 = (os_log_t)(id)_BYLoggingFacility(v8);
      v36 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v37;
        v13 = v36;
        sub_100038C3C(v35);
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "Activation: Server bug, got a replace with no pages", v35, 2u);
      }
      objc_storeStrong((id *)&v37, 0);
      *v44 = 2;
    }
    if (*v44 == 4)
    {
      v34 = (os_log_t)(id)_BYLoggingFacility(v8);
      v33 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v34;
        v15 = v33;
        sub_100038C3C(v32);
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "Activation: Server bug, got a pop with no pages", v32, 2u);
      }
      objc_storeStrong((id *)&v34, 0);
      *v44 = 0;
    }
  }
  if (v44 && *v44 == 1)
    -[ActivationController _dismissRemoteUI](v47, "_dismissRemoteUI");
  v16 = v45;
  v17 = objc_msgSend(v43, "objectForKey:", CFSTR("agreeURL"));
  v18 = (NSURL *)objc_msgSend(v16, "absoluteURLWithString:", v17);
  v19 = v18;
  v30 = 0;
  if (v18)
  {
    v20 = v18;
  }
  else
  {
    v20 = -[ActivationController agreeURL](v47, "agreeURL");
    v31 = v20;
    v30 = 1;
  }
  -[ActivationController setAgreeURL:](v47, "setAgreeURL:", v20);
  if ((v30 & 1) != 0)

  v21 = v45;
  v22 = objc_msgSend(v43, "objectForKey:", CFSTR("disagreeURL"));
  v23 = (NSURL *)objc_msgSend(v21, "absoluteURLWithString:", v22);
  v24 = v23;
  v28 = 0;
  if (v23)
  {
    v25 = v23;
  }
  else
  {
    v25 = -[ActivationController disagreeURL](v47, "disagreeURL");
    v29 = v25;
    v28 = 1;
  }
  -[ActivationController setDisagreeURL:](v47, "setDisagreeURL:", v25);
  if ((v28 & 1) != 0)

  v26 = v47;
  v27 = objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("escrowResponse"));
  -[ActivationController _handleEscrowResponse:](v26, "_handleEscrowResponse:", v27);

  -[ActivationController _handlePlanAddition:](v47, "_handlePlanAddition:", v43);
  -[RUIPage setLoading:](v47->_loadingPage, "setLoading:", 0);
  objc_storeStrong((id *)&v47->_loadingPage, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(location, 0);
}

- (void)_activateWithPasscode:(id)a3 fromObjectModel:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  NSObject *v12;
  os_log_type_t v13;
  SecureBackup *v14;
  SecureBackup *secureBackup;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  os_signpost_type_t v21;
  os_signpost_id_t v22;
  uint64_t v23;
  id v24;
  id v25;
  void **v26;
  int v27;
  int v28;
  void (*v29)(uint64_t, void *, void *);
  void *v30;
  id v31;
  id v32;
  ActivationController *v33;
  id v34[3];
  os_log_type_t v35;
  os_log_t oslog;
  uint8_t v37[16];
  void *v38;
  char v39;
  os_log_t log;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  uint8_t v52[7];
  os_log_type_t v53;
  id v54;
  uint8_t v55[15];
  os_log_type_t v56;
  id v57;
  os_log_type_t v58;
  id v59;
  id v60;
  id v61;
  id location[2];
  ActivationController *v63;
  uint8_t v64[16];
  uint8_t buf[24];

  v63 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v61 = 0;
  objc_storeStrong(&v61, a4);
  v5 = v61;
  v6 = objc_msgSend(v61, "clientInfo");
  v7 = objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("activationURL"));
  v60 = objc_msgSend(v5, "absoluteURLWithString:", v7);

  v59 = (id)_BYLoggingFacility(v8);
  v58 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v59, OS_LOG_TYPE_DEFAULT))
  {
    sub_100038C28((uint64_t)buf, (uint64_t)v60);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v59, v58, "Buddy Activate: Got URL for Activation Lock endpoint: %@", buf, 0xCu);
  }
  objc_storeStrong(&v59, 0);
  if (v63->_escrowSessionKey && v63->_srpInitResponse && v63->_accountDSID && v60)
  {
    v54 = (id)_BYLoggingFacility(v9);
    v53 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v54;
      v13 = v53;
      sub_100038C3C(v52);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Buddy Activate: Activating with passcode", v52, 2u);
    }
    objc_storeStrong(&v54, 0);
    -[SecureBackup srpRecoveryUpdateDSID:recoveryPassphrase:](v63->_secureBackup, "srpRecoveryUpdateDSID:recoveryPassphrase:", v63->_accountDSID, location[0]);
    v51 = -[SecureBackup srpRecoveryBlobFromSRPInitResponse:](v63->_secureBackup, "srpRecoveryBlobFromSRPInitResponse:", v63->_srpInitResponse);
    v50 = objc_msgSend(v51, "base64EncodedStringWithOptions:", 0);
    v14 = (SecureBackup *)objc_alloc_init((Class)SecureBackup);
    secureBackup = v63->_secureBackup;
    v63->_secureBackup = v14;

    v49 = -[SecureBackup srpInitNonce](v63->_secureBackup, "srpInitNonce");
    v48 = objc_msgSend(v49, "base64EncodedStringWithOptions:", 0);
    v47 = objc_alloc_init((Class)FMDDeviceIdentityFactory);
    v46 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    if (v48)
      objc_msgSend(v46, "setObject:forKeyedSubscript:", v48, CFSTR("nonce"));
    if (v50)
      objc_msgSend(v46, "setObject:forKeyedSubscript:", v50, CFSTR("blob"));
    objc_msgSend(v46, "setObject:forKeyedSubscript:", v63->_escrowSessionKey, CFSTR("escrowSessionKey"));
    v45 = CFSTR("passcodeActivation");
    v44 = 0;
    v43 = 0;
    v16 = (id)_BYSignpostSubsystem(-[ActivationController startSpinningWithIdentifier:](v63, "startSpinningWithIdentifier:", v45));
    v17 = (void *)_BYSignpostCreate(v16);
    v42 = v18;
    v41 = v17;

    log = (os_log_t)(id)_BYSignpostSubsystem(v19);
    v39 = 1;
    v38 = v41;
    if (v41 && v38 != (void *)-1 && os_signpost_enabled(log))
    {
      v20 = log;
      v21 = v39;
      v22 = (os_signpost_id_t)v38;
      sub_100038C3C(v37);
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, v21, v22, "ActivationFindMyIdentity", ", v37, 2u);
    }
    objc_storeStrong((id *)&log, 0);
    oslog = (os_log_t)(id)_BYSignpostSubsystem(v23);
    v35 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_1000342B4((uint64_t)v64, (uint64_t)v41);
      _os_log_impl((void *)&_mh_execute_header, oslog, v35, "BEGIN [%lld]: ActivationFindMyIdentity ", v64, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v43 = v41;
    v44 = v42;
    v24 = v47;
    v25 = v46;
    v26 = _NSConcreteStackBlock;
    v27 = -1073741824;
    v28 = 0;
    v29 = sub_1000A61CC;
    v30 = &unk_100281F50;
    v34[1] = v41;
    v34[2] = v42;
    v31 = v61;
    v32 = v60;
    v33 = v63;
    v34[0] = v45;
    objc_msgSend(v24, "identityForPasscodeActivationUnlockWithContext:completion:", v25, &v26);
    objc_storeStrong(v34, 0);
    objc_storeStrong((id *)&v33, 0);
    objc_storeStrong(&v32, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v45, 0);
    objc_storeStrong(&v46, 0);
    objc_storeStrong(&v47, 0);
    objc_storeStrong(&v48, 0);
    objc_storeStrong(&v49, 0);
    objc_storeStrong(&v50, 0);
    objc_storeStrong(&v51, 0);
  }
  else
  {
    v57 = (id)_BYLoggingFacility(v9);
    v56 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v57;
      v11 = v56;
      sub_100038C3C(v55);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Buddy Activate: Missing required data for passcode activation", v55, 2u);
    }
    objc_storeStrong(&v57, 0);
    -[ActivationController _enterState:](v63, "_enterState:", 5);
  }
  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v61, 0);
  objc_storeStrong(location, 0);
}

- (void)_setHandlerForPasscode
{
  RemoteUIController *remoteUIController;
  id v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(id *, void *, void *, void *);
  void *v8;
  id v9;
  id location[2];
  ActivationController *v11;

  v11 = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  remoteUIController = v11->_remoteUIController;
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1000A6BD4;
  v8 = &unk_100281E18;
  objc_copyWeak(&v9, location);
  v3 = -[RemoteUIController setHandlerForElementsMatching:handler:](remoteUIController, "setHandlerForElementsMatching:handler:", &stru_100281F90, &v4);
  objc_destroyWeak(&v9);
  objc_destroyWeak(location);
}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  id v7;
  id v8;
  id v9;
  unsigned __int8 v10;
  id v11;
  BOOL v12;
  id v13;
  id location[2];
  ActivationController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v12 = a5;
  v15->_hasPresentedRemoteUI = 1;
  -[NSMutableArray addObject:](v15->_objectModels, "addObject:", v13);
  v7 = objc_msgSend(v13, "defaultPages");
  v11 = objc_msgSend(v7, "firstObject");

  v8 = objc_msgSend(v11, "attributes");
  v9 = objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("name"));
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("FMIPLockChallenge"));

  if ((v10 & 1) != 0)
  {
    -[ActivationController _startActivationLockExpirationTimerForPage:](v15, "_startActivationLockExpirationTimerForPage:", v11);
    -[ActivationController _stashPasteboard](v15, "_stashPasteboard");
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)remoteUIController:(id)a3 didRemoveObjectModel:(id)a4
{
  id v5;
  RUIPage *v6;
  RUIPage *activationLockPage;
  os_log_t oslog;
  id v9;
  id v10;
  id location[2];
  ActivationController *v12;
  uint8_t buf[24];

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v5 = objc_msgSend(v10, "defaultPages");
  v6 = (RUIPage *)objc_msgSend(v5, "firstObject");
  activationLockPage = v12->_activationLockPage;

  if (v6 == activationLockPage)
  {
    -[ActivationController _stopActivationLockExpirationTimer](v12, "_stopActivationLockExpirationTimer");
    -[ActivationController _restorePasteboard](v12, "_restorePasteboard");
  }
  v9 = 0;
  v9 = -[NSMutableArray indexOfObject:](v12->_objectModels, "indexOfObject:", v10);
  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(0x7FFFFFFFFFFFFFFFLL);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100038C28((uint64_t)buf, (uint64_t)v10);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Buddy Activate: RUI removed an object model that is not on our stack: %@", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  else
  {
    -[NSMutableArray removeObjectAtIndex:](v12->_objectModels, "removeObjectAtIndex:", v9);
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  uint64_t v7;
  NSString *v8;
  char v9;
  NSString *v10;
  char v11;
  id v12;
  os_log_t oslog;
  id v14;
  id v15;
  id location[2];
  ActivationController *v17;
  uint8_t buf[24];

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = 0;
  objc_storeStrong(&v14, a5);
  if (v15)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v7);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 0;
      v9 = 0;
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v8 = (NSString *)v15;
      }
      else if (v15)
      {
        v12 = objc_msgSend(v15, "domain");
        v11 = 1;
        v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v12, objc_msgSend(v15, "code"));
        v10 = v8;
        v9 = 1;
      }
      else
      {
        v8 = 0;
      }
      sub_100039500((uint64_t)buf, (uint64_t)v8);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Buddy Activate: RUILoader didFailWithError: %{public}@", buf, 0xCu);
      if ((v9 & 1) != 0)

      if ((v11 & 1) != 0)
    }
    objc_storeStrong((id *)&oslog, 0);
    -[ActivationController _enterState:](v17, "_enterState:", 5);
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

- (void)_userAgreedToTCs:(BOOL)a3
{
  NSURL *v3;
  os_log_t oslog;
  id location;
  char v6;
  id v7;
  char v8;
  id v9;
  id v10;
  BOOL v11;
  SEL v12;
  ActivationController *v13;
  uint8_t buf[24];

  v13 = self;
  v12 = a2;
  v11 = a3;
  v8 = 0;
  v6 = 0;
  if (a3)
  {
    v3 = -[ActivationController agreeURL](v13, "agreeURL");
    v9 = v3;
    v8 = 1;
  }
  else
  {
    v3 = -[ActivationController disagreeURL](v13, "disagreeURL");
    v7 = v3;
    v6 = 1;
  }
  v10 = v3;
  if ((v6 & 1) != 0)

  if ((v8 & 1) != 0)
  location = objc_msgSend(objc_alloc((Class)NSMutableURLRequest), "initWithURL:cachePolicy:timeoutInterval:", v10, 1, 30.0);
  oslog = (os_log_t)(id)_BYLoggingFacility(location);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10005A460((uint64_t)buf, v11, (uint64_t)v10);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Buddy Activate: T&C request %d for URL %@", buf, 0x12u);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[ActivationController startRequest:completion:](v13, "startRequest:completion:", location, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v10, 0);
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

- (BuddySystemTimeUpdateManager)systemTimeUpdateManager
{
  return self->_systemTimeUpdateManager;
}

- (void)setSystemTimeUpdateManager:(id)a3
{
  objc_storeStrong((id *)&self->_systemTimeUpdateManager, a3);
}

- (NSURL)activationURL
{
  return self->_activationURL;
}

- (void)setActivationURL:(id)a3
{
  objc_storeStrong((id *)&self->_activationURL, a3);
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSURL)agreeURL
{
  return self->_agreeURL;
}

- (void)setAgreeURL:(id)a3
{
  objc_storeStrong((id *)&self->_agreeURL, a3);
}

- (NSURL)disagreeURL
{
  return self->_disagreeURL;
}

- (void)setDisagreeURL:(id)a3
{
  objc_storeStrong((id *)&self->_disagreeURL, a3);
}

- (BOOL)cdmaSelectionActivation
{
  return self->_cdmaSelectionActivation;
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (BuddyActivationState)activationState
{
  return self->_activationState;
}

- (void)setActivationState:(id)a3
{
  objc_storeStrong((id *)&self->_activationState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationState, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_activationURL, 0);
  objc_storeStrong((id *)&self->_systemTimeUpdateManager, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
  objc_storeStrong((id *)&self->_miscState, 0);
  objc_storeStrong((id *)&self->_startedActivationDate, 0);
  objc_storeStrong((id *)&self->_previousPasteboard, 0);
  objc_storeStrong((id *)&self->_demoConnection, 0);
  objc_storeStrong((id *)&self->_activationLockPage, 0);
  objc_storeStrong((id *)&self->_activationLockTimer, 0);
  objc_storeStrong((id *)&self->_disagreeURL, 0);
  objc_storeStrong((id *)&self->_agreeURL, 0);
  objc_storeStrong((id *)&self->_waitingForBasebandTimer, 0);
  objc_storeStrong((id *)&self->_ticketAcceptedTimer, 0);
  objc_storeStrong((id *)&self->_cellNetworkTimer, 0);
  objc_storeStrong((id *)&self->_displayTimer, 0);
  objc_storeStrong((id *)&self->_spinningViewController, 0);
  objc_storeStrong((id *)&self->_accountDSID, 0);
  objc_storeStrong((id *)&self->_srpInitResponse, 0);
  objc_storeStrong((id *)&self->_escrowSessionKey, 0);
  objc_storeStrong((id *)&self->_secureBackup, 0);
  objc_storeStrong((id *)&self->_loadingPage, 0);
  objc_storeStrong((id *)&self->_objectModels, 0);
  objc_storeStrong((id *)&self->_remoteUIController, 0);
  objc_storeStrong((id *)&self->_engine, 0);
}

@end

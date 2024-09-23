@implementation CBApplication

- (CBApplication)init
{
  CBApplication *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  void *v6;
  UINotificationFeedbackGenerator *v7;
  UINotificationFeedbackGenerator *notificationFeedbackGenerator;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v14[16];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CBApplication;
  v2 = -[CBApplication init](&v15, "init");
  if (v2)
  {
    v3 = CheckerBoardLogHandleForCategory(1);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Principal class created", v14, 2u);
    }

    v2->_allowWiFiSettingsAction = 0;
    v5 = objc_alloc((Class)UINotificationFeedbackGenerator);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[_UINotificationFeedbackGeneratorConfiguration privateConfiguration](_UINotificationFeedbackGeneratorConfiguration, "privateConfiguration"));
    v7 = (UINotificationFeedbackGenerator *)objc_msgSend(v5, "initWithConfiguration:", v6);
    notificationFeedbackGenerator = v2->_notificationFeedbackGenerator;
    v2->_notificationFeedbackGenerator = v7;

    -[CBApplication _initRoutingRules](v2, "_initRoutingRules");
    -[CBApplication _registerForNotifications](v2, "_registerForNotifications");
    v9 = +[CBLocationController sharedLocationController](CBLocationController, "sharedLocationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CBUserSettings sharedInstance](CBUserSettings, "sharedInstance"));
    objc_msgSend(v10, "applyPreUISettingsFromNvram");

    -[CBApplication _disableUSBRestrictedMode](v2, "_disableUSBRestrictedMode");
    v11 = CheckerBoardLogHandleForCategory(1);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CheckerBoard init complete", v14, 2u);
    }

  }
  return v2;
}

- (void)_initRoutingRules
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BSInvalidatable *v20;
  BSInvalidatable *dispatchingAssertion;
  void *v22;
  void *v23;
  _QWORD v25[4];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventDisplay builtinDisplay](BKSHIDEventDisplay, "builtinDisplay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventDisplay nullDisplay](BKSHIDEventDisplay, "nullDisplay"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v2, v3, 0));

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[BKSMutableHIDEventDiscreteDispatchingPredicate defaultSystemPredicate](BKSMutableHIDEventDiscreteDispatchingPredicate, "defaultSystemPredicate"));
  objc_msgSend(v23, "setDisplays:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventDispatchingTarget systemTarget](BKSHIDEventDispatchingTarget, "systemTarget"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventDiscreteDispatchingRule ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:](BKSHIDEventDiscreteDispatchingRule, "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:", v23, v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKSMutableHIDEventDiscreteDispatchingPredicate defaultFocusPredicate](BKSMutableHIDEventDiscreteDispatchingPredicate, "defaultFocusPredicate"));
  objc_msgSend(v7, "setDisplays:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventDispatchingTarget keyboardFocusTarget](BKSHIDEventDispatchingTarget, "keyboardFocusTarget"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventDiscreteDispatchingRule ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:](BKSHIDEventDiscreteDispatchingRule, "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:", v7, v8));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventDescriptor descriptorWithEventType:](BKSHIDEventDescriptor, "descriptorWithEventType:", 42));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventVendorDefinedDescriptor descriptorWithPage:usage:](BKSHIDEventVendorDefinedDescriptor, "descriptorWithPage:usage:", 65280, 102));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, v10, 0));

  v12 = objc_alloc_init((Class)BKSMutableHIDEventDiscreteDispatchingPredicate);
  objc_msgSend(v12, "setSenderDescriptors:", 0);
  objc_msgSend(v12, "setDescriptors:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventDispatchingTarget systemTarget](BKSHIDEventDispatchingTarget, "systemTarget"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventDiscreteDispatchingRule ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:](BKSHIDEventDiscreteDispatchingRule, "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:", v12, v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventDeferringEnvironment ui_cameraCaptureButtonEnvironment](BKSHIDEventDeferringEnvironment, "ui_cameraCaptureButtonEnvironment"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventDispatchingTarget targetForDeferringEnvironment:](BKSHIDEventDispatchingTarget, "targetForDeferringEnvironment:", v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventDiscreteDispatchingRule ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:](BKSHIDEventDiscreteDispatchingRule, "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:", v12, v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventDeliveryManager sharedInstance](BKSHIDEventDeliveryManager, "sharedInstance"));
  v25[0] = v6;
  v25[1] = v22;
  v25[2] = v14;
  v25[3] = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 4));
  v20 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dispatchDiscreteEventsForReason:withRules:", CFSTR("SB-Default"), v19));
  dispatchingAssertion = self->_dispatchingAssertion;
  self->_dispatchingAssertion = v20;

}

- (void)_disableUSBRestrictedMode
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[8];
  int v5;
  char v6;

  v5 = 3;
  v6 = 0;
  if (!ACMKernelControl(6, &v5, 5, 0))
  {
    v2 = CheckerBoardLogHandleForCategory(1);
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Disable USB restricted mode.", v4, 2u);
    }

  }
}

+ (void)initializeAppSupportService
{
  if (qword_10008BE20 != -1)
    dispatch_once(&qword_10008BE20, &stru_100076270);
}

+ (void)disableS2R
{
  uint64_t v2;
  NSObject *v3;
  io_registry_entry_t v4;
  uint8_t v5[16];

  v2 = CheckerBoardLogHandleForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting SleepDisabled to disable S2R", v5, 2u);
  }

  v4 = IORegistryEntryFromPath(kIOMasterPortDefault, "IOPower:/IOPowerConnection/IOPMrootDomain");
  IORegistryEntrySetCFProperty(v4, CFSTR("SleepDisabled"), kCFBooleanTrue);
}

- (void)_registerForNotifications
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v3 = CheckerBoardLogHandleForCategory(10);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Registering for thermal notifications…", v9, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_handleThermalWarningScreenPresentation", CFSTR("CBThermalBlockedDidChangeNotification"), 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "_showWiFiSettingsAction", CFSTR("CBNetworkViewControllerDidAdvanceToNextSceneNotification"), 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "_diagsLaunchedAction", CFSTR("CBEndGameViewControllerLaunchingDiagnosticsNotification"), 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "_hideWiFiSettingsAction", CFSTR("AppManagerPrimaryAppDidExit"), 0);

}

- (void)_showWiFiSettingsAction
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CheckerBoardLogHandleForCategory(8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Allowing [Wi-Fi Settings] action…", v5, 2u);
  }

  -[CBApplication setAllowWiFiSettingsAction:](self, "setAllowWiFiSettingsAction:", 1);
}

- (void)_hideWiFiSettingsAction
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CheckerBoardLogHandleForCategory(8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Forbidding [Wi-Fi Settings] action…", v5, 2u);
  }

  -[CBApplication setAllowWiFiSettingsAction:](self, "setAllowWiFiSettingsAction:", 0);
}

- (void)_diagsLaunchedAction
{
  id v2;

  -[CBApplication _showWiFiSettingsAction](self, "_showWiFiSettingsAction");
  v2 = (id)objc_claimAutoreleasedReturnValue(+[CBBootIntentManager sharedInstance](CBBootIntentManager, "sharedInstance"));
  objc_msgSend(v2, "deleteBootIntentSourceData");

}

- (void)_handleHIDEvent:(__IOHIDEvent *)a3
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  __IOHIDEvent *v11;

  v5 = CheckerBoardLogHandleForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Handle HID Event: %@", buf, 0xCu);
  }

  if (!-[CBApplication __handleHIDEvent:](self, "__handleHIDEvent:", a3))
  {
    v7 = CheckerBoardLogHandleForCategory(7);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Letting UIKit handle the HID event", buf, 2u);
    }

    v9.receiver = self;
    v9.super_class = (Class)CBApplication;
    -[CBApplication _handleHIDEvent:](&v9, "_handleHIDEvent:", a3);
  }
}

- (void)handlePressEvent:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  const char *v12;
  int v13;
  id v14;

  v4 = a3;
  v5 = CheckerBoardLogHandleForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Handle Physical Button Event: %@", (uint8_t *)&v13, 0xCu);
  }

  v7 = objc_msgSend(v4, "_hidEvent");
  v8 = CheckerBoardLogHandleForCategory(7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v10)
    {
      LOWORD(v13) = 0;
      v12 = "Physical HID button event does not exist";
      goto LABEL_11;
    }
LABEL_12:

    goto LABEL_13;
  }
  if (v10)
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Physical HID button event exists", (uint8_t *)&v13, 2u);
  }

  if (!-[CBApplication __handleHIDEvent:](self, "__handleHIDEvent:", v7))
  {
    v11 = CheckerBoardLogHandleForCategory(7);
    v9 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      v12 = "Physical HID button was not handled";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v13, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
LABEL_13:

}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  -[CBApplication handlePressEvent:](self, "handlePressEvent:", a4);
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  -[CBApplication handlePressEvent:](self, "handlePressEvent:", a4);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  -[CBApplication handlePressEvent:](self, "handlePressEvent:", a4);
}

- (BOOL)__handleHIDEvent:(__IOHIDEvent *)a3
{
  uint64_t v5;
  NSObject *v6;
  int IntegerValue;
  int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int Phase;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v21;
  int v22;
  _BYTE v23[10];
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  int v29;

  v5 = CheckerBoardLogHandleForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412290;
    *(_QWORD *)v23 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Handling HID Event: %@", (uint8_t *)&v22, 0xCu);
  }

  if (!a3)
  {
    v15 = CheckerBoardLogHandleForCategory(7);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "HID Event does not exist", (uint8_t *)&v22, 2u);
    }

    goto LABEL_15;
  }
  if (IOHIDEventGetType(a3) != 3)
  {
LABEL_15:
    v17 = CheckerBoardLogHandleForCategory(7);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
LABEL_18:

      return 0;
    }
    LOWORD(v22) = 0;
    v19 = "HID Event is not of type Keyboard";
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v22, 2u);
    goto LABEL_18;
  }
  IntegerValue = IOHIDEventGetIntegerValue(a3, 196608);
  v8 = IOHIDEventGetIntegerValue(a3, 196609);
  v9 = IOHIDEventGetIntegerValue(a3, 196610);
  v10 = IOHIDEventGetIntegerValue(a3, 196613);
  Phase = IOHIDEventGetPhase(a3);
  v12 = CheckerBoardLogHandleForCategory(7);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 67110144;
    *(_DWORD *)v23 = IntegerValue;
    *(_WORD *)&v23[4] = 1024;
    *(_DWORD *)&v23[6] = v8;
    v24 = 1024;
    v25 = v9 != 0;
    v26 = 1024;
    v27 = v10 != 0;
    v28 = 1024;
    v29 = (Phase >> 2) & 1;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[Keyboard HID Event Info] usagePage: 0x%x, usage: 0x%x, downEvent: %d, longPress: %d, terminalEvent: %d", (uint8_t *)&v22, 0x20u);
  }

  v14 = v8 | (IntegerValue << 16);
  if (v14 == 720942)
  {
    if (v9)
      -[CBApplication _ringerSwitchDown](self, "_ringerSwitchDown");
    else
      -[CBApplication _ringerSwitchUp](self, "_ringerSwitchUp");
    return 1;
  }
  if (v14 == 786480)
  {
    if (v9)
      -[CBApplication _lockButtonDown](self, "_lockButtonDown");
    else
      -[CBApplication _lockButtonUp](self, "_lockButtonUp");
    return 1;
  }
  if (v14 != 786496)
  {
    v21 = CheckerBoardLogHandleForCategory(7);
    v18 = objc_claimAutoreleasedReturnValue(v21);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    LOWORD(v22) = 0;
    v19 = "HID Event was not handle by us";
    goto LABEL_17;
  }
  if (v9)
    -[CBApplication _homeButtonDown](self, "_homeButtonDown");
  else
    -[CBApplication _homeButtonUp](self, "_homeButtonUp");
  return 1;
}

- (void)_homeButtonDown
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(7);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Home button down", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CBIdleSleepManager sharedInstance](CBIdleSleepManager, "sharedInstance"));
  if (objc_msgSend(v5, "isDisplayDim"))
  {
    v6 = CheckerBoardLogHandleForCategory(7);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Display is off. Turning display on and resetting idle timer…", v8, 2u);
    }

    -[CBApplication setHomeButtonPressedWithDisplayDim:](self, "setHomeButtonPressedWithDisplayDim:", 1);
    objc_msgSend(v5, "resetIdleTimerAndUndim:", 1);
  }
  else
  {
    -[CBApplication setHomeButtonPressedWithDisplayDim:](self, "setHomeButtonPressedWithDisplayDim:", 0);
  }

}

- (void)_homeButtonUp
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  unsigned int v16;

  v3 = CheckerBoardLogHandleForCategory(7);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Home button up", buf, 2u);
  }

  if (-[CBApplication homeButtonPressedWithDisplayDim](self, "homeButtonPressedWithDisplayDim"))
  {
    v5 = CheckerBoardLogHandleForCategory(7);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = -[CBApplication homeButtonPressedWithDisplayDim](self, "homeButtonPressedWithDisplayDim");
      *(_DWORD *)buf = 67109120;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Preventing Home button action sheet from being presented since the screen is on (%d)", buf, 8u);
    }

  }
  else
  {
    v8 = -[CBApplication allowWiFiSettingsAction](self, "allowWiFiSettingsAction");
    if (-[CBApplication _hasHomeButton](self, "_hasHomeButton"))
      v9 = v8;
    else
      v9 = v8 | 2;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CBUserSettings sharedInstance](CBUserSettings, "sharedInstance"));
    v11 = objc_msgSend(v10, "shouldShowInfoPane");

    if (v11)
      v12 = v9 | 4;
    else
      v12 = v9;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CBAlertManager sharedInstance](CBAlertManager, "sharedInstance"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100030038;
    v14[3] = &unk_1000762D8;
    v14[4] = self;
    objc_msgSend(v13, "showMenuSheetWithOptions:completion:response:", v12, 0, v14);

  }
}

- (void)_ringerSwitchDown
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = CheckerBoardLogHandleForCategory(7);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Ringer Switch toggled Tone", v4, 2u);
  }

}

- (void)_ringerSwitchUp
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(7);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Ringer Switch toggled Silent", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v6 = (unint64_t)objc_msgSend(v5, "userInterfaceIdiom");

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v7 = CheckerBoardLogHandleForCategory(7);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "🎉 Let there be vibration! 🎉", v10, 2u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBApplication notificationFeedbackGenerator](self, "notificationFeedbackGenerator"));
    objc_msgSend(v9, "_privateNotificationOccurred:", 1004);

  }
}

- (void)_lockButtonDown
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(7);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sleep/Wake Button down", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CBIdleSleepManager sharedInstance](CBIdleSleepManager, "sharedInstance"));
  if (objc_msgSend(v5, "isDisplayDim"))
  {
    -[CBApplication setLockButtonPressedWithDisplayDim:](self, "setLockButtonPressedWithDisplayDim:", 1);
    v6 = CheckerBoardLogHandleForCategory(7);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Display is off. Turning display on and resetting idle timer…", v15, 2u);
    }

    objc_msgSend(v5, "resetIdleTimerAndUndim:", 1);
  }
  else
  {
    -[CBApplication setLockButtonPressedWithDisplayDim:](self, "setLockButtonPressedWithDisplayDim:", 0);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CBAlertManager sharedInstance](CBAlertManager, "sharedInstance"));
  v9 = objc_msgSend(v8, "powerDownVisible");

  v10 = CheckerBoardLogHandleForCategory(7);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if ((v9 & 1) != 0)
  {
    if (v12)
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Not starting a timer since Power Down UI is visible", v13, 2u);
    }

  }
  else
  {
    if (v12)
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Display should be on now with no visible Power Down UI. Starting lock button long press timer…", v14, 2u);
    }

    -[CBApplication _startLockButtonTimer](self, "_startLockButtonTimer");
  }

}

- (void)_startLockButtonTimer
{
  unsigned int v3;
  double v4;
  id v5;

  -[CBApplication setLockButtonLongPressed:](self, "setLockButtonLongPressed:", 0);
  v3 = -[CBApplication _hasHomeButton](self, "_hasHomeButton");
  v4 = 0.4;
  if (v3)
    v4 = 3.0;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_lockButtonLongPress", 0, 0, v4));
  -[CBApplication setLockButtonTimer:](self, "setLockButtonTimer:", v5);

}

- (void)_lockButtonLongPress
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  -[CBApplication setLockButtonLongPressed:](self, "setLockButtonLongPressed:", 1);
  if (-[CBApplication _hasHomeButton](self, "_hasHomeButton"))
  {
    v3 = CheckerBoardLogHandleForCategory(7);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sleep/Wake Button long press - Presenting Power Down UI…", v5, 2u);
    }

    -[CBApplication _showPowerDownView](self, "_showPowerDownView");
  }
  else
  {
    -[CBApplication _homeButtonUp](self, "_homeButtonUp");
  }
}

- (void)_showPowerDownView
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[CBAlertManager sharedInstance](CBAlertManager, "sharedInstance"));
  objc_msgSend(v2, "showPowerDownWithCompletion:response:", 0, &stru_1000762F8);

}

- (BOOL)_isLockButtonTimerValid
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CBApplication lockButtonTimer](self, "lockButtonTimer"));
  v3 = v2 != 0;

  return v3;
}

- (void)_cancelLockButtonTimer
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CheckerBoardLogHandleForCategory(7);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Canceling lock button timer…", v5, 2u);
  }

  -[CBApplication setLockButtonTimer:](self, "setLockButtonTimer:", 0);
}

- (void)setLockButtonTimer:(id)a3
{
  NSTimer *v5;
  NSTimer **p_lockButtonTimer;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v5 = (NSTimer *)a3;
  p_lockButtonTimer = &self->_lockButtonTimer;
  if (*p_lockButtonTimer != v5)
  {
    v7 = CheckerBoardLogHandleForCategory(7);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setting lock button timer…", v9, 2u);
    }

    -[NSTimer invalidate](*p_lockButtonTimer, "invalidate");
    objc_storeStrong((id *)p_lockButtonTimer, a3);
  }

}

- (void)_lockButtonUp
{
  uint64_t v3;
  NSObject *v4;
  unsigned int v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  NSObject *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  NSObject *v15;
  _DWORD v16[2];
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  unsigned int v20;

  v3 = CheckerBoardLogHandleForCategory(7);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sleep/Wake Button up", (uint8_t *)v16, 2u);
  }

  v5 = -[CBApplication _isLockButtonTimerValid](self, "_isLockButtonTimerValid");
  -[CBApplication _cancelLockButtonTimer](self, "_cancelLockButtonTimer");
  if (!v5 || -[CBApplication lockButtonPressedWithDisplayDim](self, "lockButtonPressedWithDisplayDim"))
    goto LABEL_8;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CBAlertManager sharedInstance](CBAlertManager, "sharedInstance"));
  if (objc_msgSend(v6, "powerDownVisible"))
  {

    goto LABEL_8;
  }
  v7 = -[CBApplication lockButtonLongPressed](self, "lockButtonLongPressed");

  if ((v7 & 1) != 0)
  {
LABEL_8:
    v8 = CheckerBoardLogHandleForCategory(7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = -[CBApplication lockButtonPressedWithDisplayDim](self, "lockButtonPressedWithDisplayDim");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[CBAlertManager sharedInstance](CBAlertManager, "sharedInstance"));
      v12 = objc_msgSend(v11, "powerDownVisible");
      v13 = -[CBApplication lockButtonLongPressed](self, "lockButtonLongPressed");
      v16[0] = 67109632;
      v16[1] = v10;
      v17 = 1024;
      v18 = v12;
      v19 = 1024;
      v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not turning the display off since the screen is on (%d), Power Down UI is visible (%d), and lock button was long pressed (%d)", (uint8_t *)v16, 0x14u);

    }
    goto LABEL_10;
  }
  v14 = CheckerBoardLogHandleForCategory(7);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Display is on. Turning display off…", (uint8_t *)v16, 2u);
  }

  v9 = objc_claimAutoreleasedReturnValue(+[CBIdleSleepManager sharedInstance](CBIdleSleepManager, "sharedInstance"));
  -[NSObject dimDisplay](v9, "dimDisplay");
LABEL_10:

}

- (void)_handleThermalWarningScreenPresentation
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v2 = CheckerBoardLogHandleForCategory(10);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Handling thermal warning screen…", v6, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CBThermalManager sharedInstance](CBThermalManager, "sharedInstance"));
  if (objc_msgSend(v4, "isThermalBlocked"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CBAlertManager sharedInstance](CBAlertManager, "sharedInstance"));
    objc_msgSend(v5, "showThermalWarningWithCompletion:", 0);
LABEL_7:

    goto LABEL_8;
  }
  if ((objc_msgSend(v4, "isThermalBlocked") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CBAlertManager sharedInstance](CBAlertManager, "sharedInstance"));
    objc_msgSend(v5, "dismissThermalWarningWithCompletion:", 0);
    goto LABEL_7;
  }
LABEL_8:

}

- (BOOL)_hasHomeButton
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BSPlatform sharedInstance](BSPlatform, "sharedInstance"));
  v3 = objc_msgSend(v2, "homeButtonType") != (id)2;

  return v3;
}

- (BOOL)_isSpringBoard
{
  return 1;
}

+ (BOOL)registerAsSystemApp
{
  return 0;
}

+ (BOOL)runStatusBarServer
{
  return 1;
}

- (BOOL)disablesFrontBoardImplicitWindowScenes
{
  return 1;
}

+ (id)_newApplicationInitializationContext
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v2 = objc_msgSend(objc_alloc((Class)UISMutableDeviceContext), "initWithDeviceInfoValues:", &__NSDictionary0__struct);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSPlatform sharedInstance](BSPlatform, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v3, "deviceClass")));
  objc_msgSend(v2, "setDeviceInfoValue:forKey:", v4, UISDeviceContextDeviceClassKey);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v3, "homeButtonType")));
  objc_msgSend(v2, "setDeviceInfoValue:forKey:", v5, UISDeviceContextHomeButtonTypeKey);

  MGGetFloat32Answer(CFSTR("DeviceCornerRadius"), 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  objc_msgSend(v2, "setDeviceInfoValue:forKey:", v6, UISDeviceContextDeviceCornerRadiusKey);

  v7 = objc_alloc((Class)UISMutableDisplayContext);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FBDisplayManager sharedInstance](FBDisplayManager, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mainConfiguration"));
  v10 = objc_msgSend(v7, "initWithDisplayConfiguration:", v9);

  v11 = sub_100036F10();
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[FBDisplayManager sharedInstance](FBDisplayManager, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mainConfiguration"));
  objc_msgSend(v10, "setDisplayConfiguration:", v13);

  v14 = sub_1000379FC(v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v10, "setDisplayEdgeInfo:", v15);

  v16 = sub_100037C74(v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v10, "setExclusionArea:", v17);

  objc_msgSend(v10, "setArtworkSubtype:", sub_10003700C());
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIUserInterfaceStyleArbiter sharedInstance](UIUserInterfaceStyleArbiter, "sharedInstance"));
  v19 = v18;
  if (v18)
    objc_msgSend(v10, "setUserInterfaceStyle:", objc_msgSend(v18, "currentStyle"));
  v20 = objc_msgSend(objc_alloc((Class)UISMutableApplicationInitializationContext), "initWithDisplayContext:deviceContext:persistedSceneIdentifiers:supportAppSceneRequests:", v10, v2, 0, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bundleIdentifier"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSceneIdentity identityForIdentifier:](FBSSceneIdentity, "identityForIdentifier:", v22));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](FBSceneManager, "sharedInstance"));
  v25 = objc_msgSend(v24, "newSceneIdentityTokenForIdentity:", v23);

  objc_msgSend(v20, "setDefaultSceneToken:", v25);
  return v20;
}

- (void)_createInitialAppScene
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v12 = (id)objc_claimAutoreleasedReturnValue(+[FBSMutableSceneDefinition definition](FBSMutableSceneDefinition, "definition"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bundleIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSceneIdentity identityForIdentifier:](FBSSceneIdentity, "identityForIdentifier:", v3));
  objc_msgSend(v12, "setIdentity:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSceneClientIdentity localIdentity](FBSSceneClientIdentity, "localIdentity"));
  objc_msgSend(v12, "setClientIdentity:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplicationSceneSpecification specification](UIApplicationSceneSpecification, "specification"));
  objc_msgSend(v12, "setSpecification:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "specification"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FBSMutableSceneParameters parametersForSpecification:](FBSMutableSceneParameters, "parametersForSpecification:", v7));

  objc_msgSend(v8, "updateSettingsWithBlock:", &stru_100076338);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100030FA4;
  v13[3] = &unk_1000761F0;
  v14 = v8;
  v9 = v8;
  objc_msgSend(v9, "updateClientSettingsWithBlock:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](FBSceneManager, "sharedInstance"));
  v11 = objc_msgSend(v10, "createSceneWithDefinition:initialParameters:", v12, v9);

}

- (void)batteryStatusDidChange:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  NSObject *v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD v11[4];
  unsigned __int8 v12;
  uint8_t buf[16];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("AtCriticalLevel")));
  v5 = objc_msgSend(v4, "BOOLValue");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("ExternalConnected")));
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v5)
  {
    v8 = CheckerBoardLogHandleForCategory(4);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Battery is at a critical level. Sending out shutdown notification before shutting down.", buf, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.springboard.deviceWillShutDown"), 0, 0, 1u);
    sleep(4u);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100031130;
    v11[3] = &unk_100076358;
    v12 = v7;
    BSDispatchMain(v11);
  }
}

- (BOOL)allowWiFiSettingsAction
{
  return self->_allowWiFiSettingsAction;
}

- (void)setAllowWiFiSettingsAction:(BOOL)a3
{
  self->_allowWiFiSettingsAction = a3;
}

- (BOOL)lockButtonLongPressed
{
  return self->_lockButtonLongPressed;
}

- (void)setLockButtonLongPressed:(BOOL)a3
{
  self->_lockButtonLongPressed = a3;
}

- (BOOL)homeButtonPressedWithDisplayDim
{
  return self->_homeButtonPressedWithDisplayDim;
}

- (void)setHomeButtonPressedWithDisplayDim:(BOOL)a3
{
  self->_homeButtonPressedWithDisplayDim = a3;
}

- (NSTimer)lockButtonTimer
{
  return self->_lockButtonTimer;
}

- (BOOL)lockButtonPressedWithDisplayDim
{
  return self->_lockButtonPressedWithDisplayDim;
}

- (void)setLockButtonPressedWithDisplayDim:(BOOL)a3
{
  self->_lockButtonPressedWithDisplayDim = a3;
}

- (BSInvalidatable)dispatchingAssertion
{
  return self->_dispatchingAssertion;
}

- (void)setDispatchingAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchingAssertion, a3);
}

- (UINotificationFeedbackGenerator)notificationFeedbackGenerator
{
  return self->_notificationFeedbackGenerator;
}

- (void)setNotificationFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_notificationFeedbackGenerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_dispatchingAssertion, 0);
  objc_storeStrong((id *)&self->_lockButtonTimer, 0);
}

@end

@implementation PHInCallUtilities

+ (id)sharedInstance
{
  if (qword_1002DC728 != -1)
    dispatch_once(&qword_1002DC728, &stru_1002855E8);
  if (qword_1002DC720)
    return (id)qword_1002DC720;
  else
    return (id)qword_1002DC718;
}

+ (void)setSharedInstanceOverride:(id)a3
{
  objc_storeStrong((id *)&qword_1002DC720, a3);
}

+ (void)unsetSharedInstanceOverride
{
  objc_msgSend(a1, "setSharedInstanceOverride:", 0);
}

+ (void)performBlockWithSharedInstanceOverride:(id)a3 block:(id)a4
{
  void (**v6)(void);

  v6 = (void (**)(void))a4;
  objc_msgSend(a1, "setSharedInstanceOverride:", a3);
  if (v6)
    v6[2]();
  objc_msgSend(a1, "unsetSharedInstanceOverride");

}

+ (__CFPhoneNumber)newPhoneNumberRefForDestinationID:(id)a3 useNetworkCountryCode:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFPhoneNumber *v11;
  uint64_t v12;

  v4 = a4;
  v5 = a3;
  if (objc_msgSend(v5, "destinationIdIsPhoneNumber"))
  {
    if (v4 && (v6 = TUNetworkCountryCode(), (v7 = objc_claimAutoreleasedReturnValue(v6)) != 0))
    {
      v8 = (void *)v7;
      v9 = TUNetworkCountryCode();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    }
    else
    {
      v12 = TUHomeCountryCode();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v12);
    }
    v11 = 0;
    if (v5 && v10)
      v11 = (__CFPhoneNumber *)CFPhoneNumberCreate(kCFAllocatorDefault, v5, v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)formattedPhoneNumberFromString:(id)a3
{
  id v3;
  __CFPhoneNumber *v4;
  void *String;
  __CFPhoneNumber *v6;

  v3 = a3;
  v4 = +[PHInCallUtilities newPhoneNumberRefForDestinationID:useNetworkCountryCode:](PHInCallUtilities, "newPhoneNumberRefForDestinationID:useNetworkCountryCode:", v3, 1);
  String = v3;
  if (v4)
  {
    v6 = v4;
    String = (void *)CFPhoneNumberCreateString(kCFAllocatorDefault, v4, 5);

    CFRelease(v6);
  }

  return String;
}

+ (id)wifiSettingsURL
{
  return +[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=WIFI"));
}

- (PHInCallUtilities)init
{
  PHInCallUtilities *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  void **v7;
  void *v8;
  __CFNotificationCenter *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PHInCallUtilities;
  v2 = -[PHInCallUtilities init](&v11, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[PHInCallUtilities setInCallStatusBarSuppressionReasons:](v2, "setInCallStatusBarSuppressionReasons:", v3);

    -[PHInCallUtilities updateInCallStatusBarSuppression](v2, "updateInCallStatusBarSuppression");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FTCServiceAvailabilityCenter sharedInstance](FTCServiceAvailabilityCenter, "sharedInstance"));
    objc_msgSend(v4, "addListenerID:forService:", CFSTR("com.apple.InCallService.FTCServiceAvailabilityListenerID"), 2);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FTCServiceAvailabilityCenter sharedInstance](FTCServiceAvailabilityCenter, "sharedInstance"));
    objc_msgSend(v5, "addListenerID:forService:", CFSTR("com.apple.InCallService.FTCServiceAvailabilityListenerID"), 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_100040E4C, CFSTR("com.apple.mobilephone.LockScreenMessagingChanged"), 0, CFNotificationSuspensionBehaviorDrop);
    if (!qword_1002DC730)
    {
      v7 = (void **)CUTWeakLinkSymbol("kLostModeChangedNotification", CFSTR("FindMyDevice"));
      if (v7)
        v8 = *v7;
      else
        v8 = 0;
      objc_storeStrong((id *)&qword_1002DC730, v8);
    }
    v9 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v9, v2, (CFNotificationCallback)sub_100040EB8, (CFStringRef)qword_1002DC730, 0, CFNotificationSuspensionBehaviorDrop);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v6;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FTCServiceAvailabilityCenter sharedInstance](FTCServiceAvailabilityCenter, "sharedInstance"));
  objc_msgSend(v3, "removeListenerID:forService:", CFSTR("com.apple.InCallService.FTCServiceAvailabilityListenerID"), 2);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FTCServiceAvailabilityCenter sharedInstance](FTCServiceAvailabilityCenter, "sharedInstance"));
  objc_msgSend(v4, "removeListenerID:forService:", CFSTR("com.apple.InCallService.FTCServiceAvailabilityListenerID"), 0);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)PHInCallUtilities;
  -[PHInCallUtilities dealloc](&v7, "dealloc");
}

- (void)startSuppressingInCallStatusBarForReason:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallUtilities inCallStatusBarSuppressionReasons](self, "inCallStatusBarSuppressionReasons"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallUtilities inCallStatusBarSuppressionReasons](self, "inCallStatusBarSuppressionReasons"));
    objc_msgSend(v7, "addObject:", v4);

    v8 = sub_1000C5588();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallUtilities inCallStatusBarSuppressionReasons](self, "inCallStatusBarSuppressionReasons"));
      v11 = 138412546;
      v12 = v4;
      v13 = 2112;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "added reason: %@, reasons: %@", (uint8_t *)&v11, 0x16u);

    }
  }
  -[PHInCallUtilities updateInCallStatusBarSuppression](self, "updateInCallStatusBarSuppression");

}

- (void)stopSuppressingInCallStatusBarForReason:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallUtilities inCallStatusBarSuppressionReasons](self, "inCallStatusBarSuppressionReasons"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallUtilities inCallStatusBarSuppressionReasons](self, "inCallStatusBarSuppressionReasons"));
    objc_msgSend(v7, "removeObject:", v4);

    v8 = sub_1000C5588();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallUtilities inCallStatusBarSuppressionReasons](self, "inCallStatusBarSuppressionReasons"));
      v11 = 138412546;
      v12 = v4;
      v13 = 2112;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "removed reason: %@, reasons: %@", (uint8_t *)&v11, 0x16u);

    }
  }
  -[PHInCallUtilities updateInCallStatusBarSuppression](self, "updateInCallStatusBarSuppression");

}

- (void)stopSuppressingInCallStatusBar
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallUtilities inCallStatusBarSuppressionReasons](self, "inCallStatusBarSuppressionReasons"));
    v7 = 138412290;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "removing all status bar suppression reasons: %@", (uint8_t *)&v7, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallUtilities inCallStatusBarSuppressionReasons](self, "inCallStatusBarSuppressionReasons"));
  objc_msgSend(v6, "removeAllObjects");

  -[PHInCallUtilities updateInCallStatusBarSuppression](self, "updateInCallStatusBarSuppression");
}

- (void)startAllowingRingingCallStatusIndicator
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  objc_msgSend(v2, "shouldAllowRingingCallStatusIndicator:", 1);

}

- (void)stopAllowingRingingCallStatusIndicator
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  objc_msgSend(v2, "shouldAllowRingingCallStatusIndicator:", 0);

}

- (BOOL)hasStatusBarSuppressionReasons
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallUtilities inCallStatusBarSuppressionReasons](self, "inCallStatusBarSuppressionReasons"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)updateInCallStatusBarSuppression
{
  _BOOL8 v2;
  _BOOL8 v3;
  id v4;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const __CFString *v9;

  v2 = -[PHInCallUtilities hasStatusBarSuppressionReasons](self, "hasStatusBarSuppressionReasons");
  if (dword_1002D57D0 != v2)
  {
    v3 = v2;
    v4 = sub_1000C5588();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      v8 = 138412290;
      v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting PIP presence token to %@", (uint8_t *)&v8, 0xCu);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    objc_msgSend(v7, "shouldSuppressInCallStatusBar:", v3);

    dword_1002D57D0 = v3;
  }
}

- (void)requestPasscodeUnlockWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    if (+[PHInCallUIUtilities isSpringBoardPasscodeLocked](PHInCallUIUtilities, "isSpringBoardPasscodeLocked"))
    {
      v5 = sub_1000C5588();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Requesting passcode", buf, 2u);
      }

      SBSRequestPasscodeUnlockAlertUI(v4);
    }
    else if (-[PHInCallUtilities isInLostMode](self, "isInLostMode"))
    {
      v7 = sub_1000C5588();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "In lost mode and no passcode, not displaying UI", v9, 2u);
      }

      v4[2](v4, 0);
    }
    else
    {
      v4[2](v4, 1);
    }
  }

}

- (BOOL)isInLostMode
{
  id v2;
  void *v3;

  if ((byte_1002DC738 & 1) == 0)
  {
    v2 = objc_msgSend((id)CUTWeakLinkClass(CFSTR("FMDFMIPManager"), CFSTR("FindMyDevice")), "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    byte_1002DC739 = objc_msgSend(v3, "lostModeIsActive");

    byte_1002DC738 = 1;
  }
  return byte_1002DC739;
}

- (BOOL)isLockScreenMessagingAllowed
{
  void *v2;
  id v3;
  void *v4;
  unsigned __int8 v5;
  char v6;

  if ((byte_1002DC73A & 1) == 0)
  {
    v2 = (void *)TUBundleIdentifierMobilePhoneApplication;
    CFPreferencesAppSynchronize(TUBundleIdentifierMobilePhoneApplication);
    v3 = sub_10000D540(CFSTR("LockScreenMessaging"), v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = objc_msgSend(v4, "BOOLValue");
    if (v4)
      v6 = v5;
    else
      v6 = 1;
    byte_1002DC73B = v6;
    byte_1002DC73A = 1;

  }
  return byte_1002DC73B;
}

- (BOOL)faceTimeVideoIsSupported
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](FTDeviceSupport, "sharedInstance"));
  v3 = objc_msgSend(v2, "faceTimeSupported");

  return v3;
}

- (BOOL)faceTimeVideoIsAvailable
{
  void *v2;
  BOOL v3;

  if (!-[PHInCallUtilities faceTimeVideoIsSupported](self, "faceTimeVideoIsSupported"))
    return 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FTCServiceAvailabilityCenter sharedInstance](FTCServiceAvailabilityCenter, "sharedInstance"));
  v3 = objc_msgSend(v2, "availabilityForListenerID:forService:", CFSTR("com.apple.InCallService.FTCServiceAvailabilityListenerID"), 0) == (id)1;

  return v3;
}

- (BOOL)faceTimeAudioIsSupported
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](FTDeviceSupport, "sharedInstance"));
  v3 = objc_msgSend(v2, "callingSupported");

  return v3;
}

- (BOOL)faceTimeAudioIsAvailable
{
  void *v2;
  BOOL v3;

  if (!-[PHInCallUtilities faceTimeAudioIsSupported](self, "faceTimeAudioIsSupported"))
    return 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FTCServiceAvailabilityCenter sharedInstance](FTCServiceAvailabilityCenter, "sharedInstance"));
  v3 = objc_msgSend(v2, "availabilityForListenerID:forService:", CFSTR("com.apple.InCallService.FTCServiceAvailabilityListenerID"), 2) == (id)1;

  return v3;
}

- (BOOL)isIPadIdiom
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == (id)1;

  return v3;
}

- (BOOL)isSetupAssistantRunning
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041864;
  block[3] = &unk_100284898;
  block[4] = self;
  if (qword_1002DC740 != -1)
    dispatch_once(&qword_1002DC740, block);
  return byte_1002DC748;
}

- (BOOL)canSendText
{
  return +[MFMessageComposeViewController canSendText](MFMessageComposeViewController, "canSendText");
}

- (BOOL)isSMSRestricted
{
  id v2;
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  unsigned __int8 v7;
  id v8;
  id v10;

  v2 = TUBundleIdentifierMessagesApplication;
  v10 = 0;
  v3 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v2, 0, &v10);
  v4 = v10;
  v5 = v4;
  if (v3)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicationState"));
    v7 = -[NSObject isRestricted](v6, "isRestricted");
  }
  else
  {
    if (!v4)
    {
      v7 = 0;
      goto LABEL_8;
    }
    v8 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1001A85DC((uint64_t)v2, (uint64_t)v5, v6);
    v7 = 0;
  }

LABEL_8:
  return v7;
}

- (void)setRequestedVCPresentationWithStatusBar:(BOOL)a3 withReasonLog:(id)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;

  v4 = a3;
  v6 = a4;
  if (self->_requestedVCPresentationWithStatusBar != v4)
  {
    self->_requestedVCPresentationWithStatusBar = v4;
    v7 = sub_1000C5588();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = NSStringFromBOOL(self->_requestedVCPresentationWithStatusBar);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = 138412546;
      v12 = v10;
      v13 = 2112;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "set requestedPresentationWithStatusBar: %@ because: %@", (uint8_t *)&v11, 0x16u);

    }
  }

}

- (BOOL)isLockToEndCallEnabled
{
  uint64_t (*v2)(void);
  int v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  _DWORD v8[2];

  if (!sub_100041BB8(0) || !sub_100041C88())
    return 1;
  v2 = (uint64_t (*)(void))sub_100041C88();
  if (!v2)
    sub_1001A8660();
  v3 = v2();
  v4 = v3 != 0;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3 != 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Accessibility lock to end: %d", (uint8_t *)v8, 8u);
  }

  return v4;
}

- (BOOL)requestedVCPresentationWithStatusBar
{
  return self->_requestedVCPresentationWithStatusBar;
}

- (NSMutableSet)inCallStatusBarSuppressionReasons
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInCallStatusBarSuppressionReasons:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inCallStatusBarSuppressionReasons, 0);
}

@end

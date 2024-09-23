@implementation DialerController

+ (void)playDTMFToneForKey:(unsigned __int8)a3
{
  uint64_t v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _DWORD v8[2];

  v3 = a3;
  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Playing DTMF key: %d", (uint8_t *)v8, 8u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayedCallFromCalls:", 0));

  if (objc_msgSend(v7, "shouldPlayDTMFTone"))
    objc_msgSend(v7, "playDTMFToneForKey:", v3);

}

+ (BOOL)shouldStringAutoDial:(id)a3 givenLastChar:(char)a4
{
  return sub_100086EA4(a3, a4);
}

+ (BOOL)launchFieldTestIfNeeded:(id)a3
{
  return sub_100087564(a3);
}

- (TUCallProviderManager)callProviderManager
{
  TUCallProviderManager *callProviderManager;
  TUCallProviderManager *v4;
  TUCallProviderManager *v5;

  callProviderManager = self->_callProviderManager;
  if (!callProviderManager)
  {
    v4 = (TUCallProviderManager *)objc_alloc_init((Class)TUCallProviderManager);
    v5 = self->_callProviderManager;
    self->_callProviderManager = v4;

    callProviderManager = self->_callProviderManager;
  }
  return callProviderManager;
}

- (id)defaultCallProvider
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DialerController callProviderManager](self, "callProviderManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "telephonyProvider"));

  return v3;
}

- (void)loadView
{
  PHAbstractDialerView *dialerView;
  PHAbstractDialerView *v4;
  id v5;
  void *v6;
  PHCarPlayInCallDialerView *v7;
  PHAbstractDialerView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  dialerView = self->_dialerView;
  if (dialerView)
  {
    -[PHAbstractDialerView removeFromSuperview](dialerView, "removeFromSuperview");
    v4 = self->_dialerView;
    self->_dialerView = 0;

  }
  v5 = objc_alloc((Class)UIView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v6, "bounds");
  v16 = objc_msgSend(v5, "initWithFrame:");

  if (-[DialerController dialerType](self, "dialerType") && -[DialerController dialerType](self, "dialerType") == 2)
  {
    v7 = -[PHCarPlayInCallDialerView initWithFrame:]([PHCarPlayInCallDialerView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v8 = self->_dialerView;
    self->_dialerView = &v7->super;

  }
  -[PHAbstractDialerView setAutoresizingMask:](self->_dialerView, "setAutoresizingMask:", 18);
  -[PHAbstractDialerView setDelegate:](self->_dialerView, "setDelegate:", self);
  -[PHAbstractDialerView bounds](self->_dialerView, "bounds");
  objc_msgSend(v16, "setFrame:");
  objc_msgSend(v16, "addSubview:", self->_dialerView);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView callButton](self->_dialerView, "callButton"));
  objc_msgSend(v9, "addTarget:action:forControlEvents:", self, "_callButtonPressed:", 64);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView deleteButton](self->_dialerView, "deleteButton"));
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, "_deleteButtonClicked:", 64);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView deleteButton](self->_dialerView, "deleteButton"));
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, "_deleteButtonDown:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView deleteButton](self->_dialerView, "deleteButton"));
  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, "_stopDeleteTimer", 32);

  v13 = objc_msgSend(objc_alloc((Class)UISwipeGestureRecognizer), "initWithTarget:action:", self, "handleSwipeGesture:");
  objc_msgSend(v13, "setDirection:", 3);
  objc_msgSend(v13, "setDelegate:", self);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView"));
  objc_msgSend(v14, "addGestureRecognizer:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView phonePadView](self->_dialerView, "phonePadView"));
  objc_msgSend(v15, "setDelegate:", self);

  -[DialerController setView:](self, "setView:", v16);
}

- (BOOL)shouldAnimateCallButton
{
  char v3;
  void *v5;
  void *v6;
  Class v7;
  uint64_t v8;
  uint64_t v9;

  if (-[DialerController wantsCallButtonAnimation](self, "wantsCallButtonAnimation")
    && -[DialerController isViewLoaded](self, "isViewLoaded")
    && !-[DialerController dialerType](self, "dialerType"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DialerController view](self, "view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
    v7 = NSClassFromString(CFSTR("_UIHostedWindow"));
    v9 = objc_opt_class(v7, v8);
    v3 = objc_opt_isKindOfClass(v6, v9) ^ 1;

  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)DialerController;
  -[DialerController viewDidLoad](&v2, "viewDidLoad");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DialerController;
  -[DialerController viewWillAppear:](&v8, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "handleApplicationDidEnterBackgroundNotification:", UIApplicationDidEnterBackgroundNotification, 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "handleApplicationWillEnterForegroundNotification:", UIApplicationWillEnterForegroundNotification, 0);
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Calling _resetButtonAnimation in ", v7, 2u);
  }

  -[DialerController _resetButtonAnimation](self, "_resetButtonAnimation");
  -[DialerController requestAudioServicesActivate](self, "requestAudioServicesActivate");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DialerController;
  -[DialerController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, UIApplicationDidEnterBackgroundNotification, 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, UIApplicationWillEnterForegroundNotification, 0);
  -[DialerController _stopLookupTimer](self, "_stopLookupTimer");
  -[DialerController _stopDeleteTimer](self, "_stopDeleteTimer");
  -[DialerController _clearDisplayIfNecessary](self, "_clearDisplayIfNecessary");
  -[DialerController deactivateAudioServices](self, "deactivateAudioServices");

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)DialerController;
  -[DialerController viewDidDisappear:](&v5, "viewDidDisappear:");
  -[DialerController setBackgroundStyle:animated:](self, "setBackgroundStyle:animated:", 0, v3);
}

- (void)applicationDidResume
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DialerController;
  -[DialerController applicationDidResume](&v6, "applicationDidResume");
  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DialerAnimation: Calling _resetButtonAnimation in ", v5, 2u);
  }

  -[DialerController _resetButtonAnimation](self, "_resetButtonAnimation");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DialerController;
  v6 = a4;
  -[DialerController touchesBegan:withEvent:](&v10, "touchesBegan:withEvent:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "touchesForView:", self->_dialerView, v10.receiver, v10.super_class));

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView"));
    v9 = objc_opt_respondsToSelector(v8, "endEditing");

    if ((v9 & 1) == 0)
      return;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView"));
    objc_msgSend(v7, "endEditing");
  }

}

- (BOOL)_disableAutomaticKeyboardUI
{
  return 1;
}

- (void)_resetButtonAnimation
{
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
  id v14;
  NSObject *v15;
  uint8_t v16[8];
  _QWORD v17[2];

  if (-[DialerController shouldAnimateCallButton](self, "shouldAnimateCallButton"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DialerController dialerView](self, "dialerView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "callButton"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
    objc_msgSend(v4, "setBackgroundColor:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
    objc_msgSend(v6, "removeAllAnimations");

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layer"));
    objc_msgSend(v8, "removeAllAnimations");

    objc_msgSend(v4, "setUserInteractionEnabled:", 1);
    v17[0] = v4;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DialerController dialerView](self, "dialerView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deleteButton"));
    v17[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));
    v12 = objc_msgSend(v11, "mutableCopy");

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));
    -[DialerController _fadeSubviewsOf:excludingViews:toValue:](self, "_fadeSubviewsOf:excludingViews:toValue:", v13, v12, 1.0);

    -[DialerController setBackgroundStyle:animated:](self, "setBackgroundStyle:animated:", 0, 0);
    -[DialerController setWantsCallButtonAnimation:](self, "setWantsCallButtonAnimation:", 0);
    v14 = sub_1000C5588();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "DialerAnimation: called", v16, 2u);
    }

  }
}

- (void)_callStatusChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = a3;
  if (-[DialerController shouldAnimateCallButton](self, "shouldAnimateCallButton"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
    if (objc_msgSend(v5, "status") == 3)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      if (objc_msgSend(v6, "currentCallCount") == (id)1
        && objc_msgSend(v5, "isEndpointOnCurrentDevice")
        && !objc_msgSend(v5, "isEmergency"))
      {
        v7 = objc_msgSend(UIApp, "isSuspendedEventsOnly");

        if ((v7 & 1) == 0)
        {
          v8 = sub_1000C5588();
          v9 = objc_claimAutoreleasedReturnValue(v8);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v10 = 0;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "DialerAnimation: Calling _animateCallButton in ", v10, 2u);
          }

          -[DialerController _animateCallButton](self, "_animateCallButton");
        }
      }
      else
      {

      }
    }

  }
}

- (DialerController)initWithDialerType:(int)a3
{
  uint64_t v3;
  DialerController *v4;
  DialerController *v5;
  uint64_t Default;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v8;
  PHNumberPadKeyCommandHandler *v9;
  PHNumberPadKeyCommandHandler *keyCommandHandler;
  TUDTMFSoundPlayer *v11;
  TUDTMFSoundPlayer *soundPlayer;
  TUFeatureFlags *v13;
  TUFeatureFlags *featureFlags;
  objc_super v16;

  v3 = *(_QWORD *)&a3;
  v16.receiver = self;
  v16.super_class = (Class)DialerController;
  v4 = -[DialerController init](&v16, "init");
  v5 = v4;
  if (v4)
  {
    Default = CTTelephonyCenterGetDefault(-[DialerController setDialerType:](v4, "setDialerType:", v3));
    CTTelephonyCenterAddObserver(Default, v5, sub_10007292C, kCTSIMSupportSIMNewInsertionNotification, 0, 1);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)sub_100072934, TUCallCenterInCallServiceDidAppearNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v5, "_applicationWillResignActiveNotification:", UIApplicationWillResignActiveNotification, 0);
    v9 = -[PHNumberPadKeyCommandHandler initWithViewController:selector:]([PHNumberPadKeyCommandHandler alloc], "initWithViewController:selector:", v5, "handleKeyCommand:");
    keyCommandHandler = v5->_keyCommandHandler;
    v5->_keyCommandHandler = v9;

    v11 = (TUDTMFSoundPlayer *)objc_alloc_init((Class)TUDTMFSoundPlayer);
    soundPlayer = v5->_soundPlayer;
    v5->_soundPlayer = v11;

    v5->_backgroundStyle = 0;
    v13 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v5->_featureFlags;
    v5->_featureFlags = v13;

  }
  return v5;
}

- (DialerController)initWithDialerType:(int)a3 contactStore:(id)a4
{
  uint64_t v5;
  id v7;
  DialerController *v8;
  DialerController *v9;

  v5 = *(_QWORD *)&a3;
  v7 = a4;
  v8 = -[DialerController initWithDialerType:](self, "initWithDialerType:", v5);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_contactStore, a4);

  return v9;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v4;
  uint64_t Default;
  void *v6;
  PHAbstractDialerView *dialerView;
  void *v8;
  objc_super v9;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  Default = CTTelephonyCenterGetDefault(v4);
  CTTelephonyCenterRemoveEveryObserver(Default, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:", self);

  -[DialerController _stopLookupTimer](self, "_stopLookupTimer");
  -[DialerController _stopDeleteTimer](self, "_stopDeleteTimer");
  -[PHAbstractDialerView removeFromSuperview](self->_dialerView, "removeFromSuperview");
  -[PHAbstractDialerView setDelegate:](self->_dialerView, "setDelegate:", 0);
  dialerView = self->_dialerView;
  self->_dialerView = 0;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView phonePadView](self->_dialerView, "phonePadView"));
  objc_msgSend(v8, "setDelegate:", 0);

  v9.receiver = self;
  v9.super_class = (Class)DialerController;
  -[DialerController dealloc](&v9, "dealloc");
}

+ (int)tabViewType
{
  return 4;
}

+ (id)tabBarIconImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("circle.grid.3x3.fill"));
}

+ (id)tabBarIconName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DIALER"), &stru_10028DC20, CFSTR("General")));

  return v3;
}

+ (id)defaultPNGName
{
  return CFSTR("DefaultNumericOnlyDialer");
}

- (void)_clearDisplayIfNecessary
{
  void *v3;
  id v4;
  void *v5;

  if ((*((_BYTE *)self + 32) & 1) != 0
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance")),
        v4 = objc_msgSend(v3, "currentCallCount"),
        v3,
        v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView"));
    objc_msgSend(v5, "setText:needsFormat:", &stru_10028DC20, 0);

    -[DialerController _updateName](self, "_updateName");
  }
}

- (BOOL)shouldSnapshot
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DialerController presentedViewController](self, "presentedViewController"));
  v3 = v2 == 0;

  return v3;
}

- (void)_stopLookupTimer
{
  NSTimer *lookupTimer;

  -[NSTimer invalidate](self->_lookupTimer, "invalidate");
  lookupTimer = self->_lookupTimer;
  self->_lookupTimer = 0;

}

- (id)contactResultForPhoneNumber:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_alloc((Class)TUContactsDataProviderFetchRequest);
  v6 = objc_msgSend(objc_alloc((Class)TUHandle), "initWithType:value:", 2, v4);

  v7 = objc_msgSend(v5, "initWithHandle:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DialerController phoneNumberPrefixHint](self, "phoneNumberPrefixHint"));
  objc_msgSend(v7, "setPhoneNumberPrefixHint:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DialerController contactsDataProvider](self, "contactsDataProvider"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "executeFetchRequest:", v7));

  return v10;
}

+ (id)callHistoryController
{
  if (qword_1002DC998 != -1)
    dispatch_once(&qword_1002DC998, &stru_100286420);
  return (id)qword_1002DC990;
}

+ (id)mostRecentCallHandleValue
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *i;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "remoteParticipantHandles", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "type") == (id)2)
        {
          v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "value"));

          v5 = (void *)v9;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)lastDialedNumber
{
  uint64_t v3;
  void *v4;
  id v5;

  if (-[DialerController shouldSuppressShowingLastDialedNumber](self, "shouldSuppressShowingLastDialedNumber"))
  {
    v4 = 0;
  }
  else
  {
    v5 = objc_msgSend((id)objc_opt_class(self, v3), "mostRecentCallHandleValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  return (NSString *)v4;
}

- (BOOL)shouldSuppressShowingLastDialedNumber
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 shouldSuppressShowingLastDialedNumberCache;
  _DWORD v9[2];

  if (!self->_loadedShouldSuppressShowingLastDialedNumberCache)
  {
    self->_loadedShouldSuppressShowingLastDialedNumberCache = 1;
    v3 = sub_10000D540(CFSTR("DialerShouldSuppressShowingLastDialedNumber"), TUBundleIdentifierMobilePhoneApplication);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    self->_shouldSuppressShowingLastDialedNumberCache = objc_msgSend(v4, "BOOLValue");

    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      shouldSuppressShowingLastDialedNumberCache = self->_shouldSuppressShowingLastDialedNumberCache;
      v9[0] = 67109120;
      v9[1] = shouldSuppressShowingLastDialedNumberCache;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Loaded shouldSuppressShowingLastDialedNumber from defaults as %d", (uint8_t *)v9, 8u);
    }

  }
  return self->_shouldSuppressShowingLastDialedNumberCache;
}

- (void)setShouldSuppressShowingLastDialedNumber:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  _BOOL4 v10;

  v3 = a3;
  if (-[DialerController shouldSuppressShowingLastDialedNumber](self, "shouldSuppressShowingLastDialedNumber") != a3)
  {
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109376;
      v8[1] = -[DialerController shouldSuppressShowingLastDialedNumber](self, "shouldSuppressShowingLastDialedNumber");
      v9 = 1024;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting shouldSuppressShowingLastDialedNumber from %d to %d", (uint8_t *)v8, 0xEu);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
    sub_10000D5F8(CFSTR("DialerShouldSuppressShowingLastDialedNumber"), v7, TUBundleIdentifierMobilePhoneApplication);

    self->_shouldSuppressShowingLastDialedNumberCache = v3;
  }
}

- (void)setShouldHideDeleteButtonWhenEmpty:(BOOL)a3
{
  self->_shouldHideDeleteButtonWhenEmpty = a3;
  if (-[DialerController shouldHideDeleteButtonWhenEmpty](self, "shouldHideDeleteButtonWhenEmpty"))
    -[DialerController showOrHideDeleteButton](self, "showOrHideDeleteButton");
}

- (void)showOrHideDeleteButton
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DialerController dialerView](self, "dialerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lcdView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  v6 = objc_msgSend(v5, "length") == 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DialerController dialerView](self, "dialerView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "deleteButton"));
  objc_msgSend(v8, "setHidden:", v6);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[DialerController dialerView](self, "dialerView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "deleteButton"));
  if (objc_msgSend(v9, "isHidden"))
  {
    v10 = -[DialerController dialerType](self, "dialerType");

    if (v10 != 1)
      return;
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DialerController dialerView](self, "dialerView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deleteButton"));
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("kPHCarPlayDeleteButtonHideNotification"), v11);

  }
}

- (void)dialerViewTextDidChange:(id)a3
{
  void *v4;
  void *v5;

  if (self->_dialerView == a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lcdView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
    -[DialerController _updateCallButtonEnabledState:updateNameNow:](self, "_updateCallButtonEnabledState:updateNameNow:", v5, 1);

    if (-[DialerController shouldHideDeleteButtonWhenEmpty](self, "shouldHideDeleteButtonWhenEmpty"))
      -[DialerController showOrHideDeleteButton](self, "showOrHideDeleteButton");
  }
}

- (void)dialerView:(id)a3 stringWasPasted:(id)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
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
  PHAbstractDialerView *v27;

  v27 = (PHAbstractDialerView *)a3;
  v6 = a4;
  if (v6 && self->_dialerView == v27)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "encodedDialerString"));
    v8 = objc_msgSend(v6, "isEqualToString:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DialerController contactResultForPhoneNumber:](self, "contactResultForPhoneNumber:", v7));
    v10 = v9;
    if ((v8 & 1) == 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contacts"));
      v12 = objc_msgSend(v11, "count");

      if (!v12)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("QUOTE_%@_QUOTE"), &stru_10028DC20, CFSTR("Dialer")));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v25, v6));
        objc_msgSend(v23, "setText:needsFormat:name:label:", v7, 1, v26, 0);

        -[DialerController _updateCallButtonEnabledState:](self, "_updateCallButtonEnabledState:", v7);
        goto LABEL_13;
      }
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contacts"));
    if (objc_msgSend(v13, "count"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contacts"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
      v16 = objc_msgSend(v15, "isSuggested");

      if ((v16 & 1) == 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedName"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contactLabel"));
        objc_msgSend(v17, "setText:needsFormat:name:label:", v7, 1, v18, v19);

        goto LABEL_11;
      }
    }
    else
    {

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[DialerController pseudoNameStringForDestinationID:](self, "pseudoNameStringForDestinationID:", v7));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView"));
    objc_msgSend(v20, "setText:needsFormat:name:label:", v7, 1, 0, 0);

    if (!v17)
    {
LABEL_12:

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "text"));
      -[DialerController _updateCallButtonEnabledState:](self, "_updateCallButtonEnabledState:", v22);

LABEL_13:
      goto LABEL_14;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView"));
    objc_msgSend(v18, "setName:numberLabel:suggestion:", v17, 0, 1);
LABEL_11:

    goto LABEL_12;
  }
LABEL_14:

}

- (id)pseudoNameStringForDestinationID:(id)a3
{
  return 0;
}

- (void)_updateCallButtonEnabledState:(id)a3 updateNameNow:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  -[DialerController _updateCallButtonEnabledState:](self, "_updateCallButtonEnabledState:", a3);
  -[DialerController _updateLCDNameLabelWithAMatchingName:](self, "_updateLCDNameLabelWithAMatchingName:", !v4);
}

- (void)_updateLCDNameLabelWithAMatchingName:(BOOL)a3
{
  void *v4;
  void *v5;
  NSTimer *v6;
  NSTimer *lookupTimer;

  if (a3
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text")),
        v5,
        v4,
        v5))
  {
    v6 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_updateName", 0, 0, 0.2));
    lookupTimer = self->_lookupTimer;
    self->_lookupTimer = v6;

  }
  else
  {
    -[DialerController _updateName](self, "_updateName");
  }
}

- (void)_updateLCDNameLabelWithOriginallyPastedString:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView"));
  v5 = objc_opt_respondsToSelector(v4, "setName:numberLabel:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView"));
    objc_msgSend(v6, "setName:numberLabel:suggestion:", v7, &stru_10028DC20, 0);

  }
}

- (void)_updateCallButtonEnabledState:(id)a3
{
  uint64_t v4;
  int valid;
  void *v6;
  double v7;
  void *v8;
  float v9;
  float v10;
  id v11;

  v11 = a3;
  if (self->_lookupTimer)
    -[DialerController _stopLookupTimer](self, "_stopLookupTimer");
  v4 = TUNetworkCountryCode();
  valid = PNIsValidPhoneNumberForCountry(v11, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView callButton](self->_dialerView, "callButton"));
  v8 = v6;
  if (valid)
  {
    LODWORD(v7) = -1097229926;
LABEL_7:
    objc_msgSend(v6, "setCharge:", v7);

    goto LABEL_8;
  }
  objc_msgSend(v6, "charge");
  v10 = fabsf(v9);

  if (v10 >= 2.2204e-16)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView callButton](self->_dialerView, "callButton"));
    v8 = v6;
    LODWORD(v7) = 0;
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_fadeSubviewsOf:(id)a3 excludingViews:(id)a4 toValue:(double)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v8 = a3;
  v9 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subviews", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "containsObject:", v15) & 1) == 0)
          objc_msgSend(v15, "setAlpha:", a5);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "superview"));
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "superview"));
    -[DialerController _fadeSubviewsOf:excludingViews:toValue:](self, "_fadeSubviewsOf:excludingViews:toValue:", v17, v9, a5);

  }
}

- (void)_animateCallButton
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint8_t v20[8];
  _QWORD v21[5];
  id v22;
  _QWORD v23[2];

  if (-[DialerController shouldAnimateCallButton](self, "shouldAnimateCallButton"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DialerController dialerView](self, "dialerView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "callButton"));

    objc_msgSend(v4, "setUserInteractionEnabled:", 0);
    -[DialerController setBackgroundStyle:animated:](self, "setBackgroundStyle:animated:", 4, 1);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100073D58;
    v21[3] = &unk_100285158;
    v21[4] = self;
    v5 = v4;
    v22 = v5;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v21, 0.50999999);
    if ((objc_opt_respondsToSelector(v5, "_animationWillBegin") & 1) != 0)
      objc_msgSend(v5, "performSelector:", "_animationWillBegin");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("transform.rotation.z")));
    objc_msgSend(v6, "setMass:", 2.0);
    objc_msgSend(v6, "setStiffness:", 300.0);
    objc_msgSend(v6, "setDamping:", 50.0);
    objc_msgSend(v6, "setDuration:", 0.50999999);
    objc_msgSend(v6, "setToValue:", &off_100297418);
    objc_msgSend(v6, "setFillMode:", kCAFillModeForwards);
    objc_msgSend(v6, "setRemovedOnCompletion:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("backgroundColor")));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor")));
    v9 = objc_msgSend(v8, "CGColor");

    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor")));
    v11 = objc_msgSend(v10, "CGColor");

    v23[0] = v9;
    v23[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 2));
    objc_msgSend(v7, "setValues:", v12);

    objc_msgSend(v7, "setKeyTimes:", &off_100297158);
    objc_msgSend(v7, "setDuration:", 0.254999995);
    objc_msgSend(v7, "setFillMode:", kCAFillModeForwards);
    objc_msgSend(v7, "setRemovedOnCompletion:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageView"));
    objc_msgSend(v13, "setClipsToBounds:", 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageView"));
    objc_msgSend(v14, "setContentMode:", 4);

    +[CATransaction begin](CATransaction, "begin");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layer"));
    objc_msgSend(v16, "addAnimation:forKey:", v6, CFSTR("rollButtonAnimation"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
    objc_msgSend(v17, "addAnimation:forKey:", v7, CFSTR("buttonColorAnimation"));

    +[CATransaction commit](CATransaction, "commit");
    v18 = sub_1000C5588();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "DialerAnimation: Called ", v20, 2u);
    }

  }
}

- (void)searchFor:(id)a3 shouldRefreshResult:(BOOL)a4 completionHandler:(id)a5
{
  id v6;
  NSObject *v7;

  v6 = sub_1000C5588();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_1001A9794(a2, v7);

}

- (void)_callButtonPressed:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[DialerController callProviderManager](self, "callProviderManager", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "telephonyProvider"));
  -[DialerController _callButtonPressedActionWithCallProvider:](self, "_callButtonPressedActionWithCallProvider:", v4);

}

- (void)_callButtonPressedActionWithCallProvider:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[DialerController setBackgroundStyle:animated:](self, "setBackgroundStyle:animated:", 4, 1);
  if (-[DialerController digitsEntered](self, "digitsEntered"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DialerController dialerView](self, "dialerView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lcdView"));
    objc_msgSend(v5, "endEditing");

    -[DialerController setWantsCallButtonAnimation:](self, "setWantsCallButtonAnimation:", 1);
    -[DialerController performCallActionForCallProvider:](self, "performCallActionForCallProvider:", v6);
  }
  else
  {
    -[DialerController restoreLastDialedNumber](self, "restoreLastDialedNumber");
  }

}

- (void)showRestrictedAlertWithMessage:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = TUBundle(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("RESTRICTED_CONTENT"), &stru_10028DC20, CFSTR("TelephonyUtilities")));
  v13 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v7, v4, 1));

  v9 = TUBundle(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10028DC20, CFSTR("TelephonyUtilities")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 1, 0));
  objc_msgSend(v13, "addAction:", v12);

  -[DialerController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
}

- (id)restrictedSubtitleForHandle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSBundle *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  v5 = objc_alloc((Class)TUContactsDataProviderFetchRequest);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle handleWithDestinationID:](TUHandle, "handleWithDestinationID:", v4));
  v7 = objc_msgSend(v5, "initWithHandle:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DialerController contactsDataProvider](self, "contactsDataProvider"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "executeFetchRequest:", v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedName"));
  if (objc_msgSend(v10, "length"))
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedName"));
  else
    v11 = v4;
  v12 = v11;

  v13 = objc_msgSend(v12, "length");
  if (!v13)
  {
    v15 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("UNKNOWN"), &stru_10028DC20, CFSTR("PHCarPlay")));

    v12 = (void *)v17;
  }
  v18 = TUBundle(v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("DOWNTIME_CALLER_ALTERNATE_%@"), &stru_10028DC20, CFSTR("TelephonyUtilities")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v12));

  return v21;
}

- (void)phonePad:(id)a3 dialerCharacterButtonWasHeld:(int64_t)a4
{
  void *v5;
  void *v6;
  id v7;

  if (!a4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView", a3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
    v7 = objc_msgSend(v6, "length");

    if (v7 == (id)1)
      -[DialerController _dialVoicemail](self, "_dialVoicemail");
  }
}

- (void)performCharacterAddAction:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[DialerController dialerView](self, "dialerView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "phonePadView"));
  -[DialerController phonePad:appendString:playDTMFTone:](self, "phonePad:appendString:playDTMFTone:", v5, v4, 0);

}

- (void)phonePad:(id)a3 appendString:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[DialerController setDialLastDialedNumberByDoubleTap:](self, "setDialLastDialedNumberByDoubleTap:", 0);
  -[DialerController phonePad:appendString:playDTMFTone:](self, "phonePad:appendString:playDTMFTone:", v7, v6, -[DialerController dialerType](self, "dialerType") == 2);

}

- (void)phonePad:(id)a3 appendString:(id)a4 playDTMFTone:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;

  v5 = a5;
  v8 = a4;
  -[DialerController _phonePad:appendString:suppressClearingDialedNumber:](self, "_phonePad:appendString:suppressClearingDialedNumber:", a3, v8, 0);
  -[DialerController setBackgroundStyle:animated:](self, "setBackgroundStyle:animated:", 4, 1);
  if (v5)
  {
    v9 = sub_1000C5588();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Will play DTMF tone due to string being appended (%@)", (uint8_t *)&v11, 0xCu);
    }

    +[DialerController playDTMFToneForKey:](DialerController, "playDTMFToneForKey:", objc_msgSend(v8, "characterAtIndex:", 0));
  }

}

- (void)_phonePad:(id)a3 appendString:(id)a4 suppressClearingDialedNumber:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  const __CFString *v12;
  id v13;

  v7 = a4;
  -[DialerController setDialLastDialedNumberByDoubleTap:](self, "setDialLastDialedNumberByDoubleTap:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView"));
  objc_msgSend(v9, "insertStringAtCurrentPosition:", v7);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView"));
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "text"));

  if (-[__CFString length](v11, "length") == (id)1
    && -[__CFString characterAtIndex:](v11, "characterAtIndex:", 0) == 44)
  {
    v12 = CFSTR("*");
LABEL_7:

    v11 = (__CFString *)v12;
    goto LABEL_8;
  }
  if (-[__CFString length](v11, "length") == (id)1
    && -[__CFString characterAtIndex:](v11, "characterAtIndex:", 0) == 59)
  {
    v12 = CFSTR("#");
    goto LABEL_7;
  }
LABEL_8:
  -[DialerController _updateCallButtonEnabledState:updateNameNow:](self, "_updateCallButtonEnabledState:updateNameNow:", v11, objc_msgSend(v13, "length") == 0);
  *((_BYTE *)self + 32) &= ~1u;
  if (!a5)
    -[DialerController setShouldSuppressShowingLastDialedNumber:](self, "setShouldSuppressShowingLastDialedNumber:", 1);

}

- (void)phonePad:(id)a3 replaceLastDigitWithString:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;

  v5 = a4;
  -[DialerController setDialLastDialedNumberByDoubleTap:](self, "setDialLastDialedNumberByDoubleTap:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView"));
  objc_msgSend(v6, "insertStringAtCurrentPosition:deletingPreviousCharacter:", v5, 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "text"));

  if (objc_msgSend(v10, "length") == (id)1 && objc_msgSend(v10, "characterAtIndex:", 0) == 44)
  {
    v8 = CFSTR("*");
LABEL_7:
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView"));
    objc_msgSend(v9, "setText:needsFormat:", v8, 1);

    -[DialerController _updateCallButtonEnabledState:updateNameNow:](self, "_updateCallButtonEnabledState:updateNameNow:", v8, 0);
    goto LABEL_8;
  }
  if (objc_msgSend(v10, "length") == (id)1 && objc_msgSend(v10, "characterAtIndex:", 0) == 59)
  {
    v8 = CFSTR("#");
    goto LABEL_7;
  }
LABEL_8:

}

- (void)phonePadDeleteLastDigit:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView", a3));
  objc_msgSend(v4, "deleteCharacter");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
  -[DialerController _updateCallButtonEnabledState:updateNameNow:](self, "_updateCallButtonEnabledState:updateNameNow:", v6, 0);

  *((_BYTE *)self + 32) &= ~1u;
  -[DialerController setShouldSuppressShowingLastDialedNumber:](self, "setShouldSuppressShowingLastDialedNumber:", 1);
}

- (NSString)phoneNumberPrefixHint
{
  NSString *phoneNumberPrefixHint;
  void *v4;
  uint64_t v5;
  NSString *v6;
  NSString *v7;

  phoneNumberPrefixHint = self->_phoneNumberPrefixHint;
  if (!phoneNumberPrefixHint)
  {
    v4 = (void *)CTSettingCopyMyPhoneNumber(0, a2);
    v5 = UIPhonePrefixFromNumber();
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(v5);
    v7 = self->_phoneNumberPrefixHint;
    self->_phoneNumberPrefixHint = v6;

    phoneNumberPrefixHint = self->_phoneNumberPrefixHint;
  }
  return phoneNumberPrefixHint;
}

- (void)handleKeyCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DialerController dialerView](self, "dialerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "phonePadView"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DialerController keyCommandHandler](self, "keyCommandHandler"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100074900;
  v11[3] = &unk_100286448;
  v11[4] = self;
  v12 = v6;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100074988;
  v9[3] = &unk_100286470;
  v9[4] = self;
  v10 = v12;
  v8 = v12;
  objc_msgSend(v7, "handleKeyCommand:receivedCharacterBlock:receivedSpecialCharacterBlock:", v4, v11, v9);

}

- (void)phonePadDidEndSounds:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (self->_dialerType == 2 && self->_dtmfPlaying)
  {
    v5 = v4;
    CTDTMFPlayStop();
    v4 = v5;
    self->_dtmfPlaying = 0;
  }

}

- (void)phonePad:(id)a3 keyUp:(char)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  v4 = a4;
  v6 = a3;
  if (self->_dialerType != 2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "text"));
    v9 = +[DialerController shouldStringAutoDial:givenLastChar:](DialerController, "shouldStringAutoDial:givenLastChar:", v8, v4);

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DialerController callProviderManager](self, "callProviderManager"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "telephonyProvider"));

      if (v11)
      {
        -[DialerController performCallActionForCallProvider:](self, "performCallActionForCallProvider:", v11);
      }
      else
      {
        v12 = sub_1000C5588();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_1001A9828(v13, v14, v15, v16, v17, v18, v19, v20);

      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView"));
      objc_msgSend(v21, "setText:needsFormat:", &stru_10028DC20, 0);

    }
  }

}

- (void)_dialVoicemail
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView phonePadView](self->_dialerView, "phonePadView"));
  objc_msgSend(v3, "cancelTouchTracking");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DialerController callProviderManager](self, "callProviderManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "voicemailProvider"));

  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)TUDialRequest), "initWithProvider:", v5);
    objc_msgSend(v6, "setDialType:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DialerController selectedSenderIdentity](self, "selectedSenderIdentity"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accountUUID"));
    objc_msgSend(v6, "setLocalSenderIdentityAccountUUID:", v8);

    -[DialerController _dialWithRequest:](self, "_dialWithRequest:", v6);
  }
  else
  {
    v9 = sub_1000C5588();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1001A985C(v10, v11, v12, v13, v14, v15, v16, v17);

  }
}

- (void)_dialWithRequest:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  DialerController *v12;
  uint8_t buf[4];
  id v14;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  *((_BYTE *)self + 32) |= 1u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100074D7C;
  v10[3] = &unk_100284DF0;
  v11 = v4;
  v12 = self;
  v9 = v4;
  objc_msgSend(v7, "openURL:withCompletionHandler:", v8, v10);

}

- (void)_deleteRepeat
{
  void *v3;
  void *v4;
  id v5;

  -[DialerController phonePadDeleteLastDigit:](self, "phonePadDeleteLastDigit:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
  v5 = objc_msgSend(v4, "length");

  if (!v5)
    -[DialerController _stopDeleteTimer](self, "_stopDeleteTimer");
  *((_BYTE *)self + 32) |= 2u;
}

- (void)_startDeleteTimer
{
  NSTimer *v3;
  NSTimer *deleteTimer;

  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_deleteRepeat", 0, 1, 0.04));
  deleteTimer = self->_deleteTimer;
  self->_deleteTimer = v3;

  -[DialerController _deleteRepeat](self, "_deleteRepeat");
}

- (void)_stopDeleteTimer
{
  NSTimer *deleteTimer;

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_startDeleteTimer", 0);
  -[NSTimer invalidate](self->_deleteTimer, "invalidate");
  deleteTimer = self->_deleteTimer;
  self->_deleteTimer = 0;

}

- (void)handleSwipeGesture:(id)a3
{
  -[DialerController _deleteButtonClicked:](self, "_deleteButtonClicked:", 0);
}

- (void)_deleteButtonClicked:(id)a3
{
  -[DialerController setDialLastDialedNumberByDoubleTap:](self, "setDialLastDialedNumberByDoubleTap:", 0);
  if ((*((_BYTE *)self + 32) & 2) != 0)
    -[DialerController _stopDeleteTimer](self, "_stopDeleteTimer");
  else
    -[DialerController performDeleteAction](self, "performDeleteAction");
}

- (void)_deleteButtonDown:(id)a3
{
  *((_BYTE *)self + 32) &= ~2u;
  -[DialerController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_startDeleteTimer", 0, 0.6);
}

- (BOOL)digitsEntered
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (void)restoreLastDialedNumber
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  _QWORD v15[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  if (objc_msgSend(v3, "currentCallCount"))
  {

LABEL_3:
    v4 = sub_1000C5588();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v7 = objc_msgSend(v6, "currentCallCount") != 0;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[DialerController lastDialedNumber](self, "lastDialedNumber"));
      v14 = 67109376;
      LODWORD(v15[0]) = v7;
      WORD2(v15[0]) = 1024;
      *(_DWORD *)((char *)v15 + 6) = v8 == 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not updating visible number to saved redialed number because we are in call (%d) or we don't have a redialed number saved (%d)", (uint8_t *)&v14, 0xEu);

    }
    return;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DialerController lastDialedNumber](self, "lastDialedNumber"));

  if (!v9)
    goto LABEL_3;
  v10 = sub_1000C5588();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DialerController lastDialedNumber](self, "lastDialedNumber"));
    v14 = 138412290;
    v15[0] = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updating visible number to saved redialed number: %@", (uint8_t *)&v14, 0xCu);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DialerController lastDialedNumber](self, "lastDialedNumber"));
  -[DialerController _phonePad:appendString:suppressClearingDialedNumber:](self, "_phonePad:appendString:suppressClearingDialedNumber:", 0, v13, 1);

  -[DialerController _updateName](self, "_updateName");
  -[DialerController setDialLastDialedNumberByDoubleTap:](self, "setDialLastDialedNumberByDoubleTap:", 1);
}

- (void)performCallActionForCallProvider:(id)a3
{
  -[DialerController performCallActionForCallProvider:video:](self, "performCallActionForCallProvider:video:", a3, 0);
}

- (void)performCallActionForCallProvider:(id)a3 video:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[DialerController selectedSenderIdentity](self, "selectedSenderIdentity"));
  -[DialerController performCallActionForCallProvider:video:senderIdentity:](self, "performCallActionForCallProvider:video:senderIdentity:", v6, v4, v7);

}

- (void)performCallActionForCallProvider:(id)a3 video:(BOOL)a4 senderIdentity:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;

  v6 = a4;
  v25 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text"));

  if (objc_msgSend(v10, "length"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DialerController dialerView](self, "dialerView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lcdView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "text"));

    if (-[DialerController dialerType](self, "dialerType") == 1
      && (v14 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance")),
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "callFilterController")),
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v13)),
          v17 = objc_msgSend(v15, "shouldRestrictAddresses:forBundleIdentifier:", v16, TUBundleIdentifierMobilePhoneApplication), v16, v15, v14, v17))
    {
      v18 = (id)objc_claimAutoreleasedReturnValue(-[DialerController restrictedSubtitleForHandle:](self, "restrictedSubtitleForHandle:", v13));
      -[DialerController showRestrictedAlertWithMessage:](self, "showRestrictedAlertWithMessage:", v18);
    }
    else
    {
      -[DialerController setShouldSuppressShowingLastDialedNumber:](self, "setShouldSuppressShowingLastDialedNumber:", 0);
      if (!v25)
        goto LABEL_14;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v19));
      v21 = +[DialerController launchFieldTestIfNeeded:](DialerController, "launchFieldTestIfNeeded:", v20);

      if ((v21 & 1) != 0)
        goto LABEL_14;
      v18 = objc_msgSend(objc_alloc((Class)TUHandle), "initWithType:value:", 2, v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[TUDialRequest dialRequestForCallProvider:handle:](TUDialRequest, "dialRequestForCallProvider:handle:", v25, v18));
      if (-[DialerController dialLastDialedNumberByDoubleTap](self, "dialLastDialedNumberByDoubleTap"))
        v23 = 26;
      else
        v23 = 1;
      objc_msgSend(v22, "setOriginatingUIType:", v23);
      objc_msgSend(v22, "setPerformDialAssist:", objc_msgSend(v25, "isTelephonyProvider") ^ 1);
      objc_msgSend(v22, "setPerformLocalDialAssist:", 0);
      objc_msgSend(v22, "setVideo:", v6);
      if (v8)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accountUUID"));
        objc_msgSend(v22, "setLocalSenderIdentityAccountUUID:", v24);

      }
      -[DialerController _dialWithRequest:](self, "_dialWithRequest:", v22);

    }
LABEL_14:

  }
}

- (void)performDeleteAction
{
  -[DialerController _stopDeleteTimer](self, "_stopDeleteTimer");
  -[DialerController phonePadDeleteLastDigit:](self, "phonePadDeleteLastDigit:", 0);
}

- (void)_handleSIMInsertionOrRemoval
{
  -[DialerController setPhoneNumberPrefixHint:](self, "setPhoneNumberPrefixHint:", 0);
  -[DialerController setContactsDataProvider:](self, "setContactsDataProvider:", 0);
}

- (BOOL)defaultActionIsFaceTimeAudio
{
  return 0;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  -[DialerController setBackgroundStyle:animated:](self, "setBackgroundStyle:animated:", a3, 0);
}

- (void)setBackgroundStyle:(int64_t)a3 animated:(BOOL)a4
{
  id v5;
  _QWORD v6[5];

  if (self->_backgroundStyle != a3)
  {
    self->_backgroundStyle = a3;
    if (a4)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1000755B4;
      v6[3] = &unk_100284948;
      v6[4] = a3;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v6, 0.5);
    }
    else
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      objc_msgSend(v5, "_setBackgroundStyle:", a3);

    }
  }
}

- (void)handleApplicationDidEnterBackgroundNotification:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  -[DialerController deactivateAudioServices](self, "deactivateAudioServices", a3);
  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Application entered the background. Keypad button tones are disabled.", v5, 2u);
  }

}

- (void)handleApplicationWillEnterForegroundNotification:(id)a3
{
  unsigned int v3;
  id v4;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;

  v3 = -[DialerController requestAudioServicesActivate](self, "requestAudioServicesActivate", a3);
  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    v7 = 138412290;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Application is entering the foreground. Keypad button tones are enabled: %@.", (uint8_t *)&v7, 0xCu);
  }

}

- (void)deactivateAudioServices
{
  -[DialerController setAudioServicesActivated:](self, "setAudioServicesActivated:", 0);
}

- (BOOL)requestAudioServicesActivate
{
  void *v3;
  _BOOL8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  if (objc_msgSend(v3, "currentCallCount"))
    v4 = self->_dialerType == 2;
  else
    v4 = 1;

  -[DialerController setAudioServicesActivated:](self, "setAudioServicesActivated:", v4);
  return v4;
}

- (void)setAudioServicesActivated:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000757F0;
  v3[3] = &unk_100284C98;
  v3[4] = self;
  v4 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (CNContactStore)contactStore
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  CNContactStore *v9;
  CNContactStore *contactStore;
  CNContactStore *v11;
  CNContactStore *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
  v5 = objc_msgSend(v4, "isEqualToString:", TUBundleIdentifierInCallServiceApplication);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayedCallFromCalls:", 0));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactStoreConfiguration tu_contactStoreConfigurationForCall:](CNContactStoreConfiguration, "tu_contactStoreConfigurationForCall:", v7));
    objc_msgSend(v8, "setIncludeDonatedContacts:", 1);
    objc_msgSend(v8, "setIncludeSuggestedContacts:", 1);
    v9 = (CNContactStore *)objc_msgSend(objc_alloc((Class)CNContactStore), "initWithConfiguration:", v8);

  }
  else
  {
    contactStore = self->_contactStore;
    if (!contactStore)
    {
      v11 = (CNContactStore *)objc_claimAutoreleasedReturnValue(+[CNContactStore suggestedContactStore](CNContactStore, "suggestedContactStore"));
      v12 = self->_contactStore;
      self->_contactStore = v11;

      contactStore = self->_contactStore;
    }
    v9 = contactStore;
  }
  return v9;
}

- (TUContactsDataProvider)contactsDataProvider
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  void *v7;
  TUContactsDataProvider *v8;
  TUContactsDataProvider *contactsDataProvider;
  id v10;
  void *v11;
  TUContactsDataProvider *v12;
  TUContactsDataProvider *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
  v5 = objc_msgSend(v4, "isEqualToString:", TUBundleIdentifierInCallServiceApplication);

  if (v5)
  {
    v6 = objc_alloc((Class)TUContactsDataProvider);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DialerController contactStore](self, "contactStore"));
    v8 = (TUContactsDataProvider *)objc_msgSend(v6, "initWithContactsDataSource:", v7);

  }
  else
  {
    contactsDataProvider = self->_contactsDataProvider;
    if (!contactsDataProvider)
    {
      v10 = objc_alloc((Class)TUContactsDataProvider);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[DialerController contactStore](self, "contactStore"));
      v12 = (TUContactsDataProvider *)objc_msgSend(v10, "initWithContactsDataSource:", v11);
      v13 = self->_contactsDataProvider;
      self->_contactsDataProvider = v12;

      contactsDataProvider = self->_contactsDataProvider;
    }
    v8 = contactsDataProvider;
  }
  return v8;
}

- (void)setCallProviderManager:(id)a3
{
  objc_storeStrong((id *)&self->_callProviderManager, a3);
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (PHAbstractDialerView)dialerView
{
  return (PHAbstractDialerView *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)shouldHideDeleteButtonWhenEmpty
{
  return self->_shouldHideDeleteButtonWhenEmpty;
}

- (BOOL)shouldSuppressShowingLastDialedNumberCache
{
  return self->_shouldSuppressShowingLastDialedNumberCache;
}

- (void)setShouldSuppressShowingLastDialedNumberCache:(BOOL)a3
{
  self->_shouldSuppressShowingLastDialedNumberCache = a3;
}

- (BOOL)loadedShouldSuppressShowingLastDialedNumberCache
{
  return self->_loadedShouldSuppressShowingLastDialedNumberCache;
}

- (void)setLoadedShouldSuppressShowingLastDialedNumberCache:(BOOL)a3
{
  self->_loadedShouldSuppressShowingLastDialedNumberCache = a3;
}

- (TUSenderIdentity)selectedSenderIdentity
{
  return (TUSenderIdentity *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSelectedSenderIdentity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void)setPhoneNumberPrefixHint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int)dialerType
{
  return self->_dialerType;
}

- (void)setDialerType:(int)a3
{
  self->_dialerType = a3;
}

- (BOOL)wantsCallButtonAnimation
{
  return self->_wantsCallButtonAnimation;
}

- (void)setWantsCallButtonAnimation:(BOOL)a3
{
  self->_wantsCallButtonAnimation = a3;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setContactsDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_contactsDataProvider, a3);
}

- (PHNumberPadKeyCommandHandler)keyCommandHandler
{
  return self->_keyCommandHandler;
}

- (TUDTMFSoundPlayer)soundPlayer
{
  return self->_soundPlayer;
}

- (BOOL)dialLastDialedNumberByDoubleTap
{
  return self->_dialLastDialedNumberByDoubleTap;
}

- (void)setDialLastDialedNumberByDoubleTap:(BOOL)a3
{
  self->_dialLastDialedNumberByDoubleTap = a3;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
  objc_storeStrong((id *)&self->_featureFlags, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_soundPlayer, 0);
  objc_storeStrong((id *)&self->_keyCommandHandler, 0);
  objc_storeStrong((id *)&self->_contactsDataProvider, 0);
  objc_storeStrong((id *)&self->_phoneNumberPrefixHint, 0);
  objc_storeStrong((id *)&self->_selectedSenderIdentity, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
  objc_storeStrong((id *)&self->_lookupTimer, 0);
  objc_storeStrong((id *)&self->_deleteTimer, 0);
  objc_storeStrong((id *)&self->_dialerView, 0);
}

@end

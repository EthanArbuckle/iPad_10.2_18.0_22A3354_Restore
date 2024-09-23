@implementation CBIdleSleepManager

+ (id)sharedInstance
{
  if (qword_10008BD90 != -1)
    dispatch_once(&qword_10008BD90, &stru_100075E40);
  return (id)qword_10008BD88;
}

- (CBIdleSleepManager)init
{
  CBIdleSleepManager *v2;
  uint64_t v3;
  NSObject *v4;
  NSMutableSet *v5;
  NSMutableSet *idleTimerDisabledReasons;
  void *v7;
  AWAttentionAwarenessClient *v8;
  AWAttentionAwarenessClient *attentionAwarenessClient;
  AWAttentionAwarenessClient *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id buf[2];
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CBIdleSleepManager;
  v2 = -[CBIdleSleepManager init](&v16, "init");
  if (v2)
  {
    v3 = CheckerBoardLogHandleForCategory(4);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Registering idle timer notifications…", (uint8_t *)buf, 2u);
    }

    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    idleTimerDisabledReasons = v2->_idleTimerDisabledReasons;
    v2->_idleTimerDisabledReasons = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBIdleSleepManager configurationWithAttentionLostTimeout:](v2, "configurationWithAttentionLostTimeout:", 30.0));
    v8 = (AWAttentionAwarenessClient *)objc_alloc_init((Class)AWAttentionAwarenessClient);
    attentionAwarenessClient = v2->_attentionAwarenessClient;
    v2->_attentionAwarenessClient = v8;

    -[AWAttentionAwarenessClient setConfiguration:shouldReset:](v2->_attentionAwarenessClient, "setConfiguration:shouldReset:", v7, 1);
    -[CBIdleSleepManager _initTapToWake](v2, "_initTapToWake");
    objc_initWeak(buf, v2);
    v10 = v2->_attentionAwarenessClient;
    v11 = &_dispatch_main_q;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000231E0;
    v13[3] = &unk_100075E68;
    objc_copyWeak(&v14, buf);
    -[AWAttentionAwarenessClient setEventHandlerWithQueue:block:](v10, "setEventHandlerWithQueue:block:", &_dispatch_main_q, v13);

    BKSHIDServicesAmbientLightSensorEnableAutoBrightness(1);
    v2->_displayDim = 0;
    -[CBIdleSleepManager _undimDisplay](v2, "_undimDisplay");
    objc_destroyWeak(&v14);
    objc_destroyWeak(buf);

  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  unsigned int *p_rootDomainConnect;
  uint64_t v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Dealloc was called", buf, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  p_rootDomainConnect = &self->_rootDomainConnect;
  if (self->_rootDomainConnect)
  {
    v7 = CheckerBoardLogHandleForCategory(4);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Deregistering and closing connection", buf, 2u);
    }

    IODeregisterForSystemPower(&self->_rootDomainConnect);
    IOServiceClose(*p_rootDomainConnect);
    *p_rootDomainConnect = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)CBIdleSleepManager;
  -[CBIdleSleepManager dealloc](&v9, "dealloc");
}

- (id)configurationWithAttentionLostTimeout:(double)a3
{
  id v4;

  v4 = objc_alloc_init((Class)AWAttentionAwarenessConfiguration);
  objc_msgSend(v4, "setIdentifier:", CFSTR("CBIdleTimer"));
  objc_msgSend(v4, "setEventMask:", 3967);
  objc_msgSend(v4, "setAttentionLostTimeout:", a3);
  return v4;
}

- (void)_setHIDUILockedState:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;
  NSObject *v5;
  _DWORD v6[2];

  if (byte_10008B318 != a3)
  {
    v3 = a3;
    v4 = CheckerBoardLogHandleForCategory(4);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Setting UI locked state to %d", (uint8_t *)v6, 8u);
    }

    BKSHIDServicesSetHIDUILockedState(v3, 0);
    byte_10008B318 = v3;
  }
}

- (void)_undimDisplay
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  AWAttentionAwarenessClient *attentionAwarenessClient;
  unsigned __int8 v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("CBScreenWillUndimNotification"), 0);

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_screenBlanked", 0);
  -[CBIdleSleepManager _disableTapToWake](self, "_disableTapToWake");
  v4 = CheckerBoardLogHandleForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Undimming display…", buf, 2u);
  }

  BKSDisplayServicesSetScreenBlanked(0, v6);
  BKSHIDServicesSetBacklightFactorWithFadeDuration(1, 1.0, 0.5);
  -[CBIdleSleepManager setDisplayDim:](self, "setDisplayDim:", 0);
  attentionAwarenessClient = self->_attentionAwarenessClient;
  v19 = 0;
  v8 = -[AWAttentionAwarenessClient resumeWithError:](attentionAwarenessClient, "resumeWithError:", &v19);
  v9 = v19;
  if ((v8 & 1) == 0)
  {
    v10 = CheckerBoardLogHandleForCategory(4);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000458C4((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);

  }
  -[CBIdleSleepManager _preventIdleSleep](self, "_preventIdleSleep");
  -[CBIdleSleepManager _setHIDUILockedState:](self, "_setHIDUILockedState:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v18, "postNotificationName:object:", CFSTR("CBScreenDidUndimNotification"), 0);

}

- (void)undimDisplay
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  if (-[CBIdleSleepManager isDisplayDim](self, "isDisplayDim"))
  {
    v3 = CheckerBoardLogHandleForCategory(4);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Display is off. Turning display on…", v5, 2u);
    }

    -[CBIdleSleepManager _undimDisplay](self, "_undimDisplay");
  }
}

- (void)dimDisplay
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  AWAttentionAwarenessClient *attentionAwarenessClient;
  unsigned __int8 v7;
  id v8;
  double v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[16];
  NSRunLoopMode v22;

  if (!-[CBIdleSleepManager isDisplayDim](self, "isDisplayDim"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("CBScreenWillDimNotification"), 0);

    v4 = CheckerBoardLogHandleForCategory(4);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Dimming display…", buf, 2u);
    }

    BKSHIDServicesSetBacklightFactorWithFadeDuration(1, 0.0, 0.25);
    -[CBIdleSleepManager setDisplayDim:](self, "setDisplayDim:", 1);
    attentionAwarenessClient = self->_attentionAwarenessClient;
    v20 = 0;
    v7 = -[AWAttentionAwarenessClient suspendWithError:](attentionAwarenessClient, "suspendWithError:", &v20);
    v8 = v20;
    if ((v7 & 1) == 0)
    {
      v10 = CheckerBoardLogHandleForCategory(4);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_100045928((uint64_t)v8, v11, v12, v13, v14, v15, v16, v17);

    }
    LODWORD(v9) = 1.0;
    -[CBIdleSleepManager _preventIdleSleepForNumberOfSeconds:](self, "_preventIdleSleepForNumberOfSeconds:", v9);
    -[CBIdleSleepManager resetIdleTimerAndUndim:](self, "resetIdleTimerAndUndim:", 0);
    -[CBIdleSleepManager _setHIDUILockedState:](self, "_setHIDUILockedState:", 1);
    v22 = NSRunLoopCommonModes;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    -[CBIdleSleepManager performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", "_screenBlanked", 0, v18, 0.25);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v19, "postNotificationName:object:", CFSTR("CBScreenDidDimNotification"), 0);

  }
}

- (void)_screenBlanked
{
  BKSDisplayServicesSetScreenBlanked(1, a2);
  -[CBIdleSleepManager _enableTapToWake](self, "_enableTapToWake");
}

- (void)_allowIdleSleep
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CheckerBoardLogHandleForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Allowing idle sleep…", v5, 2u);
  }

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_allowIdleSleep", 0);
  -[CBIdleSleepManager setPreventIdleSleep:forReason:](self, "setPreventIdleSleep:forReason:", 0, CFSTR("backlight"));
}

- (void)_preventIdleSleep
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CheckerBoardLogHandleForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Preventing idle sleep…", v5, 2u);
  }

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_allowIdleSleep", 0);
  -[CBIdleSleepManager setPreventIdleSleep:forReason:](self, "setPreventIdleSleep:forReason:", 1, CFSTR("backlight"));
}

- (void)_preventIdleSleepForNumberOfSeconds:(float)a3
{
  uint64_t v5;
  NSObject *v6;
  double v7;
  void *v8;
  NSRunLoopMode v9;
  uint8_t buf[4];
  double v11;

  if (-[CBIdleSleepManager isDisplayDim](self, "isDisplayDim"))
  {
    v5 = CheckerBoardLogHandleForCategory(4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = a3;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Preventing idle sleep for %f seconds…", buf, 0xCu);
    }

    -[CBIdleSleepManager _preventIdleSleep](self, "_preventIdleSleep");
    v9 = NSRunLoopCommonModes;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    -[CBIdleSleepManager performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", "_allowIdleSleep", 0, v8, v7);

  }
}

- (void)_powerChangedOnService:(unsigned int)a3 messageType:(unsigned int)a4 messageArgument:(void *)a5
{
  uint64_t v8;
  NSObject *v9;
  unint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  _DWORD v21[2];

  v8 = CheckerBoardLogHandleForCategory(4);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v21[0] = 67109120;
    v21[1] = a4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Received power notification %u", (uint8_t *)v21, 8u);
  }

  HIDWORD(v10) = a4;
  LODWORD(v10) = a4 + 536870288;
  switch((v10 >> 4))
  {
    case 0u:
      v11 = CheckerBoardLogHandleForCategory(4);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_9;
      LOWORD(v21[0]) = 0;
      v13 = "[CBIdleSleepManager] Received kIOMessageCanSystemSleep";
      goto LABEL_8;
    case 1u:
      v14 = CheckerBoardLogHandleForCategory(4);
      v12 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21[0]) = 0;
        v13 = "[CBIdleSleepManager] Received kIOMessageSystemWillSleep";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)v21, 2u);
      }
LABEL_9:

      IOAllowPowerChange(self->_rootDomainConnect, (intptr_t)a5);
      return;
    case 2u:
      v15 = CheckerBoardLogHandleForCategory(4);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      LOWORD(v21[0]) = 0;
      v17 = "[CBIdleSleepManager] Received kIOMessageSystemWillNotSleep";
      break;
    case 9u:
      v18 = CheckerBoardLogHandleForCategory(4);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Received kIOMessageSystemHasPoweredOn", (uint8_t *)v21, 2u);
      }

      v16 = objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      -[NSObject postNotificationName:object:userInfo:](v16, "postNotificationName:object:userInfo:", CFSTR("CBDidWakeFromSleepNotification"), 0, 0);
      goto LABEL_18;
    case 0xBu:
      v20 = CheckerBoardLogHandleForCategory(4);
      v16 = objc_claimAutoreleasedReturnValue(v20);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      LOWORD(v21[0]) = 0;
      v17 = "[CBIdleSleepManager] Received kIOMessageSystemWillPowerOn";
      break;
    default:
      return;
  }
  _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)v21, 2u);
LABEL_18:

}

- (void)enableIdleSleep
{
  uint64_t v3;
  NSObject *v4;
  io_registry_entry_t v5;
  io_connect_t v6;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *Current;
  uint64_t v9;
  NSObject *v10;
  CFNumberRef v11;
  IOPMAssertionID AssertionID;
  int valuePtr;
  uint8_t buf[8];
  io_object_t notifier;

  v3 = CheckerBoardLogHandleForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Enabling idle sleep…", buf, 2u);
  }

  notifier = 0;
  *(_QWORD *)buf = 0;
  v5 = IORegistryEntryFromPath(kIOMasterPortDefault, "IOPower:/IOPowerConnection/IOPMrootDomain");
  v6 = IORegisterForSystemPower(self, (IONotificationPortRef *)buf, (IOServiceInterestCallback)sub_100023F88, &notifier);
  self->_rootDomainConnect = v6;
  if (v6)
  {
    RunLoopSource = IONotificationPortGetRunLoopSource(*(IONotificationPortRef *)buf);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
  }
  else
  {
    v9 = CheckerBoardLogHandleForCategory(4);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      sub_10004598C(v10);

  }
  valuePtr = 1;
  v11 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  IORegistryEntrySetCFProperty(v5, CFSTR("System Boot Complete"), kCFBooleanTrue);
  IORegistryEntrySetCFProperty(v5, CFSTR("System Idle Seconds"), v11);
  CFRelease(v11);
  AssertionID = 0;
  IOPMAssertionCreateWithName(CFSTR("EnableIdleSleep"), 0xFFu, CFSTR("com.apple.CheckerBoard.enableidlesleep"), &AssertionID);
  -[CBIdleSleepManager setPreventIdleSleep:forReason:](self, "setPreventIdleSleep:forReason:", 1, 0);
  -[CBIdleSleepManager setFinishedBoot:](self, "setFinishedBoot:", 1);
}

- (void)setPreventIdleSleep:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  NSObject *v14;
  BOOL v15;
  uint64_t v16;
  NSObject *v17;
  _DWORD v18[2];
  __int16 v19;
  id v20;

  v4 = a3;
  v6 = a4;
  v7 = CheckerBoardLogHandleForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v18[0] = 67109378;
    v18[1] = v4;
    v19 = 2112;
    v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Preventing idle sleep (%d) for reason: %@", (uint8_t *)v18, 0x12u);
  }

  -[CBIdleSleepManager finishedBoot](self, "finishedBoot");
  if (v6)
  {
    v9 = (void *)qword_10008BDA0;
    if (v4)
    {
      if (!qword_10008BDA0)
      {
        v10 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 2);
        v11 = (void *)qword_10008BDA0;
        qword_10008BDA0 = (uint64_t)v10;

        v9 = (void *)qword_10008BDA0;
      }
      objc_msgSend(v9, "addObject:", v6);
      goto LABEL_9;
    }
    objc_msgSend((id)qword_10008BDA0, "removeObject:", v6);
LABEL_11:
    v12 = objc_msgSend((id)qword_10008BDA0, "count") != 0;
    goto LABEL_12;
  }
  if (!v4)
    goto LABEL_11;
LABEL_9:
  v12 = 1;
LABEL_12:
  if (v12 && !byte_10008BDA8)
  {
    v13 = CheckerBoardLogHandleForCategory(4);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Taking out kIOPMAssertionTypeNoIdleSleep assertion", (uint8_t *)v18, 2u);
    }

    v15 = IOPMAssertionCreateWithName(CFSTR("NoIdleSleepAssertion"), 0xFFu, CFSTR("com.apple.CheckerBoard.idle"), (IOPMAssertionID *)&dword_10008BD98) == 0;
LABEL_23:
    byte_10008BDA8 = v15;
    goto LABEL_24;
  }
  if (!byte_10008BDA8)
    LOBYTE(v12) = 1;
  if (!v12)
  {
    v16 = CheckerBoardLogHandleForCategory(4);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Releasing kIOPMAssertionTypeNoIdleSleep assertion", (uint8_t *)v18, 2u);
    }

    IOPMAssertionRelease(dword_10008BD98);
    v15 = 0;
    goto LABEL_23;
  }
LABEL_24:

}

- (void)resetIdleTimerAndUndim:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint8_t buf[4];
  double v25;

  v3 = a3;
  v5 = CheckerBoardLogHandleForCategory(4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v25) = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Resetting idle timer and undim %d", buf, 8u);
  }

  if (v3)
    -[CBIdleSleepManager undimDisplay](self, "undimDisplay");
  if (!-[CBIdleSleepManager isDisplayDim](self, "isDisplayDim"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBIdleSleepManager idleTimerDisabledReasons](self, "idleTimerDisabledReasons"));
    if (objc_msgSend(v7, "count"))
      v8 = 1.79769313e308;
    else
      v8 = 30.0;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBIdleSleepManager configurationWithAttentionLostTimeout:](self, "configurationWithAttentionLostTimeout:", v8));
    v10 = CheckerBoardLogHandleForCategory(4);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Setting a new attention awareness configuration with timeout: %f", buf, 0xCu);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBIdleSleepManager attentionAwarenessClient](self, "attentionAwarenessClient"));
    v23 = 0;
    v13 = objc_msgSend(v12, "setConfiguration:shouldReset:error:", v9, 1, &v23);
    v14 = v23;

    if ((v13 & 1) == 0)
    {
      v15 = CheckerBoardLogHandleForCategory(4);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1000459CC((uint64_t)v14, v16, v17, v18, v19, v20, v21, v22);

    }
  }
}

- (void)setIdleTimerDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  id v19;

  v4 = a3;
  v6 = a4;
  v7 = CheckerBoardLogHandleForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 67109120;
    LODWORD(v19) = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Attempting to set idle timer disabled to %d", (uint8_t *)&v18, 8u);
  }

  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBIdleSleepManager idleTimerDisabledReasons](self, "idleTimerDisabledReasons"));
    v10 = objc_msgSend(v9, "containsObject:", v6);

    if (v4)
    {
      if ((v10 & 1) == 0)
      {
        v11 = CheckerBoardLogHandleForCategory(4);
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 138412290;
          v19 = v6;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Adding idle timer disabled reason: %@", (uint8_t *)&v18, 0xCu);
        }

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBIdleSleepManager idleTimerDisabledReasons](self, "idleTimerDisabledReasons"));
        objc_msgSend(v13, "addObject:", v6);
LABEL_16:

        -[CBIdleSleepManager resetIdleTimerAndUndim:](self, "resetIdleTimerAndUndim:", 1);
      }
    }
    else if (v10)
    {
      v16 = CheckerBoardLogHandleForCategory(4);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138412290;
        v19 = v6;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Removing idle timer disabled reason: %@", (uint8_t *)&v18, 0xCu);
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBIdleSleepManager idleTimerDisabledReasons](self, "idleTimerDisabledReasons"));
      objc_msgSend(v13, "removeObject:", v6);
      goto LABEL_16;
    }
  }
  else
  {
    v14 = CheckerBoardLogHandleForCategory(4);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Ignoring request since idle timer disabled reason was not specified…", (uint8_t *)&v18, 2u);
    }

  }
}

- (void)_initTapToWake
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  SBFTapToWakeGestureRecognizer *v11;
  SBFTapToWakeGestureRecognizer *tapToWakeGestureRecognizer;
  SBFTapToWakeGestureRecognizer *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Initializing tap to wake", buf, 2u);
  }

  v7 = MGGetBoolAnswer(CFSTR("yZf3GTRMGTuwSV/lD7Cagw"), v5, v6);
  v8 = 1;
  if (!v7)
    v8 = 2;
  self->_tapToWakeSupported = v8;
  if (v7)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[_UISystemGestureManager sharedInstance](_UISystemGestureManager, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    v11 = (SBFTapToWakeGestureRecognizer *)objc_msgSend(objc_alloc((Class)SBFTapToWakeGestureRecognizer), "initWithTarget:action:", self, "_tapToWake:");
    tapToWakeGestureRecognizer = self->_tapToWakeGestureRecognizer;
    self->_tapToWakeGestureRecognizer = v11;

    -[SBFTapToWakeGestureRecognizer setEnabled:](self->_tapToWakeGestureRecognizer, "setEnabled:", 0);
    v13 = self->_tapToWakeGestureRecognizer;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayIdentity"));
    -[NSObject addGestureRecognizer:toDisplayWithIdentity:](v9, "addGestureRecognizer:toDisplayWithIdentity:", v13, v14);

    v15 = CheckerBoardLogHandleForCategory(4);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Tap to wake is supported and has been set up.", v19, 2u);
    }

  }
  else
  {
    v17 = CheckerBoardLogHandleForCategory(4);
    v9 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Hardware does not support tap to wake.", v18, 2u);
    }
  }

}

- (void)_tapToWake:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  if (objc_msgSend(a3, "state") == (id)3)
  {
    v4 = CheckerBoardLogHandleForCategory(4);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Tap to wake performed!", v6, 2u);
    }

    if (-[CBIdleSleepManager isDisplayDim](self, "isDisplayDim"))
      -[CBIdleSleepManager resetIdleTimerAndUndim:](self, "resetIdleTimerAndUndim:", 1);
  }
}

- (void)_enableTapToWake
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  if ((id)-[CBIdleSleepManager tapToWakeSupported](self, "tapToWakeSupported") == (id)1)
  {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100075E88);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBIdleSleepManager tapToWakeGestureRecognizer](self, "tapToWakeGestureRecognizer"));
    objc_msgSend(v3, "setEnabled:", 1);

    v4 = CheckerBoardLogHandleForCategory(4);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Tap to Wake enabled", v6, 2u);
    }

  }
}

- (void)_disableTapToWake
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  if ((id)-[CBIdleSleepManager tapToWakeSupported](self, "tapToWakeSupported") == (id)1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBIdleSleepManager tapToWakeGestureRecognizer](self, "tapToWakeGestureRecognizer"));
    objc_msgSend(v3, "setEnabled:", 0);

    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100075EA8);
    v4 = CheckerBoardLogHandleForCategory(4);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Tap to Wake disabled", v6, 2u);
    }

  }
}

- (BOOL)isDisplayDim
{
  return self->_displayDim;
}

- (void)setDisplayDim:(BOOL)a3
{
  self->_displayDim = a3;
}

- (unsigned)rootDomainConnect
{
  return self->_rootDomainConnect;
}

- (void)setRootDomainConnect:(unsigned int)a3
{
  self->_rootDomainConnect = a3;
}

- (BOOL)finishedBoot
{
  return self->_finishedBoot;
}

- (void)setFinishedBoot:(BOOL)a3
{
  self->_finishedBoot = a3;
}

- (NSMutableSet)idleTimerDisabledReasons
{
  return self->_idleTimerDisabledReasons;
}

- (void)setIdleTimerDisabledReasons:(id)a3
{
  objc_storeStrong((id *)&self->_idleTimerDisabledReasons, a3);
}

- (unint64_t)tapToWakeSupported
{
  return self->_tapToWakeSupported;
}

- (void)setTapToWakeSupported:(unint64_t)a3
{
  self->_tapToWakeSupported = a3;
}

- (SBFTapToWakeGestureRecognizer)tapToWakeGestureRecognizer
{
  return self->_tapToWakeGestureRecognizer;
}

- (void)setTapToWakeGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapToWakeGestureRecognizer, a3);
}

- (AWAttentionAwarenessClient)attentionAwarenessClient
{
  return self->_attentionAwarenessClient;
}

- (void)setAttentionAwarenessClient:(id)a3
{
  objc_storeStrong((id *)&self->_attentionAwarenessClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attentionAwarenessClient, 0);
  objc_storeStrong((id *)&self->_tapToWakeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_idleTimerDisabledReasons, 0);
}

@end

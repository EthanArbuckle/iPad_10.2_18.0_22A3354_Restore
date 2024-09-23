@implementation PHInCallOrientationMonitor

+ (id)sharedInstance
{
  if (qword_1002DCC00 != -1)
    dispatch_once(&qword_1002DCC00, &stru_100287880);
  return (id)qword_1002DCBF8;
}

- (PHInCallOrientationMonitor)init
{
  PHInCallOrientationMonitor *v2;
  BKSAccelerometer *v3;
  BKSAccelerometer *accelerometer;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHInCallOrientationMonitor;
  v2 = -[PHInCallOrientationMonitor init](&v7, "init");
  if (v2)
  {
    v3 = (BKSAccelerometer *)objc_alloc_init((Class)BKSAccelerometer);
    accelerometer = v2->_accelerometer;
    v2->_accelerometer = v3;

    -[BKSAccelerometer setDelegate:](v2->_accelerometer, "setDelegate:", v2);
    -[PHInCallOrientationMonitor _updateCachedOrientationValues](v2, "_updateCachedOrientationValues");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1000C7268, CFSTR("com.apple.backboardd.orientationlock"), 0, CFNotificationSuspensionBehaviorDrop);
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  -[BKSAccelerometer setOrientationEventsEnabled:](self->_accelerometer, "setOrientationEventsEnabled:", 0);
  -[BKSAccelerometer setPassiveOrientationEvents:](self->_accelerometer, "setPassiveOrientationEvents:", 1);
  -[BKSAccelerometer setDelegate:](self->_accelerometer, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)PHInCallOrientationMonitor;
  -[PHInCallOrientationMonitor dealloc](&v4, "dealloc");
}

- (void)_updateCachedOrientationValues
{
  -[PHInCallOrientationMonitor setCurrentOrientation:](self, "setCurrentOrientation:", -[BKSAccelerometer currentDeviceOrientation](self->_accelerometer, "currentDeviceOrientation"));
  if (-[PHInCallOrientationMonitor isSpringBoardInterfaceOrientationLocked](self, "isSpringBoardInterfaceOrientationLocked"))
  {
    self->_lockedOrientation = -[PHInCallOrientationMonitor springBoardLockedInterfaceOrientation](self, "springBoardLockedInterfaceOrientation");
    self->_isOrientationLocked = 1;
  }
}

- (void)setOrientationEventsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  uint64_t v7;
  _DWORD v8[2];

  v3 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "setOrientationEventsEnabled: %d", (uint8_t *)v8, 8u);
  }

  -[BKSAccelerometer setOrientationEventsEnabled:](self->_accelerometer, "setOrientationEventsEnabled:", v3);
  v7 = v3 ^ 1;
  -[BKSAccelerometer setPassiveOrientationEvents:](self->_accelerometer, "setPassiveOrientationEvents:", v7);
  if ((v7 & 1) == 0)
    -[PHInCallOrientationMonitor _updateCachedOrientationValues](self, "_updateCachedOrientationValues");
}

- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[2];
  uint8_t buf[4];
  const __CFString *v19;
  __int16 v20;
  int64_t v21;

  v6 = sub_1000C5588();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v19 = -[PHInCallOrientationMonitor currentOrientation](self, "currentOrientation");
    v20 = 2048;
    v21 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "accelerometer orientation change from %ld to %ld", buf, 0x16u);
  }

  -[PHInCallOrientationMonitor setCurrentOrientation:](self, "setCurrentOrientation:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
  v9 = objc_msgSend(v8, "isPipped");

  if (!-[PHInCallOrientationMonitor isOrientationLocked](self, "isOrientationLocked") || v9)
  {
    v10 = sub_1000C5588();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v19 = CFSTR("PHInCallOrientationEventNotification");
      v20 = 2048;
      v21 = a4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "posting %@ for orientation: %ld", buf, 0x16u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4, CFSTR("kPHInCallOrientationType")));
    v16[1] = CFSTR("kPHLastValidInCallOrientationType");
    v17[0] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[PHInCallOrientationMonitor lastValidOrientation](self, "lastValidOrientation")));
    v17[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 2));
    objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("PHInCallOrientationEventNotification"), 0, v15);

  }
}

- (int64_t)currentOrientation
{
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  int64_t v7;

  if (!-[PHInCallOrientationMonitor isOrientationLocked](self, "isOrientationLocked"))
    return self->_currentOrientation;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = objc_msgSend(v4, "isPresentingAmbient");
  v6 = 40;
  if (v5)
    v6 = 16;
  v7 = *(int64_t *)((char *)&self->super.isa + v6);

  return v7;
}

- (void)setCurrentOrientation:(int64_t)a3
{
  self->_currentOrientation = a3;
  if ((unint64_t)(a3 - 1) <= 3)
    -[PHInCallOrientationMonitor setLastValidOrientation:](self, "setLastValidOrientation:");
}

- (int64_t)lastValidOrientation
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  int64_t result;

  if (-[PHInCallOrientationMonitor isOrientationLocked](self, "isOrientationLocked"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
    v5 = objc_msgSend(v4, "isPresentingAmbient");

    if ((v5 & 1) == 0)
      self->_lastValidOrientation = -[PHInCallOrientationMonitor lockedOrientation](self, "lockedOrientation");
  }
  result = self->_lastValidOrientation;
  if (!result)
  {
    result = -[PHInCallOrientationMonitor deviceOrientation](self, "deviceOrientation");
    self->_lastValidOrientation = result;
  }
  if ((unint64_t)(result - 1) >= 4)
    return (int64_t)_objc_msgSend(UIApp, "statusBarOrientation");
  return result;
}

- (int64_t)deviceOrientation
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentInCallScene"));
  v5 = objc_msgSend(v4, "interfaceOrientation");

  return (int64_t)v5;
}

- (int64_t)activeInterfaceOrientation
{
  uint64_t lockedOrientation;
  id v4;
  NSObject *v5;
  const char *v6;
  id v7;
  id v8;
  int v10;
  int v11;

  if (+[PHUIConfiguration canAutoRotateInCallUIForFaceTime](PHUIConfiguration, "canAutoRotateInCallUIForFaceTime"))
  {
    if (-[PHInCallOrientationMonitor isOrientationLocked](self, "isOrientationLocked"))
    {
      lockedOrientation = self->_lockedOrientation;
      v4 = sub_1000C5588();
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 67109120;
        v11 = lockedOrientation;
        v6 = "activeInterfaceOrientation: device allows UI rotation and is orientation locked to %d";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, 8u);
      }
    }
    else
    {
      lockedOrientation = BKHIDServicesGetNonFlatDeviceOrientation();
      v8 = sub_1000C5588();
      v5 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 67109120;
        v11 = lockedOrientation;
        v6 = "activeInterfaceOrientation: device allows UI rotation and the last flat orientation was %d";
        goto LABEL_10;
      }
    }
  }
  else
  {
    v7 = sub_1000C5588();
    v5 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "activeInterfaceOrientation: we'll default to UIInterfaceOrientationPortrait", (uint8_t *)&v10, 2u);
    }
    lockedOrientation = 1;
  }

  return lockedOrientation;
}

- (BOOL)isSpringBoardInterfaceOrientationLocked
{
  uint64_t state64;

  if (byte_1002DCC0C)
    goto LABEL_2;
  if (!notify_register_check("com.apple.backboardd.orientationlock", &dword_1002DCC08))
  {
    byte_1002DCC0C = 1;
LABEL_2:
    state64 = 0;
    goto LABEL_3;
  }
  state64 = 0;
  if (!byte_1002DCC0C)
    return 0;
LABEL_3:
  notify_get_state(dword_1002DCC08, &state64);
  return state64 != 0;
}

- (int64_t)springBoardLockedInterfaceOrientation
{
  int64_t result;
  uint64_t state64;

  if (byte_1002DCC14)
    goto LABEL_2;
  if (!notify_register_check("com.apple.backboardd.orientation", &dword_1002DCC10))
  {
    byte_1002DCC14 = 1;
LABEL_2:
    state64 = 1;
LABEL_3:
    notify_get_state(dword_1002DCC10, &state64);
    return state64;
  }
  result = 1;
  state64 = 1;
  if (byte_1002DCC14)
    goto LABEL_3;
  return result;
}

- (void)setIsOrientationLocked:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[2];
  uint8_t buf[4];
  _BOOL4 v16;
  __int16 v17;
  int64_t v18;

  if (self->_isOrientationLocked != a3)
  {
    v3 = a3;
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v16 = v3;
      v17 = 2048;
      v18 = -[PHInCallOrientationMonitor lockedOrientation](self, "lockedOrientation");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "set orientation locked: %d to orientation: %ld", buf, 0x12u);
    }

    self->_isOrientationLocked = v3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    if (v3)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[PHInCallOrientationMonitor lockedOrientation](self, "lockedOrientation", CFSTR("kPHInCallOrientationType"))));
      v12 = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
      objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("PHInCallOrientationEventNotification"), 0, v9);
    }
    else
    {
      v13[0] = CFSTR("kPHInCallOrientationType");
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[PHInCallOrientationMonitor currentOrientation](self, "currentOrientation")));
      v13[1] = CFSTR("kPHLastValidInCallOrientationType");
      v14[0] = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[PHInCallOrientationMonitor lastValidOrientation](self, "lastValidOrientation")));
      v14[1] = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));
      objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("PHInCallOrientationEventNotification"), 0, v10);

    }
  }
}

- (void)setLastValidOrientation:(int64_t)a3
{
  self->_lastValidOrientation = a3;
}

- (BKSAccelerometer)accelerometer
{
  return self->_accelerometer;
}

- (int64_t)lockedOrientation
{
  return self->_lockedOrientation;
}

- (void)setLockedOrientation:(int64_t)a3
{
  self->_lockedOrientation = a3;
}

- (BOOL)isOrientationLocked
{
  return self->_isOrientationLocked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accelerometer, 0);
}

@end

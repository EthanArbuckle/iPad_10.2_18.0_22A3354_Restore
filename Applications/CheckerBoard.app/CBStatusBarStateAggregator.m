@implementation CBStatusBarStateAggregator

+ (id)sharedInstance
{
  if (qword_10008BCC8 != -1)
    dispatch_once(&qword_10008BCC8, &stru_100075648);
  return (id)qword_10008BCC0;
}

- (CBStatusBarStateAggregator)init
{
  CBStatusBarStateAggregator *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  CBWiFiManager *wifiManager;
  __int16 v8[8];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CBStatusBarStateAggregator;
  v2 = -[CBStatusBarStateAggregator init](&v9, "init");
  if (v2)
  {
    v3 = CheckerBoardLogHandleForCategory(6);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting up status bar aggregator…", (uint8_t *)v8, 2u);
    }

    v5 = objc_claimAutoreleasedReturnValue(+[CBWiFiManager sharedInstance](CBWiFiManager, "sharedInstance"));
    wifiManager = v2->_wifiManager;
    v2->_wifiManager = (CBWiFiManager *)v5;

    *(_WORD *)&v2->_lastLockState = 0;
    -[CBStatusBarStateAggregator _initialStatusBarSetup](v2, "_initialStatusBarSetup");
    -[CBStatusBarStateAggregator _registerForNotifications](v2, "_registerForNotifications");
  }
  return v2;
}

- (void)_initialStatusBarSetup
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CheckerBoardLogHandleForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Initializing status bar data…", v5, 2u);
  }

  bzero(&self->_data, 0xF28uLL);
  *((_BYTE *)&self->_data + 2536) = *((_BYTE *)&self->_data + 2536) & 0xFD | (2
                                                                            * (objc_msgSend(UIApp, "userInterfaceLayoutDirection") == (id)1));
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dealloc was called", buf, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:", self);

  -[CBStatusBarStateAggregator _stopTimeItemTimer](self, "_stopTimeItemTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBStatusBarStateAggregator device](self, "device"));
  objc_msgSend(v7, "setBatteryMonitoringEnabled:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBStatusBarStateAggregator batteryDeviceController](self, "batteryDeviceController"));
  objc_msgSend(v8, "removeBatteryDeviceObserver:", self);

  v9.receiver = self;
  v9.super_class = (Class)CBStatusBarStateAggregator;
  -[CBStatusBarStateAggregator dealloc](&v9, "dealloc");
}

- (void)_registerForNotifications
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CheckerBoardLogHandleForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Registering for notifications…", v5, 2u);
  }

  -[CBStatusBarStateAggregator _setupLock](self, "_setupLock");
  -[CBStatusBarStateAggregator _setupTime](self, "_setupTime");
  -[CBStatusBarStateAggregator _setupBattery](self, "_setupBattery");
  -[CBStatusBarStateAggregator _setupWiFi](self, "_setupWiFi");
}

- (void)updateStatusBarItem:(int)a3
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  int v10;

  v5 = CheckerBoardLogHandleForCategory(6);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 67109120;
    v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updating status bar item (%d)…", (uint8_t *)&v9, 8u);
  }

  if (a3 <= 11)
  {
    if (!a3)
    {
      -[CBStatusBarStateAggregator _updateTimeItems](self, "_updateTimeItems");
      return;
    }
    if (a3 == 9)
    {
      -[CBStatusBarStateAggregator _updateDataNetworkItem](self, "_updateDataNetworkItem");
      return;
    }
  }
  else
  {
    if ((a3 - 12) < 3)
    {
      -[CBStatusBarStateAggregator _updateBatteryItems](self, "_updateBatteryItems");
      return;
    }
    if (a3 == 28)
    {
      -[CBStatusBarStateAggregator _updateSensorActivityItem](self, "_updateSensorActivityItem");
      return;
    }
    if (a3 == 39)
    {
      -[CBStatusBarStateAggregator _updateLockItem](self, "_updateLockItem");
      return;
    }
  }
  v7 = CheckerBoardLogHandleForCategory(6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 67109120;
    v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[CBStatusBarStateAggregator] cannot update unknown status bar item (%i)", (uint8_t *)&v9, 8u);
  }

}

- (void)forceUpdateStatusBarData
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CheckerBoardLogHandleForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Forcing status bar data update", v5, 2u);
  }

  -[CBStatusBarStateAggregator _postStatusBarUpdates](self, "_postStatusBarUpdates");
}

- (BOOL)_setItem:(int)a3 enabled:(BOOL)a4
{
  int v4;
  uint64_t v7;
  NSObject *v8;
  char *v9;
  int v10;
  uint64_t v12;
  NSObject *v13;
  const __CFString *v14;
  int v15;
  const __CFString *v16;
  __int16 v17;
  int v18;

  v4 = a4;
  v7 = CheckerBoardLogHandleForCategory(6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 67109120;
    LODWORD(v16) = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setting status bar item (%d)…", (uint8_t *)&v15, 8u);
  }

  if (a3 > 0x2D)
    return 0;
  v9 = (char *)self + a3;
  v10 = v9[8];
  v9[8] = v4;
  -[CBStatusBarStateAggregator _postStatusBarUpdates](self, "_postStatusBarUpdates");
  if (v10 == v4)
    return 0;
  v12 = CheckerBoardLogHandleForCategory(6);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR("dis");
    if (v4)
      v14 = CFSTR("en");
    v15 = 138412546;
    v16 = v14;
    v17 = 1024;
    v18 = a3;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@abling %d", (uint8_t *)&v15, 0x12u);
  }

  return 1;
}

- (void)_postStatusBarUpdates
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CheckerBoardLogHandleForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Posting status bar updates…", v5, 2u);
  }

  +[UIStatusBarServer postStatusBarData:withActions:](UIStatusBarServer, "postStatusBarData:withActions:", &self->_data, 0);
}

- (void)_setupLock
{
  uint64_t v3;
  NSObject *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v6[16];

  v3 = CheckerBoardLogHandleForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting up lock notifications…", v6, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_10000DCC4, CFSTR("com.apple.mobile.keybagd.lock_status"), 0, CFNotificationSuspensionBehaviorDrop);
  -[CBStatusBarStateAggregator updateStatusBarItem:](self, "updateStatusBarItem:", 39);
}

- (void)_updateLockItem
{
  unsigned int v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  _DWORD v8[2];

  v3 = MKBGetDeviceLockState(0, a2) - 1;
  v4 = CheckerBoardLogHandleForCategory(6);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3 < 2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating lock item state %d", (uint8_t *)v8, 8u);
  }

  -[CBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 39, v3 < 2);
  if (-[CBStatusBarStateAggregator lastLockStateSet](self, "lastLockStateSet"))
  {
    if (v3 < 2 != -[CBStatusBarStateAggregator lastLockState](self, "lastLockState"))
    {
      v6 = CheckerBoardLogHandleForCategory(6);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "But I keep checking…", (uint8_t *)v8, 2u);
      }

      +[CBSystem checkoutAndReboot:userInitiated:](CBSystem, "checkoutAndReboot:userInitiated:", 1, 0);
    }
  }
  else
  {
    -[CBStatusBarStateAggregator setLastLockState:](self, "setLastLockState:", v3 < 2);
    -[CBStatusBarStateAggregator setLastLockStateSet:](self, "setLastLockStateSet:", 1);
  }
}

- (id)_timeItemDateFormatter
{
  if (qword_10008BCD8 != -1)
    dispatch_once(&qword_10008BCD8, &stru_100075668);
  return (id)qword_10008BCD0;
}

- (id)_timeItemShortDateFormatter
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DF70;
  block[3] = &unk_1000753E8;
  block[4] = self;
  if (qword_10008BCE8 != -1)
    dispatch_once(&qword_10008BCE8, block);
  return (id)qword_10008BCE0;
}

- (void)_setupTime
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = CheckerBoardLogHandleForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting up time notifications…", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_restartTimeItemTimer", CFSTR("CBDidWakeFromSleepNotification"), 0);

  -[CBStatusBarStateAggregator _restartTimeItemTimer](self, "_restartTimeItemTimer");
}

- (void)_stopTimeItemTimer
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = CheckerBoardLogHandleForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating time item timer…", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBStatusBarStateAggregator timeItemTimer](self, "timeItemTimer"));
  objc_msgSend(v5, "invalidate");

  -[CBStatusBarStateAggregator setTimeItemTimer:](self, "setTimeItemTimer:", 0);
}

- (void)_restartTimeItemTimer
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  -[CBStatusBarStateAggregator _updateTimeItems](self, "_updateTimeItems");
  -[CBStatusBarStateAggregator _stopTimeItemTimer](self, "_stopTimeItemTimer");
  v4 = CheckerBoardLogHandleForCategory(6);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Restarting time item timer…", v9, 2u);
  }

  BSTimeUntilNextClockMinute();
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "timerWithTimeInterval:target:selector:userInfo:repeats:", self, a2, 0, 0));
  -[CBStatusBarStateAggregator setTimeItemTimer:](self, "setTimeItemTimer:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBStatusBarStateAggregator timeItemTimer](self, "timeItemTimer"));
  objc_msgSend(v7, "addTimer:forMode:", v8, NSRunLoopCommonModes);

}

- (void)_updateTimeItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  unsigned int v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBStatusBarStateAggregator _timeItemDateFormatter](self, "_timeItemDateFormatter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringFromDate:", v3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBStatusBarStateAggregator _timeItemShortDateFormatter](self, "_timeItemShortDateFormatter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringFromDate:", v3));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBStatusBarStateAggregator timeItemTimeString](self, "timeItemTimeString"));
  v9 = objc_msgSend(v5, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
  {
    v10 = CheckerBoardLogHandleForCategory(6);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBStatusBarStateAggregator timeItemTimeString](self, "timeItemTimeString"));
      v22 = 138412546;
      v23 = v12;
      v24 = 2112;
      v25 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updating the standard time string from %@ to %@", (uint8_t *)&v22, 0x16u);

    }
    v13 = CheckerBoardLogHandleForCategory(6);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBStatusBarStateAggregator timeItemShortTimeString](self, "timeItemShortTimeString"));
      v22 = 138412546;
      v23 = v15;
      v24 = 2112;
      v25 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Updating the short time string from %@ to %@", (uint8_t *)&v22, 0x16u);

    }
    -[CBStatusBarStateAggregator setTimeItemTimeString:](self, "setTimeItemTimeString:", v5);
    -[CBStatusBarStateAggregator setTimeItemShortTimeString:](self, "setTimeItemShortTimeString:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBStatusBarStateAggregator timeItemTimeString](self, "timeItemTimeString"));
    v17 = objc_msgSend(v16, "getCString:maxLength:encoding:", self->_data.timeString, 64, 4);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBStatusBarStateAggregator timeItemShortTimeString](self, "timeItemShortTimeString"));
    v19 = objc_msgSend(v18, "getCString:maxLength:encoding:", self->_data.shortTimeString, 64, 4);

    if ((v17 & 1) != 0 || v19)
    {
      v20 = CheckerBoardLogHandleForCategory(6);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Updating the time…", (uint8_t *)&v22, 2u);
      }

      -[CBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 0, 1);
    }
    else
    {
      *(_OWORD *)&self->_data.timeString[32] = 0u;
      *(_OWORD *)&self->_data.timeString[48] = 0u;
      *(_OWORD *)self->_data.timeString = 0u;
      *(_OWORD *)&self->_data.timeString[16] = 0u;
    }
  }

}

- (id)_batteryItemPercentFormatter
{
  if (qword_10008BCF8 != -1)
    dispatch_once(&qword_10008BCF8, &stru_100075688);
  return (id)qword_10008BCF0;
}

- (void)_setupBattery
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint8_t v10[16];

  v3 = CheckerBoardLogHandleForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting up battery notifications…", v10, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  -[CBStatusBarStateAggregator setDevice:](self, "setDevice:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBStatusBarStateAggregator device](self, "device"));
  objc_msgSend(v6, "setBatteryMonitoringEnabled:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "_updateBatteryItems", UIDeviceBatteryLevelDidChangeNotification, 0);

  v8 = objc_alloc_init((Class)BCBatteryDeviceController);
  -[CBStatusBarStateAggregator setBatteryDeviceController:](self, "setBatteryDeviceController:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBStatusBarStateAggregator batteryDeviceController](self, "batteryDeviceController"));
  objc_msgSend(v9, "addBatteryDeviceObserver:queue:", self, &_dispatch_main_q);

  -[CBStatusBarStateAggregator updateStatusBarItem:](self, "updateStatusBarItem:", 12);
}

- (BOOL)_isLowPowerModeActive
{
  uint32_t v2;
  int v3;
  BOOL v5;
  BOOL v6;
  uint64_t v8;
  int out_token;

  out_token = -1;
  v2 = notify_register_dispatch("com.apple.system.lowpowermode", &out_token, (dispatch_queue_t)&_dispatch_main_q, &stru_1000756C8);
  v8 = 0;
  v3 = out_token;
  if (out_token != -1 && v2 == 0)
  {
    if (notify_get_state(out_token, &v8))
      v6 = 1;
    else
      v6 = v8 == 0;
    v5 = !v6;
    v3 = out_token;
  }
  else
  {
    v5 = 0;
  }
  notify_cancel(v3);
  return v5;
}

- (void)_updateBatteryItems
{
  uint64_t v3;
  NSObject *v4;
  unsigned int batteryState;
  void *v6;
  float v7;
  float v8;
  unsigned int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  unsigned int v23;
  uint64_t v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint8_t v42[16];

  v3 = CheckerBoardLogHandleForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v42 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Updating battery items…", v42, 2u);
  }

  batteryState = self->_data.batteryState;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBStatusBarStateAggregator device](self, "device"));
  objc_msgSend(v6, "batteryLevel");
  v8 = v7;

  v9 = -[CBStatusBarStateAggregator _isLowPowerModeActive](self, "_isLowPowerModeActive");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBStatusBarStateAggregator currentBatteryDevice](self, "currentBatteryDevice"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBStatusBarStateAggregator currentBatteryDevice](self, "currentBatteryDevice"));
    v12 = objc_msgSend(v11, "percentCharge");

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBStatusBarStateAggregator currentBatteryDevice](self, "currentBatteryDevice"));
    if (objc_msgSend(v13, "powerSourceState") == (id)2)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBStatusBarStateAggregator currentBatteryDevice](self, "currentBatteryDevice"));
      v15 = objc_msgSend(v14, "percentCharge");

      if (v15 == (id)100)
      {
        v16 = CheckerBoardLogHandleForCategory(6);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v42 = 0;
          v18 = "Device is plugged into power and the battery is fully charged";
LABEL_25:
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, v42, 2u);
          goto LABEL_26;
        }
        goto LABEL_26;
      }
    }
    else
    {

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CBStatusBarStateAggregator currentBatteryDevice](self, "currentBatteryDevice"));
    v23 = objc_msgSend(v22, "isCharging");

    v24 = CheckerBoardLogHandleForCategory(6);
    v17 = objc_claimAutoreleasedReturnValue(v24);
    v25 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v25)
      {
        *(_WORD *)v42 = 0;
        v18 = "Device is plugged into power and the battery is charging";
        goto LABEL_25;
      }
      goto LABEL_26;
    }
    if (v25)
    {
      *(_WORD *)v42 = 0;
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Device is not plugged into power; the battery is discharging",
        v42,
        2u);
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  v12 = (int)(v8 * 100.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CBStatusBarStateAggregator device](self, "device"));
  v20 = objc_msgSend(v19, "batteryState");

  if (v20 == (id)1)
  {
    v26 = CheckerBoardLogHandleForCategory(6);
    v17 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v42 = 0;
      goto LABEL_21;
    }
LABEL_22:
    batteryState = 0;
    goto LABEL_27;
  }
  if (v20 == (id)2)
  {
    v27 = CheckerBoardLogHandleForCategory(6);
    v17 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v42 = 0;
      v18 = "Device is plugged into power and the battery is charging";
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  if (v20 == (id)3)
  {
    v21 = CheckerBoardLogHandleForCategory(6);
    v17 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v42 = 0;
      v18 = "Device is plugged into power and the battery is fully charged";
      goto LABEL_25;
    }
LABEL_26:
    batteryState = 1;
    goto LABEL_27;
  }
  v41 = CheckerBoardLogHandleForCategory(6);
  v17 = objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v42 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Device is not connected to power", v42, 2u);
  }
LABEL_27:

  if (v12 <= 0)
  {
    v28 = CheckerBoardLogHandleForCategory(6);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v42 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Battery percentage is less than 0", v42, 2u);
    }

    v12 = 1;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CBStatusBarStateAggregator _batteryItemPercentFormatter](self, "_batteryItemPercentFormatter", *(_QWORD *)v42));
  v31 = (double)v12 / 100.0;
  *(float *)&v31 = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v31));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "stringFromNumber:", v32));

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CBStatusBarStateAggregator batteryDetailString](self, "batteryDetailString"));
  v35 = objc_msgSend(v33, "isEqualToString:", v34);

  if ((v35 & 1) == 0)
  {
    v36 = CheckerBoardLogHandleForCategory(6);
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v42 = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Updating battery detail string…", v42, 2u);
    }

    -[CBStatusBarStateAggregator setBatteryDetailString:](self, "setBatteryDetailString:", v33);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CBStatusBarStateAggregator batteryDetailString](self, "batteryDetailString"));
    objc_msgSend(v38, "getCString:maxLength:encoding:", self->_data.batteryDetailString, 150, 4);

  }
  if (v12 == self->_data.batteryCapacity
    && batteryState == self->_data.batteryState
    && ((v9 ^ ((*((_BYTE *)&self->_data + 2536) & 1) == 0)) & 1) != 0)
  {
    if ((v35 & 1) != 0)
      goto LABEL_44;
  }
  else
  {
    v39 = CheckerBoardLogHandleForCategory(6);
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v42 = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Updating battery info…", v42, 2u);
    }

    self->_data.batteryCapacity = v12;
    self->_data.batteryState = batteryState;
    *((_BYTE *)&self->_data + 2536) = *((_BYTE *)&self->_data + 2536) & 0xFE | v9;
  }
  -[CBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 12, 1);
  -[CBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 13, 1);
LABEL_44:

}

- (void)_setupWiFi
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = CheckerBoardLogHandleForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting up Wi-Fi notifications…", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_updateDataNetworkItem", CFSTR("CBWiFiSignalStrengthChangedNotification"), 0);

  -[CBStatusBarStateAggregator updateStatusBarItem:](self, "updateStatusBarItem:", 9);
}

- (void)_updateDataNetworkItem
{
  uint64_t v3;
  NSObject *v4;
  unsigned int dataNetworkType;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Updating data network item…", buf, 2u);
  }

  dataNetworkType = self->_data.dataNetworkType;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBStatusBarStateAggregator wifiManager](self, "wifiManager"));
  v7 = objc_msgSend(v6, "isAssociatedToNetwork");

  if ((_DWORD)v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBStatusBarStateAggregator wifiManager](self, "wifiManager"));
    v9 = objc_msgSend(v8, "signalStrengthBars");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBStatusBarStateAggregator wifiManager](self, "wifiManager"));
    v11 = objc_msgSend(v10, "signalStrengthRSSI");

    dataNetworkType = 5;
  }
  else
  {
    v9 = 0;
    v11 = 0;
  }
  v12 = self->_data.dataNetworkType;
  if (dataNetworkType != v12)
    self->_data.dataNetworkType = dataNetworkType;
  if (v9 == self->_data.wifiSignalStrengthBars)
  {
    if (v11 == self->_data.wifiSignalStrengthRaw)
    {
      if (dataNetworkType == v12)
        return;
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  self->_data.wifiSignalStrengthBars = v9;
  if (v11 != self->_data.wifiSignalStrengthRaw)
LABEL_13:
    self->_data.wifiSignalStrengthRaw = v11;
LABEL_14:
  v13 = CheckerBoardLogHandleForCategory(6);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Updating data network info…", v15, 2u);
  }

  -[CBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 9, v7);
}

- (void)_updateSensorActivityItem
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  int v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];

  v2 = CheckerBoardLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updating status bar sensor activity item", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CBSceneManager sharedInstance](CBSceneManager, "sharedInstance"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowDict"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v13 = CheckerBoardLogHandleForCategory(6);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v12;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Status bar is checking recording indicator for window %@", buf, 0xCu);
        }

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "recordingIndicatorManager"));
        v16 = v15;
        if (v15)
        {
          objc_msgSend(v15, "updateRecordingIndicatorForStatusBarChanges");
          v9 |= objc_msgSend(v16, "isIndicatorVisibleAtStatusBarLocation");
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v8);
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[CBWindowManager sharedInstance](CBWindowManager, "sharedInstance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "rootWindowRecordingIndicatorManager"));
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "updateRecordingIndicatorForStatusBarChanges");
    LOBYTE(v9) = v9 | objc_msgSend(v19, "isIndicatorVisibleAtStatusBarLocation");
  }
  v20 = CheckerBoardLogHandleForCategory(6);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v28) = v9 & 1;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Updating status bar sensor activity item to enabled: %d", buf, 8u);
  }

  -[CBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 28, v9 & 1);
}

- (void)connectedDevicesDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  -[CBStatusBarStateAggregator setCurrentBatteryDevice:](self, "setCurrentBatteryDevice:", 0);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "isInternal", (_QWORD)v14))
        {
          -[CBStatusBarStateAggregator setCurrentBatteryDevice:](self, "setCurrentBatteryDevice:", v10);
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBStatusBarStateAggregator currentBatteryDevice](self, "currentBatteryDevice"));
  if (!v11)
  {
    v12 = CheckerBoardLogHandleForCategory(6);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100045214(v13);

  }
  -[CBStatusBarStateAggregator _updateBatteryItems](self, "_updateBatteryItems", (_QWORD)v14);

}

- (NSTimer)timeItemTimer
{
  return self->_timeItemTimer;
}

- (void)setTimeItemTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeItemTimer, a3);
}

- (NSString)timeItemTimeString
{
  return self->_timeItemTimeString;
}

- (void)setTimeItemTimeString:(id)a3
{
  objc_storeStrong((id *)&self->_timeItemTimeString, a3);
}

- (NSString)timeItemShortTimeString
{
  return self->_timeItemShortTimeString;
}

- (void)setTimeItemShortTimeString:(id)a3
{
  objc_storeStrong((id *)&self->_timeItemShortTimeString, a3);
}

- (UIDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (BCBatteryDeviceController)batteryDeviceController
{
  return self->_batteryDeviceController;
}

- (void)setBatteryDeviceController:(id)a3
{
  objc_storeStrong((id *)&self->_batteryDeviceController, a3);
}

- (BCBatteryDevice)currentBatteryDevice
{
  return self->_currentBatteryDevice;
}

- (void)setCurrentBatteryDevice:(id)a3
{
  objc_storeStrong((id *)&self->_currentBatteryDevice, a3);
}

- (NSString)batteryDetailString
{
  return self->_batteryDetailString;
}

- (void)setBatteryDetailString:(id)a3
{
  objc_storeStrong((id *)&self->_batteryDetailString, a3);
}

- (CBWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(id)a3
{
  objc_storeStrong((id *)&self->_wifiManager, a3);
}

- (BOOL)lastLockState
{
  return self->_lastLockState;
}

- (void)setLastLockState:(BOOL)a3
{
  self->_lastLockState = a3;
}

- (BOOL)lastLockStateSet
{
  return self->_lastLockStateSet;
}

- (void)setLastLockStateSet:(BOOL)a3
{
  self->_lastLockStateSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_batteryDetailString, 0);
  objc_storeStrong((id *)&self->_currentBatteryDevice, 0);
  objc_storeStrong((id *)&self->_batteryDeviceController, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_timeItemShortTimeString, 0);
  objc_storeStrong((id *)&self->_timeItemTimeString, 0);
  objc_storeStrong((id *)&self->_timeItemTimer, 0);
}

@end

@implementation CBThermalManager

+ (id)sharedInstance
{
  if (qword_10008BCB8 != -1)
    dispatch_once(&qword_10008BCB8, &stru_100075538);
  return (id)qword_10008BCB0;
}

- (CBThermalManager)init
{
  char *v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CBThermalManager;
  v2 = -[CBThermalManager init](&v7, "init");
  if (v2)
  {
    v3 = CheckerBoardLogHandleForCategory(10);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting up thermal manager…", v6, 2u);
    }

    *(_QWORD *)(v2 + 12) = -1;
    *((_QWORD *)v2 + 3) = 0;
    v2[8] = 0;
  }
  return (CBThermalManager *)v2;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v6;
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(10);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dealloc was called", buf, 2u);
  }

  notify_cancel(-[CBThermalManager coldTempToken](self, "coldTempToken"));
  notify_cancel(-[CBThermalManager sunlightStateToken](self, "sunlightStateToken"));
  +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v6.receiver = self;
  v6.super_class = (Class)CBThermalManager;
  -[CBThermalManager dealloc](&v6, "dealloc");
}

- (BOOL)isThermalBlocked
{
  _BOOL4 v2;
  uint64_t v3;
  NSObject *v4;
  _DWORD v6[2];

  v2 = -[CBThermalManager _isLevelBlocked:](self, "_isLevelBlocked:", -[CBThermalManager level](self, "level"));
  v3 = CheckerBoardLogHandleForCategory(10);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Thermal blocked %d", (uint8_t *)v6, 8u);
  }

  return v2;
}

- (BOOL)_isLevelBlocked:(int64_t)a3
{
  unint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _DWORD v7[2];

  v3 = a3 - 3;
  v4 = CheckerBoardLogHandleForCategory(10);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3 < 2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Level blocked %d", (uint8_t *)v7, 8u);
  }

  return v3 < 2;
}

- (void)startListeningForThermalEvents
{
  uint64_t v3;
  NSObject *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD handler[5];
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(10);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Registering thermal notifications…", buf, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", kOSThermalNotificationName, 4));
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100009F3C, v6, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100009FB0;
  handler[3] = &unk_100075560;
  handler[4] = self;
  notify_register_dispatch("com.apple.system.thermalpressurelevel.cold", &self->_coldTempToken, (dispatch_queue_t)&_dispatch_main_q, handler);
  -[CBThermalManager _respondToCurrentThermalCondition](self, "_respondToCurrentThermalCondition");
  if (notify_register_check("com.apple.system.thermalsunlightstate", &self->_sunlightStateToken))
  {
    v7 = CheckerBoardLogHandleForCategory(10);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000451AC(v8, v9, v10, v11, v12, v13, v14, v15);

  }
}

- (void)_respondToCurrentThermalCondition
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  int64_t v24;
  unsigned int v25;
  void *v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  uint64_t v30;
  NSObject *v31;
  const __CFString *v32;
  void *v33;
  uint64_t state64;
  _BYTE buf[12];
  __int16 v36;
  unsigned int v37;

  v4 = CheckerBoardLogHandleForCategory(10);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Responding to current thermal condition…", buf, 2u);
  }

  v6 = OSThermalNotificationCurrentLevel(+[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, a2, 0));
  if (v6 >= (int)_OSThermalNotificationLevelForBehavior(8))
  {
    -[CBThermalManager _beginThermalJetsamCPUSampling](self, "_beginThermalJetsamCPUSampling");
  }
  else if (-[CBThermalManager sampling](self, "sampling"))
  {
    v7 = CheckerBoardLogHandleForCategory(10);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Thermal status level is %d. Canceling CPU usage sampling…", buf, 8u);
    }

    -[CBThermalManager setSampling:](self, "setSampling:", 0);
  }
  state64 = 0;
  notify_get_state(-[CBThermalManager coldTempToken](self, "coldTempToken"), &state64);
  v9 = -[CBThermalManager level](self, "level");
  v10 = -[CBThermalManager isInSunlight](self, "isInSunlight");
  if (v6 >= (int)_OSThermalNotificationLevelForBehavior(9))
  {
    v12 = 4;
  }
  else if (v6 >= (int)_OSThermalNotificationLevelForBehavior(8))
  {
    v12 = 3;
  }
  else if (v6 >= (int)_OSThermalNotificationLevelForBehavior(4))
  {
    v12 = 2;
  }
  else if (v6 >= (int)_OSThermalNotificationLevelForBehavior(2))
  {
    v12 = 1;
  }
  else
  {
    v11 = -2;
    if (state64 != 30)
      v11 = 0;
    if (state64 == 20)
      v12 = -1;
    else
      v12 = v11;
  }
  -[CBThermalManager setLevel:](self, "setLevel:", v12);
  if (-[CBThermalManager level](self, "level"))
  {
    *(_QWORD *)buf = 0;
    if (notify_get_state(-[CBThermalManager sunlightStateToken](self, "sunlightStateToken"), (uint64_t *)buf))
    {
      v13 = CheckerBoardLogHandleForCategory(10);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_1000451E0(v14, v15, v16, v17, v18, v19, v20, v21);

    }
    else
    {
      -[CBThermalManager setInSunlight:](self, "setInSunlight:", *(_QWORD *)buf != 0);
    }
  }
  if (v9 != (void *)-[CBThermalManager level](self, "level")
    || v10 != -[CBThermalManager isInSunlight](self, "isInSunlight"))
  {
    v22 = CheckerBoardLogHandleForCategory(10);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = -[CBThermalManager level](self, "level");
      v25 = -[CBThermalManager isInSunlight](self, "isInSunlight");
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v24;
      v36 = 1024;
      v37 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Device is at level (%ld) and in sunlight (%d). inPosting thermal conditions did change notification", buf, 0x12u);
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v26, "postNotificationName:object:userInfo:", CFSTR("CBThermalConditionsDidChangeNotification"), self, 0);

  }
  v27 = -[CBThermalManager _isLevelBlocked:](self, "_isLevelBlocked:", v9);
  v28 = -[CBThermalManager isThermalBlocked](self, "isThermalBlocked");
  if (v27 != v28)
  {
    v29 = v28;
    v30 = CheckerBoardLogHandleForCategory(10);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = CFSTR("un");
      if (v29)
        v32 = &stru_1000769A0;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Device is %@blocked. Posting thermal blocked did change notification", buf, 0xCu);
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v33, "postNotificationName:object:userInfo:", CFSTR("CBThermalBlockedDidChangeNotification"), self, 0);

  }
}

- (void)_beginThermalJetsamCPUSampling
{
  uint64_t v3;
  NSObject *v4;
  _BOOL8 v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  int v13;

  v3 = CheckerBoardLogHandleForCategory(10);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Begin thermal jetsam CPU sampling…", buf, 2u);
  }

  v5 = -[CBThermalManager sampling](self, "sampling");
  if (v5)
  {
    v6 = CheckerBoardLogHandleForCategory(10);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "We are already sampling for killing…", buf, 2u);
    }

  }
  else
  {
    v8 = OSThermalNotificationCurrentLevel(v5);
    v9 = CheckerBoardLogHandleForCategory(10);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Thermal status level is urgent (%d). Starting CPU usage sampling…", buf, 8u);
    }

    -[CBThermalManager setSampling:](self, "setSampling:", 1);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000A5A0;
    v11[3] = &unk_100075588;
    v11[4] = self;
    -[CBThermalManager _calculateAppsCPUTimesWithCompletion:](self, "_calculateAppsCPUTimesWithCompletion:", v11);
  }
}

- (void)_calculateAppsCPUTimesWithCompletion:(id)a3
{
  void (**v3)(id, void *);
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[16];
  _BYTE v21[128];

  v3 = (void (**)(id, void *))a3;
  if (v3)
  {
    v4 = CheckerBoardLogHandleForCategory(10);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Creating dictionary with applications to kill…", buf, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allApplicationProcesses"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v13, "elapsedCPUTime");
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleIdentifier"));
          objc_msgSend(v6, "setObject:forKey:", v14, v15);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v10);
    }
    v3[2](v3, v6);

  }
}

- (void)_killThermallyActiveApplication
{
  unsigned int v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v3 = -[CBThermalManager sampling](self, "sampling");
  v4 = CheckerBoardLogHandleForCategory(10);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "We are sampling so we must kill", buf, 2u);
    }

    -[CBThermalManager _killThermallyActiveDiagnosticsApplication](self, "_killThermallyActiveDiagnosticsApplication");
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "We are no longer sampling so no more killing", v7, 2u);
    }

  }
}

- (void)_killThermallyActiveDiagnosticsApplication
{
  _BOOL8 v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSRunLoopMode v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const __CFString *v13;

  v3 = -[CBThermalManager sampling](self, "sampling");
  if (v3)
  {
    v4 = OSThermalNotificationCurrentLevel(v3);
    v5 = CheckerBoardLogHandleForCategory(10);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v11 = v4;
      v12 = 2112;
      v13 = CFSTR("com.apple.Diagnostics");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Thermal status level is urgent (%d). Attempt to kill %@", buf, 0x12u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CBAppManager sharedInstance](CBAppManager, "sharedInstance"));
    objc_msgSend(v7, "terminateAppWithBundleID:reason:reportCrash:description:completion:", CFSTR("com.apple.Diagnostics"), 4, 1, 0, 0);

    v9 = NSRunLoopCommonModes;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    -[CBThermalManager performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", "_respondToCurrentThermalCondition", 0, v8, 30.0);

  }
  -[CBThermalManager setSampling:](self, "setSampling:", 0);
}

- (int64_t)level
{
  return self->_level;
}

- (void)setLevel:(int64_t)a3
{
  self->_level = a3;
}

- (BOOL)isInSunlight
{
  return self->_inSunlight;
}

- (void)setInSunlight:(BOOL)a3
{
  self->_inSunlight = a3;
}

- (BOOL)sampling
{
  return self->_sampling;
}

- (void)setSampling:(BOOL)a3
{
  self->_sampling = a3;
}

- (int)coldTempToken
{
  return self->_coldTempToken;
}

- (void)setColdTempToken:(int)a3
{
  self->_coldTempToken = a3;
}

- (int)sunlightStateToken
{
  return self->_sunlightStateToken;
}

- (void)setSunlightStateToken:(int)a3
{
  self->_sunlightStateToken = a3;
}

@end

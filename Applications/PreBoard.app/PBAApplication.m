@implementation PBAApplication

- (PBAApplication)init
{
  PBAApplication *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PBAApplication;
  v2 = -[PBAApplication init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBAIdleSleepController sharedController](PBAIdleSleepController, "sharedController"));
    -[PBAApplication setIdleSleepController:](v2, "setIdleSleepController:", v3);

  }
  return v2;
}

+ (id)_newApplicationInitializationContext
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UISMutableApplicationInitializationContext defaultContext](UISMutableApplicationInitializationContext, "defaultContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](FBSceneManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSceneIdentity identityForIdentifier:](FBSSceneIdentity, "identityForIdentifier:", v5));
  v7 = objc_msgSend(v3, "newSceneIdentityTokenForIdentity:", v6);

  objc_msgSend(v2, "setDefaultSceneToken:", v7);
  return v2;
}

- (BOOL)_hostsSystemStatusBar
{
  return 0;
}

- (BOOL)disablesFrontBoardImplicitWindowScenes
{
  return 1;
}

+ (BOOL)registerAsSystemApp
{
  return 0;
}

- (BOOL)_isSpringBoard
{
  return 1;
}

- (BOOL)__handleHIDEvent:(__IOHIDEvent *)a3
{
  uint64_t IntegerValue;
  int v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  int SmartCoverStateFromEvent;
  _DWORD v12[2];
  __int16 v13;
  int v14;
  __int16 v15;
  _BOOL4 v16;

  if (IOHIDEventGetType(a3, a2) != 3)
    return 0;
  IntegerValue = IOHIDEventGetIntegerValue(a3, 196608);
  v6 = IOHIDEventGetIntegerValue(a3, 196609);
  v7 = IOHIDEventGetIntegerValue(a3, 196610);
  v8 = sub_100006038();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v12[0] = 67109632;
    v12[1] = IntegerValue;
    v13 = 1024;
    v14 = v6;
    v15 = 1024;
    v16 = v7 != 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "usagePage: 0x%x usage: 0x%x downEvent: %d", (uint8_t *)v12, 0x14u);
  }

  if ((v6 | ((_DWORD)IntegerValue << 16)) != 0xC0030)
  {
    if (IntegerValue == 65289)
    {
      SmartCoverStateFromEvent = BKSHIDEventGetSmartCoverStateFromEvent(a3);
      if (SmartCoverStateFromEvent == 3)
      {
        -[PBAApplication _smartCoverClosed](self, "_smartCoverClosed");
      }
      else if (SmartCoverStateFromEvent == 1)
      {
        -[PBAApplication _smartCoverOpen](self, "_smartCoverOpen");
      }
    }
    return 0;
  }
  if (v7)
    -[PBAApplication _lockButtonDown](self, "_lockButtonDown");
  else
    -[PBAApplication _lockButtonUp](self, "_lockButtonUp");
  return 1;
}

- (void)_handleHIDEvent:(__IOHIDEvent *)a3
{
  objc_super v5;

  if (!-[PBAApplication __handleHIDEvent:](self, "__handleHIDEvent:"))
  {
    v5.receiver = self;
    v5.super_class = (Class)PBAApplication;
    -[PBAApplication _handleHIDEvent:](&v5, "_handleHIDEvent:", a3);
  }
}

- (BOOL)_handlePhysicalButtonEvent:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "_hidEvent");
  if (v4)
    return !-[PBAApplication __handleHIDEvent:](self, "__handleHIDEvent:", v4);
  else
    return 1;
}

- (void)_lockButtonDown
{
  if (-[PBAIdleSleepController isDisplayDim](self->_idleSleepController, "isDisplayDim"))
    -[PBAIdleSleepController resetIdleTimerAndUndim:](self->_idleSleepController, "resetIdleTimerAndUndim:", 1);
  else
    -[PBAApplication _startLockButtonTimer](self, "_startLockButtonTimer");
}

- (void)_lockButtonLongPress
{
  id v3;
  NSObject *v4;
  id v5;
  NSString *v6;
  void *v7;
  id v8;
  void *v9;
  uint8_t v10[16];

  v3 = sub_100006038();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Shutting down device", v10, 2u);
  }

  v5 = objc_alloc((Class)FBSShutdownOptions);
  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v5, "initWithReason:", v7);

  objc_msgSend(v8, "setSource:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FBSystemService sharedInstance](FBSystemService, "sharedInstance"));
  objc_msgSend(v9, "shutdownUsingOptions:", v8);

}

- (void)_smartCoverOpen
{
  if (-[PBAIdleSleepController isDisplayDim](self->_idleSleepController, "isDisplayDim"))
    -[PBAIdleSleepController resetIdleTimerAndUndim:](self->_idleSleepController, "resetIdleTimerAndUndim:", 1);
}

- (void)_smartCoverClosed
{
  if (!-[PBAIdleSleepController isDisplayDim](self->_idleSleepController, "isDisplayDim"))
    -[PBAIdleSleepController dimDisplay](self->_idleSleepController, "dimDisplay");
}

- (void)_startLockButtonTimer
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_lockButtonLongPress", 0, 0, 10.0));
  -[PBAApplication setLockButtonTimer:](self, "setLockButtonTimer:", v3);

}

- (void)_cancelLockButtonTimer
{
  -[PBAApplication setLockButtonTimer:](self, "setLockButtonTimer:", 0);
}

- (void)setLockButtonTimer:(id)a3
{
  NSTimer *v5;
  NSTimer **p_lockButtonTimer;
  NSTimer *v7;

  v5 = (NSTimer *)a3;
  p_lockButtonTimer = &self->_lockButtonTimer;
  if (*p_lockButtonTimer != v5)
  {
    v7 = v5;
    -[NSTimer invalidate](*p_lockButtonTimer, "invalidate");
    objc_storeStrong((id *)p_lockButtonTimer, a3);
    v5 = v7;
  }

}

- (void)_lockButtonUp
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBAApplication lockButtonTimer](self, "lockButtonTimer"));

  -[PBAApplication _cancelLockButtonTimer](self, "_cancelLockButtonTimer");
  if (v3)
    -[PBAIdleSleepController dimDisplay](self->_idleSleepController, "dimDisplay");
}

- (NSTimer)lockButtonTimer
{
  return self->_lockButtonTimer;
}

- (PBAIdleSleepController)idleSleepController
{
  return self->_idleSleepController;
}

- (void)setIdleSleepController:(id)a3
{
  objc_storeStrong((id *)&self->_idleSleepController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleSleepController, 0);
  objc_storeStrong((id *)&self->_lockButtonTimer, 0);
}

@end

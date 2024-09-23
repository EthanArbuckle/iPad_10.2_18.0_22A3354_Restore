@implementation PBAIdleSleepController

+ (id)sharedController
{
  if (qword_100021C78 != -1)
    dispatch_once(&qword_100021C78, &stru_100018CB0);
  return (id)qword_100021C70;
}

- (PBAIdleSleepController)init
{
  PBAIdleSleepController *v2;
  void *v3;
  uint64_t v4;
  BLSHService *backlightService;
  id v6;
  AWAttentionAwarenessClient *v7;
  AWAttentionAwarenessClient *attentionAwarenessClient;
  AWAttentionAwarenessClient *v9;
  id v10;
  void *v11;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PBAIdleSleepController;
  v2 = -[PBAIdleSleepController init](&v19, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BLSHLocalOnlyServiceConfiguration configurationWithFadeInDuration:fadeOutDuration:](BLSHLocalOnlyServiceConfiguration, "configurationWithFadeInDuration:fadeOutDuration:", 0.0, 0.1));
    v4 = objc_claimAutoreleasedReturnValue(+[BLSHService startLocalOnlyServiceWithConfiguration:](BLSHService, "startLocalOnlyServiceWithConfiguration:", v3));
    backlightService = v2->_backlightService;
    v2->_backlightService = (BLSHService *)v4;

    v6 = objc_alloc_init((Class)AWAttentionAwarenessConfiguration);
    objc_msgSend(v6, "setIdentifier:", CFSTR("PBAIdleTimer"));
    objc_msgSend(v6, "setEventMask:", 3967);
    objc_msgSend(v6, "setAttentionLostTimeout:", 30.0);
    v7 = (AWAttentionAwarenessClient *)objc_alloc_init((Class)AWAttentionAwarenessClient);
    attentionAwarenessClient = v2->_attentionAwarenessClient;
    v2->_attentionAwarenessClient = v7;

    -[AWAttentionAwarenessClient setConfiguration:shouldReset:](v2->_attentionAwarenessClient, "setConfiguration:shouldReset:", v6, 1);
    objc_initWeak(&location, v2);
    v9 = v2->_attentionAwarenessClient;
    v10 = &_dispatch_main_q;
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_10000B420;
    v16 = &unk_100018CD8;
    objc_copyWeak(&v17, &location);
    -[AWAttentionAwarenessClient setEventHandlerWithQueue:block:](v9, "setEventHandlerWithQueue:block:", &_dispatch_main_q, &v13);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SWSystemSleepMonitor monitorUsingMainQueue](SWSystemSleepMonitor, "monitorUsingMainQueue", v13, v14, v15, v16));
    objc_msgSend(v11, "addObserver:", v2);

    -[PBAIdleSleepController setDisplayDim:](v2, "setDisplayDim:", 0);
    -[PBAIdleSleepController _undimDisplayForce](v2, "_undimDisplayForce");
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  return v2;
}

- (void)_setHIDUILockedState:(BOOL)a3
{
  uint64_t v4;

  if (byte_100021B88 != a3)
  {
    if (a3)
      v4 = 48;
    else
      v4 = 0;
    BKSHIDServicesSetHIDUILockedStateWithSource(0, v4);
    byte_100021B88 = a3;
  }
}

- (void)_undimDisplayForce
{
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  AWAttentionAwarenessClient *attentionAwarenessClient;
  unsigned __int8 v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("PBAScreenWillUnblankNotification"), 0);

  v4 = sub_100006038();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Undimming display", buf, 2u);
  }

  v6 = objc_msgSend(objc_alloc((Class)BLSBacklightChangeRequest), "initWithRequestedActivityState:explanation:timestamp:sourceEvent:sourceEventMetadata:", 1, CFSTR("PreBoard Force Undim"), mach_continuous_time(), 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BLSBacklight sharedBacklight](BLSBacklight, "sharedBacklight"));
  v8 = objc_msgSend(v7, "performChangeRequest:", v6);

  BKSHIDServicesSetBacklightFactorWithFadeDuration(1, 1.0, 0.5);
  -[PBAIdleSleepController setDisplayDim:](self, "setDisplayDim:", 0);
  attentionAwarenessClient = self->_attentionAwarenessClient;
  v21 = 0;
  v10 = -[AWAttentionAwarenessClient resumeWithError:](attentionAwarenessClient, "resumeWithError:", &v21);
  v11 = v21;
  if ((v10 & 1) == 0)
  {
    v12 = sub_100006038();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10000C7C0((uint64_t)v11, v13, v14, v15, v16, v17, v18, v19);

  }
  -[PBAIdleSleepController _preventIdleSleep](self, "_preventIdleSleep");
  -[PBAIdleSleepController _setHIDUILockedState:](self, "_setHIDUILockedState:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v20, "postNotificationName:object:", CFSTR("PBAScreenDidUnblankNotification"), 0);

}

- (void)undimDisplay
{
  if (self->_displayDim)
    -[PBAIdleSleepController _undimDisplayForce](self, "_undimDisplayForce");
}

- (void)dimDisplay
{
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  AWAttentionAwarenessClient *attentionAwarenessClient;
  unsigned __int8 v10;
  id v11;
  double v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint8_t buf[16];

  if (!self->_displayDim)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("PBAScreenWillBlankNotification"), 0);

    v4 = sub_100006038();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dimming display", buf, 2u);
    }

    v6 = objc_msgSend(objc_alloc((Class)BLSBacklightChangeRequest), "initWithRequestedActivityState:explanation:timestamp:sourceEvent:sourceEventMetadata:", 0, CFSTR("PreBoard Dim Display"), mach_continuous_time(), 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BLSBacklight sharedBacklight](BLSBacklight, "sharedBacklight"));
    v8 = objc_msgSend(v7, "performChangeRequest:", v6);

    -[PBAIdleSleepController setDisplayDim:](self, "setDisplayDim:", 1);
    attentionAwarenessClient = self->_attentionAwarenessClient;
    v22 = 0;
    v10 = -[AWAttentionAwarenessClient suspendWithError:](attentionAwarenessClient, "suspendWithError:", &v22);
    v11 = v22;
    if ((v10 & 1) == 0)
    {
      v13 = sub_100006038();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_10000C824((uint64_t)v11, v14, v15, v16, v17, v18, v19, v20);

    }
    LODWORD(v12) = 1.0;
    -[PBAIdleSleepController _preventIdleSleepForNumberOfSeconds:](self, "_preventIdleSleepForNumberOfSeconds:", v12);
    -[PBAIdleSleepController _setHIDUILockedState:](self, "_setHIDUILockedState:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v21, "postNotificationName:object:", CFSTR("PBAScreenDidBlankNotification"), 0);

  }
}

- (void)_allowIdleSleep
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_allowIdleSleep", 0);
  -[PBAIdleSleepController setPreventIdleSleep:forReason:](self, "setPreventIdleSleep:forReason:", 0, CFSTR("backlight"));
}

- (void)_preventIdleSleep
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_allowIdleSleep", 0);
  -[PBAIdleSleepController setPreventIdleSleep:forReason:](self, "setPreventIdleSleep:forReason:", 1, CFSTR("backlight"));
}

- (void)_preventIdleSleepForNumberOfSeconds:(float)a3
{
  void *v5;
  NSRunLoopMode v6;

  if (self->_displayDim)
  {
    -[PBAIdleSleepController _preventIdleSleep](self, "_preventIdleSleep");
    v6 = NSRunLoopCommonModes;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
    -[PBAIdleSleepController performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", "_allowIdleSleep", 0, v5, a3);

  }
}

- (void)setPreventIdleSleep:(BOOL)a3 forReason:(id)a4
{
  _BOOL8 v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[FBSystemService sharedInstance](FBSystemService, "sharedInstance"));
  objc_msgSend(v6, "setSystemIdleSleepDisabled:forReason:", v4, v5);

}

- (void)resetIdleTimerAndUndim:(BOOL)a3
{
  AWAttentionAwarenessClient *attentionAwarenessClient;
  unsigned __int8 v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  if (a3)
    -[PBAIdleSleepController undimDisplay](self, "undimDisplay");
  attentionAwarenessClient = self->_attentionAwarenessClient;
  v15 = 0;
  v5 = -[AWAttentionAwarenessClient resetAttentionLostTimeoutWithError:](attentionAwarenessClient, "resetAttentionLostTimeoutWithError:", &v15);
  v6 = v15;
  if ((v5 & 1) == 0)
  {
    v7 = sub_100006038();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10000C888((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

  }
}

- (void)systemSleepMonitor:(id)a3 sleepRequestedWithResult:(id)a4
{
  uint64_t (**v4)(id, uint64_t, _QWORD);
  id v5;
  NSObject *v6;
  id v7;
  uint8_t v8[16];

  v4 = (uint64_t (**)(id, uint64_t, _QWORD))a4;
  v5 = sub_100006038();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Got kIOMessageCanSystemSleep", v8, 2u);
  }

  v7 = (id)v4[2](v4, 1, 0);
}

- (void)systemSleepMonitor:(id)a3 prepareForSleepWithCompletion:(id)a4
{
  void (**v4)(_QWORD);
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = (void (**)(_QWORD))a4;
  v5 = sub_100006038();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Got kIOMessageSystemWillSleep", v7, 2u);
  }

  v4[2](v4);
}

- (void)systemSleepMonitorSleepRequestAborted:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_100006038();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Got kIOMessageSystemWillNotSleep", v5, 2u);
  }

}

- (void)systemSleepMonitorWillWakeFromSleep:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_100006038();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Got kIOMessageSystemWillPowerOn", v5, 2u);
  }

}

- (void)systemSleepMonitorDidWakeFromSleep:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_100006038();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Got kIOMessageSystemHasPoweredOn", v5, 2u);
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

- (AWAttentionAwarenessClient)attentionAwarenessClient
{
  return self->_attentionAwarenessClient;
}

- (void)setAttentionAwarenessClient:(id)a3
{
  objc_storeStrong((id *)&self->_attentionAwarenessClient, a3);
}

- (BLSHService)backlightService
{
  return self->_backlightService;
}

- (void)setBacklightService:(id)a3
{
  objc_storeStrong((id *)&self->_backlightService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backlightService, 0);
  objc_storeStrong((id *)&self->_attentionAwarenessClient, 0);
}

@end

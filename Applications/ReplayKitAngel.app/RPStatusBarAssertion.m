@implementation RPStatusBarAssertion

- (void)acquireAssertionWithPidWaitForCompletion:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  SBSStatusBarStyleOverridesAssertion *v6;
  SBSStatusBarStyleOverridesAssertion *assertion;
  SBSStatusBarStyleOverridesAssertion *v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD v11[4];
  NSObject *v12;
  _QWORD *v13;
  _QWORD v14[5];
  RPStatusBarAssertion *v15;

  v3 = *(_QWORD *)&a3;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v6 = (SBSStatusBarStyleOverridesAssertion *)objc_msgSend(objc_alloc((Class)SBSStatusBarStyleOverridesAssertion), "initWithStatusBarStyleOverrides:forPID:exclusive:showsWhenForeground:", 0x100000, v3, 1, 0);
  assertion = self->_assertion;
  self->_assertion = v6;

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = sub_100007680;
  v14[4] = sub_100007690;
  v15 = self;
  v8 = self->_assertion;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100007698;
  v11[3] = &unk_100034D38;
  v13 = v14;
  v9 = v5;
  v12 = v9;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100007754;
  v10[3] = &unk_100034D60;
  v10[4] = v14;
  -[SBSStatusBarStyleOverridesAssertion acquireWithHandler:invalidationHandler:](v8, "acquireWithHandler:invalidationHandler:", v11, v10);
  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

  _Block_object_dispose(v14, 8);
}

- (void)acquireAssertionWithPid:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  -[RPStatusBarAssertion acquireAssertionWithPidWaitForCompletion:](self, "acquireAssertionWithPidWaitForCompletion:");
  if (!self->_assertion)
    -[RPStatusBarAssertion acquireAssertionWithPidWaitForCompletion:](self, "acquireAssertionWithPidWaitForCompletion:", v3);
}

- (void)showStatusBarWithPid:(int)a3
{
  SBSStatusBarStyleOverridesCoordinator *v4;
  SBSStatusBarStyleOverridesCoordinator *coordinator;
  void *v6;

  -[RPStatusBarAssertion acquireAssertionWithPid:](self, "acquireAssertionWithPid:", *(_QWORD *)&a3);
  if (self->_assertion)
  {
    v4 = (SBSStatusBarStyleOverridesCoordinator *)objc_alloc_init((Class)SBSStatusBarStyleOverridesCoordinator);
    coordinator = self->_coordinator;
    self->_coordinator = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPStatusBarAssertion delegate](self, "delegate"));
    -[SBSStatusBarStyleOverridesCoordinator setDelegate:](self->_coordinator, "setDelegate:", v6);

    -[SBSStatusBarStyleOverridesCoordinator setRegisteredStyleOverrides:reply:](self->_coordinator, "setRegisteredStyleOverrides:reply:", 0x100000, &stru_100034DA0);
    -[RPStatusBarAssertion startRepeatingTimer](self, "startRepeatingTimer");
  }
}

- (void)startRepeatingTimer
{
  _QWORD block[5];

  self->_totalPausedTime = 0.0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007928;
  block[3] = &unk_100034D10;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)invalidateStatusBar
{
  SBSStatusBarStyleOverridesAssertion *assertion;
  SBSStatusBarStyleOverridesCoordinator *coordinator;
  NSTimer *timer;
  uint8_t v6[16];

  if (self->_assertion)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPStatusBarAssertion: double height status bar assertion released", v6, 2u);
    }
    -[SBSStatusBarStyleOverridesAssertion invalidate](self->_assertion, "invalidate");
    assertion = self->_assertion;
    self->_assertion = 0;

    -[SBSStatusBarStyleOverridesCoordinator setRegisteredStyleOverrides:reply:](self->_coordinator, "setRegisteredStyleOverrides:reply:", 0, &stru_100034DC0);
    coordinator = self->_coordinator;
    self->_coordinator = 0;

    -[NSTimer invalidate](self->_timer, "invalidate");
    timer = self->_timer;
    self->_timer = 0;

  }
  self->_totalPausedTime = 0.0;
}

- (id)stringWithTimeInterval:(double)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = objc_alloc_init((Class)NSDateComponentsFormatter);
  objc_msgSend(v4, "setUnitsStyle:", 0);
  objc_msgSend(v4, "setIncludesApproximationPhrase:", 0);
  objc_msgSend(v4, "setIncludesTimeRemainingPhrase:", 0);
  objc_msgSend(v4, "setMaximumUnitCount:", 2);
  if (a3 >= 60.0)
  {
    v5 = 240;
  }
  else
  {
    objc_msgSend(v4, "setZeroFormattingBehavior:", 0x10000);
    v5 = 192;
  }
  objc_msgSend(v4, "setAllowedUnits:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringFromTimeInterval:", a3));

  return v6;
}

- (id)rpLocalizedStatusStringForPaused:(BOOL)a3
{
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  if (self->_broadcasting)
  {
    if (a3)
      v4 = CFSTR("BROADCASTING_PAUSED_STATUS_BAR_FORMAT");
    else
      v4 = CFSTR("BROADCASTING_STATUS_BAR_FORMAT");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, self->_broadcastServiceName));

  }
  else
  {
    if (a3)
      v5 = CFSTR("RECORDING_PAUSED_STATUS_BAR");
    else
      v5 = CFSTR("RECORDING_STATUS_BAR");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", v5));
  }
  return v7;
}

- (void)updateDelegateRecordingTimer:(id)a3
{
  void *v4;
  double v5;
  double v6;
  RPStatusBarAssertionDelegate *assertionDelegate;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date", a3));
  objc_msgSend(v4, "timeIntervalSinceDate:", self->_timerStartDate);
  v6 = v5 - self->_totalPausedTime;

  assertionDelegate = self->_assertionDelegate;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RPStatusBarAssertion stringWithTimeInterval:](self, "stringWithTimeInterval:", v6));
  -[RPStatusBarAssertionDelegate timerDidUpdate:](assertionDelegate, "timerDidUpdate:", v8);

}

- (void)statusBarCoordinator:(id)a3 invalidatedRegistrationWithError:(id)a4
{
  int v5;
  id v6;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = objc_msgSend(a4, "code");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPStatusBarAssertion: coordinator registartion invalidated with error %li", (uint8_t *)&v5, 0xCu);
  }
}

- (void)pauseSession
{
  NSDate *v3;
  NSDate *timerPauseDate;

  v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  timerPauseDate = self->_timerPauseDate;
  self->_timerPauseDate = v3;

}

- (void)resumeSession
{
  double totalPausedTime;
  double v4;
  id v5;

  totalPausedTime = self->_totalPausedTime;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v5, "timeIntervalSinceDate:", self->_timerPauseDate);
  self->_totalPausedTime = totalPausedTime + v4;

}

- (BOOL)microphoneEnabled
{
  return self->_microphoneEnabled;
}

- (void)setMicrophoneEnabled:(BOOL)a3
{
  self->_microphoneEnabled = a3;
}

- (BOOL)broadcasting
{
  return self->_broadcasting;
}

- (void)setBroadcasting:(BOOL)a3
{
  self->_broadcasting = a3;
}

- (NSString)broadcastServiceName
{
  return self->_broadcastServiceName;
}

- (void)setBroadcastServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_broadcastServiceName, a3);
}

- (SBSStatusBarStyleOverridesCoordinatorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (RPStatusBarAssertionDelegate)assertionDelegate
{
  return self->_assertionDelegate;
}

- (void)setAssertionDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_assertionDelegate, a3);
}

- (SBSStatusBarStyleOverridesAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_assertion, a3);
}

- (SBSStatusBarStyleOverridesCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_coordinator, a3);
}

- (BOOL)paused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (NSDate)timerStartDate
{
  return self->_timerStartDate;
}

- (void)setTimerStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_timerStartDate, a3);
}

- (double)totalPausedTime
{
  return self->_totalPausedTime;
}

- (void)setTotalPausedTime:(double)a3
{
  self->_totalPausedTime = a3;
}

- (NSDate)timerPauseDate
{
  return self->_timerPauseDate;
}

- (void)setTimerPauseDate:(id)a3
{
  objc_storeStrong((id *)&self->_timerPauseDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerPauseDate, 0);
  objc_storeStrong((id *)&self->_timerStartDate, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_assertionDelegate, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_broadcastServiceName, 0);
}

@end

@implementation DVTiOSDeviceGlobalStatusIndicator

- (DVTiOSDeviceGlobalStatusIndicator)initWithConfiguration:(id)a3 stoppedByUserBlock:(id)a4
{
  id v7;
  id v8;
  DVTiOSDeviceGlobalStatusIndicator *v9;
  DVTiOSDeviceGlobalStatusIndicator *v10;
  void *v11;
  id stoppedByUserBlock;
  os_log_t v13;
  OS_os_log *statusIndicatorLog;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DVTiOSDeviceGlobalStatusIndicator;
  v9 = -[DVTiOSDeviceGlobalStatusIndicator init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    v11 = _Block_copy(v8);
    stoppedByUserBlock = v10->_stoppedByUserBlock;
    v10->_stoppedByUserBlock = v11;

    v13 = os_log_create("com.apple.dt.DVTInstrumentsFoundation", "DeviceStatusIndicator");
    statusIndicatorLog = v10->_statusIndicatorLog;
    v10->_statusIndicatorLog = (OS_os_log *)v13;

  }
  return v10;
}

- (void)activateWithCompletionBlock:(id)a3
{
  id v4;
  SBSStatusBarStyleOverridesAssertion *v5;
  SBSStatusBarStyleOverridesAssertion *statusBarAssertion;
  void *v7;
  void *v8;
  SBSStatusBarStyleOverridesCoordinator *v9;
  SBSStatusBarStyleOverridesCoordinator *coordinator;
  SBSStatusBarStyleOverridesCoordinator *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BEB0B38], "assertionWithStatusBarStyleOverrides:forPID:exclusive:showsWhenForeground:", 0x80000, getpid(), 1, 1);
  v5 = (SBSStatusBarStyleOverridesAssertion *)objc_claimAutoreleasedReturnValue();
  statusBarAssertion = self->_statusBarAssertion;
  self->_statusBarAssertion = v5;

  -[DVTiOSDeviceGlobalStatusIndicator configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSStatusBarStyleOverridesAssertion setStatusString:](self->_statusBarAssertion, "setStatusString:", v8);

  v9 = (SBSStatusBarStyleOverridesCoordinator *)objc_alloc_init(MEMORY[0x24BEB0B40]);
  coordinator = self->_coordinator;
  self->_coordinator = v9;

  -[SBSStatusBarStyleOverridesCoordinator setDelegate:](self->_coordinator, "setDelegate:", self);
  objc_initWeak(&location, self);
  v11 = self->_coordinator;
  v12 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_222B5E050;
  v17[3] = &unk_24EB29C90;
  objc_copyWeak(&v18, &location);
  -[SBSStatusBarStyleOverridesCoordinator setRegisteredStyleOverrides:reply:](v11, "setRegisteredStyleOverrides:reply:", 0x80000, v17);
  v14[0] = v12;
  v14[1] = 3221225472;
  v14[2] = sub_222B5E0B8;
  v14[3] = &unk_24EB29CB8;
  objc_copyWeak(&v16, &location);
  v13 = v4;
  v15 = v13;
  -[DVTiOSDeviceGlobalStatusIndicator acquireStatusBarWithCompletionHandler:](self, "acquireStatusBarWithCompletionHandler:", v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)acquireStatusBarWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  dispatch_get_global_queue(25, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_222B5E1E8;
  v7[3] = &unk_24EB29CE0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)clearStatusBar
{
  void *v3;
  __CFUserNotification *userNotificationStopCondition;

  -[DVTiOSDeviceGlobalStatusIndicator statusBarAssertion](self, "statusBarAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[DVTiOSDeviceGlobalStatusIndicator setStatusBarAssertion:](self, "setStatusBarAssertion:", 0);
  userNotificationStopCondition = self->_userNotificationStopCondition;
  if (userNotificationStopCondition)
    CFUserNotificationCancel(userNotificationStopCondition);
}

- (BOOL)_showStopConditionAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFDictionary *v9;
  __CFUserNotification *v10;
  void (**v11)(void);
  CFOptionFlags v13;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x24BDAC8D0];
  v14[0] = *MEMORY[0x24BDBD6D8];
  -[DVTiOSDeviceGlobalStatusIndicator configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  v14[1] = *MEMORY[0x24BDBD6E0];
  -[DVTiOSDeviceGlobalStatusIndicator configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "informationText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDBD718];
  v15[1] = v6;
  v15[2] = CFSTR("Continue Recording");
  v8 = *MEMORY[0x24BDBD6F8];
  v14[2] = v7;
  v14[3] = v8;
  v15[3] = CFSTR("Stop Recording");
  v9 = (const __CFDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);

  self->_userNotificationStopCondition = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0.0, 0, 0, v9);
  v10 = -[DVTiOSDeviceGlobalStatusIndicator userNotificationStopCondition](self, "userNotificationStopCondition");
  if (v10)
  {
    v13 = 0;
    CFUserNotificationReceiveResponse(self->_userNotificationStopCondition, 0.0, &v13);
    if (!v13)
    {
      -[DVTiOSDeviceGlobalStatusIndicator stoppedByUserBlock](self, "stoppedByUserBlock");
      v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v11[2]();

      -[DVTiOSDeviceGlobalStatusIndicator clearStatusBar](self, "clearStatusBar");
    }
    CFRelease(self->_userNotificationStopCondition);
    self->_userNotificationStopCondition = 0;
  }
  return v10 != 0;
}

- (BOOL)statusBarCoordinator:(id)a3 receivedTapWithContext:(id)a4 completionBlock:(id)a5
{
  void (**v6)(_QWORD);

  v6 = (void (**)(_QWORD))a5;
  -[DVTiOSDeviceGlobalStatusIndicator _showStopConditionAlert](self, "_showStopConditionAlert");
  v6[2](v6);

  return 1;
}

- (void)statusBarCoordinator:(id)a3 invalidatedRegistrationWithError:(id)a4
{
  NSObject *statusIndicatorLog;

  statusIndicatorLog = self->_statusIndicatorLog;
  if (os_log_type_enabled(statusIndicatorLog, OS_LOG_TYPE_ERROR))
    sub_222BC6878(statusIndicatorLog, a4);
}

- (SBSStatusBarStyleOverridesAssertion)statusBarAssertion
{
  return self->_statusBarAssertion;
}

- (void)setStatusBarAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarAssertion, a3);
}

- (SBSStatusBarStyleOverridesCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_coordinator, a3);
}

- (__CFUserNotification)userNotificationStopCondition
{
  return self->_userNotificationStopCondition;
}

- (void)setUserNotificationStopCondition:(__CFUserNotification *)a3
{
  self->_userNotificationStopCondition = a3;
}

- (DVTDeviceGlobalStatusIndicatorConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (id)stoppedByUserBlock
{
  return self->_stoppedByUserBlock;
}

- (void)setStoppedByUserBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stoppedByUserBlock, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_statusBarAssertion, 0);
  objc_storeStrong((id *)&self->_statusIndicatorLog, 0);
}

@end

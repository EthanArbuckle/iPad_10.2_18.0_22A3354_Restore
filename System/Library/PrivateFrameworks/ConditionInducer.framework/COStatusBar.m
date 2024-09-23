@implementation COStatusBar

- (COStatusBar)initWithConditionClass:(id)a3 profile:(id)a4 teardownBeganCb:(id)a5 teardownCompleteCb:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  COStatusBar *v15;
  uint64_t v16;
  id terminationBeganCallback;
  uint64_t v18;
  id terminationNotifyCallback;
  uint64_t v20;
  SBSStatusBarStyleOverridesAssertion *statusBarAssertion;
  SBSStatusBarStyleOverridesCoordinator *v22;
  SBSStatusBarStyleOverridesCoordinator *coordinator;
  uint8_t v25[16];
  objc_super v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)COStatusBar;
  v15 = -[COStatusBar init](&v26, sel_init);
  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Creating statusbar assertion for ConditionInducer", v25, 2u);
    }
    objc_storeStrong((id *)&v15->_conditionClass, a3);
    objc_storeStrong((id *)&v15->_profileDescription, a4);
    v16 = MEMORY[0x2207CD70C](v13);
    terminationBeganCallback = v15->_terminationBeganCallback;
    v15->_terminationBeganCallback = (id)v16;

    v18 = MEMORY[0x2207CD70C](v14);
    terminationNotifyCallback = v15->_terminationNotifyCallback;
    v15->_terminationNotifyCallback = (id)v18;

    objc_msgSend(MEMORY[0x24BEB0B38], "assertionWithStatusBarStyleOverrides:forPID:exclusive:showsWhenForeground:", 0x80000, getpid(), 1, 1);
    v20 = objc_claimAutoreleasedReturnValue();
    statusBarAssertion = v15->_statusBarAssertion;
    v15->_statusBarAssertion = (SBSStatusBarStyleOverridesAssertion *)v20;

    v22 = (SBSStatusBarStyleOverridesCoordinator *)objc_alloc_init(MEMORY[0x24BEB0B40]);
    coordinator = v15->_coordinator;
    v15->_coordinator = v22;

    -[SBSStatusBarStyleOverridesCoordinator setDelegate:](v15->_coordinator, "setDelegate:", v15);
    -[SBSStatusBarStyleOverridesCoordinator setRegisteredStyleOverrides:reply:](v15->_coordinator, "setRegisteredStyleOverrides:reply:", 0x80000, &__block_literal_global_0);
    -[COStatusBar acquireStatusBarWithCompletionHandler:](v15, "acquireStatusBarWithCompletionHandler:", &__block_literal_global_4);
  }

  return v15;
}

void __81__COStatusBar_initWithConditionClass_profile_teardownBeganCb_teardownCompleteCb___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint8_t v3[16];

  v2 = a2;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __81__COStatusBar_initWithConditionClass_profile_teardownBeganCb_teardownCompleteCb___block_invoke_cold_1((uint64_t)v2);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Registered status bar assertion", v3, 2u);
  }

}

void __81__COStatusBar_initWithConditionClass_profile_teardownBeganCb_teardownCompleteCb___block_invoke_2(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __81__COStatusBar_initWithConditionClass_profile_teardownBeganCb_teardownCompleteCb___block_invoke_2_cold_1();
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
  v7[2] = __53__COStatusBar_acquireStatusBarWithCompletionHandler___block_invoke;
  v7[3] = &unk_24E471438;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __53__COStatusBar_acquireStatusBarWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "statusBarAssertion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__COStatusBar_acquireStatusBarWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_24E471410;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  objc_msgSend(v2, "acquireWithHandler:invalidationHandler:", v3, v4);

  objc_destroyWeak(&v5);
}

void __53__COStatusBar_acquireStatusBarWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "clearStatusBar");

}

- (void)clearStatusBar
{
  void *v3;
  uint8_t v4[16];

  -[COStatusBar statusBarAssertion](self, "statusBarAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[COStatusBar setStatusBarAssertion:](self, "setStatusBarAssertion:", 0);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Released status bar assertion for ConditionInducer", v4, 2u);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[COStatusBar clearStatusBar](self, "clearStatusBar");
  v3.receiver = self;
  v3.super_class = (Class)COStatusBar;
  -[COStatusBar dealloc](&v3, sel_dealloc);
}

- (id)getDeviceType
{
  return (id)MGCopyAnswer();
}

- (id)doTeardownOnStop
{
  id v2;
  BOOL v3;
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v20 = v2;
  v3 = +[COConditionSession tearDownAllConditionsWithErrors:](COConditionSession, "tearDownAllConditionsWithErrors:", &v20);
  v4 = v20;

  if (!v3)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v4, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v17;
      v10 = MEMORY[0x24BDACB70];
      *(_QWORD *)&v7 = 138412546;
      v15 = v7;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v5);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKey:", v12, v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v15;
            v22 = v12;
            v23 = 2112;
            v24 = v13;
            _os_log_error_impl(&dword_21F8CF000, v10, OS_LOG_TYPE_ERROR, "From the status bar, error while tearing down %@: %@", buf, 0x16u);
          }

        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
      }
      while (v8);
    }

  }
  return v4;
}

- (BOOL)showStopConditionAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const __CFDictionary *v12;
  __CFUserNotification *v13;
  void *v14;
  void (**v15)(void);
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  void (**v35)(_QWORD, _QWORD);
  uint8_t buf[16];
  CFOptionFlags responseFlags;
  _QWORD v39[4];
  _QWORD v40[5];

  v40[4] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  -[COStatusBar conditionClass](self, "conditionClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ Condition Active"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD17C8];
  -[COStatusBar profileDescription](self, "profileDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[COStatusBar getDeviceType](self, "getDeviceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("\"%@\" is active on this %@. Stop running this condition?"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *MEMORY[0x24BDBD6E0];
  v39[0] = *MEMORY[0x24BDBD6D8];
  v39[1] = v10;
  v40[0] = v5;
  v40[1] = v9;
  v11 = *MEMORY[0x24BDBD6F8];
  v39[2] = *MEMORY[0x24BDBD718];
  v39[3] = v11;
  v40[2] = CFSTR("Cancel");
  v40[3] = CFSTR("Stop");
  v12 = (const __CFDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
  self->_userNotificationStopCondition = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0.0, 0, 0, v12);
  v13 = -[COStatusBar userNotificationStopCondition](self, "userNotificationStopCondition");
  if (v13)
  {
    responseFlags = 0;
    CFUserNotificationReceiveResponse(self->_userNotificationStopCondition, 0.0, &responseFlags);
    switch(responseFlags)
    {
      case 3uLL:
        v24 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
        if (v24)
          -[COStatusBar showStopConditionAlert].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);
        break;
      case 2uLL:
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Continuing with the condition...", buf, 2u);
        }
        break;
      case 0uLL:
        -[COStatusBar setDidRequestTeardownOnce:](self, "setDidRequestTeardownOnce:", 1);
        -[COStatusBar terminationBeganCallback](self, "terminationBeganCallback");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[COStatusBar terminationBeganCallback](self, "terminationBeganCallback");
          v15 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v15[2]();

        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "We got a request, to terminate, but there's no termination began callback set", buf, 2u);
        }
        -[COStatusBar doTeardownOnStop](self, "doTeardownOnStop");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[COStatusBar terminationNotifyCallback](self, "terminationNotifyCallback");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
        if (v33)
        {
          if (v34)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Invoking termination callback...", buf, 2u);
          }
          -[COStatusBar terminationNotifyCallback](self, "terminationNotifyCallback");
          v35 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v35)[2](v35, v32);

        }
        else if (v34)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "We got a request, to terminate, but there's no termination complete callback set", buf, 2u);
        }

        break;
    }
    CFRelease(self->_userNotificationStopCondition);
    self->_userNotificationStopCondition = 0;
  }
  else
  {
    v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v16)
      -[COStatusBar showStopConditionAlert].cold.2(v16, v17, v18, v19, v20, v21, v22, v23);
  }

  return v13 != 0;
}

- (void)showConditionIsTearingDownAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *alertHeader;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[COStatusBar conditionClass](self, "conditionClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ Condition Stopping"), v4);
  alertHeader = (__CFString *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD17C8];
  -[COStatusBar profileDescription](self, "profileDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("\"%@\" may take a few moments to turn off."), v6);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  CFUserNotificationDisplayNotice(0.0, 2uLL, 0, 0, 0, alertHeader, v7, CFSTR("OK"));
}

- (BOOL)statusBarCoordinator:(id)a3 receivedTapWithContext:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  int v12;
  COStatusBar *v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v12 = 138412546;
    v13 = self;
    v14 = 1024;
    v15 = -[COStatusBar didRequestTeardownOnce](self, "didRequestTeardownOnce");
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Received a tap on the status bar coordinator! Showing popup... %@, %d", (uint8_t *)&v12, 0x12u);
  }
  if (-[COStatusBar didRequestTeardownOnce](self, "didRequestTeardownOnce"))
    -[COStatusBar showConditionIsTearingDownAlert](self, "showConditionIsTearingDownAlert");
  else
    -[COStatusBar showStopConditionAlert](self, "showStopConditionAlert");
  v10[2](v10);

  return 1;
}

- (void)statusBarCoordinator:(id)a3 invalidatedRegistrationWithError:(id)a4
{
  uint8_t v4[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "statusBarCoordinator:invalidatedRegistrationWithError:", v4, 2u);
  }
}

- (id)terminationNotifyCallback
{
  return self->_terminationNotifyCallback;
}

- (void)setTerminationNotifyCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)terminationBeganCallback
{
  return self->_terminationBeganCallback;
}

- (void)setTerminationBeganCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
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

- (NSString)conditionClass
{
  return self->_conditionClass;
}

- (void)setConditionClass:(id)a3
{
  objc_storeStrong((id *)&self->_conditionClass, a3);
}

- (NSString)profileDescription
{
  return self->_profileDescription;
}

- (void)setProfileDescription:(id)a3
{
  objc_storeStrong((id *)&self->_profileDescription, a3);
}

- (BOOL)didRequestTeardownOnce
{
  return self->_didRequestTeardownOnce;
}

- (void)setDidRequestTeardownOnce:(BOOL)a3
{
  self->_didRequestTeardownOnce = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileDescription, 0);
  objc_storeStrong((id *)&self->_conditionClass, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_statusBarAssertion, 0);
  objc_storeStrong(&self->_terminationBeganCallback, 0);
  objc_storeStrong(&self->_terminationNotifyCallback, 0);
}

void __81__COStatusBar_initWithConditionClass_profile_teardownBeganCb_teardownCompleteCb___block_invoke_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error registering status bar assertion: %@", (uint8_t *)&v1, 0xCu);
}

void __81__COStatusBar_initWithConditionClass_profile_teardownBeganCb_teardownCompleteCb___block_invoke_2_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to acquire status bar assertion for ConditionInducer", v0, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)showStopConditionAlert
{
  OUTLINED_FUNCTION_0_1(&dword_21F8CF000, MEMORY[0x24BDACB70], a3, "Unable to show status bar alert for condition!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

@end

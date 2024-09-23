@implementation AFPowerAssertionManager

- (AFPowerAssertionManager)initWithIdentifier:(id)a3
{
  id v4;
  AFPowerAssertionManager *v5;
  uint64_t v6;
  NSString *identifier;
  const char *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  AFAssertionCoordinator *v13;
  AFAssertionCoordinator *assertionCoordinator;
  NSObject *v15;
  NSString *v16;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  AFPowerAssertionManager *v22;
  __int16 v23;
  NSString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AFPowerAssertionManager;
  v5 = -[AFPowerAssertionManager init](&v18, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "length"))
    {
      v6 = objc_msgSend(v4, "copy");
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v6;
    }
    else
    {
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)CFSTR("com.apple.assistant.power-assertion-manager");
    }

    v8 = (const char *)objc_msgSend(CFSTR("com.apple.assistant.power-assertion-manager"), "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_DEFAULT, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = dispatch_queue_create(v8, v10);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v11;

    v13 = -[AFAssertionCoordinator initWithIdentifier:queue:delegate:]([AFAssertionCoordinator alloc], "initWithIdentifier:queue:delegate:", CFSTR("com.apple.assistant.power-assertion-manager"), v5->_queue, v5);
    assertionCoordinator = v5->_assertionCoordinator;
    v5->_assertionCoordinator = v13;

    v5->_powerAssertion = 0;
    v15 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v16 = v5->_identifier;
      *(_DWORD *)buf = 136315650;
      v20 = "-[AFPowerAssertionManager initWithIdentifier:]";
      v21 = 2048;
      v22 = v5;
      v23 = 2112;
      v24 = v16;
      _os_log_impl(&dword_19AF50000, v15, OS_LOG_TYPE_INFO, "%s %p (%@)", buf, 0x20u);
    }
  }

  return v5;
}

- (void)takePowerAssertionWithName:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  NSString *identifier;
  __CFString *v7;
  __CFString *v8;
  AFAssertionCoordinator *assertionCoordinator;
  uint64_t v10;
  __CFString *v11;
  id v12;
  void *v13;
  NSObject *queue;
  __CFString *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  __CFString *v19;
  _QWORD v20[4];
  __CFString *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  AFPowerAssertionManager *v25;
  __int16 v26;
  NSString *v27;
  __int16 v28;
  __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 136315906;
    v23 = "-[AFPowerAssertionManager takePowerAssertionWithName:]";
    v24 = 2048;
    v25 = self;
    v26 = 2112;
    v27 = identifier;
    v28 = 2112;
    v29 = v4;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %p (%@) name = %@", buf, 0x2Au);
  }
  v7 = CFSTR("default");
  if (v4)
    v7 = v4;
  v8 = v7;
  assertionCoordinator = self->_assertionCoordinator;
  v10 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __54__AFPowerAssertionManager_takePowerAssertionWithName___block_invoke;
  v20[3] = &unk_1E3A2DB38;
  v11 = v8;
  v21 = v11;
  v12 = +[AFAssertionContext newWithBuilder:](AFAssertionContext, "newWithBuilder:", v20);
  -[AFAssertionCoordinator acquireRelinquishableAssertionWithContext:relinquishmentHandler:](assertionCoordinator, "acquireRelinquishableAssertionWithContext:relinquishmentHandler:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __54__AFPowerAssertionManager_takePowerAssertionWithName___block_invoke_2;
  v17[3] = &unk_1E3A36B90;
  v17[4] = self;
  v18 = v13;
  v19 = v11;
  v15 = v11;
  v16 = v13;
  dispatch_async(queue, v17);

}

- (void)releasePowerAssertionWithName:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  NSString *identifier;
  __CFString *v7;
  __CFString *v8;
  NSObject *queue;
  __CFString *v10;
  _QWORD v11[5];
  __CFString *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  AFPowerAssertionManager *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 136315906;
    v14 = "-[AFPowerAssertionManager releasePowerAssertionWithName:]";
    v15 = 2048;
    v16 = self;
    v17 = 2112;
    v18 = identifier;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %p (%@) name = %@", buf, 0x2Au);
  }
  v7 = CFSTR("default");
  if (v4)
    v7 = v4;
  v8 = v7;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__AFPowerAssertionManager_releasePowerAssertionWithName___block_invoke;
  v11[3] = &unk_1E3A36FC8;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)releaseAllPowerAssertions
{
  NSObject *v3;
  NSString *identifier;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  AFPowerAssertionManager *v10;
  __int16 v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 136315650;
    v8 = "-[AFPowerAssertionManager releaseAllPowerAssertions]";
    v9 = 2048;
    v10 = self;
    v11 = 2112;
    v12 = identifier;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p (%@)", buf, 0x20u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AFPowerAssertionManager_releaseAllPowerAssertions__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)dealloc
{
  NSObject *v3;
  NSString *identifier;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  AFPowerAssertionManager *v9;
  __int16 v10;
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 136315650;
    v7 = "-[AFPowerAssertionManager dealloc]";
    v8 = 2048;
    v9 = self;
    v10 = 2112;
    v11 = identifier;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p (%@)", buf, 0x20u);
  }
  -[AFPowerAssertionManager _releasePowerAssertion](self, "_releasePowerAssertion");
  v5.receiver = self;
  v5.super_class = (Class)AFPowerAssertionManager;
  -[AFPowerAssertionManager dealloc](&v5, sel_dealloc);
}

- (void)assertionCoordinator:(id)a3 didActivateAssertion:(id)a4 isFirstAssertion:(BOOL)a5
{
  _BOOL4 v5;
  AFAssertionCoordinator *v8;
  AFAssertionCoordinator *v9;
  AFAssertionCoordinator *assertionCoordinator;
  NSObject *v11;
  NSString *v12;
  NSString *identifier;
  int v14;
  const char *v15;
  __int16 v16;
  AFPowerAssertionManager *v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  AFAssertionCoordinator *v21;
  __int16 v22;
  AFAssertionCoordinator *v23;
  uint64_t v24;

  v5 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = (AFAssertionCoordinator *)a3;
  v9 = (AFAssertionCoordinator *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  assertionCoordinator = self->_assertionCoordinator;
  v11 = AFSiriLogContextConnection;
  if (assertionCoordinator == v8)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      identifier = self->_identifier;
      v14 = 136316162;
      v15 = "-[AFPowerAssertionManager assertionCoordinator:didActivateAssertion:isFirstAssertion:]";
      v16 = 2048;
      v17 = self;
      v18 = 2112;
      v19 = identifier;
      v20 = 2112;
      v21 = v9;
      v22 = 1024;
      LODWORD(v23) = v5;
      _os_log_debug_impl(&dword_19AF50000, v11, OS_LOG_TYPE_DEBUG, "%s %p (%@) assertion = %@, isFirstAssertion = %d", (uint8_t *)&v14, 0x30u);
      if (!v5)
        goto LABEL_7;
    }
    else if (!v5)
    {
      goto LABEL_7;
    }
    -[AFPowerAssertionManager _createPowerAssertion](self, "_createPowerAssertion");
    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v12 = self->_identifier;
    v14 = 136316162;
    v15 = "-[AFPowerAssertionManager assertionCoordinator:didActivateAssertion:isFirstAssertion:]";
    v16 = 2048;
    v17 = self;
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = assertionCoordinator;
    v22 = 2112;
    v23 = v8;
    _os_log_error_impl(&dword_19AF50000, v11, OS_LOG_TYPE_ERROR, "%s %p (%@) Expected assertion coordinator is %@, actual assertion coordinator is %@.", (uint8_t *)&v14, 0x34u);
  }
LABEL_7:

}

- (void)assertionCoordinator:(id)a3 didDeactivateAssertion:(id)a4 isLastAssertion:(BOOL)a5
{
  _BOOL4 v5;
  AFAssertionCoordinator *v8;
  AFAssertionCoordinator *v9;
  AFAssertionCoordinator *assertionCoordinator;
  NSObject *v11;
  NSString *v12;
  NSString *identifier;
  int v14;
  const char *v15;
  __int16 v16;
  AFPowerAssertionManager *v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  AFAssertionCoordinator *v21;
  __int16 v22;
  AFAssertionCoordinator *v23;
  uint64_t v24;

  v5 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = (AFAssertionCoordinator *)a3;
  v9 = (AFAssertionCoordinator *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  assertionCoordinator = self->_assertionCoordinator;
  v11 = AFSiriLogContextConnection;
  if (assertionCoordinator == v8)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      identifier = self->_identifier;
      v14 = 136316162;
      v15 = "-[AFPowerAssertionManager assertionCoordinator:didDeactivateAssertion:isLastAssertion:]";
      v16 = 2048;
      v17 = self;
      v18 = 2112;
      v19 = identifier;
      v20 = 2112;
      v21 = v9;
      v22 = 1024;
      LODWORD(v23) = v5;
      _os_log_debug_impl(&dword_19AF50000, v11, OS_LOG_TYPE_DEBUG, "%s %p (%@) assertion = %@, isLastAssertion = %d", (uint8_t *)&v14, 0x30u);
      if (!v5)
        goto LABEL_7;
    }
    else if (!v5)
    {
      goto LABEL_7;
    }
    -[AFPowerAssertionManager _releasePowerAssertion](self, "_releasePowerAssertion");
    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v12 = self->_identifier;
    v14 = 136316162;
    v15 = "-[AFPowerAssertionManager assertionCoordinator:didDeactivateAssertion:isLastAssertion:]";
    v16 = 2048;
    v17 = self;
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = assertionCoordinator;
    v22 = 2112;
    v23 = v8;
    _os_log_error_impl(&dword_19AF50000, v11, OS_LOG_TYPE_ERROR, "%s %p (%@) Expected assertion coordinator is %@, actual assertion coordinator is %@.", (uint8_t *)&v14, 0x34u);
  }
LABEL_7:

}

- (void)_createPowerAssertion
{
  NSObject *v3;
  NSString *identifier;
  NSObject *v5;
  NSString *v6;
  IOPMAssertionID v7;
  NSObject *v8;
  NSString *v9;
  AFWatchdogTimer *v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  id *p_watchdogTimer;
  AFWatchdogTimer *watchdogTimer;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  IOPMAssertionID AssertionID;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  AFPowerAssertionManager *v24;
  __int16 v25;
  NSString *v26;
  __int16 v27;
  IOPMAssertionID v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 136315650;
    v22 = "-[AFPowerAssertionManager _createPowerAssertion]";
    v23 = 2048;
    v24 = self;
    v25 = 2112;
    v26 = identifier;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p (%@)", buf, 0x20u);
  }
  if (!self->_powerAssertion)
  {
    AssertionID = 0;
    if (IOPMAssertionCreateWithName(CFSTR("PreventUserIdleSystemSleep"), 0xFFu, (CFStringRef)self->_identifier, &AssertionID))
    {
      v5 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        v6 = self->_identifier;
        *(_DWORD *)buf = 136315650;
        v22 = "-[AFPowerAssertionManager _createPowerAssertion]";
        v23 = 2048;
        v24 = self;
        v25 = 2112;
        v26 = v6;
        _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s %p (%@) Failed to create power assertion.", buf, 0x20u);
      }
    }
    else
    {
      v7 = AssertionID;
      self->_powerAssertion = AssertionID;
      v8 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v9 = self->_identifier;
        *(_DWORD *)buf = 136315906;
        v22 = "-[AFPowerAssertionManager _createPowerAssertion]";
        v23 = 2048;
        v24 = self;
        v25 = 2112;
        v26 = v9;
        v27 = 1024;
        v28 = v7;
        _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s %p (%@) Created power assertion with ID %u.", buf, 0x26u);
      }
    }
  }
  if (!self->_watchdogTimer)
  {
    objc_initWeak((id *)buf, self);
    v10 = [AFWatchdogTimer alloc];
    queue = self->_queue;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __48__AFPowerAssertionManager__createPowerAssertion__block_invoke;
    v18 = &unk_1E3A35AE0;
    objc_copyWeak(&v19, (id *)buf);
    v12 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:](v10, "initWithTimeoutInterval:onQueue:timeoutHandler:", queue, &v15, 180.0);
    watchdogTimer = self->_watchdogTimer;
    p_watchdogTimer = (id *)&self->_watchdogTimer;
    *p_watchdogTimer = (id)v12;

    objc_msgSend(*p_watchdogTimer, "start", v15, v16, v17, v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_releasePowerAssertion
{
  NSObject *v3;
  NSString *identifier;
  IOPMAssertionID powerAssertion;
  NSObject *v6;
  NSString *v7;
  AFWatchdogTimer *watchdogTimer;
  AFWatchdogTimer *v9;
  int v10;
  const char *v11;
  __int16 v12;
  AFPowerAssertionManager *v13;
  __int16 v14;
  NSString *v15;
  __int16 v16;
  IOPMAssertionID v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    v10 = 136315650;
    v11 = "-[AFPowerAssertionManager _releasePowerAssertion]";
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = identifier;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p (%@)", (uint8_t *)&v10, 0x20u);
  }
  powerAssertion = self->_powerAssertion;
  if (powerAssertion)
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v7 = self->_identifier;
      v10 = 136315906;
      v11 = "-[AFPowerAssertionManager _releasePowerAssertion]";
      v12 = 2048;
      v13 = self;
      v14 = 2112;
      v15 = v7;
      v16 = 1024;
      v17 = powerAssertion;
      _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s %p (%@) Released power assertion ID %u.", (uint8_t *)&v10, 0x26u);
      powerAssertion = self->_powerAssertion;
    }
    IOPMAssertionRelease(powerAssertion);
    self->_powerAssertion = 0;
  }
  watchdogTimer = self->_watchdogTimer;
  if (watchdogTimer)
  {
    -[AFWatchdogTimer cancel](watchdogTimer, "cancel");
    v9 = self->_watchdogTimer;
    self->_watchdogTimer = 0;

  }
}

- (void)_watchdogTimedOut
{
  NSObject *v3;
  unsigned int powerAssertion;
  NSObject *v5;
  NSString *identifier;
  NSString *v7;
  int v8;
  const char *v9;
  __int16 v10;
  AFPowerAssertionManager *v11;
  __int16 v12;
  NSString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    identifier = self->_identifier;
    v8 = 136315906;
    v9 = "-[AFPowerAssertionManager _watchdogTimedOut]";
    v10 = 2048;
    v11 = self;
    v12 = 2112;
    v13 = identifier;
    v14 = 2048;
    v15 = 0x4066800000000000;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s %p (%@) Watchdog timed out after %f seconds.", (uint8_t *)&v8, 0x2Au);
  }
  powerAssertion = self->_powerAssertion;
  if (powerAssertion)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v7 = self->_identifier;
      v8 = 136315906;
      v9 = "-[AFPowerAssertionManager _watchdogTimedOut]";
      v10 = 2048;
      v11 = self;
      v12 = 2112;
      v13 = v7;
      v14 = 1024;
      LODWORD(v15) = powerAssertion;
      _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s %p (%@) Leaked power assertion ID %u.", (uint8_t *)&v8, 0x26u);
    }
    -[AFPowerAssertionManager _reportLeakedPowerAssertion](self, "_reportLeakedPowerAssertion");
  }
}

- (void)_reportLeakedPowerAssertion
{
  NSObject *v3;
  AFSettingsConnection *v4;
  void *v5;
  AFSettingsConnection *v6;
  NSString *identifier;
  int v8;
  const char *v9;
  __int16 v10;
  AFPowerAssertionManager *v11;
  __int16 v12;
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    identifier = self->_identifier;
    v8 = 136315650;
    v9 = "-[AFPowerAssertionManager _reportLeakedPowerAssertion]";
    v10 = 2048;
    v11 = self;
    v12 = 2112;
    v13 = identifier;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s %p (%@)", (uint8_t *)&v8, 0x20u);
  }
  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal)
  {
    v4 = [AFSettingsConnection alloc];
    +[AFInstanceContext defaultContext](AFInstanceContext, "defaultContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[AFSettingsConnection initWithInstanceContext:](v4, "initWithInstanceContext:", v5);

    -[AFSettingsConnection triggerABCForType:subType:context:completionHandler:](v6, "triggerABCForType:subType:context:completionHandler:", CFSTR("power"), CFSTR("leaked_assertion"), 0, &__block_literal_global_4177);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_assertionsByName, 0);
  objc_storeStrong((id *)&self->_assertionCoordinator, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __54__AFPowerAssertionManager__reportLeakedPowerAssertion__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[AFPowerAssertionManager _reportLeakedPowerAssertion]_block_invoke";
      v6 = 2112;
      v7 = v2;
      _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s Unable to trigger ABC due to error %@.", (uint8_t *)&v4, 0x16u);
    }
  }

}

void __48__AFPowerAssertionManager__createPowerAssertion__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_watchdogTimedOut");

}

uint64_t __52__AFPowerAssertionManager_releaseAllPowerAssertions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__AFPowerAssertionManager_releaseAllPowerAssertions__block_invoke_2;
  v7[3] = &unk_1E3A2DB60;
  v7[4] = v2;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_releasePowerAssertion");
}

void __52__AFPowerAssertionManager_releaseAllPowerAssertions__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(v8 + 8);
    v10 = 136316162;
    v11 = "-[AFPowerAssertionManager releaseAllPowerAssertions]_block_invoke_2";
    v12 = 2048;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    _os_log_debug_impl(&dword_19AF50000, v7, OS_LOG_TYPE_DEBUG, "%s %p (%@), name = %@, assertion = %@", (uint8_t *)&v10, 0x34u);
  }
  objc_msgSend(v6, "relinquishWithContext:options:", 0, 0);

}

void __57__AFPowerAssertionManager_releasePowerAssertionWithName___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(v6 + 8);
      v8 = 136315906;
      v9 = "-[AFPowerAssertionManager releasePowerAssertionWithName:]_block_invoke";
      v10 = 2048;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v2;
      _os_log_debug_impl(&dword_19AF50000, v3, OS_LOG_TYPE_DEBUG, "%s %p (%@) assertion = %@", (uint8_t *)&v8, 0x2Au);
    }
    objc_msgSend(v2, "relinquishWithContext:options:", 0, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = 0;

    }
  }

}

void __54__AFPowerAssertionManager_takePowerAssertionWithName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v6 = CFSTR("effectiveName");
  v7[0] = v2;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a2;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInfo:", v5);

}

uint64_t __54__AFPowerAssertionManager_takePowerAssertionWithName___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v8 = a1[4];
    v9 = a1[5];
    v10 = *(_QWORD *)(v8 + 8);
    v11 = 136315906;
    v12 = "-[AFPowerAssertionManager takePowerAssertionWithName:]_block_invoke_2";
    v13 = 2048;
    v14 = v8;
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v9;
    _os_log_debug_impl(&dword_19AF50000, v2, OS_LOG_TYPE_DEBUG, "%s %p (%@) assertion = %@", (uint8_t *)&v11, 0x2Au);
  }
  v3 = *(void **)(a1[4] + 40);
  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = a1[4];
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v3 = *(void **)(a1[4] + 40);
  }
  return objc_msgSend(v3, "setObject:forKey:", a1[5], a1[6]);
}

@end

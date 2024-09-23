@implementation AXUISoftwareKeyboardManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_9);
  return (id)sharedInstance_SoftwareKeyboardManager;
}

void __45__AXUISoftwareKeyboardManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_SoftwareKeyboardManager;
  sharedInstance_SoftwareKeyboardManager = v0;

}

- (AXUISoftwareKeyboardManager)init
{
  AXUISoftwareKeyboardManager *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXUISoftwareKeyboardManager;
  v2 = -[AXUISoftwareKeyboardManager init](&v6, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0D27C98]);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)HardwareKeyboardAvailabilityChanged, v4, 0, (CFNotificationSuspensionBehavior)0);

    -[AXUISoftwareKeyboardManager updateKeyboardHardwareState](v2, "updateKeyboardHardwareState");
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)AXUISoftwareKeyboardManager;
  -[AXUISoftwareKeyboardManager dealloc](&v4, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  -[AXUISoftwareKeyboardManager updateKeyboardHardwareState](self, "updateKeyboardHardwareState");
}

- (void)updateKeyboardHardwareState
{
  id v3;

  -[AXUISoftwareKeyboardManager delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "softwareKeyboardManagerWillUpdateKeyboardState:", self);

}

- (BOOL)isHardwareKeyboardAttached
{
  return GSEventIsHardwareKeyboardAttached() != 0;
}

- (void)_overrideSetHardwareKeyboardAttached:(BOOL)a3
{
  GSEventSetHardwareKeyboardAttached();
}

- (void)_wst_setIsHardwareKeyboardAttached:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  int v11;
  __int16 v12;
  int IsHardwareKeyboardAttached;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VOTLogKeyboard();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10 = 67109376;
    v11 = objc_msgSend(v4, "BOOLValue");
    v12 = 1024;
    IsHardwareKeyboardAttached = GSEventIsHardwareKeyboardAttached();
    _os_log_impl(&dword_1BD892000, v5, OS_LOG_TYPE_INFO, "setting hardware keyboard attached state: %d [existing %d]", (uint8_t *)&v10, 0xEu);
  }

  v6 = objc_msgSend(v4, "BOOLValue");
  -[AXUISoftwareKeyboardManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "softwareKeyboardManager:didSetHardwareKeyboardAttached:", self, v6);

  if (GSEventIsHardwareKeyboardAttached() != (_DWORD)v6)
  {
    -[AXUISoftwareKeyboardManager delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "softwareKeyboardManagerDidChangeHardwareKeyboardAttached:", self);

    GSEventSetHardwareKeyboardAttached();
    VOTLogKeyboard();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 67109120;
      v11 = v6;
      _os_log_impl(&dword_1BD892000, v9, OS_LOG_TYPE_DEFAULT, "Set hardware keyboard attached state: %d", (uint8_t *)&v10, 8u);
    }

  }
}

- (void)_setIsHardwareKeyboardAttached:(BOOL)a3
{
  AXPerformBlockAsynchronouslyOnMainThread();
}

void __62__AXUISoftwareKeyboardManager__setIsHardwareKeyboardAttached___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_wst_setIsHardwareKeyboardAttached:", v2);

}

- (void)_updateHardwareKeyboardState
{
  AXUISoftwareKeyboardManager *v3;
  uint64_t v4;
  void *v5;
  int v6;
  unsigned __int8 v7;

  if (-[NSMutableSet count](self->_reasonsToDisableSoftwareKeyboard, "count"))
  {
    v3 = self;
    v4 = 1;
LABEL_5:
    -[AXUISoftwareKeyboardManager _setIsHardwareKeyboardAttached:](v3, "_setIsHardwareKeyboardAttached:", v4);
    return;
  }
  if (-[NSMutableSet count](self->_reasonsToEnableSoftwareKeyboard, "count"))
  {
    v3 = self;
    v4 = 0;
    goto LABEL_5;
  }
  v7 = 0;
  -[AXUISoftwareKeyboardManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "softwareKeyboardManagerShouldSetHardwareKeyboardAttached:hardwareKeyboardIsCurrentlyAttached:newHardwareKeyboardAttachedValue:", self, GSEventIsHardwareKeyboardAttached() != 0, &v7);

  if (v6)
    -[AXUISoftwareKeyboardManager _setIsHardwareKeyboardAttached:](self, "_setIsHardwareKeyboardAttached:", v7);
}

- (void)addReasonToEnableSoftwareKeyboard:(id)a3
{
  id v4;
  NSMutableSet *reasonsToEnableSoftwareKeyboard;
  NSMutableSet *v6;
  NSMutableSet *v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  reasonsToEnableSoftwareKeyboard = self->_reasonsToEnableSoftwareKeyboard;
  if (!reasonsToEnableSoftwareKeyboard)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_reasonsToEnableSoftwareKeyboard;
    self->_reasonsToEnableSoftwareKeyboard = v6;

    reasonsToEnableSoftwareKeyboard = self->_reasonsToEnableSoftwareKeyboard;
  }
  -[NSMutableSet addObject:](reasonsToEnableSoftwareKeyboard, "addObject:", v4);
  objc_msgSend(MEMORY[0x1E0CF39B0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "ignoreLogging");

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CF39B0], "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v11, v12))
    {
      AXColorizeFormatLog();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v4;
      v16 = -[NSMutableSet count](self->_reasonsToEnableSoftwareKeyboard, "count");
      _AXStringForArgs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v14;
        _os_log_impl(&dword_1BD892000, v11, v12, "%{public}@", buf, 0xCu);
      }

    }
  }
  -[AXUISoftwareKeyboardManager _updateHardwareKeyboardState](self, "_updateHardwareKeyboardState", v15, v16);

}

- (void)removeReasonToEnableSoftwareKeyboard:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableSet removeObject:](self->_reasonsToEnableSoftwareKeyboard, "removeObject:", v4);
  objc_msgSend(MEMORY[0x1E0CF39B0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ignoreLogging");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CF39B0], "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      AXColorizeFormatLog();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v4;
      v13 = -[NSMutableSet count](self->_reasonsToEnableSoftwareKeyboard, "count");
      _AXStringForArgs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v11;
        _os_log_impl(&dword_1BD892000, v8, v9, "%{public}@", buf, 0xCu);
      }

    }
  }
  -[AXUISoftwareKeyboardManager _updateHardwareKeyboardState](self, "_updateHardwareKeyboardState", v12, v13);

}

- (void)addReasonToDisableSoftwareKeyboard:(id)a3
{
  id v4;
  NSMutableSet *reasonsToDisableSoftwareKeyboard;
  NSMutableSet *v6;
  NSMutableSet *v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  reasonsToDisableSoftwareKeyboard = self->_reasonsToDisableSoftwareKeyboard;
  if (!reasonsToDisableSoftwareKeyboard)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_reasonsToDisableSoftwareKeyboard;
    self->_reasonsToDisableSoftwareKeyboard = v6;

    reasonsToDisableSoftwareKeyboard = self->_reasonsToDisableSoftwareKeyboard;
  }
  -[NSMutableSet addObject:](reasonsToDisableSoftwareKeyboard, "addObject:", v4);
  objc_msgSend(MEMORY[0x1E0CF39B0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "ignoreLogging");

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CF39B0], "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v11, v12))
    {
      AXColorizeFormatLog();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v4;
      v16 = -[NSMutableSet count](self->_reasonsToDisableSoftwareKeyboard, "count");
      _AXStringForArgs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v14;
        _os_log_impl(&dword_1BD892000, v11, v12, "%{public}@", buf, 0xCu);
      }

    }
  }
  -[AXUISoftwareKeyboardManager _updateHardwareKeyboardState](self, "_updateHardwareKeyboardState", v15, v16);

}

- (void)removeReasonToDisableSoftwareKeyboard:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableSet removeObject:](self->_reasonsToDisableSoftwareKeyboard, "removeObject:", v4);
  objc_msgSend(MEMORY[0x1E0CF39B0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ignoreLogging");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CF39B0], "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      AXColorizeFormatLog();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v4;
      v13 = -[NSMutableSet count](self->_reasonsToDisableSoftwareKeyboard, "count");
      _AXStringForArgs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v11;
        _os_log_impl(&dword_1BD892000, v8, v9, "%{public}@", buf, 0xCu);
      }

    }
  }
  -[AXUISoftwareKeyboardManager _updateHardwareKeyboardState](self, "_updateHardwareKeyboardState", v12, v13);

}

- (AXUISoftwareKeyboardManagerDelegate)delegate
{
  return (AXUISoftwareKeyboardManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reasonsToEnableSoftwareKeyboard, 0);
  objc_storeStrong((id *)&self->_reasonsToDisableSoftwareKeyboard, 0);
}

@end

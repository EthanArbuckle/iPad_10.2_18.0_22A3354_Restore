@implementation HUCCLockStateHandler

- (HUCCLockStateHandler)initWithDelegate:(id)a3
{
  id v4;
  HUCCLockStateHandler *v5;
  HUCCLockStateHandler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUCCLockStateHandler;
  v5 = -[HUCCLockStateHandler init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_keybagLockStatusNotifyToken = -1;
    -[HUCCLockStateHandler _registerKeybagLockStatusNotifications](v6, "_registerKeybagLockStatusNotifications");
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[HUCCLockStateHandler _unregisterKeybagLockStatusNotifications](self, "_unregisterKeybagLockStatusNotifications");
  v3.receiver = self;
  v3.super_class = (Class)HUCCLockStateHandler;
  -[HUCCLockStateHandler dealloc](&v3, sel_dealloc);
}

- (BOOL)isDeviceUnlocked
{
  NSObject *v2;
  int v3;
  NSObject *v4;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7[0]) = 0;
    _os_log_impl(&dword_230FD4000, v2, OS_LOG_TYPE_DEFAULT, "Checking if device is unlocked", (uint8_t *)v7, 2u);
  }

  v3 = MKBGetDeviceLockState();
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_230FD4000, v4, OS_LOG_TYPE_DEFAULT, "Lock state is %d", (uint8_t *)v7, 8u);
  }

  return !v3 || v3 == 3;
}

- (BOOL)_isAccessAllowedForCurrentLockState
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  uint8_t v10[16];
  uint8_t v11[16];
  uint8_t buf[16];

  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230FD4000, v3, OS_LOG_TYPE_DEFAULT, "Checking if access is allowed for current lock state", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BE4D0B0], "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAccessAllowedWhenLocked");

  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_230FD4000, v7, OS_LOG_TYPE_DEFAULT, "Home manager doesn't care about lock state, returning YES", v11, 2u);
    }

    return 1;
  }
  else
  {
    if (v8)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_230FD4000, v7, OS_LOG_TYPE_DEFAULT, "Home manager does care, checking lock state", v10, 2u);
    }

    return -[HUCCLockStateHandler isDeviceUnlocked](self, "isDeviceUnlocked");
  }
}

- (void)_registerKeybagLockStatusNotifications
{
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  id v6;
  _QWORD handler[4];
  id v8;
  id buf[2];

  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_230FD4000, v3, OS_LOG_TYPE_DEFAULT, "Registering for lock state notifications", (uint8_t *)buf, 2u);
  }

  if (-[HUCCLockStateHandler keybagLockStatusNotifyToken](self, "keybagLockStatusNotifyToken") == -1)
  {
    objc_initWeak(buf, self);
    v4 = (const char *)*MEMORY[0x24BE67240];
    v5 = MEMORY[0x24BDAC9B8];
    v6 = MEMORY[0x24BDAC9B8];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = sub_230FD7160;
    handler[3] = &unk_24FFD58B8;
    objc_copyWeak(&v8, buf);
    notify_register_dispatch(v4, &self->_keybagLockStatusNotifyToken, v5, handler);

    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

- (void)_unregisterKeybagLockStatusNotifications
{
  NSObject *v3;
  uint8_t v4[16];

  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_230FD4000, v3, OS_LOG_TYPE_DEFAULT, "Unregistering lock state notifications", v4, 2u);
  }

  if (-[HUCCLockStateHandler keybagLockStatusNotifyToken](self, "keybagLockStatusNotifyToken") != -1)
  {
    notify_cancel(-[HUCCLockStateHandler keybagLockStatusNotifyToken](self, "keybagLockStatusNotifyToken"));
    -[HUCCLockStateHandler setKeybagLockStatusNotifyToken:](self, "setKeybagLockStatusNotifyToken:", 0xFFFFFFFFLL);
  }
}

- (void)_updateAccessAllowedForLockState
{
  _BOOL8 v3;
  NSObject *v4;
  void *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = -[HUCCLockStateHandler _isAccessAllowedForCurrentLockState](self, "_isAccessAllowedForCurrentLockState");
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_230FD4000, v4, OS_LOG_TYPE_DEFAULT, "Access allowed for current lock state is %d, updating delegate", (uint8_t *)v6, 8u);
  }

  -[HUCCLockStateHandler delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lockStateWasUpdated:", v3);

}

- (int)keybagLockStatusNotifyToken
{
  return self->_keybagLockStatusNotifyToken;
}

- (void)setKeybagLockStatusNotifyToken:(int)a3
{
  self->_keybagLockStatusNotifyToken = a3;
}

- (HUCCLockStateHandlerDelegate)delegate
{
  return (HUCCLockStateHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end

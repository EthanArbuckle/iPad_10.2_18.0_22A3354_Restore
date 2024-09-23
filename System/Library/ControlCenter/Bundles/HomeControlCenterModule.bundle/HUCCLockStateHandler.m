@implementation HUCCLockStateHandler

- (HUCCLockStateHandler)initWithDelegate:(id)a3
{
  id v4;
  HUCCLockStateHandler *v5;
  HUCCLockStateHandler *v6;
  const char *v7;
  uint64_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUCCLockStateHandler;
  v5 = -[HUCCLockStateHandler init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_keybagLockStatusNotifyToken = -1;
    objc_msgSend__registerKeybagLockStatusNotifications(v6, v7, v8);
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend__unregisterKeybagLockStatusNotifications(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)HUCCLockStateHandler;
  -[HUCCLockStateHandler dealloc](&v4, sel_dealloc);
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
    _os_log_impl(&dword_230FDD000, v2, OS_LOG_TYPE_DEFAULT, "Checking if device is unlocked", (uint8_t *)v7, 2u);
  }

  v3 = MKBGetDeviceLockState();
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_230FDD000, v4, OS_LOG_TYPE_DEFAULT, "Lock state is %d", (uint8_t *)v7, 8u);
  }

  return !v3 || v3 == 3;
}

- (BOOL)_isAccessAllowedForCurrentLockState
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  int isAccessAllowedWhenLocked;
  NSObject *v13;
  _BOOL4 v14;
  const char *v16;
  uint64_t v17;
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t buf[16];

  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230FDD000, v3, OS_LOG_TYPE_DEFAULT, "Checking if access is allowed for current lock state", buf, 2u);
  }

  objc_msgSend_sharedDispatcher(MEMORY[0x24BE4D0B0], v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_homeManager(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  isAccessAllowedWhenLocked = objc_msgSend_isAccessAllowedWhenLocked(v9, v10, v11);

  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (isAccessAllowedWhenLocked)
  {
    if (v14)
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_230FDD000, v13, OS_LOG_TYPE_DEFAULT, "Home manager doesn't care about lock state, returning YES", v19, 2u);
    }

    return 1;
  }
  else
  {
    if (v14)
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_230FDD000, v13, OS_LOG_TYPE_DEFAULT, "Home manager does care, checking lock state", v18, 2u);
    }

    return objc_msgSend_isDeviceUnlocked(self, v16, v17);
  }
}

- (void)_registerKeybagLockStatusNotifications
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  id v8;
  _QWORD handler[4];
  id v10;
  id buf[2];

  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_230FDD000, v3, OS_LOG_TYPE_DEFAULT, "Registering for lock state notifications", (uint8_t *)buf, 2u);
  }

  if (objc_msgSend_keybagLockStatusNotifyToken(self, v4, v5) == -1)
  {
    objc_initWeak(buf, self);
    v6 = (const char *)*MEMORY[0x24BE67240];
    v7 = MEMORY[0x24BDAC9B8];
    v8 = MEMORY[0x24BDAC9B8];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = sub_230FE6940;
    handler[3] = &unk_24FFD8410;
    objc_copyWeak(&v10, buf);
    notify_register_dispatch(v6, &self->_keybagLockStatusNotifyToken, v7, handler);

    objc_destroyWeak(&v10);
    objc_destroyWeak(buf);
  }
}

- (void)_unregisterKeybagLockStatusNotifications
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint8_t v10[16];

  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_230FDD000, v3, OS_LOG_TYPE_DEFAULT, "Unregistering lock state notifications", v10, 2u);
  }

  if (objc_msgSend_keybagLockStatusNotifyToken(self, v4, v5) != -1)
  {
    v8 = objc_msgSend_keybagLockStatusNotifyToken(self, v6, v7);
    notify_cancel(v8);
    objc_msgSend_setKeybagLockStatusNotifyToken_(self, v9, 0xFFFFFFFFLL);
  }
}

- (void)_updateAccessAllowedForLockState
{
  uint64_t v2;
  uint64_t isAccessAllowedForCurrentLockState;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  isAccessAllowedForCurrentLockState = objc_msgSend__isAccessAllowedForCurrentLockState(self, a2, v2);
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = isAccessAllowedForCurrentLockState;
    _os_log_impl(&dword_230FDD000, v5, OS_LOG_TYPE_DEFAULT, "Access allowed for current lock state is %d, updating delegate", (uint8_t *)v10, 8u);
  }

  objc_msgSend_delegate(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lockStateWasUpdated_(v8, v9, isAccessAllowedForCurrentLockState);

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

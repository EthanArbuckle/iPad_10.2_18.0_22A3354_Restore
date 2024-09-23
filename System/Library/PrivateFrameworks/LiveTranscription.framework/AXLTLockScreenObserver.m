@implementation AXLTLockScreenObserver

- (AXLTLockScreenObserver)init
{
  AXLTLockScreenObserver *v2;
  AXLTLockScreenObserver *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXLTLockScreenObserver;
  v2 = -[AXLTLockScreenObserver init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AXLTLockScreenObserver _registerScreenNotification](v2, "_registerScreenNotification");
  return v3;
}

- (void)_registerScreenNotification
{
  void (**v3)(_QWORD, _QWORD);
  int *p_notifyLockStateToken;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__AXLTLockScreenObserver__registerScreenNotification__block_invoke;
  v7[3] = &unk_24F8752A8;
  objc_copyWeak(&v8, &location);
  v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x22E3102F8](v7);
  p_notifyLockStateToken = &self->_notifyLockStateToken;
  v5 = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC9B8];
  LODWORD(v5) = notify_register_dispatch("com.apple.springboard.lockstate", p_notifyLockStateToken, v5, v3);

  if ((_DWORD)v5)
    *p_notifyLockStateToken = -1;
  else
    v3[2](v3, *p_notifyLockStateToken);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __53__AXLTLockScreenObserver__registerScreenNotification__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  uint64_t state64;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    state64 = 0;
    notify_get_state(a2, &state64);
    objc_msgSend(WeakRetained, "_updateScreenLock:", state64);
  }

}

- (void)_updateScreenLock:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  _BOOL4 isScreenLocked;
  void *v11;
  void *v12;
  const __CFString *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v3 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x24BDAC8D0];
  AXLogLiveTranscription();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v6;
    _os_log_impl(&dword_22D27A000, v5, OS_LOG_TYPE_INFO, "Updating system lock status: %@", (uint8_t *)&v14, 0xCu);

  }
  if (self->_isScreenLocked != (_DWORD)v3)
  {
    self->_isScreenLocked = (_DWORD)v3 != 0;
    -[AXLTLockScreenObserver delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[AXLTLockScreenObserver delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "screenLockStateChanged:", self->_isScreenLocked);

    }
    isScreenLocked = self->_isScreenLocked;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (isScreenLocked)
      v13 = CFSTR("AXLTScreenLockedNotification");
    else
      v13 = CFSTR("AXLTScreenUnlockedNotification");
    objc_msgSend(v11, "postNotificationName:object:", v13, 0);

  }
}

- (AXLTLockScreenObserverDelegate)delegate
{
  return (AXLTLockScreenObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

@implementation MTSensitiveUIMonitor

+ (id)sharedMonitor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__MTSensitiveUIMonitor_sharedMonitor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedMonitor_onceToken != -1)
    dispatch_once(&sharedMonitor_onceToken, block);
  return (id)sharedMonitor_monitor;
}

void __37__MTSensitiveUIMonitor_sharedMonitor__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedMonitor_monitor;
  sharedMonitor_monitor = (uint64_t)v1;

}

- (BOOL)_isVendorRelease
{
  if (_isVendorRelease_onceToken != -1)
    dispatch_once(&_isVendorRelease_onceToken, &__block_literal_global_25);
  return _isVendorRelease___isVendorRelease;
}

void __40__MTSensitiveUIMonitor__isVendorRelease__block_invoke()
{
  id v0;

  v0 = (id)MGGetStringAnswer();
  _isVendorRelease___isVendorRelease = objc_msgSend(CFSTR("Vendor"), "isEqualToString:", v0);

}

- (MTSensitiveUIMonitor)init
{
  MTSensitiveUIMonitor *v2;
  NSObject *v3;
  uint64_t v4;
  MTObserverStore *observers;
  objc_super v7;
  uint8_t buf[4];
  MTSensitiveUIMonitor *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)MTSensitiveUIMonitor;
  v2 = -[MTSensitiveUIMonitor init](&v7, sel_init);
  if (v2)
  {
    MTLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v9 = v2;
      _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
    }

    v4 = objc_opt_new();
    observers = v2->_observers;
    v2->_observers = (MTObserverStore *)v4;

    v2->_needPrefsUpdate = 1;
    -[MTSensitiveUIMonitor registerForNotifications](v2, "registerForNotifications");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[MTSensitiveUIMonitor unregisterForNotifications](self, "unregisterForNotifications");
  v3.receiver = self;
  v3.super_class = (Class)MTSensitiveUIMonitor;
  -[MTSensitiveUIMonitor dealloc](&v3, sel_dealloc);
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)_handleNotification
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  MTSensitiveUIMonitor *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ sensitiveUIStateChanged", buf, 0xCu);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__MTSensitiveUIMonitor__handleNotification__block_invoke;
  v4[3] = &unk_1E39CB858;
  v4[4] = self;
  -[MTSensitiveUIMonitor _withLock:](self, "_withLock:", v4);
  -[MTObserverStore enumerateObserversWithBlock:](self->_observers, "enumerateObserversWithBlock:", &__block_literal_global_7_2);
}

uint64_t __43__MTSensitiveUIMonitor__handleNotification__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 9) = 1;
  return result;
}

void __43__MTSensitiveUIMonitor__handleNotification__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "sensitiveUIStateChanged");

}

- (BOOL)_hideSensitiveUI
{
  BOOL v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  if (-[MTSensitiveUIMonitor _isVendorRelease](self, "_isVendorRelease"))
    return 1;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__MTSensitiveUIMonitor__hideSensitiveUI__block_invoke;
  v5[3] = &unk_1E39CC370;
  v5[4] = self;
  v5[5] = &v6;
  -[MTSensitiveUIMonitor _withLock:](self, "_withLock:", v5);
  v3 = *((_BYTE *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__MTSensitiveUIMonitor__hideSensitiveUI__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 9))
  {
    *(_BYTE *)(v1 + 8) = 0;
    *(_BYTE *)(*(_QWORD *)(result + 32) + 9) = 0;
    v1 = *(_QWORD *)(result + 32);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(v1 + 8);
  return result;
}

- (void)addSensitiveUIObserver:(id)a3
{
  -[MTObserverStore addObserver:](self->_observers, "addObserver:", a3);
}

- (void)removeSensitiveUIObserver:(id)a3
{
  -[MTObserverStore removeObserver:](self->_observers, "removeObserver:", a3);
}

- (BOOL)shouldHideForSensitivity:(int64_t)a3
{
  return (a3 & 0x8000000000000000) == 0 && -[MTSensitiveUIMonitor _hideSensitiveUI](self, "_hideSensitiveUI");
}

- (MTObserverStore)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (BOOL)hideSensitiveUI
{
  return self->_hideSensitiveUI;
}

- (void)setHideSensitiveUI:(BOOL)a3
{
  self->_hideSensitiveUI = a3;
}

- (BOOL)needPrefsUpdate
{
  return self->_needPrefsUpdate;
}

- (void)setNeedPrefsUpdate:(BOOL)a3
{
  self->_needPrefsUpdate = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end

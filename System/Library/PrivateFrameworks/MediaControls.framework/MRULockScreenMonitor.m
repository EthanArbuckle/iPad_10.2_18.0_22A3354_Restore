@implementation MRULockScreenMonitor

+ (id)sharedMonitor
{
  if (sharedMonitor_onceToken != -1)
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global_24);
  return (id)sharedMonitor_monitor;
}

void __37__MRULockScreenMonitor_sharedMonitor__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[MRULockScreenMonitor _init]([MRULockScreenMonitor alloc], "_init");
  v1 = (void *)sharedMonitor_monitor;
  sharedMonitor_monitor = (uint64_t)v0;

}

- (id)_init
{
  MRULockScreenMonitor *v2;
  uint64_t v3;
  NSHashTable *weakObservers;
  const char *v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MRULockScreenMonitor;
  v2 = -[MRULockScreenMonitor init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    weakObservers = v2->_weakObservers;
    v2->_weakObservers = (NSHashTable *)v3;

    objc_initWeak(&location, v2);
    v5 = (const char *)*MEMORY[0x1E0D4E600];
    v6 = MEMORY[0x1E0C80D38];
    v7 = MEMORY[0x1E0C80D38];
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __29__MRULockScreenMonitor__init__block_invoke;
    v13 = &unk_1E581A290;
    objc_copyWeak(&v14, &location);
    notify_register_dispatch(v5, &v2->_mobileKeyBagLockStatusNotifyToken, v6, &v10);

    v8 = objc_loadWeakRetained(&location);
    objc_msgSend(v8, "updateDeviceLocked", v10, v11, v12, v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __29__MRULockScreenMonitor__init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateDeviceLocked");

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_mobileKeyBagLockStatusNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)MRULockScreenMonitor;
  -[MRULockScreenMonitor dealloc](&v3, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  MRULockScreenMonitor *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](v4->_weakObservers, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)removeObserver:(id)a3
{
  MRULockScreenMonitor *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](v4->_weakObservers, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (NSArray)observers
{
  MRULockScreenMonitor *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NSHashTable allObjects](v2->_weakObservers, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)setDeviceLocked:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_deviceLocked != a3)
  {
    v3 = a3;
    self->_deviceLocked = a3;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[MRULockScreenMonitor observers](self, "observers", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v10, "lockscreenMonitor:didUpdateDeviceLocked:", self, v3);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (void)updateDeviceLocked
{
  _QWORD block[5];

  if (updateDeviceLocked_onceToken != -1)
    dispatch_once(&updateDeviceLocked_onceToken, &__block_literal_global_7_1);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MRULockScreenMonitor_updateDeviceLocked__block_invoke_2;
  block[3] = &unk_1E5818C88;
  block[4] = self;
  dispatch_async((dispatch_queue_t)updateDeviceLocked_queue, block);
}

void __42__MRULockScreenMonitor_updateDeviceLocked__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.mediaremote.MRULockScreenMonitor.lockStateWorkerQueue", v0);
  v2 = (void *)updateDeviceLocked_queue;
  updateDeviceLocked_queue = (uint64_t)v1;

}

void __42__MRULockScreenMonitor_updateDeviceLocked__block_invoke_2(uint64_t a1)
{
  _QWORD v2[5];
  char v3;
  char v4;

  v4 = 0;
  SBSGetScreenLockStatus();
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __42__MRULockScreenMonitor_updateDeviceLocked__block_invoke_3;
  v2[3] = &unk_1E5818D00;
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = 0;
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

uint64_t __42__MRULockScreenMonitor_updateDeviceLocked__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDeviceLocked:", *(_BYTE *)(a1 + 40) != 0);
}

- (BOOL)isDeviceLocked
{
  return self->_deviceLocked;
}

- (int)mobileKeyBagLockStatusNotifyToken
{
  return self->_mobileKeyBagLockStatusNotifyToken;
}

- (void)setMobileKeyBagLockStatusNotifyToken:(int)a3
{
  self->_mobileKeyBagLockStatusNotifyToken = a3;
}

- (NSHashTable)weakObservers
{
  return self->_weakObservers;
}

- (void)setWeakObservers:(id)a3
{
  objc_storeStrong((id *)&self->_weakObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weakObservers, 0);
}

@end

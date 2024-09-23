@implementation BRScreenLockMonitor

+ (id)sharedScreenLockMonitor
{
  if (sharedScreenLockMonitor_onceToken != -1)
    dispatch_once(&sharedScreenLockMonitor_onceToken, &__block_literal_global_22);
  return (id)sharedScreenLockMonitor_monitor;
}

void __46__BRScreenLockMonitor_sharedScreenLockMonitor__block_invoke()
{
  BRScreenLockMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(BRScreenLockMonitor);
  v1 = (void *)sharedScreenLockMonitor_monitor;
  sharedScreenLockMonitor_monitor = (uint64_t)v0;

}

- (BRScreenLockMonitor)init
{
  BRScreenLockMonitor *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *notificationQueue;
  const char *v7;
  NSObject *v8;
  BRScreenLockMonitor *v9;
  uint32_t v10;
  int v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSHashTable *screenLockObservers;
  _QWORD handler[4];
  BRScreenLockMonitor *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)BRScreenLockMonitor;
  v2 = -[BRScreenLockMonitor init](&v19, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.br.screen-lock-monitor", v4);

    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v5;

    v2->_screenLockedUnlockedNotifyToken = -1;
    v7 = (const char *)objc_msgSend(CFSTR("com.apple.springboard.lockstate"), "UTF8String");
    v8 = v2->_notificationQueue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __27__BRScreenLockMonitor_init__block_invoke;
    handler[3] = &unk_1E3DA65F0;
    v9 = v2;
    v18 = v9;
    v10 = notify_register_dispatch(v7, &v2->_screenLockedUnlockedNotifyToken, v8, handler);
    if (v10)
    {
      v11 = v10;
      brc_bread_crumbs((uint64_t)"-[BRScreenLockMonitor init]", 66);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
        -[BRScreenLockMonitor init].cold.1((uint64_t)v12, v11, v13);

    }
    v9->_screenLocked = -[BRScreenLockMonitor _getScreenLockedStateFromToken](v9, "_getScreenLockedStateFromToken");
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v14 = objc_claimAutoreleasedReturnValue();
    screenLockObservers = v9->_screenLockObservers;
    v9->_screenLockObservers = (NSHashTable *)v14;

  }
  return v2;
}

uint64_t __27__BRScreenLockMonitor_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setScreenLocked:", objc_msgSend(*(id *)(a1 + 32), "_getScreenLockedStateFromToken"));
}

- (BOOL)_getScreenLockedStateFromToken
{
  void *v2;
  NSObject *v3;
  uint64_t v5;

  v5 = 0;
  if (brc_notify_get_state(self->_screenLockedUnlockedNotifyToken, &v5, objc_msgSend(CFSTR("com.apple.springboard.lockstate"), "UTF8String")))
  {
    brc_bread_crumbs((uint64_t)"-[BRScreenLockMonitor _getScreenLockedStateFromToken]", 111);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, (os_log_type_t)0x90u))
      -[BRScreenLockMonitor _getScreenLockedStateFromToken].cold.1((uint64_t)v2, v3);

  }
  return v5 != 0;
}

- (void)_invalidateScreenLockManager
{
  void *v3;
  NSObject *v4;
  int screenLockedUnlockedNotifyToken;
  NSHashTable *screenLockObservers;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs((uint64_t)"-[BRScreenLockMonitor _invalidateScreenLockManager]", 124);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = objc_msgSend(CFSTR("com.apple.springboard.lockstate"), "UTF8String");
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_19CBF0000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] Unregister for %s%@", (uint8_t *)&v7, 0x16u);
  }

  screenLockedUnlockedNotifyToken = self->_screenLockedUnlockedNotifyToken;
  if (screenLockedUnlockedNotifyToken != -1)
  {
    notify_cancel(screenLockedUnlockedNotifyToken);
    self->_screenLockedUnlockedNotifyToken = -1;
  }
  screenLockObservers = self->_screenLockObservers;
  self->_screenLockObservers = 0;

}

- (void)_setScreenLocked:(BOOL)a3
{
  void (**v4)(_QWORD);
  _QWORD v5[5];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__BRScreenLockMonitor__setScreenLocked___block_invoke;
  v5[3] = &unk_1E3DA59E8;
  v5[4] = self;
  v6 = a3;
  v4 = (void (**)(_QWORD))MEMORY[0x1A1AD85E4](v5, a2);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationQueue);
  v4[2](v4);

}

void __40__BRScreenLockMonitor__setScreenLocked___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 20) != v2)
  {
    *(_BYTE *)(v1 + 20) = v2;
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "screenLockChanged:", *(unsigned __int8 *)(a1 + 40), (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *notificationQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__BRScreenLockMonitor_addObserver___block_invoke;
  block[3] = &unk_1E3DA4A70;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(notificationQueue, block);

}

uint64_t __35__BRScreenLockMonitor_addObserver___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "screenLockChanged:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 20));
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *notificationQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__BRScreenLockMonitor_removeObserver___block_invoke;
  block[3] = &unk_1E3DA4A70;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(notificationQueue, block);

}

uint64_t __38__BRScreenLockMonitor_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (int)screenLockedUnlockedNotifyToken
{
  return self->_screenLockedUnlockedNotifyToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenLockObservers, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

- (void)init
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_19CBF0000, log, (os_log_type_t)0x90u, "[ERROR] can't register to screen lock/unlock changes. error: %d%@", (uint8_t *)v3, 0x12u);
}

- (void)_getScreenLockedStateFromToken
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19CBF0000, a2, (os_log_type_t)0x90u, "[ERROR] Failed to query whether screen is locked%@", (uint8_t *)&v2, 0xCu);
}

@end

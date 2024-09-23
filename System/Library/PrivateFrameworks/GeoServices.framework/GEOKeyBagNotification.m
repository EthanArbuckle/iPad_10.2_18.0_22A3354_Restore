@implementation GEOKeyBagNotification

+ (GEOKeyBagNotification)sharedObject
{
  if (qword_1ECDBBCC8 != -1)
    dispatch_once(&qword_1ECDBBCC8, &__block_literal_global_59);
  return (GEOKeyBagNotification *)(id)_MergedGlobals_215;
}

void __37__GEOKeyBagNotification_sharedObject__block_invoke()
{
  GEOKeyBagNotification *v0;
  void *v1;

  v0 = objc_alloc_init(GEOKeyBagNotification);
  v1 = (void *)_MergedGlobals_215;
  _MergedGlobals_215 = (uint64_t)v0;

}

- (GEOKeyBagNotification)init
{
  GEOKeyBagNotification *v2;
  GEOKeyBagNotification *v3;
  int *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  _QWORD v11[5];
  _QWORD handler[5];
  _QWORD v13[5];
  int *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)GEOKeyBagNotification;
  v2 = -[GEOKeyBagNotification init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    -[GEOKeyBagNotification updateState](v2, "updateState");
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3032000000;
    v13[3] = __Block_byref_object_copy__29;
    v13[4] = __Block_byref_object_dispose__29;
    v4 = v3;
    v14 = v4;
    v5 = MEMORY[0x1E0C80D38];
    v6 = MEMORY[0x1E0C80D38];
    v7 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __29__GEOKeyBagNotification_init__block_invoke;
    handler[3] = &unk_1E1C07D18;
    handler[4] = v13;
    notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", v4 + 3, v5, handler);
    v8 = MEMORY[0x1E0C80D38];

    v9 = (const char *)*MEMORY[0x1E0D4E600];
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __29__GEOKeyBagNotification_init__block_invoke_10;
    v11[3] = &unk_1E1C07D18;
    v11[4] = v13;
    notify_register_dispatch(v9, v4 + 4, v8, v11);

    _Block_object_dispose(v13, 8);
  }
  return v3;
}

uint64_t __29__GEOKeyBagNotification_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  GEOGetKeyBagLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "kMobileKeyBagFirstUnlockNotificationID", v4, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_statusChangedBeforeFirstUnlock");
}

uint64_t __29__GEOKeyBagNotification_init__block_invoke_10(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  GEOGetKeyBagLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "kMobileKeyBagLockStatusNotifyToken", v4, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_statusChangedAfterFirstUnlock");
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_notifyTokenAfterFirstUnlock);
  notify_cancel(self->_notifyTokenBeforeFirstUnlock);
  v3.receiver = self;
  v3.super_class = (Class)GEOKeyBagNotification;
  -[GEOKeyBagNotification dealloc](&v3, sel_dealloc);
}

- (void)_statusChangedBeforeFirstUnlock
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  -[GEOKeyBagNotification updateState](self, "updateState");
  GEOGetKeyBagLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "State changed, posting first-unlock notification", v5, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("GEODeviceFirstUnlockedNotification"), self, 0);

}

- (void)_statusChangedAfterFirstUnlock
{
  int v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = -[GEOKeyBagNotification state](self, "state");
  -[GEOKeyBagNotification updateState](self, "updateState");
  v4 = -[GEOKeyBagNotification state](self, "state");
  if (v3 != v4)
  {
    if (v4 == 2)
    {
      GEOGetKeyBagLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_DEBUG, "State changed, posting locked notification", v12, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("GEODeviceLockedNotification");
    }
    else if (v4 == 1)
    {
      GEOGetKeyBagLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "State changed, posting locking notification", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("GEODeviceLockingNotification");
    }
    else
    {
      GEOGetKeyBagLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_DEBUG, "State changed, posting unlocked notification", v11, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("GEODeviceUnlockedNotification");
    }
    objc_msgSend(v6, "postNotificationName:object:userInfo:", v8, self, 0);

  }
}

+ (BOOL)canAccessFilesWithProtection:(unint64_t)a3
{
  unint64_t v3;
  void *v4;

  if (!a3)
    return 1;
  v3 = a3;
  objc_msgSend(a1, "sharedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "canAccessFilesWithProtection:", v3);

  return v3;
}

- (BOOL)canAccessFilesWithProtection:(unint64_t)a3
{
  int v4;

  if (a3)
  {
    if (a3 != 3 || (v4 = MKBDeviceUnlockedSinceBoot(), v4 != 1))
      LOBYTE(v4) = -[GEOKeyBagNotification state](self, "state") == 0;
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (BOOL)addDataDidBecomeAvailableAfterFirstUnlockObserver:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v14[4];
  id v15;
  uint8_t *v16;
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t v23[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[GEOKeyBagNotification canAccessFilesWithProtection:](self, "canAccessFilesWithProtection:", 3))
  {
    GEOGetKeyBagLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "Already unlocked.", buf, 2u);
    }

    v6 = 0;
  }
  else
  {
    *(_QWORD *)buf = 0;
    v18 = buf;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__29;
    v21 = __Block_byref_object_dispose__29;
    v22 = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __75__GEOKeyBagNotification_addDataDidBecomeAvailableAfterFirstUnlockObserver___block_invoke;
    v14[3] = &unk_1E1C07D40;
    v16 = buf;
    v8 = v4;
    v15 = v8;
    objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", CFSTR("GEODeviceFirstUnlockedNotification"), self, 0, v14);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v18 + 5);
    *((_QWORD *)v18 + 5) = v9;

    v11 = *((_QWORD *)v18 + 5);
    v6 = v11 != 0;
    if (v11)
    {
      GEOGetKeyBagLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v23 = 134217984;
        v24 = v8;
        _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_DEBUG, "Added observer %p", v23, 0xCu);
      }

    }
    _Block_object_dispose(buf, 8);

  }
  return v6;
}

void __75__GEOKeyBagNotification_addDataDidBecomeAvailableAfterFirstUnlockObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

    GEOGetKeyBagLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v15 = v8;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "Calling observer %p", buf, 0xCu);
    }

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__GEOKeyBagNotification_addDataDidBecomeAvailableAfterFirstUnlockObserver___block_invoke_14;
    v11[3] = &unk_1E1C00738;
    v12 = *(id *)(a1 + 32);
    v13 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

    v9 = v12;
  }
  else
  {
    GEOGetKeyBagLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v15 = v10;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "NOT calling observer %p. The token is nil?!", buf, 0xCu);
    }
  }

}

uint64_t __75__GEOKeyBagNotification_addDataDidBecomeAvailableAfterFirstUnlockObserver___block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "protectedDataDidBecomeAvailable:", *(_QWORD *)(a1 + 40));
}

- (void)runAfterFirstUnlock:(id)a3 block:(id)a4
{
  NSObject *global_queue;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  uint8_t *v19;
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD block[4];
  id v27;
  uint8_t v28[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  global_queue = a3;
  v7 = a4;
  if (!global_queue)
    global_queue = geo_get_global_queue();
  if (-[GEOKeyBagNotification canAccessFilesWithProtection:](self, "canAccessFilesWithProtection:", 3))
  {
    GEOGetKeyBagLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEBUG, "Already unlocked.", buf, 2u);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__GEOKeyBagNotification_runAfterFirstUnlock_block___block_invoke;
    block[3] = &unk_1E1C01F48;
    v9 = v7;
    v27 = v9;
    dispatch_async(global_queue, block);

  }
  else
  {
    v10 = (void *)objc_msgSend(v7, "copy");

    *(_QWORD *)buf = 0;
    v21 = buf;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__29;
    v24 = __Block_byref_object_dispose__29;
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __51__GEOKeyBagNotification_runAfterFirstUnlock_block___block_invoke_2;
    v16[3] = &unk_1E1C07D68;
    v19 = buf;
    v9 = v10;
    v18 = v9;
    v17 = global_queue;
    objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", CFSTR("GEODeviceFirstUnlockedNotification"), self, 0, v16);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v21 + 5);
    *((_QWORD *)v21 + 5) = v12;

    if (*((_QWORD *)v21 + 5))
    {
      GEOGetKeyBagLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v15 = (void *)MEMORY[0x18D765024](v9);
        *(_DWORD *)v28 = 134217984;
        v29 = v15;
        _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_DEBUG, "Added block observer: %p", v28, 0xCu);

      }
    }
    _Block_object_dispose(buf, 8);

  }
}

uint64_t __51__GEOKeyBagNotification_runAfterFirstUnlock_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__GEOKeyBagNotification_runAfterFirstUnlock_block___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  _QWORD block[4];
  NSObject *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  if (v3)
  {
    *(_QWORD *)(v2 + 40) = 0;

    GEOGetKeyBagLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = (void *)MEMORY[0x18D765024](*(_QWORD *)(a1 + 40));
      *(_DWORD *)buf = 134217984;
      v12 = v5;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "Calling block observer: %p", buf, 0xCu);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__GEOKeyBagNotification_runAfterFirstUnlock_block___block_invoke_16;
    block[3] = &unk_1E1C01F48;
    v6 = *(NSObject **)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    dispatch_async(v6, block);
    v7 = v10;
  }
  else
  {
    GEOGetKeyBagLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)MEMORY[0x18D765024](*(_QWORD *)(a1 + 40));
      *(_DWORD *)buf = 134217984;
      v12 = v8;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_ERROR, "NOT calling block observer %p. The token is nil?!", buf, 0xCu);

    }
  }

}

uint64_t __51__GEOKeyBagNotification_runAfterFirstUnlock_block___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int)state
{
  return self->_currentState;
}

- (void)updateState
{
  int v3;
  unsigned int v4;
  int v5;
  int *p_currentState;
  int currentState;
  unsigned int v8;

  v3 = MKBGetDeviceLockState();
  v4 = 2 * (v3 == 1);
  if (v3 == 2)
    v4 = 1;
  currentState = self->_currentState;
  p_currentState = &self->_currentState;
  v5 = currentState;
  while (1)
  {
    v8 = __ldaxr((unsigned int *)p_currentState);
    if (v8 != v5)
      break;
    if (!__stlxr(v4, (unsigned int *)p_currentState))
      return;
  }
  __clrex();
}

@end

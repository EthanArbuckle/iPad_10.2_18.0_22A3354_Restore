@implementation _DKDataProtectionMonitor

- (uint64_t)isDataAvailableFor:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (*(_BYTE *)(a1 + 16))
    {
      v10 = 0;
      v11 = &v10;
      v12 = 0x2020000000;
      v13 = 0;
      v5 = *(NSObject **)(a1 + 32);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __47___DKDataProtectionMonitor_isDataAvailableFor___block_invoke;
      block[3] = &unk_1E26E47A8;
      block[4] = a1;
      v8 = v3;
      v9 = &v10;
      dispatch_sync(v5, block);
      a1 = *((_BYTE *)v11 + 24) != 0;

      _Block_object_dispose(&v10, 8);
    }
    else
    {
      a1 = 1;
    }
  }

  return a1;
}

- (id)registerStateChangeHandler:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  _QWORD block[5];
  id v12;
  id v13;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55___DKDataProtectionMonitor_registerStateChangeHandler___block_invoke;
    block[3] = &unk_1E26E4248;
    block[4] = a1;
    v8 = v6;
    v12 = v8;
    v13 = v4;
    dispatch_sync(v7, block);
    v9 = v13;
    v5 = v8;

  }
  return v5;
}

+ (id)sharedInstance
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42___DKDataProtectionMonitor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, block);
  return (id)sharedInstance_instance_1;
}

- (void)deregisterStateChangeHandler:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(NSObject **)(a1 + 32);
    block[1] = 3221225472;
    block[2] = __57___DKDataProtectionMonitor_deregisterStateChangeHandler___block_invoke;
    block[3] = &unk_1E26E3250;
    block[4] = a1;
    v5 = v3;
    block[0] = MEMORY[0x1E0C809B0];
    v7 = v3;
    dispatch_sync(v4, block);

    v3 = v5;
  }

}

- (_DKDataProtectionMonitor)init
{
  _DKDataProtectionMonitor *v2;
  uint64_t v3;
  NSMutableDictionary *handlers;
  uint64_t v5;
  NSMutableDictionary *availableState;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *stateQueue;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  int v19;
  _BOOL8 v20;
  void *v21;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *notifyQueue;
  NSObject *v25;
  _QWORD v27[4];
  id v28;
  id location;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)_DKDataProtectionMonitor;
  v2 = -[_DKDataProtectionMonitor init](&v30, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    availableState = v2->_availableState;
    v2->_availableState = (NSMutableDictionary *)v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.coreduet.dp.state", v7);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v8;

    v2->_deviceFormatedForContentProtection = 0;
    v10 = *MEMORY[0x1E0CB2AB0];
    v11 = MEMORY[0x1E0C9AAB0];
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_availableState, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CB2AB0]);
    v12 = *MEMORY[0x1E0CB2AC0];
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_availableState, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CB2AC0]);
    v13 = *MEMORY[0x1E0CB2AE0];
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_availableState, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CB2AE0]);
    v14 = slMKBDeviceFormattedForContentProtection();
    v2->_deviceFormatedForContentProtection = v14 != 0;
    if (v14)
    {
      v15 = (void *)MEMORY[0x1E0CB37E8];
      v16 = !-[_DKDataProtectionMonitor deviceIsLocked]((uint64_t)v2)
         || !-[_DKDataProtectionMonitor deviceIsPasswordConfigured]((uint64_t)v2);
      objc_msgSend(v15, "numberWithBool:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_availableState, "setObject:forKeyedSubscript:", v17, v10);

      v18 = (void *)MEMORY[0x1E0CB37E8];
      v19 = slMKBDeviceUnlockedSinceBoot();
      v20 = 1;
      if (!v19)
        v20 = !-[_DKDataProtectionMonitor deviceIsPasswordConfigured]((uint64_t)v2);
      objc_msgSend(v18, "numberWithBool:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_availableState, "setObject:forKeyedSubscript:", v21, v12);

      -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_availableState, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v13);
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = dispatch_queue_create("com.apple.coreduet.dp.notify", v22);
      notifyQueue = v2->_notifyQueue;
      v2->_notifyQueue = (OS_dispatch_queue *)v23;

      v2->_notifyToken = 0;
      v2->_notifyEnabled = 1;
      objc_initWeak(&location, v2);
      v25 = v2->_notifyQueue;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __32___DKDataProtectionMonitor_init__block_invoke;
      v27[3] = &unk_1E26E4DC0;
      objc_copyWeak(&v28, &location);
      notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &v2->_notifyToken, v25, v27);
      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
  }
  return v2;
}

- (uint64_t)isDataAvailableForClassA
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    return !-[_DKDataProtectionMonitor deviceIsLocked](result)
        || !-[_DKDataProtectionMonitor deviceIsPasswordConfigured](v1);
  }
  return result;
}

- (BOOL)isDataAvailableForClassC
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    return slMKBDeviceUnlockedSinceBoot() || !-[_DKDataProtectionMonitor deviceIsPasswordConfigured](v1);
  }
  return result;
}

- (void)handleKeyBagLockNotification
{
  NSObject *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD block[8];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  os_activity_scope_state_s state;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = _os_activity_create(&dword_18DDBE000, "Duet: _DKDataProtectionMonitor handleKeyBagLockNotification", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v2, &state);
    os_activity_scope_leave(&state);

    state.opaque[0] = 0;
    state.opaque[1] = (uint64_t)&state;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__26;
    v37 = __Block_byref_object_dispose__26;
    v38 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__26;
    v32 = __Block_byref_object_dispose__26;
    v33 = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__26;
    v26 = __Block_byref_object_dispose__26;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v3 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56___DKDataProtectionMonitor_handleKeyBagLockNotification__block_invoke;
    block[3] = &unk_1E26E6CE8;
    block[4] = a1;
    block[5] = &state;
    block[6] = &v28;
    block[7] = &v22;
    dispatch_sync(v3, block);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v4 = (id)v23[5];
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v40, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v18;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v18 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend((id)v23[5], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v7));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "BOOLValue");

          v15 = 0u;
          v16 = 0u;
          v13 = 0u;
          v14 = 0u;
          v9 = (id)v29[5];
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v39, 16);
          if (v10)
          {
            v11 = *(_QWORD *)v14;
            do
            {
              v12 = 0;
              do
              {
                if (*(_QWORD *)v14 != v11)
                  objc_enumerationMutation(v9);
                (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++) + 16))();
              }
              while (v10 != v12);
              v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v39, 16);
            }
            while (v10);
          }

          ++v7;
        }
        while (v7 != v5);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v40, 16);
      }
      while (v5);
    }

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v28, 8);

    _Block_object_dispose(&state, 8);
  }
}

- (void)dealloc
{
  NSObject *stateQueue;
  objc_super v4;
  _QWORD block[5];

  if (self->_notifyEnabled)
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35___DKDataProtectionMonitor_dealloc__block_invoke;
    block[3] = &unk_1E26E2F20;
    block[4] = self;
    dispatch_sync(stateQueue, block);
  }
  v4.receiver = self;
  v4.super_class = (Class)_DKDataProtectionMonitor;
  -[_DKDataProtectionMonitor dealloc](&v4, sel_dealloc);
}

- (BOOL)deviceIsPasswordConfigured
{
  const void *v1;
  _BOOL8 v2;

  if (!a1)
    return 0;
  v1 = (const void *)slMGCopyAnswer((uint64_t)CFSTR("PasswordConfigured"), 0);
  v2 = v1 == (const void *)*MEMORY[0x1E0C9AE50];
  if (v1)
    CFRelease(v1);
  return v2;
}

- (BOOL)deviceIsLocked
{
  const void *v1;
  _BOOL8 v2;

  if (!a1)
    return 0;
  v1 = (const void *)slMGCopyAnswer((uint64_t)CFSTR("PasswordProtected"), 0);
  v2 = v1 == (const void *)*MEMORY[0x1E0C9AE50];
  if (v1)
    CFRelease(v1);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_availableState, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
}

@end

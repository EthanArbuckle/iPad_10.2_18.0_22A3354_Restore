@implementation _DPDataProtectionMaster

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41___DPDataProtectionMaster_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, block);
  return (id)sharedInstance_sharedInstance_0;
}

- (_DPDataProtectionMaster)init
{
  _DPDataProtectionMaster *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *stateQueue;
  void *v6;
  uint64_t v7;
  NSMutableDictionary *handlers;
  uint64_t v9;
  NSMutableDictionary *availableState;
  NSMutableDictionary *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *v16;
  void *v17;
  int v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  NSMutableDictionary *v24;
  void *v25;
  NSObject *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *notifyQueue;
  NSObject *v29;
  _QWORD v31[4];
  id v32;
  id location;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)_DPDataProtectionMaster;
  v2 = -[_DPDataProtectionMaster init](&v34, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.DifferentialPrivacy.DataProtection.state", v3);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v4;

    v2->_deviceFormatedForContentProtection = 0;
    v6 = (void *)MEMORY[0x1E0C9AA70];
    v7 = objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableDictionary *)v7;

    v9 = objc_msgSend(v6, "mutableCopy");
    availableState = v2->_availableState;
    v2->_availableState = (NSMutableDictionary *)v9;

    v11 = v2->_availableState;
    +[_DPDataProtectionStateMonitor dataProtectionClassA](_DPDataProtectionStateMonitor, "dataProtectionClassA");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v12);

    v13 = v2->_availableState;
    +[_DPDataProtectionStateMonitor dataProtectionClassC](_DPDataProtectionStateMonitor, "dataProtectionClassC");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C9AAB0];
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v14);

    v16 = v2->_availableState;
    +[_DPDataProtectionStateMonitor dataProtectionClassD](_DPDataProtectionStateMonitor, "dataProtectionClassD");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v15, v17);

    v18 = MKBDeviceFormattedForContentProtection();
    v2->_deviceFormatedForContentProtection = v18 == 1;
    if (v18 == 1)
    {
      v19 = v2->_availableState;
      +[_DPDataProtectionStateMonitor dataProtectionClassA](_DPDataProtectionStateMonitor, "dataProtectionClassA");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v20);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_DPDataProtectionMaster isDataAvailableForClassC](v2, "isDataAvailableForClassC"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v2->_availableState;
      +[_DPDataProtectionStateMonitor dataProtectionClassC](_DPDataProtectionStateMonitor, "dataProtectionClassC");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v21, v23);

      v24 = v2->_availableState;
      +[_DPDataProtectionStateMonitor dataProtectionClassD](_DPDataProtectionStateMonitor, "dataProtectionClassD");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v25);

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = dispatch_queue_create("com.apple.DifferentialPrivacy.DataProtection.notify", v26);
      notifyQueue = v2->_notifyQueue;
      v2->_notifyQueue = (OS_dispatch_queue *)v27;

      v2->_notifyToken = 0;
      objc_initWeak(&location, v2);
      v29 = v2->_notifyQueue;
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __31___DPDataProtectionMaster_init__block_invoke;
      v31[3] = &unk_1E95D9BA0;
      objc_copyWeak(&v32, &location);
      notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &v2->_notifyToken, v29, v31);
      v2->_notifyEnabled = 1;
      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
    }
  }
  return v2;
}

- (void)dealloc
{
  int notifyToken;
  NSObject *stateQueue;
  objc_super v5;
  _QWORD block[4];
  int v7;

  if (self->_notifyEnabled)
  {
    notifyToken = self->_notifyToken;
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34___DPDataProtectionMaster_dealloc__block_invoke;
    block[3] = &__block_descriptor_36_e5_v8__0l;
    v7 = notifyToken;
    dispatch_sync(stateQueue, block);
  }
  v5.receiver = self;
  v5.super_class = (Class)_DPDataProtectionMaster;
  -[_DPDataProtectionMaster dealloc](&v5, sel_dealloc);
}

- (void)handleKeyBagLockNotification
{
  NSObject *stateQueue;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  id v26;
  _QWORD *v27;
  _QWORD block[7];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[5];
  id v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__7;
  v35[4] = __Block_byref_object_dispose__7;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__7;
  v33 = __Block_byref_object_dispose__7;
  v34 = 0;
  stateQueue = self->_stateQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55___DPDataProtectionMaster_handleKeyBagLockNotification__block_invoke;
  block[3] = &unk_1E95D9BE8;
  block[4] = self;
  block[5] = v35;
  block[6] = &v29;
  dispatch_sync(stateQueue, block);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v6 = self->_stateQueue;
  v25[0] = v4;
  v25[1] = 3221225472;
  v25[2] = __55___DPDataProtectionMaster_handleKeyBagLockNotification__block_invoke_2;
  v25[3] = &unk_1E95D9C10;
  v27 = v35;
  v25[4] = self;
  v7 = v5;
  v26 = v7;
  dispatch_sync(v6, v25);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v38, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "BOOLValue");

        v19 = 0u;
        v20 = 0u;
        v17 = 0u;
        v18 = 0u;
        v13 = (id)v30[5];
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v37, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v18;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v18 != v15)
                objc_enumerationMutation(v13);
              (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++) + 16))();
            }
            while (v14 != v16);
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v37, 16);
          }
          while (v14);
        }

        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v38, 16);
    }
    while (v9);
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v35, 8);

}

- (BOOL)deviceHasBeenUnlockedSinceBoot
{
  return MKBDeviceUnlockedSinceBoot() == 1;
}

- (BOOL)deviceIsPasswordConfigured
{
  const void *v2;
  const void *v3;
  const void *v4;

  v2 = (const void *)MGCopyAnswer();
  v3 = v2;
  v4 = (const void *)*MEMORY[0x1E0C9AE50];
  if (v2)
    CFRelease(v2);
  return v3 == v4;
}

- (BOOL)deviceIsLocked
{
  const void *v2;
  const void *v3;
  const void *v4;

  v2 = (const void *)MGCopyAnswer();
  v3 = v2;
  v4 = (const void *)*MEMORY[0x1E0C9AE50];
  if (v2)
    CFRelease(v2);
  return v3 == v4;
}

- (BOOL)isDataAvailableForClassC
{
  if (-[_DPDataProtectionMaster deviceHasBeenUnlockedSinceBoot](self, "deviceHasBeenUnlockedSinceBoot"))
    return 1;
  else
    return !-[_DPDataProtectionMaster deviceIsPasswordConfigured](self, "deviceIsPasswordConfigured");
}

- (BOOL)isDataAvailableForClassA
{
  if (-[_DPDataProtectionMaster deviceIsLocked](self, "deviceIsLocked"))
    return !-[_DPDataProtectionMaster deviceIsPasswordConfigured](self, "deviceIsPasswordConfigured");
  else
    return 1;
}

- (BOOL)isDataAvailableFor:(id)a3
{
  id v4;
  void *v5;
  NSObject *stateQueue;
  BOOL v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v5 = v4;
  if (self->_deviceFormatedForContentProtection)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46___DPDataProtectionMaster_isDataAvailableFor___block_invoke;
    block[3] = &unk_1E95D9C38;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(stateQueue, block);
    v7 = *((_BYTE *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)registerStateChangeHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *stateQueue;
  id v7;
  void *v8;
  id v9;
  _QWORD block[5];
  id v12;
  id v13;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54___DPDataProtectionMaster_registerStateChangeHandler___block_invoke;
    block[3] = &unk_1E95D9C60;
    block[4] = self;
    v7 = v5;
    v12 = v7;
    v13 = v4;
    dispatch_sync(stateQueue, block);
    v8 = v13;
    v9 = v7;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)deregisterStateChangeHandler:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56___DPDataProtectionMaster_deregisterStateChangeHandler___block_invoke;
  block[3] = &unk_1E95D9470;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (BOOL)deviceFormatedForContentProtection
{
  return self->_deviceFormatedForContentProtection;
}

- (NSMutableDictionary)handlers
{
  return self->_handlers;
}

- (NSMutableDictionary)availableState
{
  return self->_availableState;
}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (BOOL)notifyEnabled
{
  return self->_notifyEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_availableState, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
}

@end

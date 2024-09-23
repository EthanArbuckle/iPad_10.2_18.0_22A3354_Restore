@implementation _OSDataProtectionManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42___OSDataProtectionManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedInstance;
}

- (_OSDataProtectionManager)init
{
  _OSDataProtectionManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *stateQueue;
  uint64_t v5;
  NSMutableDictionary *handlers;
  uint64_t v7;
  NSMutableDictionary *availableState;
  NSMutableDictionary *v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  int v16;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  NSMutableDictionary *v21;
  void *v22;
  NSMutableDictionary *v23;
  void *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *notifyQueue;
  NSObject *v27;
  _QWORD v29[4];
  id v30;
  id location;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)_OSDataProtectionManager;
  v2 = -[_OSDataProtectionManager init](&v32, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.DuetActivityScheduler.DataProtection.state", 0);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v3;

    v2->_deviceFormatedForContentProtection = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    availableState = v2->_availableState;
    v2->_availableState = (NSMutableDictionary *)v7;

    v9 = v2->_availableState;
    +[_OSDataProtectionStateMonitor dataProtectionClassA](_OSDataProtectionStateMonitor, "dataProtectionClassA");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDBD1C8];
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v10);

    v12 = v2->_availableState;
    +[_OSDataProtectionStateMonitor dataProtectionClassC](_OSDataProtectionStateMonitor, "dataProtectionClassC");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, v13);

    v14 = v2->_availableState;
    +[_OSDataProtectionStateMonitor dataProtectionClassD](_OSDataProtectionStateMonitor, "dataProtectionClassD");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v11, v15);

    v16 = MKBDeviceFormattedForContentProtection();
    v2->_deviceFormatedForContentProtection = v16 != 0;
    if (v16)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[_OSDataProtectionManager isDataAvailableForClassA](v2, "isDataAvailableForClassA"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v2->_availableState;
      +[_OSDataProtectionStateMonitor dataProtectionClassA](_OSDataProtectionStateMonitor, "dataProtectionClassA");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v17, v19);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[_OSDataProtectionManager isDataAvailableForClassC](v2, "isDataAvailableForClassC"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v2->_availableState;
      +[_OSDataProtectionStateMonitor dataProtectionClassC](_OSDataProtectionStateMonitor, "dataProtectionClassC");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v20, v22);

      v23 = v2->_availableState;
      +[_OSDataProtectionStateMonitor dataProtectionClassD](_OSDataProtectionStateMonitor, "dataProtectionClassD");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v24);

      v25 = dispatch_queue_create("com.apple.DuetActivityScheduler.DataProtection.notify", 0);
      notifyQueue = v2->_notifyQueue;
      v2->_notifyQueue = (OS_dispatch_queue *)v25;

      v2->_notifyToken = 0;
      objc_initWeak(&location, v2);
      v27 = v2->_notifyQueue;
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __32___OSDataProtectionManager_init__block_invoke;
      v29[3] = &unk_24E477620;
      objc_copyWeak(&v30, &location);
      notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &v2->_notifyToken, v27, v29);
      v2->_notifyEnabled = 1;
      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
  }
  return v2;
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

  v39 = *MEMORY[0x24BDAC8D0];
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__0;
  v35[4] = __Block_byref_object_dispose__0;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__0;
  v33 = __Block_byref_object_dispose__0;
  v34 = 0;
  stateQueue = self->_stateQueue;
  v4 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56___OSDataProtectionManager_handleKeyBagLockNotification__block_invoke;
  block[3] = &unk_24E477648;
  block[4] = self;
  block[5] = v35;
  block[6] = &v29;
  dispatch_sync(stateQueue, block);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_stateQueue;
  v25[0] = v4;
  v25[1] = 3221225472;
  v25[2] = __56___OSDataProtectionManager_handleKeyBagLockNotification__block_invoke_2;
  v25[3] = &unk_24E477670;
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
  return MKBDeviceUnlockedSinceBoot() != 0;
}

- (BOOL)deviceIsPasswordConfigured
{
  const void *v2;
  const void *v3;
  const void *v4;

  v2 = (const void *)MGCopyAnswer();
  v3 = v2;
  v4 = (const void *)*MEMORY[0x24BDBD270];
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
  v4 = (const void *)*MEMORY[0x24BDBD270];
  if (v2)
    CFRelease(v2);
  return v3 == v4;
}

- (BOOL)isDataAvailableForClassC
{
  if (-[_OSDataProtectionManager deviceHasBeenUnlockedSinceBoot](self, "deviceHasBeenUnlockedSinceBoot"))
    return 1;
  else
    return !-[_OSDataProtectionManager deviceIsPasswordConfigured](self, "deviceIsPasswordConfigured");
}

- (BOOL)isDataAvailableForClassA
{
  if (-[_OSDataProtectionManager deviceIsLocked](self, "deviceIsLocked"))
    return !-[_OSDataProtectionManager deviceIsPasswordConfigured](self, "deviceIsPasswordConfigured");
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
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47___OSDataProtectionManager_isDataAvailableFor___block_invoke;
    block[3] = &unk_24E477698;
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
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55___OSDataProtectionManager_registerStateChangeHandler___block_invoke;
    block[3] = &unk_24E4776C0;
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57___OSDataProtectionManager_deregisterStateChangeHandler___block_invoke;
  block[3] = &unk_24E4776E8;
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

@implementation COHomeKitAdapter

- (COHomeKitAdapter)initWithHomeManager:(id)a3 MediaGroupsDaemon:(id)a4
{
  id v7;
  id v8;
  COHomeKitAdapter *v9;
  COHomeKitAdapter *v10;
  NSCondition *v11;
  NSCondition *condition;
  NSMutableArray *v13;
  NSMutableArray *mediaSystemUpdateHandlers;
  NSDictionary *v15;
  NSDictionary *audioDestinationControllerListeners;
  HMHomeManager *homekit;
  HMHomeManager *v18;
  BOOL v19;
  char v20;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)COHomeKitAdapter;
  v9 = -[COHomeKitAdapter init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_homekit, a3);
    v11 = (NSCondition *)objc_alloc_init(MEMORY[0x24BDD14C8]);
    condition = v10->_condition;
    v10->_condition = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mediaSystemUpdateHandlers = v10->_mediaSystemUpdateHandlers;
    v10->_mediaSystemUpdateHandlers = v13;

    objc_storeStrong((id *)&v10->_mediaGroupsDaemon, a4);
    v15 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    audioDestinationControllerListeners = v10->_audioDestinationControllerListeners;
    v10->_audioDestinationControllerListeners = v15;

    homekit = v10->_homekit;
    if (homekit)
    {
      v18 = homekit;
      if (-[HMHomeManager authorizationStatus](v18, "authorizationStatus") == 1)
      {
        v19 = 1;
      }
      else
      {
        v20 = -[HMHomeManager status](v18, "status");
        v19 = (v20 & 0x21) != 1 || (v20 & 0x10) != 0;
      }

      v10->_ready = v19;
      -[HMHomeManager setDelegate:](v10->_homekit, "setDelegate:", v10);
    }
  }

  return v10;
}

- (COHomeKitAdapter)initWithHomeManager:(id)a3
{
  return -[COHomeKitAdapter initWithHomeManager:MediaGroupsDaemon:](self, "initWithHomeManager:MediaGroupsDaemon:", a3, 0);
}

- (COHomeKitAdapter)init
{
  return -[COHomeKitAdapter initWithHomeManager:](self, "initWithHomeManager:", 0);
}

+ (COHomeKitAdapter)sharedInstance
{
  id v3;
  id v4;
  void *v5;

  os_unfair_lock_lock((os_unfair_lock_t)&_COHomeKitAdapterSharedInstanceLock);
  v3 = (id)_COHomeKitAdapterSharedInstance;
  if (!v3)
  {
    v4 = objc_alloc_init((Class)a1);
    v5 = (void *)_COHomeKitAdapterSharedInstance;
    _COHomeKitAdapterSharedInstance = (uint64_t)v4;

    v3 = v4;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_COHomeKitAdapterSharedInstanceLock);
  return (COHomeKitAdapter *)v3;
}

+ (void)setSharedInstance:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_COHomeKitAdapterSharedInstanceLock);
  v4 = (void *)_COHomeKitAdapterSharedInstance;
  _COHomeKitAdapterSharedInstance = (uint64_t)v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&_COHomeKitAdapterSharedInstanceLock);
}

- (BOOL)isReady
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __27__COHomeKitAdapter_isReady__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COHomeKitAdapter _withLock:](self, "_withLock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __27__COHomeKitAdapter_isReady__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 12);
  return result;
}

- (void)prewarm
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_215E92000, v0, v1, "%p request to prewarm HomeKit from %@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_11();
}

id __27__COHomeKitAdapter_prewarm__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "homekit");
}

- (BOOL)hasOptedToHH2
{
  void *v2;
  char v3;

  -[COHomeKitAdapter homekit](self, "homekit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasOptedToHH2");

  return v3;
}

- (HMHomeManager)homekit
{
  void *v3;
  __int128 v4;
  NSObject *v5;
  _BOOL4 ready;
  NSObject *v7;
  id v8;
  __int128 v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  COHomeKitAdapter *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  v17 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __27__COHomeKitAdapter_homekit__block_invoke;
  v11[3] = &unk_24D4B0B18;
  v11[4] = self;
  v11[5] = &v12;
  -[COHomeKitAdapter _withLock:](self, "_withLock:", v11);
  -[COHomeKitAdapter condition](self, "condition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");
  if (!self->_ready)
  {
    *(_QWORD *)&v4 = 134217984;
    v10 = v4;
    do
    {
      COCoreLogForCategory(7);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v10;
        v19 = self;
        _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%p having to wait for HomeKit to come ready!", buf, 0xCu);
      }

      objc_msgSend(v3, "wait");
      ready = self->_ready;
      if (self->_ready)
      {
        COCoreLogForCategory(7);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v10;
          v19 = self;
          _os_log_impl(&dword_215E92000, v7, OS_LOG_TYPE_DEFAULT, "%p is able to move forward again.", buf, 0xCu);
        }

        ready = self->_ready;
      }
    }
    while (!ready);
  }
  objc_msgSend(v3, "unlock", v10);
  v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return (HMHomeManager *)v8;
}

void __27__COHomeKitAdapter_homekit__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  BOOL v9;
  char v10;
  NSObject *v11;

  v2 = a1 + 32;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7838]), "initWithOptions:cachePolicy:", 225, 0);
    objc_msgSend(v4, "setDiscretionary:", 0);
    v5 = objc_alloc_init(MEMORY[0x24BDD1710]);
    objc_msgSend(v4, "setDelegateQueue:", v5);

    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD76D8]), "initWithConfiguration:", v4);
    v7 = *(void **)(*(_QWORD *)v2 + 16);
    *(_QWORD *)(*(_QWORD *)v2 + 16) = v6;

    v8 = *(id *)(*(_QWORD *)v2 + 16);
    if (objc_msgSend(v8, "authorizationStatus") == 1)
    {
      v9 = 1;
    }
    else
    {
      v10 = objc_msgSend(v8, "status");
      v9 = (v10 & 0x21) != 1 || (v10 & 0x10) != 0;
    }

    *(_BYTE *)(*(_QWORD *)v2 + 12) = v9;
    objc_msgSend(*(id *)(*(_QWORD *)v2 + 16), "setDelegate:");
    COCoreLogForCategory(7);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __27__COHomeKitAdapter_homekit__block_invoke_cold_1();

    v3 = *(void **)(*(_QWORD *)v2 + 16);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
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

- (id)currentAccessory
{
  return 0;
}

- (HMMediaSystem)currentMediaSystem
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__10;
  v9 = __Block_byref_object_dispose__10;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__COHomeKitAdapter_currentMediaSystem__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COHomeKitAdapter _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (HMMediaSystem *)v2;
}

void __38__COHomeKitAdapter_currentMediaSystem__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)setCurrentMediaSystem:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  COHomeKitAdapter *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__10;
  v15 = __Block_byref_object_dispose__11;
  v16 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__COHomeKitAdapter_setCurrentMediaSystem___block_invoke;
  v7[3] = &unk_24D4B08A8;
  v5 = v4;
  v8 = v5;
  v9 = self;
  v10 = &v11;
  -[COHomeKitAdapter _withLock:](self, "_withLock:", v7);
  v6 = v12[5];
  if (v6)
    (*(void (**)(void))(v6 + 16))();

  _Block_object_dispose(&v11, 8);
}

void __42__COHomeKitAdapter_setCurrentMediaSystem___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (v2 == *(void **)(*(_QWORD *)(a1 + 40) + 24) || (objc_msgSend(v2, "isEqual:") & 1) != 0)
    return;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 24), *(id *)(a1 + 32));
  COCoreLogForCategory(7);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    v36 = v4;
    v37 = 2112;
    v38 = v5;
    _os_log_impl(&dword_215E92000, v3, OS_LOG_TYPE_DEFAULT, "%p set current media system to %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "components");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "currentAccessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v10, "isEqual:", v11);

  v29 = v7;
  if ((_DWORD)v9)
  {
    objc_msgSend(v7, "objectAtIndex:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mediaProfile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accessory");
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }
  objc_msgSend(v10, "uniqueIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionaryForKey:", CFSTR("HomeKitContext"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", CFSTR("MediaSystemCompanion"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    v19 = 0;
    if (v17)
      goto LABEL_9;
LABEL_11:
    v20 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    goto LABEL_12;
  }
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v18);
  if (!v17)
    goto LABEL_11;
LABEL_9:
  v20 = (id)objc_msgSend(v17, "mutableCopy");
LABEL_12:
  v21 = v20;
  v30 = v6;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v6, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v22, CFSTR("MediaSystem"));

    objc_msgSend(v15, "UUIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v23, CFSTR("MediaSystemCompanion"));

  }
  else
  {
    objc_msgSend(v20, "removeObjectForKey:", CFSTR("MediaSystem"));
    objc_msgSend(v21, "removeObjectForKey:", CFSTR("MediaSystemCompanion"));
  }
  objc_msgSend(v16, "setObject:forKey:", v21, CFSTR("HomeKitContext"));
  objc_msgSend(*(id *)(a1 + 40), "mediaSystemUpdateHandlers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copy");

  if (objc_msgSend(v25, "count"))
  {
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __42__COHomeKitAdapter_setCurrentMediaSystem___block_invoke_21;
    v31[3] = &unk_24D4B08D0;
    v32 = v25;
    v33 = v19;
    v34 = v15;
    v26 = MEMORY[0x2199F3D40](v31);
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;

  }
}

void __42__COHomeKitAdapter_setCurrentMediaSystem___block_invoke_21(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (id)accessoryWithUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  char v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[COHomeKitAdapter homekit](self, "homekit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homes");
  v6 = objc_claimAutoreleasedReturnValue();

  v21 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v21)
  {
    v7 = *(_QWORD *)v27;
    v20 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v6);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v9, "accessories");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v23;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v23 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
              objc_msgSend(v15, "uniqueIdentifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isEqual:", v4);

              if ((v17 & 1) != 0)
              {
                v18 = v15;

                goto LABEL_20;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v12)
              continue;
            break;
          }
        }

        v7 = v20;
      }
      v21 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v21);
  }

  COCoreLogForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[COHomeKitAdapter accessoryWithUniqueIdentifier:].cold.1();
  v18 = 0;
LABEL_20:

  return v18;
}

- (id)identifiersForAccessoriesAssociatedWithAccessory:(id)a3 inHome:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[COHomeKitAdapter mediaSystemForAccessory:inHome:](self, "mediaSystemForAccessory:inHome:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[COHomeKitAdapter accessoriesInMediaSystem:inHome:](self, "accessoriesInMediaSystem:inHome:", v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __76__COHomeKitAdapter_identifiersForAccessoriesAssociatedWithAccessory_inHome___block_invoke;
    v13[3] = &unk_24D4B1A40;
    v14 = v8;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);

  }
  else
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v10);
  }

  objc_msgSend(v8, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __76__COHomeKitAdapter_identifiersForAccessoriesAssociatedWithAccessory_inHome___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)mediaSystemForAccessory:(id)a3 inHome:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  char v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[COHomeKitAdapter homekit](self, "homekit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v7);

  if (v10)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v7, "mediaSystems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v26)
    {
      v12 = *(_QWORD *)v34;
      v28 = v11;
      v25 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v34 != v12)
            objc_enumerationMutation(v11);
          v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v27 = v14;
          objc_msgSend(v14, "components", v25);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v30;
            while (2)
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v30 != v18)
                  objc_enumerationMutation(v15);
                objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "mediaProfile");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "accessory");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v21, "isEqual:", v6);

                if ((v22 & 1) != 0)
                {
                  v23 = v27;

                  v11 = v28;
                  goto LABEL_21;
                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
              if (v17)
                continue;
              break;
            }
          }

          v12 = v25;
          v11 = v28;
        }
        v23 = 0;
        v26 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v26);
    }
    else
    {
      v23 = 0;
    }
LABEL_21:

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)accessoriesInMediaSystem:(id)a3 inHome:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  objc_msgSend(v6, "components");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[COHomeKitAdapter homekit](self, "homekit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "homes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", v7);

  if (v12)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v17), "mediaProfile", (_QWORD)v22);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "accessory");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v8, "arrayByAddingObject:", v19);
            v20 = objc_claimAutoreleasedReturnValue();

            v8 = (id)v20;
          }

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v15);
    }

  }
  return v8;
}

- (id)homeForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[COHomeKitAdapter homekit](self, "homekit", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "accessories");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", v4);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)zoneForAccessory:(id)a3 inHome:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[COHomeKitAdapter roomForAccessory:inHome:](self, "roomForAccessory:inHome:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v6, "zones", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v12, "rooms");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "containsObject:", v7);

          if ((v14 & 1) != 0)
          {
            v9 = v12;
            goto LABEL_12;
          }
        }
        v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)accessoriesInZone:(id)a3 inHome:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v6, "rooms", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      v14 = v8;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        -[COHomeKitAdapter accessoriesInRoom:inHome:](self, "accessoriesInRoom:inHome:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13), v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v15);
        v8 = (id)objc_claimAutoreleasedReturnValue();

        ++v13;
        v14 = v8;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)roomForAccessory:(id)a3 inHome:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v7, "rooms", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[COHomeKitAdapter accessoriesInRoom:inHome:](self, "accessoriesInRoom:inHome:", v13, v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "containsObject:", v6);

        if ((v15 & 1) != 0)
        {
          v16 = v13;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (id)accessoriesInRoom:(id)a3 inHome:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[COHomeKitAdapter homekit](self, "homekit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "containsObject:", v7) & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(v7, "rooms");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v6);

  if (!v11)
  {
LABEL_5:
    v12 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_6;
  }
  objc_msgSend(v6, "accessories");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v12;
}

- (id)settingsForKeyPath:(id)a3 fromSettings:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *j;
  void *v30;
  void *v31;
  int v32;
  id v34;
  id v35;
  void *v36;
  unint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  void *v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (settingsForKeyPath_fromSettings__onceToken != -1)
    dispatch_once(&settingsForKeyPath_fromSettings__onceToken, &__block_literal_global_2);
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v7, "count");
  if (v37
    && (objc_msgSend(v7, "firstObject"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDD4EA8]),
        v8,
        v9))
  {
    objc_msgSend(v6, "rootGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v34 = v6;
      v35 = v5;
      v11 = 1;
      v36 = v7;
      do
      {
        objc_msgSend(v7, "subarrayWithRange:", 0, v11, v34);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "componentsJoinedByString:", CFSTR("."));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        objc_msgSend(v10, "groups");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v43;
          while (2)
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v43 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
              objc_msgSend(v19, "keyPath");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "isEqualToString:", v13);

              if (v21)
              {
                v22 = v19;

                v10 = v22;
                goto LABEL_17;
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
            if (v16)
              continue;
            break;
          }
LABEL_17:
          v7 = v36;
        }

        if (!v10)
          break;
        ++v11;
      }
      while (v11 <= v37);
      if (v10)
      {
        objc_msgSend(v10, "keyPath");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v35;
        v24 = objc_msgSend(v23, "isEqualToString:", v35);

        if ((v24 & 1) != 0)
        {
          objc_msgSend(v10, "settings");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          objc_msgSend(v10, "settings");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
          if (v25)
          {
            v27 = v7;
            v28 = *(_QWORD *)v39;
            while (2)
            {
              for (j = 0; j != v25; j = (char *)j + 1)
              {
                if (*(_QWORD *)v39 != v28)
                  objc_enumerationMutation(v26);
                v30 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)j);
                objc_msgSend(v30, "keyPath");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = objc_msgSend(v31, "isEqualToString:", v35);

                if (v32)
                {
                  v46 = v30;
                  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 1);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_36;
                }
              }
              v25 = (void *)objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
              if (v25)
                continue;
              break;
            }
LABEL_36:
            v7 = v27;
          }

        }
      }
      else
      {
        v25 = 0;
        v5 = v35;
      }
      v6 = v34;
    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

void __52__COHomeKitAdapter_settingsForKeyPath_fromSettings___block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v0 = objc_alloc(MEMORY[0x24BDBCF20]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = (id)objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);
  objc_msgSend(MEMORY[0x24BDD7340], "setItemValueClasses:forKeyPath:", v5, CFSTR("root.mobileTimer.alarms"));

}

- (id)settingsForKeyPath:(id)a3 onAccessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v12;
  int v13;
  COHomeKitAdapter *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[COHomeKitAdapter settingsForKeyPath:fromSettings:](self, "settingsForKeyPath:fromSettings:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    COCoreLogForCategory(7);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 134218498;
      v14 = self;
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = v12;
      _os_log_error_impl(&dword_215E92000, v10, OS_LOG_TYPE_ERROR, "%p was not able to retrieve %@ for accessory %@!", (uint8_t *)&v13, 0x20u);

    }
  }

  return v9;
}

- (id)settingsForKeyPath:(id)a3 onMediaObject:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  COHomeKitAdapter *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[COHomeKitAdapter settingsForKeyPath:fromSettings:](self, "settingsForKeyPath:fromSettings:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    COCoreLogForCategory(7);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 134218498;
      v13 = self;
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = v7;
      _os_log_error_impl(&dword_215E92000, v10, OS_LOG_TYPE_ERROR, "%p was not able to retrieve %@ for %@!", (uint8_t *)&v12, 0x20u);
    }

  }
  return v9;
}

- (id)registerMediaSystemUpdateHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__COHomeKitAdapter_registerMediaSystemUpdateHandler___block_invoke;
  v8[3] = &unk_24D4B1428;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[COHomeKitAdapter _withLock:](self, "_withLock:", v8);
  v6 = (void *)MEMORY[0x2199F3D40](v5);

  return v6;
}

void __53__COHomeKitAdapter_registerMediaSystemUpdateHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "mediaSystemUpdateHandlers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x2199F3D40](*(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "addObject:", v2);

}

- (void)unregisterMediaSystemUpdateHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__COHomeKitAdapter_unregisterMediaSystemUpdateHandler___block_invoke;
  v6[3] = &unk_24D4B0858;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[COHomeKitAdapter _withLock:](self, "_withLock:", v6);

}

void __55__COHomeKitAdapter_unregisterMediaSystemUpdateHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "mediaSystemUpdateHandlers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x2199F3D40](*(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "removeObject:", v2);

}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  _QWORD v24[6];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  COHomeKitAdapter *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  COCoreLogForCategory(7);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[COHomeKitAdapter homeManagerDidUpdateHomes:].cold.1(v5);

  -[COHomeKitAdapter condition](self, "condition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");
  if (!self->_ready)
  {
    COCoreLogForCategory(7);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v31 = self;
      _os_log_impl(&dword_215E92000, v7, OS_LOG_TYPE_DEFAULT, "%p is marking HomeKit ready!", buf, 0xCu);
    }

    self->_ready = 1;
    objc_msgSend(v6, "broadcast");
  }
  objc_msgSend(v6, "unlock");
  -[COHomeKitAdapter currentAccessory](self, "currentAccessory");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[COHomeKitAdapter homeForAccessory:](self, "homeForAccessory:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[COHomeKitAdapter mediaSystemForAccessory:inHome:](self, "mediaSystemForAccessory:inHome:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    -[COHomeKitAdapter setCurrentMediaSystem:](self, "setCurrentMediaSystem:", v10);

  }
  -[COHomeKitAdapter mediaGroupsDaemon](self, "mediaGroupsDaemon", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v22 = v4;
  objc_msgSend(v4, "homes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    v15 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v17, "setDelegate:", self);
        if (v11)
          objc_msgSend(v11, "addHomeKitHome:", v17);
        objc_msgSend(v17, "accessories");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v15;
        v24[1] = 3221225472;
        v24[2] = __46__COHomeKitAdapter_homeManagerDidUpdateHomes___block_invoke;
        v24[3] = &unk_24D4B1A88;
        v24[4] = self;
        v24[5] = v17;
        objc_msgSend(v18, "enumerateObjectsUsingBlock:", v24);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v13);
  }

  objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("COHomeKitAdapterSignificantHomeChangeNotification"), self);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "postNotification:", v19);

}

uint64_t __46__COHomeKitAdapter_homeManagerDidUpdateHomes___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addAudioDestinationControllerListenerForAccessory:home:", a2, *(_QWORD *)(a1 + 40));
}

- (void)homeManager:(id)a3 didUpdateAuthorizationStatus:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;
  unsigned int v8;
  char v9;
  _BOOL4 v10;
  NSObject *v11;
  int v12;
  COHomeKitAdapter *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[COHomeKitAdapter condition](self, "condition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");
  if (!self->_ready)
  {
    v7 = v5;
    if (objc_msgSend(v7, "authorizationStatus") == 1 || (v8 = objc_msgSend(v7, "status"), (v8 & 0x21) != 1))
    {

      self->_ready = 1;
    }
    else
    {
      v9 = v8;
      v10 = (v8 >> 4) & 1;

      self->_ready = v10;
      if ((v9 & 0x10) == 0)
        goto LABEL_10;
    }
    COCoreLogForCategory(7);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = self;
      _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%p not waiting for home updates.  Marking HomeKit ready now!", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(v6, "broadcast");
  }
LABEL_10:
  objc_msgSend(v6, "unlock");

}

- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;
  unsigned int v8;
  char v9;
  _BOOL4 v10;
  NSObject *v11;
  int v12;
  COHomeKitAdapter *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[COHomeKitAdapter condition](self, "condition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");
  if (!self->_ready)
  {
    v7 = v5;
    if (objc_msgSend(v7, "authorizationStatus") == 1 || (v8 = objc_msgSend(v7, "status"), (v8 & 0x21) != 1))
    {

      self->_ready = 1;
    }
    else
    {
      v9 = v8;
      v10 = (v8 >> 4) & 1;

      self->_ready = v10;
      if ((v9 & 0x10) == 0)
        goto LABEL_10;
    }
    COCoreLogForCategory(7);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = self;
      _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%p got impatient for home updates.  Marking HomeKit ready now!", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(v6, "broadcast");
  }
LABEL_10:
  objc_msgSend(v6, "unlock");

}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  COHomeKitAdapter *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  COCoreLogForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v16 = self;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%p Added Home %@", buf, 0x16u);
  }

  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("COHomeKitAdapterSignificantHomeChangeNotification"), self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotification:", v7);

  -[COHomeKitAdapter mediaGroupsDaemon](self, "mediaGroupsDaemon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "addHomeKitHome:", v5);
  objc_msgSend(v5, "accessories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __43__COHomeKitAdapter_homeManager_didAddHome___block_invoke;
  v13[3] = &unk_24D4B1A88;
  v13[4] = self;
  v14 = v5;
  v12 = v5;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13);

}

uint64_t __43__COHomeKitAdapter_homeManager_didAddHome___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addAudioDestinationControllerListenerForAccessory:home:", a2, *(_QWORD *)(a1 + 40));
}

- (void)homeManagerDidUpdateCurrentHome:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  COHomeKitAdapter *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  COCoreLogForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = self;
    _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%p Updated Current Home", (uint8_t *)&v8, 0xCu);
  }

  -[COHomeKitAdapter mediaGroupsDaemon](self, "mediaGroupsDaemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "currentHome");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v6, "addHomeKitHome:", v7);

  }
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  COHomeKitAdapter *v17;
  id v18;
  uint8_t buf[4];
  COHomeKitAdapter *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  COCoreLogForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v20 = self;
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%p Removed Home %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("COHomeKitAdapterSignificantHomeChangeNotification"), self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotification:", v7);

  objc_msgSend(v5, "accessories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __46__COHomeKitAdapter_homeManager_didRemoveHome___block_invoke;
  v16 = &unk_24D4B1A88;
  v17 = self;
  v10 = v5;
  v18 = v10;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v13);

  -[COHomeKitAdapter mediaGroupsDaemon](self, "mediaGroupsDaemon", v13, v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "removeHomeKitHome:", v10);

}

uint64_t __46__COHomeKitAdapter_homeManager_didRemoveHome___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeAudioDestinationControllerListenerForAccessory:home:", a2, *(_QWORD *)(a1 + 40));
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  COHomeKitAdapter *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[COHomeKitAdapter currentAccessory](self, "currentAccessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (v11)
  {
    COCoreLogForCategory(1);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 134218242;
      v18 = self;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEFAULT, "%p Added Accessory %@", (uint8_t *)&v17, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("COHomeKitAdapterSignificantHomeChangeNotification"), self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotification:", v13);

  }
  -[COHomeKitAdapter mediaGroupsDaemon](self, "mediaGroupsDaemon");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
    objc_msgSend(v15, "addHomeKitAccessory:fromHome:", v7, v6);
  -[COHomeKitAdapter _addAudioDestinationControllerListenerForAccessory:home:](self, "_addAudioDestinationControllerListenerForAccessory:home:", v7, v6);

}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  COHomeKitAdapter *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[COHomeKitAdapter currentAccessory](self, "currentAccessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (v11)
  {
    COCoreLogForCategory(1);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 134218242;
      v18 = self;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEFAULT, "%p Removed Accessory %@", (uint8_t *)&v17, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("COHomeKitAdapterSignificantHomeChangeNotification"), self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotification:", v13);

  }
  -[COHomeKitAdapter mediaGroupsDaemon](self, "mediaGroupsDaemon");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
    objc_msgSend(v15, "removeHomeKitAccessory:fromHome:", v7, v6);
  -[COHomeKitAdapter _removeAudioDestinationControllerListenerForAccessory:home:](self, "_removeAudioDestinationControllerListenerForAccessory:home:", v7, v6);

}

- (void)home:(id)a3 didUpdateRoom:(id)a4 forAccessory:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  COHomeKitAdapter *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  -[COHomeKitAdapter currentAccessory](self, "currentAccessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if (v12)
  {
    COCoreLogForCategory(1);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 134218242;
      v19 = self;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_215E92000, v13, OS_LOG_TYPE_DEFAULT, "%p Updated Room for Accessory  %@", (uint8_t *)&v18, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("COHomeKitAdapterSignificantHomeChangeNotification"), self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "postNotification:", v14);

  }
  -[COHomeKitAdapter mediaGroupsDaemon](self, "mediaGroupsDaemon");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
    objc_msgSend(v16, "addHomeKitHome:", v7);

}

- (void)home:(id)a3 didAddRoom:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  COHomeKitAdapter *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[COHomeKitAdapter currentAccessory](self, "currentAccessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[COHomeKitAdapter roomForAccessory:inHome:](self, "roomForAccessory:inHome:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", v7);

    if (v10)
    {
      COCoreLogForCategory(1);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 134218242;
        v17 = self;
        v18 = 2112;
        v19 = v7;
        _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%p Added Room  %@", (uint8_t *)&v16, 0x16u);
      }

      objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("COHomeKitAdapterSignificantHomeChangeNotification"), self);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "postNotification:", v12);

    }
  }
  -[COHomeKitAdapter mediaGroupsDaemon](self, "mediaGroupsDaemon");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    objc_msgSend(v14, "addHomeKitRoom:fromHome:", v7, v6);

}

- (void)home:(id)a3 didRemoveRoom:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  COHomeKitAdapter *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[COHomeKitAdapter currentAccessory](self, "currentAccessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    COCoreLogForCategory(1);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134218242;
      v15 = self;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_215E92000, v9, OS_LOG_TYPE_DEFAULT, "%p Removed Room  %@", (uint8_t *)&v14, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("COHomeKitAdapterSignificantHomeChangeNotification"), self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotification:", v10);

  }
  -[COHomeKitAdapter mediaGroupsDaemon](self, "mediaGroupsDaemon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "removeHomeKitRoom:fromHome:", v7, v6);

}

- (void)home:(id)a3 didAddRoom:(id)a4 toZone:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  COHomeKitAdapter *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COHomeKitAdapter currentAccessory](self, "currentAccessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[COHomeKitAdapter zoneForAccessory:inHome:](self, "zoneForAccessory:inHome:", v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqual:", v10);

    if (v13)
    {
      COCoreLogForCategory(1);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 134218242;
        v20 = self;
        v21 = 2112;
        v22 = v9;
        _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%p Updated Zone for Room %@", (uint8_t *)&v19, 0x16u);
      }

      objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("COHomeKitAdapterSignificantHomeChangeNotification"), self);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "postNotification:", v15);

    }
  }
  -[COHomeKitAdapter mediaGroupsDaemon](self, "mediaGroupsDaemon");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
    objc_msgSend(v17, "addHomeKitHome:", v8);

}

- (void)home:(id)a3 didAddZone:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  COHomeKitAdapter *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[COHomeKitAdapter currentAccessory](self, "currentAccessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[COHomeKitAdapter zoneForAccessory:inHome:](self, "zoneForAccessory:inHome:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", v7);

    if (v10)
    {
      COCoreLogForCategory(1);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 134218242;
        v17 = self;
        v18 = 2112;
        v19 = v7;
        _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%p Added Zone  %@", (uint8_t *)&v16, 0x16u);
      }

      objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("COHomeKitAdapterSignificantHomeChangeNotification"), self);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "postNotification:", v12);

    }
  }
  -[COHomeKitAdapter mediaGroupsDaemon](self, "mediaGroupsDaemon");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    objc_msgSend(v14, "addHomeKitZone:fromHome:", v7, v6);

}

- (void)home:(id)a3 didRemoveZone:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  COHomeKitAdapter *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[COHomeKitAdapter currentAccessory](self, "currentAccessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    COCoreLogForCategory(1);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134218242;
      v15 = self;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_215E92000, v9, OS_LOG_TYPE_DEFAULT, "%p Removed Zone  %@", (uint8_t *)&v14, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("COHomeKitAdapterSignificantHomeChangeNotification"), self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotification:", v10);

  }
  -[COHomeKitAdapter mediaGroupsDaemon](self, "mediaGroupsDaemon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "removeHomeKitZone:fromHome:", v7, v6);

}

- (void)home:(id)a3 didAddMediaSystem:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  COHomeKitAdapter *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  COCoreLogForCategory(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134218242;
    v16 = self;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%p Added Media System %@", (uint8_t *)&v15, 0x16u);
  }

  -[COHomeKitAdapter currentAccessory](self, "currentAccessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[COHomeKitAdapter mediaSystemForAccessory:inHome:](self, "mediaSystemForAccessory:inHome:", v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqual:", v7))
      -[COHomeKitAdapter setCurrentMediaSystem:](self, "setCurrentMediaSystem:", v7);

  }
  objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("COHomeKitAdapterSignificantHomeChangeNotification"), self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotification:", v11);

  -[COHomeKitAdapter mediaGroupsDaemon](self, "mediaGroupsDaemon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "addHomeKitMediaSystem:fromHome:", v7, v6);

}

- (void)home:(id)a3 didRemoveMediaSystem:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  COHomeKitAdapter *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  COCoreLogForCategory(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134218242;
    v16 = self;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%p Removed Media System %@", (uint8_t *)&v15, 0x16u);
  }

  -[COHomeKitAdapter currentMediaSystem](self, "currentMediaSystem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
    -[COHomeKitAdapter setCurrentMediaSystem:](self, "setCurrentMediaSystem:", 0);
  objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("COHomeKitAdapterSignificantHomeChangeNotification"), self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotification:", v11);

  -[COHomeKitAdapter mediaGroupsDaemon](self, "mediaGroupsDaemon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "removeHomeKitMediaSystem:fromHome:", v7, v6);

}

- (void)home:(id)a3 didAddUser:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  COHomeKitAdapter *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  COCoreLogForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218242;
    v8 = self;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%p User added to home %@", (uint8_t *)&v7, 0x16u);
  }

  -[COHomeKitAdapter _postUsersChangedNotificationForHome:](self, "_postUsersChangedNotificationForHome:", v5);
}

- (void)home:(id)a3 didRemoveUser:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  COHomeKitAdapter *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  COCoreLogForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218242;
    v8 = self;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%p User removed from home %@", (uint8_t *)&v7, 0x16u);
  }

  -[COHomeKitAdapter _postUsersChangedNotificationForHome:](self, "_postUsersChangedNotificationForHome:", v5);
}

- (void)audioDestinationControllerDidUpdateForAccessory:(id)a3 inHome:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  COHomeKitAdapter *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  COCoreLogForCategory(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134218242;
    v12 = self;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%p audio destination controller updated for %@", (uint8_t *)&v11, 0x16u);
  }

  -[COHomeKitAdapter mediaGroupsDaemon](self, "mediaGroupsDaemon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "addHomeKitAccessory:fromHome:", v6, v7);

}

- (void)_addAudioDestinationControllerListenerForAccessory:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "category");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "categoryType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD49A0]);

  if (v10)
  {
    -[COHomeKitAdapter audioDestinationControllerListeners](self, "audioDestinationControllerListeners");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    objc_msgSend(v6, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v16 = (void *)objc_msgSend(v11, "mutableCopy");
      v17 = -[_COHomeKitAudioDestinationControllerListener initWitAccessory:home:delegate:]([_COHomeKitAudioDestinationControllerListener alloc], "initWitAccessory:home:delegate:", v6, v7, self);
      objc_msgSend(v16, "setObject:forKey:", v17, v14);
      -[COHomeKitAdapter setAudioDestinationControllerListeners:](self, "setAudioDestinationControllerListeners:", v16);

    }
  }

}

- (void)_removeAudioDestinationControllerListenerForAccessory:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[COHomeKitAdapter audioDestinationControllerListeners](self, "audioDestinationControllerListeners");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v9;
  objc_msgSend(v7, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v13, "removeObjectForKey:", v11);
    -[COHomeKitAdapter setAudioDestinationControllerListeners:](self, "setAudioDestinationControllerListeners:", v13);

  }
}

- (void)_postUsersChangedNotificationForHome:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  -[COHomeKitAdapter homekit](self, "homekit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentAccessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16C8]), "initWithName:object:userInfo:", CFSTR("COHomeKitAdapterUsersChangedInHome"), v10, 0);
  if (!v5
    || (-[COHomeKitAdapter homeForAccessory:](self, "homeForAccessory:", v5),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqual:", v10),
        v7,
        v8))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotification:", v6);

  }
}

- (NSCondition)condition
{
  return self->_condition;
}

- (MGDaemon)mediaGroupsDaemon
{
  return self->_mediaGroupsDaemon;
}

- (NSDictionary)audioDestinationControllerListeners
{
  return self->_audioDestinationControllerListeners;
}

- (void)setAudioDestinationControllerListeners:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSMutableArray)mediaSystemUpdateHandlers
{
  return self->_mediaSystemUpdateHandlers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaSystemUpdateHandlers, 0);
  objc_storeStrong((id *)&self->_audioDestinationControllerListeners, 0);
  objc_storeStrong((id *)&self->_mediaGroupsDaemon, 0);
  objc_storeStrong((id *)&self->_condition, 0);
  objc_storeStrong((id *)&self->_currentMediaSystem, 0);
  objc_storeStrong((id *)&self->_homekit, 0);
}

- (id)alarmsCollectionForAccessory:(id)a3 inHome:(id)a4 isMediaSystem:(BOOL *)a5
{
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a3;
  -[COHomeKitAdapter mediaSystemForAccessory:inHome:](self, "mediaSystemForAccessory:inHome:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[COHomeKitAdapter settingsForKeyPath:onMediaObject:](self, "settingsForKeyPath:onMediaObject:", CFSTR("root.mobileTimer.alarms"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 1;
  }
  else
  {
    -[COHomeKitAdapter settingsForKeyPath:onAccessory:](self, "settingsForKeyPath:onAccessory:", CFSTR("root.mobileTimer.alarms"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
  }
  *a5 = v11;
  objc_msgSend(v10, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

- (BOOL)isAlarmsCollectionSetting:(id)a3 forAccessory:(id)a4 inHome:(id)a5
{
  id v8;
  void *v9;
  char v11;

  v11 = 0;
  v8 = a3;
  -[COHomeKitAdapter alarmsCollectionForAccessory:inHome:isMediaSystem:](self, "alarmsCollectionForAccessory:inHome:isMediaSystem:", a4, a5, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v9, "isEqual:", v8);

  return (char)a4;
}

- (id)alarmsForAccessory:(id)a3 inHome:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  char v27;

  v6 = a3;
  v7 = a4;
  v27 = 0;
  -[COHomeKitAdapter alarmsCollectionForAccessory:inHome:isMediaSystem:](self, "alarmsCollectionForAccessory:inHome:isMediaSystem:", v6, v7, &v27);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    COTimerSiriContextTargetReferenceForAccessory();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__27;
    v25 = __Block_byref_object_dispose__27;
    v26 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    objc_msgSend(v8, "co_alarms");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __64__COHomeKitAdapter_COMeshAlarmAddOn__alarmsForAccessory_inHome___block_invoke;
    v16[3] = &unk_24D4B4678;
    v12 = v9;
    v17 = v12;
    v20 = v27;
    v13 = v10;
    v18 = v13;
    v19 = &v21;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v16);

    v14 = (id)v22[5];
    _Block_object_dispose(&v21, 8);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __64__COHomeKitAdapter_COMeshAlarmAddOn__alarmsForAccessory_inHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v8 = (id)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v8, "co_setTargetReference:", *(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(v8, "co_setIsMediaSystemOriginating");
  objc_msgSend(v8, "setLastModifiedDate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "lastModifiedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "co_setHomeKitSaveDate:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "arrayByAddingObject:", v8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)accessoriesForSiriContextTargetReference:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("siri-hk-target")) & 1) != 0)
  {
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("accessory"));

    if (v8)
    {
      v24 = v3;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      objc_msgSend(v5, "queryItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v27 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_msgSend(v14, "name");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(CFSTR("identifier"), "isEqualToString:", v15);

            if (v16)
            {
              v17 = objc_alloc(MEMORY[0x24BDD1880]);
              objc_msgSend(v14, "value");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = (void *)objc_msgSend(v17, "initWithUUIDString:", v18);

              if (v19)
              {
                -[COHomeKitAdapter accessoryWithUniqueIdentifier:](self, "accessoryWithUniqueIdentifier:", v19);
                v20 = objc_claimAutoreleasedReturnValue();
                if (v20)
                {
                  v21 = (void *)v20;
                  objc_msgSend(v4, "arrayByAddingObject:", v20);
                  v22 = objc_claimAutoreleasedReturnValue();

                  v4 = (id)v22;
                }
              }

            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v11);
      }

      v3 = v24;
    }
  }
  else
  {

  }
  return v4;
}

- (id)allAccessoriesForSiriContextTargetReference:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("siri-hk-target")) & 1) != 0)
  {
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("accessory"));

    if (v8)
    {
      v25 = v3;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      objc_msgSend(v5, "queryItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v28;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v28 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            objc_msgSend(v14, "name");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(CFSTR("identifier"), "isEqualToString:", v15);

            if (v16)
            {
              v17 = objc_alloc(MEMORY[0x24BDD1880]);
              objc_msgSend(v14, "value");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = (void *)objc_msgSend(v17, "initWithUUIDString:", v18);

              if (!v19
                || (-[COHomeKitAdapter accessoryWithUniqueIdentifier:](self, "accessoryWithUniqueIdentifier:", v19),
                    (v20 = objc_claimAutoreleasedReturnValue()) == 0))
              {

                v23 = 0;
                v3 = v25;
                goto LABEL_17;
              }
              v21 = (void *)v20;
              objc_msgSend(v4, "arrayByAddingObject:", v20);
              v22 = objc_claimAutoreleasedReturnValue();

              v4 = (id)v22;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          if (v11)
            continue;
          break;
        }
      }

      v3 = v25;
    }
  }
  else
  {

  }
  v4 = v4;
  v23 = v4;
LABEL_17:

  return v23;
}

- (id)addAlarm:(id)a3 toAccessory:(id)a4 inHome:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  _QWORD v16[4];
  id v17;
  char v18;

  v8 = a3;
  v9 = a4;
  v18 = 0;
  -[COHomeKitAdapter alarmsCollectionForAccessory:inHome:isMediaSystem:](self, "alarmsCollectionForAccessory:inHome:isMediaSystem:", v9, a5, &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x24BE6B608]);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __66__COHomeKitAdapter_COMeshAlarmAddOn__addAlarm_toAccessory_inHome___block_invoke;
    v16[3] = &unk_24D4B0D00;
    v12 = v11;
    v17 = v12;
    objc_msgSend(v10, "co_addAlarm:completionHandler:", v8, v16);
    v13 = v17;
  }
  else
  {
    COCoreLogForCategory(2);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[COHomeKitAdapter(COMeshAlarmAddOn) addAlarm:toAccessory:inHome:].cold.1(v9);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 2, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithError:", v13);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

uint64_t __66__COHomeKitAdapter_COMeshAlarmAddOn__addAlarm_toAccessory_inHome___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishWithError:", a2);
  else
    return objc_msgSend(v2, "finishWithNoResult");
}

- (id)updateAlarm:(id)a3 onAccessory:(id)a4 inHome:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  _QWORD v16[4];
  id v17;
  char v18;

  v8 = a3;
  v9 = a4;
  v18 = 0;
  -[COHomeKitAdapter alarmsCollectionForAccessory:inHome:isMediaSystem:](self, "alarmsCollectionForAccessory:inHome:isMediaSystem:", v9, a5, &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x24BE6B608]);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __69__COHomeKitAdapter_COMeshAlarmAddOn__updateAlarm_onAccessory_inHome___block_invoke;
    v16[3] = &unk_24D4B0D00;
    v12 = v11;
    v17 = v12;
    objc_msgSend(v10, "co_updateAlarm:completionHandler:", v8, v16);
    v13 = v17;
  }
  else
  {
    COCoreLogForCategory(2);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[COHomeKitAdapter(COMeshAlarmAddOn) updateAlarm:onAccessory:inHome:].cold.1(v9);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 2, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithError:", v13);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

uint64_t __69__COHomeKitAdapter_COMeshAlarmAddOn__updateAlarm_onAccessory_inHome___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishWithError:", a2);
  else
    return objc_msgSend(v2, "finishWithNoResult");
}

- (id)removeAlarm:(id)a3 fromAccessory:(id)a4 inHome:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  _QWORD v16[4];
  id v17;
  char v18;

  v8 = a3;
  v9 = a4;
  v18 = 0;
  -[COHomeKitAdapter alarmsCollectionForAccessory:inHome:isMediaSystem:](self, "alarmsCollectionForAccessory:inHome:isMediaSystem:", v9, a5, &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x24BE6B608]);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __71__COHomeKitAdapter_COMeshAlarmAddOn__removeAlarm_fromAccessory_inHome___block_invoke;
    v16[3] = &unk_24D4B0D00;
    v12 = v11;
    v17 = v12;
    objc_msgSend(v10, "co_removeAlarm:completionHandler:", v8, v16);
    v13 = v17;
  }
  else
  {
    COCoreLogForCategory(2);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[COHomeKitAdapter(COMeshAlarmAddOn) updateAlarm:onAccessory:inHome:].cold.1(v9);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 2, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithError:", v13);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

uint64_t __71__COHomeKitAdapter_COMeshAlarmAddOn__removeAlarm_fromAccessory_inHome___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishWithError:", a2);
  else
    return objc_msgSend(v2, "finishWithNoResult");
}

void __27__COHomeKitAdapter_homekit__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_215E92000, v0, v1, "%p pulling in HomeKit from %@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_11();
}

- (void)accessoryWithUniqueIdentifier:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6_0();
  _os_log_error_impl(&dword_215E92000, v0, OS_LOG_TYPE_ERROR, "%p is unable to find accessory %@!", v1, 0x16u);
}

- (void)homeManagerDidUpdateHomes:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_215E92000, log, OS_LOG_TYPE_DEBUG, "Notifying of significant home changes!", v1, 2u);
}

@end

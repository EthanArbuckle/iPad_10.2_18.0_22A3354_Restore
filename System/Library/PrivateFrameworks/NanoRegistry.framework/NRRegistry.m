@implementation NRRegistry

- (NRMutableDeviceCollection)collection
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
  v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __24__NRRegistry_collection__block_invoke;
  v4[3] = &unk_1E4495A48;
  v4[4] = self;
  v4[5] = &v5;
  -[NRRegistry performUnderCollectionLock:](self, "performUnderCollectionLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NRMutableDeviceCollection *)v2;
}

- (NRSecureDevicePropertyStore)secureProperties
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
  v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__NRRegistry_secureProperties__block_invoke;
  v4[3] = &unk_1E4495A48;
  v4[4] = self;
  v4[5] = &v5;
  -[NRRegistry performUnderCollectionLock:](self, "performUnderCollectionLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NRSecureDevicePropertyStore *)v2;
}

- (void)performUnderCollectionLock:(id)a3
{
  os_unfair_lock_s *p_collectionLock;
  void (**v4)(_QWORD);

  p_collectionLock = &self->_collectionLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_collectionLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_collectionLock);
}

void __30__NRRegistry_secureProperties__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

void __24__NRRegistry_collection__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

- (OS_dispatch_queue)managementQueue
{
  return self->_managementQueue;
}

void __90__NRRegistry__notifyObserversSecurePropertiesAreAvailableWithCollection_secureProperties___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

}

+ (id)_nextToken
{
  unint64_t v2;

  do
    v2 = __ldaxr(&_nextToken__tokenNumber);
  while (__stlxr(v2 + 1, &_nextToken__tokenNumber));
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
}

- (void)setQueueCollection:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id location;

  v5 = a3;
  objc_msgSend(v5, "setParentDelegate:", self);
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __33__NRRegistry_setQueueCollection___block_invoke;
  v10 = &unk_1E4496DF0;
  objc_copyWeak(&v11, &location);
  v6 = (id)objc_msgSend(v5, "addObserverQueue:withBlock:", 0, &v7);
  objc_storeStrong((id *)&self->_collection, a3);
  -[NRRegistry _startQueue](self, "_startQueue", v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)_startQueue
{
  if (!self->_queueRunning)
  {
    self->_queueRunning = 1;
    -[NRBypassQueue resume](self->_accessQueue, "resume");
  }
}

uint64_t __34__NRRegistry_setSecureProperties___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__NRRegistry_setSecureProperties___block_invoke_2;
  v4[3] = &unk_1E44961D8;
  v4[4] = v2;
  return objc_msgSend(v2, "grabRegistryWithReadBlockAsync:", v4);
}

- (NRRegistry)init
{
  return -[NRRegistry initWithParameters:](self, "initWithParameters:", 0);
}

- (NRRegistry)initWithParameters:(id)a3
{
  id v4;
  NRRegistry *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *managementQueue;
  NRBypassQueue *v12;
  NRBypassQueue *accessQueue;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NRRegistry;
  v5 = -[NRRegistry init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NRRegistryPlatformSupportsWatch"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v6, "BOOLValue");
    }
    else
    {
      objc_opt_self();
      if (qword_1ECE238F8 != -1)
        dispatch_once(&qword_1ECE238F8, &__block_literal_global_7);
      v8 = _MergedGlobals_10 != 0;
    }
    v5->_supportsWatch = v8;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.nanoregistry.registry.managementqueue", v9);
    managementQueue = v5->_managementQueue;
    v5->_managementQueue = (OS_dispatch_queue *)v10;

    v12 = objc_alloc_init(NRBypassQueue);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = v12;

    -[NRBypassQueue suspend](v5->_accessQueue, "suspend");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NRRegistryShouldCreateCollection"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14 || objc_msgSend(v14, "BOOLValue"))
    {
      v16 = (void *)objc_opt_new();
      -[NRRegistry setCollection:](v5, "setCollection:", v16);

    }
  }

  return v5;
}

- (void)setSecureProperties:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__NRRegistry_setSecureProperties___block_invoke;
  v6[3] = &unk_1E4495030;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NRRegistry performUnderCollectionLock:](self, "performUnderCollectionLock:", v6);

}

void __55__NRRegistry_addSecurePropertiesObserverWithReadBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend((id)objc_opt_class(), "_nextToken");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = v5;

  }
  v9 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  v8 = (void *)MEMORY[0x1A1B01DE4]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

void __44__NRRegistry_addDiffObserverWithWriteBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend((id)objc_opt_class(), "_nextToken");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 8);
    *(_QWORD *)(v6 + 8) = v5;

  }
  v9 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  v8 = (void *)MEMORY[0x1A1B01DE4]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

uint64_t __28__NRRegistry_setCollection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setQueueCollection:", *(_QWORD *)(a1 + 40));
}

- (void)setCollection:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__NRRegistry_setCollection___block_invoke;
  v6[3] = &unk_1E4495030;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NRRegistry performUnderCollectionLock:](self, "performUnderCollectionLock:", v6);

}

void __40__NRRegistry_grabRegistryWithReadBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "collection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "secureProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

uint64_t __55__NRRegistry_addSecurePropertiesObserverWithReadBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserversSecurePropertiesAreAvailableWithCollection:secureProperties:", a2, a3);
}

- (void)_notifyObserversSecurePropertiesAreAvailableWithCollection:(id)a3 secureProperties:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NRRegistry secureProperties](self, "secureProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__5;
    v24 = __Block_byref_object_dispose__5;
    v25 = 0;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __90__NRRegistry__notifyObserversSecurePropertiesAreAvailableWithCollection_secureProperties___block_invoke;
    v19[3] = &unk_1E4495A48;
    v19[4] = self;
    v19[5] = &v20;
    -[NRRegistry performUnderCollectionLock:](self, "performUnderCollectionLock:", v19);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = (id)v21[5];
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v26, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v9);
          v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend((id)v21[5], "objectForKeyedSubscript:", v13, (_QWORD)v15);
          v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id, id, uint64_t))v14)[2](v14, v6, v7, v13);

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v26, 16);
      }
      while (v10);
    }

    _Block_object_dispose(&v20, 8);
  }

}

uint64_t __34__NRRegistry_setSecureProperties___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserversSecurePropertiesAreAvailableWithCollection:secureProperties:", a2, a3);
}

- (id)addSecurePropertiesObserverWithReadBlock:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__NRRegistry_addSecurePropertiesObserverWithReadBlock___block_invoke;
  v10[3] = &unk_1E4495A20;
  v12 = &v13;
  v10[4] = self;
  v6 = v4;
  v11 = v6;
  -[NRRegistry performUnderCollectionLock:](self, "performUnderCollectionLock:", v10);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __55__NRRegistry_addSecurePropertiesObserverWithReadBlock___block_invoke_2;
  v9[3] = &unk_1E44961D8;
  v9[4] = self;
  -[NRRegistry grabRegistryWithReadBlock:](self, "grabRegistryWithReadBlock:", v9);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (void)grabRegistryWithReadBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__NRRegistry_grabRegistryWithReadBlock___block_invoke;
  v6[3] = &unk_1E4494DE0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NRRegistry enqueue:](self, "enqueue:", v6);

}

- (id)addDiffObserverWithWriteBlock:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
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
  v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__NRRegistry_addDiffObserverWithWriteBlock___block_invoke;
  v8[3] = &unk_1E4495A20;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[NRRegistry performUnderCollectionLock:](self, "performUnderCollectionLock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

+ (int)registerNotifyTokenWithName:(id)a3 withQueue:(id)a4 withBlock:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  const char *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  int v15;
  int out_token;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  out_token = -1;
  v10 = objc_retainAutorelease(v7);
  v11 = (const char *)objc_msgSend(v10, "UTF8String");
  if (v9)
  {
    if (!notify_register_dispatch(v11, &out_token, v8, v9))
      goto LABEL_9;
  }
  else if (!notify_register_check(v11, &out_token))
  {
    goto LABEL_9;
  }
  nr_framework_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

  if (v13)
  {
    nr_framework_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v10;
      _os_log_error_impl(&dword_1A0BDB000, v14, OS_LOG_TYPE_ERROR, "Failed to register block and get notify token for %@", buf, 0xCu);
    }

  }
LABEL_9:
  v15 = out_token;

  return v15;
}

- (void)enqueue:(id)a3
{
  -[NRBypassQueue enqueueBlock:](self->_accessQueue, "enqueueBlock:", a3);
}

- (BOOL)supportsWatch
{
  return self->_supportsWatch;
}

- (BOOL)enqueueUnlessSuspended:(id)a3
{
  _BOOL4 queueRunning;

  queueRunning = self->_queueRunning;
  if (self->_queueRunning)
    -[NRBypassQueue enqueueBlock:](self->_accessQueue, "enqueueBlock:", a3);
  return queueRunning;
}

- (void)enqueueBypassAsync:(id)a3
{
  -[NRBypassQueue enqueueBypassBlockAsync:](self->_accessQueue, "enqueueBypassBlockAsync:", a3);
}

void __28__NRRegistry__supportsWatch__block_invoke()
{
  char v0;
  id v1;

  if (MGGetBoolAnswer())
  {
    if (_NRIsDemoModeEnabled())
    {
      _MergedGlobals_10 = 1;
    }
    else
    {
      v1 = (id)MGGetStringAnswer();
      if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Watch")) & 1) != 0)
        v0 = 1;
      else
        v0 = MGGetBoolAnswer();
      _MergedGlobals_10 = v0;

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueCollection, 0);
  objc_storeStrong((id *)&self->_managementQueue, 0);
  objc_storeStrong((id *)&self->_secureProperties, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_registrySecurePropertyObservers, 0);
  objc_storeStrong((id *)&self->_registryDiffObservers, 0);
}

- (void)deasyncGrabRegistryWithReadBlock:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  dispatch_semaphore_t v9;
  id v10;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__NRRegistry_sync__deasyncGrabRegistryWithReadBlock___block_invoke;
  v8[3] = &unk_1E44954E0;
  v9 = v5;
  v10 = v4;
  v6 = v5;
  v7 = v4;
  -[NRRegistry grabRegistryWithReadBlockAsync:](self, "grabRegistryWithReadBlockAsync:", v8);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

}

intptr_t __53__NRRegistry_sync__deasyncGrabRegistryWithReadBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)deasyncGrabRegistryWithWriteBlock:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  dispatch_semaphore_t v9;
  id v10;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__NRRegistry_sync__deasyncGrabRegistryWithWriteBlock___block_invoke;
  v8[3] = &unk_1E4495508;
  v9 = v5;
  v10 = v4;
  v6 = v5;
  v7 = v4;
  -[NRRegistry grabRegistryWithWriteBlockAsync:](self, "grabRegistryWithWriteBlockAsync:", v8);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

}

id __54__NRRegistry_sync__deasyncGrabRegistryWithWriteBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "applyDiff:", v4);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

  return v4;
}

void __33__NRRegistry_setQueueCollection___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "secureProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_notifyDiffObserversWithDiff:deviceCollection:secureProperties:", v3, v4, v5);

  objc_msgSend(WeakRetained, "_notifyObserversSecurePropertiesAreAvailableWithCollection:secureProperties:", v4, v5);
}

- (void)enqueueAsync:(id)a3
{
  -[NRBypassQueue enqueueBlockAsync:](self->_accessQueue, "enqueueBlockAsync:", a3);
}

- (void)enqueueBypass:(id)a3
{
  -[NRBypassQueue enqueueBypassBlock:](self->_accessQueue, "enqueueBypassBlock:", a3);
}

- (void)grabRegistryWithReadBlockAsync:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__NRRegistry_grabRegistryWithReadBlockAsync___block_invoke;
  v6[3] = &unk_1E4494DE0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NRRegistry enqueueAsync:](self, "enqueueAsync:", v6);

}

void __45__NRRegistry_grabRegistryWithReadBlockAsync___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "collection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "secureProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

- (void)grabRegistryWithWriteBlockAsync:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  _QWORD *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__5;
  v9[4] = __Block_byref_object_dispose__5;
  v10 = (id)os_transaction_create();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__NRRegistry_grabRegistryWithWriteBlockAsync___block_invoke;
  v6[3] = &unk_1E44959D0;
  v5 = v4;
  v6[4] = self;
  v7 = v5;
  v8 = v9;
  -[NRRegistry enqueueAsync:](self, "enqueueAsync:", v6);

  _Block_object_dispose(v9, 8);
}

void __46__NRRegistry_grabRegistryWithWriteBlockAsync___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "secureProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "collection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "applyDiff:", v9);

  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

- (void)removeDiffObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__NRRegistry_removeDiffObserver___block_invoke;
  v6[3] = &unk_1E4495030;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NRRegistry performUnderCollectionLock:](self, "performUnderCollectionLock:", v6);

}

uint64_t __33__NRRegistry_removeDiffObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)_notifyDiffObserversWithDiff:(id)a3 deviceCollection:(id)a4 secureProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void (**v16)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__5;
  v26 = __Block_byref_object_dispose__5;
  v27 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __77__NRRegistry__notifyDiffObserversWithDiff_deviceCollection_secureProperties___block_invoke;
  v21[3] = &unk_1E4495A48;
  v21[4] = self;
  v21[5] = &v22;
  -[NRRegistry performUnderCollectionLock:](self, "performUnderCollectionLock:", v21);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = (id)v23[5];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v28, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v11);
        v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend((id)v23[5], "objectForKeyedSubscript:", v15, (_QWORD)v17);
        v16 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id, id, id, uint64_t))v16)[2](v16, v8, v9, v10, v15);

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v28, 16);
    }
    while (v12);
  }

  _Block_object_dispose(&v22, 8);
}

void __77__NRRegistry__notifyDiffObserversWithDiff_deviceCollection_secureProperties___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)removeSecurePropertiesObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__NRRegistry_removeSecurePropertiesObserver___block_invoke;
  v6[3] = &unk_1E4495030;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NRRegistry performUnderCollectionLock:](self, "performUnderCollectionLock:", v6);

}

uint64_t __45__NRRegistry_removeSecurePropertiesObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)invalidate
{
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD block[5];

  -[NRRegistry managementQueue](self, "managementQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__NRRegistry_invalidate__block_invoke;
  block[3] = &unk_1E4494FB8;
  block[4] = self;
  dispatch_sync(v3, block);

  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __24__NRRegistry_invalidate__block_invoke_2;
  v6[3] = &unk_1E4494FB8;
  v6[4] = self;
  -[NRRegistry enqueueAsync:](self, "enqueueAsync:", v6);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __24__NRRegistry_invalidate__block_invoke_3;
  v5[3] = &unk_1E4494FB8;
  v5[4] = self;
  -[NRRegistry performUnderCollectionLock:](self, "performUnderCollectionLock:", v5);
  -[NRBypassQueue invalidate](self->_accessQueue, "invalidate");
}

uint64_t __24__NRRegistry_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startQueue");
}

void __24__NRRegistry_invalidate__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "collection");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidate");

}

uint64_t __24__NRRegistry_invalidate__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
}

+ (id)getReferencedSecurePropertyIDsFromDiff:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v30;
    v21 = *(_QWORD *)v30;
    v22 = v3;
    do
    {
      v8 = 0;
      v23 = v5;
      do
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v8), v21, v22);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "changeType") != 2)
        {
          v24 = v8;
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          objc_msgSend(v9, "diff");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v26;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v26 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
                objc_msgSend(v9, "diff");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "objectForKeyedSubscript:", v15);
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v17, "changeType") != 2)
                {
                  objc_msgSend(v17, "diff");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "value");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    if (!v6)
                    {
                      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                      v6 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    objc_msgSend(v6, "addObject:", v19);
                  }

                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            }
            while (v12);
          }

          v7 = v21;
          v3 = v22;
          v5 = v23;
          v8 = v24;
        }

        ++v8;
      }
      while (v8 != v5);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)getReferencedSecureProperties:(id)a3 fromDiff:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "getReferencedSecurePropertyIDsFromDiff:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          if (!v11)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, v14);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (void)fixSecurePropertiesWithCollection:(id)a3 secureProperties:(id)a4 insecurePropertyNames:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  const char *v19;
  void *v20;
  void *v21;
  char isKindOfClass;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  NSObject *v32;
  _BOOL4 v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NRDevicePropertyDiff *v37;
  NRDevicePropertyDiffType *v38;
  NRDeviceDiff *v39;
  NRDeviceDiffType *v40;
  uint64_t v41;
  NSObject *v42;
  _BOOL4 v43;
  NSObject *v44;
  NRDeviceCollectionDiff *v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  id obj;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint8_t v64[128];
  uint8_t buf[4];
  const char *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v54 = a4;
  v8 = a5;
  nr_daemon_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    nr_daemon_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v66 = "+[NRRegistry fixSecurePropertiesWithCollection:secureProperties:insecurePropertyNames:]";
      _os_log_impl(&dword_1A0BDB000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v7;
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  if (v49)
  {
    v48 = *(_QWORD *)v60;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v60 != v48)
          objc_enumerationMutation(obj);
        v51 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v12);
        v52 = v12;
        objc_msgSend(obj, "objectForKeyedSubscript:", v47);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v56;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v56 != v17)
                objc_enumerationMutation(v14);
              v19 = *(const char **)(*((_QWORD *)&v55 + 1) + 8 * i);
              if (!objc_msgSend(v8, "containsObject:", v19))
                goto LABEL_51;
              objc_msgSend(v14, "objectForKeyedSubscript:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "value");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) != 0)
              {
                nr_daemon_log();
                v23 = objc_claimAutoreleasedReturnValue();
                v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

                if (v24)
                {
                  nr_daemon_log();
                  v25 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v66 = v19;
                    _os_log_impl(&dword_1A0BDB000, v25, OS_LOG_TYPE_DEFAULT, "Property %@ was marked as secure but is now in allowlist, converting to insecure property", buf, 0xCu);
                  }

                }
                objc_msgSend(v14, "objectForKeyedSubscript:", v19);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "value");
                v27 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v54, "securePropertyForID:", v27);
                v28 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
LABEL_51:
                if ((objc_msgSend(v8, "containsObject:", v19) & 1) != 0)
                  continue;
                objc_msgSend(v14, "objectForKeyedSubscript:", v19);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "value");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v31 = objc_opt_isKindOfClass();

                if ((v31 & 1) != 0)
                  continue;
                nr_daemon_log();
                v32 = objc_claimAutoreleasedReturnValue();
                v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

                if (v33)
                {
                  nr_daemon_log();
                  v34 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v66 = v19;
                    _os_log_impl(&dword_1A0BDB000, v34, OS_LOG_TYPE_DEFAULT, "Property %@ is not in allowlist and is stored as insecure, converting to secure property", buf, 0xCu);
                  }

                }
                objc_msgSend(v14, "objectForKeyedSubscript:", v19);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "value");
                v27 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v54, "storeSecureProperty:", v27);
                v28 = objc_claimAutoreleasedReturnValue();
              }
              v36 = (void *)v28;
              if (v28)
              {
                v37 = -[NRDevicePropertyDiff initWithValue:]([NRDevicePropertyDiff alloc], "initWithValue:", v28);
                v38 = -[NRDevicePropertyDiffType initWithDiff:andChangeType:]([NRDevicePropertyDiffType alloc], "initWithDiff:andChangeType:", v37, 1);
                objc_msgSend(v53, "setObject:forKeyedSubscript:", v38, v19);

              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
          }
          while (v16);
        }

        if (objc_msgSend(v53, "count"))
        {
          v39 = -[NRDeviceDiff initWithDiffPropertyDiffs:]([NRDeviceDiff alloc], "initWithDiffPropertyDiffs:", v53);
          v40 = -[NRDeviceDiffType initWithDiff:andChangeType:]([NRDeviceDiffType alloc], "initWithDiff:andChangeType:", v39, 1);
          objc_msgSend(v47, "setObject:forKeyedSubscript:", v40, v51);

        }
        v12 = v52 + 1;
      }
      while (v52 + 1 != v49);
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    }
    while (v49);
  }

  v41 = objc_msgSend(v47, "count");
  nr_daemon_log();
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);

  if (v41)
  {
    if (v43)
    {
      nr_daemon_log();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v66 = "+[NRRegistry fixSecurePropertiesWithCollection:secureProperties:insecurePropertyNames:]";
        _os_log_impl(&dword_1A0BDB000, v44, OS_LOG_TYPE_DEFAULT, "%s: Updating some allowlisted properties", buf, 0xCu);
      }

    }
    v45 = -[NRDeviceCollectionDiff initWithDeviceCollectionDiffDeviceDiffs:]([NRDeviceCollectionDiff alloc], "initWithDeviceCollectionDiffDeviceDiffs:", v47);
    v46 = (id)objc_msgSend(obj, "applyDiff:", v45);
  }
  else
  {
    if (!v43)
      goto LABEL_45;
    nr_daemon_log();
    v45 = (NRDeviceCollectionDiff *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v45->super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v66 = "+[NRRegistry fixSecurePropertiesWithCollection:secureProperties:insecurePropertyNames:]";
      _os_log_impl(&dword_1A0BDB000, &v45->super.super, OS_LOG_TYPE_DEFAULT, "%s: Not updating any properties", buf, 0xCu);
    }
  }

LABEL_45:
}

+ (unint64_t)readNotifyToken:(int)a3
{
  uint64_t state64;

  if (a3 == -1)
    return 0;
  state64 = 0;
  if (notify_get_state(a3, &state64))
    return 0;
  else
    return state64;
}

- (NRMutableDeviceCollection)queueCollection
{
  return self->_queueCollection;
}

@end

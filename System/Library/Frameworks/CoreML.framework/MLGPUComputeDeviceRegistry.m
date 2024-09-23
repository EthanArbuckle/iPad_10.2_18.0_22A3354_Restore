@implementation MLGPUComputeDeviceRegistry

- (NSArray)registeredComputeDevices
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  std::mutex *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = (std::mutex *)((char *)self + 8);
  std::mutex::lock((std::mutex *)((char *)self + 8));
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[MLGPUComputeDeviceRegistry pendingChanges](self, "pendingChanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v7, "metalDevice");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "changeType");
        if (v9)
        {
          if (v9 != 1)
            goto LABEL_11;
          -[MLGPUComputeDeviceRegistry availableGPUDevices](self, "availableGPUDevices");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v8, "registryID"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "removeObjectForKey:", v11);
        }
        else
        {
          +[MLGPUComputeDevice deviceWithMetalDevice:](MLGPUComputeDevice, "deviceWithMetalDevice:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLGPUComputeDeviceRegistry availableGPUDevices](self, "availableGPUDevices");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v8, "registryID"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

        }
LABEL_11:

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }

  -[MLGPUComputeDeviceRegistry pendingChanges](self, "pendingChanges");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

  -[MLGPUComputeDeviceRegistry availableGPUDevices](self, "availableGPUDevices");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  std::mutex::unlock(v17);
  return (NSArray *)v15;
}

- (NSMutableArray)pendingChanges
{
  return (NSMutableArray *)*((_QWORD *)self + 10);
}

- (NSMutableDictionary)availableGPUDevices
{
  return (NSMutableDictionary *)*((_QWORD *)self + 9);
}

+ (id)sharedRegistry
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MLGPUComputeDeviceRegistry_sharedRegistry__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[MLGPUComputeDeviceRegistry sharedRegistry]::onceToken != -1)
    dispatch_once(&+[MLGPUComputeDeviceRegistry sharedRegistry]::onceToken, block);
  return (id)+[MLGPUComputeDeviceRegistry sharedRegistry]::registry;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 850045863;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_QWORD *)self + 8) = 0;
  return self;
}

void __44__MLGPUComputeDeviceRegistry_sharedRegistry__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  v4 = (id)objc_opt_new();
  objc_msgSend(v1, "registryWithMetalDeviceObserver:");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)+[MLGPUComputeDeviceRegistry sharedRegistry]::registry;
  +[MLGPUComputeDeviceRegistry sharedRegistry]::registry = v2;

}

+ (id)registryWithMetalDeviceObserver:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMetalDeviceObserver:", v4);
  objc_msgSend(v5, "registerGPUDevices");

  return v5;
}

- (void)registerGPUDevices
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  std::mutex *v12;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v21 = 0;
  -[MLGPUComputeDeviceRegistry metalDeviceObserver](self, "metalDeviceObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __48__MLGPUComputeDeviceRegistry_registerGPUDevices__block_invoke;
  v19[3] = &unk_1E3D64B38;
  v11 = &v20;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v3, "startObservingWithBlock:deviceObserver:", v19, &v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLGPUComputeDeviceRegistry setObservationToken:](self, "setObservationToken:", v21);
  v12 = (std::mutex *)((char *)self + 8);
  std::mutex::lock((std::mutex *)((char *)self + 8));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = v13;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        +[MLGPUComputeDevice deviceWithMetalDevice:](MLGPUComputeDevice, "deviceWithMetalDevice:", v7, v11, v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLGPUComputeDeviceRegistry availableGPUDevices](self, "availableGPUDevices");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v7, "registryID"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v4);
  }

  std::mutex::unlock(v12);
  objc_destroyWeak(v11);

  objc_destroyWeak(&location);
}

- (void)setObservationToken:(id)a3
{
  objc_storeStrong((id *)self + 12, a3);
}

- (MLMetalDeviceObserver)metalDeviceObserver
{
  return (MLMetalDeviceObserver *)*((_QWORD *)self + 11);
}

- (MLGPUComputeDeviceRegistry)initWithMetalDeviceObserver:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MLGPUComputeDeviceRegistry;
  v6 = -[MLGPUComputeDeviceRegistry init](&v12, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v6 + 9);
    *((_QWORD *)v6 + 9) = v7;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v6 + 10);
    *((_QWORD *)v6 + 10) = v9;

    objc_storeStrong((id *)v6 + 11, a3);
  }

  return (MLGPUComputeDeviceRegistry *)v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[MLGPUComputeDeviceRegistry metalDeviceObserver](self, "metalDeviceObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLGPUComputeDeviceRegistry observationToken](self, "observationToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopObserving:", v4);

  v5.receiver = self;
  v5.super_class = (Class)MLGPUComputeDeviceRegistry;
  -[MLGPUComputeDeviceRegistry dealloc](&v5, sel_dealloc);
}

- (NSObject)observationToken
{
  return *((_QWORD *)self + 12);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 12, 0);
  objc_storeStrong((id *)self + 11, 0);
  objc_storeStrong((id *)self + 10, 0);
  objc_storeStrong((id *)self + 9, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 8));
}

void __48__MLGPUComputeDeviceRegistry_registerGPUDevices__block_invoke(uint64_t a1, void *a2)
{
  char *WeakRetained;
  char *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    std::mutex::lock((std::mutex *)(WeakRetained + 8));
    objc_msgSend(v4, "pendingChanges");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    std::mutex::unlock((std::mutex *)(v4 + 8));
  }

}

@end

@implementation HMDBackingStoreSingleton

- (NSMapTable)classToNameTransform
{
  return self->_classToNameTransform;
}

+ (id)sharedInstance
{
  return (id)_sharedInstance;
}

+ (HMFVersion)dataVersion
{
  return (HMFVersion *)+[HMDHomeKitVersion currentVersion](HMDHomeKitVersion, "currentVersion");
}

- (HMDBackingStoreSingleton)init
{
  HMDBackingStoreSingleton *v2;
  uint64_t v3;
  NSMapTable *objectLookup;
  uint64_t v5;
  NSMapTable *classToNameTransform;
  uint64_t v7;
  NSMapTable *nameToClassTransform;
  uint64_t v9;
  NSMapTable *objectPropertyHashLookup;
  NSOperationQueue *v11;
  NSOperationQueue *queue;
  id v13;
  HMDBackingStoreLocal *v14;
  id v15;
  uint64_t v16;
  HMDBackingStoreLocal *local;
  void *v18;
  HMDBackingStoreSingleton *v19;
  NSObject *v20;
  void *v21;
  HMDBackingStoreSingleton *v22;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)HMDBackingStoreSingleton;
  v2 = -[HMDBackingStoreSingleton init](&v24, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    objectLookup = v2->_objectLookup;
    v2->_objectLookup = (NSMapTable *)v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    classToNameTransform = v2->_classToNameTransform;
    v2->_classToNameTransform = (NSMapTable *)v5;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    nameToClassTransform = v2->_nameToClassTransform;
    v2->_nameToClassTransform = (NSMapTable *)v7;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    objectPropertyHashLookup = v2->_objectPropertyHashLookup;
    v2->_objectPropertyHashLookup = (NSMapTable *)v9;

    v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    queue = v2->_queue;
    v2->_queue = v11;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_queue, "setMaxConcurrentOperationCount:", 1);
    if (isWatch())
    {
      v13 = (id)sqlitePath;
      +[HMDBackingStoreLocal cleanDatastoreFilesAt:everything:](HMDBackingStoreLocal, "cleanDatastoreFilesAt:everything:", v13, 1);

    }
    else
    {
      v14 = [HMDBackingStoreLocal alloc];
      v15 = (id)sqlitePath;
      v16 = -[HMDBackingStoreLocal initWithDatastore:](v14, "initWithDatastore:", v15);
      local = v2->_local;
      v2->_local = (HMDBackingStoreLocal *)v16;

      if (!v2->_local)
      {
        v18 = (void *)MEMORY[0x1D17BA0A0]();
        v19 = v2;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v26 = v21;
          _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to create our local storage.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v18);
      }
    }
    v22 = v2;
  }

  return v2;
}

- (id)schemaHashForObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[HMDBackingStoreSingleton objectPropertyHashLookup](self, "objectPropertyHashLookup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bsoType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend((id)objc_opt_class(), "bsoSchemaHash");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBackingStoreSingleton objectPropertyHashLookup](self, "objectPropertyHashLookup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bsoType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, v9);

  }
  v10 = v7;

  return v10;
}

- (id)flushBackingStore
{
  void *v2;
  void *v3;

  -[HMDBackingStoreSingleton local](self, "local");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flush:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)resetBackingStore
{
  void *v2;
  void *v3;

  -[HMDBackingStoreSingleton local](self, "local");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flush:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setHomeManager:(id)a3
{
  id v4;
  HMDHomeManager **p_homeManager;
  id WeakRetained;
  void *v7;
  HMDBackingStoreSingleton *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_homeManager = &self->_homeManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);

  if (WeakRetained)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_FAULT, "%{public}@HMDBackingStoreSingleton's homeManager is being set more than once per process lifecycle", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }
  objc_storeWeak((id *)p_homeManager, v4);

}

- (id)logIdentifier
{
  return CFSTR("BackingStoreSingleton");
}

- (NSMapTable)objectLookup
{
  return self->_objectLookup;
}

- (NSMapTable)nameToClassTransform
{
  return self->_nameToClassTransform;
}

- (NSMapTable)objectPropertyHashLookup
{
  return self->_objectPropertyHashLookup;
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (HMDBackingStoreLocal)local
{
  return self->_local;
}

- (void)setLocal:(id)a3
{
  objc_storeStrong((id *)&self->_local, a3);
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_local, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_objectPropertyHashLookup, 0);
  objc_storeStrong((id *)&self->_nameToClassTransform, 0);
  objc_storeStrong((id *)&self->_classToNameTransform, 0);
  objc_storeStrong((id *)&self->_objectLookup, 0);
}

+ (void)start
{
  if (start_onceToken != -1)
    dispatch_once(&start_onceToken, &__block_literal_global_245);
}

+ (void)setClass:(Class)a3 forClassName:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  v14 = a4;
  +[HMDBackingStoreSingleton sharedInstance](HMDBackingStoreSingleton, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nameToClassTransform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "objectForKey:", v14);

  if (v7)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99768];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Only one class name transformation for %@ may be specified in the BackingStore"), v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v12, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v13);
  }
  objc_msgSend(v5, "nameToClassTransform");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", a3, v14);

  objc_msgSend(v5, "classToNameTransform");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v14, a3);

}

+ (void)resetClassMappings
{
  void *v2;
  void *v3;
  id v4;

  +[HMDBackingStoreSingleton sharedInstance](HMDBackingStoreSingleton, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nameToClassTransform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  objc_msgSend(v4, "classToNameTransform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

}

+ (void)resetSchemaHash
{
  void *v2;
  id v3;

  +[HMDBackingStoreSingleton sharedInstance](HMDBackingStoreSingleton, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectPropertyHashLookup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t50_156812 != -1)
    dispatch_once(&logCategory__hmf_once_t50_156812, &__block_literal_global_256_156813);
  return (id)logCategory__hmf_once_v51_156814;
}

void __39__HMDBackingStoreSingleton_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v51_156814;
  logCategory__hmf_once_v51_156814 = v0;

}

void __33__HMDBackingStoreSingleton_start__block_invoke()
{
  void *v0;
  void *v1;
  HMDBackingStoreSingleton *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1D17BA0A0]();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28628]), "initWithName:", CFSTR("com.apple.homed.sqlite3-init."));
  v2 = objc_alloc_init(HMDBackingStoreSingleton);
  v3 = (void *)_sharedInstance;
  _sharedInstance = (uint64_t)v2;

  objc_autoreleasePoolPop(v0);
}

@end

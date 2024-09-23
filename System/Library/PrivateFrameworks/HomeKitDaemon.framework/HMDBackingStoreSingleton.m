@implementation HMDBackingStoreSingleton

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
  HMDBackingStoreLocal *v13;
  id v14;
  uint64_t v15;
  HMDBackingStoreLocal *local;
  void *v17;
  HMDBackingStoreSingleton *v18;
  NSObject *v19;
  void *v20;
  HMDBackingStoreSingleton *v21;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v23.receiver = self;
  v23.super_class = (Class)HMDBackingStoreSingleton;
  v2 = -[HMDBackingStoreSingleton init](&v23, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    objectLookup = v2->_objectLookup;
    v2->_objectLookup = (NSMapTable *)v3;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    classToNameTransform = v2->_classToNameTransform;
    v2->_classToNameTransform = (NSMapTable *)v5;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    nameToClassTransform = v2->_nameToClassTransform;
    v2->_nameToClassTransform = (NSMapTable *)v7;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    objectPropertyHashLookup = v2->_objectPropertyHashLookup;
    v2->_objectPropertyHashLookup = (NSMapTable *)v9;

    v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    queue = v2->_queue;
    v2->_queue = v11;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_queue, "setMaxConcurrentOperationCount:", 1);
    isWatch();
    v13 = [HMDBackingStoreLocal alloc];
    v14 = (id)sqlitePath;
    v15 = -[HMDBackingStoreLocal initWithDatastore:](v13, "initWithDatastore:", v14);
    local = v2->_local;
    v2->_local = (HMDBackingStoreLocal *)v15;

    if (!v2->_local)
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = v2;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v20;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to create our local storage.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
    }
    v21 = v2;
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
  void *v3;
  NSObject *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v5;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@+[%@ %@] no-op because CoreData storage is enabled", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  return 0;
}

- (id)resetBackingStore
{
  void *v3;
  NSObject *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v5;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@+[%@ %@] no-op because CoreData storage is enabled", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  return 0;
}

- (void)setHomeManager:(id)a3
{
  id v5;
  void *v6;
  HMDBackingStoreSingleton *v7;
  NSObject *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v9;
    v15 = 2112;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@-[%@ %@] no-op because CoreData storage is enabled", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v6);

}

- (id)logIdentifier
{
  return CFSTR("BackingStoreSingleton");
}

- (NSMapTable)objectLookup
{
  return self->_objectLookup;
}

- (NSMapTable)classToNameTransform
{
  return self->_classToNameTransform;
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

+ (HMFVersion)dataVersion
{
  return (HMFVersion *)+[HMDHomeKitVersion currentVersion](HMDHomeKitVersion, "currentVersion");
}

+ (void)start
{
  void *v3;
  NSObject *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v5;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@+[%@ %@] no-op because CoreData storage is enabled", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
}

+ (id)sharedInstance
{
  return 0;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t25_216504 != -1)
    dispatch_once(&logCategory__hmf_once_t25_216504, &__block_literal_global_252_216505);
  return (id)logCategory__hmf_once_v26_216506;
}

void __39__HMDBackingStoreSingleton_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v26_216506;
  logCategory__hmf_once_v26_216506 = v0;

}

@end

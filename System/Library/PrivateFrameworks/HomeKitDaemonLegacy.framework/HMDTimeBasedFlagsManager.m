@implementation HMDTimeBasedFlagsManager

- (HMDTimeBasedFlagsManager)initWithDateProvider:(id)a3
{
  id v4;
  HMDPersistentStore *v5;
  HMDTimeBasedFlagsPersistentStore *v6;
  HMDTimeBasedFlagsManager *v7;

  v4 = a3;
  v5 = objc_alloc_init(HMDPersistentStore);
  v6 = -[HMDTimeBasedFlagsPersistentStore initWithPersistentStore:]([HMDTimeBasedFlagsPersistentStore alloc], "initWithPersistentStore:", v5);
  v7 = -[HMDTimeBasedFlagsManager initWithStorage:dateProvider:](self, "initWithStorage:dateProvider:", v6, v4);

  if (v7)
    objc_storeStrong((id *)&v7->_persistentStore, v5);

  return v7;
}

- (HMDTimeBasedFlagsManager)initWithStorage:(id)a3 dateProvider:(id)a4
{
  id v7;
  id v8;
  HMDTimeBasedFlagsManager *v9;
  HMDTimeBasedFlagsManager *v10;
  id v11;
  const char *v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *workQueue;
  uint64_t v17;
  NSMutableDictionary *flags;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HMDTimeBasedFlagsManager;
  v9 = -[HMDTimeBasedFlagsManager init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_flagsStorage, a3);
    objc_storeStrong((id *)&v10->_dateProvider, a4);
    HMDispatchQueueNameString();
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const char *)objc_msgSend(v11, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_BACKGROUND, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create(v12, v14);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v15;

    -[HMDTimeBasedFlagsManager unarchiveFlags](v10, "unarchiveFlags");
    v17 = objc_claimAutoreleasedReturnValue();
    flags = v10->_flags;
    v10->_flags = (NSMutableDictionary *)v17;

  }
  return v10;
}

- (id)flagForName:(id)a3 periodicity:(int64_t)a4
{
  void *v6;
  void *v7;

  +[HMDTimeBasedFlagNameSpecifier specifierWithFlagName:](HMDTimeBasedFlagNameSpecifier, "specifierWithFlagName:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimeBasedFlagsManager flagForSpecifier:periodicity:](self, "flagForSpecifier:periodicity:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)flagForName:(id)a3 homeUUID:(id)a4 periodicity:(int64_t)a5
{
  void *v7;
  void *v8;

  +[HMDTimeBasedFlagNameAndHomeSpecifier specifierWithFlagName:homeUUID:](HMDTimeBasedFlagNameAndHomeSpecifier, "specifierWithFlagName:homeUUID:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimeBasedFlagsManager flagForSpecifier:periodicity:](self, "flagForSpecifier:periodicity:", v7, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)flagForSpecifier:(id)a3 periodicity:(int64_t)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v14;
  void *v15;
  id v16;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDTimeBasedFlagsManager flags](self, "flags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    +[HMDTimeBasedFlagsManager allowedSpecifierClasses](HMDTimeBasedFlagsManager, "allowedSpecifierClasses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", objc_opt_class());

    if ((v11 & 1) == 0)
    {
      v14 = (void *)MEMORY[0x1E0C99DA0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Specifier's class must be registered in the allowedSpecifierClasses in HMDTimeBasedFlagsManager: %@"), objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v15, 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v16);
    }
    v9 = -[HMDTimeBasedFlagsManager newFlagForPeriodicity:](self, "newFlagForPeriodicity:", a4);
    -[HMDTimeBasedFlagsManager flags](self, "flags");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, v6);

  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (id)newFlagForPeriodicity:(int64_t)a3
{
  HMDTimeBasedFlagDaily *v4;
  void *v5;
  HMDTimeBasedFlagDaily *v6;

  if (a3 != 1)
    return 0;
  v4 = [HMDTimeBasedFlagDaily alloc];
  -[HMDTimeBasedFlagsManager dateProvider](self, "dateProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDTimeBasedFlagDaily initWithContext:dateProvider:](v4, "initWithContext:dateProvider:", self, v5);

  return v6;
}

- (void)forceSave
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDTimeBasedFlagsManager _save](self, "_save");
  os_unfair_lock_unlock(p_lock);
}

- (id)_fetchAllFlags
{
  void *v3;
  NSMutableDictionary *flags;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  flags = self->_flags;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__HMDTimeBasedFlagsManager__fetchAllFlags__block_invoke;
  v8[3] = &unk_1E89AD5D0;
  v9 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](flags, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (void)_save
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  os_unfair_lock_assert_owner(&self->_lock);
  -[HMDTimeBasedFlagsManager _fetchAllFlags](self, "_fetchAllFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimeBasedFlagsManager workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__HMDTimeBasedFlagsManager__save__block_invoke;
  v6[3] = &unk_1E89C2328;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

- (id)unarchiveFlags
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDTimeBasedFlagsManager *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  HMDTimeBasedFlagsManager *v16;
  NSObject *v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimeBasedFlagsManager flagsStorage](self, "flagsStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchive");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_5;
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v23 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Loading legacy flags", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDTimeBasedFlagsManager unarchiveLegacyFlags](v7, "unarchiveLegacyFlags");
  v10 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v10;
  if (v10)
  {
LABEL_5:
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __42__HMDTimeBasedFlagsManager_unarchiveFlags__block_invoke;
    v20[3] = &unk_1E89AD5F8;
    v20[4] = self;
    v21 = v3;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v20);

  }
  v15 = (void *)MEMORY[0x1D17BA0A0](v10, v11, v12, v13, v14);
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v18;
    v24 = 2112;
    v25 = v3;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Final restored flags: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  return v3;
}

- (id)unarchiveLegacyFlags
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  HMDTimeBasedFlagsManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  HMDTimeBasedFlagsManager *v28;
  NSObject *v29;
  void *v30;
  void *v32;
  id obj;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  -[HMDTimeBasedFlagsManager flagsStorage](self, "flagsStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unarchiveLegacyEventFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDEventFlagsArchivedEventFlagsKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDEventFlagsArchivedEventFlagsSaveTimeKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v5 && v6)
    {
      v32 = v4;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      objc_msgSend(v5, "allKeys");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (v35)
      {
        v34 = *(_QWORD *)v43;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v43 != v34)
              objc_enumerationMutation(obj);
            v36 = v8;
            v9 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v8);
            v38 = 0u;
            v39 = 0u;
            v40 = 0u;
            v41 = 0u;
            objc_msgSend(v5, "objectForKeyedSubscript:", v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "allKeys");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
            if (v12)
            {
              v13 = v12;
              v14 = *(_QWORD *)v39;
              do
              {
                for (i = 0; i != v13; ++i)
                {
                  if (*(_QWORD *)v39 != v14)
                    objc_enumerationMutation(v11);
                  v16 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
                  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "objectForKeyedSubscript:", v16);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();

                  +[HMDTimeBasedFlagDaily convertLegacyFlagBits:lastSaveTIme:](HMDTimeBasedFlagDaily, "convertLegacyFlagBits:lastSaveTIme:", v18, v7);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v19)
                  {
                    +[HMDTimeBasedFlagNameSpecifier specifierWithFlagName:](HMDTimeBasedFlagNameSpecifier, "specifierWithFlagName:", v16);
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v37, "setObject:forKey:", v19, v20);

                  }
                }
                v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
              }
              while (v13);
            }

            v8 = v36 + 1;
          }
          while (v36 + 1 != v35);
          v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        }
        while (v35);
      }

      if (objc_msgSend(v37, "count"))
        v21 = v37;
      else
        v21 = 0;
      v22 = v21;

      v4 = v32;
    }
    else
    {
      v27 = (void *)MEMORY[0x1D17BA0A0]();
      v28 = self;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v30;
        _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Legacy flags missing data", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v27);
      v22 = 0;
    }

  }
  else
  {
    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v26;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@No legacy event flags found", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    v22 = 0;
  }

  return v22;
}

- (HMMDateProvider)dateProvider
{
  return (HMMDateProvider *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDateProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableDictionary)flags
{
  return self->_flags;
}

- (void)setFlags:(id)a3
{
  objc_storeStrong((id *)&self->_flags, a3);
}

- (HMDTimeBasedFlagsStoring)flagsStorage
{
  return (HMDTimeBasedFlagsStoring *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_flagsStorage, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_persistentStore, 0);
}

void __42__HMDTimeBasedFlagsManager_unarchiveFlags__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  HMDTimeBasedFlagDaily *v9;
  void *v10;
  void *v11;
  HMDTimeBasedFlagDaily *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("periodicity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    if (objc_msgSend(v8, "integerValue") == 1)
    {
      v9 = [HMDTimeBasedFlagDaily alloc];
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v10, "dateProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[HMDTimeBasedFlagDaily initWithSerializedFlag:context:dateProvider:](v9, "initWithSerializedFlag:context:dateProvider:", v5, v10, v11);

    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v12, v13);

  }
}

void __33__HMDTimeBasedFlagsManager__save__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "flagsStorage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "archiveDictionary:", *(_QWORD *)(a1 + 40));

}

void __42__HMDTimeBasedFlagsManager__fetchAllFlags__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a3, "serializeToDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

+ (NSSet)allowedSpecifierClasses
{
  if (allowedSpecifierClasses__hmf_once_t4 != -1)
    dispatch_once(&allowedSpecifierClasses__hmf_once_t4, &__block_literal_global_61343);
  return (NSSet *)(id)allowedSpecifierClasses__hmf_once_v5;
}

void __51__HMDTimeBasedFlagsManager_allowedSpecifierClasses__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)allowedSpecifierClasses__hmf_once_v5;
  allowedSpecifierClasses__hmf_once_v5 = v2;

}

@end

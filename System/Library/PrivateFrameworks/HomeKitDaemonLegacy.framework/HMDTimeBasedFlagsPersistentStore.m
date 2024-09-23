@implementation HMDTimeBasedFlagsPersistentStore

- (HMDTimeBasedFlagsPersistentStore)initWithPersistentStore:(id)a3
{
  id v4;
  HMDTimeBasedFlagsPersistentStore *v5;
  HMDTimeBasedFlagsPersistentStore *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDTimeBasedFlagsPersistentStore;
  v5 = -[HMDTimeBasedFlagsPersistentStore init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_persistentStore, v4);

  return v6;
}

- (void)archiveDictionary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, CFSTR("HMDTimeBasedFlagsArchivedFlagsKey"));
  v7 = (id)eventFlagsDataStorePath;
  -[HMDTimeBasedFlagsPersistentStore persistentStore](self, "persistentStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "archiveDictionary:withPath:forKey:", v10, v7, CFSTR("HMDTimeBasedFlagsDataStore"));

}

- (id)unarchive
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDTimeBasedFlagsPersistentStore *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v3 = (id)eventFlagsDataStorePath;
  +[HMDTimeBasedFlagsManager allowedSpecifierClasses](HMDTimeBasedFlagsManager, "allowedSpecifierClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  v21[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDTimeBasedFlagsPersistentStore persistentStore](self, "persistentStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unarchiveDictionaryWithPath:allowedClasses:forKey:", v3, v6, CFSTR("HMDTimeBasedFlagsDataStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v13;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Unarchived flags store: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HMDTimeBasedFlagsArchivedFlagsKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v15;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@No time-based flag archive found", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v14 = 0;
  }

  return v14;
}

- (id)unarchiveLegacyEventFlags
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (id)eventFlagsDataStorePath;
  -[HMDTimeBasedFlagsPersistentStore persistentStore](self, "persistentStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchiveDictionaryWithPath:allowedClasses:forKey:", v3, v7, CFSTR("HMDEventFlagsDataStoreKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HMDPersistentStore)persistentStore
{
  return (HMDPersistentStore *)objc_loadWeakRetained((id *)&self->_persistentStore);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_persistentStore);
}

@end

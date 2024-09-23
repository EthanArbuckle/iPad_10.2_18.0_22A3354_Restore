@implementation HMDCompositeSettingsOwnerToDatabaseAdapterRegistry

- (HMDCompositeSettingsOwnerToDatabaseAdapterRegistry)init
{
  HMDCompositeSettingsOwnerToDatabaseAdapterRegistry *v2;
  uint64_t v3;
  NSMapTable *settingOwnerToDatabaseAdapterTable;
  uint64_t v5;
  NSMapTable *settingOwnerToZoneManagerTable;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDCompositeSettingsOwnerToDatabaseAdapterRegistry;
  v2 = -[HMDCompositeSettingsOwnerToDatabaseAdapterRegistry init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    settingOwnerToDatabaseAdapterTable = v2->_settingOwnerToDatabaseAdapterTable;
    v2->_settingOwnerToDatabaseAdapterTable = (NSMapTable *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    settingOwnerToZoneManagerTable = v2->_settingOwnerToZoneManagerTable;
    v2->_settingOwnerToZoneManagerTable = (NSMapTable *)v5;

  }
  return v2;
}

- (id)databaseAdapterForUUID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  const char *v6;
  id Property;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self)
    Property = objc_getProperty(self, v6, 16, 1);
  else
    Property = 0;
  v8 = Property;
  v9 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (void)createDatabaseAdapterIfNotExistForUUID:(id)a3 homeUUID:(id)a4 accessory:(id)a5 workQueue:(id)a6 zoneName:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  os_unfair_lock_s *p_lock;
  NSMapTable *settingOwnerToDatabaseAdapterTable;
  void *v18;
  void *v19;
  SEL v20;
  id v21;
  HMDCompositeSettingsZoneManager *v22;
  HMDCompositeSettingsZoneManager *v23;
  void *v24;
  HMDCompositeSettingsLegacyDatabaseAdapter *v25;
  SEL v26;
  id v27;
  id v28;

  v28 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  settingOwnerToDatabaseAdapterTable = self->_settingOwnerToDatabaseAdapterTable;
  v18 = (void *)objc_msgSend(v28, "copy");
  -[NSMapTable objectForKey:](settingOwnerToDatabaseAdapterTable, "objectForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_getProperty(self, v20, 24, 1);
  objc_msgSend(v21, "objectForKey:", v12);
  v22 = (HMDCompositeSettingsZoneManager *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    v23 = [HMDCompositeSettingsZoneManager alloc];
    +[HMDDatabase defaultDatabase](HMDDatabase, "defaultDatabase");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[HMDCompositeSettingsZoneManager initWithDatabase:workQueue:zoneName:createZoneIfNotExists:](v23, "initWithDatabase:workQueue:zoneName:createZoneIfNotExists:", v24, v14, v15, 1);

    -[NSMapTable setObject:forKey:](self->_settingOwnerToZoneManagerTable, "setObject:forKey:", v22, v12);
  }
  if (!v19)
  {
    v25 = -[HMDCompositeSettingsLegacyDatabaseAdapter initWithZoneManager:modelClass:]([HMDCompositeSettingsLegacyDatabaseAdapter alloc], "initWithZoneManager:modelClass:", v22, objc_opt_class());
    v27 = objc_getProperty(self, v26, 16, 1);
    objc_msgSend(v27, "setObject:forKey:", v25, v28);

  }
  os_unfair_lock_unlock(p_lock);

}

- (void)removeZoneWithZoneName:(id)a3 uuid:(id)a4 workQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDCompositeSettingsOwnerToDatabaseAdapterRegistry *v12;
  NSObject *v13;
  void *v14;
  os_unfair_lock_s *p_lock;
  HMDCompositeSettingsZoneManager *v16;
  HMDCompositeSettingsZoneManager *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v14;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Asked to remove zone:%@", (uint8_t *)&v19, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  p_lock = &v12->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMapTable objectForKey:](v12->_settingOwnerToZoneManagerTable, "objectForKey:", v9);
  v16 = (HMDCompositeSettingsZoneManager *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (!v16)
  {
    v17 = [HMDCompositeSettingsZoneManager alloc];
    +[HMDDatabase defaultDatabase](HMDDatabase, "defaultDatabase");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HMDCompositeSettingsZoneManager initWithDatabase:workQueue:zoneName:createZoneIfNotExists:](v17, "initWithDatabase:workQueue:zoneName:createZoneIfNotExists:", v18, v10, v8, 0);

  }
  -[HMDCompositeSettingsZoneManager remove](v16, "remove");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingOwnerToZoneManagerTable, 0);
  objc_storeStrong((id *)&self->_settingOwnerToDatabaseAdapterTable, 0);
}

@end

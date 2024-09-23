@implementation HMDCompositeSettingsOwnerToDatabaseAdapterRegistry

- (HMDCompositeSettingsOwnerToDatabaseAdapterRegistry)init
{
  HMDCompositeSettingsOwnerToDatabaseAdapterRegistry *v2;
  uint64_t v3;
  NSMapTable *settingOwnerToDatabaseAdapterTable;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDCompositeSettingsOwnerToDatabaseAdapterRegistry;
  v2 = -[HMDCompositeSettingsOwnerToDatabaseAdapterRegistry init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    settingOwnerToDatabaseAdapterTable = v2->_settingOwnerToDatabaseAdapterTable;
    v2->_settingOwnerToDatabaseAdapterTable = (NSMapTable *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
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
  void *v20;
  void *v21;
  HMDCompositeSettingsHH2DatabaseAdapter *v22;
  void *v23;
  HMDCompositeSettingsHH2DatabaseAdapter *v24;
  SEL v25;
  id v26;
  id v27;

  v27 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  settingOwnerToDatabaseAdapterTable = self->_settingOwnerToDatabaseAdapterTable;
  v18 = (void *)objc_msgSend(v27, "copy");
  -[NSMapTable objectForKey:](settingOwnerToDatabaseAdapterTable, "objectForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    +[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "contextWithHomeUUID:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = [HMDCompositeSettingsHH2DatabaseAdapter alloc];
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[HMDCompositeSettingsHH2DatabaseAdapter initWithAccessory:homeID:workingManagedObjectContext:queue:notificationCenter:](v22, "initWithAccessory:homeID:workingManagedObjectContext:queue:notificationCenter:", v13, v12, v21, v14, v23);

    v26 = objc_getProperty(self, v25, 16, 1);
    objc_msgSend(v26, "setObject:forKey:", v24, v27);

  }
  os_unfair_lock_unlock(p_lock);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingOwnerToDatabaseAdapterTable, 0);
}

@end

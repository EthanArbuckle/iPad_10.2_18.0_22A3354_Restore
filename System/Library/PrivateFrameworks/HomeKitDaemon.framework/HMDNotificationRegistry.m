@implementation HMDNotificationRegistry

- (HMDNotificationRegistry)init
{
  void *v3;
  HMDNotificationRegistry *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, 5.0);
  v4 = -[HMDNotificationRegistry initWithPendingRequestsRetryTimer:](self, "initWithPendingRequestsRetryTimer:", v3);

  return v4;
}

- (HMDNotificationRegistry)initWithPendingRequestsRetryTimer:(id)a3
{
  id v5;
  HMDNotificationRegistry *v6;
  HMDNotificationRegistry *v7;
  uint64_t v8;
  NSHashTable *delegates;
  uint64_t v10;
  NSMutableSet *pendingRequests;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDNotificationRegistry;
  v6 = -[HMDNotificationRegistry init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_pendingRequestsRetryTimer, a3);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    delegates = v7->_delegates;
    v7->_delegates = (NSHashTable *)v8;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    pendingRequests = v7->_pendingRequests;
    v7->_pendingRequests = (NSMutableSet *)v10;

  }
  return v7;
}

- (void)configureWithHome:(id)a3
{
  id v4;
  HMDNotificationRegistryCoreDataAdapter *v5;

  v4 = a3;
  v5 = -[HMDNotificationRegistryCoreDataAdapter initWithHome:]([HMDNotificationRegistryCoreDataAdapter alloc], "initWithHome:", v4);
  -[HMDNotificationRegistry configureWithHome:coreDataAdapter:](self, "configureWithHome:coreDataAdapter:", v4, v5);

}

- (void)configureWithHome:(id)a3 coreDataAdapter:(id)a4
{
  HMDNotificationRegistryCoreDataAdapter *v6;
  void *v7;
  const char *v8;
  void *v9;
  SEL v10;
  id Property;
  id v12;
  const char *v13;
  id v14;
  SEL v15;
  id v16;
  id v17;
  HMDNotificationRegistryCoreDataAdapter *coreDataAdapter;
  id obj;

  obj = a3;
  v6 = (HMDNotificationRegistryCoreDataAdapter *)a4;
  os_unfair_lock_lock_with_options();
  if (self)
    objc_storeWeak((id *)&self->_home, obj);
  objc_msgSend(obj, "workQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (self)
  {
    objc_setProperty_atomic(self, v8, v7, 64);

    Property = objc_getProperty(self, v10, 40, 1);
  }
  else
  {

    Property = 0;
  }
  v12 = Property;
  objc_msgSend(v12, "setDelegate:", self);

  if (self)
  {
    v14 = objc_getProperty(self, v13, 64, 1);
    v16 = objc_getProperty(self, v15, 40, 1);
  }
  else
  {
    v14 = 0;
    v16 = 0;
  }
  v17 = v16;
  objc_msgSend(v17, "setDelegateQueue:", v14);

  coreDataAdapter = self->_coreDataAdapter;
  self->_coreDataAdapter = v6;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)reprocessEnabledCharacteristicRegistrations
{
  HMDNotificationRegistry *v2;
  _QWORD block[5];

  v2 = self;
  if (self)
    self = (HMDNotificationRegistry *)objc_getProperty(self, a2, 64, 1);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__HMDNotificationRegistry_reprocessEnabledCharacteristicRegistrations__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = v2;
  dispatch_async(&self->super.super, block);
}

- (void)disableAllRegistrations
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  HMDNotificationRegistry *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  id Property;
  id v13;
  const char *v14;
  id v15;
  id v16;
  void *v17;
  const char *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[6];
  _QWORD v26[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__27653;
  v37 = __Block_byref_object_dispose__27654;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__27653;
  v31 = __Block_byref_object_dispose__27654;
  v32 = 0;
  -[HMDNotificationRegistry home]((id *)&self->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hapAccessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __50__HMDNotificationRegistry_disableAllRegistrations__block_invoke;
  v26[3] = &unk_24E779140;
  v26[4] = &v27;
  v26[5] = &v33;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v26);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v34[5];
    *(_DWORD *)buf = 138543618;
    v40 = v9;
    v41 = 2112;
    v42 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Disabling all registrations, then re-registering local registrations with instance ids by client: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  if (v7)
    Property = objc_getProperty(v7, v11, 32, 1);
  else
    Property = 0;
  v13 = Property;
  objc_msgSend(v13, "disableAllCharacteristicRegistrations");

  if (v7)
    v15 = objc_getProperty(v7, v14, 32, 1);
  else
    v15 = 0;
  v16 = v15;
  objc_msgSend(v16, "disableAllActionSetRegistrations");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v19 = objc_getProperty(v7, v18, 32, 1);
  else
    v19 = 0;
  v20 = v19;
  objc_msgSend(v20, "disableAllMediaProfileRegistrations");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28[5] && objc_msgSend((id)v34[5], "count"))
  {
    v22 = (void *)v34[5];
    v25[0] = v5;
    v25[1] = 3221225472;
    v25[2] = __50__HMDNotificationRegistry_disableAllRegistrations__block_invoke_86;
    v25[3] = &unk_24E779168;
    v25[4] = v7;
    v25[5] = &v27;
    objc_msgSend(v22, "na_each:", v25);
  }
  if (objc_msgSend(v21, "count"))
  {
    objc_msgSend(v21, "allObjects");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNotificationRegistry notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles:](v7, v23);

  }
  if (objc_msgSend(v17, "count"))
  {
    objc_msgSend(v17, "allObjects");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNotificationRegistry notifyDelegatesOfRegistryUpdatesForActionSets:](v7, v24);

  }
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
}

- (void)clearAllRegistrations
{
  void *v3;
  void *v4;
  SEL v5;
  id v6;
  SEL v7;
  id v8;
  void *v9;
  SEL v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  if (self)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock_with_options();
    v6 = objc_getProperty(self, v5, 32, 1);
    objc_msgSend(v6, "removeAllCharacteristicRegistrations");

    v8 = objc_getProperty(self, v7, 32, 1);
    objc_msgSend(v8, "removeAllActionSetRegistrations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_getProperty(self, v10, 32, 1);
    objc_msgSend(v11, "removeAllMediaProfileRegistrations");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(&self->_lock);
    if (objc_msgSend(v14, "count"))
    {
      objc_msgSend(v14, "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNotificationRegistry notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles:](self, v12);

    }
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "allObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNotificationRegistry notifyDelegatesOfRegistryUpdatesForActionSets:](self, v13);

    }
  }
}

- (id)shortDescription
{
  os_unfair_lock_s *p_lock;
  const char *v4;
  id Property;
  id v6;
  void *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self)
    Property = objc_getProperty(self, v4, 32, 1);
  else
    Property = 0;
  v6 = Property;
  objc_msgSend(v6, "shortDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)removeRegistrationsForCharacteristics:(id)a3
{
  id v4;
  void *v5;
  HMDNotificationRegistry *v6;
  NSObject *v7;
  void *v8;
  os_unfair_lock_s *p_lock;
  const char *v10;
  id Property;
  id v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v8;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing registrations for characteristics: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  p_lock = &v6->_lock;
  os_unfair_lock_lock_with_options();
  if (v6)
    Property = objc_getProperty(v6, v10, 32, 1);
  else
    Property = 0;
  v12 = Property;
  objc_msgSend(v12, "removeRegistrationsForCharacteristics:", v4);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)removeRegistrationsForMediaProfile:(id)a3
{
  id v4;
  void *v5;
  HMDNotificationRegistry *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  id Property;
  id v11;
  char v12;
  void *v13;
  void *v14;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v8;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing registrations for media profile: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  if (v6)
    Property = objc_getProperty(v6, v9, 32, 1);
  else
    Property = 0;
  v11 = Property;
  v12 = objc_msgSend(v11, "removeRegistrationsForMediaProfile:", v4);

  os_unfair_lock_unlock(&v6->_lock);
  if ((v12 & 1) != 0)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNotificationRegistry notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles:](v6, v14);

  }
  return v12;
}

- (BOOL)removeRegistrationsForActionSetUUID:(id)a3
{
  id v4;
  void *v5;
  HMDNotificationRegistry *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  id Property;
  id v11;
  char v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v8;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing registrations for action set: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  if (v6)
    Property = objc_getProperty(v6, v9, 32, 1);
  else
    Property = 0;
  v11 = Property;
  v12 = objc_msgSend(v11, "removeRegistrationsForActionSetUUID:", v4);

  os_unfair_lock_unlock(&v6->_lock);
  if ((v12 & 1) != 0)
  {
    v15 = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNotificationRegistry notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles:](v6, v13);

  }
  return v12;
}

- (id)filterCharacteristics:(id)a3 deviceIdsDestination:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id Property;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock_with_options();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = v6;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v22;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v12);
          if (self)
            Property = objc_getProperty(self, v9, 32, 1);
          else
            Property = 0;
          v15 = Property;
          objc_msgSend(v15, "destinationsToNotifyForCharacteristic:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v16, "containsObject:", v7))
            objc_msgSend(v20, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v17 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        v10 = v17;
      }
      while (v17);
    }

    os_unfair_lock_unlock(&self->_lock);
    v18 = (void *)objc_msgSend(v20, "copy");

  }
  else
  {
    v18 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v18;
}

- (id)filterProperties:(id)a3 deviceIdsDestination:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id Property;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock_with_options();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = v6;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v22;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v12);
          if (self)
            Property = objc_getProperty(self, v9, 32, 1);
          else
            Property = 0;
          v15 = Property;
          objc_msgSend(v15, "destinationsToNotifyForMediaPropertyResponse:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v16, "containsObject:", v7))
            objc_msgSend(v20, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v17 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        v10 = v17;
      }
      while (v17);
    }

    os_unfair_lock_unlock(&self->_lock);
    v18 = (void *)objc_msgSend(v20, "copy");

  }
  else
  {
    v18 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v18;
}

- (id)propertiesRegisteredForMediaProfileUniqueIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  const char *v6;
  id Property;
  id v8;
  void *v9;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self)
    Property = objc_getProperty(self, v6, 32, 1);
  else
    Property = 0;
  v8 = Property;
  objc_msgSend(v8, "mediaPropertiesRegisteredForMediaProfileUniqueIdentifier:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (BOOL)hasRegistrationsForActionSetUUID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  const char *v6;
  id Property;
  id v8;
  char v9;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self)
    Property = objc_getProperty(self, v6, 32, 1);
  else
    Property = 0;
  v8 = Property;
  v9 = objc_msgSend(v8, "hasEnabledRegistrationForActionSetUUID:", v4);

  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (id)filterActionSetResponses:(id)a3 deviceIdsDestination:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id Property;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  os_unfair_lock_t lock;
  void *v21;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v21 = v6;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = v6;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v25;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
          if (self)
            Property = objc_getProperty(self, v8, 32, 1);
          else
            Property = 0;
          v14 = Property;
          objc_msgSend(v12, "actionSetUUID", lock);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "destinationsToNotifyForActionSetUUID:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v16, "containsObject:", v7))
            objc_msgSend(v22, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        v9 = v17;
      }
      while (v17);
    }

    os_unfair_lock_unlock(lock);
    v18 = (void *)objc_msgSend(v22, "copy");

  }
  else
  {
    v18 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v18;
}

- (id)characteristicsByDestinationForCharacteristics:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v4 = (void *)MEMORY[0x24BDBCED8];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __74__HMDNotificationRegistry_characteristicsByDestinationForCharacteristics___block_invoke;
  v10[3] = &unk_24E78D0A8;
  v10[4] = self;
  objc_msgSend(v5, "na_reduceWithInitialValue:reducer:", v6, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v7, "copy");
  return v8;
}

- (id)destinationsRegisteredForNotificationsForCharacteristics:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id Property;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    os_unfair_lock_lock_with_options();
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v4;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v19;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10);
          if (self)
            Property = objc_getProperty(self, v7, 32, 1);
          else
            Property = 0;
          v13 = Property;
          objc_msgSend(v13, "destinationsToNotifyForCharacteristic:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "addObjectsFromArray:", v14);
          ++v10;
        }
        while (v8 != v10);
        v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        v8 = v15;
      }
      while (v15);
    }

    os_unfair_lock_unlock(&self->_lock);
  }
  v16 = (void *)objc_msgSend(v5, "copy");

  return v16;
}

- (id)destinationsRegisteredForNotificationsForProperties:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id Property;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock_with_options();
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v4;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v19;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10);
          if (self)
            Property = objc_getProperty(self, v7, 32, 1);
          else
            Property = 0;
          v13 = Property;
          objc_msgSend(v13, "destinationsToNotifyForMediaPropertyResponse:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "addObjectsFromArray:", v14);
          ++v10;
        }
        while (v8 != v10);
        v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        v8 = v15;
      }
      while (v15);
    }

    os_unfair_lock_unlock(&self->_lock);
    v16 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)destinationsRegisteredForNotificationsForActionSetResponses:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id Property;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  os_unfair_lock_t lock;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = v19;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v9);
          if (self)
            Property = objc_getProperty(self, v6, 32, 1);
          else
            Property = 0;
          v12 = Property;
          objc_msgSend(v10, "actionSetUUID", lock);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "destinationsToNotifyForActionSetUUID:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "addObjectsFromArray:", v14);
          ++v9;
        }
        while (v7 != v9);
        v15 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        v7 = v15;
      }
      while (v15);
    }

    os_unfair_lock_unlock(lock);
    v16 = (void *)objc_msgSend(v4, "copy");

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (void)auditNotificationDestinations:(id)a3 home:(id)a4
{
  id v6;
  void *v7;
  const char *v8;
  id Property;
  id v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  int v15;
  const char *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  os_unfair_lock_s *lock;
  os_unfair_lock_s *locka;
  id v32;
  _QWORD v33[5];
  id v34;
  _QWORD aBlock[5];
  id v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;

  v6 = a3;
  v32 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self)
    Property = objc_getProperty(self, v8, 32, 1);
  else
    Property = 0;
  v10 = Property;
  objc_msgSend(v10, "removeCharacteristicRegistrationsWithoutAllowedDestinations:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = isiOSDevice();
  v13 = MEMORY[0x24BDAC760];
  if (v12)
  {
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke;
    v41[3] = &unk_24E779190;
    v42 = v32;
    v43 = v7;
    objc_msgSend(v11, "na_each:", v41, lock);

  }
  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities", lock);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isResidentCapable");

  if (v15)
  {
    v39[0] = v13;
    v39[1] = 3221225472;
    v39[2] = __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_94;
    v39[3] = &unk_24E7791B8;
    v40 = v32;
    objc_msgSend(v11, "na_map:", v39);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v13;
    v37[1] = 3221225472;
    v37[2] = __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_2_96;
    v37[3] = &unk_24E791F48;
    v37[4] = self;
    v38 = v7;
    objc_msgSend(v17, "na_each:", v37);

  }
  if (self)
    v18 = objc_getProperty(self, v16, 32, 1);
  else
    v18 = 0;
  v19 = v18;
  objc_msgSend(v19, "removeMediaRegistrationsWithoutAllowedDestinations:", v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v13;
  if (objc_msgSend(v20, "count"))
  {
    objc_msgSend(v20, "na_map:", &__block_literal_global_99_27637);
    aBlock[0] = v13;
    aBlock[1] = 3221225472;
    aBlock[2] = __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_2_100;
    aBlock[3] = &unk_24E79C268;
    aBlock[4] = self;
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v36 = v23;
    v24 = _Block_copy(aBlock);
    objc_msgSend(v7, "addObject:", v24);

  }
  if (self)
    v25 = objc_getProperty(self, v21, 32, 1);
  else
    v25 = 0;
  v26 = v25;
  objc_msgSend(v26, "removeActionSetRegistrationsWithoutAllowedDestinations:", v6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v27, "count"))
  {
    objc_msgSend(v27, "na_map:", &__block_literal_global_103);
    v33[0] = v22;
    v33[1] = 3221225472;
    v33[2] = __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_4;
    v33[3] = &unk_24E79C268;
    v33[4] = self;
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v34 = v28;
    v29 = _Block_copy(v33);
    objc_msgSend(v7, "addObject:", v29);

  }
  os_unfair_lock_unlock(locka);
  objc_msgSend(v7, "na_each:", &__block_literal_global_105_27638);

}

- (void)storeCHIPRemoteSubscriberWithRemoteSourceID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  if (a3)
  {
    v4 = a3;
    -[HMDNotificationRegistry chipRemoteSubscribers](self, "chipRemoteSubscribers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      -[HMDNotificationRegistry setChipRemoteSubscribers:](self, "setChipRemoteSubscribers:", v6);

    }
    -[HMDNotificationRegistry chipRemoteSubscribers](self, "chipRemoteSubscribers");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v4);

  }
}

- (BOOL)setNotificationsEnabled:(BOOL)a3 user:(id)a4 deviceIdsDestination:(id)a5 characteristicsPayload:(id)a6 characteristicChangeThresholdsPayload:(id)a7 mediaPropertiesPayload:(id)a8 actionSetsPayload:(id)a9 matterNotificationPayload:(id)a10
{
  id v15;
  const char *v16;
  NSObject *Property;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  HMDNotificationRegistryCharacteristicsRequest *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  HMDNotificationRegistryCharacteristicsRequest *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  HMDNotificationRegistry *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  HMDNotificationRegistry *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  HMDNotificationRegistry *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  HMDNotificationRegistryMediaPropertiesRequest *v81;
  void *v82;
  void *v83;
  HMDNotificationRegistry *v84;
  NSObject *v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  HMDNotificationRegistry *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  HMDNotificationRegistry *v94;
  NSObject *v95;
  void *v96;
  void *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t i;
  id v102;
  void *v103;
  id v104;
  void *v105;
  HMDNotificationRegistryActionSetRequest *v106;
  void *v107;
  HMDNotificationRegistry *v108;
  NSObject *v109;
  void *v110;
  void *v111;
  HMDNotificationRegistry *v112;
  NSObject *v113;
  void *v114;
  const char *v115;
  NSObject *v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  void *v120;
  NSObject *v121;
  void *v122;
  SEL v123;
  NSObject *v124;
  SEL v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t j;
  id v130;
  void *v131;
  id v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  int v137;
  void *v138;
  HMDNotificationRegistry *v139;
  NSObject *v140;
  void *v141;
  SEL v142;
  void *v143;
  void *v144;
  void *v145;
  int v146;
  void *v147;
  os_unfair_lock_s *v148;
  NSObject *v149;
  _BOOL4 v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  id v155;
  id v156;
  id v157;
  os_unfair_lock_s *v158;
  SEL v159;
  id v160;
  char v161;
  int v162;
  void *v163;
  HMDNotificationRegistry *v164;
  NSObject *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  id v171;
  id v172;
  id v173;
  os_unfair_lock_s *v174;
  SEL v175;
  id v176;
  int v177;
  void *v178;
  void *v179;
  void *v180;
  NSObject *v181;
  void *v182;
  void *v183;
  uint64_t v184;
  char v185;
  uint64_t v186;
  uint64_t k;
  void *v188;
  void *v189;
  void *v190;
  int v191;
  _BOOL4 v192;
  int v193;
  id v195;
  void *v196;
  id v197;
  void *v198;
  id v199;
  id v200;
  uint64_t v201;
  id v202;
  HMDNotificationRegistry *v203;
  uint64_t v204;
  void *v205;
  uint64_t v206;
  int v207;
  id v208;
  void *v209;
  void *v210;
  uint64_t v211;
  id v212;
  id v213;
  id v214;
  _BOOL4 v215;
  id v216;
  id v217;
  id v218;
  id obj;
  id v220;
  id v221;
  HMDNotificationRegistry *selfa;
  uint64_t v223;
  void *v224;
  id v225;
  uint64_t v226;
  HMDNotificationRegistry *v227;
  HMDNotificationRegistry *v228;
  _QWORD v229[4];
  id v230;
  HMDNotificationRegistry *v231;
  id v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  _BYTE v257[128];
  _BYTE v258[128];
  _BYTE v259[128];
  _BYTE v260[128];
  uint8_t v261[128];
  uint8_t v262[4];
  void *v263;
  __int16 v264;
  id v265;
  _BYTE buf[24];
  void *v267;
  __int128 v268;
  uint64_t v269;

  v215 = a3;
  v269 = *MEMORY[0x24BDAC8D0];
  v217 = a4;
  v218 = a5;
  v15 = a6;
  v202 = a7;
  v197 = a8;
  v199 = a9;
  v212 = a10;
  if (self)
    Property = objc_getProperty(self, v16, 64, 1);
  else
    Property = 0;
  dispatch_assert_queue_V2(Property);
  v18 = (void *)MEMORY[0x227676638]();
  v203 = self;
  selfa = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v217, "shortDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v20;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v21;
    *(_WORD *)&buf[22] = 2112;
    v267 = v22;
    LOWORD(v268) = 2112;
    *(_QWORD *)((char *)&v268 + 2) = v218;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Setting notifications enabled to %@ for user: %@ deviceIdsDestination: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v18);
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v199, "count"));
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v15, "count"));
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  v247 = 0u;
  v248 = 0u;
  v245 = 0u;
  v246 = 0u;
  obj = v15;
  v223 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v245, v260, 16);
  if (v223)
  {
    v220 = *(id *)v246;
    do
    {
      v23 = 0;
      do
      {
        if (*(id *)v246 != v220)
          objc_enumerationMutation(obj);
        v24 = *(id *)(*((_QWORD *)&v245 + 1) + 8 * v23);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v25 = v24;
        else
          v25 = 0;
        v26 = v25;

        if (v26)
        {
          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v26);
          v28 = v27;
          if (v27)
          {
            objc_msgSend(v27, "UUIDString");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(obj, "objectForKeyedSubscript:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            v31 = v30;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v32 = v31;
            else
              v32 = 0;
            v225 = v32;

            if (v225)
            {
              v33 = -[HMDNotificationRegistryCharacteristicsRequest initWithEnable:user:deviceIdsDestination:accessoryUUID:]([HMDNotificationRegistryCharacteristicsRequest alloc], "initWithEnable:user:deviceIdsDestination:accessoryUUID:", v215, v217, v218, v28);
              v34 = v202;
              v213 = v28;
              if (v203)
              {
                v35 = (void *)MEMORY[0x227676638]();
                objc_msgSend(v213, "UUIDString");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "objectForKeyedSubscript:", v36);
                v37 = (void *)objc_claimAutoreleasedReturnValue();

                v38 = v37;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v39 = v38;
                else
                  v39 = 0;
                v40 = v39;

                if (v40)
                {
                  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_QWORD *)buf = MEMORY[0x24BDAC760];
                  *(_QWORD *)&buf[8] = 3221225472;
                  *(_QWORD *)&buf[16] = __74__HMDNotificationRegistry_parseChangeThresholdsFromPayload_accessoryUUID___block_invoke;
                  v267 = &unk_24E7792A0;
                  *(_QWORD *)&v268 = selfa;
                  v42 = v41;
                  *((_QWORD *)&v268 + 1) = v42;
                  objc_msgSend(v40, "na_each:", buf);
                  v208 = v26;
                  v43 = v28;
                  v44 = v31;
                  v45 = v35;
                  v46 = v33;
                  v47 = v34;
                  v48 = (void *)*((_QWORD *)&v268 + 1);
                  v49 = v42;

                  v34 = v47;
                  v33 = v46;
                  v35 = v45;
                  v31 = v44;
                  v28 = v43;
                  v26 = v208;

                }
                else
                {
                  v49 = (id)MEMORY[0x24BDBD1B8];
                }

                objc_autoreleasePoolPop(v35);
              }
              else
              {
                v49 = 0;
              }

              if (objc_msgSend(v49, "count"))
              {
                -[HMDNotificationRegistryCharacteristicsRequest characteristicChangeThresholds](v33, "characteristicChangeThresholds");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "addEntriesFromDictionary:", v49);

              }
              -[HMDNotificationRegistryCharacteristicsRequest characteristicInstanceIDs](v33, "characteristicInstanceIDs");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "addObjectsFromArray:", v225);

              objc_msgSend(v205, "addObject:", v33);
            }
            else
            {
              v60 = (void *)MEMORY[0x227676638]();
              v61 = selfa;
              HMFGetOSLogHandle();
              v62 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                v64 = (void *)objc_opt_class();
                *(_DWORD *)buf = 138543874;
                *(_QWORD *)&buf[4] = v63;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v31;
                *(_WORD *)&buf[22] = 2112;
                v267 = v64;
                v65 = v64;
                _os_log_impl(&dword_2218F0000, v62, OS_LOG_TYPE_INFO, "%{public}@Ignoring notification registration characteristics payload value that is not an array: %@)%@)", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v60);
            }

          }
          else
          {
            v56 = (void *)MEMORY[0x227676638]();
            v57 = selfa;
            HMFGetOSLogHandle();
            v58 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v59;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v26;
              _os_log_impl(&dword_2218F0000, v58, OS_LOG_TYPE_INFO, "%{public}@Ignoring accessory UUID string that cannot be converted in a UUID: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v56);
          }

        }
        else
        {
          v50 = (void *)MEMORY[0x227676638]();
          v51 = selfa;
          HMFGetOSLogHandle();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v53;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v24;
            *(_WORD *)&buf[22] = 2112;
            v267 = v54;
            v55 = v54;
            _os_log_impl(&dword_2218F0000, v52, OS_LOG_TYPE_INFO, "%{public}@Ignoring notification registration characteristics payload key that is not a string: %@ (%@)", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v50);
        }

        ++v23;
      }
      while (v223 != v23);
      v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v245, v260, 16);
      v223 = v68;
    }
    while (v68);
  }

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v197, "count"));
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  v243 = 0u;
  v244 = 0u;
  v241 = 0u;
  v242 = 0u;
  v221 = v197;
  v69 = objc_msgSend(v221, "countByEnumeratingWithState:objects:count:", &v241, v259, 16);
  if (v69)
  {
    v226 = *(_QWORD *)v242;
    do
    {
      v70 = 0;
      v206 = v69;
      do
      {
        if (*(_QWORD *)v242 != v226)
          objc_enumerationMutation(v221);
        v71 = *(id *)(*((_QWORD *)&v241 + 1) + 8 * v70);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v72 = v71;
        else
          v72 = 0;
        v73 = v72;

        if (v73)
        {
          v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v73);
          v75 = v74;
          if (v74)
          {
            objc_msgSend(v74, "UUIDString");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v221, "objectForKeyedSubscript:", v76);
            v77 = (void *)objc_claimAutoreleasedReturnValue();

            v78 = v77;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v79 = v78;
            else
              v79 = 0;
            v80 = v79;

            if (v80)
            {
              v81 = -[HMDNotificationRegistryMediaPropertiesRequest initWithEnable:user:deviceIdsDestination:mediaProfileUUID:]([HMDNotificationRegistryMediaPropertiesRequest alloc], "initWithEnable:user:deviceIdsDestination:mediaProfileUUID:", v215, v217, v218, v75);
              -[HMDNotificationRegistryMediaPropertiesRequest mediaProperties](v81, "mediaProperties");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v82, "addObjectsFromArray:", v80);

              objc_msgSend(v209, "addObject:", v81);
            }
            else
            {
              v93 = (void *)MEMORY[0x227676638]();
              v94 = selfa;
              HMFGetOSLogHandle();
              v95 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                v97 = (void *)objc_opt_class();
                *(_DWORD *)buf = 138543874;
                *(_QWORD *)&buf[4] = v96;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v78;
                *(_WORD *)&buf[22] = 2112;
                v267 = v97;
                v98 = v97;
                _os_log_impl(&dword_2218F0000, v95, OS_LOG_TYPE_INFO, "%{public}@Ignoring notification registration media properties payload value that is not an array: %@ (%@)", buf, 0x20u);

                v69 = v206;
              }

              objc_autoreleasePoolPop(v93);
            }

          }
          else
          {
            v89 = (void *)MEMORY[0x227676638]();
            v90 = selfa;
            HMFGetOSLogHandle();
            v91 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v92;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v73;
              _os_log_impl(&dword_2218F0000, v91, OS_LOG_TYPE_INFO, "%{public}@Ignoring media profile UUID string that cannot be converted in a UUID: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v89);
          }

        }
        else
        {
          v83 = (void *)MEMORY[0x227676638]();
          v84 = selfa;
          HMFGetOSLogHandle();
          v85 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v87 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v86;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v71;
            *(_WORD *)&buf[22] = 2112;
            v267 = v87;
            v88 = v87;
            _os_log_impl(&dword_2218F0000, v85, OS_LOG_TYPE_INFO, "%{public}@Ignoring notification registration media properties payload key that is not a string: %@ (%@)", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v83);
        }

        ++v70;
      }
      while (v69 != v70);
      v69 = objc_msgSend(v221, "countByEnumeratingWithState:objects:count:", &v241, v259, 16);
    }
    while (v69);
  }

  v239 = 0u;
  v240 = 0u;
  v238 = 0u;
  v237 = 0u;
  v214 = v199;
  v99 = objc_msgSend(v214, "countByEnumeratingWithState:objects:count:", &v237, v258, 16);
  if (v99)
  {
    v100 = *(_QWORD *)v238;
    do
    {
      for (i = 0; i != v99; ++i)
      {
        if (*(_QWORD *)v238 != v100)
          objc_enumerationMutation(v214);
        v102 = *(id *)(*((_QWORD *)&v237 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v103 = v102;
        else
          v103 = 0;
        v104 = v103;

        if (v104)
        {
          v105 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v104);
          if (v105)
          {
            v106 = -[HMDNotificationRegistryActionSetRequest initWithEnable:user:deviceIdsDestination:actionSetUUID:]([HMDNotificationRegistryActionSetRequest alloc], "initWithEnable:user:deviceIdsDestination:actionSetUUID:", v215, v217, v218, v105);
            objc_msgSend(v210, "addObject:", v106);

          }
          else
          {
            v111 = (void *)MEMORY[0x227676638]();
            v112 = selfa;
            HMFGetOSLogHandle();
            v113 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v114;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v104;
              _os_log_impl(&dword_2218F0000, v113, OS_LOG_TYPE_ERROR, "%{public}@Action set uuid string (%@) could not be converted to a uuid", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v111);
          }

        }
        else
        {
          v107 = (void *)MEMORY[0x227676638]();
          v108 = selfa;
          HMFGetOSLogHandle();
          v109 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v110;
            _os_log_impl(&dword_2218F0000, v109, OS_LOG_TYPE_ERROR, "%{public}@Action set element was not a string", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v107);
        }

      }
      v99 = objc_msgSend(v214, "countByEnumeratingWithState:objects:count:", &v237, v258, 16);
    }
    while (v99);
  }

  v195 = v210;
  if (!v203
    || (v116 = objc_getProperty(selfa, v115, 64, 1),
        dispatch_assert_queue_V2(v116),
        !objc_msgSend(v195, "count")))
  {
    v207 = 0;
    goto LABEL_141;
  }
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  v251 = 0u;
  v252 = 0u;
  v249 = 0u;
  v250 = 0u;
  v200 = v195;
  v204 = objc_msgSend(v200, "countByEnumeratingWithState:objects:count:", &v249, v261, 16);
  if (!v204)
  {
    v207 = 0;
    goto LABEL_138;
  }
  v207 = 0;
  v201 = *(_QWORD *)v250;
  do
  {
    v117 = 0;
    do
    {
      if (*(_QWORD *)v250 != v201)
      {
        v118 = v117;
        objc_enumerationMutation(v200);
        v117 = v118;
      }
      v211 = v117;
      v119 = *(void **)(*((_QWORD *)&v249 + 1) + 8 * v117);
      v120 = (void *)MEMORY[0x227676638]();
      v227 = selfa;
      HMFGetOSLogHandle();
      v121 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v122;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v119;
        _os_log_impl(&dword_2218F0000, v121, OS_LOG_TYPE_INFO, "%{public}@Processing action set request: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v120);
      v216 = v119;
      v124 = objc_getProperty(v227, v123, 64, 1);
      dispatch_assert_queue_V2(v124);
      v255 = 0u;
      v256 = 0u;
      v253 = 0u;
      v254 = 0u;
      v126 = (void *)objc_msgSend(objc_getProperty(v227, v125, 48, 1), "copy");
      v127 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v253, buf, 16);
      if (v127)
      {
        v128 = *(_QWORD *)v254;
        do
        {
          for (j = 0; j != v127; ++j)
          {
            if (*(_QWORD *)v254 != v128)
              objc_enumerationMutation(v126);
            v130 = *(id *)(*((_QWORD *)&v253 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v131 = v130;
            else
              v131 = 0;
            v132 = v131;

            if (v132)
            {
              objc_msgSend(v132, "deviceIdsDestination");
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v132, "deviceIdsDestination");
              v134 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v133, "isEqualToString:", v134) & 1) != 0)
              {
                objc_msgSend(v132, "actionSetUUID");
                v135 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v132, "actionSetUUID");
                v136 = (void *)objc_claimAutoreleasedReturnValue();
                v137 = objc_msgSend(v135, "isEqual:", v136);

                if (v137)
                {
                  v138 = (void *)MEMORY[0x227676638]();
                  v139 = v227;
                  HMFGetOSLogHandle();
                  v140 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v140, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v141 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v262 = 138543618;
                    v263 = v141;
                    v264 = 2112;
                    v265 = v132;
                    _os_log_impl(&dword_2218F0000, v140, OS_LOG_TYPE_INFO, "%{public}@Removing pending action set request that matches a new action set request: %@", v262, 0x16u);

                  }
                  objc_autoreleasePoolPop(v138);
                  objc_msgSend(objc_getProperty(v139, v142, 48, 1), "removeObject:", v132);
                }
              }
              else
              {

              }
            }

          }
          v127 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v253, buf, 16);
        }
        while (v127);
      }

      -[HMDNotificationRegistry home]((id *)&v227->super.super.isa);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v216, "actionSetUUID");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "actionSetWithUUID:", v144);
      v145 = (void *)objc_claimAutoreleasedReturnValue();

      if (v145)
      {
        v146 = objc_msgSend(v216, "enable");
        v147 = (void *)MEMORY[0x227676638]();
        v148 = v227;
        HMFGetOSLogHandle();
        v149 = objc_claimAutoreleasedReturnValue();
        v150 = os_log_type_enabled(v149, OS_LOG_TYPE_INFO);
        if (v146)
        {
          if (v150)
          {
            HMFGetLogIdentifier();
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v151;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v145;
            _os_log_impl(&dword_2218F0000, v149, OS_LOG_TYPE_INFO, "%{public}@Enabling notification for action set: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v147);
          objc_msgSend(v145, "uuid");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v216, "user");
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v216, "deviceIdsDestination");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          v155 = v152;
          v156 = v153;
          v157 = v154;
          v158 = v148 + 2;
          os_unfair_lock_lock_with_options();
          v160 = objc_getProperty(v148, v159, 32, 1);
          v161 = objc_msgSend(v160, "enableNotificationForActionSetUUID:user:deviceIdsDestination:", v155, v156, v157);

          os_unfair_lock_unlock(v158);
          if ((v161 & 1) == 0)
            goto LABEL_124;
LABEL_131:
          objc_msgSend(v145, "uuid", v195);
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v196, "addObject:", v178);

          v162 = 1;
        }
        else
        {
          if (v150)
          {
            HMFGetLogIdentifier();
            v167 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v167;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v145;
            _os_log_impl(&dword_2218F0000, v149, OS_LOG_TYPE_INFO, "%{public}@Disabling notification for action set: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v147);
          objc_msgSend(v145, "uuid");
          v168 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v216, "user");
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v216, "deviceIdsDestination");
          v170 = (void *)objc_claimAutoreleasedReturnValue();
          v171 = v168;
          v172 = v169;
          v173 = v170;
          v174 = v148 + 2;
          os_unfair_lock_lock_with_options();
          v176 = objc_getProperty(v148, v175, 32, 1);
          v177 = objc_msgSend(v176, "disableNotificationForActionSetUUID:user:deviceIdsDestination:", v171, v172, v173);

          os_unfair_lock_unlock(v174);
          if (v177)
            goto LABEL_131;
LABEL_124:
          v162 = 0;
        }
        v207 |= v162;
        goto LABEL_133;
      }
      v163 = (void *)MEMORY[0x227676638]();
      v164 = v227;
      HMFGetOSLogHandle();
      v165 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v165, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v166;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v216;
        _os_log_impl(&dword_2218F0000, v165, OS_LOG_TYPE_INFO, "%{public}@Cannot find action set for action set request so adding to pending requests: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v163);
      objc_msgSend(v198, "addObject:", v216);
LABEL_133:

      v117 = v211 + 1;
    }
    while (v211 + 1 != v204);
    v204 = objc_msgSend(v200, "countByEnumeratingWithState:objects:count:", &v249, v261, 16);
  }
  while (v204);
LABEL_138:

  -[HMDNotificationRegistry _addPendingRequests:](selfa, v198);
  if (objc_msgSend(v196, "count"))
  {
    objc_msgSend(v196, "allObjects");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNotificationRegistry notifyDelegatesOfRegistryUpdatesForActionSets:](selfa, v179);

  }
LABEL_141:

  -[HMDNotificationRegistry home]((id *)&selfa->super.super.isa);
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  v180 = (void *)MEMORY[0x227676638]();
  v228 = selfa;
  HMFGetOSLogHandle();
  v181 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v181, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v182;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v212;
    _os_log_impl(&dword_2218F0000, v181, OS_LOG_TYPE_INFO, "%{public}@Handling notification registration for matter attributes. payload=%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v180);
  v235 = 0u;
  v236 = 0u;
  v233 = 0u;
  v234 = 0u;
  objc_msgSend(v224, "hapAccessories");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v184 = objc_msgSend(v183, "countByEnumeratingWithState:objects:count:", &v233, v257, 16);
  if (v184)
  {
    v185 = 0;
    v186 = *(_QWORD *)v234;
    do
    {
      for (k = 0; k != v184; ++k)
      {
        if (*(_QWORD *)v234 != v186)
          objc_enumerationMutation(v183);
        v188 = *(void **)(*((_QWORD *)&v233 + 1) + 8 * k);
        objc_msgSend(v188, "matterNodeID", v195);
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v212, "hmf_dictionaryForKey:", v189);
        v190 = (void *)objc_claimAutoreleasedReturnValue();

        if (v190)
        {
          v229[0] = MEMORY[0x24BDAC760];
          v229[1] = 3221225472;
          v229[2] = __205__HMDNotificationRegistry_setNotificationsEnabled_user_deviceIdsDestination_characteristicsPayload_characteristicChangeThresholdsPayload_mediaPropertiesPayload_actionSetsPayload_matterNotificationPayload___block_invoke;
          v229[3] = &unk_24E79AE58;
          v230 = v189;
          v231 = v228;
          v232 = v224;
          objc_msgSend(v188, "setCHIPReportHandler:", v229);

          v185 = 1;
        }

      }
      v184 = objc_msgSend(v183, "countByEnumeratingWithState:objects:count:", &v233, v257, 16);
    }
    while (v184);

    if ((v185 & 1) != 0)
    {
      -[HMDNotificationRegistry storeCHIPRemoteSubscriberWithRemoteSourceID:](v228, "storeCHIPRemoteSubscriberWithRemoteSourceID:", v218);
      v191 = 1;
      goto LABEL_156;
    }
  }
  else
  {

  }
  v191 = 0;
LABEL_156:
  v192 = -[HMDNotificationRegistry _processCharacteristicsRequests:](v228, v205);
  v193 = v192 | -[HMDNotificationRegistry _processMediaPropertiesRequests:](v228, v209);
  if (((v191 | v207 | v193) & 1) != 0)
    objc_msgSend(v224, "saveToCurrentAccountWithReason:", CFSTR("kModifyCharacterisiticNotificationsRequestKey"));

  return (v193 | v207 | v191) & 1;
}

- (void)addDelegate:(id)a3
{
  id v4;
  void *v5;
  HMDNotificationRegistry *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@adding delegate %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  -[NSHashTable addObject:](v6->_delegates, "addObject:", v4);
  os_unfair_lock_unlock(&v6->_lock);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDNotificationRegistry home]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)timerDidFire:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  SEL v7;
  id v8;
  void *v9;
  HMDNotificationRegistry *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  SEL v15;
  void *v16;
  SEL v17;
  uint64_t v18;
  void *v19;
  HMDNotificationRegistry *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  HMDNotificationRegistry *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[4];
  void *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  void *v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (self)
  {
    Property = objc_getProperty(self, v4, 64, 1);
    dispatch_assert_queue_V2(Property);
    v8 = objc_getProperty(self, v7, 40, 1);
  }
  else
  {
    dispatch_assert_queue_V2(0);
    v8 = 0;
  }
  if (v8 == v5)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Pending requests retry timer fired", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    if (self)
    {
      v14 = objc_getProperty(v10, v13, 64, 1);
      dispatch_assert_queue_V2(v14);
      v16 = (void *)objc_msgSend(objc_getProperty(v10, v15, 48, 1), "copy");
      objc_msgSend(objc_getProperty(v10, v17, 48, 1), "removeAllObjects");
      v18 = objc_msgSend(v16, "count");
      v19 = (void *)MEMORY[0x227676638]();
      v20 = v10;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
      if (v18)
      {
        v44 = v5;
        if (v22)
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v16, "count");
          *(_DWORD *)buf = 138543618;
          v58 = v23;
          v59 = 2048;
          v60 = v24;
          _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Processing %lu pending request(s)", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v19);
        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v43 = v16;
        v25 = v16;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, buf, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v48;
          do
          {
            for (i = 0; i != v27; ++i)
            {
              if (*(_QWORD *)v48 != v28)
                objc_enumerationMutation(v25);
              v30 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
              if (objc_msgSend(v30, "retryCount") < 5)
              {
                objc_msgSend(v30, "setRetryCount:", objc_msgSend(v30, "retryCount") + 1);
                v36 = v30;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v37 = v36;
                else
                  v37 = 0;
                v38 = v37;

                if (v38)
                {
                  objc_msgSend(v46, "addObject:", v38);
                }
                else
                {
                  v39 = v36;
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    v40 = v39;
                  else
                    v40 = 0;
                  v41 = v40;

                  if (v41)
                    objc_msgSend(v45, "addObject:", v41);

                }
              }
              else
              {
                v31 = (void *)MEMORY[0x227676638]();
                v32 = v20;
                HMFGetOSLogHandle();
                v33 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  v35 = objc_msgSend(v30, "retryCount");
                  *(_DWORD *)v51 = 138543874;
                  v52 = v34;
                  v53 = 2048;
                  v54 = v35;
                  v55 = 2112;
                  v56 = v30;
                  _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Dropping pending request that is still around after %ld retries: %@", v51, 0x20u);

                }
                objc_autoreleasePoolPop(v31);
              }
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, buf, 16);
          }
          while (v27);
        }

        -[HMDNotificationRegistry _processCharacteristicsRequests:](v20, v46);
        -[HMDNotificationRegistry _processMediaPropertiesRequests:](v20, v45);

        v16 = v43;
        v5 = v44;
      }
      else
      {
        if (v22)
        {
          HMFGetLogIdentifier();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v58 = v42;
          _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@No pending requests to process", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v19);
      }

    }
  }

}

- (NSMutableSet)chipRemoteSubscribers
{
  return self->_chipRemoteSubscribers;
}

- (void)setChipRemoteSubscribers:(id)a3
{
  objc_storeStrong((id *)&self->_chipRemoteSubscribers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_pendingRequestsRetryTimer, 0);
  objc_storeStrong((id *)&self->_coreDataAdapter, 0);
  objc_storeStrong((id *)&self->_chipRemoteSubscribers, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
}

- (BOOL)_processCharacteristicsRequests:(void *)a1
{
  id v3;
  const char *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  SEL v14;
  NSObject *Property;
  SEL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  id *v33;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  SEL v38;
  uint64_t v39;
  id WeakRetained;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  HMDNotificationRegistryCoreDataCharacteristicsRequest *v49;
  void *v50;
  id *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  id *v55;
  NSObject *v56;
  void *v57;
  SEL v58;
  id v59;
  id v60;
  void *v61;
  id v62;
  int v63;
  _BOOL8 v64;
  void *v66;
  void *v67;
  id obj;
  void *v69;
  void *v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  id *self;
  id v76;
  _QWORD v77[5];
  _QWORD v78[5];
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint8_t v88[128];
  uint8_t v89[4];
  void *v90;
  __int16 v91;
  id v92;
  _BYTE buf[24];
  void *v94;
  id v95;
  id v96;
  __int128 *v97;
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v66 = v3;
  if (a1
    && (v5 = v3,
        v6 = objc_getProperty(a1, v4, 64, 1),
        dispatch_assert_queue_V2(v6),
        objc_msgSend(v5, "count")))
  {
    v72 = a1;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = 0u;
    v81 = 0u;
    v82 = 0u;
    v80 = 0u;
    obj = v66;
    v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
    if (v73)
    {
      v71 = *(_QWORD *)v81;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v81 != v71)
          {
            v8 = v7;
            objc_enumerationMutation(obj);
            v7 = v8;
          }
          v74 = v7;
          v9 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v7);
          v10 = (void *)MEMORY[0x227676638]();
          self = (id *)v72;
          HMFGetOSLogHandle();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v12;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v9;
            _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Processing characteristics request: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v10);
          v13 = v9;
          Property = objc_getProperty(self, v14, 64, 1);
          dispatch_assert_queue_V2(Property);
          v86 = 0u;
          v87 = 0u;
          v84 = 0u;
          v85 = 0u;
          v76 = (id)objc_msgSend(objc_getProperty(self, v16, 48, 1), "copy");
          v17 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v84, buf, 16);
          if (v17)
          {
            v18 = *(_QWORD *)v85;
            do
            {
              v19 = 0;
              do
              {
                if (*(_QWORD *)v85 != v18)
                  objc_enumerationMutation(v76);
                v20 = *(id *)(*((_QWORD *)&v84 + 1) + 8 * v19);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v21 = v20;
                else
                  v21 = 0;
                v22 = v21;

                if (v22)
                {
                  objc_msgSend(v22, "deviceIdsDestination");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v13, "deviceIdsDestination");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v23, "isEqualToString:", v24) & 1) != 0)
                  {
                    objc_msgSend(v22, "accessoryUUID");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v13, "accessoryUUID");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v27 = objc_msgSend(v25, "isEqual:", v26);

                    if (v27)
                    {
                      objc_msgSend(v22, "characteristicInstanceIDs");
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v13, "characteristicInstanceIDs");
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v28, "minusSet:", v29);

                      objc_msgSend(v22, "characteristicInstanceIDs");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      v31 = objc_msgSend(v30, "count") == 0;

                      v32 = (void *)MEMORY[0x227676638]();
                      v33 = self;
                      HMFGetOSLogHandle();
                      v34 = objc_claimAutoreleasedReturnValue();
                      v35 = os_log_type_enabled(v34, OS_LOG_TYPE_INFO);
                      if (v31)
                      {
                        if (v35)
                        {
                          HMFGetLogIdentifier();
                          v37 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)v89 = 138543618;
                          v90 = v37;
                          v91 = 2112;
                          v92 = v22;
                          _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, "%{public}@Removing pending characteristics request that matches a new characteristics request: %@", v89, 0x16u);

                        }
                        objc_autoreleasePoolPop(v32);
                        objc_msgSend(objc_getProperty(v33, v38, 48, 1), "removeObject:", v22);
                      }
                      else
                      {
                        if (v35)
                        {
                          HMFGetLogIdentifier();
                          v36 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)v89 = 138543618;
                          v90 = v36;
                          v91 = 2112;
                          v92 = v22;
                          _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, "%{public}@Updated pending characteristics request: %@", v89, 0x16u);

                        }
                        objc_autoreleasePoolPop(v32);
                      }
                    }
                  }
                  else
                  {

                  }
                }

                ++v19;
              }
              while (v17 != v19);
              v39 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v84, buf, 16);
              v17 = v39;
            }
            while (v39);
          }

          WeakRetained = objc_loadWeakRetained(self + 7);
          objc_msgSend(v13, "accessoryUUID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "accessoryWithUUID:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v43 = v42;
          else
            v43 = 0;
          v44 = v43;

          if (v44)
          {
            v78[0] = MEMORY[0x24BDAC760];
            v78[1] = 3221225472;
            v78[2] = __59__HMDNotificationRegistry__processCharacteristicsRequests___block_invoke;
            v78[3] = &unk_24E77F3B8;
            v78[4] = v13;
            v79 = v69;
            objc_msgSend(v44, "characteristicsPassingTest:", v78);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v45, "count");
            objc_msgSend(v13, "characteristicInstanceIDs");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v46) = v46 == objc_msgSend(v47, "count");

            if ((v46 & 1) != 0)
            {
              v77[0] = MEMORY[0x24BDAC760];
              v77[1] = 3221225472;
              v77[2] = __59__HMDNotificationRegistry__processCharacteristicsRequests___block_invoke_118;
              v77[3] = &unk_24E78D008;
              v77[4] = v13;
              objc_msgSend(v45, "na_map:", v77);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = -[HMDNotificationRegistryCoreDataCharacteristicsRequest initWithRequest:characteristicThresholds:]([HMDNotificationRegistryCoreDataCharacteristicsRequest alloc], "initWithRequest:characteristicThresholds:", v13, v48);
              objc_msgSend(v67, "addObject:", v49);

            }
            else
            {
              v54 = (void *)MEMORY[0x227676638]();
              v55 = self;
              HMFGetOSLogHandle();
              v56 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v57;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v13;
                _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_INFO, "%{public}@Cannot find all characteristics for request so adding to pending requests: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v54);
              objc_msgSend(v70, "addObject:", v13);
            }

          }
          else
          {
            v50 = (void *)MEMORY[0x227676638]();
            v51 = self;
            HMFGetOSLogHandle();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v53;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v13;
              _os_log_impl(&dword_2218F0000, v52, OS_LOG_TYPE_INFO, "%{public}@Cannot find accessory for characteristics request so adding to pending requests: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v50);
            objc_msgSend(v70, "addObject:", v13);
          }

          v7 = v74 + 1;
        }
        while (v74 + 1 != v73);
        v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
      }
      while (v73);
    }

    objc_msgSend(objc_getProperty(v72, v58, 32, 1), "processCharacteristicsRequests:", v67);
    v59 = (id)objc_claimAutoreleasedReturnValue();
    v60 = v70;
    v61 = (void *)MEMORY[0x227676638]();
    *(_QWORD *)&v84 = 0;
    *((_QWORD *)&v84 + 1) = &v84;
    *(_QWORD *)&v85 = 0x2020000000;
    BYTE8(v85) = 0;
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __79__HMDNotificationRegistry__processCoreDataRequestResults_pendingRequestsToAdd___block_invoke;
    v94 = &unk_24E7792C8;
    v95 = v72;
    v62 = v60;
    v96 = v62;
    v97 = &v84;
    objc_msgSend(v59, "hmf_enumerateWithAutoreleasePoolUsingBlock:", buf);
    v63 = *(unsigned __int8 *)(*((_QWORD *)&v84 + 1) + 24);

    _Block_object_dispose(&v84, 8);
    objc_autoreleasePoolPop(v61);
    v64 = v63 != 0;

    -[HMDNotificationRegistry _addPendingRequests:](v72, v62);
  }
  else
  {
    v64 = 0;
  }

  return v64;
}

- (uint64_t)_processMediaPropertiesRequests:(void *)a1
{
  id v3;
  const char *v4;
  void *v5;
  NSObject *Property;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  SEL v14;
  NSObject *v15;
  SEL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  id v33;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  SEL v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  int v45;
  void *v46;
  os_unfair_lock_s *v47;
  NSObject *v48;
  _BOOL4 v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  os_unfair_lock_s *v59;
  SEL v60;
  id v61;
  char v62;
  char v63;
  void *v64;
  id v65;
  NSObject *v66;
  void *v67;
  void *v68;
  id v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  os_unfair_lock_s *v77;
  SEL v78;
  id v79;
  char v80;
  void *v81;
  void *v83;
  void *v84;
  void *v85;
  id obj;
  char v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  id self;
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  uint8_t v102[128];
  uint8_t v103[4];
  void *v104;
  __int16 v105;
  id v106;
  uint8_t buf[4];
  void *v108;
  __int16 v109;
  id v110;
  __int16 v111;
  void *v112;
  uint64_t v113;

  v113 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v83 = v3;
  if (!a1
    || (v5 = v3,
        Property = objc_getProperty(a1, v4, 64, 1),
        dispatch_assert_queue_V2(Property),
        !objc_msgSend(v5, "count")))
  {
    v87 = 0;
    goto LABEL_62;
  }
  v89 = a1;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  obj = v83;
  v90 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
  if (!v90)
  {
    v87 = 0;
    goto LABEL_59;
  }
  v87 = 0;
  v88 = *(_QWORD *)v95;
  do
  {
    v7 = 0;
    do
    {
      if (*(_QWORD *)v95 != v88)
      {
        v8 = v7;
        objc_enumerationMutation(obj);
        v7 = v8;
      }
      v91 = v7;
      v9 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v7);
      v10 = (void *)MEMORY[0x227676638]();
      self = v89;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v108 = v12;
        v109 = 2112;
        v110 = v9;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Processing media properties request: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      v13 = v9;
      v15 = objc_getProperty(self, v14, 64, 1);
      dispatch_assert_queue_V2(v15);
      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      v93 = (id)objc_msgSend(objc_getProperty(self, v16, 48, 1), "copy");
      v17 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v98, buf, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v99;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v99 != v18)
              objc_enumerationMutation(v93);
            v20 = *(id *)(*((_QWORD *)&v98 + 1) + 8 * v19);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v21 = v20;
            else
              v21 = 0;
            v22 = v21;

            if (v22)
            {
              objc_msgSend(v22, "deviceIdsDestination");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "deviceIdsDestination");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v23, "isEqualToString:", v24) & 1) != 0)
              {
                objc_msgSend(v22, "mediaProfileUUID");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "mediaProfileUUID");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v25, "isEqual:", v26);

                if (v27)
                {
                  objc_msgSend(v22, "mediaProperties");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v13, "mediaProperties");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "minusSet:", v29);

                  objc_msgSend(v22, "mediaProperties");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = objc_msgSend(v30, "count") == 0;

                  v32 = (void *)MEMORY[0x227676638]();
                  v33 = self;
                  HMFGetOSLogHandle();
                  v34 = objc_claimAutoreleasedReturnValue();
                  v35 = os_log_type_enabled(v34, OS_LOG_TYPE_INFO);
                  if (v31)
                  {
                    if (v35)
                    {
                      HMFGetLogIdentifier();
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v103 = 138543618;
                      v104 = v37;
                      v105 = 2112;
                      v106 = v22;
                      _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, "%{public}@Removing pending media properties request that matches a new media properties request: %@", v103, 0x16u);

                    }
                    objc_autoreleasePoolPop(v32);
                    objc_msgSend(objc_getProperty(v33, v38, 48, 1), "removeObject:", v22);
                  }
                  else
                  {
                    if (v35)
                    {
                      HMFGetLogIdentifier();
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v103 = 138543618;
                      v104 = v36;
                      v105 = 2112;
                      v106 = v22;
                      _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, "%{public}@Updated pending media properties request: %@", v103, 0x16u);

                    }
                    objc_autoreleasePoolPop(v32);
                  }
                }
              }
              else
              {

              }
            }

            ++v19;
          }
          while (v17 != v19);
          v39 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v98, buf, 16);
          v17 = v39;
        }
        while (v39);
      }

      -[HMDNotificationRegistry home]((id *)self);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mediaProfileUUID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "mediaProfileWithUUID:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
      {
        objc_msgSend(v13, "mediaProperties");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "count") == 0;

        if (!v44)
        {
          v45 = objc_msgSend(v13, "enable");
          v46 = (void *)MEMORY[0x227676638]();
          v47 = (os_unfair_lock_s *)self;
          HMFGetOSLogHandle();
          v48 = objc_claimAutoreleasedReturnValue();
          v49 = os_log_type_enabled(v48, OS_LOG_TYPE_INFO);
          if (v45)
          {
            if (v49)
            {
              HMFGetLogIdentifier();
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "mediaProperties");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v108 = v50;
              v109 = 2112;
              v110 = v42;
              v111 = 2112;
              v112 = v51;
              _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_INFO, "%{public}@Enabling notification for media profile: %@ media properties: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v46);
            objc_msgSend(v13, "mediaProperties");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "user");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "deviceIdsDestination");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = v42;
            v56 = v52;
            v57 = v53;
            v58 = v54;
            if (objc_msgSend(v56, "count"))
            {
              v59 = v47 + 2;
              os_unfair_lock_lock_with_options();
              v61 = objc_getProperty(v47, v60, 32, 1);
              v62 = objc_msgSend(v61, "enableNotificationForMediaProfile:mediaProperties:user:deviceIdsDestination:", v55, v56, v57, v58);

              os_unfair_lock_unlock(v59);
              if ((v62 & 1) == 0)
              {
LABEL_39:
                v63 = 0;
LABEL_53:
                v87 |= v63;
                goto LABEL_54;
              }
              goto LABEL_50;
            }
          }
          else
          {
            if (v49)
            {
              HMFGetLogIdentifier();
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "mediaProperties");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v108 = v72;
              v109 = 2112;
              v110 = v42;
              v111 = 2112;
              v112 = v73;
              _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_INFO, "%{public}@Disabling notification for media profile: %@ media properties: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v46);
            objc_msgSend(v13, "mediaProperties");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "user");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "deviceIdsDestination");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = v42;
            v56 = v74;
            v57 = v75;
            v58 = v76;
            if (objc_msgSend(v56, "count"))
            {
              v77 = v47 + 2;
              os_unfair_lock_lock_with_options();
              v79 = objc_getProperty(v47, v78, 32, 1);
              v80 = objc_msgSend(v79, "disableNotificationForMediaProfile:mediaProperties:user:deviceIdsDestination:", v55, v56, v57, v58);

              os_unfair_lock_unlock(v77);
              if ((v80 & 1) == 0)
                goto LABEL_39;
LABEL_50:
              objc_msgSend(v42, "uniqueIdentifier", v83);
              v56 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "addObject:", v56);
              v63 = 1;
LABEL_52:

              goto LABEL_53;
            }
          }

          v63 = 0;
          goto LABEL_52;
        }
        v68 = (void *)MEMORY[0x227676638]();
        v69 = self;
        HMFGetOSLogHandle();
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v108 = v71;
          v109 = 2112;
          v110 = v13;
          _os_log_impl(&dword_2218F0000, v70, OS_LOG_TYPE_INFO, "%{public}@No media properties exist for request: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v68);
      }
      else
      {
        v64 = (void *)MEMORY[0x227676638]();
        v65 = self;
        HMFGetOSLogHandle();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v108 = v67;
          v109 = 2112;
          v110 = v13;
          _os_log_impl(&dword_2218F0000, v66, OS_LOG_TYPE_INFO, "%{public}@Cannot find media profile for media properties request so adding to pending requests: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v64);
        objc_msgSend(v85, "addObject:", v13);
      }
LABEL_54:

      v7 = v91 + 1;
    }
    while (v91 + 1 != v90);
    v90 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
  }
  while (v90);
LABEL_59:

  -[HMDNotificationRegistry _addPendingRequests:](v89, v85);
  if (objc_msgSend(v84, "count"))
  {
    objc_msgSend(v84, "allObjects");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNotificationRegistry notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles:](v89, v81);

  }
LABEL_62:

  return v87 & 1;
}

- (id)home
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 7);
  return WeakRetained;
}

- (void)_addPendingRequests:(void *)a1
{
  id v3;
  SEL v4;
  NSObject *Property;
  const char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  SEL v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  Property = objc_getProperty(a1, v4, 64, 1);
  dispatch_assert_queue_V2(Property);
  if (objc_msgSend(v3, "count"))
  {
    v7 = objc_msgSend(objc_getProperty(a1, v6, 48, 1), "unionSet:", v3);
    v8 = (void *)MEMORY[0x227676638](v7);
    v9 = a1;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Resuming pending requests timer", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(objc_getProperty(v9, v12, 40, 1), "resume");
  }

}

- (void)notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v3 = a2;
  if (a1)
  {
    -[HMDNotificationRegistry delegates]((uint64_t)a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, a1);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __81__HMDNotificationRegistry_notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles___block_invoke;
    v6[3] = &unk_24E7792F0;
    objc_copyWeak(&v8, &location);
    v7 = v3;
    objc_msgSend(v5, "na_each:", v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);

  }
}

- (id)delegates
{
  os_unfair_lock_s *v2;
  void *v3;

  v2 = (os_unfair_lock_s *)(a1 + 8);
  os_unfair_lock_lock_with_options();
  v3 = (void *)objc_msgSend(*(id *)(a1 + 16), "copy");
  os_unfair_lock_unlock(v2);
  return v3;
}

void __81__HMDNotificationRegistry_notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  const char *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = WeakRetained;
    if (WeakRetained)
      WeakRetained = objc_getProperty(WeakRetained, v5, 64, 1);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __81__HMDNotificationRegistry_notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles___block_invoke_2;
    block[3] = &unk_24E7965D0;
    v7 = WeakRetained;
    objc_copyWeak(&v11, (id *)(a1 + 40));
    v9 = v3;
    v10 = *(id *)(a1 + 32);
    dispatch_async(v7, block);

    objc_destroyWeak(&v11);
  }

}

void __81__HMDNotificationRegistry_notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (void *)MEMORY[0x227676638]();
  v4 = WeakRetained;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543618;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@About to notify delegate of mediaPropertyRegistrationsDidChange %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 32), "mediaPropertyRegistrationsDidChangeForMediaProfiles:", *(_QWORD *)(a1 + 40));

}

uint64_t __59__HMDNotificationRegistry__processCharacteristicsRequests___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(v3, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "characteristicInstanceIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instanceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "containsObject:", v8))
    v9 = objc_msgSend(*(id *)(a1 + 40), "shouldFilterChangeNotificationsForCharacteristicType:serviceType:", v4, v6) ^ 1;
  else
    v9 = 0;

  return v9;
}

HMDCharacteristicNotificationChangeThreshold *__59__HMDNotificationRegistry__processCharacteristicsRequests___block_invoke_118(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  HMDCharacteristicNotificationChangeThreshold *v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "characteristicChangeThresholds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HMDCharacteristicNotificationChangeThreshold initWithCharacteristic:threshold:]([HMDCharacteristicNotificationChangeThreshold alloc], "initWithCharacteristic:threshold:", v3, v6);
  return v7;
}

void __79__HMDNotificationRegistry__processCoreDataRequestResults_pendingRequestsToAdd___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "coreDataRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "didSucceed") & 1) != 0)
  {
    if (objc_msgSend(v3, "didModify"))
    {
      objc_msgSend(v4, "characteristicThresholds");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "characteristic");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accessory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "modifiedCharacteristics");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceIdsDestination");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "hmf_isEmpty") & 1) != 0)
      {
LABEL_14:

        goto LABEL_15;
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      v12 = objc_msgSend(v5, "enable");
      v13 = (void *)MEMORY[0x227676638]();
      v14 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
      if (v12)
      {
        if (v16)
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "uuid");
          v27 = v13;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "UUIDString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v30 = v26;
          v31 = 2112;
          v32 = v17;
          v33 = 2112;
          v34 = v18;
          v35 = 2112;
          v36 = v10;
          _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Enabling notification for accessory %@/%@ characteristics %@", buf, 0x2Au);

          v13 = v27;
LABEL_12:

        }
      }
      else if (v16)
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uuid");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "UUIDString");
        v28 = v13;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v30 = v26;
        v31 = 2112;
        v32 = v17;
        v33 = 2112;
        v34 = v23;
        v35 = 2112;
        v36 = v10;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Disabling notification for accessory %@/%@ characteristics %@", buf, 0x2Au);

        v13 = v28;
        goto LABEL_12;
      }

      objc_autoreleasePoolPop(v13);
      objc_msgSend(v9, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", objc_msgSend(v5, "enable"), v10, v11);
      objc_msgSend(v9, "updateNotificationEnabled:forCharacteristics:onBehalfOf:", objc_msgSend(v5, "enable"), v10, v11);
      goto LABEL_14;
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v22;
      v31 = 2112;
      v32 = v5;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Processing request: %@ failed, adding to pending requests", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }
LABEL_15:

}

void __205__HMDNotificationRegistry_setNotificationsEnabled_user_deviceIdsDestination_characteristicsPayload_characteristicChangeThresholdsPayload_mediaPropertiesPayload_actionSetsPayload_matterNotificationPayload___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v9[0] = CFSTR("HMDHomeCHIPNodeIDMessageKey");
  v9[1] = CFSTR("HMDHomeCHIPReportMessageKey");
  v10[0] = v3;
  v10[1] = a2;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a2;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE3F1D0], "messageWithName:messagePayload:", CFSTR("HMDHomeCHIPSendReportMessage"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __205__HMDNotificationRegistry_setNotificationsEnabled_user_deviceIdsDestination_characteristicsPayload_characteristicChangeThresholdsPayload_mediaPropertiesPayload_actionSetsPayload_matterNotificationPayload___block_invoke_2;
  v8[3] = &unk_24E79B7E0;
  v8[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v7, "setResponseHandler:", v8);
  objc_msgSend(*(id *)(a1 + 48), "handleCHIPSendReportMessage:", v7);

}

void __205__HMDNotificationRegistry_setNotificationsEnabled_user_deviceIdsDestination_characteristicsPayload_characteristicChangeThresholdsPayload_mediaPropertiesPayload_actionSetsPayload_matterNotificationPayload___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v10;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@CHIP report handling complete: error %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v7);

}

- (void)notifyDelegatesOfRegistryUpdatesForActionSets:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v3 = a2;
  if (a1)
  {
    -[HMDNotificationRegistry delegates]((uint64_t)a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, a1);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __73__HMDNotificationRegistry_notifyDelegatesOfRegistryUpdatesForActionSets___block_invoke;
    v6[3] = &unk_24E7792F0;
    objc_copyWeak(&v8, &location);
    v7 = v3;
    objc_msgSend(v5, "na_each:", v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);

  }
}

void __73__HMDNotificationRegistry_notifyDelegatesOfRegistryUpdatesForActionSets___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  const char *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = WeakRetained;
    if (WeakRetained)
      WeakRetained = objc_getProperty(WeakRetained, v5, 64, 1);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __73__HMDNotificationRegistry_notifyDelegatesOfRegistryUpdatesForActionSets___block_invoke_2;
    block[3] = &unk_24E7965D0;
    v7 = WeakRetained;
    objc_copyWeak(&v11, (id *)(a1 + 40));
    v9 = v3;
    v10 = *(id *)(a1 + 32);
    dispatch_async(v7, block);

    objc_destroyWeak(&v11);
  }

}

void __73__HMDNotificationRegistry_notifyDelegatesOfRegistryUpdatesForActionSets___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (void *)MEMORY[0x227676638]();
  v4 = WeakRetained;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543618;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@About to notify delegate of stateRegistrationsDidChangeForActionSetUUIDs %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 32), "stateRegistrationsDidChangeForActionSetUUIDs:", *(_QWORD *)(a1 + 40));

}

void __74__HMDNotificationRegistry_parseChangeThresholdsFromPayload_accessoryUUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  BOOL v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v10 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v9)
    v13 = v12 == 0;
  else
    v13 = 1;
  if (v13)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v17;
      v24 = 2112;
      v25 = v9;
      v26 = 2112;
      v27 = v12;
      v18 = "%{public}@Change threshold key %@ or value %@ was not of expected type";
LABEL_18:
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v22, 0x20u);

    }
LABEL_19:

    objc_autoreleasePoolPop(v14);
    goto LABEL_20;
  }
  v19 = objc_msgSend(v9, "integerValue");
  if (v19 <= 0)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v17;
      v24 = 2112;
      v25 = v9;
      v26 = 2112;
      v27 = v12;
      v18 = "%{public}@Change threshold key %@ with value %@ is an invalid instance id";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v20 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v12, v21);

LABEL_20:
}

void __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD aBlock[4];
  id v17;
  id v18;
  id v19;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v3, "characteristicInstanceID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmdCharacteristicForInstanceId:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "deviceIdsDestination");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 40);
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_2;
    aBlock[3] = &unk_24E79BBD0;
    v17 = v11;
    v18 = v10;
    v19 = v8;
    v13 = v10;
    v14 = v11;
    v15 = _Block_copy(aBlock);
    objc_msgSend(v12, "addObject:", v15);

  }
}

id __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_94(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v3, "characteristicInstanceID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmdCharacteristicForInstanceId:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_2_96(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  id Property;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;

  v4 = a2;
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v3, 32, 1);
  objc_msgSend(Property, "destinationsToNotifyForCharacteristic:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count"))
  {
    objc_msgSend(v4, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 40);
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_3;
    v14 = &unk_24E79C268;
    v15 = v4;
    v16 = v7;
    v9 = v7;
    v10 = _Block_copy(&v11);
    objc_msgSend(v8, "addObject:", v10, v11, v12, v13, v14);

  }
}

void __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_2_100(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDNotificationRegistry notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles:](v1, v2);

}

void __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDNotificationRegistry notifyDelegatesOfRegistryUpdatesForActionSets:](v1, v2);

}

uint64_t __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_3_101(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "actionSetUUID");
}

uint64_t __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_97(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mediaProfileUniqueIdentifier");
}

void __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v10 = v4;
    v11 = 2112;
    v12 = 0;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_2218F0000, v3, OS_LOG_TYPE_INFO, "%{public}@Deregistering client %@ for notification for characteristic %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  v6 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", 0, v7, 0);

}

void __62__HMDNotificationRegistry_auditNotificationDestinations_home___block_invoke_2(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = a1[4];
    v6 = a1[5];
    *(_DWORD *)buf = 138543874;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_2218F0000, v3, OS_LOG_TYPE_INFO, "%{public}@Deregistering client %@ for notification for characteristic %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = (void *)a1[6];
  v9 = a1[5];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", 0, v8, a1[4]);

}

id __74__HMDNotificationRegistry_characteristicsByDestinationForCharacteristics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  id v7;
  id Property;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a2;
  v7 = a3;
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v6, 32, 1);
  objc_msgSend(Property, "destinationsToNotifyForCharacteristic:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __74__HMDNotificationRegistry_characteristicsByDestinationForCharacteristics___block_invoke_2;
  v15[3] = &unk_24E796918;
  v10 = v7;
  v16 = v10;
  v17 = v5;
  v11 = v5;
  objc_msgSend(v9, "na_each:", v15);
  v12 = v17;
  v13 = v10;

  return v13;
}

void __74__HMDNotificationRegistry_characteristicsByDestinationForCharacteristics___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v4);
  }
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));

}

void __50__HMDNotificationRegistry_disableAllRegistrations__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  v10 = a2;
  if (objc_msgSend(v10, "isCurrentAccessory"))
  {
    *a4 = 1;
    objc_msgSend(v10, "uuid");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(v10, "services");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __50__HMDNotificationRegistry_disableAllRegistrations__block_invoke_2;
    v11[3] = &unk_24E779118;
    v11[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v9, "na_each:", v11);

  }
}

void __50__HMDNotificationRegistry_disableAllRegistrations__block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  v14[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(id **)(a1 + 32);
  -[HMDNotificationRegistry home](v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentUser");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNotificationsEnabled:user:deviceIdsDestination:characteristicsPayload:characteristicChangeThresholdsPayload:mediaPropertiesPayload:actionSetsPayload:matterNotificationPayload:", 1, v12, v7, v9, MEMORY[0x24BDBD1B8], MEMORY[0x24BDBD1B8], MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1B8]);

}

void __50__HMDNotificationRegistry_disableAllRegistrations__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[5];

  objc_msgSend(a2, "characteristics");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__HMDNotificationRegistry_disableAllRegistrations__block_invoke_3;
  v4[3] = &unk_24E7790F0;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v4);

}

void __50__HMDNotificationRegistry_disableAllRegistrations__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(v3, "localClientIdentifiersWithNotificationsEnabled");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__HMDNotificationRegistry_disableAllRegistrations__block_invoke_4;
  v7[3] = &unk_24E7790C8;
  v4 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v4;
  v5 = v3;
  objc_msgSend(v6, "na_each:", v7);

}

void __50__HMDNotificationRegistry_disableAllRegistrations__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v3, v5);
  }
  objc_msgSend(*(id *)(a1 + 32), "instanceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

void __70__HMDNotificationRegistry_reprocessEnabledCharacteristicRegistrations__block_invoke(uint64_t a1, const char *a2)
{
  void *v2;
  NSObject *Property;
  SEL v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    Property = objc_getProperty(*(id *)(a1 + 32), a2, 64, 1);
    dispatch_assert_queue_V2(Property);
    objc_msgSend(objc_getProperty(v2, v4, 32, 1), "enabledCharacteristicRegistrations");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_27659);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __71__HMDNotificationRegistry__reprocessEnabledCharacteristicRegistrations__block_invoke_2;
      v7[3] = &unk_24E7790A0;
      v7[4] = v2;
      objc_msgSend(v5, "na_each:", v7);

    }
  }
}

void __71__HMDNotificationRegistry__reprocessEnabledCharacteristicRegistrations__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  objc_msgSend(v6, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_75);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71__HMDNotificationRegistry__reprocessEnabledCharacteristicRegistrations__block_invoke_4;
  v10[3] = &unk_24E779078;
  v10[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v11 = v9;
  objc_msgSend(v8, "na_each:", v10);

  objc_autoreleasePoolPop(v7);
}

void __71__HMDNotificationRegistry__reprocessEnabledCharacteristicRegistrations__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  -[HMDNotificationRegistry home](*(id **)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessoryWithUUID:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __71__HMDNotificationRegistry__reprocessEnabledCharacteristicRegistrations__block_invoke_5;
    v26[3] = &unk_24E779050;
    v12 = v11;
    v27 = v12;
    objc_msgSend(v6, "na_map:", v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x227676638]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v22 = v5;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v24 = v7;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uuid");
      v25 = v6;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "UUIDString");
      v23 = v15;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v29 = v18;
      v30 = 2112;
      v31 = v19;
      v32 = 2112;
      v33 = v21;
      v34 = 2112;
      v35 = v14;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Re-Enabling notification for accessory %@/%@ characteristics %@", buf, 0x2Au);

      v15 = v23;
      v6 = v25;

      v7 = v24;
      v5 = v22;
    }

    objc_autoreleasePoolPop(v15);
    objc_msgSend(v12, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", 1, v14, *(_QWORD *)(a1 + 40));
    objc_msgSend(v12, "updateNotificationEnabled:forCharacteristics:onBehalfOf:", 1, v14, *(_QWORD *)(a1 + 40));

  }
  objc_autoreleasePoolPop(v7);

}

id __71__HMDNotificationRegistry__reprocessEnabledCharacteristicRegistrations__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "characteristicInstanceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmdCharacteristicForInstanceId:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __71__HMDNotificationRegistry__reprocessEnabledCharacteristicRegistrations__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessoryUUID");
}

uint64_t __71__HMDNotificationRegistry__reprocessEnabledCharacteristicRegistrations__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deviceIdsDestination");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t85 != -1)
    dispatch_once(&logCategory__hmf_once_t85, &__block_literal_global_128);
  return (id)logCategory__hmf_once_v86;
}

void __38__HMDNotificationRegistry_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v86;
  logCategory__hmf_once_v86 = v0;

}

@end

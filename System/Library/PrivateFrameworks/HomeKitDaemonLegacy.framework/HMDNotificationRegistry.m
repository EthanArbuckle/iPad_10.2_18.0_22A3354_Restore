@implementation HMDNotificationRegistry

- (HMDNotificationRegistry)init
{
  void *v3;
  HMDNotificationRegistry *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 0, 5.0);
  v4 = -[HMDNotificationRegistry initWithPendingRequestsRetryTimer:](self, "initWithPendingRequestsRetryTimer:", v3);

  return v4;
}

- (HMDNotificationRegistry)initWithPendingRequestsRetryTimer:(id)a3
{
  id v5;
  HMDNotificationRegistry *v6;
  HMDNotificationRegistry *v7;
  uint64_t v8;
  NSMutableDictionary *notificationRegistry;
  uint64_t v10;
  NSHashTable *delegates;
  uint64_t v12;
  NSMutableSet *pendingRequests;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMDNotificationRegistry;
  v6 = -[HMDNotificationRegistry init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_pendingRequestsRetryTimer, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    notificationRegistry = v7->_notificationRegistry;
    v7->_notificationRegistry = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    delegates = v7->_delegates;
    v7->_delegates = (NSHashTable *)v10;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    pendingRequests = v7->_pendingRequests;
    v7->_pendingRequests = (NSMutableSet *)v12;

  }
  return v7;
}

- (void)configureWithHome:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  const char *v6;
  void *v7;
  SEL v8;
  id Property;
  id v10;
  const char *v11;
  id v12;
  SEL v13;
  id v14;
  id v15;
  id obj;

  obj = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self)
    objc_storeWeak((id *)&self->_home, obj);
  objc_msgSend(obj, "workQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (self)
  {
    objc_setProperty_atomic(self, v6, v5, 64);

    Property = objc_getProperty(self, v8, 40, 1);
  }
  else
  {

    Property = 0;
  }
  v10 = Property;
  objc_msgSend(v10, "setDelegate:", self);

  if (self)
  {
    v12 = objc_getProperty(self, v11, 64, 1);
    v14 = objc_getProperty(self, v13, 40, 1);
  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
  v15 = v14;
  objc_msgSend(v15, "setDelegateQueue:", v12);

  os_unfair_lock_unlock(p_lock);
}

- (void)clearAllRegistrations
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  id v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  os_unfair_lock_unlock(p_lock);
  -[HMDNotificationRegistry notifyDelegatesIfKeysAreMediaRelated:]((uint64_t)self, v6);

}

- (id)shortDescription
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)removeRegistrationsForCharacteristics:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        -[HMDNotificationRegistry keyForCharacteristic:]((uint64_t)self, *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v9, (_QWORD)v11);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)removeRegistrationsForMediaProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  os_unfair_lock_t lock;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (!v7)
  {

    os_unfair_lock_unlock(lock);
    goto LABEL_16;
  }
  v8 = 0;
  v9 = *(_QWORD *)v22;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v22 != v9)
        objc_enumerationMutation(v6);
      v11 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * i);
      if (self)
      {
        objc_msgSend(v4, "uniqueIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v14 = objc_msgSend(v11, "hasPrefix:", v13);

          if (!v14)
            continue;
          -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "removeObjectForKey:", v11);
          v8 = 1;
          v11 = v15;
        }
      }

    }
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  }
  while (v7);

  os_unfair_lock_unlock(lock);
  if ((v8 & 1) == 0)
  {
LABEL_16:
    v18 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v4, "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNotificationRegistry notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles:]((uint64_t)self, v17);

  v18 = 1;
LABEL_17:

  return v18;
}

- (id)filterCharacteristics:(id)a3 forUser:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v18 = v6;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock_with_options();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          -[HMDNotificationRegistry keyForCharacteristic:]((uint64_t)self, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v15, "containsObject:", v7))
              objc_msgSend(v19, "addObject:", v12);

          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }

    os_unfair_lock_unlock(&self->_lock);
    v16 = (void *)objc_msgSend(v19, "copy");

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v16;
}

- (id)filterProperties:(id)a3 forUser:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  os_unfair_lock_t lock;
  void *v19;
  void *v20;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v23 = a4;
  v19 = v5;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = v5;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v25 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v9, "request", lock);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "property");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "mediaProfile");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            -[HMDNotificationRegistry keyForProperty:mediaProfile:]((uint64_t)self, v11, v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v15, "containsObject:", v23))
              objc_msgSend(v20, "addObject:", v9);

          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v6);
    }

    os_unfair_lock_unlock(lock);
    v16 = (void *)objc_msgSend(v20, "copy");

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v16;
}

- (id)propertiesRegisteredForMediaProfileUniqueIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__HMDNotificationRegistry_propertiesRegisteredForMediaProfileUniqueIdentifier___block_invoke;
  v10[3] = &unk_1E89A6B78;
  v7 = v4;
  v11 = v7;
  objc_msgSend(v6, "na_map:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (id)usersRegisteredForNotificationsForCharacteristics:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    os_unfair_lock_lock_with_options();
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v6);
          -[HMDNotificationRegistry keyForCharacteristic:]((uint64_t)self, *(void **)(*((_QWORD *)&v16 + 1) + 8 * i));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v12, "allObjects");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObjectsFromArray:", v13);

          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    os_unfair_lock_unlock(&self->_lock);
  }
  v14 = (void *)objc_msgSend(v5, "copy");

  return v14;
}

- (id)usersRegisteredForNotificationsForProperties:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  os_unfair_lock_t lock;
  id v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count"))
  {
    lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    obj = v17;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v21;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v21 != v5)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v6), "request", lock);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "property");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "mediaProfile");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            -[HMDNotificationRegistry keyForProperty:mediaProfile:]((uint64_t)self, v8, v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectForKeyedSubscript:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12)
            {
              objc_msgSend(v12, "allObjects");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObjectsFromArray:", v13);

            }
          }

          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v4);
    }

    os_unfair_lock_unlock(lock);
  }
  v14 = (void *)objc_msgSend(v18, "copy", lock);

  return v14;
}

- (void)auditUsersForNotifications:(id)a3 forHome:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  id v34;
  os_unfair_lock *lock;
  id v36;
  id v37;
  void *v38;
  int v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  id v44;
  void *v45;
  _BOOL4 v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[6];
  id v57;
  _QWORD aBlock[7];
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t v68[128];
  _BYTE v69[24];
  void *v70;
  HMDNotificationRegistry *v71;
  id v72;
  uint8_t v73[128];
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  id v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v34 = a4;
  v47 = isiOSDevice();
  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v5, "isResidentCapable");

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __62__HMDNotificationRegistry_auditUsersForNotifications_forHome___block_invoke;
  v54[3] = &unk_1E89A6BC0;
  v37 = v6;
  v55 = v37;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v54);

  objc_msgSend(v37, "minusSet:", v36);
  if (objc_msgSend(v37, "count"))
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v75 = v10;
      v76 = 2112;
      v77 = v37;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Users %@ are not associated with this phone anymore. Deregistering them from notification registry", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v11 = v37;
    v44 = v34;
    if (self)
    {
      os_unfair_lock_assert_owner(lock);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allKeys");
      obj = (id)objc_claimAutoreleasedReturnValue();

      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, buf, 16);
      if (v42)
      {
        v41 = *(_QWORD *)v65;
        do
        {
          for (i = 0; i != v42; ++i)
          {
            if (*(_QWORD *)v65 != v41)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
            -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = v13;
            objc_msgSend(v14, "objectForKeyedSubscript:", v13);
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            v62 = 0u;
            v63 = 0u;
            v60 = 0u;
            v61 = 0u;
            v15 = (void *)objc_msgSend(v49, "copy");
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
            if (v16)
            {
              v17 = *(_QWORD *)v61;
              do
              {
                for (j = 0; j != v16; ++j)
                {
                  if (*(_QWORD *)v61 != v17)
                    objc_enumerationMutation(v15);
                  v19 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j);
                  v20 = (void *)IDSCopyRawAddressForDestination();
                  if ((objc_msgSend(v11, "containsObject:", v20) & 1) != 0
                    || objc_msgSend(v11, "containsObject:", v19))
                  {
                    v21 = (void *)MEMORY[0x1D17BA0A0]();
                    HMFGetOSLogHandle();
                    v22 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                    {
                      HMFGetLogIdentifier();
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v69 = 138543874;
                      *(_QWORD *)&v69[4] = v23;
                      *(_WORD *)&v69[12] = 2112;
                      *(_QWORD *)&v69[14] = v19;
                      *(_WORD *)&v69[22] = 2112;
                      v70 = v48;
                      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Removing user %@ from notification registry for acc-uuid:iid %@", v69, 0x20u);

                    }
                    objc_autoreleasePoolPop(v21);
                    objc_msgSend(v49, "removeObject:", v19);
                    if (v47)
                    {
                      aBlock[0] = MEMORY[0x1E0C809B0];
                      aBlock[1] = 3221225472;
                      aBlock[2] = __99__HMDNotificationRegistry__delayedBlocksCollectedWhileDeregisteringUsers_forHome_isiOS_isResident___block_invoke;
                      aBlock[3] = &unk_1E89C07B8;
                      aBlock[4] = self;
                      aBlock[5] = v48;
                      aBlock[6] = v19;
                      v59 = v44;
                      v24 = _Block_copy(aBlock);
                      objc_msgSend(v45, "addObject:", v24);

                    }
                  }

                }
                v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
              }
              while (v16);
            }

            if (!objc_msgSend(v49, "count"))
            {
              if (v39)
              {
                v56[0] = MEMORY[0x1E0C809B0];
                v56[1] = 3221225472;
                v56[2] = __99__HMDNotificationRegistry__delayedBlocksCollectedWhileDeregisteringUsers_forHome_isiOS_isResident___block_invoke_2;
                v56[3] = &unk_1E89C20C8;
                v56[4] = self;
                v56[5] = v48;
                v57 = v44;
                v25 = _Block_copy(v56);
                objc_msgSend(v45, "addObject:", v25);

              }
              objc_msgSend(v38, "addObject:", v48, v34);
              -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "removeObjectForKey:", v48);

            }
          }
          v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, buf, 16);
        }
        while (v42);
      }

      *(_QWORD *)v69 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v69[8] = 3221225472;
      *(_QWORD *)&v69[16] = __99__HMDNotificationRegistry__delayedBlocksCollectedWhileDeregisteringUsers_forHome_isiOS_isResident___block_invoke_3;
      v70 = &unk_1E89C2328;
      v71 = self;
      v72 = v38;
      v27 = v38;
      v28 = _Block_copy(v69);
      objc_msgSend(v45, "addObject:", v28);

      v29 = (void *)objc_msgSend(v45, "copy");
    }
    else
    {
      v29 = 0;
    }

  }
  else
  {
    v29 = 0;
  }

  os_unfair_lock_unlock(lock);
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v30 = v29;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v51;
    do
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v51 != v32)
          objc_enumerationMutation(v30);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * k) + 16))();
      }
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
    }
    while (v31);
  }

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
      v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      -[HMDNotificationRegistry setChipRemoteSubscribers:](self, "setChipRemoteSubscribers:", v6);

    }
    -[HMDNotificationRegistry chipRemoteSubscribers](self, "chipRemoteSubscribers");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v4);

  }
}

- (BOOL)enableReachabilityEventNotificationForAccessoryUUIDs:(id)a3 forUserID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  os_unfair_lock_s *p_lock;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  -[HMDNotificationRegistry _reachabilityEventNotificationRegistryKeysForAccessoryUUIDs:](self, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __90__HMDNotificationRegistry_enableReachabilityEventNotificationForAccessoryUUIDs_forUserID___block_invoke;
  v12[3] = &unk_1E89A6BE8;
  v12[4] = self;
  v10 = v7;
  v13 = v10;
  v14 = &v15;
  objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v12);

  os_unfair_lock_unlock(p_lock);
  LOBYTE(p_lock) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)p_lock;
}

- (BOOL)disableReachabilityEventNotificationForAccessoryUUIDs:(id)a3 forUserID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  os_unfair_lock_s *p_lock;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  -[HMDNotificationRegistry _reachabilityEventNotificationRegistryKeysForAccessoryUUIDs:](self, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __91__HMDNotificationRegistry_disableReachabilityEventNotificationForAccessoryUUIDs_forUserID___block_invoke;
  v12[3] = &unk_1E89A6BE8;
  v12[4] = self;
  v10 = v7;
  v13 = v10;
  v14 = &v15;
  objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v12);

  os_unfair_lock_unlock(p_lock);
  LOBYTE(p_lock) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)p_lock;
}

- (id)userIDsRegisteredForReachabilityEventNotificationsForAccessoryUUIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        -[HMDNotificationRegistry _reachabilityEventNotificationRegistryKeyForAccessoryUUID:]((uint64_t)self, *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          objc_msgSend(v5, "unionSet:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->_lock);
  v13 = (void *)objc_msgSend(v5, "copy");

  return v13;
}

- (void)removeAllReachabilityEventNotificationRegistrations
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "containsString:", CFSTR(":ReachabilityEventNotification")))
        {
          -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v9);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)setNotificationsEnabled:(BOOL)a3 forUserID:(id)a4 characteristicsPayload:(id)a5 mediaPropertiesPayload:(id)a6
{
  id v9;
  const char *v10;
  NSObject *Property;
  void *v12;
  HMDNotificationRegistry *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  HMDNotificationRegistryCharacteristicsRequest *v31;
  void *v32;
  void *v33;
  HMDNotificationRegistry *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  HMDNotificationRegistry *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  HMDNotificationRegistry *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t i;
  id v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  HMDNotificationRegistryMediaPropertiesRequest *v63;
  void *v64;
  void *v65;
  HMDNotificationRegistry *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  HMDNotificationRegistry *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  HMDNotificationRegistry *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  _BOOL4 v82;
  int v83;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  _BOOL4 v92;
  id v93;
  HMDNotificationRegistry *v94;
  uint64_t v95;
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _BYTE v105[128];
  uint8_t v106[128];
  uint8_t buf[4];
  void *v108;
  __int16 v109;
  id v110;
  __int16 v111;
  id v112;
  uint64_t v113;

  v92 = a3;
  v113 = *MEMORY[0x1E0C80C00];
  v93 = a4;
  v9 = a5;
  v85 = a6;
  if (self)
    Property = objc_getProperty(self, v10, 64, 1);
  else
    Property = 0;
  dispatch_assert_queue_V2(Property);
  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v94 = v13;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v108 = v15;
    v109 = 2112;
    v110 = v16;
    v111 = 2112;
    v112 = v93;
    _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Setting notifications enabled to %@ for userID: %@", buf, 0x20u);

    v13 = v94;
  }

  objc_autoreleasePoolPop(v12);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v9, "count"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v17 = v9;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v101, v106, 16);
  v87 = v17;
  if (v18)
  {
    v19 = v18;
    v95 = *(_QWORD *)v102;
    do
    {
      v20 = 0;
      v90 = v19;
      do
      {
        if (*(_QWORD *)v102 != v95)
          objc_enumerationMutation(v17);
        v21 = *(id *)(*((_QWORD *)&v101 + 1) + 8 * v20);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v22 = v21;
        else
          v22 = 0;
        v23 = v22;

        if (v23)
        {
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v23);
          v25 = v24;
          if (v24)
          {
            objc_msgSend(v24, "UUIDString");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKeyedSubscript:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            v28 = v27;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v29 = v28;
            else
              v29 = 0;
            v30 = v29;

            if (v30)
            {
              v31 = -[HMDNotificationRegistryCharacteristicsRequest initWithEnable:userID:accessoryUUID:]([HMDNotificationRegistryCharacteristicsRequest alloc], "initWithEnable:userID:accessoryUUID:", v92, v93, v25);
              -[HMDNotificationRegistryCharacteristicsRequest characteristicInstanceIDs](v31, "characteristicInstanceIDs");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "addObjectsFromArray:", v30);

              objc_msgSend(v89, "addObject:", v31);
            }
            else
            {
              v43 = (void *)MEMORY[0x1D17BA0A0]();
              v44 = v13;
              HMFGetOSLogHandle();
              v45 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = (void *)objc_opt_class();
                *(_DWORD *)buf = 138543874;
                v108 = v46;
                v109 = 2112;
                v110 = v28;
                v111 = 2112;
                v112 = v47;
                v48 = v47;
                _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_INFO, "%{public}@Ignoring notification registration characteristics payload value that is not an array: %@)%@)", buf, 0x20u);

                v13 = v94;
              }

              objc_autoreleasePoolPop(v43);
              v17 = v87;
              v19 = v90;
            }

          }
          else
          {
            v39 = (void *)MEMORY[0x1D17BA0A0]();
            v40 = v13;
            HMFGetOSLogHandle();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v108 = v42;
              v109 = 2112;
              v110 = v23;
              _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_INFO, "%{public}@Ignoring accessory UUID string that cannot be converted in a UUID: %@", buf, 0x16u);

              v13 = v94;
            }

            objc_autoreleasePoolPop(v39);
          }

        }
        else
        {
          v33 = (void *)MEMORY[0x1D17BA0A0]();
          v34 = v13;
          HMFGetOSLogHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543874;
            v108 = v36;
            v109 = 2112;
            v110 = v21;
            v111 = 2112;
            v112 = v37;
            v38 = v37;
            _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_INFO, "%{public}@Ignoring notification registration characteristics payload key that is not a string: %@ (%@)", buf, 0x20u);

            v13 = v94;
          }

          objc_autoreleasePoolPop(v33);
        }

        ++v20;
      }
      while (v19 != v20);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v101, v106, 16);
    }
    while (v19);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v85, "count"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v49 = v85;
  v96 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v97, v105, 16);
  if (v96)
  {
    v50 = *(_QWORD *)v98;
    v91 = *(_QWORD *)v98;
    do
    {
      for (i = 0; i != v96; ++i)
      {
        if (*(_QWORD *)v98 != v50)
          objc_enumerationMutation(v49);
        v52 = *(id *)(*((_QWORD *)&v97 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v53 = v52;
        else
          v53 = 0;
        v54 = v53;

        if (v54)
        {
          v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v54);
          v56 = v55;
          if (v55)
          {
            objc_msgSend(v55, "UUIDString");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = v49;
            objc_msgSend(v49, "objectForKeyedSubscript:", v57);
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            v60 = v59;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v61 = v60;
            else
              v61 = 0;
            v62 = v61;

            if (v62)
            {
              v63 = -[HMDNotificationRegistryMediaPropertiesRequest initWithEnable:userID:mediaProfileUUID:]([HMDNotificationRegistryMediaPropertiesRequest alloc], "initWithEnable:userID:mediaProfileUUID:", v92, v93, v56);
              -[HMDNotificationRegistryMediaPropertiesRequest mediaProperties](v63, "mediaProperties");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "addObjectsFromArray:", v62);

              objc_msgSend(v88, "addObject:", v63);
            }
            else
            {
              v75 = (void *)MEMORY[0x1D17BA0A0]();
              v76 = v13;
              HMFGetOSLogHandle();
              v77 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                v78 = (void *)objc_opt_class();
                *(_DWORD *)buf = 138543874;
                v108 = v86;
                v109 = 2112;
                v110 = v60;
                v111 = 2112;
                v112 = v78;
                v79 = v75;
                v80 = v78;
                _os_log_impl(&dword_1CD062000, v77, OS_LOG_TYPE_INFO, "%{public}@Ignoring notification registration media properties payload value that is not an array: %@ (%@)", buf, 0x20u);

                v75 = v79;
              }

              objc_autoreleasePoolPop(v75);
              v13 = v94;
            }

            v49 = v58;
            v50 = v91;
          }
          else
          {
            v71 = (void *)MEMORY[0x1D17BA0A0]();
            v72 = v13;
            HMFGetOSLogHandle();
            v73 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v108 = v74;
              v109 = 2112;
              v110 = v54;
              _os_log_impl(&dword_1CD062000, v73, OS_LOG_TYPE_INFO, "%{public}@Ignoring media profile UUID string that cannot be converted in a UUID: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v71);
            v13 = v94;
          }

        }
        else
        {
          v65 = (void *)MEMORY[0x1D17BA0A0]();
          v66 = v13;
          HMFGetOSLogHandle();
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543874;
            v108 = v68;
            v109 = 2112;
            v110 = v52;
            v111 = 2112;
            v112 = v69;
            v70 = v69;
            _os_log_impl(&dword_1CD062000, v67, OS_LOG_TYPE_INFO, "%{public}@Ignoring notification registration media properties payload key that is not a string: %@ (%@)", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v65);
        }

      }
      v96 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v97, v105, 16);
    }
    while (v96);
  }

  -[HMDNotificationRegistry home]((id *)&v13->super.super.isa);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = -[HMDNotificationRegistry _processCharacteristicsRequests:](v13, v89);
  v83 = v82 | -[HMDNotificationRegistry _processMediaPropertiesRequests:](v13, v88);
  if (v83 == 1)
    objc_msgSend(v81, "saveToCurrentAccountWithReason:", CFSTR("kModifyCharacterisiticNotificationsRequestKey"));

  return v83;
}

- (HMDNotificationRegistry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  id obj;
  HMDNotificationRegistry *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _QWORD v27[5];

  v27[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = -[HMDNotificationRegistry init](self, "init");
  if (v21)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v27[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("notificationAndUsersRegistry"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("characteristicNotificationAndUsersRegistry"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v8, "allKeys", v7);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)MEMORY[0x1E0C99E20];
          objc_msgSend(v14, "allObjects");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setWithArray:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v21->_notificationRegistry, "setObject:forKeyedSubscript:", v17, v13);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v10);
    }

  }
  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v10 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = (void *)MEMORY[0x1E0C99E08];
  -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDNotificationRegistry notificationRegistry]((os_unfair_lock *)self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__HMDNotificationRegistry_encodeWithCoder___block_invoke;
  v11[3] = &unk_1E89A6BC0;
  v9 = v7;
  v12 = v9;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v11);

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("notificationAndUsersRegistry"));

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

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
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
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@adding delegate %@", (uint8_t *)&v9, 0x16u);

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

  v61 = *MEMORY[0x1E0C80C00];
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
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Pending requests retry timer fired", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    if (self)
    {
      v14 = objc_getProperty(v10, v13, 64, 1);
      dispatch_assert_queue_V2(v14);
      v16 = (void *)objc_msgSend(objc_getProperty(v10, v15, 48, 1), "copy");
      objc_msgSend(objc_getProperty(v10, v17, 48, 1), "removeAllObjects");
      v18 = objc_msgSend(v16, "count");
      v19 = (void *)MEMORY[0x1D17BA0A0]();
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
          _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Processing %lu pending request(s)", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v19);
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
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
                v31 = (void *)MEMORY[0x1D17BA0A0]();
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
                  _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_ERROR, "%{public}@Dropping pending request that is still around after %ld retries: %@", v51, 0x20u);

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
          _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@No pending requests to process", buf, 0xCu);

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
  objc_storeStrong((id *)&self->_chipRemoteSubscribers, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_notificationRegistry, 0);
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
  SEL v13;
  NSObject *Property;
  SEL v15;
  void *v16;
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
  os_unfair_lock_s *v33;
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
  id v44;
  void *v45;
  uint64_t v46;
  void *v47;
  int v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  _BOOL4 v53;
  void *v54;
  os_unfair_lock_s *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  os_unfair_lock_s *v59;
  NSObject *v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  _OWORD *v66;
  _OWORD *v67;
  _OWORD *v68;
  void *v69;
  os_unfair_lock_s *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  os_unfair_lock_s *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v83;
  _BOOL4 v84;
  id obj;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  os_unfair_lock_s *self;
  id v93;
  void *v94;
  void *v95;
  _QWORD v96[5];
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint8_t v106[128];
  uint8_t v107[4];
  void *v108;
  __int16 v109;
  id v110;
  _BYTE buf[24];
  void *v112;
  __int128 v113;
  __int128 *v114;
  __int128 *v115;
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v83 = v3;
  if (a1
    && (v5 = v3,
        v6 = objc_getProperty(a1, v4, 64, 1),
        dispatch_assert_queue_V2(v6),
        objc_msgSend(v5, "count")))
  {
    v89 = a1;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    obj = v83;
    v90 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v106, 16);
    if (v90)
    {
      LOBYTE(v84) = 0;
      v88 = *(_QWORD *)v99;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v99 != v88)
          {
            v8 = v7;
            objc_enumerationMutation(obj);
            v7 = v8;
          }
          v91 = v7;
          v9 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v7);
          v10 = (void *)MEMORY[0x1D17BA0A0]();
          self = v89;
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
            _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Processing characteristics request: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v10);
          v93 = v9;
          Property = objc_getProperty(self, v13, 64, 1);
          dispatch_assert_queue_V2(Property);
          v104 = 0u;
          v105 = 0u;
          v102 = 0u;
          v103 = 0u;
          v16 = (void *)objc_msgSend(objc_getProperty(self, v15, 48, 1), "copy");
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v102, buf, 16);
          if (v17)
          {
            v18 = *(_QWORD *)v103;
            do
            {
              v19 = 0;
              do
              {
                if (*(_QWORD *)v103 != v18)
                  objc_enumerationMutation(v16);
                v20 = *(id *)(*((_QWORD *)&v102 + 1) + 8 * v19);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v21 = v20;
                else
                  v21 = 0;
                v22 = v21;

                if (v22)
                {
                  objc_msgSend(v22, "userID");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v93, "userID");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v23, "isEqualToString:", v24) & 1) != 0)
                  {
                    objc_msgSend(v22, "accessoryUUID");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v93, "accessoryUUID");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v27 = objc_msgSend(v25, "isEqual:", v26);

                    if (v27)
                    {
                      objc_msgSend(v22, "characteristicInstanceIDs");
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v93, "characteristicInstanceIDs");
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v28, "minusSet:", v29);

                      objc_msgSend(v22, "characteristicInstanceIDs");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      v31 = objc_msgSend(v30, "count") == 0;

                      v32 = (void *)MEMORY[0x1D17BA0A0]();
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
                          *(_DWORD *)v107 = 138543618;
                          v108 = v37;
                          v109 = 2112;
                          v110 = v22;
                          _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_INFO, "%{public}@Removing pending characteristics request that matches a new characteristics request: %@", v107, 0x16u);

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
                          *(_DWORD *)v107 = 138543618;
                          v108 = v36;
                          v109 = 2112;
                          v110 = v22;
                          _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_INFO, "%{public}@Updated pending characteristics request: %@", v107, 0x16u);

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
              v39 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v102, buf, 16);
              v17 = v39;
            }
            while (v39);
          }

          -[HMDNotificationRegistry home]((id *)self);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "accessoryUUID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "accessoryWithUUID:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v43 = v42;
          else
            v43 = 0;
          v44 = v43;

          if (v44)
          {
            v96[0] = MEMORY[0x1E0C809B0];
            v96[1] = 3221225472;
            v96[2] = __59__HMDNotificationRegistry__processCharacteristicsRequests___block_invoke;
            v96[3] = &unk_1E89A6C10;
            v96[4] = v93;
            v97 = v86;
            objc_msgSend(v44, "characteristicsPassingTest:", v96);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v45, "count");
            objc_msgSend(v93, "characteristicInstanceIDs");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v46) = v46 == objc_msgSend(v47, "count");

            if ((v46 & 1) != 0)
            {
              v48 = objc_msgSend(v93, "enable");
              objc_msgSend(v93, "userID");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              if (v48)
              {
                v50 = v45;
                v51 = v49;
                -[HMDNotificationRegistry _createCharacteristicsMapForCharacteristics:]((uint64_t)self, v50);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v52, "count"))
                {
                  *(_QWORD *)&v102 = 0;
                  *((_QWORD *)&v102 + 1) = &v102;
                  *(_QWORD *)&v103 = 0x2020000000;
                  BYTE8(v103) = 0;
                  os_unfair_lock_lock_with_options();
                  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                  *(_QWORD *)&buf[8] = 3221225472;
                  *(_QWORD *)&buf[16] = __72__HMDNotificationRegistry_enableNotificationForCharacteristics_forUser___block_invoke;
                  v112 = &unk_1E89A6B28;
                  *(_QWORD *)&v113 = self;
                  *((_QWORD *)&v113 + 1) = v51;
                  v114 = &v102;
                  objc_msgSend(v52, "enumerateKeysAndObjectsUsingBlock:", buf);

                  os_unfair_lock_unlock(self + 2);
                  v53 = *(_BYTE *)(*((_QWORD *)&v102 + 1) + 24) != 0;
                  _Block_object_dispose(&v102, 8);
                }
                else
                {
                  v53 = 0;
                }

                objc_msgSend(v93, "userID");
                v68 = (_OWORD *)objc_claimAutoreleasedReturnValue();
                if (v53)
                {
                  v69 = (void *)MEMORY[0x1D17BA0A0]();
                  v70 = self;
                  HMFGetOSLogHandle();
                  v71 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v94 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v44, "name");
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v44, "uuid");
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v73, "UUIDString");
                    v74 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138544130;
                    *(_QWORD *)&buf[4] = v94;
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v72;
                    *(_WORD *)&buf[22] = 2112;
                    v112 = v74;
                    LOWORD(v113) = 2112;
                    *(_QWORD *)((char *)&v113 + 2) = v50;
                    _os_log_impl(&dword_1CD062000, v71, OS_LOG_TYPE_INFO, "%{public}@Enabling notification for accessory %@/%@ characteristics %@", buf, 0x2Au);

                  }
                  objc_autoreleasePoolPop(v69);
                  objc_msgSend(v44, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", 1, v50, v68);
                  objc_msgSend(v44, "updateNotificationEnabled:forCharacteristics:onBehalfOf:", 1, v50, v68);
                  LOBYTE(v84) = 1;
                }
                else
                {
                  LOBYTE(v84) = 0;
                }
              }
              else
              {
                v62 = v45;
                v63 = v49;
                -[HMDNotificationRegistry _createCharacteristicsMapForCharacteristics:]((uint64_t)self, v62);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v64, "count"))
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_QWORD *)&v102 = 0;
                  *((_QWORD *)&v102 + 1) = &v102;
                  *(_QWORD *)&v103 = 0x2020000000;
                  BYTE8(v103) = 0;
                  os_unfair_lock_lock_with_options();
                  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                  *(_QWORD *)&buf[8] = 3221225472;
                  *(_QWORD *)&buf[16] = __104__HMDNotificationRegistry_disableNotificationForCharacteristics_forUser_characteristicsToDisableEvents___block_invoke;
                  v112 = &unk_1E89A6B50;
                  *(_QWORD *)&v113 = self;
                  *((_QWORD *)&v113 + 1) = v63;
                  v66 = v65;
                  v114 = v66;
                  v115 = &v102;
                  objc_msgSend(v64, "enumerateKeysAndObjectsUsingBlock:", buf);

                  os_unfair_lock_unlock(self + 2);
                  v67 = objc_retainAutorelease(v66);
                  v84 = *(_BYTE *)(*((_QWORD *)&v102 + 1) + 24) != 0;
                  _Block_object_dispose(&v102, 8);

                }
                else
                {
                  v84 = 0;
                  v67 = (_OWORD *)MEMORY[0x1E0C9AA60];
                }

                v68 = v67;
                objc_msgSend(v93, "userID");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                if (v84)
                {
                  v76 = (void *)MEMORY[0x1D17BA0A0]();
                  v77 = self;
                  HMFGetOSLogHandle();
                  v78 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v44, "name");
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v44, "uuid");
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v80, "UUIDString");
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138544130;
                    *(_QWORD *)&buf[4] = v95;
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v79;
                    *(_WORD *)&buf[22] = 2112;
                    v112 = v81;
                    LOWORD(v113) = 2112;
                    *(_QWORD *)((char *)&v113 + 2) = v68;
                    _os_log_impl(&dword_1CD062000, v78, OS_LOG_TYPE_INFO, "%{public}@Disabling notification for accessory %@/%@ characteristics %@", buf, 0x2Au);

                  }
                  objc_autoreleasePoolPop(v76);
                  objc_msgSend(v44, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", 0, v68, v75);
                  if (objc_msgSend(v68, "count"))
                    objc_msgSend(v44, "updateNotificationEnabled:forCharacteristics:onBehalfOf:", 0, v68, v75);
                }

              }
            }
            else
            {
              v58 = (void *)MEMORY[0x1D17BA0A0]();
              v59 = self;
              HMFGetOSLogHandle();
              v60 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v61;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v93;
                _os_log_impl(&dword_1CD062000, v60, OS_LOG_TYPE_INFO, "%{public}@Cannot find all characteristics for request so adding to pending requests: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v58);
              objc_msgSend(v87, "addObject:", v93);
            }

          }
          else
          {
            v54 = (void *)MEMORY[0x1D17BA0A0]();
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
              *(_QWORD *)&buf[14] = v93;
              _os_log_impl(&dword_1CD062000, v56, OS_LOG_TYPE_INFO, "%{public}@Cannot find accessory for characteristics request so adding to pending requests: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v54);
            objc_msgSend(v87, "addObject:", v93);
          }

          v7 = v91 + 1;
        }
        while (v91 + 1 != v90);
        v90 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v106, 16);
      }
      while (v90);
    }
    else
    {
      LOBYTE(v84) = 0;
    }

    -[HMDNotificationRegistry _addPendingRequests:](v89, v87);
  }
  else
  {
    LOBYTE(v84) = 0;
  }

  return v84;
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
  _BOOL4 v43;
  int v44;
  void *v45;
  os_unfair_lock *v46;
  NSObject *v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t i;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  char v64;
  void *v65;
  id v66;
  NSObject *v67;
  void *v68;
  void *v69;
  id v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  id v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  uint64_t j;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v90;
  void *v91;
  void *v92;
  id obj;
  char v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  id self;
  os_unfair_lock_s *selfa;
  os_unfair_lock_s *selfb;
  id v103;
  id v104;
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  uint8_t v114[128];
  uint8_t v115[4];
  void *v116;
  __int16 v117;
  id v118;
  uint8_t buf[4];
  void *v120;
  __int16 v121;
  id v122;
  __int16 v123;
  void *v124;
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v90 = v3;
  if (!a1
    || (v5 = v3,
        Property = objc_getProperty(a1, v4, 64, 1),
        dispatch_assert_queue_V2(Property),
        !objc_msgSend(v5, "count")))
  {
    v94 = 0;
    goto LABEL_89;
  }
  v96 = a1;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  obj = v90;
  v97 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
  if (!v97)
  {
    v94 = 0;
    goto LABEL_86;
  }
  v94 = 0;
  v95 = *(_QWORD *)v107;
  do
  {
    v7 = 0;
    do
    {
      if (*(_QWORD *)v107 != v95)
      {
        v8 = v7;
        objc_enumerationMutation(obj);
        v7 = v8;
      }
      v98 = v7;
      v9 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v7);
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      self = v96;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v120 = v12;
        v121 = 2112;
        v122 = v9;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Processing media properties request: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      v13 = v9;
      v15 = objc_getProperty(self, v14, 64, 1);
      dispatch_assert_queue_V2(v15);
      v112 = 0u;
      v113 = 0u;
      v110 = 0u;
      v111 = 0u;
      v103 = (id)objc_msgSend(objc_getProperty(self, v16, 48, 1), "copy");
      v17 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v110, buf, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v111;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v111 != v18)
              objc_enumerationMutation(v103);
            v20 = *(id *)(*((_QWORD *)&v110 + 1) + 8 * v19);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v21 = v20;
            else
              v21 = 0;
            v22 = v21;

            if (v22)
            {
              objc_msgSend(v22, "userID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "userID");
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

                  v32 = (void *)MEMORY[0x1D17BA0A0]();
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
                      *(_DWORD *)v115 = 138543618;
                      v116 = v37;
                      v117 = 2112;
                      v118 = v22;
                      _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_INFO, "%{public}@Removing pending media properties request that matches a new media properties request: %@", v115, 0x16u);

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
                      *(_DWORD *)v115 = 138543618;
                      v116 = v36;
                      v117 = 2112;
                      v118 = v22;
                      _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_INFO, "%{public}@Updated pending media properties request: %@", v115, 0x16u);

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
          v39 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v110, buf, 16);
          v17 = v39;
        }
        while (v39);
      }

      -[HMDNotificationRegistry home]((id *)self);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mediaProfileUUID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "mediaProfileWithUUID:", v41);
      v99 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v99)
      {
        v65 = (void *)MEMORY[0x1D17BA0A0]();
        v66 = self;
        HMFGetOSLogHandle();
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v120 = v68;
          v121 = 2112;
          v122 = v13;
          _os_log_impl(&dword_1CD062000, v67, OS_LOG_TYPE_INFO, "%{public}@Cannot find media profile for media properties request so adding to pending requests: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v65);
        objc_msgSend(v92, "addObject:", v13);
        goto LABEL_81;
      }
      objc_msgSend(v13, "mediaProperties");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "count") == 0;

      if (v43)
      {
        v69 = (void *)MEMORY[0x1D17BA0A0]();
        v70 = self;
        HMFGetOSLogHandle();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v120 = v72;
          v121 = 2112;
          v122 = v13;
          _os_log_impl(&dword_1CD062000, v71, OS_LOG_TYPE_INFO, "%{public}@No media properties exist for request: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v69);
        goto LABEL_81;
      }
      v44 = objc_msgSend(v13, "enable");
      v45 = (void *)MEMORY[0x1D17BA0A0]();
      v46 = (os_unfair_lock *)self;
      HMFGetOSLogHandle();
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = os_log_type_enabled(v47, OS_LOG_TYPE_INFO);
      if (v44)
      {
        if (v48)
        {
          HMFGetLogIdentifier();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "mediaProperties");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v120 = v49;
          v121 = 2112;
          v122 = v99;
          v123 = 2112;
          v124 = v50;
          _os_log_impl(&dword_1CD062000, v47, OS_LOG_TYPE_INFO, "%{public}@Enabling notification for media profile: %@ media properties: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v45);
        objc_msgSend(v13, "mediaProperties");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "userID");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v99;
        v54 = v51;
        v55 = v52;
        v104 = v54;
        if (objc_msgSend(v54, "count"))
        {
          selfa = v46 + 2;
          os_unfair_lock_lock_with_options();
          v112 = 0u;
          v113 = 0u;
          v110 = 0u;
          v111 = 0u;
          v104 = v54;
          v56 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v110, buf, 16);
          if (v56)
          {
            v57 = 0;
            v58 = *(_QWORD *)v111;
            do
            {
              for (i = 0; i != v56; ++i)
              {
                if (*(_QWORD *)v111 != v58)
                  objc_enumerationMutation(v104);
                -[HMDNotificationRegistry keyForProperty:mediaProfile:]((uint64_t)v46, *(void **)(*((_QWORD *)&v110 + 1) + 8 * i), v53);
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                -[HMDNotificationRegistry notificationRegistry](v46);
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v61, "objectForKeyedSubscript:", v60);
                v62 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v62)
                {
                  objc_msgSend(MEMORY[0x1E0C99E20], "set");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HMDNotificationRegistry notificationRegistry](v46);
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v63, "setObject:forKeyedSubscript:", v62, v60);

                }
                if ((objc_msgSend(v62, "containsObject:", v55, v90) & 1) == 0)
                {
                  objc_msgSend(v62, "addObject:", v55);
                  v57 = 1;
                }

              }
              v56 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v110, buf, 16);
            }
            while (v56);

            os_unfair_lock_unlock(selfa);
            if ((v57 & 1) == 0)
              goto LABEL_50;
LABEL_74:
            objc_msgSend(v99, "uniqueIdentifier", v90);
            v105 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "addObject:", v105);
            v64 = 1;

            goto LABEL_80;
          }

          os_unfair_lock_unlock(selfa);
        }
        else
        {

        }
LABEL_79:
        v64 = 0;

        goto LABEL_80;
      }
      if (v48)
      {
        HMFGetLogIdentifier();
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "mediaProperties");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v120 = v73;
        v121 = 2112;
        v122 = v99;
        v123 = 2112;
        v124 = v74;
        _os_log_impl(&dword_1CD062000, v47, OS_LOG_TYPE_INFO, "%{public}@Disabling notification for media profile: %@ media properties: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v45);
      objc_msgSend(v13, "mediaProperties");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "userID");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v99;
      v78 = v75;
      v79 = v76;
      v104 = v78;
      if (!objc_msgSend(v78, "count"))
      {

        goto LABEL_79;
      }
      selfb = v46 + 2;
      os_unfair_lock_lock_with_options();
      v112 = 0u;
      v113 = 0u;
      v110 = 0u;
      v111 = 0u;
      v104 = v78;
      v80 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v110, buf, 16);
      if (!v80)
      {

        os_unfair_lock_unlock(selfb);
        goto LABEL_79;
      }
      v81 = 0;
      v82 = *(_QWORD *)v111;
      do
      {
        for (j = 0; j != v80; ++j)
        {
          if (*(_QWORD *)v111 != v82)
            objc_enumerationMutation(v104);
          -[HMDNotificationRegistry keyForProperty:mediaProfile:]((uint64_t)v46, *(void **)(*((_QWORD *)&v110 + 1) + 8 * j), v77);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDNotificationRegistry notificationRegistry](v46);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "objectForKeyedSubscript:", v84);
          v86 = (void *)objc_claimAutoreleasedReturnValue();

          if (v86)
          {
            if (!v79)
              goto LABEL_69;
            if (!objc_msgSend(v86, "containsObject:", v79))
              goto LABEL_71;
            objc_msgSend(v86, "removeObject:", v79);
            if (!objc_msgSend(v86, "count"))
            {
LABEL_69:
              -[HMDNotificationRegistry notificationRegistry](v46);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "removeObjectForKey:", v84);

            }
            v81 = 1;
          }
LABEL_71:

        }
        v80 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v110, buf, 16);
      }
      while (v80);

      os_unfair_lock_unlock(selfb);
      if ((v81 & 1) != 0)
        goto LABEL_74;
LABEL_50:
      v64 = 0;
LABEL_80:
      v94 |= v64;
LABEL_81:

      v7 = v98 + 1;
    }
    while (v98 + 1 != v97);
    v97 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
  }
  while (v97);
LABEL_86:

  -[HMDNotificationRegistry _addPendingRequests:](v96, v92);
  if (objc_msgSend(v91, "count"))
  {
    objc_msgSend(v91, "allObjects");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNotificationRegistry notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles:]((uint64_t)v96, v88);

  }
LABEL_89:

  return v94 & 1;
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

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  Property = objc_getProperty(a1, v4, 64, 1);
  dispatch_assert_queue_V2(Property);
  if (objc_msgSend(v3, "count"))
  {
    v7 = objc_msgSend(objc_getProperty(a1, v6, 48, 1), "unionSet:", v3);
    v8 = (void *)MEMORY[0x1D17BA0A0](v7);
    v9 = a1;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Resuming pending requests timer", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(objc_getProperty(v9, v12, 40, 1), "resume");
  }

}

- (void)notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles:(uint64_t)a1
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
    os_unfair_lock_lock_with_options();
    v4 = (void *)objc_msgSend(*(id *)(a1 + 24), "copy");
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    objc_msgSend(v4, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, (id)a1);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __81__HMDNotificationRegistry_notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles___block_invoke;
    v6[3] = &unk_1E89A6C38;
    objc_copyWeak(&v8, &location);
    v7 = v3;
    objc_msgSend(v5, "na_each:", v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);

  }
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
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__HMDNotificationRegistry_notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles___block_invoke_2;
    block[3] = &unk_1E89BD988;
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

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (void *)MEMORY[0x1D17BA0A0]();
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
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@About to notify delegate of mediaPropertyRegistrationsDidChange %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 32), "mediaPropertyRegistrationsDidChangeForMediaProfiles:", *(_QWORD *)(a1 + 40));

}

- (id)keyForProperty:(void *)a3 mediaProfile:
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (a1)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = a2;
    objc_msgSend(a3, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%@"), v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (os_unfair_lock)notificationRegistry
{
  os_unfair_lock *v1;

  if (a1)
  {
    v1 = a1;
    os_unfair_lock_assert_owner(a1 + 2);
    a1 = (os_unfair_lock *)*(id *)&v1[4]._os_unfair_lock_opaque;
  }
  return a1;
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

- (id)_createCharacteristicsMapForCharacteristics:(uint64_t)a1
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  id v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v17 = v2;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v21 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v9, "type");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "service");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "type");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v3, "shouldFilterEnableNotificationsForCharacteristicType:serviceType:", v10, v12);

          if ((v13 & 1) == 0)
          {
            -[HMDNotificationRegistry keyForCharacteristic:](a1, v9);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
              objc_msgSend(v18, "setObject:forKeyedSubscript:", v9, v14);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v6);
    }

    v15 = (void *)objc_msgSend(v18, "copy");
    v2 = v17;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v15;
}

void __104__HMDNotificationRegistry_disableNotificationForCharacteristics_forUser_characteristicsToDisableEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  -[HMDNotificationRegistry notificationRegistry](*(os_unfair_lock **)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(v7, "removeObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
    if (!objc_msgSend(v7, "count"))
    {
      -[HMDNotificationRegistry notificationRegistry](*(os_unfair_lock **)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectForKey:", v9);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }

}

- (id)keyForCharacteristic:(uint64_t)a1
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
  void *v12;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "accessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "instanceID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@:%@"), v9, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __72__HMDNotificationRegistry_enableNotificationForCharacteristics_forUser___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  -[HMDNotificationRegistry notificationRegistry](*(os_unfair_lock **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNotificationRegistry notificationRegistry](*(os_unfair_lock **)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  }
  if ((objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

void __43__HMDNotificationRegistry_encodeWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (id)_reachabilityEventNotificationRegistryKeyForAccessoryUUID:(uint64_t)a1
{
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a2, "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("%@%@"), v3, CFSTR(":ReachabilityEventNotification"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_reachabilityEventNotificationRegistryKeysForAccessoryUUIDs:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          -[HMDNotificationRegistry _reachabilityEventNotificationRegistryKeyForAccessoryUUID:]((uint64_t)a1, *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10, (_QWORD)v12);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    a1 = (void *)objc_msgSend(v4, "copy");
  }

  return a1;
}

void __91__HMDNotificationRegistry_disableReachabilityEventNotificationForAccessoryUUIDs_forUserID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  -[HMDNotificationRegistry notificationRegistry](*(os_unfair_lock **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (!*(_QWORD *)(a1 + 40))
      goto LABEL_5;
    if (objc_msgSend(v4, "containsObject:"))
    {
      objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));
      if (objc_msgSend(v4, "count"))
      {
LABEL_6:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        goto LABEL_7;
      }
LABEL_5:
      -[HMDNotificationRegistry notificationRegistry](*(os_unfair_lock **)(a1 + 32));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v6);

      goto LABEL_6;
    }
  }
LABEL_7:

}

void __90__HMDNotificationRegistry_enableReachabilityEventNotificationForAccessoryUUIDs_forUserID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  -[HMDNotificationRegistry notificationRegistry](*(os_unfair_lock **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNotificationRegistry notificationRegistry](*(os_unfair_lock **)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  }
  if ((objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

uint64_t __62__HMDNotificationRegistry_auditUsersForNotifications_forHome___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unionSet:");
}

void __99__HMDNotificationRegistry__delayedBlocksCollectedWhileDeregisteringUsers_forHome_isiOS_isResident___block_invoke(uint64_t a1)
{
  -[HMDNotificationRegistry disableNotification:user:home:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
}

void __99__HMDNotificationRegistry__delayedBlocksCollectedWhileDeregisteringUsers_forHome_isiOS_isResident___block_invoke_2(uint64_t a1)
{
  -[HMDNotificationRegistry disableNotification:user:home:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), 0, *(void **)(a1 + 48));
}

void __99__HMDNotificationRegistry__delayedBlocksCollectedWhileDeregisteringUsers_forHome_isiOS_isResident___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  -[HMDNotificationRegistry notifyDelegatesIfKeysAreMediaRelated:](v1, v2);

}

- (void)notifyDelegatesIfKeysAreMediaRelated:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (a1)
  {
    v3 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(a2, "na_map:", &__block_literal_global_20336);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "allObjects");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNotificationRegistry notifyDelegatesOfMediaRegistryUpdatesForMediaProfiles:](a1, v5);

    }
  }
}

id __64__HMDNotificationRegistry_notifyDelegatesIfKeysAreMediaRelated___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "componentsSeparatedByString:", CFSTR(":"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)disableNotification:(void *)a3 user:(void *)a4 home:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(":"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count") == 2)
    {
      v11 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithUUIDString:", v12);

      objc_msgSend(v9, "accessoryWithUUID:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
      v16 = v15;

      if (v16)
      {
        v17 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v18, "integerValue"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __57__HMDNotificationRegistry_disableNotification_user_home___block_invoke;
        v26[3] = &unk_1E89BF8D0;
        v20 = v19;
        v27 = v20;
        objc_msgSend(v16, "characteristicsPassingTest:", v26);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x1D17BA0A0]();
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v25 = v13;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v29 = v24;
          v30 = 2112;
          v31 = v8;
          v32 = 2112;
          v33 = v21;
          _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Deregistering client %@ for notification for characteristics %@", buf, 0x20u);

          v13 = v25;
        }

        objc_autoreleasePoolPop(v22);
        objc_msgSend(v16, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", 0, v21, v8);

      }
    }

  }
}

uint64_t __57__HMDNotificationRegistry_disableNotification_user_home___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "instanceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToNumber:", v3);

  return v4;
}

id __79__HMDNotificationRegistry_propertiesRegisteredForMediaProfileUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  objc_msgSend(a2, "componentsSeparatedByString:", CFSTR(":"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 2)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithUUIDString:", v5);

    v7 = objc_msgSend(*(id *)(a1 + 32), "hmf_isEqualToUUID:", v6);
    v8 = 0;
    if (v7)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t68 != -1)
    dispatch_once(&logCategory__hmf_once_t68, &__block_literal_global_109_20351);
  return (id)logCategory__hmf_once_v69;
}

void __38__HMDNotificationRegistry_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v69;
  logCategory__hmf_once_v69 = v0;

}

@end

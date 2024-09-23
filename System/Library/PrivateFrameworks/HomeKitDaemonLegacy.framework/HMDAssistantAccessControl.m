@implementation HMDAssistantAccessControl

- (HMDAssistantAccessControl)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDAssistantAccessControl)initWithUser:(id)a3 model:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  HMDAssistantAccessControl *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSMutableSet *hapAccessoryIdentifiers;
  void *v18;
  void *v19;
  uint64_t v20;
  NSMutableSet *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSMutableSet *appleMediaAccessories;
  HMDAssistantAccessControl *v26;
  HMDAssistantAccessControl *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  int v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "enabled");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    v11 = -[HMDAssistantAccessControl initWithUser:appleAccessories:enabled:](self, "initWithUser:appleAccessories:enabled:", v6, MEMORY[0x1E0C9AA60], v10);
    if (v11)
    {
      objc_msgSend(v8, "options");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11->_options = objc_msgSend(v12, "unsignedIntegerValue");

      objc_msgSend(v8, "activityNotificationsEnabledForPersonalRequests");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11->_activityNotificationsEnabledForPersonalRequests = objc_msgSend(v13, "BOOLValue");

      objc_msgSend(v8, "accessoryModelIDs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      __modelIDsFromModelIDStrings(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v16 = objc_claimAutoreleasedReturnValue();
      hapAccessoryIdentifiers = v11->_hapAccessoryIdentifiers;
      v11->_hapAccessoryIdentifiers = (NSMutableSet *)v16;

      objc_msgSend(v8, "siriEndpointAccessoryModelUUIDs");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      __modelIDsFromModelIDStrings(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v19, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v19);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v11->_hapAccessoryIdentifiers;
        v11->_hapAccessoryIdentifiers = (NSMutableSet *)v20;

      }
      v22 = (void *)MEMORY[0x1E0C99E20];
      __accessoriesWithModelIDs(v11, v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setWithArray:", v23);
      v24 = objc_claimAutoreleasedReturnValue();
      appleMediaAccessories = v11->_appleMediaAccessories;
      v11->_appleMediaAccessories = (NSMutableSet *)v24;

    }
    v26 = v11;
    v27 = v26;
  }
  else
  {
    v28 = (void *)MEMORY[0x1D17BA0A0]();
    v26 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543362;
      v33 = v30;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Model is required", (uint8_t *)&v32, 0xCu);

    }
    objc_autoreleasePoolPop(v28);
    v27 = 0;
  }

  return v27;
}

- (HMDAssistantAccessControl)initWithUser:(id)a3 appleAccessories:(id)a4 enabled:(BOOL)a5
{
  return -[HMDAssistantAccessControl initWithUser:appleAccessories:hapAccessoryIdentifiers:enabled:activityNotificationsEnabledForPersonalRequests:](self, "initWithUser:appleAccessories:hapAccessoryIdentifiers:enabled:activityNotificationsEnabledForPersonalRequests:", a3, a4, MEMORY[0x1E0C9AA60], a5, 1);
}

- (HMDAssistantAccessControl)initWithUser:(id)a3 appleAccessories:(id)a4 hapAccessoryIdentifiers:(id)a5 enabled:(BOOL)a6 activityNotificationsEnabledForPersonalRequests:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  HMDAssistantAccessControl *v15;
  HMDAssistantAccessControl *v16;
  uint64_t v17;
  NSMutableSet *appleMediaAccessories;
  uint64_t v19;
  NSMutableSet *hapAccessoryIdentifiers;
  id v21;
  const char *v22;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *clientQueue;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v27.receiver = self;
  v27.super_class = (Class)HMDAssistantAccessControl;
  v15 = -[HMDAssistantAccessControl init](&v27, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v15->_user, v12);
    v16->_cachedHash = objc_msgSend(v12, "hash");
    v16->_enabled = a6;
    v16->_activityNotificationsEnabledForPersonalRequests = a7;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v13);
    v17 = objc_claimAutoreleasedReturnValue();
    appleMediaAccessories = v16->_appleMediaAccessories;
    v16->_appleMediaAccessories = (NSMutableSet *)v17;

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v14);
    v19 = objc_claimAutoreleasedReturnValue();
    hapAccessoryIdentifiers = v16->_hapAccessoryIdentifiers;
    v16->_hapAccessoryIdentifiers = (NSMutableSet *)v19;

    HMDispatchQueueNameString();
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = (const char *)objc_msgSend(v21, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = dispatch_queue_create(v22, v23);
    clientQueue = v16->_clientQueue;
    v16->_clientQueue = (OS_dispatch_queue *)v24;

  }
  return v16;
}

- (HMDAssistantAccessControl)initWithUser:(id)a3
{
  return -[HMDAssistantAccessControl initWithUser:appleAccessories:hapAccessoryIdentifiers:enabled:activityNotificationsEnabledForPersonalRequests:](self, "initWithUser:appleAccessories:hapAccessoryIdentifiers:enabled:activityNotificationsEnabledForPersonalRequests:", a3, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 1, 1);
}

- (void)configure
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HMDAssistantAccessControl user](self, "user");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", self);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handleRemovedAccessory_, CFSTR("HMDHomeAccessoryRemovedNotification"), v3);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HMDAssistantAccessControl;
  -[HMDAssistantAccessControl dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  HMDAssistantAccessControl *v4;
  HMDAssistantAccessControl *v5;
  HMDAssistantAccessControl *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  _BOOL4 v11;
  unint64_t v12;
  _BOOL4 v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = (HMDAssistantAccessControl *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMDAssistantAccessControl user](self, "user");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAssistantAccessControl user](v6, "user");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = 0;
      if (v7 && v8)
      {
        if (HMFEqualObjects()
          && (v11 = -[HMDAssistantAccessControl isEnabled](self, "isEnabled"),
              v11 == -[HMDAssistantAccessControl isEnabled](v6, "isEnabled"))
          && (v12 = -[HMDAssistantAccessControl options](self, "options"),
              v12 == -[HMDAssistantAccessControl options](v6, "options"))
          && (v13 = -[HMDAssistantAccessControl areActivityNotificationsEnabledForPersonalRequests](self, "areActivityNotificationsEnabledForPersonalRequests"), v13 == -[HMDAssistantAccessControl areActivityNotificationsEnabledForPersonalRequests](v6, "areActivityNotificationsEnabledForPersonalRequests")))
        {
          v15 = (void *)MEMORY[0x1E0C99E60];
          -[HMDAssistantAccessControl accessories](self, "accessories");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setWithArray:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = (void *)MEMORY[0x1E0C99E60];
          -[HMDAssistantAccessControl accessories](v6, "accessories");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setWithArray:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = HMFEqualObjects();
        }
        else
        {
          v10 = 0;
        }
      }

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (NSString)propertyDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDAssistantAccessControl isEnabled](self, "isEnabled");
  HMFBooleanToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAssistantAccessControl options](self, "options");
  HMAssistantAccessControlOptionsToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAssistantAccessControl areActivityNotificationsEnabledForPersonalRequests](self, "areActivityNotificationsEnabledForPersonalRequests");
  HMFBooleanToString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAssistantAccessControl accessories](self, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR(" Enabled = %@, Options = %@, Activity Notifications Enabled for Personal Requests = %@, Accessories = %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (HMDUser)user
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_user);
  os_unfair_lock_unlock(p_lock);
  return (HMDUser *)WeakRetained;
}

- (unint64_t)cachedHash
{
  os_unfair_lock_s *p_lock;
  unint64_t cachedHash;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  cachedHash = self->_cachedHash;
  os_unfair_lock_unlock(p_lock);
  return cachedHash;
}

- (void)setUser:(id)a3
{
  id obj;

  obj = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_user, obj);
  if (obj)
    self->_cachedHash = objc_msgSend(obj, "hash");
  os_unfair_lock_unlock(&self->_lock);

}

- (BOOL)isEnabled
{
  HMDAssistantAccessControl *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_enabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setEnabled:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_enabled = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)options
{
  os_unfair_lock_s *p_lock;
  unint64_t options;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  options = self->_options;
  os_unfair_lock_unlock(p_lock);
  return options;
}

- (void)setOptions:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_options = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)areActivityNotificationsEnabledForPersonalRequests
{
  HMDAssistantAccessControl *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_activityNotificationsEnabledForPersonalRequests;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setActivityNotificationsEnabledForPersonalRequests:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_activityNotificationsEnabledForPersonalRequests = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSArray)accessories
{
  void *v3;
  void *v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableSet allObjects](self->_hapAccessoryIdentifiers, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_lock);
  if (objc_msgSend(v6, "count"))
  {
    __accessoriesWithModelIDs(self, v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  os_unfair_lock_lock_with_options();
  -[NSMutableSet allObjects](self->_appleMediaAccessories, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v9;
}

- (void)setHapAccessoryIdentifiers:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *hapAccessoryIdentifiers;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:");
    v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock_with_options();
    hapAccessoryIdentifiers = self->_hapAccessoryIdentifiers;
    self->_hapAccessoryIdentifiers = v4;

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)setAppleMediaAccessories:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *appleMediaAccessories;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:");
    v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock_with_options();
    appleMediaAccessories = self->_appleMediaAccessories;
    self->_appleMediaAccessories = v4;

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)addAccessory:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char isKindOfClass;
  void *v8;
  id v9;
  NSMutableSet *hapAccessoryIdentifiers;
  void *v11;
  id v12;
  char v13;
  void *v14;
  id v15;
  void *v16;
  HMDAssistantAccessControl *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
    v9 = v8;

    if ((isKindOfClass & 1) != 0)
    {
      os_unfair_lock_lock_with_options();
      hapAccessoryIdentifiers = self->_hapAccessoryIdentifiers;
      objc_msgSend(v6, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](hapAccessoryIdentifiers, "addObject:", v11);

      os_unfair_lock_unlock(&self->_lock);
    }
    v12 = v6;
    objc_opt_class();
    v13 = objc_opt_isKindOfClass();
    if ((v13 & 1) != 0)
      v14 = v12;
    else
      v14 = 0;
    v15 = v14;

    if ((v13 & 1) != 0)
    {
      os_unfair_lock_lock_with_options();
      -[NSMutableSet addObject:](self->_appleMediaAccessories, "addObject:", v12);
      os_unfair_lock_unlock(&self->_lock);
    }
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v19;
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Added accessory %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v16);

  }
}

- (void)removeAccessory:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char isKindOfClass;
  void *v8;
  id v9;
  NSMutableSet *hapAccessoryIdentifiers;
  void *v11;
  int v12;
  NSMutableSet *v13;
  void *v14;
  id v15;
  char v16;
  void *v17;
  id v18;
  unsigned __int8 v19;
  void *v20;
  HMDAssistantAccessControl *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
    v9 = v8;

    if ((isKindOfClass & 1) != 0)
    {
      os_unfair_lock_lock_with_options();
      hapAccessoryIdentifiers = self->_hapAccessoryIdentifiers;
      objc_msgSend(v6, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[NSMutableSet containsObject:](hapAccessoryIdentifiers, "containsObject:", v11);

      v13 = self->_hapAccessoryIdentifiers;
      objc_msgSend(v6, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet removeObject:](v13, "removeObject:", v14);

      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      v12 = 0;
    }
    v15 = v6;
    objc_opt_class();
    v16 = objc_opt_isKindOfClass();
    if ((v16 & 1) != 0)
      v17 = v15;
    else
      v17 = 0;
    v18 = v17;

    if ((v16 & 1) != 0)
    {
      os_unfair_lock_lock_with_options();
      v19 = -[NSMutableSet containsObject:](self->_appleMediaAccessories, "containsObject:", v15);
      -[NSMutableSet removeObject:](self->_appleMediaAccessories, "removeObject:", v15);
      os_unfair_lock_unlock(&self->_lock);
      if (((v19 | v12) & 1) == 0)
        goto LABEL_18;
    }
    else if (!v12)
    {
LABEL_18:

      goto LABEL_19;
    }
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v23;
      v26 = 2112;
      v27 = v15;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Removed accessory %@", (uint8_t *)&v24, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    goto LABEL_18;
  }
LABEL_19:

}

- (void)handleRemovedAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDAssistantAccessControl *v9;

  v4 = a3;
  -[HMDAssistantAccessControl clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HMDAssistantAccessControl_handleRemovedAccessory___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)removeAccessoriesAddedByOldController:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAssistantAccessControl clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__HMDAssistantAccessControl_removeAccessoriesAddedByOldController___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)notifyClientOfUpdateWithMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAssistantAccessControl clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__HMDAssistantAccessControl_notifyClientOfUpdateWithMessage___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (NSUUID)modelID
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HMDAssistantAccessControl user](self, "user");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
    +[HMDAssistantAccessControl modelIDNamespace](HMDAssistantAccessControl, "modelIDNamespace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataUsingEncoding:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v3, "initWithNamespace:data:", v4, v7);

  }
  else
  {
    v8 = 0;
  }

  return (NSUUID *)v8;
}

- (HMDAssistantAccessControlModel)model
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[HMDAssistantAccessControl transactionWithObjectChangeType:](self, "transactionWithObjectChangeType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAssistantAccessControl isEnabled](self, "isEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAssistantAccessControl options](self, "options"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOptions:", v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAssistantAccessControl areActivityNotificationsEnabledForPersonalRequests](self, "areActivityNotificationsEnabledForPersonalRequests"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActivityNotificationsEnabledForPersonalRequests:", v6);

  -[HMDAssistantAccessControl _appleMediaAccessories]((char *)self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAssistantAccessControl _populateModel:withAccessoryIdsFromAccessories:]((uint64_t)self, v3, v7);

  -[HMDAssistantAccessControl _hapAccessoryIdentifiers]((char *)self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_map:", &__block_literal_global_43_172062);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSiriEndpointAccessoryModelUUIDs:", v9);

  return (HMDAssistantAccessControlModel *)v3;
}

- (id)transactionWithObjectChangeType:(unint64_t)a3
{
  void *v5;
  HMDAssistantAccessControlModel *v6;
  void *v7;
  void *v8;
  HMDAssistantAccessControlModel *v9;
  void *v10;
  HMDAssistantAccessControl *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HMDAssistantAccessControl user](self, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = [HMDAssistantAccessControlModel alloc];
    -[HMDAssistantAccessControl modelID](self, "modelID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v6, "initWithObjectChangeType:uuid:parentUUID:", a3, v7, v8);

  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to create model without parent user", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return v9;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  HMDAssistantAccessControl *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDAssistantAccessControl *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  HMDAssistantAccessControl *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void (**v41)(_QWORD, _QWORD, _QWORD);
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  HMDAssistantAccessControl *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  HMDAssistantAccessControl *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  char v62;
  void *v63;
  HMDAssistantAccessControl *v64;
  NSObject *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void (**v70)(_QWORD, _QWORD, _QWORD);
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  id v89;
  void *v90;
  _BOOL4 v91;
  void *context;
  void *contexta;
  void *contextb;
  int v95;
  id v96;
  id v97;
  id v98;
  id v99;
  uint8_t buf[4];
  void *v101;
  __int16 v102;
  void *v103;
  __int16 v104;
  void *v105;
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    v98 = v11;
    v14 = self;
    v97 = v13;
    v15 = v13;
    v16 = v10;
    objc_msgSend(v16, "transactionResult");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "propertyWasSet:", CFSTR("enabled"))
      || (objc_msgSend(v15, "enabled"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v18, "BOOLValue"),
          v18,
          (_DWORD)v19 == -[HMDAssistantAccessControl isEnabled](v14, "isEnabled")))
    {
      v20 = 0;
    }
    else
    {
      -[HMDAssistantAccessControl setEnabled:](v14, "setEnabled:", v19);
      objc_msgSend(v17, "markChanged");
      v20 = 1;
    }
    if (objc_msgSend(v15, "propertyWasSet:", CFSTR("options")))
    {
      objc_msgSend(v15, "options");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "unsignedIntegerValue");

      if (-[HMDAssistantAccessControl options](v14, "options") != v22)
      {
        -[HMDAssistantAccessControl setOptions:](v14, "setOptions:", v22);
        objc_msgSend(v17, "markChanged");
        v20 = 1;
      }
    }
    if (objc_msgSend(v15, "propertyWasSet:", CFSTR("activityNotificationsEnabledForPersonalRequests")))
    {
      objc_msgSend(v15, "activityNotificationsEnabledForPersonalRequests");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "BOOLValue");

      if ((_DWORD)v24 != -[HMDAssistantAccessControl areActivityNotificationsEnabledForPersonalRequests](v14, "areActivityNotificationsEnabledForPersonalRequests"))
      {
        -[HMDAssistantAccessControl setActivityNotificationsEnabledForPersonalRequests:](v14, "setActivityNotificationsEnabledForPersonalRequests:", v24);
        objc_msgSend(v17, "markChanged");
        v20 = 1;
      }
    }
    v99 = v10;
    v95 = v20;
    if (objc_msgSend(v15, "propertyWasSet:", CFSTR("accessoryModelIDs")))
    {
      v89 = v8;
      objc_msgSend(v15, "accessoryModelIDs");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      __modelIDsFromModelIDStrings(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      __accessoriesWithModelIDs(v14, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAssistantAccessControl _appleMediaAccessories]((char *)v14);
      context = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x1D17BA0A0]();
      v29 = v14;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v87 = v16;
        v31 = v26;
        v32 = v17;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAssistantAccessControl accessories](v29, "accessories");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v101 = v33;
        v102 = 2112;
        v103 = v27;
        v104 = 2112;
        v105 = v34;
        _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Got access control update for apple media accessories: %@, allCurrent:%@", buf, 0x20u);

        v17 = v32;
        v26 = v31;
        v16 = v87;
      }

      objc_autoreleasePoolPop(v28);
      v35 = HMFEqualObjects();
      v36 = (void *)MEMORY[0x1D17BA0A0]();
      v37 = v29;
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if ((v35 & 1) != 0)
      {
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v101 = v40;
          _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_INFO, "%{public}@accessories list is the same skipping", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v36);
      }
      else
      {
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v101 = v43;
          v102 = 2112;
          v103 = v27;
          v104 = 2112;
          v105 = context;
          _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@Updated assistant access control apple media accessories to: %@, from: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v36);
        -[HMDAssistantAccessControl setAppleMediaAccessories:](v37, "setAppleMediaAccessories:", v27);
        objc_msgSend(v17, "markChanged");
      }

      v8 = v89;
      v20 = v95;
      v10 = v99;
    }
    if (objc_msgSend(v15, "propertyWasSet:", CFSTR("siriEndpointAccessoryModelUUIDs")))
    {
      objc_msgSend(v15, "siriEndpointAccessoryModelUUIDs");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      __modelIDsFromModelIDStrings(v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      __accessoriesWithModelIDs(v14, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v46;
      if (v14)
      {
        objc_msgSend(v46, "na_map:", &__block_literal_global_33_172033);
        v48 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v48 = 0;
      }
      v90 = (void *)v48;
      if ((HMFEqualObjects() & 1) == 0)
      {
        v49 = v47;
        contexta = (void *)MEMORY[0x1D17BA0A0]();
        v50 = v14;
        HMFGetOSLogHandle();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v87 = v16;
          v52 = v17;
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v101 = v53;
          v102 = 2112;
          v103 = v45;
          v104 = 2112;
          v105 = v49;
          _os_log_impl(&dword_1CD062000, v51, OS_LOG_TYPE_ERROR, "%{public}@Fatal: found non hap accessory in endpoint list %@, accessories: %@", buf, 0x20u);

          v17 = v52;
        }

        objc_autoreleasePoolPop(contexta);
        v47 = v49;
      }
      v88 = v17;
      -[HMDAssistantAccessControl _hapAccessoryIdentifiers]((char *)v14);
      contextb = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (void *)MEMORY[0x1D17BA0A0]();
      v55 = v14;
      HMFGetOSLogHandle();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAssistantAccessControl accessories](v55, "accessories");
        v87 = v45;
        v58 = v47;
        v59 = v16;
        v60 = v8;
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v101 = v57;
        v102 = 2112;
        v103 = v90;
        v104 = 2112;
        v105 = v61;
        _os_log_impl(&dword_1CD062000, v56, OS_LOG_TYPE_DEFAULT, "%{public}@Got access control update for hap accessories: %@, allCurrent:%@", buf, 0x20u);

        v8 = v60;
        v16 = v59;
        v47 = v58;
        v45 = v87;

      }
      objc_autoreleasePoolPop(v54);
      v62 = HMFEqualObjects();
      v63 = (void *)MEMORY[0x1D17BA0A0]();
      v64 = v55;
      HMFGetOSLogHandle();
      v65 = objc_claimAutoreleasedReturnValue();
      v66 = v65;
      if ((v62 & 1) != 0)
      {
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v101 = v67;
          _os_log_impl(&dword_1CD062000, v66, OS_LOG_TYPE_INFO, "%{public}@endpoint list is the same skipping", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v63);
        v17 = v88;
      }
      else
      {
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v101 = v68;
          v102 = 2112;
          v103 = v45;
          v104 = 2112;
          v105 = contextb;
          _os_log_impl(&dword_1CD062000, v66, OS_LOG_TYPE_DEFAULT, "%{public}@Updated assistant access control accessories to: %@ from: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v63);
        -[HMDAssistantAccessControl setHapAccessoryIdentifiers:](v64, "setHapAccessoryIdentifiers:", v45);
        v17 = v88;
        objc_msgSend(v88, "markChanged");
      }

      v10 = v99;
      v20 = v95;
    }
    if (objc_msgSend(v17, "changed", v87))
      -[HMDAssistantAccessControl notifyClientOfUpdateWithMessage:](v14, "notifyClientOfUpdateWithMessage:", v16);
    objc_msgSend(v16, "responseHandler");
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (v69)
    {
      objc_msgSend(v16, "responseHandler");
      v70 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v70[2](v70, 0, 0);

    }
    if (v20 && objc_msgSend(v17, "source") == 1)
    {
      v91 = -[HMDAssistantAccessControl isEnabled](v14, "isEnabled");
      v71 = -[HMDAssistantAccessControl options](v14, "options");
      v72 = -[HMDAssistantAccessControl areActivityNotificationsEnabledForPersonalRequests](v14, "areActivityNotificationsEnabledForPersonalRequests");
      -[HMDAssistantAccessControl accessories](v14, "accessories");
      v96 = v15;
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v73, "count");
      -[HMDAssistantAccessControl user](v14, "user");
      v75 = v8;
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "home");
      v77 = v17;
      v78 = v16;
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v79, "assistantAccessCapableAccessoryCount");
      v81 = v71;
      v10 = v99;
      +[HMDAssistantAccessControlModifiedEvent eventWithIsEnabled:options:areActivityNotificationsEnabledForPersonalRequests:numEnabledAccessories:numCapableAccessories:](HMDAssistantAccessControlModifiedEvent, "eventWithIsEnabled:options:areActivityNotificationsEnabledForPersonalRequests:numEnabledAccessories:numCapableAccessories:", v91, v81, v72, v74, v80);
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v78;
      v17 = v77;

      v8 = v75;
      v15 = v96;
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "submitLogEvent:", v82);

    }
    -[HMDAssistantAccessControl user](v14, "user");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "home");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAssistantAccessControl accessories](v14, "accessories");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "userAssistantAccessControlDidUpdate:accessories:", v84, v86);

    v13 = v97;
    v11 = v98;
  }
  else
  {
    objc_msgSend(v10, "responseHandler");
    v41 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v41)[2](v41, v42, 0);

  }
}

- (id)assistantAccessControlModelWithRemovedAccessories:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v44;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v44 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v8);
        -[HMDAssistantAccessControl accessories](self, "accessories");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v9) = objc_msgSend(v10, "containsObject:", v9);

        if ((v9 & 1) != 0)
        {

          -[HMDAssistantAccessControl model](self, "model");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "accessoryModelIDs");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (void *)objc_msgSend(v13, "mutableCopy");

          objc_msgSend(v11, "siriEndpointAccessoryModelUUIDs");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (void *)objc_msgSend(v14, "mutableCopy");

          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v36 = v4;
          v15 = v4;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v40;
            do
            {
              v19 = 0;
              do
              {
                if (*(_QWORD *)v40 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v19);
                objc_msgSend(v11, "accessoryModelIDs");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "uuid");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "UUIDString");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v21, "containsObject:", v23);

                if (v24)
                {
                  objc_msgSend(v20, "uuid");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "UUIDString");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "removeObject:", v26);

                }
                objc_msgSend(v11, "siriEndpointAccessoryModelUUIDs");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "uuid");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "UUIDString");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v27, "containsObject:", v29);

                if (v30)
                {
                  objc_msgSend(v20, "uuid");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "UUIDString");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "removeObject:", v32);

                }
                ++v19;
              }
              while (v17 != v19);
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
            }
            while (v17);
          }

          v12 = v38;
          v33 = (void *)objc_msgSend(v38, "copy");
          objc_msgSend(v11, "setAccessoryModelIDs:", v33);

          v34 = (void *)objc_msgSend(v37, "copy");
          objc_msgSend(v11, "setSiriEndpointAccessoryModelUUIDs:", v34);

          v4 = v36;
          goto LABEL_22;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
  v12 = v4;
LABEL_22:

  return v11;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDAssistantAccessControl modelID](self, "modelID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDAssistantAccessControl)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMDAssistantAccessControl *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableSet *hapAccessoryIdentifiers;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableSet *v19;
  void *v20;
  uint64_t v21;
  NSMutableSet *appleMediaAccessories;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB7960]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDAssistantAccessControl initWithUser:](self, "initWithUser:", v5);
  if (v6)
  {
    v6->_enabled = objc_msgSend(v4, "decodeBoolForKey:", *MEMORY[0x1E0CB82E0]);
    v6->_options = objc_msgSend(v4, "decodeIntegerForKey:", *MEMORY[0x1E0CB82E8]);
    v7 = *MEMORY[0x1E0CB82D8];
    v6->_activityNotificationsEnabledForPersonalRequests = objc_msgSend(v4, "containsValueForKey:", *MEMORY[0x1E0CB82D8])? objc_msgSend(v4, "decodeBoolForKey:", v7): 1;
    v8 = *MEMORY[0x1E0CB82D0];
    if (objc_msgSend(v4, "containsValueForKey:", *MEMORY[0x1E0CB82D0]))
    {
      objc_msgSend(v4, "hm_decodeArrayOfConditionalObjects:forKey:", objc_opt_class(), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");

      objc_msgSend(v4, "hm_decodeArrayOfConditionalObjects:forKey:", objc_opt_class(), CFSTR("HMD.ac.homepods"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v10, "addObjectsFromArray:", v11);
      objc_msgSend(v4, "hm_decodeArrayOfConditionalObjects:forKey:", objc_opt_class(), CFSTR("HMD.ac.homepods_6_1"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_msgSend(v10, "addObjectsFromArray:", v12);
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v13 = objc_claimAutoreleasedReturnValue();
      hapAccessoryIdentifiers = v6->_hapAccessoryIdentifiers;
      v6->_hapAccessoryIdentifiers = (NSMutableSet *)v13;

      v15 = (void *)MEMORY[0x1E0C99E60];
      v24[0] = objc_opt_class();
      v24[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setWithArray:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("HMD.ac.siriEndpointIdentifiers"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v18, "count"))
      {
        v19 = v6->_hapAccessoryIdentifiers;
        objc_msgSend(v18, "na_map:", &__block_literal_global_56);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObjectsFromArray:](v19, "addObjectsFromArray:", v20);

      }
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v10);
      v21 = objc_claimAutoreleasedReturnValue();
      appleMediaAccessories = v6->_appleMediaAccessories;
      v6->_appleMediaAccessories = (NSMutableSet *)v21;

    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  unint64_t v7;
  _BOOL8 v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAssistantAccessControl user](self, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeConditionalObject:forKey:", v5, *MEMORY[0x1E0CB7960]);

  v6 = -[HMDAssistantAccessControl isEnabled](self, "isEnabled");
  objc_msgSend(v4, "encodeBool:forKey:", v6, *MEMORY[0x1E0CB82E0]);
  v7 = -[HMDAssistantAccessControl options](self, "options");
  objc_msgSend(v4, "encodeInteger:forKey:", v7, *MEMORY[0x1E0CB82E8]);
  v8 = -[HMDAssistantAccessControl areActivityNotificationsEnabledForPersonalRequests](self, "areActivityNotificationsEnabledForPersonalRequests");
  v35 = v4;
  objc_msgSend(v4, "encodeBool:forKey:", v8, *MEMORY[0x1E0CB82D8]);
  v34 = (char *)self;
  -[HMDAssistantAccessControl accessories](self, "accessories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (!v11)
    goto LABEL_26;
  v12 = v11;
  v13 = *(_QWORD *)v40;
  do
  {
    v14 = 0;
    do
    {
      if (*(_QWORD *)v40 != v13)
        objc_enumerationMutation(v10);
      v15 = *(id *)(*((_QWORD *)&v39 + 1) + 8 * v14);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
      v17 = v16;

      v18 = v15;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
      v20 = v19;

      if (v20)
      {
        v21 = (void *)v38;
        v22 = v20;
LABEL_16:
        objc_msgSend(v21, "addObject:", v22);
        goto LABEL_17;
      }
      if (v17)
      {
        v21 = (void *)v37;
        v22 = v17;
        goto LABEL_16;
      }
      v23 = v18;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v24 = v23;
      else
        v24 = 0;
      v25 = v24;

      if (!v25)
        objc_msgSend(v36, "addObject:", v23);

LABEL_17:
      ++v14;
    }
    while (v12 != v14);
    v26 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    v12 = v26;
  }
  while (v26);
LABEL_26:

  v27 = objc_msgSend(v35, "hmd_isForXPCTransport");
  v28 = *MEMORY[0x1E0CB82D0];
  if (v27)
  {
    objc_msgSend(v35, "hm_encodeArrayOfConditionalObjects:forKey:", v10, v28);
    v29 = v36;
    v30 = (void *)v37;
    v31 = (void *)v38;
  }
  else
  {
    v29 = v36;
    objc_msgSend(v35, "hm_encodeArrayOfConditionalObjects:forKey:", v36, v28);
    v30 = (void *)v37;
    objc_msgSend(v35, "hm_encodeArrayOfConditionalObjects:forKey:", v37, CFSTR("HMD.ac.homepods"));
    v31 = (void *)v38;
    objc_msgSend(v35, "hm_encodeArrayOfConditionalObjects:forKey:", v38, CFSTR("HMD.ac.homepods_6_1"));
    -[HMDAssistantAccessControl _hapAccessoryIdentifiers](v34);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "na_map:", &__block_literal_global_59_172005);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "encodeObject:forKey:", v33, CFSTR("HMD.ac.siriEndpointIdentifiers"));
  }

}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_user);
  objc_storeStrong((id *)&self->_hapAccessoryIdentifiers, 0);
  objc_storeStrong((id *)&self->_appleMediaAccessories, 0);
}

- (id)_hapAccessoryIdentifiers
{
  id *v1;
  os_unfair_lock_s *v2;

  v1 = (id *)a1;
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    objc_msgSend(v1[3], "allObjects");
    v1 = (id *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

uint64_t __45__HMDAssistantAccessControl_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

id __43__HMDAssistantAccessControl_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", v3);

  return v4;
}

- (id)_appleMediaAccessories
{
  id *v1;
  os_unfair_lock_s *v2;

  v1 = (id *)a1;
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    objc_msgSend(v1[2], "allObjects");
    v1 = (id *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

id __66__HMDAssistantAccessControl_siriEndpointAccessoriesInAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "siriEndpointProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = v5;
      v6 = v2;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_populateModel:(void *)a3 withAccessoryIdsFromAccessories:
{
  id v4;
  void *v5;
  id v6;

  if (a1)
  {
    v4 = a2;
    objc_msgSend(a3, "na_map:", &__block_literal_global_31_172063);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    __modelIDStringsFromAccessories(v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessoryModelIDs:", v5);

  }
}

uint64_t __34__HMDAssistantAccessControl_model__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

id __64__HMDAssistantAccessControl_appleMediaAccessoriesInAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

void __61__HMDAssistantAccessControl_notifyClientOfUpdateWithMessage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "user");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    encodeRootObjectForSPIClients(*(void **)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0D285F8];
    v5 = *MEMORY[0x1E0CB9ED0];
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0CB9EC8];
    v20[0] = v3;
    v8 = *MEMORY[0x1E0CB9EB8];
    v19[0] = v7;
    v19[1] = v8;
    objc_msgSend(*(id *)(a1 + 32), "accessories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __modelIDStringsFromAccessories(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entitledMessageWithName:identifier:messagePayload:", v5, v6, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc(MEMORY[0x1E0D285D8]);
    objc_msgSend(v2, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithTarget:", v14);
    objc_msgSend(v12, "setDestination:", v15);

    objc_msgSend(v2, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "homeManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "messageDispatcher");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sendMessage:completionHandler:", v12, 0);

  }
}

void __67__HMDAssistantAccessControl_removeAccessoriesAddedByOldController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id location;
  _QWORD v18[4];
  id v19;

  objc_msgSend(*(id *)(a1 + 32), "transactionWithObjectChangeType:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAssistantAccessControl _appleMediaAccessories](*(char **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeObjectsInArray:", *(_QWORD *)(a1 + 40));
  -[HMDAssistantAccessControl _populateModel:withAccessoryIdsFromAccessories:](*(_QWORD *)(a1 + 32), v2, v4);
  -[HMDAssistantAccessControl _hapAccessoryIdentifiers](*(char **)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = *(void **)(a1 + 40);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__HMDAssistantAccessControl_removeAccessoriesAddedByOldController___block_invoke_2;
  v18[3] = &unk_1E89BEF40;
  v8 = v6;
  v19 = v8;
  objc_msgSend(v7, "na_each:", v18);
  objc_msgSend(v8, "na_map:", &__block_literal_global_35_172068);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSiriEndpointAccessoryModelUUIDs:", v9);
  objc_msgSend(*(id *)(a1 + 32), "user");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "backingStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transaction:options:", CFSTR("FixupMediaSystemUserAccessControl"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "add:", v2);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__HMDAssistantAccessControl_removeAccessoriesAddedByOldController___block_invoke_4;
  v15[3] = &unk_1E89C0678;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v14, "run:", v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __67__HMDAssistantAccessControl_removeAccessoriesAddedByOldController___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uuid");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", v3);

}

void __67__HMDAssistantAccessControl_removeAccessoriesAddedByOldController___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!a2)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "notifyClientOfUpdateWithMessage:", 0);
    WeakRetained = v4;
  }

}

uint64_t __67__HMDAssistantAccessControl_removeAccessoriesAddedByOldController___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

void __52__HMDAssistantAccessControl_handleRemovedAccessory___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  id *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HMDAccessoryNotificationKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(*v2, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmf_numberForKey:", CFSTR("HMDNotificationSourceKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(v8, "unsignedIntegerValue");
    if (v6)
    {
      if (v9 == 1)
      {
        v10 = (void *)MEMORY[0x1D17BA0A0]();
        v11 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v36 = v13;
          v37 = 2112;
          v38 = v6;
          _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory was removed: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v10);
        -[HMDAssistantAccessControl _appleMediaAccessories](*(char **)(a1 + 40));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v14, "mutableCopy");

        -[HMDAssistantAccessControl _hapAccessoryIdentifiers](*(char **)(a1 + 40));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v16, "mutableCopy");

        if ((objc_msgSend(v15, "containsObject:", v6) & 1) != 0
          || (objc_msgSend(v6, "uuid"),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              v18 = objc_msgSend(v31, "containsObject:", v17),
              v17,
              v18))
        {
          if (objc_msgSend(v15, "containsObject:", v6))
          {
            objc_msgSend(v15, "removeObject:", v6);
          }
          else
          {
            objc_msgSend(v6, "uuid");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v31, "containsObject:", v19);

            if (v20)
            {
              objc_msgSend(v6, "uuid");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "removeObject:", v21);

            }
          }
          v23 = *(void **)(a1 + 40);
          v22 = (id *)(a1 + 40);
          objc_msgSend(v23, "removeAccessory:", v6);
          objc_msgSend(*v22, "transactionWithObjectChangeType:", 2);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAssistantAccessControl _populateModel:withAccessoryIdsFromAccessories:]((uint64_t)*v22, v24, v15);
          objc_msgSend(v31, "na_map:", &__block_literal_global_172073);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setSiriEndpointAccessoryModelUUIDs:", v25);

          objc_msgSend(*v22, "user");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "home");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "backingStore");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "transaction:options:", 0, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v30, "add:withMessage:", v24, 0);
          objc_initWeak((id *)buf, *v22);
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __52__HMDAssistantAccessControl_handleRemovedAccessory___block_invoke_2;
          v32[3] = &unk_1E89BF250;
          objc_copyWeak(&v34, (id *)buf);
          v33 = v6;
          objc_msgSend(v30, "run:", v32);

          objc_destroyWeak(&v34);
          objc_destroyWeak((id *)buf);

        }
      }
    }
  }

}

void __52__HMDAssistantAccessControl_handleRemovedAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v13 = 138543874;
      v14 = v9;
      v15 = 2112;
      v16 = v3;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Error: %@ running transaction to remove accessory: %@ from ACL adding it back.", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v6, "addAccessory:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 32);
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Removed accessory %@ from assistant access control list.", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v6, "notifyClientOfUpdateWithMessage:", 0);
  }

}

uint64_t __52__HMDAssistantAccessControl_handleRemovedAccessory___block_invoke_25(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

+ (BOOL)isAccessorySupported:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "siriEndpointProfile");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;
  }
  else
  {
    v9 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v7 = v10;

    if (v7
      && (objc_msgSend(v7, "capabilities"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, v11))
    {
      objc_msgSend(v7, "capabilities");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v12, "supportsAssistantAccessControl");

    }
    else
    {
      v8 = objc_msgSend(v7, "isHomePod");
    }
  }

  return v8;
}

+ (HMDAssistantAccessControl)accessControlWithMessage:(id)a3 user:(id)a4 currentAccessories:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  char isKindOfClass;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  id v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  NSObject *v62;
  void *v63;
  id *v64;
  uint64_t v65;
  void *v66;
  id v67;
  NSObject *v68;
  void *v69;
  id v71;
  id *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id obj;
  void *v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  void *v85;
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  id v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v79 = a5;
  objc_msgSend(v10, "dataForKey:", *MEMORY[0x1E0CB9EC8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB3710];
    v14 = objc_opt_class();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "deserializeObjectWithData:allowedClass:frameworkClasses:", v12, v14, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v10, "arrayForKey:", *MEMORY[0x1E0CB9EB8]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v73 = v11;
        v72 = a6;
        objc_msgSend(v11, "home");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = 0u;
        v81 = 0u;
        v82 = 0u;
        v83 = 0u;
        obj = v19;
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v81;
          v71 = v10;
          v74 = v19;
LABEL_6:
          v23 = 0;
          while (1)
          {
            if (*(_QWORD *)v81 != v22)
              objc_enumerationMutation(obj);
            v24 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v23);
            v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v24);
            if (!v25)
            {
              v55 = (void *)MEMORY[0x1D17BA0A0]();
              v56 = a1;
              HMFGetOSLogHandle();
              v57 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v87 = v58;
                v88 = 2112;
                v89 = v24;
                _os_log_impl(&dword_1CD062000, v57, OS_LOG_TYPE_INFO, "%{public}@Invalid accessory identifier: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v55);
              v11 = v73;
              v19 = v74;
              v39 = v75;
              v38 = v76;
              v59 = obj;
              if (v72)
              {
                objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
                *v72 = (id)objc_claimAutoreleasedReturnValue();
              }
              goto LABEL_54;
            }
            v26 = (void *)v25;
            objc_msgSend(v78, "accessoryWithUUID:", v25);
            v27 = objc_claimAutoreleasedReturnValue();
            if (!v27)
              break;
            v28 = (void *)v27;
            if ((objc_msgSend(v79, "containsObject:", v26) & 1) == 0
              && (objc_msgSend(a1, "isAccessorySupported:", v28) & 1) == 0)
            {
              v66 = (void *)MEMORY[0x1D17BA0A0]();
              v67 = a1;
              HMFGetOSLogHandle();
              v68 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v87 = v69;
                v88 = 2112;
                v89 = v28;
                _os_log_impl(&dword_1CD062000, v68, OS_LOG_TYPE_INFO, "%{public}@Accessory not supported: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v66);
              v64 = v72;
              v19 = v74;
              if (v72)
              {
                v65 = 9002;
LABEL_51:
                v11 = v73;
                v39 = v75;
                v38 = v76;
                v59 = obj;
                objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", v65);
                *v64 = (id)objc_claimAutoreleasedReturnValue();
LABEL_53:

LABEL_54:
                v40 = 0;
                v10 = v71;
                goto LABEL_55;
              }
LABEL_52:
              v11 = v73;
              v39 = v75;
              v38 = v76;
              v59 = obj;
              goto LABEL_53;
            }
            v29 = v28;
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();
            if ((isKindOfClass & 1) != 0)
              v31 = v29;
            else
              v31 = 0;
            v32 = v31;

            if ((isKindOfClass & 1) != 0)
            {
              objc_msgSend(v29, "uuid");
              v33 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v75, "addObject:", v33);
              v32 = (id)v33;
            }
            else
            {
              objc_msgSend(v76, "addObject:", v29);
            }

            if (v21 == ++v23)
            {
              v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
              v10 = v71;
              v19 = v74;
              if (v21)
                goto LABEL_6;
              goto LABEL_21;
            }
          }
          v60 = (void *)MEMORY[0x1D17BA0A0]();
          v61 = a1;
          HMFGetOSLogHandle();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v87 = v63;
            v88 = 2112;
            v89 = v24;
            _os_log_impl(&dword_1CD062000, v62, OS_LOG_TYPE_INFO, "%{public}@Failed to lookup accessory with identifier: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v60);
          v28 = 0;
          v64 = v72;
          v19 = v74;
          if (v72)
          {
            v65 = 9003;
            goto LABEL_51;
          }
          goto LABEL_52;
        }
LABEL_21:

        v34 = (void *)MEMORY[0x1D17BA0A0]();
        v35 = a1;
        HMFGetOSLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v87 = v37;
          v88 = 2112;
          v89 = obj;
          _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_INFO, "%{public}@Generated access control from message with accessories %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v34);
        v38 = v76;
        objc_msgSend(v18, "setAppleMediaAccessories:", v76);
        v39 = v75;
        objc_msgSend(v18, "setHapAccessoryIdentifiers:", v75);
        v11 = v73;
        objc_msgSend(v18, "setUser:", v73);
        v40 = v18;
LABEL_55:

      }
      else
      {
        v50 = (void *)MEMORY[0x1D17BA0A0]();
        v51 = a1;
        HMFGetOSLogHandle();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "messagePayload");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v87 = v53;
          v88 = 2112;
          v89 = v54;
          _os_log_impl(&dword_1CD062000, v52, OS_LOG_TYPE_INFO, "%{public}@Missing access control accessories in message payload: %@", buf, 0x16u);

          v19 = 0;
        }

        objc_autoreleasePoolPop(v50);
        if (a6)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
          v40 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v40 = 0;
        }
      }

    }
    else
    {
      v46 = (void *)MEMORY[0x1D17BA0A0]();
      v47 = a1;
      HMFGetOSLogHandle();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v87 = v49;
        _os_log_impl(&dword_1CD062000, v48, OS_LOG_TYPE_INFO, "%{public}@Invalid access control in message payload", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v46);
      if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 43);
        v40 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v40 = 0;
      }
    }

  }
  else
  {
    v41 = (void *)MEMORY[0x1D17BA0A0]();
    v42 = a1;
    HMFGetOSLogHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "messagePayload");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v87 = v44;
      v88 = 2112;
      v89 = v45;
      _os_log_impl(&dword_1CD062000, v43, OS_LOG_TYPE_INFO, "%{public}@Missing serialized access control in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v41);
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v40 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v40 = 0;
    }
  }

  return (HMDAssistantAccessControl *)v40;
}

+ (id)modelIDNamespace
{
  if (modelIDNamespace_onceToken_172104 != -1)
    dispatch_once(&modelIDNamespace_onceToken_172104, &__block_literal_global_41_172105);
  return (id)modelIDNamespace_modelIDNamespace_172106;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t54_172099 != -1)
    dispatch_once(&logCategory__hmf_once_t54_172099, &__block_literal_global_45_172100);
  return (id)logCategory__hmf_once_v55_172101;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __40__HMDAssistantAccessControl_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v55_172101;
  logCategory__hmf_once_v55_172101 = v0;

}

void __45__HMDAssistantAccessControl_modelIDNamespace__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("5FF02DEF-EFB2-45C7-BF0C-042B4F336FD8"));
  v1 = (void *)modelIDNamespace_modelIDNamespace_172106;
  modelIDNamespace_modelIDNamespace_172106 = v0;

}

@end

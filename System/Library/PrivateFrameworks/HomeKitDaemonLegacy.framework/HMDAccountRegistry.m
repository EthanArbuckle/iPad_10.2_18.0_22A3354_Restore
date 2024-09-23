@implementation HMDAccountRegistry

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  void *v5;
  char v6;
  unsigned __int8 v7;
  objc_super v9;

  v4 = a3;
  NSStringFromSelector(sel_started);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___HMDAccountRegistry;
    v7 = objc_msgSendSuper2(&v9, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v7;
}

+ (HMDAccountRegistry)sharedRegistry
{
  if (sharedRegistry__hmf_once_t0 != -1)
    dispatch_once(&sharedRegistry__hmf_once_t0, &__block_literal_global_40772);
  return (HMDAccountRegistry *)(id)sharedRegistry__hmf_once_v1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t26_40767 != -1)
    dispatch_once(&logCategory__hmf_once_t26_40767, &__block_literal_global_30_40768);
  return (id)logCategory__hmf_once_v27_40769;
}

void __33__HMDAccountRegistry_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v27_40769;
  logCategory__hmf_once_v27_40769 = v0;

}

void __36__HMDAccountRegistry_sharedRegistry__block_invoke()
{
  HMDAccountRegistry *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = [HMDAccountRegistry alloc];
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteAccountManager sharedManager](HMDRemoteAccountManager, "sharedManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[HMDAccountRegistry initWithAppleAccountManager:remoteAccountManager:](v0, "initWithAppleAccountManager:remoteAccountManager:", v4, v1);
  v3 = (void *)sharedRegistry__hmf_once_v1;
  sharedRegistry__hmf_once_v1 = v2;

}

- (HMDAccountRegistry)initWithAppleAccountManager:(id)a3 remoteAccountManager:(id)a4
{
  id v6;
  id v7;
  HMDAccountRegistry *v8;
  HMDAccountRegistry *v9;
  id v10;
  const char *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *clientQueue;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HMDAccountRegistry;
  v8 = -[HMDAccountRegistry init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    HMDispatchQueueNameString();
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (const char *)objc_msgSend(v10, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create(v11, v12);
    clientQueue = v9->_clientQueue;
    v9->_clientQueue = (OS_dispatch_queue *)v13;

    objc_storeWeak((id *)&v9->_appleAccountManager, v6);
    objc_storeWeak((id *)&v9->_remoteAccountManager, v7);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v9, sel___handleAppleAccountUpdate_, CFSTR("HMDAppleAccountManagerAccountUpdatedNotification"), v6);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v9, sel___handleAddedRemoteAccount_, CFSTR("HMDRemoteAccountManagerAddedAccountNotification"), v7);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v9, sel___handleRemovedRemoteAccount_, CFSTR("HMDRemoteAccountManagerRemovedAccountNotification"), v7);

  }
  return v9;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccountRegistry accounts](self, "accounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("AC"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)started
{
  HMDAccountRegistry *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_started;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)start
{
  void *v3;
  HMDAccountRegistry *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  HMDAccountRegistry *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDAccountRegistry appleAccountManager](v4, "appleAccountManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    __registerForAccountUpdates(v4, v8);
    -[HMDAccountRegistry clientQueue](v4, "clientQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __27__HMDAccountRegistry_start__block_invoke;
    v16 = &unk_1E89C2328;
    v17 = v4;
    v18 = v8;
    dispatch_async(v9, &v13);

  }
  objc_msgSend(v7, "start", v13, v14, v15, v16, v17);
  -[HMDAccountRegistry remoteAccountManager](v4, "remoteAccountManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "start");

  NSStringFromSelector(sel_started);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccountRegistry willChangeValueForKey:](v4, "willChangeValueForKey:", v11);

  os_unfair_lock_lock_with_options();
  v4->_started = 1;
  os_unfair_lock_unlock(&v4->_lock);
  NSStringFromSelector(sel_started);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccountRegistry didChangeValueForKey:](v4, "didChangeValueForKey:", v12);

}

- (void)stop
{
  void *v3;
  HMDAccountRegistry *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  __registerForAccountUpdates(v4, 0);
  NSStringFromSelector(sel_started);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccountRegistry willChangeValueForKey:](v4, "willChangeValueForKey:", v7);

  os_unfair_lock_lock_with_options();
  v4->_started = 0;
  os_unfair_lock_unlock(&v4->_lock);
  NSStringFromSelector(sel_started);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccountRegistry didChangeValueForKey:](v4, "didChangeValueForKey:", v8);

}

- (void)reset
{
  void *v3;
  HMDAccountRegistry *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Resetting", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDAccountRegistry remoteAccountManager](v4, "remoteAccountManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reset");

}

- (NSArray)accounts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccountRegistry appleAccountManager](self, "appleAccountManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "addObject:", v5);
  -[HMDAccountRegistry remoteAccountManager](self, "remoteAccountManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  v8 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v8;
}

- (BOOL)accountExistsForHandle:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  __accountForHandle(self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)accountForHandle:(id)a3
{
  return -[HMDAccountRegistry accountForHandle:exists:](self, "accountForHandle:exists:", a3, 0);
}

- (id)accountForHandle:(id)a3 exists:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAccount *v10;
  HMDAccount *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a4)
    *a4 = 0;
  if (v6)
  {
    __accountForHandle(self, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if (a4)
        *a4 = 1;
      v10 = v8;
    }
    else
    {
      v11 = [HMDAccount alloc];
      +[HMDAccountIdentifier accountIdentifierForAccountHandle:](HMDAccountIdentifier, "accountIdentifierForAccountHandle:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[HMDAccount initWithIdentifier:handles:devices:](v11, "initWithIdentifier:handles:devices:", v12, v13, MEMORY[0x1E0C9AA60]);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)deviceForIdentifier:(id)a3
{
  id v4;
  HMDAccountRegistry *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self;
    v6 = -[HMDAccountRegistry countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "deviceForIdentifier:", v4, (_QWORD)v13);
          v10 = objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v11 = (void *)v10;
            goto LABEL_12;
          }
        }
        v7 = -[HMDAccountRegistry countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }
    v11 = 0;
LABEL_12:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)deviceForAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDDevice *v9;
  HMDDevice *v10;
  void *v11;
  void *v12;
  HMDDevice *v13;
  HMDDevice *v14;
  void *v15;
  HMDAccountRegistry *v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "idsIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDDeviceHandle deviceHandleForDeviceIdentifier:](HMDDeviceHandle, "deviceHandleForDeviceIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    __deviceForHandle(self, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      v10 = v9;
    }
    else
    {
      objc_msgSend(v5, "idsDestination");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      __deviceForHandle(self, v12);
      v13 = (HMDDevice *)objc_claimAutoreleasedReturnValue();
      v9 = v13;
      if (v13)
      {
        v14 = v13;
      }
      else
      {
        v15 = (void *)MEMORY[0x1D17BA0A0]();
        v16 = self;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138543618;
          v21 = v18;
          v22 = 2112;
          v23 = v5;
          _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Synthesizing HMDDevice for %@", (uint8_t *)&v20, 0x16u);

        }
        objc_autoreleasePoolPop(v15);
        v14 = -[HMDDevice initWithDeviceAddress:]([HMDDevice alloc], "initWithDeviceAddress:", v5);
      }
      v10 = v14;

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)deviceForHandle:(id)a3
{
  return -[HMDAccountRegistry deviceForHandle:exists:](self, "deviceForHandle:exists:", a3, 0);
}

- (id)deviceForHandle:(id)a3 exists:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HMDDevice *v10;
  HMDDevice *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a4)
    *a4 = 0;
  if (v6)
  {
    __deviceForHandle(self, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if (a4)
        *a4 = 1;
      v10 = v8;
    }
    else
    {
      v11 = [HMDDevice alloc];
      objc_msgSend(v7, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[HMDDevice initWithIdentifier:handles:name:productInfo:version:capabilities:](v11, "initWithIdentifier:handles:name:productInfo:version:capabilities:", v12, v13, 0, 0, 0, 0);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)deviceExistsForDevice:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  __deviceForDevice(self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)deviceForDevice:(id)a3
{
  return -[HMDAccountRegistry deviceForDevice:exists:](self, "deviceForDevice:exists:", a3, 0);
}

- (id)deviceForDevice:(id)a3 exists:(BOOL *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = v6;
  if (a4)
    *a4 = 0;
  if (v6)
  {
    __deviceForDevice(self, v6);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (void *)v8;
    else
      v10 = v7;
    if (v8 && a4)
    {
      *a4 = 1;
      v10 = (void *)v8;
    }
    v11 = v10;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)deviceForPushToken:(id)a3
{
  id v4;
  HMDAccountRegistry *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  id v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  HMDAccountRegistry *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = self;
  v6 = -[HMDAccountRegistry countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v36;
    v26 = v5;
    v23 = *(_QWORD *)v36;
    do
    {
      v8 = 0;
      v24 = v6;
      do
      {
        if (*(_QWORD *)v36 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v8);
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v32;
          v25 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v32 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
              v27 = 0u;
              v28 = 0u;
              v29 = 0u;
              v30 = 0u;
              objc_msgSend(v15, "globalHandles", v23);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
              if (v17)
              {
                v18 = v17;
                v19 = *(_QWORD *)v28;
                while (2)
                {
                  for (j = 0; j != v18; ++j)
                  {
                    if (*(_QWORD *)v28 != v19)
                      objc_enumerationMutation(v16);
                    if ((objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "matchesPushToken:", v4) & 1) != 0)
                    {
                      v21 = v15;

                      v5 = v26;
                      goto LABEL_26;
                    }
                  }
                  v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
                  if (v18)
                    continue;
                  break;
                }
              }

              v13 = v25;
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
            v5 = v26;
            v7 = v23;
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v24);
      v6 = -[HMDAccountRegistry countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      v21 = 0;
    }
    while (v6);
  }
  else
  {
    v21 = 0;
  }
LABEL_26:

  return v21;
}

- (id)deviceForIDSIdentifier:(id)a3
{
  id v4;
  HMDAccountRegistry *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  HMDAccountRegistry *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = self;
  v6 = -[HMDAccountRegistry countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    v24 = v5;
    v22 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v10, "devices");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v26;
          v23 = v7;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v26 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
              objc_msgSend(v16, "idsIdentifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v17, "isEqual:", v4))
              {

LABEL_20:
                v20 = v16;

                v5 = v24;
                goto LABEL_21;
              }
              objc_msgSend(v16, "sharedUserIDSIdentifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "isEqual:", v4);

              if ((v19 & 1) != 0)
                goto LABEL_20;
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            v7 = v23;
            v5 = v24;
            v8 = v22;
            if (v13)
              continue;
            break;
          }
        }

      }
      v7 = -[HMDAccountRegistry countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      v20 = 0;
    }
    while (v7);
  }
  else
  {
    v20 = 0;
  }
LABEL_21:

  return v20;
}

- (void)__handleAppleAccountUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDAccountRegistry *v9;

  v4 = a3;
  -[HMDAccountRegistry clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__HMDAccountRegistry___handleAppleAccountUpdate___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)__handleAppleAccountHandlesUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDAccountRegistry *v9;

  v4 = a3;
  -[HMDAccountRegistry clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__HMDAccountRegistry___handleAppleAccountHandlesUpdated___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)__handleAppleAccountDeviceAdded:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDAccountRegistry *v9;

  v4 = a3;
  -[HMDAccountRegistry clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__HMDAccountRegistry___handleAppleAccountDeviceAdded___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)__handleAddedRemoteAccount:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDAccountRegistry *v9;

  v4 = a3;
  -[HMDAccountRegistry clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__HMDAccountRegistry___handleAddedRemoteAccount___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)__handleRemovedRemoteAccount:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDAccountRegistry *v9;

  v4 = a3;
  -[HMDAccountRegistry clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__HMDAccountRegistry___handleRemovedRemoteAccount___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_resolveAccountForHandle:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  HMDAccountRegistry *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  if (v6)
  {
    -[HMDAccountRegistry appleAccountManager](self, "appleAccountManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "handles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v6);

    if (v11)
    {
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "shortDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543618;
        v18 = v15;
        v19 = 2112;
        v20 = v16;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Not resolving handle, %@, on our account", (uint8_t *)&v17, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      if (v7)
        v7[2](v7, v9, 0);
    }
    else
    {

      -[HMDAccountRegistry remoteAccountManager](self, "remoteAccountManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_resolveAccountForHandle:completionHandler:", v6, v7);
    }

  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  unint64_t v9;

  -[HMDAccountRegistry accounts](self, "accounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return v9;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (HMDAppleAccountManager)appleAccountManager
{
  return (HMDAppleAccountManager *)objc_loadWeakRetained((id *)&self->_appleAccountManager);
}

- (HMDRemoteAccountManager)remoteAccountManager
{
  return (HMDRemoteAccountManager *)objc_loadWeakRetained((id *)&self->_remoteAccountManager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_remoteAccountManager);
  objc_destroyWeak((id *)&self->_appleAccountManager);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

void __51__HMDAccountRegistry___handleRemovedRemoteAccount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HMDAccountNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v8 = v4;

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "appleAccountManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isRelatedToAccount:", v6);

    if ((v7 & 1) == 0)
      __notifyDelegateAccountRemoved(*(void **)(a1 + 40), v8);
  }

}

void __49__HMDAccountRegistry___handleAddedRemoteAccount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HMDAccountNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v8 = v4;

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "appleAccountManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isRelatedToAccount:", v6);

    if ((v7 & 1) == 0)
      __notifyDelegateAccountAdded(*(void **)(a1 + 40), v8);
  }

}

void __54__HMDAccountRegistry___handleAppleAccountDeviceAdded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(*(id *)(a1 + 40), "appleAccountManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToAccount:", v6);

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HMDDeviceNotificationKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
    {
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "shortDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v15;
        v23 = 2112;
        v24 = v16;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Received notification that device was added to our account: %@", (uint8_t *)&v21, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      v17 = *(void **)(a1 + 40);
      v18 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v11, "handles");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setWithArray:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      __cleanupRemoteDevicesWithHandles(v17, v20);

    }
  }

}

void __57__HMDAccountRegistry___handleAppleAccountHandlesUpdated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v7 = v3;

  objc_msgSend(*(id *)(a1 + 40), "appleAccountManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "isEqualToAccount:", v5);

  if (v6)
    __cleanupRemoteAccountsRelatedToAccount(*(void **)(a1 + 40), v7);

}

void __49__HMDAccountRegistry___handleAppleAccountUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HMDAccountNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HMDPreviousAccountNotificationKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v5)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Received notification current account added", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    __registerForAccountUpdates(*(void **)(a1 + 40), v5);
    __cleanupRemoteAccountsRelatedToAccount(*(void **)(a1 + 40), v5);
    objc_msgSend(v5, "devices");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 2 * objc_msgSend(v14, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = v14;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v20), "handles", (_QWORD)v26);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObjectsFromArray:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v18);
    }

    __cleanupRemoteDevicesWithHandles(*(void **)(a1 + 40), v15);
    __notifyDelegateAccountAdded(*(void **)(a1 + 40), v5);
  }
  else if (v9)
  {
    v22 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v25;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Received notification current account removed", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    __registerForAccountUpdates(*(void **)(a1 + 40), 0);
    __notifyDelegateAccountRemoved(*(void **)(a1 + 40), v9);
  }

}

void __27__HMDAccountRegistry_start__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  __cleanupRemoteAccountsRelatedToAccount(*(void **)(a1 + 32), *(void **)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "devices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 2 * objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "handles", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  __cleanupRemoteDevicesWithHandles(*(void **)(a1 + 32), v3);
}

@end

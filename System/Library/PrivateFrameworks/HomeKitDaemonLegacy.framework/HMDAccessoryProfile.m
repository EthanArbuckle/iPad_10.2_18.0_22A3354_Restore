@implementation HMDAccessoryProfile

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (BOOL)isEqual:(id)a3
{
  HMDAccessoryProfile *v4;
  HMDAccessoryProfile *v5;
  HMDAccessoryProfile *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMDAccessoryProfile *)a3;
  if (self == v4)
  {
    v9 = 1;
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
      -[HMDAccessoryProfile uniqueIdentifier](self, "uniqueIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryProfile uniqueIdentifier](v6, "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDAccessoryProfile uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (id)runtimeState
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (NSString)contextID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDAccessoryProfile accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryProfile uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSUUID)contextSPIUniqueIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[HMDProcessInfo privateClientIdentifierSalt](HMDProcessInfo, "privateClientIdentifierSalt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3A28];
  -[HMDAccessoryProfile uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hm_deriveUUIDFromBaseUUID:identifierSalt:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v6;
}

- (HMDAccessoryProfile)initWithAccessory:(id)a3 uniqueIdentifier:(id)a4 services:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  HMDAccessoryProfile *v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  HMDispatchQueueNameString();
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (const char *)objc_msgSend(v11, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = dispatch_queue_create(v12, v13);
  v15 = -[HMDAccessoryProfile initWithAccessory:uniqueIdentifier:services:workQueue:](self, "initWithAccessory:uniqueIdentifier:services:workQueue:", v10, v9, v8, v14);

  return v15;
}

- (HMDAccessoryProfile)initWithAccessory:(id)a3 uniqueIdentifier:(id)a4 services:(id)a5 workQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDAccessoryProfile *v14;
  uint64_t v15;
  NSUUID *uniqueIdentifier;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSString *logIdentifier;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)HMDAccessoryProfile;
  v14 = -[HMDAccessoryProfile init](&v26, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v11, "copy");
    uniqueIdentifier = v14->_uniqueIdentifier;
    v14->_uniqueIdentifier = (NSUUID *)v15;

    objc_storeStrong((id *)&v14->_workQueue, a6);
    objc_storeWeak((id *)&v14->_accessory, v10);
    if (v12)
    {
      v17 = (void *)objc_msgSend(v12, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;
    objc_storeStrong((id *)&v14->_services, v17);

    objc_msgSend(v10, "home");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v19, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("%@/%@/%@"), v21, v22, v11);
    v23 = objc_claimAutoreleasedReturnValue();
    logIdentifier = v14->_logIdentifier;
    v14->_logIdentifier = (NSString *)v23;

  }
  return v14;
}

- (id)dumpState
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D80];
  -[HMDAccessoryProfile description](self, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithObject:forKey:", v3, *MEMORY[0x1E0D27F80]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMDAccessoryProfile uniqueIdentifier](self, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("identifier: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)configureWithMessageDispatcher:(id)a3 configurationTracker:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  HMDAccessoryProfile *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  NSObject *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  HMDAccessoryProfile *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v11;
    v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Configuring profile: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  if (v6)
  {
    if (v7)
      dispatch_group_enter(v7);
    -[HMDAccessoryProfile workQueue](v9, "workQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__HMDAccessoryProfile_configureWithMessageDispatcher_configurationTracker___block_invoke;
    block[3] = &unk_1E89C20C8;
    block[4] = v9;
    v14 = v6;
    v15 = v7;
    dispatch_async(v12, block);

  }
}

- (id)findServiceWithType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDAccessoryProfile services](self, "services", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "serviceType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (HMDAccessoryProfile)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDAccessoryProfile *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.accessoryProfileUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithUUIDString:", v7);

  v9 = (void *)MEMORY[0x1E0C99E60];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("services"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[HMDAccessoryProfile initWithAccessory:uniqueIdentifier:services:](self, "initWithAccessory:uniqueIdentifier:services:", v5, v8, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HMDAccessoryProfile uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HM.accessoryProfileUUID"));

  -[HMDAccessoryProfile accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeConditionalObject:forKey:", v7, CFSTR("accessory"));

  -[HMDAccessoryProfile services](self, "services");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("services"));

}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (HMDAccessory)accessory
{
  return (HMDAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (NSArray)services
{
  return self->_services;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
}

void __75__HMDAccessoryProfile_configureWithMessageDispatcher_configurationTracker___block_invoke(uint64_t a1)
{
  NSObject *v2;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "registerForMessages");
  objc_msgSend(*(id *)(a1 + 32), "handleInitialState");
  v2 = *(NSObject **)(a1 + 48);
  if (v2)
    dispatch_group_leave(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_114395 != -1)
    dispatch_once(&logCategory__hmf_once_t1_114395, &__block_literal_global_114396);
  return (id)logCategory__hmf_once_v2_114397;
}

+ (BOOL)hasMessageReceiverChildren
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __34__HMDAccessoryProfile_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_114397;
  logCategory__hmf_once_v2_114397 = v0;

}

@end
